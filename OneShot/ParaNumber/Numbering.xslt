<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf"
    exclude-result-prefixes="xs mf idPkg"
    xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas"
    xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
    xmlns:o="urn:schemas-microsoft-com:office:office"
    xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"
    xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math"
    xmlns:v="urn:schemas-microsoft-com:vml"
    xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing"
    xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing"
    xmlns:w10="urn:schemas-microsoft-com:office:word"
    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml"
    xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup"
    xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk"
    xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml"
    xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape"
    xmlns:idPkg="http://ns.adobe.com/AdobeInDesign/idml/1.0/packaging" version="2.0">

    <xsl:variable name="Graphic" select="document('Graphic.xml')"/>
    <xsl:variable name="CharacterList" select="document('CharacterMap.xslt')"/>
<!--    <xsl:variable name="StoryMap" select="document('StoryCleanedmap.xml')"/>-->
    <xsl:variable name="Preferences" select="document('Preferences.xml')"/>
    <xsl:variable name="ChapterNumber">
        <xsl:value-of select="$Preferences//idPkg:Preferences/ChapterNumberPreference/@ChapterNumber"/>
    </xsl:variable>
    <xsl:variable name="hex" >0123456789ABCDEF</xsl:variable>
    
    <xsl:variable name="Stories">
       <!-- <xsl:for-each select="$StoryMap//STORIES//STORY">
            <xsl:copy-of select="document(.)"/>
        </xsl:for-each>-->
        <!--<xsl:copy-of select="document('Inp.xml')"/>-->
        <xsl:copy-of select="document('Table.xml')"/>
    </xsl:variable>

    <xsl:template match="/">
        <w:numbering xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas"
            xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
            xmlns:o="urn:schemas-microsoft-com:office:office"
            xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"
            xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math"
            xmlns:v="urn:schemas-microsoft-com:vml"
            xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing"
            xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing"
            xmlns:w10="urn:schemas-microsoft-com:office:word"
            xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
            xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml"
            xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup"
            xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk"
            xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml"
            xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape"
            mc:Ignorable="w14 wp14">
            <xsl:apply-templates select="//ParagraphStyle"/>
            <xsl:apply-templates select="//ParagraphStyle" mode="NumPr"/>
        </w:numbering>
    </xsl:template>
    
    

    <xsl:template match="ParagraphStyle">
        <xsl:variable name="Na1" select="@Name"/>
        <xsl:variable name="FS1" select="@PointSize"/>
        <xsl:variable name="JC" select="@Justification"/>
        <xsl:variable name="FLI" select="@FirstLineIndent"/>
        <xsl:variable name="LI" select="@LeftIndent"/>
        <xsl:variable name="RI" select="@RightIndent"/>
        <xsl:variable name="SB4" select="@SpaceBefore"/>
        <xsl:variable name="SAF" select="@SpaceAfter"/>
        <xsl:variable name="C" select="@Capitalization"/>
        <xsl:variable name="LS" select="Properties/Leading"/>
        <xsl:variable name="ListID">
            <xsl:number level="any"/>
        </xsl:variable>
        
        
        <xsl:variable name="NumberingLvl">
            <xsl:variable name="numLvl">
                <xsl:value-of select="number(./@NumberingLevel) - 1"/>
            </xsl:variable>
            <xsl:value-of select="$numLvl"/>
        </xsl:variable>
        
        <xsl:variable name="NumberingExpression" >
            <xsl:variable name="expression" select="@NumberingExpression"/>
            <xsl:choose>
                <xsl:when test="not(string-length($expression) = 0)">
                    <xsl:value-of select="$expression"/>   
                </xsl:when>
                <!--<xsl:otherwise>
                    <xsl:value-of select="'%1'"/>     
                </xsl:otherwise>-->
            </xsl:choose>
            
        </xsl:variable>
        
        <xsl:variable name="NumberingCont" select="@NumberingContinue"/>
     
        <xsl:variable name="NumberingForamtString">
            <xsl:choose>
                <xsl:when test="Properties/NumberingFormat/@type = 'string'">
                    <xsl:variable name="String">    
                        <xsl:value-of select="tokenize(Properties/NumberingFormat,',')[1]"/>
                    </xsl:variable>
                    <xsl:value-of select="$String[1]"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="NumberCharacter">
            <xsl:choose>
                <xsl:when test="$NumberingForamtString = '1'">
                    <xsl:value-of select="'decimal'"/>
                </xsl:when>
                <xsl:when test="$NumberingForamtString ='A'">
                    <xsl:value-of select="'upperLetter'"/>
                </xsl:when>
                <xsl:when test="$NumberingForamtString ='a'">
                    <xsl:value-of select="'lowerLetter'"/>
                </xsl:when>
                <xsl:when test="$NumberingForamtString ='I'">
                    <xsl:value-of select="'upperRoman'"/>
                </xsl:when>
                <xsl:when test="$NumberingForamtString ='i'">
                    <xsl:value-of select="'lowerRoman'"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="'decimal'"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="WList">
            <xsl:choose>
                <xsl:when test="@BulletsAndNumberingListType = 'BulletList' or (child::Properties/BulletChar and not(@BulletsAndNumberingListType ='NumberedList' or @BulletsAndNumberingListType ='NoList'))">
                    <xsl:value-of select="'bullet'"/>
                </xsl:when>
                <xsl:when test="@BulletsAndNumberingListType ='NumberedList'">
                    <xsl:value-of select="$NumberCharacter"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
     
        <xsl:variable name="BulletCharacter">
            <xsl:variable name="bullet" select="concat('&amp;#',self::ParagraphStyle/Properties/BulletChar/@BulletCharacterValue,';')"/>
            <xsl:variable name="bullet1" select="self::ParagraphStyle/Properties/BulletChar/@BulletCharacterValue"/>
            <xsl:variable name="BCL">
                <xsl:choose>
                    <xsl:when test="(self::ParagraphStyle/Properties/BulletChar/@BulletCharacterValue)">
                <xsl:for-each select="$CharacterList//Row">
                    <xsl:choose>
                        <xsl:when test="./htmlrepr = $bullet">
                            <xsl:value-of select="./char"/>
                            <!--<xsl:value-of select="$bullet1"/>-->
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
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
          
        <xsl:choose>
<!--            <xsl:when test="@BulletsAndNumberingListType or (child::Properties/BulletChar and not(@BulletsAndNumberingListType ='NumberedList' or @BulletsAndNumberingListType ='NoList'))">-->
            <xsl:when test="(@BulletsAndNumberingListType = 'NumberedList' and not(@NumberingStartAt = 0) and not(string-length(@NumberingExpression) = 0)) or (@BulletsAndNumberingListType ='BulletList')or (child::Properties/BulletChar and not(@BulletsAndNumberingListType ='NumberedList' or @BulletsAndNumberingListType ='NoList'))">
                <!--added (@NumberingStartAt = 0) condition because indesign is not considering (NumberingStartAt = 0) as a list-->
                <xsl:if test="not(@BulletsAndNumberingListType = 'NoList') or (child::Properties/BulletChar and not(@BulletsAndNumberingListType ='NumberedList' or @BulletsAndNumberingListType ='NoList'))">
                    <xsl:element name="w:abstractNum">
                        <xsl:attribute name="w:abstractNumId" select="$ListID - 1"/>
                        
                        <!--  Temporarily added for the purpose of identifier                              -->
                     <!--   <xsl:variable name="randNumber">
                            <xsl:call-template name="create-seed"/>
                        </xsl:variable>
                        <xsl:variable name="number">
                            <xsl:number level="any"/>
                        </xsl:variable>
                        <xsl:element name="w:nsid">
                            <xsl:attribute name="w:val" select="$randNumber"/>
                        </xsl:element>-->
                        <!--  Temporarily added for the purpose of identifier                              -->
                        
                        <xsl:element name="w:multiLevelType">
                            <xsl:attribute name="w:val" select="'hybridMultilevel'"/>
                        </xsl:element>
                        
                        <!--  Temporarily added for the purpose of identifier                              -->
                       <!-- <xsl:element name="w:tmpl">
                            <xsl:attribute name="w:val" select="number($randNumber + $number) cast as xs:decimal"/>
                        </xsl:element>-->
                        <!--  Temporarily added for the purpose of identifier                              -->
                                                
                        <xsl:element name="w:lvl">
                            <xsl:attribute name="w:ilvl" select="'0'"/>
                            <!--  have to copy the previous levels inside the abstract num-->
                            <!--<xsl:attribute name="w:ilvl" select="$NumberingLvl"/>-->
                            <xsl:element name="w:start">
                                <!-- check this -->
                                <xsl:attribute name=" w:val" select="'1'"/>
                            </xsl:element>     
                            
                            <xsl:element name="w:numFmt">
                                <!-- check this -->
                                <xsl:attribute name=" w:val" select="$WList"/>
                            </xsl:element>
                            
                            <xsl:if test="$NumberingLvl &gt; 0 and @BulletsAndNumberingListType ='NumberedList'">
                                <xsl:element name="w:lvlRestart">
                                    <xsl:attribute name="w:val" select="$NumberingLvl - 1"/>
                                    <!--<xsl:attribute name="w:val" select="''"/>-->
                                </xsl:element>
                            </xsl:if>
                            
                            <xsl:element name="w:pStyle">
                                <xsl:variable name="styleId" select="@pStyleID"/>
                                <xsl:choose>
                                    <xsl:when test="not(string-length($styleId) = 0)">
                                        <xsl:attribute name="w:val" select="$styleId"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:choose>
                                            <xsl:when test="contains($Na1,'\')">
                                                <xsl:attribute name="w:val" select="replace($Na1,'\\','')"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:attribute name="w:val" select="$Na1"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <!--<xsl:choose>
                                    <xsl:when test="contains($Na1,'\')">
                                        <xsl:attribute name="w:val" select="replace($Na1,'\\','')"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:attribute name="w:val" select="$Na1"/>
                                    </xsl:otherwise>
                                </xsl:choose>-->
                            </xsl:element>
                
                            <xsl:element name="w:lvlText">
                                <!-- check this -->
                                <xsl:attribute name=" w:val" select="$Character"/>
                            </xsl:element>
                            
                            <!--@@ Justification Start @@ -->

                            <xsl:element name="w:lvlJc">
                                <xsl:attribute name="w:val" select="'left'"/>
                            </xsl:element>
                            <!--@@ Justification End @@ -->
                
                            <xsl:element name="w:pPr">
                
                                <!--@@ Indent Start @@ -->
                                <xsl:element name="w:ind">
                                    <xsl:if test="self::ParagraphStyle/@FirstLineIndent">
                                        <xsl:if test="not($FLI &lt; 0)">
                                            <xsl:attribute name="w:firstLine" select="round($FLI * 20)"/>
                                        </xsl:if>
                                        <xsl:if test="($FLI &lt; 0)">
                                            <xsl:variable name="FLI1" select="$FLI * -1"/>
                                            <xsl:attribute name="w:hanging" select="round($FLI1 * 20)"/>
                                        </xsl:if>
                                    </xsl:if>
                
                                    <xsl:if test="self::ParagraphStyle/@LeftIndent">
                                        <xsl:attribute name="w:left" select="round($LI * 20)"/>
                                    </xsl:if>
                
                                    <xsl:if test="self::ParagraphStyle/@RightIndent">
                                        <xsl:attribute name="w:right" select="round($RI * 20)"/>
                                    </xsl:if>
                                </xsl:element>
                
                                <!--@@ Keep with next start @@ -->
                                <xsl:if test="@KeepWithNext">
                                    <xsl:if test="not(@KeepWithNext = '0')">
                                        <xsl:element name="w:keepNext"/>
                                    </xsl:if>
                                </xsl:if>
                
                            </xsl:element>
                
                            <xsl:if test="Properties">
                                <xsl:element name="w:rPr">
                                    <!--@@ Font Start @@-->
                                    <xsl:if test="Properties/AppliedFont">
                                        <xsl:choose>
                                            <xsl:when test="Properties/BulletsFont">
                                                <xsl:element name="w:rFonts">
                                                    <xsl:attribute name="w:ascii" select="Properties/BulletsFont"/>
                                                    <xsl:attribute name="w:hAnsi" select="Properties/BulletsFont"/>
                                                </xsl:element>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:element name="w:rFonts">
                                                    <xsl:attribute name="w:ascii" select="Properties/AppliedFont"/>
                                                    <xsl:attribute name="w:hAnsi" select="Properties/AppliedFont"/>
                                                </xsl:element>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:if>
                                    <!--@@ Font Start @@-->
                                    
                                    <!--@@ Characterstyle Property Start @@-->
                                    <xsl:if test="Properties/BulletsCharacterStyle|Properties/NumberingCharacterStyle">
                                        <xsl:variable name="BCS">
                                            <xsl:choose>
                                                <xsl:when test="Properties/BulletsCharacterStyle">
                                                    <xsl:value-of select="Properties/BulletsCharacterStyle"/>
                                                </xsl:when>
                                                <xsl:when test="Properties/NumberingCharacterStyle">
                                                    <xsl:value-of select="Properties/NumberingCharacterStyle"/>
                                                </xsl:when>
                                            </xsl:choose>
                                        </xsl:variable>
                                        <xsl:for-each select="//CharacterStyle">
                                            <xsl:choose>
                                                <xsl:when test="./@Self = $BCS">
                                                  <xsl:variable name="Na" select="./@Name"/>
                                                  <xsl:variable name="FS" select="./@PointSize"/>
                                                  <xsl:variable name="C1" select="./@Capitalization"/>
                                        <!--<xsl:if test="contains(@FontStyle,'Black') or contains(@FontStyle,'Bold') or contains(@FontStyle,'Strong') or contains(@FontStyle,'black') or contains(@FontStyle,'bold') or contains(@FontStyle,'strong') or contains(@FontStyle,'Extra') or contains(@FontStyle,'extra') or contains(@FontStyle,'Heavy') or contains(@FontStyle,'heavy') ">-->
                                                  <xsl:if
                                                      test="contains(lower-case(@FontStyle),'medium') or contains(lower-case(@FontStyle),'black') or contains(lower-case(@FontStyle),'bold') or contains(lower-case(@FontStyle),'strong') or contains(lower-case(@FontStyle),'demi') or contains(lower-case(@FontStyle),'extra') or contains(lower-case(@FontStyle),'heavy') ">
                                                  <xsl:element name="w:b"/>
                                                  </xsl:if>
