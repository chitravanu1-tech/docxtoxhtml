<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cp="http://schemas.openxmlformats.org/package/2006/metadata/core-properties" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:dcmitype="http://purl.org/dc/dcmitype/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:vt="http://schemas.openxmlformats.org/officeDocument/2006/docPropsVTypes" xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" xmlns:w10="urn:schemas-microsoft-com:office:word" xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup" xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" xmlns:pic="http://schemas.openxmlformats.org/drawingml/2006/picture" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" xmlns:mf="http://example.com/mf" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:a14="http://schemas.microsoft.com/office/drawing/2010/main" exclude-result-prefixes="v a14 a wpg pic wp r xs mf cp dc vt mc" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" version="2.0">
    <xsl:output indent="yes"/>
	<xsl:variable name="lipppin" select="document('LWWStyleMapping.xml')"/>
	<xsl:template match="@* | node()">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()"/>
		</xsl:copy>
	</xsl:template>

	<xsl:template match="ParagraphStyleRange">
	<xsl:variable name="parastyle" select="./@AppliedParagraphStyle"/>
	<xsl:variable name="curName" select="substring-after($parastyle,'ParagraphStyle/')"/>
		<xsl:variable name="styleName">
			<xsl:for-each select="$lipppin//Style">
				<xsl:choose>
					<xsl:when test="./@S4C = $curName">
						<xsl:value-of select="./@S4C"></xsl:value-of>
					</xsl:when>
					<xsl:otherwise/>
				</xsl:choose>                
			</xsl:for-each>
		</xsl:variable>
		<xsl:element name="ParagraphStyleRange">
		<xsl:choose>
		<xsl:when test="$styleName = $curName">
			<xsl:attribute name="AppliedParagraphStyle">
				<xsl:value-of select="'ParagraphStyle/'"/>
					<xsl:value-of select="$lipppin//Style[@S4C=$curName]/@LWW"/>
				</xsl:attribute>
		</xsl:when>
		<xsl:otherwise>
			<xsl:attribute name="AppliedParagraphStyle">
					<xsl:value-of select="'ParagraphStyle/'"/>
						<xsl:value-of select="$curName"/>
					</xsl:attribute>
			</xsl:otherwise>
		</xsl:choose> 
		<xsl:apply-templates select="@*"/>
		<xsl:apply-templates/>
			</xsl:element>
	</xsl:template>
	<xsl:template match="CharacterStyleRange">
	<xsl:variable name="parastyle" select="./@AppliedCharacterStyle"/>
	<xsl:variable name="curName" select="substring-after($parastyle,'CharacterStyle/')"/>
		<xsl:variable name="styleName">
			<xsl:for-each select="$lipppin//Style">
				<xsl:choose>
					<xsl:when test="./@S4C = $curName">
						<xsl:value-of select="./@S4C"></xsl:value-of>
					</xsl:when>
					<xsl:otherwise/>
				</xsl:choose>                
			</xsl:for-each>
		</xsl:variable>
		<xsl:element name="CharacterStyleRange">
		<xsl:choose>
		<xsl:when test="$styleName = $curName">
			<xsl:attribute name="AppliedCharacterStyle">
				<xsl:value-of select="'CharacterStyle/'"/>
					<xsl:value-of select="$lipppin//Style[@S4C=$curName]/@LWW"/>
				</xsl:attribute>
		</xsl:when>
		<xsl:otherwise>
			<xsl:attribute name="AppliedCharacterStyle">
					<xsl:value-of select="'CharacterStyle/'"/>
						<xsl:value-of select="$curName"/>
					</xsl:attribute>
			</xsl:otherwise>
		</xsl:choose> 
		<xsl:apply-templates select="@*"/>
		<xsl:apply-templates/>
			</xsl:element>
	</xsl:template>
	<xsl:template match="ParagraphStyleRange/@AppliedParagraphStyle"/>
	<xsl:template match="CharacterStyleRange/@AppliedCharacterStyle"/>
	</xsl:stylesheet>

	
	
