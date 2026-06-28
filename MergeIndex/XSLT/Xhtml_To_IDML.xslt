<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<!-- Replace your namespace as needed-->
<!-- Added to avoid idml not opened issue by nesting change on 18-10-2021 -->
<!--Added to remove the Tab issue on 16-11-2021-->
<!-- Added to create the bookmark for newly inserted para on 25-11-2021 -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf"
xmlns:math="http://www.w3.org/1998/Math/MathML"
    exclude-result-prefixes="xs mf">
    <xsl:output indent="no"/>
    <xsl:variable name="artlog" select="document('Artlog.xml')"/>
    
    <xsl:param name="parentStory"/>
    <xsl:param name="proceesingBkmark"/>

    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="/html">
        <xsl:choose>
            <xsl:when test="count(//body/child::*) > 1">
                <body>
                    <xsl:apply-templates select="body"/>
                </body>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="body"/>
            </xsl:otherwise>
        </xsl:choose>

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
    <xsl:template match="span[@data-name = 'EquationName']">
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
                        <xsl:otherwise> </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="span[lower-case(@data-name) = 'page']">
        <xsl:variable name="id">
            <xsl:value-of select="1694958775 - position()"/>
        </xsl:variable>
        <xsl:variable name="DB"> </xsl:variable>
        <xsl:variable name="Alias">
            <xsl:value-of select="normalize-space(@data-name)"/>
        </xsl:variable>
        <xsl:variable name="Tag">
            <xsl:value-of select="normalize-space(@data-name)"/>
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

    <xsl:template match="math:math|math">
        <xsl:variable name="fileName" select="ancestor::*[@data-filename][1]/@data-filename"/>
        <Rectangle ContentType="GraphicType" StoryTitle="$ID/" ParentInterfaceChangeCount="" TargetInterfaceChangeCount="" LastUpdatedInterfaceChangeCount="" OverriddenPageItemProps="" HorizontalLayoutConstraints="FlexibleDimension FixedDimension FlexibleDimension" VerticalLayoutConstraints="FlexibleDimension FixedDimension FlexibleDimension" GradientFillStart="0 0" GradientFillLength="0" GradientFillAngle="0" GradientStrokeStart="0 0" GradientStrokeLength="0" GradientStrokeAngle="0" Locked="false" LocalDisplaySetting="Default" GradientFillHiliteLength="0" GradientFillHiliteAngle="0" GradientStrokeHiliteLength="0" GradientStrokeHiliteAngle="0" AppliedObjectStyle="ObjectStyle/$ID/[Normal Graphics Frame]" Visible="true" Name="mathImages">
            
            <AnchoredObjectSetting AnchoredPosition="InlinePosition" SpineRelative="false" LockPosition="false" PinPosition="false" AnchorPoint="BottomRightAnchor" HorizontalAlignment="LeftAlign" HorizontalReferencePoint="TextFrame" VerticalAlignment="TopAlign" VerticalReferencePoint="LineBaseline" AnchorXoffset="0" AnchorYoffset="0" AnchorSpaceAbove="0" />
            <TextWrapPreference Inverse="false" ApplyToMasterPageOnly="false" TextWrapSide="BothSides" TextWrapMode="None">
                <Properties>
                    <TextWrapOffset Top="0" Left="0" Bottom="0" Right="0" />
                </Properties>
                <ContourOption ContourType="SameAsClipping" IncludeInsideEdges="false" ContourPathName="$ID/" />
            </TextWrapPreference>
            <InCopyExportOption IncludeGraphicProxies="true" IncludeAllResources="false" />
            <FrameFittingOption AutoFit="true" LeftCrop="0" TopCrop="0" RightCrop="0" BottomCrop="0" FittingOnEmptyFrame="None" FittingAlignment="CenterAnchor" />
            <ObjectExportOption EpubType="$ID/" SizeType="DefaultSize" CustomSize="$ID/" PreserveAppearanceFromLayout="PreserveAppearanceDefault" AltTextSourceType="SourceXMLStructure" ActualTextSourceType="SourceXMLStructure" CustomAltText="$ID/" CustomActualText="$ID/" ApplyTagType="TagFromStructure" ImageConversionType="JPEG" ImageExportResolution="Ppi300" GIFOptionsPalette="AdaptivePalette" GIFOptionsInterlaced="true" JPEGOptionsQuality="High" JPEGOptionsFormat="BaselineEncoding" ImageAlignment="AlignLeft" ImageSpaceBefore="0" ImageSpaceAfter="0" UseImagePageBreak="false" ImagePageBreak="PageBreakBefore" CustomImageAlignment="false" SpaceUnit="CssPixel" CustomLayout="false" CustomLayoutType="AlignmentAndSpacing">
                <Properties>
                    <AltMetadataProperty NamespacePrefix="$ID/" PropertyPath="$ID/" />
                    <ActualMetadataProperty NamespacePrefix="$ID/" PropertyPath="$ID/" />
                </Properties>
            </ObjectExportOption>
            <EPS GrayVectorPolicy="IgnoreAll" RGBVectorPolicy="HonorAllProfiles" CMYKVectorPolicy="IgnoreAll" OverriddenPageItemProps="" LocalDisplaySetting="Default" ImageTypeName="$ID/EPS" AppliedObjectStyle="ObjectStyle/$ID/[None]" ParentInterfaceChangeCount="" TargetInterfaceChangeCount="" LastUpdatedInterfaceChangeCount="" HorizontalLayoutConstraints="FlexibleDimension FixedDimension FlexibleDimension" VerticalLayoutConstraints="FlexibleDimension FixedDimension FlexibleDimension" Visible="true" Name="$ID/">
                <Properties>
                    <GraphicBounds Left="0" Top="0" Right="78" Bottom="36" />
                </Properties>
                <TextWrapPreference Inverse="false" ApplyToMasterPageOnly="false" TextWrapSide="BothSides" TextWrapMode="None">
                    <Properties>
                        <TextWrapOffset Top="0" Left="0" Bottom="0" Right="0" />
                    </Properties>
                    <ContourOption ContourType="SameAsClipping" IncludeInsideEdges="false" ContourPathName="$ID/" />
                </TextWrapPreference>
                
                <Link AssetURL="$ID/" AssetID="$ID/" RenditionData="Actual" LinkResourceURI="file:C:/{$fileName}" LinkResourceFormat="$ID/EPS" StoredState="Normal" LinkResourceModified="false" LinkObjectModified="false" ShowInUI="true" CanEmbed="true" CanUnembed="true" CanPackage="true" ImportPolicy="NoAutoImport" ExportPolicy="NoAutoExport" />
                <ClippingPathSettings ClippingType="None" InvertPath="false" IncludeInsideEdges="false" RestrictToFrame="false" UseHighResolutionImage="true" Threshold="25" Tolerance="2" InsetFrame="0" AppliedPathName="$ID/" Index="-1" />
            </EPS>
        </Rectangle>
    </xsl:template>

    <!-- XHTML div -->
    <xsl:template match="h1 | h2 | h3 | h4 | h5 | h6 | p | li">
        <xsl:param name="pPr_Default"/>
        <xsl:param name="rPr_Default"/>
        <xsl:variable name="self" select="self::*"/>
        <!--		<xsl:variable name="bookmark" select="descendant::span[contains(lower-case(@data-bkmark),'story')][(ancestor::h1[1]|ancestor::h2[1]|ancestor::h3[1]|ancestor::h4[1]|ancestor::h5[1]|ancestor::h6[1]|ancestor::p[1]|ancestor::li[1]) = $self][1]"/>-->
        <xsl:element name="ParagraphStyleRange">
            <xsl:if
                test="string-length($proceesingBkmark) > 0 and not(self::*/ancestor::commentreference)">
                <xsl:attribute name="ParaNumber" select="$proceesingBkmark"/>
            </xsl:if>
            <xsl:if test="lower-case(@data-change) = 'parainserted'">
                <xsl:attribute name="Wchange" select="'parainserted'"/>
            </xsl:if>
            <!--			<xsl:if test="string-length($parentStory) > 0">-->
            <xsl:attribute name="ParentStory" select="$parentStory"/>
            <!--</xsl:if>-->
            <xsl:variable name="pstyle">
                <xsl:choose>
                    <xsl:when test="@data-name and (string-length(@data-name) > 0)">
                        <xsl:choose>
                            <xsl:when test="@data-name = 'NormalParagraphStyle'">
                                <xsl:value-of select="'ParagraphStyle/$ID/NormalParagraphStyle'"/>
                            </xsl:when>
                            <xsl:when test="@data-name = '[No paragraph style]'">
                                <xsl:value-of select="'ParagraphStyle/$ID/[No paragraph style]'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="concat('ParagraphStyle/', normalize-space(@data-name))"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:choose>
                            <xsl:when test="@class and (string-length(@class) > 0)">
                                <xsl:choose>
                                    <xsl:when test="@class = 'NormalParagraphStyle'">
                                        <xsl:value-of
                                            select="'ParagraphStyle/$ID/NormalParagraphStyle'"/>
                                    </xsl:when>
                                    <xsl:when test="@class = '[No paragraph style]'">
                                        <xsl:value-of
                                            select="'ParagraphStyle/$ID/[No paragraph style]'"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="concat('ParagraphStyle/', normalize-space(@class))"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="'ParagraphStyle/$ID/[No paragraph style]'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:attribute name="AppliedParagraphStyle">
                <xsl:value-of select="$pstyle"/>
            </xsl:attribute>
            <xsl:if test="self::*[lower-case(@data-change) = 'changestyle']">
                <xsl:element name="FormattingChange">
                    <xsl:attribute name="FormattingChange" select="'true'"/>
                </xsl:element>
            </xsl:if>
            <!-- Added to create the bookmark for newly inserted para on 25-11-2021 -->
            <xsl:if test="lower-case(@data-change) = 'parainserted'">
                <xsl:variable name="gid">
                    <xsl:value-of select="generate-id()"/>
                </xsl:variable>
                <xsl:variable name="prevbookmar" select="substring-after(@data-custom_bkmark,'UUID_')"/>
                  <xsl:element name="CharacterStyleRange">
                        <xsl:attribute name="AppliedCharacterStyle" select="'CharacterStyle/$ID/[No character style]'"/>         
                      <xsl:element name="XMLElement">
                          <xsl:attribute name="MarkupTag">
                              <xsl:value-of select="'XMLTag/'"/>
                              <xsl:value-of select="@data-name"/>
                          </xsl:attribute>
                          <xsl:attribute name="Self"><xsl:value-of select="generate-id()"/></xsl:attribute>
                          <xsl:element name="CharacterStyleRange">
                              <xsl:attribute name="AppliedCharacterStyle" select="'CharacterStyle/$ID/[No character style]'"/>
             <xsl:element name="HyperlinkTextDestination">
                 <xsl:attribute name="BookMarkDestination"><xsl:value-of select="concat('GenerateReviousUUID_',$prevbookmar,$gid)"/></xsl:attribute>
                 <xsl:attribute name="Self"><xsl:value-of select="'HyperlinkTextDestination/'"/><xsl:value-of select="concat('GenerateReviousUUID_',$prevbookmar,$gid)"/></xsl:attribute>
                 <xsl:attribute name="Name"><xsl:value-of select="concat('GenerateReviousUUID_',$prevbookmar,$gid)"/></xsl:attribute>
                    <xsl:attribute name="Hidden" select="'true'"/>
                    <xsl:attribute name="DestinationUniqueKey"><xsl:number level="any"/></xsl:attribute>
                </xsl:element>
                  </xsl:element>
                  </xsl:element>
                  </xsl:element>
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
             <CharacterStyleRange AppliedCharacterStyle="CharacterStyle/$ID/[No character style]">
                <Br/>
            </CharacterStyleRange>
        </xsl:element>
    </xsl:template>

    <xsl:template match="span[@data-bkmark]">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="span[@style] | span">
        <xsl:param name="pPr_Default"/>
        <xsl:param name="rPr_Default"/>
        <xsl:apply-templates>
            <xsl:with-param name="pPr_Default">
                <xsl:copy-of select="$pPr_Default"/>
            </xsl:with-param>
            <xsl:with-param name="rPr_Default">
                <xsl:copy-of select="$rPr_Default"/>
            </xsl:with-param>
        </xsl:apply-templates>
    </xsl:template>
    <!-- soft enter-->
    <xsl:template match="br">
        <xsl:choose>
            <xsl:when test="not(ancestor::del) and ancestor-or-self::*[contains(@class,'ice-del')]">
                <xsl:element name="Change">
                    <xsl:if test="@datetime">
                        <xsl:attribute name="Date" select="@datetime"/>
                    </xsl:if>
                    <xsl:attribute name="ChangeType" select="'DeletedText'"/>
                    <xsl:attribute name="From" select="'AuthorProof'"/>
                    <xsl:element name="CharacterStyleRange">
                        <xsl:attribute name="AppliedCharacterStyle"
                            select="'CharacterStyle/$ID/[No character style]'"/>
                        <xsl:element name="Content">
                            <xsl:value-of select="'&#8232;'" disable-output-escaping="yes"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            <!-- Added to avoid idml not opened issue by nesting change on 18-10-2021 -->
            <xsl:when test="@data-change[not(parent::br/ancestor::ins)]">
                <xsl:element name="Change">
                    <xsl:if test="@datetime">
                        <xsl:attribute name="Date" select="@datetime"/>
                    </xsl:if>
                    <xsl:attribute name="ChangeType" select="'InsertedText'"/>
                    <xsl:attribute name="From" select="'AuthorProof'"/>
                    <xsl:element name="CharacterStyleRange">
                        <xsl:attribute name="AppliedCharacterStyle"
                            select="'CharacterStyle/$ID/[No character style]'"/>
                        <xsl:element name="Content">
                            <xsl:value-of select="'&#8232;'" disable-output-escaping="yes"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="CharacterStyleRange">
                    <xsl:attribute name="AppliedCharacterStyle"
                        select="'CharacterStyle/$ID/[No character style]'"/>
                    <xsl:element name="Content">
                        <xsl:value-of select="'&#8232;'" disable-output-escaping="yes"/>
                    </xsl:element>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="text()">
        <xsl:param name="rPr_Default"/>
        <xsl:variable name="removeFormatPos" select="count(ancestor::*[contains(lower-case(@class) ,'removeformat') or contains(lower-case(@data-name) ,'removeformat')][1]/ancestor::*)"/>
        <xsl:variable name="boldPos" select="count(ancestor::b[1]/ancestor::*)"/>
        <xsl:variable name="storngPos" select="count(ancestor::strong[1]/ancestor::*)"/>
        <xsl:variable name="iPos" select="count(ancestor::i[1]/ancestor::*)"/>
        <xsl:variable name="emPos" select="count(ancestor::em[1]/ancestor::*)"/>
        <xsl:variable name="uPos" select="count(ancestor::u[1]/ancestor::*)"/>
        <xsl:variable name="strikePos" select="count(ancestor::strike[1]/ancestor::*)"/>
        <xsl:variable name="supPos" select="count(ancestor::sup[1]/ancestor::*)"/>
        <xsl:variable name="subPos" select="count(ancestor::sub[1]/ancestor::*)"/>
        <xsl:variable name="style" select="count(ancestor::span[@class or @data-name][1]//ancestor::*)"/>
        <!-- added by mariappan for remove upper case and lower case -->
        <xsl:variable name="uppercasePos" select="count(ancestor::*[contains(lower-case(@data-name),'touppercase')]/ancestor::*)"/>
        <xsl:variable name="lowercasePos" select="count(ancestor::*[contains(lower-case(@data-name),'tosmallcaps')]/ancestor::*)"/>
        <xsl:variable name="tolowercasePos" select="count(ancestor::*[contains(lower-case(@data-name),'tolowercase')]/ancestor::*)"/>
        <xsl:variable name="applyupper">
            <xsl:choose>
                <xsl:when test="$removeFormatPos">
                    <xsl:value-of select="$uppercasePos &gt; $removeFormatPos"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="true()"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="applylower">
            <xsl:choose>
                <xsl:when test="$removeFormatPos">
                    <xsl:value-of select="$lowercasePos &gt; $removeFormatPos"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="true()"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="applytolower">
            <xsl:choose>
                <xsl:when test="$removeFormatPos">
                    <xsl:value-of select="$tolowercasePos &gt; $removeFormatPos"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="true()"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <!-- end -->
   
        <xsl:variable name="applystyle">
            <xsl:choose>
                <xsl:when test="$removeFormatPos">
	                <xsl:choose>
	                       <xsl:when test="ancestor::*[contains(lower-case(@class) ,'removeformat') or contains(lower-case(@data-name) ,'removeformat')][1]">
		                	<xsl:value-of select="true()"/>
		                </xsl:when>
	                    
		                <xsl:otherwise>
		                 	<xsl:value-of select="$style &gt; $removeFormatPos"/>
		                </xsl:otherwise>
	                </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="true()"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="applybold">
            <xsl:choose>
                <xsl:when test="$removeFormatPos">
                    <xsl:value-of select="$boldPos &gt; $removeFormatPos"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="true()"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="applystorng">
            <xsl:choose>
                <xsl:when test="$removeFormatPos">
                    <xsl:value-of select="$storngPos &gt; $removeFormatPos"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="true()"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="applyi">
            <xsl:choose>
                <xsl:when test="$removeFormatPos">
                    <xsl:value-of select="$iPos &gt; $removeFormatPos"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="true()"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="applyem">
            <xsl:choose>
                <xsl:when test="$removeFormatPos">
                    <xsl:value-of select="$emPos &gt; $removeFormatPos"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="true()"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="applyu">
            <xsl:choose>
                <xsl:when test="$removeFormatPos">
                    <xsl:value-of select="$uPos &gt; $removeFormatPos"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="true()"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="applystrike">
            <xsl:choose>
                <xsl:when test="$removeFormatPos">
                    <xsl:value-of select="$strikePos &gt; $removeFormatPos"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="true()"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="applysup">
            <xsl:choose>
                <xsl:when test="$removeFormatPos">
                    <xsl:value-of select="$supPos &gt; $removeFormatPos"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="true()"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="applysub">
            <xsl:choose>
                <xsl:when test="$removeFormatPos">
                    <xsl:value-of select="$subPos &gt; $removeFormatPos"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="true()"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="cstyle">
            <xsl:variable name="dataName" select="./ancestor::span[@data-name][not(contains(lower-case(@class),'removeformat'))][1]/normalize-space(@data-name)"/>
            <xsl:variable name="class" select="./ancestor::span[not(contains(lower-case(@class),'removeformat'))][1]/normalize-space(@class)"/>
            <xsl:choose>
                <xsl:when test="./ancestor::span[@data-name][not(contains(lower-case(@class),'removeformat'))][1] and (string-length($dataName) > 0)">
                    <xsl:value-of select="$dataName"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:choose>
                        <xsl:when test="./ancestor::span[not(contains(lower-case(@class),'removeformat'))][1] and (string-length($class) > 0)">
                            <xsl:value-of select="$class"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <!--   if there is no data-name and class in the element there is no style in the element-->
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="cUpdatedstyle">
            <xsl:choose>
                <!--instruction image and comment-image added mariappan  on 5-5-2022-->
                <xsl:when test="$cstyle and (string-length($cstyle) > 0) and ($cstyle != 'instruction-image') and ($cstyle != 'comment-image') and $applystyle">
                    <xsl:choose>
                        <xsl:when test="$cstyle = '[No character style]'">
                            <xsl:value-of select="'CharacterStyle/$ID/[No character style]'"/>
                        </xsl:when>
                        <xsl:when test="$cstyle = 'Nocharacterstyle'">
                            <xsl:value-of select="'CharacterStyle/$ID/[No character style]'"/>
                        </xsl:when>
                        <xsl:when test="lower-case($cstyle) = 'removeformat'">
                            <xsl:value-of select="'CharacterStyle/$ID/[No character style]'"/>
                        </xsl:when>
                        <xsl:when test="lower-case($cstyle) = 'tolowercase'">
                            <xsl:value-of select="'CharacterStyle/$ID/[No character style]'"/>
                        </xsl:when>
                        <xsl:when test="lower-case($cstyle) = 'touppercase'">
                            <xsl:value-of select="'CharacterStyle/$ID/[No character style]'"/>
                        </xsl:when>
                        <xsl:when test="lower-case($cstyle) = 'tosmallcaps'">
                            <xsl:value-of select="'CharacterStyle/$ID/[No character style]'"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="concat('CharacterStyle/', $cstyle)"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
            </xsl:choose>
        </xsl:variable> 
        <xsl:element name="CharacterStyleRange">
           <!-- <xsl:if test="$removeFormatPos">
            <xsl:attribute name="removeFormatPos" select="$removeFormatPos"/>
            <xsl:attribute name="bPos" select="$boldPos"/>
            <xsl:attribute name="applybold" select="$applybold"/>
            <xsl:attribute name="applyStrong" select="$applystorng"/>
            <xsl:attribute name="iPos" select="$iPos"/>
            <xsl:attribute name="applyi" select="$applyi"/>
            <xsl:attribute name="applyEm" select="$applyem"/>
            </xsl:if>-->
            <xsl:attribute name="AppliedCharacterStyle">
                <xsl:choose>
                    <xsl:when test="(string-length($cUpdatedstyle) > 0)">
                        <xsl:value-of select="$cUpdatedstyle"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="'CharacterStyle/$ID/[No character style]'"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            
            <xsl:choose>
                <xsl:when
                    test="(ancestor::i[not(@class='removestyle')]) and ancestor::b[@class='removestyle']">
                    <xsl:attribute name="FontStyle" select="'Italic'"/>
                </xsl:when>
                <xsl:when
                    test="(ancestor::i[@class='removestyle']) and ancestor::b[not(@class='removestyle')]">
                    <xsl:attribute name="FontStyle" select="'Bold'"/>
                </xsl:when>
                <xsl:when
                    test="(ancestor::i[@class='removestyle']) and not(ancestor::b)">
                    <xsl:attribute name="FontStyle" select="'Regular'"/>
                </xsl:when>
                <xsl:when
                    test="(ancestor::b[@class='removestyle']) and not(ancestor::i)">
                    <xsl:attribute name="FontStyle" select="'Regular'"/>
                </xsl:when>
                <xsl:when
                    test="(ancestor::b[@class='removestyle']) and (ancestor::i[@class='removestyle'])">
                    <xsl:attribute name="FontStyle" select="'Regular'"/>
                </xsl:when>
                <xsl:when
                     test="((ancestor::i[not(@class='removestyle')] and ($applyi = true())) or (ancestor::em and ($applyem = true()))) and not(ancestor::b or ancestor::strong)">
                    <xsl:attribute name="FontStyle" select="'Italic'"/>
                </xsl:when>
                <xsl:when test="((ancestor::i[not(@class='removestyle')] and ($applyi = true())) or (ancestor::em and ($applyem = true()))) and ((ancestor::b[not(@class='removestyle')] and ($applybold = false())) or (ancestor::strong and ($applystorng = false())))">
                    <xsl:attribute name="FontStyle" select="'Italic'"/>
                </xsl:when>
                <xsl:when
                    test="((ancestor::i[not(@class='removestyle')] and ($applyi = false())) or (ancestor::em and ($applyem = false()))) and not(ancestor::b or ancestor::strong)">
                    <xsl:attribute name="FontStyle" select="'Regular'"/>
                </xsl:when>
                <xsl:when
                    test="not(ancestor::i or ancestor::em) and ((ancestor::b[not(@class='removestyle')] and ($applybold = true())) or (ancestor::strong and ($applystorng = true())))">
                    <xsl:attribute name="FontStyle" select="'Bold'"/>
                </xsl:when>
                <xsl:when
                    test="not(ancestor::i or ancestor::em) and ((ancestor::b[not(@class='removestyle')] and ($applybold = false())) or (ancestor::strong and ($applystorng = false())))">
                    <xsl:attribute name="FontStyle" select="'Regular'"/>
                </xsl:when>
                <xsl:when test="((ancestor::i[not(@class='removestyle')] and ($applyi = false())) or (ancestor::em and ($applyem = false()))) and ((ancestor::b[not(@class='removestyle')] and ($applybold = true())) or (ancestor::strong and ($applystorng = true())))">
                    <xsl:attribute name="FontStyle" select="'Bold'"/>
                </xsl:when>
                <xsl:when test="((ancestor::i[not(@class='removestyle')] and ($applyi = true())) or (ancestor::em and ($applyem = true()))) and ((ancestor::b[not(@class='removestyle')] and ($applybold = true())) or (ancestor::strong and ($applystorng = true())))">
                    <xsl:attribute name="FontStyle" select="'Bold Italic'"/>
                </xsl:when>
                <xsl:when test="((ancestor::i[not(@class='removestyle')] and ($applyi = false())) or (ancestor::em and ($applyem = false()))) and ((ancestor::b[not(@class='removestyle')] and ($applybold = false())) or (ancestor::strong and ($applystorng = false())))">
                    <xsl:attribute name="FontStyle" select="'Regular'"/>
                </xsl:when>
            </xsl:choose>
           
            <xsl:if test="(lower-case($cstyle) = 'tosmallcaps') and $applystyle">
               <xsl:attribute name="Capitalization" select="'SmallCaps'"/>
            </xsl:if>
             <xsl:if test="(lower-case($cstyle) = 'touppercase') and $applystyle">
             <xsl:attribute name="Capitalization" select="'AllCaps'"/>
            </xsl:if>
            
            <!-- added by mariappan -->
            <xsl:if test="((ancestor::span[lower-case(@data-name) = 'touppercase']) and ($applyupper = false()))">
                <xsl:attribute name="Capitalization" select="'Normal'"/>
            </xsl:if>
            <xsl:if test="((ancestor::span[lower-case(@data-name) = 'tosmallcaps']) and ($applylower = false()))">
                <xsl:attribute name="Capitalization" select="'Normal'"/>
            </xsl:if>
            <xsl:if test="((ancestor::span[lower-case(@data-name) = 'tolowercase']) and ($applytolower = false()))">
                <xsl:attribute name="Capitalization" select="'Normal'"/>
            </xsl:if>
            <!-- End -->
                        
            <xsl:if test="ancestor::u[not(@class='removestyle')] and ($applyu = true())">
                <xsl:attribute name="Underline" select="'true'"/>
            </xsl:if>
            <xsl:if test="ancestor::u[not(@class='removestyle')] and ($applyu = false())">
                <xsl:attribute name="Underline" select="'false'"/>
            </xsl:if>
            <xsl:if test="ancestor::u[@class='removestyle']">
                <xsl:attribute name="Underline" select="'false'"/>
            </xsl:if>
            
            <xsl:if test="ancestor::strike[not(@class='removestyle')] and ($applystrike = true())">
                <xsl:attribute name="StrikeThru" select="'true'"/>
            </xsl:if>
            <xsl:if test="ancestor::strike[not(@class='removestyle')] and ($applystrike = false())">
                <xsl:attribute name="StrikeThru" select="'false'"/>
            </xsl:if>
            <xsl:if test="ancestor::strike[@class='removestyle']">
                <xsl:attribute name="StrikeThru" select="'false'"/>
            </xsl:if>
            <xsl:if test="ancestor::sup[not(@class='removestyle')] and ($applysup = true())">
                <xsl:attribute name="Position" select="'Superscript'"/>
            </xsl:if>
            <xsl:if test="ancestor::sup[not(@class='removestyle')] and ($applysup = false())">
                <xsl:attribute name="Position" select="'Normal'"/>
            </xsl:if>
            <xsl:if test="ancestor::sub[not(@class='removestyle')] and ($applysub = true())">
                <xsl:attribute name="Position" select="'Subscript'"/>
            </xsl:if>
            <xsl:if test="ancestor::sub[not(@class='removestyle')] and ($applysub = false())">
                <xsl:attribute name="Position" select="'Normal'"/>
            </xsl:if>      
            <xsl:if
                test="(ancestor::sup[not(@class='removestyle')]) and ancestor::sub[@class='removestyle']">
                <xsl:attribute name="FontStyle" select="'Superscript'"/>
            </xsl:if>
            <xsl:if
                test="(ancestor::sup[@class='removestyle']) and ancestor::sub[not(@class='removestyle')]">
                <xsl:attribute name="Position" select="'Subscript'"/>
            </xsl:if>
            <xsl:if
                test="(ancestor::sup[@class='removestyle']) and not(ancestor::sub)">
                <xsl:attribute name="Position" select="'Normal'"/>
            </xsl:if>
            <xsl:if
                test="(ancestor::sub[@class='removestyle']) and not(ancestor::sup)">
                <xsl:attribute name="Position" select="'Normal'"/>
            </xsl:if>
            <xsl:if
                test="(ancestor::sub[@class='removestyle']) and (ancestor::sup[@class='removestyle'])">
                <xsl:attribute name="Position" select="'Normal'"/>
            </xsl:if>
            
            
            
            
            
            
            <!--	This is to take care the formatting changes in the auhtor Proof process		-->
            <xsl:if
                test="./ancestor::*[lower-case(@data-change) = 'changestyle' or @class='removestyle'][not(self::*/name() = 'h1' or self::*/name() = 'h2' or self::*/name() = 'h3' or self::*/name() = 'h4' or self::*/name() = 'h5' or self::*/name() = 'h6' or self::*/name() = 'p' or self::*/name() = 'li')]">
                <xsl:element name="FormattingChange">
                    <xsl:attribute name="FormattingChange" select="'true'"/>
                </xsl:element>
            </xsl:if>
            
            <xsl:choose>
                <xsl:when test="ancestor::del">
                    <xsl:element name="Content">
                        <xsl:value-of select="."/>
                    </xsl:element>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:element name="Content">
                        <xsl:value-of select="."/>
                        <!--<xsl:apply-templates/>-->
                    </xsl:element>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:element>
    </xsl:template>

    <!--<xsl:template match="ins">
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
                    <xsl:copy-of select="@data-daisyMarker"/>
                    <xsl:if test="@datetime">
                        <xsl:attribute name="Date" select="@datetime"/>
                    </xsl:if>
                    <xsl:attribute name="ChangeType" select="'InsertedText'"/>
                    <xsl:if test="@data-daisyMarker">
                        <xsl:attribute name="From" select="'AuthorProof'"/>
                    </xsl:if>
                    <xsl:if test="@cite">
                        <xsl:attribute name="AppliedDocumentUser" select="@cite"/>
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
                    <xsl:copy-of select="@data-daisyMarker"/>
                    <xsl:if test="@cite">
                        <xsl:attribute name="AppliedDocumentUser" select="@cite"/>
                    </xsl:if>
                    <xsl:attribute name="ChangeType" select="'DeletedText'"/>
                    <xsl:if test="@datetime">
                        <xsl:attribute name="Date" select="@datetime"/>
                    </xsl:if>
                    <!-\-   <xsl:apply-templates/>-\->
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
    </xsl:template>-->
    <!--Added to remove the Tab issue on 16-11-2021-->
       <xsl:template match="span[@data-change='tabdelete']">
               <xsl:element name="Change">
                     <xsl:attribute name="ChangeType" select="'DeletedText'"/>
                   <xsl:element name="CharacterStyleRange">
                       <xsl:attribute name="AppliedCharacterStyle" select="'CharacterStyle/$ID/[No character style]'"/>
                      <xsl:element name="Content">
                          <xsl:value-of select="'&#x9;'"/>
                       </xsl:element>
                   </xsl:element>
                </xsl:element>          
      </xsl:template>
    <!-- XHTML nested character formatting -->
    <!--<xsl:template name="apply-nested-character-formatting">
        <xsl:param name="rPr_Default"/>
        <!-\- apply default character formatting first -\->
        <xsl:copy-of select="$rPr_Default"/>
        <!-\- incase the paragraph itself deleted or newly inserted  -\->
       
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
        </xsl:choose>
        <xsl:if test="ancestor::u">
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
    </xsl:template>-->

    <!-- Footnote created on 20.07.2017-->
    <!-- Footnote updated on 05.08.2017
	1. Template match change data-name to class
	2. New XMLElement added(12.08.2017)
	3. Template match change(span[@class='MsoFootnoteReference'] to div[@class='footnotecaption'] )
	4. Remove When condition-->

    <xsl:template match="span[@style='padding-left:68px;']">
        <xsl:element name="Content">
            <xsl:value-of select="'&#x9;'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="span[@class = 'MsoFootnoteReference' or @class = 'FootnoteReference' or @data-name='footnote reference'] | //a[@class='footnotecitation' or contains(@href,'#ftn')]">
        <!--Update FootNote {Mahesh} 28.12.2017-->
        <!--FootNote citation-->
        <xsl:element name="XMLElement">
            <!-- Updated on 12.08.2017-->
            <xsl:attribute name="Self" select="'di2'"/>
            <!-- Updated on 12.08.2017-->
            <xsl:attribute name="MarkupTag" select="'XMLTag/sup'"/>
            <!-- Updated on 12.08.2017-->
            <xsl:element name="CharacterStyleRange">
                <xsl:attribute name="AppliedCharacterStyle">
                    <xsl:value-of select="'CharacterStyle/'"/>
                    <xsl:value-of select="ancestor::span/@data-name"/>
                </xsl:attribute>
                <xsl:attribute name="Position">
                    <xsl:value-of select="'Superscript'"/>
                </xsl:attribute>
                <xsl:variable name="astyle" select="ancestor::a/@style"/>
                <xsl:variable name="astyle1" select="self::a[@class='footnotecitation' or contains(@href,'#ftn')]/@id"/>
                <xsl:for-each select="//div[@style = 'mso-element:footnote'] | //li[@style = 'mso-element:footnote']">
                    <!--Footnote Caption-->
                    <xsl:variable name="bstyle" select="descendant::a/@style"/>
                    <xsl:variable name="bstyle1" select="descendant::a[contains(@href,'#ftnref')]/substring-after(@href,'#')"/>
                    <xsl:choose>
                        <xsl:when test="$bstyle = $astyle">
                            <xsl:apply-templates select="self::div[@style = 'mso-element:footnote']"
                                mode="moveme"/>
                        </xsl:when>
                        <xsl:when test="$bstyle1 = $astyle1">
                            <xsl:apply-templates select="self::li[@style = 'mso-element:footnote']"
                                mode="moveme"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:element>
        </xsl:element>
        <!-- Updated on 12.08.2017-->

    </xsl:template>

    <xsl:template match="div[@style = 'mso-element:footnote'] | li[@style = 'mso-element:footnote']" mode="moveme">
        <Footnote>
            <ParagraphStyleRange AppliedParagraphStyle="ParagraphStyle/$ID/NormalParagraphStyle">
                <CharacterStyleRange AppliedCharacterStyle="CharacterStyle/$ID/[No character style]">
                    <Content>
                        <xsl:processing-instruction name="ACE" select="'4'"/>
                    </Content>
                </CharacterStyleRange>
            </ParagraphStyleRange>
            <xsl:apply-templates/>
        </Footnote>
    </xsl:template>
    <xsl:template match="div[@style = 'mso-element:footnote'] | li[@style = 'mso-element:footnote']"/>
    <xsl:template match="a">
        <xsl:choose>
            <xsl:when test="ancestor::div[@style = 'mso-element:footnote']"> </xsl:when>
            <xsl:when test="ancestor::li[@style = 'mso-element:footnote']"> </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- End Footnote-->
    <!-- Command started on 20.7.2017-->
    <xsl:template match="span[@data-name = 'CommentReference'] | span[@data-comment]">
        
        <xsl:variable name="astyle" select="@data-comment"/>
        <xsl:variable name="span" select="boolean(ancestor::span)"/>

        <xsl:for-each select="//comment[ancestor-or-self::*[@data-commentvalue][1][@data-commentvalue = $astyle]]">
           <!-- <xsl:choose>
                <xsl:when test="$span = true()">
                    <xsl:apply-templates select="self::comment" mode="moveme"/>
                </xsl:when>
                <xsl:otherwise>
                    <CharacterStyleRange AppliedCharacterStyle="CharacterStyle/$ID/[No character style]">
                        <xsl:apply-templates select="self::comment" mode="moveme"/>
                    </CharacterStyleRange>
                </xsl:otherwise>
            </xsl:choose>-->
         <xsl:apply-templates select="self::comment" mode="moveme"/>
        </xsl:for-each>
      
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="comment" mode="moveme">
    <xsl:variable name="author" select="@data-user"/>
        <xsl:variable name="data-instruction" select="@data-instruction"/>
        <xsl:variable name="data-type" select="@data-type"/>
        <xsl:element name="Note">         
            <xsl:if test="string-length($author) > 0">
                <xsl:attribute name="UserName">
                    <xsl:value-of select="$author"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="string-length($data-instruction) > 0 and not(@data-placement='false')">
                <xsl:attribute name="Instruction">
                    <xsl:value-of select="$data-instruction"/>
                </xsl:attribute>
                <xsl:element name="Properties">
                    <xsl:element name="Label">
                        <xsl:element name="KeyValuePair">                            
                            <xsl:attribute name="Key">
                                <xsl:value-of select="'Label'"/>
                            </xsl:attribute>
                            <xsl:attribute name="Value">
                                <xsl:value-of select="$data-type"/>
                            </xsl:attribute>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
            </xsl:if>
            <xsl:if test="@data-placement='false' and string-length($data-instruction) > 0">
                   <xsl:element name="Properties">
                    <xsl:element name="Label">
                        <xsl:element name="KeyValuePair">                            
                            <xsl:attribute name="Key">
                                <xsl:value-of select="'Label'"/>
                            </xsl:attribute>
                            <xsl:attribute name="Value">
                                <xsl:value-of select="concat($data-type,'_PLACED')"/>
                            </xsl:attribute>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
            </xsl:if>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <!--	removing the deleted reply comment which is deleted by the user-->
    <xsl:template match="comment[@data-change = 'commentdeleted']" mode="moveme"/>

    <xsl:template match="comment"/>
    <xsl:template match="label">
        <xsl:choose>
            <xsl:when test="ancestor::comment"> </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- End command>-->
    <xsl:template match="div[@process = 'authorProof']">
        <xsl:apply-templates/>
    </xsl:template>


    <!-- Cell Table created on 08/01/2017-->
    <xsl:template match="table">
        <xsl:variable name="cont"
            select="concat('ucbie', count(preceding-sibling::*[name() = name(current())]))"/>
        <xsl:variable name="self" select="self::*"/>
        <xsl:variable name="bookmark"
            select="descendant::span[contains(lower-case(@data-bkmark), 'cell')][(ancestor::table[1]) = $self][1]/@data-bkmark"/>

        <xsl:element name="Table">
            <xsl:if test="string-length($bookmark) > 0">
                <xsl:attribute name="CellNumber" select="$bookmark"/>
            </xsl:if>
            <xsl:attribute name="Self" select='"S4C001"'/>
            <xsl:attribute name="HeaderRowCount" select='"0"'/>
            <xsl:attribute name="FooterRowCount" select='"0"'/>
            <xsl:attribute name="AppliedTableStyle" select='"TableStyle/$ID/[No table style]"'/>
            <xsl:attribute name="TableDirection" select='"LeftToRightDirection"'/>
            <!-- Please Check 11.09.2017 -->
            <xsl:attribute name="ColumnCount">
                <xsl:variable name="ss" select="@maxtd"/>
                <xsl:value-of select="$ss"/>
            </xsl:attribute>
            <!--<xsl:attribute name="ColumnCount">
				<xsl:variable name="ss" select="(count(tr[1]/child::*) + sum(tr[1]/td/@colspan)) - count(tr[1]/td/@colspan)"/>
				<xsl:value-of select="$ss"/>
			</xsl:attribute>-->
            <!-- end-->
            <xsl:attribute name="BodyRowCount">
                <xsl:variable name="dd" select="count(tr)"/>
                <xsl:value-of select="$dd"/>
            </xsl:attribute>
            <!--  Row attribute  Count -->
            <xsl:variable name="counter1" select="tr/td/width"/>
            <xsl:variable name="SingleColumnWidth" select="tr[1]/td[$counter1]/width/@Columnwidth"/>
            <xsl:for-each select="tr">
                <xsl:element name="Row">
                    <xsl:attribute name="Self" select="concat('ucbie2Row', position() - 1)"/>
                    <xsl:attribute name="Name" select="position() - 1"/>
                    <xsl:attribute name="SingleRowHeight">
                        <xsl:value-of select="'16.25'"/>
                    </xsl:attribute>

                    <xsl:attribute name="MinimumHeight">
                        <xsl:value-of select="'3'"/>
                    </xsl:attribute>
                    <xsl:attribute name="AutoGrow" select="'true'"/>
                </xsl:element>
                <xsl:variable name="trcount" select="count(tr)"/>
                <xsl:text>&#x000A;</xsl:text>
            </xsl:for-each>
            <!--  Column attribute  Count -->
            <xsl:variable name="count"
                select="xs:integer((count(tr[1]/child::*) + sum(tr[1]/td/@colspan)) - count(tr[1]/td/@colspan))"/>
            <xsl:variable name="maxid" select="@maxtd"/>
            <xsl:for-each select="1 to $maxid">
                <xsl:element name="Column">
                    <xsl:attribute name="Name">
                        <!--<xsl:variable name="ff" select="ancestor::colgroup/@cols"/>-->
                        <xsl:variable name="ff" select="position()"/>
                        <xsl:value-of select="$ff - 1"/>
                    </xsl:attribute>
                    <xsl:attribute name="Self">
                        <!--						<xsl:variable name="ff1" select="./@colnum"/>-->
                        <xsl:variable name="ff1" select="position()"/>
                        <xsl:value-of select="concat('ucbie2Column', $ff1 - 1)"/>
                    </xsl:attribute>
                    <xsl:attribute name="SingleColumnWidth">
                        <xsl:value-of select="'100'"/>
                    </xsl:attribute>
                </xsl:element>
            </xsl:for-each>
            <xsl:choose>
                <xsl:when test="tr/td">
                    <xsl:apply-templates select="tr[td]"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:element>
    </xsl:template>


    <xsl:template match="td" name="T" priority="1">
        <xsl:variable name="self" select="self::*"/>
        <xsl:variable name="bookmark"
            select="descendant::span[contains(lower-case(@data-bkmark), 'cell')][(ancestor::td[1]) = $self][1]/@data-bkmark"/>
        <xsl:element name="Cell">
            <xsl:attribute name="Self"
                select="concat('ucbie', count(preceding-sibling::*[name() = name(current())]))"/>
            <xsl:variable name="cont"
                select="concat('ucbie', count(preceding-sibling::*[name() = name(current())]))"/>
            <xsl:variable name="rowName">
                <xsl:choose>
                    <xsl:when test="ancestor::td">
                        <xsl:value-of select="(ancestor::td/@J) - @J"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="@J"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:variable name="columnName">
                <xsl:value-of select="@I"/>
            </xsl:variable>
            <xsl:variable name="cellName">
                <xsl:choose>
                    <xsl:when test="ancestor::td">
                        <xsl:value-of select="replace(concat($columnName, ':', $rowName), '-', '')"
                        />
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="concat($columnName, ':', $rowName)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
           <xsl:variable name="cellNumber">
               <xsl:choose>
                   <xsl:when test="string-length($bookmark) > 0">
                       <xsl:value-of select="$bookmark"/>
                   </xsl:when>
                   <xsl:otherwise>
                       <xsl:value-of select="concat('Wchange', $cellName)"/>
                   </xsl:otherwise>
               </xsl:choose>
           </xsl:variable>
            <xsl:if test="@wCellNo">
                <xsl:copy-of select="@wCellNo"/>
            </xsl:if>
            <xsl:attribute name="Name" select="$cellName"/>
            <xsl:if
                test="(lower-case(ancestor::tr[1]/@data-change) = 'rowinserted') or (lower-case(ancestor::tr[1]/@data-tr_added) = 'rowinserted')">
                <xsl:attribute name="rowIns" select="'true'"/>
            </xsl:if>
            <xsl:attribute name="CellNumber" select="$cellNumber"/>
            <xsl:attribute name="ColumnName" select="$columnName"/>
            <xsl:attribute name="RowName" select="$rowName"/>
            <xsl:if test="lower-case(@data-change) = 'cell_added'">
                <xsl:attribute name="Wchange" select="'cell_added'"/>
            </xsl:if>
            <xsl:attribute name="RowSpan">
                <xsl:choose>
                    <xsl:when test="@rowspan">
                        <xsl:value-of select="@rowspan"/>
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
                <xsl:value-of select="'CellStyle/$ID/[None]'"/>
            </xsl:attribute>
            <xsl:variable name="Alig">
                <xsl:if test="@Align">
                    <xsl:variable name="test" select="string(@Align) cast as xs:decimal"/>
                    <xsl:value-of select="$test div 20"/>
                </xsl:if>
            </xsl:variable>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="td/@wCellNo">
        <xsl:copy-of select="."/>
    </xsl:template>
    <xsl:template match="*//span[@class='Main' or matches(@class,'Sub([0-9]+)')]">
        <xsl:if test="self::*[lower-case(@data-change) = 'changestyle']">
            <xsl:element name="FormattingChange">
                <xsl:attribute name="FormattingChange" select="'true'"/>
            </xsl:element>
        </xsl:if>
        <xsl:element name="Change">
            <xsl:if test="@datetime">
                <xsl:attribute name="Date" select="@datetime"/>
            </xsl:if>
            <xsl:attribute name="ChangeType" select="'InsertedText'"/>
            <CharacterStyleRange AppliedCharacterStyle="CharacterStyle/$ID/[No character style]">
           <!-- <xsl:if test="//span[@class='Main' or matches(@class,'Sub([0-9]+)')]">-->
                <xsl:for-each select="self::span[@class='Main' or matches(@class,'Sub([0-9]+)')]">
                <!--Level 1-->
                <xsl:if test="self::span[@class='Main']">
                    <xsl:variable name="index1" select="."/>
                    <xsl:variable name="data-id" select="@data-id"/>
                    <xsl:variable name="data-duplicate" select="@data-duplicate"/>
                    <xsl:variable name="data-PageReferenceType" select="@data-pagereferencetype"/>
                    <xsl:variable name="data-seeallso" select="@data-seeallso"/>
                    <xsl:variable name="data-dummy" select="@data-dummy"/>
                        <xsl:variable name="num">
                        <xsl:value-of select="count(preceding::span[@class = 'Main' or matches(@class, 'Sub([0-9]+)')]) + 1"/>
                    </xsl:variable>  
                    <xsl:if test="not(self::*[@data-dummy = $data-id])">
                        <xsl:element name="PageReference">
                        <xsl:attribute name="Self" select="'di2'"/>
                        <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                            <xsl:attribute name="BookMarkDestination" select="preceding::span[@data-bkmark][1]/concat('UUID_',substring-after(@data-bkmark,'_UUID_'))"/>
                        <xsl:attribute name="Name" select="normalize-space($index1)"/>
                        <xsl:attribute name="ReferencedTopic" select="concat('di2', 'Topicn', $index1)"/>
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
                            <!--<xsl:if test="$data-seeallso = 'true'">
                                <xsl:attribute name="CrossReferenceType">
                                    <xsl:value-of select="'SeeAlso'"/>
                                </xsl:attribute>
                            </xsl:if>-->
                        </xsl:element>
                    </xsl:if>
                    <!--</xsl:if>-->
                        <!-- Level 2 -->
                    
                    <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id,@class)=@data-mark or $data-duplicate=@data-mark or @data-mark = $data-duplicate or concat($data-dummy,@class)=@data-mark]">
                        
                        <xsl:variable name="index2" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id,@class)=@data-mark or $data-duplicate=@data-mark]/current()"/>
                        <xsl:variable name="data-id2" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id,@class)=@data-mark or $data-duplicate=@data-mark]/current()/@data-id"/>
                        <xsl:variable name="data-PageReferenceType2" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id,@class)=@data-mark or $data-duplicate=@data-mark]/current()/@data-pagereferencetype"/>
                        <xsl:variable name="data-duplicate2" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id,@class)=@data-mark or $data-duplicate=@data-mark]/current()/@data-duplicate"/>
                        <xsl:variable name="data-seeallso2" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id,@class)=@data-mark or $data-duplicate=@data-mark]/current()/@data-seeallso"/>
                            <xsl:if test="not(self::*[@data-dummy = $data-id2])">
                                
                            <xsl:element name="PageReference">
                                <xsl:attribute name="Self" select="'di2'"/>
                                <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                <xsl:attribute name="BookMarkDestination" select="preceding::span[@data-bkmark][1]/concat('UUID_',substring-after(@data-bkmark,'_UUID_'))"/>
                                <xsl:attribute name="Name" select="normalize-space($index2)"/>
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
                                <!--<xsl:if test="$data-seeallso2='true'">
                                    <xsl:attribute name="CrossReferenceType">
                                        <xsl:value-of select="'SeeAlso'"/>
                                    </xsl:attribute>
                                </xsl:if>-->
                            </xsl:element>
                                
                            </xsl:if>
                                <!-- Level 3 -->
                        <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id2,@class)=@data-mark or $data-duplicate2=@data-mark]">
                                    
                                   
                            <xsl:variable name="index3" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id2,@class)=@data-mark or $data-duplicate2=@data-mark]/current()"/>
                            <xsl:variable name="data-id3" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id2,@class)=@data-mark or $data-duplicate2=@data-mark]/current()/@data-id"/>
                            <xsl:variable name="data-PageReferenceType3" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id2,@class)=@data-mark or $data-duplicate2=@data-mark]/current()/@data-pagereferencetype"/>
                            <xsl:variable name="data-duplicate3" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id2,@class)=@data-mark or $data-duplicate2=@data-mark]/current()/@data-duplicate"/>
                            <xsl:variable name="data-seeallso3" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id2,@class)=@data-mark or $data-duplicate2=@data-mark]/current()/@data-seeallso"/>
                                    <xsl:if test="not(self::*[@data-dummy = $data-id3])">
                                        
                                    <xsl:element name="PageReference">
                                        <xsl:attribute name="Self" select="'di2'"/>
                                        <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                        <xsl:attribute name="BookMarkDestination" select="preceding::span[@data-bkmark][1]/concat('UUID_',substring-after(@data-bkmark,'_UUID_'))"/>
                                        <xsl:attribute name="Name" select="normalize-space($index3)"/>
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
                                        <!--<xsl:if test="$data-seeallso3='true'">
                                            <xsl:attribute name="CrossReferenceType">
                                                <xsl:value-of select="'SeeAlso'"/>
                                            </xsl:attribute>
                                        </xsl:if>-->
                                    </xsl:element>
                                        
                                    </xsl:if>  
                                        <!-- Level 4 -->
                            <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id3,@class)=@data-mark or $data-duplicate3=@data-mark]">
                                <xsl:variable name="index4" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id3,@class)=@data-mark or $data-duplicate3=@data-mark]/current()"/>
                                <xsl:variable name="data-id4" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id3,@class)=@data-mark or $data-duplicate3=@data-mark]/current()/@data-id"/>
                                <xsl:variable name="data-PageReferenceType4" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id3,@class)=@data-mark or $data-duplicate3=@data-mark]/current()/@data-pagereferencetype"/>
                                <xsl:variable name="data-duplicate4" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id3,@class)=@data-mark or $data-duplicate3=@data-mark]/current()/@data-duplicate"/>
                                <xsl:variable name="data-seeallso4" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id3,@class)=@data-mark or $data-duplicate3=@data-mark]/current()/@data-seeallso"/>
                                            <xsl:if test="not(self::*[@data-dummy])">
                                            <xsl:element name="PageReference">
                                                <xsl:attribute name="Self" select="'di2'"/>
                                                <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                <xsl:attribute name="BookMarkDestination" select="preceding::span[@data-bkmark][1]/concat('UUID_',substring-after(@data-bkmark,'_UUID_'))"/>
                                                <xsl:attribute name="Name" select="normalize-space($index4)"/>
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
                                                <!--<xsl:if test="$data-seeallso4='true'">
                                                    <xsl:attribute name="CrossReferenceType">
                                                        <xsl:value-of select="'SeeAlso'"/>
                                                    </xsl:attribute>
                                                </xsl:if>-->
                                            </xsl:element>
                                            </xsl:if>
                                                <!-- Level 5 -->
                                <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id4,@class)=@data-mark or $data-duplicate4=@data-mark]">
                                    <xsl:variable name="index5" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id4,@class)=@data-mark or $data-duplicate4=@data-mark]/current()"/>
                                    <xsl:variable name="data-id5" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id4,@class)=@data-mark or $data-duplicate4=@data-mark]/current()/@data-id"/>
                                    <xsl:variable name="data-PageReferenceType5" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id4,@class)=@data-mark or $data-duplicate4=@data-mark]/current()/@data-pagereferencetype"/>
                                    <xsl:variable name="data-duplicate5" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id4,@class)=@data-mark or $data-duplicate4=@data-mark]/current()/@data-duplicate"/>
                                    <xsl:variable name="data-seeallso5" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id4,@class)=@data-mark or $data-duplicate4=@data-mark]/current()/@data-seeallso"/>
                                                    <xsl:if test="not(self::*[@data-dummy])">
                                                    <xsl:element name="PageReference">
                                                        <xsl:attribute name="Self" select="'di2'"/>
                                                        <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                        <xsl:attribute name="BookMarkDestination" select="preceding::span[@data-bkmark][1]/concat('UUID_',substring-after(@data-bkmark,'_UUID_'))"/>
                                                        <xsl:attribute name="Name" select="normalize-space($index5)"/>
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
                                                        <!--<xsl:if test="$data-seeallso5='true'">
                                                            <xsl:attribute name="CrossReferenceType">
                                                                <xsl:value-of select="'SeeAlso'"/>
                                                            </xsl:attribute>
                                                        </xsl:if>-->
                                                    </xsl:element>
                                                    </xsl:if>
                                                        
                                                        <!-- Level 6 -->
                                    <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id5,@class)=@data-mark or $data-duplicate5=@data-mark]">
                                        <xsl:variable name="index6" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id5,@class)=@data-mark or $data-duplicate5=@data-mark]/current()"/>
                                        <xsl:variable name="data-id6" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id5,@class)=@data-mark or $data-duplicate5=@data-mark]/current()/@data-id"/>
                                        <xsl:variable name="data-PageReferenceType6" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id5,@class)=@data-mark or $data-duplicate5=@data-mark]/current()/@data-pagereferencetype"/>
                                        <xsl:variable name="data-duplicate6" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id5,@class)=@data-mark or $data-duplicate5=@data-mark]/current()/@data-duplicate"/>
                                        <xsl:variable name="data-seeallso6" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id5,@class)=@data-mark or $data-duplicate5=@data-mark]/current()/@data-seeallso"/>
                                        <xsl:if test="not(self::*[@data-dummy])">
                                                            <xsl:element name="PageReference">
                                                                <xsl:attribute name="Self" select="'di2'"/>
                                                                <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                <xsl:attribute name="BookMarkDestination" select="preceding::span[@data-bkmark][1]/concat('UUID_',substring-after(@data-bkmark,'_UUID_'))"/>
                                                                <xsl:attribute name="Name" select="normalize-space($index6)"/>
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
                                                                <!--<xsl:if test="$data-seeallso6='true'">
                                                                    <xsl:attribute name="CrossReferenceType">
                                                                        <xsl:value-of select="'SeeAlso'"/>
                                                                    </xsl:attribute>
                                                                </xsl:if>-->
                                                            </xsl:element>
                                                            </xsl:if>  
                                                                <!-- Level 7 -->
                                                         <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id6,@class)=@data-mark or $data-duplicate6=@data-mark]">
                                                             <xsl:variable name="index7" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id6,@class)=@data-mark or $data-duplicate6=@data-mark]/current()"/>
                                                             <xsl:variable name="data-id7" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id6,@class)=@data-mark or $data-duplicate6=@data-mark]/current()/@data-id"/>
                                                             <xsl:variable name="data-PageReferenceType7" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id6,@class)=@data-mark or $data-duplicate6=@data-mark]/current()/@data-pagereferencetype"/>
                                                             <xsl:variable name="data-duplicate7" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id6,@class)=@data-mark or $data-duplicate6=@data-mark]/current()/@data-duplicate"/>       
                                                             <xsl:variable name="data-seeallso7" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id6,@class)=@data-mark or $data-duplicate6=@data-mark]/current()/@data-seeallso"/>
                                                             <xsl:if test="not(self::*[@data-dummy])">
                                                                    <xsl:element name="PageReference">
                                                                        <xsl:attribute name="Self" select="'di2'"/>
                                                                        <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                        <xsl:attribute name="BookMarkDestination" select="preceding::span[@data-bkmark][1]/concat('UUID_',substring-after(@data-bkmark,'_UUID_'))"/>
                                                                        <xsl:attribute name="Name" select="normalize-space($index7)"/>
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
                                                                        <!--<xsl:if test="$data-seeallso7='true'">
                                                                            <xsl:attribute name="CrossReferenceType">
                                                                                <xsl:value-of select="'SeeAlso'"/>
                                                                            </xsl:attribute>
                                                                        </xsl:if>-->
                                                                    </xsl:element>  
                                                                    </xsl:if>
                                                                        <!-- Level 8 -->
                                                             <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id7,@class)=@data-mark or $data-duplicate7=@data-mark]">
                                                                 <xsl:variable name="index8" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id7,@class)=@data-mark or $data-duplicate7=@data-mark]/current()"/>
                                                                 <xsl:variable name="data-id8" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id7,@class)=@data-mark or $data-duplicate7=@data-mark]/current()/@data-id"/>
                                                                 <xsl:variable name="data-PageReferenceType8" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id7,@class)=@data-mark or $data-duplicate7=@data-mark]/current()/@data-pagereferencetype"/>
                                                                 <xsl:variable name="data-duplicate8" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id7,@class)=@data-mark or $data-duplicate7=@data-mark]/current()/@data-duplicate"/>          
                                                                 <xsl:variable name="data-seeallso8" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id7,@class)=@data-mark or $data-duplicate7=@data-mark]/current()/@data-seeallso"/>
                                                                 <xsl:if test="not(self::*[@data-dummy])">
                                                                            <xsl:element name="PageReference">
                                                                                <xsl:attribute name="Self" select="'di2'"/>
                                                                                <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                                <xsl:attribute name="BookMarkDestination" select="preceding::span[@data-bkmark][1]/concat('UUID_',substring-after(@data-bkmark,'_UUID_'))"/>
                                                                                <xsl:attribute name="Name" select="normalize-space($index8)"/>
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
                                                                                <!--<xsl:if test="$data-seeallso8='true'">
                                                                                    <xsl:attribute name="CrossReferenceType">
                                                                                        <xsl:value-of select="'SeeAlso'"/>
                                                                                    </xsl:attribute>
                                                                                </xsl:if>-->
                                                                            </xsl:element>
                                                                            </xsl:if>
                                                                                <!-- Level 9 -->
                                                                                
                                                                 <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id8,@class)=@data-mark or $data-duplicate8=@data-mark]">
                                                                     <xsl:variable name="index9" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id8,@class)=@data-mark or $data-duplicate8=@data-mark]/current()"/>
                                                                     <xsl:variable name="data-id9" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id8,@class)=@data-mark or $data-duplicate8=@data-mark]/current()/@data-id"/>
                                                                     <xsl:variable name="data-PageReferenceType9" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id8,@class)=@data-mark or $data-duplicate8=@data-mark]/current()/@data-pagereferencetype"/>
                                                                     <xsl:variable name="data-duplicate9" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id8,@class)=@data-mark or $data-duplicate8=@data-mark]/current()/@data-duplicate"/>              
                                                                     <xsl:variable name="data-seeallso9" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id8,@class)=@data-mark or $data-duplicate8=@data-mark]/current()/@data-seeallso"/>
                                                                     <xsl:if test="not(self::*[@data-dummy])">
                                                                                    <xsl:element name="PageReference">
                                                                                        <xsl:attribute name="Self" select="'di2'"/>
                                                                                        <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                                        <xsl:attribute name="BookMarkDestination" select="preceding::span[@data-bkmark][1]/concat('UUID_',substring-after(@data-bkmark,'_UUID_'))"/>
                                                                                        <xsl:attribute name="Name" select="normalize-space($index9)"/>
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
                                                                                        <!--<xsl:if test="$data-seeallso9='true'">
                                                                                            <xsl:attribute name="CrossReferenceType">
                                                                                                <xsl:value-of select="'SeeAlso'"/>
                                                                                            </xsl:attribute>
                                                                                        </xsl:if>-->
                                                                                    </xsl:element>   
                                                                                    </xsl:if>
                                                                                        <!-- Level 10 -->
                                                                                        
                                                                     <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id9,@class)=@data-mark or $data-duplicate9=@data-mark]">
                                                                         <xsl:variable name="index10" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id9,@class)=@data-mark or $data-duplicate9=@data-mark]/current()"/>
                                                                         <xsl:variable name="data-id10" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id9,@class)=@data-mark or $data-duplicate9=@data-mark]/current()/@data-id"/>
                                                                         <xsl:variable name="data-PageReferenceType10" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id9,@class)=@data-mark or $data-duplicate9=@data-mark]/current()/@data-pagereferencetype"/>
                                                                         <xsl:variable name="data-duplicate10" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id9,@class)=@data-mark or $data-duplicate9=@data-mark]/current()/@data-duplicate"/>                   
                                                                         <xsl:variable name="data-seeallso10" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id9,@class)=@data-mark or $data-duplicate9=@data-mark]/current()/@data-seeallso"/>
                                                                         <xsl:if test="not(self::*[@data-dummy])">
                                                                                            <xsl:element name="PageReference">
                                                                                                <xsl:attribute name="Self" select="'di2'"/>
                                                                                                <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                                                <xsl:attribute name="BookMarkDestination" select="preceding::span[@data-bkmark][1]/concat('UUID_',substring-after(@data-bkmark,'_UUID_'))"/>
                                                                                                <xsl:attribute name="Name" select="normalize-space($index10)"/>
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
                                                                                                <!--<xsl:if test="$data-seeallso10='true'">
                                                                                                    <xsl:attribute name="CrossReferenceType">
                                                                                                        <xsl:value-of select="'SeeAlso'"/>
                                                                                                    </xsl:attribute>
                                                                                                </xsl:if>-->
                                                                                            </xsl:element>
                                                                                            </xsl:if>
                                                                                                <!-- Level 11 -->
                                                                                                
                                                                         <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id10,@class)=@data-mark or $data-duplicate10=@data-mark]">
                                                                             <xsl:variable name="index11" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id10,@class)=@data-mark or $data-duplicate10=@data-mark]/current()"/>
                                                                             <xsl:variable name="data-id11" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id10,@class)=@data-mark or $data-duplicate10=@data-mark]/current()/@data-id"/>
                                                                             <xsl:variable name="data-PageReferenceType11" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id10,@class)=@data-mark or $data-duplicate10=@data-mark]/current()/@data-pagereferencetype"/>
                                                                             <xsl:variable name="data-duplicate11" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id10,@class)=@data-mark or $data-duplicate10=@data-mark]/current()/@data-duplicate"/>                     
                                                                             <xsl:variable name="data-seeallso11" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id10,@class)=@data-mark or $data-duplicate10=@data-mark]/current()/@data-seeallso"/>
                                                                             <xsl:if test="not(self::*[@data-dummy])">
                                                                                                    <xsl:element name="PageReference">
                                                                                                        <xsl:attribute name="Self" select="'di2'"/>
                                                                                                        <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                                                        <xsl:attribute name="BookMarkDestination" select="preceding::span[@data-bkmark][1]/concat('UUID_',substring-after(@data-bkmark,'_UUID_'))"/>
                                                                                                        <xsl:attribute name="Name" select="normalize-space($index11)"/>
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
                                                                                                        <!--<xsl:if test="$data-seeallso11='true'">
                                                                                                            <xsl:attribute name="CrossReferenceType">
                                                                                                                <xsl:value-of select="'SeeAlso'"/>
                                                                                                            </xsl:attribute>
                                                                                                        </xsl:if>-->
                                                                                                    </xsl:element>
                                                                                                    </xsl:if>
                                                                                                        <!-- Level 12 -->
                                                                                                        
                                                                                                         <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id11,@class)=@data-mark or $data-duplicate11=@data-mark]">
                                                                                                             <xsl:variable name="index12" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id11,@class)=@data-mark or $data-duplicate11=@data-mark]/current()"/>
                                                                                                             <xsl:variable name="data-id12" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id11,@class)=@data-mark or $data-duplicate11=@data-mark]/current()/@data-id"/>
                                                                                                             <xsl:variable name="data-PageReferenceType12" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id11,@class)=@data-mark or $data-duplicate11=@data-mark]/current()/@data-pagereferencetype"/>
                                                                                                             <xsl:variable name="data-duplicate12" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id11,@class)=@data-mark or $data-duplicate11=@data-mark]/current()/@data-duplicate"/>
                                                                                                             <xsl:variable name="data-seeallso12" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id11,@class)=@data-mark or $data-duplicate11=@data-mark]/current()/@data-seeallso"/>
                                                                                                             <xsl:if test="not(self::*[@data-dummy])">
                                                                                                            <xsl:element name="PageReference">
                                                                                                                <xsl:attribute name="Self" select="'di2'"/>
                                                                                                                <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                                                                <xsl:attribute name="BookMarkDestination" select="preceding::span[@data-bkmark][1]/concat('UUID_',substring-after(@data-bkmark,'_UUID_'))"/>
                                                                                                                <xsl:attribute name="Name" select="normalize-space($index12)"/>
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
                                                                                                                <!--<xsl:if test="$data-seeallso12='true'">
                                                                                                                    <xsl:attribute name="CrossReferenceType">
                                                                                                                        <xsl:value-of select="'SeeAlso'"/>
                                                                                                                    </xsl:attribute>
                                                                                                                </xsl:if>-->
                                                                                                            </xsl:element> 
                                                                                                            </xsl:if> 
                                                                                                                <!-- Level 13 -->
                                                                                                                
                                                                                                             <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id12,@class)=@data-mark or $data-duplicate12=@data-mark]">
                                                                                                                 <xsl:variable name="index13" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id12,@class)=@data-mark or $data-duplicate12=@data-mark]/current()"/>
                                                                                                                 <xsl:variable name="data-id13" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id12,@class)=@data-mark or $data-duplicate12=@data-mark]/current()/@data-id"/>
                                                                                                                 <xsl:variable name="data-PageReferenceType13" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id12,@class)=@data-mark or $data-duplicate12=@data-mark]/current()/@data-pagereferencetype"/>
                                                                                                                 <xsl:variable name="data-duplicate13" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id12,@class)=@data-mark or $data-duplicate12=@data-mark]/current()/@data-duplicate"/>
                                                                                                                 <xsl:variable name="data-seeallso13" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id12,@class)=@data-mark or $data-duplicate12=@data-mark]/current()/@data-seeallso"/> 
                                                                                                                 <xsl:if test="not(self::*[@data-dummy])">
                                                                                                                    <xsl:element name="PageReference">
                                                                                                                        <xsl:attribute name="Self" select="'di2'"/>
                                                                                                                        <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                                                                        <xsl:attribute name="BookMarkDestination" select="preceding::span[@data-bkmark][1]/concat('UUID_',substring-after(@data-bkmark,'_UUID_'))"/>
                                                                                                                        <xsl:attribute name="Name" select="normalize-space($index13)"/>
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
                                                                                                                        <!--<xsl:if test="$data-seeallso13='true'">
                                                                                                                            <xsl:attribute name="CrossReferenceType">
                                                                                                                                <xsl:value-of select="'SeeAlso'"/>
                                                                                                                            </xsl:attribute>
                                                                                                                        </xsl:if>-->
                                                                                                                    </xsl:element>   
                                                                                                                    </xsl:if>
                                                                                                                        <!-- Level 14 -->
                                                                                                                        
                                                                                                                 <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id13,@class)=@data-mark or $data-duplicate13=@data-mark]">
                                                                                                                     <xsl:variable name="index14" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id13,@class)=@data-mark or $data-duplicate13=@data-mark]/current()"/>
                                                                                                                     <xsl:variable name="data-id14" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id13,@class)=@data-mark or $data-duplicate13=@data-mark]/current()/@data-id"/>
                                                                                                                     <xsl:variable name="data-PageReferenceType14" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id13,@class)=@data-mark or $data-duplicate13=@data-mark]/current()/@data-pagereferencetype"/>
                                                                                                                     <xsl:variable name="data-duplicate14" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id13,@class)=@data-mark or $data-duplicate13=@data-mark]/current()/@data-duplicate"/>
                                                                                                                     <xsl:variable name="data-seeallso14" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id13,@class)=@data-mark or $data-duplicate13=@data-mark]/current()/@data-seeallso"/>
                                                                                                                     <xsl:if test="not(self::*[@data-dummy])">
                                                                                                                            <xsl:element name="PageReference">
                                                                                                                                <xsl:attribute name="Self" select="'di2'"/>
                                                                                                                                <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                                                                                <xsl:attribute name="BookMarkDestination" select="preceding::span[@data-bkmark][1]/concat('UUID_',substring-after(@data-bkmark,'_UUID_'))"/>
                                                                                                                                <xsl:attribute name="Name" select="normalize-space($index14)"/>
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
                                                                                                                                <!--<xsl:if test="$data-seeallso14='true'">
                                                                                                                                    <xsl:attribute name="CrossReferenceType">
                                                                                                                                        <xsl:value-of select="'SeeAlso'"/>
                                                                                                                                    </xsl:attribute>
                                                                                                                                </xsl:if>-->
                                                                                                                            </xsl:element>
                                                                                                                            </xsl:if>
                                                                                                                                <!-- Level 15 -->
                                                                                                                                
                                                                                                                     <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id14,@class)=@data-mark or $data-duplicate14=@data-mark]">
                                                                                                                         <xsl:variable name="index15" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id14,@class)=@data-mark or $data-duplicate14=@data-mark]/current()"/>
                                                                                                                         <xsl:variable name="data-id15" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id14,@class)=@data-mark or $data-duplicate14=@data-mark]/current()/@data-id"/>
                                                                                                                         <xsl:variable name="data-PageReferenceType15" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id14,@class)=@data-mark or $data-duplicate14=@data-mark]/current()/@data-pagereferencetype"/>
                                                                                                                         <xsl:variable name="data-duplicate15" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id14,@class)=@data-mark or $data-duplicate14=@data-mark]/current()/@data-duplicate"/>          
                                                                                                                         <xsl:variable name="data-seeallso15" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id14,@class)=@data-mark or $data-duplicate14=@data-mark]/current()/@data-seeallso"/>
                                                                                                                         <xsl:if test="not(self::*[@data-dummy])">
                                                                                                                                    <xsl:element name="PageReference">
                                                                                                                                        <xsl:attribute name="Self" select="'di2'"/>
                                                                                                                                        <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                                                                                        <xsl:attribute name="BookMarkDestination" select="preceding::span[@data-bkmark][1]/concat('UUID_',substring-after(@data-bkmark,'_UUID_'))"/>
                                                                                                                                        <xsl:attribute name="Name" select="normalize-space($index15)"/>
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
                                                                                                                                        <!--<xsl:if test="$data-seeallso15='true'">
                                                                                                                                            <xsl:attribute name="CrossReferenceType">
                                                                                                                                                <xsl:value-of select="'SeeAlso'"/>
                                                                                                                                            </xsl:attribute>
                                                                                                                                        </xsl:if>-->
                                                                                                                                        <!-- Level 15 -->
                                                                                                                                    </xsl:element>
                                                                                                                             
                                                                                                                                    </xsl:if>
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
                        
                    <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate=@data-mark or concat($data-dummy,@class)=@data-mark]">
                        <xsl:variable name="index2" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate=@data-mark]/current()"/>
                        <xsl:variable name="data-duplicate2" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate=@data-mark]/current()/@data-duplicate"/>
                        <xsl:variable name="data-id2" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)]/current()/@data-id"/>
                        <xsl:variable name="data-PageReferenceType2" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate=@data-mark]/current()/@data-pagereferencetype"/>
                        <xsl:variable name="data-seeallso2" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate=@data-mark]/current()/@data-seeallso"/>
                            <xsl:if test="not(self::*[@data-dummy = $data-id2])">
                                
                            <xsl:element name="PageReference">
                                <xsl:attribute name="Self" select="'di2'"/>
                                <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                <xsl:attribute name="BookMarkDestination" select="preceding::span[@data-bkmark][1]/concat('UUID_',substring-after(@data-bkmark,'_UUID_'))"/>
                                <xsl:attribute name="Name" select="normalize-space($index2)"/>
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
                                <!--<xsl:if test="$data-seeallso2='true'">
                                    <xsl:attribute name="CrossReferenceType">
                                        <xsl:value-of select="'SeeAlso'"/>
                                    </xsl:attribute>
                                </xsl:if>-->
                            </xsl:element>
                            </xsl:if>
                                <!-- Level 3 -->
                        <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate2=@data-mark]">
                                    
                                   
                            <xsl:variable name="index3" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate2=@data-mark]/current()"/>
                            <xsl:variable name="data-duplicate3" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate2=@data-mark]/current()/@data-duplicate"/>
                            <xsl:variable name="data-id3" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)]/current()/@data-id"/>
                            <xsl:variable name="data-PageReferenceType3" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate2=@data-mark]/current()/@data-pagereferencetype"/>
                            <xsl:variable name="data-seeallso3" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate2=@data-mark]/current()/@data-seeallso"/>
                                    <xsl:if test="not(self::*[@data-dummy = $data-id3])">
                                    <xsl:element name="PageReference">
                                        <xsl:attribute name="Self" select="'di2'"/>
                                        <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                        <xsl:attribute name="BookMarkDestination" select="preceding::span[@data-bkmark][1]/concat('UUID_',substring-after(@data-bkmark,'_UUID_'))"/>
                                        <xsl:attribute name="Name" select="normalize-space($index3)"/>
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
                                        <!--<xsl:if test="$data-seeallso3='true'">
                                            <xsl:attribute name="CrossReferenceType">
                                                <xsl:value-of select="'SeeAlso'"/>
                                            </xsl:attribute>
                                        </xsl:if>-->
                                    </xsl:element>
                                    </xsl:if>  
                                        <!-- Level 4 -->
                                        <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate3=@data-mark]">
                                            <xsl:variable name="index4" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate3=@data-mark]/current()"/>
                                            <xsl:variable name="data-duplicate4" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate3=@data-mark]/current()/@data-duplicate"/>
