<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf" exclude-result-prefixes="xs mf idPkg" 
    xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
    xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"
    xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" xmlns:v="urn:schemas-microsoft-com:vml"
    xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing" xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" 
    xmlns:w10="urn:schemas-microsoft-com:office:word" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml" xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup" 
    xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk" xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml"
    xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape"  xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" 
    xmlns:math="http://exslt.org/math" extension-element-prefixes="math" xmlns:pic="http://schemas.openxmlformats.org/drawingml/2006/picture"
    xmlns:a14="http://schemas.microsoft.com/office/drawing/2010/main" xmlns:idPkg="http://ns.adobe.com/AdobeInDesign/idml/1.0/packaging"
    version="2.0">
    <!-- Added sorting issue by HyperlinkTextSourceon 10-1-2022 -->
    <xsl:output method="xml" use-character-maps="Ascii2Unicode" indent="yes" xml:space="preserve" name="xml"/>
    <xsl:strip-space elements="*"/>
    <xsl:preserve-space elements="Content"/>
    <xsl:variable name="Graphic" select="document('Graphic.xml')"/>
    <xsl:variable name="linkedStyle" select="document('linked.xml')"/>
    <xsl:variable name="hex" >0123456789ABCDEF</xsl:variable>
   
    <xsl:template match="/">
        <xsl:variable name="M" select="."/>
        <w:comments xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas"
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
            <!--            <xsl:apply-templates select="//STORIES/STORY"/>-->
            <xsl:apply-templates select="//Note"/>
        </w:comments>
    </xsl:template>

    <!--<xsl:template match="STORIES/STORY">
        <xsl:variable name="M" select="."/>

            <xsl:apply-templates select="document($M)//Note"/>

    </xsl:template>-->



    <xsl:template match="Note">
        <xsl:element name="w:comment">
            <xsl:attribute name="w:id">
                <!--<xsl:number level="any" />-->
                <xsl:value-of select="@NoteNo"/>
            </xsl:attribute>
            <xsl:attribute name="w:author" select="@AppliedDocumentUser"/>
            <xsl:attribute name="w:date" select="@ModificationDate"/>
            <!-- 01-01-18: Added for to get sree's KeyValuePair id -->
            <xsl:if test="child::Properties/Label/KeyValuePair">
                <xsl:attribute name="data-noteID" select="child::Properties/Label/KeyValuePair/@Value"/>
            </xsl:if>
            <!-- 01-01-18: Added for to get sree's KeyValuePair id -->
                <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>


  <xsl:template match="ParagraphStyleRange">  
      
            <xsl:variable name="Na1">
                <xsl:choose>
                    <xsl:when test="contains(@AppliedParagraphStyle,'$ID/')">
                        <xsl:value-of select="substring-after(@AppliedParagraphStyle,'$ID/')"/>
                    </xsl:when>
                    <xsl:when test="contains(@AppliedParagraphStyle,'ParagraphStyle/')">
                        <xsl:value-of select="substring-after(@AppliedParagraphStyle,'ParagraphStyle/')"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="@AppliedParagraphStyle"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:variable name="FS1" select="@PointSize"/>
            <xsl:variable name="JC" select="@Justification"/>
            <xsl:variable name="FLI" select="@FirstLineIndent"/>
            <xsl:variable name="LI" select="@LeftIndent"/>
            <xsl:variable name="RI" select="@RightIndent"/>
            <xsl:variable name="SB4" select="@SpaceBefore"/>
            <xsl:variable name="SAF" select="@SpaceAfter"/>
            <xsl:variable name="C" select="@Capitalization"/>
            <xsl:variable name="LS" select="Properties/Leading"/>
      
                    <xsl:element name="w:p">  
                        <xsl:if test="@ParaNumber">
                            <xsl:attribute name="w:rsidR" select="self::ParagraphStyleRange/@ParaNumber"/>
                        </xsl:if>
                        
                        <xsl:element name="w:pPr">     
                            <xsl:element name="w:pStyle">
                                <!--                                        new update 28.9.2016-->
                                <xsl:variable name="styleName" select="substring-after(@AppliedParagraphStyle,'ParagraphStyle/')"/>
                                <xsl:choose>
                                    <xsl:when test="matches($Na1,'[\W\s]')">
                                        <xsl:variable name="styleId">
                                            <xsl:for-each select="$linkedStyle//ParagraphStyle">
                                                <xsl:if test="@Name = $styleName">
                                                    <xsl:value-of select="@pStyleID"/>
                                                </xsl:if>
                                            </xsl:for-each>    
                                        </xsl:variable>
                                        <xsl:choose>
                                            <xsl:when test="not(string-length($styleId) = 0)">
                                                <xsl:attribute name="w:val" select="$styleId"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:choose>
                                                    <xsl:when test="contains($Na1,'%3a')">
                                                        <xsl:variable name="Pf" select="replace($Na1,'%3a',':')"></xsl:variable>                                        
                                                        <xsl:attribute name="w:val" select="tokenize($Pf, '/')[last()]"/>                                
                                                    </xsl:when>
                                                    <xsl:when test="contains($Na1,'\')">
                                                        <xsl:attribute name="w:val" select="replace($Na1,'\\','')"/>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:attribute name="w:val" select="$Na1"/>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:attribute name="w:val" select="$Na1"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <!--<xsl:choose>
                                    <xsl:when test="contains($Na1,'%3a')">
                                        <xsl:variable name="Pf" select="replace($Na1,'%3a',':')"></xsl:variable>                                        
                                        <xsl:value-of select="tokenize($Pf, '/')[last()]"/>                                
                                    </xsl:when>
                                    <xsl:when test="contains($Na1,'\')">
                                        <xsl:attribute name="w:val" select="replace($Na1,'\\','')"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:attribute name="w:val" select="$Na1"/>
                                    </xsl:otherwise>
                                </xsl:choose>-->
                            </xsl:element>
                            
                            <!--@@@@@@@@@@@@@@@@@@@@@@@@ Spacing Start @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->    
                            <xsl:element name="w:spacing">
                                
                                <xsl:if test="self::ParagraphStyleRange/@SpaceBefore">
                                    <!--<xsl:attribute name="w:before" select="$SB4 * 20"/>-->
                                    <xsl:attribute name="w:before" select="round($SB4 * 20)"/>
                                </xsl:if>
                                <xsl:if test="self::ParagraphStyleRange/@SpaceAfter">
                                    <!--<xsl:attribute name="w:after" select="$SAF * 20"/>-->
                                    <xsl:attribute name="w:after" select="round($SAF * 20)"/>
                                </xsl:if>
                                <xsl:if test="self::ParagraphStyleRange/Properties/Leading">
                                    <xsl:if test="$LS = 'Auto'">
                                        <xsl:attribute name="w:line" select="12 * 20"/>
                                        <xsl:attribute name="w:lineRule" select="'atLeast'"/>
                                    </xsl:if>
                                    <xsl:if test="not($LS = 'Auto')">
                                        <!--<xsl:attribute name="w:line" select="$LS * 20"/>-->
                                        <xsl:attribute name="w:line" select="round($LS * 20)"/>
                                        <xsl:attribute name="w:lineRule" select="'atLeast'"/>
                                    </xsl:if>
                                </xsl:if>
                            </xsl:element>
                            <!--@@@@@@@@@@@@@@@@@@@@@@@@ Spacing End @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                            
                            <!--@@@@@@@@@@@@@@@@@@@@@@@@ Indent Start @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                            <xsl:element name="w:ind">
                                <xsl:if test="self::ParagraphStyleRange/@FirstLineIndent">
                                    <xsl:if test="not($FLI &lt; 0)">
                                        <!--<xsl:attribute name="w:firstLine" select="$FLI * 20"/>-->
                                        <xsl:attribute name="w:firstLine" select="round($FLI * 20)"/>
                                    </xsl:if>
                                    <xsl:if test="($FLI &lt; 0)">
                                        <xsl:variable name="FLI1" select="$FLI * -1"/>
                                        <!--<xsl:attribute name="w:hanging" select="$FLI1 * 20"/>-->
                                        <xsl:attribute name="w:hanging" select="round($FLI1 * 20)"/>
                                    </xsl:if>
                                </xsl:if>
                                
                                <xsl:if test="self::ParagraphStyleRange/@LeftIndent">
                                    <!--<xsl:attribute name="w:left" select="$LI * 20"/>-->
                                    <xsl:attribute name="w:left" select="round($LI * 20)"/>
                                </xsl:if>
                                
                                <xsl:if test="self::ParagraphStyleRange/@RightIndent">
                                    <!--<xsl:attribute name="w:right" select="$RI * 20"/>-->
                                    <xsl:attribute name="w:right" select="round($RI * 20)"/>
                                </xsl:if>
                            </xsl:element>
                            <!--@@@@@@@@@@@@@@@@@@@@@@@@ Indent End @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                            
                            <!--@@@@@@@@@@@@@@@@@@@@@@@@ Justification Start @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                            <xsl:if test="self::ParagraphStyleRange/@Justification">
                                <xsl:if test="contains($JC,'LeftJustified') or contains($JC,'FullyJustified') or contains($JC,'CenterJustified') or contains($JC,'RightJustified')">
                                    <xsl:element name="w:jc">
                                        <xsl:attribute name="w:val" select="'both'"/>
                                    </xsl:element>
                                </xsl:if>
                                <xsl:if test="contains($JC,'CenterAlign')">
                                    <xsl:element name="w:jc">
                                        <xsl:attribute name="w:val" select="'center'"/>
                                    </xsl:element>
                                </xsl:if>
                                <xsl:if test="contains($JC,'RightAlign')">
                                    <xsl:element name="w:jc">
                                        <xsl:attribute name="w:val" select="'right'"/>
                                    </xsl:element>
                                </xsl:if>
                            </xsl:if>
                            <!--@@@@@@@@@@@@@@@@@@@@@@@@ Justification End @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                        </xsl:element>
                        
                        <xsl:apply-templates/>
                    </xsl:element>
                            
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
        
        <!-- Function for looping -->
        <xsl:template  name="for-loop-d1e12">
            <xsl:param name="i"/>
            <xsl:param name="j"/>
            <xsl:param name="tod1e12"/>
            <xsl:param name="stepd1e12"/>
            <xsl:choose>
                <xsl:when test="$i = $tod1e12"> 
                    <xsl:value-of select="$j * 20"/>
                </xsl:when>
                <!--  <xsl:otherwise>
                <xsl:value-of select="$j"/>
                <xsl:text> + </xsl:text>
            </xsl:otherwise>-->
            </xsl:choose>
            <xsl:if test="$i+$stepd1e12 &lt;= $tod1e12">
                <xsl:call-template name="for-loop-d1e12">
                    <xsl:with-param name="i" select="$i + $stepd1e12"/>
                    <xsl:with-param name="j" select="$j + parent::Table/Column[$i + 1]/@SingleColumnWidth"/>
                    <xsl:with-param name="tod1e12" select="$tod1e12"/>
                    <xsl:with-param name="stepd1e12" select="$stepd1e12"/>
                </xsl:call-template>
            </xsl:if>
        </xsl:template>
        <!-- Function for looping -->
        
    <xsl:template match="CharacterStyleRange">
        <xsl:variable name="Track" select="@Tracking"/>
        <xsl:variable name="Track1" select="($Track div 100) * 20"/>
        <xsl:variable name="Kern" select="@KerningValue"/>
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
                <xsl:variable name="FS" select="@PointSize"/>
                <xsl:variable name="C1" select="@Capitalization"/>
                <xsl:variable name="PCharCount" select="count(preceding-sibling::CharacterStyleRange)"/>
                <xsl:variable name="FCharCount" select="count(following-sibling::CharacterStyleRange)"/>
                
                
                <xsl:element name="w:r">
                            <xsl:element name="w:rPr">
                                <xsl:element name="w:rStyle">
                                    <xsl:variable name="csn">
                                        <!--                                        new update 28.9.2016-->
                                        <xsl:variable name="styleName" select="substring-after(@AppliedCharacterStyle,'CharacterStyle/')"/>
                                        <xsl:choose>
                                            <xsl:when test="matches($Na,'[\W\s]')">
                                                <xsl:variable name="styleId">
                                                    <xsl:for-each select="$linkedStyle//CharacterStyle">
                                                        <xsl:if test="@Name = $styleName">
                                                            <xsl:value-of select="@cStyleID"/>
                                                        </xsl:if>
                                                    </xsl:for-each>    
                                                </xsl:variable>
                                                <xsl:choose>
                                                    <xsl:when test="not(string-length($styleId) = 0)">
                                                        <xsl:value-of select="$styleId"/>
                                                    </xsl:when>
                                                    <xsl:otherwise>
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
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="$Na"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                        <!--<xsl:choose>
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
                                        </xsl:choose>-->
                                    </xsl:variable>
                                    
                                    <xsl:attribute name="w:val">
                                        <xsl:choose>
                                            <xsl:when test="@PCLink">
                                                <xsl:value-of select="concat($csn,@PCLink)"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="$csn"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:attribute>
                                    
                                    <xsl:choose>
                                        <xsl:when test="child::Rectangle">
                                            <xsl:element name="w:noProof"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:element>
                               <!-- <xsl:if test="@Tracking">
                                    <xsl:element name="w:spacing">
                                        <xsl:attribute name="w:val" select="$Track1"/>
                                    </xsl:element>
                                </xsl:if>    --> 
                                 <xsl:if test="Properties/AppliedFont">
                  
                  <xsl:element name="w:rFonts">
                      <xsl:attribute name="w:ascii" select="Properties/AppliedFont"/>
                      <xsl:attribute name="w:hAnsi" select="Properties/AppliedFont"/>
                  </xsl:element>
                  
              </xsl:if>
                            
            <!--<xsl:if test="contains(@FontStyle,'Black') or contains(@FontStyle,'Bold') or contains(@FontStyle,'Strong') or contains(@FontStyle,'black') or contains(@FontStyle,'bold') or contains(@FontStyle,'strong') or contains(@FontStyle,'Extra') or contains(@FontStyle,'extra') or contains(@FontStyle,'Heavy') or contains(@FontStyle,'heavy') ">-->                  
            <xsl:if test="contains(lower-case(@FontStyle),'medium') or contains(lower-case(@FontStyle),'black') or contains(lower-case(@FontStyle),'bold') or contains(lower-case(@FontStyle),'strong') or contains(lower-case(@FontStyle),'extra') or contains(lower-case(@FontStyle),'heavy') or contains(lower-case(@FontStyle),'demi') ">
                  <xsl:element name="w:b"/>
              </xsl:if>
              <xsl:if test="contains(lower-case(@FontStyle),'italic') or contains(lower-case(@FontStyle),'oblique')">
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
<!--                                <xsl:if test="self::CharacterStyleRange/@FillColor">-->
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
              <xsl:if test="self::CharacterStyleRange/@PointSize">
                  <xsl:element name="w:sz">
                      <xsl:attribute name="w:val" select="$FS * 2"/>
                  </xsl:element>
              </xsl:if>
                                <!--<xsl:if test="Properties/AppliedFont">
                            <xsl:element name="w:highlight">
                                <xsl:attribute name="w:val" select="'yellow'"/>
                            </xsl:element>
                        </xsl:if> --> 
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
                                
                                <xsl:if test="@Underline ='false'">
                                    <xsl:element name="w:u">
                                        <xsl:attribute name="w:val" select="'none'"/>
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
          
                            </xsl:element>
                    <xsl:element name="w:annotationRef"/>
                    <xsl:apply-templates/>
                    
                </xsl:element>
                
          <!--  </xsl:otherwise>
        </xsl:choose>-->
        
    </xsl:template>
    
    <xsl:template match="Content">
        <xsl:element name="w:t">
            <xsl:attribute name="xml:space" select="'preserve'"/>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <!-- Put page number text variable value as a text in the document   -->
    <xsl:template match="TextVariableInstance">
        <xsl:choose>
            <xsl:when test="contains(@Name,'XRefPageNumber')">
                <xsl:choose>
                    <xsl:when test="ancestor::CharacterStyleRange">
                        <xsl:element name="w:t">
                            <xsl:attribute name="xml:space" select="'preserve'"/>
                            <xsl:apply-templates select="@ResultText"/>
                        </xsl:element>
                    </xsl:when>
                </xsl:choose>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <!-- Put page number text variable value as a text in the document   -->
    
    <xsl:template match="Br">     
        <xsl:if test="count(ancestor::ParagraphStyleRange/descendant::Br) &gt; 1">
        <xsl:element name="w:cr"/>
        </xsl:if>
       <!-- <xsl:element name="w:cr"/>-->
    </xsl:template>
    
    <xsl:template match="Rectangle">  
        
        <xsl:choose>
            <xsl:when test="@Image">
                <xsl:variable name="H" select="round((height * 12700) cast as xs:decimal)"/>
                <xsl:variable name="W" select="round((width * 12700) cast as xs:decimal)"/>
                <xsl:variable name="IMG" select="@Image"/>
                <xsl:variable name="id" select="@id"/>
                
                <!--<xsl:element name="w:r">    
                    <xsl:element name="w:rPr">
                        <xsl:element name="w:noProof"/>
                    </xsl:element>-->
                    <xsl:element name="w:drawing">
                        <xsl:element name="wp:inline">
                            <xsl:attribute name="distT" select="'0'"/>
                            <xsl:attribute name="distB" select="'0'"/>
                            <xsl:attribute name="distL" select="'0'"/>
                            <xsl:attribute name="distR" select="'0'"/>
                            <xsl:element name="wp:extent">
                                <xsl:attribute name="cx" select="$W"/>
                                <xsl:attribute name="cy" select="$H"/>
                            </xsl:element>
                            <xsl:element name="wp:effectExtent">
                                <xsl:attribute name="l" select="'0'"/>
                                <xsl:attribute name="t" select="'0'"/>
                                <xsl:attribute name="r" select="'0'"/>
                                <xsl:attribute name="b" select="'0'"/>
                            </xsl:element>
                            <!--@@@@@@@@@@ Wrap Top and Bottom @@@@@@@@@@@-->
