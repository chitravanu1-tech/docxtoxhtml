<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" xmlns:idPkg="http://ns.adobe.com/AdobeInDesign/idml/1.0/packaging"  xmlns:math="http://exslt.org/math"
    extension-element-prefixes="math"    version="2.0">
    
    <xsl:output method="xml" name="xml" indent="yes"/>
    <xsl:preserve-space elements="Content"/>
    
    <!-- Taking the mainstory by the first xmlelement's xmlcontent value, concept proved by panneer, done by hari date: 25.6.2018   -->
    <xsl:variable name="backingstory" select="document('BackingStory.xml')//XMLElement[@XMLContent][1]/@XMLContent"/>
    
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    
   <!-- <xsl:template match="XMLElement[not(descendant::ParagraphStyleRange|descendant::CharacterStyleRange|descendant::Rectangle|descendant::TextFrame|descendant::Content|descendant::Table|descendant::XMLElement|ancestor::XMLElement|descendant::XMLAttribute)]">
        <!-/-<xsl:copy>
            <xsl:apply-templates select="@* except @XMLContent|node()"/>
        </xsl:copy>-/->
    </xsl:template>-->
    
    <xsl:template match="idPkg:BackingStory">
        <xsl:copy-of select="."/>
        <xsl:for-each select="//idPkg:Story">
            <xsl:variable name="storyId" select="lower-case(@src)"/>
            <xsl:variable name="copy">
                <xsl:for-each select="$backingstory">
                    <xsl:if test="$storyId = concat('stories/story_',.,'.xml')">
                        <xsl:value-of select="true()"/>
                    </xsl:if>
                </xsl:for-each>
            </xsl:variable>
            <xsl:if test="$copy = 'true'">
                <xsl:copy-of select="."></xsl:copy-of>
            </xsl:if>
        </xsl:for-each>
        <!--<xsl:copy-of select="//idPkg:Story[lower-case(@src) = concat('stories/story_',$backingstory,'.xml')]"/>-->
    </xsl:template>
    
    <xsl:template match="idPkg:Story">
        <xsl:variable name="storyId" select="lower-case(@src)"/>
        <xsl:variable name="copy">
            <xsl:for-each select="$backingstory">
                <xsl:if test="$storyId = concat('stories/story_',.,'.xml')">
                    <xsl:value-of select="true()"/>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$copy = 'true'"></xsl:when>
            <xsl:otherwise>
                <xsl:copy-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!--<xsl:template match="idPkg:Story[lower-case(@src) = concat('stories/story_',$backingstory,'.xml')]"/>-->
<!--<xsl:template match="XMLElement[not(descendant::ParagraphStyleRange|descendant::CharacterStyleRange|descendant::Rectangle|descendant::TextFrame|descendant::Content|descendant::Table)]"/>-->
    
    
</xsl:stylesheet>