<xsl:variable name="data-id4" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id3,@class)=@data-mark]/current()/@data-id"/>

                                            <xsl:variable name="data-PageReferenceType4" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate3=@data-mark]/current()/@data-pagereferencetype"/>
                                            <xsl:variable name="data-seeallso4" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate3=@data-mark]/current()/@data-seeallso"/>
                                            <xsl:if test="not(self::*[@data-dummy])">
                                            <xsl:element name="PageReference">
                                                <xsl:attribute name="Self" select="'di2'"/>
                                                <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                <xsl:attribute name="BookMarkDestination" select="preceding::span[@data-bkmark][1]/concat('UUID_',substring-after(@data-bkmark,'_UUID_'))"/>
                                                <xsl:attribute name="Name" select="normalize-space($index4)"/>
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
                                                <!--<xsl:if test="$data-seeallso4='true'">
                                                    <xsl:attribute name="CrossReferenceType">
                                                        <xsl:value-of select="'SeeAlso'"/>
                                                    </xsl:attribute>
                                                </xsl:if>-->
                                            </xsl:element>
                                            </xsl:if>
                                                <!-- Level 5 -->
                                                <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate4=@data-mark]">
                                                    <xsl:variable name="index5" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate4=@data-mark]/current()"/>
                                                    <xsl:variable name="data-duplicate5" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate4=@data-mark]/current()/@data-duplicate"/>
