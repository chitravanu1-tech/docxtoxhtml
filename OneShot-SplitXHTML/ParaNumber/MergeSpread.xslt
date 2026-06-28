<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf" exclude-result-prefixes="xs mf" 
    xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
    xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"
    xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" xmlns:v="urn:schemas-microsoft-com:vml"
    xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing" xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" 
    xmlns:w10="urn:schemas-microsoft-com:office:word" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml" xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup" 
    xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk" xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml"
    xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape" version="2.0">
    
    <!-- 14-dec-17: comented by RTP -->
    
    <!--<xsl:strip-space elements="*"/>-->
    <xsl:preserve-space elements="*"/>
    
   
    <xsl:output method="xml" name="xml" standalone="yes" indent="yes"/>
    

    <xsl:preserve-space elements="Content"/>
    
    <xsl:template match="/">  
        <xsl:element name="document">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
 
 <xsl:template match="@*|node()">
     <xsl:copy>
         <xsl:apply-templates select="@*|node()"/>
     </xsl:copy>
 </xsl:template>
    
   <!-- <xsl:template match="SOURCE">
        <xsl:apply-templates/>
    </xsl:template>-->
    
    <xsl:template match="MAPS">
        <xsl:apply-templates/>
    </xsl:template>
    
    <!--<xsl:template match="SOURCE/MAPS/MAP">
        <xsl:variable name="M" select="."/>
        <xsl:variable name="filename" select="concat('output1/',$M)"/>
                <xsl:apply-templates select="document($M)//w:body/*"/>
    </xsl:template>
    
    
    <xsl:template match="w:body/*">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>-->
    
    <!-- removing the added div to place it in the word document   -->
    <!-- 14-dec-17: comented by RTP -->
    <!--<xsl:template match="//div">
        <xsl:apply-templates/>
    </xsl:template>-->
    <xsl:template match="//div[not(@class) and not(@data-type = 'textbox')]">        
        <xsl:apply-templates/>        
    </xsl:template>
    
    <xsl:template match="w:tc[child::*[last()]/name() != 'w:p']">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
            <xsl:element name="w:p"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="//shade">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="w:pPr[ancestor::shade[@libraryFillColor]]">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
            <xsl:element name="w:shd">
                <xsl:attribute name="w:val" select="'clear'"/>
                <xsl:attribute name="w:fill" select="ancestor::shade/@libraryFillColor"/>
            </xsl:element>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="//Group">
        <xsl:variable name="bookmark">
            <xsl:choose>
                <xsl:when test="descendant::w:bookmarkStart[contains(lower-case(@w:name),'story')][1]">
                    <xsl:value-of select="descendant::w:bookmarkStart[contains(lower-case(@w:name),'story')][1]/@w:name"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="id">
            <xsl:value-of select="1694958775 - position()"/>
        </xsl:variable>
        
        <xsl:variable name="Alias">
            <xsl:value-of select="'group'"/>
        </xsl:variable>
        
        <xsl:variable name="Tag">
            <xsl:value-of select="'group'"/>
        </xsl:variable>
        
        
        <!--<xsl:copy>
            <xsl:attribute name="w:rsidR" select="$bookmark"/>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>-->
        
        <xsl:element name="w:sdt">
            <xsl:attribute name="w:rsidR" select="$bookmark"/>
            <xsl:element name="w:sdtPr">
                <xsl:choose>
                    <xsl:when test="not(string-length($Alias) = 0)">
                        <xsl:element name="w:alias">
                            <xsl:attribute name="w:val" select="$Alias"/>
                        </xsl:element>
                    </xsl:when>
                </xsl:choose>
                <xsl:choose>
                    <xsl:when test="not(string-length($Tag) = 0)">
                        <xsl:element name="w:tag">
                            <xsl:attribute name="w:val" select="$Tag"/>
                        </xsl:element>
                    </xsl:when>
                </xsl:choose>
                <xsl:element name="w:id">
                    <xsl:attribute name="w:val" select="$id"/>
                </xsl:element>
                <xsl:element name="w:placeholder">
                    <xsl:element name="w:docPart">
                        <xsl:attribute name="w:val" select="'DefaultPlaceholder_1081868574'"/>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
            <xsl:element name="w:sdtEndPr"/>
            <xsl:element name="w:sdtContent">
<!--                <xsl:copy>-->
                    <xsl:apply-templates select="@*|node()"/>
                <!--</xsl:copy>-->
            </xsl:element>
        </xsl:element>
    </xsl:template>
   
</xsl:stylesheet>