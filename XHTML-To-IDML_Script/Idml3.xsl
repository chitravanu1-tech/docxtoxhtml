<?xml version="1.0" encoding="UTF-8"?>
<!-- Image Tag Remove Issue 05.02.2017 -->
<!-- 24-04-18:  move the 'cha-T' attribute value below the table -->
<!--Remove footnote last enter mark 6-12-2014-->
<!--commented on 8-02-2021 to avoid the comment1,comment2 additional-->
<!--Added for inline image via editor 0n 06-09-2021-->
<!-- Added for figure on 8-09-2021 -->
<!-- commented for xmlstruture on 27-11-2023 -->
<!-- 01: image duplicate -->
<!-- Added to handle the box duplicate on 04-09-2024 Azure 15257 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf" exclude-result-prefixes="xs mf" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" version="2.0">
 <xsl:output method="xml" name="xml" />
 <xsl:template match="@*|node()">
 <xsl:copy>
 <xsl:apply-templates select="@*|node()"/>
 </xsl:copy>
 </xsl:template>
	
 <xsl:template match="//XMLElement[@MarkupTag='XMLTag/figure']">
<xsl:choose>   
   <xsl:when test="descendant::XMLElement[@MarkupTag='XMLTag/Image']">
<xsl:copy>
<xsl:attribute name="MarkupTag" select="'XMLTag/figure'"/>
<xsl:variable name="F1">
<xsl:choose>
<xsl:when test="./XMLAttribute[@Name='xml:id']">
<xsl:value-of select="./XMLAttribute/@Value"/>
</xsl:when>
</xsl:choose>
</xsl:variable>
<xsl:for-each select="//XMLElement[@MarkupTag='XMLTag/figure']/XMLElement[@MarkupTag='XMLTag/links']">
 <xsl:variable name="F2">
<xsl:choose>
<xsl:when test="./XMLAttribute[@Name='linkend']">
<xsl:value-of select="./XMLAttribute/@Value"/>
</xsl:when>
</xsl:choose>
</xsl:variable>

<xsl:choose>
<xsl:when test="$F1 eq $F2">
 <xsl:attribute name="Image" select="'Delete'"/>
	</xsl:when>


</xsl:choose> 

</xsl:for-each>
 <xsl:apply-templates select="@*|node()"/>

</xsl:copy>
 
</xsl:when>

<xsl:otherwise>
<xsl:copy>
<xsl:attribute name="MarkupTag" select="'XMLTag/figure'"/>
<xsl:variable name="F1">
<xsl:choose>
<xsl:when test="./XMLAttribute[@Name='xml:id']">
<xsl:value-of select="./XMLAttribute/@Value"/>
</xsl:when>
</xsl:choose>
</xsl:variable>
<xsl:for-each select="//XMLElement[@MarkupTag='XMLTag/figure']/XMLElement[@MarkupTag='XMLTag/links']">
 <xsl:variable name="F2">
<xsl:choose>
<xsl:when test="./XMLAttribute[@Name='linkend']">
<xsl:value-of select="./XMLAttribute/@Value"/>
</xsl:when>
</xsl:choose>
</xsl:variable>

<xsl:choose>
<xsl:when test="$F1 eq $F2">
		
	
	</xsl:when>


</xsl:choose> 

</xsl:for-each>
 <xsl:apply-templates select="@*|node()"/>

</xsl:copy>

</xsl:otherwise>

</xsl:choose>

 </xsl:template>
 <!--commented on 8-02-2021 to avoid the comment1,comment2 additional-->
<!--<xsl:template match="Note/ParagraphStyleRange[1]/CharacterStyleRange[last()]">
  <xsl:variable name="number">
     <xsl:number count="Note/ParagraphStyleRange[1]/CharacterStyleRange[last()]" level="any"/>
     </xsl:variable>
 <CharacterStyleRange AppliedCharacterStyle="CharacterStyle/$ID/[No character style]" AppliedConditions="Condition/Comments">
<Content><xsl:value-of select="'Comment'"/><xsl:value-of select="$number"/></Content>
</CharacterStyleRange>

<xsl:copy>
 <xsl:apply-templates select="@*|node()"/>
