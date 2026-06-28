<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math"
    xmlns:idPkg="http://ns.adobe.com/AdobeInDesign/idml/1.0/packaging"
    xmlns:v="urn:schemas-microsoft-com:vml"
    xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing"
    xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing"
    xmlns:w10="urn:schemas-microsoft-com:office:word"
    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml"
    xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas"
    xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup"
    xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
    xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk"
    xmlns:o="urn:schemas-microsoft-com:office:office"
    xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml"
    xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"
    xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape"
    exclude-result-prefixes="xs"
    version="2.0">

<!--    <xsl:variable name="StoryMap" select="document('StoryCleanedmap.xml')"/>-->
    
    <xsl:variable name="Stories">
       <!-- <xsl:for-each select="$StoryMap//STORIES//STORY">
            <xsl:copy-of select="document(.)"/>
        </xsl:for-each>-->
        <xsl:copy-of select="document('Inp.xml')"/>
    </xsl:variable>
    
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="CharacterStyle">
        <xsl:variable name="csn" select="@Name"/>
        <xsl:variable name="Na">
            <xsl:choose>
                <xsl:when test="contains($csn,'$ID/')">
                    <xsl:value-of select="substring-after($csn,'$ID/')"/>
                </xsl:when>
                <xsl:when test="contains($csn,'CharacterStyle/')">
                    <xsl:value-of select="substring-after($csn,'CharacterStyle/')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$csn"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="csnStyleID">
            <xsl:value-of select="replace($Na,'[\W\s]','')"/>
            <xsl:number level="any"/>
        </xsl:variable>
        <xsl:copy>
        <xsl:for-each select="//RootParagraphStyleGroup/ParagraphStyle/@Name">
            <xsl:choose>
                <xsl:when test="$csn eq .">
                    <xsl:attribute name="PCLink" select="'PCLink'"/>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
            <xsl:if test="matches($Na,'[\W\s]')">
                <xsl:attribute name="cStyleID" select="$csnStyleID"/>
            </xsl:if>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
        
    
    <xsl:template match="ParagraphStyle">
        <xsl:variable name="basedOn" select="child::Properties/BasedOn"/>
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
        <xsl:variable name="BasedonNumberingRestart">
            <xsl:for-each select="$Stories//ParagraphStyleRange[@AppliedParagraphStyle = $ParaStyle]">
                <xsl:if test="./@NumberingContinue = 'false'">
                    <xsl:if test="$BasedonBulletsAndNumberingListType = 'true'">
                        <xsl:value-of select="'true'"/>
                    </xsl:if>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>
        
        <xsl:variable name="psn" select="@Name"/>
        <xsl:variable name="Na1">
            <xsl:choose>
                <xsl:when test="contains($psn,'$ID/')">
                    <xsl:value-of select="substring-after($psn,'$ID/')"/>
                </xsl:when>
                <xsl:when test="contains($psn,'ParagraphStyle/')">
                    <xsl:value-of select="substring-after($psn,'ParagraphStyle/')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$psn"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:variable name="psnStyleID">
            <xsl:value-of select="replace($Na1,'[\W\s]','')"/>
            <xsl:number level="any"/>
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
        


        <xsl:variable name="listAttributes">
            <!--<xsl:variable name="attributes">-->
            
                        <xsl:if test="@BulletsAndNumberingListType or @NumberingContinue ='false' or child::Properties/BulletChar or $BasedonNumberingRestart = 'true' or $BasedOnNumberList ='true'">
