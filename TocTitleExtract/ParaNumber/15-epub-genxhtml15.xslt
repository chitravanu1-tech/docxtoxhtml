<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf"
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
  xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" xmlns:math="http://exslt.org/math"
  extension-element-prefixes="math"
  xmlns:pic="http://schemas.openxmlformats.org/drawingml/2006/picture"
  xmlns:a14="http://schemas.microsoft.com/office/drawing/2010/main"
  xmlns:idPkg="http://ns.adobe.com/AdobeInDesign/idml/1.0/packaging" version="2.0">
  
  <xsl:strip-space elements="*"/>
  <xsl:preserve-space elements="Content w:t"/>
  
  <!--Added for wyciwyg on 2-11-2020-->
  <xsl:param name="PassArtPath"/>
  
  <!-- 21/05/2020 added choose condition for content controle of xpath-->
  <!--08/08/2020 commented by prakash s for un wanted link in Reference  for Holtzclaw book in Springer -->
  <!--07/12/2020 commented by prakash s for R&L (mannen) unwanted web link    -->
  <!--21-01-2021 below choose commented by prakash for unwanted choose is in from chitra script for phonix files  -->
  <!-- 16-05-2023 below  <xsl:element name="p"> commented by prakash s on 16-05-2023 for R&L book of Gubi_ Pastoral and Reflective Supervision of Clergy   -->
  
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
  
  <xsl:variable name="json" select="document('bookMapperXMLFile.xml')"/>

  <xsl:variable name="filename" select="substring-before(tokenize(base-uri(.), '/')[last()], '.')"/>
  <xsl:param name="PassFileName" select="substring-before(tokenize(base-uri(.), '/')[last()], '.')"/>
  
  <!--Saravan pass file-->
  <xsl:variable name="bkBinder" select="document('bookMapperXMLFile.xml')"/>
  <xsl:param name="basicCharacterEntity"
    select="'&#8232;|&#x0020;|&#xa0;|&#x00A0;|&#xA;|&#x9;|&#x2028;|&#8194;|&#8195;|&#x00009;|&#x0000A;|&#x02002;|&#x02003;|&#x02004;|&#x02005;|&#x02007;|&#x02008;|&#x02009;|&#x0200A;|&#x0200B;|&#x0200C;|&#x0200D;|&#x0200E;|&#x0200F;|&#x0205F;|&#x02060;|&#x02061;|&#x02062;|&#x02063;|&#x000AD;|&#x000A0;|&#x00021;|&#x00022;|&#x00023;|&#x00024;|&#x00025;|&#x00026;|&#x00028;|&#x00029;|&#x0002A;|&#x0002B;|&#x0002C;|&#x0002E;|&#x0002F;|&#x0003A;|&#x0003B;|&#x0003C;|&#x0003D;|&#x0003E;|&#x0003F;|&#x00040;|&#x0005B;|&#x0005C;|&#x0005D;|&#x0005E;|&#x0005F;|&#x00060;|&#x0007B;|&#x0007C;|&#x0007D;|&#x000A1;|&#x000A2;|&#x000A4;|&#x000A5;|&#x000A6;|&#x000A7;|&#x000A8;|&#x000A9;|&#x000AB;|&#x000AC;|&#x000AE;|&#x000AF;|&#x000B1;|&#x000B4;|&#x000B6;|&#x000B7;|&#x000B8;|&#x000BB;|&#xfeff;|&#x200c;|&#65533;|&#x2013;'"/>
  <xsl:param name="allSpaceCharacterEntity"
    select="'&#8232;|&#x0020;|&#xa0;|&#x00A0;|&#xA;|&#x9;|&#x2028;|&#8194;|&#8195;|&#x00009;|&#x0000A;|&#x02002;|&#x02003;|&#x02004;|&#x02005;|&#x02007;|&#x02008;|&#x02009;|&#x0200A;|&#x0200B;|&#x0200C;|&#x0200D;|&#x0200E;|&#x0200F;|&#x0205F;|&#x02060;|&#x02061;|&#x02062;|&#x02063;|&#x000AD;|&#x000A0;|&#65279;|&#xfeff;|&#x202F;|&#x200c;|&#65533;'"/>
  
  <xsl:variable name="filename1">
    <xsl:variable name="val">
    <xsl:choose>
      <xsl:when test="$PassFileName = ''">
        <!--<xsl:value-of select="substring-before($PassFileName,'.')"/>-->
        <xsl:value-of select="substring-before(tokenize(base-uri(.), '/')[last()], '.')"/>
      </xsl:when>
      <xsl:otherwise>
        <!--<xsl:value-of select="substring-before(tokenize(base-uri(.), '/')[last()],'.')"></xsl:value-of>-->
        <xsl:value-of select="substring-before($PassFileName, '.')"/>
      </xsl:otherwise>
    </xsl:choose>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="matches($val,' ')">
        <xsl:value-of select="replace($val,' ','_')"/> 
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$val"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="tSeq">
    <xsl:if test="descendant::w:sdt[w:sdtPr/w:alias[@w:val = 'SeqNo']]">
      <xsl:value-of select="normalize-space(descendant::w:sdt[w:sdtPr/w:alias[@w:val = 'SeqNo']][1])"/>
    </xsl:if>
  </xsl:variable>

  <xsl:variable name="one" select="child::w:pPr/w:numPr/w:numId/@w:val"/>
  <xsl:variable name="indent" select="child::w:pPr/w:numPr/w:ilvl/@w:val"/>
  <xsl:variable name="ilvl" select="child::w:pPr/w:numPr/w:ilvl/@w:val"/>
  <xsl:variable name="two">
    <xsl:if test="//w:numbering/w:num/@w:numId = $one">
      <xsl:value-of select="//w:numbering/w:num[@w:numId = $one]/w:abstractNumId/@w:val"/>
    </xsl:if>
  </xsl:variable>
  <xsl:variable name="three"
    select="//w:abstractNum[@w:abstractNumId = $two]/w:lvl[@w:ilvl = $ilvl]/w:numFmt/@w:val"/>
  <xsl:variable name="bulltype"
    select="//w:abstractNum[@w:abstractNumId = $two]/w:lvl[@w:ilvl = $ilvl]/w:lvlText/@w:val"/>

  <!-- END of Global Vaiable -->
  <xsl:output method="xml" name="xml" xml:space="preserve" indent="yes"/>



  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
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
            test="
              contains($charstyle, 'No character style') or contains($charstyle, 'NO CHARACTER STYLE')
              or contains($charstyle, 'Nocharacterstyle')">
            <!--<xsl:apply-templates/>-->
            <xsl:choose>
              <xsl:when
                test="w:rPr/w:b | w:rPr/w:rFonts | w:rPr/w:sz | w:rPr/w:color | w:rPr/w:position | w:rPr/w:smallCaps | w:rPr/w:u | w:rPr/w:strike | w:rPr/w:caps | w:rPr/w:dstrike | w:rPr/w:vertAlign | w:rPr/w:highlight">
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
                <xsl:if
                  test="w:rPr/w:rFonts | w:rPr/w:szCs | w:rPr/w:sz | w:rPr/w:color | w:rPr/w:position | w:u | w:rPr/w:smallCaps[not(@w:val = '0')] | w:rPr/w:highlight">
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
                        <xsl:value-of
                          select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:ascii"/>
                      </xsl:when>
                      <xsl:when
                        test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia">
                        <xsl:value-of
                          select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"
                        />
                      </xsl:when>
                      <xsl:when
                        test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia">
                        <xsl:value-of
                          select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"
                        />
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of
                          select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"
                        />
                      </xsl:otherwise>
                    </xsl:choose>
                    <!--<xsl:value-of select="w:rPr/w:rFonts/@w:cs"/>-->
                    <xsl:text/>
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
                   <!-- <xsl:value-of select="(w:rPr/w:szCs/@w:val) div 2 + ((w:rPr/w:szCs/@w:val) * 10 div 100)"/>
                    <xsl:text>pt'</xsl:text>-->
                    
                    <xsl:variable name="fontSize">
                      <xsl:value-of select="(w:rPr/w:szCs/@w:val) div 2 + ((w:rPr/w:szCs/@w:val) * 10 div 100)"/>
                    </xsl:variable>
                    <xsl:call-template name="fontSize-Convert-pt-to-percentage">
                      <xsl:with-param name="fontSize" select="$fontSize"/>
                    </xsl:call-template>
                    <xsl:text>%'</xsl:text>
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
                 <!--   <xsl:value-of select="(w:rPr/w:sz/@w:val) div 2"/>
                    <xsl:text>pt</xsl:text>-->
                    <xsl:variable name="fontSize">
                      <xsl:value-of select="(w:rPr/w:sz/@w:val) div 2"/>
                    </xsl:variable>
                    <xsl:call-template name="fontSize-Convert-pt-to-percentage">
                      <xsl:with-param name="fontSize" select="$fontSize"/>
                    </xsl:call-template>
                    <xsl:text>%</xsl:text>
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
                    <xsl:text/>
                  </xsl:if>
                  <!-- END of COLOR -->
                  <!-- HIGHLIGHT -->
                  <xsl:if test="w:rPr/w:highlight">
                    <xsl:if
                      test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:position | w:rPr/w:color">
                      <xsl:text>;</xsl:text>
                    </xsl:if>
                    <xsl:choose>
                      <xsl:when
                        test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:position | w:rPr/w:color">
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
                    <xsl:text/>
                  </xsl:if>
                  <!-- END of HIGHLIGHT -->
                  <!-- position -->
                  <xsl:if test="w:rPr/w:position">
                    <xsl:if
                      test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:highlight">
                      <xsl:text>; </xsl:text>
                    </xsl:if>
                    <xsl:if
                      test="not(w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:highlight)">
                      <xsl:text> style="</xsl:text>
                    </xsl:if>
                    <xsl:choose>
                      <xsl:when test="child::w:rPr/w:position">
                        <xsl:variable name="val" select="child::w:rPr/w:position/@w:val"/>
                        <xsl:choose>
                          <xsl:when test="contains($val, '-')">
                            <xsl:text>position:relative;top:</xsl:text>
                            <xsl:value-of select="number(substring-after($val, '-')) div 2"/>
                            <xsl:text>pt;mso-text-raise:-</xsl:text>
                            <xsl:value-of select="number(substring-after($val, '-')) div 2"/>
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
                    <xsl:if
                      test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:position | w:rPr/w:highlight">
                      <xsl:text>; </xsl:text>
                    </xsl:if>
                    <xsl:if
                      test="not(w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:position | w:rPr/w:highlight)">
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
                          <xsl:when
                            test="w:rPr/w:smallCaps[not(@w:val = '0')] | w:rPr/w:caps[not(@w:val = '0')]">
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
                                <xsl:value-of
                                  select="replace(child::w:rPr/w:rStyle/@w:val, '^([0-9]+)', '')"/>
                              </xsl:attribute>
                              <!-- <xsl:attribute name="data-name">
                          <xsl:value-of select="child::w:rPr/w:rStyle/@w:val"/>
                        </xsl:attribute>-->
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
                      <xsl:when
                        test="w:rPr/w:smallCaps[not(@w:val = '0')] | w:rPr/w:caps[not(@w:val = '0')]">

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
                <xsl:if
                  test="w:rPr/w:rFonts | w:rPr/w:szCs | w:rPr/w:sz | w:rPr/w:position | w:rPr/w:color | w:rPr/w:smallCaps[not(@w:val = '0')] | w:rPr/w:highlight">
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
              <xsl:when
                test="w:rPr/w:i | w:rPr/w:rFonts | w:rPr/w:sz | w:rPr/w:color | w:rPr/w:position | w:rPr/w:smallCaps | w:rPr/w:u | w:rPr/w:strike | w:rPr/w:caps | w:rPr/w:dstrike | w:rPr/w:vertAlign">
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
                <xsl:if
                  test="w:rPr/w:rFonts | w:rPr/w:szCs | w:rPr/w:sz | w:rPr/w:color | w:rPr/w:position | w:u | w:rPr/w:smallCaps[not(@w:val = '0')]">
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
                        <xsl:value-of
                          select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:ascii"/>
                      </xsl:when>
                      <xsl:when
                        test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia">
                        <xsl:value-of
                          select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"
                        />
                      </xsl:when>
                      <xsl:when
                        test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia">
                        <xsl:value-of
                          select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"
                        />
                      </xsl:when>
                      <xsl:otherwise>
                        <!--<xsl:value-of select="w:rPr/w:rFonts/@w:asciiTheme"/>-->
                      </xsl:otherwise>
                    </xsl:choose>
                    <!--<xsl:value-of select="w:rPr/w:rFonts/@w:cs"/>-->
                    <xsl:text/>
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
                    <!--<xsl:value-of select="(w:rPr/w:szCs/@w:val) div 2"/>
                    <xsl:text>pt</xsl:text>-->
                    
                    <xsl:variable name="fontSize">
                      <xsl:value-of select="(w:rPr/w:szCs/@w:val) div 2"/>
                    </xsl:variable>
                    <xsl:call-template name="fontSize-Convert-pt-to-percentage">
                      <xsl:with-param name="fontSize" select="$fontSize"/>
                    </xsl:call-template>
                    <xsl:text>%</xsl:text>
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
                   <!-- <xsl:value-of select="(w:rPr/w:sz/@w:val) div 2"/>
                    <xsl:text>pt'</xsl:text>-->
                    
                    <xsl:variable name="fontSize">
                      <xsl:value-of select="(w:rPr/w:sz/@w:val) div 2"/>
                    </xsl:variable>
                    <xsl:call-template name="fontSize-Convert-pt-to-percentage">
                      <xsl:with-param name="fontSize" select="$fontSize"/>
                    </xsl:call-template>
                    <xsl:text>%'</xsl:text>
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
                        <xsl:value-of select="$color"/>
                      </xsl:otherwise>
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
                            <xsl:value-of select="number(substring-after($val, '-')) div 2"/>
                            <xsl:text>pt;mso-text-raise:-</xsl:text>
                            <xsl:value-of select="number(substring-after($val, '-')) div 2"/>
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
                    <xsl:if
                      test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:position">
                      <xsl:text>; </xsl:text>
                    </xsl:if>
                    <xsl:if
                      test="not(w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:position)">
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
                            <xsl:value-of
                              select="replace(child::w:rPr/w:rStyle/@w:val, '^([0-9]+)', '')"/>
                          </xsl:attribute>
                          <!--    <xsl:attribute name="data-name">
                    <xsl:value-of select="child::w:rPr/w:rStyle/@w:val"/>
                  </xsl:attribute>-->
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
                      <xsl:when
                        test="w:rPr/w:smallCaps[not(@w:val = '0')] | w:rPr/w:caps[not(@w:val = '0')]">
                        <!--<xsl:value-of select="upper-case(.)"/>-->
                        <xsl:apply-templates/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:apply-templates/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:otherwise>
                </xsl:choose>

                <xsl:if
                  test="w:rPr/w:rFonts | w:rPr/w:szCs | w:rPr/w:sz | w:rPr/w:position | w:rPr/w:color | w:rPr/w:smallCaps[not(@w:val = '0')]">
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
                  <xsl:when
                    test="w:rPr/w:b | w:rPr/w:rFonts | w:rPr/w:sz | w:rPr/w:color | w:rPr/w:position | w:rPr/w:smallCaps | w:rPr/w:u | w:rPr/w:strike | w:rPr/w:caps | w:rPr/w:dstrike | w:rPr/w:vertAlign | w:rPr/w:highlight">
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
                    <xsl:if
                      test="w:rPr/w:rFonts | w:rPr/w:szCs | w:rPr/w:sz | w:rPr/w:color | w:rPr/w:position | w:u | w:rPr/w:smallCaps[not(@w:val = '0')] | w:rPr/w:highlight">
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
                          <xsl:when
                            test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:ascii">
                            <xsl:value-of
                              select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:ascii"
                            />
                          </xsl:when>
                          <xsl:when
                            test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia">
                            <xsl:value-of
                              select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"
                            />
                          </xsl:when>
                          <xsl:when
                            test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia">
                            <xsl:value-of
                              select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"
                            />
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:value-of
                              select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"
                            />
                          </xsl:otherwise>
                        </xsl:choose>
                        <!--<xsl:value-of select="w:rPr/w:rFonts/@w:cs"/>-->
                        <xsl:text/>
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
                       <!-- <xsl:value-of select="(w:rPr/w:szCs/@w:val) div 2"/>
                        <xsl:text>pt'</xsl:text>-->
                        
                        <xsl:variable name="fontSize">
                          <xsl:value-of select="(w:rPr/w:szCs/@w:val) div 2"/>
                        </xsl:variable>
                        <xsl:call-template name="fontSize-Convert-pt-to-percentage">
                          <xsl:with-param name="fontSize" select="$fontSize"/>
                        </xsl:call-template>
                        <xsl:text>%'</xsl:text>
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
                        <!--<xsl:value-of select="(w:rPr/w:sz/@w:val) div 2"/>
                        <xsl:text>pt</xsl:text>-->
                        <xsl:variable name="fontSize">
                          <xsl:value-of select="(w:rPr/w:sz/@w:val) div 2"/>
                        </xsl:variable>
                        <xsl:call-template name="fontSize-Convert-pt-to-percentage">
                          <xsl:with-param name="fontSize" select="$fontSize"/>
                        </xsl:call-template>
                        <xsl:text>%</xsl:text>
                      </xsl:if>
                      <xsl:if test="w:rPr/w:color">
                        <xsl:if test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:position">
                          <xsl:text>;</xsl:text>
                        </xsl:if>
                        <xsl:choose>
                          <xsl:when
                            test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:position">
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
                        <xsl:text/>
                      </xsl:if>
                      <!-- END of COLOR -->
                      <!-- HIGHLIGHT -->
                      <xsl:if test="w:rPr/w:highlight">
                        <xsl:if
                          test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:position | w:rPr/w:color">
                          <xsl:text>;</xsl:text>
                        </xsl:if>
                        <xsl:choose>
                          <xsl:when
                            test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:position | w:rPr/w:color">
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
                        <xsl:text/>
                      </xsl:if>
                      <!-- END of HIGHLIGHT -->
                      <!-- position -->
                      <xsl:if test="w:rPr/w:position">
                        <xsl:if
                          test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:highlight">
                          <xsl:text>; </xsl:text>
                        </xsl:if>
                        <xsl:if
                          test="not(w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:highlight)">
                          <xsl:text> style="</xsl:text>
                        </xsl:if>
                        <xsl:choose>
                          <xsl:when test="child::w:rPr/w:position">
                            <xsl:variable name="val" select="child::w:rPr/w:position/@w:val"/>
                            <xsl:choose>
                              <xsl:when test="contains($val, '-')">
                                <xsl:text>position:relative;top:</xsl:text>
                                <xsl:value-of select="number(substring-after($val, '-')) div 2"/>
                                <xsl:text>pt;mso-text-raise:-</xsl:text>
                                <xsl:value-of select="number(substring-after($val, '-')) div 2"/>
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
                        <xsl:if
                          test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:position | w:rPr/w:highlight">
                          <xsl:text>; </xsl:text>
                        </xsl:if>
                        <xsl:if
                          test="not(w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:position | w:rPr/w:highlight)">
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
                              <xsl:when
                                test="w:rPr/w:smallCaps[not(@w:val = '0')] | w:rPr/w:caps[not(@w:val = '0')]">
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
                                    <xsl:value-of
                                      select="replace(child::w:rPr/w:rStyle/@w:val, '^([0-9]+)', '')"
                                    />
                                  </xsl:attribute>
                                  <!--  <xsl:attribute name="data-name">
                          <xsl:value-of select="child::w:rPr/w:rStyle/@w:val"/>
                        </xsl:attribute>-->
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
                          <xsl:when
                            test="w:rPr/w:smallCaps[not(@w:val = '0')] | w:rPr/w:caps[not(@w:val = '0')]">
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
                    <xsl:if
                      test="w:rPr/w:rFonts | w:rPr/w:szCs | w:rPr/w:sz | w:rPr/w:position | w:rPr/w:color | w:rPr/w:smallCaps[not(@w:val = '0')] | w:rPr/w:highlight">
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
                  <xsl:when
                    test="w:rPr/w:i | w:rPr/w:rFonts | w:rPr/w:sz | w:rPr/w:color | w:rPr/w:position | w:rPr/w:smallCaps | w:rPr/w:u | w:rPr/w:strike | w:rPr/w:caps | w:rPr/w:dstrike | w:rPr/w:vertAlign">
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
                    <xsl:if
                      test="w:rPr/w:rFonts | w:rPr/w:szCs | w:rPr/w:sz | w:rPr/w:color | w:rPr/w:position | w:u | w:rPr/w:smallCaps">
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
                          <xsl:when
                            test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:ascii">
                            <xsl:value-of
                              select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:ascii"
                            />
                          </xsl:when>
                          <xsl:when
                            test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia">
                            <xsl:value-of
                              select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"
                            />
                          </xsl:when>
                          <xsl:when
                            test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia">
                            <xsl:value-of
                              select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"
                            />
                          </xsl:when>
                          <xsl:otherwise>
                            <!--<xsl:value-of select="w:rPr/w:rFonts/@w:asciiTheme"/>-->
                          </xsl:otherwise>
                        </xsl:choose>
                        <!--<xsl:value-of select="w:rPr/w:rFonts/@w:cs"/>-->
                        <xsl:text/>
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
                       <!-- <xsl:value-of select="(w:rPr/w:szCs/@w:val) div 2"/>
                        <xsl:text>pt</xsl:text>-->
                        <xsl:variable name="fontSize">
                          <xsl:value-of select="(w:rPr/w:szCs/@w:val) div 2"/>
                        </xsl:variable>
                        <xsl:call-template name="fontSize-Convert-pt-to-percentage">
                          <xsl:with-param name="fontSize" select="$fontSize"/>
                        </xsl:call-template>
                        <xsl:text>%</xsl:text>
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
                        <!--<xsl:value-of select="(w:rPr/w:sz/@w:val) div 2"/>
                        <xsl:text>pt'</xsl:text>-->
                        <xsl:variable name="fontSize">
                          <xsl:value-of select="(w:rPr/w:sz/@w:val) div 2"/>
                        </xsl:variable>
                        <xsl:call-template name="fontSize-Convert-pt-to-percentage">
                          <xsl:with-param name="fontSize" select="$fontSize"/>
                        </xsl:call-template>
                        <xsl:text>%'</xsl:text>
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
                            <xsl:value-of select="$color"/>
                          </xsl:otherwise>
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
                                <xsl:value-of select="number(substring-after($val, '-')) div 2"/>
                                <xsl:text>pt;mso-text-raise:-</xsl:text>
                                <xsl:value-of select="number(substring-after($val, '-')) div 2"/>
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
                        <xsl:if
                          test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:position">
                          <xsl:text>; </xsl:text>
                        </xsl:if>
                        <xsl:if
                          test="not(w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:position)">
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
                                <xsl:value-of
                                  select="replace(child::w:rPr/w:rStyle/@w:val, '^([0-9]+)', '')"/>
                              </xsl:attribute>
                              <!--  <xsl:attribute name="data-name">
                    <xsl:value-of select="child::w:rPr/w:rStyle/@w:val"/>
                  </xsl:attribute>-->
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
                          <xsl:when
                            test="w:rPr/w:smallCaps[not(@w:val = '0')] | w:rPr/w:caps[not(@w:val = '0')]">
                            <!--<xsl:value-of select="upper-case(.)"/>-->
                            <xsl:apply-templates/>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:apply-templates/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </xsl:otherwise>
                    </xsl:choose>

                    <xsl:if
                      test="w:rPr/w:rFonts | w:rPr/w:szCs | w:rPr/w:sz | w:rPr/w:position | w:rPr/w:color | w:rPr/w:smallCaps[not(@w:val = '0')]">
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
                      <xsl:attribute name="class" select="replace($charStyle, '^([0-9]+)', '')"/>
                      <!--                      <xsl:attribute name="data-name" select="$charStyleName"/>                      -->
                      <xsl:apply-templates/>
                    </xsl:element>
                  </xsl:otherwise>
                </xsl:choose>
                <!--</span>-->
              </xsl:when>
              <xsl:otherwise>
                <xsl:choose>
                  <xsl:when
                    test="w:rPr/w:b | w:rPr/w:rFonts | w:rPr/w:sz | w:rPr/w:color | w:rPr/w:position | w:rPr/w:smallCaps | w:rPr/w:u | w:rPr/w:strike | w:rPr/w:caps | w:rPr/w:dstrike | w:rPr/w:vertAlign | w:rPr/w:highlight">
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
                    <xsl:if
                      test="w:rPr/w:rFonts | w:rPr/w:szCs | w:rPr/w:sz | w:rPr/w:color | w:rPr/w:position | w:u | w:rPr/w:smallCaps | w:rPr/w:highlight">
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
                          <xsl:when
                            test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:ascii">
                            <xsl:value-of
                              select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:ascii"
                            />
                          </xsl:when>
                          <xsl:when
                            test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia">
                            <xsl:value-of
                              select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"
                            />
                          </xsl:when>
                          <xsl:when
                            test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia">
                            <xsl:value-of
                              select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"
                            />
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:value-of
                              select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"
                            />
                          </xsl:otherwise>
                        </xsl:choose>
                        <!--<xsl:value-of select="w:rPr/w:rFonts/@w:cs"/>-->
                        <xsl:text/>
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
                       <!-- <xsl:value-of select="(w:rPr/w:szCs/@w:val) div 2"/>
                        <xsl:text>pt'</xsl:text>-->
                        <xsl:variable name="fontSize">
                          <xsl:value-of select="(w:rPr/w:szCs/@w:val) div 2"/>
                        </xsl:variable>
                        <xsl:call-template name="fontSize-Convert-pt-to-percentage">
                          <xsl:with-param name="fontSize" select="$fontSize"/>
                        </xsl:call-template>
                        <xsl:text>%'</xsl:text>
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
                        <!--<xsl:value-of select="(w:rPr/w:sz/@w:val) div 2"/>
                        <xsl:text>pt</xsl:text>-->
                        <xsl:variable name="fontSize">
                          <xsl:value-of select="(w:rPr/w:sz/@w:val) div 2"/>
                        </xsl:variable>
                        <xsl:call-template name="fontSize-Convert-pt-to-percentage">
                          <xsl:with-param name="fontSize" select="$fontSize"/>
                        </xsl:call-template>
                        <xsl:text>%</xsl:text>
                      </xsl:if>
                      <xsl:if test="w:rPr/w:color">
                        <xsl:if test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:position">
                          <xsl:text>;</xsl:text>
                        </xsl:if>
                        <xsl:choose>
                          <xsl:when
                            test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:position">
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
                        <xsl:text/>
                      </xsl:if>
                      <!-- END of COLOR -->
                      <!-- HIGHLIGHT -->
                      <xsl:if test="w:rPr/w:highlight">
                        <xsl:if
                          test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:position | w:rPr/w:color">
                          <xsl:text>;</xsl:text>
                        </xsl:if>
                        <xsl:choose>
                          <xsl:when
                            test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:position | w:rPr/w:color">
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
                        <xsl:text/>
                      </xsl:if>
                      <!-- END of HIGHLIGHT -->
                      <!-- position -->
                      <xsl:if test="w:rPr/w:position">
                        <xsl:if
                          test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:highlight">
                          <xsl:text>; </xsl:text>
                        </xsl:if>
                        <xsl:if
                          test="not(w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:highlight)">
                          <xsl:text> style="</xsl:text>
                        </xsl:if>
                        <xsl:choose>
                          <xsl:when test="child::w:rPr/w:position">
                            <xsl:variable name="val" select="child::w:rPr/w:position/@w:val"/>
                            <xsl:choose>
                              <xsl:when test="contains($val, '-')">
                                <xsl:text>position:relative;top:</xsl:text>
                                <xsl:value-of select="number(substring-after($val, '-')) div 2"/>
                                <xsl:text>pt;mso-text-raise:-</xsl:text>
                                <xsl:value-of select="number(substring-after($val, '-')) div 2"/>
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
                        <xsl:if
                          test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:position | w:rPr/w:highlight">
                          <xsl:text>; </xsl:text>
                        </xsl:if>
                        <xsl:if
                          test="not(w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:position | w:rPr/w:highlight)">
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
                              <xsl:when
                                test="w:rPr/w:smallCaps[not(@w:val = '0')] | w:rPr/w:caps[not(@w:val = '0')]">
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
                                    <xsl:value-of
                                      select="replace(child::w:rPr/w:rStyle/@w:val, '^([0-9]+)', '')"
                                    />
                                  </xsl:attribute>
                                  <!-- <xsl:attribute name="data-name">
                                          <xsl:value-of select="child::w:rPr/w:rStyle/@w:val"/>
                                        </xsl:attribute>-->
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
                          <xsl:when
                            test="w:rPr/w:smallCaps[not(@w:val = '0')] | w:rPr/w:caps[not(@w:val = '0')]">

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
                    <xsl:if
                      test="w:rPr/w:rFonts | w:rPr/w:szCs | w:rPr/w:sz | w:rPr/w:position | w:rPr/w:color | w:rPr/w:smallCaps[not(@w:val = '0')] | w:rPr/w:highlight">
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
                  <xsl:when
                    test="w:rPr/w:i | w:rPr/w:rFonts | w:rPr/w:sz | w:rPr/w:color | w:rPr/w:position | w:rPr/w:smallCaps | w:rPr/w:u | w:rPr/w:strike | w:rPr/w:caps | w:rPr/w:dstrike | w:rPr/w:vertAlign">
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
                    <xsl:if
                      test="w:rPr/w:rFonts | w:rPr/w:szCs | w:rPr/w:sz | w:rPr/w:color | w:rPr/w:position | w:u | w:rPr/w:smallCaps">
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
                          <xsl:when
                            test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:ascii">
                            <xsl:value-of
                              select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:ascii"
                            />
                          </xsl:when>
                          <xsl:when
                            test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia">
                            <xsl:value-of
                              select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"
                            />
                          </xsl:when>
                          <xsl:when
                            test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia">
                            <xsl:value-of
                              select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"
                            />
                          </xsl:when>
                          <xsl:otherwise>
                            <!--<xsl:value-of select="w:rPr/w:rFonts/@w:asciiTheme"/>-->
                          </xsl:otherwise>
                        </xsl:choose>
                        <!--<xsl:value-of select="w:rPr/w:rFonts/@w:cs"/>-->
                        <xsl:text/>
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
                     <!--   <xsl:value-of select="(w:rPr/w:szCs/@w:val) div 2"/>
                        <xsl:text>pt</xsl:text>-->
                        <xsl:variable name="fontSize">
                          <xsl:value-of select="(w:rPr/w:szCs/@w:val) div 2"/>
                        </xsl:variable>
                        <xsl:call-template name="fontSize-Convert-pt-to-percentage">
                          <xsl:with-param name="fontSize" select="$fontSize"/>
                        </xsl:call-template>
                        <xsl:text>%</xsl:text>
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
                        <!--<xsl:value-of select="(w:rPr/w:sz/@w:val) div 2"/>
                        <xsl:text>pt'</xsl:text>-->
                        <xsl:variable name="fontSize">
                          <xsl:value-of select="(w:rPr/w:sz/@w:val) div 2"/>
                        </xsl:variable>
                        <xsl:call-template name="fontSize-Convert-pt-to-percentage">
                          <xsl:with-param name="fontSize" select="$fontSize"/>
                        </xsl:call-template>
                        <xsl:text>%'</xsl:text>
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
                            <xsl:value-of select="$color"/>
                          </xsl:otherwise>
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
                                <xsl:value-of select="number(substring-after($val, '-')) div 2"/>
                                <xsl:text>pt;mso-text-raise:-</xsl:text>
                                <xsl:value-of select="number(substring-after($val, '-')) div 2"/>
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
                        <xsl:if
                          test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:position">
                          <xsl:text>; </xsl:text>
                        </xsl:if>
                        <xsl:if
                          test="not(w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:position)">
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
                                <xsl:value-of
                                  select="replace(child::w:rPr/w:rStyle/@w:val, '^([0-9]+)', '')"/>
                              </xsl:attribute>
                              <!-- <xsl:attribute name="data-name">
                                  <xsl:value-of select="child::w:rPr/w:rStyle/@w:val"/>
                                </xsl:attribute>-->
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
                          <xsl:when
                            test="w:rPr/w:smallCaps[not(@w:val = '0')] | w:rPr/w:caps[not(@w:val = '0')]">
                            <!--<xsl:value-of select="upper-case(.)"/>-->
                            <xsl:apply-templates/>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:apply-templates/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </xsl:otherwise>
                    </xsl:choose>

                    <xsl:if
                      test="w:rPr/w:rFonts | w:rPr/w:szCs | w:rPr/w:sz | w:rPr/w:position | w:rPr/w:color | w:rPr/w:smallCaps[not(@w:val = '0')]">
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
                      <xsl:attribute name="class" select="replace($charStyle, '^([0-9]+)', '')"/>
                      <!--                        <xsl:attribute name="data-name" select="$charStyleName"/>-->
                      <xsl:apply-templates/>
                    </xsl:element>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
