<?xml version="1.0"?>
<xsl:stylesheet
    xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
    xmlns:w='http://schemas.openxmlformats.org/wordprocessingml/2006/main'
    xmlns:vt="http://schemas.openxmlformats.org/officeDocument/2006/docPropsVTypes"
    version='2.0' xmlns:o="http://schemas.microsoft.com/office/word/2003/wordml"
xmlns:wx="http://schemas.microsoft.com/office/word/2003/auxHint"
exclude-result-prefixes="w wx vt" xmlns:v="urn:schemas-microsoft-com:vml" 
xmlns:oasis="//OASIS//DTD XML Exchange Table Model 19990315//EN" xmlns:mml="http://www.w3.org/1998/Math/MathML" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:aml="http://schemas.microsoft.com/aml/2001/core">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="no"/>
	<xsl:include href="table.xsl"/>
	<xsl:template match="w:document">
			<xsl:apply-templates select="./w:body"/>
	</xsl:template>
	<xsl:template match="w:body">
<xsl:text disable-output-escaping="yes">&lt;br/&gt;&lt;!DOCTYPE article PUBLIC "-//NLM//DTD Journal Archiving and Interchange DTD v2.2 20060430//EN" "D:\Newgen\archivearticle.dtd"&gt;&lt;br/&gt;</xsl:text>
		<article xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:mml="http://www.w3.org/1998/Math/MathML" xmlns:xlink="http://www.w3.org/1999/xlink" article-type="research-article" dtd-version="2.2"><br/>
<!--<xsl:for-each select="w:customXml='vt:lpwstr'"><editor><xsl:apply-templates/></editor></xsl:for-each>-->
<front><br/>
<journal-meta><br/>
		<journal-id journal-id-type="CATS">xxx</journal-id><br/>
		<journal-id journal-id-type="publisher-code">xxx</journal-id><br/>
		<journal-title>xxx</journal-title><br/>
		<issn pub-type="ppub">xxx</issn><br/>
		<issn pub-type="epub">xxx</issn><br/>
		<publisher><br/>
		<publisher-name>xxx</publisher-name><br/>
		<publisher-loc>xxx</publisher-loc><br/>
		</publisher><br/>
		</journal-meta><br/>
		<article-meta><br/>
		<article-id pub-id-type="doi">xxx</article-id><br/>
		<article-id pub-id-type="publisher-id">xxx</article-id><br/>
		<article-categories><br/>
		<subj-group subj-group-type="heading"><br/>
		<xsl:for-each select="//w:p"><xsl:choose><xsl:when test="w:pPr/w:pStyle/@w:val='FMArticleType'"><subject><xsl:apply-templates/></subject></xsl:when><xsl:otherwise/></xsl:choose></xsl:for-each><br/>

		</subj-group><br/>
		<xsl:for-each select="//w:p"><xsl:choose><xsl:when test="w:pPr/w:pStyle/@w:val='FMSectionEditor'"><series-text><xsl:apply-templates/></series-text></xsl:when><xsl:otherwise/></xsl:choose></xsl:for-each><br/>

		</article-categories><br/>
<title-group><br/>
		<xsl:for-each select="//w:p"><xsl:choose><xsl:when test="w:pPr/w:pStyle/@w:val='FMArticleTitle'"><article-title><xsl:apply-templates/></article-title><br/></xsl:when><xsl:otherwise/></xsl:choose></xsl:for-each>
		
		<xsl:for-each select="//w:p"><xsl:choose><xsl:when test="w:pPr/w:pStyle/@w:val='FMArticleSubtitle'"><subtitle><xsl:apply-templates/></subtitle><br/></xsl:when><xsl:otherwise/></xsl:choose></xsl:for-each>
		<xsl:for-each select="//w:p"><xsl:choose><xsl:when test="w:pPr/w:pStyle/@w:val='FMRunningHeadRecto'"><alt-title alt-title-type="rrh"><xsl:apply-templates/></alt-title><br/></xsl:when><xsl:otherwise/></xsl:choose></xsl:for-each>
		<xsl:for-each select="//w:p"><xsl:choose><xsl:when test="w:pPr/w:pStyle/@w:val='FMRunningHeadVerso'"><alt-title alt-title-type="lrh"><xsl:apply-templates/></alt-title><br/></xsl:when><xsl:otherwise/></xsl:choose></xsl:for-each>
		<xsl:for-each select="//w:p"><xsl:choose><xsl:when test="w:pPr/w:pStyle/@w:val='FMArticleTranslatedTitle'"><alt-title alt-title-type="trans-title"><xsl:apply-templates/></alt-title><br/></xsl:when><xsl:otherwise/></xsl:choose></xsl:for-each>
		</title-group><br/>
		
	
		<contrib-group><br/>
		<xsl:for-each select="//w:p">
<xsl:choose>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMAuthorsOnline'">

   <xsl:for-each select="w:r">
      <xsl:choose>
      <xsl:when test="w:rPr/w:rStyle/@w:val='fmcorrGivenName'">
	 <xsl:if test="w:smallCaps"><xsl:text disable-output-escaping="yes">&lt;smallcaps&gt;</xsl:text><xsl:apply-templates/><xsl:text disable-output-escaping="yes">&lt;/smallcaps&gt;</xsl:text></xsl:if>
      </xsl:when>
      </xsl:choose>
   </xsl:for-each>

   
   
<xsl:for-each select="w:r">
<xsl:choose>

    <!--<xsl:when test="w:delText"><del><xsl:apply-templates/></del></xsl:when>-->

   
<xsl:when test="w:rPr/w:rStyle/@w:val='fmcorrSurname' or w:rPr/w:rStyle/@w:val='fmcorrGivenName'"><contrib contrib-type="author non-byline" corresp="yes"><xsl:element name="{w:rPr/w:rStyle/@w:val}"><xsl:apply-templates/></xsl:element></contrib></xsl:when>

<xsl:when test="w:rPr/w:rStyle/@w:val='fmauCollab'"><contrib contrib-type="author non-byline" corresp="no"><xsl:element name="{w:rPr/w:rStyle/@w:val}"><xsl:apply-templates/></xsl:element></contrib></xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMAuthorsOnline'"><contrib contrib-type="author non-byline" corresp="no"><xsl:apply-templates/></contrib></xsl:when>



<xsl:when test="w:rPr/w:rStyle/@w:val"><contrib contrib-type="author non-byline" corresp="no"><xsl:element name="{w:rPr/w:rStyle/@w:val}"><xsl:apply-templates/></xsl:element></contrib></xsl:when>



<xsl:otherwise><xsl:apply-templates/></xsl:otherwise></xsl:choose></xsl:for-each></xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMAuthorGroup'">

   <xsl:for-each select="w:r">
      <xsl:choose>
      <xsl:when test="w:rPr/w:rStyle/@w:val='fmcorrGivenName'">
	 <xsl:if test="w:smallCaps"><xsl:text disable-output-escaping="yes">&lt;smallcaps&gt;</xsl:text><xsl:apply-templates/><xsl:text disable-output-escaping="yes">&lt;/smallcaps&gt;</xsl:text></xsl:if>
      </xsl:when>
      </xsl:choose>
   </xsl:for-each>   
   
<xsl:for-each select="w:r">
<xsl:choose>

    <!--<xsl:when test="w:delText"><del><xsl:apply-templates/></del></xsl:when>-->

   
<xsl:when test="w:rPr/w:rStyle/@w:val='fmcorrSurname' or w:rPr/w:rStyle/@w:val='fmcorrGivenName'"><contrib contrib-type="author group" corresp="yes"><xsl:element name="{w:rPr/w:rStyle/@w:val}"><xsl:apply-templates/></xsl:element></contrib></xsl:when>

<xsl:when test="w:rPr/w:rStyle/@w:val='fmauCollab'"><contrib contrib-type="author group" corresp="no"><xsl:element name="{w:rPr/w:rStyle/@w:val}"><xsl:apply-templates/></xsl:element></contrib></xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMAuthorGroup'"><contrib contrib-type="author group" corresp="no"><xsl:apply-templates/></contrib></xsl:when>



<xsl:when test="w:rPr/w:rStyle/@w:val"><contrib contrib-type="author group" corresp="no"><xsl:element name="{w:rPr/w:rStyle/@w:val}"><xsl:apply-templates/></xsl:element></contrib></xsl:when>



<xsl:otherwise><xsl:apply-templates/></xsl:otherwise></xsl:choose></xsl:for-each></xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMAuthors'">

   <xsl:for-each select="w:r">
      <xsl:choose>
      <xsl:when test="w:rPr/w:rStyle/@w:val='fmcorrGivenName'">
	 <xsl:if test="w:smallCaps"><xsl:text disable-output-escaping="yes">&lt;smallcaps&gt;</xsl:text><xsl:apply-templates/><xsl:text disable-output-escaping="yes">&lt;/smallcaps&gt;</xsl:text></xsl:if>
      </xsl:when>
      </xsl:choose>
   </xsl:for-each>   
   
<xsl:for-each select="w:r">
<xsl:choose>

    <!--<xsl:when test="w:delText"><del><xsl:apply-templates/></del></xsl:when>-->

   
<xsl:when test="w:rPr/w:rStyle/@w:val='fmcorrSurname' or w:rPr/w:rStyle/@w:val='fmcorrGivenName'"><contrib contrib-type="author" corresp="yes"><xsl:element name="{w:rPr/w:rStyle/@w:val}"><xsl:apply-templates/></xsl:element></contrib></xsl:when>

<xsl:when test="w:rPr/w:rStyle/@w:val='fmauCollab'"><contrib contrib-type="author" corresp="no"><xsl:element name="{w:rPr/w:rStyle/@w:val}"><xsl:apply-templates/></xsl:element></contrib></xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMAuthors'"><contrib contrib-type="author" corresp="no"><xsl:apply-templates/></contrib></xsl:when>



<xsl:when test="w:rPr/w:rStyle/@w:val"><xsl:element name="{w:rPr/w:rStyle/@w:val}"><xsl:apply-templates/></xsl:element></xsl:when>



<xsl:otherwise><xsl:apply-templates/></xsl:otherwise></xsl:choose></xsl:for-each></xsl:when>

<!--<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteAuthorBioHead'"><contrib><bio><title><xsl:apply-templates/></title><p/></bio></contrib></xsl:when>-->

<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteAuthorBio'"><contrib><bio><p><xsl:apply-templates/></p></bio></contrib></xsl:when>
<xsl:when test="w:pPr/w:pStyle/@w:val='FMNotePresentAddress'"><contrib><address><addr-line><xsl:apply-templates/></addr-line></address></contrib></xsl:when><xsl:when test="w:pPr/w:pStyle/@w:val='FMAffiliations'"><aff><xsl:apply-templates/></aff></xsl:when><xsl:when test="w:pPr/w:pStyle/@w:val='Affiliationcontrib'"><aff data-type="contriaff"><xsl:apply-templates/></aff></xsl:when><xsl:otherwise/></xsl:choose></xsl:for-each>

<br/>



		<!--<xsl:for-each select="//w:p"><xsl:choose><xsl:when test="w:pPr/w:pStyle/@w:val='FMAffiliations'"><aff><xsl:apply-templates/></aff><br/></xsl:when><xsl:otherwise/></xsl:choose></xsl:for-each>-->
		</contrib-group><br/>
		<xsl:if test="//w:p/w:pPr/w:pStyle[@w:val='FMNoteCorrespondence'] or //w:p/w:pPr/w:pStyle[@w:val='FMText'] or //w:p/w:pPr/w:pStyle[@w:val='FMVersionofRecord']">
		    <xsl:choose><xsl:when test="w:commentReference"><commentReference/></xsl:when></xsl:choose>
