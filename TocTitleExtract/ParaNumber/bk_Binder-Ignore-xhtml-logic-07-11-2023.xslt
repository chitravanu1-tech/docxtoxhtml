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
    <!-- Added to include the manual charcterstyle formattings on 11-10-2022 -->
    <!--05-10-2023 below for-each commented for duplicate DocumentAuthor comes when like span had been i tag-->
    <!--02-11-2023 commented for unable to match heading level for TOC process   -->
    <!-- 02-11-2023 below condition commented for azure id 11767 with unwanted content-->
    <!-- 02-11-2023 commented <xsl:for-each select="descendant-or-self::Content"> duplicate content comes -->
    <xsl:param name="allSpaceCharacterEntity"
        select="'&#8232;|&#x0020;|&#xa0;|&#x00A0;|&#xA;|&#x9;|&#x2028;|&#8194;|&#8195;|&#x00009;|&#x0000A;|&#x02002;|&#x02003;|&#x02004;|&#x02005;|&#x02007;|&#x02008;|&#x02009;|&#x0200A;|&#x0200B;|&#x0200C;|&#x0200D;|&#x0200E;|&#x0200F;|&#x0205F;|&#x02060;|&#x02061;|&#x02062;|&#x02063;|&#x000AD;|&#x000A0;'"/>
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
        <xsl:if test="descendant::p[@class = 'TOC_ChapterTitle'] | descendant::p[@class = 'TOC_ChapterSubTitle'] | descendant::p[@class = 'TOC_PartTitle'] | descendant::p[@class = 'TOC_SectionTitle'] | descendant::p[@class = 'TOC_UnitTitle'] | descendant::p[@class = 'WordStyles%3aTOC_ChapterTitle'] | descendant::p[@class = 'WordStyles%3aTOC_ChapterSubTitle'] | descendant::p[@class = 'WordStyles%3aTOC_PartTitle'] | descendant::p[@class = 'WordStyles%3aTOC_SectionTitle'] | descendant::p[@class = 'WordStyles%3aTOC_UnitTitle']">
            <xsl:variable name="findGroupedTitle" select="descendant::grouped/p/span/Content"/>
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
                            <xsl:value-of select="'SeriesTitle'"/>
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

                    <xsl:variable name="find-Dedication">
                        <xsl:for-each select="descendant::p">
                            <xsl:variable name="checkContentValues"
                                select="count(descendant::Content)"/>
                            <xsl:if
                                test="string-length(normalize-space(.)) &gt; 0 and $checkContentValues &gt; 0">
                                <xsl:if test="@class = 'TOC_FrontMatter'">

                                    <xsl:variable name="title">
                                        <xsl:value-of select="descendant::Content"/>
                                    </xsl:variable>

                                    <xsl:variable name="val">
                                        <xsl:value-of
                                            select="normalize-space(replace($title, '&#x00A0;|&#xA;|&#x9;|&#x2028;|&#8194;|&#8195;', ' '))"/>

                                    </xsl:variable>

                                    <xsl:variable name="txt1">
                                        <xsl:choose>
                                            <xsl:when
                                                test="matches($val, ' ([0-9]?[0-9]?[0-9])$') or matches(normalize-space($val), ' ([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])$')">
                                                <xsl:value-of
                                                  select="concat(' ', tokenize($val, ' ')[last()])"
                                                />
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="$val"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:variable>

                                    <xsl:variable name="txt2">
                                        <xsl:choose>
                                            <xsl:when test="contains($val, $txt1)">
                                                <xsl:choose>
                                                  <xsl:when test="$val = $txt1">
                                                  <xsl:value-of select="$val"/>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:value-of
                                                  select="substring-before($val, $txt1)"/>
                                                  </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="$val"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:variable>
                                    <xsl:if
                                        test="(lower-case($txt2) = 'dedication') or (lower-case($val) = 'dedication')">
                                        <xsl:choose>
                                            <xsl:when test="$txt2">
                                                <xsl:value-of
                                                  select="replace(normalize-space($txt2), ' $| $|&#8232;', '')"
                                                />
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of
                                                  select="normalize-space(translate($val, '&#8232;', ''))"
                                                />
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:if>
                                </xsl:if>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:variable>
                    <xsl:if test="not(string-length($find-Dedication) &gt; 0)">
                        <xsl:text>&#x000A;</xsl:text>
                        <xsl:element name="Toc">
                            <xsl:attribute name="TOCChapterTitle">
                                <xsl:value-of select="'Dedication'"/>
                            </xsl:attribute>
                        </xsl:element>
                    </xsl:if>

                    <xsl:variable name="find-Epigraph">
                        <xsl:for-each select="descendant::p">
                            <xsl:variable name="checkContentValues"
                                select="count(descendant::Content)"/>
                            <xsl:if
                                test="string-length(normalize-space(.)) &gt; 0 and $checkContentValues &gt; 0">
                                <xsl:if test="@class = 'TOC_FrontMatter'">

                                    <xsl:variable name="title">
                                        <xsl:value-of select="descendant::Content"/>
                                    </xsl:variable>

                                    <xsl:variable name="val">
                                        <xsl:value-of
                                            select="normalize-space(replace($title, '&#x00A0;|&#xA;|&#x9;|&#x2028;|&#8194;|&#8195;', ' '))"/>

                                    </xsl:variable>

                                    <xsl:variable name="txt1">
                                        <xsl:choose>
                                            <xsl:when
                                                test="matches($val, ' ([0-9]?[0-9]?[0-9])$') or matches(normalize-space($val), ' ([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])$')">
                                                <xsl:value-of
                                                  select="concat(' ', tokenize($val, ' ')[last()])"
                                                />
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="$val"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:variable>

                                    <xsl:variable name="txt2">
                                        <xsl:choose>
                                            <xsl:when test="contains($val, $txt1)">
                                                <xsl:choose>
                                                  <xsl:when test="$val = $txt1">
                                                  <xsl:value-of select="$val"/>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:value-of
                                                  select="substring-before($val, $txt1)"/>
                                                  </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="$val"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:variable>
                                    <xsl:if
                                        test="(lower-case($txt2) = 'epigraph') or (lower-case($val) = 'epigraph')">
                                        <xsl:choose>
                                            <xsl:when test="$txt2">
                                                <xsl:value-of
                                                  select="replace(normalize-space($txt2), ' $| $|&#8232;', '')"
                                                />
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of
                                                  select="normalize-space(translate($val, '&#8232;', ''))"
                                                />
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:if>
                                </xsl:if>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:variable>
                    <xsl:if test="not(string-length($find-Epigraph) &gt; 0)">
                        <xsl:text>&#x000A;</xsl:text>
                        <xsl:element name="Toc">
                            <xsl:attribute name="TOCChapterTitle">
                                <xsl:value-of select="'Epigraph'"/>
                            </xsl:attribute>
                        </xsl:element>
                    </xsl:if>

                    <xsl:variable name="find-Contents">
                        <xsl:for-each select="descendant::p">
                            <xsl:variable name="checkContentValues"
                                select="count(descendant::Content)"/>
                            <xsl:if
                                test="string-length(normalize-space(.)) &gt; 0 and $checkContentValues &gt; 0">
                                <xsl:if test="@class = 'TOC_FrontMatter'">

                                    <xsl:variable name="title">
                                        <xsl:value-of select="descendant::Content"/>
                                    </xsl:variable>

                                    <xsl:variable name="val">
                                        <xsl:value-of
                                            select="normalize-space(replace($title, '&#x00A0;|&#xA;|&#x9;|&#x2028;|&#8194;|&#8195;', ' '))"/>

                                    </xsl:variable>

                                    <xsl:variable name="txt1">
                                        <xsl:choose>
                                            <xsl:when
                                                test="matches($val, ' ([0-9]?[0-9]?[0-9])$') or matches(normalize-space($val), ' ([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])$')">
                                                <xsl:value-of
                                                  select="concat(' ', tokenize($val, ' ')[last()])"
                                                />
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="$val"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:variable>

                                    <xsl:variable name="txt2">
                                        <xsl:choose>
                                            <xsl:when test="contains($val, $txt1)">
                                                <xsl:choose>
                                                  <xsl:when test="$val = $txt1">
                                                  <xsl:value-of select="$val"/>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:value-of
                                                  select="substring-before($val, $txt1)"/>
                                                  </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="$val"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:variable>
                                    <xsl:if
                                        test="(lower-case($txt2) = 'contents') or (lower-case($val) = 'contents')">
                                        <xsl:choose>
                                            <xsl:when test="$txt2">
                                                <xsl:value-of
                                                  select="replace(normalize-space($txt2), ' $| $|&#8232;', '')"
                                                />
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of
                                                  select="normalize-space(translate($val, '&#8232;', ''))"
                                                />
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:if>
                                </xsl:if>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:variable>
                    <xsl:if test="not(string-length($find-Contents) &gt; 0)">
                        <xsl:text>&#x000A;</xsl:text>
                        <xsl:element name="Toc">
                            <xsl:attribute name="TOCChapterTitle">
                                <xsl:value-of select="'Contents'"/>
                            </xsl:attribute>
                        </xsl:element>
                    </xsl:if>

                    <xsl:for-each select="descendant::p">
                        <xsl:variable name="checkContentValues" select="count(descendant::Content)"/>
                        <xsl:if
                            test="string-length(normalize-space(.)) &gt; 0 and $checkContentValues &gt; 0">

                            <xsl:if test="@class = 'TOC_FrontMatter'">
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
                                            <xsl:value-of
                                                select="normalize-space(replace($title, '&#x00A0;|&#xA;|&#x9;|&#x2028;|&#8194;|&#8195;', ' '))"/>
                                            <!--</xsl:otherwise>
                                            </xsl:choose>-->
                                        </xsl:variable>

                                        <xsl:variable name="txt1">
                                            <xsl:choose>
                                                <xsl:when
                                                  test="matches($val, ' ([0-9]?[0-9]?[0-9])$') or matches(normalize-space($val), ' ([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])$')">
                                                  <xsl:value-of
                                                  select="concat(' ', tokenize($val, ' ')[last()])"
                                                  />
                                                </xsl:when>
                                                <xsl:otherwise>
                                                  <xsl:value-of select="$val"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>

                                        <xsl:variable name="txt2">
                                            <xsl:choose>
                                                <xsl:when test="contains($val, $txt1)">
                                                  <xsl:choose>
                                                  <xsl:when test="$val = $txt1">
                                                  <xsl:value-of select="$val"/>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:value-of
                                                  select="substring-before($val, $txt1)"/>
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
                                                <xsl:value-of
                                                  select="replace(normalize-space($txt2), ' $| $|&#8232;', '')"
                                                />
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <!--                                                <xsl:value-of select="normalize-space($val)"/>-->
                                                <xsl:value-of
                                                  select="normalize-space(translate($val, '&#8232;', ''))"
                                                />
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:attribute>
                                    <xsl:if
                                        test="descendant::XMLAttribute[@Self/matches(., 'XMLAttributenid')]/@Value">
                                        <xsl:attribute name="chapterId">
                                            <xsl:value-of
                                                select="descendant::XMLAttribute[@Self/matches(., 'XMLAttributenid')]/@Value"
                                            />
                                        </xsl:attribute>
                                    </xsl:if>
                                </xsl:element>
                            </xsl:if>
                            <xsl:if
                                test="self::*[@class = 'TOC_ChapterNumber'][following-sibling::*[1][@class = 'TOC_ChapterNumber']]">
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
                                            <xsl:value-of
                                                select="normalize-space(replace($title, '&#x00A0;|&#xA;|&#x9;|&#x2028;|&#8194;|&#8195;', ' '))"/>
                                            <!--</xsl:otherwise>
                                            </xsl:choose>-->
                                        </xsl:variable>

                                        <!--  <xsl:variable name="txt1">
                                            <xsl:choose>
                                                <xsl:when
                                                  test="matches($val, ' ([0-9]?[0-9]?[0-9])$') or matches(normalize-space($val), ' ([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])$')">
                                                  <xsl:value-of
                                                  select="concat(' ', tokenize($val, ' ')[last()])"
                                                  />
                                                </xsl:when>
                                                <xsl:otherwise>
                                                  <xsl:value-of select="$val"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>-->

                                        <xsl:variable name="txt1">
                                            <xsl:choose>
                                                <xsl:when
                                                  test="matches($val, '([ ])?([0-9]?[0-9]?[0-9])$')">
                                                  <xsl:value-of
                                                  select="replace($val, '([ ])?([0-9]?[0-9]?[0-9])$', '')"
                                                  />
                                                </xsl:when>
                                                <xsl:when
                                                  test="matches(normalize-space($val), '([ ])([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])$')">
                                                  <xsl:value-of
                                                  select="replace($val, '([ ])([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])$', '')"
                                                  />
                                                </xsl:when>
                                                <xsl:otherwise>
                                                  <xsl:value-of select="$val"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>

                                        <!-- <xsl:variable name="txt2">
                                            <xsl:choose>
                                                <xsl:when test="contains($val, $txt1)">
                                                  <xsl:choose>
                                                  <xsl:when test="$val = $txt1">
                                                  <xsl:value-of select="$val"/>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:value-of
                                                  select="substring-before($val, $txt1)"/>
                                                  </xsl:otherwise>
                                                  </xsl:choose>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                  <xsl:value-of select="$val"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>-->

                                        <xsl:choose>
                                            <xsl:when test="$txt1">
                                                <xsl:value-of
                                                  select="replace(normalize-space($txt1), ' $| $|&#8232;', '')"
                                                />
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <!--                                                <xsl:value-of select="normalize-space($val)"/>-->
                                                <xsl:value-of
                                                  select="normalize-space(translate($val, '&#8232;', ''))"
                                                />
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:attribute>
                                    <xsl:if
                                        test="descendant::XMLAttribute[@Self/matches(., 'XMLAttributenid')]/@Value">
                                        <xsl:attribute name="chapterId">
                                            <xsl:value-of
                                                select="descendant::XMLAttribute[@Self/matches(., 'XMLAttributenid')]/@Value"
                                            />
                                        </xsl:attribute>
                                    </xsl:if>
                                </xsl:element>
                            </xsl:if>
                            <xsl:if
                                test="@class = 'TOC_ChapterTitle' or @class = 'TOC_ChapterSubTitle'">

                                <xsl:variable name="ChSubTitle">
                                    <xsl:choose>
                                        <xsl:when
                                            test="following-sibling::*[1][@class = 'TOC_ChapterSubTitle']">
                                            <xsl:value-of
                                                select="following-sibling::*[1][@class = 'TOC_ChapterSubTitle']/normalize-space(.)"
                                            />
                                        </xsl:when>
                                        <xsl:when
                                            test="parent::XMLElement[following-sibling::*[1][@class = 'TOC_ChapterSubTitle']]">
                                            <xsl:value-of
                                                select="parent::XMLElement/following-sibling::*[1][@class = 'TOC_ChapterSubTitle']/normalize-space(.)"
                                            />
                                        </xsl:when>
                                    </xsl:choose>
                                    <!--  <xsl:if test="preceding-sibling::*[1][@class = 'TOC_ChapterNumber']">                              
                                    <xsl:value-of select="preceding-sibling::*[1][@class = 'TOC_ChapterNumber']/normalize-space(.)"/>
                                </xsl:if>-->
                                </xsl:variable>

                                <xsl:variable name="ChNo">
                                    <xsl:choose>
                                        <xsl:when
                                            test="preceding-sibling::*[1][@class = 'TOC_ChapterNumber']">
                                            <xsl:value-of
                                                select="preceding-sibling::*[1][@class = 'TOC_ChapterNumber']/normalize-space(.)"
                                            />
                                        </xsl:when>
                                        <xsl:when
                                            test="parent::XMLElement[preceding-sibling::*[1][@class = 'TOC_ChapterNumber']]">
                                            <xsl:value-of
                                                select="parent::XMLElement/preceding-sibling::*[1][@class = 'TOC_ChapterNumber']/normalize-space(.)"
                                            />
                                        </xsl:when>
                                    </xsl:choose>
                                    <!--  <xsl:if test="preceding-sibling::*[1][@class = 'TOC_ChapterNumber']">                              
                                    <xsl:value-of select="preceding-sibling::*[1][@class = 'TOC_ChapterNumber']/normalize-space(.)"/>
                                </xsl:if>-->
                                </xsl:variable>

                                <xsl:text>&#x000A;</xsl:text>
                                <xsl:element name="Toc">
                                    <xsl:attribute name="TOCChapterTitle">

                                        <xsl:variable name="title">
                                            <xsl:for-each select="descendant::span">
                                                <xsl:choose>
                                                  <xsl:when
                                                  test="@class = 'CharacterStyle/WordStyles%3apageno' or matches(@class, 'pageno')"/>
                                                  <xsl:when
                                                  test="@class = 'CharacterStyle/pageno' or matches(@class, 'pageno')"/>
                                                  <xsl:otherwise>
                                                  <xsl:for-each select="descendant-or-self::Content">
                                                  <xsl:if
                                                  test="string-length(descendant-or-self::Content) &gt; 0">
                                                  <xsl:value-of select="descendant-or-self::Content"
                                                  />
                                                  </xsl:if>
                                                  </xsl:for-each>
                                                  </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:for-each>
                                        </xsl:variable>

                                        <xsl:variable name="val">
                                            <xsl:value-of
                                                select="normalize-space(replace($title, $allSpaceCharacterEntity, ' '))"
                                            />
                                        </xsl:variable>

                                        <xsl:variable name="txt1">
                                            <xsl:choose>
                                                <xsl:when
                                                  test="matches($val, '([ ])([0-9]?[0-9]?[0-9])$')">
                                                  <!-- <xsl:variable name="removePageNo">
                                                        <xsl:value-of select="tokenize($val,' ')[last()]"/>
                                                    </xsl:variable>-->
                                                  <xsl:value-of
                                                  select="replace($val, '([ ])([0-9]?[0-9]?[0-9])$', '')"
                                                  />
                                                </xsl:when>
                                                <xsl:when
                                                  test="matches(normalize-space($val), '([ ])([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])$')">
                                                  <!--  <xsl:variable name="removePageNo">
                                                        <xsl:value-of select="tokenize($val,' ')[last()]"/>
                                                    </xsl:variable>-->
                                                  <xsl:value-of
                                                  select="replace($val, '([ ])([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])$', '')"
                                                  />
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
                                                <xsl:value-of
                                                  select="replace(normalize-space($txt1), ' $| $|&#8232;', '')"
                                                />
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <!--                                                <xsl:value-of select="normalize-space($val)"/>-->
                                                <xsl:value-of
                                                  select="normalize-space(translate($val, '&#8232;', ''))"
                                                />
                                            </xsl:otherwise>
                                        </xsl:choose>

                                    </xsl:attribute>

                                    <xsl:if test="string-length($ChSubTitle) &gt; 0">
                                        <xsl:attribute name="TOC_ChapterSubTitle">
                                            <xsl:value-of select="'Value is true'"/>
                                        </xsl:attribute>
                                    </xsl:if>

                                    <xsl:attribute name="TOCChapterNumber">
                                        <xsl:value-of
                                            select="translate($ChNo, '&#x9;|&#xA;|&#x00AD;', ' ')"/>
                                    </xsl:attribute>
                                    <xsl:if
                                        test="descendant::XMLAttribute[@Self/matches(., 'XMLAttributenid')]/@Value">
                                        <xsl:attribute name="chapterId">
                                            <xsl:value-of
                                                select="descendant::XMLAttribute[@Self/matches(., 'XMLAttributenid')]/@Value"
                                            />
                                        </xsl:attribute>
                                    </xsl:if>
                                </xsl:element>
                            </xsl:if>
                            <xsl:if test="@class = 'FB_IndexHeading'">

                                <xsl:variable name="ChNo">
                                    <xsl:choose>
                                        <xsl:when
                                            test="preceding-sibling::*[1][@class = 'TOC_ChapterNumber']">
                                            <xsl:value-of
                                                select="preceding-sibling::*[1][@class = 'TOC_ChapterNumber']/normalize-space(.)"
                                            />
                                        </xsl:when>
                                        <xsl:when
                                            test="parent::XMLElement[preceding-sibling::*[1][@class = 'TOC_ChapterNumber']]">
                                            <xsl:value-of
                                                select="parent::XMLElement/preceding-sibling::*[1][@class = 'TOC_ChapterNumber']/normalize-space(.)"
                                            />
                                        </xsl:when>
                                    </xsl:choose>
                                    <!--  <xsl:if test="preceding-sibling::*[1][@class = 'TOC_ChapterNumber']">                              
                                    <xsl:value-of select="preceding-sibling::*[1][@class = 'TOC_ChapterNumber']/normalize-space(.)"/>
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
                                            <xsl:value-of
                                                select="normalize-space(replace($title, '&#x00A0;|&#xA;|&#x9;|&#x2028;|&#8194;|&#8195;', ' '))"/>
                                            <!--</xsl:otherwise>
                                            </xsl:choose>-->
                                        </xsl:variable>

                                        <!-- <xsl:variable name="txt1">
                                            <xsl:choose>
                                                <xsl:when
                                                  test="matches($val, ' ([0-9]?[0-9]?[0-9])$') or matches(normalize-space($val), ' ([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])$')">
                                                  <xsl:value-of
                                                  select="concat(' ', tokenize($val, ' ')[last()])"
                                                  />
                                                </xsl:when>
                                                <xsl:otherwise>
                                                  <xsl:value-of select="$val"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>-->

                                        <xsl:variable name="txt1">
                                            <xsl:choose>
                                                <xsl:when
                                                  test="matches($val, '([ ])?([0-9]?[0-9]?[0-9])$')">
                                                  <xsl:value-of
                                                  select="replace($val, '([ ])?([0-9]?[0-9]?[0-9])$', '')"
                                                  />
                                                </xsl:when>
                                                <xsl:when
                                                  test="matches(normalize-space($val), '([ ])([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])$')">
                                                  <xsl:value-of
                                                  select="replace($val, '([ ])([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])$', '')"
                                                  />
                                                </xsl:when>
                                                <xsl:otherwise>
                                                  <xsl:value-of select="$val"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>

                                        <!--   <xsl:variable name="txt2">
                                            <xsl:choose>
                                                <xsl:when test="contains($val, $txt1)">
                                                  <xsl:choose>
                                                  <xsl:when test="$val = $txt1">
                                                  <xsl:value-of select="$val"/>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:value-of
                                                  select="substring-before($val, $txt1)"/>
                                                  </xsl:otherwise>
                                                  </xsl:choose>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                  <xsl:value-of select="$val"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>-->

                                        <xsl:choose>
                                            <xsl:when test="$txt1">
                                                <xsl:value-of
                                                  select="replace(normalize-space($txt1), ' $| $|&#8232;', '')"
                                                />
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <!--                                                <xsl:value-of select="normalize-space($val)"/>-->
                                                <xsl:value-of
                                                  select="normalize-space(translate($val, '&#8232;', ''))"
                                                />
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:attribute>
                                    <xsl:attribute name="TOCChapterNumber">
                                        <xsl:value-of
                                            select="translate($ChNo, '&#x9;|&#xA;|&#x00AD;', ' ')"/>
                                    </xsl:attribute>
                                    <xsl:if
                                        test="descendant::XMLAttribute[@Self/matches(., 'XMLAttributenid')]/@Value">
                                        <xsl:attribute name="chapterId">
                                            <xsl:value-of
                                                select="descendant::XMLAttribute[@Self/matches(., 'XMLAttributenid')]/@Value"
                                            />
                                        </xsl:attribute>
                                    </xsl:if>
                                </xsl:element>
                            </xsl:if>
                            <xsl:if test="@class = 'TOC_PartTitle'">

                                <xsl:variable name="ChNo">
                                    <xsl:choose>
                                        <xsl:when
                                            test="preceding-sibling::*[1][@class = 'TOC_PartNumber']">
                                            <xsl:value-of
                                                select="preceding-sibling::*[1][@class = 'TOC_PartNumber']/normalize-space(.)"
                                            />
                                        </xsl:when>
                                        <xsl:when
                                            test="parent::XMLElement[preceding-sibling::*[1][@class = 'TOC_PartNumber']]">
                                            <xsl:value-of
                                                select="parent::XMLElement/preceding-sibling::*[1][@class = 'TOC_PartNumber']/normalize-space(.)"
                                            />
                                        </xsl:when>
                                    </xsl:choose>
                                    <!--  <xsl:if test="preceding-sibling::*[1][@class = 'TOC_ChapterNumber']">                              
                                    <xsl:value-of select="preceding-sibling::*[1][@class = 'TOC_ChapterNumber']/normalize-space(.)"/>
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
                                            <xsl:value-of
                                                select="normalize-space(replace($title, '&#x00A0;|&#xA;|&#x9;|&#x2028;|&#8194;|&#8195;', ' '))"/>
                                            <!--</xsl:otherwise>
                                            </xsl:choose>-->
                                        </xsl:variable>

                                        <!--   <xsl:variable name="txt1">
                                            <xsl:choose>
                                                <xsl:when test="matches($val, ' ([0-9]?[0-9]?[0-9])$') or matches(normalize-space($val), ' ([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])$')">
                                                  <xsl:value-of select="concat(' ', tokenize($val, ' ')[last()])"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                  <xsl:value-of select="$val"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>-->
                                        <xsl:variable name="txt1">
                                            <xsl:choose>
                                                <xsl:when
                                                  test="matches($val, '([ ])?([0-9]?[0-9]?[0-9])$')">
                                                  <xsl:value-of
                                                  select="replace($val, '([ ])?([0-9]?[0-9]?[0-9])$', '')"
                                                  />
                                                </xsl:when>
                                                <xsl:when
                                                  test="matches(normalize-space($val), '([ ])([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])$')">
                                                  <xsl:value-of
                                                  select="replace($val, '([ ])([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])$', '')"
                                                  />
                                                </xsl:when>
                                                <xsl:otherwise>
                                                  <xsl:value-of select="$val"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>

                                        <!--  <xsl:variable name="txt2">
                                            <xsl:choose>
                                                <xsl:when test="contains($val, $txt1)">
                                                  <xsl:choose>
                                                  <xsl:when test="$val = $txt1">
                                                  <xsl:value-of select="$val"/>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:value-of
                                                  select="substring-before($val, $txt1)"/>
                                                  </xsl:otherwise>
                                                  </xsl:choose>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                  <xsl:value-of select="$val"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>-->

                                        <xsl:choose>
                                            <xsl:when test="$txt1">
                                                <xsl:value-of
                                                  select="replace(normalize-space($txt1), ' $| $|&#8232;', '')"
                                                />
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <!--                                                <xsl:value-of select="normalize-space($val)"/>-->
                                                <xsl:value-of
                                                  select="normalize-space(translate($val, '&#8232;', ''))"
                                                />
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:attribute>
                                    <xsl:attribute name="TOCPartNumber">
                                        <xsl:value-of
                                            select="translate($ChNo, '&#x9;|&#xA;|&#x00AD;', ' ')"/>
                                    </xsl:attribute>
                                    <xsl:if
                                        test="descendant::XMLAttribute[@Self/matches(., 'XMLAttributenid')]/@Value">
                                        <xsl:attribute name="chapterId">
                                            <xsl:value-of
                                                select="descendant::XMLAttribute[@Self/matches(., 'XMLAttributenid')]/@Value"
                                            />
                                        </xsl:attribute>
                                    </xsl:if>
                                </xsl:element>
                            </xsl:if>
                            <xsl:if test="@class = 'TOC_SectionTitle'">

                                <xsl:variable name="ChNo">
                                    <xsl:choose>
                                        <xsl:when
                                            test="preceding-sibling::*[1][@class = 'TOC_SectionNumber']">
                                            <xsl:value-of
                                                select="preceding-sibling::*[1][@class = 'TOC_SectionNumber']/normalize-space(.)"
                                            />
                                        </xsl:when>
                                        <xsl:when
                                            test="parent::XMLElement[preceding-sibling::*[1][@class = 'TOC_SectionNumber']]">
                                            <xsl:value-of
                                                select="parent::XMLElement/preceding-sibling::*[1][@class = 'TOC_SectionNumber']/normalize-space(.)"
                                            />
                                        </xsl:when>
                                    </xsl:choose>
                                    <!--  <xsl:if test="preceding-sibling::*[1][@class = 'TOC_ChapterNumber']">                              
                                    <xsl:value-of select="preceding-sibling::*[1][@class = 'TOC_ChapterNumber']/normalize-space(.)"/>
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
                                            <xsl:value-of
                                                select="normalize-space(replace($title, '&#x00A0;|&#xA;|&#x9;|&#x2028;|&#8194;|&#8195;', ' '))"/>
                                            <!--</xsl:otherwise>
                                            </xsl:choose>-->
                                        </xsl:variable>

                                        <!--  <xsl:variable name="txt1">
                                            <xsl:choose>
                                                <xsl:when
                                                  test="matches($val, ' ([0-9]?[0-9]?[0-9])$') or matches(normalize-space($val), ' ([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])$')">
                                                  <xsl:value-of
                                                  select="concat(' ', tokenize($val, ' ')[last()])"
                                                  />
                                                </xsl:when>
                                                <xsl:otherwise>
                                                  <xsl:value-of select="$val"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>-->
                                        <xsl:variable name="txt1">
                                            <xsl:choose>
                                                <xsl:when
                                                  test="matches($val, '([ ])?([0-9]?[0-9]?[0-9])$')">
                                                  <xsl:value-of
                                                  select="replace($val, '([ ])?([0-9]?[0-9]?[0-9])$', '')"
                                                  />
                                                </xsl:when>
                                                <xsl:when
                                                  test="matches(normalize-space($val), '([ ])([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])$')">
                                                  <xsl:value-of
                                                  select="replace($val, '([ ])([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])$', '')"
                                                  />
                                                </xsl:when>
                                                <xsl:otherwise>
                                                  <xsl:value-of select="$val"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>

                                        <!--   <xsl:variable name="txt2">
                                            <xsl:choose>
                                                <xsl:when test="contains($val, $txt1)">
                                                  <xsl:choose>
                                                  <xsl:when test="$val = $txt1">
                                                  <xsl:value-of select="$val"/>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:value-of
                                                  select="substring-before($val, $txt1)"/>
                                                  </xsl:otherwise>
                                                  </xsl:choose>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                  <xsl:value-of select="$val"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>-->

                                        <xsl:choose>
                                            <xsl:when test="$txt1">
                                                <xsl:value-of
                                                  select="replace(normalize-space($txt1), ' $| $|&#8232;', '')"
                                                />
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <!--                                                <xsl:value-of select="normalize-space($val)"/>-->
                                                <xsl:value-of
                                                  select="normalize-space(translate($val, '&#8232;', ''))"
                                                />
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:attribute>
                                    <xsl:attribute name="TOCSectionNumber">
                                        <xsl:value-of
                                            select="translate($ChNo, '&#x9;|&#xA;|&#x00AD;', ' ')"/>
                                    </xsl:attribute>
                                    <xsl:if
                                        test="descendant::XMLAttribute[@Self/matches(., 'XMLAttributenid')]/@Value">
                                        <xsl:attribute name="chapterId">
                                            <xsl:value-of
                                                select="descendant::XMLAttribute[@Self/matches(., 'XMLAttributenid')]/@Value"
                                            />
                                        </xsl:attribute>
                                    </xsl:if>
                                </xsl:element>
                            </xsl:if>
                            <xsl:if test="@class = 'TOC_UnitTitle'">

                                <xsl:variable name="ChNo">
                                    <xsl:choose>
                                        <xsl:when
                                            test="preceding-sibling::*[1][@class = 'TOC_UnitNumber']">
                                            <xsl:value-of
                                                select="preceding-sibling::*[1][@class = 'TOC_UnitNumber']/normalize-space(.)"
                                            />
                                        </xsl:when>
                                        <xsl:when
                                            test="parent::XMLElement[preceding-sibling::*[1][@class = 'TOC_UnitNumber']]">
                                            <xsl:value-of
                                                select="parent::XMLElement/preceding-sibling::*[1][@class = 'TOC_UnitNumber']/normalize-space(.)"
                                            />
                                        </xsl:when>
                                    </xsl:choose>
                                    <!--  <xsl:if test="preceding-sibling::*[1][@class = 'TOC_ChapterNumber']">                              
                                    <xsl:value-of select="preceding-sibling::*[1][@class = 'TOC_ChapterNumber']/normalize-space(.)"/>
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
                                            <xsl:value-of
                                                select="normalize-space(replace($title, '&#x00A0;|&#xA;|&#x9;|&#x2028;|&#8194;|&#8195;', ' '))"/>
                                            <!--</xsl:otherwise>
                                            </xsl:choose>-->
                                        </xsl:variable>

                                        <!-- <xsl:variable name="txt1">
                                            <xsl:choose>
                                                <xsl:when
                                                  test="matches($val, ' ([0-9]?[0-9]?[0-9])$') or matches(normalize-space($val), ' ([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])$')">
                                                  <xsl:value-of
                                                  select="concat(' ', tokenize($val, ' ')[last()])"
                                                  />
                                                </xsl:when>
                                                <xsl:otherwise>
                                                  <xsl:value-of select="$val"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>-->
                                        <xsl:variable name="txt1">
                                            <xsl:choose>
                                                <xsl:when
                                                  test="matches($val, '([ ])?([0-9]?[0-9]?[0-9])$')">
                                                  <xsl:value-of
                                                  select="replace($val, '([ ])?([0-9]?[0-9]?[0-9])$', '')"
                                                  />
                                                </xsl:when>
                                                <xsl:when
                                                  test="matches(normalize-space($val), '([ ])([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])$')">
                                                  <xsl:value-of
                                                  select="replace($val, '([ ])([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])$', '')"
                                                  />
                                                </xsl:when>
                                                <xsl:otherwise>
                                                  <xsl:value-of select="$val"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>

                                        <!--  <xsl:variable name="txt2">
                                            <xsl:choose>
                                                <xsl:when test="contains($val, $txt1)">
                                                  <xsl:choose>
                                                  <xsl:when test="$val = $txt1">
                                                  <xsl:value-of select="$val"/>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:value-of
                                                  select="substring-before($val, $txt1)"/>
                                                  </xsl:otherwise>
                                                  </xsl:choose>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                  <xsl:value-of select="$val"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>-->

                                        <xsl:choose>
                                            <xsl:when test="$txt1">
                                                <xsl:value-of
                                                  select="replace(normalize-space($txt1), ' $| $|&#8232;', '')"
                                                />
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <!--                                                <xsl:value-of select="normalize-space($val)"/>-->
                                                <xsl:value-of
                                                  select="normalize-space(translate($val, '&#8232;', ''))"
                                                />
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:attribute>
                                    <xsl:attribute name="TOCUnitNumber">
                                        <xsl:value-of
                                            select="translate($ChNo, '&#x9;|&#xA;|&#x00AD;', ' ')"/>
                                    </xsl:attribute>
                                    <xsl:if
                                        test="descendant::XMLAttribute[@Self/matches(., 'XMLAttributenid')]/@Value">
                                        <xsl:attribute name="chapterId">
                                            <xsl:value-of
                                                select="descendant::XMLAttribute[@Self/matches(., 'XMLAttributenid')]/@Value"
                                            />
                                        </xsl:attribute>
                                    </xsl:if>
                                </xsl:element>
                            </xsl:if>
                            <xsl:if test="@class = 'TOC_BackMatter'">
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
                                            <xsl:value-of
                                                select="normalize-space(replace($title, '&#x00A0;|&#xA;|&#x9;|&#x2028;|&#8194;|&#8195;', ' '))"/>
                                            <!--</xsl:otherwise>
                                            </xsl:choose>-->
                                        </xsl:variable>

                                        <!-- <xsl:variable name="txt1">
                                            <xsl:choose>
                                                <xsl:when
                                                  test="matches($val, ' ([0-9]?[0-9]?[0-9])$') or matches(normalize-space($val), ' ([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])$')">
                                                  <xsl:value-of
                                                  select="concat(' ', tokenize($val, ' ')[last()])"
                                                  />
                                                </xsl:when>
                                                <xsl:otherwise>
                                                  <xsl:value-of select="$val"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>-->

                                        <xsl:variable name="txt1">
                                            <xsl:choose>
                                                <xsl:when
                                                  test="matches($val, '([ ])?([0-9]?[0-9]?[0-9])$')">
                                                  <xsl:value-of
                                                  select="replace($val, '([ ])?([0-9]?[0-9]?[0-9])$', '')"
                                                  />
                                                </xsl:when>
                                                <xsl:when
                                                  test="matches(normalize-space($val), '([ ])([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])$')">
                                                  <xsl:value-of
                                                  select="replace($val, '([ ])([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])$', '')"
                                                  />
                                                </xsl:when>
                                                <xsl:otherwise>
                                                  <xsl:value-of select="$val"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>
                                        <!-- <xsl:variable name="txt2">
                                            <xsl:choose>
                                                <xsl:when test="contains($val, $txt1)">
                                                  <xsl:choose>
                                                  <xsl:when test="$val = $txt1">
                                                  <xsl:value-of select="$val"/>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:value-of
                                                  select="substring-before($val, $txt1)"/>
                                                  </xsl:otherwise>
                                                  </xsl:choose>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                  <xsl:value-of select="$val"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>-->

                                        <xsl:choose>
                                            <xsl:when test="$txt1">
                                                <xsl:value-of
                                                  select="replace(normalize-space($txt1), ' $| $|&#8232;', '')"
                                                />
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <!--                                                <xsl:value-of select="normalize-space($val)"/>-->
                                                <xsl:value-of
                                                  select="normalize-space(translate($val, '&#8232;', ''))"
                                                />
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:attribute>
                                    <xsl:if
                                        test="descendant::XMLAttribute[@Self/matches(., 'XMLAttributenid')]/@Value">
                                        <xsl:attribute name="chapterId">
                                            <xsl:value-of
                                                select="descendant::XMLAttribute[@Self/matches(., 'XMLAttributenid')]/@Value"
                                            />
                                        </xsl:attribute>
                                    </xsl:if>
                                </xsl:element>
                            </xsl:if>

                        </xsl:if>
                    </xsl:for-each>
                    <xsl:text>&#x000A;</xsl:text>
                    <!-- <xsl:text>&#x000A;</xsl:text>
                    <xsl:element name="Toc">
                    <xsl:call-template name="TOCchapterTitles">
                        <xsl:with-param name="TOCchapterTitlesVal"/>
                    </xsl:call-template> 
                    </xsl:element>-->
                    <xsl:text>&#x000A;</xsl:text>
                </xsl:element>
            </xsl:result-document>
        </xsl:if>

        <!--<xsl:result-document href="{'output'}.cf">
            <xsl:text>&#x000A;</xsl:text>
            <xsl:element name="root">
                <xsl:for-each select="descendant::ParagraphStyleRange">
                    <xsl:choose>
                        <!-\-                        <xsl:when test="@class = 'FB_Half_Title'">                   -\->
                        <!-\-<xsl:when test="@class = 'FB_Half_Title' and not(following::ParagraphStyleRange[@class = 'TOC_ChapterTitle'])">
                            <xsl:text>&#x000A;</xsl:text>
                            <xsl:element name="Title">
                                <xsl:attribute name="ChapterTitle">
                                    <xsl:variable name="chTile">
                                        <xsl:value-of select="descendant::Content"/>
                                    </xsl:variable>
                                    <xsl:value-of select="normalize-space(translate($chTile, '&#x9;|&#xA;|&#8232;', ''))"/>
                                </xsl:attribute>                           
                                <xsl:if test="//ParagraphStyleRange[@class = 'FB_Half_Title']">
                                    <xsl:attribute name="toc">
                                        <xsl:for-each select="//ParagraphStyleRange[@class = 'FrontMatterHeading'][1]">
                                            <xsl:choose>
                                                <xsl:when test="contains(@class, 'FrontMatterHeading')">
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
                        <xsl:when test="@class = 'FB_Book_Title'">
                            <xsl:text>&#x000A;</xsl:text>
                            <xsl:element name="Title">
                                <xsl:attribute name="ChapterTitle">
                                    <xsl:variable name="chTile">
                                        <xsl:value-of select="descendant::Content"/>
                                    </xsl:variable>
                                    <!-\- <xsl:value-of select="normalize-space(translate($chTile, '&#x9;|&#xA;|&#8232;', ''))"/>-\->
                                    <xsl:value-of select="'FrontMatter'"/>
                                </xsl:attribute>
                                <xsl:if test="//ParagraphStyleRange[@class = 'FB_Book_Title']">
                                    <xsl:attribute name="toc">
                                        <xsl:for-each select="//ParagraphStyleRange[@class = 'FB_Book_Title'][1]">
                                            <xsl:choose>
                                                <xsl:when test="contains(@class, 'FB_Book_Title')">
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
                        <xsl:when test="@class = 'FrontMatterHeading'">
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
                        <!-\-<xsl:when test="@class = 'FrontMatterHeading'">                   
                            <xsl:text>&#x000A;</xsl:text>
                            <xsl:element name="Title">
                                <xsl:attribute name="ChapterTitle">
                                    <xsl:variable name="chTile">
                                        <xsl:value-of select="descendant::Content"/>
                                    </xsl:variable>
                                    <xsl:value-of select="normalize-space(translate($chTile, '&#x9;|&#xA;|&#8232;', ''))"/>
                                </xsl:attribute>                           
                                <xsl:if test="//ParagraphStyleRange[@class = 'FrontMatterHeading']">
                                    <xsl:attribute name="toc">
                                        <xsl:for-each select="//ParagraphStyleRange[@class = 'FrontMatterHeading'][1]">
                                            <xsl:choose>
                                                <xsl:when test="contains(@class, 'FB_Half_Title')">
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
                        <xsl:if test="preceding-sibling::*[1][@class = 'ChapterNumber']">
                            <xsl:value-of select="preceding-sibling::*[1][@class = 'ChapterNumber']/."/>
                        </xsl:if>
                        <xsl:if test="preceding-sibling::*[1][@class = 'PartNumber']">
                            <xsl:value-of select="preceding-sibling::*[1][@class = 'PartNumber']/."/>
                        </xsl:if>
                        <xsl:if test="preceding-sibling::*[1][@class = 'UnitNumber']">
                            <xsl:value-of select="preceding-sibling::*[1][@class = 'UnitNumber']/."/>
                        </xsl:if>
                        <xsl:if test="preceding-sibling::*[1][@class = 'SectionNumber']">
                            <xsl:value-of select="preceding-sibling::*[1][@class = 'SectionNumber']/."/>
                        </xsl:if>
                    </xsl:variable>
                    
                    <xsl:variable name="chSubTitle">
                        <xsl:if  test="following-sibling::*[1][@class = 'SubTitle']">
                            <xsl:value-of  select="following-sibling::*[1][@class = 'SubTitle']/."/>
                        </xsl:if>
                    </xsl:variable>

                    <xsl:if test="self::ParagraphStyleRange[@class = 'ChapterTitle']">
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
                    <xsl:if test="self::ParagraphStyleRange[@class = 'FB_IndexHeading']">
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
                    <xsl:if test="self::ParagraphStyleRange[@class = 'PartTitle']">
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
                    <xsl:if test="self::ParagraphStyleRange[@class = 'UnitTitle']">
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
                    <xsl:if test="self::ParagraphStyleRange[@class = 'SectionTitle']">
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
                    <xsl:if test="@class = 'BackMatterHeading'">
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

        <xsl:result-document href="{'output1'}.cf">
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
                    <xsl:call-template name="TOC-Data">
                        <xsl:with-param name="TOC-Data-Val"/>
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

                </xsl:element>
                <xsl:text>&#x000A;</xsl:text>
            </xsl:element>
        </xsl:result-document>

    </xsl:template>

