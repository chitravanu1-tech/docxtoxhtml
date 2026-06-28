<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf" exclude-result-prefixes="xs mf" 
    xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
    xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"
    xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" xmlns:v="urn:schemas-microsoft-com:vml"
    xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing" xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" 
    xmlns:w10="urn:schemas-microsoft-com:office:word" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml" xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup" 
    xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk" xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml"
    xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape"  xmlns:idPkg="http://ns.adobe.com/AdobeInDesign/idml/1.0/packaging" version="2.0">
    
    <xsl:strip-space elements="*"/>
    <xsl:preserve-space elements="Content"/>
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="CharacterStyleRange">
        <xsl:choose>
            <xsl:when test="parent::Change[1]">
                <xsl:element name="Change">
                    <xsl:if test="parent::Change[1]/@*">
                        <xsl:for-each select="parent::Change[1]/@*">
                            <xsl:attribute name="{name(.)}" select="."/>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:copy>
                        <xsl:apply-templates select="@*|node()"/>
                    </xsl:copy>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="Change">
       <!-- <xsl:if test="not(ancestor::Change)">
            <xsl:choose>
                <xsl:when test="child::CharacterStyleRange">
                    <xsl:apply-templates/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:copy>
                        <xsl:apply-templates select="@*|node()"/>
                    </xsl:copy>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>-->
        <xsl:choose>
          <xsl:when test="not(ancestor::Change)">
              <xsl:choose>
                  <xsl:when test="child::CharacterStyleRange">
                      <xsl:apply-templates/>
                  </xsl:when>
                  <xsl:otherwise>
                      <xsl:copy>
                          <xsl:apply-templates select="@*|node()"/>
                      </xsl:copy>
                  </xsl:otherwise>
              </xsl:choose>
          </xsl:when>
            <xsl:when test="ancestor::Change">
                <xsl:if test="ancestor::Footnote">
                    <!--<xsl:if test="ancestor::Change/position() &gt; ancestor::Footnote/position()">-->
                        <xsl:choose>
                            <xsl:when test="child::CharacterStyleRange">
                                <xsl:apply-templates/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:copy>
                                    <xsl:apply-templates select="@*|node()"/>
                                </xsl:copy>
                            </xsl:otherwise>
                        </xsl:choose>
                    <!--</xsl:if>-->
                </xsl:if>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    
    <!--<xsl:template match="Content">
        <xsl:choose>
            <xsl:when test="ancestor::Note">
                <xsl:copy>
                    <xsl:apply-templates select="@* | node()"/>
                </xsl:copy>
            </xsl:when>
            <xsl:when
                test="(ancestor::Change[1]/@ChangeType = 'InsertedText') or (ancestor::Change[1]/@ChangeType = 'MovedText')">
                <xsl:copy>
                    <xsl:apply-templates select="@* | node()"/>
                </xsl:copy>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="str.tokenize.keep.delimiters" xml:space="default">
                    <xsl:with-param name="string" select="."/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="str.tokenize.keep.delimiters">
        <xsl:param name="string" select="''"/>
        <xsl:param name="delimiters" select="'&#8232;'"/>
        <xsl:choose>
            <xsl:when test="not($string)"/>
            <xsl:when test="not($delimiters)">
                <xsl:call-template name="str.tokenize.keep.delimiters-characters">
                    <xsl:with-param name="string" select="$string"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="str.tokenize.keep.delimiters-delimiters">
                    <xsl:with-param name="string" select="$string"/>
                    <xsl:with-param name="delimiters" select="$delimiters"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="str.tokenize.keep.delimiters-characters">
        <xsl:param name="string"/>
        <xsl:if test="$string">
            <xsl:value-of select="substring($string, 1, 1)"/>
            <xsl:call-template name="str.tokenize.keep.delimiters-characters">
                <xsl:with-param name="string" select="substring($string, 2)"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <xsl:template name="str.tokenize.keep.delimiters-delimiters">
        <xsl:param name="string"/>
        <xsl:param name="delimiters"/>
        <xsl:variable name="delimiter" select="substring($delimiters, 1, 1)"/>
        <xsl:choose>
            <xsl:when test="not($delimiter)">
                <xsl:if test="processing-instruction() or not($string ='')">
                    <xsl:element name="CharacterStyleRange">
                       <!-\- <xsl:attribute name="WordNumber">
                            <xsl:choose>
                                <xsl:when test="processing-instruction()">
                                    <xsl:value-of select="'diff'"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="'Word'"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>-\->
                        <xsl:if test="ancestor::CharacterStyleRange/@*">
                            <xsl:for-each select="ancestor::CharacterStyleRange[1]/@*">
                                <xsl:attribute name="{name(.)}" select="."/>
                            </xsl:for-each>
                        </xsl:if>
                        <xsl:for-each select="ancestor::CharacterStyleRange[1]/*">
                            <xsl:if test="self::Properties">
                                <xsl:copy-of select="."/>
                            </xsl:if>
                            <xsl:if test="self::FormattingChange">
                                <xsl:copy-of select="."/>
                            </xsl:if>
                        </xsl:for-each>
                        <xsl:element name="Content">
                            <xsl:choose>
                                <xsl:when test="processing-instruction()">
                                    <xsl:copy-of select="processing-instruction()"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$string"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:element>
                    </xsl:element>
                </xsl:if>
            </xsl:when>
            <xsl:when test="contains($string, $delimiter)">
                <xsl:if test="not(starts-with($string, $delimiter))">
                    <xsl:call-template name="str.tokenize.keep.delimiters-delimiters">
                        <xsl:with-param name="string" select="substring-before($string, $delimiter)"/>
                        <xsl:with-param name="delimiters" select="substring($delimiters, 2)"/>
                    </xsl:call-template>
                </xsl:if>
                <!-\- output each delimiter -\->
                <xsl:element name="CharacterStyleRange">
                   
                    <xsl:if test="ancestor::CharacterStyleRange[1]/@*">
                        <xsl:for-each select="ancestor::CharacterStyleRange[1]/@*">
                            <xsl:attribute name="{name(.)}" select="."/>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:attribute name="WordNumber" select="'Space'"/>
                    <xsl:for-each select="ancestor::CharacterStyleRange[1]/*">
                        <xsl:if test="self::Properties">
                            <xsl:copy-of select="."/>
                        </xsl:if>
                        <xsl:if test="self::FormattingChange">
                            <xsl:copy-of select="."/>
                        </xsl:if>
                    </xsl:for-each>
                    <xsl:element name="Content">
                        <xsl:value-of select="$delimiter"/>
                    </xsl:element>
                </xsl:element>
                <xsl:if test="not(substring-after($string, $delimiter) = '')">
                    <xsl:call-template name="str.tokenize.keep.delimiters-delimiters">
                        <xsl:with-param name="string" select="substring-after($string, $delimiter)"/>
                        <xsl:with-param name="delimiters" select="$delimiters"/>
                    </xsl:call-template>
                </xsl:if>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="str.tokenize.keep.delimiters-delimiters">
                    <xsl:with-param name="string" select="$string"/>
                    <xsl:with-param name="delimiters" select="substring($delimiters, 2)"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="CharacterStyleRange/Properties"/>-->
    <xsl:template match="//Note[not(ancestor::CharacterStyleRange)]">
        <xsl:if test="parent::Change[@ChangeType] and (parent::Change/child::CharacterStyleRange)">
            <xsl:text disable-output-escaping="yes">&lt;Change ChangeType="</xsl:text><xsl:value-of select="parent::Change/@ChangeType"/><xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
        </xsl:if>
        <CharacterStyleRange AppliedCharacterStyle="CharacterStyle/$ID/[No character style]" WordNumber="Note">
            <xsl:copy>
                <xsl:apply-templates select="@*|node()"/>
            </xsl:copy>
        </CharacterStyleRange>
        <xsl:if test="parent::Change[@ChangeType] and (parent::Change/child::CharacterStyleRange)">
            <xsl:text disable-output-escaping="yes">&lt;/Change&gt;</xsl:text>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>