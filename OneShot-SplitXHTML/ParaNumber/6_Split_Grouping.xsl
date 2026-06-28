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
	<xsl:output method="xml"/>
	<xsl:template match="@* | node()">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()"/>
		</xsl:copy>
	</xsl:template>
	<!--<xsl:template match="body">
		<xsl:copy>
			<xsl:text disable-output-escaping="yes">&lt;Split_Page&gt;</xsl:text>
			<xsl:apply-templates/>
			<xsl:text disable-output-escaping="yes">&lt;/Split_Page&gt;</xsl:text>
		</xsl:copy>
		
	</xsl:template>-->
	<!--<xsl:template match="*[span[@pagesplit]]">
		
		<xsl:if test="self::*[descendant::span[@pagesplit]][preceding::*[descendant::span[@pagesplit]]]">
		<xsl:text disable-output-escaping="yes">&lt;/Split_Page&gt;</xsl:text>
		<xsl:text disable-output-escaping="yes">&lt;Split_Page&gt;</xsl:text>
		</xsl:if>
		<xsl:copy>
			<xsl:apply-templates/>
		</xsl:copy>
	</xsl:template>-->
	<xsl:template match="body">
		<xsl:for-each-group select="*[@PageValue]" group-by="@PageValue">
			<xsl:element name="Split_Page">
				<xsl:for-each select="current-group()">
					<xsl:copy>
						<xsl:apply-templates select="@*"/>
						<xsl:apply-templates select="node()"/>
					</xsl:copy>
				</xsl:for-each>
			</xsl:element>
		</xsl:for-each-group>
	</xsl:template>
	<!--<xsl:template match="//div[@class='footnotecaption'][contains(@id,'ftn')]"/>-->
	<!--<xsl:template match="//div[@id='comment_']"/>-->
</xsl:stylesheet>