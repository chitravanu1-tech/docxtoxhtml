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
    version="2.0">
    <xsl:strip-space elements="*"/>    
    <xsl:preserve-space elements="Content w:t"/>
  <!--Added for wyciwyg on 2-11-2020-->
  <!--<xsl:when test="contains($artmatch,'.jpg') or contains($artmatch,'.jpeg')"> on 02-07-2021-->
  <!-- Added to avoid multiple span tags on 29-09-2021 -->
  <!--commented to avoid the sup , sub missing issue-->
  <!-- Added sorting issue by HyperlinkTextSourceon 10-1-2022 -->
  <!-- Added to retain the hyperlink value without empty a tag  on 11-1-2022 -->
  <!-- Added to retain the endnotes id's on 8-7-2022 -->
  <!-- Added comment alone comes in empty para on 28-02-2023 -->
  <xsl:param name="PassArtPath"/>
   
    <!-- Global Vaiable -->
  
  <!--<xsl:variable name="styleType" select="//w:style/@w:type"/>-->
  <!--  <xsl:variable name="listmulti">  
        <xsl:for-each select="//w:abstractNum/w:lvl[w:pStyle[@w:val = 'ListNumberedMultilevel']]">      
            <xsl:choose>
                <xsl:when test="w:lvlText">
                    <!-\-<xsl:value-of select="w:lvlText/@w:val"></xsl:value-of>-\->
                    <xsl:value-of select="translate(w:lvlText/@w:val, '%0123456789', '')"/>
                </xsl:when>
            </xsl:choose>     
        </xsl:for-each>
    </xsl:variable>
    <xsl:variable name="listbull1">  
        <xsl:for-each select="//w:abstractNum/w:lvl[w:pStyle[@w:val = 'ListLevel1Bullet']]">      
            <xsl:choose>
                <xsl:when test="w:lvlText">
                    <xsl:value-of select="translate(w:lvlText/@w:val, '%0123456789', '')"/>
                </xsl:when>
            </xsl:choose>     
        </xsl:for-each>    
    </xsl:variable>  
    <xsl:variable name="NL">  
        <xsl:for-each select="//w:abstractNum/w:lvl[w:pStyle[@w:val = 'NL']]">      
            <xsl:choose>
                <xsl:when test="w:lvlText">
                    <xsl:value-of select="translate(w:lvlText/@w:val, '%0123456789', '')"/>
                </xsl:when>
            </xsl:choose>     
        </xsl:for-each>    
    </xsl:variable>
    <xsl:variable name="OBNL">  
        <xsl:for-each select="//w:abstractNum/w:lvl[w:pStyle[@w:val = 'OBNL']]">      
            <xsl:choose>
                <xsl:when test="w:lvlText">
                    <xsl:value-of select="translate(w:lvlText/@w:val, '%0123456789', '')"/>
                </xsl:when>
            </xsl:choose>     
        </xsl:for-each>    
    </xsl:variable>
    <xsl:variable name="HANL">  
        <xsl:for-each select="//w:abstractNum/w:lvl[w:pStyle[@w:val = 'HANL']]">      
            <xsl:choose>
                <xsl:when test="w:lvlText">
                    <xsl:value-of select="translate(w:lvlText/@w:val, '%0123456789', '')"/>
                </xsl:when>
            </xsl:choose>     
        </xsl:for-each>    
    </xsl:variable>
    <xsl:variable name="QNL">  
        <xsl:for-each select="//w:abstractNum/w:lvl[w:pStyle[@w:val = 'QNL']]">      
            <xsl:choose>
                <xsl:when test="w:lvlText">
                    <xsl:value-of select="translate(w:lvlText/@w:val, '%0123456789', '')"/>
                </xsl:when>
            </xsl:choose>     
        </xsl:for-each>    
    </xsl:variable>
    <xsl:variable name="QNL1">  
        <xsl:for-each select="//w:abstractNum/w:lvl[w:pStyle[@w:val = 'QNL1']]">      
            <xsl:choose>
                <xsl:when test="w:lvlText">
                    <xsl:value-of select="translate(w:lvlText/@w:val, '%0123456789', '')"/>
                </xsl:when>
            </xsl:choose>     
        </xsl:for-each>    
    </xsl:variable>
  -->  
  <!--<xsl:variable name="indent2" select="child::w:pPr/w:ind/@w:val"/>-->
  <!--<xsl:variable name="bulltypeFont" select="//w:abstractNum[@w:abstractNumId = $two]/w:lvl[@w:ilvl = $ilvl]/w:rPr/w:rFonts/@w:cs"/>-->
  <xsl:variable name="filename" select="substring-before(tokenize(base-uri(.), '/')[last()],'.')"/>
  <xsl:variable name="one" select="child::w:pPr/w:numPr/w:numId/@w:val"/>
  <xsl:variable name="indent" select="child::w:pPr/w:numPr/w:ilvl/@w:val"/>
    <xsl:variable name="ilvl" select="child::w:pPr/w:numPr/w:ilvl/@w:val"/>
    <xsl:variable name="two">
        <xsl:if test="//w:numbering/w:num/@w:numId = $one">
            <xsl:value-of select="//w:numbering/w:num[@w:numId = $one]/w:abstractNumId/@w:val"/>
        </xsl:if>
    </xsl:variable>                
    <xsl:variable name="three" select="//w:abstractNum[@w:abstractNumId = $two]/w:lvl[@w:ilvl = $ilvl]/w:numFmt/@w:val"/>
    <xsl:variable name="bulltype" select="//w:abstractNum[@w:abstractNumId = $two]/w:lvl[@w:ilvl = $ilvl]/w:lvlText/@w:val"/>
    
    <!-- END of Global Vaiable -->
    <xsl:output method="xml" name="xml" xml:space="preserve" indent="yes"/>

    
    
    <xsl:template match="@*|node()">        
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>            
        </xsl:copy>        
    </xsl:template>
    
    
    
        
    <xsl:param name="myNameSpace" select="'http://www.w3.org/1999/xhtml'"/>
  

  
  
  <xsl:template match="//w:r">
    <xsl:variable name="charStyle" select="w:rPr/w:rStyle/@w:val"/>
    <xsl:variable name="charStyleName">
      <xsl:value-of select="//w:style[@w:styleId = $charStyle]/w:name/@w:val"/>
    </xsl:variable>
    <xsl:variable name="color" select="w:rPr/w:color/@w:val"/>
    <xsl:variable name="hcolor" select="w:rPr/w:highlight/@w:val"/>
    <xsl:variable name="bold" select="w:rPr/w:b"/>
    
    <xsl:choose>
      <xsl:when test="ancestor::w:tc">
        <xsl:variable name="charstyle" select="child::w:rPr/w:rStyle/@w:val"/>
        <xsl:choose>
          <xsl:when
            test="contains($charstyle, 'No character style') or contains($charstyle, 'NO CHARACTER STYLE')
            or contains($charstyle, 'Nocharacterstyle')">
            <!--<xsl:apply-templates/>-->
            <xsl:choose>
                   <xsl:when test="w:rPr/w:b | w:rPr/w:rFonts | w:rPr/w:sz | w:rPr/w:color | w:rPr/w:position | w:rPr/w:smallCaps | w:rPr/w:u | w:rPr/w:strike | w:rPr/w:caps | w:rPr/w:dstrike | w:rPr/w:vertAlign | w:rPr/w:highlight">
        <xsl:if test="w:rPr/w:rPrChange">
          <xsl:text disable-output-escaping="yes">&lt;span style="font-weight:normal !msorm'"&gt;</xsl:text>  
        </xsl:if>
        <xsl:if test="w:rPr/w:vertAlign[@w:val = 'superscript']">
          <xsl:text disable-output-escaping="yes">&lt;sup&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:vertAlign[@w:val = 'subscript']">
          <xsl:text disable-output-escaping="yes">&lt;sub&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:b and not(w:rPr/w:b/@w:val = 'false')">
          <xsl:text disable-output-escaping="yes">&lt;b&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:i and not(w:rPr/w:i/@w:val = 'false')">
          <xsl:text disable-output-escaping="yes">&lt;i&gt;</xsl:text>
        </xsl:if>
        <!--<xsl:if test="w:rPr/w:u and not(w:rPr/w:u/@w:val = 'false')">
          <xsl:text disable-output-escaping="yes">&lt;u&gt;</xsl:text>
        </xsl:if>-->
        <xsl:if test="w:rPr/w:u">
          <xsl:if test="w:rPr/w:u">
            <xsl:choose>
              <xsl:when test="w:rPr/w:u[@w:val = 'double']">
                <xsl:text disable-output-escaping="yes">&lt;span class="DUnderline"&gt;</xsl:text>
              </xsl:when>
              <xsl:when test="w:rPr/w:u[@w:val = 'single']">
                <xsl:text disable-output-escaping="yes">&lt;u&gt;</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:if test="not(w:rPr/w:u[@w:val = 'none'])">
                  <xsl:text disable-output-escaping="yes">&lt;u&gt;</xsl:text>
                </xsl:if>
              </xsl:otherwise>
            </xsl:choose>          
          </xsl:if>          
        </xsl:if>
        <xsl:if test="w:rPr/w:strike">
          <xsl:text disable-output-escaping="yes">&lt;s&gt;</xsl:text>
        </xsl:if>
                     <xsl:if test="w:rPr/w:smallCaps[not(@w:val = '0')]">
          <xsl:text disable-output-escaping="yes">&lt;small&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:dstrike">
          <xsl:text disable-output-escaping="yes">&lt;span class="double-strike"&gt;</xsl:text>
          <xsl:text disable-output-escaping="yes">&lt;div class="the-lines"/&gt;</xsl:text>
        </xsl:if>
        
        
        <!-- Group SPAN tag -->
                     <xsl:if test="w:rPr/w:rFonts | w:rPr/w:szCs | w:rPr/w:sz | w:rPr/w:color | w:rPr/w:position | w:u | w:rPr/w:smallCaps[not(@w:val = '0')] | w:rPr/w:highlight">
          <xsl:text disable-output-escaping="yes">&lt;span</xsl:text>
          
          <xsl:if test="w:rPr/w:rFonts">
              <xsl:text disable-output-escaping="yes"> style="font-family:</xsl:text>  
            <xsl:choose>
              <xsl:when test="w:rPr/w:rFonts/@w:ascii">
                <xsl:value-of select="w:rPr/w:rFonts/@w:ascii"/>
              </xsl:when>
              <xsl:when test="w:rPr/w:rFonts/@w:cs">
                <xsl:value-of select="w:rPr/w:rFonts/@w:cs"/>
              </xsl:when>
              <xsl:when test="w:rPr/w:rFonts/@w:eastAsia">
                <xsl:value-of select="w:rPr/w:rFonts/@w:eastAsia"/>
              </xsl:when>              
              <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:ascii">
                <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:ascii"/>
              </xsl:when>
              <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia">
                <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"/>
              </xsl:when>
              <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia">
                <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"/>
              </xsl:when>                      
              <xsl:otherwise>
                <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"/>
              </xsl:otherwise>
            </xsl:choose>
              <!--<xsl:value-of select="w:rPr/w:rFonts/@w:cs"/>-->
              <xsl:text></xsl:text>              
            </xsl:if>
          <xsl:if test="w:rPr/w:szCs and not(w:rPr/w:sz)">
            <xsl:if test="w:rPr/w:rFonts">
              <xsl:text>;</xsl:text>  
            </xsl:if>
            <xsl:choose>
              <xsl:when test="w:rPr/w:rFonts">
                <xsl:text disable-output-escaping="yes"> font-size:'</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:text disable-output-escaping="yes"> style="font-size:'</xsl:text>
              </xsl:otherwise>
            </xsl:choose>
            <!--<xsl:text disable-output-escaping="yes"> style="font-size:'</xsl:text>  -->
            <!--<xsl:value-of select="$fontSize + (($fontSize * 10) div 100)"/>-->
            <xsl:value-of select="(w:rPr/w:szCs/@w:val) div 2 + ((w:rPr/w:szCs/@w:val) * 10 div 100)"/>
            <xsl:text>pt'</xsl:text>              
          </xsl:if>
          <xsl:if test="w:rPr/w:sz">
              <xsl:if test="w:rPr/w:rFonts">
                <xsl:text>;</xsl:text>  
              </xsl:if>
              <xsl:choose>
                <xsl:when test="w:rPr/w:rFonts">
                  <xsl:text disable-output-escaping="yes"> font-size:</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:text disable-output-escaping="yes"> style="font-size:</xsl:text>
                </xsl:otherwise>
              </xsl:choose>
              <!--<xsl:text disable-output-escaping="yes"> style="font-size:'</xsl:text>  -->
              <xsl:value-of select="(w:rPr/w:sz/@w:val) div 2"/>
              <xsl:text>pt</xsl:text>              
            </xsl:if>
          <xsl:if test="w:rPr/w:color">
            <xsl:if test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:position">
                <xsl:text>;</xsl:text>  
              </xsl:if>
              <xsl:choose>
                <xsl:when test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:position">
                  <xsl:text disable-output-escaping="yes"> </xsl:text>  
                </xsl:when> 
                <xsl:otherwise>
                  <xsl:text disable-output-escaping="yes"> style="</xsl:text>
                </xsl:otherwise>
              </xsl:choose>                            
              <xsl:choose>
                <xsl:when test="$color = 'auto'">
                  <xsl:value-of select="'000000'"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:text disable-output-escaping="yes">color: #</xsl:text>
                  <xsl:value-of select="$color"/>
                </xsl:otherwise>
              </xsl:choose>
              <!--<xsl:value-of select="$color"/>-->
              <xsl:text></xsl:text>              
            </xsl:if>            
          <!-- END of COLOR -->
          <!-- HIGHLIGHT -->
          <xsl:if test="w:rPr/w:highlight">
            <xsl:if test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:position | w:rPr/w:color">
              <xsl:text>;</xsl:text>  
            </xsl:if>
            <xsl:choose>
              <xsl:when test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:position | w:rPr/w:color">
                <xsl:text disable-output-escaping="yes"> </xsl:text>  
              </xsl:when> 
              <xsl:otherwise>
                <xsl:text disable-output-escaping="yes"> style="</xsl:text>
              </xsl:otherwise>
            </xsl:choose>                            
            <xsl:choose>
              <xsl:when test="$hcolor = 'auto'">
                <xsl:text disable-output-escaping="yes">color: #</xsl:text>
                <xsl:value-of select="'000000'"/>
              </xsl:when>
              <xsl:when test="$hcolor = 'lightGray'">
                <xsl:text disable-output-escaping="yes">background-color: #</xsl:text>
                <xsl:value-of select="'E8E8E8'"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:text disable-output-escaping="yes">color: #</xsl:text>
                <xsl:value-of select="$hcolor"/>
              </xsl:otherwise>
            </xsl:choose>
            <!--<xsl:value-of select="$color"/>-->
            <xsl:text></xsl:text>              
          </xsl:if>
          <!-- END of HIGHLIGHT -->
          <!-- position -->
          <xsl:if test="w:rPr/w:position">
            <xsl:if test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color|w:rPr/w:highlight">
              <xsl:text>; </xsl:text>  
            </xsl:if>
            <xsl:if test="not(w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color|w:rPr/w:highlight)">
              <xsl:text> style="</xsl:text>  
            </xsl:if>           
            <xsl:choose>
              <xsl:when test="child::w:rPr/w:position">
                <xsl:variable name="val" select="child::w:rPr/w:position/@w:val"/>
                <xsl:choose>
                  <xsl:when test="contains($val, '-')">
                    <xsl:text>position:relative;top:</xsl:text>
                    <xsl:value-of select="number(substring-after($val,'-')) div 2"/>
                    <xsl:text>pt;mso-text-raise:-</xsl:text>
                    <xsl:value-of select="number(substring-after($val,'-')) div 2"/>
                    <xsl:text>pt</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:text>position:relative;top:-</xsl:text>
                    <xsl:value-of select="number($val) div 2"/>
                    <xsl:text>pt;mso-text-raise:</xsl:text>
                    <xsl:value-of select="number($val) div 2"/>
                    <xsl:text>pt</xsl:text>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:when>
            </xsl:choose>                 
          </xsl:if>
          <!-- SMALLCAPS -->          
          <xsl:if test="w:rPr/w:smallCaps">            
            <xsl:if test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:position | w:rPr/w:highlight">
              <xsl:text>; </xsl:text>  
            </xsl:if>
            <xsl:if test="not(w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:position | w:rPr/w:highlight)">
              <xsl:text> style="</xsl:text>  
            </xsl:if>           
            <xsl:choose>
              <xsl:when test="child::w:rPr/w:smallCaps[not(@w:val = '0')]">
                <xsl:text>font-variant: 'small-caps';</xsl:text>                
              </xsl:when>
            </xsl:choose>                 
          </xsl:if>
          <!-- END SMALLCAPS -->
          <xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
          </xsl:if> 
        <!-- Group SPAN tag END-->
        
        <!-- 27-sep-16 prasanth asked to give class name also -->
        <xsl:variable name="classname" select="child::w:rPr/w:rStyle/@w:val"/>
        <xsl:choose>
          <xsl:when test="string-length($classname) > 0">
              <xsl:choose>
                <xsl:when test="child::w:rPr/w:rStyle/@w:val = 'CommentReference'">
                  <!--<span contenteditable="false" data-selected="true" data-track-changes-ignore="true"
                    name="cmd2"><img data-selected="true" data-track-changes-ignore="true" id="cmd2"
                      src="icon.png" style="width:15px;height:15px;"
                      title="Mariselvam:asd fasdfMariselvam:asd fasdf dsaf"/>-->
                    
                  
                  
                  <xsl:element name="span">
                  <xsl:attribute name="class">
                    <xsl:value-of select="'CommentReference'"/>
                  </xsl:attribute>
                    <!--<xsl:attribute name="contenteditable" select="'false'"/>-->
                    <xsl:attribute name="name">
                      <xsl:text>cmtref</xsl:text>
                      <xsl:value-of select="child::w:commentReference/@w:id + 1"/>
                    </xsl:attribute>
                    <xsl:attribute name="style" select="'display:none'"/>
                    <xsl:apply-templates/>
                  </xsl:element>
                  
                </xsl:when>
                <xsl:otherwise>
                  <xsl:choose>
                    <xsl:when test="w:rPr/w:smallCaps[not(@w:val = '0')] | w:rPr/w:caps[not(@w:val = '0')]">                      
                      <!--<xsl:value-of select="upper-case(.)"/>-->
                      <xsl:apply-templates/>
                    </xsl:when>
                    <xsl:when test="child::w:rPr/w:rStyle/@w:val = 'Nocharacterstyle1'">
                      <xsl:apply-templates/>
                    </xsl:when>
                    <xsl:otherwise>                      
                      <xsl:element name="span">
                        <xsl:attribute name="class">
                          <!--replace($charStyle, '^([0-9]+)','')-->
                          <xsl:value-of select="replace(child::w:rPr/w:rStyle/@w:val, '^([0-9]+)','')"/>
                        </xsl:attribute>
                        <xsl:attribute name="data-name">
                          <xsl:value-of select="child::w:rPr/w:rStyle/@w:val"/>
                        </xsl:attribute>
                        <xsl:apply-templates/>
                      </xsl:element> 
                    </xsl:otherwise>
                  </xsl:choose>                  
                </xsl:otherwise>
              </xsl:choose>
            <!--<span class="{child::w:rPr/w:rStyle/@w:val}">          
              <xsl:apply-templates/> 
            </span>-->
          </xsl:when>
          <xsl:otherwise>  
            <xsl:choose>
              <xsl:when test="w:rPr/w:smallCaps[not(@w:val = '0')] | w:rPr/w:caps[not(@w:val = '0')]">
                
                <!--<xsl:value-of select="upper-case(.)"/>-->
                <xsl:apply-templates/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:apply-templates/>    
              </xsl:otherwise>
            </xsl:choose>                    
          </xsl:otherwise>
        </xsl:choose>
        <!--<span class="{child::w:rPr/w:rStyle/@w:val}">          
          <xsl:apply-templates/>
        </span>-->
                     <xsl:if test="w:rPr/w:rFonts | w:rPr/w:szCs | w:rPr/w:sz | w:rPr/w:position | w:rPr/w:color | w:rPr/w:smallCaps[not(@w:val = '0')] | w:rPr/w:highlight">
            <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
         </xsl:if>
        
        <xsl:if test="w:rPr/w:dstrike">
          <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
        </xsl:if>
                     <xsl:if test="w:rPr/w:smallCaps[not(@w:val = '0')]">
          <xsl:text disable-output-escaping="yes">&lt;/small&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:strike">
          <xsl:text disable-output-escaping="yes">&lt;/s&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:u">
          <xsl:choose>
            <xsl:when test="w:rPr/w:u[@w:val = 'double']">
              <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
            </xsl:when>
            <xsl:when test="w:rPr/w:u[@w:val = 'single']">
              <xsl:text disable-output-escaping="yes">&lt;/u&gt;</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:if test="not(w:rPr/w:u[@w:val = 'none'])">
                <xsl:text disable-output-escaping="yes">&lt;/u&gt;</xsl:text>
              </xsl:if>
            </xsl:otherwise>
          </xsl:choose>          
        </xsl:if>
        <xsl:if test="w:rPr/w:i and not(w:rPr/w:i/@w:val = 'false')">
          <xsl:text disable-output-escaping="yes">&lt;/i&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:b and not(w:rPr/w:b/@w:val = 'false')">
          <xsl:text disable-output-escaping="yes">&lt;/b&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:vertAlign[@w:val = 'subscript']">
          <xsl:text disable-output-escaping="yes">&lt;/sub&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:vertAlign[@w:val = 'superscript']">
          <xsl:text disable-output-escaping="yes">&lt;/sup&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:rPrChange">
          <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>  
        </xsl:if>
      </xsl:when>
      
      <!-- ***********w:b********** -->
      <xsl:when test="w:rPr/w:i | w:rPr/w:rFonts | w:rPr/w:sz | w:rPr/w:color | w:rPr/w:position | w:rPr/w:smallCaps | w:rPr/w:u | w:rPr/w:strike | w:rPr/w:caps | w:rPr/w:dstrike | w:rPr/w:vertAlign">
        <xsl:if test="w:rPr/w:rPrChange">
          <xsl:text disable-output-escaping="yes">&lt;span style="font-style:normal !msorm'"&gt;</xsl:text>  
        </xsl:if>
        <xsl:if test="w:rPr/w:vertAlign[@w:val = 'superscript']">
          <xsl:text disable-output-escaping="yes">&lt;sup&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:vertAlign[@w:val = 'subscript']">
          <xsl:text disable-output-escaping="yes">&lt;sub&gt;</xsl:text>
        </xsl:if>        
        <xsl:if test="w:rPr/w:i and not(w:rPr/w:i/@w:val = 'false')">
          <xsl:text disable-output-escaping="yes">&lt;i&gt;</xsl:text>
        </xsl:if>
        <!--<xsl:if test="w:rPr/w:u and not(w:rPr/w:u/@w:val = 'false')">
          <xsl:text disable-output-escaping="yes">&lt;u&gt;</xsl:text>
        </xsl:if>-->
        <xsl:if test="w:rPr/w:u">
          <xsl:if test="w:rPr/w:u">
            <xsl:choose>
              <xsl:when test="w:rPr/w:u[@w:val = 'double']">
                <xsl:text disable-output-escaping="yes">&lt;span class="DUnderline"&gt;</xsl:text>
              </xsl:when>
              <xsl:when test="w:rPr/w:u[@w:val = 'single']">
                <xsl:text disable-output-escaping="yes">&lt;u&gt;</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:if test="not(w:rPr/w:u[@w:val = 'none'])">
                  <xsl:text disable-output-escaping="yes">&lt;u&gt;</xsl:text>
                </xsl:if>
              </xsl:otherwise>
            </xsl:choose>          
          </xsl:if>          
        </xsl:if>
        <xsl:if test="w:rPr/w:strike">
          <xsl:text disable-output-escaping="yes">&lt;s&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:smallCaps[not(@w:val = '0')]">
          <xsl:text disable-output-escaping="yes">&lt;small&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:dstrike">
          <xsl:text disable-output-escaping="yes">&lt;span class="double-strike"&gt;</xsl:text>
          <xsl:text disable-output-escaping="yes">&lt;div class="the-lines"/&gt;</xsl:text>
        </xsl:if>
        
        <!-- Group SPAN tag -->
        <xsl:if test="w:rPr/w:rFonts | w:rPr/w:szCs | w:rPr/w:sz | w:rPr/w:color | w:rPr/w:position | w:u | w:rPr/w:smallCaps[not(@w:val = '0')]">
          <xsl:text disable-output-escaping="yes">&lt;span</xsl:text>
          <xsl:if test="w:rPr/w:rFonts">
            <xsl:text disable-output-escaping="yes"> style="font-family:</xsl:text>  
            <xsl:choose>
              <xsl:when test="w:rPr/w:rFonts/@w:ascii">
                <xsl:value-of select="w:rPr/w:rFonts/@w:ascii"/>
              </xsl:when>
              <xsl:when test="w:rPr/w:rFonts/@w:cs">
                <xsl:value-of select="w:rPr/w:rFonts/@w:cs"/>
              </xsl:when>
              <xsl:when test="w:rPr/w:rFonts/@w:eastAsia">
                <xsl:value-of select="w:rPr/w:rFonts/@w:eastAsia"/>
              </xsl:when>
              <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:ascii">
                <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:ascii"/>
              </xsl:when>
              <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia">
                <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"/>
              </xsl:when>
              <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia">
                <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"/>
              </xsl:when> 
              <xsl:otherwise>
                <!--<xsl:value-of select="w:rPr/w:rFonts/@w:asciiTheme"/>-->
              </xsl:otherwise>
            </xsl:choose>
            <!--<xsl:value-of select="w:rPr/w:rFonts/@w:cs"/>-->
            <xsl:text></xsl:text>              
          </xsl:if>
          <xsl:if test="w:rPr/w:szCs and not(w:rPr/w:sz)">
            <xsl:if test="w:rPr/w:rFonts">
              <xsl:text>;</xsl:text>  
            </xsl:if>
            <xsl:choose>
              <xsl:when test="w:rPr/w:rFonts">
                <xsl:text disable-output-escaping="yes"> font-size:</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:text disable-output-escaping="yes"> style="font-size:</xsl:text>
              </xsl:otherwise>
            </xsl:choose>
            <!--<xsl:text disable-output-escaping="yes"> style="font-size:'</xsl:text>  -->
            <xsl:value-of select="(w:rPr/w:szCs/@w:val) div 2"/>
            <xsl:text>pt</xsl:text>              
          </xsl:if>
          <xsl:if test="w:rPr/w:sz">
            <xsl:if test="w:rPr/w:rFonts">
              <xsl:text>;</xsl:text>  
            </xsl:if>
            <xsl:choose>
              <xsl:when test="w:rPr/w:rFonts">
                <xsl:text disable-output-escaping="yes"> font-size:'</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:text disable-output-escaping="yes"> style="font-size:'</xsl:text>
              </xsl:otherwise>
            </xsl:choose>
            <!--<xsl:text disable-output-escaping="yes"> style="font-size:'</xsl:text>  -->
            <xsl:value-of select="(w:rPr/w:sz/@w:val) div 2"/>
            <xsl:text>pt'</xsl:text>              
          </xsl:if>
          <xsl:if test="w:rPr/w:color">
            <xsl:if test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:position">
              <xsl:text>;</xsl:text>  
            </xsl:if>
            <xsl:choose>
              <xsl:when test="w:rPr/w:sz | w:rPr/w:rFonts | w:rPr/w:position">
                <xsl:text disable-output-escaping="yes"> </xsl:text>  
              </xsl:when> 
              <xsl:otherwise>
                <xsl:text disable-output-escaping="yes"> style="</xsl:text> 
              </xsl:otherwise>
            </xsl:choose>
            <!--<xsl:text disable-output-escaping="yes"> style="'</xsl:text>  -->
            
            <xsl:choose>
              <xsl:when test="$color = 'auto'">
                <xsl:value-of select="'000000'"/>
              </xsl:when>
              <xsl:otherwise> 
                <xsl:text disable-output-escaping="yes">color: #</xsl:text>
                <xsl:value-of select="$color"/></xsl:otherwise>
            </xsl:choose>
            <!--<xsl:value-of select="$color"/>-->
          </xsl:if>
          <!-- position -->
          <xsl:if test="w:rPr/w:position">
            <xsl:if test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color">
              <xsl:text>; </xsl:text>  
            </xsl:if>
            <xsl:if test="not(w:rPr/w:sz | w:rPr/w:rFonts | w:rPr/w:color)">               
              <xsl:text> style="</xsl:text>  
            </xsl:if>           
            <xsl:choose>
              <xsl:when test="child::w:rPr/w:position">
                <xsl:variable name="val" select="child::w:rPr/w:position/@w:val"/>
                <xsl:choose>
                  <xsl:when test="contains($val, '-')">
                    <xsl:text>position:relative;top:</xsl:text>
                    <xsl:value-of select="number(substring-after($val,'-')) div 2"/>
                    <xsl:text>pt;mso-text-raise:-</xsl:text>
                    <xsl:value-of select="number(substring-after($val,'-')) div 2"/>
                    <xsl:text>pt</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:text>position:relative;top:-</xsl:text>
                    <xsl:value-of select="number($val) div 2"/>
                    <xsl:text>pt;mso-text-raise:</xsl:text>
                    <xsl:value-of select="number($val) div 2"/>
                    <xsl:text>pt</xsl:text>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:when>
            </xsl:choose>                 
          </xsl:if>
          <!-- end POSITION -->
          <!-- SMALLCAPS -->          
          <xsl:if test="w:rPr/w:smallCaps">            
            <xsl:if test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:position">
              <xsl:text>; </xsl:text>  
            </xsl:if>
            <xsl:if test="not(w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:position)">
              <xsl:text> style="</xsl:text>  
            </xsl:if>           
            <xsl:choose>
              <xsl:when test="child::w:rPr/w:smallCaps[not(@w:val = '0')]">
                <xsl:text>font-variant: 'small-caps';</xsl:text>                
              </xsl:when>
            </xsl:choose>                 
          </xsl:if>
          <!-- END SMALLCAPS -->
          
          <xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
        </xsl:if>          
        <!-- Group SPAN tag END-->
        
        <!-- 27-sep-16 prasanth asked to give class name also -->
        <xsl:variable name="classname" select="child::w:rPr/w:rStyle/@w:val"/>
        <xsl:choose>
          <xsl:when test="string-length($classname) > 0">            
            <xsl:choose>
              <xsl:when test="child::w:rPr/w:rStyle/@w:val = 'CommentReference'">
                <!--<span contenteditable="false" data-selected="true" data-track-changes-ignore="true"
                    name="cmd2"><img data-selected="true" data-track-changes-ignore="true" id="cmd2"
                      src="icon.png" style="width:15px;height:15px;"
                      title="Mariselvam:asd fasdfMariselvam:asd fasdf dsaf"/>-->
                
                
                
                <xsl:element name="span">
                  <xsl:attribute name="class">
                    <xsl:value-of select="'CommentReference'"/>
                  </xsl:attribute>
                  <!--<xsl:attribute name="contenteditable" select="'false'"/>-->
                  <xsl:attribute name="name">
                    <xsl:text>cmtref</xsl:text>
                    <xsl:value-of select="child::w:commentReference/@w:id + 1"/>
                  </xsl:attribute>
                  <xsl:attribute name="style" select="'display:none'"/>
                  <xsl:apply-templates/>
                </xsl:element>
                
              </xsl:when>
              <xsl:when test="child::w:rPr/w:rStyle/@w:val = 'Nocharacterstyle1'">
                <xsl:apply-templates/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:element name="span">
                  <xsl:attribute name="class">
                    <!--<xsl:value-of select="child::w:rPr/w:rStyle/@w:val"/>-->
                    <xsl:value-of select="replace(child::w:rPr/w:rStyle/@w:val, '^([0-9]+)','')"/>
                  </xsl:attribute>
                  <xsl:attribute name="data-name">
                    <xsl:value-of select="child::w:rPr/w:rStyle/@w:val"/>
                  </xsl:attribute>
                  <xsl:apply-templates/>
                </xsl:element>
              </xsl:otherwise>
            </xsl:choose>
            <!--<span class="{child::w:rPr/w:rStyle/@w:val}">          
              <xsl:apply-templates/> 
            </span>-->
          </xsl:when>
          <xsl:otherwise>  
            <xsl:choose>
              <xsl:when test="w:rPr/w:smallCaps[not(@w:val = '0')] | w:rPr/w:caps[not(@w:val = '0')]">
                <!--<xsl:value-of select="upper-case(.)"/>-->
                <xsl:apply-templates/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:apply-templates/>    
              </xsl:otherwise>
            </xsl:choose>                    
          </xsl:otherwise>
        </xsl:choose>
        
        <xsl:if test="w:rPr/w:rFonts | w:rPr/w:szCs | w:rPr/w:sz | w:rPr/w:position | w:rPr/w:color | w:rPr/w:smallCaps[not(@w:val = '0')]">
          <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
        </xsl:if>
        
        
        <xsl:if test="w:rPr/w:dstrike">
          <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:smallCaps[not(@w:val = '0')]">
          <xsl:text disable-output-escaping="yes">&lt;/small&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:strike">
          <xsl:text disable-output-escaping="yes">&lt;/s&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:u">
          <xsl:choose>
            <xsl:when test="w:rPr/w:u[@w:val = 'double']">
              <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
            </xsl:when>
            <xsl:when test="w:rPr/w:u[@w:val = 'single']">
              <xsl:text disable-output-escaping="yes">&lt;/u&gt;</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:if test="not(w:rPr/w:u[@w:val = 'none'])">
                <xsl:text disable-output-escaping="yes">&lt;/u&gt;</xsl:text>
              </xsl:if>
            </xsl:otherwise>
          </xsl:choose>          
        </xsl:if>
        <xsl:if test="w:rPr/w:i and not(w:rPr/w:i/@w:val = 'false')">
          <xsl:text disable-output-escaping="yes">&lt;/i&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:b and not(w:rPr/w:b/@w:val = 'false')">
          <xsl:text disable-output-escaping="yes">&lt;/b&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:vertAlign[@w:val = 'subscript']">
          <xsl:text disable-output-escaping="yes">&lt;/sub&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:vertAlign[@w:val = 'superscript']">
          <xsl:text disable-output-escaping="yes">&lt;/sup&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:rPrChange">
          <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>  
        </xsl:if>
      </xsl:when>
      
                  <xsl:when test="w:rPr/w:b and w:rPr/w:i">        
                    <xsl:element name="b">
                      <xsl:element name="i">
                        <xsl:apply-templates/>
                      </xsl:element>
                    </xsl:element>
                  </xsl:when>
                  <xsl:when test="w:rPr/w:b">
                    <xsl:element name="b">
                      <xsl:apply-templates/>
                    </xsl:element>
                  </xsl:when>
                  <xsl:when test="w:rPr/w:i">
                    <xsl:element name="i">
                      <xsl:apply-templates/>
                    </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:apply-templates/>
                  </xsl:otherwise>                  
                </xsl:choose>
          </xsl:when>
          <xsl:otherwise>
            <xsl:choose>
              
              <xsl:when test="child::w:rPr/w:rStyle/@w:val">
                <!--<span class="{concat('tbl_', child::w:rPr/w:rStyle/@w:val)}">-->
                  <!--<xsl:apply-templates/>-->
                  <xsl:choose>
                   <xsl:when test="w:rPr/w:b | w:rPr/w:rFonts | w:rPr/w:sz | w:rPr/w:color | w:rPr/w:position | w:rPr/w:smallCaps | w:rPr/w:u | w:rPr/w:strike | w:rPr/w:caps | w:rPr/w:dstrike | w:rPr/w:vertAlign | w:rPr/w:highlight">
        <xsl:if test="w:rPr/w:rPrChange">
          <xsl:text disable-output-escaping="yes">&lt;span style="font-weight:normal !msorm'"&gt;</xsl:text>  
        </xsl:if>
        <xsl:if test="w:rPr/w:vertAlign[@w:val = 'superscript']">
          <xsl:text disable-output-escaping="yes">&lt;sup&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:vertAlign[@w:val = 'subscript']">
          <xsl:text disable-output-escaping="yes">&lt;sub&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:b and not(w:rPr/w:b/@w:val = 'false')">
          <xsl:text disable-output-escaping="yes">&lt;b&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:i and not(w:rPr/w:i/@w:val = 'false')">
          <xsl:text disable-output-escaping="yes">&lt;i&gt;</xsl:text>
        </xsl:if>
        <!--<xsl:if test="w:rPr/w:u and not(w:rPr/w:u/@w:val = 'false')">
          <xsl:text disable-output-escaping="yes">&lt;u&gt;</xsl:text>
        </xsl:if>-->
        <xsl:if test="w:rPr/w:u">
          <xsl:if test="w:rPr/w:u">
            <xsl:choose>
              <xsl:when test="w:rPr/w:u[@w:val = 'double']">
                <xsl:text disable-output-escaping="yes">&lt;span class="DUnderline"&gt;</xsl:text>
              </xsl:when>
              <xsl:when test="w:rPr/w:u[@w:val = 'single']">
                <xsl:text disable-output-escaping="yes">&lt;u&gt;</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:if test="not(w:rPr/w:u[@w:val = 'none'])">
                  <xsl:text disable-output-escaping="yes">&lt;u&gt;</xsl:text>
                </xsl:if>
              </xsl:otherwise>
            </xsl:choose>          
          </xsl:if>          
        </xsl:if>
        <xsl:if test="w:rPr/w:strike">
          <xsl:text disable-output-escaping="yes">&lt;s&gt;</xsl:text>
        </xsl:if>
                     <xsl:if test="w:rPr/w:smallCaps[not(@w:val = '0')]">
          <xsl:text disable-output-escaping="yes">&lt;small&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:dstrike">
          <xsl:text disable-output-escaping="yes">&lt;span class="double-strike"&gt;</xsl:text>
          <xsl:text disable-output-escaping="yes">&lt;div class="the-lines"/&gt;</xsl:text>
        </xsl:if>
        
        
        <!-- Group SPAN tag -->
                     <xsl:if test="w:rPr/w:rFonts | w:rPr/w:szCs | w:rPr/w:sz | w:rPr/w:color | w:rPr/w:position | w:u | w:rPr/w:smallCaps[not(@w:val = '0')] | w:rPr/w:highlight">
          <xsl:text disable-output-escaping="yes">&lt;span</xsl:text>
          
          <xsl:if test="w:rPr/w:rFonts">
              <xsl:text disable-output-escaping="yes"> style="font-family:</xsl:text>  
            <xsl:choose>
              <xsl:when test="w:rPr/w:rFonts/@w:ascii">
                <xsl:value-of select="w:rPr/w:rFonts/@w:ascii"/>
              </xsl:when>
              <xsl:when test="w:rPr/w:rFonts/@w:cs">
                <xsl:value-of select="w:rPr/w:rFonts/@w:cs"/>
              </xsl:when>
              <xsl:when test="w:rPr/w:rFonts/@w:eastAsia">
                <xsl:value-of select="w:rPr/w:rFonts/@w:eastAsia"/>
              </xsl:when>              
              <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:ascii">
                <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:ascii"/>
              </xsl:when>
              <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia">
                <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"/>
              </xsl:when>
              <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia">
                <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"/>
              </xsl:when>                      
              <xsl:otherwise>
                <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"/>
              </xsl:otherwise>
            </xsl:choose>
              <!--<xsl:value-of select="w:rPr/w:rFonts/@w:cs"/>-->
              <xsl:text></xsl:text>              
            </xsl:if>
          <xsl:if test="w:rPr/w:szCs and not(w:rPr/w:sz)">
            <xsl:if test="w:rPr/w:rFonts">
              <xsl:text>;</xsl:text>  
            </xsl:if>
            <xsl:choose>
              <xsl:when test="w:rPr/w:rFonts">
                <xsl:text disable-output-escaping="yes"> font-size:'</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:text disable-output-escaping="yes"> style="font-size:'</xsl:text>
              </xsl:otherwise>
            </xsl:choose>
            <!--<xsl:text disable-output-escaping="yes"> style="font-size:'</xsl:text>  -->
            <xsl:value-of select="(w:rPr/w:szCs/@w:val) div 2"/>
            <xsl:text>pt'</xsl:text>              
          </xsl:if>
          <xsl:if test="w:rPr/w:sz">
              <xsl:if test="w:rPr/w:rFonts">
                <xsl:text>;</xsl:text>  
              </xsl:if>
              <xsl:choose>
                <xsl:when test="w:rPr/w:rFonts">
                  <xsl:text disable-output-escaping="yes"> font-size:</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:text disable-output-escaping="yes"> style="font-size:</xsl:text>
                </xsl:otherwise>
              </xsl:choose>
              <!--<xsl:text disable-output-escaping="yes"> style="font-size:'</xsl:text>  -->
              <xsl:value-of select="(w:rPr/w:sz/@w:val) div 2"/>
              <xsl:text>pt</xsl:text>              
            </xsl:if>
          <xsl:if test="w:rPr/w:color">
            <xsl:if test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:position">
                <xsl:text>;</xsl:text>  
              </xsl:if>
              <xsl:choose>
                <xsl:when test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:position">
                  <xsl:text disable-output-escaping="yes"> </xsl:text>  
                </xsl:when> 
                <xsl:otherwise>
                  <xsl:text disable-output-escaping="yes"> style="</xsl:text>
                </xsl:otherwise>
              </xsl:choose>                            
              <xsl:choose>
                <xsl:when test="$color = 'auto'">
                  <xsl:value-of select="'000000'"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:text disable-output-escaping="yes">color: #</xsl:text>
                  <xsl:value-of select="$color"/>
                </xsl:otherwise>
              </xsl:choose>
              <!--<xsl:value-of select="$color"/>-->
              <xsl:text></xsl:text>              
            </xsl:if>            
          <!-- END of COLOR -->
          <!-- HIGHLIGHT -->
          <xsl:if test="w:rPr/w:highlight">
            <xsl:if test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:position | w:rPr/w:color">
              <xsl:text>;</xsl:text>  
            </xsl:if>
            <xsl:choose>
              <xsl:when test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:position | w:rPr/w:color">
                <xsl:text disable-output-escaping="yes"> </xsl:text>  
              </xsl:when> 
              <xsl:otherwise>
                <xsl:text disable-output-escaping="yes"> style="</xsl:text>
              </xsl:otherwise>
            </xsl:choose>                            
            <xsl:choose>
              <xsl:when test="$hcolor = 'auto'">
                <xsl:text disable-output-escaping="yes">color: #</xsl:text>
                <xsl:value-of select="'000000'"/>
              </xsl:when>
              <xsl:when test="$hcolor = 'lightGray'">
                <xsl:text disable-output-escaping="yes">background-color: #</xsl:text>
                <xsl:value-of select="'E8E8E8'"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:text disable-output-escaping="yes">color: #</xsl:text>
                <xsl:value-of select="$hcolor"/>
              </xsl:otherwise>
            </xsl:choose>
            <!--<xsl:value-of select="$color"/>-->
            <xsl:text></xsl:text>              
          </xsl:if>
          <!-- END of HIGHLIGHT -->
          <!-- position -->
          <xsl:if test="w:rPr/w:position">
            <xsl:if test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color|w:rPr/w:highlight">
              <xsl:text>; </xsl:text>  
            </xsl:if>
            <xsl:if test="not(w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color|w:rPr/w:highlight)">
              <xsl:text> style="</xsl:text>  
            </xsl:if>           
            <xsl:choose>
              <xsl:when test="child::w:rPr/w:position">
                <xsl:variable name="val" select="child::w:rPr/w:position/@w:val"/>
                <xsl:choose>
                  <xsl:when test="contains($val, '-')">
                    <xsl:text>position:relative;top:</xsl:text>
                    <xsl:value-of select="number(substring-after($val,'-')) div 2"/>
                    <xsl:text>pt;mso-text-raise:-</xsl:text>
                    <xsl:value-of select="number(substring-after($val,'-')) div 2"/>
                    <xsl:text>pt</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:text>position:relative;top:-</xsl:text>
                    <xsl:value-of select="number($val) div 2"/>
                    <xsl:text>pt;mso-text-raise:</xsl:text>
                    <xsl:value-of select="number($val) div 2"/>
                    <xsl:text>pt</xsl:text>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:when>
            </xsl:choose>                 
          </xsl:if>
          <!-- SMALLCAPS -->          
          <xsl:if test="w:rPr/w:smallCaps">            
            <xsl:if test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:position | w:rPr/w:highlight">
              <xsl:text>; </xsl:text>  
            </xsl:if>
            <xsl:if test="not(w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:position | w:rPr/w:highlight)">
              <xsl:text> style="</xsl:text>  
            </xsl:if>           
            <xsl:choose>
              <xsl:when test="child::w:rPr/w:smallCaps[not(@w:val = '0')]">
                <xsl:text>font-variant: 'small-caps';</xsl:text>                
              </xsl:when>
            </xsl:choose>                 
          </xsl:if>
          <!-- END SMALLCAPS -->
          <xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
          </xsl:if> 
        <!-- Group SPAN tag END-->
        
        <!-- 27-sep-16 prasanth asked to give class name also -->
        <xsl:variable name="classname" select="child::w:rPr/w:rStyle/@w:val"/>
        <xsl:choose>
          <xsl:when test="string-length($classname) > 0">
              <xsl:choose>
                <xsl:when test="child::w:rPr/w:rStyle/@w:val = 'CommentReference'">
                  <!--<span contenteditable="false" data-selected="true" data-track-changes-ignore="true"
                    name="cmd2"><img data-selected="true" data-track-changes-ignore="true" id="cmd2"
                      src="icon.png" style="width:15px;height:15px;"
                      title="Mariselvam:asd fasdfMariselvam:asd fasdf dsaf"/>-->
                    
                  
                  
                  <xsl:element name="span">
                  <xsl:attribute name="class">
                    <xsl:value-of select="'CommentReference'"/>
                  </xsl:attribute>
                    <!--<xsl:attribute name="contenteditable" select="'false'"/>-->
                    <xsl:attribute name="name">
                      <xsl:text>cmtref</xsl:text>
                      <xsl:value-of select="child::w:commentReference/@w:id + 1"/>
                    </xsl:attribute>
                    <xsl:attribute name="style" select="'display:none'"/>
                    <xsl:apply-templates/>
                  </xsl:element>
                  
                </xsl:when>
                <xsl:otherwise>
                  <xsl:choose>
                    <xsl:when test="w:rPr/w:smallCaps[not(@w:val = '0')] | w:rPr/w:caps[not(@w:val = '0')]">                      
                      <!--<xsl:value-of select="upper-case(.)"/>-->
                      <xsl:apply-templates/>
                    </xsl:when>
                    <xsl:when test="child::w:rPr/w:rStyle/@w:val = 'Nocharacterstyle1'">
                      <xsl:apply-templates/>
                    </xsl:when>
                    <xsl:otherwise>                      
                      <xsl:element name="span">
                        <xsl:attribute name="class">
                          <!--<xsl:value-of select="child::w:rPr/w:rStyle/@w:val"/>-->
                          <xsl:value-of select="replace(child::w:rPr/w:rStyle/@w:val, '^([0-9]+)','')"/>
                        </xsl:attribute>
                        <xsl:attribute name="data-name">
                          <xsl:value-of select="child::w:rPr/w:rStyle/@w:val"/>
                        </xsl:attribute>
                        <xsl:apply-templates/>
                      </xsl:element> 
                    </xsl:otherwise>
                  </xsl:choose>                  
                </xsl:otherwise>
              </xsl:choose>
            <!--<span class="{child::w:rPr/w:rStyle/@w:val}">          
              <xsl:apply-templates/> 
            </span>-->
          </xsl:when>
          <xsl:otherwise>  
            <xsl:choose>
              <xsl:when test="w:rPr/w:smallCaps[not(@w:val = '0')] | w:rPr/w:caps[not(@w:val = '0')]">                
                <!--<xsl:value-of select="upper-case(.)"/>-->
                <xsl:apply-templates/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:apply-templates/>    
              </xsl:otherwise>
            </xsl:choose>                    
          </xsl:otherwise>
        </xsl:choose>
        <!--<span class="{child::w:rPr/w:rStyle/@w:val}">          
          <xsl:apply-templates/>
        </span>-->
                     <xsl:if test="w:rPr/w:rFonts | w:rPr/w:szCs | w:rPr/w:sz | w:rPr/w:position | w:rPr/w:color | w:rPr/w:smallCaps[not(@w:val = '0')] | w:rPr/w:highlight">
            <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
         </xsl:if>
        
        <xsl:if test="w:rPr/w:dstrike">
          <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
        </xsl:if>
         <xsl:if test="w:rPr/w:smallCaps[not(@w:val = '0')]">
          <xsl:text disable-output-escaping="yes">&lt;/small&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:strike">
          <xsl:text disable-output-escaping="yes">&lt;/s&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:u">
          <xsl:choose>
            <xsl:when test="w:rPr/w:u[@w:val = 'double']">
              <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
            </xsl:when>
            <xsl:when test="w:rPr/w:u[@w:val = 'single']">
              <xsl:text disable-output-escaping="yes">&lt;/u&gt;</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:if test="not(w:rPr/w:u[@w:val = 'none'])">
                <xsl:text disable-output-escaping="yes">&lt;/u&gt;</xsl:text>
              </xsl:if>
            </xsl:otherwise>
          </xsl:choose>          
        </xsl:if>
        <xsl:if test="w:rPr/w:i and not(w:rPr/w:i/@w:val = 'false')">
          <xsl:text disable-output-escaping="yes">&lt;/i&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:b and not(w:rPr/w:b/@w:val = 'false')">
          <xsl:text disable-output-escaping="yes">&lt;/b&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:vertAlign[@w:val = 'subscript']">
          <xsl:text disable-output-escaping="yes">&lt;/sub&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:vertAlign[@w:val = 'superscript']">
          <xsl:text disable-output-escaping="yes">&lt;/sup&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:rPrChange">
          <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>  
        </xsl:if>
      </xsl:when>
      
      <!-- ***********w:b********** -->
      <xsl:when test="w:rPr/w:i | w:rPr/w:rFonts | w:rPr/w:sz | w:rPr/w:color | w:rPr/w:position | w:rPr/w:smallCaps | w:rPr/w:u | w:rPr/w:strike | w:rPr/w:caps | w:rPr/w:dstrike | w:rPr/w:vertAlign">
        <xsl:if test="w:rPr/w:rPrChange">
          <xsl:text disable-output-escaping="yes">&lt;span style="font-style:normal !msorm'"&gt;</xsl:text>  
        </xsl:if>
        <xsl:if test="w:rPr/w:vertAlign[@w:val = 'superscript']">
          <xsl:text disable-output-escaping="yes">&lt;sup&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:vertAlign[@w:val = 'subscript']">
          <xsl:text disable-output-escaping="yes">&lt;sub&gt;</xsl:text>
        </xsl:if>        
        <xsl:if test="w:rPr/w:i and not(w:rPr/w:i/@w:val = 'false')">
          <xsl:text disable-output-escaping="yes">&lt;i&gt;</xsl:text>
        </xsl:if>
        <!--<xsl:if test="w:rPr/w:u and not(w:rPr/w:u/@w:val = 'false')">
          <xsl:text disable-output-escaping="yes">&lt;u&gt;</xsl:text>
        </xsl:if>-->
        <xsl:if test="w:rPr/w:u">
          <xsl:if test="w:rPr/w:u">
            <xsl:choose>
              <xsl:when test="w:rPr/w:u[@w:val = 'double']">
                <xsl:text disable-output-escaping="yes">&lt;span class="DUnderline"&gt;</xsl:text>
              </xsl:when>
              <xsl:when test="w:rPr/w:u[@w:val = 'single']">
                <xsl:text disable-output-escaping="yes">&lt;u&gt;</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:if test="not(w:rPr/w:u[@w:val = 'none'])">
                  <xsl:text disable-output-escaping="yes">&lt;u&gt;</xsl:text>
                </xsl:if>
              </xsl:otherwise>
            </xsl:choose>          
          </xsl:if>          
        </xsl:if>
        <xsl:if test="w:rPr/w:strike">
          <xsl:text disable-output-escaping="yes">&lt;s&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:smallCaps[not(@w:val = '0')]">
          <xsl:text disable-output-escaping="yes">&lt;small&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:dstrike">
          <xsl:text disable-output-escaping="yes">&lt;span class="double-strike"&gt;</xsl:text>
          <xsl:text disable-output-escaping="yes">&lt;div class="the-lines"/&gt;</xsl:text>
        </xsl:if>
        
        <!-- Group SPAN tag -->
        <xsl:if test="w:rPr/w:rFonts | w:rPr/w:szCs | w:rPr/w:sz | w:rPr/w:color | w:rPr/w:position | w:u | w:rPr/w:smallCaps">
          <xsl:text disable-output-escaping="yes">&lt;span</xsl:text>
          <xsl:if test="w:rPr/w:rFonts">
            <xsl:text disable-output-escaping="yes"> style="font-family:</xsl:text>  
            <xsl:choose>
              <xsl:when test="w:rPr/w:rFonts/@w:ascii">
                <xsl:value-of select="w:rPr/w:rFonts/@w:ascii"/>
              </xsl:when>
              <xsl:when test="w:rPr/w:rFonts/@w:cs">
                <xsl:value-of select="w:rPr/w:rFonts/@w:cs"/>
              </xsl:when>
              <xsl:when test="w:rPr/w:rFonts/@w:eastAsia">
                <xsl:value-of select="w:rPr/w:rFonts/@w:eastAsia"/>
              </xsl:when>
              <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:ascii">
                <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:ascii"/>
              </xsl:when>
              <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia">
                <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"/>
              </xsl:when>
              <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia">
                <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"/>
              </xsl:when> 
              <xsl:otherwise>
                <!--<xsl:value-of select="w:rPr/w:rFonts/@w:asciiTheme"/>-->
              </xsl:otherwise>
            </xsl:choose>
            <!--<xsl:value-of select="w:rPr/w:rFonts/@w:cs"/>-->
            <xsl:text></xsl:text>              
          </xsl:if>
          <xsl:if test="w:rPr/w:szCs and not(w:rPr/w:sz)">
            <xsl:if test="w:rPr/w:rFonts">
              <xsl:text>;</xsl:text>  
            </xsl:if>
            <xsl:choose>
              <xsl:when test="w:rPr/w:rFonts">
                <xsl:text disable-output-escaping="yes"> font-size:</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:text disable-output-escaping="yes"> style="font-size:</xsl:text>
              </xsl:otherwise>
            </xsl:choose>
            <!--<xsl:text disable-output-escaping="yes"> style="font-size:'</xsl:text>  -->
            <xsl:value-of select="(w:rPr/w:szCs/@w:val) div 2"/>
            <xsl:text>pt</xsl:text>              
          </xsl:if>
          <xsl:if test="w:rPr/w:sz">
            <xsl:if test="w:rPr/w:rFonts">
              <xsl:text>;</xsl:text>  
            </xsl:if>
            <xsl:choose>
              <xsl:when test="w:rPr/w:rFonts">
                <xsl:text disable-output-escaping="yes"> font-size:'</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:text disable-output-escaping="yes"> style="font-size:'</xsl:text>
              </xsl:otherwise>
            </xsl:choose>
            <!--<xsl:text disable-output-escaping="yes"> style="font-size:'</xsl:text>  -->
            <xsl:value-of select="(w:rPr/w:sz/@w:val) div 2"/>
            <xsl:text>pt'</xsl:text>              
          </xsl:if>
          <xsl:if test="w:rPr/w:color">
            <xsl:if test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:position">
              <xsl:text>;</xsl:text>  
            </xsl:if>
            <xsl:choose>
              <xsl:when test="w:rPr/w:sz | w:rPr/w:rFonts | w:rPr/w:position">
                <xsl:text disable-output-escaping="yes"> </xsl:text>  
              </xsl:when> 
              <xsl:otherwise>
                <xsl:text disable-output-escaping="yes"> style="</xsl:text> 
              </xsl:otherwise>
            </xsl:choose>
            <!--<xsl:text disable-output-escaping="yes"> style="'</xsl:text>  -->
            
            <xsl:choose>
              <xsl:when test="$color = 'auto'">
                <xsl:value-of select="'000000'"/>
              </xsl:when>
              <xsl:otherwise> 
                <xsl:text disable-output-escaping="yes">color: #</xsl:text>
                <xsl:value-of select="$color"/></xsl:otherwise>
            </xsl:choose>
            <!--<xsl:value-of select="$color"/>-->
          </xsl:if>
          <!-- position -->
          <xsl:if test="w:rPr/w:position">
            <xsl:if test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color">
              <xsl:text>; </xsl:text>  
            </xsl:if>
            <xsl:if test="not(w:rPr/w:sz | w:rPr/w:rFonts | w:rPr/w:color)">               
              <xsl:text> style="</xsl:text>  
            </xsl:if>           
            <xsl:choose>
              <xsl:when test="child::w:rPr/w:position">
                <xsl:variable name="val" select="child::w:rPr/w:position/@w:val"/>
                <xsl:choose>
                  <xsl:when test="contains($val, '-')">
                    <xsl:text>position:relative;top:</xsl:text>
                    <xsl:value-of select="number(substring-after($val,'-')) div 2"/>
                    <xsl:text>pt;mso-text-raise:-</xsl:text>
                    <xsl:value-of select="number(substring-after($val,'-')) div 2"/>
                    <xsl:text>pt</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:text>position:relative;top:-</xsl:text>
                    <xsl:value-of select="number($val) div 2"/>
                    <xsl:text>pt;mso-text-raise:</xsl:text>
                    <xsl:value-of select="number($val) div 2"/>
                    <xsl:text>pt</xsl:text>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:when>
            </xsl:choose>                 
          </xsl:if>
          <!-- end POSITION -->
          <!-- SMALLCAPS -->          
          <xsl:if test="w:rPr/w:smallCaps">            
            <xsl:if test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:position">
              <xsl:text>; </xsl:text>  
            </xsl:if>
            <xsl:if test="not(w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:position)">
              <xsl:text> style="</xsl:text>  
            </xsl:if>           
            <xsl:choose>
              <!-- 19-11-2021 -->
              <xsl:when test="child::w:rPr/w:smallCaps[not(@w:val = '0')]">
                <xsl:text>font-variant: 'small-caps';</xsl:text>                
              </xsl:when>
            </xsl:choose>                 
          </xsl:if>
          <!-- END SMALLCAPS -->
          
          <xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
        </xsl:if>          
        <!-- Group SPAN tag END-->
        
        <!-- 27-sep-16 prasanth asked to give class name also -->
        <xsl:variable name="classname" select="child::w:rPr/w:rStyle/@w:val"/>
        <xsl:choose>
          <xsl:when test="string-length($classname) > 0">            
            <xsl:choose>
              <xsl:when test="child::w:rPr/w:rStyle/@w:val = 'CommentReference'">
                <!--<span contenteditable="false" data-selected="true" data-track-changes-ignore="true"
                    name="cmd2"><img data-selected="true" data-track-changes-ignore="true" id="cmd2"
                      src="icon.png" style="width:15px;height:15px;"
                      title="Mariselvam:asd fasdfMariselvam:asd fasdf dsaf"/>-->
                
                
                
                <xsl:element name="span">
                  <xsl:attribute name="class">
                    <xsl:value-of select="'CommentReference'"/>
                  </xsl:attribute>
                  <!--<xsl:attribute name="contenteditable" select="'false'"/>-->
                  <xsl:attribute name="name">
                    <xsl:text>cmtref</xsl:text>
                    <xsl:value-of select="child::w:commentReference/@w:id + 1"/>
                  </xsl:attribute>
                  <xsl:attribute name="style" select="'display:none'"/>
                  <xsl:apply-templates/>
                </xsl:element>
                
              </xsl:when>
              <xsl:when test="child::w:rPr/w:rStyle/@w:val = 'Nocharacterstyle1'">
                <xsl:apply-templates/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:element name="span">
                  <xsl:attribute name="class">
                    <!--<xsl:value-of select="child::w:rPr/w:rStyle/@w:val"/>-->
                    <xsl:value-of select="replace(child::w:rPr/w:rStyle/@w:val, '^([0-9]+)','')"/>
                  </xsl:attribute>
                  <xsl:attribute name="data-name">
                    <xsl:value-of select="child::w:rPr/w:rStyle/@w:val"/>
                  </xsl:attribute>
                  <xsl:apply-templates/>
                </xsl:element>
              </xsl:otherwise>
            </xsl:choose>
            <!--<span class="{child::w:rPr/w:rStyle/@w:val}">          
              <xsl:apply-templates/> 
            </span>-->
          </xsl:when>
          <xsl:otherwise>  
            <xsl:choose>
              <xsl:when test="w:rPr/w:smallCaps[not(@w:val = '0')] | w:rPr/w:caps[not(@w:val = '0')]">
                <!--<xsl:value-of select="upper-case(.)"/>-->
                <xsl:apply-templates/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:apply-templates/>    
              </xsl:otherwise>
            </xsl:choose>                    
          </xsl:otherwise>
        </xsl:choose>
        
        <xsl:if test="w:rPr/w:rFonts | w:rPr/w:szCs | w:rPr/w:sz | w:rPr/w:position | w:rPr/w:color | w:rPr/w:smallCaps[not(@w:val = '0')]">
          <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
        </xsl:if>
        
        
        <xsl:if test="w:rPr/w:dstrike">
          <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:smallCaps[not(@w:val = '0')]">
          <xsl:text disable-output-escaping="yes">&lt;/small&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:strike">
          <xsl:text disable-output-escaping="yes">&lt;/s&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:u">
          <xsl:choose>
            <xsl:when test="w:rPr/w:u[@w:val = 'double']">
              <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
            </xsl:when>
            <xsl:when test="w:rPr/w:u[@w:val = 'single']">
              <xsl:text disable-output-escaping="yes">&lt;/u&gt;</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:if test="not(w:rPr/w:u[@w:val = 'none'])">
                <xsl:text disable-output-escaping="yes">&lt;/u&gt;</xsl:text>
              </xsl:if>
            </xsl:otherwise>
          </xsl:choose>          
        </xsl:if>
        <xsl:if test="w:rPr/w:i and not(w:rPr/w:i/@w:val = 'false')">
          <xsl:text disable-output-escaping="yes">&lt;/i&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:b and not(w:rPr/w:b/@w:val = 'false')">
          <xsl:text disable-output-escaping="yes">&lt;/b&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:vertAlign[@w:val = 'subscript']">
          <xsl:text disable-output-escaping="yes">&lt;/sub&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:vertAlign[@w:val = 'superscript']">
          <xsl:text disable-output-escaping="yes">&lt;/sup&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:rPrChange">
          <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>  
        </xsl:if>
      </xsl:when>
      
                  <xsl:when test="w:rPr/w:b and w:rPr/w:i">        
                    <xsl:element name="b">
                      <xsl:element name="i">
                        <xsl:apply-templates/>
                      </xsl:element>
                    </xsl:element>
                  </xsl:when>
                  <xsl:when test="w:rPr/w:b">
                    <xsl:element name="b">
                      <xsl:apply-templates/>
                    </xsl:element>
                  </xsl:when>
                  <xsl:when test="w:rPr/w:i">
                    <xsl:element name="i">
                      <xsl:apply-templates/>
                    </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:element name="span">
                      <xsl:attribute name="class" select="replace($charStyle, '^([0-9]+)','')"/>
                      <xsl:attribute name="data-name" select="$charStyleName"/>                      
                      <xsl:apply-templates/>
                    </xsl:element>
                  </xsl:otherwise>                  
                </xsl:choose>
                <!--</span>-->        
              </xsl:when>
              <xsl:otherwise>
                <xsl:choose>
                   <xsl:when test="w:rPr/w:b | w:rPr/w:rFonts | w:rPr/w:sz | w:rPr/w:color | w:rPr/w:position | w:rPr/w:smallCaps | w:rPr/w:u | w:rPr/w:strike | w:rPr/w:caps | w:rPr/w:dstrike | w:rPr/w:vertAlign | w:rPr/w:highlight">
                        <xsl:if test="w:rPr/w:rPrChange">
                          <xsl:text disable-output-escaping="yes">&lt;span style="font-weight:normal !msorm'"&gt;</xsl:text>  
                        </xsl:if>
                        <xsl:if test="w:rPr/w:vertAlign[@w:val = 'superscript']">
                          <xsl:text disable-output-escaping="yes">&lt;sup&gt;</xsl:text>
                        </xsl:if>
                        <xsl:if test="w:rPr/w:vertAlign[@w:val = 'subscript']">
                          <xsl:text disable-output-escaping="yes">&lt;sub&gt;</xsl:text>
                        </xsl:if>
                        <xsl:if test="w:rPr/w:b and not(w:rPr/w:b/@w:val = 'false')">
                          <xsl:text disable-output-escaping="yes">&lt;b&gt;</xsl:text>
                        </xsl:if>
                        <xsl:if test="w:rPr/w:i and not(w:rPr/w:i/@w:val = 'false')">
                          <xsl:text disable-output-escaping="yes">&lt;i&gt;</xsl:text>
                        </xsl:if>
                        <!--<xsl:if test="w:rPr/w:u and not(w:rPr/w:u/@w:val = 'false')">
                          <xsl:text disable-output-escaping="yes">&lt;u&gt;</xsl:text>
                        </xsl:if>-->
                        <xsl:if test="w:rPr/w:u">
                          <xsl:if test="w:rPr/w:u">
                            <xsl:choose>
                              <xsl:when test="w:rPr/w:u[@w:val = 'double']">
                                <xsl:text disable-output-escaping="yes">&lt;span class="DUnderline"&gt;</xsl:text>
                              </xsl:when>
                              <xsl:when test="w:rPr/w:u[@w:val = 'single']">
                                <xsl:text disable-output-escaping="yes">&lt;u&gt;</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                <xsl:if test="not(w:rPr/w:u[@w:val = 'none'])">
                                  <xsl:text disable-output-escaping="yes">&lt;u&gt;</xsl:text>
                                </xsl:if>
                              </xsl:otherwise>
                            </xsl:choose>          
                          </xsl:if>          
                        </xsl:if>
                        <xsl:if test="w:rPr/w:strike">
                          <xsl:text disable-output-escaping="yes">&lt;s&gt;</xsl:text>
                        </xsl:if>
                     <xsl:if test="w:rPr/w:smallCaps[not(@w:val = '0')]">
                          <xsl:text disable-output-escaping="yes">&lt;small&gt;</xsl:text>
                        </xsl:if>
                        <xsl:if test="w:rPr/w:dstrike">
                          <xsl:text disable-output-escaping="yes">&lt;span class="double-strike"&gt;</xsl:text>
                          <xsl:text disable-output-escaping="yes">&lt;div class="the-lines"/&gt;</xsl:text>
                        </xsl:if>
                        
                        
                        <!-- Group SPAN tag -->
                        <xsl:if test="w:rPr/w:rFonts | w:rPr/w:szCs | w:rPr/w:sz | w:rPr/w:color | w:rPr/w:position | w:u | w:rPr/w:smallCaps | w:rPr/w:highlight">
                          <xsl:text disable-output-escaping="yes">&lt;span</xsl:text>
                          
                          <xsl:if test="w:rPr/w:rFonts">
                              <xsl:text disable-output-escaping="yes"> style="font-family:</xsl:text>  
                            <xsl:choose>
                              <xsl:when test="w:rPr/w:rFonts/@w:ascii">
                                <xsl:value-of select="w:rPr/w:rFonts/@w:ascii"/>
                              </xsl:when>
                              <xsl:when test="w:rPr/w:rFonts/@w:cs">
                                <xsl:value-of select="w:rPr/w:rFonts/@w:cs"/>
                              </xsl:when>
                              <xsl:when test="w:rPr/w:rFonts/@w:eastAsia">
                                <xsl:value-of select="w:rPr/w:rFonts/@w:eastAsia"/>
                              </xsl:when>              
                              <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:ascii">
                                <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:ascii"/>
                              </xsl:when>
                              <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia">
                                <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"/>
                              </xsl:when>
                              <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia">
                                <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"/>
                              </xsl:when>                      
                              <xsl:otherwise>
                                <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"/>
                              </xsl:otherwise>
                            </xsl:choose>
                              <!--<xsl:value-of select="w:rPr/w:rFonts/@w:cs"/>-->
                              <xsl:text></xsl:text>              
                            </xsl:if>
                          <xsl:if test="w:rPr/w:szCs and not(w:rPr/w:sz)">
                            <xsl:if test="w:rPr/w:rFonts">
                              <xsl:text>;</xsl:text>  
                            </xsl:if>
                            <xsl:choose>
                              <xsl:when test="w:rPr/w:rFonts">
                                <xsl:text disable-output-escaping="yes"> font-size:'</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                <xsl:text disable-output-escaping="yes"> style="font-size:'</xsl:text>
                              </xsl:otherwise>
                            </xsl:choose>
                            <!--<xsl:text disable-output-escaping="yes"> style="font-size:'</xsl:text>  -->
                            <xsl:value-of select="(w:rPr/w:szCs/@w:val) div 2"/>
                            <xsl:text>pt'</xsl:text>              
                          </xsl:if>
                          <xsl:if test="w:rPr/w:sz">
                              <xsl:if test="w:rPr/w:rFonts">
                                <xsl:text>;</xsl:text>  
                              </xsl:if>
                              <xsl:choose>
                                <xsl:when test="w:rPr/w:rFonts">
                                  <xsl:text disable-output-escaping="yes"> font-size:</xsl:text>
                                </xsl:when>
                                <xsl:otherwise>
                                  <xsl:text disable-output-escaping="yes"> style="font-size:</xsl:text>
                                </xsl:otherwise>
                              </xsl:choose>
                              <!--<xsl:text disable-output-escaping="yes"> style="font-size:'</xsl:text>  -->
                              <xsl:value-of select="(w:rPr/w:sz/@w:val) div 2"/>
                              <xsl:text>pt</xsl:text>              
                            </xsl:if>
                          <xsl:if test="w:rPr/w:color">
                            <xsl:if test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:position">
                                <xsl:text>;</xsl:text>  
                              </xsl:if>
                              <xsl:choose>
                                <xsl:when test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:position">
                                  <xsl:text disable-output-escaping="yes"> </xsl:text>  
                                </xsl:when> 
                                <xsl:otherwise>
                                  <xsl:text disable-output-escaping="yes"> style="</xsl:text>
                                </xsl:otherwise>
                              </xsl:choose>                            
                              <xsl:choose>
                                <xsl:when test="$color = 'auto'">
                                  <xsl:value-of select="'000000'"/>
                                </xsl:when>
                                <xsl:otherwise>
                                  <xsl:text disable-output-escaping="yes">color: #</xsl:text>
                                  <xsl:value-of select="$color"/>
                                </xsl:otherwise>
                              </xsl:choose>
                              <!--<xsl:value-of select="$color"/>-->
                              <xsl:text></xsl:text>              
                            </xsl:if>            
                          <!-- END of COLOR -->
                          <!-- HIGHLIGHT -->
                          <xsl:if test="w:rPr/w:highlight">
                            <xsl:if test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:position | w:rPr/w:color">
                              <xsl:text>;</xsl:text>  
                            </xsl:if>
                            <xsl:choose>
                              <xsl:when test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:position | w:rPr/w:color">
                                <xsl:text disable-output-escaping="yes"> </xsl:text>  
                              </xsl:when> 
                              <xsl:otherwise>
                                <xsl:text disable-output-escaping="yes"> style="</xsl:text>
                              </xsl:otherwise>
                            </xsl:choose>                            
                            <xsl:choose>
                              <xsl:when test="$hcolor = 'auto'">
                                <xsl:text disable-output-escaping="yes">color: #</xsl:text>
                                <xsl:value-of select="'000000'"/>
                              </xsl:when>
                              <xsl:when test="$hcolor = 'lightGray'">
                                <xsl:text disable-output-escaping="yes">background-color: #</xsl:text>
                                <xsl:value-of select="'E8E8E8'"/>
                              </xsl:when>
                              <xsl:otherwise>
                                <xsl:text disable-output-escaping="yes">color: #</xsl:text>
                                <xsl:value-of select="$hcolor"/>
                              </xsl:otherwise>
                            </xsl:choose>
                            <!--<xsl:value-of select="$color"/>-->
                            <xsl:text></xsl:text>              
                          </xsl:if>
                          <!-- END of HIGHLIGHT -->
                          <!-- position -->
                          <xsl:if test="w:rPr/w:position">
                            <xsl:if test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color|w:rPr/w:highlight">
                              <xsl:text>; </xsl:text>  
                            </xsl:if>
                            <xsl:if test="not(w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color|w:rPr/w:highlight)">
                              <xsl:text> style="</xsl:text>  
                            </xsl:if>           
                            <xsl:choose>
                              <xsl:when test="child::w:rPr/w:position">
                                <xsl:variable name="val" select="child::w:rPr/w:position/@w:val"/>
                                <xsl:choose>
                                  <xsl:when test="contains($val, '-')">
                                    <xsl:text>position:relative;top:</xsl:text>
                                    <xsl:value-of select="number(substring-after($val,'-')) div 2"/>
                                    <xsl:text>pt;mso-text-raise:-</xsl:text>
                                    <xsl:value-of select="number(substring-after($val,'-')) div 2"/>
                                    <xsl:text>pt</xsl:text>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <xsl:text>position:relative;top:-</xsl:text>
                                    <xsl:value-of select="number($val) div 2"/>
                                    <xsl:text>pt;mso-text-raise:</xsl:text>
                                    <xsl:value-of select="number($val) div 2"/>
                                    <xsl:text>pt</xsl:text>
                                  </xsl:otherwise>
                                </xsl:choose>
                              </xsl:when>
                            </xsl:choose>                 
                          </xsl:if>
                          <!-- SMALLCAPS -->          
                          <xsl:if test="w:rPr/w:smallCaps">            
                            <xsl:if test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:position | w:rPr/w:highlight">
                              <xsl:text>; </xsl:text>  
                            </xsl:if>
                            <xsl:if test="not(w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:position | w:rPr/w:highlight)">
                              <xsl:text> style="</xsl:text>  
                            </xsl:if>           
                            <xsl:choose>
                              <xsl:when test="child::w:rPr/w:smallCaps[not(@w:val = '0')]">
                                <xsl:text>font-variant: 'small-caps';</xsl:text>                
                              </xsl:when>
                            </xsl:choose>                 
                          </xsl:if>
                          <!-- END SMALLCAPS -->
                          <xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
                          </xsl:if> 
                        <!-- Group SPAN tag END-->
                        
                        <!-- 27-sep-16 prasanth asked to give class name also -->
                        <xsl:variable name="classname" select="child::w:rPr/w:rStyle/@w:val"/>
                        <xsl:choose>
                          <xsl:when test="string-length($classname) > 0">
                              <xsl:choose>
                                <xsl:when test="child::w:rPr/w:rStyle/@w:val = 'CommentReference'">
                                  <!--<span contenteditable="false" data-selected="true" data-track-changes-ignore="true"
                                    name="cmd2"><img data-selected="true" data-track-changes-ignore="true" id="cmd2"
                                      src="icon.png" style="width:15px;height:15px;"
                                      title="Mariselvam:asd fasdfMariselvam:asd fasdf dsaf"/>-->
                                    
                                  
                                  
                                  <xsl:element name="span">
                                  <xsl:attribute name="class">
                                    <xsl:value-of select="'CommentReference'"/>
                                  </xsl:attribute>
                                    <!--<xsl:attribute name="contenteditable" select="'false'"/>-->
                                    <xsl:attribute name="name">
                                      <xsl:text>cmtref</xsl:text>
                                      <xsl:value-of select="child::w:commentReference/@w:id + 1"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="style" select="'display:none'"/>
                                    <xsl:apply-templates/>
                                  </xsl:element>
                                  
                                </xsl:when>
                                <xsl:otherwise>
                                  <xsl:choose>
                                    <xsl:when test="w:rPr/w:smallCaps[not(@w:val = '0')] | w:rPr/w:caps[not(@w:val = '0')]">                      
                                      <!--<xsl:value-of select="upper-case(.)"/>-->
                                      <xsl:apply-templates/>
                                    </xsl:when>
                                    <xsl:when test="child::w:rPr/w:rStyle/@w:val = 'Nocharacterstyle1'">
                                      <xsl:apply-templates/>
                                    </xsl:when>
                                    <xsl:otherwise>                      
                                      <xsl:element name="span">
                                        <xsl:attribute name="class">
                                          <!--<xsl:value-of select="child::w:rPr/w:rStyle/@w:val"/>-->
                                          <xsl:value-of select="replace(child::w:rPr/w:rStyle/@w:val, '^([0-9]+)','')"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="data-name">
                                          <xsl:value-of select="child::w:rPr/w:rStyle/@w:val"/>
                                        </xsl:attribute>
                                        <xsl:apply-templates/>
                                      </xsl:element> 
                                    </xsl:otherwise>
                                  </xsl:choose>                  
                                </xsl:otherwise>
                              </xsl:choose>
                            <!--<span class="{child::w:rPr/w:rStyle/@w:val}">          
                              <xsl:apply-templates/> 
                            </span>-->
                          </xsl:when>
                          <xsl:otherwise>  
                            <xsl:choose>
                              <xsl:when test="w:rPr/w:smallCaps[not(@w:val = '0')] | w:rPr/w:caps[not(@w:val = '0')]">
                                
                                <!--<xsl:value-of select="upper-case(.)"/>-->
                                <xsl:apply-templates/>
                              </xsl:when>
                              <xsl:otherwise>
                                <xsl:apply-templates/>    
                              </xsl:otherwise>
                            </xsl:choose>                    
                          </xsl:otherwise>
                        </xsl:choose>
                        <!--<span class="{child::w:rPr/w:rStyle/@w:val}">          
                          <xsl:apply-templates/>
                        </span>-->
                     <xsl:if test="w:rPr/w:rFonts | w:rPr/w:szCs | w:rPr/w:sz | w:rPr/w:position | w:rPr/w:color | w:rPr/w:smallCaps[not(@w:val = '0')] | w:rPr/w:highlight">
                            <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                         </xsl:if>
                        
                        <xsl:if test="w:rPr/w:dstrike">
                          <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                        </xsl:if>
                     <xsl:if test="w:rPr/w:smallCaps[not(@w:val = '0')]">
                          <xsl:text disable-output-escaping="yes">&lt;/small&gt;</xsl:text>
                        </xsl:if>
                        <xsl:if test="w:rPr/w:strike">
                          <xsl:text disable-output-escaping="yes">&lt;/s&gt;</xsl:text>
                        </xsl:if>
                        <xsl:if test="w:rPr/w:u">
                          <xsl:choose>
                            <xsl:when test="w:rPr/w:u[@w:val = 'double']">
                              <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                            </xsl:when>
                            <xsl:when test="w:rPr/w:u[@w:val = 'single']">
                              <xsl:text disable-output-escaping="yes">&lt;/u&gt;</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:if test="not(w:rPr/w:u[@w:val = 'none'])">
                                <xsl:text disable-output-escaping="yes">&lt;/u&gt;</xsl:text>
                              </xsl:if>
                            </xsl:otherwise>
                          </xsl:choose>          
                        </xsl:if>
                        <xsl:if test="w:rPr/w:i and not(w:rPr/w:i/@w:val = 'false')">
                          <xsl:text disable-output-escaping="yes">&lt;/i&gt;</xsl:text>
                        </xsl:if>
                        <xsl:if test="w:rPr/w:b and not(w:rPr/w:b/@w:val = 'false')">
                          <xsl:text disable-output-escaping="yes">&lt;/b&gt;</xsl:text>
                        </xsl:if>
                        <xsl:if test="w:rPr/w:vertAlign[@w:val = 'subscript']">
                          <xsl:text disable-output-escaping="yes">&lt;/sub&gt;</xsl:text>
                        </xsl:if>
                        <xsl:if test="w:rPr/w:vertAlign[@w:val = 'superscript']">
                          <xsl:text disable-output-escaping="yes">&lt;/sup&gt;</xsl:text>
                        </xsl:if>
                        <xsl:if test="w:rPr/w:rPrChange">
                          <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>  
                        </xsl:if>
      </xsl:when>
                   <xsl:when test="w:rPr/w:i | w:rPr/w:rFonts | w:rPr/w:sz | w:rPr/w:color | w:rPr/w:position | w:rPr/w:smallCaps | w:rPr/w:u | w:rPr/w:strike | w:rPr/w:caps | w:rPr/w:dstrike | w:rPr/w:vertAlign">
                      <xsl:if test="w:rPr/w:rPrChange">
                        <xsl:text disable-output-escaping="yes">&lt;span style="font-style:normal !msorm'"&gt;</xsl:text>  
                      </xsl:if>
                      <xsl:if test="w:rPr/w:vertAlign[@w:val = 'superscript']">
                        <xsl:text disable-output-escaping="yes">&lt;sup&gt;</xsl:text>
                      </xsl:if>
                      <xsl:if test="w:rPr/w:vertAlign[@w:val = 'subscript']">
                        <xsl:text disable-output-escaping="yes">&lt;sub&gt;</xsl:text>
                      </xsl:if>        
                      <xsl:if test="w:rPr/w:i and not(w:rPr/w:i/@w:val = 'false')">
                        <xsl:text disable-output-escaping="yes">&lt;i&gt;</xsl:text>
                      </xsl:if>
                      <!--<xsl:if test="w:rPr/w:u and not(w:rPr/w:u/@w:val = 'false')">
                        <xsl:text disable-output-escaping="yes">&lt;u&gt;</xsl:text>
                      </xsl:if>-->
                      <xsl:if test="w:rPr/w:u">
                        <xsl:if test="w:rPr/w:u">
                          <xsl:choose>
                            <xsl:when test="w:rPr/w:u[@w:val = 'double']">
                              <xsl:text disable-output-escaping="yes">&lt;span class="DUnderline"&gt;</xsl:text>
                            </xsl:when>
                            <xsl:when test="w:rPr/w:u[@w:val = 'single']">
                              <xsl:text disable-output-escaping="yes">&lt;u&gt;</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:if test="not(w:rPr/w:u[@w:val = 'none'])">
                                <xsl:text disable-output-escaping="yes">&lt;u&gt;</xsl:text>
                              </xsl:if>
                            </xsl:otherwise>
                          </xsl:choose>          
                        </xsl:if>          
                      </xsl:if>
                      <xsl:if test="w:rPr/w:strike">
                        <xsl:text disable-output-escaping="yes">&lt;s&gt;</xsl:text>
                      </xsl:if>
                     <xsl:if test="w:rPr/w:smallCaps[not(@w:val = '0')]">
                        <xsl:text disable-output-escaping="yes">&lt;small&gt;</xsl:text>
                      </xsl:if>
                      <xsl:if test="w:rPr/w:dstrike">
                        <xsl:text disable-output-escaping="yes">&lt;span class="double-strike"&gt;</xsl:text>
                        <xsl:text disable-output-escaping="yes">&lt;div class="the-lines"/&gt;</xsl:text>
                      </xsl:if>
                      
                      <!-- Group SPAN tag -->
                      <xsl:if test="w:rPr/w:rFonts | w:rPr/w:szCs | w:rPr/w:sz | w:rPr/w:color | w:rPr/w:position | w:u | w:rPr/w:smallCaps">
                        <xsl:text disable-output-escaping="yes">&lt;span</xsl:text>
                        <xsl:if test="w:rPr/w:rFonts">
                          <xsl:text disable-output-escaping="yes"> style="font-family:</xsl:text>  
                          <xsl:choose>
                            <xsl:when test="w:rPr/w:rFonts/@w:ascii">
                              <xsl:value-of select="w:rPr/w:rFonts/@w:ascii"/>
                            </xsl:when>
                            <xsl:when test="w:rPr/w:rFonts/@w:cs">
                              <xsl:value-of select="w:rPr/w:rFonts/@w:cs"/>
                            </xsl:when>
                            <xsl:when test="w:rPr/w:rFonts/@w:eastAsia">
                              <xsl:value-of select="w:rPr/w:rFonts/@w:eastAsia"/>
                            </xsl:when>
                            <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:ascii">
                              <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:ascii"/>
                            </xsl:when>
                            <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia">
                              <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"/>
                            </xsl:when>
                            <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia">
                              <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"/>
                            </xsl:when> 
                            <xsl:otherwise>
                              <!--<xsl:value-of select="w:rPr/w:rFonts/@w:asciiTheme"/>-->
                            </xsl:otherwise>
                          </xsl:choose>
                          <!--<xsl:value-of select="w:rPr/w:rFonts/@w:cs"/>-->
                          <xsl:text></xsl:text>              
                        </xsl:if>
                        <xsl:if test="w:rPr/w:szCs and not(w:rPr/w:sz)">
                          <xsl:if test="w:rPr/w:rFonts">
                            <xsl:text>;</xsl:text>  
                          </xsl:if>
                          <xsl:choose>
                            <xsl:when test="w:rPr/w:rFonts">
                              <xsl:text disable-output-escaping="yes"> font-size:</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:text disable-output-escaping="yes"> style="font-size:</xsl:text>
                            </xsl:otherwise>
                          </xsl:choose>
                          <!--<xsl:text disable-output-escaping="yes"> style="font-size:'</xsl:text>  -->
                          <xsl:value-of select="(w:rPr/w:szCs/@w:val) div 2"/>
                          <xsl:text>pt</xsl:text>              
                        </xsl:if>
                        <xsl:if test="w:rPr/w:sz">
                          <xsl:if test="w:rPr/w:rFonts">
                            <xsl:text>;</xsl:text>  
                          </xsl:if>
                          <xsl:choose>
                            <xsl:when test="w:rPr/w:rFonts">
                              <xsl:text disable-output-escaping="yes"> font-size:'</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:text disable-output-escaping="yes"> style="font-size:'</xsl:text>
                            </xsl:otherwise>
                          </xsl:choose>
                          <!--<xsl:text disable-output-escaping="yes"> style="font-size:'</xsl:text>  -->
                          <xsl:value-of select="(w:rPr/w:sz/@w:val) div 2"/>
                          <xsl:text>pt'</xsl:text>              
                        </xsl:if>
                        <xsl:if test="w:rPr/w:color">
                          <xsl:if test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:position">
                            <xsl:text>;</xsl:text>  
                          </xsl:if>
                          <xsl:choose>
                            <xsl:when test="w:rPr/w:sz | w:rPr/w:rFonts | w:rPr/w:position">
                              <xsl:text disable-output-escaping="yes"> </xsl:text>  
                            </xsl:when> 
                            <xsl:otherwise>
                              <xsl:text disable-output-escaping="yes"> style="</xsl:text> 
                            </xsl:otherwise>
                          </xsl:choose>
                          <!--<xsl:text disable-output-escaping="yes"> style="'</xsl:text>  -->
                          
                          <xsl:choose>
                            <xsl:when test="$color = 'auto'">
                              <xsl:value-of select="'000000'"/>
                            </xsl:when>
                            <xsl:otherwise> 
                              <xsl:text disable-output-escaping="yes">color: #</xsl:text>
                              <xsl:value-of select="$color"/></xsl:otherwise>
                          </xsl:choose>
                          <!--<xsl:value-of select="$color"/>-->
                        </xsl:if>
                        <!-- position -->
                        <xsl:if test="w:rPr/w:position">
                          <xsl:if test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color">
                            <xsl:text>; </xsl:text>  
                          </xsl:if>
                          <xsl:if test="not(w:rPr/w:sz | w:rPr/w:rFonts | w:rPr/w:color)">               
                            <xsl:text> style="</xsl:text>  
                          </xsl:if>           
                          <xsl:choose>
                            <xsl:when test="child::w:rPr/w:position">
                              <xsl:variable name="val" select="child::w:rPr/w:position/@w:val"/>
                              <xsl:choose>
                                <xsl:when test="contains($val, '-')">
                                  <xsl:text>position:relative;top:</xsl:text>
                                  <xsl:value-of select="number(substring-after($val,'-')) div 2"/>
                                  <xsl:text>pt;mso-text-raise:-</xsl:text>
                                  <xsl:value-of select="number(substring-after($val,'-')) div 2"/>
                                  <xsl:text>pt</xsl:text>
                                </xsl:when>
                                <xsl:otherwise>
                                  <xsl:text>position:relative;top:-</xsl:text>
                                  <xsl:value-of select="number($val) div 2"/>
                                  <xsl:text>pt;mso-text-raise:</xsl:text>
                                  <xsl:value-of select="number($val) div 2"/>
                                  <xsl:text>pt</xsl:text>
                                </xsl:otherwise>
                              </xsl:choose>
                            </xsl:when>
                          </xsl:choose>                 
                        </xsl:if>
                        <!-- end POSITION -->
                        <!-- SMALLCAPS -->          
                        <xsl:if test="w:rPr/w:smallCaps">            
                          <xsl:if test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:position">
                            <xsl:text>; </xsl:text>  
                          </xsl:if>
                          <xsl:if test="not(w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:position)">
                            <xsl:text> style="</xsl:text>  
                          </xsl:if>           
                          <xsl:choose>
                            <xsl:when test="child::w:rPr/w:smallCaps[not(@w:val = '0')]">
                              <xsl:text>font-variant: 'small-caps';</xsl:text>                
                            </xsl:when>
                          </xsl:choose>                 
                        </xsl:if>
                        <!-- END SMALLCAPS -->
                        
                        <xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
                      </xsl:if>          
                      <!-- Group SPAN tag END-->
                      
                      <!-- 27-sep-16 prasanth asked to give class name also -->
                      <xsl:variable name="classname" select="child::w:rPr/w:rStyle/@w:val"/>
                      <xsl:choose>
                        <xsl:when test="string-length($classname) > 0">            
                          <xsl:choose>
                            <xsl:when test="child::w:rPr/w:rStyle/@w:val = 'CommentReference'">
                              <!--<span contenteditable="false" data-selected="true" data-track-changes-ignore="true"
                                  name="cmd2"><img data-selected="true" data-track-changes-ignore="true" id="cmd2"
                                    src="icon.png" style="width:15px;height:15px;"
                                    title="Mariselvam:asd fasdfMariselvam:asd fasdf dsaf"/>-->
                              
                              
                              
                              <xsl:element name="span">
                                <xsl:attribute name="class">
                                  <xsl:value-of select="'CommentReference'"/>
                                </xsl:attribute>
                                <!--<xsl:attribute name="contenteditable" select="'false'"/>-->
                                <xsl:attribute name="name">
                                  <xsl:text>cmtref</xsl:text>
                                  <xsl:value-of select="child::w:commentReference/@w:id + 1"/>
                                </xsl:attribute>
                                <xsl:attribute name="style" select="'display:none'"/>
                                <xsl:apply-templates/>
                              </xsl:element>
                              
                            </xsl:when>
                            <xsl:when test="child::w:rPr/w:rStyle/@w:val = 'Nocharacterstyle1'">
                              <xsl:apply-templates/>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:element name="span">
                                <xsl:attribute name="class">
                                  <!--<xsl:value-of select="child::w:rPr/w:rStyle/@w:val"/>-->
                                  <xsl:value-of select="replace(child::w:rPr/w:rStyle/@w:val, '^([0-9]+)','')"/>
                                </xsl:attribute>
                                <xsl:attribute name="data-name">
                                  <xsl:value-of select="child::w:rPr/w:rStyle/@w:val"/>
                                </xsl:attribute>
                                <xsl:apply-templates/>
                              </xsl:element>
                            </xsl:otherwise>
                          </xsl:choose>
                          <!--<span class="{child::w:rPr/w:rStyle/@w:val}">          
                            <xsl:apply-templates/> 
                          </span>-->
                        </xsl:when>
                        <xsl:otherwise>  
                          <xsl:choose>
                            <xsl:when test="w:rPr/w:smallCaps[not(@w:val = '0')] | w:rPr/w:caps[not(@w:val = '0')]">
                              <!--<xsl:value-of select="upper-case(.)"/>-->
                              <xsl:apply-templates/>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:apply-templates/>    
                            </xsl:otherwise>
                          </xsl:choose>                    
                        </xsl:otherwise>
                      </xsl:choose>
                      
                     <xsl:if test="w:rPr/w:rFonts | w:rPr/w:szCs | w:rPr/w:sz | w:rPr/w:position | w:rPr/w:color | w:rPr/w:smallCaps[not(@w:val = '0')]">
                        <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                      </xsl:if>
                      
                      
                      <xsl:if test="w:rPr/w:dstrike">
                        <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                      </xsl:if>
                     <xsl:if test="w:rPr/w:smallCaps[not(@w:val = '0')]">
                        <xsl:text disable-output-escaping="yes">&lt;/small&gt;</xsl:text>
                      </xsl:if>
                      <xsl:if test="w:rPr/w:strike">
                        <xsl:text disable-output-escaping="yes">&lt;/s&gt;</xsl:text>
                      </xsl:if>
                      <xsl:if test="w:rPr/w:u">
                        <xsl:choose>
                          <xsl:when test="w:rPr/w:u[@w:val = 'double']">
                            <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                          </xsl:when>
                          <xsl:when test="w:rPr/w:u[@w:val = 'single']">
                            <xsl:text disable-output-escaping="yes">&lt;/u&gt;</xsl:text>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:if test="not(w:rPr/w:u[@w:val = 'none'])">
                              <xsl:text disable-output-escaping="yes">&lt;/u&gt;</xsl:text>
                            </xsl:if>
                          </xsl:otherwise>
                        </xsl:choose>          
                      </xsl:if>
                      <xsl:if test="w:rPr/w:i and not(w:rPr/w:i/@w:val = 'false')">
                        <xsl:text disable-output-escaping="yes">&lt;/i&gt;</xsl:text>
                      </xsl:if>
                      <xsl:if test="w:rPr/w:b and not(w:rPr/w:b/@w:val = 'false')">
                        <xsl:text disable-output-escaping="yes">&lt;/b&gt;</xsl:text>
                      </xsl:if>
                      <xsl:if test="w:rPr/w:vertAlign[@w:val = 'subscript']">
                        <xsl:text disable-output-escaping="yes">&lt;/sub&gt;</xsl:text>
                      </xsl:if>
                      <xsl:if test="w:rPr/w:vertAlign[@w:val = 'superscript']">
                        <xsl:text disable-output-escaping="yes">&lt;/sup&gt;</xsl:text>
                      </xsl:if>
                      <xsl:if test="w:rPr/w:rPrChange">
                        <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>  
                      </xsl:if>
                    </xsl:when>
                   <xsl:when test="w:rPr/w:b and w:rPr/w:i">        
                    <xsl:element name="b">
                      <xsl:element name="i">
                        <xsl:apply-templates/>
                      </xsl:element>
                    </xsl:element>
                  </xsl:when>
                    <xsl:when test="w:rPr/w:b">
                      <xsl:element name="b">
                        <xsl:apply-templates/>
                      </xsl:element>
                    </xsl:when>
                    <xsl:when test="w:rPr/w:i">
                      <xsl:element name="i">
                        <xsl:apply-templates/>
                      </xsl:element>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:element name="span">
                        <xsl:attribute name="class" select="replace($charStyle, '^([0-9]+)','')"/>
                        <xsl:attribute name="data-name" select="$charStyleName"/>
                        <xsl:apply-templates/>
                      </xsl:element>
                    </xsl:otherwise>                  
                </xsl:choose>                
              </xsl:otherwise>
            </xsl:choose>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="$charStyle = 'Hyperlink'">
        <xsl:variable name="c">
          <xsl:apply-templates/>
        </xsl:variable>
        <xsl:choose>
          <!-- Added to retain the hyperlink value without empty a tag  on 11-1-2022 -->
          
          <xsl:when test="starts-with($c, 'http:')">
            <xsl:element name="a">
              <xsl:attribute name="data-hyperlink">
                <xsl:apply-templates/>
              </xsl:attribute>
              <xsl:attribute name="href">
                <xsl:apply-templates/>
              </xsl:attribute>
              <xsl:apply-templates/>
            </xsl:element>
          </xsl:when>
          <xsl:when test="starts-with($c, 'https:')">            
            <xsl:element name="a">
              <xsl:attribute name="data-hyperlink">
                <xsl:apply-templates/>
              </xsl:attribute>
              <xsl:attribute name="href">
                <xsl:apply-templates/>
              </xsl:attribute>
              <xsl:apply-templates/>
            </xsl:element>
          </xsl:when>
          <xsl:otherwise>
            <xsl:choose>
              <xsl:when test="descendant::HyperlinkTextSource[@HyperlinkUDestination]">
              <xsl:element name="a">
              <xsl:attribute name="data-hyperlink">
                <xsl:apply-templates select="descendant::HyperlinkTextSource[@HyperlinkUDestination][1]/@HyperlinkUDestination"/>
              </xsl:attribute>
              <xsl:attribute name="href">
              <xsl:apply-templates select="descendant::HyperlinkTextSource[@HyperlinkUDestination][1]/@HyperlinkUDestination"/>
              </xsl:attribute>
              <xsl:apply-templates/>
            </xsl:element>
              </xsl:when>
              <xsl:when test="not(descendant::HyperlinkTextSource[@HyperlinkUDestination]) and  starts-with(lower-case($c), 'www.')">
                <xsl:element name="a">
                  <xsl:attribute name="data-hyperlink">
                    <xsl:text>http://</xsl:text>
                    <xsl:apply-templates/>
                  </xsl:attribute>
                  <xsl:attribute name="href">
                    <xsl:text>http://</xsl:text>
                    <xsl:apply-templates/>
                  </xsl:attribute>
                  <xsl:apply-templates/>
                </xsl:element>
              </xsl:when>
              <xsl:otherwise>
                <xsl:apply-templates/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:otherwise>
        </xsl:choose>
        <!-- End -->
      </xsl:when>    
      <xsl:when test="w:rPr/w:b | w:rPr/w:rFonts | w:rPr/w:sz | w:rPr/w:color | w:rPr/w:position | w:rPr/w:smallCaps | w:rPr/w:u | w:rPr/w:strike | w:rPr/w:caps | w:rPr/w:dstrike | w:rPr/w:vertAlign | w:rPr/w:highlight">
        <xsl:if test="w:rPr/w:rPrChange">
          <xsl:text disable-output-escaping="yes">&lt;span style="font-weight:normal !msorm'"&gt;</xsl:text>  
        </xsl:if>
        <xsl:if test="w:rPr/w:vertAlign[@w:val = 'superscript']">
          <xsl:text disable-output-escaping="yes">&lt;sup&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:vertAlign[@w:val = 'subscript']">
          <xsl:text disable-output-escaping="yes">&lt;sub&gt;</xsl:text>
        </xsl:if>
        <!--<xsl:if test="w:rPr/w:b and (not(w:rPr/w:b/@w:val = 'false') and not(w:rPr/w:b/@w:val = '0'))">          
          <xsl:text disable-output-escaping="yes">&lt;bB&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:i and (not(w:rPr/w:i/@w:val = 'false') and not(w:rPr/w:i/@w:val = '0'))">
          <xsl:text disable-output-escaping="yes">&lt;i&gt;</xsl:text>
        </xsl:if>-->
        <!--<xsl:if test="w:rPr/w:u and not(w:rPr/w:u/@w:val = 'false')">
          <xsl:text disable-output-escaping="yes">&lt;u&gt;</xsl:text>
        </xsl:if>-->
        <xsl:if test="w:rPr/w:u">
          <xsl:if test="w:rPr/w:u">
            <xsl:choose>
              <xsl:when test="w:rPr/w:u[@w:val = 'double']">
                <xsl:text disable-output-escaping="yes">&lt;span class="DUnderline"&gt;</xsl:text>
              </xsl:when>
              <xsl:when test="w:rPr/w:u[@w:val = 'single']">
                <xsl:text disable-output-escaping="yes">&lt;u&gt;</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:if test="not(w:rPr/w:u[@w:val = 'none'])">
                  <xsl:text disable-output-escaping="yes">&lt;u&gt;</xsl:text>
                </xsl:if>
              </xsl:otherwise>
            </xsl:choose>          
          </xsl:if>          
        </xsl:if>
        <xsl:if test="w:rPr/w:strike">
          <xsl:text disable-output-escaping="yes">&lt;s&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:smallCaps[not(@w:val = '0')]">
          <xsl:text disable-output-escaping="yes">&lt;small&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:dstrike">
          <xsl:text disable-output-escaping="yes">&lt;span class="double-strike"&gt;</xsl:text>
          <xsl:text disable-output-escaping="yes">&lt;div class="the-lines"/&gt;</xsl:text>
        </xsl:if>
        
        <!-- 22-11-2021 -->
        <!-- Group SPAN tag -->
        <xsl:if test="w:rPr/w:rFonts | w:rPr/w:szCs | w:rPr/w:sz | w:rPr/w:color | w:rPr/w:position | w:u | w:rPr/w:smallCaps | w:rPr/w:highlight | w:rPr/w:b[@w:val = '0'] | w:rPr/w:i[@w:val = '0'] | w:rPr/w:caps[@w:val = '0']">
              <xsl:text disable-output-escaping="yes">&lt;span</xsl:text>
              
              <xsl:if test="w:rPr/w:rFonts">
                  <xsl:text disable-output-escaping="yes"> style="font-family:</xsl:text>  
                <xsl:choose>
                  <xsl:when test="w:rPr/w:rFonts/@w:ascii">
                    <xsl:value-of select="w:rPr/w:rFonts/@w:ascii"/>
                  </xsl:when>
                  <xsl:when test="w:rPr/w:rFonts/@w:cs">
                    <xsl:value-of select="w:rPr/w:rFonts/@w:cs"/>
                  </xsl:when>
                  <xsl:when test="w:rPr/w:rFonts/@w:eastAsia">
                    <xsl:value-of select="w:rPr/w:rFonts/@w:eastAsia"/>
                  </xsl:when>              
                  <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:ascii">
                    <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:ascii"/>
                  </xsl:when>
                  <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia">
                    <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"/>
                  </xsl:when>
                  <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia">
                    <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"/>
                  </xsl:when>                      
                  <xsl:otherwise>
                    <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"/>
                  </xsl:otherwise>
                </xsl:choose>
                  <!--<xsl:value-of select="w:rPr/w:rFonts/@w:cs"/>-->
                  <xsl:text></xsl:text>              
                </xsl:if>
              <xsl:if test="w:rPr/w:szCs and not(w:rPr/w:sz)">
                <xsl:if test="w:rPr/w:rFonts">
                  <xsl:text>;</xsl:text>  
                </xsl:if>
                <xsl:choose>
                  <xsl:when test="w:rPr/w:rFonts">
                    <xsl:text disable-output-escaping="yes"> font-size:"</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:text disable-output-escaping="yes"> style="font-size:"</xsl:text>
                  </xsl:otherwise>
                </xsl:choose>
                <!--<xsl:value-of select="(w:rPr/w:szCs/@w:val) div 2"/>-->
                <!-- 07-sep-17, incresing 10% -->
                <xsl:value-of select="round(((w:rPr/w:szCs/@w:val) div 2)+((w:rPr/w:szCs/@w:val div 2 * 10) div 100))"/>
                <xsl:text>pt"</xsl:text>              
              </xsl:if>
              <xsl:if test="w:rPr/w:sz">
                  <xsl:if test="w:rPr/w:rFonts">
                    <xsl:text>;</xsl:text>  
                  </xsl:if>
                  <xsl:choose>
                    <xsl:when test="w:rPr/w:rFonts">
                      <xsl:text disable-output-escaping="yes"> font-size:</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:text disable-output-escaping="yes"> style="font-size:</xsl:text>
                    </xsl:otherwise>
                  </xsl:choose>
                  <!--<xsl:value-of select="(w:rPr/w:sz/@w:val) div 2"/>-->
                <!-- 07-sep-17, incresing 10% -->
                <xsl:value-of select="round(((w:rPr/w:sz/@w:val) div 2)+((w:rPr/w:sz/@w:val div 2 * 10) div 100))"/>
                  <xsl:text>pt</xsl:text>              
                </xsl:if>
              <xsl:if test="w:rPr/w:color">
                <xsl:if test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:position">
                    <xsl:text>;</xsl:text>  
                  </xsl:if>
                  <xsl:choose>
                    <xsl:when test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:position">
                      <xsl:text disable-output-escaping="yes"> </xsl:text>  
                    </xsl:when> 
                    <xsl:otherwise>
                      <xsl:text disable-output-escaping="yes"> style="</xsl:text>
                    </xsl:otherwise>
                  </xsl:choose>                            
                  <xsl:choose>
                    <xsl:when test="$color = 'auto'">
                      <xsl:value-of select="'000000'"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:text disable-output-escaping="yes">color: #</xsl:text>
                      <xsl:value-of select="$color"/>
                    </xsl:otherwise>
                  </xsl:choose>
                  <!--<xsl:value-of select="$color"/>-->
                  <xsl:text></xsl:text>              
                </xsl:if>            
              <!-- END of COLOR -->
              <!-- HIGHLIGHT -->
              <xsl:if test="w:rPr/w:highlight">
                <xsl:if test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:position | w:rPr/w:color">
                  <xsl:text>;</xsl:text>  
                </xsl:if>
                <xsl:choose>
                  <xsl:when test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:position | w:rPr/w:color">
                    <xsl:text disable-output-escaping="yes"> </xsl:text>  
                  </xsl:when> 
                  <xsl:otherwise>
                    <xsl:text disable-output-escaping="yes"> style="</xsl:text>
                  </xsl:otherwise>
                </xsl:choose>                            
                <xsl:choose>
                  <xsl:when test="$hcolor = 'auto'">
                    <xsl:text disable-output-escaping="yes">color: #</xsl:text>
                    <xsl:value-of select="'000000'"/>
                  </xsl:when>
                  <xsl:when test="$hcolor = 'lightGray'">
                    <xsl:text disable-output-escaping="yes">background-color: #</xsl:text>
                    <xsl:value-of select="'E8E8E8'"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:text disable-output-escaping="yes">color: #</xsl:text>
                    <xsl:value-of select="$hcolor"/>
                  </xsl:otherwise>
                </xsl:choose>
                <!--<xsl:value-of select="$color"/>-->
                <xsl:text></xsl:text>              
              </xsl:if>
              <!-- END of HIGHLIGHT -->
              <!-- position -->
              <xsl:if test="w:rPr/w:position">
                <xsl:if test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color|w:rPr/w:highlight">
                  <xsl:text>; </xsl:text>  
                </xsl:if>
                <xsl:if test="not(w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color|w:rPr/w:highlight)">
                  <xsl:text> style="</xsl:text>  
                </xsl:if>           
                <xsl:choose>
                  <xsl:when test="child::w:rPr/w:position">
                    <xsl:variable name="val" select="child::w:rPr/w:position/@w:val"/>
                    <xsl:choose>
                      <xsl:when test="contains($val, '-')">
                        <xsl:text>position:relative;top:</xsl:text>
                        <xsl:value-of select="number(substring-after($val,'-')) div 2"/>
                        <xsl:text>pt;mso-text-raise:-</xsl:text>
                        <xsl:value-of select="number(substring-after($val,'-')) div 2"/>
                        <xsl:text>pt</xsl:text>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:text>position:relative;top:-</xsl:text>
                        <xsl:value-of select="number($val) div 2"/>
                        <xsl:text>pt;mso-text-raise:</xsl:text>
                        <xsl:value-of select="number($val) div 2"/>
                        <xsl:text>pt</xsl:text>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:when>
                </xsl:choose>                 
              </xsl:if>
              <!-- SMALLCAPS -->          
              <xsl:if test="w:rPr/w:smallCaps">            
                <xsl:if test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:position | w:rPr/w:highlight">
                  <xsl:text>; </xsl:text>  
                </xsl:if>
                <xsl:if test="not(w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:position | w:rPr/w:highlight)">
                  <xsl:text> style="</xsl:text>  
                </xsl:if>           
                <xsl:choose>
                  <xsl:when test="child::w:rPr/w:smallCaps[not(@w:val = '0')]">
                    <xsl:text>font-variant: 'small-caps';</xsl:text>                
                  </xsl:when>
                  <xsl:when test="child::w:rPr/w:smallCaps[@w:val = '0']">
                    <xsl:text>font-variant: 'none';</xsl:text>                
                  </xsl:when>
                </xsl:choose>                 
              </xsl:if>
              
          <xsl:if test="(w:rPr/w:b[@w:val = '0']) | (w:rPr/w:i[@w:val = '0'])">            
                <xsl:if test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:position | w:rPr/w:highlight | w:rPr/w:smallCaps">
                  <xsl:text>; </xsl:text>  
                </xsl:if>
                <xsl:if test="not(w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:position | w:rPr/w:highlight | w:rPr/w:smallCaps)">
                  <xsl:text> style="</xsl:text>  
                </xsl:if>           
                <xsl:choose>
                  <xsl:when test="(w:rPr/w:b[@w:val = '0']) and (w:rPr/w:i[@w:val = '0'])">
                    <xsl:text>font-weight: normal;</xsl:text> 
                    <xsl:text>font-style: normal;</xsl:text>
                  </xsl:when>
                  <xsl:when test="(w:rPr/w:b[@w:val = '0'])">
                    <xsl:text>font-weight: normal;</xsl:text>                
                  </xsl:when>
                  <xsl:when test="(w:rPr/w:i[@w:val = '0'])">
                    <xsl:text>font-style: normal;</xsl:text>                
                  </xsl:when>
                </xsl:choose>
            
           </xsl:if>
          <xsl:if test="w:rPr/w:caps[@w:val='0']">            
            <xsl:if test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:position | w:rPr/w:highlight | w:rPr/w:smallCaps | (w:rPr/w:b[@w:val = '0']) | (w:rPr/w:i[@w:val = '0'])">
              <xsl:text>; </xsl:text>  
            </xsl:if>
            <xsl:if test="not(w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:position | w:rPr/w:highlight | w:rPr/w:smallCaps | (w:rPr/w:b[@w:val = '0']) | (w:rPr/w:i[@w:val = '0']))">
              <xsl:text> style="</xsl:text>  
            </xsl:if>           
            <xsl:choose>
              <xsl:when test="w:rPr/w:caps[@w:val='0']">
                <xsl:text>text-transform: none;font-variant: none;</xsl:text>
              </xsl:when> 
              <xsl:otherwise></xsl:otherwise>
            </xsl:choose>
            
          </xsl:if>
              <!-- END SMALLCAPS -->
              <xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
          </xsl:if> 
        <!-- Group SPAN tag END-->
        
        <!-- 27-sep-16 prasanth asked to give class name also -->
        <xsl:variable name="classname" select="child::w:rPr/w:rStyle/@w:val"/>
        <xsl:choose>
          <xsl:when test="string-length($classname) > 0">
              <xsl:choose>
                <xsl:when test="child::w:rPr/w:rStyle/@w:val = 'CommentReference'">
                  <!--<span contenteditable="false" data-selected="true" data-track-changes-ignore="true"
                    name="cmd2"><img data-selected="true" data-track-changes-ignore="true" id="cmd2"
                      src="icon.png" style="width:15px;height:15px;"
                      title="Mariselvam:asd fasdfMariselvam:asd fasdf dsaf"/>-->
                    
                  
                  
                  <xsl:element name="span">
                  <xsl:attribute name="class">
                    <xsl:value-of select="'CommentReference'"/>
                  </xsl:attribute>
                    <!--<xsl:attribute name="contenteditable" select="'false'"/>-->
                    <xsl:attribute name="name">
                      <xsl:text>cmtref</xsl:text>
                      <xsl:value-of select="child::w:commentReference/@w:id + 1"/>
                    </xsl:attribute>
                    <xsl:attribute name="style" select="'display:none'"/>
                    <xsl:apply-templates/>
                  </xsl:element>
                  
                </xsl:when>
                <xsl:otherwise>
                  <xsl:choose>
                    <xsl:when test="w:rPr/w:smallCaps[not(@w:val = '0')] | w:rPr/w:caps[not(@w:val = '0')]">                      
                      <!--<xsl:value-of select="upper-case(.)"/>-->
                      <xsl:apply-templates/>
                    </xsl:when>
                    <xsl:when test="child::w:rPr/w:rStyle/@w:val = 'Nocharacterstyle1'">
                      <xsl:apply-templates/>
                    </xsl:when>
                    <xsl:otherwise>    
                      <!-- To avoid 2 times span class i commented here 05-Sep-17 -->
                      <!--<xsl:element name="span">
                        <xsl:attribute name="class">
                          <xsl:value-of select="replace(child::w:rPr/w:rStyle/@w:val, '^([0-9]+)','')"/>
                        </xsl:attribute>
                        <xsl:attribute name="data-name">
                          <xsl:value-of select="child::w:rPr/w:rStyle/@w:val"/>
                        </xsl:attribute>
                        <xsl:apply-templates/>
                      </xsl:element> -->
                      <xsl:apply-templates/>
                    </xsl:otherwise>
                  </xsl:choose>                  
                </xsl:otherwise>
              </xsl:choose>
            <!--<span class="{child::w:rPr/w:rStyle/@w:val}">          
              <xsl:apply-templates/> 
            </span>-->
          </xsl:when>
          <xsl:otherwise>  
            <xsl:choose>
              <xsl:when test="w:rPr/w:smallCaps[not(@w:val = '0')] | w:rPr/w:caps[not(@w:val = '0')]">                
                <!--<xsl:value-of select="upper-case(.)"/>-->
                <xsl:apply-templates/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:apply-templates/>    
              </xsl:otherwise>
            </xsl:choose>                    
          </xsl:otherwise>
        </xsl:choose>
        <!--<span class="{child::w:rPr/w:rStyle/@w:val}">          
          <xsl:apply-templates/>
        </span>-->
        
        
        <xsl:if test="w:rPr/w:rFonts | w:rPr/w:szCs | w:rPr/w:sz | w:rPr/w:position | w:rPr/w:color | w:rPr/w:smallCaps[not(@w:val = '0')] | w:rPr/w:highlight 
          | w:rPr/w:b[@w:val = '0'] | w:rPr/w:i[@w:val = '0'] | w:rPr/w:caps[@w:val='0']">
            <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
         </xsl:if>
        
        <xsl:if test="w:rPr/w:dstrike">
          <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:smallCaps[not(@w:val = '0')]">
          <xsl:text disable-output-escaping="yes">&lt;/small&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:strike">
          <xsl:text disable-output-escaping="yes">&lt;/s&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:u">
          <xsl:choose>
            <xsl:when test="w:rPr/w:u[@w:val = 'double']">
              <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
            </xsl:when>
            <xsl:when test="w:rPr/w:u[@w:val = 'single']">
              <xsl:text disable-output-escaping="yes">&lt;/u&gt;</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:if test="not(w:rPr/w:u[@w:val = 'none'])">
                <xsl:text disable-output-escaping="yes">&lt;/u&gt;</xsl:text>
              </xsl:if>
            </xsl:otherwise>
          </xsl:choose>          
        </xsl:if>
        <!--<xsl:if test="w:rPr/w:i and (not(w:rPr/w:i/@w:val = 'false') and not(w:rPr/w:i/@w:val = '0'))">
          <xsl:text disable-output-escaping="yes">&lt;/i&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:b and (not(w:rPr/w:b/@w:val = 'false') and not(w:rPr/w:b/@w:val = '0'))">
          <xsl:text disable-output-escaping="yes">&lt;/b&gt;</xsl:text>
        </xsl:if>-->
        <xsl:if test="w:rPr/w:vertAlign[@w:val = 'subscript']">
          <xsl:text disable-output-escaping="yes">&lt;/sub&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:vertAlign[@w:val = 'superscript']">
          <xsl:text disable-output-escaping="yes">&lt;/sup&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:rPrChange">
          <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>  
        </xsl:if>
      </xsl:when>
      <!-- ***********w:b********** -->
      <xsl:when test="w:rPr/w:i | w:rPr/w:rFonts | w:rPr/w:sz | w:rPr/w:color | w:rPr/w:position | w:rPr/w:smallCaps | w:rPr/w:u | w:rPr/w:strike | w:rPr/w:caps | w:rPr/w:dstrike | w:rPr/w:vertAlign">
        <xsl:if test="w:rPr/w:rPrChange">
          <xsl:text disable-output-escaping="yes">&lt;span style="font-style:normal !msorm'"&gt;</xsl:text>  
        </xsl:if>
        <xsl:if test="w:rPr/w:vertAlign[@w:val = 'superscript']">
          <xsl:text disable-output-escaping="yes">&lt;sup&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:vertAlign[@w:val = 'subscript']">
          <xsl:text disable-output-escaping="yes">&lt;sub&gt;</xsl:text>
        </xsl:if>        
        <xsl:if test="w:rPr/w:i and (not(w:rPr/w:i/@w:val = 'false') and not(w:rPr/w:i/@w:val = '0'))">
          <xsl:text disable-output-escaping="yes">&lt;i&gt;</xsl:text>
        </xsl:if>
        <!--<xsl:if test="w:rPr/w:u and not(w:rPr/w:u/@w:val = 'false')">
          <xsl:text disable-output-escaping="yes">&lt;u&gt;</xsl:text>
        </xsl:if>-->
        <xsl:if test="w:rPr/w:u">
          <xsl:if test="w:rPr/w:u">
            <xsl:choose>
              <xsl:when test="w:rPr/w:u[@w:val = 'double']">
                <xsl:text disable-output-escaping="yes">&lt;span class="DUnderline"&gt;</xsl:text>
              </xsl:when>
              <xsl:when test="w:rPr/w:u[@w:val = 'single']">
                <xsl:text disable-output-escaping="yes">&lt;u&gt;</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:if test="not(w:rPr/w:u[@w:val = 'none'])">
                  <xsl:text disable-output-escaping="yes">&lt;u&gt;</xsl:text>
                </xsl:if>
              </xsl:otherwise>
            </xsl:choose>          
          </xsl:if>          
        </xsl:if>
        <xsl:if test="w:rPr/w:strike">
          <xsl:text disable-output-escaping="yes">&lt;s&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:smallCaps[not(@w:val = '0')]">
          <xsl:text disable-output-escaping="yes">&lt;small&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:dstrike">
          <xsl:text disable-output-escaping="yes">&lt;span class="double-strike"&gt;</xsl:text>
          <xsl:text disable-output-escaping="yes">&lt;div class="the-lines"/&gt;</xsl:text>
        </xsl:if>
        
        <!-- Group SPAN tag -->
        <xsl:if test="w:rPr/w:rFonts | w:rPr/w:szCs | w:rPr/w:sz | w:rPr/w:color | w:rPr/w:position | w:u | w:rPr/w:smallCaps">
          <xsl:text disable-output-escaping="yes">&lt;span</xsl:text>
          <xsl:if test="w:rPr/w:rFonts">
            <xsl:text disable-output-escaping="yes"> style="font-family:</xsl:text>  
            <xsl:choose>
              <xsl:when test="w:rPr/w:rFonts/@w:ascii">
                <xsl:value-of select="w:rPr/w:rFonts/@w:ascii"/>
              </xsl:when>
              <xsl:when test="w:rPr/w:rFonts/@w:cs">
                <xsl:value-of select="w:rPr/w:rFonts/@w:cs"/>
              </xsl:when>
              <xsl:when test="w:rPr/w:rFonts/@w:eastAsia">
                <xsl:value-of select="w:rPr/w:rFonts/@w:eastAsia"/>
              </xsl:when>
              <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:ascii">
                <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:ascii"/>
              </xsl:when>
              <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia">
                <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"/>
              </xsl:when>
              <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia">
                <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"/>
              </xsl:when> 
              <xsl:otherwise>
                <!--<xsl:value-of select="w:rPr/w:rFonts/@w:asciiTheme"/>-->
              </xsl:otherwise>
            </xsl:choose>
            <!--<xsl:value-of select="w:rPr/w:rFonts/@w:cs"/>-->
            <xsl:text></xsl:text>              
          </xsl:if>
          <xsl:if test="w:rPr/w:szCs and not(w:rPr/w:sz)">
            <xsl:if test="w:rPr/w:rFonts">
              <xsl:text>;</xsl:text>  
            </xsl:if>
            <xsl:choose>
              <xsl:when test="w:rPr/w:rFonts">
                <xsl:text disable-output-escaping="yes"> font-size:</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:text disable-output-escaping="yes"> style="font-size:</xsl:text>
              </xsl:otherwise>
            </xsl:choose>
            <!--<xsl:text disable-output-escaping="yes"> style="font-size:'</xsl:text>  -->
            <xsl:value-of select="(w:rPr/w:szCs/@w:val) div 2"/>
            <xsl:text>pt</xsl:text>              
          </xsl:if>
          <xsl:if test="w:rPr/w:sz">
            <xsl:if test="w:rPr/w:rFonts">
              <xsl:text>;</xsl:text>  
            </xsl:if>
            <xsl:choose>
              <xsl:when test="w:rPr/w:rFonts">
                <xsl:text disable-output-escaping="yes"> font-size:'</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:text disable-output-escaping="yes"> style="font-size:'</xsl:text>
              </xsl:otherwise>
            </xsl:choose>
            <!--<xsl:text disable-output-escaping="yes"> style="font-size:'</xsl:text>  -->
            <xsl:value-of select="(w:rPr/w:sz/@w:val) div 2"/>
            <xsl:text>pt'</xsl:text>              
          </xsl:if>
          <xsl:if test="w:rPr/w:color">
            <xsl:if test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:position">
              <xsl:text>;</xsl:text>  
            </xsl:if>
            <xsl:choose>
              <xsl:when test="w:rPr/w:sz | w:rPr/w:rFonts | w:rPr/w:position">
                <xsl:text disable-output-escaping="yes"> </xsl:text>  
              </xsl:when> 
              <xsl:otherwise>
                <xsl:text disable-output-escaping="yes"> style="</xsl:text> 
              </xsl:otherwise>
            </xsl:choose>
            <!--<xsl:text disable-output-escaping="yes"> style="'</xsl:text>  -->
            
            <xsl:choose>
              <xsl:when test="$color = 'auto'">
                <xsl:value-of select="'000000'"/>
              </xsl:when>
              <xsl:otherwise> 
                <xsl:text disable-output-escaping="yes">color: #</xsl:text>
                <xsl:value-of select="$color"/></xsl:otherwise>
            </xsl:choose>
            <!--<xsl:value-of select="$color"/>-->
          </xsl:if>
          <!-- position -->
          <xsl:if test="w:rPr/w:position">
            <xsl:if test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color">
              <xsl:text>; </xsl:text>  
            </xsl:if>
            <xsl:if test="not(w:rPr/w:sz | w:rPr/w:rFonts | w:rPr/w:color)">               
              <xsl:text> style="</xsl:text>  
            </xsl:if>           
            <xsl:choose>
              <xsl:when test="child::w:rPr/w:position">
                <xsl:variable name="val" select="child::w:rPr/w:position/@w:val"/>
                <xsl:choose>
                  <xsl:when test="contains($val, '-')">
                    <xsl:text>position:relative;top:</xsl:text>
                    <xsl:value-of select="number(substring-after($val,'-')) div 2"/>
                    <xsl:text>pt;mso-text-raise:-</xsl:text>
                    <xsl:value-of select="number(substring-after($val,'-')) div 2"/>
                    <xsl:text>pt</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:text>position:relative;top:-</xsl:text>
                    <xsl:value-of select="number($val) div 2"/>
                    <xsl:text>pt;mso-text-raise:</xsl:text>
                    <xsl:value-of select="number($val) div 2"/>
                    <xsl:text>pt</xsl:text>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:when>
            </xsl:choose>                 
          </xsl:if>
          <!-- end POSITION -->
          <!-- SMALLCAPS -->          
          <xsl:if test="w:rPr/w:smallCaps">            
            <xsl:if test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:position">
              <xsl:text>; </xsl:text>  
            </xsl:if>
            <xsl:if test="not(w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:position)">
              <xsl:text> style="</xsl:text>  
            </xsl:if>           
            <xsl:choose>
              <xsl:when test="child::w:rPr/w:smallCaps[not(@w:val = '0')]">
                <xsl:text>font-variant: 'small-caps';</xsl:text>                
              </xsl:when>
            </xsl:choose>                 
          </xsl:if>
          <!-- END SMALLCAPS -->
          
          <xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
        </xsl:if>          
        <!-- Group SPAN tag END-->
        
        <!-- 27-sep-16 prasanth asked to give class name also -->
        <xsl:variable name="classname" select="child::w:rPr/w:rStyle/@w:val"/>
        <xsl:choose>
          <xsl:when test="string-length($classname) > 0">            
            <xsl:choose>
              <xsl:when test="child::w:rPr/w:rStyle/@w:val = 'CommentReference'">
                <!--<span contenteditable="false" data-selected="true" data-track-changes-ignore="true"
                    name="cmd2"><img data-selected="true" data-track-changes-ignore="true" id="cmd2"
                      src="icon.png" style="width:15px;height:15px;"
                      title="Mariselvam:asd fasdfMariselvam:asd fasdf dsaf"/>-->
                
                
                
                <xsl:element name="span">
                  <xsl:attribute name="class">
                    <xsl:value-of select="'CommentReference'"/>
                  </xsl:attribute>
                  <!--<xsl:attribute name="contenteditable" select="'false'"/>-->
                  <xsl:attribute name="name">
                    <xsl:text>cmtref</xsl:text>
                    <xsl:value-of select="child::w:commentReference/@w:id + 1"/>
                  </xsl:attribute>
                  <xsl:attribute name="style" select="'display:none'"/>
                  <xsl:apply-templates/>
                </xsl:element>
                
              </xsl:when>
              <xsl:when test="child::w:rPr/w:rStyle/@w:val = 'Nocharacterstyle1'">
                <xsl:apply-templates/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:element name="span">
                  <xsl:attribute name="class">
                    <!--<xsl:value-of select="child::w:rPr/w:rStyle/@w:val"/>-->
                    <xsl:value-of select="replace(child::w:rPr/w:rStyle/@w:val, '^([0-9]+)','')"/>
                  </xsl:attribute>
                  <xsl:attribute name="data-name">
                    <xsl:value-of select="child::w:rPr/w:rStyle/@w:val"/>
                  </xsl:attribute>
                  <xsl:apply-templates/>
                </xsl:element>
              </xsl:otherwise>
            </xsl:choose>
            <!--<span class="{child::w:rPr/w:rStyle/@w:val}">          
              <xsl:apply-templates/> 
            </span>-->
          </xsl:when>
          <xsl:otherwise>  
            <xsl:choose>
              <xsl:when test="w:rPr/w:smallCaps[not(@w:val = '0')] | w:rPr/w:caps[not(@w:val = '0')]">
                <!--<xsl:value-of select="upper-case(.)"/>-->
                <xsl:apply-templates/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:apply-templates/>    
              </xsl:otherwise>
            </xsl:choose>                    
          </xsl:otherwise>
        </xsl:choose>
        
        <xsl:if test="w:rPr/w:rFonts | w:rPr/w:szCs | w:rPr/w:sz | w:rPr/w:position | w:rPr/w:color | w:rPr/w:smallCaps[not(@w:val = '0')]">
          <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
        </xsl:if>
        
        
        <xsl:if test="w:rPr/w:dstrike">
          <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:smallCaps[not(@w:val = '0')]">
          <xsl:text disable-output-escaping="yes">&lt;/small&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:strike">
          <xsl:text disable-output-escaping="yes">&lt;/s&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:u">
          <xsl:choose>
            <xsl:when test="w:rPr/w:u[@w:val = 'double']">
              <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
            </xsl:when>
            <xsl:when test="w:rPr/w:u[@w:val = 'single']">
              <xsl:text disable-output-escaping="yes">&lt;/u&gt;</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:if test="not(w:rPr/w:u[@w:val = 'none'])">
                <xsl:text disable-output-escaping="yes">&lt;/u&gt;</xsl:text>
              </xsl:if>
            </xsl:otherwise>
          </xsl:choose>          
        </xsl:if>
        <xsl:if test="w:rPr/w:i and (not(w:rPr/w:i/@w:val = 'false') and not(w:rPr/w:i/@w:val = '0'))">
          <xsl:text disable-output-escaping="yes">&lt;/i&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:b and (not(w:rPr/w:b/@w:val = 'false') and not(w:rPr/w:b/@w:val = '0'))">
          <xsl:text disable-output-escaping="yes">&lt;/b&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:vertAlign[@w:val = 'subscript']">
          <xsl:text disable-output-escaping="yes">&lt;/sub&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:vertAlign[@w:val = 'superscript']">
          <xsl:text disable-output-escaping="yes">&lt;/sup&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:rPrChange">
          <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>  
        </xsl:if>
      </xsl:when>
     <xsl:when test="w:rPr/w:b and w:rPr/w:i">        
        <xsl:element name="b">
          <xsl:element name="i">
            <xsl:apply-templates/>
          </xsl:element>
        </xsl:element>
      </xsl:when>
      <xsl:when test="w:rPr/w:b and not(w:rPr/w:b/@w:val = 'false')">
        <xsl:element name="b">
          <xsl:apply-templates/>
        </xsl:element>
      </xsl:when>
      <xsl:when test="w:rPr/w:i and not(w:rPr/w:i/@w:val = 'false')">
        <xsl:element name="i">
          <xsl:apply-templates/>
        </xsl:element>
      </xsl:when>
      <xsl:when test="$color">
        <xsl:element name="span">
          <xsl:attribute name="style" select="concat('color:#',$color)"/>
          <xsl:apply-templates/>
        </xsl:element>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>
    
  </xsl:template>
  
    
   <!-- 23-06-16 Content Controls -->
  
  <!--<xsl:template match="//w:sdt">
    <xsl:variable name="xxx" select="w:sdtPr/w:alias/@w:val"/>
    
    <xsl:element name="spanX">
      <xsl:attribute name="data-alias" select="$xxx"/>
      <xsl:apply-templates/>      
    </xsl:element>    
  </xsl:template>-->
 
  <xsl:template match="//w:sdt">
    <xsl:variable name="xxx" select="w:sdtPr/w:alias/@w:val"/>
    <xsl:variable name="ccName" select="w:sdtPr/w:tag/@w:val"/>
    <xsl:variable name="kkk" select="w:sdtPr/w:tag/@w:val"/>
    <xsl:variable name="figSeq"> 
      <xsl:if test="descendant::w:sdt[w:sdtPr/w:alias[@w:val='SeqNo']]">
        <xsl:value-of select="normalize-space(descendant::w:sdt[w:sdtPr/w:alias[@w:val='SeqNo']][1])"/>
      </xsl:if>
    </xsl:variable>
    <xsl:variable name="alias" select="child::w:sdtPr/w:alias/@w:val"/>
    <xsl:variable name="tag" select="child::w:sdtPr/w:tag/@w:val"/>
    <xsl:variable name="id" select="child::w:sdtPr/w:id/@w:val"/>
    
    <xsl:variable name="PN">
      <xsl:choose>
        <xsl:when test="not(descendant::HyperlinkTextSource[1]/@bkmark)">
          <xsl:value-of select="@w:rsidR"/>
        </xsl:when>
        <xsl:when test="not(descendant::HyperlinkTextDestination[contains(@BookMarkDestination,'_UUID_') or contains(@BookMarkDestination,'story') or contains(@Name,'_UUID_') or contains(lower-case(@Name),'_story_')][1]/@bkmark)">
          <xsl:value-of select="@w:rsidR"/>
        </xsl:when>
        <!-- Added sorting issue by HyperlinkTextSourceon 10-1-2022 -->
        <xsl:when test="descendant::HyperlinkTextSource[contains(lower-case(@HyperlinkUDestination),'_story_')][1]/@HyperlinkUDestination">
          <xsl:value-of select="descendant::HyperlinkTextSource[contains(lower-case(@HyperlinkUDestination),'_story_')][1]/@HyperlinkUDestination"/>
        </xsl:when>
        <xsl:when test="descendant::HyperlinkTextDestination[contains(@BookMarkDestination,'_UUID_') or contains(@BookMarkDestination,'story') or contains(@Name,'_UUID_') or contains(lower-case(@Name),'_story_')][1]/@BookMarkDestination">
          <xsl:value-of select="descendant::HyperlinkTextDestination[contains(@BookMarkDestination,'_UUID_') or contains(@BookMarkDestination,'story') or contains(@Name,'_UUID_') or contains(lower-case(@Name),'_story_')][1]/@BookMarkDestination"/>
        </xsl:when>
      </xsl:choose>
    </xsl:variable>
    
    <xsl:choose>
      <xsl:when test="matches($xxx, 'SeqNo')">        
        <xsl:element name="span"> 
          <xsl:if test="string-length($PN) &gt; 0">
            <xsl:attribute name="w:rsidR" select="$PN"/>
          </xsl:if>
          <!--<xsl:attribute name="style" select="'background: #eeeeee; border: 1px solid #cccccc;  padding: 0px 0px;'"/>-->
          <!--<xsl:attribute name="data-alias" select="'SeqNo'"/>
          <xsl:attribute name="class" select="'SeqNo'"/>-->
          <!-- translate($Na1, ' /\[\]@','') -->
          <!--<xsl:attribute name="class" select="translate(descendant::w:sdtContent[1]/w:r/w:rPr/w:rStyle/@w:val, ' /\[\]@','')"/>-->
          <xsl:attribute name="data-alias" select="$alias"/>
            <!--<xsl:apply-templates select="descendant::w:t"/>-->
          <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
      </xsl:when>
      <xsl:when test="matches($xxx, 'TableRef')">        
        <xsl:element name="a">  
          <xsl:if test="string-length($PN) &gt; 0">
            <xsl:attribute name="w:rsidR" select="$PN"/>
          </xsl:if>
          <!--<xsl:attribute name="style" select="'background: #eeeeee; border: 1px solid #cccccc;  padding: 0px 0px;'"/>-->
          <xsl:attribute name="data-alias" select="'TableRef'"/>
          <xsl:attribute name="href">
            <xsl:value-of select="concat($filename,'.xhtml#t')"/>   
            <xsl:value-of select="normalize-space(translate($figSeq, ' .,;:ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-–)(',''))"/>                  
          </xsl:attribute>
         <!-- <xsl:attribute name="title">
            <xsl:value-of select="normalize-space(.)"/>
          </xsl:attribute>-->
          <!--<xsl:attribute name="class" select="'citationtable'"/>-->
          <xsl:element name="span">
            <xsl:attribute name="class" select="'TableCitation'"/>
            <!--<xsl:apply-templates select="descendant::w:t"/>-->
            <xsl:apply-templates/>
          </xsl:element>
        </xsl:element>
      </xsl:when>
      <xsl:when test="contains($xxx, 'FigureRef')">        
        <xsl:variable name="figSeq">        
          <xsl:value-of select="descendant::w:sdt[w:sdtPr/w:alias[@w:val='SeqNo']][1]"/>
        </xsl:variable>        
        <xsl:element name="a">  
          <xsl:if test="string-length($PN) &gt; 0">
            <xsl:attribute name="w:rsidR" select="$PN"/>
          </xsl:if>
          <!--<xsl:attribute name="style" select="'background: #eeeeee; border: 1px solid #cccccc;  padding: 0px 0px;'"/>-->
          <xsl:attribute name="data-alias" select="'FigureRef'"/>
          <xsl:attribute name="href">
            <xsl:value-of select="concat($filename,'.xhtml#f')"/> 
            <xsl:value-of select="normalize-space(translate($figSeq, ' .,;:ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-–)(',''))"/>
          </xsl:attribute>          
          <!--<xsl:attribute name="title">
            <xsl:value-of select="normalize-space(.)"/>
          </xsl:attribute>-->
          <!--<xsl:attribute name="class" select="'citationfigure'"/>-->
          <xsl:element name="span">
            <xsl:attribute name="class" select="'FigureCitation'"/>
            <!--<xsl:apply-templates select="descendant::w:t"/>-->
            <xsl:apply-templates/>
          </xsl:element>
        </xsl:element>        
      </xsl:when>
      <xsl:when test="matches($xxx, 'BibCitation')">
        <xsl:element name="span">
          <xsl:if test="string-length($PN) &gt; 0">
            <xsl:attribute name="w:rsidR" select="$PN"/>
          </xsl:if>
          <!--<xsl:attribute name="style" select="'background: #eeeeee; border: 1px solid #cccccc;  padding: 0px 0px;'"/>-->
          <xsl:attribute name="class" select="'contentcontrol'"/>
          <xsl:attribute name="data-alias" select="$alias"/>
          <xsl:apply-templates/>
        </xsl:element>
      </xsl:when>
      <xsl:when test="matches($xxx, 'TableCaption')">        
        <xsl:apply-templates/>   
      </xsl:when>
      <xsl:when test="matches($xxx, 'FigureCaption')">
        <!--<xsl:variable name="PN">
          <xsl:choose>
            <xsl:when test="descendant::HyperlinkTextSource[1]/@HyperlinkUDestination">
              <xsl:value-of select="descendant::HyperlinkTextSource[1]/@HyperlinkUDestination"/>
            </xsl:when>
            <xsl:when test="descendant::HyperlinkTextDestination[1]/@BookMarkDestination">
              <xsl:value-of select="descendant::HyperlinkTextDestination[1]/@BookMarkDestination"/>
            </xsl:when>
          </xsl:choose>
        </xsl:variable>-->
        <!--<xsl:text>&#x000A;</xsl:text>-->
        <xsl:element name="div"> 
          <xsl:if test="string-length($PN) &gt; 0">
            <xsl:attribute name="w:rsidR" select="$PN"/>
          </xsl:if>
          <!--<xsl:attribute name="style" select="'background: #eeeeee; border: 1px solid #cccccc;  padding: 0px 0px;'"/>-->
          <xsl:attribute name="data-alias" select="$alias"/>
          <xsl:attribute name="class" select="'captionfig'"/>
          <!--<xsl:attribute name="title">
            <xsl:value-of select="normalize-space(.)"/>
          </xsl:attribute>   -->       
          <!--              <xsl:variable name="idval" select="child::w:sdtContent/w:p/w:r/w:sdt[w:sdtPr/w:alias/@w:val = 'SeqNo']/w:sdtContent/w:t[1]"/>-->
          <!-- commented due to elsevier demo and used the below one line 14-nov-16 -->
          <!--<xsl:variable name="idval" select="child::w:sdtContent/w:p/w:sdt[w:sdtPr/w:alias/@w:val = 'SeqNo']/w:sdtContent/w:r/w:t[1]"/>-->
          <xsl:variable name="idval" select="child::w:sdtContent/w:p/w:sdt[w:sdtPr/w:alias/@w:val = 'SeqNo']/w:sdtContent/w:r/w:t[1]"/>
          
          <xsl:if test="string-length($figSeq) > 0">
            <xsl:attribute name="id">
              <xsl:text>f</xsl:text>
              <xsl:value-of select="translate($figSeq, '  ', '')"/>
              <!--<xsl:value-of select="$idval"/>-->
            </xsl:attribute>
          </xsl:if>              
          <xsl:apply-templates/>
        </xsl:element>
        <!--<xsl:text>&#x000A;</xsl:text>-->
      </xsl:when>
      <xsl:when test="matches($xxx, 'Figure Caption')">
        <!--<xsl:variable name="PN">
          <xsl:choose>
            <xsl:when test="descendant::HyperlinkTextSource[1]/@HyperlinkUDestination">
              <xsl:value-of select="descendant::HyperlinkTextSource[1]/@HyperlinkUDestination"/>
            </xsl:when>
            <xsl:when test="descendant::HyperlinkTextDestination[1]/@BookMarkDestination">
              <xsl:value-of select="descendant::HyperlinkTextDestination[1]/@BookMarkDestination"/>
            </xsl:when>
          </xsl:choose>
        </xsl:variable>-->
        <xsl:element name="div"> 
           <xsl:if test="string-length($PN) &gt; 0">
            <xsl:attribute name="w:rsidR" select="$PN"/>
          </xsl:if>
          <!--<xsl:attribute name="style" select="'background: #eeeeee; border: 1px solid #cccccc;  padding: 0px 0px;'"/>-->
          <xsl:attribute name="data-alias" select="$alias"/>
          <xsl:attribute name="class" select="'captionfig'"/>
          <!--<xsl:attribute name="title">
            <xsl:value-of select="normalize-space(.)"/>
          </xsl:attribute>-->
          
          <!--              <xsl:variable name="idval" select="child::w:sdtContent/w:p/w:r/w:sdt[w:sdtPr/w:alias/@w:val = 'SeqNo']/w:sdtContent/w:t[1]"/>-->
          <!-- commented due to elsevier demo and used the below one line 14-nov-16 -->
          <!--<xsl:variable name="idval" select="child::w:sdtContent/w:p/w:sdt[w:sdtPr/w:alias/@w:val = 'SeqNo']/w:sdtContent/w:r/w:t[1]"/>-->
          <xsl:variable name="idval" select="child::w:sdtContent/w:p/w:sdt[w:sdtPr/w:alias/@w:val = 'SeqNo']/w:sdtContent/w:r/w:t[1]"/>
          
          <xsl:if test="string-length($figSeq) > 0">
            <xsl:attribute name="id">
              <xsl:text>f</xsl:text>
              <xsl:value-of select="translate($figSeq, '  ', '')"/>
              <!--<xsl:value-of select="$idval"/>-->
            </xsl:attribute>
          </xsl:if>              
          <xsl:apply-templates/>
        </xsl:element>
        <!--<xsl:text>&#x000A;</xsl:text>-->
      </xsl:when>
      <xsl:when test="matches($xxx, 'BOX')">
        <!--<xsl:variable name="PN">
          <xsl:choose>
            <xsl:when test="descendant::HyperlinkTextSource[1]/@HyperlinkUDestination">
              <xsl:value-of select="descendant::HyperlinkTextSource[1]/@HyperlinkUDestination"/>
            </xsl:when>
            <xsl:when test="descendant::HyperlinkTextDestination[1]/@BookMarkDestination">
              <xsl:value-of select="descendant::HyperlinkTextDestination[1]/@BookMarkDestination"/>
            </xsl:when>
          </xsl:choose>
        </xsl:variable>-->
        <!--<xsl:text>&#x000A;</xsl:text>-->
        <xsl:element name="div"> 
         <!-- <xsl:if test="string-length($PN) &gt; 0">
            <xsl:attribute name="w:rsidR" select="$PN"/>
          </xsl:if>-->
          <xsl:copy-of select="@*"/>
          <!--<xsl:attribute name="style" select="'background: #eeeeee; border: 1px solid #cccccc;  padding: 0px 0px;'"/>-->
          <xsl:attribute name="data-alias" select="$alias"/>
          <xsl:attribute name="class" select="'Box'"/>
          <!--<xsl:attribute name="title">
            <xsl:value-of select="normalize-space(.)"/>
          </xsl:attribute>-->
          
          <!--              <xsl:variable name="idval" select="child::w:sdtContent/w:p/w:r/w:sdt[w:sdtPr/w:alias/@w:val = 'SeqNo']/w:sdtContent/w:t[1]"/>-->
          <!-- commented due to elsevier demo and used the below one line 14-nov-16 -->
          <!--<xsl:variable name="idval" select="child::w:sdtContent/w:p/w:sdt[w:sdtPr/w:alias/@w:val = 'SeqNo']/w:sdtContent/w:r/w:t[1]"/>-->
          <xsl:variable name="idval" select="child::w:sdtContent/w:p/w:sdt[w:sdtPr/w:alias/@w:val = 'SeqNo']/w:sdtContent/w:r/w:t[1]"/>
          
          <xsl:if test="string-length($figSeq) > 0">
            <xsl:attribute name="id">
              <xsl:text>f</xsl:text>
              <xsl:value-of select="translate($figSeq, '  ', '')"/>
              <!--<xsl:value-of select="$idval"/>-->
            </xsl:attribute>
          </xsl:if>              
          <xsl:apply-templates/>
        </xsl:element>
        <!--<xsl:text>&#x000A;</xsl:text>-->
      </xsl:when>
      <xsl:when test="contains($xxx, 'FE')">
        
        <!--<xsl:text>&#x000A;</xsl:text>-->
        <xsl:element name="div">
          <xsl:if test="string-length($PN) &gt; 0">
            <xsl:attribute name="w:rsidR" select="$PN"/>
          </xsl:if>
          <!--<xsl:attribute name="style" select="'background: #eeeeee; border: 1px solid #cccccc;  padding: 0px 0px;'"/>-->
          <xsl:attribute name="data-alias" select="$alias"/>
          <xsl:attribute name="class" select="'FE'"/>
          <xsl:copy-of select="@txtFrameId"/>
            <xsl:apply-templates select="w:sdtContent"/> 
          <!--<xsl:text>&#x000A;</xsl:text>-->
        </xsl:element>
        <!--<xsl:text>&#x000A;</xsl:text>-->
        <!--<xsl:text>&#x000A;</xsl:text>-->
      </xsl:when>
      <!-- unnumbered reference citations -->
      <xsl:when test="matches($xxx, 'CiteTag')">
        <xsl:element name="a">
          <xsl:if test="string-length($PN) &gt; 0">
            <xsl:attribute name="w:rsidR" select="$PN"/>
          </xsl:if>
          <!--<xsl:attribute name="style" select="'background: #eeeeee; border: 1px solid #cccccc;  padding: 0px 0px;'"/>-->
          <xsl:attribute name="href">
            <xsl:value-of select="concat($filename,'.xhtml#Reference')"/>                  
            <xsl:value-of select="translate($ccName, ' .,;:ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-–','')"/>            
          </xsl:attribute>
          <xsl:attribute name="data-alias" select="'CiteTag'"/>
          <xsl:element name="span">
            <xsl:attribute name="id" select="$ccName"/>
            <xsl:attribute name="class" select="$ccName"/>
            <xsl:apply-templates/>
          </xsl:element>
        </xsl:element>
      </xsl:when>
      <xsl:when test="contains($xxx, 'Reference')">
        <!--<xsl:text>&#x000A;</xsl:text>-->
        <xsl:element name="div">
          <xsl:if test="string-length($PN) &gt; 0">
            <xsl:attribute name="w:rsidR" select="$PN"/>
          </xsl:if>
          <!--<xsl:attribute name="style" select="'background: #eeeeee; border: 1px solid #cccccc;  padding: 0px 0px;'"/>-->
          <xsl:attribute name="id" select="$xxx"/>
          <xsl:copy-of select="@txtFrameId"/>
          <xsl:element name="a">
            <xsl:attribute name="href">
              <xsl:value-of select="concat($filename,'.xhtml#BibRef')"/>                  
              <xsl:value-of select="translate($xxx, ' .,;:ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-–','')"/>            
            </xsl:attribute>  
            <xsl:attribute name="data-alias" select="'Reference'"/>
            <xsl:attribute name="class" select="'action_link'"/>
            <!--<xsl:attribute name="style" select="'background: #eeeeee; border: 1px solid #cccccc;  padding: 0px 0px;'"/>-->
          <xsl:apply-templates/>
          </xsl:element>
        </xsl:element>
        
      </xsl:when>
      
      
      <xsl:when test="matches($xxx, 'CaseStudy')">
        <!--<xsl:variable name="PN">
          <xsl:choose>
            <xsl:when test="descendant::HyperlinkTextSource[1]/@HyperlinkUDestination">
              <xsl:value-of select="descendant::HyperlinkTextSource[1]/@HyperlinkUDestination"/>
            </xsl:when>
            <xsl:when test="descendant::HyperlinkTextDestination[1]/@BookMarkDestination">
              <xsl:value-of select="descendant::HyperlinkTextDestination[1]/@BookMarkDestination"/>
            </xsl:when>
          </xsl:choose>
        </xsl:variable>-->
        <!--<xsl:text>&#x000A;</xsl:text>-->
        <xsl:element name="div"> 
          <xsl:copy-of select="@*"/>
          <xsl:attribute name="data-alias" select="$alias"/>
          <xsl:attribute name="class" select="'CaseStydy'"/>
          <xsl:copy-of select="@txtFrameId"/>
          <xsl:variable name="idval" select="child::w:sdtContent/w:p/w:sdt[w:sdtPr/w:alias/@w:val = 'SeqNo']/w:sdtContent/w:r/w:t[1]"/>
          
          <xsl:if test="string-length($figSeq) > 0">
            <xsl:attribute name="id">
              <xsl:text>f</xsl:text>
              <xsl:value-of select="translate($figSeq, '  ', '')"/>
            </xsl:attribute>
          </xsl:if>              
          <xsl:apply-templates/>
        </xsl:element>
      </xsl:when>
      <xsl:when test="matches($xxx, 'LearningObjectives')">
        <!--<xsl:variable name="PN">
          <xsl:choose>
            <xsl:when test="descendant::HyperlinkTextSource[1]/@HyperlinkUDestination">
              <xsl:value-of select="descendant::HyperlinkTextSource[1]/@HyperlinkUDestination"/>
            </xsl:when>
            <xsl:when test="descendant::HyperlinkTextDestination[1]/@BookMarkDestination">
              <xsl:value-of select="descendant::HyperlinkTextDestination[1]/@BookMarkDestination"/>
            </xsl:when>
          </xsl:choose>
        </xsl:variable>-->
        <!--<xsl:text>&#x000A;</xsl:text>-->
        <xsl:element name="div"> 
          <xsl:copy-of select="@*"/>
          <xsl:attribute name="data-alias" select="$alias"/>
          <xsl:attribute name="class" select="'LearningObjectives'"/>
          <xsl:variable name="idval" select="child::w:sdtContent/w:p/w:sdt[w:sdtPr/w:alias/@w:val = 'SeqNo']/w:sdtContent/w:r/w:t[1]"/>
          
          <xsl:if test="string-length($figSeq) > 0">
            <xsl:attribute name="id">
              <xsl:text>f</xsl:text>
              <xsl:value-of select="translate($figSeq, '  ', '')"/>
            </xsl:attribute>
          </xsl:if>              
          <xsl:apply-templates/>
        </xsl:element>
      </xsl:when>
      
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="descendant::w:sdt[w:sdtPr/w:alias[@w:val='TableCaption']]">
            <xsl:variable name="PN">
              <xsl:choose>
                <xsl:when test="not(descendant::HyperlinkTextSource[1]/@bkmark)">
                  <xsl:value-of select="@w:rsidR"/>
                </xsl:when>
                <xsl:when test="not(descendant::HyperlinkTextDestination[contains(@BookMarkDestination,'_UUID_') or contains(@BookMarkDestination,'story') or contains(@Name,'_UUID_') or contains(lower-case(@Name),'_story_')][1]/@bkmark)">
                  <xsl:value-of select="@w:rsidR"/>
                </xsl:when>
                <!-- Added sorting issue by HyperlinkTextSourceon 10-1-2022 -->
                <xsl:when test="descendant::HyperlinkTextSource[contains(lower-case(@HyperlinkUDestination),'_story_')][1]/@HyperlinkUDestination">
                  <xsl:value-of select="descendant::HyperlinkTextSource[contains(lower-case(@HyperlinkUDestination),'_story_')][1]/@HyperlinkUDestination"/>
                </xsl:when>
                <xsl:when test="descendant::HyperlinkTextDestination[contains(@BookMarkDestination,'_UUID_') or contains(@BookMarkDestination,'story') or contains(@Name,'_UUID_') or contains(lower-case(@Name),'_story_')][1]/@BookMarkDestination">
                  <xsl:value-of select="descendant::HyperlinkTextDestination[contains(@BookMarkDestination,'_UUID_') or contains(@BookMarkDestination,'story') or contains(@Name,'_UUID_') or contains(lower-case(@Name),'_story_')][1]/@BookMarkDestination"/>
                </xsl:when>
              </xsl:choose>
            </xsl:variable>
            <!--<xsl:text>&#x000A;</xsl:text>-->
            <xsl:element name="div">
              <xsl:if test="string-length($PN) &gt; 0">
                <xsl:attribute name="w:rsidR" select="$PN"/>
              </xsl:if>
              <!--<xsl:attribute name="style" select="'background: #eeeeee; border: 1px solid #cccccc;  padding: 0px 0px;'"/>-->
             <!-- <xsl:attribute name="class" select="'captiontable'"/>-->
              <!--<xsl:attribute name="class" select="translate(descendant::w:sdtContent[1]/w:r/w:rPr/w:rStyle/@w:val, ' /\[\]@','')"/>-->
              <xsl:attribute name="data-alias" select="$alias"/>
              <xsl:copy-of select="@txtFrameId"/>
              <!--<xsl:attribute name="title">
                <xsl:value-of select="normalize-space(.)"/>
              </xsl:attribute>-->
              
              <!--              <xsl:variable name="idval" select="child::w:sdtContent/w:p/w:r/w:sdt[w:sdtPr/w:alias/@w:val = 'SeqNo']/w:sdtContent/w:t[1]"/>-->
              <!-- commented due to elsevier demo and used the below one line 14-nov-16 -->
              <xsl:variable name="idval" select="descendant::w:sdtContent/w:p/w:sdt[w:sdtPr/w:alias/@w:val = 'SeqNo']/w:sdtContent/w:r/w:t[1]"/>
              <xsl:if test="string-length($idval) &gt; 0">
                <xsl:attribute name="id">
                  <xsl:text>t</xsl:text>
                  <xsl:value-of select="translate($idval, '  ', '')"/>
                  <!--<xsl:value-of select="$idval"/>-->
                </xsl:attribute>
              </xsl:if>              
              <xsl:apply-templates/> 
            </xsl:element>
          </xsl:when>
          <xsl:otherwise>
            <xsl:variable name="PN">
              <xsl:choose>
                <xsl:when test="not(descendant::HyperlinkTextSource[1]/@bkmark)">
                  <xsl:value-of select="@w:rsidR"/>
                </xsl:when>
                <xsl:when test="not(descendant::HyperlinkTextDestination[contains(@BookMarkDestination,'_UUID_') or contains(@BookMarkDestination,'story') or contains(@Name,'_UUID_') or contains(lower-case(@Name),'_story_')][1]/@bkmark)">
                  <xsl:value-of select="@w:rsidR"/>
                </xsl:when>
                <!-- Added sorting issue by HyperlinkTextSourceon 10-1-2022 -->
                <xsl:when test="descendant::HyperlinkTextSource[contains(lower-case(@HyperlinkUDestination),'_story_')][1]/@HyperlinkUDestination">
                  <xsl:value-of select="descendant::HyperlinkTextSource[contains(lower-case(@HyperlinkUDestination),'_story_')][1]/@HyperlinkUDestination"/>
                </xsl:when>
                <xsl:when test="descendant::HyperlinkTextDestination[contains(@BookMarkDestination,'_UUID_') or contains(@BookMarkDestination,'story') or contains(@Name,'_UUID_') or contains(lower-case(@Name),'_story_')][1]/@BookMarkDestination">
                  <xsl:value-of select="descendant::HyperlinkTextDestination[contains(@BookMarkDestination,'_UUID_') or contains(@BookMarkDestination,'story') or contains(@Name,'_UUID_') or contains(lower-case(@Name),'_story_')][1]/@BookMarkDestination"/>
                </xsl:when>
              </xsl:choose>
            </xsl:variable>
            <xsl:element name="span">
              <xsl:if test="string-length($PN) &gt; 0">
                <xsl:attribute name="w:rsidR" select="$PN"/>
              </xsl:if>
              <!--<xsl:attribute name="style" select="'background: #eeeeee; border: 1px solid #cccccc;  padding: 0px 0px;'"/>-->
              <!--<xsl:attribute name="class" select="$xxx"/>-->
              <!--<xsl:attribute name="class" select="translate(descendant::w:sdtContent[1]/w:r/w:rPr/w:rStyle/@w:val, ' /\[\]@','')"/>-->
              <xsl:attribute name="data-alias" select="$alias"/>
              <xsl:apply-templates select="@*|node()"/>
            </xsl:element>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
    
    <!--<xsl:element name="span">
      <xsl:attribute name="class" select="'contentcontrol'"/>
      <xsl:apply-templates/>
    </xsl:element>-->
    <!-- BOX Tagging -->
    
    <!--<xsl:choose>
      <xsl:when test="w:sdtPr/w:alias">
        <xsl:variable name="xxx" select="w:sdtPr/w:alias/@w:val"/>
        <xsl:choose>
          
          <xsl:when test="matches($xxx, 'TableNumber')">                
            <xsl:element name="span">
              <xsl:attribute name="class" select="'contentcontrol'"/>
              <xsl:apply-templates/>
            </xsl:element>             
          </xsl:when>
          <xsl:when test="matches($xxx, 'TableRefXX')">                
            <xsl:variable name="figSeq" select="descendant::*[self::w:sdt[w:sdtPr/w:alias[@w:val='SeqNo']]]"/>
            <xsl:element name="a">   
              <xsl:attribute name="href">
                <xsl:value-of select="concat($filename,'.xhtml#t')"/>   
                <!-\-<xsl:value-of select="$figSeq"/>          -\->
                <xsl:value-of select="translate($figSeq, ' .,;:ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-–','')"/>                  
              </xsl:attribute>
              <xsl:attribute name="title" select="concat($filename,'.xhtml')"/>
              <xsl:element name="span">
                <xsl:attribute name="class" select="'TableCitation'"/>
                <xsl:apply-templates/>
              </xsl:element>
            </xsl:element>
            
          </xsl:when>
          
          
          <xsl:otherwise>
            <xsl:element name="span">
              <xsl:attribute name="class" select="'MsoPlaceholderTextX'"/>
              <!-\-<xsl:apply-templates select="w:sdtContent/w:r/w:t"/>-\->
              <xsl:apply-templates/>
            </xsl:element>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>          
        <xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>-->
  </xsl:template>
  <!--textbox-->
  <xsl:template match="//v:textbox/w:txbxContent/w:p">    
    <xsl:variable name="paragraphStyle" select="w:pPr/w:pStyle/@w:val"/>
    <xsl:variable name="paragraphStyleName">
      <xsl:value-of select="//w:style[@w:styleId = $paragraphStyle]/w:name/@w:val"/>
    </xsl:variable>
    
    <xsl:choose>
      <xsl:when test="not(ancestor::w:p)">
        <xsl:element name="div">
          <xsl:attribute name="data-type" select="'textbox'"/>
          <xsl:attribute name="data-id" select="ancestor-or-self::v:shape[1]/@id"/>
          <xsl:attribute name="data-style" select="ancestor-or-self::v:textbox[1]/@style"/>
          <!--<xsl:attribute name="style" select="'border:1px solid black;outline: 2px solid #CCC;'"/>-->
          <xsl:attribute name="style">
            <xsl:text>border:1px solid black;outline: 2px solid #CCC;background-color:#</xsl:text>
            <xsl:value-of select="@libraryFillColor"/>
          </xsl:attribute>
          <!--<xsl:text>&#x000A;</xsl:text>-->
              <xsl:element name="p">      
                <xsl:attribute name="class" select="$paragraphStyle"/>
                <xsl:attribute name="data-name" select="$paragraphStyleName"/>
                <!-- 19-08-16 Check for w:pPrChange to identify the previous style while track changes is ON -->
                <xsl:choose>
                  <xsl:when test="child::w:pPr/w:pPrChange | child::w:pPr/w:shd | child::w:pPr/w:jc | child::w:pPr/w:ind">
                    <xsl:attribute name="style">
                      <xsl:text>mso-style-name:</xsl:text>
                      <xsl:value-of select="w:pPr/w:pPrChange/w:pPr/w:pStyle/@w:val"/>
                      <xsl:text> !msorm;</xsl:text>
                      
                      <xsl:if test="child::w:pPr/w:shd">
                        <xsl:text> background:#</xsl:text>
                        <xsl:value-of select="child::w:pPr/w:shd/@w:fill"/>
                        <xsl:text>;</xsl:text>
                      </xsl:if>
                      <!--****** new -->
                      <!--<xsl:if test="child::w:pPr/w:ind">                   
                        <xsl:choose>
                          <xsl:when test="child::w:pPr/w:ind/@w:left and child::w:pPr/w:ind/@w:right | w:pPr/w:jc">
                            <xsl:attribute name="style">
                              <xsl:if test="child::w:pPr/w:ind/@w:left">
                                <xsl:text>margin-left:</xsl:text>
                                <xsl:value-of select="(child::w:pPr/w:ind/@w:left) div 20"/>
                                <xsl:text>pt;</xsl:text>
                              </xsl:if>
                              
                              <xsl:text>margin-right:</xsl:text>
                              <xsl:value-of select="(child::w:pPr/w:ind/@w:right) div 20"/>
                              <xsl:text>pt;</xsl:text>
                              <xsl:if test="child::w:pPr/w:ind/@w:hanging">
                                <xsl:text>text-indent:</xsl:text>
                                <xsl:value-of select="(child::w:pPr/w:ind/@w:hanging) div 20"/>
                                <xsl:text>pt;</xsl:text>   
                              </xsl:if>
                              <xsl:if test="child::w:pPr/w:jc">
                                <xsl:text>text-align:</xsl:text>
                                <xsl:value-of select="(child::w:pPr/w:jc/@w:val)"/>
                                <xsl:text>;</xsl:text>   
                              </xsl:if>
                            </xsl:attribute>
                          </xsl:when>
                          <xsl:when test="child::w:pPr/w:ind/@w:left | w:pPr/w:jc">
                            <xsl:attribute name="style">
                              <xsl:if test="child::w:pPr/w:ind/@w:left">
                                <xsl:text>margin-left:</xsl:text>
                                <xsl:value-of select="(child::w:pPr/w:ind/@w:left) div 20"/>
                                <xsl:text>pt;</xsl:text>
                              </xsl:if>
                              
                              <xsl:if test="child::w:pPr/w:ind/@w:hanging">
                                <xsl:text>text-indent:</xsl:text>
                                <xsl:value-of select="(child::w:pPr/w:ind/@w:hanging) div 20"/>
                                <xsl:text>pt;</xsl:text>   
                              </xsl:if>                            
                            </xsl:attribute>
                          </xsl:when>
                          <xsl:when test="child::w:pPr/w:ind/@w:right | w:pPr/w:jc">
                            <xsl:attribute name="style">
                              <xsl:text>margin-right:</xsl:text>
                              <xsl:value-of select="(child::w:pPr/w:ind/@w:right) div 20"/>
                              <xsl:text>pt;</xsl:text>   
                              <xsl:if test="child::w:pPr/w:ind/@w:hanging">
                                <xsl:text>text-indent:</xsl:text>
                                <xsl:value-of select="(child::w:pPr/w:ind/@w:hanging) div 20"/>
                                <xsl:text>pt;</xsl:text>   
                              </xsl:if>                            
                            </xsl:attribute>
                          </xsl:when>
                        </xsl:choose>
                      </xsl:if>
                      <xsl:if test="child::w:pPr/w:jc">
                        <xsl:attribute name="style">
                          <xsl:text>text-align:</xsl:text>
                          <xsl:value-of select="(child::w:pPr/w:jc/@w:val)"/>
                          <xsl:text>;</xsl:text>   
                        </xsl:attribute>
                      </xsl:if>-->
                      
                      <xsl:if test="contains($bulltype, '.%')">
                        <xsl:attribute name="type">
                          <xsl:value-of select="$indent"/>                       
                        </xsl:attribute>  
                      </xsl:if>
                      <!-- new end -->
                    </xsl:attribute>
                    <xsl:apply-templates/>
                  </xsl:when>
                  <xsl:when test="child::w:sdt">                  
                    <xsl:apply-templates/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:apply-templates/>
                  </xsl:otherwise>
                </xsl:choose> 
              </xsl:element>
          <!--<xsl:text>&#x000A;</xsl:text>-->
        </xsl:element>
      </xsl:when>
      <xsl:otherwise>
        <!-- 09-May-17: Suguna asked to give p tag -->
        <!--<xsl:apply-templates/>-->        
        <xsl:element name="div">
          <xsl:attribute name="data-type" select="'textbox'"/>
          <xsl:attribute name="data-id" select="ancestor-or-self::v:shape[1]/@id"/>
          <xsl:attribute name="data-style" select="ancestor-or-self::v:textbox[1]/@style"/>
          <!--<xsl:attribute name="style" select="'border:1px solid black;outline: 2px solid #CCC;'"/>-->
          <xsl:attribute name="style">
            <xsl:text>border:1px solid black;outline: 2px solid #CCC;background-color:#</xsl:text>
            <xsl:value-of select="@libraryFillColor"/>
          </xsl:attribute>
          <!--<xsl:text>&#x000A;</xsl:text>-->
            <xsl:element name="p">
              <xsl:attribute name="class" select="$paragraphStyle"/>
              <xsl:attribute name="data-name" select="$paragraphStyleName"/>
              <!-- 19-08-16 Check for w:pPrChange to identify the previous style while track changes is ON -->
              <xsl:choose>
                <xsl:when test="child::w:pPr/w:pPrChange | child::w:pPr/w:shd | child::w:pPr/w:jc | child::w:pPr/w:ind">
                  <xsl:attribute name="style">
                    <xsl:text>mso-style-name:</xsl:text>
                    <xsl:value-of select="w:pPr/w:pPrChange/w:pPr/w:pStyle/@w:val"/>
                    <xsl:text> !msorm;</xsl:text>
                    
                    <xsl:if test="child::w:pPr/w:shd">
                      <xsl:text> background:#</xsl:text>
                      <xsl:value-of select="child::w:pPr/w:shd/@w:fill"/>
                      <xsl:text>;</xsl:text>
                    </xsl:if>
                    <!--****** new -->
                    <!--<xsl:if test="child::w:pPr/w:ind">                   
                      <xsl:choose>
                        <xsl:when test="child::w:pPr/w:ind/@w:left and child::w:pPr/w:ind/@w:right | w:pPr/w:jc">
                          <xsl:attribute name="style">
                            <xsl:text>margin-left:</xsl:text>
                            <xsl:value-of select="(child::w:pPr/w:ind/@w:left) div 72"/>
                            <xsl:text>pt;</xsl:text>
                            <xsl:text>margin-right:</xsl:text>
                            <xsl:value-of select="(child::w:pPr/w:ind/@w:right) div 72"/>
                            <xsl:text>pt;</xsl:text>
                            <xsl:if test="child::w:pPr/w:ind/@w:hanging">
                              <xsl:text>text-indent:</xsl:text>
                              <xsl:value-of select="(child::w:pPr/w:ind/@w:hanging) div 72"/>
                              <xsl:text>pt;</xsl:text>   
                            </xsl:if>
                            <xsl:if test="child::w:pPr/w:jc">
                              <xsl:text>style=text-align:</xsl:text>
                              <xsl:value-of select="(child::w:pPr/w:jc/@w:val)"/>
                              <xsl:text>;</xsl:text>   
                            </xsl:if>
                          </xsl:attribute>
                        </xsl:when>
                        <xsl:when test="child::w:pPr/w:ind/@w:left | w:pPr/w:jc">
                          <xsl:attribute name="style">
                            <xsl:text>margin-left:</xsl:text>
                            <xsl:value-of select="(child::w:pPr/w:ind/@w:left) div 72"/>
                            <xsl:text>pt;</xsl:text>   
                            <xsl:if test="child::w:pPr/w:ind/@w:hanging">
                              <xsl:text>text-indent:</xsl:text>
                              <xsl:value-of select="(child::w:pPr/w:ind/@w:hanging) div 72"/>
                              <xsl:text>pt;</xsl:text>   
                            </xsl:if>
                            <xsl:if test="child::w:pPr/w:jc">
                              <xsl:text>style=text-align:</xsl:text>
                              <xsl:value-of select="(child::w:pPr/w:jc/@w:val)"/>
                              <xsl:text>;</xsl:text>   
                            </xsl:if>
                          </xsl:attribute>
                        </xsl:when>
                        <xsl:when test="child::w:pPr/w:ind/@w:right | w:pPr/w:jc">
                          <xsl:attribute name="style">
                            <xsl:text>margin-right:</xsl:text>
                            <xsl:value-of select="(child::w:pPr/w:ind/@w:right) div 72"/>
                            <xsl:text>pt;</xsl:text>   
                            <xsl:if test="child::w:pPr/w:ind/@w:hanging">
                              <xsl:text>text-indent:</xsl:text>
                              <xsl:value-of select="(child::w:pPr/w:ind/@w:hanging) div 72"/>
                              <xsl:text>pt;</xsl:text>   
                            </xsl:if>
                            <xsl:if test="child::w:pPr/w:jc">
                              <xsl:text>style=text-align:</xsl:text>
                              <xsl:value-of select="(child::w:pPr/w:jc/@w:val)"/>
                              <xsl:text>;</xsl:text>   
                            </xsl:if>
                          </xsl:attribute>
                        </xsl:when>
                      </xsl:choose>
                    </xsl:if>
                    <xsl:if test="child::w:pPr/w:jc">
                      <xsl:attribute name="style">
                        <xsl:text>text-align:</xsl:text>
                        <xsl:value-of select="(child::w:pPr/w:jc/@w:val)"/>
                        <xsl:text>;</xsl:text>   
                      </xsl:attribute>
                    </xsl:if>-->
                    
                    <xsl:if test="contains($bulltype, '.%')">
                      <xsl:attribute name="type">
                        <xsl:value-of select="$indent"/>                       
                      </xsl:attribute>  
                    </xsl:if>
                    <!-- new end -->
                  </xsl:attribute>
                  <xsl:apply-templates/>
                </xsl:when>
                <xsl:when test="child::w:sdt">                  
                  <xsl:apply-templates/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:apply-templates/>
                </xsl:otherwise>
              </xsl:choose> 
            </xsl:element> 
          <!--<xsl:text>&#x000A;</xsl:text>-->
        </xsl:element>
        
      </xsl:otherwise>
    </xsl:choose>  
  </xsl:template>
  
  <xsl:template match="v:textbox">
    <xsl:variable name="paragraphStyle" select="child::w:txbxContent/w:p/w:pPr/w:pStyle/@w:val"/>
    <xsl:variable name="paragraphStyleName">
      <xsl:value-of select="//w:style[@w:styleId = $paragraphStyle]/w:name/@w:val"/>
    </xsl:variable>
    <xsl:element name="div">
      <xsl:attribute name="data-type" select="'textbox'"/>
      <xsl:attribute name="data-id" select="ancestor-or-self::v:shape[1]/@id"/>
      <xsl:attribute name="data-style" select="ancestor-or-self::v:textbox[1]/@style"/>
      <xsl:attribute name="style">
        <xsl:text>border:1px solid black;background-color:#</xsl:text>
        <xsl:value-of select="@libraryFillColor"/>
      </xsl:attribute>
      <!-- 09-May-17: Suguna asked to give p tag -->
      <!--<xsl:apply-templates/>-->
      <!--<xsl:text>&#x000A;</xsl:text>-->
      <xsl:element name="p">
        <xsl:attribute name="class" select="$paragraphStyle"/>
        <xsl:attribute name="data-name" select="$paragraphStyleName"/>
        <!-- 19-08-16 Check for w:pPrChange to identify the previous style while track changes is ON -->
        <xsl:choose>
          <xsl:when test="child::w:pPr/w:pPrChange | child::w:pPr/w:shd | child::w:pPr/w:jc | child::w:pPr/w:ind">
            <xsl:attribute name="style">
              <xsl:text>mso-style-name:</xsl:text>
              <xsl:value-of select="w:pPr/w:pPrChange/w:pPr/w:pStyle/@w:val"/>
              <xsl:text> !msorm;</xsl:text>
              
              <xsl:if test="child::w:pPr/w:shd">
                <xsl:text> background:#</xsl:text>
                <xsl:value-of select="child::w:pPr/w:shd/@w:fill"/>
                <xsl:text>;</xsl:text>
              </xsl:if>
              <!--****** new -->
              <!--<xsl:if test="child::w:pPr/w:ind">
                <xsl:choose>
                  <xsl:when test="child::w:pPr/w:ind/@w:left and child::w:pPr/w:ind/@w:right | w:pPr/w:jc">
                    <xsl:attribute name="style">
                      <xsl:text>margin-left:</xsl:text>
                      <xsl:value-of select="(child::w:pPr/w:ind/@w:left) div 72"/>
                      <xsl:text>pt;</xsl:text>
                      <xsl:text>margin-right:</xsl:text>
                      <xsl:value-of select="(child::w:pPr/w:ind/@w:right) div 72"/>
                      <xsl:text>pt;</xsl:text>
                      <xsl:if test="child::w:pPr/w:ind/@w:hanging">
                        <xsl:text>text-indent:</xsl:text>
                        <xsl:value-of select="(child::w:pPr/w:ind/@w:hanging) div 72"/>
                        <xsl:text>pt;</xsl:text>   
                      </xsl:if>
                      <xsl:if test="child::w:pPr/w:jc">
                        <xsl:text>style=text-align:</xsl:text>
                        <xsl:value-of select="(child::w:pPr/w:jc/@w:val)"/>
                        <xsl:text>;</xsl:text>   
                      </xsl:if>
                    </xsl:attribute>
                  </xsl:when>
                  <xsl:when test="child::w:pPr/w:ind/@w:left | w:pPr/w:jc">
                    <xsl:attribute name="style">
                      <xsl:text>margin-left:</xsl:text>
                      <xsl:value-of select="(child::w:pPr/w:ind/@w:left) div 72"/>
                      <xsl:text>pt;</xsl:text>   
                      <xsl:if test="child::w:pPr/w:ind/@w:hanging">
                        <xsl:text>text-indent:</xsl:text>
                        <xsl:value-of select="(child::w:pPr/w:ind/@w:hanging) div 72"/>
                        <xsl:text>pt;</xsl:text>   
                      </xsl:if>
                      <xsl:if test="child::w:pPr/w:jc">
                        <xsl:text>style=text-align:</xsl:text>
                        <xsl:value-of select="(child::w:pPr/w:jc/@w:val)"/>
                        <xsl:text>;</xsl:text>   
                      </xsl:if>
                    </xsl:attribute>
                  </xsl:when>
                  <xsl:when test="child::w:pPr/w:ind/@w:right | w:pPr/w:jc">
                    <xsl:attribute name="style">
                      <xsl:text>margin-right:</xsl:text>
                      <xsl:value-of select="(child::w:pPr/w:ind/@w:right) div 72"/>
                      <xsl:text>pt;</xsl:text>   
                      <xsl:if test="child::w:pPr/w:ind/@w:hanging">
                        <xsl:text>text-indent:</xsl:text>
                        <xsl:value-of select="(child::w:pPr/w:ind/@w:hanging) div 72"/>
                        <xsl:text>pt;</xsl:text>   
                      </xsl:if>
                      <xsl:if test="child::w:pPr/w:jc">
                        <xsl:text>style=text-align:</xsl:text>
                        <xsl:value-of select="(child::w:pPr/w:jc/@w:val)"/>
                        <xsl:text>;</xsl:text>   
                      </xsl:if>
                    </xsl:attribute>
                  </xsl:when>
                </xsl:choose>
              </xsl:if>
              <xsl:if test="child::w:pPr/w:jc">
                <xsl:attribute name="style">
                  <xsl:text>text-align:</xsl:text>
                  <xsl:value-of select="(child::w:pPr/w:jc/@w:val)"/>
                  <xsl:text>;</xsl:text>   
                </xsl:attribute>
              </xsl:if>
              -->
              <xsl:if test="contains($bulltype, '.%')">
                <xsl:attribute name="type">
                  <xsl:value-of select="$indent"/>                       
                </xsl:attribute>  
              </xsl:if>
              <!-- new end -->
            </xsl:attribute>
            <xsl:apply-templates/>
          </xsl:when>
          <xsl:when test="child::w:sdt">                  
            <xsl:apply-templates/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:apply-templates/>
          </xsl:otherwise>
        </xsl:choose> 
      </xsl:element>      
      <!--<xsl:text>&#x000A;</xsl:text>-->
    </xsl:element>
  </xsl:template>
  
  <!-- end of textbox -->
  
  
  <xsl:template match="//w:sdtContent/w:p">
    <xsl:variable name="paragraphStyle" select="w:pPr/w:pStyle/@w:val"/>
    <xsl:variable name="paragraphStyleName">
      <xsl:value-of select="//w:style[@w:styleId = $paragraphStyle]/w:name/@w:val"/>
    </xsl:variable>
    <xsl:variable name="color" select="child::w:pPr/w:rPr/w:color/@w:val"/>
    <xsl:choose>
          <xsl:when test="child::w:pPr/w:numPr">        
            <xsl:variable name="one" select="child::w:pPr/w:numPr/w:numId/@w:val"/>
            <xsl:variable name="ilvl" select="child::w:pPr/w:numPr/w:ilvl/@w:val"/>
            <xsl:variable name="two">
              <!--<xsl:if test="//w:num/@w:numId = $one">-->
                <xsl:value-of select="//w:num[@w:numId = $one]/w:abstractNumId/@w:val"/>
              <!--</xsl:if>-->
            </xsl:variable>
            <xsl:if test="//w:abstractNum/@w:abstractNumId = $two">              
              <xsl:variable name="three" select="//w:abstractNum[@w:abstractNumId = $two]/w:lvl[@w:ilvl = $ilvl]/w:numFmt/@w:val"></xsl:variable>
              <xsl:variable name="bulltype" select="//w:abstractNum[@w:abstractNumId = $two]/w:lvl[@w:ilvl = $ilvl]/w:lvlText/@w:val"></xsl:variable>
              
              <!--<xsl:text>&#x000A;</xsl:text>-->
              <xsl:choose>                
                <xsl:when test="$three = 'upperRoman'">  
                  <xsl:element name="ol">
                    <xsl:attribute name="type">
                      <xsl:value-of select="'I'"/>                       
                    </xsl:attribute>   
                    <xsl:if test="$one = preceding::w:p/w:pPr/w:numPr/w:numId/@w:val">
                      <xsl:attribute name="start">
                        <xsl:number count="w:p[w:pPr/w:numPr/w:numId/@w:val = $one and w:pPr/w:numPr/w:ilvl/@w:val = $ilvl]" level="any"/>
                      </xsl:attribute>
                    </xsl:if>
                    <xsl:element name="li">
                      <xsl:attribute name="class" select="$paragraphStyle"/>
                      <xsl:attribute name="data-name" select="$paragraphStyleName"/>
                      <xsl:apply-templates/>
                    </xsl:element>
                  </xsl:element>
                </xsl:when>
                <xsl:when test="$three = 'lowerRoman'">
                  <xsl:element name="ol">
                    <xsl:attribute name="type">
                      <xsl:value-of select="'i'"/>                       
                    </xsl:attribute>
                    <xsl:element name="li">
                      <xsl:attribute name="class" select="$paragraphStyle"/>
                      <xsl:attribute name="data-name" select="$paragraphStyleName"/>
                      <xsl:apply-templates/>
                    </xsl:element>
                  </xsl:element>
                </xsl:when>
                <xsl:when test="$three = 'lowerLetter'">
                  <xsl:element name="ol">
                    <xsl:attribute name="type">
                      <xsl:value-of select="'a'"/>                       
                    </xsl:attribute>
                    <xsl:if test="not(w:pPr/w:numPr/w:ilvl)">
                      <xsl:text disable-output-escaping="yes">" start="</xsl:text>
                      <xsl:number count="w:p[w:pPr/w:pStyle[@w:val= $paragraphStyle]]"></xsl:number>
                    </xsl:if>
                    <xsl:element name="li">
                      <xsl:attribute name="class" select="$paragraphStyle"/>
                      <xsl:attribute name="data-name" select="$paragraphStyleName"/>
                      <xsl:apply-templates/>
                    </xsl:element>
                  </xsl:element>
                </xsl:when>
                <xsl:when test="$three = 'upperLetter'">
                  <xsl:element name="ol">
                    <xsl:attribute name="type">
                      <xsl:value-of select="'A'"/>                       
                    </xsl:attribute>
                    <xsl:if test="not(w:pPr/w:numPr/w:ilvl)">
                      <xsl:attribute name="start">
                        <xsl:number count="w:p[w:pPr/w:pStyle[@w:val= $paragraphStyle]]"></xsl:number>
                      </xsl:attribute>     
                    </xsl:if>
                    <xsl:element name="li">
                      <xsl:attribute name="class" select="$paragraphStyle"/>
                      <xsl:attribute name="data-name" select="$paragraphStyleName"/>
                      <xsl:apply-templates/>
                    </xsl:element>
                  </xsl:element>
                </xsl:when>
                <xsl:when test="$three = 'decimal'">
                  <xsl:choose>
                    <xsl:when test="contains($bulltype, '.%')">
                      <!--<xsl:text>&#x000A;</xsl:text>-->
                      <xsl:element name="p">
                        <xsl:attribute name="class" select="$paragraphStyle"/>
                        <xsl:attribute name="data-name" select="$paragraphStyleName"/>
                        <!-- 19-08-16 Check for w:pPrChange to identify the previous style while track changes is ON -->
                        <xsl:choose>
                          <xsl:when test="child::w:pPr/w:pPrChange | child::w:pPr/w:shd | child::w:pPr/w:jc | child::w:pPr/w:ind">
                            <xsl:attribute name="style">
                              <xsl:text>mso-style-name:</xsl:text>
                              <xsl:value-of select="w:pPr/w:pPrChange/w:pPr/w:pStyle/@w:val"/>
                              <xsl:text> !msorm;</xsl:text>
                              
                              <xsl:if test="child::w:pPr/w:shd">
                                <xsl:text> background:#</xsl:text>
                                <xsl:value-of select="child::w:pPr/w:shd/@w:fill"/>
                                <xsl:text>;</xsl:text>
                              </xsl:if>
                              <!--****** new -->
                              <!--<xsl:if test="child::w:pPr/w:ind">                   
                                <xsl:choose>
                                  <xsl:when test="child::w:pPr/w:ind/@w:left and child::w:pPr/w:ind/@w:right | w:pPr/w:jc">
                                    <xsl:attribute name="style">
                                      <xsl:text>margin-left:</xsl:text>
                                      <xsl:value-of select="(child::w:pPr/w:ind/@w:left) div 72"/>
                                      <xsl:text>pt;</xsl:text>
                                      <xsl:text>margin-right:</xsl:text>
                                      <xsl:value-of select="(child::w:pPr/w:ind/@w:right) div 72"/>
                                      <xsl:text>pt;</xsl:text>
                                      <xsl:if test="child::w:pPr/w:ind/@w:hanging">
                                        <xsl:text>text-indent:</xsl:text>
                                        <xsl:value-of select="(child::w:pPr/w:ind/@w:hanging) div 72"/>
                                        <xsl:text>pt;</xsl:text>   
                                      </xsl:if>
                                      <xsl:if test="child::w:pPr/w:jc">
                                        <xsl:text>style=text-align:</xsl:text>
                                        <xsl:value-of select="(child::w:pPr/w:jc/@w:val)"/>
                                        <xsl:text>;</xsl:text>   
                                      </xsl:if>
                                    </xsl:attribute>
                                  </xsl:when>
                                  <xsl:when test="child::w:pPr/w:ind/@w:left | w:pPr/w:jc">
                                    <xsl:attribute name="style">
                                      <xsl:text>margin-left:</xsl:text>
                                      <xsl:value-of select="(child::w:pPr/w:ind/@w:left) div 72"/>
                                      <xsl:text>pt;</xsl:text>   
                                      <xsl:if test="child::w:pPr/w:ind/@w:hanging">
                                        <xsl:text>text-indent:</xsl:text>
                                        <xsl:value-of select="(child::w:pPr/w:ind/@w:hanging) div 72"/>
                                        <xsl:text>pt;</xsl:text>   
                                      </xsl:if>
                                      <xsl:if test="child::w:pPr/w:jc">
                                        <xsl:text>style=text-align:</xsl:text>
                                        <xsl:value-of select="(child::w:pPr/w:jc/@w:val)"/>
                                        <xsl:text>;</xsl:text>   
                                      </xsl:if>
                                    </xsl:attribute>
                                  </xsl:when>
                                  <xsl:when test="child::w:pPr/w:ind/@w:right | w:pPr/w:jc">
                                    <xsl:attribute name="style">
                                      <xsl:text>margin-right:</xsl:text>
                                      <xsl:value-of select="(child::w:pPr/w:ind/@w:right) div 72"/>
                                      <xsl:text>pt;</xsl:text>   
                                      <xsl:if test="child::w:pPr/w:ind/@w:hanging">
                                        <xsl:text>text-indent:</xsl:text>
                                        <xsl:value-of select="(child::w:pPr/w:ind/@w:hanging) div 72"/>
                                        <xsl:text>pt;</xsl:text>   
                                      </xsl:if>
                                      <xsl:if test="child::w:pPr/w:jc">
                                        <xsl:text>style=text-align:</xsl:text>
                                        <xsl:value-of select="(child::w:pPr/w:jc/@w:val)"/>
                                        <xsl:text>;</xsl:text>   
                                      </xsl:if>
                                    </xsl:attribute>
                                  </xsl:when>
                                </xsl:choose>
                              </xsl:if>
                              <xsl:if test="child::w:pPr/w:jc">
                                <xsl:attribute name="style">
                                  <xsl:text>text-align:</xsl:text>
                                  <xsl:value-of select="(child::w:pPr/w:jc/@w:val)"/>
                                  <xsl:text>;</xsl:text>   
                                </xsl:attribute>
                              </xsl:if>-->
                              
                              <xsl:if test="contains($bulltype, '.%')">
                                <xsl:attribute name="type">
                                  <xsl:value-of select="$indent"/>                       
                                </xsl:attribute>  
                              </xsl:if>
                              <!-- new end -->
                            </xsl:attribute>
                            <xsl:apply-templates/>
                          </xsl:when>
                          <xsl:when test="child::w:sdt">                  
                            <xsl:apply-templates/>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:if test="contains($bulltype, '.%')">
                              <xsl:element name="span">
                                <xsl:call-template name="AutoNumbering">
                                  <xsl:with-param name="numId" select="child::w:pPr/w:numPr/w:numId/@w:val"/>
                                  <xsl:with-param name="numLevel" select="child::w:pPr/w:numPr/w:ilvl/@w:val"/>
                                </xsl:call-template>
                                <xsl:variable name="numID">
                                  <xsl:value-of select="self::w:p/w:pPr/w:numPr/w:numId/@w:val"/>
                                </xsl:variable>
                                <xsl:variable name="ilvl">
                                  <xsl:value-of select="self::w:p/w:pPr/w:numPr/w:ilvl/@w:val"/>
                                </xsl:variable>
                                <xsl:number count="w:p[w:pPr/w:numPr/w:numId/@w:val =$numID and w:pPr/w:numPr/w:ilvl/@w:val =$ilvl]" level="any" />
                              </xsl:element> 
                              <span style="padding-left:5px;"/>
                            </xsl:if>
                            <xsl:apply-templates/>
                          </xsl:otherwise>
                        </xsl:choose> 
                      </xsl:element>                      
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:element name="ol">
                        <xsl:variable name="x" select="translate($paragraphStyle, '%0123456789', '')"></xsl:variable> 
                        <xsl:attribute name="class" select="$paragraphStyle"/>
                        <xsl:if test="$one = preceding::w:p/w:pPr/w:numPr/w:numId/@w:val">
                          <xsl:attribute name="start">
                            <xsl:number count="w:p[w:pPr/w:numPr/w:numId/@w:val = $one and w:pPr/w:numPr/w:ilvl/@w:val = $ilvl]" level="any"/>
                          </xsl:attribute>
                        </xsl:if>
                        
                        <xsl:if test="child::w:pPr/w:ind">
                          <xsl:attribute name="indent">
                            <xsl:value-of select="(child::w:pPr/w:ind/@w:left) div 72"/>
                            <xsl:text>pt</xsl:text>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:element name="li">
                          <xsl:attribute name="class" select="$paragraphStyle"/>
                          <xsl:attribute name="data-name" select="$paragraphStyleName"/>
                          <xsl:if test="contains($bulltype, '.%')">
                            <xsl:element name="span">
                              <!--                            <xsl:value-of select="substring-before($bulltype, '%')"/>-->
                              <xsl:call-template name="AutoNumbering">
                                <xsl:with-param name="numId" select="child::w:pPr/w:numPr/w:numId/@w:val"/>
                                <xsl:with-param name="numLevel" select="child::w:pPr/w:numPr/w:ilvl/@w:val"/>
                              </xsl:call-template>
                              <xsl:variable name="numID">
                                <xsl:value-of select="self::w:p/w:pPr/w:numPr/w:numId/@w:val"/>
                              </xsl:variable>
                              <xsl:variable name="ilvl">
                                <xsl:value-of select="self::w:p/w:pPr/w:numPr/w:ilvl/@w:val"/>
                              </xsl:variable>
                              <xsl:number count="w:p[w:pPr/w:numPr/w:numId/@w:val =$numID and w:pPr/w:numPr/w:ilvl/@w:val =$ilvl]" level="any" />
                            </xsl:element>  
                          </xsl:if>
                          <xsl:apply-templates/>
                        </xsl:element>
                      </xsl:element>
                    </xsl:otherwise>
                  </xsl:choose>                
                </xsl:when>
                <xsl:when test="$three = 'bullet'">
                  <xsl:element name="ul">
                    <!-- Commented on 29-july-17; to give any type of BL list symbol; for sample i left here, remaining i relpace with new style attibute -->
                    <!--<xsl:attribute name="style">
                      <xsl:choose>
                        <xsl:when test="$bulltype = '•'">                          
                          <xsl:value-of select="'list-style-type: disc'"/>                          
                        </xsl:when>
                        <xsl:when test="$bulltype = 'o'">
                          <xsl:value-of select="'list-style-type: circle'"/>                            
                        </xsl:when>
                        <xsl:when test="$bulltype = ''">
                          <xsl:value-of select="'list-style-type: square'"/>                            
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:value-of select="'list-style-type: none'"/>                            
                        </xsl:otherwise>
                      </xsl:choose>                       
                    </xsl:attribute>-->
                    <xsl:attribute name="style">
                      <xsl:choose>
                        <xsl:when test="$bulltype = '•'">
                          <xsl:value-of select="'list-style-type: disc'"/>
                        </xsl:when>
                        <xsl:when test="$bulltype = 'o'">
                          <xsl:value-of select="'list-style-type: circle'"/>                            
                        </xsl:when>
                        <xsl:when test="$bulltype = ''">
                          <xsl:value-of select="'list-style-type: square'"/>                            
                        </xsl:when>                                
                        <!--<xsl:when test="$bulltype = ''">
                                  <xsl:value-of select="$bulltype"/>  
                                </xsl:when>-->
                        <xsl:otherwise>
                          <xsl:choose>
                            <xsl:when test="$bulltype != ''">
                              <xsl:value-of select="$bulltype"/>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:value-of select="'list-style-type: none'"/>  
                            </xsl:otherwise>
                          </xsl:choose>
                          <!--<xsl:value-of select="'list-style-type: none'"/>  -->                          
                        </xsl:otherwise>
                      </xsl:choose>                       
                    </xsl:attribute>                    
                    <xsl:attribute name="class">
                      <xsl:value-of select="$paragraphStyle"/>                      
                    </xsl:attribute>
                    <xsl:attribute name="data-name" select="$paragraphStyleName"/>
                    
                    <xsl:choose>
                      <xsl:when test="$bulltype = '•'">
                        <xsl:element name="li">
                          <xsl:attribute name="class" select="$paragraphStyle"/>
                          <xsl:attribute name="data-name" select="$paragraphStyleName"/>
                          <xsl:apply-templates/>
                        </xsl:element>
                      </xsl:when>
                      <xsl:when test="$bulltype = 'o'">
                        <xsl:element name="li">  
                          <xsl:attribute name="class" select="$paragraphStyle"/>     
                          <xsl:attribute name="data-name" select="$paragraphStyleName"/>
                          <xsl:apply-templates/>
                        </xsl:element>
                      </xsl:when>
                      <xsl:when test="$bulltype = ''">
                        <xsl:element name="li">
                          <xsl:attribute name="class" select="$paragraphStyle"/>
                          <xsl:attribute name="data-name" select="$paragraphStyleName"/>
                          <xsl:apply-templates/>
                        </xsl:element>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:element name="li"> 
                          <xsl:attribute name="class">
                            <xsl:choose>
                              <xsl:when test="string-length($paragraphStyle) > 0">
                                <xsl:value-of select="$paragraphStyle"/>
                              </xsl:when>
                              <xsl:otherwise>
                                <xsl:value-of select="'MsoNormal'"/>
                              </xsl:otherwise>
                            </xsl:choose>
                          </xsl:attribute>
                          <xsl:attribute name="data-name" select="$paragraphStyleName"/>
                          <!-- 29-july-17, i added in ul so need to give the bullet symbol here -->
                          <!--<xsl:text disable-output-escaping="yes">&lt;span style="padding-left:20px;"/&gt;</xsl:text>
                          <xsl:text disable-output-escaping="yes">&lt;span style="font-family:</xsl:text>
                          <xsl:value-of select="$bulltypeFont"/>
                          <xsl:text disable-output-escaping="yes">;"&gt;</xsl:text>
                          <xsl:value-of select="$bulltype"/>
                          <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                          <xsl:text disable-output-escaping="yes">&lt;span style="padding-left:5px;"/&gt;</xsl:text>-->
                          <xsl:apply-templates/>
                          <!--</xsl:element>-->   
                        </xsl:element>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:element> 
                </xsl:when>                 
              </xsl:choose>
            </xsl:if>        
          </xsl:when>          
          <xsl:otherwise>
            <!--<xsl:text>&#x000A;</xsl:text>-->
            <xsl:element name="p">
              <xsl:if test="w:pPr/w:jc | w:pPr/w:ind">                  
                <!--<xsl:if test="child::w:pPr/w:ind">                  
                  <xsl:choose>
                    <xsl:when test="child::w:pPr/w:ind/@w:left and child::w:pPr/w:ind/@w:right | w:pPr/w:jc">
                      <xsl:attribute name="style">
                        <xsl:text>margin-left:'</xsl:text>
                        <xsl:value-of select="(child::w:pPr/w:ind/@w:left) div 72"/>
                        <xsl:text>pt';</xsl:text>
                        <xsl:text>margin-right:'</xsl:text>
                        <xsl:value-of select="(child::w:pPr/w:ind/@w:right) div 72"/>
                        <xsl:text>pt';</xsl:text>
                        <xsl:if test="child::w:pPr/w:ind/@w:hanging">
                          <xsl:text>text-indent:'</xsl:text>
                          <xsl:value-of select="(child::w:pPr/w:ind/@w:hanging) div 72"/>
                          <xsl:text>pt';</xsl:text>   
                        </xsl:if>
                        <xsl:if test="child::w:pPr/w:jc">
                          <xsl:text>style=text-align:</xsl:text>
                          <xsl:value-of select="(child::w:pPr/w:jc/@w:val)"/>
                          <xsl:text>;</xsl:text>   
                        </xsl:if>
                      </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="child::w:pPr/w:ind/@w:left | w:pPr/w:jc">
                      <xsl:attribute name="style">
                        <xsl:text>margin-left:'</xsl:text>
                        <xsl:value-of select="(child::w:pPr/w:ind/@w:left) div 72"/>
                        <xsl:text>pt';</xsl:text>   
                        <xsl:if test="child::w:pPr/w:ind/@w:hanging">
                          <xsl:text>text-indent:'</xsl:text>
                          <xsl:value-of select="(child::w:pPr/w:ind/@w:hanging) div 72"/>
                          <xsl:text>pt';</xsl:text>   
                        </xsl:if>
                        <xsl:if test="child::w:pPr/w:jc">
                          <xsl:text>style=text-align:</xsl:text>
                          <xsl:value-of select="(child::w:pPr/w:jc/@w:val)"/>
                          <xsl:text>;</xsl:text>   
                        </xsl:if>
                      </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="child::w:pPr/w:ind/@w:right | w:pPr/w:jc">
                      <xsl:attribute name="style">
                        <xsl:text>margin-right:'</xsl:text>
                        <xsl:value-of select="(child::w:pPr/w:ind/@w:right) div 72"/>
                        <xsl:text>pt';</xsl:text>   
                        <xsl:if test="child::w:pPr/w:ind/@w:hanging">
                          <xsl:text>text-indent:'</xsl:text>
                          <xsl:value-of select="(child::w:pPr/w:ind/@w:hanging) div 72"/>
                          <xsl:text>pt';</xsl:text>   
                        </xsl:if>
                        <xsl:if test="child::w:pPr/w:jc">
                          <xsl:text>style=text-align:</xsl:text>
                          <xsl:value-of select="(child::w:pPr/w:jc/@w:val)"/>
                          <xsl:text>;</xsl:text>   
                        </xsl:if>
                      </xsl:attribute>
                    </xsl:when>
                  </xsl:choose>
                </xsl:if>
                <xsl:if test="child::w:pPr/w:jc">
                  <xsl:attribute name="style">
                    <xsl:text>text-align:</xsl:text>
                    <xsl:value-of select="(child::w:pPr/w:jc/@w:val)"/>
                    <xsl:text>;</xsl:text>   
                  </xsl:attribute>
                </xsl:if>-->
                
                <xsl:if test="contains($bulltype, '.%')">
                  <xsl:attribute name="type">
                    <xsl:value-of select="$indent"/>                       
                  </xsl:attribute>  
                </xsl:if>
              </xsl:if>
                <xsl:attribute name="class">
                  <xsl:choose>
                    <xsl:when test="child::w:pPr/w:pStyle">
                      <xsl:value-of select="child::w:pPr/w:pStyle/@w:val"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="'MsoNormal'"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:attribute>
              <xsl:attribute name="data-name" select="$paragraphStyleName"/>
              <xsl:if test="child::w:pPr/w:rPr/w:color">
                
                <xsl:choose>
                  <xsl:when test="$color = 'auto'">
                    <!--<xsl:value-of select="'000000'"/>-->
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:text disable-output-escaping="yes">&lt;span style="color: #</xsl:text>
                    <xsl:value-of select="$color"/>
                    <xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
                  </xsl:otherwise>
                </xsl:choose>
                <!--<xsl:value-of select="w:pPr/w:rPr/w:color/@w:val"/>-->
                
              </xsl:if>
              <xsl:choose>
                <xsl:when test="child::w:pPr/w:pPrChange">
                  <xsl:attribute name="style">
                    <xsl:value-of select="w:pPr/w:pPrChange/w:pPr/w:pStyle/@w:val"/>
                  </xsl:attribute>
                  <xsl:apply-templates/>
                </xsl:when>
                <xsl:otherwise>                  
                  <xsl:apply-templates/>
                  
                </xsl:otherwise>
              </xsl:choose>
              <!--<xsl:apply-templates/>-->
              <xsl:if test="w:pPr/w:rPr/w:color">
                <xsl:choose>
                  <xsl:when test="$color = 'auto'">
                    <!--<xsl:value-of select="'000000'"/>-->
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:if>
            </xsl:element>             
          </xsl:otherwise>
        </xsl:choose>
    <!--<xsl:element name="p">
    <xsl:apply-templates/>
    </xsl:element>-->
  </xsl:template>
  
    <xsl:template match="w:cr">
        <xsl:if test="not(ancestor::w:comment)">
            <br/>
        </xsl:if>
    </xsl:template>
    <xsl:template match="w:sdtContent">
        <xsl:apply-templates select="@*|node()"/>
    </xsl:template>
    <xsl:template match="w:t">
        <xsl:if test="not(preceding-sibling::w:rPr/w:rStyle/@w:val = 'FootnoteReference')">
            <xsl:apply-templates/>
        </xsl:if>
    </xsl:template>
    <xsl:template match="w:softHyphen">
        <!-- Softhyphen &#x00AD; in html file-->
        <xsl:text>&#173;</xsl:text>
    </xsl:template>
    
    <xsl:template match="v:formulas">
        <xsl:element name="span">
            <xsl:attribute name="class" select="'DisplayMath'"/>
        </xsl:element>    
    </xsl:template>
    <!--<xsl:template match="v:shape">
        <xsl:if test="not(preceding-sibling::v:shapetype)">
            <xsl:element name="span">
                <xsl:attribute name="class" select="'InlineMath'"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>-->
    <xsl:template match="w:p/m:oMathPara">
        <xsl:element name="span">
            <xsl:attribute name="class" select="'DisplayMath'"/>
        </xsl:element>    
    </xsl:template>
    <xsl:template match="w:p/m:oMath">
        <xsl:element name="span">
            <xsl:attribute name="class" select="'InlineMath'"/>
        </xsl:element>
    </xsl:template>
    <xsl:template name="AutoNumbering">
        <xsl:param name="numId"/>
        <xsl:param name="numLevel"/>
        <xsl:param name="numhead1"/>
        <xsl:param name="count"/>
        <xsl:for-each select="//w:numbering/w:num[@w:numId = $numId]">
            <xsl:variable name="abstractValue" select="child::w:abstractNumId/@w:val"/>
            
            <xsl:for-each select="//w:numbering/w:abstractNum[@w:abstractNumId = $abstractValue]">
                <xsl:variable name="abstractLevel" select="w:lvl/@w:ilvl"/>
                <xsl:for-each select="child::w:lvl[@w:ilvl = $numLevel]">
                    <xsl:variable name="numFmt" select="w:numFmt/@w:val"/>
                    <!--<xsl:variable name="pStyle" select="translate(w:pStyle/@w:val, 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz', '')"/>-->
                    
                    <xsl:variable name="lvlText" select="replace(w:lvlText/@w:val, '%', '')"/>
                    <xsl:variable name="pStyle" select="child::w:pStyle/@w:val"/>
                    
                    <xsl:choose>
                        <xsl:when test="$numFmt = 'decimal'">
                            <xsl:choose>
                                <xsl:when test="ends-with($lvlText, ')') and not(starts-with($lvlText, '('))">
                                    <xsl:choose>
                                        <xsl:when test="contains($lvlText, 'A.')">
                                            <xsl:value-of select="'A.'"/>
                                        </xsl:when>
                                        <xsl:when test="contains($lvlText, 'a.')">
                                            <xsl:value-of select="'a.'"/>
                                        </xsl:when>
                                        <xsl:when test="contains($lvlText, 'I.')">
                                            <xsl:value-of select="'I.'"/>
                                        </xsl:when>
                                        <xsl:when test="contains($lvlText, 'i.')">
                                            <xsl:value-of select="'i.'"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="'1.'"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    <!--<xsl:value-of select="'1)'"/>-->
                                </xsl:when>
                                <xsl:when test="ends-with($lvlText, ']') and starts-with($lvlText, '[')">
                                    <xsl:value-of select="'[1]'"/>
                                </xsl:when>
                                <xsl:when test="starts-with($lvlText, '(')">
                                    <xsl:value-of select="'(1)'"/>
                                </xsl:when>
                                <xsl:when test="ends-with($lvlText, '.')">
                                    <xsl:choose>
                                        <xsl:when test="contains($lvlText, 'A.')">
                                            <xsl:value-of select="'A.'"/>
                                        </xsl:when>
                                        <xsl:when test="contains($lvlText, 'a.')">
                                            <xsl:value-of select="'a.'"/>
                                        </xsl:when>
                                        <xsl:when test="contains($lvlText, 'I.')">
                                            <xsl:value-of select="'I.'"/>
                                        </xsl:when>
                                        <xsl:when test="contains($lvlText, 'i.')">
                                            <xsl:value-of select="'i.'"/>
                                        </xsl:when>
                                        <xsl:otherwise>    
                                            
                                            
                                            
                                            
                                            <!--<xsl:variable name="xyz" select="$numId + $numLevel"/>    -->
                                            <xsl:variable name="xyz" select="$numId"/>    
                                            <xsl:value-of select="concat($xyz,'.')"/>
                                            <!--<xsl:value-of select="'1.'"/>-->
                                            
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:when>
                                <!--<xsl:otherwise>
                                    <NewListStyle>
                                        <xsl:text>&#x160;&#x160;&#x160;</xsl:text>
                                    </NewListStyle>
                                </xsl:otherwise>-->
                            </xsl:choose>
                        </xsl:when>
                        <xsl:when test="$numFmt = 'upperLetter'">
                            <xsl:choose>
                                <xsl:when test="ends-with($lvlText, ')') and not(starts-with($lvlText, '('))">
                                    <xsl:value-of select="'A)'"/>
                                </xsl:when>
                                <xsl:when test="ends-with($lvlText, ']') and starts-with($lvlText, '[')">
                                    <xsl:value-of select="'[A]'"/>
                                </xsl:when>
                                <xsl:when test="starts-with($lvlText, '(')">
                                    <xsl:value-of select="'(A)'"/>
                                </xsl:when>
                                <xsl:when test="ends-with($lvlText, '.')">
                                    <xsl:value-of select="'A.'"/>
                                </xsl:when>
                                <!--<xsl:otherwise>
                                    <NewListStyle>
                                        <xsl:text>&#x160;&#x160;&#x160;</xsl:text>
                                    </NewListStyle>
                                </xsl:otherwise>-->
                            </xsl:choose>
                        </xsl:when>
                        <xsl:when test="$numFmt = 'lowerLetter'">
                            <xsl:choose>
                                <xsl:when test="ends-with($lvlText, ')') and not(starts-with($lvlText, '('))">
                                    <xsl:value-of select="'a)'"/>
                                </xsl:when>
                                <xsl:when test="ends-with($lvlText, ']') and starts-with($lvlText, '[')">
                                    <xsl:value-of select="'[a]'"/>
                                </xsl:when>
                                <xsl:when test="starts-with($lvlText, '(')">
                                    <xsl:value-of select="'(a)'"/>
                                </xsl:when>
                                <xsl:when test="ends-with($lvlText, '.')">
                                    <xsl:value-of select="'a.'"/>
                                </xsl:when>
                                <!--<xsl:otherwise>
                                    <NewListStyle>
                                        <xsl:text>&#x160;&#x160;&#x160;</xsl:text>
                                    </NewListStyle>
                                </xsl:otherwise>-->
                            </xsl:choose>
                        </xsl:when>
                        <xsl:when test="$numFmt = 'lowerRoman'">
                            <xsl:choose>
                                <xsl:when test="ends-with($lvlText, ')') and not(starts-with($lvlText, '('))">
                                    <xsl:value-of select="'i)'"/>
                                </xsl:when>
                                <xsl:when test="ends-with($lvlText, ']') and starts-with($lvlText, '[')">
                                    <xsl:value-of select="'[i]'"/>
                                </xsl:when>
                                <xsl:when test="starts-with($lvlText, '(')">
                                    <xsl:value-of select="'(i)'"/>
                                </xsl:when>
                                <xsl:when test="ends-with($lvlText, '.')">
                                    <xsl:value-of select="'i.'"/>
                                </xsl:when>
                                <!--<xsl:otherwise>
                                    <NewListStyle>
                                        <xsl:text>&#x160;&#x160;&#x160;</xsl:text>
                                    </NewListStyle>
                                </xsl:otherwise>-->
                            </xsl:choose>
                        </xsl:when>
                        <xsl:when test="$numFmt = 'upperRoman'">
                            <xsl:choose>
                                <xsl:when test="ends-with($lvlText, ')') and not(starts-with($lvlText, '('))">
                                    <xsl:value-of select="'I)'"/>
                                </xsl:when>
                                <xsl:when test="ends-with($lvlText, ']') and starts-with($lvlText, '[')">
                                    <xsl:value-of select="'[I]'"/>
                                </xsl:when>
                                <xsl:when test="starts-with($lvlText, '(')">
                                    <xsl:value-of select="'(I)'"/>
                                </xsl:when>
                                <xsl:when test="ends-with($lvlText, '.')">
                                    <xsl:value-of select="'I.'"/>
                                </xsl:when>
                                <!--<xsl:otherwise>
                                    <NewListStyle>
                                        <xsl:text>&#x160;&#x160;&#x160;</xsl:text>
                                    </NewListStyle>
                                </xsl:otherwise>-->
                            </xsl:choose>
                        </xsl:when>
                        <!--<xsl:otherwise>
                            <NewTypeofList>
                                <xsl:apply-templates/>
                            </NewTypeofList>
                        </xsl:otherwise>-->
                    </xsl:choose>
                </xsl:for-each>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="ListRootNodeOpening">
        <xsl:param name="openingtag"/>
        <xsl:text disable-output-escaping="yes">&#x3C;</xsl:text>
        <xsl:value-of select="$openingtag"/>   
        <xsl:text disable-output-escaping="yes"> type="</xsl:text>
        <xsl:call-template name="AutoNumbering">
            <xsl:with-param name="numId" select="child::w:pPr/w:numPr/w:numId/@w:val"/>
            <xsl:with-param name="numLevel" select="child::w:pPr/w:numPr/w:ilvl/@w:val"/>
        </xsl:call-template>
        <xsl:text disable-output-escaping="yes">"&#x3E;</xsl:text>
        <xsl:choose>
            <xsl:when test="matches(ancestor::w:sdt/w:sdtPr/w:tag/@w:val, 'FE-(0)([0-9]+)')">
                <!--<xsl:text>&#x000A;</xsl:text>-->
                <xsl:element name="p">
                    <xsl:attribute name="class">
                        <xsl:value-of select="concat(ancestor::w:sdt/w:sdtPr/w:tag/@w:val, '_', child::w:pPr/w:pStyle/@w:val)"/>
                    </xsl:attribute>          
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <!--<xsl:text>&#x000A;</xsl:text>-->
                <xsl:element name="p">
                    <xsl:attribute name="class">
                        <xsl:value-of select="$openingtag"/>
                    </xsl:attribute>
                    <xsl:apply-templates/>
                </xsl:element>        
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="ListRootNodeClosing">
        <xsl:param name="closingtag"/>
        <xsl:choose>
            <xsl:when test="matches(ancestor::w:sdt/w:sdtPr/w:tag/@w:val, 'FE-(0)([0-9]+)')">
                <!--<xsl:text>&#x000A;</xsl:text>-->
                <xsl:element name="p">
                    <xsl:attribute name="class">
                        <xsl:value-of select="concat(ancestor::w:sdt/w:sdtPr/w:tag/@w:val, '_', child::w:pPr/w:pStyle/@w:val)"/>
                    </xsl:attribute>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <!--<xsl:text>&#x000A;</xsl:text>-->
                <xsl:element name="p">
                    <xsl:attribute name="class">
                        <xsl:value-of select="$closingtag"/>
                    </xsl:attribute>
                    <xsl:apply-templates/>
                </xsl:element>        
            </xsl:otherwise>
        </xsl:choose>
        <xsl:text disable-output-escaping="yes">&#x3C;/</xsl:text>
        <xsl:value-of select="$closingtag"/>
        <xsl:text disable-output-escaping="yes">&#x3E;</xsl:text>
    </xsl:template>
    <xsl:template name="CurrentNode">
        <xsl:param name="currentnodetag"/>
        <xsl:element name="{$currentnodetag}">
            <xsl:element name="p">
                <xsl:attribute name="class">
                    <xsl:value-of select="$currentnodetag"/>
                </xsl:attribute>
                <xsl:apply-templates/>
            </xsl:element>    
        </xsl:element>
    </xsl:template>
    <xsl:template name="CurrentNode1">
        <xsl:param name="currentnodetag"/>
        <!--<xsl:text>&#x000A;</xsl:text>-->
        <xsl:element name="p">
            <xsl:attribute name="class">
                <xsl:value-of select="$currentnodetag"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>    
    </xsl:template>
    
    
    
    <xsl:template match="w:drawing" mode="image">
        <!-- <xsl:element name="p">-->
        <!--<xsl:attribute name="class" select="'image'"/>-->
        <xsl:element name="img">
          <!--Added for image size in wycywyg on 4-11-2020-->
          <!--<xsl:if test="ancestor::p[@w:rsidR] | ancestor::w:p[@w:rsidR]">
            
            <xsl:attribute name="max-width">
              <xsl:choose>
                <xsl:when test="ancestor::p[@w:rsidR]">
                  <xsl:value-of select="substring-before(substring-after(ancestor::p[@w:rsidR]/@w:rsidR,'W_'),'_H')"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="substring-before(substring-after(ancestor::w:p[@w:rsidR]/@w:rsidR,'W_'),'_H')"/>
                </xsl:otherwise>
              </xsl:choose>
              
            </xsl:attribute>
            <xsl:attribute name="max-height">
              <xsl:choose>
                <xsl:when test="ancestor::p[@w:rsidR]">
                  <xsl:value-of select="substring-before(substring-after(ancestor::p[@w:rsidR]/@w:rsidR,'H_'),'_C')"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="substring-before(substring-after(ancestor::w:p[@w:rsidR]/@w:rsidR,'H_'),'_C')"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            <xsl:attribute name="width">
              <xsl:value-of select="'auto'"/>
            </xsl:attribute>
            <xsl:attribute name="height">
              <xsl:value-of select="'auto'"/>
            </xsl:attribute>
          </xsl:if>-->
          
            <xsl:attribute name="data-src">
                <!--<xsl:value-of
                    select="concat('../images/', replace(replace(replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name, '.eps', '.jpg'), '.tif', '.jpg'), '%20', '_'))"
                />-->
              <!--Added for wyciwyg on 2-11-2020-->
              <xsl:variable name="artmatch"
                select="wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name"/>
              
              <xsl:variable name="artmatch2">
                <!--<xsl:value-of
                  select="replace(replace(replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name, '.eps', '.jpg'), '.tif', '.jpg'), '%20', '_')"/>-->
                <xsl:value-of
                  select="replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name,'%20', '_')"/>
              </xsl:variable>
              
              <xsl:choose>
                <xsl:when test="$PassArtPath = ''">
                  <!-- Removed the image path for wiciwyg display the fileEntry images on 14-06-2024 Azure 15040 -->
                  <!--<xsl:value-of
                    select="concat('../images/', replace(replace(replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name, '.eps', '.jpg'), '.tif', '.jpg'), '%20', '_'))"
                  />-->
                  <!--<xsl:value-of
                    select="replace(replace(replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name, '.eps', '.jpg'), '.tif', '.jpg'), '%20', '_')"
                  />-->
                  <xsl:value-of
                    select="replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name,'%20', '_')"
                  />
                </xsl:when>
                <xsl:otherwise>
                  
                    <!--<xsl:when test="contains($artmatch,'.jpg') or contains($artmatch,'.jpeg')"> on 02-07-2021-->
                    <xsl:choose>
                      <xsl:when test="contains(lower-case($artmatch),'.tiff') or contains(lower-case($artmatch),'.tif') or contains(lower-case($artmatch),'.psd') or contains(lower-case($artmatch),'.eps') or contains(lower-case($artmatch),'.ai') or contains(lower-case($artmatch),'.pdf') or contains(lower-case($artmatch),'.pptx')">
                        <xsl:variable name="art-name">
                          <!--<xsl:value-of select="replace(replace(replace(replace(replace(replace(replace(replace($artmatch,'.tiff','.jpg'),'.tif','.jpg'),'.psd','.jpg'),'.eps','.jpg'),'.ai','.jpg'),'.pdf','.jpg'),'.pptx','.jpg'),'%20','_')"/>-->
                          <xsl:value-of select="replace($artmatch,'%20','_')"/>
                        </xsl:variable>
                        <!--<xsl:value-of select="concat($PassArtPath, '/Convert%20TO%20JPG/', $art-name)"/>-->
                        <xsl:value-of select="$art-name"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:variable name="artmatch1">
                          <xsl:value-of
                            select="replace($artmatch,'%20', '_')"/>
                        </xsl:variable>
                        <!--<xsl:value-of select="concat($PassArtPath, '/', $artmatch1)"/>-->
                        <xsl:value-of select="$artmatch1"/>
                      </xsl:otherwise>
                    </xsl:choose>
                </xsl:otherwise>
              </xsl:choose>
              
               </xsl:attribute>
            <xsl:attribute name="alt" select="''"/>
          <xsl:if test="child::wp:inline/@data-pageitem">
            <xsl:attribute name="data-spreadpageitem" select="'yes'"/>
          </xsl:if>
        </xsl:element>
        <!--</xsl:element>-->
    </xsl:template>
    
