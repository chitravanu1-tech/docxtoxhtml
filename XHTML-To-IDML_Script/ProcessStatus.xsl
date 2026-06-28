<!--Modify {16.2.2017}-->
<!--update for EmptyParaStyle and EmptyCharStyle on {20/02/2020} by prakash -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
	xmlns:idPkg="http://ns.adobe.com/AdobeInDesign/idml/1.0/packaging" version="2.0">



	<xsl:output method="text" indent="no"/>
	<xsl:strip-space elements="*"/>



	<xsl:template match="result/data1">

		<xsl:choose>
			<xsl:when test="descendant::CharacterStyleRange or descendant::ParagraphStyleRange">
				<xsl:if test="descendant::CharacterStyleRange or descendant::ParagraphStyleRange">
					<xsl:text>&lt;html&gt;</xsl:text>
					<xsl:text>&lt;body&gt;</xsl:text>
					<xsl:text>&lt;h2&gt;</xsl:text> "Unknown" Word Styles <xsl:text>&lt;/h2&gt;</xsl:text>
					<xsl:text>&lt;table border="1" style="width:75%"&gt;</xsl:text>
				</xsl:if>

				<xsl:for-each select="ParagraphStyleRange">
					<xsl:variable name="PsAfterTxt" select="normalize-space(substring-after(@AppliedParagraphStyle,'ParagraphStyle/'))"/>
					<xsl:text>&#x000A;</xsl:text>
					<xsl:text>&lt;tr bgcolor="#ccffff"&gt;</xsl:text>
					<xsl:text>&lt;td style="font-size:20px;padding-left:25px"&gt;</xsl:text>
					<xsl:choose>
						<xsl:when test="string-length($PsAfterTxt) > 0">
							<xsl:value-of select="./@AppliedParagraphStyle"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'CharacterStyle/EmptyParaStyle'"/>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:text>&lt;/td&gt;</xsl:text>
					<xsl:text>&lt;/tr&gt;</xsl:text>
				</xsl:for-each>


				<xsl:for-each select="CharacterStyleRange">

					<xsl:variable name="PsAfterTxt" select="normalize-space(substring-after(@AppliedCharacterStyle,'CharacterStyle/'))"/>
					<xsl:text>&#x000A;</xsl:text>
					<xsl:text>&lt;tr bgcolor="#ccffff"&gt;</xsl:text>
					<xsl:text>&lt;td style="font-size:20px;padding-left:25px"&gt;</xsl:text>
					<xsl:choose>
						<xsl:when test="string-length($PsAfterTxt) > 0">
							<xsl:choose>
								<xsl:when test="contains(./@AppliedCharacterStyle, '@manual')">
									<xsl:value-of
										select="substring-before(./@AppliedCharacterStyle, '@manual@')"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="./@AppliedCharacterStyle"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'CharacterStyle/EmptyCharStyle'"/>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:text>&lt;/td&gt;</xsl:text>
					<xsl:text>&lt;/tr&gt;</xsl:text>
				</xsl:for-each>

				<xsl:if test="descendant::CharacterStyleRange or descendant::ParagraphStyleRange">
					<xsl:text>&lt;/table&gt;</xsl:text>
					<xsl:text>&#x000A;</xsl:text>
					<!--Modify {16.2.2017}-->
					<xsl:text>&lt;/body&gt;</xsl:text>
					<xsl:text>&lt;/html&gt;</xsl:text>
				</xsl:if>

			</xsl:when>
			<xsl:otherwise> </xsl:otherwise>
		</xsl:choose>

	</xsl:template>



</xsl:stylesheet>
