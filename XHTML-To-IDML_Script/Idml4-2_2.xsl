<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf"
    exclude-result-prefixes="xs mf"
    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" version="2.0">
    <!-- Removed Br on 31-10-2023 Azure 11593 -->
    <!-- Added to remove the opener image blank page issue by br Azure 14910 27-05-2024-->
    <!-- Added for citaion with caption values get from caption to citation Azure 15087 on 19-6-2024 -->
   <xsl:output method="xml" name="xml" />
  
	
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
	<xsl:template match="XMLElement">

	     <xsl:copy>
		 <xsl:attribute name="Self">
		
	<xsl:value-of select="count(ancestor::XMLElement)"/>

	
		 </xsl:attribute>
 <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
	
	
	</xsl:template>
 


    <!--<xsl:template match="XMLElement[MarkupTag='XMLTag/Image'][contains(@value, 'PMI')]/XMLAttribute[@Name='href'][@Value='canceled']"/>-->

<!--Remove the duplicate href value from PMI[PMI and caption href same] 1-6-2018-->

    <xsl:template match="//XMLAttribute[@Name='href'][contains(@Value,'Art')][preceding-sibling::XMLAttribute[contains(@Value,'PMI')] or following-sibling::XMLAttribute[contains(@Value,'PMI')]]">
        <xsl:element name="XMLAttribute">
            
            
        <xsl:variable name="tmPMIval" select="@Value"/>
        <xsl:variable name="checkTrueVal">
            <xsl:for-each select="//XMLAttribute[@Name='href'][contains(@Value,'Art')][preceding-sibling::XMLAttribute[@Value='FIGURE'] or preceding-sibling::XMLAttribute[@Value='PHOTO']]">
            <xsl:variable name="fV" select="@Value"/>
            <xsl:if test="$tmPMIval eq $fV">
                <xsl:value-of select="'TRUE'"/>
            </xsl:if>
        </xsl:for-each>
        </xsl:variable>
            
         <xsl:choose>
             <xsl:when test="contains($checkTrueVal,'TRUE')">
                 
                 <xsl:for-each select="@*">
                     <xsl:variable name="attName" select="name()"/>
                     <xsl:variable name="attVal" select="."/>
                     <xsl:if test="$attName != 'Value'">
                     <xsl:attribute name="{$attName}">
                         <xsl:value-of select="$attVal"/>
                         
                     </xsl:attribute>
                     </xsl:if>
                 </xsl:for-each>
                 
             </xsl:when>
             <xsl:otherwise>
                 <xsl:copy-of select="@*"/>
             </xsl:otherwise>
         </xsl:choose>
         
            <xsl:apply-templates select="node()"/>
        
        </xsl:element>
    </xsl:template>
    
    
    
    
    
    
<!--End Remove the duplicate href value from PMI[PMI and caption href same]-->

    <xsl:template match="XMLElement/@Self"/>
