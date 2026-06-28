<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" xmlns:idPkg="http://ns.adobe.com/AdobeInDesign/idml/1.0/packaging"
    version="2.0">
    
  
    
         <xsl:output method="xml" indent="no"/>
  <xsl:strip-space elements="*"/>
	
	<xsl:template match="/">
	<xsl:element name="artcaption">
	<xsl:apply-templates select="//XMLElement[@MarkupTag='XMLTag/figure']"/>
	</xsl:element>
	</xsl:template>
	 <xsl:template match="XMLElement[@MarkupTag='XMLTag/figure']">

<!--<xsl:choose>
<xsl:when test="not(@Image) and starts-with(./XMLAttribute/@Name,'xml:id')">

	 
	<xsl:text>&#x000A;</xsl:text>
<xsl:element name="art">
<xsl:attribute name="artcap">
<xsl:value-of select="."/>
</xsl:attribute>

<xsl:attribute name="artid">
	 <xsl:value-of select="./XMLAttribute/@Value"/>
	 </xsl:attribute>
	 <xsl:if test="descendant::XMLElement[@MarkupTag='XMLTag/Image']">
	 <xsl:for-each select="descendant::XMLElement[@MarkupTag='XMLTag/Image']">
	 
	<xsl:attribute name="artlink">
	  <xsl:choose>
         <xsl:when test="./XMLAttribute[@Name='href']">

	 <xsl:value-of select="./XMLAttribute[@Name='href']/@Value"/>
	 </xsl:when>
	 </xsl:choose>
	 </xsl:attribute>
	 </xsl:for-each>
	 </xsl:if>
	</xsl:element>
</xsl:when>


<xsl:when test="not(@Image) and not(starts-with(./XMLAttribute/@Name,'xml:id'))">

	 
	<xsl:text>&#x000A;</xsl:text>
<xsl:element name="art">
<xsl:attribute name="artcap">
<xsl:value-of select="."/>
</xsl:attribute>

<xsl:attribute name="artid">
	 <xsl:value-of select="./XMLElement[@MarkupTag='XMLTag/links']/XMLAttribute/@Value"/>
	 </xsl:attribute>
	 <xsl:if test="descendant::XMLElement[@MarkupTag='XMLTag/Image']">
	 <xsl:for-each select="descendant::XMLElement[@MarkupTag='XMLTag/Image']">
	 
	<xsl:attribute name="artlink">
	  <xsl:choose>
         <xsl:when test="./XMLAttribute[@Name='href']">

	 <xsl:value-of select="./XMLAttribute[@Name='href']/@Value"/>
	 </xsl:when>
	 </xsl:choose>
	 </xsl:attribute>
	 </xsl:for-each>
	 </xsl:if>
	</xsl:element>
</xsl:when>
</xsl:choose>-->
<xsl:choose>
<xsl:when test="starts-with(./XMLAttribute/@Name,'xml:id')">

	 
	<xsl:text>&#x000A;</xsl:text>
<xsl:element name="art">
<xsl:attribute name="artcap">
<xsl:value-of select="."/>
</xsl:attribute>

<xsl:attribute name="artid">
	 <xsl:value-of select="./XMLAttribute/@Value"/>
	 </xsl:attribute>
	</xsl:element>
</xsl:when>
</xsl:choose>

    </xsl:template>
</xsl:stylesheet>