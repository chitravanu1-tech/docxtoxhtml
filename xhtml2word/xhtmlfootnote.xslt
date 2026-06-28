<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<!-- Replace your namespace as needed-->
<!--Added Editor issue for marriapan 22-07-202 "span[@data-commentimg][not(ancestor-or-self::*[@data-change='commentdeleted'])]"-->
<!--added on 23-03-2021 for Editor insert footnote-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf"
 xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas"
 xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
 xmlns:o="urn:schemas-microsoft-com:office:office"
 xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"
 xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math"
 xmlns:v="urn:schemas-microsoft-com:vml"
 xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing"
 xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing"
 xmlns:w10="urn:schemas-microsoft-com:office:word"
 xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
 xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml"
 xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup"
 xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk"
 xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml"
 xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape"
 xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main"
 xmlns:dt="uuid:C2F41010-65B3-11d1-A29F-00AA00C14882"
 xmlns:pic="http://schemas.openxmlformats.org/drawingml/2006/picture"
 xmlns:a14="http://schemas.microsoft.com/office/drawing/2010/main"
 exclude-result-prefixes="xs mf" version="2.0">

 <xsl:output indent="no"/>
 <xsl:strip-space elements="*"/>
 <xsl:preserve-space elements="*"/>

 <xsl:variable name="num" select="document('xhtmlNum2.xml')"/>
 <xsl:variable name="styles" select="document('styles.xml')"/>
 <xsl:variable name="footnoteRootCount" select="count(//div[@style = 'mso-element:footnote'])"/>
 <xsl:variable name="footnoteRootCount1" select="count(//li[@style = 'mso-element:footnote' or lower-case(@class)='footnotecaption'])"/>
 <xsl:template match="/">
