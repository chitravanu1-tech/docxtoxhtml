<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="xml" indent="no"/>
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:key name="kTrip" match="ol" use="concat(@type,@start,@class,@moreThanOneChild)"/>
    <xsl:key name="kTrip1" match="ol" use="concat(@type,@class)"/>
    <xsl:key name="kTrip2" match="ul" use="concat(@type,@class)"/>
    <xsl:key name="kTrip3" match="ol" use="@type"/>
    
    <xsl:template match="html">
        <xsl:element name="numbering">
            <xsl:apply-templates select="@*"/>
            <xsl:element name="abstractNum">
                <xsl:apply-templates select="ol|ul" mode="abstract"/>
            </xsl:element>
            <xsl:element name="numId">
                <xsl:apply-templates select="ol|ul" mode="num"/>    
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="ol[generate-id() != generate-id(key('kTrip',concat(@type,@start,@class,@moreThanOneChild))[1])]"/>
    
    <!--<xsl:template match="ol[generate-id() != generate-id(key('kTrip1',concat(@type,@class))[1])]" mode="abstract"/>-->
    
    <xsl:template match="ul[generate-id() != generate-id(key('kTrip2',concat(@type,@class))[1])]" mode="abstract"/>
    
    <xsl:template match="ul[generate-id() != generate-id(key('kTrip2',concat(@type,@class))[1])]"/>
    
    <xsl:template match="ol" mode="abstract">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ol[not(child::*)]" mode="abstract"/>
    
    <xsl:template match="ul" mode="abstract">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ul[not(child::*)]" mode="abstract"/>
    
    <xsl:template match="ul" mode="num">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ul[not(child::*)]"/>
    
    <xsl:template match="ol[not(child::*)]"/>
    
    <xsl:template match="ol" mode="num">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>