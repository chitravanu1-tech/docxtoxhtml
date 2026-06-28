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
    xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main"
    xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape"
    xmlns:idPkg="http://ns.adobe.com/AdobeInDesign/idml/1.0/packaging" version="2.0">
    
    <xsl:output method="xml" indent="no" encoding="UTF-8"/>
    
    <xsl:strip-space elements="*"/>
    <xsl:preserve-space elements="Content"/>
    
    <xsl:param name="allSpaceCharacterEntity"
        select="'&#8232;|&#x0020;|&#xa0;|&#x00A0;|&#xA;|&#x9;|&#x2028;|&#8194;|&#8195;|&#x00009;|&#x0000A;|&#x02002;|&#x02003;|&#x02004;|&#x02005;|&#x02007;|&#x02008;|&#x02009;|&#x0200A;|&#x0200B;|&#x0200C;|&#x0200D;|&#x0200E;|&#x0200F;|&#x0205F;|&#x02060;|&#x02061;|&#x02062;|&#x02063;|&#x000AD;|&#x000A0;'"/>
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="document">
        <xsl:if test="descendant::ParagraphStyleRange[matches(@AppliedParagraphStyle , 'ParagraphStyle/TOC_')]">
            <xsl:result-document href="{'EPUB-XML_Linking_Toc_Info'}.xml">
            <xsl:text>&#x000A;</xsl:text>
            <xsl:element name="root">                
                <xsl:for-each select="descendant::ParagraphStyleRange[matches(@AppliedParagraphStyle , 'ParagraphStyle/TOC_')]">
                    <xsl:variable name="Stylename" select="self::ParagraphStyleRange[matches(@AppliedParagraphStyle , 'ParagraphStyle/TOC_')]/@AppliedParagraphStyle/substring-after(.,'ParagraphStyle/')"/>
                    <xsl:text>&#x000A;</xsl:text>
                    <xsl:text>   </xsl:text>
                    <xsl:element name="{$Stylename}">
                        <xsl:attribute name="originalStyle" select="@Client-Style"/>
                        <xsl:attribute name="PmStyle" select="self::ParagraphStyleRange[matches(@AppliedParagraphStyle , 'ParagraphStyle/TOC_')]/@AppliedParagraphStyle/substring-after(.,'ParagraphStyle/')"/>
                        <xsl:attribute name="BookMark">
                            <xsl:choose>
                                <xsl:when test="@ParaNumber">
                                    <xsl:value-of select="@ParaNumber"/>
                                </xsl:when>
                                <xsl:when test="@ParaInfo">
                                    <xsl:value-of select="@ParaInfo"/>
                                </xsl:when>
                                <xsl:when test="descendant::HyperlinkTextDestination/@BookMarkDestination">
                                    <xsl:value-of select="descendant::HyperlinkTextDestination/@BookMarkDestination"/>
                                </xsl:when>
                                <xsl:when test="descendant::HyperlinkTextDestination/@Name">
                                    <xsl:value-of select="descendant::HyperlinkTextDestination/@Name"/>
                                </xsl:when>
                                <xsl:when test="descendant::HyperlinkTextDestination/@Self">
                                    <xsl:value-of select="descendant::HyperlinkTextDestination/@Self/substring-after(.,'HyperlinkTextDestination/')"/>
                                </xsl:when>
                            </xsl:choose>
                        </xsl:attribute>
                        <xsl:attribute name="FileEntryId">
                            <xsl:variable name="FileEntryIdValue">
                                <xsl:choose>
                                    <xsl:when test="@ParaNumber">
                                        <xsl:value-of select="@ParaNumber"/>
                                    </xsl:when>
                                    <xsl:when test="@ParaInfo">
                                        <xsl:value-of select="@ParaInfo"/>
                                    </xsl:when>
                                    <xsl:when test="descendant::HyperlinkTextDestination/@BookMarkDestination">
                                        <xsl:value-of select="descendant::HyperlinkTextDestination/@BookMarkDestination"/>
                                    </xsl:when>
                                    <xsl:when test="descendant::HyperlinkTextDestination/@Name">
                                        <xsl:value-of select="descendant::HyperlinkTextDestination/@Name"/>
                                    </xsl:when>
                                    <xsl:when test="descendant::HyperlinkTextDestination/@Self">
                                        <xsl:value-of select="descendant::HyperlinkTextDestination/@Self/substring-after(.,'HyperlinkTextDestination/')"/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:value-of select="substring-before(substring-after($FileEntryIdValue,'_FEID_'),'_UUID_')"/>
                        </xsl:attribute>
                        <xsl:attribute name="TOCchapterName"/>
                        <xsl:attribute name="commanId"/> 
                        
                        <xsl:variable name="title">
                            <xsl:for-each select="descendant::CharacterStyleRange">
                                <xsl:choose>
                                    <xsl:when
                                        test="@AppliedCharacterStyle = 'CharacterStyle/WordStyles%3apageno' or matches(@AppliedCharacterStyle, 'pageno')"/>
                                    <xsl:when
                                        test="@AppliedCharacterStyle = 'CharacterStyle/pageno' or matches(@AppliedCharacterStyle, 'pageno')"/>
                                    <xsl:otherwise>
                                        <xsl:for-each select="descendant-or-self::Content">
                                            <xsl:if test="string-length(descendant-or-self::Content) &gt; 0">
                                                <xsl:value-of select="descendant-or-self::Content"/>
                                            </xsl:if>
                                        </xsl:for-each>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:for-each>
                        </xsl:variable>
                        
                        <xsl:variable name="val">
                            <xsl:value-of select="normalize-space(replace($title, $allSpaceCharacterEntity, ' '))"/>
                        </xsl:variable>
                        
                        <xsl:variable name="txt1">
                            <xsl:choose>
                                <xsl:when test="matches($val, '([ ])([0-9]?[0-9]?[0-9])$')">
                                    <xsl:value-of select="replace($val, '([ ])([0-9]?[0-9]?[0-9])$', '')"/>
                                </xsl:when>
                                <xsl:when test="matches(normalize-space($val), '([ ])([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])$')">
                                  <xsl:value-of select="replace($val, '([ ])([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])$', '')"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$val"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                        
                        <xsl:choose>
                            <xsl:when test="$txt1">
                                <xsl:value-of select="replace(normalize-space($txt1), ' $| $|&#8232;', '')"/>
                            </xsl:when>
                            <xsl:otherwise>                             
                                <xsl:value-of select="normalize-space(translate($val, '&#8232;', ''))"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:element>
                </xsl:for-each>
                <xsl:text>&#x000A;</xsl:text>
            </xsl:element>
            </xsl:result-document>
        </xsl:if>
        <xsl:if test="descendant::ParagraphStyleRange[@toc = 'true']">
            <xsl:result-document href="{'EPUB-XML_Linking_chapter_Info'}.xml">
            <xsl:text>&#x000A;</xsl:text>
            <xsl:element name="root">
                <xsl:for-each select="descendant::ParagraphStyleRange[@toc = 'true']">
                    <xsl:variable name="Stylename1" select="self::ParagraphStyleRange[@toc = 'true']/@AppliedParagraphStyle/substring-after(.,'ParagraphStyle/')"/>
                    <xsl:text>&#x000A;</xsl:text>
                    <xsl:text>   </xsl:text>
                    <xsl:element name="{$Stylename1}">
                        <xsl:attribute name="originalStyle" select="@Client-Style"/>
                        <xsl:attribute name="PmStyle">
                            <xsl:attribute name="PmStyle" select="self::ParagraphStyleRange[@toc = 'true']/@AppliedParagraphStyle/substring-after(.,'ParagraphStyle/')"/>
                        </xsl:attribute>
                        <xsl:attribute name="BookMark">
                            <xsl:choose>
                                <xsl:when test="@ParaNumber">
                                    <xsl:value-of select="@ParaNumber"/>
                                </xsl:when>
                                <xsl:when test="@ParaInfo">
                                    <xsl:value-of select="@ParaInfo"/>
                                </xsl:when>
                                <xsl:when test="descendant::HyperlinkTextDestination/@BookMarkDestination">
                                    <xsl:value-of select="descendant::HyperlinkTextDestination/@BookMarkDestination"/>
                                </xsl:when>
                                <xsl:when test="descendant::HyperlinkTextDestination/@Name">
                                    <xsl:value-of select="descendant::HyperlinkTextDestination/@Name"/>
                                </xsl:when>
                                <xsl:when test="descendant::HyperlinkTextDestination/@Self">
                                    <xsl:value-of select="descendant::HyperlinkTextDestination/@Self/substring-after(.,'HyperlinkTextDestination/')"/>
                                </xsl:when>
                            </xsl:choose>
                        </xsl:attribute>
                        <xsl:if test="descendant::XMLAttribute[@Name = 'xml:id']/@Value[string-length(.) &gt; 0]">
                            <xsl:attribute name="xml:id">
                            <xsl:value-of select="descendant::XMLAttribute[@Name = 'xml:id']/@Value"/>
                            </xsl:attribute>
                        </xsl:if>
                        <xsl:attribute name="chapterName"/>
                        <xsl:attribute name="commanId"/>
                        <xsl:variable name="chapterTitle">
                            <xsl:for-each select="descendant-or-self::Content">
                                <xsl:value-of select="."/>
                            </xsl:for-each>
                        </xsl:variable> 
                        
                       <!-- <xsl:variable name="forEachText">
                            <xsl:value-of select="normalize-space(translate($chapterTitle, '&#x9;|&#xA;|&#8232;|&#x00AD;', ' '))"/>
                            <xsl:if test="string-length($chSubTitle) &gt; 0">
                                <xsl:value-of select="' '"/>
                                <xsl:value-of select="$chSubTitle"/>
                            </xsl:if>
                        </xsl:variable>
                        <xsl:value-of select="$forEachText"/>-->
                        <xsl:value-of select="normalize-space(translate($chapterTitle, '&#x9;|&#xA;|&#8232;|&#x00AD;', ' '))"/>
                    </xsl:element>
                </xsl:for-each>
                <xsl:text>&#x000A;</xsl:text>
            </xsl:element>
            </xsl:result-document>
        </xsl:if>
    </xsl:template>
    
</xsl:stylesheet>