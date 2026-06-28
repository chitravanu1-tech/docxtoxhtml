<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf" exclude-result-prefixes="xs mf">
    <!--Added Editor issue for marriapan 22-07-202 "span[@data-commentimg][not(ancestor-or-self::*[@data-change='commentdeleted'])]"-->
    <!--added on 10-3-2021-->
    <!-- Added to notes not carried out by the tab space between li and p on 28-1-2022 -->
    <!-- Added to avoid link issue if style missed in xhtml not linked word  on 13-10-2022-->
    <!-- Added to avoid the xhtml not opened issue by comment on 9-3-2023 -->
    <xsl:strip-space elements="*"/>
    <xsl:preserve-space elements="*"/>
    <xsl:output indent="no" method="xml"/>
    <xsl:variable name="styles" select="document('styles.xml')"/>
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="@data-name">
        <xsl:variable name="dataName" select="."/>
        
        <xsl:variable name="style" select="$styles//w:style[w:name/@w:val = $dataName]/@w:styleId"/>
        <xsl:variable name="pstyle">
            <xsl:choose>
                <xsl:when test="$dataName and (string-length($dataName) &gt; 0)">
                    
                    <xsl:variable name="stylesCount" select="count($styles//w:style[w:name/@w:val = $dataName]/@w:styleId)"/>
                    <xsl:choose>
                        <xsl:when test="$stylesCount = 1"/>
                        <xsl:when test="$stylesCount > 1"/>
                        <xsl:otherwise>
                          
                            <xsl:variable name="style" select="$styles//w:style[w:name/@w:val = $dataName]/@w:styleId"/>
                            <xsl:choose>
                                <xsl:when test="string-length($style) > 0"/>
                                <xsl:otherwise>
                                    <xsl:value-of select="'newSTyle'"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        <xsl:if test="string-length($pstyle) > 0">
            <xsl:if test="count(parent::*/preceding::*[@data-name = $dataName]) = 0">
                <xsl:if test="not(parent::ul|parent::ol)">
                    <xsl:choose>
                        <xsl:when test="parent::span">
                            <xsl:attribute name="newStyle" select="'Character'"/>                            
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:attribute name="newStyle" select="'Para'"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:if>
            </xsl:if>
        </xsl:if>
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <!-- removing this empty tgroup which is outside of the table(the output coming from the ckeditor)-->
    <xsl:template match="tgroup[not(parent::table)]"/>
    
    <!--    comment processing-->
    <xsl:template match="span[@data-comment]">
        <xsl:variable name="id" select="@data-comment"/>
        <xsl:variable name="id1" select="child::span[@data-commentimg]/@data-commentimg"/>
        <xsl:variable name="isCommentRangeStart" select="not(preceding::span[@data-comment  = $id])"/>
        <xsl:variable name="isCommentRangeEnd" select="not(following::span[@data-comment  = $id])"/>
        <!--<xsl:variable name="cmdId" select="following::*[@data-commentvalue = $id][1]/@cmtId"/>-->
        <xsl:variable name="cmdId">
            <xsl:choose>
                <xsl:when test="following::*[@data-commentvalue = $id][1]">
                    <xsl:value-of select="following::*[@data-commentvalue = $id][1]/@cmtId"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="following::*[@data-commentvalue = $id1][1]/@cmtId"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:if test="$isCommentRangeStart = true()">
                <xsl:attribute name="commentRangeStart" select="true()"/>
            </xsl:if>
            <xsl:if test="$isCommentRangeEnd = true()">
                <xsl:attribute name="commentRangeEnd" select="true()"/>
            </xsl:if>
            <xsl:if test="$isCommentRangeEnd = true() or $isCommentRangeStart = true()">
                <xsl:attribute name="cmdId" select="$cmdId"/>
            </xsl:if>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>
    <!--Added Editor issue for marriapan 22-07-202 "span[@data-commentimg][not(ancestor-or-self::*[@data-change='commentdeleted'])]"-->
    <xsl:template match="img[@data-commentimg][not(ancestor-or-self::*[@data-change='commentdeleted'])] | span[@data-commentimg][not(ancestor-or-self::*[@data-change='commentdeleted'])]">
        <xsl:variable name="id" select="@data-commentimg"/>
        <xsl:variable name="cmtId" select="boolean(following::*[@data-commentvalue = $id])"/>
        
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:attribute name="cmtId" select="$cmtId"/>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>
    <!--<xsl:template match="img[not(@data-commentimg)][preceding::span[@data-commentgroup]][not(ancestor-or-self::*[@data-change='commentdeleted'])]">
        <xsl:variable name="id" select="preceding::span[@data-commentgroup][1]/@data-commentgroup"/>
        <xsl:variable name="cmtId" select="boolean(following::*[@data-commentvalue = $id])"/>
        
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:attribute name="cmtId" select="$cmtId"/>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>-->
    
    <xsl:template match="html">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
        <xsl:result-document href="xhtmlNum1.xml">
            <xsl:apply-templates select="//html" mode="list"/>
        </xsl:result-document>
    </xsl:template>
    
   <!-- <xsl:template match="tr">
        <xsl:variable name="currentRow">
            <xsl:copy-of select="."/>
        </xsl:variable>
        <xsl:variable name="preRow">
            <xsl:copy-of select="preceding-sibling::tr[td/@rowspan &gt; 1]"/>
        </xsl:variable>
        <xsl:variable name="currentRowNumber" select="@rowNumber"/>
  
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
        
        
        <xsl:for-each select="child::*">
            <xsl:choose>
                <xsl:when test="name(.) ='td'">
                    <xsl:variable name="copyAttribs">
                        <xsl:variable name="curCellNumber" select="./@cellNumber"/>
                       
                        <xsl:for-each select="$preRow//child::td">
                            <xsl:variable name="preRowNumber" select="parent::tr/@rowNumber"/>
                            <xsl:variable name="diff" select="$currentRowNumber - $preRowNumber"/>
                            <xsl:variable name="rowSpanCalc">
                                <xsl:if test="number($diff) &lt;= number(@rowspan)">
                                    <xsl:value-of select="'true'"/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:if test="@cellNumber = $curCellNumber">
                                <xsl:if test="$rowSpanCalc = 'true'">
                                    <xsl:value-of select="'true'"/>
                                </xsl:if>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:variable>

                    <xsl:choose>
                        <xsl:when test="$copyAttribs = 'true'">
                                <xsl:copy>
                                <xsl:apply-templates select="@*"/>
                                <xsl:for-each select="$preRow//child::td[@cellNumber]/@*">
                                    <xsl:variable name="preRowNumber" select="ancestor::tr[1]/@rowNumber"/>
                                    <xsl:variable name="diff" select="$currentRowNumber - $preRowNumber"/>
                                    <xsl:choose>
                                        <xsl:when test="name(.) = 'rowspan'">
                                            <xsl:attribute name="{name(.)}">
                                                <xsl:value-of select="number(.) - number($diff)"/>
                                            </xsl:attribute>
                                        </xsl:when>
                                        <xsl:when test="name(.) = 'vMerge'">
                                            <xsl:attribute name="{name(.)}">
                                                <xsl:value-of select="'continue'"/>
                                            </xsl:attribute>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="."/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:for-each>
                                <xsl:apply-templates select="node()"/>
                            </xsl:copy>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:copy>
                                <xsl:apply-templates select="@*|node()"/>
                            </xsl:copy>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:copy>
                        <xsl:apply-templates select="@*|node()"/>
                    </xsl:copy>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
            <xsl:for-each select="preceding-sibling::tr/td[@rowspan &gt; 1]">
                
                <xsl:variable name="preCellNumber" select="@cellNumber"/>
                <xsl:variable name="preRowNumber" select="ancestor::tr[1]/@rowNumber"/>
                <xsl:variable name="diff" select="$currentRowNumber - $preRowNumber"/>
               
                <xsl:variable name="rowSpanCalc">
                    <xsl:if test="number($diff) &lt;= number(@rowspan)">
                        <xsl:value-of select="'true'"/>
                    </xsl:if>
                </xsl:variable>
                <xsl:message>
                    <xsl:value-of select="$rowSpanCalc"/>
                </xsl:message>
                <xsl:variable name="createNew">
                    <xsl:choose>
                        <xsl:when test="$currentRow//child::td[@cellNumber = $preCellNumber]">
                            <xsl:value-of select="'false'"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:if test="$rowSpanCalc = 'true'">
                                <xsl:value-of select="'true'"/>
                            </xsl:if>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:choose>
                    <xsl:when test="$createNew = 'false'"/>
                    <xsl:when test="$createNew = 'true'">
                        <xsl:element name="td">
                            <xsl:for-each select="@*">
                                <xsl:choose>
                                    <xsl:when test="name(.) = 'rowspan'">
                                        <xsl:attribute name="{name(.)}">
                                            <!-\-<xsl:value-of select="number(.) - 1"/>-\->
                                            <xsl:value-of select="number(.) - $diff"/>
                                        </xsl:attribute>
                                    </xsl:when>
                                    <xsl:when test="name(.) = 'colspan'">
                                        <xsl:attribute name="{name(.)}">
                                            <xsl:value-of select="."/>
                                        </xsl:attribute>
                                    </xsl:when>
                                   <!-\- <xsl:otherwise>
                                        <xsl:copy-of select="."/>
                                    </xsl:otherwise>-\->
                                </xsl:choose>
                            </xsl:for-each>
                            <xsl:attribute name="vMerge">
                                <xsl:value-of select="'continue'"/>
                            </xsl:attribute>
                            <xsl:element name="p"/>
                        </xsl:element>
                    </xsl:when>
                </xsl:choose>
                
            </xsl:for-each>
  
        </xsl:copy>
    </xsl:template>-->
    
    <!--<xsl:template match="@*|node()" mode="list">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" mode="list"/>
        </xsl:copy>
    </xsl:template>-->
    
    <xsl:template match="html" mode="list">
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates select="//ol|//ul" mode="list"/>
        </xsl:copy>
        
    </xsl:template>
    
    <xsl:template match="ol" mode="list">
        <xsl:variable name="type" select="@type" as="xs:string"/>
        <!--<xsl:variable name="start" select="@start" as="xs:string"/>-->
        <!--added on 20-04-2021 validation error-->
        <xsl:variable name="start" select="@start"/>
        <!--<xsl:variable name="class" select="@class" as="xs:string"/>-->
        <!--added on 28-09-2021 validation error-->
        <xsl:variable name="class" select="@class"/>
        <xsl:variable name="restart" select="count(preceding::ol[@type = $type and @start = $start and @class = $class][count(child::li) > 1])" as="xs:integer"/>
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates select="@*|@listUID"/>
            <xsl:if test="count(child::li) > 1">
                <xsl:attribute name="moreThanOneChild" select="$restart"/>    
            </xsl:if>
            <!--<xsl:apply-templates select="child::li[1]" mode="list"/>-->
            <xsl:apply-templates select="child::li" mode="list"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ul" mode="list">
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates select="@*|@listUID"/>
            <!--<xsl:apply-templates select="child::li[1]" mode="list"/>-->
            <xsl:apply-templates select="child::li" mode="list"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="li" mode="list">
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
<!--    <xsl:template match="text()">
        <xsl:analyze-string select="." regex="\n">
            <xsl:matching-substring>
                <xsl:value-of select="''"/>
            </xsl:matching-substring>
            <xsl:non-matching-substring>
                <xsl:value-of select="."/>
            </xsl:non-matching-substring>
        </xsl:analyze-string>
    </xsl:template>-->
    <xsl:template match="*[@data-id]/@data-id">
        <xsl:attribute name="data-id">
            <xsl:choose>
                <xsl:when test="*[contains(@data-id,'ran')]/@data-id">
                    <xsl:value-of select="substring-after(@data-id,'ran')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="@data-id"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:template>
    <!--added on 10-3-2021-->
    <xsl:template match="//figcaption">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:element name="p">
                <xsl:attribute name="class">
                    <xsl:value-of select="self::figcaption/@class"/>
                </xsl:attribute>
                <xsl:attribute name="data-name">
                    <xsl:value-of select="self::figcaption/@data-name"/>
                </xsl:attribute>
                <xsl:apply-templates select="node()"/>
            </xsl:element>
            <xsl:if test="self::figcaption/following-sibling::p[contains(lower-case(@class),'source')]">
                <xsl:apply-templates select="self::figcaption/following-sibling::p[contains(lower-case(@class),'source')]"/>
            </xsl:if>
        </xsl:copy>
    </xsl:template>
    <!-- Added to notes not carried out by the tab space between li and p on 28-1-2022 -->
    <xsl:template match="li[@class='endnotecaption' or contains(@class,'endnotecaption')][child::p]">
        <xsl:element name="li">
            <xsl:copy-of select="@*"/>
            <!-- Added to avoid link issue if style missed in xhtml not linked word  on 13-10-2022-->
            <xsl:if test="self::li[not(@style='mso-element:endnote')]">
                <xsl:attribute name="style" select="'mso-element:endnote'"/>
            </xsl:if>
            <xsl:apply-templates select="child::*"/>
        </xsl:element>
    </xsl:template>
    <!-- End -->
    <!-- Added to avoid the xhtml not opened issue by comment on 9-3-2023 -->
    <xsl:template match="commentreference">
        <xsl:element name="commentreference">
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="comment"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="comment">
        <xsl:element name="comment">
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="p"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="//math"><xsl:apply-templates/></xsl:template>
    <xsl:template match="*[@data-change='changestyle']/@data-change"/>
</xsl:stylesheet>