<w:footnotes xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas"
   xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
   xmlns:o="urn:schemas-microsoft-com:office:office"
   xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"
   xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math"
   xmlns:v="urn:schemas-microsoft-com:vml"
   xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing"
   xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing"
   xmlns:w10="urn:schemas-microsoft-com:office:word"
   xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
   xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml"
   xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup"
   xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk"
   xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml"
   xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape"
   mc:Ignorable="w14 wp14">
   <xsl:element name="w:footnote">
    <xsl:attribute name="w:type" select="'separator'"/>
    <xsl:attribute name="w:id" select="'-1'"/>
    <xsl:element name="w:p">
     <xsl:element name="w:pPr">
      <xsl:element name="w:spacing">
       <xsl:attribute name="w:after" select="'0'"/>
       <xsl:attribute name="w:line" select="'240'"/>
       <xsl:attribute name="w:lineRule" select="'auto'"/>
      </xsl:element>
     </xsl:element>
     <xsl:element name="w:r">
      <xsl:element name="w:separator"/>
     </xsl:element>
    </xsl:element>
   </xsl:element>
   <w:footnote w:type="continuationSeparator" w:id="0">
    <w:p w:rsidR="004B60EE" w:rsidRDefault="004B60EE" w:rsidP="00A77833">
     <w:pPr>
      <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
     </w:pPr>
     <w:r>
      <w:continuationSeparator/>
     </w:r>
    </w:p>
   </w:footnote>
   <xsl:if test="$footnoteRootCount > 1">
    <xsl:apply-templates
     select="//footnote | //div[@style = 'mso-element:footnote']/div | //div[@style = 'mso-element:footnote']"
    />
   </xsl:if>
 <xsl:if test="$footnoteRootCount1 = 1">
  
  <xsl:apply-templates select="//footnote | //li[@style = 'mso-element:footnote' or lower-case(@class)='footnotecaption']"/>
 </xsl:if>
 <xsl:if test="$footnoteRootCount1 > 1">
  
  <xsl:apply-templates
   select="//footnote | //li[@style = 'mso-element:footnote' or lower-case(@class)='footnotecaption']"
  />
  
 </xsl:if>
   <xsl:if test="$footnoteRootCount = 1">
    <xsl:apply-templates select="//footnote | //div[@style = 'mso-element:footnote']"/>
   </xsl:if>
  </w:footnotes>
 </xsl:template>

 <xsl:template match="span[lower-case(@class) = 'footnotereference'] | span[lower-case(@class) = 'msofootnotereference']|span[lower-case(@class) = 'Footnotenumber']"/>

 <xsl:template
  match=" a[starts-with(@id, '_ftn') or starts-with(@name, '_ftn')]"/>

 <xsl:template
  match="footnote | div[@style = 'mso-element:footnote'] | div[@style = 'mso-element:footnote']/div | //li[@style = 'mso-element:footnote' or contains(lower-case(@class),'footnotecaption')]">
  
  <!--<xsl:variable name="target"
   select="substring-after(descendant-or-self::*[starts-with(@href, '#_ftnref')][1]/@href, '#')"/>-->
  <xsl:variable name="target"
   select="substring-after(descendant-or-self::*[contains(@style,'mso-footnote-id') or lower-case(@class)='footnotecaption'][starts-with(@href, '#')][1]/@href, '#')"/>
  <xsl:variable name="isTargetPresent"
   select="boolean(preceding::*[@id = $target] | preceding::*[@name = $target])"/>
  <xsl:variable name="isTargetPresent1">
   <xsl:if test="$isTargetPresent = false()">
    <xsl:variable name="id" select="@id"/>
    <xsl:variable name="target1" select="concat('#', $id)"/>
    <xsl:value-of select="boolean(preceding::*[@href = $target1])"/>
   </xsl:if>
  </xsl:variable>
  <xsl:if test="$isTargetPresent = true() or $isTargetPresent1 = true()">
   <xsl:element name="w:footnote">
    <xsl:attribute name="w:id">
     <!--<xsl:value-of select="descendant::span[@class = 'FootnoteReference'][1]"/>-->
     <xsl:number level="any"
      count="footnote | div[@style = 'mso-element:footnote']/div | div[@style = 'mso-element:footnote']|//li[@style = 'mso-element:footnote' or @class='footnotecaption']"
     />
    </xsl:attribute>
    <xsl:choose>
     <xsl:when test="self::p[not(parent::li[@style = 'mso-element:footnote' or contains(lower-case(@class),'footnotecaption')] or parent::div[@style ='mso-element:footnote'])][@style='mso-element:footnote']">
      <xsl:element name="w:p">
       <xsl:element name="w:pPr">
        <xsl:element name="w:pStyle">
         <xsl:attribute name="w:val">
          <xsl:value-of select="self::p/@class"/>
         </xsl:attribute>
        </xsl:element>
       </xsl:element>
       <xsl:element name="w:r">
        <xsl:element name="w:rPr">
         <xsl:element name="w:rStyle">
          <xsl:attribute name="w:val" select="'FootnoteReference'"/>
         </xsl:element>
        </xsl:element>
        <xsl:element name="w:footnoteRef"/>
       </xsl:element>
       <xsl:call-template name="infopath-rich-text"/>
      </xsl:element>
     </xsl:when>
     <xsl:otherwise>
      <xsl:call-template name="infopath-rich-text"/>
     </xsl:otherwise>
    </xsl:choose>
    <!--<xsl:call-template name="infopath-rich-text"/>-->
   </xsl:element>
  </xsl:if>
 </xsl:template>

 <xsl:template
  match="a[@href and (contains(@class, 'footnote') or contains(@style, 'footnote'))][not(ancestor::*[self::h1 | self::h2 | self::h3 | self::h4 | self::h5 | self::h6 | self::p | self::li])]"/>

 <xsl:template name="infopath-rich-text">
  <!-- Basic conversion of an Infopath rich text node to WordML
      Author: Stephane Bouillon - Microsoft Services Belgium
      Feb 2006 

      This is a work in progress that will work for most hand-typed rich text values, but will almost certainly fail with
      cut/pasted html content, especially with nested tables and divs, for which I do not yet have a good solution.
      
      Send suggestions and feedback to Stephane.Bouillon@microsoft.com
 -->
  <!-- optional input parameters for default paragraph and character formatting -->
  <xsl:param name="pPr_Default"/>
  <xsl:param name="rPr_Default"/>
  <xsl:choose>
   <xsl:when
    test="descendant::h1 | descendant::h2 | descendant::h3 | descendant::h4 | descendant::h5 | descendant::h6 | descendant-or-self::p | descendant::li">
    <xsl:apply-templates select="* | text()">
     <xsl:with-param name="pPr_Default">
      <xsl:copy-of select="$pPr_Default"/>
     </xsl:with-param>
     <xsl:with-param name="rPr_Default">
      <xsl:copy-of select="$rPr_Default"/>
     </xsl:with-param>
    </xsl:apply-templates>
   </xsl:when>
  </xsl:choose>
 </xsl:template>

 <xsl:template  match="a[starts-with(@href,'#ftnref')]"/>
 <!-- XHTML div -->
 <xsl:template match="h1 | h2 | h3 | h4 | h5 | h6 | p | li[not(@style='mso-element:endnote' or @class='footnotecaption')]">
  <xsl:param name="pPr_Default"/>
  <xsl:param name="rPr_Default"/>
  <xsl:variable name="pstyle">
   <xsl:variable name="dataName" select="@data-name"/>
   <xsl:variable name="class" select="@class"/>
   <xsl:choose>
    <!--	when the style is normal, we don't have to put it as style			-->
    <xsl:when test="(lower-case($dataName) = 'normal') or (lower-case($class) = 'normal')"/>
    <xsl:when test="@data-name and (string-length(@data-name) > 0)">
     <xsl:variable name="stylesCount"
      select="count($styles//w:style[w:name/@w:val = $dataName]/@w:styleId)"/>
     <xsl:choose>
      <xsl:when test="$stylesCount = 1">
       <xsl:value-of
        select="$styles//w:style[w:name/@w:val = $dataName]/@w:styleId"/>
      </xsl:when>
      <xsl:when test="$stylesCount > 1">
       <xsl:variable name="styleId">
        <xsl:variable name="sId" select="replace($dataName, '[\W\s]', '')"/>
        <xsl:for-each select="tokenize($class, ' ')">
         <xsl:if test="contains(replace(., '[\W\s]', ''), $sId)">
          <xsl:value-of select="."/>
         </xsl:if>
        </xsl:for-each>
       </xsl:variable>
       <xsl:choose>
        <xsl:when test="string-length($styleId) > 0">
         <xsl:variable name="id"
          select="$styles//w:style[@w:styleId = $styleId][1]/@w:styleId"/>
         <xsl:choose>
          <xsl:when test="string-length($id) > 0">
           <xsl:value-of select="$id"/>
          </xsl:when>
          <xsl:otherwise>
           <xsl:value-of
            select="$styles//w:style[w:name/@w:val = $dataName][1]/@w:styleId"
           />
          </xsl:otherwise>
         </xsl:choose>
        </xsl:when>
        <xsl:otherwise>
         <xsl:value-of
          select="$styles//w:style[w:name/@w:val = $dataName][1]/@w:styleId"
         />
        </xsl:otherwise>
       </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
       <xsl:variable name="style"
        select="$styles//w:style[w:name/@w:val = $dataName]/@w:styleId"/>
       <xsl:choose>
        <xsl:when test="string-length($style) > 0">
         <xsl:value-of select="$style"/>
        </xsl:when>
        <xsl:otherwise>
         <xsl:value-of select="$dataName"/>
        </xsl:otherwise>
       </xsl:choose>
      </xsl:otherwise>
     </xsl:choose>
    </xsl:when>
    <xsl:otherwise>
     <xsl:choose>
      <xsl:when test="@class and (string-length(@class) > 0)">
       <xsl:value-of
        select="$styles//w:style[w:name/@w:val = $class]/@w:styleId"/>
      </xsl:when>
      <xsl:otherwise>
       <!--  have to discuss about this condition     -->
      </xsl:otherwise>
     </xsl:choose>
    </xsl:otherwise>
   </xsl:choose>
  </xsl:variable>
  <xsl:element name="w:p">
   <xsl:element name="w:pPr">
    <xsl:if test="(string-length($pstyle) > 0)">
     <xsl:element name="w:pStyle">
      <!--<xsl:attribute name="w:val" select="@class"/>-->
      <xsl:attribute name="w:val" select="$pstyle"/>
     </xsl:element>
    </xsl:if>

    <!-- condition for list numpr   -->
    <xsl:if test="self::li">
     <xsl:variable name="listID">
      <xsl:variable name="class" select="parent::ol/@class"/>
      <xsl:variable name="start" select="parent::ol/@start"/>
      <xsl:variable name="type" select="parent::ol/@type"/>
      <xsl:variable name="ListId" select="parent::ol/@listUID"/>
      <xsl:variable name="datalevel" select="parent::ol/@data-ilvl"/>
      <xsl:variable name="listUI" select="parent::ol/@listUID"/>
      <xsl:choose>
       <xsl:when test="parent::ol[(contains(@style, 'list-style-type: none'))]">
        <xsl:value-of select="0"/>
       </xsl:when>
       <xsl:otherwise>
        <xsl:choose>
         <xsl:when test="parent::ol/li[1] = self::li">
          <xsl:choose>
           <xsl:when test="$num//numId/ol[@listUID = $ListId]">
            <xsl:value-of select="$num//numId/ol[@listUID = $ListId]/@listUID"/>
           </xsl:when>
           <xsl:when test="$num//abstractNum/ol[@class = $class][@start = $start][@type = $type]">
            <!--<xsl:value-of
             select="$num//abstractNum/ol[@class = $class][@start = $start][@type = $type][1]/@listUID"
            />-->
            <xsl:value-of
             select="$num//abstractNum/ol[@class = $class][@start = $start][@type = $type][@data-ilvl=$datalevel][@listUID=$listUI]/@listUID"
            />
           </xsl:when>
           <xsl:when test="$num//abstractNum/ol[@class = $class][@type = $type]">
            <xsl:value-of select="$num//abstractNum/ol[@class = $class][@type = $type][1]/@listUID"
            />
           </xsl:when>
           <xsl:when test="$num//abstractNum/ol[@start = $start][@type = $type]">
            <xsl:value-of select="$num//abstractNum/ol[@start = $start][@type = $type][1]/@listUID"
            />
           </xsl:when>
           <xsl:when test="$num//abstractNum/ol[@type = $type]">
            <xsl:value-of select="$num//abstractNum/ol[@type = $type][1]/@listUID"/>
           </xsl:when>
          </xsl:choose>
         </xsl:when>
         <xsl:otherwise>
          <xsl:choose>
           <xsl:when test="$num//numId/ol[@listUID = $ListId]">
            <xsl:value-of select="$num//numId/ol[@listUID = $ListId]/@listUID"/>
           </xsl:when>
           <xsl:when test="$num//abstractNum/ol[@class = $class][@type = $type]">
            <xsl:value-of select="$num//abstractNum/ol[@class = $class][@type = $type][1]/@listUID"
            />
           </xsl:when>
           <xsl:when test="$num//abstractNum/ol[@start = $start][@type = $type]">
            <xsl:value-of select="$num//abstractNum/ol[@start = $start][@type = $type][1]/@listUID"
            />
           </xsl:when>
           <xsl:when test="$num//abstractNum/ol[@type = $type]">
            <xsl:value-of select="$num//abstractNum/ol[@type = $type][1]/@listUID"/>
           </xsl:when>
          </xsl:choose>
         </xsl:otherwise>
        </xsl:choose>
       </xsl:otherwise>
      </xsl:choose>
     </xsl:variable>
     <xsl:variable name="listID1">
      <xsl:if test="parent::ul">
       <xsl:variable name="class" select="parent::ul/@class"/>
       <xsl:variable name="style" select="parent::ul/@style"/>
       <xsl:variable name="ListId" select="parent::ul/@listUID"/>
       <xsl:variable name="type" select="parent::ul/@type"/>
       <xsl:variable name="datalevel" select="parent::ul/@data-ilvl"/>
       <xsl:variable name="listUI" select="parent::ul/@listUID"/>
       <xsl:variable name="start" select="parent::ul/@start"/>
       <xsl:choose>
        <xsl:when test="parent::ul[(contains(@style, 'list-style-type: none'))]">
         <xsl:value-of select="0"/>
        </xsl:when>
        <xsl:otherwise>
         <xsl:choose>
          <xsl:when test="$num//numId/ul[@listUID = $ListId]">
           <xsl:value-of select="$num//numId/ul[@listUID = $ListId]/@listUID"/>
          </xsl:when>
          <xsl:when
           test="$num//abstractNum/ul[@class = $class][@start = $start][@type = $type]">
           
           <xsl:value-of
            select="$num//abstractNum/ul[@class = $class][@start = $start][@type = $type][@data-ilvl=$datalevel][@listUID=$listUI]/@listUID"
           />
           
          </xsl:when>
          <xsl:when test="$num//abstractNum/ul[@class = $class]">
           <xsl:value-of select="$num//abstractNum/ul[@class = $class]/@listUID"/>
          </xsl:when>
          <xsl:when test="$num//abstractNum/ul[@style = $style]">
           <xsl:value-of select="$num//abstractNum/ul[@style = $style]/@listUID"/>
          </xsl:when>
          <xsl:otherwise>
           <xsl:value-of select="ancestor::ul[1]/@listUID"/>
          </xsl:otherwise>
         </xsl:choose>
        </xsl:otherwise>
       </xsl:choose>
      </xsl:if>
     </xsl:variable>
     <xsl:if test="parent::ol">
      <xsl:element name="w:numPr">
       <xsl:element name="w:ilvl">
        <xsl:attribute name="w:val" select="'0'"/>
       </xsl:element>
       <xsl:element name="w:numId">
        <xsl:attribute name="w:val">
         <xsl:value-of select="number($listID)"/>
        </xsl:attribute>
       </xsl:element>
      </xsl:element>
     </xsl:if>
     <xsl:if test="parent::ul">
      <xsl:element name="w:numPr">
       <xsl:element name="w:ilvl">
        <xsl:attribute name="w:val" select="'0'"/>
       </xsl:element>
       <xsl:element name="w:numId">
        <xsl:attribute name="w:val">
         <xsl:value-of select="number($listID1)"/>
        </xsl:attribute>
       </xsl:element>
      </xsl:element>
     </xsl:if>
    </xsl:if>
    <!-- condition for list numpr   -->

    <!--<xsl:if test="@itemname">
     <xsl:choose>
      <xsl:when test="@itemname = 'deleted'">
       <xsl:element name="w:del"/>
      </xsl:when>
      <xsl:when test="@itemname ='inserted'">
       <xsl:element name="w:ins"/>
      </xsl:when>
     </xsl:choose>
     </xsl:if>-->

    <xsl:call-template name="apply-paragraph-formatting">
     <xsl:with-param name="pPr_Default">
      <xsl:copy-of select="$pPr_Default"/>
     </xsl:with-param>
    </xsl:call-template>
    <xsl:element name="w:rPr">
     <xsl:call-template name="apply-nested-character-formatting">
      <xsl:with-param name="rPr_Default" select="$rPr_Default"/>
     </xsl:call-template>
     <!-- this condition is given in the assumption of there will be only one delete tag as a child if the whole paragraph is deleted in the xhtml using ckeditior -->
     <!--<xsl:if test="count((descendant-or-self::*[not(self::del)]/text()|descendant-or-self::text()|descendant-or-self::img)) = 0 and not(count(descendant::*) = 0)">-->
     <xsl:if test="lower-case(@data-change) = 'paradeleted'">
      <xsl:element name="w:del">
       <xsl:attribute name="w:id">
        <xsl:number level="any"/>
       </xsl:attribute>
       <xsl:attribute name="w:author" select="descendant::del[1]/@data-username"/>
       <!--<xsl:attribute name="w:date" select="child::del[1]/@data-time"></xsl:attribute>-->
      </xsl:element>
     </xsl:if>
     <!-- this condition is given in the assumption of there will be only one inserted tag as a child if the whole paragraph is deleted in the xhtml using ckeditior -->
     <!--      <xsl:if test="count((descendant-or-self::*[not(self::ins)]/text()|descendant-or-self::text()|descendant-or-self::img)) = 0 and not(count(descendant::*) = 0)">-->
     <xsl:if test="lower-case(@data-change) = 'parainserted'">
      <xsl:element name="w:ins">
       <xsl:attribute name="w:id">
        <xsl:number level="any"/>
       </xsl:attribute>
       <xsl:attribute name="w:author" select="descendant::ins[1]/@data-username"/>
       <!--<xsl:attribute name="w:date" select="child::del[1]/@data-time"></xsl:attribute>-->
      </xsl:element>
     </xsl:if>
    </xsl:element>
   </xsl:element>
   <xsl:if
    test="ancestor::div[1]/descendant::*[self::h1 | self::h2 | self::h3 | self::h4 | self::h5 | self::h6 | self::p | self::li][1] = self::* or ancestor::li[1]/descendant::*[self::h1 | self::h2 | self::h3 | self::h4 | self::h5 | self::h6 | self::p | self::li][1] = self::*">
    <xsl:element name="w:r">
     <xsl:element name="w:rPr">
      <xsl:element name="w:rStyle">
       <xsl:attribute name="w:val" select="'FootnoteReference'"/>
      </xsl:element>
      <xsl:call-template name="apply-nested-character-formatting"/>
     </xsl:element>
     <xsl:if test="parent::div/a[contains(@style,'mso-footnote-id')][starts-with(@id, '_') or starts-with(@name, '_')][string-length(.) &gt; 0] or parent::li//a[contains(@style,'mso-footnote-id') or @class='footnotecaption'][starts-with(@href, '#ftnref')][string-length(.) &gt; 0]|parent::li//a[not(contains(@style,'mso-footnote-id') or @class='footnotecaption')][starts-with(@href, '#ftnref')][string-length(.) &gt; 0]">
      <xsl:element name="w:footnoteRef"/>
     </xsl:if>
     <!--added on 23-03-2021 for Editor insert footnote-->
     <xsl:if test="parent::div/a[contains(@style,'mso-footnote-id')][starts-with(@id, '_') or starts-with(@name, '_')][string-length(.) = 0]">
      <xsl:element name="w:sym">
       <xsl:attribute name="w:font" select="'Symbol'"/>
       <xsl:attribute name="w:char">
        <xsl:value-of select="'F020'"/>
       </xsl:attribute>
     </xsl:element>
   </xsl:if>
   </xsl:element>
   </xsl:if>
   <xsl:apply-templates select="* | text()">
    <xsl:with-param name="pPr_Default">
     <xsl:copy-of select="$pPr_Default"/>
    </xsl:with-param>
    <xsl:with-param name="rPr_Default">
     <xsl:copy-of select="$rPr_Default"/>
    </xsl:with-param>
   </xsl:apply-templates>
  </xsl:element>
 </xsl:template>
