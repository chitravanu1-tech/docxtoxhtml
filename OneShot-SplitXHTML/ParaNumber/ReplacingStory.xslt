<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:idPkg="http://ns.adobe.com/AdobeInDesign/idml/1.0/packaging"
    exclude-result-prefixes="xs" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    version="2.0">

    
    <xsl:output method="xml" name="xml" standalone="yes"/>
    <xsl:preserve-space elements="Content"/>
    
    <xsl:variable name="linked" select="document('linked.xml')"/>
    <!--    <xsl:template match="*">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>-->
    
   <!--<xsl:template match="STORIES/STORY">
        <xsl:variable name="M" select="."/>
        <xsl:variable name="filename" select="concat('output/',$M)"/>
        <xsl:result-document href="{$filename}" format="xml">
            <xsl:apply-templates select="document($M)"/> 
        </xsl:result-document>
    </xsl:template>-->
    
    <xsl:template match="idPkg:Story">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/> 
        </xsl:copy>
    </xsl:template>
    
    
 <xsl:template match="*">
      <xsl:copy>
        <xsl:apply-templates select="node()|@*"/>
      </xsl:copy>
  </xsl:template>
    
    <xsl:template match="@*" priority="1.5">    
        <xsl:choose>
            <xsl:when test="not(name(.)='AppliedParagraphStyle')">
                <xsl:if test="not(name(.)='AppliedCharacterStyle')">
        <xsl:choose>
            <xsl:when test="contains(string(.),'\%3a')">
                <xsl:variable name="b" select="'%3a' cast as xs:string"/>
                <xsl:attribute name="{name(.)}">
                    <xsl:value-of select="replace(string(.), $b, ':')" />
                </xsl:attribute>
            </xsl:when>
            <!--changed for bookmark isue on 14-10-2020-->
            <!--<xsl:when test="contains(string(.),'e-')">
                <xsl:attribute name="{name(.)}">
                        <xsl:value-of select="replace(string(.), 'e-', '0')" />                    
                </xsl:attribute>
            </xsl:when>-->
            <xsl:otherwise>
                <xsl:attribute name="{name(.)}">
                    <xsl:value-of select="string(.)"/>
                </xsl:attribute>
            </xsl:otherwise>
        </xsl:choose> 
                </xsl:if>
                <xsl:if test="(name(.)='AppliedCharacterStyle')">
                    <xsl:choose>
                        <xsl:when test="contains(string(.),'\%3a')">
                            <xsl:variable name="b" select="'%3a' cast as xs:string"/>
                            <xsl:attribute name="{name(.)}">
                                <xsl:value-of select="replace(string(.), $b, ':')" />
                            </xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:attribute name="{name(.)}">
                                <xsl:value-of select="string(.)"/>
                            </xsl:attribute>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:if>
            </xsl:when>
            <xsl:when test="(name(.)='AppliedParagraphStyle')">
                <xsl:choose>
                    <xsl:when test="contains(string(.),'\%3a')">
                        <xsl:variable name="b" select="'%3a' cast as xs:string"/>
                        <xsl:attribute name="{name(.)}">
                            <xsl:value-of select="replace(string(.), $b, ':')" />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:attribute name="{name(.)}">
                            <xsl:value-of select="string(.)"/>
                        </xsl:attribute>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    
    <xsl:template match="CharacterStyleRange">
        
        <xsl:variable name="Na">
            <xsl:choose>
                <xsl:when test="contains(@AppliedCharacterStyle,'$ID/')">
                    <xsl:value-of select="substring-after(@AppliedCharacterStyle,'$ID/')"/>
                </xsl:when>
                <xsl:when test="contains(@AppliedCharacterStyle,'CharacterStyle/')">
                    <xsl:value-of select="substring-after(@AppliedCharacterStyle,'CharacterStyle/')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="@AppliedCharacterStyle"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
     <xsl:variable name="csn">
         <xsl:choose>
             <xsl:when test="contains($Na,'%3a')">
                 <xsl:variable name="Pf" select="replace($Na,'%3a',':')"/>
                 <xsl:value-of select="tokenize($Pf, '/')[last()]"/>
             </xsl:when>
             <xsl:when test="contains($Na,'\')">
                 <xsl:value-of select="replace($Na,'\\','')"/>
             </xsl:when>
             <xsl:otherwise>
                 <xsl:value-of select="$Na"/>
             </xsl:otherwise>
         </xsl:choose>
     </xsl:variable>
        
        <xsl:copy>
            
            <xsl:for-each select="$linked//CharacterStyle">
                <xsl:choose>
                    <xsl:when test="./@Name eq $csn">
                        <xsl:if test="./@PCLink">
                            <xsl:attribute name="PCLink" select="./@PCLink"/>
                        </xsl:if>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>

      <xsl:template match="TextFrame">
          <xsl:element name="TextFrame">
              <xsl:attribute name="id" select="@Self"/>
              <xsl:attribute name="Story" select="@ParentStory"/>
              <xsl:attribute name="previous" select="@PreviousTextFrame"/>
              <xsl:attribute name="next" select="@NextTextFrame"/>
          </xsl:element>
      </xsl:template>  
        
    <!-- to remove author queries 'S4C_AuthorQuery' and the paraId labled textframe are removed specifically for the SPRINGER   -->
    <!--<xsl:template match="TextFrame[Properties/Label/KeyValuePair/@Value='S4C_AuthorQuery']|TextFrame[Properties/Label/KeyValuePair/@Value='ParaID']"></xsl:template>-->
    <!--<xsl:template match="TextFrame[Properties/Label/KeyValuePair/@Value='S4C_AuthorQuery']|TextFrame[Properties/Label/KeyValuePair/@Value='ParaID']|TextFrame[starts-with(lower-case(@Name),'notes_id')]"></xsl:template>-->

    <xsl:template match="TextFrame[Properties/Label/KeyValuePair/@Value='S4C_AuthorQuery']|TextFrame[Properties/Label/KeyValuePair/@Value='ParaID']"/>
    <!-- Updated on 02-May-18 Author Query on Margin need to Remove -->
    <xsl:template match="TextFrame[starts-with(lower-case(@Name),'notes_id')]">
        <xsl:choose>
            <xsl:when test="TextFrame/@Name = //Note/Properties/KeyValuePair/@Value"></xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!--  -->
    <!--<xsl:template match="TextFrame[Properties/Label/KeyValuePair]">
        <xsl:choose>
            <xsl:when test="TextFrame[Properties/Label/KeyValuePair/@Value='S4C_AuthorQuery']"></xsl:when>
            <xsl:when test="TextFrame[Properties/Label/KeyValuePair/@Value='ParaID']"></xsl:when>
            <xsl:when test="contains(TextFrame[Properties/Label/KeyValuePair/@Value],'Notes_id')"></xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>-->
    <xsl:template match="TextFrame[Properties/Label/KeyValuePair/@Value='PasteboardItems']"></xsl:template>
    
    <!-- the following removal of textframe is only for the purpose of 22.6.2017 demo    -->
