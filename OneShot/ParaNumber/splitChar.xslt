<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:idPkg="http://ns.adobe.com/AdobeInDesign/idml/1.0/packaging"
    exclude-result-prefixes="xs"
    version="2.0">
    
    
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="CharacterStyleRange[ancestor::ParagraphStyleRange[1]/descendant::AllNestedStyles]">
        <xsl:variable name="nestedCharacterStyle" select="ancestor::ParagraphStyleRange[1]/descendant::AllNestedStyles/descendant::AppliedCharacterStyle[1]"/>
        <xsl:variable name="repetition" select="ancestor::ParagraphStyleRange[1]/descendant::AllNestedStyles/descendant::Repetition[1]"/>
        <xsl:variable name="delimiter" select="ancestor::ParagraphStyleRange[1]/descendant::AllNestedStyles/descendant::Delimiter[1]"/>
        <xsl:choose>
            <!--<xsl:when test="ancestor::Change">
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:when>-->
            <xsl:when test="ancestor::Note">
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:when>
            <xsl:when test="descendant::Content">
                <xsl:apply-templates select="Content|node()">
                    <xsl:with-param name="nc" select="$nestedCharacterStyle"/>
                </xsl:apply-templates>
                <!--<xsl:call-template name="_split-pattern">
                    <xsl:with-param name="string" select="."/>
                    <xsl:with-param name="pattern" select="' '"/>
                    <xsl:with-param name="nestedcharacterStyle" select="$nestedCharacterStyle"/>
                </xsl:call-template>-->
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="{name(.)}">
                    <xsl:if test="./@*">
                        <xsl:for-each select="@*">
                            <xsl:attribute name="{name(.)}" select="."/>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>  
    
    <xsl:template match="Content[ancestor::ParagraphStyleRange[1]/descendant::AllNestedStyles]">
        <xsl:param name="nc"/>
        <xsl:variable name="nestedCharacterStyle" select="ancestor::ParagraphStyleRange[1]/descendant::AllNestedStyles/descendant::AppliedCharacterStyle[1]"/>
        <xsl:variable name="repetition" select="ancestor::ParagraphStyleRange[1]/descendant::AllNestedStyles/descendant::Repetition[1]"/>
        <xsl:variable name="delimiter" select="ancestor::ParagraphStyleRange[1]/descendant::AllNestedStyles/descendant::Delimiter[1]"/>
        <xsl:choose>
            <!--<xsl:when test="ancestor::Change">
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:when>-->
            <xsl:when test="ancestor::Note">
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="_split-pattern">
                    <xsl:with-param name="string" select="."/>
                    <xsl:with-param name="pattern" select="' '"/>
                    <xsl:with-param name="nestedcharacterStyle" select="$nestedCharacterStyle"/>
                    <xsl:with-param name="repetition" select="$repetition"/>
                    <xsl:with-param name="repetitionInc" select="1"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>    
    
    <xsl:template name="split">
        <xsl:param name="string" select="''"/>
        <xsl:param name="pattern" select="''"/>
        <xsl:param name="nestedcharacterStyle"/>
        <xsl:choose>
            <xsl:when test="not($string)"/>
            <xsl:when test="not($pattern)">
                <xsl:call-template name="_split-characters">
                    <xsl:with-param name="string" select="$string"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="_split-pattern">
                    <xsl:with-param name="string" select="$string"/>
                    <xsl:with-param name="pattern" select="$pattern"/>
                    <xsl:with-param name="nestedcharacterStyle" select="$nestedcharacterStyle"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="_split-characters">
        <xsl:param name="string"/>
        <xsl:if test="$string">
            <xsl:element name="CharacterStyleRange">
                <xsl:if test="ancestor::CharacterStyleRange[1]/@*">
                    <xsl:for-each select="ancestor::CharacterStyleRange[1]/@*">
                        <xsl:attribute name="{name(.)}" select="."/>
                    </xsl:for-each>
                </xsl:if>
                <xsl:for-each select="preceding-sibling::*">
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
                            <xsl:value-of select="substring($string, 1, 1)"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:element>
            </xsl:element>
            <xsl:call-template name="_split-characters">
                <xsl:with-param name="string" select="substring($string, 2)"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <xsl:template name="_split-pattern">
        <xsl:param name="string"/>
        <xsl:param name="pattern"/>
        <xsl:param name="nestedcharacterStyle"/>
        <xsl:param name="repetition"/>
        <xsl:param name="repetitionInc"/>
        
        <xsl:choose>
            <xsl:when test="contains($string, $pattern)">
                <xsl:if test="not(starts-with($string, $pattern))">
                    <xsl:element name="CharacterStyleRange">
                        <xsl:if test="ancestor::CharacterStyleRange[1]/@*">
                            <xsl:for-each select="ancestor::CharacterStyleRange[1]/@*">
                                <xsl:attribute name="{name(.)}" select="."/>
                            </xsl:for-each>
                        </xsl:if>
                        <xsl:for-each select="preceding-sibling::*">
                            <xsl:if test="self::Properties">
                                <xsl:copy-of select="."/>
                            </xsl:if>
                        </xsl:for-each>
                        <xsl:element name="Content">
                            <xsl:choose>
                                <xsl:when test="processing-instruction()">
                                    <xsl:copy-of select="processing-instruction()"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="substring-before($string, $pattern)"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:element>
                    </xsl:element>
                </xsl:if>
                <!--<xsl:if test="(starts-with($string, $pattern))">-->
                <xsl:element name="CharacterStyleRange">
                    <xsl:if test="ancestor::CharacterStyleRange[1]/@*">
                        <xsl:for-each select="ancestor::CharacterStyleRange[1]/@*">
                            <xsl:attribute name="{name(.)}" select="."/>
                        </xsl:for-each>
                    </xsl:if>
                    <!--                    <xsl:if test="number($repetitionInc) &lt;= number($repetition)">-->
                    <xsl:if test="number($repetitionInc) = number($repetition)">
                        <xsl:attribute name="AppliedCharacterStyle" select="$nestedcharacterStyle"/>
                    </xsl:if>
                    <xsl:for-each select="preceding-sibling::*">
                        <xsl:if test="self::Properties">
                            <xsl:copy-of select="."/>
                        </xsl:if>
                    </xsl:for-each>
                    <xsl:element name="Content">
                        <xsl:choose>
                            <xsl:when test="processing-instruction()">
                                <xsl:copy-of select="processing-instruction()"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="$pattern"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:element>
                </xsl:element>
                <!--</xsl:if>-->
                <xsl:call-template name="_split-pattern">
                    <xsl:with-param name="string" select="substring-after($string, $pattern)"/>
                    <xsl:with-param name="pattern" select="$pattern"/>
                    <xsl:with-param name="nestedcharacterStyle" select="$nestedcharacterStyle"/>
                    <xsl:with-param name="repetition" select="$repetition"/>
                    <xsl:with-param name="repetitionInc" select="number($repetitionInc) + 1"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="CharacterStyleRange">
                    <xsl:if test="ancestor::CharacterStyleRange[1]/@*">
                        <xsl:for-each select="ancestor::CharacterStyleRange[1]/@*">
                            <xsl:attribute name="{name(.)}" select="."/>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:for-each select="preceding-sibling::*">
                        <xsl:if test="self::Properties">
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
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>