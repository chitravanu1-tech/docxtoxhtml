<xsl:stylesheet version="2.0" xmlns:mml="http://www.w3.org/1998/Math/MathML" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math"
    xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"
    xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml"
    xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing"
    xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main"
    xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing"
    xmlns:w15="http://schemas.microsoft.com/office/word/2012/wordml"
    xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
    xmlns:sl="http://schemas.openxmlformats.org/schemaLibrary/2006/main"
    xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml"
    xmlns:c="http://schemas.openxmlformats.org/drawingml/2006/chart"
    xmlns:cdr="http://schemas.openxmlformats.org/drawingml/2006/chartDrawing"
    xmlns:c14="http://schemas.microsoft.com/office/drawing/2007/8/2/chart"
    xmlns:dgm="http://schemas.openxmlformats.org/drawingml/2006/diagram"
    xmlns:pic="http://schemas.openxmlformats.org/drawingml/2006/picture"
    xmlns:xdr="http://schemas.openxmlformats.org/drawingml/2006/spreadsheetDrawing"
    xmlns:dsp="http://schemas.microsoft.com/office/drawing/2008/diagram"
    xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:v="urn:schemas-microsoft-com:vml"
    xmlns:xvml="urn:schemas-microsoft-com:office:excel"
    xmlns:w10="urn:schemas-microsoft-com:office:word"
    xmlns:pvml="urn:schemas-microsoft-com:office:powerpoint"
    xmlns:cppr="http://schemas.microsoft.com/office/2006/coverPageProps"
    xmlns:odx="http://opendope.org/xpaths" xmlns:odc="http://opendope.org/conditions"
    xmlns:odq="http://opendope.org/questions" xmlns:oda="http://opendope.org/answers"
    xmlns:odi="http://opendope.org/components"
    xmlns:odgm="http://opendope.org/SmartArt/DataHierarchy"
    xmlns:b="http://schemas.openxmlformats.org/officeDocument/2006/bibliography"
    xmlns:w16se="http://schemas.microsoft.com/office/word/2015/wordml/symex"
    xmlns:w16cid="http://schemas.microsoft.com/office/word/2016/wordml/cid"
    xmlns:wetp="http://schemas.microsoft.com/office/webextensions/taskpanes/2010/11"
    xmlns:we="http://schemas.microsoft.com/office/webextensions/webextension/2010/11"
    xmlns:comp="http://schemas.openxmlformats.org/drawingml/2006/compatibility"
    xmlns:lc="http://schemas.openxmlformats.org/drawingml/2006/lockedCanvas"
    xmlns:a16="http://schemas.microsoft.com/office/drawing/2014/main" 
    xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape"
    xmlns:a14="http://schemas.microsoft.com/office/drawing/2010/main">
    <!--<xsl:output method="xml" encoding="utf-8" use-character-maps="Ascii2Unicode" omit-xml-declaration="yes" indent="no"/>-->
    <xsl:output indent="no" method="xml" use-character-maps="Ascii2Unicode" omit-xml-declaration="yes"/>
    <!-- Last update 07-Feb-18 -->
    <!-- Last update 15-May-18: Removed the namespaces, which cause xmlns name space in the HTMl root tag, hence the data-split attrib will not apply in the 03-Final.xslt -->
    <!-- 23-APR-19 last update for Namespace added  
    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math"
    xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"
    xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml"
    xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing"
    xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main"
    xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing"
    xmlns:w15="http://schemas.microsoft.com/office/word/2012/wordml"
    xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
    xmlns:sl="http://schemas.openxmlformats.org/schemaLibrary/2006/main"
    xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml"
    xmlns:c="http://schemas.openxmlformats.org/drawingml/2006/chart"
    xmlns:cdr="http://schemas.openxmlformats.org/drawingml/2006/chartDrawing"
    xmlns:c14="http://schemas.microsoft.com/office/drawing/2007/8/2/chart"
    xmlns:dgm="http://schemas.openxmlformats.org/drawingml/2006/diagram"
    xmlns:pic="http://schemas.openxmlformats.org/drawingml/2006/picture"
    xmlns:xdr="http://schemas.openxmlformats.org/drawingml/2006/spreadsheetDrawing"
    xmlns:dsp="http://schemas.microsoft.com/office/drawing/2008/diagram"
    xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:v="urn:schemas-microsoft-com:vml"
    xmlns:xvml="urn:schemas-microsoft-com:office:excel"
    xmlns:w10="urn:schemas-microsoft-com:office:word"
    xmlns:pvml="urn:schemas-microsoft-com:office:powerpoint"
    xmlns:cppr="http://schemas.microsoft.com/office/2006/coverPageProps"
    xmlns:odx="http://opendope.org/xpaths" xmlns:odc="http://opendope.org/conditions"
    xmlns:odq="http://opendope.org/questions" xmlns:oda="http://opendope.org/answers"
    xmlns:odi="http://opendope.org/components"
    xmlns:odgm="http://opendope.org/SmartArt/DataHierarchy"
    xmlns:b="http://schemas.openxmlformats.org/officeDocument/2006/bibliography"
    xmlns:w16se="http://schemas.microsoft.com/office/word/2015/wordml/symex"
    xmlns:w16cid="http://schemas.microsoft.com/office/word/2016/wordml/cid"
    xmlns:wetp="http://schemas.microsoft.com/office/webextensions/taskpanes/2010/11"
    xmlns:we="http://schemas.microsoft.com/office/webextensions/webextension/2010/11"
    xmlns:comp="http://schemas.openxmlformats.org/drawingml/2006/compatibility"
    xmlns:lc="http://schemas.openxmlformats.org/drawingml/2006/lockedCanvas"
    xmlns:a14="http://schemas.microsoft.com/office/drawing/2010/main" -->
  <xsl:preserve-space elements="*"/>
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
  
  
  <xsl:template match="*">
   <xsl:element name="{name()}">
     <xsl:apply-templates select="@*"/>
     <xsl:apply-templates/>
   </xsl:element>
  </xsl:template>
  
  
  
  <xsl:character-map name="Ascii2Unicode">
<xsl:output-character character=" " string=" "/>
<xsl:output-character character="᠎" string=" "/>
<xsl:output-character character=" " string=" "/>
<xsl:output-character character=" " string=" "/>
<xsl:output-character character=" " string=" "/>
<xsl:output-character character=" " string=" "/>
<xsl:output-character character=" " string=" "/>
<xsl:output-character character=" " string=" "/>
<xsl:output-character character=" " string=" "/>
<xsl:output-character character=" " string=" "/>
<xsl:output-character character=" " string=" "/>
<xsl:output-character character=" " string=" "/>
<xsl:output-character character=" " string=" "/>
<xsl:output-character character="​" string=" "/>
<xsl:output-character character=" " string=" "/>
<xsl:output-character character=" " string=" "/>
<xsl:output-character character="　" string=" "/>
<xsl:output-character character="﻿" string=" "/>
<xsl:output-character character="⁠" string=" "/>
<xsl:output-character character=" " string=" "/>


  </xsl:character-map>
  
<!-- To Remove white spaces, empty line breaks, trailing spaces -->
  <!--<xsl:template match="*/text()[normalize-space()]">
      <xsl:value-of select="normalize-space()"/>
  </xsl:template>
  <xsl:template match="*/text()[not(normalize-space())]"></xsl:template>
    <xsl:preserve-space elements="*"/>    -->
<!-- To Remove white spaces, empty line breaks, trailing spaces -->

</xsl:stylesheet>
