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
      <!-- added to avoid the note text in Toc on 13-10-2021 -->
      <!--02-01-2024 commented for ignore StylesInScripts.xslt because we need to use toc="true" attribute from stylescollection.xml  -->
      <!-- <xsl:variable name="Graphic" select="document('FinalStyleCollGroup.xml')"/>-->
      
      <xsl:variable name="Graphic" select="document('StyleCollGroup.xml')"/>
      <xsl:param name="allSpaceCharacterEntity" select="'&#8232;|&#x0020;|&#xa0;|&#x00A0;|&#xA;|&#x9;|&#x2028;|&#8194;|&#8195;|&#x00009;|&#x0000A;|&#x02002;|&#x02003;|&#x02004;|&#x02005;|&#x02007;|&#x02008;|&#x02009;|&#x0200A;|&#x0200B;|&#x0200C;|&#x0200D;|&#x0200E;|&#x0200F;|&#x0205F;|&#x02060;|&#x02061;|&#x02062;|&#x02063;|&#x000AD;|&#x000A0;'"/>
<!--      <xsl:variable name="Graphic1" select="document('StylesCollection.sgml')"/>-->

      <xsl:template match="@* | node()">
            <xsl:copy>
                  <xsl:apply-templates select="@* | node()"/>
            </xsl:copy>
      </xsl:template>
      
      <xsl:template match="ParagraphStyleRange">
            
            <xsl:variable name="curName">
                  <xsl:choose>
                        <xsl:when test="matches(@AppliedParagraphStyle,'ParagraphStyle/Word Styles%3a')">
                              <xsl:value-of select="translate(substring-after(@AppliedParagraphStyle, 'ParagraphStyle/Word Styles%3a'),' ','')"/>
                        </xsl:when>
                        <xsl:when test="matches(@AppliedParagraphStyle,'ParagraphStyle/WordStyles%3a')">
                              <xsl:value-of select="translate(substring-after(@AppliedParagraphStyle, 'ParagraphStyle/WordStyles%3a'),' ','')"/>
                        </xsl:when>
                        <xsl:otherwise>
                              <xsl:value-of select="translate(substring-after(@AppliedParagraphStyle, 'ParagraphStyle/'),' ','')"/>
                        </xsl:otherwise>
                  </xsl:choose>
            </xsl:variable>            
           
            <!--<xsl:variable name="curName" select="@data-name"/>-->
            
            <!--<xsl:variable name="styleName">
                  <xsl:for-each select="$Graphic//style[@replacement]">
                        <!-\- <xsl:choose>
                              <xsl:when test="./@replacement = $curName">
                                    <xsl:value-of select="./@replacement"/>
                              </xsl:when>
                        </xsl:choose>-\->
                        <xsl:if test="./@replacement = $curName">
                              <xsl:value-of select="./@replacement"/>
                        </xsl:if>
                  </xsl:for-each>
            </xsl:variable>-->
            
            <xsl:variable name="styleName">
                  <xsl:for-each select="$Graphic/stylesList/paragraph/root[@tag]">
                        <xsl:if test="./translate(@tag,$allSpaceCharacterEntity,'') = $curName">
                              <xsl:value-of select="./translate(@tag,$allSpaceCharacterEntity,'')"/>
                        </xsl:if>
                  </xsl:for-each>
            </xsl:variable>
                                  
