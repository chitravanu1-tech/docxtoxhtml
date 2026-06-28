<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:preserve-space elements="Content"/>
    <xsl:param name="proceesingBkmark"/>
    
    <xsl:template match="/">
        <xsl:apply-templates select="ParagraphStyleRange"/>
    </xsl:template>
    
    <xsl:template match="body">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="ParagraphStyleRange">
        <xsl:variable name="parentPara" select="self::ParagraphStyleRange/@ParaNumber"/>
        <xsl:if test="string-length($proceesingBkmark) > 0">
            <xsl:if test="($proceesingBkmark = $parentPara)">
                <xsl:apply-templates/>
            </xsl:if>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="CharacterStyleRange">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="Content">
        <xsl:apply-templates/>
    </xsl:template>
    
    
    <xsl:template match="Change[@ChangeType ='InsertedText']|Note|Footnote"/>
    <xsl:template match="Properties"/>
</xsl:stylesheet>