<!--                            <xsl:element name="wp:wrapTopAndBottom"/>-->
                            <!--@@@@@@@@@@ Wrap Top and Bottom @@@@@@@@@@@-->
                            <xsl:element name="wp:docPr">
                               <!-- <xsl:attribute name="id" select="(floor(math:random()*1000) mod 1000) + 1"/>-->
                                <xsl:attribute name="name" select="$IMG"/>
                            </xsl:element>
                            <xsl:element name="wp:cNvGraphicFramePr">
                                <xsl:element name="a:graphicFrameLocks">    
                                    <xsl:attribute name="noChangeAspect" select="'1'"/>
                                </xsl:element>
                            </xsl:element>
                            <xsl:element name="a:graphic">    
                                <xsl:element name="a:graphicData">    
                                    <xsl:attribute name="uri" select="'http://schemas.openxmlformats.org/drawingml/2006/picture'"/>
                                    <xsl:element name="pic:pic">    
                                        <xsl:element name="pic:nvPicPr">  
                                            <xsl:element name="pic:cNvPr">  
                                                <xsl:attribute name="id" select="'0'"/>
                                                <xsl:attribute name="name" select="$IMG"/>
                                            </xsl:element>
                                            <xsl:element name="pic:cNvPicPr"/>  
                                        </xsl:element>
                                        <xsl:element name="pic:blipFill">  
                                            <xsl:element name="a:blip">
                                                <xsl:attribute name="r:embed" select="concat('rId',$id)"/>
                                                <xsl:element name="a:extLst">
                                                    <xsl:element name="a:ext">
                                                        <xsl:attribute name="uri" select="'{28A0092B-C50C-407E-A947-70E740481C1C}'"/>
                                                        <xsl:element name="a14:useLocalDpi">
                                                            <xsl:attribute name="val" select="'0'"/>
                                                        </xsl:element>
                                                    </xsl:element>
                                                </xsl:element>
                                            </xsl:element>
                                            <xsl:element name="a:stretch">
                                                <xsl:element name="a:fillRect"/>
                                            </xsl:element>
                                        </xsl:element>
                                        <xsl:element name="pic:spPr">
                                            <xsl:element name="a:xfrm">
                                                <xsl:element name="a:off">
                                                    <xsl:attribute name="x" select="'0'"/>
                                                    <xsl:attribute name="y" select="'0'"/>
                                                </xsl:element>
                                                <xsl:element name="a:ext">
                                                    <xsl:attribute name="cx" select="$W"/>
                                                    <xsl:attribute name="cy" select="$H"/>
                                                </xsl:element>
                                            </xsl:element>
                                            <xsl:element name="a:prstGeom">
                                                <xsl:attribute name="prst" select="'rect'"/>
                                                <xsl:element name="a:avLst"/>    
                                            </xsl:element>
                                        </xsl:element>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:element>
                            
                        </xsl:element>
                    </xsl:element>
                <!--</xsl:element>-->
                
            </xsl:when>
        </xsl:choose>
        
    </xsl:template>
 
    <xsl:template match="Table">
        
        <xsl:element name="w:tbl">
            <xsl:element name="w:tblPr">
                <xsl:element name="w:tblStyle">
                    <xsl:attribute name="w:val" select="'LightGrid-Accent1'"/>
                </xsl:element>
                <xsl:element name="w:tblW">
                    <xsl:attribute name="w:w" select="'0'"/>
                    <xsl:attribute name="w:type" select="'auto'"/>
                </xsl:element>
                <xsl:element name="w:tblLook">
                    <xsl:attribute name="w:val" select="'04A0'"/>
                    <xsl:attribute name="w:firstRow" select="'1'"/>
                    <xsl:attribute name="w:lastRow" select="'0'"/>
                    <xsl:attribute name="w:firstColumn" select="'1'"/>
                    <xsl:attribute name="w:lastColumn" select="'0'"/>
                    <xsl:attribute name="w:noHBand" select="'0'"/>
                    <xsl:attribute name="w:noVBand" select="'1'"/>
                </xsl:element>
                
            </xsl:element>
            <xsl:element name="w:tblGrid">
                <xsl:for-each select="self::Table/Column">
                    <xsl:variable name="CW" select="@SingleColumnWidth"/>
                    <xsl:element name="w:gridCol">
                        <xsl:attribute name="w:w" select="$CW * 20"/>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
            
            
            <xsl:for-each-group select="self::Table/Cell" group-adjacent="tokenize(@Name,':')[last()]">
                
                <xsl:variable name="K" select="number(current-grouping-key())"/>
                <xsl:variable name="K1" select="$K + 1"/>
                <xsl:variable name="RowHei" select="parent::Table/Row[$K1]/@SingleRowHeight"/>
                <xsl:variable name="RowHeight" select="$RowHei * 20"/>
                
                <xsl:element name="w:tr">
                    
                    <xsl:element name="w:trPr">
                        <xsl:element name="w:trHeight">
                            <xsl:attribute name="w:val" select="$RowHeight"/>
                        </xsl:element>
                    </xsl:element>
                    
                    <xsl:for-each select="current-group()">
                        <xsl:variable name="ColSpan" select="number(./@ColumnSpan)"/>
                        <xsl:variable name="to" select="$ColSpan - 1"/>                                    
                        <xsl:variable name="K2" select="number(substring-before(./@Name,':')) cast as xs:integer"/>
                        <xsl:variable name="K3" select="$K2 + 1"/>
                        <xsl:variable name="K4" select="$K3 + $to"/>
                        <xsl:variable name="ColWid" select="parent::Table/Column[$K3]/@SingleColumnWidth"/>
                        <xsl:variable name="ColWidth" select="$ColWid * 20"/>
                        <xsl:variable name="TcBordersTopWeight" select="@TopEdgeStrokeWeight"/>
                        <xsl:variable name="TcBordersLeftWeight" select="@LeftEdgeStrokeWeight"/>
                        <xsl:variable name="TcBordersBottomWeight" select="@BottomEdgeStrokeWeight"/>
                        <xsl:variable name="TcBordersRightWeight" select="@RightEdgeStrokeWeight"/>
                        
                        <xsl:element name="w:tc">
                            <xsl:element name="w:tcPr">
                                <xsl:element name="w:tcW">
                                    <xsl:attribute name="w:w">
                                        <xsl:choose>
                                            <xsl:when test="$ColSpan eq 1">
                                                <xsl:value-of select="$ColWidth"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:variable name="add">
                                                    <xsl:call-template name="for-loop-d1e12">
                                                        <xsl:with-param name="i" select="$K3"/>
                                                        <xsl:with-param name="j" select="parent::Table/Column[$K3]/@SingleColumnWidth"/>
                                                        <xsl:with-param name="tod1e12" select="$K4"/>
                                                        <xsl:with-param name="stepd1e12" select="1"/>
                                                    </xsl:call-template>
                                                </xsl:variable>
                                                <xsl:value-of select="$add"></xsl:value-of>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:attribute>
                                    <xsl:attribute name="w:type" select="'dxa'"/>
                                </xsl:element>
                                <xsl:choose>
                                    <xsl:when test="./@RowSpan &gt; 1">
                                        <xsl:element name="w:vMerge">
                                            <xsl:attribute name="w:val" select="'restart'"/>
                                        </xsl:element>
                                    </xsl:when>
                                    <xsl:when test="./@mine">
                                        <xsl:element name="w:vMerge"/>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="$ColSpan &gt; 1">
                                        <xsl:element name="w:gridSpan">
                                            <xsl:attribute name="w:val" select="$ColSpan"/>
                                        </xsl:element>
                                    </xsl:when>
                                </xsl:choose>
                               <!--5.2.2015 @@@table border@@@ <xsl:if test="contains(@*/name(),'Edge')">
                                <xsl:element name="w:tcBorders">
                                    <xsl:if test="@TopEdgeStrokeWeight">
                                    <xsl:element name="w:top">
                                    <xsl:attribute name="w:sz" select="$TcBordersTopWeight * 8"/>
                                    </xsl:element>
                                    </xsl:if>
                                    <xsl:if test="@LeftEdgeStrokeWeight">
                                        <xsl:element name="w:top">
                                            <xsl:attribute name="w:sz" select="$TcBordersLeftWeight * 8"/>
                                        </xsl:element>
                                    </xsl:if>
                                    <xsl:if test="@BottomEdgeStrokeWeight">
                                         <xsl:element name="w:top">
                                             <xsl:attribute name="w:sz" select="$TcBordersBottomWeight * 8"/>
                                         </xsl:element>
                                     </xsl:if>
                                    <xsl:if test="@RightEdgeStrokeWeight">
                                        <xsl:element name="w:top">
                                            <xsl:attribute name="w:sz" select="$TcBordersRightWeight * 8"/>
                                        </xsl:element>
                                    </xsl:if>
                                </xsl:element>
                                </xsl:if>-->
                            </xsl:element>
                            <xsl:apply-templates/>
                        </xsl:element>
                    </xsl:for-each>
                    
                </xsl:element>
            </xsl:for-each-group>
            
            
        </xsl:element>
        
    </xsl:template>
    
    <xsl:template match="HyperlinkTextSource[contains(lower-case(@HyperlinkUDestination),'_story_')]|HyperlinkTextDestination[contains(lower-case(@BookMarkDestination),'_story_')]">
        <xsl:variable name="id">
            <xsl:number level="any"/>
        </xsl:variable>
        <xsl:variable name="HUD">
            <!--<xsl:choose>
                                    <xsl:when test="self::HyperlinkTextSource">
                                        <xsl:value-of select="@HyperlinkUDestination"/>
                                    </xsl:when>
                                    <xsl:when test="self::HyperlinkTextDestination">
                                        <xsl:value-of select="@BookMarkDestination"/>
                                    </xsl:when>
                                </xsl:choose>-->
            <xsl:choose>
                <xsl:when test="contains(self::HyperlinkTextSource/@HyperlinkUDestination | self::HyperlinkTextDestination/@BookMarkDestination,'_TX_')">
                    <xsl:choose>
                        <xsl:when test="self::HyperlinkTextSource/@HyperlinkUDestination">
                            <xsl:value-of select="substring-before(self::HyperlinkTextSource/@HyperlinkUDestination,'_TX_')"/>
                        </xsl:when>
                        <xsl:when test="self::HyperlinkTextDestination/@BookMarkDestination">
                            <xsl:value-of select="substring-before(self::HyperlinkTextDestination/@BookMarkDestination,'_TX_')"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="not(contains(self::HyperlinkTextSource/@HyperlinkUDestination | self::HyperlinkTextDestination/@BookMarkDestination,'_TX_'))">
                    <xsl:choose>
                        <xsl:when test="self::HyperlinkTextSource/@HyperlinkUDestination">
                            <xsl:value-of select="self::HyperlinkTextSource/@HyperlinkUDestination"/>
                        </xsl:when>
                        <xsl:when test="self::HyperlinkTextDestination/@BookMarkDestination">
                            <xsl:value-of select="self::HyperlinkTextDestination/@BookMarkDestination"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:element name="w:bookmarkStart">
            <!--<xsl:attribute name="w:id" select="$HUD"/>-->
            <xsl:attribute name="w:id" select="$id"/>
            <xsl:attribute name="w:name" select="$HUD"/>
        </xsl:element>
        <xsl:apply-templates/>
        <xsl:element name="w:bookmarkEnd">
            <!--<xsl:attribute name="w:id" select="$HUD"/>-->
            <xsl:attribute name="w:id" select="$id"/>
        </xsl:element>
    </xsl:template>
    
        
    <xsl:template match="w:br">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
<!--    <xsl:template match="w:softHyphen">
        <xsl:text disable-output-escaping="yes">&lt;/w:t&gt;</xsl:text><xsl:text disable-output-escaping="yes">&lt;w:softHyphen/&gt;</xsl:text><xsl:text disable-output-escaping="yes">&lt;w:t xml:space="preserve"&gt;</xsl:text>
    </xsl:template>-->
    
    <xsl:template match="Change">
        <xsl:variable name="CU" select="@Story"></xsl:variable>
        <xsl:variable name="story" select="concat('Story_',$CU,'.xml')"/>
        <xsl:variable name="Conc" select="'width:393.6pt;height:64.3pt;mso-wrap-style:none;mso-left-percent:-10001;mso-top-percent:-10001;mso-position-horizontal:absolute;mso-position-horizontal-relative:char;mso-position-vertical:absolute;mso-position-vertical-relative:line;mso-left-percent:-10001;mso-top-percent:-10001'"/>
     
<xsl:variable name="tc">
    <xsl:choose>
        <xsl:when test="./@ChangeType ='DeletedText'">
            <xsl:value-of select="'w:del'"/>
        </xsl:when>
        <xsl:when test="./@ChangeType ='InsertedText'">
            <xsl:value-of select="'w:ins'"/>
        </xsl:when>
        <xsl:when test="./@ChangeType ='MovedText'">
            <xsl:value-of select="'w:ins'"/>
        </xsl:when>
    </xsl:choose>
