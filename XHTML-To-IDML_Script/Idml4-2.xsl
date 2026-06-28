<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf" exclude-result-prefixes="xs mf" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" version="2.0">

        <xsl:output method="xml" name="xml" />
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
     </xsl:template>
		
<xsl:key name="aaa" match="//XMLElement[@MarkupTag='XMLTag/link']" use="XMLAttribute/@Value"/>

<!--<xsl:template match="//XMLElement[@MarkupTag='XMLTag/link'][generate-id() != generate-id(key('aaa',XMLAttribute/@Value)[1])]"/>-->

    <xsl:template
        match="XMLElement[@MarkupTag='XMLTag/link']
        [XMLAttribute[@Name='linkend']/@Value != '']
        [generate-id() != generate-id(key('aaa', XMLAttribute[@Name='linkend']/@Value)[1])]"/>

    <xsl:template match="//XMLElement/XMLAttribute">

        <xsl:element name="XMLAttribute">
	
            <xsl:if test="./@*">
                  <xsl:for-each select="./@*">
                    <xsl:attribute name="{name(.)}" select="."/>
                      
					<xsl:copy>
					<xsl:apply-templates/>
					</xsl:copy>
                </xsl:for-each>
            </xsl:if>
        </xsl:element>	
		</xsl:template>
    
 <xsl:template match="CharacterStyleRange">
 <xsl:choose>
 <xsl:when test="ancestor::XMLElement[@MarkupTag='XMLTag/CrossRefCondition']">
 <xsl:copy>

 <xsl:attribute name="AppliedConditions" select="'Condition/CrossRefCondition'"/>

 
 <xsl:apply-templates select="@*|node()"/>
</xsl:copy>
 </xsl:when>
 <xsl:otherwise>
 <xsl:copy>
 <xsl:apply-templates select="@*|node()"/>
</xsl:copy>
 </xsl:otherwise>
 </xsl:choose>
 </xsl:template>

 <xsl:template match="XMLElement[@MarkupTag='XMLTag/CrossRefCondition']">
 <xsl:apply-templates/>
 </xsl:template>

</xsl:stylesheet>
  