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

      <xsl:output method="xml"/>
      <!--08-01-2024 commented for ignore StylesInScripts.xslt because we need to use toc="true" attribute from stylescollection.xml  -->
      <!--    <xsl:variable name="Graphic" select="document('FinalStyleCollGroup.xml')"/>-->
      <xsl:variable name="Graphic" select="document('StyleCollGroup.xml')"/>
      
<!--      <xsl:variable name="Graphic1" select="document('StylesCollection.sgml')"/>-->

      <xsl:template match="@* | node()">
            <xsl:copy>
                  <xsl:apply-templates select="@* | node()"/>
            </xsl:copy>
      </xsl:template>
                     
      <xsl:template match="p">
            <xsl:copy>
            <xsl:apply-templates select="@*"/>
                
                  <xsl:variable name="curName" select="lower-case(translate(@class,' ',''))"/>
                  <xsl:for-each select="$Graphic/stylesList/paragraph/root/style">
                        <xsl:variable name="findTocTrue">
                              <xsl:if test="./lower-case(substring-after(@name,'DZP_')) = $curName">                                    
                                    <xsl:if test="@toc = 'true'">                                          
                                          <xsl:value-of select="@toc"/>
                                    </xsl:if>
                              </xsl:if>
                        </xsl:variable>
                        
                        <xsl:choose>
                              <xsl:when test="./lower-case(substring-after(@name,'DZP_TOC_'))">
                                    <xsl:if test="./lower-case(substring-after(@name,'DZP_TOC_')) = $curName">
                                          <xsl:variable name="name" select="substring-after(@name,'DZP_')"/>
                                          <xsl:variable name="replacement" select="parent::root/@tag"/>
                                          <xsl:variable name="styleName"><xsl:value-of select="$name"/></xsl:variable>
                                                                                  
                                          <xsl:attribute name="class">
                                                <xsl:value-of select="$styleName"/>
                                          </xsl:attribute>
                                          <xsl:attribute name="data-name">
                                                <xsl:value-of select="$styleName"/>
                                          </xsl:attribute>
                                          <xsl:attribute name="Client-Style">
                                                <xsl:value-of select="$replacement"/>
                                          </xsl:attribute>
                                          <xsl:if test="string-length($findTocTrue) &gt; 0">
                                              <xsl:attribute name="toc">
                                                    <xsl:value-of select="$findTocTrue"/>
                                              </xsl:attribute>  
                                          </xsl:if>
                                    </xsl:if>   
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:if test="./lower-case(substring-after(@name,'DZP_')) = $curName">
                                          <xsl:variable name="name" select="substring-after(@name,'DZP_')"/>
                                          <xsl:variable name="replacement" select="parent::root/@tag"/>
                                          <xsl:variable name="styleName"><xsl:value-of select="$name"/></xsl:variable>
                                          <xsl:attribute name="class">
                                                <xsl:value-of select="$styleName"/>
                                          </xsl:attribute>
                                          <xsl:attribute name="data-name">
                                                <xsl:value-of select="$styleName"/>
                                          </xsl:attribute>
                                          <xsl:attribute name="Client-Style">
                                                <xsl:value-of select="$replacement"/>
                                          </xsl:attribute>
                                          <xsl:if test="string-length($findTocTrue) &gt; 0">
                                                <xsl:attribute name="toc">
                                                      <xsl:value-of select="$findTocTrue"/>
                                                </xsl:attribute>  
                                          </xsl:if>
                                    </xsl:if>   
                              </xsl:otherwise>
                        </xsl:choose>
                       
                  </xsl:for-each>
                  <xsl:apply-templates/>
            </xsl:copy>
            
      </xsl:template>
      
      <xsl:template match="p[@class='FrontMatterHeading']">
            <xsl:copy>
                  <xsl:apply-templates select="@*"/>
                  
                  <xsl:variable name="curName" select="lower-case(substring-before(@class,'Heading'))"/>
                  <xsl:variable name="curName1" select="lower-case(@class)"/>
                  
                  <xsl:for-each select="$Graphic/stylesList/paragraph/root/style">
                        <xsl:variable name="findTocTrue">
                              <xsl:if test="./lower-case(substring-after(@name,'DZP_')) = $curName1">                                    
                                    <xsl:if test="@toc = 'true'">                                          
                                          <xsl:value-of select="@toc"/>
                                    </xsl:if>
                              </xsl:if>
                        </xsl:variable>
                        <xsl:if test="./lower-case(substring-after(@name,'DZP_TOC_')) = $curName">
                              <xsl:variable name="name" select="substring-after(@name,'DZP_')"/>
                              <xsl:variable name="replacement" select="parent::root/@tag"/>
                              <xsl:variable name="styleName"><xsl:value-of select="$name"/></xsl:variable>
                              <xsl:attribute name="class">
                                    <xsl:value-of select="$styleName"/>
                              </xsl:attribute>
                              <xsl:attribute name="data-name">
                                    <xsl:value-of select="$styleName"/>
                              </xsl:attribute>
                              <xsl:attribute name="Client-Style">
                                    <xsl:value-of select="$replacement"/>
                              </xsl:attribute>
                        </xsl:if>    
                        <xsl:if test="string-length($findTocTrue) &gt; 0">
                              <xsl:attribute name="toc">
                                    <xsl:value-of select="$findTocTrue"/>
                              </xsl:attribute>  
                        </xsl:if>
                  </xsl:for-each>
                  
                  <xsl:apply-templates/>
            </xsl:copy>
            
      </xsl:template>
      <xsl:template match="p[@class='BackMatterHeading']">
            <xsl:copy>
                  <xsl:apply-templates select="@*"/>
                  
                  <xsl:variable name="curName" select="lower-case(substring-before(@class,'Heading'))"/>
                  <xsl:variable name="curName1" select="lower-case(@class)"/>

                  <xsl:for-each select="$Graphic/stylesList/paragraph/root/style">                        
                        <xsl:variable name="findTocTrue">
                              <xsl:if test="./lower-case(substring-after(@name,'DZP_')) = $curName1">                                    
                                    <xsl:if test="@toc = 'true'">                                          
                                          <xsl:value-of select="@toc"/>                                         
                                    </xsl:if>
                              </xsl:if>
                        </xsl:variable>
                       
                        <xsl:if test="./lower-case(substring-after(@name,'DZP_TOC_')) = lower-case($curName)">
                              <xsl:variable name="name" select="substring-after(@name,'DZP_')"/>
                              <xsl:variable name="replacement" select="parent::root/@tag"/>
                              <xsl:variable name="styleName"><xsl:value-of select="$name"/></xsl:variable>
                              
                              <xsl:attribute name="class">
                                    <xsl:value-of select="$styleName"/>
                              </xsl:attribute>
                              <xsl:attribute name="data-name">
                                    <xsl:value-of select="$styleName"/>
                              </xsl:attribute>
                              <xsl:attribute name="Client-Style">
                                    <xsl:value-of select="$replacement"/>
                              </xsl:attribute>                              
                        </xsl:if>
                        <xsl:if test="string-length($findTocTrue) &gt; 0">
                              <xsl:attribute name="toc">
                                    <xsl:value-of select="$findTocTrue"/>
                              </xsl:attribute>  
                        </xsl:if>
                  </xsl:for-each>
                  
                  <xsl:apply-templates/>
            </xsl:copy>
            
      </xsl:template>
      
      <xsl:template match="p[@class='FB_IndexHeading']">
            <xsl:copy>
                  <xsl:apply-templates select="@*"/>
                  
                  <!--<xsl:variable name="curName" select="lower-case(substring-before(@class,'Heading'))"/>-->
                  <xsl:variable name="curName" select="'BackMatter'"/>
                  <xsl:variable name="curName1" select="'FB_IndexHeading'"/>
                  <xsl:for-each select="$Graphic/stylesList/paragraph/root/style">
                        <xsl:variable name="findTocTrue">
                              <xsl:if test="./lower-case(substring-after(@name,'DZP_')) = $curName1">                                    
                                    <xsl:if test="@toc = 'true'">                                          
                                          <xsl:value-of select="@toc"/>
                                    </xsl:if>
                              </xsl:if>
                        </xsl:variable>
                        <xsl:if test="./lower-case(substring-after(@name,'DZP_TOC_')) = lower-case($curName)">
                              <xsl:variable name="name" select="substring-after(@name,'DZP_')"/>
                              <xsl:variable name="replacement" select="parent::root/@tag"/>
                              <xsl:variable name="styleName"><xsl:value-of select="$name"/></xsl:variable>
                              
                              <xsl:attribute name="class">
                                    <xsl:value-of select="$styleName"/>
                              </xsl:attribute>
                              <xsl:attribute name="data-name">
                                    <xsl:value-of select="$styleName"/>
                              </xsl:attribute>
                              <xsl:attribute name="Client-Style">
                                    <xsl:value-of select="$replacement"/>
                              </xsl:attribute>                             
                        </xsl:if>
                        <xsl:if test="string-length($findTocTrue) &gt; 0">
                              <xsl:attribute name="toc">
                                    <xsl:value-of select="$findTocTrue"/>
                              </xsl:attribute>  
                        </xsl:if>
                  </xsl:for-each>
                  
                  <xsl:apply-templates/>
            </xsl:copy>
            
      </xsl:template>
           
      <xsl:template match="p[@class='DocumentAuthor']">
            <xsl:copy>
                  <xsl:apply-templates select="@*"/>
                  
                  <!--<xsl:variable name="curName" select="lower-case(substring-before(@class,'Heading'))"/>-->
                  <xsl:variable name="curName" select="'ChapterAuthor'"/>
                  
                  
                  
                  <xsl:for-each select="$Graphic/stylesList/paragraph/root/style">
                        <!--<xsl:variable name="findTocTrue">
                              <xsl:if test="./lower-case(substring-after(@name,'DZP_')) = $curName">                                    
                                    <xsl:if test="@toc = 'true'">                                          
                                          <xsl:value-of select="@toc"/>
                                    </xsl:if>
                              </xsl:if>
                        </xsl:variable>-->
                        <xsl:if test="./lower-case(substring-after(@name,'DZP_TOC_')) = lower-case($curName)">
                              <xsl:variable name="name" select="substring-after(@name,'DZP_')"/>
                              <xsl:variable name="replacement" select="parent::root/@tag"/>
                              <xsl:variable name="styleName"><xsl:value-of select="$name"/></xsl:variable>
                              
                              <xsl:attribute name="class">
                                    <xsl:value-of select="$styleName"/>
                              </xsl:attribute>
                              <xsl:attribute name="data-name">
                                    <xsl:value-of select="$styleName"/>
                              </xsl:attribute>
                              <xsl:attribute name="Client-Style">
                                    <xsl:value-of select="$replacement"/>
                              </xsl:attribute>
                             <!-- <xsl:if test="string-length($findTocTrue) &gt; 0">
                                    <xsl:attribute name="toc">
                                          <xsl:value-of select="$findTocTrue"/>
                                    </xsl:attribute>  
                              </xsl:if>-->
                        </xsl:if>
                        
                  </xsl:for-each>
                  
                  <xsl:apply-templates/>
            </xsl:copy>
            
      </xsl:template>
            
      <xsl:template match="p[@class='FrontMatterHeading'][text()='Contents']">
            
            <xsl:copy>
                  <xsl:apply-templates select="@*"/>
                  
                  <xsl:variable name="curName" select="lower-case(translate(@class,' ',''))"/>
                  
                  <xsl:for-each select="$Graphic/stylesList/paragraph/root/style">
                        <!--<xsl:variable name="findTocTrue">
                              <xsl:if test="./lower-case(substring-after(@name,'DZP_')) = $curName">                                    
                                    <xsl:if test="@toc = 'true'">                                          
                                          <xsl:value-of select="@toc"/>
                                    </xsl:if>
                              </xsl:if>
                        </xsl:variable>-->
                        <xsl:if test="./lower-case(substring-after(@name,'DZP_')) = $curName">
                              <xsl:variable name="name" select="substring-after(@name,'DZP_')"/>
                              <xsl:variable name="replacement" select="parent::root/@tag"/>
                              <xsl:variable name="styleName"><xsl:value-of select="$name"/></xsl:variable>
                              <xsl:attribute name="class">
                                    <xsl:value-of select="$styleName"/>
                              </xsl:attribute>
                              <xsl:attribute name="data-name">
                                    <xsl:value-of select="$styleName"/>
                              </xsl:attribute>
                              <xsl:attribute name="Client-Style">
                                    <xsl:value-of select="$replacement"/>
                              </xsl:attribute>
                            <!--  <xsl:if test="string-length($findTocTrue) &gt; 0">
                                    <xsl:attribute name="toc">
                                          <xsl:value-of select="$findTocTrue"/>
                                    </xsl:attribute>  
                              </xsl:if>-->
                        </xsl:if>                       
                  </xsl:for-each>
                  
                  <xsl:apply-templates/>
            </xsl:copy>
            
      </xsl:template>    
      </xsl:stylesheet>