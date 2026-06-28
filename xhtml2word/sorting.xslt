<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="xml"/>
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="tr" priority="3">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="td">
                <!--14-08-2024 commented by prakash s for A1(PONE-D-24-29802A) files table coloum interchanged  -->
<!--                <xsl:sort select="@cellNumber"/>-->
                <xsl:sort select="number(@cellNumber)" data-type="number" order="ascending"/>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="table">
        <xsl:copy>
            <xsl:attribute name="maxtd" select="max(tr/@tdcount)"/>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>


</xsl:stylesheet>