<!--07-11-2023 below template is not used above so commented-->
    <!--<xsl:template name="TOCchapterTitles">
        <xsl:param name="TOCchapterTitlesVal"/>
        <xsl:for-each select="descendant::h2[@class = 'TOC_ChapterTitle']">

            <xsl:variable name="ChSubTitle">
                <xsl:choose>
                    <xsl:when test="following-sibling::*[1][@class = 'TOC_ChapterSubTitle']">
                        <xsl:value-of
                            select="following-sibling::*[1][@class = 'TOC_ChapterSubTitle']/normalize-space(.)"
                        />
                    </xsl:when>
                    <xsl:when
                        test="parent::XMLElement[following-sibling::*[1][@class = 'TOC_ChapterSubTitle']]">
                        <xsl:value-of
                            select="parent::XMLElement/following-sibling::*[1][@class = 'TOC_ChapterSubTitle']/normalize-space(.)"
                        />
                    </xsl:when>
                </xsl:choose>
                <!-\-  <xsl:if test="preceding-sibling::*[1][@class = 'TOC_ChapterNumber']">                              
                    <xsl:value-of select="preceding-sibling::*[1][@class = 'TOC_ChapterNumber']/normalize-space(.)"/>
                </xsl:if>-\->
            </xsl:variable>
            <xsl:variable name="ChNo">
                <xsl:choose>
                    <xsl:when test="preceding-sibling::*[1][@class = 'TOC_ChapterNumber']">
                        <xsl:value-of
                            select="preceding-sibling::*[1][@class = 'TOC_ChapterNumber']/normalize-space(.)"
                        />
                    </xsl:when>
                    <xsl:when
                        test="parent::XMLElement[preceding-sibling::*[1][@class = 'TOC_ChapterNumber']]">
                        <xsl:value-of
                            select="parent::XMLElement/preceding-sibling::*[1][@class = 'TOC_ChapterNumber']/normalize-space(.)"
                        />
                    </xsl:when>
                </xsl:choose>
                <!-\-  <xsl:if test="preceding-sibling::*[1][@class = 'TOC_ChapterNumber']">                              
                    <xsl:value-of select="preceding-sibling::*[1][@class = 'TOC_ChapterNumber']/normalize-space(.)"/>
                </xsl:if>-\->
            </xsl:variable>
            <!-\-  <xsl:text>&#x000A;</xsl:text>
            <xsl:element name="Toc">-\->
            <xsl:attribute name="TOCChapterTitle">

                <xsl:variable name="title">
                    <xsl:for-each select="span">
                        <xsl:choose>
                            <xsl:when
                                test="@class = 'WordStyles%3apageno' or matches(@class, 'pageno')"> </xsl:when>
                            <xsl:when test="@class = 'pageno' or matches(@class, 'pageno')"> </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="."/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:variable>

                <xsl:variable name="val">
                    <xsl:value-of
                        select="normalize-space(replace($title, $allSpaceCharacterEntity, ' '))"/>
                </xsl:variable>

                <xsl:variable name="txt1">
                    <xsl:choose>
                        <xsl:when
                            test="matches($val, '([0-9]?[0-9]?[0-9])$') or matches(normalize-space($val), '([ ])([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])$')">
                            <xsl:variable name="removePageNo">
                                <xsl:value-of select="concat(' ', tokenize($val, ' ')[last()])"/>
                            </xsl:variable>
                            <xsl:value-of select="replace($val, $removePageNo, '')"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$val"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>

                <!-\-  <xsl:variable name="txt2">
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
                    </xsl:variable>-\->

                <xsl:choose>
                    <xsl:when test="$txt1">
                        <xsl:value-of select="replace(normalize-space($txt1), ' $| $|&#8232;', '')"
                        />
                    </xsl:when>
                    <xsl:otherwise>
                        <!-\-                                                <xsl:value-of select="normalize-space($val)"/>-\->
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

            <!-\-</xsl:element>-\->

        </xsl:for-each>

    </xsl:template>-->

 <!--07-11-2023 below template is not used above so commented-->
 <!--   <xsl:template name="TOCHeads">
        <xsl:param name="TOCHeadsVal"/>
        <xsl:for-each select="descendant::grouped/p[@class = 'TOC_ChapterTitle']">

            <xsl:variable name="ChSubTitle">
                <xsl:choose>
                    <xsl:when test="following-sibling::*[1][@class = 'TOC_ChapterSubTitle']">
                        <xsl:value-of
                            select="following-sibling::*[1][@class = 'TOC_ChapterSubTitle']/normalize-space(.)"
                        />
                    </xsl:when>
                    <xsl:when
                        test="parent::XMLElement[following-sibling::*[1][@class = 'TOC_ChapterSubTitle']]">
                        <xsl:value-of
                            select="parent::XMLElement/following-sibling::*[1][@class = 'TOC_ChapterSubTitle']/normalize-space(.)"
                        />
                    </xsl:when>
                </xsl:choose>
                <!-\-  <xsl:if test="preceding-sibling::*[1][@class = 'TOC_ChapterNumber']">                              
                    <xsl:value-of select="preceding-sibling::*[1][@class = 'TOC_ChapterNumber']/normalize-space(.)"/>
                </xsl:if>-\->
            </xsl:variable>
            <xsl:variable name="ChNo">
                <xsl:choose>
                    <xsl:when test="preceding-sibling::*[1][@class = 'TOC_ChapterNumber']">
                        <xsl:value-of
                            select="preceding-sibling::*[1][@class = 'TOC_ChapterNumber']/normalize-space(.)"
                        />
                    </xsl:when>
                    <xsl:when
                        test="parent::XMLElement[preceding-sibling::*[1][@class = 'TOC_ChapterNumber']]">
                        <xsl:value-of
                            select="parent::XMLElement/preceding-sibling::*[1][@class = 'TOC_ChapterNumber']/normalize-space(.)"
                        />
                    </xsl:when>
                </xsl:choose>
                <!-\-  <xsl:if test="preceding-sibling::*[1][@class = 'TOC_ChapterNumber']">                              
                    <xsl:value-of select="preceding-sibling::*[1][@class = 'TOC_ChapterNumber']/normalize-space(.)"/>
                </xsl:if>-\->
            </xsl:variable>
            <!-\-  <xsl:text>&#x000A;</xsl:text>
            <xsl:element name="Toc">-\->
            <xsl:attribute name="TOCChapterTitle">

                <xsl:variable name="title">
                    <xsl:for-each select="span">
                        <xsl:choose>
                            <xsl:when
                                test="@class = 'CharacterStyle/WordStyles%3apageno' or matches(@class, 'pageno')"> </xsl:when>
                            <xsl:when
                                test="@class = 'CharacterStyle/pageno' or matches(@class, 'pageno')"> </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="."/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:variable>

                <xsl:variable name="val">
                    <xsl:value-of
                        select="normalize-space(replace($title, $allSpaceCharacterEntity, ' '))"/>
                </xsl:variable>

                <xsl:variable name="txt1">
                    <xsl:choose>
                        <xsl:when
                            test="matches($val, '([0-9]?[0-9]?[0-9])$') or matches(normalize-space($val), '([ ])([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])?([IiLlVvCcXx])$')">
                            <xsl:variable name="removePageNo">
                                <xsl:value-of select="concat(' ', tokenize($val, ' ')[last()])"/>
                            </xsl:variable>
                            <xsl:value-of select="replace($val, $removePageNo, '')"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$val"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>

                <!-\-  <xsl:variable name="txt2">
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
                    </xsl:variable>-\->

                <xsl:choose>
                    <xsl:when test="$txt1">
                        <xsl:value-of select="replace(normalize-space($txt1), ' $| $|&#8232;', '')"
                        />
                    </xsl:when>
                    <xsl:otherwise>
                        <!-\-                                                <xsl:value-of select="normalize-space($val)"/>-\->
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

            <!-\-</xsl:element>-\->

        </xsl:for-each>
        <xsl:for-each select="descendant::group">
            <xsl:variable name="countHeads" select="concat('TOcHead', position())"/>
            <xsl:attribute name="{$countHeads}"/>
        </xsl:for-each>
    </xsl:template>-->

    <xsl:template name="chapterTitle">
        <xsl:param name="chTVal"/>
        <xsl:variable name="chSubTitle">
            <xsl:for-each select="descendant::h3[@class = 'SubTitle']">
                <xsl:value-of
                    select="normalize-space(translate(self::h3[@class = 'SubTitle']/., '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"
                />
            </xsl:for-each>
        </xsl:variable>

        <xsl:variable name="chSubTitle1">
            <xsl:for-each select="descendant::h3[@class = 'SubTitle']">
                <xsl:call-template name="span"> </xsl:call-template>
            </xsl:for-each>
        </xsl:variable>

        <xsl:variable name="findFrontMatter">
            <xsl:if
                test="descendant::h1[@class = 'FB_Book_Title'] and descendant::p[@class = 'FB_Copy_Right_First'] and descendant::p[@class = 'FB_DedicationPara'] and descendant::h2[@class = 'FB_Half_Title']">
                <xsl:value-of select="true()"/>
            </xsl:if>
        </xsl:variable>

        <xsl:variable name="findTOC">
            <xsl:if
                test="(descendant::h2[@class = 'FrontMatterHeading'][contains(lower-case(.), 'contents')] and not(preceding::h2[@class = 'FrontMatterHeading'])) or (descendant::h2[@class = 'FrontMatterHeading'][contains(lower-case(.), 'contents')] and not(following::h2[@class = 'FrontMatterHeading']))">
                <xsl:value-of
                    select="(descendant::h2[@class = 'FrontMatterHeading'][contains(lower-case(.), 'contents')] and not(preceding::h2[@class = 'FrontMatterHeading'])) or (descendant::h2[@class = 'FrontMatterHeading'][contains(lower-case(.), 'contents')] and not(following::h2[@class = 'FrontMatterHeading']))"
                />
            </xsl:if>
        </xsl:variable>
        <xsl:variable name="count">
            <xsl:value-of
                select="count(descendant::h2[@class = 'FrontMatterHeading'] | descendant::h2[@class = 'ChapterTitle'] | descendant::h2[@class = 'BackMatterHeading'] | descendant::h2[@class = 'FB_IndexHeading'] | descendant::h1[@class = 'FB_Book_Title'] | descendant::p[@class = 'FB_DedicationPara'])"
            />
        </xsl:variable>

        <xsl:choose>
            <xsl:when
                test="descendant::h2[@class = 'FrontMatterHeading'] | descendant::h2[@class = 'ChapterTitle'] | descendant::h2[@class = 'BackMatterHeading'] | descendant::h2[@class = 'FB_IndexHeading']">
                <xsl:for-each
                    select="descendant::h2[@class = 'FrontMatterHeading'] | descendant::h2[@class = 'ChapterTitle'] | descendant::h2[@class = 'BackMatterHeading'] | descendant::h2[@class = 'FB_IndexHeading']">
                    <xsl:choose>
                        <xsl:when test="self::h2[@class = 'FrontMatterHeading']">
                            <xsl:variable name="chapterTitle">
                                <xsl:for-each select="descendant-or-self::Content">
                                    <xsl:value-of select="."/>
                                </xsl:for-each>
                            </xsl:variable>
                            <xsl:variable name="forEachText">
                                <xsl:value-of
                                    select="normalize-space(translate($chapterTitle, '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"/>
                                <xsl:if test="string-length($chSubTitle) &gt; 0">
                                    <xsl:value-of select="' '"/>
                                    <xsl:value-of select="$chSubTitle"/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:choose>
                                <xsl:when
                                    test="count(self::h2[@class = 'FrontMatterHeading']) = 1 and $count = 1">

                                    <xsl:variable name="attName">
                                        <xsl:value-of select="'ChapterTitle'"/>
                                    </xsl:variable>
                                    <xsl:attribute name="{$attName}">
                                        <xsl:value-of select="$forEachText"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="BbChapterTitle_styleName">
                                        <xsl:value-of select="normalize-space(@class)"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="BbChapterTitle">
                                        <xsl:variable name="chapterTitle">
                                            <xsl:call-template name="span"/>
                                        </xsl:variable>
                                        <xsl:if test="string-length($chapterTitle) &gt; 0">
                                            <xsl:value-of select="normalize-space($chapterTitle)"/>
                                        </xsl:if>
                                        <xsl:if test="string-length($chSubTitle1) &gt; 0">
                                            <xsl:value-of select="': '"/>
                                            <xsl:value-of select="normalize-space($chSubTitle1)"/>
                                        </xsl:if>
                                    </xsl:attribute>
                                </xsl:when>
                                <xsl:when test="$findTOC = 'Contents'">
                                    <xsl:attribute name="ChapterTitle">
                                        <xsl:value-of select="$findTOC"/>
                                    </xsl:attribute>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:variable name="attName">
                                        <xsl:value-of
                                            select="concat('frontMatterHeading', position())"/>
                                    </xsl:variable>
                                    <xsl:attribute name="{$attName}">
                                        <xsl:value-of select="$forEachText"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="BbChapterTitle_styleName">
                                        <xsl:value-of select="normalize-space(@class)"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="BbChapterTitle">
                                        <xsl:variable name="chapterTitle">
                                            <xsl:call-template name="span"/>
                                        </xsl:variable>
                                        <xsl:if test="string-length($chapterTitle) &gt; 0">
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
                        <xsl:when
                            test="self::h2[@class = 'ChapterTitle'] | self::h2[@class = 'BackMatterHeading'] | self::h2[@class = 'FB_IndexHeading']">
                            <xsl:variable name="chapterTitle">
                                <xsl:for-each select="descendant-or-self::Content">
                                    <xsl:value-of select="."/>
                                </xsl:for-each>
                            </xsl:variable>

                            <xsl:variable name="forEachText">
                                <xsl:value-of
                                    select="normalize-space(translate($chapterTitle, '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"/>
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

                                <xsl:when
                                    test="count(self::h2[@class = 'ChapterTitle'] | self::h2[@class = 'BackMatterHeading'] | self::h2[@class = 'FB_IndexHeading']) = 1 and $count = 1">
                                    <xsl:variable name="attName">
                                        <xsl:value-of select="'ChapterTitle'"/>
                                    </xsl:variable>

                                    <xsl:attribute name="{$attName}">
                                        <xsl:value-of select="$forEachText"/>
                                    </xsl:attribute>
                                    <!--Added for Generate Toc on 07-05-2021-->
                                    <xsl:attribute name="BbChapterTitle_styleName">
                                        <xsl:value-of
                                            select="normalize-space(substring-after(@class, ''))"/>
                                    </xsl:attribute>
                                    <!--Added for Json to Toc on 06-6-2021-->
                                    <xsl:attribute name="BbChapterTitle">
                                        <xsl:variable name="chapterTitle">
                                            <xsl:call-template name="span"/>
                                        </xsl:variable>
                                        <xsl:if test="string-length($chapterTitle) &gt; 0">
                                            <xsl:value-of select="normalize-space($chapterTitle)"/>
                                        </xsl:if>
                                        <xsl:if test="string-length($chSubTitle1) &gt; 0">
                                            <xsl:value-of select="': '"/>
                                            <xsl:value-of select="normalize-space($chSubTitle1)"/>
                                        </xsl:if>
                                    </xsl:attribute>

                                    <!--End-->
                                </xsl:when>
                            </xsl:choose>

                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="descendant::h2[@class = 'FB_Half_Title']">
                <xsl:for-each select="descendant::h2[@class = 'FB_Half_Title']">
                    <xsl:choose>
                        <xsl:when test="self::ParagraphStyleRange[@class = 'FB_Half_Title']">
                            <xsl:variable name="copyright"
                                select="self::ParagraphStyleRange[@class = 'FB_Half_Title']"/>
                            <xsl:if test="string-length($copyright) &gt; 0">
                                <xsl:attribute name="ChapterTitle">
                                    <xsl:value-of select="'Title'"/>
                                </xsl:attribute>
                            </xsl:if>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="descendant::h2[@class = 'FB_Series_Title']">
                <xsl:for-each select="descendant::h2[@class = 'FB_Series_Title']">
                    <xsl:choose>
                        <xsl:when test="self::h2[@class = 'FB_Series_Title']">
                            <xsl:variable name="bkTitle"
                                select="self::h2[@class = 'FB_Series_Title']"/>
                            <xsl:if test="string-length($bkTitle) &gt; 0">
                                <xsl:attribute name="ChapterTitle">
                                    <xsl:value-of select="'SeriesTitle'"/>
                                </xsl:attribute>
                            </xsl:if>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="descendant::h1[@class = 'FB_Book_Title']">
                <xsl:for-each select="descendant::h1[@class = 'FB_Book_Title']">
                    <xsl:choose>
                        <xsl:when test="self::h1[@class = 'FB_Book_Title']">
                            <xsl:variable name="bkTitle" select="self::h1[@class = 'FB_Book_Title']"/>
                            <xsl:if test="string-length($bkTitle) &gt; 0">
                                <xsl:attribute name="ChapterTitle">
                                    <xsl:value-of select="'BookTitle'"/>
                                </xsl:attribute>
                            </xsl:if>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="descendant::p[@class = 'FB_Copy_Right_First']">
                <xsl:for-each select="descendant::p[@class = 'FB_Copy_Right_First']">
                    <xsl:choose>
                        <xsl:when test="self::p[@class = 'FB_Copy_Right_First']">
                            <xsl:variable name="copyright"
                                select="self::p[@class = 'FB_Copy_Right_First']"/>
                            <xsl:if test="string-length($copyright) &gt; 0">
                                <xsl:attribute name="ChapterTitle">
                                    <xsl:value-of select="'Copyright'"/>
                                </xsl:attribute>
                            </xsl:if>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="descendant::p[@class = 'FB_DedicationPara']">
                <xsl:for-each select="descendant::p[@class = 'FB_DedicationPara']">
                    <xsl:choose>
                        <xsl:when test="self::p[@class = 'FB_DedicationPara']">
                            <xsl:attribute name="ChapterTitle">
                                <xsl:value-of select="'Dedication'"/>
                            </xsl:attribute>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="descendant::p[@class = 'Epigraph']">
                <xsl:for-each select="descendant::p[@class = 'Epigraph']">
                    <xsl:choose>
                        <xsl:when test="self::p[@class = 'Epigraph']">
                            <xsl:attribute name="ChapterTitle">
                                <xsl:value-of select="'Epigraph'"/>
                            </xsl:attribute>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:when>
        </xsl:choose>

    </xsl:template>

    <xsl:template name="chapterSubTitle">
        <xsl:param name="chSubTitleVal"/>
        <xsl:for-each select="descendant::h3[@class = 'SubTitle']">
            <xsl:choose>
                <xsl:when test="self::h3[@class = 'SubTitle']">
                    <xsl:variable name="Val">
                        <xsl:value-of
                            select="normalize-space(translate(., '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"
                        />
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
        <xsl:for-each select="descendant::h2[@class = 'ChapterNumber']">
            <xsl:choose>
                <xsl:when test="self::h2[@class = 'ChapterNumber']">
                    <xsl:attribute name="BbChapterNumber_styleName">
                        <xsl:value-of select="normalize-space(@class)"/>
                    </xsl:attribute>
                    <xsl:attribute name="ChapterNumber">
                        <xsl:variable name="ChapterNumber">
                            <xsl:for-each select="descendant-or-self::Content">
                                <xsl:value-of select="."/>
                            </xsl:for-each>
                        </xsl:variable>
                        <xsl:value-of
                            select="normalize-space(translate($ChapterNumber, '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"
                        />
                    </xsl:attribute>
                    <xsl:attribute name="BbChapterNumber">
                        <xsl:variable name="cn">
                            <xsl:call-template name="span"/>
                        </xsl:variable>
                        <xsl:if test="string-length($cn) &gt; 0">
                            <xsl:value-of select="normalize-space($cn)"/>
                        </xsl:if>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when
                    test="self::h2[@class = 'ChapterNumber']/span[@class = 'ChapterWord'] or self::*[@class = 'ChapterNumber']/span[@class = 'ChapterNumber']">

                    <xsl:attribute name="BbChapterNumber_styleName">
                        <xsl:value-of select="normalize-space(@class)"/>
                    </xsl:attribute>
                    <xsl:attribute name="ChapterNumber">
                        <xsl:variable name="ChapterWord_val">
                            <xsl:value-of select="child::span[@class = 'ChapterWord']"/>
                        </xsl:variable>

                        <xsl:value-of
                            select="normalize-space(translate($ChapterWord_val, '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"/>
                        <xsl:text> </xsl:text>
                        <xsl:variable name="ChapterNumber_val">
                            <xsl:value-of select="child::span[@class = 'ChapterNumber']"/>
                        </xsl:variable>
                        <!--                        <xsl:value-of select="normalize-space(translate(., '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"/>  -->
                        <xsl:value-of
                            select="normalize-space(translate($ChapterNumber_val, '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"
                        />
                    </xsl:attribute>

                    <xsl:attribute name="BbChapterNumber">
                        <xsl:variable name="cn">
                            <xsl:call-template name="span"/>
                        </xsl:variable>
                        <xsl:if test="string-length($cn) &gt; 0">
                            <xsl:value-of select="normalize-space($cn)"/>
                        </xsl:if>
                    </xsl:attribute>
                </xsl:when>

            </xsl:choose>
        </xsl:for-each>
    </xsl:template>

    <!--02-11-2023 name="chapterHeads" having also when all para level node() containes toc="true"-->
    <xsl:template name="TOC-Data">
        <xsl:param name="TOC-Data-Val"/>

        <!-- <xsl:for-each select="descendant::ParagraphStyleRange[@class = 'Head1']">
            <xsl:choose>
                <xsl:when test="self::ParagraphStyleRange[@class = 'Head1']">
                    <xsl:variable name="chapterTitle">
                        <xsl:for-each select="descendant-or-self::Content">
                            <xsl:value-of select="."/>
                        </xsl:for-each>
                    </xsl:variable>

                    <xsl:variable name="forEachText">
                        <xsl:value-of select="normalize-space(translate($chapterTitle, '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"/>
                    </xsl:variable>

                    <xsl:choose>
                        <xsl:when test="self::ParagraphStyleRange[@class = 'Head1']">
                            <xsl:variable name="attName">
                                <xsl:value-of select="concat('Head1-', position())"/>
                            </xsl:variable>
                            <xsl:attribute name="{$attName}">
                                <xsl:value-of select="$forEachText"/>
                            </xsl:attribute>
                        </xsl:when>
                    </xsl:choose>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>-->
        
        <xsl:choose>
            <xsl:when test="descendant-or-self::*[@toc = 'true']">
               
                <xsl:for-each select="descendant-or-self::*[@toc = 'true']">
                    <!--            <xsl:if test="not(. = following::*[@toc = 'true']/.)">-->
                    <xsl:if test="not(descendant-or-self::*[@class = 'FB_IndexHeading' or @class = 'FB_IndexHeading' or @class = 'BackMatterHeading' or @class = 'ChapterTitle' or @class = 'FrontMatterHeading' or @class = 'ChapterNumber' or @class = 'SubTitle' or @class = 'PartTitle' or @class = 'PartNumber' or @class = 'UnitTitle' or @class = 'UnitNumber' or @class = 'SectionTitle' or @class = 'SectionNumber' or @class = 'DocumentAuthor'])">
                    <xsl:variable name="chapterTitle">
                        <!-- 02-11-2023 commented <xsl:for-each select="descendant-or-self::Content"> duplicate content comes -->
                        <xsl:for-each select="descendant-or-self::span">
                            <xsl:choose>
                                <xsl:when test="descendant-or-self::Content[parent::i | ancestor::i]">
                                    <xsl:text disable-output-escaping="yes">&lt;i&gt;</xsl:text>
                                    <xsl:value-of select="self::Content[parent::i | ancestor::i][1]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/i&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when
                                    test="descendant-or-self::Content[parent::b | ancestor::b]">
                                    <xsl:text disable-output-escaping="yes">&lt;b&gt;</xsl:text>
                                    <xsl:value-of
                                        select="descendant-or-self::Content[parent::b | ancestor::b]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/b&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when
                                    test="descendant-or-self::Content[parent::u | ancestor::u]">
                                    <xsl:text disable-output-escaping="yes">&lt;u&gt;</xsl:text>
                                    <xsl:value-of
                                        select="descendant-or-self::Content[parent::u | ancestor::u]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/u&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when
                                    test="parent::span/preceding-sibling::*[1][self::w:rPr/w:caps]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="text-transform: uppercase;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when
                                    test="parent::span/preceding-sibling::*[1][self::w:rPr/w:smallCaps]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="font-variant: small-caps;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when
                                    test="descendant-or-self::Content[parent::span[@class = 'allcaps']]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="text-transform: uppercase;"&gt;</xsl:text>
                                    <xsl:value-of
                                        select="descendant-or-self::Content[parent::span[@class = 'allcaps']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when
                                    test="descendant-or-self::Content[parent::s | ancestor::s] | descendant-or-self::Content[parent::span[@class = 'strike']]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="text-decoration: line-through;"&gt;</xsl:text>
                                    <xsl:value-of
                                        select="descendant-or-self::Content[parent::s | ancestor::s] | descendant-or-self::Content[parent::span[@class = 'strike']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when
                                    test="descendant-or-self::Content[parent::sc | ancestor::sc] | descendant-or-self::Content[parent::small | ancestor::small] | descendant-or-self::Content[parent::span[@class = 'smallcaps']]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="font-variant: small-caps;"&gt;</xsl:text>
                                    <xsl:value-of
                                        select="descendant-or-self::Content[parent::sc | ancestor::sc] | descendant-or-self::Content[parent::small | ancestor::small] | descendant-or-self::Content[parent::span[@class = 'smallcaps']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when
                                    test="descendant-or-self::Content[parent::sub | ancestor::sub] | descendant-or-self::Content[parent::span[@class = 'sub']]">
                                    <xsl:text disable-output-escaping="yes">&lt;sub&gt;</xsl:text>
                                    <xsl:value-of
                                        select="descendant-or-self::Content[parent::sub | ancestor::sub] | descendant-or-self::Content[parent::span[@class = 'sub']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/sub&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when
                                    test="descendant-or-self::Content[parent::sup | ancestor::sup] | descendant-or-self::Content[parent::span[@class = 'sup']]">
                                    <xsl:text disable-output-escaping="yes">&lt;sup&gt;</xsl:text>
                                    <xsl:value-of
                                        select="descendant-or-self::Content[parent::sup | ancestor::sup] | descendant-or-self::Content[parent::span[@class = 'sup']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/sup&gt;</xsl:text>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="."/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                        <!--<xsl:variable name="chapterHeads">
                            <xsl:call-template name="span"/>
                        </xsl:variable>
                        <xsl:if test="string-length($chapterHeads) &gt; 0">
                            <xsl:value-of select="normalize-space($chapterHeads)"/>
                        </xsl:if>-->
                    </xsl:variable>
                    
                    <xsl:variable name="UUID">
                        <!--<xsl:value-of select="@ParaInfo/substring-before(substring-after(.,'_p_'),'_txtid')"/>-->
                       
                     <!--   <xsl:choose>
                            <xsl:when test="matches(@ParaInfo/.,'UUID_para')">
                                <xsl:value-of select="@ParaInfo/substring-after(.,'UUID_para')"/>
                            </xsl:when>
                            <xsl:when test="matches(@ParaInfo/.,'_UUID_')">
                                <xsl:value-of select="@ParaInfo/substring-after(.,'_UUID_')"/>
                            </xsl:when>
                        </xsl:choose>-->
                        <xsl:variable name="val">
                        <xsl:choose>
                            <xsl:when test="matches(@w:rsidR/.,'UUID_para')">
                                <xsl:value-of select="@w:rsidR/substring-after(.,'UUID_para')"/>
                            </xsl:when>
                            <xsl:when test="matches(@w:rsidR/.,'_UUID_')">
                                <xsl:value-of select="@w:rsidR/substring-after(.,'_UUID_')"/>
                            </xsl:when>
                            <xsl:otherwise> 
                                <!--  if UUID is not there then i creating generate-id() function-->
                                <xsl:value-of select="concat('empty',generate-id())"/>
                            </xsl:otherwise>
                        </xsl:choose>
                        </xsl:variable>
                        <xsl:choose>
                            <xsl:when test="matches($val,'-')">
                                <xsl:value-of select="substring-before($val,'-')"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="$val"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>

                    <xsl:variable name="find-pNo">
                        <!--                        <xsl:value-of select="@ParaInfo/substring-before(substring-after(.,'_p_'),'_txtid')"/>                       -->
                        <xsl:choose>
                            <xsl:when test="@w:rsidR">
                                <xsl:value-of
                                    select="@w:rsidR/substring-before(substring-after(., '_p_'), '_txtid')"
                                />
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of
                                    select="descendant::HyperlinkTextDestination/@BookMarkDestination/substring-before(substring-after(., '_p_'), '_txtid')"
                                />
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>

                    <xsl:variable name="forEachText">
                        <xsl:value-of select="normalize-space(translate($chapterTitle, '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"/>
                    </xsl:variable>
                    <xsl:variable name="attName">  
                        <!-- can't create attribute on output.cf file with based on same @class value so i used UUID -->
                        <xsl:choose>
                            <xsl:when test="self::*/@class[string-length(.) &gt; 0]">
                                <xsl:value-of select="concat(self::*/normalize-space(@class),'-',$UUID)"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:variable>
                   
                    <xsl:attribute name="{$attName}">
                        <xsl:value-of select="$forEachText"/>
                        <xsl:text disable-output-escaping="yes">&lt;span&gt;</xsl:text>
                        <xsl:value-of select="concat('position-',position(),'_pageNo-',$find-pNo)"/>