<author-notes><br/>
		<xsl:for-each select="//w:p"><xsl:choose><xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteCorrespondence'"><corresp><xsl:apply-templates/></corresp><br/></xsl:when><xsl:when test="w:pPr/w:pStyle/@w:val='FMText'"><fn id="" fn-type="fntext"><p><xsl:apply-templates/></p></fn><br/></xsl:when><xsl:when test="w:pPr/w:pStyle/@w:val='FMVersionofRecord'"><fn id="" fn-type="versionofrecord"><p><xsl:apply-templates/></p></fn><br/></xsl:when><xsl:otherwise/></xsl:choose></xsl:for-each>
		</author-notes><br/>
		</xsl:if>
		<pub-date pub-type="ppub"><day>00</day><month>00</month><year></year></pub-date><br/>
		<pub-date pub-type="epub"><day>00</day><month>00</month><year></year></pub-date><br/>
		<volume>00</volume><br/>
		<issue>00</issue><br/>
		<fpage>00</fpage><br/>
		<lpage>00</lpage><br/>
		<permissions><br/>
		<copyright-statement>xxx</copyright-statement><br/>
		<copyright-year>xxx</copyright-year><br/>
		</permissions><br/>
		<related-article related-article-type="pdf" xlink:href="xxx.pdf"/><br/>
<abstract><br/>
		<xsl:for-each select="//w:p"><xsl:choose><xsl:when test="w:pPr/w:pStyle/@w:val='FMAbstractParaFlushLeft' or w:pPr/w:pStyle/@w:val='FMAbstractParaInd'"><p><xsl:apply-templates/></p><br/></xsl:when>
		<xsl:when test="w:pPr/w:pStyle/@w:val='FMAbstractHead'"><title><xsl:apply-templates/></title><br/></xsl:when>
<xsl:when test="w:pPr/w:pStyle/@w:val='FMAbstractSectionHeadDisplayed'"><abstitle1><xsl:apply-templates/></abstitle1><br/></xsl:when>
<xsl:when test="w:pPr/w:pStyle/@w:val='FMAbstractSectionHeadADisplayed'"><abstitle1><xsl:apply-templates/></abstitle1><br/></xsl:when>
<xsl:when test="w:pPr/w:pStyle/@w:val='FMAbstractSectionHeadBDisplayed'"><abstitle2><xsl:apply-templates/></abstitle2><br/></xsl:when>
<xsl:when test="w:pPr/w:pStyle/@w:val='FMAbstractSectionHeadCDisplayed'"><abstitle3><xsl:apply-templates/></abstitle3><br/></xsl:when>
<xsl:when test="w:pPr/w:pStyle/@w:val='FMAbstractSectionHeadDDisplayed'"><abstitle4><xsl:apply-templates/></abstitle4><br/></xsl:when>
<xsl:when test="w:pPr/w:pStyle/@w:val='FMAbstractBL1'"><FMAbstractBL1><xsl:apply-templates/></FMAbstractBL1><br/></xsl:when>
<xsl:when test="w:pPr/w:pStyle/@w:val='FMAbstractBL2'"><FMAbstractBL2><xsl:apply-templates/></FMAbstractBL2><br/></xsl:when>
<xsl:when test="w:pPr/w:pStyle/@w:val='FMAbstractBL3'"><FMAbstractBL3><xsl:apply-templates/></FMAbstractBL3><br/></xsl:when>
<xsl:when test="w:pPr/w:pStyle/@w:val='FMAbstractUL1'"><FMAbstractUL1><xsl:apply-templates/></FMAbstractUL1><br/></xsl:when>
<xsl:when test="w:pPr/w:pStyle/@w:val='FMAbstractUL2'"><FMAbstractUL2><xsl:apply-templates/></FMAbstractUL2><br/></xsl:when>
<xsl:when test="w:pPr/w:pStyle/@w:val='FMAbstractUL3'"><FMAbstractUL3><xsl:apply-templates/></FMAbstractUL3><br/></xsl:when>
<xsl:when test="w:pPr/w:pStyle/@w:val='FMAbstractOL1'"><FMAbstractOL1><xsl:apply-templates/></FMAbstractOL1><br/></xsl:when>
<xsl:when test="w:pPr/w:pStyle/@w:val='FMAbstractOL2'"><FMAbstractOL2><xsl:apply-templates/></FMAbstractOL2><br/></xsl:when>
<xsl:when test="w:pPr/w:pStyle/@w:val='FMAbstractOL3'"><FMAbstractOL3><xsl:apply-templates/></FMAbstractOL3><br/></xsl:when>
<xsl:otherwise/></xsl:choose></xsl:for-each>
		</abstract><br/>
<xsl:if test="//w:p/w:pPr/w:pStyle/@w:val='PLOSSummary'">
<abstract abstract-type="summary"><br/>
<xsl:for-each select="//w:p"><xsl:choose><xsl:when test="w:pPr/w:pStyle/@w:val='PLOSSummaryParaFlushLeft' or w:pPr/w:pStyle/@w:val='PLOSSummaryParaInd'"><p><xsl:apply-templates/></p><br/></xsl:when>
<xsl:when test="w:pPr/w:pStyle/@w:val='PLOSSummary'"><title><xsl:apply-templates/></title><br/></xsl:when>
<xsl:otherwise/></xsl:choose></xsl:for-each>
</abstract><br/>
</xsl:if>
<abstract abstract-type="teaser"><br/>
		<xsl:for-each select="//w:p"><xsl:choose><xsl:when test="w:pPr/w:pStyle/@w:val='FMSummaryParaFlushLeft' or w:pPr/w:pStyle/@w:val='FMSummaryParaInd'"><p><xsl:apply-templates/></p><br/></xsl:when>
		<xsl:when test="w:pPr/w:pStyle/@w:val='FMSummaryHead'"><title><xsl:apply-templates/></title><br/></xsl:when>
<xsl:otherwise/></xsl:choose></xsl:for-each>
		</abstract><br/>
<abstract abstract-type="summary"><br/>
		<xsl:for-each select="//w:p"><xsl:choose><xsl:when test="w:pPr/w:pStyle/@w:val='PLOSSummaryParaFlushLeft' or w:pPr/w:pStyle/@w:val='PLOSSummaryParaInd'"><p><xsl:apply-templates/></p><br/></xsl:when>
		<xsl:when test="w:pPr/w:pStyle/@w:val='PLOSSummary'"><title><xsl:apply-templates/></title><br/></xsl:when>
<xsl:otherwise/></xsl:choose></xsl:for-each>
		</abstract><br/>			
<abstract abstract-type="layperson"><br/>
		<xsl:for-each select="//w:p"><xsl:choose><xsl:when test="w:pPr/w:pStyle/@w:val='FMLayAbstractParaFlushLeft' or w:pPr/w:pStyle/@w:val='FMLayAbstractParaInd'"><p><xsl:apply-templates/></p><br/></xsl:when>
		<xsl:when test="w:pPr/w:pStyle/@w:val='FMLayAbstractHead'"><title><xsl:apply-templates/></title><br/></xsl:when>
<xsl:when test="w:pPr/w:pStyle/@w:val='FMLayAbstractParaFlushLeft'"><FMAbstractSectionDisplayed><xsl:apply-templates/></FMAbstractSectionDisplayed><br/></xsl:when>
<xsl:otherwise/></xsl:choose></xsl:for-each>
		</abstract><br/>

		

<trans-abstract><br/>
		<xsl:for-each select="//w:p"><xsl:choose><xsl:when test="w:pPr/w:pStyle/@w:val='FMTransAbstractParaFlushLeft' or w:pPr/w:pStyle/@w:val='FMTransAbstractParaInd'"><p><xsl:apply-templates/></p><br/></xsl:when>
		<xsl:when test="w:pPr/w:pStyle/@w:val='FMTransAbstractHead'"><title><xsl:apply-templates/></title><br/></xsl:when>
<xsl:when test="w:pPr/w:pStyle/@w:val='FMTransAbstractSectionHeadDisplayed'"><FMAbstractSectionDisplayed><xsl:apply-templates/></FMAbstractSectionDisplayed><br/></xsl:when>
<xsl:otherwise/></xsl:choose></xsl:for-each>
		</trans-abstract><br/>		
<xsl:if test="//w:p/w:pPr/w:pStyle/@w:val='FMGrapAbstractHead' or //w:pPr/w:pStyle/@w:val='FMGrapAbstractParaInd' or //w:pPr/w:pStyle/@w:val='FMGrapAbstractParaFlushLeft'">		
<abstract abstract-type="graphical-abstract"><br/>
		<xsl:for-each select="//w:p"><xsl:choose><xsl:when test="w:pPr/w:pStyle/@w:val='FMGrapAbstractParaFlushLeft' or w:pPr/w:pStyle/@w:val='FMGrapAbstractParaInd'"><p><xsl:apply-templates/></p><br/></xsl:when>
		<xsl:when test="w:pPr/w:pStyle/@w:val='FMGrapAbstractHead'"><title><xsl:apply-templates/></title><br/></xsl:when>
		
<xsl:otherwise/></xsl:choose></xsl:for-each>
		</abstract><br/>		
</xsl:if>

<xsl:if test="//w:p/w:pPr/w:pStyle/@w:val='FMVideoAbstractHead' or //w:pPr/w:pStyle/@w:val='FMVideoAbstractParaInd' or //w:pPr/w:pStyle/@w:val='FMVideoAbstractParaFlushLeft' or //w:pPr/w:pStyle/@w:val='VideoNumber' or //w:pPr/w:pStyle/@w:val='VideoSource'">		
<abstract abstract-type="video"><br/>
		<xsl:for-each select="//w:p"><xsl:choose><xsl:when test="w:pPr/w:pStyle/@w:val='FMVideoAbstractParaFlushLeft' or w:pPr/w:pStyle/@w:val='FMVideoAbstractParaInd'"><p><xsl:apply-templates/></p><br/></xsl:when>
		<xsl:when test="w:pPr/w:pStyle/@w:val='FMVideoAbstractHead'"><title><xsl:apply-templates/></title><br/></xsl:when>
		<xsl:when test="w:pPr/w:pStyle/@w:val='VideoNumber'"><object-id pub-id-type="referenceid"><xsl:apply-templates/></object-id><br/></xsl:when>
		<xsl:when test="w:pPr/w:pStyle/@w:val='VideoSource'"><object-id pub-id-type="videoid"><xsl:apply-templates/></object-id><br/></xsl:when>
<xsl:otherwise/></xsl:choose></xsl:for-each>
		</abstract><br/>		
</xsl:if>

<xsl:if test="//w:p/w:pPr/w:pStyle/@w:val='FMOnlineGrapAbstractHead' or //w:pPr/w:pStyle/@w:val='FMOnlineGrapAbstractParaInd' or //w:pPr/w:pStyle/@w:val='FMOnlineGrapAbstractParaFlushLeft'">		
<abstract abstract-type="graphical-abstract-online"><br/>
		<xsl:for-each select="//w:p"><xsl:choose><xsl:when test="w:pPr/w:pStyle/@w:val='FMOnlineGrapAbstractParaFlushLeft' or w:pPr/w:pStyle/@w:val='FMOnlineGrapAbstractParaInd'"><p><xsl:apply-templates/></p><br/></xsl:when>
		<xsl:when test="w:pPr/w:pStyle/@w:val='FMOnlineGrapAbstractHead'"><title><xsl:apply-templates/></title><br/></xsl:when>
<xsl:otherwise/></xsl:choose></xsl:for-each>
		</abstract><br/>		
</xsl:if>

<xsl:if test="//w:p/w:pPr/w:pStyle/@w:val='FMTOCStatement'">
   <abstract abstract-type="toc">
      <br/>
   <xsl:for-each select="//w:p">
   <xsl:choose>
   <xsl:when test="w:pPr/w:pStyle/@w:val='FMTOCStatement'"><p><xsl:apply-templates/></p><br/></xsl:when>
   </xsl:choose>
   </xsl:for-each>
   </abstract>
   <br/>
</xsl:if>
   		