<!--07/12/2020 commented by prakash s for R&L (mannen) unwanted web link    -->
      <!-- <xsl:when test="$charStyle = 'Hyperlink'">
        <xsl:variable name="c">
          <xsl:apply-templates/>
        </xsl:variable>
        <xsl:choose>
          <xsl:when test="starts-with($c, 'http:')">
            <xsl:element name="a">
              <xsl:attribute name="href">
                <xsl:apply-templates/>
              </xsl:attribute>
              <xsl:apply-templates/>
            </xsl:element>
          </xsl:when>
          <xsl:when test="starts-with($c, 'https:')">
            <xsl:element name="a">
              <xsl:attribute name="href">
                <xsl:apply-templates/>
              </xsl:attribute>
              <xsl:apply-templates/>
            </xsl:element>
          </xsl:when>
          <xsl:otherwise>
            <xsl:element name="a">
              <xsl:attribute name="href">
                <xsl:text>http://</xsl:text>
                <xsl:apply-templates/>
              </xsl:attribute>
              <xsl:apply-templates/>
            </xsl:element>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>-->
      <xsl:when
        test="w:rPr/w:b | w:rPr/w:rFonts | w:rPr/w:sz | w:rPr/w:color | w:rPr/w:position | w:rPr/w:smallCaps | w:rPr/w:u | w:rPr/w:strike | w:rPr/w:caps | w:rPr/w:dstrike | w:rPr/w:vertAlign | w:rPr/w:highlight">
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


        <!-- Group SPAN tag -->
        <xsl:if
          test="w:rPr/w:rFonts | w:rPr/w:szCs | w:rPr/w:sz | w:rPr/w:color | w:rPr/w:position | w:u | w:rPr/w:smallCaps | w:rPr/w:highlight | w:rPr/w:b[@w:val = '0'] | w:rPr/w:i[@w:val = '0'] | w:rPr/w:caps[@w:val = '0']">
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
                <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:ascii"
                />
              </xsl:when>
              <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia">
                <xsl:value-of
                  select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"/>
              </xsl:when>
              <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia">
                <xsl:value-of
                  select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of
                  select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"/>
              </xsl:otherwise>
            </xsl:choose>
            <!--<xsl:value-of select="w:rPr/w:rFonts/@w:cs"/>-->
            <xsl:text/>
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
            <!--<xsl:value-of select="round(((w:rPr/w:szCs/@w:val) div 2) + ((w:rPr/w:szCs/@w:val div 2 * 10) div 100))"/>
            <xsl:text>pt"</xsl:text>-->
            <xsl:variable name="fontSize">
              <xsl:value-of select="round(((w:rPr/w:szCs/@w:val) div 2) + ((w:rPr/w:szCs/@w:val div 2 * 10) div 100))"/>
            </xsl:variable>
            <xsl:call-template name="fontSize-Convert-pt-to-percentage">
              <xsl:with-param name="fontSize" select="$fontSize"/>
            </xsl:call-template>
            <xsl:text>%"</xsl:text>
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
          <!--  <xsl:value-of select="round(((w:rPr/w:sz/@w:val) div 2) + ((w:rPr/w:sz/@w:val div 2 * 10) div 100))"/>
            <xsl:text>pt</xsl:text>-->
            <xsl:variable name="fontSize">
              <xsl:value-of select="round(((w:rPr/w:sz/@w:val) div 2) + ((w:rPr/w:sz/@w:val div 2 * 10) div 100))"/>
            </xsl:variable>
            <xsl:call-template name="fontSize-Convert-pt-to-percentage">
              <xsl:with-param name="fontSize" select="$fontSize"/>
            </xsl:call-template>
            <xsl:text>%</xsl:text>
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
            <xsl:text/>
          </xsl:if>
          <!-- END of COLOR -->
          <!-- HIGHLIGHT -->
          <xsl:if test="w:rPr/w:highlight">
            <xsl:if
              test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:position | w:rPr/w:color">
              <xsl:text>;</xsl:text>
            </xsl:if>
            <xsl:choose>
              <xsl:when
                test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:position | w:rPr/w:color">
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
            <xsl:text/>
          </xsl:if>
          <!-- END of HIGHLIGHT -->
          <!-- position -->
          <xsl:if test="w:rPr/w:position">
            <xsl:if
              test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:highlight">
              <xsl:text>; </xsl:text>
            </xsl:if>
            <xsl:if
              test="not(w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:highlight)">
              <xsl:text> style="</xsl:text>
            </xsl:if>
            <xsl:choose>
              <xsl:when test="child::w:rPr/w:position">
                <xsl:variable name="val" select="child::w:rPr/w:position/@w:val"/>
                <xsl:choose>
                  <xsl:when test="contains($val, '-')">
                    <xsl:text>position:relative;top:</xsl:text>
                    <xsl:value-of select="number(substring-after($val, '-')) div 2"/>
                    <xsl:text>pt;mso-text-raise:-</xsl:text>
                    <xsl:value-of select="number(substring-after($val, '-')) div 2"/>
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
            <xsl:if
              test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:position | w:rPr/w:highlight">
              <xsl:text>; </xsl:text>
            </xsl:if>
            <xsl:if
              test="not(w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:position | w:rPr/w:highlight)">
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
            <xsl:if
              test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:position | w:rPr/w:highlight | w:rPr/w:smallCaps">
              <xsl:text>; </xsl:text>
            </xsl:if>
            <xsl:if
              test="not(w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:position | w:rPr/w:highlight | w:rPr/w:smallCaps)">
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
          <xsl:if test="w:rPr/w:caps[@w:val = '0']">
            <xsl:if
              test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:position | w:rPr/w:highlight | w:rPr/w:smallCaps | (w:rPr/w:b[@w:val = '0']) | (w:rPr/w:i[@w:val = '0'])">
              <xsl:text>; </xsl:text>
            </xsl:if>
            <xsl:if
              test="not(w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:position | w:rPr/w:highlight | w:rPr/w:smallCaps | (w:rPr/w:b[@w:val = '0']) | (w:rPr/w:i[@w:val = '0']))">
              <xsl:text> style="</xsl:text>
            </xsl:if>
            <xsl:choose>
              <xsl:when test="w:rPr/w:caps[@w:val = '0']">
                <xsl:text>text-transform: none;font-variant: none;</xsl:text>
              </xsl:when>
              <xsl:otherwise/>
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
                  <xsl:when
                    test="w:rPr/w:smallCaps[not(@w:val = '0')] | w:rPr/w:caps[not(@w:val = '0')]">
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
              <xsl:when
                test="w:rPr/w:smallCaps[not(@w:val = '0')] | w:rPr/w:caps[not(@w:val = '0')]">
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


        <xsl:if
          test="
            w:rPr/w:rFonts | w:rPr/w:szCs | w:rPr/w:sz | w:rPr/w:position | w:rPr/w:color | w:rPr/w:smallCaps[not(@w:val = '0')] | w:rPr/w:highlight
            | w:rPr/w:b[@w:val = '0'] | w:rPr/w:i[@w:val = '0'] | w:rPr/w:caps[@w:val = '0']">
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
      <xsl:when
        test="w:rPr/w:i | w:rPr/w:rFonts | w:rPr/w:sz | w:rPr/w:color | w:rPr/w:position | w:rPr/w:smallCaps | w:rPr/w:u | w:rPr/w:strike | w:rPr/w:caps | w:rPr/w:dstrike | w:rPr/w:vertAlign">
        <xsl:if test="w:rPr/w:rPrChange">
          <xsl:text disable-output-escaping="yes">&lt;span style="font-style:normal !msorm'"&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:vertAlign[@w:val = 'superscript']">
          <xsl:text disable-output-escaping="yes">&lt;sup&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="w:rPr/w:vertAlign[@w:val = 'subscript']">
          <xsl:text disable-output-escaping="yes">&lt;sub&gt;</xsl:text>
        </xsl:if>
        <xsl:if
          test="w:rPr/w:i and (not(w:rPr/w:i/@w:val = 'false') and not(w:rPr/w:i/@w:val = '0'))">
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
        <xsl:if
          test="w:rPr/w:rFonts | w:rPr/w:szCs | w:rPr/w:sz | w:rPr/w:color | w:rPr/w:position | w:u | w:rPr/w:smallCaps">
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
                <xsl:value-of select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:ascii"
                />
              </xsl:when>
              <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia">
                <xsl:value-of
                  select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"/>
              </xsl:when>
              <xsl:when test="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia">
                <xsl:value-of
                  select="//w:styles/w:docDefaults/w:rPrDefault/w:rPr/w:rFonts/@w:eastAsia"/>
              </xsl:when>
              <xsl:otherwise>
                <!--<xsl:value-of select="w:rPr/w:rFonts/@w:asciiTheme"/>-->
              </xsl:otherwise>
            </xsl:choose>
            <!--<xsl:value-of select="w:rPr/w:rFonts/@w:cs"/>-->
            <xsl:text/>
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
            <!--<xsl:value-of select="(w:rPr/w:szCs/@w:val) div 2"/>
            <xsl:text>pt</xsl:text>-->
            <xsl:variable name="fontSize">
              <xsl:value-of select="(w:rPr/w:szCs/@w:val) div 2"/>
            </xsl:variable>
            <xsl:call-template name="fontSize-Convert-pt-to-percentage">
              <xsl:with-param name="fontSize" select="$fontSize"/>
            </xsl:call-template>
            <xsl:text>%</xsl:text>
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
            <!--<xsl:value-of select="(w:rPr/w:sz/@w:val) div 2"/>
            <xsl:text>pt'</xsl:text>-->
            <xsl:variable name="fontSize">
              <xsl:value-of select="(w:rPr/w:sz/@w:val) div 2"/>
            </xsl:variable>
            <xsl:call-template name="fontSize-Convert-pt-to-percentage">
              <xsl:with-param name="fontSize" select="$fontSize"/>
            </xsl:call-template>
            <xsl:text>%'</xsl:text>
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
                <xsl:value-of select="$color"/>
              </xsl:otherwise>
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
                    <xsl:value-of select="number(substring-after($val, '-')) div 2"/>
                    <xsl:text>pt;mso-text-raise:-</xsl:text>
                    <xsl:value-of select="number(substring-after($val, '-')) div 2"/>
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
            <xsl:if
              test="w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:position">
              <xsl:text>; </xsl:text>
            </xsl:if>
            <xsl:if
              test="not(w:rPr/w:sz | w:rPr/w:szCs | w:rPr/w:rFonts | w:rPr/w:color | w:rPr/w:position)">
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
                    <xsl:value-of select="replace(child::w:rPr/w:rStyle/@w:val, '^([0-9]+)', '')"/>
                  </xsl:attribute>
                  <!--<xsl:attribute name="data-name">
                    <xsl:value-of select="child::w:rPr/w:rStyle/@w:val"/>
                  </xsl:attribute>-->
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
              <xsl:when
                test="w:rPr/w:smallCaps[not(@w:val = '0')] | w:rPr/w:caps[not(@w:val = '0')]">
                <!--<xsl:value-of select="upper-case(.)"/>-->
                <xsl:apply-templates/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:apply-templates/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:otherwise>
        </xsl:choose>

        <xsl:if
          test="w:rPr/w:rFonts | w:rPr/w:szCs | w:rPr/w:sz | w:rPr/w:position | w:rPr/w:color | w:rPr/w:smallCaps[not(@w:val = '0')]">
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
        <xsl:if
          test="w:rPr/w:i and (not(w:rPr/w:i/@w:val = 'false') and not(w:rPr/w:i/@w:val = '0'))">
          <xsl:text disable-output-escaping="yes">&lt;/i&gt;</xsl:text>
        </xsl:if>
        <xsl:if
          test="w:rPr/w:b and (not(w:rPr/w:b/@w:val = 'false') and not(w:rPr/w:b/@w:val = '0'))">
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
          <xsl:attribute name="style" select="concat('color:#', $color)"/>
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
  
    <xsl:variable name="chNo">
      <xsl:choose>
        <xsl:when test="descendant::w:sdt[w:sdtPr/w:alias[@w:val = 'ChapNo']]">
          <xsl:value-of select="replace(normalize-space(descendant::w:sdt[w:sdtPr/w:alias[@w:val = 'ChapNo']][1]),' ','')"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:variable name="val">
            <xsl:value-of select="ancestor::document/descendant::h2[@class = 'ChapterNumber']"/>
          </xsl:variable>
          <xsl:value-of select="translate(substring-after(lower-case($val),'chapter'),$allSpaceCharacterEntity,'')"/>
        </xsl:otherwise>
      </xsl:choose>     
    </xsl:variable>
   
    <xsl:variable name="finalChNo">
      <xsl:choose>
        <xsl:when test="string-length($chNo) &gt; 1">
          <xsl:choose>
            <xsl:when test="matches(translate($chNo,$allSpaceCharacterEntity,''),'^([0-9]+)([“”,;:-&#x268A;&#x2212;&#x2013;&#x2014;ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz])')">
              <xsl:analyze-string select="translate($chNo,$allSpaceCharacterEntity,'')" regex="^([0-9]+)([“”,;:-&#x268A;&#x2212;&#x2013;&#x2014;ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz])">
                <xsl:matching-substring>
                  <xsl:value-of select="regex-group(1)"/>
                </xsl:matching-substring>
              </xsl:analyze-string>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$chNo"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
		   <xsl:otherwise>
          <xsl:value-of select="$chNo"/>
        </xsl:otherwise>	   
      </xsl:choose>
    </xsl:variable>
    
    <xsl:variable name="seqNo">     
      <xsl:if test="descendant::w:sdt[w:sdtPr/w:alias[@w:val = 'SeqNo']]">
        <xsl:value-of select="replace(normalize-space(descendant::w:sdt[w:sdtPr/w:alias[@w:val = 'SeqNo']][1]),' ','')"/>
      </xsl:if> 
    </xsl:variable>
    
    <xsl:variable name="finalSeqNo">
      <xsl:choose>
        <xsl:when test="string-length($seqNo) &gt; 1">          
          <xsl:choose>
            <xsl:when test="matches(translate($seqNo,$allSpaceCharacterEntity,''),'^([0-9]+)([“”,;:-&#x268A;&#x2212;&#x2013;&#x2014;ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz])')">
              <xsl:analyze-string select="translate($seqNo,$allSpaceCharacterEntity,'')" regex="^([0-9]+)([“”,;:-&#x268A;&#x2212;&#x2013;&#x2014;ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz])">
                <xsl:matching-substring>
                     <xsl:value-of select="regex-group(1)"/>
                </xsl:matching-substring>
              </xsl:analyze-string>
            </xsl:when>  
            <xsl:otherwise>
              <xsl:value-of select="$seqNo"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$seqNo"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
       
    <xsl:variable name="bkChapterName">
      <xsl:for-each select="$bkBinder/root/Chapter">
         <xsl:choose>
           <xsl:when test="string-length(child::ChapterNumber) &gt; 0">
            <xsl:variable name="bkChNumber">
              <xsl:variable name="val">
                <xsl:value-of select="substring-after(lower-case(child::ChapterNumber),'chapter')"/>
              </xsl:variable>
              <xsl:variable name="numberStringToIntegerNumber">
                <xsl:call-template name="Convert-stringNumber-to-IntegerNumber">
                  <xsl:with-param name="value" select="translate($val,$allSpaceCharacterEntity,'')"/>
                </xsl:call-template>
              </xsl:variable>
              <xsl:value-of select="translate($numberStringToIntegerNumber, $basicCharacterEntity, '')"/>
            </xsl:variable>           
            <xsl:if test="$bkChNumber = $finalChNo">
                <xsl:choose>
                  <xsl:when test="matches(descendant::ChapterName[1],' ')">
                    <xsl:value-of select="replace(descendant::ChapterName[1],' ','_')"/> 
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="descendant::ChapterName[1]"/>
                  </xsl:otherwise>
                </xsl:choose>
           </xsl:if>
           </xsl:when>
         </xsl:choose>
      </xsl:for-each>    
    </xsl:variable>
      
    <xsl:variable name="bk_id_Value">
      <xsl:variable name="tocChNoText"/>
      <xsl:variable name="bkMapData"/>
      <xsl:variable name="idmlData" select="replace(lower-case($finalChNo), $allSpaceCharacterEntity, '')"/>
      <xsl:for-each select="$json/root/Chapter">
        <xsl:variable name="tocChNoText"
          select="normalize-space(lower-case(child::ChapterNumber[1]))"/>
        <xsl:variable name="bkMapData">
          <xsl:choose>
            <xsl:when test="matches(lower-case($tocChNoText), 'chapters')">
              <xsl:value-of
                select="substring-after(lower-case(translate($tocChNoText, $allSpaceCharacterEntity, '')), 'chapters')"
              />
            </xsl:when>
            <xsl:when test="matches(lower-case($tocChNoText), 'chapter')">
              <xsl:value-of
                select="substring-after(lower-case(translate($tocChNoText, $allSpaceCharacterEntity, '')), 'chapter')"
              />
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of
                select="translate($tocChNoText, $allSpaceCharacterEntity, '')"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <xsl:variable name="numberStringToIntegerNumber">
          <xsl:call-template name="Convert-stringNumber-to-IntegerNumber">
            <xsl:with-param name="value" select="$bkMapData"/>
          </xsl:call-template>
        </xsl:variable>
        <xsl:choose>
          <xsl:when test="string-length($numberStringToIntegerNumber) &gt; 0">
            <xsl:if
              test="$numberStringToIntegerNumber = $idmlData and string-length($bkMapData) &gt; 0">
              <xsl:value-of
                select="translate(lower-case(child::SerialNo), $basicCharacterEntity, '')"
              />
            </xsl:if>
          </xsl:when>
          <xsl:otherwise>
            <xsl:if
              test="$bkMapData = $idmlData and string-length($bkMapData) &gt; 0">
              <xsl:value-of
                select="translate(lower-case(child::SerialNo), $basicCharacterEntity, '')"
              />
            </xsl:if>
          </xsl:otherwise>
        </xsl:choose>
        
      </xsl:for-each>
    </xsl:variable>  
      
    <xsl:variable name="alias" select="child::w:sdtPr/w:alias/@w:val"/>
    <xsl:variable name="tag" select="child::w:sdtPr/w:tag/@w:val"/>
    <xsl:variable name="id" select="child::w:sdtPr/w:id/@w:val"/>
    <xsl:variable name="PN">
      <xsl:choose>
        <xsl:when test="not(descendant::HyperlinkTextSource[1]/@bkmark)">
          <xsl:value-of select="@w:rsidR"/>
        </xsl:when>
        <xsl:when test="not(descendant::HyperlinkTextDestination[1]/@bkmark)">
          <xsl:value-of select="@w:rsidR"/>
        </xsl:when>
		 <!-- Added sorting issue by HyperlinkTextSourceon 10-1-2022 -->
        <xsl:when test="descendant::HyperlinkTextSource[contains(lower-case(@HyperlinkUDestination),'_story_')][1]/@HyperlinkUDestination">
          <xsl:value-of select="descendant::HyperlinkTextSource[contains(lower-case(@HyperlinkUDestination),'_story_')][1]/@HyperlinkUDestination"/>
        </xsl:when>
        <xsl:when test="descendant::HyperlinkTextDestination[contains(lower-case(@BookMarkDestination),'_story_')][1]/@BookMarkDestination">
          <xsl:value-of select="descendant::HyperlinkTextDestination[contains(lower-case(@BookMarkDestination),'_story_')][1]/@BookMarkDestination"/>
        </xsl:when>
      </xsl:choose>
    </xsl:variable>
    
    <xsl:choose>
      <xsl:when test="matches($xxx, 'SeqNo')">
        <xsl:element name="span">
          <xsl:if test="string-length($PN) &gt; 0">
            <xsl:attribute name="w:rsidR" select="$PN"/>
          </xsl:if>
          <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
      </xsl:when>
      <xsl:when test="matches($xxx, '^TableRef$')">
        <xsl:element name="a">
          <xsl:if test="string-length($PN) &gt; 0">
            <xsl:attribute name="w:rsidR" select="$PN"/>
          </xsl:if>
        <!--  <xsl:attribute name="href">
            <xsl:value-of select="concat(replace($filename1,' ','_'), '.xhtml#t')"/>
            <xsl:value-of select="normalize-space(translate($seqNo, ' .,;:ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-–)(', ''))"/>
          </xsl:attribute> --> 
          <xsl:attribute name="href">
            <xsl:value-of
              select="concat($filename1,'.xhtml#',concat('c',normalize-space(translate(translate(translate($finalChNo,$basicCharacterEntity,''),$allSpaceCharacterEntity,''),'.“”,;:ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-–)(',''))),concat('t',normalize-space(translate(translate(translate($finalSeqNo,$allSpaceCharacterEntity,''),$basicCharacterEntity,''),'.“”,;:ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-–)(',
              ''))))"/>
          </xsl:attribute>
          <xsl:element name="span">
            <xsl:attribute name="class" select="'TableCitation'"/>
            <xsl:apply-templates/>
          </xsl:element>
        </xsl:element>
      </xsl:when>
      <xsl:when test="matches($xxx, '^FigureRef$')">       
        <xsl:element name="a">
          <xsl:if test="string-length($PN) &gt; 0">
            <xsl:attribute name="w:rsidR" select="$PN"/>
          </xsl:if>
          <!-- <xsl:attribute name="href">
           <xsl:value-of select="concat(replace($filename1,' ','_'), '.xhtml#f')"/>
            <xsl:value-of select="normalize-space(translate($seqNo, ' .,;:ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-–)(', ''))"/>-->
            <xsl:attribute name="href">
              <xsl:value-of
                select="concat($filename1,'.xhtml#',concat('c',normalize-space(translate(translate(translate($finalChNo,$basicCharacterEntity,''),$allSpaceCharacterEntity,''),'.“”,;:ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-–)(',''))),concat('f',normalize-space(translate(translate(translate($finalSeqNo,$allSpaceCharacterEntity,''),$basicCharacterEntity,''),'.“”,;:ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-–)(',
                ''))))"/>
          </xsl:attribute>
          <xsl:element name="span">
            <xsl:attribute name="class" select="'FigureCitation'"/>
            <xsl:apply-templates/>
          </xsl:element>
        </xsl:element>
      </xsl:when>
      <xsl:when test="matches($xxx, '^MapRef$')">
        <xsl:variable name="mapSeq">
          <xsl:value-of select="descendant::w:sdt[w:sdtPr/w:alias[@w:val = 'SeqNo']][1]"/>
        </xsl:variable>
        <xsl:element name="a">
          <xsl:if test="string-length($PN) &gt; 0">
            <xsl:attribute name="w:rsidR" select="$PN"/>
          </xsl:if>
       <!--   <xsl:attribute name="href">           
            <xsl:value-of select="concat(replace($filename1,' ','_'), '.xhtml#m')"/>
            <xsl:value-of select="normalize-space(translate($seqNo, ' .,;:ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-–)(', ''))"/>
          </xsl:attribute>-->
          <xsl:attribute name="href">
            <xsl:value-of
              select="concat($filename1,'.xhtml#',concat('c',normalize-space(translate(translate(translate($finalChNo,$basicCharacterEntity,''),$allSpaceCharacterEntity,''),'.“”,;:ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-–)(',''))),concat('m',normalize-space(translate(translate(translate($finalSeqNo,$allSpaceCharacterEntity,''),$basicCharacterEntity,''),'.“”,;:ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-–)(',
              ''))))"/>
          </xsl:attribute>
          <xsl:element name="span">
            <xsl:attribute name="class" select="'MapCitation'"/>
            <xsl:apply-templates/>
          </xsl:element>
        </xsl:element>
      </xsl:when>
      <xsl:when test="matches($xxx, '^BibCitation$')">
        <xsl:element name="span">
          <xsl:if test="string-length($PN) &gt; 0">
            <xsl:attribute name="w:rsidR" select="$PN"/>
          </xsl:if>
          <!--<xsl:attribute name="style" select="'background: #eeeeee; border: 1px solid #cccccc;  padding: 0px 0px;'"/>-->
          <xsl:attribute name="class" select="'contentcontrol'"/>
          <!--          <xsl:attribute name="data-alias" select="$alias"/>-->
          <xsl:apply-templates/>
        </xsl:element>
      </xsl:when>
      <xsl:when test="matches($xxx, 'TableCaption')">
        <xsl:element name="span">
          <xsl:if test="string-length($PN) &gt; 0">
            <xsl:attribute name="w:rsidR" select="$PN"/>
          </xsl:if>
          <xsl:attribute name="class" select="'captionTable'"/>                    
          <xsl:if test="string-length($seqNo) > 0">            
              <xsl:attribute name="id">
                <xsl:value-of select="concat('c',normalize-space(translate(translate(translate($finalChNo,$basicCharacterEntity,''),$allSpaceCharacterEntity,''),' .“”,;:ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-–)(','')),'t',normalize-space(translate(translate(translate($finalSeqNo,$allSpaceCharacterEntity,''),$basicCharacterEntity,''),
                  ' .“”,;:ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-–)(', '')))"/>
              </xsl:attribute>            
          </xsl:if>
          <xsl:apply-templates/>
        </xsl:element>
      </xsl:when>
      <xsl:when test="matches($xxx, 'FigureCaption')">       
        <xsl:element name="span">
          <xsl:if test="string-length($PN) &gt; 0">
            <xsl:attribute name="w:rsidR" select="$PN"/>
          </xsl:if>     
          <xsl:attribute name="class" select="'captionfig'"/>     
          
          <xsl:if test="string-length($seqNo) > 0">
            <xsl:attribute name="id">
              <xsl:value-of
                select="concat('c',normalize-space(translate(translate(translate($finalChNo,$basicCharacterEntity,''),$allSpaceCharacterEntity,''),' .“”,;:ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-–)(','')),'f',normalize-space(translate(translate(translate($finalSeqNo,$allSpaceCharacterEntity,''),$basicCharacterEntity,''),
                ' .“”,;:ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-–)(', '')))"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:apply-templates/>
        </xsl:element>
      </xsl:when>
      <xsl:when test="matches($xxx, 'MapCaption')">
        <xsl:element name="span">
          <xsl:if test="string-length($PN) &gt; 0">
            <xsl:attribute name="w:rsidR" select="$PN"/>
          </xsl:if>
          <xsl:attribute name="class" select="'captionfig'"/>          
          <xsl:if test="string-length($chNo) > 0">           
              <xsl:attribute name="id">
                <xsl:value-of
                  select="concat('c',normalize-space(translate(translate(translate($finalChNo,$basicCharacterEntity,''),$allSpaceCharacterEntity,''),' .,“”;:ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-–)(','')),'m',normalize-space(translate(translate(translate($finalSeqNo,$allSpaceCharacterEntity,''),$basicCharacterEntity,''),
                  ' .“”,;:ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-–)(', '')))"/>
              </xsl:attribute>            
          </xsl:if>
          <xsl:apply-templates/>
        </xsl:element>
      </xsl:when>
      <xsl:when test="matches($xxx, 'Figure Caption')">
        <xsl:element name="span">
          <xsl:if test="string-length($PN) &gt; 0">
            <xsl:attribute name="w:rsidR" select="$PN"/>
          </xsl:if>
          <xsl:attribute name="class" select="'captionfig'"/>
          <xsl:if test="string-length($chNo) > 0">          
              <xsl:attribute name="id">
                <xsl:value-of
                  select="concat('c',normalize-space(translate(translate(translate($finalChNo,$basicCharacterEntity,''),$allSpaceCharacterEntity,''),' .“”,;:ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-–)(','')),'f',normalize-space(translate(translate(translate($finalSeqNo,$allSpaceCharacterEntity,''),$basicCharacterEntity,''),
                  ' .“”,;:ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-–)(', '')))"/>
              </xsl:attribute>            
          </xsl:if>
          <xsl:apply-templates/>
        </xsl:element>
      </xsl:when>
      <xsl:when test="matches($xxx, 'BOX')">
        <xsl:element name="span">
          <xsl:copy-of select="@*"/>
          <xsl:attribute name="class" select="'Box'"/>
          <xsl:if test="string-length($chNo) > 0">         
              <xsl:attribute name="id">
                <xsl:value-of
                  select="concat('c',normalize-space(translate(translate(translate($finalChNo,$basicCharacterEntity,''),$allSpaceCharacterEntity,''),' .“”,;:ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-–)(','')),'b',normalize-space(translate(translate(translate($finalSeqNo,$allSpaceCharacterEntity,''),$basicCharacterEntity,''),
                  ' .“”,;:ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-–)(', '')))"/>
              </xsl:attribute>            
          </xsl:if>
          <xsl:apply-templates/>
        </xsl:element>
      </xsl:when>
      <xsl:when test="contains($xxx, 'FE')">
        <xsl:element name="span">
          <xsl:if test="string-length($PN) &gt; 0">
            <xsl:attribute name="w:rsidR" select="$PN"/>
          </xsl:if>
          <xsl:attribute name="class" select="'FE'"/>
          <xsl:copy-of select="@txtFrameId"/>
          <xsl:apply-templates select="w:sdtContent"/>
        </xsl:element>
      </xsl:when>
      <!-- unnumbered reference citations -->