<!--Remove duplicate caption 20.8.2018-->
    <xsl:template match="XMLElement[@MarkupTag='XMLTag/figure'][not(parent::XMLElement[@MarkupTag = 'XMLTag/FigureGroup' or @MarkupTag = 'XMLTag/SupplFigureGroup' or @MarkupTag = 'XMLTag/MovieGroup' or @MarkupTag = 'XMLTag/PhotoGroup'])]">
       <xsl:variable name="id" select="self::XMLElement[@MarkupTag='XMLTag/figure']/XMLAttribute[@Name='xml:id']/@Value"/>
        <xsl:choose>
            <xsl:when test="following::XMLElement[@MarkupTag='XMLTag/figure'][not(parent::XMLElement[@MarkupTag = 'XMLTag/FigureGroup' or @MarkupTag = 'XMLTag/SupplFigureGroup' or @MarkupTag = 'XMLTag/MovieGroup'or @MarkupTag = 'XMLTag/PhotoGroup'])]//XMLAttribute[@Name='xml:id']/@Value = $id">
            </xsl:when>
            <xsl:otherwise>
                <!-- Added the link tag for without citation caption Azure 15087 on 19-6-2024 -->
                <xsl:variable name="posi"><xsl:value-of select="self::XMLElement[@MarkupTag='XMLTag/figure'][child::XMLAttribute[@Name='position']][1]/child::XMLAttribute[@Name='position'][1]/@Value"/></xsl:variable>
                <xsl:variable name="xhrf"><xsl:value-of select="self::XMLElement[@MarkupTag='XMLTag/figure'][descendant::XMLElement[@MarkupTag='XMLTag/Image']/child::XMLAttribute[@Name='href']][1]//XMLAttribute[@Name='href']/@Value"/></xsl:variable>
                <xsl:variable name="linkendval"><xsl:value-of select="//XMLElement[@MarkupTag='XMLTag/link'][not(child::XMLAttribute[contains(@Name,'xref')])][child::XMLAttribute[@Name='linkend']]/child::XMLAttribute[@Name='linkend']/@Value/."/></xsl:variable>
                <xsl:variable name="rect" select="descendant::XMLElement[@MarkupTag='XMLTag/link'][1]/child::XMLAttribute[contains(@Name,'href')][1]/@Name[1]"/>
               
                <xsl:if test="self::XMLElement[@MarkupTag='XMLTag/figure']/child::XMLAttribute[@Name='xml:id'][not(contains($linkendval,@Value))]">
                    <XMLElement Self="di2" MarkupTag="XMLTag/figure">
                        <XMLElement Self="di2" MarkupTag="XMLTag/links">
                            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="linkend" Value="</xsl:text>
                            <xsl:value-of select="$id"/>
                            <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                            <xsl:choose>
                                <xsl:when test="contains($posi,'inline')">
                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributeninlinehref" Name="inlinehref" Value="</xsl:text>
                                    <xsl:value-of select="$xhrf"/>
                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                </xsl:when>
                                <xsl:when test="contains($rect,'floatrecthref') and contains($posi,'float')">
                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloatrecthref" Name="floatrecthref" Value="</xsl:text>
                                    <xsl:value-of select="$xhrf"/>
                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloathref" Name="floathref" Value="</xsl:text>
                                    <xsl:value-of select="$xhrf"/>
                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                        </XMLElement>
                        <XMLElement Self="di2" MarkupTag="XMLTag/link">
                            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="linkend" Value="</xsl:text>
                            <xsl:value-of select="$id"/>
                            <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                            <xsl:choose>
                                <xsl:when test="contains($posi,'inline')">
                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributeninlinehref" Name="inlinehref" Value="</xsl:text>
                                    <xsl:value-of select="$xhrf"/>
                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                </xsl:when>
                                <xsl:when test="contains($rect,'floatrecthref') and contains($posi,'float')">
                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloatrecthref" Name="floatrecthref" Value="</xsl:text>
                                    <xsl:value-of select="$xhrf"/>
                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloathref" Name="floathref" Value="</xsl:text>
                                    <xsl:value-of select="$xhrf"/>
                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributencitationtruefalse" Name="citationtruefalse" Value="</xsl:text>
                            <xsl:value-of select="'false'"/>
                            <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                        </XMLElement>
                    </XMLElement>
                </xsl:if>
                <!-- End -->
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
  </xsl:template>
    <xsl:template match="XMLElement[@MarkupTag = 'XMLTag/FigureGroup' or @MarkupTag = 'XMLTag/SupplFigureGroup' or @MarkupTag = 'XMLTag/MovieGroup' or @MarkupTag = 'XMLTag/PhotoGroup'][//XMLElement[@MarkupTag='XMLTag/figure']]">
        <!--<xsl:variable name="id" select="self::XMLElement[@MarkupTag = 'XMLTag/FigureGroup' or @MarkupTag = 'XMLTag/SupplFigureGroup' or @MarkupTag = 'XMLTag/MovieGroup']//XMLElement[@MarkupTag='XMLTag/figure']//XMLAttribute[@Name='xml:id']/@Value"/>-->
        <xsl:variable name="id" select="self::XMLElement[@MarkupTag = 'XMLTag/FigureGroup' or @MarkupTag = 'XMLTag/SupplFigureGroup' or @MarkupTag = 'XMLTag/MovieGroup' or @MarkupTag = 'XMLTag/PhotoGroup']//XMLElement[@MarkupTag='XMLTag/figure']/XMLAttribute[@Name='xml:id']/@Value"/>
        <xsl:choose>
            <xsl:when test="following::XMLElement[@MarkupTag = 'XMLTag/FigureGroup' or @MarkupTag = 'XMLTag/SupplFigureGroup' or @MarkupTag = 'XMLTag/MovieGroup' or @MarkupTag = 'XMLTag/PhotoGroup']//XMLElement[@MarkupTag='XMLTag/figure']//XMLAttribute[@Name='xml:id']/@Value = $id">
            </xsl:when>
            <xsl:otherwise>
                <!-- Added the link tag for without citation caption Azure 15087 on 19-6-2024 -->
                <xsl:variable name="posi"><xsl:value-of select="descendant::XMLElement[@MarkupTag='XMLTag/figure'][child::XMLAttribute[@Name='position']][1]/child::XMLAttribute[@Name='position'][1]/@Value"/></xsl:variable>
                <xsl:variable name="xhrf"><xsl:value-of select="descendant::XMLElement[@MarkupTag='XMLTag/figure']/descendant::XMLElement[@MarkupTag='XMLTag/Image'][child::XMLAttribute[@Name='href']][1]/child::XMLAttribute[@Name='href'][1]/@Value"/></xsl:variable>
                <xsl:variable name="linkendval"><xsl:value-of select="//XMLElement[@MarkupTag='XMLTag/link'][not(child::XMLAttribute[contains(@Name,'xref')])][child::XMLAttribute[@Name='linkend']]/child::XMLAttribute[@Name='linkend']/@Value/."/></xsl:variable>
                <xsl:variable name="rect" select="//XMLElement[@MarkupTag='XMLTag/link'][1]/child::XMLAttribute[contains(@Name,'href')][1]/@Name[1]"/>
                <xsl:if test="descendant::XMLElement[@MarkupTag='XMLTag/figure']/child::XMLAttribute[@Name='xml:id'][not(contains($linkendval,@Value))]">
                    <XMLElement Self="di2" MarkupTag="XMLTag/figure">
                        <XMLElement Self="di2" MarkupTag="XMLTag/links">
                            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="linkend" Value="</xsl:text>
                            <xsl:value-of select="$id"/>
                            <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                <xsl:choose>
                                    <xsl:when test="contains($posi,'inline')">
                                        <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributeninlinehref" Name="inlinehref" Value="</xsl:text>
                                        <xsl:value-of select="$xhrf"/>
                                        <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                    </xsl:when>
                                    <!--<xsl:when test="contains($rect,'floatrecthref') and contains($posi,'float')">
                                        <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloatrecthref" Name="floatrecthrefX" Value="</xsl:text>
                                        <xsl:value-of select="$xhrf"/>
                                        <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                    </xsl:when>-->
                                    <xsl:otherwise>
                                        <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloathref" Name="floathref" Value="</xsl:text>
                                        <xsl:value-of select="$xhrf"/>
                                        <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                    </xsl:otherwise>
                                </xsl:choose>
                        </XMLElement>
                        <XMLElement Self="di2" MarkupTag="XMLTag/link">
                            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenlinkend" Name="linkend" Value="</xsl:text>
                            <xsl:value-of select="$id"/>
                            <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                            <xsl:choose>
                                <xsl:when test="contains($posi,'inline')">
                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributeninlinehref" Name="inlinehref" Value="</xsl:text>
                                    <xsl:value-of select="$xhrf"/>
                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                </xsl:when>
                                <!--<xsl:when test="contains($rect,'floatrecthref') and contains($posi,'float')">
                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloatrecthref" Name="floatrecthref" Value="</xsl:text>
                                    <xsl:value-of select="$xhrf"/>
                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                </xsl:when>-->
                                <xsl:otherwise>
                                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloathref" Name="floathref" Value="</xsl:text>
                                    <xsl:value-of select="$xhrf"/>
                                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributencitationtruefalse" Name="citationtruefalse" Value="</xsl:text>
                            <xsl:value-of select="'false'"/>
                            <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                        </XMLElement>
                    </XMLElement>
                  </xsl:if>
                <!-- End -->
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- Removed Br on 31-10-2023 Azure 11593 -->
    <xsl:template match="//CharacterStyleRange[Br][preceding-sibling::*[1][self::XMLElement[@MarkupTag='XMLTag/Image']]][following-sibling::*[1][self::XMLElement[(@MarkupTag = 'XMLTag/figure') and not(ancestor::XMLElement[@MarkupTag = 'XMLTag/FigureGroup' or @MarkupTag = 'XMLTag/SupplFigureGroup' or @MarkupTag = 'XMLTag/MovieGroup' or @MarkupTag = 'XMLTag/PhotoGroup'])]][not(child::XMLAttribute[@Value='inline'])]]"/>
    <!-- commented for xmlstruture on 27-11-2023 -->
    <!--<xsl:template match="//CharacterStyleRange[Br][preceding-sibling::*[1][self::XMLElement[(@MarkupTag = 'XMLTag/figure') and not(ancestor::XMLElement[@MarkupTag = 'XMLTag/FigureGroup' or @MarkupTag = 'XMLTag/SupplFigureGroup' or @MarkupTag = 'XMLTag/MovieGroup'])]][not(child::XMLAttribute[@Value='inline'])]]"/>-->
    

    <!-- Added to remove the opener image blank page issue by br Azure 14910 27-05-2024-->
    <xsl:template match="XMLElement[contains(@MarkupTag,'XMLTag/Image') or contains(@MarkupTag,'XMLTag/figure')][not(preceding::ParagraphStyleRange)]/descendant::Br"/>
    <xsl:template match="//CharacterStyleRange[Br][preceding-sibling::*[1][self::XMLElement[contains(@MarkupTag,'XMLTag/Image') or contains(@MarkupTag,'XMLTag/figure')]][not(preceding::ParagraphStyleRange)]]"/>
    <xsl:template match="CharacterStyleRange[descendant::Br][following-sibling::*[1][self::XMLElement[contains(@MarkupTag,'XMLTag/FigureGroup')]]][not(preceding::ParagraphStyleRange)]"/>
    <!-- Added for citaion with caption values get from caption to citation Azure 15087 on 19-6-2024 -->
    <xsl:template match="//XMLElement[@MarkupTag='XMLTag/link']//XMLAttribute[@Name='linkend']">
        <xsl:variable name="linkendvalue" select="self::XMLAttribute[@Name='linkend']/@Value"/>
        <xsl:variable name="rect" select="following-sibling::XMLAttribute[contains(@Name,'href')][ancestor::XMLElement[@MarkupTag='XMLTag/link']]/@Name"/>
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
        <xsl:if test="//XMLAttribute[@Name='xml:id'][@Value = $linkendvalue]">
            <xsl:for-each select="//XMLAttribute[@Name='xml:id'][@Value = $linkendvalue]">
            <xsl:variable name="pos"><xsl:value-of select="ancestor::XMLElement[@MarkupTag='XMLTag/figure'][child::XMLAttribute[@Name='position']][1]/child::XMLAttribute[@Name='position'][1]/@Value"/></xsl:variable>
            <xsl:variable name="xhrf"><xsl:value-of select="ancestor::XMLElement[@MarkupTag='XMLTag/figure'][descendant::XMLElement[@MarkupTag='XMLTag/Image']/child::XMLAttribute[@Name='href']][1]//XMLAttribute[@Name='href']/@Value"/></xsl:variable>
                
                
                <xsl:choose>
                <xsl:when test="contains($pos,'inline')">
                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributeninlinehref" Name="inlinehref" Value="</xsl:text>
                    <xsl:value-of select="$xhrf"/>
                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                </xsl:when>
                    <xsl:when test="//XMLAttribute[@Name='xml:id'][@Value = $linkendvalue][not(ancestor::XMLElement[@MarkupTag='XMLTag/FigureGroup'])] and contains($rect,'floatrecthref') and contains($pos,'float')">
                        <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloatrecthref" Name="floatrecthref" Value="</xsl:text>
                        <xsl:value-of select="$xhrf"/>
                        <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                    </xsl:when>
                <xsl:otherwise>
                    <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributenfloathref" Name="floathref" Value="</xsl:text>
                    <xsl:value-of select="$xhrf"/>
                    <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
                <xsl:text disable-output-escaping="yes">&#x3C;XMLAttribute Self="di2XMLAttributencitationtruefalse" Name="citationtruefalse" Value="</xsl:text>
                <xsl:value-of select="'true'"/>
                <xsl:text disable-output-escaping="yes">"/&#x3E;</xsl:text>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>    
   
</xsl:stylesheet>