<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf" exclude-result-prefixes="xs mf" 
	xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
	xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"
	xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" xmlns:v="urn:schemas-microsoft-com:vml"
	xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing" xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" 
	xmlns:w10="urn:schemas-microsoft-com:office:word" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"  xmlns:idPkg="http://ns.adobe.com/AdobeInDesign/idml/1.0/packaging"
	xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml" xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup" 
	xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk" xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml" xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main"
	xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape"  version="2.0">
    <xsl:output method="xml"/>
	<xsl:template match="@* | node()">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()"/>
		</xsl:copy>
	</xsl:template>
    <xsl:template match="body">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
<!--    <xsl:template match="document/child::*">-->
    <xsl:template match="*[@rsidR]">
        <!--<xsl:for-each select="child::*">-->
        <xsl:variable name="Para">
            <xsl:choose>
                <xsl:when test="contains(lower-case(./@rsidR),'story')">
                    <!--<xsl:value-of select="substring-before(lower-case(./@rsidR),'story')"/>-->
                    <xsl:analyze-string select="./@rsidR" regex="(^\d+)([\W\w]*$)">
                        <xsl:matching-substring>
                            <xsl:if test="regex-group(1)">
                                    <xsl:value-of select="regex-group(1)"/>
                            </xsl:if>
                        </xsl:matching-substring>
                    </xsl:analyze-string>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
            <xsl:variable name="txtFrameId">
                <xsl:choose>
                    <xsl:when test="not(contains(substring-after(lower-case(./@rsidR),'_txtid_'),'_'))">
                        <xsl:choose>
                            <xsl:when test="contains(lower-case(./@rsidR),'_txtid_')">
                                <xsl:value-of select="substring-after(lower-case(./@rsidR),'_txtid_')"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:choose>
                            <xsl:when test="contains(lower-case(./@rsidR),'_txtid_')">
                                <xsl:value-of select="substring-before(substring-after(lower-case(./@rsidR),'_txtid_'),'_Y')"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:variable name="PageValue">
                <xsl:variable name="Page">
                    <xsl:choose>
                        <xsl:when test="contains(lower-case(./@rsidR),'_p_')">
                            <xsl:value-of select="substring-before(substring-after(lower-case(./@rsidR),'_p_'),'_txtid_')"/>
                        </xsl:when>
                        <xsl:when test="contains(lower-case(./@rsidR),'_p_') and contains(lower-case(./@rsidR),'_x_')">
                            <xsl:value-of select="substring-before(substring-after(lower-case(./@rsidR),'_p_'),'_x_')"/>
                        </xsl:when>
                        <xsl:when test="contains(lower-case(./@rsidR),'_p_') and contains(lower-case(./@rsidR),'_tx_')">
                            <xsl:value-of select="substring-before(substring-after(lower-case(./@rsidR),'_p_'),'_tx_')"/>
                        </xsl:when>
                        <xsl:when test="contains(lower-case(./@rsidR),'_p_') and contains(lower-case(./@rsidR),'_ix_')">
                            <xsl:value-of select="substring-before(substring-after(lower-case(./@rsidR),'_p_'),'_ix_')"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:variable>            
                        <xsl:value-of select="$Page"/>
            </xsl:variable>
            <xsl:variable name="XValue">
                <xsl:choose>
                    <xsl:when test="contains(lower-case(./@rsidR),'_X_')">
                        <xsl:value-of select="substring-before(substring-after(lower-case(./@rsidR),'_X_'),'_W_')"/>
                    </xsl:when>
                    <xsl:when test="contains(lower-case(./@rsidR),'_x_') and contains(lower-case(./@rsidR),'_y_')">
                        <xsl:value-of select="substring-before(substring-after(lower-case(./@rsidR),'_x_'),'_y_')"/>
                    </xsl:when>
                    <xsl:when test="contains(lower-case(./@rsidR),'_tx_') and contains(lower-case(./@rsidR),'_ty_')">
                        <xsl:value-of select="substring-before(substring-after(lower-case(./@rsidR),'_tx_'),'_ty_')"/>
                    </xsl:when>
                    <xsl:when test="contains(lower-case(./@rsidR),'_ix_') and contains(lower-case(./@rsidR),'_iy_')">
                        <xsl:value-of select="substring-before(substring-after(lower-case(./@rsidR),'_ix_'),'_iy_')"/>
                    </xsl:when>
                    <xsl:otherwise>
                        
                            <xsl:choose>
                                <xsl:when test="contains(lower-case(./@rsidR),'_x_')">
                                    <xsl:value-of select="substring-before(substring-after(lower-case(./@rsidR),'_x_'),'_')"/>
                                </xsl:when>
                                <xsl:when test="contains(lower-case(./@rsidR),'_tx_')">
                                    <xsl:value-of select="substring-before(substring-after(lower-case(./@rsidR),'_tx_'),'_')"/>
                                </xsl:when>
                                <xsl:when test="contains(lower-case(./@rsidR),'_ix_')">
                                    <xsl:value-of select="substring-before(substring-after(lower-case(./@rsidR),'_ix_'),'_')"/>
                                </xsl:when>
                            </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
       
            <xsl:variable name="YValue">
                <xsl:variable name="endCharacter">
                    <xsl:call-template name="substring-before-last">
                        <xsl:with-param name="list" select="./@rsidR"/>
                        <xsl:with-param name="delimiter" select="'_'"/>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:choose>
