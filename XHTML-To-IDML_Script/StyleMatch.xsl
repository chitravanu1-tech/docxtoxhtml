<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" xmlns:idPkg="http://ns.adobe.com/AdobeInDesign/idml/1.0/packaging"
    version="2.0">
    
    <xsl:variable name="Styles" select="document('Converted_Story/Styles2.xml')"/>
    
    <xsl:output method="xml" encoding="utf-8" indent="yes"/>
 
    <xsl:variable name="IDs1" select="/Styles/ParagraphStyleRange/@AppliedParagraphStyle" />
    <xsl:variable name="IDs3" select="/Styles/CharacterStyleRange/@AppliedCharacterStyle" />
    <xsl:variable name="IDs2" select="$Styles/Styles/ParagraphStyle/@AppliedParagraphStyle" />
    <xsl:variable name="IDs4" select="$Styles/Styles/CharacterStyle/@AppliedCharacterStyle" />
    
    <xsl:template match="/Styles">
	

        <result>
            <data1 desc="only in file1(Word Styles)">
			
                <xsl:apply-templates select="ParagraphStyleRange[not(@AppliedParagraphStyle=$IDs2)]"/>
                <xsl:apply-templates select="CharacterStyleRange[not(@AppliedCharacterStyle=$IDs4)]"/>
			
            </data1>
           <!-- <data2 desc="only in file2(Template Styles)">
		
                <xsl:apply-templates select="$Styles/Styles/ParagraphStyle[not(@AppliedParagraphStyle=$IDs1)]"/>
                <xsl:apply-templates select="$Styles/Styles/CharacterStyle[not(@AppliedCharacterStyle=$IDs3)]"/>
            </data2>
            <data3 desc="in both files">
                <xsl:apply-templates select="ParagraphStyleRange[@AppliedParagraphStyle=$IDs2]"/>
                <xsl:apply-templates select="CharacterStyleRange[@AppliedCharacterStyle=$IDs4]"/>
            </data3>-->
        </result>
    </xsl:template>
    
    <xsl:template match="ParagraphStyleRange">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="CharacterStyleRange">
        <xsl:copy-of select="."/>
    </xsl:template>
        <xsl:template match="ParagraphStyle">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="CharacterStyle">
        <xsl:copy-of select="."/>
    </xsl:template>
</xsl:stylesheet>