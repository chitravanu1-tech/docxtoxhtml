<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE stylesheet [<!ENTITY tab "<xsl:text>&#9;</xsl:text>">]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    exclude-result-prefixes="xs math" xmlns:idPkg="http://ns.adobe.com/AdobeInDesign/idml/1.0/packaging"
    xmlns:math="java.lang.Math" 
    version="2.0">
    
    <xsl:output method="xml" name="xml" standalone="yes" indent="yes"/>
    <xsl:preserve-space elements="Content"/>
    
    <xsl:variable name="linked" select="document('linked.xml')"/>
    <xsl:variable name="Preferences" select="document('Preferences.xml')"/>
    <xsl:variable name="ChapterNumber">
        <xsl:value-of select="$Preferences//idPkg:Preferences/ChapterNumberPreference/@ChapterNumber"/>
    </xsl:variable>    
    <xsl:variable name="DM" select="document('designmap.xml')"/>

    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    
   <xsl:template match="idPkg:Story">
        <xsl:variable name="Self" select="child::Story/@Self"/>
       <xsl:variable name="M" select="concat('Story_',$Self,'.xml')"/>
        <xsl:variable name="filename" select="concat('output/',$M)"/>
<!--        <xsl:result-document href="{$filename}" format="xml">-->
            <xsl:copy>
            <xsl:apply-templates select="@*|node()"/> 
            </xsl:copy>
        <!--</xsl:result-document>-->
    </xsl:template>
    
    
    <!-- getting the layer visibility information from the designmap.xml   -->
    <xsl:template match="@ItemLayer">
        <xsl:variable name="self" select="."/>
        <xsl:copy>
            <xsl:apply-templates select="."/>
        </xsl:copy>
        <xsl:attribute name="layerVisibility" select="$DM//Layer[@Self =$self]/@Visible"></xsl:attribute>
    </xsl:template>
    
    <xsl:template match="ParagraphStyleRange">
        <xsl:variable name="ListID">
            <!--<xsl:number level="any"/>-->
            <!--<xsl:number level="any" count="//ParagraphStyleRange"/>-->
            <xsl:value-of select="@paraLID"/>
        </xsl:variable>
        
        <xsl:variable name="curPara">
            <xsl:call-template name="numLvl">
                <xsl:with-param name="appliedParaStyle" select="@AppliedParagraphStyle"/>
            </xsl:call-template>
        </xsl:variable>
        
        <xsl:variable name="ParaStyleCount">
            <xsl:for-each select="tokenize($curPara,',')">
                <xsl:if test="contains(.,'ParaStyleCount')">
                    <xsl:variable name="numattribName" select="tokenize(.,'=')[1]"/>
                    <xsl:variable name="numattribValue" select="substring-after(.,concat($numattribName,'='))"/>
                    <!-- <xsl:if test="not(string-length($numattribName) = 0) and not(string-length($numattribValue) = 0)">
                        <xsl:attribute name="{$numattribName}" select="$numattribValue"/>
                    </xsl:if>-->
                    <xsl:value-of select="$numattribValue"/>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>
        
        <xsl:variable name="curBasedon">
            <xsl:for-each select="tokenize($curPara,',')">
                <xsl:if test="contains(.,'basedOn')">
                    <xsl:variable name="numattribName" select="tokenize(.,'=')[1]"/>
                    <xsl:variable name="numattribValue" select="substring-after(.,concat($numattribName,'='))"/>
                    <!--<xsl:if test="not(string-length($numattribName) = 0) and not(string-length($numattribValue) = 0)">
                        <xsl:attribute name="{$numattribName}" select="$numattribValue"/>
                    </xsl:if>-->
                    <xsl:value-of select="$numattribValue"/>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>
        
        <xsl:variable name="iscurParaNumList">
            <xsl:for-each select="tokenize($curPara,',')">
                <xsl:if test="contains(.,'NumberList')">
                    <xsl:variable name="numattribName" select="tokenize(.,'=')[1]"/>
                    <xsl:variable name="numattribValue" select="substring-after(.,concat($numattribName,'='))"/>
                    <!-- <xsl:if test="not(string-length($numattribName) = 0) and not(string-length($numattribValue) = 0)">
                        <xsl:attribute name="{$numattribName}" select="$numattribValue"/>
                    </xsl:if>-->
                    <xsl:value-of select="$numattribValue"/>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>
        
        <xsl:variable name="ParaStyle" select="@AppliedParagraphStyle"/>
        
        <xsl:variable name="curParaNumLvl">
            <xsl:for-each select="tokenize($curPara,',')">
                <xsl:if test="contains(.,'NumberingLevel')">
                    <xsl:variable name="numattribName" select="tokenize(.,'=')[1]"/>
                    <xsl:variable name="numattribValue" select="substring-after(.,concat($numattribName,'='))"/>
                    <!--<xsl:if test="not(string-length($numattribName) = 0) and not(string-length($numattribValue) = 0)">
                        <xsl:attribute name="numLvl" select="$numattribValue"/>
                    </xsl:if>-->
                    <xsl:value-of select="$numattribValue"/>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>
        
        <xsl:variable name="character">
            <xsl:for-each select="tokenize($curPara,',')">
                <xsl:if test="contains(.,'character')">
                    <xsl:variable name="numattribName" select="tokenize(.,'=')[1]"/>
                    <xsl:variable name="numattribValue" select="substring-after(.,concat($numattribName,'='))"/>
                    <!--<xsl:if test="not(string-length($numattribName) = 0) and not(string-length($numattribValue) = 0)">
                        <xsl:attribute name="numLvl" select="$numattribValue"/>
                    </xsl:if>-->
                    <xsl:value-of select="$numattribValue"/>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>
        
        
        <xsl:variable name="NumberingStartAt">
            <xsl:choose>
                <xsl:when test="@NumberingStartAt">
                    <xsl:value-of select="@NumberingStartAt"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:for-each select="tokenize($curPara,',')">
                        <xsl:if test="contains(.,'NumberingStartAt')">
                            <xsl:variable name="numattribName" select="tokenize(.,'=')[1]"/>
                            <xsl:variable name="numattribValue" select="substring-after(.,concat($numattribName,'='))">
                                
                            </xsl:variable>
                            <!--<xsl:if test="not(string-length($numattribName) = 0) and not(string-length($numattribValue) = 0)">
                        <xsl:attribute name="numLvl" select="$numattribValue"/>
                    </xsl:if>-->
                            <!--<xsl:value-of select="$numattribValue"/>-->
                            <xsl:choose>
                               
                                <xsl:when test="not(string-length($numattribValue) = 0)">
                                    <xsl:variable name="numat">
                                        <xsl:value-of select="number($numattribValue)"/>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$numat ='NaN'">
                                            <xsl:value-of select="0"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="number($numattribValue)"/>        
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="0"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:otherwise>
            </xsl:choose>
            
        </xsl:variable>
        
        <xsl:variable name="NumberingContinue">
            <xsl:choose>
                <xsl:when test="@NumberingContinue">
                    <xsl:value-of select="@NumberingContinue"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:for-each select="tokenize($curPara,',')">
                        <xsl:if test="contains(.,'NumberingContinue')">
                            <xsl:variable name="numattribName" select="tokenize(.,'=')[1]"/>
                            <xsl:variable name="numattribValue" select="substring-after(.,concat($numattribName,'='))"/>
                            <!--<xsl:if test="not(string-length($numattribName) = 0) and not(string-length($numattribValue) = 0)">
                        <xsl:attribute name="numLvl" select="$numattribValue"/>
                    </xsl:if>-->
                            <xsl:value-of select="$numattribValue"/>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:otherwise>
            </xsl:choose>
            
        </xsl:variable>
      
    <!--    <xsl:variable name="ManualRestart">
            <xsl:value-of select="$linked//ParagraphStyle[@Self = $ParaStyle]/@ManualNumberRestart"/>
        </xsl:variable>-->
      
        <xsl:variable name="ListNRestart">
            
            <xsl:variable name="ManualListRestart" select="@NumberingContinue"/>
            <xsl:variable name="ParaRNumStartAt" select="@NumberingStartAt"/>
            <xsl:variable name="ParaRBullandNumListType" select="@BulletsAndNumberingListType"/>
            <xsl:variable name="paraNumbExpression">
                <xsl:choose>
                    <xsl:when test="@NumberingExpression">
                        <xsl:choose>
                            <xsl:when test="(string-length(@NumberingExpression) =0)">
                                <xsl:value-of select="'false'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="'true'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="'true'"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:for-each select="$linked//ParagraphStyle[@Self = $ParaStyle]">
                <xsl:variable name="ListRestartNumId">
                    <xsl:value-of select="count(ancestor::idPkg:Styles/descendant::ParagraphStyle)"/>
                </xsl:variable>
                <xsl:variable name="NumberingStart" select="@NumberingStartAt"/>
                <xsl:variable name="NumberingCont">
                    <xsl:choose>
                        <xsl:when test="not(string-length($NumberingContinue) = 0)">
                            <xsl:value-of select="$NumberingContinue"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of  select="@NumberingContinue"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="LID">
                    <xsl:choose>
                        <xsl:when test="$ParaRBullandNumListType ='NoList'">
                            <xsl:value-of select="0"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="number($ListID) + $ListRestartNumId"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="styleNumbExpression">
                    <xsl:choose>
                        <xsl:when test="@NumberingExpression">
                            <xsl:choose>
                                <xsl:when test="(string-length(@NumberingExpression) =0)">
                                    <xsl:value-of select="'false'"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="'true'"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="'true'"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
