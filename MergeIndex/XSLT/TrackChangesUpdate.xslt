<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" version="2.0">
    
    <xsl:output indent="no" method="xml"/>
    
    <xsl:preserve-space elements="span"/>
    <xsl:preserve-space elements="p"/>
    <xsl:preserve-space elements="h1"/>
    <xsl:preserve-space elements="h2"/>
    <xsl:preserve-space elements="h3"/>
    <xsl:preserve-space elements="h4"/>
    <xsl:preserve-space elements="h5"/>
    <xsl:preserve-space elements="h6"/>
    <xsl:preserve-space elements="li"/>
    <xsl:preserve-space elements="title"/>
    <xsl:strip-space elements="td"/>
    <xsl:strip-space elements="tr"/>
    <xsl:strip-space elements="table"/>
    <xsl:strip-space elements="tbody"/>
    <xsl:strip-space elements="ol"/>
    <xsl:strip-space elements="head"/>
    <xsl:strip-space elements="ul"/>
    <xsl:strip-space elements="body"/>
    <xsl:strip-space elements="commentreference"/>
    <xsl:strip-space elements="comment"/>
    
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="diffreport">
        <html>
            <xsl:apply-templates/>
        </html>
    </xsl:template>
    
    <xsl:template match="*[@data-bkmark]">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <span>
                <xsl:attribute name="data-bkmark" select="./@data-bkmark"/>
            </span>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="css"></xsl:template>
    
    <xsl:template match="diff">
        <body>
            <xsl:apply-templates/>
        </body>
    </xsl:template>
    
    <xsl:template match="span[starts-with(@id,'removed-diff') or starts-with(@changeId,'removed-diff')]">
        <del>
            <xsl:apply-templates/>    
        </del>
    </xsl:template>
    
    <xsl:template match="span[starts-with(@id,'added-diff') or starts-with(@changeId,'added-diff')]">
        <ins>
            <xsl:apply-templates/>
        </ins>
    </xsl:template>
    
</xsl:stylesheet>
