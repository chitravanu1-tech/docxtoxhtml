<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:math="http://exslt.org/math" extension-element-prefixes="math"
    exclude-result-prefixes="xs" xmlns:idPkg="http://ns.adobe.com/AdobeInDesign/idml/1.0/packaging"
    version="2.0">
   <xsl:output method="xml" name="xml" />


 <xsl:variable name="newstyles" select="document('Converted_Story/StylesManual.xml')"/>

    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

   <!--
Useful-sample link-
   <xsl:template match="CharacterStyle">
        <xsl:copy>
       
	
            <xsl:copy-of select="$snippetDoc//CharacterStyle[contains(@Self, @Self)]/@*" />
	
             <xsl:apply-templates select="@* | node()"/>
			 
        </xsl:copy>
    </xsl:template>-->
		 
		 <xsl:template match="CharacterStyle[ancestor::CharacterStyleGroup[@Name='NewManual Styles']]">
		 <xsl:variable name="cha" select="concat('CharacterStyle/',substring-before(substring-after(./@Self,'CharacterStyle/'),'@manual@'))"/>
		     <xsl:copy>
			 <xsl:for-each select="$newstyles//CharacterStyle">
		<xsl:if test="./@Self = $cha">
			<xsl:copy-of select="@*"/>
			</xsl:if>
			</xsl:for-each>
				
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
			 </xsl:template>
		 <xsl:template match="CharacterStyleGroup[@Name='NewManual Styles']">
		 <xsl:apply-templates/>
		 </xsl:template>
		
</xsl:stylesheet>