<!--                <xsl:choose>
                    <xsl:when test="@Self = $ParaStyle">-->
                        <!--added ($NumberingStartAt != 0) condition because indesign is not considering (NumberingStartAt = 0) as a list-->
<!--                        <xsl:if test="$NumberingCont = 'false' or $ManualListRestart = 'false'">-->
                        <xsl:if test="($NumberingCont = 'false' or $ManualListRestart = 'false')  and (not(number($NumberingStartAt) = 0) and not(@BulletsAndNumberingListType ='NoList')) and ($paraNumbExpression ='true' and $styleNumbExpression ='true')">
<!--                            <xsl:if test="not($ParaRBullandNumListType ='NoList') and not($ParaRNumStartAt =0)">-->
                            <xsl:if test="not($ParaRNumStartAt =0)">
                                <xsl:element name="w:numPr">
                                    <xsl:element name="w:ilvl">
                                        <xsl:attribute name="w:val" select="'0'"/>
                                    </xsl:element>
                                    <xsl:element name="w:numId">
                                        <xsl:attribute name="w:val">
                                            <!--<xsl:value-of select="number($ListID) + $ListRestartNumId"/>-->
                                            <xsl:value-of select="$LID"/>
                                        </xsl:attribute>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:if>
                        </xsl:if>
                    <!--</xsl:when>
                </xsl:choose>-->
            </xsl:for-each>
        </xsl:variable>
        

        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <!--<xsl:if test="not(string-length($curParaNumLvl) = 0)">
                <xsl:attribute name="curParaNumLvl" select="$curParaNumLvl"/>
            </xsl:if>
            <xsl:if test="not(string-length($ParaStyleCount) = 0)">
                <xsl:attribute name="ParaStyleCount" select="$ParaStyleCount"/>
            </xsl:if>
            <xsl:if test="not(string-length($iscurParaNumList) = 0)">
                <xsl:attribute name="iscurParaNumList" select="$iscurParaNumList"/>
            </xsl:if>
            <xsl:if test="not(string-length($curBasedon) = 0)">
                <xsl:attribute name="curBasedon" select="$curBasedon"/>
            </xsl:if>
            <xsl:if test="not(string-length($character) = 0)">
                <xsl:attribute name="character" select="$character"/>
            </xsl:if>
            <xsl:if test="not(string-length($NumberingStartAt) = 0)">
                <xsl:attribute name="NumberingStartAt" select="$NumberingStartAt"/>
            </xsl:if>
            <xsl:if test="not(string-length($NumberingContinue) = 0)">
                <xsl:attribute name="NumberingContinue" select="$NumberingContinue"/>
            </xsl:if>-->
            
            <!-- new condition added for the purpose of manual numbering          -->
