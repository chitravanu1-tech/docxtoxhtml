<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf"
    exclude-result-prefixes="xs mf"
    xmlns:idPkg="http://ns.adobe.com/AdobeInDesign/idml/1.0/packaging" version="2.0">

    <xsl:strip-space elements="*"/>
    <xsl:preserve-space elements="Content"/>
    <xsl:param name="proceesingBkmark"/>
    
    
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

 
    <xsl:template match="CharacterStyleRange">
        <xsl:variable name="parentPara" select="ancestor::ParagraphStyleRange[1]/@ParaNumber"/>
        <xsl:variable name="curChar" select="self::CharacterStyleRange"/>
        <xsl:choose>
            <xsl:when test="string-length($proceesingBkmark) > 0">
                <xsl:choose>
                    <xsl:when test="not($proceesingBkmark = $parentPara)">
                        <xsl:choose>
                            <xsl:when test="ancestor::Note">
                                <xsl:copy>
                                    <xsl:attribute name="WordNumber" select="'Note'"/>
                                    <xsl:attribute name="NoteNo">
                                        <xsl:number level="any" select="ancestor::Note"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="@* | node()"/>
                                </xsl:copy>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:copy>
                                    <xsl:apply-templates select="@*|node()"/>
                                </xsl:copy>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:choose>
                            <xsl:when test="ancestor::Note">
                                <xsl:copy>
                                    <xsl:attribute name="WordNumber" select="'Note'"/>
                                    <xsl:attribute name="NoteNo">
                                        <xsl:number level="any" select="ancestor::Note"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="@* | node()"/>
                                </xsl:copy>
                            </xsl:when>
                            <xsl:when
                                test="(ancestor::Change[1]/@ChangeType = 'InsertedText') or (ancestor::Change[1]/@ChangeType = 'MovedText')">
                                <xsl:copy>
                                    <xsl:attribute name="WordNumber" select="'Change'"/>
                                    <xsl:apply-templates select="@* | node()"/>
                                </xsl:copy>
                            </xsl:when>
                            <xsl:when
                                test="not(ancestor::Change[1]/@ChangeType = 'InsertedText') and descendant::Content[ancestor::CharacterStyleRange[1] = $curChar] or not(ancestor::Change[1]/@ChangeType = 'MovedText') and descendant::Content[ancestor::CharacterStyleRange[1] = $curChar]">
                                <xsl:apply-templates/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:element name="{name(.)}">
                                    <xsl:if test="./@*">
                                        <xsl:for-each select="@*">
                                            <xsl:attribute name="{name(.)}" select="."/>
                                        </xsl:for-each>
                                    </xsl:if>
                                    <xsl:attribute name="WordNumber" select="'diff'"/>
                                    <xsl:apply-templates/>
                                </xsl:element>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="ancestor::Note">
                        <xsl:copy>
                            <xsl:attribute name="WordNumber" select="'Note'"/>
                            <xsl:attribute name="NoteNo">
                                <xsl:number level="any" select="ancestor::Note"/>
                            </xsl:attribute>
                            <xsl:apply-templates select="@* | node()"/>
                        </xsl:copy>
                    </xsl:when>
                    <xsl:when
                        test="(ancestor::Change[1]/@ChangeType = 'InsertedText') or (ancestor::Change[1]/@ChangeType = 'MovedText')">
                        <xsl:copy>
                            <xsl:attribute name="WordNumber" select="'Change'"/>
                            <xsl:apply-templates select="@* | node()"/>
                        </xsl:copy>
                    </xsl:when>
                    <xsl:when
                        test="not(ancestor::Change[1]/@ChangeType = 'InsertedText') and descendant::Content[ancestor::CharacterStyleRange[1] = $curChar] or not(ancestor::Change[1]/@ChangeType = 'MovedText') and descendant::Content[ancestor::CharacterStyleRange[1] = $curChar]">
                        <xsl:apply-templates/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:element name="{name(.)}">
                            <xsl:if test="./@*">
                                <xsl:for-each select="@*">
                                    <xsl:attribute name="{name(.)}" select="."/>
                                </xsl:for-each>
                            </xsl:if>
                            <xsl:attribute name="WordNumber" select="'diff'"/>
                            <xsl:apply-templates/>
                        </xsl:element>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
        <!--<xsl:choose>
            <xsl:when test="ancestor::Note">
                <xsl:copy>
                    <xsl:attribute name="WordNumber" select="'Note'"/>
                    <xsl:attribute name="NoteNo">
                        <xsl:number level="any" select="ancestor::Note"/>
                    </xsl:attribute>
                    <xsl:apply-templates select="@* | node()"/>
                </xsl:copy>
            </xsl:when>
            <xsl:when
                test="(ancestor::Change[1]/@ChangeType = 'InsertedText') or (ancestor::Change[1]/@ChangeType = 'MovedText')">
                <xsl:copy>
                    <xsl:attribute name="WordNumber" select="'Change'"/>
                    <xsl:apply-templates select="@* | node()"/>
                </xsl:copy>
            </xsl:when>
            <xsl:when
                test="not(ancestor::Change[1]/@ChangeType = 'InsertedText') and descendant::Content[ancestor::CharacterStyleRange[1] = $curChar] or not(ancestor::Change[1]/@ChangeType = 'MovedText') and descendant::Content[ancestor::CharacterStyleRange[1] = $curChar]">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="{name(.)}">
                    <xsl:if test="./@*">
                        <xsl:for-each select="@*">
                            <xsl:attribute name="{name(.)}" select="."/>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:attribute name="WordNumber" select="'diff'"/>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>-->
    </xsl:template>

    <xsl:template match="Content">
        <xsl:variable name="parentPara" select="ancestor::ParagraphStyleRange[1]/@ParaNumber"/>
        <xsl:choose>
            <xsl:when test="string-length($proceesingBkmark) > 0">
                <xsl:choose>
                    <xsl:when test="not($proceesingBkmark = $parentPara)">
                        <xsl:copy>
                            <xsl:apply-templates select="@*|node()"/>
                        </xsl:copy>
                    </xsl:when>
                    <xsl:otherwise>
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
                                
                                <xsl:variable name="matches" select="mf:extract(.,'[\p{Zs}\t]')"/>
                                <xsl:variable name="match">
                                    <xsl:for-each select="$matches">
                                        <xsl:value-of select="."/>
                                    </xsl:for-each>
                                    <xsl:value-of select="'&#x2028;'"/>
                                    <xsl:value-of select="'&#8232;'"/>
                                    <xsl:value-of select="' '"/>
                                </xsl:variable>
                                <xsl:call-template name="str.tokenize.keep.delimiters" xml:space="default">
                                    <xsl:with-param name="string" select="."/>
                                    <xsl:with-param name="delimiters" select="$match"/>
                                </xsl:call-template>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
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
                        
                        <xsl:variable name="matches" select="mf:extract(.,'[\p{Zs}\t]')"/>
                        <xsl:variable name="match">
                            <xsl:for-each select="$matches">
                                <xsl:value-of select="."/>
                            </xsl:for-each>
                            <xsl:value-of select="'&#x2028;'"/>
                            <xsl:value-of select="'&#8232;'"/>
                            <xsl:value-of select="' '"/>
                        </xsl:variable>
                        <xsl:call-template name="str.tokenize.keep.delimiters" xml:space="default">
                            <xsl:with-param name="string" select="."/>
                            <xsl:with-param name="delimiters" select="$match"/>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
        <!--<xsl:choose>
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
                
                <xsl:variable name="matches" select="mf:extract(.,'[\p{Zs}\t]')"/>
                <xsl:variable name="match">
                    <xsl:for-each select="$matches">
                        <xsl:value-of select="."/>
                    </xsl:for-each>
                    <xsl:value-of select="'&#x2028;'"/>
                    <xsl:value-of select="'&#8232;'"/>
                    <xsl:value-of select="' '"/>
                </xsl:variable>
                <xsl:call-template name="str.tokenize.keep.delimiters" xml:space="default">
                    <xsl:with-param name="string" select="."/>
                    <xsl:with-param name="delimiters" select="$match"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>-->
    </xsl:template>

    <xsl:template match="@WordNumber|@Wchange"/>

    <xsl:template name="str.tokenize.keep.delimiters">
        <xsl:param name="string" select="''"/>
