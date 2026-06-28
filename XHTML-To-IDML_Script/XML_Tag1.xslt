<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:idPkg="http://ns.adobe.com/AdobeInDesign/idml/1.0/packaging"
    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" 
    exclude-result-prefixes="xs"
    version="2.0">
	
        <xsl:key name="aaa" match="XMLTag" use="@Name"/>
		
		    
  
			
    <xsl:template match="node()|@*">

        <xsl:copy>
              <xsl:apply-templates select="node()|@*"/>
			

        </xsl:copy>
 

    </xsl:template>
	
    <xsl:template match="XMLTag[generate-id() != generate-id(key('aaa',@Name)[1])]"/>
			
				<xsl:template match="XMLTag/Properties/XMLTag">
					<!--<xsl:variable name="aaaa" select="//XMLTag/@Name"/>
				<xsl:if test="preceding-sibling::*[2][self::XMLTag[@Name='book']]">-->
				<xsl:element name="XMLTag">
				<xsl:attribute name="type" select="'enumeration'"/>
					<xsl:value-of select="'Red'"/>
									</xsl:element>
				<!--</xsl:if>-->
		</xsl:template>				
							  
				  
</xsl:stylesheet>



