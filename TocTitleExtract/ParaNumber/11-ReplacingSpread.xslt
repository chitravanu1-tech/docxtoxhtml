<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
<!--    <xsl:strip-space elements="*"/>
<xsl:preserve-space elements="*"/>-->
    <xsl:output method="xml" indent="yes" name="xml" xml:space="default"/>

    <!--    <xsl:template match="*">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>-->
    
    <!--<xsl:template match="MAPS/MAP">
        <xsl:variable name="M" select="."/>
        <xsl:variable name="filename" select="concat('output/',$M)"/>
        <xsl:result-document href="{$filename}" format="xml">
            
            <xsl:apply-templates select="document($M)"/> 
            
        </xsl:result-document>
    </xsl:template>-->
    
    <xsl:template match="MAPS">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
 <xsl:template match="*">
      <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>
      </xsl:copy>
  </xsl:template>
    
  <xsl:template match="@*"> 
      <!--commmented for bookmark and image name isuue for Hidden Scotland of Luster on 12-11-2020-->
          <!--<xsl:choose>
              <xsl:when test="contains(string(.),'e-')">
                  
                  <xsl:attribute name="{name(.)}">
                      <xsl:value-of select="replace(string(.), 'e-', '0')"/>                    
                  </xsl:attribute>
              </xsl:when>
              <xsl:otherwise>
                  <xsl:attribute name="{name(.)}">
                      <xsl:value-of select="string(.)"/>
                  </xsl:attribute>
              </xsl:otherwise>
          </xsl:choose> -->  
      <xsl:attribute name="{name(.)}">
          <xsl:value-of select="string(.)"/>
      </xsl:attribute>
  </xsl:template>
    
    
    <!-- Removing hidden layer objects from the document   -->
<!--    <xsl:template match="*[@layerVisibility='false']"/>-->
    
    <xsl:template match="Group/ObjectExportOption"/>
    <xsl:template match="Group/TextWrapPreference"/>
    
        
</xsl:stylesheet>