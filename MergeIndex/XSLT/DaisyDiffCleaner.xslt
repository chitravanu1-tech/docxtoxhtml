<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:strip-space elements="*"/>
    <xsl:preserve-space elements="Content"/>
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="@WordNumber"/>
    
    <!-- important for daisy diff output   -->
    <xsl:template match="Change[@ChangeType = 'InsertedText'][@data-daisyMarker = 'true']">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="Change[@ChangeType = 'DeletedText'][@data-daisyMarker = 'true']"/>    
    <!-- important for daisy diff output   -->
</xsl:stylesheet>