<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf"
    exclude-result-prefixes="xs mf idPkg"
    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    xmlns:idPkg="http://schemas.openxmlformats.org/wordprocessingml/2006/main" version="2.0">

    <xsl:output method="xml" indent="yes" name="xml"/>

    <xsl:template match="/">
        <xsl:text disable-output-escaping="yes">&lt;xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
            xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
            xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" version="2.0"&gt;</xsl:text>

        <xsl:text disable-output-escaping="yes">&lt;xsl:output name="xml" indent="yes"/&gt;</xsl:text>

        <xsl:text disable-output-escaping="yes">&lt;xsl:template match="@* | node()"&gt;</xsl:text>
        <xsl:text disable-output-escaping="yes">&lt;xsl:copy&gt;</xsl:text>
        <xsl:text disable-output-escaping="yes">&lt;xsl:apply-templates select="@* | node()"/&gt;</xsl:text>
        <xsl:text disable-output-escaping="yes">&lt;/xsl:copy&gt;</xsl:text>
        <xsl:text disable-output-escaping="yes">&lt;/xsl:template&gt;</xsl:text>

        <xsl:apply-templates select="//Measurement"/>

        <xsl:text disable-output-escaping="yes">&lt;/xsl:stylesheet&gt;</xsl:text>
    </xsl:template>

    <xsl:template match="Measurement">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="text()"/>

    <xsl:template match="TextFrame[(@nxtTxtFrameSameColumn = 'false') and not(@prevTxtFrameSameColumn = 'false')]">
        <xsl:variable name="nxtFrm" select="@next"/>
        <xsl:variable name="id" select="@id"/>
        <xsl:variable name="curnxtTxFrmTxy" select="//TextFrame[@id = $nxtFrm]/@txFrameY"/>
        <xsl:variable name="folowinFirstSibnxtFrmSmCol" select="following-sibling::*[1]/@nxtTxtFrameSameColumn"/>
        <xsl:variable name="folowinFirstSibTxY" select="following-sibling::*[1]/@txFrameY"/>
        <xsl:if test="following-sibling::*[1]">
            <xsl:choose>
                <xsl:when test="$folowinFirstSibnxtFrmSmCol = 'false'">
                    <xsl:variable name="folowinFirstSibnxtFrm" select="following-sibling::*[1]/@next"/>
                    <xsl:variable name="folowinFirstSibnxtFrmY" select="//TextFrame[@id = $folowinFirstSibnxtFrm]/@txFrameY"/>
                    <xsl:if test="number($curnxtTxFrmTxy) &lt; number($folowinFirstSibnxtFrmY)">
                        
                        <xsl:text disable-output-escaping="yes">&lt;xsl:template match="TextFrame[@id = '</xsl:text>
                            <xsl:value-of select="$id"/>
                            <xsl:text disable-output-escaping="yes">']"&gt;</xsl:text>
                            <xsl:text disable-output-escaping="yes">&lt;xsl:copy&gt;</xsl:text>
                            <xsl:text disable-output-escaping="yes">&lt;xsl:apply-templates select="@*|node()"/&gt;</xsl:text>
                            <xsl:text disable-output-escaping="yes">&lt;/xsl:copy&gt;</xsl:text>
                            <xsl:text disable-output-escaping="yes">&lt;xsl:copy-of select="//TextFrame[@id ='</xsl:text>
                            <xsl:value-of select="$nxtFrm"/>
                            <xsl:text disable-output-escaping="yes">']"/&gt;</xsl:text>
                            <xsl:for-each select="//TextFrame[@id = $nxtFrm][(@nxtTxtFrameSameColumn = 'false')]">
                                <xsl:call-template name="copy"/>
                            </xsl:for-each>
                        <xsl:text disable-output-escaping="yes">&lt;/xsl:template&gt;</xsl:text>
                        
                        <xsl:text disable-output-escaping="yes">&lt;xsl:template match="TextFrame[@id = '</xsl:text>
                            <xsl:value-of select="$nxtFrm"/>
                            <!--11/11/2020 below added by prakash s for self close template     -->
                            <!-- <xsl:text disable-output-escaping="yes">']"/&gt;</xsl:text>-->
                        <xsl:text disable-output-escaping="yes">']"&gt;</xsl:text>
                        
                        <!-- 03-09-2025 below for-each commented for wrong fix before  -->
                       <!-- <xsl:for-each select="//TextFrame[@id = $nxtFrm][(@nxtTxtFrameSameColumn = 'false')]">
                            <!-\- 18-07-2023 client :  WTRowman, bookname : Hoare_ East & Southeast
                                Asia, file name : 15-Laos  below commented by prakash s for template is in template  -\->
