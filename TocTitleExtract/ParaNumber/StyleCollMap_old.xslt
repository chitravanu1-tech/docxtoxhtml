<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf" exclude-result-prefixes="xs mf" 
      xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
      xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"
      xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" xmlns:v="urn:schemas-microsoft-com:vml"
      xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing" xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" 
      xmlns:w10="urn:schemas-microsoft-com:office:word" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
      xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml" xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup" 
      xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk" xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml"
      xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape"  xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" 
      xmlns:math="http://exslt.org/math" extension-element-prefixes="math" xmlns:pic="http://schemas.openxmlformats.org/drawingml/2006/picture"
      xmlns:a14="http://schemas.microsoft.com/office/drawing/2010/main" xmlns:idPkg="http://ns.adobe.com/AdobeInDesign/idml/1.0/packaging" 
      xmlns:num="http://whatever"
      version="2.0">
      
      
      <xsl:variable name="Graphic" select="document('FinalStyleCollGroup.xml')"/>
      
      <xsl:template match="@* | node()">
            <xsl:copy>
                  <xsl:apply-templates select="@* | node()"/>
            </xsl:copy>
      </xsl:template>
      
      
      <xsl:template match="ParagraphStyleRange">
           
            <xsl:variable name="curName" select="substring-after(@AppliedParagraphStyle,'ParagraphStyle/')"/>
            <!--<xsl:variable name="curName" select="@data-name"/>-->
            
            <xsl:variable name="styleName">
                  <xsl:for-each select="$Graphic//style[@replacement]">
                       <!-- <xsl:choose>
                              <xsl:when test="./@replacement = $curName">
                                    <xsl:value-of select="./@replacement"/>
                              </xsl:when>
                        </xsl:choose>-->
                        <xsl:if test="./@replacement = $curName">
                              <xsl:value-of select="./@replacement"/>
                        </xsl:if>
                  </xsl:for-each>
            </xsl:variable>
            
            <xsl:message><xsl:value-of select="$styleName"/></xsl:message>
            
            <xsl:choose>
                  <xsl:when test="$styleName = $curName">
                        <xsl:copy>
                              <xsl:apply-templates select="@*"/>
                              <xsl:attribute name="AppliedParagraphStyle">
                                    <xsl:value-of select="'ParagraphStyle/'"/>
                                    <xsl:value-of select="translate(substring-after($Graphic//style[@replacement = $curName]/@name,'DZP_'),' ','')"/>
                              </xsl:attribute>
                              <xsl:apply-templates select="node()"/>
                        </xsl:copy>
                  </xsl:when>
                 <!-- <xsl:when test="$styleName = $curName">
                        <xsl:copy>
                              <xsl:apply-templates select="@*"/>
                              <xsl:attribute name="AppliedParagraphStyle">
                                    <xsl:value-of select="'ParagraphStyle/'"/>
                                    <xsl:value-of select="translate(substring-after($Graphic//style[@replacement = $curName]/@name,'DZC_'),' ','')"/>
                              </xsl:attribute>
                              <xsl:apply-templates select="node()"/>
                        </xsl:copy>
                  </xsl:when>-->
                  <xsl:otherwise>
                        <xsl:copy>
                              <xsl:apply-templates select="@*"/>
                              <xsl:attribute name="AppliedParagraphStyle">
                                    <xsl:value-of select="'ParagraphStyle/'"/>
                                    <xsl:value-of select="translate($curName,' ','')"/>
                              </xsl:attribute>                              
                              <xsl:apply-templates select="node()"/>
                        </xsl:copy>
                  </xsl:otherwise>
            </xsl:choose>
            
      </xsl:template>
      
      <!--<xsl:template match="//w:pStyle" mode="hp">
            <xsl:variable name="curName" select="@w:val"/>
            <xsl:variable name="styleName">
                  <xsl:for-each select="$Graphic//style">
                        <xsl:choose>
                              <xsl:when test="./@find eq $curName">
                                    <xsl:value-of select="./@find"/>
                              </xsl:when>
                        </xsl:choose>
                  </xsl:for-each>
            </xsl:variable>
            <xsl:choose>
                  <xsl:when test="$styleName = $curName"/>
                  <xsl:otherwise>
                        <xsl:element name="node">
                              <xsl:value-of select="$curName"/>
                              <xsl:text>&#x000A;</xsl:text>
                        </xsl:element>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>-->
      <!-- Backup code for my future references -->
      <!--<xsl:template match="//w:pStyleYYY">
            <xsl:variable name="styleName" select="@w:val"/>
            <xsl:for-each select="$Graphic//style">
                  <xsl:if test="./@find eq $styleName">
                        <xsl:element name="w:pStyle">
                              <xsl:attribute name="w:val">
                                    <xsl:value-of select="@replace"/>
                              </xsl:attribute>
                        </xsl:element>
                  </xsl:if>
                  <xsl:if test="not(./@find eq $styleName)">
                        <xsl:element name="w:pStyle">
                              <xsl:attribute name="w:val">
                                    <xsl:value-of select="$styleName"/>
                              </xsl:attribute>
                        </xsl:element>
                  </xsl:if>
                  <!-\-<xsl:choose>
                        <xsl:when test="./@find eq $styleName">                        
                              <xsl:element name="w:pStyle">
                                    <xsl:attribute name="w:val">
                                          <xsl:value-of select="@replace"/>
                                    </xsl:attribute>
                              </xsl:element>                           
                        </xsl:when>
                        <xsl:otherwise>
                              
                        </xsl:otherwise>                   
                  </xsl:choose> -\->
            </xsl:for-each>
      </xsl:template>-->
</xsl:stylesheet>