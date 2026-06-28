<?xml version="1.0" encoding="UTF-8"?>
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
    xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape"
    version="2.0">
    
    <xsl:template match="numbering">
        <w:numbering xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas"
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
            xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape"
            mc:Ignorable="w14 wp14">
            <!--<xsl:apply-templates select="abstractNum"/>-->
            <!--Added to resolve the list wrong order 29-09-2021-->
            <xsl:apply-templates select="numId"/>
        </w:numbering>
    </xsl:template>
    
    <!--<xsl:template match="abstractNum">
        <xsl:apply-templates select="child::ol|child::ul"/>
    </xsl:template>
    -->
    <xsl:template match="numId">
        <xsl:apply-templates mode="li"/>
        <xsl:apply-templates select="child::ol|child::ul" mode="numid"/>
    </xsl:template>
    
    <xsl:template match="ol[parent::numId]|ul[parent::numId]" mode="li">
        
        <!-- list start at value      -->
        <xsl:variable name="start">
            <xsl:choose>
                <xsl:when test="@start and string-length(@start) &gt; 0">
                    <xsl:value-of select="@start"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="'1'"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="BulletCharacter">
            <xsl:value-of select="'•'"/>
        </xsl:variable>        
        
        <xsl:variable name="lvl">
            <xsl:choose>
                <xsl:when test="@data-ilvl and string-length(@data-ilvl)">
                    <xsl:value-of select="@data-ilvl"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="'0'"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <!--  list level text     -->
        <xsl:variable name="lvlTxt">
            <xsl:choose>
                <xsl:when test="@data-lvlText and string-length(@data-lvlText)">
                    <xsl:value-of select="@data-lvlText"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:choose>
                        <xsl:when test="self::ul">
                            <xsl:value-of select="$BulletCharacter"/>
                        </xsl:when>
                        <xsl:when test="self::ol">
                            <!--<xsl:value-of select="'%1'"/>-->
                            <!--Added to resolve the list wrong order 29-09-2021-->
                            <xsl:choose>
                                <xsl:when test="self::ol[@data-lvltext]">
                                    <xsl:value-of select="@data-lvltext"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="'%1'"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                    </xsl:choose>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="NumberCharacter">
            <xsl:choose>
                <xsl:when test="@data-numFmt and string-length(@data-numFmt) &gt; 0">
                    <xsl:value-of select="@data-numFmt"/>
                </xsl:when>
                <xsl:when test="starts-with(@type,'1')">
                    <xsl:value-of select="'decimal'"/>
                </xsl:when>
                <xsl:when test="starts-with(@type,'A')">
                    <xsl:value-of select="'upperLetter'"/>
                </xsl:when>
                <xsl:when test="starts-with(@type,'a')">
                    <xsl:value-of select="'lowerLetter'"/>
                </xsl:when>
                <xsl:when test="starts-with(@type,'I')">
                    <xsl:value-of select="'upperRoman'"/>
                </xsl:when>
                <xsl:when test="starts-with(@type,'i')">
                    <xsl:value-of select="'lowerRoman'"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="'decimal'"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="styleId">
            <xsl:choose>
                <xsl:when test="@class">
                    <xsl:value-of select="@class"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="child::li[1]/@class"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="font">
            <xsl:if test="@data-bullfont">
                <xsl:value-of select="@data-bullfont"/>
            </xsl:if>
        </xsl:variable>
        
        <xsl:variable name="numFmt">
            <xsl:choose>
                <xsl:when test="self::ul">
                    <xsl:value-of select="'bullet'"/>
                </xsl:when>
<!--                <xsl:when test="starts-with(@type,'1') or starts-with(@type,'A') or starts-with(@type,'a') or starts-with(@type,'I') or starts-with(@type,'i')">-->
                <xsl:when test="self::ol">
                    <xsl:value-of select="$NumberCharacter"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
      
        <xsl:element name="w:abstractNum">
            <xsl:attribute name="w:abstractNumId" select="number(@listUID) - 1"/>
            
            <xsl:element name="w:multiLevelType">
                <xsl:attribute name="w:val" select="'hybridMultilevel'"/>
            </xsl:element>
            
                <xsl:element name="w:lvl">
                <xsl:attribute name="w:ilvl" select="$lvl"/>
                <xsl:element name="w:start">
                    <!--<xsl:attribute name=" w:val" select="'1'"/>-->
                    <xsl:attribute name=" w:val" select="$start"/>
                </xsl:element>     
                
                <xsl:element name="w:numFmt">
                    <!-- check this -->
                    <xsl:attribute name=" w:val" select="$numFmt"/>
                </xsl:element>
                
                <!--<xsl:if test="$NumberingLvl &gt; 0 and @BulletsAndNumberingListType ='NumberedList'">
                    <xsl:element name="w:lvlRestart">
                        <xsl:attribute name="w:val" select="$NumberingLvl - 1"/>
                        <!-\-<xsl:attribute name="w:val" select="''"/>-\->
                    </xsl:element>
                </xsl:if>-->
                
            <!-- commented this because all the list are linked with the same concept as manual override, not using styles               -->
                <!--<xsl:element name="w:pStyle">
                    <xsl:attribute name="w:val" select="$styleId"/>
                </xsl:element>-->
                
                <xsl:element name="w:lvlText">
                    <!-- check this -->
                    <xsl:attribute name=" w:val" select="$lvlTxt"/>
                </xsl:element>
                
                <!--@@ Justification Start @@ -->
                
                <xsl:element name="w:lvlJc">
                    <xsl:attribute name="w:val" select="'left'"/>
                </xsl:element>
                <!--@@ Justification End @@ -->
                
                <xsl:element name="w:pPr">
                    
                  
                    
                </xsl:element>
                <xsl:element name="w:rPr">
                    <xsl:element name="w:rFonts">
                        <xsl:attribute name="w:ascii" select="$font"/>
                        <xsl:attribute name="w:hAnsi" select="$font"/>
                        <xsl:attribute name="w:hint" select="'default'"/>
                    </xsl:element>
                </xsl:element>
                
            </xsl:element>
            
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="ol|ul" mode="numid">
        <xsl:variable name="listID" select="@listUID"/>
        <xsl:variable name="class" select="@class"/>
        <xsl:variable name="type" select="@type"/>
        
        <xsl:variable name="abstractNumID">
            <xsl:choose>
                <xsl:when test="count(//abstractNum/ol[@class = $class]) > 1">
                    <xsl:value-of select="//abstractNum/ol[@class = $class][@type = $type][1]/@listUID"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="//abstractNum/ol[@class = $class]/@listUID"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="absNumId">
            <xsl:choose>
                <xsl:when test="string-length($abstractNumID) &gt; 0">
                    <xsl:value-of select="$abstractNumID"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="@listUID"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:element name="w:num">
            <xsl:attribute name="w:numId">
                <xsl:value-of select="number(@listUID)"/>
            </xsl:attribute>
            <xsl:element name="w:abstractNumId">
                <xsl:attribute name="w:val">
                    <!--<xsl:value-of select="number($absNumId) - 1"/>-->
                    <xsl:value-of select="number(@listUID)-1"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:if test="self::ol">
                <xsl:variable name="start" select="@start"/>
                <xsl:if test="string-length($start) &gt; 0">
                    <xsl:element name="w:lvlOverride">
                        <xsl:attribute name="w:ilvl" select="'0'"/>
                        <xsl:element name="w:startOverride">
                            <xsl:attribute name="w:val" select="$start"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:if>
            </xsl:if>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>