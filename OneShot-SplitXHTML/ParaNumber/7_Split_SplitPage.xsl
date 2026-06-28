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
	xmlns:xsw="http://coko.foundation/xsweet"
	exclude-result-prefixes="v a14 a wpg pic wp r xs mf cp dc vt mc"
	xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" version="2.0">
	<xsl:output method="xml" indent="no"/>
	<xsl:template match="@* | node()">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="//head"/>
	<xsl:template match="//style"/>
	<xsl:template match="article">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="//Split_Page[string-length(.) &gt;0]">
		<!--<xsl:if test="number(@id)">-->
		<xsl:variable name="outFile"><!--<xsl:value-of select="child::span[@pagesplit='split'][1]/@id"/>--><xsl:value-of select="descendant::*[@PageValue][1]/@PageValue"/></xsl:variable> 
		
		<xsl:result-document href="{concat($outFile,'.xhtml')}" method="xhtml"> 
			<!--<xsl:copy>-->
			<html>
				<xsl:attribute name="{'xmlns'}"><xsl:value-of select="'http://www.w3.org/1999/xhtml'"/></xsl:attribute>
				<head><link href="styles/custom.css" rel="stylesheet" type="text/css" /></head>
				
				<body>
				<xsl:copy-of select="@*"/>
				<xsl:apply-templates/>
				</body>
			</html>
			<!--</xsl:copy>-->
		</xsl:result-document>
		<!--</xsl:if>-->
	</xsl:template>
	<!-- span Merge -->
	<xsl:template match="//p|//ref|//span[not(@data-bkmark or @data-tab='true')]|//li">
		<xsl:copy>
			<xsl:copy-of select="@*"/>
			<xsl:call-template name="collapse-ilk"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template name="collapse-ilk">
		<xsl:param name="among" select="node()"/>
		<xsl:for-each-group select="$among" group-adjacent="xsw:node-signature(.)">
			<xsl:choose>
				<xsl:when test="exists(current-group()/self::span[@data-bkmark or @data-tab='true' or @class='InlineMath'])">
					<xsl:copy-of select="current-group()"/>
				</xsl:when>
				<xsl:when test="exists(current-group()/self::*)">
					<xsl:for-each select="current-group()[self::*][1]">
						<!-- In the element case, splice in an element. -->
						<xsl:copy>
							<xsl:copy-of select="@*"/>
							<xsl:call-template name="collapse-ilk">
								<xsl:with-param name="among" select="current-group()/(node(),self::text())"/>
							</xsl:call-template>
						</xsl:copy>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<xsl:copy-of select="current-group()"/>
				</xsl:otherwise>
			</xsl:choose>
			<!-- Splice in anything not an element. -->
		</xsl:for-each-group>
	</xsl:template>
	<xsl:function name="xsw:node-signature" as="xs:string">
		<xsl:param name="n" as="node()"/>
		<xsl:value-of separator="|">
			<xsl:apply-templates mode="signature" select="$n"/>
		</xsl:value-of>
	</xsl:function>
	<xsl:template mode="signature" match="*">
		<xsl:value-of select="local-name()"/>
		<xsl:for-each select="@*">
			<xsl:sort select="local-name()"/>
			<xsl:if test="position() ne 1"> ::: </xsl:if>
			<xsl:apply-templates mode="#current" select="."/>
		</xsl:for-each>
	</xsl:template>
	<!-- End -->
	<!--<xsl:template match="//span[@data-bkmark]"/>-->
	<xsl:template match="//li[string-length(.)=0][not(descendant::img)][not(descendant::Comment)][not(descendant::span[@pagesplit])]"/>
	<xsl:template match="table[child::tbody/tr[1][td/p[string-length(.) = 0]][not(following-sibling::tr)]]"/>
	<xsl:template match="table//tr[last()][count(td) = 1][td[p[string-length(.) = 0]][not(following-sibling::*[1][self::td])]]"/>
	</xsl:stylesheet>