<!--        <xsl:param name="delimiters" select="' '"/>-->
        <xsl:param name="delimiters"/>
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
                    <xsl:attribute name="WordNumber">
                        <xsl:choose>
                            <xsl:when test="processing-instruction()">
                                <xsl:value-of select="'diff'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="'Word'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
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
                <!-- output each delimiter -->
                <xsl:element name="CharacterStyleRange">
                    <xsl:attribute name="WordNumber" select="'Space'"/>
                    <xsl:if test="ancestor::CharacterStyleRange[1]/@*">
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

    <xsl:template match="CharacterStyleRange/Properties|CharacterStyleRange/FormattingChange"/>

    <xsl:template match="Footnote">
        <xsl:element name="{name(ancestor::CharacterStyleRange[1])}">
            <xsl:if test="ancestor::CharacterStyleRange[1]/@*">
                <xsl:for-each select="ancestor::CharacterStyleRange[1]/@*">
                    <xsl:attribute name="{name(.)}" select="."/>
                </xsl:for-each>
            </xsl:if>
            <xsl:attribute name="WordNumber" select="'FN'"/>
            <xsl:copy>

                <xsl:apply-templates select="@* | node()"/>
            </xsl:copy>
        </xsl:element>
    </xsl:template>
    
    <xsl:function name="mf:extract" as="xs:string*">
        <xsl:param name="input" as="xs:string"/>
        <xsl:param name="pattern" as="xs:string"/>
        <xsl:analyze-string select="$input" regex="{$pattern}">
            <xsl:matching-substring>
                <xsl:sequence select="."/>
            </xsl:matching-substring>
        </xsl:analyze-string>
    </xsl:function>
    


</xsl:stylesheet>