<!--            <xsl:message>Style:==<xsl:value-of select="$styleName"/>_____:idml==<xsl:value-of select="$curName"/>___REP::<xsl:value-of select="substring-after($Graphic/stylesList//root[translate(@tag,' ','') = $curName]/style[1]/@name, 'DZP_')"/></xsl:message>-->
     
            <xsl:variable name="PN">
                  <xsl:choose>
                        <xsl:when test="@ParaInfo != ''">
                              <xsl:value-of select="self::ParagraphStyleRange/@ParaInfo"/>
                        </xsl:when>
                        <xsl:otherwise>
                              <xsl:value-of select="self::ParagraphStyleRange/@ParaNumber"/>
                        </xsl:otherwise>
                  </xsl:choose>
            </xsl:variable>
            <xsl:variable name="txtFrameId">
                  <xsl:choose>
                        <xsl:when test="not(contains(substring-after(lower-case($PN), '_txtid_'), '_'))">
                              <xsl:choose>
                                    <xsl:when test="contains(lower-case($PN), '_txtid_')">
                                          <xsl:value-of select="substring-after(lower-case($PN), '_txtid_')"/>
                                    </xsl:when>
                              </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                              <xsl:choose>
                                    <xsl:when test="contains(lower-case($PN), '_txtid_')">
                                          <xsl:value-of select="substring-before(substring-after(lower-case($PN), '_txtid_'), '_')"/>
                                    </xsl:when>
                              </xsl:choose>
                        </xsl:otherwise>
                  </xsl:choose>
            </xsl:variable>
            <xsl:choose>
                  <xsl:when test="$styleName = $curName">
                        <xsl:copy>
                              <xsl:apply-templates select="@*"/>
                              <xsl:attribute name="AppliedParagraphStyle">
                                    <xsl:value-of select="'ParagraphStyle/'"/>
                                    <!--<xsl:value-of select="translate(substring-after($Graphic/stylesList/root[@tag = $curName]/@name, 'DZP_'), ' ', '')"/>-->
                                    
                                    <!--<xsl:value-of select="$Graphic/stylesList/root[@tag = $curName]/@"/>-->
                                    <!--<xsl:apply-templates select="substring-after($Graphic/stylesList/root[@tag = $curName]/style[1]/@name, 'DZP_')"></xsl:apply-templates>-->
                                    
                                    <!--<xsl:value-of select="substring-after($Graphic/stylesList/root[@tag = $curName]/style[1]/@name, 'DZP_')"/>-->
                                    <!--02-01-2024 commented for ignore StylesInScripts.xslt because we need to use toc="true" attribute from stylescollection.xml  -->
                                  <!--  <xsl:choose>
                                          <xsl:when test="$Graphic/stylesList//root[translate(@tag,' ','') = $curName]/style[@groupmath = 'True']">
                                                <xsl:value-of select="substring-after($Graphic/stylesList/paragraph/root[translate(@tag,' ','') = $curName]/style[@groupmath = 'True'][1]/@name, 'DZP_')"/>
                                          </xsl:when>
                                          <xsl:otherwise>
                                                <!-\- <xsl:value-of select="substring-after($Graphic/stylesList/root[@tag = $curName]/style[1]/@name, 'DZP_')"/>-\->
                                                <xsl:value-of select="$curName"/>
                                          </xsl:otherwise>
                                    </xsl:choose>-->
                                    <xsl:choose>
                                          <xsl:when test="$Graphic/stylesList/paragraph/root[translate(@tag,$allSpaceCharacterEntity,'') = $curName]/style[1]/starts-with(@name, 'DZP_TOC_')">                                                
                                                <xsl:value-of select="substring-after($Graphic/stylesList/paragraph/root[translate(@tag,$allSpaceCharacterEntity,'') = $curName]/style[1]/@name, 'DZP_')"/>
                                          </xsl:when>
                                          <xsl:when test="$Graphic/stylesList/paragraph/root[translate(@tag,$allSpaceCharacterEntity,'') = $curName][style[@epub = 'true'][1]]">                                               
                                                <xsl:value-of select="substring-after($Graphic/stylesList/paragraph/root[translate(@tag,$allSpaceCharacterEntity,'') = $curName][style[@epub = 'true'][1]]/style[1]/@name, 'DZP_')"/>
                                          </xsl:when>
                                          <xsl:when test="$Graphic/stylesList//root[translate(@tag,$allSpaceCharacterEntity,'') = $curName]/style[@toc = 'true'][1]">
                                                <xsl:value-of select="substring-after($Graphic/stylesList/paragraph/root[translate(@tag,$allSpaceCharacterEntity,'') = $curName]/style[@toc = 'true'][1]/@name, 'DZP_')"/>
                                          </xsl:when>
                                          <xsl:when test="$Graphic/stylesList//root[translate(@tag,$allSpaceCharacterEntity,'') = $curName]">                                                
                                                <xsl:value-of select="substring-after($Graphic/stylesList/paragraph/root[translate(@tag,$allSpaceCharacterEntity,'') = $curName]/style[1]/@name, 'DZP_')"/>  
                                          </xsl:when>
                                         <xsl:otherwise>                                              
                                               <!-- <xsl:value-of select="substring-after($Graphic/stylesList/root[@tag = $curName]/style[1]/@name, 'DZP_')"/>-->
                                               <xsl:value-of select="$curName"/>
                                         </xsl:otherwise>                                                           
                                    </xsl:choose>
                                    
                              </xsl:attribute>
                              <!--02-01-2024 commented for ignore StylesInScripts.xslt because we need to use toc="true" attribute from stylescollection.xml  -->
                            <!--  <xsl:choose>
                                    <xsl:when test="$Graphic/stylesList//root[translate(@tag,' ','') = $curName]/style[@groupmath = 'True' and @toc = 'true']">
                                          <xsl:attribute name="toc">
                                                <xsl:value-of select="$Graphic/stylesList/paragraph/root[translate(@tag,' ','') = $curName]/style[@groupmath = 'True' and @toc = 'true'][1]/@toc"/>
                                          </xsl:attribute>
                                    </xsl:when>
                              </xsl:choose>-->
                              <xsl:choose>
                                    <xsl:when test="$Graphic/stylesList//root[translate(@tag,$allSpaceCharacterEntity,'') = $curName]/style[@toc = 'true']">
                                          <xsl:attribute name="toc">
                                                <xsl:value-of select="$Graphic/stylesList/paragraph//root[translate(@tag,$allSpaceCharacterEntity,'') = $curName]/style[@toc = 'true'][1]/@toc"/>
                                          </xsl:attribute>
                                    </xsl:when>
                              </xsl:choose>
                              <xsl:attribute name="Client-Style">
                                    <xsl:value-of select="$curName"/>
                              </xsl:attribute>
                              <xsl:if test="string-length($txtFrameId) &gt; 0">
                                    <xsl:choose>
                                          <xsl:when test="starts-with($txtFrameId, 'u')">
                                                <xsl:attribute name="txtFrameId" select="$txtFrameId"/>
                                          </xsl:when>
                                          <xsl:otherwise>
                                                <xsl:attribute name="txtFrameId" select="concat('u', $txtFrameId)"/>
                                          </xsl:otherwise>
                                    </xsl:choose>
                              </xsl:if>
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
                                    <xsl:value-of select="translate($curName, $allSpaceCharacterEntity, '')"/>
                              </xsl:attribute>
                              <xsl:attribute name="Client-Style">
                                    <xsl:value-of select="$curName"/>
                              </xsl:attribute>
                              <xsl:if test="string-length($txtFrameId) &gt; 0">
                                    <xsl:choose>
                                          <xsl:when test="starts-with($txtFrameId, 'u')">
                                                <xsl:attribute name="txtFrameId" select="$txtFrameId"/>
                                          </xsl:when>
                                          <xsl:otherwise>
                                                <xsl:attribute name="txtFrameId" select="concat('u', $txtFrameId)"/>
                                          </xsl:otherwise>
                                    </xsl:choose>
                              </xsl:if>
                              <xsl:apply-templates select="node()"/>
                        </xsl:copy>
                  </xsl:otherwise>
            </xsl:choose>
            
      </xsl:template>
      <xsl:template match="CharacterStyleRange">
            <xsl:variable name="curChName" select="translate(substring-after(@AppliedCharacterStyle, 'CharacterStyle/'),' ','')"/> 
            <xsl:variable name="AllNestedStyles" select="parent::XMLElement/preceding::AllNestedStyles[1]/descendant::AppliedCharacterStyle/substring-after(.,'CharacterStyle/')"/>
            <xsl:variable name="NestedAppliedCharacterStyle" select="translate(substring-after(@NestedAppliedCharacterStyle, 'CharacterStyle/'),' ','')"/>
            
            <xsl:variable name="styleName">
                  <xsl:for-each select="$Graphic/stylesList/character/root[@tag]">
                        <xsl:if test="./translate(@tag,' ','') = $curChName">
                              <xsl:value-of select="./translate(@tag,' ','')"/>
                        </xsl:if>
                  </xsl:for-each>
            </xsl:variable>
            
            <xsl:choose>
                  <xsl:when test="$styleName = $curChName">
                       
                        <xsl:copy>
                              <xsl:apply-templates select="@*"/>
                              <xsl:attribute name="AppliedCharacterStyle">
                                    <xsl:value-of select="'CharacterStyle/'"/>
                                    <xsl:choose>
                                          <xsl:when test="$Graphic/stylesList//root[translate(@tag,' ','') = $curChName]/style[@toc = 'true']">
                                                <xsl:value-of select="substring-after($Graphic/stylesList/character//root[translate(@tag,' ','') = $curChName]/style[@toc = 'true'][1]/@name, 'DZC_')"/>
                                          </xsl:when>
                                          <xsl:otherwise>
                                                <!-- <xsl:value-of select="substring-after($Graphic/stylesList/root[@tag = $curChName]/style[1]/@name, 'DZC_')"/>-->
                                                <xsl:value-of select="$curChName"/>                                                                                          
                                          </xsl:otherwise>
                                    </xsl:choose>
                              </xsl:attribute>
                              <xsl:attribute name="Client-Style">
                                    <xsl:value-of select="$curChName"/>
                              </xsl:attribute>
                              <xsl:apply-templates select="node()"/>
                        </xsl:copy>                        
                  </xsl:when>
                  
                  <xsl:otherwise>
                        <xsl:copy>
                              <xsl:apply-templates select="@*"/>
                              <xsl:attribute name="AppliedCharacterStyle">
                                    <xsl:value-of select="'CharacterStyle/'"/>
                                    <xsl:value-of select="translate($curChName, ' ', '')"/>
                                    <!--  <xsl:if test="$AllNestedStyles">
                                             <xsl:value-of select="' '"/>
                                             <xsl:value-of select="$NestedAppliedCharacterStyle"/>
                                    </xsl:if>--> 
                              </xsl:attribute>
                              <xsl:attribute name="Client-Style">
                                    <xsl:value-of select="$curChName"/>
                              </xsl:attribute>
                              <xsl:apply-templates select="node()"/>
                        </xsl:copy>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      
      <xsl:template match="//w:pStyle | //r:rStyle">
            
            <xsl:variable name="curName" select="@w:val"/>
            
            <xsl:variable name="styleName">
                  <xsl:for-each select="$Graphic/stylesList/paragraph/root[@tag]">
                        <xsl:if test="./translate(@tag,' ','') = $curName">
                              <xsl:value-of select="./translate(@tag,' ','')"/>
                        </xsl:if>
                  </xsl:for-each>
            </xsl:variable>
            
            <xsl:choose>
                  <xsl:when test="$styleName = $curName">
                        <xsl:element name="w:pStyle">
                              <xsl:attribute name="w:val">
                                    <xsl:choose>
                                          <xsl:when test="$Graphic/stylesList//root[translate(@tag,' ','') = $curName]/style[@toc = 'true']">
                                                <xsl:value-of select="substring-after($Graphic/stylesList/paragraph//root[translate(@tag,' ','') = $curName]/style[@toc = 'true'][1]/@name, 'DZP_')"/>
                                          </xsl:when>
                                          <xsl:otherwise>
                                                <xsl:value-of select="$curName"/>
                                          </xsl:otherwise>
                                    </xsl:choose>
                              </xsl:attribute>
                              
                              <xsl:attribute name="Client-Style">
                                    <xsl:value-of select="$curName"/>
                              </xsl:attribute>
                              
                        </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:element name="w:pStyle">
                              <xsl:attribute name="w:val">
                                    <xsl:value-of select="$curName"/>
                              </xsl:attribute>
                              <xsl:attribute name="Client-Style">
                                    <xsl:value-of select="$curName"/>
                              </xsl:attribute>
                        </xsl:element>
                  </xsl:otherwise>
            </xsl:choose> 
            
      </xsl:template>
      
      <xsl:template name="create-log">
            <xsl:param name="message"/>
            
            <xsl:comment><xsl:value-of select='$message'/></xsl:comment>
            
      </xsl:template>
      
      <xsl:template match="span[@class]">            
            <xsl:variable name="curName" select="@class"/>
            <xsl:variable name="styleName">
                  <xsl:for-each select="$Graphic/stylesList/character/root[@tag]">
                        <xsl:if test="./translate(@tag,' ','') = $curName">
                              <xsl:value-of select="./translate(@tag,' ','')"/>
                        </xsl:if>
                  </xsl:for-each>
            </xsl:variable>

            <xsl:choose>
                  <xsl:when test="$styleName = $curName">
                        <xsl:element name="span">
                              <xsl:attribute name="class">
                                    <xsl:value-of select="substring-after($Graphic/stylesList/character/root[translate(@tag,' ','') = $curName]//style[@toc = 'true'][1]/@name, 'DZC_')"/>
                              </xsl:attribute>
                              <xsl:attribute name="Client-Style">
                                    <xsl:value-of select="$curName"/>
                              </xsl:attribute>
                              <xsl:copy-of select="@*"/>
                              <xsl:apply-templates/>
                        </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:element name="span">
                              <xsl:attribute name="class">
                                    <xsl:value-of select="$curName"/>
                              </xsl:attribute>
                              <xsl:attribute name="Client-Style">
                                    <xsl:value-of select="$curName"/>
                              </xsl:attribute>
                              <xsl:copy-of select="@*"/>
                              <xsl:apply-templates/>
                        </xsl:element>
                  </xsl:otherwise>
            </xsl:choose> 
            
      </xsl:template>
      <!--<xsl:template match="//w:pStyle" mode="hp">
            <xsl:variable name="curName" select="@w:val"/>
            <xsl:variable name="styleName">
                  <xsl:for-each select="$Graphic//style">                
                        <xsl:choose>
                              <xsl:when test="./@replacement eq $curName">
                                    <xsl:value-of select="./@replacement"></xsl:value-of>
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
      <!-- added to avoid the note text in Toc on 13-10-2021 -->
      <xsl:template match="ParagraphStyleRange/Note"/>
      <xsl:template match="CharacterStyleRange/Note"/>
      <xsl:template match="//CharacterStyleRange/Footnote"/>
      <xsl:template match="//CharacterStyleRange[contains(@AppliedCharacterStyle,'endnote reference')]"/>
      <xsl:template match="//CharacterStyleRange[contains(@AppliedCharacterStyle,'footnote reference')]"/>
      </xsl:stylesheet>