<!-\-                            <xsl:call-template name="template"/>-\->
                            <xsl:call-template name="copy"/>
                        </xsl:for-each>-->
                        
                        <!--11/11/2020 below added by prakash s for self close template     -->
                        <xsl:text disable-output-escaping="yes">&lt;/xsl:template&gt;</xsl:text>
                        
                        <xsl:for-each select="//TextFrame[@id = $nxtFrm][(@nxtTxtFrameSameColumn = 'false')]">
                            <xsl:call-template name="template"/>
                        </xsl:for-each> 
                    </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:if test="number($curnxtTxFrmTxy) &lt; number($folowinFirstSibTxY)">
                        
                        <xsl:text disable-output-escaping="yes">&lt;xsl:template match="TextFrame[@id = '</xsl:text> 
                             <xsl:value-of select="$id"/>
                             <xsl:text disable-output-escaping="yes">']"&gt;</xsl:text>
                        
                             <xsl:text disable-output-escaping="yes">&lt;xsl:copy&gt;</xsl:text>
                             <xsl:text disable-output-escaping="yes">&lt;xsl:apply-templates select="@*|node()"/&gt;</xsl:text>
                             <xsl:text disable-output-escaping="yes">&lt;/xsl:copy&gt;</xsl:text>
                        
                             <xsl:text disable-output-escaping="yes">&lt;xsl:copy-of select="//TextFrame[@id ='</xsl:text>
                             <xsl:value-of select="$nxtFrm"/>
                             <xsl:text disable-output-escaping="yes">']"/&gt;</xsl:text>
                        
                             <xsl:for-each select="//TextFrame[@id = $nxtFrm][(@nxtTxtFrameSameColumn = 'false')]">
                                 <xsl:call-template name="copy"/>
                             </xsl:for-each>
                        
                        <xsl:text disable-output-escaping="yes">&lt;/xsl:template&gt;</xsl:text>
                        
                        <xsl:text disable-output-escaping="yes">&lt;xsl:template match="TextFrame[@id = '</xsl:text> 
                            <xsl:value-of select="$nxtFrm"/>
                            <!--<xsl:text disable-output-escaping="yes">']"/&gt;</xsl:text>-->
                            <!--11/11/2020 below added by prakash s for self close template     -->
                            <xsl:text disable-output-escaping="yes">']"&gt;</xsl:text>
                          <!--  03-09-2025   for xslt_execution_error due to sorting by column value for textframe-->
                          <!--  <xsl:for-each select="//TextFrame[@id = $nxtFrm][(@nxtTxtFrameSameColumn = 'false')]">
                                <xsl:call-template name="copy"/>
                            </xsl:for-each>-->
                        
                        <!--11/11/2020 below added by prakash s for self close template     -->
                        <xsl:text disable-output-escaping="yes">&lt;/xsl:template&gt;</xsl:text>
                        
                        <xsl:for-each select="//TextFrame[@id = $nxtFrm][(@nxtTxtFrameSameColumn = 'false')]">
                            <xsl:call-template name="template"/>
                        </xsl:for-each>
                        
                    </xsl:if>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>

    <xsl:template name="copy">
        <xsl:variable name="nxtFrm" select="@next"/>
        <xsl:variable name="id" select="@id"/>
        <xsl:variable name="curnxtTxFrm" select="//TextFrame[@id = $nxtFrm]"/>
        <xsl:variable name="folowinFirstSibFrm" select="following-sibling::*[1]"/>
        <xsl:variable name="curnxtTxFrmTxy" select="//TextFrame[@id = $nxtFrm]/@txFrameY"/>
        <xsl:variable name="folowinFirstSibnxtFrmSmCol"
            select="following-sibling::*[1]/@nxtTxtFrameSameColumn"/>
        <xsl:variable name="folowinFirstSibTxY" select="following-sibling::*[1]/@txFrameY"/>

        <xsl:if test="following-sibling::*[1]">
            <xsl:choose>
                <xsl:when test="($folowinFirstSibnxtFrmSmCol = 'false')">

                    <xsl:variable name="folowinFirstSibnxtFrm"
                        select="following-sibling::*[1]/@next"/>
                    <xsl:variable name="folowinFirstSibnxtFrmY"
                        select="//TextFrame[@id = $folowinFirstSibnxtFrm]/@txFrameY"/>
                    <xsl:if test="number($curnxtTxFrmTxy) &lt; number($folowinFirstSibnxtFrmY)">
                        <xsl:text disable-output-escaping="yes">&lt;xsl:copy-of select="//TextFrame[@id ='</xsl:text>
                        <xsl:value-of select="$nxtFrm"/>
                        <xsl:text disable-output-escaping="yes">']"/&gt;</xsl:text>
                        <xsl:for-each
                            select="//TextFrame[@id = $nxtFrm][(@nxtTxtFrameSameColumn = 'false')]">
                            <xsl:call-template name="copy"/>
                        </xsl:for-each>
                    </xsl:if>
                    <!--  created this condition for the scenario if the following first sibling of current txt frame and the next textframe of current txt frame is same -->
                    <xsl:if
                        test="not(number($curnxtTxFrmTxy) &lt; number($folowinFirstSibnxtFrmY)) and $curnxtTxFrm = $folowinFirstSibFrm">
                        <xsl:text disable-output-escaping="yes">&lt;xsl:copy-of select="//TextFrame[@id ='</xsl:text>
                        <xsl:value-of select="$nxtFrm"/>
                        <xsl:text disable-output-escaping="yes">']"/&gt;</xsl:text>
                        <xsl:for-each
                            select="//TextFrame[@id = $nxtFrm][(@nxtTxtFrameSameColumn = 'false')]">
                            <xsl:call-template name="copy"/>
                        </xsl:for-each>
                    </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:if test="number($curnxtTxFrmTxy) &lt; number($folowinFirstSibTxY)">
                        <xsl:text disable-output-escaping="yes">&lt;xsl:copy-of select="//TextFrame[@id ='</xsl:text>
                        <xsl:value-of select="$nxtFrm"/>
                        <xsl:text disable-output-escaping="yes">']"/&gt;</xsl:text>
                        <xsl:for-each
                            select="//TextFrame[@id = $nxtFrm][(@nxtTxtFrameSameColumn = 'false')]">
                            <xsl:call-template name="copy"/>
                        </xsl:for-each>
                    </xsl:if>
                    <!--  created this condition for the scenario if the following first sibling of current txt frame and the next textframe of current txt frame is same -->
                    <xsl:if
                        test="not(number($curnxtTxFrmTxy) &lt; number($folowinFirstSibTxY)) and $curnxtTxFrm = $folowinFirstSibFrm">
                        <xsl:text disable-output-escaping="yes">&lt;xsl:copy-of select="//TextFrame[@id ='</xsl:text>
                        <xsl:value-of select="$nxtFrm"/>
                        <xsl:text disable-output-escaping="yes">']"/&gt;</xsl:text>
                        <xsl:for-each
                            select="//TextFrame[@id = $nxtFrm][(@nxtTxtFrameSameColumn = 'false')]">
                            <xsl:call-template name="copy"/>
                        </xsl:for-each>
                    </xsl:if>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>

    <xsl:template name="template">
        <xsl:variable name="nxtFrm" select="@next"/>
        <xsl:variable name="id" select="@id"/>
        <xsl:variable name="curnxtTxFrm" select="//TextFrame[@id = $nxtFrm]"/>
        <xsl:variable name="folowinFirstSibFrm" select="following-sibling::*[1]"/>
        <xsl:variable name="curnxtTxFrmTxy" select="//TextFrame[@id = $nxtFrm]/@txFrameY"/>
        <xsl:variable name="folowinFirstSibnxtFrmSmCol"
            select="following-sibling::*[1]/@nxtTxtFrameSameColumn"/>
        <xsl:variable name="folowinFirstSibTxY" select="following-sibling::*[1]/@txFrameY"/>
        <xsl:if test="following-sibling::*[1]">
            <xsl:choose>
                <xsl:when test="$folowinFirstSibnxtFrmSmCol = 'false'">
                    <xsl:variable name="folowinFirstSibnxtFrm"
                        select="following-sibling::*[1]/@next"/>
                    <xsl:variable name="folowinFirstSibnxtFrmY"
                        select="//TextFrame[@id = $folowinFirstSibnxtFrm]/@txFrameY"/>
                    <xsl:if test="number($curnxtTxFrmTxy) &lt; number($folowinFirstSibnxtFrmY)">
                        <xsl:text disable-output-escaping="yes">&lt;xsl:template match="TextFrame[@id = '</xsl:text>
                        <xsl:value-of select="$nxtFrm"/>
                        <xsl:text disable-output-escaping="yes">']"/&gt;</xsl:text>
                        <xsl:for-each select="//TextFrame[@id = $nxtFrm][(@nxtTxtFrameSameColumn = 'false')]">
                            <xsl:call-template name="template"/>
                        </xsl:for-each>
                    </xsl:if>
                    <!--  created this condition for the scenario if the following first sibling of current txt frame and the next textframe of current txt frame is same -->
                    <xsl:if
                        test="not(number($curnxtTxFrmTxy) &lt; number($folowinFirstSibnxtFrmY)) and $curnxtTxFrm = $folowinFirstSibFrm">
                        <xsl:text disable-output-escaping="yes">&lt;xsl:copy-of select="//TextFrame[@id ='</xsl:text>
                        <xsl:value-of select="$nxtFrm"/>
                        <xsl:text disable-output-escaping="yes">']"/&gt;</xsl:text>
                        <xsl:for-each
                            select="//TextFrame[@id = $nxtFrm][(@nxtTxtFrameSameColumn = 'false')]">
                            <xsl:call-template name="template"/>
                        </xsl:for-each>
                    </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:if test="number($curnxtTxFrmTxy) &lt; number($folowinFirstSibTxY)">
                        <xsl:text disable-output-escaping="yes">&lt;xsl:template match="TextFrame[@id = '</xsl:text>
                        <xsl:value-of select="$nxtFrm"/>
                        <xsl:text disable-output-escaping="yes">']"/&gt;</xsl:text>
                        <xsl:for-each select="//TextFrame[@id = $nxtFrm][(@nxtTxtFrameSameColumn = 'false')]">
                            <xsl:call-template name="template"/>
                        </xsl:for-each>
                    </xsl:if>
                    <!--  created this condition for the scenario if the following first sibling of current txt frame and the next textframe of current txt frame is same -->
                    <xsl:if test="not(number($curnxtTxFrmTxy) &lt; number($folowinFirstSibTxY)) and $curnxtTxFrm = $folowinFirstSibFrm">
                        <xsl:text disable-output-escaping="yes">&lt;xsl:copy-of select="//TextFrame[@id ='</xsl:text>
                        <xsl:value-of select="$nxtFrm"/>
                        <xsl:text disable-output-escaping="yes">']"/&gt;</xsl:text>
                        <xsl:for-each select="//TextFrame[@id = $nxtFrm][(@nxtTxtFrameSameColumn = 'false')]">
                            <xsl:call-template name="template"/>
                        </xsl:for-each>
                    </xsl:if>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