<!--                                                    <w:bCs/>-->
                                                  <!--</xsl:if>-->
                                                  <xsl:if
                                                  test="contains(lower-case(@FontStyle),'italic') or contains(lower-case(@FontStyle),'oblique')">
                                                  <xsl:element name="w:i"/>
                                                  </xsl:if>
                                                    
                                                    <xsl:if test="contains(lower-case(@FontStyle),'regular') or contains(lower-case(@FontStyle),'roman')">
                                                        <xsl:element name="w:b">
                                                            <xsl:attribute name="w:val" select="'0'"/>
                                                        </xsl:element>
                                                        <xsl:element name="w:i">
                                                            <xsl:attribute name="w:val" select="'0'"/>
                                                        </xsl:element>
                                                    </xsl:if>
<!--                                                    <w:iCs/>-->
                                                    <xsl:if test="@Capitalization">
                                                        <xsl:if test="contains($C1,'SmallCaps')">
                                                            <xsl:element name="w:smallCaps"/>
                                                        </xsl:if>
                                                        <xsl:if test="contains($C1,'AllCaps')">
                                                            <xsl:element name="w:caps"/>
                                                        </xsl:if>
                                                        <xsl:if test="contains($C1,'Normal')">
                                                            <xsl:element name="w:caps">
                                                                <xsl:attribute name="w:val" select="'0'"/>
                                                            </xsl:element>
                                                        </xsl:if>
                                                    </xsl:if>
                                                    <xsl:if test="@StrikeThru = 'true'">
                                                        <xsl:element name="w:strike"/>
                                                    </xsl:if>
                                                    <!--*********************Font Color****************************************************************-->