<xsl:variable name="data-id5" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id4,@class)=@data-mark]/current()/@data-id"/>
                                                    <xsl:variable name="data-PageReferenceType5" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate4=@data-mark]/current()/@data-pagereferencetype"/>
                                                    <xsl:variable name="data-seeallso5" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate4=@data-mark]/current()/@data-seeallso"/>
                                                    <xsl:if test="not(self::*[@data-dummy])">
                                                    <xsl:element name="PageReference">
                                                        <xsl:attribute name="Self" select="'di2'"/>
                                                        <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                        <xsl:attribute name="BookMarkDestination" select="preceding::span[@data-bkmark][1]/concat('UUID_',substring-after(@data-bkmark,'_UUID_'))"/>
                                                        <xsl:attribute name="Name" select="normalize-space($index5)"/>
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
                                                        <!--<xsl:if test="$data-seeallso5='true'">
                                                            <xsl:attribute name="CrossReferenceType">
                                                                <xsl:value-of select="'SeeAlso'"/>
                                                            </xsl:attribute>
                                                        </xsl:if>-->
                                                    </xsl:element>
                                                    </xsl:if>
                                                        
                                                        <!-- Level 6 -->
                                                        <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate5=@data-mark]">
                                                            <xsl:variable name="index6" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate5=@data-mark]/current()"/>
                                                            <xsl:variable name="data-duplicate6" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate5=@data-mark]/current()/@data-duplicate"/>
