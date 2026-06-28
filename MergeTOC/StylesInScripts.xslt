<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="xml" indent="yes"/>
        
    <xsl:template match="@*|node()">        
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>            
        </xsl:copy> 
    </xsl:template>
    
    <xsl:template match="/">
        <xsl:call-template name="epubStylesColl"/>            
    </xsl:template>
    
    <xsl:template name="epubStylesColl">
       
        <xsl:element name="epub_stylesList">
 
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'AbbreviationList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'AbbreviationText'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_Abstract'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Abstract'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'AbstractHeading'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_AbstractPara'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'AbstractWordCount'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Academic'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Academic_Editor'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'AcceptedDate'"/>
                </xsl:attribute>
            </xsl:element>            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'AcknowledgementContent'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Acknowledgements'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_AcknowledgementPara'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'AcronymHead'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'AcronymText'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_Advisory_Board_Heading'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_Advisory_Board_Members'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Affiliation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_Affiliation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'AffiliationHead'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'AppendixCaption'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'AppendixCaptions'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_AppendixPara'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_AppendixParaFL'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'AppendixSource'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_AppendixSubHead'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_AppendixTitle'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ArticleType'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'AuthorHeading'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'AuthorContribution'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'AuthorDeclaration'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_AuthorDetails'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'AuthorInfo'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'BackMatterHeading'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'BodyText_B'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_Book_Editor'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Box_Place_Holder'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'BoxBulletList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'BoxFootnote'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'BoxHeading'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'BoxLc_AlphaList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'BoxLc_RomanList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'BoxList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'BoxNumberedList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'BoxSource'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'BoxSubHead'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'BoxText'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'BoxTitle'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'BoxTitles'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'BoxUc_AlphaList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'BoxUc_RomanList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'BoxUnNumberedList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Bullet_SubList2'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Bullet_SubList2_Last'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Bullet_SubList3'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Bullet_SubList3_Last'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Bullet_SubList4'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Bullet_SubList4_Last'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Bullet_SubList5'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Bullet_SubList5_Last'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Bullet_SubList6'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Bullet_SubList6_Last'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Bullet_SubList7'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Bullet_SubList7_Last'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'BulletList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'BulletPara'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Capsule'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'CapsulePara'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Caption'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Case_report'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_CaseStudyPara'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_CaseStudyTitle'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ChapOut'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ChapOutText'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Chapter_Open_Para'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ChapterWord'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_City'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_ConclusionPara'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_ContributorsPara'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'CoreObjective'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'CoreObjectiveText'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'CorrespondenceInfo'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'CorrespondenceInfoHeading'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Count'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'DataAvailability'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_DedicationPara'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Disclaimer'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'DisplayHeading'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'DisplayHeadings'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'DocumentAuthor'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'DOI'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'EMailAddress'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'EMailAddressHead'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'EndNotesText'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Epigraph'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Epigraph_Author_Name'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Equation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_Equation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Ethical_Approval'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Exhibit_Place_Holder'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ExhibitCaption'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ExhibitCaptions'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ExhibitSource'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ExtraTitle'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FE_01_NAME'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FigureSource'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FirstAuthor'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FirstBulletList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FirstLc_AlphaList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FirstLc_RomanList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FirstList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FirstNumberedList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FirstUc_AlphaList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FirstUc_RomanList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FirstUnNumberedList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Footnote'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FootNotesText'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_ForewordPara'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Funding'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'GlossaryTerm'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_GlossaryTerm'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'GraphicalAbstract'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'HeaderText'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Heading_L'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Highlight'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'HighlightText'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'HomeWorkAssignment'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'HomeWorkAssignmentList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'HomeWorkAssignmentText'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'IMAGE'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Image_Place_Holder'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ImageCaption'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ImageCaptions'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ImageSource'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_Imprint'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_IndexEntry'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_IndexAlpha'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_IndexHeading'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Instruction'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_IntroductionPara'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'IntroQuote'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'IntroQuoteName'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'JournalName'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Keypoints'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'KeyTermHead'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_KeyTermHead'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'KeyTerms'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_KeyTerms'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'LastBulletList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'LastLc_AlphaList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'LastLc_RomanList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'LastList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'LastNumberedList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'LastUc_AlphaList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'LastUc_RomanList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'LastUnNumberedList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Lc_Alpha_SubList2'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Lc_Alpha_SubList2_Last'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Lc_Alpha_SubList3'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Lc_Alpha_SubList3_Last'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Lc_Alpha_SubList4'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Lc_Alpha_SubList4_Last'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Lc_Alpha_SubList5'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Lc_Alpha_SubList5_Last'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Lc_Alpha_SubList6'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Lc_Alpha_SubList6_Last'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Lc_Alpha_SubList7'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Lc_Alpha_SubList7_Last'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Lc_AlphaList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Lc_Roman_SubList2'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Roman_SubList2_Last'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Lc_Roman_SubList3'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Roman_SubList3_Last'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Lc_Roman_SubList4'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Roman_SubList4_Last'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Lc_Roman_SubList5'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Roman_SubList5_Last'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Lc_Roman_SubList6'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Roman_SubList6_Last'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Lc_Roman_SubList7'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Roman_SubList7_Last'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Lc_RomanList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'LearnObjHeading'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'LearnObjList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'LearnObjStatement'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'List'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ListHead'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_ListofBoxCaption'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_ListofFigureCaption'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_ListofTableCaption'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'MapLegend'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'MapSource'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'MSReceivedDate'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_NotationPara'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_Note'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Note'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'NotesHeading'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'NumberedList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'NumberSubList2'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'NumberSubList2_Last'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'NumberSubList3'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'NumberSubList3_Last'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'NumberSubList4'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'NumberSubList4_Last'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'NumberSubList5'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'NumberSubList5_Last'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'NumberSubList6'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'NumberSubList6_Last'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'NumberSubList7'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'NumberSubList7_Last'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Choice'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'PartNumber'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'PartTitle'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'PartWord'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Photo_Place_Holder'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'PhotoCaption'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'PhotoCaptions'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'PhotoSource'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'PhotoTitle'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Poem'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_PrefacePara'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'PreviewReview_UL'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'PreviewReviewHeader'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Question'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Reference_Alphabetical'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Reference_Numbered'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ReferencesHeading1'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Review_Instruction'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Review_QuestionsH1'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Review_QuestionsH2'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'RevisedDate'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'RunningHeadText'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'RunningHead'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Scheme_Place_Holder'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SchemeLegend'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SchemeLegends'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SchemeSource'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SectionNumber'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SectionTitle'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SectionWord'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_Series_Editor_Heading'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_Series_Editor_Name'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_Series_Para'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_Series_Title_Info'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_Series_Titles_Heading'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SeriesHeading'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SeriesHeadings'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ShortTitle'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ShortTitleHead'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Source'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Structure_Place_Holder'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'StructureLegend'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'StructureLegends'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'StructureSource'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'StudyPresentation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'StudyPresentationHead'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Submitted'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SubmittedDate'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_IndexSubEntry1'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_IndexSubEntry2'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_IndexSubEntry3'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_IndexSubEntry4'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_IndexSubEntry5'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_IndexSubEntry6'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_IndexSubEntry7'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Summary'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Summarytxt'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SupplBoxCaption'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SupplBoxSource'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SupplementaryLegends'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SupplExhibitCaption'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SupplFigureLegend'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SupplFigureSource'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SupplImageCaption'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SupplPhotoCaption'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SupplSchemeCaption'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SupplStructureCaption'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SupplTableCaption'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SupplTableSource'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SupportInfo'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SupportInfoHead'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Table_Place_Holder'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TableBody'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TableBulletList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TableCaptions'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TableColumnHead'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TableFirstBulletList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TableFirstLc_AlphaList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TableFirstLc_RomanList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TableFirstNumberedList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TableFirstUc_AlphaList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TableFirstUc_RomanList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TableFirstUnNumberedList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TableFootnote'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TableLastBulletList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TableLastColumnHead'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TableLastLc_AlphaList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TableLastLc_RomanList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TableLastNumberedList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TableLastRow'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TableLastUc_AlphaList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TableLastUc_RomanList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TableLastUnNumberedList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TableLc_AlphaList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TableLc_RomanList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TableList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TableNumberdList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TableSideHead'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TableSource'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TableUc_AlphaList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TableUc_RomanList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TableUnNumberedList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Title'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TitleHead'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TOC_PartTitle'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TOC_PartNumber'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TOC_SectionTitle'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TOC_UnitTitle'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TOC_Head1'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TOC_Head2'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TOC_Head3'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TOC_Head4'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TOC_Head5'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TOC_Head6'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TOC_Head7'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TOC_TableCaption'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TOC_TableCaptions'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TOC_FigureLegend'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TOC_FigureLegends'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TOC_BoxTitle'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TOC_BoxTitles'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TOC_NotesHeading'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TocContent'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_TransliterationPara'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_AbouttheEditorHeading'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TocHeading'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_AbouttheEditor'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_DocumentAuthor'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Uc_Alpha_SubList2'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Uc_Alpha_SubList2_Last'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Uc_Alpha_SubList3'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Uc_Alpha_SubList3_Last'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Uc_Alpha_SubList4'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Uc_Alpha_SubList4_Last'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Uc_Alpha_SubList5'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Uc_Alpha_SubList5_Last'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Uc_Alpha_SubList6'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Uc_Alpha_SubList6_Last'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Uc_Alpha_SubList7'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Uc_Alpha_SubList7_Last'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Uc_AlphaList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Uc_Roman_SubList2'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Uc_Roman_SubList2_Last'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Uc_Roman_SubList3'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Uc_Roman_SubList3_Last'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Uc_Roman_SubList4'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Uc_Roman_SubList4_Last'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Uc_Roman_SubList5'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Uc_Roman_SubList5_Last'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Uc_Roman_SubList6'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Uc_Roman_SubList6_Last'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Uc_Roman_SubList7'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Uc_Roman_SubList7_Last'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Uc_RomanList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'UnitNumber'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'UnitTitle'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'UnitWord'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'UnNumberedList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'URL'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Vltext'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'WordCount'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'WordCountHead'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_Book_Title'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_Book_Author'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Book_SubTitle'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SubTitle'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'BookSubTitle'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_SubTitle'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_Half_Title'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_Series_Title'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'series_subtitle'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_Publisher'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_Publication_Image'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_Copyright_Library'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_Copyright_Space'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ChapterTitle'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ChapterNumber'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TOC_ChapterNumber'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TOC_ChapterTitle'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TOC_FrontMatter'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TOC_BackMatter'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TableCaption'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Head1'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Head2'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Head3'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Head4'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Head5'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Head6'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Head7'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Head8'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Head9'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Head10'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Head11'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Head12'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_Copy_Right_First'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_Copy_Right'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Series_Heading'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FrontMatterHeading'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ParaFL'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ParaFirstLineInd'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ExtractText'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ExtractText_First'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ExtractText_Last'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FigureLegend'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FigureLegends'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Figure_Place_Holder'"/>
                </xsl:attribute>
            </xsl:element>
             
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ManyBoxTitle'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ManyExhibitCaption'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ManyFigureCaption'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ManyImageCaption'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ManyMapCaption'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ManyStructureLegend'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ManyPhotoCaption'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ManySchemeLegend'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ManySupplBoxTitle'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ManySupplFigureLegend'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ManySupplTableCaption'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ManyTableCaption'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'B_ZRange'"/>
                </xsl:attribute>
            </xsl:element>
                    
            
