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
    <xsl:preserve-space elements="*"/>

    
    <xsl:variable name="artinfo" select="document('artinfo.xml')"/>
    <xsl:variable name="story" select="document('Inp.xml')"/>
    <xsl:output method="xml" indent="yes" name="xml" xml:space="preserve"/>
    
      <!-- <xsl:template match="MAPS/MAP">
            <xsl:variable name="M" select="."/>
        <xsl:variable name="filename" select="concat('output1/',$M)"/>
        <xsl:result-document href="{$filename}" format="xml">  
            <xsl:element name="w:body">
            <xsl:apply-templates select="document($M)//Measurement"/>
            </xsl:element>
        </xsl:result-document>
    </xsl:template>-->
    <xsl:template match="/">
        <xsl:element name="w:body">
            <xsl:apply-templates select="//Measurement"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="Measurement">
            <xsl:apply-templates/> 
                <!--<xsl:call-template name="SP"/>-->
    </xsl:template>
    
    <xsl:variable name="TextFrameIds" >
        <xsl:for-each select="//TextFrame/@id">
            <xsl:value-of select="."/>
        </xsl:for-each>
    </xsl:variable>
    
     <xsl:template match="TextFrame" name="TF">       
        <xsl:variable name="Sto" select="@story"/>
         <xsl:variable name="self" select="@id"/>
<!--        <xsl:variable name="Sto" select="concat('Story_',$St,'.xml')"/>-->
         <!--original condition-->
       <!-- <xsl:choose>
            <xsl:when test="@previous = 'n'">
                <xsl:if test="@next = 'n'">
                   <xsl:copy-of select="document($Sto)//body/*"/>
                    <!-\- @@@@@@@@@@@@@@@@@@ Section Break @@@@@@@@@@@@@@@@@@ -\->
                   <!-\- <xsl:call-template name="SP1"/>-\->
                    <!-\- @@@@@@@@@@@@@@@@@@ Section Break @@@@@@@@@@@@@@@@@@ -\->
                </xsl:if>
                <xsl:if test="@next != 'n'">                                  
                    <xsl:copy-of select="document($Sto)//body/*"/>
                    <!-\- @@@@@@@@@@@@@@@@@@ Section Break @@@@@@@@@@@@@@@@@@ -\->
                    <!-\-<xsl:call-template name="SP1"/>-\->
                    <!-\- @@@@@@@@@@@@@@@@@@ Section Break @@@@@@@@@@@@@@@@@@ -\->
                </xsl:if>
            </xsl:when>
        </xsl:choose>   -->
         <!--original condition-->
         <!--creating this new condition for converting the textframe into content control for MedStudy Pupose-->
         <xsl:choose>
             <xsl:when test="lower-case(@name) ='creditsource'">
                 <xsl:variable name="bookmark">
                     <xsl:choose>
                         <xsl:when test="descendant::w:bookmarkStart[contains(lower-case(@w:name),'story')][1]">
                             <xsl:value-of select="descendant::w:bookmarkStart[contains(lower-case(@w:name),'story')][1]/@w:name"/>
                         </xsl:when>
                     </xsl:choose>
                 </xsl:variable>
                 <xsl:variable name="id">
                     <xsl:value-of select="1694958775 - position()"/>
                 </xsl:variable>
                 
                 <xsl:variable name="Alias">
                     <xsl:value-of select="@name"/>
                 </xsl:variable>
                 
                 <xsl:variable name="Tag">
                     <xsl:value-of select="@name"/>
                 </xsl:variable>
                 <xsl:element name="w:sdt">
                     <xsl:attribute name="w:rsidR" select="$bookmark"/>
                     <xsl:element name="w:sdtPr">
                         <xsl:choose>
                             <xsl:when test="not(string-length($Alias) = 0)">
                                 <xsl:element name="w:alias">
                                     <xsl:attribute name="w:val" select="$Alias"/>
                                 </xsl:element>
                             </xsl:when>
                         </xsl:choose>
                         <xsl:choose>
                             <xsl:when test="not(string-length($Tag) = 0)">
                                 <xsl:element name="w:tag">
                                     <xsl:attribute name="w:val" select="$Tag"/>
                                 </xsl:element>
                             </xsl:when>
                         </xsl:choose>
                         <xsl:element name="w:id">
                             <xsl:attribute name="w:val" select="$id"/>
                         </xsl:element>
                         <xsl:element name="w:placeholder">
                             <xsl:element name="w:docPart">
                                 <xsl:attribute name="w:val" select="'DefaultPlaceholder_1081868574'"/>
                             </xsl:element>
                         </xsl:element>
                     </xsl:element>
                     <xsl:element name="w:sdtEndPr"/>
                     <xsl:element name="w:sdtContent">
                         <xsl:choose>
                             <xsl:when test="@previous = 'n'">
                                 <xsl:if test="@next = 'n'">
                                     
                                     <!--<xsl:copy-of select="document($Sto)//body/*"/>-->
                                     <xsl:choose>
                                         <xsl:when test="@libraryFillColor">
                                             <xsl:element name="shade">
                                                 <xsl:attribute name="libraryFillColor" select="@libraryFillColor"/>
                                             <!--<xsl:copy-of select="document($Sto)//body/*"/>-->
                                                 <xsl:copy-of select="$story//Story[@Self = $Sto]/*"/>
                                             </xsl:element>
                                         </xsl:when>
                                         <xsl:otherwise>
                                             <!--<xsl:copy-of select="document($Sto)//body/*"/>-->
                                             <xsl:copy-of select="$story//Story[@Self = $Sto]/*"/>
                                         </xsl:otherwise>
                                     </xsl:choose>
                                     <!-- @@@@@@@@@@@@@@@@@@ Section Break @@@@@@@@@@@@@@@@@@ -->
                                     <!-- <xsl:call-template name="SP1"/>-->
                                     <!-- @@@@@@@@@@@@@@@@@@ Section Break @@@@@@@@@@@@@@@@@@ -->
                                 </xsl:if>
                                 <xsl:if test="@next != 'n'">                                  