<!--                                                    <xsl:if test="self::CharacterStyleRange/@FillColor">-->
                                                        <xsl:variable name="FC">
                                                            <xsl:variable name="color" select="@FillColor"/>
                                                            <xsl:call-template name="color">
                                                                <xsl:with-param name="colorName" select="$color"/>
                                                            </xsl:call-template>
                                                        </xsl:variable>
                                                        <xsl:if test="string-length($FC) &gt; 0">
                                                            <xsl:element name="w:color">
                                                                <xsl:attribute name="w:val">
                                                                    <xsl:value-of select="$FC"/>
                                                                </xsl:attribute>
                                                            </xsl:element> 
                                                        </xsl:if>
                                                    <!--</xsl:if>-->
                                                    <!--*********************Font Color****************************************************************-->
                                                    
                                                    <xsl:if test="self::CharacterStyle/@PointSize">
                                                        <xsl:element name="w:sz">
                                                            <xsl:attribute name="w:val" select="$FS * 2"/>
                                                        </xsl:element>
                                                    </xsl:if>
                                                    <xsl:if test="@Underline ='true'">
                                                        <xsl:variable name="underlineColor">
                                                            <xsl:if test="Properties/UnderlineColor">
                                                                <xsl:value-of select="Properties/UnderlineColor"/>
                                                            </xsl:if>
                                                        </xsl:variable>
                                                        <xsl:variable name="underlineType">
                                                            <xsl:variable name="type">
                                                                <xsl:if test="Properties/UnderlineType">
                                                                    <xsl:value-of select="Properties/UnderlineType"/>
                                                                </xsl:if>
                                                            </xsl:variable>
                                                            <xsl:choose>
                                                                <xsl:when test="contains(lower-case($type),'dash')">
                                                                    <xsl:value-of select="'dash'"/>
                                                                </xsl:when>
                                                                <xsl:when test="contains(lower-case($type),'dot')">
                                                                    <xsl:value-of select="'dotDash'"/>
                                                                </xsl:when>
                                                                <xsl:when test="contains(lower-case($type),'wavy')">
                                                                    <xsl:value-of select="'wave'"/>
                                                                </xsl:when>
                                                                <xsl:otherwise>
                                                                    <xsl:value-of select="'words'"/>
                                                                </xsl:otherwise>
                                                            </xsl:choose>
                                                        </xsl:variable>
                                                        <xsl:element name="w:u">
                                                            <xsl:attribute name="w:val" select="$underlineType"/>
                                                            <xsl:call-template name="color">
                                                                <xsl:with-param name="colorName" select="$underlineColor"/>
                                                            </xsl:call-template>
                                                        </xsl:element>
                                                    </xsl:if>
                                                    
                                                    <xsl:if test="@Position">
                                                        <xsl:if test="contains(@Position,'Superscript')">
                                                            <xsl:element name="w:vertAlign">
                                                                <xsl:attribute name="w:val" select="'superscript'"/>
                                                            </xsl:element>
                                                        </xsl:if>
                                                        <xsl:if test="contains(@Position,'Subscript')">
                                                            <xsl:element name="w:vertAlign">
                                                                <xsl:attribute name="w:val" select="'subscript'"/>
                                                            </xsl:element>
                                                        </xsl:if>
                                                    </xsl:if>
                                                  
                                                     <!--   <xsl:if test="@Ligatures">
                      <xsl:if test="@Ligatures = 'true'">
                          <xsl:element name="w14:ligatures">
                              <xsl:attribute name="w:val" select="'all'"/>
                          </xsl:element>
                      </xsl:if>
                  </xsl:if>-->
                                                    

                                                </xsl:when>
                                            </xsl:choose>
                                        </xsl:for-each>
                                   </xsl:if>
                                    <!--@@ Characterstyle Property end @@-->
                                    
                                </xsl:element>
                            </xsl:if>
                        </xsl:element>
                    </xsl:element>
                </xsl:if>
            </xsl:when>
        </xsl:choose>
   
    </xsl:template>
    
    
    <xsl:template match="TabList" mode="tabs">
        <xsl:element name="w:tabs">
            <xsl:apply-templates mode="tabs"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="ListItem[ancestor::*[1]/name() ='TabList']" mode="tabs">
        <xsl:variable name="alignment">
            <xsl:choose>
                <xsl:when test="descendant::Alignment = 'LeftAlign'">
                    <xsl:value-of select="'left'"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="'left'"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="position">
            <xsl:variable name="pos" select="descendant::Position"/>
            <xsl:choose>
                <xsl:when test="string-length($pos) &gt; 0">
                    <xsl:value-of select="number($pos) * 20"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="0"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:element name="w:tab">
            <xsl:attribute name="w:val" select="$alignment"/>
            <xsl:attribute name="w:pos" select="$position"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="create-seed">
        <xsl:param name="string" select="generate-id()"/>
        <xsl:param name="preliminary-seed" select="10000000"/>
        <xsl:param name="maximum-value" select="100000000"/>
        
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
    
    <xsl:template name="BulletlistLevels">
        <xsl:param name="NumberingLvl"/>
        <xsl:if test="$NumberingLvl &gt;= 0"> 
            <xsl:apply-templates select="//ParagraphStyle[(@NumberingLevel = $NumberingLvl and @BulletsAndNumberingListType ='BulletList') or (@NumberingLevel = $NumberingLvl and (child::Properties/BulletChar and not(@BulletsAndNumberingListType ='NumberedList' or @BulletsAndNumberingListType ='NoList')))][1]" mode="list"/>
            <xsl:call-template name="BulletlistLevels">
                <xsl:with-param name="NumberingLvl" select="$NumberingLvl - 1"/>             
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <xsl:template name="NumberlistLevels">
        <xsl:param name="NumberingLvl"/>
        <xsl:if test="$NumberingLvl &gt;= 0"> 
            <xsl:apply-templates select="//ParagraphStyle[@NumberingLevel = $NumberingLvl and @BulletsAndNumberingListType ='NumberedList'][1]" mode="list"/>            
            <xsl:call-template name="NumberlistLevels">
                <xsl:with-param name="NumberingLvl" select="$NumberingLvl - 1"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="ParagraphStyle" mode="list">
        <xsl:variable name="Na1" select="@Name"/>
        <xsl:variable name="FS1" select="@PointSize"/>
        <xsl:variable name="JC" select="@Justification"/>
        <xsl:variable name="FLI" select="@FirstLineIndent"/>
        <xsl:variable name="LI" select="@LeftIndent"/>
        <xsl:variable name="RI" select="@RightIndent"/>
        <xsl:variable name="SB4" select="@SpaceBefore"/>
        <xsl:variable name="SAF" select="@SpaceAfter"/>
        <xsl:variable name="C" select="@Capitalization"/>
        <xsl:variable name="LS" select="Properties/Leading"/>
        <xsl:variable name="ListID">
            <xsl:number level="any"/>
        </xsl:variable>
        
        
        <xsl:variable name="NumberingLvl">
            <xsl:variable name="numLvl">
                <xsl:value-of select="number(./@NumberingLevel) - 1"/>
            </xsl:variable>
            <xsl:value-of select="$numLvl"/>
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
        
        <xsl:variable name="NumberingCont" select="@NumberingContinue"/>
     
        <xsl:variable name="NumberingForamtString">
            <xsl:choose>
                <xsl:when test="Properties/NumberingFormat/@type = 'string'">
                    <xsl:variable name="String">    
                        <xsl:value-of select="tokenize(Properties/NumberingFormat,',')[1]"/>
                    </xsl:variable>
                    <xsl:value-of select="$String[1]"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="NumberCharacter">
            <xsl:choose>
                <xsl:when test="$NumberingForamtString = '1'">
                    <xsl:value-of select="'decimal'"/>
                </xsl:when>
                <xsl:when test="$NumberingForamtString ='A'">
                    <xsl:value-of select="'upperLetter'"/>
                </xsl:when>
                <xsl:when test="$NumberingForamtString ='a'">
                    <xsl:value-of select="'lowerLetter'"/>
                </xsl:when>
                <xsl:when test="$NumberingForamtString ='I'">
                    <xsl:value-of select="'upperRoman'"/>
                </xsl:when>
                <xsl:when test="$NumberingForamtString ='i'">
                    <xsl:value-of select="'lowerRoman'"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="'decimal'"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="WList">
            <xsl:choose>
                <!--<xsl:when test="@BulletsAndNumberingListType = 'BulletList' or (child::Properties/BulletChar and not(@BulletsAndNumberingListType ='NumberedList' or @BulletsAndNumberingListType ='NoList'))">-->
                    <!-- for getting the no paragraph style list type only for the list previous levels               -->
                <xsl:when test="@BulletsAndNumberingListType = 'BulletList' or (child::Properties/BulletChar and not(@BulletsAndNumberingListType ='NumberedList'))">
                    <xsl:value-of select="'bullet'"/>
                </xsl:when>
                <xsl:when test="@BulletsAndNumberingListType ='NumberedList'">
                    <xsl:value-of select="$NumberCharacter"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
     
        <xsl:variable name="BulletCharacter">
            <xsl:variable name="bullet" select="concat('&amp;#',self::ParagraphStyle/Properties/BulletChar/@BulletCharacterValue,';')"/>
            <xsl:variable name="bullet1" select="self::ParagraphStyle/Properties/BulletChar/@BulletCharacterValue"/>
            <xsl:variable name="BCL">
                <xsl:choose>
                    <xsl:when test="(self::ParagraphStyle/Properties/BulletChar/@BulletCharacterValue)">
                <xsl:for-each select="$CharacterList//Row">
                    <xsl:choose>
                        <xsl:when test="./htmlrepr = $bullet">
                            <xsl:value-of select="./char"/>
                            <!--<xsl:value-of select="$bullet1"/>-->
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
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
<!--                <xsl:when test="@BulletsAndNumberingListType = 'BulletList' or (child::Properties/BulletChar and not(@BulletsAndNumberingListType ='NumberedList' or @BulletsAndNumberingListType ='NoList'))">-->
                <!-- for getting the no paragraph style list type only for the list previous levels               -->
                <xsl:when test="@BulletsAndNumberingListType = 'BulletList' or (child::Properties/BulletChar and not(@BulletsAndNumberingListType ='NumberedList'))">
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
          
                        
        <xsl:element name="w:lvl">
            <!--<xsl:attribute name="w:ilvl" select="'0'"/>-->
            <!--  have to copy the previous levels inside the abstract num-->
            <xsl:attribute name="w:ilvl" select="$NumberingLvl"/>
            <xsl:element name="w:start">
                <!-- check this -->
                <xsl:attribute name=" w:val" select="'1'"/>
            </xsl:element>     
            
            <xsl:element name="w:numFmt">
                <!-- check this -->
                <xsl:attribute name=" w:val" select="$WList"/>
            </xsl:element>
            
          <!--  <xsl:if test="$NumberingLvl &gt; 0 and @BulletsAndNumberingListType ='NumberedList'">
                <xsl:element name="w:lvlRestart">
                    <xsl:attribute name="w:val" select="$NumberingLvl - 1"/>
                    <!-\-<xsl:attribute name="w:val" select="''"/>-\->
                </xsl:element>
            </xsl:if>
            -->
            <xsl:element name="w:pStyle">
                <xsl:variable name="styleId" select="@pStyleID"/>
                <xsl:choose>
                    <xsl:when test="not(string-length($styleId) = 0)">
                        <xsl:attribute name="w:val" select="$styleId"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:choose>
                            <xsl:when test="contains($Na1,'\')">
                                <xsl:attribute name="w:val" select="replace($Na1,'\\','')"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:attribute name="w:val" select="$Na1"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>
                <!--<xsl:choose>
                                    <xsl:when test="contains($Na1,'\')">
                                        <xsl:attribute name="w:val" select="replace($Na1,'\\','')"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:attribute name="w:val" select="$Na1"/>
                                    </xsl:otherwise>
                                </xsl:choose>-->
            </xsl:element>
            
            <xsl:element name="w:lvlText">
                <!-- check this -->
                <xsl:attribute name=" w:val" select="$Character"/>
            </xsl:element>
            
            <!--@@ Justification Start @@ -->
            
            <xsl:element name="w:lvlJc">
                <xsl:attribute name="w:val" select="'left'"/>
            </xsl:element>
            <!--@@ Justification End @@ -->
            
            <xsl:element name="w:pPr">
                
                <!--@@ Indent Start @@ -->
                <xsl:element name="w:ind">
                    <xsl:if test="self::ParagraphStyle/@FirstLineIndent">
                        <xsl:if test="not($FLI &lt; 0)">
                            <xsl:attribute name="w:firstLine" select="round($FLI * 20)"/>
                        </xsl:if>
                        <xsl:if test="($FLI &lt; 0)">
                            <xsl:variable name="FLI1" select="$FLI * -1"/>
                            <xsl:attribute name="w:hanging" select="round($FLI1 * 20)"/>
                        </xsl:if>
                    </xsl:if>
                    
                    <xsl:if test="self::ParagraphStyle/@LeftIndent">
                        <xsl:attribute name="w:left" select="round($LI * 20)"/>
                    </xsl:if>
                    
                    <xsl:if test="self::ParagraphStyle/@RightIndent">
                        <xsl:attribute name="w:right" select="round($RI * 20)"/>
                    </xsl:if>
                </xsl:element>
                
                <!--@@ Keep with next start @@ -->
                <xsl:if test="@KeepWithNext">
                    <xsl:if test="not(@KeepWithNext = '0')">
                        <xsl:element name="w:keepNext"/>
                    </xsl:if>
                </xsl:if>
                
            </xsl:element>
            
            <xsl:if test="Properties">
                <xsl:element name="w:rPr">
                    <!--@@ Font Start @@-->
                    <xsl:if test="Properties/AppliedFont">
                        <xsl:choose>
                            <xsl:when test="Properties/BulletsFont">
                                <xsl:element name="w:rFonts">
                                    <xsl:attribute name="w:ascii" select="Properties/BulletsFont"/>
                                    <xsl:attribute name="w:hAnsi" select="Properties/BulletsFont"/>
                                </xsl:element>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:element name="w:rFonts">
                                    <xsl:attribute name="w:ascii" select="Properties/AppliedFont"/>
                                    <xsl:attribute name="w:hAnsi" select="Properties/AppliedFont"/>
                                </xsl:element>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:if>
                    <!--@@ Font Start @@-->
                    
                    <!--@@ Characterstyle Property Start @@-->
                    <xsl:if test="Properties/BulletsCharacterStyle">
                        <xsl:variable name="BCS" select="Properties/BulletsCharacterStyle"/>
                        <xsl:for-each select="//CharacterStyle">
                            <xsl:choose>
                                <xsl:when test="./@Self = $BCS">
                                    <xsl:variable name="Na" select="./@Name"/>
                                    <xsl:variable name="FS" select="./@PointSize"/>
                                    <xsl:variable name="C1" select="./@Capitalization"/>
                                    <!--<xsl:if test="contains(@FontStyle,'Black') or contains(@FontStyle,'Bold') or contains(@FontStyle,'Strong') or contains(@FontStyle,'black') or contains(@FontStyle,'bold') or contains(@FontStyle,'strong') or contains(@FontStyle,'Extra') or contains(@FontStyle,'extra') or contains(@FontStyle,'Heavy') or contains(@FontStyle,'heavy') ">-->
                                    <xsl:if
                                        test="contains(lower-case(@FontStyle),'medium') or contains(lower-case(@FontStyle),'black') or contains(lower-case(@FontStyle),'bold') or contains(lower-case(@FontStyle),'strong') or contains(lower-case(@FontStyle),'demi') or contains(lower-case(@FontStyle),'extra') or contains(lower-case(@FontStyle),'heavy') ">
                                        <xsl:element name="w:b"/>
                                    </xsl:if>
                                    <!--</xsl:if>-->
                                    <xsl:if
                                        test="contains(lower-case(@FontStyle),'italic') or contains(lower-case(@FontStyle),'oblique')">
                                        <xsl:element name="w:i"/>
                                    </xsl:if>
                                    <xsl:if test="contains(lower-case(@FontStyle),'regular') or contains(lower-case(@FontStyle),'roman')">
                                        <xsl:element name="w:b">
                                            <xsl:attribute name="w:val" select="'0'"/>
                                        </xsl:element>
                                        <xsl:element name="w:i">
                                            <xsl:attribute name="w:val" select="'0'"/>
                                        </xsl:element>
                                    </xsl:if>
                                    <xsl:if test="@Capitalization">
                                        <xsl:if test="contains($C1,'SmallCaps')">
                                            <xsl:element name="w:smallCaps"/>
                                        </xsl:if>
                                        <xsl:if test="contains($C1,'AllCaps')">
                                            <xsl:element name="w:caps"/>
                                        </xsl:if>
                                        <xsl:if test="contains($C1,'Normal')">
                                            <xsl:element name="w:caps">
                                                <xsl:attribute name="w:val" select="'0'"/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="@StrikeThru = 'true'">
                                        <xsl:element name="w:strike"/>
                                    </xsl:if>
                                    <!--*********************Font Color****************************************************************-->
