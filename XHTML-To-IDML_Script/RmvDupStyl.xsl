<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:idPkg="http://ns.adobe.com/AdobeInDesign/idml/1.0/packaging"
    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" 
    exclude-result-prefixes="xs"
    version="2.0">
	
        <xsl:key name="aaa" match="ParagraphStyleRange" use="@AppliedParagraphStyle"/>
		<xsl:key name="aaa1" match="CharacterStyleRange" use="@AppliedCharacterStyle"/>
		       <xsl:key name="aaa2" match="ParagraphStyle" use="@AppliedParagraphStyle"/>
		<xsl:key name="aaa3" match="CharacterStyle" use="@AppliedCharacterStyle"/>
  
			
    <xsl:template match="node()|@*">

        <xsl:copy>
              <xsl:apply-templates select="node()|@*"/>
			

        </xsl:copy>
 

    </xsl:template>
	
    <xsl:template match="ParagraphStyleRange[generate-id() != generate-id(key('aaa',@AppliedParagraphStyle)[1])]"/>
			  <xsl:template match="CharacterStyleRange[generate-id() != generate-id(key('aaa1',@AppliedCharacterStyle)[1])]"/>
	    <xsl:template match="ParagraphStyle[generate-id() != generate-id(key('aaa2',@AppliedParagraphStyle)[1])]"/>
			  <xsl:template match="CharacterStyle[generate-id() != generate-id(key('aaa3',@AppliedCharacterStyle)[1])]"/>
				  
</xsl:stylesheet>