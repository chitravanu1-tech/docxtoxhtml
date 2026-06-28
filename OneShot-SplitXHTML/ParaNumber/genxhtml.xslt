<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf" exclude-result-prefixes="xs mf" 
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
    xmlns:num="http://whatever"
    version="2.0">
    <!-- 06-NOV-17: Added for Looseleaf -->
    <!-- 14-dec-17: comented by RTP in "MergeSpread.xslt"-->
    <!-- 30-Mar-18: commented and added for a link to toc -->
    <!-- 01-Dec-17: GIVE a link for TOC **************************************************************************************************************************************************** -->
    <!-- 08-May-18: Panneer Boobmark logic -->
    <!-- 21-JAN-19: GENERIC: Conditional Text informations by Bhaskar; called "designmap.xml" -->
    <!-- 24-JAN-19: For Mariappan -->
    <!-- Commented on 06-FEB-19, now taken from IDMLs "ParentStory" attribute not from sree's bkmark -->
    <!-- 08-02-19: If no ParaInfo(new panneer pdf gen script), then take bk value from "ParaNumber"(old script) -->
    
    <!-- 10-APR-19: If no decendent of Paragraph then add Table book mark -->
    <!-- 12-APR-19: the Above reverted, no need that condition -->
    <!-- 10-May-19: If "MathToolsML" att. presents -->
    <!--commented for marriapn editor i/i issue on 12-3-2021-->
    <!--Added to retain the small caps 29-03-2021-->
    <!--Added on 23-08-2021 uppercase missing in wycywyg-->
    <!--updated for style with space issue on 26-08-2021-->
    <!-- Added sorting issue by HyperlinkTextSourceon 10-1-2022 -->
    <!-- Added to avoid the smallcaps information here(contains($Charstyle0,'allcaps')) on 27-1-2022 -->
    <!-- Added to retain the endnotes id's on 8-7-2022 -->
    <!-- Added to avoid the duplicate endnote number by formatting on 11-1-2023 Azure 6050 -->
    <!-- Added to handle if citation endnote reference wrongly tagged as EndnoteNumber on 26-4-2023 Azure 7168-->
    <!-- Added to avoid the endnote property value Azure 10030 on 28-08-2023 -->
    <!-- Added for listtype on 8-12-2023 Azure 1552 -->
    <xsl:strip-space elements="*"/>
    <xsl:preserve-space elements="Content w:t"/>
    
    <!-- 21-JAN-19: GENERIC: Conditional Text informations by Bhaskar; called "designmap.xml" -->
             <xsl:variable name="designmap" select="document('designmap.xml')"/>
    <!-- 21-JAN-19: GENERIC: Conditional Text informations by Bhaskar; called "designmap.xml" -->
    
    <xsl:variable name="filename" select="substring-before(tokenize(base-uri(.), '/')[last()],'.')"/>
    <xsl:variable name="artinfo" select="document('artinfo.xml')"/>
    <xsl:variable name="Graphic" select="document('Graphic.xml')"/>
    <xsl:variable name="linkedStyle" select="document('linked.xml')"/>
    <xsl:variable name="hex">0123456789ABCDEF</xsl:variable>
    <!-- <xsl:output method="xml" name="xml" xml:space="preserve" use-character-maps="Ascii2Unicode"/> -->
    <xsl:output method="xml" name="xml" xml:space="preserve"/>

    <xsl:template match="@*|node()">        
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy> 
        <!--<xsl:variable name="a" select="'923456789'"/>-->

    </xsl:template>
    
    <xsl:param name="myNameSpace" select="'http://www.w3.org/1999/xhtml'"/>
    
    <!-- <xsl:template match="CharacterStyleRange/XMLElement/Content">
        <xsl:apply-templates/>
    </xsl:template>-->
    
    <xsl:template match="SOURCE">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    
    <xsl:template match="Story">
        <!--<xsl:element name="body">-->
        <xsl:copy>
            <xsl:for-each select="@*">
                <xsl:attribute name="{name(.)}" select="."/>
            </xsl:for-each>
            <xsl:apply-templates select="node()"/>     
        </xsl:copy>
        <!--</xsl:element>-->
    </xsl:template>
    
    <xsl:template match="Story" mode="textframe">                                                                                                                   
        <xsl:apply-templates/>                                 
    </xsl:template>
    
    
    <!-- [descendant::Content | descendant::Group | descendant::Table | descendant::Rectangle | descendant::TextFrame] -->
    <xsl:template match="ParagraphStyleRange">
        <xsl:variable name="Na1">
            <xsl:choose>
                <xsl:when test="contains(@AppliedParagraphStyle,'$ID/')">
                    <xsl:value-of select="translate(substring-after(@AppliedParagraphStyle,'$ID/'),' /\[\]@#&lt;&gt;%','_')"/>
                </xsl:when>
                <xsl:when test="contains(@AppliedParagraphStyle,'ParagraphStyle/')">
                    <xsl:value-of select="translate(substring-after(@AppliedParagraphStyle,'ParagraphStyle/'),' /\[\]@#&lt;&gt;%','_')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="translate(@AppliedParagraphStyle,' /\[\]@#&lt;&gt;%','_')"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="Na2">
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
        <!-- 08-02-19: If no ParaInfo(new panneer pdf gen script), then take bk value from "ParaNumber"(old script) -->
        <!--<xsl:variable name="PN" select="self::ParagraphStyleRange/@ParaInfo"/>-->
        <xsl:variable name="PN">
            <xsl:choose>
                <xsl:when test="@ParaInfo != ''">
                    <xsl:value-of select="self::ParagraphStyleRange/@ParaInfo"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="self::ParagraphStyleRange/@ParaNumber"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="txtFrameId">
            <xsl:choose>
                <xsl:when test="not(contains(substring-after(lower-case($PN),'_txtid_'),'_'))">
                    <xsl:choose>
                        <xsl:when test="contains(lower-case($PN),'_txtid_')">
                            <xsl:value-of select="substring-after(lower-case($PN),'_txtid_')"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:choose>
                        <xsl:when test="contains(lower-case($PN),'_txtid_')">
                            <xsl:value-of select="substring-before(substring-after(lower-case($PN),'_txtid_'),'_')"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="ListNRestart">
            <xsl:copy-of select="child::w:numPr" copy-namespaces="no"/>
        </xsl:variable>
        
        <xsl:variable name="CC">
            <xsl:for-each select="child::CharacterStyleRange/XMLElement/XMLAttribute">
                <xsl:choose>
                    <xsl:when test="@Name = 'ContentControl'">
                        <xsl:value-of select="concat(@Name,@Value)"/>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>                
        </xsl:variable>
        <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
        <xsl:variable name="NestedAppliedCharacterStyle">
            <xsl:choose>
                <xsl:when test="contains(@NestedAppliedCharacterStyle,'$ID/')">
                    <xsl:value-of select="substring-after(@NestedAppliedCharacterStyle,'$ID/')"/>
                </xsl:when>
                <xsl:when test="contains(@NestedAppliedCharacterStyle,'CharacterStyle/')">
                    <xsl:value-of select="substring-after(@NestedAppliedCharacterStyle,'CharacterStyle/')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="@NestedAppliedCharacterStyle"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="NestedAppliedCharacterStyle22">
            <xsl:choose>
                <xsl:when test="contains(@NestedAppliedCharacterStyle,'$ID/')">
                    <xsl:value-of select="replace(substring-after(@NestedAppliedCharacterStyle,'$ID/'),' ','')"/>
                </xsl:when>
                <xsl:when test="contains(@NestedAppliedCharacterStyle,'CharacterStyle/')">
                    <xsl:value-of select="replace(substring-after(@NestedAppliedCharacterStyle,'CharacterStyle/'),' ','')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="replace(@NestedAppliedCharacterStyle,' ','')"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        -->
        
        
        <xsl:choose>
         <xsl:when test="descendant::HyperlinkTextDestination/@listnum">
             <xsl:variable name="curParaNumLvl" select="@curParaNumLvl"/>
             <xsl:variable name="curBasedon" select="@curBasedon"/>
             <xsl:variable name="NumberingStartAt">
                 <xsl:choose>
                     <xsl:when test="descendant::HyperlinkTextDestination/@listnum">
                         <xsl:value-of select="descendant::HyperlinkTextDestination/@listnum"/>
                     </xsl:when>                     
                     <xsl:otherwise>
                         <xsl:value-of select="@NumberingStartAt"/>
                     </xsl:otherwise>
                 </xsl:choose>
             </xsl:variable>
             <xsl:variable name="NumberingLevel" select="@NumberingLevel"/>
             <xsl:variable name="NumberingExpression" select="@NumberingExpression"/>
             <xsl:variable name="listnum" select="descendant::HyperlinkTextDestination/@listnum"/><!-- custom data by sree -->
             <!--<xsl:variable name="listnumformat" select="substring-before(descendant::HyperlinkTextDestination/@listformat, ',')"/>--><!-- custom data by sree -->
             <xsl:variable name="listnumformat" select="substring-before(descendant::HyperlinkTextDestination[1]/@listformat, ',')"/>
             <xsl:variable name="listind" select="descendant::HyperlinkTextDestination/@listind"/><!-- custom data by sree -->
             <xsl:variable name="listtype" select="descendant::HyperlinkTextDestination/@listtype"/><!-- custom data by sree -->
             <xsl:variable name="listlvl" select="descendant::HyperlinkTextDestination/@listlvl"/><!-- custom data by sree -->
             
             <xsl:choose>
                 <xsl:when test="$curParaNumLvl = '1' or $listlvl = '1'">                     
                     <xsl:text>&#x000A;</xsl:text>
                     <xsl:element name="one">
                         <!-- <xsl:value-of select="translate($msoStyleName, ' /\[\]','')"/> -->
                         <xsl:attribute name="class" select="translate($Na1, ' /\[\]@','_')"/>
                         <xsl:attribute name="data-name" select="$Na2"/>
                         <!-- 24-JAN-19: For Mariappan -->
                         <xsl:attribute name="data-parentStory">
                             <!-- Commented on 06-FEB-19, now taken from IDMLs "ParentStory" attribute not from sree's bkmark -->
                             <!--<xsl:variable name="paraINFO" select="@ParaInfo"/>
                             <xsl:value-of select="concat('Story_',substring-before(substring-after($paraINFO,'_Story_'),'_'))"/>-->
                             <xsl:value-of select="@ParentStory"/>
                         </xsl:attribute>
                         <xsl:attribute name="listtype" select="$Na2"/>
                         <xsl:attribute name="numberFormat">
                             <xsl:choose>
                                 <xsl:when test="$listtype = 'BULLET_LIST'">
                                     <xsl:value-of select="$NumberingStartAt"/>
                                 </xsl:when>
                                 <xsl:otherwise>
                                     <xsl:value-of select="$listnumformat"/>
                                 </xsl:otherwise>
                             </xsl:choose>
                         </xsl:attribute>
                         <xsl:attribute name="numberType" select="$listtype"/>
                         <!-- Added for listtype on 8-12-2023 Azure 1552 -->
                         <!--<xsl:attribute name="start" select="$NumberingStartAt"/>-->
                         <xsl:attribute name="start">
                             <xsl:choose>
                                 <xsl:when test="string-length(@SelfNumberingStartAt) &gt;0">
                                     <xsl:value-of select="normalize-space(@SelfNumberingStartAt)"/>
                                 </xsl:when>
                                 <xsl:when test="contains($NumberingStartAt, '.')">
                                     <xsl:value-of select="substring-before($NumberingStartAt,'.')"/>
                                 </xsl:when>
                                 <xsl:otherwise>
                                     <xsl:value-of select="$NumberingStartAt"/>
                                 </xsl:otherwise>
                             </xsl:choose>
                         </xsl:attribute>
                                                                          
                         <xsl:if test="@Justification | @FirstLineIndent | @LeftIndent | @RightIndent">
                             <xsl:attribute name="style">
                                 <xsl:if test="@Justification">  
                                     <xsl:choose>
                                         <xsl:when test="contains(@Justification, 'Center')">
                                             <xsl:value-of select="'text-align:center'"/>
                                         </xsl:when>
                                         <xsl:when test="contains(@Justification, 'Left')">
                                             <xsl:value-of select="'text-align:left'"/>
                                         </xsl:when>
                                         <xsl:when test="contains(@Justification, 'Right')">
                                             <xsl:value-of select="'text-align:right'"/>
                                         </xsl:when>
                                         <xsl:otherwise>
                                             <xsl:value-of select="'text-align:justify'"/>
                                         </xsl:otherwise>
                                     </xsl:choose>
                                 </xsl:if>                                
                                 <xsl:if test="@FirstLineIndent">
                                     <xsl:if test="@Justification">
                                         <xsl:text>;</xsl:text>  
                                     </xsl:if>
                                     <xsl:choose>
                                         <xsl:when test="@FirstLineIndent = '0'">
                                             <xsl:value-of select="'text-indent:0pt;'"/>
                                         </xsl:when>
                                         <xsl:otherwise>
                                             <xsl:if test="@FirstLineIndent &lt; 0">
                                                 <!--<xsl:text>padding-left:</xsl:text>-->
                                                 <xsl:text>text-indent:</xsl:text>
                                                 <xsl:value-of select="@FirstLineIndent div 2"/>
                                                 <xsl:text>pt</xsl:text>
                                             </xsl:if>
                                             <xsl:if test="@FirstLineIndent > 0">
                                                 <xsl:text>text-indent:</xsl:text>
                                                 <xsl:value-of select="@FirstLineIndent div 2"/>
                                                 <xsl:text>pt</xsl:text>
                                             </xsl:if>
                                             <!--<xsl:text>text-indent:</xsl:text>
                                            <xsl:value-of select="@FirstLineIndent"/>
                                            <xsl:text>pt</xsl:text>-->
                                         </xsl:otherwise>
                                     </xsl:choose>
                                 </xsl:if>
                                 <xsl:if test="@LeftIndent">
                                     <xsl:if test="@Justification | @FirstLineIndent">
                                         <xsl:text>;</xsl:text>  
                                     </xsl:if>
                                     <xsl:choose>
                                         <xsl:when test="@LeftIndent = '0'">
                                             <xsl:value-of select="'margin-left:0pt;'"/>
                                         </xsl:when>
                                         <xsl:otherwise>
                                             <xsl:text>margin-left:</xsl:text>
                                             <xsl:value-of select="@LeftIndent div 2"/>
                                             <xsl:text>pt</xsl:text>
                                         </xsl:otherwise>
                                     </xsl:choose>
                                 </xsl:if>
                                 <xsl:if test="@RightIndent">
                                     <xsl:if test="@Justification | @FirstLineIndent | @LeftIndent">
                                         <xsl:text>;</xsl:text>  
                                     </xsl:if>
                                     <xsl:choose>
                                         <xsl:when test="@RightIndent = '0'">
                                             <xsl:value-of select="'margin-right:0pt;'"/>
                                         </xsl:when>
                                         <xsl:otherwise>
                                             <xsl:text>margin-right:</xsl:text>
                                             <xsl:value-of select="@RightIndent div 2"/>
                                             <xsl:text>pt</xsl:text>
                                         </xsl:otherwise>
                                     </xsl:choose>
                                 </xsl:if>
                             </xsl:attribute>
                         </xsl:if>
                         
                         
                         <!--<xsl:apply-templates select="descendant::Content"/>-->
                         <!-- Taken from inp.xslt -->
                         <xsl:if test="@ParaInfo">
                            <xsl:attribute name="w:rsidR" select="$PN"/>
                        </xsl:if>
                         <xsl:if test="string-length($txtFrameId) &gt; 0">
                             <xsl:choose>
                                 <xsl:when test="starts-with($txtFrameId,'u')">
                                     <xsl:attribute name="txtFrameId" select="$txtFrameId"/>        
                                 </xsl:when>
                                 <xsl:otherwise>
                                     <xsl:attribute name="txtFrameId" select="concat('u',$txtFrameId)"/>
                                 </xsl:otherwise>
                             </xsl:choose>
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
                                                        <xsl:attribute name="w:val" select="replace($Na1,'\\','_')"/>
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
                            </xsl:element>
                            <xsl:apply-templates select="child::Properties/TabList" mode="tabs"/>
                            <!--List auto number restart-->
                            <xsl:copy-of select="$ListNRestart"/>
                            <xsl:if test="not(child::w:numPr) and @BulletsAndNumberingListType ='NoList'">
                                <xsl:element name="w:numPr">
                                    <xsl:element name="w:ilvl">
                                        <xsl:attribute name="w:val" select="'0'"/>
                                    </xsl:element>
                                    <xsl:element name="w:numId">
                                        <xsl:attribute name="w:val">
                                            <xsl:value-of select="0"/>
                                        </xsl:attribute>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:if>
                            <!--List auto number restart-->
                            
                            <xsl:if test="not(string-length(@ParaInfo) = 0)">
                          </xsl:if>
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
                        <xsl:choose>
                            <xsl:when test="(child::CharacterStyleRange/Table)">
                            <!-- 08-May-18: Panneer Boobmark logic -->
                                <!--<Properties>
                                    <RuleAboveColor type="object">Color/S112_2_0_276</RuleAboveColor>
                                </Properties>-->
                                <xsl:if test="child::Properties/RuleAboveColor">
                                    <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                    <xsl:variable name="id">
                                        <xsl:number level="any"/>
                                    </xsl:variable>
                                    <xsl:variable name="HUD">
                                        <xsl:choose>
                                            <xsl:when test="contains($NewBKmark,'_TX_')">
                                                <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                            </xsl:when>
                                            <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                                <xsl:value-of select="$NewBKmark"/>
                                            </xsl:when>
                                        </xsl:choose>
                                    </xsl:variable>
                                    <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                        <xsl:if test="not(string-length($HUD) =0)">
                                            <xsl:element name="w:bookmarkStart">
                                                <xsl:attribute name="w:id" select="$id"/>
                                                <xsl:attribute name="w:name" select="$HUD"/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:if>
                                </xsl:if>                                
                                <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                                
                                <xsl:variable name="id">
                                    <xsl:number level="any"/>
                                </xsl:variable>
                                <!-- 17-JAN-19: NEW BOOKMARK logic updated -->
                                <xsl:variable name="HUD" select="@ParaNumber"/>
                                <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                    <xsl:if test="not(string-length($HUD) =0)">
                                        <xsl:if test="not(contains($HUD,'FTXID'))">
                                            <xsl:element name="w:bookmarkStart">
                                                <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                                <xsl:attribute name="w:id" select="$id"/>
                                                <xsl:attribute name="w:name" select="$HUD"/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:if>
                                </xsl:if>
                            </xsl:when>
                            <xsl:otherwise>
                                <!-- 08-May-18: Panneer Boobmark logic -->
                                <!--<Properties>
                                    <RuleAboveColor type="object">Color/S112_2_0_276</RuleAboveColor>
                                </Properties>-->
                                <xsl:if test="child::Properties/RuleAboveColor">
                                    <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                    <xsl:variable name="id">
                                        <xsl:number level="any"/>
                                    </xsl:variable>
                                    <xsl:variable name="HUD">
                                        <xsl:choose>
                                            <xsl:when test="contains($NewBKmark,'_TX_')">
                                                <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                            </xsl:when>
                                            <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                                <xsl:value-of select="$NewBKmark"/>
                                            </xsl:when>
                                        </xsl:choose>
                                    </xsl:variable>
                                    <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                        <xsl:if test="not(string-length($HUD) =0)">
                                            <xsl:element name="w:bookmarkStart">
                                                <xsl:attribute name="w:id" select="$id"/>
                                                <xsl:attribute name="w:name" select="$HUD"/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:if>
                                </xsl:if>                                
                                <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                                <!-- Bookmark start new 21.8.2015 concept -->
                                <xsl:variable name="id">
                                    <xsl:number level="any"/>
                                </xsl:variable>
                                <!-- 17-JAN-19: NEW BOOKMARK logic updated -->
                                <xsl:variable name="HUD" select="@ParaNumber"/>
                               <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                <xsl:if test="not(string-length($HUD) =0)">
                                    <xsl:if test="not(contains($HUD,'FTXID'))">
                                        <xsl:element name="w:bookmarkStart">
                                            <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                            <xsl:attribute name="w:id" select="$id"/>
                                            <xsl:attribute name="w:name" select="$HUD"/>
                                        </xsl:element>
                                    </xsl:if>
                                </xsl:if>
                               </xsl:if>
                            </xsl:otherwise>
                        </xsl:choose>
                        
                        <xsl:if test="(child::CharacterStyleRange/Table)">
                        <!-- 08-May-18: Panneer Boobmark logic -->
                            <!--<Properties>
                                    <RuleAboveColor type="object">Color/S112_2_0_276</RuleAboveColor>
                                </Properties>-->
                            <xsl:if test="child::Properties/RuleAboveColor">
                                <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                <xsl:variable name="id">
                                    <xsl:number level="any"/>
                                </xsl:variable>
                                <xsl:variable name="HUD">
                                    <xsl:choose>
                                        <xsl:when test="contains($NewBKmark,'_TX_')">
                                            <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                        </xsl:when>
                                        <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                            <xsl:value-of select="$NewBKmark"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                    <xsl:if test="not(string-length($HUD) =0)">
                                        <xsl:element name="w:bookmarkEnd">
                                            <xsl:attribute name="w:id" select="$id"/>
                                        </xsl:element>
                                    </xsl:if>
                                </xsl:if>
                            </xsl:if>                                
                            <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                            <xsl:variable name="id">
                                <xsl:number level="any"/>
                            </xsl:variable>
                            <!-- 17-JAN-19: NEW BOOKMARK logic updated -->
                            <xsl:variable name="HUD" select="@ParaNumber"/>
                            <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                <xsl:if test="not(string-length($HUD) =0)">
                                    <xsl:if test="not(contains($HUD,'FTXID'))">
                                        <xsl:element name="w:bookmarkStart">
                                            <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                            <xsl:attribute name="w:id" select="$id"/>
                                            <xsl:attribute name="w:name" select="$HUD"/>
                                        </xsl:element>
                                    </xsl:if>
                                </xsl:if>
                            </xsl:if>
                            
                        
                        </xsl:if>
                         <!-- Taken from inp.xslt END -->
                         <xsl:apply-templates/>
                         <!-- Taken from inp.xslt  -->
                         <xsl:choose>
                             <xsl:when test="(child::CharacterStyleRange/Table)"/>
                             <xsl:otherwise>
                                 <!-- 08-May-18: Panneer Boobmark logic -->
                                 <!--<Properties>
                                    <RuleAboveColor type="object">Color/S112_2_0_276</RuleAboveColor>
                                </Properties>-->
                                 <xsl:if test="child::Properties/RuleAboveColor">
                                     <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                     <xsl:variable name="id">
                                         <xsl:number level="any"/>
                                     </xsl:variable>
                                     <xsl:variable name="HUD">
                                         <xsl:choose>
                                             <xsl:when test="contains($NewBKmark,'_TX_')">
                                                 <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                             </xsl:when>
                                             <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                                 <xsl:value-of select="$NewBKmark"/>
                                             </xsl:when>
                                         </xsl:choose>
                                     </xsl:variable>
                                     <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                         <xsl:if test="not(string-length($HUD) =0)">
                                             <xsl:element name="w:bookmarkEnd">
                                                 <xsl:attribute name="w:id" select="$id"/>
                                             </xsl:element>
                                         </xsl:if>
                                     </xsl:if>
                                 </xsl:if>                                
                                 <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                                 <!-- Bookmark end new 21.8.2015 concept -->
                                 
                                     <xsl:variable name="id">
                                         <xsl:number level="any"/>
                                     </xsl:variable>
                                     <xsl:variable name="HUD" select="@ParaNumber"/>
                                    
                                      <xsl:if test="not(ancestor::Footnote|ancestor::Note)">
                                         <xsl:if test="not(string-length($HUD) =0)">
                                             <xsl:element name="w:bookmarkEnd">
                                                 <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                                 <xsl:attribute name="w:id" select="$id"/>
                                             </xsl:element>
                                         </xsl:if>
                                     </xsl:if>
                                     
                                 
                                 <!-- Bookmark end new 21.8.2015 concept -->
                             </xsl:otherwise>
                         </xsl:choose>
                         <xsl:if test="not(child::CharacterStyleRange/Table)">                             
                         </xsl:if>
                         <!-- Taken from inp.xslt END -->
                     </xsl:element>
                 </xsl:when>
                 <xsl:when test="$curParaNumLvl = '2' or $listlvl = '2'">
                     <xsl:text>&#x000A;</xsl:text>
                     <xsl:element name="two">                         
                         <xsl:attribute name="class" select="translate($Na1, ' /\[\]@','_')"/>
                         <xsl:attribute name="data-name" select="$Na2"/>
                         <!-- 24-JAN-19: For Mariappan -->
                         <xsl:attribute name="data-parentStory">
                             <!-- Commented on 06-FEB-19, now taken from IDMLs "ParentStory" attribute not from sree's bkmark -->
                             <!--<xsl:variable name="paraINFO" select="@ParaInfo"/>
                             <xsl:value-of select="concat('Story_',substring-before(substring-after($paraINFO,'_Story_'),'_'))"/>-->
                             <xsl:value-of select="@ParentStory"/>
                         </xsl:attribute>
                         <xsl:attribute name="listtype" select="$Na2"/>
                         <xsl:attribute name="numberFormat" select="$listnumformat"/>
                         <xsl:attribute name="numberType" select="$listtype"/>
                         <!-- Added for listtype on 8-12-2023 Azure 1552 -->
                         <!--<xsl:attribute name="start" select="$NumberingStartAt"/>-->
                         <xsl:attribute name="start">
                             <xsl:choose>
                                 <xsl:when test="string-length(@SelfNumberingStartAt) &gt;0">
                                     <xsl:value-of select="normalize-space(@SelfNumberingStartAt)"/>
                                 </xsl:when>
                                 <xsl:otherwise>
                                     <xsl:value-of select="$NumberingStartAt"/>
                                 </xsl:otherwise>
                             </xsl:choose>
                         </xsl:attribute>
                         <!-- Taken from inp.xslt -->
                         
                         <xsl:if test="@Justification | @FirstLineIndent | @LeftIndent | @RightIndent">
                             <xsl:attribute name="style">
                                 <xsl:if test="@Justification">  
                                     <xsl:choose>
                                         <xsl:when test="contains(@Justification, 'Center')">
                                             <xsl:value-of select="'text-align:center'"/>
                                         </xsl:when>
                                         <xsl:when test="contains(@Justification, 'Left')">
                                             <xsl:value-of select="'text-align:left'"/>
                                         </xsl:when>
                                         <xsl:when test="contains(@Justification, 'Right')">
                                             <xsl:value-of select="'text-align:right'"/>
                                         </xsl:when>
                                         <xsl:otherwise>
                                             <xsl:value-of select="'text-align:justify'"/>
                                         </xsl:otherwise>
                                     </xsl:choose>
                                 </xsl:if>                                
                                 <xsl:if test="@FirstLineIndent">
                                     <xsl:if test="@Justification">
                                         <xsl:text>;</xsl:text>  
                                     </xsl:if>
                                     <xsl:choose>
                                         <xsl:when test="@FirstLineIndent = '0'">
                                             <xsl:value-of select="'text-indent:0pt;'"/>
                                         </xsl:when>
                                         <xsl:otherwise>
                                             <xsl:if test="@FirstLineIndent &lt; 0">
                                                 <!--<xsl:text>padding-left:</xsl:text>-->
                                                 <xsl:text>text-indent:</xsl:text>
                                                 <xsl:value-of select="@FirstLineIndent div 2"/>
                                                 <xsl:text>pt</xsl:text>
                                             </xsl:if>
                                             <xsl:if test="@FirstLineIndent > 0">
                                                 <xsl:text>text-indent:</xsl:text>
                                                 <xsl:value-of select="@FirstLineIndent div 2"/>
                                                 <xsl:text>pt</xsl:text>
                                             </xsl:if>
                                             <!--<xsl:text>text-indent:</xsl:text>
                                            <xsl:value-of select="@FirstLineIndent"/>
                                            <xsl:text>pt</xsl:text>-->
                                         </xsl:otherwise>
                                     </xsl:choose>
                                 </xsl:if>
                                 <xsl:if test="@LeftIndent">
                                     <xsl:if test="@Justification | @FirstLineIndent">
                                         <xsl:text>;</xsl:text>  
                                     </xsl:if>
                                     <xsl:choose>
                                         <xsl:when test="@LeftIndent = '0'">
                                             <xsl:value-of select="'margin-left:0pt;'"/>
                                         </xsl:when>
                                         <xsl:otherwise>
                                             <xsl:text>margin-left:</xsl:text>
                                             <xsl:value-of select="@LeftIndent div 2"/>
                                             <xsl:text>pt</xsl:text>
                                         </xsl:otherwise>
                                     </xsl:choose>
                                 </xsl:if>
                                 <xsl:if test="@RightIndent">
                                     <xsl:if test="@Justification | @FirstLineIndent | @LeftIndent">
                                         <xsl:text>;</xsl:text>  
                                     </xsl:if>
                                     <xsl:choose>
                                         <xsl:when test="@RightIndent = '0'">
                                             <xsl:value-of select="'margin-right:0pt;'"/>
                                         </xsl:when>
                                         <xsl:otherwise>
                                             <xsl:text>margin-right:</xsl:text>
                                             <xsl:value-of select="@RightIndent div 2"/>
                                             <xsl:text>pt</xsl:text>
                                         </xsl:otherwise>
                                     </xsl:choose>
                                 </xsl:if>
                             </xsl:attribute>
                         </xsl:if>
                         
                         
                         <xsl:if test="@ParaInfo">
                            <xsl:attribute name="w:rsidR" select="$PN"/>
                        </xsl:if>
                         <xsl:if test="string-length($txtFrameId) &gt; 0">
                             <xsl:choose>
                                 <xsl:when test="starts-with($txtFrameId,'u')">
                                     <xsl:attribute name="txtFrameId" select="$txtFrameId"/>        
                                 </xsl:when>
                                 <xsl:otherwise>
                                     <xsl:attribute name="txtFrameId" select="concat('u',$txtFrameId)"/>
                                 </xsl:otherwise>
                             </xsl:choose>
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
                                                        <xsl:attribute name="w:val" select="replace($Na1,'\\','_')"/>
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
                            </xsl:element>
                            <xsl:apply-templates select="child::Properties/TabList" mode="tabs"/>
                            <!--List auto number restart-->
                            <xsl:copy-of select="$ListNRestart"/>
                            <xsl:if test="not(child::w:numPr) and @BulletsAndNumberingListType ='NoList'">
                                <xsl:element name="w:numPr">
                                    <xsl:element name="w:ilvl">
                                        <xsl:attribute name="w:val" select="'0'"/>
                                    </xsl:element>
                                    <xsl:element name="w:numId">
                                        <xsl:attribute name="w:val">
                                            <xsl:value-of select="0"/>
                                        </xsl:attribute>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:if>
                            <!--List auto number restart-->
                            
                            <xsl:if test="not(string-length(@ParaInfo) = 0)">
                          </xsl:if>
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
                                <xsl:if test="contains($JC,'LeftAlign')">
                                    <xsl:element name="w:jc">
                                        <xsl:attribute name="w:val" select="'left'"/>
                                    </xsl:element>
                                </xsl:if>
                            </xsl:if>
                            <!--@@@@@@@@@@@@@@@@@@@@@@@@ Justification End @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                        
                        </xsl:element>
                        <xsl:choose>
                            <xsl:when test="(child::CharacterStyleRange/Table)">
                                <!-- 08-May-18: Panneer Boobmark logic -->
                                <!--<Properties>
                                    <RuleAboveColor type="object">Color/S112_2_0_276</RuleAboveColor>
                                </Properties>-->
                                <xsl:if test="child::Properties/RuleAboveColor">
                                    <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                    <xsl:variable name="id">
                                        <xsl:number level="any"/>
                                    </xsl:variable>
                                    <xsl:variable name="HUD">
                                        <xsl:choose>
                                            <xsl:when test="contains($NewBKmark,'_TX_')">
                                                <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                            </xsl:when>
                                            <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                                <xsl:value-of select="$NewBKmark"/>
                                            </xsl:when>
                                        </xsl:choose>
                                    </xsl:variable>
                                    <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                        <xsl:if test="not(string-length($HUD) =0)">
                                            <xsl:element name="w:bookmarkStart">
                                                <xsl:attribute name="w:id" select="$id"/>
                                                <xsl:attribute name="w:name" select="$HUD"/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:if>
                                </xsl:if>                                
                                <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                                
                                
                                    <xsl:variable name="id">
                                        <xsl:number level="any"/>
                                    </xsl:variable>
                                    <xsl:variable name="HUD" select="@ParaNumber"/>
                                    <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                        <xsl:if test="not(string-length($HUD) =0)">
                                            <xsl:element name="w:bookmarkStart">
                                                <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                                <xsl:attribute name="w:id" select="$id"/>
                                                <xsl:attribute name="w:name" select="$HUD"/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:if>
                                
                            </xsl:when>
                            <xsl:otherwise>
                                <!-- 08-May-18: Panneer Boobmark logic -->
                                <!--<Properties>
                                    <RuleAboveColor type="object">Color/S112_2_0_276</RuleAboveColor>
                                </Properties>-->
                                <xsl:if test="child::Properties/RuleAboveColor">
                                    <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                    <xsl:variable name="id">
                                        <xsl:number level="any"/>
                                    </xsl:variable>
                                    <xsl:variable name="HUD">
                                        <xsl:choose>
                                            <xsl:when test="contains($NewBKmark,'_TX_')">
                                                <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                            </xsl:when>
                                            <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                                <xsl:value-of select="$NewBKmark"/>
                                            </xsl:when>
                                        </xsl:choose>
                                    </xsl:variable>
                                    <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                        <xsl:if test="not(string-length($HUD) =0)">
                                            <xsl:element name="w:bookmarkStart">
                                                <xsl:attribute name="w:id" select="$id"/>
                                                <xsl:attribute name="w:name" select="$HUD"/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:if>
                                </xsl:if>                                
                                <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                                <!-- Bookmark start new 21.8.2015 concept -->
                                
                                    <xsl:variable name="id">
                                        <xsl:number level="any"/>
                                    </xsl:variable>
                                    <xsl:variable name="HUD" select="@ParaNumber"/>
                                    <!-- 16-JAN-19: Hari new logic, see above HUD -->
                                    
                                    <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                        <xsl:if test="not(string-length($HUD) =0)">
                                            <xsl:element name="w:bookmarkStart">
                                                <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                                <xsl:attribute name="w:id" select="$id"/>
                                                <xsl:attribute name="w:name" select="$HUD"/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:if>
                                
                                <!-- Bookmark start new 21.8.2015 concept -->
                            </xsl:otherwise>
                        </xsl:choose>
                        
                        <xsl:if test="(child::CharacterStyleRange/Table)">
                            <!-- 08-May-18: Panneer Boobmark logic -->
                            <!--<Properties>
                                    <RuleAboveColor type="object">Color/S112_2_0_276</RuleAboveColor>
                                </Properties>-->
                            <xsl:if test="child::Properties/RuleAboveColor">
                                <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                <xsl:variable name="id">
                                    <xsl:number level="any"/>
                                </xsl:variable>
                                <xsl:variable name="HUD">
                                    <xsl:choose>
                                        <xsl:when test="contains($NewBKmark,'_TX_')">
                                            <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                        </xsl:when>
                                        <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                            <xsl:value-of select="$NewBKmark"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                    <xsl:if test="not(string-length($HUD) =0)">
                                        <xsl:element name="w:bookmarkEnd">
                                            <xsl:attribute name="w:id" select="$id"/>
                                        </xsl:element>
                                    </xsl:if>
                                </xsl:if>
                            </xsl:if>                                
                            <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                            
                            <!-- Bookmark end new 21.8.2015 concept -->
                            
                                <xsl:variable name="id">
                                    <xsl:number level="any"/>
                                </xsl:variable>
                                <xsl:variable name="HUD" select="@ParaNumber"/>
                                    
                                 <xsl:if test="not(ancestor::Footnote|ancestor::Note)">
                                    <xsl:if test="not(string-length($HUD) =0)">
                                        <xsl:element name="w:bookmarkEnd">
                                            <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                            <xsl:attribute name="w:id" select="$id"/>
                                        </xsl:element>
                                    </xsl:if>
                                </xsl:if>                                
                            
                            <!-- Bookmark end new 21.8.2015 concept -->
                        </xsl:if>
                        <!-- Taken from inp.xslt END -->
                         <xsl:apply-templates/>
                         <!-- Taken from inp.xslt  -->
                         <xsl:choose>
                             <xsl:when test="(child::CharacterStyleRange/Table)"/>
                             <xsl:otherwise>
                                 <!-- Bookmark end new 21.8.2015 concept -->
                                 
                                     <xsl:variable name="id">
                                         <xsl:number level="any"/>
                                     </xsl:variable>
                                     <xsl:variable name="HUD" select="@ParaNumber"/>
                                    
                                      <xsl:if test="not(ancestor::Footnote|ancestor::Note)">
                                         <xsl:if test="not(string-length($HUD) =0)">
                                             <xsl:element name="w:bookmarkEnd">
                                                 <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                                 <xsl:attribute name="w:id" select="$id"/>
                                             </xsl:element>
                                         </xsl:if>
                                     </xsl:if>
                                 <xsl:if test="child::Properties/RuleAboveColor">
                                     <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                     <xsl:variable name="id">
                                         <xsl:number level="any"/>
                                     </xsl:variable>
                                     <xsl:variable name="HUD">
                                         <xsl:choose>
                                             <xsl:when test="contains($NewBKmark,'_TX_')">
                                                 <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                             </xsl:when>
                                             <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                                 <xsl:value-of select="$NewBKmark"/>
                                             </xsl:when>
                                         </xsl:choose>
                                     </xsl:variable>
                                     <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                         <xsl:if test="not(string-length($HUD) =0)">
                                             <xsl:element name="w:bookmarkEnd">
                                                 <xsl:attribute name="w:id" select="$id"/>
                                             </xsl:element>
                                         </xsl:if>
                                     </xsl:if>
                                 </xsl:if>                                
                                 <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                             </xsl:otherwise>
                         </xsl:choose>
                         <xsl:if test="not(child::CharacterStyleRange/Table)">
                             
                         </xsl:if>
                         <!-- Taken from inp.xslt END -->
                         
                     </xsl:element>
                 </xsl:when>
                 <xsl:when test="$curParaNumLvl = '3' or $listlvl = '3'">
                     <xsl:text>&#x000A;</xsl:text>
                     <xsl:element name="three">
                         <xsl:attribute name="class" select="translate($Na1, ' /\[\]@','_')"/>
                         <xsl:attribute name="data-name" select="$Na2"/>  
                         <!-- 24-JAN-19: For Mariappan -->
                         <xsl:attribute name="data-parentStory">
                             <!-- Commented on 06-FEB-19, now taken from IDMLs "ParentStory" attribute not from sree's bkmark -->
                             <!--<xsl:variable name="paraINFO" select="@ParaInfo"/>
                             <xsl:value-of select="concat('Story_',substring-before(substring-after($paraINFO,'_Story_'),'_'))"/>-->
                             <xsl:value-of select="@ParentStory"/>
                         </xsl:attribute>
                         <xsl:attribute name="listtype" select="$Na2"/>
                         <xsl:attribute name="numberFormat" select="$listnumformat"/>
                         <xsl:attribute name="numberType" select="$listtype"/>
                         <!-- Added for listtype on 8-12-2023 Azure 1552 -->
                         <!--<xsl:attribute name="start" select="$NumberingStartAt"/>-->
                         <xsl:attribute name="start">
                             <xsl:choose>
                                 <xsl:when test="string-length(@SelfNumberingStartAt) &gt;0">
                                     <xsl:value-of select="normalize-space(@SelfNumberingStartAt)"/>
                                 </xsl:when>
                                 <xsl:otherwise>
                                     <xsl:value-of select="$NumberingStartAt"/>
                                 </xsl:otherwise>
                             </xsl:choose>
                         </xsl:attribute>
                         
                         <xsl:if test="@Justification | @FirstLineIndent | @LeftIndent | @RightIndent">
                             <xsl:attribute name="style">
                                 <xsl:if test="@Justification">  
                                     <xsl:choose>
                                         <xsl:when test="contains(@Justification, 'Center')">
                                             <xsl:value-of select="'text-align:center'"/>
                                         </xsl:when>
                                         <xsl:when test="contains(@Justification, 'Left')">
                                             <xsl:value-of select="'text-align:left'"/>
                                         </xsl:when>
                                         <xsl:when test="contains(@Justification, 'Right')">
                                             <xsl:value-of select="'text-align:right'"/>
                                         </xsl:when>
                                         <xsl:otherwise>
                                             <xsl:value-of select="'text-align:justify'"/>
                                         </xsl:otherwise>
                                     </xsl:choose>
                                 </xsl:if>                                
                                 <xsl:if test="@FirstLineIndent">
                                     <xsl:if test="@Justification">
                                         <xsl:text>;</xsl:text>  
                                     </xsl:if>
                                     <xsl:choose>
                                         <xsl:when test="@FirstLineIndent = '0'">
                                             <xsl:value-of select="'text-indent:0pt;'"/>
                                         </xsl:when>
                                         <xsl:otherwise>
                                             <xsl:if test="@FirstLineIndent &lt; 0">
                                                 <!--<xsl:text>padding-left:</xsl:text>-->
                                                 <xsl:text>text-indent:</xsl:text>
                                                 <xsl:value-of select="@FirstLineIndent div 2"/>
                                                 <xsl:text>pt</xsl:text>
                                             </xsl:if>
                                             <xsl:if test="@FirstLineIndent > 0">
                                                 <xsl:text>text-indent:</xsl:text>
                                                 <xsl:value-of select="@FirstLineIndent div 2"/>
                                                 <xsl:text>pt</xsl:text>
                                             </xsl:if>
                                             <!--<xsl:text>text-indent:</xsl:text>
                                            <xsl:value-of select="@FirstLineIndent"/>
                                            <xsl:text>pt</xsl:text>-->
                                         </xsl:otherwise>
                                     </xsl:choose>
                                 </xsl:if>
                                 <xsl:if test="@LeftIndent">
                                     <xsl:if test="@Justification | @FirstLineIndent">
                                         <xsl:text>;</xsl:text>  
                                     </xsl:if>
                                     <xsl:choose>
                                         <xsl:when test="@LeftIndent = '0'">
                                             <xsl:value-of select="'margin-left:0pt;'"/>
                                         </xsl:when>
                                         <xsl:otherwise>
                                             <xsl:text>margin-left:</xsl:text>
                                             <xsl:value-of select="@LeftIndent div 2"/>
                                             <xsl:text>pt</xsl:text>
                                         </xsl:otherwise>
                                     </xsl:choose>
                                 </xsl:if>
                                 <xsl:if test="@RightIndent">
                                     <xsl:if test="@Justification | @FirstLineIndent | @LeftIndent">
                                         <xsl:text>;</xsl:text>  
                                     </xsl:if>
                                     <xsl:choose>
                                         <xsl:when test="@RightIndent = '0'">
                                             <xsl:value-of select="'margin-right:0pt;'"/>
                                         </xsl:when>
                                         <xsl:otherwise>
                                             <xsl:text>margin-right:</xsl:text>
                                             <xsl:value-of select="@RightIndent div 2"/>
                                             <xsl:text>pt</xsl:text>
                                         </xsl:otherwise>
                                     </xsl:choose>
                                 </xsl:if>
                             </xsl:attribute>
                         </xsl:if>
                         
                        <xsl:if test="@ParaInfo">
                            <xsl:attribute name="w:rsidR" select="$PN"/>
                        </xsl:if>
                         <xsl:if test="string-length($txtFrameId) &gt; 0">
                             <xsl:choose>
                                 <xsl:when test="starts-with($txtFrameId,'u')">
                                     <xsl:attribute name="txtFrameId" select="$txtFrameId"/>        
                                 </xsl:when>
                                 <xsl:otherwise>
                                     <xsl:attribute name="txtFrameId" select="concat('u',$txtFrameId)"/>
                                 </xsl:otherwise>
                             </xsl:choose>
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
                                                        <xsl:attribute name="w:val" select="replace($Na1,'\\','_')"/>
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
                            </xsl:element>
                            <xsl:apply-templates select="child::Properties/TabList" mode="tabs"/>
                            <!--List auto number restart-->
                            <xsl:copy-of select="$ListNRestart"/>
                            <xsl:if test="not(child::w:numPr) and @BulletsAndNumberingListType ='NoList'">
                                <xsl:element name="w:numPr">
                                    <xsl:element name="w:ilvl">
                                        <xsl:attribute name="w:val" select="'0'"/>
                                    </xsl:element>
                                    <xsl:element name="w:numId">
                                        <xsl:attribute name="w:val">
                                            <xsl:value-of select="0"/>
                                        </xsl:attribute>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:if>
                            <!--List auto number restart-->
                            
                            <xsl:if test="not(string-length(@ParaInfo) = 0)">
                          </xsl:if>
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
                        <xsl:choose>
                            <xsl:when test="(child::CharacterStyleRange/Table)">
                                
                                    <xsl:variable name="id">
                                        <xsl:number level="any"/>
                                    </xsl:variable>
                                    <xsl:variable name="HUD" select="@ParaNumber"/>
                                    <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                        <xsl:if test="not(string-length($HUD) =0)">
                                            <xsl:element name="w:bookmarkStart">
                                                <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                                <xsl:attribute name="w:id" select="$id"/>
                                                <xsl:attribute name="w:name" select="$HUD"/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:if>
                                <xsl:if test="child::Properties/RuleAboveColor">
                                    <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                    <xsl:variable name="id">
                                        <xsl:number level="any"/>
                                    </xsl:variable>
                                    <xsl:variable name="HUD">
                                        <xsl:choose>
                                            <xsl:when test="contains($NewBKmark,'_TX_')">
                                                <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                            </xsl:when>
                                            <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                                <xsl:value-of select="$NewBKmark"/>
                                            </xsl:when>
                                        </xsl:choose>
                                    </xsl:variable>
                                    <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                        <xsl:if test="not(string-length($HUD) =0)">
                                            <xsl:element name="w:bookmarkStart">
                                                <xsl:attribute name="w:id" select="$id"/>
                                                <xsl:attribute name="w:name" select="$HUD"/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:if>
                                </xsl:if>                                
                                <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                            </xsl:when>
                            <xsl:otherwise>                                
                                    <xsl:variable name="id">
                                        <xsl:number level="any"/>
                                    </xsl:variable>
                                    <xsl:variable name="HUD" select="@ParaNumber"/>
                                    <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                        <xsl:if test="not(string-length($HUD) =0)">
                                            <xsl:element name="w:bookmarkStart">
                                                <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                                <xsl:attribute name="w:id" select="$id"/>
                                                <xsl:attribute name="w:name" select="$HUD"/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:if>
                                <xsl:if test="child::Properties/RuleAboveColor">
                                    <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                    <xsl:variable name="id">
                                        <xsl:number level="any"/>
                                    </xsl:variable>
                                    <xsl:variable name="HUD">
                                        <xsl:choose>
                                            <xsl:when test="contains($NewBKmark,'_TX_')">
                                                <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                            </xsl:when>
                                            <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                                <xsl:value-of select="$NewBKmark"/>
                                            </xsl:when>
                                        </xsl:choose>
                                    </xsl:variable>
                                    <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                        <xsl:if test="not(string-length($HUD) =0)">
                                            <xsl:element name="w:bookmarkStart">
                                                <xsl:attribute name="w:id" select="$id"/>
                                                <xsl:attribute name="w:name" select="$HUD"/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:if>
                                </xsl:if>                                
                                <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                            </xsl:otherwise>
                        </xsl:choose>
                        
                        <xsl:if test="(child::CharacterStyleRange/Table)">
                                <xsl:variable name="id">
                                    <xsl:number level="any"/>
                                </xsl:variable>
                                <xsl:variable name="HUD" select="@ParaNumber"/>
                                 <xsl:if test="not(ancestor::Footnote|ancestor::Note)">
                                    <xsl:if test="not(string-length($HUD) =0)">
                                        <xsl:element name="w:bookmarkEnd">
                                            <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                            <xsl:attribute name="w:id" select="$id"/>
                                        </xsl:element>
                                    </xsl:if>
                                </xsl:if>
                            <xsl:if test="child::Properties/RuleAboveColor">
                                <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                <xsl:variable name="id">
                                    <xsl:number level="any"/>
                                </xsl:variable>
                                <xsl:variable name="HUD">
                                    <xsl:choose>
                                        <xsl:when test="contains($NewBKmark,'_TX_')">
                                            <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                        </xsl:when>
                                        <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                            <xsl:value-of select="$NewBKmark"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                    <xsl:if test="not(string-length($HUD) =0)">
                                        <xsl:element name="w:bookmarkEnd">
                                            <xsl:attribute name="w:id" select="$id"/>
                                        </xsl:element>
                                    </xsl:if>
                                </xsl:if>
                            </xsl:if>                                
                            <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                        </xsl:if>
                        <!-- Taken from inp.xslt END -->
                         <xsl:apply-templates/>
                         <!-- Taken from inp.xslt  -->
                         <xsl:choose>
                             <xsl:when test="(child::CharacterStyleRange/Table)"/>
                             <xsl:otherwise>
                                     <xsl:variable name="id">
                                         <xsl:number level="any"/>
                                     </xsl:variable>
                                     <xsl:variable name="HUD" select="@ParaNumber"/>
                                      <xsl:if test="not(ancestor::Footnote|ancestor::Note)">
                                         <xsl:if test="not(string-length($HUD) =0)">
                                             <xsl:element name="w:bookmarkEnd">
                                                 <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                                 <xsl:attribute name="w:id" select="$id"/>
                                             </xsl:element>
                                         </xsl:if>
                                     </xsl:if>
                                 <xsl:if test="child::Properties/RuleAboveColor">
                                     <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                     <xsl:variable name="id">
                                         <xsl:number level="any"/>
                                     </xsl:variable>
                                     <xsl:variable name="HUD">
                                         <xsl:choose>
                                             <xsl:when test="contains($NewBKmark,'_TX_')">
                                                 <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                             </xsl:when>
                                             <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                                 <xsl:value-of select="$NewBKmark"/>
                                             </xsl:when>
                                         </xsl:choose>
                                     </xsl:variable>
                                     <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                         <xsl:if test="not(string-length($HUD) =0)">
                                             <xsl:element name="w:bookmarkEnd">
                                                 <xsl:attribute name="w:id" select="$id"/>
                                             </xsl:element>
                                         </xsl:if>
                                     </xsl:if>
                                 </xsl:if>                                
                                 <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                             </xsl:otherwise>
                         </xsl:choose>
                         <xsl:if test="not(child::CharacterStyleRange/Table)">
                             
                         </xsl:if>
                         <!-- Taken from inp.xslt END -->
                     </xsl:element>
                 </xsl:when>
                 <xsl:when test="$curParaNumLvl = '4' or $listlvl = '4'">
                     <xsl:text>&#x000A;</xsl:text>
                     <xsl:element name="four">
                         <xsl:attribute name="class" select="translate($Na1, ' /\[\]@','_')"/>
                         <xsl:attribute name="data-name" select="$Na2"/>
                         <!-- 24-JAN-19: For Mariappan -->
                         <xsl:attribute name="data-parentStory">
                             <!-- Commented on 06-FEB-19, now taken from IDMLs "ParentStory" attribute not from sree's bkmark -->
                             <!--<xsl:variable name="paraINFO" select="@ParaInfo"/>
                             <xsl:value-of select="concat('Story_',substring-before(substring-after($paraINFO,'_Story_'),'_'))"/>-->
                             <xsl:value-of select="@ParentStory"/>
                         </xsl:attribute>
                         <xsl:attribute name="listtype" select="$Na2"/>
                         <xsl:attribute name="numberFormat" select="$listnumformat"/>
                         <xsl:attribute name="numberType" select="$listtype"/>
                         <!-- Added for listtype on 8-12-2023 Azure 1552 -->
                         <!--<xsl:attribute name="start" select="$NumberingStartAt"/>-->
                         <xsl:attribute name="start">
                             <xsl:choose>
                                 <xsl:when test="string-length(@SelfNumberingStartAt) &gt;0">
                                     <xsl:value-of select="normalize-space(@SelfNumberingStartAt)"/>
                                 </xsl:when>
                                 <xsl:otherwise>
                                     <xsl:value-of select="$NumberingStartAt"/>
                                 </xsl:otherwise>
                             </xsl:choose>
                         </xsl:attribute>
                         <xsl:if test="@Justification | @FirstLineIndent | @LeftIndent | @RightIndent">
                             <xsl:attribute name="style">
                                 <xsl:if test="@Justification">  
                                     <xsl:choose>
                                         <xsl:when test="contains(@Justification, 'Center')">
                                             <xsl:value-of select="'text-align:center'"/>
                                         </xsl:when>
                                         <xsl:when test="contains(@Justification, 'Left')">
                                             <xsl:value-of select="'text-align:left'"/>
                                         </xsl:when>
                                         <xsl:when test="contains(@Justification, 'Right')">
                                             <xsl:value-of select="'text-align:right'"/>
                                         </xsl:when>
                                         <xsl:otherwise>
                                             <xsl:value-of select="'text-align:justify'"/>
                                         </xsl:otherwise>
                                     </xsl:choose>
                                 </xsl:if>                                
                                 <xsl:if test="@FirstLineIndent">
                                     <xsl:if test="@Justification">
                                         <xsl:text>;</xsl:text>  
                                     </xsl:if>
                                     <xsl:choose>
                                         <xsl:when test="@FirstLineIndent = '0'">
                                             <xsl:value-of select="'text-indent:0pt;'"/>
                                         </xsl:when>
                                         <xsl:otherwise>
                                             <xsl:if test="@FirstLineIndent &lt; 0">
                                                 <!--<xsl:text>padding-left:</xsl:text>-->
                                                 <xsl:text>text-indent:</xsl:text>
                                                 <xsl:value-of select="@FirstLineIndent div 2"/>
                                                 <xsl:text>pt</xsl:text>
                                             </xsl:if>
                                             <xsl:if test="@FirstLineIndent > 0">
                                                 <xsl:text>text-indent:</xsl:text>
                                                 <xsl:value-of select="@FirstLineIndent div 2"/>
                                                 <xsl:text>pt</xsl:text>
                                             </xsl:if>
                                             <!--<xsl:text>text-indent:</xsl:text>
                                            <xsl:value-of select="@FirstLineIndent"/>
                                            <xsl:text>pt</xsl:text>-->
                                         </xsl:otherwise>
                                     </xsl:choose>
                                 </xsl:if>
                                 <xsl:if test="@LeftIndent">
                                     <xsl:if test="@Justification | @FirstLineIndent">
                                         <xsl:text>;</xsl:text>  
                                     </xsl:if>
                                     <xsl:choose>
                                         <xsl:when test="@LeftIndent = '0'">
                                             <xsl:value-of select="'margin-left:0pt;'"/>
                                         </xsl:when>
                                         <xsl:otherwise>
                                             <xsl:text>margin-left:</xsl:text>
                                             <xsl:value-of select="@LeftIndent div 2"/>
                                             <xsl:text>pt</xsl:text>
                                         </xsl:otherwise>
                                     </xsl:choose>
                                 </xsl:if>
                                 <xsl:if test="@RightIndent">
                                     <xsl:if test="@Justification | @FirstLineIndent | @LeftIndent">
                                         <xsl:text>;</xsl:text>  
                                     </xsl:if>
                                     <xsl:choose>
                                         <xsl:when test="@RightIndent = '0'">
                                             <xsl:value-of select="'margin-right:0pt;'"/>
                                         </xsl:when>
                                         <xsl:otherwise>
                                             <xsl:text>margin-right:</xsl:text>
                                             <xsl:value-of select="@RightIndent div 2"/>
                                             <xsl:text>pt</xsl:text>
                                         </xsl:otherwise>
                                     </xsl:choose>
                                 </xsl:if>
                             </xsl:attribute>
                         </xsl:if>
                        <xsl:if test="@ParaInfo">
                            <xsl:attribute name="w:rsidR" select="$PN"/>
                        </xsl:if>
                         <xsl:if test="string-length($txtFrameId) &gt; 0">
                             <xsl:choose>
                                 <xsl:when test="starts-with($txtFrameId,'u')">
                                     <xsl:attribute name="txtFrameId" select="$txtFrameId"/>        
                                 </xsl:when>
                                 <xsl:otherwise>
                                     <xsl:attribute name="txtFrameId" select="concat('u',$txtFrameId)"/>
                                 </xsl:otherwise>
                             </xsl:choose>
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
                                                        <xsl:attribute name="w:val" select="replace($Na1,'\\','_')"/>
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
                            </xsl:element>
                            <xsl:apply-templates select="child::Properties/TabList" mode="tabs"/>
                            <!--List auto number restart-->
                            <xsl:copy-of select="$ListNRestart"/>
                            <xsl:if test="not(child::w:numPr) and @BulletsAndNumberingListType ='NoList'">
                                <xsl:element name="w:numPr">
                                    <xsl:element name="w:ilvl">
                                        <xsl:attribute name="w:val" select="'0'"/>
                                    </xsl:element>
                                    <xsl:element name="w:numId">
                                        <xsl:attribute name="w:val">
                                            <xsl:value-of select="0"/>
                                        </xsl:attribute>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:if>
                            <!--List auto number restart-->
                            
                            <xsl:if test="not(string-length(@ParaInfo) = 0)">
                          </xsl:if>
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
                        <xsl:choose>
                            <xsl:when test="(child::CharacterStyleRange/Table)">                                
                                    <xsl:variable name="id">
                                        <xsl:number level="any"/>
                                    </xsl:variable>
                                    <xsl:variable name="HUD" select="@ParaNumber"/>
                                <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                        <xsl:if test="not(string-length($HUD) =0)">
                                            <xsl:element name="w:bookmarkStart">
                                                <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                                <xsl:attribute name="w:id" select="$id"/>
                                                <xsl:attribute name="w:name" select="$HUD"/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:if>
                                <xsl:if test="child::Properties/RuleAboveColor">
                                    <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                    <xsl:variable name="id">
                                        <xsl:number level="any"/>
                                    </xsl:variable>
                                    <xsl:variable name="HUD">
                                        <xsl:choose>
                                            <xsl:when test="contains($NewBKmark,'_TX_')">
                                                <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                            </xsl:when>
                                            <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                                <xsl:value-of select="$NewBKmark"/>
                                            </xsl:when>
                                        </xsl:choose>
                                    </xsl:variable>
                                    <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                        <xsl:if test="not(string-length($HUD) =0)">
                                            <xsl:element name="w:bookmarkStart">
                                                <xsl:attribute name="w:id" select="$id"/>
                                                <xsl:attribute name="w:name" select="$HUD"/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:if>
                                </xsl:if>                                
                                <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                            </xsl:when>
                            <xsl:otherwise>
                                    <xsl:variable name="id">
                                        <xsl:number level="any"/>
                                    </xsl:variable>
                                    <xsl:variable name="HUD" select="@ParaNumber"/>
                                <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                        <xsl:if test="not(string-length($HUD) =0)">
                                            <xsl:element name="w:bookmarkStart">
                                                <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                                <xsl:attribute name="w:id" select="$id"/>
                                                <xsl:attribute name="w:name" select="$HUD"/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:if>
                                <xsl:if test="child::Properties/RuleAboveColor">
                                    <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                    <xsl:variable name="id">
                                        <xsl:number level="any"/>
                                    </xsl:variable>
                                    <xsl:variable name="HUD">
                                        <xsl:choose>
                                            <xsl:when test="contains($NewBKmark,'_TX_')">
                                                <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                            </xsl:when>
                                            <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                                <xsl:value-of select="$NewBKmark"/>
                                            </xsl:when>
                                        </xsl:choose>
                                    </xsl:variable>
                                    <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                        <xsl:if test="not(string-length($HUD) =0)">
                                            <xsl:element name="w:bookmarkStart">
                                                <xsl:attribute name="w:id" select="$id"/>
                                                <xsl:attribute name="w:name" select="$HUD"/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:if>
                                </xsl:if>                                
                                <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                            </xsl:otherwise>
                        </xsl:choose>
                        
                        <xsl:if test="(child::CharacterStyleRange/Table)">
                                <xsl:variable name="id">
                                    <xsl:number level="any"/>
                                </xsl:variable>
                                <xsl:variable name="HUD" select="@ParaNumber"/>
                                 <xsl:if test="not(ancestor::Footnote|ancestor::Note)">
                                    <xsl:if test="not(string-length($HUD) =0)">
                                        <xsl:element name="w:bookmarkEnd">
                                            <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                            <xsl:attribute name="w:id" select="$id"/>
                                        </xsl:element>
                                    </xsl:if>
                                </xsl:if>
                            <xsl:if test="child::Properties/RuleAboveColor">
                                <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                <xsl:variable name="id">
                                    <xsl:number level="any"/>
                                </xsl:variable>
                                <xsl:variable name="HUD">
                                    <xsl:choose>
                                        <xsl:when test="contains($NewBKmark,'_TX_')">
                                            <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                        </xsl:when>
                                        <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                            <xsl:value-of select="$NewBKmark"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                    <xsl:if test="not(string-length($HUD) =0)">
                                        <xsl:element name="w:bookmarkEnd">
                                            <xsl:attribute name="w:id" select="$id"/>
                                        </xsl:element>
                                    </xsl:if>
                                </xsl:if>
                            </xsl:if>                                
                            <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                        </xsl:if>
                        <!-- Taken from inp.xslt END -->
                         <xsl:apply-templates/>
                         <!-- Taken from inp.xslt  -->
                         <xsl:choose>
                             <xsl:when test="(child::CharacterStyleRange/Table)"/>
                             <xsl:otherwise>
                                     <xsl:variable name="id">
                                         <xsl:number level="any"/>
                                     </xsl:variable>
                                     <xsl:variable name="HUD" select="@ParaNumber"/>
                                      <xsl:if test="not(ancestor::Footnote|ancestor::Note)">
                                         <xsl:if test="not(string-length($HUD) =0)">
                                             <xsl:element name="w:bookmarkEnd">
                                                 <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                                 <xsl:attribute name="w:id" select="$id"/>
                                             </xsl:element>
                                         </xsl:if>
                                     </xsl:if>
                                 <xsl:if test="child::Properties/RuleAboveColor">
                                     <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                     <xsl:variable name="id">
                                         <xsl:number level="any"/>
                                     </xsl:variable>
                                     <xsl:variable name="HUD">
                                         <xsl:choose>
                                             <xsl:when test="contains($NewBKmark,'_TX_')">
                                                 <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                             </xsl:when>
                                             <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                                 <xsl:value-of select="$NewBKmark"/>
                                             </xsl:when>
                                         </xsl:choose>
                                     </xsl:variable>
                                     <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                         <xsl:if test="not(string-length($HUD) =0)">
                                             <xsl:element name="w:bookmarkEnd">
                                                 <xsl:attribute name="w:id" select="$id"/>
                                             </xsl:element>
                                         </xsl:if>
                                     </xsl:if>
                                 </xsl:if>                                
                                 <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                             </xsl:otherwise>
                         </xsl:choose>
                         <xsl:if test="not(child::CharacterStyleRange/Table)">
                             
                         </xsl:if>
                         <!-- Taken from inp.xslt END -->
                     </xsl:element>
                 </xsl:when>
                 <xsl:when test="$curParaNumLvl = '5' or $listlvl = '5'">
                     <xsl:text>&#x000A;</xsl:text>
                     <xsl:element name="five">
                         <xsl:attribute name="class" select="translate($Na1, ' /\[\]@','_')"/>
                         <xsl:attribute name="data-name" select="$Na2"/>
                         <!-- 24-JAN-19: For Mariappan -->
                         <xsl:attribute name="data-parentStory">
                             <!-- Commented on 06-FEB-19, now taken from IDMLs "ParentStory" attribute not from sree's bkmark -->
                             <!--<xsl:variable name="paraINFO" select="@ParaInfo"/>
                             <xsl:value-of select="concat('Story_',substring-before(substring-after($paraINFO,'_Story_'),'_'))"/>-->
                             <xsl:value-of select="@ParentStory"/>
                         </xsl:attribute>
                         <xsl:attribute name="listtype" select="$Na2"/>
                         <xsl:attribute name="numberFormat" select="$listnumformat"/>
                         <xsl:attribute name="numberType" select="$listtype"/>
                         <!-- Added for listtype on 8-12-2023 Azure 1552 -->
                         <!--<xsl:attribute name="start" select="$NumberingStartAt"/>-->
                         <xsl:attribute name="start">
                             <xsl:choose>
                                 <xsl:when test="string-length(@SelfNumberingStartAt) &gt;0">
                                     <xsl:value-of select="normalize-space(@SelfNumberingStartAt)"/>
                                 </xsl:when>
                                 <xsl:otherwise>
                                     <xsl:value-of select="$NumberingStartAt"/>
                                 </xsl:otherwise>
                             </xsl:choose>
                         </xsl:attribute>
                         <xsl:if test="@Justification | @FirstLineIndent | @LeftIndent | @RightIndent">
                             <xsl:attribute name="style">
                                 <xsl:if test="@Justification">  
                                     <xsl:choose>
                                         <xsl:when test="contains(@Justification, 'Center')">
                                             <xsl:value-of select="'text-align:center'"/>
                                         </xsl:when>
                                         <xsl:when test="contains(@Justification, 'Left')">
                                             <xsl:value-of select="'text-align:left'"/>
                                         </xsl:when>
                                         <xsl:when test="contains(@Justification, 'Right')">
                                             <xsl:value-of select="'text-align:right'"/>
                                         </xsl:when>
                                         <xsl:otherwise>
                                             <xsl:value-of select="'text-align:justify'"/>
                                         </xsl:otherwise>
                                     </xsl:choose>
                                 </xsl:if>                                
                                 <xsl:if test="@FirstLineIndent">
                                     <xsl:if test="@Justification">
                                         <xsl:text>;</xsl:text>  
                                     </xsl:if>
                                     <xsl:choose>
                                         <xsl:when test="@FirstLineIndent = '0'">
                                             <xsl:value-of select="'text-indent:0pt;'"/>
                                         </xsl:when>
                                         <xsl:otherwise>
                                             <xsl:if test="@FirstLineIndent &lt; 0">
                                                 <!--<xsl:text>padding-left:</xsl:text>-->
                                                 <xsl:text>text-indent:</xsl:text>
                                                 <xsl:value-of select="@FirstLineIndent div 2"/>
                                                 <xsl:text>pt</xsl:text>
                                             </xsl:if>
                                             <xsl:if test="@FirstLineIndent > 0">
                                                 <xsl:text>text-indent:</xsl:text>
                                                 <xsl:value-of select="@FirstLineIndent div 2"/>
                                                 <xsl:text>pt</xsl:text>
                                             </xsl:if>
                                             <!--<xsl:text>text-indent:</xsl:text>
                                            <xsl:value-of select="@FirstLineIndent"/>
                                            <xsl:text>pt</xsl:text>-->
                                         </xsl:otherwise>
                                     </xsl:choose>
                                 </xsl:if>
                                 <xsl:if test="@LeftIndent">
                                     <xsl:if test="@Justification | @FirstLineIndent">
                                         <xsl:text>;</xsl:text>  
                                     </xsl:if>
                                     <xsl:choose>
                                         <xsl:when test="@LeftIndent = '0'">
                                             <xsl:value-of select="'margin-left:0pt;'"/>
                                         </xsl:when>
                                         <xsl:otherwise>
                                             <xsl:text>margin-left:</xsl:text>
                                             <xsl:value-of select="@LeftIndent div 2"/>
                                             <xsl:text>pt</xsl:text>
                                         </xsl:otherwise>
                                     </xsl:choose>
                                 </xsl:if>
                                 <xsl:if test="@RightIndent">
                                     <xsl:if test="@Justification | @FirstLineIndent | @LeftIndent">
                                         <xsl:text>;</xsl:text>  
                                     </xsl:if>
                                     <xsl:choose>
                                         <xsl:when test="@RightIndent = '0'">
                                             <xsl:value-of select="'margin-right:0pt;'"/>
                                         </xsl:when>
                                         <xsl:otherwise>
                                             <xsl:text>margin-right:</xsl:text>
                                             <xsl:value-of select="@RightIndent div 2"/>
                                             <xsl:text>pt</xsl:text>
                                         </xsl:otherwise>
                                     </xsl:choose>
                                 </xsl:if>
                             </xsl:attribute>
                         </xsl:if>
                         
                         
                         
                         <xsl:if test="@ParaInfo">
                            <xsl:attribute name="w:rsidR" select="$PN"/>
                        </xsl:if>
                         <xsl:if test="string-length($txtFrameId) &gt; 0">
                             <xsl:choose>
                                 <xsl:when test="starts-with($txtFrameId,'u')">
                                     <xsl:attribute name="txtFrameId" select="$txtFrameId"/>        
                                 </xsl:when>
                                 <xsl:otherwise>
                                     <xsl:attribute name="txtFrameId" select="concat('u',$txtFrameId)"/>
                                 </xsl:otherwise>
                             </xsl:choose>
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
                                                        <xsl:attribute name="w:val" select="replace($Na1,'\\','_')"/>
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
                            </xsl:element>
                            <xsl:apply-templates select="child::Properties/TabList" mode="tabs"/>
                            <!--List auto number restart-->
                            <xsl:copy-of select="$ListNRestart"/>
                            <xsl:if test="not(child::w:numPr) and @BulletsAndNumberingListType ='NoList'">
                                <xsl:element name="w:numPr">
                                    <xsl:element name="w:ilvl">
                                        <xsl:attribute name="w:val" select="'0'"/>
                                    </xsl:element>
                                    <xsl:element name="w:numId">
                                        <xsl:attribute name="w:val">
                                            <xsl:value-of select="0"/>
                                        </xsl:attribute>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:if>
                            <!--List auto number restart-->
                            
                            <xsl:if test="not(string-length(@ParaInfo) = 0)">
                          </xsl:if>
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
                        <xsl:choose>
                            <xsl:when test="(child::CharacterStyleRange/Table)">
                                    <xsl:variable name="id">
                                        <xsl:number level="any"/>
                                    </xsl:variable>
                                    <xsl:variable name="HUD" select="@ParaNumber"/>
                                <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                        <xsl:if test="not(string-length($HUD) =0)">
                                            <xsl:element name="w:bookmarkStart">
                                                <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                                <xsl:attribute name="w:id" select="$id"/>
                                                <xsl:attribute name="w:name" select="$HUD"/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:if>
                                <xsl:if test="child::Properties/RuleAboveColor">
                                    <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                    <xsl:variable name="id">
                                        <xsl:number level="any"/>
                                    </xsl:variable>
                                    <xsl:variable name="HUD">
                                        <xsl:choose>
                                            <xsl:when test="contains($NewBKmark,'_TX_')">
                                                <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                            </xsl:when>
                                            <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                                <xsl:value-of select="$NewBKmark"/>
                                            </xsl:when>
                                        </xsl:choose>
                                    </xsl:variable>
                                    <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                        <xsl:if test="not(string-length($HUD) =0)">
                                            <xsl:element name="w:bookmarkStart">
                                                <xsl:attribute name="w:id" select="$id"/>
                                                <xsl:attribute name="w:name" select="$HUD"/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:if>
                                </xsl:if>                                
                                <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                            </xsl:when>
                            <xsl:otherwise>
                                    <xsl:variable name="id">
                                        <xsl:number level="any"/>
                                    </xsl:variable>
                                    <xsl:variable name="HUD" select="@ParaNumber"/>
                                <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                        <xsl:if test="not(string-length($HUD) =0)">
                                            <xsl:element name="w:bookmarkStart">
                                                <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                                <xsl:attribute name="w:id" select="$id"/>
                                                <xsl:attribute name="w:name" select="$HUD"/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:if>
                                <xsl:if test="child::Properties/RuleAboveColor">
                                    <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                    <xsl:variable name="id">
                                        <xsl:number level="any"/>
                                    </xsl:variable>
                                    <xsl:variable name="HUD">
                                        <xsl:choose>
                                            <xsl:when test="contains($NewBKmark,'_TX_')">
                                                <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                            </xsl:when>
                                            <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                                <xsl:value-of select="$NewBKmark"/>
                                            </xsl:when>
                                        </xsl:choose>
                                    </xsl:variable>
                                    <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                        <xsl:if test="not(string-length($HUD) =0)">
                                            <xsl:element name="w:bookmarkStart">
                                                <xsl:attribute name="w:id" select="$id"/>
                                                <xsl:attribute name="w:name" select="$HUD"/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:if>
                                </xsl:if>                                
                                <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                            </xsl:otherwise>
                        </xsl:choose>
                        
                        <xsl:if test="(child::CharacterStyleRange/Table)">
                                <xsl:variable name="id">
                                    <xsl:number level="any"/>
                                </xsl:variable>
                                <xsl:variable name="HUD" select="@ParaNumber"/>
                            <xsl:if test="not(ancestor::Footnote|ancestor::Note)">
                                    <xsl:if test="not(string-length($HUD) =0)">
                                        <xsl:element name="w:bookmarkEnd">
                                            <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                            <xsl:attribute name="w:id" select="$id"/>
                                        </xsl:element>
                                    </xsl:if>
                                </xsl:if>
                            <xsl:if test="child::Properties/RuleAboveColor">
                                <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                <xsl:variable name="id">
                                    <xsl:number level="any"/>
                                </xsl:variable>
                                <xsl:variable name="HUD">
                                    <xsl:choose>
                                        <xsl:when test="contains($NewBKmark,'_TX_')">
                                            <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                        </xsl:when>
                                        <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                            <xsl:value-of select="$NewBKmark"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                    <xsl:if test="not(string-length($HUD) =0)">
                                        <xsl:element name="w:bookmarkEnd">
                                            <xsl:attribute name="w:id" select="$id"/>
                                        </xsl:element>
                                    </xsl:if>
                                </xsl:if>
                            </xsl:if>                                
                            <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                        </xsl:if>
                        <!-- Taken from inp.xslt END -->
                         <xsl:apply-templates/>
                         <!-- Taken from inp.xslt  -->
                         <xsl:choose>
                             <xsl:when test="(child::CharacterStyleRange/Table)"/>
                             <xsl:otherwise>
                                     <xsl:variable name="id">
                                         <xsl:number level="any"/>
                                     </xsl:variable>
                                     <xsl:variable name="HUD" select="@ParaNumber"/>
                                      <xsl:if test="not(ancestor::Footnote|ancestor::Note)">
                                         <xsl:if test="not(string-length($HUD) =0)">
                                             <xsl:element name="w:bookmarkEnd">
                                                 <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                                 <xsl:attribute name="w:id" select="$id"/>
                                             </xsl:element>
                                         </xsl:if>
                                     </xsl:if>
                                 <xsl:if test="child::Properties/RuleAboveColor">
                                     <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                     <xsl:variable name="id">
                                         <xsl:number level="any"/>
                                     </xsl:variable>
                                     <xsl:variable name="HUD">
                                         <xsl:choose>
                                             <xsl:when test="contains($NewBKmark,'_TX_')">
                                                 <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                             </xsl:when>
                                             <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                                 <xsl:value-of select="$NewBKmark"/>
                                             </xsl:when>
                                         </xsl:choose>
                                     </xsl:variable>
                                     <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                         <xsl:if test="not(string-length($HUD) =0)">
                                             <xsl:element name="w:bookmarkEnd">
                                                 <xsl:attribute name="w:id" select="$id"/>
                                             </xsl:element>
                                         </xsl:if>
                                     </xsl:if>
                                 </xsl:if>                                
                                 <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                             </xsl:otherwise>
                         </xsl:choose>
                         <xsl:if test="not(child::CharacterStyleRange/Table)">
                             
                         </xsl:if>
                         <!-- Taken from inp.xslt END -->
                     </xsl:element>
                 </xsl:when>
                 <xsl:when test="$curParaNumLvl = '6' or $listlvl = '6'">
                     <xsl:text>&#x000A;</xsl:text>
                     <xsl:element name="six">
                         <xsl:attribute name="class" select="translate($Na1, ' /\[\]@','_')"/>
                         <xsl:attribute name="data-name" select="$Na2"/>    
                         <!-- 24-JAN-19: For Mariappan -->
                         <xsl:attribute name="data-parentStory">
                             <!-- Commented on 06-FEB-19, now taken from IDMLs "ParentStory" attribute not from sree's bkmark -->
                             <!--<xsl:variable name="paraINFO" select="@ParaInfo"/>
                             <xsl:value-of select="concat('Story_',substring-before(substring-after($paraINFO,'_Story_'),'_'))"/>-->
                             <xsl:value-of select="@ParentStory"/>
                         </xsl:attribute>
                         <xsl:attribute name="listtype" select="$Na2"/>
                         <xsl:attribute name="numberFormat" select="$listnumformat"/>
                         <xsl:attribute name="numberType" select="$listtype"/>
                         <!-- Added for listtype on 8-12-2023 Azure 1552 -->
                         <!--<xsl:attribute name="start" select="$NumberingStartAt"/>-->
                         <xsl:attribute name="start">
                             <xsl:choose>
                                 <xsl:when test="string-length(@SelfNumberingStartAt) &gt;0">
                                     <xsl:value-of select="normalize-space(@SelfNumberingStartAt)"/>
                                 </xsl:when>
                                 <xsl:otherwise>
                                     <xsl:value-of select="$NumberingStartAt"/>
                                 </xsl:otherwise>
                             </xsl:choose>
                         </xsl:attribute>
                         <xsl:if test="@Justification | @FirstLineIndent | @LeftIndent | @RightIndent">
                             <xsl:attribute name="style">
                                 <xsl:if test="@Justification">  
                                     <xsl:choose>
                                         <xsl:when test="contains(@Justification, 'Center')">
                                             <xsl:value-of select="'text-align:center'"/>
                                         </xsl:when>
                                         <xsl:when test="contains(@Justification, 'Left')">
                                             <xsl:value-of select="'text-align:left'"/>
                                         </xsl:when>
                                         <xsl:when test="contains(@Justification, 'Right')">
                                             <xsl:value-of select="'text-align:right'"/>
                                         </xsl:when>
                                         <xsl:otherwise>
                                             <xsl:value-of select="'text-align:justify'"/>
                                         </xsl:otherwise>
                                     </xsl:choose>
                                 </xsl:if>                                
                                 <xsl:if test="@FirstLineIndent">
                                     <xsl:if test="@Justification">
                                         <xsl:text>;</xsl:text>  
                                     </xsl:if>
                                     <xsl:choose>
                                         <xsl:when test="@FirstLineIndent = '0'">
                                             <xsl:value-of select="'text-indent:0pt;'"/>
                                         </xsl:when>
                                         <xsl:otherwise>
                                             <xsl:if test="@FirstLineIndent &lt; 0">
                                                 <!--<xsl:text>padding-left:</xsl:text>-->
                                                 <xsl:text>text-indent:</xsl:text>
                                                 <xsl:value-of select="@FirstLineIndent div 2"/>
                                                 <xsl:text>pt</xsl:text>
                                             </xsl:if>
                                             <xsl:if test="@FirstLineIndent > 0">
                                                 <xsl:text>text-indent:</xsl:text>
                                                 <xsl:value-of select="@FirstLineIndent div 2"/>
                                                 <xsl:text>pt</xsl:text>
                                             </xsl:if>
                                             <!--<xsl:text>text-indent:</xsl:text>
                                            <xsl:value-of select="@FirstLineIndent"/>
                                            <xsl:text>pt</xsl:text>-->
                                         </xsl:otherwise>
                                     </xsl:choose>
                                 </xsl:if>
                                 <xsl:if test="@LeftIndent">
                                     <xsl:if test="@Justification | @FirstLineIndent">
                                         <xsl:text>;</xsl:text>  
                                     </xsl:if>
                                     <xsl:choose>
                                         <xsl:when test="@LeftIndent = '0'">
                                             <xsl:value-of select="'margin-left:0pt;'"/>
                                         </xsl:when>
                                         <xsl:otherwise>
                                             <xsl:text>margin-left:</xsl:text>
                                             <xsl:value-of select="@LeftIndent div 2"/>
                                             <xsl:text>pt</xsl:text>
                                         </xsl:otherwise>
                                     </xsl:choose>
                                 </xsl:if>
                                 <xsl:if test="@RightIndent">
                                     <xsl:if test="@Justification | @FirstLineIndent | @LeftIndent">
                                         <xsl:text>;</xsl:text>  
                                     </xsl:if>
                                     <xsl:choose>
                                         <xsl:when test="@RightIndent = '0'">
                                             <xsl:value-of select="'margin-right:0pt;'"/>
                                         </xsl:when>
                                         <xsl:otherwise>
                                             <xsl:text>margin-right:</xsl:text>
                                             <xsl:value-of select="@RightIndent div 2"/>
                                             <xsl:text>pt</xsl:text>
                                         </xsl:otherwise>
                                     </xsl:choose>
                                 </xsl:if>
                             </xsl:attribute>
                         </xsl:if>
                         
                         <!-- Taken from inp.xslt -->
                         <xsl:if test="@ParaInfo">
                            <xsl:attribute name="w:rsidR" select="$PN"/>
                        </xsl:if>
                         <xsl:if test="string-length($txtFrameId) &gt; 0">
                             <xsl:choose>
                                 <xsl:when test="starts-with($txtFrameId,'u')">
                                     <xsl:attribute name="txtFrameId" select="$txtFrameId"/>        
                                 </xsl:when>
                                 <xsl:otherwise>
                                     <xsl:attribute name="txtFrameId" select="concat('u',$txtFrameId)"/>
                                 </xsl:otherwise>
                             </xsl:choose>
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
                                                        <xsl:attribute name="w:val" select="replace($Na1,'\\','_')"/>
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
                            </xsl:element>
                            <xsl:apply-templates select="child::Properties/TabList" mode="tabs"/>
                            <!--List auto number restart-->
                            <xsl:copy-of select="$ListNRestart"/>
                            <xsl:if test="not(child::w:numPr) and @BulletsAndNumberingListType ='NoList'">
                                <xsl:element name="w:numPr">
                                    <xsl:element name="w:ilvl">
                                        <xsl:attribute name="w:val" select="'0'"/>
                                    </xsl:element>
                                    <xsl:element name="w:numId">
                                        <xsl:attribute name="w:val">
                                            <xsl:value-of select="0"/>
                                        </xsl:attribute>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:if>
                            <!--List auto number restart-->
                            
                            <xsl:if test="not(string-length(@ParaInfo) = 0)">
                          </xsl:if>
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
                        <xsl:choose>
                            <xsl:when test="(child::CharacterStyleRange/Table)">
                                    <xsl:variable name="id">
                                        <xsl:number level="any"/>
                                    </xsl:variable>
                                    <xsl:variable name="HUD" select="@ParaNumber"/>
                                <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                        <xsl:if test="not(string-length($HUD) =0)">
                                            <xsl:element name="w:bookmarkStart">
                                                <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                                <xsl:attribute name="w:id" select="$id"/>
                                                <xsl:attribute name="w:name" select="$HUD"/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:if>
                                <xsl:if test="child::Properties/RuleAboveColor">
                                    <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                    <xsl:variable name="id">
                                        <xsl:number level="any"/>
                                    </xsl:variable>
                                    <xsl:variable name="HUD">
                                        <xsl:choose>
                                            <xsl:when test="contains($NewBKmark,'_TX_')">
                                                <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                            </xsl:when>
                                            <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                                <xsl:value-of select="$NewBKmark"/>
                                            </xsl:when>
                                        </xsl:choose>
                                    </xsl:variable>
                                    <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                        <xsl:if test="not(string-length($HUD) =0)">
                                            <xsl:element name="w:bookmarkStart">
                                                <xsl:attribute name="w:id" select="$id"/>
                                                <xsl:attribute name="w:name" select="$HUD"/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:if>
                                </xsl:if>                                
                                <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                            </xsl:when>
                            <xsl:otherwise>
                                    <xsl:variable name="id">
                                        <xsl:number level="any"/>
                                    </xsl:variable>
                                    <xsl:variable name="HUD" select="@ParaNumber"/>
                                <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                        <xsl:if test="not(string-length($HUD) =0)">
                                            <xsl:element name="w:bookmarkStart">
                                                <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                                <xsl:attribute name="w:id" select="$id"/>
                                                <xsl:attribute name="w:name" select="$HUD"/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:if>
                                <xsl:if test="child::Properties/RuleAboveColor">
                                    <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                    <xsl:variable name="id">
                                        <xsl:number level="any"/>
                                    </xsl:variable>
                                    <xsl:variable name="HUD">
                                        <xsl:choose>
                                            <xsl:when test="contains($NewBKmark,'_TX_')">
                                                <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                            </xsl:when>
                                            <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                                <xsl:value-of select="$NewBKmark"/>
                                            </xsl:when>
                                        </xsl:choose>
                                    </xsl:variable>
                                    <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                        <xsl:if test="not(string-length($HUD) =0)">
                                            <xsl:element name="w:bookmarkStart">
                                                <xsl:attribute name="w:id" select="$id"/>
                                                <xsl:attribute name="w:name" select="$HUD"/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:if>
                                </xsl:if>                                
                                <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                            </xsl:otherwise>
                        </xsl:choose>
                        
                        <xsl:if test="(child::CharacterStyleRange/Table)">
                                <xsl:variable name="id">
                                    <xsl:number level="any"/>
                                </xsl:variable>
                                <xsl:variable name="HUD" select="@ParaNumber"/>
                                 <xsl:if test="not(ancestor::Footnote|ancestor::Note)">
                                    <xsl:if test="not(string-length($HUD) =0)">
                                        <xsl:element name="w:bookmarkEnd">
                                            <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                            <xsl:attribute name="w:id" select="$id"/>
                                        </xsl:element>
                                    </xsl:if>
                                </xsl:if>
                            <xsl:if test="child::Properties/RuleAboveColor">
                                <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                <xsl:variable name="id">
                                    <xsl:number level="any"/>
                                </xsl:variable>
                                <xsl:variable name="HUD">
                                    <xsl:choose>
                                        <xsl:when test="contains($NewBKmark,'_TX_')">
                                            <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                        </xsl:when>
                                        <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                            <xsl:value-of select="$NewBKmark"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                    <xsl:if test="not(string-length($HUD) =0)">
                                        <xsl:element name="w:bookmarkEnd">
                                            <xsl:attribute name="w:id" select="$id"/>
                                        </xsl:element>
                                    </xsl:if>
                                </xsl:if>
                            </xsl:if>                                
                            <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                        </xsl:if>
                        <!-- Taken from inp.xslt END -->
                         <xsl:apply-templates/>
                         <!-- Taken from inp.xslt  -->
                         <xsl:choose>
                             <xsl:when test="(child::CharacterStyleRange/Table)"/>
                             <xsl:otherwise>
                                     <xsl:variable name="id">
                                         <xsl:number level="any"/>
                                     </xsl:variable>
                                     <xsl:variable name="HUD" select="@ParaNumber"/>
                                      <xsl:if test="not(ancestor::Footnote|ancestor::Note)">
                                         <xsl:if test="not(string-length($HUD) =0)">
                                             <xsl:element name="w:bookmarkEnd">
                                                 <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                                 <xsl:attribute name="w:id" select="$id"/>
                                             </xsl:element>
                                         </xsl:if>
                                     </xsl:if>
                                 <xsl:if test="child::Properties/RuleAboveColor">
                                     <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                     <xsl:variable name="id">
                                         <xsl:number level="any"/>
                                     </xsl:variable>
                                     <xsl:variable name="HUD">
                                         <xsl:choose>
                                             <xsl:when test="contains($NewBKmark,'_TX_')">
                                                 <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                             </xsl:when>
                                             <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                                 <xsl:value-of select="$NewBKmark"/>
                                             </xsl:when>
                                         </xsl:choose>
                                     </xsl:variable>
                                     <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                         <xsl:if test="not(string-length($HUD) =0)">
                                             <xsl:element name="w:bookmarkEnd">
                                                 <xsl:attribute name="w:id" select="$id"/>
                                             </xsl:element>
                                         </xsl:if>
                                     </xsl:if>
                                 </xsl:if>                                
                                 <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                             </xsl:otherwise>
                         </xsl:choose>
                         <xsl:if test="not(child::CharacterStyleRange/Table)">
                             
                         </xsl:if>
                         <!-- Taken from inp.xslt END -->
                     </xsl:element>
                 </xsl:when>
                 <xsl:when test="$curParaNumLvl = '7' or $listlvl = '7'">
                     <xsl:text>&#x000A;</xsl:text>
                     <xsl:element name="seven">
                         <xsl:attribute name="class" select="translate($Na1, ' /\[\]@','_')"/>
                         <xsl:attribute name="data-name" select="$Na2"/> 
                         <!-- 24-JAN-19: For Mariappan -->
                         <xsl:attribute name="data-parentStory">
                             <!-- Commented on 06-FEB-19, now taken from IDMLs "ParentStory" attribute not from sree's bkmark -->
                             <!--<xsl:variable name="paraINFO" select="@ParaInfo"/>
                             <xsl:value-of select="concat('Story_',substring-before(substring-after($paraINFO,'_Story_'),'_'))"/>-->
                             <xsl:value-of select="@ParentStory"/>
                         </xsl:attribute>
                         <xsl:attribute name="listtype" select="$Na2"/>
                         <xsl:attribute name="numberFormat" select="$listnumformat"/>
                         <xsl:attribute name="numberType" select="$listtype"/>
                         <!-- Added for listtype on 8-12-2023 Azure 1552 -->
                         <!--<xsl:attribute name="start" select="$NumberingStartAt"/>-->
                         <xsl:attribute name="start">
                             <xsl:choose>
                                 <xsl:when test="string-length(@SelfNumberingStartAt) &gt;0">
                                     <xsl:value-of select="normalize-space(@SelfNumberingStartAt)"/>
                                 </xsl:when>
                                 <xsl:otherwise>
                                     <xsl:value-of select="$NumberingStartAt"/>
                                 </xsl:otherwise>
                             </xsl:choose>
                         </xsl:attribute>
                                                  
                         <xsl:if test="@Justification | @FirstLineIndent | @LeftIndent | @RightIndent">
                             <xsl:attribute name="style">
                                 <xsl:if test="@Justification">  
                                     <xsl:choose>
                                         <xsl:when test="contains(@Justification, 'Center')">
                                             <xsl:value-of select="'text-align:center'"/>
                                         </xsl:when>
                                         <xsl:when test="contains(@Justification, 'Left')">
                                             <xsl:value-of select="'text-align:left'"/>
                                         </xsl:when>
                                         <xsl:when test="contains(@Justification, 'Right')">
                                             <xsl:value-of select="'text-align:right'"/>
                                         </xsl:when>
                                         <xsl:otherwise>
                                             <xsl:value-of select="'text-align:justify'"/>
                                         </xsl:otherwise>
                                     </xsl:choose>
                                 </xsl:if>                                
                                 <xsl:if test="@FirstLineIndent">
                                     <xsl:if test="@Justification">
                                         <xsl:text>;</xsl:text>  
                                     </xsl:if>
                                     <xsl:choose>
                                         <xsl:when test="@FirstLineIndent = '0'">
                                             <xsl:value-of select="'text-indent:0pt;'"/>
                                         </xsl:when>
                                         <xsl:otherwise>
                                             <xsl:if test="@FirstLineIndent &lt; 0">
                                                 <!--<xsl:text>padding-left:</xsl:text>-->
                                                 <xsl:text>text-indent:</xsl:text>
                                                 <xsl:value-of select="@FirstLineIndent div 2"/>
                                                 <xsl:text>pt</xsl:text>
                                             </xsl:if>
                                             <xsl:if test="@FirstLineIndent > 0">
                                                 <xsl:text>text-indent:</xsl:text>
                                                 <xsl:value-of select="@FirstLineIndent div 2"/>
                                                 <xsl:text>pt</xsl:text>
                                             </xsl:if>
                                             <!--<xsl:text>text-indent:</xsl:text>
                                            <xsl:value-of select="@FirstLineIndent"/>
                                            <xsl:text>pt</xsl:text>-->
                                         </xsl:otherwise>
                                     </xsl:choose>
                                 </xsl:if>
                                 <xsl:if test="@LeftIndent">
                                     <xsl:if test="@Justification | @FirstLineIndent">
                                         <xsl:text>;</xsl:text>  
                                     </xsl:if>
                                     <xsl:choose>
                                         <xsl:when test="@LeftIndent = '0'">
                                             <xsl:value-of select="'margin-left:0pt;'"/>
                                         </xsl:when>
                                         <xsl:otherwise>
                                             <xsl:text>margin-left:</xsl:text>
                                             <xsl:value-of select="@LeftIndent div 2"/>
                                             <xsl:text>pt</xsl:text>
                                         </xsl:otherwise>
                                     </xsl:choose>
                                 </xsl:if>
                                 <xsl:if test="@RightIndent">
                                     <xsl:if test="@Justification | @FirstLineIndent | @LeftIndent">
                                         <xsl:text>;</xsl:text>  
                                     </xsl:if>
                                     <xsl:choose>
                                         <xsl:when test="@RightIndent = '0'">
                                             <xsl:value-of select="'margin-right:0pt;'"/>
                                         </xsl:when>
                                         <xsl:otherwise>
                                             <xsl:text>margin-right:</xsl:text>
                                             <xsl:value-of select="@RightIndent div 2"/>
                                             <xsl:text>pt</xsl:text>
                                         </xsl:otherwise>
                                     </xsl:choose>
                                 </xsl:if>
                             </xsl:attribute>
                         </xsl:if>
                         
                         <!--<xsl:apply-templates select="descendant::Content"/>-->
                         <!-- Taken from inp.xslt -->
                         <xsl:if test="@ParaInfo">
                            <xsl:attribute name="w:rsidR" select="$PN"/>
                        </xsl:if>
                         <xsl:if test="string-length($txtFrameId) &gt; 0">
                             <xsl:choose>
                                 <xsl:when test="starts-with($txtFrameId,'u')">
                                     <xsl:attribute name="txtFrameId" select="$txtFrameId"/>        
                                 </xsl:when>
                                 <xsl:otherwise>
                                     <xsl:attribute name="txtFrameId" select="concat('u',$txtFrameId)"/>
                                 </xsl:otherwise>
                             </xsl:choose>
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
                                                        <xsl:attribute name="w:val" select="replace($Na1,'\\','_')"/>
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
                            </xsl:element>
                            <xsl:apply-templates select="child::Properties/TabList" mode="tabs"/>
                            <!--List auto number restart-->
                            <xsl:copy-of select="$ListNRestart"/>
                            <xsl:if test="not(child::w:numPr) and @BulletsAndNumberingListType ='NoList'">
                                <xsl:element name="w:numPr">
                                    <xsl:element name="w:ilvl">
                                        <xsl:attribute name="w:val" select="'0'"/>
                                    </xsl:element>
                                    <xsl:element name="w:numId">
                                        <xsl:attribute name="w:val">
                                            <xsl:value-of select="0"/>
                                        </xsl:attribute>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:if>
                            <!--List auto number restart-->
                            
                            <xsl:if test="not(string-length(@ParaInfo) = 0)">
                          </xsl:if>
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
                        <xsl:choose>
                            <xsl:when test="(child::CharacterStyleRange/Table)">                                
                                    <xsl:variable name="id">
                                        <xsl:number level="any"/>
                                    </xsl:variable>
                                    <xsl:variable name="HUD" select="@ParaNumber"/>
                                <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                        <xsl:if test="not(string-length($HUD) =0)">
                                            <xsl:element name="w:bookmarkStart">
                                                <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                                <xsl:attribute name="w:id" select="$id"/>
                                                <xsl:attribute name="w:name" select="$HUD"/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:if>
                                <xsl:if test="child::Properties/RuleAboveColor">
                                    <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                    <xsl:variable name="id">
                                        <xsl:number level="any"/>
                                    </xsl:variable>
                                    <xsl:variable name="HUD">
                                        <xsl:choose>
                                            <xsl:when test="contains($NewBKmark,'_TX_')">
                                                <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                            </xsl:when>
                                            <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                                <xsl:value-of select="$NewBKmark"/>
                                            </xsl:when>
                                        </xsl:choose>
                                    </xsl:variable>
                                    <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                        <xsl:if test="not(string-length($HUD) =0)">
                                            <xsl:element name="w:bookmarkStart">
                                                <xsl:attribute name="w:id" select="$id"/>
                                                <xsl:attribute name="w:name" select="$HUD"/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:if>
                                </xsl:if>                                
                                <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                            </xsl:when>
                            <xsl:otherwise>
                                    <xsl:variable name="id">
                                        <xsl:number level="any"/>
                                    </xsl:variable>
                                    <xsl:variable name="HUD" select="@ParaNumber"/>
                                <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                        <xsl:if test="not(string-length($HUD) =0)">
                                            <xsl:element name="w:bookmarkStart">
                                                <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                                <xsl:attribute name="w:id" select="$id"/>
                                                <xsl:attribute name="w:name" select="$HUD"/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:if>
                                <xsl:if test="child::Properties/RuleAboveColor">
                                    <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                    <xsl:variable name="id">
                                        <xsl:number level="any"/>
                                    </xsl:variable>
                                    <xsl:variable name="HUD">
                                        <xsl:choose>
                                            <xsl:when test="contains($NewBKmark,'_TX_')">
                                                <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                            </xsl:when>
                                            <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                                <xsl:value-of select="$NewBKmark"/>
                                            </xsl:when>
                                        </xsl:choose>
                                    </xsl:variable>
                                    <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                        <xsl:if test="not(string-length($HUD) =0)">
                                            <xsl:element name="w:bookmarkStart">
                                                <xsl:attribute name="w:id" select="$id"/>
                                                <xsl:attribute name="w:name" select="$HUD"/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:if>
                                </xsl:if>                                
                                <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                            </xsl:otherwise>
                        </xsl:choose>
                        
                        <xsl:if test="(child::CharacterStyleRange/Table)">
                                <xsl:variable name="id">
                                    <xsl:number level="any"/>
                                </xsl:variable>
                                <xsl:variable name="HUD" select="@ParaNumber"/>
                                 <xsl:if test="not(ancestor::Footnote|ancestor::Note)">
                                    <xsl:if test="not(string-length($HUD) =0)">
                                        <xsl:element name="w:bookmarkEnd">
                                            <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                            <xsl:attribute name="w:id" select="$id"/>
                                        </xsl:element>
                                    </xsl:if>
                                </xsl:if>
                            <xsl:if test="child::Properties/RuleAboveColor">
                                <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                <xsl:variable name="id">
                                    <xsl:number level="any"/>
                                </xsl:variable>
                                <xsl:variable name="HUD">
                                    <xsl:choose>
                                        <xsl:when test="contains($NewBKmark,'_TX_')">
                                            <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                        </xsl:when>
                                        <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                            <xsl:value-of select="$NewBKmark"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                    <xsl:if test="not(string-length($HUD) =0)">
                                        <xsl:element name="w:bookmarkEnd">
                                            <xsl:attribute name="w:id" select="$id"/>
                                        </xsl:element>
                                    </xsl:if>
                                </xsl:if>
                            </xsl:if>                                
                            <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                        </xsl:if>
                        <!-- Taken from inp.xslt END -->
                         <xsl:apply-templates/>
                         <!-- Taken from inp.xslt  -->
                         <xsl:choose>
                             <xsl:when test="(child::CharacterStyleRange/Table)"/>
                             <xsl:otherwise>
                                     <xsl:variable name="id">
                                         <xsl:number level="any"/>
                                     </xsl:variable>
                                     <xsl:variable name="HUD" select="@ParaNumber"/>
                                 <xsl:if test="not(ancestor::Footnote|ancestor::Note)">
                                         <xsl:if test="not(string-length($HUD) =0)">
                                             <xsl:element name="w:bookmarkEnd">
                                                 <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                                 <xsl:attribute name="w:id" select="$id"/>
                                             </xsl:element>
                                         </xsl:if>
                                     </xsl:if>
                                 <xsl:if test="child::Properties/RuleAboveColor">
                                     <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                     <xsl:variable name="id">
                                         <xsl:number level="any"/>
                                     </xsl:variable>
                                     <xsl:variable name="HUD">
                                         <xsl:choose>
                                             <xsl:when test="contains($NewBKmark,'_TX_')">
                                                 <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                             </xsl:when>
                                             <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                                 <xsl:value-of select="$NewBKmark"/>
                                             </xsl:when>
                                         </xsl:choose>
                                     </xsl:variable>
                                     <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                         <xsl:if test="not(string-length($HUD) =0)">
                                             <xsl:element name="w:bookmarkEnd">
                                                 <xsl:attribute name="w:id" select="$id"/>
                                             </xsl:element>
                                         </xsl:if>
                                     </xsl:if>
                                 </xsl:if>                                
                                 <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                             </xsl:otherwise>
                         </xsl:choose>
                         <xsl:if test="not(child::CharacterStyleRange/Table)">
                             
                         </xsl:if>
                         <!-- Taken from inp.xslt END -->
                     </xsl:element>
                 </xsl:when>
                 <xsl:when test="$curParaNumLvl = '8' or $listlvl = '8'">
                     <xsl:text>&#x000A;</xsl:text>
                     <xsl:element name="eight">
                         <xsl:attribute name="class" select="translate($Na1, ' /\[\]@','_')"/>
                         <xsl:attribute name="data-name" select="$Na2"/>   
                         <!-- 24-JAN-19: For Mariappan -->
                         <xsl:attribute name="data-parentStory">
                             <!-- Commented on 06-FEB-19, now taken from IDMLs "ParentStory" attribute not from sree's bkmark -->
                             <!--<xsl:variable name="paraINFO" select="@ParaInfo"/>
                             <xsl:value-of select="concat('Story_',substring-before(substring-after($paraINFO,'_Story_'),'_'))"/>-->
                             <xsl:value-of select="@ParentStory"/>
                         </xsl:attribute>
                         <xsl:attribute name="listtype" select="$Na2"/>
                         <xsl:attribute name="numberFormat" select="$listnumformat"/>
                         <xsl:attribute name="numberType" select="$listtype"/>
                         <!-- Added for listtype on 8-12-2023 Azure 1552 -->
                         <!--<xsl:attribute name="start" select="$NumberingStartAt"/>-->
                         <xsl:attribute name="start">
                             <xsl:choose>
                                 <xsl:when test="string-length(@SelfNumberingStartAt) &gt;0">
                                     <xsl:value-of select="normalize-space(@SelfNumberingStartAt)"/>
                                 </xsl:when>
                                 <xsl:otherwise>
                                     <xsl:value-of select="$NumberingStartAt"/>
                                 </xsl:otherwise>
                             </xsl:choose>
                         </xsl:attribute>
                                                  
                         <xsl:if test="@Justification | @FirstLineIndent | @LeftIndent | @RightIndent">
                             <xsl:attribute name="style">
                                 <xsl:if test="@Justification">  
                                     <xsl:choose>
                                         <xsl:when test="contains(@Justification, 'Center')">
                                             <xsl:value-of select="'text-align:center'"/>
                                         </xsl:when>
                                         <xsl:when test="contains(@Justification, 'Left')">
                                             <xsl:value-of select="'text-align:left'"/>
                                         </xsl:when>
                                         <xsl:when test="contains(@Justification, 'Right')">
                                             <xsl:value-of select="'text-align:right'"/>
                                         </xsl:when>
                                         <xsl:otherwise>
                                             <xsl:value-of select="'text-align:justify'"/>
                                         </xsl:otherwise>
                                     </xsl:choose>
                                 </xsl:if>                                
                                 <xsl:if test="@FirstLineIndent">
                                     <xsl:if test="@Justification">
                                         <xsl:text>;</xsl:text>  
                                     </xsl:if>
                                     <xsl:choose>
                                         <xsl:when test="@FirstLineIndent = '0'">
                                             <xsl:value-of select="'text-indent:0pt;'"/>
                                         </xsl:when>
                                         <xsl:otherwise>
                                             <xsl:if test="@FirstLineIndent &lt; 0">
                                                 <!--<xsl:text>padding-left:</xsl:text>-->
                                                 <xsl:text>text-indent:</xsl:text>
                                                 <xsl:value-of select="@FirstLineIndent div 2"/>
                                                 <xsl:text>pt</xsl:text>
                                             </xsl:if>
                                             <xsl:if test="@FirstLineIndent > 0">
                                                 <xsl:text>text-indent:</xsl:text>
                                                 <xsl:value-of select="@FirstLineIndent div 2"/>
                                                 <xsl:text>pt</xsl:text>
                                             </xsl:if>
                                             <!--<xsl:text>text-indent:</xsl:text>
                                            <xsl:value-of select="@FirstLineIndent"/>
                                            <xsl:text>pt</xsl:text>-->
                                         </xsl:otherwise>
                                     </xsl:choose>
                                 </xsl:if>
                                 <xsl:if test="@LeftIndent">
                                     <xsl:if test="@Justification | @FirstLineIndent">
                                         <xsl:text>;</xsl:text>  
                                     </xsl:if>
                                     <xsl:choose>
                                         <xsl:when test="@LeftIndent = '0'">
                                             <xsl:value-of select="'margin-left:0pt;'"/>
                                         </xsl:when>
                                         <xsl:otherwise>
                                             <xsl:text>margin-left:</xsl:text>
                                             <xsl:value-of select="@LeftIndent div 2"/>
                                             <xsl:text>pt</xsl:text>
                                         </xsl:otherwise>
                                     </xsl:choose>
                                 </xsl:if>
                                 <xsl:if test="@RightIndent">
                                     <xsl:if test="@Justification | @FirstLineIndent | @LeftIndent">
                                         <xsl:text>;</xsl:text>  
                                     </xsl:if>
                                     <xsl:choose>
                                         <xsl:when test="@RightIndent = '0'">
                                             <xsl:value-of select="'margin-right:0pt;'"/>
                                         </xsl:when>
                                         <xsl:otherwise>
                                             <xsl:text>margin-right:</xsl:text>
                                             <xsl:value-of select="@RightIndent div 2"/>
                                             <xsl:text>pt</xsl:text>
                                         </xsl:otherwise>
                                     </xsl:choose>
                                 </xsl:if>
                             </xsl:attribute>
                         </xsl:if>
                         
                         <!-- Taken from inp.xslt -->
                         <xsl:if test="@ParaInfo">
                            <xsl:attribute name="w:rsidR" select="$PN"/>
                        </xsl:if>
                         <xsl:if test="string-length($txtFrameId) &gt; 0">
                             <xsl:choose>
                                 <xsl:when test="starts-with($txtFrameId,'u')">
                                     <xsl:attribute name="txtFrameId" select="$txtFrameId"/>        
                                 </xsl:when>
                                 <xsl:otherwise>
                                     <xsl:attribute name="txtFrameId" select="concat('u',$txtFrameId)"/>
                                 </xsl:otherwise>
                             </xsl:choose>
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
                                                        <xsl:attribute name="w:val" select="replace($Na1,'\\','_')"/>
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
                            </xsl:element>
                            <xsl:apply-templates select="child::Properties/TabList" mode="tabs"/>
                            <!--List auto number restart-->
                            <xsl:copy-of select="$ListNRestart"/>
                            <xsl:if test="not(child::w:numPr) and @BulletsAndNumberingListType ='NoList'">
                                <xsl:element name="w:numPr">
                                    <xsl:element name="w:ilvl">
                                        <xsl:attribute name="w:val" select="'0'"/>
                                    </xsl:element>
                                    <xsl:element name="w:numId">
                                        <xsl:attribute name="w:val">
                                            <xsl:value-of select="0"/>
                                        </xsl:attribute>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:if>
                            <!--List auto number restart-->
                            
                            <xsl:if test="not(string-length(@ParaInfo) = 0)">
                          </xsl:if>
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
                        <xsl:choose>
                            <xsl:when test="(child::CharacterStyleRange/Table)">
                                
                                    <xsl:variable name="id">
                                        <xsl:number level="any"/>
                                    </xsl:variable>
                                    <xsl:variable name="HUD" select="@ParaNumber"/>
                                <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                        <xsl:if test="not(string-length($HUD) =0)">
                                            <xsl:element name="w:bookmarkStart">
                                                <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                                <xsl:attribute name="w:id" select="$id"/>
                                                <xsl:attribute name="w:name" select="$HUD"/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:if>
                                <xsl:if test="child::Properties/RuleAboveColor">
                                    <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                    <xsl:variable name="id">
                                        <xsl:number level="any"/>
                                    </xsl:variable>
                                    <xsl:variable name="HUD">
                                        <xsl:choose>
                                            <xsl:when test="contains($NewBKmark,'_TX_')">
                                                <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                            </xsl:when>
                                            <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                                <xsl:value-of select="$NewBKmark"/>
                                            </xsl:when>
                                        </xsl:choose>
                                    </xsl:variable>
                                    <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                        <xsl:if test="not(string-length($HUD) =0)">
                                            <xsl:element name="w:bookmarkStart">
                                                <xsl:attribute name="w:id" select="$id"/>
                                                <xsl:attribute name="w:name" select="$HUD"/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:if>
                                </xsl:if>                                
                                <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                            </xsl:when>
                            <xsl:otherwise>
                                    <xsl:variable name="id">
                                        <xsl:number level="any"/>
                                    </xsl:variable>
                                    <xsl:variable name="HUD" select="@ParaNumber"/>
                                <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                        <xsl:if test="not(string-length($HUD) =0)">
                                            <xsl:element name="w:bookmarkStart">
                                                <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                                <xsl:attribute name="w:id" select="$id"/>
                                                <xsl:attribute name="w:name" select="$HUD"/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:if>
                                <xsl:if test="child::Properties/RuleAboveColor">
                                    <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                    <xsl:variable name="id">
                                        <xsl:number level="any"/>
                                    </xsl:variable>
                                    <xsl:variable name="HUD">
                                        <xsl:choose>
                                            <xsl:when test="contains($NewBKmark,'_TX_')">
                                                <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                            </xsl:when>
                                            <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                                <xsl:value-of select="$NewBKmark"/>
                                            </xsl:when>
                                        </xsl:choose>
                                    </xsl:variable>
                                    <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                        <xsl:if test="not(string-length($HUD) =0)">
                                            <xsl:element name="w:bookmarkStart">
                                                <xsl:attribute name="w:id" select="$id"/>
                                                <xsl:attribute name="w:name" select="$HUD"/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:if>
                                </xsl:if>                                
                                <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                            </xsl:otherwise>
                        </xsl:choose>
                        
                        <xsl:if test="(child::CharacterStyleRange/Table)">
                            <!-- Bookmark end new 21.8.2015 concept -->
                            
                                <xsl:variable name="id">
                                    <xsl:number level="any"/>
                                </xsl:variable>
                                <xsl:variable name="HUD" select="@ParaNumber"/>
                            <xsl:if test="not(ancestor::Footnote|ancestor::Note)">
                                    <xsl:if test="not(string-length($HUD) =0)">
                                        <xsl:element name="w:bookmarkEnd">
                                            <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                            <xsl:attribute name="w:id" select="$id"/>
                                        </xsl:element>
                                    </xsl:if>
                                </xsl:if>
                            <xsl:if test="child::Properties/RuleAboveColor">
                                <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                <xsl:variable name="id">
                                    <xsl:number level="any"/>
                                </xsl:variable>
                                <xsl:variable name="HUD">
                                    <xsl:choose>
                                        <xsl:when test="contains($NewBKmark,'_TX_')">
                                            <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                        </xsl:when>
                                        <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                            <xsl:value-of select="$NewBKmark"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                    <xsl:if test="not(string-length($HUD) =0)">
                                        <xsl:element name="w:bookmarkEnd">
                                            <xsl:attribute name="w:id" select="$id"/>
                                        </xsl:element>
                                    </xsl:if>
                                </xsl:if>
                            </xsl:if>                                
                            <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                        </xsl:if>
                        <!-- Taken from inp.xslt END -->
                         <xsl:apply-templates/>
                         <!-- Taken from inp.xslt  -->
                         <xsl:choose>
                             <xsl:when test="(child::CharacterStyleRange/Table)"/>
                             <xsl:otherwise>
                                 <!-- Bookmark end new 21.8.2015 concept -->
                                 
                                     <xsl:variable name="id">
                                         <xsl:number level="any"/>
                                     </xsl:variable>
                                     <xsl:variable name="HUD" select="@ParaNumber"/>
                                 <xsl:if test="not(ancestor::Footnote|ancestor::Note)">
                                         <xsl:if test="not(string-length($HUD) =0)">
                                             <xsl:element name="w:bookmarkEnd">
                                                 <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                                 <xsl:attribute name="w:id" select="$id"/>
                                             </xsl:element>
                                         </xsl:if>
                                     </xsl:if>
                                 <xsl:if test="child::Properties/RuleAboveColor">
                                     <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                     <xsl:variable name="id">
                                         <xsl:number level="any"/>
                                     </xsl:variable>
                                     <xsl:variable name="HUD">
                                         <xsl:choose>
                                             <xsl:when test="contains($NewBKmark,'_TX_')">
                                                 <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                             </xsl:when>
                                             <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                                 <xsl:value-of select="$NewBKmark"/>
                                             </xsl:when>
                                         </xsl:choose>
                                     </xsl:variable>
                                     <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                         <xsl:if test="not(string-length($HUD) =0)">
                                             <xsl:element name="w:bookmarkEnd">
                                                 <xsl:attribute name="w:id" select="$id"/>
                                             </xsl:element>
                                         </xsl:if>
                                     </xsl:if>
                                 </xsl:if>                                
                                 <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                             </xsl:otherwise>
                         </xsl:choose>
                         <xsl:if test="not(child::CharacterStyleRange/Table)">
                             
                         </xsl:if>
                         <!-- Taken from inp.xslt END -->
                     </xsl:element>
                 </xsl:when>
                 <xsl:when test="$curParaNumLvl = '9' or $listlvl = '9'">
                     <xsl:text>&#x000A;</xsl:text>
                     <xsl:element name="nine">
                         <xsl:attribute name="class" select="translate($Na1, ' /\[\]@','_')"/>
                         <xsl:attribute name="data-name" select="$Na2"/>   
                         <!-- 24-JAN-19: For Mariappan -->
                         <xsl:attribute name="data-parentStory">
                             <!-- Commented on 06-FEB-19, now taken from IDMLs "ParentStory" attribute not from sree's bkmark -->
                             <!--<xsl:variable name="paraINFO" select="@ParaInfo"/>
                             <xsl:value-of select="concat('Story_',substring-before(substring-after($paraINFO,'_Story_'),'_'))"/>-->
                             <xsl:value-of select="@ParentStory"/>
                         </xsl:attribute>
                         <xsl:attribute name="listtype" select="$Na2"/>
                         <xsl:attribute name="numberFormat" select="$listnumformat"/>
                         <xsl:attribute name="numberType" select="$listtype"/>
                         <!-- Added for listtype on 8-12-2023 Azure 1552 -->
                         <!--<xsl:attribute name="start" select="$NumberingStartAt"/>-->
                         <xsl:attribute name="start">
                             <xsl:choose>
                                 <xsl:when test="string-length(@SelfNumberingStartAt) &gt;0">
                                     <xsl:value-of select="normalize-space(@SelfNumberingStartAt)"/>
                                 </xsl:when>
                                 <xsl:otherwise>
                                     <xsl:value-of select="$NumberingStartAt"/>
                                 </xsl:otherwise>
                             </xsl:choose>
                         </xsl:attribute>
                                                  
                         <xsl:if test="@Justification | @FirstLineIndent | @LeftIndent | @RightIndent">
                             <xsl:attribute name="style">
                                 <xsl:if test="@Justification">  
                                     <xsl:choose>
                                         <xsl:when test="contains(@Justification, 'Center')">
                                             <xsl:value-of select="'text-align:center'"/>
                                         </xsl:when>
                                         <xsl:when test="contains(@Justification, 'Left')">
                                             <xsl:value-of select="'text-align:left'"/>
                                         </xsl:when>
                                         <xsl:when test="contains(@Justification, 'Right')">
                                             <xsl:value-of select="'text-align:right'"/>
                                         </xsl:when>
                                         <xsl:otherwise>
                                             <xsl:value-of select="'text-align:justify'"/>
                                         </xsl:otherwise>
                                     </xsl:choose>
                                 </xsl:if>                                
                                 <xsl:if test="@FirstLineIndent">
                                     <xsl:if test="@Justification">
                                         <xsl:text>;</xsl:text>  
                                     </xsl:if>
                                     <xsl:choose>
                                         <xsl:when test="@FirstLineIndent = '0'">
                                             <xsl:value-of select="'text-indent:0pt;'"/>
                                         </xsl:when>
                                         <xsl:otherwise>
                                             <xsl:if test="@FirstLineIndent &lt; 0">
                                                 <!--<xsl:text>padding-left:</xsl:text>-->
                                                 <xsl:text>text-indent:</xsl:text>
                                                 <xsl:value-of select="@FirstLineIndent div 2"/>
                                                 <xsl:text>pt</xsl:text>
                                             </xsl:if>
                                             <xsl:if test="@FirstLineIndent > 0">
                                                 <xsl:text>text-indent:</xsl:text>
                                                 <xsl:value-of select="@FirstLineIndent div 2"/>
                                                 <xsl:text>pt</xsl:text>
                                             </xsl:if>
                                             <!--<xsl:text>text-indent:</xsl:text>
                                            <xsl:value-of select="@FirstLineIndent"/>
                                            <xsl:text>pt</xsl:text>-->
                                         </xsl:otherwise>
                                     </xsl:choose>
                                 </xsl:if>
                                 <xsl:if test="@LeftIndent">
                                     <xsl:if test="@Justification | @FirstLineIndent">
                                         <xsl:text>;</xsl:text>  
                                     </xsl:if>
                                     <xsl:choose>
                                         <xsl:when test="@LeftIndent = '0'">
                                             <xsl:value-of select="'margin-left:0pt;'"/>
                                         </xsl:when>
                                         <xsl:otherwise>
                                             <xsl:text>margin-left:</xsl:text>
                                             <xsl:value-of select="@LeftIndent div 2"/>
                                             <xsl:text>pt</xsl:text>
                                         </xsl:otherwise>
                                     </xsl:choose>
                                 </xsl:if>
                                 <xsl:if test="@RightIndent">
                                     <xsl:if test="@Justification | @FirstLineIndent | @LeftIndent">
                                         <xsl:text>;</xsl:text>  
                                     </xsl:if>
                                     <xsl:choose>
                                         <xsl:when test="@RightIndent = '0'">
                                             <xsl:value-of select="'margin-right:0pt;'"/>
                                         </xsl:when>
                                         <xsl:otherwise>
                                             <xsl:text>margin-right:</xsl:text>
                                             <xsl:value-of select="@RightIndent div 2"/>
                                             <xsl:text>pt</xsl:text>
                                         </xsl:otherwise>
                                     </xsl:choose>
                                 </xsl:if>
                             </xsl:attribute>
                         </xsl:if>
                         
                         <!-- Taken from inp.xslt -->
                         <xsl:if test="@ParaInfo">
                            <xsl:attribute name="w:rsidR" select="$PN"/>
                        </xsl:if>
                         <xsl:if test="string-length($txtFrameId) &gt; 0">
                             <xsl:choose>
                                 <xsl:when test="starts-with($txtFrameId,'u')">
                                     <xsl:attribute name="txtFrameId" select="$txtFrameId"/>        
                                 </xsl:when>
                                 <xsl:otherwise>
                                     <xsl:attribute name="txtFrameId" select="concat('u',$txtFrameId)"/>
                                 </xsl:otherwise>
                             </xsl:choose>
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
                                                        <xsl:attribute name="w:val" select="replace($Na1,'\\','_')"/>
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
                            </xsl:element>
                            <xsl:apply-templates select="child::Properties/TabList" mode="tabs"/>
                            <!--List auto number restart-->
                            <xsl:copy-of select="$ListNRestart"/>
                            <xsl:if test="not(child::w:numPr) and @BulletsAndNumberingListType ='NoList'">
                                <xsl:element name="w:numPr">
                                    <xsl:element name="w:ilvl">
                                        <xsl:attribute name="w:val" select="'0'"/>
                                    </xsl:element>
                                    <xsl:element name="w:numId">
                                        <xsl:attribute name="w:val">
                                            <xsl:value-of select="0"/>
                                        </xsl:attribute>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:if>
                            <!--List auto number restart-->
                            
                            <xsl:if test="not(string-length(@ParaInfo) = 0)">
                          </xsl:if>
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
                        <xsl:choose>
                            <xsl:when test="(child::CharacterStyleRange/Table)">
                                    <xsl:variable name="id">
                                        <xsl:number level="any"/>
                                    </xsl:variable>
                                    <xsl:variable name="HUD" select="@ParaNumber"/>
                                <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                        <xsl:if test="not(string-length($HUD) =0)">
                                            <xsl:element name="w:bookmarkStart">
                                                <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                                <xsl:attribute name="w:id" select="$id"/>
                                                <xsl:attribute name="w:name" select="$HUD"/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:if>
                                <xsl:if test="child::Properties/RuleAboveColor">
                                    <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                    <xsl:variable name="id">
                                        <xsl:number level="any"/>
                                    </xsl:variable>
                                    <xsl:variable name="HUD">
                                        <xsl:choose>
                                            <xsl:when test="contains($NewBKmark,'_TX_')">
                                                <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                            </xsl:when>
                                            <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                                <xsl:value-of select="$NewBKmark"/>
                                            </xsl:when>
                                        </xsl:choose>
                                    </xsl:variable>
                                    <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                        <xsl:if test="not(string-length($HUD) =0)">
                                            <xsl:element name="w:bookmarkStart">
                                                <xsl:attribute name="w:id" select="$id"/>
                                                <xsl:attribute name="w:name" select="$HUD"/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:if>
                                </xsl:if>                                
                                <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                            </xsl:when>
                            <xsl:otherwise>
                                    <xsl:variable name="id">
                                        <xsl:number level="any"/>
                                    </xsl:variable>
                                    <xsl:variable name="HUD" select="@ParaNumber"/>
                                <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                        <xsl:if test="not(string-length($HUD) =0)">
                                            <xsl:element name="w:bookmarkStart">
                                                <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                                <xsl:attribute name="w:id" select="$id"/>
                                                <xsl:attribute name="w:name" select="$HUD"/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:if>
                                <xsl:if test="child::Properties/RuleAboveColor">
                                    <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                    <xsl:variable name="id">
                                        <xsl:number level="any"/>
                                    </xsl:variable>
                                    <xsl:variable name="HUD">
                                        <xsl:choose>
                                            <xsl:when test="contains($NewBKmark,'_TX_')">
                                                <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                            </xsl:when>
                                            <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                                <xsl:value-of select="$NewBKmark"/>
                                            </xsl:when>
                                        </xsl:choose>
                                    </xsl:variable>
                                    <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                        <xsl:if test="not(string-length($HUD) =0)">
                                            <xsl:element name="w:bookmarkStart">
                                                <xsl:attribute name="w:id" select="$id"/>
                                                <xsl:attribute name="w:name" select="$HUD"/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:if>
                                </xsl:if>                                
                                <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                            </xsl:otherwise>
                        </xsl:choose>
                        
                        <xsl:if test="(child::CharacterStyleRange/Table)">
                            <!-- Bookmark end new 21.8.2015 concept -->
                            
                                <xsl:variable name="id">
                                    <xsl:number level="any"/>
                                </xsl:variable>
                                <xsl:variable name="HUD" select="@ParaNumber"/>
                            <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                    <xsl:if test="not(string-length($HUD) =0)">
                                        <xsl:element name="w:bookmarkEnd">
                                            <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                            <xsl:attribute name="w:id" select="$id"/>
                                        </xsl:element>
                                    </xsl:if>
                                </xsl:if>
                            <xsl:if test="child::Properties/RuleAboveColor">
                                <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                <xsl:variable name="id">
                                    <xsl:number level="any"/>
                                </xsl:variable>
                                <xsl:variable name="HUD">
                                    <xsl:choose>
                                        <xsl:when test="contains($NewBKmark,'_TX_')">
                                            <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                        </xsl:when>
                                        <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                            <xsl:value-of select="$NewBKmark"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                    <xsl:if test="not(string-length($HUD) =0)">
                                        <xsl:element name="w:bookmarkEnd">
                                            <xsl:attribute name="w:id" select="$id"/>
                                        </xsl:element>
                                    </xsl:if>
                                </xsl:if>
                            </xsl:if>                                
                            <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                        </xsl:if>
                        <!-- Taken from inp.xslt END -->
                         <xsl:apply-templates/>
                         <!-- Taken from inp.xslt  -->
                         <xsl:choose>
                             <xsl:when test="(child::CharacterStyleRange/Table)"/>
                             <xsl:otherwise>
                                     <xsl:variable name="id">
                                         <xsl:number level="any"/>
                                     </xsl:variable>
                                     <xsl:variable name="HUD" select="@ParaNumber"/>
                                 <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                         <xsl:if test="not(string-length($HUD) =0)">
                                             <xsl:element name="w:bookmarkEnd">
                                                 <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                                 <xsl:attribute name="w:id" select="$id"/>
                                             </xsl:element>
                                         </xsl:if>
                                     </xsl:if>
                                 <xsl:if test="child::Properties/RuleAboveColor">
                                     <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                     <xsl:variable name="id">
                                         <xsl:number level="any"/>
                                     </xsl:variable>
                                     <xsl:variable name="HUD">
                                         <xsl:choose>
                                             <xsl:when test="contains($NewBKmark,'_TX_')">
                                                 <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                             </xsl:when>
                                             <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                                 <xsl:value-of select="$NewBKmark"/>
                                             </xsl:when>
                                         </xsl:choose>
                                     </xsl:variable>
                                     <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                         <xsl:if test="not(string-length($HUD) =0)">
                                             <xsl:element name="w:bookmarkEnd">
                                                 <xsl:attribute name="w:id" select="$id"/>
                                             </xsl:element>
                                         </xsl:if>
                                     </xsl:if>
                                 </xsl:if>                                
                                 <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                             </xsl:otherwise>
                         </xsl:choose>
                         <xsl:if test="not(child::CharacterStyleRange/Table)">
                             
                         </xsl:if>
                         <!-- Taken from inp.xslt END -->
                     </xsl:element>
                 </xsl:when>
                 <xsl:when test="$curParaNumLvl = '10' or $listlvl = '10'">
                     <xsl:text>&#x000A;</xsl:text>
                     <xsl:element name="ten">
                         <xsl:attribute name="class" select="translate($Na1, ' /\[\]@','_')"/>
                         <xsl:attribute name="data-name" select="$Na2"/> 
                         <!-- 24-JAN-19: For Mariappan -->
                         <xsl:attribute name="data-parentStory">
                             <!-- Commented on 06-FEB-19, now taken from IDMLs "ParentStory" attribute not from sree's bkmark -->
                             <!--<xsl:variable name="paraINFO" select="@ParaInfo"/>
                             <xsl:value-of select="concat('Story_',substring-before(substring-after($paraINFO,'_Story_'),'_'))"/>-->
                             <xsl:value-of select="@ParentStory"/>
                         </xsl:attribute>
                         <xsl:attribute name="listtype" select="$Na2"/>
                         <xsl:attribute name="numberFormat" select="$listnumformat"/>
                         <xsl:attribute name="numberType" select="$listtype"/>
                         <!-- Added for listtype on 8-12-2023 Azure 1552 -->
                         <!--<xsl:attribute name="start" select="$NumberingStartAt"/>-->
                         <xsl:attribute name="start">
                             <xsl:choose>
                                 <xsl:when test="string-length(@SelfNumberingStartAt) &gt;0">
                                     <xsl:value-of select="normalize-space(@SelfNumberingStartAt)"/>
                                 </xsl:when>
                                 <xsl:otherwise>
                                     <xsl:value-of select="$NumberingStartAt"/>
                                 </xsl:otherwise>
                             </xsl:choose>
                         </xsl:attribute>
                         
                         
                         <!-- Taken from inp.xslt -->
                         <xsl:if test="@ParaInfo">
                            <xsl:attribute name="w:rsidR" select="$PN"/>
                        </xsl:if>
                         <xsl:if test="string-length($txtFrameId) &gt; 0">
                             <xsl:choose>
                                 <xsl:when test="starts-with($txtFrameId,'u')">
                                     <xsl:attribute name="txtFrameId" select="$txtFrameId"/>        
                                 </xsl:when>
                                 <xsl:otherwise>
                                     <xsl:attribute name="txtFrameId" select="concat('u',$txtFrameId)"/>
                                 </xsl:otherwise>
                             </xsl:choose>
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
                                                        <xsl:attribute name="w:val" select="replace($Na1,'\\','_')"/>
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
                            </xsl:element>
                            <xsl:apply-templates select="child::Properties/TabList" mode="tabs"/>
                            <!--List auto number restart-->
                            <xsl:copy-of select="$ListNRestart"/>
                            <xsl:if test="not(child::w:numPr) and @BulletsAndNumberingListType ='NoList'">
                                <xsl:element name="w:numPr">
                                    <xsl:element name="w:ilvl">
                                        <xsl:attribute name="w:val" select="'0'"/>
                                    </xsl:element>
                                    <xsl:element name="w:numId">
                                        <xsl:attribute name="w:val">
                                            <xsl:value-of select="0"/>
                                        </xsl:attribute>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:if>
                            <!--List auto number restart-->
                            
                            <xsl:if test="not(string-length(@ParaInfo) = 0)">
                          </xsl:if>
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
                        <xsl:choose>
                            <xsl:when test="(child::CharacterStyleRange/Table)">                                
                                    <xsl:variable name="id">
                                        <xsl:number level="any"/>
                                    </xsl:variable>
                                    <xsl:variable name="HUD" select="@ParaNumber"/>
                                <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                        <xsl:if test="not(string-length($HUD) =0)">
                                            <xsl:element name="w:bookmarkStart">
                                                <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                                <xsl:attribute name="w:id" select="$id"/>
                                                <xsl:attribute name="w:name" select="$HUD"/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:if>
                                <xsl:if test="child::Properties/RuleAboveColor">
                                    <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                    <xsl:variable name="id">
                                        <xsl:number level="any"/>
                                    </xsl:variable>
                                    <xsl:variable name="HUD">
                                        <xsl:choose>
                                            <xsl:when test="contains($NewBKmark,'_TX_')">
                                                <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                            </xsl:when>
                                            <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                                <xsl:value-of select="$NewBKmark"/>
                                            </xsl:when>
                                        </xsl:choose>
                                    </xsl:variable>
                                    <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                        <xsl:if test="not(string-length($HUD) =0)">
                                            <xsl:element name="w:bookmarkStart">
                                                <xsl:attribute name="w:id" select="$id"/>
                                                <xsl:attribute name="w:name" select="$HUD"/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:if>
                                </xsl:if>                                
                                <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                            </xsl:when>
                            <xsl:otherwise>
                                    <xsl:variable name="id">
                                        <xsl:number level="any"/>
                                    </xsl:variable>
                                    <xsl:variable name="HUD" select="@ParaNumber"/>
                                <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                        <xsl:if test="not(string-length($HUD) =0)">
                                            <xsl:element name="w:bookmarkStart">
                                                <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                                <xsl:attribute name="w:id" select="$id"/>
                                                <xsl:attribute name="w:name" select="$HUD"/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:if>
                                <xsl:if test="child::Properties/RuleAboveColor">
                                    <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                    <xsl:variable name="id">
                                        <xsl:number level="any"/>
                                    </xsl:variable>
                                    <xsl:variable name="HUD">
                                        <xsl:choose>
                                            <xsl:when test="contains($NewBKmark,'_TX_')">
                                                <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                            </xsl:when>
                                            <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                                <xsl:value-of select="$NewBKmark"/>
                                            </xsl:when>
                                        </xsl:choose>
                                    </xsl:variable>
                                    <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                        <xsl:if test="not(string-length($HUD) =0)">
                                            <xsl:element name="w:bookmarkStart">
                                                <xsl:attribute name="w:id" select="$id"/>
                                                <xsl:attribute name="w:name" select="$HUD"/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:if>
                                </xsl:if>                                
                                <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                            </xsl:otherwise>
                        </xsl:choose>
                        
                        <xsl:if test="(child::CharacterStyleRange/Table)">
                                <xsl:variable name="id">
                                    <xsl:number level="any"/>
                                </xsl:variable>
                                <xsl:variable name="HUD" select="@ParaNumber"/>
                            <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                    <xsl:if test="not(string-length($HUD) =0)">
                                        <xsl:element name="w:bookmarkEnd">
                                            <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                            <xsl:attribute name="w:id" select="$id"/>
                                        </xsl:element>
                                    </xsl:if>
                                </xsl:if>
                            <xsl:if test="child::Properties/RuleAboveColor">
                                <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                <xsl:variable name="id">
                                    <xsl:number level="any"/>
                                </xsl:variable>
                                <xsl:variable name="HUD">
                                    <xsl:choose>
                                        <xsl:when test="contains($NewBKmark,'_TX_')">
                                            <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                        </xsl:when>
                                        <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                            <xsl:value-of select="$NewBKmark"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                    <xsl:if test="not(string-length($HUD) =0)">
                                        <xsl:element name="w:bookmarkEnd">
                                            <xsl:attribute name="w:id" select="$id"/>
                                        </xsl:element>
                                    </xsl:if>
                                </xsl:if>
                            </xsl:if>                                
                            <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                        </xsl:if>
                        <!-- Taken from inp.xslt END -->
                         <xsl:apply-templates/>
                         <!-- Taken from inp.xslt  -->
                         <xsl:choose>
                             <xsl:when test="(child::CharacterStyleRange/Table)"/>
                             <xsl:otherwise>
                                     <xsl:variable name="id">
                                         <xsl:number level="any"/>
                                     </xsl:variable>
                                     <xsl:variable name="HUD" select="@ParaNumber"/>
                                 <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                         <xsl:if test="not(string-length($HUD) =0)">
                                             <xsl:element name="w:bookmarkEnd">
                                                 <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                                 <xsl:attribute name="w:id" select="$id"/>
                                             </xsl:element>
                                         </xsl:if>
                                     </xsl:if>
                                 <xsl:if test="child::Properties/RuleAboveColor">
                                     <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                     <xsl:variable name="id">
                                         <xsl:number level="any"/>
                                     </xsl:variable>
                                     <xsl:variable name="HUD">
                                         <xsl:choose>
                                             <xsl:when test="contains($NewBKmark,'_TX_')">
                                                 <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                             </xsl:when>
                                             <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                                 <xsl:value-of select="$NewBKmark"/>
                                             </xsl:when>
                                         </xsl:choose>
                                     </xsl:variable>
                                     <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                         <xsl:if test="not(string-length($HUD) =0)">
                                             <xsl:element name="w:bookmarkEnd">
                                                 <xsl:attribute name="w:id" select="$id"/>
                                             </xsl:element>
                                         </xsl:if>
                                     </xsl:if>
                                 </xsl:if>                                
                                 <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                             </xsl:otherwise>
                         </xsl:choose>
                         <xsl:if test="not(child::CharacterStyleRange/Table)">
                             
                         </xsl:if>
                         <!-- Taken from inp.xslt END -->
                     </xsl:element>
                 </xsl:when>
                 
                 
                 <xsl:otherwise>
                     <xsl:element name="p">
                         <!-- No Br paragraph on 23-2-2022 -->
                         <xsl:if test="self::ParagraphStyleRange[not(@noemptypara='true')][descendant::Content][string-length(normalize-space(.)) = 0][not(descendant::Br) or descendant::Br] or self::ParagraphStyleRange[not(@noemptypara='true')][string-length(normalize-space(.))=0][not(descendant::Content)][not(descendant::Br) or descendant::Br] or self::ParagraphStyleRange[not(@noemptypara='true')][following-sibling::*[1][self::Table]][descendant::Content[string-length(normalize-space(.)) = 0] and descendant::Properties[string-length(.) &gt; 0]][not(descendant::Br) or descendant::Br] or self::ParagraphStyleRange[not(@noemptypara='true')][following-sibling::*[1][self::Table]][not(descendant::Content) and descendant::Properties[string-length(.) &gt; 0]][not(descendant::Br) or descendant::Br]">
                             <xsl:attribute name="data-noemptypara" select="'true'"/>
                         </xsl:if>
                         <!-- End -->
                         <xsl:attribute name="class">
                             <xsl:value-of select="translate($Na1, ' /\[\]@','_')"/>                             
                         </xsl:attribute>
                         <xsl:attribute name="data-name">
                             <xsl:value-of select="$Na2"/>
                         </xsl:attribute>
                         <!-- 24-JAN-19: For Mariappan -->
                         <xsl:attribute name="data-parentStory">
                             <!-- Commented on 06-FEB-19, now taken from IDMLs "ParentStory" attribute not from sree's bkmark -->
                             <!--<xsl:variable name="paraINFO" select="@ParaInfo"/>
                             <xsl:value-of select="concat('Story_',substring-before(substring-after($paraINFO,'_Story_'),'_'))"/>-->
                             <xsl:value-of select="@ParentStory"/>
                         </xsl:attribute>
                         
                         <!-- Taken from inp.xslt -->
                         <xsl:if test="@ParaInfo">
                            <xsl:attribute name="w:rsidR" select="$PN"/>
                        </xsl:if>
                        
                         <xsl:if test="string-length($txtFrameId) &gt; 0">
                             <xsl:choose>
                                 <xsl:when test="starts-with($txtFrameId,'u')">
                                     <xsl:attribute name="txtFrameId" select="$txtFrameId"/>        
                                 </xsl:when>
                                 <xsl:otherwise>
                                     <xsl:attribute name="txtFrameId" select="concat('u',$txtFrameId)"/>
                                 </xsl:otherwise>
                             </xsl:choose>
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
                                                        <xsl:attribute name="w:val" select="replace($Na1,'\\','_')"/>
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
                            </xsl:element>
                            <xsl:apply-templates select="child::Properties/TabList" mode="tabs"/>
                            <!--List auto number restart-->
                            <xsl:copy-of select="$ListNRestart"/>
                            <xsl:if test="not(child::w:numPr) and @BulletsAndNumberingListType ='NoList'">
                                <xsl:element name="w:numPr">
                                    <xsl:element name="w:ilvl">
                                        <xsl:attribute name="w:val" select="'0'"/>
                                    </xsl:element>
                                    <xsl:element name="w:numId">
                                        <xsl:attribute name="w:val">
                                            <xsl:value-of select="0"/>
                                        </xsl:attribute>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:if>
                            <!--List auto number restart-->
                            
                            <xsl:if test="not(string-length(@ParaInfo) = 0)">
                          </xsl:if>
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
                        <xsl:choose>
                            <xsl:when test="(child::CharacterStyleRange/Table)">                                
                                    <xsl:variable name="id">
                                        <xsl:number level="any"/>
                                    </xsl:variable>
                                    <xsl:variable name="HUD" select="@ParaNumber"/>
                                <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                        <xsl:if test="not(string-length($HUD) =0)">
                                            <xsl:element name="w:bookmarkStart">
                                                <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                                <xsl:attribute name="w:id" select="$id"/>
                                                <xsl:attribute name="w:name" select="$HUD"/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:if>
                                <xsl:if test="child::Properties/RuleAboveColor">
                                    <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                    <xsl:variable name="id">
                                        <xsl:number level="any"/>
                                    </xsl:variable>
                                    <xsl:variable name="HUD">
                                        <xsl:choose>
                                            <xsl:when test="contains($NewBKmark,'_TX_')">
                                                <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                            </xsl:when>
                                            <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                                <xsl:value-of select="$NewBKmark"/>
                                            </xsl:when>
                                        </xsl:choose>
                                    </xsl:variable>
                                    <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                        <xsl:if test="not(string-length($HUD) =0)">
                                            <xsl:element name="w:bookmarkStart">
                                                <xsl:attribute name="w:id" select="$id"/>
                                                <xsl:attribute name="w:name" select="$HUD"/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:if>
                                </xsl:if>                                
                                <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                            </xsl:when>
                            <xsl:otherwise>
                                    <xsl:variable name="id">
                                        <xsl:number level="any"/>
                                    </xsl:variable>
                                    <xsl:variable name="HUD" select="@ParaNumber"/>
                                <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                        <xsl:if test="not(string-length($HUD) =0)">
                                            <xsl:element name="w:bookmarkStart">
                                                <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                                <xsl:attribute name="w:id" select="$id"/>
                                                <xsl:attribute name="w:name" select="$HUD"/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:if>
                                <xsl:if test="child::Properties/RuleAboveColor">
                                    <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                    <xsl:variable name="id">
                                        <xsl:number level="any"/>
                                    </xsl:variable>
                                    <xsl:variable name="HUD">
                                        <xsl:choose>
                                            <xsl:when test="contains($NewBKmark,'_TX_')">
                                                <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                            </xsl:when>
                                            <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                                <xsl:value-of select="$NewBKmark"/>
                                            </xsl:when>
                                        </xsl:choose>
                                    </xsl:variable>
                                    <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                        <xsl:if test="not(string-length($HUD) =0)">
                                            <xsl:element name="w:bookmarkStart">
                                                <xsl:attribute name="w:id" select="$id"/>
                                                <xsl:attribute name="w:name" select="$HUD"/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:if>
                                </xsl:if>                                
                                <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                            </xsl:otherwise>
                        </xsl:choose>
                        
                        <xsl:if test="(child::CharacterStyleRange/Table)">
                                <xsl:variable name="id">
                                    <xsl:number level="any"/>
                                </xsl:variable>
                                <xsl:variable name="HUD" select="@ParaNumber"/>
                            <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                    <xsl:if test="not(string-length($HUD) =0)">
                                        <xsl:element name="w:bookmarkEnd">
                                            <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                            <xsl:attribute name="w:id" select="$id"/>
                                        </xsl:element>
                                    </xsl:if>
                                </xsl:if>
                            <xsl:if test="child::Properties/RuleAboveColor">
                                <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                <xsl:variable name="id">
                                    <xsl:number level="any"/>
                                </xsl:variable>
                                <xsl:variable name="HUD">
                                    <xsl:choose>
                                        <xsl:when test="contains($NewBKmark,'_TX_')">
                                            <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                        </xsl:when>
                                        <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                            <xsl:value-of select="$NewBKmark"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                    <xsl:if test="not(string-length($HUD) =0)">
                                        <xsl:element name="w:bookmarkEnd">
                                            <xsl:attribute name="w:id" select="$id"/>
                                        </xsl:element>
                                    </xsl:if>
                                </xsl:if>
                            </xsl:if>                                
                            <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                        </xsl:if>
                        <!-- Taken from inp.xslt END -->
                         <xsl:apply-templates/>
                         <!-- Taken from inp.xslt  -->
                         <xsl:choose>
                             <xsl:when test="(child::CharacterStyleRange/Table)"/>
                             <xsl:otherwise>
                                     <xsl:variable name="id">
                                         <xsl:number level="any"/>
                                     </xsl:variable>
                                     <xsl:variable name="HUD" select="@ParaNumber"/>
                                 <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                         <xsl:if test="not(string-length($HUD) =0)">
                                             <xsl:element name="w:bookmarkEnd">
                                                 <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                                 <xsl:attribute name="w:id" select="$id"/>
                                             </xsl:element>
                                         </xsl:if>
                                     </xsl:if>
                                 <xsl:if test="child::Properties/RuleAboveColor">
                                     <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                     <xsl:variable name="id">
                                         <xsl:number level="any"/>
                                     </xsl:variable>
                                     <xsl:variable name="HUD">
                                         <xsl:choose>
                                             <xsl:when test="contains($NewBKmark,'_TX_')">
                                                 <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                             </xsl:when>
                                             <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                                 <xsl:value-of select="$NewBKmark"/>
                                             </xsl:when>
                                         </xsl:choose>
                                     </xsl:variable>
                                     <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                         <xsl:if test="not(string-length($HUD) =0)">
                                             <xsl:element name="w:bookmarkEnd">
                                                 <xsl:attribute name="w:id" select="$id"/>
                                             </xsl:element>
                                         </xsl:if>
                                     </xsl:if>
                                 </xsl:if>                                
                                 <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                             </xsl:otherwise>
                         </xsl:choose>
                         <xsl:if test="not(child::CharacterStyleRange/Table)">                             
                         </xsl:if>
                         <!-- Taken from inp.xslt END -->
                     </xsl:element>
                 </xsl:otherwise>
             </xsl:choose>
         </xsl:when>
         <!--
            <xsl:when test="$CC = 'ContentControlTrue'">
                <xsl:element name="XXX">                        
                         <xsl:if test="@ParaInfo">
                              <xsl:attribute name="w:rsidR" select="$PN"/>
                         </xsl:if>
                        
                        <xsl:if test="@Justification | @FirstLineIndent | @LeftIndent | @RightIndent">
                            <xsl:attribute name="style">
                                <xsl:if test="@Justification">  
                                    <xsl:choose>
                                        <xsl:when test="contains(@Justification, 'Center')">
                                            <xsl:value-of select="'text-align:center'"/>
                                        </xsl:when>
                                        <xsl:when test="contains(@Justification, 'Left')">
                                            <xsl:value-of select="'text-align:left'"/>
                                        </xsl:when>
                                        <xsl:when test="contains(@Justification, 'Right')">
                                            <xsl:value-of select="'text-align:right'"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="'text-align:justify'"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:if>                                
                                <xsl:if test="@FirstLineIndent">
                                    <xsl:if test="@Justification">
                                        <xsl:text>;</xsl:text>  
                                    </xsl:if>
                                    <xsl:choose>
                                        <xsl:when test="@FirstLineIndent = '0'">
                                            <xsl:value-of select="'text-indent:0pt;'"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:if test="@FirstLineIndent &lt; 0">
                                                <!-\-<xsl:text>padding-left:</xsl:text>-\->
                                                <xsl:text>text-indent:</xsl:text>
                                                <xsl:value-of select="@FirstLineIndent div 2"/>
                                                <xsl:text>pt</xsl:text>
                                            </xsl:if>
                                            <xsl:if test="@FirstLineIndent > 0">
                                                <xsl:text>text-indent:</xsl:text>
                                                <xsl:value-of select="@FirstLineIndent div 2"/>
                                                <xsl:text>pt</xsl:text>
                                            </xsl:if>
                                            <!-\-<xsl:text>text-indent:</xsl:text>
                                            <xsl:value-of select="@FirstLineIndent"/>
                                            <xsl:text>pt</xsl:text>-\->
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:if>
                                <xsl:if test="@LeftIndent">
                                    <xsl:if test="@Justification | @FirstLineIndent">
                                        <xsl:text>;</xsl:text>  
                                    </xsl:if>
                                    <xsl:choose>
                                        <xsl:when test="@LeftIndent = '0'">
                                            <xsl:value-of select="'margin-left:0pt;'"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:text>margin-left:</xsl:text>
                                            <xsl:value-of select="@LeftIndent div 2"/>
                                            <xsl:text>pt</xsl:text>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:if>
                                <xsl:if test="@RightIndent">
                                    <xsl:if test="@Justification | @FirstLineIndent | @LeftIndent">
                                        <xsl:text>;</xsl:text>  
                                    </xsl:if>
                                    <xsl:choose>
                                        <xsl:when test="@RightIndent = '0'">
                                            <xsl:value-of select="'margin-right:0pt;'"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:text>margin-right:</xsl:text>
                                            <xsl:value-of select="@RightIndent div 2"/>
                                            <xsl:text>pt</xsl:text>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:if>
                            </xsl:attribute>
                        </xsl:if>
                        
                                   <xsl:element name="w:pPr">     
                                       <xsl:element name="w:pStyle">
                                           <!-\-<xsl:attribute name="w:val" select="tokenize($P, '/')[last()]"/>-\->
                                           <!-\-                                        new update 28.9.2016-\->
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
                                           <!-\-<xsl:choose>
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
                                           </xsl:choose>-\->
                                           
                                       </xsl:element>
                                       <xsl:apply-templates select="child::Properties/TabList" mode="tabs"/>
                                       <!-\-List auto number restart-\->
                                       <xsl:copy-of select="$ListNRestart"/>
                                       <xsl:if test="not(child::w:numPr) and @BulletsAndNumberingListType ='NoList'">
                                           <xsl:element name="w:numPr">
                                               <xsl:element name="w:ilvl">
                                                   <xsl:attribute name="w:val" select="'0'"/>
                                               </xsl:element>
                                               <xsl:element name="w:numId">
                                                   <xsl:attribute name="w:val">
                                                       <xsl:value-of select="0"/>
                                                   </xsl:attribute>
                                               </xsl:element>
                                           </xsl:element>
                                       </xsl:if>
                                       <!-\-List auto number restart-\->
                                       
                                       <xsl:if test="not(string-length(@ParaInfo) = 0)">
                                          <!-\- <xsl:if test="contains(@ParaInfo,'_TX_')">
                                       <xsl:element name="w:framePr">
                                           <xsl:attribute name="w:w" select="$width"/>
                                           <xsl:attribute name="w:h" select="$height"/>
                                           <xsl:attribute name="w:wrap" select="'around'"/>
                                           <xsl:attribute name="w:vAnchor" select="'page'"/>
                                           <xsl:attribute name="w:hAnchor" select="'page'"/>
                                           <xsl:attribute name="w:x" select="$TX"/>
                                           <xsl:attribute name="w:y" select="$TY"/>
                                       </xsl:element> <!-\\-temporarily commented for the word creation purpose 8.9.2015-\\->
                                           </xsl:if>-\->
                                     </xsl:if>
                                       <!-\-@@@@@@@@@@@@@@@@@@@@@@@@ Spacing Start @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -\->    
                                       <xsl:element name="w:spacing">
                                           
                                           <xsl:if test="self::ParagraphStyleRange/@SpaceBefore">
                                               <!-\-<xsl:attribute name="w:before" select="$SB4 * 20"/>-\->
                                               <xsl:attribute name="w:before" select="round($SB4 * 20)"/>
                                           </xsl:if>
                                           <xsl:if test="self::ParagraphStyleRange/@SpaceAfter">
                                               <!-\-<xsl:attribute name="w:after" select="$SAF * 20"/>-\->
                                               <xsl:attribute name="w:after" select="round($SAF * 20)"/>
                                           </xsl:if>
                                           <xsl:if test="self::ParagraphStyleRange/Properties/Leading">
                                               <xsl:if test="$LS = 'Auto'">
                                                   <xsl:attribute name="w:line" select="12 * 20"/>
                                                   <xsl:attribute name="w:lineRule" select="'atLeast'"/>
                                               </xsl:if>
                                               <xsl:if test="not($LS = 'Auto')">
                                                   <!-\-<xsl:attribute name="w:line" select="$LS * 20"/>-\->
                                                   <xsl:attribute name="w:line" select="round($LS * 20)"/>
                                                   <xsl:attribute name="w:lineRule" select="'atLeast'"/>
                                               </xsl:if>
                                           </xsl:if>
                                       </xsl:element>
                                       <!-\-@@@@@@@@@@@@@@@@@@@@@@@@ Spacing End @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -\->
                                       
                                       <!-\-@@@@@@@@@@@@@@@@@@@@@@@@ Indent Start @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -\->
                                       <xsl:element name="w:ind">
                                           <xsl:if test="self::ParagraphStyleRange/@FirstLineIndent">
                                               <xsl:if test="not($FLI &lt; 0)">
                                                   <!-\-<xsl:attribute name="w:firstLine" select="$FLI * 20"/>-\->
                                                   <xsl:attribute name="w:firstLine" select="round($FLI * 20)"/>
                                               </xsl:if>
                                               <xsl:if test="($FLI &lt; 0)">
                                                   <xsl:variable name="FLI1" select="$FLI * -1"/>
                                                   <!-\-<xsl:attribute name="w:hanging" select="$FLI1 * 20"/>-\->
                                                   <xsl:attribute name="w:hanging" select="round($FLI1 * 20)"/>
                                               </xsl:if>
                                           </xsl:if>
                                           
                                           <xsl:if test="self::ParagraphStyleRange/@LeftIndent">
                                               <!-\-<xsl:attribute name="w:left" select="$LI * 20"/>-\->
                                               <xsl:attribute name="w:left" select="round($LI * 20)"/>
                                           </xsl:if>
                                           
                                           <xsl:if test="self::ParagraphStyleRange/@RightIndent">
                                               <!-\-<xsl:attribute name="w:right" select="$RI * 20"/>-\->
                                               <xsl:attribute name="w:right" select="round($RI * 20)"/>
                                           </xsl:if>
                                       </xsl:element>
                                       <!-\-@@@@@@@@@@@@@@@@@@@@@@@@ Indent End @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -\->
                                       
                                       <!-\-@@@@@@@@@@@@@@@@@@@@@@@@ Justification Start @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -\->
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
                                       <!-\-@@@@@@@@@@@@@@@@@@@@@@@@ Justification End @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -\->
                                   
                                   </xsl:element>
                                   <xsl:choose>
                                       <xsl:when test="(child::CharacterStyleRange/Table)">
                                           <xsl:for-each select="descendant::HyperlinkTextDestination[contains(local-name(@BookMarkDestination),'story')][1] | descendant::HyperlinkTextSource[contains(lower-case(@HyperlinkUDestination),'story')][1]">
                                               <xsl:variable name="id">
                                                   <xsl:number level="any"/>
                                               </xsl:variable>
                                               <xsl:variable name="HUD">
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
                                               <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                                   <xsl:if test="not(string-length($HUD) =0)">
                                                       <xsl:element name="w:bookmarkStart">
                                                           <!-\-<xsl:attribute name="w:id" select="$HUD"/>-\->
                                                           <xsl:attribute name="w:id" select="$id"/>
                                                           <xsl:attribute name="w:name" select="$HUD"/>
                                                       </xsl:element>
                                                   </xsl:if>
                                               </xsl:if>
                                           </xsl:for-each>
                                       </xsl:when>
                                       <xsl:otherwise>
                                           <!-\- Bookmark start new 21.8.2015 concept -\->
                                           <xsl:for-each select="descendant::HyperlinkTextDestination | descendant::HyperlinkTextSource">
                                               <xsl:variable name="id">
                                                   <xsl:number level="any"/>
                                               </xsl:variable>
                                               <xsl:variable name="HUD">
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
                                               <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                                   <xsl:if test="not(string-length($HUD) =0)">
                                                       <xsl:element name="w:bookmarkStart">
                                                           <!-\-<xsl:attribute name="w:id" select="$HUD"/>-\->
                                                           <xsl:attribute name="w:id" select="$id"/>
                                                           <xsl:attribute name="w:name" select="$HUD"/>
                                                       </xsl:element>
                                                   </xsl:if>
                                               </xsl:if>
                                           </xsl:for-each>
                                           <!-\- Bookmark start new 21.8.2015 concept -\->
                                       </xsl:otherwise>
                                   </xsl:choose>
                                   
                                   <xsl:if test="(child::CharacterStyleRange/Table)">
                                       <!-\- Bookmark end new 21.8.2015 concept -\->
                                       <xsl:for-each select="descendant::HyperlinkTextDestination[contains(local-name(@BookMarkDestination),'story')][1] | descendant::HyperlinkTextSource[contains(lower-case(@HyperlinkUDestination),'story')][1]">
                                           <xsl:variable name="id">
                                               <xsl:number level="any"/>
                                           </xsl:variable>
                                           <xsl:variable name="HUD">
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
                                           
                                           <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                               <xsl:if test="not(string-length($HUD) =0)">
                                                   <xsl:element name="w:bookmarkEnd">
                                                       <!-\-<xsl:attribute name="w:id" select="$HUD"/>-\->
                                                       <xsl:attribute name="w:id" select="$id"/>
                                                   </xsl:element>
                                               </xsl:if>
                                           </xsl:if>
                                           
                                       </xsl:for-each>
                                       <!-\- Bookmark end new 21.8.2015 concept -\->
                                   </xsl:if>
                                   
                        <xsl:if test="@Justification">
                            <xsl:text disable-output-escaping="yes">&lt;span</xsl:text>
                            <xsl:if test="@Justification">
                                <xsl:text disable-output-escaping="yes"> style="text-align:</xsl:text>  
                                <xsl:choose>
                                    <xsl:when test="contains(@Justification, 'Center')">
                                        <xsl:value-of select="'center'"/>
                                    </xsl:when>
                                    <xsl:when test="contains(@Justification, 'Left')">
                                        <xsl:value-of select="'left'"/>
                                    </xsl:when>
                                    <xsl:when test="contains(@Justification, 'Right')">
                                        <xsl:value-of select="'right'"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="'justify'"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:if>
                            <xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
                        </xsl:if>
                        
                        <xsl:apply-templates/>
                        <xsl:if test="@Justification">
                            <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                        </xsl:if>
                        
                        
                        <xsl:choose>
                            <xsl:when test="(child::CharacterStyleRange/Table)"/>
                            <xsl:otherwise>
                                <!-\- Bookmark end new 21.8.2015 concept -\->
                                <xsl:for-each select="descendant::HyperlinkTextDestination | descendant::HyperlinkTextSource">
                                    <xsl:variable name="id">
                                        <xsl:number level="any"/>
                                    </xsl:variable>
                                    <xsl:variable name="HUD">
                                        <!-\-<xsl:choose>
                                               <xsl:when test="self::HyperlinkTextSource">
                                                   <xsl:value-of select="@HyperlinkUDestination"/>
                                               </xsl:when>
                                               <xsl:when test="self::HyperlinkTextDestination">
                                                   <xsl:value-of select="@BookMarkDestination"/>
                                               </xsl:when>
                                           </xsl:choose>-\->
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
                                    
                                    <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                        <xsl:if test="not(string-length($HUD) =0)">
                                            <xsl:element name="w:bookmarkEnd">
                                                <!-\-<xsl:attribute name="w:id" select="$HUD"/>-\->
                                                <xsl:attribute name="w:id" select="$id"/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:if>
                                    
                                </xsl:for-each>
                                <!-\- Bookmark end new 21.8.2015 concept -\->
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:if test="not(child::CharacterStyleRange/Table)">
                            
                        </xsl:if>
                        
                    </xsl:element>
            </xsl:when>
         -->
         <xsl:otherwise>
             <xsl:text>&#x000A;</xsl:text>
             <!--<xsl:if test="descendant::Content | descendant::Group">-->
                    <xsl:element name="p">
                        <!-- No Br paragraph on 23-2-2022 -->
                        <xsl:if test="self::ParagraphStyleRange[not(@noemptypara='true')][descendant::Content][string-length(normalize-space(.)) = 0][not(descendant::Br) or descendant::Br] or self::ParagraphStyleRange[not(@noemptypara='true')][string-length(normalize-space(.))=0][not(descendant::Content)][not(descendant::Br) or descendant::Br] or self::ParagraphStyleRange[not(@noemptypara='true')][following-sibling::*[1][self::Table]][descendant::Content[string-length(normalize-space(.)) = 0] and descendant::Properties[string-length(.) &gt; 0]][not(descendant::Br) or descendant::Br] or self::ParagraphStyleRange[not(@noemptypara='true')][following-sibling::*[1][self::Table]][not(descendant::Content) and descendant::Properties[string-length(.) &gt; 0]][not(descendant::Br) or descendant::Br]">
                            <xsl:attribute name="data-noemptypara" select="'true'"/>
                        </xsl:if>
                        <!-- End -->
                        <xsl:attribute name="class">
                            <!--<xsl:value-of select="$Na1"/>-->
                            <xsl:choose>
                                <xsl:when test="matches($Na1, '^([0-9]+)/')">
                                    <xsl:value-of select="replace($Na1, '^([0-9]+)/','IDMLnumslash')"/>
                                </xsl:when>
                                <xsl:when test="matches($Na1, '^([0-9]+)$')">
                                    <xsl:value-of select="concat('IDMLnum',$Na1)"/>
                                </xsl:when>
                                <xsl:when test="matches($Na1, '^[0-9]')">
                                    <xsl:value-of select="replace($Na1, '^([0-9]+)','_')"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <!--<xsl:value-of select="$Na1"/>-->
                                    <xsl:choose>
                                        <xsl:when test="matches($Na1,'3a')">
                                            <xsl:value-of select="concat(substring-before($Na1,'3a'),substring-after($Na1,'3a'))"></xsl:value-of>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="$Na1"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                        <xsl:attribute name="data-name">
                            <xsl:value-of select="$Na2"/>
                        </xsl:attribute> 
                        <!-- 24-JAN-19: For Mariappan -->
                        <xsl:attribute name="data-parentStory">
                            <!-- Commented on 06-FEB-19, now taken from IDMLs "ParentStory" attribute not from sree's bkmark -->
                            <!--<xsl:variable name="paraINFO" select="@ParaInfo"/>
                             <xsl:value-of select="concat('Story_',substring-before(substring-after($paraINFO,'_Story_'),'_'))"/>-->
                            <xsl:value-of select="@ParentStory"/>
                        </xsl:attribute>
                        <xsl:if test="@ParaInfo">
                              <xsl:attribute name="w:rsidR" select="$PN"/>
                         </xsl:if>                        
                        <xsl:if test="@Justification | @FirstLineIndent | @LeftIndent | @RightIndent">
                            <xsl:attribute name="style">
                                <xsl:if test="@Justification">  
                                    <xsl:choose>
                                        <xsl:when test="contains(@Justification, 'Center')">
                                            <xsl:value-of select="'text-align:center'"/>
                                        </xsl:when>
                                        <xsl:when test="contains(@Justification, 'Left')">
                                            <xsl:value-of select="'text-align:left'"/>
                                        </xsl:when>
                                        <xsl:when test="contains(@Justification, 'Right')">
                                            <xsl:value-of select="'text-align:right'"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="'text-align:justify'"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:if>                                
                                <xsl:if test="@FirstLineIndent">
                                    <xsl:if test="@Justification">
                                        <xsl:text>;</xsl:text>  
                                    </xsl:if>
                                    <xsl:choose>
                                        <xsl:when test="@FirstLineIndent = '0'">
                                            <xsl:value-of select="'text-indent:0pt;'"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:if test="@FirstLineIndent &lt; 0">
                                                <xsl:text>text-indent:</xsl:text>
                                                <!--12-Mar-18: <xsl:value-of select="@FirstLineIndent div 2"/>-->
                                                <xsl:value-of select="@FirstLineIndent"/>
                                                <xsl:text>pt</xsl:text>
                                            </xsl:if>
                                            <xsl:if test="@FirstLineIndent > 0">
                                                <xsl:text>text-indent:</xsl:text>
                                                <!--12-Mar-18: <xsl:value-of select="@FirstLineIndent div 2"/>-->
                                                <xsl:value-of select="@FirstLineIndent"/>
                                                <xsl:text>pt</xsl:text>
                                            </xsl:if>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:if>
                                <xsl:if test="@LeftIndent">
                                    <xsl:if test="@Justification | @FirstLineIndent">
                                        <xsl:text>;</xsl:text>  
                                    </xsl:if>
                                    <xsl:choose>
                                        <xsl:when test="@LeftIndent = '0'">
                                            <xsl:value-of select="'margin-left:0pt;text-indent:0pt;'"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:text>margin-left:</xsl:text>
                                            <!--18-Mar-18: <xsl:value-of select="@LeftIndent div 2"/>-->
                                            <xsl:value-of select="@LeftIndent"/>
                                            <xsl:text>pt;text-indent:</xsl:text>
                                            <xsl:value-of select="@LeftIndent"/>
                                            <xsl:text>pt</xsl:text>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:if>
                                <xsl:if test="@RightIndent">
                                    <xsl:if test="@Justification | @FirstLineIndent | @LeftIndent">
                                        <xsl:text>;</xsl:text>  
                                    </xsl:if>
                                    <xsl:choose>
                                        <xsl:when test="@RightIndent = '0'">
                                            <xsl:value-of select="'margin-right:0pt;'"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:text>margin-right:</xsl:text>
                                            <!--18-Mar-18: <xsl:value-of select="@RightIndent div 2"/>-->
                                            <xsl:value-of select="@RightIndent"/>
                                            <xsl:text>pt</xsl:text>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:if>
                            </xsl:attribute>
                        </xsl:if>                        
                        <!--<xsl:if test="@Justification">
                            <xsl:attribute name="style">
                            <xsl:if test="@Justification">  
                                <xsl:choose>
                                    <xsl:when test="contains(@Justification, 'Center')">
                                        <xsl:value-of select="'text-align:center'"/>
                                    </xsl:when>
                                    <xsl:when test="contains(@Justification, 'Left')">
                                        <xsl:value-of select="'text-align:left'"/>
                                    </xsl:when>
                                    <xsl:when test="contains(@Justification, 'Right')">
                                        <xsl:value-of select="'text-align:right'"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="'text-align:justify'"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:if>
                            </xsl:attribute>
                        </xsl:if>-->
                        
                        
                        <xsl:if test="string-length($txtFrameId) &gt; 0">
                            <xsl:choose>
                                <xsl:when test="starts-with($txtFrameId,'u')">
                                    <xsl:attribute name="txtFrameId" select="$txtFrameId"/>        
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:attribute name="txtFrameId" select="concat('u',$txtFrameId)"/>
                                </xsl:otherwise>
                            </xsl:choose>
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
                                                                   <xsl:attribute name="w:val" select="replace($Na1,'\\','_')"/>
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
                                       <!--List auto number restart-->
                                       <xsl:copy-of select="$ListNRestart"/>
                                       <xsl:if test="not(child::w:numPr) and @BulletsAndNumberingListType ='NoList'">
                                           <xsl:element name="w:numPr">
                                               <xsl:element name="w:ilvl">
                                                   <xsl:attribute name="w:val" select="'0'"/>
                                               </xsl:element>
                                               <xsl:element name="w:numId">
                                                   <xsl:attribute name="w:val">
                                                       <xsl:value-of select="0"/>
                                                   </xsl:attribute>
                                               </xsl:element>
                                           </xsl:element>
                                       </xsl:if>
                                       <!--List auto number restart-->
                                       
                                       <xsl:if test="not(string-length(@ParaInfo) = 0)">
                                          <!-- <xsl:if test="contains(@ParaInfo,'_TX_')">
                                       <xsl:element name="w:framePr">
                                           <xsl:attribute name="w:w" select="$width"/>
                                           <xsl:attribute name="w:h" select="$height"/>
                                           <xsl:attribute name="w:wrap" select="'around'"/>
                                           <xsl:attribute name="w:vAnchor" select="'page'"/>
                                           <xsl:attribute name="w:hAnchor" select="'page'"/>
                                           <xsl:attribute name="w:x" select="$TX"/>
                                           <xsl:attribute name="w:y" select="$TY"/>
                                       </xsl:element> <!-\-temporarily commented for the word creation purpose 8.9.2015-\->
                                           </xsl:if>-->
                                     </xsl:if>
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
                                   <xsl:choose>
                                       <xsl:when test="(child::CharacterStyleRange/Table)">
                                           <xsl:variable name="id">
                                               <xsl:number level="any"/>
                                           </xsl:variable>
                                           <!-- 17-JAN-19: NEW BOOKMARK logic updated -->
                                           <xsl:variable name="HUD" select="@ParaNumber"/>
                                           <xsl:if test="not(string-length($HUD) =0)">
                                               <xsl:if test="not(contains($HUD,'FTXID'))">
                                                   <xsl:element name="w:bookmarkStart">
                                                       <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                                       <xsl:attribute name="w:id" select="$id"/>
                                                       <xsl:attribute name="w:name" select="$HUD"/>
                                                   </xsl:element>
                                               </xsl:if>
                                           </xsl:if>
                                           <!-- 17-JAN-19: NEW BOOKMARK logic updated -->
                                           <xsl:if test="child::Properties/RuleAboveColor">
                                               <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                               <xsl:variable name="id">
                                                   <xsl:number level="any"/>
                                               </xsl:variable>
                                               <xsl:variable name="HUD">
                                                   <xsl:choose>
                                                       <xsl:when test="contains($NewBKmark,'_TX_')">
                                                           <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                                       </xsl:when>
                                                       <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                                           <xsl:value-of select="$NewBKmark"/>
                                                       </xsl:when>
                                                   </xsl:choose>
                                               </xsl:variable>
                                               <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                                   <xsl:if test="not(string-length($HUD) =0)">
                                                       <xsl:element name="w:bookmarkStart">
                                                           <xsl:attribute name="w:id" select="$id"/>
                                                           <xsl:attribute name="w:name" select="$HUD"/>
                                                       </xsl:element>
                                                   </xsl:if>
                                               </xsl:if>
                                           </xsl:if>                                
                                           <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                                       </xsl:when>
                                       <xsl:otherwise>
                                           <xsl:variable name="id">
                                               <xsl:number level="any"/>
                                           </xsl:variable>
                                           <!-- 17-JAN-19: NEW BOOKMARK logic updated -->
                                           <xsl:variable name="HUD" select="@ParaNumber"/>
                                           <xsl:if test="not(string-length($HUD) =0)">
                                               <xsl:if test="not(contains($HUD,'FTXID'))">
                                                   <xsl:element name="w:bookmarkStart">
                                                       <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                                       <xsl:attribute name="w:id" select="$id"/>
                                                       <xsl:attribute name="w:name" select="$HUD"/>
                                                   </xsl:element>
                                               </xsl:if>
                                           </xsl:if>
                                           <!-- 17-JAN-19: NEW BOOKMARK logic updated -->
                                           <xsl:if test="child::Properties/RuleAboveColor">
                                               <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                               <xsl:variable name="id">
                                                   <xsl:number level="any"/>
                                               </xsl:variable>
                                               <xsl:variable name="HUD">
                                                   <xsl:choose>
                                                       <xsl:when test="contains($NewBKmark,'_TX_')">
                                                           <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                                       </xsl:when>
                                                       <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                                           <xsl:value-of select="$NewBKmark"/>
                                                       </xsl:when>
                                                   </xsl:choose>
                                               </xsl:variable>
                                               <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                                   <xsl:if test="not(string-length($HUD) =0)">
                                                       <xsl:element name="w:bookmarkStart">
                                                           <xsl:attribute name="w:id" select="$id"/>
                                                           <xsl:attribute name="w:name" select="$HUD"/>
                                                       </xsl:element>
                                                   </xsl:if>
                                               </xsl:if>
                                           </xsl:if>                                
                                           <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                                       </xsl:otherwise>
                                   </xsl:choose>
                                   
                        <xsl:if test="(child::CharacterStyleRange/Table)">
                                       <!-- Bookmark end new 21.8.2015 concept -->
                            <!-- Added sorting issue by HyperlinkTextSourceon 10-1-2022 -->
                            <xsl:for-each select="descendant::HyperlinkTextDestination[contains(@BookMarkDestination,'_UUID_') or contains(@BookMarkDestination,'story') or contains(@Name,'_UUID_') or contains(lower-case(@Name),'_story_')][1] | descendant::HyperlinkTextSource[contains(lower-case(@HyperlinkUDestination),'_story_')][1]">
                                           <xsl:variable name="id">
                                               <xsl:number level="any"/>
                                           </xsl:variable>
                                           <xsl:variable name="HUD" select="@ParaNumber"/>
                                    <!-- 16-JAN-19: Hari new logic, see above HUD -->
                                    <xsl:variable name="HUDxxxx">
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
                                           
                                           <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                               <xsl:if test="not(string-length($HUD) =0)">
                                                   <xsl:element name="w:bookmarkEnd">
                                                       <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                                       <xsl:attribute name="w:id" select="$id"/>
                                                   </xsl:element>
                                               </xsl:if>
                                           </xsl:if>
                                           
                                       </xsl:for-each>
                                       <!-- Bookmark end new 21.8.2015 concept -->
                            
                            <!-- 08-May-18: Panneer Boobmark logic -->
                            <!--<Properties>
                                    <RuleAboveColor type="object">Color/S112_2_0_276</RuleAboveColor>
                                </Properties>-->
                            <xsl:if test="child::Properties/RuleAboveColor">
                                <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                <xsl:variable name="id">
                                    <xsl:number level="any"/>
                                </xsl:variable>
                                <xsl:variable name="HUD">
                                    <xsl:choose>
                                        <xsl:when test="contains($NewBKmark,'_TX_')">
                                            <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                        </xsl:when>
                                        <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                            <xsl:value-of select="$NewBKmark"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                    <xsl:if test="not(string-length($HUD) =0)">
                                        <xsl:element name="w:bookmarkEnd">
                                            <xsl:attribute name="w:id" select="$id"/>
                                        </xsl:element>
                                    </xsl:if>
                                </xsl:if>
                            </xsl:if>                                
                            <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                                   </xsl:if>
                                   
                        <xsl:if test="@Justification">
                            <xsl:text disable-output-escaping="yes">&lt;span</xsl:text>
                            <xsl:if test="@Justification">
                                <xsl:text disable-output-escaping="yes"> style="text-align:</xsl:text>  
                                <xsl:choose>
                                    <xsl:when test="contains(@Justification, 'Center')">
                                        <xsl:value-of select="'center'"/>
                                    </xsl:when>
                                    <xsl:when test="contains(@Justification, 'Left')">
                                        <xsl:value-of select="'left'"/>
                                    </xsl:when>
                                    <xsl:when test="contains(@Justification, 'Right')">
                                        <xsl:value-of select="'right'"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="'justify'"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:if>
                            <xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
                        </xsl:if>


                           <xsl:apply-templates/> 
                          
                        
                        
                        
                        <xsl:if test="@Justification">
                            <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                        </xsl:if>
                        
                        
                        <xsl:choose>
                            <xsl:when test="(child::CharacterStyleRange/Table)"/>
                            <xsl:otherwise>
                                <xsl:variable name="id">
                                    <xsl:number level="any"/>
                                </xsl:variable>
                                <!-- 17-JAN-19: NEW BOOKMARK logic updated -->
                                <xsl:variable name="HUD" select="@ParaNumber"/>
                                <xsl:if test="not(string-length($HUD) =0)">
                                    <xsl:if test="not(contains($HUD,'FTXID'))">
                                        <xsl:element name="w:bookmarkEnd">
                                            <!--<xsl:attribute name="w:id" select="$HUD"/>-->
                                            <xsl:attribute name="w:id" select="$id"/>                                            
                                        </xsl:element>
                                    </xsl:if>
                                </xsl:if>
                                <xsl:if test="child::Properties/RuleAboveColor">
                                    <xsl:variable name="NewBKmark" select="substring-after(child::Properties/RuleAboveColor,'Color/')"/>
                                    <xsl:variable name="id">
                                        <xsl:number level="any"/>
                                    </xsl:variable>
                                    <xsl:variable name="HUD">
                                        <xsl:choose>
                                            <xsl:when test="contains($NewBKmark,'_TX_')">
                                                <xsl:value-of select="substring-before($NewBKmark,'_TX_')"/>
                                            </xsl:when>
                                            <xsl:when test="not(contains($NewBKmark,'_TX_'))">
                                                <xsl:value-of select="$NewBKmark"/>
                                            </xsl:when>
                                        </xsl:choose>
                                    </xsl:variable>
                                    <xsl:if test="not(ancestor::Footnote) or not(ancestor::Note)">
                                        <xsl:if test="not(string-length($HUD) =0)">
                                            <xsl:element name="w:bookmarkEnd">
                                                <xsl:attribute name="w:id" select="$id"/>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:if>
                                </xsl:if>                                
                                <!-- 08-May-18: Panneer Boobmark logic ENDS here -->
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:if test="not(child::CharacterStyleRange/Table)">                            
                        </xsl:if>                        
                    </xsl:element>
         <!--</xsl:if>-->
     
         </xsl:otherwise>
     </xsl:choose>
     </xsl:template>
    
    <!--<xsl:function name="num:roman" as="xs:integer">
        <xsl:param name="r" as="xs:string"/>
        <xsl:param name="s"/>
        <xsl:choose>
            <xsl:when test="ends-with($r,'CM')">
                <xsl:sequence select="900 + num:roman(substring($r,1,string-length($r)-2), 900)"/>
            </xsl:when>
            <xsl:when test="ends-with($r,'M')">
                <xsl:sequence select="1000+ num:roman(substring($r,1,string-length($r)-1), 1000)"/>
            </xsl:when>
            <xsl:when test="ends-with($r,'CD')">
                <xsl:sequence select="400+ num:roman(substring($r,1,string-length($r)-2), 400)"/>
            </xsl:when>
            <xsl:when test="ends-with($r,'D')">
                <xsl:sequence select="500+ num:roman(substring($r,1,string-length($r)-1), 500)"/>
            </xsl:when>
            <xsl:when test="ends-with($r,'XC')">
                <xsl:sequence select="90+ num:roman(substring($r,1,string-length($r)-2), 90)"/>
            </xsl:when>
            <xsl:when test="ends-with($r,'C')">
                <xsl:sequence select="(if(100 ge number($s)) then 100 else -100)+ num:roman(substring($r,1,string-length($r)-1), 100)"/>
            </xsl:when>
            <xsl:when test="ends-with($r,'XL')">
                <xsl:sequence select="40+ num:roman(substring($r,1,string-length($r)-2), 40)"/>
            </xsl:when>
            <xsl:when test="ends-with($r,'L')">
                <xsl:sequence select="50+ num:roman(substring($r,1,string-length($r)-1), 50)"/>
            </xsl:when>
            <xsl:when test="ends-with($r,'IX')">
                <xsl:sequence select="9+ num:roman(substring($r,1,string-length($r)-2), 9)"/>
            </xsl:when>
            <xsl:when test="ends-with($r,'X')">
                <xsl:sequence select="(if(10 ge number($s)) then 10 else -10) + num:roman(substring($r,1,string-length($r)-1), 10)"/>
            </xsl:when>
            <xsl:when test="ends-with($r,'IV')">
                <xsl:sequence select="4+ num:roman(substring($r,1,string-length($r)-2), 4)"/>
            </xsl:when>
            <xsl:when test="ends-with($r,'V')">
                <xsl:sequence select="5+ num:roman(substring($r,1,string-length($r)-1), 5)"/>
            </xsl:when>
            <xsl:when test="ends-with($r,'I')">
                <xsl:sequence select="(if(1 ge number($s)) then 1 else -1)+ num:roman(substring($r,1,string-length($r)-1), 1)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="0"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>-->
    
    <xsl:template match="CharacterStyleRange">
        <xsl:variable name="Charstyle">
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
        <xsl:variable name="Charstyle22">
            <xsl:choose>
                <xsl:when test="contains(@AppliedCharacterStyle,'$ID/')">
                    <xsl:value-of select="replace(substring-after(@AppliedCharacterStyle,'$ID/'),' ','_')"/>
                </xsl:when>
                <xsl:when test="contains(@AppliedCharacterStyle,'CharacterStyle/')">
                    <xsl:value-of select="replace(substring-after(@AppliedCharacterStyle,'CharacterStyle/'),' ','_')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="replace(@AppliedCharacterStyle,' ','_')"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="NestedAppliedCharacterStyle">
            <xsl:choose>
                <xsl:when test="contains(@NestedAppliedCharacterStyle,'$ID/')">
                    <xsl:value-of select="substring-after(@NestedAppliedCharacterStyle,'$ID/')"/>
                </xsl:when>
                <xsl:when test="contains(@NestedAppliedCharacterStyle,'CharacterStyle/')">
                    <xsl:value-of select="substring-after(@NestedAppliedCharacterStyle,'CharacterStyle/')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="@NestedAppliedCharacterStyle"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="NestedAppliedCharacterStyle22">
            <xsl:choose>
                <xsl:when test="contains(@NestedAppliedCharacterStyle,'$ID/')">
                    <xsl:value-of select="replace(substring-after(@NestedAppliedCharacterStyle,'$ID/'),' ','_')"/>
                </xsl:when>
                <xsl:when test="contains(@NestedAppliedCharacterStyle,'CharacterStyle/')">
                    <xsl:value-of select="replace(substring-after(@NestedAppliedCharacterStyle,'CharacterStyle/'),' ','_')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="replace(@NestedAppliedCharacterStyle,' ','_')"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="FST" select="@FontStyle"/>
        <xsl:variable name="PT" select="@Position"/>
        <xsl:variable name="Cap" select="@Capitalization"/>
        <xsl:variable name="UL" select="@Underline"/>
        <xsl:variable name="Charstyle2">
            <xsl:if test="$FST,'[\s]'">
                <xsl:value-of select="replace($FST, ' ', '_')"/>
            </xsl:if>
            <xsl:if test="$PT,'[\s]'">
                <xsl:value-of select="replace($PT, ' ', '_')"/>
            </xsl:if>
            <xsl:if test="$Cap,'[\s]'">
                <xsl:value-of select="replace($Cap, ' ', '_')"/>
            </xsl:if>
            <xsl:if test="$UL,'[\s]'">
                <xsl:value-of select="replace($UL, ' ', '_')"/>
            </xsl:if>
        </xsl:variable>
        <xsl:variable name="Charstyle0" select="lower-case($Charstyle2)"/>
        <xsl:variable name="Track" select="@Tracking"/>        
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
        <xsl:variable name="Na22">
            <xsl:choose>
                <xsl:when test="contains(@NestedAppliedCharacterStyle,'$ID/')">
                    <xsl:value-of select="substring-after(@NestedAppliedCharacterStyle,'$ID/')"/>
                </xsl:when>
                <xsl:when test="contains(@NestedAppliedCharacterStyle,'CharacterStyle/')">
                    <xsl:value-of select="substring-after(@NestedAppliedCharacterStyle,'CharacterStyle/')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="@NestedAppliedCharacterStyle"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="PS" select="@PointSize"/>
        <xsl:variable name="C1" select="@Capitalization"/>
        <xsl:variable name="Track1" select="($Track div 100) * 20"/>
        <xsl:variable name="Kern" select="@KerningValue"/>
        <xsl:variable name="PCharCount" select="count(preceding-sibling::CharacterStyleRange)"/>
        <xsl:variable name="FCharCount" select="count(following-sibling::CharacterStyleRange)"/>
        <xsl:variable name="curRun" select="self::*"/>
        <xsl:variable name="CC">
            <xsl:for-each select="child::XMLElement/XMLAttribute">
                <xsl:choose>
                    <xsl:when test="@Name = 'ContentControl'">
                        <xsl:value-of select="concat(@Name,@Value)"/>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>                
        </xsl:variable>
                 
        <!--<xsl:if test="descendant::Content">-->

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
                                                <xsl:value-of select="replace($Na,'\\','_')"/>
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
                    </xsl:variable>
                    <xsl:variable name="asn">
                        <!--                                        new update 28.9.2016-->
                        <xsl:variable name="styleName" select="substring-after(@NestedAppliedCharacterStyle,'CharacterStyle/')"/>
                        <xsl:choose>
                            <xsl:when test="matches($Na22,'[\W\s]')">
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
                                            <xsl:when test="contains($Na22,'%3a')">
                                                <xsl:variable name="Pf" select="replace($Na22,'%3a',':')"/>
                                                <xsl:value-of select="tokenize($Pf, '/')[last()]"/>
                                            </xsl:when>
                                            <xsl:when test="contains($Na22,'\')">
                                                <xsl:value-of select="replace($Na22,'\\','_')"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="$Na22"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="$Na22"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    
                    <xsl:attribute name="w:val">
                        <xsl:choose>
                            <!--updated for style with space issue on 26-08-2021-->
                            <xsl:when test="@PCLink">
                                <!--<xsl:value-of select="concat($csn,@PCLink,' ',$asn)"/>-->
                                <xsl:value-of select="concat($csn,@PCLink)"/>
                                <xsl:if test="string-length($asn) &gt; 0">
                                    <xsl:value-of select="concat(' ',$asn)"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:otherwise>
                                <!--<xsl:value-of select="concat($csn,' ',$asn)"/>-->
                                <xsl:value-of select="$csn"/>
                                <xsl:if test="string-length($asn) &gt; 0">
                                    <xsl:value-of select="concat(' ',$asn)"/>
                                </xsl:if>
                            </xsl:otherwise>
                        </xsl:choose>
                        <!--<xsl:choose>
                            <xsl:when test="@PCLink">
                                <xsl:value-of select="concat($csn,@PCLink)"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="$csn"/>
                            </xsl:otherwise>
                        </xsl:choose>-->
                    </xsl:attribute>                    
                </xsl:element>
                <!--<xsl:choose>
                                    <xsl:when test="child::Rectangle">
                                        <xsl:element name="w:noProof"/>
                                    </xsl:when>
                                </xsl:choose>-->
                <!-- <xsl:if test="@Tracking">
                                <xsl:element name="w:spacing">
                                    <xsl:attribute name="w:val" select="$Track1"/>
                                </xsl:element>
                            </xsl:if>    --> 
                <!--********* <xsl:choose>
                    <xsl:when test="@FontStyle and Properties/AppliedFont">
                        <xsl:element name="w:rFonts">
                            <xsl:attribute name="w:ascii" select="concat(Properties/AppliedFont, ' ', @FontStyle)"/>
                            <xsl:attribute name="w:hAnsi" select="concat(Properties/AppliedFont, ' ', @FontStyle)"/>                        
                        </xsl:element>
                    </xsl:when>
                    <xsl:when test="Properties/AppliedFont">
                        <xsl:element name="w:rFonts">
                            <xsl:attribute name="w:ascii" select="Properties/AppliedFont"/>
                            <xsl:attribute name="w:hAnsi" select="Properties/AppliedFont"/>                        
                        </xsl:element> 
                    </xsl:when>
                </xsl:choose>-->
                
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
                <!--                            <w:bCs/>-->
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
                <!--                            <w:iCs/>-->
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
                <!--                            <w:dstrike/>-->
                <!--*********************Font Color****************************************************************-->
                <!--            <xsl:if test="self::CharacterStyleRange/@FillColor">-->
                <xsl:variable name="FC">
                    <xsl:variable name="color" select="@FillColor"/>
                    <xsl:choose>
                        <xsl:when test="$color = 'Color/Paper'">                            
                            <xsl:value-of select="'FFFFFF'"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:call-template name="color">
                                <xsl:with-param name="colorName" select="$color"/>
                            </xsl:call-template>
                        </xsl:otherwise>
                    </xsl:choose>
                    <!--<xsl:call-template name="color">
                        <xsl:with-param name="colorName" select="$color"/>
                    </xsl:call-template>-->
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
                        <!--<xsl:attribute name="w:val" select="$FS * 2"/>-->
                        <xsl:attribute name="w:val" select="round($PS * 2)"/>
                    </xsl:element>
                </xsl:if>
                <!--                            <w:szCs w:val=""/>-->
                <xsl:if test="./@AppliedConditions = 'Condition/Condition%201'">
                    <xsl:element name="w:highlight">
                        <xsl:attribute name="w:val" select="'lightGray'"/>
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
                
                <xsl:if test="@Underline ='false'">
                    <xsl:element name="w:u">
                        <xsl:attribute name="w:val" select="'none'"/>
                    </xsl:element>
                </xsl:if>
                <!--
                            <w:effect w:val="antsBlack"/>
                            <w:bdr w:val="apples"/>
                            <w:shd w:val="diagCross"/>
                            <w:fitText w:val="2"/>-->
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
            
        <xsl:choose>
            <xsl:when test="contains($Charstyle,'[No character style]') and @FontStyle and @Position and @Capitalization and @Underline">
                <!--<xsl:if test="@FontStyle">
                    <xsl:element name="{@FontStyle}">
                        <xsl:apply-templates/>
                    </xsl:element>
                </xsl:if>
                <xsl:if test="@Position">
                    <xsl:element name="{@Position}">
                        <xsl:apply-templates/>
                    </xsl:element>
                </xsl:if>
                <xsl:if test="@Capitalization">
                    <xsl:element name="{@Capitalization}">
                        <xsl:apply-templates/>
                    </xsl:element>
                </xsl:if>
                <xsl:if test="@Underline">
                    <xsl:element name="{@Underline}">
                        <xsl:apply-templates/>
                    </xsl:element>
                </xsl:if>-->
                
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="span">
                    <xsl:choose>
                        <xsl:when test="@NestedAppliedCharacterStyle">
                            <xsl:attribute name="class">
                                <xsl:variable name="className" select="translate($Charstyle, ' /\[\]@#','_')"/>
                                <xsl:variable name="className1" select="translate($NestedAppliedCharacterStyle, ' /\[\]@#','_')"/>
                                <xsl:choose>
                                    <xsl:when test="matches($className, '^([0-9]+)/')">
                                        <xsl:value-of select="replace($className, '^([0-9]+)/','IDMLnumslash')"/>
                                    </xsl:when>
                                    <xsl:when test="matches($className, '^([0-9]+)$')">
                                        <xsl:value-of select="concat('IDMLnum',$className)"/>
                                    </xsl:when>
                                    
                                    <xsl:when test="matches($className, '^[0-9]')">
                                        <xsl:value-of select="replace($className, '^([0-9]+)','_')"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="$className"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:text> </xsl:text>
                                <xsl:choose>
                                    <xsl:when test="matches($className1, '^([0-9]+)/')">
                                        <xsl:value-of select="replace($className1, '^([0-9]+)/','IDMLnumslash')"/>
                                    </xsl:when>
                                    <xsl:when test="matches($className1, '^([0-9]+)$')">
                                        <xsl:value-of select="concat('IDMLnum',$className1)"/>
                                    </xsl:when>
                                    
                                    <xsl:when test="matches($className1, '^[0-9]')">
                                        <xsl:value-of select="replace($className1, '^([0-9]+)','_')"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="$className1"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <!--<xsl:value-of select="translate($Charstyle, ' /\[\]@','')"/>                 -->       
                            </xsl:attribute>
                            <!--<xsl:attribute name="data-nestedStyle" select="$NestedAppliedCharacterStyle"/>-->
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:attribute name="class">
                                <xsl:variable name="className" select="translate($Charstyle, ' /\[\]@#','_')"/>
                                <xsl:choose>
                                    <xsl:when test="matches($className, '^([0-9]+)/')">
                                        <xsl:value-of select="replace($className, '^([0-9]+)/','IDMLnumslash')"/>
                                    </xsl:when>
                                    <xsl:when test="matches($className, '^([0-9]+)$')">
                                        <xsl:value-of select="concat('IDMLnum',$className)"/>
                                    </xsl:when>
                                    
                                    <xsl:when test="matches($className, '^[0-9]')">
                                        <xsl:value-of select="replace($className, '^([0-9]+)','_')"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="$className"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <!--<xsl:value-of select="translate($Charstyle, ' /\[\]@','')"/>                 -->       
                            </xsl:attribute>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="@NestedAppliedCharacterStyle">
                            <xsl:attribute name="data-name">
                                <xsl:value-of select="$NestedAppliedCharacterStyle"/>
                            </xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:attribute name="data-name">
                                <xsl:value-of select="$Charstyle"/>
                            </xsl:attribute>
                        </xsl:otherwise>
                    </xsl:choose>
                                        
                    <!-- 21-JAN-19: GENERIC: Conditional Text informations by Bhaskar; called "designmap.xml" -->
                    <xsl:if test="@AppliedConditions">
                        <xsl:variable name="oversetColor">
                            <xsl:if test="$designmap//Condition[@Self= 'Condition/Overset']">
                                <xsl:value-of select="$designmap//Condition[@Self= 'Condition/Overset']/Properties/IndicatorColor"></xsl:value-of>
                            </xsl:if>
                            <xsl:if test="$designmap//Condition[@Self= 'Condition/UnderlineSolid']">
                                <xsl:value-of select="$designmap//Condition[@Self= 'Condition/UnderlineSolid']/Properties/IndicatorColor"></xsl:value-of>
                            </xsl:if>
                            <xsl:if test="$designmap//Condition[@Self= 'Condition/UnderlineDash']">
                                <xsl:value-of select="$designmap//Condition[@Self= 'Condition/UnderlineDash']/Properties/IndicatorColor"></xsl:value-of>
                            </xsl:if>
                        </xsl:variable>
                        
                        
                        <xsl:choose>
                            <xsl:when test="@AppliedConditions = 'Condition/Overset'">
                                <xsl:attribute name="style">
                                    <xsl:text>background:</xsl:text>
                                    <xsl:value-of select="$oversetColor"/>
                                </xsl:attribute>
                            </xsl:when>
                            <xsl:when test="@AppliedConditions = 'Condition/UnderlineSolid'">
                                <xsl:attribute name="style">
                                    <xsl:text>border-bottom:1px solid </xsl:text>
                                    <xsl:value-of select="$oversetColor"/>
                                </xsl:attribute>
                            </xsl:when>
                            <xsl:when test="@AppliedConditions = 'Condition/UnderlineDash'">
                                <xsl:attribute name="style">
                                    <xsl:text>border-bottom:1px dashed </xsl:text>
                                    <xsl:value-of select="$oversetColor"/>
                                </xsl:attribute>
                            </xsl:when>
                            <xsl:when test="@AppliedConditions = 'Condition/UnderlineWavy'">
                                <xsl:attribute name="style">
                                    <xsl:text>border-bottom:1px dotted </xsl:text>
                                    <xsl:value-of select="$oversetColor"/>
                                </xsl:attribute>
                            </xsl:when>
                            <xsl:otherwise>                               
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:if>
                    <!--Added on 23-08-2021 uppercase missing in wycywyg-->
                    <xsl:if test="contains(@Capitalization, 'AllCaps')">
                    <xsl:attribute name="style">
                    <xsl:value-of select="'text-transform: uppercase;'"/>
                    </xsl:attribute>   
                    </xsl:if>
                    
                    
       <!-- 21-JAN-19: GENERIC: Conditional Text informations by Bhaskar; called "designmap.xml" -->
                    <!--commented for marriapn editor i/i issue on 12-3-2021-->
                   <!-- <xsl:if test="@Justification | @FirstLineIndent | @LeftIndent | @RightIndent | @FontStyle | @Capitalization | @Position">
                        <xsl:attribute name="style">
                            <xsl:if test="@Justification">  
                                <xsl:choose>
                                    <xsl:when test="contains(@Justification, 'Center')">
                                        <xsl:value-of select="'text-align:center'"/>
                                    </xsl:when>
                                    <xsl:when test="contains(@Justification, 'Left')">
                                        <xsl:value-of select="'text-align:left'"/>
                                    </xsl:when>
                                    <xsl:when test="contains(@Justification, 'Right')">
                                        <xsl:value-of select="'text-align:right'"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="'text-align:justify'"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:if>                                
                            <xsl:if test="@FirstLineIndent">
                                <xsl:if test="@Justification">
                                    <xsl:text>;</xsl:text>  
                                </xsl:if>
                                <xsl:choose>
                                    <xsl:when test="@FirstLineIndent = '0'">
                                        <xsl:value-of select="'text-indent:0pt;'"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:text>text-indent:</xsl:text>
                                        <xsl:value-of select="@FirstLineIndent"/>
                                        <xsl:text>pt</xsl:text>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:if>
                            <xsl:if test="@LeftIndent">
                                <xsl:if test="@Justification | @FirstLineIndent">
                                    <xsl:text>;</xsl:text>  
                                </xsl:if>
                                <xsl:choose>
                                    <xsl:when test="@LeftIndent = '0'">
                                        <xsl:value-of select="'text-align:0pt;'"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:text>text-align:</xsl:text>
                                        <xsl:value-of select="@LeftIndent"/>
                                        <xsl:text>pt</xsl:text>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:if>
                            <xsl:if test="@RightIndent">
                                <xsl:if test="@Justification | @FirstLineIndent | @LeftIndent">
                                    <xsl:text>;</xsl:text>  
                                </xsl:if>
                                <xsl:choose>
                                    <xsl:when test="@RightIndent = '0'">
                                        <xsl:value-of select="'text-align:0pt;'"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:text>text-align:</xsl:text>
                                        <xsl:value-of select="@RightIndent"/>
                                        <xsl:text>pt</xsl:text>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:if>
                            <xsl:if test="@FontStyle">
                                <xsl:if test="@Justification | @FirstLineIndent | @LeftIndent | @RightIndent">
                                    <xsl:text>;</xsl:text>  
                                </xsl:if>
                                <xsl:choose>
                                    <xsl:when test="(contains(@FontStyle, 'Bold') or contains(@FontStyle, 'Medium') or contains(@FontStyle, 'Heavy')) and (contains(@FontStyle, 'Italic') or contains(@FontStyle, 'Oblique'))">
                                        <xsl:value-of select="'font-style:italic;font-weight:bold;'"/>
                                    </xsl:when>
                                    <xsl:when test="contains(@FontStyle, 'Bold') or contains(@FontStyle, 'Medium') or contains(@FontStyle, 'Heavy')">
                                        <xsl:value-of select="'font-weight:bold;'"/>
                                    </xsl:when>
                                    <xsl:when test="contains(@FontStyle, 'Italic') or contains(@FontStyle, 'Oblique')">
                                        <xsl:value-of select="'font-style:italic;'"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="'font-style:normal;font-weight:normal;font-variant:normal'"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:if>
                            <xsl:if test="@Capitalization">
                                <xsl:if test="@Justification | @FirstLineIndent | @LeftIndent | @RightIndent | @FontStyle">
                                    <xsl:text>;</xsl:text>  
                                </xsl:if>
                                <xsl:choose>
                                    <xsl:when test="(contains(@Capitalization, 'SmallCaps'))">
                                        <xsl:value-of select="'font-variant:small-caps;'"/>
                                    </xsl:when>
                                    <xsl:when test="contains(@Capitalization, 'AllCaps')">
                                        <xsl:value-of select="'text-transform: uppercase;'"/>
                                    </xsl:when>                                    
                                    <xsl:otherwise>
                                        <xsl:value-of select="'text-transform: none;font-variant: none;'"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:if>
                            <xsl:if test="@Position">
                                <xsl:if test="@Justification | @FirstLineIndent | @LeftIndent | @RightIndent | @FontStyle | @Capitalization">
                                    <xsl:text>;</xsl:text>  
                                </xsl:if>
                                <xsl:choose>
                                    <xsl:when test="(contains(@Position, 'Superscript'))">
                                        <xsl:value-of select="'vertical-align: super;font-size: 80%;'"/>
                                    </xsl:when>
                                    <xsl:when test="contains(@Position, 'Subscript')">
                                        <xsl:value-of select="'vertical-align: sub;font-size: 80%;'"/>
                                    </xsl:when>                                    
                                    <xsl:otherwise>
                                        <xsl:value-of select="'vertical-align:baseline;'"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:if>
                        </xsl:attribute>
                    </xsl:if>-->
                    <!--<xsl:if test="not(contains($Charstyle0,'bold') or contains($Charstyle0,'medium')  or contains($Charstyle0,'heavy') or contains($Charstyle0,'italic') or contains($Charstyle0,'oblique'))">
                        <xsl:attribute name="style">
                            <xsl:value-of select="'font-style:normal;font-weight:normal;font-variant:normal'"/>
                        </xsl:attribute>                                    
                    </xsl:if>-->
                    <!--<xsl:if test="$Charstyle0">-->
                    <!-- 10-May-19: If "MathToolsML" att. presents -->
                    <xsl:if test="@MathToolsML != ''">
                        <xsl:text disable-output-escaping="yes">&lt;math</xsl:text>
                        <xsl:value-of select="substring-after(@MathToolsML,'math')" disable-output-escaping="yes"/>
                    </xsl:if> 
                    <!-- 10-May-19: If "MathToolsML" att. presents -->
                    <!--commented for marriapn editor i/i issue on 12-3-2021-->
                        <xsl:choose>
                            <xsl:when test="contains($Charstyle0,'smallcaps') or contains($Charstyle0,'allcaps') or @Underline = 'true' or StrikeThru='true' or  contains($Charstyle0,'heavy') or  contains($Charstyle0,'bold') or contains($Charstyle0,'italic') or contains($Charstyle0,'oblique')">
                               <!-- <xsl:if test="contains($Charstyle0,'smallcaps')">
                                    <xsl:text disable-output-escaping="yes">&lt;</xsl:text>
                                    <xsl:value-of select="'sc'"/>
                                    <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                                </xsl:if>-->
                                <!--<xsl:if test="contains($Charstyle0,'allcaps')">
                                    <xsl:text disable-output-escaping="yes">&lt;</xsl:text>
                                    <xsl:value-of select="'sc'"/>
                                    <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                                </xsl:if>-->								
                                <!--<xsl:if test="@Underline ='true'">
                                    <xsl:text disable-output-escaping="yes">&lt;u&gt;</xsl:text>
                                </xsl:if>-->
                                <!-- uncommented strike thru missing issue on 17-5-2022 -->
                                <!--<xsl:if test="@StrikeThru='true'">
                                    <xsl:text disable-output-escaping="yes">&lt;</xsl:text>
                                    <xsl:value-of select="'strike'"/>
                                    <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                                </xsl:if>-->
                                <xsl:if test="contains($Charstyle0,'bold') or contains($Charstyle0,'medium')  or contains($Charstyle0,'heavy')">
                                    <xsl:text disable-output-escaping="yes">&lt;</xsl:text>
                                    <xsl:value-of select="'b'"/>
                                    <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                                </xsl:if>
                                <xsl:if test="contains($Charstyle0,'italic') or contains($Charstyle0,'oblique')">
                                    <xsl:text disable-output-escaping="yes">&lt;</xsl:text>
                                    <xsl:value-of select="'i'"/>
                                    <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                                </xsl:if>							
                                <!--<xsl:if test="contains($Charstyle0,'superscript')">
                                    <xsl:text disable-output-escaping="yes">&lt;</xsl:text>
                                    <xsl:value-of select="'sup'"/>
                                    <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                                </xsl:if>	
                                <xsl:if test="contains($Charstyle0,'subscript')">
                                    <xsl:text disable-output-escaping="yes">&lt;</xsl:text>
                                    <xsl:value-of select="'Sub'"/>
                                    <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                                </xsl:if>-->
                                <!-- Added to avoid the smallcaps information here(contains($Charstyle0,'allcaps')) on 27-1-2022 -->
                                            <xsl:choose>
                                                <xsl:when test="lower-case($Charstyle0)='allcaps'">
                                                    <!--<xsl:value-of select="upper-case(.)"/>-->
                                                    <xsl:if test="@FontStyle">
                                                        <xsl:text disable-output-escaping="yes">&lt;span class="</xsl:text>
                                                        <xsl:value-of select="@FontStyle"/>
                                                        <!-- data-name also added on 27-1-2022 -->
                                                        <xsl:text disable-output-escaping="yes">" data-name="</xsl:text>
                                                        <xsl:value-of select="@FontStyle"/>
                                                        <xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
                                                    </xsl:if>
                                                    <xsl:apply-templates/>
                                                    <xsl:if test="@FontStyle">
                                                        <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                                                    </xsl:if>
                                                </xsl:when>
                                                <!-- Added to avoid the duplicate endnote number by formatting on 11-1-2023 Azure 6050 -->
                                                <xsl:when test="self::CharacterStyleRange[contains($Charstyle0,'smallcaps') or contains($Charstyle0,'allcaps') or @Underline = 'true' or StrikeThru='true' or  contains($Charstyle0,'heavy') or  contains($Charstyle0,'bold') or contains($Charstyle0,'italic') or contains($Charstyle0,'oblique')][substring-after(@AppliedCharacterStyle,'CharacterStyle/')='endnotereference' or substring-after(@AppliedCharacterStyle,'CharacterStyle/')='endnote reference'][string-length(.) &gt; 0]">
                                                    <xsl:choose>
                                      
                                                    <xsl:when test="parent::XMLElement[substring-after(@MarkupTag,'XMLTag/')='endnote_reference' or substring-after(@MarkupTag,'XMLTag/')='endnotereference' or substring-after(@MarkupTag,'XMLTag/')='endnote reference'][descendant::XMLAttribute[contains(@Self,'XMLAttributenid') or contains(@Self,'XMLAttributenhref')]] or descendant::XMLElement[substring-after(@MarkupTag,'XMLTag/')='endnote_reference' or substring-after(@MarkupTag,'XMLTag/')='endnotereference' or substring-after(@MarkupTag,'XMLTag/')='endnote reference'][descendant::XMLAttribute[contains(@Self,'XMLAttributenid') or contains(@Self,'XMLAttributenhref')]]">
                                                        <xsl:element name="a">
                                                            <!-- Added for marriapan edior on 22-02-2022 -->
                                                            <xsl:attribute name="class" select="'endnotecitation'"/>
                                                            <xsl:attribute name="data-type" select="'number'"/>
                                                            <!-- End -->
                                                            <xsl:attribute name="id">
                                                                <!--<xsl:value-of select="parent::XMLElement[substring-after(@MarkupTag,'XMLTag/')='endnote_reference' or substring-after(@MarkupTag,'XMLTag/')='endnotereference' or substring-after(@MarkupTag,'XMLTag/')='endnote reference']/descendant::XMLAttribute[contains(@Self,'XMLAttributenid')]/@Value"/>-->
                                                                <xsl:choose>
                                                                    <xsl:when test="parent::XMLElement[substring-after(@MarkupTag,'XMLTag/')='endnote_reference' or substring-after(@MarkupTag,'XMLTag/')='endnotereference' or substring-after(@MarkupTag,'XMLTag/')='endnote reference']/descendant::XMLAttribute[contains(@Self,'XMLAttributenid')]">
                                                                        <xsl:value-of select="parent::XMLElement[substring-after(@MarkupTag,'XMLTag/')='endnote_reference' or substring-after(@MarkupTag,'XMLTag/')='endnotereference' or substring-after(@MarkupTag,'XMLTag/')='endnote reference']/descendant::XMLAttribute[contains(@Self,'XMLAttributenid')]/@Value"/>
                                                                    </xsl:when>
                                                                    <xsl:otherwise>
                                                                        <xsl:value-of select="descendant::XMLElement[substring-after(@MarkupTag,'XMLTag/')='endnote_reference' or substring-after(@MarkupTag,'XMLTag/')='endnotereference' or substring-after(@MarkupTag,'XMLTag/')='endnote reference']/descendant::XMLAttribute[contains(@Self,'XMLAttributenid')]/@Value"/>
                                                                    </xsl:otherwise>
                                                                </xsl:choose>
                                                            </xsl:attribute>
                                                            <xsl:attribute name="href">
                                                                <!--<xsl:value-of select="parent::XMLElement[substring-after(@MarkupTag,'XMLTag/')='endnote_reference' or substring-after(@MarkupTag,'XMLTag/')='endnotereference' or substring-after(@MarkupTag,'XMLTag/')='endnote reference']/descendant::XMLAttribute[contains(@Self,'XMLAttributenhref')]/@Value"/>-->
                                                                <xsl:choose>
                                                                    <xsl:when test="parent::XMLElement[substring-after(@MarkupTag,'XMLTag/')='endnote_reference' or substring-after(@MarkupTag,'XMLTag/')='endnotereference' or substring-after(@MarkupTag,'XMLTag/')='endnote reference']/descendant::XMLAttribute[contains(@Self,'XMLAttributenhref')]">
                                                                        <xsl:value-of select="parent::XMLElement[substring-after(@MarkupTag,'XMLTag/')='endnote_reference' or substring-after(@MarkupTag,'XMLTag/')='endnotereference' or substring-after(@MarkupTag,'XMLTag/')='endnote reference']/descendant::XMLAttribute[contains(@Self,'XMLAttributenhref')]/@Value"/>
                                                                    </xsl:when>
                                                                    <xsl:otherwise>
                                                                        <xsl:value-of select="descendant::XMLElement[substring-after(@MarkupTag,'XMLTag/')='endnote_reference' or substring-after(@MarkupTag,'XMLTag/')='endnotereference' or substring-after(@MarkupTag,'XMLTag/')='endnote reference']/descendant::XMLAttribute[contains(@Self,'XMLAttributenhref')]/@Value"/>
                                                                    </xsl:otherwise>
                                                                </xsl:choose>
                                                            </xsl:attribute>
                                                            <!-- Added to avoid the endnote property value Azure 10030 on 28-08-2023 -->
                                                            <!--<xsl:value-of select="."/>-->
                                                            <xsl:for-each select="descendant::Content">
                                                            <xsl:value-of select="."/>
                                                            </xsl:for-each>
                                                        </xsl:element>
                                                        <!-- Added to retained except endnotenumber text on Azure 14495 on 06-05-2024-->
                                                    </xsl:when>
                                                        <xsl:otherwise><xsl:apply-templates/></xsl:otherwise>
                                                    </xsl:choose>
                                                </xsl:when>                                            
    
                                                <xsl:when test="self::CharacterStyleRange[contains($Charstyle0,'smallcaps') or contains($Charstyle0,'allcaps') or @Underline = 'true' or StrikeThru='true' or  contains($Charstyle0,'heavy') or  contains($Charstyle0,'bold') or contains($Charstyle0,'italic') or contains($Charstyle0,'oblique')][substring-after(@AppliedCharacterStyle,'CharacterStyle/')='EndnoteNumber' or substring-after(@AppliedCharacterStyle,'CharacterStyle/')='EndnoteNumber'][string-length(.) &gt; 0]">
                                                    <xsl:choose>
                                                        
                                                    
                                                    <xsl:when test="parent::XMLElement[substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber' or substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber'][descendant::XMLAttribute[contains(@Self,'XMLAttributenid') or contains(@Self,'XMLAttributenhref')]] or descendant::XMLElement[substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber' or substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber'][descendant::XMLAttribute[contains(@Self,'XMLAttributenid') or contains(@Self,'XMLAttributenhref')]] or descendant::XMLElement[substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber' or substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber'][descendant::XMLAttribute[contains(@Self,'XMLAttributenid') or contains(@Self,'XMLAttributenhref')]] or descendant::XMLElement[substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber' or substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber'][descendant::XMLAttribute[contains(@Self,'XMLAttributenid') or contains(@Self,'XMLAttributenhref')]]">
                                                        <xsl:element name="a">
                                                            <!-- Added for marriapan edior on 22-02-2022 -->
                                                            <xsl:attribute name="class" select="'crossref'"/>
                                                            <xsl:attribute name="data-type" select="'number'"/>
                                                            <!-- End -->
                                                            <xsl:attribute name="id">
                                                                <!--<xsl:value-of select="parent::XMLElement[substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber' or substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber']/descendant::XMLAttribute[contains(@Self,'XMLAttributenid')]/@Value"/>-->
                                                                <xsl:choose>
                                                                    <xsl:when test="parent::XMLElement[substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber' or substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber']/descendant::XMLAttribute[contains(@Self,'XMLAttributenid')]">
                                                                        <xsl:value-of select="parent::XMLElement[substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber' or substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber']/descendant::XMLAttribute[contains(@Self,'XMLAttributenid')]/@Value"/>
                                                                    </xsl:when>
                                                                   <xsl:otherwise>
                                                                       <xsl:value-of select="descendant::XMLElement[substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber' or substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber']/descendant::XMLAttribute[contains(@Self,'XMLAttributenid')]/@Value"/>
                                                                   </xsl:otherwise>
                                                                </xsl:choose>
                                                            </xsl:attribute>
                                                            <xsl:attribute name="href">
                                                                <!--<xsl:value-of select="parent::XMLElement[substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber' or substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber']/descendant::XMLAttribute[contains(@Self,'XMLAttributenhref')]/@Value"/>-->
                                                                <xsl:choose>
                                                                    <xsl:when test="parent::XMLElement[substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber' or substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber']/descendant::XMLAttribute[contains(@Self,'XMLAttributenhref')]">
                                                                        <xsl:value-of select="parent::XMLElement[substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber' or substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber']/descendant::XMLAttribute[contains(@Self,'XMLAttributenhref')]/@Value"/>
                                                                    </xsl:when>
                                                                    <xsl:otherwise>
                                                                        <xsl:value-of select="descendant::XMLElement[substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber' or substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber']/descendant::XMLAttribute[contains(@Self,'XMLAttributenhref')]/@Value"/>
                                                                    </xsl:otherwise>
                                                                </xsl:choose>
                                                            </xsl:attribute>
                                                            <xsl:for-each select="descendant::Content">
                                                                <xsl:value-of select="."/>
                                                            </xsl:for-each>
                                                        </xsl:element>
                                                    </xsl:when>
                                                        <!-- Added to retained except endnotenumber text on Azure 14495 on 06-05-2024-->
                                                        <xsl:otherwise><xsl:apply-templates/></xsl:otherwise>
                                                    </xsl:choose>
                                                </xsl:when>
                                                <!-- End -->
                                                <xsl:otherwise>
                                                    <xsl:apply-templates/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                
                                <!--<xsl:if test="contains($Charstyle0,'subscript')">
                                    <xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
                                    <xsl:value-of select="'Sub'"/>
                                    <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                                </xsl:if>
                                <xsl:if test="contains($Charstyle0,'superscript')">
                                    <xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
                                    <xsl:value-of select="'sup'"/>
                                    <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                                </xsl:if>-->	
                                <xsl:if test="contains($Charstyle0,'italic') or contains($Charstyle0,'oblique')">
                                    <xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
                                    <xsl:value-of select="'i'"/>
                                    <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                                </xsl:if>							
                                <xsl:if test="contains($Charstyle0,'bold') or contains($Charstyle0,'medium')  or contains($Charstyle0,'heavy')">
                                    <xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
                                    <xsl:value-of select="'b'"/>
                                    <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                                </xsl:if>
                                <!--<xsl:if test="@StrikeThru='true'">
                                    <xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
                                    <xsl:value-of select="'strike'"/>
                                    <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                                </xsl:if>-->		
                                <!--<xsl:if test="@Underline = 'true'">
                                    <xsl:text disable-output-escaping="yes">&lt;/u&gt;</xsl:text>
                                </xsl:if>									
                                <!-\-<xsl:if test="contains($Charstyle0,'allcaps')">
                                    <xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
                                    <xsl:value-of select="'sc'"/>
                                    <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                                </xsl:if>-\->
                                <xsl:if test="contains($Charstyle0,'smallcaps')">
                                    <xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
                                    <xsl:value-of select="'sc'"/>
                                    <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                                </xsl:if>-->
                                
                            </xsl:when>
                            
                        <xsl:otherwise>
                            <xsl:apply-templates/>
                        </xsl:otherwise>
                        </xsl:choose>
                    <!--</xsl:if>-->
                    <!-- Added to retain the endnotes id's on 8-7-2022 -->
                    <!--<xsl:if test="self::CharacterStyleRange[not(contains($Charstyle0,'smallcaps') or contains($Charstyle0,'allcaps') or @Underline = 'true' or StrikeThru='true' or  contains($Charstyle0,'heavy') or  contains($Charstyle0,'bold') or contains($Charstyle0,'italic') or contains($Charstyle0,'oblique'))][substring-after(@AppliedCharacterStyle,'CharacterStyle/')='endnotereference' or substring-after(@AppliedCharacterStyle,'CharacterStyle/')='endnote reference'][string-length(.) &gt; 0]">
                        <xsl:message>ki</xsl:message>
                        <xsl:if test="parent::XMLElement[substring-after(@MarkupTag,'XMLTag/')='endnote_reference' or substring-after(@MarkupTag,'XMLTag/')='endnotereference' or substring-after(@MarkupTag,'XMLTag/')='endnote reference'][descendant::XMLAttribute[contains(@Self,'XMLAttributenid') or contains(@Self,'XMLAttributenhref')]] or descendant::XMLElement[substring-after(@MarkupTag,'XMLTag/')='endnote_reference' or substring-after(@MarkupTag,'XMLTag/')='endnotereference' or substring-after(@MarkupTag,'XMLTag/')='endnote reference'][descendant::XMLAttribute[contains(@Self,'XMLAttributenid') or contains(@Self,'XMLAttributenhref')]][1]">
                            <xsl:element name="a">
                            <!-\- Added for marriapan edior on 22-02-2022 -\->
                            <xsl:attribute name="class" select="'endnotecitation'"/>
                            <xsl:attribute name="data-type" select="'number'"/>
                            <!-\- End -\->
                            <xsl:attribute name="id">
                                <!-\-<xsl:value-of select="parent::XMLElement[substring-after(@MarkupTag,'XMLTag/')='endnote_reference' or substring-after(@MarkupTag,'XMLTag/')='endnotereference' or substring-after(@MarkupTag,'XMLTag/')='endnote reference']/descendant::XMLAttribute[contains(@Self,'XMLAttributenid')]/@Value"/>-\->
                                <xsl:choose>
                                    <xsl:when test="parent::XMLElement[substring-after(@MarkupTag,'XMLTag/')='endnote_reference' or substring-after(@MarkupTag,'XMLTag/')='endnotereference' or substring-after(@MarkupTag,'XMLTag/')='endnote reference']/descendant::XMLAttribute[contains(@Self,'XMLAttributenid')]">
                                        <xsl:value-of select="parent::XMLElement[substring-after(@MarkupTag,'XMLTag/')='endnote_reference' or substring-after(@MarkupTag,'XMLTag/')='endnotereference' or substring-after(@MarkupTag,'XMLTag/')='endnote reference']/descendant::XMLAttribute[contains(@Self,'XMLAttributenid')]/@Value"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="descendant::XMLElement[substring-after(@MarkupTag,'XMLTag/')='endnote_reference' or substring-after(@MarkupTag,'XMLTag/')='endnotereference' or substring-after(@MarkupTag,'XMLTag/')='endnote reference']/descendant::XMLAttribute[contains(@Self,'XMLAttributenid')]/@Value"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:attribute>
                            <xsl:attribute name="href">
                                <!-\-<xsl:value-of select="parent::XMLElement[substring-after(@MarkupTag,'XMLTag/')='endnote_reference' or substring-after(@MarkupTag,'XMLTag/')='endnotereference' or substring-after(@MarkupTag,'XMLTag/')='endnote reference']/descendant::XMLAttribute[contains(@Self,'XMLAttributenhref')]/@Value"/>-\->
                                <xsl:choose>
                                    <xsl:when test="parent::XMLElement[substring-after(@MarkupTag,'XMLTag/')='endnote_reference' or substring-after(@MarkupTag,'XMLTag/')='endnotereference' or substring-after(@MarkupTag,'XMLTag/')='endnote reference']/descendant::XMLAttribute[contains(@Self,'XMLAttributenhref')]">
                                        <xsl:value-of select="parent::XMLElement[substring-after(@MarkupTag,'XMLTag/')='endnote_reference' or substring-after(@MarkupTag,'XMLTag/')='endnotereference' or substring-after(@MarkupTag,'XMLTag/')='endnote reference']/descendant::XMLAttribute[contains(@Self,'XMLAttributenhref')]/@Value"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="descendant::XMLElement[substring-after(@MarkupTag,'XMLTag/')='endnote_reference' or substring-after(@MarkupTag,'XMLTag/')='endnotereference' or substring-after(@MarkupTag,'XMLTag/')='endnote reference']/descendant::XMLAttribute[contains(@Self,'XMLAttributenhref')]/@Value"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:attribute>
                                <xsl:for-each select="descendant::Content">
                                    <xsl:value-of select="."/>
                                </xsl:for-each>
                        </xsl:element>
                    </xsl:if>
                    </xsl:if>-->
                    <!-- Added for multiple endnote on 22-05-2024 Azure 14611-->                   
                    <xsl:if test="self::CharacterStyleRange[not(contains($Charstyle0,'smallcaps') or contains($Charstyle0,'allcaps') or @Underline = 'true' or StrikeThru='true' or  contains($Charstyle0,'heavy') or  contains($Charstyle0,'bold') or contains($Charstyle0,'italic') or contains($Charstyle0,'oblique'))][substring-after(@AppliedCharacterStyle,'CharacterStyle/')='endnotereference' or substring-after(@AppliedCharacterStyle,'CharacterStyle/')='endnote reference'][string-length(.) &gt; 0]">
                        
                        <xsl:if test="parent::XMLElement[substring-after(@MarkupTag,'XMLTag/')='endnote_reference' or substring-after(@MarkupTag,'XMLTag/')='endnotereference' or substring-after(@MarkupTag,'XMLTag/')='endnote reference'][descendant::XMLAttribute[contains(@Self,'XMLAttributenid') or contains(@Self,'XMLAttributenhref')]][1] or descendant::XMLElement[substring-after(@MarkupTag,'XMLTag/')='endnote_reference' or substring-after(@MarkupTag,'XMLTag/')='endnotereference' or substring-after(@MarkupTag,'XMLTag/')='endnote reference'][descendant::XMLAttribute[contains(@Self,'XMLAttributenid') or contains(@Self,'XMLAttributenhref')]]">
                            <xsl:for-each select="parent::XMLElement[substring-after(@MarkupTag,'XMLTag/')='endnote_reference' or substring-after(@MarkupTag,'XMLTag/')='endnotereference' or substring-after(@MarkupTag,'XMLTag/')='endnote reference'][descendant::XMLAttribute[contains(@Self,'XMLAttributenid') or contains(@Self,'XMLAttributenhref')]][1] | descendant::XMLElement[substring-after(@MarkupTag,'XMLTag/')='endnote_reference' or substring-after(@MarkupTag,'XMLTag/')='endnotereference' or substring-after(@MarkupTag,'XMLTag/')='endnote reference'][descendant::XMLAttribute[contains(@Self,'XMLAttributenid') or contains(@Self,'XMLAttributenhref')]]">
                                
                            <xsl:element name="a">
                                <!-- Added for marriapan edior on 22-02-2022 -->
                                <xsl:attribute name="class" select="'endnotecitation'"/>
                                <xsl:attribute name="data-type" select="'number'"/>
                                <!-- End -->
                                <xsl:attribute name="id">
                                    <!--<xsl:value-of select="parent::XMLElement[substring-after(@MarkupTag,'XMLTag/')='endnote_reference' or substring-after(@MarkupTag,'XMLTag/')='endnotereference' or substring-after(@MarkupTag,'XMLTag/')='endnote reference']/descendant::XMLAttribute[contains(@Self,'XMLAttributenid')]/@Value"/>-->
                                    <xsl:choose>
                                        <xsl:when test="parent::XMLElement[substring-after(@MarkupTag,'XMLTag/')='endnote_reference' or substring-after(@MarkupTag,'XMLTag/')='endnotereference' or substring-after(@MarkupTag,'XMLTag/')='endnote reference']/descendant::XMLAttribute[contains(@Self,'XMLAttributenid')][1]">
                                            <xsl:value-of select="parent::XMLElement[substring-after(@MarkupTag,'XMLTag/')='endnote_reference' or substring-after(@MarkupTag,'XMLTag/')='endnotereference' or substring-after(@MarkupTag,'XMLTag/')='endnote reference']/descendant::XMLAttribute[contains(@Self,'XMLAttributenid')][1]/@Value"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="self::XMLElement[substring-after(@MarkupTag,'XMLTag/')='endnote_reference' or substring-after(@MarkupTag,'XMLTag/')='endnotereference' or substring-after(@MarkupTag,'XMLTag/')='endnote reference']/child::XMLAttribute[contains(@Self,'XMLAttributenid')][1]/@Value"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:attribute>
                                <xsl:attribute name="href">
                                    <!--<xsl:value-of select="parent::XMLElement[substring-after(@MarkupTag,'XMLTag/')='endnote_reference' or substring-after(@MarkupTag,'XMLTag/')='endnotereference' or substring-after(@MarkupTag,'XMLTag/')='endnote reference']/descendant::XMLAttribute[contains(@Self,'XMLAttributenhref')]/@Value"/>-->
                                    <xsl:choose>
                                        <xsl:when test="parent::XMLElement[substring-after(@MarkupTag,'XMLTag/')='endnote_reference' or substring-after(@MarkupTag,'XMLTag/')='endnotereference' or substring-after(@MarkupTag,'XMLTag/')='endnote reference']/descendant::XMLAttribute[contains(@Self,'XMLAttributenhref')][1]">
                                            <xsl:value-of select="parent::XMLElement[substring-after(@MarkupTag,'XMLTag/')='endnote_reference' or substring-after(@MarkupTag,'XMLTag/')='endnotereference' or substring-after(@MarkupTag,'XMLTag/')='endnote reference']/descendant::XMLAttribute[contains(@Self,'XMLAttributenhref')][1]/@Value"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="self::XMLElement[substring-after(@MarkupTag,'XMLTag/')='endnote_reference' or substring-after(@MarkupTag,'XMLTag/')='endnotereference' or substring-after(@MarkupTag,'XMLTag/')='endnote reference']/child::XMLAttribute[contains(@Self,'XMLAttributenhref')][1]/@Value"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:attribute>
                                <xsl:for-each select="self::XMLElement[substring-after(@MarkupTag,'XMLTag/')='endnote_reference' or substring-after(@MarkupTag,'XMLTag/')='endnotereference' or substring-after(@MarkupTag,'XMLTag/')='endnote reference'][not(parent::CharacterStyleRange[substring-after(@AppliedCharacterStyle,'CharacterStyle/')='endnotereference' or substring-after(@AppliedCharacterStyle,'CharacterStyle/')='endnote reference'])]/CharacterStyleRange[1]/descendant::Content|self::XMLElement[not(descendant::CharacterStyleRange[substring-after(@AppliedCharacterStyle,'CharacterStyle/')='endnotereference' or substring-after(@AppliedCharacterStyle,'CharacterStyle/')='endnote reference'])][current()]/descendant::Content">
                                    <xsl:value-of select="current()"/>
                                </xsl:for-each>
                            </xsl:element>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:if>
                   <!-- End -->
                    
                    <xsl:if test="self::CharacterStyleRange[not(contains($Charstyle0,'smallcaps') or contains($Charstyle0,'allcaps') or @Underline = 'true' or StrikeThru='true' or  contains($Charstyle0,'heavy') or  contains($Charstyle0,'bold') or contains($Charstyle0,'italic') or contains($Charstyle0,'oblique'))][substring-after(@AppliedCharacterStyle,'CharacterStyle/')='EndnoteNumber' or substring-after(@AppliedCharacterStyle,'CharacterStyle/')='EndnoteNumber'][string-length(.) &gt; 0]">
                        
                        <xsl:if test="parent::XMLElement[substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber' or substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber'][descendant::XMLAttribute[contains(@Self,'XMLAttributenid') or contains(@Self,'XMLAttributenhref')]] or descendant::XMLElement[substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber' or substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber'][descendant::XMLAttribute[contains(@Self,'XMLAttributenid') or contains(@Self,'XMLAttributenhref')]]">
                            <xsl:element name="a">
                                <!-- Added for marriapan edior on 22-02-2022 -->
                                <xsl:attribute name="class" select="'crossref'"/>
                                <xsl:attribute name="data-type" select="'number'"/>
                                <!-- End -->
                                <xsl:attribute name="id">
                                    <!--<xsl:value-of select="parent::XMLElement[substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber' or substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber']/descendant::XMLAttribute[contains(@Self,'XMLAttributenid')]/@Value"/>-->
                                    <xsl:choose>
                                        <xsl:when test="parent::XMLElement[substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber' or substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber']/descendant::XMLAttribute[contains(@Self,'XMLAttributenid')]">
                                            <xsl:value-of select="parent::XMLElement[substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber' or substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber']/descendant::XMLAttribute[contains(@Self,'XMLAttributenid')]/@Value"/>
                                        </xsl:when>
                                        <xsl:otherwise><xsl:value-of select="descendant::XMLElement[substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber' or substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber']/descendant::XMLAttribute[contains(@Self,'XMLAttributenid')]/@Value"/></xsl:otherwise>
                                    </xsl:choose>
                                </xsl:attribute>
                                <xsl:attribute name="href">
                                    <!--<xsl:value-of select="parent::XMLElement[substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber' or substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber']/descendant::XMLAttribute[contains(@Self,'XMLAttributenhref')]/@Value"/>-->
                                    <xsl:choose>
                                        <xsl:when test="parent::XMLElement[substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber' or substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber']/descendant::XMLAttribute[contains(@Self,'XMLAttributenhref')]">
                                            <xsl:value-of select="parent::XMLElement[substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber' or substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber']/descendant::XMLAttribute[contains(@Self,'XMLAttributenhref')]/@Value"/>
                                        </xsl:when>
                                        <xsl:otherwise><xsl:value-of select="descendant::XMLElement[substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber' or substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber']/descendant::XMLAttribute[contains(@Self,'XMLAttributenhref')]/@Value"/></xsl:otherwise>
                                    </xsl:choose>
                                </xsl:attribute>
                                <xsl:for-each select="descendant::Content">
                                    <xsl:value-of select="."/>
                                </xsl:for-each>
                            </xsl:element>
                        </xsl:if>
                    </xsl:if>
                    <!-- End -->
                </xsl:element>
                
            </xsl:otherwise>
        </xsl:choose>
        </xsl:element>

        <!--</xsl:if>-->
        <!-- Added to avoid P for w:sdt -->        
        <!--<xsl:choose>
            <xsl:when test="$CC = 'ContentControlTrue'">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
       
            </xsl:otherwise>
        </xsl:choose>-->
    </xsl:template>
    <xsl:template match="CharacterStyleRange[@MathExprStyleStack]"/>
        
    <xsl:template match="CharacterStyleRangeRTP">
     <xsl:variable name="Charstyle">
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
        <xsl:choose>
                <xsl:when test="contains($Charstyle,'[No character style]') and @FontStyle">
                    <xsl:element name="{@FontStyle}">
                        <xsl:apply-templates/>
                    </xsl:element>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:element name="span">
                    <xsl:attribute name="class">
                        <xsl:value-of select="$Charstyle"/>
                    </xsl:attribute>
                    <xsl:attribute name="data-name">
                        <xsl:value-of select="$Charstyle"/>
                    </xsl:attribute>
                        <xsl:if test="@FontStyle">
                            <xsl:variable name="manstyle" select="@FontStyle"/>
                           <xsl:text disable-output-escaping="yes">&lt;</xsl:text>
                            <xsl:value-of select="$manstyle"/>
                            <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                        </xsl:if>
                        <xsl:apply-templates/>
                        <xsl:if test="@FontStyle">
                            <xsl:variable name="manstyle" select="@FontStyle"/>
                            <xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
                            <xsl:value-of select="$manstyle"/>
                            <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                        </xsl:if>
                    </xsl:element>
                </xsl:otherwise>
            </xsl:choose>                
    </xsl:template>

    <xsl:template match="w:br">
        <!--<xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>-->
        <xsl:element name="br"/>
    </xsl:template>
