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
    <xsl:template match="tr">
        <xsl:variable name="currentRow">
            <xsl:copy-of select="."/>    
        </xsl:variable>
        <xsl:variable name="preRow">
            <xsl:copy-of select="preceding-sibling::tr[td/@rowspan &gt;= 1]"/>
        </xsl:variable>
        <xsl:variable name="currentRowNumber" select="@rowNumber"/>
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:for-each select="child::*">
                <xsl:choose>
                    <xsl:when test="name(.) ='td'">
                        <xsl:variable name="copyAttribs">
                            <xsl:variable name="curCellNumber" select="./@cellNumber"/>
                                <xsl:for-each select="$preRow//child::td">
                                <xsl:variable name="preRowNumber" select="parent::tr/@rowNumber"/>
                                <xsl:variable name="diff" select="$currentRowNumber - $preRowNumber"/>
                                <xsl:variable name="rowSpanCalc">
                                    <xsl:if test="number($diff) &lt;= number(@rowspan)">
                                        <xsl:value-of select="'true'"/>
                                    </xsl:if>
                                </xsl:variable>
                               <xsl:if test="@cellNumber = $curCellNumber">
                                    <xsl:if test="$rowSpanCalc = 'true'">
                                        <xsl:value-of select="'true'"/>
                                    </xsl:if>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:variable>
                        <xsl:choose>
                            <xsl:when test="$copyAttribs = 'true'">
                                <xsl:copy>
                                    <xsl:apply-templates select="@*"/>
                                    <xsl:for-each select="$preRow//child::td[@cellNumber]/@*">
                                        <xsl:variable name="preRowNumber" select="ancestor::tr[1]/@rowNumber"/>
                                        <xsl:variable name="diff" select="$currentRowNumber - $preRowNumber"/>
                                        <xsl:choose>
                                            <xsl:when test="name(.) = 'rowspan'">
                                                <xsl:attribute name="{name(.)}">
                                                    <xsl:value-of select="number(.) - number($diff)"/>
                                                </xsl:attribute>
                                            </xsl:when>
                                            <xsl:when test="name(.) = 'vMerge'">
                                                <xsl:attribute name="{name(.)}">
                                                    <xsl:value-of select="'continue'"/>
                                                </xsl:attribute>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:copy-of select="."/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:for-each>
                                    <xsl:apply-templates select="node()"/>
                                </xsl:copy>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:copy>
                                    <xsl:apply-templates select="@*|node()"/>
                                </xsl:copy>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:copy>
                            <xsl:apply-templates select="@*|node()"/>
                        </xsl:copy>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
            <xsl:for-each select="preceding-sibling::tr/td[@rowspan &gt;= 1]">
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
                    <xsl:when test="$createNew = 'false'"/>
                    <xsl:when test="$createNew = 'true'">
                        <xsl:element name="td">
                            <xsl:attribute name="added">
                                <xsl:value-of select="'yes'"/>
                            </xsl:attribute>
                            <xsl:for-each select="@*">
                                <xsl:choose>
                                    <xsl:when test="name(.) = 'rowspan'">
                                        <xsl:attribute name="{name(.)}">
                                            <!--<xsl:value-of select="number(.) - 1"/>-->
                                            <xsl:value-of select="number(.) - $diff"/>
                                        </xsl:attribute>
                                    </xsl:when>
                                    <xsl:when test="name(.) = 'colspan'">
                                        <xsl:attribute name="{name(.)}">
                                            <xsl:value-of select="."/>
                                        </xsl:attribute>
                                    </xsl:when>
                                    <xsl:when test="name(.) = 'cellNumber'">
                                        <xsl:attribute name="{name(.)}">
                                            <xsl:value-of select="."/>
                                        </xsl:attribute>
                                    </xsl:when>
                                    <!-- <xsl:otherwise>
                                        <xsl:copy-of select="."/>
                                    </xsl:otherwise>-->
                                </xsl:choose>
                            </xsl:for-each>
                            <xsl:attribute name="vMerge">
                                <xsl:value-of select="'continue'"/>
                            </xsl:attribute>
                            <xsl:element name="p"/>
                        </xsl:element>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
        </xsl:copy>
    </xsl:template>
    

</xsl:stylesheet>