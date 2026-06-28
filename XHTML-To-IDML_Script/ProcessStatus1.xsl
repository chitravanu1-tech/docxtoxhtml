<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    exclude-result-prefixes="xs"
    version="2.0">
   <xsl:output method="xml" name="xml" />
 <xsl:variable name="newstyles" select="document('Converted_Story/StylesManual.xml')"/>
	

	
<xsl:template match="@*|node()">
<xsl:copy>
<xsl:apply-templates select="@*|node()"/>
</xsl:copy>
</xsl:template>
	  
		
<xsl:template match="CharacterStyleRange">
<xsl:choose>

<xsl:when test="./@StyleManualChar">
<xsl:copy>
<xsl:variable name="stylmanu" select="./@AppliedCharacterStyle"/>
<xsl:variable name="stylmanu1" select="substring-before(./@AppliedCharacterStyle,'@manual@')"/>
<xsl:variable name="stylmanu2" select="substring-after(./@AppliedCharacterStyle,'@manual@')"/>

<xsl:for-each select="$newstyles//RootCharacterStyleGroup/CharacterStyle">

<xsl:variable name="manstyl" select="./@Self"/>
<xsl:choose>
<xsl:when test="$manstyl eq $stylmanu1">
<xsl:attribute name="AppliedCharacterStyle1">
<xsl:value-of select="$stylmanu1"/>
<xsl:variable name="alstyle">
<xsl:if test="contains($stylmanu2,'Bold')">
<xsl:choose>
<xsl:when test="./@FontStyle='Bold'">

<xsl:if test= "not($manstyl eq $stylmanu)">
	<xsl:value-of select="'Bold'"/>
</xsl:if>
</xsl:when>

<xsl:otherwise>

<xsl:value-of select="'Bold'"/>
</xsl:otherwise>

</xsl:choose>

</xsl:if>

<xsl:if test="contains($stylmanu2,'Italic')">
<xsl:choose>
<xsl:when test="./@FontStyle='Italic'">

<xsl:if test= "not($manstyl eq $stylmanu)">
	<xsl:value-of select="'Italic'"/>
</xsl:if>


</xsl:when>
<xsl:otherwise>

<xsl:value-of select="'Italic'"/>
</xsl:otherwise>

</xsl:choose>

</xsl:if>


<xsl:if test="contains($stylmanu2,'Bolld Itallic')">
<xsl:choose>
<xsl:when test="./@FontStyle='Bold Italic'">
<xsl:if test= "not($manstyl eq $stylmanu)">
	<xsl:value-of select="'Bolld Itallic'"/>
</xsl:if>

</xsl:when>
<xsl:otherwise>

<xsl:value-of select="'Bolld Itallic'"/>
</xsl:otherwise>

</xsl:choose>

</xsl:if>

<xsl:if test="contains($stylmanu2,'Underline')">

<xsl:choose>
<xsl:when test="./@Underline='true'">
<xsl:if test= "not($manstyl eq $stylmanu)">
	<xsl:value-of select="'Underline'"/>
</xsl:if>
</xsl:when>
<xsl:otherwise>
<xsl:value-of select="'Underline'"/>
</xsl:otherwise>

</xsl:choose>

</xsl:if>
<xsl:if test="contains($stylmanu2,'StrikeThru')">
<xsl:choose>
<xsl:when test="./@StrikeThru='true'">
<xsl:if test= "not($manstyl eq $stylmanu)">
	<xsl:value-of select="'StrikeThru'"/>
</xsl:if>
</xsl:when>
<xsl:otherwise>
<xsl:value-of select="'StrikeThru'"/>
</xsl:otherwise>

</xsl:choose>

</xsl:if>
<xsl:if test="contains($stylmanu2,'SmallCaps')">
<xsl:choose>
<xsl:when test="./@Capitalization='SmallCaps'">
<xsl:if test= "not($manstyl eq $stylmanu)">
	<xsl:value-of select="'SmallCaps'"/>
</xsl:if>
</xsl:when>
<xsl:otherwise>
<xsl:value-of select="'SmallCaps'"/>
</xsl:otherwise>

</xsl:choose>

</xsl:if>
<!-- Updated on 14.08.2017 Mahesh
<xsl:if test="contains($stylmanu2,'AllCaps')">
<xsl:choose>
<xsl:when test="./@Capitalization='AllCaps'">
<xsl:if test= "not($manstyl eq $stylmanu)">
	<xsl:value-of select="'AllCaps'"/>
</xsl:if>
</xsl:when>
<xsl:otherwise>
<xsl:value-of select="'AllCaps'"/>
</xsl:otherwise>

</xsl:choose>

</xsl:if>
End-->
<xsl:if test="contains($stylmanu2,'Superscript')">

<xsl:choose>
<xsl:when test="./@Position='Superscript'">

<xsl:if test= "not($manstyl = $stylmanu)">



	<xsl:value-of select="'Superscript'"/>
</xsl:if>
</xsl:when>
<xsl:otherwise>
<xsl:value-of select="'Superscript'"/>
</xsl:otherwise>

</xsl:choose>
</xsl:if>
<xsl:if test="contains($stylmanu2,'Subscript')">
<xsl:choose>
<xsl:when test="./@Position='Subscript'">
<xsl:if test= "not($manstyl eq $stylmanu)">
	<xsl:value-of select="'Subscript'"/>
</xsl:if>
</xsl:when>
<xsl:otherwise>
<xsl:value-of select="'Subscript'"/>
</xsl:otherwise>