</xsl:variable>
        <xsl:if test="ancestor::ParagraphStyleRange">
       <xsl:text disable-output-escaping="yes">&lt;/w:r&gt;</xsl:text> 
        <xsl:choose>
        <xsl:when test="./Content">
        <xsl:element name="{$tc}">
            <xsl:attribute name="w:author" select="@UserName"/>
            <xsl:attribute name="w:date" select="@Date"/>
            <xsl:element name="w:r">
                <xsl:apply-templates mode="track1"/>
            </xsl:element>
        </xsl:element>
        </xsl:when>
        <xsl:when test="not(./Content)">
            <xsl:element name="{$tc}">
                <xsl:attribute name="w:author" select="@UserName"/>
                <xsl:attribute name="w:date" select="@Date"/>
                <xsl:apply-templates mode="track1"/>
            </xsl:element>
        </xsl:when>
        </xsl:choose>
        <xsl:text disable-output-escaping="yes">&lt;w:r&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="not(ancestor::ParagraphStyleRange)">
            <xsl:choose>
                <xsl:when test="./Content">
                    <xsl:element name="{$tc}">
                        <xsl:attribute name="w:author" select="@UserName"/>
                        <xsl:attribute name="w:date" select="@Date"/>
                        <xsl:element name="w:r">
                            <xsl:apply-templates mode="track"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                <xsl:when test="not(./Content)">
                    <xsl:element name="{$tc}">
                        <xsl:attribute name="w:author" select="@UserName"/>
                        <xsl:attribute name="w:date" select="@Date"/>
                        <xsl:apply-templates mode="track"/>
                    </xsl:element>
                </xsl:when>
            </xsl:choose>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="Content" mode="track">
        <xsl:variable name="ch">
            <xsl:choose>
                <xsl:when test="ancestor::Change/@ChangeType ='DeletedText' or parent::Change/@ChangeType ='DeletedText'">
                    <xsl:value-of select="'w:delText'"/>
                </xsl:when>
                <xsl:when test="ancestor::Change/@ChangeType ='InsertedText' or parent::Change/@ChangeType ='InsertedText'">
                    <xsl:value-of select="'w:t'"/>
                </xsl:when>
                <xsl:when test="ancestor::Change/@ChangeType ='MovedText' or parent::Change/@ChangeType ='MovedText'">
                    <xsl:value-of select="'w:t'"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        <xsl:element name="{$ch}">
            <xsl:attribute name="xml:space" select="'preserve'"/>
        <xsl:apply-templates mode="track"/>
        </xsl:element>
    </xsl:template>
    
        <xsl:template match="Properties"/>
        <xsl:template match="HiddenText"/>
    
    <xsl:template match="Properties" mode="track"/>
    <xsl:template match="HiddenText" mode="track"/>
    <xsl:template match="Properties" mode="track1"/>
    <xsl:template match="HiddenText" mode="track1"/>
    
    <xsl:template match="CharacterStyleRange" mode="track">
        <xsl:variable name="Track" select="@Tracking"/>
        <xsl:variable name="Track1" select="($Track div 100) * 20"/>
        <xsl:variable name="Kern" select="@KerningValue"/>
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
                <xsl:variable name="FS" select="@PointSize"/>
                <xsl:variable name="C1" select="@Capitalization"/>
                <xsl:variable name="PCharCount" select="count(preceding-sibling::CharacterStyleRange)"/>
                <xsl:variable name="FCharCount" select="count(following-sibling::CharacterStyleRange)"/>
                
                
                <xsl:element name="w:r">
                            <xsl:element name="w:rPr">
                                <xsl:element name="w:rStyle">
                                    <xsl:variable name="csn">
                                        <!--                                        new update 28.9.2016-->
                                        <xsl:variable name="styleName" select="substring-after(@AppliedCharacterStyle,'CharacterStyle/')"/>
                                        <xsl:choose>
                                            <xsl:when test="matches($Na,'[\W\s]')">
                                                <xsl:variable name="styleId">
                                                    <xsl:for-each select="$linkedStyle//CharacterStyle">
                                                        <xsl:if test="@Name = $styleName">
                                                            <xsl:value-of select="@cStyleID"/>
                                                        </xsl:if>
                                                    </xsl:for-each>    
                                                </xsl:variable>
                                                <xsl:choose>
                                                    <xsl:when test="not(string-length($styleId) = 0)">
                                                        <xsl:value-of select="$styleId"/>
                                                    </xsl:when>
                                                    <xsl:otherwise>
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
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="$Na"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                        <!--<xsl:choose>
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
                                        </xsl:choose>-->
                                    </xsl:variable>
                                    
                                    <xsl:attribute name="w:val">
                                        <xsl:choose>
                                            <xsl:when test="@PCLink">
                                                <xsl:value-of select="concat($csn,@PCLink)"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="$csn"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:attribute>
                                    
                                    <xsl:choose>
                                        <xsl:when test="child::Rectangle">
                                            <xsl:element name="w:noProof"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:element>
                               <!-- <xsl:if test="@Tracking">
                                    <xsl:element name="w:spacing">
                                        <xsl:attribute name="w:val" select="$Track1"/>
                                    </xsl:element>
                                </xsl:if>    --> 
                                 <xsl:if test="Properties/AppliedFont">
                  
                  <xsl:element name="w:rFonts">
                      <xsl:attribute name="w:ascii" select="Properties/AppliedFont"/>
                      <xsl:attribute name="w:hAnsi" select="Properties/AppliedFont"/>
                  </xsl:element>
                  
              </xsl:if>
                            
            <!--<xsl:if test="contains(@FontStyle,'Black') or contains(@FontStyle,'Bold') or contains(@FontStyle,'Strong') or contains(@FontStyle,'black') or contains(@FontStyle,'bold') or contains(@FontStyle,'strong') or contains(@FontStyle,'Extra') or contains(@FontStyle,'extra') or contains(@FontStyle,'Heavy') or contains(@FontStyle,'heavy') ">-->                                
            <xsl:if test="contains(lower-case(@FontStyle),'medium') or contains(lower-case(@FontStyle),'black') or contains(lower-case(@FontStyle),'bold') or contains(lower-case(@FontStyle),'strong') or contains(lower-case(@FontStyle),'extra') or contains(lower-case(@FontStyle),'heavy') ">
                  <xsl:element name="w:b"/>
              </xsl:if>
              <xsl:if test="contains(lower-case(@FontStyle),'italic') or contains(lower-case(@FontStyle),'oblique')">
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
<!--                                <xsl:if test="self::CharacterStyleRange/@FillColor">-->
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
              <xsl:if test="self::CharacterStyleRange/@PointSize">
                  <xsl:element name="w:sz">
                      <xsl:attribute name="w:val" select="$FS * 2"/>
                  </xsl:element>
              </xsl:if>
                                <!--<xsl:if test="Properties/AppliedFont">
                            <xsl:element name="w:highlight">
                                <xsl:attribute name="w:val" select="'yellow'"/>
                            </xsl:element>
                        </xsl:if> --> 
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
                                
                                <xsl:if test="@Underline ='false'">
                                    <xsl:element name="w:u">
                                        <xsl:attribute name="w:val" select="'none'"/>
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
        
                            </xsl:element>
                    <xsl:element name="w:annotationRef"/>
                    <xsl:apply-templates mode="track"/>
                    
                </xsl:element>
                
           <!-- </xsl:otherwise>
        </xsl:choose>-->
        
    </xsl:template>
    
    
    <xsl:template match="ParagraphStyleRange" mode="track">  
        <xsl:variable name="Na1">
            <xsl:choose>
                <xsl:when test="contains(@AppliedParagraphStyle,'$ID/')">
                    <xsl:value-of select="substring-after(@AppliedParagraphStyle,'$ID/')"/>
                </xsl:when>
                <xsl:when test="contains(@AppliedParagraphStyle,'ParagraphStyle/')">
                    <xsl:value-of select="substring-after(@AppliedParagraphStyle,'ParagraphStyle/')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="@AppliedParagraphStyle"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="FS1" select="@PointSize"/>
        <xsl:variable name="JC" select="@Justification"/>
        <xsl:variable name="FLI" select="@FirstLineIndent"/>
        <xsl:variable name="LI" select="@LeftIndent"/>
        <xsl:variable name="RI" select="@RightIndent"/>
        <xsl:variable name="SB4" select="@SpaceBefore"/>
        <xsl:variable name="SAF" select="@SpaceAfter"/>
        <xsl:variable name="C" select="@Capitalization"/>
        <xsl:variable name="LS" select="Properties/Leading"/>
        
        <xsl:element name="w:p">  
            <xsl:if test="@ParaNumber">
                <xsl:attribute name="w:rsidR" select="self::ParagraphStyleRange/@ParaNumber"/>
            </xsl:if>
            
            <xsl:element name="w:pPr">     
                <xsl:element name="w:pStyle">
                    <!--<xsl:attribute name="w:val" select="tokenize($P, '/')[last()]"/>-->
                    <!--                                        new update 28.9.2016-->
                    <xsl:variable name="styleName" select="substring-after(@AppliedParagraphStyle,'ParagraphStyle/')"/>
                    <xsl:choose>
                        <xsl:when test="matches($Na1,'[\W\s]')">
                            <xsl:variable name="styleId">
                                <xsl:for-each select="$linkedStyle//ParagraphStyle">
                                    <xsl:if test="@Name = $styleName">
                                        <xsl:value-of select="@pStyleID"/>
                                    </xsl:if>
                                </xsl:for-each>    
                            </xsl:variable>
                            <xsl:choose>
                                <xsl:when test="not(string-length($styleId) = 0)">
                                    <xsl:attribute name="w:val" select="$styleId"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:choose>
                                        <xsl:when test="contains($Na1,'%3a')">
                                            <xsl:variable name="Pf" select="replace($Na1,'%3a',':')"></xsl:variable>                                        
                                            <xsl:attribute name="w:val" select="tokenize($Pf, '/')[last()]"/>                                
                                        </xsl:when>
                                        <xsl:when test="contains($Na1,'\')">
                                            <xsl:attribute name="w:val" select="replace($Na1,'\\','')"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:attribute name="w:val" select="$Na1"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:attribute name="w:val" select="$Na1"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    <!--<xsl:choose>
                                    <xsl:when test="contains($Na1,'%3a')">
                                        <xsl:variable name="Pf" select="replace($Na1,'%3a',':')"></xsl:variable>                                        
                                        <xsl:value-of select="tokenize($Pf, '/')[last()]"/>                                
                                    </xsl:when>
                                    <xsl:when test="contains($Na1,'\')">
                                        <xsl:attribute name="w:val" select="replace($Na1,'\\','')"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:attribute name="w:val" select="$Na1"/>
                                    </xsl:otherwise>
                                </xsl:choose>-->
                    
                </xsl:element>
                
                <xsl:apply-templates select="child::Properties/TabList" mode="tabs"/>
                
                <!--@@@@@@@@@@@@@@@@@@@@@@@@ Spacing Start @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->    
                <xsl:element name="w:spacing">
                    
                    <xsl:if test="self::ParagraphStyleRange/@SpaceBefore">
                        <xsl:attribute name="w:before" select="$SB4 * 20"/>
                    </xsl:if>
                    <xsl:if test="self::ParagraphStyleRange/@SpaceAfter">
                        <xsl:attribute name="w:after" select="$SAF * 20"/>
                    </xsl:if>
                    <xsl:if test="self::ParagraphStyleRange/Properties/Leading">
                        <xsl:if test="$LS = 'Auto'">
                            <xsl:attribute name="w:line" select="12 * 20"/>
                            <xsl:attribute name="w:lineRule" select="'atLeast'"/>
                        </xsl:if>
                        <xsl:if test="not($LS = 'Auto')">
                            <xsl:attribute name="w:line" select="$LS * 20"/>
                            <xsl:attribute name="w:lineRule" select="'atLeast'"/>
                        </xsl:if>
                    </xsl:if>
                </xsl:element>
                <!--@@@@@@@@@@@@@@@@@@@@@@@@ Spacing End @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                
                <!--@@@@@@@@@@@@@@@@@@@@@@@@ Indent Start @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                <xsl:element name="w:ind">
                    <xsl:if test="self::ParagraphStyleRange/@FirstLineIndent">
                        <xsl:if test="not($FLI &lt; 0)">
                            <xsl:attribute name="w:firstLine" select="$FLI * 20"/>
                        </xsl:if>
                        <xsl:if test="($FLI &lt; 0)">
                            <xsl:variable name="FLI1" select="$FLI * -1"/>
                            <xsl:attribute name="w:hanging" select="$FLI1 * 20"/>
                        </xsl:if>
                    </xsl:if>
                    
                    <xsl:if test="self::ParagraphStyleRange/@LeftIndent">
                        <xsl:attribute name="w:left" select="$LI * 20"/>
                    </xsl:if>
                    
                    <xsl:if test="self::ParagraphStyleRange/@RightIndent">
                        <xsl:attribute name="w:right" select="$RI * 20"/>
                    </xsl:if>
                </xsl:element>
                <!--@@@@@@@@@@@@@@@@@@@@@@@@ Indent End @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                
                <!--@@@@@@@@@@@@@@@@@@@@@@@@ Justification Start @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                <xsl:if test="self::ParagraphStyleRange/@Justification">
                    <xsl:if test="contains($JC,'LeftJustified') or contains($JC,'FullyJustified') or contains($JC,'CenterJustified') or contains($JC,'RightJustified')">
                        <xsl:element name="w:jc">
                            <xsl:attribute name="w:val" select="'both'"/>
                        </xsl:element>
                    </xsl:if>
                    <xsl:if test="contains($JC,'CenterAlign')">
                        <xsl:element name="w:jc">
                            <xsl:attribute name="w:val" select="'center'"/>
                        </xsl:element>
                    </xsl:if>
                    <xsl:if test="contains($JC,'RightAlign')">
                        <xsl:element name="w:jc">
                            <xsl:attribute name="w:val" select="'right'"/>
                        </xsl:element>
                    </xsl:if>
                </xsl:if>
                <!--@@@@@@@@@@@@@@@@@@@@@@@@ Justification End @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
            </xsl:element>
            
            <xsl:apply-templates/>
        </xsl:element>
        
    </xsl:template>
    
    <xsl:template match="Content" mode="track1">
        <xsl:variable name="ch">
            <xsl:choose>
                <xsl:when test="ancestor::Change/@ChangeType ='DeletedText' or parent::Change/@ChangeType ='DeletedText'">
                    <xsl:value-of select="'w:delText'"/>
                </xsl:when>
                <xsl:when test="ancestor::Change/@ChangeType ='InsertedText' or parent::Change/@ChangeType ='InsertedText'">
                    <xsl:value-of select="'w:t'"/>
                </xsl:when>
                <xsl:when test="ancestor::Change/@ChangeType ='MovedText' or parent::Change/@ChangeType ='MovedText'">
                    <xsl:value-of select="'w:t'"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        <xsl:element name="{$ch}">
            <xsl:attribute name="xml:space" select="'preserve'"/>
            <xsl:apply-templates mode="track"/>
        </xsl:element>
    </xsl:template>
    
       <xsl:template match="CharacterStyleRange" mode="track1">
        <xsl:variable name="Track" select="@Tracking"/>
        <xsl:variable name="Track1" select="($Track div 100) * 20"/>
        <xsl:variable name="Kern" select="@KerningValue"/>
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
                <xsl:variable name="FS" select="@PointSize"/>
                <xsl:variable name="C1" select="@Capitalization"/>
                <xsl:variable name="PCharCount" select="count(preceding-sibling::CharacterStyleRange)"/>
                <xsl:variable name="FCharCount" select="count(following-sibling::CharacterStyleRange)"/>
                
                
                <xsl:element name="w:r">
                            <xsl:element name="w:rPr">
                                <xsl:element name="w:rStyle">
                                    <xsl:variable name="csn">
                                        <!--                                        new update 28.9.2016-->
                                        <xsl:variable name="styleName" select="substring-after(@AppliedCharacterStyle,'CharacterStyle/')"/>
                                        <xsl:choose>
                                            <xsl:when test="matches($Na,'[\W\s]')">
                                                <xsl:variable name="styleId">
                                                    <xsl:for-each select="$linkedStyle//CharacterStyle">
                                                        <xsl:if test="@Name = $styleName">
                                                            <xsl:value-of select="@cStyleID"/>
                                                        </xsl:if>
                                                    </xsl:for-each>    
                                                </xsl:variable>
                                                <xsl:choose>
                                                    <xsl:when test="not(string-length($styleId) = 0)">
                                                        <xsl:value-of select="$styleId"/>
                                                    </xsl:when>
                                                    <xsl:otherwise>
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
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="$Na"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                        <!--<xsl:choose>
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
                                        </xsl:choose>-->
                                    </xsl:variable>
                                    
                                    <xsl:attribute name="w:val">
                                        <xsl:choose>
                                            <xsl:when test="@PCLink">
                                                <xsl:value-of select="concat($csn,@PCLink)"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="$csn"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:attribute>
                                    
                                    <xsl:choose>
                                        <xsl:when test="child::Rectangle">
                                            <xsl:element name="w:noProof"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:element>
                               <!-- <xsl:if test="@Tracking">
                                    <xsl:element name="w:spacing">
                                        <xsl:attribute name="w:val" select="$Track1"/>
                                    </xsl:element>
                                </xsl:if>    --> 
                                 <xsl:if test="Properties/AppliedFont">
                  
                  <xsl:element name="w:rFonts">
                      <xsl:attribute name="w:ascii" select="Properties/AppliedFont"/>
                      <xsl:attribute name="w:hAnsi" select="Properties/AppliedFont"/>
                  </xsl:element>
                  
              </xsl:if>
                        
            <!--<xsl:if test="contains(@FontStyle,'Black') or contains(@FontStyle,'Bold') or contains(@FontStyle,'Strong') or contains(@FontStyle,'black') or contains(@FontStyle,'bold') or contains(@FontStyle,'strong') or contains(@FontStyle,'Extra') or contains(@FontStyle,'extra') or contains(@FontStyle,'Heavy') or contains(@FontStyle,'heavy') ">-->                                
                <xsl:if test="contains(lower-case(@FontStyle),'medium') or contains(lower-case(@FontStyle),'black') or contains(lower-case(@FontStyle),'bold') or contains(lower-case(@FontStyle),'strong') or contains(lower-case(@FontStyle),'extra') or contains(lower-case(@FontStyle),'heavy') or contains(lower-case(@FontStyle),'demi')">
                  <xsl:element name="w:b"/>
              </xsl:if>
              <xsl:if test="contains(lower-case(@FontStyle),'italic') or contains(lower-case(@FontStyle),'oblique')">
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
<!--                                <xsl:if test="self::CharacterStyleRange/@FillColor">-->
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
              <xsl:if test="self::CharacterStyleRange/@PointSize">
                  <xsl:element name="w:sz">
                      <xsl:attribute name="w:val" select="$FS * 2"/>
                  </xsl:element>
              </xsl:if>
                                <!-- <xsl:if test="Properties/AppliedFont">
                            <xsl:element name="w:highlight">
                                <xsl:attribute name="w:val" select="'yellow'"/>
                            </xsl:element>
                        </xsl:if>    --> 
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
                                <xsl:if test="@Underline ='false'">
                                    <xsl:element name="w:u">
                                        <xsl:attribute name="w:val" select="'none'"/>
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

                            </xsl:element>
                    <xsl:element name="w:annotationRef"/>
                    <xsl:apply-templates mode="track"/>
                    
                </xsl:element>
                
          <!--  </xsl:otherwise>
        </xsl:choose>
        -->
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

     <xsl:character-map name="Ascii2Unicode">
      <!-- isoboxmap.xsl -->
     <xsl:output-character character="%" string="&amp;#x0025;"/>
