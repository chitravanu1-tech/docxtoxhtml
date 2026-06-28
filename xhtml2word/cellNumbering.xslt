<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf" exclude-result-prefixes="xs mf xhtml" 
    xmlns:xhtml="http://www.w3.org/1999/xhtml">
    
    <xsl:strip-space elements="*"/>
    
    <xsl:output method="xml"></xsl:output>
    <xsl:preserve-space elements="*"/>
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
     </xsl:template>

    <xsl:template match="style">
        <xsl:result-document href="design.css" omit-xml-declaration="yes">
            <xsl:apply-templates select="comment()" mode="style"/>
            <xsl:if test="not(child::comment())">
<!--                <xsl:copy>-->
                    <xsl:apply-templates/>
                <!--</xsl:copy>-->
            </xsl:if>
        </xsl:result-document>
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    
    
    <!--    removing the styles part from the document-->
    <xsl:template match="//comment()"/>
    
    <xsl:template match="comment()" mode="style">
            <xsl:value-of select="."/>
    </xsl:template>
    
    <xsl:template match="td">
        <xsl:copy>
            <xsl:attribute name="cellNumber">
                <xsl:number level="single"/>
            </xsl:attribute>
            <xsl:if test="@rowspan &gt; 1">
                <xsl:attribute name="vMerge" select="'restart'"/>
            </xsl:if>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="tr">
        <xsl:copy>
            <xsl:attribute name="rowNumber">
                <xsl:number level="single"/>
            </xsl:attribute>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ol">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:attribute name="listUID">
                <xsl:number level="any"/>
            </xsl:attribute>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="span[@data-bkmark]">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:attribute name="bkmarkID">
                <xsl:number level="any"/>
            </xsl:attribute>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ul">
        <xsl:variable name="num">
            <xsl:number level="any"/>
        </xsl:variable>
        <xsl:variable name="olCount" select="count(ancestor::body//ol)"/>
        <xsl:variable name="listUid" select="$num + $olCount"/>
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:attribute name="listUID">
             <xsl:value-of select="$listUid"/>
            </xsl:attribute>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="*[@data-commentvalue]">
        <xsl:variable name="id" select="@data-commentvalue"/>
        <xsl:variable name="cmtId" select="boolean(preceding::*[@data-commentimg = $id][not(ancestor-or-self::*[@data-change='commentdeleted'])])"/>
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:if test="$cmtId = true()">
            <xsl:attribute name="cmtIdVal" select="true()"></xsl:attribute>
            <xsl:attribute name="cmtId">
                <xsl:number level="any" count="*[@data-commentvalue]"></xsl:number>
            </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>

    <!--removing the delete inside a insert tag    -->
   <!-- <xsl:template match="ins">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
        <xsl:apply-templates select="del" mode="del"/>
    </xsl:template>    -->
    
    <xsl:template match="del[ancestor::ins]"/>
    
  <!--  <xsl:template match="del[ancestor::ins]" mode="del">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>-->
    
   <!-- <xsl:template match="text()[contains(.,'&#x000A;')]|text()[contains(.,'&#x0A;')]|text()[contains(.,'&#10;')]|text()[contains(.,'&#13;')]|text()[contains(.,'&#xA;')]"/>
   
    <xsl:template match="text()">
        <xsl:analyze-string select="." regex="(\n)|(.&#x000A;)|(&#x0A;)|(&#10;)|(&#13;)|(&#xA;)">
            <xsl:matching-substring>
                <xsl:value-of select="''" xml:space="preserve"/>
            </xsl:matching-substring>
            <xsl:non-matching-substring>
                <xsl:value-of select="." xml:space="preserve"/>
            </xsl:non-matching-substring>
        </xsl:analyze-string>
    </xsl:template>-->
    
</xsl:stylesheet>