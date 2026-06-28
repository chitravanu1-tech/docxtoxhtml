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
    <xsl:template match="td">
        <xsl:variable name="currcellnum" select="@cellNumber"/>
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:if test="preceding-sibling::td/@NewADD">
                <xsl:attribute name="cellNumber">
                    <xsl:value-of select="@cellNumber + 1"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
<!--    <xsl:template match="td">
        <xsl:variable name="currcellnum" select="@cellNumber"/>
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:if test="preceding::td/@NewADD">
                <xsl:attribute name="cellNumber">
                    <xsl:value-of select="@cellNumber + 1"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>-->
    <!--            <xsl:variable name="currcellnum" select="@cellNumber"/>
            <xsl:variable name="tdpos" select="@tdposition"/>
            <xsl:variable name="prevcellnum" select="preceding::td[1]/@cellNumber"/>
            <xsl:variable name="diff" select="$prevcellnum - $tdpos"/>

<!-\-                <xsl:if test="$currcellnum = $prevcellnum">
                    <xsl:attribute name="cellNumber">
                        <xsl:value-of select="$prevcellnum + 1"/>
                    </xsl:attribute>
                </xsl:if>-\->-->
</xsl:stylesheet>