<xsl:variable name="data-id6" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id5,@class)=@data-mark]/current()/@data-id"/>
                                                            <xsl:variable name="data-PageReferenceType6" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate5=@data-mark]/current()/@data-pagereferencetype"/>
                                                            <xsl:variable name="data-seeallso6" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate5=@data-mark]/current()/@data-seeallso"/>
                                                            <xsl:if test="not(self::*[@data-dummy])">
                                                            <xsl:element name="PageReference">
                                                                <xsl:attribute name="Self" select="'di2'"/>
                                                                <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                <xsl:attribute name="BookMarkDestination" select="preceding::span[@data-bkmark][1]/concat('UUID_',substring-after(@data-bkmark,'_UUID_'))"/>
                                                                <xsl:attribute name="Name" select="normalize-space($index6)"/>
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
                                                                <!--<xsl:if test="$data-seeallso6='true'">
                                                                    <xsl:attribute name="CrossReferenceType">
                                                                        <xsl:value-of select="'SeeAlso'"/>
                                                                    </xsl:attribute>
                                                                </xsl:if>-->
                                                            </xsl:element>
                                                            </xsl:if>  
                                                                <!-- Level 7 -->
                                                                <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate6=@data-mark]">
                                                                    <xsl:variable name="index7" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate6=@data-mark]/current()"/>
                                                                    <xsl:variable name="data-duplicate7" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate6=@data-mark]/current()/@data-duplicate"/>