<!--                                     <xsl:copy-of select="document($Sto)//body/*"/>-->
                                     <xsl:choose>
                                         <xsl:when test="@libraryFillColor">
                                             <xsl:element name="shade">
                                                 <xsl:attribute name="libraryFillColor" select="@libraryFillColor"/>
                                                 <!--<xsl:copy-of select="document($Sto)//body/*"/>-->
                                                 <xsl:copy-of select="$story//Story[@Self = $Sto]/*"/>
                                             </xsl:element>
                                         </xsl:when>
                                         <xsl:otherwise>
                                             <!--<xsl:copy-of select="document($Sto)//body/*"/>-->
                                             <xsl:copy-of select="$story//Story[@Self = $Sto]/*"/>
                                         </xsl:otherwise>
                                     </xsl:choose>
                                     <!-- @@@@@@@@@@@@@@@@@@ Section Break @@@@@@@@@@@@@@@@@@ -->
                                     <!--<xsl:call-template name="SP1"/>-->
                                     <!-- @@@@@@@@@@@@@@@@@@ Section Break @@@@@@@@@@@@@@@@@@ -->
                                 </xsl:if>
                             </xsl:when>
                         </xsl:choose>
                     </xsl:element>
                 </xsl:element>
             </xsl:when>
             <xsl:otherwise>
                 <!--<xsl:choose>
                     <xsl:when test="@previous = 'n'">
                         <xsl:if test="@next = 'n'">
                             <!-\-<xsl:copy-of select="document($Sto)//body/*"/>-\->
                             <xsl:choose>
                                 <xsl:when test="@libraryFillColor">
                                     <xsl:element name="shade">
                                         <xsl:attribute name="libraryFillColor" select="@libraryFillColor"/>
                                         <!-\-<xsl:copy-of select="document($Sto)//body/*"/>-\->
                                         <xsl:copy-of select="$story//Story[@Self = $St]/*"/>
                                     </xsl:element>
                                 </xsl:when>
                                 <xsl:otherwise>
                                     <!-\-<xsl:copy-of select="document($Sto)//body/*"/>-\->
                                     <xsl:copy-of select="$story//Story[@Self = $St]/*"/>
                                 </xsl:otherwise>
                             </xsl:choose>
                             <!-\- @@@@@@@@@@@@@@@@@@ Section Break @@@@@@@@@@@@@@@@@@ -\->
                             <!-\- <xsl:call-template name="SP1"/>-\->
                             <!-\- @@@@@@@@@@@@@@@@@@ Section Break @@@@@@@@@@@@@@@@@@ -\->
                         </xsl:if>
                         <xsl:if test="@next != 'n'">                                  
                             <!-\-<xsl:copy-of select="document($Sto)//body/*"/>-\->
                             <xsl:choose>
                                 <xsl:when test="@libraryFillColor">
                                     <xsl:element name="shade">
                                         <xsl:attribute name="libraryFillColor" select="@libraryFillColor"/>
                                         <!-\-<xsl:copy-of select="document($Sto)//body/*"/>-\->
                                         <xsl:copy-of select="$story//Story[@Self = $St]/*"/>
                                     </xsl:element>
                                 </xsl:when>
                                 <xsl:otherwise>
                                     <!-\-<xsl:copy-of select="document($Sto)//body/*"/>-\->
                                     <xsl:copy-of select="$story//Story[@Self = $St]/*"/>
                                 </xsl:otherwise>
                             </xsl:choose>
                             <!-\- @@@@@@@@@@@@@@@@@@ Section Break @@@@@@@@@@@@@@@@@@ -\->
                             <!-\-<xsl:call-template name="SP1"/>-\->
                             <!-\- @@@@@@@@@@@@@@@@@@ Section Break @@@@@@@@@@@@@@@@@@ -\->
                         </xsl:if>
                     </xsl:when>
                 </xsl:choose>-->
                 <xsl:element name="div">
                     <xsl:attribute name="data-self" select="$self"/>
                     <!-- Added for boxgroup from spred on 11-03-2025 -->
                     <xsl:attribute name="data-AppliedObjectStyle" select="@AppliedObjectStyle"/>
                     <!-- End -->
                     <xsl:choose>
                         <xsl:when test="@previous = 'n'">
                             <xsl:if test="@next = 'n'">
                                 <xsl:choose>
                                     <xsl:when test="@libraryFillColor">
                                         <xsl:element name="shade">
                                             <xsl:attribute name="libraryFillColor" select="@libraryFillColor"/>
                                             <!--<xsl:copy-of select="document($Sto)//body/*"/>-->                                             
                                             <xsl:copy-of select="$story//Story[@Self = $Sto]/child::*[(@txtFrameId = $self)]"/>
                                             <!--<xsl:copy-of select="document($Sto)//body/child::*[not(contains($TextFrameIds,concat('u',@txtFrameId)))]"/>-->
                                             <xsl:copy-of select="$story//Story[@Self = $Sto]/child::*[not(contains($TextFrameIds,@txtFrameId))]"/>
                                             <xsl:copy-of select="$story//Story[@Self = $Sto]/child::*[not(@txtFrameId)]"/>
                                         </xsl:element>
                                     </xsl:when>
                                     <xsl:otherwise>
                                         <!--<xsl:copy-of select="document($Sto)//body/*"/>-->
                                         <xsl:copy-of select="$story//Story[@Self = $Sto]/child::*[(@txtFrameId = $self)]"/>
                                         <!--<xsl:copy-of select="document($Sto)//body/child::*[not(contains($TextFrameIds,concat('u',@txtFrameId)))]"/>-->
                                         <xsl:copy-of select="$story//Story[@Self = $Sto]/child::*[not(contains($TextFrameIds,@txtFrameId))]"/>
                                         <xsl:copy-of select="$story//Story[@Self = $Sto]/child::*[not(@txtFrameId)]"/>
                                         <!--<xsl:copy-of select="$story//Story[@Self = $Sto]/child::*[not(@txtFrameId = $self)]"/>--><!--commented on 15-nov-18, this is unwanted, just tested and not removed-->
                                         
                                     </xsl:otherwise>
                                 </xsl:choose>
                             </xsl:if>
                             <xsl:if test="@next != 'n'">                                  
                                 <xsl:choose>
                                     <xsl:when test="@libraryFillColor">
                                         <xsl:element name="shade">
                                             <xsl:attribute name="libraryFillColor" select="@libraryFillColor"/>
                                             <!--<xsl:copy-of select="document($Sto)/*"/>-->
                                             <xsl:copy-of select="$story//Story[@Self = $Sto]/child::*[(@txtFrameId = $self)]"/>
                                             <!--<xsl:copy-of select="document($Sto)/child::*[not(contains($TextFrameIds,concat('u',@txtFrameId)))]"/>-->
                                             <xsl:copy-of select="$story//Story[@Self = $Sto]/child::*[not(contains($TextFrameIds,@txtFrameId))]"/>
                                             <xsl:copy-of select="$story//Story[@Self = $Sto]/child::*[not(@txtFrameId)]"/>
                                         </xsl:element>
                                     </xsl:when>
                                     <xsl:otherwise>
                                         <!--<xsl:copy-of select="document($Sto)/*"/>-->
                                         <xsl:copy-of select="$story//Story[@Self = $Sto]/child::*[(@txtFrameId = $self)]"/>
                                         <!--<xsl:copy-of select="$story//Story[@Self = $Sto]/child::*[not(contains($TextFrameIds,concat('u',@txtFrameId)))]"/>-->
                                         <xsl:copy-of select="$story//Story[@Self = $Sto]/child::*[not(contains($TextFrameIds,@txtFrameId))]"/>
                                         <xsl:copy-of select="$story//Story[@Self = $Sto]/child::*[not(@txtFrameId)]"/>
                                     </xsl:otherwise>
                                 </xsl:choose>
                             </xsl:if>
                         </xsl:when>
                         <xsl:otherwise>
                             <xsl:choose>
                                 <xsl:when test="@libraryFillColor">
                                     <xsl:element name="shade">
                                         <xsl:attribute name="libraryFillColor" select="@libraryFillColor"/>
                                         <xsl:copy-of select="$story//Story[@Self = $Sto]/child::*[(@txtFrameId = $self)]"/>
                                     </xsl:element>
                                 </xsl:when>
                                 <xsl:otherwise>
                                     
                                     <xsl:copy-of select="$story//Story[@Self = $Sto]/child::*[(@txtFrameId = $self)]"/>
                                 </xsl:otherwise>
                             </xsl:choose>
                         </xsl:otherwise>
                     </xsl:choose>
                     
                     
                 </xsl:element>
             </xsl:otherwise>
         </xsl:choose>
         <!--creating this new condition for converting the textframe into content control for MedStudy Pupose-->
         
     </xsl:template>
    <!-- Added oval to avoid the unwanted text(oval inside value alone displayed) Azure 9957 on 02-08-2023 -->
    <xsl:template match="Rectangle|Polygon|Oval" name="RF">
        <xsl:choose>
                <xsl:when test="@Image">
               <!-- <xsl:variable name="L" select="round((Txorigin * 12700) cast as xs:decimal)"/>
                <xsl:variable name="T" select="round((Tyorigin * 12700) cast as xs:decimal)"/>
                <xsl:variable name="H" select="round((height * 12700) cast as xs:decimal)"/>
                <xsl:variable name="W" select="round((width * 12700) cast as xs:decimal)"/>-->
                    <!--<xsl:variable name="L" select="format-number((number(Txorigin) * 12700),'#')"/>
                    <xsl:variable name="T" select="format-number((number(Tyorigin) * 12700),'#')"/>-->
                    <xsl:variable name="H" select="format-number((number(height) * 12700),'#')"/>
                    <xsl:variable name="W" select="format-number((number(width) * 12700),'#')"/>
                <!--<xsl:variable name="IMG" select="@Image"/>-->
                    <xsl:variable name="IMG">
                        <xsl:variable name="openParanthesis" select="replace(@Image,'%28','(')"/>
                        <xsl:variable name="closeParanthesis" select="replace($openParanthesis,'%29',')')"/>
                        <xsl:value-of select="$closeParanthesis"/>
                    </xsl:variable>
                    <xsl:variable name="artAvail" select="boolean($artinfo//Arts/art[. = $IMG])"/>
                <xsl:variable name="extension">
                    <xsl:call-template name="substring-after-last">
                        <xsl:with-param name="string" select="$IMG"/>
                        <xsl:with-param name="char" select="'.'"/>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:variable name="Rid" select="@id"/>
                    <xsl:variable name="PN" select="./@ParaInfo"/>
                   
                    <!--<xsl:variable name="TX"> 
                        <xsl:variable name="X">
                            <xsl:if test="contains($PN,'_TX_') and contains($PN,'_Y_')">
                                <xsl:variable name="xVar">
                                    <xsl:value-of select="(substring-before(substring-after($PN, '_TX_'), '_Y_'))"/>
                                </xsl:variable>
                                <xsl:value-of select="format-number($xVar,'#')"/>
