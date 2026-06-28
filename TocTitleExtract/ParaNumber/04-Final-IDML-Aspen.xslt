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
    version="2.0">
    
    
    
    <xsl:output method="xhtml" indent="no" use-character-maps="Ascii2Unicode"/>   
    
    <xsl:strip-space elements="*"/>
    <xsl:preserve-space elements="p span td div li *"/>
    
    
    <xsl:param name="myNameSpace" select="'http://www.w3.org/1999/xhtml'"/>
    
    <xsl:template match="@*|node()">        
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="*">        
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates></xsl:apply-templates>
        </xsl:element>
        
    </xsl:template>
    
    <xsl:variable name="filename" select="substring-before(tokenize(base-uri(.), '/')[last()],'.')"/>
    
    
    <xsl:template match="html">
        <xsl:text disable-output-escaping="yes">&lt;html xmlns="http://www.w3.org/1999/xhtml"&gt;</xsl:text>
        <xsl:copy-of select="@*"/>
        <xsl:apply-templates/>
        <xsl:text>&#x000A;</xsl:text>
        <xsl:text disable-output-escaping="yes">&lt;/html&gt;</xsl:text>
    </xsl:template>
    
    
    
    <xsl:template match="p[child::p]">
        <xsl:apply-templates/>
    </xsl:template>
    
    
    <xsl:template match="@ColumnValue | @listtype | @numberFormat | @numberType"/>
    <xsl:template match="hp|FormattingChange"/>
    
    
    <!-- 28-sep-17: span inside span -->
    <xsl:template match="span[parent::span[not(@class)]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:copy-of select="parent::span/@*"/>
            <xsl:apply-templates/>
        </xsl:copy>               
    </xsl:template>
    
    
    <!-- For ASPEN Footnote LINK purposes -->
    <xsl:template match="span[@class = 'sup']">
        <xsl:choose>
            <xsl:when test="ancestor::p[@class = 'FootNoteTxt']">
                <xsl:element name="a">
                    <!-- <a href="out.xhtml#ft1" id="fref1"> -->
                    <xsl:attribute name="href">
                        <xsl:value-of select="concat($filename,'.xhtml#fref')"/>
                        <xsl:value-of select="translate(normalize-space(.),'.','_')"/>
                    </xsl:attribute>
                    <xsl:attribute name="id">
                        <xsl:value-of select="translate(concat('ft',normalize-space(.)),'.','_')"/>
                    </xsl:attribute>
                    <xsl:attribute name="style" select="'cursor:pointer'"/>
                    <xsl:copy>
                        <xsl:apply-templates select="@*|node()"/>
                    </xsl:copy>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="a">
                    <!-- <a href="out.xhtml#ft1" id="fref1"> -->
                    <xsl:attribute name="href">
                        <xsl:value-of select="concat($filename,'.xhtml#ft')"/>
                        <xsl:value-of select="translate(normalize-space(.),'.','_')"/>
                    </xsl:attribute>
                    <xsl:attribute name="id">
                        <xsl:value-of select="translate(concat('fref',normalize-space(.)),'.','_')"/>
                    </xsl:attribute>
                    <xsl:attribute name="style" select="'cursor:pointer'"/>
                    <xsl:copy>
                        <xsl:apply-templates select="@*|node()"/>
                    </xsl:copy>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    <xsl:character-map name="Ascii2Unicode">
        <xsl:output-character character=">" string=">"/>
        
    </xsl:character-map>
    <xsl:template match="text()">
        <xsl:analyze-string select="." regex="(&#8232;)|(­)|( )|( )|(&#x2028;)">
            <xsl:matching-substring>
                <xsl:if test="regex-group(1) or regex-group(5)">
                    <xsl:text disable-output-escaping="yes">&lt;br/&gt;</xsl:text>
                </xsl:if>
                <xsl:if test="regex-group(2)">
                    <xsl:text disable-output-escaping="yes">­</xsl:text>
                </xsl:if>               
                
            </xsl:matching-substring>
            <xsl:non-matching-substring>
                <xsl:value-of select="."/>
            </xsl:non-matching-substring>
        </xsl:analyze-string>
    </xsl:template>

    <xsl:template match="span[child::p]">
        <xsl:apply-templates/>
    </xsl:template>
    <!-- <span data-alias="End" -->
    <xsl:template match="span[@data-alias = 'Start']"/>
    <xsl:template match="span[@data-alias = 'End']"/>

</xsl:stylesheet>