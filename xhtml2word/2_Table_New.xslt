<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
	<!-- Added to run the old format endnote on 1-11-2021 -->
        <!-- Added "@data-commentgroup=$id" for comment missing on 9-3-2023 -->
        <!-- Added for wkh Azure 12255 -->
	<xsl:output method="xml"/>
	<xsl:variable name="stylecol" select="document('StylesCollection.xml')"/>
	<xsl:variable name="sty" select="document('stylelist.xml')//Stylelist//Stylename"/>
	<xsl:variable name="sty1" select="document('stylelist.xml')//Stylelist//Pstylename"/>
	<xsl:template match="@* | node()">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()"/>
		</xsl:copy>
	</xsl:template>
	
	<xsl:template match="style">
		<xsl:result-document href="design.css" omit-xml-declaration="yes">
			<xsl:apply-templates select="comment()" mode="style"/>
			<xsl:if test="not(child::comment())">
				<!--                <xsl:copy>-->
				<xsl:apply-templates/>
				<!--</xsl:copy>-->
			</xsl:if>
		</xsl:result-document>
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>
	
	
	
	<!--    removing the styles part from the document-->
	<xsl:template match="//comment()"/>
	
	<xsl:template match="comment()" mode="style">
		<xsl:value-of select="."/>
	</xsl:template>
	
	
	<xsl:template match="ol">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:attribute name="listUID">
				<xsl:number level="any"/>
			</xsl:attribute>
			<xsl:apply-templates select="node()"/>
		</xsl:copy>
	</xsl:template>
	<!--<xsl:template match="ol/li">
		<xsl:element name="p">
			<xsl:apply-templates select="@*"/>
			<xsl:attribute name="data-page">
				<xsl:variable name="parentpage" select="parent::ol[@start]/@start"/>
				<xsl:variable name="curr" select="count(preceding-sibling::li[parent::ol = self::li/ancestor::ol])"/>
				<xsl:value-of select="$curr + $parentpage"/>
			</xsl:attribute>
			<xsl:apply-templates select="node()"/>
		</xsl:element>
		</xsl:template>-->
	<xsl:template match="span[@data-bkmark]">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:attribute name="bkmarkID">
				<xsl:number level="any"/>
			</xsl:attribute>
			<xsl:apply-templates select="node()"/>
		</xsl:copy>
	</xsl:template>
	
	<xsl:template match="ul">
		<xsl:variable name="num">
			<xsl:number level="any"/>
		</xsl:variable>
		<xsl:variable name="olCount" select="count(ancestor::body//ol)"/>
		<xsl:variable name="listUid" select="$num + $olCount"/>
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:attribute name="listUID">
				<xsl:value-of select="$listUid"/>
			</xsl:attribute>
			<xsl:apply-templates select="node()"/>
		</xsl:copy>
	</xsl:template>
	<!-- Added "@data-commentgroup=$id" for comment missing on 9-3-2023 -->
	<xsl:template match="*[@data-commentvalue]">
		<xsl:variable name="id" select="@data-commentvalue"/>
		<xsl:variable name="cmtId" select="boolean(preceding::*[@data-commentimg = $id or @data-commentgroup=$id][not(ancestor-or-self::*[@data-change='commentdeleted'])])"/>
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:if test="$cmtId = true()">
				<xsl:attribute name="cmtIdVal" select="true()"></xsl:attribute>
				<xsl:attribute name="cmtId">
					<xsl:number level="any" count="*[@data-commentvalue]"></xsl:number>
				</xsl:attribute>
			</xsl:if>
			<xsl:apply-templates select="node()"/>
		</xsl:copy>
	</xsl:template>
	
	
	<xsl:template match="del[ancestor::ins]"/>

	<!-- Updated on 02/08/2017-->
	<xsl:template match="tbody">
		<xsl:apply-templates select="tr"/>
	</xsl:template>


	<!-- For ur Future reference updated on 02/08/2017-->
	<xsl:template match="tr">
		<xsl:variable name="removetr" select="./@data-change = 'row_delete'"/>
		<tr>
			<xsl:attribute name="trposition" select="position() - 1"/>
			<xsl:attribute name="rowNumber">
				<xsl:number level="single"/>
			</xsl:attribute>
			<xsl:if
				test="(lower-case(@data-change) = 'rowinserted') or (lower-case(@data-tr_added) = 'rowinserted')">
				<xsl:attribute name="data-change" select="'rowinserted'"/>
			</xsl:if>
			<!--<xsl:variable name="tdcolspan" select="count(td/@colspan)"/>
			<xsl:variable name="tdcolspan1" select="sum(child::td/@colspan)"/>
			<xsl:variable name="tdcount" select="count(child::td)"/>
			<xsl:attribute name="tdcount">
				<xsl:value-of select="($tdcount + $tdcolspan1) - $tdcolspan"/>
			</xsl:attribute>-->
			<!--<xsl:copy-of select="@*"/>-->
			<xsl:apply-templates select="td"/>
		</tr>
	</xsl:template>

	<!-- added this condition to remove the exisiting vmerge in the td so that it wont interfer the current logic	-->
	<!-- Removing cells which is not displayed in the xhtml file	-->
	<xsl:template match="td/@vmerge|td[contains(@style,'display:none;')]"/>
	

	<xsl:template match="td">
		<xsl:variable name="removetr" select="ancestor::tr[1]/@data-change = 'row_delete'"/>
		<xsl:variable name="removetd" select="./@data-change = 'cell_delete'"/>
		<td>
			<xsl:attribute name="tdposition" select="position() - 1"/>
			<xsl:attribute name="cellId">
				<xsl:number level="single"/>
			</xsl:attribute>
			<!-- updated on 12.09.2017-->
			<xsl:attribute name="cellNumber">
				<xsl:number level="single"/>
			</xsl:attribute>
			<xsl:if test="@rowspan > 1">
				<xsl:attribute name="vMerge" select="'restart'"/>
			</xsl:if>
			<!-- end updated on 12.09.2017-->
			<!-- updated on 09.08.2017-->
			<xsl:choose>
				<xsl:when test="not(@colspan)">
					<xsl:attribute name="colspan">
						<xsl:value-of select="'1'"/>
					</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="colspan">
						<xsl:value-of select="@colspan"/>
					</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="@rowspan">
				<xsl:variable name="row" select="@rowspan"/>
				<xsl:attribute name="rowspan">
					<xsl:value-of select="$row - 1"/>
					<!--pls check and confirm 13.09.2017-->

				</xsl:attribute>
			</xsl:if>
			<!--</xsl:otherwise>
							</xsl:choose>-->
			<xsl:if test="not($removetr) or not($removetd)">
				<xsl:apply-templates select="@* | node()"/>
			</xsl:if>
		</td>
	</xsl:template>
	
	
	<!-- End Future reference Updated-->
	<xsl:template match="colgroup">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:for-each select="cols">
				<!-- updated on 29.08.2017(cols to col)-->
				<xsl:element name="colspec">
					<xsl:attribute name="colnum" select="position()"/>
					<xsl:attribute name="colname" select="concat('c', position() - 1)"/>
					<!--<xsl:attribute name="SingleColumnWidth" select="@w:w div 20"/>-->
					<xsl:attribute name="SingleColumnWidth" select="@width"/>
				</xsl:element>
			</xsl:for-each>
			<xsl:apply-templates select="node()"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="tbody/span[1]"/>
	<xsl:template match="tgroup/@cols"/>
	<xsl:template match="tgroup">
		<xsl:apply-templates select="@* | node()"/>
	</xsl:template>
	<xsl:template match="//span[@data-change = 'commentdeleted']"/>
	<xsl:template match="//commentreference[@data-change = 'commentdeleted']"/>
	<xsl:template match="//commentreference/comment[@data-change = 'commentdeleted']"/>
	<!-- Added to run the old format endnote on 1-11-2021 -->
	<xsl:template match="a[not(contains(@class,'endnotecitation'))][starts-with(@id, 'eref') or starts-with(@name, 'eref')]">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:attribute name="class" select="'endnotecitation'"/>
			<xsl:apply-templates select="node()"/>
		</xsl:copy>
	</xsl:template>
        <!-- Added to avoid the comment mising by p inside of comment mayo on 18-4-2023 -->
	<xsl:template match="//commentreference/comment[not(child::p)]">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:element name="p">
				<xsl:apply-templates/>
			</xsl:element>
		</xsl:copy>
	</xsl:template>
	<!-- Added for wkh Azure 12255 -->
	<!--<xsl:template match="p">
		<xsl:variable name="dataname" select="normalize-space(@data-name)"/>
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
				<xsl:if test="$stylecol//stylesList//style[normalize-space(@replacement) = $dataname][@tag='true']">
					<xsl:text>&lt;</xsl:text><xsl:value-of select="@data-name"/><xsl:text>&gt;</xsl:text>
				</xsl:if>
			<xsl:apply-templates select="node()"/>
		</xsl:copy>
	</xsl:template>-->
	<!-- removed unwanted style(our introduced) in word  on 24-9-2024-->
	<!--<xsl:template match="//span[@data-name]/@data-name">
		<xsl:variable name="dataname">
			<xsl:value-of select="."/>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$stylecol//stylesList//style[normalize-space(@replacement) = $dataname][substring-after(@name,'DZC_')=$sty]"></xsl:when>
			<xsl:when test="$dataname='‡BibXref' or $dataname='‡AllCaps' or $dataname='‡Math' or $dataname='‡ManualList' or $dataname='‡LN' or $dataname='‡FN' or $dataname='‡DateFormat' or $dataname='‡BulletManualBodyList'"></xsl:when>
			<xsl:otherwise>
				<xsl:copy>
					<xsl:apply-templates/>
				</xsl:copy>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>-->
	<xsl:template match="//span[@data-name]/@data-name| //span[@class]/@class">
		<xsl:variable name="dataname">
			<xsl:value-of select="normalize-space(.)"/>
		</xsl:variable>
		<xsl:choose>
			<!-- Added to remove the stylelist styles  directly 12-12-2024 -->
			<!--<xsl:when test="$sty=$dataname"></xsl:when>-->
			<xsl:when test="$dataname='Correspondingauthor_Indicator' or $dataname='Currentaddress_Indicator' or $dataname='Deceasedauthor_Indicator' or $dataname='Equalauthorship_Indicator' or $dataname='Equalcontribution_Indicator' or $dataname='Groupauthorship_Collab_Indicator'">
				<xsl:attribute name="{name()}">
					<xsl:value-of select="'‡AffXref_online'"/>
				</xsl:attribute>
			</xsl:when>
			<xsl:when test="$dataname='DA_Correspondingauthor_Indicator' or $dataname='DA_Currentaddress_Indicator' or $dataname='DA_Deceasedauthor_Indicator' or $dataname='DA_Equalauthorship_Indicator' or $dataname='DA_Equalcontribution_Indicator' or $dataname='DA_Groupauthorship_Collab_Indicator'">
				<xsl:attribute name="{name()}">
					<xsl:value-of select="'‡AffXref'"/>
				</xsl:attribute>
			</xsl:when>
			<xsl:when test="$sty=$dataname"></xsl:when>
			<xsl:when test="$dataname='‡BibXref' or $dataname='‡AllCaps' or $dataname='‡Math' or $dataname='‡ManualList' or $dataname='‡LN' or $dataname='‡FN' or $dataname='‡DateFormat' or $dataname='‡BulletManualBodyList'"></xsl:when>
			<xsl:otherwise>
				<xsl:copy>
					<xsl:apply-templates/>
				</xsl:copy>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- Paragraph style removed on 20-12-2024 -->
	<xsl:template match="//p[@data-name]/@data-name| //p[@class]/@class">
		<xsl:variable name="dataname">
			<xsl:value-of select="normalize-space(.)"/>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$sty1=$dataname"></xsl:when>
			<xsl:otherwise>
				<xsl:copy>
					<xsl:apply-templates/>
				</xsl:copy>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- end -->
	<xsl:template match="p[@class='emptypara'][string-length(.)=0][not(descendant::img)][not(descendant::Comment)][not(descendant::math)][not(parent::td)]"/>
	<!-- td inside p class style retain on 24-02-2025 -->
	<xsl:template match="p[@class='emptypara'][string-length(.)=0][not(descendant::img)][not(descendant::Comment)][not(descendant::math)][parent::td]/@class">
		<xsl:attribute name="class">
			<xsl:value-of select="parent::p[@data-name][1]/@data-name"/>
		</xsl:attribute>
	</xsl:template>
	<!-- End -->
	<xsl:template match="ul/@start"/>
	<xsl:template match="ul//li/@start"/>
        <xsl:template match="//comment[not(descendant::p)]">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:element name="p"><xsl:apply-templates/></xsl:element>
		</xsl:copy>
	</xsl:template>
	<!-- Ng update -->
	<!--<xsl:template match="//del"/>
	<xsl:template match="//ins">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="p[descendant::span[@class='msoDel']]//span[@class='msoDel']/ins">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="p[descendant::span[@class='msoDel']]//span[@class='msoDel'][not(descendant::ins)]"/>
	<xsl:template match="p[descendant::span[@class='msoIns']]//span[@class='msoIns']">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="p[descendant::span[@class='msoIns']]//span[@class='msoIns']/ins">
		<xsl:apply-templates/>
	</xsl:template>
	
	
	
	<xsl:template match="//div[@data-type='textbox']">
		<xsl:apply-templates/>
	</xsl:template>
	<!-\- content control -\->
	<xsl:template match="//a[@data-alias]">
		<xsl:apply-templates/>
	</xsl:template>-->
	<xsl:template match="figure[not(descendant::table)]">
		<xsl:if test="self::figure/figcaption[not(descendant::p)]">
		<xsl:element name="p">
			<xsl:attribute name="class"><xsl:value-of select="descendant::figcaption/@class"/></xsl:attribute>
			<xsl:attribute name="data-name"><xsl:value-of select="descendant::figcaption/@data-name"/></xsl:attribute>
			<xsl:apply-templates select="descendant::img"/>
		</xsl:element>
		<xsl:element name="p">
			<xsl:attribute name="class"><xsl:value-of select="descendant::figcaption/@class"/></xsl:attribute>
			<xsl:attribute name="data-name"><xsl:value-of select="descendant::figcaption/@data-name"/></xsl:attribute>
			<xsl:apply-templates select="descendant::figcaption/node()"/>
		</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template match="figcaption">
		<xsl:apply-templates/>
	</xsl:template>
	<!--<xsl:template match="a[@data-alias]">
		<xsl:element name="span">
			<xsl:attribute name="class"><xsl:value-of select="self::a/@class"/></xsl:attribute>
			<xsl:attribute name="data-name"><xsl:value-of select="self::a/@data-name"/></xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="div[@data-alias]">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="*[@data-alias]/@data-alias"/>
	<!-\- end -\->
	<xsl:template match="span[@data-fldChar='begin']"/>
	<xsl:template match="span[@data-instrText]"/>
	<xsl:template match="span[@data-fldChar='separate']"/>
	<xsl:template match="span[@data-fldChar='end']"/>-->
	
	<!--<xsl:template match="p[lower-case(@class)='header' or lower-case(@data-name)='header']"/>
	<xsl:template match="p[lower-case(@class)='footer' or lower-case(@data-name)='footer']"/>-->
	<!--<xsl:template match="a[@data-hyperlink]">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="span[@class='shy-hyphen']"/>
	
	
	<xsl:template match="span[not(contains(@style,'background-color'))][contains(@style,'color:')]/@style[not(contains(.,'color: #000000') or contains(.,'color: #ffffff') or contains(.,'color:#000000') or contains(.,'color:#ffffff'))]">
		<xsl:attribute name="style">
		<xsl:value-of select="substring-before(.,'color:')"/>
		<xsl:variable name="sys"><xsl:value-of select="substring-after(.,'color:')"/></xsl:variable>
	<xsl:choose>
		<xsl:when test="contains($sys,';')">
			<xsl:value-of select="'color: #000000;'"/>
			<xsl:value-of select="substring-after($sys,';')"/>
		</xsl:when>
		<xsl:otherwise><xsl:value-of select="'color: #000000'"/></xsl:otherwise>
	</xsl:choose>
		</xsl:attribute>
	</xsl:template>
	<xsl:template match="span[contains(@style,'background-color')]/@style[contains(.,'background-color')]">
		<xsl:attribute name="style">
			<xsl:value-of select="substring-before(.,'background-color:')"/>
			<xsl:variable name="sys"><xsl:value-of select="substring-after(.,'background-color:')"/></xsl:variable>
			
				<xsl:if test="contains($sys,';')">
					<xsl:value-of select="substring-after($sys,';')"/>
				</xsl:if>
		</xsl:attribute>
	</xsl:template>
	<xsl:template match="span[contains(@style,'background:')]/@style[contains(.,'background:')]">
		<xsl:attribute name="style">
			<xsl:value-of select="substring-before(.,'background:')"/>
			<xsl:variable name="sys"><xsl:value-of select="substring-after(.,'background:')"/></xsl:variable>
			
			<xsl:if test="contains($sys,';')">
				<xsl:value-of select="substring-after($sys,';')"/>
			</xsl:if>
		</xsl:attribute>
	</xsl:template>-->
	
	<!--<xsl:template match="span[@class or @data-name or not(@style)]">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="span[@style]/@class"/>
	<xsl:template match="span[@style]/@data-name"/>-->
	
	<!--<xsl:template match="p[descendant::Hidden]/Hidden| p[descendant::rtl]/rtl">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="span[@class='allcaps' or @data-name='allcaps']">
		<xsl:element name="span">
			<xsl:apply-templates select="@*"/>
		<xsl:value-of select="upper-case(.)"/>
		</xsl:element>
	</xsl:template>-->
	<!--<xsl:template match="//a[@class='footnotecitation']|//a[@class='endnotecitation']|//a[@class='crossref']//a[contains(@style,'mso-footnote-')][not(descendant::sup)]">
		<xsl:element name="sup">
			<xsl:value-of select="replace(.,'.','')"/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="//a[contains(@style,'mso-footnote-')][descendant::sup]">
		<xsl:apply-templates/>
	</xsl:template>-->
	<xsl:template match="p[string-length(.)=0][not(descendant::img)][not(descendant::Comment)][not(descendant::math)][not(parent::td)]"/>
	
	<xsl:template match="div[@class='RefGroup' or @id='RefGroup']">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="//a[contains(@id,'Reference')]">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="//a[contains(@style,'display:none')]"/>
        <xsl:template match="sub[descendant::img]|sub[descendant::math]">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="//td/div">
		<xsl:apply-templates/>
	</xsl:template>
	<!-- style not retained to word by space issue on 12-12-2024 -->
	<xsl:template match="*[contains(@class,' ')]/@class">
		<xsl:attribute name="class"><xsl:value-of select="normalize-space(.)"/></xsl:attribute>
	</xsl:template>
	<xsl:template match="*[contains(@data-name,' ')]/@data-name">
		<xsl:attribute name="data-name"><xsl:value-of select="normalize-space(.)"/></xsl:attribute>
	</xsl:template>
	<!-- to remove empty  data-hyperlink on 6-2-2024-->
	<xsl:template match="a[string-length(@data-hyperlink) = 0 and string-length(@href) = 0]">
		<xsl:apply-templates/>
	</xsl:template>
	<!-- Added to remove the mathjax to ignore the duplicate math on word 12-8-2025 -->
	<xsl:template match="//span[@contenteditable][@id='mathjax'][@latex]|//span[@contenteditable or @id='mathjax' or @latex]"/>
	</xsl:stylesheet>