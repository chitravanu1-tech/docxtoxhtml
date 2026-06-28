<!--New Update tdCount{17.02.2017}-->
<!--For index Purpose 14.02.2017-->
<!--For Old Script {20.02.2017-->
<!--Updated 07.03.2018-->
<!--updation to remove dummy td 19.04.2018-->
<!--updation to remove dummy td 08.05.2018-->
<!--To remove italic,bold underline 24-10-2018-->
<!--caption inside td updated on 19-12-2018-->
<!--comment this for footnote missing in figure caption Rat41101_Ch05.xhtml 17-5-2019-->
<!--Editor change data-Underline to data-underline check mariappan 2-7-2019-->
<!--To Remove "<div style="display:none;"> 26-03-2020-->
<!--custom xml match for figure floating elements to suguna 23-4-2020 - Remove here that range-->
<!--To Remove "<div id="artDetails_" style="display:none;"> for mariaapan alt="" 27-05-2020-->
<!--Splited seperate para, if place-holder and caption came single line 04-08-2020-->
<!--Added on 08-02-2021 to avoid the citation range 11 12 13-14 we removed here 12 13 we added in xhtml for editor purpose-->
<!--changed preceding to preceding-sibling for italic missing in non heading paras on 07-05-2021-->
<!--Added for figure on 09-07-2021-->
<!-- Added to remove the empty paragraph first and last of the document on 28-09-2021 -->
<!-- Added for editor on 18-10-2021 -->
<!-- Added to avoid close span issue on 15-11-2021 -->
<!-- Added to remove the class="captiontable" , when table change to figuregroup on 26-11-2021 -->
<!-- Added while change the group issue by captiontable  on 27-12-2021-->
<!-- Added for table column count value = 1 on 5-1-2021 -->
<!-- empty para followed by table so empty para removed issue on 28-1-2022 -->
<!-- Added for paneer indd on 21-2-2022 -->
<!-- Tablecaption missing by empty Table group tag removing from editor concept, if its come from table/td 12-3-2022-->
<!-- Added  to avoid the heading level b not removed on issue on 22-3-2022 -->
<!--stylecollection concept for 100%bolditalic on 17-5-2022-->
<!-- Added to avoid preceeding content paragraph style for table on 24-11-2022 -->
<!-- To remove .. for footnote Azure 7868 on 28-06-2023-->
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
	<xsl:variable name="StylesCollection" select="document('Idml_Style_Map.xml')"/>
	<xsl:variable name="StylesCollect" select="document('StylesCollection.xml')"/>
	<xsl:variable name="Mathextension" select="document('XTHML2IDML-Config.xml')"/>
	<xsl:template match="@* | node()">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()"/>
		</xsl:copy>
	</xsl:template>
	<xsl:variable name="aaa">
		<xsl:number level="single"/>
	</xsl:variable>

	<!--updated for kogan 5-11-2018-->

	<xsl:template match="@*">
		<xsl:copy>
			<xsl:apply-templates/>
		</xsl:copy>

		<xsl:if test="parent::*[@class and @data-name]">
			<xsl:variable name="className" select="."/>
			<xsl:choose>
				<xsl:when test="$className = $StylesCollection//style/@name">
					<xsl:variable name="sc"
						select="$StylesCollection//style[@name = $className]/@replacement"/>
					<xsl:attribute name="data-name">
						<xsl:value-of select="$sc"/>
					</xsl:attribute>

				</xsl:when>
				<xsl:otherwise>
					<xsl:copy>
						<xsl:apply-templates/>
					</xsl:copy>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<!--end-->

	<!--caption inside td updated on 19-12-2018-->

	<xsl:template match="div[@data-alias = 'TableGroup' or @data-alias = '']">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:if
				test="table/descendant::td/div[@data-alias = 'TableCaption' or @data-alias = 'Table Caption']">

				<xsl:choose>
					<xsl:when
						test="table/descendant::td/div[@data-alias = 'TableCaption' or @data-alias = 'Table Caption']">
						<xsl:copy-of
							select="descendant::td/div[@data-alias = 'TableCaption' or @data-alias = 'Table Caption']"
						/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:copy>
							<xsl:apply-templates select="@* | node()"/>
						</xsl:copy>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
			<xsl:apply-templates select="node()"/>
		</xsl:copy>
	</xsl:template>

	<xsl:template match="//td/div[@data-alias = 'TableCaption' or @data-alias = 'Table Caption']">
		<xsl:for-each
			select="//td/div[@data-alias = 'TableCaption' or @data-alias = 'Table Caption']">

			<xsl:variable name="id"
				select="self::div[@data-alias = 'TableCaption' or @data-alias = 'Table Caption']"/>

			<xsl:if
				test="ancestor::div[@data-alias = 'TableGroup' or @data-alias = '']/div[@data-alias = 'TableCaption' or @data-alias = 'Table Caption']">

				<xsl:choose>
					<xsl:when
						test="ancestor::div[@data-alias = 'TableGroup' or @data-alias = '']/div[@data-alias = 'TableCaption' or @data-alias = 'Table Caption'] = $id"> </xsl:when>
					<xsl:otherwise>
						<xsl:copy>
							<xsl:apply-templates select="@* | node()"/>
						</xsl:copy>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>






	<!--<xsl:template match="tr[td[div[@data-alias='TableCaption' or @data-alias='Table Caption']]]">
		<xsl:choose>
			<xsl:when test="self::tr[td[descendant::div[@data-alias='TableCaption' or @data-alias='Table Caption'] and not(child::p) or not(child::div) or not(child::node()) or child::node()/string-length(.)= 0] and descendant::node()/string-length(.)= 0]"> </xsl:when>
			<xsl:otherwise>
				<xsl:copy>
					<xsl:apply-templates select="@*|node()"/>
				</xsl:copy>
			</xsl:otherwise>
		</xsl:choose>
		
	</xsl:template>
	
	<xsl:template match="//td/div[@data-alias='TableCaption' or @data-alias='Table Caption']">
		
		<xsl:for-each select="//td/div[@data-alias='TableCaption' or @data-alias='Table Caption']">
			
			<xsl:variable name="id" select="self::div[@data-alias='TableCaption' or @data-alias='Table Caption']"/>
			<xsl:if test="ancestor::div[@data-alias='TableGroup' or @data-alias='']/div[@data-alias='TableCaption' or @data-alias='Table Caption']">
					<xsl:choose>
					<xsl:when test="ancestor::div[@data-alias='TableGroup' or @data-alias='']/div[@data-alias='TableCaption' or @data-alias='Table Caption'] = $id"> </xsl:when>
			 <xsl:otherwise>
					<xsl:copy>
					<xsl:apply-templates select="@*|node()"/>
					</xsl:copy>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		</xsl:for-each>
	</xsl:template>-->

	<!--end caption inside td-->

	<!--script updated for ,if not available colgroup information-->
	<xsl:template match="table">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:if test="not(descendant::colgroup)">
				<xsl:variable name="ColumnCount">
					<xsl:value-of
						select="(count(descendant::tr[1]/td) + sum(descendant::tr[1]/child::td/@colspan)) - count(descendant::tr[1]/child::td/@colspan)"
					/>
				</xsl:variable>

				<xsl:if test="$ColumnCount > 1">
					<xsl:text>&#x000A;</xsl:text>
					<xsl:element name="colgroup">
						<xsl:attribute name="cols" select="$ColumnCount"/>
						<xsl:for-each select="1 to $ColumnCount">
							<xsl:text>&#x000A;</xsl:text>
							<xsl:element name="col">
								<xsl:attribute name="width" select="100 div $ColumnCount"/>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
				<!-- Added for table column count value = 1 on 5-1-2021 -->
				<xsl:if test="$ColumnCount = 1">
					<xsl:text>&#x000A;</xsl:text>
					<xsl:element name="colgroup">
						<xsl:attribute name="cols" select="1"/>
						<xsl:text>&#x000A;</xsl:text>
							<xsl:element name="col">
								<xsl:attribute name="width" select="100"/>
							</xsl:element>
					</xsl:element>
				</xsl:if>	
				<!-- End -->
			</xsl:if>
			<xsl:apply-templates select="node()"/>
		</xsl:copy>

	</xsl:template>

	<xsl:template match="tr">
		<tr>
			<xsl:attribute name="trposition" select="position() - 1"/>
			<xsl:apply-templates/>
		</tr>
		<xsl:text>&#x000A;</xsl:text>
	</xsl:template>

	<xsl:template match="td">
		<xsl:variable name="RowCount">
			<xsl:value-of select="count(ancestor::tr/preceding-sibling::tr)"/>
		</xsl:variable>
		<td>
			<xsl:attribute name="tdposition">
				<xsl:variable name="ty">
					<xsl:number/>
				</xsl:variable>
				<xsl:variable name="tt">
					<xsl:value-of select="$ty - 1"/>
				</xsl:variable>
				<xsl:value-of select="$tt"/>
			</xsl:attribute>
			<xsl:if test="@rowspan">
				<xsl:attribute name="rowspan">
					<xsl:value-of select="@rowspan"/>
				</xsl:attribute>
			</xsl:if>
                        <xsl:if test="self::td[@class='emptypara']">
				<xsl:attribute name="data-name"><xsl:value-of select="child::p[string-length(@data-name) &gt; 0]/@data-name"/></xsl:attribute>
			</xsl:if>
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
			<xsl:attribute name="I">
				<xsl:value-of select="$ColumnCount"/>
			</xsl:attribute>
			<xsl:attribute name="J">
				<xsl:value-of select="$RowCount"/>
			</xsl:attribute>
			<xsl:apply-templates select="@* | node()"/>
		</td>
		<xsl:text>&#x000A;</xsl:text>
	</xsl:template>



	<xsl:template name="Br">
		<xsl:param name="i" as="xs:integer"/>
		<xsl:param name="j" as="xs:integer"/>
		<xsl:param name="to1" as="xs:integer"/>
		<xsl:param name="step2" as="xs:integer"/>
		<xsl:variable name="gridval" as="xs:integer">
			<xsl:choose>
				<xsl:when test="preceding-sibling::*[$i]/@colspan">
					<xsl:value-of select="(preceding-sibling::*[$i]/@colspan) - 1"/>
				</xsl:when>

				<xsl:otherwise>
					<xsl:value-of select="0"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$i = $to1">
				<xsl:value-of select="number($j)"/>
				<!--<xsl:value-of select="($j cast as xs:integer)"/> please check Updated 14.12.2017-->
			</xsl:when>
		</xsl:choose>
		<xsl:if test="$i + $step2 &gt;= $to1">
			<xsl:call-template name="Br">
				<xsl:with-param name="i" select="$i + $step2" as="xs:integer"/>
				<xsl:with-param name="j" select="$j + $gridval" as="xs:integer"/>
				<xsl:with-param name="to1" select="$to1" as="xs:integer"/>
				<xsl:with-param name="step2" select="$step2" as="xs:integer"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<!--updation to remove dummy td 19.04.2018-->
	<xsl:template match="td[@style = 'display:none;']"/>
	<xsl:template match="td[@style = 'display:none;vertical-align: baseline;']"/>
	<xsl:template match="td[@style = 'display:none;vertical-align: top;']"/>
	<xsl:template match="td[@style = 'display:none;vertical-align: middle;']"/>
	<xsl:template match="td[@style = 'display:none;vertical-align: center;']"/>
	<xsl:template match="td[@style = 'display:none;vertical-align: bottom;']"/>
	<!--updation to remove dummy td 08.05.2018-->
	<xsl:template match="td[contains(@style, 'display:none;vertical-align: middle;')]"/>
	<xsl:template match="td[contains(@style, 'display:none;vertical-align: baseline;')]"/>
	<xsl:template match="td[contains(@style, 'display:none;vertical-align: top;')]"/>
	<xsl:template match="td[contains(@style, 'display:none;vertical-align: center;')]"/>
	<xsl:template match="td[contains(@style, 'display:none;vertical-align: bottom;')]"/>

	<!--To Remove "<div style="display:none;"> 26-03-2020-->
	<!--To Remove "<div id="artDetails_" style="display:none;"> for mariaapan alt="" 27-05-2020-->
	<!--added on [not(contains(@id,'comment_'))] 05-02-2021-->
	<xsl:template match="div[@style = 'display:none;'][not(contains(@id,'artDetails'))][not(contains(@id,'comment_'))]"/>
        <!--End-->


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
		<xsl:text>&#x000A;</xsl:text>
	</xsl:template>
	<xsl:template match="tbody/span[1]"/>
	<xsl:template match="tgroup/@cols"/>
	<xsl:template match="tgroup">
		<xsl:apply-templates select="@* | node()"/>
	</xsl:template>
	<xsl:template match="span[@data-change = 'commentdeleted']"/>
	<xsl:template match="commentreference[@data-change = 'commentdeleted']"/>
	<xsl:template match="commentreference/comment[@data-change = 'commentdeleted']"/>


	<!--Template match move{2_1_Table_New to 2_Table_New} -->
	<!-- Issue {Engelkir}{Chapter 3}Check-->
	<!--comment this for footnote missing in figure caption Rat41101_Ch05.xhtml 17-5-2019-->
	<!--<xsl:template match="span[@class='MsoFootnoteReference']">
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
	</xsl:template>-->


	<xsl:template match="span[@class = 'CommentReference']">
		<xsl:choose>
			<xsl:when test="ancestor::comment">
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:copy>
					<xsl:apply-templates select="@* | node()"/>
				</xsl:copy>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!--For index Purpose 14.02.2017 then changed the space for ' XE ' on 26-10-2018-->
	<!--Updated 07.03.2018-->
	<!--last updated 21-11-2018-->



	<!--<xsl:template
		match="//span[@data-fldChar = 'begin'] | span/span[@data-fldChar = 'begin'] | a/span[@data-fldChar = 'begin']">
		<xsl:choose>
			<!-\-<xsl:when test="contains(following::span[@data-instrText][1]/substring(@data-instrText, 1, 4),'XE') or contains(following::span[@data-instrText][1]/substring(@data-instrText, 1, 4),'xe') or contains(following::span[@data-instrText][1]/substring(@data-instrText, 1, 4),'Xe')">-\->
			<xsl:when
				test="contains(following::span[@data-instrText][1]/lower-case(substring(@data-instrText, 1, 4)), 'xe')">
              <xsl:if test="parent::i">
	           <xsl:text disable-output-escaping="yes">&lt;/i&gt;</xsl:text>
               </xsl:if>
				<xsl:if test="parent::b">
					<xsl:text disable-output-escaping="yes">&lt;/b&gt;</xsl:text>
				</xsl:if>
				<xsl:if test="parent::span[1]">
					<xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
				</xsl:if>
				<xsl:text disable-output-escaping="yes">&lt;span data-index="yes"&gt;</xsl:text>
				<xsl:if test="parent::i">
					<xsl:text disable-output-escaping="yes">&lt;i&gt;</xsl:text>
				</xsl:if>
				<xsl:if test="parent::b">
					<xsl:text disable-output-escaping="yes">&lt;b&gt;</xsl:text>
				</xsl:if>
				<xsl:if test="parent::span[1]">
					<xsl:text disable-output-escaping="yes">&lt;span&gt;</xsl:text>
				</xsl:if>
				</xsl:when>
			<xsl:otherwise>
				<xsl:copy>
					<xsl:apply-templates select="@* | node()"/>
				</xsl:copy>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>-->
	<xsl:template match="span[@data-instrText]">

		<xsl:if test="self::span[@data-instrText][contains(lower-case(substring(@data-instrText, 1, 4)), 'xe')]">
			
			<xsl:text disable-output-escaping="yes">&lt;span data-index="yes"&gt;</xsl:text>
		</xsl:if>


		<xsl:choose>
			<xsl:when
				test="contains(self::span[@data-instrText]/lower-case(substring(@data-instrText, 1, 4)), 'xe') or contains(preceding::span[@data-instrText][1]/lower-case(substring(@data-instrText, 1, 4)), 'xe')  or  contains(preceding::span[@data-instrText][2]/lower-case(substring(@data-instrText, 1, 4)), 'xe')or contains(following::span[@data-instrText][1]/@data-instrText, '^&#34; $')">
				<xsl:value-of select="@data-instrText"/>
			</xsl:when>

			<xsl:otherwise>
				<xsl:copy>
					<xsl:apply-templates select="@* | node()"/>
				</xsl:copy>
			</xsl:otherwise>
		</xsl:choose>
		<!-- Added to avoid close span issue on 15-11-2021 -->
		<xsl:if test="self::span[@data-instrText][contains(lower-case(substring(@data-instrText, 1, 4)), 'xe')][preceding-sibling::*[1][self::span[@data-fldChar='begin']]][following-sibling::*[1][self::span[@data-fldChar='end']]] or self::span[string-length(@data-instrText) &gt; 0][preceding::span[@data-instrText][contains(lower-case(substring(@data-instrText, 1, 4)), 'xe')]][following-sibling::*[1][self::i/span[@data-fldChar='end']] or following-sibling::*[1][self::b/span[@data-fldChar='end']] or following-sibling::*[1][self::span/span[@data-fldChar='end']] or following-sibling::*[1][self::i/span/span[@data-fldChar='end']] or following-sibling::*[1][self::b/span/span[@data-fldChar='end']]] or self::span[@data-instrText=' '][preceding::span[1][string-length(@data-instrText) &gt; 0]][preceding::span[@data-instrText][contains(lower-case(substring(@data-instrText, 1, 4)), 'xe')]][following::span[@data-fldChar='end'][1]] or self::span[string-length(@data-instrText) &gt; 0][preceding::span[@data-instrText][contains(lower-case(substring(@data-instrText, 1, 4)), 'xe')]][following-sibling::*[1][self::span[@data-fldChar='end']]] or self::span[string-length(@data-instrText) &gt; 0][preceding::span[@data-instrText][contains(lower-case(substring(@data-instrText, 1, 4)), 'xe')]][following-sibling::*[1][self::i/span[@data-fldChar='end']] or following-sibling::*[1][self::b/span[@data-fldChar='end']] or following-sibling::*[1][self::span/span[@data-fldChar='end']] or following-sibling::*[1][self::i/span/span[@data-fldChar='end']] or following-sibling::*[1][self::b/span/span[@data-fldChar='end']]]">
	    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
		</xsl:if>
			
	</xsl:template>

	
	<!--<xsl:template
		match="//span[@data-fldChar = 'end'] | span/span[@data-fldChar = 'end'] | a/span[@data-fldChar = 'end']">
		<xsl:choose>
			<xsl:when
				test="contains(preceding::span[@data-instrText][1]/@data-instrText, '^&#34; $') or contains(ancestor::span[@data-instrText]/lower-case(substring(@data-instrText, 1, 4)), 'xe') or count(preceding::span[@data-instrText]/@data-instrText[contains(lower-case(substring(., 1, 4)), 'xe')])">
				<xsl:if test="parent::i">
					<xsl:text disable-output-escaping="yes">&lt;/i&gt;</xsl:text>
				</xsl:if>
				<xsl:if test="parent::span/i">
					<xsl:text disable-output-escaping="yes">&lt;/i&gt;</xsl:text>
				</xsl:if>
				<xsl:if test="parent::b">
					<xsl:text disable-output-escaping="yes">&lt;/b&gt;</xsl:text>
				</xsl:if>
				<xsl:if test="parent::span[1]">
					<xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
				</xsl:if>
				
				<xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
				<xsl:if test="parent::i">
					<xsl:text disable-output-escaping="yes">&lt;i&gt;</xsl:text>
				</xsl:if>
				<xsl:if test="parent::span/i">
					<xsl:text disable-output-escaping="yes">&lt;i&gt;</xsl:text>
				</xsl:if>
				<xsl:if test="parent::b">
					<xsl:text disable-output-escaping="yes">&lt;b&gt;</xsl:text>
				</xsl:if>
				<xsl:if test="parent::span[1]">
					<xsl:text disable-output-escaping="yes">&lt;span&gt;</xsl:text>
				</xsl:if>
				
			</xsl:when>
			<xsl:otherwise>
				<xsl:copy>
					<xsl:apply-templates select="@* | node()"/>
				</xsl:copy>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>-->

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
					<xsl:apply-templates select="@* | node()"/>
				</xsl:copy>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>




	<!--Condition applied for Luster {madasamy}{30.01.2017} -->
	<xsl:template match="table[@style = 'display:none;']"/>


	<!--To remove 100% italic,bold underline 24-10-2018-->

	<!--<xsl:template match="i | italic | span[@data-name = 'italic']">

		<xsl:choose>
			<xsl:when
				test="self::i and descendant::span[@data-Italic = 'REMOVE'] or self::i and ancestor::span[@data-Italic = 'REMOVE']">
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:when test="self::i[ancestor::*/following-sibling::span[@data-Italic = 'REMOVE']] or self::i[ancestor::*/preceding-sibling::span[@data-Italic = 'REMOVE']]">
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:when
				test="span[@data-name = 'italic'] and descendant::span[@data-Italic = 'REMOVE'] or span[@data-name = 'italic'] and ancestor::span[@data-Italic = 'REMOVE']">
				<xsl:apply-templates/>
			</xsl:when>

			<xsl:when
				test="span[contains(@style, 'font-style:italic') or contains(@style, 'font-weight:italic') and not(@data-name)] and not(./ancestor::span[@data-name] and not(following::span/@data-name)) and descendant::span[@data-Italic = 'REMOVE']">
				<xsl:apply-templates/>
			</xsl:when>

			<!-\-Editor change data-Italic to data-italic check mariappan 2-7-2019-\->
			<!-\-changed preceding to preceding-sibling for italic missing in non heading paras on 07-05-2021-\->
			<xsl:when
				test="self::i and descendant::span[@data-italic = 'REMOVE'] or self::i and ancestor::span[@data-italic = 'REMOVE'] or self::i and preceding-sibling::span[@data-italic = 'REMOVE'] or self::i[ancestor::*/preceding-sibling::span[@data-italic = 'REMOVE']] or self::i[ancestor::*/following-sibling::span[@data-italic = 'REMOVE']]">
				<xsl:apply-templates/>
			</xsl:when>
			
			
			<xsl:when
				test="span[@data-name = 'italic'] and descendant::span[@data-italic = 'REMOVE'] or span[@data-name = 'italic'] and ancestor::span[@data-italic = 'REMOVE']">
				<xsl:apply-templates/>
			</xsl:when>

			<xsl:when
				test="span[contains(@style, 'font-style:italic') or contains(@style, 'font-weight:italic') and not(@data-name)] and not(./ancestor::span[@data-name] and not(following::span/@data-name)) and descendant::span[@data-italic = 'REMOVE']">
				<xsl:apply-templates/>
			</xsl:when>

			<!-\-End-\->
			<xsl:otherwise>
				<xsl:copy>
					<xsl:apply-templates select="@* | node()"/>
				</xsl:copy>
			</xsl:otherwise>
		</xsl:choose>

	</xsl:template>-->
	
	<!--<xsl:template match="b | bold | span[@data-name = 'bold']">

		<xsl:choose>
			<xsl:when
				test="self::b and descendant::span[@data-Bold = 'REMOVE'] or self::b and ancestor::span[@data-Bold = 'REMOVE']">
				<xsl:apply-templates/>
			</xsl:when>
			<!-\-<xsl:when
				test="self::b and preceding::span[@data-Bold = 'REMOVE'] or self::b and following::span[@data-Bold = 'REMOVE']">
				<xsl:apply-templates/>
			</xsl:when>-\->
			<!-\- Added  to avoid the heading level b,i ,u removed on 15-09-2021 -\->
			<xsl:when
				test="self::b and preceding-sibling::span[@data-Bold = 'REMOVE'] or self::b and following-sibling::span[@data-Bold = 'REMOVE']">
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:when test="self::b[ancestor::*/following-sibling::span[@data-Bold = 'REMOVE']] or self::b[ancestor::*/preceding-sibling::span[@data-Bold = 'REMOVE']]">
				<xsl:apply-templates/>
			</xsl:when>
			<!-\- End -\->
			<xsl:when
				test="self::bold and descendant::span[@data-Bold = 'REMOVE'] or self::bold and ancestor::span[@data-Bold = 'REMOVE']">
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:when
				test="span[@data-name = 'bold'] and descendant::span[@data-Bold = 'REMOVE'] or span[@data-name = 'bold'] and ancestor::span[@data-Bold = 'REMOVE']">
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:when
				test="span[contains(@style, 'font-style:bold') or contains(@style, 'font-weight:bold') and not(@data-name)] and not(./ancestor::span[@data-name] and not(following::span/@data-name)) and descendant::span[@data-Bold = 'REMOVE']">
				<xsl:apply-templates/>
			</xsl:when>

			<!-\-Editor change data-Bold to data-bold check mariappan 2-7-2019-\->

			<xsl:when
				test="self::b and descendant::span[@data-bold = 'REMOVE'] or self::b and ancestor::span[@data-bold = 'REMOVE']">
				<xsl:apply-templates/>
			</xsl:when>
			<!-\-changed preceding to preceding-sibling for italic missing in non heading paras on 07-05-2021-\->
			<xsl:when
				test="self::b[ancestor::*/preceding-sibling::span[@data-bold = 'REMOVE']] or self::b[ancestor::*/following-sibling::span[@data-bold = 'REMOVE']]">
				<xsl:apply-templates/>
			</xsl:when>

			<xsl:when
				test="self::bold and descendant::span[@data-bold = 'REMOVE'] or self::bold and ancestor::span[@data-bold = 'REMOVE']">
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:when
				test="span[@data-name = 'bold'] and descendant::span[@data-bold = 'REMOVE'] or span[@data-name = 'bold'] and ancestor::span[@data-bold = 'REMOVE']">
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:when
				test="span[contains(@style, 'font-style:bold') or contains(@style, 'font-weight:bold') and not(@data-name)] and not(./ancestor::span[@data-name] and not(following::span/@data-name)) and descendant::span[@data-bold = 'REMOVE']">
				<xsl:apply-templates/>
			</xsl:when>
			<!-\- Added  to avoid the heading level b not removed on issue on 22-3-2022 -\->
			<xsl:when
				test="self::b and preceding-sibling::span[@data-bold = 'REMOVE'] or self::b and following-sibling::span[@data-bold = 'REMOVE']">
				<xsl:apply-templates/>
			</xsl:when>
			<!-\- End -\->
			<!-\-End-\->

			<xsl:otherwise>
				<xsl:copy>
					<xsl:apply-templates select="@* | node()"/>
				</xsl:copy>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>-->
	
	




	<!--<xsl:template match="u | underline | span[@data-name = 'underline']">
		<xsl:choose>
			<xsl:when
				test="self::u and descendant::span[@data-Underline = 'REMOVE'] or self::u and ancestor::span[@data-Underline = 'REMOVE'] or self::u[ancestor::*/preceding-sibling::span[@data-Underline = 'REMOVE']]or self::u[ancestor::*/following-sibling::span[@data-Underline = 'REMOVE']]">
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:when
				test="self::underline and descendant::span[@data-Underline = 'REMOVE'] or self::underline and ancestor::span[@data-Underline = 'REMOVE']">
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:when
				test="span[@data-name = 'underline'] and descendant::span[@data-Underline = 'REMOVE'] or span[@data-name = 'underline'] and ancestor::span[@data-Underline = 'REMOVE']">
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:when
				test="span[contains(@style, 'font-style:underline') or contains(@style, 'font-weight:underline') and not(@data-name)] and not(./ancestor::span[@data-name] and not(following::span/@data-name)) and descendant::span[@data-Underline = 'REMOVE']">
				<xsl:apply-templates/>
			</xsl:when>


			<!-\-Editor change data-Underline to data-underline check mariappan 2-7-2019-\->
			<!-\-changed preceding to preceding-sibling for italic missing in non heading paras on 07-05-2021-\->
			<xsl:when
				test="self::u and descendant::span[@data-underline = 'REMOVE'] or self::u and ancestor::span[@data-underline = 'REMOVE'] or self::u and preceding-sibling::span[@data-underline = 'REMOVE'] or self::u[ancestor::*/preceding-sibling::span[@data-underline = 'REMOVE']] or self::u[ancestor::*/following-sibling::span[@data-underline = 'REMOVE']]">
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:when
				test="self::underline and descendant::span[@data-underline = 'REMOVE'] or self::underline and ancestor::span[@data-underline = 'REMOVE']">
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:when
				test="span[@data-name = 'underline'] and descendant::span[@data-underline = 'REMOVE'] or span[@data-name = 'underline'] and ancestor::span[@data-underline = 'REMOVE']">
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:when
				test="span[contains(@style, 'font-style:underline') or contains(@style, 'font-weight:underline') and not(@data-name)] and not(./ancestor::span[@data-name] and not(following::span/@data-name)) and descendant::span[@data-underline = 'REMOVE']">
				<xsl:apply-templates/>
			</xsl:when>

			<!-\-End-\->

			<xsl:otherwise>
				<xsl:copy>
					<xsl:apply-templates select="@* | node()"/>
				</xsl:copy>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>-->
	<!--end-->
	
	<xsl:variable name="DZP" select="$StylesCollect//stylesList//style[@name ='DZP_ChapterTitle' or @name = 'DZP_TitleHead' or @name = 'DZP_RunningHeadText' or @name = 'DZP_AuthorHeading' or @name = 'DZP_EMailAddressHead' or @name = 'DZP_Highlight' or @name = 'DZP_SupplementaryLegends' or @name = 'DZP_FigureLegends' or @name = 'DZP_TableCaptions' or @name = 'DZP_ImageCaptions' or @name = 'DZP_PhotoCaptions' or @name = 'DZP_BoxTitles' or @name = 'DZP_SchemeLegends' or @name = 'DZP_StructureLegends' or @name = 'DZP_ExhibitCaptions' or @name = 'DZP_AppendixCaptions' or @name = 'DZP_SeriesHeadings' or @name = 'DZP_DisplayHeadings' or @name = 'DZP_ListHead' or @name = 'DZP_AbbreviationList' or @name = 'DZP_AcronymHead' or @name = 'DZP_AbbreviationHead' or @name = 'DZP_AcronymHead' or @name = 'DZP_GraphicalAbstract' or @name = 'DZP_ReferencesHeading1' or @name = 'DZP_Acknowledgements' or @name = 'DZP_KeyTermHead' or @name = 'DZP_KeyTermHead' or @name = 'DZP_Heading' or @name = 'DZP_Head1' or @name = 'DZP_Head2' or @name = 'DZP_Head3' or @name = 'DZP_Head4' or @name = 'DZP_Head5' or @name = 'DZP_Head6' or @name = 'DZP_Head7' or @name='DZP_ChapterNumber' or @name='DZP_FigureLegend' or @name='DZP_TableCaption'][not(@editor='false' or @wyciwyg='false')]/@replacement"/>
	
<!-- 100% bold italic concept changed on 23-3-2022 -->
	<!--stylecollection concept for 100%bolditalic on 17-5-2022-->
	<xsl:template match="*[@data-name = $DZP][descendant::span[@data-Italic = 'REMOVE']]//i | *[@data-name = $DZP][descendant::span[@data-Italic = 'REMOVE']]//italic | *[@data-name = $DZP][descendant::span[@data-Italic = 'REMOVE']]//span[contains(@style, 'font-style:italic') or contains(@style, 'font-weight:italic')][not(@data-name)] | *[@data-name = $DZP][descendant::span[@data-Italic = 'REMOVE']]//span[@data-name = 'italic'] | *[@data-name = $DZP][descendant::span[@data-Italic = 'REMOVE']]//span[@data-name = 'italicHLC']">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="*[@data-name = $DZP][descendant::span[@data-italic = 'REMOVE']]//i | *[@data-name = $DZP][descendant::span[@data-italic = 'REMOVE']]//italic | *[@data-name = $DZP][descendant::span[@data-italic = 'REMOVE']]//span[contains(@style, 'font-style:italic') or contains(@style, 'font-weight:italic')][not(@data-name)] | *[@data-name = $DZP][descendant::span[@data-italic = 'REMOVE']]//span[@data-name = 'italic'] | *[@data-name = $DZP][descendant::span[@data-italic = 'REMOVE']]//span[@data-name = 'italicHLC']">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="*[@data-name = $DZP][descendant::span[@data-Italic = 'REMOVE' or @data-italic = 'REMOVE']]//span[@data-name = 'bolditalicunderlineHLC'] | *[@data-name = $DZP][descendant::span[@data-Italic = 'REMOVE' or @data-italic = 'REMOVE']]//span[@data-name = 'bolditalicHLC']">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:attribute name="data-name">
				<xsl:value-of select="replace(@data-name,'italic','')"/>
			</xsl:attribute>
			<xsl:apply-templates select="node()"/>
		</xsl:copy>
	</xsl:template>
	
	<xsl:template match="*[@data-name = $DZP][descendant::span[@data-Bold = 'REMOVE']]//b | *[@data-name = $DZP][descendant::span[@data-Bold = 'REMOVE']]//bold | *[@data-name = $DZP][descendant::span[@data-Bold = 'REMOVE']]//span[contains(@style, 'font-style:bold') or contains(@style, 'font-weight:bold')][not(@data-name)] | *[@data-name = $DZP][descendant::span[@data-Bold = 'REMOVE']]//span[@data-name = 'bold'] | *[@data-name = $DZP][descendant::span[@data-Bold = 'REMOVE']]//span[@data-name = 'boldHLC']">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="*[@data-name = $DZP][descendant::span[@data-bold = 'REMOVE']]//b | *[@data-name = $DZP][descendant::span[@data-bold = 'REMOVE']]//bold | *[@data-name = $DZP][descendant::span[@data-bold = 'REMOVE']]//span[contains(@style, 'font-style:bold') or contains(@style, 'font-weight:bold')][not(@data-name)] | *[@data-name = $DZP][descendant::span[@data-bold = 'REMOVE']]//span[@data-name = 'bold'] | *[@data-name = $DZP][descendant::span[@data-bold = 'REMOVE']]//span[@data-name = 'boldHLC']">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="*[@data-name = $DZP][descendant::span[@data-Bold = 'REMOVE' or @data-bold = 'REMOVE']]//span[@data-name = 'bolditalicunderlineHLC'] | *[@data-name = $DZP][descendant::span[@data-Bold = 'REMOVE' or @data-bold = 'REMOVE']]//span[@data-name = 'bolditalicHLC'] | *[@data-name = $DZP][descendant::span[@data-Bold = 'REMOVE' or @data-bold = 'REMOVE']]//span[@data-name = 'underlineboldHLC']">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:attribute name="data-name">
				<xsl:value-of select="replace(@data-name,'bold','')"/>
			</xsl:attribute>
			<xsl:apply-templates select="node()"/>
		</xsl:copy>
	</xsl:template>
	

	<xsl:template match="*[@data-name = $DZP][descendant::span[@data-Underline = 'REMOVE']]//u | *[@data-name = $DZP][descendant::span[@data-Underline = 'REMOVE']]//underline | *[@data-name = $DZP][descendant::span[@data-Underline = 'REMOVE']]//span[contains(@style, 'font-style:underline') or contains(@style, 'font-weight:underline')][not(@data-name)] | *[@data-name = $DZP][descendant::span[@data-Underline = 'REMOVE']]//span[@data-name = 'underline'] | *[@data-name = $DZP][descendant::span[@data-Underline = 'REMOVE']]//span[@data-name = 'underlineHLC']">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="*[@data-name = $DZP][descendant::span[@data-underline = 'REMOVE']]//u | *[@data-name = $DZP][descendant::span[@data-underline = 'REMOVE']]//underline | *[@data-name = $DZP][descendant::span[@data-underline = 'REMOVE']]//span[contains(@style, 'font-style:underline') or contains(@style, 'font-weight:underline')][not(@data-name)] | *[@data-name = $DZP][descendant::span[@data-underline = 'REMOVE']]//span[@data-name = 'underline'] | *[@data-name = $DZP][descendant::span[@data-underline = 'REMOVE']]//span[@data-name = 'underlineHLC']">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="*[@data-name = $DZP][descendant::span[@data-Underline = 'REMOVE' or @data-underline = 'REMOVE']]//span[@data-name = 'bolditalicunderlineHLC'] | *[@data-name = $DZP][descendant::span[@data-Underline = 'REMOVE' or @data-underline = 'REMOVE']]//span[@data-name = 'italicunderlineHLC'] | *[@data-name = $DZP][descendant::span[@data-Underline = 'REMOVE' or @data-underline = 'REMOVE']]//span[@data-name = 'underlineboldHLC']">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:attribute name="data-name">
				<xsl:value-of select="replace(@data-name,'underline','')"/>
			</xsl:attribute>
			<xsl:apply-templates select="node()"/>
		</xsl:copy>
	</xsl:template>
	
	<!-- Without style collection -->

	<xsl:template match="*[@data-name = 'ChapterTitle' or @data-name = 'TitleHead' or @data-name = 'RunningHeadText' or @data-name = 'AuthorHeading' or @data-name = 'EMailAddressHead' or @data-name = 'Highlight' or @data-name = 'SupplementaryLegends' or @data-name = 'FigureLegends' or @data-name = 'TableCaptions' or @data-name = 'ImageCaptions' or @data-name = 'PhotoCaptions' or @data-name = 'BoxTitles' or @data-name = 'SchemeLegends' or @data-name = 'StructureLegends' or @data-name = 'ExhibitCaptions' or @data-name = 'AppendixCaptions' or @data-name = 'SeriesHeadings' or @data-name = 'DisplayHeadings' or @data-name = 'ListHead' or @data-name = 'AbbreviationList' or @data-name = 'AcronymHead' or @data-name = 'AbbreviationHead' or @data-name = 'AcronymHead' or @data-name = 'GraphicalAbstract' or @data-name = 'ReferencesHeading1' or @data-name = 'Acknowledgements' or @data-name = 'KeyTermHead' or @data-name = 'KeyTermHead' or @data-name = 'Heading' or @data-name = 'Head1' or @data-name = 'Head2' or @data-name = 'Head3' or @data-name = 'Head4' or @data-name = 'Head5' or @data-name = 'Head6' or @data-name = 'Head7' or @data-name='ChapterNumber' or @data-name='FigureLegend' or @data-name='TableCaption'][descendant::span[@data-Italic = 'REMOVE']]//i | *[@data-name = 'ChapterTitle' or @data-name = 'TitleHead' or @data-name = 'RunningHeadText' or @data-name = 'AuthorHeading' or @data-name = 'EMailAddressHead' or @data-name = 'Highlight' or @data-name = 'SupplementaryLegends' or @data-name = 'FigureLegends' or @data-name = 'TableCaptions' or @data-name = 'ImageCaptions' or @data-name = 'PhotoCaptions' or @data-name = 'BoxTitles' or @data-name = 'SchemeLegends' or @data-name = 'StructureLegends' or @data-name = 'ExhibitCaptions' or @data-name = 'AppendixCaptions' or @data-name = 'SeriesHeadings' or @data-name = 'DisplayHeadings' or @data-name = 'ListHead' or @data-name = 'AbbreviationList' or @data-name = 'AcronymHead' or @data-name = 'AbbreviationHead' or @data-name = 'AcronymHead' or @data-name = 'GraphicalAbstract' or @data-name = 'ReferencesHeading1' or @data-name = 'Acknowledgements' or @data-name = 'KeyTermHead' or @data-name = 'KeyTermHead' or @data-name = 'Heading' or @data-name = 'Head1' or @data-name = 'Head2' or @data-name = 'Head3' or @data-name = 'Head4' or @data-name = 'Head5' or @data-name = 'Head6' or @data-name = 'Head7' or @data-name='ChapterNumber' or @data-name='FigureLegend' or @data-name='TableCaption'][descendant::span[@data-Italic = 'REMOVE']]//italic | *[@data-name = 'ChapterTitle' or @data-name = 'TitleHead' or @data-name = 'RunningHeadText' or @data-name = 'AuthorHeading' or @data-name = 'EMailAddressHead' or @data-name = 'Highlight' or @data-name = 'SupplementaryLegends' or @data-name = 'FigureLegends' or @data-name = 'TableCaptions' or @data-name = 'ImageCaptions' or @data-name = 'PhotoCaptions' or @data-name = 'BoxTitles' or @data-name = 'SchemeLegends' or @data-name = 'StructureLegends' or @data-name = 'ExhibitCaptions' or @data-name = 'AppendixCaptions' or @data-name = 'SeriesHeadings' or @data-name = 'DisplayHeadings' or @data-name = 'ListHead' or @data-name = 'AbbreviationList' or @data-name = 'AcronymHead' or @data-name = 'AbbreviationHead' or @data-name = 'AcronymHead' or @data-name = 'GraphicalAbstract' or @data-name = 'ReferencesHeading1' or @data-name = 'Acknowledgements' or @data-name = 'KeyTermHead' or @data-name = 'KeyTermHead' or @data-name = 'Heading' or @data-name = 'Head1' or @data-name = 'Head2' or @data-name = 'Head3' or @data-name = 'Head4' or @data-name = 'Head5' or @data-name = 'Head6' or @data-name = 'Head7' or @data-name='ChapterNumber' or @data-name='FigureLegend' or @data-name='TableCaption'][descendant::span[@data-Italic = 'REMOVE']]//span[contains(@style, 'font-style:italic') or contains(@style, 'font-weight:italic')][not(@class)] | *[@data-name = 'ChapterTitle' or @data-name = 'TitleHead' or @data-name = 'RunningHeadText' or @data-name = 'AuthorHeading' or @data-name = 'EMailAddressHead' or @data-name = 'Highlight' or @data-name = 'SupplementaryLegends' or @data-name = 'FigureLegends' or @data-name = 'TableCaptions' or @data-name = 'ImageCaptions' or @data-name = 'PhotoCaptions' or @data-name = 'BoxTitles' or @data-name = 'SchemeLegends' or @data-name = 'StructureLegends' or @data-name = 'ExhibitCaptions' or @data-name = 'AppendixCaptions' or @data-name = 'SeriesHeadings' or @data-name = 'DisplayHeadings' or @data-name = 'ListHead' or @data-name = 'AbbreviationList' or @data-name = 'AcronymHead' or @data-name = 'AbbreviationHead' or @data-name = 'AcronymHead' or @data-name = 'GraphicalAbstract' or @data-name = 'ReferencesHeading1' or @data-name = 'Acknowledgements' or @data-name = 'KeyTermHead' or @data-name = 'KeyTermHead' or @data-name = 'Heading' or @data-name = 'Head1' or @data-name = 'Head2' or @data-name = 'Head3' or @data-name = 'Head4' or @data-name = 'Head5' or @data-name = 'Head6' or @data-name = 'Head7' or @data-name='ChapterNumber' or @data-name='FigureLegend' or @data-name='TableCaption'][descendant::span[@data-Italic = 'REMOVE']]//span[@class = 'italic'] | *[@data-name = 'ChapterTitle' or @data-name = 'TitleHead' or @data-name = 'RunningHeadText' or @data-name = 'AuthorHeading' or @data-name = 'EMailAddressHead' or @data-name = 'Highlight' or @data-name = 'SupplementaryLegends' or @data-name = 'FigureLegends' or @data-name = 'TableCaptions' or @data-name = 'ImageCaptions' or @data-name = 'PhotoCaptions' or @data-name = 'BoxTitles' or @data-name = 'SchemeLegends' or @data-name = 'StructureLegends' or @data-name = 'ExhibitCaptions' or @data-name = 'AppendixCaptions' or @data-name = 'SeriesHeadings' or @data-name = 'DisplayHeadings' or @data-name = 'ListHead' or @data-name = 'AbbreviationList' or @data-name = 'AcronymHead' or @data-name = 'AbbreviationHead' or @data-name = 'AcronymHead' or @data-name = 'GraphicalAbstract' or @data-name = 'ReferencesHeading1' or @data-name = 'Acknowledgements' or @data-name = 'KeyTermHead' or @data-name = 'KeyTermHead' or @data-name = 'Heading' or @data-name = 'Head1' or @data-name = 'Head2' or @data-name = 'Head3' or @data-name = 'Head4' or @data-name = 'Head5' or @data-name = 'Head6' or @data-name = 'Head7'or @data-name='ChapterNumber' or @data-name='FigureLegend' or @data-name='TableCaption'][descendant::span[@data-Italic = 'REMOVE']]//span[@class = 'italicHLC']">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="*[@data-name = 'ChapterTitle' or @data-name = 'TitleHead' or @data-name = 'RunningHeadText' or @data-name = 'AuthorHeading' or @data-name = 'EMailAddressHead' or @data-name = 'Highlight' or @data-name = 'SupplementaryLegends' or @data-name = 'FigureLegends' or @data-name = 'TableCaptions' or @data-name = 'ImageCaptions' or @data-name = 'PhotoCaptions' or @data-name = 'BoxTitles' or @data-name = 'SchemeLegends' or @data-name = 'StructureLegends' or @data-name = 'ExhibitCaptions' or @data-name = 'AppendixCaptions' or @data-name = 'SeriesHeadings' or @data-name = 'DisplayHeadings' or @data-name = 'ListHead' or @data-name = 'AbbreviationList' or @data-name = 'AcronymHead' or @data-name = 'AbbreviationHead' or @data-name = 'AcronymHead' or @data-name = 'GraphicalAbstract' or @data-name = 'ReferencesHeading1' or @data-name = 'Acknowledgements' or @data-name = 'KeyTermHead' or @data-name = 'KeyTermHead' or @data-name = 'Heading' or @data-name = 'Head1' or @data-name = 'Head2' or @data-name = 'Head3' or @data-name = 'Head4' or @data-name = 'Head5' or @data-name = 'Head6' or @data-name = 'Head7' or @data-name='ChapterNumber' or @data-name='FigureLegend' or @data-name='TableCaption'][descendant::span[@data-italic = 'REMOVE']]//i | *[@data-name = 'ChapterTitle' or @data-name = 'TitleHead' or @data-name = 'RunningHeadText' or @data-name = 'AuthorHeading' or @data-name = 'EMailAddressHead' or @data-name = 'Highlight' or @data-name = 'SupplementaryLegends' or @data-name = 'FigureLegends' or @data-name = 'TableCaptions' or @data-name = 'ImageCaptions' or @data-name = 'PhotoCaptions' or @data-name = 'BoxTitles' or @data-name = 'SchemeLegends' or @data-name = 'StructureLegends' or @data-name = 'ExhibitCaptions' or @data-name = 'AppendixCaptions' or @data-name = 'SeriesHeadings' or @data-name = 'DisplayHeadings' or @data-name = 'ListHead' or @data-name = 'AbbreviationList' or @data-name = 'AcronymHead' or @data-name = 'AbbreviationHead' or @data-name = 'AcronymHead' or @data-name = 'GraphicalAbstract' or @data-name = 'ReferencesHeading1' or @data-name = 'Acknowledgements' or @data-name = 'KeyTermHead' or @data-name = 'KeyTermHead' or @data-name = 'Heading' or @data-name = 'Head1' or @data-name = 'Head2' or @data-name = 'Head3' or @data-name = 'Head4' or @data-name = 'Head5' or @data-name = 'Head6' or @data-name = 'Head7' or @data-name='ChapterNumber' or @data-name='FigureLegend' or @data-name='TableCaption'][descendant::span[@data-italic = 'REMOVE']]//italic | *[@data-name = 'ChapterTitle' or @data-name = 'TitleHead' or @data-name = 'RunningHeadText' or @data-name = 'AuthorHeading' or @data-name = 'EMailAddressHead' or @data-name = 'Highlight' or @data-name = 'SupplementaryLegends' or @data-name = 'FigureLegends' or @data-name = 'TableCaptions' or @data-name = 'ImageCaptions' or @data-name = 'PhotoCaptions' or @data-name = 'BoxTitles' or @data-name = 'SchemeLegends' or @data-name = 'StructureLegends' or @data-name = 'ExhibitCaptions' or @data-name = 'AppendixCaptions' or @data-name = 'SeriesHeadings' or @data-name = 'DisplayHeadings' or @data-name = 'ListHead' or @data-name = 'AbbreviationList' or @data-name = 'AcronymHead' or @data-name = 'AbbreviationHead' or @data-name = 'AcronymHead' or @data-name = 'GraphicalAbstract' or @data-name = 'ReferencesHeading1' or @data-name = 'Acknowledgements' or @data-name = 'KeyTermHead' or @data-name = 'KeyTermHead' or @data-name = 'Heading' or @data-name = 'Head1' or @data-name = 'Head2' or @data-name = 'Head3' or @data-name = 'Head4' or @data-name = 'Head5' or @data-name = 'Head6' or @data-name = 'Head7' or @data-name='ChapterNumber' or @data-name='FigureLegend' or @data-name='TableCaption'][descendant::span[@data-italic = 'REMOVE']]//span[contains(@style, 'font-style:italic') or contains(@style, 'font-weight:italic')][not(@class)] | *[@data-name = 'ChapterTitle' or @data-name = 'TitleHead' or @data-name = 'RunningHeadText' or @data-name = 'AuthorHeading' or @data-name = 'EMailAddressHead' or @data-name = 'Highlight' or @data-name = 'SupplementaryLegends' or @data-name = 'FigureLegends' or @data-name = 'TableCaptions' or @data-name = 'ImageCaptions' or @data-name = 'PhotoCaptions' or @data-name = 'BoxTitles' or @data-name = 'SchemeLegends' or @data-name = 'StructureLegends' or @data-name = 'ExhibitCaptions' or @data-name = 'AppendixCaptions' or @data-name = 'SeriesHeadings' or @data-name = 'DisplayHeadings' or @data-name = 'ListHead' or @data-name = 'AbbreviationList' or @data-name = 'AcronymHead' or @data-name = 'AbbreviationHead' or @data-name = 'AcronymHead' or @data-name = 'GraphicalAbstract' or @data-name = 'ReferencesHeading1' or @data-name = 'Acknowledgements' or @data-name = 'KeyTermHead' or @data-name = 'KeyTermHead' or @data-name = 'Heading' or @data-name = 'Head1' or @data-name = 'Head2' or @data-name = 'Head3' or @data-name = 'Head4' or @data-name = 'Head5' or @data-name = 'Head6' or @data-name = 'Head7' or @data-name='ChapterNumber' or @data-name='FigureLegend' or @data-name='TableCaption'][descendant::span[@data-italic = 'REMOVE']]//span[@class = 'italic'] | *[@data-name = 'ChapterTitle' or @data-name = 'TitleHead' or @data-name = 'RunningHeadText' or @data-name = 'AuthorHeading' or @data-name = 'EMailAddressHead' or @data-name = 'Highlight' or @data-name = 'SupplementaryLegends' or @data-name = 'FigureLegends' or @data-name = 'TableCaptions' or @data-name = 'ImageCaptions' or @data-name = 'PhotoCaptions' or @data-name = 'BoxTitles' or @data-name = 'SchemeLegends' or @data-name = 'StructureLegends' or @data-name = 'ExhibitCaptions' or @data-name = 'AppendixCaptions' or @data-name = 'SeriesHeadings' or @data-name = 'DisplayHeadings' or @data-name = 'ListHead' or @data-name = 'AbbreviationList' or @data-name = 'AcronymHead' or @data-name = 'AbbreviationHead' or @data-name = 'AcronymHead' or @data-name = 'GraphicalAbstract' or @data-name = 'ReferencesHeading1' or @data-name = 'Acknowledgements' or @data-name = 'KeyTermHead' or @data-name = 'KeyTermHead' or @data-name = 'Heading' or @data-name = 'Head1' or @data-name = 'Head2' or @data-name = 'Head3' or @data-name = 'Head4' or @data-name = 'Head5' or @data-name = 'Head6' or @data-name = 'Head7' or @data-name='ChapterNumber' or @data-name='FigureLegend' or @data-name='TableCaption'][descendant::span[@data-italic = 'REMOVE']]//span[@class = 'italicHLC']">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="*[@data-name = 'ChapterTitle' or @data-name = 'TitleHead' or @data-name = 'RunningHeadText' or @data-name = 'AuthorHeading' or @data-name = 'EMailAddressHead' or @data-name = 'Highlight' or @data-name = 'SupplementaryLegends' or @data-name = 'FigureLegends' or @data-name = 'TableCaptions' or @data-name = 'ImageCaptions' or @data-name = 'PhotoCaptions' or @data-name = 'BoxTitles' or @data-name = 'SchemeLegends' or @data-name = 'StructureLegends' or @data-name = 'ExhibitCaptions' or @data-name = 'AppendixCaptions' or @data-name = 'SeriesHeadings' or @data-name = 'DisplayHeadings' or @data-name = 'ListHead' or @data-name = 'AbbreviationList' or @data-name = 'AcronymHead' or @data-name = 'AbbreviationHead' or @data-name = 'AcronymHead' or @data-name = 'GraphicalAbstract' or @data-name = 'ReferencesHeading1' or @data-name = 'Acknowledgements' or @data-name = 'KeyTermHead' or @data-name = 'KeyTermHead' or @data-name = 'Heading' or @data-name = 'Head1' or @data-name = 'Head2' or @data-name = 'Head3' or @data-name = 'Head4' or @data-name = 'Head5' or @data-name = 'Head6' or @data-name = 'Head7' or @data-name='ChapterNumber' or @data-name='FigureLegend' or @data-name='TableCaption'][descendant::span[@data-Italic = 'REMOVE' or @data-italic = 'REMOVE']]//span[@class = 'bolditalicunderlineHLC'] | *[@data-name = 'ChapterTitle' or @data-name = 'TitleHead' or @data-name = 'RunningHeadText' or @data-name = 'AuthorHeading' or @data-name = 'EMailAddressHead' or @data-name = 'Highlight' or @data-name = 'SupplementaryLegends' or @data-name = 'FigureLegends' or @data-name = 'TableCaptions' or @data-name = 'ImageCaptions' or @data-name = 'PhotoCaptions' or @data-name = 'BoxTitles' or @data-name = 'SchemeLegends' or @data-name = 'StructureLegends' or @data-name = 'ExhibitCaptions' or @data-name = 'AppendixCaptions' or @data-name = 'SeriesHeadings' or @data-name = 'DisplayHeadings' or @data-name = 'ListHead' or @data-name = 'AbbreviationList' or @data-name = 'AcronymHead' or @data-name = 'AbbreviationHead' or @data-name = 'AcronymHead' or @data-name = 'GraphicalAbstract' or @data-name = 'ReferencesHeading1' or @data-name = 'Acknowledgements' or @data-name = 'KeyTermHead' or @data-name = 'KeyTermHead' or @data-name = 'Heading' or @data-name = 'Head1' or @data-name = 'Head2' or @data-name = 'Head3' or @data-name = 'Head4' or @data-name = 'Head5' or @data-name = 'Head6' or @data-name = 'Head7' or @data-name='ChapterNumber' or @data-name='FigureLegend' or @data-name='TableCaption'][descendant::span[@data-Italic = 'REMOVE' or @data-italic = 'REMOVE']]//span[@class = 'bolditalicHLC']">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:attribute name="data-name">
				<xsl:value-of select="replace(@data-name,'italic','')"/>
			</xsl:attribute>
			<xsl:apply-templates select="node()"/>
		</xsl:copy>
	</xsl:template>
	
	<xsl:template match="*[@data-name = 'ChapterTitle' or @data-name = 'TitleHead' or @data-name = 'RunningHeadText' or @data-name = 'AuthorHeading' or @data-name = 'EMailAddressHead' or @data-name = 'Highlight' or @data-name = 'SupplementaryLegends' or @data-name = 'FigureLegends' or @data-name = 'TableCaptions' or @data-name = 'ImageCaptions' or @data-name = 'PhotoCaptions' or @data-name = 'BoxTitles' or @data-name = 'SchemeLegends' or @data-name = 'StructureLegends' or @data-name = 'ExhibitCaptions' or @data-name = 'AppendixCaptions' or @data-name = 'SeriesHeadings' or @data-name = 'DisplayHeadings' or @data-name = 'ListHead' or @data-name = 'AbbreviationList' or @data-name = 'AcronymHead' or @data-name = 'AbbreviationHead' or @data-name = 'AcronymHead' or @data-name = 'GraphicalAbstract' or @data-name = 'ReferencesHeading1' or @data-name = 'Acknowledgements' or @data-name = 'KeyTermHead' or @data-name = 'KeyTermHead' or @data-name = 'Heading' or @data-name = 'Head1' or @data-name = 'Head2' or @data-name = 'Head3' or @data-name = 'Head4' or @data-name = 'Head5' or @data-name = 'Head6' or @data-name = 'Head7' or @data-name='ChapterNumber' or @data-name='FigureLegend' or @data-name='TableCaption'][descendant::span[@data-Bold = 'REMOVE']]//b | *[@data-name = 'ChapterTitle' or @data-name = 'TitleHead' or @data-name = 'RunningHeadText' or @data-name = 'AuthorHeading' or @data-name = 'EMailAddressHead' or @data-name = 'Highlight' or @data-name = 'SupplementaryLegends' or @data-name = 'FigureLegends' or @data-name = 'TableCaptions' or @data-name = 'ImageCaptions' or @data-name = 'PhotoCaptions' or @data-name = 'BoxTitles' or @data-name = 'SchemeLegends' or @data-name = 'StructureLegends' or @data-name = 'ExhibitCaptions' or @data-name = 'AppendixCaptions' or @data-name = 'SeriesHeadings' or @data-name = 'DisplayHeadings' or @data-name = 'ListHead' or @data-name = 'AbbreviationList' or @data-name = 'AcronymHead' or @data-name = 'AbbreviationHead' or @data-name = 'AcronymHead' or @data-name = 'GraphicalAbstract' or @data-name = 'ReferencesHeading1' or @data-name = 'Acknowledgements' or @data-name = 'KeyTermHead' or @data-name = 'KeyTermHead' or @data-name = 'Heading' or @data-name = 'Head1' or @data-name = 'Head2' or @data-name = 'Head3' or @data-name = 'Head4' or @data-name = 'Head5' or @data-name = 'Head6' or @data-name = 'Head7' or @data-name='ChapterNumber' or @data-name='FigureLegend' or @data-name='TableCaption'][descendant::span[@data-Bold = 'REMOVE']]//bold | *[@data-name = 'ChapterTitle' or @data-name = 'TitleHead' or @data-name = 'RunningHeadText' or @data-name = 'AuthorHeading' or @data-name = 'EMailAddressHead' or @data-name = 'Highlight' or @data-name = 'SupplementaryLegends' or @data-name = 'FigureLegends' or @data-name = 'TableCaptions' or @data-name = 'ImageCaptions' or @data-name = 'PhotoCaptions' or @data-name = 'BoxTitles' or @data-name = 'SchemeLegends' or @data-name = 'StructureLegends' or @data-name = 'ExhibitCaptions' or @data-name = 'AppendixCaptions' or @data-name = 'SeriesHeadings' or @data-name = 'DisplayHeadings' or @data-name = 'ListHead' or @data-name = 'AbbreviationList' or @data-name = 'AcronymHead' or @data-name = 'AbbreviationHead' or @data-name = 'AcronymHead' or @data-name = 'GraphicalAbstract' or @data-name = 'ReferencesHeading1' or @data-name = 'Acknowledgements' or @data-name = 'KeyTermHead' or @data-name = 'KeyTermHead' or @data-name = 'Heading' or @data-name = 'Head1' or @data-name = 'Head2' or @data-name = 'Head3' or @data-name = 'Head4' or @data-name = 'Head5' or @data-name = 'Head6' or @data-name = 'Head7' or @data-name='ChapterNumber' or @data-name='FigureLegend' or @data-name='TableCaption'][descendant::span[@data-Bold = 'REMOVE']]//span[contains(@style, 'font-style:bold') or contains(@style, 'font-weight:bold')][not(@class)] | *[@data-name = 'ChapterTitle' or @data-name = 'TitleHead' or @data-name = 'RunningHeadText' or @data-name = 'AuthorHeading' or @data-name = 'EMailAddressHead' or @data-name = 'Highlight' or @data-name = 'SupplementaryLegends' or @data-name = 'FigureLegends' or @data-name = 'TableCaptions' or @data-name = 'ImageCaptions' or @data-name = 'PhotoCaptions' or @data-name = 'BoxTitles' or @data-name = 'SchemeLegends' or @data-name = 'StructureLegends' or @data-name = 'ExhibitCaptions' or @data-name = 'AppendixCaptions' or @data-name = 'SeriesHeadings' or @data-name = 'DisplayHeadings' or @data-name = 'ListHead' or @data-name = 'AbbreviationList' or @data-name = 'AcronymHead' or @data-name = 'AbbreviationHead' or @data-name = 'AcronymHead' or @data-name = 'GraphicalAbstract' or @data-name = 'ReferencesHeading1' or @data-name = 'Acknowledgements' or @data-name = 'KeyTermHead' or @data-name = 'KeyTermHead' or @data-name = 'Heading' or @data-name = 'Head1' or @data-name = 'Head2' or @data-name = 'Head3' or @data-name = 'Head4' or @data-name = 'Head5' or @data-name = 'Head6' or @data-name = 'Head7' or @data-name='ChapterNumber' or @data-name='FigureLegend' or @data-name='TableCaption'][descendant::span[@data-Bold = 'REMOVE']]//span[@class = 'bold'] | *[@data-name = 'ChapterTitle' or @data-name = 'TitleHead' or @data-name = 'RunningHeadText' or @data-name = 'AuthorHeading' or @data-name = 'EMailAddressHead' or @data-name = 'Highlight' or @data-name = 'SupplementaryLegends' or @data-name = 'FigureLegends' or @data-name = 'TableCaptions' or @data-name = 'ImageCaptions' or @data-name = 'PhotoCaptions' or @data-name = 'BoxTitles' or @data-name = 'SchemeLegends' or @data-name = 'StructureLegends' or @data-name = 'ExhibitCaptions' or @data-name = 'AppendixCaptions' or @data-name = 'SeriesHeadings' or @data-name = 'DisplayHeadings' or @data-name = 'ListHead' or @data-name = 'AbbreviationList' or @data-name = 'AcronymHead' or @data-name = 'AbbreviationHead' or @data-name = 'AcronymHead' or @data-name = 'GraphicalAbstract' or @data-name = 'ReferencesHeading1' or @data-name = 'Acknowledgements' or @data-name = 'KeyTermHead' or @data-name = 'KeyTermHead' or @data-name = 'Heading' or @data-name = 'Head1' or @data-name = 'Head2' or @data-name = 'Head3' or @data-name = 'Head4' or @data-name = 'Head5' or @data-name = 'Head6' or @data-name = 'Head7' or @data-name='ChapterNumber' or @data-name='FigureLegend' or @data-name='TableCaption'][descendant::span[@data-Bold = 'REMOVE']]//span[@class = 'boldHLC']">
		
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="*[@data-name = 'ChapterTitle' or @data-name = 'TitleHead' or @data-name = 'RunningHeadText' or @data-name = 'AuthorHeading' or @data-name = 'EMailAddressHead' or @data-name = 'Highlight' or @data-name = 'SupplementaryLegends' or @data-name = 'FigureLegends' or @data-name = 'TableCaptions' or @data-name = 'ImageCaptions' or @data-name = 'PhotoCaptions' or @data-name = 'BoxTitles' or @data-name = 'SchemeLegends' or @data-name = 'StructureLegends' or @data-name = 'ExhibitCaptions' or @data-name = 'AppendixCaptions' or @data-name = 'SeriesHeadings' or @data-name = 'DisplayHeadings' or @data-name = 'ListHead' or @data-name = 'AbbreviationList' or @data-name = 'AcronymHead' or @data-name = 'AbbreviationHead' or @data-name = 'AcronymHead' or @data-name = 'GraphicalAbstract' or @data-name = 'ReferencesHeading1' or @data-name = 'Acknowledgements' or @data-name = 'KeyTermHead' or @data-name = 'KeyTermHead' or @data-name = 'Heading' or @data-name = 'Head1' or @data-name = 'Head2' or @data-name = 'Head3' or @data-name = 'Head4' or @data-name = 'Head5' or @data-name = 'Head6' or @data-name = 'Head7' or @data-name='ChapterNumber' or @data-name='FigureLegend' or @data-name='TableCaption'][descendant::span[@data-bold = 'REMOVE']]//b | *[@data-name = 'ChapterTitle' or @data-name = 'TitleHead' or @data-name = 'RunningHeadText' or @data-name = 'AuthorHeading' or @data-name = 'EMailAddressHead' or @data-name = 'Highlight' or @data-name = 'SupplementaryLegends' or @data-name = 'FigureLegends' or @data-name = 'TableCaptions' or @data-name = 'ImageCaptions' or @data-name = 'PhotoCaptions' or @data-name = 'BoxTitles' or @data-name = 'SchemeLegends' or @data-name = 'StructureLegends' or @data-name = 'ExhibitCaptions' or @data-name = 'AppendixCaptions' or @data-name = 'SeriesHeadings' or @data-name = 'DisplayHeadings' or @data-name = 'ListHead' or @data-name = 'AbbreviationList' or @data-name = 'AcronymHead' or @data-name = 'AbbreviationHead' or @data-name = 'AcronymHead' or @data-name = 'GraphicalAbstract' or @data-name = 'ReferencesHeading1' or @data-name = 'Acknowledgements' or @data-name = 'KeyTermHead' or @data-name = 'KeyTermHead' or @data-name = 'Heading' or @data-name = 'Head1' or @data-name = 'Head2' or @data-name = 'Head3' or @data-name = 'Head4' or @data-name = 'Head5' or @data-name = 'Head6' or @data-name = 'Head7' or @data-name='ChapterNumber' or @data-name='FigureLegend' or @data-name='TableCaption'][descendant::span[@data-bold = 'REMOVE']]//bold | *[@data-name = 'ChapterTitle' or @data-name = 'TitleHead' or @data-name = 'RunningHeadText' or @data-name = 'AuthorHeading' or @data-name = 'EMailAddressHead' or @data-name = 'Highlight' or @data-name = 'SupplementaryLegends' or @data-name = 'FigureLegends' or @data-name = 'TableCaptions' or @data-name = 'ImageCaptions' or @data-name = 'PhotoCaptions' or @data-name = 'BoxTitles' or @data-name = 'SchemeLegends' or @data-name = 'StructureLegends' or @data-name = 'ExhibitCaptions' or @data-name = 'AppendixCaptions' or @data-name = 'SeriesHeadings' or @data-name = 'DisplayHeadings' or @data-name = 'ListHead' or @data-name = 'AbbreviationList' or @data-name = 'AcronymHead' or @data-name = 'AbbreviationHead' or @data-name = 'AcronymHead' or @data-name = 'GraphicalAbstract' or @data-name = 'ReferencesHeading1' or @data-name = 'Acknowledgements' or @data-name = 'KeyTermHead' or @data-name = 'KeyTermHead' or @data-name = 'Heading' or @data-name = 'Head1' or @data-name = 'Head2' or @data-name = 'Head3' or @data-name = 'Head4' or @data-name = 'Head5' or @data-name = 'Head6' or @data-name = 'Head7' or @data-name='ChapterNumber' or @data-name='FigureLegend' or @data-name='TableCaption'][descendant::span[@data-bold = 'REMOVE']]//span[contains(@style, 'font-style:bold') or contains(@style, 'font-weight:bold')][not(@class)] | *[@data-name = 'ChapterTitle' or @data-name = 'TitleHead' or @data-name = 'RunningHeadText' or @data-name = 'AuthorHeading' or @data-name = 'EMailAddressHead' or @data-name = 'Highlight' or @data-name = 'SupplementaryLegends' or @data-name = 'FigureLegends' or @data-name = 'TableCaptions' or @data-name = 'ImageCaptions' or @data-name = 'PhotoCaptions' or @data-name = 'BoxTitles' or @data-name = 'SchemeLegends' or @data-name = 'StructureLegends' or @data-name = 'ExhibitCaptions' or @data-name = 'AppendixCaptions' or @data-name = 'SeriesHeadings' or @data-name = 'DisplayHeadings' or @data-name = 'ListHead' or @data-name = 'AbbreviationList' or @data-name = 'AcronymHead' or @data-name = 'AbbreviationHead' or @data-name = 'AcronymHead' or @data-name = 'GraphicalAbstract' or @data-name = 'ReferencesHeading1' or @data-name = 'Acknowledgements' or @data-name = 'KeyTermHead' or @data-name = 'KeyTermHead' or @data-name = 'Heading' or @data-name = 'Head1' or @data-name = 'Head2' or @data-name = 'Head3' or @data-name = 'Head4' or @data-name = 'Head5' or @data-name = 'Head6' or @data-name = 'Head7' or @data-name='ChapterNumber' or @data-name='FigureLegend' or @data-name='TableCaption'][descendant::span[@data-bold = 'REMOVE']]//span[@class = 'bold'] | *[@data-name = 'ChapterTitle' or @data-name = 'TitleHead' or @data-name = 'RunningHeadText' or @data-name = 'AuthorHeading' or @data-name = 'EMailAddressHead' or @data-name = 'Highlight' or @data-name = 'SupplementaryLegends' or @data-name = 'FigureLegends' or @data-name = 'TableCaptions' or @data-name = 'ImageCaptions' or @data-name = 'PhotoCaptions' or @data-name = 'BoxTitles' or @data-name = 'SchemeLegends' or @data-name = 'StructureLegends' or @data-name = 'ExhibitCaptions' or @data-name = 'AppendixCaptions' or @data-name = 'SeriesHeadings' or @data-name = 'DisplayHeadings' or @data-name = 'ListHead' or @data-name = 'AbbreviationList' or @data-name = 'AcronymHead' or @data-name = 'AbbreviationHead' or @data-name = 'AcronymHead' or @data-name = 'GraphicalAbstract' or @data-name = 'ReferencesHeading1' or @data-name = 'Acknowledgements' or @data-name = 'KeyTermHead' or @data-name = 'KeyTermHead' or @data-name = 'Heading' or @data-name = 'Head1' or @data-name = 'Head2' or @data-name = 'Head3' or @data-name = 'Head4' or @data-name = 'Head5' or @data-name = 'Head6' or @data-name = 'Head7' or @data-name='ChapterNumber' or @data-name='FigureLegend' or @data-name='TableCaption'][descendant::span[@data-bold = 'REMOVE']]//span[@class = 'boldHLC']">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="*[@data-name = 'ChapterTitle' or @data-name = 'TitleHead' or @data-name = 'RunningHeadText' or @data-name = 'AuthorHeading' or @data-name = 'EMailAddressHead' or @data-name = 'Highlight' or @data-name = 'SupplementaryLegends' or @data-name = 'FigureLegends' or @data-name = 'TableCaptions' or @data-name = 'ImageCaptions' or @data-name = 'PhotoCaptions' or @data-name = 'BoxTitles' or @data-name = 'SchemeLegends' or @data-name = 'StructureLegends' or @data-name = 'ExhibitCaptions' or @data-name = 'AppendixCaptions' or @data-name = 'SeriesHeadings' or @data-name = 'DisplayHeadings' or @data-name = 'ListHead' or @data-name = 'AbbreviationList' or @data-name = 'AcronymHead' or @data-name = 'AbbreviationHead' or @data-name = 'AcronymHead' or @data-name = 'GraphicalAbstract' or @data-name = 'ReferencesHeading1' or @data-name = 'Acknowledgements' or @data-name = 'KeyTermHead' or @data-name = 'KeyTermHead' or @data-name = 'Heading' or @data-name = 'Head1' or @data-name = 'Head2' or @data-name = 'Head3' or @data-name = 'Head4' or @data-name = 'Head5' or @data-name = 'Head6' or @data-name = 'Head7' or @data-name='ChapterNumber' or @data-name='FigureLegend' or @data-name='TableCaption'][descendant::span[@data-Bold = 'REMOVE' or @data-bold = 'REMOVE']]//span[@class = 'bolditalicunderlineHLC'] | *[@data-name = 'ChapterTitle' or @data-name = 'TitleHead' or @data-name = 'RunningHeadText' or @data-name = 'AuthorHeading' or @data-name = 'EMailAddressHead' or @data-name = 'Highlight' or @data-name = 'SupplementaryLegends' or @data-name = 'FigureLegends' or @data-name = 'TableCaptions' or @data-name = 'ImageCaptions' or @data-name = 'PhotoCaptions' or @data-name = 'BoxTitles' or @data-name = 'SchemeLegends' or @data-name = 'StructureLegends' or @data-name = 'ExhibitCaptions' or @data-name = 'AppendixCaptions' or @data-name = 'SeriesHeadings' or @data-name = 'DisplayHeadings' or @data-name = 'ListHead' or @data-name = 'AbbreviationList' or @data-name = 'AcronymHead' or @data-name = 'AbbreviationHead' or @data-name = 'AcronymHead' or @data-name = 'GraphicalAbstract' or @data-name = 'ReferencesHeading1' or @data-name = 'Acknowledgements' or @data-name = 'KeyTermHead' or @data-name = 'KeyTermHead' or @data-name = 'Heading' or @data-name = 'Head1' or @data-name = 'Head2' or @data-name = 'Head3' or @data-name = 'Head4' or @data-name = 'Head5' or @data-name = 'Head6' or @data-name = 'Head7' or @data-name='ChapterNumber' or @data-name='FigureLegend' or @data-name='TableCaption'][descendant::span[@data-Bold = 'REMOVE' or @data-bold = 'REMOVE']]//span[@class = 'bolditalicHLC'] | *[@data-name = 'ChapterTitle' or @data-name = 'TitleHead' or @data-name = 'RunningHeadText' or @data-name = 'AuthorHeading' or @data-name = 'EMailAddressHead' or @data-name = 'Highlight' or @data-name = 'SupplementaryLegends' or @data-name = 'FigureLegends' or @data-name = 'TableCaptions' or @data-name = 'ImageCaptions' or @data-name = 'PhotoCaptions' or @data-name = 'BoxTitles' or @data-name = 'SchemeLegends' or @data-name = 'StructureLegends' or @data-name = 'ExhibitCaptions' or @data-name = 'AppendixCaptions' or @data-name = 'SeriesHeadings' or @data-name = 'DisplayHeadings' or @data-name = 'ListHead' or @data-name = 'AbbreviationList' or @data-name = 'AcronymHead' or @data-name = 'AbbreviationHead' or @data-name = 'AcronymHead' or @data-name = 'GraphicalAbstract' or @data-name = 'ReferencesHeading1' or @data-name = 'Acknowledgements' or @data-name = 'KeyTermHead' or @data-name = 'KeyTermHead' or @data-name = 'Heading' or @data-name = 'Head1' or @data-name = 'Head2' or @data-name = 'Head3' or @data-name = 'Head4' or @data-name = 'Head5' or @data-name = 'Head6' or @data-name = 'Head7' or @data-name='ChapterNumber' or @data-name='FigureLegend' or @data-name='TableCaption'][descendant::span[@data-Bold = 'REMOVE' or @data-bold = 'REMOVE']]//span[@class = 'underlineboldHLC']">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:attribute name="data-name">
				<xsl:value-of select="replace(@data-name,'bold','')"/>
			</xsl:attribute>
			<xsl:apply-templates select="node()"/>
		</xsl:copy>
	</xsl:template>
	
	
	<xsl:template match="*[@data-name = 'ChapterTitle' or @data-name = 'TitleHead' or @data-name = 'RunningHeadText' or @data-name = 'AuthorHeading' or @data-name = 'EMailAddressHead' or @data-name = 'Highlight' or @data-name = 'SupplementaryLegends' or @data-name = 'FigureLegends' or @data-name = 'TableCaptions' or @data-name = 'ImageCaptions' or @data-name = 'PhotoCaptions' or @data-name = 'BoxTitles' or @data-name = 'SchemeLegends' or @data-name = 'StructureLegends' or @data-name = 'ExhibitCaptions' or @data-name = 'AppendixCaptions' or @data-name = 'SeriesHeadings' or @data-name = 'DisplayHeadings' or @data-name = 'ListHead' or @data-name = 'AbbreviationList' or @data-name = 'AcronymHead' or @data-name = 'AbbreviationHead' or @data-name = 'AcronymHead' or @data-name = 'GraphicalAbstract' or @data-name = 'ReferencesHeading1' or @data-name = 'Acknowledgements' or @data-name = 'KeyTermHead' or @data-name = 'KeyTermHead' or @data-name = 'Heading' or @data-name = 'Head1' or @data-name = 'Head2' or @data-name = 'Head3' or @data-name = 'Head4' or @data-name = 'Head5' or @data-name = 'Head6' or @data-name = 'Head7' or @data-name='ChapterNumber' or @data-name='FigureLegend' or @data-name='TableCaption'][descendant::span[@data-Underline = 'REMOVE']]//u | *[@data-name = 'ChapterTitle' or @data-name = 'TitleHead' or @data-name = 'RunningHeadText' or @data-name = 'AuthorHeading' or @data-name = 'EMailAddressHead' or @data-name = 'Highlight' or @data-name = 'SupplementaryLegends' or @data-name = 'FigureLegends' or @data-name = 'TableCaptions' or @data-name = 'ImageCaptions' or @data-name = 'PhotoCaptions' or @data-name = 'BoxTitles' or @data-name = 'SchemeLegends' or @data-name = 'StructureLegends' or @data-name = 'ExhibitCaptions' or @data-name = 'AppendixCaptions' or @data-name = 'SeriesHeadings' or @data-name = 'DisplayHeadings' or @data-name = 'ListHead' or @data-name = 'AbbreviationList' or @data-name = 'AcronymHead' or @data-name = 'AbbreviationHead' or @data-name = 'AcronymHead' or @data-name = 'GraphicalAbstract' or @data-name = 'ReferencesHeading1' or @data-name = 'Acknowledgements' or @data-name = 'KeyTermHead' or @data-name = 'KeyTermHead' or @data-name = 'Heading' or @data-name = 'Head1' or @data-name = 'Head2' or @data-name = 'Head3' or @data-name = 'Head4' or @data-name = 'Head5' or @data-name = 'Head6' or @data-name = 'Head7' or @data-name='ChapterNumber' or @data-name='FigureLegend' or @data-name='TableCaption'][descendant::span[@data-Underline = 'REMOVE']]//underline | *[@data-name = 'ChapterTitle' or @data-name = 'TitleHead' or @data-name = 'RunningHeadText' or @data-name = 'AuthorHeading' or @data-name = 'EMailAddressHead' or @data-name = 'Highlight' or @data-name = 'SupplementaryLegends' or @data-name = 'FigureLegends' or @data-name = 'TableCaptions' or @data-name = 'ImageCaptions' or @data-name = 'PhotoCaptions' or @data-name = 'BoxTitles' or @data-name = 'SchemeLegends' or @data-name = 'StructureLegends' or @data-name = 'ExhibitCaptions' or @data-name = 'AppendixCaptions' or @data-name = 'SeriesHeadings' or @data-name = 'DisplayHeadings' or @data-name = 'ListHead' or @data-name = 'AbbreviationList' or @data-name = 'AcronymHead' or @data-name = 'AbbreviationHead' or @data-name = 'AcronymHead' or @data-name = 'GraphicalAbstract' or @data-name = 'ReferencesHeading1' or @data-name = 'Acknowledgements' or @data-name = 'KeyTermHead' or @data-name = 'KeyTermHead' or @data-name = 'Heading' or @data-name = 'Head1' or @data-name = 'Head2' or @data-name = 'Head3' or @data-name = 'Head4' or @data-name = 'Head5' or @data-name = 'Head6' or @data-name = 'Head7' or @data-name='ChapterNumber' or @data-name='FigureLegend' or @data-name='TableCaption'][descendant::span[@data-Underline = 'REMOVE']]//span[contains(@style, 'font-style:underline') or contains(@style, 'font-weight:underline')][not(@class)] | *[@data-name = 'ChapterTitle' or @data-name = 'TitleHead' or @data-name = 'RunningHeadText' or @data-name = 'AuthorHeading' or @data-name = 'EMailAddressHead' or @data-name = 'Highlight' or @data-name = 'SupplementaryLegends' or @data-name = 'FigureLegends' or @data-name = 'TableCaptions' or @data-name = 'ImageCaptions' or @data-name = 'PhotoCaptions' or @data-name = 'BoxTitles' or @data-name = 'SchemeLegends' or @data-name = 'StructureLegends' or @data-name = 'ExhibitCaptions' or @data-name = 'AppendixCaptions' or @data-name = 'SeriesHeadings' or @data-name = 'DisplayHeadings' or @data-name = 'ListHead' or @data-name = 'AbbreviationList' or @data-name = 'AcronymHead' or @data-name = 'AbbreviationHead' or @data-name = 'AcronymHead' or @data-name = 'GraphicalAbstract' or @data-name = 'ReferencesHeading1' or @data-name = 'Acknowledgements' or @data-name = 'KeyTermHead' or @data-name = 'KeyTermHead' or @data-name = 'Heading' or @data-name = 'Head1' or @data-name = 'Head2' or @data-name = 'Head3' or @data-name = 'Head4' or @data-name = 'Head5' or @data-name = 'Head6' or @data-name = 'Head7' or @data-name='ChapterNumber' or @data-name='FigureLegend' or @data-name='TableCaption'][descendant::span[@data-Underline = 'REMOVE']]//span[@class = 'underline'] | *[@data-name = 'ChapterTitle' or @data-name = 'TitleHead' or @data-name = 'RunningHeadText' or @data-name = 'AuthorHeading' or @data-name = 'EMailAddressHead' or @data-name = 'Highlight' or @data-name = 'SupplementaryLegends' or @data-name = 'FigureLegends' or @data-name = 'TableCaptions' or @data-name = 'ImageCaptions' or @data-name = 'PhotoCaptions' or @data-name = 'BoxTitles' or @data-name = 'SchemeLegends' or @data-name = 'StructureLegends' or @data-name = 'ExhibitCaptions' or @data-name = 'AppendixCaptions' or @data-name = 'SeriesHeadings' or @data-name = 'DisplayHeadings' or @data-name = 'ListHead' or @data-name = 'AbbreviationList' or @data-name = 'AcronymHead' or @data-name = 'AbbreviationHead' or @data-name = 'AcronymHead' or @data-name = 'GraphicalAbstract' or @data-name = 'ReferencesHeading1' or @data-name = 'Acknowledgements' or @data-name = 'KeyTermHead' or @data-name = 'KeyTermHead' or @data-name = 'Heading' or @data-name = 'Head1' or @data-name = 'Head2' or @data-name = 'Head3' or @data-name = 'Head4' or @data-name = 'Head5' or @data-name = 'Head6' or @data-name = 'Head7' or @data-name='ChapterNumber' or @data-name='FigureLegend' or @data-name='TableCaption'][descendant::span[@data-Underline = 'REMOVE']]//span[@class = 'underlineHLC']">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="*[@data-name = 'ChapterTitle' or @data-name = 'TitleHead' or @data-name = 'RunningHeadText' or @data-name = 'AuthorHeading' or @data-name = 'EMailAddressHead' or @data-name = 'Highlight' or @data-name = 'SupplementaryLegends' or @data-name = 'FigureLegends' or @data-name = 'TableCaptions' or @data-name = 'ImageCaptions' or @data-name = 'PhotoCaptions' or @data-name = 'BoxTitles' or @data-name = 'SchemeLegends' or @data-name = 'StructureLegends' or @data-name = 'ExhibitCaptions' or @data-name = 'AppendixCaptions' or @data-name = 'SeriesHeadings' or @data-name = 'DisplayHeadings' or @data-name = 'ListHead' or @data-name = 'AbbreviationList' or @data-name = 'AcronymHead' or @data-name = 'AbbreviationHead' or @data-name = 'AcronymHead' or @data-name = 'GraphicalAbstract' or @data-name = 'ReferencesHeading1' or @data-name = 'Acknowledgements' or @data-name = 'KeyTermHead' or @data-name = 'KeyTermHead' or @data-name = 'Heading' or @data-name = 'Head1' or @data-name = 'Head2' or @data-name = 'Head3' or @data-name = 'Head4' or @data-name = 'Head5' or @data-name = 'Head6' or @data-name = 'Head7' or @data-name='ChapterNumber' or @data-name='FigureLegend' or @data-name='TableCaption'][descendant::span[@data-underline = 'REMOVE']]//u | *[@data-name = 'ChapterTitle' or @data-name = 'TitleHead' or @data-name = 'RunningHeadText' or @data-name = 'AuthorHeading' or @data-name = 'EMailAddressHead' or @data-name = 'Highlight' or @data-name = 'SupplementaryLegends' or @data-name = 'FigureLegends' or @data-name = 'TableCaptions' or @data-name = 'ImageCaptions' or @data-name = 'PhotoCaptions' or @data-name = 'BoxTitles' or @data-name = 'SchemeLegends' or @data-name = 'StructureLegends' or @data-name = 'ExhibitCaptions' or @data-name = 'AppendixCaptions' or @data-name = 'SeriesHeadings' or @data-name = 'DisplayHeadings' or @data-name = 'ListHead' or @data-name = 'AbbreviationList' or @data-name = 'AcronymHead' or @data-name = 'AbbreviationHead' or @data-name = 'AcronymHead' or @data-name = 'GraphicalAbstract' or @data-name = 'ReferencesHeading1' or @data-name = 'Acknowledgements' or @data-name = 'KeyTermHead' or @data-name = 'KeyTermHead' or @data-name = 'Heading' or @data-name = 'Head1' or @data-name = 'Head2' or @data-name = 'Head3' or @data-name = 'Head4' or @data-name = 'Head5' or @data-name = 'Head6' or @data-name = 'Head7' or @data-name='ChapterNumber' or @data-name='FigureLegend' or @data-name='TableCaption'][descendant::span[@data-underline = 'REMOVE']]//underline | *[@data-name = 'ChapterTitle' or @data-name = 'TitleHead' or @data-name = 'RunningHeadText' or @data-name = 'AuthorHeading' or @data-name = 'EMailAddressHead' or @data-name = 'Highlight' or @data-name = 'SupplementaryLegends' or @data-name = 'FigureLegends' or @data-name = 'TableCaptions' or @data-name = 'ImageCaptions' or @data-name = 'PhotoCaptions' or @data-name = 'BoxTitles' or @data-name = 'SchemeLegends' or @data-name = 'StructureLegends' or @data-name = 'ExhibitCaptions' or @data-name = 'AppendixCaptions' or @data-name = 'SeriesHeadings' or @data-name = 'DisplayHeadings' or @data-name = 'ListHead' or @data-name = 'AbbreviationList' or @data-name = 'AcronymHead' or @data-name = 'AbbreviationHead' or @data-name = 'AcronymHead' or @data-name = 'GraphicalAbstract' or @data-name = 'ReferencesHeading1' or @data-name = 'Acknowledgements' or @data-name = 'KeyTermHead' or @data-name = 'KeyTermHead' or @data-name = 'Heading' or @data-name = 'Head1' or @data-name = 'Head2' or @data-name = 'Head3' or @data-name = 'Head4' or @data-name = 'Head5' or @data-name = 'Head6' or @data-name = 'Head7' or @data-name='ChapterNumber' or @data-name='FigureLegend' or @data-name='TableCaption'][descendant::span[@data-underline = 'REMOVE']]//span[contains(@style, 'font-style:underline') or contains(@style, 'font-weight:underline')][not(@class)] | *[@data-name = 'ChapterTitle' or @data-name = 'TitleHead' or @data-name = 'RunningHeadText' or @data-name = 'AuthorHeading' or @data-name = 'EMailAddressHead' or @data-name = 'Highlight' or @data-name = 'SupplementaryLegends' or @data-name = 'FigureLegends' or @data-name = 'TableCaptions' or @data-name = 'ImageCaptions' or @data-name = 'PhotoCaptions' or @data-name = 'BoxTitles' or @data-name = 'SchemeLegends' or @data-name = 'StructureLegends' or @data-name = 'ExhibitCaptions' or @data-name = 'AppendixCaptions' or @data-name = 'SeriesHeadings' or @data-name = 'DisplayHeadings' or @data-name = 'ListHead' or @data-name = 'AbbreviationList' or @data-name = 'AcronymHead' or @data-name = 'AbbreviationHead' or @data-name = 'AcronymHead' or @data-name = 'GraphicalAbstract' or @data-name = 'ReferencesHeading1' or @data-name = 'Acknowledgements' or @data-name = 'KeyTermHead' or @data-name = 'KeyTermHead' or @data-name = 'Heading' or @data-name = 'Head1' or @data-name = 'Head2' or @data-name = 'Head3' or @data-name = 'Head4' or @data-name = 'Head5' or @data-name = 'Head6' or @data-name = 'Head7' or @data-name='ChapterNumber' or @data-name='FigureLegend' or @data-name='TableCaption'][descendant::span[@data-underline = 'REMOVE']]//span[@class = 'underline'] | *[@data-name = 'ChapterTitle' or @data-name = 'TitleHead' or @data-name = 'RunningHeadText' or @data-name = 'AuthorHeading' or @data-name = 'EMailAddressHead' or @data-name = 'Highlight' or @data-name = 'SupplementaryLegends' or @data-name = 'FigureLegends' or @data-name = 'TableCaptions' or @data-name = 'ImageCaptions' or @data-name = 'PhotoCaptions' or @data-name = 'BoxTitles' or @data-name = 'SchemeLegends' or @data-name = 'StructureLegends' or @data-name = 'ExhibitCaptions' or @data-name = 'AppendixCaptions' or @data-name = 'SeriesHeadings' or @data-name = 'DisplayHeadings' or @data-name = 'ListHead' or @data-name = 'AbbreviationList' or @data-name = 'AcronymHead' or @data-name = 'AbbreviationHead' or @data-name = 'AcronymHead' or @data-name = 'GraphicalAbstract' or @data-name = 'ReferencesHeading1' or @data-name = 'Acknowledgements' or @data-name = 'KeyTermHead' or @data-name = 'KeyTermHead' or @data-name = 'Heading' or @data-name = 'Head1' or @data-name = 'Head2' or @data-name = 'Head3' or @data-name = 'Head4' or @data-name = 'Head5' or @data-name = 'Head6' or @data-name = 'Head7' or @data-name='ChapterNumber' or @data-name='FigureLegend' or @data-name='TableCaption'][descendant::span[@data-underline = 'REMOVE']]//span[@class = 'underlineHLC']">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="*[@data-name = 'ChapterTitle' or @data-name = 'TitleHead' or @data-name = 'RunningHeadText' or @data-name = 'AuthorHeading' or @data-name = 'EMailAddressHead' or @data-name = 'Highlight' or @data-name = 'SupplementaryLegends' or @data-name = 'FigureLegends' or @data-name = 'TableCaptions' or @data-name = 'ImageCaptions' or @data-name = 'PhotoCaptions' or @data-name = 'BoxTitles' or @data-name = 'SchemeLegends' or @data-name = 'StructureLegends' or @data-name = 'ExhibitCaptions' or @data-name = 'AppendixCaptions' or @data-name = 'SeriesHeadings' or @data-name = 'DisplayHeadings' or @data-name = 'ListHead' or @data-name = 'AbbreviationList' or @data-name = 'AcronymHead' or @data-name = 'AbbreviationHead' or @data-name = 'AcronymHead' or @data-name = 'GraphicalAbstract' or @data-name = 'ReferencesHeading1' or @data-name = 'Acknowledgements' or @data-name = 'KeyTermHead' or @data-name = 'KeyTermHead' or @data-name = 'Heading' or @data-name = 'Head1' or @data-name = 'Head2' or @data-name = 'Head3' or @data-name = 'Head4' or @data-name = 'Head5' or @data-name = 'Head6' or @data-name = 'Head7' or @data-name='ChapterNumber' or @data-name='FigureLegend' or @data-name='TableCaption'][descendant::span[@data-Underline = 'REMOVE' or @data-underline = 'REMOVE']]//span[@class = 'bolditalicunderlineHLC'] | *[@data-name = 'ChapterTitle' or @data-name = 'TitleHead' or @data-name = 'RunningHeadText' or @data-name = 'AuthorHeading' or @data-name = 'EMailAddressHead' or @data-name = 'Highlight' or @data-name = 'SupplementaryLegends' or @data-name = 'FigureLegends' or @data-name = 'TableCaptions' or @data-name = 'ImageCaptions' or @data-name = 'PhotoCaptions' or @data-name = 'BoxTitles' or @data-name = 'SchemeLegends' or @data-name = 'StructureLegends' or @data-name = 'ExhibitCaptions' or @data-name = 'AppendixCaptions' or @data-name = 'SeriesHeadings' or @data-name = 'DisplayHeadings' or @data-name = 'ListHead' or @data-name = 'AbbreviationList' or @data-name = 'AcronymHead' or @data-name = 'AbbreviationHead' or @data-name = 'AcronymHead' or @data-name = 'GraphicalAbstract' or @data-name = 'ReferencesHeading1' or @data-name = 'Acknowledgements' or @data-name = 'KeyTermHead' or @data-name = 'KeyTermHead' or @data-name = 'Heading' or @data-name = 'Head1' or @data-name = 'Head2' or @data-name = 'Head3' or @data-name = 'Head4' or @data-name = 'Head5' or @data-name = 'Head6' or @data-name = 'Head7' or @data-name='ChapterNumber' or @data-name='FigureLegend' or @data-name='TableCaption'][descendant::span[@data-Underline = 'REMOVE' or @data-underline = 'REMOVE']]//span[@class = 'italicunderlineHLC'] | *[@data-name = 'ChapterTitle' or @data-name = 'TitleHead' or @data-name = 'RunningHeadText' or @data-name = 'AuthorHeading' or @data-name = 'EMailAddressHead' or @data-name = 'Highlight' or @data-name = 'SupplementaryLegends' or @data-name = 'FigureLegends' or @data-name = 'TableCaptions' or @data-name = 'ImageCaptions' or @data-name = 'PhotoCaptions' or @data-name = 'BoxTitles' or @data-name = 'SchemeLegends' or @data-name = 'StructureLegends' or @data-name = 'ExhibitCaptions' or @data-name = 'AppendixCaptions' or @data-name = 'SeriesHeadings' or @data-name = 'DisplayHeadings' or @data-name = 'ListHead' or @data-name = 'AbbreviationList' or @data-name = 'AcronymHead' or @data-name = 'AbbreviationHead' or @data-name = 'AcronymHead' or @data-name = 'GraphicalAbstract' or @data-name = 'ReferencesHeading1' or @data-name = 'Acknowledgements' or @data-name = 'KeyTermHead' or @data-name = 'KeyTermHead' or @data-name = 'Heading' or @data-name = 'Head1' or @data-name = 'Head2' or @data-name = 'Head3' or @data-name = 'Head4' or @data-name = 'Head5' or @data-name = 'Head6' or @data-name = 'Head7' or @data-name='ChapterNumber' or @data-name='FigureLegend' or @data-name='TableCaption'][descendant::span[@data-Underline = 'REMOVE' or @data-underline = 'REMOVE']]//span[@class = 'underlineboldHLC']">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:attribute name="data-name">
				<xsl:value-of select="replace(@data-name,'underline','')"/>
			</xsl:attribute>
			<xsl:apply-templates select="node()"/>
		</xsl:copy>
	</xsl:template>

<!-- End -->

	<!--Tag Remove 14-6-2019-->
	<xsl:template match="span[@class = 'Tag']"/>
	<!--End-->





	<!--<xsl:template match="i | italic | span[@data-name = 'italic'] | span[contains(@style, 'font-style:italic') or contains(@style, 'font-weight:italic')]">
		<xsl:choose>
			<xsl:when test="self::i and descendant::span[contains(@data-bkmark, 'Pro-italic-para')] or self::i and ancestor::span[contains(@data-bkmark, 'Pro-italic-para')]">
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:when test="self::italic and descendant::span[contains(@data-bkmark, 'Pro-italic-para')] or self::italic and ancestor::span[contains(@data-bkmark, 'Pro-italic-para')]">
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:when test="span[@data-name = 'italic'] and descendant::span[contains(@data-bkmark, 'Pro-italic-para')] or span[@data-name = 'italic'] and ancestor::span[contains(@data-bkmark, 'Pro-italic-para')]">
				<xsl:apply-templates/>
			</xsl:when>
			
			<xsl:when test="span[contains(@style, 'font-style:italic') or contains(@style, 'font-weight:italic') and not(@data-name)] and not(./ancestor::span[@data-name] and not(following::span/@data-name)) and descendant::span[contains(@data-bkmark, 'Pro-italic-para')] or ancestor::span[contains(@data-bkmark, 'Pro-italic-para')]">
				<xsl:apply-templates/>
			</xsl:when>
			
			<xsl:otherwise>
				<xsl:copy>
					<xsl:apply-templates select="@*|node()"/>
				</xsl:copy>
			</xsl:otherwise>
		</xsl:choose>
		
	</xsl:template>-->

	<!--custom xml match for figure floating elements to suguna 23-4-2020 - Remove here that range-->
	<xsl:template match="span[@data-range='floatrange']">
		<xsl:apply-templates/>
	</xsl:template>
	<!--<xsl:template match="a[@bk and @style='display:none;']"/>-->
	<!--End-->
	<!--Splited seperate para, if place-holder and caption came single line 04-08-2020--> 
	<xsl:template match="p[@data-name='UnFigureCaption'][descendant::span[@data-name='UnFigurePMI']]">
		<xsl:element name="p">
			<xsl:attribute name="class" select="'UnFigPlaceHolder'"/>
			<xsl:attribute name="data-name" select="'UnFig_Place_Holder'"/>
			<xsl:apply-templates select="descendant::span[@data-name='UnFigurePMI']"/>
		</xsl:element>
		<xsl:text>&#x000A;</xsl:text>
		<xsl:element name="p">
			<xsl:attribute name="class" select="'UnFigureCaption'"/>
			<xsl:attribute name="data-name" select="'UnFigureCaption'"/>
			<xsl:apply-templates select="descendant::span[@data-name='UnfigCaption']"/>
		</xsl:element>
	</xsl:template>
	<!--End-->
	<!--Added for figure on 09-07-2021-->
	<xsl:template match="figure[not(@data-alias)]">
		<xsl:element name="figure">
			<xsl:attribute name="data-alias">
				<xsl:value-of select="'FigureGroup'"/>
			</xsl:attribute>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:element>
	</xsl:template>
	
	
	<xsl:template match="figcaption">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:element name="p">
				<xsl:attribute name="class">
					<xsl:value-of select="self::figcaption/@class"/>
				</xsl:attribute>
				<xsl:attribute name="data-name">
					<xsl:value-of select="self::figcaption/@data-name"/>
				</xsl:attribute>
			<xsl:apply-templates select="node()"/>
			</xsl:element>
			<!-- Added for paneer indd on 21-2-2022 -->
			<!-- commented for Azure 5607 on 07-12-2022 -->
			<!--<xsl:if test="self::figcaption/following-sibling::p[contains(lower-case(@class),'source')]">
				<xsl:apply-templates select="self::figcaption/following-sibling::p[contains(lower-case(@class),'source')]"/>
			</xsl:if>-->
		</xsl:copy>
	</xsl:template>
	<!--Added on 08-02-2021 to avoid the citation range 11 12 13-14 we removed here 12 13 we added in xhtml for editor purpose-->
	<xsl:template match="a[@class='citationRef' and @style='display:none;']"/>
	
	<!-- Added to remove the empty paragraph first and last of the document on 28-09-2021 -->
	<!-- empty para followed by table so empty para removed issue on 28-1-2022 -->
	<xsl:template match="p[not(child::img)][string-length(.) = 0][not(following-sibling::*[not(child::img)][string-length(.) &gt; 0])]"/>
	<xsl:template match="p[not(child::img)][string-length(.) = 0][not(preceding-sibling::p[not(child::img)][string-length(.) &gt; 0])]"/>
	<!-- Added for editor on 18-10-2021 -->
	<!-- Added for editor SupplTableGroup on 20-10-2021 -->
	<!-- Tablecaption missing by empty Table group tag removing from editor concept, if its come from table/td 12-3-2022-->
	<xsl:template match="div[@data-alias='TableGroup' or @data-alias='SupplTableGroup'][child::table[not(descendant::td/div[@data-alias = 'TableCaption' or @data-alias = 'Table Caption'])]][not(child::div)]">
		<xsl:apply-templates/>
	</xsl:template>
	<!-- Added to remove the class="captiontable" , when table change to figuregroup on 26-11-2021 -->
	<xsl:template match="div[@class='captiontable' and @data-alias='FigureGroup' or @data-alias='Figure Group']/@class"/>
	<!-- Added while change the group issue by captiontable  on 27-12-2021-->
	<xsl:template match="div[@class='captiontable' and not(contains(@data-alias,'Table Group') or contains(@data-alias,'TableGroup') or @data-alias='')][not(following-sibling::*[1][self::div[contains(@data-alias,'Table Caption') or contains(@data-alias,'TableCaption')]])]/@class"/>
	<!-- added to remove the calss if table has no caption on 06-08-2025 -->
	<xsl:template match="div[@class='captiontable' and contains(@data-alias,'Table Group') or contains(@data-alias,'TableGroup') or @data-alias=''][not(descendant::div[contains(@data-alias,'Table Caption') or contains(@data-alias,'TableCaption')])]/@class"/>
	<!-- Added to avoid preceeding content paragraph style for table on 24-11-2022 -->
	<xsl:template match="table[preceding-sibling::p[1][string-length(.) &gt;0]]">
		<xsl:text disable-output-escaping="yes">&lt;p class="Normal" data-name="Normal"/&gt;</xsl:text>
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates select="node()"/>
		</xsl:copy>
	</xsl:template>
        <!-- To remove .. for footnote Azure 7868 on 28-06-2023-->
	<xsl:template match="div[@class='footnotecaption']/p[substring(text()[1],1,1) = '.']/text()[substring(.,1,1) = '.']">	
		<xsl:variable name="dot" select="substring(self::text()[1],1,1)"/>
		<xsl:choose>
			<xsl:when test="substring(self::text(),1,1) = '.'">
				<xsl:value-of select="substring-after(self::text(),substring(self::text(),1,1))"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="self::text()"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--end-->
	<!-- added for math on 03-09-2025 -->
	<xsl:template match="span[@id='mathjax']">
		<xsl:variable name="mathext">
			<xsl:value-of select="$Mathextension//root/allMath/outputFileExtension"/>
		</xsl:variable>
		<xsl:element name="span">
			<xsl:apply-templates select="@*"/>
			<xsl:element name="img">
				<xsl:attribute name="data-src"><xsl:value-of select="concat(self::span[@data-filename]/substring-before(@data-filename,'.'),'.',$mathext)"/></xsl:attribute>
				<xsl:attribute name="src"><xsl:value-of select="concat('/',self::span[@data-filename]/substring-before(@data-filename,'.'),'.',$mathext)"/></xsl:attribute>
				<xsl:attribute name="data-artname"><xsl:value-of select="concat(self::span[@data-filename]/substring-before(@data-filename,'.'),'.',$mathext)"/></xsl:attribute>
				<xsl:attribute name="class"><xsl:value-of select="'_idGenObjectAttribute-1'"/></xsl:attribute>
				<xsl:attribute name="alt"><xsl:value-of select="'inline-image'"/></xsl:attribute>
				<xsl:attribute name="title"><xsl:value-of select="concat(self::span[@data-filename]/substring-before(@data-filename,'.'),'.',$mathext)"/></xsl:attribute>
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:variable name="mathext">
		<xsl:value-of select="$Mathextension//root/allMath/outputFileExtension"/>
	</xsl:variable>
	<xsl:variable name="eqstyle">
		<xsl:value-of select="$StylesCollect//stylesList//style[@name='DZC_EquationName']/@replacement"/>
	</xsl:variable>
	<!-- Added to avoid ".pdf" whereever data-name empty there it placed  11-6-2026 -->
	<xsl:template match="//span[string-length(@data-name) &gt; 0 and string-length(@class) &gt; 0][@data-name=$eqstyle]">
		<xsl:element name="span">
			<xsl:apply-templates select="@*"/>
			<xsl:variable name="eq">
				<xsl:value-of select="."/>
			</xsl:variable>
			<xsl:choose>
				<xsl:when test="contains($eq,'.')">
					<xsl:value-of select="$eq"/>
				</xsl:when>
				<xsl:when test="contains($eq,'&#x003E;')">
					<xsl:value-of select="concat(substring-before(.,'&gt;&gt;'),'.',$mathext,'&#x003E;&#x003E;')"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="concat(substring-before(.,'&gt;&gt;'),'.',$mathext,'&gt;&gt;')"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
	</xsl:template>
	</xsl:stylesheet>