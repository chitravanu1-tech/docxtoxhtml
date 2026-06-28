<?xml version="1.0" encoding="UTF-8"?>
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
	<xsl:output method="text" standalone="no"/>
	
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>
	<!--<xsl:template match="text()">
		<xsl:value-of select="." />
	</xsl:template>-->
	
	<xsl:template match="html">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="head"/>
	<xsl:template match="title"/>
	<xsl:template match="body">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="section">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="div">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="p">
		<xsl:value-of select="."/>
		<xsl:text>&#x000A;</xsl:text>
	</xsl:template>
	<xsl:template match="table">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="colgroup"/>
	<xsl:template match="tr">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="td">
		<xsl:value-of select="."/>
		<xsl:text>&#x000A;</xsl:text>
	</xsl:template>
	<xsl:template match="h1">
		<xsl:value-of select="."/>
		<xsl:text>&#x000A;</xsl:text>
	</xsl:template>
	<xsl:template match="h2">
		<xsl:value-of select="."/>
		<xsl:text>&#x000A;</xsl:text>
	</xsl:template>
	<xsl:template match="h3">
		<xsl:value-of select="."/>
		<xsl:text>&#x000A;</xsl:text>
	</xsl:template>
	<xsl:template match="h4">
		<xsl:value-of select="."/>
		<xsl:text>&#x000A;</xsl:text>
	</xsl:template>
	<xsl:template match="h5">
		<xsl:value-of select="."/>
		<xsl:text>&#x000A;</xsl:text>
	</xsl:template>
	<xsl:template match="h6">
		<xsl:value-of select="."/>
		<xsl:text>&#x000A;</xsl:text>
	</xsl:template>
	<xsl:template match="h7">
		<xsl:value-of select="."/>
		<xsl:text>&#x000A;</xsl:text>
	</xsl:template>
	<xsl:template match="hr">
		<xsl:value-of select="."/>
		<xsl:text>&#x000A;</xsl:text>
	</xsl:template>
	<xsl:template match="img">
		<xsl:value-of select="."/>
		<xsl:text>&#x000A;</xsl:text>
	</xsl:template>
	<xsl:template match="ul | ol">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="li">
		<xsl:value-of select="."/>
		<xsl:text>&#x000A;</xsl:text>
	</xsl:template>
</xsl:stylesheet>