<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf" exclude-result-prefixes="xs mf" 
    xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
    xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"
    xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" xmlns:v="urn:schemas-microsoft-com:vml"
    xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing" xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" 
    xmlns:w10="urn:schemas-microsoft-com:office:word" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml" xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup" 
    xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk" xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml"
    xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" 
    xmlns:a14="http://schemas.microsoft.com/office/drawing/2010/main" 
    xmlns:pic="http://schemas.openxmlformats.org/drawingml/2006/picture" 
    xmlns:idPkg="http://ns.adobe.com/AdobeInDesign/idml/1.0/packaging"
    xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape" 
    xmlns:num="http://whatever"
    version="2.0">
    <!-- 09-May-18: Added to remove unwanted Oval tag in XHTML --> 
    <!-- 07-JUNE-18: custom ol has only one li, removing its class (like *paren*) by it child li-class-->
    <!-- 13-JUNE-18: changing start="III" to start="3" -->
    <!-- 13-JUNE-18: changing start="Z" to start="26" -->
    <!-- 28-JUNE-18: Give <p> tag for empty <td>, asked by Mariselvan -->
    <!-- 14-AUG-18: Apply MATHMl from *.mml file -->
    <!--Added for comment span came inside span 12-12-2019-->
    <!--descendant::img added for IK international 06-05-2020-->
    <!--Added for wyciwyg image resize on 23-11-2020-->
    <!--Additional graphic line appeared issue for phonix on 6-12-2020-->
    <!--Added for 16-02-2021 to resolve the multiple book mark in same para issue-->
    <!--commented for marriapn editor i/i issue on 12-3-2021-->
    <!--Added for marriappan editor tab missing issue on 18-03-2021-->
    <!--Added to retain the small caps 29-03-2021-->
    <!--Added uppercase and tosmallcaps for wycywyg for marripan on 23-08-203-->
    <!-- Added for images to html5 format on 23-11-2021 -->
    <!-- Added for endnote sorting issue in wycywyg on 7-12-2021 -->
    <!--emptypara class added for mariappan on 14-12-2021-->
    <!--emptypara class added for li on 21-1-2022-->
    <!-- added to highlight the tab on 03-03-2022 -->
    <!-- Added [not(parent::li[@class='endnotecaption'])] for empty para retained in review xhtml on 16-3-2022 -->
    <!-- Added for contains($keypairVal,'PAGE BREAK') on 23-3-2022 -->
    <!-- Removed emspace( ) on 2-5-2022 -->
    <!-- Added to remove the textbox inside empty para on 26-10-2022 -->
    <!-- Endnote duplicate removed when comes with double w:t on Azure 7788 on 12-4-2023 -->
    <!-- To Remove emptypara inside the textbox on 24-4-2023 Azure 7002 -->
    <!-- Added to Retain the start number value Azure 1552 -->
    <!-- Added for listtype on 8-12-2023 Azure 1552 -->
    <!-- Added to avoid the italic missing issue on 15-4-2024 Azure 13724 -->
    <!-- Added to avoid the multiple id value for same id by content splited in idml on 25-04-2024 Azure 14417 -->
    <xsl:param name="PassArtPath"/>
    <xsl:output method="xhtml" indent="no" use-character-maps="Ascii2Unicode"/>   
    <xsl:variable name="imagesize" select="document('Manifest.xml')//idPkg:Story"/>
    <xsl:preserve-space elements="p td span div li *"/>
    <!--<xsl:strip-space elements="*"/>-->
    
    <xsl:param name="myNameSpace" select="'http://www.w3.org/1999/xhtml'"/>
    <xsl:variable name="stylecoll" select="document('StylesCollection.xml')"/>
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="*">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
        </xsl:element>        
    </xsl:template>
    
    <xsl:variable name="filename" select="substring-before(tokenize(base-uri(.), '/')[last()],'.')"/>
    
    
    <xsl:template match="html">
        <xsl:text disable-output-escaping="yes">&lt;html xmlns="http://www.w3.org/1999/xhtml"&gt;</xsl:text>
        <xsl:copy-of select="@*"/>
        <xsl:apply-templates/>
        <xsl:text>&#x000A;</xsl:text>
        <xsl:text disable-output-escaping="yes">&lt;/html&gt;</xsl:text>
    </xsl:template>
    
    <!--Added for imges name list(Images.xml) given to saravana 12-8-2020 -->
    <xsl:template match="//body">
        
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:if test="self::body[//img[@data-src][not(@data-comment | @data-commentimg)]]">
             <xsl:result-document href="{'Images_Info'}.xml">
                 <xsl:element name="root">
                    <xsl:text>&#x000A;</xsl:text>
                    <xsl:for-each select="descendant::img[string-length(@data-src) &gt; 0][not(@data-comment | @data-commentimg)]"> 
                        <xsl:element name="img">
                            <xsl:attribute name="src">
                                <xsl:choose>
                                    <xsl:when test="not(matches(lower-case(@data-src),'.jpg') or matches(lower-case(@data-src),'.([Pp][Nn][Gg])'))">
                                        <xsl:variable name="removeImgformat">
                                            
                                            <xsl:value-of select="substring-before(@data-src,'.')"/>
                                            
                                        </xsl:variable>                                          
                                        <xsl:value-of select="concat('../Images/',$removeImgformat,'.jpg')"/>
                                    </xsl:when>
                                    <xsl:otherwise> 
                                        <xsl:value-of select="concat('../Images/',@data-src)"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:attribute>
                            <xsl:attribute name="ChapterName">
                                <xsl:value-of select="$filename"/>
                            </xsl:attribute>
                        </xsl:element>
                        <xsl:text>&#x000A;</xsl:text>
                    </xsl:for-each>
                 </xsl:element>
                </xsl:result-document>            
            </xsl:if>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>
    <!--End-->  
    
   <!--<xsl:template match="p[child::p]">
        <xsl:apply-templates/>
    </xsl:template>
   --> 
    <!--<xsl:template match="p[parent::p]">
        <xsl:apply-templates/>
    </xsl:template>-->
    <!-- commented on 26-10-2022 to avoid the empty p tag -->
      <!--<xsl:template match="p[child::p]">
        <xsl:copy>      
            <xsl:apply-templates select="@*|node() except child::p"/>
        </xsl:copy>
        <xsl:apply-templates select="child::p"/>
    </xsl:template>-->
    <!-- Added to remove the textbox inside empty para on 26-10-2022 -->
    <xsl:template match="p[child::p]">
        <xsl:choose>
            <xsl:when test="self::p[child::p][count(child::p) = count(child::*)]">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="@*"/>
                    <xsl:apply-templates select="child::* except child::p"/>
                </xsl:copy>
                <xsl:apply-templates select="child::p"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- End -->


    <xsl:template match="@ColumnValue | @listtype | @numberFormat | @numberType"/>
    <xsl:template match="hp|FormattingChange"/>
    
    
    <!-- 28-sep-17: span inside span -->
    <xsl:template match="span[parent::span[not(@class)]]">
        <!-- Added to avoid @w:rsidR by this generate revises issue on 11-1-2022 -->
        <xsl:copy>
            <xsl:copy-of select="@* except (@ColumnValue|@StoryValue|@txtFrameId|@w:rsidR)"/>
            <!--Added to remove the duplicate comment inside span 23-09-2021-->
            <xsl:copy-of select="parent::span/@* except (parent::span/@*)"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:character-map name="Ascii2Unicode">
        <xsl:output-character character=">" string=">"/>
    </xsl:character-map>
    
    <xsl:variable name="tab">&#x9;</xsl:variable>
    <!-- Removed emspace( ) on 2-5-2022 -->
    <!-- (&#8232;)|(­)|( )|( )|(&#x2028;)|(&#x9;)|( )( )+ -->
    <xsl:template match="text()[not(parent::style)]">
        <xsl:analyze-string select="." regex="(&#8232;)|(­)|( )|(&#x2028;)|(&#x9;)|( )( )+">
            <xsl:matching-substring>
                <xsl:if test="regex-group(1) or regex-group(4)">
                    <xsl:text disable-output-escaping="yes">&lt;br/&gt;</xsl:text>
                </xsl:if>
                <xsl:if test="regex-group(5)">
                    <!--Added for marriappan editor tab missing issue on 18-03-2021-->
                    <!--<xsl:text disable-output-escaping="yes">&amp;#x9;</xsl:text>-->
                    <xsl:text disable-output-escaping="yes">&lt;span style="padding-left:68px;" data-tab="true"&gt; &lt;/span&gt;</xsl:text>
                </xsl:if>
                <!-- Added to remove double space on 9-3-2022 -->             
                <xsl:if test="regex-group(6)">
                    <xsl:analyze-string select="." regex="( )">
                        <xsl:matching-substring>
                            <xsl:text disable-output-escaping="yes">&lt;span class="space"&gt; &lt;/span&gt;</xsl:text>
                            </xsl:matching-substring>
                    </xsl:analyze-string>
                </xsl:if>
                <!-- End -->
                <!-- Added for soft-hyphen on 21-3-2022 -->
                <!--<xsl:if test="regex-group(2)">
                    <xsl:text disable-output-escaping="yes">­</xsl:text>
                </xsl:if>-->
                <xsl:if test="regex-group(2)">
                <xsl:text disable-output-escaping="yes">&lt;span class="shy-hyphen"&gt;</xsl:text>
                <xsl:value-of select="regex-group(2)"/>
                <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                </xsl:if>
                <!-- End -->
            </xsl:matching-substring>
            <xsl:non-matching-substring>
                <xsl:value-of select="."/>
            </xsl:non-matching-substring>
        </xsl:analyze-string>
        
    </xsl:template>
    <!-- Removing dummy SPANs -->
    <xsl:template match="span[not(@data-bkmark|@data-comment|@style)]">
        <xsl:variable name="text" select="."/>
        <xsl:choose>
            <xsl:when test="self::span[@pagesplit]">
                
               <xsl:element name="span">
                   <xsl:attribute name="pagesplit"><xsl:value-of select="@pagesplit"/></xsl:attribute>
                   <xsl:attribute name="bkmark"><xsl:value-of select="@bkmark"/></xsl:attribute>
                   <xsl:attribute name="id"><xsl:value-of select="substring-before(substring-after(@bkmark,'_p_'),'_txtid_')"/></xsl:attribute>
                   <xsl:attribute name="val"><xsl:value-of select="@val"/></xsl:attribute>
               </xsl:element>
            </xsl:when>
            <!-- Added to avoid @w:rsidR by this generate revises issue on 11-1-2022 -->
            <xsl:when test="string-length($text) > 0">
                <xsl:element name="span">
                    <xsl:copy-of select="@* except (@ColumnValue|@StoryValue|@txtFrameId |@w:rsidR)"/>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:when>
           <!--descendant::img added for IK international 06-05-2020-->
            <xsl:when test="descendant::img">
                <xsl:element name="span">
                    <xsl:copy-of select="@* except (@ColumnValue|@StoryValue|@txtFrameId |@w:rsidR)"/>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:when>
        </xsl:choose>        
    </xsl:template>
    
    <!--Added for comment span came inside span 12-12-2019-->
    <xsl:template match="span[child::span[@data-bkmark|@data-comment|@style]]">
        <xsl:copy>
        <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    <!--End-->
    
    
    <xsl:template match="span[(@style) and not(@data-bkmark|@data-comment|@class|@contenteditable)]">        
        <xsl:variable name="text" select="."/>
        <xsl:choose>
            <xsl:when test="string-length($text) > 0">
                <xsl:element name="span">
                    <xsl:copy-of select="@* except (@ColumnValue|@StoryValue|@txtFrameId|@w:rsidR)"/>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:when>
            <xsl:when test="descendant::img">
                <xsl:element name="span">
                    <xsl:copy-of select="@* except (@ColumnValue|@StoryValue|@txtFrameId|@w:rsidR)"/>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>                
            </xsl:otherwise>
        </xsl:choose>        
    </xsl:template>
    <!-- Removing dummy SPANs -->
    <xsl:template match="span[child::p]">
        <xsl:apply-templates/>
    </xsl:template>
    
    <!-- 01-NOV-17 -->
    <!-- <span style="font-family:Formata; font-size:12pt; color: #000000">
             <span class="Nocharacterstyle" data-name="[Nocharacterstyle]" style="font-family:Formata; font-size:12pt; color: #000000"></span>
         </span> -->
    <!--<xsl:template match="//spanX[@style and not(@class)]">
        <xsl:variable name="a" select="."/>        
        <xsl:choose>
            <xsl:when test="string-length($a) = 0">
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>-->
    
    <xsl:template match="w:body">
        <xsl:apply-templates select="@*|node()"/>
    </xsl:template>
    
    <!-- for Exitor client only -->
    <xsl:template match="span[@class = 'SquareBL']">
        <xsl:text></xsl:text>
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
        <xsl:text></xsl:text>
    </xsl:template>
    <!-- for Exitor client only -->
    <!--<xsl:template match="*/text()[normalize-space()]">
        <xsl:value-of select="normalize-space()"/>
    </xsl:template>    
    <xsl:template match="*/text()[not(normalize-space())]" />-->
    
    <xsl:template match="w:commentRangeStart|w:commentRangeEnd"/>       
    
    <xsl:template match="@ColumnValue | @txtFrameId | @StoryValue | @txtFrameId"/>
    
    <xsl:template match="w:footnoteRef | w:annotationRef | w:cr">
        <xsl:apply-templates/>
    </xsl:template>
    
    <!--|Oval 09-May-18: Added to remove unwanted Oval tag in XHTML --> 
    <xsl:template match="Oval">
        <xsl:variable name="src" select="child::PDF/Link/@LinkResourceURI"/>
        <xsl:variable name="src2" select="(tokenize($src,'/'))[last()]"/>
        
        <xsl:element name="img">      
            <xsl:attribute name="data-src">
                <xsl:choose>
                    <xsl:when test="descendant::PDF/Link">
                        <!-- Removed the image path for wiciwyg display the fileEntry images on 14-06-2024 Azure 15040 -->
                        <!--<xsl:value-of select="concat('Images/',$src2)"/>-->
                        <xsl:value-of select="$src2"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="child::*/Link[1]/@LinkResourceURI"/>
                    </xsl:otherwise>
                </xsl:choose>                
            </xsl:attribute>
            <xsl:attribute name="src">
                <xsl:choose>
                    <xsl:when test="descendant::PDF/Link">
                        <xsl:value-of select="concat('Images/',$src2)"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="child::*/Link[1]/@LinkResourceURI"/>
                    </xsl:otherwise>
                </xsl:choose>                
            </xsl:attribute> 
        </xsl:element> 
    </xsl:template>
    
    <!--|Oval 09-May-18: Added to remove unwanted Oval tag in XHTML -->
    <!-- 04-JUNE-18: Removing EMPTY div -->
    <xsl:template match="div|img|br">
        <xsl:choose>
            <xsl:when test="img|br[not(preceding-sibling::span[@data-comment or @data-commentimg])]">
                <xsl:copy>
                    <xsl:copy-of select="@*"/>
                    <xsl:if test="self::img[@data-src]">
                        <xsl:attribute name="src">
                            <xsl:choose>
                                <xsl:when test="not(matches(lower-case(@data-src),'.jpg') or matches(lower-case(@data-src),'.([Pp][Nn][Gg])'))">
                                    <xsl:variable name="removeImgformat">
                                        
                                        <xsl:value-of select="substring-before(@data-src,'.')"/>
                                        
                                    </xsl:variable>                                          
                                    <xsl:value-of select="concat('Images/',$removeImgformat,'.jpg')"/>
                                </xsl:when>
                                <xsl:otherwise> 
                                    <xsl:value-of select="concat('Images/',@data-src)"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:apply-templates/>
                </xsl:copy>
            </xsl:when>
            <xsl:when test="normalize-space(.) != ''">
                <xsl:copy>                
                    <xsl:copy-of select="@* except (@ColumnValue|@StoryValue|@txtFrameId|@w:rsidR)"/>
                    <xsl:apply-templates/>
                </xsl:copy>
            </xsl:when>
            <xsl:otherwise>                
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="//img|//br[not(preceding-sibling::span[@data-comment or @data-commentimg])]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:if test="self::img[@data-src]">
                <xsl:attribute name="src">
                    <xsl:choose>
                        <xsl:when test="not(matches(lower-case(@data-src),'.jpg') or matches(lower-case(@data-src),'.([Pp][Nn][Gg])'))">
                            <xsl:variable name="removeImgformat">
                                
                                <xsl:value-of select="substring-before(@data-src,'.')"/>
                                
                            </xsl:variable>                                          
                            <xsl:value-of select="concat('Images/',$removeImgformat,'.jpg')"/>
                        </xsl:when>
                        <xsl:otherwise> 
                            <xsl:value-of select="concat('Images/',@data-src)"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    <!-- 04-JUNE-18: Removing EMPTY div ENDS  -->
    
    
    
    <xsl:template match="@ColumnValue | @txtFrameId | @StoryValue | @w:rsidR"/>
    
    <!-- 07-JUNE-18: custom ol has only one li, removing its class (like *paren*) by it child li-class-->
    <xsl:template match="//ol[contains(@class, 'Paren') and not(@start = 1)]">
        <xsl:variable name="li-class" select="child::li[1]/@class"/>        
        <xsl:element name="ol">
            <!-- Added to avoid @w:rsidR by this generate revises issue on 11-1-2022 -->
            <xsl:attribute name="class" select="$li-class"/>
            <xsl:copy-of select="@* except (@ColumnValue|@StoryValue|@txtFrameId|@class|@listtype|@numberFormat|@numberType |@w:rsidR)"/>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="//ol[contains(@class, 'step') and not(@start = 1)]">        
        <xsl:variable name="li-class" select="child::li[1]/@class"/>
        
        <xsl:element name="ol">
            <xsl:attribute name="class" select="$li-class"/>
            <xsl:copy-of select="@* except (@ColumnValue|@StoryValue|@txtFrameId|@class|@listtype|@numberFormat|@numberType|@w:rsidR)"/>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    
    <!-- 13-JUNE-18: changing start="III" to start="3" -->
    <!--<xsl:template match="@start">
        <xsl:copy-of select="."/>
        <xsl:attribute name="start">
        <xsl:choose>
            <xsl:when test="matches(upper-case(.), '[^IVXLCDM]|II[^I]|IIII+|XXXX+|CCCC+|V[^I]|[^I]?I[VX][IVXLCDM]|[^I]?I[^VIX]')">
                
            </xsl:when>
            <xsl:otherwise>
                <xsl:message><xsl:value-of select="."></xsl:value-of></xsl:message>
                <xsl:value-of select="num:roman(upper-case(.), 0)"></xsl:value-of>
            </xsl:otherwise>
        </xsl:choose>
        
        </xsl:attribute>
    </xsl:template>-->
    
    <xsl:template match="ol[@type='I' or @type='i']">
        <xsl:variable name="start" select="@start"/>
        
        <xsl:element name="ol">
            <xsl:copy-of select="@* except (@ColumnValue|@StoryValue|@txtFrameId|@listtype|@numberFormat|@numberType|@start|@w:rsidR)"/>
        <xsl:attribute name="start">
            <xsl:choose>
                <!-- Added to Retain the start number value Azure 1552 -->
                <xsl:when test="number($start)">
                    <xsl:value-of select="$start"/>
                </xsl:when>
                <xsl:when test="matches(upper-case($start), '[^IVXLCDM]|II[^I]|IIII+|XXXX+|CCCC+|V[^I]|[^I]?I[VX][IVXLCDM]|[^I]?I[^VIX]')">                    
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="num:roman(upper-case($start), 0)"/>
                </xsl:otherwise>
            </xsl:choose>            
        </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>    
    <xsl:function name="num:roman" as="xs:integer">
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
    </xsl:function>
    <!-- 13-JUNE-18: changing start="III" to start="3" ENDS -->
    <!-- 13-JUNE-18: changing start="Z" to start="26" -->
    <xsl:template match="ol[@type='A' or @type='a']">
        <xsl:variable name="start" select="upper-case(@start)"/>
        <xsl:element name="ol">
            <xsl:copy-of select="@* except (@ColumnValue|@StoryValue|@txtFrameId|@listtype|@numberFormat|@numberType|@start|@w:rsidR)"/>
            <xsl:attribute name="start">
                <!--<xsl:analyze-string select="" regex=""></xsl:analyze-string>-->
                <xsl:choose>
                    <xsl:when test="contains($start,'A')">
                        <xsl:value-of select="'1'"/>
                    </xsl:when>
                    <xsl:when test="$start = 'B'">
                        <xsl:value-of select="'2'"/>
                    </xsl:when>
                    <xsl:when test="$start = 'C'">
                        <xsl:value-of select="'3'"/>
                    </xsl:when>
                    <xsl:when test="$start = 'D'">
                        <xsl:value-of select="'4'"/>
                    </xsl:when>
                    <xsl:when test="$start = 'E'">
                        <xsl:value-of select="'5'"/>
                    </xsl:when>
                    <xsl:when test="$start = 'F'">
                        <xsl:value-of select="'6'"/>
                    </xsl:when>
                    <xsl:when test="$start = 'G'">
                        <xsl:value-of select="'7'"/>
                    </xsl:when>
                    <xsl:when test="$start = 'H'">
                        <xsl:value-of select="'8'"/>
                    </xsl:when>
                    <xsl:when test="$start = 'I'">
                        <xsl:value-of select="'9'"/>
                    </xsl:when>
                    <xsl:when test="$start = 'J'">
                        <xsl:value-of select="'10'"/>
                    </xsl:when>
                    <xsl:when test="$start = 'K'">
                        <xsl:value-of select="'11'"/>
                    </xsl:when>
                    <xsl:when test="$start = 'L'">
                        <xsl:value-of select="'12'"/>
                    </xsl:when>
                    <xsl:when test="$start = 'M'">
                        <xsl:value-of select="'13'"/>
                    </xsl:when>
                    <xsl:when test="$start = 'N'">
                        <xsl:value-of select="'14'"/>
                    </xsl:when>
                    <xsl:when test="$start = 'O'">
                        <xsl:value-of select="'15'"/>
                    </xsl:when>
                    <xsl:when test="$start = 'P'">
                        <xsl:value-of select="'16'"/>
                    </xsl:when>
                    <xsl:when test="$start = 'Q'">
                        <xsl:value-of select="'17'"/>
                    </xsl:when>
                    <xsl:when test="$start = 'R'">
                        <xsl:value-of select="'18'"/>
                    </xsl:when>
                    <xsl:when test="$start = 'S'">
                        <xsl:value-of select="'19'"/>
                    </xsl:when>
                    <xsl:when test="$start = 'T'">
                        <xsl:value-of select="'20'"/>
                    </xsl:when>
                    <xsl:when test="$start = 'U'">
                        <xsl:value-of select="'21'"/>
                    </xsl:when>
                    <xsl:when test="$start = 'V'">
                        <xsl:value-of select="'22'"/>
                    </xsl:when>
                    <xsl:when test="$start = 'W'">
                        <xsl:value-of select="'23'"/>
                    </xsl:when>
                    <xsl:when test="$start = 'X'">
                        <xsl:value-of select="'24'"/>
                    </xsl:when>
                    <xsl:when test="$start = 'Y'">
                        <xsl:value-of select="'25'"/>
                    </xsl:when>
                    <xsl:when test="$start = 'Z'">
                        <xsl:value-of select="'26'"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$start"/>
                    </xsl:otherwise>
                </xsl:choose>            
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <!-- 13-JUNE-18: changing start="Z" to start="26" ENDS-->
    
    <!-- 28-JUNE-18: Give <p> tag for empty <td>, asked by Mariselvan -->
    <!-- Again Told me to commented -->
    <!--<xsl:template match="td[not(descendant::p)]">
        <xsl:text>&#x000A;</xsl:text>
        <xsl:element name="td">
            <xsl:copy-of select="@*"/>
            <xsl:element name="p">
                <xsl:text disable-output-escaping="yes">&lt;br/&gt;</xsl:text>
            </xsl:element>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    -->
    <!-- 28-JUNE-18: Give <p> tag for empty <td>, asked by Mariselvan ENDS -->
    
    <!-- 14-AUG-18: Apply MATHMl from *.mml file -->
    <!--<xsl:template match="//img">
    <xsl:variable name="imgname" select="substring-before(tokenize(@src,'/')[last()],'.')"/>
         <xsl:variable name="imgname1" select="replace(substring-before(tokenize(@src,'/')[last()],'.'),' ','%20')"/>
        <xsl:variable name="eqName">
            <xsl:value-of select="concat(substring-before(tokenize(@src,'/')[last()],'.'),'.mml')"/>     
        </xsl:variable>
        <xsl:variable name="epsName">
            <xsl:value-of select="concat(substring-before(tokenize(@src,'/')[last()],'.'),'.eps')"/>            
        </xsl:variable>
       
        <xsl:variable name="mathName" select="document($eqName)"/>
        
        <xsl:choose>
            <xsl:when test="string-length(document($eqName))">                
                <xsl:element name="span">
                    <xsl:attribute name="data-fileName" select="$epsName"/>
                <xsl:apply-templates select="$mathName"/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <!-\-<xsl:if test="$imagesize//Story//EPS[Link[contains(@LinkResourceURI,$imgname)]]">-\->
                    <!-\-Added for wyciwyg image resize on 23-11-2020-\->
                    <xsl:for-each select="$imagesize//Story//EPS[Link[contains(replace(replace(replace(@LinkResourceURI,'%28','('),'%29',')'),'%20', ' '),$imgname)]] | $imagesize//Story//EPS[Link[contains(replace(replace(replace(@LinkResourceURI,'%28','('),'%29',')'),'%20', ' '),$imgname1)]]">
                        <xsl:variable name="KeyValuePair" select="Properties/Label/KeyValuePair/@Value"/>
                        <xsl:attribute name="style">
                            <!-\-<xsl:text disable-output-escaping="yes">width: </xsl:text>
                            <xsl:value-of select="substring-before(substring-after($KeyValuePair,'W_'),'_H')"/>
                         <xsl:text disable-output-escaping="yes">px;</xsl:text>-\->
                         <xsl:text disable-output-escaping="yes">height: </xsl:text>
                            <xsl:value-of select="substring-before(substring-after($KeyValuePair,'H_'),'_C')"/>
                            <xsl:text disable-output-escaping="yes">px;</xsl:text> 
                        
                        </xsl:attribute>
                    </xsl:for-each>
                    <xsl:for-each select="$imagesize//Story//Image[Link[contains(replace(replace(replace(@LinkResourceURI,'%28','('),'%29',')'),'%20', ' '),$imgname)]] | $imagesize//Story//Image[Link[contains(replace(replace(replace(@LinkResourceURI,'%28','('),'%29',')'),'%20', ' '),$imgname1)]]">
                        <xsl:variable name="KeyValuePair" select="Properties/Label/KeyValuePair/@Value"/>
                        <xsl:attribute name="style">
                            <xsl:text disable-output-escaping="yes">width: </xsl:text>
                            <xsl:value-of select="substring-before(substring-after($KeyValuePair,'W_'),'_H')"/>
                            <xsl:text disable-output-escaping="yes">px;</xsl:text>
                            <xsl:text disable-output-escaping="yes">height: </xsl:text>
                            <xsl:value-of select="substring-before(substring-after($KeyValuePair,'H_'),'_C')"/>
                            
                            <xsl:text disable-output-escaping="yes">px;</xsl:text>
                        </xsl:attribute>
                    </xsl:for-each>
                    <!-\-</xsl:if>-\->
                    <xsl:copy-of select="@*"/>
                    <xsl:apply-templates/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    --><xsl:template match="//span//img">
        <xsl:variable name="imgname" select="substring-before(tokenize(@src,'/')[last()],'.')"/>
        <xsl:variable name="imgname1" select="replace(substring-before(tokenize(@src,'/')[last()],'.'),' ','%20')"/>
        <xsl:variable name="eqName">
            <xsl:value-of select="concat(substring-before(tokenize(@src,'/')[last()],'.'),'.mml')"/>            
        </xsl:variable>
        <xsl:variable name="epsName">
            <xsl:value-of select="concat(substring-before(tokenize(@src,'/')[last()],'.'),'.eps')"/>            
        </xsl:variable>        
        <xsl:variable name="mathName" select="document($eqName)"/>
        
        <xsl:choose>
            <xsl:when test="string-length(document($eqName))">                
                <xsl:element name="span">
                    <xsl:attribute name="data-fileName" select="$epsName"/>
                    <xsl:apply-templates select="$mathName"/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <!--Added for wyciwyg image resize on 23-11-2020-->
                    <xsl:for-each select="$imagesize//Story//EPS[Link[contains(replace(replace(replace(@LinkResourceURI,'%28','('),'%29',')'),'%20', ' '),$imgname)]] | $imagesize//Story//EPS[Link[contains(replace(replace(replace(@LinkResourceURI,'%28','('),'%29',')'),'%20', ' '),$imgname1)]]">
                        <xsl:variable name="KeyValuePair" select="Properties/Label/KeyValuePair/@Value"/>
                        <xsl:attribute name="style">
                            <!--<xsl:text disable-output-escaping="yes">width: </xsl:text>
                            <xsl:value-of select="substring-before(substring-after($KeyValuePair,'W_'),'_H')"/>
                            <xsl:text disable-output-escaping="yes">px;</xsl:text>-->
                            <xsl:text disable-output-escaping="yes">height: </xsl:text>
                            <xsl:value-of select="substring-before(substring-after($KeyValuePair,'H_'),'_C')"/>
                            <xsl:text disable-output-escaping="yes">px;</xsl:text>
                            
                        </xsl:attribute>
                    </xsl:for-each>
                    <xsl:for-each select="$imagesize//Story//Image[Link[contains(replace(replace(replace(@LinkResourceURI,'%28','('),'%29',')'),'%20', ' '),$imgname)]] | $imagesize//Story//Image[Link[contains(replace(replace(replace(@LinkResourceURI,'%28','('),'%29',')'),'%20', ' '),$imgname1)]]">
                        <xsl:variable name="KeyValuePair" select="Properties/Label/KeyValuePair/@Value"/>
                        <xsl:attribute name="style">
                            <xsl:text disable-output-escaping="yes">width: </xsl:text>
                            <xsl:value-of select="substring-before(substring-after($KeyValuePair,'W_'),'_H')"/>
                            <xsl:text disable-output-escaping="yes">px;</xsl:text>
                            <xsl:text disable-output-escaping="yes">height: </xsl:text>
                            <xsl:value-of select="substring-before(substring-after($KeyValuePair,'H_'),'_C')"/>
                            
                            <xsl:text disable-output-escaping="yes">px;</xsl:text>
                        </xsl:attribute>
                    </xsl:for-each>
                    
                    <xsl:copy-of select="@*"/>
                    <xsl:apply-templates/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="//imgXXXXX[contains(@src, 'Equation')]">
        <xsl:variable name="eqName">
            <xsl:value-of select="substring-before(substring-after(@src,'../images/'),'.')"/>            
        </xsl:variable>
        
        
        <xsl:for-each select="collection('.?select=*.mml')">
            <xsl:variable name="mmlName">
                <xsl:value-of select="substring-before(tokenize(document-uri(.), '/')[last()],'.')"/>
                <xsl:value-of select="concat(substring-before(substring-after(@src,'../images/'),'.'),'.mml')"/>      
            </xsl:variable>
            <xsl:choose>
                <xsl:when test="$eqName = $mmlName">
                    <xsl:variable name="mathML" select="document-uri($mmlName)"/>
                    
                    <xsl:apply-templates/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:copy>
                        <xsl:copy-of select="@*"/>
                        <xsl:apply-templates/>
                    </xsl:copy>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="Rectangle">
        <xsl:apply-templates select="child::div"/>
    </xsl:template>
    
    <!--commented for marriapn editor i/i issue on 12-3-2021-->
    <xsl:template match="span[lower-case(@class)='italic']/i">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="span[lower-case(@class)='bold']/b">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="i//i">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="b//b">
        <xsl:apply-templates/>
    </xsl:template>
    <!--Added to retain the small caps 29-03-2021-->
    <!--<xsl:template match="p[AllNestedStyles/ListItem/Delimiter]">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:variable name="vParas1" select="normalize-space(.)"/>
           <xsl:variable name="vParas" select="tokenize(.,' ')"/>
            
            <xsl:variable name="Droplong1">
                
                    
                
                <xsl:if test="self::p/AllNestedStyles/ListItem[@DropCapCharacters][AppliedCharacterStyle[contains(@Value,'CharacterStyle/DropCap')]][Delimiter[@Value='Dropcap']]/Repetition[@type='long'][@Value]">
                        
                        <xsl:value-of select="self::p/AllNestedStyles/ListItem[@DropCapCharacters][AppliedCharacterStyle[contains(@Value,'CharacterStyle/DropCap')]][Delimiter[@Value='Dropcap']]/@DropCapCharacters"/>  
                    </xsl:if>
                    
                
                          <!-\-<xsl:if test="self::p/AllNestedStyles/ListItem[AppliedCharacterStyle[contains(@Value,'CharacterStyle/DropCap')]][Delimiter[@Value='Dropcap']]/Repetition[@type='long'][@Value]">
                    
                <xsl:value-of select="self::p/AllNestedStyles/ListItem[AppliedCharacterStyle[contains(@Value,'CharacterStyle/DropCap')]][Delimiter[@Value='Dropcap']]/Repetition[@type='long'][@Value]/@Value"/>  
                </xsl:if>-\->
            </xsl:variable>
            
               <xsl:variable name="Droplong">
                    <xsl:if test="self::p/AllNestedStyles/ListItem[AppliedCharacterStyle[contains(@Value,'CharacterStyle/DropCap')]][Delimiter[@Value='Dropcap']]/Repetition[@type='long'][@Value]">
                    <xsl:value-of select="self::p/AllNestedStyles/ListItem[AppliedCharacterStyle[contains(@Value,'CharacterStyle/DropCap')]][Delimiter[@Value='Dropcap']]/Repetition[@type='long'][@Value]/@Value"/>
                    </xsl:if>
                </xsl:variable>
            
            
            
            <xsl:variable name="smalllong">
                <xsl:if test="self::p/AllNestedStyles/ListItem[AppliedCharacterStyle[contains(@Value,'Introductory text')]][Delimiter[@Value='AnyWord']]/Repetition[@type='long'][@Value]">
                    
                    <xsl:variable name="val">
                        <xsl:value-of select="self::p/AllNestedStyles/ListItem[AppliedCharacterStyle[contains(@Value,'Introductory text')]][Delimiter[@Value='AnyWord']]/Repetition[@type='long'][@Value]/@Value"/>
                    </xsl:variable>
                    
                    <xsl:if test="string-length($val) &gt; 0">
                    <xsl:value-of select="$val"/>
                    </xsl:if>
                </xsl:if>
                 </xsl:variable>
            
            <xsl:variable name="smalldrop">
                <xsl:if test="string-length($Droplong) &gt; 0">
                    <xsl:value-of select="$smalllong -($Droplong1 - $Droplong)"/>
                </xsl:if>
                
            </xsl:variable>
            <xsl:variable name="Dropcaptext">
                <xsl:if test="string-length($Droplong) &gt; 0">
                      <xsl:value-of select="substring($vParas[1],1,$Droplong)"/>
                      
                        <!-\-<xsl:variable name="val"><xsl:value-of select="$vParas1"/></xsl:variable>
                        <xsl:variable name="val1"><xsl:value-of select="substring($val,1,1)"/></xsl:variable>
                        <xsl:choose>
                            <xsl:when test="matches($val1,'([A-Za-z])')">
                                <xsl:value-of select="$val1"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:variable name="val2"><xsl:value-of select="substring($val,1,2)"/></xsl:variable>
                                <xsl:choose>
                                    <xsl:when test="matches($val2,'([A-Za-z])')">
                                        
                                        <xsl:value-of select="$val2"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="substring($val,1,3)"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                                
                            </xsl:otherwise>
                        </xsl:choose>-\->
                    
                </xsl:if>
            </xsl:variable>
            
            <xsl:variable name="smallcaptext">
                <xsl:if test="string-length($smalllong) &gt; 0">
                    <xsl:choose>
                        <xsl:when test="string-length($Droplong1) &gt; 0">
                            <xsl:for-each select="1 to $smalldrop">
                                <xsl:variable name="long" select="."/>
                                <xsl:value-of select="$vParas[$long]"/>
                                <xsl:value-of select="' '"/>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:for-each select="1 to $smalllong">
                                <xsl:variable name="long" select="."/>
                                <xsl:value-of select="$vParas[$long]"/>
                                <xsl:value-of select="' '"/>
                            </xsl:for-each>
                        </xsl:otherwise>
                    </xsl:choose>
                    <!-\-<xsl:for-each select="1 to $smalllong">
                    <xsl:variable name="long" select="."/>
                    <xsl:value-of select="$vParas[$long]"/>
                    <xsl:value-of select="' '"/>
                </xsl:for-each>-\->
                </xsl:if>
            </xsl:variable>
            
            
            <xsl:if test="string-length($Dropcaptext) &gt; 0">
               <xsl:element name="span">
             <xsl:attribute name="class" select="'DropCap'"/>
                    <xsl:value-of select="$Dropcaptext"/>
                </xsl:element>
            </xsl:if> 
            <xsl:if test="string-length($smallcaptext) &gt; 0">
              <xsl:element name="small">
                <xsl:attribute name="style">
                    <xsl:value-of select="'text-transform: uppercase;'"/>
                </xsl:attribute>
                  <xsl:value-of select="substring-after($smallcaptext,$Dropcaptext)"/>
            </xsl:element>
            </xsl:if>
           <xsl:value-of select="substring-after(.,$smallcaptext)"/>
       </xsl:copy>
    </xsl:template>-->
    <!--Added uppercase and tosmallcaps for wycywyg for marripan on 23-08-203-->
    <xsl:template match="span[contains(@style,'uppercase')][not(@class)]">      
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:attribute name="class" select="'touppercase'"/>
            <xsl:attribute name="data-name" select="'touppercase'"/>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="span[contains(@style,'small-caps')][not(@class)]">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:variable name="vTarget">'</xsl:variable>
            <xsl:attribute name="style">
                <xsl:value-of select="translate(string(@style),$vTarget,'')"/>
            </xsl:attribute>
            <xsl:attribute name="class" select="'tosmallcaps'"/>
            <xsl:attribute name="data-name" select="'tosmallcaps'"/>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>
    <!--Added for wycywyg instruction retain on 16-09-2021-->
    <xsl:template match="Comment">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            
            <xsl:variable name="keypairVal" select="parent::CommentReference/@data-noteID"/>
            <!-- Added for contains($keypairVal,'PAGE BREAK') on 23-3-2022 -->
            <xsl:if test="contains($keypairVal,'RRH') or contains($keypairVal,'LRH') or contains($keypairVal,'SPACE') or contains($keypairVal,'IMG') or contains($keypairVal,'VRH') or contains($keypairVal,'POSITION') or contains($keypairVal,'ORIENTATION') or contains($keypairVal,'PAGE BREAK')">
                    
                <!--<xsl:if test="parent::CommentReference[contains(parent::CommentReference/@data-noteID,'_PLACED')]">
                            <xsl:attribute name="data-noteID">
                                <xsl:value-of select="substring-before(parent::CommentReference/@data-noteID,'_PLACED')"/>
                            </xsl:attribute>
                        </xsl:if>-->
                    <xsl:attribute name="data-type">
                        <xsl:value-of select="substring-before(parent::CommentReference/@data-noteID,'_PLACED')"/>
                    </xsl:attribute>
                    <xsl:attribute name="data-instruction" select="'true'"/>
                    <xsl:attribute name="data-placement" select="'false'"/>
                </xsl:if>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>
    <!--updated for style with space issue on 26-08-2021-->
    <xsl:template match="*/@class">
        <xsl:attribute name="class">
            <xsl:value-of select="normalize-space(.)"/>
        </xsl:attribute>
    </xsl:template>
    <xsl:template match="*/@data-name">
        <xsl:attribute name="data-name">
            <xsl:value-of select="normalize-space(.)"/>
        </xsl:attribute>
    </xsl:template>
    
    <!--<xsl:template match="span[@w:rsidR = parent::*/@w:rsidR]">
        <xsl:copy>
            <xsl:copy>
                <xsl:copy-of select="@* except @w:rsidR"/>
                <xsl:apply-templates/>
            </xsl:copy>
        </xsl:copy>
    </xsl:template>-->
    <!-- Added for images to html5 format on 23-11-2021 -->
    <!--<xsl:template match="p[string-length(.) = 0][img][following-sibling::*[self::figure]]"/>-->
    <!--End-->
    
    <!-- Added for endnote sorting issue in wycywyg on 7-12-2021 -->
    <xsl:template match="aside/ul/p[not(parent::li)]">
        <xsl:if test="self::p[not(parent::li)][preceding-sibling::*[1][self::li[p[child::span[@class='EndnoteNumber' or @data-name='EndnoteNumber']]]]][following-sibling::*[1][self::li[p[child::span[@class='EndnoteNumber' or @data-name='EndnoteNumber']]]]]">
            <xsl:text disable-output-escaping="yes">&lt;/ul&gt;</xsl:text>
            <xsl:text disable-output-escaping="yes">&lt;/aside&gt;</xsl:text>
        </xsl:if>
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
        <xsl:if test="self::p[not(parent::li)][preceding-sibling::*[1][self::li[p[child::span[@class='EndnoteNumber' or @data-name='EndnoteNumber']]]]][following-sibling::*[1][self::li[p[child::span[@class='EndnoteNumber' or @data-name='EndnoteNumber']]]]]">
        <xsl:text disable-output-escaping="yes">&lt;aside id="endnote_"&gt;</xsl:text>
        <xsl:text disable-output-escaping="yes">&lt;ul type="none"&gt;</xsl:text>
        </xsl:if>
    </xsl:template>
    <!-- End -->
    <!--emptypara class added for mariappan on 14-12-2021-->
    <!--emptypara class added for li on 21-1-2022-->
    <!-- correction done on 27-12-2021 -->
    <xsl:template match="p[string-length(.)=0][not(descendant::img)][not(descendant::Comment)][not(@data-noemptypara)]|p[string-length(.)=0][child::br or child::Br][not(descendant::img)][not(descendant::Comment)][not(@data-noemptypara)] | p[. =' '][not(descendant::img)][not(descendant::Comment)][not(@data-noemptypara)] | p[. = '&#x9;'][not(descendant::img)][not(descendant::Comment)][not(@data-noemptypara)] | p[. = '&amp;nbsp;'][not(descendant::img)][not(descendant::Comment)][not(@data-noemptypara)]| p[. = '&#xA0;'][not(descendant::img)][not(descendant::Comment)][not(@data-noemptypara)] | li[string-length(.)=0][not(descendant::img)][not(descendant::Comment)] | li[string-length(.)=0][child::br or child::Br][not(descendant::img)][not(descendant::Comment)] | li[. =' '][not(descendant::img)][not(descendant::Comment)] | li[. = '&#x9;'][not(descendant::img)][not(descendant::Comment)] | li[. = '&amp;nbsp;'][not(descendant::img)][not(descendant::Comment)]| li[. = '&#xA0;'][not(descendant::img)][not(descendant::Comment)]">
            <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:attribute name="class" select="'emptypara'"/>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>
    <!--end-->
    <!-- Added to remove the data-noemptypara on 23-2-2022 -->
    <!-- Added [not(parent::li[@class='endnotecaption'])] for empty para retained in review xhtml on 16-3-2022 -->
    <xsl:template match="p[@data-noemptypara][string-length(.)=0][not(descendant::img)][not(descendant::Comment)][not(descendant::span[@pagesplit])]"/>
    <!-- added to highlight the tab on 03-03-2023 -->
    <xsl:template match="p[@data-noemptypara][string-length(normalize-space(.))=0][.='&#x9;' or .=' '][not(descendant::img)][not(descendant::Comment)][not(descendant::span[@pagesplit])]">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:attribute name="class" select="'emptypara'"/>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="p[@data-noemptypara][not(descendant::span[@pagesplit])]/@data-noemptypara"/>
    
    <!-- Added for editor pagebreak on 9-3-2022 -->
    <!--<xsl:template match="CommentReference/Comment[lower-case(.)='after' or lower-case(.)='before' or contains(normalize-space(.),'After') or contains(normalize-space(.),'Before')]">
            <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:attribute name="data-instruction" select="'true'"/>
            <xsl:attribute name="data-type" select="'PAGE BREAK'"/>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>-->
    <xsl:variable name="stycoll" select="$stylecoll//stylesList//style[@name = 'DZP_Head1'][not(@editor='false' or @wyciwyg='false')]/@replacement"/>
    <xsl:template match="li[@class='endnotecaption'][descendant::span[@class='EndnoteNumber' or @data-name='EndnoteNumber']/a][not(preceding::span[@class = 'endnotereference' or @data-name='endnote reference'][parent::li[@class='endnotecaption']]/child::a)][p[@class = $stycoll or @class = 'H1' or contains(@class,'Head1')]]">
        <xsl:copy>
            <xsl:apply-templates select="@*|node() except p[@class = $stycoll or @class = 'H1' or contains(@class,'Head1')]"/>
        </xsl:copy>
        <xsl:element name="li">
            <xsl:apply-templates select="p[@class = $stycoll or @class = 'H1' or contains(@class,'Head1')]"/>
        </xsl:element>
    </xsl:template>
    <!-- Endnote duplicate removed when comes with double w:t on Azure 7788 on 12-4-2023 -->
    <xsl:template match="span[@class='endnotereference' or @data-name='endnote reference']/text()[. = following-sibling::a[@class='endnotecitation'][1]/normalize-space(.)]"/>
    <xsl:template match="span[@class='EndnoteNumber' or @data-name='EndnoteNumber']/text()[normalize-space(.) = following-sibling::a[@class='crossref'][1]/normalize-space(.)]"/>
    <!-- To Remove emptypara inside the textbox on 21-4-2023 Azure 7002 -->
    <xsl:template match="//div[@data-type='textbox']//p[1][@class='' and @data-name=''][not(descendant::img)][not(descendant::Comment)][child::*]">
    <xsl:apply-templates/>
    </xsl:template>
    <!-- Added for listtype on 8-12-2023 Azure 1552 -->
    <xsl:template match="ol/li[@start]/@start"/>
    <!-- Added to avoid the italic missing issue on 15-4-2024 Azure 13724 -->
    <xsl:template match="span[@class = parent::span/@class and @data-name = parent::span/@data-name]">
        <xsl:apply-templates/>
    </xsl:template>
    <!-- Added to avoid the multiple id value for same id by content splited in idml on 25-04-2024 Azure 14417 -->
    <xsl:template match="aside/ul/li[contains(@id,' ')]/@id">
        <xsl:attribute name="id">
        <xsl:value-of select="substring-before(.,' ')"/>
        </xsl:attribute>
    </xsl:template>
    <xsl:template match="span[contains(lower-case(@class),'url')]">
        <xsl:element name="a">
            <xsl:attribute name="href"><xsl:value-of select="self::span[contains(lower-case(@class),'url')]/replace(.,'&#x200B;','')"/></xsl:attribute>
            <xsl:value-of select="self::span[contains(lower-case(@class),'url')]/replace(.,'&#x200B;','')"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="//span[contains(lower-case(@class),'hyperlink')]">
        <xsl:element name="a">
            <xsl:attribute name="href"><xsl:value-of select="self::span[contains(lower-case(@class),'hyperlink')]/replace(.,'&#x200B;','')"/></xsl:attribute>
            <xsl:value-of select="self::span[contains(lower-case(@class),'hyperlink')]/replace(.,'&#x200B;','')"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="//span[contains(lower-case(@class),'website')]">
        <xsl:element name="a">
            <xsl:attribute name="href"><xsl:value-of select="self::span[contains(lower-case(@class),'website')]/replace(.,'&#x200B;','')"/></xsl:attribute>
            <xsl:value-of select="self::span[contains(lower-case(@class),'website')]/replace(.,'&#x200B;','')"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="//span[contains(lower-case(@class),'doi')]">
        <xsl:element name="a">
            <xsl:attribute name="href"><xsl:value-of select="self::span[contains(lower-case(@class),'doi')]/replace(.,'&#x200B;','')"/></xsl:attribute>
            <xsl:value-of select="self::span[contains(lower-case(@class),'doi')]/replace(.,'&#x200B;','')"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="//span[lower-case(@class)='sup' or contains(lower-case(@class),'sup') or lower-case(@data-name)='sup']">
        <xsl:text disable-output-escaping="yes">&lt;sup&gt;</xsl:text>
        <xsl:apply-templates/>
        <xsl:text disable-output-escaping="yes">&lt;/sup&gt;</xsl:text>
    </xsl:template>
    <xsl:template match="//span[lower-case(@class)='italic' or contains(lower-case(@class),'italic') or lower-case(@data-name)='italic' or contains(lower-case(@style),'italic')]">
        <xsl:text disable-output-escaping="yes">&lt;i&gt;</xsl:text>
        <xsl:apply-templates/>
        <xsl:text disable-output-escaping="yes">&lt;/i&gt;</xsl:text>
    </xsl:template>
    <xsl:template match="//span[lower-case(@class)='bold' or contains(lower-case(@class),'bold') or lower-case(@data-name)='bold']">
        <xsl:text disable-output-escaping="yes">&lt;b&gt;</xsl:text>
        <xsl:apply-templates/>
        <xsl:text disable-output-escaping="yes">&lt;/b&gt;</xsl:text>
    </xsl:template>
    <xsl:template match="//span[contains(lower-case(@data-name),'footnotenumber')][. =' ']">
        <xsl:apply-templates/>
    </xsl:template>
    </xsl:stylesheet>