<!-- <xsl:template match="annotation[string-length(@title) &gt; 0]|comment|img[@data-comment]">-->
 <!--Added Editor issue for marriapan 22-07-202 "span[@data-commentimg][not(ancestor-or-self::*[@data-change='commentdeleted'])]"-->
 <xsl:template
  match="img[@data-comment | @data-commentimg][(ancestor::*[@data-change = 'commentdeleted'])] | span[@data-comment | @data-commentimg][(ancestor::*[@data-change = 'commentdeleted'])]"/>
 <xsl:template match="img[@data-comment] | span[@data-comment] | img[@data-commentimg] | span[@data-commentimg] | span[@data-commentgroup]">
  
  <xsl:variable name="astyle" select="@data-comment"/>
  <xsl:variable name="aastyle" select="@data-commentimg"/>
  <!--<xsl:variable name="aaastyle" select="@data-commentgroup"/>-->
  <!--Added on 08-02-2021 for marriapn commentgroup text missing-->
  <xsl:variable name="aaastyle">
   
   <xsl:if test="self::span[not(@data-commentgroup = following::span[@data-commentgroup]/@data-commentgroup)]">
    <xsl:value-of select="self::span[@data-commentgroup][1]/@data-commentgroup"/>
   </xsl:if>
   
   
  </xsl:variable>
  
  
  <xsl:if
   test="self::img[@data-commentimg] or self::span[@data-commentimg] and not(count(preceding::span[@data-commentrange = 'cmtEnd'])) or self::img[@data-comment] and not(count(preceding::span[@data-commentrange = 'cmtEnd'])) or self::span[@data-comment][not(@data-commentrange = 'cmtStart')][not(@data-commentrange = 'cmtEnd')][@data-change='commentadded'][not(@data-comment= preceding::span[@data-commentgroup][1]/@data-commentgroup)]">
   <xsl:for-each select="//CommentReference">
    <xsl:variable name="bstyle" select="@data-commentvalue"/>
    <xsl:choose>
     <xsl:when test="$bstyle = $astyle">
      <xsl:element name="w:r">
       <xsl:element name="w:commentReference">
        <xsl:attribute name="w:id">
         <xsl:value-of select="substring-after($astyle,'cmt')"/>
        </xsl:attribute>
       </xsl:element>
      </xsl:element>
     </xsl:when>
     <xsl:otherwise>
      <xsl:choose>
       <xsl:when test="$bstyle = $aastyle">
        <xsl:element name="w:r">
         <xsl:element name="w:commentReference">
          <xsl:attribute name="w:id">
           <xsl:value-of select="substring-after($aastyle,'cmt')"/>
          </xsl:attribute>
         </xsl:element>
        </xsl:element>
       </xsl:when>
      </xsl:choose>
     </xsl:otherwise>
    </xsl:choose>
   </xsl:for-each>
   <!--Add For each condition {commentreference} 15.12.2017 -->
   <xsl:for-each select="//commentreference">
    <xsl:variable name="bstyle" select="@data-commentvalue"/>
    <xsl:choose>
     <xsl:when test="$bstyle = $astyle">
      
      <xsl:element name="w:r">
       <xsl:element name="w:commentReference">
        <xsl:attribute name="w:id">
         
         <xsl:value-of select="substring-after($astyle,'cmt')"/>
        </xsl:attribute>
       </xsl:element>
      </xsl:element>
     </xsl:when>
     <xsl:otherwise>
      <xsl:choose>
       <xsl:when test="$bstyle = $aastyle">
        
        <xsl:element name="w:r">
         <xsl:element name="w:commentReference">
          <xsl:attribute name="w:id">
           <xsl:value-of select="substring-after($aastyle,'cmt')"/>
          </xsl:attribute>
         </xsl:element>
        </xsl:element>
       </xsl:when>
      </xsl:choose>
     </xsl:otherwise>
    </xsl:choose>
   </xsl:for-each>
  </xsl:if>
  <xsl:if
   test="self::img[@data-commentimg] or self::span[@data-commentimg] and count(preceding::span[@data-commentrange = 'cmtEnd']) and not(count(preceding::span[@data-change='commentadded'])) or self::img[@data-comment] and count(preceding::span[@data-commentrange = 'cmtEnd'])">
   
   <xsl:for-each select="//CommentReference">
    <xsl:variable name="bstyle" select="@data-commentvalue"/>
    <xsl:choose>
     <xsl:when test="$bstyle = $astyle">
      <xsl:element name="w:r">
       <xsl:element name="w:commentReference">
        <xsl:attribute name="w:id">
         <xsl:value-of select="substring-after($astyle,'cmt')"/>
        </xsl:attribute>
       </xsl:element>
      </xsl:element>
     </xsl:when>
     <xsl:otherwise>
      <xsl:choose>
       <xsl:when test="$bstyle = $aastyle">
        <xsl:element name="w:r">
         <xsl:element name="w:commentReference">
          <xsl:attribute name="w:id">
           <xsl:value-of select="substring-after($aastyle,'cmt')"/>
          </xsl:attribute>
         </xsl:element>
        </xsl:element>
       </xsl:when>
      </xsl:choose>
     </xsl:otherwise>
    </xsl:choose>
   </xsl:for-each>
   <!--Add For each condition {commentreference} 15.12.2017 -->
   <xsl:for-each select="//commentreference">
    
    <xsl:variable name="bstyle" select="@data-commentvalue"/>
    <xsl:choose>
     <xsl:when test="$bstyle = $astyle">
      
      <xsl:element name="w:r">
       <xsl:element name="w:commentReference">
        <xsl:attribute name="w:id">
         <xsl:value-of select="substring-after($astyle,'cmt')"/>
        </xsl:attribute>
       </xsl:element>
      </xsl:element>
     </xsl:when>
     <xsl:otherwise>
      <xsl:choose>
       <xsl:when test="$bstyle = $aastyle">
        
        <xsl:element name="w:r">
         <xsl:element name="w:commentReference">
          <xsl:attribute name="w:id">
           <xsl:value-of select="substring-after($aastyle,'cmt')"/>
          </xsl:attribute>
         </xsl:element>
        </xsl:element>
       </xsl:when>
      </xsl:choose>
     </xsl:otherwise>
    </xsl:choose>
   </xsl:for-each>
  </xsl:if>
  <xsl:if test="self::span[@data-commentgroup]">
   <!--Added on 08-02-2021 for marriapn commentgroup text missing-->
   <xsl:if test="self::span[@data-commentgroup and @data-change='commentGroup'][string-length(.)&gt;0]">
    <xsl:apply-templates/>
   </xsl:if>
   
   <xsl:for-each select="//CommentReference">
    <xsl:variable name="bstyle" select="@data-commentvalue"/>
    
    <xsl:if test="$bstyle = $aaastyle">
     
     <xsl:element name="w:r">
      <xsl:element name="w:commentReference">
       <xsl:attribute name="w:id">
        <xsl:value-of select="substring-after($aaastyle,'cmt')"/>
       </xsl:attribute>
      </xsl:element>
     </xsl:element>
    </xsl:if>
    
    
   </xsl:for-each>
   <!--Add For each condition {commentreference} 15.12.2017 -->
   <xsl:for-each select="//commentreference">
    
    <xsl:variable name="bstyle" select="@data-commentvalue"/>
    
    <xsl:if test="$bstyle = $aaastyle">
     <xsl:element name="w:r">
      <xsl:element name="w:commentReference">
       <xsl:attribute name="w:id">
        <xsl:value-of select="substring-after($aaastyle,'cmt')"/>
       </xsl:attribute>
      </xsl:element>
     </xsl:element>
    </xsl:if>
    
   </xsl:for-each>
  </xsl:if>
 </xsl:template>
 <!--<xsl:template
  match="img[@data-comment | @data-commentimg][not(ancestor::*[@data-change = 'commentdeleted'])] | span[@data-comment | @data-commentimg][not(ancestor::*[@data-change = 'commentdeleted'])]">

  <xsl:element name="w:commentRangeStart">
   <xsl:attribute name="w:id">
    <xsl:choose>
     <xsl:when test="img[@data-comment | @data-commentimg]">
      <xsl:number level="any" count="img[@data-comment | @data-commentimg]"/>
     </xsl:when>
     <xsl:otherwise>
      <xsl:number level="any" count="span[@data-comment | @data-commentimg]"/>
     </xsl:otherwise>
    </xsl:choose>
   
    <!-\-    <xsl:value-of select="replace(self::img/@data-comment|self::img/@data-commentimg,'cmt','')"/>-\->
   </xsl:attribute>
  </xsl:element>
  <xsl:element name="w:r">
   <xsl:element name="w:commentReference">
    <xsl:attribute name="w:id">
     <xsl:choose>
      <xsl:when test="img[@data-comment | @data-commentimg]">
       <xsl:number level="any" count="img[@data-comment | @data-commentimg]"/>
      </xsl:when>
      <xsl:otherwise>
       <xsl:number level="any" count="span[@data-comment | @data-commentimg]"/>
      </xsl:otherwise>
     </xsl:choose>
     <!-\-<xsl:number level="any" count="img[@data-comment | @data-commentimg]"/>-\->
     <!-\-     <xsl:value-of select="replace(self::img/@data-comment|self::img/@data-commentimg,'cmt','')"/>-\->
    </xsl:attribute>
   </xsl:element>
  </xsl:element>
  <!-\-<xsl:if test="self::annotation">
    <xsl:apply-templates/>
   </xsl:if>-\->
  <xsl:element name="w:commentRangeEnd">
   <xsl:attribute name="w:id">
    <xsl:choose>
     <xsl:when test="img[@data-comment | @data-commentimg]">
      <xsl:number level="any" count="img[@data-comment | @data-commentimg]"/>
     </xsl:when>
     <xsl:otherwise>
      <xsl:number level="any" count="span[@data-comment | @data-commentimg]"/>
     </xsl:otherwise>
    </xsl:choose>
    <!-\-<xsl:number level="any" count="img[@data-comment | @data-commentimg]"/>-\->
    <!-\-    <xsl:value-of select="replace(self::img/@data-comment|self::img/@data-commentimg,'cmt','')"/>-\->
   </xsl:attribute>
  </xsl:element>

 </xsl:template>-->

