<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">

        <xsl:output indent="no" omit-xml-declaration="yes"/>
        <xsl:template match="@*|node()">
            <xsl:copy>
                <xsl:apply-templates select="@*|node()"/>
            </xsl:copy>
        </xsl:template>
        <xsl:template match="text()">
            <xsl:value-of select="normalize-space()" />
        </xsl:template>
    <xsl:template match="ParagraphStyleRange/CharacterStyleRange/Properties"/>
    <xsl:template match="Table/Cell/Properties"/>
    <!--<xsl:template match="PageReference[@ReferencedTopic = preceding-sibling::*[1][self::PageReference]/@ReferencedTopic]"/>-->
</xsl:stylesheet>