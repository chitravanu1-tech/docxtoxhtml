<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="/">
        <xsl:if test="//document[//PageReference]">
         <xsl:element name="root">
             <xsl:apply-templates/>
         </xsl:element>
        </xsl:if>
    </xsl:template>
	
    <xsl:variable name="designmap" select="document('designmap.xml')//Document"/>
    <xsl:template match="PageReference">
<!--        <xsl:variable name="pageNo" select="ancestor::ParagraphStyleRange[1]/descendant::HyperlinkTextDestination/@Name"/>-->
        <xsl:variable name="pageNo">
            <xsl:choose>
                <xsl:when test="ancestor::ParagraphStyleRange[1]/descendant::HyperlinkTextDestination/@Name">
                    <xsl:value-of select="ancestor::ParagraphStyleRange[1]/descendant::HyperlinkTextDestination/@Name"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="following::ParagraphStyleRange[descendant::HyperlinkTextDestination][1]/descendant::HyperlinkTextDestination/@Name"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="pageNo1" select="substring-after($pageNo, 'p_')"/>
        <xsl:variable name="pageNo2" select="substring-before($pageNo1, '_')"/>
        <xsl:variable name="referencetopic" select="@ReferencedTopic"/>
        <xsl:variable name="referencetopic1" select="substring-after($referencetopic,'Topicn')"/>
        <!--<xsl:variable name="CrossReferenceType" select="self::PageReference[normalize-space(@CrossReferenceType) = 'SeeAlso']/normalize-space(@Name)"/>-->
        <!--<xsl:variable name="CrossReferenceType" select="self::PageReference[$designmap//Index[]//Topic[CrossReference]/normalize-space(@Name) = normalize-space(@Name)]/normalize-space(@Name)"/>-->
        <xsl:variable name="CrossReferenceType">
            <xsl:choose>
                <xsl:when test="self::PageReference[$designmap//Index[1]//Topic[CrossReference]/normalize-space(translate(@Name,':','-')) = normalize-space(@Name)]">
                    <xsl:value-of select="self::PageReference[$designmap//Index[1]//Topic[CrossReference]/normalize-space(translate(@Name,':','-')) = normalize-space(@Name)]/normalize-space(@Name)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="self::PageReference[$designmap//Index[1]//Topic[CrossReference]/normalize-space(translate(@Name,':','-')) = tokenize(@ReferencedTopic,'Topicn')[last()]]/normalize-space(tokenize(@ReferencedTopic,'Topicn')[last()])"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        
        <xsl:variable name="PageReferenceType">
            <xsl:if test="self::PageReference[@PageReferenceType = 'ForNextNParagraphs']">
                <xsl:value-of select="descendant::Properties/PageReferenceLimit"/>
            </xsl:if>
        </xsl:variable>
        <xsl:variable name="PageReferenceType1">
            <xsl:if test="self::PageReference[@PageReferenceType = 'ForNextNParagraphs'][descendant::Properties/PageReferenceLimit]/ancestor::ParagraphStyleRange[1]/following::ParagraphStyleRange[$PageReferenceType]">
                <xsl:value-of select="self::PageReference[@PageReferenceType = 'ForNextNParagraphs'][descendant::Properties/PageReferenceLimit]/ancestor::ParagraphStyleRange[1]/following::ParagraphStyleRange[$PageReferenceType - 1]//descendant::HyperlinkTextDestination[1]/substring-before(substring-after(@BookMarkDestination,'p_'),'_')"/>
            </xsl:if>
            
        </xsl:variable>
        <!--<div>-->
               
        <xsl:if test="string-length($referencetopic1)>0">
            <xsl:element name="p">
                <xsl:attribute name="class">
                    <xsl:value-of select="'index1'"/>
                </xsl:attribute>
                
            <xsl:for-each select="tokenize($referencetopic1,'Topicn')">
                <xsl:variable name="tokenizeval" select="."/>
                <xsl:if test="string-length($tokenizeval) > 1">
                    <xsl:variable name="indexpos" select="concat('index',position())"/>
                    
                    
                    <xsl:if test="position()=1">
                        <xsl:attribute name="data-name">
                            <xsl:value-of select="'index1'"/>
                        </xsl:attribute>
                        <xsl:value-of select="."/>
                        <xsl:text>, </xsl:text>
                        <xsl:element name="span">
                            <xsl:attribute name="class">
                                <xsl:value-of select="'pageno'"/>
                            </xsl:attribute>
                            <xsl:attribute name="data-pagefirst">
                             <xsl:value-of select="$pageNo2"/>
                            </xsl:attribute>
                            <xsl:value-of select="$pageNo2"/>
                            <xsl:if test="string-length($PageReferenceType) &gt; 0 and position() = last()">
                                <xsl:value-of select="'–'"/>
                                <xsl:value-of select="$PageReferenceType1"/>
                            </xsl:if>
                                                       
                        </xsl:element>
                        <xsl:if test="string-length($CrossReferenceType) &gt; 0">
                            
                            <xsl:if test="$designmap//Index[1]//Topic[CrossReference][normalize-space(translate(@Name,':','-')) = $CrossReferenceType]/CrossReference[@CrossReferenceType='SeeAlso'][not(@ReferencedTopic = following-sibling::CrossReference[@CrossReferenceType='SeeAlso']/@ReferencedTopic)]">
                                <xsl:variable name="ReferencedTopicval" select="$designmap//Index[1]//Topic[CrossReference][normalize-space(translate(@Name,':','-')) = $CrossReferenceType]/CrossReference[@CrossReferenceType='SeeAlso'][not(@ReferencedTopic = following-sibling::CrossReference[@CrossReferenceType='SeeAlso']/@ReferencedTopic)]/@ReferencedTopic"/>
                                
                                    
                                <xsl:for-each select="$designmap//Index[1]//Topic[CrossReference][normalize-space(translate(@Name,':','-')) = $CrossReferenceType]/CrossReference[@CrossReferenceType='SeeAlso'][not(@ReferencedTopic = following-sibling::CrossReference[@CrossReferenceType='SeeAlso']/@ReferencedTopic)]/@ReferencedTopic">
                                <xsl:element name="span">
                                    <xsl:attribute name="class" select="'seealso'"/>
                                    <xsl:choose>
                                        <xsl:when test="position() = 1">
                                            <xsl:value-of select="'. '"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="'; '"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    <xsl:if test="position() = 1">
                                    <xsl:text disable-output-escaping="yes">&lt;i&gt;</xsl:text>
                                    <xsl:value-of select="'See also'"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/i&gt;</xsl:text>
                                    </xsl:if>
                                    <xsl:value-of select="' '"/>
                                    <xsl:for-each select="tokenize(.,'Topicn')">
                                        <xsl:if test="not(position() = 1)">
                                            <xsl:value-of select="."/>
                                        </xsl:if>
                                        <xsl:if test="not(position() = last() or position() = 1)">
                                            <xsl:value-of select="':'"/>
                                        </xsl:if>
                                    </xsl:for-each>
                                </xsl:element>
                                </xsl:for-each>
                            </xsl:if>
                        </xsl:if>
                    </xsl:if>
                    
                    
                    <xsl:if test="position()>1">
                        <xsl:text>; </xsl:text>
                    <xsl:element name="span">
                        <xsl:attribute name="class">
                            <xsl:value-of select="$indexpos"/>
                        </xsl:attribute>
                        <xsl:attribute name="data-name">
                            <xsl:value-of select="'index'"/>
                            <xsl:value-of select="position()"/>
                        </xsl:attribute>
                        <xsl:if test="string-length($CrossReferenceType) &gt; 0">
                            
                            <xsl:text disable-output-escaping="yes">&lt;i&gt;</xsl:text>
                            <xsl:value-of select="'See also'"/>
                            <xsl:text disable-output-escaping="yes">&lt;/i&gt;</xsl:text>
                            
                            <xsl:value-of select="' '"/>
                        </xsl:if>
                        <xsl:value-of select="."/>
                        <xsl:text>, </xsl:text>
                        <xsl:element name="span">
                            <xsl:attribute name="class">
                                <xsl:value-of select="'pageno'"/>
                            </xsl:attribute>
                            <xsl:attribute name="data-pagefirst">
                                <xsl:value-of select="$pageNo2"/>
                            </xsl:attribute>
                            <xsl:value-of select="$pageNo2"/>
                            <xsl:if test="string-length($PageReferenceType) &gt; 0 and position() = last()">
                                <xsl:value-of select="'–'"/>
                                <xsl:value-of select="$PageReferenceType1"/>
                            </xsl:if>
                           
                        </xsl:element>
                        <xsl:if test="string-length($CrossReferenceType) &gt; 0">
                            
                            <xsl:if test="$designmap//Index[1]//Topic[CrossReference][normalize-space(translate(@Name,':','-')) = $CrossReferenceType]/CrossReference[@CrossReferenceType='SeeAlso']">
                                <xsl:variable name="ReferencedTopicval" select="$designmap//Index[1]//Topic[CrossReference][normalize-space(translate(@Name,':','-')) = $CrossReferenceType]/CrossReference[@CrossReferenceType='SeeAlso']/@ReferencedTopic"/>
                                <xsl:for-each select="$designmap//Index[1]//Topic[CrossReference][normalize-space(translate(@Name,':','-')) = $CrossReferenceType]/CrossReference[@CrossReferenceType='SeeAlso'][not(@ReferencedTopic = following-sibling::CrossReference[@CrossReferenceType='SeeAlso']/@ReferencedTopic)]/@ReferencedTopic">
                                <xsl:element name="span">
                                    <xsl:attribute name="class" select="'seealso'"/>
                                    <xsl:choose>
                                        <xsl:when test="position() = 1">
                                            <xsl:value-of select="'. '"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="'; '"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    <xsl:if test="position() = 1">
                                    <xsl:text disable-output-escaping="yes">&lt;i&gt;</xsl:text>
                                    <xsl:value-of select="'See also'"/>
                                    <xsl:text disable-output-escaping="yes">&lt;/i&gt;</xsl:text>
                                    </xsl:if>
                                    <xsl:value-of select="' '"/>
                                    <xsl:for-each select="tokenize(.,'Topicn')">
                                        <xsl:if test="not(position() = 1)">
                                            <xsl:value-of select="."/>
                                        </xsl:if>
                                        <xsl:if test="not(position() = last() or position() = 1)">
                                            <xsl:value-of select="':'"/>
                                        </xsl:if>
                                    </xsl:for-each>
                                </xsl:element>
                                </xsl:for-each>
                            </xsl:if>
                        </xsl:if>
                    </xsl:element>
                    </xsl:if>
                    <!--            <xsl:text>&#x000A;</xsl:text>-->
                </xsl:if> 
            </xsl:for-each>
            </xsl:element>
        </xsl:if>
        <!--</div>-->
    </xsl:template>
    
    <!--<xsl:template match="PageReference">
        <xsl:variable name="pageNo" select="ancestor::ParagraphStyleRange[1]/descendant::HyperlinkTextDestination/@Name"/>
        <xsl:variable name="pageNo1" select="substring-after($pageNo, 'p_')"/>
        <xsl:variable name="pageNo2" select="substring-before($pageNo1, '_')"/>
        <xsl:variable name="referencetopic" select="@ReferencedTopic"/>
        <xsl:variable name="referencetopic1" select="substring-after($referencetopic,'Topicn')"/>
        <div>
        <xsl:for-each select="tokenize($referencetopic1,'Topicn')">
            <xsl:variable name="tokenizeval" select="."/>
            <xsl:if test="string-length($tokenizeval) > 1">
            <xsl:variable name="indexpos" select="concat('index',position())"/>
            <xsl:element name="p">
                <xsl:attribute name="class">
                    <xsl:value-of select="$indexpos"/>
                </xsl:attribute>
                <xsl:attribute name="data-name">
                    <xsl:value-of select="'data-name'"/>
                </xsl:attribute>
                <xsl:value-of select="replace(.,'-',':')"/>
                <xsl:text>, </xsl:text>
                <xsl:element name="span">
                    <xsl:attribute name="class">
                        <xsl:value-of select="'pageno'"/>
                    </xsl:attribute>
                    
                    <xsl:value-of select="$pageNo2"/>
                </xsl:element>
            </xsl:element>
            <!-\-            <xsl:text>&#x000A;</xsl:text>-\->
            </xsl:if> 
        </xsl:for-each>
        </div>
    </xsl:template>
    -->
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
<!--    <xsl:template match="ParagraphStyleRange">
        <xsl:variable name="pageno" select="descendant::HyperlinkTextDestination/@Name"/>
        <xsl:variable name="referencetopic" select="descendant::PageReference[1]/@ReferencedTopic"/>
        <xsl:variable name="referencetopic1" select="substring-after($referencetopic,'Topicn')"/>
        <xsl:for-each select="tokenize($referencetopic1,'Topicn')">
            <xsl:variable name="indexpos" select="concat('index',position())"/>
            <xsl:element name="p">
                <xsl:attribute name="class">
                    <xsl:value-of select="$indexpos"/>
                </xsl:attribute>
                <xsl:attribute name="data-name">
                    <xsl:value-of select="'data-name'"/>
                </xsl:attribute>
                <xsl:value-of select="."/>
            </xsl:element>
<!-\-            <xsl:text>&#x000A;</xsl:text>-\->
        </xsl:for-each>
    </xsl:template>-->
    <xsl:template match="Content"/>
</xsl:stylesheet>