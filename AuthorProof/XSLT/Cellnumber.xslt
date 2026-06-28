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
    
    <xsl:template match="td[parent::tr/child::*[lower-case(@added) = 'yes']/number(@cellNumber) &lt;= number(@cellNumber)]">
        <xsl:variable name="rowNumber" select="@rowNumber"/>
        <xsl:variable name="curCellNumber" select="@cellNumber"/>
        <xsl:variable name="addedCellNo" select="parent::tr/child::*[lower-case(@added) = 'yes']/@cellNumber"/>
        <xsl:variable name="addedCellNoCount" select="count(parent::tr/child::*[@cellNumber = $addedCellNo])"/>
        <!--<xsl:variable name="add" select="count(parent::tr/child::*[lower-case(@added) = 'yes'][number(@cellNumber) &lt;= number($curCellNumber)])"/>-->
        <xsl:variable name="add">
            <xsl:call-template name="cellNumCalc">
                <!--<xsl:with-param name="addNo" select="count(parent::tr/child::*[lower-case(@added) = 'yes'][number(@cellNumber) &lt;= number($curCellNumber)])"/>-->
                <xsl:with-param name="addNo" select="1"/>
                <xsl:with-param name="cellNumber" select="$curCellNumber"/>
                <xsl:with-param name="inc" select="1"/>
            </xsl:call-template>
        </xsl:variable>
        
        <xsl:variable name="cellNumber">           
            <xsl:choose>
                <xsl:when test="$addedCellNoCount = 1">
                    <xsl:value-of select="$curCellNumber"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:choose>
                        <xsl:when test="lower-case(@added) = 'yes'">
                            <xsl:value-of select="parent::tr/preceding-sibling::tr[@rowNumber = $rowNumber]/child::td[@cellId = $curCellNumber]/@cellNumber"/>
                        </xsl:when>
                       <!-- <xsl:when test="self::td[parent::tr/child::*[lower-case(@added) = 'yes']/@cellNumber = $curCellNumber][not(lower-case(@added) = 'yes')]">
                            <xsl:variable name="addCellRowNo" select="parent::tr/child::*[lower-case(@added) = 'yes' and @cellNumber = $curCellNumber]/@rowNumber"/>
                            <xsl:variable name="addCellRowNoCellNo" select="max(parent::tr/preceding-sibling::tr[@rowNumber = $addCellRowNo]/child::td[@cellId = $curCellNumber]/@cellNumber)"/>
                            <xsl:choose>
                                <xsl:when test="number($addCellRowNoCellNo) &gt; number($curCellNumber)">
                                    <xsl:choose>
                                        <xsl:when test="count($addCellRowNo) > 1">
                                            <!-\-<xsl:value-of select="number($addCellRowNoCellNo) + 1"/>-\->
                                            <xsl:variable name="curCellVal">
                                                <xsl:call-template name="cellNumCalc">
                                                    <xsl:with-param name="addNo" select="count(parent::tr/child::*[lower-case(@added) = 'yes'][number(@cellNumber) &lt;= number($addCellRowNoCellNo)])"/>
                                                    <xsl:with-param name="cellNumber" select="xs:integer(number($addCellRowNoCellNo))"/>
                                                    <xsl:with-param name="inc" select="1"/>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:value-of select="$curCellVal + (count($addCellRowNo) - 1)"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="$curCellNumber"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="number(@cellNumber) + $add"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>-->
                        <xsl:otherwise>
                            <xsl:value-of select="number(@cellNumber) + $add"/>    
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:attribute name="cellNumber" select="$cellNumber"/>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>
 
    <xsl:template match="tr">       
        <xsl:variable name="tdcolspan" select="count(td/@colspan)"/>
        <xsl:variable name="tdcolspan1" select="sum(child::td/@colspan)"/>
        <xsl:variable name="tdcount" select="count(child::td)"/>
        <xsl:copy>
            <xsl:attribute name="tdcount">
                <xsl:value-of select="($tdcount + $tdcolspan1) - $tdcolspan"/>
            </xsl:attribute>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
   
    <xsl:template name="cellNumCalc">
        <xsl:param name="addNo" as="xs:integer"/>
        <xsl:param name="cellNumber" as="xs:integer"/>
        <xsl:param name="inc" as="xs:integer"/>
       <xsl:variable name="addedCellNo" select="$addNo + $cellNumber"/>
        <xsl:choose>
        <!-- added this new condition for specific case where there are no other newly added cells in the current row with the current cell number.           -->
            <xsl:when test="not(parent::tr/child::*[lower-case(@added) = 'yes'][number(@cellNumber) = $cellNumber]) and not(count(parent::tr/child::*[@cellNumber &lt;= $cellNumber]) &gt; $cellNumber)">
<!--            <xsl:when test="not(parent::tr/child::*[lower-case(@added) = 'yes'][number(@cellNumber) = $cellNumber])">-->
                <xsl:value-of select="0"/>               
            </xsl:when>
            <xsl:when test="not(parent::tr/child::*[lower-case(@added) = 'yes'][number(@cellNumber) = $addedCellNo])">
                <xsl:value-of select="$addNo"/>               
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="cellNumCalc">
                    <xsl:with-param name="addNo" select="$addNo + $inc"/>
                    <xsl:with-param name="cellNumber" select="$cellNumber"/>
                    <xsl:with-param name="inc" select="$inc"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>