<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf"
    exclude-result-prefixes="xs mf idPkg"
    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    xmlns:idPkg="http://schemas.openxmlformats.org/wordprocessingml/2006/main" version="2.0">

    <xsl:output method="xml" indent="yes" name="xml"/>
    
    <!-- 1-MAR-19: For Text frame adjust for dame textbox x and y -->
    
    
       
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="TextFrame[@txFrameX = parent::Measurement/descendant::TextFrame/@txFrameX][@txFrameY = parent::Measurement/descendant::TextFrame/@txFrameY]">
        <xsl:variable name="x" select="@txFrameX"/>
        <xsl:variable name="y" select="@txFrameY"/>
        <xsl:variable name="id" select="@id"/>
        <xsl:variable name="height" select="number(@height)"/>
        <xsl:variable name="width" select="number(@width)"/>
        <xsl:variable name="sameTxtFrmXY" select="parent::Measurement/descendant::TextFrame[@txFrameX = $x and @txFrameY = $y][not(@id= $id)]"/>
        <xsl:variable name="sameTxtFrmheightDiff" select="count($sameTxtFrmXY[number(@height) &lt; $height])"/>
        <xsl:variable name="sameTxtFrmWidthDiff" select="count($sameTxtFrmXY[number(@width) &lt; $width])"/>
        <xsl:message>y=<xsl:value-of select="$y"/>::<xsl:value-of select="$sameTxtFrmheightDiff"/></xsl:message>
        
        <xsl:choose>
            <xsl:when test="$sameTxtFrmXY">
                <xsl:choose>
                    <xsl:when test="$sameTxtFrmheightDiff > 0">
                        <xsl:copy>
                            <xsl:apply-templates select="@*"/>
                            <xsl:attribute name="txFrameY" select="number($y) + $sameTxtFrmheightDiff"/>
                            <xsl:apply-templates select="node()"/>
                        </xsl:copy>
                    </xsl:when>
                    <xsl:when test="$sameTxtFrmWidthDiff > 0">
                        <xsl:copy>
                            <xsl:apply-templates select="@*"/>
                            <xsl:attribute name="txFrameX" select="number($x) + $sameTxtFrmWidthDiff"/>
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
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
       
    </xsl:template>
    
    
</xsl:stylesheet>