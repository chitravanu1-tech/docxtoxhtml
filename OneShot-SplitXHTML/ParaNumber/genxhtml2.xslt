<!-- Added on 20-Sep-17, to preserve whitespace -->
<!-- 22-JUNE-18: Added instruction taken from https://www.w3schools.com/tags/tag_meta.asp -->
<!-- My called TEMPLATES from CK -->
<!--<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf" exclude-result-prefixes="xs mf" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" version="2.0">-->
<!-- Added for marriapan edior on 22-02-2022 -->
<!-- commented for listtype Renumbering on 8-12-2023 Azure 1552 -->
<!-- commented for cicerone Azure 14681 on 14-05-2024 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf" exclude-result-prefixes="xs mf" 
    xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
    xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"
    xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" xmlns:v="urn:schemas-microsoft-com:vml"
    xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing" xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" 
    xmlns:w10="urn:schemas-microsoft-com:office:word" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml" xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup" 
    xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk" xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml"
    xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" 
    xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape" version="2.0">
   
    <xsl:strip-space elements="*"/>
    <xsl:preserve-space elements="*"/>
    
    <!--<xsl:output method="xml" use-character-maps="Ascii2Unicode" xml:space="preserve" encoding="UTF-8" indent="yes" name="xml"/>-->
    <xsl:output use-character-maps="Ascii2Unicode" method="xml" omit-xml-declaration="yes"/>
  <xsl:variable name="filename" select="substring-before(tokenize(base-uri(.), '/')[last()],'.')"/>
  <!-- Added for Saravanan 16-Aug-17 -->
  <xsl:param name="xmlversion"/>
  <xsl:param name="idmlversion"/>
  <xsl:param name="inddversion"/>
  <!--<xsl:param name="xmlversion" select="10"/>
  <xsl:param name="idmlversion" select="20"/>
  <xsl:param name="inddversion" select="30"/>-->
  <!-- Added for Saravanan 16-Aug-17 END-->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="document">
        <xsl:text>&#x000A;</xsl:text>
        <xsl:element name="html">
          <xsl:text>&#x000A;</xsl:text>
          <xsl:element name="head">
            <xsl:text>&#x000A;</xsl:text>        
            <xsl:text disable-output-escaping="yes">&lt;meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/&gt;</xsl:text><xsl:text>&#x000A;</xsl:text>
            <!--22-JUNE-18: <xsl:text disable-output-escaping="yes">&lt;meta name="Generator" content="Microsoft Word 14 (filtered)"/&gt;</xsl:text><xsl:text>&#x000A;</xsl:text>-->
            
            
<!-- 22-JUNE-18: Added instruction taken from https://www.w3schools.com/tags/tag_meta.asp -->
<!--<xsl:text disable-output-escaping="yes">&lt;meta name="viewport" content="width=device-width, initial-scale=1.0"/&gt;</xsl:text><xsl:text>&#x000A;</xsl:text>-->
            
            <!-- Added for Saravanan 16-Aug-17 -->
            <xsl:if test="string-length($xmlversion) > 0 or string-length($idmlversion) > 0 or string-length($inddversion) > 0">
              <xsl:text disable-output-escaping="yes">&lt;meta</xsl:text>        
              <xsl:if test="string-length($xmlversion) > 0">
                <xsl:text disable-output-escaping="yes"> data-xmlversion="</xsl:text>
                <xsl:value-of select="$xmlversion"/>          
              </xsl:if>
              <xsl:if test="string-length($idmlversion) > 0">
                <xsl:text disable-output-escaping="yes">" data-idmlversion="</xsl:text>
                <xsl:value-of select="$idmlversion"/>
              </xsl:if>
              <xsl:if test="string-length($inddversion) > 0">
                <xsl:text disable-output-escaping="yes">" data-inddversion="</xsl:text>
                <xsl:value-of select="$inddversion"/>
                
              </xsl:if>
              <xsl:text disable-output-escaping="yes">"/&gt;</xsl:text><xsl:text>&#x000A;</xsl:text>
            </xsl:if>
            <!-- Added for Saravanan 16-Aug-17 END-->
            <xsl:element name="style">
              <xsl:text>&#x000A;</xsl:text>
                                
                                
             