<!--            <xsl:if test="(@BulletsAndNumberingListType or @NumberingContinue ='false' or child::Properties/BulletChar or $BasedonNumberingRestart = 'true' or $BasedOnNumberList ='true') and ($isNumbExpression ='true')">-->
                <!--for paragraph styles, those are having NumberingContinue = false also we have to copy the numbering formats--> 
                <xsl:call-template name="listAttrib">
                    <xsl:with-param name="isNumberingStartAt" select="(boolean(@BulletsAndNumberingListType ='NumberedList') or boolean(@NumberingContinue ='false') or $BasedonNumberingRestart = 'true' or $BasedOnNumberList ='true')"/>
                    <xsl:with-param name="isNumberingLevel" select="boolean(@BulletsAndNumberingListType) or (child::Properties/BulletChar) or boolean(@NumberingContinue ='false') or $BasedonNumberingRestart = 'true' or $BasedOnNumberList ='true'"/>
                    <xsl:with-param name="isNumberingContinue" select="(boolean(@BulletsAndNumberingListType ='NumberedList') or boolean(@NumberingContinue ='false') or $BasedonNumberingRestart = 'true' or $BasedOnNumberList ='true')and ($isNumbExpression ='true')"/>
                    <xsl:with-param name="isNumberingApplyRestartPolicy" select="boolean(@BulletsAndNumberingListType ='NumberedList') or boolean(@NumberingContinue ='false') or $BasedonNumberingRestart = 'true' or $BasedOnNumberList ='true'"/>
                    <xsl:with-param name="isBulletsAlignment" select="boolean(@BulletsAndNumberingListType = 'BulletList' or (child::Properties/BulletChar and not(@BulletsAndNumberingListType ='NumberedList' or @BulletsAndNumberingListType ='NoList')))"/>
                    <xsl:with-param name="isNumberingAlignment" select="boolean(@BulletsAndNumberingListType ='NumberedList') or boolean(@NumberingContinue ='false') or $BasedonNumberingRestart = 'true' or $BasedOnNumberList ='true'"/>
                    <xsl:with-param name="isNumberingExpression" select="(boolean(@BulletsAndNumberingListType ='NumberedList') or boolean(@NumberingContinue ='false') or $BasedonNumberingRestart = 'true' or $BasedOnNumberList ='true')and ($isNumbExpression ='true')"/>
                    <xsl:with-param name="isBulletsTextAfter" select="boolean(@BulletsAndNumberingListType = 'BulletList') or (child::Properties/BulletChar and not(@BulletsAndNumberingListType ='NumberedList' or @BulletsAndNumberingListType ='NoList'))"/>
                    <xsl:with-param name="isBulletsAndNumberingListType" select="not(@BulletsAndNumberingListType) and child::Properties/BulletChar"></xsl:with-param>
                </xsl:call-template>
            </xsl:if>
        </xsl:variable>
        
        <xsl:variable name="fontAttribs">
            <xsl:call-template name="fontAttribs">
                <xsl:with-param name="isFontStyle" select="not(boolean(@FontStyle))"/>
            </xsl:call-template>
        </xsl:variable>
        
        <xsl:copy>
            <xsl:for-each select="//RootCharacterStyleGroup/CharacterStyle/@Name">
                <xsl:choose>
                    <xsl:when test="$psn eq .">
                        <xsl:attribute name="PCLink" select="'PCLink'"/>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:if test="matches($Na1,'[\W\s]')">
                <xsl:attribute name="pStyleID" select="$psnStyleID"/>
            </xsl:if>

            <!--adding the list attributes from the based on style-->
            
            <xsl:if test="$listAttributes">
                <xsl:for-each select="tokenize($listAttributes,',')">
                    <xsl:variable name="attribName" select="tokenize(.,'=')[1]"/>
                    <xsl:variable name="attribValue" select="substring-after(.,concat($attribName,'='))"/>
                    <xsl:if test="not(string-length($attribName) = 0) and not(string-length($attribValue) = 0)">
                        <xsl:attribute name="{$attribName}" select="$attribValue"/>
                    </xsl:if>
                </xsl:for-each>
                <xsl:if test="(@NumberingContinue ='false' and not(@BulletsAndNumberingListType)) or ($BasedonNumberingRestart = 'true' and not(@BulletsAndNumberingListType)) or ($BasedOnNumberList ='true')">
                    <xsl:attribute name="BulletsAndNumberingListType" select="'NumberedList'"/>
                </xsl:if>
            </xsl:if>
            <xsl:if test="$fontAttribs">
                <xsl:for-each select="tokenize($fontAttribs,',')">
                    <xsl:variable name="attribName" select="tokenize(.,'=')[1]"/>
                    <xsl:variable name="attribValue" select="substring-after(.,concat($attribName,'='))"/>
                    <xsl:if test="not(string-length($attribName) = 0) and not(string-length($attribValue) = 0)">
                        <xsl:attribute name="{$attribName}" select="$attribValue"/>
                    </xsl:if>
                </xsl:for-each>
            </xsl:if>
            <xsl:if test="($BasedonNumberingRestart = 'true' and not(@BulletsAndNumberingListType)) or ($BasedOnNumberList ='true')">
                <xsl:attribute name="ManualNumberRestart" select="'true'"/>
            </xsl:if>
            <!--adding the list attributes from the based on style-->
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    
    <!--removing the numbering attributes if numberingexpression is null-->
    <xsl:template match="ParagraphStyle[@NumberingExpression and string-length(@NumberingExpression) =0]/@NumberingStartAt"/>
    <!--<xsl:template match="ParagraphStyle[@NumberingExpression and string-length(@NumberingExpression) =0]/@NumberingLevel"/>-->
    <!--<xsl:template match="ParagraphStyle[@NumberingExpression and string-length(@NumberingExpression) =0]/@NumberingContinue"/>-->
    <!--<xsl:template match="ParagraphStyle[@NumberingExpression and string-length(@NumberingExpression) =0]/@NumberingExpression"/>-->
    <xsl:template match="ParagraphStyle[@NumberingExpression and (string-length(@NumberingExpression) =0) and (@BulletsAndNumberingListType  = 'NumberedList')]/@BulletsAndNumberingListType"/>
    <!--removing the numbering attributes if numberingexpression is null-->

    <xsl:template match="ParagraphStyle/Properties">
        <xsl:variable name="BasedonBulletsAndNumberingListType">
            <xsl:if test="not(parent::ParagraphStyle/@BulletsAndNumberingListType) and not(parent::ParagraphStyle/@NumberingContinue ='false')">
                <xsl:value-of select="'true'"/>
            </xsl:if>
        </xsl:variable>
        <xsl:variable name="basedOn" select="descendant::BasedOn"/>
        <xsl:variable name="BasedOnNumberList">
            <xsl:if test="$BasedonBulletsAndNumberingListType = 'true'">
                <xsl:for-each select="//ParagraphStyle[@Self =$basedOn]">
                    <xsl:if test="(@BulletsAndNumberingListType ='NumberedList') or (@NumberingContinue ='false')">
                        <xsl:value-of select="'true'"/>
                    </xsl:if>
                </xsl:for-each>
            </xsl:if>
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
        <xsl:variable name="ParaStyle">
            <xsl:value-of select="parent::ParagraphStyle/@Self"/>
        </xsl:variable>
        <xsl:variable name="BasedonNumberingRestart">
            <xsl:for-each select="$Stories//ParagraphStyleRange[@AppliedParagraphStyle = $ParaStyle]">
                <xsl:if test="./@NumberingContinue = 'false'">
                    <xsl:if test="$BasedonBulletsAndNumberingListType = 'true'">
                        <xsl:value-of select="'true'"/>
                    </xsl:if>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>
        
        
        <xsl:variable name="Nested">
            <xsl:value-of select="boolean(child::AllNestedStyles)"/>
        </xsl:variable>
        
        
        <xsl:variable name="BullChar">
            <xsl:if test="parent::ParagraphStyle[@BulletsAndNumberingListType = 'BulletList'] or child::BulletsFont">
                <xsl:value-of select="(boolean(child::BulletChar))"/>
            </xsl:if>
        </xsl:variable>
        <xsl:variable name="BullFont">
            <xsl:if test="parent::ParagraphStyle[@BulletsAndNumberingListType = 'BulletList'] or child::BulletsFont">
                <xsl:value-of select="(boolean(child::BulletsFont))"/>
            </xsl:if>
        </xsl:variable>
        <xsl:variable name="BullFontStyle">
            <xsl:if test="parent::ParagraphStyle[@BulletsAndNumberingListType = 'BulletList'] or child::BulletsFont">
                <xsl:value-of select="(boolean(child::BulletsFontStyle))"/>
            </xsl:if>
        </xsl:variable>
        <xsl:variable name="BullCharStyle">
            <xsl:if test="parent::ParagraphStyle[@BulletsAndNumberingListType = 'BulletList'] or child::BulletsFont">
                <xsl:value-of select="(boolean(child::BulletsCharacterStyle))"/>
            </xsl:if>
        </xsl:variable>
        <xsl:variable name="NumFmat">
            <xsl:if test="parent::ParagraphStyle[@BulletsAndNumberingListType = 'NumberedList' or @NumberingContinue ='false'  or $BasedonNumberingRestart = 'true' or $BasedOnNumberList ='true']">
                <xsl:value-of select="(boolean(child::NumberingFormat))"/>
            </xsl:if>
        </xsl:variable>
        <xsl:variable name="AppliedNumList">
            <xsl:if test="parent::ParagraphStyle[@BulletsAndNumberingListType = 'NumberedList' or @NumberingContinue ='false' or $BasedonNumberingRestart = 'true' or $BasedOnNumberList ='true']">
                <xsl:value-of select="(boolean(child::AppliedNumberingList))"/>
            </xsl:if>
        </xsl:variable>
        <xsl:variable name="NumbRstP">
            <xsl:if test="parent::ParagraphStyle[@BulletsAndNumberingListType = 'NumberedList' or @NumberingContinue ='false' or $BasedonNumberingRestart = 'true' or $BasedOnNumberList ='true']">
                <xsl:value-of select="(boolean(child::NumberingRestartPolicies))"/>
            </xsl:if>
        </xsl:variable>
        <xsl:variable name="NumCharStyle">
            <xsl:if test="parent::ParagraphStyle[@BulletsAndNumberingListType = 'NumberedList' or @NumberingContinue ='false' or $BasedonNumberingRestart = 'true' or $BasedOnNumberList ='true']">
                <xsl:value-of select="(boolean(child::NumberingCharacterStyle))"/>
            </xsl:if>
        </xsl:variable>
        
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
            <!-- newly added condition, the list properties should be copied from the basedon style by satisifying one of these characterstics            -->
            <xsl:if test="@BulletsAndNumberingListType or @NumberingContinue ='false' or child::Properties/BulletChar or $BasedonNumberingRestart = 'true' or $BasedOnNumberList ='true'">
            <xsl:call-template name="listProps">
                <xsl:with-param name="isBulletChar" select="$BullChar"/>
                <xsl:with-param name="isNumberingFormat" select="$NumFmat"/>
                <xsl:with-param name="isBulletsFont" select="$BullFont"/>
                <xsl:with-param name="isBulletsFontStyle" select="$BullFontStyle"/>
                <xsl:with-param name="isBulletsCharacterStyle" select="$BullCharStyle"/>
                <xsl:with-param name="isAppliedNumberingList" select="$AppliedNumList"/>
                <xsl:with-param name="isNumberingRestartPolicies" select="$NumbRstP"/>
                <xsl:with-param name="isNumberingCharacterStyle" select="$NumCharStyle"/>
            </xsl:call-template>
            </xsl:if>
            <xsl:if test="$Nested ='false'">
                <xsl:call-template name="nestedProps">
                    <xsl:with-param name="isNested" select="$Nested"/>
                </xsl:call-template>
            </xsl:if>
        </xsl:copy>
    </xsl:template>
      <!-- getting the list properties from self or based on style   -->
        
    <!-- Function for looping -->
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
        <xsl:param name="FontStyle"/>
        <xsl:param name="isNumberingStartAt"/>
        <xsl:param name="isNumberingLevel"/>
        <xsl:param name="isNumberingContinue"/>
        <xsl:param name="isNumberingApplyRestartPolicy"/>
        <xsl:param name="isBulletsAlignment"/>
        <xsl:param name="isNumberingAlignment"/>
        <xsl:param name="isNumberingExpression"/>
        <xsl:param name="isBulletsTextAfter"/>
        <xsl:param name="isBulletsAndNumberingListType"/>
        <xsl:param name="isFontStyle"/>
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
        
        <xsl:variable name="FontStyle">
            <xsl:if test="$isFontStyle">
                <xsl:choose>
                    <xsl:when test="not($FontStyle ='')">
                        <xsl:value-of select="$FontStyle"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="@FontStyle">
                            <xsl:value-of select="concat('FontStyle=',@FontStyle)"/>
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
        <!-- based on font information       -->
       
    <!-- based on font information       -->
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
    
    
    <xsl:template  name="nestedProps">
        <xsl:param name="isNested"/>
        <xsl:variable name="basedOn" select="child::BasedOn"/>
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
        
        <xsl:variable name="Nested">
            <xsl:if test="$isNested = 'false'">
                <xsl:if test="child::AllNestedStyles">
                    <xsl:copy-of select="child::AllNestedStyles"/>
                </xsl:if>
            </xsl:if>
        </xsl:variable>
        <xsl:variable name="isNested">
            <xsl:choose>
                <xsl:when test="$isNested ='false' and child::AllNestedStyles">
                    <xsl:value-of select="'true'"/>
                </xsl:when>
                <xsl:when test="$isNested ='false' and not(child::AllNestedStyles)">
                    <xsl:value-of select="'false'"/>
                </xsl:when>
                <xsl:when test="$isNested ='true'">
                    <xsl:value-of select="$isNested"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="property">
            <xsl:copy-of select="$Nested"/>
        </xsl:variable>
        
        <xsl:copy-of select="$property"/>
        
        
        <xsl:if test="($isNested ='false') and $basedOn">
            <xsl:for-each select="//ParagraphStyle[@Name =$basedOnStyleName]/Properties">
                <xsl:call-template name="nestedProps">
                    <xsl:with-param name="isNested" select="$isNested"/>
                </xsl:call-template>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>
    
    
    <xsl:template  name="fontAttribs">
        <xsl:param name="FontStyle"/>
        <xsl:param name="isFontStyle"/>
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
        
        <xsl:variable name="FontStyle">
            <xsl:if test="($isFontStyle)">
                <xsl:choose>
                    <xsl:when test="not($FontStyle ='')">
                        <xsl:value-of select="$FontStyle"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="@FontStyle">
                            <xsl:value-of select="concat('FontStyle=',@FontStyle)"/>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
        </xsl:variable>
        
        <xsl:variable name="property">
            <xsl:if test="not(contains($attribs,$FontStyle)) and not($FontStyle ='')">
                <xsl:value-of select="concat(',',$FontStyle)"/>
            </xsl:if>
        </xsl:variable>
        
        <xsl:value-of select="$property"/>
        
        <!-- based on font information       -->
