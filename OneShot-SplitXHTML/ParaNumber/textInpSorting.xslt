<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf"
    exclude-result-prefixes="xs mf idPkg"
    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    xmlns:idPkg="http://schemas.openxmlformats.org/wordprocessingml/2006/main" version="2.0">

    <xsl:output method="xml" indent="yes" name="xml"/>
    
    <xsl:template match="/">  
        <xsl:element name="document">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="MAPS">
            <xsl:apply-templates select="//Measurement"/>
    </xsl:template>
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="Measurement|Group">
        <xsl:variable name="pageValue">
            <xsl:for-each select="//@pageNo">
                <xsl:value-of select="."/>
            </xsl:for-each>
        </xsl:variable>
        
        <!--06/02/2021 below comented by prakash s and panneer for ROWMAN LATTERS not sorted in "pageNo" for R&L file name(bookname:SHELBY [03 Introduction (1)]) -->
        <!--<xsl:choose>
            <xsl:when test="not(matches($pageValue,'^\d+$'))">
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>                    
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()">
                        <xsl:sort select="number(@pageNo)" data-type="number" order="ascending"/>
                        <xsl:sort select="number(@column)" data-type="number" order="ascending"/>
                        <xsl:sort select="number(@txFrameY)" data-type="number" order="ascending"/>
                        <xsl:sort select="number(@txFrameX)" data-type="number" order="ascending"/>
                    </xsl:apply-templates>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>-->
        
        <!--06/02/2021 below choose for ROWMAN LATTERS in pageNo to sorting from for R&L file name(bookname:SHELBY [03 Introduction (1)])  -->
        <xsl:choose>
            <xsl:when test="string-length($pageValue) &gt; 0">
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()">                        
                        <xsl:sort select="number(@pageNo_rowman_2_int)" data-type="number" order="ascending"/>
                        <xsl:sort select="number(@column)" data-type="number" order="ascending"/>
                        <xsl:sort select="number(@txFrameY)" data-type="number" order="ascending"/>
                        <xsl:sort select="number(@txFrameX)" data-type="number" order="ascending"/>
                    </xsl:apply-templates>
                </xsl:copy>                                  
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy> 
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>

</xsl:stylesheet>