<xsl:if test="//w:p/w:pPr/w:pStyle/@w:val='Keywords' or //w:p/w:pPr/w:pStyle/@w:val='Pests' or //w:p/w:pPr/w:pStyle/@w:val='Hosts'">

   <xsl:choose><xsl:when test="w:commentReference"><commentReference/></xsl:when></xsl:choose>
		<xsl:for-each select="//w:p"><xsl:choose>

		   
		   <xsl:when test="w:pPr/w:pStyle/@w:val='ng-keywords' or w:pPr/w:pStyle/@w:val='Keywords'"><kwd-group><br/><xsl:apply-templates/></kwd-group><br/></xsl:when>
		   <xsl:when test="w:pPr/w:pStyle/@w:val='ng-keywords' or w:pPr/w:pStyle/@w:val='Hosts'"><kwd-group kwd-group-type="Hosts"><br/><kwd><xsl:apply-templates/></kwd><br/></kwd-group><br/></xsl:when>
		   <xsl:when test="w:pPr/w:pStyle/@w:val='ng-keywords' or w:pPr/w:pStyle/@w:val='Pests'"><kwd-group kwd-group-type="Pests"><br/><kwd><xsl:apply-templates/></kwd><br/></kwd-group><br/></xsl:when>
		   
		   <xsl:otherwise/></xsl:choose></xsl:for-each>
		</xsl:if>
<xsl:if test="//w:p/w:pPr/w:pStyle/@w:val='KeywordsTrans'">

 
   <xsl:choose><xsl:when test="w:commentReference"><commentReference/></xsl:when></xsl:choose>
 

		<xsl:for-each select="//w:p"><xsl:choose>

		   
		   <xsl:when test="w:pPr/w:pStyle/@w:val='ng-keywords' or w:pPr/w:pStyle/@w:val='KeywordsTrans'"><kwd-group><br/><xsl:apply-templates/></kwd-group><br/></xsl:when>
		   
		   <xsl:otherwise/></xsl:choose></xsl:for-each>
		</xsl:if>		
<xsl:if test="//w:p/w:pPr/w:pStyle/@w:val='MeetingReportTitle'">
		 <conference><br/>
		    <xsl:for-each select="//w:p"><xsl:choose>
		<xsl:when test="w:pPr/w:pStyle/@w:val='MeetingReportTitle'">
		   <conf-name><xsl:apply-templates/></conf-name><br/>
		</xsl:when>
		<xsl:when test="w:pPr/w:pStyle/@w:val='MeetingLocation'">
		   <conf-loc><xsl:apply-templates/></conf-loc><br/>
		</xsl:when>
		</xsl:choose>
		</xsl:for-each>
		</conference><br/>
		</xsl:if>   		
		</article-meta><br/>
		<xsl:if test="//w:p/w:pPr/w:pStyle[@w:val='FMNoteCopyrightLine']">
<notes><br/>
   
   <fn-group><br/>
<xsl:for-each select="//w:p"><xsl:choose><xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteCopyrightLine'"><fn fn-type="fn"><p><xsl:apply-templates/></p></fn><br/></xsl:when>
  
	    
		</xsl:choose></xsl:for-each>

</fn-group><br/></notes><br/>

</xsl:if>
		
<xsl:if test="//w:p/w:pPr/w:pStyle/@w:val='Abbreviations'">
			<def-list><br/>
				<xsl:for-each select="//w:p"><xsl:choose><xsl:when test="w:pPr/w:pStyle/@w:val='Abbreviations'"><xsl:apply-templates/><br/></xsl:when><xsl:otherwise/></xsl:choose></xsl:for-each>
				
			</def-list><br/>
		</xsl:if>
</front><br/>
	<body><br/><xsl:apply-templates/>
	   <LWW_Back_Matter>
	   <xsl:if test="//w:p/w:pPr/w:pStyle[@w:val='LWWSecA'] or //w:p/w:pPr/w:pStyle[@w:val='LWWSecB'] or //w:p/w:pPr/w:pStyle[@w:val='LWWSecC']or //w:p/w:pPr/w:pStyle[@w:val='LWWEMText'] or //w:p/w:pPr/w:pStyle[@w:val='LWWEMTextInd']">	<xsl:for-each select="//w:p"><xsl:choose><xsl:when test="w:pPr/w:pStyle/@w:val='EMDisclaimerHead'"><ackhead><xsl:apply-templates/></ackhead><br/></xsl:when>

		   <xsl:when test="w:pPr/w:pStyle/@w:val='LWWSecA'"><sec1/><title1><xsl:apply-templates/></title1><br/></xsl:when>
		      
		<xsl:when test="w:pPr/w:pStyle/@w:val='LWWSecB'"><sec2/><title2><xsl:apply-templates/></title2><br/></xsl:when>
		<xsl:when test="w:pPr/w:pStyle/@w:val='LWWSecC'"><sec3/><title3><xsl:apply-templates/></title3><br/></xsl:when>
		<xsl:when test="w:pPr/w:pStyle/@w:val='LWWEMText'"><p content-type="flush left"><xsl:apply-templates/></p><br/></xsl:when>
		
		<xsl:when test="w:pPr/w:pStyle/@w:val='LWWEMTextInd'"><p content-type="Indent"><xsl:apply-templates/></p><br/></xsl:when>
		
<xsl:otherwise/></xsl:choose></xsl:for-each></xsl:if></LWW_Back_Matter></body><br/>
<back><br/>
   <xsl:if test="//w:p/w:pPr/w:pStyle[@w:val='EMNotes'] or //w:p/w:pPr/w:pStyle[@w:val='EMNotesText'] or //w:p/w:pPr/w:pStyle[@w:val='FMNotesText']">
<notes><br/>
     <xsl:for-each select="//w:p"><xsl:choose><xsl:when test="w:pPr/w:pStyle/@w:val='EMNotes'"><title><xsl:apply-templates/></title><br/></xsl:when></xsl:choose></xsl:for-each>
      <!--<xsl:for-each select="//w:p"><xsl:choose><xsl:when test="w:pPr/w:pStyle/@w:val='FMVersionofRecord'"><p content-type="version_of_record"><xsl:apply-templates/></p><br/></xsl:when></xsl:choose></xsl:for-each>-->
<xsl:for-each select="//w:p">
<xsl:choose>
<xsl:when test="w:pPr/w:pStyle/@w:val='EMNotesText'"><p><xsl:apply-templates/></p><br/></xsl:when>

<xsl:otherwise/></xsl:choose></xsl:for-each>
<xsl:for-each select="//w:p">
<xsl:choose>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMNotesText'"><p content-type="fn-text"><xsl:apply-templates/></p><br/></xsl:when>
<xsl:otherwise/></xsl:choose></xsl:for-each>
</notes>
</xsl:if>
   <glossary><br/>
      
   <xsl:if test="//w:p/w:pPr/w:pStyle[@w:val='EMGlossaryTitle'] or //w:pPr/w:pStyle[@w:val='EMGlossaryEntry']">
	
		<xsl:for-each select="//w:p"><xsl:choose><xsl:when test="w:pPr/w:pStyle/@w:val='EMGlossaryTitle'"><title><xsl:apply-templates/></title><br/></xsl:when>
		
		<xsl:when test="w:pPr/w:pStyle/@w:val='EMGlossaryEntry'"><xsl:apply-templates/><br/></xsl:when>
		
		
<xsl:otherwise/></xsl:choose></xsl:for-each>
		
<br/></xsl:if>
</glossary><br/>
<xsl:if test="//w:p/w:pPr/w:pStyle[@w:val='EMAcknowledgmentsHead'] or //w:pPr/w:pStyle[@w:val='EMAcknowledgmentsText'] or //w:pPr/w:pStyle[@w:val='EMOtherSectionTitle'] or //w:pPr/w:pStyle[@w:val='EMDisclaimerHead'] or //w:pPr/w:pStyle[@w:val='EMDisclaimerText'] or //w:pPr/w:pStyle[@w:val='EMHeadA'] or //w:pPr/w:pStyle[@w:val='EMHeadB'] or //w:pPr/w:pStyle[@w:val='EMHeadA'] or //w:pPr/w:pStyle[@w:val='EMHeadC'] or //w:pPr/w:pStyle[@w:val='EMHeadA'] or //w:pPr/w:pStyle[@w:val='EMHeadD'] or //w:pPr/w:pStyle[@w:val='EMHeadA'] or //w:pPr/w:pStyle[@w:val='EMText'] or //w:pPr/w:pStyle[@w:val='EMTextInd'] or //w:pPr/w:pStyle[@w:val='BrillSecA'] or //w:pPr/w:pStyle[@w:val='BrillSecB'] or //w:pPr/w:pStyle[@w:val='BrillSecC'] or //w:pPr/w:pStyle[@w:val='BrillSecD'] or //w:pPr/w:pStyle[@w:val='BrillEMText'] or //w:pPr/w:pStyle[@w:val='BrillTextInd']">
		
		<xsl:for-each select="//w:p"><xsl:choose><xsl:when test="w:pPr/w:pStyle/@w:val='EMDisclaimerHead'"><ackhead><xsl:apply-templates/></ackhead><br/></xsl:when>

		   <xsl:when test="w:pPr/w:pStyle/@w:val='EMAcknowledgmentsHead'"><ackhead><xsl:apply-templates/></ackhead><br/></xsl:when>
		      
		<xsl:when test="w:pPr/w:pStyle/@w:val='EMAcknowledgmentsText'"><acktext><xsl:apply-templates/></acktext><br/></xsl:when>
		<xsl:when test="w:pPr/w:pStyle/@w:val='EMDisclaimerText'"><acktext><xsl:apply-templates/></acktext><br/></xsl:when>
		
		<xsl:when test="w:pPr/w:pStyle/@w:val='EMOtherSectionTitle'"><ack content-type="DOI"><p><xsl:apply-templates/></p></ack><br/></xsl:when>
		<xsl:when test="w:pPr/w:pStyle/@w:val='EMHeadA'"><ack content-type="HeadA"><p><xsl:apply-templates/></p></ack><br/></xsl:when>
		<xsl:when test="w:pPr/w:pStyle/@w:val='EMHeadB'"><ack content-type="HeadB"><p><xsl:apply-templates/></p></ack><br/></xsl:when>
		<xsl:when test="w:pPr/w:pStyle/@w:val='EMHeadC'"><ack content-type="HeadC"><p><xsl:apply-templates/></p></ack><br/></xsl:when>
		<xsl:when test="w:pPr/w:pStyle/@w:val='EMHeadD'"><ack content-type="HeadD"><p><xsl:apply-templates/></p></ack><br/></xsl:when>

		<xsl:when test="w:pPr/w:pStyle/@w:val='EMText'"><p><xsl:apply-templates/></p><br/></xsl:when>
		<xsl:when test="w:pPr/w:pStyle/@w:val='EMTextInd'"><p content-type="indent"><xsl:apply-templates/></p><br/></xsl:when>
		<xsl:when test="w:pPr/w:pStyle/@w:val='BrillSecA'"><BrillSecA><title1><xsl:apply-templates/></title1></BrillSecA><br/></xsl:when>
		<xsl:when test="w:pPr/w:pStyle/@w:val='BrillSecB'"><BrillSecB><title2><xsl:apply-templates/></title2></BrillSecB><br/></xsl:when>
		<xsl:when test="w:pPr/w:pStyle/@w:val='BrillSecC'"><BrillSecC><title3><xsl:apply-templates/></title3></BrillSecC><br/></xsl:when>
		<xsl:when test="w:pPr/w:pStyle/@w:val='BrillSecD'"><BrillSecD><title4><xsl:apply-templates/></title4></BrillSecD><br/></xsl:when>

		<xsl:when test="w:pPr/w:pStyle/@w:val='BrillEMText'"><BrillEMText><xsl:apply-templates/></BrillEMText><br/></xsl:when>
		<xsl:when test="w:pPr/w:pStyle/@w:val='BrillEMTextInd'"><BrillEMTextInd><xsl:apply-templates/></BrillEMTextInd><br/></xsl:when>
<xsl:otherwise/></xsl:choose></xsl:for-each>
		
<br/></xsl:if>

<!--<xsl:if test="//w:p/w:pPr/w:pStyle[@w:val='EMOtherSectionTitle']">
		<xsl:for-each select="//w:p"><xsl:choose><xsl:when test="w:pPr/w:pStyle/@w:val='EMOtherSectionTitle'"><ack content-type="DOI"><p><xsl:apply-templates/></p></ack><br/></xsl:when>
		
<xsl:otherwise/></xsl:choose></xsl:for-each>
		