<!--            <xsl:if test="@BulletsAndNumberingListType or @NumberingContinue ='false' or child::Properties/BulletChar or @NumberingStartAt or @NumberingExpression">-->
<!--            <xsl:if test="not($linked//ParagraphStyle[@Self = $ParaStyle]/@ManualNumberRestart)"></xsl:if>-->
             <xsl:for-each select="tokenize($curPara,',')">
                 <xsl:variable name="attribName" select="tokenize(.,'=')[1]"/>
                 <xsl:variable name="attribValue" select="substring-after(.,concat($attribName,'='))"/>
                 <xsl:if test="not(string-length($attribName) = 0) and not(string-length($attribValue) = 0)">
                     <xsl:attribute name="{$attribName}" select="$attribValue"/>
                 </xsl:if>
             </xsl:for-each>
             <xsl:if test="@NumberingStartAt">
                 <xsl:attribute name="SelfNumberingStartAt" select="@NumberingStartAt"/>
             </xsl:if>
             <xsl:if test="not(string-length($NumberingContinue) = 0)">
                 <xsl:attribute name="NumberingContinue" select="$NumberingContinue"/>
             </xsl:if>
             <xsl:copy-of select="$ListNRestart"/>
            <!--</xsl:if>-->
            
            <!--  This is to copy the nested characterstyle of the paragraph if it is defined in the style           -->
            <xsl:variable name="paraStyle" select="@AppliedParagraphStyle"/>
            
            <xsl:copy-of select="$linked//ParagraphStyle[@Self = $paraStyle]/descendant::AllNestedStyles"/>
            <!--  This is to copy the nested characterstyle of the paragraph if it is defined in the style           -->
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="CharacterStyleRange">
        <xsl:variable name="paraStyle" select="ancestor::ParagraphStyleRange[1]/@AppliedParagraphStyle"/>
        <xsl:choose>
            <xsl:when test="$linked//ParagraphStyle[@Self = $paraStyle]/descendant::AllNestedStyles">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="CharacterStyleRange/Properties">
        <xsl:variable name="paraStyle" select="ancestor::ParagraphStyleRange[1]/@AppliedParagraphStyle"/>
        <xsl:choose>
            <xsl:when test="$linked//ParagraphStyle[@Self = $paraStyle]/descendant::AllNestedStyles"/>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template
        match="Footnote | GaijiOwnedItemObject 
        | Note | Table | TextVariableInstance 
        | HyperlinkTextDestination | Change 
        | HiddenText | DTD | Oval 
        | Rectangle | GraphicLine | Polygon 
        | Group | TextFrame | Button 
        | FormField | MultiStateObject 
        | EPSText | PageReference | HyperlinkTextSource
        | ParagraphDestination | CrossReferenceSource 
        | Content | Br">
        <!--  | XMLElement[ancestor::ParagraphStyleRange[1]/child::AllNestedStyles] | XMLComment[ancestor::ParagraphStyleRange[1]/child::AllNestedStyles] | XMLInstruction[ancestor::ParagraphStyleRange[1]/child::AllNestedStyles]       -->
        
        <xsl:variable name="paraStyle" select="ancestor::ParagraphStyleRange[1]/@AppliedParagraphStyle"/>
        <xsl:choose>
            <xsl:when test="$linked//ParagraphStyle[@Self = $paraStyle]/descendant::AllNestedStyles">
                <xsl:element name="CharacterStyleRange">
                    <xsl:if test="ancestor::CharacterStyleRange[1]/@*">
                        <xsl:for-each select="ancestor::CharacterStyleRange[1]/@*">
                            <xsl:attribute name="{name(.)}" select="."/>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:for-each select="preceding-sibling::*">
                        <xsl:if test="self::Properties">
                            <xsl:copy-of select="."/>
                        </xsl:if>
                    </xsl:for-each>
                    <xsl:copy>
                        <xsl:apply-templates select="@*|node()"/>
                    </xsl:copy>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>
    
    <xsl:template name="numLvl">
        <xsl:param name="appliedParaStyle"/>
        <!--<xsl:value-of select="concat('NumberingLevel =&quot;',$linked//ParagraphStyle[@Self = $appliedParaStyle]/@NumberingLevel,'&quot;')"/>-->
        <xsl:for-each select="$linked//ParagraphStyle[@Self = $appliedParaStyle]">
            <xsl:variable name="basedOn">
                <xsl:choose>
                    <xsl:when test="starts-with(Properties/BasedOn,'$ID/')">
                        <xsl:value-of select="concat('ParagraphStyle/',Properties/BasedOn)"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="Properties/BasedOn"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:variable name="NumberingExpression" >
                <xsl:variable name="expression" select="@NumberingExpression"/>
                <xsl:choose>
                    <xsl:when test="not(string-length($expression) = 0)">
                        <xsl:value-of select="$expression"/>   
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="'%1'"/>     
                    </xsl:otherwise>
                </xsl:choose>
                
            </xsl:variable>
            <xsl:variable name="BulletCharacter">
                <xsl:variable name="bullet" select="concat('&amp;#',self::ParagraphStyle/Properties/BulletChar/@BulletCharacterValue,';')"/>
                <xsl:variable name="bullet1" select="self::ParagraphStyle/Properties/BulletChar/@BulletCharacterValue"/>
                <xsl:variable name="BCL">
                    <xsl:choose>
                        <xsl:when test="(self::ParagraphStyle/Properties/BulletChar/@BulletCharacterValue)">
                            <xsl:value-of select="$bullet"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="'•'"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                
                <xsl:value-of select="$BCL"/>
            </xsl:variable>
            <xsl:variable name="Character">
                <xsl:choose>
                    <xsl:when test="@BulletsAndNumberingListType = 'BulletList' or (child::Properties/BulletChar and not(@BulletsAndNumberingListType ='NumberedList' or @BulletsAndNumberingListType ='NoList'))">
                        <xsl:value-of select="$BulletCharacter"/>
                    </xsl:when>
                    <xsl:when test="@BulletsAndNumberingListType ='NumberedList'">
                        <xsl:variable name="Number">
                            <xsl:variable name="ReplaceTab.1" select="replace($NumberingExpression,'(\^t)','')"/>
                            <xsl:variable name="ReplaceEndash.2" select="replace($ReplaceTab.1,'(\^=)','–')"/>
                            <xsl:variable name="ReplaceEmdash.3" select="replace($ReplaceEndash.2,'(\^_)','—')"/>
                            <xsl:variable name="ReplaceEnSpace.4" select="replace($ReplaceEmdash.3,'(\^&gt;)',' ')"/>
                            <xsl:variable name="ReplaceEmSpace.5" select="replace($ReplaceEnSpace.4,'(\^m)',' ')"/>
                            <xsl:variable name="ReplaceParaSymbol.6" select="replace($ReplaceEmSpace.5,'(\^p)','¶')"/>
                            <xsl:variable name="ReplaceSectionSymbol.7" select="replace($ReplaceParaSymbol.6,'(\^J)','§')"/>
                            <xsl:variable name="ReplaceBulletCharacter.8" select="replace($ReplaceSectionSymbol.7,'(\^B)','•')"/>
                            <xsl:variable name="ReplaceEllipsis.9" select="replace($ReplaceBulletCharacter.8,'(\^e)','…')"/>
                            <xsl:variable name="ReplaceHairSpace.10" select="replace($ReplaceEllipsis.9,'(\^\|)',' ')"/>
                            <xsl:variable name="ReplaceThinSpace.11" select="replace($ReplaceHairSpace.10,'(\^&lt;)',' ')"/>
                            <xsl:variable name="ReplaceFigureSpace.12" select="replace($ReplaceThinSpace.11,'(\^/)',' ')"/>
                            <xsl:variable name="ReplacePunctuationSpace.13" select="replace($ReplaceFigureSpace.12,'(\^\.)',' ')"/>
                            <xsl:variable name="ReplaceChapterNumber.14" select="replace($ReplacePunctuationSpace.13,'(\^H)',$ChapterNumber)"/>
                            <xsl:variable name="FinalNumberCharacter.15" select="replace($ReplaceChapterNumber.14,'(\^#)','%1')"/>
                            
                            <xsl:value-of select="$FinalNumberCharacter.15"/>    
                            
                        </xsl:variable>
                        
                        <xsl:choose>
                            <xsl:when test="not(string-length($Number) = 0)">
                                <xsl:value-of select="$Number"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="'%1'"/>        
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                </xsl:choose>
            </xsl:variable>
            <xsl:variable name="ListRestartNumId">
                <xsl:value-of select="count(ancestor::idPkg:Styles/descendant::ParagraphStyle)"/>
            </xsl:variable>
            <xsl:variable name="BasedonBulletsAndNumberingListType">
                <xsl:if test="not(@BulletsAndNumberingListType) and not(@NumberingContinue ='false')">
                    <xsl:value-of select="'true'"/>
                </xsl:if>
            </xsl:variable>
            <xsl:variable name="ParaStyle">
                <xsl:value-of select="@Self"/>
            </xsl:variable>
            <xsl:variable name="BasedOnNumberList">
                <xsl:if test="$BasedonBulletsAndNumberingListType = 'true'">
                    <xsl:for-each select="//ParagraphStyle[@Self =$basedOn]">
                        <xsl:if test="(@BulletsAndNumberingListType ='NumberedList') or (@NumberingContinue ='false')">
                            <xsl:value-of select="'true'"/>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
            </xsl:variable>
            <xsl:variable name="isNumbExpression">
                <xsl:choose>
                    <xsl:when test="@NumberingExpression">
                        <xsl:choose>
                            <xsl:when test="(string-length(@NumberingExpression) =0)">
                                <xsl:value-of select="'false'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="'true'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="'true'"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:variable name="NumberingStartAt">
                <xsl:if test="@NumberingStartAt">
                    <xsl:value-of select="@NumberingStartAt"/>
                </xsl:if>
            </xsl:variable>
            <xsl:variable name="NumberingContinue">
                <xsl:if test="@NumberingContinue">
                    <xsl:value-of select="@NumberingContinue"/>
                </xsl:if>
            </xsl:variable>
            <xsl:variable name="NumberList">
                <xsl:choose>
                    <xsl:when test="@BulletsAndNumberingListType ='NumberedList'">
                        <xsl:value-of select="boolean(@BulletsAndNumberingListType ='NumberedList')"/>
                    </xsl:when>
                    <xsl:when test="@BulletsAndNumberingListType = 'BulletList' or (child::Properties/BulletChar)">
                        <xsl:value-of select="boolean(@BulletsAndNumberingListType ='NumberedList')"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="'NoList'"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:variable name="listAttributes">
                <!--<xsl:variable name="attributes">-->
                <xsl:if test="@BulletsAndNumberingListType or @NumberingContinue ='false' or child::Properties/BulletChar or $BasedOnNumberList ='true'">
                    <!--<xsl:if test="(@BulletsAndNumberingListType or @NumberingContinue ='false' or child::Properties/BulletChar or $BasedonNumberingRestart = 'true' or $BasedOnNumberList ='true') and ($isNumbExpression ='true')">-->
                    <!--for paragraph styles, those are having NumberingContinue = false also we have to copy the numbering formats--> 
                    <xsl:call-template name="listAttrib">
                        <xsl:with-param name="isNumberingStartAt" select="(boolean(@BulletsAndNumberingListType ='NumberedList') or boolean(@NumberingContinue ='false') or $BasedOnNumberList ='true')"/>
                        <xsl:with-param name="isNumberingLevel" select="boolean(@BulletsAndNumberingListType) or (child::Properties/BulletChar) or boolean(@NumberingContinue ='false') or $BasedOnNumberList ='true'"/>