<xsl:variable name="data-id7" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id6,@class)=@data-mark]/current()/@data-id"/>
                                                                    <xsl:variable name="data-PageReferenceType7" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate6=@data-mark]/current()/@data-pagereferencetype"/>
                                                                    <xsl:variable name="data-seeallso7" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate6=@data-mark]/current()/@data-seeallso"/>
                                                                    <xsl:if test="not(self::*[@data-dummy])">
                                                                    <xsl:element name="PageReference">
                                                                        <xsl:attribute name="Self" select="'di2'"/>
                                                                        <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                        <xsl:attribute name="BookMarkDestination" select="preceding::span[@data-bkmark][1]/concat('UUID_',substring-after(@data-bkmark,'_UUID_'))"/>
                                                                        <xsl:attribute name="Name" select="normalize-space($index7)"/>
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
                                                                        <!--<xsl:if test="$data-seeallso7='true'">
                                                                            <xsl:attribute name="CrossReferenceType">
                                                                                <xsl:value-of select="'SeeAlso'"/>
                                                                            </xsl:attribute>
                                                                        </xsl:if>-->
                                                                    </xsl:element>  
                                                                    </xsl:if>
                                                                        <!-- Level 8 -->
                                                                        <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate7=@data-mark]">
                                                                            <xsl:variable name="index8" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate7=@data-mark]/current()"/>
                                                                            <xsl:variable name="data-duplicate8" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate7=@data-mark]/current()/@data-duplicate"/>
