<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf" exclude-result-prefixes="xs mf" 
    xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
    xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"
    xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" xmlns:v="urn:schemas-microsoft-com:vml"
    xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing" xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" 
    xmlns:w10="urn:schemas-microsoft-com:office:word" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml" xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup" 
    xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk" xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml"
    xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" 
    xmlns:a14="http://schemas.microsoft.com/office/drawing/2010/main" 
    xmlns:pic="http://schemas.openxmlformats.org/drawingml/2006/picture" 
    xmlns:idPkg="http://ns.adobe.com/AdobeInDesign/idml/1.0/packaging"
    xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape" 
    xmlns:num="http://whatever"
    version="2.0">
    <xsl:output method="xml" indent="no"/>
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="//a[contains(@href,'xhtml#cha-')]/@href">
        <xsl:variable name="hrefid"><xsl:value-of select="substring-after(.,'.xhtml#')"/></xsl:variable>
        <xsl:variable name="fileNa">
        <!--<xsl:if test="following::*[@id =$hrefid]">
            <xsl:value-of select="following::*[@id =$hrefid][1]/child::span[@data-bkmark][1]/substring-before(substring-after(@data-bkmark,'_p_'),'_txtid_')"/>
        </xsl:if>-->
            <xsl:choose>
                
                <xsl:when test="following::*[@id =$hrefid]">
                    <xsl:value-of select="following::*[@id =$hrefid][1]/child::span[@data-bkmark][1]/substring-before(substring-after(@data-bkmark,'_p_'),'_txtid_')"/>
                </xsl:when>
                <xsl:when test="parent::*[@id =$hrefid]">
                    <xsl:value-of select="parent::*[@id =$hrefid][1]/child::span[@data-bkmark][1]/substring-before(substring-after(@data-bkmark,'_p_'),'_txtid_')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="preceding::*[@id =$hrefid][1]/child::span[@data-bkmark][1]/substring-before(substring-after(@data-bkmark,'_p_'),'_txtid_')"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:message><xsl:value-of select="$fileNa"/></xsl:message>
        <xsl:attribute name="href">
            <xsl:value-of select="concat($fileNa,'.xhtml#')"/>
            <xsl:value-of select="substring-after(.,'#')"/>
        </xsl:attribute>
    </xsl:template>
    </xsl:stylesheet>