<!-- 26-07-2022 commented by prakash for unwanted links -->
      <!-- <xsl:when test="matches($xxx, 'CiteTag')">
        <xsl:element name="a">
          <xsl:if test="string-length($PN) &gt; 0">
            <xsl:attribute name="w:rsidR" select="$PN"/>
          </xsl:if>        
          <xsl:attribute name="href">        
            <xsl:value-of select="concat(replace($filename1,' ','_'), '.xhtml#Reference')"/>
            <xsl:value-of select="translate($ccName, ' .,;:ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-–', '')"/>
          </xsl:attribute>          
          <xsl:element name="span">
            <xsl:attribute name="id" select="$ccName"/>
            <xsl:attribute name="class" select="$ccName"/>
            <xsl:apply-templates/>
          </xsl:element>
        </xsl:element>
      </xsl:when>-->
      <!--<xsl:when test="matches($xxx, 'CaseStudy')">
        <!-\-<xsl:variable name="PN">
          <xsl:choose>
            <xsl:when test="descendant::HyperlinkTextSource[1]/@HyperlinkUDestination">
              <xsl:value-of select="descendant::HyperlinkTextSource[1]/@HyperlinkUDestination"/>
            </xsl:when>
            <xsl:when test="descendant::HyperlinkTextDestination[1]/@BookMarkDestination">
              <xsl:value-of select="descendant::HyperlinkTextDestination[1]/@BookMarkDestination"/>
            </xsl:when>
          </xsl:choose>
        </xsl:variable>-\->
        <!-\-<xsl:text>&#x000A;</xsl:text>-\->
        <xsl:element name="div">
          <xsl:copy-of select="@*"/>
          <!-\-          <xsl:attribute name="data-alias" select="$alias"/>-\->
          <xsl:attribute name="class" select="'CaseStydy'"/>
          <xsl:copy-of select="@txtFrameId"/>
          <xsl:variable name="idval"
            select="child::w:sdtContent/w:p/w:sdt[w:sdtPr/w:alias/@w:val = 'SeqNo']/w:sdtContent/w:r/w:t[1]"/>

          <xsl:if test="string-length($figSeq) > 0">
            <xsl:attribute name="id">
              <xsl:text>Cs</xsl:text>
              <xsl:value-of select="translate($figSeq, '  ', '')"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:apply-templates/>
        </xsl:element>
      </xsl:when>-->
      <!--<xsl:when test="matches($xxx, 'LearningObjectives')">     
        <xsl:element name="div">
          <xsl:copy-of select="@*"/>         
          <xsl:attribute name="class" select="'LearningObjectives'"/>
          <xsl:variable name="idval"
            select="child::w:sdtContent/w:p/w:sdt[w:sdtPr/w:alias/@w:val = 'SeqNo']/w:sdtContent/w:r/w:t[1]"/>

          <xsl:if test="string-length($figSeq) > 0">
            <xsl:attribute name="id">
              <xsl:text>lObj</xsl:text>
              <xsl:value-of select="translate($figSeq, '  ', '')"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:apply-templates/>
        </xsl:element>
      </xsl:when>-->
      <xsl:when test="matches($xxx, 'ExternalFigureRef')">
        <xsl:element name="a">
          <xsl:attribute name="href">
            <xsl:value-of
              select="concat('../xhtml/',$bkChapterName,'.xhtml#',concat('c',normalize-space(translate(translate(translate($finalChNo,$basicCharacterEntity,''),$allSpaceCharacterEntity,''),'.“”,;:ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-–)(',''))),concat('f',normalize-space(translate(translate(translate($finalSeqNo,$allSpaceCharacterEntity,''),$basicCharacterEntity,''),'.“”,;:ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-–)(',
              ''))))"/>
          </xsl:attribute>          
            <xsl:apply-templates/>         
        </xsl:element>
      </xsl:when>
      <xsl:when test="matches($xxx, 'ExternalTableRef')">
        <xsl:element name="a">
          <xsl:attribute name="href">
            <xsl:value-of
              select="concat('../xhtml/',$bkChapterName,'.xhtml#',concat('c',normalize-space(translate(translate(translate($finalChNo,$basicCharacterEntity,''),$allSpaceCharacterEntity,''),'.“”,;:ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-–)(',''))),concat('t',normalize-space(translate(translate(translate($finalSeqNo,$allSpaceCharacterEntity,''),$basicCharacterEntity,''),'.“”,;:ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-–)(',
              ''))))"/>
          </xsl:attribute>
            <xsl:apply-templates/>       
        </xsl:element>
      </xsl:when>
      <xsl:when test="matches($xxx, 'ExternalChapterRef')">
        <xsl:element name="a">
          <xsl:attribute name="href">             
            <xsl:value-of
              select="concat('../xhtml/',$bkChapterName,'.xhtml#CN',$bk_id_Value)"/>
          </xsl:attribute>
            <xsl:apply-templates/>        
        </xsl:element>
      </xsl:when>
      <xsl:when test="matches($xxx, 'ExternalBoxRef')">
        <xsl:element name="a">
          <xsl:attribute name="href">
            <xsl:value-of
              select="concat('../xhtml/',$bkChapterName,'.xhtml#',concat('c',normalize-space(translate(translate(translate($finalChNo,$basicCharacterEntity,''),$allSpaceCharacterEntity,''),'.“”,;:ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-–)(',''))),concat('b',normalize-space(translate(translate(translate($finalSeqNo,$allSpaceCharacterEntity,''),$basicCharacterEntity,''),'.“”,;:ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-–)(',
              ''))))"/>
          </xsl:attribute>
            <xsl:apply-templates/>        
        </xsl:element>
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="descendant::w:sdt[w:sdtPr/w:alias[@w:val = 'TableCaption']]">
            <xsl:variable name="PN">
              <xsl:choose>
                <xsl:when test="not(descendant::HyperlinkTextSource[1]/@bkmark)">
                  <xsl:value-of select="@w:rsidR"/>
                </xsl:when>
                <xsl:when test="not(descendant::HyperlinkTextDestination[1]/@bkmark)">
                  <xsl:value-of select="@w:rsidR"/>
                </xsl:when>
                <xsl:when test="descendant::HyperlinkTextSource[contains(local-name(@HyperlinkUDestination),'_story_')][1]/@HyperlinkUDestination">
                  <xsl:value-of select="descendant::HyperlinkTextSource[contains(local-name(@HyperlinkUDestination),'_story_')][1]/@HyperlinkUDestination"/>
                </xsl:when>
                <xsl:when test="descendant::HyperlinkTextDestination[contains(local-name(@BookMarkDestination),'_story_')][1]/@BookMarkDestination">
                  <xsl:value-of
                    select="descendant::HyperlinkTextDestination[contains(local-name(@BookMarkDestination),'_story_')][1]/@BookMarkDestination"/>
                </xsl:when>
              </xsl:choose>
            </xsl:variable>
            <!--<xsl:text>&#x000A;</xsl:text>-->
            <xsl:element name="span">
              <xsl:if test="string-length($PN) &gt; 0">
                <xsl:attribute name="w:rsidR" select="$PN"/>
              </xsl:if>
              <xsl:copy-of select="@txtFrameId"/>
              <!-- commented due to elsevier demo and used the below one line 14-nov-16 -->
              <xsl:variable name="idval" select="descendant::w:sdtContent/w:p/w:sdt[w:sdtPr/w:alias/@w:val = 'SeqNo']/w:sdtContent/w:r/w:t[1]"/>
              <xsl:if test="string-length($idval) &gt; 0">               
                  <xsl:attribute name="id">
                    <xsl:value-of
                      select="concat('c',normalize-space(translate(translate(translate($finalChNo,$basicCharacterEntity,''),$allSpaceCharacterEntity,''),' .“”,;:ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-–)(','')),'t',normalize-space(translate(translate(translate($finalSeqNo,$allSpaceCharacterEntity,''),$basicCharacterEntity,''),
                      ' .“”,;:ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-–)(', '')))"/>
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
                <xsl:when test="not(descendant::HyperlinkTextDestination[1]/@bkmark)">
                  <xsl:value-of select="@w:rsidR"/>
                </xsl:when>
				<!-- Added sorting issue by HyperlinkTextSourceon 10-1-2022 -->
                <xsl:when test="descendant::HyperlinkTextSource[contains(lower-case(@HyperlinkUDestination),'_story_')][1]/@HyperlinkUDestination">
                  <xsl:value-of select="descendant::HyperlinkTextSource[contains(lower-case(@HyperlinkUDestination),'_story_')][1]/@HyperlinkUDestination"/>
                </xsl:when>
                <xsl:when test="descendant::HyperlinkTextDestination[contains(lower-case(@BookMarkDestination),'_story_')][1]/@BookMarkDestination">
                  <xsl:value-of
                    select="descendant::HyperlinkTextDestination[contains(lower-case(@BookMarkDestination),'_story_')][1]/@BookMarkDestination"/>
                </xsl:when>
              </xsl:choose>
            </xsl:variable>
            <xsl:element name="span">
              <xsl:if test="string-length($PN) &gt; 0">
                <xsl:attribute name="w:rsidR" select="$PN"/>
              </xsl:if>
              <xsl:apply-templates select="@* | node()"/>
            </xsl:element>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
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
          <!--<xsl:attribute name="data-type" select="'textbox'"/>
          <xsl:attribute name="data-id" select="ancestor-or-self::v:shape[1]/@id"/>
          <xsl:attribute name="data-style" select="ancestor-or-self::v:textbox[1]/@style"/>-->
          <!--<xsl:attribute name="style" select="'border:1px solid black;outline: 2px solid #CCC;'"/>-->
          <xsl:attribute name="style">
            <xsl:text>border:1px solid black;outline: 2px solid #CCC;background-color:#</xsl:text>
            <xsl:value-of select="@libraryFillColor"/>
          </xsl:attribute>
          <!--<xsl:text>&#x000A;</xsl:text>-->
          <xsl:element name="p">
            <xsl:attribute name="class" select="$paragraphStyle"/>
            <!--                <xsl:attribute name="data-name" select="$paragraphStyleName"/>-->
            <!-- 19-08-16 Check for w:pPrChange to identify the previous style while track changes is ON -->
            <xsl:choose>
              <xsl:when
                test="child::w:pPr/w:pPrChange | child::w:pPr/w:shd | child::w:pPr/w:jc | child::w:pPr/w:ind">
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
          <!--<xsl:attribute name="data-type" select="'textbox'"/>
          <xsl:attribute name="data-id" select="ancestor-or-self::v:shape[1]/@id"/>
          <xsl:attribute name="data-style" select="ancestor-or-self::v:textbox[1]/@style"/>-->
          <!--<xsl:attribute name="style" select="'border:1px solid black;outline: 2px solid #CCC;'"/>-->
          <xsl:attribute name="style">
            <xsl:text>border:1px solid black;outline: 2px solid #CCC;background-color:#</xsl:text>
            <xsl:value-of select="@libraryFillColor"/>
          </xsl:attribute>
          <!--<xsl:text>&#x000A;</xsl:text>-->
          <xsl:element name="p">
            <xsl:attribute name="class" select="$paragraphStyle"/>
            <!--              <xsl:attribute name="data-name" select="$paragraphStyleName"/>-->
            <!-- 19-08-16 Check for w:pPrChange to identify the previous style while track changes is ON -->
            <xsl:choose>
              <xsl:when
                test="child::w:pPr/w:pPrChange | child::w:pPr/w:shd | child::w:pPr/w:jc | child::w:pPr/w:ind">
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
  <!-- 21/05/2020 added for paragraphStyle choose condition for content controle of xpath-->
  <xsl:template match="v:textbox">
    <!--    <xsl:variable name="paragraphStyle" select="child::w:txbxContent/w:p/w:pPr/w:pStyle/@w:val"/>-->
    <xsl:variable name="paragraphStyle">
      <xsl:choose>
        <xsl:when test="child::w:txbxContent/w:sdt/w:sdtContent/p/@class">
          <xsl:value-of select="child::w:txbxContent/w:sdt/w:sdtContent/p[1]/@class"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="child::w:txbxContent/w:p/w:pPr/w:pStyle/@w:val"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="paragraphStyleName">
      <xsl:value-of select="//w:style[@w:styleId = $paragraphStyle]/w:name/@w:val"/>
    </xsl:variable>
    <xsl:element name="div">
      <!--21/05/2020 -->
      <!--<xsl:attribute name="data-type" select="'textbox'"/>
      <xsl:attribute name="data-id" select="ancestor-or-self::v:shape[1]/@id"/>
      <xsl:attribute name="data-style" select="ancestor-or-self::v:textbox[1]/@style"/>-->
      <xsl:attribute name="style">
        <xsl:text>border:1px solid black;background-color:#</xsl:text>
        <xsl:value-of select="@libraryFillColor"/>
      </xsl:attribute>
      <!-- 09-May-17: Suguna asked to give p tag -->
      <!--<xsl:apply-templates/>-->
      <!--<xsl:text>&#x000A;</xsl:text>-->
      <!-- below  <xsl:element name="p"> commented by prakash s on 16-05-2023 for R&L book of Gubi_ Pastoral and Reflective Supervision of Clergy   -->
     <!-- <xsl:element name="p">
        <xsl:attribute name="class" select="$paragraphStyle"/>
        <!-\-        <xsl:attribute name="data-name" select="$paragraphStyleName"/>-\->
        <!-\- 19-08-16 Check for w:pPrChange to identify the previous style while track changes is ON -\->
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
              <!-\-****** new -\->
              <!-\-<xsl:if test="child::w:pPr/w:ind">
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
              -\->
              <xsl:if test="contains($bulltype, '.%')">
                <xsl:attribute name="type">
                  <xsl:value-of select="$indent"/>
                </xsl:attribute>
              </xsl:if>
              <!-\- new end -\->
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
      </xsl:element>-->
      <xsl:apply-templates/>
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
          <xsl:variable name="three"
            select="//w:abstractNum[@w:abstractNumId = $two]/w:lvl[@w:ilvl = $ilvl]/w:numFmt/@w:val"/>
          <xsl:variable name="bulltype"
            select="//w:abstractNum[@w:abstractNumId = $two]/w:lvl[@w:ilvl = $ilvl]/w:lvlText/@w:val"/>

          <!--<xsl:text>&#x000A;</xsl:text>-->
          <xsl:choose>
            <xsl:when test="$three = 'upperRoman'">
              <xsl:element name="ol">
                <xsl:attribute name="type">
                  <xsl:value-of select="'I'"/>
                </xsl:attribute>
                <xsl:if test="$one = preceding::w:p/w:pPr/w:numPr/w:numId/@w:val">
                  <xsl:attribute name="start">
                    <xsl:number
                      count="w:p[w:pPr/w:numPr/w:numId/@w:val = $one and w:pPr/w:numPr/w:ilvl/@w:val = $ilvl]"
                      level="any"/>
                  </xsl:attribute>
                </xsl:if>
                <xsl:element name="li">
                  <xsl:attribute name="class" select="$paragraphStyle"/>
                  <!--                      <xsl:attribute name="data-name" select="$paragraphStyleName"/>-->
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
                  <!--                      <xsl:attribute name="data-name" select="$paragraphStyleName"/>-->
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
                  <xsl:number count="w:p[w:pPr/w:pStyle[@w:val = $paragraphStyle]]"/>
                </xsl:if>
                <xsl:element name="li">
                  <xsl:attribute name="class" select="$paragraphStyle"/>
                  <!--                      <xsl:attribute name="data-name" select="$paragraphStyleName"/>-->
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
                    <xsl:number count="w:p[w:pPr/w:pStyle[@w:val = $paragraphStyle]]"/>
                  </xsl:attribute>
                </xsl:if>
                <xsl:element name="li">
                  <xsl:attribute name="class" select="$paragraphStyle"/>
                  <!--                      <xsl:attribute name="data-name" select="$paragraphStyleName"/>-->
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
                    <!--                        <xsl:attribute name="data-name" select="$paragraphStyleName"/>-->
                    <!-- 19-08-16 Check for w:pPrChange to identify the previous style while track changes is ON -->
                    <xsl:choose>
                      <xsl:when
                        test="child::w:pPr/w:pPrChange | child::w:pPr/w:shd | child::w:pPr/w:jc | child::w:pPr/w:ind">
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
                              <xsl:with-param name="numId"
                                select="child::w:pPr/w:numPr/w:numId/@w:val"/>
                              <xsl:with-param name="numLevel"
                                select="child::w:pPr/w:numPr/w:ilvl/@w:val"/>
                            </xsl:call-template>
                            <xsl:variable name="numID">
                              <xsl:value-of select="self::w:p/w:pPr/w:numPr/w:numId/@w:val"/>
                            </xsl:variable>
                            <xsl:variable name="ilvl">
                              <xsl:value-of select="self::w:p/w:pPr/w:numPr/w:ilvl/@w:val"/>
                            </xsl:variable>
                            <xsl:number
                              count="w:p[w:pPr/w:numPr/w:numId/@w:val = $numID and w:pPr/w:numPr/w:ilvl/@w:val = $ilvl]"
                              level="any"/>
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
                    <xsl:variable name="x" select="translate($paragraphStyle, '%0123456789', '')"/>
                    <xsl:attribute name="class" select="$paragraphStyle"/>
                    <xsl:if test="$one = preceding::w:p/w:pPr/w:numPr/w:numId/@w:val">
                      <xsl:attribute name="start">
                        <xsl:number
                          count="w:p[w:pPr/w:numPr/w:numId/@w:val = $one and w:pPr/w:numPr/w:ilvl/@w:val = $ilvl]"
                          level="any"/>
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
                      <!--                          <xsl:attribute name="data-name" select="$paragraphStyleName"/>-->
                      <xsl:if test="contains($bulltype, '.%')">
                        <xsl:element name="span">
                          <!--                            <xsl:value-of select="substring-before($bulltype, '%')"/>-->
                          <xsl:call-template name="AutoNumbering">
                            <xsl:with-param name="numId"
                              select="child::w:pPr/w:numPr/w:numId/@w:val"/>
                            <xsl:with-param name="numLevel"
                              select="child::w:pPr/w:numPr/w:ilvl/@w:val"/>
                          </xsl:call-template>
                          <xsl:variable name="numID">
                            <xsl:value-of select="self::w:p/w:pPr/w:numPr/w:numId/@w:val"/>
                          </xsl:variable>
                          <xsl:variable name="ilvl">
                            <xsl:value-of select="self::w:p/w:pPr/w:numPr/w:ilvl/@w:val"/>
                          </xsl:variable>
                          <xsl:number
                            count="w:p[w:pPr/w:numPr/w:numId/@w:val = $numID and w:pPr/w:numPr/w:ilvl/@w:val = $ilvl]"
                            level="any"/>
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
                <!--                    <xsl:attribute name="data-name" select="$paragraphStyleName"/>-->

                <xsl:choose>
                  <xsl:when test="$bulltype = '•'">
                    <xsl:element name="li">
                      <xsl:attribute name="class" select="$paragraphStyle"/>
                      <!--                          <xsl:attribute name="data-name" select="$paragraphStyleName"/>-->
                      <xsl:apply-templates/>
                    </xsl:element>
                  </xsl:when>
                  <xsl:when test="$bulltype = 'o'">
                    <xsl:element name="li">
                      <xsl:attribute name="class" select="$paragraphStyle"/>
                      <!--                          <xsl:attribute name="data-name" select="$paragraphStyleName"/>-->
                      <xsl:apply-templates/>
                    </xsl:element>
                  </xsl:when>
                  <xsl:when test="$bulltype = ''">
                    <xsl:element name="li">
                      <xsl:attribute name="class" select="$paragraphStyle"/>
                      <!--                          <xsl:attribute name="data-name" select="$paragraphStyleName"/>-->
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
                      <!--                          <xsl:attribute name="data-name" select="$paragraphStyleName"/>-->
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
          <!--              <xsl:attribute name="data-name" select="$paragraphStyleName"/>-->
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
    <xsl:apply-templates select="@* | node()"/>
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
                      <xsl:value-of select="concat($xyz, '.')"/>
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
            <xsl:value-of
              select="concat(ancestor::w:sdt/w:sdtPr/w:tag/@w:val, '_', child::w:pPr/w:pStyle/@w:val)"
            />
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
            <xsl:value-of
              select="concat(ancestor::w:sdt/w:sdtPr/w:tag/@w:val, '_', child::w:pPr/w:pStyle/@w:val)"
            />
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

  <!--<xsl:template match="w:drawing" mode="image">
    
    <!-\- <xsl:element name="p">-\->
    <!-\-<xsl:attribute name="class" select="'image'"/>-\->
    <xsl:element name="img">
      <xsl:attribute name="src">
        <!-\-12/11/2020 below coomented by prakash s for retain space in image names  -\->
        <!-\-<xsl:value-of select="concat('../Images/', replace(replace(replace(replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/translate(@name, ' ', ''), '(.eps)|(.png)|(.pdf)', '.jpg'), '(.tiff)|(.tif)', '.jpg'), '.ai', '.jpg'), '%20', '_'))"/>-\->
        <!-\-<xsl:value-of select="concat('../Images/', replace(replace(replace(replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/replace(@name,' ',''), '(.eps)|(.png)|(.pdf)', '.jpg'), '(.tiff)|(.tif)', '.jpg'), '.ai', '.jpg'), '%20', '_'))"/>-\->
        <!-\-Added for wyciwyg on 2-11-2020-\->
        <xsl:variable name="artmatch" select="wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/replace(@name,' ','')"/>
        
        <xsl:variable name="artmatch2">
          <!-\-<xsl:value-of select="replace(replace(replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name, '.eps', '.jpg'), '.tif', '.jpg'), '%20', '_')"/>-\->
          <xsl:value-of select="replace(replace(replace(replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/replace(@name,' ',''), '(.eps)|(.png)|(.pdf)', '.jpg'), '(.tiff)|(.tif)', '.jpg'), '.ai', '.jpg'), '%20', '_')"/>
        </xsl:variable>
        
        <xsl:choose>
          <xsl:when test="$PassArtPath = ''">
