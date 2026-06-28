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
	xmlns:xhtml="http://www.w3.org/1999/xhtml"
	exclude-result-prefixes="v a14 a wpg pic wp r xs mf cp dc vt mc"
	xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" version="2.0">
	<xsl:output method="xml"/>
	<xsl:template match="@* | node()">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()"/>
		</xsl:copy>
	</xsl:template>
	
	<!--<xsl:template match="style">
		<xsl:copy>
			<xsl:apply-templates/>
			<xsl:text>p, a, span, li{
    white-space:normal !important
    }</xsl:text>
		</xsl:copy>
	</xsl:template>-->
	<!--<xsl:template match="p[not(descendant::span[@data-bkmark])]">
		<xsl:copy>
			<xsl:attribute name="rsidR">
				<xsl:value-of select="following::p[not(@class='emptypara')][1][child::span[@data-bkmark]]/child::span[@data-bkmark][1]/@data-bkmark"/>
			</xsl:attribute>
			<xsl:copy-of select="following::p[not(@class='emptypara')][1][child::span[@data-bkmark]]/child::span[@data-bkmark][1]"></xsl:copy-of>
			<xsl:apply-templates/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="p[descendant::span[@data-bkmark]]">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:attribute name="rsidR">
				<xsl:value-of select="descendant::span[@data-bkmark][1]/@data-bkmark"/>
			</xsl:attribute>
			<xsl:apply-templates select="node()"/>
		</xsl:copy>
	</xsl:template>-->
	<xsl:template match="table[descendant::span[@data-bkmark]]">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:attribute name="rsidR">
				<xsl:value-of select="descendant::tr[1]/td[1]/p[1]/span[contains(@data-bkmark,'_Story_')][1]/@data-bkmark"/>
			</xsl:attribute>
			<xsl:apply-templates select="node()"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="*[self::p|li|self::ol|self::ul|self::div|self::table|self::figure][not(descendant::span[@data-bkmark])]">
		<xsl:copy>
			<xsl:attribute name="rsidR">
				<!--<xsl:value-of select="following::p[not(@class='emptypara')][1][child::span[@data-bkmark]]/child::span[@data-bkmark][1]/@data-bkmark"/>-->
				<xsl:choose>
					<!--<xsl:when test="following::*[not(@class='emptypara')][1][descendant::span[contains(@data-bkmark,'_Story_')]]/descendant::span[@data-bkmark][1]">
						<xsl:value-of select="following::*[not(@class='emptypara')][1][descendant::span[contains(@data-bkmark,'_Story_')]]/descendant::span[@data-bkmark][1]/@data-bkmark"/>
					</xsl:when>-->
					<xsl:when test="following::*[descendant::span[contains(@data-bkmark,'_Story_')]][1]/descendant::span[@data-bkmark][1]">
						<xsl:value-of select="following::*[descendant::span[contains(@data-bkmark,'_Story_')]][1]/descendant::span[@data-bkmark][1]/@data-bkmark"/>
					</xsl:when>
					<xsl:when test="self::*[not(descendant::span[@data-bkmark])][descendant::span[@pagesplit='split']]">
						<xsl:value-of select="self::*[not(descendant::span[@data-bkmark])][descendant::span[@pagesplit='split']][1]/@bkmark"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="preceding::*[not(@class='emptypara')][descendant::span[contains(@data-bkmark,'_Story_')]][1]/descendant::span[@data-bkmark][1]/@data-bkmark"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:copy-of select="following::*[not(@class='emptypara')][1][descendant::span[contains(@data-bkmark,'_Story_')]]/descendant::span[@data-bkmark][1]"></xsl:copy-of>
			<xsl:apply-templates/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="*[self::p|self::li|self::ol|self::ul|self::div|self::table|self::figure][descendant::span[@data-bkmark]]">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:attribute name="rsidR">
				<xsl:value-of select="descendant::span[contains(@data-bkmark,'_Story_')][1]/@data-bkmark"/>
			</xsl:attribute>
			<xsl:apply-templates select="node()"/>
		</xsl:copy>
	</xsl:template>
	</xsl:stylesheet>