<xsl:variable name="data-id8" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id7,@class)=@data-mark]/current()/@data-id"/>
                                                                            <xsl:variable name="data-PageReferenceType8" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate7=@data-mark]/current()/@data-pagereferencetype"/>
                                                                            <xsl:variable name="data-seeallso8" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate7=@data-mark]/current()/@data-seeallso"/>
                                                                            <xsl:if test="not(self::*[@data-dummy])">
                                                                            <xsl:element name="PageReference">
                                                                                <xsl:attribute name="Self" select="'di2'"/>
                                                                                <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                                <xsl:attribute name="BookMarkDestination" select="preceding::span[@data-bkmark][1]/concat('UUID_',substring-after(@data-bkmark,'_UUID_'))"/>
                                                                                <xsl:attribute name="Name" select="normalize-space($index8)"/>
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
                                                                                <!--<xsl:if test="$data-seeallso8='true'">
                                                                                    <xsl:attribute name="CrossReferenceType">
                                                                                        <xsl:value-of select="'SeeAlso'"/>
                                                                                    </xsl:attribute>
                                                                                </xsl:if>-->
                                                                            </xsl:element>
                                                                            </xsl:if>
                                                                                <!-- Level 9 -->
                                                                                
                                                                                <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate8=@data-mark]">
                                                                                    <xsl:variable name="index9" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate8=@data-mark]/current()"/>
                                                                                    <xsl:variable name="data-duplicate9" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate8=@data-mark]/current()/@data-duplicate"/>
