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
    <!--Added for Json to Toc on 06-6-2021-->
    <!--<xsl:output method="xml" use-character-maps="Ascii2Unicode" xml:space="preserve" encoding="UTF-8" indent="yes" name="xml"/>-->

    <xsl:param name="allSpaceCharacterEntity" select="'&#8232;|&#x0020;|&#xa0;|&#x00A0;|&#xA;|&#x9;|&#x2028;|&#8194;|&#8195;|&#x00009;|&#x0000A;|&#x02002;|&#x02003;|&#x02004;|&#x02005;|&#x02007;|&#x02008;|&#x02009;|&#x0200A;|&#x0200B;|&#x0200C;|&#x0200D;|&#x0200E;|&#x0200F;|&#x0205F;|&#x02060;|&#x02061;|&#x02062;|&#x02063;|&#x000AD;|&#x000A0;'"/>
    <xsl:variable name="json" select="document('bookMapperXMLFile.xml')"/>

    <xsl:variable name="filename" select="substring-before(tokenize(base-uri(.), '/')[last()], '.')"/>
    <xsl:param name="PassFileName"
        select="substring-before(tokenize(base-uri(.), '/')[last()], '.')"/>
    <!--Saravan pass file-->

    <xsl:variable name="FileCha_NameList" select="document('fileName_chTitle.xml')"/>


    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>


    <xsl:template match="//document">
        <xsl:variable name="currentfilename">
            <xsl:choose>
                <xsl:when test="$PassFileName = ''">
                    <!--<xsl:value-of select="substring-before($PassFileName,'.')"/>-->
                    <xsl:value-of select="substring-before(tokenize(base-uri(.), '/')[last()], '.')"
                    />
                </xsl:when>
                <xsl:otherwise>
                    <!--<xsl:value-of select="substring-before(tokenize(base-uri(.), '/')[last()],'.')"></xsl:value-of>-->
                    <xsl:value-of select="substring-before($PassFileName, '.')"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:if test="descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterTitle'] | descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterSubTitle'] | descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/TOC_PartTitle'] | descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/TOC_SectionTitle'] | descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/TOC_UnitTitle']">
            <xsl:result-document href="{'book_Toc'}.xml">
                <xsl:text>&#x000A;</xsl:text>
                <xsl:element name="root">
                    <xsl:text>&#x000A;</xsl:text>
                    <xsl:element name="Toc">
                        <xsl:attribute name="TOCChapterTitle">
                            <xsl:value-of select="'FrontMatter'"/>
                        </xsl:attribute>
                    </xsl:element>
                    <xsl:text>&#x000A;</xsl:text>
                    <xsl:element name="Toc">
                        <xsl:attribute name="TOCChapterTitle">
                            <xsl:value-of select="'Copyright'"/>
                        </xsl:attribute>
                    </xsl:element>
                    <xsl:text>&#x000A;</xsl:text>
                    <xsl:element name="Toc">
                        <xsl:attribute name="TOCChapterTitle">
                            <xsl:value-of select="'BookTitle'"/>
                        </xsl:attribute>
                    </xsl:element>
                    <xsl:text>&#x000A;</xsl:text>
                    <xsl:element name="Toc">
                        <xsl:attribute name="TOCChapterTitle">
                            <xsl:value-of select="'Title'"/>
                        </xsl:attribute>
                    </xsl:element>
                    <xsl:text>&#x000A;</xsl:text>
                    <xsl:element name="Toc">
                        <xsl:attribute name="TOCChapterTitle">
                            <xsl:value-of select="'Dedication'"/>
                        </xsl:attribute>
                    </xsl:element>
                    <xsl:text>&#x000A;</xsl:text>
                    <xsl:element name="Toc">
                        <xsl:attribute name="TOCChapterTitle">
                            <xsl:value-of select="'Contents'"/>
                        </xsl:attribute>
                    </xsl:element>
                    <xsl:for-each select="descendant::ParagraphStyleRange">
                        <xsl:if test="string-length(normalize-space(.)) &gt; 0">                            

                            <xsl:if test="@AppliedParagraphStyle = 'ParagraphStyle/TOC_FrontMatter'">
                                <xsl:text>&#x000A;</xsl:text>
                                <xsl:element name="Toc">
                                    <xsl:attribute name="TOCChapterTitle">
                                        <!--<xsl:variable name="chTitle">
                                            <xsl:value-of select="descendant::Content"/>
                                        </xsl:variable>
                                        <xsl:variable name="chTitle1">
                                            <xsl:value-of
                                                select="normalize-space(translate($chTitle, '&#8232;|&#x00AD;', ''))"
                                            />
                                        </xsl:variable>
                                        <xsl:variable name="chTitle2">
                                            <xsl:choose>
                                                <xsl:when test="contains($chTitle1, '&#8194;')">
                                                  <xsl:value-of
                                                  select="translate($chTitle1, '&#8194;', ' ')"/>
                                                </xsl:when>
                                                <xsl:when test="contains($chTitle1, '&#8195;')">
                                                  <xsl:value-of
                                                  select="translate($chTitle1, '&#8195;', ' ')"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                  <xsl:value-of select="$chTitle1"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>
                                        <!-\-  <xsl:variable name="txt1" select="tokenize($chTitle2, ' ')[last()]"/>
                                  <xsl:variable name="txt2" select="substring-before($chTitle2,$txt1)"/>
                                  <xsl:value-of select="normalize-space($txt2)"/>-\->
                                        <xsl:variable name="txt1"
                                            select="concat(' ', tokenize($chTitle2, ' ')[last()])"/>
                                        <xsl:variable name="txt2" select="substring-before($chTitle2, $txt1)"/>
                                        <xsl:choose>
                                            <xsl:when test="$txt2">
                                                <xsl:value-of select="normalize-space($txt2)"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="normalize-space($chTitle2)"/>
                                            </xsl:otherwise>
                                        </xsl:choose>-->
                                        
                                        <xsl:variable name="title">
                                            <xsl:value-of select="descendant::Content"/>
                                        </xsl:variable>
                                        
                                        <xsl:variable name="val">
                                            <!--<xsl:choose>
                                                <xsl:when test="contains($title,'&#8232;')">
                                                    <xsl:value-of select="normalize-space(translate($title, '&#8232;', ''))"/>
                                                </xsl:when>
                                                <xsl:otherwise>-->
                                            <xsl:value-of select="normalize-space(replace($title,'&#x00A0;|&#xA;|&#x9;|&#x2028;|&#8194;|&#8195;',' '))"/>
                                            <!--</xsl:otherwise>
                                            </xsl:choose>-->                                                  
                                        </xsl:variable>
                                        
                                        <xsl:variable name="txt1"> 
                                            <xsl:choose>
                                                <xsl:when test="matches($val,' ([0-9]?[0-9]?[0-9])$') or matches(normalize-space($val),' ([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])$')">
                                                    <xsl:value-of select="concat(' ',tokenize($val,' ')[last()])"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="$val"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>
                                        
                                        <xsl:variable name="txt2">
                                            <xsl:choose>
                                                <xsl:when test="contains($val,$txt1)">
                                                    <xsl:choose>
                                                        <xsl:when test="$val = $txt1">
                                                            <xsl:value-of select="$val"/>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <xsl:value-of select="substring-before($val,$txt1)"/>
                                                        </xsl:otherwise>
                                                    </xsl:choose>                                                           
                                                </xsl:when>                                                      
                                                <xsl:otherwise>
                                                    <xsl:value-of select="$val"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable> 
                                        
                                        <xsl:choose>
                                            <xsl:when test="$txt2">
                                                <xsl:value-of select="replace(normalize-space($txt2),' $| $|&#8232;','')"/> 
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <!--                                                <xsl:value-of select="normalize-space($val)"/>-->
                                                <xsl:value-of select="normalize-space(translate($val, '&#8232;', ''))"/>
                                            </xsl:otherwise>
                                        </xsl:choose>   
                                    </xsl:attribute>
                                </xsl:element>
                            </xsl:if>
                            
                            <xsl:if test="self::*[@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterNumber'][following-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterNumber']]">
                                <xsl:text>&#x000A;</xsl:text>
                                <xsl:element name="Toc">
                                    <xsl:attribute name="TOCChapterTitle">
                                        <!--<xsl:variable name="chTitle">
                                            <xsl:value-of select="descendant::Content"/>
                                        </xsl:variable>
                                        <xsl:variable name="chTitle1">
                                            <xsl:value-of
                                                select="normalize-space(translate($chTitle, '&#8232;|&#x00AD;', ''))"
                                            />
                                        </xsl:variable>
                                        <xsl:variable name="chTitle2">
                                            <xsl:choose>
                                                <xsl:when test="contains($chTitle1, '&#8194;')">
                                                  <xsl:value-of
                                                  select="translate($chTitle1, '&#8194;', ' ')"/>
                                                </xsl:when>
                                                <xsl:when test="contains($chTitle1, '&#8195;')">
                                                  <xsl:value-of
                                                  select="translate($chTitle1, '&#8195;', ' ')"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                  <xsl:value-of select="$chTitle1"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>
                                        <!-\-  <xsl:variable name="txt1" select="tokenize($chTitle2, ' ')[last()]"/>
                                  <xsl:variable name="txt2" select="substring-before($chTitle2,$txt1)"/>
                                  <xsl:value-of select="normalize-space($txt2)"/>-\->
                                        <xsl:variable name="txt1" select="concat(' ', tokenize($chTitle2, ' ')[last()])"/>
                                        <xsl:variable name="txt2" select="substring-before($chTitle2, $txt1)"/>
                                        <xsl:choose>
                                            <xsl:when test="$txt2">
                                                <xsl:value-of select="normalize-space($txt2)"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="normalize-space($chTitle2)"/>
                                            </xsl:otherwise>
                                        </xsl:choose>-->
                                        <xsl:variable name="title">
                                            <xsl:value-of select="descendant::Content"/>
                                        </xsl:variable>
                                        
                                        <xsl:variable name="val">
                                            <!--<xsl:choose>
                                                <xsl:when test="contains($title,'&#8232;')">
                                                    <xsl:value-of select="normalize-space(translate($title, '&#8232;', ''))"/>
                                                </xsl:when>
                                                <xsl:otherwise>-->
                                            <xsl:value-of select="normalize-space(replace($title,'&#x00A0;|&#xA;|&#x9;|&#x2028;|&#8194;|&#8195;',' '))"/>
                                            <!--</xsl:otherwise>
                                            </xsl:choose>-->                                                  
                                        </xsl:variable>
                                        
                                        <xsl:variable name="txt1"> 
                                            <xsl:choose>
                                                <xsl:when test="matches($val,' ([0-9]?[0-9]?[0-9])$') or matches(normalize-space($val),' ([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])$')">
                                                    <xsl:value-of select="concat(' ',tokenize($val,' ')[last()])"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="$val"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>
                                        
                                        <xsl:variable name="txt2">
                                            <xsl:choose>
                                                <xsl:when test="contains($val,$txt1)">
                                                    <xsl:choose>
                                                        <xsl:when test="$val = $txt1">
                                                            <xsl:value-of select="$val"/>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <xsl:value-of select="substring-before($val,$txt1)"/>
                                                        </xsl:otherwise>
                                                    </xsl:choose>                                                           
                                                </xsl:when>                                                      
                                                <xsl:otherwise>
                                                    <xsl:value-of select="$val"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable> 
                                        
                                        <xsl:choose>
                                            <xsl:when test="$txt2">
                                                <xsl:value-of select="replace(normalize-space($txt2),' $| $|&#8232;','')"/> 
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <!--                                                <xsl:value-of select="normalize-space($val)"/>-->
                                                <xsl:value-of select="normalize-space(translate($val, '&#8232;', ''))"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:attribute>
                                </xsl:element>
                            </xsl:if>

                            <xsl:if  test="@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterTitle' or @AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterSubTitle'">

                                <xsl:variable name="ChSubTitle">
                                    <xsl:choose>
                                        <xsl:when
                                            test="following-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterSubTitle']">
                                            <xsl:value-of
                                                select="following-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterSubTitle']/normalize-space(.)"
                                            />
                                        </xsl:when>
                                        <xsl:when
                                            test="parent::XMLElement[following-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterSubTitle']]">
                                            <xsl:value-of
                                                select="parent::XMLElement/following-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterSubTitle']/normalize-space(.)"
                                            />
                                        </xsl:when>
                                    </xsl:choose>
                                    <!--  <xsl:if test="preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterNumber']">                              
                                    <xsl:value-of select="preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterNumber']/normalize-space(.)"/>
                                </xsl:if>-->
                                </xsl:variable>
                                
                                <xsl:variable name="ChNo">
                                    <xsl:choose>
                                        <xsl:when
                                            test="preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterNumber']">
                                            <xsl:value-of
                                                select="preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterNumber']/normalize-space(.)"
                                            />
                                        </xsl:when>
                                        <xsl:when
                                            test="parent::XMLElement[preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterNumber']]">
                                            <xsl:value-of
                                                select="parent::XMLElement/preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterNumber']/normalize-space(.)"
                                            />
                                        </xsl:when>
                                    </xsl:choose>
                                    <!--  <xsl:if test="preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterNumber']">                              
                                    <xsl:value-of select="preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterNumber']/normalize-space(.)"/>
                                </xsl:if>-->
                                </xsl:variable>

                                <xsl:text>&#x000A;</xsl:text>
                                <xsl:element name="Toc">
                                    <xsl:attribute name="TOCChapterTitle">

                                        <xsl:variable name="title">                                           
                                            <xsl:for-each select="CharacterStyleRange">
                                                <xsl:choose>
                                                    <xsl:when test="@AppliedCharacterStyle = 'CharacterStyle/WordStyles%3apageno' or matches(@AppliedCharacterStyle,'pageno')">
                                                    </xsl:when>
                                                    <xsl:when test="@AppliedCharacterStyle = 'CharacterStyle/pageno' or matches(@AppliedCharacterStyle,'pageno')">
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:value-of select="."/>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:for-each>
                                        </xsl:variable>
                                       
                                        <xsl:variable name="val">                                             
                                            <xsl:value-of select="normalize-space(replace($title,$allSpaceCharacterEntity,' '))"/>
                                        </xsl:variable>
                                                  
                                        <xsl:variable name="txt1"> 
                                            <xsl:choose>
                                                <xsl:when test="matches($val,'([0-9]?[0-9]?[0-9])$') or matches(normalize-space($val),'([ ])([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])$')">
                                                    <xsl:variable name="removePageNo">
                                                        <xsl:value-of select="concat(' ',tokenize($val,' ')[last()])"/>
                                                    </xsl:variable>
                                                    <xsl:value-of select="replace($val,$removePageNo,'')"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="$val"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>
                                                                                
                                      <!--  <xsl:variable name="txt2">
                                            <xsl:choose>
                                                <xsl:when test="matches($val,'([ ])([0-9][0-9]?[0-9]?)$')">
                                                    <xsl:value-of select="substring-before($val,$txt1)"/>          
                                                </xsl:when>
                                                <xsl:when test="matches(normalize-space($val),'([ ])([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])$')">
                                                    <xsl:value-of select="substring-before($val,$txt1)"/>          
                                                </xsl:when>
                                                <xsl:otherwise>         
                                                    <xsl:value-of select="$val"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>-->
                                        
                                        <xsl:choose>
                                            <xsl:when test="$txt1">
                                                  <xsl:value-of select="replace(normalize-space($txt1),' $| $|&#8232;','')"/> 
                                            </xsl:when>
                                            <xsl:otherwise>