<br/></xsl:if>-->


	
<ref-list><br/>
		<xsl:for-each select="//w:p"><xsl:choose><xsl:when test="w:pPr/w:pStyle/@w:val='EMReferencesHead'"><title><xsl:apply-templates/></title><br/></xsl:when>
		<xsl:when test="w:pPr/w:pStyle/@w:val='EMReferencesHeadA'"><refsec1/><title><xsl:apply-templates/></title><br/></xsl:when>
		<xsl:when test="w:pPr/w:pStyle/@w:val='EMReferencesHeadB'"><refsec2/><title><xsl:apply-templates/></title><br/></xsl:when>
		<xsl:when test="w:pPr/w:pStyle/@w:val='EMReferencesHeadC'"><refsec3/><title><xsl:apply-templates/></title><br/></xsl:when>
		<xsl:when test="w:pPr/w:pStyle/@w:val='EMReferencesHeadD'"><refsec4/><title><xsl:apply-templates/></title><br/></xsl:when>  
		<xsl:when test="w:pPr/w:pStyle/@w:val='Reference'"><ref><xsl:apply-templates/></ref><br/></xsl:when>
		

		<xsl:when test="w:pPr/w:pStyle/@w:val='refpara'"><p><xsl:apply-templates/></p><br/></xsl:when>

		<xsl:when test="w:pPr/w:pStyle/@w:val='RefList'"><RefList><xsl:apply-templates/></RefList><br/></xsl:when>

		<xsl:when test="w:pPr/w:pStyle/@w:val='RefNote'"><RefNote><xsl:apply-templates/></RefNote><br/></xsl:when>

		<xsl:when test="w:pPr/w:pStyle/@w:val='RefPara'"><refpara><xsl:apply-templates/></refpara><br/></xsl:when>

		<xsl:when test="w:pPr/w:pStyle/@w:val='RefAnnotationPara'"><notes><p><xsl:apply-templates/></p></notes><br/></xsl:when>

</xsl:choose></xsl:for-each>
</ref-list><br/>
<xsl:if test="//w:p/w:pPr/w:pStyle[@w:val='FMNoteConflict'] or //w:p/w:pPr/w:pStyle[@w:val='FMNoteFunding'] or //w:p/w:pPr/w:pStyle[@w:val='FMNoteContributions'] or //w:p/w:pPr/w:pStyle[@w:val='FMNoteSupplementaryMaterial'] or //w:p/w:pPr/w:pStyle[@w:val='FMNoteSupplementaryMaterial'] or //w:p/w:pPr/w:pStyle[@w:val='FMNotePreviousAddress'] or //w:p/w:pPr/w:pStyle[@w:val='FMNoteDeceased'] or //w:p/w:pPr/w:pStyle[@w:val='FMNoteConferenceHistory'] or //w:p/w:pPr/w:pStyle[@w:val='FMNotePresent'] or //w:p/w:pPr/w:pStyle[@w:val='FMNoteLevel'] or //w:p/w:pPr/w:pStyle[@w:val='FMCustomMetaLogo'] or //w:p/w:pPr/w:pStyle[@w:val='FMNoteGuestEditor'] or //w:p/w:pPr/w:pStyle[@w:val='FMNoteHandlingEditor'] or //w:p/w:pPr/w:pStyle[@w:val='FMNoteDisclaimer'] or //w:p/w:pPr/w:pStyle[@w:val='FMNoteAttribute'] or //w:p/w:pPr/w:pStyle[@w:val='FMNoteAttributeHead'] or //w:p/w:pPr/w:pStyle[@w:val='FMNoteContributors'] or //w:p/w:pPr/w:pStyle[@w:val='FMNoteEditorBio'] or //w:p/w:pPr/w:pStyle[@w:val='FMNoteURL'] or //w:p/w:pPr/w:pStyle[@w:val='FMNoteArticleCitation'] or //w:p/w:pPr/w:pStyle[@w:val='FMNoteClinicalTrailInfo'] or //w:p/w:pPr/w:pStyle[@w:val='FMNoteEthicalApprovalStatement'] or //w:p/w:pPr/w:pStyle[@w:val='FMNoteOnline'] or //w:p/w:pPr/w:pStyle[@w:val='FMNoteCodeDataRequest'] or //w:p/w:pPr/w:pStyle[@w:val='FMMSHistoryDetails'] or //w:p/w:pPr/w:pStyle[@w:val='FMNoteWorkplace'] or //w:p/w:pPr/w:pStyle[@w:val='FMNoteSubmitted'] or //w:p/w:pPr/w:pStyle[@w:val='FMNoteConsent'] or //w:p/w:pPr/w:pStyle[@w:val='FMNoteMiscellaneous'] or //w:p/w:pPr/w:pStyle[@w:val='FMNoteIRBInfo'] or //w:p/w:pPr/w:pStyle[@w:val='FMNoteDiscussant'] or //w:p/w:pPr/w:pStyle[@w:val='FMNoteStudyGroupMembersDetails'] or //w:p/w:pPr/w:pStyle[@w:val='FMNoteMemberID'] or //w:p/w:pPr/w:pStyle[@w:val='FMNotePresentAddressDetails'] or //w:p/w:pPr/w:pStyle[@w:val='FMNoteTweet'] or //w:p/w:pPr/w:pStyle[@w:val='FMNotePatentDetails'] or //w:p/w:pPr/w:pStyle[@w:val='FMNoteSummary'] or //w:p/w:pPr/w:pStyle[@w:val='FMNoteOrcid'] or //w:p/w:pPr/w:pStyle[@w:val='FMNotePublished'] or //w:p/w:pPr/w:pStyle[@w:val='FMNoteWebsite'] or //w:p/w:pPr/w:pStyle[@w:val='FMNoteRoyalty'] or //w:p/w:pPr/w:pStyle[@w:val='FMNoteCopyrightStatement'] or //w:p/w:pPr/w:pStyle[@w:val='FMNoteProductInfo']  or //w:p/w:pPr/w:pStyle[@w:val='FMNoteReport'] or //w:p/w:pPr/w:pStyle[@w:val='FMNoteReprint'] or //w:p/w:pPr/w:pStyle[@w:val='FMNoteAuthor'] or //w:p/w:pPr/w:pStyle[@w:val='FMNoteCMEStatement'] or //w:p/w:pPr/w:pStyle[@w:val='FMNoteInfographic']">
<fn-group><br/>
     <xsl:for-each select="//w:p"><xsl:choose><xsl:when test="w:pPr/w:pStyle/@w:val='EMNotesTitle'"><title><xsl:apply-templates/></title><br/></xsl:when></xsl:choose></xsl:for-each>
<xsl:for-each select="//w:p">
<xsl:choose>
<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteContributions'"><fn id="" fn-type="equal"><p><xsl:apply-templates/></p></fn><br/></xsl:when>
<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteSupplementaryMaterial'"><fn id="" fn-type="supplementary-material"><p><xsl:apply-templates/></p></fn><br/></xsl:when>
<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteConflict'"><fn id="" fn-type="conflict"><p><xsl:apply-templates/></p></fn><br/></xsl:when>
<xsl:when test="w:pPr/w:pStyle/@w:val='FMNotePreviousAddress'"><fn id="" fn-type="previously-at"><p><xsl:apply-templates/></p></fn><br/></xsl:when>
<!--<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteStudyGroupMembers'"><fn id="" fn-type="study-group-members"><p><xsl:apply-templates/></p></fn><br/></xsl:when>-->
<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteDeceased'"><fn id="" fn-type="deceased"><p><xsl:apply-templates/></p></fn><br/></xsl:when>
<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteFunding'"><fn id="" fn-type="financial-disclosure"><p><xsl:apply-templates/></p></fn><br/></xsl:when>
<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteConferenceHistory'"><fn id="" fn-type="conferencehistory"><p><xsl:apply-templates/></p></fn><br/></xsl:when>
<xsl:when test="w:pPr/w:pStyle/@w:val='FMNotePresent'"><fn id="" fn-type="present"><p><xsl:apply-templates/></p></fn><br/></xsl:when>
<xsl:when test="w:pPr/w:pStyle/@w:val='FMNotePresentAddressDetails'"><fn id="" fn-type="Note_Present_AddressDetails"><p><xsl:apply-templates/></p></fn><br/></xsl:when>
<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteLevel'"><fn id="" fn-type="level"><p><xsl:apply-templates/></p></fn><br/></xsl:when>
<xsl:when test="w:pPr/w:pStyle/@w:val='FMCustomMetaLogo'"><fn id="" fn-type="custommeta"><p><xsl:apply-templates/></p></fn><br/></xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteHandlingEditor'"><fn id="" fn-type="notehandling"><p><xsl:apply-templates/></p></fn><br/></xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteDisclaimer'"><fn id="" fn-type="disclaimer"><p><xsl:apply-templates/></p></fn><br/></xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteGuestEditor'"><fn id="" fn-type="guesteditor"><p><xsl:apply-templates/></p></fn><br/></xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteAttribute'"><fn id="" fn-type="attribute"><p><xsl:apply-templates/></p></fn><br/></xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteAttributeHead'"><fn id="" fn-type="attributehead"><p><xsl:apply-templates/></p></fn><br/></xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteContributors'"><fn id="" fn-type="equal"><p><xsl:apply-templates/></p></fn><br/></xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteEditorBio'"><fn id="" fn-type="EditorBio"><p><xsl:apply-templates/></p></fn><br/></xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteURL'"><fn id="" fn-type="url"><p><xsl:apply-templates/></p></fn><br/></xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteArticleCitation'"><fn id="" fn-type="ArticleCitation"><p><xsl:apply-templates/></p></fn><br/></xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteClinicalTrailInfo'"><fn id="" fn-type="Clinical_Trail_Info"><p><xsl:apply-templates/></p></fn><br/></xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteEthicalApprovalStatement'"><fn id="" fn-type="EthicalApprovalStatement"><p><xsl:apply-templates/></p></fn><br/></xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteOnline'"><fn id="" fn-type="Online"><p><xsl:apply-templates/></p></fn><br/></xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteCodeDataRequest'"><fn id="" fn-type="Code_Data_Request"><p><xsl:apply-templates/></p></fn><br/></xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMMSHistoryDetails'"><fn id="" fn-type="MS_History_Details"><p><xsl:apply-templates/></p></fn><br/></xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteWorkplace'"><fn id="" fn-type="Note_Work_place"><p><xsl:apply-templates/></p></fn><br/></xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteConsent'"><fn id="" fn-type="Note_Consent"><p><xsl:apply-templates/></p></fn><br/></xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteSubmitted'"><fn id="" fn-type="Note_Submitted"><p><xsl:apply-templates/></p></fn><br/></xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteMiscellaneous'"><fn id="" fn-type="Note_Miscellaneous"><p><xsl:apply-templates/></p></fn><br/></xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteIRBInfo'"><fn id="" fn-type="Note_IRBInfo"><p><xsl:apply-templates/></p></fn><br/></xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteDiscussant'"><fn id="" fn-type="Note_Discussant"><p><xsl:apply-templates/></p></fn><br/></xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteStudyGroupMembersDetails'"><fn id="" fn-type="Note_Study_GroupMembersDetails"><p><xsl:apply-templates/></p></fn><br/></xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteMemberID'"><fn id="" fn-type="Note_MemberID"><p><xsl:apply-templates/></p></fn><br/></xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteTweet'"><fn id="" fn-type="FMNoteTweet"><p><xsl:apply-templates/></p></fn><br/></xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMNotePatentDetails'"><fn id="" fn-type="FMNotePatentDetails"><p><xsl:apply-templates/></p></fn><br/></xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteSummary'"><fn id="" fn-type="FMNoteSummary"><p><xsl:apply-templates/></p></fn><br/></xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteOrcid'"><fn id="" fn-type="FMNoteOrcid"><p><xsl:apply-templates/></p></fn><br/></xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMNotePublished'"><fn id="" fn-type="FMNotePublished"><p><xsl:apply-templates/></p></fn><br/></xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteWebsite'"><fn id="" fn-type="FMNoteWebsite"><p><xsl:apply-templates/></p></fn><br/></xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteRoyalty'"><fn id="" fn-type="FMNoteRoyalty"><p><xsl:apply-templates/></p></fn><br/></xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteCopyrightStatement'"><fn fn-type="copyright"><p><xsl:apply-templates/></p></fn><br/></xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteProductInfo'"><fn fn-type="FMNoteProductInfo"><p><xsl:apply-templates/></p></fn><br/></xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteReport'"><fn fn-type="FMNoteReport"><p><xsl:apply-templates/></p></fn><br/></xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteReprint'"><fn fn-type="FMNoteReprint"><p><xsl:apply-templates/></p></fn><br/></xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteAuthor'"><fn fn-type="FMNoteAuthor"><p><xsl:apply-templates/></p></fn><br/></xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteAuthor'"><fn fn-type="FMNoteAuthor"><p><xsl:apply-templates/></p></fn><br/></xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteCMEStatement'"><fn fn-type="FMNoteCMEStatement"><p><xsl:apply-templates/></p></fn><br/></xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteInfographic'"><fn fn-type="FMNoteInfographic"><p><xsl:apply-templates/></p></fn><br/></xsl:when>