<!--<xsl:output-character character="&" string="&amp;#x0026;"/>-->
<xsl:output-character character="'" string="&amp;#x0027;"/>
<xsl:output-character character="*" string="&amp;#x002A;"/>
<xsl:output-character character="+" string="&amp;#x002B;"/>
<xsl:output-character character="=" string="&amp;#x003D;"/>
<xsl:output-character character=" " string="&amp;#x00A0;"/>
<xsl:output-character character="¡" string="&amp;#x00A1;"/>
<xsl:output-character character="¢" string="&amp;#x00A2;"/>
<xsl:output-character character="£" string="&amp;#x00A3;"/>
<xsl:output-character character="¤" string="&amp;#x00A4;"/>
<xsl:output-character character="¥" string="&amp;#x00A5;"/>
<xsl:output-character character="¦" string="&amp;#x00A6;"/>
<xsl:output-character character="§" string="&amp;#x00A7;"/>
<xsl:output-character character="¨" string="&amp;#x00A8;"/>
<xsl:output-character character="©" string="&amp;#x00A9;"/>
<xsl:output-character character="ª" string="&amp;#x00AA;"/>
<xsl:output-character character="«" string="&amp;#x00AB;"/>
<xsl:output-character character="¬" string="&amp;#x00AC;"/>
<xsl:output-character character="­" string="&amp;#x00AD;"/>
<xsl:output-character character="®" string="&amp;#x00AE;"/>
<xsl:output-character character="¯" string="&amp;#x00AF;"/>
<xsl:output-character character="°" string="&amp;#x00B0;"/>
<xsl:output-character character="±" string="&amp;#x00B1;"/>
<xsl:output-character character="²" string="&amp;#x00B2;"/>
<xsl:output-character character="³" string="&amp;#x00B3;"/>
<xsl:output-character character="´" string="&amp;#x00B4;"/>
<xsl:output-character character="µ" string="&amp;#x00B5;"/>
<xsl:output-character character="¶" string="&amp;#x00B6;"/>
<xsl:output-character character="·" string="&amp;#x00B7;"/>
<xsl:output-character character="¸" string="&amp;#x00B8;"/>
<xsl:output-character character="¹" string="&amp;#x00B9;"/>
<xsl:output-character character="º" string="&amp;#x00BA;"/>
<xsl:output-character character="»" string="&amp;#x00BB;"/>
<xsl:output-character character="¼" string="&amp;#x00BC;"/>
<xsl:output-character character="½" string="&amp;#x00BD;"/>
<xsl:output-character character="¾" string="&amp;#x00BE;"/>
<xsl:output-character character="¿" string="&amp;#x00BF;"/>
<xsl:output-character character="×" string="&amp;#x00D7;"/>
<xsl:output-character character="ß" string="&amp;#x00DF;"/>
<xsl:output-character character="À" string="&amp;#x00C0;"/>
<xsl:output-character character="à" string="&amp;#x00E0;"/>
<xsl:output-character character="Á" string="&amp;#x00C1;"/>
<xsl:output-character character="á" string="&amp;#x00E1;"/>
<xsl:output-character character="Â" string="&amp;#x00C2;"/>
<xsl:output-character character="â" string="&amp;#x00E2;"/>
<xsl:output-character character="Ã" string="&amp;#x00C3;"/>
<xsl:output-character character="ã" string="&amp;#x00E3;"/>
<xsl:output-character character="Ä" string="&amp;#x00C4;"/>
<xsl:output-character character="ä" string="&amp;#x00E4;"/>
<xsl:output-character character="Å" string="&amp;#x00C5;"/>
<xsl:output-character character="å" string="&amp;#x00E5;"/>
<xsl:output-character character="Å" string="&amp;#x212B;"/>
<xsl:output-character character="Æ" string="&amp;#x00C6;"/>
<xsl:output-character character="æ" string="&amp;#x00E6;"/>
<xsl:output-character character="Ç" string="&amp;#x00C7;"/>
<xsl:output-character character="ç" string="&amp;#x00E7;"/>
<xsl:output-character character="È" string="&amp;#x00C8;"/>
<xsl:output-character character="è" string="&amp;#x00E8;"/>
<xsl:output-character character="É" string="&amp;#x00C9;"/>
<xsl:output-character character="é" string="&amp;#x00E9;"/>
<xsl:output-character character="Ê" string="&amp;#x00CA;"/>
<xsl:output-character character="ê" string="&amp;#x00EA;"/>
<xsl:output-character character="Ë" string="&amp;#x00CB;"/>
<xsl:output-character character="ë" string="&amp;#x00EB;"/>
<xsl:output-character character="Ì" string="&amp;#x00CC;"/>
<xsl:output-character character="ì" string="&amp;#x00EC;"/>
<xsl:output-character character="Í" string="&amp;#x00CD;"/>
<xsl:output-character character="í" string="&amp;#x00ED;"/>
<xsl:output-character character="Î" string="&amp;#x00CE;"/>
<xsl:output-character character="î" string="&amp;#x00EE;"/>
<xsl:output-character character="Ï" string="&amp;#x00CF;"/>
<xsl:output-character character="ï" string="&amp;#x00EF;"/>
<xsl:output-character character="Ð" string="&amp;#x00D0;"/>
<xsl:output-character character="ð" string="&amp;#x00F0;"/>
<xsl:output-character character="Ñ" string="&amp;#x00D1;"/>
<xsl:output-character character="ñ" string="&amp;#x00F1;"/>
<xsl:output-character character="Ò" string="&amp;#x00D2;"/>
<xsl:output-character character="ò" string="&amp;#x00F2;"/>
<xsl:output-character character="Ó" string="&amp;#x00D3;"/>
<xsl:output-character character="ó" string="&amp;#x00F3;"/>
<xsl:output-character character="Ô" string="&amp;#x00D4;"/>
<xsl:output-character character="ô" string="&amp;#x00F4;"/>
<xsl:output-character character="Õ" string="&amp;#x00D5;"/>
<xsl:output-character character="õ" string="&amp;#x00F5;"/>
<xsl:output-character character="Ö" string="&amp;#x00D6;"/>
<xsl:output-character character="ö" string="&amp;#x00F6;"/>
<xsl:output-character character="÷" string="&amp;#x00F7;"/>
<xsl:output-character character="Ø" string="&amp;#x00D8;"/>
<xsl:output-character character="ø" string="&amp;#x00F8;"/>
<xsl:output-character character="Ù" string="&amp;#x00D9;"/>
<xsl:output-character character="ù" string="&amp;#x00F9;"/>
<xsl:output-character character="Ú" string="&amp;#x00DA;"/>
<xsl:output-character character="ú" string="&amp;#x00FA;"/>
<xsl:output-character character="Û" string="&amp;#x00DB;"/>
<xsl:output-character character="û" string="&amp;#x00FB;"/>
<xsl:output-character character="Ü" string="&amp;#x00DC;"/>
<xsl:output-character character="ü" string="&amp;#x00FC;"/>
<xsl:output-character character="Ý" string="&amp;#x00DD;"/>
<xsl:output-character character="ý" string="&amp;#x00FD;"/>
<xsl:output-character character="Þ" string="&amp;#x00DE;"/>
<xsl:output-character character="þ" string="&amp;#x00FE;"/>
<xsl:output-character character="ÿ" string="&amp;#x00FF;"/>
<xsl:output-character character="Ÿ" string="&amp;#x0178;"/>
<xsl:output-character character="Ā" string="&amp;#x0100;"/>
<xsl:output-character character="ā" string="&amp;#x0101;"/>
<xsl:output-character character="Ă" string="&amp;#x0102;"/>
<xsl:output-character character="ă" string="&amp;#x0103;"/>
<xsl:output-character character="Ą" string="&amp;#x0104;"/>
<xsl:output-character character="ą" string="&amp;#x0105;"/>
<xsl:output-character character="Ć" string="&amp;#x0106;"/>
<xsl:output-character character="ć" string="&amp;#x0107;"/>
<xsl:output-character character="Ĉ" string="&amp;#x0108;"/>
<xsl:output-character character="ĉ" string="&amp;#x0109;"/>
<xsl:output-character character="Ċ" string="&amp;#x010A;"/>
<xsl:output-character character="ċ" string="&amp;#x010B;"/>
<xsl:output-character character="Č" string="&amp;#x010C;"/>
<xsl:output-character character="č" string="&amp;#x010D;"/>
<xsl:output-character character="Ď" string="&amp;#x010E;"/>
<xsl:output-character character="ď" string="&amp;#x010F;"/>
<xsl:output-character character="Đ" string="&amp;#x0110;"/>
<xsl:output-character character="đ" string="&amp;#x0111;"/>
<xsl:output-character character="Ē" string="&amp;#x0112;"/>
<xsl:output-character character="ē" string="&amp;#x0113;"/>
<xsl:output-character character="Ė" string="&amp;#x0116;"/>
<xsl:output-character character="ė" string="&amp;#x0117;"/>
<xsl:output-character character="Ę" string="&amp;#x0118;"/>
<xsl:output-character character="ę" string="&amp;#x0119;"/>
<xsl:output-character character="Ě" string="&amp;#x011A;"/>
<xsl:output-character character="ě" string="&amp;#x011B;"/>
<xsl:output-character character="Ĝ" string="&amp;#x011C;"/>
<xsl:output-character character="ĝ" string="&amp;#x011D;"/>
<xsl:output-character character="Ğ" string="&amp;#x011E;"/>
<xsl:output-character character="ğ" string="&amp;#x011F;"/>
<xsl:output-character character="Ġ" string="&amp;#x0120;"/>
<xsl:output-character character="ġ" string="&amp;#x0121;"/>
<xsl:output-character character="Ģ" string="&amp;#x0122;"/>
<xsl:output-character character="Ĥ" string="&amp;#x0124;"/>
<xsl:output-character character="ĥ" string="&amp;#x0125;"/>
<xsl:output-character character="Ħ" string="&amp;#x0126;"/>
<xsl:output-character character="ħ" string="&amp;#x0127;"/>
<xsl:output-character character="Ĩ" string="&amp;#x0128;"/>
<xsl:output-character character="ĩ" string="&amp;#x0129;"/>
<xsl:output-character character="Ī" string="&amp;#x012A;"/>
<xsl:output-character character="ī" string="&amp;#x012B;"/>
<xsl:output-character character="Į" string="&amp;#x012E;"/>
<xsl:output-character character="į" string="&amp;#x012F;"/>
<xsl:output-character character="İ" string="&amp;#x0130;"/>
<xsl:output-character character="ı" string="&amp;#x0131;"/>
<xsl:output-character character="Ĳ" string="&amp;#x0132;"/>
<xsl:output-character character="ĳ" string="&amp;#x0133;"/>
<xsl:output-character character="Ĵ" string="&amp;#x0134;"/>
<xsl:output-character character="ĵ" string="&amp;#x0135;"/>
<xsl:output-character character="Ķ" string="&amp;#x0136;"/>
<xsl:output-character character="ķ" string="&amp;#x0137;"/>
<xsl:output-character character="ĸ" string="&amp;#x0138;"/>
<xsl:output-character character="Ĺ" string="&amp;#x0139;"/>
<xsl:output-character character="ĺ" string="&amp;#x013A;"/>
<xsl:output-character character="Ļ" string="&amp;#x013B;"/>
<xsl:output-character character="ļ" string="&amp;#x013C;"/>
<xsl:output-character character="Ľ" string="&amp;#x013D;"/>
<xsl:output-character character="ľ" string="&amp;#x013E;"/>
<xsl:output-character character="Ŀ" string="&amp;#x013F;"/>
<xsl:output-character character="ŀ" string="&amp;#x0140;"/>
<xsl:output-character character="Ł" string="&amp;#x0141;"/>
<xsl:output-character character="ł" string="&amp;#x0142;"/>
<xsl:output-character character="Ń" string="&amp;#x0143;"/>
<xsl:output-character character="ń" string="&amp;#x0144;"/>
<xsl:output-character character="Ņ" string="&amp;#x0145;"/>
<xsl:output-character character="ņ" string="&amp;#x0146;"/>
<xsl:output-character character="Ň" string="&amp;#x0147;"/>
<xsl:output-character character="ň" string="&amp;#x0148;"/>
<xsl:output-character character="ŉ" string="&amp;#x0149;"/>
<xsl:output-character character="Ŋ" string="&amp;#x014A;"/>
<xsl:output-character character="ŋ" string="&amp;#x014B;"/>
<xsl:output-character character="Ō" string="&amp;#x014C;"/>
<xsl:output-character character="ō" string="&amp;#x014D;"/>
<xsl:output-character character="Ő" string="&amp;#x0150;"/>
<xsl:output-character character="ő" string="&amp;#x0151;"/>
<xsl:output-character character="Œ" string="&amp;#x0152;"/>
<xsl:output-character character="œ" string="&amp;#x0153;"/>
<xsl:output-character character="Ŕ" string="&amp;#x0154;"/>
<xsl:output-character character="ŕ" string="&amp;#x0155;"/>
<xsl:output-character character="Ŗ" string="&amp;#x0156;"/>
<xsl:output-character character="ŗ" string="&amp;#x0157;"/>
<xsl:output-character character="Ř" string="&amp;#x0158;"/>
<xsl:output-character character="ř" string="&amp;#x0159;"/>
<xsl:output-character character="Ś" string="&amp;#x015A;"/>
<xsl:output-character character="ś" string="&amp;#x015B;"/>
<xsl:output-character character="Ŝ" string="&amp;#x015C;"/>
<xsl:output-character character="ŝ" string="&amp;#x015D;"/>
<xsl:output-character character="Ş" string="&amp;#x015E;"/>
<xsl:output-character character="ş" string="&amp;#x015F;"/>
<xsl:output-character character="Š" string="&amp;#x0160;"/>
<xsl:output-character character="š" string="&amp;#x0161;"/>
<xsl:output-character character="Ţ" string="&amp;#x0162;"/>
<xsl:output-character character="ţ" string="&amp;#x0163;"/>
<xsl:output-character character="Ť" string="&amp;#x0164;"/>
<xsl:output-character character="ť" string="&amp;#x0165;"/>
<xsl:output-character character="Ŧ" string="&amp;#x0166;"/>
<xsl:output-character character="ŧ" string="&amp;#x0167;"/>
<xsl:output-character character="Ũ" string="&amp;#x0168;"/>
<xsl:output-character character="ũ" string="&amp;#x0169;"/>
<xsl:output-character character="Ū" string="&amp;#x016A;"/>
<xsl:output-character character="ū" string="&amp;#x016B;"/>
<xsl:output-character character="Ŭ" string="&amp;#x016C;"/>
<xsl:output-character character="ŭ" string="&amp;#x016D;"/>
<xsl:output-character character="Ů" string="&amp;#x016E;"/>
<xsl:output-character character="ů" string="&amp;#x016F;"/>
<xsl:output-character character="Ű" string="&amp;#x0170;"/>
<xsl:output-character character="ű" string="&amp;#x0171;"/>
<xsl:output-character character="Ų" string="&amp;#x0172;"/>
<xsl:output-character character="ų" string="&amp;#x0173;"/>
<xsl:output-character character="Ŵ" string="&amp;#x0174;"/>
<xsl:output-character character="ŵ" string="&amp;#x0175;"/>
<xsl:output-character character="Ŷ" string="&amp;#x0176;"/>
<xsl:output-character character="ŷ" string="&amp;#x0177;"/>
<xsl:output-character character="Ź" string="&amp;#x0179;"/>
<xsl:output-character character="ź" string="&amp;#x017A;"/>
<xsl:output-character character="Ż" string="&amp;#x017B;"/>
<xsl:output-character character="ż" string="&amp;#x017C;"/>
<xsl:output-character character="Ž" string="&amp;#x017D;"/>
<xsl:output-character character="ž" string="&amp;#x017E;"/>
<xsl:output-character character="ƒ" string="&amp;#x0192;"/>
<xsl:output-character character="Ƶ" string="&amp;#x01B5;"/>
<xsl:output-character character="ǵ" string="&amp;#x01F5;"/>
<xsl:output-character character="ə" string="&amp;#x0259;"/>
<xsl:output-character character="ˆ" string="&amp;#x02C6;"/>
<xsl:output-character character="ˇ" string="&amp;#x02C7;"/>
<xsl:output-character character="˘" string="&amp;#x02D8;"/>
<xsl:output-character character="˙" string="&amp;#x02D9;"/>
<xsl:output-character character="˚" string="&amp;#x02DA;"/>
<xsl:output-character character="˛" string="&amp;#x02DB;"/>
<xsl:output-character character="˜" string="&amp;#x02DC;"/>
<xsl:output-character character="˝" string="&amp;#x02DD;"/>
<xsl:output-character character="ΐ" string="&amp;#x0390;"/>
<xsl:output-character character="Ά" string="&amp;#x0386;"/>
<xsl:output-character character="ά" string="&amp;#x03AC;"/>
<xsl:output-character character="Έ" string="&amp;#x0388;"/>
<xsl:output-character character="έ" string="&amp;#x03AD;"/>
<xsl:output-character character="Ή" string="&amp;#x0389;"/>
<xsl:output-character character="ή" string="&amp;#x03AE;"/>
<xsl:output-character character="Ί" string="&amp;#x038A;"/>
<xsl:output-character character="ί" string="&amp;#x03AF;"/>
<xsl:output-character character="ΰ" string="&amp;#x03B0;"/>
<xsl:output-character character="Α" string="&amp;#x0391;"/>
<xsl:output-character character="α" string="&amp;#x03B1;"/>
<xsl:output-character character="Β" string="&amp;#x0392;"/>
<xsl:output-character character="β" string="&amp;#x03B2;"/>
<xsl:output-character character="Γ" string="&amp;#x0393;"/>
<xsl:output-character character="γ" string="&amp;#x03B3;"/>
<xsl:output-character character="Δ" string="&amp;#x0394;"/>
<xsl:output-character character="δ" string="&amp;#x03B4;"/>
<xsl:output-character character="Ε" string="&amp;#x0395;"/>
<xsl:output-character character="ε" string="&amp;#x03B5;"/>
<xsl:output-character character="ϵ" string="&amp;#x03F5;"/>
<xsl:output-character character="Ζ" string="&amp;#x0396;"/>
<xsl:output-character character="ζ" string="&amp;#x03B6;"/>
<xsl:output-character character="Η" string="&amp;#x0397;"/>
<xsl:output-character character="η" string="&amp;#x03B7;"/>
<xsl:output-character character="Θ" string="&amp;#x0398;"/>
<xsl:output-character character="θ" string="&amp;#x03B8;"/>
<xsl:output-character character="ϑ" string="&amp;#x03D1;"/>
<xsl:output-character character="Ι" string="&amp;#x0399;"/>
<xsl:output-character character="ι" string="&amp;#x03B9;"/>
<xsl:output-character character="Κ" string="&amp;#x039A;"/>
<xsl:output-character character="κ" string="&amp;#x03BA;"/>
<xsl:output-character character="ϰ" string="&amp;#x03F0;"/>
<xsl:output-character character="Λ" string="&amp;#x039B;"/>
<xsl:output-character character="λ" string="&amp;#x03BB;"/>
<xsl:output-character character="Μ" string="&amp;#x039C;"/>
<xsl:output-character character="μ" string="&amp;#x03BC;"/>
<xsl:output-character character="Ν" string="&amp;#x039D;"/>
<xsl:output-character character="ν" string="&amp;#x03BD;"/>
<xsl:output-character character="Ξ" string="&amp;#x039E;"/>
<xsl:output-character character="ξ" string="&amp;#x03BE;"/>
<xsl:output-character character="Ο" string="&amp;#x039F;"/>
<xsl:output-character character="ο" string="&amp;#x03BF;"/>
<xsl:output-character character="Π" string="&amp;#x03A0;"/>
<xsl:output-character character="π" string="&amp;#x03C0;"/>
<xsl:output-character character="ϖ" string="&amp;#x03D6;"/>
<xsl:output-character character="Ρ" string="&amp;#x03A1;"/>
<xsl:output-character character="ρ" string="&amp;#x03C1;"/>
<xsl:output-character character="ϱ" string="&amp;#x03F1;"/>
<xsl:output-character character="Σ" string="&amp;#x03A3;"/>
<xsl:output-character character="ς" string="&amp;#x03C2;"/>
<xsl:output-character character="σ" string="&amp;#x03C3;"/>
<xsl:output-character character="Τ" string="&amp;#x03A4;"/>
<xsl:output-character character="τ" string="&amp;#x03C4;"/>
<xsl:output-character character="Υ" string="&amp;#x03A5;"/>
<xsl:output-character character="υ" string="&amp;#x03C5;"/>
<xsl:output-character character="Φ" string="&amp;#x03A6;"/>
<xsl:output-character character="φ" string="&amp;#x03C6;"/>
<xsl:output-character character="Χ" string="&amp;#x03A7;"/>
<xsl:output-character character="χ" string="&amp;#x03C7;"/>
<xsl:output-character character="Ψ" string="&amp;#x03A8;"/>
<xsl:output-character character="ψ" string="&amp;#x03C8;"/>
<xsl:output-character character="Ω" string="&amp;#x03A9;"/>
<xsl:output-character character="ω" string="&amp;#x03C9;"/>
<xsl:output-character character="Ω" string="&amp;#x2126;"/>
<xsl:output-character character="Ϊ" string="&amp;#x03AA;"/>
<xsl:output-character character="ϊ" string="&amp;#x03CA;"/>
<xsl:output-character character="Ϋ" string="&amp;#x03AB;"/>
<xsl:output-character character="ϋ" string="&amp;#x03CB;"/>
<xsl:output-character character="Ό" string="&amp;#x038C;"/>
<xsl:output-character character="ό" string="&amp;#x03CC;"/>
<xsl:output-character character="Ύ" string="&amp;#x038E;"/>
<xsl:output-character character="ύ" string="&amp;#x03CD;"/>
<xsl:output-character character="Ώ" string="&amp;#x038F;"/>
<xsl:output-character character="ώ" string="&amp;#x03CE;"/>
<xsl:output-character character="ϒ" string="&amp;#x03D2;"/>
<xsl:output-character character="Ϝ" string="&amp;#x03DC;"/>
<xsl:output-character character="ϝ" string="&amp;#x03DD;"/>
<xsl:output-character character="϶" string="&amp;#x03F6;"/>
<xsl:output-character character="А" string="&amp;#x0410;"/>
<xsl:output-character character="а" string="&amp;#x0430;"/>
<xsl:output-character character="Б" string="&amp;#x0411;"/>
<xsl:output-character character="б" string="&amp;#x0431;"/>
<xsl:output-character character="В" string="&amp;#x0412;"/>
<xsl:output-character character="в" string="&amp;#x0432;"/>
<xsl:output-character character="Г" string="&amp;#x0413;"/>
<xsl:output-character character="г" string="&amp;#x0433;"/>
<xsl:output-character character="Д" string="&amp;#x0414;"/>
<xsl:output-character character="д" string="&amp;#x0434;"/>
<xsl:output-character character="Е" string="&amp;#x0415;"/>
<xsl:output-character character="е" string="&amp;#x0435;"/>
<xsl:output-character character="Ж" string="&amp;#x0416;"/>
<xsl:output-character character="ж" string="&amp;#x0436;"/>
<xsl:output-character character="З" string="&amp;#x0417;"/>
<xsl:output-character character="з" string="&amp;#x0437;"/>
<xsl:output-character character="И" string="&amp;#x0418;"/>
<xsl:output-character character="и" string="&amp;#x0438;"/>
<xsl:output-character character="Й" string="&amp;#x0419;"/>
<xsl:output-character character="й" string="&amp;#x0439;"/>
<xsl:output-character character="К" string="&amp;#x041A;"/>
<xsl:output-character character="к" string="&amp;#x043A;"/>
<xsl:output-character character="Л" string="&amp;#x041B;"/>
<xsl:output-character character="л" string="&amp;#x043B;"/>
<xsl:output-character character="М" string="&amp;#x041C;"/>
<xsl:output-character character="м" string="&amp;#x043C;"/>
<xsl:output-character character="Н" string="&amp;#x041D;"/>
<xsl:output-character character="н" string="&amp;#x043D;"/>
<xsl:output-character character="О" string="&amp;#x041E;"/>
<xsl:output-character character="о" string="&amp;#x043E;"/>
<xsl:output-character character="П" string="&amp;#x041F;"/>
<xsl:output-character character="п" string="&amp;#x043F;"/>
<xsl:output-character character="Р" string="&amp;#x0420;"/>
<xsl:output-character character="р" string="&amp;#x0440;"/>
<xsl:output-character character="С" string="&amp;#x0421;"/>
<xsl:output-character character="с" string="&amp;#x0441;"/>
<xsl:output-character character="Т" string="&amp;#x0422;"/>
<xsl:output-character character="т" string="&amp;#x0442;"/>
<xsl:output-character character="У" string="&amp;#x0423;"/>
<xsl:output-character character="у" string="&amp;#x0443;"/>
<xsl:output-character character="Ф" string="&amp;#x0424;"/>
<xsl:output-character character="ф" string="&amp;#x0444;"/>
<xsl:output-character character="Х" string="&amp;#x0425;"/>
<xsl:output-character character="х" string="&amp;#x0445;"/>
<xsl:output-character character="Ц" string="&amp;#x0426;"/>
<xsl:output-character character="ц" string="&amp;#x0446;"/>
<xsl:output-character character="Ч" string="&amp;#x0427;"/>
<xsl:output-character character="ч" string="&amp;#x0447;"/>
<xsl:output-character character="Ш" string="&amp;#x0428;"/>
<xsl:output-character character="ш" string="&amp;#x0448;"/>
<xsl:output-character character="Щ" string="&amp;#x0429;"/>
<xsl:output-character character="щ" string="&amp;#x0449;"/>
<xsl:output-character character="Ъ" string="&amp;#x042A;"/>
<xsl:output-character character="ъ" string="&amp;#x044A;"/>
<xsl:output-character character="Ы" string="&amp;#x042B;"/>
<xsl:output-character character="ы" string="&amp;#x044B;"/>
<xsl:output-character character="Ь" string="&amp;#x042C;"/>
<xsl:output-character character="ь" string="&amp;#x044C;"/>
<xsl:output-character character="Э" string="&amp;#x042D;"/>
<xsl:output-character character="э" string="&amp;#x044D;"/>
<xsl:output-character character="Ю" string="&amp;#x042E;"/>
<xsl:output-character character="ю" string="&amp;#x044E;"/>
<xsl:output-character character="Я" string="&amp;#x042F;"/>
<xsl:output-character character="я" string="&amp;#x044F;"/>
<xsl:output-character character="Ё" string="&amp;#x0401;"/>
<xsl:output-character character="ё" string="&amp;#x0451;"/>
<xsl:output-character character="Ђ" string="&amp;#x0402;"/>
<xsl:output-character character="ђ" string="&amp;#x0452;"/>
<xsl:output-character character="Ѓ" string="&amp;#x0403;"/>
<xsl:output-character character="ѓ" string="&amp;#x0453;"/>
<xsl:output-character character="Є" string="&amp;#x0404;"/>
<xsl:output-character character="є" string="&amp;#x0454;"/>
<xsl:output-character character="Ѕ" string="&amp;#x0405;"/>
<xsl:output-character character="ѕ" string="&amp;#x0455;"/>
<xsl:output-character character="І" string="&amp;#x0406;"/>
<xsl:output-character character="і" string="&amp;#x0456;"/>
<xsl:output-character character="Ї" string="&amp;#x0407;"/>
<xsl:output-character character="ї" string="&amp;#x0457;"/>
<xsl:output-character character="Ј" string="&amp;#x0408;"/>
<xsl:output-character character="ј" string="&amp;#x0458;"/>
<xsl:output-character character="Љ" string="&amp;#x0409;"/>
<xsl:output-character character="љ" string="&amp;#x0459;"/>
<xsl:output-character character="Њ" string="&amp;#x040A;"/>
<xsl:output-character character="њ" string="&amp;#x045A;"/>
<xsl:output-character character="Ћ" string="&amp;#x040B;"/>
<xsl:output-character character="ћ" string="&amp;#x045B;"/>
<xsl:output-character character="Ќ" string="&amp;#x040C;"/>
<xsl:output-character character="ќ" string="&amp;#x045C;"/>
<xsl:output-character character="Ў" string="&amp;#x040E;"/>
<xsl:output-character character="ў" string="&amp;#x045E;"/>
<xsl:output-character character="Џ" string="&amp;#x040F;"/>
<xsl:output-character character="џ" string="&amp;#x045F;"/>
<!--<xsl:output-character character=" " string=" "/>
<xsl:output-character character=" " string="&amp;#x2002;"/>
<xsl:output-character character=" " string="&#160;&#160;"/>-->
<!--<xsl:output-character character=" " string="&amp;#x2003;"/>-->
<xsl:output-character character=" " string="&amp;#x2004;"/>
<xsl:output-character character=" " string="&amp;#x2005;"/>
<xsl:output-character character=" " string="&amp;#x2007;"/>
<xsl:output-character character=" " string="&amp;#x2008;"/>
<xsl:output-character character=" " string="&amp;#x2009;"/>
<!--<xsl:output-character character=" " string="&amp;#x200A;"/>-->
<xsl:output-character character="‐" string="&amp;#x2010;"/>
<xsl:output-character character="–" string="&amp;#x2013;"/>
<xsl:output-character character="—" string="&amp;#x2014;"/>
<xsl:output-character character="―" string="&amp;#x2015;"/>
<xsl:output-character character="‖" string="&amp;#x2016;"/>
<xsl:output-character character="‘" string="&amp;#x2018;"/>
<xsl:output-character character="’" string="&amp;#x2019;"/>
<xsl:output-character character="‚" string="&amp;#x201A;"/>
<xsl:output-character character="“" string="&amp;#x201C;"/>
<xsl:output-character character="”" string="&amp;#x201D;"/>
<xsl:output-character character="„" string="&amp;#x201E;"/>
<xsl:output-character character="†" string="&amp;#x2020;"/>
<xsl:output-character character="‡" string="&amp;#x2021;"/>
<xsl:output-character character="•" string="&amp;#x2022;"/>
<xsl:output-character character="‥" string="&amp;#x2025;"/>
<xsl:output-character character="…" string="&amp;#x2026;"/>
<xsl:output-character character=" " string="&amp;#x2029;"/>
<xsl:output-character character="‰" string="&amp;#x2030;"/>
<xsl:output-character character="‱" string="&amp;#x2031;"/>
<xsl:output-character character="′" string="&amp;#x2032;"/>
<xsl:output-character character="″" string="&amp;#x2033;"/>
<xsl:output-character character="‴" string="&amp;#x2034;"/>
<xsl:output-character character="‵" string="&amp;#x2035;"/>
<xsl:output-character character="⁁" string="&amp;#x2041;"/>
<xsl:output-character character="⁃" string="&amp;#x2043;"/>
<xsl:output-character character="⁏" string="&amp;#x204F;"/>
<xsl:output-character character="⁗" string="&amp;#x2057;"/>
<xsl:output-character character="⃛" string="&amp;#x20DB;"/>
<xsl:output-character character="⃜" string="&amp;#x20DC;"/>
<xsl:output-character character="℅" string="&amp;#x2105;"/>
<xsl:output-character character="ℋ" string="&amp;#x210B;"/>
<xsl:output-character character="ℏ" string="&amp;#x210F;"/>
<xsl:output-character character="ℑ" string="&amp;#x2111;"/>
<xsl:output-character character="ℒ" string="&amp;#x2112;"/>
<xsl:output-character character="ℓ" string="&amp;#x2113;"/>
<xsl:output-character character="№" string="&amp;#x2116;"/>
<xsl:output-character character="℗" string="&amp;#x2117;"/>
<xsl:output-character character="℘" string="&amp;#x2118;"/>
<xsl:output-character character="ℜ" string="&amp;#x211C;"/>
<xsl:output-character character="℞" string="&amp;#x211E;"/>
<xsl:output-character character="™" string="&amp;#x2122;"/>
<xsl:output-character character="℧" string="&amp;#x2127;"/>
<xsl:output-character character="℩" string="&amp;#x2129;"/>
<xsl:output-character character="ℬ" string="&amp;#x212C;"/>
<xsl:output-character character="ℳ" string="&amp;#x2133;"/>
<xsl:output-character character="ℴ" string="&amp;#x2134;"/>
<xsl:output-character character="ℵ" string="&amp;#x2135;"/>
<xsl:output-character character="ℶ" string="&amp;#x2136;"/>
<xsl:output-character character="ℷ" string="&amp;#x2137;"/>
<xsl:output-character character="ℸ" string="&amp;#x2138;"/>
<xsl:output-character character="⅓" string="&amp;#x2153;"/>
<xsl:output-character character="⅔" string="&amp;#x2154;"/>
<xsl:output-character character="⅕" string="&amp;#x2155;"/>
<xsl:output-character character="⅖" string="&amp;#x2156;"/>
<xsl:output-character character="⅗" string="&amp;#x2157;"/>
<xsl:output-character character="⅘" string="&amp;#x2158;"/>
<xsl:output-character character="⅙" string="&amp;#x2159;"/>
<xsl:output-character character="⅚" string="&amp;#x215A;"/>
<xsl:output-character character="⅛" string="&amp;#x215B;"/>
<xsl:output-character character="⅜" string="&amp;#x215C;"/>
<xsl:output-character character="⅝" string="&amp;#x215D;"/>
<xsl:output-character character="⅞" string="&amp;#x215E;"/>
<xsl:output-character character="←" string="&amp;#x2190;"/>
<xsl:output-character character="↑" string="&amp;#x2191;"/>
<xsl:output-character character="→" string="&amp;#x2192;"/>
<xsl:output-character character="↓" string="&amp;#x2193;"/>
<xsl:output-character character="↔" string="&amp;#x2194;"/>
<xsl:output-character character="↕" string="&amp;#x2195;"/>
<xsl:output-character character="↖" string="&amp;#x2196;"/>
<xsl:output-character character="↗" string="&amp;#x2197;"/>
<xsl:output-character character="↘" string="&amp;#x2198;"/>
<xsl:output-character character="↙" string="&amp;#x2199;"/>
<xsl:output-character character="↚" string="&amp;#x219A;"/>
<xsl:output-character character="↛" string="&amp;#x219B;"/>
<xsl:output-character character="↝" string="&amp;#x219D;"/>
<xsl:output-character character="↞" string="&amp;#x219E;"/>
<xsl:output-character character="↟" string="&amp;#x219F;"/>
<xsl:output-character character="↠" string="&amp;#x21A0;"/>
<xsl:output-character character="↡" string="&amp;#x21A1;"/>
<xsl:output-character character="↢" string="&amp;#x21A2;"/>
<xsl:output-character character="↣" string="&amp;#x21A3;"/>
<xsl:output-character character="↦" string="&amp;#x21A6;"/>
<xsl:output-character character="↩" string="&amp;#x21A9;"/>
<xsl:output-character character="↪" string="&amp;#x21AA;"/>
<xsl:output-character character="↫" string="&amp;#x21AB;"/>
<xsl:output-character character="↬" string="&amp;#x21AC;"/>
<xsl:output-character character="↭" string="&amp;#x21AD;"/>
<xsl:output-character character="↮" string="&amp;#x21AE;"/>
<xsl:output-character character="↰" string="&amp;#x21B0;"/>
<xsl:output-character character="↱" string="&amp;#x21B1;"/>
<xsl:output-character character="↲" string="&amp;#x21B2;"/>
<xsl:output-character character="↳" string="&amp;#x21B3;"/>
<xsl:output-character character="↶" string="&amp;#x21B6;"/>
<xsl:output-character character="↷" string="&amp;#x21B7;"/>
<xsl:output-character character="↺" string="&amp;#x21BA;"/>
<xsl:output-character character="↻" string="&amp;#x21BB;"/>
<xsl:output-character character="↼" string="&amp;#x21BC;"/>
<xsl:output-character character="↽" string="&amp;#x21BD;"/>
<xsl:output-character character="↾" string="&amp;#x21BE;"/>
<xsl:output-character character="↿" string="&amp;#x21BF;"/>
<xsl:output-character character="⇀" string="&amp;#x21C0;"/>
<xsl:output-character character="⇁" string="&amp;#x21C1;"/>
<xsl:output-character character="⇂" string="&amp;#x21C2;"/>
<xsl:output-character character="⇃" string="&amp;#x21C3;"/>
<xsl:output-character character="⇄" string="&amp;#x21C4;"/>
<xsl:output-character character="⇅" string="&amp;#x21C5;"/>
<xsl:output-character character="⇆" string="&amp;#x21C6;"/>
<xsl:output-character character="⇇" string="&amp;#x21C7;"/>
<xsl:output-character character="⇈" string="&amp;#x21C8;"/>
<xsl:output-character character="⇉" string="&amp;#x21C9;"/>
<xsl:output-character character="⇊" string="&amp;#x21CA;"/>
<xsl:output-character character="⇋" string="&amp;#x21CB;"/>
<xsl:output-character character="⇌" string="&amp;#x21CC;"/>
<xsl:output-character character="⇍" string="&amp;#x21CD;"/>
<xsl:output-character character="⇎" string="&amp;#x21CE;"/>
<xsl:output-character character="⇏" string="&amp;#x21CF;"/>
<xsl:output-character character="⇐" string="&amp;#x21D0;"/>
<xsl:output-character character="⇑" string="&amp;#x21D1;"/>
<xsl:output-character character="⇒" string="&amp;#x21D2;"/>
<xsl:output-character character="⇓" string="&amp;#x21D3;"/>
<xsl:output-character character="⇔" string="&amp;#x21D4;"/>
<xsl:output-character character="⇕" string="&amp;#x21D5;"/>
<xsl:output-character character="⇖" string="&amp;#x21D6;"/>
<xsl:output-character character="⇗" string="&amp;#x21D7;"/>
<xsl:output-character character="⇘" string="&amp;#x21D8;"/>
<xsl:output-character character="⇙" string="&amp;#x21D9;"/>
<xsl:output-character character="⇚" string="&amp;#x21DA;"/>
<xsl:output-character character="⇛" string="&amp;#x21DB;"/>
<xsl:output-character character="⇝" string="&amp;#x21DD;"/>
<xsl:output-character character="⇵" string="&amp;#x21F5;"/>
<xsl:output-character character="⇽" string="&amp;#x21FD;"/>
<xsl:output-character character="⇾" string="&amp;#x21FE;"/>
<xsl:output-character character="⇿" string="&amp;#x21FF;"/>
<xsl:output-character character="∀" string="&amp;#x2200;"/>
<xsl:output-character character="∁" string="&amp;#x2201;"/>
<xsl:output-character character="∂" string="&amp;#x2202;"/>
<xsl:output-character character="∃" string="&amp;#x2203;"/>
<xsl:output-character character="∄" string="&amp;#x2204;"/>
<xsl:output-character character="∅" string="&amp;#x2205;"/>
<xsl:output-character character="∇" string="&amp;#x2207;"/>
<xsl:output-character character="∈" string="&amp;#x2208;"/>
<xsl:output-character character="∉" string="&amp;#x2209;"/>
<xsl:output-character character="∋" string="&amp;#x220B;"/>
<xsl:output-character character="∌" string="&amp;#x220C;"/>
<xsl:output-character character="∏" string="&amp;#x220F;"/>
<xsl:output-character character="∐" string="&amp;#x2210;"/>
<xsl:output-character character="∑" string="&amp;#x2211;"/>
<xsl:output-character character="−" string="&amp;#x2212;"/>
<xsl:output-character character="∓" string="&amp;#x2213;"/>
<xsl:output-character character="∔" string="&amp;#x2214;"/>
<xsl:output-character character="∖" string="&amp;#x2216;"/>
<xsl:output-character character="∗" string="&amp;#x2217;"/>
<xsl:output-character character="∘" string="&amp;#x2218;"/>
<xsl:output-character character="√" string="&amp;#x221A;"/>
<xsl:output-character character="∝" string="&amp;#x221D;"/>
<xsl:output-character character="∞" string="&amp;#x221E;"/>
<xsl:output-character character="∟" string="&amp;#x221F;"/>
<xsl:output-character character="∠" string="&amp;#x2220;"/>
<xsl:output-character character="∡" string="&amp;#x2221;"/>
<xsl:output-character character="∢" string="&amp;#x2222;"/>
<xsl:output-character character="∣" string="&amp;#x2223;"/>
<xsl:output-character character="∤" string="&amp;#x2224;"/>
<xsl:output-character character="∥" string="&amp;#x2225;"/>
<xsl:output-character character="∦" string="&amp;#x2226;"/>
<xsl:output-character character="∧" string="&amp;#x2227;"/>
<xsl:output-character character="∨" string="&amp;#x2228;"/>
<xsl:output-character character="∩" string="&amp;#x2229;"/>
<xsl:output-character character="∪" string="&amp;#x222A;"/>
<xsl:output-character character="∫" string="&amp;#x222B;"/>
<xsl:output-character character="∬" string="&amp;#x222C;"/>
<xsl:output-character character="∭" string="&amp;#x222D;"/>
<xsl:output-character character="∮" string="&amp;#x222E;"/>
<xsl:output-character character="∯" string="&amp;#x222F;"/>
<xsl:output-character character="∰" string="&amp;#x2230;"/>
<xsl:output-character character="∱" string="&amp;#x2231;"/>
<xsl:output-character character="∲" string="&amp;#x2232;"/>
<xsl:output-character character="∳" string="&amp;#x2233;"/>
<xsl:output-character character="∴" string="&amp;#x2234;"/>
<xsl:output-character character="∵" string="&amp;#x2235;"/>
<xsl:output-character character="∶" string="&amp;#x2236;"/>
<xsl:output-character character="∷" string="&amp;#x2237;"/>
<xsl:output-character character="∸" string="&amp;#x2238;"/>
<xsl:output-character character="∺" string="&amp;#x223A;"/>
<xsl:output-character character="∻" string="&amp;#x223B;"/>
<xsl:output-character character="∼" string="&amp;#x223C;"/>
<xsl:output-character character="∽" string="&amp;#x223D;"/>
<xsl:output-character character="∾" string="&amp;#x223E;"/>
<xsl:output-character character="∿" string="&amp;#x223F;"/>
<xsl:output-character character="≀" string="&amp;#x2240;"/>
<xsl:output-character character="≁" string="&amp;#x2241;"/>
<xsl:output-character character="≂" string="&amp;#x2242;"/>
<xsl:output-character character="≃" string="&amp;#x2243;"/>
<xsl:output-character character="≄" string="&amp;#x2244;"/>
<xsl:output-character character="≅" string="&amp;#x2245;"/>
<xsl:output-character character="≆" string="&amp;#x2246;"/>
<xsl:output-character character="≇" string="&amp;#x2247;"/>
<xsl:output-character character="≈" string="&amp;#x2248;"/>
<xsl:output-character character="≉" string="&amp;#x2249;"/>
<xsl:output-character character="≊" string="&amp;#x224A;"/>
<xsl:output-character character="≋" string="&amp;#x224B;"/>
<xsl:output-character character="≌" string="&amp;#x224C;"/>
<xsl:output-character character="≎" string="&amp;#x224E;"/>
<xsl:output-character character="≏" string="&amp;#x224F;"/>
<xsl:output-character character="≐" string="&amp;#x2250;"/>
<xsl:output-character character="≑" string="&amp;#x2251;"/>
<xsl:output-character character="≒" string="&amp;#x2252;"/>
<xsl:output-character character="≓" string="&amp;#x2253;"/>
<xsl:output-character character="≔" string="&amp;#x2254;"/>
<xsl:output-character character="≕" string="&amp;#x2255;"/>
<xsl:output-character character="≖" string="&amp;#x2256;"/>
<xsl:output-character character="≗" string="&amp;#x2257;"/>
<xsl:output-character character="≙" string="&amp;#x2259;"/>
<xsl:output-character character="≚" string="&amp;#x225A;"/>
<xsl:output-character character="≜" string="&amp;#x225C;"/>
<xsl:output-character character="≟" string="&amp;#x225F;"/>
<xsl:output-character character="≠" string="&amp;#x2260;"/>
<xsl:output-character character="≡" string="&amp;#x2261;"/>
<xsl:output-character character="≢" string="&amp;#x2262;"/>
<xsl:output-character character="≤" string="&amp;#x2264;"/>
<xsl:output-character character="≥" string="&amp;#x2265;"/>
<xsl:output-character character="≦" string="&amp;#x2266;"/>
<xsl:output-character character="≧" string="&amp;#x2267;"/>
<xsl:output-character character="≨" string="&amp;#x2268;"/>
<xsl:output-character character="≩" string="&amp;#x2269;"/>
<xsl:output-character character="≪" string="&amp;#x226A;"/>
<xsl:output-character character="≫" string="&amp;#x226B;"/>
<xsl:output-character character="≬" string="&amp;#x226C;"/>
<xsl:output-character character="≮" string="&amp;#x226E;"/>
<xsl:output-character character="≯" string="&amp;#x226F;"/>
<xsl:output-character character="≰" string="&amp;#x2270;"/>
<xsl:output-character character="≱" string="&amp;#x2271;"/>
<xsl:output-character character="≲" string="&amp;#x2272;"/>
<xsl:output-character character="≳" string="&amp;#x2273;"/>
<xsl:output-character character="≴" string="&amp;#x2274;"/>
<xsl:output-character character="≵" string="&amp;#x2275;"/>
<xsl:output-character character="≶" string="&amp;#x2276;"/>
<xsl:output-character character="≷" string="&amp;#x2277;"/>
<xsl:output-character character="≸" string="&amp;#x2278;"/>
<xsl:output-character character="≹" string="&amp;#x2279;"/>
<xsl:output-character character="≺" string="&amp;#x227A;"/>
<xsl:output-character character="≻" string="&amp;#x227B;"/>
<xsl:output-character character="≼" string="&amp;#x227C;"/>
<xsl:output-character character="≽" string="&amp;#x227D;"/>
<xsl:output-character character="≾" string="&amp;#x227E;"/>
<xsl:output-character character="≿" string="&amp;#x227F;"/>
<xsl:output-character character="⊀" string="&amp;#x2280;"/>
<xsl:output-character character="⊁" string="&amp;#x2281;"/>
<xsl:output-character character="⊂" string="&amp;#x2282;"/>
<xsl:output-character character="⊃" string="&amp;#x2283;"/>
<xsl:output-character character="⊄" string="&amp;#x2284;"/>
<xsl:output-character character="⊅" string="&amp;#x2285;"/>
<xsl:output-character character="⊆" string="&amp;#x2286;"/>
<xsl:output-character character="⊇" string="&amp;#x2287;"/>
<xsl:output-character character="⊈" string="&amp;#x2288;"/>
<xsl:output-character character="⊉" string="&amp;#x2289;"/>
<xsl:output-character character="⊊" string="&amp;#x228A;"/>
<xsl:output-character character="⊋" string="&amp;#x228B;"/>
<xsl:output-character character="⊍" string="&amp;#x228D;"/>
<xsl:output-character character="⊎" string="&amp;#x228E;"/>
<xsl:output-character character="⊏" string="&amp;#x228F;"/>
<xsl:output-character character="⊐" string="&amp;#x2290;"/>
<xsl:output-character character="⊑" string="&amp;#x2291;"/>
<xsl:output-character character="⊒" string="&amp;#x2292;"/>
<xsl:output-character character="⊓" string="&amp;#x2293;"/>
<xsl:output-character character="⊔" string="&amp;#x2294;"/>
<xsl:output-character character="⊕" string="&amp;#x2295;"/>
<xsl:output-character character="⊖" string="&amp;#x2296;"/>
<xsl:output-character character="⊗" string="&amp;#x2297;"/>
<xsl:output-character character="⊘" string="&amp;#x2298;"/>
<xsl:output-character character="⊙" string="&amp;#x2299;"/>
<xsl:output-character character="⊚" string="&amp;#x229A;"/>
<xsl:output-character character="⊛" string="&amp;#x229B;"/>
<xsl:output-character character="⊝" string="&amp;#x229D;"/>
<xsl:output-character character="⊞" string="&amp;#x229E;"/>
<xsl:output-character character="⊟" string="&amp;#x229F;"/>
<xsl:output-character character="⊠" string="&amp;#x22A0;"/>
<xsl:output-character character="⊡" string="&amp;#x22A1;"/>
<xsl:output-character character="⊢" string="&amp;#x22A2;"/>
<xsl:output-character character="⊣" string="&amp;#x22A3;"/>
<xsl:output-character character="⊤" string="&amp;#x22A4;"/>
<xsl:output-character character="⊥" string="&amp;#x22A5;"/>
<xsl:output-character character="⊧" string="&amp;#x22A7;"/>
<xsl:output-character character="⊨" string="&amp;#x22A8;"/>
<xsl:output-character character="⊩" string="&amp;#x22A9;"/>
<xsl:output-character character="⊪" string="&amp;#x22AA;"/>
<xsl:output-character character="⊫" string="&amp;#x22AB;"/>
<xsl:output-character character="⊬" string="&amp;#x22AC;"/>
<xsl:output-character character="⊭" string="&amp;#x22AD;"/>
<xsl:output-character character="⊮" string="&amp;#x22AE;"/>
<xsl:output-character character="⊯" string="&amp;#x22AF;"/>
<xsl:output-character character="⊰" string="&amp;#x22B0;"/>
<xsl:output-character character="⊲" string="&amp;#x22B2;"/>
<xsl:output-character character="⊳" string="&amp;#x22B3;"/>
<xsl:output-character character="⊴" string="&amp;#x22B4;"/>
<xsl:output-character character="⊵" string="&amp;#x22B5;"/>
<xsl:output-character character="⊶" string="&amp;#x22B6;"/>
<xsl:output-character character="⊷" string="&amp;#x22B7;"/>
<xsl:output-character character="⊸" string="&amp;#x22B8;"/>
<xsl:output-character character="⊹" string="&amp;#x22B9;"/>
<xsl:output-character character="⊺" string="&amp;#x22BA;"/>
<xsl:output-character character="⊻" string="&amp;#x22BB;"/>
<xsl:output-character character="⊽" string="&amp;#x22BD;"/>
<xsl:output-character character="⊾" string="&amp;#x22BE;"/>
<xsl:output-character character="⊿" string="&amp;#x22BF;"/>
<xsl:output-character character="⋀" string="&amp;#x22C0;"/>
<xsl:output-character character="⋁" string="&amp;#x22C1;"/>
<xsl:output-character character="⋂" string="&amp;#x22C2;"/>
<xsl:output-character character="⋃" string="&amp;#x22C3;"/>
<xsl:output-character character="⋄" string="&amp;#x22C4;"/>
<xsl:output-character character="⋅" string="&amp;#x22C5;"/>
<xsl:output-character character="⋆" string="&amp;#x22C6;"/>
<xsl:output-character character="⋇" string="&amp;#x22C7;"/>
<xsl:output-character character="⋈" string="&amp;#x22C8;"/>
<xsl:output-character character="⋉" string="&amp;#x22C9;"/>
<xsl:output-character character="⋊" string="&amp;#x22CA;"/>
<xsl:output-character character="⋋" string="&amp;#x22CB;"/>
<xsl:output-character character="⋌" string="&amp;#x22CC;"/>
<xsl:output-character character="⋍" string="&amp;#x22CD;"/>
<xsl:output-character character="⋎" string="&amp;#x22CE;"/>
<xsl:output-character character="⋏" string="&amp;#x22CF;"/>
<xsl:output-character character="⋐" string="&amp;#x22D0;"/>
<xsl:output-character character="⋑" string="&amp;#x22D1;"/>
<xsl:output-character character="⋒" string="&amp;#x22D2;"/>
<xsl:output-character character="⋓" string="&amp;#x22D3;"/>
<xsl:output-character character="⋔" string="&amp;#x22D4;"/>
<xsl:output-character character="⋕" string="&amp;#x22D5;"/>
<xsl:output-character character="⋖" string="&amp;#x22D6;"/>
<xsl:output-character character="⋗" string="&amp;#x22D7;"/>
<xsl:output-character character="⋘" string="&amp;#x22D8;"/>
<xsl:output-character character="⋙" string="&amp;#x22D9;"/>
<xsl:output-character character="⋚" string="&amp;#x22DA;"/>
<xsl:output-character character="⋛" string="&amp;#x22DB;"/>
<xsl:output-character character="⋞" string="&amp;#x22DE;"/>
<xsl:output-character character="⋟" string="&amp;#x22DF;"/>
<xsl:output-character character="⋠" string="&amp;#x22E0;"/>
<xsl:output-character character="⋡" string="&amp;#x22E1;"/>
<xsl:output-character character="⋢" string="&amp;#x22E2;"/>
<xsl:output-character character="⋣" string="&amp;#x22E3;"/>
<xsl:output-character character="⋦" string="&amp;#x22E6;"/>
<xsl:output-character character="⋧" string="&amp;#x22E7;"/>
<xsl:output-character character="⋨" string="&amp;#x22E8;"/>
<xsl:output-character character="⋩" string="&amp;#x22E9;"/>
<xsl:output-character character="⋪" string="&amp;#x22EA;"/>
<xsl:output-character character="⋫" string="&amp;#x22EB;"/>
<xsl:output-character character="⋬" string="&amp;#x22EC;"/>
<xsl:output-character character="⋭" string="&amp;#x22ED;"/>
<xsl:output-character character="⋮" string="&amp;#x22EE;"/>
<xsl:output-character character="⋯" string="&amp;#x22EF;"/>
<xsl:output-character character="⋰" string="&amp;#x22F0;"/>
<xsl:output-character character="⋱" string="&amp;#x22F1;"/>
<xsl:output-character character="⋲" string="&amp;#x22F2;"/>
<xsl:output-character character="⋳" string="&amp;#x22F3;"/>
<xsl:output-character character="⋴" string="&amp;#x22F4;"/>
<xsl:output-character character="⋵" string="&amp;#x22F5;"/>
<xsl:output-character character="⋶" string="&amp;#x22F6;"/>
<xsl:output-character character="⋷" string="&amp;#x22F7;"/>
<xsl:output-character character="⋹" string="&amp;#x22F9;"/>
<xsl:output-character character="⋺" string="&amp;#x22FA;"/>
<xsl:output-character character="⋻" string="&amp;#x22FB;"/>
<xsl:output-character character="⋼" string="&amp;#x22FC;"/>
<xsl:output-character character="⋽" string="&amp;#x22FD;"/>
<xsl:output-character character="⋾" string="&amp;#x22FE;"/>
<xsl:output-character character="⌅" string="&amp;#x2305;"/>
<xsl:output-character character="⌆" string="&amp;#x2306;"/>
<xsl:output-character character="⌈" string="&amp;#x2308;"/>
<xsl:output-character character="⌉" string="&amp;#x2309;"/>
<xsl:output-character character="⌊" string="&amp;#x230A;"/>
<xsl:output-character character="⌋" string="&amp;#x230B;"/>
<xsl:output-character character="⌌" string="&amp;#x230C;"/>
<xsl:output-character character="⌍" string="&amp;#x230D;"/>
<xsl:output-character character="⌎" string="&amp;#x230E;"/>
<xsl:output-character character="⌏" string="&amp;#x230F;"/>
<xsl:output-character character="⌐" string="&amp;#x2310;"/>
<xsl:output-character character="⌒" string="&amp;#x2312;"/>
<xsl:output-character character="⌓" string="&amp;#x2313;"/>
<xsl:output-character character="⌕" string="&amp;#x2315;"/>
<xsl:output-character character="⌖" string="&amp;#x2316;"/>
<xsl:output-character character="⌜" string="&amp;#x231C;"/>
<xsl:output-character character="⌝" string="&amp;#x231D;"/>
<xsl:output-character character="⌞" string="&amp;#x231E;"/>
<xsl:output-character character="⌟" string="&amp;#x231F;"/>
<xsl:output-character character="⌢" string="&amp;#x2322;"/>
<xsl:output-character character="⌣" string="&amp;#x2323;"/>
<xsl:output-character character="〈" string="&amp;#x2329;"/>
<xsl:output-character character="〉" string="&amp;#x232A;"/>
<xsl:output-character character="⌭" string="&amp;#x232D;"/>
<xsl:output-character character="⌮" string="&amp;#x232E;"/>
<xsl:output-character character="⌶" string="&amp;#x2336;"/>
<xsl:output-character character="⌽" string="&amp;#x233D;"/>
<xsl:output-character character="⌿" string="&amp;#x233F;"/>
<xsl:output-character character="⍼" string="&amp;#x237C;"/>
<xsl:output-character character="⎰" string="&amp;#x23B0;"/>
<xsl:output-character character="⎱" string="&amp;#x23B1;"/>
<xsl:output-character character="⎴" string="&amp;#x23B4;"/>
<xsl:output-character character="⎵" string="&amp;#x23B5;"/>
<xsl:output-character character="⎶" string="&amp;#x23B6;"/>
<xsl:output-character character="␣" string="&amp;#x2423;"/>
<xsl:output-character character="⒊" string="&amp;#x248A;"/>
<xsl:output-character character="Ⓢ" string="&amp;#x24C8;"/>
<xsl:output-character character="─" string="&amp;#x2500;"/>
<xsl:output-character character="│" string="&amp;#x2502;"/>
<xsl:output-character character="┌" string="&amp;#x250C;"/>
<xsl:output-character character="┐" string="&amp;#x2510;"/>
<xsl:output-character character="└" string="&amp;#x2514;"/>
<xsl:output-character character="┘" string="&amp;#x2518;"/>
<xsl:output-character character="├" string="&amp;#x251C;"/>
<xsl:output-character character="┤" string="&amp;#x2524;"/>
<xsl:output-character character="┬" string="&amp;#x252C;"/>
<xsl:output-character character="┴" string="&amp;#x2534;"/>
<xsl:output-character character="┼" string="&amp;#x253C;"/>
<xsl:output-character character="═" string="&amp;#x2550;"/>
<xsl:output-character character="║" string="&amp;#x2551;"/>
<xsl:output-character character="╒" string="&amp;#x2552;"/>
<xsl:output-character character="╓" string="&amp;#x2553;"/>
<xsl:output-character character="╔" string="&amp;#x2554;"/>
<xsl:output-character character="╕" string="&amp;#x2555;"/>
<xsl:output-character character="╖" string="&amp;#x2556;"/>
<xsl:output-character character="╗" string="&amp;#x2557;"/>
<xsl:output-character character="╘" string="&amp;#x2558;"/>
<xsl:output-character character="╙" string="&amp;#x2559;"/>
<xsl:output-character character="╚" string="&amp;#x255A;"/>
<xsl:output-character character="╛" string="&amp;#x255B;"/>
<xsl:output-character character="╜" string="&amp;#x255C;"/>
<xsl:output-character character="╝" string="&amp;#x255D;"/>
<xsl:output-character character="╞" string="&amp;#x255E;"/>
<xsl:output-character character="╟" string="&amp;#x255F;"/>
<xsl:output-character character="╠" string="&amp;#x2560;"/>
<xsl:output-character character="╡" string="&amp;#x2561;"/>
<xsl:output-character character="╢" string="&amp;#x2562;"/>
<xsl:output-character character="╣" string="&amp;#x2563;"/>
<xsl:output-character character="╤" string="&amp;#x2564;"/>
<xsl:output-character character="╥" string="&amp;#x2565;"/>
<xsl:output-character character="╦" string="&amp;#x2566;"/>
<xsl:output-character character="╧" string="&amp;#x2567;"/>
<xsl:output-character character="╨" string="&amp;#x2568;"/>
<xsl:output-character character="╩" string="&amp;#x2569;"/>
<xsl:output-character character="╪" string="&amp;#x256A;"/>
<xsl:output-character character="╫" string="&amp;#x256B;"/>
<xsl:output-character character="╬" string="&amp;#x256C;"/>
<xsl:output-character character="▀" string="&amp;#x2580;"/>
<xsl:output-character character="▄" string="&amp;#x2584;"/>
<xsl:output-character character="█" string="&amp;#x2588;"/>
<xsl:output-character character="░" string="&amp;#x2591;"/>
<xsl:output-character character="▒" string="&amp;#x2592;"/>
<xsl:output-character character="▓" string="&amp;#x2593;"/>
<xsl:output-character character="□" string="&amp;#x25A1;"/>
<xsl:output-character character="▪" string="&amp;#x25AA;"/>
<xsl:output-character character="▭" string="&amp;#x25AD;"/>
<xsl:output-character character="▮" string="&amp;#x25AE;"/>
<xsl:output-character character="▱" string="&amp;#x25B1;"/>
<xsl:output-character character="△" string="&amp;#x25B3;"/>
<xsl:output-character character="▴" string="&amp;#x25B4;"/>
<xsl:output-character character="▵" string="&amp;#x25B5;"/>
<xsl:output-character character="▸" string="&amp;#x25B8;"/>
<xsl:output-character character="▹" string="&amp;#x25B9;"/>
<xsl:output-character character="▽" string="&amp;#x25BD;"/>
<xsl:output-character character="▾" string="&amp;#x25BE;"/>
<xsl:output-character character="▿" string="&amp;#x25BF;"/>
<xsl:output-character character="◂" string="&amp;#x25C2;"/>
<xsl:output-character character="◃" string="&amp;#x25C3;"/>
<xsl:output-character character="◊" string="&amp;#x25CA;"/>
<xsl:output-character character="○" string="&amp;#x25CB;"/>
<xsl:output-character character="◬" string="&amp;#x25EC;"/>
<xsl:output-character character="◯" string="&amp;#x25EF;"/>
<xsl:output-character character="◸" string="&amp;#x25F8;"/>
<xsl:output-character character="◹" string="&amp;#x25F9;"/>
<xsl:output-character character="◺" string="&amp;#x25FA;"/>
<xsl:output-character character="★" string="&amp;#x2605;"/>
<xsl:output-character character="☆" string="&amp;#x2606;"/>
<xsl:output-character character="☎" string="&amp;#x260E;"/>
<xsl:output-character character="♀" string="&amp;#x2640;"/>
<xsl:output-character character="♂" string="&amp;#x2642;"/>
<xsl:output-character character="♠" string="&amp;#x2660;"/>
<xsl:output-character character="♣" string="&amp;#x2663;"/>
<xsl:output-character character="♥" string="&amp;#x2665;"/>
<xsl:output-character character="♦" string="&amp;#x2666;"/>
<xsl:output-character character="♪" string="&amp;#x266A;"/>
<xsl:output-character character="♭" string="&amp;#x266D;"/>
<xsl:output-character character="♮" string="&amp;#x266E;"/>
<xsl:output-character character="♯" string="&amp;#x266F;"/>
<xsl:output-character character="✓" string="&amp;#x2713;"/>
<xsl:output-character character="✗" string="&amp;#x2717;"/>
<xsl:output-character character="✠" string="&amp;#x2720;"/>
<xsl:output-character character="✶" string="&amp;#x2736;"/>
<xsl:output-character character="⟵" string="&amp;#x27F5;"/>
<xsl:output-character character="⟶" string="&amp;#x27F6;"/>
<xsl:output-character character="⟷" string="&amp;#x27F7;"/>
<xsl:output-character character="⟸" string="&amp;#x27F8;"/>
<xsl:output-character character="⟹" string="&amp;#x27F9;"/>
<xsl:output-character character="⟺" string="&amp;#x27FA;"/>
<xsl:output-character character="⟼" string="&amp;#x27FC;"/>
<xsl:output-character character="⟿" string="&amp;#x27FF;"/>
<xsl:output-character character="⤂" string="&amp;#x2902;"/>
<xsl:output-character character="⤃" string="&amp;#x2903;"/>
<xsl:output-character character="⤄" string="&amp;#x2904;"/>
<xsl:output-character character="⤅" string="&amp;#x2905;"/>
<xsl:output-character character="⤌" string="&amp;#x290C;"/>
<xsl:output-character character="⤍" string="&amp;#x290D;"/>
<xsl:output-character character="⤎" string="&amp;#x290E;"/>
<xsl:output-character character="⤏" string="&amp;#x290F;"/>
<xsl:output-character character="⤐" string="&amp;#x2910;"/>
<xsl:output-character character="⤑" string="&amp;#x2911;"/>
<xsl:output-character character="⤖" string="&amp;#x2916;"/>
<xsl:output-character character="⤙" string="&amp;#x2919;"/>
<xsl:output-character character="⤚" string="&amp;#x291A;"/>
<xsl:output-character character="⤛" string="&amp;#x291B;"/>
<xsl:output-character character="⤜" string="&amp;#x291C;"/>
<xsl:output-character character="⤝" string="&amp;#x291D;"/>
<xsl:output-character character="⤞" string="&amp;#x291E;"/>
<xsl:output-character character="⤟" string="&amp;#x291F;"/>
<xsl:output-character character="⤠" string="&amp;#x2920;"/>
<xsl:output-character character="⤣" string="&amp;#x2923;"/>
<xsl:output-character character="⤤" string="&amp;#x2924;"/>
<xsl:output-character character="⤥" string="&amp;#x2925;"/>
<xsl:output-character character="⤦" string="&amp;#x2926;"/>
<xsl:output-character character="⤧" string="&amp;#x2927;"/>
<xsl:output-character character="⤨" string="&amp;#x2928;"/>
<xsl:output-character character="⤩" string="&amp;#x2929;"/>
<xsl:output-character character="⤪" string="&amp;#x292A;"/>
<xsl:output-character character="⤳" string="&amp;#x2933;"/>
<xsl:output-character character="⤵" string="&amp;#x2935;"/>
<xsl:output-character character="⤶" string="&amp;#x2936;"/>
<xsl:output-character character="⤷" string="&amp;#x2937;"/>
<xsl:output-character character="⤸" string="&amp;#x2938;"/>
<xsl:output-character character="⤹" string="&amp;#x2939;"/>
<xsl:output-character character="⤼" string="&amp;#x293C;"/>
<xsl:output-character character="⤽" string="&amp;#x293D;"/>
<xsl:output-character character="⥅" string="&amp;#x2945;"/>
<xsl:output-character character="⥈" string="&amp;#x2948;"/>
<xsl:output-character character="⥉" string="&amp;#x2949;"/>
<xsl:output-character character="⥊" string="&amp;#x294A;"/>
<xsl:output-character character="⥋" string="&amp;#x294B;"/>
<xsl:output-character character="⥢" string="&amp;#x2962;"/>
<xsl:output-character character="⥣" string="&amp;#x2963;"/>
<xsl:output-character character="⥤" string="&amp;#x2964;"/>
<xsl:output-character character="⥥" string="&amp;#x2965;"/>
<xsl:output-character character="⥦" string="&amp;#x2966;"/>
<xsl:output-character character="⥧" string="&amp;#x2967;"/>
<xsl:output-character character="⥨" string="&amp;#x2968;"/>
<xsl:output-character character="⥩" string="&amp;#x2969;"/>
<xsl:output-character character="⥪" string="&amp;#x296A;"/>
<xsl:output-character character="⥫" string="&amp;#x296B;"/>
<xsl:output-character character="⥬" string="&amp;#x296C;"/>
<xsl:output-character character="⥭" string="&amp;#x296D;"/>
<xsl:output-character character="⥮" string="&amp;#x296E;"/>
<xsl:output-character character="⥯" string="&amp;#x296F;"/>
<xsl:output-character character="⥱" string="&amp;#x2971;"/>
<xsl:output-character character="⥲" string="&amp;#x2972;"/>
<xsl:output-character character="⥳" string="&amp;#x2973;"/>
<xsl:output-character character="⥴" string="&amp;#x2974;"/>
<xsl:output-character character="⥵" string="&amp;#x2975;"/>
<xsl:output-character character="⥶" string="&amp;#x2976;"/>
<xsl:output-character character="⥸" string="&amp;#x2978;"/>
<xsl:output-character character="⥹" string="&amp;#x2979;"/>
<xsl:output-character character="⥻" string="&amp;#x297B;"/>
<xsl:output-character character="⥼" string="&amp;#x297C;"/>
<xsl:output-character character="⥽" string="&amp;#x297D;"/>
<xsl:output-character character="⥾" string="&amp;#x297E;"/>
<xsl:output-character character="⥿" string="&amp;#x297F;"/>
<xsl:output-character character="⦅" string="&amp;#x2985;"/>
<xsl:output-character character="⦆" string="&amp;#x2986;"/>
<xsl:output-character character="⦋" string="&amp;#x298B;"/>
<xsl:output-character character="⦌" string="&amp;#x298C;"/>
<xsl:output-character character="⦍" string="&amp;#x298D;"/>
<xsl:output-character character="⦎" string="&amp;#x298E;"/>
<xsl:output-character character="⦏" string="&amp;#x298F;"/>
<xsl:output-character character="⦐" string="&amp;#x2990;"/>
<xsl:output-character character="⦑" string="&amp;#x2991;"/>
<xsl:output-character character="⦒" string="&amp;#x2992;"/>
<xsl:output-character character="⦓" string="&amp;#x2993;"/>
<xsl:output-character character="⦔" string="&amp;#x2994;"/>
<xsl:output-character character="⦕" string="&amp;#x2995;"/>
<xsl:output-character character="⦖" string="&amp;#x2996;"/>
<xsl:output-character character="⦚" string="&amp;#x299A;"/>
<xsl:output-character character="⦜" string="&amp;#x299C;"/>
<xsl:output-character character="⦝" string="&amp;#x299D;"/>
<xsl:output-character character="⦤" string="&amp;#x29A4;"/>
<xsl:output-character character="⦥" string="&amp;#x29A5;"/>
<xsl:output-character character="⦦" string="&amp;#x29A6;"/>
<xsl:output-character character="⦧" string="&amp;#x29A7;"/>
<xsl:output-character character="⦨" string="&amp;#x29A8;"/>
<xsl:output-character character="⦩" string="&amp;#x29A9;"/>
<xsl:output-character character="⦪" string="&amp;#x29AA;"/>
<xsl:output-character character="⦫" string="&amp;#x29AB;"/>
<xsl:output-character character="⦬" string="&amp;#x29AC;"/>
<xsl:output-character character="⦭" string="&amp;#x29AD;"/>
<xsl:output-character character="⦮" string="&amp;#x29AE;"/>
<xsl:output-character character="⦯" string="&amp;#x29AF;"/>
<xsl:output-character character="⦰" string="&amp;#x29B0;"/>
<xsl:output-character character="⦱" string="&amp;#x29B1;"/>
<xsl:output-character character="⦲" string="&amp;#x29B2;"/>
<xsl:output-character character="⦳" string="&amp;#x29B3;"/>
<xsl:output-character character="⦴" string="&amp;#x29B4;"/>
<xsl:output-character character="⦵" string="&amp;#x29B5;"/>
<xsl:output-character character="⦶" string="&amp;#x29B6;"/>
<xsl:output-character character="⦷" string="&amp;#x29B7;"/>
<xsl:output-character character="⦹" string="&amp;#x29B9;"/>
<xsl:output-character character="⦻" string="&amp;#x29BB;"/>
<xsl:output-character character="⦼" string="&amp;#x29BC;"/>
<xsl:output-character character="⦾" string="&amp;#x29BE;"/>
<xsl:output-character character="⦿" string="&amp;#x29BF;"/>
<xsl:output-character character="⧀" string="&amp;#x29C0;"/>
<xsl:output-character character="⧁" string="&amp;#x29C1;"/>
<xsl:output-character character="⧂" string="&amp;#x29C2;"/>
<xsl:output-character character="⧃" string="&amp;#x29C3;"/>
<xsl:output-character character="⧄" string="&amp;#x29C4;"/>
<xsl:output-character character="⧅" string="&amp;#x29C5;"/>
<xsl:output-character character="⧉" string="&amp;#x29C9;"/>
<xsl:output-character character="⧍" string="&amp;#x29CD;"/>
<xsl:output-character character="⧎" string="&amp;#x29CE;"/>
<xsl:output-character character="⧚" string="&amp;#x29DA;"/>
<xsl:output-character character="⧜" string="&amp;#x29DC;"/>
<xsl:output-character character="⧝" string="&amp;#x29DD;"/>
<xsl:output-character character="⧞" string="&amp;#x29DE;"/>
<xsl:output-character character="⧣" string="&amp;#x29E3;"/>
<xsl:output-character character="⧤" string="&amp;#x29E4;"/>
<xsl:output-character character="⧥" string="&amp;#x29E5;"/>
<xsl:output-character character="⧫" string="&amp;#x29EB;"/>
<xsl:output-character character="⧶" string="&amp;#x29F6;"/>
<xsl:output-character character="⨀" string="&amp;#x2A00;"/>
<xsl:output-character character="⨁" string="&amp;#x2A01;"/>
<xsl:output-character character="⨂" string="&amp;#x2A02;"/>
<xsl:output-character character="⨄" string="&amp;#x2A04;"/>
<xsl:output-character character="⨆" string="&amp;#x2A06;"/>
<xsl:output-character character="⨌" string="&amp;#x2A0C;"/>
<xsl:output-character character="⨍" string="&amp;#x2A0D;"/>
<xsl:output-character character="⨐" string="&amp;#x2A10;"/>
<xsl:output-character character="⨑" string="&amp;#x2A11;"/>
<xsl:output-character character="⨒" string="&amp;#x2A12;"/>
<xsl:output-character character="⨓" string="&amp;#x2A13;"/>
<xsl:output-character character="⨔" string="&amp;#x2A14;"/>
<xsl:output-character character="⨕" string="&amp;#x2A15;"/>
<xsl:output-character character="⨖" string="&amp;#x2A16;"/>
<xsl:output-character character="⨗" string="&amp;#x2A17;"/>
<xsl:output-character character="⨢" string="&amp;#x2A22;"/>
<xsl:output-character character="⨣" string="&amp;#x2A23;"/>
<xsl:output-character character="⨤" string="&amp;#x2A24;"/>
<xsl:output-character character="⨥" string="&amp;#x2A25;"/>
<xsl:output-character character="⨦" string="&amp;#x2A26;"/>
<xsl:output-character character="⨧" string="&amp;#x2A27;"/>
<xsl:output-character character="⨩" string="&amp;#x2A29;"/>
<xsl:output-character character="⨪" string="&amp;#x2A2A;"/>
<xsl:output-character character="⨭" string="&amp;#x2A2D;"/>
<xsl:output-character character="⨮" string="&amp;#x2A2E;"/>
<xsl:output-character character="⨰" string="&amp;#x2A30;"/>
<xsl:output-character character="⨱" string="&amp;#x2A31;"/>
<xsl:output-character character="⨳" string="&amp;#x2A33;"/>
<xsl:output-character character="⨴" string="&amp;#x2A34;"/>
<xsl:output-character character="⨵" string="&amp;#x2A35;"/>
<xsl:output-character character="⨶" string="&amp;#x2A36;"/>
<xsl:output-character character="⨷" string="&amp;#x2A37;"/>
<xsl:output-character character="⨸" string="&amp;#x2A38;"/>
<xsl:output-character character="⨹" string="&amp;#x2A39;"/>
<xsl:output-character character="⨺" string="&amp;#x2A3A;"/>
<xsl:output-character character="⨻" string="&amp;#x2A3B;"/>
<xsl:output-character character="⨼" string="&amp;#x2A3C;"/>
<xsl:output-character character="⨿" string="&amp;#x2A3F;"/>
<xsl:output-character character="⩀" string="&amp;#x2A40;"/>
<xsl:output-character character="⩂" string="&amp;#x2A42;"/>
<xsl:output-character character="⩃" string="&amp;#x2A43;"/>
<xsl:output-character character="⩄" string="&amp;#x2A44;"/>
<xsl:output-character character="⩅" string="&amp;#x2A45;"/>
<xsl:output-character character="⩆" string="&amp;#x2A46;"/>
<xsl:output-character character="⩇" string="&amp;#x2A47;"/>
<xsl:output-character character="⩈" string="&amp;#x2A48;"/>
<xsl:output-character character="⩉" string="&amp;#x2A49;"/>
<xsl:output-character character="⩊" string="&amp;#x2A4A;"/>
<xsl:output-character character="⩋" string="&amp;#x2A4B;"/>
<xsl:output-character character="⩌" string="&amp;#x2A4C;"/>
<xsl:output-character character="⩍" string="&amp;#x2A4D;"/>
<xsl:output-character character="⩐" string="&amp;#x2A50;"/>
<xsl:output-character character="⩓" string="&amp;#x2A53;"/>
<xsl:output-character character="⩔" string="&amp;#x2A54;"/>
<xsl:output-character character="⩕" string="&amp;#x2A55;"/>
<xsl:output-character character="⩖" string="&amp;#x2A56;"/>
<xsl:output-character character="⩗" string="&amp;#x2A57;"/>
<xsl:output-character character="⩘" string="&amp;#x2A58;"/>
<xsl:output-character character="⩚" string="&amp;#x2A5A;"/>
<xsl:output-character character="⩛" string="&amp;#x2A5B;"/>
<xsl:output-character character="⩜" string="&amp;#x2A5C;"/>
<xsl:output-character character="⩝" string="&amp;#x2A5D;"/>
<xsl:output-character character="⩟" string="&amp;#x2A5F;"/>
<xsl:output-character character="⩦" string="&amp;#x2A66;"/>
<xsl:output-character character="⩪" string="&amp;#x2A6A;"/>
<xsl:output-character character="⩭" string="&amp;#x2A6D;"/>
<xsl:output-character character="⩮" string="&amp;#x2A6E;"/>
<xsl:output-character character="⩯" string="&amp;#x2A6F;"/>
<xsl:output-character character="⩰" string="&amp;#x2A70;"/>
<xsl:output-character character="⩱" string="&amp;#x2A71;"/>
<xsl:output-character character="⩲" string="&amp;#x2A72;"/>
<xsl:output-character character="⩳" string="&amp;#x2A73;"/>
<xsl:output-character character="⩴" string="&amp;#x2A74;"/>
<xsl:output-character character="⩷" string="&amp;#x2A77;"/>
<xsl:output-character character="⩸" string="&amp;#x2A78;"/>
<xsl:output-character character="⩹" string="&amp;#x2A79;"/>
<xsl:output-character character="⩺" string="&amp;#x2A7A;"/>
<xsl:output-character character="⩻" string="&amp;#x2A7B;"/>
<xsl:output-character character="⩼" string="&amp;#x2A7C;"/>
<xsl:output-character character="⩽" string="&amp;#x2A7D;"/>
<xsl:output-character character="⩾" string="&amp;#x2A7E;"/>
<xsl:output-character character="⩿" string="&amp;#x2A7F;"/>
<xsl:output-character character="⪀" string="&amp;#x2A80;"/>
<xsl:output-character character="⪁" string="&amp;#x2A81;"/>
<xsl:output-character character="⪂" string="&amp;#x2A82;"/>
<xsl:output-character character="⪃" string="&amp;#x2A83;"/>
<xsl:output-character character="⪄" string="&amp;#x2A84;"/>
<xsl:output-character character="⪅" string="&amp;#x2A85;"/>
<xsl:output-character character="⪆" string="&amp;#x2A86;"/>
<xsl:output-character character="⪇" string="&amp;#x2A87;"/>
<xsl:output-character character="⪈" string="&amp;#x2A88;"/>
<xsl:output-character character="⪉" string="&amp;#x2A89;"/>
<xsl:output-character character="⪊" string="&amp;#x2A8A;"/>
<xsl:output-character character="⪋" string="&amp;#x2A8B;"/>
<xsl:output-character character="⪌" string="&amp;#x2A8C;"/>
<xsl:output-character character="⪍" string="&amp;#x2A8D;"/>
<xsl:output-character character="⪎" string="&amp;#x2A8E;"/>
<xsl:output-character character="⪏" string="&amp;#x2A8F;"/>
<xsl:output-character character="⪐" string="&amp;#x2A90;"/>
<xsl:output-character character="⪑" string="&amp;#x2A91;"/>
<xsl:output-character character="⪒" string="&amp;#x2A92;"/>
<xsl:output-character character="⪓" string="&amp;#x2A93;"/>
<xsl:output-character character="⪔" string="&amp;#x2A94;"/>
<xsl:output-character character="⪕" string="&amp;#x2A95;"/>
<xsl:output-character character="⪖" string="&amp;#x2A96;"/>
<xsl:output-character character="⪗" string="&amp;#x2A97;"/>
<xsl:output-character character="⪘" string="&amp;#x2A98;"/>
<xsl:output-character character="⪙" string="&amp;#x2A99;"/>
<xsl:output-character character="⪚" string="&amp;#x2A9A;"/>
<xsl:output-character character="⪝" string="&amp;#x2A9D;"/>
<xsl:output-character character="⪞" string="&amp;#x2A9E;"/>
<xsl:output-character character="⪟" string="&amp;#x2A9F;"/>
<xsl:output-character character="⪠" string="&amp;#x2AA0;"/>
<xsl:output-character character="⪤" string="&amp;#x2AA4;"/>
<xsl:output-character character="⪥" string="&amp;#x2AA5;"/>
<xsl:output-character character="⪦" string="&amp;#x2AA6;"/>
<xsl:output-character character="⪧" string="&amp;#x2AA7;"/>
<xsl:output-character character="⪨" string="&amp;#x2AA8;"/>
<xsl:output-character character="⪩" string="&amp;#x2AA9;"/>
<xsl:output-character character="⪪" string="&amp;#x2AAA;"/>
<xsl:output-character character="⪫" string="&amp;#x2AAB;"/>
<xsl:output-character character="⪬" string="&amp;#x2AAC;"/>
<xsl:output-character character="⪭" string="&amp;#x2AAD;"/>
<xsl:output-character character="⪮" string="&amp;#x2AAE;"/>
<xsl:output-character character="⪯" string="&amp;#x2AAF;"/>
<xsl:output-character character="⪰" string="&amp;#x2AB0;"/>
<xsl:output-character character="⪳" string="&amp;#x2AB3;"/>
<xsl:output-character character="⪴" string="&amp;#x2AB4;"/>
<xsl:output-character character="⪵" string="&amp;#x2AB5;"/>
<xsl:output-character character="⪶" string="&amp;#x2AB6;"/>
<xsl:output-character character="⪷" string="&amp;#x2AB7;"/>
<xsl:output-character character="⪸" string="&amp;#x2AB8;"/>
<xsl:output-character character="⪹" string="&amp;#x2AB9;"/>
<xsl:output-character character="⪺" string="&amp;#x2ABA;"/>
<xsl:output-character character="⪻" string="&amp;#x2ABB;"/>
<xsl:output-character character="⪼" string="&amp;#x2ABC;"/>
<xsl:output-character character="⪽" string="&amp;#x2ABD;"/>
<xsl:output-character character="⪾" string="&amp;#x2ABE;"/>
<xsl:output-character character="⪿" string="&amp;#x2ABF;"/>
<xsl:output-character character="⫀" string="&amp;#x2AC0;"/>
<xsl:output-character character="⫁" string="&amp;#x2AC1;"/>
<xsl:output-character character="⫂" string="&amp;#x2AC2;"/>
<xsl:output-character character="⫃" string="&amp;#x2AC3;"/>
<xsl:output-character character="⫄" string="&amp;#x2AC4;"/>
<xsl:output-character character="⫅" string="&amp;#x2AC5;"/>
<xsl:output-character character="⫆" string="&amp;#x2AC6;"/>
<xsl:output-character character="⫇" string="&amp;#x2AC7;"/>
<xsl:output-character character="⫈" string="&amp;#x2AC8;"/>
<xsl:output-character character="⫋" string="&amp;#x2ACB;"/>
<xsl:output-character character="⫌" string="&amp;#x2ACC;"/>
<xsl:output-character character="⫏" string="&amp;#x2ACF;"/>
<xsl:output-character character="⫐" string="&amp;#x2AD0;"/>
<xsl:output-character character="⫑" string="&amp;#x2AD1;"/>
<xsl:output-character character="⫒" string="&amp;#x2AD2;"/>
<xsl:output-character character="⫓" string="&amp;#x2AD3;"/>
<xsl:output-character character="⫔" string="&amp;#x2AD4;"/>
<xsl:output-character character="⫕" string="&amp;#x2AD5;"/>
<xsl:output-character character="⫖" string="&amp;#x2AD6;"/>
<xsl:output-character character="⫗" string="&amp;#x2AD7;"/>
<xsl:output-character character="⫘" string="&amp;#x2AD8;"/>
<xsl:output-character character="⫙" string="&amp;#x2AD9;"/>
<xsl:output-character character="⫚" string="&amp;#x2ADA;"/>
<xsl:output-character character="⫛" string="&amp;#x2ADB;"/>
<xsl:output-character character="⫤" string="&amp;#x2AE4;"/>
<xsl:output-character character="⫦" string="&amp;#x2AE6;"/>
<xsl:output-character character="⫧" string="&amp;#x2AE7;"/>
<xsl:output-character character="⫨" string="&amp;#x2AE8;"/>
<xsl:output-character character="⫩" string="&amp;#x2AE9;"/>
<xsl:output-character character="⫫" string="&amp;#x2AEB;"/>
<xsl:output-character character="⫬" string="&amp;#x2AEC;"/>
<xsl:output-character character="⫭" string="&amp;#x2AED;"/>
<xsl:output-character character="⫮" string="&amp;#x2AEE;"/>
<xsl:output-character character="⫯" string="&amp;#x2AEF;"/>
<xsl:output-character character="⫰" string="&amp;#x2AF0;"/>
<xsl:output-character character="⫱" string="&amp;#x2AF1;"/>
<xsl:output-character character="⫲" string="&amp;#x2AF2;"/>
<xsl:output-character character="⫳" string="&amp;#x2AF3;"/>
<xsl:output-character character="⫽" string="&amp;#x2AFD;"/>
<xsl:output-character character="《" string="&amp;#x300A;"/>
<xsl:output-character character="》" string="&amp;#x300B;"/>
<xsl:output-character character="〔" string="&amp;#x3014;"/>
<xsl:output-character character="〕" string="&amp;#x3015;"/>
<xsl:output-character character="〘" string="&amp;#x3018;"/>
<xsl:output-character character="〙" string="&amp;#x3019;"/>
<xsl:output-character character="〚" string="&amp;#x301A;"/>
<xsl:output-character character="〛" string="&amp;#x301B;"/>
<xsl:output-character character="" string="&amp;#xF061;"/>
<xsl:output-character character="" string="&amp;#xF062;"/>
<xsl:output-character character="" string="&amp;#xF066;"/>
<xsl:output-character character="ﬀ" string="&amp;#xFB00;"/>
<xsl:output-character character="ﬁ" string="&amp;#xFB01;"/>
<xsl:output-character character="ﬂ" string="&amp;#xFB02;"/>
<xsl:output-character character="ﬃ" string="&amp;#xFB03;"/>
<xsl:output-character character="ﬄ" string="&amp;#xFB04;"/>
<xsl:output-character character="�" string="&amp;#xFFFD;"/>
</xsl:character-map>

</xsl:stylesheet>