<!-- Updated using number function  14.12.2017-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
	<xsl:output method="xml"/>
	<xsl:template match="@* | node()">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()"/>
		</xsl:copy>
	</xsl:template>
	<!-- <xsl:template match="td">
        <xsl:apply-templates>
            <xsl:sort select="cellNumber" order="descending" data-type="number" />
        </xsl:apply-templates>
    </xsl:template>-->

	
	<xsl:template match="td" priority="2">
		<!-- Updated on i Value-->
		<xsl:variable name="CellCount" select="count(preceding-sibling::td)"/>
		<xsl:variable name="ColumnCount">
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
		<!--End updated -->
<!--		<xsl:variable name="IVal" select="@tdposition"/>-->
		<xsl:copy>
			<xsl:attribute name="I">
				<!--<xsl:value-of select="$IVal"/> pls check and confirm-->
				<xsl:value-of select="$ColumnCount"/>
			</xsl:attribute>
			<xsl:attribute name="J">
				<xsl:value-of select="ancestor::tr/@trposition"/>
			</xsl:attribute>
			<xsl:apply-templates select="@* | node()"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="span[@class = 'MsoFootnoteReference']">
		<xsl:choose>
			<xsl:when test="ancestor::div">
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:copy>
					<xsl:apply-templates select="@* | node()"/>
				</xsl:copy>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
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
	<xsl:template name="Br">
		<xsl:param name="i" as="xs:integer"/>
		<xsl:param name="j" as="xs:integer"/>
		<xsl:param name="to1" as="xs:integer"/>
		<xsl:param name="step2" as="xs:integer"/>
		<xsl:variable name="gridval" as="xs:integer">
			<xsl:choose>
				<xsl:when test="preceding-sibling::*[$i]/@colspan">
					<xsl:value-of select="number(preceding-sibling::*[$i]/@colspan) - 1"/>
				</xsl:when>

				<xsl:otherwise>
					<xsl:value-of select="0"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$i = $to1">
				<xsl:value-of select="number($j)"/>
				<!-- <xsl:value-of select="($j cast as xs:integer)"/> please check Updated 14.12.2017-->
			</xsl:when>
		</xsl:choose>
		<xsl:if test="$i + $step2 >= $to1">
			<xsl:call-template name="Br">
				<xsl:with-param name="i" select="$i + $step2" as="xs:integer"/>
				<xsl:with-param name="j" select="$j + $gridval" as="xs:integer"/>
				<xsl:with-param name="to1" select="$to1" as="xs:integer"/>
				<xsl:with-param name="step2" select="$step2" as="xs:integer"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>