<xsl:template match="w:pict">
      <xsl:variable name="PN" select="descendant::*[@w:rsidR][1]/@w:rsidR"/>
      <xsl:variable name="txtFrameId">
        <xsl:choose>
          <xsl:when test="not(contains(substring-after(lower-case($PN),'_txtid_'),'_'))">
            <xsl:choose>
              <xsl:when test="contains(lower-case($PN),'_txtid_')">
                <xsl:value-of select="substring-after(lower-case($PN),'_txtid_')"/>
              </xsl:when>
            </xsl:choose>
          </xsl:when>
          <xsl:otherwise>
            <xsl:choose>
              <xsl:when test="contains(lower-case($PN),'_txtid_')">
                <xsl:value-of select="substring-before(substring-after(lower-case($PN),'_txtid_'),'_')"/>
              </xsl:when>
            </xsl:choose>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
        <!--<xsl:text>&#x000A;</xsl:text>-->
      <!--<xsl:apply-templates select="descendant::v:shape/v:textbox/w:txbxContent/p | descendant::v:shape/v:textbox/w:txbxContent | descendant::w:tbl"/>-->
      <xsl:element name="div">    
        <xsl:if test="string-length($txtFrameId) &gt; 0">
          <xsl:choose>
            <xsl:when test="starts-with($txtFrameId,'u')">
              <xsl:attribute name="txtFrameId" select="$txtFrameId"/>        
            </xsl:when>
            <xsl:otherwise>
              <xsl:attribute name="txtFrameId" select="concat('u',$txtFrameId)"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:if>
        <xsl:attribute name="data-type" select="'textbox'"/>
        <xsl:attribute name="data-id" select="descendant-or-self::v:shape[1]/@id"/>
        <xsl:attribute name="data-style" select="descendant::v:textbox[1]/@style"/>
        <!--<xsl:attribute name="style" select="'border:1px solid black;outline: 2px solid #CCC;'"/>-->
        <!-- Added for boxgroup from spred on 11-03-2025 -->
        <xsl:attribute name="data-AppliedObjectStyle"><xsl:value-of select="@data-AppliedObjectStyle"/></xsl:attribute>
        <!-- End -->
        <xsl:attribute name="style">
          <xsl:text>border:1px solid black;outline: 2px solid #CCC;</xsl:text>
          <xsl:if test="descendant::v:textbox/@libraryFillColor">
            <xsl:text>background-color:#</xsl:text>
          <xsl:value-of select="descendant::v:textbox/@libraryFillColor"/>
          </xsl:if>
        </xsl:attribute>
        <xsl:text>&#x000A;</xsl:text>
        <!--<xsl:apply-templates select="descendant::v:shape/v:textbox/w:txbxContent | descendant::w:tbl"/>-->
        <xsl:apply-templates select="child::v:shape | child::w:tbl"/>
        <xsl:text>&#x000A;</xsl:text>
      </xsl:element>
        <!--<xsl:apply-templates select="descendant::v:shape/v:textbox/w:txbxContent | descendant::w:tbl"/>-->
    </xsl:template>
    
    
    <xsl:template match="//w:drawing"><!-- For Hari IDML2Word -->
      
        <xsl:variable name="imgnameid" select="wp:inline/a:graphic/a:graphicData/pic:pic/pic:blipFill/a:blip/@r:embed"/>
        <xsl:variable name="imgnameid2" select="wp:anchor/a:graphic/a:graphicData/pic:pic/pic:blipFill/a:blip/@r:embed"/>
        <xsl:choose>
        <xsl:when test="wp:inline/a:graphic/a:graphicData/pic:pic/pic:blipFill/a:blip[@r:embed] or wp:anchor/a:graphic/a:graphicData/pic:pic/pic:blipFill/a:blip[@r:embed]">
          
                <xsl:element name="img">
                   <xsl:attribute name="data-src">
                        <!--13-11-15: commented below to take the actual image name. I'm merging document.xml.rels "Relationships" to document.xml-->
                        <!--13-11-15: refer unzip.xml "\\10.1.1.1\Automation\WORD2XML\Word2HTML5\unzip.pl"-->
                        <xsl:for-each select="//Relationships/Relationship[@Id = $imgnameid]">
                            <xsl:variable name="imageName" select="//Relationships/Relationship[@Id = $imgnameid]/@Target"/>

               <!--Added for wyciwyg on 2-11-2020-->
               <xsl:variable name="artmatch"
                select="substring-after(//Relationships/Relationship[@Id = $imgnameid][not(contains(@Target,'http'))]/@Target, '/')"/>
              <xsl:choose>
                <xsl:when test="$PassArtPath = ''">
                  <!--<xsl:value-of select="concat('../images/',substring-after(//Relationships/Relationship[@Id = $imgnameid]/@Target,'/'))"/>-->
                  <xsl:value-of select="substring-after(//Relationships/Relationship[@Id = $imgnameid]/@Target,'/')"/>
                </xsl:when>
                <xsl:otherwise>
                  <!--<xsl:value-of select="concat($PassArtPath, '/', $artmatch)"/>-->
                  <xsl:choose>
                    <xsl:when test="contains(lower-case($artmatch),'.tiff') or contains(lower-case($artmatch),'.tif') or contains(lower-case($artmatch),'.psd') or contains(lower-case($artmatch),'.eps') or contains(lower-case($artmatch),'.ai') or contains(lower-case($artmatch),'.pdf') or contains(lower-case($artmatch),'.pptx')">
                      <xsl:variable name="art-name">
                        <!--<xsl:value-of select="replace(replace(replace(replace(replace(replace(replace(replace($artmatch,'.tiff','.jpg'),'.tif','.jpg'),'.psd','.jpg'),'.eps','.jpg'),'.ai','.jpg'),'.pdf','.jpg'),'.pptx','.jpg'),'%20','_')"/>-->
                        <xsl:value-of select="replace($artmatch,'%20','_')"/>
                      </xsl:variable>
                      <!--<xsl:value-of select="concat($PassArtPath, '/Convert%20TO%20JPG/', $art-name)"/>-->
                      <xsl:value-of select="$art-name"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:variable name="artmatch1">
                        <xsl:value-of
                          select="replace($artmatch,'%20', '_')"/>
                      </xsl:variable>
                      <!--<xsl:value-of select="concat($PassArtPath, '/', $artmatch1)"/>-->
                      <xsl:value-of select="$artmatch1"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:otherwise>
              </xsl:choose>
             </xsl:for-each>
                        <xsl:for-each select="//Relationships/Relationship[@Id = $imgnameid2]">
                            <!--<xsl:value-of select="concat('../images/',substring-after(@Target,'/'))"/>-->
                          <xsl:value-of select="substring-after(@Target,'/')"/>
                        </xsl:for-each>
                        <!--<xsl:value-of
            select="concat('../images/', replace(replace(replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name, '.eps', '.jpg'), '.tif', '.jpg'), '%20', '_'))"
          />-->
                    </xsl:attribute>
                    <xsl:attribute name="alt" select="''"/>     
                  <xsl:if test="child::wp:inline/@data-pageitem">
                    <xsl:attribute name="data-spreadpageitem" select="'yes'"/>
                  </xsl:if>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="img">
                  
                    <xsl:attribute name="data-src">
                        <!--13-11-15: commented below to take the actual image name. I'm merging document.xml.rels "Relationships" to document.xml-->
                        <!--13-11-15: refer unzip.xml "\\10.1.1.1\Automation\WORD2XML\Word2HTML5\unzip.pl"-->            
                        <!--<xsl:value-of
                            select="concat('../images/', replace(replace(replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name, '.eps', '.jpg'), '.tif', '.jpg'), '%20', '_'))"
                        />-->
                     
                      <!--Added for wyciwyg on 2-11-2020-->
                      <xsl:variable name="artmatch"
                        select="wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name"/>
                      
                      <xsl:variable name="artmatch2">
                        <!--<xsl:value-of
                          select="replace(replace(replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name, '.eps', '.jpg'), '.tif', '.jpg'), '%20', '_')"/>-->
                        <xsl:value-of
                          select="replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name, '%20', '_')"/>
                      </xsl:variable>
                        
                      <xsl:choose>
                        <xsl:when test="$PassArtPath = ''">
                          <!--<xsl:value-of
                            select="concat('../images/', replace(replace(replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name, '.eps', '.jpg'), '.tif', '.jpg'), '%20', '_'))"
                          />-->
                          <!--<xsl:value-of
                            select="replace(replace(replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name, '.eps', '.jpg'), '.tif', '.jpg'), '%20', '_')"
                          />-->
                          <xsl:value-of
                            select="replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name,'%20', '_')"
                          />
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:choose>
                            <xsl:when test="contains(lower-case($artmatch),'.tiff') or contains(lower-case($artmatch),'.tif') or contains(lower-case($artmatch),'.psd') or contains(lower-case($artmatch),'.eps') or contains(lower-case($artmatch),'.ai') or contains(lower-case($artmatch),'.pdf') or contains(lower-case($artmatch),'.pptx')">
                              <xsl:variable name="art-name">
                                <!--<xsl:value-of select="replace(replace(replace(replace(replace(replace(replace(replace($artmatch,'.tiff','.jpg'),'.tif','.jpg'),'.psd','.jpg'),'.eps','.jpg'),'.ai','.jpg'),'.pdf','.jpg'),'.pptx','.jpg'),'%20','_')"/>-->
                                <xsl:value-of select="replace($artmatch,'%20','_')"/>
                              </xsl:variable>
                              <!--<xsl:value-of select="concat($PassArtPath, '/Convert%20TO%20JPG/', $art-name)"/>-->
                              <xsl:value-of select="$art-name"/>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:variable name="artmatch1">
                                <xsl:value-of
                                  select="replace($artmatch,'%20', '_')"/>
                              </xsl:variable>
                              <!--<xsl:value-of select="concat($PassArtPath, '/', $artmatch1)"/>-->
                              <xsl:value-of select="$artmatch1"/>
                            </xsl:otherwise>
                          </xsl:choose>
                        </xsl:otherwise>
                      </xsl:choose>
                      </xsl:attribute>  
                    <xsl:attribute name="class" select="'_idGenObjectAttribute-1'"/>
                    <xsl:attribute name="alt" select="''"/> 
                  <xsl:if test="child::wp:inline/@data-pageitem">
                    <xsl:attribute name="data-spreadpageitem" select="'yes'"/>
                  </xsl:if>
                </xsl:element> 
            </xsl:otherwise>
        </xsl:choose>
        <!--</xsl:element>-->
    </xsl:template>
  