<!-- ************************* HARI **************************************** -->
    
    
   
        
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
                <xsl:attribute name="w:pos" select="round($position)"/>
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
    
    
    <xsl:template match="Footnote">
        <xsl:element name="w:footnoteReference">
            <xsl:attribute name="w:id">
                <xsl:number level="any"/>
            </xsl:attribute>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="Content">
        <xsl:element name="w:t">
            <xsl:attribute name="xml:space" select="'preserve'"/>
            <!--<xsl:apply-templates/>-->
            <xsl:value-of select="."></xsl:value-of>
        </xsl:element>
    </xsl:template>
    
    <!-- Put page number text variable value as a text in the document   -->
    <!-- Remove the following comment to convert textvariabable instance as text  -->
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
    
    <xsl:template match="ParagraphDestination[@BookMarkHLink]">
        <xsl:variable name="id">
            <xsl:number level="any"/>
        </xsl:variable>
        <xsl:variable name="HUD">
            <xsl:value-of select="@BookMarkHLink"/>
        </xsl:variable>
        <xsl:if test="not(string-length($HUD) = 0)">
         <xsl:element name="w:bookmarkStart">
             <xsl:attribute name="w:id" select="$id"/>
             <xsl:attribute name="w:name" select="$HUD"/>
         </xsl:element>
         <xsl:element name="w:bookmarkEnd">
             <xsl:attribute name="w:id" select="$id"/>
         </xsl:element>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="CrossReferenceSource[@BookMarkHLink]">
        <xsl:element name="w:hyperlink">
            <xsl:attribute name="w:anchor" select="@BookMarkHLink"/>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <!-- Put page number text variable value as a text in the document   -->
    
    
    
    <xsl:template match="Br">     
        <xsl:if test="count(ancestor::ParagraphStyleRange[1]/descendant::Br) &gt; 1">
            <xsl:element name="br"/>
        </xsl:if>
        <!-- <xsl:element name="w:cr"/>-->
    </xsl:template>
    
    <xsl:template match="//Rectangle">  
        
        <xsl:choose>
            <xsl:when test="@Image">
                <xsl:variable name="H" select="round((height * 12700) cast as xs:decimal)"/>
                <!--<xsl:variable name="H" select="round((height * 12700))"/>-->
                <xsl:variable name="W" select="round((width * 12700) cast as xs:decimal)"/>
                <!--<xsl:variable name="W" select="round((width * 12700))"/>-->
                <!--<xsl:variable name="IMG" select="@Image"/>-->
                <xsl:variable name="IMG">
                    <xsl:variable name="openParanthesis" select="replace(@Image,'%28','(')"/>
                    <xsl:variable name="closeParanthesis" select="replace($openParanthesis,'%29',')')"/>
                    <xsl:value-of select="$closeParanthesis"/>
                </xsl:variable>
                <xsl:variable name="artAvail" select="boolean($artinfo//Arts/art[. = $IMG])"/>
                <xsl:variable name="extension">
                    <xsl:call-template name="substring-after-last">
                        <xsl:with-param name="string" select="$IMG"/>
                        <xsl:with-param name="char" select="'.'"/>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:variable name="id" select="@id"/>
                
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
                            <!--<xsl:element name="wp:wrapTopAndBottom"/>-->
                            <!--@@@@@@@@@@ Wrap Top and Bottom @@@@@@@@@@@-->
                            <xsl:element name="wp:docPr">
                                <!--<xsl:attribute name="id" select="(floor(math:random()*1000) mod 1000) + 1" />-->
                                <xsl:attribute name="id" >
                                    <xsl:call-template name="create-seed"/>
                                </xsl:attribute>
                                <xsl:attribute name="name" select="$IMG"/>
                                <!--This is for the purpose of external link in the document. Currently applied for only EPS format-->
                                <xsl:if test="$extension = 'eps'">
                                    <xsl:if test="$artAvail">
                                    <xsl:element name="a:hlinkClick">
                                        <xsl:attribute name="r:id" select="concat('rId',$id,'hypl')"/>
                                    </xsl:element>
                                    </xsl:if>
                                </xsl:if>
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
                                                <xsl:if test="$artAvail">
                                                    <xsl:attribute name="r:embed" select="concat('rId',$id)"/>
                                                </xsl:if>
                                                <xsl:if test="not($artAvail)">
                                                    <xsl:attribute name="r:link" select="concat('rId',$id)"/>
                                                </xsl:if>
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
        <!-- 27-JUNE-19 -->
            <!-- 02-JULY-19 -->
            <xsl:otherwise>
                
            <xsl:copy>
                <xsl:apply-templates select="@*|node()"/>
            </xsl:copy>
                
        </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>
    
    
    <xsl:template name="substring-after-last">
        <xsl:param name="string"/>
        <xsl:param name="char"/>
        
        <xsl:choose>
            <xsl:when test="contains($string, $char)">
                <xsl:call-template name="substring-after-last">
                    <xsl:with-param name="string" select="substring-after($string, $char)"/>
                    <xsl:with-param name="char" select="$char"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$string"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="create-seed">
        <xsl:param name="string" select="generate-id()"/>
        <xsl:param name="preliminary-seed" select="100000"/>
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
        
    <xsl:template match="TextFrame">
        <xsl:variable name="CU" select="@Story"></xsl:variable>
        <xsl:variable name="story" select="concat('Story_',$CU,'.xml')"/>
        <xsl:variable name="Conc" select="'width:393.6pt;height:64.3pt;mso-wrap-style:none;mso-left-percent:-10001;mso-top-percent:-10001;mso-position-horizontal:absolute;mso-position-horizontal-relative:char;mso-position-vertical:absolute;mso-position-vertical-relative:line;mso-left-percent:-10001;mso-top-percent:-10001'"/>
