<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" xmlns:idPkg="http://ns.adobe.com/AdobeInDesign/idml/1.0/packaging"
    version="2.0">
    
  
    
         <xsl:output method="text" indent="no"/>
  <xsl:strip-space elements="*"/>
	
	<xsl:template match="/">
	
	<xsl:apply-templates select="//XMLElement[@MarkupTag='XMLTag/figure']"/>
	</xsl:template>
	 <xsl:template match="XMLElement[@MarkupTag='XMLTag/figure']">

<xsl:choose>
<xsl:when test="not(@Image)">
	 
	<xsl:choose>
	 <xsl:when test="descendant::XMLElement[@MarkupTag='XMLTag/Image']">
	 	
	 </xsl:when>
	 <xsl:otherwise>
	 <xsl:text>&#x000A;</xsl:text>
	 <xsl:value-of select="'Art '"/>
	  <!--<xsl:number level="single" count="XMLElement[@MarkupTag='XMLTag/figure']"/>-->
	  <xsl:value-of select="' missing: '"/>
<xsl:text>&#x000A;</xsl:text>
<xsl:text>&#x000A;</xsl:text>
<xsl:value-of select="'Art Caption: '"/>
<xsl:value-of select="."/>
<xsl:text>&#x000A;</xsl:text>
<xsl:value-of select="'Art XMLID: '"/>
	 <xsl:value-of select="./XMLAttribute/@Value"/>
	 <xsl:value-of select="./XMLElement[@MarkupTag='XMLTag/links']/XMLAttribute/@Value"/>
	<xsl:text>&#x000A;</xsl:text>
	<xsl:text>&#x000A;</xsl:text>
	 </xsl:otherwise>
	 </xsl:choose>
</xsl:when>
</xsl:choose>
    </xsl:template>
</xsl:stylesheet>