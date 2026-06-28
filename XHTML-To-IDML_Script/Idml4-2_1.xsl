<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf"
    exclude-result-prefixes="xs mf"
    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" version="2.0">
<!--FigurePMI and FigureGroup Updated on  21-6-2018-->
<!--if Tableref citation and table_place_holder both available means i have removed citation linkend value 27-8-2019 -->
<!--Added for Figure_Place_Holder and Table_place_Holder for "longleaf" link value 28-8-2019-->
    <!--Added "XMLTag/SupplFigureGroup' or @MarkupTag = 'XMLTag/MovieGroup" on  16-06-2020-->
    <!--updated on 24-08-2021 without citation group caption missing-->
    <!-- Added [@Name='linkend'] for inlineref Azure 15087 on 11-06-2024-->
   <xsl:output method="xml" name="xml" />
  
	
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    

    <xsl:template match="ParagraphStyleRange">
        <xsl:choose>
            <xsl:when test="descendant::XMLElement[@MarkupTag = 'XMLTag/link']">
                <xsl:copy>
                    <xsl:apply-templates select="@* | node()"/>
                    
                    <xsl:if test="descendant::XMLElement[@MarkupTag = 'XMLTag/Image']/XMLAttribute[1][contains(./@Value, 'PMI')]">
                        <xsl:for-each select="descendant::XMLElement[@MarkupTag = 'XMLTag/Image']/preceding-sibling::XMLElement[@MarkupTag = 'XMLTag/link']">
                            
                                    <xsl:variable name="id1" select="XMLAttribute/@Value"/>
                                     <xsl:variable name="id" select="replace($id1,'(cha)([-.])([A-Za-z])([-.])','$1$2$3.')"/>
                                                       
                            <xsl:if test="//XMLElement[not(@MarkupTag = 'XMLTag/FigureGroup' or @MarkupTag = 'XMLTag/SupplFigureGroup' or @MarkupTag = 'XMLTag/MovieGroup' or @MarkupTag = 'XMLTag/MapGroup')]">
                                    
                            <xsl:for-each select="//XMLElement[@MarkupTag = 'XMLTag/figure']">
                        <xsl:variable name="id2" select="./XMLAttribute/@Value"/>
                                
                        <xsl:choose>
                            <xsl:when test="$id2 = $id">
                                <xsl:apply-templates select="self::XMLElement[@MarkupTag = 'XMLTag/figure']" mode="moveme"/>
                                <!-- Removed for paneer process on 27-6-2024 -->
								<!--<CharacterStyleRange AppliedCharacterStyle="CharacterStyle/$ID/[No character style]"
                                       Name="$ID/[No character style]">
								<Br/>
							</CharacterStyleRange>-->
                            </xsl:when>
                            <xsl:otherwise>
                                
                            </xsl:otherwise>
                        </xsl:choose>
                        </xsl:for-each>
                                </xsl:if>
                               
                            <xsl:if test="//XMLElement[@MarkupTag = 'XMLTag/FigureGroup' or @MarkupTag = 'XMLTag/SupplFigureGroup' or @MarkupTag = 'XMLTag/MovieGroup' or @MarkupTag = 'XMLTag/MapGroup']">
                                            
                                                <xsl:for-each select="//XMLElement[@MarkupTag = 'XMLTag/figure']">
                                                <xsl:variable name="id2" select="./XMLAttribute/@Value"/>
                                                
                                                <xsl:choose>
                                                    <xsl:when test="$id2 = $id">
                                                        
                                                        <xsl:apply-templates select="parent::XMLElement[@MarkupTag = 'XMLTag/FigureGroup' or @MarkupTag = 'XMLTag/SupplFigureGroup' or @MarkupTag = 'XMLTag/MovieGroup' or @MarkupTag = 'XMLTag/MapGroup']" mode="moveme"/>
                                                        <!--<CharacterStyleRange AppliedCharacterStyle="CharacterStyle/$ID/[No character style]"
                                                            Name="$ID/[No character style]">
                                                            <Br/>
                                                        </CharacterStyleRange>-->
                                                    </xsl:when>
                                                </xsl:choose>
                                            </xsl:for-each>
                                        </xsl:if>
                                           </xsl:for-each>
                                        </xsl:if>
                    <xsl:if test="not(descendant::XMLElement[@MarkupTag = 'XMLTag/Image']/XMLAttribute[1][contains(./@Value, 'PMI')])">
                        
                               <xsl:for-each select="descendant::XMLElement[@MarkupTag = 'XMLTag/link']">
                                   <!-- Added [@Name='linkend'] for inlineref Azure 15087 on 11-06-2024-->
                                   <xsl:variable name="id" select="XMLAttribute[@Name='linkend']/@Value"/>
                                   <!-- End -->
                                   <!--2A 3-7-2019-->
                                   <xsl:variable name="id11">
                                       <xsl:choose>
                                           <xsl:when test="contains($id,'cha-F.([0-9]+)([.])([0-9]+)([A-Za-z])')">
                                               <xsl:value-of select="replace($id,'cha-F.([0-9]+)([.])([0-9]+)([A-Za-z])','')"/>
                                           </xsl:when>
                                           <xsl:otherwise>
                                               <xsl:value-of select="replace($id,'cha-F.([0-9]+)([A-Za-z])','')"/>
                                           </xsl:otherwise>
                                       </xsl:choose>
                                   </xsl:variable>
                                   
                                   
                                   
                                   
                                   <!--End-->
                               
                               <xsl:variable name="id2" select="replace($id, 'cha-F.([0-9]+)([.])([0-9]+)([A-Za-z])','cha-F.$1$2$3')"/>
                                   
                                 
                                <!--2A 3-7-2019-->
                               <xsl:variable name="id2x">
                                   <!--<xsl:choose>
                                       <xsl:when test="contains($id2,'A')">
                                           <xsl:value-of select="substring-before($id2,'A')"/>
                                       </xsl:when>
                                       <xsl:when test="contains($id2,'a')">
                                           <xsl:value-of select="substring-before($id2,'a')"/>
                                       </xsl:when>
                                   </xsl:choose>-->
                                    <xsl:value-of select="$id2"/>
                               </xsl:variable>                            
                               <!--End-->
                                                                   
                                   <xsl:if test="//XMLElement[not(@MarkupTag = 'XMLTag/FigureGroup' or @MarkupTag = 'XMLTag/SupplFigureGroup' or @MarkupTag = 'XMLTag/MovieGroup' or @MarkupTag = 'XMLTag/MapGroup')]">
                               <xsl:for-each select="//XMLElement[@MarkupTag = 'XMLTag/figure']">
                               <xsl:variable name="idx" select="./XMLAttribute/@Value"/>
                                 <!--For Citation Variable-->
                                   <xsl:variable name="idxc">
                                     <!--<xsl:choose>
                                         <xsl:when test="contains($id,'A') or contains($id2,'A')">
                                             <xsl:value-of select="concat($idx,'A')"/>
                                         </xsl:when>
                                         <xsl:when test="contains($id,'a') or contains($id2,'a')">
                                             <xsl:value-of select="concat($idx,'a')"/>
                                         </xsl:when>
                                     </xsl:choose>-->
                                       
                                           <xsl:if test="$id or $id2">
                                               <xsl:value-of select="$idx"/>
                                           </xsl:if>        
                                 </xsl:variable>
                                   <!--End-->
      
                                   <!--For Caption Variable-->
                                   <xsl:variable name="idxcap">
                                         <!--<xsl:choose>
                                           <xsl:when test="contains($idx,'A')">
                                               <xsl:value-of select="substring-before($idx,'A')"/>
                                           </xsl:when>
                                           <xsl:when test="contains($idx,'a')">
                                               <xsl:value-of select="substring-before($idx,'a')"/>
                                           </xsl:when>
                                             <xsl:when test="contains($idx,'B')">
                                                 <xsl:value-of select="substring-before($idx,'B')"/>
                                             </xsl:when>
                                             <xsl:when test="contains($idx,'b')">
                                                 <xsl:value-of select="substring-before($idx,'b')"/>
                                             </xsl:when>
                                             <xsl:when test="contains($idx,'C')">
                                                 <xsl:value-of select="substring-before($idx,'C')"/>
                                             </xsl:when>
                                             <xsl:when test="contains($idx,'c')">
                                                 <xsl:value-of select="substring-before($idx,'c')"/>
                                             </xsl:when>
                                             <xsl:when test="contains($idx,'D')">
                                                 <xsl:value-of select="substring-before($idx,'D')"/>
                                             </xsl:when>
                                             <xsl:when test="contains($idx,'d')">
                                                 <xsl:value-of select="substring-before($idx,'d')"/>
                                             </xsl:when>
                                             <xsl:when test="contains($idx,'E')">
                                                 <xsl:value-of select="substring-before($idx,'E')"/>
                                             </xsl:when>
                                             <xsl:when test="contains($idx,'e')">
                                                 <xsl:value-of select="substring-before($idx,'e')"/>
                                             </xsl:when>
                                             <xsl:when test="contains($idx,'F')">
                                                 <xsl:value-of select="substring-before($idx,'F')"/>
                                             </xsl:when>
                                             <xsl:when test="contains($idx,'G')">
                                                 <xsl:value-of select="substring-before($idx,'G')"/>
                                             </xsl:when>
                                             <xsl:when test="contains($idx,'g')">
                                                 <xsl:value-of select="substring-before($idx,'g')"/>
                                             </xsl:when>
                                             </xsl:choose>-->
                                       <xsl:value-of select="$idx"/>
                                   </xsl:variable>
                                   <!--End-->
      
                                    <xsl:choose>
                                    <xsl:when test="$idx = $id or $idx = $id2">
                                        <xsl:variable name="pmiCount" select="count(//XMLElement[(replace(XMLAttribute[@Name='linkend'][1]/@Value,'(cha)([-.])([A-Za-z])([-.])','$1$2$3.') = $id) and descendant::XMLAttribute[contains(./@Value, 'PMI')]])"/>
                                        <xsl:if test="not($pmiCount > 0)">
                                            
                                            <xsl:apply-templates select="self::XMLElement[@MarkupTag = 'XMLTag/figure']" mode="moveme"/>
                                            
                                            <!--<CharacterStyleRange AppliedCharacterStyle="CharacterStyle/$ID/[No character style]"
                                                Name="$ID/[No character style]">
                                                <Br/>
                                            </CharacterStyleRange>-->
                                        </xsl:if>
                                      </xsl:when>
                                 <!--Update for 2A 3-7-2019-->
                                 <xsl:otherwise>
                                     <xsl:choose>
                                         <xsl:when test="$idx != $id and $idxc = $id  and $id2x != $id or $idx != $id2 and $idxc = $id2 and $id2x != $id2">
                                         <xsl:apply-templates select="self::XMLElement[@MarkupTag = 'XMLTag/figure']" mode="moveme"/>
                                             
                                             <!--<CharacterStyleRange AppliedCharacterStyle="CharacterStyle/$ID/[No character style]"
                                                 Name="$ID/[No character style]">
                                                 <Br/>
                                             </CharacterStyleRange>-->
                                         </xsl:when>
                                         <xsl:otherwise>
                                             <xsl:choose>
                                                 <xsl:when test="$idxcap = $id or $idxcap = $id2">
                                                     <xsl:apply-templates select="self::XMLElement[@MarkupTag = 'XMLTag/figure']" mode="moveme"/>
                                                     
                                                     <!--<CharacterStyleRange AppliedCharacterStyle="CharacterStyle/$ID/[No character style]"
                                                         Name="$ID/[No character style]">
                                                         <Br/>
                                                     </CharacterStyleRange>-->
                                                 </xsl:when>
                                             </xsl:choose>
                                         </xsl:otherwise>
                                     </xsl:choose> 
                                     
                                 </xsl:otherwise>
                                 <!--End-->
                                 </xsl:choose>
                               </xsl:for-each>
                                       </xsl:if>
                                    
                                   <xsl:if test="//XMLElement[@MarkupTag = 'XMLTag/FigureGroup' or @MarkupTag = 'XMLTag/SupplFigureGroup' or @MarkupTag = 'XMLTag/MovieGroup' or @MarkupTag = 'XMLTag/MapGroup']">
                                            
                                                  <xsl:for-each select="//XMLElement[@MarkupTag = 'XMLTag/figure']">
                                                       <xsl:choose>
                                                          <xsl:when test="./XMLAttribute/@Value = $id">
                                                              <xsl:variable name="pmiCount" select="count(//XMLElement[(replace(XMLAttribute[@Name='linkend'][1]/@Value,'(cha)([-.])([A-Za-z])([-.])','$1$2$3.') = $id) and descendant::XMLAttribute[contains(./@Value, 'PMI')]])"/>
                                                              
                                                              <xsl:if test="not($pmiCount > 0)">
                                                                  <xsl:apply-templates select="parent::XMLElement[@MarkupTag = 'XMLTag/FigureGroup' or @MarkupTag = 'XMLTag/SupplFigureGroup' or @MarkupTag = 'XMLTag/MovieGroup' or @MarkupTag = 'XMLTag/MapGroup']" mode="moveme"/>
                                                                  <!--<CharacterStyleRange AppliedCharacterStyle="CharacterStyle/$ID/[No character style]"
                                                                      Name="$ID/[No character style]">
                                                                      <Br/>
                                                                  </CharacterStyleRange>-->
                                                              </xsl:if>
                                                          </xsl:when>
                                                          </xsl:choose>
                                                  </xsl:for-each>
                                              </xsl:if>
                                                                  
                        </xsl:for-each>
                        </xsl:if>                 
                </xsl:copy>
                
            </xsl:when>
            
            
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="@* | node()"/>
                </xsl:copy>
                </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!--  or @MarkupTag = 'XMLTag/MapGroup' -->
    <xsl:template match="XMLElement[@MarkupTag = 'XMLTag/FigureGroup' or @MarkupTag = 'XMLTag/SupplFigureGroup' or @MarkupTag = 'XMLTag/MovieGroup']" mode="moveme">
        <CharacterStyleRange AppliedCharacterStyle="CharacterStyle/$ID/[No character style]">
            <Br/>
        </CharacterStyleRange>
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
        
    </xsl:template>
    
    <xsl:template match="XMLElement[@MarkupTag = 'XMLTag/figure']" mode="moveme">
        <!-- added for merge 27-12-2024 -->
        <CharacterStyleRange AppliedCharacterStyle="CharacterStyle/$ID/[No character style]">
            <Br/>
        </CharacterStyleRange>
            <xsl:copy>
                <xsl:if test="not(ancestor::XMLElement[@MarkupTag = 'XMLTag/FigureGroup' or @MarkupTag = 'XMLTag/SupplFigureGroup' or @MarkupTag = 'XMLTag/MovieGroup' or @MarkupTag = 'XMLTag/MapGroup'])">
                <xsl:apply-templates select="@* | node()"/>
            </xsl:if>
        </xsl:copy>
        </xsl:template>
    
    
    <xsl:template match="Br[preceding-sibling::*[1][self::XMLElement[(@MarkupTag = 'XMLTag/figure') and not(ancestor::XMLElement[@MarkupTag = 'XMLTag/FigureGroup' or @MarkupTag = 'XMLTag/SupplFigureGroup' or @MarkupTag = 'XMLTag/MovieGroup' or @MarkupTag = 'XMLTag/MapGroup'])]][not(child::XMLAttribute[@Value='inline'])]]"/>
    
    
    <xsl:template match="XMLElement[(@MarkupTag = 'XMLTag/figure') and not(ancestor::XMLElement[@MarkupTag = 'XMLTag/FigureGroup' or @MarkupTag = 'XMLTag/SupplFigureGroup' or @MarkupTag = 'XMLTag/MovieGroup' or @MarkupTag = 'XMLTag/MapGroup'])]">
        <!--<CharacterStyleRange AppliedCharacterStyle="CharacterStyle/$ID/[No character style]">
            <Br/>
        </CharacterStyleRange>-->
           <xsl:for-each select="self::XMLElement[@MarkupTag = 'XMLTag/figure']">
            <xsl:variable name="id" select="XMLAttribute/@Value"/>
            
              <!--For Caption Variable-->
              <xsl:variable name="idxcapD">
                  <!--<xsl:choose>
                      <xsl:when test="contains($id,'A')">
                          <xsl:value-of select="substring-before($id,'A')"/>
                      </xsl:when>
                      <xsl:when test="contains($id,'a')">
                          <xsl:value-of select="substring-before($id,'a')"/>
                      </xsl:when>
                      <xsl:when test="contains($id,'B')">
                          <xsl:value-of select="substring-before($id,'B')"/>
                      </xsl:when>
                      <xsl:when test="contains($id,'b')">
                          <xsl:value-of select="substring-before($id,'b')"/>
                      </xsl:when>
                      <xsl:when test="contains($id,'C')">
                          <xsl:value-of select="substring-before($id,'C')"/>
                      </xsl:when>
                      <xsl:when test="contains($id,'c')">
                          <xsl:value-of select="substring-before($id,'c')"/>
                      </xsl:when>
                      <xsl:when test="contains($id,'D')">
                          <xsl:value-of select="substring-before($id,'D')"/>
                      </xsl:when>
                      <xsl:when test="contains($id,'d')">
                          <xsl:value-of select="substring-before($id,'d')"/>
                      </xsl:when>
                      <xsl:when test="contains($id,'E')">
                          <xsl:value-of select="substring-before($id,'E')"/>
                      </xsl:when>
                      <xsl:when test="contains($id,'e')">
                          <xsl:value-of select="substring-before($id,'e')"/>
                      </xsl:when>
                      <xsl:when test="contains($id,'F')">
                          <xsl:value-of select="substring-before($id,'F')"/>
                      </xsl:when>
                      <xsl:when test="contains($id,'G')">
                          <xsl:value-of select="substring-before($id,'G')"/>
                      </xsl:when>
                      <xsl:when test="contains($id,'g')">
                          <xsl:value-of select="substring-before($id,'g')"/>
                      </xsl:when>
                  </xsl:choose>-->
                  <xsl:value-of select="$id"/>
              </xsl:variable>
              <!--End-->
            
            
            
            
            
            
            <xsl:choose>
            <xsl:when test="//XMLElement[@MarkupTag = 'XMLTag/link']/XMLAttribute/replace(@Value,'(cha)([-.])([A-Za-z])([-.])','$1$2$3.') = $id or //XMLElement[@MarkupTag = 'XMLTag/link']/XMLAttribute/replace(@Value,'(cha)([-.])([A-Za-z])([-.])([0-9]+)([.])([0-9]+)([A-Za-z])','$1$2$3.$5$6$7') = $id"> </xsl:when>
                <!--Update for citation 2A 3-7-2019-->
                <xsl:when test="//XMLElement[@MarkupTag = 'XMLTag/link']/XMLAttribute/replace(@Value,'(cha)([-.])([A-Za-z])([-.])','$1$2$3.') = $id or //XMLElement[@MarkupTag = 'XMLTag/link']/XMLAttribute/replace(@Value,'(cha)([-.])([A-Za-z])([-.])([0-9]+)([.])([0-9]+)([A-Za-z])','$1$2$3.$5$6$7') = $id"> </xsl:when>
                <xsl:when test="//XMLElement[@MarkupTag = 'XMLTag/link']/XMLAttribute/replace(@Value,'(cha)([-.])([A-Za-z])([-.])','$1$2$3.') = $id or //XMLElement[@MarkupTag = 'XMLTag/link']/XMLAttribute/replace(@Value,'(cha)([-.])([A-Za-z])([-.])([0-9]+)([.])([0-9]+)([A-Za-z])','$1$2$3.$5$6$7') = $id"> </xsl:when>
                <!--end-->
                <!--Update for caption 2A 20-7-2019-->
                <xsl:when test="//XMLElement[@MarkupTag = 'XMLTag/link']/XMLAttribute/replace(@Value,'(cha)([-.])([A-Za-z])([-.])','$1$2$3.') = $idxcapD or //XMLElement[@MarkupTag = 'XMLTag/link']/XMLAttribute/replace(@Value,'(cha)([-.])([A-Za-z])([-.])([0-9]+)([.])([0-9]+)([A-Za-z])','$1$2$3.$5$6$7') = $idxcapD"> </xsl:when>
                <!--End-->
                
                <xsl:otherwise>
                    <xsl:copy>
                        <xsl:apply-templates select="@* | node()"/>
                    </xsl:copy>
                    
                </xsl:otherwise>
            </xsl:choose>

        </xsl:for-each>
    </xsl:template>
   
    <xsl:template match="XMLElement[@MarkupTag = 'XMLTag/FigureGroup' or @MarkupTag = 'XMLTag/SupplFigureGroup' or @MarkupTag = 'XMLTag/MovieGroup' or @MarkupTag ='XMLTag/MapGroup']">
        <CharacterStyleRange AppliedCharacterStyle="CharacterStyle/$ID/[No character style]">
            <Br/>
        </CharacterStyleRange>
        <!--<xsl:variable name="group">
            <xsl:copy>
                <xsl:apply-templates/>
            </xsl:copy>
        </xsl:variable>
        <xsl:for-each select="//XMLElement[@MarkupTag = 'XMLTag/figure']">
            <xsl:variable name="id" select="XMLAttribute/@Value"/>
            <xsl:choose>
                <xsl:when test="//XMLElement[@MarkupTag = 'XMLTag/link']/XMLAttribute/replace(@Value,'(cha)([-.])([A-Za-z])([-.])','$1$2$3.') = $id"> </xsl:when>
                <xsl:otherwise>
                    <!-\-updated on 24-08-2021 without citation group caption missing-\->
                    <xsl:copy-of select="$group"></xsl:copy-of>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>-->
        <xsl:variable name="id" select="//XMLElement[@MarkupTag = 'XMLTag/figure']/XMLAttribute/@Value"/>
         <xsl:choose>
            <xsl:when test="//XMLElement[@MarkupTag = 'XMLTag/figure']//XMLElement[@MarkupTag = 'XMLTag/link']/XMLAttribute/replace(@Value,'(cha)([-.])([A-Za-z])([-.])','$1$2$3.') = $id"> </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
        <!--<Br/>-->
    </xsl:template>
    <!--if Tableref and figureref citation and table_place_holder both available means i have removed citation linkend value 27-8-2019-->
    <xsl:template match="XMLElement[@MarkupTag='XMLTag/link'][child::XMLAttribute[@Name='linkend']][preceding::XMLElement[@MarkupTag='XMLTag/TableRef']]">
        <xsl:choose>
            <xsl:when test="self::XMLElement[@MarkupTag='XMLTag/link']/XMLAttribute[@Name='linkend'][@Value = //ParagraphStyleRange[contains(@AppliedParagraphStyle,'Table_Place_Holder')]/child::XMLElement[contains(@MarkupTag,'Table_Place_Holder')]/XMLElement[@MarkupTag='XMLTag/links']/XMLAttribute[@Name='linkend']/@Value]"></xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!--<xsl:template match="XMLElement[contains(@MarkupTag , 'XMLTag/link')][child::XMLAttribute[contains(@Name,'linkend')]][ancestor::ParagraphStyleRange/child::XMLElement[contains(@MarkupTag,'XMLTag/TableRef')]]">
        <xsl:message>ji</xsl:message>
           <xsl:choose>
            <!-\-<xsl:when test="self::XMLElement[@MarkupTag='XMLTag/link']/XMLAttribute[@Name='linkend'][@Value = //ParagraphStyleRange[contains(@AppliedParagraphStyle,'Table_Place_Holder')]/child::XMLElement[contains(@MarkupTag,'Table_Place_Holder')]/XMLElement[@MarkupTag='XMLTag/links']/XMLAttribute[@Name='linkend']/@Value]"></xsl:when>-\->
               <xsl:when test="self::XMLElement[contains(@MarkupTag , 'XMLTag/link')]/child::XMLAttribute[contains(@Name,'linkend')][@Value = //ParagraphStyleRange[contains(@AppliedParagraphStyle,'Table_Place_Holder')]/child::XMLElement[contains(@MarkupTag,'Table_Place_Holder')]/XMLElement[@MarkupTag='XMLTag/links']/XMLAttribute[@Name='linkend']/@Value]"></xsl:when>
          <xsl:otherwise>
              <xsl:copy>
              <xsl:apply-templates select="@*|node()"/>
              </xsl:copy>
          </xsl:otherwise>
      </xsl:choose>
    </xsl:template>
    -->
    
    <!--<xsl:template match="XMLElement[contains(@MarkupTag , 'XMLTag/link')][child::XMLAttribute[contains(@Name,'linkend')]][preceding::XMLElement[contains(@MarkupTag,'XMLTag/TableRef')]]">
    <xsl:choose>
         
        <xsl:when test="self::XMLElement[contains(@MarkupTag , 'XMLTag/link')][child::XMLAttribute[contains(@Name,'linkend')]/(@Value = //ParagraphStyleRange[contains(@AppliedParagraphStyle,'Table_Place_Holder')]/child::XMLElement[contains(@MarkupTag,'Table_Place_Holder')]/XMLElement[@MarkupTag='XMLTag/links']/XMLAttribute[@Name='linkend']/@Value)]"></xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>-->
    <!--Figref and Figure_Place_Holder-->
    <xsl:template match="XMLElement[@MarkupTag='XMLTag/link'][child::XMLAttribute[@Name='linkend']][preceding::XMLElement[@MarkupTag='XMLTag/FigureRef']]">
        <xsl:choose>
            <xsl:when test="self::XMLElement[@MarkupTag='XMLTag/link']/XMLAttribute[@Name='linkend'][@Value = //ParagraphStyleRange[contains(@AppliedParagraphStyle,'Figure_Place_Holder')]/child::XMLElement[contains(@MarkupTag,'Figure_Place_Holder')]/XMLElement[@MarkupTag='XMLTag/figure']/XMLElement[@MarkupTag='XMLTag/links']/XMLAttribute[@Name='linkend']/@Value]"></xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!--End-->  
    <!--Added for Figure_Place_Holder and Table_place_Holder for "longleaf" link value 28-8-2019-->
    <xsl:template match="XMLElement[contains(@MarkupTag,'Figure_Place_Holder')]/XMLElement[@MarkupTag='XMLTag/figure'][not(child::XMLElement[@MarkupTag='XMLTag/link'])]/XMLElement[@MarkupTag='XMLTag/links']">
         <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
        <xsl:element name="XMLElement">
            <xsl:attribute name="MarkupTag" select="'XMLTag/link'"/>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <!--With Link-->
    <xsl:template match="XMLElement[contains(@MarkupTag,'Figure_Place_Holder')][child::XMLElement[@MarkupTag='XMLTag/figure']]/XMLElement[@MarkupTag='XMLTag/link']">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    <!--Table_place_Holder-->
    <xsl:template match="XMLElement[contains(@MarkupTag,'Table_Place_Holder')][not(child::XMLElement[@MarkupTag='XMLTag/link'])]/XMLElement[@MarkupTag='XMLTag/links']">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
        <xsl:element name="XMLElement">
            <xsl:attribute name="MarkupTag" select="'XMLTag/link'"/>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <!--With Link-->
    <xsl:template match="XMLElement[contains(@MarkupTag,'Table_Place_Holder')][child::XMLElement[@MarkupTag='XMLTag/links']]/XMLElement[@MarkupTag='XMLTag/link']">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
        </xsl:template>
       </xsl:stylesheet>