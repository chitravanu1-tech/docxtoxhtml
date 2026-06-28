<!-- Updated using number function  14.12.2017-->
<!--For index Purpose 14.02.2017-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cp="http://schemas.openxmlformats.org/package/2006/metadata/core-properties" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:dcmitype="http://purl.org/dc/dcmitype/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:vt="http://schemas.openxmlformats.org/officeDocument/2006/docPropsVTypes" xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" xmlns:w10="urn:schemas-microsoft-com:office:word" xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup" xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" xmlns:pic="http://schemas.openxmlformats.org/drawingml/2006/picture" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" xmlns:mf="http://example.com/mf" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:a14="http://schemas.microsoft.com/office/drawing/2010/main" exclude-result-prefixes="v a14 a wpg pic wp r xs mf cp dc vt mc" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" version="2.0">
	<xsl:output method="xml"/>
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>
	<!--<xsl:template match="td">
			<!-\- Updated on i Value-\->
			<xsl:variable name="ColumnCount">
			<xsl:variable name="CellCount" select="count(preceding-sibling::td)"/>
			<xsl:variable name="SumOfColSpan">
				<xsl:call-template name="Br">
					<xsl:with-param name="i" select="$CellCount"/>
					<xsl:with-param name="j" select="0"/>
					<xsl:with-param name="to1" select="0"/>
					<xsl:with-param name="step2" select="-1"/>
				</xsl:call-template>
            </xsl:variable>   
			<xsl:value-of select="$SumOfColSpan + $CellCount"/>
			</xsl:variable>
			<!-\-End updated -\->
			<xsl:variable name="IVal" select="@tdposition"/>
			<xsl:copy>
				<xsl:attribute name="I">
				<!-\-<xsl:value-of select="$IVal"/> pls check and confirm-\->
					<xsl:value-of select="$ColumnCount"/>
				</xsl:attribute>
				<xsl:attribute name="J">
					<xsl:value-of select="ancestor::tr/@trposition"/>
				</xsl:attribute>
					<xsl:apply-templates select="@*|node()"/>	
			</xsl:copy>
	</xsl:template>
	<xsl:template match="span[@class='MsoFootnoteReference']">
		<xsl:choose>
			<xsl:when test="ancestor::div">
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:copy>
					<xsl:apply-templates select="@*|node()"/>	
				</xsl:copy>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="span[@class='CommentReference']">
		<xsl:choose>
			<xsl:when test="ancestor::comment">
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:copy>
					<xsl:apply-templates select="@*|node()"/>	
				</xsl:copy>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="Br">
		<xsl:param name="i" as="xs:integer"/>
        <xsl:param name="j" as="xs:integer"/>
        <xsl:param name="to1" as="xs:integer"/>
        <xsl:param name="step2" as="xs:integer"/>
        <xsl:variable name="gridval" as="xs:integer">
			<xsl:choose>
				<xsl:when test="preceding-sibling::*[$i]/@colspan">
					<xsl:value-of  select="(preceding-sibling::*[$i]/@colspan) - 1"/>
				</xsl:when>

				<xsl:otherwise>
					<xsl:value-of select="0"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$i = $to1">
				<xsl:value-of select="number($j)"/>
				<!-\- <xsl:value-of select="($j cast as xs:integer)"/> please check Updated 14.12.2017-\->
			</xsl:when>
		</xsl:choose>
		<xsl:if test="$i+$step2 &gt;= $to1">
			<xsl:call-template name="Br">
				<xsl:with-param name="i" select="$i + $step2" as="xs:integer"/>
				<xsl:with-param name="j" select="$j + $gridval" as="xs:integer"/>
				<xsl:with-param name="to1" select="$to1" as="xs:integer"/>
				<xsl:with-param name="step2" select="$step2" as="xs:integer"/>
            </xsl:call-template>
		</xsl:if>
	</xsl:template>
	
	<!-\-For index Purpose 14.02.2017-\->
	<xsl:template match="//span[@data-fldChar = 'begin']">
		<xsl:text disable-output-escaping="yes">&lt;span data-index="yes"&gt;</xsl:text>
	</xsl:template>
	<xsl:template match="span[@data-instrText]">
			<xsl:value-of select="@data-instrText"/>

	</xsl:template>
	<xsl:template match="//span[@data-fldChar = 'end']">
		<xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
	</xsl:template>
	<xsl:template match="span[@data-name]">
		<xsl:choose>
			<xsl:when test="child::span[@data-instrText]">
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:when test="child::span[@data-fldChar]">
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:copy>
					<xsl:apply-templates select="@*|node()"/>
				</xsl:copy>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>-->
	<!--To Delete the "row_delete" tr and "table_delete" for table and  9-7-2019-->
	<xsl:template match="tr[@class='row_delete' or @data-change='row_delete' and contains(@style,'display: none;')]"/>
	<xsl:template match="table[@class ='table_delete' or @data-change='table_delete' and contains(@style,'display: none;')]"/>
	<xsl:template match="td[@class ='cell-delete' or @data-change='cell_delete' or @data-change='column_deleted' and contains(@style,'display: none;')]"/>
</xsl:stylesheet>