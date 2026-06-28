<?xml version="1.0" encoding="UTF-8"?>
<!--New Update tdCount{17.02.2017}-->
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
    <!--New Update tdCount{17.02.2017}-->
    <xsl:template match="table">
        <xsl:copy>
            <xsl:attribute name="maxtd" select="./max(tr/@tdcount)"/>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="td">
        <xsl:variable name="currentRow">
            <xsl:copy-of select="."/>    
        </xsl:variable>
        <xsl:variable name="preRow">
            <xsl:copy-of select="ancestor::tr[1]/preceding-sibling::tr[td/@rowspan &gt; 1]"/>
        </xsl:variable>
        <xsl:variable name="currentRowNumber" select="ancestor::tr[1]/@rowNumber"/>
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:for-each select="ancestor::tr[1]/preceding-sibling::tr/td[@rowspan &gt;= 1]">

		<xsl:variable name="preCellNumber" select="@cellNumber"/>
                <xsl:variable name="preRowNumber" select="ancestor::tr[1]/@rowNumber"/>
                <xsl:variable name="diff" select="$currentRowNumber - $preRowNumber"/>
                <xsl:variable name="rowSpanCalc">
                    <xsl:if test="number($diff) &lt;= number(@rowspan)">
                        <xsl:value-of select="'true'"/>
                    </xsl:if>
                </xsl:variable>
               
                <xsl:variable name="createNew">
                    <xsl:choose>
                        <xsl:when test="$currentRow//child::td[@cellNumber = $preCellNumber]">
                            <xsl:value-of select="'false'"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:if test="$rowSpanCalc = 'true'">
                                <xsl:value-of select="'true'"/>
                            </xsl:if>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:choose>
                    <xsl:when test="$createNew = 'false' and $rowSpanCalc = 'true'">
		       <xsl:attribute name="cellNumber">
                            <xsl:value-of select="$preCellNumber + 1"/>
		       </xsl:attribute>
                       <xsl:attribute name="NewADD">
                            <xsl:value-of select="'YES'"/>
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="$createNew = 'true'"/>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>

    
</xsl:stylesheet>