<!-\-            <xsl:value-of select="concat('../images/', replace(replace(replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name, '.eps', '.jpg'), '.tif', '.jpg'), '%20', '_'))"/>-\->
            <xsl:value-of select="concat('../Images/', replace(replace(replace(replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/replace(@name,' ',''), '(.eps)|(.png)|(.pdf)', '.jpg'), '(.tiff)|(.tif)', '.jpg'), '.ai', '.jpg'), '%20', '_'))"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:choose>
              <xsl:when test="contains($artmatch,'.jpg') or contains($artmatch,'.jpeg')">
                <xsl:variable name="artmatch1">
                  <xsl:value-of
                    select="replace($artmatch,'%20', '_')"/>
                </xsl:variable>
                <xsl:value-of select="concat($PassArtPath, '/', $artmatch1)"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="concat($PassArtPath, '/Convert%20TO%20JPG/', $artmatch2)"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <xsl:attribute name="alt" select="''"/>
      <xsl:attribute name="txt" select="''"/>
      <xsl:if test="child::wp:inline/@data-pageitem">
        <xsl:attribute name="data-spreadpageitem" select="'yes'"/>
      </xsl:if>
    </xsl:element>
    <!-\-</xsl:element>-\->
  </xsl:template>-->

  <xsl:template match="w:pict">
    <xsl:variable name="PN" select="descendant::*[@w:rsidR][1]/@w:rsidR"/>
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
              <xsl:value-of
                select="substring-before(substring-after(lower-case($PN), '_txtid_'), '_')"/>
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
          <xsl:when test="starts-with($txtFrameId, 'u')">
            <xsl:attribute name="txtFrameId" select="$txtFrameId"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:attribute name="txtFrameId" select="concat('u', $txtFrameId)"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:if>
      <!--<xsl:attribute name="data-type" select="'textbox'"/>
        <xsl:attribute name="data-id" select="descendant-or-self::v:shape[1]/@id"/>
        <xsl:attribute name="data-style" select="descendant::v:textbox[1]/@style"/>-->
      <!--<xsl:attribute name="style" select="'border:1px solid black;outline: 2px solid #CCC;'"/>-->
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
          <xsl:attribute name="src">
            <!--13-11-15: commented below to take the actual image name. I'm merging document.xml.rels "Relationships" to document.xml-->
            <!--13-11-15: refer unzip.xml "\\10.1.1.1\Automation\WORD2XML\Word2HTML5\unzip.pl"-->
            <xsl:for-each select="//Relationships/Relationship[@Id = $imgnameid]">
              <xsl:variable name="imageName" select="//Relationships/Relationship[@Id = $imgnameid]/@Target"/>
              
              <!--Added for wyciwyg on 2-11-2020-->
              <xsl:variable name="artmatch" select="substring-after(//Relationships/Relationship[@Id = $imgnameid][not(contains(@Target,'http'))]/@Target, '/')"/>
              <xsl:choose>
                <xsl:when test="$PassArtPath = ''">
                  <xsl:value-of select="concat('../Images/',substring-after(//Relationships/Relationship[@Id = $imgnameid]/@Target,'/'))"/>
                </xsl:when>
                <xsl:otherwise>
                  <!--<xsl:value-of select="concat($PassArtPath, '/', $artmatch)"/>-->
                  <xsl:choose>
                    <xsl:when test="contains($artmatch,'.jpg') or contains($artmatch,'.jpeg')">
                      <xsl:value-of select="concat($PassArtPath, '/', $artmatch)"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="concat($PassArtPath, '/Convert%20TO%20JPG/', $artmatch)"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:for-each>
            <xsl:for-each select="//Relationships/Relationship[@Id = $imgnameid2]">
              <xsl:value-of select="concat('../Images/',substring-after(@Target,'/'))"/>
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
          
          <xsl:attribute name="src">
            <!--13-11-15: commented below to take the actual image name. I'm merging document.xml.rels "Relationships" to document.xml-->
            <!--13-11-15: refer unzip.xml "\\10.1.1.1\Automation\WORD2XML\Word2HTML5\unzip.pl"-->            
            <!--<xsl:value-of
                            select="concat('../images/', replace(replace(replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name, '.eps', '.jpg'), '.tif', '.jpg'), '%20', '_'))"
                        />-->
            
            <!--Added for wyciwyg on 2-11-2020-->
           <!-- <xsl:variable name="artmatch"
              select="wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name"/>
            
            <xsl:variable name="artmatch2">
              <xsl:value-of select="replace(replace(replace(replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name, '.eps', '.jpg'), '.tif', '.jpg'), '%20', '_'),' ','')"/>
            </xsl:variable>-->
            
