<?xml version="1.0" encoding="UTF-8"?>
<!-- 09-01-2024 below commented for content tag missing               -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf"
    exclude-result-prefixes="xs mf"
    xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas"
    xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
    xmlns:o="urn:schemas-microsoft-com:office:office"
    xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"
    xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math"
    xmlns:v="urn:schemas-microsoft-com:vml"
    xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing"
    xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing"
    xmlns:w10="urn:schemas-microsoft-com:office:word"
    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml"
    xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup"
    xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk"
    xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml"
    xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main"
    xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape"
    xmlns:idPkg="http://ns.adobe.com/AdobeInDesign/idml/1.0/packaging" version="2.0">
    
    <xsl:output method="xml" indent="no"/>
    <xsl:param name="allSpaceCharacterEntity"
        select="'&#8232;|&#x0020;|&#xa0;|&#x00A0;|&#xA;|&#x9;|&#x2028;|&#8194;|&#8195;|&#x00009;|&#x0000A;|&#x02002;|&#x02003;|&#x02004;|&#x02005;|&#x02007;|&#x02008;|&#x02009;|&#x0200A;|&#x0200B;|&#x0200C;|&#x0200D;|&#x0200E;|&#x0200F;|&#x0205F;|&#x02060;|&#x02061;|&#x02062;|&#x02063;|&#x000AD;|&#x000A0;|&#65279;|&#xfeff;|&#x202F;|&#x200c;|&#65533;'"/>
       
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="XMLElement">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="p">
        <xsl:choose>
            <xsl:when test="string-length(.) &gt; 0"> 
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:when>
        </xsl:choose>  
    </xsl:template>
    <xsl:template match="//ParagraphStyleRange | //CharacterStyleRange"> 
        <xsl:choose>    
            <xsl:when test="string-length(.) &gt; 0">                  
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:when>
        </xsl:choose> 
        
    </xsl:template>
    
    <xsl:template match="Content[string-length(.) &gt; 0]">        
        <xsl:choose>
            <xsl:when test="matches(self::Content,'^﻿')">
<!-- 09-01-2024 below commented for content tag missing               -->
<!--  <xsl:value-of select="replace(.,'﻿','')"/>-->
                <xsl:copy>
                    <xsl:copy-of select="@*"/>
                    <xsl:copy-of select="translate(.,'﻿','')"/>
                </xsl:copy>
            </xsl:when>
            <xsl:when test="matches(normalize-space(self::Content), '&#x200C;')">
                <!-- 09-01-2024 below commented for content tag missing               -->
<!--                <xsl:value-of select="translate(.,'&#x200C;','')"/>-->
                <xsl:copy>
                    <xsl:copy-of select="@*"/>
                    <xsl:copy-of select="translate(.,'﻿','')"/>
                </xsl:copy>
            </xsl:when>
            <xsl:when test="string-length(.) &gt; 0"> 
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:when>
        </xsl:choose>  
    </xsl:template>
         
    <!--20-01-2025 commented for when CharacterStyleRange containes empty Content but also another Content containes values within same CharacterStyleRange then removed hole CharacterStyleRange in client writeorder with book name FOREIGN TRADE POLICY OF INDIA with chapter Inroduction       -->
    <!--<xsl:template match="CharacterStyleRange[descendant::Content[not(string-length(translate(.,'&#x200C;','')) &gt; 0)]]"/>-->
    
    <xsl:template match="CharacterStyleRange[not(string-length(translate(descendant::*/.,'&#x200C;','')) &gt; 0)]"/>
    
    
<xsl:template match="p/span/descendant::Note"/>
<xsl:template match="ParagraphStyleRange//Note"/>    

    <xsl:template match="span[descendant::span] | i[descendant::i] | b[descendant::b] | u[descendant::u] | sup[descendant::sup] | sup[descendant::sup] | small[descendant::small] | sc[descendant::sc] | s[descendant::s]">
        <xsl:apply-templates/>
</xsl:template>
        
    
</xsl:stylesheet>