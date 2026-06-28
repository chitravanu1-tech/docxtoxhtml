<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:variable name="epub_StyleColl" select="document('StylesInScripts.xml')"/>
    
    <xsl:template match="@*|node()">        
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>            
        </xsl:copy> 
    </xsl:template>
    
    <xsl:template match="style">
      
      <xsl:variable name="DZPafterVal">
          <!--<xsl:for-each select=".[@name]">-->
          <xsl:choose>
              <xsl:when test="substring-after(@name,'DZC_')">
                  <xsl:value-of select="substring-after(@name,'DZC_')"/>
              </xsl:when>
              <xsl:otherwise>
                  <xsl:value-of select="substring-after(@name,'DZP_')"/>          
              </xsl:otherwise>
          </xsl:choose>
            
          <!--</xsl:for-each>-->         
      </xsl:variable>
        
        <xsl:variable name="epub_style">
            <xsl:for-each select="$epub_StyleColl/epub_stylesList/epub_style[@epub_name=$DZPafterVal]">
                <xsl:value-of select="'True'"/>
            </xsl:for-each>    
        </xsl:variable>
        
        <xsl:choose>
            <xsl:when test="$epub_style = 'True'">
                <xsl:copy>
                    <xsl:apply-templates select="@*"/>
                    <xsl:attribute name="groupmath" select="'True'"/>
                    <xsl:apply-templates select="node()"/>            
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