<!--21-01-2021 below choose commented by prakash for unwanted choose is in from chitra script for phonix files  -->
           <!-- <xsl:choose>
              <xsl:when test="$PassArtPath = ''">                
                <xsl:value-of select="concat('../Images/', replace(replace(replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name, '.eps', '.jpg'), '.tif', '.jpg'), '%20', '_'))"/>                
              </xsl:when>
              <xsl:otherwise>
                <xsl:choose>
                  <xsl:when test="contains($artmatch,'.jpg') or contains($artmatch,'.jpeg')">
                    <xsl:variable name="artmatch1">
                      <xsl:value-of
                        select="replace(replace($artmatch,'%20', '_'),' ','')"/>
                    </xsl:variable>
                    <xsl:value-of select="concat($PassArtPath, '/', $artmatch1)"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="concat($PassArtPath, '/Convert%20TO%20JPG/', $artmatch2)"/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:otherwise>
            </xsl:choose>-->
            
            <xsl:value-of select="concat('../Images/', replace(replace(replace(replace(replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name,' ',''), '(.eps$)|(.png$)|(.pdf$)|(.PDF$)', '.jpg'), '(.tiff$)|(.tif$)', '.jpg'), '.ai$', '.jpg'), '%20', '_'))"/>
          
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
        <xsl:when
          test="child::w:pPr/w:pPrChange | child::w:pPr/w:shd | child::w:pPr/w:jc | child::w:pPr/w:ind">
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
<!--
  <xsl:template match="//p">
    <xsl:variable name="tableSeq">
      <xsl:if test="descendant::w:sdt[w:sdtPr/w:alias[@w:val = 'SeqNo']]">
        <xsl:value-of
          select="normalize-space(descendant::w:sdt[w:sdtPr/w:alias[@w:val = 'SeqNo']][1])"/>
      </xsl:if>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="contains(@w:rsidR, '_unp') and not(descendant::w:t)"> </xsl:when>
      <xsl:when test="descendant::w:sdt/w:sdtContent/w:r/w:rPr/w:rStyle[@w:val = 'TableNumber']">
        <xsl:copy>
          <xsl:apply-templates select="@*"/>
          <xsl:attribute name="id">
            <xsl:value-of select="'t'"/>
            <xsl:value-of
              select="normalize-space(translate($tableSeq, ' .,;:ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-–)(', ''))"
            />
          </xsl:attribute>
          <xsl:apply-templates select="node()"/>
        </xsl:copy>
      </xsl:when>
      <xsl:when test="descendant::w:pStyle[@w:val = 'TitleHead']">
        <xsl:copy>
          <xsl:apply-templates select="@*"/>
          <xsl:attribute name="id">
            <xsl:value-of select="'t'"/>
            <xsl:value-of
              select="normalize-space(translate($tableSeq, ' .,;:ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-–)(', ''))"
            />
          </xsl:attribute>
          <xsl:apply-templates select="node()"/>
        </xsl:copy>
      </xsl:when>
      <xsl:otherwise>
        <xsl:copy>
          <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>-->
  <xsl:template match="XMLAttribute">
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="span">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>
  <!-- 02-sep-17, END -->