<!--    <xsl:template match="TextFrame[@AppliedObjectStyle='ObjectStyle/Object_H2_arrow']"/>-->
        
        <xsl:template match="Table">
            <xsl:copy>
                <xsl:apply-templates select="@*|node()"/>
            </xsl:copy>

        </xsl:template>
    
    <xsl:template match="Cell">
        <xsl:variable name="RS" select="@RowSpan"/>
        <xsl:variable name="RS1" select="($RS - 1)"/>
        <xsl:variable name="NA" select="number(substring-after(@Name,':'))"/>
        <xsl:variable name="NB" select="number(substring-before(@Name,':'))"/>
        <xsl:copy>
            <xsl:attribute name="RowName" select="$NA"/>
            <xsl:attribute name="ColumnName" select="$NB"/>
            
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
        <xsl:choose>
            <xsl:when test="$RS &gt; 1">
                <xsl:call-template name="for">
                    <xsl:with-param name="i" select="1"/>
                    <xsl:with-param name="j" select="$NA + 1"/>
                    <xsl:with-param name="k" select="$NB"/>
                    <xsl:with-param name="l" select="@ColumnSpan"/>
                    <xsl:with-param name="m" select="@AppliedCellStyle"/>
                    <xsl:with-param name="n" select="@AppliedCellStylePriority"/>
                    <xsl:with-param name="to" select="$RS1"/>
                    <xsl:with-param name="step" select="1"/>
                </xsl:call-template>
              
            </xsl:when> 
        </xsl:choose>

    </xsl:template>
    
    <xsl:template match="ParagraphStyleRange">
        <xsl:variable name="appliedParaStyle" select="@AppliedParagraphStyle"/>
        <xsl:variable name="precedingParaStyle" select="preceding::ParagraphStyleRange[1]/@AppliedParagraphStyle"/>
        <xsl:variable name="precedingParaChar" select="preceding::ParagraphStyleRange[1]/@character"/>
       <!-- <xsl:variable name="precedingPara">
            <xsl:call-template name="numLvl">
                <xsl:with-param name="appliedParaStyle" select="$precedingParaStyle"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="curPara">
            <xsl:call-template name="numLvl">
                <xsl:with-param name="appliedParaStyle" select="@AppliedParagraphStyle"/>
            </xsl:call-template>
        </xsl:variable>
        -->
        <xsl:variable name="preParaNumLvl">
           <!-- <xsl:for-each select="tokenize($precedingPara,',')">
                <xsl:if test="contains(.,'NumberingLevel')">
                    <xsl:variable name="numattribName" select="tokenize(.,'=')[1]"/>
                    <xsl:variable name="numattribValue" select="substring-after(.,concat($numattribName,'='))"/>
                    <!-\-<xsl:if test="not(string-length($numattribName) = 0) and not(string-length($numattribValue) = 0)">
                        <xsl:attribute name="{$numattribName}" select="$numattribValue"/>
                    </xsl:if>-\->
                    <xsl:value-of select="$numattribValue"/>
                </xsl:if>
            </xsl:for-each>-->
            <xsl:value-of select="preceding::ParagraphStyleRange[1]/@curParaNumLvl"/>
        </xsl:variable>
        
        <xsl:variable name="PreNumberingStartAt" select="preceding::ParagraphStyleRange[1]/@NumberingStartAt"/>
        
        <xsl:variable name="curParaNumLvl">
            <!--<xsl:for-each select="tokenize($curPara,',')">
                <xsl:if test="contains(.,'NumberingLevel')">
                    <xsl:variable name="numattribName" select="tokenize(.,'=')[1]"/>
                    <xsl:variable name="numattribValue" select="substring-after(.,concat($numattribName,'='))"/>
                    <!-\-<xsl:if test="not(string-length($numattribName) = 0) and not(string-length($numattribValue) = 0)">
                        <xsl:attribute name="{$numattribName}" select="$numattribValue"/>
                    </xsl:if>-\->
                    <xsl:value-of select="$numattribValue"/>
                </xsl:if>
            </xsl:for-each>-->
            <xsl:value-of select="@curParaNumLvl"/>
        </xsl:variable>
        
        <xsl:variable name="curBasedon">
            <!--<xsl:for-each select="tokenize($curPara,',')">
                <xsl:if test="contains(.,'basedOn')">
                    <xsl:variable name="numattribName" select="tokenize(.,'=')[1]"/>
                    <xsl:variable name="numattribValue" select="substring-after(.,concat($numattribName,'='))"/>
                    <!-\-<xsl:if test="not(string-length($numattribName) = 0) and not(string-length($numattribValue) = 0)">
                        <xsl:attribute name="{$numattribName}" select="$numattribValue"/>
                    </xsl:if>-\->
                    <xsl:value-of select="$numattribValue"/>
                </xsl:if>
            </xsl:for-each>-->
            <xsl:value-of select="@curBasedon"/>
        </xsl:variable>
        
        <xsl:variable name="iscurParaNumList">
            <!--<xsl:for-each select="tokenize($curPara,',')">
                <xsl:if test="contains(.,'NumberList')">
                    <xsl:variable name="numattribName" select="tokenize(.,'=')[1]"/>
                    <xsl:variable name="numattribValue" select="substring-after(.,concat($numattribName,'='))"/>
                   <!-\- <xsl:if test="not(string-length($numattribName) = 0) and not(string-length($numattribValue) = 0)">
                        <xsl:attribute name="{$numattribName}" select="$numattribValue"/>
                    </xsl:if>-\->
                    <xsl:value-of select="$numattribValue"/>
                </xsl:if>
            </xsl:for-each>-->
            <xsl:value-of select="@iscurParaNumList"/>
        </xsl:variable>
        
        <xsl:variable name="character" select="@character"/>
        
        <xsl:variable name="NumberingContinue" select="@NumberingContinue"/>
        
        <xsl:variable name="ListID">
           <!-- <xsl:number level="any" count="//ParagraphStyleRange"/>-->
            <xsl:value-of select="@paraLID"/>
        </xsl:variable>
        
        <xsl:variable name="ParaStyleCount">
            <!--<xsl:for-each select="tokenize($curPara,',')">
                <xsl:if test="contains(.,'ParaStyleCount')">
                    <xsl:variable name="numattribName" select="tokenize(.,'=')[1]"/>
                    <xsl:variable name="numattribValue" select="substring-after(.,concat($numattribName,'='))"/>
                    <!-\- <xsl:if test="not(string-length($numattribName) = 0) and not(string-length($numattribValue) = 0)">
                        <xsl:attribute name="{$numattribName}" select="$numattribValue"/>
                    </xsl:if>-\->
                    <xsl:value-of select="$numattribValue"/>
                </xsl:if>
            </xsl:for-each>-->
            <xsl:value-of select="@ParaStyleCount"/>
        </xsl:variable>
        <xsl:variable name="precedingListCount">
            <xsl:if test="@iscurParaNumList">
                <xsl:value-of select="count(preceding::ParagraphStyleRange[@curParaNumLvl])"/>
            </xsl:if>
        </xsl:variable>
        
        <xsl:variable name="sameStyle">
            <xsl:choose>
                <xsl:when test="preceding::ParagraphStyleRange[$curParaNumLvl = @curParaNumLvl and $appliedParaStyle =@AppliedParagraphStyle][not(ancestor::Note)][1]/@paraLID">
                    <xsl:value-of select="preceding::ParagraphStyleRange[$curParaNumLvl = @curParaNumLvl and $appliedParaStyle =@AppliedParagraphStyle][not(ancestor::Note)][1]/@paraLID"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="0"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
       
        <xsl:variable name="higherlvl">
            <xsl:variable name="highlvl">
                <xsl:choose>
                    <xsl:when test="preceding::ParagraphStyleRange[$curParaNumLvl &gt; @curParaNumLvl and not(@iscurParaNumList ='NoList')][not(ancestor::Note)][1]/@paraLID">
                        <xsl:value-of select="preceding::ParagraphStyleRange[$curParaNumLvl &gt; @curParaNumLvl and not(@iscurParaNumList ='NoList')][not(ancestor::Note)][1]/@paraLID"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="0"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:variable name="highLvlNumCnFalse">
                <xsl:value-of select="preceding::ParagraphStyleRange[$curParaNumLvl &gt; @curParaNumLvl and (@NumberingContinue ='false')][not(ancestor::Note)][1]/@paraLID"/>
            </xsl:variable>
            <xsl:choose>
                <xsl:when test="number($highLvlNumCnFalse) &gt; number($highlvl)">
                    <xsl:value-of select="number($highLvlNumCnFalse)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number($highlvl)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="sameLvlWitResart">
            <xsl:variable name="sameStyleWithRestart">
                <xsl:value-of select="number(preceding::ParagraphStyleRange[($curParaNumLvl = @curParaNumLvl) and ($appliedParaStyle =@AppliedParagraphStyle) and ($character = @character) and (child::w:numPr)][not(ancestor::Note)][1]/@paraLID)"/>
            </xsl:variable>
            <xsl:variable name="swr">
               <xsl:variable name="swrestart">
                   <xsl:choose>
                       <!--This condition is added to deal with a very rare condition if it causes problem use the below one-->
                       <xsl:when test="preceding::ParagraphStyleRange[($curParaNumLvl = @curParaNumLvl) and not($appliedParaStyle =@AppliedParagraphStyle) and (@NumberingStartAt = 0) and (@NumberingContinue = 'false')][not(ancestor::Note)][1]/@paraLID">
                           <xsl:value-of select="number(preceding::ParagraphStyleRange[($curParaNumLvl = @curParaNumLvl) and not($appliedParaStyle =@AppliedParagraphStyle) and (@NumberingStartAt = 0) and (@NumberingContinue = 'false')][not(ancestor::Note)][1]/@paraLID)"/>
                       </xsl:when>
                       <xsl:when test="preceding::ParagraphStyleRange[($curParaNumLvl = @curParaNumLvl) and not($appliedParaStyle =@AppliedParagraphStyle) and ($character = @character) and (@NumberingContinue = 'false')][not(ancestor::Note)][1]/@paraLID">
                           <xsl:value-of select="number(preceding::ParagraphStyleRange[($curParaNumLvl = @curParaNumLvl) and not($appliedParaStyle =@AppliedParagraphStyle) and ($character = @character) and (@NumberingContinue = 'false')][not(ancestor::Note)][1]/@paraLID)"/>
                       </xsl:when>
                       <xsl:otherwise>
                           <xsl:value-of select="0"/>
                       </xsl:otherwise>
                   </xsl:choose>
               </xsl:variable>
                <xsl:choose>
                    <xsl:when test="number($sameStyleWithRestart) &gt; $swrestart">
                        <xsl:value-of select="number($sameStyleWithRestart)"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="number($swrestart)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>

            <xsl:choose>
                <xsl:when test="($swr = 0) and $NumberingContinue = 'true'">
                    <xsl:choose>
