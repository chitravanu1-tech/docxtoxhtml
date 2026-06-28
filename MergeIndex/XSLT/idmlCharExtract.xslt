<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:preserve-space elements="Content"/>
    
    <xsl:template match="/">
        <xsl:apply-templates select="ParagraphStyleRange"/>
    </xsl:template>
    
    <xsl:template match="ParagraphStyleRange">
        <!--<xsl:copy>-->
        <xsl:apply-templates select="descendant::CharacterStyleRange[@WordNumber]"/>
        <!--</xsl:copy>-->
    </xsl:template>
    
    <xsl:template match="CharacterStyleRange[@WordNumber]">
        <xsl:choose>
            <xsl:when test="@WordNumber = 'diff'"/>
            <xsl:otherwise>
                <!--<xsl:element name="CharacterStyleRange">
                    <xsl:copy-of select="@WordNumber"/>
                </xsl:element>-->
                <xsl:value-of select="concat(@WordNumber,' ')"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    

    
    
    <xsl:template match="Change[@ChangeType ='InsertedText']|Note|Footnote"/>
    <xsl:template match="Properties"/>
</xsl:stylesheet>