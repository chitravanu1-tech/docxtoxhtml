<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf"
    exclude-result-prefixes="xs mf idPkg"
    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    xmlns:idPkg="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    xmlns:number="http://dummy"  extension-element-prefixes="number" version="2.0">

    <xsl:output method="xml" indent="yes" name="xml"/>

    <xsl:variable name="Graphic" select="document('Graphic.xml')"/>
    <xsl:variable name="hex" >0123456789ABCDEF</xsl:variable>
    
    <xsl:param name="separate" select="' '"/>

    <xsl:decimal-format name="name" decimal-separator="." grouping-separator="," infinity="string"
        minus-sign="-" NaN="string" percent="%" zero-digit="0" digit="#" pattern-separator=";"/>


    <!--<xsl:template match="MAPS/MAP">
        <xsl:variable name="M" select="."/>
        <xsl:variable name="filename" select="concat('output/',$M)"/>
        <xsl:result-document href="{$filename}" format="xml">
            <xsl:apply-templates select="document($M)//Spread"/>
        </xsl:result-document>
    </xsl:template>-->

    <xsl:template match="MAPS">
        <xsl:copy>
            <xsl:apply-templates select="//Spread"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="Spread">
        <xsl:element name="Measurement">
            <xsl:attribute name="id" select="@Self"/>
            <xsl:attribute name="data-pageitem" select="'yes'"/>
            <xsl:apply-templates select="Page"/>
            <!--<xsl:apply-templates select="//TextFrame[not(ancestor::Group)]"/>--><!-- added by HARI -->
            <xsl:apply-templates select="TextFrame"/>
            <xsl:apply-templates select="Rectangle | Oval[descendant::TextPath[@ParentStory]] | Polygon[descendant::TextPath[@ParentStory]] |  GraphicLine[descendant::TextPath[@ParentStory]]"/>
            <xsl:apply-templates select="Group"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="Page">
        <xsl:param name="separator" select="' '"/>
        <xsl:variable name="Y" select="(self::Page/@ItemTransform)"/>
        <xsl:variable name="HW" select="(self::Page/@GeometricBounds)"/>
        <xsl:variable name="SN" select="(self::Page/@Name)"/>
        <xsl:variable name="POFN">
            <xsl:choose>
                <xsl:when test="preceding-sibling::*/name() ='Page'">
                    <xsl:value-of select="preceding-sibling::Page/@Name"/>
                </xsl:when>
                <xsl:when test="following-sibling::*/name() ='Page'">
                    <xsl:value-of select="following-sibling::Page/@Name"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>

        <xsl:variable name="PageHW" select="tokenize($HW,$separator)"/>

        <xsl:variable name="PHeight" select="number($PageHW[3])"/>
        <xsl:variable name="PWidth" select="number($PageHW[4])"/>

        <xsl:variable name="PageOrigin" select="tokenize($Y,$separator)"/>
        <xsl:variable name="XOrigin" select="number($PageOrigin[5])"/>
        <xsl:variable name="YOrigin" select="number($PageOrigin[6])"/>

        <xsl:variable name="Gutter"
            select="number(self::Page/MarginPreference/@ColumnGutter)"/>
        <xsl:variable name="Top"
            select="number(self::Page/MarginPreference/@Top)"/>
        <xsl:variable name="Bottom"
            select="number(self::Page/MarginPreference/@Bottom)"/>
        <xsl:variable name="Left"
            select="number(self::Page/MarginPreference/@Left)"/>
        <xsl:variable name="Right"
            select="number(self::Page/MarginPreference/@Right)"/>

        <xsl:if test="(//Spread/@PageCount) = '2'">

            <xsl:if test="$SN &lt; $POFN">
                <xsl:element name="Page">
                    <xsl:attribute name="SN" select="$SN"/>
                    <xsl:attribute name="pofn" select="$POFN"/>
                    <xsl:attribute name="id" select="@Self"/>
                    <xsl:attribute name="page" select="'verso'"/>
                    <PageH>
                        <xsl:value-of select="($PHeight)*20"/>
                    </PageH>
                    <PageW>
                        <xsl:value-of select="($PWidth)*20"/>
                    </PageW>

                    <PXOrigin>
                        <xsl:value-of select="$XOrigin"/>
                    </PXOrigin>
                    <PYOrigin>
                        <xsl:value-of select="$YOrigin"/>
                    </PYOrigin>
                </xsl:element>
            </xsl:if>

            <xsl:if test="$SN &gt; $POFN">
                <xsl:element name="Page">
                    <xsl:attribute name="SN" select="$SN"/>
                    <xsl:attribute name="pofn" select="$POFN"/>
                    <xsl:attribute name="id" select="@Self"/>
                    <xsl:attribute name="page" select="'recto'"/>
                    <PageH>
                        <xsl:value-of select="($PHeight)*20"/>
                    </PageH>
                    <PageW>
                        <xsl:value-of select="($PWidth)*20"/>
                    </PageW>

                    <PXOrigin>
                        <xsl:value-of select="$XOrigin"/>
                    </PXOrigin>
                    <PYOrigin>
                        <xsl:value-of select="$YOrigin"/>
                    </PYOrigin>
                </xsl:element>
            </xsl:if>

            <xsl:element name="Margin">
                <Top>
                    <xsl:value-of select="($Top) * 20"/>
                </Top>
                <Right>
                    <xsl:value-of select="($Right) * 20"/>
                </Right>
                <Bottom>
                    <xsl:value-of select="($Bottom) * 20"/>
                </Bottom>
                <Left>
                    <xsl:value-of select="($Left) * 20"/>
                </Left>
                <Gutter>
                    <xsl:value-of select="$Gutter"/>
                </Gutter>
            </xsl:element>

        </xsl:if>

        <xsl:if test="(//Spread/@PageCount) = '1'">
            <xsl:if test="$XOrigin &lt; 0">
                <xsl:element name="Page">
                    <xsl:attribute name="id" select="@Self"/>
                    <xsl:attribute name="page" select="'verso'"/>
                    <PageH>
                        <xsl:value-of select="($PHeight)*20"/>
                    </PageH>
                    <PageW>
                        <xsl:value-of select="($PWidth)*20"/>
                    </PageW>
                    
                    <PXOrigin>
                        <xsl:value-of select="$XOrigin"/>
                    </PXOrigin>
                    <PYOrigin>
                        <xsl:value-of select="$YOrigin"/>
                    </PYOrigin>
                </xsl:element>
            </xsl:if>
            
            <xsl:if test="$XOrigin &gt;= 0">
                <xsl:element name="Page">
                    <xsl:attribute name="id" select="@Self"/>
                    <xsl:attribute name="page" select="'recto'"/>
                    <PageH>
                        <xsl:value-of select="($PHeight)*20"/>
                    </PageH>
                    <PageW>
                        <xsl:value-of select="($PWidth)*20"/>
                    </PageW>
                    
                    <PXOrigin>
                        <xsl:value-of select="$XOrigin"/>
                    </PXOrigin>
                    <PYOrigin>
                        <xsl:value-of select="$YOrigin"/>
                    </PYOrigin>
                </xsl:element>
            </xsl:if>

            <xsl:element name="Margin">
                <Top>
                    <xsl:value-of select="($Top) * 20"/>
                </Top>
                <Right>
                    <xsl:value-of select="($Right) * 20"/>
                </Right>
                <Bottom>
                    <xsl:value-of select="($Bottom) * 20"/>
                </Bottom>
                <Left>
                    <xsl:value-of select="($Left) * 20"/>
                </Left>
                <Gutter>
                    <xsl:value-of select="$Gutter"/>
                </Gutter>
            </xsl:element>
        </xsl:if>
    </xsl:template>

    <xsl:template match="TextFrame" name="TF">
          <xsl:variable name="prevTxFrame" select="@PreviousTextFrame"/>
          <xsl:variable name="nxtTxFrame" select="@NextTextFrame"/>
          <xsl:variable name="textPath" select="self::*/descendant::TextPath[@ParentStory][1]/@ParentStory"/>
          <xsl:variable name="nxtTxtFrameLabel">
              <xsl:value-of select="//TextFrame[@Self =$nxtTxFrame][child::Properties/Label/KeyValuePair[contains(lower-case(@Value),'_y_')]]/Properties/Label/KeyValuePair/@Value"/>
          </xsl:variable>
          <xsl:variable name="prevTxtFrameLabel">
              <xsl:value-of select="//TextFrame[@Self =$prevTxFrame][child::Properties/Label/KeyValuePair[contains(lower-case(@Value),'_y_')]]/Properties/Label/KeyValuePair/@Value"/>
          </xsl:variable>
          
          <xsl:variable name="textFrameId">
              <xsl:value-of select="Properties/Label/KeyValuePair[contains(lower-case(@Value),'_y_')][1]/@Value"/>
          </xsl:variable>
          
          <xsl:variable name="curTxFramepageNo">
              <xsl:choose>
                  <xsl:when test="not(contains(substring-after(lower-case($textFrameId),'p_'),'_'))">
                      <xsl:choose>
                          <xsl:when test="contains(lower-case($textFrameId),'p_')">
                              <xsl:value-of select="substring-after(lower-case($textFrameId),'p_')"/>
                          </xsl:when>
                      </xsl:choose>
                  </xsl:when>
                  <xsl:otherwise>
                      <xsl:choose>
                          <xsl:when test="contains(lower-case($textFrameId),'p_')">
                              <xsl:value-of select="substring-before(substring-after(lower-case($textFrameId),'p_'),'_')"/>
                          </xsl:when>
                      </xsl:choose>
                  </xsl:otherwise>
              </xsl:choose>
          </xsl:variable>
          
          <xsl:variable name="curTxFrameColumn">
              <xsl:if test="string-length($textFrameId) &gt; 0">
                  <xsl:choose>
                      <xsl:when test="not(contains(substring-after(lower-case($textFrameId),'_c_'),'_'))">
                          <xsl:choose>
                              <xsl:when test="contains(lower-case($textFrameId),'_c_')">
                                  <xsl:value-of select="substring-after(lower-case($textFrameId),'_c_')"/>
                              </xsl:when>
                          </xsl:choose>
                      </xsl:when>
                      <xsl:otherwise>
                          <xsl:choose>
                              <xsl:when test="contains(lower-case($textFrameId),'_c_')">
                                  <xsl:value-of select="substring-before(substring-after(lower-case($textFrameId),'_c_'),'_')"/>
                              </xsl:when>
                          </xsl:choose>
                      </xsl:otherwise>
                  </xsl:choose>
              </xsl:if>
          </xsl:variable>
          
          <xsl:variable name="prevTxFramepageNo">
              <xsl:choose>
                  <xsl:when test="not(contains(substring-after(lower-case($prevTxtFrameLabel),'p_'),'_'))">
                      <xsl:choose>
                          <xsl:when test="contains(lower-case($prevTxtFrameLabel),'p_')">
                              <xsl:value-of select="substring-after(lower-case($prevTxtFrameLabel),'p_')"/>
                          </xsl:when>
                      </xsl:choose>
                  </xsl:when>
                  <xsl:otherwise>
                      <xsl:choose>
                          <xsl:when test="contains(lower-case($prevTxtFrameLabel),'p_')">
                              <xsl:value-of select="substring-before(substring-after(lower-case($prevTxtFrameLabel),'p_'),'_')"/>
                          </xsl:when>
                      </xsl:choose>
                  </xsl:otherwise>
              </xsl:choose>
          </xsl:variable>
          
          <xsl:variable name="nxtTxFramepageNo">
              <xsl:choose>
                  <xsl:when test="not(contains(substring-after(lower-case($nxtTxtFrameLabel),'p_'),'_'))">
                      <xsl:choose>
                          <xsl:when test="contains(lower-case($nxtTxtFrameLabel),'p_')">
                              <xsl:value-of select="substring-after(lower-case($nxtTxtFrameLabel),'p_')"/>
                          </xsl:when>
                      </xsl:choose>
                  </xsl:when>
                  <xsl:otherwise>
                      <xsl:choose>
                          <xsl:when test="contains(lower-case($nxtTxtFrameLabel),'p_')">
                              <xsl:value-of select="substring-before(substring-after(lower-case($nxtTxtFrameLabel),'p_'),'_')"/>
                          </xsl:when>
                      </xsl:choose>
                  </xsl:otherwise>
              </xsl:choose>
          </xsl:variable>
          
          <xsl:variable name="nxtTxFrameColumn">
              <xsl:if test="string-length($nxtTxtFrameLabel) &gt; 0">
                  <xsl:choose>
                      <xsl:when test="not(contains(substring-after(lower-case($nxtTxtFrameLabel),'_c_'),'_'))">
                          <xsl:choose>
                              <xsl:when test="contains(lower-case($nxtTxtFrameLabel),'_c_')">
                                  <xsl:value-of select="substring-after(lower-case($nxtTxtFrameLabel),'_c_')"/>
                              </xsl:when>
                          </xsl:choose>
                      </xsl:when>
                      <xsl:otherwise>
                          <xsl:choose>
                              <xsl:when test="contains(lower-case($nxtTxtFrameLabel),'_c_')">
                                  <xsl:value-of select="substring-before(substring-after(lower-case($nxtTxtFrameLabel),'_c_'),'_')"/>
                              </xsl:when>
                          </xsl:choose>
                      </xsl:otherwise>
                  </xsl:choose>
              </xsl:if>
          </xsl:variable>
          
          <xsl:variable name="prevTxFrameColumn">
              <xsl:if test="string-length($prevTxtFrameLabel) &gt; 0">
                  <xsl:choose>
                      <xsl:when test="not(contains(substring-after(lower-case($prevTxtFrameLabel),'_c_'),'_'))">
                          <xsl:choose>
                              <xsl:when test="contains(lower-case($prevTxtFrameLabel),'_c_')">
                                  <xsl:value-of select="substring-after(lower-case($prevTxtFrameLabel),'_c_')"/>
                              </xsl:when>
                          </xsl:choose>
                      </xsl:when>
                      <xsl:otherwise>
                          <xsl:choose>
                              <xsl:when test="contains(lower-case($prevTxtFrameLabel),'_c_')">
                                  <xsl:value-of select="substring-before(substring-after(lower-case($prevTxtFrameLabel),'_c_'),'_')"/>
                              </xsl:when>
                          </xsl:choose>
                      </xsl:otherwise>
                  </xsl:choose>
              </xsl:if>
          </xsl:variable>
           
          
           
           <xsl:variable name="nxtTxtFrameSameColumn">
               <xsl:if test="not(string-length($curTxFramepageNo) = 0) and not(string-length($nxtTxFramepageNo) = 0)">
                   
                 <xsl:choose>
                     <xsl:when test="$curTxFramepageNo= $nxtTxFramepageNo">
                         <xsl:if test="not(string-length($curTxFrameColumn) = 0) and not(string-length($nxtTxFrameColumn) = 0)">
                             <xsl:choose>
                                 <xsl:when test="$curTxFrameColumn = $nxtTxFrameColumn">
                                     <xsl:value-of select="'true'"/>
                                 </xsl:when>
                                 <xsl:when test="not($curTxFrameColumn = $nxtTxFrameColumn)">
                                     <xsl:value-of select="'false'"/>
                                 </xsl:when>
                             </xsl:choose>
                         </xsl:if>
                     </xsl:when>
                 </xsl:choose>
               </xsl:if>
           </xsl:variable>
          
          <xsl:variable name="prevTxtFrameSameColumn">
              <xsl:if test="not(string-length($curTxFramepageNo) = 0) and not(string-length($prevTxFramepageNo) = 0)">
                  <xsl:choose>
                      <xsl:when test="$curTxFramepageNo= $prevTxFramepageNo">
                          <xsl:if test="not(string-length($curTxFrameColumn) = 0) and not(string-length($prevTxFrameColumn) = 0)">
                              <xsl:choose>
                                  <xsl:when test="$curTxFrameColumn = $prevTxFrameColumn">
                                      <xsl:value-of select="'true'"/>
                                  </xsl:when>
                                  <xsl:when test="not($curTxFrameColumn = $prevTxFrameColumn)">
                                      <xsl:value-of select="'false'"/>
                                  </xsl:when>
                              </xsl:choose>
                          </xsl:if>
                      </xsl:when>
                  </xsl:choose>
              </xsl:if>
          </xsl:variable>
           
           
        <!--  this is for taking the color of the random one libray object which is a rectangle in most of the cases that is grouped with the textframe -->
        <xsl:variable name="libraryColor">
            <xsl:choose>
                <xsl:when test="@FillColor">
                    <xsl:value-of select="@FillColor"/>
                </xsl:when>
                <xsl:when test="not(@FillColor)">
                    <xsl:value-of select="parent::Group/Rectangle[@FillColor][1]/@FillColor"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="fillColor">
            <xsl:if test="string-length($libraryColor) &gt; 0">
                <xsl:call-template name="color">
                    <xsl:with-param name="colorName" select="$libraryColor"/>
                </xsl:call-template>
            </xsl:if>
        </xsl:variable>
        
        
        <xsl:variable name="IT" select="(self::TextFrame/@ItemTransform)"/>
        <!--<xsl:variable name="Y" select="(parent::Spread/Page[1]/@ItemTransform)"/> -->
        <xsl:variable name="Y"> 
            <xsl:choose>
                <xsl:when test="parent::Group">
                    <xsl:value-of select="(ancestor::Spread/Page[1]/@ItemTransform)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="(parent::Spread/Page[1]/@ItemTransform)"/>
                </xsl:otherwise>
            </xsl:choose> 
        </xsl:variable>
        <xsl:variable name="PageOrigin" select="tokenize($Y,$separate)"/>
        <xsl:variable name="XOrigin" select="number($PageOrigin[5])"/>
        
        <xsl:variable name="PPT1" select="((self::TextFrame/Properties/PathGeometry/GeometryPathType[1]/PathPointArray[1]/PathPointType[1]/@Anchor))"/>
        <xsl:variable name="PPT2" select="((self::TextFrame/Properties/PathGeometry/GeometryPathType[1]/PathPointArray[1]/PathPointType[2]/@Anchor))"/>
        <xsl:variable name="PPT3" select="((self::TextFrame/Properties/PathGeometry/GeometryPathType[1]/PathPointArray[1]/PathPointType[3]/@Anchor))"/>
        <xsl:variable name="PPT4" select="((self::TextFrame/Properties/PathGeometry/GeometryPathType[1]/PathPointArray[1]/PathPointType[4]/@Anchor))"/>
        
        <xsl:variable name="TIT" select="tokenize($IT,$separate)"/>
        <xsl:variable name="One" select="tokenize($PPT1,$separate)"/>
        <xsl:variable name="Two" select="tokenize($PPT2,$separate)"/>
        <xsl:variable name="Three" select="tokenize($PPT3,$separate)"/>
        <xsl:variable name="Four" select="tokenize($PPT4,$separate)"/>
        
        <xsl:variable name="GroupOrigin" select="tokenize(parent::Group/@ItemTransform,$separate)"/>
        <xsl:variable name="GroupXOrigin" select="number($GroupOrigin[5])"/>
        
        
        
        <xsl:variable name="x1">
            <xsl:choose>
                <xsl:when test="$One[1] = '0'">
                    <xsl:value-of select="number($One[1])"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number(format-number(number($One[1]),'#.####'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="y1">
            <xsl:choose>
                <xsl:when test="$One[2] = '0'">
                    <xsl:value-of select="number($One[2])"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number(format-number(number($One[2]),'#.####'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable> 
        <xsl:variable name="x2">
            <xsl:choose>
                <xsl:when test="$Two[1] = '0'">
                    <xsl:value-of select="number($Two[1])"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number(format-number(number($Two[1]),'#.####'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="y2">
            <xsl:choose>
                <xsl:when test="$Two[2] = '0'">
                    <xsl:value-of select="number($Two[2])"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number(format-number(number($Two[2]),'#.####'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="x3">
            <xsl:choose>
                <xsl:when test="$Three[1] = '0'">
                    <xsl:value-of select="number($Three[1])"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number(format-number(number($Three[1]),'#.####'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="y3">
            <xsl:choose>
                <xsl:when test="$Three[2] = '0'">
                    <xsl:value-of select="number($Three[2])"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number(format-number(number($Three[2]),'#.####'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="x4">
            <xsl:choose>
                <xsl:when test="$Four[1] = '0'">
                    <xsl:value-of select="number($Four[1])"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number(format-number(number($Four[1]),'#.####'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="y4">
            <xsl:choose>
                <xsl:when test="$Four[2] = '0'">
                    <xsl:value-of select="number($Four[2])"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number(format-number(number($Four[2]),'#.####'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="a">
            <xsl:choose>
                <xsl:when test="$TIT[1] ='0'">
                    <xsl:value-of select="number($TIT[1])"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number(format-number(number($TIT[1]),'#.####'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="b">
            <xsl:choose>
                <xsl:when test="$TIT[2] ='0'">
                    <xsl:value-of select="number($TIT[2])"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number(format-number(number($TIT[2]),'#.####'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="c">
            <xsl:choose>
                <xsl:when test="$TIT[3] ='0'">
                    <xsl:value-of select="number($TIT[3])"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number(format-number(number($TIT[3]),'#.####'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="d">
            <xsl:choose>
                <xsl:when test="$TIT[4] ='0'">
                    <xsl:value-of select="number($TIT[4])"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number(format-number(number($TIT[4]),'#.####'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="tx">
            <xsl:choose>
                <xsl:when test="$TIT[5] ='0'">
                    <xsl:value-of select="number($TIT[5])"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number(format-number(number($TIT[5]),'#.####'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="ty">
            <xsl:choose>
                <xsl:when test="$TIT[6] ='0'">
                    <xsl:value-of select="number($TIT[6])"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number(format-number(number($TIT[6]),'#.####'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="Txorigin">
            <xsl:choose>
                <xsl:when test="parent::Group">
                    <xsl:value-of select="(($x1*$a)+($y1*$b)+$tx)+($GroupXOrigin)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="(($x1*$a)+($y1*$b)+$tx)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable> 
        
        <xsl:variable name="Tyorigin" select="($x1*$c)+($y1*$d)+$ty"/>
        
        
        <!--  <xsl:variable name="XOrigin" select="string($PageOrigin[5]) cast as xs:decimal"/>
        <xsl:variable name="Halfheight" select="abs(string($PageOrigin[6]) cast as xs:decimal)"/>-->
        <xsl:variable name="XOrigin">
            <xsl:choose>
                <xsl:when test="$PageOrigin[5] ='0'">
                    <xsl:value-of select="number($PageOrigin[5])"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number(format-number(number($PageOrigin[5]),'#.####'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="Halfheight">
            <xsl:choose>
                <xsl:when test="$PageOrigin[6] ='0'">
                    <xsl:value-of select="abs(number($PageOrigin[6]))"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="abs(number(format-number(number($PageOrigin[6]),'#.####')))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
           
          <xsl:element name="TextFrame">
                <xsl:attribute name="id" select="@Self"/>
                <xsl:attribute name="story" select="@ParentStory"/>
                <xsl:attribute name="previous" select="@PreviousTextFrame"/>
                <xsl:attribute name="next" select="@NextTextFrame"/>
              <!-- Added for boxgroup from spred on 11-03-2025 -->
                <xsl:attribute name="AppliedObjectStyle"><xsl:value-of select="substring-after(@AppliedObjectStyle,'ObjectStyle/')"/></xsl:attribute>
              <!-- end -->
                <xsl:if test="string-length($nxtTxFrameColumn) &gt; 0">
                    <xsl:attribute name="nxtTxFrameColumn" select="$nxtTxFrameColumn"/>
                </xsl:if>
                <xsl:if test="string-length($prevTxFrameColumn) &gt; 0">
                    <xsl:attribute name="prevTxFrameColumn" select="$prevTxFrameColumn"/>
                </xsl:if>
              
              <xsl:if test="string-length($nxtTxtFrameSameColumn) &gt; 0">
                  <xsl:attribute name="nxtTxtFrameSameColumn" select="$nxtTxtFrameSameColumn"/>
              </xsl:if>
              <xsl:if test="string-length($prevTxtFrameSameColumn) &gt; 0">
                  <xsl:attribute name="prevTxtFrameSameColumn" select="$prevTxtFrameSameColumn"/>
              </xsl:if>
              
                <xsl:call-template name="label"/>
                    <xsl:choose>
                        <xsl:when test="parent::Group">
                            <xsl:attribute name="pre-sib"  select="count(preceding-sibling::*)"/>
                            <xsl:attribute name="fol-sib"  select="count(following-sibling::*)"/>
                        
                        </xsl:when>
                    </xsl:choose>
              <xsl:if test="string-length($fillColor) &gt; 0">
                  <xsl:attribute name="libraryFillColor" select="$fillColor"/>
              </xsl:if>
              <!--  this is for taking the color of the random one libray object which is a rectangle in most of the cases that is grouped with the textframe -->
              <!--This condition and attirbute is applied for medstudy's purpose, if it is causing a problem, 
                    please remove the following condition along with the attribute-->
              <xsl:if test="lower-case(@Name) ='creditsource'">
                  <xsl:attribute name="name"  select="@Name"/>
              </xsl:if>
        <xsl:if test="$Txorigin &lt; 0">             
           
                <xsl:attribute name="id" select="@Self"/>
                
                <xsl:choose>
                    <xsl:when test="@ImageHyperLinkUD">
                        <xsl:choose>
                            <xsl:when test="contains(@ImageHyperLinkUD,'_TX_')">
                                <xsl:attribute name="ImageHyperLinkUD" select="substring-before(@ImageHyperLinkUD,'_TX_')"/>
                            </xsl:when>
                            <xsl:when test="not(contains(@ImageHyperLinkUD,'_TX_'))">
                                <xsl:attribute name="ImageHyperLinkUD" select="@ImageHyperLinkUD"/>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:attribute name="ParaInfo" select="@ImageHyperLinkUD"/>
                    </xsl:when>
                </xsl:choose>
                
                <xsl:attribute name="page" select="'verso'"/>
            
                <xsl:attribute name="previous" select="@PreviousTextFrame"/>
                <xsl:attribute name="next" select="@NextTextFrame"/>
                <xsl:choose>
                    <xsl:when test="parent::Group">
                        <xsl:attribute name="pre-sib"  select="count(preceding-sibling::*)"/>
                        <xsl:attribute name="fol-sib"  select="count(following-sibling::*)"/>
                    </xsl:when>
                </xsl:choose>
                
                <xsl:variable name="Txorigin1" select="abs($XOrigin) + $Txorigin"/>
                
                <xsl:element name="Txorigin">
                    <xsl:value-of select="$Txorigin1"/>
                </xsl:element>
                <xsl:if test="$Tyorigin &lt; 0">
                    <xsl:element name="Tyorigin">
                        <xsl:value-of select="($Halfheight - abs($Tyorigin))"/>
                    </xsl:element></xsl:if>
                
                <xsl:if test="$Tyorigin &gt;= 0">
                    <xsl:element name="Tyorigin">
                        <xsl:value-of select="($Tyorigin + $Halfheight)"/>
                    </xsl:element></xsl:if>
                
                <xsl:if test="$x1 &gt; $x3">
                    <xsl:element name="width">
                        <xsl:value-of select="abs(($x1) - ($x3))"/>
                    </xsl:element>
                </xsl:if>
                <xsl:if test="$x1 &lt; $x3">
                    <xsl:element name="width">
                        <xsl:value-of select="abs(($x3) - ($x1))"/>
                    </xsl:element>
                </xsl:if>
                
                
                <xsl:if test="$y1 &gt; $y3">
                    <xsl:element name="height">
                        <xsl:value-of select="abs(($y1) - ($y3))"/>
                    </xsl:element>
                </xsl:if>
                <xsl:if test="$y1 &lt; $y3">
                    <xsl:element name="height">
                        <xsl:value-of select="abs(($y3) - ($y1))"/>
                    </xsl:element>
                </xsl:if>        
            
        </xsl:if>
        
        <xsl:if test="$Txorigin &gt;= 0">
           
                <xsl:attribute name="id" select="@Self"/>
                <xsl:choose>
                    <xsl:when test="@ImageHyperLinkUD">
                        <xsl:choose>
                            <xsl:when test="contains(@ImageHyperLinkUD,'_TX_')">
                                <xsl:attribute name="ImageHyperLinkUD" select="substring-before(@ImageHyperLinkUD,'_TX_')"/>
                            </xsl:when>
                            <xsl:when test="not(contains(@ImageHyperLinkUD,'_TX_'))">
                                <xsl:attribute name="ImageHyperLinkUD" select="@ImageHyperLinkUD"/>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:attribute name="ParaInfo" select="@ImageHyperLinkUD"/>
                    </xsl:when>
                </xsl:choose>
                <xsl:attribute name="page" select="'recto'"/>
             
                <xsl:attribute name="previous" select="@PreviousTextFrame"/>
                <xsl:attribute name="next" select="@NextTextFrame"/>
                <xsl:choose>
                    <xsl:when test="parent::Group">
                        <xsl:attribute name="pre-sib"  select="count(preceding-sibling::*)"/>
                        <xsl:attribute name="fol-sib"  select="count(following-sibling::*)"/>
                    </xsl:when>
                </xsl:choose>
                <xsl:element name="Txorigin">
                    <xsl:value-of select="$Txorigin"/>
                </xsl:element>
                
                <xsl:if test="$Tyorigin &lt; 0">
                    <xsl:element name="Tyorigin">
                        <xsl:value-of select="($Halfheight - abs($Tyorigin))"/>
                    </xsl:element></xsl:if>
                
                <xsl:if test="$Tyorigin &gt;= 0">
                    <xsl:element name="Tyorigin">
                        <xsl:value-of select="($Tyorigin + $Halfheight)"/>
                    </xsl:element></xsl:if>
                
                
                <xsl:if test="$x1 &gt; $x3">
                    <xsl:element name="width">
                        <xsl:value-of select="abs(($x1) - ($x3))"/>
                    </xsl:element>
                </xsl:if>
                <xsl:if test="$x1 &lt; $x3">
                    <xsl:element name="width">
                        <xsl:value-of select="abs(($x3) - ($x1))"/>
                    </xsl:element>
                </xsl:if>
                

                <xsl:if test="$y1 &gt; $y3">
                    <xsl:element name="height">
                        <xsl:value-of select="abs(($y1) - ($y3))"/>
                    </xsl:element>
                </xsl:if>
                <xsl:if test="$y1 &lt; $y3">
                    <xsl:element name="height">
                        <xsl:value-of select="abs(($y3) - ($y1))"/>
                    </xsl:element>
                </xsl:if>
            
        </xsl:if>
             </xsl:element>
        
        <xsl:if test="$textPath">
            <xsl:element name="TextFrame">
                <xsl:attribute name="story" select="$textPath"/>
                <xsl:attribute name="previous" select="'n'"/>
                <xsl:attribute name="next" select="'n'"/>
                <xsl:attribute name="id" select="@Self"/>
                <xsl:attribute name="custom" select="'textPath'"></xsl:attribute>
                <!-- Added for boxgroup from spred on 11-03-2025 -->
                <xsl:attribute name="AppliedObjectStyle"><xsl:value-of select="substring-after(@AppliedObjectStyle,'ObjectStyle/')"/></xsl:attribute>
                <!-- End -->
                <xsl:if test="string-length($nxtTxFrameColumn) &gt; 0">
                    <xsl:attribute name="nxtTxFrameColumn" select="$nxtTxFrameColumn"/>
                </xsl:if>
                <xsl:if test="string-length($prevTxFrameColumn) &gt; 0">
                    <xsl:attribute name="prevTxFrameColumn" select="$prevTxFrameColumn"/>
                </xsl:if>
                
                <xsl:if test="string-length($nxtTxtFrameSameColumn) &gt; 0">
                    <xsl:attribute name="nxtTxtFrameSameColumn" select="$nxtTxtFrameSameColumn"/>
                </xsl:if>
                <xsl:if test="string-length($prevTxtFrameSameColumn) &gt; 0">
                    <xsl:attribute name="prevTxtFrameSameColumn" select="$prevTxtFrameSameColumn"/>
                </xsl:if>
                
                <xsl:call-template name="label"/>
                <xsl:choose>
                    <xsl:when test="parent::Group">
                        <xsl:attribute name="pre-sib"  select="count(preceding-sibling::*)"/>
                        <xsl:attribute name="fol-sib"  select="count(following-sibling::*)"/>
                        
                    </xsl:when>
                </xsl:choose>
                <xsl:if test="string-length($fillColor) &gt; 0">
                    <xsl:attribute name="libraryFillColor" select="$fillColor"/>
                </xsl:if>
                <!--  this is for taking the color of the random one libray object which is a rectangle in most of the cases that is grouped with the textframe -->
                <!--This condition and attirbute is applied for medstudy's purpose, if it is causing a problem, 
                    please remove the following condition along with the attribute-->
          
                <xsl:if test="$Txorigin &lt; 0">             
                    
                    <xsl:choose>
                        <xsl:when test="@ImageHyperLinkUD">
                            <xsl:choose>
                                <xsl:when test="contains(@ImageHyperLinkUD,'_TX_')">
                                    <xsl:attribute name="ImageHyperLinkUD" select="substring-before(@ImageHyperLinkUD,'_TX_')"/>
                                </xsl:when>
                                <xsl:when test="not(contains(@ImageHyperLinkUD,'_TX_'))">
                                    <xsl:attribute name="ImageHyperLinkUD" select="@ImageHyperLinkUD"/>
                                </xsl:when>
                            </xsl:choose>
                            <xsl:attribute name="ParaInfo" select="@ImageHyperLinkUD"/>
                        </xsl:when>
                    </xsl:choose>
                    
                    <xsl:attribute name="page" select="'verso'"/>
                    
                    <xsl:choose>
                        <xsl:when test="parent::Group">
                            <xsl:attribute name="pre-sib"  select="count(preceding-sibling::*)"/>
                            <xsl:attribute name="fol-sib"  select="count(following-sibling::*)"/>
                        </xsl:when>
                    </xsl:choose>
                    
                    <xsl:variable name="Txorigin1" select="abs($XOrigin) + $Txorigin"/>
                    
                    <xsl:element name="Txorigin">
                        <xsl:value-of select="$Txorigin1"/>
                    </xsl:element>
                    <xsl:if test="$Tyorigin &lt; 0">
                        <xsl:element name="Tyorigin">
                            <xsl:value-of select="($Halfheight - abs($Tyorigin))"/>
                        </xsl:element></xsl:if>
                    
                    <xsl:if test="$Tyorigin &gt;= 0">
                        <xsl:element name="Tyorigin">
                            <xsl:value-of select="($Tyorigin + $Halfheight)"/>
                        </xsl:element></xsl:if>
                    
                    <xsl:if test="$x1 &gt; $x3">
                        <xsl:element name="width">
                            <xsl:value-of select="abs(($x1) - ($x3))"/>
                        </xsl:element>
                    </xsl:if>
                    <xsl:if test="$x1 &lt; $x3">
                        <xsl:element name="width">
                            <xsl:value-of select="abs(($x3) - ($x1))"/>
                        </xsl:element>
                    </xsl:if>
                    
                    
                    <xsl:if test="$y1 &gt; $y3">
                        <xsl:element name="height">
                            <xsl:value-of select="abs(($y1) - ($y3))"/>
                        </xsl:element>
                    </xsl:if>
                    <xsl:if test="$y1 &lt; $y3">
                        <xsl:element name="height">
                            <xsl:value-of select="abs(($y3) - ($y1))"/>
                        </xsl:element>
                    </xsl:if>        
                    
                </xsl:if>
                
                <xsl:if test="$Txorigin &gt;= 0">
                    
                    <xsl:choose>
                        <xsl:when test="@ImageHyperLinkUD">
                            <xsl:choose>
                                <xsl:when test="contains(@ImageHyperLinkUD,'_TX_')">
                                    <xsl:attribute name="ImageHyperLinkUD" select="substring-before(@ImageHyperLinkUD,'_TX_')"/>
                                </xsl:when>
                                <xsl:when test="not(contains(@ImageHyperLinkUD,'_TX_'))">
                                    <xsl:attribute name="ImageHyperLinkUD" select="@ImageHyperLinkUD"/>
                                </xsl:when>
                            </xsl:choose>
                            <xsl:attribute name="ParaInfo" select="@ImageHyperLinkUD"/>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:attribute name="page" select="'recto'"/>
                    
                    <xsl:choose>
                        <xsl:when test="parent::Group">
                            <xsl:attribute name="pre-sib"  select="count(preceding-sibling::*)"/>
                            <xsl:attribute name="fol-sib"  select="count(following-sibling::*)"/>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:element name="Txorigin">
                        <xsl:value-of select="$Txorigin"/>
                    </xsl:element>
                    
                    <xsl:if test="$Tyorigin &lt; 0">
                        <xsl:element name="Tyorigin">
                            <xsl:value-of select="($Halfheight - abs($Tyorigin))"/>
                        </xsl:element></xsl:if>
                    
                    <xsl:if test="$Tyorigin &gt;= 0">
                        <xsl:element name="Tyorigin">
                            <xsl:value-of select="($Tyorigin + $Halfheight)"/>
                        </xsl:element></xsl:if>
                    
                    
                    <xsl:if test="$x1 &gt; $x3">
                        <xsl:element name="width">
                            <xsl:value-of select="abs(($x1) - ($x3))"/>
                        </xsl:element>
                    </xsl:if>
                    <xsl:if test="$x1 &lt; $x3">
                        <xsl:element name="width">
                            <xsl:value-of select="abs(($x3) - ($x1))"/>
                        </xsl:element>
                    </xsl:if>
                    
                    
                    <xsl:if test="$y1 &gt; $y3">
                        <xsl:element name="height">
                            <xsl:value-of select="abs(($y1) - ($y3))"/>
                        </xsl:element>
                    </xsl:if>
                    <xsl:if test="$y1 &lt; $y3">
                        <xsl:element name="height">
                            <xsl:value-of select="abs(($y3) - ($y1))"/>
                        </xsl:element>
                    </xsl:if>
                    
                </xsl:if>
            </xsl:element>
        </xsl:if>
        
      </xsl:template>
    
    <!-- to remove author queries 'S4C_AuthorQuery' and the paraId labled textframe are removed specifically for the SPRINGER   -->
    <xsl:template match="TextFrame[Properties/Label/KeyValuePair/@Value='S4C_AuthorQuery']|TextFrame[Properties/Label/KeyValuePair/@Value='ParaID']|TextFrame[starts-with(lower-case(@Name),'notes_id')]"/>
    <!--<xsl:template match="TextFrame[Properties/Label/KeyValuePair]">
        <xsl:choose>
            <xsl:when test="TextFrame[Properties/Label/KeyValuePair/@Value='S4C_AuthorQuery']"></xsl:when>
            <xsl:when test="TextFrame[Properties/Label/KeyValuePair/@Value='ParaID']"></xsl:when>
            <xsl:when test="contains(TextFrame[Properties/Label/KeyValuePair/@Value],'Notes_id')"></xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>-->
    <!-- to remove paste board items from the indesign file 'PasteboardItems'    -->
    
    <xsl:template match="TextFrame[lower-case(@Name) ='pasteboarditems']|Rectangle[lower-case(@Name) ='pasteboarditems']|Group[lower-case(@Name) ='pasteboarditems']"/>
    
    <xsl:template match="*[Properties/Label/KeyValuePair[contains(lower-case(@Value),'_y_')]]" name="label" mode="label">
        <xsl:variable name="textFrameId">
            <xsl:value-of select="Properties/Label/KeyValuePair[contains(lower-case(@Value),'_y_')][1]/@Value"/>
        </xsl:variable>
        <xsl:variable name="pageNo">
            <xsl:choose>
                <xsl:when test="not(contains(substring-after(lower-case($textFrameId),'p_'),'_'))">
                    <xsl:choose>
                        <xsl:when test="contains(lower-case($textFrameId),'p_')">
                            <xsl:value-of select="substring-after(lower-case($textFrameId),'p_')"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:choose>
                        <xsl:when test="contains(lower-case($textFrameId),'p_')">
                            <xsl:value-of select="substring-before(substring-after(lower-case($textFrameId),'p_'),'_')"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="txFrameY">
            <xsl:choose>
                <xsl:when test="not(contains(substring-after(lower-case($textFrameId),'_y_'),'_'))">
                    <xsl:choose>
                        <xsl:when test="contains(lower-case($textFrameId),'_y_')">
                            <xsl:value-of select="substring-after(lower-case($textFrameId),'_y_')"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:choose>
                        <xsl:when test="contains(lower-case($textFrameId),'_y_')">
                            <xsl:value-of select="substring-before(substring-after(lower-case($textFrameId),'_y_'),'_')"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="txFrameX">
            <xsl:choose>
                <xsl:when test="not(contains(substring-after(lower-case($textFrameId),'_x_'),'_'))">
                    <xsl:choose>
                        <xsl:when test="contains(lower-case($textFrameId),'_x_')">
                            <xsl:value-of select="substring-after(lower-case($textFrameId),'_x_')"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:choose>
                        <xsl:when test="contains(lower-case($textFrameId),'_x_')">
                            <xsl:value-of select="substring-before(substring-after(lower-case($textFrameId),'_x_'),'_')"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="width">
            <xsl:choose>
                <xsl:when test="not(contains(substring-after(lower-case($textFrameId),'_w_'),'_'))">
                    <xsl:choose>
                        <xsl:when test="contains(lower-case($textFrameId),'_w_')">
                            <xsl:value-of select="substring-after(lower-case($textFrameId),'_w_')"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:choose>
                        <xsl:when test="contains(lower-case($textFrameId),'_w_')">
                            <xsl:value-of select="substring-before(substring-after(lower-case($textFrameId),'_w_'),'_')"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="height">
            <xsl:choose>
                <xsl:when test="not(contains(substring-after(lower-case($textFrameId),'_h_'),'_'))">
                    <xsl:choose>
                        <xsl:when test="contains(lower-case($textFrameId),'_h_')">
                            <xsl:value-of select="substring-after(lower-case($textFrameId),'_h_')"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:choose>
                        <xsl:when test="contains(lower-case($textFrameId),'_h_')">
                            <xsl:value-of select="substring-before(substring-after(lower-case($textFrameId),'_h_'),'_')"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="column">
            <xsl:choose>
                <xsl:when test="not(contains(substring-after(lower-case($textFrameId),'_c_'),'_'))">
                    <xsl:choose>
                        <xsl:when test="contains(lower-case($textFrameId),'_c_')">
                            <xsl:value-of select="substring-after(lower-case($textFrameId),'_c_')"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:choose>
                        <xsl:when test="contains(lower-case($textFrameId),'_c_')">
                            <xsl:value-of select="substring-before(substring-after(lower-case($textFrameId),'_c_'),'_')"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:if test="string-length($pageNo) &gt; 0">
            <xsl:attribute name="pageNo" select="$pageNo"/>
            <xsl:attribute name="pageNo_rowman_2_int">
                <xsl:choose>
                    <xsl:when test="not(matches($pageNo,'^\d+$'))">
                        <xsl:variable name="RomanIntVal_upperCase" select="upper-case($pageNo)"/>
                        <xsl:variable name="RomanIntVal" select="number:RomanToInteger($RomanIntVal_upperCase, 0)"/>
                        <xsl:value-of select="concat('-',$RomanIntVal)"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$pageNo"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="string-length($txFrameY) &gt; 0">
            <xsl:attribute name="txFrameY" select="$txFrameY"/>
        </xsl:if>
        <xsl:if test="string-length($txFrameX) &gt; 0">
            <xsl:attribute name="txFrameX" select="$txFrameX"/>
        </xsl:if>
        <xsl:if test="string-length($width) &gt; 0">
            <xsl:attribute name="width" select="$width"/>
        </xsl:if>
        <xsl:if test="string-length($height) &gt; 0">
            <xsl:attribute name="height" select="$height"/>
        </xsl:if>
        <xsl:if test="string-length($column) &gt; 0">
            <xsl:attribute name="column" select="$column"/>
        </xsl:if>
    
    </xsl:template>
    
    <xsl:template match="Rectangle | Oval | Oval[descendant::TextPath[@ParentStory]] | Rectangle[descendant::TextPath[@ParentStory]] 
        | Polygon[descendant::TextPath[@ParentStory]] | GraphicLine[descendant::TextPath[@ParentStory]]">
        
        <xsl:param name="separate" select="' '"/>
        <xsl:variable name="libraryColor">
            <xsl:if test="@FillColor">
                <xsl:value-of select="@FillColor"/>
            </xsl:if>
        </xsl:variable>
        <xsl:variable name="fillColor">
            <xsl:if test="string-length($libraryColor) &gt; 0">
                <xsl:call-template name="color">
                    <xsl:with-param name="colorName" select="$libraryColor"/>
                </xsl:call-template>
            </xsl:if>
        </xsl:variable>
        <xsl:variable name="parentStory" select="self::*/descendant::TextPath/@ParentStory"/>
        <xsl:variable name="elementName">
            <xsl:choose>
                <xsl:when test="$parentStory">
                    <xsl:value-of select="'TextFrame'"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="self::*/local-name()"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="previous">
            <xsl:choose>
                <xsl:when test="$parentStory">
                    <xsl:value-of select="'n'"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="@PreviousTextFrame"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="next">
            <xsl:choose>
                <xsl:when test="$parentStory">
                    <xsl:value-of select="'n'"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="@NextTextFrame"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="IT" select="(self::*/@ItemTransform)"/>
        <!--<xsl:variable name="Y" select="(parent::Spread/Page[1]/@ItemTransform)"/> -->
        <xsl:variable name="Y"> 
            <xsl:choose>
                <xsl:when test="parent::Group">
                    <xsl:value-of select="(ancestor::Spread/Page[1]/@ItemTransform)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="(parent::Spread/Page[1]/@ItemTransform)"/>
                </xsl:otherwise>
            </xsl:choose> 
        </xsl:variable>
        <xsl:variable name="PageOrigin" select="tokenize($Y,$separate)"/>
        <xsl:variable name="XOrigin" select="number($PageOrigin[5])"/>        
        <xsl:variable name="PPT1" select="((self::*/Properties/PathGeometry/GeometryPathType[1]/PathPointArray[1]/PathPointType[1]/@Anchor))"/>
        <xsl:variable name="PPT2" select="((self::*/Properties/PathGeometry/GeometryPathType[1]/PathPointArray[1]/PathPointType[2]/@Anchor))"/>
        <xsl:variable name="PPT3" select="((self::*/Properties/PathGeometry/GeometryPathType[1]/PathPointArray[1]/PathPointType[3]/@Anchor))"/>
        <xsl:variable name="PPT4" select="((self::*/Properties/PathGeometry/GeometryPathType[1]/PathPointArray[1]/PathPointType[4]/@Anchor))"/>        
        <xsl:variable name="TIT" select="tokenize($IT,$separate)"/>
        <xsl:variable name="One" select="tokenize($PPT1,$separate)"/>
        <xsl:variable name="Two" select="tokenize($PPT2,$separate)"/>
        <xsl:variable name="Three" select="tokenize($PPT3,$separate)"/>
        <xsl:variable name="Four" select="tokenize($PPT4,$separate)"/>        
        <xsl:variable name="GroupOrigin" select="tokenize(parent::Group/@ItemTransform,$separate)"/>
        <xsl:variable name="GroupXOrigin" select="number($GroupOrigin[5])"/>
        <xsl:variable name="x1">
            <xsl:choose>
                <xsl:when test="$One[1] = '0'">
                    <xsl:value-of select="number($One[1])"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number(format-number(number($One[1]),'#.####'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="y1">
            <xsl:choose>
                <xsl:when test="$One[2] = '0'">
                    <xsl:value-of select="number($One[2])"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number(format-number(number($One[2]),'#.####'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable> 
        <xsl:variable name="x2">
            <xsl:choose>
                <xsl:when test="$Two[1] = '0'">
                    <xsl:value-of select="number($Two[1])"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number(format-number(number($Two[1]),'#.####'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="y2">
            <xsl:choose>
                <xsl:when test="$Two[2] = '0'">
                    <xsl:value-of select="number($Two[2])"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number(format-number(number($Two[2]),'#.####'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="x3">
            <xsl:choose>
                <xsl:when test="$Three[1] = '0'">
                    <xsl:value-of select="number($Three[1])"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number(format-number(number($Three[1]),'#.####'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="y3">
            <xsl:choose>
                <xsl:when test="$Three[2] = '0'">
                    <xsl:value-of select="number($Three[2])"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number(format-number(number($Three[2]),'#.####'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="x4">
            <xsl:choose>
                <xsl:when test="$Four[1] = '0'">
                    <xsl:value-of select="number($Four[1])"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number(format-number(number($Four[1]),'#.####'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="y4">
            <xsl:choose>
                <xsl:when test="$Four[2] = '0'">
                    <xsl:value-of select="number($Four[2])"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number(format-number(number($Four[2]),'#.####'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>        
        <xsl:variable name="a">
            <xsl:choose>
                <xsl:when test="$TIT[1] ='0'">
                    <xsl:value-of select="number($TIT[1])"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number(format-number(number($TIT[1]),'#.####'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="b">
            <xsl:choose>
                <xsl:when test="$TIT[2] ='0'">
                    <xsl:value-of select="number($TIT[2])"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number(format-number(number($TIT[2]),'#.####'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="c">
            <xsl:choose>
                <xsl:when test="$TIT[3] ='0'">
                    <xsl:value-of select="number($TIT[3])"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number(format-number(number($TIT[3]),'#.####'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="d">
            <xsl:choose>
                <xsl:when test="$TIT[4] ='0'">
                    <xsl:value-of select="number($TIT[4])"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number(format-number(number($TIT[4]),'#.####'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="tx">
            <xsl:choose>
                <xsl:when test="$TIT[5] ='0'">
                    <xsl:value-of select="number($TIT[5])"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number(format-number(number($TIT[5]),'#.####'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="ty">
            <xsl:choose>
                <xsl:when test="$TIT[6] ='0'">
                    <xsl:value-of select="number($TIT[6])"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number(format-number(number($TIT[6]),'#.####'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>                
        <xsl:variable name="Txorigin">
            <xsl:choose>
                <xsl:when test="parent::Group">
                    <xsl:value-of select="floor((($x1*$a)+($y1*$b)+$tx)+($GroupXOrigin))"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="floor((($x1*$a)+($y1*$b)+$tx))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="Tyorigin" select="($x1*$c)+($y1*$d)+$ty"/>
        <!--  <xsl:variable name="XOrigin" select="string($PageOrigin[5]) cast as xs:decimal"/>
        <xsl:variable name="Halfheight" select="abs(string($PageOrigin[6]) cast as xs:decimal)"/>-->
        <xsl:variable name="XOrigin">
            <xsl:choose>
                <xsl:when test="$PageOrigin[5] ='0'">
                    <xsl:value-of select="number($PageOrigin[5])"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number(format-number(number($PageOrigin[5]),'#.####'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="Halfheight">
            <xsl:choose>
                <xsl:when test="$PageOrigin[6] ='0'">
                    <xsl:value-of select="abs(number($PageOrigin[6]))"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="abs(number(format-number(number($PageOrigin[6]),'#.####')))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>        
        
        <xsl:if test="$Txorigin &lt; 0">  
            <!--<xsl:message select="$Txorigin">:</xsl:message>-->
            <xsl:element name="{$elementName}">
                <xsl:attribute name="data-pageitem" select="'yes'"/>
                <xsl:if test="$parentStory">
                    <xsl:attribute name="story" select="$parentStory"/>
                </xsl:if>
                <xsl:if test="$parentStory">
                    <xsl:attribute name="selfElementName" select="self::*/local-name()"/>
                </xsl:if>
                <xsl:call-template name="label"/>
                <xsl:attribute name="id" select="@Self"/>
                <xsl:if test="string-length($fillColor) &gt; 0">
                    <xsl:attribute name="libraryFillColor" select="$fillColor"/>
                </xsl:if>
                <xsl:choose>
                    <xsl:when test="@ImageHyperLinkUD">
                        <xsl:choose>
                            <xsl:when test="contains(@ImageHyperLinkUD,'_TX_')">
                                <xsl:attribute name="ImageHyperLinkUD" select="substring-before(@ImageHyperLinkUD,'_TX_')"/>
                            </xsl:when>
                            <xsl:when test="not(contains(@ImageHyperLinkUD,'_TX_'))">
                                <xsl:attribute name="ImageHyperLinkUD" select="@ImageHyperLinkUD"/>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:attribute name="ParaInfo" select="@ImageHyperLinkUD"/>
                    </xsl:when>
                </xsl:choose>
                
                <xsl:attribute name="page" select="'verso'"/>
                <xsl:if test="self::*/Image">
                    <xsl:variable name="link">
                        <xsl:variable name="local" select="tokenize(self::Rectangle/Image/Link/@LinkResourceURI,'/')[last()]"/>
                        <xsl:value-of select="replace($local,'%20',' ')"/>
                    </xsl:variable>
                    <xsl:attribute name="Image" select="$link"/>
                </xsl:if>
                <xsl:if test="self::*/EPS">
                    <xsl:variable name="link">
                        <xsl:variable name="local" select="tokenize(self::Rectangle/EPS/Link/@LinkResourceURI,'/')[last()]"/>
                        <xsl:value-of select="replace($local,'%20',' ')"/>
                    </xsl:variable>
                    <xsl:attribute name="Image" select="$link"/>
                </xsl:if>   
                <xsl:if test="self::*/PDF">
                    <xsl:variable name="link">
                        <xsl:variable name="local" select="tokenize(self::Rectangle/PDF/Link/@LinkResourceURI,'/')[last()]"/>
                        <xsl:value-of select="replace($local,'%20',' ')"/>
                    </xsl:variable>
                    <xsl:attribute name="Image" select="$link"/>
                </xsl:if>   
                <xsl:if test="self::*/Image">
                    <xsl:variable name="link">
                        <xsl:variable name="local" select="self::Rectangle/Image/Link/@LinkResourceURI"/>
                        <xsl:value-of select="replace($local,'%20',' ')"/>
                    </xsl:variable>
                    <xsl:attribute name="ImagePath" select="$link"/>
                </xsl:if>
                <xsl:if test="self::*/EPS">
                    <xsl:variable name="link">
                        <xsl:variable name="local" select="self::Rectangle/EPS/Link/@LinkResourceURI"/>
                        <xsl:value-of select="replace($local,'%20',' ')"/>
                    </xsl:variable>
                    <xsl:attribute name="ImagePath" select="$link"/>
                </xsl:if>   
                <xsl:if test="self::*/PDF">
                    <xsl:variable name="link">
                        <xsl:variable name="local" select="self::Rectangle/PDF/Link/@LinkResourceURI"/>
                        <xsl:value-of select="replace($local,'%20',' ')"/>
                    </xsl:variable>
                    <xsl:attribute name="ImagePath" select="$link"/>
                </xsl:if> 
                <xsl:attribute name="previous" select="$previous"/>
                <xsl:attribute name="next" select="$next"/>
                <xsl:choose>
                    <xsl:when test="parent::Group">
                        <xsl:attribute name="pre-sib"  select="count(preceding-sibling::*)"/>
                        <xsl:attribute name="fol-sib"  select="count(following-sibling::*)"/>
                    </xsl:when>
                </xsl:choose>
                
                <xsl:variable name="Txorigin1" select="abs($XOrigin) + $Txorigin"/>
                
                <xsl:element name="Txorigin">
                    <xsl:value-of select="$Txorigin1"/>
                </xsl:element>
                <xsl:if test="$Tyorigin &lt; 0">
                    <xsl:element name="Tyorigin">
                        <xsl:value-of select="($Halfheight - abs($Tyorigin))"/>
                    </xsl:element></xsl:if>
                
                <xsl:if test="$Tyorigin &gt;= 0">
                    <xsl:element name="Tyorigin">
                        <xsl:value-of select="($Tyorigin + $Halfheight)"/>
                    </xsl:element></xsl:if>
                
                <xsl:if test="$x1 &gt; $x3">
                    <xsl:element name="width">
                        <xsl:value-of select="abs(($x1) - ($x3))"/>
                    </xsl:element>
                </xsl:if>
                <xsl:if test="$x1 &lt; $x3">
                    <xsl:element name="width">
                        <xsl:value-of select="abs(($x3) - ($x1))"/>
                    </xsl:element>
                </xsl:if>
                
                
                <xsl:if test="$y1 &gt; $y3">
                    <xsl:element name="height">
                        <xsl:value-of select="abs(($y1) - ($y3))"/>
                    </xsl:element>
                </xsl:if>
                <xsl:if test="$y1 &lt; $y3">
                    <xsl:element name="height">
                        <xsl:value-of select="abs(($y3) - ($y1))"/>
                    </xsl:element>
                    
                    
                    
                    
                </xsl:if>
                
                <!-- 02-JULY-19 -->
                <xsl:if test="descendant::TextFrame">
                    <xsl:for-each select="TextFrame">                        
                           <xsl:call-template name="TF"/>                        
                    </xsl:for-each>
                </xsl:if>
            </xsl:element>
            <xsl:apply-templates/>
        </xsl:if>
        
        <xsl:if test="$Txorigin &gt;= 0">
            <xsl:element name="{$elementName}">
                <xsl:attribute name="data-pageitem" select="'yes'"/>
                <xsl:if test="$parentStory">
                    <xsl:attribute name="story" select="$parentStory"/>
                </xsl:if>
                <xsl:if test="$parentStory">
                    <xsl:attribute name="selfElementName" select="self::*/local-name()"/>
                </xsl:if>
                <xsl:call-template name="label"/>
                <xsl:attribute name="id" select="@Self"/>
                <xsl:if test="string-length($fillColor) &gt; 0">
                    <xsl:attribute name="libraryFillColor" select="$fillColor"/>
                </xsl:if>
                <xsl:choose>
                    <xsl:when test="@ImageHyperLinkUD">
                        <xsl:choose>
                            <xsl:when test="contains(@ImageHyperLinkUD,'_TX_')">
                                <xsl:attribute name="ImageHyperLinkUD" select="substring-before(@ImageHyperLinkUD,'_TX_')"/>
                            </xsl:when>
                            <xsl:when test="not(contains(@ImageHyperLinkUD,'_TX_'))">
                                <xsl:attribute name="ImageHyperLinkUD" select="@ImageHyperLinkUD"/>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:attribute name="ParaInfo" select="@ImageHyperLinkUD"/>
                    </xsl:when>
                </xsl:choose>
                <xsl:attribute name="page" select="'recto'"/>
                <xsl:if test="self::*/Image">
                    <xsl:variable name="link">
                        <xsl:variable name="local" select="tokenize(self::Rectangle/Image/Link/@LinkResourceURI,'/')[last()]"/>
                        <xsl:value-of select="replace($local,'%20',' ')"/>
                    </xsl:variable>
                    <xsl:attribute name="Image" select="$link"/>
                </xsl:if>
                <xsl:if test="self::*/EPS">
                    <xsl:variable name="link">
                        <xsl:variable name="local" select="tokenize(self::Rectangle/EPS/Link/@LinkResourceURI,'/')[last()]"/>
                        <xsl:value-of select="replace($local,'%20',' ')"/>
                    </xsl:variable>
                    <xsl:attribute name="Image" select="$link"/>
                </xsl:if>   
                <xsl:if test="self::*/PDF">
                    <xsl:variable name="link">
                        <xsl:variable name="local" select="tokenize(self::Rectangle/PDF/Link/@LinkResourceURI,'/')[last()]"/>
                        <xsl:value-of select="replace($local,'%20',' ')"/>
                    </xsl:variable>
                    <xsl:attribute name="Image" select="$link"/>
                </xsl:if>   
                <xsl:if test="self::*/Image">
                    <xsl:variable name="link">
                        <xsl:variable name="local" select="self::Rectangle/Image/Link/@LinkResourceURI"/>
                        <xsl:value-of select="replace($local,'%20',' ')"/>
                    </xsl:variable>
                    <xsl:attribute name="ImagePath" select="$link"/>
                </xsl:if>
                <xsl:if test="self::*/EPS">
                    <xsl:variable name="link">
                        <xsl:variable name="local" select="self::Rectangle/EPS/Link/@LinkResourceURI"/>
                        <xsl:value-of select="replace($local,'%20',' ')"/>
                    </xsl:variable>
                    <xsl:attribute name="ImagePath" select="$link"/>
                </xsl:if>   
                <xsl:if test="self::*/PDF">
                    <xsl:variable name="link">
                        <xsl:variable name="local" select="self::Rectangle/PDF/Link/@LinkResourceURI"/>
                        <xsl:value-of select="replace($local,'%20',' ')"/>
                    </xsl:variable>
                    <xsl:attribute name="ImagePath" select="$link"/>
                </xsl:if> 
                <xsl:attribute name="previous" select="$previous"/>
                <xsl:attribute name="next" select="$next"/>
                <xsl:choose>
                    <xsl:when test="parent::Group">
                        <xsl:attribute name="pre-sib"  select="count(preceding-sibling::*)"/>
                        <xsl:attribute name="fol-sib"  select="count(following-sibling::*)"/>
                    </xsl:when>
                </xsl:choose>
                <xsl:element name="Txorigin">
                    <xsl:value-of select="$Txorigin"/>
                </xsl:element>
                
                <xsl:if test="$Tyorigin &lt; 0">
                    <xsl:element name="Tyorigin">
                        <xsl:value-of select="($Halfheight - abs($Tyorigin))"/>
                    </xsl:element></xsl:if>
                
                <xsl:if test="$Tyorigin &gt;= 0">
                    <xsl:element name="Tyorigin">
                        <xsl:value-of select="($Tyorigin + $Halfheight)"/>
                    </xsl:element></xsl:if>
                
                
                <xsl:if test="$x1 &gt; $x3">
                    <xsl:element name="width">
                        <xsl:value-of select="abs(($x1) - ($x3))"/>
                    </xsl:element>
                </xsl:if>
                <xsl:if test="$x1 &lt; $x3">
                    <xsl:element name="width">
                        <xsl:value-of select="abs(($x3) - ($x1))"/>
                    </xsl:element>
                </xsl:if>
                

                <xsl:if test="$y1 &gt; $y3">
                    <xsl:element name="height">
                        <xsl:value-of select="abs(($y1) - ($y3))"/>
                    </xsl:element>
                </xsl:if>
                <xsl:if test="$y1 &lt; $y3">
                    <xsl:element name="height">
                        <xsl:value-of select="abs(($y3) - ($y1))"/>
                    </xsl:element>
                </xsl:if>
                <!-- 02-JULY-19 -->
                <xsl:if test="descendant::TextFrame">
                    <xsl:for-each select="TextFrame">
                        <xsl:call-template name="TF"/>
                    </xsl:for-each>
                </xsl:if>
            </xsl:element>
            <xsl:apply-templates/>
           
        </xsl:if>
        <!-- 02-JULY-19 -->
        <xsl:if test="$Txorigin = 'NaN'">
            <xsl:element name="{$elementName}">
                <xsl:attribute name="data-pageitem" select="'yes'"/>
                <xsl:if test="$parentStory">
                    <xsl:attribute name="story" select="$parentStory"/>
                </xsl:if>
                <xsl:if test="$parentStory">
                    <xsl:attribute name="selfElementName" select="self::*/local-name()"/>
                </xsl:if>
                <xsl:call-template name="label"/>
                <xsl:attribute name="id" select="@Self"/>
                <xsl:if test="string-length($fillColor) &gt; 0">
                    <xsl:attribute name="libraryFillColor" select="$fillColor"/>
                </xsl:if>
                <xsl:choose>
                    <xsl:when test="@ImageHyperLinkUD">
                        <xsl:choose>
                            <xsl:when test="contains(@ImageHyperLinkUD,'_TX_')">
                                <xsl:attribute name="ImageHyperLinkUD" select="substring-before(@ImageHyperLinkUD,'_TX_')"/>
                            </xsl:when>
                            <xsl:when test="not(contains(@ImageHyperLinkUD,'_TX_'))">
                                <xsl:attribute name="ImageHyperLinkUD" select="@ImageHyperLinkUD"/>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:attribute name="ParaInfo" select="@ImageHyperLinkUD"/>
                    </xsl:when>
                </xsl:choose>
                <xsl:attribute name="page" select="'recto'"/>
                <xsl:if test="self::*/Image">
                    <xsl:variable name="link">
                        <xsl:variable name="local" select="tokenize(self::Rectangle/Image/Link/@LinkResourceURI,'/')[last()]"/>
                        <xsl:value-of select="replace($local,'%20',' ')"/>
                    </xsl:variable>
                    <xsl:attribute name="Image" select="$link"/>
                </xsl:if>
                <xsl:if test="self::*/EPS">
                    <xsl:variable name="link">
                        <xsl:variable name="local" select="tokenize(self::Rectangle/EPS/Link/@LinkResourceURI,'/')[last()]"/>
                        <xsl:value-of select="replace($local,'%20',' ')"/>
                    </xsl:variable>
                    <xsl:attribute name="Image" select="$link"/>
                </xsl:if>   
                <xsl:if test="self::*/PDF">
                    <xsl:variable name="link">
                        <xsl:variable name="local" select="tokenize(self::Rectangle/PDF/Link/@LinkResourceURI,'/')[last()]"/>
                        <xsl:value-of select="replace($local,'%20',' ')"/>
                    </xsl:variable>
                    <xsl:attribute name="Image" select="$link"/>
                </xsl:if>   
                <xsl:if test="self::*/Image">
                    <xsl:variable name="link">
                        <xsl:variable name="local" select="self::Rectangle/Image/Link/@LinkResourceURI"/>
                        <xsl:value-of select="replace($local,'%20',' ')"/>
                    </xsl:variable>
                    <xsl:attribute name="ImagePath" select="$link"/>
                </xsl:if>
                <xsl:if test="self::*/EPS">
                    <xsl:variable name="link">
                        <xsl:variable name="local" select="self::Rectangle/EPS/Link/@LinkResourceURI"/>
                        <xsl:value-of select="replace($local,'%20',' ')"/>
                    </xsl:variable>
                    <xsl:attribute name="ImagePath" select="$link"/>
                </xsl:if>   
                <xsl:if test="self::*/PDF">
                    <xsl:variable name="link">
                        <xsl:variable name="local" select="self::Rectangle/PDF/Link/@LinkResourceURI"/>
                        <xsl:value-of select="replace($local,'%20',' ')"/>
                    </xsl:variable>
                    <xsl:attribute name="ImagePath" select="$link"/>
                </xsl:if> 
                <xsl:attribute name="previous" select="$previous"/>
                <xsl:attribute name="next" select="$next"/>
                <xsl:choose>
                    <xsl:when test="parent::Group">
                        <xsl:attribute name="pre-sib"  select="count(preceding-sibling::*)"/>
                        <xsl:attribute name="fol-sib"  select="count(following-sibling::*)"/>
                    </xsl:when>
                </xsl:choose>
                <xsl:element name="Txorigin">
                    <xsl:value-of select="$Txorigin"/>
                </xsl:element>
                
                <xsl:if test="$Tyorigin &lt; 0">
                    <xsl:element name="Tyorigin">
                        <xsl:value-of select="($Halfheight - abs($Tyorigin))"/>
                    </xsl:element></xsl:if>
                
                <xsl:if test="$Tyorigin &gt;= 0">
                    <xsl:element name="Tyorigin">
                        <xsl:value-of select="($Tyorigin + $Halfheight)"/>
                    </xsl:element></xsl:if>
                
                
                <xsl:if test="$x1 &gt; $x3">
                    <xsl:element name="width">
                        <xsl:value-of select="abs(($x1) - ($x3))"/>
                    </xsl:element>
                </xsl:if>
                <xsl:if test="$x1 &lt; $x3">
                    <xsl:element name="width">
                        <xsl:value-of select="abs(($x3) - ($x1))"/>
                    </xsl:element>
                </xsl:if>
                
                
                <xsl:if test="$y1 &gt; $y3">
                    <xsl:element name="height">
                        <xsl:value-of select="abs(($y1) - ($y3))"/>
                    </xsl:element>
                </xsl:if>
                <xsl:if test="$y1 &lt; $y3">
                    <xsl:element name="height">
                        <xsl:value-of select="abs(($y3) - ($y1))"/>
                    </xsl:element>
                </xsl:if>
                <!-- 02-JULY-19 -->
                <xsl:if test="descendant::TextFrame">
                    <xsl:for-each select="TextFrame">
                        <xsl:call-template name="TF"></xsl:call-template>
                    </xsl:for-each>
                </xsl:if>
            </xsl:element>
            <xsl:apply-templates/>
        </xsl:if>
        <!--<xsl:apply-templates select="descendant::TextFrame"></xsl:apply-templates>-->
    </xsl:template>

    <xsl:template match="Group">
        <xsl:element name="Group">
            <xsl:attribute name="id" select="@Self"/>
            <xsl:call-template name="label"/>
          <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="Contents"/>
    
    <xsl:template match="text()"/>

<xsl:template name="color">
        <xsl:param name="colorName"/>
        <xsl:for-each select="$Graphic//Color[@Self eq $colorName]">
         <!--   <xsl:choose>
                <xsl:when test="./@Self eq $colorName">-->
                    <xsl:if test="./@Space eq 'CMYK'">
                    <xsl:variable name="CMYK" as="xs:string*" select="tokenize(./@ColorValue,' ')"/>
                    <xsl:variable name="C" select="number($CMYK[1])"/>
                    <xsl:variable name="M" select="number($CMYK[2])"/>
                    <xsl:variable name="Y" select="number($CMYK[3])"/>
                    <xsl:variable name="K" select="number($CMYK[4])"/>
                    <xsl:variable name="Cdiv" select="$C div 100"/>
                    <xsl:variable name="Mdiv" select="$M div 100"/>
                    <xsl:variable name="Ydiv" select="$Y div 100"/>
                    <xsl:variable name="Kdiv" select="$K div 100"/>
                    <xsl:variable name="R" select="(255 * (1-$Cdiv) * (1-$Kdiv)) div 16"/>
                    <xsl:variable name="G" select="(255 * (1-$Mdiv) * (1-$Kdiv)) div 16"/>
                    <xsl:variable name="B" select="(255 * (1-$Ydiv) * (1-$Kdiv)) div 16"/>
                    <xsl:variable name="R1">
                        <xsl:variable name="hex-digit1" select="substring($hex,floor((255 * (1-$Cdiv) * (1-$Kdiv))  div 16) + 1,1)"/>
                        <xsl:variable name="hex-digit2" select="substring($hex,(255 * (1-$Cdiv) * (1-$Kdiv))  mod 16 + 1,1)"/>
                        <xsl:value-of select="concat($hex-digit1,$hex-digit2)"/>
                    </xsl:variable>
                    <xsl:variable name="G1">
                        <xsl:variable name="hex-digit1" select="substring($hex,floor((255 * (1-$Mdiv) * (1-$Kdiv))  div 16) + 1,1)"/>
                        <xsl:variable name="hex-digit2" select="substring($hex,(255 * (1-$Mdiv) * (1-$Kdiv))  mod 16 + 1,1)"/>
                        <xsl:value-of select="concat($hex-digit1,$hex-digit2)"/>
                    </xsl:variable>
                    <xsl:variable name="B1">
                        <xsl:variable name="hex-digit1" select="substring($hex,floor((255 * (1-$Ydiv) * (1-$Kdiv))  div 16) + 1,1)"/>
                        <xsl:variable name="hex-digit2" select="substring($hex,(255 * (1-$Ydiv) * (1-$Kdiv))  mod 16 + 1,1)"/>
                        <xsl:value-of select="concat($hex-digit1,$hex-digit2)"/>
                    </xsl:variable>
                    <xsl:variable name="Rhex">
                        <xsl:variable name="Rstr" select="$R cast as xs:string"></xsl:variable>
                        <xsl:choose>
                            <xsl:when test="contains($Rstr,'.')">
                                <xsl:variable name="Rstr1" >
                                    <xsl:choose>
                                        <xsl:when test="((substring-before($Rstr,'.')) cast as xs:decimal) &lt;= 9">
                                            <xsl:value-of select="(substring-before($Rstr,'.'))"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Rstr,'.')) cast as xs:decimal) = 10">
                                            <xsl:value-of select="'A'"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Rstr,'.')) cast as xs:decimal) = 11">
                                            <xsl:value-of select="'B'"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Rstr,'.')) cast as xs:decimal) = 12">
                                            <xsl:value-of select="'C'"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Rstr,'.')) cast as xs:decimal) = 13">
                                            <xsl:value-of select="'D'"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Rstr,'.')) cast as xs:decimal) = 14">
                                            <xsl:value-of select="'E'"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Rstr,'.')) cast as xs:decimal) = 15">
                                            <xsl:value-of select="'F'"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:variable name="Rstr2" select="number(concat('0.',(substring-after($Rstr,'.'))))"/>
                                <xsl:variable name="Rstr3" >
                                    <xsl:variable name="Rstr4" select="round($Rstr2 * 16)"/>
                                    <xsl:choose>
                                        <xsl:when test="$Rstr4 &lt;= 9">
                                            <xsl:value-of select="$Rstr4"/>
                                        </xsl:when>
                                        <xsl:when test="$Rstr4 = 10">
                                            <xsl:value-of select="'A'"/>
                                        </xsl:when>
                                        <xsl:when test="$Rstr4 = 11">
                                            <xsl:value-of select="'B'"/>
                                        </xsl:when>
                                        <xsl:when test="$Rstr4 = 12">
                                            <xsl:value-of select="'C'"/>
                                        </xsl:when>
                                        <xsl:when test="$Rstr4 = 13">
                                            <xsl:value-of select="'D'"/>
                                        </xsl:when>
                                        <xsl:when test="$Rstr4 = 14">
                                            <xsl:value-of select="'E'"/>
                                        </xsl:when>
                                        <xsl:when test="$Rstr4 = 15">
                                            <xsl:value-of select="'F'"/>
                                        </xsl:when>
                                        <xsl:when test="$Rstr4 = 16">
                                            <xsl:value-of select="'16'"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:variable name="Rfin">
                                    <xsl:choose>
                                        <xsl:when test="$Rstr3 eq '16'">
                                            <xsl:variable name="ad">
                                                <xsl:choose>
                                                    <xsl:when test="$Rstr1 = 'A'">
                                                        <xsl:value-of select="10 + 1"/>
                                                    </xsl:when>
                                                    <xsl:when test="$Rstr1 = 'B'">
                                                        <xsl:value-of select="11 + 1"/>
                                                    </xsl:when>
                                                    <xsl:when test="$Rstr1 = 'C'">
                                                        <xsl:value-of select="12 + 1"/>
                                                    </xsl:when>
                                                    <xsl:when test="$Rstr1 = 'D'">
                                                        <xsl:value-of select="13 + 1"/>
                                                    </xsl:when>
                                                    <xsl:when test="$Rstr1 = 'E'">
                                                        <xsl:value-of select="14 + 1"/>
                                                    </xsl:when>
                                                    <xsl:when test="$Rstr1 = 'F'">
                                                        <xsl:value-of select="'F'"/>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:value-of select="$Rstr1 + 1"/>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:variable>
                                            <xsl:variable name="Rstr6" >
                                                <xsl:choose>
                                                    <xsl:when test="$ad&lt;= 9">
                                                        <xsl:value-of select="$ad"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 10">
                                                        <xsl:value-of select="'A'"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 11">
                                                        <xsl:value-of select="'B'"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 12">
                                                        <xsl:value-of select="'C'"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 13">
                                                        <xsl:value-of select="'D'"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 14">
                                                        <xsl:value-of select="'E'"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 15">
                                                        <xsl:value-of select="'F'"/>
                                                    </xsl:when>
                                                </xsl:choose>
                                            </xsl:variable>
                                        <xsl:value-of select="$Rstr6"/>
                                        <xsl:value-of select="'0'"/>
                                        </xsl:when>
                                        <xsl:otherwise> 
                                            <xsl:value-of select="$Rstr1"/>
                                            <xsl:value-of select="$Rstr3"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:variable>
                               <xsl:value-of select="$Rfin"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:variable name="Rstr5">
                                    <xsl:choose>
                                        <xsl:when test="($Rstr cast as xs:decimal) &lt;= 9">
                                            <xsl:value-of select="concat('0',$Rstr)"/>
                                        </xsl:when>
                                        <xsl:when test="($Rstr cast as xs:decimal) = 10">
                                            <xsl:value-of select="'0A'"/>
                                        </xsl:when>
                                        <xsl:when test="($Rstr cast as xs:decimal) = 11">
                                            <xsl:value-of select="'0B'"/>
                                        </xsl:when>
                                        <xsl:when test="($Rstr cast as xs:decimal) = 12">
                                            <xsl:value-of select="'0C'"/>
                                        </xsl:when>
                                        <xsl:when test="($Rstr cast as xs:decimal) = 13">
                                            <xsl:value-of select="'0D'"/>
                                        </xsl:when>
                                        <xsl:when test="($Rstr cast as xs:decimal) = 14">
                                            <xsl:value-of select="'0E'"/>
                                        </xsl:when>
                                        <xsl:when test="($Rstr cast as xs:decimal) = 15">
                                            <xsl:value-of select="'0F'"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:value-of select="$Rstr5"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <xsl:variable name="Ghex">
                        <xsl:variable name="Gstr" select="$G cast as xs:string"></xsl:variable>
                        <xsl:choose>
                            <xsl:when test="contains($Gstr,'.')">
                                <xsl:variable name="Gstr1" >
                                    <xsl:choose>
                                        <xsl:when test="((substring-before($Gstr,'.')) cast as xs:decimal) &lt;= 9">
                                            <xsl:value-of select="(substring-before($Gstr,'.'))"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Gstr,'.')) cast as xs:decimal) = 10">
                                            <xsl:value-of select="'A'"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Gstr,'.')) cast as xs:decimal) = 11">
                                            <xsl:value-of select="'B'"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Gstr,'.')) cast as xs:decimal) = 12">
                                            <xsl:value-of select="'C'"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Gstr,'.')) cast as xs:decimal) = 13">
                                            <xsl:value-of select="'D'"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Gstr,'.')) cast as xs:decimal) = 14">
                                            <xsl:value-of select="'E'"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Gstr,'.')) cast as xs:decimal) = 15">
                                            <xsl:value-of select="'F'"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:variable name="Gstr2" select="number(concat('0.',(substring-after($Gstr,'.'))))"/>
                                <xsl:variable name="Gstr3" >
                                    <xsl:variable name="Gstr4" select="round($Gstr2 * 16)"></xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$Gstr4 &lt;= 9">
                                            <xsl:value-of select="$Gstr4"/>
                                        </xsl:when>
                                        <xsl:when test="$Gstr4 = 10">
                                            <xsl:value-of select="'A'"/>
                                        </xsl:when>
                                        <xsl:when test="$Gstr4 = 11">
                                            <xsl:value-of select="'B'"/>
                                        </xsl:when>
                                        <xsl:when test="$Gstr4 = 12">
                                            <xsl:value-of select="'C'"/>
                                        </xsl:when>
                                        <xsl:when test="$Gstr4 = 13">
                                            <xsl:value-of select="'D'"/>
                                        </xsl:when>
                                        <xsl:when test="$Gstr4 = 14">
                                            <xsl:value-of select="'E'"/>
                                        </xsl:when>
                                        <xsl:when test="$Gstr4 = 15">
                                            <xsl:value-of select="'F'"/>
                                        </xsl:when>
                                        <xsl:when test="$Gstr4 = 16">
                                            <xsl:value-of select="'16'"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:variable name="Gfin">
                                    <xsl:choose>
                                        <xsl:when test="$Gstr3 eq '16'">
                                            <xsl:variable name="ad">
                                                <xsl:choose>
                                                    <xsl:when test="$Gstr1 = 'A'">
                                                        <xsl:value-of select="10 + 1"/>
                                                    </xsl:when>
                                                    <xsl:when test="$Gstr1 = 'B'">
                                                        <xsl:value-of select="11 + 1"/>
                                                    </xsl:when>
                                                    <xsl:when test="$Gstr1 = 'C'">
                                                        <xsl:value-of select="12 + 1"/>
                                                    </xsl:when>
                                                    <xsl:when test="$Gstr1 = 'D'">
                                                        <xsl:value-of select="13 + 1"/>
                                                    </xsl:when>
                                                    <xsl:when test="$Gstr1 = 'E'">
                                                        <xsl:value-of select="14 + 1"/>
                                                    </xsl:when>
                                                    <xsl:when test="$Gstr1 = 'F'">
                                                        <xsl:value-of select="'F'"/>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:value-of select="$Gstr1 + 1"/>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:variable>
                                            <xsl:variable name="Gstr6" >
                                                <xsl:choose>
                                                    <xsl:when test="$ad&lt;= 9">
                                                        <xsl:value-of select="$ad"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 10">
                                                        <xsl:value-of select="'A'"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 11">
                                                        <xsl:value-of select="'B'"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 12">
                                                        <xsl:value-of select="'C'"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 13">
                                                        <xsl:value-of select="'D'"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 14">
                                                        <xsl:value-of select="'E'"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 15">
                                                        <xsl:value-of select="'F'"/>
                                                    </xsl:when>
                                                </xsl:choose>
                                            </xsl:variable>
                                            <xsl:value-of select="$Gstr6"/>
                                            <xsl:value-of select="'0'"/>
                                        </xsl:when>
                                        <xsl:otherwise> 
                                            <xsl:value-of select="$Gstr1"/>
                                            <xsl:value-of select="$Gstr3"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:value-of select="$Gfin"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:variable name="Gstr5">
                                    <xsl:choose>
                                        <xsl:when test="($Gstr cast as xs:decimal) &lt;= 9">
                                            <xsl:value-of select="concat('0',$Gstr)"/>
                                        </xsl:when>
                                        <xsl:when test="($Gstr cast as xs:decimal) = 10">
                                            <xsl:value-of select="'0A'"/>
                                        </xsl:when>
                                        <xsl:when test="($Gstr cast as xs:decimal) = 11">
                                            <xsl:value-of select="'0B'"/>
                                        </xsl:when>
                                        <xsl:when test="($Gstr cast as xs:decimal) = 12">
                                            <xsl:value-of select="'0C'"/>
                                        </xsl:when>
                                        <xsl:when test="($Gstr cast as xs:decimal) = 13">
                                            <xsl:value-of select="'0D'"/>
                                        </xsl:when>
                                        <xsl:when test="($Gstr cast as xs:decimal) = 14">
                                            <xsl:value-of select="'0E'"/>
                                        </xsl:when>
                                        <xsl:when test="($Gstr cast as xs:decimal) = 15">
                                            <xsl:value-of select="'0F'"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:value-of select="$Gstr5"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <xsl:variable name="Bhex">
                        <xsl:variable name="Bstr" select="$B cast as xs:string"></xsl:variable>
                        <xsl:choose>
                            <xsl:when test="contains($Bstr,'.')">
                                <xsl:variable name="Bstr1" >
                                    <xsl:choose>
                                        <xsl:when test="((substring-before($Bstr,'.')) cast as xs:decimal) &lt;= 9">
                                            <xsl:value-of select="(substring-before($Bstr,'.'))"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Bstr,'.')) cast as xs:decimal) = 10">
                                            <xsl:value-of select="'A'"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Bstr,'.')) cast as xs:decimal) = 11">
                                            <xsl:value-of select="'B'"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Bstr,'.')) cast as xs:decimal) = 12">
                                            <xsl:value-of select="'C'"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Bstr,'.')) cast as xs:decimal) = 13">
                                            <xsl:value-of select="'D'"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Bstr,'.')) cast as xs:decimal) = 14">
                                            <xsl:value-of select="'E'"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Bstr,'.')) cast as xs:decimal) = 15">
                                            <xsl:value-of select="'F'"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:variable name="Bstr2" select="number(concat('0.',(substring-after($Bstr,'.'))))"/>
                                <xsl:variable name="Bstr3" >
                                    <xsl:variable name="Bstr4" select="round($Bstr2 * 16)"></xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$Bstr4 &lt;= 9">
                                            <xsl:value-of select="$Bstr4"/>
                                        </xsl:when>
                                        <xsl:when test="$Bstr4 = 10">
                                            <xsl:value-of select="'A'"/>
                                        </xsl:when>
                                        <xsl:when test="$Bstr4 = 11">
                                            <xsl:value-of select="'B'"/>
                                        </xsl:when>
                                        <xsl:when test="$Bstr4 = 12">
                                            <xsl:value-of select="'C'"/>
                                        </xsl:when>
                                        <xsl:when test="$Bstr4 = 13">
                                            <xsl:value-of select="'D'"/>
                                        </xsl:when>
                                        <xsl:when test="$Bstr4 = 14">
                                            <xsl:value-of select="'E'"/>
                                        </xsl:when>
                                        <xsl:when test="$Bstr4 = 15">
                                            <xsl:value-of select="'F'"/>
                                        </xsl:when>
                                        <xsl:when test="$Bstr4 = 16">
                                            <xsl:value-of select="'16'"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:variable name="Bfin">
                                    <xsl:choose>
                                        <xsl:when test="$Bstr3 eq '16'">
                                            <xsl:variable name="ad">
                                                <xsl:choose>
                                                    <xsl:when test="$Bstr1 = 'A'">
                                                        <xsl:value-of select="10 + 1"/>
                                                    </xsl:when>
                                                    <xsl:when test="$Bstr1 = 'B'">
                                                        <xsl:value-of select="11 + 1"/>
                                                    </xsl:when>
                                                    <xsl:when test="$Bstr1 = 'C'">
                                                        <xsl:value-of select="12 + 1"/>
                                                    </xsl:when>
                                                    <xsl:when test="$Bstr1 = 'D'">
                                                        <xsl:value-of select="13 + 1"/>
                                                    </xsl:when>
                                                    <xsl:when test="$Bstr1 = 'E'">
                                                        <xsl:value-of select="14 + 1"/>
                                                    </xsl:when>
                                                    <xsl:when test="$Bstr1 = 'F'">
                                                        <xsl:value-of select="'F'"/>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:value-of select="$Bstr1 + 1"/>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:variable>
                                            <xsl:variable name="Bstr6" >
                                                <xsl:choose>
                                                    <xsl:when test="$ad&lt;= 9">
                                                        <xsl:value-of select="$ad"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 10">
                                                        <xsl:value-of select="'A'"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 11">
                                                        <xsl:value-of select="'B'"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 12">
                                                        <xsl:value-of select="'C'"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 13">
                                                        <xsl:value-of select="'D'"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 14">
                                                        <xsl:value-of select="'E'"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 15">
                                                        <xsl:value-of select="'F'"/>
                                                    </xsl:when>
                                                </xsl:choose>
                                            </xsl:variable>
                                            <xsl:value-of select="$Bstr6"/>
                                            <xsl:value-of select="'0'"/>
                                        </xsl:when>
                                        <xsl:otherwise> 
                                            <xsl:value-of select="$Bstr1"/>
                                            <xsl:value-of select="$Bstr3"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:value-of select="$Bfin"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:variable name="Bstr5">
                                    <xsl:choose>
                                        <xsl:when test="($Bstr cast as xs:decimal) &lt;= 9">
                                            <xsl:value-of select="concat('0',$Bstr)"/>
                                        </xsl:when>
                                        <xsl:when test="($Bstr cast as xs:decimal) = 10">
                                            <xsl:value-of select="'0A'"/>
                                        </xsl:when>
                                        <xsl:when test="($Bstr cast as xs:decimal) = 11">
                                            <xsl:value-of select="'0B'"/>
                                        </xsl:when>
                                        <xsl:when test="($Bstr cast as xs:decimal) = 12">
                                            <xsl:value-of select="'0C'"/>
                                        </xsl:when>
                                        <xsl:when test="($Bstr cast as xs:decimal) = 13">
                                            <xsl:value-of select="'0D'"/>
                                        </xsl:when>
                                        <xsl:when test="($Bstr cast as xs:decimal) = 14">
                                            <xsl:value-of select="'0E'"/>
                                        </xsl:when>
                                        <xsl:when test="($Bstr cast as xs:decimal) = 15">
                                            <xsl:value-of select="'0F'"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:value-of select="$Bstr5"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    
                        <xsl:variable name="RInteger">
                            <xsl:call-template name="hex2num">
                                <xsl:with-param name="hex" select="$Rhex"/>
                            </xsl:call-template>
                        </xsl:variable>
                        <xsl:variable name="GInteger">
                            <xsl:call-template name="hex2num">
                                <xsl:with-param name="hex" select="$Ghex"/>
                            </xsl:call-template>
                        </xsl:variable>
                        <xsl:variable name="BInteger">
                            <xsl:call-template name="hex2num">
                                <xsl:with-param name="hex" select="$Bhex"/>
                            </xsl:call-template>
                        </xsl:variable>
                        
                        
                        <xsl:choose>
                           <!-- <!-\-   Checking whether the color value is white -\->
                            <xsl:when test="($RInteger &gt; 229 and $RInteger &lt;= 255) and ($GInteger &gt; 229 and $GInteger &lt;= 255) and ($BInteger &gt; 229 and $BInteger &lt;= 255) ">
                                <xsl:value-of select="'000000'"/>
                            </xsl:when>-->
                            <!--   Checking whether the color value is black -->
                            <xsl:when test="($RInteger &lt;= 35) and ($GInteger &lt;= 35) and ($BInteger &lt;= 35) ">
                                <xsl:variable name="lightColor" select="concat($RInteger+30,$GInteger+30,$BInteger+30)"/>
                                <xsl:value-of select="'FFFFFF'"/>
                                <!--<xsl:value-of select="$lightColor"/>-->
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="concat($Rhex,$Ghex,$Bhex)"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:if>
                    <xsl:if test="./@Space eq 'RGB'">
                    <xsl:variable name="RGB" as="xs:string*" select="tokenize(./@ColorValue,' ')"/>
    
                    <xsl:variable name="R" select="number($RGB[1])"/>
                    <xsl:variable name="G" select="number($RGB[2])"/>
                    <xsl:variable name="B" select="number($RGB[3])"/>
                    
                    <xsl:variable name="R1">
                        <xsl:variable name="hex-digit1" select="substring($hex,floor($R  div 16) + 1,1)"/>
                        <xsl:variable name="hex-digit2" select="substring($hex,$R  mod 16 + 1,1)"/>
                        <xsl:value-of select="concat($hex-digit1,$hex-digit2)"/>
                    </xsl:variable>
                    <xsl:variable name="G1">
                        <xsl:variable name="hex-digit1" select="substring($hex,floor($G  div 16) + 1,1)"/>
                        <xsl:variable name="hex-digit2" select="substring($hex,$G  mod 16 + 1,1)"/>
                        <xsl:value-of select="concat($hex-digit1,$hex-digit2)"/>
                    </xsl:variable>
                    <xsl:variable name="B1">
                        <xsl:variable name="hex-digit1" select="substring($hex,floor($B  div 16) + 1,1)"/>
                        <xsl:variable name="hex-digit2" select="substring($hex,$B  mod 16 + 1,1)"/>
                        <xsl:value-of select="concat($hex-digit1,$hex-digit2)"/>
                    </xsl:variable>
                
                <xsl:variable name="Rhex">
                    <xsl:variable name="Rstr" select="$R cast as xs:string"></xsl:variable>
                    <xsl:choose>
                        <xsl:when test="contains($Rstr,'.')">
                            <xsl:variable name="Rstr1" >
                                <xsl:choose>
                                    <xsl:when test="((substring-before($Rstr,'.')) cast as xs:decimal) &lt;= 9">
                                        <xsl:value-of select="(substring-before($Rstr,'.'))"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Rstr,'.')) cast as xs:decimal) = 10">
                                        <xsl:value-of select="'A'"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Rstr,'.')) cast as xs:decimal) = 11">
                                        <xsl:value-of select="'B'"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Rstr,'.')) cast as xs:decimal) = 12">
                                        <xsl:value-of select="'C'"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Rstr,'.')) cast as xs:decimal) = 13">
                                        <xsl:value-of select="'D'"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Rstr,'.')) cast as xs:decimal) = 14">
                                        <xsl:value-of select="'E'"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Rstr,'.')) cast as xs:decimal) = 15">
                                        <xsl:value-of select="'F'"/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:variable name="Rstr2" select="number(concat('0.',(substring-after($Rstr,'.'))))"/>
                            <xsl:variable name="Rstr3" >
                                <xsl:variable name="Rstr4" select="round($Rstr2 * 16)"/>
                                <xsl:choose>
                                    <xsl:when test="$Rstr4 &lt;= 9">
                                        <xsl:value-of select="$Rstr4"/>
                                    </xsl:when>
                                    <xsl:when test="$Rstr4 = 10">
                                        <xsl:value-of select="'A'"/>
                                    </xsl:when>
                                    <xsl:when test="$Rstr4 = 11">
                                        <xsl:value-of select="'B'"/>
                                    </xsl:when>
                                    <xsl:when test="$Rstr4 = 12">
                                        <xsl:value-of select="'C'"/>
                                    </xsl:when>
                                    <xsl:when test="$Rstr4 = 13">
                                        <xsl:value-of select="'D'"/>
                                    </xsl:when>
                                    <xsl:when test="$Rstr4 = 14">
                                        <xsl:value-of select="'E'"/>
                                    </xsl:when>
                                    <xsl:when test="$Rstr4 = 15">
                                        <xsl:value-of select="'F'"/>
                                    </xsl:when>
                                    <xsl:when test="$Rstr4 = 16">
                                        <xsl:value-of select="'16'"/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:variable name="Rfin">
                                <xsl:choose>
                                    <xsl:when test="$Rstr3 eq '16'">
                                        <xsl:variable name="ad">
                                            <xsl:choose>
                                                <xsl:when test="$Rstr1 = 'A'">
                                                    <xsl:value-of select="10 + 1"/>
                                                </xsl:when>
                                                <xsl:when test="$Rstr1 = 'B'">
                                                    <xsl:value-of select="11 + 1"/>
                                                </xsl:when>
                                                <xsl:when test="$Rstr1 = 'C'">
                                                    <xsl:value-of select="12 + 1"/>
                                                </xsl:when>
                                                <xsl:when test="$Rstr1 = 'D'">
                                                    <xsl:value-of select="13 + 1"/>
                                                </xsl:when>
                                                <xsl:when test="$Rstr1 = 'E'">
                                                    <xsl:value-of select="14 + 1"/>
                                                </xsl:when>
                                                <xsl:when test="$Rstr1 = 'F'">
                                                    <xsl:value-of select="'F'"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="$Rstr1 + 1"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>
                                        <xsl:variable name="Rstr6" >
                                            <xsl:choose>
                                                <xsl:when test="$ad&lt;= 9">
                                                    <xsl:value-of select="$ad"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 10">
                                                    <xsl:value-of select="'A'"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 11">
                                                    <xsl:value-of select="'B'"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 12">
                                                    <xsl:value-of select="'C'"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 13">
                                                    <xsl:value-of select="'D'"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 14">
                                                    <xsl:value-of select="'E'"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 15">
                                                    <xsl:value-of select="'F'"/>
                                                </xsl:when>
                                            </xsl:choose>
                                        </xsl:variable>
                                    <xsl:value-of select="$Rstr6"/>
                                    <xsl:value-of select="'0'"/>
                                    </xsl:when>
                                    <xsl:otherwise> 
                                        <xsl:value-of select="$Rstr1"/>
                                        <xsl:value-of select="$Rstr3"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:variable>
                           <xsl:value-of select="$Rfin"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:variable name="Rstr5">
                                <xsl:choose>
                                    <xsl:when test="($Rstr cast as xs:decimal) &lt;= 9">
                                        <xsl:value-of select="concat('0',$Rstr)"/>
                                    </xsl:when>
                                    <xsl:when test="($Rstr cast as xs:decimal) = 10">
                                        <xsl:value-of select="'0A'"/>
                                    </xsl:when>
                                    <xsl:when test="($Rstr cast as xs:decimal) = 11">
                                        <xsl:value-of select="'0B'"/>
                                    </xsl:when>
                                    <xsl:when test="($Rstr cast as xs:decimal) = 12">
                                        <xsl:value-of select="'0C'"/>
                                    </xsl:when>
                                    <xsl:when test="($Rstr cast as xs:decimal) = 13">
                                        <xsl:value-of select="'0D'"/>
                                    </xsl:when>
                                    <xsl:when test="($Rstr cast as xs:decimal) = 14">
                                        <xsl:value-of select="'0E'"/>
                                    </xsl:when>
                                    <xsl:when test="($Rstr cast as xs:decimal) = 15">
                                        <xsl:value-of select="'0F'"/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:value-of select="$Rstr5"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="Ghex">
                    <xsl:variable name="Gstr" select="$G cast as xs:string"></xsl:variable>
                    <xsl:choose>
                        <xsl:when test="contains($Gstr,'.')">
                            <xsl:variable name="Gstr1" >
                                <xsl:choose>
                                    <xsl:when test="((substring-before($Gstr,'.')) cast as xs:decimal) &lt;= 9">
                                        <xsl:value-of select="(substring-before($Gstr,'.'))"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Gstr,'.')) cast as xs:decimal) = 10">
                                        <xsl:value-of select="'A'"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Gstr,'.')) cast as xs:decimal) = 11">
                                        <xsl:value-of select="'B'"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Gstr,'.')) cast as xs:decimal) = 12">
                                        <xsl:value-of select="'C'"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Gstr,'.')) cast as xs:decimal) = 13">
                                        <xsl:value-of select="'D'"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Gstr,'.')) cast as xs:decimal) = 14">
                                        <xsl:value-of select="'E'"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Gstr,'.')) cast as xs:decimal) = 15">
                                        <xsl:value-of select="'F'"/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:variable name="Gstr2" select="number(concat('0.',(substring-after($Gstr,'.'))))"/>
                            <xsl:variable name="Gstr3" >
                                <xsl:variable name="Gstr4" select="round($Gstr2 * 16)"></xsl:variable>
                                <xsl:choose>
                                    <xsl:when test="$Gstr4 &lt;= 9">
                                        <xsl:value-of select="$Gstr4"/>
                                    </xsl:when>
                                    <xsl:when test="$Gstr4 = 10">
                                        <xsl:value-of select="'A'"/>
                                    </xsl:when>
                                    <xsl:when test="$Gstr4 = 11">
                                        <xsl:value-of select="'B'"/>
                                    </xsl:when>
                                    <xsl:when test="$Gstr4 = 12">
                                        <xsl:value-of select="'C'"/>
                                    </xsl:when>
                                    <xsl:when test="$Gstr4 = 13">
                                        <xsl:value-of select="'D'"/>
                                    </xsl:when>
                                    <xsl:when test="$Gstr4 = 14">
                                        <xsl:value-of select="'E'"/>
                                    </xsl:when>
                                    <xsl:when test="$Gstr4 = 15">
                                        <xsl:value-of select="'F'"/>
                                    </xsl:when>
                                    <xsl:when test="$Gstr4 = 16">
                                        <xsl:value-of select="'16'"/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:variable name="Gfin">
                                <xsl:choose>
                                    <xsl:when test="$Gstr3 eq '16'">
                                        <xsl:variable name="ad">
                                            <xsl:choose>
                                                <xsl:when test="$Gstr1 = 'A'">
                                                    <xsl:value-of select="10 + 1"/>
                                                </xsl:when>
                                                <xsl:when test="$Gstr1 = 'B'">
                                                    <xsl:value-of select="11 + 1"/>
                                                </xsl:when>
                                                <xsl:when test="$Gstr1 = 'C'">
                                                    <xsl:value-of select="12 + 1"/>
                                                </xsl:when>
                                                <xsl:when test="$Gstr1 = 'D'">
                                                    <xsl:value-of select="13 + 1"/>
                                                </xsl:when>
                                                <xsl:when test="$Gstr1 = 'E'">
                                                    <xsl:value-of select="14 + 1"/>
                                                </xsl:when>
                                                <xsl:when test="$Gstr1 = 'F'">
                                                    <xsl:value-of select="'F'"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="$Gstr1 + 1"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>
                                        <xsl:variable name="Gstr6" >
                                            <xsl:choose>
                                                <xsl:when test="$ad&lt;= 9">
                                                    <xsl:value-of select="$ad"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 10">
                                                    <xsl:value-of select="'A'"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 11">
                                                    <xsl:value-of select="'B'"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 12">
                                                    <xsl:value-of select="'C'"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 13">
                                                    <xsl:value-of select="'D'"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 14">
                                                    <xsl:value-of select="'E'"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 15">
                                                    <xsl:value-of select="'F'"/>
                                                </xsl:when>
                                            </xsl:choose>
                                        </xsl:variable>
                                        <xsl:value-of select="$Gstr6"/>
                                        <xsl:value-of select="'0'"/>
                                    </xsl:when>
                                    <xsl:otherwise> 
                                        <xsl:value-of select="$Gstr1"/>
                                        <xsl:value-of select="$Gstr3"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:value-of select="$Gfin"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:variable name="Gstr5">
                                <xsl:choose>
                                    <xsl:when test="($Gstr cast as xs:decimal) &lt;= 9">
                                        <xsl:value-of select="concat('0',$Gstr)"/>
                                    </xsl:when>
                                    <xsl:when test="($Gstr cast as xs:decimal) = 10">
                                        <xsl:value-of select="'0A'"/>
                                    </xsl:when>
                                    <xsl:when test="($Gstr cast as xs:decimal) = 11">
                                        <xsl:value-of select="'0B'"/>
                                    </xsl:when>
                                    <xsl:when test="($Gstr cast as xs:decimal) = 12">
                                        <xsl:value-of select="'0C'"/>
                                    </xsl:when>
                                    <xsl:when test="($Gstr cast as xs:decimal) = 13">
                                        <xsl:value-of select="'0D'"/>
                                    </xsl:when>
                                    <xsl:when test="($Gstr cast as xs:decimal) = 14">
                                        <xsl:value-of select="'0E'"/>
                                    </xsl:when>
                                    <xsl:when test="($Gstr cast as xs:decimal) = 15">
                                        <xsl:value-of select="'0F'"/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:value-of select="$Gstr5"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="Bhex">
                    <xsl:variable name="Bstr" select="$B cast as xs:string"></xsl:variable>
                    <xsl:choose>
                        <xsl:when test="contains($Bstr,'.')">
                            <xsl:variable name="Bstr1" >
                                <xsl:choose>
                                    <xsl:when test="((substring-before($Bstr,'.')) cast as xs:decimal) &lt;= 9">
                                        <xsl:value-of select="(substring-before($Bstr,'.'))"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Bstr,'.')) cast as xs:decimal) = 10">
                                        <xsl:value-of select="'A'"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Bstr,'.')) cast as xs:decimal) = 11">
                                        <xsl:value-of select="'B'"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Bstr,'.')) cast as xs:decimal) = 12">
                                        <xsl:value-of select="'C'"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Bstr,'.')) cast as xs:decimal) = 13">
                                        <xsl:value-of select="'D'"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Bstr,'.')) cast as xs:decimal) = 14">
                                        <xsl:value-of select="'E'"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Bstr,'.')) cast as xs:decimal) = 15">
                                        <xsl:value-of select="'F'"/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:variable name="Bstr2" select="number(concat('0.',(substring-after($Bstr,'.'))))"/>
                            <xsl:variable name="Bstr3" >
                                <xsl:variable name="Bstr4" select="round($Bstr2 * 16)"></xsl:variable>
                                <xsl:choose>
                                    <xsl:when test="$Bstr4 &lt;= 9">
                                        <xsl:value-of select="$Bstr4"/>
                                    </xsl:when>
                                    <xsl:when test="$Bstr4 = 10">
                                        <xsl:value-of select="'A'"/>
                                    </xsl:when>
                                    <xsl:when test="$Bstr4 = 11">
                                        <xsl:value-of select="'B'"/>
                                    </xsl:when>
                                    <xsl:when test="$Bstr4 = 12">
                                        <xsl:value-of select="'C'"/>
                                    </xsl:when>
                                    <xsl:when test="$Bstr4 = 13">
                                        <xsl:value-of select="'D'"/>
                                    </xsl:when>
                                    <xsl:when test="$Bstr4 = 14">
                                        <xsl:value-of select="'E'"/>
                                    </xsl:when>
                                    <xsl:when test="$Bstr4 = 15">
                                        <xsl:value-of select="'F'"/>
                                    </xsl:when>
                                    <xsl:when test="$Bstr4 = 16">
                                        <xsl:value-of select="'16'"/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:variable name="Bfin">
                                <xsl:choose>
                                    <xsl:when test="$Bstr3 eq '16'">
                                        <xsl:variable name="ad">
                                            <xsl:choose>
                                                <xsl:when test="$Bstr1 = 'A'">
                                                    <xsl:value-of select="10 + 1"/>
                                                </xsl:when>
                                                <xsl:when test="$Bstr1 = 'B'">
                                                    <xsl:value-of select="11 + 1"/>
                                                </xsl:when>
                                                <xsl:when test="$Bstr1 = 'C'">
                                                    <xsl:value-of select="12 + 1"/>
                                                </xsl:when>
                                                <xsl:when test="$Bstr1 = 'D'">
                                                    <xsl:value-of select="13 + 1"/>
                                                </xsl:when>
                                                <xsl:when test="$Bstr1 = 'E'">
                                                    <xsl:value-of select="14 + 1"/>
                                                </xsl:when>
                                                <xsl:when test="$Bstr1 = 'F'">
                                                    <xsl:value-of select="'F'"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="$Bstr1 + 1"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>
                                        <xsl:variable name="Bstr6" >
                                            <xsl:choose>
                                                <xsl:when test="$ad&lt;= 9">
                                                    <xsl:value-of select="$ad"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 10">
                                                    <xsl:value-of select="'A'"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 11">
                                                    <xsl:value-of select="'B'"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 12">
                                                    <xsl:value-of select="'C'"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 13">
                                                    <xsl:value-of select="'D'"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 14">
                                                    <xsl:value-of select="'E'"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 15">
                                                    <xsl:value-of select="'F'"/>
                                                </xsl:when>
                                            </xsl:choose>
                                        </xsl:variable>
                                        <xsl:value-of select="$Bstr6"/>
                                        <xsl:value-of select="'0'"/>
                                    </xsl:when>
                                    <xsl:otherwise> 
                                        <xsl:value-of select="$Bstr1"/>
                                        <xsl:value-of select="$Bstr3"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:value-of select="$Bfin"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:variable name="Bstr5">
                                <xsl:choose>
                                    <xsl:when test="($Bstr cast as xs:decimal) &lt;= 9">
                                        <xsl:value-of select="concat('0',$Bstr)"/>
                                    </xsl:when>
                                    <xsl:when test="($Bstr cast as xs:decimal) = 10">
                                        <xsl:value-of select="'0A'"/>
                                    </xsl:when>
                                    <xsl:when test="($Bstr cast as xs:decimal) = 11">
                                        <xsl:value-of select="'0B'"/>
                                    </xsl:when>
                                    <xsl:when test="($Bstr cast as xs:decimal) = 12">
                                        <xsl:value-of select="'0C'"/>
                                    </xsl:when>
                                    <xsl:when test="($Bstr cast as xs:decimal) = 13">
                                        <xsl:value-of select="'0D'"/>
                                    </xsl:when>
                                    <xsl:when test="($Bstr cast as xs:decimal) = 14">
                                        <xsl:value-of select="'0E'"/>
                                    </xsl:when>
                                    <xsl:when test="($Bstr cast as xs:decimal) = 15">
                                        <xsl:value-of select="'0F'"/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:value-of select="$Bstr5"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                
                        <xsl:choose>
                            <!-- <!-\-   Checking whether the color value is white -\->
                            <xsl:when test="($RInteger &gt; 229 and $RInteger &lt;= 255) and ($GInteger &gt; 229 and $GInteger &lt;= 255) and ($BInteger &gt; 229 and $BInteger &lt;= 255) ">
                                <xsl:value-of select="'000000'"/>
                            </xsl:when>-->
                            <!--   Checking whether the color value is black -->
                            <xsl:when test="($R &lt;= 35) and ($G &lt;= 35) and ($B &lt;= 35) ">
                                <xsl:variable name="lightColor" select="concat($R+30,$G+30,$B+30)"/>
                                <xsl:value-of select="'FFFFFF'"/>
