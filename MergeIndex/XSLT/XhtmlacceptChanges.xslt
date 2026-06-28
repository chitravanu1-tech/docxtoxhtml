<?xml version="1.0" encoding="UTF-8"?>
 <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xhtml="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs" 
    version="2.0">
    
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
    <xsl:strip-space elements="tbody"/>
    <xsl:strip-space elements="ol"/>
    <xsl:strip-space elements="head"/>
    <xsl:strip-space elements="ul"/>
    <xsl:strip-space elements="body"/>
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="xhtml:ins">
        <xsl:apply-templates/>
    </xsl:template>
    
     <xsl:template match="@*[not((name(.)='data-name')) and not((name(.)='data-bkmark')) and (starts-with(name(.),'data-'))]"/>
    
    <!--<xsl:template match="xhtml:del|xhtml:span[@data-bkmark]|@*[starts-with(name(.),'data-')][not(name(.)='data-name') or not(name(.)='data-bkmarkbkmark')]"/>-->
    <xsl:template match="xhtml:del"/>
    
    
</xsl:stylesheet>