<!-- Updated on 08.03.2017{Issue File:Zhu98206_ch01} {footnote SuperScript Character style Continous on txt} -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf" exclude-result-prefixes="xs mf" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" version="2.0">
 
        <xsl:output method="xml" name="xml" indent="yes"/>
 <xsl:template match="@*|node()">
     <xsl:copy>
 <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
   </xsl:template>
    <!-- Updated on 08.03.2017{Issue File:Zhu98206_ch01} {footnote SuperScript Character style Continous on txt} -->
	<xsl:template match="XMLElement">

	<xsl:choose>

	    <xsl:when test="ancestor::ParagraphStyleRange and not(ancestor::CharacterStyleRange)and not(descendant::*[2][self::Footnote])">

		<xsl:copy>
 <xsl:apply-templates select="@*|node()"/>


  <CharacterStyleRange AppliedCharacterStyle="CharacterStyle/$ID/[No character style]" Name="$ID/[No character style]"/>
  </xsl:copy>


	</xsl:when>

	<xsl:otherwise>	

	 <xsl:copy>
 <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>

	    
	</xsl:otherwise>
	
	</xsl:choose>
	
	</xsl:template>
 


  </xsl:stylesheet>
  