<!--                                    <xsl:if test="self::CharacterStyleRange/@FillColor">-->
                                        <xsl:variable name="FC">
                                            <xsl:variable name="color" select="@FillColor"/>
                                            <xsl:call-template name="color">
                                                <xsl:with-param name="colorName" select="$color"/>
                                            </xsl:call-template>
                                        </xsl:variable>
                                        <xsl:if test="string-length($FC) &gt; 0">
                                            <xsl:element name="w:color">
                                                <xsl:attribute name="w:val">
                                                    <xsl:value-of select="$FC"/>
                                                </xsl:attribute>
                                            </xsl:element> 
                                        </xsl:if>
                                    <!--</xsl:if>-->
                                    <!--*********************Font Color****************************************************************-->
                                    
                                    <xsl:if test="self::CharacterStyle/@PointSize">
                                        <xsl:element name="w:sz">
                                            <xsl:attribute name="w:val" select="$FS * 2"/>
                                        </xsl:element>
                                    </xsl:if>
                                    
                                    <xsl:if test="@Underline ='true'">
                                        <xsl:variable name="underlineColor">
                                            <xsl:if test="Properties/UnderlineColor">
                                                <xsl:value-of select="Properties/UnderlineColor"/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:variable name="underlineType">
                                            <xsl:variable name="type">
                                                <xsl:if test="Properties/UnderlineType">
                                                    <xsl:value-of select="Properties/UnderlineType"/>
                                                </xsl:if>
                                            </xsl:variable>
                                            <xsl:choose>
                                                <xsl:when test="contains(lower-case($type),'dash')">
                                                    <xsl:value-of select="'dash'"/>
                                                </xsl:when>
                                                <xsl:when test="contains(lower-case($type),'dot')">
                                                    <xsl:value-of select="'dotDash'"/>
                                                </xsl:when>
                                                <xsl:when test="contains(lower-case($type),'wavy')">
                                                    <xsl:value-of select="'wave'"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="'words'"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>
                                        <xsl:element name="w:u">
                                            <xsl:attribute name="w:val" select="$underlineType"/>
                                            <xsl:call-template name="color">
                                                <xsl:with-param name="colorName" select="$underlineColor"/>
                                            </xsl:call-template>
                                        </xsl:element>
                                    </xsl:if>
                                    <xsl:if test="@Position">
                                        <xsl:if test="contains(@Position,'Superscript')">
                                            <xsl:element name="w:vertAlign">
                                                <xsl:attribute name="w:val" select="'superscript'"
                                                />
                                            </xsl:element>
                                        </xsl:if>
                                        <xsl:if test="contains(@Position,'Subscript')">
                                            <xsl:element name="w:vertAlign">
                                                <xsl:attribute name="w:val" select="'subscript'"/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:if>
                                    
                                    
                                    <!--   <xsl:if test="@Ligatures">
                      <xsl:if test="@Ligatures = 'true'">
                          <xsl:element name="w14:ligatures">
                              <xsl:attribute name="w:val" select="'all'"/>
                          </xsl:element>
                      </xsl:if>
                  </xsl:if>-->
                                   
                                    
                                </xsl:when>
                            </xsl:choose>
                        </xsl:for-each>
                    </xsl:if>
                    <!--@@ Characterstyle Property end @@-->
                    
                </xsl:element>
            </xsl:if>
        </xsl:element>
                    
   
    </xsl:template>
    
    <!-- **************************************Converting hexdecimal value to numbers***********************************************-->
    <xsl:template name="hex2num">
        <xsl:param name="hex"/>
        <xsl:param name="num" select="0"/>
        <xsl:param name="MSB" select="translate(substring($hex, 1, 1), 'abcdef', 'ABCDEF')"/>
        <xsl:param name="value" select="string-length(substring-before('0123456789ABCDEF', $MSB))"/>
        <xsl:param name="result" select="16 * $num + $value"/>
        <xsl:choose>
            <xsl:when test="string-length($hex) > 1">
                <xsl:call-template name="hex2num">
                    <xsl:with-param name="hex" select="substring($hex, 2)"/>
                    <xsl:with-param name="num" select="$result"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$result"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="ParagraphStyle" mode="NumPr">
        
        <xsl:variable name="Na1" select="@Name"/>
        <xsl:variable name="ListRestartNumId">
            <xsl:value-of select="count(ancestor::idPkg:Styles/descendant::ParagraphStyle)"/>
        </xsl:variable>
        <xsl:variable name="ParaStyle">
            <xsl:value-of select="@Self"/>
        </xsl:variable>
        <xsl:variable name="basedOn">
            <xsl:choose>
               <!-- <xsl:when test="contains(descendant::Properties/BasedOn,'$ID/')">
                    <xsl:value-of select="substring-after(descendant::Properties/BasedOn,'$ID/')"/>
                </xsl:when>-->
                <xsl:when test="contains(descendant::Properties/BasedOn,'ParagraphStyle/')">
                    <xsl:value-of select="substring-after(descendant::Properties/BasedOn,'ParagraphStyle/')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="descendant::Properties/BasedOn"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="NumberingCont" select="@NumberingContinue"/>
        <xsl:variable name="BasedonBulletsAndNumberingListType">
            <xsl:if test="not(@BulletsAndNumberingListType)">
                <xsl:value-of select="'true'"/>
            </xsl:if>
        </xsl:variable>
        <xsl:variable name="BasedonNumberingRestart">
            <xsl:for-each select="$Stories//ParagraphStyleRange">
                <xsl:choose>
                    <xsl:when test="./@AppliedParagraphStyle = $ParaStyle">
                        <xsl:if test="./@NumberingContinue = 'false'">
                            <xsl:if test="$BasedonBulletsAndNumberingListType = 'true'">
                                <xsl:value-of select="'true'"/>
                            </xsl:if>
                        </xsl:if>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="ListID">
            <xsl:choose>
                <xsl:when test="contains($BasedonNumberingRestart,'true')">
                    <xsl:call-template name="BasedonNumbering">
                        <xsl:with-param name="basedOn" select="$basedOn"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:number level="any"/>
                </xsl:otherwise>
            </xsl:choose>
            <!--<xsl:number level="any"/>-->
        </xsl:variable>
        
        <xsl:choose>
            <!--            <xsl:when test="@BulletsAndNumberingListType or (child::Properties/BulletChar and not(@BulletsAndNumberingListType ='NumberedList' or @BulletsAndNumberingListType ='NoList'))">-->
            <xsl:when test="(@BulletsAndNumberingListType = 'NumberedList' and not(@NumberingStartAt = 0)and not(string-length(@NumberingExpression) = 0)) or (@BulletsAndNumberingListType ='BulletList')or (child::Properties/BulletChar and not(@BulletsAndNumberingListType ='NumberedList' or @BulletsAndNumberingListType ='NoList'))">
                <!--added (@NumberingStartAt = 0) condition because indesign is not considering (NumberingStartAt = 0) as a list-->
                <xsl:if test="not(@BulletsAndNumberingListType = 'NoList') or  (child::Properties/BulletChar and not(@BulletsAndNumberingListType ='NumberedList'or @BulletsAndNumberingListType ='NoList'))">
                 
                <xsl:element name="w:num">
                    <xsl:attribute name="w:numId">
                        <xsl:value-of select="$ListID"/>
                    </xsl:attribute>
                    <xsl:element name="w:abstractNumId">
                        <xsl:attribute name="w:val">
                            <xsl:value-of select="$ListID - 1"/>
                        </xsl:attribute>
                    </xsl:element>
                </xsl:element>
              
                <!--  Restart list numbering in the document.xml and Numbering.xml  -->
                  
                  
                  <xsl:for-each select="$Stories//ParagraphStyleRange">
                      
                      <xsl:variable name="ListID1">
                          <!--<xsl:number level="any" count="//ParagraphStyleRange"/>-->
                          <xsl:value-of select="@paraLID"/>
                      </xsl:variable>
                      
                      <xsl:variable name="NumberingStart" >
                          <xsl:choose>
                              <xsl:when test="@NumberingStartAt">
                                  <xsl:value-of select="@NumberingStartAt"/>
                              </xsl:when>
                              <xsl:otherwise>
                                  <!--<xsl:value-of select="'1'"/>-->
                                  <xsl:value-of select="0"/>
                              </xsl:otherwise>
                          </xsl:choose>
                      </xsl:variable>
                      
                      <xsl:choose>
                          <xsl:when test="./@AppliedParagraphStyle = $ParaStyle">

                                  <!--<xsl:if test="($NumberingCont = 'false' or ./@NumberingContinue = 'false')">-->
                                  <!--added ($NumberingStartAt != 0) condition because indesign is not considering (NumberingStartAt = 0) as a list-->
                              <xsl:if test="($NumberingCont = 'false' or ./@NumberingContinue = 'false') and (not($NumberingStart = 0) or not(@BulletsAndNumberingListType = 'NoList'))">    
                                  <xsl:element name="w:num">
                                      <xsl:attribute name="w:numId">
                                          <!--<xsl:value-of select="$ListID1 + 1000"/>-->
                                          <xsl:value-of select="$ListID1 + $ListRestartNumId"/>
                                          
                                      </xsl:attribute>
                                      <xsl:element name="w:abstractNumId">
                                          <xsl:attribute name="w:val">
                                              <xsl:value-of select="$ListID - 1"/>
                                          </xsl:attribute>
                                      </xsl:element>
                                      <xsl:element name="w:lvlOverride">
                                          <xsl:attribute name="w:ilvl" select="'0'"/>
                                          <xsl:element name="w:startOverride">
                                              <!--<xsl:attribute name="w:val" select="'1'"/>-->
                                              <xsl:attribute name="w:val" select="$NumberingStart"/>
                                          </xsl:element>
                                      </xsl:element>
                                  </xsl:element>
                              </xsl:if>
                          </xsl:when>
                      </xsl:choose>
                  </xsl:for-each>
                  
                    <!--  Restart list numbering in the document.xml and Numbering.xml  -->
              </xsl:if>  
            </xsl:when>
            <xsl:when test="contains($BasedonNumberingRestart,'true')">
                <!--  Restart list numbering in the document.xml and Numbering.xml  -->
                <xsl:for-each select="$Stories//ParagraphStyleRange">
                    <xsl:variable name="ListID1">
                        <!--<xsl:number level="any" count="//ParagraphStyleRange"/>-->
                        <xsl:value-of select="@paraLID"/>
                    </xsl:variable>
                    <xsl:variable name="NumberingStart" >
                        <xsl:choose>
                            <xsl:when test="@NumberingStartAt">
                                <xsl:value-of select="@NumberingStartAt"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <!--<xsl:value-of select="'1'"/>-->
                                <xsl:value-of select="0"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    
                    <xsl:choose>
                        <xsl:when test="./@AppliedParagraphStyle = $ParaStyle">
                            <!--<xsl:if test="($NumberingCont = 'false' or ./@NumberingContinue = 'false')">-->
                            <!--added ($NumberingStartAt != 0) condition because indesign is not considering (NumberingStartAt = 0) as a list-->
                            <xsl:if test="($NumberingCont = 'false' or ./@NumberingContinue = 'false') and (not($NumberingStart = 0) or not(@BulletsAndNumberingListType = 'NoList'))">    
                                <xsl:element name="w:num">
                                    <xsl:attribute name="w:numId">
                                        <!--<xsl:value-of select="$ListID1 + 1000"/>-->
                                        <xsl:value-of select="$ListID1 + $ListRestartNumId"/>
                                        <!--<xsl:value-of select="$ListID1"/>-->
                                    </xsl:attribute>
                                    <xsl:element name="w:abstractNumId">
                                        <xsl:attribute name="w:val">
                                            <xsl:value-of select="$ListID - 1"/>
                                        </xsl:attribute>
                                    </xsl:element>
                                    <xsl:element name="w:lvlOverride">
                                        <xsl:attribute name="w:ilvl" select="'0'"/>
                                        <xsl:element name="w:startOverride">
                                            <!--<xsl:attribute name="w:val" select="'1'"/>-->
                                            <xsl:attribute name="w:val" select="$NumberingStart"/>
                                        </xsl:element>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:if>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
                <!--  Restart list numbering in the document.xml and Numbering.xml  -->
            </xsl:when>
        </xsl:choose>

    </xsl:template>    
    
        
    <xsl:template name="BasedonNumbering">
        <xsl:param name="basedOn"/>
        <xsl:for-each select="//ParagraphStyle[@Name = $basedOn]">
