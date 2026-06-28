<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns:idPkg="http://ns.adobe.com/AdobeInDesign/idml/1.0/packaging" version="2.0">

    <xsl:output method="xml" name="xml" standalone="yes" indent="yes"/>
    <xsl:preserve-space elements="Content"/>


    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="idPkg:Story">
        <xsl:variable name="Self" select="child::Story/@Self"/>
        <xsl:variable name="M" select="concat('Story_', $Self, '.xml')"/>
        <xsl:variable name="filename" select="concat('output/', $M)"/>
        <xsl:result-document href="{$filename}" format="xml">
            <xsl:copy>
                <xsl:apply-templates select="@* | node()"/>
            </xsl:copy>
        </xsl:result-document>
    </xsl:template>

    <xsl:template match="ParagraphStyleRange[@Wchange = 'parainserted']">
        <xsl:variable name="parentStory" select="@ParentStory"/>
        <xsl:if
            test="preceding::ParagraphStyleRange[@ParentStory = $parentStory][1][not(ancestor::Note | ancestor::FootNote)][count(descendant::Br[not(ancestor::Note | ancestor::Footnote)]) = 0]">
            <xsl:element name="ParagraphStyleRange">
                <xsl:attribute name="AppliedParagraphStyle" select="@AppliedParagraphStyle"/>
                <xsl:element name="CharacterStyleRange">
                    <xsl:attribute name="AppliedCharacterStyle"
                        select="'CharacterStyle/$ID/[No character style]'"/>
                    <xsl:element name="Br"/>
                </xsl:element>
            </xsl:element>
        </xsl:if>

        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template
        match="Footnote | Note | Br | TextFrame | HyperlinkTextDestination | Group | GraphicLine | Oval | Polygon | Rectangle | Table">
        <xsl:choose>
            <xsl:when
                test="(ancestor::ParagraphStyleRange) and (not(ancestor::CharacterStyleRange) or not(ancestor::CharacterStyleRange[1] = ancestor::ParagraphStyleRange[1]/descendant::CharacterStyleRange))">
                <xsl:element name="CharacterStyleRange">
                    <xsl:attribute name="AppliedCharacterStyle"
                        select="'CharacterStyle/$ID/[No character style]'"/>
                    <xsl:copy>
                        <xsl:apply-templates select="@* | node()"/>
                    </xsl:copy>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="ancestorPara" select="ancestor::ParagraphStyleRange[1]"/>
                <xsl:variable name="precedingProp" select="(ancestor::CharacterStyleRange/preceding::CharacterStyleRange[1][ancestor::ParagraphStyleRange[1] = $ancestorPara]/child::Properties)"/>
                <xsl:if test="not(ancestor::CharacterStyleRange/child::Properties)">
                    <xsl:copy-of select="$precedingProp"/>
                </xsl:if>
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>


    <xsl:template match="Change[ancestor::Footnote]">
        <xsl:choose>
            <xsl:when test="@ChangeType = 'InsertedText'">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="Note[ancestor::Note]"/>

    <xsl:template match="body">
        <xsl:apply-templates/>
    </xsl:template>

    <!--<xsl:template match="//@WordNumber|//@Wchange|//FormattingChange|//Cell[@Wchange ='deleted_Cell']|HyperlinkTextDestination[@idmltoword = 'true']|XMLElement/@NoTextMarker|//@BookmarkCount|//@ParaNumber|//@ParaInfo|//ParagraphStyleRange/@ParentStory|//@paraLID|//@BookMarkDestination"/>-->
    <!--  added this new condition, if the footnote element doesn't have any child remove the footnote element  -->
    <xsl:template
        match="//@WordNumber | //@Wchange 
        | //FormattingChange | //Cell[@Wchange = 'deleted_Cell'] 
        | HyperlinkTextDestination[@idmltoword = 'true'] | XMLElement/@NoTextMarker 
        | //@BookmarkCount | //@ParaNumber | //@ParaInfo | //ParagraphStyleRange/@ParentStory 
        | //@paraLID | //@BookMarkDestination|Footnote[count(child::*) = 0]"/>



</xsl:stylesheet>