<!--  <xsl:template match="w:sdt/w:sdtContent/p">
    <xsl:variable name="classValue">
      <xsl:value-of select="@class"/>
    </xsl:variable>

    <xsl:variable name="tableSeq">
      <xsl:if test="descendant::w:sdt[w:sdtPr/w:alias[@w:val = 'SeqNo']]">
        <xsl:value-of
          select="normalize-space(descendant::w:sdt[w:sdtPr/w:alias[@w:val = 'SeqNo']][1])"/>
      </xsl:if>
    </xsl:variable>

    <xsl:choose>
      <xsl:when test="contains($classValue, 'TableNumber')">
        <xsl:copy>
          <xsl:apply-templates select="@*"/>
          <xsl:attribute name="id">
            <xsl:value-of select="'t'"/>
            <xsl:value-of
              select="normalize-space(translate($tableSeq, ' .,;:ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-–)(', ''))"
            />
          </xsl:attribute>
          <xsl:apply-templates select="node()"/>
        </xsl:copy>
      </xsl:when>
      <xsl:when test="contains($classValue, 'TitleHead')">
        <xsl:copy>
          <xsl:apply-templates select="@*"/>
          <xsl:attribute name="id">
            <xsl:value-of select="'t'"/>
            <xsl:value-of select="normalize-space(translate($tableSeq, ' .,;:ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-–)(', ''))"/>
          </xsl:attribute>
          <xsl:apply-templates select="node()"/>
        </xsl:copy>
      </xsl:when>
      <xsl:otherwise>
        <xsl:copy>
          <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  -->
 <!-- <xsl:template match="figure | figcaption">
    <xsl:variable name="figSegNo">
      <xsl:variable name="figVal">
        <xsl:choose>
          <xsl:when test="descendant::span[matches(@class, 'Figcaption')] and descendant::w:sdt/w:sdtPr/w:alias[@w:val = 'SeqNo']">
            <xsl:value-of select="descendant::span[matches(@class, 'Figcaption')]"/>
          </xsl:when>
          <xsl:when test="descendant::span[matches(@class, 'FigurePMI')]">
            <xsl:value-of select="descendant::span[matches(@class, 'FigurePMI')]"/>
          </xsl:when>        
        </xsl:choose>      
      </xsl:variable> 
      <xsl:variable name="figVal_1">
        <xsl:choose>
        <xsl:when test="contains($figVal,'.')">
          <xsl:value-of select="substring-after($figVal,'.')"/>    
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$figVal"/>
        </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
        
        <xsl:choose>
          <xsl:when test="contains($figVal_1,'.')">
            <xsl:value-of select="substring-before($figVal_1,'.')"/>    
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$figVal_1"/>
          </xsl:otherwise>
        </xsl:choose>      
    </xsl:variable>    
    
    <xsl:variable name="seqNo1">
      <xsl:choose>
        <xsl:when test="descendant::w:sdt/w:sdtPr[w:alias[@w:val = 'FigureCaption']]">
          <xsl:value-of select="descendant::w:sdt[w:sdtPr[w:alias[@w:val = 'FigureCaption']]]/descendant::w:sdt[w:sdtPr[w:alias[@w:val = 'SeqNo']]][1]/w:sdtContent[1]"/>        
        </xsl:when>
        <xsl:when test="descendant::w:sdt/w:sdtPr[w:alias[@w:val = 'MapCaption']]">       
          <xsl:value-of select="descendant::w:sdt[w:sdtPr[w:alias[@w:val = 'MapCaption']]]/descendant::w:sdt[w:sdtPr[w:alias[@w:val = 'SeqNo']]][1]/w:sdtContent[1]"/>          
        </xsl:when>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="chNo1">
      <xsl:choose>
        <xsl:when test="descendant::w:sdt/w:sdtPr[w:alias[@w:val = 'FigureCaption']]">
          <xsl:value-of select="descendant::w:sdt[w:sdtPr[w:alias[@w:val = 'FigureCaption']]]/descendant::w:sdt[w:sdtPr[w:alias[@w:val = 'ChapNo']]][1]/w:sdtContent[1]"/>        
        </xsl:when>
        <xsl:when test="descendant::w:sdt/w:sdtPr[w:alias[@w:val = 'MapCaption']]">       
          <xsl:value-of select="descendant::w:sdt[w:sdtPr[w:alias[@w:val = 'MapCaption']]]/descendant::w:sdt[w:sdtPr[w:alias[@w:val = 'ChapNo']]][1]/w:sdtContent[1]"/>          
        </xsl:when>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="findAliasValues">
