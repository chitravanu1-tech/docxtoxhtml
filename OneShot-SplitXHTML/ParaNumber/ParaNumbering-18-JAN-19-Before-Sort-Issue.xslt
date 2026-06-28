<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" xmlns:idPkg="http://ns.adobe.com/AdobeInDesign/idml/1.0/packaging"  xmlns:math="http://exslt.org/math"
    extension-element-prefixes="math"    version="2.0">

    <xsl:output method="xml" name="xml" indent="yes"/>
    <xsl:preserve-space elements="Content"/>

    <xsl:key name="XMLElementByContent" match="XMLElement" use="@XMLContent"/>
    
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    
   <xsl:template match="idPkg:Story">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/> 
        </xsl:copy>
    </xsl:template>
    

    <xsl:template match="ParagraphStyleRange" priority="1.5">
        <xsl:variable name="story" select="ancestor::Story[1]/@Self"/>
        <xsl:variable name="curPara" select="self::ParagraphStyleRange"/>
        <xsl:copy>
            <!--<xsl:attribute name="ParaNumber" select="descendant::HyperlinkTextSource/@HyperlinkUDestination"/>-->
            <xsl:variable name="bookmark">
                <xsl:value-of select="count(descendant::HyperlinkTextDestination[ancestor::ParagraphStyleRange[1] = $curPara][@BookMarkDestination] 
                    | descendant::HyperlinkTextSource[ancestor::ParagraphStyleRange[1] = $curPara][@HyperlinkUDestination])"/>
            </xsl:variable>
            
            <xsl:attribute name="BookmarkCount" select="$bookmark"/>
            <xsl:for-each select="descendant::HyperlinkTextDestination[ancestor::ParagraphStyleRange[1] = $curPara][@BookMarkDestination] | descendant::HyperlinkTextSource[ancestor::ParagraphStyleRange[1] = $curPara][@HyperlinkUDestination]">
                <xsl:variable name="curBookMarkVal">
                    <xsl:if test="(self::HyperlinkTextSource[ancestor::ParagraphStyleRange[1] = $curPara]/@HyperlinkUDestination | self::HyperlinkTextDestination[ancestor::ParagraphStyleRange[1] = $curPara]/@BookMarkDestination)">
                        <xsl:choose>
                            <xsl:when test="self::HyperlinkTextDestination[ancestor::ParagraphStyleRange[1] = $curPara]/@BookMarkDestination">
                                <xsl:value-of select="self::HyperlinkTextDestination[ancestor::ParagraphStyleRange[1] = $curPara]/@BookMarkDestination"/>
                            </xsl:when>
                            <xsl:when test="self::HyperlinkTextSource[ancestor::ParagraphStyleRange[1] = $curPara]/@HyperlinkUDestination">
                                <xsl:value-of select="self::HyperlinkTextSource[ancestor::ParagraphStyleRange[1] = $curPara]/@HyperlinkUDestination"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:if>
                </xsl:variable>
                <xsl:variable name="bookmark" select="@bkmark"/>
                <xsl:choose>
                    <xsl:when test="position()= 1">
                        <xsl:attribute name="ParaNumber" select="$curBookMarkVal"/>
                        <xsl:if test="string-length($bookmark) > 0">
                            <xsl:attribute name="ParaInfo" select="$bookmark"/>
                        </xsl:if>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:attribute name="{concat('ParaNumber',position())}" select="$curBookMarkVal"/>
                        <xsl:if test="string-length($bookmark) > 0">
                            <xsl:attribute name="{concat('ParaInfo',position())}" select="$bookmark"/>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="@*"/>
            <xsl:attribute name="ParentStory" select="$story"></xsl:attribute>
            <xsl:attribute name="paraLID">
                <xsl:number level="any"/>
            </xsl:attribute>
            <!--  this condition is added for the paragraphs which is not having the bookmarks -->
            <xsl:if test="$bookmark = 0">                
              <!--<xsl:variable name="preParaBookM" select="preceding::ParagraphStyleRange[ancestor::Story[1]/@Self = $story][descendant::HyperlinkTextDestination[ancestor::ParagraphStyleRange[1] = $curPara][contains(lower-case(@BookMarkDestination),'story')][1]][1]/descendant::HyperlinkTextDestination[ancestor::ParagraphStyleRange[1] = $curPara][contains(lower-case(@BookMarkDestination),'story')][1]/@BookMarkDestination | preceding::ParagraphStyleRange[ancestor::Story[1]/@Self = $story][descendant::HyperlinkTextSource[contains(lower-case(@HyperlinkUDestination),'story')][1]][1]/descendant::HyperlinkTextSource[contains(lower-case(@HyperlinkUDestination),'story')][1]/@HyperlinkUDestination"/>-->
                <xsl:variable name="preParaBookM" select="preceding::ParagraphStyleRange[ancestor::Story[1]/@Self = $story][descendant::HyperlinkTextDestination[ancestor::ParagraphStyleRange[1] = $curPara][1]][1]/descendant::HyperlinkTextDestination[1]/@BookMarkDestination 
                    | preceding::ParagraphStyleRange[ancestor::Story[1]/@Self = $story][descendant::HyperlinkTextSource[1]][1]/descendant::HyperlinkTextSource[1]/@HyperlinkUDestination
                    | preceding::ParagraphStyleRange[descendant::HyperlinkTextDestination[1]][1]/descendant::HyperlinkTextDestination[1]/@BookMarkDestination">                    
                </xsl:variable>
                
                <xsl:choose>
                    <xsl:when test="string-length($preParaBookM) > 0">
                        <xsl:variable name="curBookMsuffix">
                            <xsl:variable name="wPreParaCount" select="count(preceding::ParagraphStyleRange)"/>
                            <xsl:variable name="preParaParaLid" select="$wPreParaCount - count((preceding::ParagraphStyleRange[ancestor::Story[1]/@Self = $story][descendant::HyperlinkTextDestination[1]][1] | preceding::ParagraphStyleRange[ancestor::Story[1]/@Self = $story][descendant::HyperlinkTextSource[1]][1])/preceding::ParagraphStyleRange)"/>
                            <xsl:value-of select="concat($preParaBookM,'_unpA',$preParaParaLid)"/>
                        </xsl:variable>
                     <xsl:if test="not(ancestor::Note)">
                        <xsl:attribute name="ParaNumber" select="$curBookMsuffix"/>
                        <xsl:attribute name="ParaInfo"  select="$curBookMsuffix"/>
                        <xsl:element name="HyperlinkTextDestination">
                            <xsl:attribute name="BookMarkDestination" select="$curBookMsuffix"/>
                            <xsl:attribute name="idmltoword" select="'true'"/>
                        </xsl:element>
                     </xsl:if>
                    </xsl:when>
                    
                    <xsl:otherwise>
                        <xsl:variable name="followParaBookM" select="following::ParagraphStyleRange[ancestor::Story[1]/@Self = $story][descendant::HyperlinkTextDestination[1]][1]/descendant::HyperlinkTextDestination[1]/@BookMarkDestination | following::ParagraphStyleRange[ancestor::Story[1]/@Self = $story][descendant::HyperlinkTextSource[1]][1]/descendant::HyperlinkTextSource[1]/@HyperlinkUDestination"/>
                        <xsl:choose>
                            <xsl:when test="string-length($followParaBookM) > 0">
                                <xsl:variable name="curBookMsuffix">
                                    <xsl:variable name="wPreParaCount" select="count(following::ParagraphStyleRange)"/>
                                    <xsl:variable name="preParaParaLid" select="$wPreParaCount - count((following::ParagraphStyleRange[ancestor::Story[1]/@Self = $story][descendant::HyperlinkTextDestination[1]][1] | following::ParagraphStyleRange[ancestor::Story[1]/@Self = $story][descendant::HyperlinkTextSource[1]][1])/following::ParagraphStyleRange)"/>
                                    <xsl:value-of select="concat($followParaBookM,'_unpB',$preParaParaLid)"/>
                                </xsl:variable>
                             <xsl:if test="not(ancestor::Note)">
                                <xsl:attribute name="ParaNumber" select="$curBookMsuffix"/>
                                <xsl:attribute name="ParaInfo"  select="$curBookMsuffix"/>
                                <xsl:element name="HyperlinkTextDestination">
                                    <xsl:attribute name="BookMarkDestination" select="$curBookMsuffix"/>
                                    <xsl:attribute name="idmltoword" select="'true'"/>
                                </xsl:element>
                            </xsl:if>
                            </xsl:when>
                            <xsl:otherwise>
                            <!--      least type condition                          -->
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>
    

    <xsl:template match="@RuleAboveLineWeight">
        <xsl:variable name="fd" select="string(.) cast as xs:double"/>
        <xsl:if test="not($fd = 0.01)">
        <xsl:attribute name="RuleAboveLineWeight">
        <xsl:value-of select="."></xsl:value-of>
        </xsl:attribute>
        </xsl:if>
    </xsl:template>
  
  
    <xsl:template match="Row">
        <xsl:variable name="SelfName" select="./@Name"/>
        <xsl:variable name="RowCellCount" select="count(following-sibling::Cell[@RowName = $SelfName])"/>
        <xsl:copy>
            <xsl:attribute name="RowCellCount" select="$RowCellCount"/>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
        
    <xsl:template match="Column">
        <xsl:variable name="SelfName" select="./@Name"/>
        <xsl:variable name="ColumnCellCount" select="count(following-sibling::Cell[@ColumnName = $SelfName])"/>
        <xsl:copy>
            <xsl:attribute name="ColumnCellCount" select="$ColumnCellCount"/>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
        
     
    <!--Cleaning up the IDML file-->
    <!-- Commented on 22-Aug-17, to check with root xml element -->    
            <!--<xsl:template match="XMLElement[not(descendant::ParagraphStyleRange|descendant::CharacterStyleRange|descendant::Rectangle|descendant::TextFrame|descendant::Content|descendant::Table)][generate-id() != generate-id(key('XMLElementByContent',@XMLContent)[1])]">
                <xsl:copy>
                    <xsl:apply-templates select="@* except @XMLContent|node()"/>
                </xsl:copy>
            </xsl:template>-->
    <!-- Commented on 22-Aug-17, to check with root xml element ENDs here-->
    
    <!--<xsl:template match="XMLElement[descendant::ParagraphStyleRange|descendant::CharacterStyleRange|descendant::Rectangle|descendant::TextFrame|descendant::Content|descendant::Table][generate-id() != generate-id(key('XMLElementByContent',@XMLContent)[1])]">
        <xsl:copy>
            <xsl:apply-templates select="@* except @XMLContent|node()"/>
        </xsl:copy>
    </xsl:template>-->
    <!--Cleaning up the IDML file-->
     
        
</xsl:stylesheet>