</xsl:copy>
</xsl:template>-->
 
 

 
<!--<xsl:template match="CharacterStyleRange">
 <xsl:choose>
 <xsl:when test="ancestor::XMLElement[@MarkupTag='XMLTag/FieldCodeChar']">
 <xsl:copy>
 <xsl:apply-templates select="@*"/>
 <xsl:attribute name="AppliedConditions" select="'Condition/FieldCodeChar'"/>
 <Content>
 <xsl:apply-templates/>
 </Content>
</xsl:copy>
 </xsl:when>
 <xsl:otherwise>
 <xsl:copy>
 <xsl:apply-templates select="@*|node()"/>
</xsl:copy>
 </xsl:otherwise>
 </xsl:choose>
 
 </xsl:template>-->
 <xsl:template match="XMLElement[@MarkupTag='XMLTag/FieldCodeChar']">
 <xsl:copy>
 <xsl:apply-templates select="@*"/>
<xsl:element name="XMLAttribute">
<xsl:attribute name="Self" select="'di2XMLAttributenFieldCode'"/>
<xsl:attribute name="Name" select="'FieldCode'"/>
<xsl:attribute name="Value"><xsl:value-of select="."/></xsl:attribute>
</xsl:element>

 </xsl:copy>
 
 </xsl:template>
 
  <xsl:template match="//ParagraphStyleRange[@AppliedParagraphStyle='ParagraphStyle/$ID/[No paragraph style]$ID/[No paragraph style]']">
 	<ParagraphStyleRange AppliedParagraphStyle="ParagraphStyle/$ID/[No paragraph style]">

 <xsl:apply-templates/>
  
  </ParagraphStyleRange>
 </xsl:template>
 
  <xsl:template match="//ParagraphStyleRange[@AppliedParagraphStyle='ParagraphStyle/$ID/[No paragraph style]$ID/[No paragraph style]$ID/[No paragraph style]']">
 	<ParagraphStyleRange AppliedParagraphStyle="ParagraphStyle/$ID/[No paragraph style]">

 <xsl:apply-templates/>
  
  </ParagraphStyleRange>
 </xsl:template>
 <xsl:template match="//ParagraphStyleRange[@AppliedParagraphStyle='ParagraphStyle/$ID/[No paragraph style]$ID/[No paragraph style]$ID/[No paragraph style]$ID/[No paragraph style]']">
 	<ParagraphStyleRange AppliedParagraphStyle="ParagraphStyle/$ID/[No paragraph style]">

 <xsl:apply-templates/>
  
  </ParagraphStyleRange>
 </xsl:template>
 <xsl:template match="//XMLElement[@MarkupTag='XMLTag/$ID/[No character style]']">
 	
 <xsl:apply-templates/>
 </xsl:template>

  <xsl:template match="//XMLElement[@MarkupTag='XMLTag/$ID/[No paragraph style]$ID/[No paragraph style]']">
 	  <XMLElement MarkupTag="XMLTag/$ID/[No paragraph style]" Self="di2">
 <xsl:apply-templates/>
 </XMLElement>
 </xsl:template>
  <xsl:template match="//XMLElement[@MarkupTag='XMLTag/$ID/[No paragraph style]$ID/[No paragraph style]$ID/[No paragraph style]']">
 	  <XMLElement MarkupTag="XMLTag/$ID/[No paragraph style]" Self="di2">
 <xsl:apply-templates/>
 </XMLElement>
 </xsl:template>
   <xsl:template match="//XMLElement[@MarkupTag='XMLTag/$ID/[No paragraph style]$ID/[No paragraph style]$ID/[No paragraph style]$ID/[No paragraph style]']">
 	  <XMLElement MarkupTag="XMLTag/$ID/[No paragraph style]" Self="di2">
 <xsl:apply-templates/>
 </XMLElement>
 </xsl:template>
 <xsl:template match="//XMLElement[@MarkupTag='XMLTag/Delete']"/>
 <xsl:template match="//XMLElement[@MarkupTag='XMLTag/Document Metadata']"/>
  <xsl:template match="//XMLElement[@MarkupTag='XMLTag/Image']">
<xsl:choose> 
   <xsl:when test="not(ancestor::XMLElement[@MarkupTag='XMLTag/ImageRef'])">
   
   <xsl:choose>
    <xsl:when test="ancestor::XMLElement[@MarkupTag='XMLTag/ImageCaption']"><!-- Image Tag Remove Issue 05.02.2017 -->
     <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
     </xsl:copy>
    </xsl:when>
    <xsl:when test="./XMLAttribute[@Name='href'][@Value='']">
   
  </xsl:when>
  <xsl:otherwise>
     <xsl:copy>
 <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
  </xsl:otherwise>
  </xsl:choose>
  </xsl:when>
  <xsl:otherwise>
  <xsl:copy>
 <xsl:apply-templates select="@*|node()"/>
