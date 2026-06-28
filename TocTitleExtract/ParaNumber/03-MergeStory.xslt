<?xml version="1.0" encoding="UTF-8"?>
<!--<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf" exclude-result-prefixes="xs mf" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" version="2.0">-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf"
    exclude-result-prefixes="xs mf"
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

    <xsl:output method="xml" name="xml" standalone="yes" indent="yes"/>

    <xsl:preserve-space elements="Content"/>
    <xsl:preserve-space elements="*"/>

    <!--<xsl:key name="XMLElementByContent" match="XMLElement" use="@XMLContent"/>-->



    <xsl:variable name="DM" select="document('designmap.xml')"/>

    <xsl:template match="SOURCE">
        <xsl:element name="document">
            <xsl:element name="SOURCE">
            <xsl:apply-templates/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="STORIES/STORY">
        <xsl:variable name="M" select="."/>
        <xsl:apply-templates select="document($M)"/>
    </xsl:template>


    <xsl:template match="idPkg:Story">
        <!--   <xsl:copy-of select="."/>-->
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="HyperlinkTextSource" priority="2">
        <xsl:variable name="self" select="self::HyperlinkTextSource/@Self"/>
        <xsl:variable name="HUD">
            <xsl:variable name="DUK">
                <xsl:for-each select="$DM//Hyperlink">
                    <xsl:if test="./@Source = $self">
                        <xsl:value-of select="./@DestinationUniqueKey"/>
                    </xsl:if>
                </xsl:for-each>
            </xsl:variable>
            <xsl:for-each select="$DM//HyperlinkURLDestination">
                <xsl:if test="./@DestinationUniqueKey = $DUK">
                    <xsl:value-of select="./@DestinationURL"/>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>
        <xsl:copy>
            <xsl:if test="not(string-length($HUD) = 0)">
                <xsl:attribute name="HyperlinkUDestination" select="$HUD"/>
            </xsl:if>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="HyperlinkTextDestination" priority="2">
        <xsl:variable name="self1" select="self::HyperlinkTextDestination/@Self"/>
        <xsl:variable name="HUD1">
           <!-- <xsl:for-each select="$DM//Bookmark">
                <xsl:if test="./@Destination = $self1">
                    <xsl:value-of select="./@Name"/>
                </xsl:if>
            </xsl:for-each>-->
            <xsl:value-of select="@Name"></xsl:value-of>
        </xsl:variable>
        <!--<xsl:variable name="ListLabel">
            <xsl:for-each
                select="$DM//Bookmark[@Destination = $self1]/child::Properties/Label/KeyValuePair">
                <xsl:if test="string-length(@Key) &gt; 0 and string-length(@Value)">
                    <xsl:attribute name="{@Key}" select="@Value"/>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>-->
        <xsl:copy>
            <xsl:if test="not(string-length($HUD1) = 0)">
                <xsl:attribute name="BookMarkDestination">
                    <xsl:value-of select="$HUD1"/>
                </xsl:attribute>
                <xsl:for-each
                    select="$DM//Bookmark[@Destination = $self1]/child::Properties/Label/KeyValuePair">
                    <xsl:if test="string-length(@Key) &gt; 0 and string-length(@Value)">
                        <xsl:attribute name="{@Key}" select="@Value"/>
                    </xsl:if>
                </xsl:for-each>
            </xsl:if>
            <!--  to take the values from the local label properties              -->
                <xsl:for-each
                    select="child::Properties/Label/KeyValuePair">
                    <xsl:if test="string-length(@Key) &gt; 0 and string-length(@Value)">
                        <xsl:attribute name="{@Key}" select="@Value"/>
                    </xsl:if>
                </xsl:for-each>
           

            <xsl:apply-templates select="@*|node()"/>

        </xsl:copy>
    </xsl:template>

    <xsl:template match="CrossReferenceSource">
        <xsl:variable name="self" select="self::CrossReferenceSource/@Self"/>
        <xsl:variable name="DUK">
            <xsl:for-each select="$DM//Hyperlink[@Source =$self]">
                <xsl:value-of select="./@DestinationUniqueKey"/>
            </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="DObj">
            <xsl:variable name="destObj">
                <xsl:for-each select="$DM//Hyperlink[@Source =$self]">
                    <xsl:value-of select="child::Properties/child::Destination"/>
                </xsl:for-each>
            </xsl:variable>
            <xsl:choose>
                <xsl:when test="starts-with($destObj,'ParagraphDestination/')">
                    <xsl:value-of select="replace($destObj,'ParagraphDestination/','')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$destObj"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:variable name="BHLink">
            <xsl:variable name="DObjClean" select="replace($DObj,'[\W\s]','')"/>
            <xsl:variable name="link" select="concat($DObjClean,'_',$DUK)"/>
            <xsl:value-of select="$link"/>
        </xsl:variable>
        <xsl:copy>
            <xsl:if test="$BHLink">
                <xsl:attribute name="BookMarkHLink" select="$BHLink"/>
            </xsl:if>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="ParagraphDestination">
        <xsl:variable name="DUK">
            <xsl:value-of select="@DestinationUniqueKey"/>
        </xsl:variable>
        <xsl:variable name="DObj">
            <xsl:variable name="destObj">
                <xsl:value-of select="@Self"/>
            </xsl:variable>
            <xsl:choose>
                <xsl:when test="starts-with($destObj,'ParagraphDestination/')">
                    <xsl:value-of select="replace($destObj,'ParagraphDestination/','')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$destObj"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="BHLink">
            <xsl:variable name="DObjClean" select="replace($DObj,'[\W\s]','')"/>
            <xsl:variable name="link" select="concat($DObjClean,'_',$DUK)"/>
            <xsl:value-of select="$link"/>
        </xsl:variable>
        <xsl:copy>
            <xsl:if test="$BHLink">
                <xsl:attribute name="BookMarkHLink" select="$BHLink"/>
            </xsl:if>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    <!--Cleaning up the IDML file-->

    <!--  <xsl:template match="XMLElement[not(descendant::ParagraphStyleRange|descendant::CharacterStyleRange|descendant::Rectangle|descendant::TextFrame|descendant::Content|descendant::Table)][generate-id() != generate-id(key('XMLElementByContent',@XMLContent)[1])]">
        <xsl:copy>
            <xsl:apply-templates select="@* except @XMLContent|node()"/>
        </xsl:copy>
    </xsl:template>-->

    <!--Cleaning up the IDML file-->

    <xsl:template match="Cell">
        <xsl:variable name="RowName" select="substring-after(@Name,':')"/>
        <xsl:variable name="ColumnName" select="substring-before(@Name,':')"/>
        <xsl:variable name="SelfCellNumber">
            <xsl:variable name="CellName">
                <xsl:for-each select="descendant::Label/descendant::ListItem[@type ='string']">
                    <xsl:if test="contains(lower-case(.),'cell')">
                        <xsl:value-of select="."/>
                    </xsl:if>
                </xsl:for-each>
            </xsl:variable>
            <xsl:variable name="Cell">
                <xsl:value-of select="substring-after(lower-case($CellName),'cell_')"/>
            </xsl:variable>
            <xsl:variable name="ColumnName">
                <xsl:value-of select="substring-before($Cell,'_')"/>
            </xsl:variable>
            <xsl:variable name="RowName">
                <xsl:value-of select="substring-after($Cell,'_')"/>
            </xsl:variable>
            <xsl:if test="$Cell != ''">
                <!--<xsl:value-of select="concat($ColumnName,':',$RowName)"/>-->
            </xsl:if>
            <xsl:value-of select="$CellName"/>
            <!--<xsl:value-of select="@Name"/>-->
        </xsl:variable>
        <xsl:copy>
            <xsl:attribute name="CellNumber" select="$SelfCellNumber"/>
            <!--<xsl:attribute name="CellNumber"/>-->
            <xsl:attribute name="RowName" select="$RowName"/>
            <xsl:attribute name="ColumnName" select="$ColumnName"/>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="Row">
        <xsl:variable name="RowNumber" select="@Name"/>
        <xsl:copy>
            <xsl:attribute name="RowNumber" select="$RowNumber"/>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="Table">
        <xsl:variable name="TableNumber">
            <xsl:for-each select="descendant::Label/KeyValuePair/@Value">
                <xsl:if test="contains(lower-case(.),'table_')">
                    <xsl:value-of select="."/>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>
        <xsl:copy>
            <xsl:attribute name="TableNumber" select="$TableNumber"/>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>