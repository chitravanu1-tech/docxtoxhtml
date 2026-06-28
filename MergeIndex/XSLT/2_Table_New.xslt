<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
	<xsl:output method="xml"/>
	<xsl:template match="@* | node()">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()"/>
		</xsl:copy>
	</xsl:template>

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
	<xsl:template match="td/@vmerge"/>

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
	<xsl:template match="span[@data-change = 'commentdeleted']"/>
	<xsl:template match="commentreference[@data-change = 'commentdeleted']"/>
	<xsl:template match="commentreference/comment[@data-change = 'commentdeleted']"/>
</xsl:stylesheet>
