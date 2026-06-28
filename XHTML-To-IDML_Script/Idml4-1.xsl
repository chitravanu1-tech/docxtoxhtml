<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf" exclude-result-prefixes="xs mf" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" version="2.0">

        <xsl:output method="xml" name="xml" />
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
     </xsl:template>
	 
 <xsl:template match="XMLElement[@MarkupTag='XMLTag/links']">
     
<xsl:element name="XMLElement">
<xsl:attribute name="MarkupTag" select="'XMLTag/CrossRefCondition'"/>
        <xsl:copy>
      
      <xsl:apply-templates select="@*|node()"/>
      
		</xsl:copy>
		</xsl:element>
       <xsl:if test="self::XMLElement[@MarkupTag='XMLTag/links']/XMLAttribute">
           <!-- commented for inlineref Azure 15087 on 11-06-2024-->
           <!--<xsl:for-each select="self::XMLElement[@MarkupTag='XMLTag/links']/XMLAttribute">-->
               <xsl:element name="XMLElement">
				<xsl:attribute name="MarkupTag" select="'XMLTag/link'"/>
                   <!-- Added for inlineref Azure 15087 on 11-06-2024-->
                 <xsl:for-each select="self::XMLElement[@MarkupTag='XMLTag/links']/XMLAttribute">
				  <xsl:element name="XMLAttribute">
                    <xsl:if test="@*">
                        <xsl:for-each select="@*">
                            <xsl:attribute name="{name(.)}" select="."/>
                         </xsl:for-each>
                    </xsl:if>
                </xsl:element>
                    </xsl:for-each>
                </xsl:element>
           <!--</xsl:for-each>-->
        </xsl:if>

		
   
				
		</xsl:template>	


   
<!--<xsl:template match="XMLElement[@MarkupTag='XMLTag/sidebar']">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
       <xsl:if test="self::XMLElement[@MarkupTag='XMLTag/sidebar']/XMLAttribute[@Name='xml:id']">
           <xsl:for-each select="self::XMLElement[@MarkupTag='XMLTag/sidebar']/XMLAttribute[@Name='xml:id']">
                <xsl:element name="XMLElement">
				<xsl:attribute name="MarkupTag" select="'XMLTag/link'"/>
				  <xsl:element name="XMLAttribute">
                    <xsl:if test="@*">
                        <xsl:for-each select="@*">
                            <xsl:attribute name="{name(.)}" select="."/>
                        </xsl:for-each>
                    </xsl:if>
                </xsl:element>
                </xsl:element>
            </xsl:for-each>
        </xsl:if>

		
   
				
		</xsl:template>	-->

 


 	
  </xsl:stylesheet>
  