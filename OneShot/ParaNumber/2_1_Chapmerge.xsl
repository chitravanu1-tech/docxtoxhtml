<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:html="http://www.w3.org/1999/xhtml"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0">
    <xsl:output indent="yes"/>
    
    <xsl:template match="/">
            <xsl:element name="root">
                <!--<xsl:for-each select="collection('./?select=*.xhtml')">
                <xsl:copy-of select=".//html:body"/>
                </xsl:for-each>-->
                <xsl:for-each select="collection('./?select=*.xhtml')">
                    
                   <!-- <xsl:if test="//html:body[//html:div[html:p[@class='title']]/html:div]">
                        
                        <xsl:copy-of select="//html:body[//html:div[html:p[@class='title']]/html:div]/html:div[html:p[@class='title']]/html:div"/>
                    </xsl:if>-->
                    <xsl:if test="//html:body[//html:div[html:p[@class='title']]]| //body[//div[p[@class='title']]]">                    
                        <xsl:copy-of select="//html:body[//html:div[html:p[@class='title']]]//html:div[html:p[@class='title']]/html:div | //body[//div[p[@class='title']]]//div[p[@class='title']]/div"/>
                    </xsl:if>
                    </xsl:for-each>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>