<!--                        <xsl:value-of select="concat('pageNo-',$find-pNo)"/>-->
                        <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                    </xsl:attribute>
                    </xsl:if>
                        <!-- <xsl:choose>
                        <xsl:when test="self::p[@toc = 'true']">                                                        
                            
                            <xsl:variable name="attName">
                                <!-\-<xsl:value-of select="concat(self::ParagraphStyleRange/@Appliedsubstring-after(.,''),'-')"/>-\->
<!-\-                                <xsl:value-of select="concat(self::ParagraphStyleRange/@Appliedsubstring-after(.,''),'-', position(),'_p',$find-pNo)"/>-\->
                                <!-\-<xsl:value-of select="concat(self::ParagraphStyleRange/@Appliedsubstring-after(.,''),'-', position())"/>-\->
<!-\-                                <xsl:value-of select="concat(descendant-or-self::*/@BookMarkDestination/substring-after(.,''),'-',$UUID)"/>-\->
                                <!-\-02-11-2023 commented for unable to match heading level for TOC process   -\->
                               <!-\- <xsl:value-of select="concat(descendant-or-self::p/@class,'-',$UUID)"/>-\->
                                <xsl:value-of select="descendant-or-self::p/@class"/>

                            </xsl:variable>
                           
                            <xsl:attribute name="{$attName}">
                                <xsl:value-of select="$forEachText"/>
                                <xsl:text disable-output-escaping="yes">&lt;span&gt;</xsl:text>
                                <xsl:value-of select="concat('position-',position(),'_pageNo-',$find-pNo)"/>
