<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf"
    xmlns:bpmn2="http://www.omg.org/spec/BPMN/20100524/MODEL"
    xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI"
    xmlns:dc="http://www.omg.org/spec/DD/20100524/DC"
    xmlns:di="http://www.omg.org/spec/DD/20100524/DI"
    xmlns:xhtml="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="bpmndi bpmn2 xs mf"
    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" version="2.0">    
    <!--To Delete the "row_delete" tr and "table_delete" for table and  26-7-2019-->    
    <xsl:output method="xml"/>
    <!--<xsl:strip-space elements="*"/>-->
    <xsl:template match="*">
        <xsl:element name="{local-name()}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>
    
    <!-- template to copy attributes -->
    <xsl:template match="@*">
        <xsl:attribute name="{local-name()}">
            <xsl:value-of select="."/>
        </xsl:attribute>
    </xsl:template>
    <!-- template to copy the rest of the nodes -->
    <xsl:template match="text()">
        <xsl:copy/>
    </xsl:template>
    <!-- To ignore the double style in class on 24-04-2025-->
    <xsl:template match="//xhtml:span[@class]/@class">
        <xsl:attribute name="class">
            <xsl:choose>
                <xsl:when test="contains(.,' ')">
                    <xsl:value-of select="tokenize(.,' ')[last()]"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="."/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:template>
    <!-- To avoid the unwanted line space -->
    <xsl:template match="xhtml:ul">
        <xsl:element name="ul">
            <xsl:apply-templates select="@*"/>
            <xsl:attribute name="style"><xsl:value-of select="'list-style-type: disc;'"/></xsl:attribute>
            <xsl:apply-templates select="descendant::xhtml:li"></xsl:apply-templates>
        </xsl:element>
    </xsl:template>
    <!--<xsl:template match="//xhtml:span[not(@data-bkmark)]">
        <xsl:apply-templates/>
    </xsl:template>-->
    <!--<xsl:template match="xhtml:p[descendant::xhtml:img]">
        <xsl:copy>
            <xsl:attribute name="rsidR">
                <xsl:value-of select="following::xhtml:p[not(@class='emptypara')][1][child::xhtml:span[@data-bkmark]]/child::xhtml:span[@data-bkmark][1]/@data-bkmark"/>
            </xsl:attribute>
            <xsl:copy-of select="following::xhtml:p[not(@class='emptypara')][1][child::xhtml:span[@data-bkmark]]/child::xhtml:span[@data-bkmark][1]"></xsl:copy-of>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>-->
 </xsl:stylesheet>