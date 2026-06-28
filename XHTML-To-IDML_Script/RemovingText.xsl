<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" xmlns:idPkg="http://ns.adobe.com/AdobeInDesign/idml/1.0/packaging"
    version="2.0">

<xsl:strip-space elements="*"/>
    

    <xsl:template match="STORIES">
        <xsl:element name="Styles">
        <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="idPkg:Styles|idPkg:BackingStory">
        <xsl:element name="Styles">
        <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    
    <xsl:template match="ParagraphStyle">
        <xsl:element name="ParagraphStyle">
            <xsl:attribute name="AppliedParagraphStyle" select="@Self"/>
        </xsl:element>
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="CharacterStyle">
        <xsl:element name="CharacterStyle">
            <xsl:attribute name="AppliedCharacterStyle" select="@Self"/>
        </xsl:element>
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="text()"/>
    
    <xsl:template match="ParagraphStyleRange">
        <xsl:element name="ParagraphStyleRange">
            <xsl:attribute name="AppliedParagraphStyle" select="@AppliedParagraphStyle"/>
            
        </xsl:element>
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="CharacterStyleRange">
    
          
			<xsl:choose>
			<xsl:when test="contains(./@ManualChar,'@manual@ManualChar')">
		    <xsl:element name="CharacterStyleRange">
            <xsl:attribute name="AppliedCharacterStyle" select="@AppliedCharacterStyle"/>
            <xsl:attribute name="ManualChar" select="@AppliedCharacterStyle"/>
			 </xsl:element>
			</xsl:when>
			<xsl:when test="contains(./@ManualChar,'@manual@StyleManualChar')">
		    <xsl:element name="CharacterStyleRange">
            <xsl:attribute name="AppliedCharacterStyle" select="@AppliedCharacterStyle"/>
            <xsl:attribute name="StyleManualChar" select="@AppliedCharacterStyle"/>
			 </xsl:element>
			</xsl:when>
			<xsl:otherwise>
			 <xsl:element name="CharacterStyleRange">
            <xsl:attribute name="AppliedCharacterStyle" select="@AppliedCharacterStyle"/>
			 </xsl:element>
			</xsl:otherwise>
			</xsl:choose>
			
       
        <xsl:apply-templates/>
    </xsl:template>
    
</xsl:stylesheet>