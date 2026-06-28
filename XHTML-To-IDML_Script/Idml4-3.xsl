<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf"
    exclude-result-prefixes="xs mf"
    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" version="2.0">

    <!--Remove source from caption 098-09-2021-->
     <xsl:output method="xml" name="xml" />
  
	
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
	
	
	   <xsl:template match="ParagraphStyleRange">
		   
		   <xsl:variable name="qqq" select="substring-after(@AppliedParagraphStyle,'ParagraphStyle/')"/>
	  <xsl:copy>
			<xsl:attribute name="Name">
			<xsl:value-of select="$qqq"/>
			</xsl:attribute>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
	 
	    </xsl:template>

	   <xsl:template match="CharacterStyleRange">
		   
		   <xsl:variable name="qqq" select="substring-after(@AppliedCharacterStyle,'CharacterStyle/')"/>
	  <xsl:copy>
			<xsl:attribute name="Name">
			<xsl:value-of select="$qqq"/>
			</xsl:attribute>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
	 
	    </xsl:template>
    <!--Remove source from caption 098-09-2021-->
    <xsl:template match="XMLElement[@MarkupTag='XMLTag/source'][preceding-sibling::XMLElement[1][@MarkupTag='XMLTag/figure'][child::XMLElement[@MarkupTag='XMLTag/source']]]"/>
    <!-- commmented on 21-12-2201 -->
    <xsl:template match="//CharacterStyleRange[Br][following::*[1][self::CharacterStyleRange[Br]]]"/>
    </xsl:stylesheet>