</xsl:choose>
</xsl:for-each>
</fn-group><br/>
</xsl:if>
<xsl:if test="//w:p/w:pPr/w:pStyle[@w:val='Footnote'] or //w:p/w:pPr/w:pStyle[@w:val='FootnoteExtract'] or //w:p/w:pPr/w:pStyle[@w:val='Endnote'] or //w:p/w:pPr/w:pStyle[@w:val='EMNotesTitle'] or //w:p/w:pPr/w:pStyle[@w:val='FMNoteProvenance']">
<notes><br/>
   <xsl:for-each select="//w:p"><xsl:choose><xsl:when test="w:pPr/w:pStyle/@w:val='EMNotesTitle'"><title><xsl:apply-templates/></title><br/></xsl:when></xsl:choose></xsl:for-each>
 <fn-group><br/>   
<xsl:for-each select="//w:p">
<xsl:choose>
  
<xsl:when test="w:pPr/w:pStyle/@w:val='Footnote'"><fn fn-type="fn"><p><xsl:apply-templates/></p></fn><br/></xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='Endnote'"><fn fn-type="en"><p><xsl:apply-templates/></p></fn><br/></xsl:when>

 <xsl:when test="w:pPr/w:pStyle/@w:val='FootnoteExtract'"><fn-disp fn-type="fn"><p><xsl:apply-templates/></p></fn-disp><br/></xsl:when>

  <xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteProvenance'"><fn fn-type="other"><p><xsl:apply-templates/></p></fn><br/></xsl:when>
  
    
		</xsl:choose>
		</xsl:for-each>
</fn-group><br/>	
</notes><br/>

</xsl:if>
		</back><br/></article>
			
</xsl:template>



<xsl:template match="w:object">
<object/>
</xsl:template>

<xsl:template match="w:drawing">
<object/>
</xsl:template>



<xsl:template match="v:shape">
<object/>
</xsl:template>

<xsl:template match="w:delInstrText">
<citationref><xsl:apply-templates/></citationref>
</xsl:template>
		   			

<xsl:template match="w:ilvl">
<listproperty><xsl:apply-templates/></listproperty>
</xsl:template>



<xsl:template match="w:del/w:delText">
<del><xsl:apply-templates/></del>
</xsl:template>





<xsl:template match="w:ins/w:r/w:t">
<ins><xsl:apply-templates/></ins>
</xsl:template>

<xsl:template match="w:commentRangeStart">
		
		<Comment_Start id="{@w:id}"/>
		
			
	</xsl:template>

<xsl:template match="w:commentRangeEnd">
		
			 <Comment_End id="{@w:id}"/>
				
			
	</xsl:template>

<xsl:template match="w:p">
		<xsl:choose>
<xsl:when test="w:pPr/w:pStyle/@w:val='EMHeadA'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='EMHeadB'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='EMHeadC'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='EMHeadD'"/>
<xsl:when test="w:pPr/w:pStyle/@w:val='EMReferencesHeadA'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='EMReferencesHeadB'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='EMReferencesHeadC'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='EMReferencesHeadD'"/>

<xsl:when test="w:pPr/w:pStyle/@w:val='TOCHeadChapterAuthor'">
<toc><xsl:apply-templates/></toc><br/>
</xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='TOCHeadSectionTitle'">
<toc><xsl:apply-templates/></toc><br/>
</xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='TOCHeadChapterTitle'">
<toc><xsl:apply-templates/></toc><br/>
</xsl:when>


<xsl:when test="w:pPr/w:pStyle/@w:val='Prelim/endmatterTitle'">
<Prelim><xsl:apply-templates/></Prelim><br/>
</xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMTOCHeadA'">
<FMTOC1><xsl:apply-templates/></FMTOC1><br/>
</xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMTOCHeadB'">
<FMTOC2><xsl:apply-templates/></FMTOC2><br/>
</xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMTOCHeadC'">
<FMTOC3><xsl:apply-templates/></FMTOC3><br/>
</xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMTOCHeadD'">
<FMTOC4><xsl:apply-templates/></FMTOC4><br/>
</xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMTOCHeadE'">
<FMTOC5><xsl:apply-templates/></FMTOC5><br/>
</xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='TableHeadA'">
<xsl:apply-templates/>
</xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='TableHeadB'">
<xsl:apply-templates/>
</xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='TableHeadC'">
<xsl:apply-templates/>
</xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='BoxHeadA'">
<boxtitle1><xsl:apply-templates/></boxtitle1>
</xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='BoxHeadB'">
<boxtitle2><xsl:apply-templates/></boxtitle2>
</xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='BoxHeadC'">
<boxtitle3><xsl:apply-templates/></boxtitle3>
</xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='TaxonomyHeadB'">
<sec2/><title2><tax2><xsl:apply-templates/></tax2></title2><br/>
</xsl:when>

<xsl:when test="w:pPr/w:pStyle/@w:val='TaxonomyHeadC'">
<sec3/><title3><tax3><xsl:apply-templates/></tax3></title3><br/>
</xsl:when>


<xsl:when test="w:pPr/w:pStyle/@w:val='TaxonomyHeadD'">
<sec4/><title4><tax4><xsl:apply-templates/></tax4></title4><br/>
</xsl:when>


<xsl:when test="w:pPr/w:pStyle/@w:val='FMAbstractSectionHeadADisplayed'"/>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMAbstractSectionHeadBDisplayed'"/>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMAbstractSectionHeadCDisplayed'"/>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMAbstractSectionHeadDDisplayed'"/>


<xsl:when test="w:pPr/w:pStyle/@w:val='FMAbstractSectionHeadDisplayed'"/>

<xsl:when test="w:pPr/w:pStyle/@w:val='FMTransAbstractSectionHeadDisplayed'"/>

			<xsl:when test="contains(w:pPr/w:pStyle/@w:val, 'EMSupplementaryMaterialTitle')">
				<Suppl/><sec1/><title1><xsl:apply-templates/></title1><br/>
			</xsl:when>

			<xsl:when test="contains(w:pPr/w:pStyle/@w:val, 'HeadA') or contains(w:pPr/w:pStyle/@w:val, 'EMSupplementaryMaterialTitle')">
				<sec1/><title1><xsl:apply-templates/></title1><br/>
			</xsl:when>
			<xsl:when test="contains(w:pPr/w:pStyle/@w:val, 'HeadB') or contains(w:pPr/w:pStyle/@w:val, 'headBrunIn')">
				<sec2/><title2><xsl:apply-templates/></title2><br/>
			</xsl:when>
			<xsl:when test="contains(w:pPr/w:pStyle/@w:val, 'HeadC') or contains(w:pPr/w:pStyle/@w:val, 'headCrunIn')">
				<sec3/><title3><xsl:apply-templates/></title3><br/>
			</xsl:when>
			<xsl:when test="contains(w:pPr/w:pStyle/@w:val, 'HeadD') or contains(w:pPr/w:pStyle/@w:val, 'headDrunIn')">
				<sec4/><title4><xsl:apply-templates/></title4><br/>
			</xsl:when>
			<xsl:when test="contains(w:pPr/w:pStyle/@w:val, 'HeadE') or contains(w:pPr/w:pStyle/@w:val, 'headErunIn')">
				<sec5/><title5><xsl:apply-templates/></title5><br/>
			</xsl:when>

			<xsl:when test="contains(w:pPr/w:pStyle/@w:val, 'HeadF') or contains(w:pPr/w:pStyle/@w:val, 'headFrunIn')">
				<sec6/><title6><xsl:apply-templates/></title6><br/>
			</xsl:when>

			<xsl:when test="contains(w:pPr/w:pStyle/@w:val, 'HeadG') or contains(w:pPr/w:pStyle/@w:val, 'headGrunIn')">
				<sec7/><title7><xsl:apply-templates/></title7><br/>
			</xsl:when>

			
			<!--<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteOther' or w:pPr/w:pStyle/@w:val='FMNoteConflict' or w:pPr/w:pStyle/@w:val='FMNoteContributions' or w:pPr/w:pStyle/@w:val='FMNoteFunding'"><fn fn-type="others"><xsl:apply-templates/></fn><br/></xsl:when>-->

