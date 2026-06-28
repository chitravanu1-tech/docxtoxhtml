<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="xml"/>
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="tr" priority="4">
        <!--<xsl:variable name="currentRow">
            <xsl:copy-of select="."/>
        </xsl:variable>
        <xsl:variable name="preRow">
            <xsl:copy-of select="preceding-sibling::tr[td[number(@rowspan) >= 1]]"/>
        </xsl:variable>-->
        <xsl:variable name="currentRowNumber" select="xs:integer(@rowNumber)"/>
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:for-each select="child::*">
                <xsl:choose>
                    <xsl:when test="name(.) = 'td'">
                        <xsl:variable name="curCellNumber" select="xs:integer(./@cellNumber)"/>
                        <xsl:variable name="copyAttribs">
                            <!--<xsl:for-each select="ancestor::tr[1]/preceding-sibling::tr/child::td[number(@rowspan) >= 1]">
                                <xsl:variable name="preRowNumber" select="number(parent::tr/@rowNumber)"/>
                                <xsl:variable name="diff" select="$currentRowNumber - $preRowNumber"/>
                                <xsl:variable name="rowSpanCalc">
<!-\-                                    <xsl:if test="number($diff) &lt;= number(@rowspan)">-\->
                                    <xsl:if test="number($diff) &lt; number(@rowspan)">
                                        <xsl:value-of select="'true'"/>
                                    </xsl:if>
                                </xsl:variable>
                                <xsl:if test="number(@cellNumber) &lt;= $curCellNumber">
                                    <xsl:if test="$rowSpanCalc = 'true'">
                                        <xsl:value-of select="'true'"/>
                                    </xsl:if>
                                </xsl:if>
                            </xsl:for-each>-->
                            <xsl:value-of select="boolean(ancestor::tr[1]/preceding-sibling::tr/child::td[number(@rowspan) >= 1][($currentRowNumber - number(parent::tr/@rowNumber)) &lt; number(@rowspan)][number(@cellNumber) &lt;= $curCellNumber])"/>
                        </xsl:variable>
                        <xsl:choose>
                            <xsl:when test="$copyAttribs = true()">
                                <xsl:copy>
                                    <xsl:apply-templates select="@*"/>
                                    <xsl:attribute name="cellId" select="$curCellNumber + 1"></xsl:attribute>
                                    <xsl:attribute name="cellNumber" select="$curCellNumber + 1"/>
                                    <xsl:apply-templates select="node()"/>
                                </xsl:copy>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:copy>
                                    <xsl:apply-templates select="@*"/>
                                    <xsl:apply-templates select="node()"/>
                                </xsl:copy>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:copy>
                            <xsl:apply-templates select="@* | node()"/>
                        </xsl:copy>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
            <xsl:for-each select="preceding-sibling::tr/td[number(@rowspan) >= 1]">
                <xsl:variable name="preCellNumber" select="xs:integer(@cellNumber)"/>
                <xsl:variable name="preRowNumber" select="xs:integer(ancestor::tr[1]/@rowNumber)"/>
                <xsl:variable name="diff" select="$currentRowNumber - $preRowNumber"/>
                <xsl:variable name="rowSpanCalc">
                    <!--<xsl:if test="number($diff) &lt;= number(@rowspan)">-->
                    <xsl:if test="number($diff) &lt; number(@rowspan)">
                        <xsl:value-of select="'true'"/>
                    </xsl:if>
                </xsl:variable>

                <xsl:variable name="createNew">
                    <xsl:choose>
                        <!-- <xsl:when test="$currentRow//child::td[@cellNumber = $preCellNumber]">
                            <xsl:value-of select="'false'"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:if test="$rowSpanCalc = 'true'">
                                <xsl:value-of select="'true'"/>
                            </xsl:if>
                        </xsl:otherwise>-->
                        <!--<xsl:when test="$currentRow//child::td[@cellNumber = $preCellNumber] and $rowSpanCalc = 'true'">-->
                        <xsl:when  test=" $rowSpanCalc = 'true'">
                            <xsl:value-of select="'true'"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:variable>

                <xsl:choose>
                    <xsl:when test="$createNew = 'false'"/>
                    <xsl:when test="$createNew = 'true'">
                        <xsl:variable name="add">
                            <xsl:call-template name="cellNumCalc">
                                <xsl:with-param name="currentRowNumber" select="$preRowNumber"/>
                                <xsl:with-param name="inc" select="1"/>
                                <xsl:with-param name="cellNumber" select="$preCellNumber"/>
                                <xsl:with-param name="addNo" select="1"></xsl:with-param>
                            </xsl:call-template>
                        </xsl:variable>
                        <xsl:element name="td">
                            <xsl:attribute name="added">
                                <xsl:value-of select="'yes'"/>
                            </xsl:attribute>
                            <xsl:attribute name="rowNumber" select="$preRowNumber"/>
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
                                            <!--<xsl:value-of select="."/>-->
                                            <xsl:value-of select="$preCellNumber + $add"/>
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

    <xsl:template name="cellNumCalc">
        <xsl:param name="addNo" as="xs:integer"/>
        <xsl:param name="cellNumber" as="xs:integer"/>
        <xsl:param name="inc" as="xs:integer"/>
        <xsl:param name="currentRowNumber" as="xs:integer"/>
        <xsl:variable name="addedCellNo" select="$addNo + $cellNumber"/>
        <xsl:choose>
            <xsl:when test="not(boolean(ancestor::tr[1]/preceding-sibling::tr/child::td[number(@rowspan) >= 1][($currentRowNumber - number(parent::tr/@rowNumber)) &lt; number(@rowspan)][number(@cellNumber) &lt;= $cellNumber])) and not(count(parent::tr/child::*[@cellNumber &lt;= $cellNumber]) &gt; $cellNumber)">
                <xsl:value-of select="0"/>               
            </xsl:when>
            <xsl:when test="not(boolean(ancestor::tr[1]/preceding-sibling::tr/child::td[number(@rowspan) >= 1][($currentRowNumber - number(parent::tr/@rowNumber)) &lt; number(@rowspan)][number(@cellNumber) = $addedCellNo]))">
                <xsl:value-of select="$addNo"/>               
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="cellNumCalc">
                    <xsl:with-param name="addNo" select="$addNo + $inc"/>
                    <xsl:with-param name="cellNumber" select="$cellNumber"/>
                    <xsl:with-param name="inc" select="$inc"/>
                    <xsl:with-param name="currentRowNumber" select="$currentRowNumber"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
