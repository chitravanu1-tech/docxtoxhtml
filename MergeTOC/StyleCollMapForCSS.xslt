<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      xmlns:xs="http://www.w3.org/2001/XMLSchema" 
      xmlns:mf="http://example.com/mf"
      exclude-result-prefixes="xs mf"
      xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas"
      xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
      xmlns:o="urn:schemas-microsoft-com:office:office"
      xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"
      xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math"
      xmlns:v="urn:schemas-microsoft-com:vml"
      xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing"
      xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing"
      xmlns:w10="urn:schemas-microsoft-com:office:word"
      xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
      xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml"
      xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup"
      xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk"
      xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml"
      xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape"
      xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main"
      xmlns:math="http://exslt.org/math" 
      extension-element-prefixes="math"
      xmlns:pic="http://schemas.openxmlformats.org/drawingml/2006/picture"
      xmlns:a14="http://schemas.microsoft.com/office/drawing/2010/main"
      xmlns:idPkg="http://ns.adobe.com/AdobeInDesign/idml/1.0/packaging" 
      xmlns:num="http://whatever"
      xmlns="http://schemas.openxmlformats.org/package/2006/relationships"
      xmlns:sw8="http://schemas.openxmlformats.org/package/2006/relationships"
      xmlns:msxsl="urn:schemas-microsoft-com:xslt"
      xmlns:my-scripts="urn:my-scripts"
      mc:Ignorable="w14 wp14"
      version="2.0">


      <xsl:variable name="Graphic" select="document('FinalStyleCollGroup.xml')"/>
      
      <xsl:template match="@* | node()">
            <xsl:copy>
                  <xsl:apply-templates select="@* | node()"/>
            </xsl:copy>
      </xsl:template>
     
     <!-- <xsl:template match="w:styles/w:style">
            
            <xsl:variable name="styleId" select="normalize-space(lower-case(@w:styleId))"/>
            <xsl:variable name="styleId_1" select="@w:styleId"/>
            <xsl:variable name="styleName">
                  <xsl:for-each select="$Graphic/stylesList/paragraph/root[@tag]">
                        <xsl:if test="./@tag = $styleId">
                              <xsl:value-of select="./normalize-space(lower-case(@tag))"/>
                        </xsl:if>
                  </xsl:for-each>
            </xsl:variable>            
            
            <xsl:choose>
                  <xsl:when test="$styleName = $styleId">
                        <xsl:copy>
                              <xsl:apply-templates select="@*"/>
                              <xsl:attribute name="w:styleId">
                                                               
                                    <xsl:choose>
                                          <xsl:when test="$Graphic/stylesList//root[@tag = $styleId]/style[@groupmath = 'True']">
                                                <xsl:value-of select="substring-after($Graphic/stylesList/paragraph/root[@tag = $styleId]/style[@groupmath = 'True'][1]/@name, 'DZP_')"/>
                                          </xsl:when>
                                          <xsl:otherwise>
                                                <!-\- <xsl:value-of select="substring-after($Graphic/stylesList/root[@tag = $curName]/style[1]/@name, 'DZP_')"/>-\->
                                                <xsl:value-of select="$styleId_1"/>
                                          </xsl:otherwise>
                                    </xsl:choose>
                              </xsl:attribute>
                             <!-\- <xsl:attribute name="Client-Style">
                                    <xsl:value-of select="$styleId"/>
                              </xsl:attribute>-\->
                              <xsl:apply-templates select="node()"/>
                        </xsl:copy>
                        
                  </xsl:when>
                  
                  <xsl:otherwise>
                        <xsl:copy>
                              <xsl:apply-templates select="@*"/>
                              <xsl:attribute name="w:styleId">
                                    <xsl:value-of select="translate($styleId_1, ' ', '')"/>
                              </xsl:attribute>
                             <!-\- <xsl:attribute name="Client-Style">
                                    <xsl:value-of select="$styleId"/>
                              </xsl:attribute>-\->
                              <xsl:apply-templates select="node()"/>
                        </xsl:copy>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>-->
      
      <xsl:template match="w:styles/w:style/w:name">
            
            <xsl:variable name="nameVal" select="normalize-space(lower-case(@w:val))"/>
            <xsl:variable name="nameVal_1" select="@w:val"/>
            
            <xsl:variable name="styleName">
                  <xsl:for-each select="$Graphic/stylesList/paragraph/root[@tag]">
                        <xsl:if test="./normalize-space(lower-case(@tag)) = $nameVal">
                              <xsl:value-of select="./normalize-space(lower-case(@tag))"/>
                        </xsl:if>
                  </xsl:for-each>
            </xsl:variable>       
                    
            <xsl:choose>
                  <xsl:when test="$styleName = $nameVal">
                        <xsl:copy>
                              <xsl:apply-templates select="@*"/>
                              <xsl:attribute name="w:val">
                                    
                                    <xsl:choose>
                                          <xsl:when test="$Graphic/stylesList/paragraph/root[@tag = $nameVal_1]/style[@groupmath = 'True']">
                                                <xsl:value-of select="substring-after($Graphic/stylesList/paragraph/root[@tag = $nameVal_1]/style[@groupmath = 'True'][1]/@name, 'DZP_')"/>
                                          </xsl:when>
                                          <xsl:when test="$Graphic/stylesList/character/root[@tag = $nameVal_1]/style[@groupmath = 'True']">
                                                <xsl:value-of select="substring-after($Graphic/stylesList/character/root[@tag = $nameVal_1]/style[@groupmath = 'True'][1]/@name, 'DZC_')"/>
                                          </xsl:when>
                                          <xsl:otherwise>
                                                <!-- <xsl:value-of select="substring-after($Graphic/stylesList/root[@tag = $curName]/style[1]/@name, 'DZP_')"/>-->
                                                <xsl:value-of select="$nameVal_1"/>
                                          </xsl:otherwise>
                                    </xsl:choose>
                              </xsl:attribute>
                              <xsl:attribute name="Client-Style">
                                    <xsl:value-of select="$nameVal_1"/>
                              </xsl:attribute>
                              <xsl:apply-templates select="node()"/>
                        </xsl:copy>
                        
                  </xsl:when>
                  
                  <xsl:otherwise>
                        <xsl:copy>
                              <xsl:apply-templates select="@*"/>
                              <xsl:attribute name="w:val">
                                    <xsl:value-of select="translate($nameVal_1, ' ', '')"/>
                              </xsl:attribute>
                              <!-- <xsl:attribute name="Client-Style">
                                    <xsl:value-of select="$styleId"/>
                              </xsl:attribute>-->
                              <xsl:apply-templates select="node()"/>
                        </xsl:copy>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
     
</xsl:stylesheet>
