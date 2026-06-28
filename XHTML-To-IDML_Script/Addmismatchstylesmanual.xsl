<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="xml" name="xml"/>
    <xsl:variable name="newstyles" select="document('Converted_Story/errorlog1.xml')"/>
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="RootCharacterStyleGroup">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
            <xsl:element name="CharacterStyleGroup">
                <xsl:attribute name="Self" select="'CharacterStyleGroup/NewManual Styles'"/>
                <xsl:attribute name="Name" select="'NewManual Styles'"/>
                <xsl:text>&#x000A;</xsl:text>
                <xsl:for-each select="$newstyles/result/data1/CharacterStyleRange">
                    <xsl:if test="(./@StyleManualChar) and (./@StyleManualChar1)">
                        <xsl:if test="contains(./@StyleManualChar1, '@manual@')">
                            <xsl:variable name="newsty" select="./@AppliedCharacterStyle1"/>
                            <xsl:variable name="newsty1"
                                select="substring-after(./@AppliedCharacterStyle1, 'CharacterStyle/')"/>
                            <xsl:element name="CharacterStyle">
                                <xsl:attribute name="Self" select="$newsty"/>
                                <xsl:attribute name="Imported" select="'false'"/>
                                <xsl:attribute name="KeyboardShortcut" select="'0 0'"/>
                                <xsl:attribute name="Name" select="$newsty1"/>
                                <xsl:variable name="newsty2"
                                    select="substring-after(./@StyleManualChar1, 'CharacterStyle/')"/>
                                <xsl:if test="contains($newsty2, 'startfontstyle')">
                                    <xsl:choose>
                                        <xsl:when test="contains($newsty2, 'italic') and contains($newsty2, 'Bold')">
                                            <xsl:attribute name="FontStyle" select="'Bold Italic'"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:attribute name="FontStyle" select="substring-before(substring-after($newsty2, 'startfontstyle'), 'endfontstyle')"
                                            />
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:if>
                                <xsl:if test="contains($newsty2, 'startcapitalization')">
                                    <xsl:attribute name="Capitalization"
                                        select="substring-before(substring-after($newsty2, 'startcapitalization'), 'endcapitalization')"
                                    />
                                </xsl:if>
                                <xsl:if test="contains($newsty2, 'startunderline')">
                                    <xsl:attribute name="Underline"
                                        select="substring-before(substring-after($newsty2, 'startunderline'), 'endunderline')"
                                    />
                                </xsl:if>
                                <xsl:if test="contains($newsty2, 'startstrikeThru')">
                                    <xsl:attribute name="StrikeThru"
                                        select="substring-before(substring-after($newsty2, 'startstrikeThru'), 'endstrikeThru')"
                                    />
                                </xsl:if>
                                <xsl:if test="contains($newsty2, 'startposition')">
                                    <xsl:attribute name="Position"
                                        select="substring-before(substring-after($newsty2, 'startposition'), 'endposition')"
                                    />
                                </xsl:if>
                                <xsl:text>&#x000A;</xsl:text>
                                <Properties>
                                    <xsl:text>&#x000A;</xsl:text>
                                    <BasedOn type="string">$ID/[No character style]</BasedOn>
                                    <xsl:text>&#x000A;</xsl:text>
                                    <PreviewColor type="enumeration">Nothing</PreviewColor>
                                    <xsl:text>&#x000A;</xsl:text>
                                </Properties>
                                <xsl:text>&#x000A;</xsl:text>
                            </xsl:element>
                            <xsl:text>&#x000A;</xsl:text>
                        </xsl:if>
                    </xsl:if>
                </xsl:for-each>
            </xsl:element>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>