<!-\-06/09/2021 below variable commmeted by prakash for when comes multiple w:sdt then throw error in if-conditions -\->
      <!-\-      <xsl:variable name="Val" select="child::w:sdt/w:sdtPr/w:alias/@w:val/."/>-\->
      <xsl:variable name="Val">
      <xsl:for-each select="child::w:sdt">
        <xsl:value-of select="./w:sdtPr/w:alias/@w:val/."/>
      </xsl:for-each>
      </xsl:variable>
      
      <xsl:if test="string-length($Val) &gt; 0">
        <xsl:variable name="Val_1" select="normalize-space(lower-case($Val))"/>
        <xsl:choose>
          <xsl:when test="matches($Val_1,'mapcaption')">
            <xsl:value-of select="concat('c',$chNo1,'m')"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="concat('c',$chNo1,'f')"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:if>    
    </xsl:variable>
                
    <xsl:choose>
      <xsl:when test="string-length($figSegNo) &gt; 0 or string-length($seqNo1) &gt; 0">
         <xsl:copy>
           <xsl:apply-templates select="@*"/>
           <xsl:attribute name="id">
             <xsl:choose>
               <xsl:when test="$seqNo1">
                 <xsl:value-of select="normalize-space(translate(concat($findAliasValues,$seqNo1),' ',''))"/>
               </xsl:when>
               <xsl:otherwise>          
                 <xsl:value-of select="normalize-space(translate(concat($findAliasValues,$figSegNo),' ',''))"/>            
               </xsl:otherwise>
             </xsl:choose> 
           </xsl:attribute>
           <xsl:apply-templates/>
        </xsl:copy>
      </xsl:when>
      <xsl:otherwise>
        <xsl:copy>
          <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
      </xsl:otherwise>
    </xsl:choose>
    
    </xsl:template> -->
<!--put id's for captions-->
  <xsl:template match="//p">
    <xsl:variable name="styleVal" select="descendant::*/@w:val"/>
    <xsl:variable name="SegNo">
      <xsl:variable name="figVal">
        <xsl:choose>
          <xsl:when test="descendant::span[matches(@class, 'TableNumber')]">           
            <xsl:value-of select="descendant::span[matches(@class, 'TableNumber')]"/>
          </xsl:when>
          <xsl:when test="descendant::span[matches(@class, 'ChapterNumber')]">
            <xsl:value-of select="descendant::span[matches(@class, 'ChapterNumber')]"/>
          </xsl:when>
          <xsl:when test="descendant::span[matches(@class, 'BoxNumber')]">
            <xsl:value-of select="descendant::span[matches(@class, 'BoxNumber')]"/>
          </xsl:when>
          <xsl:when test="descendant::w:sdt/w:sdtPr/w:alias[@w:val = 'SeqNo']/following::w:sdtContent[1]">
            <xsl:value-of select="descendant::w:sdt/w:sdtPr/w:alias[@w:val = 'SeqNo']/following::w:sdtContent[1]"/>
          </xsl:when>
        </xsl:choose>      
      </xsl:variable> 
      
      <xsl:variable name="figVal_1">
        <xsl:choose>
          <xsl:when test="matches($figVal,'-')">
            <xsl:value-of select="substring-after($figVal,'-')"/>    
          </xsl:when>
          <xsl:when test="matches($figVal,'.')">
            <xsl:value-of select="substring-after($figVal,'.')"/>    
          </xsl:when>       
        </xsl:choose>        
      </xsl:variable>
      
      <xsl:choose>
        <xsl:when test="contains($figVal_1,'.')">
          <xsl:value-of select="substring-before($figVal_1,'.')"/>    
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$figVal_1"/>
        </xsl:otherwise>
      </xsl:choose>      
    </xsl:variable>
  
    <xsl:variable name="tableChNo">
      <xsl:variable name="tblVal">
        <xsl:choose>
          <xsl:when test="descendant::w:sdt/w:sdtPr/w:alias[@w:val = 'ChapNo']/following::w:sdtContent[1]">
            <xsl:value-of select="descendant::w:sdt/w:sdtPr/w:alias[@w:val = 'ChapNo']/following::w:sdtContent[1]"/>
          </xsl:when>
          <xsl:when test="descendant::span[matches(@class, 'ChapterNumber')]">
            <xsl:value-of select="descendant::span[matches(@class, 'ChapterNumber')]"/>
          </xsl:when>      
        </xsl:choose>      
      </xsl:variable> 
      
      <xsl:variable name="tblVal_1">
        <xsl:choose>
          <xsl:when test="matches($tblVal,'-|.')">
            <xsl:value-of select="substring-after($tblVal,'-')"/>    
          </xsl:when>
          <xsl:when test="matches($tblVal,'.')">
            <xsl:value-of select="substring-after($tblVal,'.')"/>    
          </xsl:when> 
          <xsl:otherwise>
            <xsl:value-of select="$tblVal"/>
          </xsl:otherwise>
        </xsl:choose>        
      </xsl:variable>
      
      <xsl:choose>
        <xsl:when test="contains($tblVal_1,'.')">
          <xsl:value-of select="substring-before($tblVal_1,'.')"/>    
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$tblVal"/>
        </xsl:otherwise>
      </xsl:choose>      
    </xsl:variable>
  
    <xsl:variable name="seqNo1">
      <xsl:variable name="Val">
      <xsl:choose>
        <xsl:when test="descendant::w:sdt/w:sdtPr/w:alias[@w:val = 'SeqNo']/following::w:sdtContent[1]">
          <xsl:value-of select="descendant::w:sdt/w:sdtPr/w:alias[@w:val = 'SeqNo']/normalize-space(following::w:sdtContent[1])"/>
        </xsl:when>
      </xsl:choose>
      </xsl:variable>
      <xsl:variable name="Val_1">
      <xsl:choose>
        <xsl:when test="contains($Val,'.')">
          <xsl:value-of select="substring-before($Val,'.')"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$Val"/>
        </xsl:otherwise>
      </xsl:choose>
      </xsl:variable>
      <xsl:value-of select="translate($Val_1,'&#x00A0;|&#xA;|&#x9;|&#x2028;|&#8194;|&#8195;||&#x0020;|&#xa0;| ','')"/>
    </xsl:variable>
    
    <xsl:variable name="tableChNo1">
      <xsl:variable name="Val">
        <xsl:choose>
          <xsl:when test="descendant::w:sdt/w:sdtPr/w:alias[@w:val = 'ChapNo']/following::w:sdtContent[1]">
            <xsl:value-of select="descendant::w:sdt/w:sdtPr/w:alias[@w:val = 'ChapNo']/normalize-space(following::w:sdtContent[1])"/>
          </xsl:when>
        </xsl:choose>
      </xsl:variable>
      <xsl:variable name="Val_1">
        <xsl:choose>
          <xsl:when test="contains($Val,'.')">
            <xsl:value-of select="substring-before($Val,'.')"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$Val"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:value-of select="translate($Val_1,'&#x00A0;|&#xA;|&#x9;|&#x2028;|&#8194;|&#8195;||&#x0020;|&#xa0;| ','')"/>
    </xsl:variable>
    
    <xsl:choose>
 <!--     <xsl:when test="$styleVal = 'TableCaption'">
        <xsl:copy>
          <xsl:apply-templates select="@*"/>
          <xsl:attribute name="id">
            <xsl:choose>
              <xsl:when test="$seqNo1">
                <xsl:value-of select="normalize-space(translate(concat('c',$tableChNo1,'t',$seqNo1),' ',''))"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="normalize-space(translate(concat('c',$tableChNo,'t',$SegNo),' ',''))"/>    
              </xsl:otherwise>
            </xsl:choose>            
          </xsl:attribute>          
          <xsl:apply-templates/>
        </xsl:copy>
      </xsl:when>-->
     <!-- <xsl:when test="$styleVal = 'ChapterNumber'">
        <xsl:copy>
          <xsl:apply-templates select="@*"/>
          <xsl:attribute name="id">
<!-\-            <xsl:value-of select="normalize-space(translate(concat('ec',$SegNo),' ',''))"/>-\->
            <xsl:choose>
              <xsl:when test="$seqNo1">
                <xsl:value-of select="normalize-space(translate(concat('ec',$seqNo1),' ',''))"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="normalize-space(translate(concat('ec',$SegNo),' ',''))"/>    
              </xsl:otherwise>
            </xsl:choose>       
          </xsl:attribute>
          <xsl:apply-templates/>
        </xsl:copy>
      </xsl:when>-->
      <xsl:when test="$styleVal = 'BoxNumber'">
        <xsl:copy>
          <xsl:apply-templates select="@*"/>
          <xsl:attribute name="id">
