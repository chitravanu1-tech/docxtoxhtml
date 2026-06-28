<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="xml" name="xml" indent="yes"/>
	<xsl:variable name="sr" select="document('Converted_Story/Styles.xml')"/>
	
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
     </xsl:template>
	

		
			
<xsl:template match="CharacterStyleRange">
		   
		   <xsl:variable name="name" select="@Name"/>
		   <xsl:variable name="appliedCharacterStyle" select="@AppliedCharacterStyle"/>
		   <xsl:variable name="fontStyle" select="@FontStyle"/>
		   <xsl:variable name="position" select="@Position"/>
		   <xsl:variable name="strikeThru" select="@StrikeThru"/>
		   <xsl:variable name="capitalization" select="@Capitalization"/>
		   <xsl:variable name="underline" select="@Underline"/>
		   <xsl:variable name="appliedConditions" select="@AppliedConditions"/>
		 


  <xsl:copy>

		<xsl:attribute name="AppliedCharacterStyle">
		<xsl:choose>
		<xsl:when test="not($appliedCharacterStyle='CharacterStyle/$ID/[No character style]') and ($fontStyle or $position or $strikeThru or $capitalization or $underline)">
			
			<xsl:value-of select="$appliedCharacterStyle"/>
			</xsl:when>
				<xsl:when test="not($appliedCharacterStyle='CharacterStyle/$ID/[No character style]') and not($fontStyle or $position or $strikeThru or $capitalization or $underline)">
			<xsl:value-of select="$appliedCharacterStyle"/>
			</xsl:when>
			<xsl:otherwise>
			
			<xsl:choose>
			<xsl:when test="($appliedCharacterStyle='CharacterStyle/$ID/[No character style]') and ($fontStyle or $position or $strikeThru or $capitalization or $underline)">
				<xsl:value-of select="$appliedCharacterStyle"/>
			</xsl:when>
			<xsl:otherwise>
			<xsl:value-of select="concat($appliedCharacterStyle,$fontStyle,$position,$strikeThru,$capitalization,$underline)"/>
			</xsl:otherwise>
			</xsl:choose>
					
			</xsl:otherwise>
			</xsl:choose>
			</xsl:attribute>

							<xsl:attribute name="Name">
				<xsl:choose>
		<xsl:when test="not($appliedCharacterStyle='CharacterStyle/$ID/[No character style]') and ($fontStyle or $position or $strikeThru or $capitalization or $underline)">
				<!--<xsl:value-of select="substring-after($appliedCharacterStyle,'CharacterStyle/')"/>-->
		<xsl:value-of select="substring-after(concat($appliedCharacterStyle,'@manual@',$fontStyle,$position,$strikeThru,$capitalization,$underline),'CharacterStyle/')"/>
			</xsl:when>
			<xsl:when test="not($appliedCharacterStyle='CharacterStyle/$ID/[No character style]') and not($fontStyle or $position or $strikeThru or $capitalization or $underline)">
			<xsl:value-of select="substring-after($appliedCharacterStyle,'CharacterStyle/')"/>
			</xsl:when>
			<xsl:otherwise>
			<xsl:choose>
			<xsl:when test="($appliedCharacterStyle='CharacterStyle/$ID/[No character style]') and ($fontStyle or $position or $strikeThru or $capitalization or $underline)">
				<xsl:value-of select="'$ID/[No character style]'"/>
			</xsl:when>
			<xsl:otherwise>
			<xsl:value-of select="replace(concat($appliedCharacterStyle,$fontStyle,$position,$strikeThru,$capitalization,$underline),'CharacterStyle/','')"/>
			</xsl:otherwise>
			</xsl:choose>
			</xsl:otherwise>
			</xsl:choose>
						</xsl:attribute>
						<xsl:attribute name="ManualChar">
				<xsl:choose>
		<xsl:when test="not($appliedCharacterStyle='CharacterStyle/$ID/[No character style]') and ($fontStyle or $position or $strikeThru or $capitalization or $underline)">
			<!--	<xsl:value-of select="concat(substring-after($appliedCharacterStyle,'CharacterStyle/'),'_StyleManualChar')"/>-->
		<xsl:value-of select="concat(substring-after(concat($appliedCharacterStyle,'@manual@',$fontStyle,$position,$strikeThru,$capitalization,$underline),'CharacterStyle/'),'@manual@StyleManualChar')"/>
			</xsl:when>
			<xsl:when test="not($appliedCharacterStyle='CharacterStyle/$ID/[No character style]') and not($fontStyle or $position or $strikeThru or $capitalization or $underline)">
			<xsl:value-of select="substring-after($appliedCharacterStyle,'CharacterStyle/')"/>
			</xsl:when>
			<xsl:otherwise>
			<xsl:choose>
			<xsl:when test="($appliedCharacterStyle='CharacterStyle/$ID/[No character style]') and ($fontStyle or $position or $strikeThru or $capitalization or $underline)">
				<xsl:value-of select="'$ID/[No character style]'"/>
			</xsl:when>
			<xsl:otherwise>
			<xsl:value-of select="replace(concat($appliedCharacterStyle,$fontStyle,$position,$strikeThru,$capitalization,$underline),'CharacterStyle/','')"/>
			</xsl:otherwise>
			</xsl:choose>
			</xsl:otherwise>
			</xsl:choose>
						</xsl:attribute>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
	 
	    </xsl:template>
		
	
			
	<!--<xsl:template match="CharacterStyleRange/@AppliedCharacterStyle"/>-->
	<!--<xsl:template match="CharacterStyleRange/@FontStyle"/>-->
	<!--<xsl:template match="CharacterStyleRange/@Position"/>-->
	<!--<xsl:template match="CharacterStyleRange/@StrikeThru"/>-->
	<!--<xsl:template match="CharacterStyleRange/@Capitalization"/>-->
	<!--<xsl:template match="CharacterStyleRange/@Underline"/>-->
	<!--<xsl:template match="CharacterStyleRange/@Name"/>-->
		
</xsl:stylesheet>