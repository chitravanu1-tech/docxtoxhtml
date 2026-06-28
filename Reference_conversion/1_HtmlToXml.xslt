<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
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
	xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main"
	xmlns:dt="uuid:C2F41010-65B3-11d1-A29F-00AA00C14882"
	xmlns:pic="http://schemas.openxmlformats.org/drawingml/2006/picture"
	xmlns:a14="http://schemas.microsoft.com/office/drawing/2010/main">
	<xsl:strip-space elements="*"/>
	<xsl:output method="xml" indent="no"></xsl:output>
	<!--<xsl:preserve-space elements="*"/>-->
	<!--<xsl:output indent="no" standalone="yes"/>-->
	<xsl:variable name="style" select="document('StylesCollection.xml')"/>
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="ref">
		<xsl:element name="p">
			<xsl:attribute name="type"><xsl:value-of select="element-citation/@publication-type"/></xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="element-citation">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="person-group">
		<xsl:element name="span">
			<xsl:attribute name="class"><xsl:value-of select="@person-group-type"/></xsl:attribute>
			<xsl:attribute name="data-name"><xsl:value-of select="@person-group-type"/></xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="person-group/name">
		<xsl:element name="span">
			<xsl:apply-templates/>
			</xsl:element>
	</xsl:template>
	<xsl:template match="surname">
		<xsl:variable name="style"><xsl:value-of select="$style//style[@name='DZC_LN']/@replacement"/></xsl:variable>
		<xsl:element name="span">
			<xsl:attribute name="class"><xsl:value-of select="$style"/></xsl:attribute>
			<xsl:attribute name="data-name"><xsl:value-of select="$style"/></xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="given-names">
		<xsl:variable name="style"><xsl:value-of select="$style//style[@name='DZC_FN']/@replacement"/></xsl:variable>
		<xsl:element name="span">
			<xsl:attribute name="class"><xsl:value-of select="$style"/></xsl:attribute>
			<xsl:attribute name="data-name"><xsl:value-of select="$style"/></xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
		<xsl:text disable-output-escaping="yes">, </xsl:text>
	</xsl:template>
	
	<xsl:template match="article-title">
		<xsl:variable name="style"><xsl:value-of select="$style//style[@name='DZC_ArticleTitle']/@replacement"/></xsl:variable>
		<xsl:element name="span">
			<xsl:attribute name="class"><xsl:value-of select="$style"/></xsl:attribute>
			<xsl:attribute name="data-name"><xsl:value-of select="$style"/></xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
		<xsl:text disable-output-escaping="yes">, </xsl:text>
	</xsl:template>
	<xsl:template match="source">
		<xsl:variable name="style"><xsl:value-of select="$style//style[@name='DZC_Journalname']/@replacement"/></xsl:variable>
		<xsl:element name="span">
			<xsl:attribute name="class"><xsl:value-of select="$style"/></xsl:attribute>
			<xsl:attribute name="data-name"><xsl:value-of select="$style"/></xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
		<xsl:text disable-output-escaping="yes">. </xsl:text>
	</xsl:template>
	<xsl:template match="year">
		<xsl:variable name="style"><xsl:value-of select="$style//style[@name='DZC_DateFormat']/@replacement"/></xsl:variable>
		<xsl:element name="span">
			<xsl:attribute name="class"><xsl:value-of select="$style"/></xsl:attribute>
			<xsl:attribute name="data-name"><xsl:value-of select="$style"/></xsl:attribute>
			<xsl:value-of select="'('"/>
			<xsl:apply-templates/>
			<xsl:value-of select="')'"/>
		</xsl:element>
		<xsl:text disable-output-escaping="yes">; </xsl:text>
	</xsl:template>
	<xsl:template match="volume">
		<xsl:variable name="style"><xsl:value-of select="$style//style[@name='DZC_Volume']/@replacement"/></xsl:variable>
		<xsl:element name="span">
			<xsl:attribute name="class"><xsl:value-of select="$style"/></xsl:attribute>
			<xsl:attribute name="data-name"><xsl:value-of select="$style"/></xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
		
	</xsl:template>
	
	<xsl:template match="issue">
		<xsl:text disable-output-escaping="yes">(</xsl:text>
		<xsl:variable name="style"><xsl:value-of select="$style//style[@name='DZC_Issue']/@replacement"/></xsl:variable>
		<xsl:element name="span">
			<xsl:attribute name="class"><xsl:value-of select="$style"/></xsl:attribute>
			<xsl:attribute name="data-name"><xsl:value-of select="$style"/></xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
		<xsl:text disable-output-escaping="yes">)</xsl:text>
		<xsl:text disable-output-escaping="yes">: </xsl:text>
	</xsl:template>
	<xsl:template match="fpage">
		<xsl:variable name="style"><xsl:value-of select="$style//style[@name='DZC_FirstPage']/@replacement"/></xsl:variable>
		<xsl:element name="span">
			<xsl:attribute name="class"><xsl:value-of select="$style"/></xsl:attribute>
			<xsl:attribute name="data-name"><xsl:value-of select="$style"/></xsl:attribute>
			<xsl:apply-templates/>
			<xsl:text disable-output-escaping="yes">. </xsl:text>
		</xsl:element>
	</xsl:template>
	<xsl:template match="doi">
		<xsl:variable name="style"><xsl:value-of select="$style//style[@name='DZC_DOI']/@replacement"/></xsl:variable>
		<xsl:element name="span">
			<xsl:attribute name="class"><xsl:value-of select="$style"/></xsl:attribute>
			<xsl:attribute name="data-name"><xsl:value-of select="$style"/></xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	</xsl:stylesheet>