<!--                        <xsl:when test="($sameStyle = 0) and ($higherlvl = 0)">-->
                            <xsl:when test="($sameStyle = 0)">
                            <!--              removing this condition alone     (@NumberingContinue = 'false')         -->
                                <xsl:variable name="preParaRest">
                                    <xsl:value-of select="number(preceding::ParagraphStyleRange[($curParaNumLvl = @curParaNumLvl) and not($appliedParaStyle =@AppliedParagraphStyle) and ($character = @character) and (@iscurParaNumList = 'true')][not(ancestor::Note)][1]/@paraLID)"/>        
                                </xsl:variable>
                                <xsl:variable name="preParaRestStyl">
                                    <xsl:value-of select="(preceding::ParagraphStyleRange[($curParaNumLvl = @curParaNumLvl) and not($appliedParaStyle =@AppliedParagraphStyle) and ($character = @character) and (@iscurParaNumList = 'true')][not(ancestor::Note)][1]/@AppliedParagraphStyle)"/>
                                </xsl:variable>
                                <xsl:choose>
                                    <xsl:when test="$preParaRest ='NaN'">
                                        <xsl:value-of select="0"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <!--<xsl:value-of select="$preParaRest"/>-->
                                        <xsl:choose>
                                            <xsl:when test="(number($ListID) - number($preParaRest)) = 1">
                                                <xsl:call-template name="precedingRestart">
                                                    <xsl:with-param name="precedingParaID" select="$preParaRest"/>
                                                    <xsl:with-param name="curParaNumLvl" select="$curParaNumLvl"/>
                                                    <xsl:with-param name="appliedParaStyle" select="$preParaRestStyl"/>
                                                    <xsl:with-param name="character" select="$character"/>
                                                    <xsl:with-param name="higherlvl" select="$higherlvl"/>
                                                    <xsl:with-param name="sameStyle" select="$sameStyle"/>
                                                    <xsl:with-param name="paraLid" select="$preParaRest"/>
                                                </xsl:call-template>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="number($swr)"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="number($swr)"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number($swr)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <!-- have to check this condition and variable       -->
        <xsl:variable name="NumberingStartAt">
            
           <xsl:variable name="numStAt">
               <xsl:if test="not(child::w:numPr)">
                   <xsl:if test="($iscurParaNumList = 'true')">
                       <xsl:choose>
                           <xsl:when test="($sameLvlWitResart &gt;= $sameStyle) and ($sameLvlWitResart &gt; $higherlvl)">
                               <xsl:variable name="preNumStartAt" select="count(preceding::ParagraphStyleRange[$curParaNumLvl = @curParaNumLvl and $character = @character ][not(ancestor::Note)]) - count(preceding::ParagraphStyleRange[@paraLID = $sameLvlWitResart][not(ancestor::Note)]/preceding::ParagraphStyleRange[$curParaNumLvl = @curParaNumLvl and $character = @character][not(ancestor::Note)])"/>
                               
                               <xsl:value-of select="$preNumStartAt + @NumberingStartAt"/>
                           </xsl:when>
                           <xsl:otherwise>
                               <xsl:if test="not($appliedParaStyle = $precedingParaStyle)">
                                   <xsl:choose>
                                       <xsl:when test="($sameLvlWitResart &gt; $sameStyle) and ($sameLvlWitResart &gt; $higherlvl)">
                                           <!--<xsl:variable name="preNumStartAt" select="count(preceding::ParagraphStyleRange[$curParaNumLvl = @curParaNumLvl and $character = @character ]) - count(preceding::ParagraphStyleRange[($curParaNumLvl = @curParaNumLvl) and ($character = @character) and (@NumberingContinue = 'false')][1]/preceding::ParagraphStyleRange[$curParaNumLvl = @curParaNumLvl and $character = @character])"/>-->
                                           <xsl:variable name="preNumStartAt" select="count(preceding::ParagraphStyleRange[$curParaNumLvl = @curParaNumLvl and $character = @character ][not(ancestor::Note)]) - count(preceding::ParagraphStyleRange[@paraLID = $sameLvlWitResart][not(ancestor::Note)]/preceding::ParagraphStyleRange[$curParaNumLvl = @curParaNumLvl and $character = @character][not(ancestor::Note)])"/>
                                           
                                           <xsl:value-of select="$preNumStartAt + @NumberingStartAt"/>
                                       </xsl:when>
                                       <!--This condition is added to deal with a very rare condition if it causes problem remove the following condition-->
                                       <xsl:when test="($sameStyle &gt; $sameLvlWitResart) and ($sameStyle &gt; $higherlvl)">
                                           <xsl:variable name="preNum" select="count(preceding::ParagraphStyleRange[($curParaNumLvl = @curParaNumLvl) and ($character = @character) and not($appliedParaStyle =@AppliedParagraphStyle)][not(ancestor::Note)]) - count(preceding::ParagraphStyleRange[@paraLID = $sameStyle][not(ancestor::Note)]/preceding::ParagraphStyleRange[($curParaNumLvl = @curParaNumLvl) and ($character = @character) and not($appliedParaStyle =@AppliedParagraphStyle)][not(ancestor::Note)])"/>
                                           <xsl:if test="$preNum &gt; 0">
                                               <xsl:variable name="preNumStartAt" select="count(preceding::ParagraphStyleRange[$curParaNumLvl = @curParaNumLvl and $character = @character ][not(ancestor::Note)]) - count(preceding::ParagraphStyleRange[@paraLID = $sameLvlWitResart][not(ancestor::Note)]/preceding::ParagraphStyleRange[$curParaNumLvl = @curParaNumLvl and $character = @character][not(ancestor::Note)])"/>
                                               
                                               <xsl:value-of select="$preNumStartAt + @NumberingStartAt"/>
                                           </xsl:if>
                                       </xsl:when>
                                       <xsl:otherwise>
                                           <xsl:value-of select="@NumberingStartAt"/>
                                       </xsl:otherwise>
                                   </xsl:choose>
                               </xsl:if>
                           </xsl:otherwise>
                       </xsl:choose>
                       
                   </xsl:if>
               </xsl:if>
           </xsl:variable>

            <xsl:choose>
                <xsl:when test="not(string-length($numStAt) = 0)">
                    <xsl:value-of select="$numStAt"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="0"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="restartVal">
            <xsl:variable name="paranumber" select="@ParaNumber"/>
            <xsl:if test="not(child::w:numPr)">
                <xsl:if test="($iscurParaNumList = 'true')">
                    
                    <xsl:variable name="rsVal">
                        <xsl:if test="not($appliedParaStyle = $precedingParaStyle)">
                            
                            <xsl:choose>
                                <xsl:when test="$precedingListCount = 0">
                                    <xsl:value-of select="'true'"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:choose>
                                        <xsl:when test="($sameStyle = 0) and ($sameLvlWitResart = 0) and ($higherlvl = 0)">
                                            <xsl:value-of select="'true'"/>
                                        </xsl:when>
                                        <xsl:when test="($sameStyle &gt; $sameLvlWitResart) and ($sameStyle &gt; $higherlvl)">
                                            <!--Don't restart at the same style with the same level-->
                                            <!--                                        <xsl:if test="@SelfNumberingStartAt and (not(@SelfNumberingStartAt = 0) and not(@BulletsAndNumberingListType = 'NoList') and not(@NumberingContinue='true'))">-->
                                            <!--This condition is added to deal with a very rare condition if it causes problem remove the following condition with variable preNumStartAt-->
                                            <xsl:variable name="preNumStartAt" select="count(preceding::ParagraphStyleRange[($curParaNumLvl = @curParaNumLvl) and ($character = @character) and not($appliedParaStyle =@AppliedParagraphStyle)][not(ancestor::Note)]) - count(preceding::ParagraphStyleRange[@paraLID = $sameStyle][not(ancestor::Note)]/preceding::ParagraphStyleRange[($curParaNumLvl = @curParaNumLvl) and ($character = @character) and not($appliedParaStyle =@AppliedParagraphStyle)][not(ancestor::Note)])"/>
                                            <xsl:if test="(@SelfNumberingStartAt and (not(@SelfNumberingStartAt = 0) and not(@BulletsAndNumberingListType = 'NoList'))) or ($preNumStartAt &gt; 0)">
                                                <xsl:value-of select="'true'"/>
                                            </xsl:if>
                                        </xsl:when>
                                        <xsl:when test="($sameLvlWitResart &gt; $sameStyle) and ($sameLvlWitResart &gt; $higherlvl)">
                                            <xsl:value-of select="'true'"/>
                                        </xsl:when>
                                        <xsl:when test="($higherlvl &gt; $sameStyle) and ($higherlvl &gt; $sameLvlWitResart)">
                                            <xsl:value-of select="'true'"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                    </xsl:variable>
                    <xsl:choose>
                        <xsl:when test="($sameLvlWitResart &gt;= $sameStyle) and ($sameLvlWitResart &gt; $higherlvl)">
                            <xsl:value-of select="'true'"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$rsVal"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:if>
            </xsl:if>
        </xsl:variable>
        
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
               <xsl:attribute name="sameStyle" select="$sameStyle"/>
               <xsl:attribute name="sameLvlWitResart" select="$sameLvlWitResart"/>
               <xsl:attribute name="higherlvl" select="$higherlvl"/>
            <!--added ($NumberingStartAt != 0) condition because indesign is not considering (NumberingStartAt = 0) as a list-->
            <xsl:if test="$restartVal ='true' and (not($NumberingStartAt = 0) and not(string-length(@NumberingExpression) = 0) and not(@BulletsAndNumberingListType = 'NoList'))">
                <xsl:attribute name="NumberingStartAt" select="$NumberingStartAt"/>
                <xsl:attribute name="NumberingContinue" select="'false'"/>
                <xsl:element name="w:numPr">
                    <xsl:element name="w:ilvl">
                        <xsl:attribute name="w:val" select="'0'"/>
                    </xsl:element>
                    <xsl:element name="w:numId">
                        <xsl:attribute name="w:val">
                            <!--<xsl:value-of select="$ListID + 1000"/>-->
                            <xsl:value-of select="number($ListID) + $ParaStyleCount"/>
                        </xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:if>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
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
            <xsl:variable name="ListRestartNumId">
                <xsl:value-of select="count(ancestor::idPkg:Styles/descendant::ParagraphStyle)"/>
            </xsl:variable>
            <xsl:value-of select="concat('NumberingLevel =',@NumberingLevel,',')"/>
            <xsl:value-of select="concat('NumberingExpression =',@NumberingExpression,',')"/>
            <xsl:value-of select="concat('NumberList =',boolean(@BulletsAndNumberingListType ='NumberedList'),',')"/>
            <xsl:value-of select="concat('basedOn =',$basedOn,',')"/>
            <xsl:value-of select="concat('ParaStyleCount =',$ListRestartNumId)"/>
        </xsl:for-each>
    </xsl:template>
    
    <!-- Removing hidden layer objects from the document   -->
    <xsl:template match="*[@layerVisibility='false']"/>
    
    <!-- changing the processing instruction value to tab value   -->
    <!-- by matching the processing instruction you can change that any character you want. So uncomment this and 
    give the value of the processing instruction in the below condition.-->
    <!--<xsl:template match="processing-instruction('ACE')">
     <xsl:choose>
         <xsl:when test=". ='7' or . ='8'">
             <xsl:choose>
                 <xsl:when test="parent::Content">
                     <xsl:text disable-output-escaping="yes">&lt;/Content&gt;</xsl:text>
                     <xsl:element name="w:tab"/>
                     <xsl:text disable-output-escaping="yes">&lt;Content&gt;</xsl:text>
                 </xsl:when>
                 <xsl:when test="parent::CharacterStyleRange">
                     <xsl:element name="w:tab"/>
                 </xsl:when>
                 
                 <xsl:otherwise>
                     <xsl:element name="w:tab"/>
                 </xsl:otherwise>
             </xsl:choose>
             <!-\-<xsl:element name="w:tab"/>-\->
         </xsl:when>
         <xsl:otherwise>
             <xsl:copy>
                 <xsl:apply-templates/>
             </xsl:copy>
         </xsl:otherwise>
     </xsl:choose>
    </xsl:template>-->
    
    <xsl:template  name="precedingRestart">
        <xsl:param name="precedingParaID"/>
        <xsl:param name="curParaNumLvl"/>
        <xsl:param name="appliedParaStyle"/>
        <xsl:param name="character"/>
        <xsl:param name="higherlvl"/>
        <xsl:param name="sameStyle"/>
        <xsl:param name="paraLid"/>
        
        <xsl:variable name="precedingListCount">
            <xsl:value-of select="count(preceding::ParagraphStyleRange[@AppliedParagraphStyle =$appliedParaStyle])"/>
        </xsl:variable>

        <xsl:choose>
            <xsl:when test="($precedingListCount &lt;= 0) or (number($precedingParaID) &lt;= number($sameStyle)) or (number($precedingParaID) &lt;= number($higherlvl))">
                <xsl:value-of select="number($paraLid)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:for-each select="//ParagraphStyleRange[@paraLID = $precedingParaID]">
                    <xsl:variable name="precedingPID" select="number(preceding::ParagraphStyleRange[($curParaNumLvl = @curParaNumLvl) and ($appliedParaStyle =@AppliedParagraphStyle) and ($character = @character) and (@iscurParaNumList = 'true')][not(ancestor::Note)][1]/@paraLID)"/>
                    <xsl:call-template name="precedingRestart">
                        <xsl:with-param name="precedingParaID" select="$precedingPID"/>
                        <xsl:with-param name="curParaNumLvl" select="$curParaNumLvl"/>
                        <xsl:with-param name="appliedParaStyle" select="$appliedParaStyle"/>
                        <xsl:with-param name="character" select="$character"/>
                        <xsl:with-param name="higherlvl" select="$higherlvl"/>
                        <xsl:with-param name="sameStyle" select="$sameStyle"/>
                        <xsl:with-param name="paraLid" select="./@paraLID"/>
                    </xsl:call-template>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- Function for looping -->
    <xsl:template  name="for">
        <xsl:param name="i"/>
        <xsl:param name="j"/>
        <xsl:param name="k"/>
        <xsl:param name="l"/>
        <xsl:param name="m"/>
        <xsl:param name="n"/>
        <xsl:param name="to"/>
        <xsl:param name="step"/>
        
        <xsl:text>&#x000A;</xsl:text>
        <xsl:element name="Cell">
            <xsl:attribute name="RowName" select="$j"/>
            <xsl:attribute name="ColumnName" select="$k"/>
            <xsl:attribute name="Name" select="concat($k,':',$j)"/>
            <xsl:attribute name="RowSpan" select="'1'"/>
            <xsl:attribute name="ColumnSpan" select="$l"/>
            <xsl:attribute name="AppliedCellStyle" select="$m"/>
            <xsl:attribute name="AppliedCellStylePriority" select="$n"/>
            <xsl:attribute name="mine" select="'vmerge'"/>
            <xsl:element name="ParagraphStyleRange"><xsl:attribute name="AppliedParagraphStyle" select="'ParagraphStyle/Normal'"/></xsl:element>
        </xsl:element>

        <xsl:if test="$i+$step &lt;= $to">
            <xsl:call-template name="for">
                <xsl:with-param name="i" select="$i + $step"/>
                <xsl:with-param name="j" select="$j + 1"/>
                <xsl:with-param name="k" select="$k"/>
                <xsl:with-param name="l" select="$l"/>
                <xsl:with-param name="m" select="$m"/>
                <xsl:with-param name="n" select="$n"/>
                <xsl:with-param name="to" select="$to"/>
                <xsl:with-param name="step" select="$step"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <!-- Function for looping -->
        
</xsl:stylesheet>