<!--  START CHARACTER STYLES    -->
           
         
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'bold'"/>
                </xsl:attribute>
            </xsl:element>

            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'bolditalics'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'boldsubscript'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'boldsuperscript'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'italic'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FB_ISBN'"/>
                </xsl:attribute>
            </xsl:element>
            
            
            
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Abbreviation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'AbbreviationExpansion'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'AbbreviationHead'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Accessed_Date'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Address'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'allcaps'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'AppendixCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'AppendixNumber'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ArabicCharacters'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ArticleTitle'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'boldallcaps'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'boldHLC'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'bolditalicHLC'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'bolditalicunderlineHLC'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'boldsmallcaps'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'boldstrikethrough'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'BookTitle'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'BoxCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'BoxNumber'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'BoxPMI'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'CherokeeCharacters'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'cite_bib'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Cited'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Location'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'CityName'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'CJK_Characters'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'CollegeName'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Country_Name'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'DateFormat'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'DepartmentName'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Edition'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Editor'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'EgyptianCopticCharacters'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'EmailId'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'EquationName'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Et_al'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ExhibitCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ExhibitNumber'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ExhibitPMI'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ExternalBoxCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ExternalExhibitCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ExternalFigCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ExternalImageCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ExternalMultiBoxCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ExternalMultiExhibitCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ExternalMultiFigureCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ExternalMultiImageCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ExternalMultiPhotoCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ExternalMultiSchemeCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ExternalMultiStructureCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ExternalMultiTableCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ExternalPhotoCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ExternalSchemeCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ExternalStructureCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ExternalSupplFigureCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ExternalSupplMultiFigureCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ExternalSupplMultiTableCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ExternalSupplTableCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ExternalTableCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Fax_Format'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Fax_Number'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FigureCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FigureNumber'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FigurePMI'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FirstName'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FirstPage'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FN'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FootnoteAnchor'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'GreekCharacters'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'HeadingNumber'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'HebrewCharacters'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Ibid'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Id'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ImageCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ImageNumber'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ImagePMI'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'InPress'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'InternetResource'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Issue'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'italicallcaps'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'italicHLC'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'italicsmallcaps'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'italicstrikethrough'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'italicsubscript'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'italicsuperscript'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'italicunderlineHLC'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'LastName'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'LastPage'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'LN'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'LongDash'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ManualList'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'MapCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'MapNumber'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Math'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'MathB'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'MathBI'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'MathBISub'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'MathBISup'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'MathBSub'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'MathBSup'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'MathI'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'MathISub'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'MathISup'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'MathSub'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'MathSup'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'MiddleName'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'MN'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Organisation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'OthersTitle'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'PhotoCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'PhotoNumber'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'PhotoPMI'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Publisher'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Retraction'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Retrieved_Date'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SchemeCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SchemeNumber'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SchemePMI'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'singleunderline'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'smallcaps'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'strikethrough'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'StructureCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'StructureNumber'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'StructurePMI'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'sub'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'sup'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Suppl'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SupplBoxCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SupplBoxNumber'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SupplExhibitCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SupplExhibitNumber'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SupplFigureCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SupplFigureNumber'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SupplImageCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SupplImageNumber'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SupplMultiBoxCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SupplMultiExhibitCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SupplMultiFigureCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SupplMultiImageCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SupplMultiPhotoCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SupplMultiSchemeCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SupplMultiStructureCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SupplMultiTableCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SupplPhotoCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SupplPhotoNumber'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SupplSchemeCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SupplSchemeNumber'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SupplStructureCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SupplStructureNumber'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SupplTableCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SupplTableNumber'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Symbol'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SymbolB'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SymbolBI'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SymbolBISub'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SymbolBISup'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SymbolBSub'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SymbolBSup'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SymbolI'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SymbolISub'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SymbolISup'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SymbolSub'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SymbolSup'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TableNumber'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TableCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TablePMI'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Tag'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Telephone_Number'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Time'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'underlineboldHLC'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'underlineHLC'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'UniversityName'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Untag'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Updated'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Volume'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Website'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'MultiAppendixCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'MultiBoxCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'MultiExhibitCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'MultiFigureCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'MultiImageCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'MultiMapCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'MultiPhotoCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'MultiSchemeCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'MultiStructureCitation'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'MultiTableCitation'"/>
                </xsl:attribute>
            </xsl:element>   
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'IllustrationGroup'"/>
                </xsl:attribute>
            </xsl:element> 
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'IllustrationCaption'"/>
                </xsl:attribute>
            </xsl:element> 
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'IllustrationRef'"/>
                </xsl:attribute>
            </xsl:element> 
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Illustration'"/>
                </xsl:attribute>
            </xsl:element> 
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Publication_Number'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ConferenceTitle'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'PresentationTitle'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ThesisTitle'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SocialMediaReferenceTitle'"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'WebsiteReferenceTitle'"/>
                </xsl:attribute>
            </xsl:element>
            
        </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>