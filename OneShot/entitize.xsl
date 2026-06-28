<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:h="http://www.w3.org/1999/xhtml"
  xmlns:f="urn:fun"
  exclude-result-prefixes="xs f h"
  version="2.0">

  <!-- Serialize as XHTML, ASCII bytes (non-ASCII as numeric entities), no XML declaration, no DOCTYPE -->
  <xsl:output method="xhtml"
              encoding="US-ASCII"
              omit-xml-declaration="yes"
              indent="no"/>

  <!-- Identity: copy everything; lower priority so specific rules win -->
  <xsl:template match="@*|node()" priority="-1">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <!-- Placeholder text for XML-illegal control chars -->
  <xsl:param name="placeholder-prefix" as="xs:string" select="'[CTRL U+'"/>
  <xsl:param name="placeholder-suffix" as="xs:string" select="']'"/>

  <!-- Integer -> uppercase hex -->
  <xsl:function name="f:hex" as="xs:string">
    <xsl:param name="n" as="xs:integer"/>
    <xsl:variable name="digits" select="'0123456789ABCDEF'"/>
    <xsl:sequence select="if ($n lt 16)
      then substring($digits, $n + 1, 1)
      else concat(f:hex($n idiv 16), substring($digits, $n mod 16 + 1, 1))"/>
  </xsl:function>

  <!-- Left-pad to 4 hex digits (no 'let'; use xsl:variable + conditional) -->
  <xsl:function name="f:pad4" as="xs:string">
    <xsl:param name="s" as="xs:string"/>
    <xsl:variable name="need" as="xs:integer" select="4 - string-length($s)"/>
    <xsl:sequence select="concat(substring('0000', 1, (if ($need gt 0) then $need else 0)), $s)"/>
  </xsl:function>

  <!-- XML 1.0 legal char check -->
  <xsl:function name="f:is-legal-xml10" as="xs:boolean">
    <xsl:param name="c" as="xs:integer"/>
    <xsl:sequence select="$c = (9, 10, 13)
      or ($c ge 32 and not($c = 127) and not($c ge 128 and $c le 159))"/>
  </xsl:function>

  <!-- Build placeholder like [CTRL U+0001] -->
  <xsl:function name="f:placeholder" as="xs:string">
    <xsl:param name="c" as="xs:integer"/>
    <xsl:sequence select="concat($placeholder-prefix, f:pad4(f:hex($c)), $placeholder-suffix)"/>
  </xsl:function>

  <!-- Sanitize a string: keep legal chars; replace illegal controls with placeholders -->
  <xsl:function name="f:sanitize" as="xs:string">
    <xsl:param name="s" as="xs:string"/>
    <xsl:sequence select="string-join(
      for $c in string-to-codepoints($s)
      return if (f:is-legal-xml10($c))
             then codepoints-to-string($c)
             else f:placeholder($c),
      '')"/>
  </xsl:function>

  <!-- Sanitize text nodes -->
  <xsl:template match="text()">
    <xsl:value-of select="f:sanitize(.)"/>
  </xsl:template>

  <!-- Sanitize attribute values -->
  <xsl:template match="@*">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
      <xsl:value-of select="f:sanitize(.)"/>
    </xsl:attribute>
  </xsl:template>

  <!-- Force root html to XHTML ns; ensure head exists -->
  <xsl:template match="h:html | html">
    <xsl:element name="html" namespace="http://www.w3.org/1999/xhtml">
      <xsl:apply-templates select="@*"/>
      <!-- If no head, create one with the desired meta -->
      <xsl:if test="not(h:head or head)">
        <xsl:element name="head" namespace="http://www.w3.org/1999/xhtml">
          <xsl:element name="meta" namespace="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="http-equiv">Content-Type</xsl:attribute>
            <xsl:attribute name="content">text/html; charset=UTF-8</xsl:attribute>
          </xsl:element>
        </xsl:element>
      </xsl:if>
      <xsl:apply-templates select="node()"/>
    </xsl:element>
  </xsl:template>

  <!-- Normalize head: XHTML ns; insert one UTF-8 meta as the first child; drop existing charset metas -->
  <xsl:template match="h:head | head">
    <xsl:element name="head" namespace="http://www.w3.org/1999/xhtml">
      <xsl:apply-templates select="@*"/>
      <!-- First child: the only charset meta -->
      <xsl:element name="meta" namespace="http://www.w3.org/1999/xhtml">
        <xsl:attribute name="http-equiv">Content-Type</xsl:attribute>
        <xsl:attribute name="content">text/html; charset=UTF-8</xsl:attribute>
      </xsl:element>
      <!-- Then the rest of head content (excluding old charset metas) -->
      <xsl:apply-templates select="node()"/>
    </xsl:element>
  </xsl:template>

  <!-- Drop any charset-setting meta to avoid duplicates (case-insensitive http-equiv) -->
  <xsl:template match="
      h:meta[lower-case(@http-equiv)='content-type']
    | meta[lower-case(@http-equiv)='content-type']
    | h:meta[@charset]
    | meta[@charset]
  "/>

</xsl:stylesheet>