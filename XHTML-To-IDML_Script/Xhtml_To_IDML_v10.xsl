<!--Updated Box ContentControl 16.11.2017 -->
<!-- remove Fontstyle attribute 20.11.2017 -->
<!-- Updated Character XML element 21.11.2017 -->
<!-- Updated commentreference change to CommentReference  12.12.2017 -->
<!-- Updated multiple para in table/td {13.12.2017} -->
<!--Add new commentreference moveme function 19.12.2017-->
<!--Updated {Mahesh} p/@data-name to @data-name 27.12.2017-->
<!--TableSource,UN-TableSource,TBS,TSN 28.12.2017 {Mahesh}-->
<!--Updated Br tag {Mahesh} 28.12.2017-->
<!--Update FootNote {Mahesh} 28.12.2017-->
<!--Updated Enspace Entity {03.01.2018}-->
<!--Updated br element {10.01.2017} -->
<!--Updated {Mahesh} 11.01.2017 -->
<!-- Br Tad Template Match include 25.01.2017 -->
<!--COPMI Condition Added{05.02.2017}-->
<!--Tab 08.02.2017-->
<!--Footnote characterstyle {Check} 08.02.2017-->
<!--For index Purpose 14.02.2017-->
<!--Add one more Condition {CaseStudyTitle}20.02.2017 -->
<!--Footnote Character Style 20.02.2017 -->
<!--Updated on 07.03.2017 condition For Bookmark issue Jensen Chap09-->
<!--Updated Unwanted Br Issue 02.04.2018 -->
<!--added contains for table div class values updated for table 23.04.2018-->   
<!--To Resove .. in linkend 18.5.2018-->
<!--.. issue in linkend 18.5.2018-->    
<!--updation for additional photoPMI 29-5-2018-->
<!--To avoid @data-name value space 2-6-2018-->
<!--update for PMI text Retain 20-6-2018-->
<!--Figure Name Match With Artlog 3-12-2018-->
<!--1-2-2019 to avoid double enter mark in table column-->
<!--Add the comment for without group tag 21-2-2019-->
<!--Remove not(./ancestor::span[@data-name]) 6-3-2019 -->
<!--changes based on href 1-4-2019-->
<!--updated for entermark b/w p and ul or ol and first p within div 3-5-2019-->
<!--For Hyperlink 19-6-2019 changes done in designmp.xml, Idml3.xsl-->
<!--[not(@alt ='image')] to avoid <img data-split="d1e2744" src="../images/" class="_idGenObjectAttribute-1" alt="image"/> 10-9-2019-->
<!--conditional text for mariappan 12-1-2020-->
<!--10-05-2020, Added for without TableGroup-->
<!--Added for Alt test value for marriapan 16-06-2020-->
<!--commented for equation concept changed by Bhaskar 02-06-2020-->
<!--Added [1] on 08-06-2020-->
<!--Added for Alt test value for marriapan 16-06-2020-->
<!--Added "SupplFigureGroup',MovieGroup, SuppFigureRef,Movieref, SupplMovieRef and group,SupplTableRef and group, on  16-06-202-->
<!--to floating element figure "id" retain for linking purpose of epub 24-7-2020-->
<!--Added on 27-10-2020 to avoid unwanted image-->
<!--Added to image name match with artlog on 04-01-2021-->
<!--Added for index on 25-01-2021-->
<!--Added on 08-02-2021 for marriapn commentgroup text missing-->
<!-- IllustrationRef added on 29-04-2021 -->
<!--Added for indd running head on 29-04-2021-->
<!--Added self::p[following-sibling::*[1][self::ol]] for table list merge issue on 30-04-2021-->
<!--Added for endnote module on 19-07-2021-->
<!--added for notes module on 09-08-2021-->
<!--Added on 31-08-2021 for image Editor-->
<!--Added to avoid "-" style in  table on 04-10-2021-->
<!-- hyperlink update from xhtml to idml on 9-11-2021 -->
<!-- Added for image resize on 18-11-2021 -->
<!-- Added for bookmark on 13-12-2021 -->
<!-- Added toavoid the entermark not(self::li[@class='endnotecaption']) on 21-12-2021  -->
<!-- Added to avoid tab and text missing while text merge with data-tab span on 23-12-2021-->
<!-- Added for editor pagebreak on 9-3-2022 -->
<!-- Added for badbreak on 6-4-2022 -->
<!-- footnote structure change on 9-6-2022 -->
<!-- Added to retain the endnotes id's on 8-7-2022 -->
<!-- Added to avoid the space issue in data-name(Ex: endnote reference) for XMLElement on 10-10-2022 -->
<!--Added for multiple insert images on 15-12-2022-->
<!-- New data-final-size attribute added on 26-12-2022 -->
<!-- Added for prakash Toc title in sequence on 12-5-2023 -->
<!-- Added for xmlelement under br for paneer  on 12-5-2023-->
<!--commented to avoid the property value as a text in indesign on  29-6-2023-->
<!-- Added for empty BB break Azure 5516 on 28-7-2023 -->
<!-- List type on 05-10-2023 Azure 1552 -->
<!-- Added to avoid the box unorder issue on 9-1-2024  Azure 12513-->
<!-- Added for italic missing in  Azure 13724 02-4-2024 -->
<!-- Added for inlineref Azure 15087 on 11-06-2024-->
<!-- Added to remove the duplicate by float struture with inline image [not(following-sibling::*[1][self::figcaption])] 5-12-2024 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:cp="http://schemas.openxmlformats.org/package/2006/metadata/core-properties"
    xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/"
    xmlns:dcmitype="http://purl.org/dc/dcmitype/"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"
    xmlns:vt="http://schemas.openxmlformats.org/officeDocument/2006/docPropsVTypes"
    xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing"
    xmlns:w10="urn:schemas-microsoft-com:office:word"
    xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup"
    xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main"
    xmlns:pic="http://schemas.openxmlformats.org/drawingml/2006/picture"
    xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
    xmlns:mf="http://example.com/mf" xmlns:v="urn:schemas-microsoft-com:vml"
    xmlns:a14="http://schemas.microsoft.com/office/drawing/2010/main"
    exclude-result-prefixes="v a14 a wpg pic wp r xs mf cp dc vt mc"
    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" version="2.0">
    <xsl:output indent="yes" use-character-maps="Ascii2Unicode"/>
    <!--<xsl:strip-space elements="*"/>
	<xsl:preserve-space elements="Content"/>
	<xsl:preserve-space elements="span"/>
	<xsl:preserve-space elements="p"/>     use-character-maps="Ascii2Unicode"-->
    <xsl:variable name="artlog" select="document('Artlog.xml')"/>
    <xsl:variable name="StylesCollect" select="document('StylesCollection.xml')"/>
    <!--Added for Alt test value for marriapan 16-06-2020-->
    <xsl:variable name="Alttext" select="//div[contains(@id,'artDetails')]"/>
    <xsl:template match="/">
        <idPkg:BackingStory xmlns:idPkg="http://ns.adobe.com/AdobeInDesign/idml/1.0/packaging"
            DOMVersion="8.0">
            <xsl:text>&#x000A;</xsl:text>
            <xsl:element name="XmlStory">
                <xsl:attribute name="AppliedTOCStyle">
                    <xsl:value-of select="'n'"/>
                </xsl:attribute>
                <xsl:attribute name="StoryTitle">
                    <xsl:value-of select="'$ID/'"/>
                </xsl:attribute>
                <xsl:attribute name="AppliedNamedGrid">
                    <xsl:value-of select="'n'"/>
                    <xsl:text>&#x000A;</xsl:text>
                </xsl:attribute>
                <StoryPreference OpticalMarginAlignment="false" OpticalMarginSize="12"
                    FrameType="TextFrameType" StoryOrientation="Horizontal"
                    StoryDirection="LeftToRightDirection"/>
                <xsl:text>&#x000A;</xsl:text>
                <InCopyExportOption IncludeGraphicProxies="true" IncludeAllResources="false"/>
                <xsl:text>&#x000A;</xsl:text>
                <!--<xsl:element name="XMLElement">
				<xsl:attribute name="Self">
				<xsl:value-of select="'di2'"/>
				</xsl:attribute>
				<xsl:attribute name="MarkupTag">
				<xsl:value-of select="'XMLTag/Root'"/>
				</xsl:attribute>-->
                <xsl:element name="XMLElement">
                    <xsl:attribute name="Self">
                        <xsl:value-of select="'di2'"/>
                    </xsl:attribute>
                    <xsl:attribute name="MarkupTag">
                        <xsl:value-of select="'XMLTag/chapter'"/>
                    </xsl:attribute>
                    <xsl:apply-templates/>
                </xsl:element>
                <!--</xsl:element>-->
                <xsl:text>&#x000A;</xsl:text>
            </xsl:element>
            <xsl:text>&#x000A;</xsl:text>
        </idPkg:BackingStory>
    </xsl:template>
    <xsl:template match="/html">
        <xsl:apply-templates select="body"/>
    </xsl:template>
    <xsl:template match="body">
        <xsl:call-template name="infopath-rich-text"> </xsl:call-template>
    </xsl:template>
    <xsl:template name="infopath-rich-text">
        <xsl:choose>
            <xsl:when
                test="descendant::h1 | descendant::h2 | descendant::h3 | descendant::h4 | descendant::h5 | descendant::h6 | descendant::p | descendant::li">
                <xsl:apply-templates select="* | text()"> </xsl:apply-templates>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <!-- End div-->
    <!-- Equation started on 22.07.2017-->
    <!--commented for equation concept changed by Bhaskar 02-06-2020-->
    <!--<xsl:template match="span[@data-name = 'EquationName']">
        <xsl:variable name="Eqn" select="document('Equation.xml')"/>
        <xsl:variable name="img">
            <xsl:value-of select="."/>
        </xsl:variable>
        <xsl:for-each select="$Eqn/Chapter/art">
            <xsl:variable name="main"
                select="replace(replace(translate(./@Eqnum, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '-', '.'), '_', '.')"/>
            <xsl:variable name="sub"
                select="replace(replace(translate(concat(./@Eqnum, ./subart/@partnum), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '-', '.'), '_', '.')"/>
            <xsl:variable name="artname1" select="./@name"/>
            <xsl:variable name="artname" select="replace(replace($artname1, '_', '.'), '-', '.')"/>
            <xsl:variable name="img1" select="replace(replace($img, '_', '.'), '-', '.')"/>
            <xsl:choose>
                <xsl:when test="./@type = 'Equation'">
                    <xsl:choose>
                        <xsl:when test="$artname eq $img1">

                            <XMLElement Self="di2" MarkupTag="XMLTag/InlineEquation">
                                <XMLElement Self="di2" MarkupTag="XMLTag/links">
                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="linkend" Value="</xsl:text>
                                    <xsl:value-of select="'cha-'"/>
                                    <xsl:value-of select="'F'"/>
                                    <xsl:value-of select="'-'"/>
                                    <xsl:value-of select="$main"/>
                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                </XMLElement>
                                <XMLElement Self="di2" MarkupTag="XMLTag/Image" XMLContent="ua4c2">
                                    <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                        Name="aid:pstyle" Value="EquationNamePMI"/>
                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                    <xsl:value-of select="@path"/>
                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>   
                                </XMLElement>
                            </XMLElement>
                        </xsl:when>
                        <xsl:otherwise>
                            
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>-->
    <xsl:template match="span[lower-case(@data-name) = 'page']">
        <xsl:variable name="id">
            <xsl:value-of select="1694958775 - position()"/>
        </xsl:variable>
        <xsl:variable name="DB"> </xsl:variable>
        <xsl:variable name="Alias">
            <xsl:value-of select="@data-name"/>
        </xsl:variable>
        <xsl:variable name="Tag">
            <xsl:value-of select="@data-name"/>
        </xsl:variable>
        <XMLAttribute Self="di2" Name="ContentControl" Value="True"/>
        <xsl:element name="XMLAttribute">
            <xsl:attribute name="Self" select="'di2'"/>
            <xsl:attribute name="Name">
                <xsl:value-of select="'Alias'"/>
            </xsl:attribute>
            <xsl:attribute name="Value">
                <xsl:choose>
                    <xsl:when test="not(string-length($Alias) = 0)">
                        <xsl:value-of select="$Alias"/>
                    </xsl:when>
                </xsl:choose>
            </xsl:attribute>
        </xsl:element>
        <xsl:element name="XMLAttribute">
            <xsl:attribute name="Self" select="'di2'"/>
            <xsl:attribute name="Name">
                <xsl:value-of select="'Tag'"/>
            </xsl:attribute>
            <xsl:attribute name="Value">
                <xsl:choose>
                    <xsl:when test="not(string-length($Tag) = 0)">
                        <xsl:value-of select="$Tag"/>
                    </xsl:when>
                </xsl:choose>
            </xsl:attribute>
        </xsl:element>
        <xsl:element name="XMLAttribute">
            <xsl:attribute name="Self" select="'di2'"/>
            <xsl:attribute name="Name">
                <xsl:value-of select="'Id'"/>
            </xsl:attribute>
            <xsl:attribute name="Value">
                <xsl:value-of select="$id"/>
            </xsl:attribute>
        </xsl:element>
        <xsl:element name="XMLAttribute">
            <xsl:attribute name="Self" select="'di2'"/>
            <xsl:attribute name="Name">
                <xsl:value-of select="'role'"/>
            </xsl:attribute>
            <xsl:attribute name="Value">
                <xsl:choose>
                    <xsl:when test="not(string-length($Alias) = 0)">
                        <xsl:value-of select="$Alias"/>
                    </xsl:when>
                </xsl:choose>
            </xsl:attribute>
        </xsl:element>
        <xsl:element name="XMLAttribute">
            <xsl:attribute name="Self" select="'di2XMLAttributenWhole'"/>
            <xsl:attribute name="Name">
                <xsl:value-of select="'Whole'"/>
            </xsl:attribute>
            <xsl:attribute name="Value">
                <xsl:value-of select="."/>
            </xsl:attribute>
        </xsl:element>
    </xsl:template>

    <!-- XHTML div -->
    <xsl:template match="h1 | h2 | h3 | h4 | h5 | h6 | p | li |page">
        
        <xsl:param name="pPr_Default"/>
        <xsl:param name="rPr_Default"/>
        <xsl:variable name="als">
            <xsl:choose>
                <xsl:when test="ancestor::div/@data-alias = 'Table Caption'">
                    <xsl:value-of select="ancestor::div[1]/@data-alias"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="ancestor::div/@data-alias"/>
                </xsl:otherwise>
            </xsl:choose>
            <!--Updated on 22/08/2017 please check
				<xsl:choose>
					<xsl:when test="ancestor::span/@data-alias = 'Table Caption'">
						<xsl:value-of select="ancestor::span[1]/@data-alias"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="ancestor::span/@data-alias"/>
					</xsl:otherwise>
				</xsl:choose>-->
        </xsl:variable>
        <xsl:variable name="tag1" select="./@data-name"/>
        <!--XmlElement start-->
        <xsl:element name="XMLElement">
            <xsl:attribute name="Self" select="'di2'"/>
            <xsl:attribute name="MarkupTag">
                <xsl:choose>
                    <xsl:when test="@data-name and (string-length(@data-name) &gt; 0)">
                        <xsl:choose>
                            <!-- Updated {Mahesh} 08.12.2017-->
                            <xsl:when test="@data-name = 'MsoNormal' or @data-name = 'Normal'">
                                <xsl:value-of select="'XMLTag/'"/>
                                <xsl:value-of select="'$ID/[No paragraph style]'"/>
                            </xsl:when>
                            <!-- End Updated {Mahesh} 08.12.2017-->
                            <!--To avoid @data-name value space 2-6-2018-->
                            <xsl:otherwise>
                                <xsl:value-of select="'XMLTag/'"/>
                                <xsl:choose>
                                    <xsl:when test="contains(@data-name, ' ')">
                                        <xsl:value-of select="replace(@data-name, ' ', '_')"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="@data-name"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <!-- Updated {Mahesh} 10.11.2017 -->
                    <xsl:when test="ancestor::ul">
                        <xsl:value-of select="'XMLTag/'"/>
                        <xsl:choose>
                            <xsl:when test="contains(ancestor::ul/@data-name, ' ')">
                                <xsl:value-of
                                    select="replace(ancestor::ul/@data-name, ' ', '_')"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="ancestor::ul/@data-name"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <!-- End Updated {Mahesh} 10.11.2017 -->
                    <xsl:otherwise>
                        <xsl:value-of select="'XMLTag/$ID/[No paragraph style]'"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <!-- Mahesh Updated V6(08/08/2017)
			<xsl:element name="XMLElement">
				<xsl:attribute name="Self" select="'di2'"/>
				<xsl:attribute name="MarkupTag" select="'XMLTag/$ID/[No character style]'"/>
			<xsl:element name="CharacterStyleRange">
				<xsl:attribute name="AppliedCharacterStyle"
					select="'CharacterStyle/$ID/[No character style]'"/>
				<xsl:call-template name="apply-nested-character-formatting">
					<xsl:with-param name="rPr_Default" select="$rPr_Default"/>
				</xsl:call-template>
			</xsl:element>
			</xsl:element>-->
            <!-- Added for bookmark on 13-12-2021 -->
            <!--<xsl:if test="self::*[contains(@id,'para')]/@id">
                       <xsl:element name="CharacterStyleRange">
                        <xsl:attribute name="AppliedCharacterStyle" select="'CharacterStyle/$ID/[No character style]'"/>
                    <xsl:element name="HyperlinkTextDestination">
                        <xsl:attribute name="BookMarkDestination"><xsl:value-of select="'GenerateIndesignUUID_'"/><xsl:value-of select="self::*/@id"/></xsl:attribute>
                        <xsl:attribute name="Self"><xsl:value-of select="'HyperlinkTextDestination/'"/><xsl:value-of select="'GenerateIndesignUUID_'"/><xsl:value-of select="self::*/@id"/></xsl:attribute>
                        <xsl:attribute name="Name"><xsl:value-of select="'GenerateIndesignUUID_'"/><xsl:value-of select="self::*/@id"/></xsl:attribute>
                        <xsl:attribute name="Hidden" select="'true'"/>
                        <xsl:attribute name="DestinationUniqueKey"><xsl:number level="any"/></xsl:attribute>
                    </xsl:element>
                       </xsl:element>
                </xsl:if>-->
            <!-- End -->
            <!-- Added for prakash Toc title in sequence on 12-5-2023 -->
            <xsl:if test="self::p[@chapterId]">
                <xsl:variable name="ranid">
                    <xsl:value-of select="generate-id()"/>
                </xsl:variable>
                <xsl:element name="XMLAttribute">
                    <xsl:attribute name="Self">
                        <xsl:value-of select="concat('di',$ranid)"/>
                        <xsl:value-of select="'XMLAttributetocchapterId'"/></xsl:attribute>
                    <xsl:attribute name="Name" select="'id'"/>
                    <xsl:attribute name="Value"><xsl:value-of select="self::p[@chapterId]/@chapterId"/>
                    </xsl:attribute>
                </xsl:element>
            </xsl:if>
            <!-- Reference link for epub 25-11-2024-->
            <xsl:if test="self::p[@data-alias='Reference' or contains(@href,'#BibRef')]">
                <xsl:variable name="ranid">
                    <xsl:value-of select="generate-id()"/>
                </xsl:variable>
                <xsl:element name="XMLAttribute">
                    <xsl:attribute name="Self" select="concat('di',$ranid)"/>
                    <xsl:attribute name="Name" select="'XMLAttributeRefcapId'"/>
                    <xsl:attribute name="Value"><xsl:value-of select="substring-after(self::p[@data-alias='Reference' or contains(@href,'#BibRef')]/@href,'#')"/></xsl:attribute>
                </xsl:element>
            </xsl:if>
            <!-- end -->
            <!-- added for bis on 22-9-2025 -->
            <xsl:if test="@*[starts-with(local-name(), 'data-isync')]">
                <xsl:for-each select="@*[starts-with(local-name(), 'data-isync')]">
                <xsl:variable name="ranid">
                    <xsl:value-of select="generate-id()"/>
                </xsl:variable>
                <xsl:element name="XMLAttribute">
                    <xsl:attribute name="Self" select="concat('di',$ranid)"/>
                    <xsl:attribute name="Name">
                        <!--<xsl:value-of select="'XMLAttribute'"/>-->
                        <xsl:value-of select="local-name()"/>
                    </xsl:attribute>
                    <xsl:attribute name="Value"><xsl:value-of select="."/></xsl:attribute>
                </xsl:element>
                </xsl:for-each>
            </xsl:if>
            <!-- end -->
            <!--XmlElement End-->
        <!-- End -->
        <xsl:element name="ParagraphStyleRange">
            <!--Added for Kogan-->
            <xsl:if test="self::page[@id]">
                <xsl:attribute name="Page">
                                 
                <xsl:value-of select="self::page[@id]/@id"/>
                 </xsl:attribute>
            </xsl:if>
            <!--End-->
            <xsl:attribute name="AppliedParagraphStyle">
                <xsl:choose>
                    <xsl:when test="@data-name and (string-length(@data-name) &gt; 0)">
                        <xsl:value-of select="'ParagraphStyle/'"/>
                        <!--Box and others prefix added Update on 18.08.2017 -->
                        <xsl:choose>
                            <xsl:when test="starts-with($als, 'FT') or starts-with($als, 'RD')">
                                <xsl:choose>
                                    <xsl:when test="position() = last()">
                                        <xsl:choose>
                                            <xsl:when test="not(@data-name = 'Normal')">
                                                <xsl:value-of select="@data-name"/>
                                                <xsl:value-of select="'&gt;'"/>
                                                <xsl:value-of select="$als"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="'$ID/[No paragraph style]'"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:choose>
                                            <xsl:when test="not(@data-name = 'Normal')">
                                                <xsl:value-of select="$als"/>
                                                <xsl:value-of select="'&gt;'"/>
                                                <xsl:value-of select="@data-name"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="'$ID/[No paragraph style]'"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:when test="starts-with($als, 'table')">
                                <xsl:choose>
                                    <xsl:when
                                        test="@data-name = 'TableBody' or @data-name = 'TableColumnHead1' or @data-name = 'TableColumnHead'">
                                        <xsl:choose>
                                            <xsl:when test="position() = last()">
                                                <xsl:choose>
                                                  <xsl:when test="not(@data-name = 'Normal')">
                                                  <xsl:value-of select="@data-name"/>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:value-of select="'$ID/[No paragraph style]'"
                                                  />
                                                  </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:choose>
                                                  <xsl:when test="not(@data-name = 'Normal')">
                                                  <!--Added to avoid "-" style in  table on 04-10-2021-->
                                                  <!--<xsl:value-of select="'-'"/>-->
                                                      <xsl:value-of select="@data-name"/>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:value-of select="'$ID/[No paragraph style]'"
                                                  />
                                                  </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:choose>
                                            <xsl:when test="position() = last()">
                                                <xsl:choose>
                                                  <xsl:when test="not(@data-name = 'Normal')">
                                                  <xsl:value-of select="@data-name"/>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:value-of select="'$ID/[No paragraph style]'"
                                                  />
                                                  </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:choose>
                                                  <xsl:when test="not(@data-name = 'Normal')">
                                                      <!--Added to avoid "-" style in  table on 04-10-2021-->
                                                  <!--<xsl:value-of select="'-'"/>-->
                                                      <xsl:value-of select="@data-name"/>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:value-of select="'$ID/[No paragraph style]'"
                                                  />
                                                  </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:when
                                test="($als = 'ChapOutline') or ($als = 'Case Study') or ($als = 'CaseStudy') or ($als = 'LearnObjectives') or ($als = 'ChapSum') or ($als = 'ChapRevCaseStudy') or ($als = 'ChapReview')">
                                <xsl:choose>
                                    <!--Add one more Condition {CaseStudyTitle}20.02.2017 -->
                                    <xsl:when
                                        test="@data-name = 'CaseStudyID' or @data-name = 'CaseStudyTitle' or @data-name = 'CaseStudyAuthor' or @data-name = 'CaseStudySubtitle' or contains(@data-name, 'CaseStudiesHeading') or @data-name = 'FE-01-Name' or @data-name = 'FE-02-Name' or @data-name = 'FE-03-Name' or @data-name = 'FE-04-Name' or @data-name = 'FE-05-Name' or @data-name = 'FE-06-Name' or @data-name = 'FE-07-Name' or @data-name = 'FE-08-Name' or @data-name = 'FE-09-Name' or @data-name = 'FE-10-Name' or @data-name = 'FE-01-Title' or @data-name = 'FE-02-Title' or @data-name = 'FE-03-Title' or @data-name = 'FE-04-Title' or @data-name = 'FE-05-Title' or @data-name = 'FE-06-Title' or @data-name = 'FE-07-Title' or @data-name = 'FE-08-Title' or @data-name = 'FE-09-Title' or @data-name = 'FE-10-Title' or @data-name = 'FE-11-Name' or @data-name = 'FE-12-Name' or @data-name = 'FE-13-Name' or @data-name = 'FE-14-Name' or @data-name = 'FE-15-Name' or @data-name = 'FE-16-Name' or @data-name = 'FE-17-Name' or @data-name = 'FE-18-Name' or @data-name = 'FE-19-Name' or @data-name = 'FE-20-Name' or @data-name = 'FE-11-Title' or @data-name = 'FE-12-Title' or @data-name = 'FE-13-Title' or @data-name = 'FE-14-Title' or @data-name = 'FE-15-Title' or @data-name = 'FE-16-Title' or @data-name = 'FE-17-Title' or @data-name = 'FE-18-Title' or @data-name = 'FE-19-Title' or @data-name = 'FE-20-Title' or @data-name = 'LearnObjHeading' or @data-name = 'ChapSumHeading1' or @data-name = 'LearnObjStatement'">
                                        <xsl:choose>
                                            <xsl:when test="position() = last()">
                                                <xsl:choose>
                                                  <xsl:when test="not(@data-name = 'Normal')">
                                                  <xsl:value-of select="@data-name"/>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:value-of select="'$ID/[No paragraph style]'"
                                                  />
                                                  </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:choose>
                                                  <xsl:when test="not(@data-name = 'Normal')">
                                                  <xsl:value-of select="@data-name"/>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:value-of select="'$ID/[No paragraph style]'"
                                                  />
                                                  </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:choose>
                                            <xsl:when test="position() = last()">
                                                <xsl:choose>
                                                  <xsl:when test="not(@data-name = 'Normal')">
                                                  <xsl:value-of select="$als"/>
                                                  <xsl:value-of select="'-'"/>
                                                  <xsl:value-of select="@data-name"/>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:value-of select="'$ID/[No paragraph style]'"
                                                  />
                                                  </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:choose>
                                                  <xsl:when test="not(@data-name = 'Normal')">
                                                  <xsl:value-of select="$als"/>
                                                  <xsl:value-of select="'-'"/>
                                                  <xsl:value-of select="@data-name"/>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:value-of select="'$ID/[No paragraph style]'"
                                                  />
                                                  </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:when
                                test="starts-with($als, 'Box-') or starts-with($als, 'FE-') or starts-with($als, 'Standard Numbered Box')">
                                <xsl:choose>
                                    <xsl:when
                                        test="@data-name = 'FE-01-Name' or @data-name = 'FE-02-Name' or @data-name = 'FE-03-Name' or @data-name = 'FE-04-Name' or @data-name = 'FE-05-Name' or @data-name = 'FE-06-Name' or @data-name = 'FE-07-Name' or @data-name = 'FE-08-Name' or @data-name = 'FE-09-Name' or @data-name = 'FE-10-Name' or @data-name = 'FE-01-Title' or @data-name = 'FE-02-Title' or @data-name = 'FE-03-Title' or @data-name = 'FE-04-Title' or @data-name = 'FE-05-Title' or @data-name = 'FE-06-Title' or @data-name = 'FE-07-Title' or @data-name = 'FE-08-Title' or @data-name = 'FE-09-Title' or @data-name = 'FE-10-Title' or @data-name = 'FE-11-Name' or @data-name = 'FE-12-Name' or @data-name = 'FE-13-Name' or @data-name = 'FE-14-Name' or @data-name = 'FE-15-Name' or @data-name = 'FE-16-Name' or @data-name = 'FE-17-Name' or @data-name = 'FE-18-Name' or @data-name = 'FE-19-Name' or @data-name = 'FE-20-Name' or @data-name = 'FE-11-Title' or @data-name = 'FE-12-Title' or @data-name = 'FE-13-Title' or @data-name = 'FE-14-Title' or @data-name = 'FE-15-Title' or @data-name = 'FE-16-Title' or @data-name = 'FE-17-Title' or @data-name = 'FE-18-Title' or @data-name = 'FE-19-Title' or @data-name = 'FE-20-Title'">
                                        <xsl:choose>
                                            <xsl:when test="position() = last()">
                                                <xsl:choose>
                                                  <xsl:when test="not(@data-name = 'Normal')">
                                                  <xsl:value-of select="@data-name"/>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:value-of select="'$ID/[No paragraph style]'"
                                                  />
                                                  </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:choose>
                                                  <xsl:when test="not(@data-name = 'Normal')">
                                                  <xsl:value-of select="@data-name"/>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:value-of select="'$ID/[No paragraph style]'"
                                                  />
                                                  </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:choose>
                                            <xsl:when test="position() = last()">
                                                <xsl:choose>
                                                  <xsl:when test="not(@data-name = 'Normal')">
                                                  <xsl:value-of select="$als"/>
                                                  <xsl:value-of select="'-'"/>
                                                  <xsl:value-of select="@data-name"/>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:value-of select="'$ID/[No paragraph style]'"
                                                  />
                                                  </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:choose>
                                                  <xsl:when test="not(@data-name = 'Normal')">
                                                  <xsl:value-of select="$als"/>
                                                  <xsl:value-of select="'-'"/>
                                                  <xsl:value-of select="@data-name"/>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:value-of select="'$ID/[No paragraph style]'"
                                                  />
                                                  </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:when test="($als = 'Unnumbered Table')">
                                <xsl:choose>
                                    <xsl:when test="position() = last()">
                                        <xsl:choose>
                                            <xsl:when test="not(@data-name = 'Normal')">
                                                <xsl:value-of select="UN"/>
                                                <xsl:value-of select="'-'"/>
                                                <xsl:value-of select="@data-name"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="'$ID/[No paragraph style]'"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:choose>
                                            <xsl:when test="not(@data-name = 'Normal')">
                                                <xsl:value-of select="UN"/>
                                                <xsl:value-of select="'-'"/>
                                                <xsl:value-of select="@data-name"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="'$ID/[No paragraph style]'"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:when test="($als = 'UN-TB')">
                                <xsl:choose>
                                    <xsl:when
                                        test="@data-name = 'FE-01-Name' or @data-name = 'FE-02-Name' or @data-name = 'FE-03-Name' or @data-name = 'FE-04-Name' or @data-name = 'FE-05-Name' or @data-name = 'FE-06-Name' or @data-name = 'FE-07-Name' or @data-name = 'FE-08-Name' or @data-name = 'FE-09-Name' or @data-name = 'FE-10-Name' or @data-name = 'FE-01-Title' or @data-name = 'FE-02-Title' or @data-name = 'FE-03-Title' or @data-name = 'FE-04-Title' or @data-name = 'FE-05-Title' or @data-name = 'FE-06-Title' or @data-name = 'FE-07-Title' or @data-name = 'FE-08-Title' or @data-name = 'FE-09-Title' or @data-name = 'FE-10-Title' or @data-name = 'FE-11-Name' or @data-name = 'FE-12-Name' or @data-name = 'FE-13-Name' or @data-name = 'FE-14-Name' or @data-name = 'FE-15-Name' or @data-name = 'FE-16-Name' or @data-name = 'FE-17-Name' or @data-name = 'FE-18-Name' or @data-name = 'FE-19-Name' or @data-name = 'FE-20-Name' or @data-name = 'FE-11-Title' or @data-name = 'FE-12-Title' or @data-name = 'FE-13-Title' or @data-name = 'FE-14-Title' or @data-name = 'FE-15-Title' or @data-name = 'FE-16-Title' or @data-name = 'FE-17-Title' or @data-name = 'FE-18-Title' or @data-name = 'FE-19-Title' or @data-name = 'FE-20-Title'">
                                        <xsl:choose>
                                            <xsl:when test="position() = last()">
                                                <xsl:choose>
                                                  <xsl:when test="not(@data-name = 'Normal')">
                                                  <xsl:value-of select="@data-name"/>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:value-of select="'$ID/[No paragraph style]'"
                                                  />
                                                  </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:choose>
                                                  <xsl:when test="not(@data-name = 'Normal')">
                                                  <xsl:value-of select="''"/>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:value-of select="'$ID/[No paragraph style]'"
                                                  />
                                                  </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:choose>
                                            <xsl:when test="position() = last()">
                                                <xsl:choose>
                                                  <xsl:when test="not(@data-name = 'Normal')">
                                                  <xsl:value-of select="$als"/>
                                                  <xsl:value-of select="'-'"/>
                                                  <xsl:value-of select="@data-name"/>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:value-of select="'$ID/[No paragraph style]'"
                                                  />
                                                  </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:choose>
                                                  <xsl:when test="not(@data-name = 'Normal')">
                                                  <xsl:value-of select="$als"/>
                                                  <xsl:value-of select="'-'"/>
                                                  <xsl:value-of select="@data-name"/>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:value-of select="'$ID/[No paragraph style]'"
                                                  />
                                                  </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:when test="($als = 'UN')">
                                <xsl:choose>
                                    <xsl:when test="position() = last()">
                                        <xsl:choose>
                                            <xsl:when test="not(@data-name = 'Normal')">
                                                <xsl:value-of select="$als"/>
                                                <xsl:value-of select="'-'"/>
                                                <xsl:value-of select="@data-name"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="'$ID/[No paragraph style]'"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:choose>
                                            <xsl:when test="not(@data-name = 'Normal')">
                                                <xsl:value-of select="$als"/>
                                                <xsl:value-of select="'-'"/>
                                                <xsl:value-of select="@data-name"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="'$ID/[No paragraph style]'"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:when test="($als = 'CaseStudy')">
                                <xsl:choose>
                                    <xsl:when test="position() = last()">
                                        <xsl:choose>
                                            <xsl:when test="not(@data-name = 'Normal')">
                                                <xsl:value-of select="$als"/>
                                                <xsl:value-of select="' '"/>
                                                <xsl:value-of select="@data-name"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="'$ID/[No paragraph style]'"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:choose>
                                            <xsl:when test="not(@data-name = 'Normal')">
                                                <xsl:value-of select="$als"/>
                                                <xsl:value-of select="' '"/>
                                                <xsl:value-of select="@data-name"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="'$ID/[No paragraph style]'"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <!-- End Box and others prefix added-->



                            <!-- Updated {Mahesh} 08.12.2017-->
                            <xsl:when test="@data-name = 'MsoNormal' or @data-name = 'Normal'">
                                <xsl:value-of select="'$ID/[No paragraph style]'"/>
                            </xsl:when>
                            <!-- End Updated {Mahesh} 08.12.2017-->
                            <xsl:otherwise>
                                <xsl:value-of select="@data-name"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <!-- Updated {Mahesh} 10.11.2017 -->
                    <xsl:when test="ancestor::ul">
                        <xsl:value-of select="'ParagraphStyle/'"/>
                        <xsl:value-of select="ancestor::ul/@data-name"/>
                    </xsl:when>
                    <!-- End Updated {Mahesh} 10.11.2017 -->
                    <xsl:otherwise>
                        <xsl:value-of select="'ParagraphStyle/$ID/[No paragraph style]'"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <!-- List type on 05-10-2023 Azure 1552 -->
            <xsl:if test="parent::ol">
                <xsl:variable name="data-type" select="parent::ol[@type]/@type"/>
                <!-- Commented for if style not defined in template as numberlist on 14-11-2023 -->
                <!--<xsl:attribute name="BulletsAndNumberingListType">
                    <xsl:value-of select="'NumberedList'"/>
                </xsl:attribute>-->
                <xsl:if test="parent::ol[@data-lvlText]/@data-lvlText">
                    <xsl:attribute name="NumberingLevel">
                        <xsl:value-of select="parent::ol[@data-lvlText]/@data-lvlText"/>
                    </xsl:attribute>
                </xsl:if>
                <xsl:if test="self::li[not(preceding-sibling::*[1][self::li])]/parent::ol">
                    <xsl:if test="parent::ol[@type='a' or @type='A' or @type='i' or @type='I' or @type='1' or @start]">
                        <xsl:attribute name="NumberingStartAt">
                            <xsl:choose>
                                <xsl:when test="self::li[not(preceding-sibling::*[1][self::li])]/parent::ol[@start]/@start">
                                    <xsl:variable name="st"><xsl:value-of select="self::li[not(preceding-sibling::*[1][self::li])]/parent::ol[@start]/@start"/></xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="string-length($st) &gt; 0">
                                            <xsl:value-of select="$st"/>
                                        </xsl:when>
                                        <xsl:when test="string-length($st) = 0 and parent::ol[@type='a' or @type='A' or @type='i' or @type='I']">
                                            <xsl:value-of select="'1'"/>
                                        </xsl:when>
                                        <xsl:when test="string-length($st) = 0 or parent::ol[@type='a' or @type='A' or @type='i' or @type='I']">
                                            <xsl:value-of select="'1'"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:when>
                                <xsl:when test="self::li[not(preceding-sibling::*[1][self::li])]/parent::ol[not(@start) and @type='a' or @type='A' or @type='i' or @type='I']">
                                    <xsl:value-of select="'1'"/>
                                </xsl:when>
                                <xsl:otherwise><xsl:value-of select="self::li[not(preceding-sibling::*[1][self::li])]/parent::ol[@type]/@type"/></xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                    </xsl:if>                
                    <!-- NumberingContinue -->
                    <xsl:if test="parent::ol[@type='a' or @type='A' or @type='i' or @type='I' or @start='1'] | parent::ol[not(@type='a' or @type='A' or @type='i' or @type='I' or @start='1')]">
                        <xsl:attribute name="NumberingContinue">
                            <xsl:value-of select="'false'"/>
                        </xsl:attribute>
                    </xsl:if>    
                </xsl:if>
                <xsl:if test="parent::ol[@type='a' or @type='A' or @type='i' or @type='I']">
                    <xsl:element name="Properties">
                        <xsl:element name="NumberingFormat">
                            <xsl:attribute name="type" select="'string'"/>
                            <xsl:choose>
                                <xsl:when test="parent::ol[@type='I']">
                                    <xsl:text>I, II, III, IV...</xsl:text>
                                </xsl:when>
                                <xsl:when test="parent::ol[@type='i']">
                                    <xsl:text>i, ii, iii, iv...</xsl:text>
                                </xsl:when>
                                <xsl:when test="parent::ol[@type='a']">
                                    <xsl:text>a, b, c, d...</xsl:text>
                                </xsl:when>
                                <xsl:when test="parent::ol[@type='A']">
                                    <xsl:text>A, B, C, D...</xsl:text>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="parent::ol[@start]/@start"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:element>
                    </xsl:element>
                </xsl:if>
            </xsl:if>
            <!-- End -->
            <!-- Added for editor pagebreak on 9-3-2022 -->
            <xsl:if test="self::*[descendant::span[@data-comment = //div[@id='comment_']/commentreference[descendant::comment[@data-instruction='true' and @data-type='PAGE BREAK'][lower-case(.)='before']]/@data-commentvalue]]">
                <CharacterStyleRange AppliedCharacterStyle="CharacterStyle/$ID/[No character style]" ParagraphBreakType="NextPage">
                    <Br/>
                </CharacterStyleRange>
            </xsl:if>
            <!-- End -->
                <xsl:apply-templates select="* | text()">
                    <xsl:with-param name="pPr_Default">
                        <xsl:copy-of select="$pPr_Default"/>
                    </xsl:with-param>
                    <xsl:with-param name="rPr_Default">
                        <xsl:copy-of select="$rPr_Default"/>
                    </xsl:with-param>
                </xsl:apply-templates>
            </xsl:element>

            <!--XmlElement start-->
           </xsl:element>
           <!--XmlElement end-->
            <!--Updated Unwanted Br Issue 02.04.2018 -->
            <!--1-2-2019 to avoid double enter mark in table column-->
            <!-- <xsl:if test="following-sibling::*[1][self::span] | following-sibling::*[1][self::div]">
                <!-\-Updated on 07.03.2017 condition For Bookmark issue Jensen Chap09-\->
                <CharacterStyleRange AppliedCharacterStyle="CharacterStyle/$ID/[No character style]">
                    <Br/>
                </CharacterStyleRange>
            </xsl:if>-->
            <!--end-->
            <!--<xsl:if test="not(ancestor::table) and not(p[@class = 'MsoFootnoteText']) and not(ul) or not(ancestor::div) and not(following::*[1][self::p])">
                <!-\-Updated on 12.08.2017-\->
                <CharacterStyleRange AppliedCharacterStyle="CharacterStyle/$ID/[No character style]">
                    <Br/>
                </CharacterStyleRange>
            </xsl:if>
            <xsl:if test="following-sibling::*[1][self::span] | following-sibling::*[1][self::div] or not(ancestor::div) or following::*[1][self::p]">
                <!-\-Updated on 07.03.2017 condition For Bookmark issue Jensen Chap09-\->
                <CharacterStyleRange AppliedCharacterStyle="CharacterStyle/$ID/[No character style]">
                    <Br/>
                </CharacterStyleRange>
            </xsl:if>-->
            <!-- Updated multiple para in table/td {13.12.2017} -->
            <!-- End Updated {13.12.2017} -->
            <!-- Added toavoid the entermark not(self::li[@class='endnotecaption']) on 21-12-2021  -->
            
            <xsl:if
                test="not(ancestor::table) and not(p[@class = 'MsoFootnoteText' or @class = 'FootNotesText']) and not(ul) and not(self::li[@class='endnotecaption'])">
                <!--Updated on 12.08.2017-->
                <CharacterStyleRange AppliedCharacterStyle="CharacterStyle/$ID/[No character style]">
                    <Br/>
                </CharacterStyleRange>
            </xsl:if>



            <xsl:if test="ancestor::table">
                <xsl:if test="following-sibling::*[1][self::p]">
                    <CharacterStyleRange
                        AppliedCharacterStyle="CharacterStyle/$ID/[No character style]">
                        <xsl:element name="Br"/>
                    </CharacterStyleRange>
                </xsl:if>

                <!--updated for entermark b/w p and ul or ol and first p within div 3-5-2019-->
                <!--Added self::p[following-sibling::*[1][self::ol]] for table list merge issue on 30-04-2021-->
                <xsl:if
                    test="parent::div[following-sibling::node()]/child::p | self::p[following-sibling::*[1][self::ul]] | self::p[following-sibling::*[1][self::ol]]">
                    <CharacterStyleRange
                        AppliedCharacterStyle="CharacterStyle/$ID/[No character style]">
                        <xsl:element name="Br"/>
                    </CharacterStyleRange>
                </xsl:if>
                <!--end-->
            </xsl:if>

            <xsl:if test="ancestor::table">
                <!--<xsl:if test="following-sibling::*[1][self::ul]">-->
                <xsl:if test="ancestor::*[1][self::ul] or ancestor::*[1][self::ol]">

                    <!-- Updated br element {10.01.2017} -->
                    <CharacterStyleRange
                        AppliedCharacterStyle="CharacterStyle/$ID/[No character style]">
                        <xsl:element name="Br"/>
                    </CharacterStyleRange>
                </xsl:if>
            </xsl:if>
            
            
            
            
            <!--Kogan-->
            <xsl:if
                test="self::p[@class='Place-Holder' and @id='A']">
                <CharacterStyleRange
                    AppliedCharacterStyle="CharacterStyle/$ID/[No character style]">
                    <xsl:element name="Br"/>
                </CharacterStyleRange>
            </xsl:if>
            <!-- Added for editor pagebreak on 9-3-2022 -->
            <xsl:if test="self::*[descendant::span[@data-comment = //div[@id='comment_']/commentreference[descendant::comment[@data-instruction='true' and @data-type='PAGE BREAK'][lower-case(.)='after']]/@data-commentvalue]]">
                <CharacterStyleRange AppliedCharacterStyle="CharacterStyle/$ID/[No character style]" ParagraphBreakType="NextPage">
                    <Br/>
                </CharacterStyleRange>
            </xsl:if>
            <!-- End -->
    </xsl:template>

    <!--For index Purpose 14.02.2017-->
    <xsl:template match="span[@data-index]">
        
        <xsl:text disable-output-escaping="yes">&lt;CharacterStyleRange AppliedCharacterStyle="CharacterStyle/$ID/[No character style]"&gt;</xsl:text>
        <!--<xsl:variable name="index" select="./text()"/>-->
        <xsl:variable name="index">
            
                    <xsl:value-of select="."/>
                    <xsl:if test="self::span[@data-index]/child::span[@data-instrText]">
                        
                        <xsl:value-of select="child::span[@data-instrText]/normalize-space(@data-instrText)"/>
                    </xsl:if>
               
        </xsl:variable>
        
        <!--<xsl:variable name="aaaa" select="substring-after($index, 'XE &quot;')"/>
        <xsl:variable name="bbb" select="substring-before($aaaa, '&quot;')"/>-->
        <xsl:variable name="aaaa">
            <xsl:choose>
                <xsl:when test="contains($index,'XE &quot;')">
                    <xsl:value-of select="substring-after($index, 'XE &quot;')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="normalize-space(substring-after($index, 'XE'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="bbb">
            <xsl:choose>
                <xsl:when test="contains($aaaa,'&quot;')">
                    <xsl:value-of select="substring-before($aaaa, '&quot;')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="normalize-space($aaaa)"/>
                </xsl:otherwise>
            </xsl:choose>
            
        </xsl:variable>
        
        <xsl:variable name="ccc"
            select="replace(replace($bbb, ':', 'Topicn'), '(&#x005C;&#x005C;)([T][o][p][i][c][n])', '-')"/>
        <xsl:element name="PageReference">
            <xsl:attribute name="Self" select="'di2'"/>
            <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
            <xsl:attribute name="ReferencedTopic">
                <xsl:value-of select="'di2'"/>
                <xsl:value-of select="'Topicn'"/>
                <xsl:value-of select="$ccc"/>
            </xsl:attribute>
        </xsl:element>
        <xsl:text disable-output-escaping="yes">&lt;/CharacterStyleRange&gt;</xsl:text>
    </xsl:template>
    <xsl:template match="span[@style]">
    <xsl:param name="pPr_Default"/>
        <xsl:param name="rPr_Default"/>
        <!--<xsl:apply-templates select="*|text()">-->
        <xsl:apply-templates>
            <xsl:with-param name="pPr_Default">
                <xsl:copy-of select="$pPr_Default"/>
                <xsl:message>
                    <xsl:value-of select="$pPr_Default"/>
                </xsl:message>
            </xsl:with-param>
            <xsl:with-param name="rPr_Default">
                <xsl:copy-of select="$rPr_Default"/>
            </xsl:with-param>
        </xsl:apply-templates>
    </xsl:template>
    <xsl:template match="br">
        <!-- Br Tad Template Match include 25.01.2017 -->
        <xsl:element name="Content">
            <xsl:text disable-output-escaping="yes">&#8232;</xsl:text>
        </xsl:element>
    </xsl:template>
    
    
    <!-- Added to avoid tab and text missing while text merge with data-tab span on 23-12-2021-->
    <!--Tab 08.02.2017-->
    <!--<xsl:template match="span[@style = 'padding-left:68px;'] | span[@style = 'padding-left: 68px;'] | span[@style = 'padding-left:48px;'] | span[@style = 'padding-left: 48px;']">-->
    <xsl:template match="span[@data-tab = 'true'][string-length(text())= 0]">
        <xsl:element name="Content">
            <xsl:value-of select="'&#x9;'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="span[@data-tab = 'true'][not(string-length(text())= 0)]">
        <xsl:variable name="strattxt" select="substring(.,1,1)"/>
        <!--<xsl:variable name="endtxt" select="substring(., string-length(.)-1, string-length(.))"/>-->
        <xsl:variable name="endtxt" select="string-length(.)"/>
        <xsl:if test="$strattxt = ' '">
        <xsl:element name="Content">
            <xsl:value-of select="'&#x9;'"/>
            <xsl:value-of select="substring-after(.,$strattxt)"/>
        </xsl:element>
        </xsl:if>
        <xsl:if test="not($strattxt = ' ')">
            <xsl:choose>
                <xsl:when test="matches(.,'(.*)(\s*)$')">
                    <xsl:variable name="removelastspace">
                        <xsl:value-of select="replace(., '\s+$','')"/>
                    </xsl:variable>
                    
                  <xsl:element name="Content">
                      <xsl:value-of select="$removelastspace"/>
                      <xsl:value-of select="'&#x9;'"/>
                    </xsl:element>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:element name="Content">
                        <xsl:value-of select="."/>
                        </xsl:element>
                </xsl:otherwise>
            </xsl:choose>
            </xsl:if>
    </xsl:template>
    
    

<!--For Kogan catelogue-->
    <xsl:template match="span[@style = 'padding-left:68px;'][string-length(text())= 0] | span[@style = 'padding-left: 68px;'][string-length(text())= 0]">
        <xsl:element name="Content">
            <xsl:value-of select="'&#x9;'"/>
        </xsl:element>
    </xsl:template>
    <!--End-->

    <!-- soft enter
    <xsl:template match="br[@data-name = 'soft-enter'] | br[@data-change = 'soft-enter']| br">
			<br/>
    </xsl:template>-->
    <xsl:template match="text()">
        <xsl:param name="rPr_Default"/>
        <!--   <xsl:if test="not(./parent::body)">-->
        <!--   <xsl:if test="string-length(.) &gt; 0">-->
        <xsl:variable name="ancestor"
            select="ancestor::*[self::h1 | self::h2 | self::h3 | self::h4 | self::h5 | self::h6 | self::p | self::li][1]"/>
        <xsl:variable name="precedingCmtStart"
            select="preceding::span[@data-commentrange = 'cmtStart'][1][ancestor::*[self::h1 | self::h2 | self::h3 | self::h4 | self::h5 | self::h6 | self::p | self::li][1] = $ancestor]/@data-comment"/>
        <xsl:variable name="followingCmtEnd"
            select="following::span[@data-commentrange = 'cmtEnd'][1][ancestor::*[self::h1 | self::h2 | self::h3 | self::h4 | self::h5 | self::h6 | self::p | self::li][1] = $ancestor]/@data-comment"/>
        <xsl:variable name="commentRange">
            <xsl:choose>
                <xsl:when
                    test="string-length($precedingCmtStart) > 0 and string-length($followingCmtEnd) > 0">
                    <xsl:value-of select="boolean($precedingCmtStart = $followingCmtEnd)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="false()"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <!--XmlElement start-->
        <xsl:element name="CharacterStyleRange">
                <xsl:attribute name="AppliedCharacterStyle">
                    <xsl:choose>
                        <xsl:when
                            test="./ancestor::span[@data-name] and ./ancestor::span[(string-length(@data-name) &gt; 0)]">
                            <xsl:choose>
                                <!-- Added to retain the changestyle (dataname)  value on 16-07-2025 -->
                                <xsl:when test="ancestor::*[@data-change = 'changestyle'] and not(ancestor::span[(string-length(@data-name) &gt; 0)])">
                                    <xsl:variable name="bbb"
                                        select="ancestor::*[@data-change = 'changestyle']/local-name()"/>
                                    <xsl:value-of select="'CharacterStyle/'"/>
                                    <!-- Added 's'(strikethru) value on 16-07-2025 -->
                                    <xsl:choose>
                                        <xsl:when
                                            test="$bbb = 'i' or $bbb = 'b' or $bbb = 'u' or $bbb = 'strike' or $bbb = 'sub' or $bbb = 'sup' or $bbb='s'">
                                            <xsl:if
                                                test="($bbb = 'i' or $bbb = 'em') and not($bbb = 'b' or $bbb = 'strong')">
                                                <xsl:value-of select="'italic'"/>
                                            </xsl:if>
                                            <xsl:if
                                                test="not($bbb = 'i' or $bbb = 'em') and ($bbb = 'b' or $bbb = 'strong')">
                                                <xsl:value-of select="'bold'"/>
                                            </xsl:if>
                                            <xsl:if
                                                test="($bbb = 'i' or $bbb = 'em') and ($bbb = 'b' or $bbb = 'strong')">
                                                <xsl:value-of select="'bolditalics'"/>
                                            </xsl:if>
                                            <xsl:if test="$bbb = 'u'">
                                                <xsl:value-of select="'underline'"/>
                                            </xsl:if>
                                            <xsl:if test="$bbb = 'strike'">
                                                <xsl:value-of select="'strikeThru'"/>
                                            </xsl:if>
                                            <xsl:if test="$bbb = 's'">
                                                <xsl:value-of select="'strikeThru'"/>
                                            </xsl:if>
                                            <xsl:if test="$bbb = 'sup'">
                                                <xsl:value-of select="'superscript'"/>
                                            </xsl:if>
                                            <xsl:if test="$bbb = 'sub'">
                                                <xsl:value-of select="'subscript'"/>
                                            </xsl:if>
                                            <xsl:if test="$bbb = 'strike'">
                                                <xsl:value-of select="'strikethrough'"/>
                                            </xsl:if>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:choose>
                                                <xsl:when test="parent::*/@data-name">
                                                  <xsl:value-of select="parent::*/@data-name"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                  <xsl:value-of
                                                  select="./ancestor::span[@data-name][1]/@data-name"
                                                  />
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:when>



                                <xsl:otherwise>
                                    <xsl:value-of select="'CharacterStyle/'"/>
                                    <xsl:value-of
                                        select="./ancestor::span[@data-name][1]/@data-name"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                        <!-- Added for italic missing in  Azure 13724 02-4-2024 -->
                        <xsl:when test="parent::span[contains(@style, 'font-style:') or contains(@style, 'vertical-align:') or contains(@style, 'font-variant:') or contains(@style, 'text-transform:') or contains(@style, 'font-weight:') or contains(@style, 'text-decoration:') or @style and not(@data-name)]">
                            <xsl:value-of select="'CharacterStyle/$ID/[No character style]'"/>
                        </xsl:when>
                        <!-- End -->
                        <xsl:when test="ancestor::*[@data-change = 'changestyle']">
                            <xsl:variable name="bbb"
                                select="ancestor::*[@data-change = 'changestyle']/local-name()"/>
                            <xsl:value-of select="'CharacterStyle/'"/>
                            <!--							<xsl:choose>-->
                            <xsl:if
                                test="($bbb = 'i' or $bbb = 'em') and not($bbb = 'b' or $bbb = 'strong')">
                                <xsl:value-of select="'italic'"/>
                            </xsl:if>
                            <xsl:if
                                test="not($bbb = 'i' or $bbb = 'em') and ($bbb = 'b' or $bbb = 'strong')">
                                <xsl:value-of select="'bold'"/>
                            </xsl:if>
                            <xsl:if
                                test="($bbb = 'i' or $bbb = 'em') and ($bbb = 'b' or $bbb = 'strong')">
                                <xsl:value-of select="'bolditalics'"/>
                            </xsl:if>
                            <xsl:if test="$bbb = 'u'">
                                <xsl:value-of select="'Underline'"/>
                            </xsl:if>
                            <xsl:if test="$bbb = 'sup'">
                                <xsl:value-of select="'superscript'"/>
                            </xsl:if>
                            <xsl:if test="$bbb = 'sub'">
                                <xsl:value-of select="'subscript'"/>
                            </xsl:if>
                            <xsl:if test="$bbb = 'strike'">
                                <xsl:value-of select="'strikethrough'"/>
                            </xsl:if>
                            <!--</xsl:choose>-->
                        </xsl:when>

                        <!--end-->
                        <!--<xsl:when
                            test="ancestor::i | ancestor::b | ancestor::u | ancestor::sup | ancestor::sub | ancestor::strike">
                            <xsl:value-of select="'CharacterStyle/'"/>
                            <!-\-						    <xsl:choose>-\->
                            <xsl:if
                                test="(ancestor::i or ancestor::em) and not(ancestor::b or ancestor::strong)">
                                <xsl:value-of select="'italic'"/>
                            </xsl:if>
                            <xsl:if
                                test="not(ancestor::i or ancestor::em) and (ancestor::b or ancestor::strong)">
                                <xsl:value-of select="'bold'"/>
                            </xsl:if>
                            <xsl:if
                                test="(ancestor::i or ancestor::em) and (ancestor::b or ancestor::strong)">
                                <xsl:value-of select="'bolditalics'"/>
                            </xsl:if>
                            <xsl:if test="ancestor::u">
                                <xsl:value-of select="'underline'"/>
                            </xsl:if>
                            <xsl:if test="ancestor::sup">
                                <xsl:value-of select="'superscript'"/>
                            </xsl:if>
                            <xsl:if test="ancestor::sub">
                                <xsl:value-of select="'subscript'"/>
                            </xsl:if>
                            <xsl:if test="ancestor::strike">
                                <xsl:value-of select="'strikethrough'"/>
                            </xsl:if>
                            <!-\-</xsl:choose>-\->
                        </xsl:when>-->
                        <xsl:otherwise>
                            <xsl:value-of select="'CharacterStyle/$ID/[No character style]'"/>
                        </xsl:otherwise>
                    </xsl:choose>

                </xsl:attribute>

                <xsl:if test="$commentRange = true()">
                    <xsl:attribute name="AppliedConditions">
                        <xsl:value-of select="'Condition/Highlight'"/>
                    </xsl:attribute>
                </xsl:if>
            <!-- Added to apply the conditional text for footnote links on 7-4-2026 -->
            <xsl:if test="parent::span[contains(@class, 'BibRef')][ancestor::div[@style = 'mso-element:footnote'] or ancestor::li[@style = 'mso-element:footnote']] or parent::span[@class='citebib'][ancestor::div[@style = 'mso-element:footnote'] or ancestor::li[@style = 'mso-element:footnote']] or ancestor::a[@class='citationRef'][ancestor::div[@style = 'mso-element:footnote'] or ancestor::li[@style = 'mso-element:footnote']]">
                <xsl:attribute name="AppliedConditions"><xsl:value-of select="'Condition/'"/><!--<xsl:value-of select="parent::span[@class, 'BibRef']/@id"/>-->
                    <xsl:choose>
                        <xsl:when test="parent::span[contains(@class, 'BibRef')]">
                            <xsl:value-of select="parent::span[contains(@class, 'BibRef')]/@id"/>
                        </xsl:when>
                        <xsl:when test="parent::span[@class='citebib']">
                            <xsl:value-of select="parent::span[@class='citebib']/ancestor::span[contains(@class, 'BibRef')]/@id"/>
                        </xsl:when>
                        <xsl:otherwise><xsl:value-of select="ancestor::a[@class='citationRef']/@data-alias"/></xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
            </xsl:if>
            <!-- End -->
                <!--For manual Char 14-11-2018-->
                <!--Remove not(./ancestor::span[@data-name]) 6-3-2019 -->
                <xsl:choose>
                    <!--<xsl:when
                  test="ancestor::i | ancestor::b | ancestor::u | ancestor::sup | ancestor::sub | ancestor::strike and not(./ancestor::span[@data-name])">-->
                    <xsl:when
                        test="ancestor::i | ancestor::b | ancestor::u | ancestor::sup | ancestor::sub | ancestor::strike | ancestor::s">
                        <xsl:if
                            test="(ancestor::i or ancestor::em) and not(ancestor::b or ancestor::strong)">
                            <xsl:attribute name="FontStyle">
                                <xsl:value-of select="'Italic'"/>
                            </xsl:attribute>
                        </xsl:if>
                        <xsl:if
                            test="not(ancestor::i or ancestor::em) and (ancestor::b or ancestor::strong)">
                            <xsl:attribute name="FontStyle">
                                <xsl:value-of select="'Bold'"/>
                            </xsl:attribute>
                        </xsl:if>
                        <xsl:if
                            test="(ancestor::i or ancestor::em) and (ancestor::b or ancestor::strong)">
                            <xsl:attribute name="FontStyle">
                                <xsl:value-of select="'Bold Italic'"/>
                            </xsl:attribute>
                        </xsl:if>
                        <xsl:if test="ancestor::u">
                            <xsl:attribute name="Underline">
                                <xsl:value-of select="'true'"/>
                            </xsl:attribute>
                        </xsl:if>
                        <xsl:if test="ancestor::sup">
                            <xsl:attribute name="Position">
                                <xsl:value-of select="'Superscript'"/>
                            </xsl:attribute>
                        </xsl:if>
                        <xsl:if test="ancestor::sub">
                            <xsl:attribute name="Position">
                                <xsl:value-of select="'Subscript'"/>
                            </xsl:attribute>
                        </xsl:if>
                        <xsl:if test="ancestor::strike">
                            <xsl:attribute name="StrikeThru">
                                <xsl:value-of select="'true'"/>
                            </xsl:attribute>
                        </xsl:if>
                        <xsl:if test="ancestor::s">
                            <xsl:attribute name="StrikeThru">
                                <xsl:value-of select="'true'"/>
                            </xsl:attribute>
                        </xsl:if>
                    </xsl:when>

                </xsl:choose>




                <!--updated for manual style 13-11-2018-->

                <!--font-style-->

                <xsl:if test="parent::span[contains(@style, 'font-style:') and not(@data-name)]">

                    <xsl:variable name="stylename"
                        select="substring-after(parent::span[contains(@style, 'font-style:')]/@style, 'font-style:')"/>

                    <xsl:variable name="stylename1">

                        <xsl:if test="contains($stylename, ';')">

                            <xsl:value-of select="substring-before($stylename, ';')"/>
                        </xsl:if>
                        <xsl:if test="not(contains($stylename, ';'))">
                            <xsl:value-of select="$stylename"/>
                        </xsl:if>

                    </xsl:variable>
                    <xsl:if test="contains($stylename1, 'italic')">
                        <xsl:attribute name="FontStyle">
                            <xsl:value-of select="'Italic'"/>
                        </xsl:attribute>
                    </xsl:if>
                </xsl:if>
                <!--vertical-align-->
                <xsl:if test="parent::span[contains(@style, 'vertical-align:') and not(@data-name)]">
                    <xsl:variable name="vstyle"
                        select="substring-after(parent::span[contains(@style, 'vertical-align:')]/@style, 'vertical-align:')"/>

                    <xsl:variable name="vstyle1">
                        <xsl:choose>
                            <xsl:when test="contains($vstyle, ';')">
                                <xsl:value-of select="substring-before($vstyle, ';')"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="$vstyle"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <xsl:choose>
                        <xsl:when test="contains($vstyle1, 'sub')">
                            <xsl:attribute name="Position">
                                <xsl:value-of select="'Subscript'"/>
                            </xsl:attribute>
                        </xsl:when>
                        <xsl:when test="contains($vstyle1, 'super')">
                            <xsl:attribute name="Position">
                                <xsl:value-of select="'Superscript'"/>
                            </xsl:attribute>
                        </xsl:when>
                    </xsl:choose>
                </xsl:if>
                <!--font-variant:-->
                <xsl:if test="parent::span[contains(@style, 'font-variant:') and not(@data-name)]">
                    <xsl:variable name="stylename"
                        select="substring-after(parent::span[contains(@style, 'font-variant:')]/@style, 'font-variant:')"/>

                    <xsl:variable name="stylename1">

                        <xsl:choose>
                            <xsl:when test="contains($stylename, ';')">
                                <xsl:value-of select="substring-before($stylename, ';')"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="$stylename"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <xsl:if
                        test="contains($stylename1, 'small-caps') or contains($stylename1, 'smallcaps') or contains($stylename1, 'sc')">

                        <xsl:attribute name="Capitalization">
                            <xsl:value-of select="'SmallCaps'"/>
                        </xsl:attribute>
                    </xsl:if>

                </xsl:if>
                <!--text-transform-->
                <xsl:if test="parent::span[contains(@style, 'text-transform:') and not(@data-name)]">

                    <xsl:variable name="stylename"
                        select="substring-after(parent::span[contains(@style, 'text-transform:')]/@style, 'text-transform:')"/>

                    <xsl:variable name="stylename1">

                        <xsl:choose>
                            <xsl:when test="contains($stylename, ';')">
                                <xsl:value-of select="substring-before($stylename, ';')"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="$stylename"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>

                    <xsl:if test="contains($stylename1, 'uppercase')">
                        <xsl:attribute name="Capitalization">
                            <xsl:value-of select="'AllCaps'"/>
                        </xsl:attribute>
                    </xsl:if>

                </xsl:if>
                <!--font-weight-->

                <xsl:if test="parent::span[contains(@style, 'font-weight:') and not(@data-name)]">

                    <xsl:variable name="stylename"
                        select="substring-after(parent::span[contains(@style, 'font-weight:')]/@style, 'font-weight:')"/>

                    <xsl:variable name="stylename1">

                        <xsl:choose>
                            <xsl:when test="contains($stylename, ';')">
                                <xsl:value-of select="substring-before($stylename, ';')"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="$stylename"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>

                    <xsl:if test="contains($stylename1, 'bold')">
                        <xsl:attribute name="FontStyle">
                            <xsl:value-of select="'Bold'"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="contains($stylename1, 'bolditalics')">
                        <xsl:attribute name="FontStyle">
                            <xsl:value-of select="'Bold Italic'"/>
                        </xsl:attribute>
                    </xsl:if>
                </xsl:if>

                <!--text-decoration-->
                <xsl:if
                    test="parent::span[contains(@style, 'text-decoration:') and not(@data-name)]">

                    <xsl:variable name="stylename"
                        select="substring-after(parent::span[contains(@style, 'text-decoration:')]/@style, 'text-decoration:')"/>

                    <xsl:variable name="stylename1">

                        <xsl:choose>
                            <xsl:when test="contains($stylename, ';')">
                                <xsl:value-of select="substring-before($stylename, ';')"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="$stylename"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>


                    <xsl:if test="contains($stylename1, 'underline')">
                        <xsl:attribute name="Underline">
                            <xsl:value-of select="'true'"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="contains($stylename1, 'DUnderline')">
                        <xsl:attribute name="Underline">
                            <xsl:value-of select="'true'"/>
                        </xsl:attribute>
                        <Properties>
                            <UnderlineType type="object">StrokeStyle/$ID/ThickThick</UnderlineType>
                        </Properties>
                    </xsl:if>
                </xsl:if>
                <!--<xsl:when test="parent::span[@class = 'DUnderline'] or ancestor::span[@class]">-->


                <xsl:if test="ancestor::span[@class = 'DUnderline']">

                    <xsl:attribute name="Underline">
                        <xsl:value-of select="'true'"/>
                    </xsl:attribute>
                    <Properties>
                        <UnderlineType type="object">StrokeStyle/$ID/ThickThick</UnderlineType>
                    </Properties>

                </xsl:if>

                <!-- Added for badbreak on 6-4-2022 -->
                <xsl:if test="ancestor::span[@style='white-space: nowrap;']">
                    <xsl:attribute name="NoBreak" select="'true'"/>
                </xsl:if>
                <!--end-->
                <!-- <!-\-<xsl:if test="contains(parent::span,'math')">-\->
                <xsl:if test="parent::span/descendant::math">
                    <xsl:message><xsl:value-of select="text()"/></xsl:message>
                    <xsl:attribute name="MathToolsML">
                        <xsl:copy-of select="replace(replace(., '&#60;', '&lt;'),'>','&gt;')"/>
                    </xsl:attribute>
                </xsl:if>-->



                <!--Updated for additional style 9-10-2018-->
                <!--<xsl:choose>
                    <xsl:when test="parent::*[@data-name and contains(@style, 'font-style:')]">
                        <xsl:variable name="stylen"
                            select="substring-after(parent::*[@data-name and contains(@style, 'font-style:')]/@style, 'font-style:')"/>
                        <xsl:variable name="stylen1" select="substring-before($stylen, ';')"/>
                        <xsl:choose>
                            <xsl:when test="contains($stylen, ';')">
                                <xsl:attribute name="FontStyle">
                                    <xsl:value-of select="normalize-space($stylen1)"/>
                                </xsl:attribute>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:attribute name="FontStyle">
                                    <xsl:value-of select="normalize-space($stylen)"/>
                                </xsl:attribute>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                </xsl:choose>-->
                <!--end-->
                <!--<xsl:if test="ancestor::i or ancestor::em">
				<xsl:attribute name="FontStyle" select="'Italic'"/>
			</xsl:if>
			<xsl:if test="ancestor::b or ancestor::strong">
				<xsl:attribute name="FontStyle" select="'Bold'"/>
			</xsl:if>-->
                <!--	<xsl:if test="ancestor::u">
				<xsl:attribute name="Underline" select="'Underline'"/>
			</xsl:if>
			<xsl:if test="ancestor::strike">
				<xsl:attribute name="StrikeThru" select="'StrikeThru'"/>
			</xsl:if>
			<xsl:if test="ancestor::sup">
				<xsl:attribute name="Position" select="'Superscript'"/>
			</xsl:if>
			<xsl:if test="ancestor::sub">
				<xsl:attribute name="Position" select="'Subscript'"/>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="(ancestor::i or ancestor::em) and not(ancestor::b or ancestor::strong)">
					<xsl:attribute name="FontStyle" select="'Italic'"/>
                </xsl:when>
                <xsl:when test="not(ancestor::i or ancestor::em) and (ancestor::b or ancestor::strong)">
					<xsl:attribute name="FontStyle" select="'Bold'"/>
                </xsl:when>
                <xsl:when test="(ancestor::i or ancestor::em) and (ancestor::b or ancestor::strong)">
					<xsl:attribute name="FontStyle" select="'BoldItalic'"/>
				</xsl:when>
            </xsl:choose> Updated {Mahesh} 20.11.2017 Pls Check-->
            <!-- XmlElement End -->

        <xsl:element name="XMLElement">
            <xsl:attribute name="Self" select="'di2'"/>
            <xsl:attribute name="MarkupTag">
                <xsl:choose>
                    <xsl:when
                        test="./ancestor::span[@data-name] and ./ancestor::span[(string-length(@data-name) &gt; 0)]">
                        <xsl:choose>
                            <xsl:when test="ancestor::*[@data-change = 'changestyle'] and not(ancestor::span[(string-length(@data-name) &gt; 0)])">
                                <xsl:variable name="bbb"
                                    select="ancestor::*[@data-change = 'changestyle']/local-name()"/>
                                <xsl:value-of select="'XMLTag/'"/>
                                <xsl:choose>
                                    <xsl:when
                                        test="$bbb = 'i' or $bbb = 'b' or $bbb = 'u' or $bbb = 'strike' or $bbb = 'sub' or $bbb = 'sup'">

                                        <xsl:if
                                            test="($bbb = 'i' or $bbb = 'em') and not($bbb = 'b' or $bbb = 'strong')">
                                            <xsl:value-of select="'italic'"/>
                                        </xsl:if>
                                        <xsl:if
                                            test="not($bbb = 'i' or $bbb = 'em') and ($bbb = 'b' or $bbb = 'strong')">
                                            <xsl:value-of select="'bold'"/>
                                        </xsl:if>
                                        <xsl:if
                                            test="($bbb = 'i' or $bbb = 'em') and ($bbb = 'b' or $bbb = 'strong')">
                                            <xsl:value-of select="'bolditalics'"/>
                                        </xsl:if>
                                        <xsl:if test="$bbb = 'u'">
                                            <xsl:value-of select="'underline'"/>
                                        </xsl:if>
                                        <xsl:if test="$bbb = 'strike'">
                                            <xsl:value-of select="'strikeThru'"/>
                                        </xsl:if>
                                        <xsl:if test="$bbb = 's'">
                                            <xsl:value-of select="'strikeThru'"/>
                                        </xsl:if>
                                        <xsl:if test="$bbb = 'sup'">
                                            <xsl:value-of select="'superscript'"/>
                                        </xsl:if>
                                        <xsl:if test="$bbb = 'sub'">
                                            <xsl:value-of select="'subscript'"/>
                                        </xsl:if>
                                        <xsl:if test="$bbb = 'strike'">
                                            <xsl:value-of select="'strikethrough'"/>
                                        </xsl:if>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:choose>
                                            <xsl:when test="parent::*/@data-name">
                                                <!--<xsl:value-of select="parent::*/@data-name"/>-->
                                                <!-- Added to avoid the space issue in data-name(Ex: endnote reference) for XMLElement on 10-10-2022 -->
                                                <xsl:choose>
                                                    <xsl:when test="contains(parent::*/@data-name,' ')">
                                                        <xsl:value-of select="replace(parent::*/@data-name,' ','_')"/>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:value-of select="parent::*/@data-name"/>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <!--<xsl:value-of
                                                  select="./ancestor::span[@data-name][1]/@data-name"
                                                />-->
                                                <xsl:choose>
                                                    <xsl:when test="contains(./ancestor::span[@data-name][1]/@data-name,' ')">
                                                        <xsl:value-of select="replace(./ancestor::span[@data-name][1]/@data-name,' ','_')"/>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:value-of
                                                            select="./ancestor::span[@data-name][1]/@data-name"
                                                        />
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <!--To avoid @data-name value space 2-6-2018-->
                            <xsl:otherwise>
                                <xsl:value-of select="'XMLTag/'"/>
                                <xsl:choose>
                                    <xsl:when
                                        test="contains(./ancestor::span[@data-name][1]/@data-name, ' ')">
                                        <xsl:value-of
                                            select="replace(./ancestor::span[@data-name][1]/@data-name, ' ', '_')"
                                        />
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of
                                            select="./ancestor::span[@data-name][1]/@data-name"/>
                                    </xsl:otherwise>
                                </xsl:choose>

                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <!-- Added for italic missing in  Azure 13724 02-4-2024 -->
                    <xsl:when test="parent::span[contains(@style, 'font-style:') or contains(@style, 'vertical-align:') or contains(@style, 'font-variant:') or contains(@style, 'text-transform:') or contains(@style, 'font-weight:') or contains(@style, 'text-decoration:') or @style and not(@data-name)]">
                        <xsl:value-of select="'XMLTag/$ID/[No character style]'"/>
                    </xsl:when>
                    <!-- End -->
                    <xsl:when test="ancestor::*[@data-change = 'changestyle']">
                        <xsl:variable name="bbb"
                            select="ancestor::*[@data-change = 'changestyle']/local-name()"/>
                        <xsl:value-of select="'XMLTag/'"/>
                        <!--<xsl:choose>-->
                        <xsl:if
                            test="($bbb = 'i' or $bbb = 'em') and not($bbb = 'b' or $bbb = 'strong')">
                            <xsl:value-of select="'italic'"/>
                        </xsl:if>
                        <xsl:if
                            test="not($bbb = 'i' or $bbb = 'em') and ($bbb = 'b' or $bbb = 'strong')">
                            <xsl:value-of select="'bold'"/>
                        </xsl:if>
                        <xsl:if
                            test="($bbb = 'i' or $bbb = 'em') and ($bbb = 'b' or $bbb = 'strong')">
                            <xsl:value-of select="'bolditalics'"/>
                        </xsl:if>
                        <xsl:if test="$bbb = 'u'">
                            <xsl:value-of select="'Underline'"/>
                        </xsl:if>
                        <xsl:if test="$bbb = 'sup'">
                            <xsl:value-of select="'superscript'"/>
                        </xsl:if>
                        <xsl:if test="$bbb = 'sub'">
                            <xsl:value-of select="'subscript'"/>
                        </xsl:if>
                        <xsl:if test="$bbb = 'strike'">
                            <xsl:value-of select="'strikethrough'"/>
                        </xsl:if>
                        <!--</xsl:choose>-->
                    </xsl:when>
                    <xsl:when
                        test="ancestor::i | ancestor::b | ancestor::u | ancestor::sup | ancestor::sub | ancestor::strike">
                        <xsl:value-of select="'XMLTag/'"/>

                        <xsl:if
                            test="(ancestor::i or ancestor::em) and not(ancestor::b or ancestor::strong) or not(ancestor::i or ancestor::em) and (ancestor::b or ancestor::strong) or (ancestor::i or ancestor::em) and (ancestor::b or ancestor::strong) or ancestor::u or ancestor::sup or ancestor::sub or ancestor::strike">
                            <xsl:value-of select="'$ID/[No character style]'"/>
                        </xsl:if>
                    </xsl:when>
                    
                    <xsl:otherwise>
                        <xsl:value-of select="'XMLTag/$ID/[No character style]'"/>
                    </xsl:otherwise>
                </xsl:choose>
                <!--Updated {Mahesh} 21.11.2017-->
            </xsl:attribute>
            
            <!-- Added to retain the endnotes id's on 8-7-2022 -->
            <xsl:if test="ancestor::span[@class='EndnoteReference' or  @data-name='endnote reference' or @data-name='endnote_reference'][1]">
                <xsl:element name="XMLAttribute">
                    <xsl:attribute name="Self"><xsl:value-of select="'di2XMLAttributeid'"/></xsl:attribute>
                    <xsl:attribute name="Name" select="'id'"/>
                    <xsl:attribute name="Value"><xsl:value-of select="parent::a[@id]/@id"/></xsl:attribute>
                </xsl:element>
                <xsl:element name="XMLAttribute">
                    <xsl:attribute name="Self"><xsl:value-of select="'di2XMLAttributehref'"/></xsl:attribute>
                    <xsl:attribute name="Name" select="'href'"/>
                    <xsl:attribute name="Value"><xsl:value-of select="parent::a[@href]/@href"/></xsl:attribute>
                </xsl:element>
            </xsl:if>
            
            <xsl:if test="ancestor::span[@class='EndnoteNumber' or  @data-name='EndnoteNumber' or lower-case(@data-name)='endnotenumber'][1]">
                <xsl:element name="XMLAttribute">
                    <xsl:attribute name="Self"><xsl:value-of select="'di2XMLAttributeid'"/></xsl:attribute>
                    <xsl:attribute name="Name" select="'id'"/>
                    <xsl:attribute name="Value"><xsl:value-of select="ancestor::li[@class='endnotecaption' or @style='mso-element:endnote'][1][@id]/@id"/></xsl:attribute>
                </xsl:element>
                <xsl:element name="XMLAttribute">
                    <xsl:attribute name="Self"><xsl:value-of select="'di2XMLAttributehref'"/></xsl:attribute>
                    <xsl:attribute name="Name" select="'href'"/>
                    <xsl:attribute name="Value"><xsl:value-of select="parent::a[@href]/@href"/></xsl:attribute>
                </xsl:element>
            </xsl:if>
            <!-- End -->
            <!-- bibref citation for epub 25-11-2024 -->
            <xsl:if test="ancestor::span[contains(@class,'BibRef') or contains(@id,'BibRef')][ancestor::a[contains(@data-alias,'BibRef')]]">
                
                       <xsl:variable name="ranid">
                        <xsl:value-of select="generate-id()"/>
                    </xsl:variable>
                    <xsl:element name="XMLAttribute">
                        <xsl:attribute name="Self" select="concat('di',$ranid)"/>
                        <xsl:attribute name="Name" select="'XMLAttributeRefCitId'"/>
                        <xsl:attribute name="Value"><xsl:value-of select="ancestor::span[contains(@class,'BibRef') or contains(@id,'BibRef')][ancestor::a[contains(@data-alias,'BibRef')]]/@id"/></xsl:attribute>
                    </xsl:element>
            </xsl:if>
            <!-- End -->    
                <xsl:choose>
                    <xsl:when test="ancestor::del">
                        <xsl:element name="Content">
                            <xsl:value-of select="."/>
                        </xsl:element>
                    </xsl:when>
                    <xsl:otherwise>
                        <!--to floating element figure "id" retain for linking purpose of epub 24-7-2020-->
                        <xsl:if test="not(ancestor::a[contains(@bk,'RANGE')][1])">
                        <xsl:element name="Content">
                            <xsl:value-of select="."/>
                         </xsl:element>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>

                <!--<xsl:element name="w:t">
	<xsl:attribute name="xml:space" select="'preserve'"/>
	<xsl:value-of select="."/>
	</xsl:element>--> 
            <!-- XmlElement start -->            
            </xsl:element>
            <!-- XmlElement End -->

        </xsl:element>

    </xsl:template>




    <!--<xsl:template match="Br">
           <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>        
    </xsl:template>-->



    <!--For Hyperlink 19-6-2019-->
    <xsl:variable name="url"><xsl:value-of select="$StylesCollect//stylesList/style[@name='DZC_URL']/@replacement"/></xsl:variable>
    <xsl:variable name="website"><xsl:value-of select="$StylesCollect//stylesList/style[@name='DZC_Website']/@replacement"/></xsl:variable>
    <xsl:variable name="doi"><xsl:value-of select="$StylesCollect//stylesList/style[@name='DZC_DOI']/@replacement"/></xsl:variable>
     <xsl:template match="a[@data-hyperlink and @href]">
             <xsl:element name="CharacterStyleRange">
            <xsl:attribute name="AppliedCharacterStyle">
                <xsl:value-of select="'CharacterStyle/Hyperlink'"/>
            </xsl:attribute>
            <xsl:element name="HyperlinkTextSource">
                <xsl:attribute name="Self">
                    <!--<xsl:variable name="num">
                        <xsl:number level="any"/>
                    </xsl:variable>-->
                    <xsl:variable name="num">
                        <xsl:number count="a[@data-hyperlink and @href]" level="any"/>
                    </xsl:variable>
                    <!--Added uu to avoid the same id with story on 24-06-2021-->
                    <xsl:value-of select="concat('uu',$num)"/>
                </xsl:attribute>
                <xsl:attribute name="Name">
                    <xsl:value-of select="'Source'"/>
                </xsl:attribute>
                <xsl:attribute name="Hidden">
                    <xsl:value-of select="'false'"/>
                </xsl:attribute>
                <xsl:attribute name="AppliedCharacterStyle">
                    <xsl:value-of select="'n'"/>
                </xsl:attribute>
                <xsl:element name="Content">
                <xsl:value-of select="."/>
                </xsl:element>
                <xsl:element name="HyperLink-Text">
                    <!--<xsl:value-of select="self::a[@data-hyperlink]/@data-hyperlink"/>-->
                    <!-- Added for empty data-hyperlink on 19-3-2025-->
                    <xsl:choose>
                        <xsl:when test="self::a[@data-hyperlink]/string-length(@data-hyperlink) &gt;0">
                            <xsl:value-of select="self::a[@data-hyperlink]/@data-hyperlink"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="."/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:element>
                </xsl:element>
               </xsl:element>
           </xsl:template>
             <!-- url and website on 15-09-2025 -->
    <xsl:template match="//span[@data-name and @class][lower-case(@data-name) = lower-case($url) or lower-case(@data-name) = lower-case($website) or lower-case(@data-name) = lower-case($doi)]">
              <xsl:element name="CharacterStyleRange">
            <xsl:attribute name="AppliedCharacterStyle">
                <xsl:value-of select="'CharacterStyle/'"/>
                <xsl:value-of select="@data-name"/>
            </xsl:attribute>
            <xsl:element name="HyperlinkTextSource">
                <xsl:attribute name="Self">
                    <!--<xsl:variable name="num">
                        <xsl:number level="any"/>
                    </xsl:variable>-->
                    <xsl:variable name="num">
                        <xsl:number count="span[@data-name and @class][lower-case(@data-name) = lower-case($url) or lower-case(@data-name) = lower-case($website) or lower-case(@data-name) = lower-case($doi)]" level="any"/>
                    </xsl:variable>
                    <!--Added uu to avoid thesel same id with story on 24-06-2021-->
                    <xsl:value-of select="concat('uw',$num)"/>
                </xsl:attribute>
                <xsl:attribute name="Name">
                    <xsl:value-of select="'Source'"/>
                </xsl:attribute>
                <xsl:attribute name="Hidden">
                    <xsl:value-of select="'false'"/>
                </xsl:attribute>
                <xsl:attribute name="AppliedCharacterStyle">
                    <xsl:value-of select="'n'"/>
                </xsl:attribute>
                <xsl:element name="Content">
                    <xsl:value-of select="."/>
                </xsl:element>
                <xsl:element name="HyperLink-Text">
                    <xsl:value-of select="self::span[@data-name and @class][lower-case(@data-name) = lower-case($url) or lower-case(@data-name) = lower-case($website) or lower-case(@data-name) = lower-case($doi)]"/>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>
           <!--End-->
    <xsl:template match="span[@data-fldChar = 'begin']">
        <xsl:if test="following-sibling::span[contains(@data-instrText, 'IF UK')]">
            <xsl:element name="CharacterStyleRange">
                <xsl:attribute name="AppliedCharacterStyle">
                    <xsl:value-of select="'CharacterStyle/'"/>
                    <xsl:choose>
                        <xsl:when test="parent::p/@data-name">
                            <xsl:value-of select="parent::node()/@data-name"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="'$ID/[No character style]'"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
                <xsl:attribute name="AppliedConditions">
                    <xsl:value-of select="'Condition/UK'"/>
                </xsl:attribute>
                <xsl:element name="Content">
                    <xsl:value-of
                        select="following-sibling::span[contains(@data-instrText, 'IF UK')]/substring-after(@data-instrText, 'IF UK ')"
                    />
                </xsl:element>
            </xsl:element>
        </xsl:if>
        <xsl:if
            test="following-sibling::span[@data-fldChar = 'begin'][following-sibling::span[contains(@data-instrText, 'IF US')]]">
            <xsl:element name="CharacterStyleRange">
                <xsl:attribute name="AppliedCharacterStyle">
                    <xsl:value-of select="'CharacterStyle/'"/>
                    <xsl:choose>
                        <xsl:when test="parent::p/@data-name">
                            <xsl:value-of select="parent::node()/@data-name"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="'$ID/[No character style]'"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
                <xsl:attribute name="AppliedConditions">
                    <xsl:value-of select="'Condition/US'"/>
                </xsl:attribute>
                <xsl:element name="Content">
                    <xsl:value-of
                        select="following-sibling::span[contains(@data-instrText, 'IF US')]/substring-after(@data-instrText, 'IF US ')"
                    />
                </xsl:element>
            </xsl:element>
        </xsl:if>
    </xsl:template>


    <!--conditional text for mariappan 12-1-2020-->
    <xsl:template match="span[@if]">
        <xsl:element name="CharacterStyleRange">
            <xsl:attribute name="AppliedCharacterStyle">
                <xsl:value-of select="'CharacterStyle/'"/>
                <xsl:choose>
                    <xsl:when test="parent::p/@data-name">
                        <xsl:value-of select="parent::node()/@data-name"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="'$ID/[No character style]'"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:attribute name="AppliedConditions">
                <xsl:value-of select="'Condition/'"/>
                <xsl:value-of select="@if"/>
            </xsl:attribute>
            <xsl:element name="Content">
                <xsl:value-of select="self::span[@if]/."/>
            </xsl:element>
        </xsl:element>
   </xsl:template>
    <!--end-->


    <xsl:template match="ins">
        <xsl:param name="pPr_Default"/>
        <xsl:param name="rPr_Default"/>
        <xsl:choose>
            <xsl:when test="ancestor::del | ancestor::ins">
                <xsl:apply-templates>
                    <xsl:with-param name="pPr_Default">
                        <xsl:copy-of select="$pPr_Default"/>
                    </xsl:with-param>
                    <xsl:with-param name="rPr_Default">
                        <xsl:copy-of select="$rPr_Default"/>
                    </xsl:with-param>
                </xsl:apply-templates>
            </xsl:when>
            <xsl:otherwise>

                <xsl:element name="Change">
                    <xsl:if test="@datetime">
                        <xsl:attribute name="Date" select="@datetime"/>
                    </xsl:if>
                    <xsl:attribute name="ChangeType" select="'InsertedText'"/>
                    <xsl:if test="@cite">
                        <xsl:attribute name="AppliedDocumentUser">
                            <xsl:choose>
                                <xsl:when test="@cite = 'mailto:'">
                                    <xsl:value-of select="'mailto:None'"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="@cite"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:apply-templates>
                        <xsl:with-param name="pPr_Default">
                            <xsl:copy-of select="$pPr_Default"/>
                        </xsl:with-param>
                        <xsl:with-param name="rPr_Default">
                            <xsl:copy-of select="$rPr_Default"/>
                        </xsl:with-param>
                    </xsl:apply-templates>
                </xsl:element>
                <!--</xsl:if>-->
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="del">
        <xsl:param name="pPr_Default"/>
        <xsl:param name="rPr_Default"/>
        <xsl:choose>
            <xsl:when test="ancestor::del | ancestor::ins">
                <xsl:apply-templates>
                    <xsl:with-param name="pPr_Default">
                        <xsl:copy-of select="$pPr_Default"/>
                    </xsl:with-param>
                    <xsl:with-param name="rPr_Default">
                        <xsl:copy-of select="$rPr_Default"/>
                    </xsl:with-param>
                </xsl:apply-templates>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="Change">
                    <xsl:if test="@cite">
                        <xsl:attribute name="AppliedDocumentUser">
                            <xsl:choose>
                                <xsl:when test="@cite = 'mailto:'">
                                    <xsl:value-of select="'mailto:None'"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="@cite"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:attribute name="ChangeType" select="'DeletedText'"/>
                    <xsl:if test="@datetime">
                        <xsl:attribute name="Date" select="@datetime"/>
                    </xsl:if>
                    <!--   <xsl:apply-templates/>-->
                    <xsl:apply-templates>
                        <xsl:with-param name="pPr_Default">
                            <xsl:copy-of select="$pPr_Default"/>
                        </xsl:with-param>
                        <xsl:with-param name="rPr_Default">
                            <xsl:copy-of select="$rPr_Default"/>
                        </xsl:with-param>
                    </xsl:apply-templates>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- XHTML nested character formatting -->
    <xsl:template name="apply-nested-character-formatting">
        <xsl:param name="rPr_Default"/>
        <!-- apply default character formatting first -->
        <xsl:copy-of select="$rPr_Default"/>
        <!-- incase the paragraph itself deleted or newly inserted  -->
        <xsl:if test="self::*/@itemname">
            <xsl:choose>
                <xsl:when test="self::*/@itemname = 'deleted'">
                    <xsl:element name="w:del">
                        <xsl:attribute name="w:id">
                            <xsl:number level="any"/>
                        </xsl:attribute>
                    </xsl:element>
                </xsl:when>
                <xsl:when test="self::*/@itemname = 'inserted'">
                    <xsl:element name="w:ins">
                        <xsl:attribute name="w:id">
                            <xsl:number level="any"/>
                        </xsl:attribute>
                    </xsl:element>
                </xsl:when>
            </xsl:choose>
        </xsl:if>
        <xsl:if test="ancestor::i or ancestor::em">
            <xsl:element name="w:i"/>
        </xsl:if>
        <xsl:if test="ancestor::b or ancestor::strong">
            <xsl:element name="w:b"/>
        </xsl:if>
        <xsl:if test="ancestor::u">
            <xsl:element name="w:u">
                <xsl:attribute name="w:val" select="'single'"/>
            </xsl:element>
        </xsl:if>
        <xsl:if test="ancestor::strike">
            <xsl:element name="w:strike"/>
        </xsl:if>
        <xsl:if test="ancestor::sup">
            <xsl:element name="w:vertAlign">
                <xsl:attribute name="w:val" select="'superscript'"/>
            </xsl:element>
        </xsl:if>
        <xsl:if test="ancestor::sub">
            <xsl:element name="w:vertAlign">
                <xsl:attribute name="w:val" select="'subscript'"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    <!-- Footnote created on 20.07.2017-->
    <!-- Footnote updated on 05.08.2017
	1. Template match change data-name to class
	2. New XMLElement added(12.08.2017)
	3. Template match change(span[@class='MsoFootnoteReference'] to div[@class='footnotecaption'] )
	4. Remove When condition-->


    <!-- footnote structure change on 9-6-2022 -->
    <!--//span[@class = 'MsoFootnoteReference']-->
    <xsl:template match="span[@class = 'MsoFootnoteReference']| //span[@class = 'FootnoteReference' or @data-name='footnote reference']">

            <!--Updated on 12.08.2017-->
            <xsl:element name="CharacterStyleRange">
                <xsl:attribute name="AppliedCharacterStyle">
                    <xsl:value-of select="'CharacterStyle/'"/>
                    <!--Footnote Character Style 20.02.2017 -->
                    <xsl:choose>
                        <!--<xsl:when test="ancestor::span/@data-name">
                            <xsl:value-of select="ancestor::span/@data-name"/>
                        </xsl:when>-->
                        <xsl:when test="self::span/@data-name">
                            <xsl:value-of select="self::span/@data-name"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="'sup'"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    <!--<xsl:value-of select="ancestor::span/@data-name"/> Footnote characterstyle {Check} 08.02.2017 -->
                </xsl:attribute>
                <!--                        <xsl:attribute name="Position">
                            <xsl:value-of select="'superscript'"/>
                        </xsl:attribute>-->
                <!--<xsl:variable name="astyle" select="ancestor::a/@style"/>-->

                <!--changes based on href 1-4-2019-->
                <xsl:variable name="astyle" select="ancestor::a/substring-after(@href, '#_')"/>
                <xsl:variable name="astyle1" select="descendant::a/substring-after(@href, '#')"/>
                <!-- XmlElement start -->
                <!--Update FootNote {Mahesh} 28.12.2017-->
                <!--FootNote citation-->
                <xsl:element name="XMLElement">
                    <!-- Updated on 12.08.2017-->
                    <xsl:attribute name="Self" select="'di2'"/>
                    <!-- Updated on 12.08.2017-->
                    <!--Footnote Character Style 20.02.2017 -->
                    <xsl:attribute name="MarkupTag">
                        <xsl:value-of select="'XMLTag/'"/>
                        <xsl:choose>
                            <!--<xsl:when test="ancestor::span/@data-name">
                        <xsl:value-of select="ancestor::span/@data-name"/>
                    </xsl:when>-->
                            <xsl:when test="self::span/@data-name">
                                <!--<xsl:value-of select="self::span/@data-name"/>-->
                                <xsl:choose>
                                    <xsl:when test="contains(self::span/@data-name,' ')">
                                        <xsl:value-of select="replace(self::span/@data-name,' ','_')"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="self::span/@data-name"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="'sup'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
                    <!-- XmlElement End -->
                <xsl:choose>
                    <xsl:when test="//div[@style = 'mso-element:footnote'][@id = $astyle] or //li[@style = 'mso-element:footnote'][@id = $astyle1]">

                        <xsl:for-each select="//div[@style = 'mso-element:footnote'][@id = $astyle] | //li[@style = 'mso-element:footnote'][@id = $astyle1]">

                            <xsl:variable name="bstyle" select="@id"/>

                            <xsl:choose>
                                <xsl:when test="$bstyle = $astyle">
                                    <xsl:apply-templates
                                        select="self::div[@style = 'mso-element:footnote']"
                                        mode="moveme"/>
                                </xsl:when>
                                <xsl:when test="$bstyle = $astyle1">
                                    <xsl:apply-templates
                                        select="self::li[@style = 'mso-element:footnote']"
                                        mode="moveme"/>
                                </xsl:when>
                            </xsl:choose>
                        </xsl:for-each>

                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:element>
        </xsl:element>
        <!-- Updated on 12.08.2017-->
    </xsl:template>

    <xsl:template match="div[@style = 'mso-element:footnote'] | li[@style = 'mso-element:footnote']" mode="moveme">
        <Footnote>
            <ParagraphStyleRange AppliedParagraphStyle="ParagraphStyle/$ID/NormalParagraphStyle">
                <!-- <CharacterStyleRange AppliedCharacterStyle="CharacterStyle/$ID/[No character style]"> -->
                <CharacterStyleRange AppliedCharacterStyle="CharacterStyle/FootnoteNumber">
                    <Content>
                        <xsl:processing-instruction name="ACE" select="'4'"/>
                    </Content>
                </CharacterStyleRange>
            </ParagraphStyleRange>
            <xsl:apply-templates/>
        </Footnote>
    </xsl:template>

    <!--<xsl:template match="div[@style = 'mso-element:footnote']/a[contains(@href, '#_ftnref')]">
        
           <CharacterStyleRange AppliedCharacterStyle="CharacterStyle/$ID/[No character style]">
                <Content>
                    <xsl:value-of select="."/>
                </Content>
            </CharacterStyleRange>
        
    </xsl:template>-->

    <xsl:template match="div[@style = 'mso-element:footnote'] | li[@style = 'mso-element:footnote']">
        <xsl:choose>
            <xsl:when
                test="@id = preceding::a[@class = 'footnotecitation']/substring-after(@href, '#_')"/>
            <xsl:when
                test="@id = descendant::a[contains(@class , 'footnotecitation')]/substring-after(@href, '#')"/>
            
            <xsl:otherwise>
                <!--<xsl:apply-templates/>-->
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="a[contains(@style, 'mso-footnote-id') or contains(@class,'footnotecitation') and contains(@href, '#_ftnref') or contains(@href, '#ftnref')]">
        <xsl:choose>
            <xsl:when test="ancestor::div[@style = 'mso-element:footnote'] or ancestor::li[@style = 'mso-element:footnote']"/>
            <xsl:otherwise>
                <!--commented to avoid the property value as a text in indesign on  29-6-2023-->
                <!--<xsl:apply-templates select="@* | node()"/>-->
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- End Footnote-->

    <!--Endnote 28-8-2018-->

    <xsl:template match="div[@style = 'footnote_'] | aside[@style = 'footnote_']">
        <xsl:choose>
            <xsl:when test="descendant::p">
                <xsl:apply-templates select="@* | node()"/>
            </xsl:when>
            <xsl:otherwise> </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!--<xsl:template match="div[@style = 'mso-element:endnote'] | not[descendant::p]"/>-->
<!--Added for endnote module on 19-07-2021-->
    <xsl:template match="div[@style = 'mso-element:endnote'] | li[@style = 'mso-element:endnote']">
        <xsl:choose>
            <xsl:when test="descendant::p">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <!--<xsl:apply-templates/>-->
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!--20-6-2019 To Remove End line Break for FT,EN-->
    <xsl:template match="div[@id = 'footnote_'] | div[@id = 'endnote_'] | aside[@id = 'endnote_'] | aside[@id = 'footnote_']">
          <xsl:choose>
            <xsl:when test="descendant::div/child::p | descendant::li/child::p">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <!--added for notes module on 09-08-2021-->
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!--end-->

    <!-- EndNotes created on 05.08.2017-->

    <!-- Commant started on 20.7.2017-->
    <!--<xsl:template match="img[@data-comment] | span[@data-comment]">
        <xsl:variable name="astyle" select="@data-comment"/>
        <xsl:for-each select="//CommentReference">
            <xsl:variable name="bstyle" select="@data-commentvalue"/>
            <xsl:choose>
                <xsl:when test="$bstyle = $astyle">
                    <CharacterStyleRange AppliedCharacterStyle="CharacterStyle/annotation reference">
                        <xsl:apply-templates select="self::CommentReference" mode="moveme"/>
                    </CharacterStyleRange>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>-->
    <!--Add For each condition {commentreference} 15.12.2017 -->
    <!--<xsl:for-each select="//commentreference">
            <xsl:variable name="bstyle" select="@data-commentvalue"/>
            <xsl:choose>
                <xsl:when test="$bstyle = $astyle">

                    <CharacterStyleRange AppliedCharacterStyle="CharacterStyle/annotation reference">
                        <xsl:apply-templates select="self::commentreference" mode="movemec"/>
                    </CharacterStyleRange>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>-->

    <!--<xsl:template match="*/span[@data-commentrange='cmtStart']">
        <xsl:message>ji</xsl:message>
        <xsl:attribute name="AppliedConditions">
            <xsl:value-of select="'Condition/Highlight'"/>
        </xsl:attribute>
    </xsl:template>
-->
    <xsl:template match="img[@data-comment] | span[@data-comment] | img[@data-commentimg] | span[@data-commentimg] | span[@data-commentgroup]">
         
        <xsl:variable name="astyle" select="@data-comment"/>
        <xsl:variable name="aastyle" select="@data-commentimg"/>
        <!--<xsl:variable name="aaastyle" select="@data-commentgroup"/>-->
        <!--Added on 08-02-2021 for marriapn commentgroup text missing-->
        <xsl:variable name="aaastyle">
            
                <xsl:if test="self::span[not(@data-commentgroup = following::span[@data-commentgroup]/@data-commentgroup)]">
                 <xsl:value-of select="self::span[@data-commentgroup][1]/@data-commentgroup"/>
                </xsl:if>
                
            
        </xsl:variable>
        
        <!--Added for Editor on 10-02-2021 [not(@data-comment= preceding::span[@data-commentgroup][1]/@data-commentgroup)]-->        
        <xsl:if
            test="self::img[@data-commentimg][not(@data-commentimg = ancestor::span[@data-commentgroup]/@data-commentgroup)] or self::span[@data-commentimg][not(@data-commentimg = ancestor::span[@data-commentgroup]/@data-commentgroup)] and not(count(preceding::span[@data-commentrange = 'cmtEnd'])) or self::img[@data-comment][not(@data-comment = ancestor::span[@data-commentgroup]/@data-commentgroup)] and not(count(preceding::span[@data-commentrange = 'cmtEnd'])) or self::span[@data-comment][not(@data-comment = ancestor::span[@data-commentgroup]/@data-commentgroup)][not(@data-commentrange = 'cmtStart')][not(@data-commentrange = 'cmtEnd')][@data-change='commentadded'][not(@data-comment= preceding::span[@data-commentgroup][1]/@data-commentgroup)]">
               <xsl:for-each select="//CommentReference">
                <xsl:variable name="bstyle" select="@data-commentvalue"/>
                <xsl:choose>
                    <xsl:when test="$bstyle = $astyle">
                        <CharacterStyleRange
                            AppliedCharacterStyle="CharacterStyle/annotation reference">
                            <xsl:apply-templates select="self::CommentReference" mode="moveme"/>
                        </CharacterStyleRange>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:choose>
                            <xsl:when test="$bstyle = $aastyle">
                                <CharacterStyleRange
                                    AppliedCharacterStyle="CharacterStyle/annotation reference">
                                    <xsl:apply-templates select="self::CommentReference"
                                        mode="moveme"/>
                                </CharacterStyleRange>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
            <!--Add For each condition {commentreference} 15.12.2017 -->
            <xsl:for-each select="//commentreference">
                <xsl:variable name="bstyle" select="@data-commentvalue"/>
                <xsl:choose>
                    <xsl:when test="$bstyle = $astyle">

                        <CharacterStyleRange
                            AppliedCharacterStyle="CharacterStyle/annotation reference">
                            <xsl:apply-templates select="self::commentreference" mode="movemec"/>
                        </CharacterStyleRange>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:choose>
                            <xsl:when test="$bstyle = $aastyle">

                                <CharacterStyleRange
                                    AppliedCharacterStyle="CharacterStyle/annotation reference">
                                    <xsl:apply-templates select="self::commentreference"
                                        mode="movemec"/>
                                </CharacterStyleRange>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </xsl:if>
        <xsl:if
            test="self::img[@data-commentimg][not(@data-commentimg = ancestor::span[@data-commentgroup]/@data-commentgroup)] or self::span[@data-commentimg][not(@data-commentimg = ancestor::span[@data-commentgroup]/@data-commentgroup)] and count(preceding::span[@data-commentrange = 'cmtEnd']) and not(count(preceding::span[@data-change='commentadded'])) or self::img[@data-comment] and count(preceding::span[@data-commentrange = 'cmtEnd'])">
            
             <xsl:for-each select="//CommentReference">
                <xsl:variable name="bstyle" select="@data-commentvalue"/>
                <xsl:choose>
                    <xsl:when test="$bstyle = $astyle">
                        <CharacterStyleRange
                            AppliedCharacterStyle="CharacterStyle/annotation reference">
                            <xsl:apply-templates select="self::CommentReference" mode="moveme"/>
                        </CharacterStyleRange>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:choose>
                            <xsl:when test="$bstyle = $aastyle">
                                <CharacterStyleRange
                                    AppliedCharacterStyle="CharacterStyle/annotation reference">
                                    <xsl:apply-templates select="self::CommentReference"
                                        mode="moveme"/>
                                </CharacterStyleRange>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
            <!--Add For each condition {commentreference} 15.12.2017 -->
            <xsl:for-each select="//commentreference">
                
                <xsl:variable name="bstyle" select="@data-commentvalue"/>
                <xsl:choose>
                    <xsl:when test="$bstyle = $astyle">

                        <CharacterStyleRange
                            AppliedCharacterStyle="CharacterStyle/annotation reference">
                            <xsl:apply-templates select="self::commentreference" mode="movemec"/>
                        </CharacterStyleRange>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:choose>
                            <xsl:when test="$bstyle = $aastyle">

                                <CharacterStyleRange
                                    AppliedCharacterStyle="CharacterStyle/annotation reference">
                                    <xsl:apply-templates select="self::commentreference"
                                        mode="movemec"/>
                                </CharacterStyleRange>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </xsl:if>
        <xsl:if test="self::span[@data-commentgroup]">
            <!--Added on 08-02-2021 for marriapn commentgroup text missing-->
            <xsl:if test="self::span[@data-commentgroup and @data-change='commentGroup'][string-length(.)&gt;0]">
             <xsl:apply-templates/>
            </xsl:if>
            
                <xsl:for-each select="//CommentReference">
                <xsl:variable name="bstyle" select="@data-commentvalue"/>
                
                    <xsl:if test="$bstyle = $aaastyle">
                        
                        <CharacterStyleRange
                            AppliedCharacterStyle="CharacterStyle/annotation reference">
                            <xsl:apply-templates select="self::CommentReference" mode="moveme"/>
                        </CharacterStyleRange>
                    </xsl:if>
                    
                
            </xsl:for-each>
            <!--Add For each condition {commentreference} 15.12.2017 -->
            <xsl:for-each select="//commentreference">
                
                <xsl:variable name="bstyle" select="@data-commentvalue"/>
                
                <xsl:if test="$bstyle = $aaastyle">
                           <CharacterStyleRange
                            AppliedCharacterStyle="CharacterStyle/annotation reference">
                            <xsl:apply-templates select="self::commentreference" mode="movemec"/>
                        </CharacterStyleRange>
                    </xsl:if>
                                  
            </xsl:for-each>
        </xsl:if>
    </xsl:template>




    <xsl:template match="CommentReference" mode="moveme">
        <xsl:element name="Note">
            <xsl:attribute name="CreationDate">
                <xsl:value-of select="@cDate"/>
            </xsl:attribute>
            <xsl:attribute name="ModificationDate">
                <xsl:value-of select="''"/>
            </xsl:attribute>
            <xsl:attribute name="UserName">
                <xsl:value-of select="@author"/>
            </xsl:attribute>
            <!--Added for indd running head on 29-04-2021-->
            <xsl:if test="string-length(descendant::Comment/@data-instruction) > 0">
                <xsl:attribute name="Instruction">
                    <xsl:value-of select="descendant::Comment/@data-instruction"/>
                </xsl:attribute>
                <xsl:element name="Properties">
                    <xsl:element name="Label">
                        <xsl:element name="KeyValuePair">                            
                            <xsl:attribute name="Key">
                                <xsl:value-of select="'Label'"/>
                            </xsl:attribute>
                            <xsl:attribute name="Value">
                                <xsl:value-of select="descendant::Comment/@data-type"/>
                            </xsl:attribute>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
            </xsl:if>
            <!--End-->
            <!-- Mahesh Updated V6(08.08.2017)>
			<ParagraphStyleRange AppliedParagraphStyle="ParagraphStyle/CommentText">
				<XMLElement Self="di2" MarkupTag="XMLTag/CommentText">
					<XMLElement Self="di2" MarkupTag="XMLTag/CommentReference">
						<CharacterStyleRange AppliedCharacterStyle="CharacterStyle/CommentReference"/>
					</XMLElement>-->
            <xsl:apply-templates/>
            <!--</XMLElement>-->
            <CharacterStyleRange AppliedCharacterStyle="CharacterStyle/$ID/[No character style]">
                <Br/>
            </CharacterStyleRange>
            <!--</ParagraphStyleRange>-->
        </xsl:element>

    </xsl:template>
    <!--Updated {Mahesh} 19.12.2017-->
    <xsl:template match="commentreference" mode="movemec">
         <xsl:element name="Note">
            <xsl:attribute name="CreationDate">
                <xsl:value-of select="@cDate"/>
            </xsl:attribute>
            <xsl:attribute name="ModificationDate">
                <xsl:value-of select="''"/>
            </xsl:attribute>
            <xsl:attribute name="UserName">
                <xsl:value-of select="@author"/>
            </xsl:attribute>
             <!--Added for indd running head on 29-04-2021-->
             <xsl:if test="string-length(descendant::comment/@data-instruction) > 0">
                 <xsl:attribute name="Instruction">
                     <xsl:value-of select="descendant::comment/@data-instruction"/>
                 </xsl:attribute>
                 <xsl:element name="Properties">
                     <xsl:element name="Label">
                         <xsl:element name="KeyValuePair">                            
                             <xsl:attribute name="Key">
                                 <xsl:value-of select="'Label'"/>
                             </xsl:attribute>
                             <xsl:attribute name="Value">
                                 <xsl:value-of select="descendant::comment/@data-type"/>
                             </xsl:attribute>
                         </xsl:element>
                     </xsl:element>
                 </xsl:element>
             </xsl:if>
             <!--End-->
            <!-- Mahesh Updated V6(08.08.2017)>
			<ParagraphStyleRange AppliedParagraphStyle="ParagraphStyle/CommentText">
				<XMLElement Self="di2" MarkupTag="XMLTag/CommentText">
					<XMLElement Self="di2" MarkupTag="XMLTag/CommentReference">
						<CharacterStyleRange AppliedCharacterStyle="CharacterStyle/CommentReference"/>
					</XMLElement>-->
            <xsl:apply-templates/>
            <!--</XMLElement>-->

            <!--</ParagraphStyleRange>-->
            <CharacterStyleRange AppliedCharacterStyle="CharacterStyle/$ID/[No character style]">
                <Br/>
            </CharacterStyleRange>
        </xsl:element>

    </xsl:template>

    <xsl:template match="CommentReference | commentreference"/>
    <!--<xsl:template match="label">
		<xsl:choose>
			<xsl:when test="ancestor::comment">
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>-->
    <!-- End command>-->

    <!--<xsl:template match="p[ @data-name = 'Place-Holder'] | p[@data-name = 'Photo'] | p[@data-name = 'Image'] | p[@data-name = 'Picture'] | p[@data-name = 'Map']">-->
    <!--Added on 27-10-2020 to avoid unwanted image-->
    <xsl:template
        match="p[lower-case(@data-name) = 'place-holder'][contains(.,'.')] | p[lower-case(@data-name) = 'photo'][contains(.,'.')][not(count(descendant::span[contains(@data-alias, 'ChapNo')]) or count(descendant::span[contains(@data-alias, 'SeqNo')]))] | p[lower-case(@data-name) = 'image'][contains(.,'.')][not(count(descendant::span[contains(@data-alias, 'ChapNo')]) or count(descendant::span[contains(@data-alias, 'SeqNo')]))][not(descendant::img)] | p[lower-case(@data-name) = 'picture'][contains(.,'.')][not(count(descendant::span[contains(@data-alias, 'ChapNo')]) or count(descendant::span[contains(@data-alias, 'SeqNo')]))] | p[lower-case(@data-name) = 'map'][contains(.,'.')][not(count(descendant::span[contains(@data-alias, 'ChapNo')]) or count(descendant::span[contains(@data-alias, 'SeqNo')]))] | p[lower-case(@data-name) = 'figure'][contains(.,'.')][not(count(descendant::span[contains(@data-alias, 'ChapNo')]) or count(descendant::span[contains(@data-alias, 'SeqNo')]))]">
        <xsl:variable name="paragraphStyle" select="@data-name"/>
        <xsl:variable name="qqq" select="$paragraphStyle"/>
        <xsl:variable name="al" select="document('Artlog.xml')"/>
        <xsl:text disable-output-escaping="yes">&#x3C;XMLElement Self="di2" MarkupTag="XMLTag/</xsl:text>
        <xsl:choose>
            <xsl:when test="contains($qqq, ':')">
                <xsl:value-of select="replace($qqq, ':', '\\%3a')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$qqq"/>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:text disable-output-escaping="yes">"&#x3E;</xsl:text>
        <xsl:text disable-output-escaping="yes">&#x3C;ParagraphStyleRange AppliedParagraphStyle="ParagraphStyle/</xsl:text>
        <xsl:choose>
            <xsl:when test="contains($qqq, ':')">
                <xsl:value-of select="replace($qqq, ':', '\\%3a')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$qqq"/>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:text disable-output-escaping="yes">"&#x3E;</xsl:text>
        <xsl:variable name="dName" select="@data-name"/>
        <xsl:variable name="img" select="."/>
        <XMLElement Self="di2" MarkupTag="XMLTag/links">
            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="linkend" Value="</xsl:text>
            <xsl:variable name="FPM" select="$img"/>               
            <xsl:value-of select="$FPM"/>
            <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
            <!-- Added for inlineref Azure 15087 on 11-06-2024-->
            <xsl:variable name="name" select="self::*//img[@data-artname]/@data-artname"/>
            <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                <xsl:choose>
                    <xsl:when test="$Alttext//artdetail[@data-artname = $name][@data-position='inline']">
                        <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributeninlinehref" Name="inlinehref" Value="</xsl:text>
                        <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-src"/>
                        <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloatrecthref" Name="floatrecthref" Value="</xsl:text>
                        <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-src"/>
                        <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
        </XMLElement>
        <XMLElement Self="di2" MarkupTag="XMLTag/figure">
            <!--<XMLElement Self="di2" MarkupTag="XMLTag/links">
                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="linkend" Value="</xsl:text>
                <xsl:variable name="FPM" select="$img"/>               
                <xsl:value-of select="$FPM"/>
                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                <!-\- Added for inlineref Azure 15087 on 11-06-2024-\->
                <xsl:variable name="name" select="self::*//img[@data-artname]/@data-artname"/>
                <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                    <xsl:choose>
                        <xsl:when test="$Alttext//artdetail[@data-artname = $name][@data-position='inline']">
                            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributeninlinehref" Name="inlinehref" Value="</xsl:text>
                            <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-src"/>
                            <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloatrecthref" Name="floatrecthref" Value="</xsl:text>
                            <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-src"/>
                            <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:if>
            </XMLElement>-->
            <xsl:variable name="FPM" select="$img"/>
            <xsl:variable name="artlogVal" select="$al/Chapter/art[contains(@path, $FPM)][1]/@path"/>
            <xsl:choose>
                <xsl:when test="string-length($artlogVal) > 0">
                    <!-- xml:id on 30-1-2025 -->
                    <xsl:element name="XMLAttribute">
                        <xsl:attribute name="Self"><xsl:value-of select="'di2XMLAttributenxml:id'"/></xsl:attribute>
                        <xsl:attribute name="Name"><xsl:value-of select="'xml:id'"/></xsl:attribute>
                        <xsl:attribute name="Value"><xsl:value-of select="$FPM"/></xsl:attribute>
                    </xsl:element>
                    <!-- End -->
                    <xsl:choose>
                        <xsl:when test="*[lower-case(@data-name) = 'photopmi']">
                            <XMLElement Self="di2" MarkupTag="XMLTag/Image" XMLContent="ua4c2">
                                <XMLAttribute Self="di2XMLAttributenaid-pstyle" Name="aid:pstyle"
                                    Value="PHOTOPMI"/>
                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                <xsl:value-of select="$artlogVal"/>
                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                <!--Added for Alt test value for marriapan 16-06-2020-->
                                <xsl:variable name="name" select="$al/Chapter/art[contains(@path, $FPM)][1]/@name"/>
                                <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                    <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-artalt"/>
                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                </xsl:if>
                                <!--End-->
                            </XMLElement>
                        </xsl:when>
                        <xsl:when test="*[lower-case(@data-name) = 'imagepmi']">
                            <XMLElement Self="di2" MarkupTag="XMLTag/Image" XMLContent="ua4c2">
                                <XMLAttribute Self="di2XMLAttributenaid-pstyle" Name="aid:pstyle"
                                    Value="IMAGEPMI"/>
                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                <xsl:value-of select="$artlogVal"/>
                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                <!--Added for Alt test value for marriapan 16-06-2020-->
                                <xsl:variable name="name" select="$al/Chapter/art[contains(@path, $FPM)][1]/@name"/>
                                <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                    <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-artalt"/>
                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                </xsl:if>
                                <!--End-->
                            </XMLElement>
                        </xsl:when>
                        <xsl:when test="*[lower-case(@data-name) = 'mappmi']">
                            <XMLElement Self="di2" MarkupTag="XMLTag/Image" XMLContent="ua4c2">
                                <XMLAttribute Self="di2XMLAttributenaid-pstyle" Name="aid:pstyle"
                                    Value="MAPPMI"/>
                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                <xsl:value-of select="$artlogVal"/>
                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                <!--Added for Alt test value for marriapan 16-06-2020-->
                                <xsl:variable name="name" select="$al/Chapter/art[contains(@path, $FPM)][1]/@name"/>
                                <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                    <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-artalt"/>
                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                </xsl:if>
                                <!--End-->
                            </XMLElement>
                        </xsl:when>
                        <xsl:when test="*[lower-case(@data-name) = 'figurepmi']">
                            <XMLElement Self="di2" MarkupTag="XMLTag/Image" XMLContent="ua4c2">
                                <XMLAttribute Self="di2XMLAttributenaid-pstyle" Name="aid:pstyle"
                                    Value="FIGUREPMI"/>
                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                <xsl:value-of select="$artlogVal"/>
                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                <!--Added for Alt test value for marriapan 16-06-2020-->
                                <xsl:variable name="name" select="$al/Chapter/art[contains(@path, $FPM)][1]/@name"/>
                                <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                    <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-artalt"/>
                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                </xsl:if>
                                <!--End-->
                            </XMLElement>
                        </xsl:when>

                        <xsl:otherwise>
                            <XMLElement Self="di2" MarkupTag="XMLTag/Image" XMLContent="ua4c2">
                                <XMLAttribute Self="di2XMLAttributenaid-pstyle" Name="aid:pstyle"/>
                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                <xsl:value-of select="$artlogVal"/>
                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                <!--Added for Alt test value for marriapan 16-06-2020-->
                                <xsl:variable name="name" select="$al/Chapter/art[contains(@path, $FPM)][1]/@name"/>
                                <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                    <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-artalt"/>
                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                </xsl:if>
                                <!--End-->
                            </XMLElement>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:element name="Content">
                        <xsl:value-of select="."/>
                    </xsl:element>
                </xsl:otherwise>
            </xsl:choose>
        </XMLElement>
        <xsl:text disable-output-escaping="yes">&#x3C;/ParagraphStyleRange&#x3E;</xsl:text>
        <xsl:text disable-output-escaping="yes">&#x3C;/XMLElement&#x3E;</xsl:text>
       <CharacterStyleRange AppliedCharacterStyle="CharacterStyle/$ID/[No character style]">
            <xsl:text disable-output-escaping="yes">&#x3C;Br/&#x3E;</xsl:text>
        </CharacterStyleRange>
    </xsl:template>
    
       
    
    <!--[not(@alt ='image')] to avoid <img data-split="d1e2744" src="../images/" class="_idGenObjectAttribute-1" alt="image"/> 10-9-2019-->
    <xsl:template match="p[descendant::img[contains(@alt, '.')]]">
        
        <xsl:variable name="paragraphStyle" select="@data-name"/>
        
        <xsl:variable name="qqq" select="$paragraphStyle"/>
        <xsl:variable name="al" select="document('Artlog.xml')"/>

        <xsl:text disable-output-escaping="yes">&#x3C;XMLElement Self="di2" MarkupTag="XMLTag/</xsl:text>
        <xsl:choose>
            <xsl:when test="contains($qqq, ':')">
                <xsl:value-of select="replace($qqq, ':', '\\%3a')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$qqq"/>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:text disable-output-escaping="yes">"&#x3E;</xsl:text>
        <!-- XmlElement start -->
        <xsl:text disable-output-escaping="yes">&#x3C;ParagraphStyleRange AppliedParagraphStyle="ParagraphStyle/</xsl:text>
        <xsl:choose>
            <xsl:when test="contains($qqq, ':')">
                <xsl:value-of select="replace($qqq, ':', '\\%3a')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$qqq"/>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:text disable-output-escaping="yes">"&#x3E;</xsl:text>
        <!-- XmlElement End -->
        <xsl:apply-templates/>
        <xsl:variable name="dName" select="@data-name"/>
        <xsl:variable name="img" select="self::p/img/@alt"/>
        <xsl:variable name="FPM" select="$img"/>
        <xsl:if test="$al/Chapter/art[contains(@path, $FPM)]">

            <XMLElement Self="di2" MarkupTag="XMLTag/figure">
                <XMLElement Self="di2" MarkupTag="XMLTag/links">
                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="linkend" Value="</xsl:text>
                    <xsl:variable name="FPM" select="$img"/>
                    <xsl:value-of select="$FPM"/>
                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                    <!-- Added for inlineref Azure 15087 on 11-06-2024-->
                    <xsl:variable name="name" select="self::*//img[@data-artname]/@data-artname"/>
                    <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                        <xsl:choose>
                            <xsl:when test="$Alttext//artdetail[@data-artname = $name][@data-position='inline']">
                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributeninlinehref" Name="inlinehref" Value="</xsl:text>
                                <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-src"/>
                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <!--<xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloathref" Name="floathref" Value="</xsl:text>-->
                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloatrecthref" Name="floatrecthref" Value="</xsl:text>
                                <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-src"/>
                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:if>
                    <!-- End -->
                </XMLElement>

                <xsl:variable name="FPM" select="$img"/>

                <xsl:variable name="artlogVal"
                    select="$al/Chapter/art[contains(@path, $FPM)][1]/@path"/>

                <xsl:choose>
                    <xsl:when test="string-length($artlogVal) > 0">
                        <XMLElement Self="di2" MarkupTag="XMLTag/Image" XMLContent="ua4c2">
                            <XMLAttribute Self="di2XMLAttributenaid-pstyle" Name="aid:pstyle"/>
                            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                            <xsl:value-of select="$artlogVal"/>
                            <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                            <!--Added for Alt test value for marriapan 16-06-2020-->
                            <xsl:variable name="name" select="$al/Chapter/art[contains(@path, $FPM)][1]/@name"/>
                            <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-artalt"/>
                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                            </xsl:if>
                            <!--End-->
                        </XMLElement>
                    </xsl:when>
                </xsl:choose>
            </XMLElement>
        </xsl:if>
        <!-- XmlElement start -->
        <xsl:text disable-output-escaping="yes">&#x3C;/ParagraphStyleRange&#x3E;</xsl:text>
        <!-- XmlElement End -->
        <xsl:text disable-output-escaping="yes">&#x3C;/XMLElement&#x3E;</xsl:text>
        <CharacterStyleRange AppliedCharacterStyle="CharacterStyle/$ID/[No character style]">
            <xsl:text disable-output-escaping="yes">&#x3C;Br/&#x3E;</xsl:text>
        </CharacterStyleRange>
    </xsl:template>

<!--Added to image name match with artlog on 04-01-2021-->
    <xsl:template match="//img[not(contains(@alt, '.'))][not(@data-artname)][contains(tokenize(@src, '/')[last()],'.')]">
         <xsl:variable name="paragraphStyle" select="@data-name"/>
        <xsl:variable name="al" select="document('Artlog.xml')"/>
        <xsl:variable name="dName" select="parent::p/@data-name"/>
        <xsl:variable name="img" select="self::img/tokenize(@src, '/')[last()]"/>
        <xsl:variable name="FPM" select="$img"/>
        <xsl:if test="$al/Chapter/art[contains(@path, $FPM)]"> 
            <XMLElement Self="di2" MarkupTag="XMLTag/figure">
                <XMLElement Self="di2" MarkupTag="XMLTag/links">
                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="linkend" Value="</xsl:text>
                    <xsl:variable name="FPM" select="$img"/>
                    <xsl:value-of select="$FPM"/>
                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                    <!-- Added for inlineref Azure 15087 on 11-06-2024-->
                    <xsl:variable name="name" select="self::*//img[@data-artname]/@data-artname"/>
                    <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                        <xsl:choose>
                            <xsl:when test="$Alttext//artdetail[@data-artname = $name][@data-position='inline']">
                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributeninlinehref" Name="inlinehref" Value="</xsl:text>
                                <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-src"/>
                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <!--<xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloathref" Name="floathref" Value="</xsl:text>-->
                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloatrecthref" Name="floatrecthref" Value="</xsl:text>
                                <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-src"/>
                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:if>
                    <!-- End -->
                </XMLElement> 
                <xsl:variable name="FPM" select="$img"/>
                <xsl:variable name="artlogVal"
                    select="$al/Chapter/art[contains(@path, $FPM)][1]/@path"/>
                <xsl:choose>
                    <xsl:when test="string-length($artlogVal) > 0">
                        <XMLElement Self="di2" MarkupTag="XMLTag/Image" XMLContent="ua4c2">
                            <XMLAttribute Self="di2XMLAttributenaid-pstyle" Name="aid:pstyle"/>
                            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                            <xsl:value-of select="$artlogVal"/>
                            <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                            <!--Added for Alt test value for marriapan 16-06-2020-->
                            <xsl:variable name="name" select="$al/Chapter/art[contains(@path, $FPM)][1]/@name"/>
                            <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-artalt"/>
                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                            </xsl:if>
                            <!--End-->
                        </XMLElement>
                    </xsl:when>
                </xsl:choose>
            </XMLElement>
        </xsl:if>
        </xsl:template>

<!--Added on 02-09-2021 for image without figure group-->
    <!-- Added to if float img has inline on 3-9-2024 Azure 15257 -->
    <!-- <xsl:template match="//img[@data-artname][not(parent::figure)] | //img[@data-artname][not(following-sibling::p)][not(following-sibling::figcaption[1])][parent::figure]"> -->
    <!-- Added to remove the duplicate by float struture with inline image [not(following-sibling::*[1][self::figcaption])] 5-12-2024 -->
    <xsl:template match="//img[@data-artname][not(parent::figure)] | //img[@data-artname = $Alttext//artdetail[@data-position='inline']/@data-artname][parent::figure][not(following-sibling::*[1][self::figcaption])]">
        
        <xsl:variable name="data-artname" select="@data-artname"/>
        
   
        <xsl:if test="self::img[@data-artname][not(parent::figure)]">
            
            <xsl:variable name="data-artname" select="self::img[@data-artname][not(parent::figure)]/@data-artname"/>
            
            <xsl:if test="$Alttext//artdetail[@data-artname = $data-artname]">
                
                <xsl:variable name="type" select="@data-position"/>
                <xsl:if test="not($Alttext//artdetail[@data-artname = $data-artname][@data-position='inline'])">
                    <XMLElement Self="di2" MarkupTag="XMLTag/links">
                        <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="linkend" Value="</xsl:text>
                        <xsl:value-of select="'cha-F.'"/>
                        <xsl:variable name="id">
                            <xsl:value-of select="count(preceding::img)"/>
                        </xsl:variable>
                        <xsl:value-of select="concat(substring-before($data-artname,'.'),$id)"/>
                        <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                        <!-- Added for inlineref Azure 15087 on 11-06-2024-->
                        <xsl:choose>
                            <xsl:when test="$Alttext//artdetail[@data-artname = $data-artname][@data-position='inline']">
                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributeninlinehref" Name="inlinehref" Value="</xsl:text>
                                <xsl:value-of select="$Alttext//artdetail[@data-artname = $data-artname]/@data-src"/>
                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <!--<xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloathref" Name="floathref" Value="</xsl:text>-->
                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloatrecthref" Name="floatrecthref" Value="</xsl:text>
                                <xsl:value-of select="$Alttext//artdetail[@data-artname = $data-artname]/@data-src"/>
                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                        <!-- End -->
                    </XMLElement>
                </xsl:if>
            </xsl:if>
            <!-- cicerone 04-9-2025 -->
            <!-- commented to work all scenarios  with or without div[contains(@id,'artDetails') 10-09-2025 -->
            <!--  and not(//div[contains(@id,'artDetails')]) -->
            <xsl:if test="not($Alttext//artdetail[@data-artname = $data-artname])">
                <XMLElement Self="di2" MarkupTag="XMLTag/links">
                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="linkend" Value="</xsl:text>
                    <xsl:value-of select="'cha-F.'"/>
                    <xsl:variable name="id">
                        <xsl:value-of select="count(preceding::img)"/>
                    </xsl:variable>
                    <xsl:value-of select="concat(substring-before($data-artname,'.'),$id)"/>
                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributeninlinehref" Name="inlinehref" Value="</xsl:text>
                    <xsl:value-of select="concat('/',$data-artname)"/>
                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                    </XMLElement>
            </xsl:if>
            <!-- End -->
        </xsl:if>
        
        
        
        
           <XMLElement Self="di2" MarkupTag="XMLTag/figure">
               <xsl:if test="$Alttext//artdetail[@data-artname = $data-artname]">
                   
                   <xsl:variable name="type" select="@data-position"/>
                   <xsl:if test="$Alttext//artdetail[@data-artname = $data-artname][@data-orientation or @data-position or @data-moveto or @data-resize or @data-final-size]">
                       <xsl:if test="$Alttext//artdetail[@data-artname = $data-artname][@data-position='inline']">
                       <xsl:if test="$Alttext//artdetail[@data-artname = $data-artname]/@data-orientation">
                           <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="orientation" Value="</xsl:text>                 
                           <xsl:value-of select="$Alttext//artdetail[@data-artname = $data-artname]/@data-orientation"/>
                           <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                       </xsl:if>
                       <xsl:if test="$Alttext//artdetail[@data-artname = $data-artname]/@data-position">
                           <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="position" Value="</xsl:text>                 
                           <xsl:value-of select="$Alttext//artdetail[@data-artname = $data-artname]/@data-position"/>
                           <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                       </xsl:if>
                           
                           <!-- Added for image resize on 18-11-2021 -->
                           <xsl:if test="$Alttext//artdetail[@data-artname = $data-artname]/@data-moveto">
                               <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="moveto" Value="</xsl:text>                 
                               <xsl:value-of select="$Alttext//artdetail[@data-artname = $data-artname]/@data-moveto"/>
                               <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                           </xsl:if>
                           <xsl:if test="$Alttext//artdetail[@data-artname = $data-artname]/@data-resize">
                               <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="resize" Value="</xsl:text>                 
                               <xsl:value-of select="$Alttext//artdetail[@data-artname = $data-artname]/@data-resize"/>
                               <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                           </xsl:if>
                           <!-- New data-final-size attribute added on 26-12-2022 -->
                           <xsl:if test="$Alttext//artdetail[@data-artname = $data-artname]/@data-final-size">
                               <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="data-final-size" Value="</xsl:text>                 
                               <xsl:value-of select="$Alttext//artdetail[@data-artname = $data-artname]/@data-final-size"/>
                               <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                           </xsl:if>
                           <!-- End -->
                       </xsl:if>
                       <xsl:if test="not($Alttext//artdetail[@data-artname = $data-artname][@data-position='inline']) and not(following-sibling::figcaption[1][@data-alias='Caption'])">
                           
                           <xsl:if test="$Alttext//artdetail[@data-artname = $data-artname]/@data-orientation">
                               <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="orientation" Value="</xsl:text>                 
                               <xsl:value-of select="$Alttext//artdetail[@data-artname = $data-artname][1]/@data-orientation"/>
                               <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                           </xsl:if>
                           <xsl:if test="$Alttext//artdetail[@data-artname = $data-artname]/@data-position">
                               <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="position" Value="</xsl:text>                 
                               <xsl:value-of select="$Alttext//artdetail[@data-artname = $data-artname][1]/@data-position"/>
                               <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                           </xsl:if>
                           <!-- Added for image resize on 18-11-2021 -->
                           <xsl:if test="$Alttext//artdetail[@data-artname = $data-artname]/@data-moveto">
                               <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="moveto" Value="</xsl:text>                 
                               <xsl:value-of select="$Alttext//artdetail[@data-artname = $data-artname]/@data-moveto"/>
                               <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                           </xsl:if>
                           <xsl:if test="$Alttext//artdetail[@data-artname = $data-artname]/@data-resize">
                               <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="resize" Value="</xsl:text>                 
                               <xsl:value-of select="$Alttext//artdetail[@data-artname = $data-artname]/@data-resize"/>
                               <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                           </xsl:if>
                           <!-- New data-final-size attribute added on 26-12-2022 -->
                           <xsl:if test="$Alttext//artdetail[@data-artname = $data-artname]/@data-final-size">
                               <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="data-final-size" Value="</xsl:text>                 
                               <xsl:value-of select="$Alttext//artdetail[@data-artname = $data-artname]/@data-final-size"/>
                               <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                           </xsl:if>
                           <!-- End -->
                           <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="instruction" Value="inline-float"/&#x3E;</xsl:text>
                           <xsl:element name="XMLAttribute">
                               
                               <xsl:attribute name="Self" select="'di2XMLAttributenxml:id'"/>
                               <xsl:attribute name="Name" select="'xml:id'"/>
                               <xsl:attribute name="Value">
                                   <xsl:value-of select="'cha-F.'"/>
                                   <xsl:variable name="id">
                                       <xsl:value-of select="count(preceding::img)"/>
                                   </xsl:variable>
                                   <xsl:value-of select="concat(substring-before($data-artname,'.'),$id)"/>
                                   
                               </xsl:attribute>
                           </xsl:element>
                           
                       </xsl:if>
                   </xsl:if>
               </xsl:if>
               <!-- cicerone 04-9-2025 -->
               <xsl:if test="not($Alttext//artdetail[@data-artname = $data-artname])">
                   <xsl:element name="XMLAttribute">
                       
                       <xsl:attribute name="Self" select="'di2XMLAttributenxml:id'"/>
                       <xsl:attribute name="Name" select="'xml:id'"/>
                       <xsl:attribute name="Value">
                           <xsl:value-of select="'cha-F.'"/>
                           <xsl:variable name="id">
                               <xsl:value-of select="count(preceding::img)"/>
                           </xsl:variable>
                           <xsl:value-of select="concat(substring-before($data-artname,'.'),$id)"/>
                           
                       </xsl:attribute>
                   </xsl:element>
                   <xsl:if test="parent::span[@id='mathjax'][descendant::img/@data-artname]">
                           <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="position" Value="</xsl:text>
                           <xsl:value-of select="'inline'"/>
                           <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                       <!-- bsl -->
                       <xsl:element name="XMLAttribute">
                           <xsl:attribute name="Self" select="'di2XMLAttributenlatex'"/>
                           <xsl:attribute name="Name" select="'latex'"/>
                           <xsl:attribute name="Value">
                               <xsl:value-of select="parent::span[@id='mathjax']/@latex"/>
                           </xsl:attribute>
                       </xsl:element>
                       <xsl:element name="XMLAttribute">
                           <xsl:attribute name="Self" select="'di2XMLAttributendepth'"/>
                           <xsl:attribute name="Name" select="'depth'"/>
                           <xsl:attribute name="Value">
                               <xsl:value-of select="parent::span[@id='mathjax']/@depth"/>
                           </xsl:attribute>
                       </xsl:element>
                       <xsl:element name="XMLAttribute">
                           <xsl:attribute name="Self" select="'di2XMLAttributenheight'"/>
                           <xsl:attribute name="Name" select="'height'"/>
                           <xsl:attribute name="Value">
                               <xsl:value-of select="parent::span[@id='mathjax']/@height"/>
                           </xsl:attribute>
                       </xsl:element>
                       <xsl:element name="XMLAttribute">
                           <xsl:attribute name="Self" select="'di2XMLAttributetotalheight'"/>
                           <xsl:attribute name="Name" select="'totalheight'"/>
                           <xsl:attribute name="Value">
                               <xsl:value-of select="parent::span[@id='mathjax']/@totalheight"/>
                           </xsl:attribute>
                       </xsl:element>
                       <xsl:element name="XMLAttribute">
                           <xsl:attribute name="Self" select="'di2XMLAttributetotalwidth'"/>
                           <xsl:attribute name="Name" select="'width'"/>
                           <xsl:attribute name="Value">
                               <xsl:value-of select="parent::span[@id='mathjax']/@width"/>
                           </xsl:attribute>
                       </xsl:element>
                       <!-- end -->
                   </xsl:if>
               </xsl:if>
               <!-- End -->
               <xsl:if test="$Alttext//artdetail[@data-artname = $data-artname]">
                   <xsl:variable name="type" select="@data-position"/>
                   
                   <xsl:if test="$Alttext//artdetail[@data-artname = $data-artname][@data-position='inline']">
            <XMLElement Self="di2" MarkupTag="XMLTag/links">
                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="linkend" Value="</xsl:text>
                <xsl:value-of select="$data-artname"/>
                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                <!-- Added for inlineref Azure 15087 on 11-06-2024-->
                <xsl:choose>
                    <xsl:when test="$Alttext//artdetail[@data-artname = $data-artname][@data-position='inline']">
                        <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributeninlinehref" Name="inlinehref" Value="</xsl:text>
                        <xsl:value-of select="$Alttext//artdetail[@data-artname = $data-artname]/@data-src"/>
                        <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <!--<xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloathref" Name="floathref" Value="</xsl:text>-->
                        <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloatrecthref" Name="floatrecthref" Value="</xsl:text>
                        <xsl:value-of select="$Alttext//artdetail[@data-artname = $data-artname]/@data-src"/>
                        <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
                <!-- End -->
            </XMLElement> 
                   </xsl:if>
                   <!--<xsl:if test="not($type='inline')">
                       <XMLElement Self="di2" MarkupTag="XMLTag/links">
                           <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="linkend" Value="</xsl:text>
                           <xsl:value-of select="'cha-F.'"/>
                           <xsl:value-of select="substring-before($data-artname,'.')"/>
                           <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                       </XMLElement>
                   </xsl:if>-->
               </xsl:if>
               
        <XMLElement Self="di2" MarkupTag="XMLTag/Image"
            XMLContent="ua4c2">
            <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                Name="aid:pstyle" Value="IMAGE"/>
            
            
            <xsl:if test="$Alttext//artdetail[@data-artname = $data-artname]">
                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                <xsl:value-of select="$Alttext//artdetail[@data-artname = $data-artname]/@data-src"/>
                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
            </xsl:if>
            <!-- cicerone 04-9-2025 -->
            <xsl:if test="not($Alttext//artdetail[@data-artname = $data-artname])">
                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                <xsl:value-of select="concat('/',$data-artname)"/>
                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
            </xsl:if>
            <!-- End -->
            <xsl:variable name="name" select="@data-artname"/>
            <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-artalt"/>
                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
            </xsl:if>
             
        </XMLElement>
        </XMLElement>
</xsl:template>
    <!-- added for math on 03-09-2025 -->
    <!--<xsl:template match="//span[@id='mathjax'][descendant::img[@data-artname and @title][not(parent::figure)]]">
        <xsl:variable name="data-artname" select="descendant::img[@data-artname]/@data-artname"/>
                    <XMLElement Self="di2" MarkupTag="XMLTag/links">
                        <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="linkend" Value="</xsl:text>
                        <xsl:value-of select="'cha-F.'"/>
                        <xsl:variable name="id">
                            <xsl:value-of select="count(preceding::img)"/>
                        </xsl:variable>
                        <xsl:value-of select="concat(substring-before($data-artname,'.'),$id)"/>
                        <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributeninlinehref" Name="inlinehref" Value="</xsl:text>
                        <xsl:value-of select="descendant::img/substring-before(@data-artname,'.')"/>
                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                    </XMLElement>
                    <XMLElement Self="di2" MarkupTag="XMLTag/figure">
                        <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="instruction" Value="inline-float"/&#x3E;</xsl:text>
                        <xsl:element name="XMLAttribute">
                            <xsl:attribute name="Self" select="'di2XMLAttributenxml:id'"/>
                            <xsl:attribute name="Name" select="'xml:id'"/>
                            <xsl:attribute name="Value">
                                <xsl:value-of select="'cha-F.'"/>
                                <xsl:variable name="id">
                                    <xsl:value-of select="count(preceding::img)"/>
                                </xsl:variable>
                                <xsl:value-of select="concat(substring-before($data-artname,'.'),$id)"/>  
                            </xsl:attribute>
                        </xsl:element>
                            <!-\- bsl -\->
                            <xsl:element name="XMLAttribute">
                                <xsl:attribute name="Self" select="'di2XMLAttributendepth'"/>
                                <xsl:attribute name="Name" select="'depth'"/>
                                <xsl:attribute name="Value">
                                    <xsl:value-of select="self::span[@id='mathjax']/@depth"/>
                                </xsl:attribute>
                            </xsl:element>
                                <xsl:element name="XMLAttribute">
                                    <xsl:attribute name="Self" select="'di2XMLAttributenheight'"/>
                                    <xsl:attribute name="Name" select="'height'"/>
                                    <xsl:attribute name="Value">
                                        <xsl:value-of select="self::span[@id='mathjax']/@height"/>
                                    </xsl:attribute>
                                </xsl:element>
                                    <xsl:element name="XMLAttribute">
                                        <xsl:attribute name="Self" select="'di2XMLAttributetotalheight'"/>
                                        <xsl:attribute name="Name" select="'totalheight'"/>
                                        <xsl:attribute name="Value">
                                            <xsl:value-of select="self::span[@id='mathjax']/@totalheight"/>
                                        </xsl:attribute>
                                    </xsl:element>
                                        <xsl:element name="XMLAttribute">
                                            <xsl:attribute name="Self" select="'di2XMLAttributetotalwidth'"/>
                                            <xsl:attribute name="Name" select="'width'"/>
                                            <xsl:attribute name="Value">
                                                <xsl:value-of select="self::span[@id='mathjax']/@width"/>
                                            </xsl:attribute>
                                        </xsl:element>
                            <!-\- end -\->
                            
                       
                    <XMLElement Self="di2" MarkupTag="XMLTag/links">
                        <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="linkend" Value="</xsl:text>
                        <xsl:value-of select="$data-artname"/>
                        <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                        <!-\- Added for inlineref Azure 15087 on 11-06-2024-\->
                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributeninlinehref" Name="inlinehref" Value="</xsl:text>
                        <xsl:value-of select="descendant::img/substring-before(@data-artname,'.')"/>
                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                        <!-\- End -\->
                    </XMLElement> 
            <XMLElement Self="di2" MarkupTag="XMLTag/Image"
                XMLContent="ua4c2">
                <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                    Name="aid:pstyle" Value="IMAGE"/>
                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                <xsl:value-of select="descendant::img/@data-artname"/>
                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
            </XMLElement>
        </XMLElement>
    </xsl:template>-->
    <!-- end -->
    <!-- cicerone 06-03-2025 -->
    <xsl:template match="figure[@data-alias][not($Alttext//artdetail/@data-artname = child::img/@data-artname)]//img[@data-artname]">
        
        <xsl:variable name="data-artname" select="@data-artname"/>
        
        
       
            <xsl:variable name="data-artname" select="self::img[@data-artname][parent::figure]/@data-artname"/>
            
            
                
                <xsl:variable name="type" select="@data-position"/>
                      <!--<XMLElement Self="di2" MarkupTag="XMLTag/links">
                        <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="linkend" Value="</xsl:text>
                        <xsl:value-of select="'cha-F.'"/>
                        <xsl:variable name="id">
                            <xsl:value-of select="count(preceding::img)"/>
                        </xsl:variable>
                        <xsl:value-of select="concat(substring-before($data-artname,'.'),$id)"/>
                        <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                        <!-\- Added for inlineref Azure 15087 on 11-06-2024-\->
                        <xsl:choose>
                            <xsl:when test="$Alttext//artdetail[@data-artname = $data-artname][@data-position='inline']">
                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributeninlinehref" Name="inlinehref" Value="</xsl:text>
                                <xsl:value-of select="$Alttext//artdetail[@data-artname = $data-artname]/@data-src"/>
                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                               
                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloatrecthref" Name="floatrecthref" Value="</xsl:text>
                                <xsl:value-of select="$data-artname"/>
                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                        <!-\- End -\->
                    </XMLElement>-->
                    <XMLElement Self="di2" MarkupTag="XMLTag/figure">
                       <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="instruction" Value="inline-float"/&#x3E;</xsl:text>
                        <xsl:element name="XMLAttribute">
                            
                            <xsl:attribute name="Self" select="'di2XMLAttributenxml:id'"/>
                            <xsl:attribute name="Name" select="'xml:id'"/>
                            <xsl:attribute name="Value">
                                <xsl:value-of select="'cha-F.'"/>
                                <xsl:variable name="id">
                                    <xsl:value-of select="count(preceding::img)"/>
                                </xsl:variable>
                                <xsl:value-of select="concat(substring-before($data-artname,'.'),$id)"/>
                                
                            </xsl:attribute>
                        </xsl:element>            
            <XMLElement Self="di2" MarkupTag="XMLTag/Image"
                XMLContent="ua4c2">
                <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                    Name="aid:pstyle" Value="FIGURE"/>
                
                
               
                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                    <xsl:value-of select="concat('/',$data-artname)"/>
                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
            </XMLElement>
        </XMLElement>
    </xsl:template>
    <!-- End -->
    <!--Place-Holders created on 16.08.2017-->
    <xsl:template
        match="p[@data-name = 'Photo-Place-Holder']|p[@data-name = 'Photo_Place_Holder'] | p[@data-name = 'Table-Place-Holder'] | p[@data-name = 'Table_Place_Holder'] | p[@data-name = 'Map-Place-Holder']|p[@data-name = 'Map_Place_Holder'] | p[@data-name = 'Figure-Place-Holder'] | p[@data-name = 'Figure_Place_Holder'] | p[@data-name = 'Box-Place-Holder'] | p[@data-name = 'Box_Place_Holder'] | p[@data-name = 'Image-Place-Holder']|p[@data-name = 'Image_Place_Holder'] | p[@data-name = 'Video-Place-Holder'] |p[@data-name = 'Video_Place_Holder']| p[@data-name = 'Example-Place-Holder']|p[@data-name = 'Example_Place_Holder']|p[@data-name = 'UnFig_Place_Holder']">

        <xsl:variable name="paragraphStyle" select="@data-name"/>
        <!--Updated {Mahesh} p/@data-name to @data-name 27.12.2017-->
        <xsl:variable name="qqq" select="$paragraphStyle"/>
        <xsl:variable name="al" select="document('Artlog.xml')"/>

        <!--update for PMI text Retain 20-6-2018-->
        <!--<xsl:text disable-output-escaping="yes">&#x3C;ParagraphStyleRange AppliedParagraphStyle="ParagraphStyle/</xsl:text>
        <xsl:choose>
            <xsl:when test="contains($qqq, ':')">
                <xsl:value-of select="replace($qqq, ':', '\\%3a')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$qqq"/>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:text disable-output-escaping="yes">"&#x3E;</xsl:text>
        
        
        <xsl:text disable-output-escaping="yes">&#x3C;XMLElement Self="di2" MarkupTag="XMLTag/PMI"&#x3E;</xsl:text>
        <xsl:apply-templates/>
        <xsl:text disable-output-escaping="yes">&#x3C;/XMLElement&#x3E;</xsl:text>
        <CharacterStyleRange AppliedCharacterStyle="CharacterStyle/$ID/[No character style]">
            <xsl:text disable-output-escaping="yes">&#x3C;Br/&#x3E;</xsl:text>
        </CharacterStyleRange>
        <xsl:text disable-output-escaping="yes">&#x3C;/ParagraphStyleRange&#x3E;</xsl:text>-->
        <!--update end for PMI text Retain-->
        <xsl:text disable-output-escaping="yes">&#x3C;XMLElement Self="di2" MarkupTag="XMLTag/</xsl:text>
        <xsl:choose>
            <xsl:when test="contains($qqq, ':')">
                <xsl:value-of select="replace($qqq, ':', '\\%3a')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$qqq"/>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:text disable-output-escaping="yes">"&#x3E;</xsl:text>
        <xsl:text disable-output-escaping="yes">&#x3C;ParagraphStyleRange AppliedParagraphStyle="ParagraphStyle/</xsl:text>
        <xsl:choose>
            <xsl:when test="contains($qqq, ':')">
                <xsl:value-of select="replace($qqq, ':', '\\%3a')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$qqq"/>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:text disable-output-escaping="yes">"&#x3E;</xsl:text>


        <!--Figure Name Match With Artlog 3-12-2018-->

        <!--<xsl:if test="self::p[@data-name='Place-Holder'] | self::p[@data-name='Photo-Place-Holder'] | self::p[@data-name='Photo'] | self::p[@data-name='Map-Place-Holder']">
            
             <xsl:variable name="dName" select="@data-name"/>
            <xsl:variable name="img" select="."/>
            <XMLElement Self="di2" MarkupTag="XMLTag/figure">
                <XMLElement Self="di2" MarkupTag="XMLTag/links">
                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="linkend" Value="</xsl:text>
                    <xsl:variable name="FPM"
                        select="$img"/>
                    <xsl:value-of select="$FPM"/>
                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                </XMLElement>
            
            <xsl:variable name="FPM" select="$img"/>
                
                <xsl:variable name="artlogVal" select="$al/Chapter/art[contains(@path,$FPM)][1]/@path"/>
                              
                <xsl:choose>
                    <xsl:when test="string-length($artlogVal) > 0">
                        
                        <XMLElement Self="di2" MarkupTag="XMLTag/Image"
                            XMLContent="ua4c2">
                            <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                Name="aid:pstyle"/>
                            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                            <xsl:value-of select="$artlogVal"/>
                            <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                        </XMLElement>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:element name="CharacterStyleRange">
                            <xsl:attribute name="AppliedCharacterStyle">
                                <xsl:value-of select="'CharacterStyle/'"/>
                                <xsl:choose>
                                    <xsl:when test="$dName">
                                        <xsl:value-of select="$dName"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="'$ID/[No character style]'"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:attribute>
                            <xsl:element name="Content">
                            <xsl:value-of select="."/>
                            </xsl:element>
                        </xsl:element>
                    </xsl:otherwise>
                </xsl:choose>
                </XMLElement>
        </xsl:if>-->
        <!--End-->

        <xsl:if test="descendant::span[@data-name = 'ExamplePMI']">
            <xsl:variable name="img">
                <xsl:for-each select="descendant::span[@data-name = 'ExamplePMI']">
                    <xsl:value-of select="."/>
                </xsl:for-each>
            </xsl:variable>
            <XMLElement Self="di2i3e1i3d5i3d4" MarkupTag="XMLTag/links">
                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="linkend" Value="</xsl:text>
                <xsl:value-of select="'cha-'"/>
                <xsl:value-of select="'E'"/>
                <xsl:value-of select="'-'"/>
                <xsl:value-of
                    select="replace(replace(substring-after($img, ' '), '_', '.'), '-', '.')"/>
                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                <!-- Added for inlineref Azure 15087 on 11-06-2024-->
                <xsl:variable name="name" select="self::*//img[@data-artname]/@data-artname"/>
                <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                    <xsl:choose>
                        <xsl:when test="$Alttext//artdetail[@data-artname = $name][@data-position='inline']">
                            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributeninlinehref" Name="inlinehref" Value="</xsl:text>
                            <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-src"/>
                            <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <!--<xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloathref" Name="floathref" Value="</xsl:text>-->
                            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloatrecthref" Name="floatrecthref" Value="</xsl:text>
                            <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-src"/>
                            <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:if>
                <!-- End -->
            </XMLElement>
        </xsl:if>
        <xsl:if test="descendant::span[@data-name = 'BoxPMI']">
            <xsl:variable name="img">
                <xsl:for-each select="descendant::span[@data-name = 'BoxPMI']">
                    <xsl:value-of select="."/>
                </xsl:for-each>
            </xsl:variable>
            <XMLElement Self="di2i3e1i3d5i3d4" MarkupTag="XMLTag/links">
                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="linkend" Value="</xsl:text>
                <xsl:value-of select="'cha-'"/>
                <xsl:value-of select="'B'"/>
                <xsl:value-of select="'-'"/>
                <xsl:value-of
                    select="replace(replace(substring-after($img, ' '), '_', '.'), '-', '.')"/>
                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                <!-- Added for inlineref Azure 15087 on 11-06-2024-->
                <xsl:variable name="name" select="self::*//img[@data-artname]/@data-artname"/>
                <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                    <xsl:choose>
                        <xsl:when test="$Alttext//artdetail[@data-artname = $name][@data-position='inline']">
                            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributeninlinehref" Name="inlinehref" Value="</xsl:text>
                            <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-src"/>
                            <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <!--<xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloathref" Name="floathref" Value="</xsl:text>-->
                            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloatrecthref" Name="floatrecthref" Value="</xsl:text>
                            <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-src"/>
                            <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:if>
                <!-- End -->
            </XMLElement>
        </xsl:if>
        <xsl:if test="descendant::span[@data-name = 'TablePMI']">
            <xsl:variable name="img">
                <xsl:for-each select="descendant::span[@data-name = 'TablePMI']">
                    <xsl:value-of select="."/>
                </xsl:for-each>
            </xsl:variable>

            <XMLElement Self="di2i3e1i3d5i3d4" MarkupTag="XMLTag/links">
                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="linkend" Value="</xsl:text>
                <xsl:value-of select="'cha-'"/>
                <xsl:value-of select="'T'"/>
                <!--<xsl:value-of select="'-'"/>-->
                <xsl:value-of select="'.'"/>
                <xsl:value-of
                    select="replace(replace(substring-after($img, ' '), '_', '.'), '-', '.')"/>
                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
            </XMLElement>
        </xsl:if>
        <xsl:if test="descendant::span[@data-name = 'ImageName']">
            <xsl:variable name="img">
                <xsl:for-each select="descendant::span[@data-name = 'ImageName']">
                    <xsl:value-of select="."/>
                </xsl:for-each>
            </xsl:variable>
            <xsl:for-each select="$al/Chapter/art">
                <xsl:variable name="main"
                    select="replace(replace(translate(./@artnum, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '-', '.'), '_', '.')"/>
                <xsl:variable name="sub"
                    select="replace(replace(translate(concat(./@artnum, ./subart/@partnum), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '-', '.'), '_', '.')"/>
                <xsl:variable name="artname1" select="./@name"/>
                <xsl:variable name="artname"
                    select="replace(replace($artname1, '_', '.'), '-', '.')"/>
                <xsl:variable name="img1" select="replace(replace($img, '_', '.'), '-', '.')"/>
                <xsl:choose>
                    <xsl:when test="./@type = 'Image'">
                        <xsl:choose>
                            <xsl:when test="$artname eq $img1">
                                <XMLElement Self="di2" MarkupTag="XMLTag/figure">
                                    <XMLElement Self="di2" MarkupTag="XMLTag/links">
                                        <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="linkend" Value="</xsl:text>
                                        <xsl:value-of select="'cha-'"/>
                                        <xsl:value-of select="'I'"/>
                                        <xsl:value-of select="'-'"/>
                                        <xsl:value-of select="$main"/>
                                        <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        <!-- Added for inlineref Azure 15087 on 11-06-2024-->
                                        <xsl:variable name="name" select="self::*//img[@data-artname]/@data-artname"/>
                                        <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                            <xsl:choose>
                                                <xsl:when test="$Alttext//artdetail[@data-artname = $name][@data-position='inline']">
                                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributeninlinehref" Name="inlinehref" Value="</xsl:text>
                                                    <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-src"/>
                                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <!--<xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloathref" Name="floathref" Value="</xsl:text>-->
                                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloatrecthref" Name="floatrecthref" Value="</xsl:text>
                                                    <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-src"/>
                                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:if>
                                        <!-- End -->
                                    </XMLElement>
                                    <XMLElement Self="di2" MarkupTag="XMLTag/Image"
                                        XMLContent="ua4c2">
                                        <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                            Name="aid:pstyle" Value="IMAGENAMEPMI"/>
                                        <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                        <xsl:value-of select="@path"/>
                                        <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        <!--Added for Alt test value for marriapan 16-06-2020-->
                                        <xsl:variable name="name" select="@name"/>
                                        <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                            <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-artalt"/>
                                            <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        </xsl:if>
                                        <!--End-->
                                    </XMLElement>
                                </XMLElement>
                            </xsl:when>
                            <xsl:otherwise> </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
        </xsl:if>
        <xsl:if test="descendant::span[@data-name = 'ImagePMI']">
            <xsl:variable name="img">
                <xsl:for-each select="descendant::span[@data-name = 'ImagePMI']">
                    <xsl:value-of select="."/>
                </xsl:for-each>
            </xsl:variable>
            <XMLElement Self="di2" MarkupTag="XMLTag/figure">
                <XMLElement Self="di2" MarkupTag="XMLTag/links">
                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="linkend" Value="</xsl:text>
                    <xsl:value-of select="'cha-'"/>
                    <xsl:value-of select="'I'"/>
                    <xsl:value-of select="'-'"/>
                    <xsl:variable name="FPM"
                        select="replace(replace(substring-after($img, ' '), '_', '.'), '-', '.')"/>
                    <xsl:value-of select="$FPM"/>
                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                    <!-- Added for inlineref Azure 15087 on 11-06-2024-->
                    <xsl:variable name="name" select="self::*//img[@data-artname]/@data-artname"/>
                    <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                        <xsl:choose>
                            <xsl:when test="$Alttext//artdetail[@data-artname = $name][@data-position='inline']">
                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributeninlinehref" Name="inlinehref" Value="</xsl:text>
                                <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-src"/>
                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <!--<xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloathref" Name="floathref" Value="</xsl:text>-->
                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloatrecthref" Name="floatrecthref" Value="</xsl:text>
                                <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-src"/>
                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:if>
                    <!-- End -->
                </XMLElement>
                <xsl:variable name="FPM"
                    select="replace(replace(substring-after($img, ' '), '_', '.'), '-', '.')"/>
                <xsl:for-each select="$al/Chapter/art">
                    <xsl:variable name="main"
                        select="replace(replace(translate(./@artnum, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '-', '.'), '_', '.')"/>
                    <xsl:variable name="sub"
                        select="replace(replace(translate(concat(./@artnum, ./subart/@partnum), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '-', '.'), '_', '.')"/>
                    <xsl:choose>
                        <xsl:when test="./@type = 'Image'">
                            <xsl:choose>
                                <xsl:when test="$main eq $FPM">
                                    <XMLElement Self="di2" MarkupTag="XMLTag/Image"
                                        XMLContent="ua4c2">
                                        <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                            Name="aid:pstyle" Value="IMAGEPMI"/>
                                        <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                        <xsl:value-of select="@path"/>
                                        <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        <!--Added for Alt test value for marriapan 16-06-2020-->
                                        <xsl:variable name="name" select="@name"/>
                                        <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                            <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-artalt"/>
                                            <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        </xsl:if>
                                        <!--End-->
                                    </XMLElement>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:choose>
                                        <xsl:when test="$main != $FPM and $sub eq $FPM">
                                            <XMLElement Self="di2" MarkupTag="XMLTag/Image"
                                                XMLContent="ua4c2">
                                                <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                                  Name="aid:pstyle" Value="IMAGEPMI"/>
                                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                                <xsl:value-of select="@path"/>
                                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                                <!--Added for Alt test value for marriapan 16-06-2020-->
                                                <xsl:variable name="name" select="@name"/>
                                                <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                                    <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-artalt"/>
                                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                                </xsl:if>
                                                <!--End-->
                                            </XMLElement>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
            </XMLElement>
        </xsl:if>
        <xsl:if test="descendant::span[@data-name = 'COPMI']">
            <!-- COPMI Condition Added{05.02.2017}-->
            <xsl:variable name="img">
                <xsl:for-each select="descendant::span[@data-name = 'COPMI']">
                    <xsl:value-of select="."/>
                </xsl:for-each>
            </xsl:variable>
            <XMLElement Self="di2" MarkupTag="XMLTag/figure">
                <XMLElement Self="di2" MarkupTag="XMLTag/links">
                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="linkend" Value="</xsl:text>
                    <xsl:value-of select="'cha-'"/>
                    <xsl:value-of select="'I'"/>
                    <xsl:value-of select="'-'"/>
                    <xsl:variable name="FPM"
                        select="replace(replace(substring-after($img, ' '), '_', '.'), '-', '.')"/>
                    <xsl:value-of select="$FPM"/>
                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                    <!-- Added for inlineref Azure 15087 on 11-06-2024-->
                    <xsl:variable name="name" select="self::*//img[@data-artname]/@data-artname"/>
                    <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                        <xsl:choose>
                            <xsl:when test="$Alttext//artdetail[@data-artname = $name][@data-position='inline']">
                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributeninlinehref" Name="inlinehref" Value="</xsl:text>
                                <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-src"/>
                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <!--<xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloathref" Name="floathref" Value="</xsl:text>-->
                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloatrecthref" Name="floatrecthref" Value="</xsl:text>
                                <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-src"/>
                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:if>
                    <!-- End -->
                </XMLElement>
                <xsl:variable name="FPM"
                    select="replace(replace(substring-after($img, ' '), '_', '.'), '-', '.')"/>
                <xsl:for-each select="$al/Chapter/art">
                    <xsl:variable name="main"
                        select="replace(replace(translate(./@artnum, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '-', '.'), '_', '.')"/>
                    <xsl:variable name="sub"
                        select="replace(replace(translate(concat(./@artnum, ./subart/@partnum), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '-', '.'), '_', '.')"/>
                    <xsl:choose>
                        <xsl:when test="./@type = 'Image'">
                            <xsl:choose>
                                <xsl:when test="$main eq $FPM">
                                    <XMLElement Self="di2" MarkupTag="XMLTag/Image"
                                        XMLContent="ua4c2">
                                        <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                            Name="aid:pstyle" Value="COPMI"/>
                                        <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                        <xsl:value-of select="@path"/>
                                        <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        <!--Added for Alt test value for marriapan 16-06-2020-->
                                        <xsl:variable name="name" select="@name"/>
                                        <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                            <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-artalt"/>
                                            <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        </xsl:if>
                                        <!--End-->
                                    </XMLElement>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:choose>
                                        <xsl:when test="$main != $FPM and $sub eq $FPM">
                                            <XMLElement Self="di2" MarkupTag="XMLTag/Image"
                                                XMLContent="ua4c2">
                                                <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                                  Name="aid:pstyle" Value="COPMI"/>
                                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                                <xsl:value-of select="@path"/>
                                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                                <!--Added for Alt test value for marriapan 16-06-2020-->
                                                <xsl:variable name="name" select="@name"/>
                                                <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                                    <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-artalt"/>
                                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                                </xsl:if>
                                                <!--End-->
                                            </XMLElement>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
            </XMLElement>
        </xsl:if>

        <xsl:if test="descendant::span[@data-name = 'PhotoName']">
            <xsl:variable name="img">
                <xsl:for-each select="descendant::span[@data-name = 'PhotoName']">
                    <xsl:value-of select="."/>
                </xsl:for-each>
            </xsl:variable>
            <xsl:for-each select="$al/Chapter/art">
                <xsl:variable name="main"
                    select="replace(replace(translate(./@artnum, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '-', '.'), '_', '.')"/>
                <xsl:variable name="sub"
                    select="replace(replace(translate(concat(./@artnum, ./subart/@partnum), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '-', '.'), '_', '.')"/>
                <xsl:variable name="artname1" select="./@name"/>
                <xsl:variable name="artname"
                    select="replace(replace($artname1, '_', '.'), '-', '.')"/>
                <xsl:variable name="img1" select="replace(replace($img, '_', '.'), '-', '.')"/>
                <xsl:choose>
                    <xsl:when test="./@type = 'Photo'">
                        <xsl:choose>
                            <xsl:when test="$artname eq $img1">
                                <XMLElement Self="di2" MarkupTag="XMLTag/figure">
                                    <XMLElement Self="di2" MarkupTag="XMLTag/links">
                                        <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="linkend" Value="</xsl:text>
                                        <xsl:value-of select="'cha-'"/>
                                        <xsl:value-of select="'P'"/>
                                        <xsl:value-of select="'-'"/>
                                        <xsl:value-of select="$main"/>
                                        <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        <!-- Added for inlineref Azure 15087 on 11-06-2024-->
                                        <xsl:variable name="name" select="self::*//img[@data-artname]/@data-artname"/>
                                        <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                            <xsl:choose>
                                                <xsl:when test="$Alttext//artdetail[@data-artname = $name][@data-position='inline']">
                                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributeninlinehref" Name="inlinehref" Value="</xsl:text>
                                                    <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-src"/>
                                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <!--<xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloathref" Name="floathref" Value="</xsl:text>-->
                                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloatrecthref" Name="floatrecthref" Value="</xsl:text>
                                                    <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-src"/>
                                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:if>
                                        <!-- End -->
                                    </XMLElement>
                                    <XMLElement Self="di2" MarkupTag="XMLTag/Image"
                                        XMLContent="ua4c2">
                                        <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                            Name="aid:pstyle" Value="PHOTONAMEPMI"/>
                                        <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                        <xsl:value-of select="@path"/>
                                        <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        <!--Added for Alt test value for marriapan 16-06-2020-->
                                        <xsl:variable name="name" select="@name"/>
                                        <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                            <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-artalt"/>
                                            <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        </xsl:if>
                                        <!--End-->
                                    </XMLElement>
                                </XMLElement>
                            </xsl:when>
                            <xsl:otherwise> </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
        </xsl:if>
        <xsl:if test="descendant::span[@data-name = 'PhotoPMI']">

            <xsl:variable name="img">
                <xsl:for-each select="descendant::span[@data-name = 'PhotoPMI']">
                    <xsl:value-of select="."/>
                </xsl:for-each>
            </xsl:variable>

            <XMLElement Self="di2" MarkupTag="XMLTag/figure">
                <XMLElement Self="di2" MarkupTag="XMLTag/links">
                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="linkend" Value="</xsl:text>
                    <xsl:value-of select="'cha-'"/>
                    <xsl:value-of select="'P'"/>
                    <xsl:value-of select="'-'"/>
                    <xsl:variable name="FPM"
                        select="replace(replace(substring-after($img, ' '), '_', '.'), '-', '.')"/>
                    <xsl:value-of select="$FPM"/>
                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                    <!-- Added for inlineref Azure 15087 on 11-06-2024-->
                    <xsl:variable name="name" select="self::*//img[@data-artname]/@data-artname"/>
                    <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                        <xsl:choose>
                            <xsl:when test="$Alttext//artdetail[@data-artname = $name][@data-position='inline']">
                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributeninlinehref" Name="inlinehref" Value="</xsl:text>
                                <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-src"/>
                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <!--<xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloathref" Name="floathref" Value="</xsl:text>-->
                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloatrecthref" Name="floatrecthref" Value="</xsl:text>
                                <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-src"/>
                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:if>
                    <!-- End -->
                </XMLElement>
                <xsl:variable name="FPM"
                    select="replace(replace(substring-after($img, ' '), '_', '.'), '-', '.')"/>

                <xsl:for-each select="$al/Chapter/art">
                    <xsl:variable name="main"
                        select="replace(replace(translate(./@artnum, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '-', '.'), '_', '.')"/>

                    <xsl:variable name="sub"
                        select="replace(replace(translate(concat(./@artnum, ./subart/@partnum), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '-', '.'), '_', '.')"/>

                    <xsl:choose>
                        <xsl:when test="./@type = 'Photo'">

                            <xsl:choose>
                                <xsl:when test="$main eq $FPM">

                                    <XMLElement Self="di2" MarkupTag="XMLTag/Image"
                                        XMLContent="ua4c2">
                                        <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                            Name="aid:pstyle" Value="PHOTOPMI"/>
                                        <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                        <xsl:value-of select="@path"/>
                                        <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        <!--Added for Alt test value for marriapan 16-06-2020-->
                                        <xsl:variable name="name" select="@name"/>
                                        <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                            <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-artalt"/>
                                            <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        </xsl:if>
                                        <!--End-->
                                    </XMLElement>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:choose>
                                        <xsl:when test="$main != $FPM and $sub eq $FPM">
                                            <XMLElement Self="di2" MarkupTag="XMLTag/Image"
                                                XMLContent="ua4c2">
                                                <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                                  Name="aid:pstyle" Value="PHOTOPMI"/>
                                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                                <xsl:value-of select="@path"/>
                                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                                <!--Added for Alt test value for marriapan 16-06-2020-->
                                                <xsl:variable name="name" select="@name"/>
                                                <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                                    <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-artalt"/>
                                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                                </xsl:if>
                                                <!--End-->
                                            </XMLElement>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
            </XMLElement>
        </xsl:if>
        <xsl:if
            test="descendant::span[@data-name = 'COPMI'] and span[@data-name = 'Photo-Place-Holder'] or span[@data-name = 'Photo_Place_Holder']">
            <xsl:variable name="img">
                <xsl:for-each select="descendant::span[@data-name = 'COPMI']">
                    <xsl:value-of select="."/>
                </xsl:for-each>
            </xsl:variable>
            <XMLElement Self="di2" MarkupTag="XMLTag/figure">
                <XMLElement Self="di2" MarkupTag="XMLTag/links">
                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="linkend" Value="</xsl:text>
                    <xsl:value-of select="'cha-'"/>
                    <xsl:value-of select="'P'"/>
                    <xsl:value-of select="'-'"/>
                    <xsl:variable name="FPM"
                        select="replace(replace(substring-after($img, ' '), '_', '.'), '-', '.')"/>
                    <xsl:value-of select="$FPM"/>
                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                    <!-- Added for inlineref Azure 15087 on 11-06-2024-->
                    <xsl:variable name="name" select="self::*//img[@data-artname]/@data-artname"/>
                    <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                        <xsl:choose>
                            <xsl:when test="$Alttext//artdetail[@data-artname = $name][@data-position='inline']">
                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributeninlinehref" Name="inlinehref" Value="</xsl:text>
                                <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-src"/>
                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <!--<xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloathref" Name="floathref" Value="</xsl:text>-->
                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloatrecthref" Name="floatrecthref" Value="</xsl:text>
                                <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-src"/>
                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:if>
                    <!-- End -->
                </XMLElement>
                <xsl:variable name="FPM"
                    select="replace(replace(substring-after($img, ' '), '_', '.'), '-', '.')"/>
                <xsl:for-each select="$al/Chapter/art">
                    <xsl:variable name="main"
                        select="replace(replace(translate(./@artnum, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '-', '.'), '_', '.')"/>
                    <xsl:variable name="sub"
                        select="replace(replace(translate(concat(./@artnum, ./subart/@partnum), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '-', '.'), '_', '.')"/>
                    <xsl:choose>
                        <xsl:when test="./@type = 'Photo'">
                            <xsl:choose>
                                <xsl:when test="$main eq $FPM">
                                    <XMLElement Self="di2" MarkupTag="XMLTag/Image"
                                        XMLContent="ua4c2">
                                        <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                            Name="aid:pstyle" Value="COPMI"/>
                                        <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                        <xsl:value-of select="@path"/>
                                        <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        <!--Added for Alt test value for marriapan 16-06-2020-->
                                        <xsl:variable name="name" select="@name"/>
                                        <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                            <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-artalt"/>
                                            <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        </xsl:if>
                                        <!--End-->
                                    </XMLElement>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:choose>
                                        <xsl:when test="$main != $FPM and $sub eq $FPM">
                                            <XMLElement Self="di2" MarkupTag="XMLTag/Image"
                                                XMLContent="ua4c2">
                                                <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                                  Name="aid:pstyle" Value="COPMI"/>
                                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                                <xsl:value-of select="@path"/>
                                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                                <!--Added for Alt test value for marriapan 16-06-2020-->
                                                <xsl:variable name="name" select="@name"/>
                                                <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                                    <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-artalt"/>
                                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                                </xsl:if>
                                                <!--End-->
                                            </XMLElement>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
            </XMLElement>
        </xsl:if>
        <xsl:if test="descendant::span[@data-name = 'VideoName']">
            <xsl:variable name="img">
                <xsl:for-each select="descendant::span[@data-name = 'VideoName']">
                    <xsl:value-of select="."/>
                </xsl:for-each>
            </xsl:variable>
            <xsl:for-each select="$al/Chapter/art">
                <xsl:variable name="main"
                    select="replace(replace(translate(./@artnum, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '-', '.'), '_', '.')"/>
                <xsl:variable name="sub"
                    select="replace(replace(translate(concat(./@artnum, ./subart/@partnum), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '-', '.'), '_', '.')"/>
                <xsl:variable name="artname1" select="./@name"/>
                <xsl:variable name="artname"
                    select="replace(replace($artname1, '_', '.'), '-', '.')"/>
                <xsl:variable name="img1" select="replace(replace($img, '_', '.'), '-', '.')"/>
                <xsl:choose>
                    <xsl:when test="./@type = 'Video'">
                        <xsl:choose>
                            <xsl:when test="$artname eq $img1">
                                <XMLElement Self="di2" MarkupTag="XMLTag/figure">
                                    <XMLElement Self="di2" MarkupTag="XMLTag/links">
                                        <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="linkend" Value="</xsl:text>
                                        <xsl:value-of select="'cha-'"/>
                                        <xsl:value-of select="'V'"/>
                                        <xsl:value-of select="'-'"/>
                                        <xsl:value-of select="$main"/>
                                        <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        <!-- Added for inlineref Azure 15087 on 11-06-2024-->
                                        <xsl:variable name="name" select="self::*//img[@data-artname]/@data-artname"/>
                                        <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                            <xsl:choose>
                                                <xsl:when test="$Alttext//artdetail[@data-artname = $name][@data-position='inline']">
                                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributeninlinehref" Name="inlinehref" Value="</xsl:text>
                                                    <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-src"/>
                                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <!--<xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloathref" Name="floathref" Value="</xsl:text>-->
                                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloatrecthref" Name="floatrecthref" Value="</xsl:text>
                                                    <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-src"/>
                                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:if>
                                        <!-- End -->
                                    </XMLElement>
                                    <XMLElement Self="di2" MarkupTag="XMLTag/Image"
                                        XMLContent="ua4c2">
                                        <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                            Name="aid:pstyle" Value="VIDEONAMEPMI"/>
                                        <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                        <xsl:value-of select="@path"/>
                                        <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        <!--Added for Alt test value for marriapan 16-06-2020-->
                                        <xsl:variable name="name" select="@name"/>
                                        <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                            <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-artalt"/>
                                            <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        </xsl:if>
                                        <!--End-->
                                    </XMLElement>
                                </XMLElement>
                            </xsl:when>
                            <xsl:otherwise> </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
        </xsl:if>
        <xsl:if test="descendant::span[@data-name = 'VideoPMI']">
            <xsl:variable name="img">
                <xsl:for-each select="descendant::span[@data-name = 'VideoPMI']">
                    <xsl:value-of select="."/>
                </xsl:for-each>
            </xsl:variable>
            <XMLElement Self="di2" MarkupTag="XMLTag/figure">
                <XMLElement Self="di2" MarkupTag="XMLTag/links">
                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="linkend" Value="</xsl:text>
                    <xsl:value-of select="'cha-'"/>
                    <xsl:value-of select="'V'"/>
                    <xsl:value-of select="'-'"/>
                    <xsl:variable name="FPM"
                        select="replace(replace(substring-after($img, ' '), '_', '.'), '-', '.')"/>
                    <xsl:value-of select="$FPM"/>
                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                    <!-- Added for inlineref Azure 15087 on 11-06-2024-->
                    <xsl:variable name="name" select="self::*//img[@data-artname]/@data-artname"/>
                    <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                        <xsl:choose>
                            <xsl:when test="$Alttext//artdetail[@data-artname = $name][@data-position='inline']">
                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributeninlinehref" Name="inlinehref" Value="</xsl:text>
                                <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-src"/>
                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <!--<xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloathref" Name="floathref" Value="</xsl:text>-->
                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloatrecthref" Name="floatrecthref" Value="</xsl:text>
                                <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-src"/>
                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:if>
                    <!-- End -->
                </XMLElement>
                <xsl:variable name="FPM"
                    select="replace(replace(substring-after($img, ' '), '_', '.'), '-', '.')"/>
                <xsl:for-each select="$al/Chapter/art">
                    <xsl:variable name="main"
                        select="replace(replace(translate(./@artnum, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '-', '.'), '_', '.')"/>
                    <xsl:variable name="sub"
                        select="replace(replace(translate(concat(./@artnum, ./subart/@partnum), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '-', '.'), '_', '.')"/>
                    <xsl:choose>
                        <xsl:when test="./@type = 'Video'">
                            <xsl:choose>
                                <xsl:when test="$main eq $FPM">
                                    <XMLElement Self="di2" MarkupTag="XMLTag/Image"
                                        XMLContent="ua4c2">
                                        <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                            Name="aid:pstyle" Value="VIDEOPMI"/>
                                        <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                        <xsl:value-of select="@path"/>
                                        <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        <!--Added for Alt test value for marriapan 16-06-2020-->
                                        <xsl:variable name="name" select="@name"/>
                                        <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                            <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-artalt"/>
                                            <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        </xsl:if>
                                        <!--End-->
                                    </XMLElement>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:choose>
                                        <xsl:when test="$main != $FPM and $sub eq $FPM">
                                            <XMLElement Self="di2" MarkupTag="XMLTag/Image"
                                                XMLContent="ua4c2">
                                                <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                                  Name="aid:pstyle" Value="VIDEOPMI"/>
                                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                                <xsl:value-of select="@path"/>
                                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                                <!--Added for Alt test value for marriapan 16-06-2020-->
                                                <xsl:variable name="name" select="@name"/>
                                                <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                                    <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-artalt"/>
                                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                                </xsl:if>
                                                <!--End-->
                                            </XMLElement>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
            </XMLElement>
        </xsl:if>
        <xsl:if
            test="descendant::span[@data-name = 'COPMI'] and p[@data-name = 'Video-Place-Holder'] or p[@data-name = 'Video_Place_Holder']">
            <xsl:variable name="img">
                <xsl:for-each select="descendant::span[@data-name = 'COPMI']">
                    <xsl:value-of select="."/>
                </xsl:for-each>
            </xsl:variable>
            <XMLElement Self="di2" MarkupTag="XMLTag/figure">
                <XMLElement Self="di2" MarkupTag="XMLTag/links">
                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="linkend" Value="</xsl:text>
                    <xsl:value-of select="'cha-'"/>
                    <xsl:value-of select="'V'"/>
                    <xsl:value-of select="'-'"/>
                    <xsl:variable name="FPM"
                        select="replace(replace(substring-after($img, ' '), '_', '.'), '-', '.')"/>
                    <xsl:value-of select="$FPM"/>
                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                    <!-- Added for inlineref Azure 15087 on 11-06-2024-->
                    <xsl:variable name="name" select="self::*//img[@data-artname]/@data-artname"/>
                    <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                        <xsl:choose>
                            <xsl:when test="$Alttext//artdetail[@data-artname = $name][@data-position='inline']">
                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributeninlinehref" Name="inlinehref" Value="</xsl:text>
                                <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-src"/>
                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <!--<xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloathref" Name="floathref" Value="</xsl:text>-->
                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloatrecthref" Name="floatrecthref" Value="</xsl:text>
                                <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-src"/>
                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:if>
                    <!-- End -->
                </XMLElement>
                <xsl:variable name="FPM"
                    select="replace(replace(substring-after($img, ' '), '_', '.'), '-', '.')"/>
                <xsl:for-each select="$al/Chapter/art">
                    <xsl:variable name="main"
                        select="replace(replace(translate(./@artnum, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '-', '.'), '_', '.')"/>
                    <xsl:variable name="sub"
                        select="replace(replace(translate(concat(./@artnum, ./subart/@partnum), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '-', '.'), '_', '.')"/>
                    <xsl:choose>
                        <xsl:when test="./@type = 'Video'">
                            <xsl:choose>
                                <xsl:when test="$main eq $FPM">
                                    <XMLElement Self="di2" MarkupTag="XMLTag/Image"
                                        XMLContent="ua4c2">
                                        <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                            Name="aid:pstyle" Value="COPMI"/>
                                        <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                        <xsl:value-of select="@path"/>
                                        <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        <!--Added for Alt test value for marriapan 16-06-2020-->
                                        <xsl:variable name="name" select="@name"/>
                                        <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                            <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-artalt"/>
                                            <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        </xsl:if>
                                        <!--End-->
                                    </XMLElement>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:choose>
                                        <xsl:when test="$main != $FPM and $sub eq $FPM">
                                            <XMLElement Self="di2" MarkupTag="XMLTag/Image"
                                                XMLContent="ua4c2">
                                                <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                                  Name="aid:pstyle" Value="COPMI"/>
                                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                                <xsl:value-of select="@path"/>
                                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                                <!--Added for Alt test value for marriapan 16-06-2020-->
                                                <xsl:variable name="name" select="@name"/>
                                                <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                                    <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-artalt"/>
                                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                                </xsl:if>
                                                <!--End-->
                                            </XMLElement>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
            </XMLElement>
        </xsl:if>
        <xsl:if test="descendant::span[@data-name = 'FigurePMI']">
            <xsl:variable name="img">
                <xsl:for-each select="descendant::span[@data-name = 'FigurePMI']">
                    <xsl:value-of select="."/>
                </xsl:for-each>
            </xsl:variable>
            <XMLElement Self="di2" MarkupTag="XMLTag/figure">
                <XMLElement Self="di2" MarkupTag="XMLTag/links">
                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="linkend" Value="</xsl:text>
                    <xsl:value-of select="'cha-'"/>
                    <xsl:value-of select="'F'"/>
                    <xsl:value-of select="'.'"/>
                    <xsl:variable name="FPM"
                        select="replace(replace(substring-after($img, ' '), '_', '.'), '-', '.')"/>
                    <xsl:value-of select="$FPM"/>
                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                    <!-- Added for inlineref Azure 15087 on 11-06-2024-->
                    <xsl:variable name="name" select="self::*//img[@data-artname]/@data-artname"/>
                    <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                        <xsl:choose>
                            <xsl:when test="$Alttext//artdetail[@data-artname = $name][@data-position='inline']">
                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributeninlinehref" Name="inlinehref" Value="</xsl:text>
                                <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-src"/>
                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <!--<xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloathref" Name="floathref" Value="</xsl:text>-->
                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloatrecthref" Name="floatrecthref" Value="</xsl:text>
                                <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-src"/>
                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:if>
                    <!-- End -->
                </XMLElement>
                <xsl:variable name="FPM"
                    select="replace(replace(substring-after($img, ' '), '_', '.'), '-', '.')"/>

                <xsl:for-each select="$al/Chapter/art">
                    <xsl:variable name="main"
                        select="replace(replace(translate(./@artnum, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '-', '.'), '_', '.')"/>

                    <xsl:variable name="sub"
                        select="replace(replace(translate(concat(./@artnum, ./subart/@partnum), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '-', '.'), '_', '.')"/>
                    <xsl:choose>
                        <xsl:when test="./@type = 'Figure'">
                            <xsl:choose>
                                <xsl:when test="$main eq $FPM">
                                    <XMLElement Self="di2" MarkupTag="XMLTag/Image"
                                        XMLContent="ua4c2">
                                        <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                            Name="aid:pstyle" Value="FIGUREPMI"/>
                                        <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                        <xsl:value-of select="@path"/>
                                        <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        <!--Added for Alt test value for marriapan 16-06-2020-->
                                        <xsl:variable name="name" select="@name"/>
                                        <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                            <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-artalt"/>
                                            <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        </xsl:if>
                                        <!--End-->
                                    </XMLElement>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:choose>
                                        <xsl:when test="$main != $FPM and $sub eq $FPM">
                                            <XMLElement Self="di2" MarkupTag="XMLTag/Image"
                                                XMLContent="ua4c2">
                                                <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                                  Name="aid:pstyle" Value="FIGUREPMI"/>
                                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                                <xsl:value-of select="@path"/>
                                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                                <!--Added for Alt test value for marriapan 16-06-2020-->
                                                <xsl:variable name="name" select="@name"/>
                                                <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                                    <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-artalt"/>
                                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                                </xsl:if>
                                                <!--End-->
                                            </XMLElement>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
            </XMLElement>
        </xsl:if>
        
        <!--UnFigurePMI 29-07-2020-->
        <xsl:if test="descendant::span[@data-name = 'UnFigurePMI']">
            <xsl:variable name="img">
                <xsl:for-each select="descendant::span[@data-name = 'UnFigurePMI']">
                    <!--<xsl:choose>
                        <xsl:when test="matches(.,'^. ')">
                            <xsl:value-of select="replace(.,'. ','')"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="normalize-space(.)"/>
                        </xsl:otherwise>
                    </xsl:choose>-->
                    <xsl:value-of select="normalize-space(.)"/>
                </xsl:for-each>
            </xsl:variable>
            
            <XMLElement Self="di2" MarkupTag="XMLTag/figure">
                <XMLElement Self="di2" MarkupTag="XMLTag/links">
                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="linkend" Value="</xsl:text>
                    <xsl:value-of select="'cha-'"/>
                    <xsl:value-of select="'UF'"/>
                    <xsl:value-of select="'.'"/>
                    <xsl:variable name="FPM"
                        select="replace(replace(substring-after($img, 'UNFIG'), '_', '.'), '-', '.')"/>
                    <xsl:value-of select="$FPM"/>
                    
                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                    <!-- Added for inlineref Azure 15087 on 11-06-2024-->
                    <xsl:variable name="name" select="self::*//img[@data-artname]/@data-artname"/>
                    <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                        <xsl:choose>
                            <xsl:when test="$Alttext//artdetail[@data-artname = $name][@data-position='inline']">
                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributeninlinehref" Name="inlinehref" Value="</xsl:text>
                                <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-src"/>
                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <!--<xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloathref" Name="floathref" Value="</xsl:text>-->
                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloatrecthref" Name="floatrecthref" Value="</xsl:text>
                                <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-src"/>
                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:if>
                    <!-- End -->
                </XMLElement>
                <xsl:variable name="FPM"
                    select="replace(replace(substring-after($img, ' '), '_', '.'), '-', '.')"/>
                   <xsl:for-each select="$al/Chapter/art">
                    <xsl:variable name="main"
                        select="replace(replace(translate(./@artnum, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '-', '.'), '_', '.')"/>
                    
                    <xsl:variable name="sub"
                        select="replace(replace(translate(concat(./@artnum, ./subart/@partnum), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '-', '.'), '_', '.')"/>
                    <xsl:choose>
                        <xsl:when test="./@type = 'Figure'">
                            <xsl:choose>
                                <xsl:when test="$main eq $FPM">
                                    <XMLElement Self="di2" MarkupTag="XMLTag/Image"
                                        XMLContent="ua4c2">
                                        <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                            Name="aid:pstyle" Value="FIGUREPMI"/>
                                        <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                        <xsl:value-of select="@path"/>
                                        <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        <!--Added for Alt test value for marriapan 16-06-2020-->
                                        <xsl:variable name="name" select="@name"/>
                                        <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                            <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-artalt"/>
                                            <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        </xsl:if>
                                        <!--End-->
                                    </XMLElement>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:choose>
                                        <xsl:when test="$main != $FPM and $sub eq $FPM">
                                            <XMLElement Self="di2" MarkupTag="XMLTag/Image"
                                                XMLContent="ua4c2">
                                                <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                                    Name="aid:pstyle" Value="FIGUREPMI"/>
                                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                                <xsl:value-of select="@path"/>
                                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                                <!--Added for Alt test value for marriapan 16-06-2020-->
                                                <xsl:variable name="name" select="@name"/>
                                                <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                                    <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-artalt"/>
                                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                                </xsl:if>
                                                <!--End-->
                                            </XMLElement>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
            </XMLElement>
        </xsl:if>
        
        <!--End-->
        
        
        <xsl:if
            test="descendant::span[@data-name = 'COPMI'] and p[@data-name = 'Figure-Place-Holder'] or p[@data-name = 'Figure_Place_Holder']">
            <xsl:variable name="img">
                <xsl:for-each select="descendant::span[@data-name = 'COPMI']">
                    <xsl:value-of select="."/>
                </xsl:for-each>
            </xsl:variable>
            <XMLElement Self="di2" MarkupTag="XMLTag/figure">
                <XMLElement Self="di2" MarkupTag="XMLTag/links">
                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="linkend" Value="</xsl:text>
                    <xsl:value-of select="'cha-'"/>
                    <xsl:value-of select="'F'"/>
                    <xsl:value-of select="'-'"/>
                    <xsl:variable name="FPM"
                        select="replace(replace(substring-after($img, ' '), '_', '.'), '-', '.')"/>
                    <xsl:value-of select="$FPM"/>
                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                    <!-- Added for inlineref Azure 15087 on 11-06-2024-->
                    <xsl:variable name="name" select="self::*//img[@data-artname]/@data-artname"/>
                    <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                        <xsl:choose>
                            <xsl:when test="$Alttext//artdetail[@data-artname = $name][@data-position='inline']">
                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributeninlinehref" Name="inlinehref" Value="</xsl:text>
                                <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-src"/>
                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <!--<xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloathref" Name="floathref" Value="</xsl:text>-->
                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloatrecthref" Name="floatrecthref" Value="</xsl:text>
                                <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-src"/>
                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:if>
                    <!-- End -->
                </XMLElement>
                <xsl:variable name="FPM"
                    select="replace(replace(substring-after($img, ' '), '_', '.'), '-', '.')"/>
                <xsl:for-each select="$al/Chapter/art">
                    <xsl:variable name="main"
                        select="replace(replace(translate(./@artnum, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '-', '.'), '_', '.')"/>
                    <xsl:variable name="sub"
                        select="replace(replace(translate(concat(./@artnum, ./subart/@partnum), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '-', '.'), '_', '.')"/>
                    <xsl:choose>
                        <xsl:when test="./@type = 'Figure'">
                            <xsl:choose>
                                <xsl:when test="$main eq $FPM">
                                    <XMLElement Self="di2" MarkupTag="XMLTag/Image"
                                        XMLContent="ua4c2">
                                        <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                            Name="aid:pstyle" Value="COPMI"/>
                                        <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                        <xsl:value-of select="@path"/>
                                        <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        <!--Added for Alt test value for marriapan 16-06-2020-->
                                        <xsl:variable name="name" select="@name"/>
                                        <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                            <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-artalt"/>
                                            <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        </xsl:if>
                                        <!--End-->
                                    </XMLElement>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:choose>
                                        <xsl:when test="$main != $FPM and $sub eq $FPM">
                                            <XMLElement Self="di2" MarkupTag="XMLTag/Image"
                                                XMLContent="ua4c2">
                                                <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                                  Name="aid:pstyle" Value="COPMI"/>
                                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                                <xsl:value-of select="@path"/>
                                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                                <!--Added for Alt test value for marriapan 16-06-2020-->
                                                <xsl:variable name="name" select="@name"/>
                                                <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                                    <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-artalt"/>
                                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                                </xsl:if>
                                                <!--End-->
                                            </XMLElement>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
            </XMLElement>
        </xsl:if>
        <xsl:if test="descendant::span[@data-name = 'FigureName']">
            <xsl:variable name="img">
                <xsl:for-each select="descendant::span[@data-name = 'FigureName']">
                    <xsl:value-of select="."/>
                </xsl:for-each>
            </xsl:variable>
            <xsl:for-each select="$al/Chapter/art">
                <xsl:variable name="main"
                    select="replace(replace(translate(./@artnum, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '-', '.'), '_', '.')"/>
                <xsl:variable name="sub"
                    select="replace(replace(translate(concat(./@artnum, ./subart/@partnum), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '-', '.'), '_', '.')"/>
                <xsl:variable name="artname1" select="./@name"/>
                <xsl:variable name="artname"
                    select="replace(replace($artname1, '_', '.'), '-', '.')"/>
                <xsl:variable name="img1" select="replace(replace($img, '_', '.'), '-', '.')"/>
                <xsl:choose>
                    <xsl:when test="./@type = 'Figure'">
                        <xsl:choose>
                            <xsl:when test="$artname eq $img1">
                                <XMLElement Self="di2" MarkupTag="XMLTag/figure">
                                    <XMLElement Self="di2" MarkupTag="XMLTag/links">
                                        <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="linkend" Value="</xsl:text>
                                        <xsl:value-of select="'cha-'"/>
                                        <xsl:value-of select="'F'"/>
                                        <xsl:value-of select="'-'"/>
                                        <xsl:value-of select="$main"/>
                                        <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        <!-- Added for inlineref Azure 15087 on 11-06-2024-->
                                        <xsl:variable name="name" select="self::*//img[@data-artname]/@data-artname"/>
                                        <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                            <xsl:choose>
                                                <xsl:when test="$Alttext//artdetail[@data-artname = $name][@data-position='inline']">
                                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributeninlinehref" Name="inlinehref" Value="</xsl:text>
                                                    <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-src"/>
                                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <!--<xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloathref" Name="floathref" Value="</xsl:text>-->
                                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloatrecthref" Name="floatrecthref" Value="</xsl:text>
                                                    <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-src"/>
                                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:if>
                                        <!-- End -->
                                    </XMLElement>
                                    <XMLElement Self="di2" MarkupTag="XMLTag/Image"
                                        XMLContent="ua4c2">
                                        <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                            Name="aid:pstyle" Value="FIGURENAMEPMI"/>
                                        <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                        <xsl:value-of select="@path"/>
                                        <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        <!--Added for Alt test value for marriapan 16-06-2020-->
                                        <xsl:variable name="name" select="@name"/>
                                        <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                            <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-artalt"/>
                                            <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        </xsl:if>
                                        <!--End-->
                                    </XMLElement>
                                </XMLElement>
                            </xsl:when>
                            <xsl:otherwise> </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
        </xsl:if>
        <xsl:if test="descendant::span[@data-name = 'MapName']">
            <xsl:variable name="img">
                <xsl:for-each select="descendant::span[@data-name = 'MapName']">
                    <xsl:value-of select="."/>
                </xsl:for-each>
            </xsl:variable>
            <xsl:for-each select="$al/Chapter/art">
                <xsl:variable name="main"
                    select="replace(replace(translate(./@artnum, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '-', '.'), '_', '.')"/>
                <xsl:variable name="sub"
                    select="replace(replace(translate(concat(./@artnum, ./subart/@partnum), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '-', '.'), '_', '.')"/>
                <xsl:variable name="artname1" select="./@name"/>
                <xsl:variable name="artname"
                    select="replace(replace($artname1, '_', '.'), '-', '.')"/>
                <xsl:variable name="img1" select="replace(replace($img, '_', '.'), '-', '.')"/>
                <xsl:choose>
                    <xsl:when test="./@type = 'Map'">
                        <xsl:choose>
                            <xsl:when test="$artname eq $img1">
                                <XMLElement Self="di2" MarkupTag="XMLTag/figure">
                                    <XMLElement Self="di2" MarkupTag="XMLTag/links">
                                        <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="linkend" Value="</xsl:text>
                                        <xsl:value-of select="'cha-'"/>
                                        <xsl:value-of select="'M'"/>
                                        <xsl:value-of select="'-'"/>
                                        <xsl:value-of select="$main"/>
                                        <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        <!-- Added for inlineref Azure 15087 on 11-06-2024-->
                                        <xsl:variable name="name" select="self::*//img[@data-artname]/@data-artname"/>
                                        <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                            <xsl:choose>
                                                <xsl:when test="$Alttext//artdetail[@data-artname = $name][@data-position='inline']">
                                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributeninlinehref" Name="inlinehref" Value="</xsl:text>
                                                    <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-src"/>
                                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <!--<xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloathref" Name="floathref" Value="</xsl:text>-->
                                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloatrecthref" Name="floatrecthref" Value="</xsl:text>
                                                    <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-src"/>
                                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:if>
                                        <!-- End -->
                                    </XMLElement>
                                    <XMLElement Self="di2" MarkupTag="XMLTag/Image"
                                        XMLContent="ua4c2">
                                        <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                            Name="aid:pstyle" Value="MAPNAMEPMI"/>
                                        <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                        <xsl:value-of select="@path"/>
                                        <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        <!--Added for Alt test value for marriapan 16-06-2020-->
                                        <xsl:variable name="name" select="@name"/>
                                        <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                            <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-artalt"/>
                                            <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        </xsl:if>
                                        <!--End-->
                                    </XMLElement>
                                </XMLElement>
                            </xsl:when>
                            <xsl:otherwise> </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
        </xsl:if>
        <xsl:if test="descendant::span[@data-name = 'MapPMI']">
            <xsl:variable name="img">
                <xsl:for-each select="descendant::span[@data-name = 'MapPMI']">
                    <xsl:value-of select="."/>
                </xsl:for-each>
            </xsl:variable>
            <XMLElement Self="di2" MarkupTag="XMLTag/figure">
                <XMLElement Self="di2" MarkupTag="XMLTag/links">
                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="linkend" Value="</xsl:text>
                    <xsl:value-of select="'cha-'"/>
                    <xsl:value-of select="'M'"/>
                    <xsl:value-of select="'-'"/>
                    <xsl:variable name="FPM"
                        select="replace(replace(substring-after($img, ' '), '_', '.'), '-', '.')"/>
                    <xsl:value-of select="$FPM"/>
                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                    <!-- Added for inlineref Azure 15087 on 11-06-2024-->
                    <xsl:variable name="name" select="self::*//img[@data-artname]/@data-artname"/>
                    <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                        <xsl:choose>
                            <xsl:when test="$Alttext//artdetail[@data-artname = $name][@data-position='inline']">
                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributeninlinehref" Name="inlinehref" Value="</xsl:text>
                                <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-src"/>
                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <!--<xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloathref" Name="floathref" Value="</xsl:text>-->
                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloatrecthref" Name="floatrecthref" Value="</xsl:text>
                                <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-src"/>
                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:if>
                    <!-- End -->
                </XMLElement>
                <xsl:variable name="FPM"
                    select="replace(replace(substring-after($img, ' '), '_', '.'), '-', '.')"/>
                <xsl:for-each select="$al/Chapter/art">
                    <xsl:variable name="main"
                        select="replace(replace(translate(./@artnum, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '-', '.'), '_', '.')"/>
                    <xsl:variable name="sub"
                        select="replace(replace(translate(concat(./@artnum, ./subart/@partnum), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '-', '.'), '_', '.')"/>
                    <xsl:choose>
                        <xsl:when test="./@type = 'Map'">
                            <xsl:choose>
                                <xsl:when test="$main eq $FPM">
                                    <XMLElement Self="di2" MarkupTag="XMLTag/Image"
                                        XMLContent="ua4c2">
                                        <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                            Name="aid:pstyle" Value="MAPPMI"/>
                                        <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                        <xsl:value-of select="@path"/>
                                        <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        <!--Added for Alt test value for marriapan 16-06-2020-->
                                        <xsl:variable name="name" select="@name"/>
                                        <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                            <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-artalt"/>
                                            <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        </xsl:if>
                                        <!--End-->
                                    </XMLElement>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:choose>
                                        <xsl:when test="$main != $FPM and $sub eq $FPM">
                                            <XMLElement Self="di2" MarkupTag="XMLTag/Image"
                                                XMLContent="ua4c2">
                                                <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                                  Name="aid:pstyle" Value="MAPPMI"/>
                                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                                <xsl:value-of select="@path"/>
                                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                                <!--Added for Alt test value for marriapan 16-06-2020-->
                                                <xsl:variable name="name" select="@name"/>
                                                <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                                    <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-artalt"/>
                                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                                </xsl:if>
                                                <!--End-->
                                            </XMLElement>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
            </XMLElement>
        </xsl:if>
        <xsl:if test="descendant::span[@data-name = 'COPMI'] and p[@data-name = 'Map-Place-Holder'] or p[@data-name = 'Map_Place_Holder']">
            <xsl:variable name="img">
                <xsl:for-each select="descendant::span[@data-name = 'COPMI']">
                    <xsl:value-of select="."/>
                </xsl:for-each>
            </xsl:variable>
            <XMLElement Self="di2" MarkupTag="XMLTag/figure">
                <XMLElement Self="di2" MarkupTag="XMLTag/links">
                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="linkend" Value="</xsl:text>
                    <xsl:value-of select="'cha-'"/>
                    <xsl:value-of select="'M'"/>
                    <xsl:value-of select="'-'"/>
                    <xsl:variable name="FPM"
                        select="replace(replace(substring-after($img, ' '), '_', '.'), '-', '.')"/>
                    <xsl:value-of select="$FPM"/>
                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                    <!-- Added for inlineref Azure 15087 on 11-06-2024-->
                    <xsl:variable name="name" select="self::*//img[@data-artname]/@data-artname"/>
                    <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                        <xsl:choose>
                            <xsl:when test="$Alttext//artdetail[@data-artname = $name][@data-position='inline']">
                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributeninlinehref" Name="inlinehref" Value="</xsl:text>
                                <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-src"/>
                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <!--<xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloathref" Name="floathref" Value="</xsl:text>-->
                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloatrecthref" Name="floatrecthref" Value="</xsl:text>
                                <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-src"/>
                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:if>
                    <!-- End -->
                </XMLElement>
                <xsl:variable name="FPM"
                    select="replace(replace(substring-after($img, ' '), '_', '.'), '-', '.')"/>
                <xsl:for-each select="$al/Chapter/art">
                    <xsl:variable name="main"
                        select="replace(replace(translate(./@artnum, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '-', '.'), '_', '.')"/>
                    <xsl:variable name="sub"
                        select="replace(replace(translate(concat(./@artnum, ./subart/@partnum), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '-', '.'), '_', '.')"/>
                    <xsl:choose>
                        <xsl:when test="./@type = 'Map'">
                            <xsl:choose>
                                <xsl:when test="$main eq $FPM">
                                    <XMLElement Self="di2" MarkupTag="XMLTag/Image"
                                        XMLContent="ua4c2">
                                        <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                            Name="aid:pstyle" Value="COPMI"/>
                                        <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                        <xsl:value-of select="@path"/>
                                        <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        <!--Added for Alt test value for marriapan 16-06-2020-->
                                        <xsl:variable name="name" select="@name"/>
                                        <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                            <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-artalt"/>
                                            <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        </xsl:if>
                                        <!--End-->
                                    </XMLElement>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:choose>
                                        <xsl:when test="$main != $FPM and $sub eq $FPM">
                                            <XMLElement Self="di2" MarkupTag="XMLTag/Image"
                                                XMLContent="ua4c2">
                                                <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                                  Name="aid:pstyle" Value="COPMI"/>
                                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                                <xsl:value-of select="@path"/>
                                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                                <!--Added for Alt test value for marriapan 16-06-2020-->
                                                <xsl:variable name="name" select="@name"/>
                                                <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                                    <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-artalt"/>
                                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                                </xsl:if>
                                                <!--End-->
                                            </XMLElement>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
            </XMLElement>
        </xsl:if>
        <xsl:text disable-output-escaping="yes">&#x3C;/ParagraphStyleRange&#x3E;</xsl:text>
        <xsl:text disable-output-escaping="yes">&#x3C;/XMLElement&#x3E;</xsl:text>

        
        <CharacterStyleRange AppliedCharacterStyle="CharacterStyle/$ID/[No character style]">
            <xsl:text disable-output-escaping="yes">&#x3C;Br/&#x3E;</xsl:text>
        </CharacterStyleRange>
    </xsl:template>
    <!-- End Place-Holder-->


    <!-- Match div started on 20.7.2017-->
    <xsl:template match="div[@data-alias] | figcaption[@data-alias] | figure[@data-alias] | a[@data-alias] | span[@data-alias]">

        <!-- Updated Div tag content Control 25.01.2017 -->
        <xsl:variable name="figalias" select="normalize-space(@data-alias)"/>
        <xsl:variable name="figid" select="@data-id"/>
        <xsl:variable name="figtag" select="@data-tag"/>
        <xsl:variable name="figxpath" select="@data-xpath"/>
        <!-- Box started on 21.07.2017-->
        
        
        <xsl:if test="self::figure[not(descendant::figcaption and descendant::p)]">
            
            <xsl:variable name="data-artname" select="self::figure//img[@data-artname]/@data-artname"/>
            
        <xsl:if test="$Alttext//artdetail[@data-artname = $data-artname]">
            
            <xsl:variable name="type" select="@data-position"/>
            <xsl:if test="not($Alttext//artdetail[@data-artname = $data-artname][@data-position='inline'])">
                <XMLElement Self="di2" MarkupTag="XMLTag/links">
                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="linkend" Value="</xsl:text>
                    <xsl:value-of select="'cha-F.'"/>
                    <xsl:variable name="id">
                        <xsl:value-of select="count(preceding::img)"/>
                    </xsl:variable>
                    <xsl:value-of select="concat(substring-before($data-artname,'.'),$id)"/>
                    
                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                    <!-- Added for inlineref Azure 15087 on 11-06-2024-->
                        <xsl:choose>
                            <xsl:when test="$Alttext//artdetail[@data-artname = $data-artname][@data-position='inline']">
                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributeninlinehref" Name="inlinehref" Value="</xsl:text>
                                <xsl:value-of select="$Alttext//artdetail[@data-artname = $data-artname]/@data-src"/>
                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloathref" Name="floathref" Value="</xsl:text>
                                <xsl:value-of select="$Alttext//artdetail[@data-artname = $data-artname]/@data-src"/>
                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    <!-- End -->
                </XMLElement>
            </xsl:if>
        </xsl:if>
        </xsl:if>
        <!-- cicerone 06-03-2025-->
        <xsl:if test="self::figure[@data-alias='FigureGroup'][not($Alttext//artdetail/@data-artname = child::img/@data-artname)][child::img/@data-artname]">
        <xsl:variable name="data-artname" select="self::figure//img[@data-artname]/@data-artname"/>
            <XMLElement Self="didi2i" MarkupTag="XMLTag/figure">
        <XMLElement Self="di2" MarkupTag="XMLTag/links">
            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="linkend" Value="</xsl:text>
            <xsl:value-of select="'cha-F.'"/>
            <xsl:variable name="id">
                <xsl:value-of select="count(preceding::img)"/>
            </xsl:variable>
            <xsl:value-of select="concat(substring-before($data-artname,'.'),$id)"/>
            
            <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
            <!-- Added for inlineref Azure 15087 on 11-06-2024-->
            <xsl:choose>
                <xsl:when test="$Alttext//artdetail[@data-artname = $data-artname][@data-position='inline']">
                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributeninlinehref" Name="inlinehref" Value="</xsl:text>
                    <xsl:value-of select="$Alttext//artdetail[@data-artname = $data-artname]/@data-src"/>
                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloathref" Name="floathref" Value="</xsl:text>
                    <xsl:value-of select="concat('/',$data-artname)"/>
                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <!-- End -->
        </XMLElement>
            </XMLElement>
        </xsl:if>
        <!-- end -->
        <xsl:if
            test="($figalias = 'Chapter Review') or ($figalias = 'PQ') or ($figalias = 'FT1') or ($figalias = 'FT2') or ($figalias = 'FT3') or ($figalias = 'FT4') or ($figalias = 'FT5') or ($figalias = 'FT6') or ($figalias = 'FT7') or ($figalias = 'FT8') or ($figalias = 'FT9') or ($figalias = 'FT10') or ($figalias = 'FF') or ($figalias = 'CS1') or ($figalias = 'CaseStudy') or ($figalias = 'Box-01') or ($figalias = 'Box-02') or ($figalias = 'Box-03') or ($figalias = 'Box-04') or ($figalias = 'Box-05') or ($figalias = 'Box-06') or ($figalias = 'Box-07') or ($figalias = 'Box-08') or ($figalias = 'Box-09') or ($figalias = 'Box-10') or ($figalias = 'FE-01') or ($figalias = 'FE-02') or ($figalias = 'FE-03') or ($figalias = 'FE-04') or ($figalias = 'FE-05') or ($figalias = 'FE-06') or ($figalias = 'FE-07') or ($figalias = 'FE-08') or ($figalias = 'FE-09') or ($figalias = 'FE-10') or ($figalias = 'Featured Element-01') or ($figalias = 'Featured Element-02') or ($figalias = 'Featured Element-03') or ($figalias = 'Featured Element-04') or ($figalias = 'Featured Element-05') or ($figalias = 'Featured Element-06') or ($figalias = 'Featured Element-07') or ($figalias = 'Featured Element-08') or ($figalias = 'Featured Element-09') or ($figalias = 'Featured Element-10') or ($figalias = 'FT11') or ($figalias = 'FT12') or ($figalias = 'FT13') or ($figalias = 'FT14') or ($figalias = 'FT15') or ($figalias = 'FT16') or ($figalias = 'FT17') or ($figalias = 'FT18') or ($figalias = 'FT19') or ($figalias = 'FT20') or ($figalias = 'Box-11') or ($figalias = 'Box-12') or ($figalias = 'Box-13') or ($figalias = 'Box-14') or ($figalias = 'Box-15') or ($figalias = 'Box-16') or ($figalias = 'Box-17') or ($figalias = 'Box-18') or ($figalias = 'Box-19') or ($figalias = 'Box-20') or ($figalias = 'FE-11') or ($figalias = 'FE-12') or ($figalias = 'FE-13') or ($figalias = 'FE-14') or ($figalias = 'FE-15') or ($figalias = 'FE-16') or ($figalias = 'FE-17') or ($figalias = 'FE-18') or ($figalias = 'FE-19') or ($figalias = 'FE-20') or ($figalias = 'Featured Element-11') or ($figalias = 'Featured Element-12') or ($figalias = 'Featured Element-13') or ($figalias = 'Featured Element-14') or ($figalias = 'Featured Element-15') or ($figalias = 'Featured Element-16') or ($figalias = 'Featured Element-17') or ($figalias = 'Featured Element-18') or ($figalias = 'Featured Element-19') or ($figalias = 'Featured Element-20') or ($figalias = 'Chapter Outline') or ($figalias = 'Case Study') or ($figalias = 'BOX1') or ($figalias = 'BOX2') or ($figalias = 'BOX3') or ($figalias = 'BOX4') or ($figalias = 'BOX5') or ($figalias = 'BOX6') or ($figalias = 'BOX7') or ($figalias = 'BOX8') or ($figalias = 'BOX9') or ($figalias = 'BOX10') or ($figalias = 'BOX11') or ($figalias = 'BOX12') or ($figalias = 'BOX13') or ($figalias = 'BOX14') or ($figalias = 'BOX15') or ($figalias = 'BOX16') or ($figalias = 'BOX17') or ($figalias = 'BOX18') or ($figalias = 'BOX19') or ($figalias = 'BOX20') or ($figalias = 'Abstract') or ($figalias = 'Learning Objectives') or ($figalias = 'ChapSum') or ($figalias = 'CaseStudy') or ($figalias = 'Standard Numbered Box')">
            <xsl:text disable-output-escaping="yes">&#x3C;XMLElement Self="di2" MarkupTag="XMLTag/sidebar"&#x3E;</xsl:text>
            <xsl:apply-templates/>
            <!--Updated {mahesh} 16.11.2017 For Purpose Box CC-->
            <xsl:element name="XMLAttribute">
                <xsl:attribute name="Self">
                    <xsl:value-of select="'di2'"/>
                </xsl:attribute>
                <xsl:attribute name="Name">
                    <xsl:value-of select="'ContentControl'"/>
                </xsl:attribute>
                <xsl:attribute name="Value">
                    <xsl:value-of select="'True'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="XMLAttribute">
                <xsl:attribute name="Self">
                    <xsl:value-of select="'di2'"/>
                </xsl:attribute>
                <xsl:attribute name="Name">
                    <xsl:value-of select="'Alias'"/>
                </xsl:attribute>
                <xsl:attribute name="Value">
                    <xsl:value-of select="$figalias"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="XMLAttribute">
                <xsl:attribute name="Self">
                    <xsl:value-of select="'di2'"/>
                </xsl:attribute>
                <xsl:attribute name="Name">
                    <xsl:value-of select="'Tag'"/>
                </xsl:attribute>
                <xsl:attribute name="Value">
                    <xsl:value-of select="$figtag"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="XMLAttribute">
                <xsl:attribute name="Self">
                    <xsl:value-of select="'di2'"/>
                </xsl:attribute>
                <xsl:attribute name="Name">
                    <xsl:value-of select="'Id'"/>
                </xsl:attribute>
                <xsl:attribute name="Value">
                    <xsl:value-of select="$figid"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="XMLAttribute">
                <xsl:attribute name="Self">
                    <xsl:value-of select="'di2'"/>
                </xsl:attribute>
                <xsl:attribute name="Name">
                    <xsl:value-of select="'DB'"/>
                </xsl:attribute>
                <xsl:attribute name="Value">
                    <xsl:value-of select="$figxpath"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="XMLAttribute">
                <xsl:attribute name="Self">
                    <xsl:value-of select="'di2'"/>
                </xsl:attribute>
                <xsl:attribute name="Name">
                    <xsl:value-of select="'role'"/>
                </xsl:attribute>
                <xsl:attribute name="Value">
                    <xsl:value-of select="$figalias"/>
                </xsl:attribute>
            </xsl:element>
            <!--Updated {mahesh} 16.11.2017 For Purpose Box CC-->
        </xsl:if>
        <!-- IllustrationRef added on 29-04-2021 -->
        <xsl:if
            test="($figalias = 'FigureRef') or ($figalias = 'SupplFigureRef') or ($figalias = 'MovieRef') or ($figalias = 'IllustrationRef')  or ($figalias = 'SupplMovieRef') or ($figalias = 'SupplTableRef') or ($figalias = 'TableRef') or ($figalias = 'ImageRef') or ($figalias = 'PhotoRef') or ($figalias = 'VideoRef') or ($figalias = 'ExampleRef') or ($figalias = 'MapRef') or ($figalias = 'BoxRef') or ($figalias = 'Box1Ref') or ($figalias = 'Box2Ref') or ($figalias = 'Box3Ref') or ($figalias = 'Box4Ref') or ($figalias = 'Box5Ref') or ($figalias = 'Box6Ref') or ($figalias = 'Box7Ref') or ($figalias = 'Box8Ref') or ($figalias = 'Box9Ref') or ($figalias = 'Box10Ref')">
            <xsl:text disable-output-escaping="yes">&#x3C;XMLElement Self="di2" MarkupTag="XMLTag/links"&#x3E;</xsl:text>
        </xsl:if>
        <!-- caption newly added on 07-09-2021 -->
        <xsl:if
            test="($figalias = 'Figure Caption') or ($figalias = 'Caption') or ($figalias = 'SupplFigureCaption') or ($figalias = 'MovieCaption') or ($figalias = 'IllustrationCaption') or ($figalias = 'SupplMovieCaption') or ($figalias = 'Image Caption') or ($figalias = 'Photo Caption') or ($figalias = 'Map Caption') or ($figalias = 'Video Caption') or ($figalias = 'FigureCaption') or ($figalias = 'ImageCaption') or ($figalias = 'PhotoCaption') or ($figalias = 'MapCaption') or ($figalias = 'VideoCaption') or ($figalias = 'FigureCaption')">
          
           <xsl:text disable-output-escaping="yes">&#x3C;XMLElement Self="di2" MarkupTag="XMLTag/figure"&#x3E;</xsl:text>
            <!-- Insert Figure link (Match artlog(ChapNo and seqno)) started on 21.7.2017 -->
            <xsl:variable name="chapseqno">
                <!--Added [1] on 08-06-2020-->
                <xsl:if test="descendant::span[@data-alias = 'ChapNo']">
                    <xsl:value-of select="descendant::span[@data-alias = 'ChapNo'][1]"/>
                </xsl:if>
                <xsl:if test="descendant::span[@data-alias = 'SeqNo']">
                    <xsl:if test="descendant::span[@data-alias = 'ChapNo']">
                        <!-- only seqno ContentControl 11.01.2017 -->
                        <xsl:value-of select="'.'"/>
                    </xsl:if>
                    <!-- Updated {Mahesh} 11.01.2017 -->
                    
                    <xsl:value-of select="descendant::span[@data-alias = 'SeqNo'][1]"/>
                </xsl:if>
            </xsl:variable>
            
            <xsl:variable name="rchapseqno">
                <xsl:for-each select="$chapseqno">
                    <xsl:value-of
                        select="replace(replace(translate(., 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '-', '.'), '_', '.')"
                    />
                </xsl:for-each>
            </xsl:variable>
            <xsl:variable name="ddc"
                select="translate(substring(substring-after($rchapseqno, ' '), 1, 4), 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz', '')"/>
               <xsl:for-each select="$artlog/Chapter/art">
                <xsl:variable name="main"
                    select="replace(replace(translate(./@artnum, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '-', '.'), '_', '.')"/>
                <xsl:variable name="sub"
                    select="replace(replace(translate(concat(./@artnum, ./subart/@partnum), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '-', '.'), '_', '.')"/>
                <xsl:choose>
                    <xsl:when
                        test="./@type = 'Figure' and $figalias = 'Figure Caption' or ./@type = 'Figure' and $figalias = 'FigureCaption'">           
                        <xsl:choose>
                            <xsl:when test="$main eq $rchapseqno">
                                <XMLElement Self="di2" MarkupTag="XMLTag/Image" XMLContent="ua4c2">
                                    <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                        Name="aid:pstyle" Value="FIGURE"/>
                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                    <xsl:value-of select="@path"/>
                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                  
                                    <!--Added for Alt test value for marriapan 16-06-2020-->
                                    <xsl:variable name="name" select="@name"/>
                                    <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                        <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                        <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-artalt"/>
                                        <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                    </xsl:if>
                                    <!--End-->  
                                </XMLElement>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:choose>
                                    <xsl:when test="$main != $rchapseqno and $sub eq $rchapseqno">
                                        <XMLElement Self="di2" MarkupTag="XMLTag/Image"
                                            XMLContent="ua4c2">
                                            <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                                Name="aid:pstyle" Value="FIGURE"/>
                                            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                            <xsl:value-of select="@path"/>
                                            <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                            <!--Added for Alt test value for marriapan 16-06-2020-->
                                            <xsl:variable name="name" select="@name"/>
                                            <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                                <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-artalt"/>
                                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                            </xsl:if>
                                            <!--End-->
                                        </XMLElement>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when
                        test="./@type = 'Image' and $figalias = 'Image Caption' or ./@type = 'Image' and $figalias = 'ImageCaption'">
                        <xsl:choose>
                            <xsl:when test="$main eq $rchapseqno">
                                <XMLElement Self="di2" MarkupTag="XMLTag/Image" XMLContent="ua4c2">
                                    <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                        Name="aid:pstyle" Value="IMAGE"/>
                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                    <xsl:value-of select="@path"/>
                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                    <!--Added for Alt test value for marriapan 16-06-2020-->
                                    <xsl:variable name="name" select="@name"/>
                                    <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                        <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                        <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-artalt"/>
                                        <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                    </xsl:if>
                                    <!--End-->
                                </XMLElement>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:choose>
                                    <xsl:when test="$main != $rchapseqno and $sub eq $rchapseqno">
                                        <XMLElement Self="di2" MarkupTag="XMLTag/Image"
                                            XMLContent="ua4c2">
                                            <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                                Name="aid:pstyle" Value="IMAGE"/>
                                            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                            <xsl:value-of select="@path"/>
                                            <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                            <!--Added for Alt test value for marriapan 16-06-2020-->
                                            <xsl:variable name="name" select="@name"/>
                                            <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                                <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-artalt"/>
                                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                            </xsl:if>
                                            <!--End-->
                                        </XMLElement>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when
                        test="./@type = 'Map' and $figalias = 'Map Caption' or ./@type = 'Map' and $figalias = 'MapCaption'">
                        <xsl:choose>
                            <xsl:when test="$main eq $rchapseqno">
                                <XMLElement Self="di2" MarkupTag="XMLTag/Image" XMLContent="ua4c2">
                                    <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                        Name="aid:pstyle" Value="MAP"/>
                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                    <xsl:value-of select="@path"/>
                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                    <!--Added for Alt test value for marriapan 16-06-2020-->
                                    <xsl:variable name="name" select="@name"/>
                                    <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                        <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                        <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-artalt"/>
                                        <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                    </xsl:if>
                                    <!--End-->
                                </XMLElement>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:choose>
                                    <xsl:when test="$main != $rchapseqno and $sub eq $rchapseqno">
                                        <XMLElement Self="di2" MarkupTag="XMLTag/Image"
                                            XMLContent="ua4c2">
                                            <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                                Name="aid:pstyle" Value="MAP"/>
                                            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                            <xsl:value-of select="@path"/>
                                            <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                            <!--Added for Alt test value for marriapan 16-06-2020-->
                                            <xsl:variable name="name" select="@name"/>
                                            <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                                <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-artalt"/>
                                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                            </xsl:if>
                                            <!--End-->
                                        </XMLElement>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when
                        test="./@type = 'Photo' and $figalias = 'Photo Caption' or ./@type = 'Photo' and $figalias = 'PhotoCaption'">
                        <xsl:choose>
                            <xsl:when test="$main eq $rchapseqno">
                                <XMLElement Self="di2" MarkupTag="XMLTag/Image" XMLContent="ua4c2">
                                    <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                        Name="aid:pstyle" Value="PHOTO"/>
                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                    <xsl:value-of select="@path"/>
                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                    <!--Added for Alt test value for marriapan 16-06-2020-->
                                    <xsl:variable name="name" select="@name"/>
                                    <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                        <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                        <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-artalt"/>
                                        <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                    </xsl:if>
                                    <!--End-->
                                </XMLElement>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:choose>
                                    <xsl:when test="$main != $rchapseqno and $sub eq $rchapseqno">
                                        <XMLElement Self="di2" MarkupTag="XMLTag/Image"
                                            XMLContent="ua4c2">
                                            <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                                Name="aid:pstyle" Value="PHOTO"/>
                                            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                            <xsl:value-of select="@path"/>
                                            <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                            <!--Added for Alt test value for marriapan 16-06-2020-->
                                            <xsl:variable name="name" select="@name"/>
                                            <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                                <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-artalt"/>
                                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                            </xsl:if>
                                            <!--End-->
                                        </XMLElement>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when
                        test="./@type = 'Video' and $figalias = 'Video Caption' or ./@type = 'Video' and $figalias = 'VideoCaption'">
                        <xsl:choose>
                            <xsl:when test="$main eq $rchapseqno">
                                <XMLElement Self="di2" MarkupTag="XMLTag/Image" XMLContent="ua4c2">
                                    <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                        Name="aid:pstyle" Value="VIDEO"/>
                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                    <xsl:value-of select="@path"/>
                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                    <!--Added for Alt test value for marriapan 16-06-2020-->
                                    <xsl:variable name="name" select="@name"/>
                                    <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                        <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                        <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-artalt"/>
                                        <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                    </xsl:if>
                                    <!--End-->
                                </XMLElement>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:choose>
                                    <xsl:when test="$main != $rchapseqno and $sub eq $rchapseqno">
                                        <XMLElement Self="di2" MarkupTag="XMLTag/Image"
                                            XMLContent="ua4c2">
                                            <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                                Name="aid:pstyle" Value="VIDEO"/>
                                            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                            <xsl:value-of select="@path"/>
                                            <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                            <!--Added for Alt test value for marriapan 16-06-2020-->
                                            <xsl:variable name="name" select="@name"/>
                                            <xsl:if test="$Alttext//artdetail[@data-artname = $name]">
                                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                                <xsl:value-of select="$Alttext//artdetail[@data-artname = $name]/@data-artalt"/>
                                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                            </xsl:if>
                                            <!--End-->
                                        </XMLElement>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    
                    </xsl:choose>
                   
                   
            </xsl:for-each>
            <!--<xsl:if test="self::figcaption/preceding::img[@data-artname][1]">-->
                
                <xsl:variable name="data-artname" select="self::figcaption/parent::figure/descendant::img[@data-artname]/@data-artname"/>
            <xsl:for-each select="$Alttext//artdetail[@data-artname = $data-artname][string-length(@data-src) &gt; 0]">
                <xsl:variable name="type" select="@data-position"/>
                    <xsl:if test="@data-orientation or @data-position">
                    <xsl:if test="@data-orientation">
                        <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="orientation" Value="</xsl:text>                 
                        <xsl:value-of select="@data-orientation"/>
                        <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                    </xsl:if>
                    <xsl:if test="@data-position">
                        <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="position" Value="</xsl:text>                 
                        <xsl:value-of select="@data-position"/>
                        <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                        <!-- Added for image resize on 18-11-2021 -->
                        <xsl:if test="@data-moveto">
                            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="moveto" Value="</xsl:text>                 
                            <xsl:value-of select="@data-moveto"/>
                            <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                        </xsl:if>
                        <xsl:if test="@data-resize">
                            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="resize" Value="</xsl:text>                 
                            <xsl:value-of select="@data-resize"/>
                            <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                        </xsl:if>
                        <!-- New data-final-size attribute added on 26-12-2022 -->
                        <xsl:if test="@data-final-size">
                            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="data-final-size" Value="</xsl:text>                 
                            <xsl:value-of select="@data-final-size"/>
                            <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                        </xsl:if>
                        <!-- End -->
                
                    </xsl:if>
                    </xsl:if>
                    
                    <xsl:choose>
                        <xsl:when
                            test="$type and $figalias = 'Figure Caption' or $type and $figalias = 'FigureCaption' or $figalias = 'Caption'">        
                            <xsl:choose>
                                <xsl:when test="not($type = 'inline')">
                                    <!--Added for multiple insert images on 15-12-2022-->
                                    <xsl:for-each select="$Alttext//artdetail[@data-artname = $data-artname]/current()">
                                        
                                    <XMLElement Self="di2" MarkupTag="XMLTag/Image" XMLContent="ua4c2">
                                        <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                            Name="aid:pstyle" Value="FIGURE"/>
                                        <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                        
                                        <!--<xsl:value-of select="$Alttext//artdetail[@data-artname = $data-artname]/@data-src"/>-->
                                        <xsl:value-of select="@data-src"/>
                                        <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        <!--Added for Alt test value for marriapan 16-06-2020-->
                                        
                                        <xsl:if test="@data-artalt">
                                            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                            <xsl:value-of select="@data-artalt"/>
                                            <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        </xsl:if>
                                        <!--End-->  
                                    </XMLElement>
                                    </xsl:for-each>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:for-each select="$Alttext//artdetail[@data-artname = $data-artname]/current()">
                                             <XMLElement Self="di2" MarkupTag="XMLTag/Image"
                                                XMLContent="ua4c2">
                                                <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                                    Name="aid:pstyle" Value="FIGURE"/>
                                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                                 <!--<xsl:value-of select="$Alttext//artdetail[@data-artname = $data-artname]/@data-src"/>-->
                                                 <xsl:value-of select="@data-src"/>
                                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                                <!--Added for Alt test value for marriapan 16-06-2020-->
                                                
                                                 <xsl:if test="@data-artalt">
                                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                                    <xsl:value-of select="@data-artalt"/>
                                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                                </xsl:if>
                                                <!--End-->
                                            </XMLElement>
                                    </xsl:for-each>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                        <xsl:when
                            test="$type and $figalias = 'Image Caption' or $type and $figalias = 'ImageCaption'">
                            <xsl:choose>
                                <xsl:when test="not($type = 'inline')">
                                    <xsl:for-each select="$Alttext//artdetail[@data-artname = $data-artname]/current()">
                                    <XMLElement Self="di2" MarkupTag="XMLTag/Image" XMLContent="ua4c2">
                                        <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                            Name="aid:pstyle" Value="IMAGE"/>
                                        <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                        <!--<xsl:value-of select="$Alttext//artdetail[@data-artname = $data-artname]/@data-src"/>-->
                                        <xsl:value-of select="@data-src"/>
                                        <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        <!--Added for Alt test value for marriapan 16-06-2020-->
                                            <xsl:if test="@data-artalt">
                                            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                            <xsl:value-of select="@data-artalt"/>
                                            <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        </xsl:if>
                                        <!--End-->
                                    </XMLElement>
                                    </xsl:for-each>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:for-each select="$Alttext//artdetail[@data-artname = $data-artname]/current()">
                                            <XMLElement Self="di2" MarkupTag="XMLTag/Image"
                                                XMLContent="ua4c2">
                                                <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                                    Name="aid:pstyle" Value="IMAGE"/>
                                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                                <!--<xsl:value-of select="$Alttext//artdetail[@data-artname = $data-artname]/@data-src"/>-->
                                                <xsl:value-of select="@data-src"/>
                                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                                <!--Added for Alt test value for marriapan 16-06-2020-->
                                                    <xsl:if test="@data-artalt">
                                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                                    <xsl:value-of select="@data-artalt"/>
                                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                                </xsl:if>
                                                <!--End-->
                                            </XMLElement>
                                    </xsl:for-each>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                        <xsl:when
                            test="$type and $figalias = 'Map Caption' or $type and $figalias = 'MapCaption'">
                            <xsl:choose>
                                <xsl:when test="not($type = 'inline')">
                                    <xsl:for-each select="$Alttext//artdetail[@data-artname = $data-artname]/current()">
                                    <XMLElement Self="di2" MarkupTag="XMLTag/Image" XMLContent="ua4c2">
                                        <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                            Name="aid:pstyle" Value="MAP"/>
                                        <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                        <!--<xsl:value-of select="$Alttext//artdetail[@data-artname = $data-artname]/@data-src"/>-->
                                        <xsl:value-of select="@data-src"/>
                                        <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        <!--Added for Alt test value for marriapan 16-06-2020-->
                                        
                                        <xsl:if test="@data-artalt">
                                            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                            <xsl:value-of select="@data-artalt"/>
                                            <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        </xsl:if>
                                        <!--End-->
                                    </XMLElement>
                                    </xsl:for-each>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:for-each select="$Alttext//artdetail[@data-artname = $data-artname]/current()">
                                            <XMLElement Self="di2" MarkupTag="XMLTag/Image"
                                                XMLContent="ua4c2">
                                                <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                                    Name="aid:pstyle" Value="MAP"/>
                                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                                <!--<xsl:value-of select="$Alttext//artdetail[@data-artname = $data-artname]/@data-src"/>-->
                                                <xsl:value-of select="@data-src"/>
                                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                                <!--Added for Alt test value for marriapan 16-06-2020-->
                                                <xsl:variable name="name" select="@name"/>
                                                <xsl:if test="@data-artalt">
                                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                                    <xsl:value-of select="@data-artalt"/>
                                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                                </xsl:if>
                                                <!--End-->
                                            </XMLElement>
                                    </xsl:for-each>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                        <xsl:when
                            test="$type and $figalias = 'Photo Caption' or $type and $figalias = 'PhotoCaption'">
                            <xsl:choose>
                                <xsl:when test="not($type = 'inline')">
                                    <xsl:for-each select="$Alttext//artdetail[@data-artname = $data-artname]/current()">
                                    <XMLElement Self="di2" MarkupTag="XMLTag/Image" XMLContent="ua4c2">
                                        <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                            Name="aid:pstyle" Value="PHOTO"/>
                                        <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                        <!--<xsl:value-of select="$Alttext//artdetail[@data-artname = $data-artname]/@data-src"/>-->
                                        <xsl:value-of select="@data-src"/>
                                        <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        <!--Added for Alt test value for marriapan 16-06-2020-->
                                        
                                        <xsl:if test="@data-artalt">
                                            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                            <xsl:value-of select="@data-artalt"/>
                                            <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        </xsl:if>
                                        <!--End-->
                                    </XMLElement>
                                    </xsl:for-each>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:for-each select="$Alttext//artdetail[@data-artname = $data-artname]/current()">
                                            <XMLElement Self="di2" MarkupTag="XMLTag/Image"
                                                XMLContent="ua4c2">
                                                <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                                    Name="aid:pstyle" Value="PHOTO"/>
                                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                                <!--<xsl:value-of select="$Alttext//artdetail[@data-artname = $data-artname]/@data-src"/>-->
                                                <xsl:value-of select="@data-src"/>
                                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                                <!--Added for Alt test value for marriapan 16-06-2020-->
                                                
                                                <xsl:if test="@data-artalt">
                                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                                    <xsl:value-of select="@data-artalt"/>
                                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                                </xsl:if>
                                                <!--End-->
                                            </XMLElement>
                                    </xsl:for-each>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                        <xsl:when
                            test="$type and $figalias = 'Video Caption' or $type and $figalias = 'VideoCaption'">
                            <xsl:choose>
                                <xsl:when test="not($type = 'inline')">
                                    <xsl:for-each select="$Alttext//artdetail[@data-artname = $data-artname]/current()">
                                    <XMLElement Self="di2" MarkupTag="XMLTag/Image" XMLContent="ua4c2">
                                        <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                            Name="aid:pstyle" Value="VIDEO"/>
                                        <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                        <!--<xsl:value-of select="$Alttext//artdetail[@data-artname = $data-artname]/@data-src"/>-->
                                        <xsl:value-of select="@data-src"/>
                                        <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        <!--Added for Alt test value for marriapan 16-06-2020-->
                                        
                                        <xsl:if test="@data-artalt">
                                            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                            <xsl:value-of select="@data-artalt"/>
                                            <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        </xsl:if>
                                        <!--End-->
                                    </XMLElement>
                                    </xsl:for-each>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:for-each select="$Alttext//artdetail[@data-artname = $data-artname]/current()">
                                            <XMLElement Self="di2" MarkupTag="XMLTag/Image"
                                                XMLContent="ua4c2">
                                                <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                                    Name="aid:pstyle" Value="VIDEO"/>
                                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                                <!--<xsl:value-of select="$Alttext//artdetail[@data-artname = $data-artname]/@data-src"/>-->
                                                <xsl:value-of select="@data-src"/>
                                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                                <!--Added for Alt test value for marriapan 16-06-2020-->
                                                
                                                <xsl:if test="@data-artalt">
                                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                                    <xsl:value-of select="@data-artalt"/>
                                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                                </xsl:if>
                                                <!--End-->
                                            </XMLElement>
                                    </xsl:for-each>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                        
                    </xsl:choose>
                    <!--<xsl:choose>
                        <xsl:when test="not($type = 'inline')">
                            <XMLElement Self="di2" MarkupTag="XMLTag/Image" XMLContent="ua4c2">
                                <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                    Name="aid:pstyle" Value="FIGURE"/>
                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                <xsl:value-of select="$Alttext//artdetail[@data-artname = $data-artname]/@data-src"/>
                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                
                                <!-\-Added for Alt test value for marriapan 16-06-2020-\->
                                <xsl:variable name="name" select="@name"/>
                                <xsl:if test="@data-artalt">
                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                    <xsl:value-of select="@data-artalt"/>
                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                </xsl:if>
                                
                                <!-\-End-\->  
                            </XMLElement> 
                        </xsl:when>
                        <xsl:otherwise>
                            
                            
                                  <XMLElement Self="di2" MarkupTag="XMLTag/links">
                                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="linkend" Value="</xsl:text>
                                      <xsl:value-of select="$Alttext//artdetail[@data-artname = $data-artname]/@data-artname"/>
                                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>            
                               </XMLElement>
                                       <XMLElement Self="di2" MarkupTag="XMLTag/Image"
                                        XMLContent="ua4c2">
                                        <XMLAttribute Self="di2XMLAttributenaid-pstyle"
                                            Name="aid:pstyle" Value="FIGURE"/>
                                        <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenhref" Name="href" Value="</xsl:text>
                                        <xsl:value-of select="$Alttext//artdetail[@data-artname = $data-artname]/@data-src"/>
                                        <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        <!-\-Added for Alt test value for marriapan 16-06-2020-\->
                                        <xsl:variable name="name" select="@name"/>
                                           <xsl:if test="@data-artalt">
                                            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="Alt" Value="</xsl:text>                 
                                               <xsl:value-of select="@data-artalt"/>
                                            <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                        </xsl:if>
                                           <xsl:apply-templates/>
                                        <!-\-End-\->
                                    </XMLElement>
                        </xsl:otherwise>
                    </xsl:choose>-->
                
            
                </xsl:for-each>
            <!--</xsl:if>-->
            <!-- End Insert Figure link-->
        </xsl:if>
        <!-- Table Caption Whole xml tag updated on 22/08/2017-->
        <xsl:variable name="aaaa" select="@data-alias"/>
        <xsl:variable name="class" select="@class"/>
        <!--<xsl:if test="$aaaa = 'Table Caption' or $aaaa = 'TableCaption' or $class='captiontable' or $class='caption table'">-->
        <!--added contains for table div class values updated for table 23.04.2018-->
        <!--<xsl:if
            test="$class = 'captiontable' or $class = 'caption table' or contains($class, 'captiontable') or contains($class, 'caption table')">

            <xsl:text disable-output-escaping="yes">&#x3C;XMLElement Self="di2" MarkupTag="XMLTag/table"&#x3E;</xsl:text>
        </xsl:if>-->
        
        
        <xsl:choose>
        <xsl:when
            test="$class = 'captiontable' or $class = 'caption table' or contains($class, 'captiontable') or contains($class, 'caption table')">
            
            <xsl:text disable-output-escaping="yes">&#x3C;XMLElement Self="di2" MarkupTag="XMLTag/table"&#x3E;</xsl:text>
        </xsl:when>
            <xsl:otherwise>
                <!--10-05-2020, Added for without TableGroup-->
                <xsl:if
                    test="self::div[@data-alias='TableCaption' or @data-alias='Table Caption'][not(ancestor::div[1][contains(@class, 'captiontable') or contains(@class, 'caption table') or @data-alias='TableGroup'])]">
                    <xsl:text disable-output-escaping="yes">&#x3C;XMLElement Self="di2" MarkupTag="XMLTag/table"&#x3E;</xsl:text>
                </xsl:if>
                <!--End-->
            </xsl:otherwise>
        </xsl:choose>
        
        <!--15-06-2020, Added for SupplTableCaption-->
        <xsl:if
            test="self::div[@data-alias='SupplTableCaption'][not(ancestor::div[1][contains(@class, 'captiontable') or contains(@class, 'caption table') or @data-alias='SupplTableGroup'])]">
            <xsl:text disable-output-escaping="yes">&#x3C;XMLElement Self="di2" MarkupTag="XMLTag/table"&#x3E;</xsl:text>
        </xsl:if>
        <!--End-->
        

        <!--Add the comment for without group tag 21-2-2019-->
        <!--<xsl:if
            test="self::div[@data-alias='Table Caption' or 'TableCaption'][not(preceding::div[1])]">
            <xsl:text disable-output-escaping="yes">&#x3C;XMLElement Self="di2" MarkupTag="XMLTag/table"&#x3E;</xsl:text>
        </xsl:if>-->
        <!--End -->

        <xsl:if
            test="not(($figalias = 'Chapter Review') or ($figalias = 'PQ') or ($figalias = 'FT1') or ($figalias = 'FT2') or ($figalias = 'FT3') or ($figalias = 'FT4') or ($figalias = 'FT5') or ($figalias = 'FT6') or ($figalias = 'FT7') or ($figalias = 'FT8') or ($figalias = 'FT9') or ($figalias = 'FT10') or ($figalias = 'FF') or ($figalias = 'CS1') or ($figalias = 'CaseStudy') or ($figalias = 'Box-01') or ($figalias = 'Box-02') or ($figalias = 'Box-03') or ($figalias = 'Box-04') or ($figalias = 'Box-05') or ($figalias = 'Box-06') or ($figalias = 'Box-07') or ($figalias = 'Box-08') or ($figalias = 'Box-09') or ($figalias = 'Box-10') or ($figalias = 'FE-01') or ($figalias = 'FE-02') or ($figalias = 'FE-03') or ($figalias = 'FE-04') or ($figalias = 'FE-05') or ($figalias = 'FE-06') or ($figalias = 'FE-07') or ($figalias = 'FE-08') or ($figalias = 'FE-09') or ($figalias = 'FE-10') or ($figalias = 'Featured Element-01') or ($figalias = 'Featured Element-02') or ($figalias = 'Featured Element-03') or ($figalias = 'Featured Element-04') or ($figalias = 'Featured Element-05') or ($figalias = 'Featured Element-06') or ($figalias = 'Featured Element-07') or ($figalias = 'Featured Element-08') or ($figalias = 'Featured Element-09') or ($figalias = 'Featured Element-10') or ($figalias = 'FT11') or ($figalias = 'FT12') or ($figalias = 'FT13') or ($figalias = 'FT14') or ($figalias = 'FT15') or ($figalias = 'FT16') or ($figalias = 'FT17') or ($figalias = 'FT18') or ($figalias = 'FT19') or ($figalias = 'FT20') or ($figalias = 'Box-11') or ($figalias = 'Box-12') or ($figalias = 'Box-13') or ($figalias = 'Box-14') or ($figalias = 'Box-15') or ($figalias = 'Box-16') or ($figalias = 'Box-17') or ($figalias = 'Box-18') or ($figalias = 'Box-19') or ($figalias = 'Box-20') or ($figalias = 'FE-11') or ($figalias = 'FE-12') or ($figalias = 'FE-13') or ($figalias = 'FE-14') or ($figalias = 'FE-15') or ($figalias = 'FE-16') or ($figalias = 'FE-17') or ($figalias = 'FE-18') or ($figalias = 'FE-19') or ($figalias = 'FE-20') or ($figalias = 'Featured Element-11') or ($figalias = 'Featured Element-12') or ($figalias = 'Featured Element-13') or ($figalias = 'Featured Element-14') or ($figalias = 'Featured Element-15') or ($figalias = 'Featured Element-16') or ($figalias = 'Featured Element-17') or ($figalias = 'Featured Element-18') or ($figalias = 'Featured Element-19') or ($figalias = 'Featured Element-20') or ($figalias = 'Chapter Outline') or ($figalias = 'Case Study') or ($figalias = 'BOX1') or ($figalias = 'BOX2') or ($figalias = 'BOX3') or ($figalias = 'BOX4') or ($figalias = 'BOX5') or ($figalias = 'BOX6') or ($figalias = 'BOX7') or ($figalias = 'BOX8') or ($figalias = 'BOX9') or ($figalias = 'BOX10') or ($figalias = 'BOX11') or ($figalias = 'BOX12') or ($figalias = 'BOX13') or ($figalias = 'BOX14') or ($figalias = 'BOX15') or ($figalias = 'BOX16') or ($figalias = 'BOX17') or ($figalias = 'BOX18') or ($figalias = 'BOX19') or ($figalias = 'BOX20') or ($figalias = 'Abstract') or ($figalias = 'Learning Objectives') or ($figalias = 'ChapSum') or ($figalias = 'CaseStudy') or ($figalias = 'Standard Numbered Box'))">

            <xsl:element name="XMLElement">
                <xsl:attribute name="Self">
                    <xsl:value-of select="'di2'"/>
                </xsl:attribute>
                <xsl:attribute name="MarkupTag">
                    <xsl:value-of select="'XMLTag/'"/>
                    <xsl:choose>
                        <xsl:when test="@data-alias">
                            <xsl:value-of select="$figalias"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:choose>
                                <xsl:when test="@data-tag">
                                    <xsl:value-of select="$figtag"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="'$ID/[No character style]'"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
                <xsl:apply-templates/>
                <!-- Figure Content Control-->
                <xsl:element name="XMLAttribute">
                    <xsl:attribute name="Self">
                        <xsl:value-of select="'di2'"/>
                    </xsl:attribute>
                    <xsl:attribute name="Name">
                        <xsl:value-of select="'ContentControl'"/>
                    </xsl:attribute>
                    <xsl:attribute name="Value">
                        <xsl:value-of select="'True'"/>
                    </xsl:attribute>
                </xsl:element>
                <xsl:element name="XMLAttribute">
                    <xsl:attribute name="Self">
                        <xsl:value-of select="'di2'"/>
                    </xsl:attribute>
                    <xsl:attribute name="Name">
                        <xsl:value-of select="'Alias'"/>
                    </xsl:attribute>
                    <xsl:attribute name="Value">
                        <xsl:value-of select="$figalias"/>
                    </xsl:attribute>
                </xsl:element>
                <xsl:element name="XMLAttribute">
                    <xsl:attribute name="Self">
                        <xsl:value-of select="'di2'"/>
                    </xsl:attribute>
                    <xsl:attribute name="Name">
                        <xsl:value-of select="'Tag'"/>
                    </xsl:attribute>
                    <xsl:attribute name="Value">
                        <xsl:value-of select="$figtag"/>
                    </xsl:attribute>
                </xsl:element>
                <xsl:element name="XMLAttribute">
                    <xsl:attribute name="Self">
                        <xsl:value-of select="'di2'"/>
                    </xsl:attribute>
                    <xsl:attribute name="Name">
                        <xsl:value-of select="'Id'"/>
                    </xsl:attribute>
                    <xsl:attribute name="Value">
                        <xsl:value-of select="$figid"/>
                    </xsl:attribute>
                </xsl:element>
                <xsl:element name="XMLAttribute">
                    <xsl:attribute name="Self">
                        <xsl:value-of select="'di2'"/>
                    </xsl:attribute>
                    <xsl:attribute name="Name">
                        <xsl:value-of select="'DB'"/>
                    </xsl:attribute>
                    <xsl:attribute name="Value">
                        <xsl:value-of select="$figxpath"/>
                    </xsl:attribute>
                </xsl:element>
                <!--  End Figure Content Control-->
            </xsl:element>
        </xsl:if>
        <!--Updated Br tag {Mahesh} 28.12.2017-->
        <xsl:if test="$class = 'captiontable' or $class = 'caption table'">
            <Br/>
        </xsl:if>
        <!--Updated Br tag {Mahesh} 28.12.2017-->

        <!--<xsl:if test="$aaaa = 'Table Caption' or $aaaa = 'TableCaption' or bbbb = 'captiontable'">
				<xsl:text disable-output-escaping="yes">&#x3C;/XMLElement&#x3E;</xsl:text>
			</xsl:if>Updated {Mahesh} 15.11.2017-->
        <!-- Box linkend Created on 17.08.2017-->
        <!--	<xsl:if test="($figalias = 'Chapter Review') or ($figalias = 'PQ') or ($figalias = 'FT1') or ($figalias = 'FT2') or ($figalias = 'FT3') or ($figalias = 'FT4') or ($figalias = 'FT5') or ($figalias = 'FT6') or ($figalias = 'FT7') or ($figalias = 'FT8') or ($figalias = 'FT9') or ($figalias = 'FT10') or ($figalias = 'FF') or ($figalias = 'CS1') or ($figalias = 'CaseStudy') or ($figalias = 'Box-01') or ($figalias = 'Box-02') or ($figalias = 'Box-03') or ($figalias = 'Box-04') or ($figalias = 'Box-05') or ($figalias = 'Box-06') or ($figalias = 'Box-07') or ($figalias = 'Box-08') or ($figalias = 'Box-09') or ($figalias = 'Box-10') or ($figalias = 'FE-01') or ($figalias = 'FE-02') or ($figalias = 'FE-03') or ($figalias = 'FE-04') or ($figalias = 'FE-05') or ($figalias = 'FE-06') or ($figalias = 'FE-07') or ($figalias = 'FE-08') or ($figalias = 'FE-09') or ($figalias = 'FE-10') or ($figalias = 'Featured Element-01') or ($figalias = 'Featured Element-02') or ($figalias = 'Featured Element-03') or ($figalias = 'Featured Element-04') or ($figalias = 'Featured Element-05') or ($figalias = 'Featured Element-06') or ($figalias = 'Featured Element-07') or ($figalias = 'Featured Element-08') or ($figalias = 'Featured Element-09') or ($figalias = 'Featured Element-10') or ($figalias = 'FT11') or ($figalias = 'FT12') or ($figalias = 'FT13') or ($figalias = 'FT14') or ($figalias = 'FT15') or ($figalias = 'FT16') or ($figalias = 'FT17') or ($figalias = 'FT18') or ($figalias = 'FT19') or ($figalias = 'FT20') or ($figalias = 'Box-11') or ($figalias = 'Box-12') or ($figalias = 'Box-13') or ($figalias = 'Box-14') or ($figalias = 'Box-15') or ($figalias = 'Box-16') or ($figalias = 'Box-17') or ($figalias = 'Box-18') or ($figalias = 'Box-19') or ($figalias = 'Box-20') or ($figalias = 'FE-11') or ($figalias = 'FE-12') or ($figalias = 'FE-13') or ($figalias = 'FE-14') or ($figalias = 'FE-15') or ($figalias = 'FE-16') or ($figalias = 'FE-17') or ($figalias = 'FE-18') or ($figalias = 'FE-19') or ($figalias = 'FE-20') or ($figalias = 'Featured Element-11') or ($figalias = 'Featured Element-12') or ($figalias = 'Featured Element-13') or ($figalias = 'Featured Element-14') or ($figalias = 'Featured Element-15') or ($figalias = 'Featured Element-16') or ($figalias = 'Featured Element-17') or ($figalias = 'Featured Element-18') or ($figalias = 'Featured Element-19') or ($figalias = 'Featured Element-20') or ($figalias = 'Chapter Outline') or ($figalias = 'Case Study') or ($figalias = 'BOX1') or ($figalias = 'BOX2') or ($figalias = 'BOX3') or ($figalias = 'BOX4') or ($figalias = 'BOX5') or ($figalias = 'BOX6') or ($figalias = 'BOX7') or ($figalias = 'BOX8') or ($figalias = 'BOX9') or ($figalias = 'BOX10') or ($figalias = 'BOX11') or ($figalias = 'BOX12') or ($figalias = 'BOX13') or ($figalias = 'BOX14') or ($figalias = 'BOX15') or ($figalias = 'BOX16') or ($figalias = 'BOX17') or ($figalias = 'BOX18') or ($figalias = 'BOX19') or ($figalias = 'BOX20') or ($figalias = 'Abstract') or ($figalias = 'Learning Objectives') or ($figalias = 'ChapSum') or ($figalias = 'CaseStudy') or ($figalias = 'Standard Numbered Box')">
				<xsl:element name="XMLAttribute">
				<xsl:attribute name="Self">
					<xsl:value-of select="'di2XMLAttributenlinkend'"/>
				</xsl:attribute>
				<xsl:attribute name="Name">
					<xsl:value-of select="'linkend'"/>
				</xsl:attribute>			
				<xsl:attribute name="Value">
					<xsl:value-of select="'cha-'"/>
					<xsl:value-of select="substring($figalias,1,1)"/>
					<xsl:if test="descendant::span[@data-alias='ChapNo']">
						<xsl:value-of select="'.'"/>
						<xsl:value-of select="descendant::span[@data-alias='ChapNo']"/>
					</xsl:if>
					<xsl:if test="descendant::span[@data-alias='SeqNo']">
						<xsl:value-of select="'.'"/>
						<xsl:value-of select="descendant::span[@data-alias='SeqNo']"/>
					</xsl:if>
				</xsl:attribute>				
			</xsl:element>
		</xsl:if>-->
        <!-- End Box linkend-->
        <!-- Figure linkend(Figure reference)-->
        <xsl:if
            test="($figalias = 'FigureRef') or ($figalias = 'SupplFigureRef') or ($figalias = 'MovieRef') or ($figalias = 'IllustrationRef') or ($figalias = 'SupplMovieRef') or ($figalias = 'SupplTableRef') or ($figalias = 'TableRef') or ($figalias = 'ImageRef') or ($figalias = 'PhotoRef') or ($figalias = 'VideoRef') or ($figalias = 'ExampleRef') or ($figalias = 'MapRef') or ($figalias = 'BoxRef') or ($figalias = 'Box1Ref') or ($figalias = 'Box2Ref') or ($figalias = 'Box3Ref') or ($figalias = 'Box4Ref') or ($figalias = 'Box5Ref') or ($figalias = 'Box6Ref') or ($figalias = 'Box7Ref') or ($figalias = 'Box8Ref') or ($figalias = 'Box9Ref') or ($figalias = 'Box10Ref')">
            <xsl:choose>
                <xsl:when
                    test="//descendant::span[@data-alias = 'ChapNo'] or //descendant::span[@data-alias = 'SeqNo']">
                    <xsl:element name="XMLAttribute">
                        <xsl:attribute name="Self">
                            <xsl:value-of select="'di2XMLAttributenlinkend'"/>
                        </xsl:attribute>
                        <xsl:attribute name="Name">
                            <xsl:value-of select="'linkend'"/>
                        </xsl:attribute>
                        <xsl:attribute name="Value">
                            <xsl:value-of select="'cha-'"/>
                            <xsl:value-of select="substring($figalias, 1, 1)"/>

                            <xsl:if test="descendant::span[@data-alias = 'ChapNo']">
                                <xsl:value-of select="'.'"/>
                                <xsl:value-of select="descendant::span[@data-alias = 'ChapNo']"/>
                            </xsl:if>

                            <xsl:if test="descendant::span[@data-alias = 'SeqNo']">
                                <xsl:value-of select="'.'"/>
                                <xsl:value-of select="descendant::span[@data-alias = 'SeqNo']"/>

                            </xsl:if>
                            <!--.. issue in linkend 18.5.2018-->
                            <!--<xsl:if test="descendant::span[@data-alias = 'ChapNo']">
<xsl:variable name="chapnoVal" select="descendant::span[@data-alias = 'ChapNo']"/>
                            <xsl:choose>                        
                            <xsl:when test="(string-length($chapnoVal) &gt; 0)">
                                <xsl:value-of select="'.'"/>
                                <xsl:value-of select="descendant::span[@data-alias = 'ChapNo']"/>
                                </xsl:when>
                                <xsl:when test="$chapnoVal = 'null'">
                                </xsl:when>
                                <xsl:otherwise/>
                            </xsl:choose>
</xsl:if>
                            <xsl:if test="descendant::span[@data-alias = 'SeqNo']">
                                <xsl:variable name="seqnoVal" select="descendant::span[@data-alias = 'SeqNo']"/>
                            <xsl:choose>                        
                                <xsl:when test="(string-length($seqnoVal) &gt; 0)">
                                    <xsl:value-of select="'.'"/>
                                    <xsl:value-of select="descendant::span[@data-alias = 'SeqNo']"/>
                                </xsl:when>
                                <xsl:when test="$seqnoVal = 'null'">
                                </xsl:when>
                                <xsl:otherwise/>
                            </xsl:choose>
                            </xsl:if>-->
                            <!--end issue in linkend 18.5.2018-->
                        </xsl:attribute>
                    </xsl:element>
                    <xsl:text disable-output-escaping="yes">&#x3C;/XMLElement&#x3E;</xsl:text>
                </xsl:when>
                <xsl:when
                    test="descendant::span[@data-alias = 'ChapNo1'] or descendant::span[@data-alias = 'SeqNo1']">
                    <xsl:variable name="Sq">
                        <xsl:for-each select="descendant::span">
                            <xsl:if test="./@data-alias = 'SeqNo'">
                                <xsl:variable name="Sqqq1">
                                    <xsl:value-of select="."/>
                                </xsl:variable>
                                <xsl:choose>
                                    <xsl:when test="matches($Sqqq1, '[A-Za-z]')">
                                        <xsl:variable name="Sqqq2">
                                            <xsl:value-of select="replace($Sqqq1, '[A-Za-z]', '')"/>
                                        </xsl:variable>
                                        <xsl:value-of select="$Sqqq2"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="$Sqqq1"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:variable>
                    <xsl:variable name="Sq1">
                        <xsl:for-each select="descendant::span">
                            <xsl:if test="./@data-alias = 'SeqNo1'">
                                <xsl:value-of select="."/>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:variable>
                    <xsl:variable name="Sc1">
                        <xsl:for-each select="descendant::span">
                            <xsl:if test="./@data-alias = 'SecNo1'">
                                <xsl:value-of select="."/>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:variable>
                    <xsl:variable name="CN1">
                        <xsl:for-each select="descendant::span">
                            <xsl:if test="./@data-alias = 'ChapNo1'">
                                <xsl:value-of select="."/>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:variable>
                    <xsl:variable name="SS">
                        <xsl:value-of select="'0'"/>
                    </xsl:variable>
                    <xsl:variable name="SS1">
                        <xsl:choose>
                            <xsl:when test="matches($Sq1, '[A-Za-z]')">
                                <xsl:variable name="SS12">
                                    <xsl:value-of select="replace($Sq1, '[A-za-z]', '')"/>
                                </xsl:variable>
                                <xsl:value-of select="$SS12"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="$Sq1 - 1"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>

                    <xsl:variable name="CSS">
                        <xsl:for-each select="descendant::span">
                            <xsl:if test="./@data-alias = 'ChapNo1'">
                                <xsl:value-of select="concat('-', $CN1)"/>
                            </xsl:if>
                        </xsl:for-each>
                        <xsl:for-each select="descendant::span">
                            <xsl:if test="./@data-alias = 'SecNo1'">
                                <xsl:value-of select="concat('.', $Sc1)"/>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:variable>
                    <xsl:for-each select="$Sq to $SS1">
                        <xsl:variable name="SS">
                            <xsl:value-of select="position()"/>
                        </xsl:variable>
                        <xsl:variable name="Seq1">
                            <xsl:value-of select="$Sq + $SS"/>
                        </xsl:variable>
                        <xsl:element name="XMLAttribute">
                            <xsl:attribute name="Self">
                                <xsl:value-of select="'di2XMLAttributenlinkend'"/>
                            </xsl:attribute>
                            <xsl:attribute name="Name">
                                <xsl:value-of select="'linkend'"/>
                            </xsl:attribute>

                            <xsl:attribute name="Value">
                                <xsl:value-of select="'cha-'"/>
                                <xsl:value-of select="substring($figalias, 1, 1)"/>
                                <xsl:value-of select="$CSS"/>
                                <xsl:value-of select="concat('.', $Seq1)"/>

                            </xsl:attribute>
                        </xsl:element>
                        <xsl:text disable-output-escaping="yes">&#x3C;/XMLElement&#x3E;</xsl:text>
                    </xsl:for-each>
                </xsl:when>
            </xsl:choose>


            <!--data-chapNo and data-SeqNo-->
            <!--<xsl:choose>
          <xsl:when
              test="@data-chapNo or @data-SeqNo">
                <xsl:element name="XMLAttribute">
                    <xsl:attribute name="Self">
                        <xsl:value-of select="'di2XMLAttributenlinkend'"/>
                    </xsl:attribute>
                    <xsl:attribute name="Name">
                        <xsl:value-of select="'linkend'"/>
                    </xsl:attribute>
                    <xsl:attribute name="Value">
                        <xsl:value-of select="'cha-'"/>
                        <xsl:value-of select="substring($figalias, 1, 1)"/>
                        
                        <xsl:if test="@data-chapNo">
                            <xsl:value-of select="'.'"/>
                            <xsl:value-of select="@data-chapNo"/>
                             </xsl:if>
                        
                        <xsl:if test="@data-SeqNo">
                            <xsl:value-of select="'.'"/>
                            <xsl:value-of select="@data-SeqNo"/>
                            </xsl:if>
                    </xsl:attribute>
                </xsl:element>
                <xsl:text disable-output-escaping="yes">&#x3C;/XMLElement&#x3E;</xsl:text>
            </xsl:when>
            <xsl:otherwise/>
                            
            </xsl:choose>-->
            <!--end-->


        </xsl:if>
        <!-- figure XmlId(Figure caption)-->
        <xsl:if
            test="($figalias = 'Figure Caption') or ($figalias = 'Caption') or ($figalias = 'SupplFigureCaption') or ($figalias = 'MovieCaption') or ($figalias = 'IllustrationCaption') or ($figalias = 'SupplMovieCaption') or ($figalias = 'Image Caption') or ($figalias = 'Photo Caption') or ($figalias = 'Map Caption') or ($figalias = 'Video Caption') or ($figalias = 'FigureCaption') or ($figalias = 'ImageCaption') or ($figalias = 'PhotoCaption') or ($figalias = 'MapCaption') or ($figalias = 'VideoCaption')">
            <xsl:variable name="data-artname" select="self::figcaption/parent::figure/descendant::img[@data-artname]/@data-artname"/>
            <xsl:if test="$Alttext//artdetail[@data-artname = $data-artname][not(@data-position='inline')] and not(($figalias = 'Caption')) or descendant::span[@data-alias = 'ChapNo' or @data-alias = 'SeqNo'] and not($Alttext//artdetail[@data-artname = $data-artname])">
                
               
            <xsl:element name="XMLAttribute">
                <xsl:attribute name="Self">
                    <xsl:value-of select="'di2XMLAttributenxml:id'"/>
                </xsl:attribute>
                <xsl:attribute name="Name">
                    <xsl:value-of select="'xml:id'"/>
                </xsl:attribute>
                <xsl:attribute name="Value">
                    <xsl:value-of select="'cha-'"/>
                    <xsl:value-of select="substring($figalias, 1, 1)"/>
                    <!--Added [1] on 08-06-2020-->
                    <xsl:if test="descendant::span[@data-alias = 'ChapNo']">
                        <xsl:value-of select="'.'"/>
                        <xsl:value-of select="descendant::span[@data-alias = 'ChapNo'][1]"/>
                    </xsl:if>
                    
                    <xsl:if test="descendant::span[@data-alias = 'SeqNo']">
                        <xsl:value-of select="'.'"/>
                        <xsl:value-of select="descendant::span[@data-alias = 'SeqNo'][1]"/>
                        
                    </xsl:if>
                </xsl:attribute>
            
            </xsl:element>
            </xsl:if>
            
            <xsl:if test="$Alttext//artdetail[@data-artname = $data-artname][not(@data-position='inline')] and ($figalias = 'Caption')">
                <!-- Added for image missing on 21-4-2023 -->
            <xsl:for-each select="$Alttext//artdetail[@data-artname = $data-artname][not(@data-position='inline')]/current()">
                <xsl:element name="XMLAttribute">
                    <xsl:attribute name="Self">
                        <xsl:value-of select="'di2XMLAttributenxml:id'"/>
                    </xsl:attribute>
                    <xsl:attribute name="Name">
                        <xsl:value-of select="'xml:id'"/>
                    </xsl:attribute>
                    <xsl:attribute name="Value">
                        <xsl:value-of select="'cha-'"/>
                        <xsl:value-of select="'F.'"/>
                        <!--Added [1] on 08-06-2020-->
                        <xsl:variable name="id">
                            <xsl:value-of select="count(preceding::img)"/>
                        </xsl:variable>
                        <!--<xsl:value-of select="concat(substring-before($Alttext//artdetail[@data-artname = $data-artname][not(@data-position='inline')]/@data-artname,'.'),$id)"/>-->
                        <xsl:value-of select="concat(substring-before($Alttext//artdetail[@data-artname = $data-artname][not(@data-position='inline')]/current()/@data-artname,'.'),$id)"/>
                    </xsl:attribute>
                </xsl:element>
               </xsl:for-each>
            </xsl:if>
            
            <!-- added to the inline figures on 16-12-2014 -->
            <xsl:if test="$Alttext//artdetail[@data-artname = $data-artname][@data-position='inline'] and not(($figalias = 'Caption')) or descendant::span[@data-alias = 'ChapNo' or @data-alias = 'SeqNo'] and not($Alttext//artdetail[@data-artname = $data-artname])">
                <xsl:element name="XMLAttribute">
                    <xsl:attribute name="Self">
                        <xsl:value-of select="'di2XMLAttributenxml:id'"/>
                    </xsl:attribute>
                    <xsl:attribute name="Name">
                        <xsl:value-of select="'xml:id'"/>
                    </xsl:attribute>
                    <xsl:attribute name="Value">
                        <xsl:value-of select="'cha-'"/>
                        <xsl:value-of select="substring($figalias, 1, 1)"/>
                        <!--Added [1] on 08-06-2020-->
                        <xsl:if test="descendant::span[@data-alias = 'ChapNo']">
                            <xsl:value-of select="'.'"/>
                            <xsl:value-of select="descendant::span[@data-alias = 'ChapNo'][1]"/>
                        </xsl:if>
                        
                        <xsl:if test="descendant::span[@data-alias = 'SeqNo']">
                            <xsl:value-of select="'.'"/>
                            <xsl:value-of select="descendant::span[@data-alias = 'SeqNo'][1]"/>
                            
                        </xsl:if>
                    </xsl:attribute>
                    
                </xsl:element>
            </xsl:if>
            
            <xsl:if test="$Alttext//artdetail[@data-artname = $data-artname][@data-position='inline'] and ($figalias = 'Caption')">
                <!-- Added for image missing on 21-4-2023 -->
                <xsl:for-each select="$Alttext//artdetail[@data-artname = $data-artname][@data-position='inline']/current()">
                    <xsl:element name="XMLAttribute">
                        <xsl:attribute name="Self">
                            <xsl:value-of select="'di2XMLAttributenxml:id'"/>
                        </xsl:attribute>
                        <xsl:attribute name="Name">
                            <xsl:value-of select="'xml:id'"/>
                        </xsl:attribute>
                        <xsl:attribute name="Value">
                            <xsl:value-of select="'cha-'"/>
                            <xsl:value-of select="'F.'"/>
                            <!--Added [1] on 08-06-2020-->
                            <xsl:variable name="id">
                                <xsl:value-of select="count(preceding::img)"/>
                            </xsl:variable>
                            <!--<xsl:value-of select="concat(substring-before($Alttext//artdetail[@data-artname = $data-artname][not(@data-position='inline')]/@data-artname,'.'),$id)"/>-->
                            <xsl:value-of select="concat(substring-before($Alttext//artdetail[@data-artname = $data-artname][@data-position='inline']/current()/@data-artname,'.'),$id)"/>
                        </xsl:attribute>
                    </xsl:element>
                </xsl:for-each>
            </xsl:if>
            <!-- end -->
            
            
            <xsl:text disable-output-escaping="yes">&#x3C;/XMLElement&#x3E;</xsl:text>
            <!-- Added for paneer on 2024 -->
            <xsl:if test="parent::figure[not(@data-alias)]">
            <Br/>
            </xsl:if>
        </xsl:if>
        <!-- Table Caption XMLID(Created on 17.08.2017)-->
        <xsl:if test="($figalias = 'Table Caption') or ($figalias = 'TableCaption') or ($figalias = 'SupplTableCaption')">
            <xsl:element name="XMLAttribute">
                <xsl:attribute name="Self">
                    <xsl:value-of select="'di2XMLAttributenxml:id'"/>
                </xsl:attribute>
                <xsl:attribute name="Name">
                    <xsl:value-of select="'xml:id'"/>
                </xsl:attribute>
                <xsl:attribute name="Value">
                    <xsl:value-of select="'cha-'"/>
                    <xsl:value-of select="substring($figalias, 1, 1)"/>
                    <xsl:if test="descendant::span[@data-alias = 'ChapNo']">
                        <xsl:value-of select="'.'"/>
                        <xsl:value-of select="descendant::span[@data-alias = 'ChapNo']"/>
                    </xsl:if>
                    <xsl:if test="descendant::span[@data-alias = 'SeqNo']">
                        <xsl:value-of select="'.'"/>
                        <xsl:value-of select="descendant::span[@data-alias = 'SeqNo']"/>
                    </xsl:if>
                </xsl:attribute>
            </xsl:element>
            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2" Name="ContentControl" Value="True"/&#x3E;</xsl:text>
            <!--Updated {Mahesh} 15.11.2017-->
            <xsl:text disable-output-escaping="yes">&#x3C;/XMLElement&#x3E;</xsl:text>
            <!--Updated {Mahesh} 15.11.2017-->
            <Br/>
        </xsl:if>
        <!-- End Table Caption XMLID(Created on 17.08.2017)-->
        <xsl:if
            test="($figalias = 'Chapter Review') or ($figalias = 'PQ') or ($figalias = 'FT1') or ($figalias = 'FT2') or ($figalias = 'FT3') or ($figalias = 'FT4') or ($figalias = 'FT5') or ($figalias = 'FT6') or ($figalias = 'FT7') or ($figalias = 'FT8') or ($figalias = 'FT9') or ($figalias = 'FT10') or ($figalias = 'FF') or ($figalias = 'CS1') or ($figalias = 'CaseStudy') or ($figalias = 'Box-01') or ($figalias = 'Box-02') or ($figalias = 'Box-03') or ($figalias = 'Box-04') or ($figalias = 'Box-05') or ($figalias = 'Box-06') or ($figalias = 'Box-07') or ($figalias = 'Box-08') or ($figalias = 'Box-09') or ($figalias = 'Box-10') or ($figalias = 'FE-01') or ($figalias = 'FE-02') or ($figalias = 'FE-03') or ($figalias = 'FE-04') or ($figalias = 'FE-05') or ($figalias = 'FE-06') or ($figalias = 'FE-07') or ($figalias = 'FE-08') or ($figalias = 'FE-09') or ($figalias = 'FE-10') or ($figalias = 'Featured Element-01') or ($figalias = 'Featured Element-02') or ($figalias = 'Featured Element-03') or ($figalias = 'Featured Element-04') or ($figalias = 'Featured Element-05') or ($figalias = 'Featured Element-06') or ($figalias = 'Featured Element-07') or ($figalias = 'Featured Element-08') or ($figalias = 'Featured Element-09') or ($figalias = 'Featured Element-10') or ($figalias = 'FT11') or ($figalias = 'FT12') or ($figalias = 'FT13') or ($figalias = 'FT14') or ($figalias = 'FT15') or ($figalias = 'FT16') or ($figalias = 'FT17') or ($figalias = 'FT18') or ($figalias = 'FT19') or ($figalias = 'FT20') or ($figalias = 'Box-11') or ($figalias = 'Box-12') or ($figalias = 'Box-13') or ($figalias = 'Box-14') or ($figalias = 'Box-15') or ($figalias = 'Box-16') or ($figalias = 'Box-17') or ($figalias = 'Box-18') or ($figalias = 'Box-19') or ($figalias = 'Box-20') or ($figalias = 'FE-11') or ($figalias = 'FE-12') or ($figalias = 'FE-13') or ($figalias = 'FE-14') or ($figalias = 'FE-15') or ($figalias = 'FE-16') or ($figalias = 'FE-17') or ($figalias = 'FE-18') or ($figalias = 'FE-19') or ($figalias = 'FE-20') or ($figalias = 'Featured Element-11') or ($figalias = 'Featured Element-12') or ($figalias = 'Featured Element-13') or ($figalias = 'Featured Element-14') or ($figalias = 'Featured Element-15') or ($figalias = 'Featured Element-16') or ($figalias = 'Featured Element-17') or ($figalias = 'Featured Element-18') or ($figalias = 'Featured Element-19') or ($figalias = 'Featured Element-20') or ($figalias = 'Chapter Outline') or ($figalias = 'Case Study') or ($figalias = 'BOX1') or ($figalias = 'BOX2') or ($figalias = 'BOX3') or ($figalias = 'BOX4') or ($figalias = 'BOX5') or ($figalias = 'BOX6') or ($figalias = 'BOX7') or ($figalias = 'BOX8') or ($figalias = 'BOX9') or ($figalias = 'BOX10') or ($figalias = 'BOX11') or ($figalias = 'BOX12') or ($figalias = 'BOX13') or ($figalias = 'BOX14') or ($figalias = 'BOX15') or ($figalias = 'BOX16') or ($figalias = 'BOX17') or ($figalias = 'BOX18') or ($figalias = 'BOX19') or ($figalias = 'BOX20') or ($figalias = 'Abstract') or ($figalias = 'Learning Objectives') or ($figalias = 'ChapSum') or ($figalias = 'CaseStudy') or ($figalias = 'Standard Numbered Box')">
               <xsl:element name="XMLAttribute">
                <xsl:attribute name="Self">
                    <xsl:value-of select="'di2XMLAttributenxml:id'"/>
                </xsl:attribute>
                <xsl:attribute name="Name">
                    <xsl:value-of select="'xml:id'"/>
                </xsl:attribute>
                <xsl:attribute name="Value">
                    <xsl:value-of select="'cha-'"/>
                    <xsl:value-of select="substring($figalias, 1, 1)"/>
                    <!-- Commented to avoid the box number with inside citation chapter and seqno id Azure 11250 -->
                    <!-- descendant::span[@data-alias = 'ChapNo'] and not(descendant::a[descendant::span[@data-alias = 'ChapNo']]) -->
                    <xsl:choose>
                        <xsl:when
                            test="descendant::span[@data-alias = 'ChapNo'][not(ancestor::a)]">
                            <xsl:value-of select="'.'"/>
                            <xsl:value-of select="descendant::span[@data-alias = 'ChapNo'][not(ancestor::a)]"/>

                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:if test="not(descendant::span[@data-alias = 'SeqNo'][not(ancestor::a)][string-length(.) &gt; 0])">
                            <xsl:value-of select="'.'"/>
                            <xsl:value-of select="@data-alias"/>
                            <!-- Added to avoid the box unorder issue on 9-1-2024  Azure 12513-->
                            <xsl:if test="self::*[@data-alias]">
                                <xsl:value-of select="count(preceding::*[@data-alias][not(ancestor::*[@data-alias])])+1"/>
                            </xsl:if>
                            </xsl:if>
                          <!-- End -->
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:choose>
                    <!-- descendant::span[@data-alias = 'SeqNo'] and not(descendant::a[descendant::span[@data-alias = 'SeqNo']]) -->
                        <xsl:when
                            test="descendant::span[@data-alias = 'SeqNo'][not(ancestor::a)][string-length(.) &gt; 0]">
                            <xsl:value-of select="'.'"/>
                            <xsl:value-of select="descendant::span[@data-alias = 'SeqNo'][not(ancestor::a)]"/>
                             </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="'.'"/>
                            <xsl:value-of select="@data-tag"/>
                            <!-- Added to avoid the box unorder issue on 9-1-2024  Azure 12513-->
                            <xsl:if test="self::*[@data-alias]">
                                <xsl:value-of select="count(preceding::*[@data-alias][not(ancestor::*[@data-alias])])+1"/>
                            </xsl:if>
                            <!-- End -->
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
                <!-- Update on 21/8/2017 please check (Un number box(confirm 29/08))		
			<xsl:attribute name="Value">
					<xsl:value-of select="concat('cha','-','B')"/>
					<xsl:value-of select="concat('-',$figalias)"/>
					<xsl:value-of select="concat('-',$figtag)"/>
				</xsl:attribute>-->
            </xsl:element>
            <xsl:text disable-output-escaping="yes">&#x3C;/XMLElement&#x3E;</xsl:text>
            <Br/>
        </xsl:if>
        <xsl:if test="self::figure[string-length(.) &gt; 0][not(child::p)][not(child::figcaption)]">
            <CharacterStyleRange AppliedCharacterStyle="CharacterStyle/$ID/[No character style]">
                <Br/>
            </CharacterStyleRange>
        </xsl:if>
       <!-- Added for xmlelement under br for paneer  on 12-5-2023-->
        <xsl:if test="self::div[@data-alias][child::*] or self::figure[@data-alias]">
            <Br/>
        </xsl:if>
       <!--end-->
    </xsl:template>
    <!-- End Figure-->


    <!--TableSource,UN-TableSource,TBS,TSN 28.12.2017 {Mahesh}-->
    <xsl:template
        match="p[@data-name = 'TableSource'] | p[@data-name = 'TBS'] | p[@data-name = 'UN-TableSource'] | p[@data-name = 'TSN']">
        <xsl:variable name="aaa" select="@data-name"/>
        <xsl:if
            test="not(preceding-sibling::*[1][self::p[@data-name = 'TableSource'] | self::p[@data-name = 'UN-TableSource'] | self::p[@data-name = 'TBS'] | self::p[@data-name = 'TSN']])">
            <xsl:text disable-output-escaping="yes">&#x3C;XMLElement Self="di3" MarkupTag="XMLTag/Cell" XMLContent="u46"&#x3E;</xsl:text>
            <xsl:text>&#x000A;</xsl:text>
        </xsl:if>
        <xsl:text disable-output-escaping="yes">&#x3C;ParagraphStyleRange AppliedParagraphStyle="ParagraphStyle/</xsl:text>
        <xsl:value-of select="$aaa"/>
        <xsl:text disable-output-escaping="yes">"&#x3E;</xsl:text>
        <XMLElement Self="di3i712i56bi560i54bi548id6i55i53i116" MarkupTag="XMLTag/entry">
            <XMLElement Self="di3i712i56bi560i54bi548id6i55i53i116i115" MarkupTag="XMLTag/para">
                <xsl:apply-templates/>
                <XMLAttribute Self="di2XMLAttributenaid-pstyle" Name="aid:pstyle" Value="TSN"/>
            </XMLElement>
        </XMLElement>
        <xsl:text disable-output-escaping="yes">&#x3C;/ParagraphStyleRange&#x3E;</xsl:text>
        <xsl:text disable-output-escaping="yes">&#x3C;Br/&#x3E;</xsl:text>
        <xsl:if
            test="not(following-sibling::*[1][self::p[@data-name = 'TableSource'] | self::p[@data-name = 'UN-TableSource'] | self::p[@data-name = 'TBS'] | self::p[@data-name = 'TSN']])">
            <xsl:text disable-output-escaping="yes">&#x3C;/XMLElement&#x3E;</xsl:text>
        </xsl:if>
    </xsl:template>
    <!--End TableSource,UN-TableSource,TBS,TSN 28.12.2017 {Mahesh}-->

    <!-- Cell Table created on 08/01/2017-->
    <xsl:template match="table">
        <xsl:text>&#xA;</xsl:text>
        <xsl:variable name="cont"
            select="concat('ucbie', count(preceding-sibling::*[name() = name(current())]))"/>
        <!--<xsl:if test="not(ancestor::w:sdt)">
			<xsl:text>&#x000A;</xsl:text>
			<xsl:text disable-output-escaping="yes">&#x3C;XMLElement Self="di2" MarkupTag="XMLTag/table"&#x3E;</xsl:text>
			<xsl:text>&#x000A;</xsl:text>
		</xsl:if>-->
        <xsl:text>&#x000A;</xsl:text>
        <xsl:text disable-output-escaping="yes">&#x3C;XMLElement Self="di2" MarkupTag="XMLTag/tgroup"&#x3E;</xsl:text>
        <xsl:text>&#x000A;</xsl:text>
        <xsl:element name="Table">
            <xsl:attribute name="Self" select='"S4C001"'/>
            <xsl:attribute name="HeaderRowCount"/>
            <!--<xsl:attribute name="HeaderRowCount" select='"0"'/>-->
            <xsl:attribute name="FooterRowCount"/>
            <xsl:attribute name="FooterRowCount" select='"0"'/>
            <!--<xsl:attribute name="AppliedTableStyle" select='"TableStyle/$ID/[No table style]"'/>-->
            <!-- Added for different table styles on 18-7-2025 -->
            <xsl:choose>
                <xsl:when test="self::table[@class]">
                    <xsl:attribute name="AppliedTableStyle">
                        <xsl:value-of select="'TableStyle/'"/>
                        <xsl:value-of select="self::table[@class]/@class"/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="AppliedTableStyle" select='"TableStyle/$ID/[No table style]"'/>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:attribute name="TableDirection" select='"LeftToRightDirection"'/>
            <!-- Please Check 11.09.2017 -->
            <xsl:attribute name="ColumnCount">
                <xsl:choose>
                    <xsl:when test="colgroup/@cols">
                        <xsl:variable name="ss" select="colgroup/@cols"/>
                        <xsl:value-of select="$ss"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="@maxtd"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <!-- Added for continuation table columnHead on 04-08-2025  -->
            <!-- Added to avoid the table issue on 28-08-2025 -->
            <!--<xsl:variable name="dataname">
                <xsl:value-of select="$StylesCollect//style[contains(substring-after(@name,'DZP_'),'TableColumnHead') or contains(substring-after(@name,'DZP_'),'TableHead')]/@replacement"/>
            </xsl:variable>-->
            <xsl:variable name="HeaderRowCount">
                <!--<xsl:value-of select="count(self::table//tr[descendant::td/p[contains(@data-name,'TableColumnHead') or contains(@data-name,'TableHead')]])"/>-->
                <xsl:value-of select="count(self::table//tr[descendant::td/p[@data-name=$StylesCollect//style[contains(substring-after(@name,'DZP_'),'TableColumnHead') or contains(substring-after(@name,'DZP_'),'TableHead')]/@replacement or contains(@data-name,'TableColumnHead') or contains(@data-name,'TableHead')]])"/>
            </xsl:variable>
            <xsl:choose>
                <xsl:when test="string-length($HeaderRowCount) &gt; 0">
                    <xsl:attribute name="HeaderRowCount">
                        <xsl:value-of select="$HeaderRowCount"/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="HeaderRowCount" select='"0"'/>
                </xsl:otherwise>
            </xsl:choose>
            <!-- end -->
            <!--<xsl:attribute name="ColumnCount">
				<xsl:variable name="ss" select="(count(tr[1]/child::*) + sum(tr[1]/td/@colspan)) - count(tr[1]/td/@colspan)"/>
				<xsl:value-of select="$ss"/>
			</xsl:attribute>-->
            <!-- end-->
            <xsl:attribute name="BodyRowCount">
                <xsl:variable name="dd" select="count(tbody/tr)"/>
                <xsl:value-of select="($dd - $HeaderRowCount)"/>
            </xsl:attribute>
            <!--  Row attribute  Count -->
            <xsl:variable name="counter1" select="tr/td/width"/>
            <xsl:variable name="SingleColumnWidth" select="tr[1]/td[$counter1]/width/@Columnwidth"/>
            <xsl:for-each select="tbody/tr">
                <xsl:element name="Row">
                    <xsl:attribute name="Self" select="concat('ucbie2Row', position() - 1)"/>
                    <xsl:attribute name="Name" select="position() - 1"/>
                    <xsl:attribute name="SingleRowHeight">
                        <xsl:choose>
                            <xsl:when test="./w:trPr/w:trHeight">
                                <xsl:variable name="dd" select="./w:trPr/w:trHeight/@w:val"/>
                                <xsl:value-of select="$dd div 20"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="'16.25'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
                    <xsl:attribute name="MinimumHeight">
                        <xsl:choose>
                            <xsl:when test="./w:trPr/w:trHeight">
                                <xsl:variable name="dd" select="./w:trPr/w:trHeight/@w:val"/>
                                <xsl:value-of select="$dd div 20"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="'3'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
                    <xsl:attribute name="AutoGrow" select="'true'"/>
                </xsl:element>
                <xsl:variable name="trcount" select="count(tr)"/>
                <xsl:text>&#x000A;</xsl:text>
            </xsl:for-each>
            <!--  Column attribute  Count -->
            <xsl:variable name="count"
                select="xs:integer((count(tr[1]/child::*) + sum(tr[1]/td/@colspan)) - count(tr[1]/td/@colspan))"/>
            <xsl:for-each select="colgroup/col">
                <xsl:element name="Column">
                    <xsl:attribute name="Name">
                        <!--<xsl:variable name="ff" select="ancestor::colgroup/@cols"/>-->
                        <xsl:variable name="ff" select="position()"/>
                        <xsl:value-of select="$ff - 1"/>
                    </xsl:attribute>
                    <xsl:attribute name="Self">
                        <!--<xsl:variable name="ff1" select="./@colnum"/>-->
                        <xsl:variable name="ff1" select="position()"/>
                        <xsl:value-of select="concat('ucbie2Column', $ff1 - 1)"/>
                    </xsl:attribute>
                    <xsl:attribute name="SingleColumnWidth">
                        <xsl:value-of select="@width"/>
                    </xsl:attribute>
                </xsl:element>
            </xsl:for-each>
            <!--<xsl:for-each select="colgroup/colspec">
				<xsl:element name="Column">
					<xsl:attribute name="Name">
						<xsl:variable name="ff" select="./@colnum"/>
						<xsl:value-of select="$ff - 1"/>
					</xsl:attribute>
					<xsl:attribute name="Self">
						<xsl:variable name="ff1" select="./@colnum"/>
						<xsl:value-of select="concat('ucbie2Column',$ff1 - 1)"/>
					</xsl:attribute>
					<xsl:attribute name="SingleColumnWidth">
						<xsl:value-of select="@SingleColumnWidth"/>
					</xsl:attribute>
				</xsl:element>
			</xsl:for-each>-->
            <xsl:choose>
                <xsl:when test="tr/td">
                    <xsl:apply-templates select="tr[td]"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:element>
        <XMLAttribute Self="di3i5d1i5b3i592i55bi555i543i7ei2bXMLAttributenxmlns-aid4"
            Name="xmlns:aid4" Value="http://ns.adobe.com/AdobeInDesign/4.0/"/>
        <XMLAttribute Self="di3i5d1i5b3i592i55bi555i543i7ei2bXMLAttributenxmlns-aid5"
            Name="xmlns:aid5" Value="http://ns.adobe.com/AdobeInDesign/5.0/"/>
        <xsl:text disable-output-escaping="yes">&#x3C;/XMLElement&#x3E;</xsl:text>
        <xsl:text disable-output-escaping="yes">&#x3C;Br/&#x3E;</xsl:text>
        <xsl:text>&#x000A;</xsl:text>
        <!--<xsl:if test="not(ancestor::w:sdt)">
			<xsl:text disable-output-escaping="yes">&#x3C;/XMLElement&#x3E;</xsl:text>	
			<xsl:text disable-output-escaping="yes">&#x3C;Br/&#x3E;</xsl:text>
			<xsl:text>&#x000A;</xsl:text>
		</xsl:if>-->
    </xsl:template>


    <xsl:template match="td" name="T">
        <xsl:element name="Cell">
            <xsl:attribute name="Self"
                select="concat('ucbie', count(preceding-sibling::*[name() = name(current())]))"/>
            <xsl:variable name="cont"
                select="concat('ucbie', count(preceding-sibling::*[name() = name(current())]))"/>
            <xsl:attribute name="Name">
                <xsl:choose>
                    <xsl:when test="ancestor::td">
                        <xsl:variable name="tdd">
                            <xsl:value-of select="(ancestor::td/@J) - @J"/>
                        </xsl:variable>
                        <xsl:value-of select="replace(concat(@I, ':', $tdd), '-', '')"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="concat(@I, ':', @J)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:attribute name="RowSpan"/>
            <xsl:attribute name="RowSpan">
                <xsl:choose>
                    <xsl:when test="@rowspan">
                        <xsl:value-of select="@rowspan - 1"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="'1'"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:attribute name="ColumnSpan">
                <xsl:value-of select="@colspan"/>
            </xsl:attribute>
            <xsl:attribute name="AppliedCellStyle">
                <xsl:variable name="dd" select="./p[1]/@data-name"/>
                <xsl:variable name="emptycell" select="self::td[@class='emptypara']/@data-name"/>
                <xsl:value-of select="'CellStyle/'"/>
                <!--<xsl:value-of select="$dd"/>-->
                <xsl:choose>
                    <xsl:when test="string-length($dd)">
                        <xsl:value-of select="$dd"/>
                    </xsl:when>
                    <xsl:otherwise><xsl:value-of select="$emptycell"/></xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:variable name="Alig">
                <xsl:if test="@Align">
                    <xsl:variable name="test" select="string(@Align) cast as xs:decimal"/>
                    <xsl:value-of select="$test div 20"/>
                </xsl:if>
            </xsl:variable>
            <XMLElement Self="di3i712i56bi560i54bi548id6i55i1c" MarkupTag="XMLTag/Cell"
                XMLContent="u4652i3c60i38">
                <Properties>
                    <TabList type="list">
                        <ListItem type="record">
                            <Alignment type="enumeration">CharacterAlign</Alignment>
                            <Leader type="string"/>
                            <Position>
                                <xsl:attribute name="type" select="unit"/>
                                <xsl:value-of select="$Alig"/>
                            </Position>
                        </ListItem>
                    </TabList>
                </Properties>
                <XMLElement Self="di2i3c1i3bfi3b4i3aai94i93i2ei2di30" MarkupTag="XMLTag/entry">
                    <XMLElement Self="di2i3c1i3bfi3b4i3aai94i93i2ei2di30i2f" MarkupTag="XMLTag/para">
                        <xsl:apply-templates/>
                    </XMLElement>
                </XMLElement>
            </XMLElement>
        </xsl:element>
    </xsl:template>
    <!-- end Cell Table-->
    
    <xsl:character-map name="Ascii2Unicode">
        <!-- isoboxmap.xsl -->
        <xsl:output-character character="●" string="&amp;#x25CF;"/>
        <xsl:output-character character="┐" string="&amp;#x2510;"/>
        <xsl:output-character character="╕" string="&amp;#x2556;"/>
        <xsl:output-character character="╖" string="&amp;#x2557;"/>
        <xsl:output-character character="╗" string="&amp;#x2555;"/>
        <xsl:output-character character="┌" string="&amp;#x250C;"/>
        <xsl:output-character character="╒" string="&amp;#x2554;"/>
        <xsl:output-character character="╓" string="&amp;#x2553;"/>
        <xsl:output-character character="╔" string="&amp;#x2552;"/>
        <xsl:output-character character="─" string="&amp;#x2500;"/>
        <xsl:output-character character="═" string="&amp;#x2550;"/>
        <xsl:output-character character="┬" string="&amp;#x252C;"/>
        <xsl:output-character character="╥" string="&amp;#x2564;"/>
        <xsl:output-character character="╤" string="&amp;#x2566;"/>
        <xsl:output-character character="╦" string="&amp;#x2565;"/>
        <xsl:output-character character="┴" string="&amp;#x2534;"/>
        <xsl:output-character character="╨" string="&amp;#x2567;"/>
        <xsl:output-character character="╧" string="&amp;#x2569;"/>
        <xsl:output-character character="╩" string="&amp;#x2568;"/>
        <xsl:output-character character="┘" string="&amp;#x2518;"/>
        <xsl:output-character character="╛" string="&amp;#x255D;"/>
        <xsl:output-character character="╜" string="&amp;#x255C;"/>
        <xsl:output-character character="╝" string="&amp;#x255B;"/>
        <xsl:output-character character="└" string="&amp;#x2514;"/>
        <xsl:output-character character="╘" string="&amp;#x2559;"/>
        <xsl:output-character character="╙" string="&amp;#x255A;"/>
        <xsl:output-character character="╚" string="&amp;#x2558;"/>
        <xsl:output-character character="│" string="&amp;#x2502;"/>
        <xsl:output-character character="║" string="&amp;#x2551;"/>
        <xsl:output-character character="┼" string="&amp;#x253C;"/>
        <xsl:output-character character="╪" string="&amp;#x256A;"/>
        <xsl:output-character character="╫" string="&amp;#x256C;"/>
        <xsl:output-character character="╬" string="&amp;#x256B;"/>
        <xsl:output-character character="┤" string="&amp;#x2524;"/>
        <xsl:output-character character="╡" string="&amp;#x2561;"/>
        <xsl:output-character character="╢" string="&amp;#x2563;"/>
        <xsl:output-character character="╣" string="&amp;#x2562;"/>
        <xsl:output-character character="├" string="&amp;#x251C;"/>
        <xsl:output-character character="╞" string="&amp;#x255E;"/>
        <xsl:output-character character="╟" string="&amp;#x2560;"/>
        <xsl:output-character character="╠" string="&amp;#x255F;"/>
        <!-- isocyr1map.xsl -->
        <xsl:output-character character="а" string="&amp;#x0430;"/>
        <xsl:output-character character="А" string="&amp;#x0410;"/>
        <xsl:output-character character="б" string="&amp;#x0431;"/>
        <xsl:output-character character="Б" string="&amp;#x0411;"/>
        <xsl:output-character character="ч" string="&amp;#x0447;"/>
        <xsl:output-character character="Ч" string="&amp;#x0427;"/>
        <xsl:output-character character="д" string="&amp;#x0434;"/>
        <xsl:output-character character="Д" string="&amp;#x0414;"/>
        <xsl:output-character character="э" string="&amp;#x044D;"/>
        <xsl:output-character character="Э" string="&amp;#x042D;"/>
        <xsl:output-character character="ф" string="&amp;#x0444;"/>
        <xsl:output-character character="Ф" string="&amp;#x0424;"/>
        <xsl:output-character character="г" string="&amp;#x0433;"/>
        <xsl:output-character character="Г" string="&amp;#x0413;"/>
        <xsl:output-character character="ъ" string="&amp;#x044A;"/>
        <xsl:output-character character="Ъ" string="&amp;#x042A;"/>
        <xsl:output-character character="и" string="&amp;#x0438;"/>
        <xsl:output-character character="И" string="&amp;#x0418;"/>
        <xsl:output-character character="е" string="&amp;#x0435;"/>
        <xsl:output-character character="Е" string="&amp;#x0415;"/>
        <xsl:output-character character="ё" string="&amp;#x0451;"/>
        <xsl:output-character character="Ё" string="&amp;#x0401;"/>
        <xsl:output-character character="й" string="&amp;#x0439;"/>
        <xsl:output-character character="Й" string="&amp;#x0419;"/>
        <xsl:output-character character="к" string="&amp;#x043A;"/>
        <xsl:output-character character="К" string="&amp;#x041A;"/>
        <xsl:output-character character="х" string="&amp;#x0445;"/>
        <xsl:output-character character="Х" string="&amp;#x0425;"/>
        <xsl:output-character character="л" string="&amp;#x043B;"/>
        <xsl:output-character character="Л" string="&amp;#x041B;"/>
        <xsl:output-character character="м" string="&amp;#x043C;"/>
        <xsl:output-character character="М" string="&amp;#x041C;"/>
        <xsl:output-character character="н" string="&amp;#x043D;"/>
        <xsl:output-character character="Н" string="&amp;#x041D;"/>
        <xsl:output-character character="№" string="&amp;#x2116;"/>
        <xsl:output-character character="о" string="&amp;#x043E;"/>
        <xsl:output-character character="О" string="&amp;#x041E;"/>
        <xsl:output-character character="п" string="&amp;#x043F;"/>
        <xsl:output-character character="П" string="&amp;#x041F;"/>
        <xsl:output-character character="р" string="&amp;#x0440;"/>
        <xsl:output-character character="Р" string="&amp;#x0420;"/>
        <xsl:output-character character="с" string="&amp;#x0441;"/>
        <xsl:output-character character="С" string="&amp;#x0421;"/>
        <xsl:output-character character="щ" string="&amp;#x0449;"/>
        <xsl:output-character character="Щ" string="&amp;#x0429;"/>
        <xsl:output-character character="ш" string="&amp;#x0448;"/>
        <xsl:output-character character="Ш" string="&amp;#x0428;"/>
        <xsl:output-character character="ь" string="&amp;#x044C;"/>
        <xsl:output-character character="Ь" string="&amp;#x042C;"/>
        <xsl:output-character character="т" string="&amp;#x0442;"/>
        <xsl:output-character character="Т" string="&amp;#x0422;"/>
        <xsl:output-character character="ц" string="&amp;#x0446;"/>
        <xsl:output-character character="Ц" string="&amp;#x0426;"/>
        <xsl:output-character character="у" string="&amp;#x0443;"/>
        <xsl:output-character character="У" string="&amp;#x0423;"/>
        <xsl:output-character character="в" string="&amp;#x0432;"/>
        <xsl:output-character character="В" string="&amp;#x0412;"/>
        <xsl:output-character character="я" string="&amp;#x044F;"/>
        <xsl:output-character character="Я" string="&amp;#x042F;"/>
        <xsl:output-character character="ы" string="&amp;#x044B;"/>
        <xsl:output-character character="Ы" string="&amp;#x042B;"/>
        <xsl:output-character character="ю" string="&amp;#x044E;"/>
        <xsl:output-character character="Ю" string="&amp;#x042E;"/>
        <xsl:output-character character="з" string="&amp;#x0437;"/>
        <xsl:output-character character="З" string="&amp;#x0417;"/>
        <xsl:output-character character="ж" string="&amp;#x0436;"/>
        <xsl:output-character character="Ж" string="&amp;#x0416;"/>
        <!-- isocyr2map.xsl -->
        <xsl:output-character character="ђ" string="&amp;#x0452;"/>
        <xsl:output-character character="Ђ" string="&amp;#x0402;"/>
        <xsl:output-character character="ѕ" string="&amp;#x0455;"/>
        <xsl:output-character character="Ѕ" string="&amp;#x0405;"/>
        <xsl:output-character character="џ" string="&amp;#x045F;"/>
        <xsl:output-character character="Џ" string="&amp;#x040F;"/>
        <xsl:output-character character="ѓ" string="&amp;#x0453;"/>
        <xsl:output-character character="Ѓ" string="&amp;#x0403;"/>
        <xsl:output-character character="і" string="&amp;#x0456;"/>
        <xsl:output-character character="І" string="&amp;#x0406;"/>
        <xsl:output-character character="ј" string="&amp;#x0458;"/>
        <xsl:output-character character="Ј" string="&amp;#x0408;"/>
        <xsl:output-character character="є" string="&amp;#x0454;"/>
        <xsl:output-character character="Є" string="&amp;#x0404;"/>
        <xsl:output-character character="ќ" string="&amp;#x045C;"/>
        <xsl:output-character character="Ќ" string="&amp;#x040C;"/>
        <xsl:output-character character="љ" string="&amp;#x0459;"/>
        <xsl:output-character character="Љ" string="&amp;#x0409;"/>
        <xsl:output-character character="њ" string="&amp;#x045A;"/>
        <xsl:output-character character="Њ" string="&amp;#x040A;"/>
        <xsl:output-character character="ћ" string="&amp;#x045B;"/>
        <xsl:output-character character="Ћ" string="&amp;#x040B;"/>
        <xsl:output-character character="ў" string="&amp;#x045E;"/>
        <xsl:output-character character="Ў" string="&amp;#x040E;"/>
        <xsl:output-character character="ї" string="&amp;#x0457;"/>
        <xsl:output-character character="Ї" string="&amp;#x0407;"/>
        <!-- isodiamap.xsl -->
        <xsl:output-character character="´" string="&amp;#x00B4;"/>
        <xsl:output-character character="˘" string="&amp;#x02D8;"/>
        <xsl:output-character character="ˇ" string="&amp;#x02C7;"/>
        <xsl:output-character character="¸" string="&amp;#x00B8;"/>
        <xsl:output-character character="ˆ" string="&amp;#x2218;"/>
        <xsl:output-character character="˝" string="&amp;#x02DD;"/>
        <xsl:output-character character="¨" string="&amp;#x00A8;"/>
        <xsl:output-character character="˙" string="&amp;#x02D9;"/>
        <!--U00060 grave-->
        <xsl:output-character character="¯" string="&amp;#x00AF;"/>
        <xsl:output-character character="˛" string="&amp;#x02DB;"/>
        <xsl:output-character character="˚" string="&amp;#x02DA;"/>
        <xsl:output-character character="˜" string="&amp;#x007E;"/>
        <xsl:output-character character="¨" string="&amp;#x00A8;"/>
        <!-- isolat1map.xsl -->
        <xsl:output-character character="á" string="&amp;#x00E1;"/>
        <xsl:output-character character="Á" string="&amp;#x00C1;"/>
        <xsl:output-character character="â" string="&amp;#x00E2;"/>
        <xsl:output-character character="Â" string="&amp;#x00C2;"/>
        <xsl:output-character character="æ" string="&amp;#x00E6;"/>
        <xsl:output-character character="Æ" string="&amp;#x00C6;"/>
        <xsl:output-character character="à" string="&amp;#x00E0;"/>
        <xsl:output-character character="À" string="&amp;#x00C0;"/>
        <xsl:output-character character="å" string="&amp;#x00E5;"/>
        <xsl:output-character character="Å" string="&amp;#x00C5;"/>
        <xsl:output-character character="ã" string="&amp;#x00E3;"/>
        <xsl:output-character character="Ã" string="&amp;#x00C3;"/>
        <xsl:output-character character="ä" string="&amp;#x00E4;"/>
        <xsl:output-character character="Ä" string="&amp;#x00C4;"/>
        <xsl:output-character character="ç" string="&amp;#x00E7;"/>
        <xsl:output-character character="Ç" string="&amp;#x00C7;"/>
        <xsl:output-character character="é" string="&amp;#x00E9;"/>
        <xsl:output-character character="É" string="&amp;#x00C9;"/>
        <xsl:output-character character="ê" string="&amp;#x00EA;"/>
        <xsl:output-character character="Ê" string="&amp;#x00CA;"/>
        <xsl:output-character character="è" string="&amp;#x00E8;"/>
        <xsl:output-character character="È" string="&amp;#x00C8;"/>
        <xsl:output-character character="ð" string="&amp;#x00F0;"/>
        <xsl:output-character character="Ð" string="&amp;#x00D0;"/>
        <xsl:output-character character="ë" string="&amp;#x00EB;"/>
        <xsl:output-character character="Ë" string="&amp;#x00CB;"/>
        <xsl:output-character character="í" string="&amp;#x00ED;"/>
        <xsl:output-character character="Í" string="&amp;#x00CD;"/>
        <xsl:output-character character="î" string="&amp;#x00EE;"/>
        <xsl:output-character character="Î" string="&amp;#x00CE;"/>
        <xsl:output-character character="ì" string="&amp;#x00EC;"/>
        <xsl:output-character character="Ì" string="&amp;#x00CC;"/>
        <xsl:output-character character="ï" string="&amp;#x00EF;"/>
        <xsl:output-character character="Ï" string="&amp;#x00CF;"/>
        <xsl:output-character character="ñ" string="&amp;#x00F1;"/>
        <xsl:output-character character="Ñ" string="&amp;#x00D1;"/>
        <xsl:output-character character="ó" string="&amp;#x00F3;"/>
        <xsl:output-character character="Ó" string="&amp;#x00D3;"/>
        <xsl:output-character character="ô" string="&amp;#x00F4;"/>
        <xsl:output-character character="Ô" string="&amp;#x00D4;"/>
        <xsl:output-character character="ò" string="&amp;#x00F2;"/>
        <xsl:output-character character="Ò" string="&amp;#x00D2;"/>
        <xsl:output-character character="ø" string="&amp;#x00F8;"/>
        <xsl:output-character character="Ø" string="&amp;#x00D8;"/>
        <xsl:output-character character="õ" string="&amp;#x00F5;"/>
        <xsl:output-character character="Õ" string="&amp;#x00D5;"/>
        <xsl:output-character character="ö" string="&amp;#x00F6;"/>
        <xsl:output-character character="Ö" string="&amp;#x00D6;"/>
        <xsl:output-character character="ß" string="&amp;#x00DF;"/>
        <xsl:output-character character="þ" string="&amp;#x00FE;"/>
        <xsl:output-character character="Þ" string="&amp;#x00DE;"/>
        <xsl:output-character character="ú" string="&amp;#x00FA;"/>
        <xsl:output-character character="Ú" string="&amp;#x00DA;"/>
        <!--28-6-2019-->
        <xsl:output-character character="Û" string="&amp;#x00DB;"/>
        <xsl:output-character character="û" string="&amp;#x00FB;"/>

        <xsl:output-character character="ù" string="&amp;#x00F9;"/>
        <xsl:output-character character="Ù" string="&amp;#x00D9;"/>
        <xsl:output-character character="ü" string="&amp;#x00FC;"/>
        <xsl:output-character character="Ü" string="&amp;#x00DC;"/>
        <xsl:output-character character="ý" string="&amp;#x00FD;"/>
        <xsl:output-character character="Ý" string="&amp;#x00DD;"/>
        <xsl:output-character character="ÿ" string="&amp;#x00FF;"/>
        <!-- isolat2map.xsl -->
        <xsl:output-character character="ă" string="&amp;#x0103;"/>
        <xsl:output-character character="Ă" string="&amp;#x0102;"/>
        <xsl:output-character character="ā" string="&amp;#x0101;"/>
        <xsl:output-character character="Ā" string="&amp;#x0100;"/>
        <xsl:output-character character="ą" string="&amp;#x0105;"/>
        <xsl:output-character character="Ą" string="&amp;#x0104;"/>
        <xsl:output-character character="ć" string="&amp;#x0107;"/>
        <xsl:output-character character="Ć" string="&amp;#x0106;"/>
        <xsl:output-character character="č" string="&amp;#x010D;"/>
        <xsl:output-character character="Č" string="&amp;#x010C;"/>
        <xsl:output-character character="ĉ" string="&amp;#x0109;"/>
        <xsl:output-character character="Ĉ" string="&amp;#x0108;"/>
        <xsl:output-character character="ċ" string="&amp;#x00B7;"/>
        <xsl:output-character character="Ċ" string="&amp;#x010A;"/>
        <xsl:output-character character="ď" string="&amp;#x010F;"/>
        <xsl:output-character character="Ď" string="&amp;#x010E;"/>
        <xsl:output-character character="đ" string="&amp;#x0111;"/>
        <xsl:output-character character="Đ" string="&amp;#x0110;"/>
        <xsl:output-character character="ě" string="&amp;#x011B;"/>
        <xsl:output-character character="Ě" string="&amp;#x011A;"/>
        <xsl:output-character character="ė" string="&amp;#x0117;"/>
        <xsl:output-character character="Ė" string="&amp;#x0116;"/>
        <xsl:output-character character="ē" string="&amp;#x0113;"/>
        <xsl:output-character character="Ē" string="&amp;#x0112;"/>
        <xsl:output-character character="ŋ" string="&amp;#x014B;"/>
        <xsl:output-character character="Ŋ" string="&amp;#x014A;"/>
        <xsl:output-character character="ę" string="&amp;#x0119;"/>
        <xsl:output-character character="Ę" string="&amp;#x0118;"/>
        <xsl:output-character character="ǵ" string="&amp;#x01F5;"/>
        <xsl:output-character character="ğ" string="&amp;#x011F;"/>
        <xsl:output-character character="Ğ" string="&amp;#x011E;"/>
        <xsl:output-character character="Ģ" string="&amp;#x0122;"/>
        <xsl:output-character character="ĝ" string="&amp;#x011D;"/>
        <xsl:output-character character="Ĝ" string="&amp;#x011C;"/>
        <xsl:output-character character="ġ" string="&amp;#x0121;"/>
        <xsl:output-character character="Ġ" string="&amp;#x0120;"/>
        <xsl:output-character character="ĥ" string="&amp;#x0125;"/>
        <xsl:output-character character="Ĥ" string="&amp;#x0124;"/>
        <xsl:output-character character="ħ" string="&amp;#x0127;"/>
        <xsl:output-character character="Ħ" string="&amp;#x0126;"/>
        <xsl:output-character character="İ" string="&amp;#x0130;"/>
        <xsl:output-character character="ĳ" string="&amp;#x0133;"/>
        <xsl:output-character character="Ĳ" string="&amp;#x0132;"/>
        <xsl:output-character character="ī" string="&amp;#x012B;"/>
        <xsl:output-character character="Ī" string="&amp;#x012A;"/>
        <xsl:output-character character="ı" string="&amp;#x0131;"/>
        <xsl:output-character character="į" string="&amp;#x012F;"/>
        <xsl:output-character character="Į" string="&amp;#x012E;"/>
        <xsl:output-character character="ĩ" string="&amp;#x0129;"/>
        <xsl:output-character character="Ĩ" string="&amp;#x0128;"/>
        <xsl:output-character character="ĵ" string="&amp;#x0135;"/>
        <xsl:output-character character="Ĵ" string="&amp;#x0134;"/>
        <xsl:output-character character="ķ" string="&amp;#x0137;"/>
        <xsl:output-character character="Ķ" string="&amp;#x0136;"/>
        <xsl:output-character character="ĸ" string="&amp;#x0138;"/>
        <xsl:output-character character="ĺ" string="&amp;#x013A;"/>
        <xsl:output-character character="Ĺ" string="&amp;#x0139;"/>
        <xsl:output-character character="ľ" string="&amp;#x013E;"/>
        <xsl:output-character character="Ľ" string="&amp;#x013D;"/>
        <xsl:output-character character="ļ" string="&amp;#x013C;"/>
        <xsl:output-character character="Ļ" string="&amp;#x013B;"/>
        <xsl:output-character character="ŀ" string="&amp;#x0140;"/>
        <xsl:output-character character="Ŀ" string="&amp;#x013F;"/>
        <xsl:output-character character="ł" string="&amp;#x0142;"/>
        <xsl:output-character character="Ł" string="&amp;#x0141;"/>
        <xsl:output-character character="ń" string="&amp;#x0144;"/>
        <xsl:output-character character="Ń" string="&amp;#x0143;"/>
        <xsl:output-character character="ŉ" string="&amp;#x0149;"/>
        <xsl:output-character character="ň" string="&amp;#x0148;"/>
        <xsl:output-character character="Ň" string="&amp;#x0147;"/>
        <xsl:output-character character="ņ" string="&amp;#x0146;"/>
        <xsl:output-character character="Ņ" string="&amp;#x0145;"/>
        <xsl:output-character character="ő" string="&amp;#x0151;"/>
        <xsl:output-character character="Ő" string="&amp;#x0150;"/>
        <xsl:output-character character="œ" string="&amp;#x0153;"/>
        <xsl:output-character character="Œ" string="&amp;#x0152;"/>
        <xsl:output-character character="ō" string="&amp;#x014D;"/>
        <xsl:output-character character="Ō" string="&amp;#x014C;"/>
        <xsl:output-character character="ŕ" string="&amp;#x0155;"/>
        <xsl:output-character character="Ŕ" string="&amp;#x0154;"/>
        <xsl:output-character character="ř" string="&amp;#x0159;"/>
        <xsl:output-character character="Ř" string="&amp;#x0158;"/>
        <xsl:output-character character="ŗ" string="&amp;#x0157;"/>
        <xsl:output-character character="Ŗ" string="&amp;#x0156;"/>
        <xsl:output-character character="ś" string="&amp;#x015B;"/>
        <xsl:output-character character="Ś" string="&amp;#x015A;"/>
        <xsl:output-character character="š" string="&amp;#x0161;"/>
        <xsl:output-character character="Š" string="&amp;#x0160;"/>
        <xsl:output-character character="ş" string="&amp;#x015F;"/>
        <xsl:output-character character="Ş" string="&amp;#x015E;"/>
        <xsl:output-character character="ŝ" string="&amp;#x015D;"/>
        <xsl:output-character character="Ŝ" string="&amp;#x015C;"/>
        <xsl:output-character character="ť" string="&amp;#x0165;"/>
        <xsl:output-character character="Ť" string="&amp;#x0164;"/>
        <xsl:output-character character="ţ" string="&amp;#x0163;"/>
        <xsl:output-character character="Ţ" string="&amp;#x0162;"/>
        <xsl:output-character character="ŧ" string="&amp;#x0167;"/>
        <xsl:output-character character="Ŧ" string="&amp;#x0166;"/>
        <xsl:output-character character="ŭ" string="&amp;#x016D;"/>
        <xsl:output-character character="Ŭ" string="&amp;#x016C;"/>
        <xsl:output-character character="ű" string="&amp;#x0171;"/>
        <xsl:output-character character="Ű" string="&amp;#x0170;"/>
        <xsl:output-character character="ū" string="&amp;#x016B;"/>
        <xsl:output-character character="Ū" string="&amp;#x016A;"/>
        <xsl:output-character character="ų" string="&amp;#x0173;"/>
        <xsl:output-character character="Ų" string="&amp;#x0172;"/>
        <xsl:output-character character="ů" string="&amp;#x016F;"/>
        <xsl:output-character character="Ů" string="&amp;#x016E;"/>
        <xsl:output-character character="ũ" string="&amp;#x0169;"/>
        <xsl:output-character character="Ũ" string="&amp;#x0168;"/>
        <xsl:output-character character="ŵ" string="&amp;#x0175;"/>
        <xsl:output-character character="Ŵ" string="&amp;#x0174;"/>
        <xsl:output-character character="ŷ" string="&amp;#x0177;"/>
        <xsl:output-character character="Ŷ" string="&amp;#x0176;"/>
        <xsl:output-character character="Ÿ" string="&amp;#x0178;"/>
        <xsl:output-character character="ź" string="&amp;#x017A;"/>
        <xsl:output-character character="Ź" string="&amp;#x0179;"/>
        <xsl:output-character character="ž" string="&amp;#x017E;"/>
        <xsl:output-character character="Ž" string="&amp;#x017D;"/>
        <xsl:output-character character="ż" string="&amp;#x017C;"/>
        <xsl:output-character character="Ż" string="&amp;#x017B;"/>
        <!-- isonummap.xsl -->
        <!--U00026 amp-->
        <xsl:output-character character="'" string="&amp;#x0027;"/>
        <xsl:output-character character="*" string="&amp;#x002A;"/>
        <xsl:output-character character="¦" string="&amp;#x00A6;"/>
        <!--U0005C bsol-->
        <xsl:output-character character="¢" string="&amp;#x00A2;"/>
        <!--U0003A colon-->
        <!--U0002C comma-->
        <!--U00040 commat-->
        <xsl:output-character character="©" string="&amp;#x00A9;"/>
        <xsl:output-character character="¤" string="&amp;#x00A4;"/>
        <xsl:output-character character="↓" string="&amp;#x2193;"/>
        <xsl:output-character character="°" string="&amp;#x00B0;"/>
        <xsl:output-character character="÷" string="&amp;#x00F7;"/>
        <!--U00024 dollar-->
        <!--U0003D equals-->
        <xsl:output-character character="=" string="&amp;#x003D;"/>
        <!--U00021 excl-->
        <xsl:output-character character="½" string="&amp;#x00BD;"/>
        <xsl:output-character character="¼" string="&amp;#x00BC;"/>
        <xsl:output-character character="⅛" string="&amp;#x215B;"/>
        <xsl:output-character character="¾" string="&amp;#x00BE;"/>
        <xsl:output-character character="⅜" string="&amp;#x215C;"/>
        <xsl:output-character character="⅝" string="&amp;#x215D;"/>
        <xsl:output-character character="⅞" string="&amp;#x215E;"/>
        <!--U0003E gt-->
        <xsl:output-character character="½" string="&amp;#x00BD;"/>
        <xsl:output-character character="―" string="&amp;#x2015;"/>
        <xsl:output-character character="‐" string="&amp;#x002D;"/>
        <xsl:output-character character="¡" string="&amp;#x00A1;"/>
        <xsl:output-character character="¿" string="&amp;#x00BF;"/>
        <xsl:output-character character="«" string="&amp;#x00AB;"/>
        <xsl:output-character character="←" string="&amp;#x2190;"/>
        <!--U0007B lcub-->
        <xsl:output-character character="“" string="&amp;#x201C;"/>
        <!--U0005F lowbar-->
        <!--U00028 lpar-->
        <!--U0005B lsqb-->
        <xsl:output-character character="‘" string="&amp;#x2018;"/>
        <!--U0003C lt-->
        <xsl:output-character character="µ" string="&amp;#x00B5;"/>
        <xsl:output-character character="·" string="&amp;#x00B7;"/>
        <xsl:output-character character=" " string="&amp;#x00A0;"/>
        <xsl:output-character character="¬" string="&amp;#x00AC;"/>
        <!--U00023 num-->
        <xsl:output-character character="Ω" string="&amp;#x2126;"/>
        <xsl:output-character character="ª" string="&amp;#x00AA;"/>
        <xsl:output-character character="º" string="&amp;#x00BA;"/>
        <xsl:output-character character="¶" string="&amp;#x00B6;"/>
        <xsl:output-character character="%" string="&amp;#x0025;"/>
        <!--U0002E period-->
        <xsl:output-character character="+" string="&amp;#x002B;"/>
        <xsl:output-character character="±" string="&amp;#x00B1;"/>
        <xsl:output-character character="£" string="&amp;#x00A3;"/>
        <!--U0003F quest-->
        <!--U00022 quot-->
        <xsl:output-character character="»" string="&amp;#x00BB;"/>
        <xsl:output-character character="→" string="&amp;#x2192;"/>
        <!--U0007D rcub-->
        <xsl:output-character character="”" string="&amp;#x201D;"/>
        <xsl:output-character character="®" string="&amp;#x00AE;"/>
        <!--U00029 rpar-->
        <!--U0005D rsqb-->
        <xsl:output-character character="’" string="&amp;#x2019;"/>
        <xsl:output-character character="§" string="&amp;#x00A7;"/>
        <!--U0003B semi-->
        <xsl:output-character character="­" string="&amp;#x00AD;"/>
        <!--U0002F sol-->
        <xsl:output-character character="♪" string="&amp;#x2669;"/>
        <xsl:output-character character="¹" string="&amp;#x00B9;"/>
        <xsl:output-character character="²" string="&amp;#x00B2;"/>
        <xsl:output-character character="³" string="&amp;#x00B3;"/>
        <xsl:output-character character="×" string="&amp;#x00D7;"/>
        <xsl:output-character character="™" string="&amp;#x2122;"/>
        <xsl:output-character character="↑" string="&amp;#x2191;"/>
        <!--U0007C verbar-->
        <xsl:output-character character="¥" string="&amp;#x00A5;"/>
        <!-- isopubmap.xsl -->
        <xsl:output-character character="␣" string="&amp;#x2423;"/>
        <xsl:output-character character="▒" string="&amp;#x2592;"/>
        <xsl:output-character character="░" string="&amp;#x2591;"/>
        <xsl:output-character character="▓" string="&amp;#x2593;"/>
        <xsl:output-character character="█" string="&amp;#x2588;"/>
        <xsl:output-character character="•" string="&amp;#x2022;"/>
        <xsl:output-character character="⁁" string="&amp;#x2041;"/>
        <xsl:output-character character="✓" string="&amp;#x2713;"/>
        <xsl:output-character character="○" string="&amp;#x25CB;"/>
        <xsl:output-character character="♣" string="&amp;#x2663;"/>
        <xsl:output-character character="℗" string="&amp;#x2117;"/>
        <xsl:output-character character="✗" string="&amp;#x2717;"/>
        <xsl:output-character character="†" string="&amp;#x2020;"/>
        <xsl:output-character character="‡" string="&amp;#x2021;"/>
        <xsl:output-character character="‐" string="&amp;#x2010;"/>
        <xsl:output-character character="♦" string="&amp;#x2666;"/>
        <xsl:output-character character="⌍" string="&amp;#x230D;"/>
        <xsl:output-character character="⌌" string="&amp;#x230C;"/>
        <xsl:output-character character="▿" string="&amp;#x25BF;"/>
        <xsl:output-character character="▾" string="&amp;#x25BE;"/>
        <xsl:output-character character=" " string="&#160;&#160;"/>
        <xsl:output-character character=" " string="&amp;#x2004;"/>
        <xsl:output-character character=" " string="&amp;#x2003;"/>
        <xsl:output-character character=" " string="&amp;#x2005;"/>
        <xsl:output-character character=" " string="&amp;#x2002;"/>
        <!--Updated Enspace Entity {03.01.2018}-->
        <xsl:output-character character=" " string="&#160;"/>
        <xsl:output-character character="♀" string="&amp;#x2640;"/>
        <xsl:output-character character="ﬃ" string="&amp;#xFB03;"/>
        <xsl:output-character character="ﬀ" string="&amp;#xFB00;"/>
        <xsl:output-character character="ﬄ" string="&amp;#xFB04;"/>
        <xsl:output-character character="ﬁ" string="&amp;#xFB01;"/>
        <xsl:output-character character="♭" string="&amp;#x266D;"/>
        <xsl:output-character character="ﬂ" string="&amp;#xFB02;"/>
        <xsl:output-character character="⅓" string="&amp;#x2153;"/>
        <xsl:output-character character="⅕" string="&amp;#x2155;"/>
        <xsl:output-character character="⅙" string="&amp;#x2159;"/>
        <xsl:output-character character="⅔" string="&amp;#x2154;"/>
        <xsl:output-character character="⅖" string="&amp;#x2156;"/>
        <xsl:output-character character="⅗" string="&amp;#x2157;"/>
        <xsl:output-character character="⅘" string="&amp;#x2158;"/>
        <xsl:output-character character="⅚" string="&amp;#x215A;"/>
        <xsl:output-character character=" " string="&amp;#x2009;"/>
        <xsl:output-character character="♥" string="&amp;#x2665;"/>
        <xsl:output-character character="…" string="&amp;#x2026;"/>
        <xsl:output-character character="⁃" string="&amp;#x2043;"/>
        <xsl:output-character character="℅" string="&amp;#x2105;"/>
        <xsl:output-character character="„" string="&amp;#x201E;"/>
        <xsl:output-character character="▄" string="&amp;#x2584;"/>
        <xsl:output-character character="◊" string="&amp;#x25CA;"/>
        <xsl:output-character character="⧫" string="&amp;#x2726;"/>
        <xsl:output-character character="‚" string="&amp;#x201A;"/>
        <xsl:output-character character="◃" string="&amp;#x25C3;"/>
        <xsl:output-character character="◂" string="&amp;#x25C2;"/>
        <xsl:output-character character="♂" string="&amp;#x2642;"/>
        <xsl:output-character character="✠" string="&amp;#x2720;"/>
        <xsl:output-character character="▮" string="&amp;#x25AE;"/>
        <xsl:output-character character="—" string="&amp;#x2014;"/>
        <xsl:output-character character="…" string="&amp;#x2026;"/>
        <!-- mldr -->
        <xsl:output-character character="♮" string="&amp;#x266E;"/>
        <xsl:output-character character="–" string="&amp;#x2013;"/>
        <xsl:output-character character="‥" string="&amp;#x2025;"/>
        <xsl:output-character character=" " string="&amp;#x2007;"/>
        <xsl:output-character character="☎" string="&amp;#x260E;"/>
        <xsl:output-character character=" " string="&amp;#x2008;"/>
        <xsl:output-character character="”" string="&amp;#x201D;"/>
        <xsl:output-character character="▭" string="&amp;#x25AD;"/>
        <xsl:output-character character="’" string="&amp;#x2019;"/>
        <xsl:output-character character="▹" string="&amp;#x25B9;"/>
        <xsl:output-character character="▸" string="&amp;#x25B8;"/>
        <xsl:output-character character="℞" string="&amp;#x211E;"/>
        <xsl:output-character character="✶" string="&amp;#x2736;"/>
        <xsl:output-character character="♯" string="&amp;#x266F;"/>
        <xsl:output-character character="♠" string="&amp;#x2660;"/>
        <xsl:output-character character="□" string="&amp;#x25A1;"/>
        <xsl:output-character character="▪" string="&amp;#x25AA;"/>
        <xsl:output-character character="☆" string="&amp;#x22C6;"/>
        <xsl:output-character character="★" string="&amp;#x2605;"/>
        <xsl:output-character character="⌖" string="&amp;#x2316;"/>
        <xsl:output-character character="⌕" string="&amp;#x2315;"/>
        <xsl:output-character character=" " string="&#160;"/>
        <xsl:output-character character="▀" string="&amp;#x2580;"/>
        <xsl:output-character character="⌏" string="&amp;#x230F;"/>
        <xsl:output-character character="⌎" string="&amp;#x230E;"/>
        <xsl:output-character character="▵" string="&amp;#x25B5;"/>
        <xsl:output-character character="▴" string="&amp;#x25B4;"/>
        <xsl:output-character character="⋮" string="&amp;#x22EE;"/>
        <!-- isoamsamap.xsl -->
        <xsl:output-character character="⍼" string="&amp;#x237C;"/>
        <xsl:output-character character="⫯" string="&amp;#x2AEF;"/>
        <xsl:output-character character="⤸" string="&amp;#x2938;"/>
        <xsl:output-character character="⤵" string="&amp;#x2935;"/>
        <xsl:output-character character="↶" string="&amp;#x21B6;"/>
        <xsl:output-character character="⤽" string="&amp;#x293D;"/>
        <xsl:output-character character="↷" string="&amp;#x21B7;"/>
        <xsl:output-character character="⤼" string="&amp;#x293C;"/>
        <xsl:output-character character="⇓" string="&amp;#x21D3;"/>
        <xsl:output-character character="↡" string="&amp;#x21A1;"/>
        <xsl:output-character character="⇊" string="&amp;#x21CA;"/>
        <xsl:output-character character="⤑" string="&amp;#x2911;"/>
        <xsl:output-character character="⥿" string="&amp;#x297F;"/>
        <xsl:output-character character="⥥" string="&amp;#x2965;"/>
        <xsl:output-character character="⇃" string="&amp;#x21C3;"/>
        <xsl:output-character character="⇂" string="&amp;#x21C2;"/>
        <xsl:output-character character="⇵" string="&amp;#x21F5;"/>
        <xsl:output-character character="⥯" string="&amp;#x296F;"/>
        <xsl:output-character character="⟿" string="&amp;#x27FF;"/>
        <xsl:output-character character="⥱" string="&amp;#x2971;"/>
        <xsl:output-character character="↔" string="&amp;#x2194;"/>
        <xsl:output-character character="⇔" string="&amp;#x21D4;"/>
        <xsl:output-character character="⥈" string="&amp;#x2948;"/>
        <xsl:output-character character="↭" string="&amp;#x21AD;"/>
        <xsl:output-character character="⇿" string="&amp;#x21FF;"/>
        <xsl:output-character character="⊷" string="&amp;#x22B7;"/>
        <xsl:output-character character="⇚" string="&amp;#x21DA;"/>
        <xsl:output-character character="↞" string="&amp;#x219E;"/>
        <xsl:output-character character="⤟" string="&amp;#x291F;"/>
        <xsl:output-character character="⤝" string="&amp;#x291D;"/>
        <xsl:output-character character="↩" string="&amp;#x21A9;"/>
        <xsl:output-character character="↫" string="&amp;#x21AB;"/>
        <xsl:output-character character="⤹" string="&amp;#x2939;"/>
        <xsl:output-character character="⥳" string="&amp;#x2973;"/>
        <xsl:output-character character="↢" string="&amp;#x21A2;"/>
        <xsl:output-character character="⤙" string="&amp;#x2919;"/>
        <xsl:output-character character="⤛" string="&amp;#x291B;"/>
        <xsl:output-character character="⤌" string="&amp;#x290C;"/>
        <xsl:output-character character="⤎" string="&amp;#x290E;"/>
        <xsl:output-character character="⤶" string="&amp;#x2936;"/>
        <xsl:output-character character="⥧" string="&amp;#x2967;"/>
        <xsl:output-character character="⥋" string="&amp;#x294B;"/>
        <xsl:output-character character="↲" string="&amp;#x21B2;"/>
        <xsl:output-character character="⥼" string="&amp;#x297C;"/>
        <xsl:output-character character="⥢" string="&amp;#x2962;"/>
        <xsl:output-character character="↽" string="&amp;#x21BD;"/>
        <xsl:output-character character="↼" string="&amp;#x21BC;"/>
        <xsl:output-character character="⥪" string="&amp;#x296A;"/>
        <xsl:output-character character="⇇" string="&amp;#x21C7;"/>
        <xsl:output-character character="⥫" string="&amp;#x296B;"/>
        <xsl:output-character character="⇽" string="&amp;#x21FD;"/>
        <xsl:output-character character="⇆" string="&amp;#x21C6;"/>
        <xsl:output-character character="⇋" string="&amp;#x21CB;"/>
        <xsl:output-character character="⥭" string="&amp;#x296D;"/>
        <xsl:output-character character="↰" string="&amp;#x21B0;"/>
        <xsl:output-character character="⥊" string="&amp;#x294A;"/>
        <xsl:output-character character="⥦" string="&amp;#x2966;"/>
        <xsl:output-character character="↦" string="&amp;#x21A6;"/>
        <xsl:output-character character="⤅" string="&amp;#x2905;"/>
        <xsl:output-character character="⫰" string="&amp;#x2AF0;"/>
        <xsl:output-character character="⊸" string="&amp;#x22B8;"/>
        <xsl:output-character character="⤤" string="&amp;#x2924;"/>
        <xsl:output-character character="↗" string="&amp;#x2197;"/>
        <xsl:output-character character="⇗" string="&amp;#x21D7;"/>
        <xsl:output-character character="⤨" string="&amp;#x2928;"/>
        <xsl:output-character character="↮" string="&amp;#x21AE;"/>
        <xsl:output-character character="⇎" string="&amp;#x21CE;"/>
        <xsl:output-character character="↚" string="&amp;#x219A;"/>
        <xsl:output-character character="⇍" string="&amp;#x21CD;"/>
        <xsl:output-character character="↛" string="&amp;#x219B;"/>
        <xsl:output-character character="⇏" string="&amp;#x21CF;"/>
        <!--U02933-00338 nrarrc-->
        <!--U0219D-00338 nrarrw-->
        <xsl:output-character character="⤄" string="&amp;#x2904;"/>
        <xsl:output-character character="⤂" string="&amp;#x2902;"/>
        <xsl:output-character character="⤃" string="&amp;#x2903;"/>
        <xsl:output-character character="⤣" string="&amp;#x2923;"/>
        <xsl:output-character character="↖" string="&amp;#x2196;"/>
        <xsl:output-character character="⇖" string="&amp;#x21D6;"/>
        <xsl:output-character character="⤧" string="&amp;#x2927;"/>
        <xsl:output-character character="↺" string="&amp;#x21BA;"/>
        <xsl:output-character character="↻" string="&amp;#x21BB;"/>
        <xsl:output-character character="⊶" string="&amp;#x22B6;"/>
        <xsl:output-character character="⇛" string="&amp;#x21DB;"/>
        <xsl:output-character character="↠" string="&amp;#x21A0;"/>
        <xsl:output-character character="⥵" string="&amp;#x2975;"/>
        <xsl:output-character character="⤠" string="&amp;#x2920;"/>
        <xsl:output-character character="⤳" string="&amp;#x2933;"/>
        <xsl:output-character character="⤞" string="&amp;#x291E;"/>
        <xsl:output-character character="↪" string="&amp;#x21AA;"/>
        <xsl:output-character character="↬" string="&amp;#x21AC;"/>
        <xsl:output-character character="⥅" string="&amp;#x2945;"/>
        <xsl:output-character character="⥴" string="&amp;#x2974;"/>
        <xsl:output-character character="↣" string="&amp;#x21A3;"/>
        <xsl:output-character character="⤖" string="&amp;#x2916;"/>
        <xsl:output-character character="↝" string="&amp;#x219D;"/>
        <xsl:output-character character="⤚" string="&amp;#x291A;"/>
        <xsl:output-character character="⤜" string="&amp;#x291C;"/>
        <xsl:output-character character="⤍" string="&amp;#x290D;"/>
        <xsl:output-character character="⤏" string="&amp;#x290F;"/>
        <xsl:output-character character="⤐" string="&amp;#x2910;"/>
        <xsl:output-character character="⤷" string="&amp;#x2937;"/>
        <xsl:output-character character="⥩" string="&amp;#x2969;"/>
        <xsl:output-character character="↳" string="&amp;#x21B3;"/>
        <xsl:output-character character="⥽" string="&amp;#x297D;"/>
        <xsl:output-character character="⥤" string="&amp;#x2964;"/>
        <xsl:output-character character="⇁" string="&amp;#x21C1;"/>
        <xsl:output-character character="⇀" string="&amp;#x21C0;"/>
        <xsl:output-character character="⥬" string="&amp;#x296C;"/>
        <xsl:output-character character="⇄" string="&amp;#x21C4;"/>
        <xsl:output-character character="⇌" string="&amp;#x21CC;"/>
        <xsl:output-character character="⇾" string="&amp;#x21FE;"/>
        <xsl:output-character character="⇉" string="&amp;#x21C9;"/>
        <xsl:output-character character="↱" string="&amp;#x21B1;"/>
        <xsl:output-character character="⥨" string="&amp;#x2968;"/>
        <xsl:output-character character="⤥" string="&amp;#x2925;"/>
        <xsl:output-character character="↘" string="&amp;#x2198;"/>
        <xsl:output-character character="⇘" string="&amp;#x21D8;"/>
        <xsl:output-character character="⤩" string="&amp;#x2929;"/>
        <xsl:output-character character="⥲" string="&amp;#x2972;"/>
        <xsl:output-character character="←" string="&amp;#x2190;"/>
        <xsl:output-character character="→" string="&amp;#x2192;"/>
        <xsl:output-character character="⤦" string="&amp;#x2926;"/>
        <xsl:output-character character="↙" string="&amp;#x2199;"/>
        <xsl:output-character character="⇙" string="&amp;#x21D9;"/>
        <xsl:output-character character="⤪" string="&amp;#x292A;"/>
        <xsl:output-character character="⇑" string="&amp;#x21D1;"/>
        <xsl:output-character character="↟" string="&amp;#x219F;"/>
        <xsl:output-character character="⥉" string="&amp;#x2949;"/>
        <xsl:output-character character="⇅" string="&amp;#x21C5;"/>
        <xsl:output-character character="⥮" string="&amp;#x296E;"/>
        <xsl:output-character character="⥾" string="&amp;#x297E;"/>
        <xsl:output-character character="⥣" string="&amp;#x2963;"/>
        <xsl:output-character character="↿" string="&amp;#x21BF;"/>
        <xsl:output-character character="↾" string="&amp;#x21BE;"/>
        <xsl:output-character character="⇈" string="&amp;#x21C8;"/>
        <xsl:output-character character="↕" string="&amp;#x2195;"/>
        <xsl:output-character character="⇕" string="&amp;#x21D5;"/>
        <xsl:output-character character="⟷" string="&amp;#xE203;"/>
        <xsl:output-character character="⟺" string="&amp;#xE202;"/>
        <xsl:output-character character="⟵" string="&amp;#x27F5;"/>
        <xsl:output-character character="⟸" string="&amp;#xE200;"/>
        <xsl:output-character character="⟼" string="&amp;#x27FC;"/>
        <xsl:output-character character="⟶" string="&amp;#x27F6;"/>
        <xsl:output-character character="⟹" string="&amp;#xE204;"/>
        <xsl:output-character character="⇝" string="&amp;#x21DD;"/>
        <!-- isoamsamap.xsl -->
        <xsl:output-character character="⍼" string="&amp;#x237C;"/>
        <xsl:output-character character="⫯" string="&amp;#x2AEF;"/>
        <xsl:output-character character="⤸" string="&amp;#x2938;"/>
        <xsl:output-character character="⤵" string="&amp;#x2935;"/>
        <xsl:output-character character="↶" string="&amp;#x21B6;"/>
        <xsl:output-character character="⤽" string="&amp;#x293D;"/>
        <xsl:output-character character="↷" string="&amp;#x21B7;"/>
        <xsl:output-character character="⤼" string="&amp;#x293C;"/>
        <xsl:output-character character="⇓" string="&amp;#x21D3;"/>
        <xsl:output-character character="↡" string="&amp;#x21A1;"/>
        <xsl:output-character character="⇊" string="&amp;#x21CA;"/>
        <xsl:output-character character="⤑" string="&amp;#x2911;"/>
        <xsl:output-character character="⥿" string="&amp;#x297F;"/>
        <xsl:output-character character="⥥" string="&amp;#x2965;"/>
        <xsl:output-character character="⇃" string="&amp;#x21C3;"/>
        <xsl:output-character character="⇂" string="&amp;#x21C2;"/>
        <xsl:output-character character="⇵" string="&amp;#x21F5;"/>
        <xsl:output-character character="⥯" string="&amp;#x296F;"/>
        <xsl:output-character character="⟿" string="&amp;#x27FF;"/>
        <xsl:output-character character="⥱" string="&amp;#x2971;"/>
        <xsl:output-character character="↔" string="&amp;#x2194;"/>
        <xsl:output-character character="⇔" string="&amp;#x21D4;"/>
        <xsl:output-character character="⥈" string="&amp;#x2948;"/>
        <xsl:output-character character="↭" string="&amp;#x21AD;"/>
        <xsl:output-character character="⇿" string="&amp;#x21FF;"/>
        <xsl:output-character character="⊷" string="&amp;#x22B7;"/>
        <xsl:output-character character="⇚" string="&amp;#x21DA;"/>
        <xsl:output-character character="↞" string="&amp;#x219E;"/>
        <xsl:output-character character="⤟" string="&amp;#x291F;"/>
        <xsl:output-character character="⤝" string="&amp;#x291D;"/>
        <xsl:output-character character="↩" string="&amp;#x21A9;"/>
        <xsl:output-character character="↫" string="&amp;#x21AB;"/>
        <xsl:output-character character="⤹" string="&amp;#x2939;"/>
        <xsl:output-character character="⥳" string="&amp;#x2973;"/>
        <xsl:output-character character="↢" string="&amp;#x21A2;"/>
        <xsl:output-character character="⤙" string="&amp;#x2919;"/>
        <xsl:output-character character="⤛" string="&amp;#x291B;"/>
        <xsl:output-character character="⤌" string="&amp;#x290C;"/>
        <xsl:output-character character="⤎" string="&amp;#x290E;"/>
        <xsl:output-character character="⤶" string="&amp;#x2936;"/>
        <xsl:output-character character="⥧" string="&amp;#x2967;"/>
        <xsl:output-character character="⥋" string="&amp;#x294B;"/>
        <xsl:output-character character="↲" string="&amp;#x21B2;"/>
        <xsl:output-character character="⥼" string="&amp;#x297C;"/>
        <xsl:output-character character="⥢" string="&amp;#x2962;"/>
        <xsl:output-character character="↽" string="&amp;#x21BD;"/>
        <xsl:output-character character="↼" string="&amp;#x21BC;"/>
        <xsl:output-character character="⥪" string="&amp;#x296A;"/>
        <xsl:output-character character="⇇" string="&amp;#x21C7;"/>
        <xsl:output-character character="⥫" string="&amp;#x296B;"/>
        <xsl:output-character character="⇽" string="&amp;#x21FD;"/>
        <xsl:output-character character="⇆" string="&amp;#x21C6;"/>
        <xsl:output-character character="⇋" string="&amp;#x21CB;"/>
        <xsl:output-character character="⥭" string="&amp;#x296D;"/>
        <xsl:output-character character="↰" string="&amp;#x21B0;"/>
        <xsl:output-character character="⥊" string="&amp;#x294A;"/>
        <xsl:output-character character="⥦" string="&amp;#x2966;"/>
        <xsl:output-character character="↦" string="&amp;#x21A6;"/>
        <xsl:output-character character="⤅" string="&amp;#x2905;"/>
        <xsl:output-character character="⫰" string="&amp;#x2AF0;"/>
        <xsl:output-character character="⊸" string="&amp;#x22B8;"/>
        <xsl:output-character character="⤤" string="&amp;#x2924;"/>
        <xsl:output-character character="↗" string="&amp;#x2197;"/>
        <xsl:output-character character="⇗" string="&amp;#x21D7;"/>
        <xsl:output-character character="⤨" string="&amp;#x2928;"/>
        <xsl:output-character character="↮" string="&amp;#x21AE;"/>
        <xsl:output-character character="⇎" string="&amp;#x21CE;"/>
        <xsl:output-character character="↚" string="&amp;#x219A;"/>
        <xsl:output-character character="⇍" string="&amp;#x21CD;"/>
        <xsl:output-character character="↛" string="&amp;#x219B;"/>
        <xsl:output-character character="⇏" string="&amp;#x21CF;"/>
        <!--U02933-00338 nrarrc-->
        <!--U0219D-00338 nrarrw-->
        <xsl:output-character character="⤄" string="&amp;#x2904;"/>
        <xsl:output-character character="⤂" string="&amp;#x2902;"/>
        <xsl:output-character character="⤃" string="&amp;#x2903;"/>
        <xsl:output-character character="⤣" string="&amp;#x2923;"/>
        <xsl:output-character character="↖" string="&amp;#x2196;"/>
        <xsl:output-character character="⇖" string="&amp;#x21D6;"/>
        <xsl:output-character character="⤧" string="&amp;#x2927;"/>
        <xsl:output-character character="↺" string="&amp;#x21BA;"/>
        <xsl:output-character character="↻" string="&amp;#x21BB;"/>
        <xsl:output-character character="⊶" string="&amp;#x22B6;"/>
        <xsl:output-character character="⇛" string="&amp;#x21DB;"/>
        <xsl:output-character character="↠" string="&amp;#x21A0;"/>
        <xsl:output-character character="⥵" string="&amp;#x2975;"/>
        <xsl:output-character character="⤠" string="&amp;#x2920;"/>
        <xsl:output-character character="⤳" string="&amp;#x2933;"/>
        <xsl:output-character character="⤞" string="&amp;#x291E;"/>
        <xsl:output-character character="↪" string="&amp;#x21AA;"/>
        <xsl:output-character character="↬" string="&amp;#x21AC;"/>
        <xsl:output-character character="⥅" string="&amp;#x2945;"/>
        <xsl:output-character character="⥴" string="&amp;#x2974;"/>
        <xsl:output-character character="↣" string="&amp;#x21A3;"/>
        <xsl:output-character character="⤖" string="&amp;#x2916;"/>
        <xsl:output-character character="↝" string="&amp;#x219D;"/>
        <xsl:output-character character="⤚" string="&amp;#x291A;"/>
        <xsl:output-character character="⤜" string="&amp;#x291C;"/>
        <xsl:output-character character="⤍" string="&amp;#x290D;"/>
        <xsl:output-character character="⤏" string="&amp;#x290F;"/>
        <xsl:output-character character="⤐" string="&amp;#x2910;"/>
        <xsl:output-character character="⤷" string="&amp;#x2937;"/>
        <xsl:output-character character="⥩" string="&amp;#x2969;"/>
        <xsl:output-character character="↳" string="&amp;#x21B3;"/>
        <xsl:output-character character="⥽" string="&amp;#x297D;"/>
        <xsl:output-character character="⥤" string="&amp;#x2964;"/>
        <xsl:output-character character="⇁" string="&amp;#x21C1;"/>
        <xsl:output-character character="⇀" string="&amp;#x21C0;"/>
        <xsl:output-character character="⥬" string="&amp;#x296C;"/>
        <xsl:output-character character="⇄" string="&amp;#x21C4;"/>
        <xsl:output-character character="⇌" string="&amp;#x21CC;"/>
        <xsl:output-character character="⇾" string="&amp;#x21FE;"/>
        <xsl:output-character character="⇉" string="&amp;#x21C9;"/>
        <xsl:output-character character="↱" string="&amp;#x21B1;"/>
        <xsl:output-character character="⥨" string="&amp;#x2968;"/>
        <xsl:output-character character="⤥" string="&amp;#x2925;"/>
        <xsl:output-character character="↘" string="&amp;#x2198;"/>
        <xsl:output-character character="⇘" string="&amp;#x21D8;"/>
        <xsl:output-character character="⤩" string="&amp;#x2929;"/>
        <xsl:output-character character="⥲" string="&amp;#x2972;"/>
        <xsl:output-character character="←" string="&amp;#x2190;"/>
        <xsl:output-character character="→" string="&amp;#x2192;"/>
        <xsl:output-character character="⤦" string="&amp;#x2926;"/>
        <xsl:output-character character="↙" string="&amp;#x2199;"/>
        <xsl:output-character character="⇙" string="&amp;#x21D9;"/>
        <xsl:output-character character="⤪" string="&amp;#x292A;"/>
        <xsl:output-character character="⇑" string="&amp;#x21D1;"/>
        <xsl:output-character character="↟" string="&amp;#x219F;"/>
        <xsl:output-character character="⥉" string="&amp;#x2949;"/>
        <xsl:output-character character="⇅" string="&amp;#x21C5;"/>
        <xsl:output-character character="⥮" string="&amp;#x296E;"/>
        <xsl:output-character character="⥾" string="&amp;#x297E;"/>
        <xsl:output-character character="⥣" string="&amp;#x2963;"/>
        <xsl:output-character character="↿" string="&amp;#x21BF;"/>
        <xsl:output-character character="↾" string="&amp;#x21BE;"/>
        <xsl:output-character character="⇈" string="&amp;#x21C8;"/>
        <xsl:output-character character="↕" string="&amp;#x2195;"/>
        <xsl:output-character character="⇕" string="&amp;#x21D5;"/>
        <xsl:output-character character="⟷" string="&amp;#xE203;"/>
        <xsl:output-character character="⟺" string="&amp;#xE202;"/>
        <xsl:output-character character="⟵" string="&amp;#x27F5;"/>
        <xsl:output-character character="⟸" string="&amp;#xE200;"/>
        <xsl:output-character character="⟼" string="&amp;#x27FC;"/>
        <xsl:output-character character="⟶" string="&amp;#x27F6;"/>
        <xsl:output-character character="⟹" string="&amp;#xE204;"/>
        <xsl:output-character character="⇝" string="&amp;#x21DD;"/>
        <!-- isoamsbmap.xsl -->
        <xsl:output-character character="∾" string="&amp;#x223E;"/>
        <!--U0223E-00333 acE-->
        <xsl:output-character character="⨿" string="&amp;#xE251;"/>
        <xsl:output-character character="⊽" string="&amp;#x22BD;"/>
        <xsl:output-character character="⌅" string="&amp;#x22BC;"/>
        <xsl:output-character character="⌆" string="&amp;#x2306;"/>
        <xsl:output-character character="⧅" string="&amp;#x29C5;"/>
        <xsl:output-character character="⋒" string="&amp;#x22D2;"/>
        <xsl:output-character character="⩄" string="&amp;#x2A44;"/>
        <xsl:output-character character="⩉" string="&amp;#x2A49;"/>
        <xsl:output-character character="⩋" string="&amp;#x2A4B;"/>
        <xsl:output-character character="⩇" string="&amp;#x2A47;"/>
        <xsl:output-character character="⩀" string="&amp;#x2A40;"/>
        <!--U02229-0FE00 caps-->
        <xsl:output-character character="⩍" string="&amp;#x2A4D;"/>
        <xsl:output-character character="⩌" string="&amp;#x2A4C;"/>
        <xsl:output-character character="⩐" string="&amp;#x2A50;"/>
        <xsl:output-character character="∐" string="&amp;#x2210;"/>
        <xsl:output-character character="⋓" string="&amp;#x22D3;"/>
        <xsl:output-character character="⩈" string="&amp;#x2A48;"/>
        <xsl:output-character character="⩆" string="&amp;#x2A46;"/>
        <xsl:output-character character="⩊" string="&amp;#x2A4A;"/>
        <xsl:output-character character="⊍" string="&amp;#x228D;"/>
        <xsl:output-character character="⩅" string="&amp;#x2A45;"/>
        <!--U0222A-0FE00 cups-->
        <xsl:output-character character="⋎" string="&amp;#x22CE;"/>
        <xsl:output-character character="⋏" string="&amp;#x22CF;"/>
        <xsl:output-character character="†" string="&amp;#x2020;"/>
        <xsl:output-character character="‡" string="&amp;#x2021;"/>
        <xsl:output-character character="⋄" string="&amp;#x22C4;"/>
        <xsl:output-character character="⋇" string="&amp;#x22C7;"/>
        <xsl:output-character character="⩱" string="&amp;#x2A71;"/>
        <xsl:output-character character="⊹" string="&amp;#x22B9;"/>
        <xsl:output-character character="⊺" string="&amp;#x22BA;"/>
        <xsl:output-character character="⨼" string="&amp;#x2A3C;"/>
        <xsl:output-character character="⨭" string="&amp;#x2A2D;"/>
        <xsl:output-character character="⨴" string="&amp;#x2A34;"/>
        <xsl:output-character character="⋋" string="&amp;#x22CB;"/>
        <xsl:output-character character="⋉" string="&amp;#x22C9;"/>
        <!--U0002A midast-->
        <xsl:output-character character="⊟" string="&amp;#x229F;"/>
        <xsl:output-character character="∸" string="&amp;#x2238;"/>
        <xsl:output-character character="⨪" string="&amp;#x2A2A;"/>
        <xsl:output-character character="⩃" string="&amp;#x2A43;"/>
        <xsl:output-character character="⩂" string="&amp;#x2A42;"/>
        <xsl:output-character character="⊛" string="&amp;#x229B;"/>
        <xsl:output-character character="⊚" string="&amp;#x229A;"/>
        <xsl:output-character character="⊝" string="&amp;#x229D;"/>
        <xsl:output-character character="⨸" string="&amp;#x2A38;"/>
        <xsl:output-character character="⊙" string="&amp;#x2299;"/>
        <xsl:output-character character="⦼" string="&amp;#x29BC;"/>
        <xsl:output-character character="⦿" string="&amp;#x29BF;"/>
        <xsl:output-character character="⧁" string="&amp;#x29C1;"/>
        <xsl:output-character character="⦵" string="&amp;#x29B5;"/>
        <xsl:output-character character="⦾" string="&amp;#x29BE;"/>
        <xsl:output-character character="⧀" string="&amp;#x29C0;"/>
        <xsl:output-character character="⦶" string="&amp;#x29B6;"/>
        <xsl:output-character character="⊖" string="&amp;#x2296;"/>
        <xsl:output-character character="⦷" string="&amp;#x29B7;"/>
        <xsl:output-character character="⦹" string="&amp;#x29B9;"/>
        <xsl:output-character character="⊕" string="&amp;#x2295;"/>
        <xsl:output-character character="⊘" string="&amp;#x2298;"/>
        <xsl:output-character character="⊗" string="&amp;#x2297;"/>
        <xsl:output-character character="⨷" string="&amp;#x2A37;"/>
        <xsl:output-character character="⨶" string="&amp;#x2A36;"/>
        <xsl:output-character character="⌽" string="&amp;#x233D;"/>
        <xsl:output-character character="⨣" string="&amp;#x2A23;"/>
        <xsl:output-character character="⊞" string="&amp;#x229E;"/>
        <xsl:output-character character="⨢" string="&amp;#x2A22;"/>
        <xsl:output-character character="∔" string="&amp;#x2214;"/>
        <xsl:output-character character="⨥" string="&amp;#x2A25;"/>
        <xsl:output-character character="⩲" string="&amp;#x2A72;"/>
        <xsl:output-character character="⨦" string="&amp;#x2A26;"/>
        <xsl:output-character character="⨧" string="&amp;#x2A27;"/>
        <xsl:output-character character="∏" string="&amp;#x220F;"/>
        <xsl:output-character character="⧚" string="&amp;#x29DA;"/>
        <xsl:output-character character="⨮" string="&amp;#x2A2E;"/>
        <xsl:output-character character="⨵" string="&amp;#x2A35;"/>
        <xsl:output-character character="⋌" string="&amp;#x22CC;"/>
        <xsl:output-character character="⋊" string="&amp;#x22CA;"/>
        <xsl:output-character character="⋅" string="&amp;#x22C5;"/>
        <xsl:output-character character="⊡" string="&amp;#x22A1;"/>
        <xsl:output-character character="∖" string="&amp;#x2216;"/>
        <xsl:output-character character="⨤" string="&amp;#x2A24;"/>
        <xsl:output-character character="⨳" string="&amp;#x2A33;"/>
        <xsl:output-character character="⧄" string="&amp;#x29C4;"/>
        <xsl:output-character character="⊓" string="&amp;#x2293;"/>
        <!--U02293-0FE00 sqcaps-->
        <xsl:output-character character="⊔" string="&amp;#x2294;"/>
        <!--U02294-0FE00 sqcups-->
        <xsl:output-character character="∖" string="&amp;#xE844;"/>
        <xsl:output-character character="⋆" string="&amp;#x22C6;"/>
        <xsl:output-character character="⪽" string="&amp;#x2ABD;"/>
        <xsl:output-character character="∑" string="&amp;#x2211;"/>
        <xsl:output-character character="⪾" string="&amp;#x2ABE;"/>
        <xsl:output-character character="⊠" string="&amp;#x22A0;"/>
        <xsl:output-character character="⨱" string="&amp;#x2A31;"/>
        <xsl:output-character character="⨰" string="&amp;#x2A30;"/>
        <xsl:output-character character="◬" string="&amp;#x25EC;"/>
        <xsl:output-character character="⨺" string="&amp;#x2A3A;"/>
        <xsl:output-character character="⨹" string="&amp;#x2A39;"/>
        <xsl:output-character character="⧍" string="&amp;#x29CD;"/>
        <xsl:output-character character="⨻" string="&amp;#x2A3B;"/>
        <xsl:output-character character="⊎" string="&amp;#x228E;"/>
        <xsl:output-character character="⊻" string="&amp;#x22BB;"/>
        <xsl:output-character character="⩟" string="&amp;#x2A5F;"/>
        <xsl:output-character character="≀" string="&amp;#x2240;"/>
        <xsl:output-character character="⋂" string="&amp;#x22C2;"/>
        <xsl:output-character character="◯" string="&amp;#x25CB;"/>
        <xsl:output-character character="⋃" string="&amp;#x22C3;"/>
        <xsl:output-character character="▽" string="&amp;#x25BD;"/>
        <xsl:output-character character="⨀" string="&amp;#x2A00;"/>
        <xsl:output-character character="⨁" string="&amp;#x2A01;"/>
        <xsl:output-character character="⨂" string="&amp;#x2A02;"/>
        <xsl:output-character character="⨆" string="&amp;#x2A06;"/>
        <xsl:output-character character="⨄" string="&amp;#x2A04;"/>
        <xsl:output-character character="△" string="&amp;#x25B3;"/>
        <xsl:output-character character="⋁" string="&amp;#x22C1;"/>
        <xsl:output-character character="⋀" string="&amp;#x22C0;"/>
        <!-- isoamscmap.xsl -->
        <xsl:output-character character="⌞" string="&amp;#x231E;"/>
        <xsl:output-character character="⌟" string="&amp;#x231F;"/>
        <xsl:output-character character="⦕" string="&amp;#x2995;"/>
        <xsl:output-character character="⦑" string="&amp;#x2991;"/>
        <xsl:output-character character="⦋" string="&amp;#x298B;"/>
        <xsl:output-character character="⦏" string="&amp;#x298F;"/>
        <xsl:output-character character="⦍" string="&amp;#x298D;"/>
        <xsl:output-character character="⌈" string="&amp;#x2308;"/>
        <xsl:output-character character="⌊" string="&amp;#x230A;"/>
        <xsl:output-character character="⎰" string="&amp;#x23B0;"/>
        <xsl:output-character character="⦓" string="&amp;#x2993;"/>
        <xsl:output-character character="⦖" string="&amp;#x2996;"/>
        <xsl:output-character character="⦒" string="&amp;#x2992;"/>
        <xsl:output-character character="⦌" string="&amp;#x298C;"/>
        <xsl:output-character character="⦎" string="&amp;#x298E;"/>
        <xsl:output-character character="⦐" string="&amp;#x2990;"/>
        <xsl:output-character character="⌉" string="&amp;#x2309;"/>
        <xsl:output-character character="⌋" string="&amp;#x230B;"/>
        <xsl:output-character character="⎱" string="&amp;#x23B1;"/>
        <xsl:output-character character="⦔" string="&amp;#xE291;"/>
        <xsl:output-character character="⌜" string="&amp;#x231C;"/>
        <xsl:output-character character="⌝" string="&amp;#x231D;"/>
        <!-- isoamsnmap.xsl -->
        <xsl:output-character character="⪊" string="&amp;#xE411;"/>
        <xsl:output-character character="⪈" string="&amp;#x2269;"/>
        <xsl:output-character character="≩" string="&amp;#x2269;"/>
        <xsl:output-character character="⋧" string="&amp;#x22E7;"/>
        <!--U02269-0FE00 gvnE-->
        <xsl:output-character character="⪉" string="&amp;#xE2A2;"/>
        <xsl:output-character character="⪇" string="&amp;#x2268;"/>
        <xsl:output-character character="≨" string="&amp;#x2268;"/>
        <xsl:output-character character="⋦" string="&amp;#x22E6;"/>
        <!--U02268-0FE00 lvnE-->
        <xsl:output-character character="≉" string="&amp;#x2249;"/>
        <!--U02A70-00338 napE-->
        <!--U0224B-00338 napid-->
        <xsl:output-character character="≇" string="&amp;#x2247;"/>
        <!--U02A6D-00338 ncongdot-->
        <xsl:output-character character="≢" string="&amp;#x2262;"/>
        <xsl:output-character character="≱" string="&amp;#xE2A6;"/>
        <!--U02267-00338 ngE-->
        <!--U02A7E-00338 nges-->
        <!--U022D9-00338 nGg-->
        <xsl:output-character character="≵" string="&amp;#x2275;"/>
        <xsl:output-character character="≯" string="&amp;#x226F;"/>
        <!--U0226B-020D2 nGt-->
        <!--U0226B-00338 nGtv-->
        <xsl:output-character character="≰" string="&amp;#xE2A7;"/>
        <!--U02266-00338 nlE-->
        <!--U02A7D-00338 nles-->
        <!--U022D8-00338 nLl-->
        <xsl:output-character character="≴" string="&amp;#x2274;"/>
        <xsl:output-character character="≮" string="&amp;#x226E;"/>
        <!--U0226A-020D2 nLt-->
        <xsl:output-character character="⋪" string="&amp;#x22EA;"/>
        <xsl:output-character character="⋬" string="&amp;#x22EC;"/>
        <!--U0226A-00338 nLtv-->
        <xsl:output-character character="∤" string="&amp;#x2224;"/>
        <xsl:output-character character="∦" string="&amp;#x2226;"/>
        <xsl:output-character character="⊀" string="&amp;#x2280;"/>
        <xsl:output-character character="⋠" string="&amp;#x22E0;"/>
        <!--U02AAF-00338 npre-->
        <xsl:output-character character="⋫" string="&amp;#x22EB;"/>
        <xsl:output-character character="⋭" string="&amp;#x22ED;"/>
        <xsl:output-character character="⊁" string="&amp;#x2281;"/>
        <xsl:output-character character="⋡" string="&amp;#x22E1;"/>
        <!--U02AB0-00338 nsce-->
        <xsl:output-character character="≁" string="&amp;#x2241;"/>
        <xsl:output-character character="≄" string="&amp;#x2244;"/>
        <xsl:output-character character="∤" string="&amp;#xE2AA;"/>
        <xsl:output-character character="∦" string="&amp;#xE2AB;"/>
        <xsl:output-character character="⋢" string="&amp;#x22E2;"/>
        <xsl:output-character character="⋣" string="&amp;#x22E3;"/>
        <xsl:output-character character="⊄" string="&amp;#x2284;"/>
        <xsl:output-character character="⊈" string="&amp;#x2288;"/>
        <!--U02AC5-00338 nsubE-->
        <xsl:output-character character="⊅" string="&amp;#x2285;"/>
        <xsl:output-character character="⊉" string="&amp;#x2289;"/>
        <!--U02AC6-00338 nsupE-->
        <xsl:output-character character="≹" string="&amp;#x2279;"/>
        <xsl:output-character character="≸" string="&amp;#x2278;"/>
        <!--U0224D-020D2 nvap-->
        <xsl:output-character character="⊬" string="&amp;#x22AC;"/>
        <xsl:output-character character="⊭" string="&amp;#x22AD;"/>
        <xsl:output-character character="⊮" string="&amp;#x22AE;"/>
        <xsl:output-character character="⊯" string="&amp;#x22AF;"/>
        <!--U02265-020D2 nvge-->
        <!--U0003E-020D2 nvgt-->
        <!--U02264-020D2 nvle-->
        <!--U0003C-020D2 nvlt-->
        <!--U022B4-020D2 nvltrie-->
        <!--U022B5-020D2 nvrtrie-->
        <!--U0223C-020D2 nvsim-->
        <xsl:output-character character="⫳" string="&amp;#x2AF3;"/>
        <xsl:output-character character="⪹" string="&amp;#x22E8;"/>
        <xsl:output-character character="⪵" string="&amp;#xE2B3;"/>
        <xsl:output-character character="⋨" string="&amp;#x22E8;"/>
        <xsl:output-character character="⫮" string="&amp;#x2AEE;"/>
        <xsl:output-character character="⪺" string="&amp;#x22E9;"/>
        <xsl:output-character character="⪶" string="&amp;#xE2B5;"/>
        <xsl:output-character character="⋩" string="&amp;#x22E9;"/>
        <xsl:output-character character="≆" string="&amp;#x2246;"/>
        <xsl:output-character character="⌿" string="&amp;#x233F;"/>
        <xsl:output-character character="⊊" string="&amp;#x228A;"/>
        <xsl:output-character character="⫋" string="&amp;#x228A;"/>
        <xsl:output-character character="⊋" string="&amp;#x228B;"/>
        <xsl:output-character character="⫌" string="&amp;#x228B;"/>
        <!--U02282-020D2 vnsub-->
        <!--U02283-020D2 vnsup-->
        <!--U0228A-0FE00 vsubne-->
        <!--U02ACB-0FE00 vsubnE-->
        <!--U0228B-0FE00 vsupne-->
        <!--U02ACC-0FE00 vsupnE-->
        <!-- isoamsomap.xsl -->
        <xsl:output-character character="∠" string="&amp;#x2220;"/>
        <xsl:output-character character="⦤" string="&amp;#x29A4;"/>
        <xsl:output-character character="∡" string="&amp;#x2221;"/>
        <xsl:output-character character="⦨" string="&amp;#x29A8;"/>
        <xsl:output-character character="⦩" string="&amp;#x29A9;"/>
        <xsl:output-character character="⦪" string="&amp;#x29AA;"/>
        <xsl:output-character character="⦫" string="&amp;#x29AB;"/>
        <xsl:output-character character="⦬" string="&amp;#x29AC;"/>
        <xsl:output-character character="⦭" string="&amp;#x29AD;"/>
        <xsl:output-character character="⦮" string="&amp;#x29AE;"/>
        <xsl:output-character character="⦯" string="&amp;#x29AF;"/>
        <xsl:output-character character="⊾" string="&amp;#x22BE;"/>
        <xsl:output-character character="⦝" string="&amp;#x299D;"/>
        <xsl:output-character character="⎵" string="&amp;#x23B5;"/>
        <xsl:output-character character="⎶" string="&amp;#x23B6;"/>
        <xsl:output-character character="⦰" string="&amp;#x29B0;"/>
        <xsl:output-character character="ℶ" string="&amp;#x2136;"/>
        <xsl:output-character character="⧉" string="&amp;#x29C9;"/>
        <xsl:output-character character="‵" string="&amp;#x2035;"/>
        <xsl:output-character character="⁏" string="&amp;#x204F;"/>
        <xsl:output-character character="⦲" string="&amp;#x29B2;"/>
        <xsl:output-character character="⧃" string="&amp;#x29C3;"/>
        <xsl:output-character character="⧂" string="&amp;#x29C2;"/>
        <xsl:output-character character="∁" string="&amp;#x2201;"/>
        <xsl:output-character character="ℸ" string="&amp;#x2138;"/>
        <xsl:output-character character="⦱" string="&amp;#x29B1;"/>
        <xsl:output-character character="ℓ" string="&amp;#x2113;"/>
        <xsl:output-character character="∅" string="&amp;#xE2D3;"/>
        <xsl:output-character character="∅" string="&amp;#x2205;"/>
        <xsl:output-character character="ℷ" string="&amp;#x2137;"/>
        <xsl:output-character character="℩" string="&amp;#x2129;"/>
        <xsl:output-character character="ℑ" string="&amp;#x2111;"/>
        <xsl:output-character character="ı" string="&amp;#x0131;"/>
        <!--U0006A jmath-->
        <xsl:output-character character="⦴" string="&amp;#x29B4;"/>
        <xsl:output-character character="◺" string="&amp;#x25FA;"/>
        <xsl:output-character character="⊿" string="&amp;#x22BF;"/>
        <xsl:output-character character="℧" string="&amp;#x2127;"/>
        <!--U02220-020D2 nang-->
        <xsl:output-character character="∄" string="&amp;#x2204;"/>
        <xsl:output-character character="Ⓢ" string="&amp;#xE41D;"/>
        <xsl:output-character character="ℏ" string="&amp;#x210F;"/>
        <xsl:output-character character="ℏ" string="&amp;#x210F;"/>
        <xsl:output-character character="⦳" string="&amp;#x29B3;"/>
        <xsl:output-character character="⦥" string="&amp;#x29A5;"/>
        <xsl:output-character character="ℜ" string="&amp;#x211C;"/>
        <xsl:output-character character="⎴" string="&amp;#x23B4;"/>
        <xsl:output-character character="�" string="&amp;#xFFFD;"/>
        <xsl:output-character character="◸" string="&amp;#x25F8;"/>
        <xsl:output-character character="◹" string="&amp;#x25F9;"/>
        <xsl:output-character character="⦚" string="&amp;#x299A;"/>
        <xsl:output-character character="℘" string="&amp;#x2118;"/>
        <!-- isoamsrmap.xsl -->
        <xsl:output-character character="≊" string="&amp;#x224A;"/>
        <xsl:output-character character="⩰" string="&amp;#x2A70;"/>
        <xsl:output-character character="≋" string="&amp;#x224B;"/>
        <xsl:output-character character="≈" string="&amp;#x224D;"/>
        <xsl:output-character character="⫧" string="&amp;#x2AE7;"/>
        <xsl:output-character character="≌" string="&amp;#x224C;"/>
        <xsl:output-character character="϶" string="&amp;#xE420;"/>
        <xsl:output-character character="⋈" string="&amp;#x22C8;"/>
        <xsl:output-character character="∽" string="&amp;#x223D;"/>
        <xsl:output-character character="⋍" string="&amp;#x22CD;"/>
        <!--U0005C-02282 bsolhsub-->
        <xsl:output-character character="≎" string="&amp;#x224E;"/>
        <xsl:output-character character="≏" string="&amp;#x224F;"/>
        <xsl:output-character character="⪮" string="&amp;#x2AAE;"/>
        <xsl:output-character character="≗" string="&amp;#x2257;"/>
        <xsl:output-character character="∷" string="&amp;#x2237;"/>
        <xsl:output-character character="≔" string="&amp;#x2254;"/>
        <xsl:output-character character="⩴" string="&amp;#x2A74;"/>
        <xsl:output-character character="⩭" string="&amp;#x2A6D;"/>
        <xsl:output-character character="⫏" string="&amp;#x2ACF;"/>
        <xsl:output-character character="⫑" string="&amp;#x2AD1;"/>
        <xsl:output-character character="⫐" string="&amp;#x2AD0;"/>
        <xsl:output-character character="⫒" string="&amp;#x2AD2;"/>
        <xsl:output-character character="⋞" string="&amp;#x22DE;"/>
        <xsl:output-character character="⋟" string="&amp;#x22DF;"/>
        <xsl:output-character character="⊣" string="&amp;#x22A3;"/>
        <xsl:output-character character="⫤" string="&amp;#x2AE4;"/>
        <xsl:output-character character="⩮" string="&amp;#x2A6E;"/>
        <xsl:output-character character="≖" string="&amp;#x2256;"/>
        <xsl:output-character character="≕" string="&amp;#x2255;"/>
        <xsl:output-character character="⩷" string="&amp;#x2A77;"/>
        <xsl:output-character character="≑" string="&amp;#x2251;"/>
        <xsl:output-character character="≒" string="&amp;#x2252;"/>
        <xsl:output-character character="⪚" string="&amp;#x2A9A;"/>
        <xsl:output-character character="⪖" string="&amp;#x22DD;"/>
        <xsl:output-character character="⪘" string="&amp;#x2A98;"/>
        <xsl:output-character character="⪙" string="&amp;#x2A99;"/>
        <xsl:output-character character="⪕" string="&amp;#x22DC;"/>
        <xsl:output-character character="⪗" string="&amp;#x2A97;"/>
        <xsl:output-character character="≟" string="&amp;#x225F;"/>
        <xsl:output-character character="⩸" string="&amp;#x2A78;"/>
        <xsl:output-character character="≓" string="&amp;#x2253;"/>
        <xsl:output-character character="≐" string="&amp;#x2250;"/>
        <xsl:output-character character="≂" string="&amp;#x2242;"/>
        <xsl:output-character character="⩳" string="&amp;#x2A73;"/>
        <xsl:output-character character="⋔" string="&amp;#x22D4;"/>
        <xsl:output-character character="⫙" string="&amp;#x2AD9;"/>
        <xsl:output-character character="⌢" string="&amp;#x2322;"/>
        <xsl:output-character character="⪆" string="&amp;#x2273;"/>
        <xsl:output-character character="≧" string="&amp;#x2267;"/>
        <xsl:output-character character="⋛" string="&amp;#x22DB;"/>
        <xsl:output-character character="⪌" string="&amp;#x22DB;"/>
        <xsl:output-character character="⩾" string="&amp;#x227D;"/>
        <xsl:output-character character="⪩" string="&amp;#x2AA9;"/>
        <xsl:output-character character="⪀" string="&amp;#x2A80;"/>
        <xsl:output-character character="⪂" string="&amp;#x2A82;"/>
        <xsl:output-character character="⪄" string="&amp;#x2A84;"/>
        <!--U022DB-0FE00 gesl-->
        <xsl:output-character character="⪔" string="&amp;#x2A94;"/>
        <xsl:output-character character="⋙" string="&amp;#x22D9;"/>
        <xsl:output-character character="≷" string="&amp;#x2277;"/>
        <xsl:output-character character="⪥" string="&amp;#x2AA5;"/>
        <xsl:output-character character="⪒" string="&amp;#x2A92;"/>
        <xsl:output-character character="⪤" string="&amp;#x2AA4;"/>
        <xsl:output-character character="≳" string="&amp;#x2273;"/>
        <xsl:output-character character="⪎" string="&amp;#x2A8E;"/>
        <xsl:output-character character="⪐" string="&amp;#x2A90;"/>
        <xsl:output-character character="≫" string="&amp;#x226B;"/>
        <xsl:output-character character="⪧" string="&amp;#x2AA7;"/>
        <xsl:output-character character="⩺" string="&amp;#x2A7A;"/>
        <xsl:output-character character="⋗" string="&amp;#x22D7;"/>
        <xsl:output-character character="⩼" string="&amp;#x2A7C;"/>
        <xsl:output-character character="⥸" string="&amp;#x2978;"/>
        <xsl:output-character character="∻" string="&amp;#x223B;"/>
        <xsl:output-character character="⪅" string="&amp;#x2272;"/>
        <xsl:output-character character="⪫" string="&amp;#x2AAB;"/>
        <xsl:output-character character="⪭" string="&amp;#x2AAD;"/>
        <!--U02AAD-0FE00 lates-->
        <xsl:output-character character="≦" string="&amp;#x2266;"/>
        <xsl:output-character character="⋚" string="&amp;#x22DA;"/>
        <xsl:output-character character="⪋" string="&amp;#x22DA;"/>
        <xsl:output-character character="⩽" string="&amp;#xE425;"/>
        <xsl:output-character character="⪨" string="&amp;#x2AA8;"/>
        <xsl:output-character character="⩿" string="&amp;#x2A7F;"/>
        <xsl:output-character character="⪁" string="&amp;#x2A81;"/>
        <xsl:output-character character="⪃" string="&amp;#x2A83;"/>
        <!--U022DA-0FE00 lesg-->
        <xsl:output-character character="⪓" string="&amp;#x2A93;"/>
        <xsl:output-character character="≶" string="&amp;#x2276;"/>
        <xsl:output-character character="⪑" string="&amp;#x2A91;"/>
        <xsl:output-character character="⋘" string="&amp;#x22D8;"/>
        <xsl:output-character character="≲" string="&amp;#x2272;"/>
        <xsl:output-character character="⪍" string="&amp;#x2A8D;"/>
        <xsl:output-character character="⪏" string="&amp;#x2A8F;"/>
        <xsl:output-character character="≪" string="&amp;#x226A;"/>
        <xsl:output-character character="⪦" string="&amp;#x2AA6;"/>
        <xsl:output-character character="⩹" string="&amp;#x2A79;"/>
        <xsl:output-character character="⋖" string="&amp;#x22D6;"/>
        <xsl:output-character character="⥶" string="&amp;#x2976;"/>
        <xsl:output-character character="⩻" string="&amp;#x2A7B;"/>
        <xsl:output-character character="⊴" string="&amp;#x22B4;"/>
        <xsl:output-character character="⨩" string="&amp;#x2A29;"/>
        <xsl:output-character character="∺" string="&amp;#x223A;"/>
        <xsl:output-character character="∣" string="&amp;#x2223;"/>
        <xsl:output-character character="⫛" string="&amp;#x2ADB;"/>
        <xsl:output-character character="⊧" string="&amp;#x22A7;"/>
        <xsl:output-character character="∾" string="&amp;#x223E;"/>
        <xsl:output-character character="≺" string="&amp;#x227A;"/>
        <xsl:output-character character="⪻" string="&amp;#x2ABB;"/>
        <xsl:output-character character="⪷" string="&amp;#x227E;"/>
        <xsl:output-character character="≼" string="&amp;#x227C;"/>
        <xsl:output-character character="⪯" string="&amp;#x227C;"/>
        <xsl:output-character character="⪳" string="&amp;#x2AB3;"/>
        <xsl:output-character character="≾" string="&amp;#x227E;"/>
        <xsl:output-character character="⊰" string="&amp;#x22B0;"/>
        <xsl:output-character character="∶" string="&#160;:&#160;"/>
        <xsl:output-character character="⊵" string="&amp;#x22B5;"/>
        <xsl:output-character character="⧎" string="&amp;#x29CE;"/>
        <xsl:output-character character="≻" string="&amp;#x227B;"/>
        <xsl:output-character character="⪼" string="&amp;#x2ABC;"/>
        <xsl:output-character character="⪸" string="&amp;#x227F;"/>
        <xsl:output-character character="≽" string="&amp;#x227D;"/>
        <xsl:output-character character="⪰" string="&amp;#x227D;"/>
        <xsl:output-character character="⪴" string="&amp;#x2AB4;"/>
        <xsl:output-character character="≿" string="&amp;#x227F;"/>
        <xsl:output-character character="⩦" string="&amp;#x2A66;"/>
        <xsl:output-character character="⌢" string="&amp;#xE426;"/>
        <xsl:output-character character="⪞" string="&amp;#x2A9E;"/>
        <xsl:output-character character="⪠" string="&amp;#x2AA0;"/>
        <xsl:output-character character="⪝" string="&amp;#x2A9D;"/>
        <xsl:output-character character="⪟" string="&amp;#x2A9F;"/>
        <xsl:output-character character="∣" string="&amp;#xE301;"/>
        <xsl:output-character character="⌣" string="&amp;#x2323;"/>
        <xsl:output-character character="⪪" string="&amp;#x2AAA;"/>
        <xsl:output-character character="⪬" string="&amp;#x2AAC;"/>
        <!--U02AAC-0FE00 smtes-->
        <xsl:output-character character="∥" string="&amp;#xE302;"/>
        <xsl:output-character character="⊏" string="&amp;#x228F;"/>
        <xsl:output-character character="⊑" string="&amp;#x2291;"/>
        <xsl:output-character character="⊐" string="&amp;#x2290;"/>
        <xsl:output-character character="⊒" string="&amp;#x2292;"/>
        <xsl:output-character character="⌣" string="&amp;#xE303;"/>
        <xsl:output-character character="⋐" string="&amp;#x22D0;"/>
        <xsl:output-character character="⫅" string="&amp;#x2286;"/>
        <xsl:output-character character="⫃" string="&amp;#x2AC3;"/>
        <xsl:output-character character="⫁" string="&amp;#x2AC1;"/>
        <xsl:output-character character="⪿" string="&amp;#x2ABF;"/>
        <xsl:output-character character="⥹" string="&amp;#x2979;"/>
        <xsl:output-character character="⫇" string="&amp;#x2AC7;"/>
        <xsl:output-character character="⫕" string="&amp;#x2AD5;"/>
        <xsl:output-character character="⫓" string="&amp;#x2AD3;"/>
        <xsl:output-character character="⋑" string="&amp;#x22D1;"/>
        <xsl:output-character character="⫘" string="&amp;#x2AD8;"/>
        <xsl:output-character character="⫆" string="&amp;#x2287;"/>
        <xsl:output-character character="⫄" string="&amp;#x2AC4;"/>
        <!--U02283-0002F suphsol-->
        <xsl:output-character character="⫗" string="&amp;#x2AD7;"/>
        <xsl:output-character character="⥻" string="&amp;#x297B;"/>
        <xsl:output-character character="⫂" string="&amp;#x2AC2;"/>
        <xsl:output-character character="⫀" string="&amp;#x2AC0;"/>
        <xsl:output-character character="⫈" string="&amp;#x2AC8;"/>
        <xsl:output-character character="⫔" string="&amp;#x2AD4;"/>
        <xsl:output-character character="⫖" string="&amp;#x2AD6;"/>
        <xsl:output-character character="≈" string="&amp;#xE306;"/>
        <xsl:output-character character="∼" string="&amp;#xE429;"/>
        <xsl:output-character character="⫚" string="&amp;#x2ADA;"/>
        <xsl:output-character character="≜" string="&amp;#x225C;"/>
        <xsl:output-character character="≬" string="&amp;#x226C;"/>
        <xsl:output-character character="⫨" string="&amp;#x2AE8;"/>
        <xsl:output-character character="⫫" string="&amp;#x2AEB;"/>
        <xsl:output-character character="⫩" string="&amp;#x2AE9;"/>
        <xsl:output-character character="⊢" string="&amp;#x22A2;"/>
        <xsl:output-character character="⊨" string="&amp;#x22A8;"/>
        <xsl:output-character character="⊩" string="&amp;#x22A9;"/>
        <xsl:output-character character="⊫" string="&amp;#x22AB;"/>
        <xsl:output-character character="⫦" string="&amp;#x2AE6;"/>
        <xsl:output-character character="⊲" string="&amp;#x22B2;"/>
        <xsl:output-character character="∝" string="&amp;#x221D;"/>
        <xsl:output-character character="⊳" string="&amp;#x22B3;"/>
        <xsl:output-character character="⊪" string="&amp;#x22AA;"/>
        <!-- isogrk1map.xsl -->
        <xsl:output-character character="α" string="&amp;#x03B1;"/>
        <xsl:output-character character="Α" string="&amp;#x0391;"/>
        <xsl:output-character character="β" string="&amp;#x03B2;"/>
        <xsl:output-character character="Β" string="&amp;#x0392;"/>
        <xsl:output-character character="δ" string="&amp;#x03B4;"/>
        <xsl:output-character character="Δ" string="&amp;#x0394;"/>
        <xsl:output-character character="η" string="&amp;#x03B7;"/>
        <xsl:output-character character="Η" string="&amp;#x0397;"/>
        <xsl:output-character character="ε" string="&amp;#x03B5;"/>
        <xsl:output-character character="Ε" string="&amp;#x0395;"/>
        <xsl:output-character character="γ" string="&amp;#x03B3;"/>
        <xsl:output-character character="Γ" string="&amp;#x0393;"/>
        <xsl:output-character character="ι" string="&amp;#x03B9;"/>
        <xsl:output-character character="Ι" string="&amp;#x0399;"/>
        <xsl:output-character character="κ" string="&amp;#x03BA;"/>
        <xsl:output-character character="Κ" string="&amp;#x039A;"/>
        <xsl:output-character character="χ" string="&amp;#x03C7;"/>
        <xsl:output-character character="Χ" string="&amp;#x03A7;"/>
        <xsl:output-character character="λ" string="&amp;#x03BB;"/>
        <xsl:output-character character="Λ" string="&amp;#x039B;"/>
        <xsl:output-character character="μ" string="&amp;#x03BC;"/>
        <xsl:output-character character="Μ" string="&amp;#x039C;"/>
        <xsl:output-character character="ν" string="&amp;#x03BD;"/>
        <xsl:output-character character="Ν" string="&amp;#x039D;"/>
        <xsl:output-character character="ο" string="&amp;#x03BF;"/>
        <xsl:output-character character="Ο" string="&amp;#x039F;"/>
        <xsl:output-character character="ω" string="&amp;#x03C9;"/>
        <xsl:output-character character="Ω" string="&amp;#x03A9;"/>
        <xsl:output-character character="π" string="&amp;#x03C0;"/>
        <xsl:output-character character="Π" string="&amp;#x03A0;"/>
        <xsl:output-character character="φ" string="&amp;#x03C6;"/>
        <xsl:output-character character="Φ" string="&amp;#x03A6;"/>
        <xsl:output-character character="ψ" string="&amp;#x03C8;"/>
        <xsl:output-character character="Ψ" string="&amp;#x03A8;"/>
        <xsl:output-character character="ρ" string="&amp;#x03C1;"/>
        <xsl:output-character character="Ρ" string="&amp;#x03A1;"/>
        <xsl:output-character character="ς" string="&amp;#x03C2;"/>
        <xsl:output-character character="σ" string="&amp;#x03C3;"/>
        <xsl:output-character character="Σ" string="&amp;#x03A3;"/>
        <xsl:output-character character="τ" string="&amp;#x03C4;"/>
        <xsl:output-character character="Τ" string="&amp;#x03A4;"/>
        <xsl:output-character character="θ" string="&amp;#x03B8;"/>
        <xsl:output-character character="Θ" string="&amp;#x0398;"/>
        <xsl:output-character character="υ" string="&amp;#x03C5;"/>
        <xsl:output-character character="Υ" string="&amp;#x03A5;"/>
        <xsl:output-character character="ξ" string="&amp;#x03BE;"/>
        <xsl:output-character character="Ξ" string="&amp;#x039E;"/>
        <xsl:output-character character="ζ" string="&amp;#x03B6;"/>
        <xsl:output-character character="Ζ" string="&amp;#x0396;"/>
        <!-- isogrk2map.xsl -->
        <xsl:output-character character="ά" string="&amp;#x03AC;"/>
        <xsl:output-character character="Ά" string="&amp;#x0386;"/>
        <xsl:output-character character="έ" string="&amp;#x03AD;"/>
        <xsl:output-character character="Έ" string="&amp;#x0388;"/>
        <xsl:output-character character="ή" string="&amp;#x03AE;"/>
        <xsl:output-character character="Ή" string="&amp;#x0389;"/>
        <xsl:output-character character="ί" string="&amp;#x03AF;"/>
        <xsl:output-character character="Ί" string="&amp;#x038A;"/>
        <xsl:output-character character="ΐ" string="&amp;#x0390;"/>
        <xsl:output-character character="ϊ" string="&amp;#x03CA;"/>
        <xsl:output-character character="Ϊ" string="&amp;#x03AA;"/>
        <xsl:output-character character="ό" string="&amp;#x03CC;"/>
        <xsl:output-character character="Ό" string="&amp;#x038C;"/>
        <xsl:output-character character="ώ" string="&amp;#x03CE;"/>
        <xsl:output-character character="Ώ" string="&amp;#x038F;"/>
        <xsl:output-character character="ύ" string="&amp;#x03CD;"/>
        <xsl:output-character character="Ύ" string="&amp;#x038E;"/>
        <xsl:output-character character="ΰ" string="&amp;#x03B0;"/>
        <xsl:output-character character="ϋ" string="&amp;#x03CB;"/>
        <xsl:output-character character="Ϋ" string="&amp;#x03AB;"/>
        <!-- isogrk3map.xsl -->
        <xsl:output-character character="α" string="&amp;#x03B1;"/>
        <xsl:output-character character="β" string="&amp;#x03B2;"/>
        <xsl:output-character character="χ" string="&amp;#x03C7;"/>
        <xsl:output-character character="δ" string="&amp;#x03B4;"/>
        <xsl:output-character character="Δ" string="&amp;#x0394;"/>
        <xsl:output-character character="ϵ" string="&amp;#x220A;"/>
        <xsl:output-character character="ε" string="&amp;#x03B5;"/>
        <xsl:output-character character="η" string="&amp;#x03B7;"/>
        <xsl:output-character character="γ" string="&amp;#x03B3;"/>
        <xsl:output-character character="Γ" string="&amp;#x0393;"/>
        <xsl:output-character character="ϝ" string="&amp;#x03DC;"/>
        <xsl:output-character character="Ϝ" string="&amp;#x03DC;"/>
        <xsl:output-character character="ι" string="&amp;#x03B9;"/>
        <xsl:output-character character="κ" string="&amp;#x03BA;"/>
        <xsl:output-character character="ϰ" string="&amp;#x03F0;"/>
        <xsl:output-character character="λ" string="&amp;#x03BB;"/>
        <xsl:output-character character="Λ" string="&amp;#x039B;"/>
        <xsl:output-character character="μ" string="&amp;#x03BC;"/>
        <xsl:output-character character="ν" string="&amp;#x03BD;"/>
        <xsl:output-character character="ω" string="&amp;#x03C9;"/>
        <xsl:output-character character="Ω" string="&amp;#x03A9;"/>
        <xsl:output-character character="ϕ" string="&amp;#x03C6;"/>
        <xsl:output-character character="Φ" string="&amp;#x03A6;"/>
        <xsl:output-character character="φ" string="&amp;#x03D5;"/>
        <xsl:output-character character="" string="&amp;#x03C6;"/>
        <xsl:output-character character="π" string="&amp;#x03C0;"/>
        <xsl:output-character character="Π" string="&amp;#x03A0;"/>
        <xsl:output-character character="ϖ" string="&amp;#x03D6;"/>
        <xsl:output-character character="ψ" string="&amp;#x03C8;"/>
        <xsl:output-character character="Ψ" string="&amp;#x03A8;"/>
        <xsl:output-character character="ρ" string="&amp;#x03C1;"/>
        <xsl:output-character character="ϱ" string="&amp;#x03F1;"/>
        <xsl:output-character character="σ" string="&amp;#x03C3;"/>
        <xsl:output-character character="Σ" string="&amp;#x03A3;"/>
        <xsl:output-character character="ς" string="&amp;#x03C2;"/>
        <xsl:output-character character="τ" string="&amp;#x03C4;"/>
        <xsl:output-character character="θ" string="&amp;#x03B8;"/>
        <xsl:output-character character="Θ" string="&amp;#x0398;"/>
        <xsl:output-character character="ϑ" string="&amp;#x03D1;"/>
        <xsl:output-character character="υ" string="&amp;#x03C5;"/>
        <xsl:output-character character="ϒ" string="&amp;#x03D2;"/>
        <xsl:output-character character="ξ" string="&amp;#x03BE;"/>
        <xsl:output-character character="Ξ" string="&amp;#x039E;"/>
        <xsl:output-character character="ζ" string="&amp;#x03B6;"/>
        <!-- isotechmap.xsl -->
        <xsl:output-character character="∿" string="&amp;#x223F;"/>
        <xsl:output-character character="ℵ" string="&amp;#x2135;"/>
        <xsl:output-character character="∧" string="&amp;#x2227;"/>
        <xsl:output-character character="⩓" string="&amp;#x2A53;"/>
        <xsl:output-character character="⩕" string="&amp;#x2A55;"/>
        <xsl:output-character character="⩜" string="&amp;#x2A5C;"/>
        <xsl:output-character character="⩘" string="&amp;#x2A58;"/>
        <xsl:output-character character="⩚" string="&amp;#x2A5A;"/>
        <xsl:output-character character="∟" string="&amp;#x221F;"/>
        <xsl:output-character character="∢" string="&amp;#x2222;"/>
        <xsl:output-character character="Å" string="&amp;#x212B;"/>
        <xsl:output-character character="≈" string="&amp;#x2248;"/>
        <xsl:output-character character="⩯" string="&amp;#x2A6F;"/>
        <xsl:output-character character="∳" string="&amp;#x2233;"/>
        <xsl:output-character character="⨑" string="&amp;#x2A11;"/>
        <xsl:output-character character="∵" string="&amp;#x2235;"/>
        <xsl:output-character character="ℬ" string="&amp;#x212C;"/>
        <!--U0003D-020E5 bne-->
        <!--U02261-020E5 bnequiv-->
        <xsl:output-character character="⌐" string="&amp;#x2310;"/>
        <xsl:output-character character="⫭" string="&amp;#x2AED;"/>
        <xsl:output-character character="⊥" string="&amp;#x22A5;"/>
        <xsl:output-character character="∩" string="&amp;#x2229;"/>
        <xsl:output-character character="∰" string="&amp;#x2230;"/>
        <xsl:output-character character="⨐" string="&amp;#x2A10;"/>
        <xsl:output-character character="∘" string="&amp;#x2218;"/>
        <xsl:output-character character="≅" string="&amp;#x2245;"/>
        <xsl:output-character character="∮" string="&amp;#x222E;"/>
        <xsl:output-character character="∯" string="&amp;#x222F;"/>
        <xsl:output-character character="⋯" string="&amp;#x22EF;"/>
        <xsl:output-character character="∪" string="&amp;#x222A;"/>
        <xsl:output-character character="∲" string="&amp;#x2232;"/>
        <xsl:output-character character="∱" string="&amp;#x2231;"/>
        <xsl:output-character character="⌭" string="&amp;#x232D;"/>
        <xsl:output-character character="⋲" string="&amp;#x22F2;"/>
        <xsl:output-character character="¨" string="&amp;#x0308;"/>
        <xsl:output-character character="⃜" string="&amp;#x20DC;"/>
        <xsl:output-character character="⧶" string="&amp;#x29F6;"/>
        <xsl:output-character character="⋱" string="&amp;#x22F1;"/>
        <xsl:output-character character="⦦" string="&amp;#x29A6;"/>
        <xsl:output-character character="�" string="&amp;#xFFFD;"/>
        <xsl:output-character character="⋕" string="&amp;#x22D5;"/>
        <xsl:output-character character="⧣" string="&amp;#x29E3;"/>
        <xsl:output-character character="≡" string="&amp;#x2261;"/>
        <xsl:output-character character="⧥" string="&amp;#x29E5;"/>
        <xsl:output-character character="∃" string="&amp;#x2203;"/>
        <xsl:output-character character="▱" string="&amp;#x25B1;"/>
        <xsl:output-character character="ƒ" string="&amp;#x0192;"/>
        <xsl:output-character character="∀" string="&amp;#x2200;"/>
        <xsl:output-character character="⨍" string="&amp;#x2A0D;"/>
        <xsl:output-character character="≥" string="&amp;#x2265;"/>
        <xsl:output-character character="ℋ" string="&amp;#x210B;"/>
        <xsl:output-character character="⇔" string="&amp;#xE365;"/>
        <xsl:output-character character="⧜" string="&amp;#x29DC;"/>
        <xsl:output-character character="Ƶ" string="&amp;#x01B5;"/>
        <xsl:output-character character="∞" string="&amp;#x221E;"/>
        <xsl:output-character character="⧝" string="&amp;#x29DD;"/>
        <xsl:output-character character="∫" string="&amp;#x222B;"/>
        <xsl:output-character character="∬" string="&amp;#x222C;"/>
        <xsl:output-character character="⨗" string="&amp;#x2A17;"/>
        <xsl:output-character character="∈" string="&amp;#x220A;"/>
        <xsl:output-character character="⋵" string="&amp;#x22F5;"/>
        <xsl:output-character character="⋹" string="&amp;#x22F9;"/>
        <xsl:output-character character="⋴" string="&amp;#x22F4;"/>
        <xsl:output-character character="⋳" string="&amp;#x22F3;"/>
        <xsl:output-character character="∈" string="&amp;#x2208;"/>
        <xsl:output-character character="ℒ" string="&amp;#x2112;"/>
        <xsl:output-character character="〈" string="&amp;#x3008;"/>
        <xsl:output-character character="《" string="&amp;#x300A;"/>
        <xsl:output-character character="⇐" string="&amp;#x21D0;"/>
        <xsl:output-character character="〔" string="&amp;#x3014;"/>
        <xsl:output-character character="≤" string="&amp;#x2264;"/>
        <xsl:output-character character="〘" string="&amp;#x3018;"/>
        <xsl:output-character character="〚" string="&amp;#x301A;"/>
        <xsl:output-character character="⦅" string="&amp;#x2985;"/>
        <xsl:output-character character="∗" string="&amp;#x2217;"/>
        <xsl:output-character character="−" string="&amp;#x2212;"/>
        <xsl:output-character character="∓" string="&amp;#x2213;"/>
        <xsl:output-character character="∇" string="&amp;#x2207;"/>
        <xsl:output-character character="≠" string="&amp;#x2260;"/>
        <!--U02250-00338 nedot-->
        <xsl:output-character character="⫲" string="&amp;#x2AF2;"/>
        <xsl:output-character character="∋" string="&amp;#x220D;"/>
        <xsl:output-character character="⋼" string="&amp;#x22FC;"/>
        <xsl:output-character character="⋺" string="&amp;#x22FA;"/>
        <xsl:output-character character="∋" string="&amp;#x220B;"/>
        <xsl:output-character character="⫬" string="&amp;#x00AC;"/>
        <xsl:output-character character="∉" string="&amp;#x2209;"/>
        <!--U022F5-00338 notindot-->
        <!--U022F9-00338 notinE-->
        <xsl:output-character character="∉" string="&amp;#x2209;"/>
        <xsl:output-character character="⋷" string="&amp;#x22F7;"/>
        <xsl:output-character character="⋶" string="&amp;#x22F6;"/>
        <xsl:output-character character="∌" string="&amp;#x220C;"/>
        <xsl:output-character character="∌" string="&amp;#x220C;"/>
        <xsl:output-character character="⋾" string="&amp;#x22FE;"/>
        <xsl:output-character character="⋽" string="&amp;#x22FD;"/>
        <!--U02AFD-020E5 nparsl-->
        <!--U02202-00338 npart-->
        <xsl:output-character character="⨔" string="&amp;#x2A14;"/>
        <xsl:output-character character="⧞" string="&amp;#x29DE;"/>
        <xsl:output-character character="⦻" string="&amp;#x29BB;"/>
        <xsl:output-character character="∨" string="&amp;#x2228;"/>
        <xsl:output-character character="⩔" string="&amp;#x2A54;"/>
        <xsl:output-character character="⩝" string="&amp;#x2A5D;"/>
        <xsl:output-character character="ℴ" string="&amp;#x2134;"/>
        <xsl:output-character character="⩖" string="&amp;#x2A56;"/>
        <xsl:output-character character="⩗" string="&amp;#x2A57;"/>
        <xsl:output-character character="⩛" string="&amp;#x2A5B;"/>
        <xsl:output-character character="∥" string="&amp;#x2225;"/>
        <xsl:output-character character="⫽" string="&amp;#x2AFD;"/>
        <xsl:output-character character="∂" string="&amp;#x2202;"/>
        <xsl:output-character character="‰" string="&amp;#x2030;"/>
        <xsl:output-character character="⊥" string="&amp;#x22A5;"/>
        <xsl:output-character character="‱" string="&amp;#x2031;"/>
        <xsl:output-character character="ℳ" string="&amp;#x2133;"/>
        <xsl:output-character character="⨕" string="&amp;#x2A15;"/>
        <xsl:output-character character="′" string="&amp;#x2032;"/>
        <xsl:output-character character="″" string="&amp;#x2033;"/>
        <xsl:output-character character="⌮" string="&amp;#x232E;"/>
        <xsl:output-character character="⌒" string="&amp;#x2312;"/>
        <xsl:output-character character="⌓" string="&amp;#x2313;"/>
        <xsl:output-character character="∝" string="&amp;#x221D;"/>
        <xsl:output-character character="⨌" string="&amp;#x2A0C;"/>
        <xsl:output-character character="⁗" string="&amp;#x2057;"/>
        <xsl:output-character character="⨖" string="&amp;#x2A16;"/>
        <xsl:output-character character="√" string="&amp;#x221A;"/>
        <xsl:output-character character="〉" string="&amp;#x3009;"/>
        <xsl:output-character character="》" string="&amp;#x300B;"/>
        <xsl:output-character character="⇒" string="&amp;#x2192;"/>
        <xsl:output-character character="〕" string="&amp;#x3015;"/>
        <xsl:output-character character="〙" string="&amp;#x3019;"/>
        <xsl:output-character character="〛" string="&amp;#x301B;"/>
        <xsl:output-character character="⦆" string="&amp;#x2986;"/>
        <xsl:output-character character="⨒" string="&amp;#x2A12;"/>
        <xsl:output-character character="⨓" string="&amp;#x2A13;"/>
        <xsl:output-character character="∼" string="&amp;#x223C;"/>
        <xsl:output-character character="⩪" string="&amp;#x2A6A;"/>
        <xsl:output-character character="≃" string="&amp;#x2243;"/>
        <xsl:output-character character="⧤" string="&amp;#x29E4;"/>
        <xsl:output-character character="□" string="&amp;#x25A1;"/>
        <xsl:output-character character="▪" string="&amp;#x25AA;"/>
        <xsl:output-character character="¯" string="&amp;#x00AF;"/>
        <xsl:output-character character="⊂" string="&amp;#x2282;"/>
        <xsl:output-character character="⊆" string="&amp;#x2286;"/>
        <xsl:output-character character="⊃" string="&amp;#x2283;"/>
        <xsl:output-character character="⊇" string="&amp;#x2287;"/>
        <xsl:output-character character="⃛" string="&amp;#x20DB;"/>
        <xsl:output-character character="∴" string="&amp;#x2234;"/>
        <xsl:output-character character="∭" string="&amp;#x222D;"/>
        <xsl:output-character character="⊤" string="&amp;#x22A4;"/>
        <xsl:output-character character="⌶" string="&amp;#x2336;"/>
        <xsl:output-character character="⫱" string="&amp;#x2AF1;"/>
        <xsl:output-character character="‴" string="&amp;#x2034;"/>
        <xsl:output-character character="⋰" string="&amp;#x22F0;"/>
        <xsl:output-character character="⦧" string="&amp;#x29A7;"/>
        <xsl:output-character character="⦜" string="&amp;#x299C;"/>
        <xsl:output-character character="≚" string="&amp;#x225A;"/>
        <xsl:output-character character="‖" string="&amp;#x2016;"/>
        <xsl:output-character character="≙" string="&amp;#x2259;"/>
        <xsl:output-character character="⋻" string="&amp;#x22FB;"/>
        <!-- genentitymap.xsl -->
        <xsl:output-character character="∿" string="&amp;#x223F;"/>
        <xsl:output-character character="ℵ" string="&amp;#x2135;"/>
        <xsl:output-character character="∧" string="&amp;#x2227;"/>
        <xsl:output-character character="⩓" string="&amp;#x2A53;"/>
        <xsl:output-character character="⩕" string="&amp;#x2A55;"/>
        <xsl:output-character character="⩜" string="&amp;#x2A5C;"/>
        <xsl:output-character character="⩘" string="&amp;#x2A58;"/>
        <xsl:output-character character="⩚" string="&amp;#x2A5A;"/>
        <xsl:output-character character="∟" string="&amp;#x221F;"/>
        <xsl:output-character character="∢" string="&amp;#x2222;"/>
        <xsl:output-character character="Å" string="&amp;#x212B;"/>
        <xsl:output-character character="≈" string="&amp;#x2248;"/>
        <xsl:output-character character="⩯" string="&amp;#x2A6F;"/>
        <xsl:output-character character="∳" string="&amp;#x2233;"/>
        <xsl:output-character character="⨑" string="&amp;#x2A11;"/>
        <xsl:output-character character="∵" string="&amp;#x2235;"/>
        <xsl:output-character character="ℬ" string="&amp;#x212C;"/>
        <!--U0003D-020E5 bne-->
        <!--U02261-020E5 bnequiv-->
        <xsl:output-character character="⌐" string="&amp;#x2310;"/>
        <xsl:output-character character="⫭" string="&amp;#x2AED;"/>
        <xsl:output-character character="⊥" string="&amp;#x22A5;"/>
        <xsl:output-character character="∩" string="&amp;#x2229;"/>
        <xsl:output-character character="∰" string="&amp;#x2230;"/>
        <xsl:output-character character="⨐" string="&amp;#x2A10;"/>
        <xsl:output-character character="∘" string="&amp;#x2218;"/>
        <xsl:output-character character="≅" string="&amp;#x2245;"/>
        <xsl:output-character character="∮" string="&amp;#x222E;"/>
        <xsl:output-character character="∯" string="&amp;#x222F;"/>
        <xsl:output-character character="⋯" string="&amp;#x22EF;"/>
        <xsl:output-character character="∪" string="&amp;#x222A;"/>
        <xsl:output-character character="∲" string="&amp;#x2232;"/>
        <xsl:output-character character="∱" string="&amp;#x2231;"/>
        <xsl:output-character character="⌭" string="&amp;#x232D;"/>
        <xsl:output-character character="⋲" string="&amp;#x22F2;"/>
        <xsl:output-character character="¨" string="&amp;#x0308;"/>
        <xsl:output-character character="⃜" string="&amp;#x20DC;"/>
        <xsl:output-character character="⧶" string="&amp;#x29F6;"/>
        <xsl:output-character character="⋱" string="&amp;#x22F1;"/>
        <xsl:output-character character="⦦" string="&amp;#x29A6;"/>
        <xsl:output-character character="�" string="&amp;#xFFFD;"/>
        <xsl:output-character character="⋕" string="&amp;#x22D5;"/>
        <xsl:output-character character="⧣" string="&amp;#x29E3;"/>
        <xsl:output-character character="≡" string="&amp;#x2261;"/>
        <xsl:output-character character="⧥" string="&amp;#x29E5;"/>
        <xsl:output-character character="∃" string="&amp;#x2203;"/>
        <xsl:output-character character="▱" string="&amp;#x25B1;"/>
        <xsl:output-character character="ƒ" string="&amp;#x0192;"/>
        <xsl:output-character character="∀" string="&amp;#x2200;"/>
        <xsl:output-character character="⨍" string="&amp;#x2A0D;"/>
        <xsl:output-character character="≥" string="&amp;#x2265;"/>
        <xsl:output-character character="ℋ" string="&amp;#x210B;"/>
        <xsl:output-character character="⇔" string="&amp;#xE365;"/>
        <xsl:output-character character="⧜" string="&amp;#x29DC;"/>
        <xsl:output-character character="Ƶ" string="&amp;#x01B5;"/>
        <xsl:output-character character="∞" string="&amp;#x221E;"/>
        <xsl:output-character character="⧝" string="&amp;#x29DD;"/>
        <xsl:output-character character="∫" string="&amp;#x222B;"/>
        <xsl:output-character character="∬" string="&amp;#x222C;"/>
        <xsl:output-character character="⨗" string="&amp;#x2A17;"/>
        <xsl:output-character character="∈" string="&amp;#x220A;"/>
        <xsl:output-character character="⋵" string="&amp;#x22F5;"/>
        <xsl:output-character character="⋹" string="&amp;#x22F9;"/>
        <xsl:output-character character="⋴" string="&amp;#x22F4;"/>
        <xsl:output-character character="⋳" string="&amp;#x22F3;"/>
        <xsl:output-character character="∈" string="&amp;#x2208;"/>
        <xsl:output-character character="ℒ" string="&amp;#x2112;"/>
        <xsl:output-character character="〈" string="&amp;#x3008;"/>
        <xsl:output-character character="《" string="&amp;#x300A;"/>
        <xsl:output-character character="⇐" string="&amp;#x21D0;"/>
        <xsl:output-character character="〔" string="&amp;#x3014;"/>
        <xsl:output-character character="≤" string="&amp;#x2264;"/>
        <xsl:output-character character="〘" string="&amp;#x3018;"/>
        <xsl:output-character character="〚" string="&amp;#x301A;"/>
        <xsl:output-character character="⦅" string="&amp;#x2985;"/>
        <xsl:output-character character="∗" string="&amp;#x2217;"/>
        <xsl:output-character character="−" string="&amp;#x2212;"/>
        <xsl:output-character character="∓" string="&amp;#x2213;"/>
        <xsl:output-character character="∇" string="&amp;#x2207;"/>
        <xsl:output-character character="≠" string="&amp;#x2260;"/>
        <!--U02250-00338 nedot-->
        <xsl:output-character character="⫲" string="&amp;#x2AF2;"/>
        <xsl:output-character character="∋" string="&amp;#x220D;"/>
        <xsl:output-character character="⋼" string="&amp;#x22FC;"/>
        <xsl:output-character character="⋺" string="&amp;#x22FA;"/>
        <xsl:output-character character="∋" string="&amp;#x220B;"/>
        <xsl:output-character character="⫬" string="&amp;#x00AC;"/>
        <xsl:output-character character="∉" string="&amp;#x2209;"/>
        <!--U022F5-00338 notindot-->
        <!--U022F9-00338 notinE-->
        <xsl:output-character character="∉" string="&amp;#x2209;"/>
        <xsl:output-character character="⋷" string="&amp;#x22F7;"/>
        <xsl:output-character character="⋶" string="&amp;#x22F6;"/>
        <xsl:output-character character="∌" string="&amp;#x220C;"/>
        <xsl:output-character character="∌" string="&amp;#x220C;"/>
        <xsl:output-character character="⋾" string="&amp;#x22FE;"/>
        <xsl:output-character character="⋽" string="&amp;#x22FD;"/>
        <!--U02AFD-020E5 nparsl-->
        <!--U02202-00338 npart-->
        <xsl:output-character character="⨔" string="&amp;#x2A14;"/>
        <xsl:output-character character="⧞" string="&amp;#x29DE;"/>
        <xsl:output-character character="⦻" string="&amp;#x29BB;"/>
        <xsl:output-character character="∨" string="&amp;#x2228;"/>
        <xsl:output-character character="⩔" string="&amp;#x2A54;"/>
        <xsl:output-character character="⩝" string="&amp;#x2A5D;"/>
        <xsl:output-character character="ℴ" string="&amp;#x2134;"/>
        <xsl:output-character character="⩖" string="&amp;#x2A56;"/>
        <xsl:output-character character="⩗" string="&amp;#x2A57;"/>
        <xsl:output-character character="⩛" string="&amp;#x2A5B;"/>
        <xsl:output-character character="∥" string="&amp;#x2225;"/>
        <xsl:output-character character="⫽" string="&amp;#x2AFD;"/>
        <xsl:output-character character="∂" string="&amp;#x2202;"/>
        <xsl:output-character character="‰" string="&amp;#x2030;"/>
        <xsl:output-character character="⊥" string="&amp;#x22A5;"/>
        <xsl:output-character character="‱" string="&amp;#x2031;"/>
        <xsl:output-character character="ℳ" string="&amp;#x2133;"/>
        <xsl:output-character character="⨕" string="&amp;#x2A15;"/>
        <xsl:output-character character="′" string="&amp;#x2032;"/>
        <xsl:output-character character="″" string="&amp;#x2033;"/>
        <xsl:output-character character="⌮" string="&amp;#x232E;"/>
        <xsl:output-character character="⌒" string="&amp;#x2312;"/>
        <xsl:output-character character="⌓" string="&amp;#x2313;"/>
        <xsl:output-character character="∝" string="&amp;#x221D;"/>
        <xsl:output-character character="⨌" string="&amp;#x2A0C;"/>
        <xsl:output-character character="⁗" string="&amp;#x2057;"/>
        <xsl:output-character character="⨖" string="&amp;#x2A16;"/>
        <xsl:output-character character="√" string="&amp;#x221A;"/>
        <xsl:output-character character="〉" string="&amp;#x3009;"/>
        <xsl:output-character character="》" string="&amp;#x300B;"/>
        <xsl:output-character character="⇒" string="&amp;#x2192;"/>
        <xsl:output-character character="〕" string="&amp;#x3015;"/>
        <xsl:output-character character="〙" string="&amp;#x3019;"/>
        <xsl:output-character character="〛" string="&amp;#x301B;"/>
        <xsl:output-character character="⦆" string="&amp;#x2986;"/>
        <xsl:output-character character="⨒" string="&amp;#x2A12;"/>
        <xsl:output-character character="⨓" string="&amp;#x2A13;"/>
        <xsl:output-character character="∼" string="&amp;#x223C;"/>
        <xsl:output-character character="⩪" string="&amp;#x2A6A;"/>
        <xsl:output-character character="≃" string="&amp;#x2243;"/>
        <xsl:output-character character="⧤" string="&amp;#x29E4;"/>
        <xsl:output-character character="□" string="&amp;#x25A1;"/>
        <xsl:output-character character="▪" string="&amp;#x25AA;"/>
        <xsl:output-character character="¯" string="&amp;#x00AF;"/>
        <xsl:output-character character="⊂" string="&amp;#x2282;"/>
        <xsl:output-character character="⊆" string="&amp;#x2286;"/>
        <xsl:output-character character="⊃" string="&amp;#x2283;"/>
        <xsl:output-character character="⊇" string="&amp;#x2287;"/>
        <xsl:output-character character="⃛" string="&amp;#x20DB;"/>
        <xsl:output-character character="∴" string="&amp;#x2234;"/>
        <xsl:output-character character="∭" string="&amp;#x222D;"/>
        <xsl:output-character character="⊤" string="&amp;#x22A4;"/>
        <xsl:output-character character="⌶" string="&amp;#x2336;"/>
        <xsl:output-character character="⫱" string="&amp;#x2AF1;"/>
        <xsl:output-character character="‴" string="&amp;#x2034;"/>
        <xsl:output-character character="⋰" string="&amp;#x22F0;"/>
        <xsl:output-character character="⦧" string="&amp;#x29A7;"/>
        <xsl:output-character character="⦜" string="&amp;#x299C;"/>
        <xsl:output-character character="≚" string="&amp;#x225A;"/>
        <xsl:output-character character="‖" string="&amp;#x2016;"/>
        <xsl:output-character character="≙" string="&amp;#x2259;"/>
        <xsl:output-character character="⋻" string="&amp;#x22FB;"/>
        <xsl:output-character character="" string="&amp;#x0061;"/>
        <xsl:output-character character="" string="&amp;#x0062;"/>
        <xsl:output-character character="ə" string="&amp;#x0259;"/>
        <xsl:output-character character=" " string="&amp;#x2029;"/>
        <xsl:output-character character="ə" string="&amp;#x0259;"/>
        <xsl:output-character character="&gt;" string="&amp;#x003E;"/>
        <xsl:output-character character="&lt;" string="&amp;#x003C;"/>
        <xsl:output-character character="&amp;" string="&amp;#x0026;"/>
        <xsl:output-character character="&apos;" string="&amp;#x0027;"/>
        <xsl:output-character character="&quot;" string="&amp;#x0022;"/>
        </xsl:character-map>


    <!-- <xsl:character-map name="Ascii2Unicode">
      <!-\- isoboxmap.xsl -\->
      <!-\- <xsl:output-character character="%" string="&amp;#x0025;"/> -\->
<!-\-<xsl:output-character character="&" string="&amp;#x0026;"/>-\->
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
<xsl:output-character character=" " string="&#160;"/>
<!-\-<xsl:output-character character=" " string="&amp;#x2002;"/>-\->
<!-\-<xsl:output-character character=" " string="&#160;&#160;"/>-\->
<!-\-<xsl:output-character character=" " string="&amp;#x2003;"/>-\->
<xsl:output-character character=" " string="&amp;#x2004;"/>
<xsl:output-character character=" " string="&amp;#x2005;"/>
<xsl:output-character character=" " string="&amp;#x2007;"/>
<xsl:output-character character=" " string="&amp;#x2008;"/>
<xsl:output-character character=" " string="&amp;#x2009;"/>
<!-\-<xsl:output-character character=" " string="&amp;#x200A;"/>-\->
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
<!-\- My called TEMPLATES from CK -\->  
 -->
    
      
    <!--Added for index on 25-01-2021-->
    <xsl:template match="p//span[@class='Main' or matches(@class,'Sub([0-9]+)')]">
        
        <xsl:if test="//p//span[@class='Main' or matches(@class,'Sub([0-9]+)')]">
                <xsl:element name="CharacterStyleRange">
                    
                    <xsl:attribute name="AppliedCharacterStyle" select="'CharacterStyle/$ID/[No character style]'"/>
                <!--Level 1-->
                <xsl:if test="self::span[@class='Main']">
                    <xsl:variable name="index1" select="."/>
                    <xsl:variable name="data-id" select="@data-id"/>
                    <xsl:variable name="data-PageReferenceType" select="@data-PageReferenceType"/>
                    <!--<xsl:if test="not(//span[matches(@class,'Sub([0-9]+)')][concat($data-id,@class)=@data-mark] or self::span[@class='Main'][not(//span[matches(@class,'Sub([0-9]+)')][concat($data-id,@class)=@data-mark])][.=preceding::span[@class='Main']/.] or self::span[@class='Main'][not(//span[matches(@class,'Sub([0-9]+)')][concat($data-id,@class)=@data-mark])][.=following::span[@class='Main']/.])">-->
                    <xsl:if test="not(//span[matches(@class,'Sub([0-9]+)')][concat($data-id,@class)=@data-mark])">
                    <xsl:element name="PageReference">
                        <xsl:attribute name="Self" select="'di2'"/>
                        <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                        <xsl:attribute name="ReferencedTopic" select="concat('di2', 'Topicn', $index1)"/>
                        
                        <xsl:variable name="num">
                            <xsl:value-of select="count(preceding::span[@class = 'Main' or matches(@class, 'Sub([0-9]+)')]) + 1"/>
                        </xsl:variable>
                        <xsl:attribute name="Id">
                            <xsl:value-of select="$num"/>
                        </xsl:attribute>
                        <xsl:if test="$data-PageReferenceType &gt; 0">
                            <xsl:attribute name="PageReferenceType">
                                <xsl:value-of select="'ForNextNParagraphs'"/>
                            </xsl:attribute>
                        
                            <xsl:element name="Properties">
                                <xsl:element name="PageReferenceLimit">
                                    <xsl:attribute name="type" select="'long'"/>
                                        <xsl:value-of select="$data-PageReferenceType"/>
                                </xsl:element>
                            </xsl:element>
                        </xsl:if>
                    </xsl:element>
                    
                    </xsl:if>
                        <!-- Level 2 -->
                        <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id,@class)=@data-mark]">
                            
                            <xsl:variable name="index2" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id,@class)=@data-mark]/current()"/>
                            <xsl:variable name="data-id2" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id,@class)=@data-mark]/current()/@data-id"/>
                            <xsl:variable name="data-PageReferenceType2" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id,@class)=@data-mark]/current()/@data-PageReferenceType"/>
                            <xsl:element name="PageReference">
                                <xsl:attribute name="Self" select="'di2'"/>
                                <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                <xsl:attribute name="ReferencedTopic" select="concat('di2', 'Topicn', $index1, 'Topicn', $index2)"/>
                                <xsl:variable name="num">
                                    <xsl:value-of select="count(preceding::span[@class = 'Main' or matches(@class, 'Sub([0-9]+)')]) + 1"/>
                                </xsl:variable>
                                <xsl:attribute name="Id">
                                    <xsl:value-of select="$num"/>
                                </xsl:attribute>
                                <xsl:if test="$data-PageReferenceType2 &gt; 0">
                                    <xsl:attribute name="PageReferenceType">
                                        <xsl:value-of select="'ForNextNParagraphs'"/>
                                    </xsl:attribute>
                                    
                                    <xsl:element name="Properties">
                                        <xsl:element name="PageReferenceLimit">
                                            <xsl:attribute name="type" select="'long'"/>
                                            <xsl:value-of select="$data-PageReferenceType2"/>
                                        </xsl:element>
                                    </xsl:element>
                                </xsl:if>
                            </xsl:element>  
                                <!-- Level 3 -->
                                <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id2,@class)=@data-mark]">
                                    
                                   
                                    <xsl:variable name="index3" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id2,@class)=@data-mark]/current()"/>
                                    <xsl:variable name="data-id3" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id2,@class)=@data-mark]/current()/@data-id"/>
                                    <xsl:variable name="data-PageReferenceType3" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id2,@class)=@data-mark]/current()/@data-PageReferenceType"/>
                                    <xsl:element name="PageReference">
                                        <xsl:attribute name="Self" select="'di2'"/>
                                        <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                        <xsl:attribute name="ReferencedTopic" select="concat('di2', 'Topicn', $index1, 'Topicn', $index2, 'Topicn', $index3)"/>
                                        <xsl:variable name="num">
                                            <xsl:value-of select="count(preceding::span[@class = 'Main' or matches(@class, 'Sub([0-9]+)')]) + 1"/>
                                        </xsl:variable>
                                        <xsl:attribute name="Id">
                                            <xsl:value-of select="$num"/>
                                        </xsl:attribute>
                                        <xsl:if test="$data-PageReferenceType3 &gt; 0">
                                            <xsl:attribute name="PageReferenceType">
                                                <xsl:value-of select="'ForNextNParagraphs'"/>
                                            </xsl:attribute>
                                            
                                            <xsl:element name="Properties">
                                                <xsl:element name="PageReferenceLimit">
                                                    <xsl:attribute name="type" select="'long'"/>
                                                    <xsl:value-of select="$data-PageReferenceType3"/>
                                                </xsl:element>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:element>
                                        
                                        <!-- Level 4 -->
                                        <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id3,@class)=@data-mark]">
                                            <xsl:variable name="index4" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id3,@class)=@data-mark]/current()"/>
                                            <xsl:variable name="data-id4" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id3,@class)=@data-mark]/current()/@data-id"/>
                                            <xsl:variable name="data-PageReferenceType4" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id3,@class)=@data-mark]/current()/@data-PageReferenceType"/>
                                            <xsl:element name="PageReference">
                                                <xsl:attribute name="Self" select="'di2'"/>
                                                <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                <xsl:attribute name="ReferencedTopic" select="concat('di2', 'Topicn', $index1, 'Topicn', $index2, 'Topicn', $index3, 'Topicn', $index4)"/>
                                                <xsl:variable name="num">
                                                    <xsl:value-of select="count(preceding::span[@class = 'Main' or matches(@class, 'Sub([0-9]+)')]) + 1"/>
                                                </xsl:variable>
                                                <xsl:attribute name="Id">
                                                    <xsl:value-of select="$num"/>
                                                </xsl:attribute>
                                                <xsl:if test="$data-PageReferenceType4 &gt; 0">
                                                    <xsl:attribute name="PageReferenceType">
                                                        <xsl:value-of select="'ForNextNParagraphs'"/>
                                                    </xsl:attribute>
                                                    
                                                    <xsl:element name="Properties">
                                                        <xsl:element name="PageReferenceLimit">
                                                            <xsl:attribute name="type" select="'long'"/>
                                                            <xsl:value-of select="$data-PageReferenceType4"/>
                                                        </xsl:element>
                                                    </xsl:element>
                                                </xsl:if>
                                            </xsl:element>
                                                
                                                <!-- Level 5 -->
                                                <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id4,@class)=@data-mark]">
                                                    <xsl:variable name="index5" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id4,@class)=@data-mark]/current()"/>
                                                    <xsl:variable name="data-id5" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id4,@class)=@data-mark]/current()/@data-id"/>
                                                    <xsl:variable name="data-PageReferenceType5" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id4,@class)=@data-mark]/current()/@data-PageReferenceType"/>
                                                    <xsl:element name="PageReference">
                                                        <xsl:attribute name="Self" select="'di2'"/>
                                                        <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                        <xsl:attribute name="ReferencedTopic" select="concat('di2', 'Topicn', $index1, 'Topicn', $index2, 'Topicn', $index3, 'Topicn', $index4, 'Topicn', $index5)"/>
                                                        <xsl:variable name="num">
                                                            <xsl:value-of select="count(preceding::span[@class = 'Main' or matches(@class, 'Sub([0-9]+)')]) + 1"/>
                                                        </xsl:variable>
                                                        <xsl:attribute name="Id">
                                                            <xsl:value-of select="$num"/>
                                                        </xsl:attribute>
                                                        <xsl:if test="$data-PageReferenceType5 &gt; 0">
                                                            <xsl:attribute name="PageReferenceType">
                                                                <xsl:value-of select="'ForNextNParagraphs'"/>
                                                            </xsl:attribute>
                                                            
                                                            <xsl:element name="Properties">
                                                                <xsl:element name="PageReferenceLimit">
                                                                    <xsl:attribute name="type" select="'long'"/>
                                                                    <xsl:value-of select="$data-PageReferenceType5"/>
                                                                </xsl:element>
                                                            </xsl:element>
                                                        </xsl:if>
                                                    </xsl:element>
                                                        
                                                        
                                                        <!-- Level 6 -->
                                                        <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id5,@class)=@data-mark]">
                                                            <xsl:variable name="index6" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id5,@class)=@data-mark]/current()"/>
                                                            <xsl:variable name="data-id6" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id5,@class)=@data-mark]/current()/@data-id"/>
                                                            <xsl:variable name="data-PageReferenceType6" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id5,@class)=@data-mark]/current()/@data-PageReferenceType"/>
                                                            <xsl:element name="PageReference">
                                                                <xsl:attribute name="Self" select="'di2'"/>
                                                                <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                <xsl:attribute name="ReferencedTopic" select="concat('di2', 'Topicn', $index1, 'Topicn', $index2, 'Topicn', $index3, 'Topicn', $index4, 'Topicn', $index5, 'Topicn', $index6)"/>
                                                                <xsl:variable name="num">
                                                                    <xsl:value-of select="count(preceding::span[@class = 'Main' or matches(@class, 'Sub([0-9]+)')]) + 1"/>
                                                                </xsl:variable>
                                                                <xsl:attribute name="Id">
                                                                    <xsl:value-of select="$num"/>
                                                                </xsl:attribute>
                                                                <xsl:if test="$data-PageReferenceType6 &gt; 0">
                                                                    <xsl:attribute name="PageReferenceType">
                                                                        <xsl:value-of select="'ForNextNParagraphs'"/>
                                                                    </xsl:attribute>
                                                                    
                                                                    <xsl:element name="Properties">
                                                                        <xsl:element name="PageReferenceLimit">
                                                                            <xsl:attribute name="type" select="'long'"/>
                                                                            <xsl:value-of select="$data-PageReferenceType6"/>
                                                                        </xsl:element>
                                                                    </xsl:element>
                                                                </xsl:if>
                                                            </xsl:element>
                                                                
                                                                <!-- Level 7 -->
                                                                <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id6,@class)=@data-mark]">
                                                                    <xsl:variable name="index7" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id6,@class)=@data-mark]/current()"/>
                                                                    <xsl:variable name="data-id7" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id6,@class)=@data-mark]/current()/@data-id"/>
                                                                    <xsl:variable name="data-PageReferenceType7" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id6,@class)=@data-mark]/current()/@data-PageReferenceType"/>
                                                                    <xsl:element name="PageReference">
                                                                        <xsl:attribute name="Self" select="'di2'"/>
                                                                        <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                        <xsl:attribute name="ReferencedTopic" select="concat('di2', 'Topicn', $index1, 'Topicn', $index2, 'Topicn', $index3, 'Topicn', $index4, 'Topicn', $index5, 'Topicn', $index6, 'Topicn', $index7)"/>
                                                                        <xsl:variable name="num">
                                                                            <xsl:value-of select="count(preceding::span[@class = 'Main' or matches(@class, 'Sub([0-9]+)')]) + 1"/>
                                                                        </xsl:variable>
                                                                        <xsl:attribute name="Id">
                                                                            <xsl:value-of select="$num"/>
                                                                        </xsl:attribute>
                                                                        <xsl:if test="$data-PageReferenceType7 &gt; 0">
                                                                            <xsl:attribute name="PageReferenceType">
                                                                                <xsl:value-of select="'ForNextNParagraphs'"/>
                                                                            </xsl:attribute>
                                                                            
                                                                            <xsl:element name="Properties">
                                                                                <xsl:element name="PageReferenceLimit">
                                                                                    <xsl:attribute name="type" select="'long'"/>
                                                                                    <xsl:value-of select="$data-PageReferenceType7"/>
                                                                                </xsl:element>
                                                                            </xsl:element>
                                                                        </xsl:if>
                                                                    </xsl:element>  
                                                                        
                                                                        <!-- Level 8 -->
                                                                        <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id7,@class)=@data-mark]">
                                                                            <xsl:variable name="index8" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id7,@class)=@data-mark]/current()"/>
                                                                            <xsl:variable name="data-id8" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id7,@class)=@data-mark]/current()/@data-id"/>
                                                                            <xsl:variable name="data-PageReferenceType8" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id7,@class)=@data-mark]/current()/@data-PageReferenceType"/>
                                                                            <xsl:element name="PageReference">
                                                                                <xsl:attribute name="Self" select="'di2'"/>
                                                                                <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                                <xsl:attribute name="ReferencedTopic" select="concat('di2', 'Topicn', $index1, 'Topicn', $index2, 'Topicn', $index3, 'Topicn', $index4, 'Topicn', $index5, 'Topicn', $index6, 'Topicn', $index7, 'Topicn', $index8)"/>
                                                                                <xsl:variable name="num">
                                                                                    <xsl:value-of select="count(preceding::span[@class = 'Main' or matches(@class, 'Sub([0-9]+)')]) + 1"/>
                                                                                </xsl:variable>
                                                                                <xsl:attribute name="Id">
                                                                                    <xsl:value-of select="$num"/>
                                                                                </xsl:attribute>
                                                                                <xsl:if test="$data-PageReferenceType8 &gt; 0">
                                                                                    <xsl:attribute name="PageReferenceType">
                                                                                        <xsl:value-of select="'ForNextNParagraphs'"/>
                                                                                    </xsl:attribute>
                                                                                    
                                                                                    <xsl:element name="Properties">
                                                                                        <xsl:element name="PageReferenceLimit">
                                                                                            <xsl:attribute name="type" select="'long'"/>
                                                                                            <xsl:value-of select="$data-PageReferenceType8"/>
                                                                                        </xsl:element>
                                                                                    </xsl:element>
                                                                                </xsl:if>
                                                                            </xsl:element>  
                                                                                <!-- Level 9 -->
                                                                                
                                                                                <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id8,@class)=@data-mark]">
                                                                                    <xsl:variable name="index9" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id8,@class)=@data-mark]/current()"/>
                                                                                    <xsl:variable name="data-id9" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id8,@class)=@data-mark]/current()/@data-id"/>
                                                                                    <xsl:variable name="data-PageReferenceType9" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id8,@class)=@data-mark]/current()/@data-PageReferenceType"/>
                                                                                    <xsl:element name="PageReference">
                                                                                        <xsl:attribute name="Self" select="'di2'"/>
                                                                                        <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                                        <xsl:attribute name="ReferencedTopic" select="concat('di2', 'Topicn', $index1, 'Topicn', $index2, 'Topicn', $index3, 'Topicn', $index4, 'Topicn', $index5, 'Topicn', $index6, 'Topicn', $index7, 'Topicn', $index8,'Topicn', $index9)"/>
                                                                                        <xsl:variable name="num">
                                                                                            <xsl:value-of select="count(preceding::span[@class = 'Main' or matches(@class, 'Sub([0-9]+)')]) + 1"/>
                                                                                        </xsl:variable>
                                                                                        <xsl:attribute name="Id">
                                                                                            <xsl:value-of select="$num"/>
                                                                                        </xsl:attribute>
                                                                                        <xsl:if test="$data-PageReferenceType9 &gt; 0">
                                                                                            <xsl:attribute name="PageReferenceType">
                                                                                                <xsl:value-of select="'ForNextNParagraphs'"/>
                                                                                            </xsl:attribute>
                                                                                            
                                                                                            <xsl:element name="Properties">
                                                                                                <xsl:element name="PageReferenceLimit">
                                                                                                    <xsl:attribute name="type" select="'long'"/>
                                                                                                    <xsl:value-of select="$data-PageReferenceType9"/>
                                                                                                </xsl:element>
                                                                                            </xsl:element>
                                                                                        </xsl:if>
                                                                                    </xsl:element>   
                                                                                        
                                                                                        <!-- Level 10 -->
                                                                                        
                                                                                        <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id9,@class)=@data-mark]">
                                                                                            <xsl:variable name="index10" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id9,@class)=@data-mark]/current()"/>
                                                                                            <xsl:variable name="data-id10" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id9,@class)=@data-mark]/current()/@data-id"/>
                                                                                            <xsl:variable name="data-PageReferenceType10" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id9,@class)=@data-mark]/current()/@data-PageReferenceType"/>
                                                                                            <xsl:element name="PageReference">
                                                                                                <xsl:attribute name="Self" select="'di2'"/>
                                                                                                <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                                                <xsl:attribute name="ReferencedTopic" select="concat('di2', 'Topicn', $index1, 'Topicn', $index2, 'Topicn', $index3, 'Topicn', $index4, 'Topicn', $index5, 'Topicn', $index6, 'Topicn', $index7, 'Topicn', $index8,'Topicn', $index9,'Topicn', $index10)"/>
                                                                                                <xsl:variable name="num">
                                                                                                    <xsl:value-of select="count(preceding::span[@class = 'Main' or matches(@class, 'Sub([0-9]+)')]) + 1"/>
                                                                                                </xsl:variable>
                                                                                                <xsl:attribute name="Id">
                                                                                                    <xsl:value-of select="$num"/>
                                                                                                </xsl:attribute>
                                                                                                <xsl:if test="$data-PageReferenceType10 &gt; 0">
                                                                                                    <xsl:attribute name="PageReferenceType">
                                                                                                        <xsl:value-of select="'ForNextNParagraphs'"/>
                                                                                                    </xsl:attribute>
                                                                                                    
                                                                                                    <xsl:element name="Properties">
                                                                                                        <xsl:element name="PageReferenceLimit">
                                                                                                            <xsl:attribute name="type" select="'long'"/>
                                                                                                            <xsl:value-of select="$data-PageReferenceType10"/>
                                                                                                        </xsl:element>
                                                                                                    </xsl:element>
                                                                                                </xsl:if>
                                                                                            </xsl:element>
                                                                                                
                                                                                                <!-- Level 11 -->
                                                                                                
                                                                                                <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id10,@class)=@data-mark]">
                                                                                                    <xsl:variable name="index11" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id10,@class)=@data-mark]/current()"/>
                                                                                                    <xsl:variable name="data-id11" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id10,@class)=@data-mark]/current()/@data-id"/>
                                                                                                    <xsl:variable name="data-PageReferenceType11" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id10,@class)=@data-mark]/current()/@data-PageReferenceType"/>
                                                                                                    <xsl:element name="PageReference">
                                                                                                        <xsl:attribute name="Self" select="'di2'"/>
                                                                                                        <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                                                        <xsl:attribute name="ReferencedTopic" select="concat('di2', 'Topicn', $index1, 'Topicn', $index2, 'Topicn', $index3, 'Topicn', $index4, 'Topicn', $index5, 'Topicn', $index6, 'Topicn', $index7, 'Topicn', $index8,'Topicn', $index9,'Topicn', $index10,'Topicn', $index11)"/>
                                                                                                        <xsl:variable name="num">
                                                                                                            <xsl:value-of select="count(preceding::span[@class = 'Main' or matches(@class, 'Sub([0-9]+)')]) + 1"/>
                                                                                                        </xsl:variable>
                                                                                                        <xsl:attribute name="Id">
                                                                                                            <xsl:value-of select="$num"/>
                                                                                                        </xsl:attribute>
                                                                                                        <xsl:if test="$data-PageReferenceType11 &gt; 0">
                                                                                                            <xsl:attribute name="PageReferenceType">
                                                                                                                <xsl:value-of select="'ForNextNParagraphs'"/>
                                                                                                            </xsl:attribute>
                                                                                                            
                                                                                                            <xsl:element name="Properties">
                                                                                                                <xsl:element name="PageReferenceLimit">
                                                                                                                    <xsl:attribute name="type" select="'long'"/>
                                                                                                                    <xsl:value-of select="$data-PageReferenceType11"/>
                                                                                                                </xsl:element>
                                                                                                            </xsl:element>
                                                                                                        </xsl:if>
                                                                                                    </xsl:element>
                                                                                                        <!-- Level 12 -->
                                                                                                        
                                                                                                        <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id11,@class)=@data-mark]">
                                                                                                            <xsl:variable name="index12" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id11,@class)=@data-mark]/current()"/>
                                                                                                            <xsl:variable name="data-id12" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id11,@class)=@data-mark]/current()/@data-id"/>
                                                                                                            <xsl:variable name="data-PageReferenceType12" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id11,@class)=@data-mark]/current()/@data-PageReferenceType"/>
                                                                                                            <xsl:element name="PageReference">
                                                                                                                <xsl:attribute name="Self" select="'di2'"/>
                                                                                                                <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                                                                <xsl:attribute name="ReferencedTopic" select="concat('di2', 'Topicn', $index1, 'Topicn', $index2, 'Topicn', $index3, 'Topicn', $index4, 'Topicn', $index5, 'Topicn', $index6, 'Topicn', $index7, 'Topicn', $index8,'Topicn', $index9,'Topicn', $index10,'Topicn', $index11,'Topicn', $index12)"/>
                                                                                                                <xsl:variable name="num">
                                                                                                                    <xsl:value-of select="count(preceding::span[@class = 'Main' or matches(@class, 'Sub([0-9]+)')]) + 1"/>
                                                                                                                </xsl:variable>
                                                                                                                <xsl:attribute name="Id">
                                                                                                                    <xsl:value-of select="$num"/>
                                                                                                                </xsl:attribute>
                                                                                                                <xsl:if test="$data-PageReferenceType12 &gt; 0">
                                                                                                                    <xsl:attribute name="PageReferenceType">
                                                                                                                        <xsl:value-of select="'ForNextNParagraphs'"/>
                                                                                                                    </xsl:attribute>
                                                                                                                    
                                                                                                                    <xsl:element name="Properties">
                                                                                                                        <xsl:element name="PageReferenceLimit">
                                                                                                                            <xsl:attribute name="type" select="'long'"/>
                                                                                                                            <xsl:value-of select="$data-PageReferenceType12"/>
                                                                                                                        </xsl:element>
                                                                                                                    </xsl:element>
                                                                                                                </xsl:if>
                                                                                                            </xsl:element> 
                                                                                                                
                                                                                                                <!-- Level 13 -->
                                                                                                                
                                                                                                                <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id12,@class)=@data-mark]">
                                                                                                                    <xsl:variable name="index13" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id12,@class)=@data-mark]/current()"/>
                                                                                                                    <xsl:variable name="data-id13" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id12,@class)=@data-mark]/current()/@data-id"/>
                                                                                                                    <xsl:variable name="data-PageReferenceType13" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id12,@class)=@data-mark]/current()/@data-PageReferenceType"/>
                                                                                                                    <xsl:element name="PageReference">
                                                                                                                        <xsl:attribute name="Self" select="'di2'"/>
                                                                                                                        <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                                                                        <xsl:attribute name="ReferencedTopic" select="concat('di2', 'Topicn', $index1, 'Topicn', $index2, 'Topicn', $index3, 'Topicn', $index4, 'Topicn', $index5, 'Topicn', $index6, 'Topicn', $index7, 'Topicn', $index8,'Topicn', $index9,'Topicn', $index10,'Topicn', $index11,'Topicn', $index12,'Topicn', $index13)"/>
                                                                                                                        <xsl:variable name="num">
                                                                                                                            <xsl:value-of select="count(preceding::span[@class = 'Main' or matches(@class, 'Sub([0-9]+)')]) + 1"/>
                                                                                                                        </xsl:variable>
                                                                                                                        <xsl:attribute name="Id">
                                                                                                                            <xsl:value-of select="$num"/>
                                                                                                                        </xsl:attribute>
                                                                                                                        <xsl:if test="$data-PageReferenceType13 &gt; 0">
                                                                                                                            <xsl:attribute name="PageReferenceType">
                                                                                                                                <xsl:value-of select="'ForNextNParagraphs'"/>
                                                                                                                            </xsl:attribute>
                                                                                                                            
                                                                                                                            <xsl:element name="Properties">
                                                                                                                                <xsl:element name="PageReferenceLimit">
                                                                                                                                    <xsl:attribute name="type" select="'long'"/>
                                                                                                                                    <xsl:value-of select="$data-PageReferenceType13"/>
                                                                                                                                </xsl:element>
                                                                                                                            </xsl:element>
                                                                                                                        </xsl:if>
                                                                                                                    </xsl:element>   
                                                                                                                        
                                                                                                                        <!-- Level 14 -->
                                                                                                                        
                                                                                                                        <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id13,@class)=@data-mark]">
                                                                                                                            <xsl:variable name="index14" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id13,@class)=@data-mark]/current()"/>
                                                                                                                            <xsl:variable name="data-id14" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id13,@class)=@data-mark]/current()/@data-id"/>
                                                                                                                            <xsl:variable name="data-PageReferenceType14" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id13,@class)=@data-mark]/current()/@data-PageReferenceType"/>
                                                                                                                            <xsl:element name="PageReference">
                                                                                                                                <xsl:attribute name="Self" select="'di2'"/>
                                                                                                                                <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                                                                                <xsl:attribute name="ReferencedTopic" select="concat('di2', 'Topicn', $index1, 'Topicn', $index2, 'Topicn', $index3, 'Topicn', $index4, 'Topicn', $index5, 'Topicn', $index6, 'Topicn', $index7, 'Topicn', $index8,'Topicn', $index9,'Topicn', $index10,'Topicn', $index11,'Topicn', $index12,'Topicn', $index13,'Topicn', $index14)"/>
                                                                                                                                <xsl:variable name="num">
                                                                                                                                    <xsl:value-of select="count(preceding::span[@class = 'Main' or matches(@class, 'Sub([0-9]+)')]) + 1"/>
                                                                                                                                </xsl:variable>
                                                                                                                                <xsl:attribute name="Id">
                                                                                                                                    <xsl:value-of select="$num"/>
                                                                                                                                </xsl:attribute>
                                                                                                                                <xsl:if test="$data-PageReferenceType14 &gt; 0">
                                                                                                                                    <xsl:attribute name="PageReferenceType">
                                                                                                                                        <xsl:value-of select="'ForNextNParagraphs'"/>
                                                                                                                                    </xsl:attribute>
                                                                                                                                    
                                                                                                                                    <xsl:element name="Properties">
                                                                                                                                        <xsl:element name="PageReferenceLimit">
                                                                                                                                            <xsl:attribute name="type" select="'long'"/>
                                                                                                                                            <xsl:value-of select="$data-PageReferenceType14"/>
                                                                                                                                        </xsl:element>
                                                                                                                                    </xsl:element>
                                                                                                                                </xsl:if>
                                                                                                                            </xsl:element> 
                                                                                                                                <!-- Level 15 -->
                                                                                                                                
                                                                                                                                <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id14,@class)=@data-mark]">
                                                                                                                                    <xsl:variable name="index15" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id14,@class)=@data-mark]/current()"/>
                                                                                                                                    <xsl:variable name="data-id15" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id14,@class)=@data-mark]/current()/@data-id"/>
                                                                                                                                    <xsl:variable name="data-PageReferenceType15" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id14,@class)=@data-mark]/current()/@data-PageReferenceType"/>
                                                                                                                                    <xsl:element name="PageReference">
                                                                                                                                        <xsl:attribute name="Self" select="'di2'"/>
                                                                                                                                        <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                                                                                        <xsl:attribute name="ReferencedTopic" select="concat('di2', 'Topicn', $index1, 'Topicn', $index2, 'Topicn', $index3, 'Topicn', $index4, 'Topicn', $index5, 'Topicn', $index6, 'Topicn', $index7, 'Topicn', $index8,'Topicn', $index9,'Topicn', $index10,'Topicn', $index11,'Topicn', $index12,'Topicn', $index13,'Topicn', $index14,'Topicn', $index15)"/>
                                                                                                                                        
                                                                                                                                        <xsl:variable name="num">
                                                                                                                                            <xsl:value-of select="count(preceding::span[@class = 'Main' or matches(@class, 'Sub([0-9]+)')]) + 1"/>
                                                                                                                                        </xsl:variable>
                                                                                                                                        <xsl:attribute name="Id">
                                                                                                                                            <xsl:value-of select="$num"/>
                                                                                                                                        </xsl:attribute>
                                                                                                                                        <xsl:if test="$data-PageReferenceType15 &gt; 0">
                                                                                                                                            <xsl:attribute name="PageReferenceType">
                                                                                                                                                <xsl:value-of select="'ForNextNParagraphs'"/>
                                                                                                                                            </xsl:attribute>
                                                                                                                                            
                                                                                                                                            <xsl:element name="Properties">
                                                                                                                                                <xsl:element name="PageReferenceLimit">
                                                                                                                                                    <xsl:attribute name="type" select="'long'"/>
                                                                                                                                                    <xsl:value-of select="$data-PageReferenceType15"/>
                                                                                                                                                </xsl:element>
                                                                                                                                            </xsl:element>
                                                                                                                                        </xsl:if>
                                                                                                                                        <!-- Level 15 -->
                                                                                                                                    </xsl:element>
                                                                                                                                </xsl:for-each>
                                                                                                                                
                                                                                                                                
                                                                                                                                
                                                                                                                                <!-- Level 14 -->
                                                                                                                           
                                                                                                                        </xsl:for-each>
                                                                                                                        
                                                                                                                        
                                                                                                                        <!-- Level 13 -->
                                                                                                                   
                                                                                                                </xsl:for-each>
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                <!-- Level 12 -->
                                                                                                            
                                                                                                        </xsl:for-each>
                                                                                                        
                                                                                                        
                                                                                                        
                                                                                                        <!-- Level 11 -->
                                                                                                    
                                                                                                </xsl:for-each>
                                                                                                
                                                                                                <!-- Level 10 -->
                                                                                            
                                                                                        </xsl:for-each>
                                                                                        
                                                                                        
                                                                                        
                                                                                        
                                                                                        
                                                                                        <!-- Level 9 -->
                                                                                    
                                                                                </xsl:for-each>
                                                                                
                                                                                <!-- Level 8 -->
                                                                            
                                                                        </xsl:for-each>
                                                                        <!-- Level 7 -->
                                                                        
                                                                    
                                                                </xsl:for-each>
                                                                
                                                                
                                                                
                                                                <!-- Level 6 -->
                                                                
                                                           
                                                        </xsl:for-each>
                                                        
                                                        
                                                        <!-- Level 5 -->
                                                    
                                                </xsl:for-each>
                                                <!-- Level 4 --> 
                                                
                                            
                                        </xsl:for-each>
                                        <!-- Level 3 -->  
                                    
                                </xsl:for-each>
                                <!-- Level 2 -->  
                            
                        </xsl:for-each>
                        <!-- Level 1 -->
                   
                </xsl:if>
                
                </xsl:element>
            </xsl:if>
            
    </xsl:template>
   
   <!-- <xsl:template match="p//span[@class='Main' or matches(@class,'Sub([0-9]+)')]">
        <xsl:if test="not(self::*[@data-duplicate])">
            <xsl:apply-templates/>
        </xsl:if>
        
        <xsl:if test="self::span[@class='Main' or matches(@class,'Sub([0-9]+)')]">
                <xsl:element name="CharacterStyleRange">
                    
                    <xsl:attribute name="AppliedCharacterStyle" select="'CharacterStyle/$ID/[No character style]'"/>
                <!-\-Level 1-\->
                <xsl:if test="self::span[@class='Main']">
                    <xsl:variable name="index1" select="."/>
                    <xsl:variable name="data-id" select="@data-id"/>
                    <xsl:variable name="data-duplicate" select="@data-duplicate"/>
                    <xsl:variable name="data-PageReferenceType" select="@data-PageReferenceType"/>
                    <!-\-<xsl:if test="not(//span[matches(@class,'Sub([0-9]+)')][concat($data-id,@class)=@data-mark] or self::span[@class='Main'][not(//span[matches(@class,'Sub([0-9]+)')][concat($data-id,@class)=@data-mark])][.=preceding::span[@class='Main']/.] or self::span[@class='Main'][not(//span[matches(@class,'Sub([0-9]+)')][concat($data-id,@class)=@data-mark])][.=following::span[@class='Main']/.])">-\->
                    <xsl:if test="not(//span[matches(@class,'Sub([0-9]+)')][concat($data-id,@class)=@data-mark])">
                    <xsl:element name="PageReference">
                        <xsl:attribute name="Self" select="'di2'"/>
                        <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                        <xsl:attribute name="ReferencedTopic" select="concat('di2', 'Topicn', $index1)"/>
                        
                        <xsl:variable name="num">
                            <xsl:value-of select="count(preceding::span[@class = 'Main' or matches(@class, 'Sub([0-9]+)')]) + 1"/>
                        </xsl:variable>
                        <xsl:attribute name="Id">
                            <xsl:value-of select="$num"/>
                        </xsl:attribute>
                        <xsl:if test="$data-PageReferenceType &gt; 0">
                            <xsl:attribute name="PageReferenceType">
                                <xsl:value-of select="'ForNextNParagraphs'"/>
                            </xsl:attribute>
                        
                            <xsl:element name="Properties">
                                <xsl:element name="PageReferenceLimit">
                                    <xsl:attribute name="type" select="'long'"/>
                                        <xsl:value-of select="$data-PageReferenceType"/>
                                </xsl:element>
                            </xsl:element>
                        </xsl:if>
                    </xsl:element>
                    
                    </xsl:if>
                        <!-\- Level 2 -\->
                        <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id,@class)=@data-mark]">
                            
                            <xsl:variable name="index2" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id,@class)=@data-mark]/current()"/>
                            <xsl:variable name="data-id2" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id,@class)=@data-mark]/current()/@data-id"/>
                            <xsl:variable name="data-PageReferenceType2" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id,@class)=@data-mark]/current()/@data-PageReferenceType"/>
                            <xsl:element name="PageReference">
                                <xsl:attribute name="Self" select="'di2'"/>
                                <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                <xsl:attribute name="ReferencedTopic" select="concat('di2', 'Topicn', $index1, 'Topicn', $index2)"/>
                                <xsl:variable name="num">
                                    <xsl:value-of select="count(preceding::span[@class = 'Main' or matches(@class, 'Sub([0-9]+)')]) + 1"/>
                                </xsl:variable>
                                <xsl:attribute name="Id">
                                    <xsl:value-of select="$num"/>
                                </xsl:attribute>
                                <xsl:if test="$data-PageReferenceType2 &gt; 0">
                                    <xsl:attribute name="PageReferenceType">
                                        <xsl:value-of select="'ForNextNParagraphs'"/>
                                    </xsl:attribute>
                                    
                                    <xsl:element name="Properties">
                                        <xsl:element name="PageReferenceLimit">
                                            <xsl:attribute name="type" select="'long'"/>
                                            <xsl:value-of select="$data-PageReferenceType2"/>
                                        </xsl:element>
                                    </xsl:element>
                                </xsl:if>
                            </xsl:element>  
                                <!-\- Level 3 -\->
                                <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id2,@class)=@data-mark]">
                                    
                                   
                                    <xsl:variable name="index3" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id2,@class)=@data-mark]/current()"/>
                                    <xsl:variable name="data-id3" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id2,@class)=@data-mark]/current()/@data-id"/>
                                    <xsl:variable name="data-PageReferenceType3" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id2,@class)=@data-mark]/current()/@data-PageReferenceType"/>
                                    <xsl:element name="PageReference">
                                        <xsl:attribute name="Self" select="'di2'"/>
                                        <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                        <xsl:attribute name="ReferencedTopic" select="concat('di2', 'Topicn', $index1, 'Topicn', $index2, 'Topicn', $index3)"/>
                                        <xsl:variable name="num">
                                            <xsl:value-of select="count(preceding::span[@class = 'Main' or matches(@class, 'Sub([0-9]+)')]) + 1"/>
                                        </xsl:variable>
                                        <xsl:attribute name="Id">
                                            <xsl:value-of select="$num"/>
                                        </xsl:attribute>
                                        <xsl:if test="$data-PageReferenceType3 &gt; 0">
                                            <xsl:attribute name="PageReferenceType">
                                                <xsl:value-of select="'ForNextNParagraphs'"/>
                                            </xsl:attribute>
                                            
                                            <xsl:element name="Properties">
                                                <xsl:element name="PageReferenceLimit">
                                                    <xsl:attribute name="type" select="'long'"/>
                                                    <xsl:value-of select="$data-PageReferenceType3"/>
                                                </xsl:element>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:element>
                                        
                                        <!-\- Level 4 -\->
                                        <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id3,@class)=@data-mark]">
                                            <xsl:variable name="index4" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id3,@class)=@data-mark]/current()"/>
                                            <xsl:variable name="data-id4" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id3,@class)=@data-mark]/current()/@data-id"/>
                                            <xsl:variable name="data-PageReferenceType4" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id3,@class)=@data-mark]/current()/@data-PageReferenceType"/>
                                            <xsl:element name="PageReference">
                                                <xsl:attribute name="Self" select="'di2'"/>
                                                <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                <xsl:attribute name="ReferencedTopic" select="concat('di2', 'Topicn', $index1, 'Topicn', $index2, 'Topicn', $index3, 'Topicn', $index4)"/>
                                                <xsl:variable name="num">
                                                    <xsl:value-of select="count(preceding::span[@class = 'Main' or matches(@class, 'Sub([0-9]+)')]) + 1"/>
                                                </xsl:variable>
                                                <xsl:attribute name="Id">
                                                    <xsl:value-of select="$num"/>
                                                </xsl:attribute>
                                                <xsl:if test="$data-PageReferenceType4 &gt; 0">
                                                    <xsl:attribute name="PageReferenceType">
                                                        <xsl:value-of select="'ForNextNParagraphs'"/>
                                                    </xsl:attribute>
                                                    
                                                    <xsl:element name="Properties">
                                                        <xsl:element name="PageReferenceLimit">
                                                            <xsl:attribute name="type" select="'long'"/>
                                                            <xsl:value-of select="$data-PageReferenceType4"/>
                                                        </xsl:element>
                                                    </xsl:element>
                                                </xsl:if>
                                            </xsl:element>
                                                
                                                <!-\- Level 5 -\->
                                                <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id4,@class)=@data-mark]">
                                                    <xsl:variable name="index5" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id4,@class)=@data-mark]/current()"/>
                                                    <xsl:variable name="data-id5" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id4,@class)=@data-mark]/current()/@data-id"/>
                                                    <xsl:variable name="data-PageReferenceType5" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id4,@class)=@data-mark]/current()/@data-PageReferenceType"/>
                                                    <xsl:element name="PageReference">
                                                        <xsl:attribute name="Self" select="'di2'"/>
                                                        <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                        <xsl:attribute name="ReferencedTopic" select="concat('di2', 'Topicn', $index1, 'Topicn', $index2, 'Topicn', $index3, 'Topicn', $index4, 'Topicn', $index5)"/>
                                                        <xsl:variable name="num">
                                                            <xsl:value-of select="count(preceding::span[@class = 'Main' or matches(@class, 'Sub([0-9]+)')]) + 1"/>
                                                        </xsl:variable>
                                                        <xsl:attribute name="Id">
                                                            <xsl:value-of select="$num"/>
                                                        </xsl:attribute>
                                                        <xsl:if test="$data-PageReferenceType5 &gt; 0">
                                                            <xsl:attribute name="PageReferenceType">
                                                                <xsl:value-of select="'ForNextNParagraphs'"/>
                                                            </xsl:attribute>
                                                            
                                                            <xsl:element name="Properties">
                                                                <xsl:element name="PageReferenceLimit">
                                                                    <xsl:attribute name="type" select="'long'"/>
                                                                    <xsl:value-of select="$data-PageReferenceType5"/>
                                                                </xsl:element>
                                                            </xsl:element>
                                                        </xsl:if>
                                                    </xsl:element>
                                                        
                                                        
                                                        <!-\- Level 6 -\->
                                                        <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id5,@class)=@data-mark]">
                                                            <xsl:variable name="index6" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id5,@class)=@data-mark]/current()"/>
                                                            <xsl:variable name="data-id6" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id5,@class)=@data-mark]/current()/@data-id"/>
                                                            <xsl:variable name="data-PageReferenceType6" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id5,@class)=@data-mark]/current()/@data-PageReferenceType"/>
                                                            <xsl:element name="PageReference">
                                                                <xsl:attribute name="Self" select="'di2'"/>
                                                                <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                <xsl:attribute name="ReferencedTopic" select="concat('di2', 'Topicn', $index1, 'Topicn', $index2, 'Topicn', $index3, 'Topicn', $index4, 'Topicn', $index5, 'Topicn', $index6)"/>
                                                                <xsl:variable name="num">
                                                                    <xsl:value-of select="count(preceding::span[@class = 'Main' or matches(@class, 'Sub([0-9]+)')]) + 1"/>
                                                                </xsl:variable>
                                                                <xsl:attribute name="Id">
                                                                    <xsl:value-of select="$num"/>
                                                                </xsl:attribute>
                                                                <xsl:if test="$data-PageReferenceType6 &gt; 0">
                                                                    <xsl:attribute name="PageReferenceType">
                                                                        <xsl:value-of select="'ForNextNParagraphs'"/>
                                                                    </xsl:attribute>
                                                                    
                                                                    <xsl:element name="Properties">
                                                                        <xsl:element name="PageReferenceLimit">
                                                                            <xsl:attribute name="type" select="'long'"/>
                                                                            <xsl:value-of select="$data-PageReferenceType6"/>
                                                                        </xsl:element>
                                                                    </xsl:element>
                                                                </xsl:if>
                                                            </xsl:element>
                                                                
                                                                <!-\- Level 7 -\->
                                                                <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id6,@class)=@data-mark]">
                                                                    <xsl:variable name="index7" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id6,@class)=@data-mark]/current()"/>
                                                                    <xsl:variable name="data-id7" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id6,@class)=@data-mark]/current()/@data-id"/>
                                                                    <xsl:variable name="data-PageReferenceType7" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id6,@class)=@data-mark]/current()/@data-PageReferenceType"/>
                                                                    <xsl:element name="PageReference">
                                                                        <xsl:attribute name="Self" select="'di2'"/>
                                                                        <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                        <xsl:attribute name="ReferencedTopic" select="concat('di2', 'Topicn', $index1, 'Topicn', $index2, 'Topicn', $index3, 'Topicn', $index4, 'Topicn', $index5, 'Topicn', $index6, 'Topicn', $index7)"/>
                                                                        <xsl:variable name="num">
                                                                            <xsl:value-of select="count(preceding::span[@class = 'Main' or matches(@class, 'Sub([0-9]+)')]) + 1"/>
                                                                        </xsl:variable>
                                                                        <xsl:attribute name="Id">
                                                                            <xsl:value-of select="$num"/>
                                                                        </xsl:attribute>
                                                                        <xsl:if test="$data-PageReferenceType7 &gt; 0">
                                                                            <xsl:attribute name="PageReferenceType">
                                                                                <xsl:value-of select="'ForNextNParagraphs'"/>
                                                                            </xsl:attribute>
                                                                            
                                                                            <xsl:element name="Properties">
                                                                                <xsl:element name="PageReferenceLimit">
                                                                                    <xsl:attribute name="type" select="'long'"/>
                                                                                    <xsl:value-of select="$data-PageReferenceType7"/>
                                                                                </xsl:element>
                                                                            </xsl:element>
                                                                        </xsl:if>
                                                                    </xsl:element>  
                                                                        
                                                                        <!-\- Level 8 -\->
                                                                        <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id7,@class)=@data-mark]">
                                                                            <xsl:variable name="index8" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id7,@class)=@data-mark]/current()"/>
                                                                            <xsl:variable name="data-id8" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id7,@class)=@data-mark]/current()/@data-id"/>
                                                                            <xsl:variable name="data-PageReferenceType8" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id7,@class)=@data-mark]/current()/@data-PageReferenceType"/>
                                                                            <xsl:element name="PageReference">
                                                                                <xsl:attribute name="Self" select="'di2'"/>
                                                                                <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                                <xsl:attribute name="ReferencedTopic" select="concat('di2', 'Topicn', $index1, 'Topicn', $index2, 'Topicn', $index3, 'Topicn', $index4, 'Topicn', $index5, 'Topicn', $index6, 'Topicn', $index7, 'Topicn', $index8)"/>
                                                                                <xsl:variable name="num">
                                                                                    <xsl:value-of select="count(preceding::span[@class = 'Main' or matches(@class, 'Sub([0-9]+)')]) + 1"/>
                                                                                </xsl:variable>
                                                                                <xsl:attribute name="Id">
                                                                                    <xsl:value-of select="$num"/>
                                                                                </xsl:attribute>
                                                                                <xsl:if test="$data-PageReferenceType8 &gt; 0">
                                                                                    <xsl:attribute name="PageReferenceType">
                                                                                        <xsl:value-of select="'ForNextNParagraphs'"/>
                                                                                    </xsl:attribute>
                                                                                    
                                                                                    <xsl:element name="Properties">
                                                                                        <xsl:element name="PageReferenceLimit">
                                                                                            <xsl:attribute name="type" select="'long'"/>
                                                                                            <xsl:value-of select="$data-PageReferenceType8"/>
                                                                                        </xsl:element>
                                                                                    </xsl:element>
                                                                                </xsl:if>
                                                                            </xsl:element>  
                                                                                <!-\- Level 9 -\->
                                                                                
                                                                                <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id8,@class)=@data-mark]">
                                                                                    <xsl:variable name="index9" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id8,@class)=@data-mark]/current()"/>
                                                                                    <xsl:variable name="data-id9" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id8,@class)=@data-mark]/current()/@data-id"/>
                                                                                    <xsl:variable name="data-PageReferenceType9" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id8,@class)=@data-mark]/current()/@data-PageReferenceType"/>
                                                                                    <xsl:element name="PageReference">
                                                                                        <xsl:attribute name="Self" select="'di2'"/>
                                                                                        <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                                        <xsl:attribute name="ReferencedTopic" select="concat('di2', 'Topicn', $index1, 'Topicn', $index2, 'Topicn', $index3, 'Topicn', $index4, 'Topicn', $index5, 'Topicn', $index6, 'Topicn', $index7, 'Topicn', $index8,'Topicn', $index9)"/>
                                                                                        <xsl:variable name="num">
                                                                                            <xsl:value-of select="count(preceding::span[@class = 'Main' or matches(@class, 'Sub([0-9]+)')]) + 1"/>
                                                                                        </xsl:variable>
                                                                                        <xsl:attribute name="Id">
                                                                                            <xsl:value-of select="$num"/>
                                                                                        </xsl:attribute>
                                                                                        <xsl:if test="$data-PageReferenceType9 &gt; 0">
                                                                                            <xsl:attribute name="PageReferenceType">
                                                                                                <xsl:value-of select="'ForNextNParagraphs'"/>
                                                                                            </xsl:attribute>
                                                                                            
                                                                                            <xsl:element name="Properties">
                                                                                                <xsl:element name="PageReferenceLimit">
                                                                                                    <xsl:attribute name="type" select="'long'"/>
                                                                                                    <xsl:value-of select="$data-PageReferenceType9"/>
                                                                                                </xsl:element>
                                                                                            </xsl:element>
                                                                                        </xsl:if>
                                                                                    </xsl:element>   
                                                                                        
                                                                                        <!-\- Level 10 -\->
                                                                                        
                                                                                        <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id9,@class)=@data-mark]">
                                                                                            <xsl:variable name="index10" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id9,@class)=@data-mark]/current()"/>
                                                                                            <xsl:variable name="data-id10" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id9,@class)=@data-mark]/current()/@data-id"/>
                                                                                            <xsl:variable name="data-PageReferenceType10" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id9,@class)=@data-mark]/current()/@data-PageReferenceType"/>
                                                                                            <xsl:element name="PageReference">
                                                                                                <xsl:attribute name="Self" select="'di2'"/>
                                                                                                <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                                                <xsl:attribute name="ReferencedTopic" select="concat('di2', 'Topicn', $index1, 'Topicn', $index2, 'Topicn', $index3, 'Topicn', $index4, 'Topicn', $index5, 'Topicn', $index6, 'Topicn', $index7, 'Topicn', $index8,'Topicn', $index9,'Topicn', $index10)"/>
                                                                                                <xsl:variable name="num">
                                                                                                    <xsl:value-of select="count(preceding::span[@class = 'Main' or matches(@class, 'Sub([0-9]+)')]) + 1"/>
                                                                                                </xsl:variable>
                                                                                                <xsl:attribute name="Id">
                                                                                                    <xsl:value-of select="$num"/>
                                                                                                </xsl:attribute>
                                                                                                <xsl:if test="$data-PageReferenceType10 &gt; 0">
                                                                                                    <xsl:attribute name="PageReferenceType">
                                                                                                        <xsl:value-of select="'ForNextNParagraphs'"/>
                                                                                                    </xsl:attribute>
                                                                                                    
                                                                                                    <xsl:element name="Properties">
                                                                                                        <xsl:element name="PageReferenceLimit">
                                                                                                            <xsl:attribute name="type" select="'long'"/>
                                                                                                            <xsl:value-of select="$data-PageReferenceType10"/>
                                                                                                        </xsl:element>
                                                                                                    </xsl:element>
                                                                                                </xsl:if>
                                                                                            </xsl:element>
                                                                                                
                                                                                                <!-\- Level 11 -\->
                                                                                                
                                                                                                <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id10,@class)=@data-mark]">
                                                                                                    <xsl:variable name="index11" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id10,@class)=@data-mark]/current()"/>
                                                                                                    <xsl:variable name="data-id11" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id10,@class)=@data-mark]/current()/@data-id"/>
                                                                                                    <xsl:variable name="data-PageReferenceType11" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id10,@class)=@data-mark]/current()/@data-PageReferenceType"/>
                                                                                                    <xsl:element name="PageReference">
                                                                                                        <xsl:attribute name="Self" select="'di2'"/>
                                                                                                        <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                                                        <xsl:attribute name="ReferencedTopic" select="concat('di2', 'Topicn', $index1, 'Topicn', $index2, 'Topicn', $index3, 'Topicn', $index4, 'Topicn', $index5, 'Topicn', $index6, 'Topicn', $index7, 'Topicn', $index8,'Topicn', $index9,'Topicn', $index10,'Topicn', $index11)"/>
                                                                                                        <xsl:variable name="num">
                                                                                                            <xsl:value-of select="count(preceding::span[@class = 'Main' or matches(@class, 'Sub([0-9]+)')]) + 1"/>
                                                                                                        </xsl:variable>
                                                                                                        <xsl:attribute name="Id">
                                                                                                            <xsl:value-of select="$num"/>
                                                                                                        </xsl:attribute>
                                                                                                        <xsl:if test="$data-PageReferenceType11 &gt; 0">
                                                                                                            <xsl:attribute name="PageReferenceType">
                                                                                                                <xsl:value-of select="'ForNextNParagraphs'"/>
                                                                                                            </xsl:attribute>
                                                                                                            
                                                                                                            <xsl:element name="Properties">
                                                                                                                <xsl:element name="PageReferenceLimit">
                                                                                                                    <xsl:attribute name="type" select="'long'"/>
                                                                                                                    <xsl:value-of select="$data-PageReferenceType11"/>
                                                                                                                </xsl:element>
                                                                                                            </xsl:element>
                                                                                                        </xsl:if>
                                                                                                    </xsl:element>
                                                                                                        <!-\- Level 12 -\->
                                                                                                        
                                                                                                        <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id11,@class)=@data-mark]">
                                                                                                            <xsl:variable name="index12" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id11,@class)=@data-mark]/current()"/>
                                                                                                            <xsl:variable name="data-id12" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id11,@class)=@data-mark]/current()/@data-id"/>
                                                                                                            <xsl:variable name="data-PageReferenceType12" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id11,@class)=@data-mark]/current()/@data-PageReferenceType"/>
                                                                                                            <xsl:element name="PageReference">
                                                                                                                <xsl:attribute name="Self" select="'di2'"/>
                                                                                                                <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                                                                <xsl:attribute name="ReferencedTopic" select="concat('di2', 'Topicn', $index1, 'Topicn', $index2, 'Topicn', $index3, 'Topicn', $index4, 'Topicn', $index5, 'Topicn', $index6, 'Topicn', $index7, 'Topicn', $index8,'Topicn', $index9,'Topicn', $index10,'Topicn', $index11,'Topicn', $index12)"/>
                                                                                                                <xsl:variable name="num">
                                                                                                                    <xsl:value-of select="count(preceding::span[@class = 'Main' or matches(@class, 'Sub([0-9]+)')]) + 1"/>
                                                                                                                </xsl:variable>
                                                                                                                <xsl:attribute name="Id">
                                                                                                                    <xsl:value-of select="$num"/>
                                                                                                                </xsl:attribute>
                                                                                                                <xsl:if test="$data-PageReferenceType12 &gt; 0">
                                                                                                                    <xsl:attribute name="PageReferenceType">
                                                                                                                        <xsl:value-of select="'ForNextNParagraphs'"/>
                                                                                                                    </xsl:attribute>
                                                                                                                    
                                                                                                                    <xsl:element name="Properties">
                                                                                                                        <xsl:element name="PageReferenceLimit">
                                                                                                                            <xsl:attribute name="type" select="'long'"/>
                                                                                                                            <xsl:value-of select="$data-PageReferenceType12"/>
                                                                                                                        </xsl:element>
                                                                                                                    </xsl:element>
                                                                                                                </xsl:if>
                                                                                                            </xsl:element> 
                                                                                                                
                                                                                                                <!-\- Level 13 -\->
                                                                                                                
                                                                                                                <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id12,@class)=@data-mark]">
                                                                                                                    <xsl:variable name="index13" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id12,@class)=@data-mark]/current()"/>
                                                                                                                    <xsl:variable name="data-id13" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id12,@class)=@data-mark]/current()/@data-id"/>
                                                                                                                    <xsl:variable name="data-PageReferenceType13" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id12,@class)=@data-mark]/current()/@data-PageReferenceType"/>
                                                                                                                    <xsl:element name="PageReference">
                                                                                                                        <xsl:attribute name="Self" select="'di2'"/>
                                                                                                                        <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                                                                        <xsl:attribute name="ReferencedTopic" select="concat('di2', 'Topicn', $index1, 'Topicn', $index2, 'Topicn', $index3, 'Topicn', $index4, 'Topicn', $index5, 'Topicn', $index6, 'Topicn', $index7, 'Topicn', $index8,'Topicn', $index9,'Topicn', $index10,'Topicn', $index11,'Topicn', $index12,'Topicn', $index13)"/>
                                                                                                                        <xsl:variable name="num">
                                                                                                                            <xsl:value-of select="count(preceding::span[@class = 'Main' or matches(@class, 'Sub([0-9]+)')]) + 1"/>
                                                                                                                        </xsl:variable>
                                                                                                                        <xsl:attribute name="Id">
                                                                                                                            <xsl:value-of select="$num"/>
                                                                                                                        </xsl:attribute>
                                                                                                                        <xsl:if test="$data-PageReferenceType13 &gt; 0">
                                                                                                                            <xsl:attribute name="PageReferenceType">
                                                                                                                                <xsl:value-of select="'ForNextNParagraphs'"/>
                                                                                                                            </xsl:attribute>
                                                                                                                            
                                                                                                                            <xsl:element name="Properties">
                                                                                                                                <xsl:element name="PageReferenceLimit">
                                                                                                                                    <xsl:attribute name="type" select="'long'"/>
                                                                                                                                    <xsl:value-of select="$data-PageReferenceType13"/>
                                                                                                                                </xsl:element>
                                                                                                                            </xsl:element>
                                                                                                                        </xsl:if>
                                                                                                                    </xsl:element>   
                                                                                                                        
                                                                                                                        <!-\- Level 14 -\->
                                                                                                                        
                                                                                                                        <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id13,@class)=@data-mark]">
                                                                                                                            <xsl:variable name="index14" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id13,@class)=@data-mark]/current()"/>
                                                                                                                            <xsl:variable name="data-id14" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id13,@class)=@data-mark]/current()/@data-id"/>
                                                                                                                            <xsl:variable name="data-PageReferenceType14" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id13,@class)=@data-mark]/current()/@data-PageReferenceType"/>
                                                                                                                            <xsl:element name="PageReference">
                                                                                                                                <xsl:attribute name="Self" select="'di2'"/>
                                                                                                                                <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                                                                                <xsl:attribute name="ReferencedTopic" select="concat('di2', 'Topicn', $index1, 'Topicn', $index2, 'Topicn', $index3, 'Topicn', $index4, 'Topicn', $index5, 'Topicn', $index6, 'Topicn', $index7, 'Topicn', $index8,'Topicn', $index9,'Topicn', $index10,'Topicn', $index11,'Topicn', $index12,'Topicn', $index13,'Topicn', $index14)"/>
                                                                                                                                <xsl:variable name="num">
                                                                                                                                    <xsl:value-of select="count(preceding::span[@class = 'Main' or matches(@class, 'Sub([0-9]+)')]) + 1"/>
                                                                                                                                </xsl:variable>
                                                                                                                                <xsl:attribute name="Id">
                                                                                                                                    <xsl:value-of select="$num"/>
                                                                                                                                </xsl:attribute>
                                                                                                                                <xsl:if test="$data-PageReferenceType14 &gt; 0">
                                                                                                                                    <xsl:attribute name="PageReferenceType">
                                                                                                                                        <xsl:value-of select="'ForNextNParagraphs'"/>
                                                                                                                                    </xsl:attribute>
                                                                                                                                    
                                                                                                                                    <xsl:element name="Properties">
                                                                                                                                        <xsl:element name="PageReferenceLimit">
                                                                                                                                            <xsl:attribute name="type" select="'long'"/>
                                                                                                                                            <xsl:value-of select="$data-PageReferenceType14"/>
                                                                                                                                        </xsl:element>
                                                                                                                                    </xsl:element>
                                                                                                                                </xsl:if>
                                                                                                                            </xsl:element> 
                                                                                                                                <!-\- Level 15 -\->
                                                                                                                                
                                                                                                                                <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id14,@class)=@data-mark]">
                                                                                                                                    <xsl:variable name="index15" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id14,@class)=@data-mark]/current()"/>
                                                                                                                                    <xsl:variable name="data-id15" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id14,@class)=@data-mark]/current()/@data-id"/>
                                                                                                                                    <xsl:variable name="data-PageReferenceType15" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id14,@class)=@data-mark]/current()/@data-PageReferenceType"/>
                                                                                                                                    <xsl:element name="PageReference">
                                                                                                                                        <xsl:attribute name="Self" select="'di2'"/>
                                                                                                                                        <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                                                                                        <xsl:attribute name="ReferencedTopic" select="concat('di2', 'Topicn', $index1, 'Topicn', $index2, 'Topicn', $index3, 'Topicn', $index4, 'Topicn', $index5, 'Topicn', $index6, 'Topicn', $index7, 'Topicn', $index8,'Topicn', $index9,'Topicn', $index10,'Topicn', $index11,'Topicn', $index12,'Topicn', $index13,'Topicn', $index14,'Topicn', $index15)"/>
                                                                                                                                        
                                                                                                                                        <xsl:variable name="num">
                                                                                                                                            <xsl:value-of select="count(preceding::span[@class = 'Main' or matches(@class, 'Sub([0-9]+)')]) + 1"/>
                                                                                                                                        </xsl:variable>
                                                                                                                                        <xsl:attribute name="Id">
                                                                                                                                            <xsl:value-of select="$num"/>
                                                                                                                                        </xsl:attribute>
                                                                                                                                        <xsl:if test="$data-PageReferenceType15 &gt; 0">
                                                                                                                                            <xsl:attribute name="PageReferenceType">
                                                                                                                                                <xsl:value-of select="'ForNextNParagraphs'"/>
                                                                                                                                            </xsl:attribute>
                                                                                                                                            
                                                                                                                                            <xsl:element name="Properties">
                                                                                                                                                <xsl:element name="PageReferenceLimit">
                                                                                                                                                    <xsl:attribute name="type" select="'long'"/>
                                                                                                                                                    <xsl:value-of select="$data-PageReferenceType15"/>
                                                                                                                                                </xsl:element>
                                                                                                                                            </xsl:element>
                                                                                                                                        </xsl:if>
                                                                                                                                        <!-\- Level 15 -\->
                                                                                                                                    </xsl:element>
                                                                                                                                </xsl:for-each>
                                                                                                                                
                                                                                                                                
                                                                                                                                
                                                                                                                                <!-\- Level 14 -\->
                                                                                                                           
                                                                                                                        </xsl:for-each>
                                                                                                                        
                                                                                                                        
                                                                                                                        <!-\- Level 13 -\->
                                                                                                                   
                                                                                                                </xsl:for-each>
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                <!-\- Level 12 -\->
                                                                                                            
                                                                                                        </xsl:for-each>
                                                                                                        
                                                                                                        
                                                                                                        
                                                                                                        <!-\- Level 11 -\->
                                                                                                    
                                                                                                </xsl:for-each>
                                                                                                
                                                                                                <!-\- Level 10 -\->
                                                                                            
                                                                                        </xsl:for-each>
                                                                                        
                                                                                        
                                                                                        
                                                                                        
                                                                                        
                                                                                        <!-\- Level 9 -\->
                                                                                    
                                                                                </xsl:for-each>
                                                                                
                                                                                <!-\- Level 8 -\->
                                                                            
                                                                        </xsl:for-each>
                                                                        <!-\- Level 7 -\->
                                                                        
                                                                    
                                                                </xsl:for-each>
                                                                
                                                                
                                                                
                                                                <!-\- Level 6 -\->
                                                                
                                                           
                                                        </xsl:for-each>
                                                        
                                                        
                                                        <!-\- Level 5 -\->
                                                    
                                                </xsl:for-each>
                                                <!-\- Level 4 -\-> 
                                                
                                            
                                        </xsl:for-each>
                                        <!-\- Level 3 -\->  
                                    
                                </xsl:for-each>
                                <!-\- Level 2 -\->  
                            
                        </xsl:for-each>
                        <!-\- Level 1 -\->
                   
                   
                   
                           <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate=@data-mark]">
                            
                               <xsl:variable name="index2" select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate=@data-mark]/current()"/>
                               <xsl:variable name="data-duplicate2" select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate=@data-mark]/current()/@data-duplicate"/>
                               <xsl:variable name="data-PageReferenceType2" select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate=@data-mark]/current()/@data-PageReferenceType"/>
                            <xsl:element name="PageReference">
                                <xsl:attribute name="Self" select="'di2'"/>
                                <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                <xsl:attribute name="ReferencedTopic" select="concat('di2', 'Topicn', $index1, 'Topicn', $index2)"/>
                                <xsl:variable name="num">
                                    <xsl:value-of select="count(preceding::span[@class = 'Main' or matches(@class, 'Sub([0-9]+)')]) + 1"/>
                                </xsl:variable>
                                <xsl:attribute name="Id">
                                    <xsl:value-of select="$num"/>
                                </xsl:attribute>
                                <xsl:if test="$data-PageReferenceType2 &gt; 0">
                                    <xsl:attribute name="PageReferenceType">
                                        <xsl:value-of select="'ForNextNParagraphs'"/>
                                    </xsl:attribute>
                                    
                                    <xsl:element name="Properties">
                                        <xsl:element name="PageReferenceLimit">
                                            <xsl:attribute name="type" select="'long'"/>
                                            <xsl:value-of select="$data-PageReferenceType2"/>
                                        </xsl:element>
                                    </xsl:element>
                                </xsl:if>
                            </xsl:element>  
                                <!-\- Level 3 -\->
                               <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate2=@data-mark]">
                                    
                                   
                                   <xsl:variable name="index3" select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate2=@data-mark]/current()"/>
                                   <xsl:variable name="data-duplicate3" select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate2=@data-mark]/current()/@data-duplicate"/>
                                   <xsl:variable name="data-PageReferenceType3" select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate2=@data-mark]/current()/@data-PageReferenceType"/>
                                    <xsl:element name="PageReference">
                                        <xsl:attribute name="Self" select="'di2'"/>
                                        <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                        <xsl:attribute name="ReferencedTopic" select="concat('di2', 'Topicn', $index1, 'Topicn', $index2, 'Topicn', $index3)"/>
                                        <xsl:variable name="num">
                                            <xsl:value-of select="count(preceding::span[@class = 'Main' or matches(@class, 'Sub([0-9]+)')]) + 1"/>
                                        </xsl:variable>
                                        <xsl:attribute name="Id">
                                            <xsl:value-of select="$num"/>
                                        </xsl:attribute>
                                        <xsl:if test="$data-PageReferenceType3 &gt; 0">
                                            <xsl:attribute name="PageReferenceType">
                                                <xsl:value-of select="'ForNextNParagraphs'"/>
                                            </xsl:attribute>
                                            
                                            <xsl:element name="Properties">
                                                <xsl:element name="PageReferenceLimit">
                                                    <xsl:attribute name="type" select="'long'"/>
                                                    <xsl:value-of select="$data-PageReferenceType3"/>
                                                </xsl:element>
                                            </xsl:element>
                                        </xsl:if>
                                    </xsl:element>
                                        
                                        <!-\- Level 4 -\->
                                   <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate3=@data-mark]">
                                       <xsl:variable name="index4" select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate3=@data-mark]/current()"/>
                                       <xsl:variable name="data-duplicate4" select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate3=@data-mark]/current()/@data-duplicate"/>
                                       <xsl:variable name="data-PageReferenceType4" select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate3=@data-mark]/current()/@data-PageReferenceType"/>
                                            <xsl:element name="PageReference">
                                                <xsl:attribute name="Self" select="'di2'"/>
                                                <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                <xsl:attribute name="ReferencedTopic" select="concat('di2', 'Topicn', $index1, 'Topicn', $index2, 'Topicn', $index3, 'Topicn', $index4)"/>
                                                <xsl:variable name="num">
                                                    <xsl:value-of select="count(preceding::span[@class = 'Main' or matches(@class, 'Sub([0-9]+)')]) + 1"/>
                                                </xsl:variable>
                                                <xsl:attribute name="Id">
                                                    <xsl:value-of select="$num"/>
                                                </xsl:attribute>
                                                <xsl:if test="$data-PageReferenceType4 &gt; 0">
                                                    <xsl:attribute name="PageReferenceType">
                                                        <xsl:value-of select="'ForNextNParagraphs'"/>
                                                    </xsl:attribute>
                                                    
                                                    <xsl:element name="Properties">
                                                        <xsl:element name="PageReferenceLimit">
                                                            <xsl:attribute name="type" select="'long'"/>
                                                            <xsl:value-of select="$data-PageReferenceType4"/>
                                                        </xsl:element>
                                                    </xsl:element>
                                                </xsl:if>
                                            </xsl:element>
                                                
                                                <!-\- Level 5 -\->
                                       <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate4=@data-mark]">
                                           <xsl:variable name="index5" select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate4=@data-mark]/current()"/>
                                           <xsl:variable name="data-duplicate5" select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate4=@data-mark]/current()/@data-duplicate"/>
                                           <xsl:variable name="data-PageReferenceType5" select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate4=@data-mark]/current()/@data-PageReferenceType"/>
                                                    <xsl:element name="PageReference">
                                                        <xsl:attribute name="Self" select="'di2'"/>
                                                        <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                        <xsl:attribute name="ReferencedTopic" select="concat('di2', 'Topicn', $index1, 'Topicn', $index2, 'Topicn', $index3, 'Topicn', $index4, 'Topicn', $index5)"/>
                                                        <xsl:variable name="num">
                                                            <xsl:value-of select="count(preceding::span[@class = 'Main' or matches(@class, 'Sub([0-9]+)')]) + 1"/>
                                                        </xsl:variable>
                                                        <xsl:attribute name="Id">
                                                            <xsl:value-of select="$num"/>
                                                        </xsl:attribute>
                                                        <xsl:if test="$data-PageReferenceType5 &gt; 0">
                                                            <xsl:attribute name="PageReferenceType">
                                                                <xsl:value-of select="'ForNextNParagraphs'"/>
                                                            </xsl:attribute>
                                                            
                                                            <xsl:element name="Properties">
                                                                <xsl:element name="PageReferenceLimit">
                                                                    <xsl:attribute name="type" select="'long'"/>
                                                                    <xsl:value-of select="$data-PageReferenceType5"/>
                                                                </xsl:element>
                                                            </xsl:element>
                                                        </xsl:if>
                                                    </xsl:element>
                                                        
                                                        
                                                        <!-\- Level 6 -\->
                                           <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate5=@data-mark]">
                                               <xsl:variable name="index6" select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate5=@data-mark]/current()"/>
                                               <xsl:variable name="data-duplicate6" select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate5=@data-mark]/current()/@data-duplicate"/>
                                               <xsl:variable name="data-PageReferenceType6" select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate5=@data-mark]/current()/@data-PageReferenceType"/>
                                                            <xsl:element name="PageReference">
                                                                <xsl:attribute name="Self" select="'di2'"/>
                                                                <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                <xsl:attribute name="ReferencedTopic" select="concat('di2', 'Topicn', $index1, 'Topicn', $index2, 'Topicn', $index3, 'Topicn', $index4, 'Topicn', $index5, 'Topicn', $index6)"/>
                                                                <xsl:variable name="num">
                                                                    <xsl:value-of select="count(preceding::span[@class = 'Main' or matches(@class, 'Sub([0-9]+)')]) + 1"/>
                                                                </xsl:variable>
                                                                <xsl:attribute name="Id">
                                                                    <xsl:value-of select="$num"/>
                                                                </xsl:attribute>
                                                                <xsl:if test="$data-PageReferenceType6 &gt; 0">
                                                                    <xsl:attribute name="PageReferenceType">
                                                                        <xsl:value-of select="'ForNextNParagraphs'"/>
                                                                    </xsl:attribute>
                                                                    
                                                                    <xsl:element name="Properties">
                                                                        <xsl:element name="PageReferenceLimit">
                                                                            <xsl:attribute name="type" select="'long'"/>
                                                                            <xsl:value-of select="$data-PageReferenceType6"/>
                                                                        </xsl:element>
                                                                    </xsl:element>
                                                                </xsl:if>
                                                            </xsl:element>
                                                                
                                                                <!-\- Level 7 -\->
                                               <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate6=@data-mark]">
                                                   <xsl:variable name="index7" select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate6=@data-mark]/current()"/>
                                                   <xsl:variable name="data-duplicate7" select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate6=@data-mark]/current()/@data-duplicate"/>
                                                   <xsl:variable name="data-PageReferenceType7" select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate6=@data-mark]/current()/@data-PageReferenceType"/>
                                                                    <xsl:element name="PageReference">
                                                                        <xsl:attribute name="Self" select="'di2'"/>
                                                                        <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                        <xsl:attribute name="ReferencedTopic" select="concat('di2', 'Topicn', $index1, 'Topicn', $index2, 'Topicn', $index3, 'Topicn', $index4, 'Topicn', $index5, 'Topicn', $index6, 'Topicn', $index7)"/>
                                                                        <xsl:variable name="num">
                                                                            <xsl:value-of select="count(preceding::span[@class = 'Main' or matches(@class, 'Sub([0-9]+)')]) + 1"/>
                                                                        </xsl:variable>
                                                                        <xsl:attribute name="Id">
                                                                            <xsl:value-of select="$num"/>
                                                                        </xsl:attribute>
                                                                        <xsl:if test="$data-PageReferenceType7 &gt; 0">
                                                                            <xsl:attribute name="PageReferenceType">
                                                                                <xsl:value-of select="'ForNextNParagraphs'"/>
                                                                            </xsl:attribute>
                                                                            
                                                                            <xsl:element name="Properties">
                                                                                <xsl:element name="PageReferenceLimit">
                                                                                    <xsl:attribute name="type" select="'long'"/>
                                                                                    <xsl:value-of select="$data-PageReferenceType7"/>
                                                                                </xsl:element>
                                                                            </xsl:element>
                                                                        </xsl:if>
                                                                    </xsl:element>  
                                                                        
                                                                        <!-\- Level 8 -\->
                                                   <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate7=@data-mark]">
                                                       <xsl:variable name="index8" select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate7=@data-mark]/current()"/>
                                                       <xsl:variable name="data-duplicate8" select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate7=@data-mark]/current()/@data-duplicate"/>
                                                       <xsl:variable name="data-PageReferenceType8" select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate7=@data-mark]/current()/@data-PageReferenceType"/>
                                                                            <xsl:element name="PageReference">
                                                                                <xsl:attribute name="Self" select="'di2'"/>
                                                                                <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                                <xsl:attribute name="ReferencedTopic" select="concat('di2', 'Topicn', $index1, 'Topicn', $index2, 'Topicn', $index3, 'Topicn', $index4, 'Topicn', $index5, 'Topicn', $index6, 'Topicn', $index7, 'Topicn', $index8)"/>
                                                                                <xsl:variable name="num">
                                                                                    <xsl:value-of select="count(preceding::span[@class = 'Main' or matches(@class, 'Sub([0-9]+)')]) + 1"/>
                                                                                </xsl:variable>
                                                                                <xsl:attribute name="Id">
                                                                                    <xsl:value-of select="$num"/>
                                                                                </xsl:attribute>
                                                                                <xsl:if test="$data-PageReferenceType8 &gt; 0">
                                                                                    <xsl:attribute name="PageReferenceType">
                                                                                        <xsl:value-of select="'ForNextNParagraphs'"/>
                                                                                    </xsl:attribute>
                                                                                    
                                                                                    <xsl:element name="Properties">
                                                                                        <xsl:element name="PageReferenceLimit">
                                                                                            <xsl:attribute name="type" select="'long'"/>
                                                                                            <xsl:value-of select="$data-PageReferenceType8"/>
                                                                                        </xsl:element>
                                                                                    </xsl:element>
                                                                                </xsl:if>
                                                                            </xsl:element>  
                                                                                <!-\- Level 9 -\->
                                                                                
                                                       <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate8=@data-mark]">
                                                           <xsl:variable name="index9" select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate8=@data-mark]/current()"/>
                                                           <xsl:variable name="data-duplicate9" select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate8=@data-mark]/current()/@data-duplicate"/>
                                                           <xsl:variable name="data-PageReferenceType9" select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate8=@data-mark]/current()/@data-PageReferenceType"/>
                                                                                    <xsl:element name="PageReference">
                                                                                        <xsl:attribute name="Self" select="'di2'"/>
                                                                                        <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                                        <xsl:attribute name="ReferencedTopic" select="concat('di2', 'Topicn', $index1, 'Topicn', $index2, 'Topicn', $index3, 'Topicn', $index4, 'Topicn', $index5, 'Topicn', $index6, 'Topicn', $index7, 'Topicn', $index8,'Topicn', $index9)"/>
                                                                                        <xsl:variable name="num">
                                                                                            <xsl:value-of select="count(preceding::span[@class = 'Main' or matches(@class, 'Sub([0-9]+)')]) + 1"/>
                                                                                        </xsl:variable>
                                                                                        <xsl:attribute name="Id">
                                                                                            <xsl:value-of select="$num"/>
                                                                                        </xsl:attribute>
                                                                                        <xsl:if test="$data-PageReferenceType9 &gt; 0">
                                                                                            <xsl:attribute name="PageReferenceType">
                                                                                                <xsl:value-of select="'ForNextNParagraphs'"/>
                                                                                            </xsl:attribute>
                                                                                            
                                                                                            <xsl:element name="Properties">
                                                                                                <xsl:element name="PageReferenceLimit">
                                                                                                    <xsl:attribute name="type" select="'long'"/>
                                                                                                    <xsl:value-of select="$data-PageReferenceType9"/>
                                                                                                </xsl:element>
                                                                                            </xsl:element>
                                                                                        </xsl:if>
                                                                                    </xsl:element>   
                                                                                        
                                                                                        <!-\- Level 10 -\->
                                                                                        
                                                           <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate9=@data-mark]">
                                                               <xsl:variable name="index10" select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate9=@data-mark]/current()"/>
                                                               <xsl:variable name="data-duplicate10" select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate9=@data-mark]/current()/@data-duplicate"/>
                                                               <xsl:variable name="data-PageReferenceType10" select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate9=@data-mark]/current()/@data-PageReferenceType"/>
                                                                                            <xsl:element name="PageReference">
                                                                                                <xsl:attribute name="Self" select="'di2'"/>
                                                                                                <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                                                <xsl:attribute name="ReferencedTopic" select="concat('di2', 'Topicn', $index1, 'Topicn', $index2, 'Topicn', $index3, 'Topicn', $index4, 'Topicn', $index5, 'Topicn', $index6, 'Topicn', $index7, 'Topicn', $index8,'Topicn', $index9,'Topicn', $index10)"/>
                                                                                                <xsl:variable name="num">
                                                                                                    <xsl:value-of select="count(preceding::span[@class = 'Main' or matches(@class, 'Sub([0-9]+)')]) + 1"/>
                                                                                                </xsl:variable>
                                                                                                <xsl:attribute name="Id">
                                                                                                    <xsl:value-of select="$num"/>
                                                                                                </xsl:attribute>
                                                                                                <xsl:if test="$data-PageReferenceType10 &gt; 0">
                                                                                                    <xsl:attribute name="PageReferenceType">
                                                                                                        <xsl:value-of select="'ForNextNParagraphs'"/>
                                                                                                    </xsl:attribute>
                                                                                                    
                                                                                                    <xsl:element name="Properties">
                                                                                                        <xsl:element name="PageReferenceLimit">
                                                                                                            <xsl:attribute name="type" select="'long'"/>
                                                                                                            <xsl:value-of select="$data-PageReferenceType10"/>
                                                                                                        </xsl:element>
                                                                                                    </xsl:element>
                                                                                                </xsl:if>
                                                                                            </xsl:element>
                                                                                                
                                                                                                <!-\- Level 11 -\->
                                                                                                
                                                               <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate10=@data-mark]">
                                                                   <xsl:variable name="index11" select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate10=@data-mark]/current()"/>
                                                                   <xsl:variable name="data-duplicate11" select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate10=@data-mark]/current()/@data-duplicate"/>
                                                                   <xsl:variable name="data-PageReferenceType11" select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate10=@data-mark]/current()/@data-PageReferenceType"/>
                                                                                                    <xsl:element name="PageReference">
                                                                                                        <xsl:attribute name="Self" select="'di2'"/>
                                                                                                        <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                                                        <xsl:attribute name="ReferencedTopic" select="concat('di2', 'Topicn', $index1, 'Topicn', $index2, 'Topicn', $index3, 'Topicn', $index4, 'Topicn', $index5, 'Topicn', $index6, 'Topicn', $index7, 'Topicn', $index8,'Topicn', $index9,'Topicn', $index10,'Topicn', $index11)"/>
                                                                                                        <xsl:variable name="num">
                                                                                                            <xsl:value-of select="count(preceding::span[@class = 'Main' or matches(@class, 'Sub([0-9]+)')]) + 1"/>
                                                                                                        </xsl:variable>
                                                                                                        <xsl:attribute name="Id">
                                                                                                            <xsl:value-of select="$num"/>
                                                                                                        </xsl:attribute>
                                                                                                        <xsl:if test="$data-PageReferenceType11 &gt; 0">
                                                                                                            <xsl:attribute name="PageReferenceType">
                                                                                                                <xsl:value-of select="'ForNextNParagraphs'"/>
                                                                                                            </xsl:attribute>
                                                                                                            
                                                                                                            <xsl:element name="Properties">
                                                                                                                <xsl:element name="PageReferenceLimit">
                                                                                                                    <xsl:attribute name="type" select="'long'"/>
                                                                                                                    <xsl:value-of select="$data-PageReferenceType11"/>
                                                                                                                </xsl:element>
                                                                                                            </xsl:element>
                                                                                                        </xsl:if>
                                                                                                    </xsl:element>
                                                                                                        <!-\- Level 12 -\->
                                                                                                        
                                                                   <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate11=@data-mark]">
                                                                       <xsl:variable name="index12" select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate11=@data-mark]/current()"/>
                                                                       <xsl:variable name="data-duplicate12" select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate11=@data-mark]/current()/@data-duplicate"/>
                                                                       <xsl:variable name="data-PageReferenceType12" select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate11=@data-mark]/current()/@data-PageReferenceType"/>
                                                                                                            <xsl:element name="PageReference">
                                                                                                                <xsl:attribute name="Self" select="'di2'"/>
                                                                                                                <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                                                                <xsl:attribute name="ReferencedTopic" select="concat('di2', 'Topicn', $index1, 'Topicn', $index2, 'Topicn', $index3, 'Topicn', $index4, 'Topicn', $index5, 'Topicn', $index6, 'Topicn', $index7, 'Topicn', $index8,'Topicn', $index9,'Topicn', $index10,'Topicn', $index11,'Topicn', $index12)"/>
                                                                                                                <xsl:variable name="num">
                                                                                                                    <xsl:value-of select="count(preceding::span[@class = 'Main' or matches(@class, 'Sub([0-9]+)')]) + 1"/>
                                                                                                                </xsl:variable>
                                                                                                                <xsl:attribute name="Id">
                                                                                                                    <xsl:value-of select="$num"/>
                                                                                                                </xsl:attribute>
                                                                                                                <xsl:if test="$data-PageReferenceType12 &gt; 0">
                                                                                                                    <xsl:attribute name="PageReferenceType">
                                                                                                                        <xsl:value-of select="'ForNextNParagraphs'"/>
                                                                                                                    </xsl:attribute>
                                                                                                                    
                                                                                                                    <xsl:element name="Properties">
                                                                                                                        <xsl:element name="PageReferenceLimit">
                                                                                                                            <xsl:attribute name="type" select="'long'"/>
                                                                                                                            <xsl:value-of select="$data-PageReferenceType12"/>
                                                                                                                        </xsl:element>
                                                                                                                    </xsl:element>
                                                                                                                </xsl:if>
                                                                                                            </xsl:element> 
                                                                                                                
                                                                                                                <!-\- Level 13 -\->
                                                                                                                
                                                                       <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate12=@data-mark]">
                                                                           <xsl:variable name="index13" select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate12=@data-mark]/current()"/>
                                                                           <xsl:variable name="data-duplicate13" select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate12=@data-mark]/current()/@data-duplicate"/>
                                                                           <xsl:variable name="data-PageReferenceType13" select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate12=@data-mark]/current()/@data-PageReferenceType"/>
                                                                                                                    <xsl:element name="PageReference">
                                                                                                                        <xsl:attribute name="Self" select="'di2'"/>
                                                                                                                        <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                                                                        <xsl:attribute name="ReferencedTopic" select="concat('di2', 'Topicn', $index1, 'Topicn', $index2, 'Topicn', $index3, 'Topicn', $index4, 'Topicn', $index5, 'Topicn', $index6, 'Topicn', $index7, 'Topicn', $index8,'Topicn', $index9,'Topicn', $index10,'Topicn', $index11,'Topicn', $index12,'Topicn', $index13)"/>
                                                                                                                        <xsl:variable name="num">
                                                                                                                            <xsl:value-of select="count(preceding::span[@class = 'Main' or matches(@class, 'Sub([0-9]+)')]) + 1"/>
                                                                                                                        </xsl:variable>
                                                                                                                        <xsl:attribute name="Id">
                                                                                                                            <xsl:value-of select="$num"/>
                                                                                                                        </xsl:attribute>
                                                                                                                        <xsl:if test="$data-PageReferenceType13 &gt; 0">
                                                                                                                            <xsl:attribute name="PageReferenceType">
                                                                                                                                <xsl:value-of select="'ForNextNParagraphs'"/>
                                                                                                                            </xsl:attribute>
                                                                                                                            
                                                                                                                            <xsl:element name="Properties">
                                                                                                                                <xsl:element name="PageReferenceLimit">
                                                                                                                                    <xsl:attribute name="type" select="'long'"/>
                                                                                                                                    <xsl:value-of select="$data-PageReferenceType13"/>
                                                                                                                                </xsl:element>
                                                                                                                            </xsl:element>
                                                                                                                        </xsl:if>
                                                                                                                    </xsl:element>   
                                                                                                                        
                                                                                                                        <!-\- Level 14 -\->
                                                                                                                        
                                                                           <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate13=@data-mark]">
                                                                               <xsl:variable name="index14" select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate13=@data-mark]/current()"/>
                                                                               <xsl:variable name="data-duplicate14" select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate13=@data-mark]/current()/@data-duplicate"/>
                                                                               <xsl:variable name="data-PageReferenceType14" select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate13=@data-mark]/current()/@data-PageReferenceType"/>
                                                                                                                            <xsl:element name="PageReference">
                                                                                                                                <xsl:attribute name="Self" select="'di2'"/>
                                                                                                                                <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                                                                                <xsl:attribute name="ReferencedTopic" select="concat('di2', 'Topicn', $index1, 'Topicn', $index2, 'Topicn', $index3, 'Topicn', $index4, 'Topicn', $index5, 'Topicn', $index6, 'Topicn', $index7, 'Topicn', $index8,'Topicn', $index9,'Topicn', $index10,'Topicn', $index11,'Topicn', $index12,'Topicn', $index13,'Topicn', $index14)"/>
                                                                                                                                <xsl:variable name="num">
                                                                                                                                    <xsl:value-of select="count(preceding::span[@class = 'Main' or matches(@class, 'Sub([0-9]+)')]) + 1"/>
                                                                                                                                </xsl:variable>
                                                                                                                                <xsl:attribute name="Id">
                                                                                                                                    <xsl:value-of select="$num"/>
                                                                                                                                </xsl:attribute>
                                                                                                                                <xsl:if test="$data-PageReferenceType14 &gt; 0">
                                                                                                                                    <xsl:attribute name="PageReferenceType">
                                                                                                                                        <xsl:value-of select="'ForNextNParagraphs'"/>
                                                                                                                                    </xsl:attribute>
                                                                                                                                    
                                                                                                                                    <xsl:element name="Properties">
                                                                                                                                        <xsl:element name="PageReferenceLimit">
                                                                                                                                            <xsl:attribute name="type" select="'long'"/>
                                                                                                                                            <xsl:value-of select="$data-PageReferenceType14"/>
                                                                                                                                        </xsl:element>
                                                                                                                                    </xsl:element>
                                                                                                                                </xsl:if>
                                                                                                                            </xsl:element> 
                                                                                                                                <!-\- Level 15 -\->
                                                                                                                                
                                                                               <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate14=@data-mark]">
                                                                                   <xsl:variable name="index15" select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate14=@data-mark]/current()"/>
                                                                                   <xsl:variable name="data-duplicate15" select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate14=@data-mark]/current()/@data-duplicate"/>
                                                                                   <xsl:variable name="data-PageReferenceType15" select="//span[matches(@class,'Sub([0-9]+)')][$data-duplicate14=@data-mark]/current()/@data-PageReferenceType"/>
                                                                                                                                    <xsl:element name="PageReference">
                                                                                                                                        <xsl:attribute name="Self" select="'di2'"/>
                                                                                                                                        <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                                                                                        <xsl:attribute name="ReferencedTopic" select="concat('di2', 'Topicn', $index1, 'Topicn', $index2, 'Topicn', $index3, 'Topicn', $index4, 'Topicn', $index5, 'Topicn', $index6, 'Topicn', $index7, 'Topicn', $index8,'Topicn', $index9,'Topicn', $index10,'Topicn', $index11,'Topicn', $index12,'Topicn', $index13,'Topicn', $index14,'Topicn', $index15)"/>
                                                                                                                                        
                                                                                                                                        <xsl:variable name="num">
                                                                                                                                            <xsl:value-of select="count(preceding::span[@class = 'Main' or matches(@class, 'Sub([0-9]+)')]) + 1"/>
                                                                                                                                        </xsl:variable>
                                                                                                                                        <xsl:attribute name="Id">
                                                                                                                                            <xsl:value-of select="$num"/>
                                                                                                                                        </xsl:attribute>
                                                                                                                                        <xsl:if test="$data-PageReferenceType15 &gt; 0">
                                                                                                                                            <xsl:attribute name="PageReferenceType">
                                                                                                                                                <xsl:value-of select="'ForNextNParagraphs'"/>
                                                                                                                                            </xsl:attribute>
                                                                                                                                            
                                                                                                                                            <xsl:element name="Properties">
                                                                                                                                                <xsl:element name="PageReferenceLimit">
                                                                                                                                                    <xsl:attribute name="type" select="'long'"/>
                                                                                                                                                    <xsl:value-of select="$data-PageReferenceType15"/>
                                                                                                                                                </xsl:element>
                                                                                                                                            </xsl:element>
                                                                                                                                        </xsl:if>
                                                                                                                                        <!-\- Level 15 -\->
                                                                                                                                    </xsl:element>
                                                                                                                                </xsl:for-each>
                                                                                                                                
                                                                                                                                
                                                                                                                                
                                                                                                                                <!-\- Level 14 -\->
                                                                                                                           
                                                                                                                        </xsl:for-each>
                                                                                                                        
                                                                                                                        
                                                                                                                        <!-\- Level 13 -\->
                                                                                                                   
                                                                                                                </xsl:for-each>
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                <!-\- Level 12 -\->
                                                                                                            
                                                                                                        </xsl:for-each>
                                                                                                        
                                                                                                        
                                                                                                        
                                                                                                        <!-\- Level 11 -\->
                                                                                                    
                                                                                                </xsl:for-each>
                                                                                                
                                                                                                <!-\- Level 10 -\->
                                                                                            
                                                                                        </xsl:for-each>
                                                                                        
                                                                                        
                                                                                        
                                                                                        
                                                                                        
                                                                                        <!-\- Level 9 -\->
                                                                                    
                                                                                </xsl:for-each>
                                                                                
                                                                                <!-\- Level 8 -\->
                                                                            
                                                                        </xsl:for-each>
                                                                        <!-\- Level 7 -\->
                                                                        
                                                                    
                                                                </xsl:for-each>
                                                                
                                                                
                                                                
                                                                <!-\- Level 6 -\->
                                                                
                                                           
                                                        </xsl:for-each>
                                                        
                                                        
                                                        <!-\- Level 5 -\->
                                                    
                                                </xsl:for-each>
                                                <!-\- Level 4 -\-> 
                                                
                                            
                                        </xsl:for-each>
                                        <!-\- Level 3 -\->  
                                    
                                </xsl:for-each>
                                <!-\- Level 2 -\->  
                            
                        </xsl:for-each>
                        
                   
                   
                </xsl:if>
                
                </xsl:element>
            </xsl:if>
            
    </xsl:template>
   -->
    <xsl:template match="figure[not(img)][not(p)][figcaption[string-length(.) = 0]]"/>
    <!-- hyperlink update from xhtml to idml on 9-11-2021 -->
    <!--<xsl:template match="*//child::*[contains(@data-bkmark,'para')][1]">
        <xsl:element name="HyperlinkTextDestination">
            <xsl:attribute name="BookMarkDestination"><xsl:value-of select="'GenerateIndesignUUID_'"/><xsl:value-of select="@data-bkmark"/></xsl:attribute>
            <xsl:attribute name="Self"><xsl:value-of select="'HyperlinkTextDestination/'"/><xsl:value-of select="'GenerateIndesignUUID_'"/><xsl:value-of select="@data-bkmark"/></xsl:attribute>
            <xsl:attribute name="Name"><xsl:value-of select="'GenerateIndesignUUID_'"/><xsl:value-of select="@data-bkmark"/></xsl:attribute>
            <xsl:attribute name="Hidden" select="'true'"/>
            <xsl:attribute name="DestinationUniqueKey"><xsl:number level="any"/></xsl:attribute>
        </xsl:element>
        </xsl:template>-->
    <xsl:template match="*//child::*[contains(@data-bkmark,'para')][1]">
        <xsl:choose>
        <xsl:when test="contains(@data-bkmark,'_UUID_')">
            <xsl:element name="HyperlinkTextDestination">
                <xsl:attribute name="BookMarkDestination"><xsl:value-of select="@data-bkmark"/></xsl:attribute>
                <xsl:attribute name="Self"><xsl:value-of select="'HyperlinkTextDestination/'"/><xsl:value-of select="@data-bkmark"/></xsl:attribute>
                <xsl:attribute name="Name"><xsl:value-of select="@data-bkmark"/></xsl:attribute>
                <xsl:attribute name="Hidden" select="'true'"/>
                <xsl:attribute name="DestinationUniqueKey"><xsl:number level="any"/></xsl:attribute>
                </xsl:element>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:element name="HyperlinkTextDestination">
                        <xsl:attribute name="BookMarkDestination"><xsl:value-of select="'GenerateIndesignUUID_'"/><xsl:value-of select="@data-bkmark"/></xsl:attribute>
                        <xsl:attribute name="Self"><xsl:value-of select="'HyperlinkTextDestination/'"/><xsl:value-of select="'GenerateIndesignUUID_'"/><xsl:value-of select="@data-bkmark"/></xsl:attribute>
                        <xsl:attribute name="Name"><xsl:value-of select="'GenerateIndesignUUID_'"/><xsl:value-of select="@data-bkmark"/></xsl:attribute>
                        <xsl:attribute name="Hidden" select="'true'"/>
                        <xsl:attribute name="DestinationUniqueKey"><xsl:number level="any"/></xsl:attribute>
                    </xsl:element>
                </xsl:otherwise>
            </xsl:choose> 
    </xsl:template>
    <!-- Added for empty BB break Azure 5516 on 28-7-2023 -->
    <xsl:template match="//span[@style='white-space: nowrap;'][string-length(.) = 0]">
         <CharacterStyleRange AppliedCharacterStyle="CharacterStyle/$ID/[No character style]"
            NoBreak="true">
         </CharacterStyleRange>
    </xsl:template>
        </xsl:stylesheet>