<xsl:variable name="data-id9" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id8,@class)=@data-mark]/current()/@data-id"/>
                                                                                    <xsl:variable name="data-PageReferenceType9" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate8=@data-mark]/current()/@data-pagereferencetype"/>
                                                                                    <xsl:variable name="data-seeallso9" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate8=@data-mark]/current()/@data-seeallso"/>
                                                                                    <xsl:if test="not(self::*[@data-dummy])">
                                                                                    <xsl:element name="PageReference">
                                                                                        <xsl:attribute name="Self" select="'di2'"/>
                                                                                        <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                                        <xsl:attribute name="BookMarkDestination" select="preceding::span[@data-bkmark][1]/concat('UUID_',substring-after(@data-bkmark,'_UUID_'))"/>
                                                                                        <xsl:attribute name="Name" select="normalize-space($index9)"/>
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
                                                                                        <!--<xsl:if test="$data-seeallso9='true'">
                                                                                            <xsl:attribute name="CrossReferenceType">
                                                                                                <xsl:value-of select="'SeeAlso'"/>
                                                                                            </xsl:attribute>
                                                                                        </xsl:if>-->
                                                                                    </xsl:element>   
                                                                                    </xsl:if>
                                                                                        <!-- Level 10 -->
                                                                                        
                                                                                        <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate9=@data-mark]">
                                                                                            <xsl:variable name="index10" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate9=@data-mark]/current()"/>
                                                                                            <xsl:variable name="data-duplicate10" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate9=@data-mark]/current()/@data-duplicate"/>
