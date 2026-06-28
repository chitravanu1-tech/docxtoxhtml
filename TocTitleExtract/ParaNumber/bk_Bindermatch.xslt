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
    <!--<xsl:strip-space elements="*"/>-->
    <xsl:preserve-space elements="Content"/>
    <!--Added for Json to Toc on 06-6-2021-->
    <!-- empty for json on 31-5-2022 -->
    <!--<xsl:output method="xml" use-character-maps="Ascii2Unicode" xml:space="preserve" encoding="UTF-8" indent="yes" name="xml"/>-->
    <xsl:param name="allSpaceCharacterEntity"
        select="'&#8232;|&#x0020;|&#xa0;|&#x00A0;|&#xA;|&#x9;|&#x2028;|&#8194;|&#8195;|&#x00009;|&#x0000A;|&#x02002;|&#x02003;|&#x02004;|&#x02005;|&#x02007;|&#x02008;|&#x02009;|&#x0200A;|&#x0200B;|&#x0200C;|&#x0200D;|&#x0200E;|&#x0200F;|&#x0205F;|&#x02060;|&#x02061;|&#x02062;|&#x02063;|&#x000AD;|&#x000A0;'"/>
    <xsl:variable name="json" select="document('bookMapperXMLFile.xml')"/>
    <xsl:variable name="filename" select="substring-before(tokenize(base-uri(.), '/')[last()], '.')"/>
    <xsl:param name="PassFileName"
        select="substring-before(tokenize(base-uri(.), '/')[last()], '.')"/>
    <xsl:param name="PassArtPath"/>
    <!--Saravan pass file-->

    <xsl:variable name="FileCha_NameList" select="document('fileName_chTitle.xml')"/>
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="root">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="Title">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:variable name="fmh" select="@BbFrontMatterHeading"/>
            <xsl:variable name="ct" select="@BbChapterTitle"/>
            <xsl:variable name="csubt" select="@BbChapterSubTitle"/>
            <xsl:variable name="cn" select="@BbChapterNumber"/>
            <xsl:variable name="da" select="@BbDocumentAuthor"/>
            <xsl:variable name="pt" select="@BbPartTitle"/>
            <xsl:variable name="pn" select="@BbPartNumber"/>
            <xsl:variable name="ut" select="@BbUnitTitle"/>
            <xsl:variable name="un" select="@BbUnitNumber"/>
            <xsl:variable name="st" select="@BbSectionTitle"/>
            <xsl:variable name="sn" select="@BbSectionNumber"/>
            <xsl:variable name="bmh" select="@BbBackMatterHeading"/>
            <xsl:variable name="bind" select="@BbIndexHeading"/>
            <!-- empty for json on 31-5-2022 -->
            <xsl:if test="self::Title[not(@BbChapterTitle)]">
                <xsl:attribute name="BbChapterTitle">
                    <xsl:value-of select="''"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="self::Title[not(@BbChapterSubTitle)]">
                <xsl:attribute name="BbChapterSubTitle">
                    <xsl:value-of select="''"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="self::Title[not(@BbChapterNumber)]">
                <xsl:attribute name="BbChapterNumber">
                    <xsl:value-of select="''"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="self::Title[not(@BbDocumentAuthor)]">
                <xsl:attribute name="BbDocumentAuthor">
                    <xsl:value-of select="''"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="self::Title[not(@BbPartTitle)]">
                <xsl:attribute name="BbPartTitle">
                    <xsl:value-of select="''"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="self::Title[not(@BbPartNumber)]">
                <xsl:attribute name="BbPartNumber">
                    <xsl:value-of select="''"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="self::Title[not(@BbUnitTitle)]">
                <xsl:attribute name="BbUnitTitle">
                    <xsl:value-of select="''"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="self::Title[not(@BbUnitNumber)]">
                <xsl:attribute name="BbUnitNumber">
                    <xsl:value-of select="''"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="self::Title[not(@BbSectionTitle)]">
                <xsl:attribute name="BbSectionTitle">
                    <xsl:value-of select="''"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="self::Title[not(@BbSectionNumber)]">
                <xsl:attribute name="BbSectionNumber">
                    <xsl:value-of select="''"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="self::Title[not(@BbFrontMatterHeading)]">
                <xsl:attribute name="BbFrontMatterHeading">
                    <xsl:value-of select="''"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="self::Title[not(@BbBackMatterHeading)]">
                <xsl:attribute name="BbBackMatterHeading">
                    <xsl:value-of select="''"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="self::Title[not(@BbIndexHeading)]">
                <xsl:attribute name="BbIndexHeading">
                    <xsl:value-of select="''"/>
                </xsl:attribute>
            </xsl:if>

            <!-- End -->
            <!-- $json//root//Chapter[child::BbChapterTitle = $ct or child::BbChapterNumber = $cn or child::BbDocumentAuthor = $da or child::BbPartTitle = $pt or child::BbPartNumber = $pn or child::BbUnitTitle = $ut or child::BbUnitNumber = $un or child::BbSectionTitle =$st or child::BbSectionNumber = $sn] -->
            <xsl:choose>
                <xsl:when test="$json//root">
                    <xsl:for-each
                        select="$json//root//Chapter[child::ChapterName = $PassFileName and child::FolderId = $PassArtPath]">
                        <xsl:choose>
                            <xsl:when test="self::Chapter[child::BbChapterTitle and not($ct)]">
                                <xsl:attribute name="BbChapterTitle">
                                    <xsl:value-of select="''"/>
                                </xsl:attribute>
                            </xsl:when>
                            <xsl:when test="self::Chapter[child::BbChapterSubTitle and not($csubt)]">
                                <xsl:attribute name="BbChapterSubTitle">
                                    <xsl:value-of select="''"/>
                                </xsl:attribute>
                            </xsl:when>
                            <xsl:when test="self::Chapter[child::BbChapterNumber and not($cn)]">
                                <xsl:attribute name="BbChapterNumber">
                                    <xsl:value-of select="''"/>
                                </xsl:attribute>
                            </xsl:when>
                            <xsl:when test="self::Chapter[child::BbDocumentAuthor and not($da)]">
                                <xsl:attribute name="BbDocumentAuthor">
                                    <xsl:value-of select="''"/>
                                </xsl:attribute>
                            </xsl:when>
                            <xsl:when test="self::Chapter[child::BbPartTitle and not($pt)]">
                                <xsl:attribute name="BbPartTitle">
                                    <xsl:value-of select="''"/>
                                </xsl:attribute>
                            </xsl:when>
                            <xsl:when test="self::Chapter[child::BbPartNumber and not($pn)]">
                                <xsl:attribute name="BbPartNumber">
                                    <xsl:value-of select="''"/>
                                </xsl:attribute>
                            </xsl:when>
                            <xsl:when test="self::Chapter[child::BbUnitTitle and not($ut)]">
                                <xsl:attribute name="BbUnitTitle">
                                    <xsl:value-of select="''"/>
                                </xsl:attribute>
                            </xsl:when>
                            <xsl:when test="self::Chapter[child::BbUnitNumber and not($un)]">
                                <xsl:attribute name="BbUnitNumber">
                                    <xsl:value-of select="''"/>
                                </xsl:attribute>
                            </xsl:when>
                            <xsl:when test="self::Chapter[child::BbSectionTitle and not($st)]">
                                <xsl:attribute name="BbSectionTitle">
                                    <xsl:value-of select="''"/>
                                </xsl:attribute>
                            </xsl:when>

                            <xsl:when test="self::Chapter[child::BbSectionNumber and not($sn)]">
                                <xsl:attribute name="BbSectionNumber">
                                    <xsl:value-of select="''"/>
                                </xsl:attribute>
                            </xsl:when>
                            <xsl:when
                                test="self::Chapter[child::BbFrontMatterHeading and not($fmh)]">
                                <xsl:attribute name="BbFrontMatterHeading">
                                    <xsl:value-of select="''"/>
                                </xsl:attribute>
                            </xsl:when>
                            <xsl:when test="self::Chapter[child::BbBackMatterHeading and not($bmh)]">
                                <xsl:attribute name="BbBackMatterHeading">
                                    <xsl:value-of select="''"/>
                                </xsl:attribute>
                            </xsl:when>
                            <xsl:when test="self::Chapter[child::BbIndexHeading and not($bind)]">
                                <xsl:attribute name="BbIndexHeading">
                                    <xsl:value-of select="''"/>
                                </xsl:attribute>
                            </xsl:when>


                        </xsl:choose>
                    </xsl:for-each>
                    <!-- $json//root/Chapter[child::_children]//_children[child::BbChapterTitle = $ct or child::BbChapterNumber = $cn or child::BbDocumentAuthor = $da or child::BbPartTitle = $pt or child::BbPartNumber = $pn or child::BbUnitTitle = $ut or child::BbUnitNumber = $un or child::BbSectionTitle =$st or child::BbSectionNumber = $sn] -->
                    <xsl:for-each
                        select="$json//root/Chapter[child::_children]//_children[child::ChapterName = $PassFileName and child::FolderId = $PassArtPath]">
                        <xsl:choose>
                            <xsl:when test="self::_children[child::BbChapterTitle and not($ct)]">

                                <xsl:attribute name="BbChapterTitle">
                                    <xsl:value-of select="''"/>
                                </xsl:attribute>
                            </xsl:when>
                            <xsl:when
                                test="self::_children[child::BbChapterSubTitle and not($csubt)]">

                                <xsl:attribute name="BbChapterSubTitle">
                                    <xsl:value-of select="''"/>
                                </xsl:attribute>
                            </xsl:when>
                            <xsl:when test="self::_children[child::BbChapterNumber and not($cn)]">
                                <xsl:attribute name="BbChapterNumber">
                                    <xsl:value-of select="''"/>
                                </xsl:attribute>
                            </xsl:when>
                            <xsl:when test="self::_children[child::BbDocumentAuthor and not($da)]">
                                <xsl:attribute name="BbDocumentAuthor">
                                    <xsl:value-of select="''"/>
                                </xsl:attribute>
                            </xsl:when>
                            <xsl:when test="self::_children[child::BbPartTitle and not($pt)]">
                                <xsl:attribute name="BbPartTitle">
                                    <xsl:value-of select="''"/>
                                </xsl:attribute>
                            </xsl:when>
                            <xsl:when test="self::_children[child::BbPartNumber and not($pn)]">
                                <xsl:attribute name="BbPartNumber">
                                    <xsl:value-of select="''"/>
                                </xsl:attribute>
                            </xsl:when>
                            <xsl:when test="self::_children[child::BbUnitTitle and not($ut)]">
                                <xsl:attribute name="BbUnitTitle">
                                    <xsl:value-of select="''"/>
                                </xsl:attribute>
                            </xsl:when>
                            <xsl:when test="self::_children[child::BbUnitNumber and not($un)]">
                                <xsl:attribute name="BbUnitNumber">
                                    <xsl:value-of select="''"/>
                                </xsl:attribute>
                            </xsl:when>

                            <xsl:when test="self::_children[child::BbSectionTitle and not($st)]">
                                <xsl:attribute name="BbSectionTitle">
                                    <xsl:value-of select="''"/>
                                </xsl:attribute>
                            </xsl:when>

                            <xsl:when test="self::_children[child::BbSectionNumber and not($sn)]">
                                <xsl:attribute name="BbSectionNumber">
                                    <xsl:value-of select="''"/>
                                </xsl:attribute>
                            </xsl:when>
                            <xsl:when
                                test="self::_children[child::BbFrontMatterHeading and not($fmh)]">
                                <xsl:attribute name="BbFrontMatterHeading">
                                    <xsl:value-of select="''"/>
                                </xsl:attribute>
                            </xsl:when>
                            <xsl:when
                                test="self::_children[child::BbBackMatterHeading and not($bmh)]">
                                <xsl:attribute name="BbBackMatterHeading">
                                    <xsl:value-of select="''"/>
                                </xsl:attribute>
                            </xsl:when>
                            <xsl:when test="self::_children[child::BbIndexHeading and not($bind)]">
                                <xsl:attribute name="BbIndexHeading">
                                    <xsl:value-of select="''"/>
                                </xsl:attribute>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:when>
            </xsl:choose>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>