<!--                                                <xsl:value-of select="normalize-space($val)"/>-->
                                              <xsl:value-of select="normalize-space(translate($val, '&#8232;', ''))"/>
                                            </xsl:otherwise>
                                        </xsl:choose>

                                    </xsl:attribute>
                                    
                                    <xsl:if test="string-length($ChSubTitle) &gt; 0">
                                        <xsl:attribute name="TOC_ChapterSubTitle">
                                            <xsl:value-of select="'Value is true'"/>
                                        </xsl:attribute>
                                    </xsl:if>
                                    
                                    <xsl:attribute name="TOCChapterNumber">
                                        <xsl:value-of select="translate($ChNo, '&#x9;|&#xA;|&#x00AD;', ' ')"/>
                                    </xsl:attribute>
                                    
                                </xsl:element>
                            </xsl:if>
                           
                            <xsl:if  test="@AppliedParagraphStyle = 'ParagraphStyle/FB_IndexHeading'">
                                
                                <xsl:variable name="ChNo">
                                    <xsl:choose>
                                        <xsl:when
                                            test="preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterNumber']">
                                            <xsl:value-of
                                                select="preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterNumber']/normalize-space(.)"
                                            />
                                        </xsl:when>
                                        <xsl:when
                                            test="parent::XMLElement[preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterNumber']]">
                                            <xsl:value-of
                                                select="parent::XMLElement/preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterNumber']/normalize-space(.)"
                                            />
                                        </xsl:when>
                                    </xsl:choose>
                                    <!--  <xsl:if test="preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterNumber']">                              
                                    <xsl:value-of select="preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterNumber']/normalize-space(.)"/>
                                </xsl:if>-->
                                </xsl:variable>
                                
                                <xsl:text>&#x000A;</xsl:text>
                                <xsl:element name="Toc">
                                    <xsl:attribute name="TOCChapterTitle">
                                        
                                        <!--<xsl:variable name="chTitle">
                                            <xsl:value-of select="descendant::Content"/>
                                        </xsl:variable>
                                        <xsl:variable name="chTitle1">
                                            <xsl:value-of
                                                select="normalize-space(translate($chTitle, '&#8232;|&#x00AD;', ''))"
                                            />
                                        </xsl:variable>
                                        <xsl:variable name="chTitle2">
                                            <xsl:choose>
                                                <xsl:when test="contains($chTitle1, '&#8194;')">
                                                    <xsl:value-of
                                                        select="translate($chTitle1, '&#8194;', ' ')"/>
                                                </xsl:when>
                                                <xsl:when test="contains($chTitle1, '&#8195;')">
                                                    <xsl:value-of
                                                        select="translate($chTitle1, '&#8195;', ' ')"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="$chTitle1"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>
                                        <!-\-  <xsl:variable name="txt1" select="tokenize($chTitle2, ' ')[last()]"/>
                                  <xsl:variable name="txt2" select="substring-before($chTitle2,$txt1)"/>
                                  <xsl:value-of select="normalize-space($txt2)"/>-\->
                                        <!-\- <xsl:variable name="txt1" select="concat(' ', tokenize($chTitle2, ' ')[last()])"/>
                                    <xsl:variable name="txt2" select="substring-before($chTitle2, $txt1)"/> -\->
                                        <xsl:variable name="txt1">
                                            <xsl:choose>
                                                <xsl:when test="matches($chTitle2, '\d+$')">
                                                    <xsl:value-of
                                                        select="concat(' ', tokenize($chTitle2, ' ')[last()])"
                                                    />
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="$chTitle2"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>
                                        <xsl:variable name="txt2">
                                            <xsl:choose>
                                                <xsl:when
                                                    test="matches($chTitle2, '([ ])([0-9][0-9]?[0-9]?)$')">
                                                    <xsl:value-of
                                                        select="substring-before($chTitle2, $txt1)"/>
                                                </xsl:when>
                                                <!-\- <xsl:when test="matches(lower-case($chTitle2),'^xi|^ix|^vi|^iv')">
                                                <xsl:value-of select="substring-before($chTitle2,$txt1)"/> 
                                            </xsl:when>-\->
                                                <xsl:otherwise>
                                                    <xsl:value-of select="$chTitle2"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>
                                        
                                        <xsl:choose>
                                            <xsl:when test="$txt2">
                                                <xsl:value-of select="normalize-space($txt2)"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="normalize-space($chTitle2)"/>
                                            </xsl:otherwise>
                                        </xsl:choose>-->
                                        <xsl:variable name="title">
                                            <xsl:value-of select="descendant::Content"/>
                                        </xsl:variable>
                                        
                                        <xsl:variable name="val">
                                            <!--<xsl:choose>
                                                <xsl:when test="contains($title,'&#8232;')">
                                                    <xsl:value-of select="normalize-space(translate($title, '&#8232;', ''))"/>
                                                </xsl:when>
                                                <xsl:otherwise>-->
                                            <xsl:value-of select="normalize-space(replace($title,'&#x00A0;|&#xA;|&#x9;|&#x2028;|&#8194;|&#8195;',' '))"/>
                                            <!--</xsl:otherwise>
                                            </xsl:choose>-->                                                  
                                        </xsl:variable>
                                        
                                        <xsl:variable name="txt1"> 
                                            <xsl:choose>
                                                <xsl:when test="matches($val,' ([0-9]?[0-9]?[0-9])$') or matches(normalize-space($val),' ([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])$')">
                                                    <xsl:value-of select="concat(' ',tokenize($val,' ')[last()])"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="$val"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>
                                        
                                        <xsl:variable name="txt2">
                                            <xsl:choose>
                                                <xsl:when test="contains($val,$txt1)">
                                                    <xsl:choose>
                                                        <xsl:when test="$val = $txt1">
                                                            <xsl:value-of select="$val"/>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <xsl:value-of select="substring-before($val,$txt1)"/>
                                                        </xsl:otherwise>
                                                    </xsl:choose>                                                           
                                                </xsl:when>                                                      
                                                <xsl:otherwise>
                                                    <xsl:value-of select="$val"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable> 
                                        
                                        <xsl:choose>
                                            <xsl:when test="$txt2">
                                                <xsl:value-of select="replace(normalize-space($txt2),' $| $|&#8232;','')"/> 
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <!--                                                <xsl:value-of select="normalize-space($val)"/>-->
                                                <xsl:value-of select="normalize-space(translate($val, '&#8232;', ''))"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:attribute>
                                    <xsl:attribute name="TOCChapterNumber">
                                        <xsl:value-of
                                            select="translate($ChNo, '&#x9;|&#xA;|&#x00AD;', ' ')"/>
                                    </xsl:attribute>
                                </xsl:element>
                            </xsl:if>
                            <xsl:if  test="@AppliedParagraphStyle = 'ParagraphStyle/TOC_PartTitle'">
                                
                                <xsl:variable name="ChNo">
                                    <xsl:choose>
                                        <xsl:when
                                            test="preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/TOC_PartNumber']">
                                            <xsl:value-of
                                                select="preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/TOC_PartNumber']/normalize-space(.)"
                                            />
                                        </xsl:when>
                                        <xsl:when
                                            test="parent::XMLElement[preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/TOC_PartNumber']]">
                                            <xsl:value-of
                                                select="parent::XMLElement/preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/TOC_PartNumber']/normalize-space(.)"
                                            />
                                        </xsl:when>
                                    </xsl:choose>
                                    <!--  <xsl:if test="preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterNumber']">                              
                                    <xsl:value-of select="preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterNumber']/normalize-space(.)"/>
                                </xsl:if>-->
                                </xsl:variable>
                                
                                <xsl:text>&#x000A;</xsl:text>
                                <xsl:element name="Toc">
                                    <xsl:attribute name="TOCPartTitle">
                                        
                                       <!-- <xsl:variable name="chTitle">
                                            <xsl:value-of select="descendant::Content"/>
                                        </xsl:variable>
                                        <xsl:variable name="chTitle1">
                                            <xsl:value-of
                                                select="normalize-space(translate($chTitle, '&#8232;|&#x00AD;', ''))"
                                            />
                                        </xsl:variable>
                                        <xsl:variable name="chTitle2">
                                            <xsl:choose>
                                                <xsl:when test="contains($chTitle1, '&#8194;')">
                                                    <xsl:value-of
                                                        select="translate($chTitle1, '&#8194;', ' ')"/>
                                                </xsl:when>
                                                <xsl:when test="contains($chTitle1, '&#8195;')">
                                                    <xsl:value-of
                                                        select="translate($chTitle1, '&#8195;', ' ')"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="$chTitle1"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>
                                        <!-\-  <xsl:variable name="txt1" select="tokenize($chTitle2, ' ')[last()]"/>
                                  <xsl:variable name="txt2" select="substring-before($chTitle2,$txt1)"/>
                                  <xsl:value-of select="normalize-space($txt2)"/>-\->
                                        <!-\- <xsl:variable name="txt1" select="concat(' ', tokenize($chTitle2, ' ')[last()])"/>
                                    <xsl:variable name="txt2" select="substring-before($chTitle2, $txt1)"/> -\->
                                        <xsl:variable name="txt1">
                                            <xsl:choose>
                                                <xsl:when test="matches($chTitle2, '\d+$')">
                                                    <xsl:value-of
                                                        select="concat(' ', tokenize($chTitle2, ' ')[last()])"
                                                    />
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="$chTitle2"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>
                                        <xsl:variable name="txt2">
                                            <xsl:choose>
                                                <xsl:when
                                                    test="matches($chTitle2, '([ ])([0-9][0-9]?[0-9]?)$')">
                                                    <xsl:value-of
                                                        select="substring-before($chTitle2, $txt1)"/>
                                                </xsl:when>
                                                <!-\- <xsl:when test="matches(lower-case($chTitle2),'^xi|^ix|^vi|^iv')">
                                                <xsl:value-of select="substring-before($chTitle2,$txt1)"/> 
                                            </xsl:when>-\->
                                                <xsl:otherwise>
                                                    <xsl:value-of select="$chTitle2"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>
                                        
                                        <xsl:choose>
                                            <xsl:when test="$txt2">
                                                <xsl:value-of select="normalize-space($txt2)"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="normalize-space($chTitle2)"/>
                                            </xsl:otherwise>
                                        </xsl:choose>-->
                                        
                                        <xsl:variable name="title">
                                            <xsl:value-of select="descendant::Content"/>
                                        </xsl:variable>
                                        
                                        <xsl:variable name="val">
                                            <!--<xsl:choose>
                                                <xsl:when test="contains($title,'&#8232;')">
                                                    <xsl:value-of select="normalize-space(translate($title, '&#8232;', ''))"/>
                                                </xsl:when>
                                                <xsl:otherwise>-->
                                            <xsl:value-of select="normalize-space(replace($title,'&#x00A0;|&#xA;|&#x9;|&#x2028;|&#8194;|&#8195;',' '))"/>
                                            <!--</xsl:otherwise>
                                            </xsl:choose>-->                                                  
                                        </xsl:variable>
                                        
                                        <xsl:variable name="txt1"> 
                                            <xsl:choose>
                                                <xsl:when test="matches($val,' ([0-9]?[0-9]?[0-9])$') or matches(normalize-space($val),' ([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])$')">
                                                    <xsl:value-of select="concat(' ',tokenize($val,' ')[last()])"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="$val"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>
                                        
                                        <xsl:variable name="txt2">
                                            <xsl:choose>
                                                <xsl:when test="contains($val,$txt1)">
                                                    <xsl:choose>
                                                        <xsl:when test="$val = $txt1">
                                                            <xsl:value-of select="$val"/>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <xsl:value-of select="substring-before($val,$txt1)"/>
                                                        </xsl:otherwise>
                                                    </xsl:choose>                                                           
                                                </xsl:when>                                                      
                                                <xsl:otherwise>
                                                    <xsl:value-of select="$val"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable> 
                                        
                                        <xsl:choose>
                                            <xsl:when test="$txt2">
                                                <xsl:value-of select="replace(normalize-space($txt2),' $| $|&#8232;','')"/> 
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <!--                                                <xsl:value-of select="normalize-space($val)"/>-->
                                                <xsl:value-of select="normalize-space(translate($val, '&#8232;', ''))"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:attribute>
                                    <xsl:attribute name="TOCPartNumber">
                                        <xsl:value-of
                                            select="translate($ChNo, '&#x9;|&#xA;|&#x00AD;', ' ')"/>
                                    </xsl:attribute>
                                </xsl:element>
                            </xsl:if>
                            <xsl:if  test="@AppliedParagraphStyle = 'ParagraphStyle/TOC_SectionTitle'">
                                
                                <xsl:variable name="ChNo">
                                    <xsl:choose>
                                        <xsl:when
                                            test="preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/TOC_SectionNumber']">
                                            <xsl:value-of
                                                select="preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/TOC_SectionNumber']/normalize-space(.)"
                                            />
                                        </xsl:when>
                                        <xsl:when
                                            test="parent::XMLElement[preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/TOC_SectionNumber']]">
                                            <xsl:value-of
                                                select="parent::XMLElement/preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/TOC_SectionNumber']/normalize-space(.)"
                                            />
                                        </xsl:when>
                                    </xsl:choose>
                                    <!--  <xsl:if test="preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterNumber']">                              
                                    <xsl:value-of select="preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterNumber']/normalize-space(.)"/>
                                </xsl:if>-->
                                </xsl:variable>
                                
                                <xsl:text>&#x000A;</xsl:text>
                                <xsl:element name="Toc">
                                    <xsl:attribute name="TOCSectionTitle">
                                        
                                        <!--<xsl:variable name="chTitle">
                                            <xsl:value-of select="descendant::Content"/>
                                        </xsl:variable>
                                        <xsl:variable name="chTitle1">
                                            <xsl:value-of
                                                select="normalize-space(translate($chTitle, '&#8232;|&#x00AD;', ''))"
                                            />
                                        </xsl:variable>
                                        <xsl:variable name="chTitle2">
                                            <xsl:choose>
                                                <xsl:when test="contains($chTitle1, '&#8194;')">
                                                    <xsl:value-of
                                                        select="translate($chTitle1, '&#8194;', ' ')"/>
                                                </xsl:when>
                                                <xsl:when test="contains($chTitle1, '&#8195;')">
                                                    <xsl:value-of
                                                        select="translate($chTitle1, '&#8195;', ' ')"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="$chTitle1"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>
                                        <!-\-  <xsl:variable name="txt1" select="tokenize($chTitle2, ' ')[last()]"/>
                                  <xsl:variable name="txt2" select="substring-before($chTitle2,$txt1)"/>
                                  <xsl:value-of select="normalize-space($txt2)"/>-\->
                                        <!-\- <xsl:variable name="txt1" select="concat(' ', tokenize($chTitle2, ' ')[last()])"/>
                                    <xsl:variable name="txt2" select="substring-before($chTitle2, $txt1)"/> -\->
                                        <xsl:variable name="txt1">
                                            <xsl:choose>
                                                <xsl:when test="matches($chTitle2, '\d+$')">
                                                    <xsl:value-of
                                                        select="concat(' ', tokenize($chTitle2, ' ')[last()])"
                                                    />
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="$chTitle2"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>
                                        <xsl:variable name="txt2">
                                            <xsl:choose>
                                                <xsl:when
                                                    test="matches($chTitle2, '([ ])([0-9][0-9]?[0-9]?)$')">
                                                    <xsl:value-of
                                                        select="substring-before($chTitle2, $txt1)"/>
                                                </xsl:when>
                                                <!-\- <xsl:when test="matches(lower-case($chTitle2),'^xi|^ix|^vi|^iv')">
                                                <xsl:value-of select="substring-before($chTitle2,$txt1)"/> 
                                            </xsl:when>-\->
                                                <xsl:otherwise>
                                                    <xsl:value-of select="$chTitle2"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>
                                        
                                        <xsl:choose>
                                            <xsl:when test="$txt2">
                                                <xsl:value-of select="normalize-space($txt2)"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="normalize-space($chTitle2)"/>
                                            </xsl:otherwise>
                                        </xsl:choose>-->
                                        <xsl:variable name="title">
                                            <xsl:value-of select="descendant::Content"/>
                                        </xsl:variable>
                                        
                                        <xsl:variable name="val">
                                            <!--<xsl:choose>
                                                <xsl:when test="contains($title,'&#8232;')">
                                                    <xsl:value-of select="normalize-space(translate($title, '&#8232;', ''))"/>
                                                </xsl:when>
                                                <xsl:otherwise>-->
                                            <xsl:value-of select="normalize-space(replace($title,'&#x00A0;|&#xA;|&#x9;|&#x2028;|&#8194;|&#8195;',' '))"/>
                                            <!--</xsl:otherwise>
                                            </xsl:choose>-->                                                  
                                        </xsl:variable>
                                        
                                        <xsl:variable name="txt1"> 
                                            <xsl:choose>
                                                <xsl:when test="matches($val,' ([0-9]?[0-9]?[0-9])$') or matches(normalize-space($val),' ([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])$')">
                                                    <xsl:value-of select="concat(' ',tokenize($val,' ')[last()])"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="$val"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>
                                        
                                        <xsl:variable name="txt2">
                                            <xsl:choose>
                                                <xsl:when test="contains($val,$txt1)">
                                                    <xsl:choose>
                                                        <xsl:when test="$val = $txt1">
                                                            <xsl:value-of select="$val"/>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <xsl:value-of select="substring-before($val,$txt1)"/>
                                                        </xsl:otherwise>
                                                    </xsl:choose>                                                           
                                                </xsl:when>                                                      
                                                <xsl:otherwise>
                                                    <xsl:value-of select="$val"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable> 
                                        
                                        <xsl:choose>
                                            <xsl:when test="$txt2">
                                                <xsl:value-of select="replace(normalize-space($txt2),' $| $|&#8232;','')"/> 
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <!--                                                <xsl:value-of select="normalize-space($val)"/>-->
                                                <xsl:value-of select="normalize-space(translate($val, '&#8232;', ''))"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:attribute>
                                    <xsl:attribute name="TOCSectionNumber">
                                        <xsl:value-of
                                            select="translate($ChNo, '&#x9;|&#xA;|&#x00AD;', ' ')"/>
                                    </xsl:attribute>
                                </xsl:element>
                            </xsl:if>
                            <xsl:if  test="@AppliedParagraphStyle = 'ParagraphStyle/TOC_UnitTitle'">
                                
                                <xsl:variable name="ChNo">
                                    <xsl:choose>
                                        <xsl:when
                                            test="preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/TOC_UnitNumber']">
                                            <xsl:value-of
                                                select="preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/TOC_UnitNumber']/normalize-space(.)"
                                            />
                                        </xsl:when>
                                        <xsl:when
                                            test="parent::XMLElement[preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/TOC_UnitNumber']]">
                                            <xsl:value-of
                                                select="parent::XMLElement/preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/TOC_UnitNumber']/normalize-space(.)"
                                            />
                                        </xsl:when>
                                    </xsl:choose>
                                    <!--  <xsl:if test="preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterNumber']">                              
                                    <xsl:value-of select="preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterNumber']/normalize-space(.)"/>
                                </xsl:if>-->
                                </xsl:variable>
                                
                                <xsl:text>&#x000A;</xsl:text>
                                <xsl:element name="Toc">
                                    <xsl:attribute name="TOCUnitTitle">
                                        
                                        <!--<xsl:variable name="chTitle">
                                            <xsl:value-of select="descendant::Content"/>
                                        </xsl:variable>
                                        <xsl:variable name="chTitle1">
                                            <xsl:value-of
                                                select="normalize-space(translate($chTitle, '&#8232;|&#x00AD;', ''))"
                                            />
                                        </xsl:variable>
                                        <xsl:variable name="chTitle2">
                                            <xsl:choose>
                                                <xsl:when test="contains($chTitle1, '&#8194;')">
                                                    <xsl:value-of
                                                        select="translate($chTitle1, '&#8194;', ' ')"/>
                                                </xsl:when>
                                                <xsl:when test="contains($chTitle1, '&#8195;')">
                                                    <xsl:value-of
                                                        select="translate($chTitle1, '&#8195;', ' ')"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="$chTitle1"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>
                                        <!-\-  <xsl:variable name="txt1" select="tokenize($chTitle2, ' ')[last()]"/>
                                  <xsl:variable name="txt2" select="substring-before($chTitle2,$txt1)"/>
                                  <xsl:value-of select="normalize-space($txt2)"/>-\->
                                        <!-\- <xsl:variable name="txt1" select="concat(' ', tokenize($chTitle2, ' ')[last()])"/>
                                    <xsl:variable name="txt2" select="substring-before($chTitle2, $txt1)"/> -\->
                                        <xsl:variable name="txt1">
                                            <xsl:choose>
                                                <xsl:when test="matches($chTitle2, '\d+$')">
                                                    <xsl:value-of
                                                        select="concat(' ', tokenize($chTitle2, ' ')[last()])"
                                                    />
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="$chTitle2"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>
                                        <xsl:variable name="txt2">
                                            <xsl:choose>
                                                <xsl:when
                                                    test="matches($chTitle2, '([ ])([0-9][0-9]?[0-9]?)$')">
                                                    <xsl:value-of
                                                        select="substring-before($chTitle2, $txt1)"/>
                                                </xsl:when>
                                                <!-\- <xsl:when test="matches(lower-case($chTitle2),'^xi|^ix|^vi|^iv')">
                                                <xsl:value-of select="substring-before($chTitle2,$txt1)"/> 
                                            </xsl:when>-\->
                                                <xsl:otherwise>
                                                    <xsl:value-of select="$chTitle2"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>
                                        
                                        <xsl:choose>
                                            <xsl:when test="$txt2">
                                                <xsl:value-of select="normalize-space($txt2)"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="normalize-space($chTitle2)"/>
                                            </xsl:otherwise>
                                        </xsl:choose>-->
                                        <xsl:variable name="title">
                                            <xsl:value-of select="descendant::Content"/>
                                        </xsl:variable>
                                        
                                        <xsl:variable name="val">
                                            <!--<xsl:choose>
                                                <xsl:when test="contains($title,'&#8232;')">
                                                    <xsl:value-of select="normalize-space(translate($title, '&#8232;', ''))"/>
                                                </xsl:when>
                                                <xsl:otherwise>-->
                                            <xsl:value-of select="normalize-space(replace($title,'&#x00A0;|&#xA;|&#x9;|&#x2028;|&#8194;|&#8195;',' '))"/>
                                            <!--</xsl:otherwise>
                                            </xsl:choose>-->                                                  
                                        </xsl:variable>
                                        
                                        <xsl:variable name="txt1"> 
                                            <xsl:choose>
                                                <xsl:when test="matches($val,' ([0-9]?[0-9]?[0-9])$') or matches(normalize-space($val),' ([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])$')">
                                                    <xsl:value-of select="concat(' ',tokenize($val,' ')[last()])"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="$val"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>
                                        
                                        <xsl:variable name="txt2">
                                            <xsl:choose>
                                                <xsl:when test="contains($val,$txt1)">
                                                    <xsl:choose>
                                                        <xsl:when test="$val = $txt1">
                                                            <xsl:value-of select="$val"/>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <xsl:value-of select="substring-before($val,$txt1)"/>
                                                        </xsl:otherwise>
                                                    </xsl:choose>                                                           
                                                </xsl:when>                                                      
                                                <xsl:otherwise>
                                                    <xsl:value-of select="$val"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable> 
                                        
                                        <xsl:choose>
                                            <xsl:when test="$txt2">
                                                <xsl:value-of select="replace(normalize-space($txt2),' $| $|&#8232;','')"/> 
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <!--                                                <xsl:value-of select="normalize-space($val)"/>-->
                                                <xsl:value-of select="normalize-space(translate($val, '&#8232;', ''))"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:attribute>
                                    <xsl:attribute name="TOCUnitNumber">
                                        <xsl:value-of
                                            select="translate($ChNo, '&#x9;|&#xA;|&#x00AD;', ' ')"/>
                                    </xsl:attribute>
                                </xsl:element>
                            </xsl:if>
                            <xsl:if test="@AppliedParagraphStyle = 'ParagraphStyle/TOC_BackMatter'">
                                <xsl:text>&#x000A;</xsl:text>
                                <xsl:element name="Toc">
                                    <xsl:attribute name="TOCChapterTitle">
                                        <!--<xsl:variable name="chTitle">
                                            <xsl:value-of select="descendant::Content"/>
                                        </xsl:variable>
                                        <xsl:variable name="chTitle1">
                                            <xsl:value-of
                                                select="normalize-space(translate($chTitle, '&#8232;|&#x00AD;', ''))"
                                            />
                                        </xsl:variable>
                                        <xsl:variable name="chTitle2">
                                            <xsl:choose>
                                                <xsl:when test="contains($chTitle1, '&#8194;')">
                                                  <xsl:value-of
                                                  select="translate($chTitle1, '&#8194;|&#x00AD;', ' ')"
                                                  />
                                                </xsl:when>
                                                <xsl:when test="contains($chTitle1, '&#8195;')">
                                                  <xsl:value-of
                                                  select="translate($chTitle1, '&#8195;|&#x00AD;', ' ')"
                                                  />
                                                </xsl:when>
                                                <xsl:otherwise>
                                                  <xsl:value-of select="$chTitle1"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>
                                        <!-\-  <xsl:variable name="txt1" select="tokenize($chTitle2, ' ')[last()]"/>
                                  <xsl:variable name="txt2" select="substring-before($chTitle2,$txt1)"/>
                                  <xsl:value-of select="normalize-space($txt2)"/>-\->
                                        <xsl:variable name="txt1"
                                            select="concat(' ', tokenize($chTitle2, ' ')[last()])"/>
                                        <xsl:variable name="txt2"
                                            select="substring-before($chTitle2, $txt1)"/>
                                        <xsl:choose>
                                            <xsl:when test="$txt2">
                                                <xsl:value-of select="normalize-space($txt2)"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="normalize-space($chTitle2)"/>
                                            </xsl:otherwise>
                                        </xsl:choose>-->
                                        
                                        <xsl:variable name="title">
                                            <xsl:value-of select="descendant::Content"/>
                                        </xsl:variable>
                                        
                                        <xsl:variable name="val">
                                            <!--<xsl:choose>
                                                <xsl:when test="contains($title,'&#8232;')">
                                                    <xsl:value-of select="normalize-space(translate($title, '&#8232;', ''))"/>
                                                </xsl:when>
                                                <xsl:otherwise>-->
                                            <xsl:value-of select="normalize-space(replace($title,'&#x00A0;|&#xA;|&#x9;|&#x2028;|&#8194;|&#8195;',' '))"/>
                                            <!--</xsl:otherwise>
                                            </xsl:choose>-->                                                  
                                        </xsl:variable>
                                        
                                        <xsl:variable name="txt1"> 
                                            <xsl:choose>
                                                <xsl:when test="matches($val,' ([0-9]?[0-9]?[0-9])$') or matches(normalize-space($val),' ([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])$')">
                                                    <xsl:value-of select="concat(' ',tokenize($val,' ')[last()])"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="$val"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>
                                        
                                        <xsl:variable name="txt2">
                                            <xsl:choose>
                                                <xsl:when test="contains($val,$txt1)">
                                                    <xsl:choose>
                                                        <xsl:when test="$val = $txt1">
                                                            <xsl:value-of select="$val"/>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <xsl:value-of select="substring-before($val,$txt1)"/>
                                                        </xsl:otherwise>
                                                    </xsl:choose>                                                           
                                                </xsl:when>                                                      
                                                <xsl:otherwise>
                                                    <xsl:value-of select="$val"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable> 
                                        
                                        <xsl:choose>
                                            <xsl:when test="$txt2">
                                                <xsl:value-of select="replace(normalize-space($txt2),' $| $|&#8232;','')"/> 
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <!--                                                <xsl:value-of select="normalize-space($val)"/>-->
                                                <xsl:value-of select="normalize-space(translate($val, '&#8232;', ''))"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:attribute>
                                </xsl:element>
                            </xsl:if>
                            
                        </xsl:if>
                    </xsl:for-each>
                    <xsl:text>&#x000A;</xsl:text>
                </xsl:element>
            </xsl:result-document>
        </xsl:if>
        
        <!--<xsl:result-document href="{'output'}.cf">
            <xsl:text>&#x000A;</xsl:text>
            <xsl:element name="root">
                <xsl:for-each select="descendant::ParagraphStyleRange">
                    <xsl:choose>
                        <!-\-                        <xsl:when test="@AppliedParagraphStyle = 'ParagraphStyle/FB_Half_Title'">                   -\->
                        <!-\-<xsl:when test="@AppliedParagraphStyle = 'ParagraphStyle/FB_Half_Title' and not(following::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterTitle'])">
                            <xsl:text>&#x000A;</xsl:text>
                            <xsl:element name="Title">
                                <xsl:attribute name="ChapterTitle">
                                    <xsl:variable name="chTile">
                                        <xsl:value-of select="descendant::Content"/>
                                    </xsl:variable>
                                    <xsl:value-of select="normalize-space(translate($chTile, '&#x9;|&#xA;|&#8232;', ''))"/>
                                </xsl:attribute>                           
                                <xsl:if test="//ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FB_Half_Title']">
                                    <xsl:attribute name="toc">
                                        <xsl:for-each select="//ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FrontMatterHeading'][1]">
                                            <xsl:choose>
                                                <xsl:when test="contains(@AppliedParagraphStyle, 'ParagraphStyle/FrontMatterHeading')">
                                                    <xsl:value-of select="'true'"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="'false'"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:for-each>
                                    </xsl:attribute>
                                </xsl:if> 
                            </xsl:element>                      
                        </xsl:when>-\->
                        <xsl:when test="@AppliedParagraphStyle = 'ParagraphStyle/FB_Book_Title'">
                            <xsl:text>&#x000A;</xsl:text>
                            <xsl:element name="Title">
                                <xsl:attribute name="ChapterTitle">
                                    <xsl:variable name="chTile">
                                        <xsl:value-of select="descendant::Content"/>
                                    </xsl:variable>
                                    <!-\- <xsl:value-of select="normalize-space(translate($chTile, '&#x9;|&#xA;|&#8232;', ''))"/>-\->
                                    <xsl:value-of select="'FrontMatter'"/>
                                </xsl:attribute>
                                <xsl:if test="//ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FB_Book_Title']">
                                    <xsl:attribute name="toc">
                                        <xsl:for-each select="//ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FB_Book_Title'][1]">
                                            <xsl:choose>
                                                <xsl:when test="contains(@AppliedParagraphStyle, 'ParagraphStyle/FB_Book_Title')">
                                                  <xsl:value-of select="'true'"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                  <xsl:value-of select="'false'"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:for-each>
                                    </xsl:attribute>
                                </xsl:if>
                            </xsl:element>
                        </xsl:when>
                        <xsl:when test="@AppliedParagraphStyle = 'ParagraphStyle/FrontMatterHeading'">
                            <xsl:text>&#x000A;</xsl:text>
                            <xsl:variable name="chTile">
                                <xsl:value-of select="descendant::Content"/>
                            </xsl:variable>
                            <xsl:choose>
                                <xsl:when test="matches(lower-case($chTile), 'contents')">
                                    <xsl:element name="Title">
                                        <xsl:attribute name="ChapterTitle">
                                            <!-\- <xsl:value-of select="normalize-space(translate($chTile, '&#x9;|&#xA;|&#8232;', ''))"/>-\->
                                            <xsl:value-of select="'Contents'"/>
                                        </xsl:attribute>
                                    </xsl:element>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:element name="Title">
                                        <xsl:attribute name="ChapterTitle">
                                            <xsl:value-of
                                                select="normalize-space(translate($chTile, '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"
                                            />
                                        </xsl:attribute>
                                    </xsl:element>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                        <!-\-25/09/2020 below comented for mismatch Acknowledgments of FrontMatterHeading style in taggart_testing book  -\->
                        <!-\-<xsl:when test="@AppliedParagraphStyle = 'ParagraphStyle/FrontMatterHeading'">                   
                            <xsl:text>&#x000A;</xsl:text>
                            <xsl:element name="Title">
                                <xsl:attribute name="ChapterTitle">
                                    <xsl:variable name="chTile">
                                        <xsl:value-of select="descendant::Content"/>
                                    </xsl:variable>
                                    <xsl:value-of select="normalize-space(translate($chTile, '&#x9;|&#xA;|&#8232;', ''))"/>
                                </xsl:attribute>                           
                                <xsl:if test="//ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FrontMatterHeading']">
                                    <xsl:attribute name="toc">
                                        <xsl:for-each select="//ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FrontMatterHeading'][1]">
                                            <xsl:choose>
                                                <xsl:when test="contains(@AppliedParagraphStyle, 'ParagraphStyle/FB_Half_Title')">
                                                    <xsl:value-of select="'true'"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="'false'"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:for-each>
                                    </xsl:attribute>
                                </xsl:if>     
                            </xsl:element>                      
                        </xsl:when>   -\->

                    </xsl:choose>
                    <xsl:variable name="ChNo">
                        <xsl:if test="preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/ChapterNumber']">
                            <xsl:value-of select="preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/ChapterNumber']/."/>
                        </xsl:if>
                        <xsl:if test="preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/PartNumber']">
                            <xsl:value-of select="preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/PartNumber']/."/>
                        </xsl:if>
                        <xsl:if test="preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/UnitNumber']">
                            <xsl:value-of select="preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/UnitNumber']/."/>
                        </xsl:if>
                        <xsl:if test="preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/SectionNumber']">
                            <xsl:value-of select="preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/SectionNumber']/."/>
                        </xsl:if>
                    </xsl:variable>
                    
                    <xsl:variable name="chSubTitle">
                        <xsl:if  test="following-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/SubTitle']">
                            <xsl:value-of  select="following-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/SubTitle']/."/>
                        </xsl:if>
                    </xsl:variable>

                    <xsl:if test="self::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/ChapterTitle']">
                        <xsl:text>&#x000A;</xsl:text>
                        <!-\-<xsl:variable name="chCont" select="normalize-space(descendant::Content/.)"/>-\->
                        <xsl:variable name="chCont" select="descendant::Content/."/>
                        <xsl:element name="Title">
                            <xsl:attribute name="ChapterTitle">
                                <xsl:variable name="chTile">
                                    <xsl:choose>
                                        <xsl:when test="string-length($chSubTitle) &gt; 0">
                                            <xsl:value-of select="normalize-space($chCont)"/>
                                            <xsl:if test="$chSubTitle">
                                                <xsl:value-of select="' '"/>
                                            </xsl:if>
                                            <xsl:value-of select="normalize-space($chSubTitle)"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="$chCont"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:value-of select="normalize-space(translate($chTile, '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"/>
                            </xsl:attribute>
                            <xsl:attribute name="ChapterNumber">
                                <xsl:value-of select="$ChNo"/>
                            </xsl:attribute>
                        </xsl:element>
                    </xsl:if>
                    <xsl:if test="self::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FB_IndexHeading']">
                        <xsl:text>&#x000A;</xsl:text>
                        <!-\-<xsl:variable name="chCont" select="normalize-space(descendant::Content/.)"/>-\->
                        <xsl:variable name="chCont" select="descendant::Content/."/>
                        <xsl:element name="Title">
                            <xsl:attribute name="ChapterTitle">
                                <xsl:variable name="chTile">
                                    <xsl:choose>
                                        <xsl:when test="string-length($chSubTitle) &gt; 0">
                                            <xsl:value-of select="normalize-space($chCont)"/>
                                            <xsl:if test="$chSubTitle">
                                                <xsl:value-of select="' '"/>
                                            </xsl:if>
                                            <xsl:value-of select="normalize-space($chSubTitle)"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="$chCont"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:value-of select="normalize-space(translate($chTile, '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"/>
                            </xsl:attribute>
                            <xsl:attribute name="ChapterNumber">
                                <xsl:value-of select="$ChNo"/>
                            </xsl:attribute>
                        </xsl:element>
                    </xsl:if>
                    <xsl:if test="self::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/PartTitle']">
                        <xsl:text>&#x000A;</xsl:text>
                        <!-\-<xsl:variable name="chCont" select="normalize-space(descendant::Content/.)"/>-\->
                        <xsl:variable name="chCont" select="descendant::Content/."/>
                        <xsl:element name="Title">
                            <xsl:attribute name="PartTitle">
                                <xsl:variable name="partTile">
                                    <xsl:choose>
                                        <xsl:when test="string-length($chSubTitle) &gt; 0">
                                            <xsl:value-of select="normalize-space($chCont)"/>
                                            <xsl:if test="$chSubTitle">
                                                <xsl:value-of select="' '"/>
                                            </xsl:if>
                                            <xsl:value-of select="normalize-space($chSubTitle)"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="$chCont"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:value-of select="normalize-space(translate($partTile, '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"/>
                            </xsl:attribute>
                            <xsl:attribute name="PartNumber">
                                <xsl:value-of select="$ChNo"/>
                            </xsl:attribute>
                        </xsl:element>
                    </xsl:if>
                    <xsl:if test="self::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/UnitTitle']">
                        <xsl:text>&#x000A;</xsl:text>
                        <!-\-<xsl:variable name="chCont" select="normalize-space(descendant::Content/.)"/>-\->
                        <xsl:variable name="chCont" select="descendant::Content/."/>
                        <xsl:element name="Title">
                            <xsl:attribute name="UnitTitle">
                                <xsl:variable name="unitTitle">
                                    <xsl:choose>
                                        <xsl:when test="string-length($chSubTitle) &gt; 0">
                                            <xsl:value-of select="normalize-space($chCont)"/>
                                            <xsl:if test="$chSubTitle">
                                                <xsl:value-of select="' '"/>
                                            </xsl:if>
                                            <xsl:value-of select="normalize-space($chSubTitle)"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="$chCont"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:value-of select="normalize-space(translate($unitTitle, '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"/>
                            </xsl:attribute>
                            <xsl:attribute name="UnitNumber">
                                <xsl:value-of select="$ChNo"/>
                            </xsl:attribute>
                        </xsl:element>
                    </xsl:if>
                    <xsl:if test="self::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/SectionTitle']">
                        <xsl:text>&#x000A;</xsl:text>
                        <!-\-<xsl:variable name="chCont" select="normalize-space(descendant::Content/.)"/>-\->
                        <xsl:variable name="chCont" select="descendant::Content/."/>
                        <xsl:element name="Title">
                            <xsl:attribute name="SectionTitle">
                                <xsl:variable name="sectionTitle">
                                    <xsl:choose>
                                        <xsl:when test="string-length($chSubTitle) &gt; 0">
                                            <xsl:value-of select="normalize-space($chCont)"/>
                                            <xsl:if test="$chSubTitle">
                                                <xsl:value-of select="' '"/>
                                            </xsl:if>
                                            <xsl:value-of select="normalize-space($chSubTitle)"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="$chCont"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:value-of select="normalize-space(translate($sectionTitle, '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"/>
                            </xsl:attribute>
                            <xsl:attribute name="SectionNumber">
                                <xsl:value-of select="$ChNo"/>
                            </xsl:attribute>
                        </xsl:element>
                    </xsl:if>
                    <xsl:if test="@AppliedParagraphStyle = 'ParagraphStyle/BackMatterHeading'">
                        <xsl:text>&#x000A;</xsl:text>
                        <xsl:element name="Title">
                            <xsl:attribute name="ChapterTitle">
                                <xsl:variable name="chTile">
                                    <xsl:value-of select="descendant::Content"/>
                                </xsl:variable>
                                <xsl:value-of
                                    select="normalize-space(translate($chTile, '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"/>
                                <!-\-                            <xsl:value-of select="normalize-space($chTile)"/>-\->
                            </xsl:attribute>
                        </xsl:element>
                    </xsl:if>

                </xsl:for-each>
                <xsl:text>&#x000A;</xsl:text>
            </xsl:element>
        </xsl:result-document>-->
        
        <xsl:result-document href="{'output'}.cf">
        <xsl:text>&#x000A;</xsl:text>
        <xsl:element name="root">
            <xsl:text>&#x000A;</xsl:text>
            <xsl:element name="Title">
               <xsl:call-template name="styleName">
                    <xsl:with-param name="styleNameVal"/>
                </xsl:call-template>
                <xsl:call-template name="chapterTitle">
                         <xsl:with-param name="chTVal"/>
                </xsl:call-template>
                
                <xsl:call-template name="chapterSubTitle">
                    <xsl:with-param name="chSubTitleVal"/>
                </xsl:call-template>
                
                <xsl:call-template name="chapterNumber">
                        <xsl:with-param name="chNVal"/>
                </xsl:call-template>
                
                <xsl:call-template name="PartTitle">
                        <xsl:with-param name="pTVal"/>
                </xsl:call-template>               
                  
                <xsl:call-template name="PartNumber">
                         <xsl:with-param name="pNVal"/>
                </xsl:call-template>
                
                <xsl:call-template name="UnitTitle">
                    <xsl:with-param name="uTVal"/>
                </xsl:call-template>
                
                <xsl:call-template name="UnitNumber">
                    <xsl:with-param name="uNVal"/>
                </xsl:call-template>
                
                <xsl:call-template name="SectionTitle">
                    <xsl:with-param name="sTVal"/>
                </xsl:call-template>
                
                <xsl:call-template name="SectionNumber">
                    <xsl:with-param name="sNVal"/>
                </xsl:call-template>
                <xsl:call-template name="DocumentAuthor">
                    <xsl:with-param name="DocumentAuthorTVal"/>
                </xsl:call-template>
                <xsl:call-template name="find_For_External_Link">
                    <xsl:with-param name="FigCapVal"/>
                </xsl:call-template>             
            </xsl:element><xsl:text>&#x000A;</xsl:text>
        </xsl:element>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template name="chapterTitle">
        <xsl:param name="chTVal"/>
        <xsl:variable name="chSubTitle">
            <xsl:for-each select="descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/SubTitle']">
                <xsl:value-of select="normalize-space(translate(self::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/SubTitle']/., '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"/>  
            </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="chSubTitle1">
            <xsl:for-each select="descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/SubTitle']">
                <!--<xsl:value-of select="normalize-space(translate(self::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/SubTitle']/., '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"/>-->
                <xsl:call-template name="CharacterStyleRange"/>
            </xsl:for-each>
        </xsl:variable>
        
        <xsl:variable name="findFrontMatter">
            <xsl:if test="descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FB_Book_Title'] and descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FB_Copy_Right_First'] and descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FB_DedicationPara'] and descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FB_Half_Title']">
                <xsl:value-of select="true()"/>
            </xsl:if>
        </xsl:variable>
        <!--<xsl:variable name="dedicationPara">
            <xsl:if test="descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FB_DedicationPara']">
                <xsl:value-of select="'DedicationParaTitle'"/>
            </xsl:if>
        </xsl:variable>-->
        <xsl:variable name="findTOC">
            <xsl:if test="descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FrontMatterHeading'][contains(lower-case(.),'contents')]">
                <xsl:value-of select="descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FrontMatterHeading'][contains(lower-case(.),'contents')]"/>
            </xsl:if>
        </xsl:variable>
        <xsl:variable name="count">
            <xsl:value-of select="count(descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FrontMatterHeading'] | descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/ChapterTitle'] | descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/BackMatterHeading'] | descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FB_IndexHeading'] | descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FB_Book_Title'] | descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FB_DedicationPara'])"/>
        </xsl:variable> 
        
        <!--<xsl:if test="count(descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FrontMatterHeading'] | descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/ChapterTitle'] | descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/BackMatterHeading'] | descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FB_IndexHeading'] | descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FB_Book_Title'] | descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FB_DedicationPara']) &gt; 1">
            <xsl:attribute name="ChapterTitle">
                <xsl:value-of select="'FrontMatter'"/>
            </xsl:attribute>
        </xsl:if>-->
        
      <!--  <xsl:if test="string-length($findFrontMatter) &gt; 0">
            <xsl:attribute name="ChapterTitle">
                <xsl:value-of select="'FrontMatter'"/>
            </xsl:attribute>
        </xsl:if>-->
        <xsl:for-each select="descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FB_Book_Title'] | descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FrontMatterHeading'] | descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/ChapterTitle'] | descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/BackMatterHeading'] | descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FB_IndexHeading'] | descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FB_DedicationPara'] | descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FB_Copy_Right_First'] | descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FB_Half_Title']">          
            <xsl:choose>
                <xsl:when test="self::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/ChapterTitle'] | self::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/BackMatterHeading'] | self::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FB_IndexHeading'] | self::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FB_DedicationPara']">
                    <xsl:variable name="chapterTitle">
                        <xsl:for-each select="descendant-or-self::Content">
                            <xsl:value-of select="."/>
                        </xsl:for-each>
                    </xsl:variable>
                    <xsl:variable name="forEachText">
                        <xsl:value-of select="normalize-space(translate($chapterTitle, '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"/>
                        <xsl:if test="string-length($chSubTitle) &gt; 0">
                            <xsl:value-of select="' '"/> 
                            <xsl:value-of select="$chSubTitle"/>
                        </xsl:if>
                    </xsl:variable>
                    <xsl:choose>
                        <xsl:when test="string-length($findFrontMatter) &gt; 0">
                            <xsl:attribute name="ChapterTitle">
                                <xsl:value-of select="'FrontMatter'"/>
                            </xsl:attribute>
                        </xsl:when>
                        <xsl:when test="count(self::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/ChapterTitle'] | self::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/BackMatterHeading'] | self::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FB_IndexHeading']) = 1 and $count = 1">
                            <xsl:variable name="attName">
                                <xsl:value-of select="'ChapterTitle'"/>
                            </xsl:variable>
                            <xsl:attribute name="{$attName}">
                                <xsl:value-of select="$forEachText"/>
                            </xsl:attribute>
                            <!--Added for Generate Toc on 07-05-2021-->
                            <xsl:attribute name="BbChapterTitle_styleName">
                                <xsl:value-of select="normalize-space(substring-after(@AppliedParagraphStyle,'ParagraphStyle/'))"/>
                            </xsl:attribute>
                            <!--Added for Json to Toc on 06-6-2021-->
                             <xsl:attribute name="BbChapterTitle">
                                <xsl:variable name="chapterTitle">
                                 <xsl:call-template name="CharacterStyleRange"/>
                                 </xsl:variable>
                                 <xsl:if test="string-length($chapterTitle)&gt; 0">
                                     <xsl:value-of select="normalize-space($chapterTitle)"/>
                                 </xsl:if>
                                 <xsl:if test="string-length($chSubTitle1) &gt; 0">
                                     <xsl:value-of select="': '"/>
                                     <xsl:value-of select="normalize-space($chSubTitle1)"/>
                                 </xsl:if>
                            </xsl:attribute>
                           
                            <!--End-->
                        </xsl:when>
                        <xsl:when test="self::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FB_DedicationPara']">
                            <xsl:attribute name="ChapterTitle">
                            <xsl:value-of select="'Dedication'"/>
                            </xsl:attribute>
                        </xsl:when>
                    </xsl:choose>                   
                                       
                    <!--<xsl:choose>
                        <xsl:when test="string-length($findFrontMatter) &gt; 0">                            
                            <xsl:attribute name="ChapterTitle">
                                <xsl:value-of select="'FrontMatter'"/>
                            </xsl:attribute>
                        </xsl:when>
                        <xsl:when test="contains($findTOC,'contents')">
                            <xsl:attribute name="ChapterTitle">
                                <xsl:value-of select="'Contents'"/>
                            </xsl:attribute>
                        </xsl:when>
                        <xsl:when test="contains($dedicationPara,'DedicationParaTitle')">
                            <xsl:attribute name="ChapterTitle">
                                <xsl:value-of select="'DedicationParaTitle'"/>
                            </xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:attribute name="ChapterTitle">  
                                <xsl:value-of select="normalize-space(translate($chapterTitle, '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"/>
                                <xsl:if test="string-length($chSubTitle) &gt; 0">
                                    <xsl:value-of select="' '"/> 
                                    <xsl:value-of select="$chSubTitle"/>
                                </xsl:if>                       
                            </xsl:attribute>
                        </xsl:otherwise>
                    </xsl:choose>-->
                                       
                </xsl:when>
                <xsl:when test="self::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FrontMatterHeading']">
                    <xsl:variable name="chapterTitle">
                        <xsl:for-each select="descendant-or-self::Content">
                            <xsl:value-of select="."/>
                        </xsl:for-each>
                    </xsl:variable>
                    <xsl:variable name="forEachText">
                        <xsl:value-of select="normalize-space(translate($chapterTitle, '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"/>
                        <xsl:if test="string-length($chSubTitle) &gt; 0">
                            <xsl:value-of select="' '"/> 
                            <xsl:value-of select="$chSubTitle"/>
                        </xsl:if>                     
                    </xsl:variable>
                    <xsl:choose>                    
                        <xsl:when test="count(self::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FrontMatterHeading']) = 1 and $count = 1">
                            <xsl:variable name="attName">
                                <xsl:value-of select="'ChapterTitle'"/>
                            </xsl:variable>
                            <xsl:attribute name="{$attName}">
                                <xsl:value-of select="$forEachText"/>
                            </xsl:attribute>
                            <xsl:attribute name="BbChapterTitle_styleName">
                                <xsl:value-of select="normalize-space(substring-after(@AppliedParagraphStyle,'ParagraphStyle/'))"/>
                            </xsl:attribute>
                             <xsl:attribute name="BbChapterTitle">
                                 <xsl:variable name="chapterTitle">
                                     <xsl:call-template name="CharacterStyleRange"/>
                                 </xsl:variable>
                                 <xsl:if test="string-length($chapterTitle)&gt; 0">
                                     <xsl:value-of select="normalize-space($chapterTitle)"/>
                                 </xsl:if>
                                 <xsl:if test="string-length($chSubTitle1) &gt; 0">
                                     <xsl:value-of select="': '"/>
                                     <xsl:value-of select="normalize-space($chSubTitle1)"/>
                                 </xsl:if>
                            </xsl:attribute>
                        </xsl:when>
                         <xsl:when test="string-length($findTOC) &gt; 0">
                            <xsl:attribute name="ChapterTitle">
                            <xsl:value-of select="$findTOC"/>
                            </xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:variable name="attName">
                                <xsl:value-of select="concat('frontMatterHeading',position())"/>
                            </xsl:variable>
                            <xsl:attribute name="{$attName}">
                                <xsl:value-of select="$forEachText"/>
                            </xsl:attribute>
                            <xsl:attribute name="BbChapterTitle_styleName">
                                <xsl:value-of select="normalize-space(substring-after(@AppliedParagraphStyle,'ParagraphStyle/'))"/>
                            </xsl:attribute>
                             <xsl:attribute name="BbChapterTitle">
                                 <xsl:variable name="chapterTitle">
                                     <xsl:call-template name="CharacterStyleRange"/>
                                 </xsl:variable>
                                 <xsl:if test="string-length($chapterTitle)&gt; 0">
                                     <xsl:value-of select="normalize-space($chapterTitle)"/>
                                 </xsl:if>
                                 <xsl:if test="string-length($chSubTitle1) &gt; 0">
                                     <xsl:value-of select="': '"/>
                                     <xsl:value-of select="normalize-space($chSubTitle1)"/>
                                 </xsl:if>
                            </xsl:attribute>
                        </xsl:otherwise>
                    </xsl:choose>                  
                                      
                </xsl:when>
                <xsl:when test="self::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FB_Copy_Right_First']">
                    <xsl:variable name="copyright" select="self::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FB_Copy_Right_First']"/>
                    <xsl:if test="string-length($copyright) &gt; 0">
                        <xsl:attribute name="ChapterTitle">
                            <xsl:value-of select="'Copyright'"/>
                        </xsl:attribute>
                    </xsl:if>
                </xsl:when>           
                <xsl:when test="self::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FB_Half_Title']">
                    <xsl:variable name="copyright" select="self::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FB_Half_Title']"/>
                    <xsl:if test="string-length($copyright) &gt; 0">
                        <xsl:attribute name="ChapterTitle">
                            <xsl:value-of select="'Title'"/>
                        </xsl:attribute>
                    </xsl:if>
                </xsl:when>
                <xsl:when test="self::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FB_Book_Title']">
                    <xsl:variable name="bkTitle" select="self::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FB_Book_Title']"/>
                    <xsl:if test="string-length($bkTitle) &gt; 0">
                        <xsl:attribute name="ChapterTitle">
                            <xsl:value-of select="'BookTitle'"/>
                        </xsl:attribute>
                    </xsl:if>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>       
    
    </xsl:template>
    
    <xsl:template name="chapterSubTitle">
        
        <xsl:param name="chSubTitleVal"/>
        <xsl:for-each select="descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/SubTitle']">
            <xsl:choose>            
                <xsl:when test="self::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/SubTitle']">
                    <xsl:variable name="Val">
                        <xsl:value-of select="normalize-space(translate(., '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"/>
                    </xsl:variable>
                    <xsl:if test="string-length($Val) &gt; 0">
                        <xsl:attribute name="ChapterSubTitle"> 
                               <xsl:value-of select="'Value is true'"/>                       
                         </xsl:attribute>
                    </xsl:if>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
        
    </xsl:template>
    
    <xsl:template name="chapterNumber">
        <xsl:param name="chNVal"/>
        <xsl:for-each select="descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/ChapterNumber']">
            <xsl:choose>            
                <xsl:when test="self::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/ChapterNumber']">
                    <xsl:attribute name="ChapterNumber_styleName">
                        <xsl:value-of select="normalize-space(substring-after(@AppliedParagraphStyle,'ParagraphStyle/'))"/>
                    </xsl:attribute>
                    <xsl:attribute name="ChapterNumber">               
                        <!--<xsl:value-of select="normalize-space(translate(., '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"/>-->
                        <xsl:variable name="cn">
                            <xsl:call-template name="CharacterStyleRange"/>
                        </xsl:variable>
                        <xsl:if test="string-length($cn) &gt; 0">
                        <xsl:value-of select="normalize-space($cn)"/>
                        </xsl:if>
                    </xsl:attribute>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="PartTitle">
        <xsl:param name="pTVal"/>
        <xsl:for-each select="descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/PartTitle']">
            <xsl:choose>            
                <xsl:when test="self::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/PartTitle']">
                    <xsl:attribute name="PartTitle_styleName">
                        <xsl:value-of select="normalize-space(substring-after(@AppliedParagraphStyle,'ParagraphStyle/'))"/>
                    </xsl:attribute>
                    <xsl:attribute name="PartTitle">
                        <xsl:variable name="partTitle">
                            <xsl:for-each select="descendant-or-self::Content">
                                <xsl:value-of select="."/>
                            </xsl:for-each>
                        </xsl:variable>
                        <xsl:value-of select="normalize-space(translate($partTitle, '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"/>                   
                    </xsl:attribute>
                    <xsl:attribute name="BbPartTitle">
                        <xsl:variable name="bp">
                            <xsl:call-template name="CharacterStyleRange"/>  
                        </xsl:variable>
                        <xsl:if test="string-length($bp) &gt; 0">
                        <xsl:value-of select="normalize-space($bp)"/>
                        </xsl:if>
                    </xsl:attribute>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="PartNumber">
        <xsl:param name="pNVal"/>
        <xsl:for-each select="descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/PartNumber']">
            <xsl:choose>            
                <xsl:when test="self::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/PartNumber']">
                    <xsl:attribute name="PartNumber_styleName">
                        <xsl:value-of select="normalize-space(substring-after(@AppliedParagraphStyle,'ParagraphStyle/'))"/>
                    </xsl:attribute>
                    <xsl:attribute name="PartNumber">
                        <xsl:value-of select="normalize-space(translate(., '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"/>           
                    </xsl:attribute>
                    <xsl:attribute name="BbPartNumber">
                        <xsl:variable name="BPn">
                    <xsl:call-template name="CharacterStyleRange"/>
                        </xsl:variable>
                        <xsl:if test="string-length($BPn) &gt; 0">
                            <xsl:value-of select="normalize-space($BPn)"/>
                        </xsl:if>
                    </xsl:attribute>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="UnitTitle">
        <xsl:param name="uTVal"/>
        <xsl:for-each select="descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/UnitTitle']">
            <xsl:choose>            
                <xsl:when test="self::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/UnitTitle']">
                    <xsl:attribute name="UnitTitle_styleName">
                        <xsl:value-of select="normalize-space(substring-after(@AppliedParagraphStyle,'ParagraphStyle/'))"/>
                    </xsl:attribute>
                    <xsl:attribute name="UnitTitle">
                        <xsl:variable name="unitTitle">
                            <xsl:for-each select="descendant-or-self::Content">
                                <xsl:value-of select="."/>
                            </xsl:for-each>
                        </xsl:variable>
                        <xsl:value-of select="normalize-space(translate($unitTitle, '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"/>                
                    </xsl:attribute>
                    <xsl:attribute name="BbUnitTitle">
                        <xsl:variable name="BUT">
                        <xsl:call-template name="CharacterStyleRange"/>
                        </xsl:variable>
                        <xsl:if test="string-length($BUT) &gt; 0">
                            <xsl:value-of select="normalize-space($BUT)"/>
                        </xsl:if>
                    </xsl:attribute>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="UnitNumber">
        <xsl:param name="uNVal"/>
        <xsl:for-each select="descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/UnitNumber']">
            <xsl:choose>            
                <xsl:when test="self::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/UnitNumber']">
                    <xsl:attribute name="UnitNumber_styleName">
                        <xsl:value-of select="normalize-space(substring-after(@AppliedParagraphStyle,'ParagraphStyle/'))"/>
                    </xsl:attribute>
                    <xsl:attribute name="UnitNumber">
                        <xsl:value-of select="normalize-space(translate(., '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"/>               
                    </xsl:attribute>
                    <xsl:attribute name="BbUnitNumber">
                        <xsl:variable name="bUn">
                            <xsl:call-template name="CharacterStyleRange"/>
                        </xsl:variable>
                        <xsl:if test="string-length($bUn) &gt; 0">
                            <xsl:value-of select="normalize-space($bUn)"/>
                        </xsl:if>               
                    </xsl:attribute>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="SectionTitle">
        <xsl:param name="sTVal"/>
        <xsl:for-each select="descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/SectionTitle']">
            <xsl:choose>            
                <xsl:when test="self::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/SectionTitle']">
                    <xsl:attribute name="SectionTitle_styleName">
                        <xsl:value-of select="normalize-space(substring-after(@AppliedParagraphStyle,'ParagraphStyle/'))"/>
                    </xsl:attribute>
                    <xsl:attribute name="SectionTitle">
                        <xsl:variable name="sectionTitle">
                            <xsl:for-each select="descendant-or-self::Content">
                                <xsl:value-of select="."/>
                            </xsl:for-each>
                        </xsl:variable>
                        <xsl:value-of select="normalize-space(translate($sectionTitle, '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"/>                
                    </xsl:attribute>
                    <xsl:attribute name="BbSectionTitle">
                        <xsl:variable name="BST">
                            <xsl:call-template name="CharacterStyleRange"/>
                        </xsl:variable>
                        <xsl:if test="string-length($BST) &gt; 0">
                            <xsl:value-of select="normalize-space($BST)"/>
                        </xsl:if> 
                    </xsl:attribute>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="SectionNumber">
        <xsl:param name="sNVal"/>
        <xsl:for-each select="descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/SectionNumber']">
            <xsl:choose>            
                <xsl:when test="self::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/SectionNumber']">
                    <xsl:attribute name="SectionNumber_styleName">
                        <xsl:value-of select="normalize-space(substring-after(@AppliedParagraphStyle,'ParagraphStyle/'))"/>
                    </xsl:attribute>
                    <xsl:attribute name="SectionNumber">
                        <xsl:value-of select="normalize-space(translate(., '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"/>
                    </xsl:attribute>
                    <xsl:attribute name="BbSectionNumber">
                        <xsl:variable name="BSn">
                            <xsl:call-template name="CharacterStyleRange"/>
                        </xsl:variable>
                        <xsl:if test="string-length($BSn) &gt; 0">
                            <xsl:value-of select="normalize-space($BSn)"/>
                        </xsl:if> 
                    </xsl:attribute>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="find_For_External_Link">
        <xsl:param name="FigCapVal"/>  
        <xsl:choose>
            <xsl:when test="descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/TableCaption']">               
                    <xsl:attribute name="tables">
                        
                        <xsl:for-each select="descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/TableCaption']">
                            <xsl:analyze-string select="." regex="([Tt][Aa][Bb][Ll][Ee])([ ])([0-9])([\.-&#x2013;&#x02014;])([0-9])">
                                 <xsl:matching-substring>
                                     <xsl:value-of select="regex-group(1)"/>
                                     <xsl:value-of select="regex-group(2)"/>
                                     <xsl:value-of select="regex-group(3)"/>
                                     <xsl:value-of select="regex-group(4)"/>
                                     <xsl:value-of select="regex-group(5)"/>
                                 </xsl:matching-substring>
                             </xsl:analyze-string>
                            <xsl:analyze-string select="." regex="([Tt][Bb][Ll])([ ])([0-9])([\.-&#x2013;&#x02014;])([0-9])">
                                <xsl:matching-substring>
                                    <xsl:value-of select="regex-group(1)"/>
                                    <xsl:value-of select="regex-group(2)"/>
                                    <xsl:value-of select="regex-group(3)"/>
                                    <xsl:value-of select="regex-group(4)"/>
                                    <xsl:value-of select="regex-group(5)"/>
                                </xsl:matching-substring>
                            </xsl:analyze-string>
                        </xsl:for-each>
                        
                    </xsl:attribute>
            </xsl:when>
            <xsl:when test="descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FigureLegend']">                 
                    <xsl:attribute name="figures">
                  
                           <xsl:for-each select="descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FigureLegend']"> 
                               <xsl:analyze-string select="." regex="([Mm][Aa][Pp])([ ])([0-9])([\.-&#x2013;&#x02014;])([0-9])">
                                    <xsl:matching-substring>
                                        <xsl:value-of select="regex-group(1)"/>
                                        <xsl:value-of select="regex-group(2)"/>
                                        <xsl:value-of select="regex-group(3)"/>
                                        <xsl:value-of select="regex-group(4)"/>
                                        <xsl:value-of select="regex-group(5)"/>
                                    </xsl:matching-substring>
                                </xsl:analyze-string>
                               <xsl:analyze-string select="." regex="([Ff][Ii][Gg][Uu][Rr][Ee])([ ])([0-9])([\.-&#x2013;&#x02014;])">
                                    <xsl:matching-substring>
                                        <xsl:value-of select="regex-group(1)"/>
                                        <xsl:value-of select="regex-group(2)"/>
                                        <xsl:value-of select="regex-group(3)"/>
                                        <xsl:value-of select="regex-group(4)"/>
                                    </xsl:matching-substring>
                                </xsl:analyze-string>
                               <xsl:analyze-string select="." regex="([Ff][Ii][Gg][Uu][Rr][Ee])([ ])([0-9])([\.-&#x2013;&#x02014;])([0-9])">
                                    <xsl:matching-substring>
                                        <xsl:value-of select="regex-group(1)"/>
                                        <xsl:value-of select="regex-group(2)"/>
                                        <xsl:value-of select="regex-group(3)"/>
                                        <xsl:value-of select="regex-group(4)"/>
                                        <xsl:value-of select="regex-group(5)"/>
                                    </xsl:matching-substring>
                                </xsl:analyze-string>
                           </xsl:for-each>
                                            
                    </xsl:attribute>
            </xsl:when>
                      
        </xsl:choose>
       
    </xsl:template>
    
    <xsl:template name="DocumentAuthor">
        <xsl:param name="DocumentAuthorTVal"/>
        <xsl:for-each select="descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/DocumentAuthor']">
            <xsl:attribute name="BbDocumentAuthor_styleName">
                <xsl:value-of select="normalize-space(substring-after(@AppliedParagraphStyle,'ParagraphStyle/'))"/>
            </xsl:attribute>
            <xsl:attribute name="BbDocumentAuthor">
                <!--<xsl:value-of select="normalize-space(translate(., '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"/>-->
                <xsl:variable name="DA">
                    <xsl:call-template name="CharacterStyleRange"/>
                </xsl:variable>
                <xsl:if test="string-length($DA) &gt; 0">
                    <xsl:value-of select="normalize-space($DA)"/>
                </xsl:if> 
            </xsl:attribute>
        </xsl:for-each>
    </xsl:template>
        
    <xsl:template name="styleName">
        <xsl:param name="styleNameVal"/>
        <xsl:for-each select="descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FrontMatterHeading'] | descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FB_IndexHeading'] | descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/DocumentAuthor'] | descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/BackMatterHeading'] | descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/ChapterTitle'] | descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/PartTitle'] | descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/UnitTitle']| descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/SectionTitle']">
            <xsl:attribute name="styleName">
                <xsl:value-of select="normalize-space(substring-after(@AppliedParagraphStyle,'ParagraphStyle/'))"/>
            </xsl:attribute>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="CharacterStyleRange">
        <xsl:for-each select="descendant-or-self::CharacterStyleRange">
            <xsl:variable name="FST" select="@FontStyle"/>
            <xsl:variable name="PT" select="@Position"/>
            <xsl:variable name="Cap" select="@Capitalization"/>
            <xsl:variable name="UL" select="@Underline"/>
            <xsl:variable name="Charstyle2">
                <xsl:if test="$FST,'[\s]'">
                    <xsl:value-of select="replace($FST, ' ', '_')"/>
                </xsl:if>
                <xsl:if test="$PT,'[\s]'">
                    <xsl:value-of select="replace($PT, ' ', '_')"/>
                </xsl:if>
                <xsl:if test="$Cap,'[\s]'">
                    <xsl:value-of select="replace($Cap, ' ', '_')"/>
                </xsl:if>
                <xsl:if test="$UL,'[\s]'">
                    <xsl:value-of select="replace($UL, ' ', '_')"/>
                </xsl:if>
            </xsl:variable>
            <xsl:variable name="Charstyle0" select="lower-case($Charstyle2)"/>
            <xsl:choose>
                <xsl:when test="contains($Charstyle0,'smallcaps') or contains($Charstyle0,'allcaps') or @Underline = 'true' or StrikeThru='true' or  contains($Charstyle0,'heavy') or  contains($Charstyle0,'bold') or contains($Charstyle0,'italic') or contains($Charstyle0,'oblique')">
                    <xsl:if test="contains($Charstyle0,'smallcaps')">
                        <xsl:text disable-output-escaping="yes">&lt;</xsl:text>
                        <xsl:value-of select="'sc'"/>
                        <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                    </xsl:if>
                    <xsl:if test="contains($Charstyle0,'allcaps')">
                        <xsl:text disable-output-escaping="yes">&lt;</xsl:text>
                        <xsl:value-of select="'sc'"/>
                        <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                    </xsl:if>								
                    <xsl:if test="@Underline ='true'">
                        <xsl:text disable-output-escaping="yes">&lt;u&gt;</xsl:text>
                    </xsl:if>									
                    <xsl:if test="@StrikeThru='true'">
                        <xsl:text disable-output-escaping="yes">&lt;</xsl:text>
                        <xsl:value-of select="'strike'"/>
                        <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                    </xsl:if>		
                    <xsl:if test="contains($Charstyle0,'bold') or contains($Charstyle0,'medium')  or contains($Charstyle0,'heavy')">
                        <xsl:text disable-output-escaping="yes">&lt;</xsl:text>
                        <xsl:value-of select="'b'"/>
                        <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                    </xsl:if>
                    <xsl:if test="contains($Charstyle0,'italic') or contains($Charstyle0,'oblique')">
                        <xsl:text disable-output-escaping="yes">&lt;</xsl:text>
                        <xsl:value-of select="'i'"/>
                        <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                    </xsl:if>							
                    <xsl:if test="contains($Charstyle0,'superscript')">
                        <xsl:text disable-output-escaping="yes">&lt;</xsl:text>
                        <xsl:value-of select="'sup'"/>
                        <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                    </xsl:if>	
                    <xsl:if test="contains($Charstyle0,'subscript')">
                        <xsl:text disable-output-escaping="yes">&lt;</xsl:text>
                        <xsl:value-of select="'Sub'"/>
                        <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                    </xsl:if>
                    
                    <xsl:value-of select="translate(., '&#x9;|&#xA;|&#8232;|&#x00AD;', '')"/>
                    
                    <xsl:if test="contains($Charstyle0,'subscript')">
                        <xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
                        <xsl:value-of select="'Sub'"/>
                        <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                    </xsl:if>
                    <xsl:if test="contains($Charstyle0,'superscript')">
                        <xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
                        <xsl:value-of select="'sup'"/>
                        <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                    </xsl:if>	
                    <xsl:if test="contains($Charstyle0,'italic') or contains($Charstyle0,'oblique')">
                        <xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
                        <xsl:value-of select="'i'"/>
                        <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                    </xsl:if>							
                    <xsl:if test="contains($Charstyle0,'bold') or contains($Charstyle0,'medium')  or contains($Charstyle0,'heavy')">
                        <xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
                        <xsl:value-of select="'b'"/>
                        <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                    </xsl:if>
                    <xsl:if test="@StrikeThru='true'">
                        <xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
                        <xsl:value-of select="'strike'"/>
                        <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                    </xsl:if>		
                    <xsl:if test="@Underline = 'true'">
                        <xsl:text disable-output-escaping="yes">&lt;/u&gt;</xsl:text>
                    </xsl:if>									
                    <xsl:if test="contains($Charstyle0,'allcaps')">
                        <xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
                        <xsl:value-of select="'sc'"/>
                        <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                    </xsl:if>
                    <xsl:if test="contains($Charstyle0,'smallcaps')">
                        <xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
                        <xsl:value-of select="'sc'"/>
                        <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                    </xsl:if>                  
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="translate(., '&#x9;|&#xA;|&#8232;|&#x00AD;', '')"/>
                </xsl:otherwise>
            </xsl:choose>  
        </xsl:for-each>
    </xsl:template>
    </xsl:stylesheet>