<!-- 02-Sep-17, for inside paragraphs formats -->
  <xsl:template match="//p">
      <xsl:element name="p">      
        <xsl:choose>
          <xsl:when test="child::w:pPr/w:pPrChange | child::w:pPr/w:shd | child::w:pPr/w:jc | child::w:pPr/w:ind">
            <xsl:if test="@style">
              <xsl:attribute name="style">
                <xsl:value-of select="@style"/>
                <xsl:text>; mso-style-name:</xsl:text>
                <xsl:value-of select="w:pPr/w:pPrChange/w:pPr/w:pStyle/@w:val"/>
                <xsl:text> !msorm;</xsl:text>
                
                <xsl:if test="child::w:pPr/w:shd">
                  <xsl:text> background:#</xsl:text>
                  <xsl:value-of select="child::w:pPr/w:shd/@w:fill"/>
                  <xsl:text>;</xsl:text>
                </xsl:if>
                <xsl:if test="contains($bulltype, '.%')">
                  <xsl:attribute name="type">
                    <xsl:value-of select="$indent"/>                       
                  </xsl:attribute>  
                </xsl:if>
                <!-- new end -->
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="not(@style)">
                  <xsl:attribute name="style">
                    <xsl:text>mso-style-name:</xsl:text>
                    <xsl:value-of select="w:pPr/w:pPrChange/w:pPr/w:pStyle/@w:val"/>
                    <xsl:text> !msorm;</xsl:text>
                    
                    <xsl:if test="child::w:pPr/w:shd">
                      <xsl:text> background:#</xsl:text>
                      <xsl:value-of select="child::w:pPr/w:shd/@w:fill"/>
                      <xsl:text>;</xsl:text>
                    </xsl:if>
                    <!--****** new -->
                    <!--<xsl:if test="child::w:pPr/w:ind">                   
                      <xsl:choose>
                        <xsl:when test="child::w:pPr/w:ind/@w:left and child::w:pPr/w:ind/@w:right | w:pPr/w:jc">
                          <xsl:attribute name="style">
                            <xsl:if test="child::w:pPr/w:ind/@w:left">
                              <xsl:text>margin-left:</xsl:text>
                              <xsl:value-of select="(child::w:pPr/w:ind/@w:left) div 20"/>
                              <xsl:text>pt;</xsl:text>
                            </xsl:if>
                            
                            <xsl:text>margin-right:</xsl:text>
                            <xsl:value-of select="(child::w:pPr/w:ind/@w:right) div 20"/>
                            <xsl:text>pt;</xsl:text>
                            <xsl:if test="child::w:pPr/w:ind/@w:hanging">
                              <xsl:text>text-indent:</xsl:text>
                              <xsl:value-of select="(child::w:pPr/w:ind/@w:hanging) div 20"/>
                              <xsl:text>pt;</xsl:text>   
                            </xsl:if>
                            <xsl:if test="child::w:pPr/w:jc">
                              <xsl:text>text-align:</xsl:text>
                              <xsl:value-of select="(child::w:pPr/w:jc/@w:val)"/>
                              <xsl:text>;</xsl:text>   
                            </xsl:if>
                          </xsl:attribute>
                        </xsl:when>
                        <xsl:when test="child::w:pPr/w:ind/@w:left | w:pPr/w:jc">
                          <xsl:attribute name="style">
                            <xsl:if test="child::w:pPr/w:ind/@w:left">
                              <xsl:text>margin-left:</xsl:text>
                              <xsl:value-of select="(child::w:pPr/w:ind/@w:left) div 20"/>
                              <xsl:text>pt;</xsl:text>
                            </xsl:if>
                            
                            <xsl:if test="child::w:pPr/w:ind/@w:hanging">
                              <xsl:text>text-indent:</xsl:text>
                              <xsl:value-of select="(child::w:pPr/w:ind/@w:hanging) div 20"/>
                              <xsl:text>pt;</xsl:text>   
                            </xsl:if>                            
                          </xsl:attribute>
                        </xsl:when>
                        <xsl:when test="child::w:pPr/w:ind/@w:right | w:pPr/w:jc">
                          <xsl:attribute name="style">
                            <xsl:text>margin-right:</xsl:text>
                            <xsl:value-of select="(child::w:pPr/w:ind/@w:right) div 20"/>
                            <xsl:text>pt;</xsl:text>   
                            <xsl:if test="child::w:pPr/w:ind/@w:hanging">
                              <xsl:text>text-indent:</xsl:text>
                              <xsl:value-of select="(child::w:pPr/w:ind/@w:hanging) div 20"/>
                              <xsl:text>pt;</xsl:text>   
                            </xsl:if>                            
                          </xsl:attribute>
                        </xsl:when>
                      </xsl:choose>
                    </xsl:if>
                    <xsl:if test="child::w:pPr/w:jc">
                      <xsl:attribute name="style">
                        <xsl:text>text-align:</xsl:text>
                        <xsl:value-of select="(child::w:pPr/w:jc/@w:val)"/>
                        <xsl:text>;</xsl:text>   
                      </xsl:attribute>
                    </xsl:if>-->
                    <!--<xsl:if test="w:pPr/w:rPr/w:color">                
                                <xsl:choose>
                                  <xsl:when test="$color = 'auto'">
                                    <!-\- <xsl:value-of select="'000000'"/>-\->
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <xsl:text disable-output-escaping="yes">&lt;span style="color: #</xsl:text>
                                    <xsl:choose>
                                      <xsl:when test="$color = 'auto'">
                                        <xsl:value-of select="'000000'"/>
                                      </xsl:when>
                                      <xsl:otherwise>
                                        <xsl:value-of select="$color"/> 
                                      </xsl:otherwise>
                                    </xsl:choose>
                                    <xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
                                  </xsl:otherwise>
                                </xsl:choose>
                                <!-\-<xsl:value-of select="w:pPr/w:rPr/w:color/@w:val"/>-\->
                                
                              </xsl:if>-->
                    <xsl:if test="contains($bulltype, '.%')">
                      <xsl:attribute name="type">
                        <xsl:value-of select="$indent"/>                       
                      </xsl:attribute>  
                    </xsl:if>
                    <!-- new end -->
                  </xsl:attribute>
            </xsl:if>
            <xsl:copy-of select="@*"/>
              <xsl:apply-templates/>
          </xsl:when>        
          <xsl:otherwise>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:element>
  </xsl:template>
  <!-- Added comment alone comes in empty para on 28-02-2023 -->
  <!-- added for math not(descendant::span[@id='mathjax']) on 29-09-2025 -->
  <xsl:template match="//p">
    <xsl:choose>
      <xsl:when test="contains(@w:rsidR,'_unp') and not(descendant::span[@id='mathjax']) and  not(descendant::w:t) and not(descendant::w:commentReference)">
      </xsl:when>
      <xsl:otherwise>
        <xsl:copy>
          <xsl:apply-templates select="@*|node()"></xsl:apply-templates>
        </xsl:copy>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="XMLAttribute">
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="span">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"></xsl:apply-templates>
    </xsl:copy>
  </xsl:template>
  
  <!--commented to avoid the sup , sub missing issue-->
  <!-- Added to avoid multiple span tags on 29-09-2021 -->
  <!--<xsl:template match="w:r[child::span[@class]]">
    <xsl:apply-templates/>
  </xsl:template>-->
  <!--  Added to avoid multiple span tags on 29-09-2021-->
  <!--<xsl:template match="w:rPr[w:rStyle][following-sibling::*[self::span[@class]]]/w:rStyle"/>-->
  <!-- 02-sep-17, END -->
  <!-- Added to retain the endnotes id's on 8-7-2022 -->
  <!-- Removed [1] to remove the multiple number match on 21-o5-2024 -->
  <!-- span[@class='endnotereference' or @data-name='endnote reference']/w:t[normalize-space(.) = following-sibling::a[@class='endnotecitation'][1]/normalize-space(.)] -->
  <!-- Removed for multiple endnote on 22-05-2024 Azure 14611-->
  <xsl:template match="span[@class='endnotereference' or @data-name='endnote reference']/w:t[normalize-space(.) = following-sibling::a[@class='endnotecitation']/normalize-space(.)]"/>
  <xsl:template match="span[@class='EndnoteNumber' or @data-name='EndnoteNumber']/w:t[normalize-space(.) = following-sibling::a[@class='crossref'][1]/normalize-space(.)]"/>
</xsl:stylesheet>