<!-\-                                <xsl:value-of select="number(substring-before(substring-after($PN, '_TX_'), '_Y_'))"/>-\->
                            </xsl:if>
                        </xsl:variable>
                        <xsl:value-of select="($X * 20) + 1"/>
                    </xsl:variable>
                    <xsl:variable name="TY">
                        <xsl:variable name="Y">
                            <xsl:if test="contains($PN,'_Y_') and contains($PN,'_W_')">
                                <xsl:variable name="yVar">
                                    <xsl:value-of select="(substring-before(substring-after($PN, '_Y_'), '_W_'))"/>
                                </xsl:variable>
                                <xsl:value-of select="number(format-number($yVar,'#'))"/>
<!-\-                                <xsl:value-of select="number(substring-before(substring-after($PN, '_Y_'), '_W_'))"/>-\->
                            </xsl:if>
                        </xsl:variable>
                        <xsl:value-of select="($Y * 20) + 1"/>
                    </xsl:variable>
                    <xsl:variable name="width">
                        <xsl:variable name="W">
                            <xsl:if test="contains($PN,'_W_') and contains($PN,'_H_')">
                                <xsl:variable name="wVar">
                                    <xsl:value-of select="(substring-before(substring-after($PN, '_W_'), '_H_'))"/>
                                </xsl:variable>
                                <xsl:value-of select="number(format-number($wVar,'#'))"/>
                                <!-\-<xsl:value-of select="number(substring-before(substring-after($PN, '_W_'), '_H_'))"/>-\->
                            </xsl:if>
                        </xsl:variable>
                        <xsl:value-of select="($W * 20)"/>
                    </xsl:variable>
                    <xsl:variable name="height">
                        <xsl:variable name="H">
                            <xsl:if test="contains($PN,'_H_') and contains($PN,'_T_')">
                                <xsl:variable name="hVar">
                                    <xsl:value-of select="(substring-before(substring-after($PN, '_H_'), '_T_'))"/>
                                </xsl:variable>
                                <!-\-<xsl:value-of select="(substring-before(substring-after($PN, '_H_'), '_T_')) cast as xs:decimal"/>-\->
                                <xsl:value-of select="number(format-number($hVar,'#'))"/>
                            </xsl:if>
                        </xsl:variable>
                        <xsl:value-of select="($H * 20)"/>
                    </xsl:variable>
                    -->
                
                <xsl:element name="w:p">
                    <xsl:if test="@ParaInfo">
                        <xsl:attribute name="w:rsidR" select="$PN"/>
                    </xsl:if>
                    <!-- ************** Text Frame ********************* -->
                    <xsl:element name="w:pPr">
                    <!--<xsl:if test="not(string-length(@ParaInfo) = 0)">
                        <xsl:if test="contains(@ParaInfo,'_TX_')">
                            <xsl:element name="w:framePr">
                                <xsl:attribute name="w:w" select="$width"/>
                                <xsl:attribute name="w:h" select="$height"/>
                                <xsl:attribute name="w:wrap" select="'around'"/>
                                <xsl:attribute name="w:vAnchor" select="'page'"/>
                                <xsl:attribute name="w:hAnchor" select="'page'"/>
                                <xsl:attribute name="w:x" select="$TX"/>
                                <xsl:attribute name="w:y" select="$TY"/>
                            </xsl:element> <!-\-temporarily commented for the word creation purpose 8.9.2015-\->
                        </xsl:if>
                    </xsl:if>-->
                    </xsl:element>
                    <!-- ************** Text Frame ********************* -->
                    <xsl:variable name="id">
                        <xsl:value-of select="@id"/>
                        <!--<xsl:number level="any"/>-->
                    </xsl:variable>
                    <xsl:choose>
                        <xsl:when test="@ImageHyperLinkUD">
                            <xsl:element name="w:bookmarkStart">
                                <!--<xsl:attribute name="w:id" select="@ImageHyperLinkUD"/>-->
                                <xsl:attribute name="w:id" select="$id"/>
                                <xsl:attribute name="w:name" select="@ImageHyperLinkUD"/>
                            </xsl:element>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:element name="w:r">    
                        <xsl:element name="w:rPr">
                            <xsl:element name="w:noProof"/>
                        </xsl:element>
                         <xsl:element name="w:drawing">
                        <xsl:element name="wp:inline">
                            <xsl:attribute name="data-pageitem" select="'yes'"/>
                            <xsl:attribute name="distT" select="'0'"/>
                            <xsl:attribute name="distB" select="'0'"/>
                            <xsl:attribute name="distL" select="'0'"/>
                            <xsl:attribute name="distR" select="'0'"/>
                            <xsl:element name="wp:extent">
                                <xsl:attribute name="cx" select="$W"/>
                                <xsl:attribute name="cy" select="$H"/>
                            </xsl:element>
                            <xsl:element name="wp:effectExtent">
                                <xsl:attribute name="l" select="'0'"/>
                                <xsl:attribute name="t" select="'0'"/>
                                <xsl:attribute name="r" select="'0'"/>
                                <xsl:attribute name="b" select="'0'"/>
                            </xsl:element>
                            <!--@@@@@@@@@@ Wrap Top and Bottom @@@@@@@@@@@-->
