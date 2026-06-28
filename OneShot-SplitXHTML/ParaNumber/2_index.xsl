<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:strip-space elements="*"/>
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="root">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="p[string-length(.)=0]"/>
       <!--<xsl:template match="p[@class='index1'][string-length(.) &gt; 0][substring-before(.,',')[1] = following-sibling::p[@class='index1'][string-length(.) &gt; 0]/substring-before(.,',')[1]]">
        <xsl:variable name="id" select="substring-before(.,',')[1]"/>
           <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
            <xsl:if test="following-sibling::p[@class='index1'][string-length(.) &gt; 0][substring-before(.,',')[1] = $id]">
                <xsl:variable name="txt">
                    <xsl:copy-of select="following-sibling::p[@class='index1'][descendant::span[contains(@class,'index')]][string-length(.) &gt; 0][substring-before(.,',')[1] = $id]/self::p/span[contains(@class,'index')]"></xsl:copy-of>
                </xsl:variable>
                <xsl:variable name="txt1">
                    <xsl:copy-of select="following-sibling::p[@class='index1'][not(descendant::span[contains(@class,'index')])][string-length(.) &gt; 0][substring-before(.,',')[1] = $id]/self::p"></xsl:copy-of>
                </xsl:variable>
                <xsl:if test="string-length($txt)">
                <xsl:value-of select="'; '"/>
                </xsl:if>
                <xsl:if test="string-length($txt1)">
                    <xsl:value-of select="', '"/>
                </xsl:if>
                
                    <xsl:if test="following-sibling::p[@class='index1'][not(descendant::span[contains(@class,'index')])][string-length(.) &gt; 0][substring-before(.,',')[1] = $id]">
                        
                        <xsl:copy-of select="following-sibling::p[@class='index1'][not(descendant::span[contains(@class,'index')])][string-length(.) &gt; 0][substring-before(.,',')[1] = $id]/self::p/span[@class='pageno']"></xsl:copy-of>
                    </xsl:if>
                <xsl:if test="following-sibling::p[@class='index1'][descendant::span[contains(@class,'index')]][string-length(.) &gt; 0][substring-before(.,',')[1] = $id]">
                        <xsl:copy-of select="following-sibling::p[@class='index1'][string-length(.) &gt; 0][substring-before(.,',')[1] = $id]/self::p/span[contains(@class,'index')]"></xsl:copy-of>
                    </xsl:if>
                
                
            </xsl:if>
           
        </xsl:copy>
    </xsl:template>
  <xsl:template match="p[@class='index1'][string-length(.) &gt; 0][substring-before(.,',')[1] = preceding::p[@class='index1'][string-length(.) &gt; 0]/substring-before(.,',')[1]]"/>-->
        <xsl:template match="p">
                    <xsl:choose>
                        <xsl:when test="self::p[normalize-space(substring-before(text()[1],',')) = preceding-sibling::p/normalize-space(substring-before(text()[1],','))]"></xsl:when>
                        <xsl:otherwise>
                            <xsl:variable name="val" select="self::p/normalize-space(substring-before(text()[1],','))"/>
                            <xsl:variable name="val1" select="self::p/span[contains(@class,'index')]"/>
                            <xsl:copy>
                                <xsl:apply-templates select="@*"/>
                                <xsl:copy-of select="text()"></xsl:copy-of>
                                
                                <xsl:copy-of select="self::p[@class='index1']/span[@class='pageno'][not(parent::span[contains(@class,'index') or not(@class)])]"/>
                                
                                    <xsl:variable name="page">
                                        <xsl:value-of select="following-sibling::p[normalize-space(substring-before(text()[1],',')) = $val][descendant::span[contains(@class,'index')]]/span[@class='pageno']"/>
                                    </xsl:variable>
            
                                <xsl:copy-of select="following-sibling::p[normalize-space(substring-before(text()[1],',')) = $val]/self::p[not(descendant::span[contains(@class,'index')])]/span[@class='pageno'][not(contains($page , .))][not(span[contains(@class,'index')])]"></xsl:copy-of>
                                <xsl:copy-of select="self::p/span[@class='seealso']"></xsl:copy-of>
                                <xsl:copy-of select="following-sibling::p[normalize-space(substring-before(text()[1],',')) = $val]/self::p/span[@class='seealso'][not(parent::span[contains(@class,'index')])]"></xsl:copy-of>
                                <xsl:copy-of select="self::p[@class='index1']/span[contains(@class,'index')]"/>
                                <xsl:copy-of select="following-sibling::p[normalize-space(substring-before(text()[1],',')) = $val]/self::p/span[contains(@class,'index')]"></xsl:copy-of>
                            </xsl:copy>
                        </xsl:otherwise>
                    </xsl:choose>       
    </xsl:template>
    <!--<xsl:template match="span[contains(@class,'index')]">
        <xsl:choose>
            <xsl:when test="self::span[substring-before(text()[1],',') = preceding-sibling::span/substring-before(text()[1],',')]"></xsl:when>
            <xsl:otherwise>
                <xsl:variable name="val1" select="self::span[contains(@class,'index')]"/>
                <xsl:copy>
                    <xsl:apply-templates select="@*"/>
                    <xsl:copy-of select="text()"></xsl:copy-of>
                    
                    <xsl:copy-of select="self::span[contains(@class,'index')]/span[@class='pageno']"/>
                    
                    <xsl:copy-of select="following-sibling::span[substring-before(text()[1],',') = $val1]/self::span[contains(@class,'index')]/span[@class='pageno']"></xsl:copy-of>
                    <xsl:copy-of select="self::span[contains(@class,'index')]/span[@class='seealso']"></xsl:copy-of>
                    </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>       
    </xsl:template>-->
  </xsl:stylesheet>