<!--        <xsl:if test="following-sibling::*[1]/name() = 'Content'">
            <xsl:text disable-output-escaping="yes">&lt;/w:r&gt;</xsl:text>
        </xsl:if>-->
        
        <xsl:element name="w:pict">
        <xsl:element name="v:shapetype">
            <xsl:attribute name="id" select="'_x0000_t202'"/>
            <xsl:attribute name="coordsize" select="'21600,21600'"/>
            <xsl:attribute name="o:spt" select="'202'"/>
            <xsl:attribute name="path" select="'m,l,21600r21600,l21600,xe'"/>
            <xsl:element name="v:stroke">
                <xsl:attribute name="joinstyle" select="'miter'"/>
            </xsl:element>
            <xsl:element name="v:path">
                <xsl:attribute name="gradientshapeok" select="'t'"/>
                <xsl:attribute name="o:connecttype" select="'rect'"/>
            </xsl:element>
        </xsl:element>
        
        <xsl:element name="v:shape">
            <xsl:attribute name="id" select="@id"/>
            <xsl:attribute name="o:spid" select="'_x0000_s1152'"/>
            <xsl:attribute name="type" select="'#_x0000_t202'"/>
            <xsl:attribute name="style" select="$Conc"/>
            <xsl:attribute name="stroked" select="'f'"/>
            <xsl:attribute name="strokecolor" select="'white [3212]'"/>
            <xsl:element name="v:textbox">
                <xsl:attribute name="style" select="'mso-fit-shape-to-text:t'"/>
                <xsl:attribute name="inset" select="'0,0,0,0'"/>
                <xsl:attribute name="libraryFillColor" select="@libraryFillColor"/>
                <xsl:element name="w:txbxContent">
        <!--            <xsl:apply-templates select="//Story[@Self = $CU]" mode="textframe"/>-->
                        <xsl:if test="@previous = 'n'">
                            <xsl:apply-templates select="//Story[@Self = $CU]" mode="textframe"/>
                        </xsl:if>
                </xsl:element>
            </xsl:element>
            <xsl:element name="w10:wrap">
                <!--<xsl:attribute name="type" select="'topAndBottom'"/>-->
                <xsl:attribute name="type" select="'tight'"/>
            </xsl:element>
            <!--<xsl:element name="w10:anchorlock"/>-->
        </xsl:element>
        </xsl:element>

        
        <!--        <xsl:if test="following-sibling::*[1]/name() = 'Content'">
            <xsl:text disable-output-escaping="yes">&lt;w:r&gt;</xsl:text>
        </xsl:if>-->
    </xsl:template>
        
    <!-- Removing inline textframe Stories       -->
    <xsl:template match="Story[@Self = //TextFrame/@Story]"/>    
        
    <xsl:template match="Table">
        <xsl:variable name="PN" select="./@w:rsidR"/>
        <xsl:variable name="txtFrameId">
            <xsl:choose>
                <xsl:when test="not(contains(substring-after(lower-case($PN),'_txtid_'),'_'))">
                    <xsl:choose>
                        <xsl:when test="contains(lower-case($PN),'_txtid_')">
                            <xsl:value-of select="substring-after(lower-case($PN),'_txtid_')"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:choose>
                        <xsl:when test="contains(lower-case($PN),'_txtid_')">
                            <xsl:value-of select="substring-before(substring-after(lower-case($PN),'_txtid_'),'_')"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:text>&#x000A;</xsl:text>
        <xsl:element name="table">
            <xsl:copy-of select="./@w:rsidR"/>
            <xsl:if test="string-length($txtFrameId) &gt; 0">
                <xsl:choose>
                    <xsl:when test="starts-with($txtFrameId,'u')">
                        <xsl:attribute name="txtFrameId" select="$txtFrameId"/>        
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:attribute name="txtFrameId" select="concat('u',$txtFrameId)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
            <xsl:attribute name="border" select="'1'"/>
            <xsl:attribute name="cellpadding">
                <xsl:choose>
                    <xsl:when test="@TextLeftInset">
                        <xsl:value-of select="concat(@TextLeftInset,'pt')"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="'4pt'"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:text>&#x000A;</xsl:text>
            <xsl:element name="colgroup">
                <xsl:for-each select="self::Table/Column">
                    <xsl:variable name="CW" select="@SingleColumnWidth"/>
                    <xsl:text>&#x000A;</xsl:text>
                    <xsl:element name="col">
                        <xsl:attribute name="width" select="round($CW * 20)"/>
                    </xsl:element>
                </xsl:for-each>
                <xsl:text>&#x000A;</xsl:text>
            </xsl:element>
            <xsl:text>&#x000A;</xsl:text>
            <!-- @@@@@@@@@@@@@@@@@@@ Table Bookmark start 26.5.2016 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
            <xsl:if test="@TableNumber != ''">
                <xsl:variable name="id">
                    <xsl:number level="any"/>
                </xsl:variable>
                <xsl:if test="contains(lower-case(@TableNumber),'table_')">
                    <xsl:variable name="Label" select="@TableNumber"></xsl:variable>
                    <xsl:if test="not(string-length($Label) = 0)">
                        <xsl:element name="w:bookmarkStart">
                            <!--<xsl:attribute name="w:id" select="$Label"/>-->
                            <xsl:attribute name="w:id" select="$id"/>
                            <xsl:attribute name="w:name" select="$Label"/>
                        </xsl:element>
                        <xsl:element name="w:bookmarkEnd">
                            <!--<xsl:attribute name="w:id" select="$Label"/>-->
                            <xsl:attribute name="w:id" select="$id"/>
                        </xsl:element>
                    </xsl:if>
                </xsl:if>
            </xsl:if>
            <!-- @@@@@@@@@@@@@@@@@@@ Table Bookmark End 26.5.2016 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
            
            <xsl:element name="tbody">
                
            <xsl:for-each-group select="self::Table/Cell" group-adjacent="tokenize(@Name,':')[last()]">                
                <xsl:variable name="K" select="number(current-grouping-key()) cast as xs:integer"/>
                <xsl:variable name="K1" select="$K + 1"/>
                <xsl:variable name="RowHei" select="parent::Table/Row[$K1]/@SingleRowHeight"/>
                <xsl:variable name="RowHeight" select="$RowHei * 20"/>
                                  
                <xsl:text>&#x000A;</xsl:text>
                <xsl:element name="tr">
                    <xsl:text>&#x000A;</xsl:text>                    
                    <!--<xsl:element name="w:trPr">
                        <xsl:element name="w:trHeight">
                            <xsl:attribute name="w:val" select="round($RowHeight)"/>
                        </xsl:element>
                    </xsl:element>-->                    
                    <xsl:for-each select="current-group()">
                        <xsl:variable name="ColSpan" select="./@ColumnSpan cast as xs:integer"/>
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
                        <xsl:variable name="RowSpan" select="@RowSpan"/> 
                        <xsl:variable name="TextLeftInset" select="@TextLeftInset"/> 
                        <xsl:variable name="TextRightInset" select="@TextRightInset"/>
                        <xsl:variable name="TextTopInset" select="@TextTopInset"/>
                        <xsl:variable name="TextBottomInset" select="@TextBottomInset"/>
                        <xsl:text>&#x000A;</xsl:text>
                        <xsl:element name="td">
                                <!--<xsl:element name="w:tcW">-->
                                    <!--<xsl:attribute name="w:w">
                                        <xsl:choose>
                                            <xsl:when test="$ColSpan eq 1">
                                                <xsl:value-of select="round($ColWidth)"/>
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
                                                <xsl:value-of select="round($add)"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:attribute>
                                    <xsl:attribute name="w:type" select="'dxa'"/>-->
                                <!--</xsl:element>-->
                            <xsl:choose>
                                <xsl:when test="$RowSpan &gt; 1">
                                    <xsl:attribute name="rowspan">
                                        <xsl:value-of select="$RowSpan"/>
                                    </xsl:attribute>
                                </xsl:when>
                            </xsl:choose>
                            <xsl:choose>
                                <xsl:when test="$ColSpan &gt; 1">
                                    <xsl:attribute name="colspan">
                                        <xsl:value-of select="$ColSpan"/>
                                    </xsl:attribute>
                                </xsl:when>
                            </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./@RowSpan &gt; 1">
                                        <xsl:attribute name="w:vMerge">
                                            <xsl:attribute name="w:val" select="'restart'"/>
                                        </xsl:attribute>
                                    </xsl:when>
                                    <xsl:when test="./@mine">
                                        <xsl:element name="w:vMerge"/>
                                    </xsl:when>
                                </xsl:choose>
                            <!--<xsl:choose>
                                <xsl:when test="$RowSpan &gt; 1">
                                    <xsl:attribute name="rowspan">
                                        <xsl:value-of select="$RowSpan"/>
                                    </xsl:attribute>
                                </xsl:when>                                
                            </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="$ColSpan &gt; 1">
                                        <xsl:attribute name="colspan">
                                            <xsl:value-of select="$ColSpan"/>
                                        </xsl:attribute>
                                    </xsl:when>
                                </xsl:choose>-->
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
                            
                            
                            
                            
                          <!-- @@@@@@@@@@@@@@@@@@@ Table cell Bookmark start 4.1.2016 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
                            
                            
                            <xsl:for-each select="descendant::Label/descendant::ListItem[@type ='string']">
                                <xsl:variable name="id">
                                    <xsl:number level="any"/>
                                </xsl:variable>
                                <xsl:if test="contains(lower-case(.),'cell')">
                                    <xsl:variable name="Label" select="."></xsl:variable>
                                    <xsl:if test="not(string-length($Label) = 0)">
                                        <xsl:element name="w:bookmarkStart">
                                            <!--<xsl:attribute name="w:id" select="$Label"/>-->
                                            <xsl:attribute name="w:id" select="$id"/>
                                            <xsl:attribute name="w:name" select="$Label"/>
                                        </xsl:element>
                                        <xsl:element name="w:bookmarkEnd">
                                            <!--<xsl:attribute name="w:id" select="$Label"/>-->
                                            <xsl:attribute name="w:id" select="$id"/>
                                        </xsl:element>
                                    </xsl:if>
                                </xsl:if>
                            </xsl:for-each>
                            
                          <!-- @@@@@@@@@@@@@@@@@@@ Table cell Bookmark End 4.1.2016 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
                            <xsl:apply-templates/>
                        </xsl:element>
                    </xsl:for-each>
                    
                </xsl:element>
            </xsl:for-each-group>
            </xsl:element>
            <xsl:text>&#x000A;</xsl:text>            
        </xsl:element>
        <xsl:text>&#x000A;</xsl:text>
    </xsl:template>
    
    <!-- Bookmark old 21.8.2015 concept -->
    <!--<xsl:template match="HyperlinkTextSource | HyperlinkTextDestination">
        <!-\-<xsl:variable name="HUD">
            <xsl:choose>
                <xsl:when test="self::HyperlinkTextSource">
                    <xsl:value-of select="@HyperlinkUDestination"/>
                </xsl:when>
                <xsl:when test="self::HyperlinkTextDestination">
                    <xsl:value-of select="@BookMarkDestination"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        <xsl:element name="w:bookmarkStart">
            <xsl:attribute name="w:id" select="$HUD"/>
            <xsl:attribute name="w:name" select="$HUD"/>
        </xsl:element>-\->
        <xsl:apply-templates/>
        <!-\-<xsl:element name="w:bookmarkEnd">
            <xsl:attribute name="w:id" select="$HUD"/>
        </xsl:element>-\->
    </xsl:template>-->
    <!-- Bookmark old 21.8.2015 concept -->
    
    <xsl:template match="Note">
        <xsl:if test="not(ancestor::CharacterStyleRange)">
        <xsl:element name="w:commentRangeStart">
            <xsl:attribute name="w:id">                
                <xsl:value-of select="@NoteNo"/>
            </xsl:attribute>
        </xsl:element>
        <xsl:element name="w:commentRangeEnd">
            <xsl:attribute name="w:id">
                <xsl:value-of select="@NoteNo"/>
            </xsl:attribute>
        </xsl:element>
        </xsl:if>
        <xsl:element name="w:commentReference">
            <xsl:attribute name="w:id">
                <xsl:value-of select="@NoteNo"/>
            </xsl:attribute>
        </xsl:element>        
    </xsl:template>
        
    <!--<xsl:template match="w:br">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>-->
    
    <xsl:template match="XMLElement">
        
        <xsl:variable name="permIDRandom">
            <!--<xsl:value-of select="((floor(math:random()*1000) mod 1000) + 1)+ 287141164"/>-->
            <xsl:if test="child::XMLAttribute[lower-case(@Name) ='bookmarkno']">
                <xsl:value-of select="number(child::XMLAttribute[lower-case(@Name) ='bookmarkno']/@Value) + 10000"/>
            </xsl:if>
        </xsl:variable>
        
        <xsl:variable name="PermStart">
            <xsl:variable name="bookMarkKey">
               <!-- <xsl:for-each select="child::XMLAttribute">
                    <xsl:choose>
                        <xsl:when test="lower-case(@Name) = 'bookmarkkey'">
                            <xsl:value-of select="concat(@Name,@Value)"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>-->
                <xsl:if test="child::XMLAttribute[lower-case(@Name) ='bookmarkkey'][lower-case(@Value)='start']">
                    <xsl:value-of select="child::XMLAttribute[lower-case(@Name) ='bookmarkkey']/@Value"/>
                </xsl:if>
            </xsl:variable>
            <xsl:variable name="bookMarkNo">
                <!--<xsl:for-each select="child::XMLAttribute">
                    <xsl:choose>
                        <xsl:when test="lower-case(@Name) = 'bookmarkno'">
                            <xsl:value-of select="concat(@Name,@Value)"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>  -->
                <xsl:if test="child::XMLAttribute[lower-case(@Name) ='bookmarkno']">
                    <xsl:value-of select="child::XMLAttribute[lower-case(@Name) ='bookmarkno']/@Value"/>
                </xsl:if>
            </xsl:variable>
            <xsl:if test="string-length($bookMarkKey) != 0 and string-length($bookMarkNo) !=0">
                <xsl:value-of select="concat($bookMarkKey,$bookMarkNo)"/>
            </xsl:if>
        </xsl:variable>
        
        <xsl:variable name="PermEnd">
            <xsl:variable name="bookMarkKey">
                <!-- <xsl:for-each select="child::XMLAttribute">
                    <xsl:choose>
                        <xsl:when test="lower-case(@Name) = 'bookmarkkey'">
                            <xsl:value-of select="concat(@Name,@Value)"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>-->
                <xsl:if test="child::XMLAttribute[lower-case(@Name) ='bookmarkkey'][lower-case(@Value)='end']">
                    <xsl:value-of select="child::XMLAttribute[lower-case(@Name) ='bookmarkkey']/@Value"/>
                </xsl:if>
            </xsl:variable>
            <xsl:variable name="bookMarkNo">
                <!--<xsl:for-each select="child::XMLAttribute">
                    <xsl:choose>
                        <xsl:when test="lower-case(@Name) = 'bookmarkno'">
                            <xsl:value-of select="concat(@Name,@Value)"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>  -->
                <xsl:if test="child::XMLAttribute[lower-case(@Name) ='bookmarkno']">
                    <xsl:value-of select="child::XMLAttribute[lower-case(@Name) ='bookmarkno']/@Value"/>
                </xsl:if>
            </xsl:variable>
            <xsl:if test="string-length($bookMarkKey) != 0 and string-length($bookMarkNo) !=0">
                <xsl:value-of select="concat($bookMarkKey,$bookMarkNo)"/>
            </xsl:if>
        </xsl:variable>
        
        <!--<xsl:variable name="PN" select="descendant::ParagraphStyleRange[1]/@ParaInfo"/>-->
        <!-- Added sorting issue by HyperlinkTextSourceon 10-1-2022 -->
        <xsl:variable name="PN">
            <xsl:choose>
                <xsl:when test="descendant::HyperlinkTextSource[contains(lower-case(@HyperlinkUDestination),'_story_')][1]/@HyperlinkUDestination">
                    <xsl:value-of select="descendant::HyperlinkTextSource[contains(lower-case(@HyperlinkUDestination),'_story_')][1]/@HyperlinkUDestination"/>
                </xsl:when>
                <xsl:when test="descendant::HyperlinkTextDestination[contains(@BookMarkDestination,'_UUID_') or contains(@BookMarkDestination,'story') or contains(@Name,'_UUID_') or contains(lower-case(@Name),'_story_')][1]/@BookMarkDestination">
                    <xsl:value-of select="descendant::HyperlinkTextDestination[contains(@BookMarkDestination,'_UUID_') or contains(@BookMarkDestination,'story') or contains(@Name,'_UUID_') or contains(lower-case(@Name),'_story_')][1]/@BookMarkDestination"/>
                </xsl:when>
                <xsl:when test="descendant::HyperlinkTextSource[contains(lower-case(@HyperlinkUDestination),'_story_')][1]/@bkmark">
                    <xsl:value-of select="descendant::HyperlinkTextSource[contains(lower-case(@HyperlinkUDestination),'_story_')][1]/@bkmark"/>
                </xsl:when>
                <xsl:when test="descendant::HyperlinkTextDestination[contains(@BookMarkDestination,'_UUID_') or contains(@BookMarkDestination,'story') or contains(@Name,'_UUID_') or contains(lower-case(@Name),'_story_')][1]/@bkmark">
                    <xsl:value-of select="descendant::HyperlinkTextDestination[contains(@BookMarkDestination,'_UUID_') or contains(@BookMarkDestination,'story') or contains(@Name,'_UUID_') or contains(lower-case(@Name),'_story_')][1]/@bkmark"/>
                </xsl:when>
