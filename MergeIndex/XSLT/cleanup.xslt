<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" xmlns:idPkg="http://ns.adobe.com/AdobeInDesign/idml/1.0/packaging"
    version="2.0">
    
    <xsl:output method="xml" name="xml" standalone="yes" indent="yes"/>
    <xsl:preserve-space elements="Content"/>
    
    
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    
    <!--<xsl:template match="/">
        <xsl:element name="html">
            <xsl:element name="head"/>
            <xsl:element name="body">
                <xsl:copy>
                    <xsl:apply-templates select="node()|@*"/>
                </xsl:copy>
            </xsl:element>
        </xsl:element>
    </xsl:template>-->
  <!--<xsl:template match="//Note[Properties/descendant::KeyValuePair/@Value ='Notes_id_71']|TextFrame[@Name = 'Notes_id_71']">
        <xsl:message>
<xsl:value-of select="name(.)"/>
</xsl:message>
    </xsl:template>-->

    
    <xsl:template match="XMLElement|XMLAttribute|XMLComment|XMLInstruction">
        <xsl:apply-templates/>
    </xsl:template>
    
  <!--  <xsl:template match="@WordNumber|@*[starts-with(name(.),'ParaInfo')]|@*[starts-with(name(.),'ParaNumber')]|@ParentStory|@paraLID|@BookMarkDestination|@BookmarkCount"/>
   --> 
    <xsl:template match="Note[not(@*)]">
        <!--<xsl:element name="CharacterStyleRange">
            <xsl:attribute name="AppliedCharacterStyle" select="'CharacterStyle/$ID/[No character style]'"/>
            <xsl:copy>
                <xsl:apply-templates select="@*|node()"/>
            </xsl:copy>
        </xsl:element>-->
    </xsl:template>
    
   
</xsl:stylesheet>