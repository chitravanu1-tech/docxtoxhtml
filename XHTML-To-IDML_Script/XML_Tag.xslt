<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:idPkg="http://ns.adobe.com/AdobeInDesign/idml/1.0/packaging"
    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" 
    exclude-result-prefixes="xs"
    version="2.0">
    


    <xsl:template match="/">
<xsl:apply-templates/>        
        
    </xsl:template>
    
    <xsl:template match="XmlStory">
        <xsl:element name="idPkg:Tags">
		<xsl:attribute name="DOMVersion">
		<xsl:value-of select="'8.0'"/>
		</xsl:attribute>
		 <xsl:element name="XMLTag">
			  <xsl:attribute name="Self">
			  <xsl:value-of select="'XMLTag/book'"/>
			  </xsl:attribute>
			   <xsl:attribute name="Name">
			  <xsl:value-of select="'book'"/>
			  </xsl:attribute>
			  <xsl:element name="Properties">
			  <xsl:element name="TagColor">
			    <xsl:attribute name="type">
			  <xsl:value-of select="'enumeration'"/>
			  </xsl:attribute>
			 <xsl:value-of select="'Red'"/>
			  </xsl:element>
			  </xsl:element>
			  </xsl:element>
			  <xsl:element name="XMLTag">
			  <xsl:attribute name="Self">
			  <xsl:value-of select="'XMLTag/Root'"/>
			  </xsl:attribute>
			   <xsl:attribute name="Name">
			  <xsl:value-of select="'Root'"/>
			  </xsl:attribute>
			  <xsl:element name="Properties">
			  <xsl:element name="TagColor">
			    <xsl:attribute name="type">
			  <xsl:value-of select="'enumeration'"/>
			  </xsl:attribute>
			 <xsl:value-of select="'Red'"/>
			  </xsl:element>
			  </xsl:element>
			  </xsl:element>
        <xsl:for-each select="descendant-or-self::XMLElement">
		<!--<xsl:choose>
		<xsl:when test="./@MarkupTag = 'XMLTag/FigureCitation' or ./@MarkupTag = 'XMLTag/CrossRefHighlight' or ./@MarkupTag = 'XMLTag/TableCitation' or ./@MarkupTag = 'XMLTag/BoxCitation' or ./@MarkupTag = 'XMLTag/PhotoCitation' or ./@MarkupTag = 'XMLTag/MapCitation' or ./@MarkupTag = 'XMLTag/ImageCitation' or ./@MarkupTag = 'XMLTag/VideoCitation' or ./@MarkupTag = 'XMLTag/ExampleCitation' or ./@MarkupTag = 'XMLTag/BX1_REF' or ./@MarkupTag = 'XMLTag/FIG_REF' or ./@MarkupTag = 'XMLTag/TAB_REF' or ./@MarkupTag = 'XMLTag/MAP_REF'">
		
		</xsl:when>
		<xsl:otherwise>-->
             <xsl:text>&#x000A;</xsl:text>
            <xsl:element name="XMLTag">
                <xsl:attribute name="Self" select="./@MarkupTag"/>
				 <xsl:attribute name="Name" select="substring-after(./@MarkupTag,'/')"/>
                <!--<xsl:value-of select="./@MarkupTag"/>-->
				 <xsl:text>&#x000A;</xsl:text>
				<xsl:element name="Properties">
				  <xsl:text>&#x000A;</xsl:text>
				  
				     <xsl:element name="TagColor">
					 <xsl:attribute name="type" select="'enumeration'"/>
				<xsl:value-of select="'Red'"/>
				  </xsl:element>
				   <xsl:text>&#x000A;</xsl:text>
				</xsl:element>
				
				 <xsl:text>&#x000A;</xsl:text>
				
            </xsl:element>
            <!--</xsl:otherwise>
			</xsl:choose>-->
        </xsl:for-each>
        </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>























<!--<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf" exclude-result-prefixes="xs mf" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" version="2.0">


 <xsl:template match="XMLElement">
   
 -/- <xsl:if test="./name() = 'XMLElement'">
   <ar></ar>
  </xsl:if>-/-
   
    <xsl:element name="aaa">
<xsl:value-of select="@MarkupTag" />
      </xsl:element>
   <xsl:element name="bbb">
<xsl:value-of select="XMLElement/@MarkupTag" />
      </xsl:element>
	     <xsl:element name="ccc">
<xsl:value-of select="XMLElement/XMLElement/@MarkupTag" />
      </xsl:element>
	    <xsl:element name="ddd">
<xsl:value-of select="XMLElement/XMLElement/XMLElement/@MarkupTag" />
      </xsl:element>
	     <xsl:element name="eee">
<xsl:value-of select="XMLElement/XMLElement/XMLElement/XMLElement/@MarkupTag" />
      </xsl:element>
	   <xsl:element name="fff">
<xsl:value-of select="XMLElement/XMLElement/XMLElement/XMLElement/XMLElement/@MarkupTag" />
      </xsl:element>
	    <xsl:element name="ggg">
<xsl:value-of select="XMLElement/XMLElement/XMLElement/XMLElement/XMLElement/XMLElement/@MarkupTag" />
      </xsl:element>
	      <xsl:element name="hhh">
<xsl:value-of select="XMLElement/XMLElement/XMLElement/XMLElement/XMLElement/XMLElement/XMLElement/@MarkupTag" />
      </xsl:element>
	     <xsl:element name="iii">
<xsl:value-of select="XMLElement/XMLElement/XMLElement/XMLElement/XMLElement/XMLElement/XMLElement/@MarkupTag" />
      </xsl:element>
	    <xsl:element name="jjj">
<xsl:value-of select="XMLElement/XMLElement/XMLElement/XMLElement/XMLElement/XMLElement/XMLElement/XMLElement/@MarkupTag" />
      </xsl:element>
	    <xsl:element name="kkk">
<xsl:value-of select="XMLElement/XMLElement/XMLElement/XMLElement/XMLElement/XMLElement/XMLElement/XMLElement/@MarkupTag" />
      </xsl:element>
	      <xsl:element name="lll">
<xsl:value-of select="XMLElement/XMLElement/XMLElement/XMLElement/XMLElement/XMLElement/XMLElement/XMLElement/XMLElement/@MarkupTag" />
      </xsl:element>
	      <xsl:element name="mmm">
<xsl:value-of select="XMLElement/XMLElement/XMLElement/XMLElement/XMLElement/XMLElement/XMLElement/XMLElement/XMLElement/@MarkupTag" />
      </xsl:element>
   </xsl:template>
   
   
    
 </xsl:stylesheet>-->