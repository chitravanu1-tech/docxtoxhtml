<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:variable name="indformat" select="document('index1.xml')"/>
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="p[@class='index1']">
        <xsl:for-each select="self::p[@class='index1']">
            <div>
                <xsl:copy>
                    <xsl:apply-templates select="@*"/>
                    <xsl:apply-templates select="node()"/>
                </xsl:copy>
            </div>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="p[@class='index1']/span[contains(@class,'index')][string-length(.) &gt; 0][substring-before(.,',')[1] = following-sibling::span[contains(@class,'index')][string-length(.) &gt; 0]/substring-before(.,',')[1]]">
        <xsl:variable name="id" select="substring-before(.,',')[1]"/>
        <xsl:variable name="page">
            <xsl:choose>
                <xsl:when test="self::span/span[@class='pageno'][contains(.,'-')]">
                    <xsl:value-of select="self::span/span[@class='pageno']/substring-before(.,'-')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="self::span/span[@class='pageno']/."/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
            
            <xsl:if test="following-sibling::span[contains(@class,'index')][string-length(.) &gt; 0][substring-before(.,',')[1] = $id]">
                <xsl:variable name="txt">
                    <xsl:copy-of select="following-sibling::span[contains(@class,'index')][string-length(.) &gt; 0][substring-before(.,',')[1] = $id]/self::span[contains(@class,'index')]"></xsl:copy-of>
                </xsl:variable>
                <xsl:variable name="txt2">
                    <xsl:copy-of select="following-sibling::span[contains(@class,'index')][string-length(.) &gt; 0][substring-before(.,',')[1] = $id]/self::span[contains(@class,'index')]/span[@class='pageno'][not(. = $page or substring-before(.,'-') = $page)]"></xsl:copy-of>
                </xsl:variable>
                <xsl:if test="string-length($txt) and string-length($txt2)">
                    <xsl:value-of select="', '"/>
                </xsl:if>
                <xsl:copy-of select="following-sibling::span[contains(@class,'index')][string-length(.) &gt; 0][substring-before(.,',')[1] = $id]/self::span[contains(@class,'index')]/span[@class='pageno'][not(. = $page or substring-before(.,'-') = $page)]"></xsl:copy-of>
            </xsl:if>
            
        </xsl:copy>
    </xsl:template>
    <xsl:template match="//span[contains(@class,'index')][string-length(.) &gt; 0][substring-before(.,',')[1] = preceding-sibling::span[contains(@class,'index')][string-length(.) &gt; 0]/substring-before(.,',')[1]]"/>
    
    <!--<xsl:template match="span[contains(@class,'index')][not(following-sibling::text()[1][normalize-space(.) =';'])][following-sibling::*[1][self::span[contains(@class,'index')]]]">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
        <xsl:value-of select="'; '"/>
    </xsl:template>-->
    <xsl:template match="p/text()[1] | //span[contains(@class,'index')]/text()[1]">
        <xsl:variable name="txt" select="normalize-space(substring-before(.,','))"/>
        <!--<xsl:variable name="Charstyle0" select="$indformat//ParagraphStyleRange/descendant::PageReference[normalize-space(substring-after(@ReferencedTopic,'Topicn')) = $txt]/preceding::CharacterStyleRange[string-length((normalize-space(.))) &gt; 1][contains(., $txt)][current()]/lower-case(substring-after(@AppliedCharacterStyle,'CharacterStyle/'))"/>-->
        
        <xsl:variable name="Charstyle0">
            <xsl:for-each select="$indformat//ParagraphStyleRange/descendant::PageReference[normalize-space(substring-after(@ReferencedTopic,'Topicn')) = $txt]/preceding::CharacterStyleRange[string-length((normalize-space(.))) &gt; 1][contains(., $txt)][current()]/lower-case(substring-after(@AppliedCharacterStyle,'CharacterStyle/'))">
                <xsl:value-of select="current()"/>
            </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="Charstyle1">
            <xsl:for-each select="$indformat//ParagraphStyleRange/descendant::PageReference[normalize-space(tokenize(@ReferencedTopic,'Topicn')[last()]) = $txt]/preceding::CharacterStyleRange[string-length((normalize-space(.))) &gt; 1][contains(., $txt)][current()]/lower-case(substring-after(@AppliedCharacterStyle,'CharacterStyle/'))">
                <xsl:value-of select="current()"/>
            </xsl:for-each>
        </xsl:variable>
             
        <!--<xsl:if test="$indformat//ParagraphStyleRange/descendant::PageReference[normalize-space(substring-after(@ReferencedTopic,'Topicn')) = $txt]">
            
            <xsl:message><xsl:value-of select="$indformat//ParagraphStyleRange/descendant::PageReference[normalize-space(substring-after(@ReferencedTopic,'Topicn')) = $txt]/preceding::CharacterStyleRange[string-length((normalize-space(.))) &gt; 1][contains(., $txt)][1]/substring-after(@AppliedCharacterStyle,'CharacterStyle/')"/></xsl:message>
        </xsl:if>-->
        <xsl:choose>
            <xsl:when test="contains($Charstyle0,'smallcaps') or contains($Charstyle0,'allcaps') or @Underline = 'true' or StrikeThru='true' or  contains($Charstyle0,'heavy') or  contains($Charstyle0,'bold') or contains($Charstyle0,'italic') or contains($Charstyle0,'oblique') or contains($Charstyle1,'smallcaps') or contains($Charstyle1,'allcaps') or  contains($Charstyle1,'heavy') or  contains($Charstyle1,'bold') or contains($Charstyle1,'italic') or contains($Charstyle1,'oblique')">
                <xsl:if test="contains($Charstyle0,'smallcaps') or contains($Charstyle1,'smallcaps')">
                                    <xsl:text disable-output-escaping="yes">&lt;</xsl:text>
                                    <xsl:value-of select="'sc'"/>
                                    <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                                </xsl:if>
                <xsl:if test="contains($Charstyle0,'allcaps') or contains($Charstyle1,'allcaps')">
                                    <xsl:text disable-output-escaping="yes">&lt;</xsl:text>
                                    <xsl:value-of select="'sc'"/>
                                    <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                                </xsl:if>								
                <xsl:if test="@Underline ='true'">
                                    <xsl:text disable-output-escaping="yes">&lt;u&gt;</xsl:text>
                                </xsl:if>
                <!-- uncommented strike thru missing issue on 17-5-2022 -->
                <xsl:if test="@StrikeThru='true'">
                    <xsl:text disable-output-escaping="yes">&lt;</xsl:text>
                    <xsl:value-of select="'strike'"/>
                    <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                </xsl:if>
                <xsl:if test="contains($Charstyle0,'bold') or contains($Charstyle0,'medium')  or contains($Charstyle0,'heavy') or contains($Charstyle1,'bold') or contains($Charstyle1,'medium')  or contains($Charstyle1,'heavy')">
                    <xsl:text disable-output-escaping="yes">&lt;</xsl:text>
                    <xsl:value-of select="'b'"/>
                    <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                </xsl:if>
                <xsl:if test="contains($Charstyle0,'italic') or contains($Charstyle0,'oblique') or contains($Charstyle1,'italic') or contains($Charstyle1,'oblique')">
                    <xsl:text disable-output-escaping="yes">&lt;</xsl:text>
                    <xsl:value-of select="'i'"/>
                    <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                </xsl:if>							
                <xsl:if test="contains($Charstyle0,'superscript') or contains($Charstyle1,'superscript')">
                                    <xsl:text disable-output-escaping="yes">&lt;</xsl:text>
                                    <xsl:value-of select="'sup'"/>
                                    <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                                </xsl:if>	
                <xsl:if test="contains($Charstyle0,'subscript') or contains($Charstyle1,'subscript')">
                                    <xsl:text disable-output-escaping="yes">&lt;</xsl:text>
                                    <xsl:value-of select="'Sub'"/>
                                    <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                                </xsl:if>
                <!-- Added to avoid the smallcaps information here(contains($Charstyle0,'allcaps')) on 27-1-2022 -->
                <xsl:value-of select="."/>
                
                <xsl:if test="contains($Charstyle0,'subscript') or contains($Charstyle1,'subscript')">
                                    <xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
                                    <xsl:value-of select="'Sub'"/>
                                    <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                                </xsl:if>
                <xsl:if test="contains($Charstyle0,'superscript') or contains($Charstyle1,'superscript')">
                                    <xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
                                    <xsl:value-of select="'sup'"/>
                                    <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                                </xsl:if>	
                <xsl:if test="contains($Charstyle0,'italic') or contains($Charstyle0,'oblique') or contains($Charstyle1,'italic') or contains($Charstyle1,'oblique')">
                    <xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
                    <xsl:value-of select="'i'"/>
                    <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                </xsl:if>							
                <xsl:if test="contains($Charstyle0,'bold') or contains($Charstyle0,'medium')  or contains($Charstyle0,'heavy') or contains($Charstyle1,'bold') or contains($Charstyle1,'medium')  or contains($Charstyle1,'heavy')">
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
                <xsl:if test="contains($Charstyle0,'allcaps') or contains($Charstyle1,'allcaps')">
                                    <xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
                                    <xsl:value-of select="'sc'"/>
                                    <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                                </xsl:if>
                <xsl:if test="contains($Charstyle0,'smallcaps') or contains($Charstyle1,'smallcaps')">
                                    <xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
                                    <xsl:value-of select="'sc'"/>
                                    <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                                </xsl:if>
                
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>
    </xsl:stylesheet>