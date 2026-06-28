<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    exclude-result-prefixes="xs"
    version="2.0">
   <xsl:output method="xml" name="xml" />
 <xsl:variable name="newstyles" select="document('Converted_Story/errorlog.xml')"/>
	

	
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
     </xsl:template>
	
	  
	<!--  <xsl:template match="RootParagraphStyleGroup">

 <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
	   <xsl:for-each select="$newstyles/result/data1/ParagraphStyleRange">
   				  <xsl:variable name="newsty" select="./@AppliedParagraphStyle"/>
	    <xsl:variable name="newsty1" select="substring-after(./@AppliedParagraphStyle,'ParagraphStyle/')"/>
		
				<ParagraphStyle Self="{$newsty}" Name="{$newsty1}" Imported="false" NextStyle="{$newsty}" EmptyNestedStyles="true" EmptyLineStyles="true" EmptyGrepStyles="true" KeyboardShortcut="0 0" FillColor="Color/C=0 M=60 Y=100 K=0" RuleAboveLineWeight="2" RuleAboveWidth="TextWidth" RuleBelowLineWeight="2" RuleBelowWidth="TextWidth">
			<Properties>
				<BasedOn type="string">$ID/[No paragraph style]</BasedOn>
				<PreviewColor type="enumeration">Nothing</PreviewColor>
			</Properties>
		</ParagraphStyle>
		
	
	
	  </xsl:for-each>
	  	
        </xsl:copy>
	  </xsl:template>-->

	  
	
		
		  <xsl:template match="RootCharacterStyleGroup">



 <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
			
	   <xsl:for-each select="$newstyles/result/data1/CharacterStyleRange">
	   <xsl:if test="./@ManualChar">
					
	     <xsl:variable name="newsty" select="./@AppliedCharacterStyle"/>
	    <xsl:variable name="newsty1" select="substring-after(./@AppliedCharacterStyle,'CharacterStyle/')"/>
		<xsl:element name="CharacterStyle">
		<xsl:attribute name="Self" select="$newsty"/>
		<xsl:attribute name="Imported" select="'false'"/>
		<xsl:attribute name="KeyboardShortcut" select="'0 0'"/>
		<xsl:attribute name="Name" select="$newsty1"/>
		
	
		<xsl:if test="contains($newsty1,'Bold')">

	<xsl:attribute name="FontStyle" select="'Bold'"/>
		</xsl:if>
		<xsl:if test="contains($newsty1,'Italic')">
	<xsl:attribute name="FontStyle" select="'Italic'"/>
		</xsl:if>
		<xsl:if test="contains($newsty1,'Bolld Itallic')">
	<xsl:attribute name="FontStyle" select="'Bold Italic'"/>
		</xsl:if>
			<xsl:if test="contains($newsty1,'SmallCaps')">
	<xsl:attribute name="Capitalization" select="'SmallCaps'"/>
		</xsl:if>
		<xsl:if test="contains($newsty1,'Underline')">
	<xsl:attribute name="Underline" select="'true'"/>
		</xsl:if>
		<xsl:if test="contains($newsty1,'StrikeThru')">
	<xsl:attribute name="StrikeThru" select="'true'"/>
		</xsl:if>
		<!-- Updated on 14.08.2017 Mahesh
 		<xsl:if test="contains($newsty1,'AllCaps')">
			<xsl:attribute name="Capitalization" select="'AllCaps'"/>
		</xsl:if>
			End-->
	

		
			<xsl:if test="contains($newsty1,'Superscript')">
	<xsl:attribute name="Position" select="'Superscript'"/>
		</xsl:if>
			<xsl:if test="contains($newsty1,'Subscript')">
	<xsl:attribute name="Position" select="'Subscript'"/>
		</xsl:if>
	<xsl:text>&#x000A;</xsl:text>
		
			
		<Properties>
		<xsl:text>&#x000A;</xsl:text>
				<BasedOn type="string">$ID/[No character style]</BasedOn>
				<xsl:text>&#x000A;</xsl:text>
				<PreviewColor type="enumeration">Nothing</PreviewColor>
				<xsl:text>&#x000A;</xsl:text>
			</Properties>
			<xsl:text>&#x000A;</xsl:text>
		</xsl:element>
		<xsl:text>&#x000A;</xsl:text>
	</xsl:if>
	
	
  </xsl:for-each>
	  	
        </xsl:copy>
	  </xsl:template>
		 
</xsl:stylesheet>