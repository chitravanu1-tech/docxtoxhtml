<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output omit-xml-declaration="yes"/>
    
    <xsl:template match="/">
        <xsl:apply-templates select="//h1|//h2|//h3|//h4|//h5|//h6|//p|//li"/>
    </xsl:template>
    
    <xsl:template match="h1|h2|h3|h4|h5|h6|p|li">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="text()[ancestor::Ins|ancestor::ins]"/>
    <xsl:template match="text()">
        <xsl:value-of select="."/>
    </xsl:template>
</xsl:stylesheet>