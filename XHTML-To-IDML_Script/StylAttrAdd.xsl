<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output indent="yes"/>

	
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
     </xsl:template>
	
	  

		   <xsl:template match="ParagraphStyle">
		   <xsl:variable name="GroupName">
			<xsl:choose>
			<xsl:when test="ancestor::ParagraphStyleGroup">
		<xsl:for-each select="ParagraphStyle">
		 		   <xsl:value-of select="substring-after(ancestor::ParagraphStyleGroup/@Name,'$ID/')"/>
		</xsl:for-each>
			</xsl:when>
			</xsl:choose>
			</xsl:variable>
		   <xsl:variable name="NoGroupName" select="./@Name"/>
		   <xsl:variable name="GroupName1" select="concat($GroupName,':')"/>
		   <xsl:variable name="StyleName">
				<xsl:value-of select="substring-after(./@Name,$GroupName1)"/>
		  </xsl:variable>
	

		  <xsl:copy>
			<xsl:choose>
			<xsl:when test="starts-with(./@Name,$GroupName1)">
			<xsl:attribute name="MatchStyle">
			<xsl:value-of select="$StyleName"/>
			</xsl:attribute>
			</xsl:when>
			<xsl:otherwise>
			<xsl:attribute name="MatchStyle">
			<xsl:value-of select="$NoGroupName"/>
			</xsl:attribute>
			</xsl:otherwise>
			</xsl:choose>
		 <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
		    </xsl:template>
		
		
		
		<xsl:template match="CharacterStyle">
		   <xsl:variable name="GroupName">
			<xsl:choose>
			<xsl:when test="ancestor::CharacterStyleGroup">
		 		   <xsl:value-of select="substring-after(ancestor::CharacterStyleGroup/@Name,'$ID/')"/>
			</xsl:when>
			</xsl:choose>
			</xsl:variable>
		   <xsl:variable name="NoGroupName" select="./@Name"/>
		   <xsl:variable name="GroupName1" select="concat($GroupName,':')"/>
		   <xsl:variable name="StyleName">
				<xsl:value-of select="substring-after(./@Name,$GroupName1)"/>
		  </xsl:variable>
	
		  <xsl:copy>
			<xsl:choose>
			<xsl:when test="starts-with(./@Name,$GroupName1)">
			<xsl:attribute name="MatchStyle">
			<xsl:value-of select="$StyleName"/>
			</xsl:attribute>
			</xsl:when>
			<xsl:otherwise>
			<xsl:attribute name="MatchStyle">
			<xsl:value-of select="$NoGroupName"/>
			</xsl:attribute>
			</xsl:otherwise>
			</xsl:choose>
		 <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
		    </xsl:template>
		 
		 
</xsl:stylesheet>