<!--                            <xsl:element name="wp:wrapTopAndBottom"/>-->
                            <!--@@@@@@@@@@ Wrap Top and Bottom @@@@@@@@@@@-->
                            <xsl:element name="wp:docPr">
                                <!--<xsl:attribute name="id" select="(floor(math:random()*1000) mod 1000) + 1"/>-->
                                <xsl:attribute name="id" >
                                    <xsl:call-template name="create-seed"/>
                                </xsl:attribute>
                                <xsl:attribute name="name" select="$IMG"/>
                                <!--This is for the purpose of external link in the document. Currently applied for only EPS format-->
                                <xsl:if test="$extension = 'eps'">
                                    <xsl:if test="$artAvail">
                                     <xsl:element name="a:hlinkClick">
                                         <xsl:attribute name="r:id" select="concat('rId',$id,'hypl')"/>
                                     </xsl:element>
                                    </xsl:if>
                                </xsl:if>
                            </xsl:element>
                            <xsl:element name="wp:cNvGraphicFramePr">
                                <xsl:element name="a:graphicFrameLocks">    
                                    <xsl:attribute name="noChangeAspect" select="'1'"/>
                                </xsl:element>
                            </xsl:element>
                            <xsl:element name="a:graphic">    
                                <xsl:element name="a:graphicData">    
                                    <xsl:attribute name="uri" select="'http://schemas.openxmlformats.org/drawingml/2006/picture'"/>
                                    <xsl:element name="pic:pic">    
                                        <xsl:element name="pic:nvPicPr">  
                                            <xsl:element name="pic:cNvPr">  
                                                <xsl:attribute name="id" select="'0'"/>
                                                <xsl:attribute name="name" select="$IMG"/>
                                            </xsl:element>
                                            <xsl:element name="pic:cNvPicPr"/>  
                                        </xsl:element>
                                        <xsl:element name="pic:blipFill">  
                                            <xsl:element name="a:blip">
                                                <!--<xsl:attribute name="r:embed" select="concat('rId',$id)"/>-->
                                                <xsl:if test="$artAvail">
                                                <xsl:attribute name="r:embed" select="concat('rId',$Rid)"/>
                                                </xsl:if>
                                                <xsl:if test="not($artAvail)">
                                                    <xsl:attribute name="r:link" select="concat('rId',$Rid)"/>
                                                </xsl:if>
                                                <xsl:element name="a:extLst">
                                                    <xsl:element name="a:ext">
                                                        <xsl:attribute name="uri" select="'{28A0092B-C50C-407E-A947-70E740481C1C}'"/>
                                                        <xsl:element name="a14:useLocalDpi">
                                                            <xsl:attribute name="val" select="'0'"/>
                                                        </xsl:element>
                                                    </xsl:element>
                                                </xsl:element>
                                            </xsl:element>
                                            <xsl:element name="a:stretch">
                                                <xsl:element name="a:fillRect"/>
                                            </xsl:element>
                                        </xsl:element>
                                        <xsl:element name="pic:spPr">
                                            <xsl:element name="a:xfrm">
                                                <xsl:element name="a:off">
                                                    <xsl:attribute name="x" select="'0'"/>
                                                    <xsl:attribute name="y" select="'0'"/>
                                                </xsl:element>
                                                <xsl:element name="a:ext">
                                                    <xsl:attribute name="cx" select="$W"/>
                                                    <xsl:attribute name="cy" select="$H"/>
                                                </xsl:element>
                                            </xsl:element>
                                            <xsl:element name="a:prstGeom">
                                                <xsl:attribute name="prst" select="'rect'"/>
                                                <xsl:element name="a:avLst"/>    
                                            </xsl:element>
                                        </xsl:element>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:element>
                            
                        </xsl:element>
                    </xsl:element>
                
                    </xsl:element>
                   
                    <xsl:choose>
                        <xsl:when test="@ImageHyperLinkUD">
                            <xsl:element name="w:bookmarkEnd">
                                <!--<xsl:attribute name="w:id" select="@ImageHyperLinkUD"/>-->
                                <xsl:attribute name="w:id" select="$id"/>
                            </xsl:element>
                        </xsl:when>
                    </xsl:choose>
                
                </xsl:element>
                    
                </xsl:when>
        </xsl:choose>
        <!-- 02-JULY-19 -->
        <!--<xsl:if test="descendant::TextFrame">
            <xsl:for-each select="TextFrame">
                <xsl:call-template name="TF"/>
            </xsl:for-each>
        </xsl:if>-->
    </xsl:template>
    
    
    <xsl:template name="substring-after-last">
        <xsl:param name="string"/>
        <xsl:param name="char"/>
        
        <xsl:choose>
            <xsl:when test="contains($string, $char)">
                <xsl:call-template name="substring-after-last">
                    <xsl:with-param name="string" select="substring-after($string, $char)"/>
                    <xsl:with-param name="char" select="$char"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$string"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="create-seed">
        <xsl:param name="string" select="generate-id()"/>
        <xsl:param name="preliminary-seed" select="100000"/>
        <xsl:param name="maximum-value" select="10000000000"/>
        
        <xsl:variable name="name-chars"
            select="':ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz-.0123456789'"
        />
        
        <xsl:choose>
            <xsl:when test="string-length($string) != 0">
                <xsl:call-template name="create-seed">
                    <xsl:with-param name="string" select="substring($string,2)"/>
                    <xsl:with-param name="preliminary-seed"
                        select="($preliminary-seed + string-length(
                        
                        substring-before($name-chars,substring($string,1,1))
                        )
                        ) mod $maximum-value"/>
                    <xsl:with-param name="maximum-value" select="$maximum-value"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$preliminary-seed"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
     <xsl:template match="Group" name="G">
         <xsl:element name="Group">
            <xsl:apply-templates/>
         </xsl:element>
     </xsl:template>
 
        <xsl:template match="body/*">
            <xsl:copy-of select="."/>
        </xsl:template>
    
    <xsl:template match="Page">
        <xsl:copy-of select="."/>
    </xsl:template>
    <xsl:template match="Margin">
        <xsl:copy-of select="."/>
    </xsl:template>
</xsl:stylesheet>