<!-- XHTML table -->
 <xsl:template match="table">
  <xsl:param name="pPr_Default"/>
  <xsl:param name="rPr_Default"/>
  <xsl:element name="w:tbl">
   <!-- <w:tblPr>
    <w:tblBorders>
     <w:top w:val="single"/>
     <w:left w:val="single"/>
     <w:bottom w:val="single"/>
     <w:right w:val="single"/>
     <w:insideH w:val="single"/>
     <w:insideV w:val="single"/>
    </w:tblBorders>
   </w:tblPr>-->
   <!--   <xsl:if test="not(child::tbody/colgroup)">-->
   <xsl:if test="not(descendant::tbody[1]/colgroup)">
    <xsl:if test="not(child::colgroup)">
     <xsl:variable name="columnCount">
      <xsl:variable name="max">
       <xsl:choose>
        <xsl:when test="(tbody)">
         <xsl:value-of select="max(tbody/tr/count(child::td))"/>
        </xsl:when>
        <xsl:otherwise>
         <xsl:value-of select="max(tr/count(child::td))"/>
        </xsl:otherwise>
       </xsl:choose>
      </xsl:variable>
      <xsl:variable name="tr">
       <xsl:choose>
        <xsl:when test="(tbody)">
         <xsl:copy-of select="tbody/tr[count(child::td) = $max][1]"/>
        </xsl:when>
        <xsl:otherwise>
         <xsl:copy-of select="tr[count(child::td) = $max][1]"/>
        </xsl:otherwise>
       </xsl:choose>
      </xsl:variable>
      <xsl:copy-of select="$tr"/>
     </xsl:variable>
     <xsl:element name="w:tblGrid">
      <xsl:for-each select="$columnCount//td">
       <xsl:variable name="CW" select="1"/>
       <xsl:element name="w:gridCol">
        <xsl:attribute name="w:w" select="$CW * 20"/>
       </xsl:element>
      </xsl:for-each>
     </xsl:element>
    </xsl:if>
   </xsl:if>
   <xsl:apply-templates select="*">
    <xsl:with-param name="pPr_Default">
     <xsl:copy-of select="$pPr_Default"/>
    </xsl:with-param>
    <xsl:with-param name="rPr_Default">
     <xsl:copy-of select="$rPr_Default"/>
    </xsl:with-param>
   </xsl:apply-templates>
  </xsl:element>
 </xsl:template>

 <xsl:template match="tbody">
  <xsl:param name="pPr_Default"/>
  <xsl:param name="rPr_Default"/>
  <xsl:apply-templates select="*">
   <xsl:with-param name="pPr_Default">
    <xsl:copy-of select="$pPr_Default"/>
   </xsl:with-param>
   <xsl:with-param name="rPr_Default">
    <xsl:copy-of select="$rPr_Default"/>
   </xsl:with-param>
  </xsl:apply-templates>
 </xsl:template>

 <xsl:template match="tr">
  <xsl:param name="pPr_Default"/>
  <xsl:param name="rPr_Default"/>
  <xsl:element name="w:tr">
   <xsl:apply-templates select="*">
    <xsl:with-param name="pPr_Default">
     <xsl:copy-of select="$pPr_Default"/>
    </xsl:with-param>
    <xsl:with-param name="rPr_Default">
     <xsl:copy-of select="$rPr_Default"/>
    </xsl:with-param>
   </xsl:apply-templates>
  </xsl:element>
 </xsl:template>

 <xsl:template match="td">
  <xsl:param name="pPr_Default"/>
  <xsl:param name="rPr_Default"/>
  <xsl:variable name="cellNum" select="@cellNumber"/>
  <xsl:element name="w:tc">
   <xsl:element name="w:tcPr">
    <xsl:if test="@colspan > 1">
     <xsl:element name="w:gridSpan">
      <xsl:attribute name="w:val" select="@colspan"/>
     </xsl:element>
    </xsl:if>
    <xsl:choose>
     <xsl:when test="./@vMerge = 'restart'">
      <xsl:element name="w:vMerge">
       <xsl:attribute name="w:val" select="'restart'"/>
      </xsl:element>
     </xsl:when>
     <xsl:when test="./@vMerge = 'continue'">
      <xsl:element name="w:vMerge"/>
     </xsl:when>
    </xsl:choose>
   </xsl:element>
   <xsl:choose>
    <xsl:when
     test="descendant::h1 | descendant::h2 | descendant::h3 | descendant::h4 | descendant::h5 | descendant::h6 | descendant::p | descendant::li">

     <xsl:apply-templates select="* | text()">
      <xsl:with-param name="pPr_Default">
       <xsl:copy-of select="$pPr_Default"/>
      </xsl:with-param>
      <xsl:with-param name="rPr_Default">
       <xsl:copy-of select="$rPr_Default"/>
      </xsl:with-param>
      <xsl:sort select="parent::td/@cellNumber"/>
     </xsl:apply-templates>
     <xsl:if
      test="not(child::h1 | child::h2 | child::h3 | child::h4 | child::h5 | child::h6 | child::p | child::li)">
      <xsl:element name="w:p">
       <!--<xsl:apply-templates select="* | text()">
        <xsl:with-param name="pPr_Default"><xsl:copy-of select="$pPr_Default"/></xsl:with-param>
        <xsl:with-param name="rPr_Default"><xsl:copy-of select="$rPr_Default"/></xsl:with-param>
        <xsl:sort select="parent::td/@cellNumber"/>
       </xsl:apply-templates>-->
       <xsl:variable name="name">
        <xsl:value-of select="'Story_X2W_CellPara_'"/>
        <xsl:number level="any"/>
       </xsl:variable>
       <!-- client don't want bokmark  on 24-9-2024-->
       <!--<xsl:element name="w:bookmarkStart">
        <xsl:attribute name="w:id">
         <xsl:number level="any"/>
        </xsl:attribute>
        <xsl:attribute name="w:name" select="$name"/>
       </xsl:element>-->

       <!--<xsl:element name="w:bookmarkEnd">
        <xsl:attribute name="w:id">
         <xsl:number level="any"/>
        </xsl:attribute>
       </xsl:element>-->
      </xsl:element>
     </xsl:if>
    </xsl:when>
    <xsl:otherwise>
     <xsl:element name="w:p">
      <xsl:apply-templates select="* | text()">
       <xsl:with-param name="pPr_Default">
        <xsl:copy-of select="$pPr_Default"/>
       </xsl:with-param>
       <xsl:with-param name="rPr_Default">
        <xsl:copy-of select="$rPr_Default"/>
       </xsl:with-param>
       <xsl:sort select="parent::td/@cellNumber"/>
      </xsl:apply-templates>
     </xsl:element>
    </xsl:otherwise>
   </xsl:choose>
  </xsl:element>
 </xsl:template>

 <xsl:template match="colgroup">
  <xsl:param name="pPr_Default"/>
  <xsl:param name="rPr_Default"/>
  <xsl:element name="w:tblGrid">
   <xsl:apply-templates select="*">
    <xsl:with-param name="pPr_Default">
     <xsl:copy-of select="$pPr_Default"/>
    </xsl:with-param>
    <xsl:with-param name="rPr_Default">
     <xsl:copy-of select="$rPr_Default"/>
    </xsl:with-param>
   </xsl:apply-templates>
  </xsl:element>
 </xsl:template>

 <xsl:template match="col">
  <xsl:param name="pPr_Default"/>
  <xsl:param name="rPr_Default"/>
  <xsl:choose>
   <xsl:when test="contains(@style, 'WIDTH: ')">
    <xsl:element name="w:gridCol">
     <xsl:attribute name="w:w">
      <xsl:value-of select="substring-before(substring-after(@style, 'WIDTH: '), 'px')"/>
     </xsl:attribute>
    </xsl:element>
   </xsl:when>
   <xsl:otherwise>
    <xsl:element name="w:gridCol">
     <xsl:attribute name="w:w" select="20"/>
    </xsl:element>
   </xsl:otherwise>
  </xsl:choose>

 </xsl:template>

 <!-- XHTML img -->
 <xsl:template match="img[@src][not(@data-comment | @data-commentimg)]">
  <xsl:param name="pPr_Default"/>
  <xsl:param name="rPr_Default"/>
  <xsl:variable name="H">
   <xsl:choose>
    <xsl:when test="@height">
     <xsl:value-of select="round((@height * 12700) cast as xs:decimal)"/>
    </xsl:when>
    <xsl:otherwise>
     <xsl:value-of select="round((10 * 12700) cast as xs:decimal)"/>
    </xsl:otherwise>
   </xsl:choose>
  </xsl:variable>
  <xsl:variable name="W">
   <xsl:choose>
    <xsl:when test="@width">
     <xsl:value-of select="round((@width * 12700) cast as xs:decimal)"/>
    </xsl:when>
    <xsl:otherwise>
     <xsl:value-of select="round((10 * 12700) cast as xs:decimal)"/>
    </xsl:otherwise>
   </xsl:choose>
  </xsl:variable>
  <xsl:variable name="id">
   <xsl:variable name="num">
    <xsl:number level="any"/>
   </xsl:variable>
   <xsl:value-of select="10 + $num"/>
  </xsl:variable>
  <xsl:variable name="IMG">
   <xsl:choose>
    <xsl:when test="contains(@src, '/')">
     <xsl:variable name="imgName" select="substring-after(@src, '/')"/>
     <xsl:value-of select="$imgName"/>
    </xsl:when>
    <xsl:otherwise>
     <xsl:value-of select="@src"/>
    </xsl:otherwise>

   </xsl:choose>
  </xsl:variable>
  <xsl:choose>
   <xsl:when
    test="ancestor::h1 | ancestor::h2 | ancestor::h3 | ancestor::h4 | ancestor::h5 | ancestor::h6 | ancestor::p | ancestor::li">
    <xsl:element name="w:r">
     <xsl:element name="w:rPr">
      <!-- <xsl:call-template name="apply-nested-character-formatting">
       <xsl:with-param name="rPr_Default"><xsl:copy-of select="$rPr_Default"/></xsl:with-param>
      </xsl:call-template>-->
     </xsl:element>
     <xsl:element name="w:drawing">
      <xsl:element name="wp:inline">
       <xsl:attribute name="distT" select="'0'"/>
       <xsl:attribute name="distB" select="'0'"/>
       <xsl:attribute name="distL" select="'0'"/>
       <xsl:attribute name="distR" select="'0'"/>
       <xsl:element name="wp:extent">
        <xsl:attribute name="cx" select="$W"/>
        <xsl:attribute name="cy" select="$H"/>
       </xsl:element>
       <xsl:element name="wp:effectExtent">
        <xsl:attribute name="l" select="'0'"/>
        <xsl:attribute name="t" select="'0'"/>
        <xsl:attribute name="r" select="'0'"/>
        <xsl:attribute name="b" select="'0'"/>
       </xsl:element>
       <!--@@@@@@@@@@ Wrap Top and Bottom @@@@@@@@@@@-->
       <!--<xsl:element name="wp:wrapTopAndBottom"/>-->
       <!--@@@@@@@@@@ Wrap Top and Bottom @@@@@@@@@@@-->
       <xsl:element name="wp:docPr">
        <!--<xsl:attribute name="id" select="(floor(math:random()*1000) mod 1000) + 1" />-->
        <xsl:attribute name="id">
         <xsl:call-template name="create-seed"/>
        </xsl:attribute>
        <xsl:attribute name="name" select="$IMG"/>

       </xsl:element>
       <xsl:element name="wp:cNvGraphicFramePr">
        <xsl:element name="a:graphicFrameLocks">
         <xsl:attribute name="noChangeAspect" select="'1'"/>
        </xsl:element>
       </xsl:element>
       <xsl:element name="a:graphic">
        <xsl:element name="a:graphicData">
         <xsl:attribute name="uri"
          select="'http://schemas.openxmlformats.org/drawingml/2006/picture'"/>
         <xsl:element name="pic:pic">
          <xsl:element name="pic:nvPicPr">
           <xsl:element name="pic:cNvPr">
            <xsl:attribute name="id" select="'0'"/>
            <xsl:attribute name="name" select="$IMG"/>
           </xsl:element>
           <xsl:element name="pic:cNvPicPr"/>
          </xsl:element>
          <xsl:element name="pic:blipFill">
           <xsl:element name="a:blip">
            <xsl:attribute name="r:embed" select="concat('rId', $id)"/>
            <xsl:element name="a:extLst">
             <xsl:element name="a:ext">
              <xsl:attribute name="uri" select="'{28A0092B-C50C-407E-A947-70E740481C1C}'"/>
              <xsl:element name="a14:useLocalDpi">
               <xsl:attribute name="val" select="'0'"/>
              </xsl:element>
             </xsl:element>
            </xsl:element>
           </xsl:element>
           <xsl:element name="a:stretch">
            <xsl:element name="a:fillRect"/>
           </xsl:element>
          </xsl:element>
          <xsl:element name="pic:spPr">
           <xsl:element name="a:xfrm">
            <xsl:element name="a:off">
             <xsl:attribute name="x" select="'0'"/>
             <xsl:attribute name="y" select="'0'"/>
            </xsl:element>
            <xsl:element name="a:ext">
             <xsl:attribute name="cx" select="$W"/>
             <xsl:attribute name="cy" select="$H"/>
            </xsl:element>
           </xsl:element>
           <xsl:element name="a:prstGeom">
            <xsl:attribute name="prst" select="'rect'"/>
            <xsl:element name="a:avLst"/>
           </xsl:element>
          </xsl:element>
         </xsl:element>
        </xsl:element>
       </xsl:element>

      </xsl:element>
     </xsl:element>
    </xsl:element>
   </xsl:when>
   <xsl:otherwise>
    <xsl:element name="w:p">
     <xsl:element name="w:pPr">
      <xsl:call-template name="apply-paragraph-formatting">
       <xsl:with-param name="pPr_Default">
        <xsl:copy-of select="$rPr_Default"/>
       </xsl:with-param>
      </xsl:call-template>
     </xsl:element>
     <xsl:element name="w:r">
      <xsl:element name="w:rPr">
       <!-- <xsl:call-template name="apply-nested-character-formatting">
        <xsl:with-param name="rPr_Default"><xsl:copy-of select="$rPr_Default"/></xsl:with-param>
       </xsl:call-template>-->
      </xsl:element>
      <xsl:element name="w:drawing">
       <xsl:element name="wp:inline">
        <xsl:attribute name="distT" select="'0'"/>
        <xsl:attribute name="distB" select="'0'"/>
        <xsl:attribute name="distL" select="'0'"/>
        <xsl:attribute name="distR" select="'0'"/>
        <xsl:element name="wp:extent">
         <xsl:attribute name="cx" select="$W"/>
         <xsl:attribute name="cy" select="$H"/>
        </xsl:element>
        <xsl:element name="wp:effectExtent">
         <xsl:attribute name="l" select="'0'"/>
         <xsl:attribute name="t" select="'0'"/>
         <xsl:attribute name="r" select="'0'"/>
         <xsl:attribute name="b" select="'0'"/>
        </xsl:element>
        <!--@@@@@@@@@@ Wrap Top and Bottom @@@@@@@@@@@-->
        <!--<xsl:element name="wp:wrapTopAndBottom"/>-->
        <!--@@@@@@@@@@ Wrap Top and Bottom @@@@@@@@@@@-->
        <xsl:element name="wp:docPr">
         <!--<xsl:attribute name="id" select="(floor(math:random()*1000) mod 1000) + 1" />-->
         <xsl:attribute name="id">
          <xsl:call-template name="create-seed"/>
         </xsl:attribute>
         <xsl:attribute name="name" select="$IMG"/>

        </xsl:element>
        <xsl:element name="wp:cNvGraphicFramePr">
         <xsl:element name="a:graphicFrameLocks">
          <xsl:attribute name="noChangeAspect" select="'1'"/>
         </xsl:element>
        </xsl:element>
        <xsl:element name="a:graphic">
         <xsl:element name="a:graphicData">
          <xsl:attribute name="uri"
           select="'http://schemas.openxmlformats.org/drawingml/2006/picture'"/>
          <xsl:element name="pic:pic">
           <xsl:element name="pic:nvPicPr">
            <xsl:element name="pic:cNvPr">
             <xsl:attribute name="id" select="'0'"/>
             <xsl:attribute name="name" select="$IMG"/>
            </xsl:element>
            <xsl:element name="pic:cNvPicPr"/>
           </xsl:element>
           <xsl:element name="pic:blipFill">
            <xsl:element name="a:blip">
             <xsl:attribute name="r:embed" select="concat('rId', $id)"/>
             <xsl:element name="a:extLst">
              <xsl:element name="a:ext">
               <xsl:attribute name="uri" select="'{28A0092B-C50C-407E-A947-70E740481C1C}'"/>
               <xsl:element name="a14:useLocalDpi">
                <xsl:attribute name="val" select="'0'"/>
               </xsl:element>
              </xsl:element>
             </xsl:element>
            </xsl:element>
            <xsl:element name="a:stretch">
             <xsl:element name="a:fillRect"/>
            </xsl:element>
           </xsl:element>
           <xsl:element name="pic:spPr">
            <xsl:element name="a:xfrm">
             <xsl:element name="a:off">
              <xsl:attribute name="x" select="'0'"/>
              <xsl:attribute name="y" select="'0'"/>
             </xsl:element>
             <xsl:element name="a:ext">
              <xsl:attribute name="cx" select="$W"/>
              <xsl:attribute name="cy" select="$H"/>
             </xsl:element>
            </xsl:element>
            <xsl:element name="a:prstGeom">
             <xsl:attribute name="prst" select="'rect'"/>
             <xsl:element name="a:avLst"/>
            </xsl:element>
           </xsl:element>
          </xsl:element>
         </xsl:element>
        </xsl:element>

       </xsl:element>
      </xsl:element>
     </xsl:element>
    </xsl:element>
   </xsl:otherwise>
  </xsl:choose>

 </xsl:template>

 <xsl:template name="create-seed">
  <xsl:param name="string" select="generate-id()"/>
  <xsl:param name="preliminary-seed" select="100000"/>
  <xsl:param name="maximum-value" select="10000000000"/>

  <xsl:variable name="name-chars"
   select="':ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz-.0123456789'"/>

  <xsl:choose>
   <xsl:when test="string-length($string) != 0">
    <xsl:call-template name="create-seed">
     <xsl:with-param name="string" select="substring($string, 2)"/>
     <xsl:with-param name="preliminary-seed"
      select="
       ($preliminary-seed + string-length(
       
       substring-before($name-chars, substring($string, 1, 1))
       )
       ) mod $maximum-value"/>
     <xsl:with-param name="maximum-value" select="$maximum-value"/>
    </xsl:call-template>
   </xsl:when>
   <xsl:otherwise>
    <xsl:value-of select="$preliminary-seed"/>
   </xsl:otherwise>
  </xsl:choose>
 </xsl:template>

 <xsl:template match="span[contains(@style, 'padding-left:')]">
  <xsl:variable name="tabSize" as="xs:string">
   <xsl:variable name="val" select="substring-before(substring-after(replace(lower-case(@style),' ',''), 'padding-left:'), 'px')" as="xs:string"/>
   <xsl:value-of select="string(round((number($val) div 1.33)) * 20)"/>
  </xsl:variable>
  <w:r><w:tab w:val="left" w:pos="{$tabSize}"></w:tab></w:r>
  <!--	to remove the empty space given "word to xhtml" process for ckEditor purpose, commented the below apply-templates	-->
  <!--<xsl:apply-templates/>-->
 </xsl:template>

 <xsl:template
  match="span[@style][not((lower-case(@class) = 'msofootnotereference'))][not((lower-case(@class) = 'endnotereference') or (lower-case(@class) = 'EndnoteNumber'))]">
  <xsl:param name="pPr_Default"/>
  <xsl:param name="rPr_Default"/>
  <xsl:apply-templates>
   <xsl:with-param name="pPr_Default">
    <xsl:copy-of select="$pPr_Default"/>
   </xsl:with-param>
   <xsl:with-param name="rPr_Default">
    <xsl:copy-of select="$rPr_Default"/>
   </xsl:with-param>
  </xsl:apply-templates>
 </xsl:template>
 <!-- client don't want bokmark  on 24-9-2024-->
 <xsl:template match="span[@name] | span[@data-bkmark]">
  <!--<xsl:variable name="name" select="@data-bkmark | @name"/>
  <!-\-  <xsl:choose>-\->
  <xsl:if
   test="self::span[@data-bkmark = $name][count(./preceding::span[@data-bkmark = $name]) = 0]">
   <xsl:element name="w:bookmarkStart">
    <xsl:attribute name="w:id">
     <xsl:value-of select="@bkmarkID"/>
    </xsl:attribute>
    <xsl:attribute name="w:name" select="$name"/>
   </xsl:element>
  </xsl:if>
  <xsl:if
   test="self::span[@data-bkmark = $name][count(./following::span[@data-bkmark = $name]) = 0]">
   <xsl:element name="w:bookmarkEnd">
    <xsl:attribute name="w:id">
     <xsl:value-of
      select="//span[@data-bkmark = $name][count(./preceding::span[@data-bkmark = $name]) = 0]/@bkmarkID"
     />
    </xsl:attribute>
   </xsl:element>
  </xsl:if>-->
  <!-- End -->
  <!--<xsl:otherwise>
    <xsl:element name="w:bookmarkStart">
     <xsl:attribute name="w:id">
      <xsl:number level="any"/>
     </xsl:attribute>
     <xsl:attribute name="w:name" select="$name"/>
    </xsl:element>
    <xsl:apply-templates/>
    <xsl:element name="w:bookmarkEnd">
     <xsl:attribute name="w:id">
      <xsl:number level="any"/>
     </xsl:attribute>
    </xsl:element>
   </xsl:otherwise>-->
  <!--</xsl:choose>-->


 </xsl:template>


 <xsl:template
  match="*[@data-alias | @data-boxname | @data-boxtag | @data-id | @data-tag][not(self::p | self::li)] | a[@data-alias | @data-boxname | @data-boxtag | @data-id | @data-tag]">

  <xsl:variable name="id">
   <xsl:variable name="idkey">
    <xsl:choose>
     <xsl:when test="@data-id">
      <xsl:choose>
       <xsl:when test="string-length(@data-id) = 0">
        <xsl:value-of select="1694958775 - position()"/>
       </xsl:when>
       <xsl:otherwise>
        <xsl:value-of select="@data-id"/>
       </xsl:otherwise>
      </xsl:choose>
     </xsl:when>
    </xsl:choose>
   </xsl:variable>
   <xsl:choose>
    <xsl:when test="string-length($idkey) = 0">
     <xsl:value-of select="1694958775 - position()"/>
    </xsl:when>
    <xsl:otherwise>
     <xsl:value-of select="$idkey"/>
    </xsl:otherwise>
   </xsl:choose>
  </xsl:variable>

  <xsl:variable name="Alias">
   <xsl:choose>
    <xsl:when test="@data-alias or @data-boxname">
     <xsl:choose>
      <xsl:when test="not(string-length(@data-alias) = 0)">
       <xsl:value-of select="@data-alias"/>
      </xsl:when>
      <xsl:when test="not(string-length(@data-boxname) = 0)">
       <xsl:value-of select="@data-boxname"/>
      </xsl:when>
     </xsl:choose>
    </xsl:when>
   </xsl:choose>
  </xsl:variable>

  <xsl:variable name="Tag">
   <xsl:choose>
    <xsl:when test="@data-tag or @data-boxtag">
     <xsl:choose>
      <xsl:when test="not(string-length(@data-tag) = 0)">
       <xsl:value-of select="@data-tag"/>
      </xsl:when>
      <xsl:when test="not(string-length(@data-boxtag) = 0)">
       <xsl:value-of select="@data-boxtag"/>
      </xsl:when>
     </xsl:choose>
    </xsl:when>
   </xsl:choose>
  </xsl:variable>



  <xsl:element name="w:sdt">
   <xsl:element name="w:sdtPr">
    <xsl:choose>
     <xsl:when test="not(string-length($Alias) = 0)">
      <xsl:element name="w:alias">
       <xsl:attribute name="w:val" select="$Alias"/>
      </xsl:element>
     </xsl:when>
    </xsl:choose>
    <xsl:choose>
     <xsl:when test="not(string-length($Tag) = 0)">
      <xsl:element name="w:tag">
       <xsl:attribute name="w:val" select="$Tag"/>
      </xsl:element>
     </xsl:when>
    </xsl:choose>
    <xsl:element name="w:id">
     <xsl:attribute name="w:val" select="$id"/>
    </xsl:element>
    <xsl:element name="w:placeholder">
     <xsl:element name="w:docPart">
      <xsl:attribute name="w:val" select="'DefaultPlaceholder_1081868574'"/>
     </xsl:element>
    </xsl:element>
   </xsl:element>
   <xsl:element name="w:sdtEndPr"/>
   <xsl:element name="w:sdtContent">
    <xsl:apply-templates/>
    <!-- for loose leaf -->



    <!-- for loose leaf -->
   </xsl:element>
  </xsl:element>
 </xsl:template>

 <!-- soft enter-->
 <xsl:template match="br">
  <xsl:choose>
   <xsl:when test="@data-change">
    <xsl:element name="w:ins">
     <xsl:attribute name="w:id">
      <xsl:number level="any"/>
     </xsl:attribute>
     <!--<xsl:attribute name="w:author" select="child::ins[1]/@data-username"/>-->
     <!--<xsl:attribute name="w:date" select="child::del[1]/@data-time"></xsl:attribute>-->
     <xsl:element name="w:r">
      <xsl:element name="w:br"/>
     </xsl:element>
    </xsl:element>
   </xsl:when>
   <xsl:otherwise>
    <xsl:element name="w:r">
     <xsl:element name="w:br"/>
    </xsl:element>
   </xsl:otherwise>
  </xsl:choose>



 </xsl:template>


 <!-- XHTML hyperlink -->
 <xsl:template
  match="a[@href and not(contains(@class, 'footnotecitation') or starts-with(@href,'#ftnref')) and not(contains(@class, 'footnote') or contains(@style, 'footnote')) and not(ancestor-or-self::*[(lower-case(@class) = 'endnotereference') or (lower-case(@class) = 'EndnoteNumber')])][not(@data-alias | @data-boxname | @data-boxtag | @data-id | @data-tag)]">
  <xsl:param name="pPr_Default"/>
  <xsl:param name="rPr_Default"/>
  <xsl:element name="w:hyperlink">
   <xsl:attribute name="w:anchor" select="@href"/>
   <xsl:apply-templates>
    <xsl:with-param name="pPr_Default">
     <xsl:copy-of select="$pPr_Default"/>
    </xsl:with-param>
    <xsl:with-param name="rPr_Default">
     <xsl:copy-of select="$rPr_Default"/>
    </xsl:with-param>
   </xsl:apply-templates>
  </xsl:element>
 </xsl:template>

 <!--<xsl:template match="text()">
  <xsl:param name="rPr_Default"/>
  <xsl:element name="w:r">
   <xsl:element name="w:rPr">
    <xsl:if test="./ancestor::span[@class] and ./ancestor::span[(string-length(@class) &gt; 0)]">
     <xsl:element name="w:rStyle">
      <xsl:attribute name="w:val" select="./ancestor::span/@class"/>
     </xsl:element>
    </xsl:if>
    <xsl:call-template name="apply-nested-character-formatting">
     <xsl:with-param name="rPr_Default"><xsl:copy-of select="$rPr_Default"/></xsl:with-param>
    </xsl:call-template>
   </xsl:element>
   <xsl:element name="w:t">
    <xsl:attribute name="xml:space" select="'preserve'"/>
    <xsl:value-of select="."/>
   </xsl:element>
  </xsl:element>
 </xsl:template>-->
 <!-- <xsl:template match="text()[not(parent::body) and not(parent::td) and not(parent::table) and not(parent::tbody)and not(parent::span[child::tr]) and not(parent::tgroup)]">-->

 <xsl:template match="div[@data-type = 'textbox']">

  <xsl:variable name="Conc"
   select="'width:393.6pt;height:64.3pt;mso-wrap-style:none;mso-left-percent:-10001;mso-top-percent:-10001;mso-position-horizontal:absolute;mso-position-horizontal-relative:char;mso-position-vertical:absolute;mso-position-vertical-relative:line;mso-left-percent:-10001;mso-top-percent:-10001'"/>
  <!--        <xsl:if test="following-sibling::*[1]/name() = 'Content'">
            <xsl:text disable-output-escaping="yes">&lt;/w:r&gt;</xsl:text>
        </xsl:if>-->
  <xsl:element name="w:r">

   <xsl:element name="w:pict">
    <xsl:element name="v:shapetype">
     <xsl:attribute name="id" select="'_x0000_t202'"/>
     <xsl:attribute name="coordsize" select="'21600,21600'"/>
     <xsl:attribute name="o:spt" select="'202'"/>
     <xsl:attribute name="path" select="'m,l,21600r21600,l21600,xe'"/>
     <xsl:element name="v:stroke">
      <xsl:attribute name="joinstyle" select="'miter'"/>
     </xsl:element>
     <xsl:element name="v:path">
      <xsl:attribute name="gradientshapeok" select="'t'"/>
      <xsl:attribute name="o:connecttype" select="'rect'"/>
     </xsl:element>
    </xsl:element>

    <xsl:element name="v:shape">
     <xsl:attribute name="id" select="@data-id"/>
     <xsl:attribute name="o:spid" select="'_x0000_s1152'"/>
     <xsl:attribute name="type" select="'#_x0000_t202'"/>
     <xsl:attribute name="style" select="$Conc"/>
     <xsl:attribute name="stroked" select="'f'"/>
     <xsl:attribute name="strokecolor" select="'white [3212]'"/>
     <xsl:element name="v:textbox">
      <xsl:attribute name="style" select="'mso-fit-shape-to-text:t'"/>
      <xsl:attribute name="inset" select="'0,0,0,0'"/>
      <xsl:element name="w:txbxContent">
       <xsl:apply-templates/>
      </xsl:element>
     </xsl:element>
     <xsl:element name="w10:wrap">
      <!--<xsl:attribute name="type" select="'topAndBottom'"/>-->
      <xsl:attribute name="type" select="'tight'"/>
     </xsl:element>
     <!--<xsl:element name="w10:anchorlock"/>-->
    </xsl:element>
   </xsl:element>

  </xsl:element>
 </xsl:template>




 <xsl:template match="text()">
  <xsl:param name="rPr_Default"/>
  <!--   <xsl:if test="not(./parent::body)">-->
  <!--   <xsl:if test="string-length(.) &gt; 0">-->
  <xsl:variable name="cstyle">
   <xsl:variable name="dataName" select="./ancestor::span[@data-name][1]/@data-name"/>
   <xsl:variable name="class" select="./ancestor::span[@class][1]/@class"/>
   <xsl:choose>
    <xsl:when test="./ancestor::span[@data-name][1] and (string-length($dataName) > 0)">
     <xsl:value-of select="$styles//w:style[w:name/@w:val = $dataName]/@w:styleId"/>
    </xsl:when>
    <xsl:otherwise>
     <xsl:choose>
      <xsl:when test="./ancestor::span[@class][1] and (string-length($class) > 0)">
       <xsl:value-of select="$styles//w:style[w:name/@w:val = $class]/@w:styleId"/>
      </xsl:when>
      <xsl:otherwise>
       <!--   if there is no data-name and class in the element there is no style in the element-->
      </xsl:otherwise>
     </xsl:choose>
    </xsl:otherwise>
   </xsl:choose>
  </xsl:variable>
  <xsl:element name="w:r">
   <xsl:element name="w:rPr">
    <!--    <xsl:if test="./ancestor::span[@class] and ./ancestor::span[(string-length(@class) &gt; 0)]">-->
    <xsl:if test="(string-length($cstyle) > 0)">
     <xsl:element name="w:rStyle">
      <xsl:attribute name="w:val" select="$cstyle"/>
     </xsl:element>
    </xsl:if>
    <xsl:call-template name="apply-nested-character-formatting">
     <xsl:with-param name="rPr_Default">
      <xsl:copy-of select="$rPr_Default"/>
     </xsl:with-param>
    </xsl:call-template>
    <xsl:if test="./ancestor::*[@data-change = 'changestyle']">
     <xsl:element name="w:rPrChange">
      <xsl:attribute name="w:id">
       <xsl:number level="any"/>
      </xsl:attribute>

     </xsl:element>
    </xsl:if>
   </xsl:element>
   <xsl:choose>
    <xsl:when test="ancestor::del">
     <xsl:element name="w:delText">
      <xsl:attribute name="xml:space" select="'preserve'"/>
      <xsl:value-of select="."/>
     </xsl:element>
    </xsl:when>
    <xsl:otherwise>
     <xsl:element name="w:t">
      <xsl:attribute name="xml:space" select="'preserve'"/>
      <xsl:value-of select="."/>
     </xsl:element>
    </xsl:otherwise>
   </xsl:choose>
   <!--<xsl:element name="w:t">
    <xsl:attribute name="xml:space" select="'preserve'"/>
    <xsl:value-of select="."/>
   </xsl:element>-->
  </xsl:element>
  <!---->
 </xsl:template>

 <xsl:template match="ins">
  <xsl:param name="pPr_Default"/>
  <xsl:param name="rPr_Default"/>
  <xsl:choose>
   <xsl:when test="ancestor::del | ancestor::ins">
    <xsl:apply-templates>
     <xsl:with-param name="pPr_Default">
      <xsl:copy-of select="$pPr_Default"/>
     </xsl:with-param>
     <xsl:with-param name="rPr_Default">
      <xsl:copy-of select="$rPr_Default"/>
     </xsl:with-param>
    </xsl:apply-templates>
   </xsl:when>
   <xsl:otherwise>
    <xsl:element name="w:ins">
     <xsl:attribute name="w:id">
      <xsl:number level="any"/>
     </xsl:attribute>
     <xsl:attribute name="w:author" select="@data-username"/>
     <!--     <xsl:attribute name="w:date" select="@datetime"/>-->
     <!--  <xsl:apply-templates/>-->
     <xsl:apply-templates>
      <xsl:with-param name="pPr_Default">
       <xsl:copy-of select="$pPr_Default"/>
      </xsl:with-param>
      <xsl:with-param name="rPr_Default">
       <xsl:copy-of select="$rPr_Default"/>
      </xsl:with-param>
     </xsl:apply-templates>
    </xsl:element>
   </xsl:otherwise>
  </xsl:choose>

 </xsl:template>

 <xsl:template match="del">
  <xsl:param name="pPr_Default"/>
  <xsl:param name="rPr_Default"/>
  <xsl:choose>
   <xsl:when test="ancestor::del | ancestor::ins">
    <xsl:apply-templates>
     <xsl:with-param name="pPr_Default">
      <xsl:copy-of select="$pPr_Default"/>
     </xsl:with-param>
     <xsl:with-param name="rPr_Default">
      <xsl:copy-of select="$rPr_Default"/>
     </xsl:with-param>
    </xsl:apply-templates>
   </xsl:when>
   <xsl:otherwise>
    <xsl:element name="w:del">
     <xsl:attribute name="w:id">
      <xsl:number level="any"/>
     </xsl:attribute>
     <xsl:attribute name="w:author" select="@data-username"/>
     <!--<xsl:attribute name="w:date" select="@datetime"/>-->
     <!--   <xsl:apply-templates/>-->
     <xsl:apply-templates>
      <xsl:with-param name="pPr_Default">
       <xsl:copy-of select="$pPr_Default"/>
      </xsl:with-param>
      <xsl:with-param name="rPr_Default">
       <xsl:copy-of select="$rPr_Default"/>
      </xsl:with-param>
     </xsl:apply-templates>
    </xsl:element>
   </xsl:otherwise>
  </xsl:choose>
 </xsl:template>


	<!-- XHTML nested character formatting -->
	<xsl:template name="apply-nested-character-formatting">
		<xsl:param name="rPr_Default"/>
		<!-- apply default character formatting first -->
		<xsl:copy-of select="$rPr_Default"/>
		<!-- incase the paragraph itself deleted or newly inserted  -->
		<xsl:if test="self::*/@itemname">
			<xsl:choose>
				<xsl:when test="self::*/@itemname = 'deleted'">
					<xsl:element name="w:del">
						<xsl:attribute name="w:id">
							<xsl:number level="any"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:when>
				<xsl:when test="self::*/@itemname = 'inserted'">
					<xsl:element name="w:ins">
						<xsl:attribute name="w:id">
							<xsl:number level="any"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:when>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="ancestor::font/@face or ancestor-or-self::*[contains(@style, 'font-family:')]">
			<xsl:choose>
				<xsl:when test="ancestor::font/@face">
					<xsl:element name="w:rFonts">
						<xsl:attribute name="w:ascii">
							<xsl:value-of select="ancestor::font/@face"/>
						</xsl:attribute>
						<xsl:attribute name="w:hAnsi">
							<xsl:value-of select="ancestor::font/@face"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:when>
				<xsl:when test="ancestor-or-self::*[contains(@style, 'font-family:')]">
					<xsl:variable name="font">
						<xsl:choose>
							<xsl:when
								test="contains(substring-after(ancestor-or-self::*[contains(@style, 'font-family:')][1]/@style, 'font-family:'), ';')">
								<!--<xsl:value-of select="substring-before(substring-after(ancestor-or-self::*[contains(@style,'font-family:')]/@style,'font-family:'),';')"/>-->
								<xsl:value-of
									select='substring-before(substring-after(ancestor-or-self::*[contains(@style, "font-family:")][1]/@style, "font-family:"), ";")'
								/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of
									select='substring-after(ancestor-or-self::*[contains(@style, "font-family:")][1]/@style, "font-family:")'
								/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="fontAttrName">
						<xsl:variable name="tempAttrName">
							<xsl:variable name="tempAttrNameVal">
								<xsl:choose>
									<xsl:when
										test="contains(substring-before(ancestor-or-self::*[contains(@style, '-font-family:')][1]/@style, '-font-family:'), ';')">									
										<xsl:value-of
											select='substring-after(substring-before(ancestor-or-self::*[contains(@style, "-font-family:")][1]/@style, "-font-family:"), ";")'
										/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select='substring-before(ancestor-or-self::*[contains(@style, "-font-family:")][1]/@style, "-font-family:")'
										/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:value-of select="replace($tempAttrNameVal,'mso-','')"/>
						</xsl:variable>
						<xsl:choose>
							<xsl:when test="string-length($tempAttrName) > 0">
