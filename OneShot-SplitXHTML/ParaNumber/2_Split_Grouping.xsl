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
	<xsl:template match="body">
		<xsl:copy>
			<xsl:apply-templates/>
			</xsl:copy>
	</xsl:template>
	<xsl:template match="//span[@pagesplit][ancestor::p or parent::p or ancestor::li or parent::li][not(ancestor::table)]">
		<xsl:if test="parent::*[string-length(.) &gt; 0][not(self::p or self::li) and ancestor::p[1] or ancestor::li[1]]">
			<xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
			<xsl:value-of select="parent::*[string-length(.) &gt; 0][not(self::p or self::li) and ancestor::p[1] or ancestor::li[1]]/local-name()"/>
			<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
		</xsl:if>
		<xsl:if test="parent::*[not(self::p or self::li)][string-length(.) &gt; 0]/ancestor::*[1][not(self::p or self::li)][string-length(.) &gt; 0][ancestor::p[1]]">
			<xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
			<xsl:value-of select="parent::*[not(self::p or self::li)][string-length(.) &gt; 0]/ancestor::*[1][not(self::p or self::li)][string-length(.) &gt; 0]/local-name()"/>
			<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
		</xsl:if>
		
		<xsl:if test="parent::*[not(self::p or self::li)][string-length(.) &gt; 0]/ancestor::*[2][not(self::p or self::li)][string-length(.) &gt; 0][ancestor::p[1]]">
			<xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
			<xsl:value-of select="parent::*[not(self::p or self::li)][string-length(.) &gt; 0]/ancestor::*[2][not(self::p or self::li)][string-length(.) &gt; 0]/local-name()"/>
			<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
		</xsl:if>
		
		<xsl:if test="parent::*[not(self::p or self::li)][string-length(.) &gt; 0]/ancestor::*[3][not(self::p or self::li)][string-length(.) &gt; 0][ancestor::p[1]]">
			<xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
			<xsl:value-of select="parent::*[not(self::p or self::li)][string-length(.) &gt; 0]/ancestor::*[3][not(self::p or self::li)][string-length(.) &gt; 0]/local-name()"/>
			<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
		</xsl:if>
		<xsl:if test="parent::*[not(self::p or self::li)][string-length(.) &gt; 0]/ancestor::*[4][not(self::p or self::li)][string-length(.) &gt; 0][ancestor::p[1]]">
			<xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
			<xsl:value-of select="parent::*[not(self::p)][string-length(.) &gt; 0]/ancestor::*[4][not(self::p or self::li)][string-length(.) &gt; 0]/local-name()"/>
			<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
		</xsl:if>
		<xsl:if test="parent::*[not(self::p or self::li)][string-length(.) &gt; 0]/ancestor::*[5][not(self::p or self::li)][string-length(.) &gt; 0][ancestor::p[1]]">
			<xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
			<xsl:value-of select="parent::*[not(self::p)][string-length(.) &gt; 0]/ancestor::*[5][not(self::p or self::li)][string-length(.) &gt; 0]/local-name()"/>
			<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
		</xsl:if>
		<xsl:if test="parent::*[not(self::p or self::li)]/ancestor::p[1]">
			<xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
			<xsl:value-of select="'p'"/>
			<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
		</xsl:if>
		<xsl:if test="parent::*[1][self::p][not(self::li)]">
			<xsl:text disable-output-escaping="yes">&lt;/p&gt;</xsl:text>	
		</xsl:if>
		<!-- close li -->
		<xsl:if test="parent::*[1][not(self::p)][self::li]">
			<xsl:text disable-output-escaping="yes">&lt;/li&gt;</xsl:text>	
		</xsl:if>
		<!-- close ol and ul -->
		<xsl:if test="parent::*[1][not(self::p)][self::li]/parent::ol">
			<xsl:text disable-output-escaping="yes">&lt;/ol&gt;</xsl:text>	
		</xsl:if>
		<xsl:if test="parent::*[1][not(self::p)][self::li]/parent::ul">
			<xsl:text disable-output-escaping="yes">&lt;/ul&gt;</xsl:text>
		</xsl:if>
		<!-- div -->
		<xsl:if test="parent::*[1][self::p]/parent::*[1][self::div]">
			<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>	
		</xsl:if>
		<xsl:if test="parent::*[1][self::li]/ancestor::*[self::ol or self::ul]/ancestor::div">
			<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>	
		</xsl:if>
		<!--<xsl:if test="self::span[@pagesplit='split'][preceding::span[@pagesplit='split']]">
		<xsl:text disable-output-escaping="yes">&lt;/Split_Page&gt;</xsl:text>
		<xsl:text disable-output-escaping="yes">&lt;Split_Page&gt;</xsl:text>
		</xsl:if>-->
		<xsl:element name="p">
		<xsl:element name="span">
			<xsl:attribute name="pagesplit"><xsl:value-of select="@pagesplit"/></xsl:attribute>
			<xsl:attribute name="bkmark"><xsl:value-of select="@bkmark"/></xsl:attribute>
			<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			<xsl:attribute name="val"><xsl:value-of select="@val"/></xsl:attribute>
		</xsl:element>
		</xsl:element>
		<!-- div -->
		<xsl:if test="parent::*[1][self::li]/ancestor::*[self::ol or self::ul]/ancestor::div">
			<xsl:text disable-output-escaping="yes">&lt;div</xsl:text>
			<xsl:text disable-output-escaping="yes"> class="</xsl:text>
			<xsl:value-of select="parent::*[1][self::li]/ancestor::*[self::ol or self::ul]/ancestor::div/@class"/>
			<xsl:text disable-output-escaping="yes">" data-name="</xsl:text>
			<xsl:value-of select="parent::*[1][self::li]/ancestor::*[self::ol or self::ul]/ancestor::div/@data-alias"/>
			<xsl:text disable-output-escaping="yes">" id="</xsl:text>
			<xsl:value-of select="parent::*[1][self::li]/ancestor::*[self::ol or self::ul]/ancestor::div/@id"/>
			<xsl:text disable-output-escaping="yes">" xmlid="</xsl:text>
			<xsl:value-of select="parent::*[1][self::li]/ancestor::*[self::ol or self::ul]/ancestor::div/@xmlid"/>
			<xsl:text disable-output-escaping="yes">"</xsl:text>
			<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
		</xsl:if>
		<xsl:if test="parent::*[1][self::p]/parent::*[1][self::div]">
			<xsl:text disable-output-escaping="yes">&lt;div</xsl:text>
			<xsl:text disable-output-escaping="yes"> class="</xsl:text>
			<xsl:value-of select="parent::*[1][self::p]/parent::*[1][self::div]/@class"/>
			<xsl:text disable-output-escaping="yes">" data-name="</xsl:text>
			<xsl:value-of select="parent::*[1][self::p]/parent::*[1][self::div]/@data-alias"/>
			<xsl:text disable-output-escaping="yes">" id="</xsl:text>
			<xsl:value-of select="parent::*[1][self::p]/parent::*[1][self::div]/@id"/>
			<xsl:text disable-output-escaping="yes">" xmlid="</xsl:text>
			<xsl:value-of select="parent::*[1][self::p]/parent::*[1][self::div]/@xmlid"/>
			<xsl:text disable-output-escaping="yes">"</xsl:text>
			<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
		</xsl:if>
		<xsl:if test="parent::*[1][self::p][not(self::li)]">
			<xsl:text disable-output-escaping="yes">&lt;p</xsl:text>
				<xsl:text disable-output-escaping="yes"> class="</xsl:text>
			<xsl:value-of select="parent::*[1][self::p][not(self::li)]/@class"/>
				<xsl:text disable-output-escaping="yes">" data-name="</xsl:text>
			<xsl:value-of select="parent::*[1][self::p][not(self::li)]/@data-name"/>
				<xsl:text disable-output-escaping="yes">"</xsl:text>
			<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
		</xsl:if>
		<!-- ol -->
		<xsl:if test="parent::*[1][not(self::p)][self::li]/parent::ol">
			<xsl:text disable-output-escaping="yes">&lt;ol</xsl:text>
			<xsl:text disable-output-escaping="yes"> class="</xsl:text>
			<xsl:value-of select="parent::*[1][not(self::p)][self::li]/parent::ol/@class"/>
			<xsl:text disable-output-escaping="yes">" data-name="</xsl:text>
			<xsl:value-of select="parent::*[1][not(self::p)][self::li]/parent::ol/@data-name"/>
			<xsl:text disable-output-escaping="yes">" start="</xsl:text>
			<xsl:if test="self::span[@pagesplit][not(preceding-sibling::text())]">
			<xsl:variable name="pos"><!--<xsl:value-of select="parent::*[1][not(self::p)][self::li][parent::ol]/count(preceding-sibling::li)"/>-->
			<xsl:choose>
				<xsl:when test="parent::*[1][not(self::p)][self::li][parent::ol]">
					<xsl:value-of select="parent::*[1][not(self::p)][self::li][parent::ol]/count(preceding-sibling::li)"/>
				</xsl:when>
				<xsl:when test="parent::*[1][not(self::p)][not(self::li)][parent::ol]">
					<xsl:value-of select="ancestor::*[1][not(self::p)][self::li][parent::ol]/count(preceding-sibling::li)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="parent::*[1]/parent::*[1][not(self::p)][self::li][parent::ol]/count(preceding-sibling::li)"/>
				</xsl:otherwise>
			</xsl:choose>
			</xsl:variable>
			<!--<xsl:value-of select="parent::*[1][not(self::p)][self::li]/parent::ol/@start + $pos"/>-->
				<xsl:choose>
					<xsl:when test="parent::*[1][not(self::p)][self::li][parent::ol]">
						<xsl:value-of select="parent::*[1][not(self::p)][self::li]/parent::ol/@start + $pos"/>
					</xsl:when>
					<xsl:when test="parent::*[1][not(self::p)][not(self::li)][parent::ol]">
						<xsl:value-of select="ancestor::*[1][not(self::p)][self::li]/parent::ol/@start + $pos"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="parent::*[1]/parent::*[1][not(self::p)][self::li]/parent::ol/@start + $pos"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
			<xsl:text disable-output-escaping="yes">" type="</xsl:text>
				<xsl:if test="self::span[@pagesplit][not(preceding-sibling::text())]">
					<!--<xsl:value-of select="parent::*[1][not(self::p)][self::li]/parent::ol/@type"/>-->
					<xsl:choose>
						<xsl:when test="parent::*[1][not(self::p)][self::li][parent::ol]">
							<xsl:value-of select="parent::*[1][not(self::p)][self::li]/parent::ol/@type"/>
						</xsl:when>
						<xsl:when test="parent::*[1][not(self::p)][not(self::li)][parent::ol]">
							<xsl:value-of select="ancestor::*[1][not(self::p)][self::li]/parent::ol/@type"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="parent::*[1]/parent::*[1][not(self::p)][self::li]/parent::ol/@type"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:text disable-output-escaping="yes">"</xsl:text>
			<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
		</xsl:if>
		<!-- ul -->
		<xsl:if test="parent::*[1][not(self::p)][self::li]/parent::ul">
			<xsl:text disable-output-escaping="yes">&lt;ul</xsl:text>
			<xsl:text disable-output-escaping="yes"> style="list-style-type: disc"</xsl:text>
			<xsl:text disable-output-escaping="yes"> class="</xsl:text>
			<xsl:value-of select="parent::*[1][not(self::p)][self::li]/parent::ul/@class"/>
			<xsl:text disable-output-escaping="yes">" data-name="</xsl:text>
			<xsl:value-of select="parent::*[1][not(self::p)][self::li]/parent::ul/@data-name"/>
			<xsl:text disable-output-escaping="yes">" start="</xsl:text>
			<xsl:value-of select="parent::*[1][not(self::p)][self::li]/parent::ul/@start"/>
			<xsl:text disable-output-escaping="yes">" type="</xsl:text>
					<xsl:if test="self::span[@pagesplit][not(preceding-sibling::text())]">
						<xsl:value-of select="parent::*[1][not(self::p)][self::li]/parent::ul/@type"/>
					</xsl:if>
			<xsl:text disable-output-escaping="yes">"</xsl:text>
			<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
		</xsl:if>
		<!-- li -->
		<xsl:if test="parent::*[1][not(self::p)][self::li]">
			<xsl:text disable-output-escaping="yes">&lt;li</xsl:text>
			<xsl:text disable-output-escaping="yes"> class="</xsl:text>
			<xsl:value-of select="parent::*[1][not(self::p)][self::li]/@class"/>
			<xsl:text disable-output-escaping="yes">" data-name="</xsl:text>
			<xsl:value-of select="parent::*[1][not(self::p)][self::li]/@data-name"/>
			<xsl:text disable-output-escaping="yes">" type="</xsl:text>
					<xsl:if test="self::span[@pagesplit][preceding-sibling::text()]">
					<xsl:value-of select="'none'"/>
					</xsl:if>
			<xsl:text disable-output-escaping="yes">"</xsl:text>
			<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
		</xsl:if>
		
		<xsl:if test="parent::*[not(self::p)][not(self::li)]/ancestor::*[string-length(.) &gt; 0]">
			<xsl:for-each select="parent::*[string-length(.) &gt; 0]/ancestor::*[string-length(.) &gt; 0][ancestor-or-self::p]/local-name()">
				<xsl:text disable-output-escaping="yes">&lt;</xsl:text>
				<xsl:value-of select="."/>
				<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="parent::*[not(self::p)][not(self::li)][string-length(.) &gt; 0]">
			<xsl:text disable-output-escaping="yes">&lt;</xsl:text>
			<xsl:value-of select="parent::*[not(self::p)][not(self::li)][string-length(.) &gt; 0]/local-name()"/>
			<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
		</xsl:if>
		<xsl:element name="span">
			<xsl:attribute name="data-bkmark"><xsl:value-of select="@bkmark"/></xsl:attribute>
		</xsl:element>
	</xsl:template>
	<xsl:template match="//span[@pagesplit][ancestor::p or parent::p][ancestor::table]">
		<xsl:if test="parent::*[1][string-length(.) &gt; 0][not(self::p) and ancestor::table[1]]">
			<xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
			<xsl:value-of select="parent::*[1][string-length(.) &gt; 0][not(self::p) and ancestor::table[1]]/local-name()"/>
			<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
		</xsl:if>
		<!--<xsl:if test="parent::*[1][string-length(.) &gt; 0][self::p and ancestor::table[1]] or parent::*[1][string-length(.) = 0][self::p and ancestor::table[1][string-length(.) &gt; 0]]">
			<xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
			<xsl:value-of select="'p'"/>
			<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
		</xsl:if>-->
		<xsl:choose>
			<xsl:when test="parent::*[1][string-length(.) &gt; 0][self::p and ancestor::table[1]]">
				<xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
					<xsl:value-of select="'p'"/>
					<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="parent::*[1][string-length(.) = 0][self::p and ancestor::table[1][string-length(.) &gt; 0]]">
					<xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
					<xsl:value-of select="'p'"/>
					<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
		<!--<xsl:if test="parent::*[not(self::table)][string-length(.) &gt; 0]/ancestor::*[1][not(self::table)][string-length(.) &gt; 0][ancestor::table[1]]">
			<xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
			<xsl:value-of select="parent::*[not(self::table)][string-length(.) &gt; 0]/ancestor::*[1][not(self::table)][string-length(.) &gt; 0]/local-name()"/>
			<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
		</xsl:if>
		<xsl:if test="parent::*[not(self::table)][string-length(.) = 0]/ancestor::*[1][not(self::table)][string-length(.) &gt; 0][ancestor::table[1][string-length(.) &gt; 0]]">
			<xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
			<xsl:value-of select="parent::*[not(self::table)][string-length(.) = 0]/ancestor::*[1][not(self::table)][string-length(.) &gt; 0][ancestor::table[1][string-length(.) &gt; 0]]/local-name()"/>
			<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
		</xsl:if>-->
		<xsl:choose>
			<xsl:when test="parent::*[not(self::table)][string-length(.) &gt; 0]/ancestor::*[1][not(self::table)][string-length(.) &gt; 0][ancestor::table[1]]">
					<xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
					<xsl:value-of select="parent::*[not(self::table)][string-length(.) &gt; 0]/ancestor::*[1][not(self::table)][string-length(.) &gt; 0]/local-name()"/>
					<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="parent::*[not(self::table)][string-length(.) = 0]/ancestor::*[1][not(self::table)][string-length(.) &gt; 0][ancestor::table[1][string-length(.) &gt; 0]]">
					<xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
					<xsl:value-of select="parent::*[not(self::table)][string-length(.) = 0]/ancestor::*[1][not(self::table)][string-length(.) &gt; 0][ancestor::table[1][string-length(.) &gt; 0]]/local-name()"/>
					<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
		<!--<xsl:if test="parent::*[not(self::table)][string-length(.) &gt; 0]/ancestor::*[2][not(self::table)][string-length(.) &gt; 0][ancestor::table[1]]">
			<xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
			<xsl:value-of select="parent::*[not(self::table)][string-length(.) &gt; 0]/ancestor::*[2][not(self::table)][string-length(.) &gt; 0]/local-name()"/>
			<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
		</xsl:if>
		<xsl:if test="parent::*[not(self::table)][string-length(.) = 0]/ancestor::*[2][not(self::table)][string-length(.) &gt; 0][ancestor::table[1][string-length(.) &gt; 0]]">
			<xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
			<xsl:value-of select="parent::*[not(self::table)][string-length(.) = 0]/ancestor::*[2][not(self::table)][string-length(.) &gt; 0][ancestor::table[1][string-length(.) &gt; 0]]/local-name()"/>
			<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
		</xsl:if>-->
		<xsl:choose>
			<xsl:when test="parent::*[not(self::table)][string-length(.) &gt; 0]/ancestor::*[2][not(self::table)][string-length(.) &gt; 0][ancestor::table[1]]">
				<xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
					<xsl:value-of select="parent::*[not(self::table)][string-length(.) &gt; 0]/ancestor::*[2][not(self::table)][string-length(.) &gt; 0]/local-name()"/>
					<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="parent::*[not(self::table)][string-length(.) = 0]/ancestor::*[2][not(self::table)][string-length(.) &gt; 0][ancestor::table[1][string-length(.) &gt; 0]]">
					<xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
					<xsl:value-of select="parent::*[not(self::table)][string-length(.) = 0]/ancestor::*[2][not(self::table)][string-length(.) &gt; 0][ancestor::table[1][string-length(.) &gt; 0]]/local-name()"/>
					<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
		<!--<xsl:if test="parent::*[not(self::table)][string-length(.) &gt; 0]/ancestor::*[3][not(self::table)][string-length(.) &gt; 0][ancestor::table[1]]">
			<xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
			<xsl:value-of select="parent::*[not(self::table)][string-length(.) &gt; 0]/ancestor::*[3][not(self::table)][string-length(.) &gt; 0]/local-name()"/>
			<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
		</xsl:if>
		<xsl:if test="parent::*[not(self::table)][string-length(.) = 0]/ancestor::*[3][not(self::table)][string-length(.) &gt; 0][ancestor::table[1]][string-length(.) &gt; 0]">
			<xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
			<xsl:value-of select="parent::*[not(self::table)][string-length(.) = 0]/ancestor::*[3][not(self::table)][string-length(.) &gt; 0][ancestor::table[1]][string-length(.) &gt; 0]/local-name()"/>
			<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
		</xsl:if>-->
		<xsl:choose>
			<xsl:when test="parent::*[not(self::table)][string-length(.) &gt; 0]/ancestor::*[3][not(self::table)][string-length(.) &gt; 0][ancestor::table[1]]">
					<xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
					<xsl:value-of select="parent::*[not(self::table)][string-length(.) &gt; 0]/ancestor::*[3][not(self::table)][string-length(.) &gt; 0]/local-name()"/>
					<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="parent::*[not(self::table)][string-length(.) = 0]/ancestor::*[3][not(self::table)][string-length(.) &gt; 0][ancestor::table[1]][string-length(.) &gt; 0]">
					<xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
					<xsl:value-of select="parent::*[not(self::table)][string-length(.) = 0]/ancestor::*[3][not(self::table)][string-length(.) &gt; 0][ancestor::table[1]][string-length(.) &gt; 0]/local-name()"/>
					<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
		<!--<xsl:if test="parent::*[not(self::table)][string-length(.) &gt; 0]/ancestor::*[4][not(self::table)][string-length(.) &gt; 0][ancestor::table[1]]">
			<xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
			<xsl:value-of select="parent::*[not(self::table)][string-length(.) &gt; 0]/ancestor::*[4][not(self::table)][string-length(.) &gt; 0]/local-name()"/>
			<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
		</xsl:if>
		<xsl:if test="parent::*[not(self::table)][string-length(.) = 0]/ancestor::*[4][not(self::table)][string-length(.) &gt; 0][ancestor::table[1]][string-length(.) &gt; 0]">
			<xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
			<xsl:value-of select="parent::*[not(self::table)][string-length(.) = 0]/ancestor::*[4][not(self::table)][string-length(.) &gt; 0][ancestor::table[1]][string-length(.) &gt; 0]/local-name()"/>
			<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
		</xsl:if>-->
		<xsl:choose>
			<xsl:when test="parent::*[not(self::table)][string-length(.) &gt; 0]/ancestor::*[4][not(self::table)][string-length(.) &gt; 0][ancestor::table[1]]">
					<xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
					<xsl:value-of select="parent::*[not(self::table)][string-length(.) &gt; 0]/ancestor::*[4][not(self::table)][string-length(.) &gt; 0]/local-name()"/>
					<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="parent::*[not(self::table)][string-length(.) = 0]/ancestor::*[4][not(self::table)][string-length(.) &gt; 0][ancestor::table[1]][string-length(.) &gt; 0]">
					<xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
					<xsl:value-of select="parent::*[not(self::table)][string-length(.) = 0]/ancestor::*[4][not(self::table)][string-length(.) &gt; 0][ancestor::table[1]][string-length(.) &gt; 0]/local-name()"/>
					<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
		<!--<xsl:if test="parent::*[not(self::table)][string-length(.) &gt; 0]/ancestor::*[5][not(self::table)][string-length(.) &gt; 0][ancestor::table[1]]">
			<xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
			<xsl:value-of select="parent::*[not(self::table)][string-length(.) &gt; 0]/ancestor::*[5][not(self::table)][string-length(.) &gt; 0]/local-name()"/>
			<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
		</xsl:if>
		<xsl:if test="parent::*[not(self::table)][string-length(.) = 0]/ancestor::*[5][not(self::table)][string-length(.) &gt; 0][ancestor::table[1]][string-length(.) &gt; 0]">
			<xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
			<xsl:value-of select="parent::*[not(self::table)][string-length(.) = 0]/ancestor::*[5][not(self::table)][string-length(.) &gt; 0][ancestor::table[1]][string-length(.) &gt; 0]/local-name()"/>
			<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
		</xsl:if>-->
		<xsl:choose>
			<xsl:when test="parent::*[not(self::table)][string-length(.) &gt; 0]/ancestor::*[5][not(self::table)][string-length(.) &gt; 0][ancestor::table[1]]">
					<xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
					<xsl:value-of select="parent::*[not(self::table)][string-length(.) &gt; 0]/ancestor::*[5][not(self::table)][string-length(.) &gt; 0]/local-name()"/>
					<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="parent::*[not(self::table)][string-length(.) = 0]/ancestor::*[5][not(self::table)][string-length(.) &gt; 0][ancestor::table[1]][string-length(.) &gt; 0]">
					<xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
					<xsl:value-of select="parent::*[not(self::table)][string-length(.) = 0]/ancestor::*[5][not(self::table)][string-length(.) &gt; 0][ancestor::table[1]][string-length(.) &gt; 0]/local-name()"/>
					<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="parent::*[not(self::table)]/ancestor::table[1]">
			<xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
			<xsl:value-of select="'table'"/>
			<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
			</xsl:if>
		<xsl:if test="parent::*[1][self::table]">
			<xsl:text disable-output-escaping="yes">&lt;/table&gt;</xsl:text>
			
		</xsl:if>
		<xsl:element name="p">
		<xsl:element name="span">
			<xsl:attribute name="pagesplit"><xsl:value-of select="@pagesplit"/></xsl:attribute>
			<xsl:attribute name="bkmark"><xsl:value-of select="@bkmark"/></xsl:attribute>
			<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			<xsl:attribute name="val"><xsl:value-of select="@val"/></xsl:attribute>
		</xsl:element>
		</xsl:element>
		<xsl:if test="parent::*[1][self::table]">
			<xsl:text disable-output-escaping="yes">&lt;table&gt;</xsl:text>
			<xsl:apply-templates select="parent::*[1][self::table]/colgroup[1]"></xsl:apply-templates>
		</xsl:if>
		<!--<xsl:if test="parent::*[not(self::table)]/ancestor::*[string-length(.) &gt; 0]">
			<!-\- parent::*[string-length(.) &gt; 0]/ancestor::*[string-length(.) &gt; 0][ancestor-or-self::table]/local-name() -\->
			<xsl:for-each select="parent::*[string-length(.) &gt; 0]/ancestor::*[string-length(.) &gt; 0][ancestor-or-self::table]">
				<xsl:text disable-output-escaping="yes">&lt;</xsl:text>
				<xsl:value-of select="local-name()"/>
				<xsl:if test="self::*[local-name()='table']">
					<xsl:text disable-output-escaping="yes"> border="</xsl:text>
					<xsl:value-of select="self::*[local-name()='table']/@border"/>
					<xsl:text disable-output-escaping="yes">"</xsl:text>
					<xsl:text disable-output-escaping="yes"> cellpadding="</xsl:text>
					<xsl:value-of select="self::*[local-name()='table']/@cellpadding"/>
					<xsl:text disable-output-escaping="yes">"</xsl:text>
				</xsl:if>
				<xsl:if test="self::*[local-name()='td']">
					<xsl:text disable-output-escaping="yes"> colspan="</xsl:text>
					<xsl:value-of select="self::*[local-name()='table']/@colspan"/>
					<xsl:text disable-output-escaping="yes">"</xsl:text>
					<xsl:text disable-output-escaping="yes"> rowspan="</xsl:text>
					<xsl:value-of select="self::*[local-name()='table']/@rowspan"/>
					<xsl:text disable-output-escaping="yes">"</xsl:text>
				</xsl:if>
				<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
				<xsl:if test="local-name()='table'">
					<xsl:apply-templates select="colgroup[1]"></xsl:apply-templates>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="parent::*[not(self::table)]/ancestor::*[ancestor-or-self::table[string-length(.) &gt; 0]]">
			<!-\- parent::*[string-length(.) &gt; 0]/ancestor::*[string-length(.) &gt; 0][ancestor-or-self::table]/local-name() -\->
			<xsl:for-each select="parent::*[not(self::table)]/ancestor::*[ancestor-or-self::table[string-length(.) &gt; 0]]">
				<xsl:text disable-output-escaping="yes">&lt;</xsl:text>
				<xsl:value-of select="local-name()"/>
				<xsl:if test="self::*[local-name()='table']">
					<xsl:text disable-output-escaping="yes"> border="</xsl:text>
					<xsl:value-of select="self::*[local-name()='table']/@border"/>
					<xsl:text disable-output-escaping="yes">"</xsl:text>
					<xsl:text disable-output-escaping="yes"> cellpadding="</xsl:text>
					<xsl:value-of select="self::*[local-name()='table']/@cellpadding"/>
					<xsl:text disable-output-escaping="yes">"</xsl:text>
				</xsl:if>
				<xsl:if test="self::*[local-name()='td']">
					<xsl:text disable-output-escaping="yes"> colspan="</xsl:text>
					<xsl:value-of select="self::*[local-name()='table']/@colspan"/>
					<xsl:text disable-output-escaping="yes">"</xsl:text>
					<xsl:text disable-output-escaping="yes"> rowspan="</xsl:text>
					<xsl:value-of select="self::*[local-name()='table']/@rowspan"/>
					<xsl:text disable-output-escaping="yes">"</xsl:text>
				</xsl:if>
				<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
				<xsl:if test="local-name()='table'">
					<xsl:apply-templates select="colgroup[1]"></xsl:apply-templates>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>-->
		<xsl:choose>
			<xsl:when test="parent::*[not(self::table)]/ancestor::*[string-length(.) &gt; 0] and not(parent::*[not(self::table)]/ancestor::*[ancestor-or-self::table[string-length(.) &gt; 0]])">
					<!-- parent::*[string-length(.) &gt; 0]/ancestor::*[string-length(.) &gt; 0][ancestor-or-self::table]/local-name() -->
					<xsl:for-each select="parent::*[string-length(.) &gt; 0]/ancestor::*[string-length(.) &gt; 0][ancestor-or-self::table]">
						<xsl:text disable-output-escaping="yes">&lt;</xsl:text>
						<xsl:value-of select="local-name()"/>
						<xsl:if test="self::*[local-name()='table']">
							<xsl:text disable-output-escaping="yes"> border="</xsl:text>
							<xsl:value-of select="self::*[local-name()='table']/@border"/>
							<xsl:text disable-output-escaping="yes">"</xsl:text>
							<xsl:text disable-output-escaping="yes"> cellpadding="</xsl:text>
							<xsl:value-of select="self::*[local-name()='table']/@cellpadding"/>
							<xsl:text disable-output-escaping="yes">"</xsl:text>
						</xsl:if>
						<xsl:if test="self::*[local-name()='td']">
							<xsl:text disable-output-escaping="yes"> colspan="</xsl:text>
							<xsl:value-of select="self::*[local-name()='td']/@colspan"/>
							<xsl:text disable-output-escaping="yes">"</xsl:text>
							<xsl:text disable-output-escaping="yes"> rowspan="</xsl:text>
							<xsl:value-of select="self::*[local-name()='td']/@rowspan"/>
							<xsl:text disable-output-escaping="yes">"</xsl:text>
						</xsl:if>
						<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
						<xsl:if test="local-name()='table'">
							<xsl:apply-templates select="colgroup[1]"></xsl:apply-templates>
						</xsl:if>
					</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="parent::*[not(self::table)]/ancestor::*[ancestor-or-self::table[string-length(.) &gt; 0]]">
					<!-- parent::*[string-length(.) &gt; 0]/ancestor::*[string-length(.) &gt; 0][ancestor-or-self::table]/local-name() -->
					<xsl:for-each select="parent::*[not(self::table)]/ancestor::*[ancestor-or-self::table[string-length(.) &gt; 0]]">
						<xsl:text disable-output-escaping="yes">&lt;</xsl:text>
						<xsl:value-of select="local-name()"/>
						<xsl:if test="self::*[local-name()='table']">
							<xsl:text disable-output-escaping="yes"> border="</xsl:text>
							<xsl:value-of select="self::*[local-name()='table']/@border"/>
							<xsl:text disable-output-escaping="yes">"</xsl:text>
							<xsl:text disable-output-escaping="yes"> cellpadding="</xsl:text>
							<xsl:value-of select="self::*[local-name()='table']/@cellpadding"/>
							<xsl:text disable-output-escaping="yes">"</xsl:text>
						</xsl:if>
						<xsl:if test="self::*[local-name()='td']">
							<xsl:text disable-output-escaping="yes"> colspan="</xsl:text>
							<xsl:value-of select="self::*[local-name()='td']/@colspan"/>
							<xsl:text disable-output-escaping="yes">"</xsl:text>
							<xsl:text disable-output-escaping="yes"> rowspan="</xsl:text>
							<xsl:value-of select="self::*[local-name()='td']/@rowspan"/>
							<xsl:text disable-output-escaping="yes">"</xsl:text>
						</xsl:if>
						<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
						<xsl:if test="local-name()='table'">
							<xsl:apply-templates select="colgroup[1]"></xsl:apply-templates>
						</xsl:if>
					</xsl:for-each>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
		<!--<xsl:if test="parent::*[1][self::p][not(self::li)][string-length(.) &gt; 0]">
			<xsl:text disable-output-escaping="yes">&lt;</xsl:text>
			<xsl:value-of select="'p'"/>
			<xsl:text disable-output-escaping="yes"> class="</xsl:text>
			<xsl:value-of select="parent::*[1][self::p][string-length(.) &gt; 0]/@class"/>
			<xsl:text disable-output-escaping="yes">" data-name="</xsl:text>
			<xsl:value-of select="parent::*[1][self::p][string-length(.) &gt; 0]/@data-name"/>
			<xsl:text disable-output-escaping="yes">"</xsl:text>
			<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
			</xsl:if>
		<xsl:if test="parent::*[1][string-length(.) = 0][self::p and ancestor::table[1][string-length(.) &gt; 0]]">
			<xsl:text disable-output-escaping="yes">&lt;</xsl:text>
			<xsl:value-of select="'p'"/>
			<xsl:text disable-output-escaping="yes"> class="</xsl:text>
			<xsl:value-of select="parent::*[1][string-length(.) = 0][self::p and ancestor::table[1][string-length(.) &gt; 0]]/@class"/>
			<xsl:text disable-output-escaping="yes">" data-name="</xsl:text>
			<xsl:value-of select="parent::*[1][string-length(.) = 0][self::p and ancestor::table[1][string-length(.) &gt; 0]]/@data-name"/>
			<xsl:text disable-output-escaping="yes">"</xsl:text>
			<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
		</xsl:if>-->
		<xsl:choose>
			<xsl:when test="parent::*[1][self::p][not(self::li)][string-length(.) &gt; 0]">
					<xsl:text disable-output-escaping="yes">&lt;</xsl:text>
					<xsl:value-of select="'p'"/>
					<xsl:text disable-output-escaping="yes"> class="</xsl:text>
					<xsl:value-of select="parent::*[1][self::p][string-length(.) &gt; 0]/@class"/>
					<xsl:text disable-output-escaping="yes">" data-name="</xsl:text>
					<xsl:value-of select="parent::*[1][self::p][string-length(.) &gt; 0]/@data-name"/>
					<xsl:text disable-output-escaping="yes">"</xsl:text>
					<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="parent::*[1][string-length(.) = 0][self::p and ancestor::table[1][string-length(.) &gt; 0]]">
					<xsl:text disable-output-escaping="yes">&lt;</xsl:text>
					<xsl:value-of select="'p'"/>
					<xsl:text disable-output-escaping="yes"> class="</xsl:text>
					<xsl:value-of select="parent::*[1][string-length(.) = 0][self::p and ancestor::table[1][string-length(.) &gt; 0]]/@class"/>
					<xsl:text disable-output-escaping="yes">" data-name="</xsl:text>
					<xsl:value-of select="parent::*[1][string-length(.) = 0][self::p and ancestor::table[1][string-length(.) &gt; 0]]/@data-name"/>
					<xsl:text disable-output-escaping="yes">"</xsl:text>
					<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="parent::*[1][not(self::p)][not(self::li)][string-length(.) &gt; 0]">
			<xsl:text disable-output-escaping="yes">&lt;</xsl:text>
			<xsl:value-of select="local-name()"/>
			<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
		</xsl:if>
		<xsl:element name="span">
			<xsl:attribute name="data-bkmark"><xsl:value-of select="@bkmark"/></xsl:attribute>
		</xsl:element>
	</xsl:template>
	<xsl:template match="//div[@class='footnotecaption'][contains(@id,'ftn')]"/>
	<xsl:template match="//div[@id='comment_']"/>
	<xsl:template match="//span[@data-comment][child::span[@data-commentimg]]"/>
</xsl:stylesheet>