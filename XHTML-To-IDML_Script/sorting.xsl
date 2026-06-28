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
   <!-- <xsl:template match="td">
        <xsl:apply-templates>
            <xsl:sort select="cellNumber" order="descending" data-type="number" />
        </xsl:apply-templates>
    </xsl:template>-->
    <xsl:template match="tr">
        
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="td">
                <xsl:sort select="@cellNumber"/>
            </xsl:apply-templates>
            
        </xsl:copy>
        
    </xsl:template>

    <!--For index Purpose 14.02.2017-->
    <xsl:template match="span[matches(@style,'font-family')]">
        <xsl:apply-templates/>
    </xsl:template>

</xsl:stylesheet>