<!-- Defining CSS Styles -->
         <!-- <xsl:for-each select="//w:style">
                    
          </xsl:for-each>-->
              <xsl:apply-templates select="//w:style"></xsl:apply-templates>
          
              <xsl:text disable-output-escaping="yes">	a.action_link</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">{text-decoration: none;}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <!-- 03-May-17 added for list ) format -->
              <xsl:text disable-output-escaping="yes">ol.step {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-reset: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">text-indent: -0.8em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.step > li {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <!-- commented for listtype Renumbering on 8-12-2023 Azure 1552 -->
              <!--<xsl:text disable-output-escaping="yes">list-style: none;</xsl:text><xsl:text>&#x000A;</xsl:text>-->
              <xsl:text disable-output-escaping="yes">/*position:relative;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.step > li:before {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-increment: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">content: "Step " counter(list) ":";</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">/*position: absolute;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">margin-left: -1.4em;text-indent: -1.4em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              
              
              
              <xsl:text disable-output-escaping="yes">ol.closeParen {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-reset: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">text-indent: -0.8em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.closeParen > li {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <!--<xsl:text disable-output-escaping="yes">list-style: none;</xsl:text><xsl:text>&#x000A;</xsl:text>-->
              <xsl:text disable-output-escaping="yes">/*position:relative;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.closeParen > li:before {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-increment: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">content: counter(list) ") ";</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">/*position: absolute;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">margin-left: -1.4em;text-indent: -1.4em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              
              <xsl:text disable-output-escaping="yes">ol.openParen {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-reset: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">text-indent: -0.8em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.openParen > li {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <!--<xsl:text disable-output-escaping="yes">list-style: none;</xsl:text><xsl:text>&#x000A;</xsl:text>-->
              <xsl:text disable-output-escaping="yes">/*position:relative;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.openParen > li:before {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-increment: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">content: "(" counter(list) "";</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">/*position: absolute;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">margin-left: -1.4em;text-indent: -1.4em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              
              <xsl:text disable-output-escaping="yes">ol.openSParen {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-reset: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">text-indent: -0.8em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.openSParen > li {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <!--<xsl:text disable-output-escaping="yes">list-style: none;</xsl:text><xsl:text>&#x000A;</xsl:text>-->
              <xsl:text disable-output-escaping="yes">/*position:relative;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.openSParen > li:before {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-increment: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">content: "[" counter(list) "";</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">/*position: absolute;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">margin-left: -1.4em;text-indent: -1.4em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              
              <xsl:text disable-output-escaping="yes">ol.closeSParen {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-reset: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">text-indent: -0.8em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.closeSParen > li {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <!--<xsl:text disable-output-escaping="yes">list-style: none;</xsl:text><xsl:text>&#x000A;</xsl:text>-->
              <xsl:text disable-output-escaping="yes">/*position:relative;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.closeSParen > li:before {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-increment: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">content: counter(list) "] ";</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">/*position: absolute;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">margin-left: -1.4em;text-indent: -1.4em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              
              <xsl:text disable-output-escaping="yes">ol.opencloseSParen {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-reset: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">text-indent: -0.8em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.opencloseSParen > li {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <!--<xsl:text disable-output-escaping="yes">list-style: none;</xsl:text><xsl:text>&#x000A;</xsl:text>-->
              <xsl:text disable-output-escaping="yes">/*position:relative;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.opencloseSParen > li:before {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-increment: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">content: "[" counter(list) "] ";</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">/*position: absolute;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">margin-left: -1.4em;text-indent: -1.4em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              
              <xsl:text disable-output-escaping="yes">ol.opencloseParen {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-reset: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">text-indent: -0.8em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.opencloseParen > li {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <!--<xsl:text disable-output-escaping="yes">list-style: none;</xsl:text><xsl:text>&#x000A;</xsl:text>-->
              <xsl:text disable-output-escaping="yes">/*position:relative;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.opencloseParen > li:before {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-increment: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">content: "(" counter(list) ") ";</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">/*position: absolute;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">margin-left: -1.4em;text-indent: -1.4em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <!-- Added on 24-nov-17 -->
              <xsl:text disable-output-escaping="yes">ol.closeParen-a {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-reset: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">text-indent: -0.8em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.closeParen-a > li {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <!--<xsl:text disable-output-escaping="yes">list-style: none;</xsl:text><xsl:text>&#x000A;</xsl:text>-->
              <xsl:text disable-output-escaping="yes">/*position:relative;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.closeParen-a > li:before {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-increment: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">content: counter(list,lower-alpha) ") ";</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">/*position: absolute;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">margin-left: -1.4em;text-indent: -1.4em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              
              
              <xsl:text disable-output-escaping="yes">ol.openParen-a {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-reset: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">text-indent: -0.8em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.openParen-a > li {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <!--<xsl:text disable-output-escaping="yes">list-style: none;</xsl:text><xsl:text>&#x000A;</xsl:text>-->
              <xsl:text disable-output-escaping="yes">/*position:relative;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.openParen-a > li:before {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-increment: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">content: "(" counter(list,lower-alpha) "";</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">/*position: absolute;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">margin-left: -1.4em;text-indent: -1.4em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              
              <xsl:text disable-output-escaping="yes">ol.openSParen-a {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-reset: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">text-indent: -0.8em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.openSParen-a > li {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <!--<xsl:text disable-output-escaping="yes">list-style: none;</xsl:text><xsl:text>&#x000A;</xsl:text>-->
              <xsl:text disable-output-escaping="yes">/*position:relative;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.openSParen-a > li:before {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-increment: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">content: "[" counter(list,lower-alpha) "";</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">/*position: absolute;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">margin-left: -1.4em;text-indent: -1.4em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              
              <xsl:text disable-output-escaping="yes">ol.closeSParen-a {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-reset: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">text-indent: -0.8em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.closeSParen-a > li {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <!--<xsl:text disable-output-escaping="yes">list-style: none;</xsl:text><xsl:text>&#x000A;</xsl:text>-->
              <xsl:text disable-output-escaping="yes">/*position:relative;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.closeSParen-a > li:before {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-increment: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">content: counter(list,lower-alpha) "] ";</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">/*position: absolute;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">margin-left: -1.4em;text-indent: -1.4em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              
              <xsl:text disable-output-escaping="yes">ol.opencloseSParen-a {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-reset: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">text-indent: -0.8em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.opencloseSParen-a > li {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <!--<xsl:text disable-output-escaping="yes">list-style: none;</xsl:text><xsl:text>&#x000A;</xsl:text>-->
              <xsl:text disable-output-escaping="yes">/*position:relative;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.opencloseSParen-a > li:before {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-increment: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">content: "[" counter(list,lower-alpha) "] ";</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">/*position: absolute;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">margin-left: -1.4em;text-indent: -1.4em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              
              <xsl:text disable-output-escaping="yes">ol.opencloseParen-a {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-reset: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">text-indent: -0.8em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.opencloseParen-a > li {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <!--<xsl:text disable-output-escaping="yes">list-style: none;</xsl:text><xsl:text>&#x000A;</xsl:text>-->
              <xsl:text disable-output-escaping="yes">/*position:relative;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.opencloseParen-a > li:before {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-increment: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">content: "(" counter(list,lower-alpha) ") ";</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">/*position: absolute;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">margin-left: -1.4em;text-indent: -1.4em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>


              <xsl:text disable-output-escaping="yes">ol.closeParen-A {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-reset: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">text-indent: -0.8em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.closeParen-A > li {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <!--<xsl:text disable-output-escaping="yes">list-style: none;</xsl:text><xsl:text>&#x000A;</xsl:text>-->
              <xsl:text disable-output-escaping="yes">/*position:relative;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.closeParen-A > li:before {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-increment: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">content: counter(list,upper-alpha) ") ";</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">/*position: absolute;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">margin-left: -1.4em;text-indent: -1.4em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              
              
              <xsl:text disable-output-escaping="yes">ol.openParen-A {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-reset: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">text-indent: -0.8em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.openParen-A > li {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <!--<xsl:text disable-output-escaping="yes">list-style: none;</xsl:text><xsl:text>&#x000A;</xsl:text>-->
              <xsl:text disable-output-escaping="yes">/*position:relative;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.openParen-A > li:before {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-increment: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">content: "(" counter(list,upper-alpha) "";</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">/*position: absolute;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">margin-left: -1.4em;text-indent: -1.4em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              
              <xsl:text disable-output-escaping="yes">ol.openSParen-A {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-reset: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">text-indent: -0.8em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.openSParen-A > li {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <!--<xsl:text disable-output-escaping="yes">list-style: none;</xsl:text><xsl:text>&#x000A;</xsl:text>-->
              <xsl:text disable-output-escaping="yes">/*position:relative;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.openSParen-A > li:before {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-increment: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">content: "[" counter(list,upper-alpha) "";</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">/*position: absolute;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">margin-left: -1.4em;text-indent: -1.4em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              
              <xsl:text disable-output-escaping="yes">ol.closeSParen-A {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-reset: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">text-indent: -0.8em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.closeSParen-A > li {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <!--<xsl:text disable-output-escaping="yes">list-style: none;</xsl:text><xsl:text>&#x000A;</xsl:text>-->
              <xsl:text disable-output-escaping="yes">/*position:relative;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.closeSParen-A > li:before {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-increment: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">content: counter(list,upper-alpha) "] ";</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">/*position: absolute;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">margin-left: -1.4em;text-indent: -1.4em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              
              <xsl:text disable-output-escaping="yes">ol.opencloseSParen-A {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-reset: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">text-indent: -0.8em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.opencloseSParen-A > li {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <!--<xsl:text disable-output-escaping="yes">list-style: none;</xsl:text><xsl:text>&#x000A;</xsl:text>-->
              <xsl:text disable-output-escaping="yes">/*position:relative;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.opencloseSParen-A > li:before {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-increment: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">content: "[" counter(list,upper-alpha) "] ";</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">/*position: absolute;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">margin-left: -1.4em;text-indent: -1.4em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              
              <xsl:text disable-output-escaping="yes">ol.opencloseParen-A {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-reset: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">text-indent: -0.8em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.opencloseParen-A > li {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <!--<xsl:text disable-output-escaping="yes">list-style: none;</xsl:text><xsl:text>&#x000A;</xsl:text>-->
              <xsl:text disable-output-escaping="yes">/*position:relative;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.opencloseParen-A > li:before {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-increment: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">content: "(" counter(list,upper-alpha) ") ";</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">/*position: absolute;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">margin-left: -1.4em;text-indent: -1.4em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>



              <xsl:text disable-output-escaping="yes">ol.closeParen-i {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-reset: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">text-indent: -0.8em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.closeParen-i > li {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <!--<xsl:text disable-output-escaping="yes">list-style: none;</xsl:text><xsl:text>&#x000A;</xsl:text>-->
              <xsl:text disable-output-escaping="yes">/*position:relative;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.closeParen-i > li:before {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-increment: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">content: counter(list,lower-roman) ") ";</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">/*position: absolute;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">margin-left: -1.4em;text-indent: -1.4em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              
              
              <xsl:text disable-output-escaping="yes">ol.openParen-i {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-reset: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">text-indent: -0.8em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.openParen-i > li {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <!--<xsl:text disable-output-escaping="yes">list-style: none;</xsl:text><xsl:text>&#x000A;</xsl:text>-->
              <xsl:text disable-output-escaping="yes">/*position:relative;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.openParen-i > li:before {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-increment: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">content: "(" counter(list,lower-roman) "";</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">/*position: absolute;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">margin-left: -1.4em;text-indent: -1.4em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              
              <xsl:text disable-output-escaping="yes">ol.openSParen-i {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-reset: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">text-indent: -0.8em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.openSParen-i > li {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <!--<xsl:text disable-output-escaping="yes">list-style: none;</xsl:text><xsl:text>&#x000A;</xsl:text>-->
              <xsl:text disable-output-escaping="yes">/*position:relative;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.openSParen-i > li:before {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-increment: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">content: "[" counter(list,lower-roman) "";</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">/*position: absolute;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">margin-left: -1.4em;text-indent: -1.4em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              
              <xsl:text disable-output-escaping="yes">ol.closeSParen-i {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-reset: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">text-indent: -0.8em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.closeSParen-i > li {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <!--<xsl:text disable-output-escaping="yes">list-style: none;</xsl:text><xsl:text>&#x000A;</xsl:text>-->
              <xsl:text disable-output-escaping="yes">/*position:relative;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.closeSParen-i > li:before {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-increment: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">content: counter(list,lower-roman) "] ";</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">/*position: absolute;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">margin-left: -1.4em;text-indent: -1.4em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              
              <xsl:text disable-output-escaping="yes">ol.opencloseSParen-i {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-reset: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">text-indent: -0.8em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.opencloseSParen-i > li {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <!--<xsl:text disable-output-escaping="yes">list-style: none;</xsl:text><xsl:text>&#x000A;</xsl:text>-->
              <xsl:text disable-output-escaping="yes">/*position:relative;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.opencloseSParen-i > li:before {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-increment: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">content: "[" counter(list,lower-roman) "] ";</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">/*position: absolute;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">margin-left: -1.4em;text-indent: -1.4em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              
              <xsl:text disable-output-escaping="yes">ol.opencloseParen-i {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-reset: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">text-indent: -0.8em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.opencloseParen-i > li {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <!--<xsl:text disable-output-escaping="yes">list-style: none;</xsl:text><xsl:text>&#x000A;</xsl:text>-->
              <xsl:text disable-output-escaping="yes">/*position:relative;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.opencloseParen-i > li:before {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-increment: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">content: "(" counter(list,lower-roman) ") ";</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">/*position: absolute;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">margin-left: -1.4em;text-indent: -1.4em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>


              <xsl:text disable-output-escaping="yes">ol.closeParen-I {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-reset: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">text-Indent: -0.8em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.closeParen-I > li {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <!--<xsl:text disable-output-escaping="yes">list-style: none;</xsl:text><xsl:text>&#x000A;</xsl:text>-->
              <xsl:text disable-output-escaping="yes">/*position:relative;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.closeParen-I > li:before {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-Increment: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">content: counter(list,upper-roman) ") ";</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">/*position: absolute;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">margin-left: -1.4em;text-indent: -1.4em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              
              
              <xsl:text disable-output-escaping="yes">ol.openParen-I {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-reset: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">text-Indent: -0.8em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.openParen-I > li {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <!--<xsl:text disable-output-escaping="yes">list-style: none;</xsl:text><xsl:text>&#x000A;</xsl:text>-->
              <xsl:text disable-output-escaping="yes">/*position:relative;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.openParen-I > li:before {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-Increment: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">content: "(" counter(list,upper-roman) "";</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">/*position: absolute;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">margin-left: -1.4em;text-indent: -1.4em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              
              <xsl:text disable-output-escaping="yes">ol.openSParen-I {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-reset: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">text-Indent: -0.8em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.openSParen-I > li {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <!--<xsl:text disable-output-escaping="yes">list-style: none;</xsl:text><xsl:text>&#x000A;</xsl:text>-->
              <xsl:text disable-output-escaping="yes">/*position:relative;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.openSParen-I > li:before {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-Increment: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">content: "[" counter(list,upper-roman) "";</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">/*position: absolute;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">margin-left: -1.4em;text-indent: -1.4em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              
              <xsl:text disable-output-escaping="yes">ol.closeSParen-I {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-reset: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">text-Indent: -0.8em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.closeSParen-I > li {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <!--<xsl:text disable-output-escaping="yes">list-style: none;</xsl:text><xsl:text>&#x000A;</xsl:text>-->
              <xsl:text disable-output-escaping="yes">/*position:relative;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.closeSParen-I > li:before {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-Increment: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">content: counter(list,upper-roman) "] ";</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">/*position: absolute;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">margin-left: -1.4em;text-indent: -1.4em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              
              <xsl:text disable-output-escaping="yes">ol.opencloseSParen-I {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-reset: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">text-Indent: -0.8em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.opencloseSParen-I > li {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <!--<xsl:text disable-output-escaping="yes">list-style: none;</xsl:text><xsl:text>&#x000A;</xsl:text>-->
              <xsl:text disable-output-escaping="yes">/*position:relative;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.opencloseSParen-I > li:before {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-Increment: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">content: "[" counter(list,upper-roman) "] ";</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">/*position: absolute;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">margin-left: -1.4em;text-indent: -1.4em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              
              <xsl:text disable-output-escaping="yes">ol.opencloseParen-I {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-reset: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">text-Indent: -0.8em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.opencloseParen-I > li {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <!--<xsl:text disable-output-escaping="yes">list-style: none;</xsl:text><xsl:text>&#x000A;</xsl:text>-->
              <xsl:text disable-output-escaping="yes">/*position:relative;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">ol.opencloseParen-I > li:before {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">counter-Increment: list;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">content: "(" counter(list,upper-roman) ") ";</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">/*position: absolute;*/</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">margin-left: -1.4em;text-indent: -1.4em;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <!-- Added on 24-nov-17, end -->
              <!-- double underline -->
              <xsl:text disable-output-escaping="yes">span.DUnderline { text-decoration:underline;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">border-bottom: 1px solid #000; }</xsl:text><xsl:text>&#x000A;</xsl:text>
              <!-- double strike -->
              <xsl:text disable-output-escaping="yes">span.double-strike {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">position: relative;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">span.double-strike div.the-lines {</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">position: absolute;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">top: 10px; /* Depends on the font size */</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">left: 0;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">border-top: 3px double black;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">width: 100%;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">height: 100%;}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <!-- Added on 02-Sep-17, to remove default indents for OL and UL -->
              <xsl:text disable-output-escaping="yes">ul,ol{</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">padding-left:18px;</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <!-- Added on 20-Sep-17, to preserve whitespace -->
              <xsl:text disable-output-escaping="yes">p, a, span, li { white-space: pre-wrap; }</xsl:text><xsl:text>&#x000A;</xsl:text>
              <!-- Added on 20-Sep-17, to preserve whitespace -->
              
              <xsl:text disable-output-escaping="yes">body{</xsl:text><xsl:text>&#x000A;</xsl:text>
              <xsl:text disable-output-escaping="yes">font-family: Arial;}</xsl:text><xsl:text>&#x000A;</xsl:text>
              <!-- Added on 04-Nov-17, to inherit a link default color(a { color: inherit; } ) -->
               <!-- <xsl:text disable-output-escaping="yes">a{</xsl:text><xsl:text>&#x000A;</xsl:text>
                <xsl:text disable-output-escaping="yes">color: inherit;}</xsl:text><xsl:text>&#x000A;</xsl:text>-->
              <!-- Added on 04-Nov-17, to inherit a link default color(a { color: inherit; } ) END -->
              
              <!-- 03-May-17 END for list ) paranthesis -->
             <!-- <xsl:text disable-output-escaping="yes">-\-&gt;</xsl:text> commented on 13-june-17-->
              <xsl:text>&#x000A;</xsl:text>
            </xsl:element>
            <xsl:text>&#x000A;</xsl:text>  
          </xsl:element>
          <xsl:text>&#x000A;</xsl:text>
          <link src="./ckeditor.css"/>
          <xsl:element name="body">        
              <xsl:copy>
                  <xsl:apply-templates select="@*|node()"/>            
              </xsl:copy>
            <xsl:text>&#x000A;</xsl:text>
            <!-- 30-mar-17 Added Footnotes -->
            <!--<xsl:apply-templates select="//w:footnotes" mode="footnotes"/>-->
          </xsl:element>
          <xsl:text>&#x000A;</xsl:text>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="document/*">  
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>   
    </xsl:template>
    
 <!--   <xsl:template match="w:r">
        <!-\- Moving the permstart and permend above or below the Run because word process it in the same way. -\->
        <xsl:if test="child::w:permStart">
            <xsl:copy-of select="child::w:permStart"/>
        </xsl:if>
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
        <!-\- Moving the permstart and permend above or below the Run because word process it in the same way. -\->
        <xsl:if test="child::w:permEnd">
            <xsl:copy-of select="child::w:permEnd"/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="w:permStart|w:permEnd">
        <xsl:choose>
            <xsl:when test="parent::w:r">
            <!-\-  don't do anything because I'm moving the perm above or below if it is inside w:r -\->
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>-->
    
    <xsl:template name="SP">
        <xsl:element name="w:sectPr">             
            <xsl:element name="w:pgSz">
                <xsl:attribute name="w:w" select="Page[1]/PageW"/>
                <xsl:attribute name="w:h" select="Page[1]/PageH"/>
            </xsl:element>
            <xsl:element name="w:pgMar">
                <xsl:attribute name="w:top" select="round(number(Margin[1]/Top))"/>
                <xsl:attribute name="w:right" select="round(number(Margin[1]/Right))"/>
                <xsl:attribute name="w:bottom" select="round(number(Margin[1]/Bottom))"/>
                <xsl:attribute name="w:left" select="round(number(Margin[1]/Left))"/>
                <xsl:attribute name="w:gutter" select="round(number(Margin[1]/Gutter))"/>
                <xsl:attribute name="w:footer" select="'720'"/>
                <xsl:attribute name="w:header" select="'720'"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    

    
    <!-- removing the following from the document.xml for the purpose of well formed document -->
    <!--Removing the empty text nodes    -->
    <xsl:template match="w:t[not(text())]"/>
    <xsl:template match="@PageValue"/>
    <xsl:template match="@Para"/>
    <xsl:template match="@XValue"/>
    <xsl:template match="@YValue"/>
    <xsl:template match="@Txorigin"/>
    <xsl:template match="@Tyorigin"/>
    <xsl:template match="@Height"/>
    <xsl:template match="@Width"/>
    <!--<xsl:template match="@w:rsidR"/>-->
    <xsl:template match="//Page"/>
    <xsl:template match="//Margin"/>
    <!-- removing the following from the document.xml for the purpose of well formed document -->
    
       <!--     ************************************************** ASCII Conv ************************************************** -->
               <xsl:character-map name="Ascii2Unicode">
      <!-- isoboxmap.xsl -->
      <xsl:output-character character="%" string="&amp;#x0025;"/>
<!--<xsl:output-character character="&" string="&amp;#x0026;"/>-->
<xsl:output-character character="'" string="&amp;#x0027;"/>
<xsl:output-character character="*" string="&amp;#x002A;"/>
<xsl:output-character character="+" string="&amp;#x002B;"/>
<xsl:output-character character="=" string="&amp;#x003D;"/>
<xsl:output-character character=" " string="&amp;#x00A0;"/>
<xsl:output-character character="¡" string="&amp;#x00A1;"/>
<xsl:output-character character="¢" string="&amp;#x00A2;"/>
<xsl:output-character character="£" string="&amp;#x00A3;"/>
<xsl:output-character character="¤" string="&amp;#x00A4;"/>
<xsl:output-character character="¥" string="&amp;#x00A5;"/>
<xsl:output-character character="¦" string="&amp;#x00A6;"/>
<xsl:output-character character="§" string="&amp;#x00A7;"/>
<xsl:output-character character="¨" string="&amp;#x00A8;"/>
<xsl:output-character character="©" string="&amp;#x00A9;"/>
<xsl:output-character character="ª" string="&amp;#x00AA;"/>
<xsl:output-character character="«" string="&amp;#x00AB;"/>
<xsl:output-character character="¬" string="&amp;#x00AC;"/>
<xsl:output-character character="­" string="&amp;#x00AD;"/>
<xsl:output-character character="®" string="&amp;#x00AE;"/>
<xsl:output-character character="¯" string="&amp;#x00AF;"/>
<xsl:output-character character="°" string="&amp;#x00B0;"/>
<xsl:output-character character="±" string="&amp;#x00B1;"/>
<xsl:output-character character="²" string="&amp;#x00B2;"/>
<xsl:output-character character="³" string="&amp;#x00B3;"/>
<xsl:output-character character="´" string="&amp;#x00B4;"/>
<xsl:output-character character="µ" string="&amp;#x00B5;"/>
<xsl:output-character character="¶" string="&amp;#x00B6;"/>
<xsl:output-character character="·" string="&amp;#x00B7;"/>
<xsl:output-character character="¸" string="&amp;#x00B8;"/>
<xsl:output-character character="¹" string="&amp;#x00B9;"/>
<xsl:output-character character="º" string="&amp;#x00BA;"/>
<xsl:output-character character="»" string="&amp;#x00BB;"/>
<xsl:output-character character="¼" string="&amp;#x00BC;"/>
<xsl:output-character character="½" string="&amp;#x00BD;"/>
<xsl:output-character character="¾" string="&amp;#x00BE;"/>
<xsl:output-character character="¿" string="&amp;#x00BF;"/>
<xsl:output-character character="×" string="&amp;#x00D7;"/>
<xsl:output-character character="ß" string="&amp;#x00DF;"/>
<xsl:output-character character="À" string="&amp;#x00C0;"/>
<xsl:output-character character="à" string="&amp;#x00E0;"/>
<xsl:output-character character="Á" string="&amp;#x00C1;"/>
<xsl:output-character character="á" string="&amp;#x00E1;"/>
<xsl:output-character character="Â" string="&amp;#x00C2;"/>
<xsl:output-character character="â" string="&amp;#x00E2;"/>
<xsl:output-character character="Ã" string="&amp;#x00C3;"/>
<xsl:output-character character="ã" string="&amp;#x00E3;"/>
<xsl:output-character character="Ä" string="&amp;#x00C4;"/>
<xsl:output-character character="ä" string="&amp;#x00E4;"/>
<xsl:output-character character="Å" string="&amp;#x00C5;"/>
<xsl:output-character character="å" string="&amp;#x00E5;"/>
<xsl:output-character character="Å" string="&amp;#x212B;"/>
<xsl:output-character character="Æ" string="&amp;#x00C6;"/>
<xsl:output-character character="æ" string="&amp;#x00E6;"/>
<xsl:output-character character="Ç" string="&amp;#x00C7;"/>
<xsl:output-character character="ç" string="&amp;#x00E7;"/>
<xsl:output-character character="È" string="&amp;#x00C8;"/>
<xsl:output-character character="è" string="&amp;#x00E8;"/>
<xsl:output-character character="É" string="&amp;#x00C9;"/>
<xsl:output-character character="é" string="&amp;#x00E9;"/>
<xsl:output-character character="Ê" string="&amp;#x00CA;"/>
<xsl:output-character character="ê" string="&amp;#x00EA;"/>
<xsl:output-character character="Ë" string="&amp;#x00CB;"/>
<xsl:output-character character="ë" string="&amp;#x00EB;"/>
<xsl:output-character character="Ì" string="&amp;#x00CC;"/>
<xsl:output-character character="ì" string="&amp;#x00EC;"/>
<xsl:output-character character="Í" string="&amp;#x00CD;"/>
<xsl:output-character character="í" string="&amp;#x00ED;"/>
<xsl:output-character character="Î" string="&amp;#x00CE;"/>
<xsl:output-character character="î" string="&amp;#x00EE;"/>
<xsl:output-character character="Ï" string="&amp;#x00CF;"/>
<xsl:output-character character="ï" string="&amp;#x00EF;"/>
<xsl:output-character character="Ð" string="&amp;#x00D0;"/>
<xsl:output-character character="ð" string="&amp;#x00F0;"/>
<xsl:output-character character="Ñ" string="&amp;#x00D1;"/>
<xsl:output-character character="ñ" string="&amp;#x00F1;"/>
<xsl:output-character character="Ò" string="&amp;#x00D2;"/>
<xsl:output-character character="ò" string="&amp;#x00F2;"/>
<xsl:output-character character="Ó" string="&amp;#x00D3;"/>
<xsl:output-character character="ó" string="&amp;#x00F3;"/>
<xsl:output-character character="Ô" string="&amp;#x00D4;"/>
<xsl:output-character character="ô" string="&amp;#x00F4;"/>
<xsl:output-character character="Õ" string="&amp;#x00D5;"/>
<xsl:output-character character="õ" string="&amp;#x00F5;"/>
<xsl:output-character character="Ö" string="&amp;#x00D6;"/>
<xsl:output-character character="ö" string="&amp;#x00F6;"/>
<xsl:output-character character="÷" string="&amp;#x00F7;"/>
<xsl:output-character character="Ø" string="&amp;#x00D8;"/>
<xsl:output-character character="ø" string="&amp;#x00F8;"/>
<xsl:output-character character="Ù" string="&amp;#x00D9;"/>
<xsl:output-character character="ù" string="&amp;#x00F9;"/>
<xsl:output-character character="Ú" string="&amp;#x00DA;"/>
<xsl:output-character character="ú" string="&amp;#x00FA;"/>
<xsl:output-character character="Û" string="&amp;#x00DB;"/>
<xsl:output-character character="û" string="&amp;#x00FB;"/>
<xsl:output-character character="Ü" string="&amp;#x00DC;"/>
<xsl:output-character character="ü" string="&amp;#x00FC;"/>
<xsl:output-character character="Ý" string="&amp;#x00DD;"/>
<xsl:output-character character="ý" string="&amp;#x00FD;"/>
<xsl:output-character character="Þ" string="&amp;#x00DE;"/>
<xsl:output-character character="þ" string="&amp;#x00FE;"/>
<xsl:output-character character="ÿ" string="&amp;#x00FF;"/>
<xsl:output-character character="Ÿ" string="&amp;#x0178;"/>
<xsl:output-character character="Ā" string="&amp;#x0100;"/>
<xsl:output-character character="ā" string="&amp;#x0101;"/>
<xsl:output-character character="Ă" string="&amp;#x0102;"/>
<xsl:output-character character="ă" string="&amp;#x0103;"/>
<xsl:output-character character="Ą" string="&amp;#x0104;"/>
<xsl:output-character character="ą" string="&amp;#x0105;"/>
<xsl:output-character character="Ć" string="&amp;#x0106;"/>
<xsl:output-character character="ć" string="&amp;#x0107;"/>
<xsl:output-character character="Ĉ" string="&amp;#x0108;"/>
<xsl:output-character character="ĉ" string="&amp;#x0109;"/>
<xsl:output-character character="Ċ" string="&amp;#x010A;"/>
<xsl:output-character character="ċ" string="&amp;#x010B;"/>
<xsl:output-character character="Č" string="&amp;#x010C;"/>
<xsl:output-character character="č" string="&amp;#x010D;"/>
<xsl:output-character character="Ď" string="&amp;#x010E;"/>
<xsl:output-character character="ď" string="&amp;#x010F;"/>
<xsl:output-character character="Đ" string="&amp;#x0110;"/>
<xsl:output-character character="đ" string="&amp;#x0111;"/>
<xsl:output-character character="Ē" string="&amp;#x0112;"/>
<xsl:output-character character="ē" string="&amp;#x0113;"/>
<xsl:output-character character="Ė" string="&amp;#x0116;"/>
<xsl:output-character character="ė" string="&amp;#x0117;"/>
<xsl:output-character character="Ę" string="&amp;#x0118;"/>
<xsl:output-character character="ę" string="&amp;#x0119;"/>
<xsl:output-character character="Ě" string="&amp;#x011A;"/>
<xsl:output-character character="ě" string="&amp;#x011B;"/>
<xsl:output-character character="Ĝ" string="&amp;#x011C;"/>
<xsl:output-character character="ĝ" string="&amp;#x011D;"/>
<xsl:output-character character="Ğ" string="&amp;#x011E;"/>
<xsl:output-character character="ğ" string="&amp;#x011F;"/>
<xsl:output-character character="Ġ" string="&amp;#x0120;"/>
<xsl:output-character character="ġ" string="&amp;#x0121;"/>
<xsl:output-character character="Ģ" string="&amp;#x0122;"/>
<xsl:output-character character="Ĥ" string="&amp;#x0124;"/>
<xsl:output-character character="ĥ" string="&amp;#x0125;"/>
<xsl:output-character character="Ħ" string="&amp;#x0126;"/>
<xsl:output-character character="ħ" string="&amp;#x0127;"/>
<xsl:output-character character="Ĩ" string="&amp;#x0128;"/>
<xsl:output-character character="ĩ" string="&amp;#x0129;"/>
<xsl:output-character character="Ī" string="&amp;#x012A;"/>
<xsl:output-character character="ī" string="&amp;#x012B;"/>
<xsl:output-character character="Į" string="&amp;#x012E;"/>
<xsl:output-character character="į" string="&amp;#x012F;"/>
<xsl:output-character character="İ" string="&amp;#x0130;"/>
<xsl:output-character character="ı" string="&amp;#x0131;"/>
<xsl:output-character character="Ĳ" string="&amp;#x0132;"/>
<xsl:output-character character="ĳ" string="&amp;#x0133;"/>
<xsl:output-character character="Ĵ" string="&amp;#x0134;"/>
<xsl:output-character character="ĵ" string="&amp;#x0135;"/>
<xsl:output-character character="Ķ" string="&amp;#x0136;"/>
<xsl:output-character character="ķ" string="&amp;#x0137;"/>
<xsl:output-character character="ĸ" string="&amp;#x0138;"/>
<xsl:output-character character="Ĺ" string="&amp;#x0139;"/>
<xsl:output-character character="ĺ" string="&amp;#x013A;"/>
<xsl:output-character character="Ļ" string="&amp;#x013B;"/>
<xsl:output-character character="ļ" string="&amp;#x013C;"/>
<xsl:output-character character="Ľ" string="&amp;#x013D;"/>
<xsl:output-character character="ľ" string="&amp;#x013E;"/>
<xsl:output-character character="Ŀ" string="&amp;#x013F;"/>
<xsl:output-character character="ŀ" string="&amp;#x0140;"/>
<xsl:output-character character="Ł" string="&amp;#x0141;"/>
<xsl:output-character character="ł" string="&amp;#x0142;"/>
<xsl:output-character character="Ń" string="&amp;#x0143;"/>
<xsl:output-character character="ń" string="&amp;#x0144;"/>
<xsl:output-character character="Ņ" string="&amp;#x0145;"/>
<xsl:output-character character="ņ" string="&amp;#x0146;"/>
<xsl:output-character character="Ň" string="&amp;#x0147;"/>
<xsl:output-character character="ň" string="&amp;#x0148;"/>
<xsl:output-character character="ŉ" string="&amp;#x0149;"/>
<xsl:output-character character="Ŋ" string="&amp;#x014A;"/>
<xsl:output-character character="ŋ" string="&amp;#x014B;"/>
<xsl:output-character character="Ō" string="&amp;#x014C;"/>
<xsl:output-character character="ō" string="&amp;#x014D;"/>
<xsl:output-character character="Ő" string="&amp;#x0150;"/>
<xsl:output-character character="ő" string="&amp;#x0151;"/>
<xsl:output-character character="Œ" string="&amp;#x0152;"/>
<xsl:output-character character="œ" string="&amp;#x0153;"/>
<xsl:output-character character="Ŕ" string="&amp;#x0154;"/>
<xsl:output-character character="ŕ" string="&amp;#x0155;"/>
<xsl:output-character character="Ŗ" string="&amp;#x0156;"/>
<xsl:output-character character="ŗ" string="&amp;#x0157;"/>
<xsl:output-character character="Ř" string="&amp;#x0158;"/>
<xsl:output-character character="ř" string="&amp;#x0159;"/>
<xsl:output-character character="Ś" string="&amp;#x015A;"/>
<xsl:output-character character="ś" string="&amp;#x015B;"/>
<xsl:output-character character="Ŝ" string="&amp;#x015C;"/>
<xsl:output-character character="ŝ" string="&amp;#x015D;"/>
<xsl:output-character character="Ş" string="&amp;#x015E;"/>
<xsl:output-character character="ş" string="&amp;#x015F;"/>
<xsl:output-character character="Š" string="&amp;#x0160;"/>
<xsl:output-character character="š" string="&amp;#x0161;"/>
<xsl:output-character character="Ţ" string="&amp;#x0162;"/>
<xsl:output-character character="ţ" string="&amp;#x0163;"/>
<xsl:output-character character="Ť" string="&amp;#x0164;"/>
<xsl:output-character character="ť" string="&amp;#x0165;"/>
<xsl:output-character character="Ŧ" string="&amp;#x0166;"/>
<xsl:output-character character="ŧ" string="&amp;#x0167;"/>
<xsl:output-character character="Ũ" string="&amp;#x0168;"/>
<xsl:output-character character="ũ" string="&amp;#x0169;"/>
<xsl:output-character character="Ū" string="&amp;#x016A;"/>
<xsl:output-character character="ū" string="&amp;#x016B;"/>
<xsl:output-character character="Ŭ" string="&amp;#x016C;"/>
<xsl:output-character character="ŭ" string="&amp;#x016D;"/>
<xsl:output-character character="Ů" string="&amp;#x016E;"/>
<xsl:output-character character="ů" string="&amp;#x016F;"/>
<xsl:output-character character="Ű" string="&amp;#x0170;"/>
<xsl:output-character character="ű" string="&amp;#x0171;"/>
<xsl:output-character character="Ų" string="&amp;#x0172;"/>
<xsl:output-character character="ų" string="&amp;#x0173;"/>
<xsl:output-character character="Ŵ" string="&amp;#x0174;"/>
<xsl:output-character character="ŵ" string="&amp;#x0175;"/>
<xsl:output-character character="Ŷ" string="&amp;#x0176;"/>
<xsl:output-character character="ŷ" string="&amp;#x0177;"/>
<xsl:output-character character="Ź" string="&amp;#x0179;"/>
<xsl:output-character character="ź" string="&amp;#x017A;"/>
<xsl:output-character character="Ż" string="&amp;#x017B;"/>
<xsl:output-character character="ż" string="&amp;#x017C;"/>
<xsl:output-character character="Ž" string="&amp;#x017D;"/>
<xsl:output-character character="ž" string="&amp;#x017E;"/>
<xsl:output-character character="ƒ" string="&amp;#x0192;"/>
<xsl:output-character character="Ƶ" string="&amp;#x01B5;"/>
<xsl:output-character character="ǵ" string="&amp;#x01F5;"/>
<xsl:output-character character="ə" string="&amp;#x0259;"/>
<xsl:output-character character="ˆ" string="&amp;#x02C6;"/>
<xsl:output-character character="ˇ" string="&amp;#x02C7;"/>
<xsl:output-character character="˘" string="&amp;#x02D8;"/>
<xsl:output-character character="˙" string="&amp;#x02D9;"/>
<xsl:output-character character="˚" string="&amp;#x02DA;"/>
<xsl:output-character character="˛" string="&amp;#x02DB;"/>
<xsl:output-character character="˜" string="&amp;#x02DC;"/>
<xsl:output-character character="˝" string="&amp;#x02DD;"/>
<xsl:output-character character="ΐ" string="&amp;#x0390;"/>
<xsl:output-character character="Ά" string="&amp;#x0386;"/>
<xsl:output-character character="ά" string="&amp;#x03AC;"/>
<xsl:output-character character="Έ" string="&amp;#x0388;"/>
<xsl:output-character character="έ" string="&amp;#x03AD;"/>
<xsl:output-character character="Ή" string="&amp;#x0389;"/>
<xsl:output-character character="ή" string="&amp;#x03AE;"/>
<xsl:output-character character="Ί" string="&amp;#x038A;"/>
<xsl:output-character character="ί" string="&amp;#x03AF;"/>
<xsl:output-character character="ΰ" string="&amp;#x03B0;"/>
<xsl:output-character character="Α" string="&amp;#x0391;"/>
<xsl:output-character character="α" string="&amp;#x03B1;"/>
<xsl:output-character character="Β" string="&amp;#x0392;"/>
<xsl:output-character character="β" string="&amp;#x03B2;"/>
<xsl:output-character character="Γ" string="&amp;#x0393;"/>
<xsl:output-character character="γ" string="&amp;#x03B3;"/>
<xsl:output-character character="Δ" string="&amp;#x0394;"/>
<xsl:output-character character="δ" string="&amp;#x03B4;"/>
<xsl:output-character character="Ε" string="&amp;#x0395;"/>
<xsl:output-character character="ε" string="&amp;#x03B5;"/>
<xsl:output-character character="ϵ" string="&amp;#x03F5;"/>
<xsl:output-character character="Ζ" string="&amp;#x0396;"/>
<xsl:output-character character="ζ" string="&amp;#x03B6;"/>
<xsl:output-character character="Η" string="&amp;#x0397;"/>
<xsl:output-character character="η" string="&amp;#x03B7;"/>
<xsl:output-character character="Θ" string="&amp;#x0398;"/>
<xsl:output-character character="θ" string="&amp;#x03B8;"/>
<xsl:output-character character="ϑ" string="&amp;#x03D1;"/>
<xsl:output-character character="Ι" string="&amp;#x0399;"/>
<xsl:output-character character="ι" string="&amp;#x03B9;"/>
<xsl:output-character character="Κ" string="&amp;#x039A;"/>
<xsl:output-character character="κ" string="&amp;#x03BA;"/>
<xsl:output-character character="ϰ" string="&amp;#x03F0;"/>
<xsl:output-character character="Λ" string="&amp;#x039B;"/>
<xsl:output-character character="λ" string="&amp;#x03BB;"/>
<xsl:output-character character="Μ" string="&amp;#x039C;"/>
<xsl:output-character character="μ" string="&amp;#x03BC;"/>
<xsl:output-character character="Ν" string="&amp;#x039D;"/>
<xsl:output-character character="ν" string="&amp;#x03BD;"/>
<xsl:output-character character="Ξ" string="&amp;#x039E;"/>
<xsl:output-character character="ξ" string="&amp;#x03BE;"/>
<xsl:output-character character="Ο" string="&amp;#x039F;"/>
<xsl:output-character character="ο" string="&amp;#x03BF;"/>
<xsl:output-character character="Π" string="&amp;#x03A0;"/>
<xsl:output-character character="π" string="&amp;#x03C0;"/>
<xsl:output-character character="ϖ" string="&amp;#x03D6;"/>
<xsl:output-character character="Ρ" string="&amp;#x03A1;"/>
<xsl:output-character character="ρ" string="&amp;#x03C1;"/>
<xsl:output-character character="ϱ" string="&amp;#x03F1;"/>
<xsl:output-character character="Σ" string="&amp;#x03A3;"/>
<xsl:output-character character="ς" string="&amp;#x03C2;"/>
<xsl:output-character character="σ" string="&amp;#x03C3;"/>
<xsl:output-character character="Τ" string="&amp;#x03A4;"/>
<xsl:output-character character="τ" string="&amp;#x03C4;"/>
<xsl:output-character character="Υ" string="&amp;#x03A5;"/>
<xsl:output-character character="υ" string="&amp;#x03C5;"/>
<xsl:output-character character="Φ" string="&amp;#x03A6;"/>
<xsl:output-character character="φ" string="&amp;#x03C6;"/>
<xsl:output-character character="Χ" string="&amp;#x03A7;"/>
<xsl:output-character character="χ" string="&amp;#x03C7;"/>
<xsl:output-character character="Ψ" string="&amp;#x03A8;"/>
<xsl:output-character character="ψ" string="&amp;#x03C8;"/>
<xsl:output-character character="Ω" string="&amp;#x03A9;"/>
<xsl:output-character character="ω" string="&amp;#x03C9;"/>
<xsl:output-character character="Ω" string="&amp;#x2126;"/>
<xsl:output-character character="Ϊ" string="&amp;#x03AA;"/>
<xsl:output-character character="ϊ" string="&amp;#x03CA;"/>
<xsl:output-character character="Ϋ" string="&amp;#x03AB;"/>
<xsl:output-character character="ϋ" string="&amp;#x03CB;"/>
<xsl:output-character character="Ό" string="&amp;#x038C;"/>
<xsl:output-character character="ό" string="&amp;#x03CC;"/>
<xsl:output-character character="Ύ" string="&amp;#x038E;"/>
<xsl:output-character character="ύ" string="&amp;#x03CD;"/>
<xsl:output-character character="Ώ" string="&amp;#x038F;"/>
<xsl:output-character character="ώ" string="&amp;#x03CE;"/>
<xsl:output-character character="ϒ" string="&amp;#x03D2;"/>
<xsl:output-character character="Ϝ" string="&amp;#x03DC;"/>
<xsl:output-character character="ϝ" string="&amp;#x03DD;"/>
<xsl:output-character character="϶" string="&amp;#x03F6;"/>
<xsl:output-character character="А" string="&amp;#x0410;"/>
<xsl:output-character character="а" string="&amp;#x0430;"/>
<xsl:output-character character="Б" string="&amp;#x0411;"/>
<xsl:output-character character="б" string="&amp;#x0431;"/>
<xsl:output-character character="В" string="&amp;#x0412;"/>
<xsl:output-character character="в" string="&amp;#x0432;"/>
<xsl:output-character character="Г" string="&amp;#x0413;"/>
<xsl:output-character character="г" string="&amp;#x0433;"/>
<xsl:output-character character="Д" string="&amp;#x0414;"/>
<xsl:output-character character="д" string="&amp;#x0434;"/>
<xsl:output-character character="Е" string="&amp;#x0415;"/>
<xsl:output-character character="е" string="&amp;#x0435;"/>
<xsl:output-character character="Ж" string="&amp;#x0416;"/>
<xsl:output-character character="ж" string="&amp;#x0436;"/>
<xsl:output-character character="З" string="&amp;#x0417;"/>
<xsl:output-character character="з" string="&amp;#x0437;"/>
<xsl:output-character character="И" string="&amp;#x0418;"/>
<xsl:output-character character="и" string="&amp;#x0438;"/>
<xsl:output-character character="Й" string="&amp;#x0419;"/>
<xsl:output-character character="й" string="&amp;#x0439;"/>
<xsl:output-character character="К" string="&amp;#x041A;"/>
<xsl:output-character character="к" string="&amp;#x043A;"/>
<xsl:output-character character="Л" string="&amp;#x041B;"/>
<xsl:output-character character="л" string="&amp;#x043B;"/>
<xsl:output-character character="М" string="&amp;#x041C;"/>
<xsl:output-character character="м" string="&amp;#x043C;"/>
<xsl:output-character character="Н" string="&amp;#x041D;"/>
<xsl:output-character character="н" string="&amp;#x043D;"/>
<xsl:output-character character="О" string="&amp;#x041E;"/>
<xsl:output-character character="о" string="&amp;#x043E;"/>
<xsl:output-character character="П" string="&amp;#x041F;"/>
<xsl:output-character character="п" string="&amp;#x043F;"/>
<xsl:output-character character="Р" string="&amp;#x0420;"/>
<xsl:output-character character="р" string="&amp;#x0440;"/>
<xsl:output-character character="С" string="&amp;#x0421;"/>
<xsl:output-character character="с" string="&amp;#x0441;"/>
<xsl:output-character character="Т" string="&amp;#x0422;"/>
<xsl:output-character character="т" string="&amp;#x0442;"/>
<xsl:output-character character="У" string="&amp;#x0423;"/>
<xsl:output-character character="у" string="&amp;#x0443;"/>
<xsl:output-character character="Ф" string="&amp;#x0424;"/>
<xsl:output-character character="ф" string="&amp;#x0444;"/>
<xsl:output-character character="Х" string="&amp;#x0425;"/>
<xsl:output-character character="х" string="&amp;#x0445;"/>
<xsl:output-character character="Ц" string="&amp;#x0426;"/>
<xsl:output-character character="ц" string="&amp;#x0446;"/>
<xsl:output-character character="Ч" string="&amp;#x0427;"/>
<xsl:output-character character="ч" string="&amp;#x0447;"/>
<xsl:output-character character="Ш" string="&amp;#x0428;"/>
<xsl:output-character character="ш" string="&amp;#x0448;"/>
<xsl:output-character character="Щ" string="&amp;#x0429;"/>
<xsl:output-character character="щ" string="&amp;#x0449;"/>
<xsl:output-character character="Ъ" string="&amp;#x042A;"/>
<xsl:output-character character="ъ" string="&amp;#x044A;"/>
<xsl:output-character character="Ы" string="&amp;#x042B;"/>
<xsl:output-character character="ы" string="&amp;#x044B;"/>
<xsl:output-character character="Ь" string="&amp;#x042C;"/>
<xsl:output-character character="ь" string="&amp;#x044C;"/>
<xsl:output-character character="Э" string="&amp;#x042D;"/>
<xsl:output-character character="э" string="&amp;#x044D;"/>
<xsl:output-character character="Ю" string="&amp;#x042E;"/>
<xsl:output-character character="ю" string="&amp;#x044E;"/>
<xsl:output-character character="Я" string="&amp;#x042F;"/>
<xsl:output-character character="я" string="&amp;#x044F;"/>
<xsl:output-character character="Ё" string="&amp;#x0401;"/>
<xsl:output-character character="ё" string="&amp;#x0451;"/>
<xsl:output-character character="Ђ" string="&amp;#x0402;"/>
<xsl:output-character character="ђ" string="&amp;#x0452;"/>
<xsl:output-character character="Ѓ" string="&amp;#x0403;"/>
<xsl:output-character character="ѓ" string="&amp;#x0453;"/>
<xsl:output-character character="Є" string="&amp;#x0404;"/>
<xsl:output-character character="є" string="&amp;#x0454;"/>
<xsl:output-character character="Ѕ" string="&amp;#x0405;"/>
<xsl:output-character character="ѕ" string="&amp;#x0455;"/>
<xsl:output-character character="І" string="&amp;#x0406;"/>
<xsl:output-character character="і" string="&amp;#x0456;"/>
<xsl:output-character character="Ї" string="&amp;#x0407;"/>
<xsl:output-character character="ї" string="&amp;#x0457;"/>
<xsl:output-character character="Ј" string="&amp;#x0408;"/>
<xsl:output-character character="ј" string="&amp;#x0458;"/>
<xsl:output-character character="Љ" string="&amp;#x0409;"/>
<xsl:output-character character="љ" string="&amp;#x0459;"/>
<xsl:output-character character="Њ" string="&amp;#x040A;"/>
<xsl:output-character character="њ" string="&amp;#x045A;"/>
<xsl:output-character character="Ћ" string="&amp;#x040B;"/>
<xsl:output-character character="ћ" string="&amp;#x045B;"/>
<xsl:output-character character="Ќ" string="&amp;#x040C;"/>
<xsl:output-character character="ќ" string="&amp;#x045C;"/>
<xsl:output-character character="Ў" string="&amp;#x040E;"/>
<xsl:output-character character="ў" string="&amp;#x045E;"/>
<xsl:output-character character="Џ" string="&amp;#x040F;"/>
<xsl:output-character character="џ" string="&amp;#x045F;"/>
<xsl:output-character character=" " string="&#160;"/>
<!--<xsl:output-character character=" " string="&amp;#x2002;"/>-->
<!--<xsl:output-character character=" " string="&#160;&#160;"/>-->
<!--<xsl:output-character character=" " string="&amp;#x2003;"/>-->
<xsl:output-character character=" " string="&amp;#x2004;"/>
<xsl:output-character character=" " string="&amp;#x2005;"/>
<xsl:output-character character=" " string="&amp;#x2007;"/>
<xsl:output-character character=" " string="&amp;#x2008;"/>
<xsl:output-character character=" " string="&amp;#x2009;"/>
<!--<xsl:output-character character=" " string="&amp;#x200A;"/>-->
<xsl:output-character character="‐" string="&amp;#x2010;"/>
<xsl:output-character character="‒" string="&amp;#x2012;"/><!-- FigureDash -->
<xsl:output-character character="–" string="&amp;#x2013;"/>
<xsl:output-character character="—" string="&amp;#x2014;"/>
<xsl:output-character character="―" string="&amp;#x2015;"/>
<xsl:output-character character="‖" string="&amp;#x2016;"/>
<xsl:output-character character="‘" string="&amp;#x2018;"/>
<xsl:output-character character="’" string="&amp;#x2019;"/>
<xsl:output-character character="‚" string="&amp;#x201A;"/>
<xsl:output-character character="“" string="&amp;#x201C;"/>
<xsl:output-character character="”" string="&amp;#x201D;"/>
<xsl:output-character character="„" string="&amp;#x201E;"/>
<xsl:output-character character="†" string="&amp;#x2020;"/>
<xsl:output-character character="‡" string="&amp;#x2021;"/>
<xsl:output-character character="•" string="&amp;#x2022;"/>
<xsl:output-character character="‥" string="&amp;#x2025;"/>
<xsl:output-character character="…" string="&amp;#x2026;"/>
<xsl:output-character character=" " string="&amp;#x2029;"/>
<xsl:output-character character="‰" string="&amp;#x2030;"/>
<xsl:output-character character="‱" string="&amp;#x2031;"/>
<xsl:output-character character="′" string="&amp;#x2032;"/>
<xsl:output-character character="″" string="&amp;#x2033;"/>
<xsl:output-character character="‴" string="&amp;#x2034;"/>
<xsl:output-character character="‵" string="&amp;#x2035;"/>
<xsl:output-character character="⁁" string="&amp;#x2041;"/>
<xsl:output-character character="⁃" string="&amp;#x2043;"/>
<xsl:output-character character="⁏" string="&amp;#x204F;"/>
<xsl:output-character character="⁗" string="&amp;#x2057;"/>
<xsl:output-character character="⃛" string="&amp;#x20DB;"/>
<xsl:output-character character="⃜" string="&amp;#x20DC;"/>
<xsl:output-character character="℅" string="&amp;#x2105;"/>
<xsl:output-character character="ℋ" string="&amp;#x210B;"/>
<xsl:output-character character="ℏ" string="&amp;#x210F;"/>
<xsl:output-character character="ℑ" string="&amp;#x2111;"/>
<xsl:output-character character="ℒ" string="&amp;#x2112;"/>
<xsl:output-character character="ℓ" string="&amp;#x2113;"/>
<xsl:output-character character="№" string="&amp;#x2116;"/>
<xsl:output-character character="℗" string="&amp;#x2117;"/>
<xsl:output-character character="℘" string="&amp;#x2118;"/>
<xsl:output-character character="ℜ" string="&amp;#x211C;"/>
<xsl:output-character character="℞" string="&amp;#x211E;"/>
<xsl:output-character character="™" string="&amp;#x2122;"/>
<xsl:output-character character="℧" string="&amp;#x2127;"/>
<xsl:output-character character="℩" string="&amp;#x2129;"/>
<xsl:output-character character="ℬ" string="&amp;#x212C;"/>
<xsl:output-character character="ℳ" string="&amp;#x2133;"/>
<xsl:output-character character="ℴ" string="&amp;#x2134;"/>
<xsl:output-character character="ℵ" string="&amp;#x2135;"/>
<xsl:output-character character="ℶ" string="&amp;#x2136;"/>
<xsl:output-character character="ℷ" string="&amp;#x2137;"/>
<xsl:output-character character="ℸ" string="&amp;#x2138;"/>
<xsl:output-character character="⅓" string="&amp;#x2153;"/>
<xsl:output-character character="⅔" string="&amp;#x2154;"/>
<xsl:output-character character="⅕" string="&amp;#x2155;"/>
<xsl:output-character character="⅖" string="&amp;#x2156;"/>
<xsl:output-character character="⅗" string="&amp;#x2157;"/>
<xsl:output-character character="⅘" string="&amp;#x2158;"/>
<xsl:output-character character="⅙" string="&amp;#x2159;"/>
<xsl:output-character character="⅚" string="&amp;#x215A;"/>
<xsl:output-character character="⅛" string="&amp;#x215B;"/>
<xsl:output-character character="⅜" string="&amp;#x215C;"/>
<xsl:output-character character="⅝" string="&amp;#x215D;"/>
<xsl:output-character character="⅞" string="&amp;#x215E;"/>
<xsl:output-character character="←" string="&amp;#x2190;"/>
<xsl:output-character character="↑" string="&amp;#x2191;"/>
<xsl:output-character character="→" string="&amp;#x2192;"/>
<xsl:output-character character="↓" string="&amp;#x2193;"/>
<xsl:output-character character="↔" string="&amp;#x2194;"/>
<xsl:output-character character="↕" string="&amp;#x2195;"/>
<xsl:output-character character="↖" string="&amp;#x2196;"/>
<xsl:output-character character="↗" string="&amp;#x2197;"/>
<xsl:output-character character="↘" string="&amp;#x2198;"/>
<xsl:output-character character="↙" string="&amp;#x2199;"/>
<xsl:output-character character="↚" string="&amp;#x219A;"/>
<xsl:output-character character="↛" string="&amp;#x219B;"/>
<xsl:output-character character="↝" string="&amp;#x219D;"/>
<xsl:output-character character="↞" string="&amp;#x219E;"/>
<xsl:output-character character="↟" string="&amp;#x219F;"/>
<xsl:output-character character="↠" string="&amp;#x21A0;"/>
<xsl:output-character character="↡" string="&amp;#x21A1;"/>
<xsl:output-character character="↢" string="&amp;#x21A2;"/>
<xsl:output-character character="↣" string="&amp;#x21A3;"/>
<xsl:output-character character="↦" string="&amp;#x21A6;"/>
<xsl:output-character character="↩" string="&amp;#x21A9;"/>
<xsl:output-character character="↪" string="&amp;#x21AA;"/>
<xsl:output-character character="↫" string="&amp;#x21AB;"/>
<xsl:output-character character="↬" string="&amp;#x21AC;"/>
<xsl:output-character character="↭" string="&amp;#x21AD;"/>
<xsl:output-character character="↮" string="&amp;#x21AE;"/>
<xsl:output-character character="↰" string="&amp;#x21B0;"/>
<xsl:output-character character="↱" string="&amp;#x21B1;"/>
<xsl:output-character character="↲" string="&amp;#x21B2;"/>
<xsl:output-character character="↳" string="&amp;#x21B3;"/>
<xsl:output-character character="↶" string="&amp;#x21B6;"/>
<xsl:output-character character="↷" string="&amp;#x21B7;"/>
<xsl:output-character character="↺" string="&amp;#x21BA;"/>
<xsl:output-character character="↻" string="&amp;#x21BB;"/>
<xsl:output-character character="↼" string="&amp;#x21BC;"/>
<xsl:output-character character="↽" string="&amp;#x21BD;"/>
<xsl:output-character character="↾" string="&amp;#x21BE;"/>
<xsl:output-character character="↿" string="&amp;#x21BF;"/>
<xsl:output-character character="⇀" string="&amp;#x21C0;"/>
<xsl:output-character character="⇁" string="&amp;#x21C1;"/>
<xsl:output-character character="⇂" string="&amp;#x21C2;"/>
<xsl:output-character character="⇃" string="&amp;#x21C3;"/>
<xsl:output-character character="⇄" string="&amp;#x21C4;"/>
<xsl:output-character character="⇅" string="&amp;#x21C5;"/>
<xsl:output-character character="⇆" string="&amp;#x21C6;"/>
<xsl:output-character character="⇇" string="&amp;#x21C7;"/>
<xsl:output-character character="⇈" string="&amp;#x21C8;"/>
<xsl:output-character character="⇉" string="&amp;#x21C9;"/>
<xsl:output-character character="⇊" string="&amp;#x21CA;"/>
<xsl:output-character character="⇋" string="&amp;#x21CB;"/>
<xsl:output-character character="⇌" string="&amp;#x21CC;"/>
<xsl:output-character character="⇍" string="&amp;#x21CD;"/>
<xsl:output-character character="⇎" string="&amp;#x21CE;"/>
<xsl:output-character character="⇏" string="&amp;#x21CF;"/>
<xsl:output-character character="⇐" string="&amp;#x21D0;"/>
<xsl:output-character character="⇑" string="&amp;#x21D1;"/>
<xsl:output-character character="⇒" string="&amp;#x21D2;"/>
<xsl:output-character character="⇓" string="&amp;#x21D3;"/>
<xsl:output-character character="⇔" string="&amp;#x21D4;"/>
<xsl:output-character character="⇕" string="&amp;#x21D5;"/>
<xsl:output-character character="⇖" string="&amp;#x21D6;"/>
<xsl:output-character character="⇗" string="&amp;#x21D7;"/>
<xsl:output-character character="⇘" string="&amp;#x21D8;"/>
<xsl:output-character character="⇙" string="&amp;#x21D9;"/>
<xsl:output-character character="⇚" string="&amp;#x21DA;"/>
<xsl:output-character character="⇛" string="&amp;#x21DB;"/>
<xsl:output-character character="⇝" string="&amp;#x21DD;"/>
<xsl:output-character character="⇵" string="&amp;#x21F5;"/>
<xsl:output-character character="⇽" string="&amp;#x21FD;"/>
<xsl:output-character character="⇾" string="&amp;#x21FE;"/>
<xsl:output-character character="⇿" string="&amp;#x21FF;"/>
<xsl:output-character character="∀" string="&amp;#x2200;"/>
<xsl:output-character character="∁" string="&amp;#x2201;"/>
<xsl:output-character character="∂" string="&amp;#x2202;"/>
<xsl:output-character character="∃" string="&amp;#x2203;"/>
<xsl:output-character character="∄" string="&amp;#x2204;"/>
<xsl:output-character character="∅" string="&amp;#x2205;"/>
<xsl:output-character character="∇" string="&amp;#x2207;"/>
<xsl:output-character character="∈" string="&amp;#x2208;"/>
<xsl:output-character character="∉" string="&amp;#x2209;"/>
<xsl:output-character character="∋" string="&amp;#x220B;"/>
<xsl:output-character character="∌" string="&amp;#x220C;"/>
<xsl:output-character character="∏" string="&amp;#x220F;"/>
<xsl:output-character character="∐" string="&amp;#x2210;"/>
<xsl:output-character character="∑" string="&amp;#x2211;"/>
<xsl:output-character character="−" string="&amp;#x2212;"/>
<xsl:output-character character="∓" string="&amp;#x2213;"/>
<xsl:output-character character="∔" string="&amp;#x2214;"/>
<xsl:output-character character="∖" string="&amp;#x2216;"/>
<xsl:output-character character="∗" string="&amp;#x2217;"/>
<xsl:output-character character="∘" string="&amp;#x2218;"/>
<xsl:output-character character="√" string="&amp;#x221A;"/>
<xsl:output-character character="∝" string="&amp;#x221D;"/>
<xsl:output-character character="∞" string="&amp;#x221E;"/>
<xsl:output-character character="∟" string="&amp;#x221F;"/>
<xsl:output-character character="∠" string="&amp;#x2220;"/>
<xsl:output-character character="∡" string="&amp;#x2221;"/>
<xsl:output-character character="∢" string="&amp;#x2222;"/>
<xsl:output-character character="∣" string="&amp;#x2223;"/>
<xsl:output-character character="∤" string="&amp;#x2224;"/>
<xsl:output-character character="∥" string="&amp;#x2225;"/>
<xsl:output-character character="∦" string="&amp;#x2226;"/>
<xsl:output-character character="∧" string="&amp;#x2227;"/>
<xsl:output-character character="∨" string="&amp;#x2228;"/>
<xsl:output-character character="∩" string="&amp;#x2229;"/>
<xsl:output-character character="∪" string="&amp;#x222A;"/>
<xsl:output-character character="∫" string="&amp;#x222B;"/>
<xsl:output-character character="∬" string="&amp;#x222C;"/>
<xsl:output-character character="∭" string="&amp;#x222D;"/>
<xsl:output-character character="∮" string="&amp;#x222E;"/>
<xsl:output-character character="∯" string="&amp;#x222F;"/>
<xsl:output-character character="∰" string="&amp;#x2230;"/>
<xsl:output-character character="∱" string="&amp;#x2231;"/>
<xsl:output-character character="∲" string="&amp;#x2232;"/>
<xsl:output-character character="∳" string="&amp;#x2233;"/>
<xsl:output-character character="∴" string="&amp;#x2234;"/>
<xsl:output-character character="∵" string="&amp;#x2235;"/>
<xsl:output-character character="∶" string="&amp;#x2236;"/>
<xsl:output-character character="∷" string="&amp;#x2237;"/>
<xsl:output-character character="∸" string="&amp;#x2238;"/>
<xsl:output-character character="∺" string="&amp;#x223A;"/>
<xsl:output-character character="∻" string="&amp;#x223B;"/>
<xsl:output-character character="∼" string="&amp;#x223C;"/>
<xsl:output-character character="∽" string="&amp;#x223D;"/>
<xsl:output-character character="∾" string="&amp;#x223E;"/>
<xsl:output-character character="∿" string="&amp;#x223F;"/>
<xsl:output-character character="≀" string="&amp;#x2240;"/>
<xsl:output-character character="≁" string="&amp;#x2241;"/>
<xsl:output-character character="≂" string="&amp;#x2242;"/>
<xsl:output-character character="≃" string="&amp;#x2243;"/>
<xsl:output-character character="≄" string="&amp;#x2244;"/>
<xsl:output-character character="≅" string="&amp;#x2245;"/>
<xsl:output-character character="≆" string="&amp;#x2246;"/>
<xsl:output-character character="≇" string="&amp;#x2247;"/>
<xsl:output-character character="≈" string="&amp;#x2248;"/>
<xsl:output-character character="≉" string="&amp;#x2249;"/>
<xsl:output-character character="≊" string="&amp;#x224A;"/>
<xsl:output-character character="≋" string="&amp;#x224B;"/>
<xsl:output-character character="≌" string="&amp;#x224C;"/>
<xsl:output-character character="≎" string="&amp;#x224E;"/>
<xsl:output-character character="≏" string="&amp;#x224F;"/>
<xsl:output-character character="≐" string="&amp;#x2250;"/>
<xsl:output-character character="≑" string="&amp;#x2251;"/>
<xsl:output-character character="≒" string="&amp;#x2252;"/>
<xsl:output-character character="≓" string="&amp;#x2253;"/>
<xsl:output-character character="≔" string="&amp;#x2254;"/>
<xsl:output-character character="≕" string="&amp;#x2255;"/>
<xsl:output-character character="≖" string="&amp;#x2256;"/>
<xsl:output-character character="≗" string="&amp;#x2257;"/>
<xsl:output-character character="≙" string="&amp;#x2259;"/>
<xsl:output-character character="≚" string="&amp;#x225A;"/>
<xsl:output-character character="≜" string="&amp;#x225C;"/>
<xsl:output-character character="≟" string="&amp;#x225F;"/>
<xsl:output-character character="≠" string="&amp;#x2260;"/>
<xsl:output-character character="≡" string="&amp;#x2261;"/>
<xsl:output-character character="≢" string="&amp;#x2262;"/>
<xsl:output-character character="≤" string="&amp;#x2264;"/>
<xsl:output-character character="≥" string="&amp;#x2265;"/>
<xsl:output-character character="≦" string="&amp;#x2266;"/>
<xsl:output-character character="≧" string="&amp;#x2267;"/>
<xsl:output-character character="≨" string="&amp;#x2268;"/>
<xsl:output-character character="≩" string="&amp;#x2269;"/>
<xsl:output-character character="≪" string="&amp;#x226A;"/>
<xsl:output-character character="≫" string="&amp;#x226B;"/>
<xsl:output-character character="≬" string="&amp;#x226C;"/>
<xsl:output-character character="≮" string="&amp;#x226E;"/>
<xsl:output-character character="≯" string="&amp;#x226F;"/>
<xsl:output-character character="≰" string="&amp;#x2270;"/>
<xsl:output-character character="≱" string="&amp;#x2271;"/>
<xsl:output-character character="≲" string="&amp;#x2272;"/>
<xsl:output-character character="≳" string="&amp;#x2273;"/>
<xsl:output-character character="≴" string="&amp;#x2274;"/>
<xsl:output-character character="≵" string="&amp;#x2275;"/>
<xsl:output-character character="≶" string="&amp;#x2276;"/>
<xsl:output-character character="≷" string="&amp;#x2277;"/>
<xsl:output-character character="≸" string="&amp;#x2278;"/>
<xsl:output-character character="≹" string="&amp;#x2279;"/>
<xsl:output-character character="≺" string="&amp;#x227A;"/>
<xsl:output-character character="≻" string="&amp;#x227B;"/>
<xsl:output-character character="≼" string="&amp;#x227C;"/>
<xsl:output-character character="≽" string="&amp;#x227D;"/>
<xsl:output-character character="≾" string="&amp;#x227E;"/>
<xsl:output-character character="≿" string="&amp;#x227F;"/>
<xsl:output-character character="⊀" string="&amp;#x2280;"/>
<xsl:output-character character="⊁" string="&amp;#x2281;"/>
<xsl:output-character character="⊂" string="&amp;#x2282;"/>
<xsl:output-character character="⊃" string="&amp;#x2283;"/>
<xsl:output-character character="⊄" string="&amp;#x2284;"/>
<xsl:output-character character="⊅" string="&amp;#x2285;"/>
<xsl:output-character character="⊆" string="&amp;#x2286;"/>
<xsl:output-character character="⊇" string="&amp;#x2287;"/>
<xsl:output-character character="⊈" string="&amp;#x2288;"/>
<xsl:output-character character="⊉" string="&amp;#x2289;"/>
<xsl:output-character character="⊊" string="&amp;#x228A;"/>
<xsl:output-character character="⊋" string="&amp;#x228B;"/>
<xsl:output-character character="⊍" string="&amp;#x228D;"/>
<xsl:output-character character="⊎" string="&amp;#x228E;"/>
<xsl:output-character character="⊏" string="&amp;#x228F;"/>
<xsl:output-character character="⊐" string="&amp;#x2290;"/>
<xsl:output-character character="⊑" string="&amp;#x2291;"/>
<xsl:output-character character="⊒" string="&amp;#x2292;"/>
<xsl:output-character character="⊓" string="&amp;#x2293;"/>
<xsl:output-character character="⊔" string="&amp;#x2294;"/>
<xsl:output-character character="⊕" string="&amp;#x2295;"/>
<xsl:output-character character="⊖" string="&amp;#x2296;"/>
<xsl:output-character character="⊗" string="&amp;#x2297;"/>
<xsl:output-character character="⊘" string="&amp;#x2298;"/>
<xsl:output-character character="⊙" string="&amp;#x2299;"/>
<xsl:output-character character="⊚" string="&amp;#x229A;"/>
<xsl:output-character character="⊛" string="&amp;#x229B;"/>
<xsl:output-character character="⊝" string="&amp;#x229D;"/>
<xsl:output-character character="⊞" string="&amp;#x229E;"/>
<xsl:output-character character="⊟" string="&amp;#x229F;"/>
<xsl:output-character character="⊠" string="&amp;#x22A0;"/>
<xsl:output-character character="⊡" string="&amp;#x22A1;"/>
<xsl:output-character character="⊢" string="&amp;#x22A2;"/>
<xsl:output-character character="⊣" string="&amp;#x22A3;"/>
<xsl:output-character character="⊤" string="&amp;#x22A4;"/>
<xsl:output-character character="⊥" string="&amp;#x22A5;"/>
<xsl:output-character character="⊧" string="&amp;#x22A7;"/>
<xsl:output-character character="⊨" string="&amp;#x22A8;"/>
<xsl:output-character character="⊩" string="&amp;#x22A9;"/>
<xsl:output-character character="⊪" string="&amp;#x22AA;"/>
<xsl:output-character character="⊫" string="&amp;#x22AB;"/>
<xsl:output-character character="⊬" string="&amp;#x22AC;"/>
<xsl:output-character character="⊭" string="&amp;#x22AD;"/>
<xsl:output-character character="⊮" string="&amp;#x22AE;"/>
<xsl:output-character character="⊯" string="&amp;#x22AF;"/>
<xsl:output-character character="⊰" string="&amp;#x22B0;"/>
<xsl:output-character character="⊲" string="&amp;#x22B2;"/>
<xsl:output-character character="⊳" string="&amp;#x22B3;"/>
<xsl:output-character character="⊴" string="&amp;#x22B4;"/>
<xsl:output-character character="⊵" string="&amp;#x22B5;"/>
<xsl:output-character character="⊶" string="&amp;#x22B6;"/>
<xsl:output-character character="⊷" string="&amp;#x22B7;"/>
<xsl:output-character character="⊸" string="&amp;#x22B8;"/>
<xsl:output-character character="⊹" string="&amp;#x22B9;"/>
<xsl:output-character character="⊺" string="&amp;#x22BA;"/>
<xsl:output-character character="⊻" string="&amp;#x22BB;"/>
<xsl:output-character character="⊽" string="&amp;#x22BD;"/>
<xsl:output-character character="⊾" string="&amp;#x22BE;"/>
<xsl:output-character character="⊿" string="&amp;#x22BF;"/>
<xsl:output-character character="⋀" string="&amp;#x22C0;"/>
<xsl:output-character character="⋁" string="&amp;#x22C1;"/>
<xsl:output-character character="⋂" string="&amp;#x22C2;"/>
<xsl:output-character character="⋃" string="&amp;#x22C3;"/>
<xsl:output-character character="⋄" string="&amp;#x22C4;"/>
<xsl:output-character character="⋅" string="&amp;#x22C5;"/>
<xsl:output-character character="⋆" string="&amp;#x22C6;"/>
<xsl:output-character character="⋇" string="&amp;#x22C7;"/>
<xsl:output-character character="⋈" string="&amp;#x22C8;"/>
<xsl:output-character character="⋉" string="&amp;#x22C9;"/>
<xsl:output-character character="⋊" string="&amp;#x22CA;"/>
<xsl:output-character character="⋋" string="&amp;#x22CB;"/>
<xsl:output-character character="⋌" string="&amp;#x22CC;"/>
<xsl:output-character character="⋍" string="&amp;#x22CD;"/>
<xsl:output-character character="⋎" string="&amp;#x22CE;"/>
<xsl:output-character character="⋏" string="&amp;#x22CF;"/>
<xsl:output-character character="⋐" string="&amp;#x22D0;"/>
<xsl:output-character character="⋑" string="&amp;#x22D1;"/>
<xsl:output-character character="⋒" string="&amp;#x22D2;"/>
<xsl:output-character character="⋓" string="&amp;#x22D3;"/>
<xsl:output-character character="⋔" string="&amp;#x22D4;"/>
<xsl:output-character character="⋕" string="&amp;#x22D5;"/>
<xsl:output-character character="⋖" string="&amp;#x22D6;"/>
<xsl:output-character character="⋗" string="&amp;#x22D7;"/>
<xsl:output-character character="⋘" string="&amp;#x22D8;"/>
<xsl:output-character character="⋙" string="&amp;#x22D9;"/>
<xsl:output-character character="⋚" string="&amp;#x22DA;"/>
<xsl:output-character character="⋛" string="&amp;#x22DB;"/>
<xsl:output-character character="⋞" string="&amp;#x22DE;"/>
<xsl:output-character character="⋟" string="&amp;#x22DF;"/>
<xsl:output-character character="⋠" string="&amp;#x22E0;"/>
<xsl:output-character character="⋡" string="&amp;#x22E1;"/>
<xsl:output-character character="⋢" string="&amp;#x22E2;"/>
<xsl:output-character character="⋣" string="&amp;#x22E3;"/>
<xsl:output-character character="⋦" string="&amp;#x22E6;"/>
<xsl:output-character character="⋧" string="&amp;#x22E7;"/>
<xsl:output-character character="⋨" string="&amp;#x22E8;"/>
<xsl:output-character character="⋩" string="&amp;#x22E9;"/>
<xsl:output-character character="⋪" string="&amp;#x22EA;"/>
<xsl:output-character character="⋫" string="&amp;#x22EB;"/>
<xsl:output-character character="⋬" string="&amp;#x22EC;"/>
<xsl:output-character character="⋭" string="&amp;#x22ED;"/>
<xsl:output-character character="⋮" string="&amp;#x22EE;"/>
<xsl:output-character character="⋯" string="&amp;#x22EF;"/>
<xsl:output-character character="⋰" string="&amp;#x22F0;"/>
<xsl:output-character character="⋱" string="&amp;#x22F1;"/>
<xsl:output-character character="⋲" string="&amp;#x22F2;"/>
<xsl:output-character character="⋳" string="&amp;#x22F3;"/>
<xsl:output-character character="⋴" string="&amp;#x22F4;"/>
<xsl:output-character character="⋵" string="&amp;#x22F5;"/>
<xsl:output-character character="⋶" string="&amp;#x22F6;"/>
<xsl:output-character character="⋷" string="&amp;#x22F7;"/>
<xsl:output-character character="⋹" string="&amp;#x22F9;"/>
<xsl:output-character character="⋺" string="&amp;#x22FA;"/>
<xsl:output-character character="⋻" string="&amp;#x22FB;"/>
<xsl:output-character character="⋼" string="&amp;#x22FC;"/>
<xsl:output-character character="⋽" string="&amp;#x22FD;"/>
<xsl:output-character character="⋾" string="&amp;#x22FE;"/>
<xsl:output-character character="⌅" string="&amp;#x2305;"/>
<xsl:output-character character="⌆" string="&amp;#x2306;"/>
<xsl:output-character character="⌈" string="&amp;#x2308;"/>
<xsl:output-character character="⌉" string="&amp;#x2309;"/>
<xsl:output-character character="⌊" string="&amp;#x230A;"/>
<xsl:output-character character="⌋" string="&amp;#x230B;"/>
<xsl:output-character character="⌌" string="&amp;#x230C;"/>
<xsl:output-character character="⌍" string="&amp;#x230D;"/>
<xsl:output-character character="⌎" string="&amp;#x230E;"/>
<xsl:output-character character="⌏" string="&amp;#x230F;"/>
<xsl:output-character character="⌐" string="&amp;#x2310;"/>
<xsl:output-character character="⌒" string="&amp;#x2312;"/>
<xsl:output-character character="⌓" string="&amp;#x2313;"/>
<xsl:output-character character="⌕" string="&amp;#x2315;"/>
<xsl:output-character character="⌖" string="&amp;#x2316;"/>
<xsl:output-character character="⌜" string="&amp;#x231C;"/>
<xsl:output-character character="⌝" string="&amp;#x231D;"/>
<xsl:output-character character="⌞" string="&amp;#x231E;"/>
<xsl:output-character character="⌟" string="&amp;#x231F;"/>
<xsl:output-character character="⌢" string="&amp;#x2322;"/>
<xsl:output-character character="⌣" string="&amp;#x2323;"/>
<xsl:output-character character="〈" string="&amp;#x2329;"/>
<xsl:output-character character="〉" string="&amp;#x232A;"/>
<xsl:output-character character="⌭" string="&amp;#x232D;"/>
<xsl:output-character character="⌮" string="&amp;#x232E;"/>
<xsl:output-character character="⌶" string="&amp;#x2336;"/>
<xsl:output-character character="⌽" string="&amp;#x233D;"/>
<xsl:output-character character="⌿" string="&amp;#x233F;"/>
<xsl:output-character character="⍼" string="&amp;#x237C;"/>
<xsl:output-character character="⎰" string="&amp;#x23B0;"/>
<xsl:output-character character="⎱" string="&amp;#x23B1;"/>
<xsl:output-character character="⎴" string="&amp;#x23B4;"/>
<xsl:output-character character="⎵" string="&amp;#x23B5;"/>
<xsl:output-character character="⎶" string="&amp;#x23B6;"/>
<xsl:output-character character="␣" string="&amp;#x2423;"/>
<xsl:output-character character="⒊" string="&amp;#x248A;"/>
<xsl:output-character character="Ⓢ" string="&amp;#x24C8;"/>
<xsl:output-character character="─" string="&amp;#x2500;"/>
<xsl:output-character character="│" string="&amp;#x2502;"/>
<xsl:output-character character="┌" string="&amp;#x250C;"/>
<xsl:output-character character="┐" string="&amp;#x2510;"/>
<xsl:output-character character="└" string="&amp;#x2514;"/>
<xsl:output-character character="┘" string="&amp;#x2518;"/>
<xsl:output-character character="├" string="&amp;#x251C;"/>
<xsl:output-character character="┤" string="&amp;#x2524;"/>
<xsl:output-character character="┬" string="&amp;#x252C;"/>
<xsl:output-character character="┴" string="&amp;#x2534;"/>
<xsl:output-character character="┼" string="&amp;#x253C;"/>
<xsl:output-character character="═" string="&amp;#x2550;"/>
<xsl:output-character character="║" string="&amp;#x2551;"/>
<xsl:output-character character="╒" string="&amp;#x2552;"/>
<xsl:output-character character="╓" string="&amp;#x2553;"/>
<xsl:output-character character="╔" string="&amp;#x2554;"/>
<xsl:output-character character="╕" string="&amp;#x2555;"/>
<xsl:output-character character="╖" string="&amp;#x2556;"/>
<xsl:output-character character="╗" string="&amp;#x2557;"/>
<xsl:output-character character="╘" string="&amp;#x2558;"/>
<xsl:output-character character="╙" string="&amp;#x2559;"/>
<xsl:output-character character="╚" string="&amp;#x255A;"/>
<xsl:output-character character="╛" string="&amp;#x255B;"/>
<xsl:output-character character="╜" string="&amp;#x255C;"/>
<xsl:output-character character="╝" string="&amp;#x255D;"/>
<xsl:output-character character="╞" string="&amp;#x255E;"/>
<xsl:output-character character="╟" string="&amp;#x255F;"/>
<xsl:output-character character="╠" string="&amp;#x2560;"/>
<xsl:output-character character="╡" string="&amp;#x2561;"/>
<xsl:output-character character="╢" string="&amp;#x2562;"/>
<xsl:output-character character="╣" string="&amp;#x2563;"/>
<xsl:output-character character="╤" string="&amp;#x2564;"/>
<xsl:output-character character="╥" string="&amp;#x2565;"/>
<xsl:output-character character="╦" string="&amp;#x2566;"/>
<xsl:output-character character="╧" string="&amp;#x2567;"/>
<xsl:output-character character="╨" string="&amp;#x2568;"/>
<xsl:output-character character="╩" string="&amp;#x2569;"/>
<xsl:output-character character="╪" string="&amp;#x256A;"/>
<xsl:output-character character="╫" string="&amp;#x256B;"/>
<xsl:output-character character="╬" string="&amp;#x256C;"/>
<xsl:output-character character="▀" string="&amp;#x2580;"/>
<xsl:output-character character="▄" string="&amp;#x2584;"/>
<xsl:output-character character="█" string="&amp;#x2588;"/>
<xsl:output-character character="░" string="&amp;#x2591;"/>
<xsl:output-character character="▒" string="&amp;#x2592;"/>
<xsl:output-character character="▓" string="&amp;#x2593;"/>
<xsl:output-character character="□" string="&amp;#x25A1;"/>
<xsl:output-character character="▪" string="&amp;#x25AA;"/>
<xsl:output-character character="▭" string="&amp;#x25AD;"/>
<xsl:output-character character="▮" string="&amp;#x25AE;"/>
<xsl:output-character character="▱" string="&amp;#x25B1;"/>
<xsl:output-character character="△" string="&amp;#x25B3;"/>
<xsl:output-character character="▴" string="&amp;#x25B4;"/>
<xsl:output-character character="▵" string="&amp;#x25B5;"/>
<xsl:output-character character="▸" string="&amp;#x25B8;"/>
<xsl:output-character character="▹" string="&amp;#x25B9;"/>
<xsl:output-character character="▽" string="&amp;#x25BD;"/>
<xsl:output-character character="▾" string="&amp;#x25BE;"/>
<xsl:output-character character="▿" string="&amp;#x25BF;"/>
<xsl:output-character character="◂" string="&amp;#x25C2;"/>
<xsl:output-character character="◃" string="&amp;#x25C3;"/>
<xsl:output-character character="◊" string="&amp;#x25CA;"/>
<xsl:output-character character="○" string="&amp;#x25CB;"/>
<xsl:output-character character="◬" string="&amp;#x25EC;"/>
<xsl:output-character character="◯" string="&amp;#x25EF;"/>
<xsl:output-character character="◸" string="&amp;#x25F8;"/>
<xsl:output-character character="◹" string="&amp;#x25F9;"/>
<xsl:output-character character="◺" string="&amp;#x25FA;"/>
<xsl:output-character character="★" string="&amp;#x2605;"/>
<xsl:output-character character="☆" string="&amp;#x2606;"/>
<xsl:output-character character="☎" string="&amp;#x260E;"/>
<xsl:output-character character="♀" string="&amp;#x2640;"/>
<xsl:output-character character="♂" string="&amp;#x2642;"/>
<xsl:output-character character="♠" string="&amp;#x2660;"/>
<xsl:output-character character="♣" string="&amp;#x2663;"/>
<xsl:output-character character="♥" string="&amp;#x2665;"/>
<xsl:output-character character="♦" string="&amp;#x2666;"/>
<xsl:output-character character="♪" string="&amp;#x266A;"/>
<xsl:output-character character="♭" string="&amp;#x266D;"/>
<xsl:output-character character="♮" string="&amp;#x266E;"/>
<xsl:output-character character="♯" string="&amp;#x266F;"/>
<xsl:output-character character="✓" string="&amp;#x2713;"/>
<xsl:output-character character="✗" string="&amp;#x2717;"/>
<xsl:output-character character="✠" string="&amp;#x2720;"/>
<xsl:output-character character="✶" string="&amp;#x2736;"/>
<xsl:output-character character="⟵" string="&amp;#x27F5;"/>
<xsl:output-character character="⟶" string="&amp;#x27F6;"/>
<xsl:output-character character="⟷" string="&amp;#x27F7;"/>
<xsl:output-character character="⟸" string="&amp;#x27F8;"/>
<xsl:output-character character="⟹" string="&amp;#x27F9;"/>
<xsl:output-character character="⟺" string="&amp;#x27FA;"/>
<xsl:output-character character="⟼" string="&amp;#x27FC;"/>
<xsl:output-character character="⟿" string="&amp;#x27FF;"/>
<xsl:output-character character="⤂" string="&amp;#x2902;"/>
<xsl:output-character character="⤃" string="&amp;#x2903;"/>
<xsl:output-character character="⤄" string="&amp;#x2904;"/>
<xsl:output-character character="⤅" string="&amp;#x2905;"/>
<xsl:output-character character="⤌" string="&amp;#x290C;"/>
<xsl:output-character character="⤍" string="&amp;#x290D;"/>
<xsl:output-character character="⤎" string="&amp;#x290E;"/>
<xsl:output-character character="⤏" string="&amp;#x290F;"/>
<xsl:output-character character="⤐" string="&amp;#x2910;"/>
<xsl:output-character character="⤑" string="&amp;#x2911;"/>
<xsl:output-character character="⤖" string="&amp;#x2916;"/>
<xsl:output-character character="⤙" string="&amp;#x2919;"/>
<xsl:output-character character="⤚" string="&amp;#x291A;"/>
<xsl:output-character character="⤛" string="&amp;#x291B;"/>
<xsl:output-character character="⤜" string="&amp;#x291C;"/>
<xsl:output-character character="⤝" string="&amp;#x291D;"/>
<xsl:output-character character="⤞" string="&amp;#x291E;"/>
<xsl:output-character character="⤟" string="&amp;#x291F;"/>
<xsl:output-character character="⤠" string="&amp;#x2920;"/>
<xsl:output-character character="⤣" string="&amp;#x2923;"/>
<xsl:output-character character="⤤" string="&amp;#x2924;"/>
<xsl:output-character character="⤥" string="&amp;#x2925;"/>
<xsl:output-character character="⤦" string="&amp;#x2926;"/>
<xsl:output-character character="⤧" string="&amp;#x2927;"/>
<xsl:output-character character="⤨" string="&amp;#x2928;"/>
<xsl:output-character character="⤩" string="&amp;#x2929;"/>
<xsl:output-character character="⤪" string="&amp;#x292A;"/>
<xsl:output-character character="⤳" string="&amp;#x2933;"/>
<xsl:output-character character="⤵" string="&amp;#x2935;"/>
<xsl:output-character character="⤶" string="&amp;#x2936;"/>
<xsl:output-character character="⤷" string="&amp;#x2937;"/>
<xsl:output-character character="⤸" string="&amp;#x2938;"/>
<xsl:output-character character="⤹" string="&amp;#x2939;"/>
<xsl:output-character character="⤼" string="&amp;#x293C;"/>
<xsl:output-character character="⤽" string="&amp;#x293D;"/>
<xsl:output-character character="⥅" string="&amp;#x2945;"/>
<xsl:output-character character="⥈" string="&amp;#x2948;"/>
<xsl:output-character character="⥉" string="&amp;#x2949;"/>
<xsl:output-character character="⥊" string="&amp;#x294A;"/>
<xsl:output-character character="⥋" string="&amp;#x294B;"/>
<xsl:output-character character="⥢" string="&amp;#x2962;"/>
<xsl:output-character character="⥣" string="&amp;#x2963;"/>
<xsl:output-character character="⥤" string="&amp;#x2964;"/>
<xsl:output-character character="⥥" string="&amp;#x2965;"/>
<xsl:output-character character="⥦" string="&amp;#x2966;"/>
<xsl:output-character character="⥧" string="&amp;#x2967;"/>
<xsl:output-character character="⥨" string="&amp;#x2968;"/>
<xsl:output-character character="⥩" string="&amp;#x2969;"/>
<xsl:output-character character="⥪" string="&amp;#x296A;"/>
<xsl:output-character character="⥫" string="&amp;#x296B;"/>
<xsl:output-character character="⥬" string="&amp;#x296C;"/>
<xsl:output-character character="⥭" string="&amp;#x296D;"/>
<xsl:output-character character="⥮" string="&amp;#x296E;"/>
<xsl:output-character character="⥯" string="&amp;#x296F;"/>
<xsl:output-character character="⥱" string="&amp;#x2971;"/>
<xsl:output-character character="⥲" string="&amp;#x2972;"/>
<xsl:output-character character="⥳" string="&amp;#x2973;"/>
<xsl:output-character character="⥴" string="&amp;#x2974;"/>
<xsl:output-character character="⥵" string="&amp;#x2975;"/>
<xsl:output-character character="⥶" string="&amp;#x2976;"/>
<xsl:output-character character="⥸" string="&amp;#x2978;"/>
<xsl:output-character character="⥹" string="&amp;#x2979;"/>
<xsl:output-character character="⥻" string="&amp;#x297B;"/>
<xsl:output-character character="⥼" string="&amp;#x297C;"/>
<xsl:output-character character="⥽" string="&amp;#x297D;"/>
<xsl:output-character character="⥾" string="&amp;#x297E;"/>
<xsl:output-character character="⥿" string="&amp;#x297F;"/>
<xsl:output-character character="⦅" string="&amp;#x2985;"/>
<xsl:output-character character="⦆" string="&amp;#x2986;"/>
<xsl:output-character character="⦋" string="&amp;#x298B;"/>
<xsl:output-character character="⦌" string="&amp;#x298C;"/>
<xsl:output-character character="⦍" string="&amp;#x298D;"/>
<xsl:output-character character="⦎" string="&amp;#x298E;"/>
<xsl:output-character character="⦏" string="&amp;#x298F;"/>
<xsl:output-character character="⦐" string="&amp;#x2990;"/>
<xsl:output-character character="⦑" string="&amp;#x2991;"/>
<xsl:output-character character="⦒" string="&amp;#x2992;"/>
<xsl:output-character character="⦓" string="&amp;#x2993;"/>
<xsl:output-character character="⦔" string="&amp;#x2994;"/>
<xsl:output-character character="⦕" string="&amp;#x2995;"/>
<xsl:output-character character="⦖" string="&amp;#x2996;"/>
<xsl:output-character character="⦚" string="&amp;#x299A;"/>
<xsl:output-character character="⦜" string="&amp;#x299C;"/>
<xsl:output-character character="⦝" string="&amp;#x299D;"/>
<xsl:output-character character="⦤" string="&amp;#x29A4;"/>
<xsl:output-character character="⦥" string="&amp;#x29A5;"/>
<xsl:output-character character="⦦" string="&amp;#x29A6;"/>
<xsl:output-character character="⦧" string="&amp;#x29A7;"/>
<xsl:output-character character="⦨" string="&amp;#x29A8;"/>
<xsl:output-character character="⦩" string="&amp;#x29A9;"/>
<xsl:output-character character="⦪" string="&amp;#x29AA;"/>
<xsl:output-character character="⦫" string="&amp;#x29AB;"/>
<xsl:output-character character="⦬" string="&amp;#x29AC;"/>
<xsl:output-character character="⦭" string="&amp;#x29AD;"/>
<xsl:output-character character="⦮" string="&amp;#x29AE;"/>
<xsl:output-character character="⦯" string="&amp;#x29AF;"/>
<xsl:output-character character="⦰" string="&amp;#x29B0;"/>
<xsl:output-character character="⦱" string="&amp;#x29B1;"/>
<xsl:output-character character="⦲" string="&amp;#x29B2;"/>
<xsl:output-character character="⦳" string="&amp;#x29B3;"/>
<xsl:output-character character="⦴" string="&amp;#x29B4;"/>
<xsl:output-character character="⦵" string="&amp;#x29B5;"/>
<xsl:output-character character="⦶" string="&amp;#x29B6;"/>
<xsl:output-character character="⦷" string="&amp;#x29B7;"/>
<xsl:output-character character="⦹" string="&amp;#x29B9;"/>
<xsl:output-character character="⦻" string="&amp;#x29BB;"/>
<xsl:output-character character="⦼" string="&amp;#x29BC;"/>
<xsl:output-character character="⦾" string="&amp;#x29BE;"/>
<xsl:output-character character="⦿" string="&amp;#x29BF;"/>
<xsl:output-character character="⧀" string="&amp;#x29C0;"/>
<xsl:output-character character="⧁" string="&amp;#x29C1;"/>
<xsl:output-character character="⧂" string="&amp;#x29C2;"/>
<xsl:output-character character="⧃" string="&amp;#x29C3;"/>
<xsl:output-character character="⧄" string="&amp;#x29C4;"/>
<xsl:output-character character="⧅" string="&amp;#x29C5;"/>
<xsl:output-character character="⧉" string="&amp;#x29C9;"/>
<xsl:output-character character="⧍" string="&amp;#x29CD;"/>
<xsl:output-character character="⧎" string="&amp;#x29CE;"/>
<xsl:output-character character="⧚" string="&amp;#x29DA;"/>
<xsl:output-character character="⧜" string="&amp;#x29DC;"/>
<xsl:output-character character="⧝" string="&amp;#x29DD;"/>
<xsl:output-character character="⧞" string="&amp;#x29DE;"/>
<xsl:output-character character="⧣" string="&amp;#x29E3;"/>
<xsl:output-character character="⧤" string="&amp;#x29E4;"/>
<xsl:output-character character="⧥" string="&amp;#x29E5;"/>
<xsl:output-character character="⧫" string="&amp;#x29EB;"/>
<xsl:output-character character="⧶" string="&amp;#x29F6;"/>
<xsl:output-character character="⨀" string="&amp;#x2A00;"/>
<xsl:output-character character="⨁" string="&amp;#x2A01;"/>
<xsl:output-character character="⨂" string="&amp;#x2A02;"/>
<xsl:output-character character="⨄" string="&amp;#x2A04;"/>
<xsl:output-character character="⨆" string="&amp;#x2A06;"/>
<xsl:output-character character="⨌" string="&amp;#x2A0C;"/>
<xsl:output-character character="⨍" string="&amp;#x2A0D;"/>
<xsl:output-character character="⨐" string="&amp;#x2A10;"/>
<xsl:output-character character="⨑" string="&amp;#x2A11;"/>
<xsl:output-character character="⨒" string="&amp;#x2A12;"/>
<xsl:output-character character="⨓" string="&amp;#x2A13;"/>
<xsl:output-character character="⨔" string="&amp;#x2A14;"/>
<xsl:output-character character="⨕" string="&amp;#x2A15;"/>
<xsl:output-character character="⨖" string="&amp;#x2A16;"/>
<xsl:output-character character="⨗" string="&amp;#x2A17;"/>
<xsl:output-character character="⨢" string="&amp;#x2A22;"/>
<xsl:output-character character="⨣" string="&amp;#x2A23;"/>
<xsl:output-character character="⨤" string="&amp;#x2A24;"/>
<xsl:output-character character="⨥" string="&amp;#x2A25;"/>
<xsl:output-character character="⨦" string="&amp;#x2A26;"/>
<xsl:output-character character="⨧" string="&amp;#x2A27;"/>
<xsl:output-character character="⨩" string="&amp;#x2A29;"/>
<xsl:output-character character="⨪" string="&amp;#x2A2A;"/>
<xsl:output-character character="⨭" string="&amp;#x2A2D;"/>
<xsl:output-character character="⨮" string="&amp;#x2A2E;"/>
<xsl:output-character character="⨰" string="&amp;#x2A30;"/>
<xsl:output-character character="⨱" string="&amp;#x2A31;"/>
<xsl:output-character character="⨳" string="&amp;#x2A33;"/>
<xsl:output-character character="⨴" string="&amp;#x2A34;"/>
<xsl:output-character character="⨵" string="&amp;#x2A35;"/>
<xsl:output-character character="⨶" string="&amp;#x2A36;"/>
<xsl:output-character character="⨷" string="&amp;#x2A37;"/>
<xsl:output-character character="⨸" string="&amp;#x2A38;"/>
<xsl:output-character character="⨹" string="&amp;#x2A39;"/>
<xsl:output-character character="⨺" string="&amp;#x2A3A;"/>
<xsl:output-character character="⨻" string="&amp;#x2A3B;"/>
<xsl:output-character character="⨼" string="&amp;#x2A3C;"/>
<xsl:output-character character="⨿" string="&amp;#x2A3F;"/>
<xsl:output-character character="⩀" string="&amp;#x2A40;"/>
<xsl:output-character character="⩂" string="&amp;#x2A42;"/>
<xsl:output-character character="⩃" string="&amp;#x2A43;"/>
<xsl:output-character character="⩄" string="&amp;#x2A44;"/>
<xsl:output-character character="⩅" string="&amp;#x2A45;"/>
<xsl:output-character character="⩆" string="&amp;#x2A46;"/>
<xsl:output-character character="⩇" string="&amp;#x2A47;"/>
<xsl:output-character character="⩈" string="&amp;#x2A48;"/>
<xsl:output-character character="⩉" string="&amp;#x2A49;"/>
<xsl:output-character character="⩊" string="&amp;#x2A4A;"/>
<xsl:output-character character="⩋" string="&amp;#x2A4B;"/>
<xsl:output-character character="⩌" string="&amp;#x2A4C;"/>
<xsl:output-character character="⩍" string="&amp;#x2A4D;"/>
<xsl:output-character character="⩐" string="&amp;#x2A50;"/>
<xsl:output-character character="⩓" string="&amp;#x2A53;"/>
<xsl:output-character character="⩔" string="&amp;#x2A54;"/>
<xsl:output-character character="⩕" string="&amp;#x2A55;"/>
<xsl:output-character character="⩖" string="&amp;#x2A56;"/>
<xsl:output-character character="⩗" string="&amp;#x2A57;"/>
<xsl:output-character character="⩘" string="&amp;#x2A58;"/>
<xsl:output-character character="⩚" string="&amp;#x2A5A;"/>
<xsl:output-character character="⩛" string="&amp;#x2A5B;"/>
<xsl:output-character character="⩜" string="&amp;#x2A5C;"/>
<xsl:output-character character="⩝" string="&amp;#x2A5D;"/>
<xsl:output-character character="⩟" string="&amp;#x2A5F;"/>
<xsl:output-character character="⩦" string="&amp;#x2A66;"/>
<xsl:output-character character="⩪" string="&amp;#x2A6A;"/>
<xsl:output-character character="⩭" string="&amp;#x2A6D;"/>
<xsl:output-character character="⩮" string="&amp;#x2A6E;"/>
<xsl:output-character character="⩯" string="&amp;#x2A6F;"/>
<xsl:output-character character="⩰" string="&amp;#x2A70;"/>
<xsl:output-character character="⩱" string="&amp;#x2A71;"/>
<xsl:output-character character="⩲" string="&amp;#x2A72;"/>
<xsl:output-character character="⩳" string="&amp;#x2A73;"/>
<xsl:output-character character="⩴" string="&amp;#x2A74;"/>
<xsl:output-character character="⩷" string="&amp;#x2A77;"/>
<xsl:output-character character="⩸" string="&amp;#x2A78;"/>
<xsl:output-character character="⩹" string="&amp;#x2A79;"/>
<xsl:output-character character="⩺" string="&amp;#x2A7A;"/>
<xsl:output-character character="⩻" string="&amp;#x2A7B;"/>
<xsl:output-character character="⩼" string="&amp;#x2A7C;"/>
<xsl:output-character character="⩽" string="&amp;#x2A7D;"/>
<xsl:output-character character="⩾" string="&amp;#x2A7E;"/>
<xsl:output-character character="⩿" string="&amp;#x2A7F;"/>
<xsl:output-character character="⪀" string="&amp;#x2A80;"/>
<xsl:output-character character="⪁" string="&amp;#x2A81;"/>
<xsl:output-character character="⪂" string="&amp;#x2A82;"/>
<xsl:output-character character="⪃" string="&amp;#x2A83;"/>
<xsl:output-character character="⪄" string="&amp;#x2A84;"/>
<xsl:output-character character="⪅" string="&amp;#x2A85;"/>
<xsl:output-character character="⪆" string="&amp;#x2A86;"/>
<xsl:output-character character="⪇" string="&amp;#x2A87;"/>
<xsl:output-character character="⪈" string="&amp;#x2A88;"/>
<xsl:output-character character="⪉" string="&amp;#x2A89;"/>
<xsl:output-character character="⪊" string="&amp;#x2A8A;"/>
<xsl:output-character character="⪋" string="&amp;#x2A8B;"/>
<xsl:output-character character="⪌" string="&amp;#x2A8C;"/>
<xsl:output-character character="⪍" string="&amp;#x2A8D;"/>
<xsl:output-character character="⪎" string="&amp;#x2A8E;"/>
<xsl:output-character character="⪏" string="&amp;#x2A8F;"/>
<xsl:output-character character="⪐" string="&amp;#x2A90;"/>
<xsl:output-character character="⪑" string="&amp;#x2A91;"/>
<xsl:output-character character="⪒" string="&amp;#x2A92;"/>
<xsl:output-character character="⪓" string="&amp;#x2A93;"/>
<xsl:output-character character="⪔" string="&amp;#x2A94;"/>
<xsl:output-character character="⪕" string="&amp;#x2A95;"/>
<xsl:output-character character="⪖" string="&amp;#x2A96;"/>
<xsl:output-character character="⪗" string="&amp;#x2A97;"/>
<xsl:output-character character="⪘" string="&amp;#x2A98;"/>
<xsl:output-character character="⪙" string="&amp;#x2A99;"/>
<xsl:output-character character="⪚" string="&amp;#x2A9A;"/>
<xsl:output-character character="⪝" string="&amp;#x2A9D;"/>
<xsl:output-character character="⪞" string="&amp;#x2A9E;"/>
<xsl:output-character character="⪟" string="&amp;#x2A9F;"/>
<xsl:output-character character="⪠" string="&amp;#x2AA0;"/>
<xsl:output-character character="⪤" string="&amp;#x2AA4;"/>
<xsl:output-character character="⪥" string="&amp;#x2AA5;"/>
<xsl:output-character character="⪦" string="&amp;#x2AA6;"/>
<xsl:output-character character="⪧" string="&amp;#x2AA7;"/>
<xsl:output-character character="⪨" string="&amp;#x2AA8;"/>
<xsl:output-character character="⪩" string="&amp;#x2AA9;"/>
<xsl:output-character character="⪪" string="&amp;#x2AAA;"/>
<xsl:output-character character="⪫" string="&amp;#x2AAB;"/>
<xsl:output-character character="⪬" string="&amp;#x2AAC;"/>
<xsl:output-character character="⪭" string="&amp;#x2AAD;"/>
<xsl:output-character character="⪮" string="&amp;#x2AAE;"/>
<xsl:output-character character="⪯" string="&amp;#x2AAF;"/>
<xsl:output-character character="⪰" string="&amp;#x2AB0;"/>
<xsl:output-character character="⪳" string="&amp;#x2AB3;"/>
<xsl:output-character character="⪴" string="&amp;#x2AB4;"/>
<xsl:output-character character="⪵" string="&amp;#x2AB5;"/>
<xsl:output-character character="⪶" string="&amp;#x2AB6;"/>
<xsl:output-character character="⪷" string="&amp;#x2AB7;"/>
<xsl:output-character character="⪸" string="&amp;#x2AB8;"/>
<xsl:output-character character="⪹" string="&amp;#x2AB9;"/>
<xsl:output-character character="⪺" string="&amp;#x2ABA;"/>
<xsl:output-character character="⪻" string="&amp;#x2ABB;"/>
<xsl:output-character character="⪼" string="&amp;#x2ABC;"/>
<xsl:output-character character="⪽" string="&amp;#x2ABD;"/>
<xsl:output-character character="⪾" string="&amp;#x2ABE;"/>
<xsl:output-character character="⪿" string="&amp;#x2ABF;"/>
<xsl:output-character character="⫀" string="&amp;#x2AC0;"/>
<xsl:output-character character="⫁" string="&amp;#x2AC1;"/>
<xsl:output-character character="⫂" string="&amp;#x2AC2;"/>
<xsl:output-character character="⫃" string="&amp;#x2AC3;"/>
<xsl:output-character character="⫄" string="&amp;#x2AC4;"/>
<xsl:output-character character="⫅" string="&amp;#x2AC5;"/>
<xsl:output-character character="⫆" string="&amp;#x2AC6;"/>
<xsl:output-character character="⫇" string="&amp;#x2AC7;"/>
<xsl:output-character character="⫈" string="&amp;#x2AC8;"/>
<xsl:output-character character="⫋" string="&amp;#x2ACB;"/>
<xsl:output-character character="⫌" string="&amp;#x2ACC;"/>
<xsl:output-character character="⫏" string="&amp;#x2ACF;"/>
<xsl:output-character character="⫐" string="&amp;#x2AD0;"/>
<xsl:output-character character="⫑" string="&amp;#x2AD1;"/>
<xsl:output-character character="⫒" string="&amp;#x2AD2;"/>
<xsl:output-character character="⫓" string="&amp;#x2AD3;"/>
<xsl:output-character character="⫔" string="&amp;#x2AD4;"/>
<xsl:output-character character="⫕" string="&amp;#x2AD5;"/>
<xsl:output-character character="⫖" string="&amp;#x2AD6;"/>
<xsl:output-character character="⫗" string="&amp;#x2AD7;"/>
<xsl:output-character character="⫘" string="&amp;#x2AD8;"/>
<xsl:output-character character="⫙" string="&amp;#x2AD9;"/>
<xsl:output-character character="⫚" string="&amp;#x2ADA;"/>
<xsl:output-character character="⫛" string="&amp;#x2ADB;"/>
<xsl:output-character character="⫤" string="&amp;#x2AE4;"/>
<xsl:output-character character="⫦" string="&amp;#x2AE6;"/>
<xsl:output-character character="⫧" string="&amp;#x2AE7;"/>
<xsl:output-character character="⫨" string="&amp;#x2AE8;"/>
<xsl:output-character character="⫩" string="&amp;#x2AE9;"/>
<xsl:output-character character="⫫" string="&amp;#x2AEB;"/>
<xsl:output-character character="⫬" string="&amp;#x2AEC;"/>
<xsl:output-character character="⫭" string="&amp;#x2AED;"/>
<xsl:output-character character="⫮" string="&amp;#x2AEE;"/>
<xsl:output-character character="⫯" string="&amp;#x2AEF;"/>
<xsl:output-character character="⫰" string="&amp;#x2AF0;"/>
<xsl:output-character character="⫱" string="&amp;#x2AF1;"/>
<xsl:output-character character="⫲" string="&amp;#x2AF2;"/>
<xsl:output-character character="⫳" string="&amp;#x2AF3;"/>
<xsl:output-character character="⫽" string="&amp;#x2AFD;"/>
<xsl:output-character character="《" string="&amp;#x300A;"/>
<xsl:output-character character="》" string="&amp;#x300B;"/>
<xsl:output-character character="〔" string="&amp;#x3014;"/>
<xsl:output-character character="〕" string="&amp;#x3015;"/>
<xsl:output-character character="〘" string="&amp;#x3018;"/>
<xsl:output-character character="〙" string="&amp;#x3019;"/>
<xsl:output-character character="〚" string="&amp;#x301A;"/>
<xsl:output-character character="〛" string="&amp;#x301B;"/>
<xsl:output-character character="" string="&amp;#xF061;"/>
<xsl:output-character character="" string="&amp;#xF062;"/>
<xsl:output-character character="" string="&amp;#xF066;"/>
<xsl:output-character character="ﬀ" string="&amp;#xFB00;"/>
<xsl:output-character character="ﬁ" string="&amp;#xFB01;"/>
<xsl:output-character character="ﬂ" string="&amp;#xFB02;"/>
<xsl:output-character character="ﬃ" string="&amp;#xFB03;"/>
<xsl:output-character character="ﬄ" string="&amp;#xFB04;"/>
<xsl:output-character character="�" string="&amp;#xFFFD;"/>
</xsl:character-map>
    
<!-- My called TEMPLATES from CK -->

  
  <xsl:template name="vertical-align">
   <!-- <xsl:param name="curStyle"/>-->
    <xsl:param name="basedOnStyle"/>
    <xsl:variable name="a" select="@w:styleId"/>
    <xsl:variable name="basedOn" select="./w:basedOn/@w:val"/>
<!--    <xsl:variable name="baseline" select="w:rPr/w:vertAlign/@w:val"/>-->
    <xsl:for-each select="//w:style[@w:styleId = $basedOn]">       
<!--      <xsl:if test="./@w:styleId = $basedOn">        -->
        <xsl:choose>
          <xsl:when test="./w:rPr/w:vertAlign">
            <xsl:choose>
              <xsl:when test="./w:rPr/w:vertAlign/@w:val = 'subscript'">
                <xsl:text>vertical-align:sub;</xsl:text>
                <xsl:text>font-size: 80%;</xsl:text>
              </xsl:when>
              <xsl:when test="./w:rPr/w:vertAlign/@w:val = 'superscript'">
                <xsl:text>vertical-align:super;</xsl:text>
                <xsl:text>font-size: 80%;</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:text>vertical-align:baseline;</xsl:text>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:text>&#x000A;</xsl:text> 
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="vertical-align">
              <xsl:with-param name="basedOnStyle" select="$basedOnStyle//w:basedOn/@w:val"/>
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>
      <!--</xsl:if>-->
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="text-decoration">
    <xsl:variable name="a" select="@w:styleId"/>
    <xsl:variable name="basedOn" select="./w:basedOn/@w:val"/>
    
    <xsl:for-each select="//w:style[@w:styleId = $basedOn]">       
      <!--<xsl:if test="./@w:styleId = $basedOn">-->        
        <xsl:choose>
          <xsl:when test="w:rPr/w:u">
            <xsl:choose>
              <xsl:when test="w:rPr/w:u[@w:val = 'double']">
                <xsl:text disable-output-escaping="yes">text-decoration:border-bottom: 3px double;</xsl:text>
              </xsl:when>
              <xsl:when test="w:rPr/w:u[@w:val = 'single']">
                <xsl:text>text-decoration:underline;</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:if test="not(w:rPr/w:u[@w:val = 'none'])">
                  <xsl:text>text-decoration:none;</xsl:text>
                </xsl:if>
              </xsl:otherwise>
            </xsl:choose>     
            <xsl:text>&#x000A;</xsl:text>  
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="text-decoration"/>
          </xsl:otherwise>
        </xsl:choose>
      <!--</xsl:if>-->
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="font-style">
    <xsl:variable name="a" select="@w:styleId"/>
    <xsl:variable name="basedOn" select="./w:basedOn/@w:val"/>
    <!--<xsl:variable name="fontStyle" select="w:rPr/w:i/@w:val"/>-->
    <xsl:for-each select="//w:style[@w:styleId = $basedOn]">       
<!--      <xsl:if test="./@w:styleId = $basedOn">        -->
        <xsl:choose>
          <xsl:when test="w:rPr/w:i">
            <xsl:choose>
              <xsl:when test="./w:rPr/w:i/@w:val = '0'">
                <xsl:text>font-style:normal;</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:text>font-style:italic;</xsl:text>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:text>&#x000A;</xsl:text> 
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="font-style"/>
          </xsl:otherwise>
        </xsl:choose>
      <!--</xsl:if>-->
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="font-weight">
    <xsl:variable name="a" select="@w:styleId"/>
    <xsl:variable name="basedOn" select="./w:basedOn/@w:val"/>    
    <xsl:for-each select="//w:style[@w:styleId = $basedOn]">       
<!--      <xsl:if test="./@w:styleId = $basedOn">        -->
        <xsl:choose>
          <xsl:when test="w:rPr/w:b">            
            <xsl:choose>
              <xsl:when test="./w:rPr/w:b/@w:val = '0'">
                <xsl:if test="not(w:basedOn)">
                <xsl:text>font-weight:normal;</xsl:text>
                </xsl:if>
              </xsl:when>
              <xsl:otherwise>                
                <xsl:text>font-weight:bold;</xsl:text>                
              </xsl:otherwise>
            </xsl:choose>   
            <xsl:text>&#x000A;</xsl:text> 
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="font-weight"/>
          </xsl:otherwise>
        </xsl:choose>
      <!--</xsl:if>-->
    </xsl:for-each>
  </xsl:template>
  
  <xsl:template name="color">    
    <xsl:variable name="a" select="@w:styleId"/>
    <xsl:variable name="basedOn" select="./w:basedOn/@w:val" as="xs:string*"/>
    
    <xsl:for-each select="//w:style[w:name/@w:val = $basedOn]">
      <xsl:variable name="color" select="./w:rPr/w:color/@w:val"/>
      <xsl:choose>
        <!--<xsl:when test="./w:basedOn">
          <xsl:call-template name="color"/>
        </xsl:when>-->
        <xsl:when test="string-length($color) > 0">         
          <xsl:choose>
            <xsl:when test="$color = 'auto'">              
            </xsl:when>
            <xsl:otherwise>                
              <xsl:text disable-output-escaping="yes">color: #</xsl:text>
              <xsl:value-of select="replace($color,',','')"/>                
            </xsl:otherwise>
          </xsl:choose>
          <xsl:text>;</xsl:text>
          <xsl:text>&#x000A;</xsl:text>
          
        </xsl:when>
        <!-- commented for cicerone Azure 14681 on 14-05-2024 -->
        <!--<xsl:otherwise>
          
          <xsl:call-template name="color"/>
        </xsl:otherwise>-->
      </xsl:choose>
      
    </xsl:for-each>
    
    
  </xsl:template>
  <xsl:template name="color2">
    <xsl:param name="currentStyle" as="node()*" required="yes"/>
    <xsl:variable name="a" select="@w:styleId"/>
    <xsl:variable name="basedOn" select="./w:basedOn/@w:val"/>
    <xsl:variable name="basedOnStyle" select="//w:style[w:name/@w:val = $basedOn]"></xsl:variable>
    <xsl:variable name="color" select="$basedOnStyle/w:rPr/w:color/@w:val"/>
       
    <xsl:choose>
      <!--<xsl:when test="./w:basedOn">
          <xsl:call-template name="color"/>
        </xsl:when>-->
      <xsl:when test="string-length($color) > 0">         
        <xsl:choose>
          <xsl:when test="$color = 'auto'">              
          </xsl:when>
          <xsl:otherwise>                
            <xsl:text disable-output-escaping="yes">color: #</xsl:text>
            <xsl:value-of select="replace($color,',','')"/>                
          </xsl:otherwise>
        </xsl:choose>
        <xsl:text>;</xsl:text>
        <xsl:text>&#x000A;</xsl:text>  
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="color2">
          <xsl:with-param name="currentStyle" select="$basedOnStyle"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
    
  </xsl:template>
  
  
  <xsl:template name="colorOLD">
    <xsl:variable name="a" select="@w:styleId"/>
    <xsl:variable name="basedOn" select="./w:basedOn/@w:val"/>
    
    <xsl:variable name="color" select="w:rPr/w:color/@w:val"/>
    
    <xsl:for-each select="//w:style[@w:styleId = $basedOn]">
        <xsl:variable name="color" select="w:rPr/w:color/@w:val"/>
        <xsl:choose>
          <xsl:when test="w:rPr/w:color">            
            <xsl:choose>
              <xsl:when test="$color = 'auto'">
              </xsl:when>
              <xsl:otherwise>                
                  <xsl:text disable-output-escaping="yes">color: #</xsl:text>
                <xsl:value-of select="replace($color,',','')"/>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:text>;</xsl:text>
            <xsl:text>&#x000A;</xsl:text>  
          </xsl:when>
          <xsl:otherwise>            
            <xsl:call-template name="color"/>            
          </xsl:otherwise>
        </xsl:choose>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="text-transform">
    <xsl:variable name="a" select="@w:styleId"/>
    <xsl:variable name="basedOn" select="./w:basedOn/@w:val"/>
    <xsl:variable name="link" select="./w:link/@w:val"/>
    <xsl:for-each select="//w:style[@w:styleId = $basedOn]">       
<!--      <xsl:if test="./@w:styleId = $basedOn">-->
        <!--<xsl:variable name="textTrans" select="./w:rPr/w:caps/@w:val"/>-->
        <xsl:choose>
          <xsl:when test="./w:rPr/w:caps">            
              <xsl:choose>
                <xsl:when test="./w:rPr/w:caps/@w:val = '0'">
                  <xsl:text>text-transform:none;</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:text>text-transform:uppercase;</xsl:text>
                </xsl:otherwise>
              </xsl:choose>  
            <xsl:text>&#x000A;</xsl:text> 
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="text-transform"/>
          </xsl:otherwise>
        </xsl:choose>
      <!--</xsl:if>-->
    </xsl:for-each>   
    
  </xsl:template>
  <xsl:template name="text-transform2">
        
    <xsl:variable name="link" select="./w:link/@w:val"/>
    <xsl:for-each select="//w:style[@w:styleId = $link]">       
      <!--      <xsl:if test="./@w:styleId = $basedOn">-->
      <!--<xsl:variable name="textTrans" select="./w:rPr/w:caps/@w:val"/>-->
      <xsl:choose>
        <xsl:when test="./w:rPr/w:caps">            
          <xsl:choose>
            <xsl:when test="./w:rPr/w:caps/@w:val = '0'">
              <xsl:text>text-transform:none;</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:text>text-transform:uppercase;</xsl:text>
            </xsl:otherwise>
          </xsl:choose>  
          <xsl:text>&#x000A;</xsl:text> 
        </xsl:when>
        <xsl:otherwise>
          <!--<xsl:call-template name="text-transform2"/>-->
        </xsl:otherwise>
      </xsl:choose>
      <!--</xsl:if>-->
    </xsl:for-each>
    
  </xsl:template>
  
  <xsl:template name="font-variant">
    <xsl:variable name="a" select="@w:styleId"/>
    <xsl:variable name="basedOn" select="./w:basedOn/@w:val"/>
    <xsl:for-each select="//w:style[@w:styleId = $basedOn]">       
<!--      <xsl:if test="./@w:styleId = $basedOn">-->
        <!--<xsl:variable name="textVarient" select="w:rPr/w:smallCaps/@w:val"/>-->
        <xsl:choose>
          <xsl:when test="./w:rPr/w:smallCaps">
            <xsl:choose>
              <xsl:when test="./w:rPr/w:smallCaps/@w:val = '0'">
                <xsl:text>font-variant:normal !important;</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:text>font-variant:small-caps !important;</xsl:text>
              </xsl:otherwise>
            </xsl:choose>  
            <xsl:text>&#x000A;</xsl:text> 
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="font-variant"/>
          </xsl:otherwise>
        </xsl:choose>
      <!--</xsl:if>-->
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="font-justify">
    <xsl:variable name="a" select="@w:styleId"/>
    <xsl:variable name="basedOn" select="./w:basedOn/@w:val"/>
    <xsl:variable name="currStyle" select="./w:name/@w:val"/>       
    <xsl:for-each select="//w:style[@w:styleId = $basedOn]"> 
      <xsl:choose>
        <xsl:when test="./w:pPr/w:jc">                            
          <xsl:choose>
            <xsl:when test="w:pPr/w:jc/@w:val = 'both'">
              <xsl:text>text-align:justify;</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:text>text-align:justify;</xsl:text>
              <xsl:value-of select="w:pPr/w:jc/@w:val"/>
            </xsl:otherwise>
          </xsl:choose>   
        </xsl:when>        
        <xsl:when test="./w:basedOn">
          <xsl:for-each select="//w:style">
            <xsl:if test="@w:styleId = $basedOn">
              <xsl:choose><!-- Font SIZE -->
                <xsl:when test="./w:pPr/w:jc">                            
                  <xsl:choose>
                    <xsl:when test="w:pPr/w:jc/@w:val = 'both'">
                      <xsl:text>text-align:justify;</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:text>text-align:</xsl:text>
                      <xsl:value-of select="w:pPr/w:jc/@w:val"/>
                    </xsl:otherwise>
                  </xsl:choose>   
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="font-justify"/>
                  <xsl:text>&#x000A;</xsl:text>   
                </xsl:otherwise>
              </xsl:choose>
            </xsl:if>
          </xsl:for-each>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="font-justify"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="margin">
    <xsl:variable name="before" select="w:pPr/w:spacing/@w:before"/>
    <xsl:variable name="after" select="w:pPr/w:spacing/@w:after"/>
    <xsl:variable name="a" select="@w:styleId"/>
    <xsl:variable name="basedOn" select="./w:basedOn/@w:val"/>
    <xsl:variable name="bSapce" select="w:pPr/w:spacing/@w:before"/>
    <xsl:variable name="aSapce" select="w:pPr/w:spacing/@w:after"/>
    <xsl:variable name="lineSpace" select="w:pPr/w:spacing/@w:line"/>
    
    
    
    <!--<xsl:with-param name="hanging" select="w:pPr/w:ind/@w:hanging"/>
    <xsl:with-param name="firstline" select="w:pPr/w:ind/@w:firstLine"/>
    <xsl:with-param name="left" select="w:pPr/w:ind/@w:left"/>
    <xsl:with-param name="right" select="w:pPr/w:ind/@w:right"/>-->
    
    <!-- xsl:for-each select="//w:style/w:name[@w:val = $basedOn] -->
    <xsl:for-each select="//w:style[@w:styleId = $basedOn]">
      
      <xsl:choose>
        <xsl:when test="./w:pPr/w:spacing">          
          <xsl:choose>
            <xsl:when test="not(./w:pPr/w:spacing/@w:before)">
            </xsl:when>
            <xsl:otherwise>
              <xsl:text>margin-top:</xsl:text>
              <!--  updated by hari                  -->
              <xsl:value-of select="$bSapce div 20"/>
              <xsl:text>pt;</xsl:text>
              <xsl:text>&#x000A;</xsl:text>
            </xsl:otherwise>
          </xsl:choose>                
          <xsl:choose>
            <xsl:when test="not(./w:pPr/w:spacing/@w:after)">
              <xsl:text>margin-bottom:</xsl:text>
              <xsl:value-of select="$bSapce div 20"/>
              <xsl:text>pt;</xsl:text>
              <xsl:text>&#x000A;</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:text>margin-bottom:</xsl:text>
              <xsl:value-of select="$aSapce div 20"/>
              <xsl:text>pt;</xsl:text>
              <xsl:text>&#x000A;</xsl:text>
            </xsl:otherwise>
          </xsl:choose>
          </xsl:when>        
        <xsl:otherwise>
          <xsl:call-template name="margin"/>
        </xsl:otherwise>
      </xsl:choose> 
      <!-- Added Today(18-aug-17)-->
      
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="margin-basedon">
    <xsl:param name="before"/>
    <xsl:param name="after"/>
    <xsl:param name="bSpace2"/>
    <xsl:param name="aSpace2"/>
    
    <xsl:variable name="basedOn" select="./w:basedOn/@w:val"/>
    <xsl:variable name="before" select="w:pPr/w:spacing/@w:before"/>
    <xsl:variable name="after" select="w:pPr/w:spacing/@w:after"/>
    <xsl:variable name="bSpace2" select="w:pPr/w:spacing/@w:before"/>
    <xsl:variable name="aSpace2" select="w:pPr/w:spacing/@w:after"/>
    
    
    
    <xsl:for-each select="//w:style[@w:styleId = $basedOn]">
      <xsl:choose>
        <xsl:when test="./w:pPr/w:spacing/@w:before | ./w:pPr/w:spacing/@w:after">              
          <xsl:if test="./w:pPr/w:spacing/@w:before">
            <xsl:if test="not($before)">
              <xsl:text>&#x000A;</xsl:text>
              <xsl:text>margin-top:</xsl:text>
              <xsl:value-of select="./w:pPr/w:spacing/@w:before div 20"/>
              <xsl:text>pt;</xsl:text>
              <xsl:text>&#x000A;</xsl:text>              
            </xsl:if>
            <xsl:text>&#x000A;</xsl:text>
          </xsl:if> 
          <xsl:if test="./w:pPr/w:spacing/@w:after">
            <xsl:if test="not($after)">
              <xsl:text>&#x000A;</xsl:text>
              <xsl:text>margin-bottom:</xsl:text>
              <xsl:value-of select="./w:pPr/w:spacing/@w:after div 20"/>
              <xsl:text>pt;</xsl:text>
              <xsl:text>&#x000A;</xsl:text> 
            </xsl:if>
            <xsl:text>&#x000A;</xsl:text>
          </xsl:if>          
          <xsl:if test="./w:basedOn">                      
            <xsl:call-template name="margin-basedon">
              <xsl:with-param name="bSpace2" select="./w:pPr/w:spacing/@w:before"/>
              <xsl:with-param name="aSpace2" select="./w:pPr/w:spacing/@w:after"/>
            </xsl:call-template>
          </xsl:if> 
        </xsl:when>              
        <xsl:otherwise>    
          <xsl:call-template name="margin-basedon">
            <xsl:with-param name="bSpace2" select="./w:pPr/w:spacing/@w:before"/>
            <xsl:with-param name="aSpace2" select="./w:pPr/w:spacing/@w:after"/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="margin-left-right">
    
    <xsl:param name="hanging"/>
    <xsl:param name="firstline"/>
    <xsl:param name="left"/>
    <xsl:param name="right"/>
    
    <xsl:variable name="a" select="@w:styleId"/>
    <xsl:variable name="basedOn" select="./w:basedOn/@w:val"/>
    <xsl:variable name="bSapce" select="w:pPr/w:spacing/@w:before"/>
    <xsl:variable name="aSapce" select="w:pPr/w:spacing/@w:after"/>
    <xsl:variable name="lineSpace" select="w:pPr/w:spacing/@w:line"/>
    

    
    <!-- xsl:for-each select="//w:style/w:name[@w:val = $basedOn] -->
    <xsl:for-each select="//w:style[@w:styleId = $basedOn]">
      <xsl:choose>
        <xsl:when test="./w:pPr/w:ind/@w:firstLine | ./w:pPr/w:ind/@w:hanging | ./w:pPr/w:ind/@w:left | ./w:pPr/w:ind/@w:right">
          <xsl:if test="./w:pPr/w:ind/@w:firstLine">
            <!-- xsl:if test="(number($firstline) &gt; 0) or ($firstline = '') -->
            <xsl:if test="not($firstline) and not($hanging)">
              <xsl:if test="w:pPr/w:ind/@w:firstLine > 0">
                <xsl:text>text-indent:</xsl:text>
                <xsl:value-of select="w:pPr/w:ind/@w:firstLine div 20"/>        
                <xsl:text>pt;</xsl:text>
              </xsl:if>
            </xsl:if>
            <xsl:text>&#x000A;</xsl:text>
          </xsl:if>    
          <xsl:if test="./w:pPr/w:ind/@w:left">
            <xsl:if test="not($left)"><!-- (number($left) &gt; 0) or ($left = '') -->
              <xsl:text>&#x000A;</xsl:text>
              <xsl:text>margin-left:</xsl:text>
              <!--<xsl:choose>
                <xsl:when test="w:pPr/w:ind/@w:hanging">                          
                  <xsl:variable name="hang" select="w:pPr/w:ind/@w:hanging div 20"/>
                  <xsl:variable name="left" select="w:pPr/w:ind/@w:left div 20"/>
                  <!-\-<xsl:value-of select="$hang - $left"/>-\->
                  <!-\-<xsl:value-of select="($hang - $left) - 9"/>-\->
                  <xsl:if test="$hang > $left">
                    <xsl:value-of select="($hang - $left)"/>
                  </xsl:if>
                  <xsl:if test="$hang &lt; $left">
                    <xsl:value-of select="($left - $hang)"/>
                  </xsl:if>
                  <xsl:if test="$hang = $left">                            
                    <xsl:value-of select="$left div 2"/>
                  </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                  <!-\-<xsl:value-of select="w:pPr/w:ind/@w:left div 20"/>-\->
                  <!-\-<xsl:value-of select="(w:pPr/w:ind/@w:left div 20) - 9"/>-\->
                  <xsl:value-of select="w:pPr/w:ind/@w:left div 20"/>
                </xsl:otherwise>
              </xsl:choose>-->
              <xsl:value-of select="w:pPr/w:ind/@w:left div 20"/>     
              <xsl:text>pt;</xsl:text>
            </xsl:if>
            <xsl:text>&#x000A;</xsl:text>
          </xsl:if> 
          <xsl:if test="./w:pPr/w:ind/@w:right">
            <xsl:if test="not($right)">
              <xsl:text>margin-right:</xsl:text>
              <xsl:value-of select="w:pPr/w:ind/@w:right div 20"/>        
              <xsl:text>pt;</xsl:text>
            </xsl:if>
            <xsl:text>&#x000A;</xsl:text>
          </xsl:if>
          <xsl:if test="./w:pPr/w:ind/@w:hanging">
            <xsl:if test="not($hanging)"><!-- (number($hanging) &gt;= 0) or ($hanging = '') -->
              
              <xsl:text>text-indent:-</xsl:text>
              <xsl:value-of select="w:pPr/w:ind/@w:hanging div 20"/>        
              <xsl:text>pt;</xsl:text>
            </xsl:if>
            <xsl:text>&#x000A;</xsl:text>
          </xsl:if> 
          <xsl:if test="w:basedOn">                      
            <xsl:call-template name="margin-left-right">
              <xsl:with-param name="hanging" select="./w:pPr/w:ind/@w:hanging"/>
              <xsl:with-param name="left" select="./w:pPr/w:ind/@w:left"/>
              <xsl:with-param name="firstline" select="./w:pPr/w:ind/@w:firstLine"/>
              <xsl:with-param name="right" select="./w:pPr/w:ind/@w:right"/>
            </xsl:call-template>
          </xsl:if> 
        </xsl:when>              
        <xsl:otherwise>    
          <!-- <xsl:call-template name="margin-left-right"/> -->
          <xsl:call-template name="margin-left-right">
            <xsl:with-param name="hanging" select="w:pPr/w:ind/@w:hanging"/>
            <xsl:with-param name="left" select="w:pPr/w:ind/@w:left"/>
            <xsl:with-param name="firstline" select="w:pPr/w:ind/@w:firstLine"/>
            <xsl:with-param name="right" select="w:pPr/w:ind/@w:right"/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>      
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="font-family">
    <xsl:variable name="a" select="@w:styleId"/>
    <xsl:variable name="basedOn" select="./w:basedOn/@w:val"/>    
    <xsl:for-each select="//w:style[@w:styleId = $basedOn]"><!-- //w:style/w:name[@w:val = $basedOn] -->
      <xsl:choose>
        <xsl:when test="./w:rPr/w:rFontsX">
          <xsl:if test="string-length(./w:rPr/w:rFonts/@w:ascii) > 0">
            <xsl:text>font-family:"</xsl:text>
            <xsl:value-of select="w:rPr/w:rFonts/@w:ascii"/>
            <xsl:text>","serif";</xsl:text>
            <xsl:text>&#x000A;</xsl:text>           
          </xsl:if>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="font-family"/>
        </xsl:otherwise>
      </xsl:choose>
      <!--</xsl:if>-->
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="font-justifyX">
    <xsl:variable name="a" select="@w:styleId"/>
    <xsl:variable name="basedOn" select="./w:basedOn/@w:val"/>    
    <xsl:variable name="textAlign" select="./w:pPr/w:jc/@w:val"/>
    <xsl:for-each select="//w:style[@w:styleId = $basedOn]"><!-- //w:style/w:name[@w:val = $basedOn] -->
      <xsl:choose><!-- FONT FAMILY -->
        <xsl:when test="./w:pPr/w:jc">                            
          <xsl:choose>
            <xsl:when test="$textAlign = 'both'">
              <xsl:text>justify</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$textAlign"/>
            </xsl:otherwise>
          </xsl:choose>   
        </xsl:when>
        <xsl:when test="./w:basedOn">
          <xsl:for-each select="//w:style">              
            <xsl:if test="@w:styleId = $basedOn">
              <xsl:choose><!-- Font SIZE -->
                <xsl:when test="child::w:pPr/w:jc">
                  <xsl:choose>
                    <xsl:when test="$textAlign = 'both'">
                      <xsl:text>justify</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="$textAlign"/>
                    </xsl:otherwise>
                  </xsl:choose>   
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="font-justify"/>
                  <xsl:text>&#x000A;</xsl:text>   
                </xsl:otherwise>
              </xsl:choose>
            </xsl:if>
            <!--</xsl:if>-->
          </xsl:for-each>
        </xsl:when>      
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="font-size">
    <xsl:variable name="a" select="@w:styleId"/>
    <xsl:variable name="basedOn" select="./w:basedOn/@w:val"/>
    <xsl:variable name="currStyle" select="./w:name/@w:val"/>
    
    <xsl:for-each select="//w:style[@w:styleId = $basedOn]"> 
      <xsl:choose>
        <xsl:when test="./w:rPr/w:sz">
          <xsl:text>font-size:</xsl:text>
          <xsl:variable name="fontSize" select="number(w:rPr/w:sz/@w:val) div 2"/>
          <!--<xsl:value-of select="$fontSize"/>-->
          <xsl:value-of select="$fontSize + (($fontSize * 10) div 100)"/>
          <xsl:text>pt;</xsl:text><xsl:text>&#x000A;</xsl:text>  
        </xsl:when>
        <xsl:when test="./w:basedOn">  
          <!--<xsl:variable name="basedOn" select="./w:basedOn/@w:val"/>-->
          <xsl:variable name="basedOn">
            <xsl:choose>
              <xsl:when test="./w:basedOn/@w:val = '[No paragraph style]'">
                <xsl:value-of select="'Noparagraphstyle1'"/>
              </xsl:when>
              <xsl:when test="./w:basedOn/@w:val = '[No character style]'">
                <xsl:value-of select="'Nocharacterstyle1'"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="./w:basedOn/@w:val"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:variable>        
          <xsl:for-each select="//w:style">
            <!--<xsl:if test="./@w:styleId = $basedOn">-->
            <xsl:if test="@w:styleId = $basedOn">
              <xsl:choose><!-- Font SIZE -->
                <xsl:when test="child::w:rPr/w:sz">
                  <xsl:text>font-size:</xsl:text>
                  <xsl:variable name="fontSize" select="number(./w:rPr/w:sz/@w:val) div 2"/>
                  <!--<xsl:value-of select="$fontSize"/>-->
                  <xsl:value-of select="$fontSize + (($fontSize * 10) div 100)"/>
                  <xsl:text>pt;</xsl:text><xsl:text>&#x000A;</xsl:text>   
                </xsl:when>
                <xsl:when test="./w:basedOn">
                  <xsl:call-template name="font-size"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:text>font-size:</xsl:text>
                  <xsl:variable name="fontSize" select="number(//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:sz/@w:val) div 2"/>
                  <!--<xsl:value-of select="$fontSize"/>-->
                  <xsl:value-of select="$fontSize + (($fontSize * 10) div 100)"/>
                  <xsl:text>pt;</xsl:text>
                  <xsl:text>&#x000A;</xsl:text>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:if>
          </xsl:for-each>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="font-size"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="font-family27-july">
  <xsl:variable name="a" select="@w:styleId"/>
  <xsl:variable name="basedOn" select="./w:basedOn/@w:val"/>    
  <!-- xsl:for-each select="//w:style/w:name[@w:val = $basedOn] -->      
  <xsl:for-each select="//w:style[@w:styleId = $basedOn]">
        <xsl:choose>
          <xsl:when test="w:pPr/w:ind/@w:firstLine or w:pPr/w:ind[@w:firstLine != '0']">
            <xsl:text>text-indent:</xsl:text>
            <xsl:value-of select="w:pPr/w:ind/@w:firstLine div 20"/>        
            <xsl:text>pt;</xsl:text>
            <xsl:text>&#x000A;</xsl:text>
          </xsl:when>
          <xsl:when test="w:pPr/w:ind/@w:hanging">
            <!-- commented on 24-7-17, for hang align for Young feedback -->
            <!--<xsl:text>padding-left:</xsl:text>-->
            <xsl:text>text-indent:-</xsl:text>
            <xsl:value-of select="w:pPr/w:ind/@w:hanging div 20"/>        
            <xsl:text>pt;</xsl:text>
            <xsl:text>&#x000A;</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="font-family"/>
          </xsl:otherwise>
        </xsl:choose>
      <!--</xsl:if>-->
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="marginX">
    <xsl:variable name="a" select="@w:styleId"/>
    <xsl:variable name="basedOn" select="./w:basedOn/@w:val"/>    
    <!-- xsl:for-each select="//w:style/w:name[@w:val = $basedOn] -->
    <xsl:for-each select="//w:style[@w:styleId = $basedOn]">
      <xsl:choose>
        <xsl:when test="w:pPr/w:ind">
          <xsl:if test="w:pPr/w:ind/@w:left">
            <xsl:text>&#x000A;</xsl:text>
            <xsl:text>margin-left:</xsl:text>
            <xsl:variable name="hang" select="w:pPr/w:ind/@w:hanging div 20"/>
            <xsl:variable name="left" select="w:pPr/w:ind/@w:left div 20"/>
            
            <!--<xsl:value-of select="$hang - $left"/>-->
            <!--<xsl:value-of select="($hang - $left) - 9"/>-->
            <xsl:if test="$hang > $left">
              <xsl:value-of select="$hang - $left"/>
            </xsl:if>
            <xsl:if test="$hang &lt; $left">
              <xsl:value-of select="$left - $hang"/>
            </xsl:if>
            <xsl:if test="$hang = $left">                            
              <xsl:value-of select="$left div 2"/>
            </xsl:if>
            
            <!--<xsl:value-of select="(child::w:pPr/w:ind/@w:left) div 20"/>-->
            <xsl:text>pt;</xsl:text>
            <xsl:text>&#x000A;</xsl:text>
          </xsl:if>
          <xsl:if test="w:pPr/w:ind/@w:right">
            <xsl:text>margin-right:</xsl:text>
            <xsl:value-of select="(child::w:pPr/w:ind/@w:right) div 20"/>
            <xsl:text>pt;</xsl:text>
            <xsl:text>&#x000A;</xsl:text>
          </xsl:if>                    
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="marginX"/>
        </xsl:otherwise>
      </xsl:choose>
      <!--</xsl:if>-->
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="font-size27-july">
    <xsl:variable name="a" select="@w:styleId"/>
    <xsl:variable name="basedOn" select="./w:basedOn/@w:val"/>
    <xsl:variable name="currStyle" select="./w:name/@w:val"/>
    
    <!--<xsl:for-each select="//w:style/w:name[@w:val = $basedOn]"> -->
        <xsl:choose>
          <xsl:when test="child::w:rPr/w:sz">
            <xsl:text>font-size:</xsl:text>
            <xsl:variable name="fontSize" select="number(w:rPr/w:sz/@w:val) div 2"/>
            <xsl:value-of select="$fontSize"/>
            <xsl:text>pt;</xsl:text><xsl:text>&#x000A;</xsl:text>  
          </xsl:when>
          <xsl:when test="child::w:basedOn"> 
            
            <xsl:for-each select="//w:style">
              <!--<xsl:if test="./@w:styleId = $basedOn">-->
              <xsl:if test="./w:name/@w:val = $basedOn">
                <xsl:choose><!-- Font SIZE -->
                  <xsl:when test="child::w:rPr/w:sz">
                    <xsl:text>font-size:</xsl:text>
                    <xsl:variable name="fontSize" select="number(./w:rPr/w:sz/@w:val) div 2"/>
                    <xsl:value-of select="$fontSize"/>
                    <xsl:text>pt;</xsl:text><xsl:text>&#x000A;</xsl:text>   
                  </xsl:when>
                  
                  
                  <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:sz">
                    <xsl:text>font-size:</xsl:text>
                    <xsl:variable name="fontSize" select="number(//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:sz/@w:val) div 2"/>
                    <xsl:value-of select="$fontSize"/>
                    <xsl:text>pt;</xsl:text><xsl:text>&#x000A;</xsl:text>   
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:call-template name="font-size"/>
                    <xsl:text>&#x000A;</xsl:text>   
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:if>
            </xsl:for-each>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="font-size"/>
          </xsl:otherwise>
        </xsl:choose>
    <!--</xsl:for-each>-->
  </xsl:template>
  <xsl:template name="loop">
    <xsl:variable name="a" select="@w:styleId"/>
    <xsl:variable name="basedOn" select="./w:basedOn/@w:val"/>
    <xsl:variable name="color" select="w:rPr/w:color/@w:val"/>
    
    <!--<xsl:variable name="fontFamily" select="w:rPr/w:rFonts/@w:ascii"/>-->
    <xsl:variable name="fontFamily" select="w:rPr/w:rFonts/@w:cd"/>    
    <xsl:variable name="textVarient" select="w:rPr/w:smallCaps/@w:val"/>
    <xsl:variable name="textTrans" select="w:rPr/w:smallCaps/@w:val"/>
    <xsl:variable name="fontWeight" select="w:rPr/w:b/@w:val"/>
    <xsl:variable name="fontStyle" select="w:rPr/w:i/@w:val"/>
    <xsl:variable name="underline" select="w:rPr/w:u/@w:val"/>
    <xsl:variable name="baseline" select="w:rPr/w:vertAlign/@w:val"/>
    
    <xsl:for-each select="//w:style[@w:styleId = $basedOn]">
<!--            <xsl:if test="./@w:styleId = $basedOn">-->
              <xsl:variable name="fontFamily" select="w:rPr/w:rFonts/@w:ascii"/>
              <xsl:choose>
                <xsl:when test="./w:rPr/w:sz">
                  <xsl:text>font-size:</xsl:text>
                  <xsl:variable name="fontSize" select="number(w:rPr/w:sz/@w:val) div 2"/>
                  <xsl:value-of select="$fontSize"/>
                  <xsl:text>pt;</xsl:text><xsl:text>&#x000A;</xsl:text>  
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="loop"/>
                </xsl:otherwise>
              </xsl:choose>
                  <!--<xsl:if test="w:rPr/w:sz">
                    <xsl:text>font-size:</xsl:text>
                    <xsl:variable name="fontSize" select="number(w:rPr/w:sz/@w:val) div 2"/>
                    <xsl:value-of select="$fontSize"/>
                    <xsl:text>pt;</xsl:text><xsl:text>&#x000A;</xsl:text>           
                  </xsl:if>-->
              <xsl:if test="w:rPr/w:color">                
                <xsl:choose>
                  <xsl:when test="$color = 'auto'">
                    <!--<xsl:value-of select="'000000'"/>-->
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:text disable-output-escaping="yes">color: #</xsl:text>
                    <xsl:value-of select="replace($color,',','')"/>
                  </xsl:otherwise>
                </xsl:choose>
                <!--<xsl:value-of select="$color"/>-->
                <!--<xsl:text>color:#</xsl:text>
                <xsl:value-of select="w:rPr/w:color/@w:val"/>-->
                <xsl:text>;</xsl:text>
                <xsl:text>&#x000A;</xsl:text> 
              </xsl:if>
              <xsl:choose>
                <xsl:when test="w:rPr/w:rFontsX">
                  <xsl:if test="string-length($fontFamily) > 0">
                    <xsl:text>font-family:"</xsl:text>
                    <!--<xsl:value-of select="w:rPr/w:rFonts/@w:ascii"/>-->
                    <xsl:value-of select="w:rPr/w:rFonts/@w:cs"/>
                    <xsl:text>","serif";</xsl:text><xsl:text>&#x000A;</xsl:text>           
                  </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="loop"/>
                </xsl:otherwise>
              </xsl:choose>
                  <!--<xsl:if test="string-length($fontFamily) > 0">
                    <xsl:text>font-family:"</xsl:text>
                    <xsl:value-of select="w:rPr/w:rFonts/@w:ascii"/>
                    <xsl:text>","serif";</xsl:text><xsl:text>&#x000A;</xsl:text>           
                  </xsl:if>-->
                  <xsl:if test="w:rPr/w:smallCaps">
                    <xsl:choose>
                      <xsl:when test="$textVarient = '0'">
                        <xsl:text>font-variant:normal !important;</xsl:text>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:text>font-variant:small-caps !important;</xsl:text>
                      </xsl:otherwise>
                    </xsl:choose>  
                    <xsl:text>&#x000A;</xsl:text> 
                  </xsl:if>                
                  <xsl:if test="w:rPr/w:caps">
                    <xsl:choose>
                      <xsl:when test="$textTrans = '0'">
                        <xsl:text>text-transform:none;</xsl:text>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:text>text-transform:uppercase;</xsl:text>
                      </xsl:otherwise>
                    </xsl:choose>  
                    <xsl:text>&#x000A;</xsl:text>
                  </xsl:if>                
                  <xsl:if test="w:rPr/w:b">
                    <xsl:choose>
                      <xsl:when test="$fontWeight = '0'">
                        <xsl:text>font-weight:normal;</xsl:text>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:text>font-weight:bold;</xsl:text>
                      </xsl:otherwise>
                    </xsl:choose>   
                    <xsl:text>&#x000A;</xsl:text> 
                  </xsl:if>  
                  <xsl:if test="w:rPr/w:i">
                    <xsl:choose>
                      <xsl:when test="$fontStyle = '0'">
                        <xsl:text>font-style:normal;</xsl:text>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:text>font-style:italic;</xsl:text>
                      </xsl:otherwise>
                    </xsl:choose>
                    <xsl:text>&#x000A;</xsl:text> 
                  </xsl:if>  
                  <xsl:if test="w:rPr/w:u">
                    <xsl:choose>
                      <xsl:when test="$underline = 'none'">
                        <xsl:text>text-decoration:none;</xsl:text>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:text>text-decoration:underline;</xsl:text>
                      </xsl:otherwise>
                    </xsl:choose>     
                    <xsl:text>&#x000A;</xsl:text> 
                  </xsl:if>  
                  <xsl:if test="w:rPr/w:vertAlign">
                    <xsl:choose>
                      <xsl:when test="$baseline = 'subscript'">
                        <xsl:text>vertical-align:sub;</xsl:text>
                        <xsl:text>font-size: 80%;</xsl:text>
                      </xsl:when>
                      <xsl:when test="$baseline = 'superscript'">
                        <xsl:text>vertical-align:super;</xsl:text>
                        <xsl:text>font-size: 80%;</xsl:text>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:text>vertical-align:baseline;</xsl:text>
                      </xsl:otherwise>
                    </xsl:choose>
                    <xsl:text>&#x000A;</xsl:text>
                  </xsl:if>  
            <xsl:if test="./w:basedOn">
              <xsl:call-template name="loop"/>
            </xsl:if>
            <!--</xsl:if>-->
     <!--</xsl:if>-->
    </xsl:for-each>
  </xsl:template>
  
  
  <!-- FOOTNOTE captions -->
<xsl:template match="//w:footnotes" mode="footnotes">  
  
    <xsl:apply-templates select="w:footnote" mode="footnote"/>
</xsl:template>
  
  <!-- @@@FOOTNOTE $$$$-->
  <xsl:template match="//w:footnote" mode="footnote">
    
      <xsl:choose>
        <xsl:when test="@w:type = 'continuationSeparator'"/>
        <xsl:when test="@w:type = 'separator'"/>
        <xsl:when test="@w:type = 'continuationNotice'"></xsl:when>
        <xsl:otherwise>
          <!-- added by hari 31.5.2017         -->
          <xsl:variable name="footnoteCpationClass">
            <xsl:choose>
              <xsl:when test="descendant::w:del">
                <xsl:value-of select="'footnotecaptiondeleted'"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="'footnotecaption'"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:variable>
          <xsl:element name="div">
            <!--<xsl:attribute name="class" select="'footnotecaption'"/>-->
            <!-- added by hari 31.5.2017         -->
            <xsl:attribute name="class" select="$footnoteCpationClass"/>
            <xsl:attribute name="style" select="'mso-element:footnote'"/>
            <xsl:attribute name="id">
              <xsl:text>ftn</xsl:text>
              <xsl:choose>
                <xsl:when test="self::w:footnote/descendant::w:rStyle[@w:val ='FootnoteReference'][(ancestor::w:del)]">
                  <xsl:value-of select="@w:id"/>
                </xsl:when>
                <xsl:when test="self::w:footnote/descendant::w:rStyle[@w:val ='FootnoteReference0'][(ancestor::w:del)]">
                  <xsl:value-of select="@w:id"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:choose>
                    <xsl:when test="self::w:footnote/descendant::w:rStyle[@w:val ='FootnoteReference']">
                      <xsl:number level="any" count="w:footnote[descendant::w:rStyle[@w:val ='FootnoteReference'][not(ancestor::w:del)]]"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:number level="any" count="w:footnote[descendant::w:rStyle[@w:val ='FootnoteReference0'][not(ancestor::w:del)]]"/>
                    </xsl:otherwise>
                  </xsl:choose>
                  <!--<xsl:number level="any" count="w:footnote[descendant::w:rStyle[@w:val ='FootnoteReference'][not(ancestor::w:del)]]"/>-->
                </xsl:otherwise>
              </xsl:choose>
              <!-- As per Hari;s idea i used the above choose -->
              <!--<xsl:value-of select="@w:id"/>-->
            </xsl:attribute>
            <xsl:attribute name="itemid">
              <xsl:text>ftn</xsl:text>
              <xsl:choose>
                <xsl:when test="self::w:footnote/descendant::w:rStyle[@w:val ='FootnoteReference'][(ancestor::w:del)]">
                  <xsl:value-of select="@w:id"/>
                  <xsl:text>_deleted</xsl:text>
                </xsl:when>
                <xsl:when test="self::w:footnote/descendant::w:rStyle[@w:val ='FootnoteReference0'][(ancestor::w:del)]">
                  <xsl:value-of select="@w:id"/>
                  <xsl:text>_deleted</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:choose>
                    <xsl:when test="self::w:footnote/descendant::w:rStyle[@w:val ='FootnoteReference']">
                      <xsl:number level="any" count="w:footnote[descendant::w:rStyle[@w:val ='FootnoteReference'][not(ancestor::w:del)]]"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:number level="any" count="w:footnote[descendant::w:rStyle[@w:val ='FootnoteReference0'][not(ancestor::w:del)]]"/>
                    </xsl:otherwise>
                  </xsl:choose>
                  <!--<xsl:number level="any" count="w:footnote[descendant::w:rStyle[@w:val ='FootnoteReference'][not(ancestor::w:del)]]"/>-->
                </xsl:otherwise>
              </xsl:choose>
              <!-- As per Hari;s idea i used the above choose -->
              <!--<xsl:value-of select="@w:id"/>-->
            </xsl:attribute>
            <xsl:element name="p">
              <xsl:attribute name="class" select="'MsoFootnoteText'"/>
              <!-- to get the footnote bookmarks -->
              <xsl:if test="child::w:p/w:bookmarkStart">
                <xsl:variable name="bmId" select="@w:id"/>
                <xsl:text disable-output-escaping="yes">&lt;span data-bkmark="</xsl:text>
                <xsl:value-of select="child::w:p/w:bookmarkStart/@w:name"/>
                <xsl:text disable-output-escaping="yes">"</xsl:text>
                <xsl:text disable-output-escaping="yes">/&gt;</xsl:text>   
                <xsl:if test="$bmId = //w:bookmarkEnd/@w:id">
                </xsl:if>
              </xsl:if>
              <xsl:if test="child::w:p[@w:rsidR]">
                <xsl:variable name="bmId" select="@w:rsidR"/>
                <xsl:text disable-output-escaping="yes">&lt;span data-bkmark="</xsl:text>
                <xsl:value-of select="child::w:p/@w:rsidR"/>
                <xsl:text disable-output-escaping="yes">"</xsl:text>
                <xsl:text disable-output-escaping="yes">/&gt;</xsl:text>  
                
              </xsl:if>
              
              <xsl:element name="a">
                <xsl:attribute name="style">
                  <xsl:text>mso-footnote-id:ftn</xsl:text>
                  <xsl:choose>
                    <xsl:when test="self::w:footnote/descendant::w:rStyle[@w:val ='FootnoteReference'][(ancestor::w:del)]">
                      <xsl:value-of select="@w:id"/>
                    </xsl:when>
                    <xsl:when test="self::w:footnote/descendant::w:rStyle[@w:val ='FootnoteReference0'][(ancestor::w:del)]">
                      <xsl:value-of select="@w:id"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:choose>
                        <xsl:when test="self::w:footnote/descendant::w:rStyle[@w:val ='FootnoteReference']">
                          <xsl:number level="any" count="w:footnote[descendant::w:rStyle[@w:val ='FootnoteReference'][not(ancestor::w:del)]]"/>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:number level="any" count="w:footnote[descendant::w:rStyle[@w:val ='FootnoteReference0'][not(ancestor::w:del)]]"/>
                        </xsl:otherwise>
                      </xsl:choose>
                      <!--<xsl:number level="any" count="w:footnote[descendant::w:rStyle[@w:val ='FootnoteReference'][not(ancestor::w:del)]]"/>-->
                    </xsl:otherwise>
                  </xsl:choose>
                  <!-- As per Hari;s idea i used the above choose -->
                  <!--<xsl:value-of select="@w:id"/>-->
                </xsl:attribute>
                <xsl:attribute name="href">
                  <xsl:text>#_ftnref</xsl:text>
                  <xsl:choose>
                    <xsl:when test="self::w:footnote/descendant::w:rStyle[@w:val ='FootnoteReference'][(ancestor::w:del)]">
                      <xsl:value-of select="@w:id"/>
                    </xsl:when>
                    <xsl:when test="self::w:footnote/descendant::w:rStyle[@w:val ='FootnoteReference0'][(ancestor::w:del)]">
                      <xsl:value-of select="@w:id"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:choose>
                        <xsl:when test="self::w:footnote/descendant::w:rStyle[@w:val ='FootnoteReference']">
                          <xsl:number level="any" count="w:footnote[descendant::w:rStyle[@w:val ='FootnoteReference'][not(ancestor::w:del)]]"/>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:number level="any" count="w:footnote[descendant::w:rStyle[@w:val ='FootnoteReference0'][not(ancestor::w:del)]]"/>
                        </xsl:otherwise>
                      </xsl:choose>
                      <!--<xsl:number level="any" count="w:footnote[descendant::w:rStyle[@w:val ='FootnoteReference'][not(ancestor::w:del)]]"/>-->
                    </xsl:otherwise>
                  </xsl:choose>
                  <!-- As per Hari;s idea i used the above choose -->
                  <!--<xsl:value-of select="@w:id"/>-->
                </xsl:attribute>
                <xsl:attribute name="name">
                  <xsl:text>_ftn</xsl:text>
                  <xsl:choose>
                    <xsl:when test="self::w:footnote/descendant::w:rStyle[@w:val ='FootnoteReference'][(ancestor::w:del)]">
                      <xsl:value-of select="@w:id"/>
                    </xsl:when>
                    <xsl:when test="self::w:footnote/descendant::w:rStyle[@w:val ='FootnoteReference0'][(ancestor::w:del)]">
                      <xsl:value-of select="@w:id"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:choose>
                        <xsl:when test="self::w:footnote/descendant::w:rStyle[@w:val ='FootnoteReference']">
                          <xsl:number level="any" count="w:footnote[descendant::w:rStyle[@w:val ='FootnoteReference'][not(ancestor::w:del)]]"/>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:number level="any" count="w:footnote[descendant::w:rStyle[@w:val ='FootnoteReference0'][not(ancestor::w:del)]]"/>
                        </xsl:otherwise>
                      </xsl:choose>
                      <!--<xsl:number level="any" count="w:footnote[descendant::w:rStyle[@w:val ='FootnoteReference'][not(ancestor::w:del)]]"/>-->
                    </xsl:otherwise>
                  </xsl:choose>
                  <!-- As per Hari;s idea i used the above choose -->
                  <!--<xsl:value-of select="@w:id"/>-->
                </xsl:attribute>
                <xsl:element name="span">
                  <xsl:attribute name="class" select="'MsoFootnoteReference'"/>  
                  <!--<xsl:value-of select="concat('[',@w:id,']')"/>-->
                  <!-- As per Hari;s idea i used the below choose -->                  
                  <xsl:choose>
                    <xsl:when test="self::w:footnote/descendant::w:rStyle[@w:val ='FootnoteReference'][(ancestor::w:del)]">
                      <xsl:value-of select="concat('',@w:id,'')"/>
                    </xsl:when>
                    <xsl:when test="self::w:footnote/descendant::w:rStyle[@w:val ='FootnoteReference0'][(ancestor::w:del)]">
                      <xsl:value-of select="concat('',@w:id,'')"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:text></xsl:text>
                      <xsl:choose>
                        <xsl:when test="self::w:footnote/descendant::w:rStyle[@w:val ='FootnoteReference']">
                          <xsl:number level="any" count="w:footnote[descendant::w:rStyle[@w:val ='FootnoteReference'][not(ancestor::w:del)]]"/>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:number level="any" count="w:footnote[descendant::w:rStyle[@w:val ='FootnoteReference0'][not(ancestor::w:del)]]"/>
                        </xsl:otherwise>
                      </xsl:choose>
                      <!--<xsl:number level="any" count="w:footnote[descendant::w:rStyle[@w:val ='FootnoteReference'][not(ancestor::w:del)]]"/>-->
                      <xsl:text></xsl:text>
                    </xsl:otherwise>
                  </xsl:choose>                  
                </xsl:element>            
              </xsl:element>                 
              <!--<xsl:apply-templates select="w:p/w:r"/>-->
              <xsl:choose>
                <xsl:when test="w:p/w:ins">                  
                  <xsl:element name="span">
                    <xsl:attribute name="class" select="'msoIns'"/>
                    <xsl:element name="ins">
                      <xsl:attribute name="class" select="'ice-ins ice-cts'"/>
                      <xsl:attribute name="cite">
                        <xsl:text>mailto:</xsl:text>
                        <xsl:value-of select="@w:author"/>
                      </xsl:attribute>
                      <xsl:attribute name="datetime" select="@w:date"/>
                      <xsl:for-each select="w:p">
                        <xsl:element name="p">
                          <xsl:attribute name="class" select="'MsoFootnoteText'"/>
                          <xsl:apply-templates select="w:ins/w:r"/>
                        </xsl:element>
                      </xsl:for-each>
                      <!--<xsl:apply-templates select="w:p/w:ins/w:r"/>--> 
                    </xsl:element>   
                  </xsl:element>
                </xsl:when>
                <xsl:when test="w:p/w:del">
                  <!--<xsl:apply-templates select="w:p/w:del/w:r"/>  -->
                  <xsl:element name="span">
                    <xsl:attribute name="class" select="'msoDel'"/>
                    <xsl:element name="del">
                      <xsl:attribute name="class" select="'ice-del ice-cts'"/>
                      <xsl:attribute name="cite">
                        <xsl:text>mailto:</xsl:text>
                        <xsl:value-of select="@w:author"/>
                      </xsl:attribute>
                      <xsl:attribute name="datetime" select="@w:date"/>
                      <xsl:for-each select="w:p">
                        <xsl:element name="p">
                          <xsl:attribute name="class" select="'MsoFootnoteText'"/>
                          <xsl:apply-templates select="w:del/w:r"/>
                        </xsl:element>
                      </xsl:for-each>
                      <!--<xsl:apply-templates select="w:p/w:del/w:r"/>-->
                    </xsl:element>   
                  </xsl:element>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:for-each select="w:p">
                    <xsl:element name="p">
                      <xsl:attribute name="class" select="'MsoFootnoteText'"/>
                      <xsl:apply-templates/>
                    </xsl:element>
                  </xsl:for-each>
                  <!--<xsl:apply-templates select="w:p/w:r"/>-->
                </xsl:otherwise>
              </xsl:choose>              
              <xsl:if test="child::w:p/w:bookmarkEnd">
                <xsl:variable name="bmId" select="child::w:p/w:bookmarkEnd/@w:id"/>                
                <xsl:text disable-output-escaping="yes">&lt;span data-bkmark="</xsl:text>
                <xsl:value-of select="child::w:p/w:bookmarkStart[@w:id = $bmId][1]/@w:name"/>    
                <xsl:text disable-output-escaping="yes">"</xsl:text>
                <xsl:if test="contains(@w:name, 'BM')">
                  <xsl:text disable-output-escaping="yes"> style="color:#e3686a;cursor:pointer;"</xsl:text>
                </xsl:if>    
                <!-- 25-APR-17: added extra style att. for Mariselvam's ckeditor END-->
                <xsl:text disable-output-escaping="yes">/&gt;</xsl:text>                 
              </xsl:if>
            </xsl:element>            
          </xsl:element>          
        </xsl:otherwise>
      </xsl:choose>
  </xsl:template>
  <!--<xsl:template match="w:footnote">
    <xsl:message>hii</xsl:message>
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>-->
  <xsl:template match="w:footnotes"/>
  
    <!-- FOOTNOTEs -->
    
<!-- FOOTNOTEs END-->    
    
<!-- ENDNOTEs -->
    <xsl:template match="//w:endnoteRef">
        <xsl:element name="sup"><xsl:number from="/" level="any" format="1"/></xsl:element>
    </xsl:template>
    
    <xsl:template match="w:endnoteReference">
        <xsl:variable name="referenced-id" select="@w:id"/>
        <xsl:element name="sup">
            <xsl:element name="a">
              <!-- Added for marriapan edior on 22-02-2022 -->
              <xsl:attribute name="class" select="'endnotecitation'"/>
              <!-- End -->
                <xsl:attribute name="id">
                    <xsl:value-of select="'eref'"/>
                    <xsl:number format="1" count="w:endnoteReference" level="any"/>
                </xsl:attribute>
                <xsl:attribute name="href" select="concat($filename,'.xhtml#e',$referenced-id)"/>
                <xsl:value-of select="$referenced-id"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
<!-- ENDNOTEs END-->  
  
  
  <!-- Baseon font family -->
    <xsl:template name="FName">    
        <xsl:variable name="basedOn" select="w:basedOn/@w:val"/>/>    
        <xsl:variable name="fontFamily">
            <xsl:choose>
                <xsl:when test="child::w:rPr/w:rFontsX/@w:ascii">
                    <xsl:value-of select="w:rPr/w:rFonts/@w:ascii"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="w:rPr/w:rFontsX/@w:asciiTheme"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        
        <xsl:choose><!-- FONT FAMILY -->
            <xsl:when test="./w:basedOn">
                <!-- <xsl:for-each select="//w:style[@w:styleId = $basedOn]"> 14-june-17 -->
                <xsl:for-each select="//w:style/w:name[@w:val = $basedOn]">
                    <!--        <xsl:if test="./@w:styleId = $basedOn">-->
                    <xsl:choose><!-- FONT FAMILY -->
                        <xsl:when test="./w:rPr/w:rFontsX/@w:ascii">
                            <xsl:text>font-family:"</xsl:text>
                            <xsl:choose>
                                <xsl:when test="./w:rPr/w:rFonts/@w:ascii">
                                    <xsl:value-of select="./w:rPr/w:rFonts/@w:ascii"/>
                                </xsl:when>
                                <xsl:when test="./w:rPr/w:rFonts/@w:cs">
                                    <xsl:value-of select="./w:rPr/w:rFonts/@w:cs"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:call-template name="FName"/>
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:text>", "serif";</xsl:text>
                            <xsl:text>&#x000A;</xsl:text> 
                        </xsl:when>
                        <xsl:when test="./w:rPr/w:rFontsX/@w:cs">
                            <xsl:if test="string-length($fontFamily) > 0">
                                <xsl:text>font-family:"</xsl:text>
                                <xsl:choose>
                                    <xsl:when test="w:rPr/w:rFonts/@w:ascii">
                                        <xsl:value-of select="w:rPr/w:rFonts/@w:ascii"/>
                                    </xsl:when>
                                    <xsl:when test="w:rPr/w:rFonts/@w:cs">
                                        <xsl:value-of select="w:rPr/w:rFonts/@w:cs"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:call-template name="FName"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:text>","serif";</xsl:text><xsl:text>&#x000A;</xsl:text>           
                            </xsl:if>
                        </xsl:when>
                        <xsl:when test="./w:rPr/w:rFontsX/@w:hAnsi">
                            <xsl:if test="string-length($fontFamily) > 0">
                                <xsl:text>font-family:"</xsl:text>
                                <xsl:choose>
                                    <xsl:when test="w:rPr/w:rFonts/@w:ascii">
                                        <xsl:value-of select="w:rPr/w:rFonts/@w:ascii"/>
                                    </xsl:when>
                                    <xsl:when test="w:rPr/w:rFonts/@w:hAnsi">
                                        <xsl:value-of select="w:rPr/w:rFonts/@w:hAnsi"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:call-template name="FName"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:text>","serif";</xsl:text><xsl:text>&#x000A;</xsl:text>           
                            </xsl:if>
                        </xsl:when>
                        <xsl:when test="./w:rPr/w:rFontsX/@w:hAnsiTheme">
                            <xsl:variable name="themeFont" select="w:rPr/w:rFonts/@w:asciiTheme"/> 
                            <xsl:text>font-family:"</xsl:text> 
                            <xsl:choose>
                                <xsl:when test="contains($themeFont, 'major')">
                                    <xsl:value-of select="//a:majorFont/a:latin/@typeface"/>
                                </xsl:when>
                                <xsl:when test="contains($themeFont, 'minor')">
                                    <xsl:value-of select="//a:minorFont/a:latin/@typeface"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:call-template name="FName"/>
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:text>";</xsl:text><xsl:text>&#x000A;</xsl:text>   
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:call-template name="FName"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    <!--</xsl:if>-->
                </xsl:for-each>
            </xsl:when>      
        </xsl:choose>    
    </xsl:template>
    <!-- end of basedon font family -->
    <xsl:template match="XMLElement|Content">
        <xsl:apply-templates/>
    </xsl:template>
<xsl:template match="//w:styles"/>  

<xsl:template match="w:style">
   <xsl:variable name="a" select="@w:styleId"/>
            <xsl:variable name="msoStyleName">
              <xsl:variable name="stylename" select="child::w:name/@w:val"/>
              <xsl:choose>
                <xsl:when test="matches($stylename, '^([0-9]+)/')">
                  <xsl:value-of select="replace($stylename, '^([0-9]+)/','IDMLnumslash')"/>
                </xsl:when>
                <xsl:when test="matches($stylename, '^([0-9]+)$')">
                  <xsl:value-of select="concat('IDMLnum',$stylename)"/>
                </xsl:when>
                <xsl:when test="matches($stylename, '^[0-9]')">
                  <xsl:value-of select="replace($stylename, '^([0-9]+)','')"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="$stylename"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:variable>
            <xsl:variable name="basedOn" select="w:basedOn/@w:val"/>
            <xsl:variable name="color" select="w:rPr/w:color/@w:val"/>
            <xsl:variable name="FillTint" select="w:rPr/w:color/@FillTint"/>
            <xsl:variable name="fontFamily">
              <xsl:choose>
                <xsl:when test="child::w:rPr/w:rFonts/@w:ascii">
                  <xsl:value-of select="w:rPr/w:rFonts/@w:ascii"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="w:rPr/w:rFonts/@w:asciiTheme"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:variable>
            <xsl:variable name="textVarient" select="w:rPr/w:smallCaps/@w:val"/>
            <xsl:variable name="textTrans" select="w:rPr/w:caps/@w:val"/>
            <xsl:variable name="fontWeight" select="w:rPr/w:b/@w:val"/>
            <xsl:variable name="fontStyle" select="w:rPr/w:i/@w:val"/>
            <xsl:variable name="underline" select="w:rPr/w:u/@w:val"/>
            <xsl:variable name="underlineOffset" select="w:rPr/w:u/@w:UnderlineOffset"/>
            <xsl:variable name="underlineTint" select="w:rPr/w:u/@w:UnderlineTint"/>
            <xsl:variable name="underlineWeight" select="w:rPr/w:u/@w:UnderlineWeight"/>
            <xsl:variable name="underlineColor" select="w:rPr/w:u/@w:color"/>
            <xsl:variable name="baseline" select="w:rPr/w:vertAlign/@w:val"/>
            <xsl:variable name="bSapce" select="w:pPr/w:spacing/@w:before"/>
            <xsl:variable name="aSapce" select="w:pPr/w:spacing/@w:after"/>
            <xsl:variable name="lineSpace" select="w:pPr/w:spacing/@w:line"/>
            <xsl:variable name="textAlign" select="w:pPr/w:jc/@w:val"/>
            <xsl:text>&#x000A;</xsl:text>
            <xsl:choose>
              <xsl:when test="@w:type = 'character'">
                <xsl:text>span.</xsl:text>
              </xsl:when>                 
              <xsl:otherwise>
                  <xsl:choose>
                    <xsl:when test="$a = 'ListParagraph'">
                      <xsl:text>li.ListParagraph, p.</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:text>li.</xsl:text>
                      <xsl:value-of select="translate($msoStyleName, ' /\[\]\(\)\.@#&lt;&gt;:','')"/>
                      <xsl:text>, p.</xsl:text>
                    </xsl:otherwise>
                 </xsl:choose>
              </xsl:otherwise>
           </xsl:choose>
            <xsl:choose>
              <xsl:when test="contains($msoStyleName, 'PCLink')">
                <xsl:value-of select="substring-before($msoStyleName,'PCLink')"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="translate($msoStyleName, ' /\[\]\(\)\.@#&lt;&gt;:','')"/>
              </xsl:otherwise>
            </xsl:choose>
              <xsl:text>&#x000A;</xsl:text>            
              <xsl:text>{mso-style-name:</xsl:text>
              <xsl:value-of select="translate($msoStyleName, ' /\[\]\(\)\.@#&lt;&gt;:','')"/>            
              <xsl:text>;</xsl:text>
            <xsl:if test="$a = 'CommentReference'">
              <xsl:text>&#x000A;</xsl:text>
              <xsl:text>color: transparent;</xsl:text>
            </xsl:if>
            <xsl:if test="$a = 'CommentText'">
              <xsl:text>&#x000A;</xsl:text>
              <xsl:text>color: transparent;</xsl:text>
            </xsl:if>
            <xsl:text>&#x000A;</xsl:text>
            <!-- xsl:if test="./w:basedOn" -->
            <xsl:if test="./w:basedOn">
              <xsl:variable name="basedOn" select="./w:basedOn/@w:val"/>
              <xsl:variable name="fontFamily" select="./w:rPr/w:rFonts/@w:ascii"/>
             <xsl:variable name="color" select="w:rPr/w:color/@w:val"/>
              <xsl:text>&#x000A;</xsl:text>
             
             <xsl:for-each select="//w:style[@w:styleId = $basedOn]">
<!--                  <xsl:if test="./@w:styleId = $basedOn">-->                    
                    <xsl:if test="./w:rPr/w:color">
                      <xsl:variable name="color" select="w:rPr/w:color/@w:val"/>
                      <xsl:choose>
                        <xsl:when test="$color = 'auto'">
                          <!--<xsl:value-of select="'000000'"/>-->
                        </xsl:when>
                        <xsl:otherwise>   
                          <xsl:if test="not(./w:rPr/w:color)">
                          <xsl:text disable-output-escaping="yes">color: #</xsl:text>
                          <xsl:value-of select="replace($color,',','')"/>
                            <xsl:text>;</xsl:text>
                          </xsl:if>
                        </xsl:otherwise>
                      </xsl:choose>                      
                      <xsl:text>&#x000A;</xsl:text> 
                    </xsl:if>  
                    <xsl:if test="./w:rPr/w:smallCaps">
                      <xsl:choose>
                        <xsl:when test="./w:rPr/w:smallCaps/@w:val = '0'">
                          <xsl:if test="not(./w:rPr/w:smallCaps)">
                          <xsl:text>font-variant:normal !important;</xsl:text>
                          </xsl:if>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:if test="not(./w:rPr/w:smallCaps)">
                          <xsl:text>font-variant:small-caps !important;</xsl:text>
                          </xsl:if>
                        </xsl:otherwise>
                      </xsl:choose>  
                      <xsl:text>&#x000A;</xsl:text> 
                    </xsl:if>                
                    <xsl:if test="./w:rPr/w:caps">
                      <xsl:choose>
                        <xsl:when test="w:rPr/w:caps/@w:val = '0'">
                          <xsl:if test="not(./w:rPr/w:caps)">
                          <xsl:text>text-transform:none;</xsl:text>
                          </xsl:if>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:if test="not(./w:rPr/w:caps)">
                          <xsl:text>text-transform:uppercase;</xsl:text>
                          </xsl:if>
                        </xsl:otherwise>
                      </xsl:choose>  
                      <xsl:text>&#x000A;</xsl:text>
                    </xsl:if>                
                    <xsl:if test="./w:rPr/w:b">
                      <xsl:choose>
                        <xsl:when test="./w:rPr/w:b/@w:val = '0'">
                          <xsl:if test="not(./w:rPr/w:b)">
                          <xsl:text>font-weight:normal;</xsl:text>
                          </xsl:if>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:if test="not(./w:rPr/w:b)">
                          <xsl:text>font-weight:bold;</xsl:text>
                          </xsl:if>
                        </xsl:otherwise>
                      </xsl:choose>   
                      <xsl:text>&#x000A;</xsl:text> 
                    </xsl:if>  
                    <xsl:if test="./w:rPr/w:i">
                      <xsl:choose>
                        <xsl:when test="./w:rPr/w:i/@w:val = '0'">
                          <xsl:if test="not(./w:rPr/w:i)">
                          <xsl:text>font-style:normal;</xsl:text>
                          </xsl:if>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:if test="not(./w:rPr/w:i)">
                          <xsl:text>font-style:italic;</xsl:text>
                          </xsl:if>
                        </xsl:otherwise>
                      </xsl:choose>
                      <xsl:text>&#x000A;</xsl:text> 
                    </xsl:if> 
                    <xsl:if test="./w:rPr/w:u">
                      <xsl:choose>
                        <xsl:when test="w:rPr/w:u/@w:val = 'none'">
                          <xsl:if test="not(./w:rPr/w:u)">
                          <xsl:text>text-decoration:none;</xsl:text>
                          </xsl:if>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:if test="not(./w:rPr/w:u)">
                          <xsl:text>text-decoration:underline;</xsl:text>
                          </xsl:if>
                        </xsl:otherwise>
                      </xsl:choose>     
                      <xsl:text>&#x000A;</xsl:text> 
                    </xsl:if>  
                    <xsl:if test="./w:rPr/w:vertAlign">
                      <xsl:choose>
                        <xsl:when test="./w:rPr/w:vertAlign/@w:val = 'subscript'">
                          <xsl:if test="not(./w:rPr/w:vertAlign)">
                          <xsl:text>vertical-align:sub;</xsl:text>
                          <xsl:text>font-size: 80%;</xsl:text>
                          <!--<xsl:text>vertical-align: 15%;</xsl:text>-->
                          </xsl:if>
                        </xsl:when>
                        <xsl:when test="./w:rPr/w:vertAlign/@w:val = 'superscript'">
                          <xsl:if test="not(./w:rPr/w:vertAlign)">
                          <xsl:text>vertical-align:super;</xsl:text>
                          <xsl:text>font-size: 80%;</xsl:text>
                            <!--<xsl:text>vertical-align: -15%;</xsl:text>-->
                          </xsl:if>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:if test="not(./w:rPr/w:vertAlign)">
                          <xsl:text>vertical-align:baseline;</xsl:text>
                          </xsl:if>
                        </xsl:otherwise>
                      </xsl:choose>
                      <xsl:text>&#x000A;</xsl:text>
                    </xsl:if> 
                    <xsl:if test="./w:rPr/w:rFontsX">
                      <xsl:choose>
                        <xsl:when test="w:rPr/w:rFonts/@w:cs">
                          <xsl:if test="string-length($fontFamily) > 0">
                            <xsl:text>font-family:"</xsl:text>
                            <!--<xsl:value-of select="w:rPr/w:rFonts/@w:ascii"/>-->
                            <xsl:value-of select="w:rPr/w:rFonts/@w:cs"/>
                            <xsl:text>","serif";</xsl:text><xsl:text>&#x000A;</xsl:text>           
                          </xsl:if>
                        </xsl:when>
                        <xsl:when test="w:rPr/w:rFonts/@w:hAnsi">
                          <xsl:if test="string-length($fontFamily) > 0">
                            <xsl:text>font-family:"</xsl:text>
                            <!--<xsl:value-of select="w:rPr/w:rFonts/@w:ascii"/>-->
                            <xsl:value-of select="w:rPr/w:rFonts/@w:hAnsi"/>
                            <xsl:text>","serif";</xsl:text><xsl:text>&#x000A;</xsl:text>           
                          </xsl:if>
                        </xsl:when>
                        <xsl:when test="w:rPr/w:rFonts/@w:hAnsiTheme">
                          <xsl:variable name="themeFont" select="w:rPr/w:rFonts/@w:asciiTheme"/>
                          <xsl:text>font-family:"</xsl:text> 
                          <xsl:choose>
                            <xsl:when test="contains($themeFont, 'major')">
                              <xsl:value-of select="//a:majorFont/a:latin/@typeface"/>
                            </xsl:when>
                            <xsl:when test="contains($themeFont, 'minor')">
                              <xsl:value-of select="//a:minorFont/a:latin/@typeface"/>
                            </xsl:when>
                          </xsl:choose>
                          <xsl:text>";</xsl:text><xsl:text>&#x000A;</xsl:text>   
                        </xsl:when>
                        <xsl:when test="w:rPr/w:rFonts/@w:ascii">
                          <xsl:if test="string-length($fontFamily) > 0">
                            <xsl:text>font-family:"</xsl:text>
                            <!--<xsl:value-of select="w:rPr/w:rFonts/@w:ascii"/>-->
                            <xsl:value-of select="w:rPr/w:rFonts/@w:ascii"/>
                            <xsl:text>","serif";</xsl:text><xsl:text>&#x000A;</xsl:text>           
                          </xsl:if>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:choose><!-- FONT FAMILY -->
                            <xsl:when test="./w:basedOn">
                              <xsl:for-each select="//w:style[@w:styleId = $basedOn]">
<!--                                <xsl:if test="./@w:styleId = $basedOn">-->                                  
                                   <xsl:choose><!-- FONT FAMILY -->                                     
                                     <xsl:when test="./w:rPr/w:rFonts/@w:ascii">
                                       <xsl:text>font-family:"</xsl:text>
                                       <xsl:choose>
                                         <xsl:when test="w:rPr/w:rFonts/@w:ascii">
                                           <xsl:value-of select="w:rPr/w:rFonts/@w:ascii"/>
                                         </xsl:when>
                                         <xsl:when test="w:rPr/w:rFonts/@w:cs">
                                           <xsl:value-of select="w:rPr/w:rFonts/@w:cs"/>
                                         </xsl:when>
                                         <xsl:otherwise>
                                           <!--<xsl:call-template name="FName"/>-->
                                         </xsl:otherwise>
                                       </xsl:choose>
                                       <xsl:text>", "serif";</xsl:text><xsl:text>&#x000A;</xsl:text> 
                                     </xsl:when>
                                     
                                     <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:ascii">
                                       <xsl:text>font-family:"</xsl:text>                        
                                       <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:ascii"/>
                                       <xsl:text>";</xsl:text><xsl:text>&#x000A;</xsl:text>   
                                     </xsl:when>
                                     <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia">
                                       <xsl:text>font-family:"</xsl:text>                        
                                       <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"/>
                                       <xsl:text>";</xsl:text><xsl:text>&#x000A;</xsl:text>   
                                     </xsl:when>
                                     <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia">
                                       <xsl:text>font-family:"</xsl:text>                        
                                       <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"/>
                                       <xsl:text>";</xsl:text><xsl:text>&#x000A;</xsl:text>   
                                     </xsl:when> 
                                   </xsl:choose>
                                <!--</xsl:if>-->
                              </xsl:for-each>
                            </xsl:when>
                            <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:ascii">
                              <xsl:text>font-family:"</xsl:text>                        
                              <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:ascii"/>
                              <xsl:text>";</xsl:text><xsl:text>&#x000A;</xsl:text>   
                            </xsl:when>
                            <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia">
                              <xsl:text>font-family:"</xsl:text>                        
                              <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"/>
                              <xsl:text>";</xsl:text><xsl:text>&#x000A;</xsl:text>   
                            </xsl:when>
                            <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:asciiTheme">
                              <xsl:variable name="themeFont" select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:asciiTheme"/>
                              
                              <xsl:text>font-family:"</xsl:text> 
                              <xsl:choose>
                                <xsl:when test="contains($themeFont, 'major')">
                                  <xsl:value-of select="//a:majorFont/a:latin/@typeface"/>
                                </xsl:when>
                                <xsl:when test="contains($themeFont, 'minor')">
                                  <xsl:value-of select="//a:minorFont/a:latin/@typeface"/>
                                </xsl:when>
                              </xsl:choose>
                              <!--<xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"/>-->
                              <xsl:text>";</xsl:text><xsl:text>&#x000A;</xsl:text>   
                            </xsl:when>                      
                            <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:cs">
                              <xsl:text>font-family:"</xsl:text>                        
                              <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:cs"/>
                              <xsl:text>";</xsl:text><xsl:text>&#x000A;</xsl:text>   
                            </xsl:when>
                            <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:hAnsi">
                              <xsl:text>font-family:"</xsl:text>                        
                              <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:hAnsi"/>
                              <xsl:text>";</xsl:text><xsl:text>&#x000A;</xsl:text>   
                            </xsl:when>
                          </xsl:choose>
                          <!--</xsl:if>-->
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:if>
                  <!--</xsl:if>-->                
                <!--</xsl:if>-->                
              </xsl:for-each>
            </xsl:if>
<!-- BASED on END -->
            <!-- 1. Font Size -->  
            <xsl:choose>
              <xsl:when test="w:rPr/w:sz">
                <xsl:text>font-size:</xsl:text>   
                
                <!--<xsl:value-of select="round(((w:rPr/w:sz/@w:val) div 2)+((w:rPr/w:sz/@w:val div 2 * 10) div 100))"/>-->
                <xsl:value-of select="ceiling(((w:rPr/w:sz/@w:val) div 2)+((w:rPr/w:sz/@w:val div 2 * 10) div 100))"/>
                <xsl:text>pt;</xsl:text><xsl:text>&#x000A;</xsl:text>  
              </xsl:when>
              <xsl:when test="w:rPr/w:szCsX">
                <xsl:text>font-size:</xsl:text>                
                <!--<xsl:value-of select="w:rPr/w:szCs/@w:val"/>-->
                <xsl:value-of select="ceiling(((w:rPr/w:szCs/@w:val) div 2)+((w:rPr/w:szCs/@w:val div 2 * 10) div 100))"/>
                <xsl:text>pt;</xsl:text><xsl:text>&#x000A;</xsl:text>  
              </xsl:when>
              <xsl:otherwise>
                <xsl:choose><!-- Font SIZE taken from Default-->
                  <xsl:when test="./w:basedOn">
                    <!--<xsl:variable name="basedOn" select="./w:basedOn/@w:val"/>-->
                    <xsl:variable name="basedOn">
                      <xsl:choose>
                        <xsl:when test="./w:basedOn/@w:val = '[No paragraph style]'">
                          <xsl:value-of select="'Noparagraphstyle'"/>
                        </xsl:when>
                        <xsl:when test="./w:basedOn/@w:val = '[No character style]'">
                          <xsl:value-of select="'Nocharacterstyle'"/>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:value-of select="./w:basedOn/@w:val"/>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:variable>                    
                    <xsl:for-each select="//w:style">
                      <!-- 222222222222 -->
                      <xsl:if test="@w:styleId = $basedOn">
                        <xsl:choose><!-- FONT FAMILY -->
                          <xsl:when test="./w:rPr/w:sz">                            
                            <xsl:text>font-size:</xsl:text>
                            <xsl:variable name="fontSize" select="number(./w:rPr/w:sz/@w:val) div 2"/>
                            <!--<xsl:value-of select="$fontSize"/>-->
                            <xsl:value-of select="ceiling($fontSize + (($fontSize * 10) div 100))"/>
                            <xsl:text>pt;</xsl:text><xsl:text>&#x000A;</xsl:text>   
                          </xsl:when>
                          <xsl:when test="./w:basedOn">
                            <!--<xsl:variable name="basedOn" select="./w:basedOn/@w:val"/>-->
                            <xsl:variable name="basedOn">
                              <xsl:choose>
                                <xsl:when test="./w:basedOn/@w:val = '[No paragraph style]'">
                                  <xsl:value-of select="'Noparagraphstyle1'"/>
                                </xsl:when>
                                <xsl:when test="./w:basedOn/@w:val = '[No character style]'">
                                  <xsl:value-of select="'Nocharacterstyle1'"/>
                                </xsl:when>
                                <xsl:otherwise>
                                  <xsl:value-of select="./w:basedOn/@w:val"/>
                                </xsl:otherwise>
                              </xsl:choose>
                            </xsl:variable>        
                            <!-- //w:style/w:name[@w:val = $basedOn] -->
                            <xsl:for-each select="//w:style[@w:styleId = $basedOn]">              
                              <xsl:choose>
                                <xsl:when test="./w:rPr/w:sz">                            
                                  <xsl:text>font-size:</xsl:text>
                                  <xsl:variable name="fontSize" select="number(./w:rPr/w:sz/@w:val) div 2"/>
                                  <!--<xsl:value-of select="$fontSize"/>-->
                                  <xsl:value-of select="ceiling($fontSize + (($fontSize * 10) div 100))"/>
                                  <xsl:text>pt;</xsl:text><xsl:text>&#x000A;</xsl:text>   
                                </xsl:when>                                
                                <xsl:otherwise> 
                                  <xsl:call-template name="font-size"/>
                                </xsl:otherwise>
                              </xsl:choose>
                              <!--</xsl:if>-->
                            </xsl:for-each>
                          </xsl:when> 
                          <xsl:otherwise>
                            <xsl:text>font-size:</xsl:text>
                            <xsl:variable name="fontSize" select="number(//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:sz/@w:val) div 2"/>
                            <!--<xsl:value-of select="$fontSize"/>-->
                            <xsl:value-of select="ceiling($fontSize + (($fontSize * 10) div 100))"/>
                            <xsl:text>pt;</xsl:text><xsl:text>&#x000A;</xsl:text>   
                          </xsl:otherwise>
                        </xsl:choose>
                      </xsl:if>
                      <!-- 2222222222 -->
                    </xsl:for-each>
                  </xsl:when>
                  <xsl:when test="./w:rPr/w:sz">
                    <xsl:text>font-size:</xsl:text>
                    <xsl:variable name="fontSize" select="number(./w:rPr/w:sz/@w:val) div 2"/>
                    <!--<xsl:value-of select="$fontSize"/>-->
                    <xsl:value-of select="ceiling($fontSize + (($fontSize * 10) div 100))"/>
                    <xsl:text>pt;</xsl:text><xsl:text>&#x000A;</xsl:text>   
                  </xsl:when>
                  
                  <!--<xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:sz">                    
                    <xsl:text>font-size:</xsl:text>
                    <xsl:variable name="fontSize" select="number(//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:sz/@w:val) div 2"/>
                    <!-\-<xsl:value-of select="$fontSize"/>-\->
                    <xsl:value-of select="ceiling($fontSize + (($fontSize * 10) div 100))"/>
                    <xsl:text>pt;</xsl:text><xsl:text>&#x000A;</xsl:text>   
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:text>font-size:</xsl:text>
                    <xsl:value-of select="'12'"/>
                    <xsl:text>pt;</xsl:text><xsl:text>&#x000A;</xsl:text>   
                  </xsl:otherwise>-->
                </xsl:choose>
                <!--</xsl:if>-->
              </xsl:otherwise>
            </xsl:choose>
            <!-- 2. Font Family -->
            <!-- Commented As per Ashok sir's update on 21-aug-17 -->
            <!--<xsl:choose>
              <xsl:when test="./w:rPr/w:rFonts/@w:ascii">
                <xsl:if test="string-length($fontFamily) > 0">
                  <xsl:text>font-family:"</xsl:text>
                  <!-\-<xsl:value-of select="w:rPr/w:rFonts/@w:ascii"/>-\->
                  <xsl:value-of select="w:rPr/w:rFonts/@w:ascii"/>
                  <xsl:text>","serif";</xsl:text><xsl:text>&#x000A;</xsl:text>           
                </xsl:if>
              </xsl:when>
              <xsl:when test="./w:rPr/w:rFonts/@w:hAnsi">
                <xsl:if test="string-length($fontFamily) > 0">
                  <xsl:text>font-family:"</xsl:text>
                  <!-\-<xsl:value-of select="w:rPr/w:rFonts/@w:ascii"/>-\->
                  <xsl:value-of select="w:rPr/w:rFonts/@w:hAnsi"/>
                  <xsl:text>","serif";</xsl:text><xsl:text>&#x000A;</xsl:text>           
                </xsl:if>
              </xsl:when>
              <xsl:when test="./w:rPr/w:rFonts/@w:cs">
                <xsl:if test="string-length($fontFamily) > 0">
                  <xsl:text>font-family:"</xsl:text>
                  <!-\-<xsl:value-of select="w:rPr/w:rFonts/@w:ascii"/>-\->
                  <xsl:value-of select="./w:rPr/w:rFonts/@w:cs"/>
                  <xsl:text>","serif";</xsl:text><xsl:text>&#x000A;</xsl:text>           
                </xsl:if>
              </xsl:when>              
              <xsl:when test="./w:rPr/w:rFonts/@w:hAnsiTheme">
                <xsl:variable name="themeFont" select="w:rPr/w:rFonts/@w:hAnsiTheme"/> 
                <xsl:text>font-family:"</xsl:text> 
                <xsl:choose>
                  <xsl:when test="contains($themeFont, 'major')">
                    <xsl:if test="not(//a:majorFont/a:latin/@typeface)">
                      <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:ascii"/>
                    </xsl:if>
                    <xsl:value-of select="//a:majorFont/a:latin/@typeface"/>
                  </xsl:when>
                  <xsl:when test="contains($themeFont, 'minor')">
                    <xsl:if test="not(//a:majorFont/a:latin/@typeface)">
                      <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:ascii"/>
                    </xsl:if>
                    <xsl:value-of select="//a:minorFont/a:latin/@typeface"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:ascii"/>
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:text>";</xsl:text><xsl:text>&#x000A;</xsl:text>   
              </xsl:when>
              <xsl:otherwise>
                <!-\-<xsl:if test="not(./w:basedOn)">-\->
                <xsl:choose><!-\- FONT FAMILY -\->
                  <xsl:when test="./w:basedOn">
                    <xsl:for-each select="//w:style">
                      <!-\-xsl:if test="./w:name/@w:val = $basedOn"-\->
                      <xsl:if test="@w:styleId = $basedOn">
                        <xsl:choose><!-\- FONT FAMILY -\->
                          <xsl:when test="./w:rPr/w:rFonts/@w:ascii">
                            <xsl:text>font-family:"</xsl:text>
                            <xsl:choose>
                              <xsl:when test="w:rPr/w:rFonts/@w:ascii">
                                <xsl:value-of select="w:rPr/w:rFonts/@w:ascii"/>
                              </xsl:when>
                              <xsl:when test="w:rPr/w:rFonts/@w:cs">
                                <xsl:value-of select="w:rPr/w:rFonts/@w:cs"/>
                              </xsl:when>
                              <xsl:otherwise>
                                <xsl:call-template name="FName"/>
                              </xsl:otherwise>
                            </xsl:choose>
                            <xsl:text>", "serif";</xsl:text><xsl:text>&#x000A;</xsl:text> 
                          </xsl:when>
                          <xsl:when test="./w:basedOn">
                            <!-\- //w:style/w:name[@w:val = $basedOn] -\->
                            <xsl:for-each select="//w:style[@w:styleId = $basedOn]">              
                              <xsl:choose>
                                <xsl:when test="w:rPr/w:rFonts/@w:ascii">
                                  <xsl:text>font-family:"</xsl:text>
                                  <xsl:value-of select="w:rPr/w:rFonts/@w:ascii"/>
                                  <xsl:text>", "serif";</xsl:text><xsl:text>&#x000A;</xsl:text> 
                                </xsl:when>
                                <xsl:when test="w:rPr/w:rFonts/@w:cs">
                                  <xsl:text>font-family:"</xsl:text>
                                  <xsl:value-of select="w:rPr/w:rFonts/@w:cs"/>
                                  <xsl:text>", "serif";</xsl:text><xsl:text>&#x000A;</xsl:text> 
                                </xsl:when>
                                <xsl:otherwise> 
                                  <xsl:call-template name="font-family"/>
                                </xsl:otherwise>
                              </xsl:choose>
                              <!-\-</xsl:if>-\->
                            </xsl:for-each>
                          </xsl:when>
                          <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:cs">
                            <xsl:text>font-family:"</xsl:text>                        
                            <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:cs"/>
                            <xsl:text>";</xsl:text><xsl:text>&#x000A;</xsl:text>   
                          </xsl:when>
                          <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:hAnsi">
                            <xsl:text>font-family:"</xsl:text>                        
                            <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:hAnsi"/>
                            <xsl:text>";</xsl:text><xsl:text>&#x000A;</xsl:text>   
                          </xsl:when>
                          <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:ascii">
                            <xsl:text>font-family:"</xsl:text>                        
                            <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:ascii"/>
                            <xsl:text>";</xsl:text><xsl:text>&#x000A;</xsl:text>   
                          </xsl:when>
                          <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia">
                            <xsl:text>font-family:"</xsl:text>                        
                            <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"/>
                            <xsl:text>";</xsl:text><xsl:text>&#x000A;</xsl:text>   
                          </xsl:when>
                        </xsl:choose>
                      </xsl:if>
                    </xsl:for-each>
                  </xsl:when>
                  <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:ascii">
                    <xsl:text>font-family:"</xsl:text>                        
                    <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:ascii"/>
                    <xsl:text>";</xsl:text><xsl:text>&#x000A;</xsl:text>   
                  </xsl:when>
                  <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia">
                    <xsl:text>font-family:"</xsl:text>                        
                    <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"/>
                    <xsl:text>";</xsl:text><xsl:text>&#x000A;</xsl:text>   
                  </xsl:when>                  
                  <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:asciiTheme">
                    <xsl:variable name="themeFont" select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:asciiTheme"/>                                      
                    <xsl:text>font-family:"</xsl:text> 
                    <xsl:choose>
                      <xsl:when test="contains($themeFont, 'major')">
                        <xsl:value-of select="//a:majorFont/a:latin/@typeface"/>
                      </xsl:when>
                      <xsl:when test="contains($themeFont, 'minor')">
                        <xsl:value-of select="//a:minorFont/a:latin/@typeface"/>
                      </xsl:when>
                    </xsl:choose>
                    <!-\-<xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"/>-\->
                    <xsl:text>";</xsl:text><xsl:text>&#x000A;</xsl:text>   
                  </xsl:when>
                  <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsiaTheme">
                    <xsl:variable name="themeFont" select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsiaTheme"/>                                        
                    <xsl:text>font-family:"</xsl:text> 
                    <xsl:choose>
                      <xsl:when test="contains($themeFont, 'major')">
                        <xsl:value-of select="//a:majorFont/a:latin/@typeface"/>
                      </xsl:when>
                      <xsl:when test="contains($themeFont, 'minor')">
                        <xsl:value-of select="//a:minorFont/a:latin/@typeface"/>
                      </xsl:when>
                    </xsl:choose>
                    <!-\-<xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"/>-\->
                    <xsl:text>";</xsl:text><xsl:text>&#x000A;</xsl:text>   
                  </xsl:when>
                  <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:hAnsiTheme">
                    <xsl:variable name="themeFont" select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:hAnsiTheme"/>                                        
                    <xsl:text>font-family:"</xsl:text> 
                    <xsl:choose>
                      <xsl:when test="contains($themeFont, 'major')">
                        <xsl:value-of select="//a:majorFont/a:latin/@typeface"/>
                      </xsl:when>
                      <xsl:when test="contains($themeFont, 'minor')">
                        <xsl:value-of select="//a:minorFont/a:latin/@typeface"/>
                      </xsl:when>
                    </xsl:choose>
                    <!-\-<xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"/>-\->
                    <xsl:text>";</xsl:text><xsl:text>&#x000A;</xsl:text>   
                  </xsl:when>
                  <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:cstheme">
                    <xsl:variable name="themeFont" select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:cstheme"/>                                        
                    <xsl:text>font-family:"</xsl:text> 
                    <xsl:choose>
                      <xsl:when test="contains($themeFont, 'major')">
                        <xsl:value-of select="//a:majorFont/a:latin/@typeface"/>
                      </xsl:when>
                      <xsl:when test="contains($themeFont, 'minor')">
                        <xsl:value-of select="//a:minorFont/a:latin/@typeface"/>
                      </xsl:when>
                    </xsl:choose>
                    <!-\-<xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"/>-\->
                    <xsl:text>";</xsl:text><xsl:text>&#x000A;</xsl:text>   
                  </xsl:when>
                  <!-\- xxxxx -\->
                  
                  <!-\- xxxxx -\->
                  <xsl:otherwise>
                    <xsl:variable name="themeFont">
                      <xsl:choose>
                        <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:asciiTheme">
                          <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:asciiTheme"/>
                        </xsl:when>
                        <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsiaTheme">
                          <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsiaTheme"/>
                        </xsl:when>
                      </xsl:choose>
                    </xsl:variable>                    
                    <xsl:text>font-family:"</xsl:text> 
                    <xsl:choose>
                      <xsl:when test="contains($themeFont, 'major')">
                        <xsl:value-of select="//a:majorFont/a:latin/@typeface"/>
                      </xsl:when>
                      <xsl:when test="contains($themeFont, 'minor')">
                        <xsl:value-of select="//a:minorFont/a:latin/@typeface"/>
                      </xsl:when>
                    </xsl:choose>
                    <!-\-<xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"/>-\->
                    <xsl:text>";</xsl:text><xsl:text>&#x000A;</xsl:text>  
                  </xsl:otherwise>
                </xsl:choose>
                <!-\-</xsl:if>-\->
              </xsl:otherwise>
            </xsl:choose>-->
            <!-- 3. font-variant -->
            <xsl:choose>
              <xsl:when test="w:rPr/w:smallCaps">
                <xsl:choose>
                  <xsl:when test="$textVarient = '0'">
                    <xsl:text>font-variant:normal !important;</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:text>font-variant:small-caps !important;</xsl:text>
                  </xsl:otherwise>
                </xsl:choose>  
                <xsl:text>&#x000A;</xsl:text> 
              </xsl:when>
              <xsl:otherwise>
                <xsl:if test="not(w:basedOn)">
                <xsl:call-template name="font-variant"/>
                </xsl:if>
              </xsl:otherwise>
            </xsl:choose>
            <!-- 4. text-transform -->  
            <xsl:choose>
              <xsl:when test="w:rPr/w:caps">
                <xsl:choose>
                  <xsl:when test="$textTrans = '0'">
                    <xsl:text>text-transform:none;</xsl:text>
                  </xsl:when>
                  <xsl:when test="$textTrans = 'null'">
                    <xsl:text>text-transform:uppercase;</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:text>text-transform:uppercase;</xsl:text>
                  </xsl:otherwise>
                </xsl:choose>  
                <xsl:text>&#x000A;</xsl:text> 
              </xsl:when>
              <xsl:otherwise>
                <xsl:if test="w:basedOn">
                <xsl:call-template name="text-transform"/>
                </xsl:if>
                <xsl:if test="w:link">
                  <xsl:call-template name="text-transform2"/>
                </xsl:if>
              </xsl:otherwise>
            </xsl:choose>
            <!-- 5. color -->  
            <xsl:choose>
              <xsl:when test="w:rPr/w:color">                
                <xsl:choose>
                  <xsl:when test="$color = 'auto'">
                    <!--<xsl:value-of select="'000000'"/>-->
                  </xsl:when>
                  <xsl:otherwise>                    
                    <xsl:text disable-output-escaping="yes">color: #</xsl:text>
                    <xsl:value-of select="replace($color,',','')"/>                    
                  </xsl:otherwise>
                </xsl:choose>
                <!--<xsl:text>color:#</xsl:text>                      
                    <xsl:value-of select="./w:rPr/w:color/@w:val"/>-->
                <xsl:text>;</xsl:text>
                <xsl:text>&#x000A;</xsl:text>
                <!--<xsl:if test="w:rPr/w:color/@FillTint and not(w:rPr/w:color/@w:val = '00,00,00')">                      
                  <xsl:text>opacity: </xsl:text>
                  <xsl:value-of select="w:rPr/w:color/@FillTint div 100"/>
                  <xsl:text>;</xsl:text>                       
                </xsl:if>-->
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="color"/>
              </xsl:otherwise>
            </xsl:choose>
            <!-- 7. font-weight -->
            <xsl:choose>
              <xsl:when test="w:rPr/w:b">
                <xsl:choose>
                  <xsl:when test="$fontWeight = 'false'">
                    <xsl:text>font-weight:normal;</xsl:text>
                  </xsl:when>
          <!-- condition added by hari                 -->
                  <xsl:when test="$fontWeight = '0'">
                    <xsl:text>font-weight:normal;</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:text>font-weight:bold;</xsl:text>
                  </xsl:otherwise>
                </xsl:choose>   
                <xsl:text>&#x000A;</xsl:text> 
              </xsl:when>
              <xsl:otherwise>                
                <xsl:call-template name="font-weight"/>                
              </xsl:otherwise>
            </xsl:choose>

            <!-- 8. font-style -->
            <xsl:choose>
              <xsl:when test="w:rPr/w:i">
                <xsl:choose>
                  <xsl:when test="$fontWeight = 'false'">
                    <xsl:text>font-weight:normal;</xsl:text>
                  </xsl:when>
                  <!-- condition added by hari                 -->
                  <xsl:when test="$fontStyle = '0'">
                    <xsl:text>font-style:normal;</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:text>font-style:italic;</xsl:text>
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:text>&#x000A;</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="font-style"/>                
              </xsl:otherwise>
            </xsl:choose>

            <!-- 9. text decoration -->
            <xsl:choose>
              <xsl:when test="w:rPr/w:u">
                
                
                <xsl:choose>
                  <xsl:when test="$underline = 'single'">
                    <xsl:text>text-decoration:underline</xsl:text>
                    <xsl:if test="w:rPr/w:u/@w:color">
                      <xsl:value-of select="concat(' #',$underlineColor)"/>
                    </xsl:if>                    
                    <xsl:text>;</xsl:text>
                  </xsl:when>
                  <xsl:when test="$underline = 'double'">
                    <xsl:text>text-decoration:underline double</xsl:text>
                    <xsl:if test="w:rPr/w:u/@w:color">
                      <xsl:value-of select="concat(' #',$underlineColor)"/>
                    </xsl:if>                    
                    <xsl:text>;</xsl:text>
                  </xsl:when>
                  
                  <xsl:when test="$underline = 'words'">
                    <xsl:choose>
                      <xsl:when test="$underlineOffset &lt; '0'">
                        <!--<xsl:text>background-color:#</xsl:text>
                        <xsl:value-of select="w:rPr/w:u/@w:color"/>-->
                        <xsl:text>background-color: rgba(</xsl:text>
                        <xsl:value-of select="w:rPr/w:u/@w:color"/>
                        <xsl:if test="w:rPr/w:u/@w:UnderlineTint">
                          <xsl:text>,</xsl:text>
                          <xsl:value-of select="$underlineTint div 100"/>
                        </xsl:if>                       
                        <xsl:text>);</xsl:text>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:text>text-decoration:underline</xsl:text>
                        <xsl:if test="w:rPr/w:u/@w:color">
                          <xsl:value-of select="concat(' rgba(',$underlineColor)"/>
                          <xsl:if test="w:rPr/w:u/@w:UnderlineTint">
                            <xsl:text>,</xsl:text>
                            <xsl:value-of select="$underlineTint div 100"/>
                          </xsl:if> 
                          <xsl:text>);</xsl:text>
                        </xsl:if>                        
                        <xsl:text>;</xsl:text>
                      </xsl:otherwise>
                    </xsl:choose>
                    
                    
                    
                  </xsl:when>
                  
                  <xsl:otherwise>
                    <xsl:text>text-decoration:none;</xsl:text>                    
                  </xsl:otherwise>
                </xsl:choose>     
                <xsl:text>&#x000A;</xsl:text> 
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="text-decoration"/>                
              </xsl:otherwise>
            </xsl:choose>

            <!-- 10. vertical-align -->
            <xsl:choose>
              <xsl:when test="w:rPr/w:vertAlign">
                <xsl:choose>
                  <xsl:when test="$baseline = 'subscript'">
                    <xsl:text>vertical-align:sub;</xsl:text>
                    <xsl:text>font-size: 80%;</xsl:text>
                  </xsl:when>
                  <xsl:when test="$baseline = 'superscript'">
                    <xsl:text>vertical-align:super;</xsl:text>
                    <xsl:text>font-size: 80%;</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:text>vertical-align:baseline;</xsl:text>
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:text>&#x000A;</xsl:text> 
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="vertical-align"/>
              </xsl:otherwise>
            </xsl:choose>

            <!-- 11. margin -->
            <xsl:choose>
              <xsl:when test="w:pPr/w:spacing">
                <!-- margin-top -->
                <xsl:choose>
                  <xsl:when test="not(w:pPr/w:spacing/@w:before)">
                    
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:text>margin-top:</xsl:text>
                    <!--  updated by hari                  -->
                    <xsl:value-of select="$bSapce div 20"/>
                    <!-- <xsl:value-of select="number($bSapce) div 20"/> -->
                    <xsl:text>pt;</xsl:text>
                    <xsl:text>&#x000A;</xsl:text>
                  </xsl:otherwise>
                </xsl:choose>                
                <!-- margin-bottom -->
                <xsl:choose>
                    <xsl:when test="not(w:pPr/w:spacing/@w:after)">
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:text>margin-bottom:</xsl:text>
                      <xsl:value-of select="$aSapce div 20"/>
                      <xsl:text>pt;</xsl:text>
                      <xsl:text>&#x000A;</xsl:text>
                    </xsl:otherwise>
                 </xsl:choose>
                <xsl:if test="w:basedOn">                  
                  <xsl:call-template name="margin-basedon">
                    <xsl:with-param name="before" select="w:pPr/w:spacing/@w:before"/>
                    <xsl:with-param name="after" select="w:pPr/w:spacing/@w:after"/>
                  </xsl:call-template>
                </xsl:if>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="margin"/>                
              </xsl:otherwise>
            </xsl:choose>
            

            <!--  12. Text align -->
            <xsl:choose>
              <xsl:when test="w:pPr/w:jc">
                <xsl:text>text-align:</xsl:text>
                <xsl:choose>
                  <xsl:when test="$textAlign = 'both'">                    
                    <xsl:text>justify</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="$textAlign"/>
                  </xsl:otherwise>
                </xsl:choose>
                <!--<xsl:value-of select="$textAlign"/>-->        
                <xsl:text>;</xsl:text>
                <xsl:text>&#x000A;</xsl:text>
              </xsl:when>
              <xsl:otherwise> 
                <xsl:choose><!-- Font SIZE taken from Default-->
                  <xsl:when test="./w:basedOn">
                    <xsl:variable name="textAlign" select="./w:pPr/w:jc/@w:val"/>
                    
                    <xsl:for-each select="//w:style">
                      <xsl:if test="@w:styleId = $basedOn">
                        
                        <xsl:choose><!-- FONT FAMILY -->
                          <xsl:when test="./w:pPr/w:jc">   
                            
                            <xsl:choose>
                              <xsl:when test="./w:pPr/w:jc[@w:val = 'both']">
                                <xsl:text>text-align:</xsl:text>
                                <xsl:text>justify;</xsl:text>
                              </xsl:when>
                              <xsl:when test="./w:pPr/w:jc[@w:val = 'left']">
                                <xsl:text>text-align:</xsl:text>
                                <xsl:text>left;</xsl:text>
                              </xsl:when>
                              <xsl:when test="./w:pPr/w:jc[@w:val = 'right']">
                                <xsl:text>text-align:</xsl:text>
                                <xsl:text>right;</xsl:text>
                              </xsl:when>
                              <xsl:when test="./w:pPr/w:jc[@w:val = 'center']">
                                <xsl:text>text-align:</xsl:text>
                                <xsl:text>center;</xsl:text>
                              </xsl:when>                              
                            </xsl:choose>   
                          </xsl:when>
                          <xsl:when test="./w:basedOn">                            
                            <xsl:for-each select="//w:style">              
                              <xsl:if test="@w:styleId = $basedOn">
                                <xsl:choose><!-- Font SIZE -->
                                  <xsl:when test="w:pPr/w:jc">
                                    <xsl:choose>
                                      <xsl:when test="./w:pPr/w:jc[@w:val = 'both']">
                                        <xsl:text>text-align:</xsl:text>
                                        <xsl:text>justify;</xsl:text>
                                      </xsl:when>
                                      <xsl:when test="./w:pPr/w:jc[@w:val = 'left']">
                                        <xsl:text>text-align:</xsl:text>
                                        <xsl:text>left;</xsl:text>
                                      </xsl:when>
                                      <xsl:when test="./w:pPr/w:jc[@w:val = 'right']">
                                        <xsl:text>text-align:</xsl:text>
                                        <xsl:text>right;</xsl:text>
                                      </xsl:when>
                                      <xsl:when test="./w:pPr/w:jc[@w:val = 'center']">
                                        <xsl:text>text-align:</xsl:text>
                                        <xsl:text>center;</xsl:text>
                                      </xsl:when>
                                    </xsl:choose>   
                                  </xsl:when>
                                  <xsl:otherwise>                                    
                                    <xsl:call-template name="font-justify"/>
                                    <xsl:text>&#x000A;</xsl:text>   
                                  </xsl:otherwise>
                                </xsl:choose>
                              </xsl:if>
                              <!--</xsl:if>-->
                            </xsl:for-each>
                          </xsl:when>
                          <xsl:when test="w:pPr/w:jc">
                            <xsl:text>text-align:</xsl:text>
                            <xsl:choose>
                              <xsl:when test="$textAlign = 'both'">
                                <xsl:text>justify</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                <xsl:value-of select="$textAlign"/>
                              </xsl:otherwise>
                            </xsl:choose>
                            <!--<xsl:value-of select="$textAlign"/>-->        
                            <xsl:text>;</xsl:text>
                            <xsl:text>&#x000A;</xsl:text>
                          </xsl:when>
                        </xsl:choose>
                      </xsl:if>
                      <!-- 2222222222 -->
                    </xsl:for-each>
                  </xsl:when>
                  
                </xsl:choose>
              </xsl:otherwise>
            </xsl:choose>

            <!--  13. Indent -->
            <xsl:choose>              
              <xsl:when test="w:pPr/w:ind">
                
                <xsl:choose>
                  <xsl:when test="not(w:pPr/w:ind/@w:firstLine) and not(w:pPr/w:ind/@w:hanging) and not(w:pPr/w:ind/@w:left) and not(w:pPr/w:ind/@w:right)">
                    <xsl:choose>
                      <xsl:when test="./w:basedOn">
                        <xsl:variable name="basedOn" select="w:basedOn/@w:val"/>
                        
                        <xsl:for-each select="//w:style">                        
                          <xsl:if test="@w:styleId = $basedOn"><!-- xsl:if test="./w:name/@w:val = $basedOn" -->                            
                            <xsl:if test="./w:pPr/w:ind/@w:firstLine">
                              <xsl:text>text-indent:</xsl:text>                              
                              <xsl:value-of select="w:pPr/w:ind/@w:firstLine div 20"/>                              
                              <xsl:text>pt;</xsl:text>
                              <xsl:text>&#x000A;</xsl:text>
                            </xsl:if>
                            <xsl:if test="./w:pPr/w:ind/@w:hanging">
                              <!--<xsl:text>padding-left:-</xsl:text>-->
                              <xsl:text>text-indent:-</xsl:text>
                              <xsl:value-of select="w:pPr/w:ind/@w:hanging div 20"/>        
                              <xsl:text>pt;</xsl:text>
                              <xsl:text>&#x000A;</xsl:text>
                            </xsl:if>     
                            <xsl:if test="w:pPr/w:ind/@w:left">
                              <xsl:text>&#x000A;</xsl:text>
                              <xsl:text>margin-left:</xsl:text>
                              <!-- Added on 24-aug-17, to reduce the left margin based on padding -->
                              <!--<xsl:choose>
                        <xsl:when test="w:pPr/w:ind/@w:hanging">                          
                          <xsl:variable name="hang" select="w:pPr/w:ind/@w:hanging div 20"/>
                          <xsl:variable name="left" select="w:pPr/w:ind/@w:left div 20"/>
                          <xsl:if test="$hang > $left">
                            <xsl:value-of select="($hang - $left)"/>
                          </xsl:if>
                          <xsl:if test="$hang &lt; $left">                            
                            <xsl:value-of select="($left - $hang)"/>
                          </xsl:if>
                          <xsl:if test="$hang = $left">                            
                            <xsl:value-of select="$left div 2"/>
                          </xsl:if>
                        </xsl:when>
                        <xsl:otherwise>
                          <!-\-<xsl:value-of select="w:pPr/w:ind/@w:left div 20"/>-\->
                          <!-\-<xsl:value-of select="(w:pPr/w:ind/@w:left div 20) - 9"/>-\->                          
                          <xsl:value-of select="w:pPr/w:ind/@w:left div 20"/>
                        </xsl:otherwise>
                      </xsl:choose>-->
                              <xsl:value-of select="w:pPr/w:ind/@w:left div 20"/>        
                              <xsl:text>pt;</xsl:text>
                              <xsl:text>&#x000A;</xsl:text>
                            </xsl:if> 
                            <xsl:if test="./w:basedOn">
                              <xsl:call-template name="margin-left-right">
                                <xsl:with-param name="hanging" select="./w:pPr/w:ind/@w:hanging"/>
                                <xsl:with-param name="left" select="./w:pPr/w:ind/@w:left"/>
                                <xsl:with-param name="firstline" select="./w:pPr/w:ind/@w:firstLine"/>
                                <xsl:with-param name="right" select="./w:pPr/w:ind/@w:right"/>
                              </xsl:call-template>
                            </xsl:if>
                          </xsl:if>
                        </xsl:for-each>
                      </xsl:when>
                    </xsl:choose>
                  </xsl:when>
                  <xsl:when test="w:pPr/w:ind/@w:firstLine | w:pPr/w:ind/@w:hanging | w:pPr/w:ind/@w:left | w:pPr/w:ind/@w:right">
                    <xsl:if test="w:pPr/w:ind/@w:firstLine or w:pPr/w:ind[@w:firstLine != '0']">
                      <xsl:text>&#x000A;</xsl:text>
                      <xsl:text>text-indent:</xsl:text>
                      <xsl:value-of select="w:pPr/w:ind/@w:firstLine div 20"/>        
                      <xsl:text>pt;</xsl:text>
                      <xsl:text>&#x000A;</xsl:text>
                    </xsl:if>    
                    <xsl:if test="w:pPr/w:ind/@w:left">
                      <xsl:text>&#x000A;</xsl:text>
                      <xsl:text>margin-left:</xsl:text>
                      <!-- Added on 24-aug-17, to reduce the left margin based on padding -->
                      <!--<xsl:choose>
                        <xsl:when test="w:pPr/w:ind/@w:hanging">                          
                          <xsl:variable name="hang" select="w:pPr/w:ind/@w:hanging div 20"/>
                          <xsl:variable name="left" select="w:pPr/w:ind/@w:left div 20"/>
                          <xsl:if test="$hang > $left">
                            <xsl:value-of select="($hang - $left)"/>
                          </xsl:if>
                          <xsl:if test="$hang &lt; $left">                            
                            <xsl:value-of select="($left - $hang)"/>
                          </xsl:if>
                          <xsl:if test="$hang = $left">                            
                            <xsl:value-of select="$left div 2"/>
                          </xsl:if>
                        </xsl:when>
                        <xsl:otherwise>
                          <!-\-<xsl:value-of select="w:pPr/w:ind/@w:left div 20"/>-\->
                          <!-\-<xsl:value-of select="(w:pPr/w:ind/@w:left div 20) - 9"/>-\->                          
                          <xsl:value-of select="w:pPr/w:ind/@w:left div 20"/>
                        </xsl:otherwise>
                      </xsl:choose>-->
                      <xsl:value-of select="w:pPr/w:ind/@w:left div 20"/>        
                      <xsl:text>pt;</xsl:text>
                      <xsl:text>&#x000A;</xsl:text>
                    </xsl:if> 
                    <xsl:if test="w:pPr/w:ind/@w:right">
                      <xsl:text>margin-right:</xsl:text>
                      <xsl:value-of select="w:pPr/w:ind/@w:right div 20"/>        
                      <xsl:text>pt;</xsl:text>
                      <xsl:text>&#x000A;</xsl:text>
                    </xsl:if>
                    <xsl:if test="w:pPr/w:ind/@w:hanging">
                      <!--<xsl:text>padding-left:-</xsl:text>-->
                      <xsl:text>text-indent:-</xsl:text>
                      <xsl:value-of select="w:pPr/w:ind/@w:hanging div 20"/>        
                      <xsl:text>pt;</xsl:text>
                      <xsl:text>&#x000A;</xsl:text>
                    </xsl:if> 
                    
                    <xsl:if test="w:basedOn">                      
                      <xsl:call-template name="margin-left-right">
                        <xsl:with-param name="hanging" select="w:pPr/w:ind/@w:hanging"/>
                        <xsl:with-param name="left" select="w:pPr/w:ind/@w:left"/>
                        <xsl:with-param name="firstline" select="w:pPr/w:ind/@w:firstLine"/>
                        <xsl:with-param name="right" select="w:pPr/w:ind/@w:right"/>
                      </xsl:call-template>
                    </xsl:if> 
                  </xsl:when>                  
                </xsl:choose>                
              </xsl:when>              
              <xsl:otherwise>
                <xsl:call-template name="margin-left-right">
                  <xsl:with-param name="hanging" select="w:pPr/w:ind/@w:hanging"/>
                  <xsl:with-param name="left" select="w:pPr/w:ind/@w:left"/>
                  <xsl:with-param name="firstline" select="w:pPr/w:ind/@w:firstLine"/>
                  <xsl:with-param name="right" select="w:pPr/w:ind/@w:right"/>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>                       
            
            <!-- 14. Bgcolor -->
            
            <xsl:text>}</xsl:text>   
</xsl:template>

  <!-- 24-Feb-18: Removing DIV for Figure and Table captions -->
  <xsl:template match="div[@data-alias = 'FigureCaption'] | div[@data-alias = 'TableCaption']">
    <xsl:apply-templates/>
  </xsl:template>

</xsl:stylesheet>
