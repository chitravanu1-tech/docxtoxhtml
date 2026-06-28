#!/usr/bin/env python3
"""
DOCX List Extractor
-------------------
Extract list metadata from a Word .docx and write two XML files:
  1) list_extraction.xml - per-paragraph metadata suitable for XSLT
  2) list_runs.xml       - grouped consecutive list paragraphs (<listRun>) with per-level HTML mapping

Usage:
  python docx_list_extractor.py input.docx [-o OUTPUT_DIR]

Requires:
  lxml

Install deps:
  pip install lxml
"""

import argparse
import re
from pathlib import Path
from zipfile import ZipFile
from lxml import etree

NS = {
    "w": "http://schemas.openxmlformats.org/wordprocessingml/2006/main",
    "r": "http://schemas.openxmlformats.org/officeDocument/2006/relationships",
}

def number_to_roman(num: int, upper: bool = False) -> str:
    vals = [
        (1000, "M"), (900, "CM"), (500, "D"), (400, "CD"),
        (100, "C"), (90, "XC"), (50, "L"), (40, "XL"),
        (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")
    ]
    res = ""
    n = int(num)
    for v, sym in vals:
        while n >= v:
            res += sym
            n -= v
    return res if upper else res.lower()

def number_to_alpha(num: int, upper: bool = False) -> str:
    n = int(num)
    s = ""
    while n > 0:
        n -= 1
        s = chr((n % 26) + ord('a')) + s
        n //= 26
    return s.upper() if upper else s

def format_counter(num: int, numFmt: str) -> str:
    if num is None:
        return ""
    if numFmt in ("decimal", "decimalZero", "decimalEnclosedCircle", "decimalEnclosedFullstop"):
        return str(num)
    if numFmt in ("lowerLetter", "alphaLc"):
        return number_to_alpha(num, upper=False)
    if numFmt in ("upperLetter", "alphaUc"):
        return number_to_alpha(num, upper=True)
    if numFmt in ("lowerRoman",):
        return number_to_roman(num, upper=False)
    if numFmt in ("upperRoman",):
        return number_to_roman(num, upper=True)
    return str(num)

def read_xml_from_docx(zf: ZipFile, path: str):
    try:
        with zf.open(path) as f:
            return etree.parse(f)
    except KeyError:
        return None

def get_text_from_p(p) -> str:
    return "".join([(t.text or "") for t in p.xpath(".//w:t", namespaces=NS)]).strip()

def collect_numbering(numbering_xml):
    abstractNums = {}  # abstractNumId -> {ilvl: {...}}
    nums = {}          # numId -> {"abstractNumId": X, "overrides": {ilvl: startOverride}}
    if numbering_xml is None:
        return abstractNums, nums

    for an in numbering_xml.xpath("//w:abstractNum", namespaces=NS):
        an_id = an.get(f"{{{NS['w']}}}abstractNumId")
        levels = {}
        for lvl in an.xpath("./w:lvl", namespaces=NS):
            ilvl = int(lvl.get(f"{{{NS['w']}}}ilvl", "0"))
            numFmt_el = lvl.find("w:numFmt", namespaces=NS)
            numFmt = numFmt_el.get(f"{{{NS['w']}}}val") if numFmt_el is not None else "decimal"
            start_el = lvl.find("w:start", namespaces=NS)
            start = int(start_el.get(f"{{{NS['w']}}}val")) if start_el is not None else 1
            lvlText_el = lvl.find("w:lvlText", namespaces=NS)
            lvlText = lvlText_el.get(f"{{{NS['w']}}}val") if lvlText_el is not None else "%{}.".format(ilvl+1)
            suff_el = lvl.find("w:suff", namespaces=NS)
            suff = suff_el.get(f"{{{NS['w']}}}val") if suff_el is not None else "tab"
            levels[ilvl] = {
                "numFmt": numFmt,
                "start": start,
                "lvlText": lvlText,
                "suff": suff
            }
        abstractNums[an_id] = levels

    for n in numbering_xml.xpath("//w:num", namespaces=NS):
        num_id = n.get(f"{{{NS['w']}}}numId")
        abstract_ref = n.find("w:abstractNumId", namespaces=NS)
        abstractNumId = abstract_ref.get(f"{{{NS['w']}}}val") if abstract_ref is not None else None
        overrides = {}
        for ov in n.xpath("./w:lvlOverride", namespaces=NS):
            ilvl = int(ov.get(f"{{{NS['w']}}}ilvl", "0"))
            st = ov.find("w:startOverride", namespaces=NS)
            if st is not None:
                overrides[ilvl] = int(st.get(f"{{{NS['w']}}}val", "1"))
        nums[num_id] = {"abstractNumId": abstractNumId, "overrides": overrides}
    return abstractNums, nums

def compute_display_label(counters_for_numid, ilvl, abstract_levels):
    lvl_info = abstract_levels.get(ilvl, {"lvlText": "%{}.".format(ilvl+1), "numFmt": "decimal"})
    lvlText = lvl_info.get("lvlText", "%{}.".format(ilvl+1))
    def repl(m):
        idx = int(m.group(1)) - 1  # %1 is level 0
        # Take counter if present; otherwise fall back to that level's start (or 1)
        val = counters_for_numid[idx] if idx < len(counters_for_numid) else None
        if val is None:
            val = abstract_levels.get(idx, {}).get("start", 1)
        fmt = abstract_levels.get(idx, {}).get("numFmt", "decimal")
        return format_counter(val, fmt)

    label = re.sub(r"%([1-9])", repl, lvlText)
    return label

def extract_lists(docx_path: Path, out_dir: Path):
    out_dir.mkdir(parents=True, exist_ok=True)
    with ZipFile(docx_path, "r") as z:
        document_xml = read_xml_from_docx(z, "word/document.xml")
        numbering_xml = read_xml_from_docx(z, "word/numbering.xml")

        abstractNums, nums = collect_numbering(numbering_xml)

        root_out = etree.Element("ListExtraction", file=str(docx_path.name))

        # Maintain counters per numId: list of 9 levels
        counters = {}

        p_elems = document_xml.xpath("//w:body/w:p", namespaces=NS)
        for idx, p in enumerate(p_elems):
            p_node = etree.SubElement(root_out, "p")
            p_node.set("index", str(idx))

            # Bookmarks (w:bookmarkStart within paragraph)
            bms = []
            for b in p.xpath(".//w:bookmarkStart", namespaces=NS):
                name = b.get(f"{{{NS['w']}}}name")
                if name and name != "_GoBack":
                    bms.append(name)
            if bms:
                p_node.set("bookmark", bms[0])
                if len(bms) > 1:
                    bms_el = etree.SubElement(p_node, "bookmarks")
                    for n in bms:
                        be = etree.SubElement(bms_el, "bookmark")
                        be.text = n
            else:
                p_node.set("bookmark", f"auto_para_{idx:05d}")

            # Text
            txt_el = etree.SubElement(p_node, "text")
            txt_el.text = get_text_from_p(p)

            # List detection
            numPr = p.find("w:pPr/w:numPr", namespaces=NS)
            if numPr is None:
                p_node.set("isList", "false")
                continue

            p_node.set("isList", "true")

            numId_el = numPr.find("w:numId", namespaces=NS)
            ilvl_el = numPr.find("w:ilvl", namespaces=NS)

            if numId_el is None or ilvl_el is None:
                p_node.set("numId", "")
                p_node.set("ilvl", "")
                continue

            numId = numId_el.get(f"{{{NS['w']}}}val")
            ilvl = int(ilvl_el.get(f"{{{NS['w']}}}val", "0"))
            p_node.set("numId", numId)
            p_node.set("ilvl", str(ilvl))
            p_node.set("level", str(ilvl + 1))

            num_info = nums.get(numId, {})
            abstractNumId = num_info.get("abstractNumId")
            p_node.set("abstractNumId", str(abstractNumId) if abstractNumId is not None else "")

            abstract_levels = abstractNums.get(abstractNumId, {})

            # Determine numFmt and type for this level
            lvl_info = abstract_levels.get(ilvl, {})
            numFmt = lvl_info.get("numFmt", "decimal")
            p_node.set("numFmt", numFmt)

            # Determine base start and overrides
            base_start = lvl_info.get("start", 1)
            override = num_info.get("overrides", {}).get(ilvl, None)
            effective_start = override if override is not None else base_start

            meta = etree.SubElement(p_node, "listMeta")
            etree.SubElement(meta, "baseStart").text = str(base_start)
            if override is not None:
                etree.SubElement(meta, "startOverride").text = str(override)
            etree.SubElement(meta, "effectiveStart").text = str(effective_start)

            # Initialize counters state for this numId if needed
            if numId not in counters:
                counters[numId] = [None] * 9

            # Reset deeper levels above current ilvl
            for level_idx in range(ilvl + 1, 9):
                counters[numId][level_idx] = None

            # Initialize or increment current level counter
            if counters[numId][ilvl] is None:
                counters[numId][ilvl] = effective_start
            else:
                counters[numId][ilvl] += 1

            # Record current counter
            etree.SubElement(meta, "valueAtLevel").text = str(counters[numId][ilvl])

            # Compute display label via lvlText and each level's own numFmt
            label = compute_display_label(counters[numId], ilvl, abstract_levels)
            etree.SubElement(meta, "lvlText").text = lvl_info.get("lvlText", "")
            etree.SubElement(meta, "displayLabel").text = label

            # Type hints for XHTML reconstruction
            listType = "bullet" if numFmt == "bullet" else "number"
            etree.SubElement(meta, "listType").text = listType

        out_xml = out_dir / "list_extraction.xml"
        out_xml.write_bytes(etree.tostring(root_out, encoding="utf-8", xml_declaration=True, pretty_print=True))
        return out_xml

def fmt_to_html_type(numFmt: str) -> str:
    # Map OOXML numFmt -> HTML <ol type="..."> values
    mapping = {
        "decimal": "1",
        "decimalZero": "1",
        "lowerLetter": "a",
        "alphaLc": "a",
        "upperLetter": "A",
        "alphaUc": "A",
        "lowerRoman": "i",
        "upperRoman": "I",
    }
    return mapping.get(numFmt, "1")

def build_list_runs(src_xml_path: Path, out_dir: Path) -> Path:
    tree = etree.parse(str(src_xml_path))
    root = tree.getroot()

    runs_el = etree.Element("listRuns", file=root.get("file", ""))

    current_run = None
    current_numId = None
    level_first_seen_value = {}

    for p in root.findall("./p"):
        isList = p.get("isList") == "true"
        if not isList:
            if current_run is not None:
                _finalize_levels(current_run, level_first_seen_value)
                current_run = None
                current_numId = None
                level_first_seen_value = {}
            continue

        numId = p.get("numId")
        ilvl = p.get("ilvl")
        level = p.get("level")
        numFmt = p.get("numFmt")
        meta = p.find("listMeta")
        effStart = meta.findtext("effectiveStart")
        valueAtLevel = meta.findtext("valueAtLevel")
        lvlText = meta.findtext("lvlText")
        displayLabel = meta.findtext("displayLabel")
        listType = meta.findtext("listType")

        if current_run is None or numId != current_numId:
            if current_run is not None:
                _finalize_levels(current_run, level_first_seen_value)
            current_run = etree.SubElement(runs_el, "listRun")
            current_run.set("numId", numId or "")
            current_run.set("startIndex", p.get("index"))
            current_numId = numId
            level_first_seen_value = {}

        if ilvl not in level_first_seen_value:
            level_first_seen_value[ilvl] = {
                "effectiveStart": int(effStart),
                "numFmt": numFmt,
                "lvlText": lvlText
            }

        item = etree.SubElement(current_run, "item")
        item.set("index", p.get("index"))
        item.set("bookmark", p.get("bookmark"))
        item.set("ilvl", ilvl)
        item.set("level", level)
        item.set("listType", listType)
        if numFmt != "bullet":
            item.set("type", fmt_to_html_type(numFmt))
            item.set("valueAtLevel", valueAtLevel)
            item.set("displayLabel", displayLabel)
        else:
            item.set("bullet", "true")
        t = etree.SubElement(item, "text")
        t.text = p.findtext("text")

    if current_run is not None:
        _finalize_levels(current_run, level_first_seen_value)

    out_xml = out_dir / "list_runs.xml"
    out_xml.write_bytes(etree.tostring(runs_el, encoding="utf-8", xml_declaration=True, pretty_print=True))
    return out_xml

def _finalize_levels(current_run, level_first_seen_value):
    levels_el = etree.SubElement(current_run, "levels")
    for ilvl_str, meta in sorted(level_first_seen_value.items(), key=lambda x: int(x[0])):
        level_el = etree.SubElement(levels_el, "level")
        level_el.set("ilvl", ilvl_str)
        level_el.set("htmlList", "ul" if meta["numFmt"] == "bullet" else "ol")
        if meta["numFmt"] != "bullet":
            level_el.set("type", fmt_to_html_type(meta["numFmt"]))
            level_el.set("start", str(meta["effectiveStart"]))
        level_el.set("numFmt", meta["numFmt"])
        level_el.set("lvlText", meta["lvlText"])

def main():
    ap = argparse.ArgumentParser(description="Extract list metadata from DOCX and build XMLs for XHTML reconstruction.")
    ap.add_argument("docx", type=Path, help="Input .docx file")
    ap.add_argument("-o", "--out", type=Path, default=Path("."), help="Output directory (default: current directory)")
    args = ap.parse_args()

    docx_path: Path = args.docx
    out_dir: Path = args.out

    if not docx_path.exists():
        raise SystemExit(f"Input file not found: {docx_path}")

    out_dir.mkdir(parents=True, exist_ok=True)

    print(f"[1/2] Extracting per-paragraph list metadata from {docx_path.name} ...")
    per_par_xml = extract_lists(docx_path, out_dir)
    print(f"     -> {per_par_xml}")

    print(f"[2/2] Grouping into list runs and mapping HTML types ...")
    runs_xml = build_list_runs(per_par_xml, out_dir)
    print(f"     -> {runs_xml}")

    print("Done.")

if __name__ == "__main__":
    main()