<!--                    <xsl:when test="ends-with($endCharacter,'_y_')">-->
                    <xsl:when test="not(contains(substring-after(lower-case(./@rsidR),'_y_'),'_'))">
                        <xsl:choose>
                            <xsl:when test="contains(lower-case(./@rsidR),'_y_')">
                                <xsl:value-of select="substring-after(lower-case(./@rsidR),'_y_')"/>
                            </xsl:when>
                            <xsl:when test="contains(lower-case(./@rsidR),'_ty_')">
                                <xsl:value-of select="substring-after(lower-case(./@rsidR),'_ty_')"/>
                            </xsl:when>
                            <xsl:when test="contains(lower-case(./@rsidR),'_iy_')">
                                <xsl:value-of select="substring-after(lower-case(./@rsidR),'_iy_')"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:choose>
                            <xsl:when test="contains(lower-case(./@rsidR),'_y_')">
                                <xsl:value-of select="substring-before(substring-after(lower-case(./@rsidR),'_y_'),'_')"/>
                            </xsl:when>
                            <xsl:when test="contains(lower-case(./@rsidR),'_ty_')">
                                <xsl:value-of select="substring-before(substring-after(lower-case(./@rsidR),'_ty_'),'_')"/>
                            </xsl:when>
                            <xsl:when test="contains(lower-case(./@rsidR),'_iy_')">
                                <xsl:value-of select="substring-before(substring-after(lower-case(./@rsidR),'_iy_'),'_')"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>
                
            </xsl:variable>
            <xsl:variable name="ColumnValue">
                <xsl:variable name="endCharacter">
                    <xsl:call-template name="substring-before-last">
                        <xsl:with-param name="list" select="./@rsidR"/>
                        <xsl:with-param name="delimiter" select="'_'"/>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:choose>
                    <!--                    <xsl:when test="ends-with($endCharacter,'_y_')">-->
                    <xsl:when test="not(contains(substring-after(lower-case(./@rsidR),'_c_'),'_'))">
                        <xsl:choose>
                            <xsl:when test="contains(lower-case(./@rsidR),'_c_')">
                                <xsl:value-of select="substring-after(lower-case(./@rsidR),'_c_')"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:choose>
                            <xsl:when test="contains(lower-case(./@rsidR),'_c_')">
                                <xsl:value-of select="substring-before(substring-after(lower-case(./@rsidR),'_c_'),'_')"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:variable name="storyValue">
                <xsl:choose>
                    <!--                    <xsl:when test="ends-with($endCharacter,'_y_')">-->
                    <xsl:when test="not(contains(substring-after(lower-case(./@rsidR),'_story'),'_'))">
                        <xsl:choose>
                            <xsl:when test="contains(lower-case(./@rsidR),'_story')">
                                <xsl:value-of select="substring-after(lower-case(./@rsidR),'_story')"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:choose>
                            <xsl:when test="contains(lower-case(./@rsidR),'_story')">
                                <xsl:value-of select="substring-before(substring-after(lower-case(./@rsidR),'_story'),'_')"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:variable name="Txorigin">
                <xsl:if test="./@Txorigin">
                    <xsl:value-of select="./@Txorigin"/>
                </xsl:if>
            </xsl:variable>
            <xsl:variable name="Tyorigin">
                <xsl:if test="./@Tyorigin">
                    <xsl:value-of select="./@Tyorigin"/>
                </xsl:if>
            </xsl:variable>
            <xsl:variable name="Height">
                <xsl:if test="./@Height">
                    <xsl:value-of select="./@Height"/>
                </xsl:if>
            </xsl:variable>
            <xsl:variable name="Width">
                <xsl:if test="./@Width">
                    <xsl:value-of select="./@Width"/>
                </xsl:if>
            </xsl:variable>
            <xsl:copy>
            	   <xsl:if test="string-length($Para) gt 0">
                    <xsl:attribute name="Para" select="$Para"/>
                </xsl:if>
                <xsl:if test="string-length($PageValue) gt 0">
              <!--      <xsl:choose>
                        <xsl:when test="matches($PageValue,'^\d[\W][^\n]+$')">
                            <xsl:variable name="add" select="1"/>
                            <xsl:for-each select="tokenize($PageValue,'\W')">
                                <xsl:variable name="num">
                                    <xsl:value-of select="position()"/>
                                </xsl:variable>
                                <xsl:attribute name="{concat('PageValue',$num)}" select="."/>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:otherwise>-->
                            <xsl:attribute name="PageValue" select="$PageValue"/>
                       <!-- </xsl:otherwise>
                    </xsl:choose>-->
                </xsl:if>
                <xsl:if test="string-length($XValue) &gt; 0">
                    <xsl:attribute name="XValue" select="$XValue"/>
                </xsl:if>
                <xsl:if test="string-length($YValue) &gt; 0">
                    <xsl:attribute name="YValue" select="$YValue"/>
                </xsl:if>
                <xsl:if test="string-length($ColumnValue) &gt; 0">
                    <xsl:attribute name="ColumnValue" select="$ColumnValue"/>
                </xsl:if>
                <xsl:if test="string-length($storyValue) &gt; 0">
                    <xsl:attribute name="StoryValue" select="$storyValue"/>
                </xsl:if>
                <xsl:if test="string-length($Txorigin) &gt; 0">
                    <xsl:attribute name="Txorigin" select="$Txorigin"/>
                </xsl:if>
                <xsl:if test="string-length($Tyorigin) &gt; 0">
                    <xsl:attribute name="Tyorigin" select="$Tyorigin"/>
                </xsl:if>
                <xsl:if test="string-length($Height) &gt; 0">
                    <xsl:attribute name="Height" select="$Height"/>
                </xsl:if>
                <xsl:if test="string-length($Width) &gt; 0">
                    <xsl:attribute name="Width" select="$Width"/>
                </xsl:if>
                <xsl:if test="string-length(@data-splitpara) &gt; 0">
            		<xsl:attribute name="data-splitpara" select="@data-splitpara"/>
            	</xsl:if>
                <xsl:apply-templates select="@*|node()"/>
            </xsl:copy>
        <!--</xsl:for-each>-->
    </xsl:template>
    
   
    <!-- Function for looping -->
    <xsl:template  name="for-loop">        
        <xsl:param name="i"/>
        <xsl:param name="j"/>
        <xsl:param name="tod1e12"/>
        <xsl:param name="stepd1e12"/>
        <xsl:choose>
            <xsl:when test="$i = $tod1e12"> 
                <xsl:value-of select="$j * 20"/>
            </xsl:when>
            <!--  <xsl:otherwise>
                <xsl:value-of select="$j"/>
                <xsl:text> + </xsl:text>
            </xsl:otherwise>-->
        </xsl:choose>
        <xsl:if test="$i+$stepd1e12 &lt;= $tod1e12">
            <xsl:call-template name="for-loop">
                <xsl:with-param name="i" select="$i + $stepd1e12"/>
                <xsl:with-param name="j" select="$j + parent::Table/Column[$i + 1]/@SingleColumnWidth"/>
                <xsl:with-param name="tod1e12" select="$tod1e12"/>
                <xsl:with-param name="stepd1e12" select="$stepd1e12"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    <!-- Function for looping -->
    
    <!--############################################################-->
    <!--## Template to determine Substring before last occurence  ##-->
    <!--## of a specific delemiter                                ##-->
    <!--############################################################-->
    <xsl:template name="substring-before-last">
        <!--passed template parameter -->
        <xsl:param name="list"/>
        <xsl:param name="delimiter"/>
        <xsl:choose>
            <xsl:when test="contains($list, $delimiter)">
                <!-- get everything in front of the first delimiter -->
                <xsl:value-of select="substring-before($list,$delimiter)"/>
                <xsl:choose>
                    <xsl:when test="contains(substring-after($list,$delimiter),$delimiter)">
                        <xsl:value-of select="$delimiter"/>
                    </xsl:when>
                </xsl:choose>
                <xsl:call-template name="substring-before-last">
                    <!-- store anything left in another variable -->
                    <xsl:with-param name="list" select="substring-after($list,$delimiter)"/>
                    <xsl:with-param name="delimiter" select="$delimiter"/>
                </xsl:call-template>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
  </xsl:stylesheet>