<xsl:variable name="data-id10" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id9,@class)=@data-mark]/current()/@data-id"/>
                                                                                            <xsl:variable name="data-PageReferenceType10" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate9=@data-mark]/current()/@data-pagereferencetype"/>
                                                                                            <xsl:variable name="data-seeallso10" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate9=@data-mark]/current()/@data-seeallso"/>
                                                                                            <xsl:if test="not(self::*[@data-dummy])">
                                                                                            <xsl:element name="PageReference">
                                                                                                <xsl:attribute name="Self" select="'di2'"/>
                                                                                                <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                                                <xsl:attribute name="BookMarkDestination" select="preceding::span[@data-bkmark][1]/concat('UUID_',substring-after(@data-bkmark,'_UUID_'))"/>
                                                                                                <xsl:attribute name="Name" select="normalize-space($index10)"/>
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
                                                                                                <!--<xsl:if test="$data-seeallso10='true'">
                                                                                                    <xsl:attribute name="CrossReferenceType">
                                                                                                        <xsl:value-of select="'SeeAlso'"/>
                                                                                                    </xsl:attribute>
                                                                                                </xsl:if>-->
                                                                                            </xsl:element>
                                                                                            </xsl:if>
                                                                                                <!-- Level 11 -->
                                                                                                
                                                                                                <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate10=@data-mark]">
                                                                                                    <xsl:variable name="index11" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate10=@data-mark]/current()"/>
                                                                                                    <xsl:variable name="data-duplicate11" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate10=@data-mark]/current()/@data-duplicate"/>
<xsl:variable name="data-id11" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id10,@class)=@data-mark]/current()/@data-id"/>
                                                                                                    <xsl:variable name="data-PageReferenceType11" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate10=@data-mark]/current()/@data-pagereferencetype"/>
                                                                                                    <xsl:variable name="data-seeallso11" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate10=@data-mark]/current()/@data-seeallso"/>
                                                                                                    <xsl:if test="not(self::*[@data-dummy])">
                                                                                                    <xsl:element name="PageReference">
                                                                                                        <xsl:attribute name="Self" select="'di2'"/>
                                                                                                        <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                                                        <xsl:attribute name="BookMarkDestination" select="preceding::span[@data-bkmark][1]/concat('UUID_',substring-after(@data-bkmark,'_UUID_'))"/>
                                                                                                        <xsl:attribute name="Name" select="normalize-space($index11)"/>
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
                                                                                                        <!--<xsl:if test="$data-seeallso11='true'">
                                                                                                            <xsl:attribute name="CrossReferenceType">
                                                                                                                <xsl:value-of select="'SeeAlso'"/>
                                                                                                            </xsl:attribute>
                                                                                                        </xsl:if>-->
                                                                                                    </xsl:element>
                                                                                                    </xsl:if>
                                                                                                        <!-- Level 12 -->
                                                                                                        
                                                                                                        <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate11=@data-mark]">
                                                                                                            <xsl:variable name="index12" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate11=@data-mark]/current()"/>
                                                                                                            <xsl:variable name="data-duplicate12" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate11=@data-mark]/current()/@data-duplicate"/>
<xsl:variable name="data-id12" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id11,@class)=@data-mark]/current()/@data-id"/>
                                                                                                            <xsl:variable name="data-PageReferenceType12" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate11=@data-mark]/current()/@data-pagereferencetype"/>
                                                                                                            <xsl:variable name="data-seeallso12" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate11=@data-mark]/current()/@data-seeallso"/>
                                                                                                            <xsl:if test="not(self::*[@data-dummy])">
                                                                                                            <xsl:element name="PageReference">
                                                                                                                <xsl:attribute name="Self" select="'di2'"/>
                                                                                                                <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                                                                <xsl:attribute name="BookMarkDestination" select="preceding::span[@data-bkmark][1]/concat('UUID_',substring-after(@data-bkmark,'_UUID_'))"/>
                                                                                                                <xsl:attribute name="Name" select="normalize-space($index12)"/>
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
                                                                                                                <!--<xsl:if test="$data-seeallso12='true'">
                                                                                                                    <xsl:attribute name="CrossReferenceType">
                                                                                                                        <xsl:value-of select="'SeeAlso'"/>
                                                                                                                    </xsl:attribute>
                                                                                                                </xsl:if>-->
                                                                                                            </xsl:element> 
                                                                                                            </xsl:if> 
                                                                                                                <!-- Level 13 -->
                                                                                                                
                                                                                                                <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate12=@data-mark]">
                                                                                                                    <xsl:variable name="index13" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate12=@data-mark]/current()"/>
                                                                                                                    <xsl:variable name="data-duplicate13" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate12=@data-mark]/current()/@data-duplicate"/>
<xsl:variable name="data-id13" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id12,@class)=@data-mark]/current()/@data-id"/>
                                                                                                                    <xsl:variable name="data-PageReferenceType13" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate12=@data-mark]/current()/@data-pagereferencetype"/>
                                                                                                                    <xsl:variable name="data-seeallso13" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate12=@data-mark]/current()/@data-seeallso"/>
                                                                                                                    <xsl:if test="not(self::*[@data-dummy])">
                                                                                                                    <xsl:element name="PageReference">
                                                                                                                        <xsl:attribute name="Self" select="'di2'"/>
                                                                                                                        <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                                                                        <xsl:attribute name="BookMarkDestination" select="preceding::span[@data-bkmark][1]/concat('UUID_',substring-after(@data-bkmark,'_UUID_'))"/>
                                                                                                                        <xsl:attribute name="Name" select="normalize-space($index13)"/>
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
                                                                                                                        <!--<xsl:if test="$data-seeallso13='true'">
                                                                                                                            <xsl:attribute name="CrossReferenceType">
                                                                                                                                <xsl:value-of select="'SeeAlso'"/>
                                                                                                                            </xsl:attribute>
                                                                                                                        </xsl:if>-->
                                                                                                                    </xsl:element>   
                                                                                                                    </xsl:if>
                                                                                                                        <!-- Level 14 -->
                                                                                                                        
                                                                                                                        <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate13=@data-mark]">
                                                                                                                            <xsl:variable name="index14" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate13=@data-mark]/current()"/>
                                                                                                                            <xsl:variable name="data-duplicate14" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate13=@data-mark]/current()/@data-duplicate"/>
<xsl:variable name="data-id14" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id13,@class)=@data-mark]/current()/@data-id"/>
                                                                                                                            <xsl:variable name="data-PageReferenceType14" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate13=@data-mark]/current()/@data-pagereferencetype"/>
                                                                                                                            <xsl:variable name="data-seeallso14" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate13=@data-mark]/current()/@data-seeallso"/>
                                                                                                                            <xsl:if test="not(self::*[@data-dummy])">
                                                                                                                            <xsl:element name="PageReference">
                                                                                                                                <xsl:attribute name="Self" select="'di2'"/>
                                                                                                                                <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                                                                                <xsl:attribute name="BookMarkDestination" select="preceding::span[@data-bkmark][1]/concat('UUID_',substring-after(@data-bkmark,'_UUID_'))"/>
                                                                                                                                <xsl:attribute name="Name" select="normalize-space($index14)"/>
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
                                                                                                                                <!--<xsl:if test="$data-seeallso14='true'">
                                                                                                                                    <xsl:attribute name="CrossReferenceType">
                                                                                                                                        <xsl:value-of select="'SeeAlso'"/>
                                                                                                                                    </xsl:attribute>
                                                                                                                                </xsl:if>-->
                                                                                                                            </xsl:element>
                                                                                                                            </xsl:if>
                                                                                                                                <!-- Level 15 -->
                                                                                                                                
                                                                                                                                <xsl:for-each select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate14=@data-mark]">
                                                                                                                                    <xsl:variable name="index15" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate14=@data-mark]/current()"/>
                                                                                                                                    <xsl:variable name="data-duplicate15" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate14=@data-mark]/current()/@data-duplicate"/>
<xsl:variable name="data-id15" select="//span[matches(@class,'Sub([0-9]+)')][concat($data-id14,@class)=@data-mark]/current()/@data-id"/>
                                                                                                                                    <xsl:variable name="data-PageReferenceType15" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate14=@data-mark]/current()/@data-pagereferencetype"/>
                                                                                                                                    <xsl:variable name="data-seeallso15" select="//span[matches(@class,'Sub([0-9]+)')][not(@data-id)][$data-duplicate14=@data-mark]/current()/@data-seeallso"/>
                                                                                                                                    <xsl:if test="not(self::*[@data-dummy])">
                                                                                                                                    <xsl:element name="PageReference">
                                                                                                                                        <xsl:attribute name="Self" select="'di2'"/>
                                                                                                                                        <xsl:attribute name="PageReferenceType" select="'CurrentPage'"/>
                                                                                                                                        <xsl:attribute name="BookMarkDestination" select="preceding::span[@data-bkmark][1]/concat('UUID_',substring-after(@data-bkmark,'_UUID_'))"/>
                                                                                                                                        <xsl:attribute name="Name" select="normalize-space($index15)"/>
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
                                                                                                                                        <!--<xsl:if test="$data-seeallso15='true'">
                                                                                                                                            <xsl:attribute name="CrossReferenceType">
                                                                                                                                                <xsl:value-of select="'SeeAlso'"/>
                                                                                                                                            </xsl:attribute>
                                                                                                                                        </xsl:if>-->
                                                                                                                                        <!-- Level 15 -->
                                                                                                                                    </xsl:element>
                                                                                                                                    </xsl:if>
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
                
                <!--</xsl:element>-->
            <!--</xsl:if>-->
                </xsl:for-each>
        </CharacterStyleRange>
        </xsl:element>
    </xsl:template>
    <!-- end Cell Table-->
    </xsl:stylesheet>