<!--        <xsl:if test="(string-length($FontStyle) = 0  and $isFontStyle) and $basedOn">-->
            <xsl:if test=" $basedOn">
            <xsl:for-each select="//ParagraphStyle[@Name =$basedOnStyleName]">
                <xsl:for-each select="//ParagraphStyle[@Name =$basedOnStyleName]">
                    <xsl:call-template name="listAttrib">
                        <xsl:with-param name="attribs" select="$property"/>
                        <xsl:with-param name="isFontStyle" select="$isFontStyle"/>
                        <xsl:with-param name="FontStyle" select="$FontStyle"/>
                    </xsl:call-template>
                </xsl:for-each>
            </xsl:for-each>
        </xsl:if>
        <!-- based on font information       -->
        
    </xsl:template>
    
    
    <xsl:template  name="listProps">
        <xsl:param name="isBulletChar"/>
        <xsl:param name="isNumberingFormat"/>
        <xsl:param name="isBulletsFont"/>
        <xsl:param name="isBulletsFontStyle"/>
        <xsl:param name="isAppliedNumberingList"/>
        <xsl:param name="isNumberingRestartPolicies"/>
        <xsl:param name="isBulletsCharacterStyle"/>
        <xsl:param name="isNumberingCharacterStyle"/>
        <xsl:param name="attribs"/> 
        <xsl:variable name="basedOn" select="child::BasedOn"/>
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

        <xsl:variable name="BullChar">
            <xsl:if test="$isBulletChar = 'false'">
                <xsl:if test="child::BulletChar">
                    <xsl:text disable-output-escaping="yes">&lt;BulletChar</xsl:text>
                    <xsl:for-each select="BulletChar/@*">
                        <xsl:value-of select="concat(' ',name(.),'=&quot;',.,'&quot;')"/>
                    </xsl:for-each>
                    <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                    <xsl:apply-templates select="child::BulletChar"/>
                    <xsl:text disable-output-escaping="yes">&lt;/BulletChar&gt;</xsl:text>
                </xsl:if>
            </xsl:if>
        </xsl:variable>
        <xsl:variable name="isBullChar">
            <xsl:choose>
                <xsl:when test="$isBulletChar ='false' and child::BulletChar">
                    <xsl:value-of select="'true'"/>
                </xsl:when>
                <xsl:when test="$isBulletChar ='false' and not(child::BulletChar)">
                    <xsl:value-of select="'false'"/>
                </xsl:when>
                <xsl:when test="$isBulletChar ='true'">
                    <xsl:value-of select="$isBulletChar"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="NumFmat">
            <xsl:if test="$isNumberingFormat = 'false'">
                <xsl:if test="child::NumberingFormat">
                    <xsl:text disable-output-escaping="yes">&lt;NumberingFormat</xsl:text>
                    <xsl:for-each select="NumberingFormat/@*">
                        <xsl:value-of select="concat(' ',name(.),'=&quot;',.,'&quot;')"/>
                    </xsl:for-each>
                    <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                    <xsl:apply-templates select="child::NumberingFormat"/>
                    <xsl:text disable-output-escaping="yes">&lt;/NumberingFormat&gt;</xsl:text>
                </xsl:if>
            </xsl:if>
        </xsl:variable>
        <xsl:variable name="isNumFmat">
            <xsl:choose>
                <xsl:when test="$isNumberingFormat ='false' and child::NumberingFormat">
                    <xsl:value-of select="'true'"/>
                </xsl:when>
                <xsl:when test="$isNumberingFormat ='false' and not(child::NumberingFormat)">
                    <xsl:value-of select="'false'"/>
                </xsl:when>
                <xsl:when test="$isNumberingFormat ='true'">
                    <xsl:value-of select="$isNumberingFormat"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="BullFont">
            <xsl:if test="$isBulletsFont = 'false'">
                <xsl:if test="child::BulletsFont">
                    <xsl:text disable-output-escaping="yes">&lt;BulletsFont</xsl:text>
                    <xsl:for-each select="BulletsFont/@*">
                        <xsl:value-of select="concat(' ',name(.),'=&quot;',.,'&quot;')"/>
                    </xsl:for-each>
                    <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                    <xsl:apply-templates select="child::BulletsFont"/>
                    <xsl:text disable-output-escaping="yes">&lt;/BulletsFont&gt;</xsl:text>
                </xsl:if>
            </xsl:if>
        </xsl:variable>
        <xsl:variable name="isBullFont">
            <xsl:choose>
                <xsl:when test="$isBulletsFont ='false' and child::BulletsFont">
                    <xsl:value-of select="'true'"/>
                </xsl:when>
                <xsl:when test="$isBulletsFont ='false' and not(child::BulletsFont)">
                    <xsl:value-of select="'false'"/>
                </xsl:when>
                <xsl:when test="$isBulletsFont ='true'">
                    <xsl:value-of select="$isBulletsFont"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="BullFontStyle">
            <xsl:if test="$isBulletsFontStyle = 'false'">
                <xsl:if test="child::BulletsFontStyle">
                    <xsl:text disable-output-escaping="yes">&lt;BulletsFontStyle</xsl:text>
                    <xsl:for-each select="BulletsFontStyle/@*">
                        <xsl:value-of select="concat(' ',name(.),'=&quot;',.,'&quot;')"/>
                    </xsl:for-each>
                    <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                    <xsl:apply-templates select="child::BulletsFontStyle"/>
                    <xsl:text disable-output-escaping="yes">&lt;/BulletsFontStyle&gt;</xsl:text>
                </xsl:if>
            </xsl:if>
        </xsl:variable>
        <xsl:variable name="isBullFontStyle">
            <xsl:choose>
                <xsl:when test="$isBulletsFontStyle ='false' and child::BulletsFontStyle">
                    <xsl:value-of select="'true'"/>
                </xsl:when>
                <xsl:when test="$isBulletsFontStyle ='false' and not(child::BulletsFontStyle)">
                    <xsl:value-of select="'false'"/>
                </xsl:when>
                <xsl:when test="$isBulletsFontStyle ='true'">
                    <xsl:value-of select="$isBulletsFontStyle"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="BullCharStyle">
            <xsl:if test="$isBulletsCharacterStyle = 'false'">
                <xsl:if test="child::BulletsCharacterStyle">
                    <xsl:text disable-output-escaping="yes">&lt;BulletsCharacterStyle</xsl:text>
                    <xsl:for-each select="BulletsCharacterStyle/@*">
                        <xsl:value-of select="concat(' ',name(.),'=&quot;',.,'&quot;')"/>
                    </xsl:for-each>
                    <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                    <xsl:apply-templates select="child::BulletsCharacterStyle"/>
                    <xsl:text disable-output-escaping="yes">&lt;/BulletsCharacterStyle&gt;</xsl:text>
                </xsl:if>
            </xsl:if>
        </xsl:variable>
        <xsl:variable name="isBullCharStyle">
            <xsl:choose>
                <xsl:when test="$isBulletsCharacterStyle ='false' and child::BulletsCharacterStyle">
                    <xsl:value-of select="'true'"/>
                </xsl:when>
                <xsl:when test="$isBulletsCharacterStyle ='false' and not(child::BulletsCharacterStyle)">
                    <xsl:value-of select="'false'"/>
                </xsl:when>
                <xsl:when test="$isBulletsCharacterStyle ='true'">
                    <xsl:value-of select="$isBulletsCharacterStyle"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="AppliedNumList">
            <xsl:if test="$isAppliedNumberingList = 'false'">
                <xsl:if test="child::AppliedNumberingList">
                    <xsl:text disable-output-escaping="yes">&lt;AppliedNumberingList</xsl:text>
                    <xsl:for-each select="AppliedNumberingList/@*">
                        <xsl:value-of select="concat(' ',name(.),'=&quot;',.,'&quot;')"/>
                    </xsl:for-each>
                    <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                    <xsl:apply-templates select="child::AppliedNumberingList"/>
                    <xsl:text disable-output-escaping="yes">&lt;/AppliedNumberingList&gt;</xsl:text>
                </xsl:if>
            </xsl:if>
        </xsl:variable>
        <xsl:variable name="isAppliedNumList">
            <xsl:choose>
                <xsl:when test="$isAppliedNumberingList ='false' and child::AppliedNumberingList">
                    <xsl:value-of select="'true'"/>
                </xsl:when>
                <xsl:when test="$isAppliedNumberingList ='false' and not(child::AppliedNumberingList)">
                    <xsl:value-of select="'false'"/>
                </xsl:when>
                <xsl:when test="$isAppliedNumberingList ='true'">
                    <xsl:value-of select="$isAppliedNumberingList"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="NumbRstP">
            <xsl:if test="$isNumberingRestartPolicies = 'false'">
                <xsl:if test="child::NumberingRestartPolicies">
                    <xsl:text disable-output-escaping="yes">&lt;NumberingRestartPolicies</xsl:text>
                    <xsl:for-each select="NumberingRestartPolicies/@*">
                        <xsl:value-of select="concat(' ',name(.),'=&quot;',.,'&quot;')"/>
                    </xsl:for-each>
                    <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                    <xsl:apply-templates select="child::NumberingRestartPolicies"/>
                    <xsl:text disable-output-escaping="yes">&lt;/NumberingRestartPolicies&gt;</xsl:text>
                </xsl:if>
            </xsl:if>
        </xsl:variable>
        <xsl:variable name="isNumbRstP">
            <xsl:choose>
                <xsl:when test="$isNumberingRestartPolicies ='false' and child::NumberingRestartPolicies">
                    <xsl:value-of select="'true'"/>
                </xsl:when>
                <xsl:when test="$isNumberingRestartPolicies ='false' and not(child::NumberingRestartPolicies)">
                    <xsl:value-of select="'false'"/>
                </xsl:when>
                <xsl:when test="$isNumberingRestartPolicies ='true'">
                    <xsl:value-of select="$isNumberingRestartPolicies"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="NumCharStyle">
            <xsl:if test="$isNumberingCharacterStyle = 'false'">
                <xsl:if test="child::NumberingCharacterStyle">
                    <xsl:text disable-output-escaping="yes">&lt;NumberingCharacterStyle</xsl:text>
                    <xsl:for-each select="NumberingCharacterStyle/@*">
                        <xsl:value-of select="concat(' ',name(.),'=&quot;',.,'&quot;')"/>
                    </xsl:for-each>
                    <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                    <xsl:apply-templates select="child::NumberingCharacterStyle"/>
                    <xsl:text disable-output-escaping="yes">&lt;/NumberingCharacterStyle&gt;</xsl:text>
                </xsl:if>
            </xsl:if>
        </xsl:variable>
        <xsl:variable name="isNumCharStyle">
            <xsl:choose>
                <xsl:when test="$isNumberingCharacterStyle ='false' and child::NumberingCharacterStyle">
                    <xsl:value-of select="'true'"/>
                </xsl:when>
                <xsl:when test="$isNumberingCharacterStyle ='false' and not(child::NumberingCharacterStyle)">
                    <xsl:value-of select="'false'"/>
                </xsl:when>
                <xsl:when test="$isNumberingCharacterStyle ='true'">
                    <xsl:value-of select="$isNumberingCharacterStyle"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="property">
            <xsl:value-of select="$BullChar" disable-output-escaping="yes"/>
            <xsl:value-of select="$NumFmat" disable-output-escaping="yes"/>
            <xsl:value-of select="$BullFont" disable-output-escaping="yes"/>
            <xsl:value-of select="$BullFontStyle" disable-output-escaping="yes"/>
            <xsl:value-of select="$BullCharStyle" disable-output-escaping="yes"/>
            <xsl:value-of select="$AppliedNumList" disable-output-escaping="yes"/>
            <xsl:value-of select="$NumbRstP" disable-output-escaping="yes"/>
            <xsl:value-of select="$NumCharStyle" disable-output-escaping="yes"/>
        </xsl:variable>
        
       <xsl:value-of select="$property" disable-output-escaping="yes"/>
        
        
        <xsl:if test="($isBullChar ='false' or $isNumFmat ='false' or $isBulletsFont ='false') and $basedOn">
            <xsl:for-each select="//ParagraphStyle[@Name =$basedOnStyleName]/Properties">
                <xsl:call-template name="listProps">
                    <xsl:with-param name="isBulletChar" select="$isBullChar"/>
                    <xsl:with-param name="isNumberingFormat" select="$isNumFmat"/>
                    <xsl:with-param name="isBulletsFont" select="$isBullFont"/>
                    <xsl:with-param name="isBulletsFontStyle" select="$isBullFontStyle"/>
                    <xsl:with-param name="isBulletsCharacterStyle" select="$isBullCharStyle"/>
                    <xsl:with-param name="isAppliedNumberingList" select="$isAppliedNumList"/>
                    <xsl:with-param name="isNumberingRestartPolicies" select="$isNumbRstP"/>
                    <xsl:with-param name="isNumberingCharacterStyle" select="$isNumCharStyle"/>
                </xsl:call-template>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>
    <!-- Function for looping -->
    
    <!-- getting the list properties from self or based on style   -->
    
    <xsl:template match="@*">        
        <xsl:choose>
           <xsl:when test="name(.) != 'Name'">
            <xsl:choose>
                <xsl:when test="contains(string(.),'e-')">
                    <xsl:choose>
                        <xsl:when test="name(.) != 'Self'">
                            <xsl:attribute name="{name(.)}">
                                <!--commmented for bookmark and image name isuue for Hidden Scotland on 12-11-2020-->
                                <!--<xsl:value-of select="replace(string(.), 'e-', '0')" />  -->
                                <xsl:value-of select="string(.)"/>
                            </xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:attribute name="{name(.)}">
                                <xsl:value-of select="string(.)"/>
                            </xsl:attribute>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="{name(.)}">
                        <xsl:value-of select="string(.)"/>
                    </xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
           </xsl:when>
            <xsl:otherwise>
                <xsl:attribute name="{name(.)}">
                    <xsl:value-of select="string(.)"/>
                </xsl:attribute>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- commented this apart to get the style as it is. if you want to get the styleid instead uncomment the following template match   -->
    <!--<xsl:template match="AppliedCharacterStyle">
        <xsl:variable name="csn" select="."/>
        <xsl:variable name="Na">
            <xsl:choose>
                <xsl:when test="contains($csn,'$ID/')">
                    <xsl:value-of select="substring-after($csn,'$ID/')"/>
                </xsl:when>
                <xsl:when test="contains($csn,'CharacterStyle/')">
                    <xsl:value-of select="substring-after($csn,'CharacterStyle/')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$csn"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
       
        <xsl:choose>
            <xsl:when test="matches($Na,'[\W\s]')">
                <xsl:variable name="csnStyleID">
                    <xsl:value-of select="replace($Na,'[\W\s]','')"/>
                    <xsl:value-of select="count(//CharacterStyle[@Self = $csn]/preceding-sibling::CharacterStyle) + 1"/>
                </xsl:variable>
                <xsl:copy>
                    <xsl:apply-templates select="@*|node() except text()"/>
                    <xsl:value-of select="$csnStyleID"/>
                </xsl:copy>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>-->
    
</xsl:stylesheet>