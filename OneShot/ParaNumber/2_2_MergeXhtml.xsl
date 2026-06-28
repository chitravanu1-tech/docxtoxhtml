<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:html="http://www.w3.org/1999/xhtml"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0">
    <xsl:strip-space elements="*"/>
    <xsl:variable name="stylecoll" select="document('StylesCollection.xml')"/>
    <xsl:template match="@*|node()">
        
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="root">
        <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="html:body">
         <xsl:apply-templates select="@*|node()"/>
       </xsl:template>
    
    
    <xsl:template match="html:div">
        <xsl:for-each select="descendant::html:div|descendant::div">
            <xsl:copy>
            <xsl:apply-templates/>
            </xsl:copy>
        </xsl:for-each>

    </xsl:template>
    
    <xsl:template match="html:p[@class='title']">
        <xsl:variable name="id" select="text()[1]"/>
        <xsl:choose>
            <xsl:when test="following::html:div/html:p[1]/text() = $id"> </xsl:when>
                               
            </xsl:choose>
     
        
    </xsl:template>
    <xsl:variable name="index1" select="$stylecoll//stylesList//style[@name='DZP_FB_IndexEntry']/@replacement"/>
    <xsl:variable name="index2" select="$stylecoll//stylesList//style[@name='DZP_FB_IndexSubEntry1']/@replacement"/>
    <xsl:variable name="index3" select="$stylecoll//stylesList//style[@name='DZP_FB_IndexSubEntry2']/@replacement"/>
    <xsl:variable name="index4" select="$stylecoll//stylesList//style[@name='DZP_FB_IndexSubEntry3']/@replacement"/>
    <xsl:variable name="index5" select="$stylecoll//stylesList//style[@name='DZP_FB_IndexSubEntry4']/@replacement"/>
    <xsl:variable name="index6" select="$stylecoll//stylesList//style[@name='DZP_FB_IndexSubEntry5']/@replacement"/>
    <xsl:variable name="index7" select="$stylecoll//stylesList//style[@name='DZP_FB_IndexSubEntry6']/@replacement"/>
    <xsl:variable name="index8" select="$stylecoll//stylesList//style[@name='DZP_FB_IndexSubEntry6']/@replacement"/>
    
    <xsl:template match="*/@data-name">
        
        <xsl:variable name="ind" select="parent::*[1]/@class"/>
        <xsl:attribute name="data-name">
            
            <xsl:choose>
                
                
                <xsl:when test="normalize-space(.) ='index1' or normalize-space($ind) ='index1'">
                    
                    <xsl:value-of select="$index1"/>
                    
                </xsl:when>
                <xsl:when test="normalize-space(.) ='index2' or normalize-space($ind) ='index2'">
                    
                    <xsl:value-of select="$index2"/>
                    
                </xsl:when>
                <xsl:when test="normalize-space(.) ='index3' or normalize-space($ind) ='index3'">
                    
                    <xsl:value-of select="$index3"/>
                    
                </xsl:when>
                
                <xsl:when test="normalize-space(.) ='index4' or normalize-space($ind) ='index4'">
                    
                    <xsl:value-of select="$index4"/>
                    
                </xsl:when>
                <xsl:when test="normalize-space(.) ='index5' or normalize-space($ind) ='index5'">
                    
                    <xsl:value-of select="$index5"/>
                    
                </xsl:when>
                <xsl:when test="normalize-space(.) ='index6' or normalize-space($ind) ='index6'">
                    
                    <xsl:value-of select="$index6"/>
                    
                </xsl:when>
                <xsl:when test="normalize-space(.) ='index7' or normalize-space($ind) ='index7'">
                    
                    <xsl:value-of select="$index7"/>
                    
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="."/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:template>
    <!--<xsl:template match="div/p[@class='index1'][string-length(.) &gt; 0][substring-before(.,',')[1] = following::div/p[@class='index1'][string-length(.) &gt; 0]/substring-before(.,',')[1]]">
        <xsl:variable name="id" select="self::p[@class='index1'][string-length(.) &gt; 0]/substring-before(.,',')[1]"/>
         <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
            
            <xsl:if test="following::div/p[@class='index1'][string-length(.) &gt; 0][substring-before(.,',')[1] = $id]">
                 <xsl:variable name="txt">
                    <xsl:copy-of select="following::div/p[@class='index1'][string-length(.) &gt; 0][substring-before(.,',')[1] = $id]/self::p[contains(@class,'index')]"></xsl:copy-of>
                </xsl:variable>
                
                <xsl:if test="string-length($txt)">
                    <xsl:value-of select="', '"/>
                </xsl:if>
                
                <xsl:copy-of select="following::div/p[@class='index1'][string-length(.) &gt; 0][substring-before(.,',')[1] = $id]/self::p[contains(@class,'index1')]/span[@class='pageno'][not(parent::span)]"></xsl:copy-of>
            </xsl:if>
            
        </xsl:copy>
    </xsl:template>
    <xsl:template match="div[p[@class='index1'][string-length(.) &gt; 0][substring-before(.,',')[1] = preceding::div/p[@class='index1'][string-length(.) &gt; 0]/substring-before(.,',')[1]]]"/>-->
    
    
    <!--<xsl:template match="text()">
        <xsl:value-of select="normalize-space()"/>
    </xsl:template>-->
    
    <!--<xsl:template match="div[p]">
        <xsl:choose>
            <xsl:when test="self::div[p[substring-before(text()[1],',') = preceding-sibling::div/descendant::p/substring-before(text()[1],',')]]"></xsl:when>
            <xsl:otherwise>
                <xsl:variable name="val" select="self::div/p/substring-before(text()[1],',')"/>
                <xsl:variable name="val1" select="self::p/span[contains(@class,'index')]"/>
                <xsl:copy>
                    <xsl:element name="p">
                    <xsl:apply-templates select="descendant::p/@*"/>
                    <xsl:copy-of select="self::div/p/text()"></xsl:copy-of>
                    
                    <xsl:copy-of select="self::div/p[@class='index1']/span[@class='pageno'][not(span[contains(@class,'index')])]"/>
                    <xsl:copy-of select="following-sibling::div/p[substring-before(text()[1],',') = $val]/self::p/span[@class='pageno'][not(span[contains(@class,'index')])]"></xsl:copy-of>
                    <xsl:copy-of select="self::div/p/span[@class='seealso']"></xsl:copy-of>
                    <xsl:copy-of select="self::div/p[@class='index1']/span[contains(@class,'index')]"/>
                    <xsl:copy-of select="following-sibling::div/p[substring-before(text()[1],',') = $val]/self::p/span[contains(@class,'index')]"></xsl:copy-of>
                    </xsl:element>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>-->
        
    <xsl:template match="//div">
        
        <xsl:variable name="semi" select="//span[contains(@class,'index') or not(@class) or @class='pageno']/following-sibling::text()[1][normalize-space(.) =';' or normalize-space(.) =',']"/>
        <xsl:choose>
            <xsl:when test="self::div[descendant::p/(i | b|u|strike|sc|sup|Sub)[1][lower-case(normalize-space(substring-before(text()[1],','))) = preceding::div/descendant::p/(i | b|u|strike|sc|sup|Sub)[1]/lower-case(normalize-space(substring-before(text()[1],',')))]]"></xsl:when>
            <xsl:when test="self::div[descendant::p[not((i | b|u|strike|sc|sup|Sub)[1])][lower-case(normalize-space(substring-before(text()[1],','))) = preceding::div/descendant::p[not((i | b|u|strike|sc|sup|Sub)[1])]/lower-case(normalize-space(substring-before(text()[1],',')))]]"></xsl:when>
            <xsl:when test="self::div[descendant::p/(i | b|u|strike|sc|sup|Sub)[1][lower-case(normalize-space(substring-before(text()[1],','))) = preceding::div/descendant::p[not((i | b|u|strike|sc|sup|Sub)[1])]/lower-case(normalize-space(substring-before(text()[1],',')))]]"></xsl:when>
            <xsl:when test="self::div[descendant::p[not((i | b|u|strike|sc|sup|Sub)[1])][lower-case(normalize-space(substring-before(text()[1],','))) = preceding::div/descendant::p/(i | b|u|strike|sc|sup|Sub)[1]/lower-case(normalize-space(substring-before(text()[1],',')))]]"></xsl:when>
            <xsl:otherwise>
                <!--<xsl:variable name="val" select="self::div/p/*[1][normalize-space(substring-before(text()[1],','))]"/>-->
                <xsl:variable name="val">
                    
                    <xsl:choose>
                        <xsl:when test="self::div/p//(i|b|u|strike|sc|sup|Sub)[1][normalize-space(substring-before(text()[1],','))]">
                            <xsl:value-of select="self::div/p/(i | b|u|strike|sc|sup|Sub)[1]/normalize-space(substring-before(text()[1],','))"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="self::div/p/normalize-space(substring-before(text()[1],','))"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    
                </xsl:variable>
                <xsl:variable name="val1" select="self::p/span[contains(@class,'index')]"/>
                
                
                <xsl:copy>
                    <xsl:element name="p">
                    <xsl:apply-templates select="descendant::p[1]/@*"/>
                        <!--<xsl:copy-of select="self::div/p/text() except $semi | self::div/p/*[1][text()] except $semi"></xsl:copy-of>-->
                   <xsl:copy-of select="self::div/p/text() except $semi | self::div/p/(i| b|u|strike|sc|sup|Sub)[1][//text()] except $semi"></xsl:copy-of>
                    <xsl:copy-of select="self::div/p[@class='index1']/span[@class='pageno'][not(parent::span[contains(@class,'index') or @class])]"/>
                        <xsl:copy-of select="following-sibling::div/p[not(descendant::span[contains(@class,'index')])][(i | b|u|strike|sc|sup|Sub)[1]/lower-case(normalize-space(substring-before(text()[1],','))) = lower-case($val)]/self::p[(i | b|u|strike|sc|sup|Sub)[1]/lower-case(normalize-space(substring-before(text()[1],','))) = lower-case($val)]/span[@class='pageno'][not(parent::span[contains(@class,'index')] or not(@class))]"></xsl:copy-of>
                        <xsl:copy-of select="following-sibling::div/p[not(descendant::span[contains(@class,'index')])][not((i | b|u|strike|sc|sup|Sub)[1])][lower-case(normalize-space(substring-before(text()[1],','))) = lower-case($val)]/self::p[not((i | b|u|strike|sc|sup|Sub)[1])][lower-case(normalize-space(substring-before(text()[1],','))) = lower-case($val)]/span[@class='pageno'][not(parent::span[contains(@class,'index')] or not(@class))]"></xsl:copy-of>
                    <xsl:copy-of select="self::div/p/span[@class='seealso']"></xsl:copy-of>
                    <xsl:copy-of select="self::div/p[@class='index1']/span[contains(@class,'index') or not(@class)]"/>
                        <xsl:copy-of select="following-sibling::div/p[(i | b|u|strike|sc|sup|Sub)[1]/lower-case(normalize-space(substring-before(text()[1],','))) = lower-case($val)]/self::p[(i | b|u|strike|sc|sup|Sub)[1]/lower-case(normalize-space(substring-before(text()[1],','))) = lower-case($val)]/span[contains(@class,'index') or not(@class)]"></xsl:copy-of>
                        <xsl:copy-of select="following-sibling::div/p[not((i | b|u|strike|sc|sup|Sub)[1])][lower-case(normalize-space(substring-before(text()[1],','))) = lower-case($val)]/self::p[not((i | b|u|strike|sc|sup|Sub)[1])][lower-case(normalize-space(substring-before(text()[1],','))) = lower-case($val)]/span[contains(@class,'index') or not(@class)]"></xsl:copy-of>
                    </xsl:element>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>       
    </xsl:template>
    </xsl:stylesheet>