<!-\-                                <xsl:value-of select="concat('pageNo-',$find-pNo)"/>-\->
                                <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                            </xsl:attribute>
                        </xsl:when>
                    </xsl:choose>-->

                    <!-- 02-11-2023 below condition commented for azure id 11767 with unwanted content-->
                    <!-- <xsl:when test="self::h1[@toc = 'true']">
                    <xsl:variable name="chapterTitle">  
                        <xsl:for-each select="descendant-or-self::Content">
                            <xsl:choose>                               
                                <xsl:when test="self::Content[parent::i |  ancestor::i]">
                                    <xsl:text disable-output-escaping="yes">&lt;i&gt;</xsl:text>
                                    <xsl:value-of select="self::Content[parent::i |  ancestor::i][1]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/i&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::b |  ancestor::b]">
                                    <xsl:text disable-output-escaping="yes">&lt;b&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::b |  ancestor::b]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/b&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::u |  ancestor::u]">
                                    <xsl:text disable-output-escaping="yes">&lt;u&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::u |  ancestor::u]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/u&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="parent::span/preceding-sibling::*[1][self::w:rPr/w:caps]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="text-transform: uppercase;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="parent::span/preceding-sibling::*[1][self::w:rPr/w:smallCaps]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="font-variant: small-caps;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::span[@class = 'allcaps']]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="text-transform: uppercase;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::span[@class = 'allcaps']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::s |  ancestor::s] | descendant-or-self::Content[parent::span[@class = 'strike']]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="text-decoration: line-through;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::s |  ancestor::s] | descendant-or-self::Content[parent::span[@class = 'strike']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::sc |  ancestor::sc] | descendant-or-self::Content[parent::small | ancestor::small] | descendant-or-self::Content[parent::span[@class = 'smallcaps']]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="font-variant: small-caps;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::sc |  ancestor::sc] | descendant-or-self::Content[parent::small  | ancestor::small] | descendant-or-self::Content[parent::span[@class = 'smallcaps']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::sub | ancestor::sub] | descendant-or-self::Content[parent::span[@class = 'sub']]">
                                    <xsl:text disable-output-escaping="yes">&lt;sub&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::sub | ancestor::sub] | descendant-or-self::Content[parent::span[@class = 'sub']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/sub&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::sup | ancestor::sup] | descendant-or-self::Content[parent::span[@class = 'sup']]">
                                    <xsl:text disable-output-escaping="yes">&lt;sup&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::sup | ancestor::sup] | descendant-or-self::Content[parent::span[@class = 'sup']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/sup&gt;</xsl:text>
                                </xsl:when>                   
                                <xsl:otherwise>                                
                                    <xsl:value-of select="."/>   
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                        <!-\-<xsl:variable name="chapterHeads">
                            <xsl:call-template name="span"/>
                        </xsl:variable>
                        <xsl:if test="string-length($chapterHeads) &gt; 0">
                            <xsl:value-of select="normalize-space($chapterHeads)"/>
                        </xsl:if>-\->
                    </xsl:variable>
                    <!-\-02-11-2023 commented for unable to match heading level for TOC process   -\->
                    <!-\-<xsl:variable name="UUID">
                        <!-\\-<xsl:value-of select="@ParaInfo/substring-before(substring-after(.,'_p_'),'_txtid')"/>-\\->
                        
                        <!-\\-   <xsl:choose>
                            <xsl:when test="matches(@ParaInfo/.,'UUID_para')">
                                <xsl:value-of select="@ParaInfo/substring-after(.,'UUID_para')"/>
                            </xsl:when>
                            <xsl:when test="matches(@ParaInfo/.,'_UUID_')">
                                <xsl:value-of select="@ParaInfo/substring-after(.,'_UUID_')"/>
                            </xsl:when>
                        </xsl:choose>-\\->
                        <xsl:choose>
                            <xsl:when test="matches(@w:rsidR/.,'UUID_para')">
                                <xsl:value-of select="@w:rsidR/substring-after(.,'UUID_para')"/>
                            </xsl:when>
                            <xsl:when test="matches(@w:rsidR/.,'_UUID_')">
                                <xsl:value-of select="@w:rsidR/substring-after(.,'_UUID_')"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:variable>-\->
                    
                    <xsl:variable name="find-pNo">
                        <!-\-                        <xsl:value-of select="@ParaInfo/substring-before(substring-after(.,'_p_'),'_txtid')"/>                       -\->
                        <xsl:choose>
                            <xsl:when test="@w:rsidR">
                                <xsl:value-of select="@w:rsidR/substring-before(substring-after(.,'_p_'),'_txtid')"/>   
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="descendant::HyperlinkTextDestination/@BookMarkDestination/substring-before(substring-after(.,'_p_'),'_txtid')"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    
                    <xsl:variable name="forEachText">
                        <xsl:value-of select="normalize-space(translate($chapterTitle, '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"/>
                    </xsl:variable>
                    
                    <xsl:choose>
                        <xsl:when test="self::*[@toc = 'true']">                                                        
                            
                            <xsl:variable name="attName">
                                <!-\-<xsl:value-of select="concat(self::ParagraphStyleRange/@Appliedsubstring-after(.,''),'-')"/>-\->
                                <!-\-                                <xsl:value-of select="concat(self::ParagraphStyleRange/@Appliedsubstring-after(.,''),'-', position(),'_p',$find-pNo)"/>-\->
                                <!-\-<xsl:value-of select="concat(self::ParagraphStyleRange/@Appliedsubstring-after(.,''),'-', position())"/>-\->
                                <!-\-                                <xsl:value-of select="concat(descendant-or-self::*/@BookMarkDestination/substring-after(.,''),'-',$UUID)"/>-\->
                                <!-\-02-11-2023 commented for unable to match heading level for TOC process   -\->
                                <!-\-<xsl:value-of select="concat(descendant-or-self::h3/@class,'-',$UUID)"/>-\->
                                <xsl:value-of select="descendant-or-self::h1/@class"/>
                            </xsl:variable>
                            
                            <xsl:attribute name="{$attName}">
                                <xsl:value-of select="$forEachText"/>
                                <xsl:text disable-output-escaping="yes">&lt;span&gt;</xsl:text>
                                <xsl:value-of select="concat('position-',position(),'_pageNo-',$find-pNo)"/>
                                <!-\-                                <xsl:value-of select="concat('pageNo-',$find-pNo)"/>-\->
                                <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                            </xsl:attribute>
                        </xsl:when>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="self::h3[@toc = 'true']">
                    <xsl:variable name="chapterTitle">  
                        <xsl:for-each select="descendant-or-self::Content">
                            <xsl:choose>                               
                                <xsl:when test="self::Content[parent::i |  ancestor::i]">
                                    <xsl:text disable-output-escaping="yes">&lt;i&gt;</xsl:text>
                                    <xsl:value-of select="self::Content[parent::i |  ancestor::i][1]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/i&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::b |  ancestor::b]">
                                    <xsl:text disable-output-escaping="yes">&lt;b&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::b |  ancestor::b]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/b&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::u |  ancestor::u]">
                                    <xsl:text disable-output-escaping="yes">&lt;u&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::u |  ancestor::u]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/u&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="parent::span/preceding-sibling::*[1][self::w:rPr/w:caps]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="text-transform: uppercase;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="parent::span/preceding-sibling::*[1][self::w:rPr/w:smallCaps]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="font-variant: small-caps;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::span[@class = 'allcaps']]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="text-transform: uppercase;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::span[@class = 'allcaps']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::s |  ancestor::s] | descendant-or-self::Content[parent::span[@class = 'strike']]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="text-decoration: line-through;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::s |  ancestor::s] | descendant-or-self::Content[parent::span[@class = 'strike']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::sc |  ancestor::sc] | descendant-or-self::Content[parent::small | ancestor::small] | descendant-or-self::Content[parent::span[@class = 'smallcaps']]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="font-variant: small-caps;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::sc |  ancestor::sc] | descendant-or-self::Content[parent::small  | ancestor::small] | descendant-or-self::Content[parent::span[@class = 'smallcaps']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::sub | ancestor::sub] | descendant-or-self::Content[parent::span[@class = 'sub']]">
                                    <xsl:text disable-output-escaping="yes">&lt;sub&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::sub | ancestor::sub] | descendant-or-self::Content[parent::span[@class = 'sub']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/sub&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::sup | ancestor::sup] | descendant-or-self::Content[parent::span[@class = 'sup']]">
                                    <xsl:text disable-output-escaping="yes">&lt;sup&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::sup | ancestor::sup] | descendant-or-self::Content[parent::span[@class = 'sup']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/sup&gt;</xsl:text>
                                </xsl:when>                   
                                <xsl:otherwise>                                
                                    <xsl:value-of select="."/>   
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                        <!-\-<xsl:variable name="chapterHeads">
                            <xsl:call-template name="span"/>
                        </xsl:variable>
                        <xsl:if test="string-length($chapterHeads) &gt; 0">
                            <xsl:value-of select="normalize-space($chapterHeads)"/>
                        </xsl:if>-\->
                    </xsl:variable>
                    <!-\-02-11-2023 commented for unable to match heading level for TOC process   -\->
                    <!-\-<xsl:variable name="UUID">
                        <!-\\-<xsl:value-of select="@ParaInfo/substring-before(substring-after(.,'_p_'),'_txtid')"/>-\\->
                        
                        <!-\\-   <xsl:choose>
                            <xsl:when test="matches(@ParaInfo/.,'UUID_para')">
                                <xsl:value-of select="@ParaInfo/substring-after(.,'UUID_para')"/>
                            </xsl:when>
                            <xsl:when test="matches(@ParaInfo/.,'_UUID_')">
                                <xsl:value-of select="@ParaInfo/substring-after(.,'_UUID_')"/>
                            </xsl:when>
                        </xsl:choose>-\\->
                        <xsl:choose>
                            <xsl:when test="matches(@w:rsidR/.,'UUID_para')">
                                <xsl:value-of select="@w:rsidR/substring-after(.,'UUID_para')"/>
                            </xsl:when>
                            <xsl:when test="matches(@w:rsidR/.,'_UUID_')">
                                <xsl:value-of select="@w:rsidR/substring-after(.,'_UUID_')"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:variable>-\->
                    
                    <xsl:variable name="find-pNo">
                        <!-\-                        <xsl:value-of select="@ParaInfo/substring-before(substring-after(.,'_p_'),'_txtid')"/>                       -\->
                        <xsl:choose>
                            <xsl:when test="@w:rsidR">
                                <xsl:value-of select="@w:rsidR/substring-before(substring-after(.,'_p_'),'_txtid')"/>   
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="descendant::HyperlinkTextDestination/@BookMarkDestination/substring-before(substring-after(.,'_p_'),'_txtid')"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    
                    <xsl:variable name="forEachText">
                        <xsl:value-of select="normalize-space(translate($chapterTitle, '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"/>
                    </xsl:variable>
                    
                    <xsl:choose>
                        <xsl:when test="self::*[@toc = 'true']">                                                        
                            
                            <xsl:variable name="attName">
                                <!-\-<xsl:value-of select="concat(self::ParagraphStyleRange/@Appliedsubstring-after(.,''),'-')"/>-\->
                                <!-\-                                <xsl:value-of select="concat(self::ParagraphStyleRange/@Appliedsubstring-after(.,''),'-', position(),'_p',$find-pNo)"/>-\->
                                <!-\-<xsl:value-of select="concat(self::ParagraphStyleRange/@Appliedsubstring-after(.,''),'-', position())"/>-\->
                                <!-\-                                <xsl:value-of select="concat(descendant-or-self::*/@BookMarkDestination/substring-after(.,''),'-',$UUID)"/>-\->
                                <!-\-02-11-2023 commented for unable to match heading level for TOC process   -\->
                                <!-\-<xsl:value-of select="concat(descendant-or-self::h3/@class,'-',$UUID)"/>-\->
                                <xsl:value-of select="descendant-or-self::h3/@class"/>
                            </xsl:variable>
                            
                            <xsl:attribute name="{$attName}">
                                <xsl:value-of select="$forEachText"/>
                                <xsl:text disable-output-escaping="yes">&lt;span&gt;</xsl:text>
                                <xsl:value-of select="concat('position-',position(),'_pageNo-',$find-pNo)"/>
                                <!-\-                                <xsl:value-of select="concat('pageNo-',$find-pNo)"/>-\->
                                <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                            </xsl:attribute>
                        </xsl:when>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="self::h4[@toc = 'true']">
                    <xsl:variable name="chapterTitle">  
                        <xsl:for-each select="descendant-or-self::Content">
                            <xsl:choose>                               
                                <xsl:when test="self::Content[parent::i |  ancestor::i]">
                                    <xsl:text disable-output-escaping="yes">&lt;i&gt;</xsl:text>
                                    <xsl:value-of select="self::Content[parent::i |  ancestor::i][1]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/i&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::b |  ancestor::b]">
                                    <xsl:text disable-output-escaping="yes">&lt;b&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::b |  ancestor::b]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/b&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::u |  ancestor::u]">
                                    <xsl:text disable-output-escaping="yes">&lt;u&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::u |  ancestor::u]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/u&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="parent::span/preceding-sibling::*[1][self::w:rPr/w:caps]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="text-transform: uppercase;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="parent::span/preceding-sibling::*[1][self::w:rPr/w:smallCaps]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="font-variant: small-caps;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::span[@class = 'allcaps']]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="text-transform: uppercase;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::span[@class = 'allcaps']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::s |  ancestor::s] | descendant-or-self::Content[parent::span[@class = 'strike']]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="text-decoration: line-through;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::s |  ancestor::s] | descendant-or-self::Content[parent::span[@class = 'strike']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::sc |  ancestor::sc] | descendant-or-self::Content[parent::small | ancestor::small] | descendant-or-self::Content[parent::span[@class = 'smallcaps']]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="font-variant: small-caps;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::sc |  ancestor::sc] | descendant-or-self::Content[parent::small  | ancestor::small] | descendant-or-self::Content[parent::span[@class = 'smallcaps']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::sub | ancestor::sub] | descendant-or-self::Content[parent::span[@class = 'sub']]">
                                    <xsl:text disable-output-escaping="yes">&lt;sub&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::sub | ancestor::sub] | descendant-or-self::Content[parent::span[@class = 'sub']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/sub&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::sup | ancestor::sup] | descendant-or-self::Content[parent::span[@class = 'sup']]">
                                    <xsl:text disable-output-escaping="yes">&lt;sup&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::sup | ancestor::sup] | descendant-or-self::Content[parent::span[@class = 'sup']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/sup&gt;</xsl:text>
                                </xsl:when>                   
                                <xsl:otherwise>                                
                                    <xsl:value-of select="."/>   
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                        <!-\-<xsl:variable name="chapterHeads">
                            <xsl:call-template name="span"/>
                        </xsl:variable>
                        <xsl:if test="string-length($chapterHeads) &gt; 0">
                            <xsl:value-of select="normalize-space($chapterHeads)"/>
                        </xsl:if>-\->
                    </xsl:variable>
                    
                   <!-\- <xsl:variable name="UUID">
                        <!-\\-<xsl:value-of select="@ParaInfo/substring-before(substring-after(.,'_p_'),'_txtid')"/>-\\->
                        
                        <!-\\-   <xsl:choose>
                            <xsl:when test="matches(@ParaInfo/.,'UUID_para')">
                                <xsl:value-of select="@ParaInfo/substring-after(.,'UUID_para')"/>
                            </xsl:when>
                            <xsl:when test="matches(@ParaInfo/.,'_UUID_')">
                                <xsl:value-of select="@ParaInfo/substring-after(.,'_UUID_')"/>
                            </xsl:when>
                        </xsl:choose>-\\->
                        <xsl:choose>
                            <xsl:when test="matches(@w:rsidR/.,'UUID_para')">
                                <xsl:value-of select="@w:rsidR/substring-after(.,'UUID_para')"/>
                            </xsl:when>
                            <xsl:when test="matches(@w:rsidR/.,'_UUID_')">
                                <xsl:value-of select="@w:rsidR/substring-after(.,'_UUID_')"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:variable>-\->
                    
                    <xsl:variable name="find-pNo">
                        <!-\-                        <xsl:value-of select="@ParaInfo/substring-before(substring-after(.,'_p_'),'_txtid')"/>                       -\->
                        <xsl:choose>
                            <xsl:when test="@w:rsidR">
                                <xsl:value-of select="@w:rsidR/substring-before(substring-after(.,'_p_'),'_txtid')"/>   
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="descendant::HyperlinkTextDestination/@BookMarkDestination/substring-before(substring-after(.,'_p_'),'_txtid')"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    
                    <xsl:variable name="forEachText">
                        <xsl:value-of select="normalize-space(translate($chapterTitle, '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"/>
                    </xsl:variable>
                    
                    <xsl:choose>
                        <xsl:when test="self::*[@toc = 'true']">                                                        
                            
                            <xsl:variable name="attName">
                                <!-\-<xsl:value-of select="concat(self::ParagraphStyleRange/@Appliedsubstring-after(.,''),'-')"/>-\->
                                <!-\-                                <xsl:value-of select="concat(self::ParagraphStyleRange/@Appliedsubstring-after(.,''),'-', position(),'_p',$find-pNo)"/>-\->
                                <!-\-<xsl:value-of select="concat(self::ParagraphStyleRange/@Appliedsubstring-after(.,''),'-', position())"/>-\->
                                <!-\-                                <xsl:value-of select="concat(descendant-or-self::*/@BookMarkDestination/substring-after(.,''),'-',$UUID)"/>-\->
                                <!-\-02-11-2023 commented for unable to match heading level for TOC process   -\->
<!-\-                                <xsl:value-of select="concat(descendant-or-self::h4/@class,'-',$UUID)"/>-\->
                                <xsl:value-of select="descendant-or-self::h4/@class"/>
                                
                            </xsl:variable>
                            
                            <xsl:attribute name="{$attName}">
                                <xsl:value-of select="$forEachText"/>
                                <xsl:text disable-output-escaping="yes">&lt;span&gt;</xsl:text>
                                <xsl:value-of select="concat('position-',position(),'_pageNo-',$find-pNo)"/>
                                <!-\-                                <xsl:value-of select="concat('pageNo-',$find-pNo)"/>-\->
                                <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                            </xsl:attribute>
                        </xsl:when>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="self::h5[@toc = 'true']">
                    <xsl:variable name="chapterTitle">  
                        <xsl:for-each select="descendant-or-self::Content">
                            <xsl:choose>                               
                                <xsl:when test="self::Content[parent::i |  ancestor::i]">
                                    <xsl:text disable-output-escaping="yes">&lt;i&gt;</xsl:text>
                                    <xsl:value-of select="self::Content[parent::i |  ancestor::i][1]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/i&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::b |  ancestor::b]">
                                    <xsl:text disable-output-escaping="yes">&lt;b&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::b |  ancestor::b]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/b&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::u |  ancestor::u]">
                                    <xsl:text disable-output-escaping="yes">&lt;u&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::u |  ancestor::u]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/u&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="parent::span/preceding-sibling::*[1][self::w:rPr/w:caps]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="text-transform: uppercase;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="parent::span/preceding-sibling::*[1][self::w:rPr/w:smallCaps]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="font-variant: small-caps;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::span[@class = 'allcaps']]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="text-transform: uppercase;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::span[@class = 'allcaps']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::s |  ancestor::s] | descendant-or-self::Content[parent::span[@class = 'strike']]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="text-decoration: line-through;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::s |  ancestor::s] | descendant-or-self::Content[parent::span[@class = 'strike']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::sc |  ancestor::sc] | descendant-or-self::Content[parent::small | ancestor::small] | descendant-or-self::Content[parent::span[@class = 'smallcaps']]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="font-variant: small-caps;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::sc |  ancestor::sc] | descendant-or-self::Content[parent::small  | ancestor::small] | descendant-or-self::Content[parent::span[@class = 'smallcaps']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::sub | ancestor::sub] | descendant-or-self::Content[parent::span[@class = 'sub']]">
                                    <xsl:text disable-output-escaping="yes">&lt;sub&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::sub | ancestor::sub] | descendant-or-self::Content[parent::span[@class = 'sub']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/sub&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::sup | ancestor::sup] | descendant-or-self::Content[parent::span[@class = 'sup']]">
                                    <xsl:text disable-output-escaping="yes">&lt;sup&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::sup | ancestor::sup] | descendant-or-self::Content[parent::span[@class = 'sup']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/sup&gt;</xsl:text>
                                </xsl:when>                   
                                <xsl:otherwise>                                
                                    <xsl:value-of select="."/>   
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                        <!-\-<xsl:variable name="chapterHeads">
                            <xsl:call-template name="span"/>
                        </xsl:variable>
                        <xsl:if test="string-length($chapterHeads) &gt; 0">
                            <xsl:value-of select="normalize-space($chapterHeads)"/>
                        </xsl:if>-\->
                    </xsl:variable>
                    <!-\-02-11-2023 commented for unable to match heading level for TOC process   -\->
                    <!-\-<xsl:variable name="UUID">
                        <!-\\-<xsl:value-of select="@ParaInfo/substring-before(substring-after(.,'_p_'),'_txtid')"/>-\\->
                        
                        <!-\\-   <xsl:choose>
                            <xsl:when test="matches(@ParaInfo/.,'UUID_para')">
                                <xsl:value-of select="@ParaInfo/substring-after(.,'UUID_para')"/>
                            </xsl:when>
                            <xsl:when test="matches(@ParaInfo/.,'_UUID_')">
                                <xsl:value-of select="@ParaInfo/substring-after(.,'_UUID_')"/>
                            </xsl:when>
                        </xsl:choose>-\\->
                        <xsl:choose>
                            <xsl:when test="matches(@w:rsidR/.,'UUID_para')">
                                <xsl:value-of select="@w:rsidR/substring-after(.,'UUID_para')"/>
                            </xsl:when>
                            <xsl:when test="matches(@w:rsidR/.,'_UUID_')">
                                <xsl:value-of select="@w:rsidR/substring-after(.,'_UUID_')"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:variable>-\->
                    
                    <xsl:variable name="find-pNo">
                        <!-\-                        <xsl:value-of select="@ParaInfo/substring-before(substring-after(.,'_p_'),'_txtid')"/>                       -\->
                        <xsl:choose>
                            <xsl:when test="@w:rsidR">
                                <xsl:value-of select="@w:rsidR/substring-before(substring-after(.,'_p_'),'_txtid')"/>   
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="descendant::HyperlinkTextDestination/@BookMarkDestination/substring-before(substring-after(.,'_p_'),'_txtid')"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    
                    <xsl:variable name="forEachText">
                        <xsl:value-of select="normalize-space(translate($chapterTitle, '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"/>
                    </xsl:variable>
                    
                    <xsl:choose>
                        <xsl:when test="self::*[@toc = 'true']">                                                        
                            
                            <xsl:variable name="attName">
                                <!-\-<xsl:value-of select="concat(self::ParagraphStyleRange/@Appliedsubstring-after(.,''),'-')"/>-\->
                                <!-\-                                <xsl:value-of select="concat(self::ParagraphStyleRange/@Appliedsubstring-after(.,''),'-', position(),'_p',$find-pNo)"/>-\->
                                <!-\-<xsl:value-of select="concat(self::ParagraphStyleRange/@Appliedsubstring-after(.,''),'-', position())"/>-\->
                                <!-\-                                <xsl:value-of select="concat(descendant-or-self::*/@BookMarkDestination/substring-after(.,''),'-',$UUID)"/>-\->
                                <!-\-02-11-2023 commented for unable to match heading level for TOC process   -\->
                                <!-\-<xsl:value-of select="concat(descendant-or-self::h5/@class,'-',$UUID)"/>-\->
                                <xsl:value-of select="descendant-or-self::h5/@class"/>
                            </xsl:variable>
                            
                            <xsl:attribute name="{$attName}">
                                <xsl:value-of select="$forEachText"/>
                                <xsl:text disable-output-escaping="yes">&lt;span&gt;</xsl:text>
                                <xsl:value-of select="concat('position-',position(),'_pageNo-',$find-pNo)"/>
                                <!-\-                                <xsl:value-of select="concat('pageNo-',$find-pNo)"/>-\->
                                <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                            </xsl:attribute>
                        </xsl:when>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="self::h6[@toc = 'true']">
                    <xsl:variable name="chapterTitle">  
                        <xsl:for-each select="descendant-or-self::Content">
                            <xsl:choose>                               
                                <xsl:when test="self::Content[parent::i |  ancestor::i]">
                                    <xsl:text disable-output-escaping="yes">&lt;i&gt;</xsl:text>
                                    <xsl:value-of select="self::Content[parent::i |  ancestor::i][1]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/i&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::b |  ancestor::b]">
                                    <xsl:text disable-output-escaping="yes">&lt;b&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::b |  ancestor::b]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/b&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::u |  ancestor::u]">
                                    <xsl:text disable-output-escaping="yes">&lt;u&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::u |  ancestor::u]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/u&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="parent::span/preceding-sibling::*[1][self::w:rPr/w:caps]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="text-transform: uppercase;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="parent::span/preceding-sibling::*[1][self::w:rPr/w:smallCaps]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="font-variant: small-caps;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::span[@class = 'allcaps']]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="text-transform: uppercase;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::span[@class = 'allcaps']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::s |  ancestor::s] | descendant-or-self::Content[parent::span[@class = 'strike']]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="text-decoration: line-through;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::s |  ancestor::s] | descendant-or-self::Content[parent::span[@class = 'strike']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::sc |  ancestor::sc] | descendant-or-self::Content[parent::small | ancestor::small] | descendant-or-self::Content[parent::span[@class = 'smallcaps']]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="font-variant: small-caps;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::sc |  ancestor::sc] | descendant-or-self::Content[parent::small  | ancestor::small] | descendant-or-self::Content[parent::span[@class = 'smallcaps']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::sub | ancestor::sub] | descendant-or-self::Content[parent::span[@class = 'sub']]">
                                    <xsl:text disable-output-escaping="yes">&lt;sub&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::sub | ancestor::sub] | descendant-or-self::Content[parent::span[@class = 'sub']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/sub&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::sup | ancestor::sup] | descendant-or-self::Content[parent::span[@class = 'sup']]">
                                    <xsl:text disable-output-escaping="yes">&lt;sup&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::sup | ancestor::sup] | descendant-or-self::Content[parent::span[@class = 'sup']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/sup&gt;</xsl:text>
                                </xsl:when>                   
                                <xsl:otherwise>                                
                                    <xsl:value-of select="."/>   
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                        <!-\-<xsl:variable name="chapterHeads">
                            <xsl:call-template name="span"/>
                        </xsl:variable>
                        <xsl:if test="string-length($chapterHeads) &gt; 0">
                            <xsl:value-of select="normalize-space($chapterHeads)"/>
                        </xsl:if>-\->
                    </xsl:variable>
                    
                    <xsl:variable name="UUID">
                        <!-\-<xsl:value-of select="@ParaInfo/substring-before(substring-after(.,'_p_'),'_txtid')"/>-\->
                        
                        <!-\-   <xsl:choose>
                            <xsl:when test="matches(@ParaInfo/.,'UUID_para')">
                                <xsl:value-of select="@ParaInfo/substring-after(.,'UUID_para')"/>
                            </xsl:when>
                            <xsl:when test="matches(@ParaInfo/.,'_UUID_')">
                                <xsl:value-of select="@ParaInfo/substring-after(.,'_UUID_')"/>
                            </xsl:when>
                        </xsl:choose>-\->
                        <xsl:choose>
                            <xsl:when test="matches(@w:rsidR/.,'UUID_para')">
                                <xsl:value-of select="@w:rsidR/substring-after(.,'UUID_para')"/>
                            </xsl:when>
                            <xsl:when test="matches(@w:rsidR/.,'_UUID_')">
                                <xsl:value-of select="@w:rsidR/substring-after(.,'_UUID_')"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:variable>
                    
                    <xsl:variable name="find-pNo">
                        <!-\-                        <xsl:value-of select="@ParaInfo/substring-before(substring-after(.,'_p_'),'_txtid')"/>                       -\->
                        <xsl:choose>
                            <xsl:when test="@w:rsidR">
                                <xsl:value-of select="@w:rsidR/substring-before(substring-after(.,'_p_'),'_txtid')"/>   
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="descendant::HyperlinkTextDestination/@BookMarkDestination/substring-before(substring-after(.,'_p_'),'_txtid')"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    
                    <xsl:variable name="forEachText">
                        <xsl:value-of select="normalize-space(translate($chapterTitle, '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"/>
                    </xsl:variable>
                    
                    <xsl:choose>
                        <xsl:when test="self::*[@toc = 'true']">                                                        
                            
                            <xsl:variable name="attName">
                                <!-\-<xsl:value-of select="concat(self::ParagraphStyleRange/@Appliedsubstring-after(.,''),'-')"/>-\->
                                <!-\-                                <xsl:value-of select="concat(self::ParagraphStyleRange/@Appliedsubstring-after(.,''),'-', position(),'_p',$find-pNo)"/>-\->
                                <!-\-<xsl:value-of select="concat(self::ParagraphStyleRange/@Appliedsubstring-after(.,''),'-', position())"/>-\->
                                <!-\-02-11-2023 commented for unable to match heading level for TOC process   -\->
                                <!-\-                                <xsl:value-of select="concat(descendant-or-self::*/@BookMarkDestination/substring-after(.,''),'-',$UUID)"/>-\->
                                <xsl:value-of select="concat(descendant-or-self::h6/@class,'-',$UUID)"/>
                                
                            </xsl:variable>
                            
                            <xsl:attribute name="{$attName}">
                                <xsl:value-of select="$forEachText"/>
                                <xsl:text disable-output-escaping="yes">&lt;span&gt;</xsl:text>
                                <xsl:value-of select="concat('position-',position(),'_pageNo-',$find-pNo)"/>
                                <!-\-                                <xsl:value-of select="concat('pageNo-',$find-pNo)"/>-\->
                                <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                            </xsl:attribute>
                        </xsl:when>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="self::h7[@toc = 'true']">
                    <xsl:variable name="chapterTitle">  
                        <xsl:for-each select="descendant-or-self::Content">
                            <xsl:choose>                               
                                <xsl:when test="self::Content[parent::i |  ancestor::i]">
                                    <xsl:text disable-output-escaping="yes">&lt;i&gt;</xsl:text>
                                    <xsl:value-of select="self::Content[parent::i |  ancestor::i][1]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/i&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::b |  ancestor::b]">
                                    <xsl:text disable-output-escaping="yes">&lt;b&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::b |  ancestor::b]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/b&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::u |  ancestor::u]">
                                    <xsl:text disable-output-escaping="yes">&lt;u&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::u |  ancestor::u]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/u&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="parent::span/preceding-sibling::*[1][self::w:rPr/w:caps]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="text-transform: uppercase;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="parent::span/preceding-sibling::*[1][self::w:rPr/w:smallCaps]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="font-variant: small-caps;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::span[@class = 'allcaps']]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="text-transform: uppercase;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::span[@class = 'allcaps']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::s |  ancestor::s] | descendant-or-self::Content[parent::span[@class = 'strike']]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="text-decoration: line-through;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::s |  ancestor::s] | descendant-or-self::Content[parent::span[@class = 'strike']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::sc |  ancestor::sc] | descendant-or-self::Content[parent::small | ancestor::small] | descendant-or-self::Content[parent::span[@class = 'smallcaps']]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="font-variant: small-caps;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::sc |  ancestor::sc] | descendant-or-self::Content[parent::small  | ancestor::small] | descendant-or-self::Content[parent::span[@class = 'smallcaps']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::sub | ancestor::sub] | descendant-or-self::Content[parent::span[@class = 'sub']]">
                                    <xsl:text disable-output-escaping="yes">&lt;sub&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::sub | ancestor::sub] | descendant-or-self::Content[parent::span[@class = 'sub']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/sub&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::sup | ancestor::sup] | descendant-or-self::Content[parent::span[@class = 'sup']]">
                                    <xsl:text disable-output-escaping="yes">&lt;sup&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::sup | ancestor::sup] | descendant-or-self::Content[parent::span[@class = 'sup']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/sup&gt;</xsl:text>
                                </xsl:when>                   
                                <xsl:otherwise>                                
                                    <xsl:value-of select="."/>   
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                        <!-\-<xsl:variable name="chapterHeads">
                            <xsl:call-template name="span"/>
                        </xsl:variable>
                        <xsl:if test="string-length($chapterHeads) &gt; 0">
                            <xsl:value-of select="normalize-space($chapterHeads)"/>
                        </xsl:if>-\->
                    </xsl:variable>
                    
                   <!-\- <xsl:variable name="UUID">
                        <!-\\-<xsl:value-of select="@ParaInfo/substring-before(substring-after(.,'_p_'),'_txtid')"/>-\\->
                        
                        <!-\\-   <xsl:choose>
                            <xsl:when test="matches(@ParaInfo/.,'UUID_para')">
                                <xsl:value-of select="@ParaInfo/substring-after(.,'UUID_para')"/>
                            </xsl:when>
                            <xsl:when test="matches(@ParaInfo/.,'_UUID_')">
                                <xsl:value-of select="@ParaInfo/substring-after(.,'_UUID_')"/>
                            </xsl:when>
                        </xsl:choose>-\\->
                        <xsl:choose>
                            <xsl:when test="matches(@w:rsidR/.,'UUID_para')">
                                <xsl:value-of select="@w:rsidR/substring-after(.,'UUID_para')"/>
                            </xsl:when>
                            <xsl:when test="matches(@w:rsidR/.,'_UUID_')">
                                <xsl:value-of select="@w:rsidR/substring-after(.,'_UUID_')"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:variable>-\->
                    
                    <xsl:variable name="find-pNo">
                        <!-\-                        <xsl:value-of select="@ParaInfo/substring-before(substring-after(.,'_p_'),'_txtid')"/>                       -\->
                        <xsl:choose>
                            <xsl:when test="@w:rsidR">
                                <xsl:value-of select="@w:rsidR/substring-before(substring-after(.,'_p_'),'_txtid')"/>   
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="descendant::HyperlinkTextDestination/@BookMarkDestination/substring-before(substring-after(.,'_p_'),'_txtid')"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    
                    <xsl:variable name="forEachText">
                        <xsl:value-of select="normalize-space(translate($chapterTitle, '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"/>
                    </xsl:variable>
                    
                    <xsl:choose>
                        <xsl:when test="self::*[@toc = 'true']">                                                        
                            
                            <xsl:variable name="attName">
                                <!-\-<xsl:value-of select="concat(self::ParagraphStyleRange/@Appliedsubstring-after(.,''),'-')"/>-\->
                                <!-\-                                <xsl:value-of select="concat(self::ParagraphStyleRange/@Appliedsubstring-after(.,''),'-', position(),'_p',$find-pNo)"/>-\->
                                <!-\-<xsl:value-of select="concat(self::ParagraphStyleRange/@Appliedsubstring-after(.,''),'-', position())"/>-\->
                                <!-\-                                <xsl:value-of select="concat(descendant-or-self::*/@BookMarkDestination/substring-after(.,''),'-',$UUID)"/>-\->
                                <!-\-02-11-2023 commented for unable to match heading level for TOC process   -\->
                                <!-\-<xsl:value-of select="concat(descendant-or-self::h7/@class,'-',$UUID)"/>-\->
                                <xsl:value-of select="descendant-or-self::h7/@class"/>
                            </xsl:variable>
                            
                            <xsl:attribute name="{$attName}">
                                <xsl:value-of select="$forEachText"/>
                                <xsl:text disable-output-escaping="yes">&lt;span&gt;</xsl:text>
                                <xsl:value-of select="concat('position-',position(),'_pageNo-',$find-pNo)"/>
                                <!-\-                                <xsl:value-of select="concat('pageNo-',$find-pNo)"/>-\->
                                <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                            </xsl:attribute>
                        </xsl:when>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="self::h8[@toc = 'true']">
                    <xsl:variable name="chapterTitle">  
                        <xsl:for-each select="descendant-or-self::Content">
                            <xsl:choose>                               
                                <xsl:when test="self::Content[parent::i |  ancestor::i]">
                                    <xsl:text disable-output-escaping="yes">&lt;i&gt;</xsl:text>
                                    <xsl:value-of select="self::Content[parent::i |  ancestor::i][1]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/i&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::b |  ancestor::b]">
                                    <xsl:text disable-output-escaping="yes">&lt;b&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::b |  ancestor::b]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/b&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::u |  ancestor::u]">
                                    <xsl:text disable-output-escaping="yes">&lt;u&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::u |  ancestor::u]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/u&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="parent::span/preceding-sibling::*[1][self::w:rPr/w:caps]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="text-transform: uppercase;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="parent::span/preceding-sibling::*[1][self::w:rPr/w:smallCaps]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="font-variant: small-caps;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::span[@class = 'allcaps']]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="text-transform: uppercase;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::span[@class = 'allcaps']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::s |  ancestor::s] | descendant-or-self::Content[parent::span[@class = 'strike']]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="text-decoration: line-through;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::s |  ancestor::s] | descendant-or-self::Content[parent::span[@class = 'strike']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::sc |  ancestor::sc] | descendant-or-self::Content[parent::small | ancestor::small] | descendant-or-self::Content[parent::span[@class = 'smallcaps']]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="font-variant: small-caps;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::sc |  ancestor::sc] | descendant-or-self::Content[parent::small  | ancestor::small] | descendant-or-self::Content[parent::span[@class = 'smallcaps']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::sub | ancestor::sub] | descendant-or-self::Content[parent::span[@class = 'sub']]">
                                    <xsl:text disable-output-escaping="yes">&lt;sub&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::sub | ancestor::sub] | descendant-or-self::Content[parent::span[@class = 'sub']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/sub&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::sup | ancestor::sup] | descendant-or-self::Content[parent::span[@class = 'sup']]">
                                    <xsl:text disable-output-escaping="yes">&lt;sup&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::sup | ancestor::sup] | descendant-or-self::Content[parent::span[@class = 'sup']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/sup&gt;</xsl:text>
                                </xsl:when>                   
                                <xsl:otherwise>                                
                                    <xsl:value-of select="."/>   
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                        <!-\-<xsl:variable name="chapterHeads">
                            <xsl:call-template name="span"/>
                        </xsl:variable>
                        <xsl:if test="string-length($chapterHeads) &gt; 0">
                            <xsl:value-of select="normalize-space($chapterHeads)"/>
                        </xsl:if>-\->
                    </xsl:variable>
                    
                  <!-\-  <xsl:variable name="UUID">
                        <!-\\-<xsl:value-of select="@ParaInfo/substring-before(substring-after(.,'_p_'),'_txtid')"/>-\\->
                        
                        <!-\\-   <xsl:choose>
                            <xsl:when test="matches(@ParaInfo/.,'UUID_para')">
                                <xsl:value-of select="@ParaInfo/substring-after(.,'UUID_para')"/>
                            </xsl:when>
                            <xsl:when test="matches(@ParaInfo/.,'_UUID_')">
                                <xsl:value-of select="@ParaInfo/substring-after(.,'_UUID_')"/>
                            </xsl:when>
                        </xsl:choose>-\\->
                        <xsl:choose>
                            <xsl:when test="matches(@w:rsidR/.,'UUID_para')">
                                <xsl:value-of select="@w:rsidR/substring-after(.,'UUID_para')"/>
                            </xsl:when>
                            <xsl:when test="matches(@w:rsidR/.,'_UUID_')">
                                <xsl:value-of select="@w:rsidR/substring-after(.,'_UUID_')"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:variable>
                    -\->
                    <xsl:variable name="find-pNo">
                        <!-\-                        <xsl:value-of select="@ParaInfo/substring-before(substring-after(.,'_p_'),'_txtid')"/>                       -\->
                        <xsl:choose>
                            <xsl:when test="@w:rsidR">
                                <xsl:value-of select="@w:rsidR/substring-before(substring-after(.,'_p_'),'_txtid')"/>   
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="descendant::HyperlinkTextDestination/@BookMarkDestination/substring-before(substring-after(.,'_p_'),'_txtid')"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    
                    <xsl:variable name="forEachText">
                        <xsl:value-of select="normalize-space(translate($chapterTitle, '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"/>
                    </xsl:variable>
                    
                    <xsl:choose>
                        <xsl:when test="self::*[@toc = 'true']">                                                        
                            
                            <xsl:variable name="attName">
                                <!-\-<xsl:value-of select="concat(self::ParagraphStyleRange/@Appliedsubstring-after(.,''),'-')"/>-\->
                                <!-\-                                <xsl:value-of select="concat(self::ParagraphStyleRange/@Appliedsubstring-after(.,''),'-', position(),'_p',$find-pNo)"/>-\->
                                <!-\-<xsl:value-of select="concat(self::ParagraphStyleRange/@Appliedsubstring-after(.,''),'-', position())"/>-\->
                                <!-\-                                <xsl:value-of select="concat(descendant-or-self::*/@BookMarkDestination/substring-after(.,''),'-',$UUID)"/>-\->
                                <!-\-02-11-2023 commented for unable to match heading level for TOC process   -\->
                                <!-\-<xsl:value-of select="concat(descendant-or-self::h8/@class,'-',$UUID)"/>-\->
                                <xsl:value-of select="descendant-or-self::h8/@class"/>
                            </xsl:variable>
                            
                            <xsl:attribute name="{$attName}">
                                <xsl:value-of select="$forEachText"/>
                                <xsl:text disable-output-escaping="yes">&lt;span&gt;</xsl:text>
                                <xsl:value-of select="concat('position-',position(),'_pageNo-',$find-pNo)"/>
                                <!-\-                                <xsl:value-of select="concat('pageNo-',$find-pNo)"/>-\->
                                <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                            </xsl:attribute>
                        </xsl:when>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="self::h9[@toc = 'true']">
                    <xsl:variable name="chapterTitle">  
                        <xsl:for-each select="descendant-or-self::Content">
                            <xsl:choose>                               
                                <xsl:when test="self::Content[parent::i |  ancestor::i]">
                                    <xsl:text disable-output-escaping="yes">&lt;i&gt;</xsl:text>
                                    <xsl:value-of select="self::Content[parent::i |  ancestor::i][1]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/i&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::b |  ancestor::b]">
                                    <xsl:text disable-output-escaping="yes">&lt;b&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::b |  ancestor::b]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/b&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::u |  ancestor::u]">
                                    <xsl:text disable-output-escaping="yes">&lt;u&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::u |  ancestor::u]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/u&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="parent::span/preceding-sibling::*[1][self::w:rPr/w:caps]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="text-transform: uppercase;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="parent::span/preceding-sibling::*[1][self::w:rPr/w:smallCaps]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="font-variant: small-caps;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::span[@class = 'allcaps']]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="text-transform: uppercase;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::span[@class = 'allcaps']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::s |  ancestor::s] | descendant-or-self::Content[parent::span[@class = 'strike']]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="text-decoration: line-through;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::s |  ancestor::s] | descendant-or-self::Content[parent::span[@class = 'strike']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::sc |  ancestor::sc] | descendant-or-self::Content[parent::small | ancestor::small] | descendant-or-self::Content[parent::span[@class = 'smallcaps']]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="font-variant: small-caps;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::sc |  ancestor::sc] | descendant-or-self::Content[parent::small  | ancestor::small] | descendant-or-self::Content[parent::span[@class = 'smallcaps']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::sub | ancestor::sub] | descendant-or-self::Content[parent::span[@class = 'sub']]">
                                    <xsl:text disable-output-escaping="yes">&lt;sub&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::sub | ancestor::sub] | descendant-or-self::Content[parent::span[@class = 'sub']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/sub&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::sup | ancestor::sup] | descendant-or-self::Content[parent::span[@class = 'sup']]">
                                    <xsl:text disable-output-escaping="yes">&lt;sup&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::sup | ancestor::sup] | descendant-or-self::Content[parent::span[@class = 'sup']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/sup&gt;</xsl:text>
                                </xsl:when>                   
                                <xsl:otherwise>                                
                                    <xsl:value-of select="."/>   
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                        <!-\-<xsl:variable name="chapterHeads">
                            <xsl:call-template name="span"/>
                        </xsl:variable>
                        <xsl:if test="string-length($chapterHeads) &gt; 0">
                            <xsl:value-of select="normalize-space($chapterHeads)"/>
                        </xsl:if>-\->
                    </xsl:variable>
                    
                  <!-\-  <xsl:variable name="UUID">
                        <!-\\-<xsl:value-of select="@ParaInfo/substring-before(substring-after(.,'_p_'),'_txtid')"/>-\\->
                        
                        <!-\\-   <xsl:choose>
                            <xsl:when test="matches(@ParaInfo/.,'UUID_para')">
                                <xsl:value-of select="@ParaInfo/substring-after(.,'UUID_para')"/>
                            </xsl:when>
                            <xsl:when test="matches(@ParaInfo/.,'_UUID_')">
                                <xsl:value-of select="@ParaInfo/substring-after(.,'_UUID_')"/>
                            </xsl:when>
                        </xsl:choose>-\\->
                        <xsl:choose>
                            <xsl:when test="matches(@w:rsidR/.,'UUID_para')">
                                <xsl:value-of select="@w:rsidR/substring-after(.,'UUID_para')"/>
                            </xsl:when>
                            <xsl:when test="matches(@w:rsidR/.,'_UUID_')">
                                <xsl:value-of select="@w:rsidR/substring-after(.,'_UUID_')"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:variable>
                    -\->
                    <xsl:variable name="find-pNo">
                        <!-\-                        <xsl:value-of select="@ParaInfo/substring-before(substring-after(.,'_p_'),'_txtid')"/>                       -\->
                        <xsl:choose>
                            <xsl:when test="@w:rsidR">
                                <xsl:value-of select="@w:rsidR/substring-before(substring-after(.,'_p_'),'_txtid')"/>   
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="descendant::HyperlinkTextDestination/@BookMarkDestination/substring-before(substring-after(.,'_p_'),'_txtid')"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    
                    <xsl:variable name="forEachText">
                        <xsl:value-of select="normalize-space(translate($chapterTitle, '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"/>
                    </xsl:variable>
                    
                    <xsl:choose>
                        <xsl:when test="self::*[@toc = 'true']">                                                        
                            
                            <xsl:variable name="attName">
                                <!-\-<xsl:value-of select="concat(self::ParagraphStyleRange/@Appliedsubstring-after(.,''),'-')"/>-\->
                                <!-\-                                <xsl:value-of select="concat(self::ParagraphStyleRange/@Appliedsubstring-after(.,''),'-', position(),'_p',$find-pNo)"/>-\->
                                <!-\-<xsl:value-of select="concat(self::ParagraphStyleRange/@Appliedsubstring-after(.,''),'-', position())"/>-\->
                                <!-\-                                <xsl:value-of select="concat(descendant-or-self::*/@BookMarkDestination/substring-after(.,''),'-',$UUID)"/>-\->
                                <!-\-02-11-2023 commented for unable to match heading level for TOC process   -\->
                                <!-\-<xsl:value-of select="concat(descendant-or-self::h9/@class,'-',$UUID)"/>-\->
                                <xsl:value-of select="descendant-or-self::h9/@class"/>
                            </xsl:variable>
                            
                            <xsl:attribute name="{$attName}">
                                <xsl:value-of select="$forEachText"/>
                                <xsl:text disable-output-escaping="yes">&lt;span&gt;</xsl:text>
                                <xsl:value-of select="concat('position-',position(),'_pageNo-',$find-pNo)"/>
                                <!-\-                                <xsl:value-of select="concat('pageNo-',$find-pNo)"/>-\->
                                <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                            </xsl:attribute>
                        </xsl:when>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="self::h10[@toc = 'true']">
                    <xsl:variable name="chapterTitle">  
                        <xsl:for-each select="descendant-or-self::Content">
                            <xsl:choose>                               
                                <xsl:when test="self::Content[parent::i |  ancestor::i]">
                                    <xsl:text disable-output-escaping="yes">&lt;i&gt;</xsl:text>
                                    <xsl:value-of select="self::Content[parent::i |  ancestor::i][1]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/i&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::b |  ancestor::b]">
                                    <xsl:text disable-output-escaping="yes">&lt;b&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::b |  ancestor::b]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/b&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::u |  ancestor::u]">
                                    <xsl:text disable-output-escaping="yes">&lt;u&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::u |  ancestor::u]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/u&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="parent::span/preceding-sibling::*[1][self::w:rPr/w:caps]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="text-transform: uppercase;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="parent::span/preceding-sibling::*[1][self::w:rPr/w:smallCaps]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="font-variant: small-caps;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::span[@class = 'allcaps']]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="text-transform: uppercase;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::span[@class = 'allcaps']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::s |  ancestor::s] | descendant-or-self::Content[parent::span[@class = 'strike']]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="text-decoration: line-through;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::s |  ancestor::s] | descendant-or-self::Content[parent::span[@class = 'strike']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::sc |  ancestor::sc] | descendant-or-self::Content[parent::small | ancestor::small] | descendant-or-self::Content[parent::span[@class = 'smallcaps']]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="font-variant: small-caps;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::sc |  ancestor::sc] | descendant-or-self::Content[parent::small  | ancestor::small] | descendant-or-self::Content[parent::span[@class = 'smallcaps']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::sub | ancestor::sub] | descendant-or-self::Content[parent::span[@class = 'sub']]">
                                    <xsl:text disable-output-escaping="yes">&lt;sub&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::sub | ancestor::sub] | descendant-or-self::Content[parent::span[@class = 'sub']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/sub&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::sup | ancestor::sup] | descendant-or-self::Content[parent::span[@class = 'sup']]">
                                    <xsl:text disable-output-escaping="yes">&lt;sup&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::sup | ancestor::sup] | descendant-or-self::Content[parent::span[@class = 'sup']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/sup&gt;</xsl:text>
                                </xsl:when>                   
                                <xsl:otherwise>                                
                                    <xsl:value-of select="."/>   
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                        <!-\-<xsl:variable name="chapterHeads">
                            <xsl:call-template name="span"/>
                        </xsl:variable>
                        <xsl:if test="string-length($chapterHeads) &gt; 0">
                            <xsl:value-of select="normalize-space($chapterHeads)"/>
                        </xsl:if>-\->
                    </xsl:variable>
                    
                    <!-\-<xsl:variable name="UUID">
                        <!-\\-<xsl:value-of select="@ParaInfo/substring-before(substring-after(.,'_p_'),'_txtid')"/>-\\->
                        
                        <!-\\-   <xsl:choose>
                            <xsl:when test="matches(@ParaInfo/.,'UUID_para')">
                                <xsl:value-of select="@ParaInfo/substring-after(.,'UUID_para')"/>
                            </xsl:when>
                            <xsl:when test="matches(@ParaInfo/.,'_UUID_')">
                                <xsl:value-of select="@ParaInfo/substring-after(.,'_UUID_')"/>
                            </xsl:when>
                        </xsl:choose>-\\->
                        <xsl:choose>
                            <xsl:when test="matches(@w:rsidR/.,'UUID_para')">
                                <xsl:value-of select="@w:rsidR/substring-after(.,'UUID_para')"/>
                            </xsl:when>
                            <xsl:when test="matches(@w:rsidR/.,'_UUID_')">
                                <xsl:value-of select="@w:rsidR/substring-after(.,'_UUID_')"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:variable>-\->
                    
                    <xsl:variable name="find-pNo">
                        <!-\-                        <xsl:value-of select="@ParaInfo/substring-before(substring-after(.,'_p_'),'_txtid')"/>                       -\->
                        <xsl:choose>
                            <xsl:when test="@w:rsidR">
                                <xsl:value-of select="@w:rsidR/substring-before(substring-after(.,'_p_'),'_txtid')"/>   
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="descendant::HyperlinkTextDestination/@BookMarkDestination/substring-before(substring-after(.,'_p_'),'_txtid')"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    
                    <xsl:variable name="forEachText">
                        <xsl:value-of select="normalize-space(translate($chapterTitle, '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"/>
                    </xsl:variable>
                    
                    <xsl:choose>
                        <xsl:when test="self::*[@toc = 'true']">                                                        
                            
                            <xsl:variable name="attName">
                                <!-\-<xsl:value-of select="concat(self::ParagraphStyleRange/@Appliedsubstring-after(.,''),'-')"/>-\->
                                <!-\-                                <xsl:value-of select="concat(self::ParagraphStyleRange/@Appliedsubstring-after(.,''),'-', position(),'_p',$find-pNo)"/>-\->
                                <!-\-<xsl:value-of select="concat(self::ParagraphStyleRange/@Appliedsubstring-after(.,''),'-', position())"/>-\->
                                <!-\-                                <xsl:value-of select="concat(descendant-or-self::*/@BookMarkDestination/substring-after(.,''),'-',$UUID)"/>-\->
                                <!-\-02-11-2023 commented for unable to match heading level for TOC process   -\->
                                <!-\-                                <xsl:value-of select="concat(descendant-or-self::h10/@class,'-',$UUID)"/>-\->
                                <xsl:value-of select="descendant-or-self::h10/@class"/>
                            </xsl:variable>
                            
                            <xsl:attribute name="{$attName}">
                                <xsl:value-of select="$forEachText"/>
                                <xsl:text disable-output-escaping="yes">&lt;span&gt;</xsl:text>
                                <xsl:value-of select="concat('position-',position(),'_pageNo-',$find-pNo)"/>
                                <!-\-                                <xsl:value-of select="concat('pageNo-',$find-pNo)"/>-\->
                                <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                            </xsl:attribute>
                        </xsl:when>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="self::figcaption[@toc = 'true']">
                    <xsl:variable name="chapterTitle">  
                        <xsl:for-each select="descendant-or-self::Content">
                            <xsl:choose>                               
                                <xsl:when test="self::Content[parent::i |  ancestor::i]">
                                    <xsl:text disable-output-escaping="yes">&lt;i&gt;</xsl:text>
                                    <xsl:value-of select="self::Content[parent::i |  ancestor::i][1]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/i&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::b |  ancestor::b]">
                                    <xsl:text disable-output-escaping="yes">&lt;b&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::b |  ancestor::b]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/b&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::u |  ancestor::u]">
                                    <xsl:text disable-output-escaping="yes">&lt;u&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::u |  ancestor::u]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/u&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="parent::span/preceding-sibling::*[1][self::w:rPr/w:caps]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="text-transform: uppercase;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="parent::span/preceding-sibling::*[1][self::w:rPr/w:smallCaps]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="font-variant: small-caps;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::span[@class = 'allcaps']]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="text-transform: uppercase;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::span[@class = 'allcaps']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::s |  ancestor::s] | descendant-or-self::Content[parent::span[@class = 'strike']]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="text-decoration: line-through;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::s |  ancestor::s] | descendant-or-self::Content[parent::span[@class = 'strike']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::sc |  ancestor::sc] | descendant-or-self::Content[parent::small | ancestor::small] | descendant-or-self::Content[parent::span[@class = 'smallcaps']]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="font-variant: small-caps;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::sc |  ancestor::sc] | descendant-or-self::Content[parent::small  | ancestor::small] | descendant-or-self::Content[parent::span[@class = 'smallcaps']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::sub | ancestor::sub] | descendant-or-self::Content[parent::span[@class = 'sub']]">
                                    <xsl:text disable-output-escaping="yes">&lt;sub&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::sub | ancestor::sub] | descendant-or-self::Content[parent::span[@class = 'sub']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/sub&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::sup | ancestor::sup] | descendant-or-self::Content[parent::span[@class = 'sup']]">
                                    <xsl:text disable-output-escaping="yes">&lt;sup&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::sup | ancestor::sup] | descendant-or-self::Content[parent::span[@class = 'sup']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/sup&gt;</xsl:text>
                                </xsl:when>                   
                                <xsl:otherwise>                                
                                    <xsl:value-of select="."/>   
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                        <!-\-<xsl:variable name="chapterHeads">
                            <xsl:call-template name="span"/>
                        </xsl:variable>
                        <xsl:if test="string-length($chapterHeads) &gt; 0">
                            <xsl:value-of select="normalize-space($chapterHeads)"/>
                        </xsl:if>-\->
                    </xsl:variable>
                    
                   <!-\- <xsl:variable name="UUID">
                        <!-\\-<xsl:value-of select="@ParaInfo/substring-before(substring-after(.,'_p_'),'_txtid')"/>-\\->
                        
                        <!-\\-   <xsl:choose>
                            <xsl:when test="matches(@ParaInfo/.,'UUID_para')">
                                <xsl:value-of select="@ParaInfo/substring-after(.,'UUID_para')"/>
                            </xsl:when>
                            <xsl:when test="matches(@ParaInfo/.,'_UUID_')">
                                <xsl:value-of select="@ParaInfo/substring-after(.,'_UUID_')"/>
                            </xsl:when>
                        </xsl:choose>-\\->
                        <xsl:choose>
                            <xsl:when test="matches(@w:rsidR/.,'UUID_para')">
                                <xsl:value-of select="@w:rsidR/substring-after(.,'UUID_para')"/>
                            </xsl:when>
                            <xsl:when test="matches(@w:rsidR/.,'_UUID_')">
                                <xsl:value-of select="@w:rsidR/substring-after(.,'_UUID_')"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:variable>
                    -\->
                    <xsl:variable name="find-pNo">
                        <!-\-                        <xsl:value-of select="@ParaInfo/substring-before(substring-after(.,'_p_'),'_txtid')"/>                       -\->
                        <xsl:choose>
                            <xsl:when test="@w:rsidR">
                                <xsl:value-of select="@w:rsidR/substring-before(substring-after(.,'_p_'),'_txtid')"/>   
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="descendant::HyperlinkTextDestination/@BookMarkDestination/substring-before(substring-after(.,'_p_'),'_txtid')"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    
                    <xsl:variable name="forEachText">
                        <xsl:value-of select="normalize-space(translate($chapterTitle, '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"/>
                    </xsl:variable>
                    
                    <xsl:choose>
                        <xsl:when test="self::*[@toc = 'true']">                                                        
                            
                            <xsl:variable name="attName">
                                <!-\-<xsl:value-of select="concat(self::ParagraphStyleRange/@Appliedsubstring-after(.,''),'-')"/>-\->
                                <!-\-                                <xsl:value-of select="concat(self::ParagraphStyleRange/@Appliedsubstring-after(.,''),'-', position(),'_p',$find-pNo)"/>-\->
                                <!-\-<xsl:value-of select="concat(self::ParagraphStyleRange/@Appliedsubstring-after(.,''),'-', position())"/>-\->
                                <!-\-                                <xsl:value-of select="concat(descendant-or-self::*/@BookMarkDestination/substring-after(.,''),'-',$UUID)"/>-\->
                                <!-\-02-11-2023 commented for unable to match heading level for TOC process   -\->
                                <!-\-<xsl:value-of select="concat(descendant-or-self::figcaption/@class,'-',$UUID)"/>-\->
                                <xsl:value-of select="descendant-or-self::figcaption/@class"/>
                            </xsl:variable>
                            
                            <xsl:attribute name="{$attName}">
                                <xsl:value-of select="$forEachText"/>
                                <xsl:text disable-output-escaping="yes">&lt;span&gt;</xsl:text>
                                <xsl:value-of select="concat('position-',position(),'_pageNo-',$find-pNo)"/>
                                <!-\-                                <xsl:value-of select="concat('pageNo-',$find-pNo)"/>-\->
                                <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                            </xsl:attribute>
                        </xsl:when>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="self::figure[@toc = 'true']">
                    <xsl:variable name="chapterTitle">  
                        <xsl:for-each select="descendant-or-self::Content">
                            <xsl:choose>                               
                                <xsl:when test="self::Content[parent::i |  ancestor::i]">
                                    <xsl:text disable-output-escaping="yes">&lt;i&gt;</xsl:text>
                                    <xsl:value-of select="self::Content[parent::i |  ancestor::i][1]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/i&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::b |  ancestor::b]">
                                    <xsl:text disable-output-escaping="yes">&lt;b&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::b |  ancestor::b]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/b&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::u |  ancestor::u]">
                                    <xsl:text disable-output-escaping="yes">&lt;u&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::u |  ancestor::u]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/u&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="parent::span/preceding-sibling::*[1][self::w:rPr/w:caps]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="text-transform: uppercase;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="parent::span/preceding-sibling::*[1][self::w:rPr/w:smallCaps]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="font-variant: small-caps;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::span[@class = 'allcaps']]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="text-transform: uppercase;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::span[@class = 'allcaps']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::s |  ancestor::s] | descendant-or-self::Content[parent::span[@class = 'strike']]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="text-decoration: line-through;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::s |  ancestor::s] | descendant-or-self::Content[parent::span[@class = 'strike']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::sc |  ancestor::sc] | descendant-or-self::Content[parent::small | ancestor::small] | descendant-or-self::Content[parent::span[@class = 'smallcaps']]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="font-variant: small-caps;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::sc |  ancestor::sc] | descendant-or-self::Content[parent::small  | ancestor::small] | descendant-or-self::Content[parent::span[@class = 'smallcaps']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::sub | ancestor::sub] | descendant-or-self::Content[parent::span[@class = 'sub']]">
                                    <xsl:text disable-output-escaping="yes">&lt;sub&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::sub | ancestor::sub] | descendant-or-self::Content[parent::span[@class = 'sub']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/sub&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::sup | ancestor::sup] | descendant-or-self::Content[parent::span[@class = 'sup']]">
                                    <xsl:text disable-output-escaping="yes">&lt;sup&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::sup | ancestor::sup] | descendant-or-self::Content[parent::span[@class = 'sup']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/sup&gt;</xsl:text>
                                </xsl:when>                   
                                <xsl:otherwise>                                
                                    <xsl:value-of select="."/>   
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                        <!-\-<xsl:variable name="chapterHeads">
                            <xsl:call-template name="span"/>
                        </xsl:variable>
                        <xsl:if test="string-length($chapterHeads) &gt; 0">
                            <xsl:value-of select="normalize-space($chapterHeads)"/>
                        </xsl:if>-\->
                    </xsl:variable>
                    
                    <!-\- <xsl:variable name="UUID">
                        <!-\\-<xsl:value-of select="@ParaInfo/substring-before(substring-after(.,'_p_'),'_txtid')"/>-\\->
                        
                        <!-\\-   <xsl:choose>
                            <xsl:when test="matches(@ParaInfo/.,'UUID_para')">
                                <xsl:value-of select="@ParaInfo/substring-after(.,'UUID_para')"/>
                            </xsl:when>
                            <xsl:when test="matches(@ParaInfo/.,'_UUID_')">
                                <xsl:value-of select="@ParaInfo/substring-after(.,'_UUID_')"/>
                            </xsl:when>
                        </xsl:choose>-\\->
                        <xsl:choose>
                            <xsl:when test="matches(@w:rsidR/.,'UUID_para')">
                                <xsl:value-of select="@w:rsidR/substring-after(.,'UUID_para')"/>
                            </xsl:when>
                            <xsl:when test="matches(@w:rsidR/.,'_UUID_')">
                                <xsl:value-of select="@w:rsidR/substring-after(.,'_UUID_')"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:variable>
                    -\->
                    <xsl:variable name="find-pNo">
                        <!-\-                        <xsl:value-of select="@ParaInfo/substring-before(substring-after(.,'_p_'),'_txtid')"/>                       -\->
                        <xsl:choose>
                            <xsl:when test="@w:rsidR">
                                <xsl:value-of select="@w:rsidR/substring-before(substring-after(.,'_p_'),'_txtid')"/>   
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="descendant::HyperlinkTextDestination/@BookMarkDestination/substring-before(substring-after(.,'_p_'),'_txtid')"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    
                    <xsl:variable name="forEachText">
                        <xsl:value-of select="normalize-space(translate($chapterTitle, '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"/>
                    </xsl:variable>
                    
                    <xsl:choose>
                        <xsl:when test="self::*[@toc = 'true']">                                                        
                            
                            <xsl:variable name="attName">
                                <!-\-<xsl:value-of select="concat(self::ParagraphStyleRange/@Appliedsubstring-after(.,''),'-')"/>-\->
                                <!-\-                                <xsl:value-of select="concat(self::ParagraphStyleRange/@Appliedsubstring-after(.,''),'-', position(),'_p',$find-pNo)"/>-\->
                                <!-\-<xsl:value-of select="concat(self::ParagraphStyleRange/@Appliedsubstring-after(.,''),'-', position())"/>-\->
                                <!-\-                                <xsl:value-of select="concat(descendant-or-self::*/@BookMarkDestination/substring-after(.,''),'-',$UUID)"/>-\->
                                <!-\-02-11-2023 commented for unable to match heading level for TOC process   -\->
                                <!-\-<xsl:value-of select="concat(descendant-or-self::figcaption/@class,'-',$UUID)"/>-\->
                                <xsl:value-of select="descendant-or-self::figure/@class"/>
                            </xsl:variable>
                            
                            <xsl:attribute name="{$attName}">
                                <xsl:value-of select="$forEachText"/>
                                <xsl:text disable-output-escaping="yes">&lt;span&gt;</xsl:text>
                                <xsl:value-of select="concat('position-',position(),'_pageNo-',$find-pNo)"/>
                                <!-\-                                <xsl:value-of select="concat('pageNo-',$find-pNo)"/>-\->
                                <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                            </xsl:attribute>
                        </xsl:when>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="self::table[@toc = 'true']">
                    <xsl:variable name="chapterTitle">  
                        <xsl:for-each select="descendant-or-self::Content">
                            <xsl:choose>                               
                                <xsl:when test="self::Content[parent::i |  ancestor::i]">
                                    <xsl:text disable-output-escaping="yes">&lt;i&gt;</xsl:text>
                                    <xsl:value-of select="self::Content[parent::i |  ancestor::i][1]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/i&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::b |  ancestor::b]">
                                    <xsl:text disable-output-escaping="yes">&lt;b&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::b |  ancestor::b]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/b&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::u |  ancestor::u]">
                                    <xsl:text disable-output-escaping="yes">&lt;u&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::u |  ancestor::u]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/u&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="parent::span/preceding-sibling::*[1][self::w:rPr/w:caps]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="text-transform: uppercase;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="parent::span/preceding-sibling::*[1][self::w:rPr/w:smallCaps]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="font-variant: small-caps;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::span[@class = 'allcaps']]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="text-transform: uppercase;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::span[@class = 'allcaps']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::s |  ancestor::s] | descendant-or-self::Content[parent::span[@class = 'strike']]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="text-decoration: line-through;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::s |  ancestor::s] | descendant-or-self::Content[parent::span[@class = 'strike']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::sc |  ancestor::sc] | descendant-or-self::Content[parent::small | ancestor::small] | descendant-or-self::Content[parent::span[@class = 'smallcaps']]">
                                    <xsl:text disable-output-escaping="yes">&lt;span style="font-variant: small-caps;"&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::sc |  ancestor::sc] | descendant-or-self::Content[parent::small  | ancestor::small] | descendant-or-self::Content[parent::span[@class = 'smallcaps']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::sub | ancestor::sub] | descendant-or-self::Content[parent::span[@class = 'sub']]">
                                    <xsl:text disable-output-escaping="yes">&lt;sub&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::sub | ancestor::sub] | descendant-or-self::Content[parent::span[@class = 'sub']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/sub&gt;</xsl:text>
                                </xsl:when>
                                <xsl:when test="descendant-or-self::Content[parent::sup | ancestor::sup] | descendant-or-self::Content[parent::span[@class = 'sup']]">
                                    <xsl:text disable-output-escaping="yes">&lt;sup&gt;</xsl:text>
                                    <xsl:value-of select="descendant-or-self::Content[parent::sup | ancestor::sup] | descendant-or-self::Content[parent::span[@class = 'sup']]"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/sup&gt;</xsl:text>
                                </xsl:when>                   
                                <xsl:otherwise>                                
                                    <xsl:value-of select="."/>   
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                        <!-\-<xsl:variable name="chapterHeads">
                            <xsl:call-template name="span"/>
                        </xsl:variable>
                        <xsl:if test="string-length($chapterHeads) &gt; 0">
                            <xsl:value-of select="normalize-space($chapterHeads)"/>
                        </xsl:if>-\->
                    </xsl:variable>
                    
                    <!-\- <xsl:variable name="UUID">
                        <!-\\-<xsl:value-of select="@ParaInfo/substring-before(substring-after(.,'_p_'),'_txtid')"/>-\\->
                        
                        <!-\\-   <xsl:choose>
                            <xsl:when test="matches(@ParaInfo/.,'UUID_para')">
                                <xsl:value-of select="@ParaInfo/substring-after(.,'UUID_para')"/>
                            </xsl:when>
                            <xsl:when test="matches(@ParaInfo/.,'_UUID_')">
                                <xsl:value-of select="@ParaInfo/substring-after(.,'_UUID_')"/>
                            </xsl:when>
                        </xsl:choose>-\\->
                        <xsl:choose>
                            <xsl:when test="matches(@w:rsidR/.,'UUID_para')">
                                <xsl:value-of select="@w:rsidR/substring-after(.,'UUID_para')"/>
                            </xsl:when>
                            <xsl:when test="matches(@w:rsidR/.,'_UUID_')">
                                <xsl:value-of select="@w:rsidR/substring-after(.,'_UUID_')"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:variable>
                    -\->
                    <xsl:variable name="find-pNo">
                        <!-\-                        <xsl:value-of select="@ParaInfo/substring-before(substring-after(.,'_p_'),'_txtid')"/>                       -\->
                        <xsl:choose>
                            <xsl:when test="@w:rsidR">
                                <xsl:value-of select="@w:rsidR/substring-before(substring-after(.,'_p_'),'_txtid')"/>   
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="descendant::HyperlinkTextDestination/@BookMarkDestination/substring-before(substring-after(.,'_p_'),'_txtid')"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    
                    <xsl:variable name="forEachText">
                        <xsl:value-of select="normalize-space(translate($chapterTitle, '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"/>
                    </xsl:variable>
                    
                    <xsl:choose>
                        <xsl:when test="self::*[@toc = 'true']">                                                        
                            
                            <xsl:variable name="attName">
                                <!-\-<xsl:value-of select="concat(self::ParagraphStyleRange/@Appliedsubstring-after(.,''),'-')"/>-\->
                                <!-\-                                <xsl:value-of select="concat(self::ParagraphStyleRange/@Appliedsubstring-after(.,''),'-', position(),'_p',$find-pNo)"/>-\->
                                <!-\-<xsl:value-of select="concat(self::ParagraphStyleRange/@Appliedsubstring-after(.,''),'-', position())"/>-\->
                                <!-\-                                <xsl:value-of select="concat(descendant-or-self::*/@BookMarkDestination/substring-after(.,''),'-',$UUID)"/>-\->
                                <!-\-02-11-2023 commented for unable to match heading level for TOC process   -\->
                                <!-\-<xsl:value-of select="concat(descendant-or-self::figcaption/@class,'-',$UUID)"/>-\->
                                <xsl:value-of select="descendant-or-self::table/@class"/>
                            </xsl:variable>
                            
                            <xsl:attribute name="{$attName}">
                                <xsl:value-of select="$forEachText"/>
                                <xsl:text disable-output-escaping="yes">&lt;span&gt;</xsl:text>
                                <xsl:value-of select="concat('position-',position(),'_pageNo-',$find-pNo)"/>
                                <!-\-                                <xsl:value-of select="concat('pageNo-',$find-pNo)"/>-\->
                                <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                            </xsl:attribute>
                        </xsl:when>
                    </xsl:choose>
                </xsl:when>-->
                   
                </xsl:for-each>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <!-- Added to merge subtitle on 22-12-2022-->
    <xsl:template name="PartTitle">
        <xsl:param name="pTVal"/>

        <xsl:variable name="chSubTitle1">
            <xsl:for-each select="descendant::h3[@class = 'SubTitle']">
                <xsl:call-template name="span"/>
            </xsl:for-each>
        </xsl:variable>
        <xsl:for-each select="descendant::h2[@class = 'PartTitle']">
            <xsl:choose>
                <xsl:when test="self::h2[@class = 'PartTitle']">
                    <xsl:attribute name="BbPartTitle_styleName">
                        <xsl:value-of select="normalize-space(substring-after(@class, ''))"/>
                    </xsl:attribute>
                    <xsl:attribute name="PartTitle">
                        <xsl:variable name="partTitle">
                            <xsl:for-each select="descendant-or-self::Content">
                                <xsl:value-of select="."/>
                            </xsl:for-each>
                        </xsl:variable>
                        <xsl:value-of
                            select="normalize-space(translate($partTitle, '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"
                        />
                    </xsl:attribute>
                    <xsl:attribute name="BbPartTitle">
                        <xsl:variable name="bp">
                            <xsl:call-template name="span"/>
                        </xsl:variable>
                        <xsl:if test="string-length($bp) &gt; 0">
                            <xsl:value-of select="normalize-space($bp)"/>
                        </xsl:if>

                        <xsl:if test="string-length($chSubTitle1) &gt; 0">
                            <xsl:value-of select="': '"/>
                            <xsl:value-of select="normalize-space($chSubTitle1)"/>
                        </xsl:if>
                    </xsl:attribute>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="PartNumber">
        <xsl:param name="pNVal"/>
        <xsl:for-each select="descendant::h2[@class = 'PartNumber']">
            <xsl:choose>
                <xsl:when test="self::h2[@class = 'PartNumber']">
                    <xsl:attribute name="BbPartNumber_styleName">
                        <xsl:value-of select="normalize-space(substring-after(@class, ''))"/>
                    </xsl:attribute>
                    <xsl:attribute name="PartNumber">
                        <xsl:variable name="partNumber">
                            <xsl:for-each select="descendant-or-self::Content">
                                <xsl:value-of select="."/>
                            </xsl:for-each>
                        </xsl:variable>
                        <xsl:value-of
                            select="normalize-space(translate($partNumber, '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"
                        />
                    </xsl:attribute>
                    <xsl:attribute name="BbPartNumber">
                        <xsl:variable name="BPn">
                            <xsl:call-template name="span"/>
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
        <xsl:variable name="chSubTitle1">
            <xsl:for-each select="descendant::h3[@class = 'SubTitle']">
                <xsl:call-template name="span"/>
            </xsl:for-each>
        </xsl:variable>
        <xsl:for-each select="descendant::h2[@class = 'UnitTitle']">
            <xsl:choose>
                <xsl:when test="self::h2[@class = 'UnitTitle']">
                    <xsl:attribute name="BbUnitTitle_styleName">
                        <xsl:value-of select="normalize-space(substring-after(@class, ''))"/>
                    </xsl:attribute>
                    <xsl:attribute name="UnitTitle">
                        <xsl:variable name="unitTitle">
                            <xsl:for-each select="descendant-or-self::Content">
                                <xsl:value-of select="."/>
                            </xsl:for-each>
                        </xsl:variable>
                        <xsl:value-of
                            select="normalize-space(translate($unitTitle, '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"
                        />
                    </xsl:attribute>
                    <xsl:attribute name="BbUnitTitle">
                        <xsl:variable name="BUT">
                            <xsl:call-template name="span"/>
                        </xsl:variable>
                        <xsl:if test="string-length($BUT) &gt; 0">
                            <xsl:value-of select="normalize-space($BUT)"/>
                        </xsl:if>
                        <xsl:if test="string-length($chSubTitle1) &gt; 0">
                            <xsl:value-of select="': '"/>
                            <xsl:value-of select="normalize-space($chSubTitle1)"/>
                        </xsl:if>
                    </xsl:attribute>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="UnitNumber">
        <xsl:param name="uNVal"/>
        <xsl:for-each select="descendant::h2[@class = 'UnitNumber']">
            <xsl:choose>
                <xsl:when test="self::h2[@class = 'UnitNumber']">
                    <xsl:attribute name="BbUnitNumber_styleName">
                        <xsl:value-of select="normalize-space(substring-after(@class, ''))"/>
                    </xsl:attribute>
                    <xsl:attribute name="UnitNumber">
                        <xsl:variable name="unitNumber">
                            <xsl:for-each select="descendant-or-self::Content">
                                <xsl:value-of select="."/>
                            </xsl:for-each>
                        </xsl:variable>
                        <xsl:value-of
                            select="normalize-space(translate($unitNumber, '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"
                        />
                    </xsl:attribute>
                    <xsl:attribute name="BbUnitNumber">
                        <xsl:variable name="bUn">
                            <xsl:call-template name="span"/>
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
        <xsl:variable name="chSubTitle1">
            <xsl:for-each select="descendant::h3[@class = 'SubTitle']">
                <xsl:call-template name="span"/>
            </xsl:for-each>
        </xsl:variable>
        <xsl:for-each select="descendant::h2[@class = 'SectionTitle']">
            <xsl:choose>
                <xsl:when test="self::h2[@class = 'SectionTitle']">
                    <xsl:attribute name="BbSectionTitle_styleName">
                        <xsl:value-of select="normalize-space(substring-after(@class, ''))"/>
                    </xsl:attribute>
                    <xsl:attribute name="SectionTitle">
                        <xsl:variable name="sectionTitle">
                            <xsl:for-each select="descendant-or-self::Content">
                                <xsl:value-of select="."/>
                            </xsl:for-each>
                        </xsl:variable>
                        <xsl:value-of
                            select="normalize-space(translate($sectionTitle, '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"
                        />
                    </xsl:attribute>
                    <xsl:attribute name="BbSectionTitle">
                        <xsl:variable name="BST">
                            <xsl:call-template name="span"/>
                        </xsl:variable>
                        <xsl:if test="string-length($BST) &gt; 0">
                            <xsl:value-of select="normalize-space($BST)"/>
                        </xsl:if>
                        <xsl:if test="string-length($chSubTitle1) &gt; 0">
                            <xsl:value-of select="': '"/>
                            <xsl:value-of select="normalize-space($chSubTitle1)"/>
                        </xsl:if>
                    </xsl:attribute>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="SectionNumber">
        <xsl:param name="sNVal"/>
        <xsl:for-each select="descendant::h2[@class = 'SectionNumber']">
            <xsl:choose>
                <xsl:when test="self::h2[@class = 'SectionNumber']">
                    <xsl:attribute name="BbSectionNumber_styleName">
                        <xsl:value-of select="normalize-space(substring-after(@class, ''))"/>
                    </xsl:attribute>
                    <xsl:attribute name="SectionNumber">
                        <xsl:variable name="sectionNumber">
                            <xsl:for-each select="descendant-or-self::Content">
                                <xsl:value-of select="."/>
                            </xsl:for-each>
                        </xsl:variable>
                        <xsl:value-of
                            select="normalize-space(translate($sectionNumber, '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"
                        />
                    </xsl:attribute>
                    <xsl:attribute name="BbSectionNumber">
                        <xsl:variable name="BSn">
                            <xsl:call-template name="span"/>
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
            <xsl:when test="descendant::p[@class = 'TableCaption']">
                <xsl:attribute name="tables">

                    <xsl:for-each select="descendant::p[@class = 'TableCaption']">
                        <xsl:analyze-string select="."
                            regex="([Tt][Aa][Bb][Ll][Ee])([ ])([0-9])([\.-&#x2013;&#x02014;])([0-9])">
                            <xsl:matching-substring>
                                <xsl:value-of select="regex-group(1)"/>
                                <xsl:value-of select="regex-group(2)"/>
                                <xsl:value-of select="regex-group(3)"/>
                                <xsl:value-of select="regex-group(4)"/>
                                <xsl:value-of select="regex-group(5)"/>
                            </xsl:matching-substring>
                        </xsl:analyze-string>
                        <xsl:analyze-string select="."
                            regex="([Tt][Bb][Ll])([ ])([0-9])([\.-&#x2013;&#x02014;])([0-9])">
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
            <xsl:when test="descendant::figcaption[@class = 'FigureLegend']">
                <xsl:attribute name="figures">

                    <xsl:for-each select="descendant::figcaption[@class = 'FigureLegend']">
                        <xsl:analyze-string select="."
                            regex="([Mm][Aa][Pp])([ ])([0-9]|[I])([\.-&#x2013;&#x02014;])([0-9])">
                            <xsl:matching-substring>
                                <xsl:value-of select="regex-group(1)"/>
                                <xsl:value-of select="regex-group(2)"/>
                                <xsl:value-of select="regex-group(3)"/>
                                <xsl:value-of select="regex-group(4)"/>
                                <xsl:value-of select="regex-group(5)"/>
                                <xsl:text> </xsl:text>
                            </xsl:matching-substring>
                        </xsl:analyze-string>
                        <xsl:analyze-string select="."
                            regex="([Ff][Ii][Gg][Uu][Rr][Ee])([ ])([0-9])([\.-&#x2013;&#x02014;])">
                            <xsl:matching-substring>
                                <xsl:value-of select="regex-group(1)"/>
                                <xsl:value-of select="regex-group(2)"/>
                                <xsl:value-of select="regex-group(3)"/>
                                <xsl:value-of select="regex-group(4)"/>
                            </xsl:matching-substring>
                        </xsl:analyze-string>
                        <xsl:analyze-string select="."
                            regex="([Ff][Ii][Gg][Uu][Rr][Ee])([ ])([0-9])([\.-&#x2013;&#x02014;])([0-9])">
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

        <xsl:variable name="authorcout" select="count(descendant::p[@class = 'DocumentAuthor'])"/>
        <!-- Added for multiple author on 27-5-2022 -->
        <xsl:choose>
            <xsl:when test="$authorcout &gt; 1 and not($authorcout = 2)">
                <xsl:if test="descendant::p[@class = 'DocumentAuthor']">
                    <xsl:for-each select="descendant::p[@class = 'DocumentAuthor']">
                        <xsl:attribute name="BbDocumentAuthor_styleName">
                            <xsl:value-of select="normalize-space(substring-after(@class, ''))"/>
                        </xsl:attribute>
                    </xsl:for-each>
                    <xsl:attribute name="BbDocumentAuthor">
                        <xsl:for-each select="descendant::p[@class = 'DocumentAuthor']">
                            <!--<xsl:value-of select="normalize-space(translate(., '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"/>-->
                            <xsl:variable name="DA">
                                <xsl:call-template name="span"/>
                            </xsl:variable>

                            <xsl:if test="position() = last()">
                                <xsl:value-of select="' and '"/>
                            </xsl:if>

                            <xsl:if test="string-length($DA) &gt; 0">
                                <xsl:value-of select="normalize-space($DA)"/>
                            </xsl:if>
                            <xsl:if test="position() != last() or not(position()[1])">
                                <xsl:value-of select="', '"/>
                            </xsl:if>

                        </xsl:for-each>
                    </xsl:attribute>
                </xsl:if>
            </xsl:when>
            <xsl:when test="$authorcout = 2">
                <xsl:if test="descendant::p[@class = 'DocumentAuthor']">
                    <xsl:for-each select="descendant::p[@class = 'DocumentAuthor']">
                        <xsl:attribute name="BbDocumentAuthor_styleName">
                            <xsl:value-of select="normalize-space(substring-after(@class, ''))"/>
                        </xsl:attribute>
                    </xsl:for-each>
                    <xsl:attribute name="BbDocumentAuthor">
                        <xsl:for-each select="descendant::p[@class = 'DocumentAuthor']">
                            <!--<xsl:value-of select="normalize-space(translate(., '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"/>-->
                            <xsl:variable name="DA">
                                <xsl:call-template name="span"/>
                            </xsl:variable>

                            <xsl:if test="position() = last()">
                                <xsl:value-of select="' and '"/>
                            </xsl:if>

                            <xsl:if test="string-length($DA) &gt; 0">
                                <xsl:value-of select="normalize-space($DA)"/>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:attribute>
                </xsl:if>
            </xsl:when>

            <xsl:otherwise>
                <xsl:for-each select="descendant::p[@class = 'DocumentAuthor']">
                    <xsl:attribute name="BbDocumentAuthor_styleName">
                        <xsl:value-of select="normalize-space(substring-after(@class, ''))"/>
                    </xsl:attribute>
                    <xsl:attribute name="BbDocumentAuthor">
                        <!--<xsl:value-of select="normalize-space(translate(., '&#x9;|&#xA;|&#8232;|&#x00AD;', ''))"/>-->
                        <xsl:variable name="DA">
                            <xsl:call-template name="span"/>
                        </xsl:variable>
                        <xsl:if test="string-length($DA) &gt; 0">
                            <xsl:value-of select="normalize-space($DA)"/>
                        </xsl:if>
                    </xsl:attribute>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="styleName">
        <xsl:param name="styleNameVal"/>
        <xsl:for-each select="descendant::h2[@class = 'FrontMatterHeading'] | descendant::h2[@class = 'FB_IndexHeading'] | descendant::p[@class = 'DocumentAuthor'] | descendant::h2[@class = 'BackMatterHeading'] | descendant::h2[@class = 'ChapterTitle'] | descendant::h2[@class = 'PartTitle'] | descendant::h2[@class = 'UnitTitle'] | descendant::h2[@class = 'SectionTitle']">
            <xsl:attribute name="styleName">
                <xsl:value-of select="normalize-space(@class)"/>
            </xsl:attribute>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="span">
        <xsl:param name="spanVlaues"/>
        <xsl:if test="descendant-or-self::span[not(contains(@class, 'endnotereference') or contains(@class, 'endnote reference') or contains(@class, 'footnoteReference') or contains(lower-case(@class), 'footnotereference') or contains(lower-case(@class), 'footnote reference'))]">
            <!--05-10-2023 below for-each commented for duplicate DocumentAuthor comes when like span had been i tag-->
            <!--        <xsl:for-each select="descendant-or-self::span[not(contains(@class,'endnotereference') or contains(@class,'endnote reference') or contains(@class,'footnoteReference') or contains(lower-case(@class),'footnotereference') or contains(lower-case(@class),'footnote reference'))] | descendant-or-self::i | descendant-or-self::b | descendant-or-self::u | descendant-or-self::s | descendant-or-self::sc | descendant-or-self::small | descendant-or-self::sup | descendant-or-self::sub">-->
            <!-- Added to include the manual charcterstyle formattings on 11-10-2022 -->

            <!-- <xsl:variable name="charstyle">
                <xsl:value-of select="descendant-or-self::span[not(contains(@class,'endnotereference') or contains(@class,'endnote reference') or contains(@class,'footnoteReference') or contains(lower-case(@class),'footnotereference') or contains(lower-case(@class),'footnote reference'))]/substring-after(@class,'CharacterStyle/')"/>
            </xsl:variable>
            <xsl:variable name="FST" select="@FontStyle"/>
            <xsl:variable name="PT" select="@Position"/>
            <xsl:variable name="Cap" select="@Capitalization"/>
            <xsl:variable name="UL" select="@Underline"/>
            <xsl:variable name="Charstyle2">
                <xsl:if test="$FST, '[\s]'">
                    <xsl:value-of select="replace($FST, ' ', '_')"/>
                </xsl:if>
                <xsl:if test="$PT, '[\s]'">
                    <xsl:value-of select="replace($PT, ' ', '_')"/>
                </xsl:if>
                <xsl:if test="$Cap, '[\s]'">
                    <xsl:value-of select="replace($Cap, ' ', '_')"/>
                </xsl:if>
                <xsl:if test="$UL, '[\s]'">
                    <xsl:value-of select="replace($UL, ' ', '_')"/>
                </xsl:if>
                <xsl:if test="$charstyle,'[\s]'">
                    <xsl:value-of select="replace($charstyle, ' ', '_')"/>
                </xsl:if>
            </xsl:variable>
            <xsl:variable name="Charstyle0" select="lower-case($Charstyle2)"/>
            <xsl:choose>
                <xsl:when test="contains($Charstyle0, 'smallcaps') or contains($Charstyle0, 'allcaps') or @Underline = 'true' or StrikeThru = 'true' or contains($Charstyle0, 'heavy') or contains($Charstyle0, 'bold') or contains($Charstyle0, 'italic') or contains($Charstyle0, 'oblique') or contains($Charstyle0, 'subscript') or contains($Charstyle0, 'superscript') or $Charstyle0='sup' or $Charstyle0='sub'">
                    <xsl:if test="contains($Charstyle0, 'smallcaps')">
                        <xsl:text disable-output-escaping="yes">&lt;</xsl:text>
                        <xsl:value-of select="'small'"/>
                        <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                    </xsl:if>
                    <xsl:if test="contains($Charstyle0, 'allcaps') and not(contains($Charstyle0, 'smallcaps'))">
                        <xsl:text disable-output-escaping="yes">&lt;</xsl:text>
                        <xsl:value-of select="'sc'"/>
                        <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                    </xsl:if>
                    <xsl:if test="@Underline = 'true'">
                        <xsl:text disable-output-escaping="yes">&lt;u&gt;</xsl:text>
                    </xsl:if>
                    <xsl:if test="@StrikeThru = 'true'">
                        <xsl:text disable-output-escaping="yes">&lt;</xsl:text>
                        <xsl:value-of select="'strike'"/>
                        <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                    </xsl:if>
                    <xsl:if test="contains($Charstyle0, 'bold') or contains($Charstyle0, 'medium') or contains($Charstyle0, 'heavy')">
                        <xsl:text disable-output-escaping="yes">&lt;</xsl:text>
                        <xsl:value-of select="'b'"/>
                        <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                    </xsl:if>
                    <xsl:if test="contains($Charstyle0, 'italic') or contains($Charstyle0, 'oblique')">
                        <xsl:text disable-output-escaping="yes">&lt;</xsl:text>
                        <xsl:value-of select="'i'"/>
                        <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                    </xsl:if>
                    <xsl:if test="contains($Charstyle0, 'superscript') or $Charstyle0 = 'sup'">
                        <xsl:text disable-output-escaping="yes">&lt;</xsl:text>
                        <xsl:value-of select="'sup'"/>
                        <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                    </xsl:if>
                    <xsl:if test="contains($Charstyle0, 'subscript') or $Charstyle0 = 'sub'">
                        <xsl:text disable-output-escaping="yes">&lt;</xsl:text>
                        <xsl:value-of select="'sub'"/>
                        <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                    </xsl:if>
                    <xsl:for-each select="descendant-or-self::Content">
                        <xsl:if test="string-length(descendant-or-self::Content) &gt; 0">
                            <xsl:value-of select="translate(descendant-or-self::Content/., '&#x9;|&#xA;|&#8232;|&#x00AD;', '')"/>
                        </xsl:if>
                    </xsl:for-each>
                    <!-\-<xsl:value-of select="translate(Content/., '&#x9;|&#xA;|&#8232;|&#x00AD;', '')"/>-\->

                    <xsl:if test="contains($Charstyle0, 'subscript') or $Charstyle0 = 'sub'">
                        <xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
                        <xsl:value-of select="'sub'"/>
                        <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                    </xsl:if>
                    <xsl:if test="contains($Charstyle0, 'superscript') or $Charstyle0 = 'sup'">
                        <xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
                        <xsl:value-of select="'sup'"/>
                        <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                    </xsl:if>
                    <xsl:if test="contains($Charstyle0, 'italic') or contains($Charstyle0, 'oblique')">
                        <xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
                        <xsl:value-of select="'i'"/>
                        <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                    </xsl:if>
                    <xsl:if test="contains($Charstyle0, 'bold') or contains($Charstyle0, 'medium') or contains($Charstyle0, 'heavy')">
                        <xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
                        <xsl:value-of select="'b'"/>
                        <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                    </xsl:if>
                    <xsl:if test="@StrikeThru = 'true'">
                        <xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
                        <xsl:value-of select="'strike'"/>
                        <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                    </xsl:if>
                    <xsl:if test="@Underline = 'true'">
                        <xsl:text disable-output-escaping="yes">&lt;/u&gt;</xsl:text>
                    </xsl:if>
                    <xsl:if test="contains($Charstyle0, 'allcaps') and not(contains($Charstyle0, 'smallcaps'))">
                        <xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
                        <xsl:value-of select="'sc'"/>
                        <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                    </xsl:if>
                    <xsl:if test="contains($Charstyle0, 'smallcaps')">
                        <xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
                        <xsl:value-of select="'small'"/>
                        <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                    </xsl:if>
                </xsl:when>              
                <xsl:otherwise>
                    <xsl:for-each select="descendant-or-self::Content">
                        <xsl:if test="string-length(descendant-or-self::Content) &gt; 0">
                            <xsl:variable name="val">
                                <xsl:value-of select="descendant-or-self::Content"/>    
                            </xsl:variable>
                            <xsl:value-of select="translate($val, '&#x9;|&#xA;|&#8232;|&#x00AD;', '')"/>
                        </xsl:if>
                    </xsl:for-each>
                    <!-\-<xsl:value-of select="translate(Content/., '&#x9;|&#xA;|&#8232;|&#x00AD;', '')"/>-\->
                </xsl:otherwise>
            </xsl:choose>
       -->

            <!-- 02-11-2023 commented <xsl:for-each select="descendant-or-self::Content"> duplicate content comes -->
            <xsl:for-each select="descendant-or-self::span">
                <xsl:choose>
                    <xsl:when test="descendant-or-self::Content[parent::i | ancestor::i]">
                        <xsl:text disable-output-escaping="yes">&lt;i&gt;</xsl:text>
                        <xsl:value-of select="self::Content[parent::i | ancestor::i][1]"/>
                        <xsl:text disable-output-escaping="yes">&lt;/i&gt;</xsl:text>
                    </xsl:when>
                    <xsl:when test="descendant-or-self::Content[parent::b | ancestor::b]">
                        <xsl:text disable-output-escaping="yes">&lt;b&gt;</xsl:text>
                        <xsl:value-of select="descendant-or-self::Content[parent::b | ancestor::b]"/>
                        <xsl:text disable-output-escaping="yes">&lt;/b&gt;</xsl:text>
                    </xsl:when>
                    <xsl:when test="descendant-or-self::Content[parent::u | ancestor::u]">
                        <xsl:text disable-output-escaping="yes">&lt;u&gt;</xsl:text>
                        <xsl:value-of select="descendant-or-self::Content[parent::u | ancestor::u]"/>
                        <xsl:text disable-output-escaping="yes">&lt;/u&gt;</xsl:text>
                    </xsl:when>
                    <xsl:when test="parent::span/preceding-sibling::*[1][self::w:rPr/w:caps]">
                        <xsl:text disable-output-escaping="yes">&lt;span style="text-transform: uppercase;"&gt;</xsl:text>
                        <xsl:value-of select="descendant-or-self::Content"/>
                        <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                    </xsl:when>
                    <xsl:when test="parent::span/preceding-sibling::*[1][self::w:rPr/w:smallCaps]">
                        <xsl:text disable-output-escaping="yes">&lt;span style="font-variant: small-caps;"&gt;</xsl:text>
                        <xsl:value-of select="descendant-or-self::Content"/>
                        <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                    </xsl:when>
                    <xsl:when test="descendant-or-self::Content[parent::span[@class = 'allcaps']]">
                        <xsl:text disable-output-escaping="yes">&lt;span style="text-transform: uppercase;"&gt;</xsl:text>
                        <xsl:value-of
                            select="descendant-or-self::Content[parent::span[@class = 'allcaps']]"/>
                        <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                    </xsl:when>
                    <xsl:when
                        test="descendant-or-self::Content[parent::s | ancestor::s] | descendant-or-self::Content[parent::span[@class = 'strike']]">
                        <xsl:text disable-output-escaping="yes">&lt;span style="text-decoration: line-through;"&gt;</xsl:text>
                        <xsl:value-of
                            select="descendant-or-self::Content[parent::s | ancestor::s] | descendant-or-self::Content[parent::span[@class = 'strike']]"/>
                        <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                    </xsl:when>
                    <xsl:when
                        test="descendant-or-self::Content[parent::sc | ancestor::sc] | descendant-or-self::Content[parent::small | ancestor::small] | descendant-or-self::Content[parent::span[@class = 'smallcaps']]">
                        <xsl:text disable-output-escaping="yes">&lt;span style="font-variant: small-caps;"&gt;</xsl:text>
                        <xsl:value-of
                            select="descendant-or-self::Content[parent::sc | ancestor::sc] | descendant-or-self::Content[parent::small | ancestor::small] | descendant-or-self::Content[parent::span[@class = 'smallcaps']]"/>
                        <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                    </xsl:when>
                    <xsl:when
                        test="descendant-or-self::Content[parent::sub | ancestor::sub] | descendant-or-self::Content[parent::span[@class = 'sub']]">
                        <xsl:text disable-output-escaping="yes">&lt;sub&gt;</xsl:text>
                        <xsl:value-of
                            select="descendant-or-self::Content[parent::sub | ancestor::sub] | descendant-or-self::Content[parent::span[@class = 'sub']]"/>
                        <xsl:text disable-output-escaping="yes">&lt;/sub&gt;</xsl:text>
                    </xsl:when>
                    <xsl:when
                        test="descendant-or-self::Content[parent::sup | ancestor::sup] | descendant-or-self::Content[parent::span[@class = 'sup']]">
                        <xsl:text disable-output-escaping="yes">&lt;sup&gt;</xsl:text>
                        <xsl:value-of
                            select="descendant-or-self::Content[parent::sup | ancestor::sup] | descendant-or-self::Content[parent::span[@class = 'sup']]"/>
                        <xsl:text disable-output-escaping="yes">&lt;/sup&gt;</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="."/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>

            <!--</xsl:for-each>-->
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
