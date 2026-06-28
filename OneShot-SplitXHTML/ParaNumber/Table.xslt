<?xml version="1.0" encoding="UTF-8"?>
<!-- Added to avoid the whole line after delimiter(:) also applied bold on 26-10-2022 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    xmlns:idPkg="http://ns.adobe.com/AdobeInDesign/idml/1.0/packaging" version="2.0">
    <xsl:output method="xml" name="xml" standalone="yes" indent="yes"/>
    <xsl:preserve-space elements="Content"/>
    
    <xsl:output name="xslt" indent="yes"/>
    <!-- Added sorting issue by HyperlinkTextSourceon 10-1-2022 -->
   <!-- <xsl:template match="STORIES/STORY">
        <xsl:variable name="M" select="."/>
        <xsl:variable name="filename" select="concat('output2/', $M)"/>
        <xsl:result-document href="{$filename}" format="xml">

            <xsl:apply-templates select="document($M)"/>

        </xsl:result-document>
    </xsl:template>-->
    
    
    

    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    
    <xsl:template match="STORIES">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
<!--        <xsl:result-document href="output2/nestedChar.xslt">-->
            <xsl:result-document href="nestedChar.xslt">
        <xsl:text disable-output-escaping="yes">&lt;xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
            xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
            xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" version="2.0"&gt;</xsl:text>
                
            <!--<xsl:text disable-output-escaping="yes">&lt;xsl:output name="xml" indent="yes"/&gt;</xsl:text>
            
            <xsl:text disable-output-escaping="yes">&lt;xsl:template match="STORIES/STORY"&gt;</xsl:text>
                <xsl:text disable-output-escaping="yes">&lt;xsl:variable name="M" select="."/&gt;</xsl:text>
                <xsl:text disable-output-escaping="yes">&lt;xsl:variable name="filename" select="$M"/&gt;</xsl:text>
                <xsl:text disable-output-escaping="yes">&lt;xsl:result-document href="{$filename}" format="xml"&gt;</xsl:text>
                    
                    <xsl:text disable-output-escaping="yes">&lt;xsl:apply-templates select="document($M)"/&gt;</xsl:text>
                    
                <xsl:text disable-output-escaping="yes">&lt;/xsl:result-document&gt;</xsl:text>
            <xsl:text disable-output-escaping="yes">&lt;/xsl:template&gt;</xsl:text>-->
            
            <xsl:text disable-output-escaping="yes">&lt;xsl:template match="@* | node()"&gt;</xsl:text>
                <xsl:text disable-output-escaping="yes">&lt;xsl:copy&gt;</xsl:text>
                    <xsl:text disable-output-escaping="yes">&lt;xsl:apply-templates select="@* | node()"/&gt;</xsl:text>
                <xsl:text disable-output-escaping="yes">&lt;/xsl:copy&gt;</xsl:text>
            <xsl:text disable-output-escaping="yes">&lt;/xsl:template&gt;</xsl:text>
          <!--  <xsl:for-each select="STORY">
                <xsl:variable name="M" select="."/>-->
<!--                <xsl:apply-templates select="document($M)" mode="nestedCharacterStyle"/>-->
                <xsl:apply-templates mode="nestedCharacterStyle"/>
            <!--</xsl:for-each>-->