</xsl:copy>
  </xsl:otherwise>
  </xsl:choose>

  </xsl:template>
 
  

  
  <xsl:template match="Cell">
  		 <xsl:choose>
<xsl:when test="descendant::ParagraphStyleRange[1]">
<xsl:variable name="parastyle" select="descendant::ParagraphStyleRange[1]/@AppliedParagraphStyle"/>
 <xsl:copy>
 <xsl:attribute name="AppliedCellStyle" select="concat('CellStyle/',replace($parastyle,'ParagraphStyle/',''))"/>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
</xsl:when>
<xsl:otherwise>

<xsl:copy>
<xsl:variable name="cellstyle" select="@AppliedCellStyle"/>
 <xsl:attribute name="AppliedCellStyle" select="$cellstyle"/>
           <xsl:apply-templates select="@*|node()"/>
	
</xsl:copy>
</xsl:otherwise>
 </xsl:choose>
		 
  
  
  </xsl:template>
  
 
  
<!--<xsl:template match="XMLElement[@MarkupTag='XMLTag/RGLT']">


 <xsl:copy>
 <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
 
<xsl:variable name="refid">
<xsl:for-each select="XMLAttribute">
<xsl:if test="./@Name='linkend'">
    

<xsl:value-of select="./@Value"/>
</xsl:if>
</xsl:for-each>
</xsl:variable>


<xsl:for-each select="//XMLElement[@MarkupTag='XMLTag/KT']">
<xsl:for-each select="XMLAttribute">
<xsl:if test="./@Name='xml:id'">
<xsl:choose>
	<xsl:when test="./@Value = $refid">
	      <Br/>
<xsl:element name="XMLElement">
<xsl:attribute name="Self" select="'di2'"/>
<xsl:attribute name="MarkupTag">
<xsl:value-of select="'XMLTag/Marginal'"/>
</xsl:attribute>

	<xsl:copy-of select="parent::XMLElement/descendant::ParagraphStyleRange/child::*"/>
	 </xsl:element>


	</xsl:when>
</xsl:choose>
</xsl:if>
</xsl:for-each>
</xsl:for-each>
</xsl:template>

<xsl:template match="XMLElement[@MarkupTag='XMLTag/KT']">
<xsl:variable name="refid">
<xsl:for-each select="XMLAttribute">
<xsl:if test="./@Name='xml:id'">
    

<xsl:value-of select="./@Value"/>
</xsl:if>
</xsl:for-each>
</xsl:variable>
<xsl:variable name="RG">
<xsl:for-each select="//XMLElement[@MarkupTag='XMLTag/RGLT']">
<xsl:for-each select="XMLAttribute">
<xsl:choose>
<xsl:when test="./@Name='linkend'">
<xsl:choose>
	<xsl:when test="./@Value = $refid">
<xsl:value-of select="'true'"/>
</xsl:when>
</xsl:choose>
</xsl:when>
</xsl:choose>
</xsl:for-each>
</xsl:for-each>
</xsl:variable>


<xsl:choose>
<xsl:when test="string-length($RG)=0">
 <xsl:copy>
 <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
</xsl:when>