<!--            <xsl:value-of select="normalize-space(translate(concat('ebox',$SegNo),' ',''))"/>-->
            <xsl:choose>
              <xsl:when test="$seqNo1">
                <xsl:value-of select="normalize-space(translate(concat('ebox',$seqNo1),' ',''))"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="normalize-space(translate(concat('ebox',$SegNo),' ',''))"/>    
              </xsl:otherwise>
            </xsl:choose>   
          </xsl:attribute>
          <xsl:apply-templates/>
        </xsl:copy>
      </xsl:when>
      <xsl:otherwise>
        <xsl:copy>
        <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
      </xsl:otherwise>
    </xsl:choose>

  </xsl:template> 
   
  <xsl:template name="fontSize-Convert-pt-to-percentage">
    
    <xsl:param name="fontSize"/>
    
    <xsl:choose>
      <xsl:when test="$fontSize = 1">
        <xsl:value-of select="8 * 1.5"/>
      </xsl:when>
      <xsl:when test="$fontSize = 2">
        <xsl:value-of select="17 * 1.5"/>
      </xsl:when>
      <xsl:when test="$fontSize = 3">
        <xsl:value-of select="25 * 1.5"/>
      </xsl:when>
      <xsl:when test="$fontSize = 4">
        <xsl:value-of select="33 * 1.5"/>
      </xsl:when>
      <xsl:when test="$fontSize = 5">
        <xsl:value-of select="42 * 1.5"/>
      </xsl:when>
      <xsl:when test="$fontSize = 6">
        <xsl:value-of select="50 * 1.5"/>
      </xsl:when>
      <xsl:when test="$fontSize = 7">
        <xsl:value-of select="58 * 1.5"/>
      </xsl:when>
      <xsl:when test="$fontSize = 8">
        <xsl:value-of select="67 * 1.5"/>
      </xsl:when>
      <xsl:when test="$fontSize = 9">
        <xsl:value-of select="75 * 1.5"/>
      </xsl:when>
      <xsl:when test="$fontSize = 10">
        <xsl:value-of select="81 * 1.5"/>
      </xsl:when>
      <xsl:when test="$fontSize = 11">
        <xsl:value-of select="88 * 1.5"/>
      </xsl:when>
      <xsl:when test="$fontSize = 12">
        <xsl:value-of select="100"/>
      </xsl:when>
      <xsl:when test="$fontSize = 13">
        <xsl:value-of select="106"/>
      </xsl:when>
      <xsl:when test="$fontSize = 14">
        <xsl:value-of select="113"/>
      </xsl:when>
      <xsl:when test="$fontSize = 15">
        <xsl:value-of select="125"/>
      </xsl:when>
      <xsl:when test="$fontSize = 16">
        <xsl:value-of select="131"/>
      </xsl:when>
      <xsl:when test="$fontSize = 17">
        <xsl:value-of select="138"/>
      </xsl:when>
      <xsl:when test="$fontSize = 18">
        <xsl:value-of select="150"/>
      </xsl:when>
      <xsl:when test="$fontSize = 19">
        <xsl:value-of select="156"/>
      </xsl:when>
      <xsl:when test="$fontSize = 20">
        <xsl:value-of select="163"/>
      </xsl:when>
      <xsl:when test="$fontSize = 21">
        <xsl:value-of select="175"/>
      </xsl:when>
      <xsl:when test="$fontSize = 22">
        <xsl:value-of select="181"/>
      </xsl:when>
      <xsl:when test="$fontSize = 23">
        <xsl:value-of select="188"/>
      </xsl:when>
      <xsl:when test="$fontSize = 24">
        <xsl:value-of select="200 div 1.10"/>
      </xsl:when>
      <xsl:when test="$fontSize = 25">
        <xsl:value-of select="206 div 1.10"/>
      </xsl:when>
      <xsl:when test="$fontSize = 26">
        <xsl:value-of select="213 div 1.10"/>
      </xsl:when>
      <xsl:when test="$fontSize = 27">
        <xsl:value-of select="225 div 1.10"/>
      </xsl:when>
      <xsl:when test="$fontSize = 28">
        <xsl:value-of select="231 div 1.10"/>
      </xsl:when>
      <xsl:when test="$fontSize = 29">
        <xsl:value-of select="238 div 1.10"/>
      </xsl:when>
      <xsl:when test="$fontSize = 30">
        <xsl:value-of select="250 div 1.20"/>
      </xsl:when>
      <xsl:when test="$fontSize = 31">
        <xsl:value-of select="256 div 1.20"/>
      </xsl:when>
      <xsl:when test="$fontSize = 32">
        <xsl:value-of select="263 div 1.20"/>
      </xsl:when>
      <xsl:when test="$fontSize = 33">
        <xsl:value-of select="269 div 1.20"/>
      </xsl:when>
      <xsl:when test="$fontSize = 34">
        <xsl:value-of select="281 div 1.20"/>
      </xsl:when>
      <xsl:when test="$fontSize = 35">
        <xsl:value-of select="288 div 1.20"/>
      </xsl:when>
      <xsl:when test="$fontSize = 36">
        <xsl:value-of select="300 div 1.30"/>
      </xsl:when>
      <xsl:when test="$fontSize = 37">
        <xsl:value-of select="308 div 1.30"/>
      </xsl:when>
      <xsl:when test="$fontSize = 38">
        <xsl:value-of select="317 div 1.30"/>
      </xsl:when>
      <xsl:when test="$fontSize = 39">
        <xsl:value-of select="325 div 1.30"/>
      </xsl:when>
      <xsl:when test="$fontSize = 40">
        <xsl:value-of select="333 div 1.40"/>
      </xsl:when>
      <xsl:when test="$fontSize = 41">
        <xsl:value-of select="342 div 1.40"/>
      </xsl:when>
      <xsl:when test="$fontSize = 42">
        <xsl:value-of select="350 div 1.40"/>
      </xsl:when>
      <xsl:when test="$fontSize = 43">
        <xsl:value-of select="358 div 1.50"/>
      </xsl:when>
      <xsl:when test="$fontSize = 44">
        <xsl:value-of select="367 div 1.50"/>
      </xsl:when>
      <xsl:when test="$fontSize = 45">
        <xsl:value-of select="375 div 1.50"/>
      </xsl:when>
      <xsl:when test="$fontSize = 46">
        <xsl:value-of select="383 div 1.50"/>
      </xsl:when>
      <xsl:when test="$fontSize = 47">
        <xsl:value-of select="392 div 1.50"/>
      </xsl:when>
      <xsl:when test="$fontSize = 48">
        <xsl:value-of select="400 div 1.60"/>
      </xsl:when>
      <xsl:when test="$fontSize = 49">
        <xsl:value-of select="408 div 1.60"/>
      </xsl:when>
      <xsl:when test="$fontSize = 50">
        <xsl:value-of select="417 div 1.60"/>
      </xsl:when>
      <xsl:when test="$fontSize = 51">
        <xsl:value-of select="425 div 1.60"/>
      </xsl:when>
      <xsl:when test="$fontSize = 52">
        <xsl:value-of select="433 div 1.60"/>
      </xsl:when>
      <xsl:when test="$fontSize = 53">
        <xsl:value-of select="442 div 1.70"/>
      </xsl:when>
      <xsl:when test="$fontSize = 66">
        <xsl:value-of select="550 div 1.80"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$fontSize"/>
      </xsl:otherwise>
    </xsl:choose>
    
  </xsl:template>
  
  <xsl:template name="Convert-stringNumber-to-IntegerNumber">
    <xsl:param name="value"/>

    <xsl:choose>
      <xsl:when test="$value = 'zero'">
        <xsl:value-of select="0"/>
      </xsl:when>
      <xsl:when test="$value = 'one'">
        <xsl:value-of select="1"/>
      </xsl:when>
      <xsl:when test="$value = 'two'">
        <xsl:value-of select="2"/>
      </xsl:when>
      <xsl:when test="$value = 'three'">
        <xsl:value-of select="3"/>
      </xsl:when>
      <xsl:when test="$value = 'four'">
        <xsl:value-of select="4"/>
      </xsl:when>
      <xsl:when test="$value = 'five'">
        <xsl:value-of select="5"/>
      </xsl:when>
      <xsl:when test="$value = 'six'">
        <xsl:value-of select="6"/>
      </xsl:when>
      <xsl:when test="$value = 'seven'">
        <xsl:value-of select="7"/>
      </xsl:when>
      <xsl:when test="$value = 'eight'">
        <xsl:value-of select="8"/>
      </xsl:when>
      <xsl:when test="$value = 'nine'">
        <xsl:value-of select="9"/>
      </xsl:when>
      <xsl:when test="$value = 'ten'">
        <xsl:value-of select="10"/>
      </xsl:when>
      <xsl:when test="$value = 'eleven'">
        <xsl:value-of select="11"/>
      </xsl:when>
      <xsl:when test="$value = 'twelve'">
        <xsl:value-of select="12"/>
      </xsl:when>
      <xsl:when test="$value = 'thirteen'">
        <xsl:value-of select="13"/>
      </xsl:when>
      <xsl:when test="$value = 'fourteen'">
        <xsl:value-of select="14"/>
      </xsl:when>
      <xsl:when test="$value = 'fifteen'">
        <xsl:value-of select="15"/>
      </xsl:when>
      <xsl:when test="$value = 'sixteen'">
        <xsl:value-of select="16"/>
      </xsl:when>
      <xsl:when test="$value = 'seventeen'">
        <xsl:value-of select="17"/>
      </xsl:when>
      <xsl:when test="$value = 'eighteen'">
        <xsl:value-of select="18"/>
      </xsl:when>
      <xsl:when test="$value = 'nineteen'">
        <xsl:value-of select="19"/>
      </xsl:when>
      <xsl:when test="$value = 'twenty'">
        <xsl:value-of select="20"/>
      </xsl:when>
      <xsl:when test="$value = 'twentyone'">
        <xsl:value-of select="21"/>
      </xsl:when>
      <xsl:when test="$value = 'twentytwo'">
        <xsl:value-of select="22"/>
      </xsl:when>
      <xsl:when test="$value = 'twentythree'">
        <xsl:value-of select="23"/>
      </xsl:when>
      <xsl:when test="$value = 'twentyfour'">
        <xsl:value-of select="24"/>
      </xsl:when>
      <xsl:when test="$value = 'twentyfive'">
        <xsl:value-of select="25"/>
      </xsl:when>
      <xsl:when test="$value = 'twentysix'">
        <xsl:value-of select="26"/>
      </xsl:when>
      <xsl:when test="$value = 'twentyseven'">
        <xsl:value-of select="27"/>
      </xsl:when>
      <xsl:when test="$value = 'twentyeight'">
        <xsl:value-of select="28"/>
      </xsl:when>
      <xsl:when test="$value = 'twentynine'">
        <xsl:value-of select="29"/>
      </xsl:when>
      <xsl:when test="$value = 'thirty'">
        <xsl:value-of select="30"/>
      </xsl:when>
      <xsl:when test="$value = 'thirtyone'">
        <xsl:value-of select="31"/>
      </xsl:when>
      <xsl:when test="$value = 'thirtytwo'">
        <xsl:value-of select="32"/>
      </xsl:when>
      <xsl:when test="$value = 'thirtythree'">
        <xsl:value-of select="33"/>
      </xsl:when>
      <xsl:when test="$value = 'thirtyfour'">
        <xsl:value-of select="34"/>
      </xsl:when>
      <xsl:when test="$value = 'thirtyfive'">
        <xsl:value-of select="35"/>
      </xsl:when>
      <xsl:when test="$value = 'thirtysix'">
        <xsl:value-of select="36"/>
      </xsl:when>
      <xsl:when test="$value = 'thirtyseven'">
        <xsl:value-of select="37"/>
      </xsl:when>
      <xsl:when test="$value = 'thirtyeight'">
        <xsl:value-of select="38"/>
      </xsl:when>
      <xsl:when test="$value = 'thirtynine'">
        <xsl:value-of select="39"/>
      </xsl:when>
      <xsl:when test="$value = 'forty'">
        <xsl:value-of select="40"/>
      </xsl:when>
      <xsl:when test="$value = 'fortyone'">
        <xsl:value-of select="41"/>
      </xsl:when>
      <xsl:when test="$value = 'fortytwo'">
        <xsl:value-of select="42"/>
      </xsl:when>
      <xsl:when test="$value = 'fortythree'">
        <xsl:value-of select="43"/>
      </xsl:when>
      <xsl:when test="$value = 'fortyfour'">
        <xsl:value-of select="44"/>
      </xsl:when>
      <xsl:when test="$value = 'fortyfive'">
        <xsl:value-of select="45"/>
      </xsl:when>
      <xsl:when test="$value = 'fortysix'">
        <xsl:value-of select="46"/>
      </xsl:when>
      <xsl:when test="$value = 'fortyseven'">
        <xsl:value-of select="47"/>
      </xsl:when>
      <xsl:when test="$value = 'fortyeight'">
        <xsl:value-of select="48"/>
      </xsl:when>
      <xsl:when test="$value = 'fortynine'">
        <xsl:value-of select="49"/>
      </xsl:when>
      <xsl:when test="$value = 'fifty'">
        <xsl:value-of select="50"/>
      </xsl:when>
      <xsl:when test="$value = 'fiftyone'">
        <xsl:value-of select="51"/>
      </xsl:when>
      <xsl:when test="$value = 'fiftytwo'">
        <xsl:value-of select="52"/>
      </xsl:when>
      <xsl:when test="$value = 'fiftythree'">
        <xsl:value-of select="53"/>
      </xsl:when>
      <xsl:when test="$value = 'fiftyfour'">
        <xsl:value-of select="54"/>
      </xsl:when>
      <xsl:when test="$value = 'fiftyfive'">
        <xsl:value-of select="55"/>
      </xsl:when>
      <xsl:when test="$value = 'fiftysix'">
        <xsl:value-of select="56"/>
      </xsl:when>
      <xsl:when test="$value = 'fiftyseven'">
        <xsl:value-of select="57"/>
      </xsl:when>
      <xsl:when test="$value = 'fiftyeight'">
        <xsl:value-of select="58"/>
      </xsl:when>
      <xsl:when test="$value = 'fiftynine'">
        <xsl:value-of select="59"/>
      </xsl:when>
      <xsl:when test="$value = 'sixty'">
        <xsl:value-of select="60"/>
      </xsl:when>
      <xsl:when test="$value = 'sixtyone'">
        <xsl:value-of select="61"/>
      </xsl:when>
      <xsl:when test="$value = 'sixtytwo'">
        <xsl:value-of select="62"/>
      </xsl:when>
      <xsl:when test="$value = 'sixtythree'">
        <xsl:value-of select="63"/>
      </xsl:when>
      <xsl:when test="$value = 'sixtyfour'">
        <xsl:value-of select="64"/>
      </xsl:when>
      <xsl:when test="$value = 'sixtyfive'">
        <xsl:value-of select="65"/>
      </xsl:when>
      <xsl:when test="$value = 'sixtysix'">
        <xsl:value-of select="66"/>
      </xsl:when>
      <xsl:when test="$value = 'sixtyseven'">
        <xsl:value-of select="67"/>
      </xsl:when>
      <xsl:when test="$value = 'sixtyeight'">
        <xsl:value-of select="69"/>
      </xsl:when>
      <xsl:when test="$value = 'sixtynine'">
        <xsl:value-of select="69"/>
      </xsl:when>
      <xsl:when test="$value = 'seventy'">
        <xsl:value-of select="70"/>
      </xsl:when>
      <xsl:when test="$value = 'seventyone'">
        <xsl:value-of select="71"/>
      </xsl:when>
      <xsl:when test="$value = 'seventytwo'">
        <xsl:value-of select="72"/>
      </xsl:when>
      <xsl:when test="$value = 'seventythree'">
        <xsl:value-of select="73"/>
      </xsl:when>
      <xsl:when test="$value = 'seventyfour'">
        <xsl:value-of select="74"/>
      </xsl:when>
      <xsl:when test="$value = 'seventyfive'">
        <xsl:value-of select="75"/>
      </xsl:when>
      <xsl:when test="$value = 'seventysix'">
        <xsl:value-of select="76"/>
      </xsl:when>
      <xsl:when test="$value = 'seventyseven'">
        <xsl:value-of select="77"/>
      </xsl:when>
      <xsl:when test="$value = 'seventyeight'">
        <xsl:value-of select="78"/>
      </xsl:when>
      <xsl:when test="$value = 'seventynine'">
        <xsl:value-of select="79"/>
      </xsl:when>
      <xsl:when test="$value = 'eighty'">
        <xsl:value-of select="80"/>
      </xsl:when>
      <xsl:when test="$value = 'eightyone'">
        <xsl:value-of select="81"/>
      </xsl:when>
      <xsl:when test="$value = 'eightytwo'">
        <xsl:value-of select="82"/>
      </xsl:when>
      <xsl:when test="$value = 'eightythree'">
        <xsl:value-of select="83"/>
      </xsl:when>
      <xsl:when test="$value = 'eightyfour'">
        <xsl:value-of select="84"/>
      </xsl:when>
      <xsl:when test="$value = 'eightyfive'">
        <xsl:value-of select="85"/>
      </xsl:when>
      <xsl:when test="$value = 'eightysix'">
        <xsl:value-of select="86"/>
      </xsl:when>
      <xsl:when test="$value = 'eightyseven'">
        <xsl:value-of select="87"/>
      </xsl:when>
      <xsl:when test="$value = 'eightyeight'">
        <xsl:value-of select="88"/>
      </xsl:when>
      <xsl:when test="$value = 'eightynine'">
        <xsl:value-of select="89"/>
      </xsl:when>
      <xsl:when test="$value = 'ninety'">
        <xsl:value-of select="90"/>
      </xsl:when>
      <xsl:when test="$value = 'ninetyone'">
        <xsl:value-of select="91"/>
      </xsl:when>
      <xsl:when test="$value = 'ninetytwo'">
        <xsl:value-of select="92"/>
      </xsl:when>
      <xsl:when test="$value = 'ninetythree'">
        <xsl:value-of select="93"/>
      </xsl:when>
      <xsl:when test="$value = 'ninetyfour'">
        <xsl:value-of select="94"/>
      </xsl:when>
      <xsl:when test="$value = 'ninetyfive'">
        <xsl:value-of select="95"/>
      </xsl:when>
      <xsl:when test="$value = 'ninetysix'">
        <xsl:value-of select="96"/>
      </xsl:when>
      <xsl:when test="$value = 'ninetyseven'">
        <xsl:value-of select="97"/>
      </xsl:when>
      <xsl:when test="$value = 'ninetyeight'">
        <xsl:value-of select="98"/>
      </xsl:when>
      <xsl:when test="$value = 'ninetynine'">
        <xsl:value-of select="99"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$value"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  
</xsl:stylesheet>