</xsl:choose>

</xsl:if>

</xsl:variable>

<xsl:if test="string($alstyle)">
<xsl:value-of select="'@manual@'"/>
</xsl:if>
<xsl:value-of select="$alstyle"/>
</xsl:attribute>

<xsl:attribute name="StyleManualChar1">
<xsl:value-of select="$stylmanu1"/>
<xsl:variable name="alstyle">
<xsl:if test="contains($stylmanu2,'Bold')">
<xsl:choose>
<xsl:when test="./@FontStyle='Bold'">
<xsl:if test= "not($manstyl eq $stylmanu)">
	<xsl:value-of select="'Bold'"/>
</xsl:if>

</xsl:when>
<xsl:otherwise>

<xsl:value-of select="concat('startfontstyle','Bold','endfontstyle')"/>
</xsl:otherwise>

</xsl:choose>

</xsl:if>

<xsl:if test="contains($stylmanu2,'Italic')">
<xsl:choose>
<xsl:when test="./@FontStyle='Italic'">
<xsl:if test= "not($manstyl eq $stylmanu)">
	<xsl:value-of select="'Italic'"/>
</xsl:if>

</xsl:when>
<xsl:otherwise>

<xsl:value-of select="concat('startfontstyle','Italic','endfontstyle')"/>
</xsl:otherwise>

</xsl:choose>

</xsl:if>


<xsl:if test="contains($stylmanu2,'Bolld Itallic')">

<xsl:choose>
<xsl:when test="./@FontStyle='Bold Italic'">
<xsl:if test= "not($manstyl eq $stylmanu)">
	<xsl:value-of select="'Bold Italic'"/>
</xsl:if>

</xsl:when>
<xsl:otherwise>

<xsl:value-of select="concat('startfontstyle','Bold Italic','endfontstyle')"/>
</xsl:otherwise>

</xsl:choose>

</xsl:if>

<xsl:if test="contains($stylmanu2,'Underline')">


<xsl:choose>
<xsl:when test="./@Underline='true'">
<xsl:if test= "not($manstyl eq $stylmanu)">
	<xsl:value-of select="'Underline'"/>
</xsl:if>

</xsl:when>
<xsl:otherwise>

<xsl:value-of select="concat('startunderline','true','endunderline')"/>
</xsl:otherwise>

</xsl:choose>

</xsl:if>
<xsl:if test="contains($stylmanu2,'StrikeThru')">
<xsl:choose>
<xsl:when test="./@StrikeThru='true'">
<xsl:if test= "not($manstyl eq $stylmanu)">
	<xsl:value-of select="'StrikeThru'"/>
</xsl:if>

</xsl:when>
<xsl:otherwise>

<xsl:value-of select="concat('startstrikeThru','true','endstrikeThru')"/>
</xsl:otherwise>

</xsl:choose>

</xsl:if>
<xsl:if test="contains($stylmanu2,'SmallCaps')">
<xsl:choose>
<xsl:when test="./@Capitalization='SmallCaps'">
<xsl:if test= "not($manstyl eq $stylmanu)">
	<xsl:value-of select="'SmallCaps'"/>
</xsl:if>

</xsl:when>
<xsl:otherwise>
<xsl:value-of select="concat('startcapitalization','SmallCaps','endcapitalization')"/>
</xsl:otherwise>

</xsl:choose>

</xsl:if>
<xsl:if test="contains($stylmanu2,'AllCaps')">
<xsl:choose>
<xsl:when test="./@Capitalization='AllCaps'">
<xsl:if test= "not($manstyl eq $stylmanu)">
	<xsl:value-of select="'AllCaps'"/>
</xsl:if>

</xsl:when>
<xsl:otherwise>
<xsl:value-of select="concat('startcapitalization','AllCaps','endcapitalization')"/>
</xsl:otherwise>

</xsl:choose>

</xsl:if>
<xsl:if test="contains($stylmanu2,'Superscript')">

<xsl:choose>
<xsl:when test="./@Position='Superscript'">
<xsl:if test= "not($manstyl eq $stylmanu)">
	<xsl:value-of select="'Superscript'"/>
</xsl:if>

</xsl:when>
<xsl:otherwise>
<xsl:value-of select="concat('startposition','Superscript','endposition')"/>
</xsl:otherwise>

</xsl:choose>
</xsl:if>
<xsl:if test="contains($stylmanu2,'Subscript')">
<xsl:choose>
<xsl:when test="./@Position='Subscript'">
<xsl:if test= "not($manstyl eq $stylmanu)">
	<xsl:value-of select="'Subscript'"/>
</xsl:if>

</xsl:when>
<xsl:otherwise>
<xsl:value-of select="concat('startposition','Subscript','endposition')"/>
</xsl:otherwise>

</xsl:choose>

</xsl:if>

</xsl:variable>

<xsl:if test="string($alstyle)">
<xsl:value-of select="'@manual@'"/>
</xsl:if>
<xsl:value-of select="$alstyle"/>
</xsl:attribute>


</xsl:when>
<xsl:otherwise>
<xsl:attribute name="AppliedCharacterStyle">
<xsl:value-of select="$stylmanu"/>
</xsl:attribute>
<xsl:attribute name="StyleManualChar">
<xsl:value-of select="$stylmanu"/>
</xsl:attribute>
</xsl:otherwise>
</xsl:choose>
 </xsl:for-each>

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