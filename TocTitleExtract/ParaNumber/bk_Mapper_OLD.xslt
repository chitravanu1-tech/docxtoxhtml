<?xml version="1.0" encoding="UTF-8"?>
<!--<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
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
    xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main"
    xmlns:math="http://exslt.org/math" extension-element-prefixes="math"
    xmlns:pic="http://schemas.openxmlformats.org/drawingml/2006/picture"
    xmlns:a14="http://schemas.microsoft.com/office/drawing/2010/main"
    xmlns:idPkg="http://ns.adobe.com/AdobeInDesign/idml/1.0/packaging" xmlns:num="http://whatever"
    version="2.0">
    
    <xsl:output  method="xml"/>
    <xsl:param name="PassFileName" select="substring-before(tokenize(base-uri(.), '/')[last()],'.')"/><!-\-Saravan pass file-\->
    
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="document">
        <xsl:if test="descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterTitle']">
            <xsl:result-document href="{'book_Toc'}.xml">
                <xsl:text>&#x000A;</xsl:text><xsl:element name="root">
                <xsl:text>&#x000A;</xsl:text>
                <xsl:for-each select="descendant::ParagraphStyleRange">
                    <xsl:if test="@AppliedParagraphStyle = 'ParagraphStyle/TOC_FrontMatter'">
                        <xsl:text>&#x000A;</xsl:text>
                        <xsl:element name="Toc">
                            <xsl:attribute name="Toc_Chtitle">
                                <xsl:value-of select="descendant::Content"/>
                            </xsl:attribute>
                        </xsl:element>   
                    </xsl:if>
                    
                    <xsl:variable name="ChNo">
                    <xsl:if test="preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterNumber']">
                        <xsl:value-of select="preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterNumber']/."/>
                    </xsl:if>
                    </xsl:variable>
                                        
                    <xsl:if test="@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterTitle'">
                        <xsl:text>&#x000A;</xsl:text>
                        <xsl:element name="Toc">
                            <xsl:attribute name="Toc_Chtitle">
                                <xsl:variable name="chTile">
                                <xsl:value-of select="descendant::Content"/>
                                </xsl:variable>
                                <xsl:value-of select="normalize-space($chTile)"/>
                                <!-\-<xsl:value-of select="descendant::Content"/>-\->
                            </xsl:attribute>
                            <xsl:attribute name="Toc_ChNumber">
                                <xsl:value-of select="normalize-space($ChNo)"/>
                            </xsl:attribute>
                        </xsl:element>   
                    </xsl:if>
                    
                    <xsl:if test="@AppliedParagraphStyle = 'ParagraphStyle/TOC_BackMatter'">
                        <xsl:text>&#x000A;</xsl:text>
                        <xsl:element name="Toc">
                            <xsl:attribute name="Toc_Chtitle">
                                <xsl:value-of select="descendant::Content"/>
                            </xsl:attribute>
                        </xsl:element>   
                    </xsl:if>
                </xsl:for-each>
                <xsl:text>&#x000A;</xsl:text>
                </xsl:element>
            </xsl:result-document>
        </xsl:if>
        
        <xsl:variable name="currentfilename">
            <xsl:choose>
                <xsl:when test="$PassFileName = ''">
                     <xsl:value-of select="substring-before($PassFileName,'.')"/> 
                    <xsl:value-of select="substring-before(tokenize(base-uri(.), '/')[last()],'.')"></xsl:value-of>        
                </xsl:when>
                <xsl:otherwise>
                     <xsl:value-of select="substring-before(tokenize(base-uri(.), '/')[last()],'.')"></xsl:value-of> 
                    <xsl:value-of select="substring-before($PassFileName,'.')"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:result-document href="{$currentfilename}.cf">
            <xsl:text>&#x000A;</xsl:text><xsl:element name="root">
                 <xsl:for-each select="descendant::ParagraphStyleRange">
                     <xsl:if test="@AppliedParagraphStyle = 'ParagraphStyle/FrontMatterHeading'">
                         <xsl:text>&#x000A;</xsl:text>
                         <xsl:element name="Title">
                             <xsl:attribute name="ChapterTitle">
                                 <xsl:value-of select="descendant::Content"/>
                             </xsl:attribute>
                         </xsl:element>    
                     </xsl:if>
                     
                     <xsl:variable name="ChNo">
                         <xsl:if test="preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/ChapterNumber']">
                             <xsl:value-of select="preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/ChapterNumber']/."/>
                         </xsl:if>
                     </xsl:variable>
                     
                     <xsl:if test="@AppliedParagraphStyle = 'ParagraphStyle/ChapterTitle'">
                         <xsl:text>&#x000A;</xsl:text>
                         <xsl:element name="Title">
                             <xsl:attribute name="ChapterTitle">
                                 <xsl:variable name="chTile">
                                     <xsl:value-of select="descendant::Content"/>
                                 </xsl:variable>
                                 <xsl:value-of select="normalize-space($chTile)"/>
                                 <!-\-<xsl:value-of select="descendant::Content"/>-\->
                             </xsl:attribute>
                             <xsl:attribute name="ChapterNumber">
                                 <xsl:value-of select="normalize-space($ChNo)"/>
                             </xsl:attribute>
                         </xsl:element>   
                     </xsl:if>
                     <xsl:if test="@AppliedParagraphStyle = 'ParagraphStyle/BackMatterHeading'">
                         <xsl:text>&#x000A;</xsl:text>
                         <xsl:element name="Title">
                             <xsl:attribute name="ChapterTitle">
                                 <xsl:value-of select="descendant::Content"/>
                             </xsl:attribute>
                         </xsl:element>    
                     </xsl:if>
                 </xsl:for-each>
                <xsl:text>&#x000A;</xsl:text>        
            </xsl:element>
        </xsl:result-document>
        
    </xsl:template>
    <!-\-<xsl:template match="document">
        <xsl:if test="descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterTitle']">
        <xsl:result-document href="{'book_Toc'}.xml">
                 <xsl:text>&#x000A;</xsl:text>
                 <xsl:element name="root">
                  <xsl:for-each select="descendant::ParagraphStyleRange"> 
                     <xsl:if test="@AppliedParagraphStyle = 'ParagraphStyle/TOC_FrontMatter'">
                         <xsl:text>&#x000A;</xsl:text>
                         <xsl:element name="Toc">
                             <xsl:attribute name="Toc_Chtitle">
                                 <xsl:value-of select="descendant::Content"/>
                             </xsl:attribute>
                         </xsl:element>    
                     </xsl:if>
                     <xsl:for-each select="descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterNumber']">
                         <xsl:value-of select="following::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterTitle']"/>
                     </xsl:for-each>
                     <xsl:variable name="cnData" select="descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterNumber'][1]/descendant::Content"/>
                     
                      <xsl:variable name="result" select="normalize-space($cnData)"/>                      
                     
                     <xsl:variable name="ctData" select="descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterTitle'][1]/descendant::Content"/>   
                     <xsl:text>&#x000A;</xsl:text>
                     <xsl:element name="Title">
                         <xsl:attribute name="ChapterTitle">
                             <xsl:if test="descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterNumber'][1]/descendant::Content">
                                  <xsl:value-of select="concat($cnData,' ')"/> 
                             </xsl:if>
                             <xsl:value-of select="$cnData"/>
                         </xsl:attribute>
                     </xsl:element>
                     
                      <xsl:if test="@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterNumber'">
                         <xsl:text>&#x000A;</xsl:text>
                         <xsl:element name="Toc">
                             <xsl:attribute name="Toc_Chtitle">
                                 <xsl:value-of select="descendant::Content"/>
                             </xsl:attribute>
                         </xsl:element>    
                     </xsl:if>
                     <xsl:if test="@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterTitle'">
                         <xsl:text>&#x000A;</xsl:text>
                         <xsl:element name="Toc">
                             <xsl:attribute name="Toc_Chtitle">
                                 <xsl:value-of select="descendant::Content"/>
                             </xsl:attribute>
                         </xsl:element>    
                     </xsl:if> 
                     <xsl:if test="@AppliedParagraphStyle = 'ParagraphStyle/TOC_BackMatter'">
                         <xsl:text>&#x000A;</xsl:text>
                         <xsl:element name="Toc">
                             <xsl:attribute name="Toc_Chtitle">
                                 <xsl:value-of select="descendant::Content"/>
                             </xsl:attribute>
                         </xsl:element>    
                     </xsl:if>
                  </xsl:for-each> 
              <xsl:text>&#x000A;</xsl:text></xsl:element>
             </xsl:result-document>
        </xsl:if>
        <xsl:variable name="currentfilename">
            <xsl:choose>
                <xsl:when test="$PassFileName = ''">
                     <xsl:value-of select="substring-before($PassFileName,'.')"/> 
                    <xsl:value-of select="substring-before(tokenize(base-uri(.), '/')[last()],'.')"></xsl:value-of>        
                </xsl:when>
                <xsl:otherwise>
                     <xsl:value-of select="substring-before(tokenize(base-uri(.), '/')[last()],'.')"></xsl:value-of> 
                    <xsl:value-of select="substring-before($PassFileName,'.')"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:result-document href="{$currentfilename}.cf">
            <xsl:text>&#x000A;</xsl:text><xsl:element name="root">
                    <xsl:for-each select="descendant::ParagraphStyleRange"> 
                <xsl:if test="descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/Series_Title']">
                           <xsl:text>&#x000A;</xsl:text>
                           <xsl:element name="Title">
                               <xsl:attribute name="ChapterTitle">
                                   <xsl:variable name="str" select="descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/Series_Title']/descendant::Content"/>
                                    <xsl:variable name="str1" select="string($str)"/> 
                                    <xsl:value-of select="translate($str1,'&#x2028;','')"/> 
                                   <xsl:value-of select="$str"/>
                               </xsl:attribute>
                           </xsl:element>    
                       </xsl:if>
                <xsl:if test="descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/HalfTitle']">
                    <xsl:text>&#x000A;</xsl:text>
                    <xsl:element name="Title">
                        <xsl:attribute name="ChapterTitle">
                            <xsl:variable name="str" select="descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/HalfTitle']/descendant::Content"/>
                             <xsl:variable name="str1" select="string($str)"/> 
                             <xsl:value-of select="translate($str1,'&#x2028;','')"/> 
                            <xsl:value-of select="$str"/>
                        </xsl:attribute>
                    </xsl:element>    
                </xsl:if>
                <xsl:if test="descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FrontMatterHeading']">
                           <xsl:text>&#x000A;</xsl:text>
                           <xsl:element name="Title">
                               <xsl:attribute name="ChapterTitle">
                                   <xsl:value-of select="descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FrontMatterHeading']/descendant::Content"/>
                               </xsl:attribute>
                           </xsl:element>     
                       </xsl:if>
                <xsl:variable name="cnData" select="descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/ChapterNumber'][1]/."/>
                <xsl:variable name="result" select="normalize-space($cnData)"/>
                <xsl:variable name="ctData" select="descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/ChapterTitle'][1]/descendant::Content"/>   
                <xsl:text>&#x000A;</xsl:text>
                <xsl:element name="Title">
                    <xsl:attribute name="ChapterTitle">
                        <xsl:if test="descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/ChapterNumber'][1]/.">
                            <xsl:value-of select="concat($result,' ')"/>
                        </xsl:if>
                        <xsl:value-of select="$ctData"/>
                    </xsl:attribute>
                </xsl:element>
                        <xsl:if test="@AppliedParagraphStyle = 'ParagraphStyle/ChapterNumber'">
                           <xsl:text>&#x000A;</xsl:text>
                           <xsl:element name="Title1">
                               <xsl:attribute name="ChapterTitle">
                                   <xsl:value-of select="concat($chTitle,$chNumber)"/>
                               </xsl:attribute>
                           </xsl:element>
                       </xsl:if>                    
                        <xsl:if test="@AppliedParagraphStyle = 'ParagraphStyle/ChapterNumber'">
                           <xsl:text>&#x000A;</xsl:text>
                           <xsl:element name="Title">
                               <xsl:attribute name="ChapterTitle">
                                   <xsl:value-of select="descendant::Content"/>
                               </xsl:attribute>
                           </xsl:element>     
                       </xsl:if>
                       <xsl:if test="@AppliedParagraphStyle = 'ParagraphStyle/ChapterTitle'">
                           <xsl:text>&#x000A;</xsl:text>
                           <xsl:element name="Title">
                               <xsl:attribute name="ChapterTitle">
                                   <xsl:value-of select="descendant::Content"/>
                               </xsl:attribute>
                           </xsl:element>     
                       </xsl:if> 
                <xsl:if test="descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/BackMatterHeading']">
                           <xsl:text>&#x000A;</xsl:text>
                           <xsl:element name="Title">
                               <xsl:attribute name="ChapterTitle">
                                   <xsl:value-of select="descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/BackMatterHeading']/descendant::Content"/>
                               </xsl:attribute>
                           </xsl:element>     
                       </xsl:if>
                    </xsl:for-each> 
                 <xsl:text>&#x000A;</xsl:text><xsl:element name="p">
                    <xsl:attribute name="FileName">
                        <xsl:value-of select="$currentfilename"/>    
                    </xsl:attribute>
                </xsl:element> 
                <xsl:text>&#x000A;</xsl:text>        
            </xsl:element>
        </xsl:result-document>
        
         <xsl:if test="ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FrontMatterHeading']">
            
            <xsl:result-document href="{'book_Toc'}.xml">
                <xsl:text>&#x000A;</xsl:text>
                <xsl:element name="bookInfo">
                    <!-\\\\- <xsl:text>&#x000A;</xsl:text>
                    <xsl:variable name="no_1" select="1"/>
                    <xsl:element name="p">
                        <xsl:attribute name="id">
                            <xsl:value-of select="'cover'"/>
                        </xsl:attribute>
                        <xsl:attribute name="seqNo">
                            <xsl:value-of select="$no_1"/>
                        </xsl:attribute>
                        <xsl:value-of select="'Cover'"/>
                    </xsl:element>-\\\\->
                    <!-\\\\-<xsl:text>&#x000A;</xsl:text>
                    <xsl:for-each select="$bookInfo_Fm//p[@id = 'Series_Title']">
                        <xsl:variable name="posiFMH" select="position()"/>
                        <xsl:element name="p">
                            <xsl:attribute name="id">
                                <xsl:value-of select="'Series_Title'"/>
                            </xsl:attribute>
                            <xsl:attribute name="seqNo">
                                <xsl:value-of select="$posiFMH"/>
                            </xsl:attribute>
                            <xsl:value-of select="."/>
                        </xsl:element><xsl:text>&#x000A;</xsl:text>
                    </xsl:for-each>-\\\\->
                  <!-\\\\-  <xsl:variable name="countOfFmSeres">
                        <xsl:value-of select="count($bookInfo_Fm//p[@id = 'Series_Title'])"/>
                    </xsl:variable>-\\\\->
                    <xsl:for-each select="//p[contains(@class,'FrontMatterHeading')]">
                        <xsl:variable name="posiFMH" select="position()"/>
                        <xsl:element name="p">
                            <xsl:attribute name="id">
                                <xsl:value-of select="'FrontMatterHeading'"/>
                            </xsl:attribute>
                           <!-\\\\- <xsl:attribute name="seqNo">
                                <xsl:value-of select="$posiFMH + $countOfFmSeres"/>
                            </xsl:attribute>-\\\\->
                            <xsl:variable name="title">
                                <xsl:value-of select="self::p"/>
                            </xsl:variable>
                            <xsl:value-of select="normalize-space($title)"/>
                        </xsl:element><xsl:text>&#x000A;</xsl:text>
                    </xsl:for-each>
                   <!-\\\\- <xsl:variable name="countOfFmh">
                        <xsl:value-of select="count(//p[@class = 'FrontMatterHeading'])"/>
                    </xsl:variable>-\\\\->
                    <xsl:for-each select="//p[@class = 'TOC_FrontMatter']">
                        <xsl:variable name="posiFM" select="position()"/>
                        <xsl:element name="p">
                            <xsl:attribute name="id">
                                <xsl:value-of select="'TOC_FrontMatter'"/>
                            </xsl:attribute>
                           <!-\\\\- <xsl:attribute name="seqNo">
                                <xsl:value-of select="$posiFM + $countOfFmh + $countOfFmSeres"/>
                            </xsl:attribute>-\\\\->
                            <xsl:variable name="title">
                                <xsl:value-of select="self::p"/>
                            </xsl:variable>
                            <xsl:value-of select="normalize-space($title)"/>
                        </xsl:element><xsl:text>&#x000A;</xsl:text>
                    </xsl:for-each>
                   <!-\\\\- <xsl:variable name="countOfFm">
                        <xsl:value-of select="count(//p[@class = 'TOC_FrontMatter'])"/>
                    </xsl:variable>-\\\\->
                    
                    <xsl:for-each select="//p[@class = 'TOC_ChapterNumber']">
                        <xsl:variable name="posiTOCNo" select="position()"/>
                        <xsl:element name="p">
                            <xsl:attribute name="id">
                                <xsl:value-of select="'TOC_ChapterNumber'"/>
                            </xsl:attribute>
                           <!-\\\\- <xsl:attribute name="seqNo">
                                <xsl:value-of select="$posiTOCNo + $countOfFm + $countOfFmh + $countOfFmSeres"/>
                            </xsl:attribute>-\\\\->
                            <!-\\\\-<xsl:message><xsl:value-of select="$posiTOC"/>::<xsl:value-of select="$countOfFm"/>::<xsl:value-of select="$countOfFmh"/></xsl:message>-\\\\->
                            <xsl:if test="//p[@class = 'TOC_ChapterTitle']">
                                <xsl:variable name="title">
                                    <xsl:value-of select="self::p"/>
                                </xsl:variable>
                                <xsl:value-of select="normalize-space($title)"/>
                            </xsl:if>
                        </xsl:element><xsl:text>&#x000A;</xsl:text>
                    </xsl:for-each>
                    <!-\\\\-<xsl:variable name="countOfTOCNo">
                        <xsl:value-of select="count(//p[@class = 'TOC_ChapterNumber'])"/>
                    </xsl:variable>-\\\\->
                    
                    <xsl:for-each select="//p[@class = 'TOC_ChapterTitle']">
                        <xsl:variable name="posiTOC" select="position()"/>
                        <xsl:element name="p">
                            <xsl:attribute name="id">
                                <xsl:value-of select="'TOC_ChapterTitle'"/>
                            </xsl:attribute>
                           <!-\\\\- <xsl:attribute name="seqNo">
                                <xsl:value-of select="$posiTOC + $countOfFm + $countOfFmh + $countOfFmSeres + $countOfTOCNo"/>
                            </xsl:attribute>-\\\\->
                            <!-\\\\-<xsl:message><xsl:value-of select="$posiTOC"/>::<xsl:value-of select="$countOfFm"/>::<xsl:value-of select="$countOfFmh"/></xsl:message>-\\\\->
                            <xsl:if test="//p[@class = 'TOC_ChapterTitle']">
                                <xsl:variable name="title">
                                    <xsl:value-of select="self::p"/>
                                </xsl:variable>
                                <xsl:value-of select="normalize-space($title)"/>
                            </xsl:if>
                        </xsl:element><xsl:text>&#x000A;</xsl:text>
                    </xsl:for-each>
                   <!-\\\\- <xsl:variable name="countOfTOC">
                        <xsl:value-of select="count(//p[@class = 'TOC_ChapterTitle'])"/>
                    </xsl:variable>-\\\\->
                    <xsl:for-each select="//p[@class = 'TOC_BackMatter']">
                        <xsl:variable name="posiBM" select="position()"/>
                        <xsl:element name="p">
                            <xsl:attribute name="id">
                                <xsl:value-of select="'TOC_BackMatter'"/>
                            </xsl:attribute>
                            <!-\\\\-<xsl:attribute name="seqNo">
                                <xsl:value-of select="$countOfFm + $countOfTOC + $posiBM + $countOfFmh + $countOfFmSeres"/>
                            </xsl:attribute>-\\\\->
                            <xsl:if test="//p[@class = 'TOC_BackMatter']">
                                <xsl:variable name="title">
                                    <xsl:value-of select="self::p"/>
                                </xsl:variable>
                                <xsl:value-of select="normalize-space($title)"/>
                            </xsl:if>
                        </xsl:element><xsl:text>&#x000A;</xsl:text>
                    </xsl:for-each>
                </xsl:element>
            </xsl:result-document>
        </xsl:if> 
    
    </xsl:template>-\->