<!--                                <xsl:value-of select="$lightColor"/>-->
                            </xsl:when>
                            <xsl:otherwise>
                            <xsl:value-of select="concat($R1,$G1,$B1)"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    </xsl:if>
                <!--</xsl:when>
            </xsl:choose>-->
        </xsl:for-each>
    </xsl:template>
    
 <xsl:template name="hex2num">
        <xsl:param name="hex"/>
        <xsl:param name="num" select="0"/>
        <xsl:param name="MSB" select="translate(substring($hex, 1, 1), 'abcdef', 'ABCDEF')"/>
        <xsl:param name="value" select="string-length(substring-before('0123456789ABCDEF', $MSB))"/>
        <xsl:param name="result" select="16 * $num + $value"/>
        <xsl:choose>
            <xsl:when test="string-length($hex) > 1">
                <xsl:call-template name="hex2num">
                    <xsl:with-param name="hex" select="substring($hex, 2)"/>
                    <xsl:with-param name="num" select="$result"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$result"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template> 
    
    <!--18/03/2021 common function for  RomanToInteger    -->
    
    <xsl:function name="number:RomanToInteger">
        <xsl:param name="romannumber"/>
        <xsl:param name="followingvalue"/>
        <xsl:choose>
            <xsl:when test="ends-with($romannumber,'CM')">
                <xsl:value-of select="900 + number:RomanToInteger(substring($romannumber,1,string-length($romannumber)-2), 900)"/>
            </xsl:when>
            <xsl:when test="ends-with($romannumber,'M')">
                <xsl:value-of select="1000+ number:RomanToInteger(substring($romannumber,1,string-length($romannumber)-1), 1000)"/>
            </xsl:when>
            <xsl:when test="ends-with($romannumber,'CD')">
                <xsl:value-of select="400+ number:RomanToInteger(substring($romannumber,1,string-length($romannumber)-2), 400)"/>
            </xsl:when>
            <xsl:when test="ends-with($romannumber,'D')">
                <xsl:value-of select="500+ number:RomanToInteger(substring($romannumber,1,string-length($romannumber)-1), 500)"/>
            </xsl:when>
            <xsl:when test="ends-with($romannumber,'XC')">
                <xsl:value-of select="90+ number:RomanToInteger(substring($romannumber,1,string-length($romannumber)-2), 90)"/>
            </xsl:when>
            <xsl:when test="ends-with($romannumber,'C')">
                <xsl:value-of select="(if(100 ge number($followingvalue)) then 100 else -100)+ number:RomanToInteger(substring($romannumber,1,string-length($romannumber)-1), 100)"/>
            </xsl:when>
            <xsl:when test="ends-with($romannumber,'XL')">
                <xsl:value-of select="40+ number:RomanToInteger(substring($romannumber,1,string-length($romannumber)-2), 40)"/>
            </xsl:when>
            <xsl:when test="ends-with($romannumber,'L')">
                <xsl:value-of select="50+ number:RomanToInteger(substring($romannumber,1,string-length($romannumber)-1), 50)"/>
            </xsl:when>
            <xsl:when test="ends-with($romannumber,'IX')">
                <xsl:value-of select="9+ number:RomanToInteger(substring($romannumber,1,string-length($romannumber)-2), 9)"/>
            </xsl:when>
            <xsl:when test="ends-with($romannumber,'X')">
                <xsl:value-of select="(if(10 ge number($followingvalue)) then 10 else -10) + number:RomanToInteger(substring($romannumber,1,string-length($romannumber)-1), 10)"/>
            </xsl:when>
            <xsl:when test="ends-with($romannumber,'IV')">
                <xsl:value-of select="4+ number:RomanToInteger(substring($romannumber,1,string-length($romannumber)-2), 4)"/>
            </xsl:when>
            <xsl:when test="ends-with($romannumber,'V')">
                <xsl:value-of select="5+ number:RomanToInteger(substring($romannumber,1,string-length($romannumber)-1), 5)"/>
            </xsl:when>
            <xsl:when test="ends-with($romannumber,'I')">
                <xsl:value-of select="(if(1 ge number($followingvalue)) then 1 else -1)+ number:RomanToInteger(substring($romannumber,1,string-length($romannumber)-1), 1)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="0"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
    
</xsl:stylesheet>