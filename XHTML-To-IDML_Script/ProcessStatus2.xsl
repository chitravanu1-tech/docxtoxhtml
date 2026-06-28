<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    exclude-result-prefixes="xs"
    version="2.0">
   <xsl:output method="xml" name="xml" />

	

	
<xsl:template match="@*|node()">
<xsl:copy>
<xsl:apply-templates select="@*|node()"/>
</xsl:copy>
</xsl:template>
	  
		
<xsl:template match="CharacterStyleRange">
<xsl:choose>
<xsl:when test="not(./@ManualChar or ./@StyleManualChar1)">
<xsl:copy>
<xsl:apply-templates select="@*|node()"/>
</xsl:copy>
</xsl:when>
<xsl:otherwise>

</xsl:otherwise>
</xsl:choose>
</xsl:template>
		
</xsl:stylesheet>