<!--                        <xsl:with-param name="isNumberingContinue" select="(boolean(@BulletsAndNumberingListType ='NumberedList') or boolean(@NumberingContinue ='false')  or $BasedOnNumberList ='true')and ($isNumbExpression ='true')"/>-->
                        <xsl:with-param name="isNumberingApplyRestartPolicy" select="boolean(@BulletsAndNumberingListType ='NumberedList') or boolean(@NumberingContinue ='false') or $BasedOnNumberList ='true'"/>
                        <xsl:with-param name="isBulletsAlignment" select="boolean(@BulletsAndNumberingListType = 'BulletList' or (child::Properties/BulletChar and not(@BulletsAndNumberingListType ='NumberedList' or @BulletsAndNumberingListType ='NoList')))"/>
                        <xsl:with-param name="isNumberingAlignment" select="boolean(@BulletsAndNumberingListType ='NumberedList') or boolean(@NumberingContinue ='false') or $BasedOnNumberList ='true'"/>
                        <xsl:with-param name="isNumberingExpression" select="(boolean(@BulletsAndNumberingListType ='NumberedList') or boolean(@NumberingContinue ='false') or $BasedOnNumberList ='true')and ($isNumbExpression ='true')"/>
                        <xsl:with-param name="isBulletsTextAfter" select="boolean(@BulletsAndNumberingListType = 'BulletList') or (child::Properties/BulletChar and not(@BulletsAndNumberingListType ='NumberedList' or @BulletsAndNumberingListType ='NoList'))"/>
                        <xsl:with-param name="isBulletsAndNumberingListType" select="not(@BulletsAndNumberingListType) and child::Properties/BulletChar"></xsl:with-param>
                    </xsl:call-template>
                </xsl:if>
            </xsl:variable>
           
            <xsl:if test="string-length(@NumberingLevel) &gt; 0">
                <xsl:value-of select="concat('curParaNumLvl =',@NumberingLevel,',')"/>
            </xsl:if>
            <xsl:if test="string-length(@NumberingExpression) &gt; 0">
                <xsl:value-of select="concat('NumberingExpression =',@NumberingExpression,',')"/>
            </xsl:if>
            <!--<xsl:value-of select="concat('NumberList =',boolean(@BulletsAndNumberingListType ='NumberedList'),',')"/>-->
            <xsl:if test="string-length($NumberList) &gt; 0">
                <xsl:value-of select="concat('iscurParaNumList =',$NumberList,',')"/>
            </xsl:if>
            <xsl:if test="string-length($basedOn) &gt; 0">
                <xsl:value-of select="concat('curBasedon =',$basedOn,',')"/>
            </xsl:if>
            <xsl:if test="string-length($ListRestartNumId) &gt; 0">
                <xsl:value-of select="concat('ParaStyleCount =',$ListRestartNumId,',')"/>
            </xsl:if>
            <xsl:if test="string-length($Character) &gt; 0">
                <xsl:value-of select="concat('character =',$Character,',')"/>
            </xsl:if>
            <xsl:if test="string-length($NumberingStartAt) &gt; 0">
                <xsl:value-of select="concat('NumberingStartAt =',$NumberingStartAt,',')"/>
            </xsl:if>
            <xsl:if test="string-length($NumberingContinue) &gt; 0">
                <xsl:value-of select="concat('NumberingContinue =',$NumberingContinue,',')"/>
            </xsl:if>
            <xsl:if test="string-length($listAttributes) &gt; 0">
                <xsl:value-of select="$listAttributes"/>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template  name="listAttrib">
        <xsl:param name="NumberingStartAt"/>
        <xsl:param name="NumberingLevel"/>
        <xsl:param name="NumberingContinue"/>
        <xsl:param name="NumberingApplyRestartPolicy"/>
        <xsl:param name="BulletsAlignment"/>
        <xsl:param name="NumberingAlignment"/>
        <xsl:param name="NumberingExpression"/>
        <xsl:param name="BulletsTextAfter"/>
        <xsl:param name="BulletsAndNumberingListType"/>
        <xsl:param name="isNumberingStartAt"/>
        <xsl:param name="isNumberingLevel"/>
        <xsl:param name="isNumberingContinue"/>
        <xsl:param name="isNumberingApplyRestartPolicy"/>
        <xsl:param name="isBulletsAlignment"/>
        <xsl:param name="isNumberingAlignment"/>
        <xsl:param name="isNumberingExpression"/>
        <xsl:param name="isBulletsTextAfter"/>
        <xsl:param name="isBulletsAndNumberingListType"/>
        <xsl:param name="attribs"/> 
        <xsl:variable name="basedOn" select="./child::Properties/BasedOn"/>
        <xsl:variable name="basedOnStyleName">
            <xsl:choose>
                <xsl:when test="starts-with($basedOn,'ParagraphStyle/')">
                    <xsl:value-of select="replace($basedOn,'ParagraphStyle/','')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$basedOn"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        
        <xsl:variable name="BulletsAndNumberingListType">
            <xsl:if test="$isBulletsAndNumberingListType">
                <xsl:choose>
                    <xsl:when test="not($BulletsAndNumberingListType ='')">
                        <xsl:value-of select="$BulletsAndNumberingListType"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="@BulletsAndNumberingListType">
                            <xsl:value-of select="concat('BulletsAndNumberingListType=',@BulletsAndNumberingListType)"/>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
        </xsl:variable>     
        <xsl:variable name="NumberingLvl">
            <xsl:if test="$isNumberingLevel">
                <xsl:choose>
                    <xsl:when test="not($NumberingLevel ='')">
                        <xsl:value-of select="$NumberingLevel"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="@NumberingLevel">
                            <xsl:value-of select="concat('NumberingLevel=',@NumberingLevel)"/>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
        </xsl:variable>
        <xsl:variable name="NumberingStrtAt">
            <xsl:if test="$isNumberingStartAt">
                <xsl:choose>
                    <xsl:when test="not($NumberingStartAt = '')">
                        <xsl:value-of select="$NumberingStartAt"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="@NumberingStartAt">
                            <xsl:value-of select="concat('NumberingStartAt=',@NumberingStartAt)"/>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
        </xsl:variable>
        <xsl:variable name="NumberingCont">
            <xsl:if test="$isNumberingContinue">
                <xsl:choose>
                    <xsl:when test="not($NumberingContinue = '')">
                        <xsl:value-of select="$NumberingContinue"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="@NumberingContinue">
                            <xsl:value-of select="concat('NumberingContinue=',@NumberingContinue)"/>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
        </xsl:variable>
        <xsl:variable name="NumberingAplyRstP">
            <xsl:if test="$isNumberingApplyRestartPolicy">
                <xsl:choose>
                    <xsl:when test="not($NumberingApplyRestartPolicy = '')">
                        <xsl:value-of select="$NumberingApplyRestartPolicy"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="@NumberingApplyRestartPolicy">
                            <xsl:value-of select="concat('NumberingApplyRestartPolicy=',@NumberingApplyRestartPolicy)"/>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
        </xsl:variable>
        <xsl:variable name="BulletsAlign">
            <xsl:if test="$isBulletsAlignment">
                <xsl:choose>
                    <xsl:when test="not($BulletsAlignment = '')">
                        <xsl:value-of select="$BulletsAlignment"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="@BulletsAlignment">
                            <xsl:value-of select="concat('BulletsAlignment=',@BulletsAlignment)"/>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
        </xsl:variable>
        <xsl:variable name="NumberingAlign">
            <xsl:if test="$isNumberingAlignment">
                <xsl:choose>
                    <xsl:when test="not($NumberingAlignment = '')">
                        <xsl:value-of select="$NumberingAlignment"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="@NumberingAlignment">
                            <xsl:value-of select="concat('NumberingAlignment=',@NumberingAlignment)"/>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
        </xsl:variable>
        <xsl:variable name="NumberingExpr">
            <xsl:if test="$isNumberingExpression">
                <xsl:choose>
                    <xsl:when test="not($NumberingExpression = '')">
                        <xsl:value-of select="$NumberingExpression"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="@NumberingExpression">
                            <xsl:value-of select="concat('NumberingExpression=',@NumberingExpression)"/>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
        </xsl:variable>
        <xsl:variable name="BulletsTxtAftr">
            <xsl:if test="$isBulletsTextAfter">
                <xsl:choose>
                    <xsl:when test="not($BulletsTextAfter = '')">
                        <xsl:value-of select="$BulletsTextAfter"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="@BulletsTextAfter">
                            <xsl:value-of select="concat('BulletsTextAfter=',@BulletsTextAfter)"/>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
        </xsl:variable>
        
        <xsl:variable name="property">
            <xsl:if test="not(contains($attribs,$BulletsAndNumberingListType)) and not($BulletsAndNumberingListType ='')">
                <xsl:value-of select="concat(',',$BulletsAndNumberingListType)"/>
            </xsl:if>
            <xsl:if test="not(contains($attribs,$NumberingLvl)) and not($NumberingLvl ='')">
                <xsl:value-of select="concat(',',$NumberingLvl)"/>
            </xsl:if>
            <xsl:if test="not(contains($attribs,$NumberingStrtAt)) and not($NumberingStrtAt ='')">
                <xsl:value-of select="concat(',',$NumberingStrtAt)"/>
            </xsl:if>
            <xsl:if test="not(contains($attribs,$NumberingCont)) and not($NumberingCont='')">
                <xsl:value-of select="concat(',',$NumberingCont)"/>
            </xsl:if>
            <xsl:if test="not(contains($attribs,$NumberingAplyRstP)) and not($NumberingAplyRstP='')">
                <xsl:value-of select="concat(',',$NumberingAplyRstP)"/>
            </xsl:if>
            <xsl:if test="not(contains($attribs,$BulletsAlign)) and not($BulletsAlign='')">
                <xsl:value-of select="concat(',',$BulletsAlign)"/>
            </xsl:if>
            <xsl:if test="not(contains($attribs,$NumberingAlign)) and not($NumberingAlign='')">
                <xsl:value-of select="concat(',',$NumberingAlign)"/>
            </xsl:if>
            <xsl:if test="not(contains($attribs,$NumberingExpr)) and not($NumberingExpr='')">
                <xsl:value-of select="concat(',',$NumberingExpr)"/>
            </xsl:if>
            <xsl:if test="not(contains($attribs,$BulletsTxtAftr)) and not($BulletsTxtAftr='')">
                <xsl:value-of select="concat(',',$BulletsTxtAftr)"/>
            </xsl:if>
            <!--<xsl:value-of select="concat($NumberingLvl,',',$NumberingStrtAt,',',$NumberingCont,',',$NumberingAplyRstP,',',$BulletsAlign,',',$NumberingAlign,',',$NumberingExpr,',',$BulletsTextAfter)"/>-->
        </xsl:variable>
        
        <!--<xsl:if test="not($basedOn)">
            <xsl:value-of select="$property"/>
        </xsl:if>
        <xsl:if test="($basedOn)">-->
        <xsl:value-of select="$property"/>
        <!--</xsl:if>-->
        <xsl:if test="(string-length($NumberingLvl) = 0 or string-length($NumberingStrtAt) = 0 or string-length($NumberingCont) = 0 or string-length($NumberingAplyRstP) = 0 or string-length($BulletsAlign) = 0 or string-length($NumberingAlign) = 0 or string-length($NumberingExpr) = 0 or string-length($BulletsTxtAftr) = 0) and $basedOn">
            <xsl:for-each select="//ParagraphStyle[@Name =$basedOnStyleName]">
                <xsl:call-template name="listAttrib">
                    <xsl:with-param name="NumberingLevel" select="$NumberingLvl"/>
                    <xsl:with-param name="NumberingStartAt" select="$NumberingStrtAt"/>
                    <xsl:with-param name="NumberingContinue" select="$NumberingCont"/>
                    <xsl:with-param name="NumberingApplyRestartPolicy" select="$NumberingAplyRstP"/>
                    <xsl:with-param name="BulletsAlignment" select="$BulletsAlign"/>
                    <xsl:with-param name="NumberingAlignment" select="$NumberingAlign"/>
                    <xsl:with-param name="NumberingExpression" select="$NumberingExpr"/>
                    <xsl:with-param name="BulletsTextAfter" select="$BulletsTxtAftr"/>
                    <xsl:with-param name="BulletsAndNumberingListType" select="$BulletsAndNumberingListType"/>
                    <xsl:with-param name="attribs" select="$property"/>
                    <xsl:with-param name="isNumberingStartAt" select="$isNumberingStartAt"/>
                    <xsl:with-param name="isNumberingLevel" select="$isNumberingLevel"/>
                    <xsl:with-param name="isNumberingContinue" select="$isNumberingContinue"/>
                    <xsl:with-param name="isNumberingApplyRestartPolicy" select="$isNumberingApplyRestartPolicy"/>
                    <xsl:with-param name="isBulletsAlignment" select="$isBulletsAlignment"/>
                    <xsl:with-param name="isNumberingAlignment" select="$isNumberingAlignment"/>
                    <xsl:with-param name="isNumberingExpression" select="$isNumberingExpression"/>
                    <xsl:with-param name="isBulletsTextAfter" select="$isBulletsTextAfter"/>
                    <xsl:with-param name="isBulletsAndNumberingListType" select="$isBulletsAndNumberingListType"/>
                    
                </xsl:call-template>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="Note">
        <xsl:copy>
            <xsl:attribute name="NoteNo">
                <xsl:number level="any"/>
            </xsl:attribute>
            <xsl:apply-templates select="@*|node()"/> 
        </xsl:copy>
    </xsl:template>
    
    <!--<xsl:template match="Rectangle">
        <xsl:copy>
            <xsl:attribute name="Self">
                <xsl:variable name="randno">
                    <!-\-<xsl:call-template name="create-seed"/>-\->
                    <xsl:value-of select="count(preceding::*)"/>
                </xsl:variable>
                <xsl:variable name="nodeCount">
                    <xsl:value-of select="count(//node())"/>
                </xsl:variable>
                <xsl:variable name="count">
                    <xsl:number level="any" />
                </xsl:variable>

                <xsl:value-of select="$randno + $count + $nodeCount"/>
            </xsl:attribute>
            <xsl:apply-templates select="@* except @Self|node()"/>
        </xsl:copy>
    </xsl:template>-->
    
    <xsl:template name="create-seed">
        <xsl:param name="string" select="generate-id()"/>
        <xsl:param name="preliminary-seed" select="10"/>
        <xsl:param name="maximum-value" select="10000000000"/>
        
        <xsl:variable name="name-chars"
            select="':ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz-.0123456789'"
        />
        
        <xsl:choose>
            <xsl:when test="string-length($string) != 0">
                <xsl:call-template name="create-seed">
                    <xsl:with-param name="string" select="substring($string,2)"/>
                    <xsl:with-param name="preliminary-seed"
                        select="($preliminary-seed + string-length(
                        
                        substring-before($name-chars,substring($string,1,1))
                        )
                        ) mod $maximum-value"/>
                    <xsl:with-param name="maximum-value" select="$maximum-value"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$preliminary-seed"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
<!--    <xsl:template match="HyperlinkTextSource">
        <xsl:variable name="self" select="self::HyperlinkTextSource/@Self"/>
        <xsl:variable name="HUD">
            <xsl:variable name="DUK">
            <xsl:for-each select="$DM//Hyperlink">
                <xsl:if test="./@Source = $self">
                    <xsl:value-of select="./@DestinationUniqueKey"></xsl:value-of>
                </xsl:if>
            </xsl:for-each>
            </xsl:variable>
            <xsl:for-each select="$DM//HyperlinkURLDestination">
                <xsl:if test="./@DestinationUniqueKey = $DUK">
                    <xsl:value-of select="./@DestinationURL"></xsl:value-of>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>
        <xsl:copy>
            <xsl:attribute name="HyperlinkUDestination" select="$HUD"/>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>-->
    
<!--    <xsl:template match="ParagraphStyleRange">
        <xsl:copy>
            <xsl:attribute name="ParaNumber" select="descendant::HyperlinkTextSource/@HyperlinkUDestination"/>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>-->

        
</xsl:stylesheet>