</xsl:choose>
</xsl:template>-->

 <!--<xsl:template match="CharacterStyleRange/@AppliedConditions[ancestor::XMLElement[@MarkupTag='XMLTag/CommentRange']]"/>
   <xsl:template match="XMLElement[@MarkupTag='XMLTag/CommentRange']">
   <xsl:apply-templates/>
   </xsl:template>-->
    <xsl:template match="@AppliedCellStyle"/>
 

 <!-- 24-04-18:  move the 'cha-T' attribute value below the table -->
 <xsl:template match="//XMLElement[@MarkupTag='XMLTag/table']">
  <xsl:text>&#x000A;</xsl:text>
  <xsl:element name="XMLElement">
   <xsl:copy-of select="@*"/>
   <xsl:text>&#x000A;</xsl:text>
   <xsl:element name="XMLAttribute">
    <xsl:copy-of select="child::XMLElement[1]/XMLAttribute[1]/@*"/>
   </xsl:element>
   <xsl:text>&#x000A;</xsl:text>
   <xsl:apply-templates/> 
  </xsl:element>
 </xsl:template>
 
 
 <!--Remove footnote last enter mark 7-12-2014-->
 <!--<xsl:template match="Footnote/descendant::Br[last()]"/>-->
 <xsl:template match="Footnote/ParagraphStyleRange[last()]/child::CharacterStyleRange/Br"/>
 <!--To Remove footnote entermaRK 28-6-2019-->
 <xsl:template match="Footnote/CharacterStyleRange[last()][Br]"/>
 <!--<xsl:template match="CharacterStyleRange[Br][preceding-sibling::*[1][self::CharacterStyleRange]/Br]"/>-->
 <!--<xsl:template match="CharacterStyleRange[Br][not(following-sibling::*[1][self::ParagraphStyleRange])]"/>-->

 <!-- commented for xmlstruture on 27-11-2023 -->
 <!--<xsl:template match="CharacterStyleRange[Br][following-sibling::*[1][self::XMLAttribute]]"/>-->

 <!--<xsl:template match="Cell//CharacterStyleRange[position() = last()]/Br"/>-->
 
 <xsl:template match="Cell//ParagraphStyleRange[position() = last()]/CharacterStyleRange/Br"/>
 <!--<xsl:template match="Cell//CharacterStyleRange[position()=last()]/Br"/>-->
 <!--end-->
 
 <!--Hyperlink 19-6-2019-->
 <xsl:template match="HyperLink-Text"/>
  <!--End-->
 <!--Added for inline image via editor 0n 06-09-2021-->
 <!--<xsl:template match="XMLElement[@MarkupTag='XMLTag/FigureGroup'][descendant::XMLAttribute[@Value='inline']]">
  
  <xsl:apply-templates/>
  </xsl:template>-->
 <!-- Added for figure on 8-09-2021 -->
 <xsl:template match="ParagraphStyleRange[contains(lower-case(@AppliedParagraphStyle),'source')][not(preceding-sibling::ParagraphStyleRange[contains(lower-case(@AppliedParagraphStyle),'source')][1])][following-sibling::ParagraphStyleRange[contains(lower-case(@AppliedParagraphStyle),'source')][1]]">
  <!--<xsl:text disable-output-escaping="yes">&lt;ParagraphStyleRange AppliedParagraphStyle="ParagraphStyle/source"&gt;</xsl:text>-->
  <xsl:text disable-output-escaping="yes">&lt;XMLElement Self="2" MarkupTag="XMLTag/source"&gt;</xsl:text>
  <xsl:copy>
   <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
 </xsl:template>
 
 <xsl:template match="ParagraphStyleRange[contains(lower-case(@AppliedParagraphStyle),'source')][not(following-sibling::ParagraphStyleRange[contains(lower-case(@AppliedParagraphStyle),'source')][1])][preceding-sibling::ParagraphStyleRange[contains(lower-case(@AppliedParagraphStyle),'source')][1]]">
  <xsl:copy>
   <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
  <xsl:text disable-output-escaping="yes">&lt;/XMLElement&gt;</xsl:text>
  <!--<xsl:text disable-output-escaping="yes">&lt;/ParagraphStyleRange&gt;</xsl:text>-->
 </xsl:template>
 <!-- created duplicate link for citaion with more than one caption values Azure 15087 on 19-6-2024 -->
 <!--<xsl:template match="//XMLElement[@MarkupTag='XMLTag/figure']//XMLAttribute[@Name='xml:id']/@Value">
  <xsl:variable name="xmlidval" select="."/>
  <xsl:choose>
  <xsl:when test="preceding::XMLElement[@MarkupTag='XMLTag/figure']//XMLAttribute[@Name='xml:id']/@Value = $xmlidval">
   <xsl:variable name="pos" select="count(preceding::XMLElement[@MarkupTag='XMLTag/figure']//XMLAttribute[@Name='xml:id']/@Value = $xmlidval)"/>
   <xsl:attribute name="Value">
    <xsl:value-of select="concat($xmlidval,'d',$pos)"/>
   </xsl:attribute>
  </xsl:when>
   <xsl:otherwise><xsl:attribute name="Value">
    <xsl:value-of select="$xmlidval"/>
   </xsl:attribute></xsl:otherwise>
  </xsl:choose>
 </xsl:template>-->
 <xsl:template match="//XMLElement[@MarkupTag='XMLTag/figure']//XMLAttribute[@Name='xml:id']">
  <xsl:variable name="xmlidval" select="self::XMLAttribute[@Name='xml:id']/@Value"/>
  <xsl:copy>
   <xsl:apply-templates select="@*"/>
  <xsl:choose>
   <xsl:when test="preceding::XMLElement[@MarkupTag='XMLTag/figure']//XMLAttribute[@Name='xml:id']/@Value = $xmlidval">
    <xsl:variable name="pos" select="count(preceding::XMLElement[@MarkupTag='XMLTag/figure']//XMLAttribute[@Name='xml:id']/@Value = $xmlidval)"/>
    <xsl:attribute name="Self">
     <xsl:value-of select="self::XMLAttribute[@Name='xml:id']/@Self"/>
     <!--<xsl:value-of select="'info:01'"/>-->
    </xsl:attribute>
    <xsl:attribute name="Info" select="'01'"/>
    <xsl:attribute name="Value">
     <xsl:value-of select="concat($xmlidval,'d',$pos)"/>
    </xsl:attribute>
   </xsl:when>
   <xsl:otherwise><xsl:attribute name="Value">
    <xsl:value-of select="$xmlidval"/>
   </xsl:attribute></xsl:otherwise>
  </xsl:choose>
  </xsl:copy>
 </xsl:template>
 <!-- Added to handle the box duplicate on 04-09-2024 Azure 15257 -->
 <xsl:template match="XMLElement[@MarkupTag='XMLTag/sidebar']//child::XMLAttribute[@Name='xml:id']/@Value">
   <xsl:variable name="xmlid"><xsl:value-of select="."/></xsl:variable>
  <xsl:variable name="followingsidebar"><xsl:value-of select="following::XMLElement[@MarkupTag='XMLTag/sidebar']//child::XMLAttribute[@Name='xml:id']/@Value"/></xsl:variable>
  <xsl:if test="//XMLElement[@MarkupTag='XMLTag/links']//child::XMLAttribute[@Name='linkend'][contains(lower-case(@Value),'cha-b.')][@Value = $xmlid]">
   <xsl:attribute name="Value">
    <xsl:value-of select="."/>
   </xsl:attribute>
  </xsl:if>
  <xsl:if test="//XMLElement[@MarkupTag='XMLTag/links']//child::XMLAttribute[@Name='linkend'][contains(lower-case(@Value),'cha-b.')][not(@Value = $xmlid)] and not($followingsidebar=$xmlid)">
   <xsl:attribute name="Value">
    <xsl:value-of select="."/>
   </xsl:attribute>
  </xsl:if>
  <xsl:if test="//XMLElement[@MarkupTag='XMLTag/links']//child::XMLAttribute[@Name='linkend'][contains(lower-case(@Value),'cha-b.')][not(@Value = $xmlid)] and $followingsidebar=$xmlid">   <xsl:attribute name="Value">
   <xsl:variable name="num"><xsl:value-of select="count(preceding::XMLElement[@MarkupTag='XMLTag/sidebar']//child::XMLAttribute[@Name='xml:id'])"/></xsl:variable>
    <xsl:value-of select="."/>
    <xsl:value-of select="'D'"/>
    <xsl:value-of select="$num"/>
   </xsl:attribute>
  </xsl:if>
  <!-- added to xml:id value missing on 11-10-2024  --> 
  <xsl:if test="not(//XMLElement[@MarkupTag='XMLTag/links']//child::XMLAttribute[@Name='linkend'][contains(lower-case(@Value),'cha-b.')][@Value = $xmlid] or //XMLElement[@MarkupTag='XMLTag/links']//child::XMLAttribute[@Name='linkend'][contains(lower-case(@Value),'cha-b.')][not(@Value = $xmlid)] and not($followingsidebar=$xmlid) or //XMLElement[@MarkupTag='XMLTag/links']//child::XMLAttribute[@Name='linkend'][contains(lower-case(@Value),'cha-b.')][not(@Value = $xmlid)] and $followingsidebar=$xmlid)">
   <xsl:attribute name="Value">
    <xsl:value-of select="."/>
   </xsl:attribute>
  </xsl:if>
 </xsl:template>
 <!-- To remove duplicate xmlid on 10-9-2025 -->
 <xsl:template match="//XMLAttribute[@Name='xml:id'][@Value = preceding-sibling::*[1]/self::XMLAttribute[@Name='xml:id']/@Value]"/>
  </xsl:stylesheet>