<!--								example w:eastAsia-->
								
							 <!--to avoid font issues 24-5-2019-->
							 <xsl:choose>
							  <xsl:when test="contains($tempAttrName, 'fareast')">
							   
							   <xsl:value-of select="concat('w:','eastAsia' )"/>
							  </xsl:when>
							  <xsl:otherwise>
							   
							   <xsl:value-of select="concat('w:',normalize-space($tempAttrName))"/>
							  </xsl:otherwise>
							 </xsl:choose>
							 <!--End-->
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="'w:ascii'"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:element name="w:rFonts">
						<xsl:attribute name="{$fontAttrName}">
							<xsl:value-of select="$font"/>
						</xsl:attribute>
						<!--<xsl:attribute name="w:hAnsi">
							<xsl:value-of select="$font"/>
						</xsl:attribute>-->
					</xsl:element>
				</xsl:when>
			</xsl:choose>
		</xsl:if>
		<!--  or *[self::h1|self::h2|self::h3|self::h4|self::h5|self::h6|self::p|self::li] -->
		<xsl:variable name="fontWeight">
			<xsl:choose>
				<xsl:when
					test="contains(substring-after(ancestor-or-self::*[contains(@style, 'font-weight:')][1]/@style, 'font-weight:'), ';')">
					<xsl:value-of
						select='substring-before(substring-after(ancestor-or-self::*[contains(@style, "font-weight:")][1]/@style, "font-weight:"), ";")'
					/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of
						select='substring-after(ancestor-or-self::*[contains(@style, "font-weight:")][1]/@style, "font-weight:")'
					/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="fontStyle">
			<xsl:choose>
				<xsl:when
					test="contains(substring-after(ancestor-or-self::*[contains(@style, 'font-style:')][1]/@style, 'font-style:'), ';')">
					<xsl:value-of
						select='substring-before(substring-after(ancestor-or-self::*[contains(@style, "font-style:")][1]/@style, "font-style:"), ";")'
					/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of
						select='substring-after(ancestor-or-self::*[contains(@style, "font-style:")][1]/@style, "font-style:")'
					/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<!--	commenting this because shade and highlight in xhtml is using the same property to display	-->
		<!--<xsl:variable name="highlight">
			<xsl:choose>
				<xsl:when
					test="contains(substring-after(ancestor-or-self::*[contains(@style, 'background-color:')][1]/@style, 'background-color:'), ';')">
					<xsl:value-of
						select='substring-before(substring-after(ancestor-or-self::*[contains(@style, "background-color:")][1]/@style, "background-color:"), ";")'
					/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of
						select='substring-after(ancestor-or-self::*[contains(@style, "background-color:")][1]/@style, "background-color:")'
					/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:if test="string-length($highlight) > 0">
			<w:highlight w:val="{$highlight}"/>
		</xsl:if>-->
		<xsl:if test="ancestor::i or ancestor::em or $fontStyle = 'italic'">
			<xsl:element name="w:i"/>
		</xsl:if>
		<xsl:if test="ancestor::b or ancestor::strong or $fontWeight = 'bold'">
			<xsl:element name="w:b"/>
		</xsl:if>
		<xsl:if test="ancestor::u|ancestor::U">
			<xsl:element name="w:u">
				<xsl:attribute name="w:val" select="'single'"/>
			</xsl:element>
		</xsl:if>
		<xsl:if test="ancestor::strike | ancestor::s">
			<xsl:element name="w:strike"/>
		</xsl:if>
		<xsl:choose>
			<xsl:when
				test="ancestor-or-self::*[contains(@style, 'text-decoration: line-through double')][1]">
				<w:dstrike/>
			</xsl:when>
		</xsl:choose>
		<xsl:if test="ancestor-or-self::*[contains(@style, 'font-variant: small-caps')]">
			<w:smallCaps/>
		</xsl:if>
		<xsl:if test="ancestor-or-self::*[contains(@style, 'text-transform: uppercase')]">
			<w:caps/>
		</xsl:if>
		<xsl:if test="ancestor::sup">
			<xsl:element name="w:vertAlign">
				<xsl:attribute name="w:val" select="'superscript'"/>
			</xsl:element>
		</xsl:if>
		<xsl:if test="ancestor::sub">
			<xsl:element name="w:vertAlign">
				<xsl:attribute name="w:val" select="'subscript'"/>
			</xsl:element>
		</xsl:if>
		<xsl:if
		 test="ancestor::font/@color or ancestor-or-self::*[contains(@style, 'color:#') or contains(@style, 'color: #')][not(contains(@style, 'background-color:#') or contains(@style, 'background-color: #'))]">
			<xsl:variable name="color">
				<xsl:choose>
					<xsl:when test="ancestor::font/@color">
						<xsl:value-of select="ancestor::font/@color"/>
					</xsl:when>
					<xsl:when
						test="ancestor-or-self::*[contains(@style, 'color:#') or contains(@style, 'color: #')]">
						<xsl:variable name="font">
							<xsl:choose>
								<xsl:when
									test="contains(substring-after(ancestor-or-self::*[contains(@style, 'color:#')][1]/@style, 'color:#'), ';')">
									<xsl:value-of
										select='substring-before(substring-after(ancestor-or-self::*[contains(@style, "color:#")][1]/@style, "color:#"), ";")'
									/>
								</xsl:when>
								<xsl:when
									test="contains(substring-after(ancestor-or-self::*[contains(@style, 'color: #')][1]/@style, 'color: #'), ';')">
									<xsl:value-of
										select='substring-before(substring-after(ancestor-or-self::*[contains(@style, "color: #")][1]/@style, "color: #"), ";")'
									/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:if
										test="ancestor-or-self::*[contains(@style, 'color:#')][1]">
										<xsl:value-of
											select='substring-after(ancestor-or-self::*[contains(@style, "color:#")][1]/@style, "color:#")'
										/>
									</xsl:if>
									<xsl:if
										test="ancestor-or-self::*[contains(@style, 'color: #')][1]">
										<xsl:value-of
											select='substring-after(ancestor-or-self::*[contains(@style, "color: #")][1]/@style, "color: #")'
										/>
									</xsl:if>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:value-of select="$font"/>
					</xsl:when>
				</xsl:choose>
			</xsl:variable>
			<xsl:element name=" w:color">
				<xsl:attribute name="w:val">
					<xsl:value-of select="$color"/>
				</xsl:attribute>
			</xsl:element>
		</xsl:if>
		<xsl:if test="ancestor-or-self::*[contains(lower-case(@style), 'background-color:') or contains(lower-case(@style), 'background:')]">
			<xsl:variable name="styleProp" select="replace(ancestor-or-self::*[contains(lower-case(@style), 'background-color:') or contains(lower-case(@style), 'background:')][1]/lower-case(@style),' ','')"/>
			<xsl:variable name="bgC">
				<xsl:choose>
					<xsl:when test="contains(lower-case($styleProp), 'background-color:#') or contains(lower-case($styleProp), 'background:#')">
						<xsl:choose>
							<xsl:when test="contains($styleProp, ';')">
								
								<!--<xsl:value-of
									select="substring-before(substring-after($styleProp, 'background-color:#'), ';')"/>
								<xsl:value-of select="substring-before(substring-after($styleProp, 'background:#'), ';')"/>-->
							 <xsl:variable name="Val1">
							  <xsl:value-of
							   select="substring-after($styleProp, 'background-color:#')"/>
							 </xsl:variable>
							 <xsl:variable name="Val2">
							  <xsl:value-of select="substring-after($styleProp, 'background:#')"/>
							 </xsl:variable>
							 <xsl:choose>
							  <xsl:when test="contains($Val1,';') or contains($Val2,';')">
							   <xsl:value-of select="substring-before($Val1,';')"/>
							   <xsl:value-of select="substring-before($Val2,';')"/>
							  </xsl:when>
							  <xsl:otherwise>
							   <xsl:value-of select="$Val1"/>
							   <xsl:value-of select="$Val2"/>
							  </xsl:otherwise>
							 </xsl:choose>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="substring-after($styleProp, 'background-color:#')"/>
								<xsl:value-of select="substring-after($styleProp, 'background:#')"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<xsl:variable name="tempVal">
							<xsl:choose>
								<xsl:when test="contains($styleProp, ';')">
									<!--<xsl:value-of
										select="substring-before(substring-after($styleProp, 'background-color:'), ';')"/>
									<xsl:value-of select="substring-before(substring-after($styleProp, 'background:'), ';')"/>-->
								 <xsl:variable name="Val1">
								  <xsl:value-of
								   select="substring-after($styleProp, 'background-color:')"/>
								 </xsl:variable>
								 <xsl:variable name="Val2">
								  <xsl:value-of select="substring-after($styleProp, 'background:')"/>
								 </xsl:variable>
								 <xsl:choose>
								  <xsl:when test="contains($Val1,';') or contains($Val2,';')">
								   <xsl:value-of select="substring-before($Val1,';')"/>
								   <xsl:value-of select="substring-before($Val2,';')"/>
								  </xsl:when>
								  <xsl:otherwise>
								   <xsl:value-of select="$Val1"/>
								   <xsl:value-of select="$Val2"/>
								  </xsl:otherwise>
								 </xsl:choose>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="substring-after($styleProp, 'background-color:')"/>
									<xsl:value-of select="substring-after($styleProp, 'background:')"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:call-template name="color">
							<xsl:with-param name="colorVal" select="$tempVal"></xsl:with-param>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			
			<xsl:element name="w:shd">
				<xsl:attribute name="w:val" select="'clear'"/>
				<xsl:attribute name="w:color" select="'auto'"/>
				<xsl:attribute name="w:fill">
					<xsl:value-of select="$bgC"/>
				</xsl:attribute>
			</xsl:element>
		</xsl:if>
		<xsl:if test="ancestor::font/@size or ancestor-or-self::*[contains(@style, 'font-size:')]">
			<xsl:element name="w:sz">
				<xsl:attribute name="w:val">
					<xsl:choose>
						<xsl:when test="ancestor::font/@size = 1">16</xsl:when>
						<xsl:when test="ancestor::font/@size = 2">20</xsl:when>
						<xsl:when test="ancestor::font/@size = 3">24</xsl:when>
						<xsl:when test="ancestor::font/@size = 4">28</xsl:when>
						<xsl:when test="ancestor::font/@size = 5">36</xsl:when>
						<xsl:when test="ancestor::font/@size = 6">48</xsl:when>
						<xsl:when test="ancestor::font/@size = 7">72</xsl:when>
						<xsl:when test="ancestor-or-self::*[contains(@style, 'font-size:')]">
							<xsl:variable name="font">
								<xsl:choose>
									<xsl:when
										test="contains(substring-after(ancestor-or-self::*[contains(@style, 'font-size:')][1]/@style, 'font-size:'), ';')">
										<!--<xsl:value-of select="substring-before(substring-after(.[ancestor::span|self::h1|self::h2|self::h3|self::h4|self::h5|self::h6|self::p|self::li][contains(@style,'font-family:')]/@style,'font-family:'),';')"/>-->
										<xsl:value-of
											select='substring-before(substring-after(ancestor-or-self::*[contains(@style, "font-size:")][1]/@style, "font-size:"), ";")'
										/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select='substring-after(ancestor-or-self::*[contains(@style, "font-size:")][1]/@style, "font-size:")'
										/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:choose>
								<xsl:when test="starts-with(lower-case($font),'nan')">
									<xsl:value-of select="'10pt'"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="$font"/>
								</xsl:otherwise>
							</xsl:choose>
							
						</xsl:when>
					</xsl:choose>
				</xsl:attribute>
			</xsl:element>
		</xsl:if>
		<!--<xsl:if test="ancestor-or-self::*[@style][1]/@style">
			<xsl:call-template name="apply-font-style-definition">
				<xsl:with-param name="instyle">
					<xsl:value-of select="ancestor-or-self::*[@style][1]/@style"/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:if>-->
	</xsl:template>
	<!-- XHTML style formatting -->
	<xsl:template name="apply-font-style-definition">
		<xsl:param name="instyle"/>
		<xsl:if test="contains(lower-case($instyle), 'background-color:')">
			<xsl:variable name="bgC">
				<xsl:choose>
					<xsl:when test="contains(lower-case($instyle), 'background-color: #')">
						<xsl:choose>
							<xsl:when test="contains($instyle, ';')">
								<!--<xsl:value-of
									select="substring-before(substring-after($instyle, 'background-color: #'), ';')"/>-->
							 <xsl:variable name="Val1">
							  <xsl:value-of
							   select="substring-after($instyle, 'background-color: #')"/>
							 </xsl:variable>
							 <xsl:choose>
							  <xsl:when test="contains($Val1,';')">
							   <xsl:value-of select="substring-before($Val1,';')"/>
							  </xsl:when>
							  <xsl:otherwise>
							   <xsl:value-of select="$Val1"/>
							  </xsl:otherwise>
							 </xsl:choose>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="substring-after($instyle, 'background-color: #')"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<xsl:variable name="tempVal">
							<xsl:choose>
								<xsl:when test="contains($instyle, ';')">
									<!--<xsl:value-of
										select="substring-before(substring-after($instyle, 'background-color:'), ';')"/>-->
								 <xsl:variable name="Val1"><xsl:value-of
								  select="substring-after($instyle, 'background-color:')"/></xsl:variable>
								 <xsl:choose>
								  <xsl:when test="contains($Val1,';')">
								   <xsl:value-of select="substring-before($Val1, ';')"/>
								  </xsl:when>
								  <xsl:otherwise>
								   <xsl:value-of select="$Val1"/>
								  </xsl:otherwise>
								 </xsl:choose>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="substring-after($instyle, 'background-color:')"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:call-template name="color">
							<xsl:with-param name="colorVal" select="replace($tempVal,' ','')"></xsl:with-param>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:element name="w:shd">
				<xsl:attribute name="w:val" select="'clear'"/>
				<xsl:attribute name="w:color" select="'auto'"/>
				<xsl:attribute name="w:fill">
					<xsl:value-of select="$bgC"/>
				</xsl:attribute>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<!-- XHTML paragraph formatting -->
	<xsl:template name="apply-paragraph-formatting">
		<xsl:param name="pPr_Default"/>
		<!-- apply default paragraph formatting first -->
		<xsl:copy-of select="$pPr_Default"/>
		<xsl:if
			test="self::*[contains(@style, 'text-indent:') or contains(@style, 'margin-left:') or contains(@style, 'margin-right:')]">
			<xsl:variable name="firstLine">
				<xsl:choose>
					<xsl:when
						test="contains(substring-after(self::*[contains(@style, 'text-indent:')][1]/@style, 'text-indent:'), ';')">
						<xsl:value-of
							select='substring-before(substring-after(self::*[contains(@style, "text-indent:")][1]/@style, "text-indent:"), ";")'
						/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of
							select='substring-after(self::*[contains(@style, "text-align:")][1]/@style, "text-indent:")'
						/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="left">
				<xsl:choose>
					<xsl:when
						test="contains(substring-after(self::*[contains(@style, 'margin-left:')][1]/@style, 'margin-left:'), ';')">
						<xsl:value-of
							select='substring-before(substring-after(self::*[contains(@style, "margin-left:")][1]/@style, "margin-left:"), ";")'
						/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of
							select='substring-after(self::*[contains(@style, "margin-left:")][1]/@style, "margin-left:")'
						/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="right">
				<xsl:choose>
					<xsl:when
						test="contains(substring-after(self::*[contains(@style, 'margin-right:')][1]/@style, 'margin-right:'), ';')">
						<xsl:value-of
							select='substring-before(substring-after(self::*[contains(@style, "margin-right:")][1]/@style, "margin-right:"), ";")'
						/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of
							select='substring-after(self::*[contains(@style, "margin-right:")][1]/@style, "margin-right:")'
						/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:element name="w:ind">
				<xsl:if test="string-length($firstLine) > 0 and matches($firstLine, '[0-9]+')">
					<xsl:variable name="tempVal" select="replace($firstLine, 'pt', '')"/>
					<xsl:attribute name="w:firstLine" select="number($tempVal) * 20"/>
				</xsl:if>
				<xsl:if test="string-length($left) > 0 and matches($left, '[0-9]+')">
					<xsl:variable name="tempVal" select="replace($left, 'pt', '')"/>
					<xsl:attribute name="w:left" select="number($tempVal) * 20"/>
				</xsl:if>
				<xsl:if test="string-length($right) > 0 and matches($right, '[0-9]+')">
					<xsl:variable name="tempVal" select="replace($right, 'pt', '')"/>
					<xsl:attribute name="w:right" select="number($tempVal) * 20"/>
				</xsl:if>
			</xsl:element>
		</xsl:if>
		<xsl:if test="@align or self::*[contains(@style, 'text-align:')]">
			<xsl:variable name="font">
				<xsl:choose>
					<xsl:when test="@align">
						<xsl:choose>
							<xsl:when test="@align = 'justify'">
								<xsl:value-of select="'both'"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="@align"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:when
						test="contains(substring-after(self::*[contains(@style, 'text-align:')][1]/@style, 'text-align:'), ';')">
						<!--<xsl:value-of select="substring-before(substring-after(ancestor::span[contains(@style,'font-family:')]/@style,'font-family:'),';')"/>-->
						<xsl:value-of
							select='substring-before(substring-after(self::*[contains(@style, "text-align:")][1]/@style, "text-align:"), ";")'
						/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of
							select='substring-after(self::*[contains(@style, "text-align:")][1]/@style, "text-align:")'
						/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:element name="w:jc">
				<xsl:attribute name="w:val" select="$font"/>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	
 <xsl:variable name="hex">0123456789ABCDEF</xsl:variable>
 <xsl:template name="color">
  <xsl:param name="colorVal"/>
  <xsl:variable name="col">
   <xsl:variable name="col1">
    <xsl:value-of select="replace(replace($colorVal, '^rgb\(', ''), '\)$', '')"/>
   </xsl:variable>
   <xsl:value-of select="replace(replace($col1, '^rgba\(', ''), '\)$', '')"/>
  </xsl:variable>

  <xsl:if
   test="starts-with($colorVal, 'rgb(') and ends-with($colorVal, ')') or starts-with($colorVal, 'rgba(') and ends-with($colorVal, ')')">
   <xsl:variable name="RGB" as="xs:string*" select="tokenize($col, ',')"/>

   <xsl:variable name="R" select="number($RGB[1])"/>
   <xsl:variable name="G" select="number($RGB[2])"/>
   <xsl:variable name="B" select="number($RGB[3])"/>



   <xsl:variable name="R1">
    <xsl:variable name="hex-digit1" select="substring($hex, floor($R div 16) + 1, 1)"/>
    <xsl:variable name="hex-digit2" select="substring($hex, $R mod 16 + 1, 1)"/>
    <xsl:value-of select="concat($hex-digit1, $hex-digit2)"/>
   </xsl:variable>
   <xsl:variable name="G1">
    <xsl:variable name="hex-digit1" select="substring($hex, floor($G div 16) + 1, 1)"/>
    <xsl:variable name="hex-digit2" select="substring($hex, $G mod 16 + 1, 1)"/>
    <xsl:value-of select="concat($hex-digit1, $hex-digit2)"/>
   </xsl:variable>
   <xsl:variable name="B1">
    <xsl:variable name="hex-digit1" select="substring($hex, floor($B div 16) + 1, 1)"/>
    <xsl:variable name="hex-digit2" select="substring($hex, $B mod 16 + 1, 1)"/>
    <xsl:value-of select="concat($hex-digit1, $hex-digit2)"/>
   </xsl:variable>

   <xsl:choose>
    <!--   Checking whether the color value is white -->
    <xsl:when
     test="($R > 229 and $R &lt;= 255) and ($G > 229 and $G &lt;= 255) and ($B > 229 and $B &lt;= 255)">
     <!--<xsl:element name="w:color">
                        <xsl:attribute name="w:val" select="'000000'"/>
                    </xsl:element>-->
     <xsl:value-of select="'000000'"/>
    </xsl:when>
    <xsl:otherwise>
     <!--<xsl:element name="w:color">
                        <xsl:attribute name="w:val" select="concat($Rhex,$Ghex,$Bhex)"/>
                    </xsl:element>-->
     <xsl:value-of select="concat($R1, $G1, $B1)"/>
    </xsl:otherwise>
   </xsl:choose>
  </xsl:if>
 </xsl:template>
 <!--<xsl:template match="span[@data-commentgroup]">
  <xsl:if test="following::img[@data-comment | @data-commentimg][not(ancestor::*[@data-change = 'commentdeleted'])] | following::span[@data-comment | @data-commentimg][not(ancestor::*[@data-change = 'commentdeleted'])]">
   
   <xsl:if test="following::*[@cmtId = 'true']">
    
    <xsl:element name="w:r">
     <xsl:element name="w:commentReference">
      <xsl:attribute name="w:id">
       <xsl:number level="any" count="span[@data-commentgroup]"/>
      </xsl:attribute>
     </xsl:element>
    </xsl:element>
   </xsl:if>
  </xsl:if>
 </xsl:template>	-->
 </xsl:stylesheet>