<xsl:when test="w:pPr/w:pStyle/@w:val='Header'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMArticleType'"/>
			
			<!--<xsl:when test="w:pPr/w:pStyle/@w:val='FMArticleTitle'"/>-->
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMArticleSubtitle'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMRunningHeadRecto'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMRunningHeadVerso'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMArticleTranslatedTitle'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMAuthorsOnline'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMAuthorGroup'"/>
			
			<!--<xsl:when test="w:pPr/w:pStyle/@w:val='FMAffiliations'"/>-->
			<xsl:when test="w:pPr/w:pStyle/@w:val='Affiliation'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='Affiliationcontrib'"/>
			
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteCorrespondence'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMText'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMAbstractSectionHeadDisplayed'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='LWWSecA'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='LWWSecB'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='LWWSecC'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='LWWEMText'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='LWWEMTextInd'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='BrillSecA'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='BrillSecB'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='BrillSecC'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='BrillSecD'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='BrillEMText'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='BrillEMTextInd'"/>
			
			
			
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMAbstractParaFlushLeft'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMAbstractParaInd'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMAbstractHead'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMAbstractBL1'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMAbstractBL2'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMAbstractBL3'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMAbstractUL1'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMAbstractUL2'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMAbstractUL3'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMAbstractOL1'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMAbstractOL2'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMAbstractOL3'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMGrapAbstractParaInd'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMGrapAbstractParaFlushLeft'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMGrapAbstractHead'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='VideoNumber'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='VideoSource'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMOnlineGrapAbstractHead'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMOnlineGrapAbstractParaInd'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMOnlineGrapAbstractParaFlushLeft'"/>
			
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMVideoAbstractParaInd'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMVideoAbstractParaFlushLeft'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMVideoAbstractHead'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMVideoAbstractParaInd'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMVideoAbstractParaFlushLeft'"/>
			
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMTransAbstractParaFlushLeft'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMTransAbstractParaInd'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMTransAbstractHead'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMTransAbstractSectionHeadDisplayed'"/>

			<xsl:when test="w:pPr/w:pStyle/@w:val='FMLayAbstractParaFlushLeft'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMLayAbstractParaInd'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMLayAbstractHead'"/>

			<xsl:when test="w:pPr/w:pStyle/@w:val='FMSummaryParaFlushLeft'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMSummaryParaInd'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMSummaryHead'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='PLOSSummary'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='MeetingReportTitle'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='MeetingLocation'"/>
			
			<xsl:when test="w:pPr/w:pStyle/@w:val='refpara'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='RefPara'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='RefNote'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='RefList'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='RefAnnotationPara'"/>
			
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMSectionEditor'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='EMOtherSectionTitle'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='Keywords'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='KeywordsTrans'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='Hosts'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='Pests'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='Abbreviations'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='EMAcknowledgmentsHead'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='EMAcknowledgmentsText'"/>
			
			<xsl:when test="w:pPr/w:pStyle/@w:val='EMText'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='EMTextInd'"/>
			
			<xsl:when test="w:pPr/w:pStyle/@w:val='EMDisclaimerHead'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='EMDisclaimerText'"/>
			<!--<xsl:when test="w:pPr/w:pStyle/@w:val='EMReferencesHead'"/>-->
			<xsl:when test="w:pPr/w:pStyle/@w:val='EMGlossaryEntry'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='EMReferencesHeadA'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='EMReferencesHeadB'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='EMReferencesHeadC'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='EMReferencesHeadD'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='EMGlossaryTitle'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='Reference'"/>
			
			<!--<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteAuthorBio'"/>-->
			<!--<xsl:when test="w:pPr/w:pStyle/@w:val='FMNotePresentAddress'"/>-->
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNotePreviousAddress'"/>
			<!--<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteStudyGroupMembers'"/>-->
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteDeceased'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteSupplementaryMaterial'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteConflict'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteContributions'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteFunding'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteConferenceHistory'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNotePresent'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteLevel'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMCustomMetaLogo'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteHandlingEditor'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteDisclaimer'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteGuestEditor'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteAttribute'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteAttributeHead'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteContributors'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteEditorBio'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteURL'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteArticleCitation'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteClinicalTrailInfo'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteEthicalApprovalStatement'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteOnline'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteCodeDataRequest'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteIRBinfo'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteDiscussant'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteStudyGroupMembersDetails'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteMemberID'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteMemberID'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteTweet'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNotePresentAddressDetails'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNotePatentDetails'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteSummary'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteOrcid'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNotePublished'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteWebsite'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteRoyalty'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteProductInfo'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteReport'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteReprint'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteAuthor'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteCopyrightStatement'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='XMLmetadata'"/>
			
			
			
			<!--<xsl:when test="w:pPr/w:pStyle/@w:val='Footnote'"/>-->
			<xsl:when test="w:pPr/w:pStyle/@w:val='Endnote'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteProvenance'"/>
			<!--<xsl:when test="w:pPr/w:pStyle/@w:val='FootnoteExtract'"/>-->
			<!--<xsl:when test="w:pPr/w:pStyle/@w:val='FMSubjectCodes'"/>-->
			<!--<xsl:when test="w:pPr/w:pStyle/@w:val='FMDOILine'"/>-->
			<!--<xsl:when test="w:pPr/w:pStyle/@w:val='FMMSHistory'"/>-->
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteCopyrightLine'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='EMNotesTitle'"/>
			<!--<xsl:when test="w:pPr/w:pStyle/@w:val='EMHead'"/>-->
			<xsl:when test="w:pPr/w:pStyle/@w:val='EMNotes'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='EMNotesText'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNotesText'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNotePresent'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteLevel'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMTOCStatement'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMMSHistoryDetails'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteWorkplace'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteConsent'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteSubmitted'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteMiscellaneous'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteIRBInfo'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMVersionofRecord'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteCMEStatement'"/>
			<xsl:when test="w:pPr/w:pStyle/@w:val='FMNoteInfographic'"/>
					

			
			<xsl:when test="contains(w:r[1]/w:instrText, 'List-End')">
				<list-end/><br/>
			</xsl:when>
			<xsl:when test="w:pPr/w:pStyle/@w:val">
				<xsl:element name="{w:pPr/w:pStyle/@w:val}"><xsl:apply-templates/></xsl:element><br/>
			</xsl:when>
			<xsl:when test="w:pPr/w:listPr">
				<xsl:choose>
					<xsl:when test="w:pPr/w:listPr/w:ilvl/@w:val='0'">
						<item1><label><xsl:value-of select="w:pPr/w:listPr/wx:t/@wx:val"/></label>  <xsl:apply-templates/></item1><br/>
					</xsl:when>
					<xsl:when test="w:pPr/w:listPr/w:ilvl/@w:val='1'">
						<item2><label><xsl:value-of select="w:pPr/w:listPr/wx:t/@wx:val"/></label>  <xsl:apply-templates/></item2><br/>
					</xsl:when>
					<xsl:when test="w:pPr/w:listPr/w:ilvl/@w:val='2'">
						<item3><label><xsl:value-of select="w:pPr/w:listPr/wx:t/@wx:val"/></label>  <xsl:apply-templates/></item3><br/>
					</xsl:when>
					<xsl:when test="w:pPr/w:listPr/w:ilvl/@w:val='3'">
						<item4><label><xsl:value-of select="w:pPr/w:listPr/wx:t/@wx:val"/></label>  <xsl:apply-templates/></item4><br/>
					</xsl:when>
					<xsl:when test="w:pPr/w:listPr/w:ilvl/@w:val='4'">
						<item5><label><xsl:value-of select="w:pPr/w:listPr/wx:t/@wx:val"/></label>  <xsl:apply-templates/></item5><br/>
					</xsl:when>
					<xsl:when test="w:pPr/w:listPr/w:ilvl/@w:val='5'">
						<item6><label><xsl:value-of select="w:pPr/w:listPr/wx:t/@wx:val"/></label>  <xsl:apply-templates/></item6><br/>
					</xsl:when>
				<xsl:otherwise>
					<item><xsl:apply-templates/></item><br/>
				</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="w:r/w:fldChar">
				<xsl:choose>
					<xsl:when test="w:pPr/w:listPr/w:ilvl/@w:val='0'">
						<item1><label><xsl:value-of select="w:pPr/w:listPr/wx:t/@wx:val"/></label>  <xsl:apply-templates/></item1><br/>
					</xsl:when>
				</xsl:choose>
			</xsl:when>
			
			<xsl:otherwise>
			   
				<p><xsl:apply-templates/></p><br/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match ="w:bookmarkStart[contains(@w:name, 'para')]">
	   <bookmark id="{@w:name}" />
	</xsl:template>



	<xsl:template match="//w:tab">
	<tab/>
	</xsl:template>

	<xsl:template match="//w:noBreakHyphen">
	<hyphen/>
	</xsl:template>

	<xsl:template match="w:br[not(@w:type)]">
		<shift_enter />
	</xsl:template>

	
	<xsl:template match="w:r">
		<xsl:choose>

		   <!--<xsl:when test="contains(w:rPr/w:rStyle/@w:val, 'headArunIn')">
				<sec-headrunin1/><title1><xsl:apply-templates/></title1><br/>
			</xsl:when>

			<xsl:when test="contains(w:rPr/w:rStyle/@w:val, 'headBrunIn')">
				<sec-headrunin2/><title2><xsl:apply-templates/></title2><br/>
			</xsl:when>

			<xsl:when test="contains(w:rPr/w:rStyle/@w:val, 'headCrunIn')">
				<sec-headrunin3/><title3><xsl:apply-templates/></title3><br/>
			</xsl:when>

			<xsl:when test="contains(w:rPr/w:rStyle/@w:val, 'headDrunIn')">
				<sec-headrunin4/><title4><xsl:apply-templates/></title4><br/>
			</xsl:when>-->

		  
			

			

			

			
			
			

			 <xsl:when test="contains(w:rPr/w:rFonts/@w:ascii, 'Batang')">

			    <xsl:if test="w:rPr/w:color">

			   <xsl:element name="entity">
			      <xsl:attribute name="color"><xsl:value-of select="w:rPr/w:color/@w:val"/></xsl:attribute>
			       <xsl:attribute name="font"><xsl:value-of select="w:rPr/w:rFonts/@w:ascii"/></xsl:attribute>
			     <xsl:apply-templates/>
			   </xsl:element>

			    
			</xsl:if>


			 <xsl:if test="not(w:rPr/w:color)">

			   <xsl:element name="entity">
			      <xsl:attribute name="color"><xsl:value-of select="w:rPr/w:color/@w:val"/></xsl:attribute>
			       <xsl:attribute name="font"><xsl:value-of select="w:rPr/w:rFonts/@w:ascii"/></xsl:attribute>
			     <xsl:apply-templates/>
			   </xsl:element>

			    
			</xsl:if>

			</xsl:when>

			

			<xsl:when test="contains(w:rPr/w:rFonts/@w:eastAsia, 'Hiragino Sans GB W3')">

			    <xsl:if test="w:rPr/w:color">

			   <xsl:element name="entity">
			      <xsl:attribute name="color"><xsl:value-of select="w:rPr/w:color/@w:val"/></xsl:attribute>
			       <xsl:attribute name="font"><xsl:value-of select="w:rPr/w:rFonts/@w:eastAsia"/></xsl:attribute>
			     <xsl:apply-templates/>
			   </xsl:element>

			    
			</xsl:if>


			 <xsl:if test="not(w:rPr/w:color)">

			   <xsl:element name="entity">
			      <xsl:attribute name="color"><xsl:value-of select="w:rPr/w:color/@w:val"/></xsl:attribute>
			       <xsl:attribute name="font"><xsl:value-of select="w:rPr/w:rFonts/@w:eastAsia"/></xsl:attribute>
			     <xsl:apply-templates/>
			   </xsl:element>

			    
			</xsl:if>

			</xsl:when>

			
			
			 <xsl:when test="contains(w:rPr/w:rFonts/@w:eastAsia, 'Hiragino Sans GB W3')">

			    <xsl:if test="w:rPr/w:color">

			   <xsl:element name="entity">
			      <xsl:attribute name="color"><xsl:value-of select="w:rPr/w:color/@w:val"/></xsl:attribute>
			       <xsl:attribute name="font"><xsl:value-of select="w:rPr/w:rFonts/@w:eastAsia"/></xsl:attribute>
			     <xsl:apply-templates/>
			   </xsl:element>

			    
			</xsl:if>


			 <xsl:if test="not(w:rPr/w:color)">

			   <xsl:element name="entity">
			      <xsl:attribute name="color"><xsl:value-of select="w:rPr/w:color/@w:val"/></xsl:attribute>
			       <xsl:attribute name="font"><xsl:value-of select="w:rPr/w:rFonts/@w:eastAsia"/></xsl:attribute>
			     <xsl:apply-templates/>
			   </xsl:element>

			    
			</xsl:if>

			</xsl:when>

			

			
			

			
		      		   
			
			<xsl:when test="contains(w:rPr/w:rFonts/@w:ascii, 'ScaleDegrees Times')">

			    <xsl:if test="w:rPr/w:color">

			   <xsl:element name="entity">
			      <xsl:attribute name="color"><xsl:value-of select="w:rPr/w:color/@w:val"/></xsl:attribute>
			       <xsl:attribute name="font"><xsl:value-of select="w:rPr/w:rFonts/@w:ascii"/></xsl:attribute>
			     <xsl:apply-templates/>
			   </xsl:element>

			    
			</xsl:if>


			 <xsl:if test="not(w:rPr/w:color)">

			   <xsl:element name="entity">
			      <xsl:attribute name="color"><xsl:value-of select="w:rPr/w:color/@w:val"/></xsl:attribute>
			       <xsl:attribute name="font"><xsl:value-of select="w:rPr/w:rFonts/@w:ascii"/></xsl:attribute>
			     <xsl:apply-templates/>
			   </xsl:element>

			    
			</xsl:if>
			
			   <!--<xsl:element name="entity">
			      <xsl:attribute name="font"><xsl:value-of select="w:rPr/w:rFonts/@w:ascii"/></xsl:attribute>
			      <xsl:apply-templates/>
			   </xsl:element>-->
				
			</xsl:when>

			<xsl:when test="contains(w:rPr/w:rFonts/@w:ascii, 'Consolas')">

			    <xsl:if test="w:rPr/w:color">

			   <xsl:element name="entity">
			      <xsl:attribute name="color"><xsl:value-of select="w:rPr/w:color/@w:val"/></xsl:attribute>
			       <xsl:attribute name="font"><xsl:value-of select="w:rPr/w:rFonts/@w:ascii"/></xsl:attribute>
			     <xsl:apply-templates/>
			   </xsl:element>

			    
			</xsl:if>


			 <xsl:if test="not(w:rPr/w:color)">

			   <xsl:element name="entity">
			      <xsl:attribute name="color"><xsl:value-of select="w:rPr/w:color/@w:val"/></xsl:attribute>
			       <xsl:attribute name="font"><xsl:value-of select="w:rPr/w:rFonts/@w:ascii"/></xsl:attribute>
			     <xsl:apply-templates/>
			   </xsl:element>

			    
			</xsl:if>
			
			   <!--<xsl:element name="entity">
			      <xsl:attribute name="font"><xsl:value-of select="w:rPr/w:rFonts/@w:ascii"/></xsl:attribute>
			      <xsl:apply-templates/>
			   </xsl:element>-->
				
			</xsl:when>

			
			
			<xsl:when test="contains(w:rPr/w:rFonts/@w:ascii, 'Courier New')">

			    <xsl:if test="w:rPr/w:color">

			   <xsl:element name="entity">
			      <xsl:attribute name="color"><xsl:value-of select="w:rPr/w:color/@w:val"/></xsl:attribute>
			       <xsl:attribute name="font"><xsl:value-of select="w:rPr/w:rFonts/@w:ascii"/></xsl:attribute>
			     <xsl:apply-templates/>
			   </xsl:element>

			    
			</xsl:if>


			 <xsl:if test="not(w:rPr/w:color)">

			   <xsl:element name="entity">
			      <xsl:attribute name="color"><xsl:value-of select="w:rPr/w:color/@w:val"/></xsl:attribute>
			       <xsl:attribute name="font"><xsl:value-of select="w:rPr/w:rFonts/@w:ascii"/></xsl:attribute>
			     <xsl:apply-templates/>
			   </xsl:element>

			    
			</xsl:if>
			
			   <!--<xsl:element name="entity">
			      <xsl:attribute name="font"><xsl:value-of select="w:rPr/w:rFonts/@w:ascii"/></xsl:attribute>
			      <xsl:apply-templates/>
			   </xsl:element>-->
				
			</xsl:when>


			<xsl:when test="contains(w:rPr/w:rFonts/@w:ascii, 'Rockwell')">

			    <xsl:if test="w:rPr/w:color">

			   <xsl:element name="entity">
			      <xsl:attribute name="color"><xsl:value-of select="w:rPr/w:color/@w:val"/></xsl:attribute>
			       <xsl:attribute name="font"><xsl:value-of select="w:rPr/w:rFonts/@w:ascii"/></xsl:attribute>
			     <xsl:apply-templates/>
			   </xsl:element>

			    
			</xsl:if>


			 <xsl:if test="not(w:rPr/w:color)">

			   <xsl:element name="entity">
			      <xsl:attribute name="color"><xsl:value-of select="w:rPr/w:color/@w:val"/></xsl:attribute>
			       <xsl:attribute name="font"><xsl:value-of select="w:rPr/w:rFonts/@w:ascii"/></xsl:attribute>
			     <xsl:apply-templates/>
			   </xsl:element>

			    
			</xsl:if>

			</xsl:when>

						
			   
	
			
			
			<xsl:when test="w:instrText">
				<citationref><xsl:apply-templates/></citationref>
			</xsl:when>

			<xsl:when test="w:delInstrText">
				<citationref><xsl:apply-templates/></citationref>
			</xsl:when>
		   			
		   
			<xsl:when test="w:rPr/w:b[not(@w:val='0')] and w:rPr/w:i[not(@w:val='0')] and w:rPr/w:vertAlign/@w:val='superscript' and w:rPr/w:u/@w:val='single' and w:rPr/w:rStyle/@w:val">
				<xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;allcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;strike&gt;</xsl:text></xsl:if><xsl:element name="{w:rPr/w:rStyle/@w:val}"><sup><bold><italic><underline><xsl:apply-templates/></underline></italic></bold></sup></xsl:element><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/strike&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/allcaps&gt;</xsl:text></xsl:if>
			</xsl:when>
			<xsl:when test="w:rPr/w:b[not(@w:val='0')] and w:rPr/w:i[not(@w:val='0')] and w:rPr/w:vertAlign/@w:val='subscript' and w:rPr/w:u/@w:val='single' and w:rPr/w:rStyle/@w:val">
				<xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;allcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;strike&gt;</xsl:text></xsl:if><xsl:element name="{w:rPr/w:rStyle/@w:val}"><sub><bold><italic><underline><xsl:apply-templates/></underline></italic></bold></sub></xsl:element><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/strike&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/allcaps&gt;</xsl:text></xsl:if>
			</xsl:when>
			<xsl:when test="w:rPr/w:b[not(@w:val='0')] and w:rPr/w:i[not(@w:val='0')] and w:rPr/w:vertAlign/@w:val='superscript' and w:rPr/w:u/@w:val='single'">
				<xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;allcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;strike&gt;</xsl:text></xsl:if><sup><bold><italic><underline><xsl:apply-templates/></underline></italic></bold></sup><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/strike&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/allcaps&gt;</xsl:text></xsl:if>
			</xsl:when>
			<xsl:when test="w:rPr/w:b[not(@w:val='0')] and w:rPr/w:i[not(@w:val='0')] and w:rPr/w:vertAlign/@w:val='subscript' and w:rPr/w:u/@w:val='single'">
				<xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;allcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;strike&gt;</xsl:text></xsl:if><sub><bold><italic><underline><xsl:apply-templates/></underline></italic></bold></sub><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/strike&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/allcaps&gt;</xsl:text></xsl:if>
			</xsl:when>
			<xsl:when test="w:rPr/w:b[not(@w:val='0')] and w:rPr/w:i[not(@w:val='0')] and w:rPr/w:vertAlign/@w:val='superscript' and w:rPr/w:rStyle/@w:val">
				<xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;allcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;strike&gt;</xsl:text></xsl:if><xsl:element name="{w:rPr/w:rStyle/@w:val}"><sup><bold><italic><xsl:apply-templates/></italic></bold></sup></xsl:element><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/strike&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/allcaps&gt;</xsl:text></xsl:if>
			</xsl:when>
			<xsl:when test="w:rPr/w:b[not(@w:val='0')] and w:rPr/w:i[not(@w:val='0')] and w:rPr/w:vertAlign/@w:val='subscript' and w:rPr/w:rStyle/@w:val">
				<xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;allcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;strike&gt;</xsl:text></xsl:if><xsl:element name="{w:rPr/w:rStyle/@w:val}"><sub><bold><italic><xsl:apply-templates/></italic></bold></sub></xsl:element><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/strike&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/allcaps&gt;</xsl:text></xsl:if>
			</xsl:when>
			<xsl:when test="w:rPr/w:b[not(@w:val='0')] and w:rPr/w:i[not(@w:val='0')] and w:rPr/w:vertAlign/@w:val='superscript'">
				<xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;allcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;strike&gt;</xsl:text></xsl:if><sup><bold><italic><xsl:apply-templates/></italic></bold></sup><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/strike&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/allcaps&gt;</xsl:text></xsl:if>
			</xsl:when>
			<xsl:when test="w:rPr/w:b[not(@w:val='0')] and w:rPr/w:i[not(@w:val='0')] and w:rPr/w:vertAlign/@w:val='subscript'">
				<xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;allcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;strike&gt;</xsl:text></xsl:if><sub><bold><italic><xsl:apply-templates/></italic></bold></sub><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/strike&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/allcaps&gt;</xsl:text></xsl:if>
			</xsl:when>
			<xsl:when test="w:rPr/w:b[not(@w:val='0')] and w:rPr/w:i[not(@w:val='0')] and w:rPr/w:u/@w:val='single' and w:rPr/w:rStyle/@w:val">
				<xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;allcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;strike&gt;</xsl:text></xsl:if><xsl:element name="{w:rPr/w:rStyle/@w:val}"><bold><italic><underline><xsl:apply-templates/></underline></italic></bold></xsl:element><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/strike&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/allcaps&gt;</xsl:text></xsl:if>
			</xsl:when>
			<xsl:when test="w:rPr/w:b[not(@w:val='0')] and w:rPr/w:i[not(@w:val='0')] and w:rPr/w:u/@w:val='single'">
				<xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;allcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;strike&gt;</xsl:text></xsl:if><bold><italic><underline><xsl:apply-templates/></underline></italic></bold><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/strike&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/allcaps&gt;</xsl:text></xsl:if>
			</xsl:when>
			<xsl:when test="w:rPr/w:b[not(@w:val='0')] and w:rPr/w:i[not(@w:val='0')] and w:rPr/w:rStyle/@w:val">
				<xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;allcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;strike&gt;</xsl:text></xsl:if><xsl:element name="{w:rPr/w:rStyle/@w:val}"><bold><italic><xsl:apply-templates/></italic></bold></xsl:element><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/strike&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/allcaps&gt;</xsl:text></xsl:if>
			</xsl:when>
			<xsl:when test="w:rPr/w:b[not(@w:val='0')] and w:rPr/w:i[not(@w:val='0')]">
				<xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;allcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;strike&gt;</xsl:text></xsl:if><bold><italic><xsl:apply-templates/></italic></bold><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/strike&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/allcaps&gt;</xsl:text></xsl:if>
			</xsl:when>
			<xsl:when test="w:rPr/w:b[not(@w:val='0')] and w:rPr/w:u/@w:val='single' and w:rPr/w:rStyle/@w:val">
				<xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;allcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;strike&gt;</xsl:text></xsl:if><xsl:element name="{w:rPr/w:rStyle/@w:val}"><bold><underline><xsl:apply-templates/></underline></bold></xsl:element><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/strike&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/allcaps&gt;</xsl:text></xsl:if>
			</xsl:when>
			<xsl:when test="w:rPr/w:b[not(@w:val='0')] and w:rPr/w:u/@w:val='single'">
				<xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;allcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;strike&gt;</xsl:text></xsl:if><bold><underline><xsl:apply-templates/></underline></bold><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/strike&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/allcaps&gt;</xsl:text></xsl:if>
			</xsl:when>
			<xsl:when test="w:rPr/w:i[not(@w:val='0')] and w:rPr/w:u/@w:val='single' and w:rPr/w:rStyle/@w:val">
				<xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;allcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;strike&gt;</xsl:text></xsl:if><xsl:element name="{w:rPr/w:rStyle/@w:val}"><italic><underline><xsl:apply-templates/></underline></italic></xsl:element><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/strike&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/allcaps&gt;</xsl:text></xsl:if>
			</xsl:when>
			<xsl:when test="w:rPr/w:i[not(@w:val='0')] and w:rPr/w:u/@w:val='single'">
				<xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;allcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;strike&gt;</xsl:text></xsl:if><italic><underline><xsl:apply-templates/></underline></italic><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/strike&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/allcaps&gt;</xsl:text></xsl:if>
			</xsl:when>
			<xsl:when test="w:rPr/w:u/@w:val='single' and w:rPr/w:vertAlign/@w:val='superscript' and w:rPr/w:rStyle/@w:val">
				<xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;allcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;strike&gt;</xsl:text></xsl:if><xsl:element name="{w:rPr/w:rStyle/@w:val}"><sup><underline><xsl:apply-templates/></underline></sup></xsl:element><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/strike&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/allcaps&gt;</xsl:text></xsl:if>
			</xsl:when>
			<xsl:when test="w:rPr/w:u/@w:val='single' and w:rPr/w:vertAlign/@w:val='superscript'">
				<xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;allcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;strike&gt;</xsl:text></xsl:if><sup><underline><xsl:apply-templates/></underline></sup><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/strike&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/allcaps&gt;</xsl:text></xsl:if>
			</xsl:when>
			<xsl:when test="w:rPr/w:b[not(@w:val='0')] and w:rPr/w:vertAlign/@w:val='superscript' and w:rPr/w:rStyle/@w:val">
				<xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;allcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;strike&gt;</xsl:text></xsl:if><xsl:element name="{w:rPr/w:rStyle/@w:val}"><sup><bold><xsl:apply-templates/></bold></sup></xsl:element><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/strike&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/allcaps&gt;</xsl:text></xsl:if>
			</xsl:when>
			<xsl:when test="w:rPr/w:b[not(@w:val='0')] and w:rPr/w:vertAlign/@w:val='superscript'">
				<xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;allcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;strike&gt;</xsl:text></xsl:if><sup><bold><xsl:apply-templates/></bold></sup><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/strike&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/allcaps&gt;</xsl:text></xsl:if>
			</xsl:when>
			<xsl:when test="w:rPr/w:i[not(@w:val='0')] and w:rPr/w:vertAlign/@w:val='superscript' and w:rPr/w:rStyle/@w:val">
				<xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;allcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;strike&gt;</xsl:text></xsl:if><xsl:element name="{w:rPr/w:rStyle/@w:val}"><sup><italic><xsl:apply-templates/></italic></sup></xsl:element><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/strike&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/allcaps&gt;</xsl:text></xsl:if>
			</xsl:when>
			<xsl:when test="w:rPr/w:i[not(@w:val='0')] and w:rPr/w:vertAlign/@w:val='superscript'">
				<xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;allcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;strike&gt;</xsl:text></xsl:if><sup><italic><xsl:apply-templates/></italic></sup><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/strike&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/allcaps&gt;</xsl:text></xsl:if>
			</xsl:when>
			<xsl:when test="w:rPr/w:u/@w:val='single' and w:rPr/w:vertAlign/@w:val='subscript' and w:rPr/w:rStyle/@w:val">
				<xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;allcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;strike&gt;</xsl:text></xsl:if><xsl:element name="{w:rPr/w:rStyle/@w:val}"><sub><underline><xsl:apply-templates/></underline></sub></xsl:element><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/strike&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/allcaps&gt;</xsl:text></xsl:if>
			</xsl:when>
			<xsl:when test="w:rPr/w:u/@w:val='single' and w:rPr/w:vertAlign/@w:val='subscript'">
				<xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;allcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;strike&gt;</xsl:text></xsl:if><sub><underline><xsl:apply-templates/></underline></sub><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/strike&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/allcaps&gt;</xsl:text></xsl:if>
			</xsl:when>
			<xsl:when test="w:rPr/w:b[not(@w:val='0')] and w:rPr/w:vertAlign/@w:val='subscript' and w:rPr/w:rStyle/@w:val">
				<xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;allcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;strike&gt;</xsl:text></xsl:if><xsl:element name="{w:rPr/w:rStyle/@w:val}"><sub><bold><xsl:apply-templates/></bold></sub></xsl:element><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/strike&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/allcaps&gt;</xsl:text></xsl:if>
			</xsl:when>
			<xsl:when test="w:rPr/w:b[not(@w:val='0')] and w:rPr/w:vertAlign/@w:val='subscript'">
				<xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;allcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;strike&gt;</xsl:text></xsl:if><sub><bold><xsl:apply-templates/></bold></sub><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/strike&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/allcaps&gt;</xsl:text></xsl:if>
			</xsl:when>
			<xsl:when test="w:rPr/w:i[not(@w:val='0')] and w:rPr/w:vertAlign/@w:val='subscript' and w:rPr/w:rStyle/@w:val">
				<xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;allcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;strike&gt;</xsl:text></xsl:if><xsl:element name="{w:rPr/w:rStyle/@w:val}"><sub><italic><xsl:apply-templates/></italic></sub></xsl:element><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/strike&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/allcaps&gt;</xsl:text></xsl:if>
			</xsl:when>
			<xsl:when test="w:rPr/w:i[not(@w:val='0')] and w:rPr/w:vertAlign/@w:val='subscript'">
				<sub><italic><xsl:apply-templates/></italic></sub>
			</xsl:when>
			<xsl:when test="w:rPr/w:b[not(@w:val='0')] and w:rPr/w:rStyle/@w:val">
				<xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;allcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;strike&gt;</xsl:text></xsl:if><xsl:element name="{w:rPr/w:rStyle/@w:val}"><bold><xsl:apply-templates/></bold></xsl:element><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/strike&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/allcaps&gt;</xsl:text></xsl:if>
			</xsl:when>
			<xsl:when test="w:rPr/w:b[not(@w:val='0')]">
				<xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;allcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;strike&gt;</xsl:text></xsl:if><bold><xsl:apply-templates/></bold><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/strike&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/allcaps&gt;</xsl:text></xsl:if>
			</xsl:when>
			<xsl:when test="w:rPr/w:i[not(@w:val='0')] and w:rPr/w:rStyle/@w:val">
				<xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;allcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;strike&gt;</xsl:text></xsl:if><xsl:element name="{w:rPr/w:rStyle/@w:val}"><italic><xsl:apply-templates/></italic></xsl:element><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/strike&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/allcaps&gt;</xsl:text></xsl:if>
			</xsl:when>
			<xsl:when test="w:rPr/w:i[not(@w:val='0')]">
				<xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;allcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;strike&gt;</xsl:text></xsl:if><italic><xsl:apply-templates/></italic><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/strike&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/allcaps&gt;</xsl:text></xsl:if>
			</xsl:when>
			<xsl:when test="w:rPr/w:vertAlign/@w:val='subscript' and w:rPr/w:rStyle/@w:val">
				<xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;allcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;strike&gt;</xsl:text></xsl:if><xsl:element name="{w:rPr/w:rStyle/@w:val}"><sub><xsl:apply-templates/></sub></xsl:element><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/strike&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/allcaps&gt;</xsl:text></xsl:if>
			</xsl:when>
			<xsl:when test="w:rPr/w:vertAlign/@w:val='subscript'">
				<xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;allcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;strike&gt;</xsl:text></xsl:if><sub><xsl:apply-templates/></sub><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/strike&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/allcaps&gt;</xsl:text></xsl:if>
			</xsl:when>
			<xsl:when test="w:rPr/w:vertAlign/@w:val='superscript' and w:rPr/w:rStyle/@w:val">
				<xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;allcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;strike&gt;</xsl:text></xsl:if><xsl:element name="{w:rPr/w:rStyle/@w:val}"><sup><xsl:apply-templates/></sup></xsl:element><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/strike&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/allcaps&gt;</xsl:text></xsl:if>
			</xsl:when>
			<xsl:when test="w:rPr/w:vertAlign/@w:val='superscript'">
				<xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;allcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;strike&gt;</xsl:text></xsl:if><sup><xsl:apply-templates/></sup><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/strike&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/allcaps&gt;</xsl:text></xsl:if>
			</xsl:when>
			<xsl:when test="w:rPr/w:u/@w:val='single' and w:rPr/w:rStyle/@w:val">
				<xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;allcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;strike&gt;</xsl:text></xsl:if><xsl:element name="{w:rPr/w:rStyle/@w:val}"><underline><xsl:apply-templates/></underline></xsl:element><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/strike&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/allcaps&gt;</xsl:text></xsl:if>
			</xsl:when>
			<xsl:when test="w:rPr/w:u/@w:val='single'">
				<xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;allcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;strike&gt;</xsl:text></xsl:if><underline><xsl:apply-templates/></underline><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/strike&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/allcaps&gt;</xsl:text></xsl:if>
			</xsl:when>
			<xsl:when test="w:rPr/w:rStyle/@w:val='CHead'">
				<title><xsl:apply-templates/></title>
			</xsl:when>
			<xsl:when test="w:rPr/w:rStyle/@w:val='ng-term' or w:rPr/w:rStyle/@w:val='term'">
				<xsl:element name="{w:rPr/w:rStyle/@w:val}"><xsl:apply-templates/></xsl:element> <!--bold removed on 25 Mar, 09 as per Vijay voice -->
			</xsl:when>
	<xsl:when test="w:rPr/w:rStyle/@w:val='Hyperlink' and w:rPr/w:vertAlign/@w:val='superscript'">
				<sup><xsl:element name="{w:rPr/w:rStyle/@w:val}"><xsl:apply-templates/></xsl:element></sup>
			</xsl:when> 
			<xsl:when test="w:rPr/w:rStyle/@w:val">
				<xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;allcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;strike&gt;</xsl:text></xsl:if><xsl:element name="{w:rPr/w:rStyle/@w:val}"><xsl:apply-templates/></xsl:element><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/strike&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/allcaps&gt;</xsl:text></xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;strike&gt;</xsl:text></xsl:if><xsl:apply-templates/><xsl:if test="w:rPr/w:strike[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/strike&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:smallCaps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/smallcaps&gt;</xsl:text></xsl:if><xsl:if test="w:rPr/w:caps[not(@w:val='0')]"><xsl:text disable-output-escaping="yes">&lt;/allcaps&gt;</xsl:text></xsl:if>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:choose>
		<xsl:when test="w:rPr/w:instrText">
		<Citation><xsl:apply-templates/></Citation>
		</xsl:when>
		
		   	
	</xsl:choose>

	</xsl:template>

	<xsl:template match="w:hyperlink[contains(@w:anchor, 'CJML_BIB_')]">
	   <Reference_Citation id="{@w:anchor}"><xsl:apply-templates/></Reference_Citation>
	</xsl:template>

	<xsl:template match="w:hyperlink[contains(@w:anchor, 'soo')]">
	   <Hyperlink id="{@w:anchor}"><xsl:apply-templates/></Hyperlink>
	</xsl:template>

	<xsl:template match="w:hyperlink[contains(@w:anchor, 'S00')]">
	   <Hyperlink id="{@w:anchor}"><xsl:apply-templates/></Hyperlink>
	</xsl:template>

	<xsl:template match ="w:hyperlink[contains(@w:anchor, 'theoncologist')]">
	   <Hyperlink><xsl:apply-templates/></Hyperlink>
	</xsl:template>

	<xsl:template match ="w:hyperlink[contains(@w:anchor, 'para')]">
	   <Hyperlink id="{@w:anchor}"><xsl:apply-templates/></Hyperlink>
	</xsl:template>

	
	<xsl:template match ="w:bookmarkStart[contains(@w:name, 'CEG')]">
	   <bookmark id="{@w:name}" />
	</xsl:template>

	<xsl:template match ="w:bookmarkStart[contains(@w:name, 'CJML')]">
	   <bookmark id="{@w:name}" />
	</xsl:template>

	<xsl:template match ="w:bookmarkStart[contains(@w:name, 'CEG')]">
	   <bookmark id="{@w:name}" />
	</xsl:template>

	<xsl:template match ="w:bookmarkStart[contains(@w:name, 'SetLang_BK_Start')]">
	   <entity name="{@w:name}" />
	</xsl:template>

	<xsl:template match ="w:bookmarkStart[contains(@w:name, 'SetLang_BK_End')]">
	   <entity/>
	</xsl:template>
  
	<!-- /Characters -->

	<!--<xsl:template match="*">
		<xsl:choose>
			<xsl:when test="@w:font and @w:char">
				<xsl:text disable-output-escaping="yes">&amp;</xsl:text><xsl:text>#x</xsl:text><xsl:value-of select="@w:char"/><xsl:text>;</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>-->

	
	<xsl:template match="w:hlink">
		<xsl:choose>
			<xsl:when test="@w:bookmark and w:r/w:rPr/w:vertAlign/@w:val='superscript'">
				<sup><xsl:element name="xref"><xsl:attribute name="href"><xsl:value-of select="@w:bookmark"/></xsl:attribute><xsl:apply-templates/></xsl:element></sup>
			</xsl:when>
			<xsl:when test="@w:bookmark">
				<xsl:element name="xref"><xsl:attribute name="href"><xsl:value-of select="@w:bookmark"/></xsl:attribute><xsl:apply-templates/></xsl:element>
			</xsl:when>
			<xsl:otherwise>
				<xref><xsl:apply-templates/></xref>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="aml:annotation">
		<xsl:choose>
			<xsl:when test="contains(@w:name, 'NG_BIB_')"/>
			<xsl:when test="contains(@w:name, 'NG_FIG_')">
				<a id="{@w:name}"><xsl:apply-templates/></a>
			</xsl:when>
			<xsl:when test="contains(@w:name, 'NG_TAB_')">
				<a id="{@w:name}"><xsl:apply-templates/></a>
			</xsl:when>
			<xsl:when test="contains(@w:name, 'NG_EQU_')">
				<a id="{@w:name}"><xsl:apply-templates/></a>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="w:footnoteReference">
		<fn id="{@w:id}"><xsl:apply-templates/></fn>
	</xsl:template>


<xsl:template match="w:sym">
	<xsl:element name="err">
		<xsl:attribute name="font"><xsl:value-of select="@w:font"/></xsl:attribute>
		<xsl:attribute name="char"><xsl:value-of select="@w:char"/></xsl:attribute>
	</xsl:element>
</xsl:template>






 

	
</xsl:stylesheet>