<!--            <xsl:variable name="FoName" select="./@Name"/>-->
            <xsl:variable name="CurrbasedOn">
                <xsl:choose>
                    <xsl:when test="contains(descendant::Properties/BasedOn,'ParagraphStyle/')">
                        <xsl:value-of select="substring-after(descendant::Properties/BasedOn,'ParagraphStyle/')"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="descendant::Properties/BasedOn"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:variable name="BasedonBulletsAndNumberingListType">
                <xsl:if test="not(@BulletsAndNumberingListType)">
                    <xsl:value-of select="'true'"/>
                </xsl:if>
            </xsl:variable>
            <xsl:variable name="ListID">
                <xsl:number level="any"/>
                <!--<xsl:number level="any"/>-->
            </xsl:variable>
           <!-- <xsl:choose>
                <xsl:when test="$FoName = $basedOn">-->
                    <xsl:choose>
                        <xsl:when test="$BasedonBulletsAndNumberingListType = 'true'">
                            <xsl:call-template name="BasedonNumbering">
                                <xsl:with-param name="basedOn" select="$CurrbasedOn"/>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$ListID"/>
                        </xsl:otherwise>
                    </xsl:choose>
                <!--</xsl:when>
            </xsl:choose>-->
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="color">
        <xsl:param name="colorName"/>
        <xsl:for-each select="$Graphic//Color[@Self eq $colorName]">
           <!-- <xsl:choose>
                <xsl:when test="./@Self eq $colorName">-->
                    <xsl:if test="./@Space eq 'CMYK'">
                    <xsl:variable name="CMYK" as="xs:string*" select="tokenize(./@ColorValue,' ')"/>
                    <xsl:variable name="C" select="number($CMYK[1])"/>
                    <xsl:variable name="M" select="number($CMYK[2])"/>
                    <xsl:variable name="Y" select="number($CMYK[3])"/>
                    <xsl:variable name="K" select="number($CMYK[4])"/>
                    <xsl:variable name="Cdiv" select="$C div 100"/>
                    <xsl:variable name="Mdiv" select="$M div 100"/>
                    <xsl:variable name="Ydiv" select="$Y div 100"/>
                    <xsl:variable name="Kdiv" select="$K div 100"/>
                    <xsl:variable name="R" select="(255 * (1-$Cdiv) * (1-$Kdiv)) div 16"/>
                    <xsl:variable name="G" select="(255 * (1-$Mdiv) * (1-$Kdiv)) div 16"/>
                    <xsl:variable name="B" select="(255 * (1-$Ydiv) * (1-$Kdiv)) div 16"/>
                    <xsl:variable name="R1">
                        <xsl:variable name="hex-digit1" select="substring($hex,floor((255 * (1-$Cdiv) * (1-$Kdiv))  div 16) + 1,1)"/>
                        <xsl:variable name="hex-digit2" select="substring($hex,(255 * (1-$Cdiv) * (1-$Kdiv))  mod 16 + 1,1)"/>
                        <xsl:value-of select="concat($hex-digit1,$hex-digit2)"/>
                    </xsl:variable>
                    <xsl:variable name="G1">
                        <xsl:variable name="hex-digit1" select="substring($hex,floor((255 * (1-$Mdiv) * (1-$Kdiv))  div 16) + 1,1)"/>
                        <xsl:variable name="hex-digit2" select="substring($hex,(255 * (1-$Mdiv) * (1-$Kdiv))  mod 16 + 1,1)"/>
                        <xsl:value-of select="concat($hex-digit1,$hex-digit2)"/>
                    </xsl:variable>
                    <xsl:variable name="B1">
                        <xsl:variable name="hex-digit1" select="substring($hex,floor((255 * (1-$Ydiv) * (1-$Kdiv))  div 16) + 1,1)"/>
                        <xsl:variable name="hex-digit2" select="substring($hex,(255 * (1-$Ydiv) * (1-$Kdiv))  mod 16 + 1,1)"/>
                        <xsl:value-of select="concat($hex-digit1,$hex-digit2)"/>
                    </xsl:variable>
                    <xsl:variable name="Rhex">
                        <xsl:variable name="Rstr" select="$R cast as xs:string"></xsl:variable>
                        <xsl:choose>
                            <xsl:when test="contains($Rstr,'.')">
                                <xsl:variable name="Rstr1" >
                                    <xsl:choose>
                                        <xsl:when test="((substring-before($Rstr,'.')) cast as xs:decimal) &lt;= 9">
                                            <xsl:value-of select="(substring-before($Rstr,'.'))"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Rstr,'.')) cast as xs:decimal) = 10">
                                            <xsl:value-of select="'A'"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Rstr,'.')) cast as xs:decimal) = 11">
                                            <xsl:value-of select="'B'"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Rstr,'.')) cast as xs:decimal) = 12">
                                            <xsl:value-of select="'C'"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Rstr,'.')) cast as xs:decimal) = 13">
                                            <xsl:value-of select="'D'"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Rstr,'.')) cast as xs:decimal) = 14">
                                            <xsl:value-of select="'E'"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Rstr,'.')) cast as xs:decimal) = 15">
                                            <xsl:value-of select="'F'"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:variable name="Rstr2" select="number(concat('0.',(substring-after($Rstr,'.'))))"/>
                                <xsl:variable name="Rstr3" >
                                    <xsl:variable name="Rstr4" select="round($Rstr2 * 16)"/>
                                    <xsl:choose>
                                        <xsl:when test="$Rstr4 &lt;= 9">
                                            <xsl:value-of select="$Rstr4"/>
                                        </xsl:when>
                                        <xsl:when test="$Rstr4 = 10">
                                            <xsl:value-of select="'A'"/>
                                        </xsl:when>
                                        <xsl:when test="$Rstr4 = 11">
                                            <xsl:value-of select="'B'"/>
                                        </xsl:when>
                                        <xsl:when test="$Rstr4 = 12">
                                            <xsl:value-of select="'C'"/>
                                        </xsl:when>
                                        <xsl:when test="$Rstr4 = 13">
                                            <xsl:value-of select="'D'"/>
                                        </xsl:when>
                                        <xsl:when test="$Rstr4 = 14">
                                            <xsl:value-of select="'E'"/>
                                        </xsl:when>
                                        <xsl:when test="$Rstr4 = 15">
                                            <xsl:value-of select="'F'"/>
                                        </xsl:when>
                                        <xsl:when test="$Rstr4 = 16">
                                            <xsl:value-of select="'16'"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:variable name="Rfin">
                                    <xsl:choose>
                                        <xsl:when test="$Rstr3 eq '16'">
                                            <xsl:variable name="ad">
                                                <xsl:choose>
                                                    <xsl:when test="$Rstr1 = 'A'">
                                                        <xsl:value-of select="10 + 1"/>
                                                    </xsl:when>
                                                    <xsl:when test="$Rstr1 = 'B'">
                                                        <xsl:value-of select="11 + 1"/>
                                                    </xsl:when>
                                                    <xsl:when test="$Rstr1 = 'C'">
                                                        <xsl:value-of select="12 + 1"/>
                                                    </xsl:when>
                                                    <xsl:when test="$Rstr1 = 'D'">
                                                        <xsl:value-of select="13 + 1"/>
                                                    </xsl:when>
                                                    <xsl:when test="$Rstr1 = 'E'">
                                                        <xsl:value-of select="14 + 1"/>
                                                    </xsl:when>
                                                    <xsl:when test="$Rstr1 = 'F'">
                                                        <xsl:value-of select="'F'"/>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:value-of select="$Rstr1 + 1"/>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:variable>
                                            <xsl:variable name="Rstr6" >
                                                <xsl:choose>
                                                    <xsl:when test="$ad&lt;= 9">
                                                        <xsl:value-of select="$ad"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 10">
                                                        <xsl:value-of select="'A'"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 11">
                                                        <xsl:value-of select="'B'"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 12">
                                                        <xsl:value-of select="'C'"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 13">
                                                        <xsl:value-of select="'D'"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 14">
                                                        <xsl:value-of select="'E'"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 15">
                                                        <xsl:value-of select="'F'"/>
                                                    </xsl:when>
                                                </xsl:choose>
                                            </xsl:variable>
                                        <xsl:value-of select="$Rstr6"/>
                                        <xsl:value-of select="'0'"/>
                                        </xsl:when>
                                        <xsl:otherwise> 
                                            <xsl:value-of select="$Rstr1"/>
                                            <xsl:value-of select="$Rstr3"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:variable>
                               <xsl:value-of select="$Rfin"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:variable name="Rstr5">
                                    <xsl:choose>
                                        <xsl:when test="($Rstr cast as xs:decimal) &lt;= 9">
                                            <xsl:value-of select="concat('0',$Rstr)"/>
                                        </xsl:when>
                                        <xsl:when test="($Rstr cast as xs:decimal) = 10">
                                            <xsl:value-of select="'0A'"/>
                                        </xsl:when>
                                        <xsl:when test="($Rstr cast as xs:decimal) = 11">
                                            <xsl:value-of select="'0B'"/>
                                        </xsl:when>
                                        <xsl:when test="($Rstr cast as xs:decimal) = 12">
                                            <xsl:value-of select="'0C'"/>
                                        </xsl:when>
                                        <xsl:when test="($Rstr cast as xs:decimal) = 13">
                                            <xsl:value-of select="'0D'"/>
                                        </xsl:when>
                                        <xsl:when test="($Rstr cast as xs:decimal) = 14">
                                            <xsl:value-of select="'0E'"/>
                                        </xsl:when>
                                        <xsl:when test="($Rstr cast as xs:decimal) = 15">
                                            <xsl:value-of select="'0F'"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:value-of select="$Rstr5"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <xsl:variable name="Ghex">
                        <xsl:variable name="Gstr" select="$G cast as xs:string"></xsl:variable>
                        <xsl:choose>
                            <xsl:when test="contains($Gstr,'.')">
                                <xsl:variable name="Gstr1" >
                                    <xsl:choose>
                                        <xsl:when test="((substring-before($Gstr,'.')) cast as xs:decimal) &lt;= 9">
                                            <xsl:value-of select="(substring-before($Gstr,'.'))"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Gstr,'.')) cast as xs:decimal) = 10">
                                            <xsl:value-of select="'A'"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Gstr,'.')) cast as xs:decimal) = 11">
                                            <xsl:value-of select="'B'"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Gstr,'.')) cast as xs:decimal) = 12">
                                            <xsl:value-of select="'C'"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Gstr,'.')) cast as xs:decimal) = 13">
                                            <xsl:value-of select="'D'"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Gstr,'.')) cast as xs:decimal) = 14">
                                            <xsl:value-of select="'E'"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Gstr,'.')) cast as xs:decimal) = 15">
                                            <xsl:value-of select="'F'"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:variable name="Gstr2" select="number(concat('0.',(substring-after($Gstr,'.'))))"/>
                                <xsl:variable name="Gstr3" >
                                    <xsl:variable name="Gstr4" select="round($Gstr2 * 16)"></xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$Gstr4 &lt;= 9">
                                            <xsl:value-of select="$Gstr4"/>
                                        </xsl:when>
                                        <xsl:when test="$Gstr4 = 10">
                                            <xsl:value-of select="'A'"/>
                                        </xsl:when>
                                        <xsl:when test="$Gstr4 = 11">
                                            <xsl:value-of select="'B'"/>
                                        </xsl:when>
                                        <xsl:when test="$Gstr4 = 12">
                                            <xsl:value-of select="'C'"/>
                                        </xsl:when>
                                        <xsl:when test="$Gstr4 = 13">
                                            <xsl:value-of select="'D'"/>
                                        </xsl:when>
                                        <xsl:when test="$Gstr4 = 14">
                                            <xsl:value-of select="'E'"/>
                                        </xsl:when>
                                        <xsl:when test="$Gstr4 = 15">
                                            <xsl:value-of select="'F'"/>
                                        </xsl:when>
                                        <xsl:when test="$Gstr4 = 16">
                                            <xsl:value-of select="'16'"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:variable name="Gfin">
                                    <xsl:choose>
                                        <xsl:when test="$Gstr3 eq '16'">
                                            <xsl:variable name="ad">
                                                <xsl:choose>
                                                    <xsl:when test="$Gstr1 = 'A'">
                                                        <xsl:value-of select="10 + 1"/>
                                                    </xsl:when>
                                                    <xsl:when test="$Gstr1 = 'B'">
                                                        <xsl:value-of select="11 + 1"/>
                                                    </xsl:when>
                                                    <xsl:when test="$Gstr1 = 'C'">
                                                        <xsl:value-of select="12 + 1"/>
                                                    </xsl:when>
                                                    <xsl:when test="$Gstr1 = 'D'">
                                                        <xsl:value-of select="13 + 1"/>
                                                    </xsl:when>
                                                    <xsl:when test="$Gstr1 = 'E'">
                                                        <xsl:value-of select="14 + 1"/>
                                                    </xsl:when>
                                                    <xsl:when test="$Gstr1 = 'F'">
                                                        <xsl:value-of select="'F'"/>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:value-of select="$Gstr1 + 1"/>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:variable>
                                            <xsl:variable name="Gstr6" >
                                                <xsl:choose>
                                                    <xsl:when test="$ad&lt;= 9">
                                                        <xsl:value-of select="$ad"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 10">
                                                        <xsl:value-of select="'A'"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 11">
                                                        <xsl:value-of select="'B'"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 12">
                                                        <xsl:value-of select="'C'"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 13">
                                                        <xsl:value-of select="'D'"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 14">
                                                        <xsl:value-of select="'E'"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 15">
                                                        <xsl:value-of select="'F'"/>
                                                    </xsl:when>
                                                </xsl:choose>
                                            </xsl:variable>
                                            <xsl:value-of select="$Gstr6"/>
                                            <xsl:value-of select="'0'"/>
                                        </xsl:when>
                                        <xsl:otherwise> 
                                            <xsl:value-of select="$Gstr1"/>
                                            <xsl:value-of select="$Gstr3"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:value-of select="$Gfin"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:variable name="Gstr5">
                                    <xsl:choose>
                                        <xsl:when test="($Gstr cast as xs:decimal) &lt;= 9">
                                            <xsl:value-of select="concat('0',$Gstr)"/>
                                        </xsl:when>
                                        <xsl:when test="($Gstr cast as xs:decimal) = 10">
                                            <xsl:value-of select="'0A'"/>
                                        </xsl:when>
                                        <xsl:when test="($Gstr cast as xs:decimal) = 11">
                                            <xsl:value-of select="'0B'"/>
                                        </xsl:when>
                                        <xsl:when test="($Gstr cast as xs:decimal) = 12">
                                            <xsl:value-of select="'0C'"/>
                                        </xsl:when>
                                        <xsl:when test="($Gstr cast as xs:decimal) = 13">
                                            <xsl:value-of select="'0D'"/>
                                        </xsl:when>
                                        <xsl:when test="($Gstr cast as xs:decimal) = 14">
                                            <xsl:value-of select="'0E'"/>
                                        </xsl:when>
                                        <xsl:when test="($Gstr cast as xs:decimal) = 15">
                                            <xsl:value-of select="'0F'"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:value-of select="$Gstr5"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <xsl:variable name="Bhex">
                        <xsl:variable name="Bstr" select="$B cast as xs:string"></xsl:variable>
                        <xsl:choose>
                            <xsl:when test="contains($Bstr,'.')">
                                <xsl:variable name="Bstr1" >
                                    <xsl:choose>
                                        <xsl:when test="((substring-before($Bstr,'.')) cast as xs:decimal) &lt;= 9">
                                            <xsl:value-of select="(substring-before($Bstr,'.'))"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Bstr,'.')) cast as xs:decimal) = 10">
                                            <xsl:value-of select="'A'"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Bstr,'.')) cast as xs:decimal) = 11">
                                            <xsl:value-of select="'B'"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Bstr,'.')) cast as xs:decimal) = 12">
                                            <xsl:value-of select="'C'"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Bstr,'.')) cast as xs:decimal) = 13">
                                            <xsl:value-of select="'D'"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Bstr,'.')) cast as xs:decimal) = 14">
                                            <xsl:value-of select="'E'"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Bstr,'.')) cast as xs:decimal) = 15">
                                            <xsl:value-of select="'F'"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:variable name="Bstr2" select="number(concat('0.',(substring-after($Bstr,'.'))))"/>
                                <xsl:variable name="Bstr3" >
                                    <xsl:variable name="Bstr4" select="round($Bstr2 * 16)"></xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$Bstr4 &lt;= 9">
                                            <xsl:value-of select="$Bstr4"/>
                                        </xsl:when>
                                        <xsl:when test="$Bstr4 = 10">
                                            <xsl:value-of select="'A'"/>
                                        </xsl:when>
                                        <xsl:when test="$Bstr4 = 11">
                                            <xsl:value-of select="'B'"/>
                                        </xsl:when>
                                        <xsl:when test="$Bstr4 = 12">
                                            <xsl:value-of select="'C'"/>
                                        </xsl:when>
                                        <xsl:when test="$Bstr4 = 13">
                                            <xsl:value-of select="'D'"/>
                                        </xsl:when>
                                        <xsl:when test="$Bstr4 = 14">
                                            <xsl:value-of select="'E'"/>
                                        </xsl:when>
                                        <xsl:when test="$Bstr4 = 15">
                                            <xsl:value-of select="'F'"/>
                                        </xsl:when>
                                        <xsl:when test="$Bstr4 = 16">
                                            <xsl:value-of select="'16'"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:variable name="Bfin">
                                    <xsl:choose>
                                        <xsl:when test="$Bstr3 eq '16'">
                                            <xsl:variable name="ad">
                                                <xsl:choose>
                                                    <xsl:when test="$Bstr1 = 'A'">
                                                        <xsl:value-of select="10 + 1"/>
                                                    </xsl:when>
                                                    <xsl:when test="$Bstr1 = 'B'">
                                                        <xsl:value-of select="11 + 1"/>
                                                    </xsl:when>
                                                    <xsl:when test="$Bstr1 = 'C'">
                                                        <xsl:value-of select="12 + 1"/>
                                                    </xsl:when>
                                                    <xsl:when test="$Bstr1 = 'D'">
                                                        <xsl:value-of select="13 + 1"/>
                                                    </xsl:when>
                                                    <xsl:when test="$Bstr1 = 'E'">
                                                        <xsl:value-of select="14 + 1"/>
                                                    </xsl:when>
                                                    <xsl:when test="$Bstr1 = 'F'">
                                                        <xsl:value-of select="'F'"/>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:value-of select="$Bstr1 + 1"/>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:variable>
                                            <xsl:variable name="Bstr6" >
                                                <xsl:choose>
                                                    <xsl:when test="$ad&lt;= 9">
                                                        <xsl:value-of select="$ad"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 10">
                                                        <xsl:value-of select="'A'"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 11">
                                                        <xsl:value-of select="'B'"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 12">
                                                        <xsl:value-of select="'C'"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 13">
                                                        <xsl:value-of select="'D'"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 14">
                                                        <xsl:value-of select="'E'"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 15">
                                                        <xsl:value-of select="'F'"/>
                                                    </xsl:when>
                                                </xsl:choose>
                                            </xsl:variable>
                                            <xsl:value-of select="$Bstr6"/>
                                            <xsl:value-of select="'0'"/>
                                        </xsl:when>
                                        <xsl:otherwise> 
                                            <xsl:value-of select="$Bstr1"/>
                                            <xsl:value-of select="$Bstr3"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:value-of select="$Bfin"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:variable name="Bstr5">
                                    <xsl:choose>
                                        <xsl:when test="($Bstr cast as xs:decimal) &lt;= 9">
                                            <xsl:value-of select="concat('0',$Bstr)"/>
                                        </xsl:when>
                                        <xsl:when test="($Bstr cast as xs:decimal) = 10">
                                            <xsl:value-of select="'0A'"/>
                                        </xsl:when>
                                        <xsl:when test="($Bstr cast as xs:decimal) = 11">
                                            <xsl:value-of select="'0B'"/>
                                        </xsl:when>
                                        <xsl:when test="($Bstr cast as xs:decimal) = 12">
                                            <xsl:value-of select="'0C'"/>
                                        </xsl:when>
                                        <xsl:when test="($Bstr cast as xs:decimal) = 13">
                                            <xsl:value-of select="'0D'"/>
                                        </xsl:when>
                                        <xsl:when test="($Bstr cast as xs:decimal) = 14">
                                            <xsl:value-of select="'0E'"/>
                                        </xsl:when>
                                        <xsl:when test="($Bstr cast as xs:decimal) = 15">
                                            <xsl:value-of select="'0F'"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:value-of select="$Bstr5"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    
                        <xsl:variable name="RInteger">
                            <xsl:call-template name="hex2num">
                                <xsl:with-param name="hex" select="$Rhex"/>
                            </xsl:call-template>
                        </xsl:variable>
                        <xsl:variable name="GInteger">
                            <xsl:call-template name="hex2num">
                                <xsl:with-param name="hex" select="$Ghex"/>
                            </xsl:call-template>
                        </xsl:variable>
                        <xsl:variable name="BInteger">
                            <xsl:call-template name="hex2num">
                                <xsl:with-param name="hex" select="$Bhex"/>
                            </xsl:call-template>
                        </xsl:variable>
                        
                        
                        <xsl:choose>
                            <!--   Checking whether the color value is white -->
                            <xsl:when test="($RInteger &gt; 229 and $RInteger &lt;= 255) and ($GInteger &gt; 229 and $GInteger &lt;= 255) and ($BInteger &gt; 229 and $BInteger &lt;= 255) ">
                               <!-- <xsl:element name="w:color">
                                    <xsl:attribute name="w:val" select="'000000'"/>
                                </xsl:element>-->
                                <xsl:value-of select="'000000'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <!--<xsl:element name="w:color">
                                    <xsl:attribute name="w:val" select="concat($Rhex,$Ghex,$Bhex)"/>
                                </xsl:element>-->
                                <xsl:value-of select="concat($Rhex,$Ghex,$Bhex)"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:if>
                    <xsl:if test="./@Space eq 'RGB'">
                    <xsl:variable name="RGB" as="xs:string*" select="tokenize(./@ColorValue,' ')"/>
    
                    <xsl:variable name="R" select="number($RGB[1])"/>
                    <xsl:variable name="G" select="number($RGB[2])"/>
                    <xsl:variable name="B" select="number($RGB[3])"/>
                    
                    <xsl:variable name="R1">
                        <xsl:variable name="hex-digit1" select="substring($hex,floor($R  div 16) + 1,1)"/>
                        <xsl:variable name="hex-digit2" select="substring($hex,$R  mod 16 + 1,1)"/>
                        <xsl:value-of select="concat($hex-digit1,$hex-digit2)"/>
                    </xsl:variable>
                    <xsl:variable name="G1">
                        <xsl:variable name="hex-digit1" select="substring($hex,floor($G  div 16) + 1,1)"/>
                        <xsl:variable name="hex-digit2" select="substring($hex,$G  mod 16 + 1,1)"/>
                        <xsl:value-of select="concat($hex-digit1,$hex-digit2)"/>
                    </xsl:variable>
                    <xsl:variable name="B1">
                        <xsl:variable name="hex-digit1" select="substring($hex,floor($B  div 16) + 1,1)"/>
                        <xsl:variable name="hex-digit2" select="substring($hex,$B  mod 16 + 1,1)"/>
                        <xsl:value-of select="concat($hex-digit1,$hex-digit2)"/>
                    </xsl:variable>
                
                <xsl:variable name="Rhex">
                    <xsl:variable name="Rstr" select="$R cast as xs:string"></xsl:variable>
                    <xsl:choose>
                        <xsl:when test="contains($Rstr,'.')">
                            <xsl:variable name="Rstr1" >
                                <xsl:choose>
                                    <xsl:when test="((substring-before($Rstr,'.')) cast as xs:decimal) &lt;= 9">
                                        <xsl:value-of select="(substring-before($Rstr,'.'))"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Rstr,'.')) cast as xs:decimal) = 10">
                                        <xsl:value-of select="'A'"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Rstr,'.')) cast as xs:decimal) = 11">
                                        <xsl:value-of select="'B'"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Rstr,'.')) cast as xs:decimal) = 12">
                                        <xsl:value-of select="'C'"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Rstr,'.')) cast as xs:decimal) = 13">
                                        <xsl:value-of select="'D'"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Rstr,'.')) cast as xs:decimal) = 14">
                                        <xsl:value-of select="'E'"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Rstr,'.')) cast as xs:decimal) = 15">
                                        <xsl:value-of select="'F'"/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:variable name="Rstr2" select="number(concat('0.',(substring-after($Rstr,'.'))))"/>
                            <xsl:variable name="Rstr3" >
                                <xsl:variable name="Rstr4" select="round($Rstr2 * 16)"/>
                                <xsl:choose>
                                    <xsl:when test="$Rstr4 &lt;= 9">
                                        <xsl:value-of select="$Rstr4"/>
                                    </xsl:when>
                                    <xsl:when test="$Rstr4 = 10">
                                        <xsl:value-of select="'A'"/>
                                    </xsl:when>
                                    <xsl:when test="$Rstr4 = 11">
                                        <xsl:value-of select="'B'"/>
                                    </xsl:when>
                                    <xsl:when test="$Rstr4 = 12">
                                        <xsl:value-of select="'C'"/>
                                    </xsl:when>
                                    <xsl:when test="$Rstr4 = 13">
                                        <xsl:value-of select="'D'"/>
                                    </xsl:when>
                                    <xsl:when test="$Rstr4 = 14">
                                        <xsl:value-of select="'E'"/>
                                    </xsl:when>
                                    <xsl:when test="$Rstr4 = 15">
                                        <xsl:value-of select="'F'"/>
                                    </xsl:when>
                                    <xsl:when test="$Rstr4 = 16">
                                        <xsl:value-of select="'16'"/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:variable name="Rfin">
                                <xsl:choose>
                                    <xsl:when test="$Rstr3 eq '16'">
                                        <xsl:variable name="ad">
                                            <xsl:choose>
                                                <xsl:when test="$Rstr1 = 'A'">
                                                    <xsl:value-of select="10 + 1"/>
                                                </xsl:when>
                                                <xsl:when test="$Rstr1 = 'B'">
                                                    <xsl:value-of select="11 + 1"/>
                                                </xsl:when>
                                                <xsl:when test="$Rstr1 = 'C'">
                                                    <xsl:value-of select="12 + 1"/>
                                                </xsl:when>
                                                <xsl:when test="$Rstr1 = 'D'">
                                                    <xsl:value-of select="13 + 1"/>
                                                </xsl:when>
                                                <xsl:when test="$Rstr1 = 'E'">
                                                    <xsl:value-of select="14 + 1"/>
                                                </xsl:when>
                                                <xsl:when test="$Rstr1 = 'F'">
                                                    <xsl:value-of select="'F'"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="$Rstr1 + 1"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>
                                        <xsl:variable name="Rstr6" >
                                            <xsl:choose>
                                                <xsl:when test="$ad&lt;= 9">
                                                    <xsl:value-of select="$ad"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 10">
                                                    <xsl:value-of select="'A'"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 11">
                                                    <xsl:value-of select="'B'"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 12">
                                                    <xsl:value-of select="'C'"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 13">
                                                    <xsl:value-of select="'D'"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 14">
                                                    <xsl:value-of select="'E'"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 15">
                                                    <xsl:value-of select="'F'"/>
                                                </xsl:when>
                                            </xsl:choose>
                                        </xsl:variable>
                                    <xsl:value-of select="$Rstr6"/>
                                    <xsl:value-of select="'0'"/>
                                    </xsl:when>
                                    <xsl:otherwise> 
                                        <xsl:value-of select="$Rstr1"/>
                                        <xsl:value-of select="$Rstr3"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:variable>
                           <xsl:value-of select="$Rfin"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:variable name="Rstr5">
                                <xsl:choose>
                                    <xsl:when test="($Rstr cast as xs:decimal) &lt;= 9">
                                        <xsl:value-of select="concat('0',$Rstr)"/>
                                    </xsl:when>
                                    <xsl:when test="($Rstr cast as xs:decimal) = 10">
                                        <xsl:value-of select="'0A'"/>
                                    </xsl:when>
                                    <xsl:when test="($Rstr cast as xs:decimal) = 11">
                                        <xsl:value-of select="'0B'"/>
                                    </xsl:when>
                                    <xsl:when test="($Rstr cast as xs:decimal) = 12">
                                        <xsl:value-of select="'0C'"/>
                                    </xsl:when>
                                    <xsl:when test="($Rstr cast as xs:decimal) = 13">
                                        <xsl:value-of select="'0D'"/>
                                    </xsl:when>
                                    <xsl:when test="($Rstr cast as xs:decimal) = 14">
                                        <xsl:value-of select="'0E'"/>
                                    </xsl:when>
                                    <xsl:when test="($Rstr cast as xs:decimal) = 15">
                                        <xsl:value-of select="'0F'"/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:value-of select="$Rstr5"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="Ghex">
                    <xsl:variable name="Gstr" select="$G cast as xs:string"></xsl:variable>
                    <xsl:choose>
                        <xsl:when test="contains($Gstr,'.')">
                            <xsl:variable name="Gstr1" >
                                <xsl:choose>
                                    <xsl:when test="((substring-before($Gstr,'.')) cast as xs:decimal) &lt;= 9">
                                        <xsl:value-of select="(substring-before($Gstr,'.'))"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Gstr,'.')) cast as xs:decimal) = 10">
                                        <xsl:value-of select="'A'"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Gstr,'.')) cast as xs:decimal) = 11">
                                        <xsl:value-of select="'B'"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Gstr,'.')) cast as xs:decimal) = 12">
                                        <xsl:value-of select="'C'"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Gstr,'.')) cast as xs:decimal) = 13">
                                        <xsl:value-of select="'D'"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Gstr,'.')) cast as xs:decimal) = 14">
                                        <xsl:value-of select="'E'"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Gstr,'.')) cast as xs:decimal) = 15">
                                        <xsl:value-of select="'F'"/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:variable name="Gstr2" select="number(concat('0.',(substring-after($Gstr,'.'))))"/>
                            <xsl:variable name="Gstr3" >
                                <xsl:variable name="Gstr4" select="round($Gstr2 * 16)"></xsl:variable>
                                <xsl:choose>
                                    <xsl:when test="$Gstr4 &lt;= 9">
                                        <xsl:value-of select="$Gstr4"/>
                                    </xsl:when>
                                    <xsl:when test="$Gstr4 = 10">
                                        <xsl:value-of select="'A'"/>
                                    </xsl:when>
                                    <xsl:when test="$Gstr4 = 11">
                                        <xsl:value-of select="'B'"/>
                                    </xsl:when>
                                    <xsl:when test="$Gstr4 = 12">
                                        <xsl:value-of select="'C'"/>
                                    </xsl:when>
                                    <xsl:when test="$Gstr4 = 13">
                                        <xsl:value-of select="'D'"/>
                                    </xsl:when>
                                    <xsl:when test="$Gstr4 = 14">
                                        <xsl:value-of select="'E'"/>
                                    </xsl:when>
                                    <xsl:when test="$Gstr4 = 15">
                                        <xsl:value-of select="'F'"/>
                                    </xsl:when>
                                    <xsl:when test="$Gstr4 = 16">
                                        <xsl:value-of select="'16'"/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:variable name="Gfin">
                                <xsl:choose>
                                    <xsl:when test="$Gstr3 eq '16'">
                                        <xsl:variable name="ad">
                                            <xsl:choose>
                                                <xsl:when test="$Gstr1 = 'A'">
                                                    <xsl:value-of select="10 + 1"/>
                                                </xsl:when>
                                                <xsl:when test="$Gstr1 = 'B'">
                                                    <xsl:value-of select="11 + 1"/>
                                                </xsl:when>
                                                <xsl:when test="$Gstr1 = 'C'">
                                                    <xsl:value-of select="12 + 1"/>
                                                </xsl:when>
                                                <xsl:when test="$Gstr1 = 'D'">
                                                    <xsl:value-of select="13 + 1"/>
                                                </xsl:when>
                                                <xsl:when test="$Gstr1 = 'E'">
                                                    <xsl:value-of select="14 + 1"/>
                                                </xsl:when>
                                                <xsl:when test="$Gstr1 = 'F'">
                                                    <xsl:value-of select="'F'"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="$Gstr1 + 1"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>
                                        <xsl:variable name="Gstr6" >
                                            <xsl:choose>
                                                <xsl:when test="$ad&lt;= 9">
                                                    <xsl:value-of select="$ad"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 10">
                                                    <xsl:value-of select="'A'"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 11">
                                                    <xsl:value-of select="'B'"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 12">
                                                    <xsl:value-of select="'C'"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 13">
                                                    <xsl:value-of select="'D'"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 14">
                                                    <xsl:value-of select="'E'"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 15">
                                                    <xsl:value-of select="'F'"/>
                                                </xsl:when>
                                            </xsl:choose>
                                        </xsl:variable>
                                        <xsl:value-of select="$Gstr6"/>
                                        <xsl:value-of select="'0'"/>
                                    </xsl:when>
                                    <xsl:otherwise> 
                                        <xsl:value-of select="$Gstr1"/>
                                        <xsl:value-of select="$Gstr3"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:value-of select="$Gfin"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:variable name="Gstr5">
                                <xsl:choose>
                                    <xsl:when test="($Gstr cast as xs:decimal) &lt;= 9">
                                        <xsl:value-of select="concat('0',$Gstr)"/>
                                    </xsl:when>
                                    <xsl:when test="($Gstr cast as xs:decimal) = 10">
                                        <xsl:value-of select="'0A'"/>
                                    </xsl:when>
                                    <xsl:when test="($Gstr cast as xs:decimal) = 11">
                                        <xsl:value-of select="'0B'"/>
                                    </xsl:when>
                                    <xsl:when test="($Gstr cast as xs:decimal) = 12">
                                        <xsl:value-of select="'0C'"/>
                                    </xsl:when>
                                    <xsl:when test="($Gstr cast as xs:decimal) = 13">
                                        <xsl:value-of select="'0D'"/>
                                    </xsl:when>
                                    <xsl:when test="($Gstr cast as xs:decimal) = 14">
                                        <xsl:value-of select="'0E'"/>
                                    </xsl:when>
                                    <xsl:when test="($Gstr cast as xs:decimal) = 15">
                                        <xsl:value-of select="'0F'"/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:value-of select="$Gstr5"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="Bhex">
                    <xsl:variable name="Bstr" select="$B cast as xs:string"></xsl:variable>
                    <xsl:choose>
                        <xsl:when test="contains($Bstr,'.')">
                            <xsl:variable name="Bstr1" >
                                <xsl:choose>
                                    <xsl:when test="((substring-before($Bstr,'.')) cast as xs:decimal) &lt;= 9">
                                        <xsl:value-of select="(substring-before($Bstr,'.'))"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Bstr,'.')) cast as xs:decimal) = 10">
                                        <xsl:value-of select="'A'"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Bstr,'.')) cast as xs:decimal) = 11">
                                        <xsl:value-of select="'B'"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Bstr,'.')) cast as xs:decimal) = 12">
                                        <xsl:value-of select="'C'"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Bstr,'.')) cast as xs:decimal) = 13">
                                        <xsl:value-of select="'D'"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Bstr,'.')) cast as xs:decimal) = 14">
                                        <xsl:value-of select="'E'"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Bstr,'.')) cast as xs:decimal) = 15">
                                        <xsl:value-of select="'F'"/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:variable name="Bstr2" select="number(concat('0.',(substring-after($Bstr,'.'))))"/>
                            <xsl:variable name="Bstr3" >
                                <xsl:variable name="Bstr4" select="round($Bstr2 * 16)"></xsl:variable>
                                <xsl:choose>
                                    <xsl:when test="$Bstr4 &lt;= 9">
                                        <xsl:value-of select="$Bstr4"/>
                                    </xsl:when>
                                    <xsl:when test="$Bstr4 = 10">
                                        <xsl:value-of select="'A'"/>
                                    </xsl:when>
                                    <xsl:when test="$Bstr4 = 11">
                                        <xsl:value-of select="'B'"/>
                                    </xsl:when>
                                    <xsl:when test="$Bstr4 = 12">
                                        <xsl:value-of select="'C'"/>
                                    </xsl:when>
                                    <xsl:when test="$Bstr4 = 13">
                                        <xsl:value-of select="'D'"/>
                                    </xsl:when>
                                    <xsl:when test="$Bstr4 = 14">
                                        <xsl:value-of select="'E'"/>
                                    </xsl:when>
                                    <xsl:when test="$Bstr4 = 15">
                                        <xsl:value-of select="'F'"/>
                                    </xsl:when>
                                    <xsl:when test="$Bstr4 = 16">
                                        <xsl:value-of select="'16'"/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:variable name="Bfin">
                                <xsl:choose>
                                    <xsl:when test="$Bstr3 eq '16'">
                                        <xsl:variable name="ad">
                                            <xsl:choose>
                                                <xsl:when test="$Bstr1 = 'A'">
                                                    <xsl:value-of select="10 + 1"/>
                                                </xsl:when>
                                                <xsl:when test="$Bstr1 = 'B'">
                                                    <xsl:value-of select="11 + 1"/>
                                                </xsl:when>
                                                <xsl:when test="$Bstr1 = 'C'">
                                                    <xsl:value-of select="12 + 1"/>
                                                </xsl:when>
                                                <xsl:when test="$Bstr1 = 'D'">
                                                    <xsl:value-of select="13 + 1"/>
                                                </xsl:when>
                                                <xsl:when test="$Bstr1 = 'E'">
                                                    <xsl:value-of select="14 + 1"/>
                                                </xsl:when>
                                                <xsl:when test="$Bstr1 = 'F'">
                                                    <xsl:value-of select="'F'"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="$Bstr1 + 1"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>
                                        <xsl:variable name="Bstr6" >
                                            <xsl:choose>
                                                <xsl:when test="$ad&lt;= 9">
                                                    <xsl:value-of select="$ad"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 10">
                                                    <xsl:value-of select="'A'"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 11">
                                                    <xsl:value-of select="'B'"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 12">
                                                    <xsl:value-of select="'C'"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 13">
                                                    <xsl:value-of select="'D'"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 14">
                                                    <xsl:value-of select="'E'"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 15">
                                                    <xsl:value-of select="'F'"/>
                                                </xsl:when>
                                            </xsl:choose>
                                        </xsl:variable>
                                        <xsl:value-of select="$Bstr6"/>
                                        <xsl:value-of select="'0'"/>
                                    </xsl:when>
                                    <xsl:otherwise> 
                                        <xsl:value-of select="$Bstr1"/>
                                        <xsl:value-of select="$Bstr3"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:value-of select="$Bfin"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:variable name="Bstr5">
                                <xsl:choose>
                                    <xsl:when test="($Bstr cast as xs:decimal) &lt;= 9">
                                        <xsl:value-of select="concat('0',$Bstr)"/>
                                    </xsl:when>
                                    <xsl:when test="($Bstr cast as xs:decimal) = 10">
                                        <xsl:value-of select="'0A'"/>
                                    </xsl:when>
                                    <xsl:when test="($Bstr cast as xs:decimal) = 11">
                                        <xsl:value-of select="'0B'"/>
                                    </xsl:when>
                                    <xsl:when test="($Bstr cast as xs:decimal) = 12">
                                        <xsl:value-of select="'0C'"/>
                                    </xsl:when>
                                    <xsl:when test="($Bstr cast as xs:decimal) = 13">
                                        <xsl:value-of select="'0D'"/>
                                    </xsl:when>
                                    <xsl:when test="($Bstr cast as xs:decimal) = 14">
                                        <xsl:value-of select="'0E'"/>
                                    </xsl:when>
                                    <xsl:when test="($Bstr cast as xs:decimal) = 15">
                                        <xsl:value-of select="'0F'"/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:value-of select="$Bstr5"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                
                    <xsl:choose>
                        <!--   Checking whether the color value is white -->
                        <xsl:when test="($R &gt; 229 and $R &lt;= 255) and ($G &gt; 229 and $G &lt;= 255) and ($B &gt; 229 and $B &lt;= 255) ">
                            <!--<xsl:element name="w:color">
                                <xsl:attribute name="w:val" select="'000000'"/>
                            </xsl:element>-->
                            <xsl:value-of select="'000000'"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <!--<xsl:element name="w:color">
                                <xsl:attribute name="w:val" select="concat($Rhex,$Ghex,$Bhex)"/>
                            </xsl:element>-->
                            <!--<xsl:value-of select="concat($Rhex,$Ghex,$Bhex)"/>-->
                            <xsl:value-of select="concat($R1,$G1,$B1)"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    </xsl:if>
                <!--</xsl:when>
            </xsl:choose>-->
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
