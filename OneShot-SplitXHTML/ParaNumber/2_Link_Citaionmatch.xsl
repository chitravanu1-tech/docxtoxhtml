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
	<xsl:output method="xml" indent="no"/>
	<!--<xsl:strip-space elements="*"/>-->
	<xsl:param name="PassFileName" select="substring-before(tokenize(base-uri(.), '/')[last()], '.')"/>
	<xsl:variable name="filename">
		<xsl:choose>
			<xsl:when test="$PassFileName = ''">
				<xsl:value-of select="concat(substring-before(tokenize(base-uri(.), '/')[last()], '.'),'.xhtml')"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="concat(substring-before($PassFileName, '.'),'.xhtml')"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="xhtmlfile" select="document($filename)//xhtml:html//xhtml:body"/>
	<!--<xsl:variable name="xhtmlfile" select="document('FOR LAYOUT_3.xhtml')//xhtml:html//xhtml:body"/>-->
	<xsl:variable name="stylecollection" select="document('StylesCollection.xml')"/>
	<xsl:variable name="projectformtitle" select="document('MetadataForm_ANS.xml')"/>
	<xsl:template match="@* | node()">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="html">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:attribute name="{'xml:lang'}"><xsl:value-of select="'en'"/></xsl:attribute>
			<xsl:attribute name="{'xmlns'}"><xsl:value-of select="'http://www.w3.org/1999/xhtml'"/></xsl:attribute>
			<xsl:apply-templates select="node()"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="head">
		<head>
			<xsl:element name="title">
				<xsl:value-of select="$projectformtitle//root/ans_Content/translate(substring-before(substring-after(.,'book_title'),','),'&quot;:','')"/>
			</xsl:element>
			<!--<xsl:text disable-output-escaping="yes">&lt;title&gt;</xsl:text>
			<xsl:value-of select="$projectformtitle//root/ans_Content/translate(substring-before(substring-after(.,'book_title'),','),'&quot;:','')"/>
			<xsl:text disable-output-escaping="yes">&lt;/title&gt;</xsl:text>-->
			<link href="styles/custom.css" rel="stylesheet" type="text/css" />
			<xsl:text disable-output-escaping="yes">&lt;meta charset="utf-8"&gt;</xsl:text>
			<xsl:text disable-output-escaping="yes">&lt;/meta&gt;</xsl:text>
		</head>
	</xsl:template>
	<xsl:template match="//body">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates select="node()"/>
			<xsl:if test="descendant::a[@class='footnotecitation']">
				<xsl:for-each select="descendant::a[@class='footnotecitation']">
				<xsl:variable name="cithref"><xsl:value-of select="self::a[@class='footnotecitation']/substring-after(@href,'#_')"/></xsl:variable>
					
					<xsl:for-each select="$xhtmlfile//xhtml:div[@class='footnotecaption'][@id=$cithref]">
						<xsl:apply-templates select="$xhtmlfile//xhtml:div[@class='footnotecaption'][@id=$cithref]"></xsl:apply-templates>
					</xsl:for-each>
					<!--<xsl:copy-of select="$xhtmlfile//body//div[@class='footnotecaption'][@id=$cithref]/self::div"></xsl:copy-of>-->
					<!--<xsl:copy-of select="$xhtmlfile//xhtml:div[@class='footnotecaption'][@id=$cithref]/self::div"></xsl:copy-of>-->
				</xsl:for-each>
			</xsl:if>
		</xsl:copy>
	</xsl:template>
	<!--<xsl:template match="//p">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:attribute name="rsidR">
				<xsl:value-of select="descendant::span[@data-bkmark][1]/@data-bkmark"/>
			</xsl:attribute>
			<xsl:apply-templates select="node()"/>
		</xsl:copy>
	</xsl:template>-->
	
	<xsl:template match="//p[string-length(.) &gt; 0]">
		<xsl:variable name="dataname"><xsl:value-of select="@data-name"/></xsl:variable>
		<xsl:variable name="dataname1">
			<xsl:value-of select="substring-after(@data-name,'-column-')"/></xsl:variable>
		<xsl:choose>
				<!--<xsl:when test="$stylecollection/stylesList//style[contains(@name,'DZP')][lower-case(@replacement) = lower-case($dataname)][matches(substring-after(@name,'DZP_'),'^ChapterTitle$') or matches(substring-after(@name,'DZP_'),'^SubTitle$') or  matches(substring-after(@name,'DZP_'), '^ChapterNumber$') or matches(substring-after(@name,'DZP_'), '^Book_SubTitle$') or matches(substring-after(@name,'DZP_'), '^FrontMatterHeading$') or matches(substring-after(@name,'DZP_'), '^FB_Half_Title$') or matches(substring-after(@name,'DZP_'), '^FB_Series_Title$') or matches(substring-after(@name,'DZP_'), '^FB_IndexHeading$') or matches(substring-after(@name,'DZP_'), '^PartNumber$') or matches(substring-after(@name,'DZP_'), '^PartTitle$') or matches(substring-after(@name,'DZP_'), '^UnitNumber$') or matches(substring-after(@name,'DZP_'), '^UnitTitle$') or matches(substring-after(@name,'DZP_'), '^SectionNumber$') or matches(substring-after(@name,'DZP_'), '^SectionTitle$') or matches(substring-after(@name,'DZP_'), '^BoxTitle$') or matches(substring-after(@name,'DZP_'), '^BoxNumber$')]">
				<xsl:element name="h1">
					<xsl:attribute name="class"><xsl:value-of select="@class"/></xsl:attribute>
					<xsl:apply-templates select="node() except br"/>
					</xsl:element>
			</xsl:when>-->
			<xsl:when test="$stylecollection/stylesList//style[contains(@name,'DZP')][lower-case(@replacement) = lower-case($dataname) or lower-case(@replacement) = lower-case($dataname1)][matches(substring-after(@name,'DZP_'),'^ChapterTitle$') or  matches(substring-after(@name,'DZP_'),'^SubTitle$') or matches(substring-after(@name,'DZP_'), '^ChapterNumber$') or matches(substring-after(@name,'DZP_'), '^FrontMatterHeading$') or matches(substring-after(@name,'DZP_'), '^FB_Half_Title$') or matches(substring-after(@name,'DZP_'), '^FB_Series_Title$') or matches(substring-after(@name,'DZP_'), '^FB_IndexHeading$') or matches(substring-after(@name,'DZP_'), '^PartNumber$') or matches(substring-after(@name,'DZP_'), '^PartTitle$') or matches(substring-after(@name,'DZP_'), '^UnitNumber$') or matches(substring-after(@name,'DZP_'), '^UnitTitle$') or matches(substring-after(@name,'DZP_'), '^SectionNumber$') or matches(substring-after(@name,'DZP_'), '^SectionTitle$') or matches(substring-after(@name,'DZP_'), '^BoxTitle$') or matches(substring-after(@name,'DZP_'), '^BoxNumber$')]">
				<xsl:choose>
					<xsl:when test="$stylecollection/stylesList//style[contains(@name,'DZP')][lower-case(@replacement) = lower-case($dataname) or lower-case(@replacement) = lower-case($dataname1)][matches(substring-after(@name,'DZP_'),'^ChapterTitle$')]">
						<xsl:element name="h1">
							<xsl:attribute name="class"><xsl:value-of select="@class"/></xsl:attribute>
							<xsl:apply-templates/>
							<xsl:call-template name="subtitle"></xsl:call-template>
						</xsl:element>
					</xsl:when>
					<xsl:otherwise>
						<xsl:element name="h1">
							<xsl:attribute name="class"><xsl:value-of select="@class"/></xsl:attribute>
							<xsl:apply-templates select="node() except br"/>
						</xsl:element>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$stylecollection/stylesList//style[contains(@name,'DZP')][lower-case(@replacement) = lower-case($dataname) or lower-case(@replacement) = lower-case($dataname1)][matches(substring-after(@name,'DZP_'),'^Head1$') or matches(substring-after(@name,'DZP_'),'^ReferencesHeading1$')]">
				<xsl:element name="h2">
					<xsl:attribute name="class"><xsl:value-of select="@class"/></xsl:attribute>
					<xsl:apply-templates></xsl:apply-templates>
				</xsl:element>
			</xsl:when>
			<xsl:when test="$stylecollection/stylesList//style[contains(@name,'DZP')][lower-case(@replacement) = lower-case($dataname) or lower-case(@replacement) = lower-case($dataname1)][matches(substring-after(@name,'DZP_'),'^Head2$')]">
				<xsl:element name="h3">
					<xsl:attribute name="class"><xsl:value-of select="@class"/></xsl:attribute>
					<xsl:apply-templates></xsl:apply-templates>
				</xsl:element>
			</xsl:when>
			<xsl:when test="$stylecollection/stylesList//style[contains(@name,'DZP')][lower-case(@replacement) = lower-case($dataname) or lower-case(@replacement) = lower-case($dataname1)][matches(substring-after(@name,'DZP_'),'^Head3$')]">
				<xsl:element name="h4">
					<xsl:attribute name="class"><xsl:value-of select="@class"/></xsl:attribute>
					<xsl:apply-templates></xsl:apply-templates>
				</xsl:element>
			</xsl:when>
			<xsl:when test="$stylecollection/stylesList//style[contains(@name,'DZP')][lower-case(@replacement) = lower-case($dataname) or lower-case(@replacement) = lower-case($dataname1)][matches(substring-after(@name,'DZP_'),'^Head4$')]">
				<xsl:element name="h5">
					<xsl:attribute name="class"><xsl:value-of select="@class"/></xsl:attribute>
					<xsl:apply-templates></xsl:apply-templates>
				</xsl:element>
			</xsl:when>
			<xsl:when test="$stylecollection/stylesList//style[contains(@name,'DZP')][lower-case(@replacement) = lower-case($dataname) or lower-case(@replacement) = lower-case($dataname1)][matches(substring-after(@name,'DZP_'),'^Caption$') or matches(substring-after(@name,'DZP_'),'^FigureLegend$')]">
				<xsl:element name="figure">
					<xsl:attribute name="id"><!--<xsl:value-of select="self::p/@id"/>-->
					<xsl:choose>
						<xsl:when test="self::p[string-length(@id) &gt; 0]">
							<xsl:value-of select="self::p[string-length(@id) &gt; 0]/@id"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="preceding-sibling::p[string-length(@id) &gt; 0][1]/@id"/>
						</xsl:otherwise>
					</xsl:choose>
					</xsl:attribute>
					<xsl:if test="preceding-sibling::p[img][1]">
						<xsl:apply-templates select="preceding-sibling::p[img][1]/img"></xsl:apply-templates>
					</xsl:if>
					<xsl:element name="figcaption">
					<xsl:apply-templates/>
						
					</xsl:element>
					<xsl:if test="following-sibling::p[contains(lower-case(@data-name),'source')]">
						<xsl:copy-of select="following-sibling::p[contains(lower-case(@data-name),'source')][1]"/>
					</xsl:if>
				</xsl:element>
			</xsl:when>
			<xsl:otherwise>
				<xsl:copy>
					<xsl:apply-templates select="@*"/>
					<xsl:apply-templates select="node()"/>
				</xsl:copy>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="p[img][following-sibling::*[1][self::p[contains(lower-case(@data-name),'caption')or contains(lower-case(@data-name),'legend')]]]"/>
	<xsl:template match="p[contains(lower-case(@data-name),'source')][preceding-sibling::*[1][self::p[contains(lower-case(@data-name),'caption')or contains(lower-case(@data-name),'legend')]]]"/>
	<xsl:template match="//a[@class='footnotecitation']">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates select="node()"/>
		</xsl:copy>
	</xsl:template>
	<!-- ul Merged -->
	<xsl:template match="ul[following-sibling::*[1][self::ul]]">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates select="node()"/>
			<xsl:apply-templates select="self::ul[following-sibling::*[1][self::ul]]/following-sibling::*[1][self::ul]/node()"></xsl:apply-templates>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="ul[preceding-sibling::*[1][self::ul]]"/>
	<!-- End -->
	<xsl:template match="//span[@data-bkmark]"/>
	<xsl:template match="//*[@data-bkmark]"/>
	<!--<xsl:template match="//*[@data-bkmark]/@data-bkmark"/>-->
	<xsl:template match="*[@data-name]/@data-name"/>
	<xsl:template match="*[@Para]/@Para"/>
	<xsl:template match="*[@PageValue]/@PageValue"/>
	<xsl:template match="*[@YValue]/@YValue"/>
	<xsl:template match="*[@ColumnValue]/@ColumnValue"/>
	<xsl:template match="*[@data-split]/@data-split"/>
	<xsl:template match="*[@rsidR]/@rsidR"/>
	<xsl:template match="*[@data-parentStory]/@data-parentStory"/>
	<xsl:template match="//span[contains(lower-case(@class),'url')]">
		<xsl:element name="a">
			<xsl:attribute name="href"><xsl:value-of select="self::span[contains(lower-case(@class),'url')]/replace(.,'&#x200B;','')"/></xsl:attribute>
			<xsl:value-of select="self::span[contains(lower-case(@class),'url')]/replace(.,'&#x200B;','')"/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="//span[contains(lower-case(@class),'hyperlink')]">
		<xsl:element name="a">
			<xsl:attribute name="href"><xsl:value-of select="self::span[contains(lower-case(@class),'hyperlink')]/replace(.,'&#x200B;','')"/></xsl:attribute>
			<xsl:value-of select="self::span[contains(lower-case(@class),'hyperlink')]/replace(.,'&#x200B;','')"/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="//span[contains(lower-case(@class),'website')]">
		<xsl:element name="a">
			<xsl:attribute name="href"><xsl:value-of select="self::span[contains(lower-case(@class),'website')]/replace(.,'&#x200B;','')"/></xsl:attribute>
			<xsl:value-of select="self::span[contains(lower-case(@class),'website')]/replace(.,'&#x200B;','')"/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="//span[contains(lower-case(@class),'doi')]">
		<xsl:element name="a">
			<xsl:attribute name="href"><xsl:value-of select="self::span[contains(lower-case(@class),'doi')]/replace(.,'&#x200B;','')"/></xsl:attribute>
			<xsl:value-of select="self::span[contains(lower-case(@class),'doi')]/replace(.,'&#x200B;','')"/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="//span[@pagesplit='split']"/>
	<xsl:template match="//span[@data-bkmark]"/>
	<xsl:template match="//span[lower-case(@class)='sup' or lower-case(@data-name)='sup']">
		<xsl:text disable-output-escaping="yes">&lt;sup&gt;</xsl:text>
			<xsl:apply-templates/>
		<xsl:text disable-output-escaping="yes">&lt;/sup&gt;</xsl:text>
	</xsl:template>
	<xsl:template match="//span[lower-case(@class)='italic' or lower-case(@data-name)='italic' or contains(lower-case(@style),'italic')]">
		<xsl:text disable-output-escaping="yes">&lt;i&gt;</xsl:text>
			<xsl:apply-templates/>
		<xsl:text disable-output-escaping="yes">&lt;/i&gt;</xsl:text>
	</xsl:template>
	<xsl:template match="//span[lower-case(@class)='bold' or lower-case(@data-name)='bold']">
		<xsl:text disable-output-escaping="yes">&lt;b&gt;</xsl:text>
			<xsl:apply-templates/>
		<xsl:text disable-output-escaping="yes">&lt;/b&gt;</xsl:text>
	</xsl:template>
	<!--<xsl:template match="//ul">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:attribute name="style"><xsl:value-of select="'list-style-type: disc;'"/></xsl:attribute>
			<xsl:apply-templates select="node()"/>
		</xsl:copy>
	</xsl:template>-->
	<xsl:template match="//ol">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:attribute name="type"><xsl:value-of select="'1'"/></xsl:attribute>
			<xsl:apply-templates select="node()"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="p[string-length(.) = 0][not(descendant::img)][not(descendant::Comment)]"/>
	<xsl:template match="p[@class='title' or @class='body' or @class='b-head' or @class='back-cover_start' or @class='c-head'][string-length(.) =0]"/>
	<xsl:template match="//ul/li[@start]/@start"></xsl:template>
	<xsl:template match="//ul/li[not(@type='none')]/@type"></xsl:template>
	<xsl:template match="//ol/li[@start]/@start"></xsl:template>
	<xsl:template match="//ol/li[not(@type='none')]/@type"></xsl:template>
	<xsl:template match="//ul[@start]/@start"></xsl:template>
	<xsl:template match="//ul[not(@type='none')]/@type"></xsl:template>
	<xsl:template match="//ol[@start/string-length(.) = 0]/@start"></xsl:template>
	<xsl:template match="//ol[not(@type='none')]/@type"></xsl:template>
	<xsl:template name="subtitle">
		<xsl:for-each select="//p[contains(lower-case(@class),'subtitle')]">
			<xsl:variable name="dataname"><xsl:value-of select="@data-name"/></xsl:variable>
			<xsl:if test="$stylecollection/stylesList//style[contains(@name,'DZP')][lower-case(@replacement) = lower-case($dataname)][matches(substring-after(@name,'DZP_'),'^SubTitle$')]">
				<xsl:value-of select="': '"/>
				<xsl:value-of select="."/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="//p[contains(lower-case(@class),'subtitle')]"/>
	<xsl:template match="*[contains(lower-case(@class),'last-name') or contains(lower-case(@class),'first-name') or contains(lower-case(@class),'articletitle') or contains(lower-case(@class),'date-format') or contains(lower-case(@class),'volume') or contains(lower-case(@class),'issue') or contains(lower-case(@class),'first-page') or contains(lower-case(@class),'last-page') or contains(lower-case(@class),'publisher') or contains(lower-case(@class),'untag') or contains(lower-case(@class),'accessed_date')]">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="*[contains(lower-case(@class),'lastname') or contains(lower-case(@class),'firstname') or contains(lower-case(@class),'dateformat') or  contains(lower-case(@class),'firstpage') or contains(lower-case(@class),'lastpage') or contains(lower-case(@class),'ref-print-journal') or contains(lower-case(@class),'refprintjournal')]">
		<xsl:apply-templates/>
	</xsl:template>
	<!-- commented for new abbr.xsl on 08-01-2026 -->
	<!--<xsl:template match="//span[lower-case(@class)='abbreviation']">
		<xsl:element name="abbr">
			<xsl:attribute name="title"><xsl:value-of select="preceding-sibling::span[lower-case(@class)='abbreviation-expansion']/."/></xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>-->
	<!-- To Merge the split a[@href] -->
	<xsl:template match="//a[not(@class or @style or @data-alias or @name)][not(preceding-sibling::*[1][self::a])]">
		<xsl:element name="a">
			<xsl:attribute name="href">
				<xsl:for-each select="self::a | following-sibling::a">
					<xsl:if test="position() = 1 or preceding-sibling::*[1][self::a]">
						<xsl:value-of select="@href"/>
					</xsl:if>
				</xsl:for-each>
			</xsl:attribute>
			<xsl:for-each select="self::a | following-sibling::a">
				<xsl:if test="position() = 1 or preceding-sibling::*[1][self::a]">
					<xsl:value-of select="@href"/>
				</xsl:if>
			</xsl:for-each>
		</xsl:element>
	</xsl:template>
	<xsl:template match="//a[not(@class or @style or @data-alias or @name)][preceding-sibling::*[1][self::a]]"/>
</xsl:stylesheet>