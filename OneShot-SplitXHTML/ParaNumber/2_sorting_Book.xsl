<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:html="http://www.w3.org/1999/xhtml"
xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs html" version="2.0">
<xsl:template match="@* | node()">
<xsl:copy>
<xsl:apply-templates select="@* | node()"/>
</xsl:copy>
</xsl:template>

    <!--<xsl:template match="p[descendant::span[@class='index2']]">
        <xsl:variable name="semi" select="//span[contains(@class,'index') or not(@class) or @class='pageno']/following-sibling::text()[1][normalize-space(.) =';' or normalize-space(.) =',']"/>
    <xsl:copy>
        <xsl:apply-templates select="@*"/>
        <xsl:apply-templates select="node() except span[@class='index2']"/>
       <xsl:apply-templates select="span[@class='index2']">
           <xsl:sort select='translate(lower-case(@data-subfirst),"’.‘:;,/“-%&amp;\&apos;&#x2019;", "")' lang="ISO"/>
        </xsl:apply-templates>
    </xsl:copy>
</xsl:template>-->
    
    <xsl:template match="p/span[@class='index2']">
        <xsl:variable name="semi" select="//span[contains(@class,'index') or not(@class) or @class='pageno']/following-sibling::text()[1][normalize-space(.) =';' or normalize-space(.) =',']"/>
        <xsl:choose>
            <xsl:when test="self::span/(i | b|u|strike|sc|sup|Sub)[1][lower-case(normalize-space(substring-before(text()[1],','))) = preceding::span/(i | b|u|strike|sc|sup|Sub)[1]/lower-case(normalize-space(substring-before(text()[1],',')))]"></xsl:when>
            <xsl:when test="self::span[not((i | b|u|strike|sc|sup|Sub)[1])][lower-case(normalize-space(substring-before(text()[1],','))) = preceding::span[not((i | b|u|strike|sc|sup|Sub)[1])]/lower-case(normalize-space(substring-before(text()[1],',')))]"></xsl:when>
            <xsl:when test="self::span/(i | b|u|strike|sc|sup|Sub)[1][lower-case(normalize-space(substring-before(text()[1],','))) = preceding::span[not((i | b|u|strike|sc|sup|Sub)[1])]/lower-case(normalize-space(substring-before(text()[1],',')))]"></xsl:when>
            <xsl:when test="self::span[not((i | b|u|strike|sc|sup|Sub)[1])][lower-case(normalize-space(substring-before(text()[1],','))) = preceding::span/(i | b|u|strike|sc|sup|Sub)[1]/lower-case(normalize-space(substring-before(text()[1],',')))]"></xsl:when>
            <xsl:otherwise>
                <!--<xsl:variable name="val" select="self::div/p/*[1][normalize-space(substring-before(text()[1],','))]"/>-->
                <xsl:variable name="val">
                    
                    <xsl:choose>
                        <xsl:when test="self::span//(i|b|u|strike|sc|sup|Sub)[1][normalize-space(substring-before(text()[1],','))]">
                            <xsl:value-of select="self::span/(i | b|u|strike|sc|sup|Sub)[1]/normalize-space(substring-before(text()[1],','))"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="self::span/normalize-space(substring-before(text()[1],','))"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    
                </xsl:variable>
                <xsl:variable name="val1" select="self::span[contains(@class,'index')]"/>
        <xsl:element name="span">
        <xsl:apply-templates select="@*"/>
            <xsl:copy-of select="self::span[@class='index2']/text() except $semi | self::span[@class='index2']/(i| b|u|strike|sc|sup|Sub)[1][//text()] except $semi"></xsl:copy-of>
            <xsl:copy-of select="self::span[@class='index2']/span[@class='pageno']"/>
            <xsl:copy-of select="following-sibling::span[(i | b|u|strike|sc|sup|Sub)[1]/lower-case(normalize-space(substring-before(text()[1],','))) = lower-case($val)]/self::span[(i | b|u|strike|sc|sup|Sub)[1]/lower-case(normalize-space(substring-before(text()[1],','))) = lower-case($val)]/span[@class='pageno']"></xsl:copy-of>
            <xsl:copy-of select="following-sibling::span[not((i | b|u|strike|sc|sup|Sub)[1])][lower-case(normalize-space(substring-before(text()[1],','))) = lower-case($val)]/self::span[not((i | b|u|strike|sc|sup|Sub)[1])][lower-case(normalize-space(substring-before(text()[1],','))) = lower-case($val)]/span[@class='pageno']"></xsl:copy-of>
            <xsl:copy-of select="self::span[@class='seealso']"></xsl:copy-of>
            <xsl:copy-of select="self::span[@class='index2']/span[contains(@class,'index') or not(@class)]"/>
            <xsl:copy-of select="following-sibling::span[(i | b|u|strike|sc|sup|Sub)[1]/lower-case(normalize-space(substring-before(text()[1],','))) = lower-case($val)]/self::span[(i | b|u|strike|sc|sup|Sub)[1]/lower-case(normalize-space(substring-before(text()[1],','))) = lower-case($val)]/span[contains(@class,'index') or not(@class)]"></xsl:copy-of>
            <xsl:copy-of select="following-sibling::span[not((i | b|u|strike|sc|sup|Sub)[1])][lower-case(normalize-space(substring-before(text()[1],','))) = lower-case($val)]/self::span[not((i | b|u|strike|sc|sup|Sub)[1])][lower-case(normalize-space(substring-before(text()[1],','))) = lower-case($val)]/span[contains(@class,'index') or not(@class)]"></xsl:copy-of>
    </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    <xsl:template match="p//span[contains(@class,'index')][count(span[contains(@class,'pageno')]) &gt; 1]">
        <xsl:variable name="semi" select="//span[contains(@class,'pageno')]/following-sibling::text()[1][normalize-space(.) =',']"/>
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="node() except (span[@class = 'pageno']|$semi)"/>
            <xsl:apply-templates select="span[@class = 'pageno']">
                <xsl:sort select='translate(lower-case(@data-pagefirst),"’.‘:;,/“-%&amp;\&apos;&#x2019;", "")' lang="ISO"/>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="p[count(span[contains(@class,'pageno')][not(parent::span[contains(@class,'index')])]) &gt; 1]">
        <xsl:variable name="semi" select="//span[contains(@class,'pageno')]/following-sibling::text()[1][normalize-space(.) =',']"/>
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="node() except (span[contains(@class,'pageno')]| span[contains(@class,'index')] |span[@class='seealso']| $semi)"></xsl:apply-templates>
            <xsl:apply-templates select="span[@class = 'pageno'][not(parent::span[contains(@class,'index')])]">
                <xsl:sort order="ascending"  select="@data-pagefirst" data-type="number"/>
            </xsl:apply-templates>
            <xsl:apply-templates select="span[@class='seealso']"></xsl:apply-templates>
            <xsl:apply-templates select="span[@class='index2']">
                <xsl:sort select='translate(lower-case(@data-subfirst),"’.‘:;,/“-%&amp;\&apos;&#x2019;", "")' lang="ISO"/>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
 
    <!--<xsl:template match="span[@class = 'pageno'][not(parent::span[contains(@class,'index')])]">
        <xsl:variable name="indexText" select="parent::p/child::text()"/>
     <!-\-<xsl:variable name="indexText" select="ancestor::div[1]/*/substring-before(text()[1],',')"/>-\->
     
     <xsl:variable name="indexNumber">
            <!-\-<xsl:if test="count(//p[child::text() = $indexText]) > 1">
                <xsl:for-each select="//p[child::text() = $indexText]">
                       <xsl:if test="not(position() = 1)">
                        <xsl:value-of select="concat(',' ,child::span[@class = 'pageno'])"/>
                    </xsl:if>
                </xsl:for-each>
            </xsl:if>-\->
         <xsl:if test="self::span[@class = 'pageno']">
                <xsl:variable name="val">
                    <xsl:choose>
                        <xsl:when test="contains(.,'-')">
                            <xsl:value-of select="substring-before(.,'-')"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="."/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:for-each select="following-sibling::span[contains(@class,'index')]/span[@class = 'pageno']">
                    <xsl:variable name="val2">
                        <xsl:choose>
                            <xsl:when test="contains(.,'-')">
                                <xsl:value-of select="substring-before(.,'-')"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="."/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    
                    <xsl:choose>
                        <xsl:when test="$val2 = $val">
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="' ,'"/>
                            <xsl:value-of select="$val2"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    
                </xsl:for-each>
            </xsl:if>
            </xsl:variable>
        
        <xsl:element name="span">
            <xsl:for-each select="@*">
                <xsl:attribute name="{name(.)}" select="."/>
            </xsl:for-each>
            <xsl:variable name="sortNum" select="concat(.,$indexNumber)"/>
            <xsl:for-each select="tokenize($sortNum, ',')">
                <xsl:sort select="." data-type="number" order="ascending"/>
                <xsl:if test="not(position() = 1)">
                    <xsl:value-of select="', '"/>
                </xsl:if>
                <xsl:value-of select="."/>
                
            </xsl:for-each>
            </xsl:element>
        
        </xsl:template>-->
    <xsl:template match="span[@class='index3']"/>
      </xsl:stylesheet>