</xsl:stylesheet>-->
<!-- Added on 20-Sep-17, to preserve whitespace -->
<!-- 22-JUNE-18: Added instruction taken from https://www.w3schools.com/tags/tag_meta.asp -->


<!-- My called TEMPLATES from CK -->
<!--<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf" exclude-result-prefixes="xs mf" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" version="2.0">-->
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
  xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main"
  xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape"  xmlns:idPkg="http://ns.adobe.com/AdobeInDesign/idml/1.0/packaging" version="2.0">

  <xsl:strip-space elements="*"/>
  <!--<xsl:preserve-space elements="*"/>-->


  <!--<xsl:output method="xml" use-character-maps="Ascii2Unicode" xml:space="preserve" encoding="UTF-8" indent="yes" name="xml"/>-->
  <xsl:output method="xml" omit-xml-declaration="no"/>

  <xsl:variable name="json" select="document('bookMapperXMLFile.xml')"/>

  <xsl:variable name="filename" select="substring-before(tokenize(base-uri(.), '/')[last()], '.')"/>
  <xsl:param name="PassFileName" select="substring-before(tokenize(base-uri(.), '/')[last()],'.')"/><!--Saravan pass file-->
  
  <xsl:variable name="FileCha_NameList" select="document('fileName_chTitle.xml')"/>
  
  <!-- Added for Saravanan 16-Aug-17 -->
  <xsl:param name="xmlversion"/>
  <xsl:param name="idmlversion"/>
  <xsl:param name="inddversion"/>
  <!--<xsl:param name="xmlversion" select="10"/>
  <xsl:param name="idmlversion" select="20"/>
  <xsl:param name="inddversion" select="30"/>-->
  <!-- Added for Saravanan 16-Aug-17 END-->
  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>

 
  <xsl:template match="//document">            
    <xsl:variable name="currentfilename">
      <xsl:choose>
        <xsl:when test="$PassFileName = ''">
          <!--<xsl:value-of select="substring-before($PassFileName,'.')"/>-->
          <xsl:value-of select="substring-before(tokenize(base-uri(.), '/')[last()],'.')"></xsl:value-of>        
        </xsl:when>
        <xsl:otherwise>
          <!--<xsl:value-of select="substring-before(tokenize(base-uri(.), '/')[last()],'.')"></xsl:value-of>-->
          <xsl:value-of select="substring-before($PassFileName,'.')"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
      <xsl:if test="descendant::ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterTitle']">
          <xsl:result-document href="{'book_Toc'}.xml">
              <xsl:text>&#x000A;</xsl:text><xsl:element name="root">
                  <xsl:for-each select="descendant::ParagraphStyleRange">
                      <xsl:if test="@AppliedParagraphStyle = 'ParagraphStyle/FrontMatterHeading'">
                          <xsl:text>&#x000A;</xsl:text>
                          <xsl:element name="Toc">
                              <xsl:attribute name="Toc_Chtitle">
                                  <xsl:variable name="fMTile">
                                      <xsl:value-of select="descendant::Content"/>
                                  </xsl:variable>
                                  <xsl:value-of select="replace(normalize-space($fMTile),'&#8232;','')"/>
                              </xsl:attribute>
                          </xsl:element>   
                      </xsl:if>
                      <xsl:if test="@AppliedParagraphStyle = 'ParagraphStyle/TOC_FrontMatter'">
                          <xsl:text>&#x000A;</xsl:text>
                          <xsl:element name="Toc">
                              <xsl:attribute name="Toc_Chtitle">
                                  <xsl:variable name="fMTile">
                                      <xsl:value-of select="descendant::Content"/>
                                  </xsl:variable>
                                  <xsl:value-of select="replace(normalize-space($fMTile),'&#8232;','')"/>
                              </xsl:attribute>
                          </xsl:element>   
                      </xsl:if>
                      
                      <xsl:variable name="ChNo">
                          <xsl:if test="preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterNumber']">
                              <xsl:value-of select="preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterNumber']/."/>
                          </xsl:if>
                      </xsl:variable>
                      
                      <xsl:if test="@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterTitle'">
                          <xsl:text>&#x000A;</xsl:text>
                          <xsl:element name="Toc">
                              <xsl:attribute name="Toc_Chtitle">
                                  <xsl:variable name="chTile">
                                      <xsl:value-of select="descendant::Content"/>
                                  </xsl:variable>
                                  <xsl:value-of select="replace(normalize-space($chTile),'&#8232;','')"/>
                                  <!--<xsl:value-of select="descendant::Content"/>-->
                              </xsl:attribute>
                              <xsl:attribute name="Toc_ChNumber">
                                  <xsl:value-of select="normalize-space($ChNo)"/>
                              </xsl:attribute>
                          </xsl:element>   
                      </xsl:if>
                      
                      <xsl:if test="@AppliedParagraphStyle = 'ParagraphStyle/TOC_BackMatter'">
                          <xsl:text>&#x000A;</xsl:text>
                          <xsl:element name="Toc">
                              <xsl:attribute name="Toc_Chtitle">
                                  <xsl:variable name="bKTile">
                                      <xsl:value-of select="descendant::Content"/>
                                  </xsl:variable>
                                  <xsl:value-of select="replace(normalize-space($bKTile),'&#8232;','')"/>
                              </xsl:attribute>
                          </xsl:element>   
                      </xsl:if>
                  </xsl:for-each>
                  <xsl:text>&#x000A;</xsl:text>
              </xsl:element>
          </xsl:result-document>
      </xsl:if>
      <xsl:result-document href="{'output'}.cf">
        <xsl:text>&#x000A;</xsl:text><xsl:element name="root">
            <xsl:for-each select="descendant::ParagraphStyleRange">                
                <xsl:if test="@AppliedParagraphStyle = 'ParagraphStyle/FrontMatterHeading'">
                    <xsl:text>&#x000A;</xsl:text>
                    <xsl:element name="Title">
                        <xsl:attribute name="ChapterTitle">
                            <xsl:variable name="fMTile">
                                <xsl:value-of select="descendant::Content"/>
                            </xsl:variable>
                            <xsl:value-of select="replace(normalize-space($fMTile),'&#8232;','')"/>
                        </xsl:attribute>
                        <xsl:if test="//ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterTitle'][1]">
                        <xsl:attribute name="toc">
                            <xsl:for-each select="//ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/TOC_ChapterTitle'][1]">
                               <xsl:choose>
                                   <xsl:when test="contains(@AppliedParagraphStyle,'ParagraphStyle/TOC_ChapterTitle')">
                                       <xsl:value-of select="'true'"/>
                                   </xsl:when>
                                   <xsl:otherwise>
                                       <xsl:value-of select="'false'"/>
                                   </xsl:otherwise>
                               </xsl:choose>
                            </xsl:for-each>
                        </xsl:attribute>
                        </xsl:if>
                    </xsl:element>    
                </xsl:if>
                <xsl:variable name="ChNo">
                    <xsl:if test="preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/ChapterNumber']">
                        <xsl:value-of select="preceding-sibling::*[1][@AppliedParagraphStyle = 'ParagraphStyle/ChapterNumber']/."/>
                    </xsl:if>
                </xsl:variable>
                
                <xsl:if test="@AppliedParagraphStyle = 'ParagraphStyle/ChapterTitle'">
                    <xsl:text>&#x000A;</xsl:text>
                    <xsl:element name="Title">
                        <xsl:attribute name="ChapterTitle">
                            <xsl:variable name="chTile">
                                <xsl:value-of select="descendant::Content"/>
                            </xsl:variable>
                            <xsl:value-of select="replace(normalize-space($chTile),'&#8232;','')"/>
                        </xsl:attribute>
                        <xsl:attribute name="ChapterNumber">
                            <xsl:value-of select="normalize-space($ChNo)"/>
                        </xsl:attribute>
                    </xsl:element>   
                </xsl:if>
                <xsl:if test="@AppliedParagraphStyle = 'ParagraphStyle/BackMatterHeading'">
                    <xsl:text>&#x000A;</xsl:text>
                    <xsl:element name="Title">
                        <xsl:attribute name="ChapterTitle">
                            <xsl:variable name="bKTile">
                                <xsl:value-of select="descendant::Content"/>
                            </xsl:variable>
                            <xsl:value-of select="replace(normalize-space($bKTile),'&#8232;','')"/>
                        </xsl:attribute>
                    </xsl:element>    
                </xsl:if>
                
            </xsl:for-each>
            <xsl:text>&#x000A;</xsl:text>        
        </xsl:element>
    </xsl:result-document>
    
  </xsl:template>
  
</xsl:stylesheet>