<!--        <xsl:apply-templates select="//ParagraphStyleRange" mode="nestedCharacterStyle"/>-->
        <xsl:text disable-output-escaping="yes">&lt;/xsl:stylesheet&gt;</xsl:text>
        </xsl:result-document>
    </xsl:template>

    <xsl:template match="ParagraphStyleRange">
        <!--<xsl:copy>
           <xsl:apply-templates mode="MoveTable"/>
       </xsl:copy>
       <xsl:apply-templates select="descendant::Table"/>-->
        <xsl:copy>
            <xsl:apply-templates select="@* | node()" mode="MoveTable"/>
        </xsl:copy>
        <xsl:variable name="curPara" select="self::ParagraphStyleRange"/>
        <xsl:for-each select="descendant::Table">
            <xsl:variable name="ancestorPara" select="ancestor::ParagraphStyleRange[1]"/>
            <xsl:variable name="bookmark">
                <xsl:choose>
                    <xsl:when
                        test="descendant::HyperlinkTextSource[1][contains(lower-case(@HyperlinkUDestination), '_story_')]">
                        <xsl:value-of
                            select="descendant::HyperlinkTextSource[1][contains(lower-case(@HyperlinkUDestination), '_story_')]/@HyperlinkUDestination"
                        />
                    </xsl:when>
                    <xsl:when
                        test="descendant::HyperlinkTextDestination[contains(@BookMarkDestination,'_UUID_') or contains(@BookMarkDestination,'story') or contains(lower-case(@BookMarkDestination), '_story_')][1]">
                        <xsl:value-of
                            select="descendant::HyperlinkTextDestination[contains(@BookMarkDestination,'_UUID_') or contains(@BookMarkDestination,'story') or contains(lower-case(@BookMarkDestination), '_story_')][1]/@BookMarkDestination"
                        />
                    </xsl:when>
                </xsl:choose>
            </xsl:variable>
            <xsl:choose>
                <xsl:when test="$curPara = $ancestorPara">
                    <!-- commenting this line for the purpose of cleaning up the document.xml  -->
                    <!-- <xsl:element name="ParagraphStyleRange">
                       <xsl:attribute name="AppliedParagraphStyle" select="ancestor::ParagraphStyleRange[1]/@AppliedParagraphStyle"/>
                       <xsl:attribute name="ParaInfo" select="$bookmark"/>
                       <xsl:element name="CharacterStyleRange">
                           <xsl:attribute name="AppliedCharacterStyle" select="'CharacterStyle/$ID/[No character style]'"/>-->
                    <xsl:copy>
                        <xsl:attribute name="w:rsidR" select="$bookmark"/>
                        <xsl:apply-templates select="@* | node()"/>
                    </xsl:copy>
                    <!--</xsl:element>
                   </xsl:element>-->
                </xsl:when>

            </xsl:choose>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="CharacterStyleRange[count(child::*) = 0]" mode="MoveTable"/>       
    
        
    
    
    <xsl:template match="text()" mode="nestedCharacterStyle"/>


    <xsl:template match="ParagraphStyleRange[self::ParagraphStyleRange = descendant::AllNestedStyles/ancestor::ParagraphStyleRange[1]]" mode="nestedCharacterStyle">
        <xsl:variable name="paraLId" select="@paraLID"/>
        <xsl:text disable-output-escaping="yes">&lt;xsl:template match="ParagraphStyleRange[@paraLID = </xsl:text><xsl:value-of select="$paraLId"/><xsl:text disable-output-escaping="yes">]"&gt;</xsl:text>
        <xsl:text disable-output-escaping="yes">&lt;xsl:copy&gt;</xsl:text>
        <xsl:text disable-output-escaping="yes">&lt;xsl:apply-templates select="@* | node()"/&gt;</xsl:text>    
        <xsl:text disable-output-escaping="yes">&lt;/xsl:copy&gt;</xsl:text>
        <xsl:text disable-output-escaping="yes">&lt;/xsl:template&gt;</xsl:text>
        <xsl:for-each select="descendant::ListItem">
            <xsl:variable name="curDelmiter" select="Delimiter"/>
            <xsl:variable name="curAppliedCharStyle" select="AppliedCharacterStyle"/>
            <xsl:variable name="curRepetition" select="number(Repetition)"/>
            <xsl:variable name="parentPara" select="ancestor::ParagraphStyleRange[1]"/>
            <xsl:variable name="precidingNested" >
                <xsl:choose>
                    <xsl:when test="not(preceding-sibling::ListItem)">
                        <xsl:value-of select="1"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:variable name="precedingNestAppliedChar">
                            <xsl:call-template name="PrecedingNest">
                                <xsl:with-param name="total" select="count(preceding-sibling::ListItem)"/>
                                <xsl:with-param name="current" select="1"/>
                                <xsl:with-param name="parentPara" select="$parentPara"/>
                            </xsl:call-template>
                        </xsl:variable>
                        
                        <xsl:variable name="precedingDelimiter" select="preceding-sibling::ListItem[number($precedingNestAppliedChar)]/Delimiter"/>
                        <xsl:variable name="precedingRepetition" select="preceding-sibling::ListItem[number($precedingNestAppliedChar)]/Repetition"/>
                        <xsl:variable name="precedingInclusive" select="preceding-sibling::ListItem[number($precedingNestAppliedChar)]/Inclusive"/>
                        <xsl:choose>
                            <xsl:when test="($precedingInclusive = 'true') or (($precedingDelimiter ='EnSpace') or ($precedingDelimiter ='EmSpace') or ($precedingDelimiter ='NonbreakingSpace') or ($precedingDelimiter ='ForcedLineBreak') or ($precedingDelimiter ='Tabs')
                                or ($precedingDelimiter ='AnyCharacter') or ($precedingDelimiter ='AnyWord') or ($precedingDelimiter ='Sentence') or ($precedingDelimiter ='IndentHereTab') or ($precedingDelimiter ='SectionMarker')
                                or ($precedingDelimiter ='Letters') or ($precedingDelimiter ='Digits'))">
                                <xsl:value-of select="count(ancestor::ParagraphStyleRange[1]/descendant::CharacterStyleRange[ancestor::ParagraphStyleRange[1] = $parentPara][@delimiter = $precedingDelimiter][number($precedingRepetition)]/preceding::CharacterStyleRange[ancestor::ParagraphStyleRange[1] = $parentPara]) + 2"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="count(ancestor::ParagraphStyleRange[1]/descendant::CharacterStyleRange[ancestor::ParagraphStyleRange[1] = $parentPara][@delimiter = $precedingDelimiter][number($precedingRepetition)]/preceding::CharacterStyleRange[ancestor::ParagraphStyleRange[1] = $parentPara]) + 1"/>
                            </xsl:otherwise>
                        </xsl:choose>
                        
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            
            <!--<xsl:variable name="pre" select="count(ancestor::ParagraphStyleRange[1]/descendant::CharacterStyleRange[ancestor::ParagraphStyleRange[1] = $parentPara][@delimiter = $curDelmiter][number($curRepetition)]/preceding::CharacterStyleRange[ancestor::ParagraphStyleRange[1] = $parentPara])"/>-->
            <!-- Added to avoid the whole line after delimiter(:) also applied bold on 26-10-2022 -->
            <xsl:variable name="pre" select="count(ancestor::ParagraphStyleRange[1]/descendant::CharacterStyleRange[ancestor::ParagraphStyleRange[1] = $parentPara][@delimiter = $curDelmiter][number($curRepetition)]//preceding-sibling::CharacterStyleRange[ancestor::ParagraphStyleRange[1] = $parentPara] | ancestor::ParagraphStyleRange[1]/descendant::CharacterStyleRange[ancestor::ParagraphStyleRange[1] = $parentPara][@delimiter = $curDelmiter][number($curRepetition)]//preceding-sibling::*//CharacterStyleRange[ancestor::ParagraphStyleRange[1] = $parentPara]|ancestor::ParagraphStyleRange[1]/descendant::CharacterStyleRange[ancestor::ParagraphStyleRange[1] = $parentPara][@delimiter = $curDelmiter][number($curRepetition)]//ancestor::XMLElement/preceding-sibling::CharacterStyleRange[ancestor::ParagraphStyleRange[1] = $parentPara])"/>
            <xsl:variable name="currentdelimiterChar" select="count(ancestor::ParagraphStyleRange[1]/descendant::CharacterStyleRange[ancestor::ParagraphStyleRange[1] = $parentPara][@delimiter = $curDelmiter])"/>
            <xsl:if test="$currentdelimiterChar &gt; 0">
                <xsl:if test="(Inclusive ='true') or (($curDelmiter ='EnSpace') or ($curDelmiter ='EmSpace') or ($curDelmiter ='NonbreakingSpace') or ($curDelmiter ='ForcedLineBreak') or ($curDelmiter ='Tabs')
                    or ($curDelmiter ='AnyCharacter') or ($curDelmiter ='AnyWord') or ($curDelmiter ='Sentence') or ($curDelmiter ='IndentHereTab') or ($curDelmiter ='SectionMarker')
                    or ($curDelmiter ='Letters') or ($curDelmiter ='Digits'))">  
                    <xsl:text disable-output-escaping="yes">&lt;xsl:template match="CharacterStyleRange[ancestor::ParagraphStyleRange[1][@paraLID = </xsl:text><xsl:value-of select="$paraLId"/><xsl:text disable-output-escaping="yes">]][@delimiter = '</xsl:text><xsl:value-of select="$curDelmiter"/><xsl:text disable-output-escaping="yes">'][</xsl:text><xsl:value-of select="$curRepetition"/><xsl:text disable-output-escaping="yes">]"&gt;</xsl:text>
                    <xsl:text disable-output-escaping="yes">&lt;xsl:copy&gt;</xsl:text>
                    <xsl:text disable-output-escaping="yes">&lt;xsl:apply-templates select="@*"/&gt;</xsl:text>
                    <xsl:text disable-output-escaping="yes">&lt;xsl:attribute name="NestedAppliedCharacterStyle" select="'</xsl:text><xsl:value-of select="$curAppliedCharStyle"/><xsl:text disable-output-escaping="yes">'"/&gt;</xsl:text>
                    <xsl:text disable-output-escaping="yes">&lt;xsl:apply-templates select="node()"/&gt;</xsl:text>
                    <xsl:text disable-output-escaping="yes">&lt;/xsl:copy&gt;</xsl:text>
                    <xsl:text disable-output-escaping="yes">&lt;/xsl:template&gt;</xsl:text>
                </xsl:if>
                <xsl:call-template name="nest">
                    <xsl:with-param name="start" select="$pre"/>
                    <xsl:with-param name="end" select="$precidingNested"/>
                    <xsl:with-param name="paraLId" select="$paraLId"/>
                    <xsl:with-param name="curAppliedCharStyle" select="$curAppliedCharStyle"/>
                </xsl:call-template>
            </xsl:if>
            
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="nest">
        <xsl:param name="start" as="xs:integer"/>
        <xsl:param name="end" as="xs:integer"/>
        <xsl:param name="paraLId"/>
        <xsl:param name="curAppliedCharStyle"/>
        
        <xsl:if test="number($end) &lt;= number($start)">
            <xsl:text disable-output-escaping="yes">&lt;xsl:template match="CharacterStyleRange[self::CharacterStyleRange = ancestor::ParagraphStyleRange[@paraLID = </xsl:text><xsl:value-of select="$paraLId"/><xsl:text disable-output-escaping="yes">]/descendant::CharacterStyleRange[</xsl:text><xsl:value-of select="$start"/><xsl:text disable-output-escaping="yes">]]"&gt;</xsl:text>
            <xsl:text disable-output-escaping="yes">&lt;xsl:copy&gt;</xsl:text>
            <xsl:text disable-output-escaping="yes">&lt;xsl:apply-templates select="@*"/&gt;</xsl:text>
            <xsl:text disable-output-escaping="yes">&lt;xsl:attribute name="NestedAppliedCharacterStyle" select="'</xsl:text><xsl:value-of select="$curAppliedCharStyle"/><xsl:text disable-output-escaping="yes">'"/&gt;</xsl:text>
            <xsl:text disable-output-escaping="yes">&lt;xsl:apply-templates select="node()"/&gt;</xsl:text>
            <xsl:text disable-output-escaping="yes">&lt;/xsl:copy&gt;</xsl:text>
            <xsl:text disable-output-escaping="yes">&lt;/xsl:template&gt;</xsl:text>
            
            <xsl:call-template name="nest">
                <xsl:with-param name="start" select="$start - 1"/>
                <xsl:with-param name="end" select="$end"/>
                <xsl:with-param name="paraLId" select="$paraLId"/>
                <xsl:with-param name="curAppliedCharStyle" select="$curAppliedCharStyle"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <xsl:template name="PrecedingNest">
        <xsl:param name="total" as="xs:integer"/>
        <xsl:param name="current" as="xs:integer"/>
        <xsl:param name="parentPara"/>
        
        
        <xsl:variable name="precedingDelimiter" select="preceding-sibling::ListItem[$current]/Delimiter"/>
        <xsl:variable name="precedingRepetition" select="preceding-sibling::ListItem[$current]/Repetition"/>
        <xsl:variable name="preNest" select="count(ancestor::ParagraphStyleRange[1]/descendant::CharacterStyleRange[ancestor::ParagraphStyleRange[1] = $parentPara][@delimiter = $precedingDelimiter])"/>
        <xsl:if test="(number($preNest) &gt; 0)">
            <xsl:value-of select="$current"/>
        </xsl:if>
        <xsl:if test="(number($current) &lt; number($total)) and (number($preNest) &lt;= 0)">
            <xsl:call-template name="PrecedingNest">
                <xsl:with-param name="total" select="$total"/>
                <xsl:with-param name="current" select="$current + 1"/>
                <xsl:with-param name="parentPara" select="$parentPara"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="@* | node()" mode="MoveTable">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()" mode="MoveTable"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="Table" mode="MoveTable"/>
    
    <xsl:template match="MetadataPacketPreference[parent::Story]"/>    

</xsl:stylesheet>