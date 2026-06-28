<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="xml"/>
    
   <!-- <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>-->
    
    
    <xsl:template  match="*">
       <xsl:text>&#x000A;</xsl:text>
       <xsl:element name="div">  
           
           <xsl:call-template name="combine-chNumber-chTitle">
               <xsl:with-param name="val"/>
           </xsl:call-template>           
           
           <xsl:call-template name="chapter-head1">
               <xsl:with-param name="val"/>
           </xsl:call-template>
           
          <xsl:text>&#x000A;</xsl:text>
       </xsl:element>
    </xsl:template>
    
    <xsl:template name="combine-chNumber-chTitle">
        <xsl:param name="val"/>
            
        <xsl:variable name="chNo">
            <xsl:call-template name="chapter-number">
                <xsl:with-param name="val"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="chTitle">
            <xsl:call-template name="chapter-title">
                <xsl:with-param name="val"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:text>&#x000A;</xsl:text>
        <xsl:text> </xsl:text>
        <xsl:element name="p">
            <xsl:attribute name="class">
                <xsl:value-of select="'toc-ct'"/>
            </xsl:attribute>
            <xsl:attribute name="data-name">
                <xsl:value-of select="'toc-ct'"/>
            </xsl:attribute>
            <xsl:value-of select="concat($chNo,' : ',$chTitle)"/>    
        </xsl:element>
        
    </xsl:template>
    
    <xsl:template name="chapter-number">
        <xsl:param name="val"/>       
        <xsl:value-of select="//p[@class = 'ChapterNumber']/normalize-space(.)"/>     
    </xsl:template>
    
    <xsl:template name="chapter-title">
        <xsl:param name="val"/>        
        <xsl:value-of select="//p[@class = 'ChapterTitle']/normalize-space(.)"/>     
    </xsl:template>
    
    <xsl:template name="chapter-head1">
        <xsl:param name="val"/>
        <xsl:text>&#x000A;</xsl:text>
        <xsl:text> </xsl:text>
        <xsl:element name="ol">
        <xsl:for-each select="//p[@class = 'Head1']">
        <xsl:text>&#x000A;</xsl:text>  
        <xsl:text>   </xsl:text>
        <xsl:element name="li">
            <xsl:attribute name="data-id">
                <xsl:value-of select="position()"/>
            </xsl:attribute>
            <xsl:attribute name="class">
                <xsl:value-of select="'toc-head1'"/>
            </xsl:attribute>
            <xsl:attribute name="data-name">
                <xsl:value-of select="'toc-head1'"/>
            </xsl:attribute>
            <xsl:attribute name="style">
                <xsl:value-of select="'list-style-type:lower-roman;'"/>
            </xsl:attribute>
            <xsl:value-of select="self::p[@class = 'Head1']/normalize-space(.)"/>   
        </xsl:element>       
        </xsl:for-each>
        <xsl:text>&#x000A;</xsl:text>
        <xsl:text> </xsl:text>
        </xsl:element>         
    </xsl:template>
    
</xsl:stylesheet>