<!--07-01-2020 sorting problem(top of the reference) panneer and prakash s  bleow two when condition shifted from top-->
                <xsl:when test="not(descendant::HyperlinkTextSource[contains(lower-case(@HyperlinkUDestination),'_story_')][1]/@bkmark)">
                    <xsl:value-of select="descendant::ParagraphStyleRange[1]/@ParaInfo"/>
                </xsl:when>
                <xsl:when test="not(descendant::HyperlinkTextDestination[contains(@BookMarkDestination,'_UUID_') or contains(@BookMarkDestination,'story') or contains(@Name,'_UUID_') or contains(lower-case(@Name),'_story_')][1]/@bkmark)">
                    <xsl:value-of select="descendant::ParagraphStyleRange[1]/@ParaInfo"/>
                </xsl:when>
<!--07-01-2020 sorting problem(top of the reference) panneer and prakash s  added bleow when condition -->
                <xsl:when test="not(descendant::HyperlinkTextDestination[contains(@BookMarkDestination,'_UUID_') or contains(@BookMarkDestination,'story') or contains(@Name,'_UUID_') or contains(lower-case(@Name),'_story_')][1]/@bkmark)">
                    <xsl:value-of select="descendant::HyperlinkTextDestination[contains(@BookMarkDestination,'_UUID_') or contains(@BookMarkDestination,'story') or contains(@Name,'_UUID_') or contains(lower-case(@Name),'_story_')][1]/@Name"/>
                </xsl:when>

            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="txtFrameId">
            <xsl:choose>
                <xsl:when test="not(contains(substring-after(lower-case($PN),'_txtid_'),'_'))">
                    <xsl:choose>
                        <xsl:when test="contains(lower-case($PN),'_txtid_')">
                            <xsl:value-of select="substring-after(lower-case($PN),'_txtid_')"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:choose>
                        <xsl:when test="contains(lower-case($PN),'_txtid_')">
                            <xsl:value-of select="substring-before(substring-after(lower-case($PN),'_txtid_'),'_')"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="txtFrameId">
            <xsl:choose>
                <xsl:when test="not(contains(substring-after(lower-case($PN),'_txtid_'),'_'))">
                    <xsl:choose>
                        <xsl:when test="contains(lower-case($PN),'_txtid_')">
                            <xsl:value-of select="substring-after(lower-case($PN),'_txtid_')"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:choose>
                        <xsl:when test="contains(lower-case($PN),'_txtid_')">
                            <xsl:value-of select="substring-before(substring-after(lower-case($PN),'_txtid_'),'_')"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="CC">
            <xsl:for-each select="child::XMLAttribute">
                <xsl:choose>
                    <xsl:when test="@Name = 'ContentControl'">
                        <xsl:value-of select="concat(@Name,@Value)"/>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>                
        </xsl:variable>

        <xsl:variable name="id">
            <xsl:variable name="idkey">
                <xsl:for-each select="child::XMLAttribute">
                    <xsl:choose>
                        <xsl:when test="@Name = 'Id'">
                            <xsl:choose>
                                <xsl:when test="string-length(@Value) = 0">
                                    <xsl:value-of select="1694958775 - position()"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="@Value"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:variable>
            <xsl:choose>
                <xsl:when test="string-length($idkey) = 0">
                    <xsl:value-of select="1694958775 - position()"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$idkey"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="DB">
            <xsl:for-each select="child::XMLAttribute">
                <xsl:choose>
                    <xsl:when test="@Name = 'DB'">
            <xsl:choose>
                <xsl:when test="string-length(@Value) = 0">                    
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="@Value"/>
                </xsl:otherwise>
            </xsl:choose>
            </xsl:when>
            </xsl:choose>
            </xsl:for-each>
        </xsl:variable>
        
        <xsl:variable name="Alias">
            <xsl:for-each select="child::XMLAttribute">
                <xsl:choose>
                    <xsl:when test="@Name = 'Alias'">
            <xsl:choose>
                <xsl:when test="string-length(@Value) = 0">
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="@Value"/>
                </xsl:otherwise>
            </xsl:choose>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
        </xsl:variable>
        
        <xsl:variable name="Tag">
            <xsl:for-each select="child::XMLAttribute">
                <xsl:choose>
                    <xsl:when test="@Name = 'Tag'">
            <xsl:choose>
                <xsl:when test="string-length(@Value) = 0">
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="@Value"/>
                </xsl:otherwise>
            </xsl:choose>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
        </xsl:variable>
        
        <xsl:variable name="no">
            <xsl:for-each select="child::XMLAttribute">
                <xsl:choose>
                    <xsl:when test="@Name = 'no'">
                        <xsl:choose>
                            <xsl:when test="string-length(@Value) = 0">
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="@Value"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
        </xsl:variable>
        
        <xsl:variable name="parentRunProp">
            <xsl:copy-of select="parent::w:r/w:rPr"/>
        </xsl:variable>
        
        <xsl:choose>
            <xsl:when test="$CC = 'ContentControlTrue'"> 
                <xsl:choose>
                    <xsl:when test="string-length($no) != 0">
                        
                        <xsl:if test="string-length($PermStart) != 0 ">
                            <xsl:element name="w:permStart">
                                <xsl:attribute name="w:id">
                                    <xsl:value-of select="$permIDRandom"/>                                    
                                </xsl:attribute>
                                <xsl:attribute name="w:edGrp">
                                    <xsl:value-of select="'everyone'"/>
                                </xsl:attribute>
                            </xsl:element>    
                        </xsl:if>
                        
                        
                        
                        <xsl:element name="w:sdt">
                            <xsl:if test="string-length($PN) &gt; 0">
                                <xsl:attribute name="w:rsidR" select="$PN"/>
                            </xsl:if>
                            <xsl:if test="string-length($txtFrameId) &gt; 0">
                                <xsl:choose>
                                    <xsl:when test="starts-with($txtFrameId,'u')">
                                        <xsl:attribute name="txtFrameId" select="$txtFrameId"/>        
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:attribute name="txtFrameId" select="concat('u',$txtFrameId)"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:if>
                           <xsl:element name="w:sdtPr">
                                <xsl:choose>
                                    <xsl:when test="not(string-length($Alias) = 0)">
                                        <xsl:element name="w:alias">
                                            <xsl:attribute name="w:val" select="$Alias"/>
                                        </xsl:element>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="not(string-length($Tag) = 0)">
                                        <xsl:element name="w:tag">
                                            <xsl:attribute name="w:val" select="$Tag"/>
                                        </xsl:element>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:element name="w:id">
                                    <xsl:attribute name="w:val" select="$id"/>
                                </xsl:element>
                                <xsl:element name="w:placeholder">
                                    <xsl:element name="w:docPart">
                                        <xsl:attribute name="w:val" select="'DefaultPlaceholder_1081868574'"/>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:element>
                            <xsl:element name="w:sdtEndPr"/>
                            <xsl:element name="w:sdtContent">
                                <xsl:apply-templates/>
                                <!-- for loose leaf -->
                              
                                    <xsl:choose>
                                        <xsl:when test="ancestor::ParagraphStyleRange and not(ancestor::CharacterStyleRange)">
                                            <xsl:element name="w:r">
                                                <xsl:element name="w:rPr">
                                                    <xsl:element name="w:vanish"/>
                                                </xsl:element>
                                                <xsl:element name="w:t">
                                                    <xsl:attribute name="xml:space" select="'preserve'"/>
                                                    <xsl:value-of select="$no"/>
                                                </xsl:element>
                                            </xsl:element>
                                        </xsl:when>
                                        <xsl:when test="ancestor::CharacterStyleRange">
                                            <xsl:element name="w:t">
                                                <xsl:attribute name="xml:space" select="'preserve'"/>
                                                <xsl:value-of select="$no"/>
                                            </xsl:element>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:element name="w:p">
                                                <xsl:if test="string-length($txtFrameId) &gt; 0">
                                                    <xsl:choose>
                                                        <xsl:when test="starts-with($txtFrameId,'u')">
                                                            <xsl:attribute name="txtFrameId" select="$txtFrameId"/>        
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <xsl:attribute name="txtFrameId" select="concat('u',$txtFrameId)"/>
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                </xsl:if>
                                                <xsl:element name="w:pPr">     
                                                    <xsl:element name="w:rPr">
                                                        <xsl:element name="w:vanish"/>
                                                    </xsl:element>
                                                </xsl:element>
                                                <xsl:element name="w:r">
                                                    <xsl:element name="w:rPr">
                                                        <xsl:element name="w:vanish"/>
                                                    </xsl:element>
                                                    <xsl:element name="w:t">
                                                        <xsl:attribute name="xml:space" select="'preserve'"/>
                                                        <xsl:value-of select="$no"/>
                                                    </xsl:element>
                                                </xsl:element>
                                            </xsl:element>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                
                                <!-- for loose leaf -->
                            </xsl:element>
                        </xsl:element>
                        
                        <xsl:if test="string-length($PermEnd) != 0 ">
                            <xsl:element name="w:permEnd">
                                <xsl:attribute name="w:id">
                                    <xsl:value-of select="$permIDRandom"/>                                    
                                </xsl:attribute>
                            </xsl:element>
                        </xsl:if>
                        
                    </xsl:when>
                    <xsl:otherwise>
                        
                        <xsl:if test="string-length($PermStart) != 0 ">
                            <xsl:element name="w:permStart">
                                <xsl:attribute name="w:id">
                                    <xsl:value-of select="$permIDRandom"/>                                    
                                </xsl:attribute>
                                <xsl:attribute name="w:edGrp">
                                    <xsl:value-of select="'everyone'"/>
                                </xsl:attribute>
                            </xsl:element>    
                        </xsl:if>
                        <xsl:text>&#x000A;</xsl:text>
                        <xsl:element name="w:sdt">
                        <xsl:if test="string-length($PN) &gt; 0">
                                <xsl:attribute name="w:rsidR" select="$PN"/>
                            </xsl:if>
                            <xsl:if test="string-length($txtFrameId) &gt; 0">
                                <xsl:choose>
                                    <xsl:when test="starts-with($txtFrameId,'u')">
                                        <xsl:attribute name="txtFrameId" select="$txtFrameId"/>        
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:attribute name="txtFrameId" select="concat('u',$txtFrameId)"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:if>
                            <xsl:element name="w:sdtPr">
                                <xsl:choose>
                                    <xsl:when test="not(string-length($Alias) = 0)">
                                        <xsl:element name="w:alias">
                                            <xsl:attribute name="w:val" select="$Alias"/>
                                        </xsl:element>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="not(string-length($Tag) = 0)">
                                        <xsl:element name="w:tag">
                                            <xsl:attribute name="w:val" select="$Tag"/>
                                        </xsl:element>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:element name="w:id">
                                    <xsl:attribute name="w:val" select="$id"/>
                                </xsl:element>
                                <xsl:element name="w:placeholder">
                                    <xsl:element name="w:docPart">
                                        <xsl:attribute name="w:val" select="'DefaultPlaceholder_1081868574'"/>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:element>
                            <xsl:element name="w:sdtEndPr"/>
                            <xsl:element name="w:sdtContent">
                                <xsl:apply-templates/>                              
                            </xsl:element>
                        </xsl:element>
                    
                        <xsl:if test="string-length($PermEnd) != 0 ">
                            <xsl:element name="w:permEnd">
                                <xsl:attribute name="w:id">
                                    <xsl:value-of select="$permIDRandom"/>                                    
                                </xsl:attribute>
                            </xsl:element>
                        </xsl:if>
                        
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                
                <xsl:if test="string-length($PermStart) != 0 ">
                    <xsl:element name="w:permStart">
                        <xsl:attribute name="w:id">
                            <xsl:value-of select="$permIDRandom"/>                                    
                        </xsl:attribute>
                        <xsl:attribute name="w:edGrp">
                            <xsl:value-of select="'everyone'"/>
                        </xsl:attribute>
                    </xsl:element>    
                </xsl:if>
                
                <xsl:apply-templates/>
                
                <xsl:if test="string-length($PermEnd) != 0 ">
                    <xsl:element name="w:permEnd">
                        <xsl:attribute name="w:id">
                            <xsl:value-of select="$permIDRandom"/>                                    
                        </xsl:attribute>
                    </xsl:element>
                </xsl:if>
                
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
        <xsl:template match="Properties"/>
        <xsl:template match="HiddenText"/>
        <xsl:template match="AllNestedStyles"/>
        
        <xsl:template match="w:tab">
            <xsl:copy inherit-namespaces="no">
                <xsl:apply-templates select="@*|node()"/>
            </xsl:copy>
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
    <!-- ********************************* HARI END ********************************** -->


    

    <xsl:character-map name="Ascii2Unicode">
        <xsl:output-character character=" " string="&amp;#x2003;"/>        
    </xsl:character-map>
    <xsl:template match="text()">
        <xsl:analyze-string select="." regex="(&#8232;)|(­)|( )|( )|(&#x2028;)">
            <xsl:matching-substring>
                <xsl:if test="regex-group(1) or regex-group(5)">
                    <xsl:text disable-output-escaping="yes">&lt;br/&gt;</xsl:text>
                </xsl:if>
                <xsl:if test="regex-group(2)">
                    <xsl:text disable-output-escaping="yes">&lt;w:softHyphen/&gt;</xsl:text>
                </xsl:if>
                <xsl:if test="regex-group(3)">
                    <xsl:text disable-output-escaping="no">&#x2003;</xsl:text>
                </xsl:if>
                <xsl:if test="regex-group(4)">
                    <xsl:text disable-output-escaping="yes">&#x2002;</xsl:text>
                </xsl:if>
            </xsl:matching-substring>
            <xsl:non-matching-substring>
                <xsl:value-of select="."/>
            </xsl:non-matching-substring>
        </xsl:analyze-string>
    </xsl:template>
    <!--Added to retain the small caps 29-03-2021--> 
    <!--<xsl:template match="AllNestedStyles">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="ListItem">
        <xsl:copy>
            <xsl:if test="self::ListItem/AppliedCharacterStyle[contains(.,'DropCap')]">
            <xsl:attribute name="DropCapCharacters">
                <xsl:value-of select="ancestor::ParagraphStyleRange[1]/@DropCapCharacters"/>       
            </xsl:attribute>
            </xsl:if>
            <xsl:for-each select="descendant::*">
                <xsl:copy>
                    <xsl:copy-of select="@*"/>
                    <xsl:attribute name="Value">
                        <xsl:value-of select="current()/."/>
                    </xsl:attribute>
                </xsl:copy>
            </xsl:for-each>
        </xsl:copy>
    </xsl:template>-->
    <!-- Added to handle if citation endnote reference wrongly tagged as EndnoteNumber on 26-4-2023 Azure 7168-->
    <xsl:template match="//CharacterStyleRange[substring-after(@AppliedCharacterStyle,'CharacterStyle/')='EndnoteNumber'][parent::XMLElement[substring-after(@MarkupTag,'XMLTag/')='endnote_reference' or substring-after(@MarkupTag,'XMLTag/')='endnotereference' or substring-after(@MarkupTag,'XMLTag/')='endnote reference'] and not(parent::XMLElement[substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber' or substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber']) and not(parent::ParagraphStyleRange[1][descendant::ListItem/AppliedCharacterStyle[. ='CharacterStyle/EndnoteNumber']])]//CharacterStyleRange[substring-after(@AppliedCharacterStyle,'CharacterStyle/')='EndnoteNumber'][parent::XMLElement[substring-after(@MarkupTag,'XMLTag/')='endnote_reference' or substring-after(@MarkupTag,'XMLTag/')='endnotereference' or substring-after(@MarkupTag,'XMLTag/')='endnote reference'] and not(parent::XMLElement[substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber' or substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber']) and not(parent::ParagraphStyleRange[1][descendant::ListItem/AppliedCharacterStyle[. ='CharacterStyle/EndnoteNumber']])]|//CharacterStyleRange[substring-after(@AppliedCharacterStyle,'CharacterStyle/')='EndnoteNumber'][descendant::XMLElement[substring-after(@MarkupTag,'XMLTag/')='endnote_reference' or substring-after(@MarkupTag,'XMLTag/')='endnotereference' or substring-after(@MarkupTag,'XMLTag/')='endnote reference'] and not(descendant::XMLElement[substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber' or substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber']) and not(descendant::ParagraphStyleRange[1][descendant::ListItem/AppliedCharacterStyle[. ='CharacterStyle/EndnoteNumber']])]//CharacterStyleRange[substring-after(@AppliedCharacterStyle,'CharacterStyle/')='EndnoteNumber'][parent::XMLElement[substring-after(@MarkupTag,'XMLTag/')='endnote_reference' or substring-after(@MarkupTag,'XMLTag/')='endnotereference' or substring-after(@MarkupTag,'XMLTag/')='endnote reference'] and not(parent::XMLElement[substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber' or substring-after(@MarkupTag,'XMLTag/')='EndnoteNumber']) and not(parent::ParagraphStyleRange[1][descendant::ListItem/AppliedCharacterStyle[. ='CharacterStyle/EndnoteNumber']])]">
        <xsl:element name="span">
            <xsl:attribute name="class">
                <xsl:value-of select="'endnotereference'"/></xsl:attribute>
        <xsl:attribute name="data-name">
            <xsl:value-of select="'endnote reference'"/>          
        </xsl:attribute>
           <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="//XMLElement[@MarkupTag='XMLTag/png']">
        <xsl:copy>
            <xsl:element name="span">
                <xsl:attribute name="pagesplit"><xsl:value-of select="'split'"/></xsl:attribute>
                <xsl:attribute name="bkmark"><xsl:value-of select="following::HyperlinkTextDestination[1]/@BookMarkDestination"/></xsl:attribute>
                <xsl:attribute name="val"><xsl:value-of select="child::XMLAttribute[contains(@Self,'XMLAttributenn')]/@Value"/></xsl:attribute>
            </xsl:element>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="XMLAttribute[@Name='xml:id']">
        <xsl:element name="xmlid">
            <xsl:attribute name="val"><xsl:value-of select="@Value"/></xsl:attribute></xsl:element>
    </xsl:template>
    <xsl:template match="XMLAttribute[@Name='linkend']">
        <xsl:element name="linkend">
            <xsl:attribute name="val"><xsl:value-of select="@Value"/></xsl:attribute></xsl:element>
    </xsl:template>
    </xsl:stylesheet>