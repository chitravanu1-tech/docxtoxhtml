<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:variable name="stylecoll" select="document('StylesCollection.xml')"/>
    <xsl:variable name="indxTitle" select="$stylecoll//stylesList//style[@name='DZP_FB_IndexHeading']/@replacement"/>
    
    <xsl:template match="/">
        <xsl:text disable-output-escaping="yes">&lt;html xmlns="http://www.w3.org/1999/xhtml"&gt;</xsl:text>
        <xsl:element name="head">
            <xsl:text disable-output-escaping="yes">&lt;meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /&gt;</xsl:text>
            <xsl:text disable-output-escaping="yes">&lt;meta name="Generator" content="Microsoft Word 14 (filtered)" /&gt;</xsl:text>
            <style>
                span.pageno{
                color: black;
                }
                p.title{
                text-align: center;
                font-size: 300%;
                color: MAROON;
                font-weight: bold;
                }   
                p.index1{
                color: BLACK;
                font-size: 120%;
                margin-left: 30pt;
                }
                p.index2{
                font-size: 110%;
                line-height: 1px;
                color: BLACK;
                margin-left: 40pt;
                }
                p.index3{
                font-size: 105%;
                color: BLACK;
                margin-left: 50pt;
                }
                p.index4{
                font-weight: bold;
                }
            </style>
        </xsl:element>
        <xsl:element name="body">
            <xsl:element name="div">
                <xsl:element name="p">
                    <xsl:attribute name="class" select="'title'"/>
                    <xsl:attribute name="data-name" select="$indxTitle"/>
                    <xsl:value-of select="'INDEX'"/>
                </xsl:element>
          <xsl:apply-templates/>
            </xsl:element>
        </xsl:element>
        <xsl:text disable-output-escaping="yes">&lt;/html&gt;</xsl:text>
    </xsl:template>
    
    <!--<xsl:template match="/">
        <xsl:element name="body">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>-->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="root">
        <xsl:for-each select="div">
            <xsl:sort select="p[1]" data-type="text" order="ascending" />
            <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
            </xsl:copy>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="p">
        <xsl:copy>
            <xsl:if test="@class = 'index1'">
                <xsl:variable name="first" select="substring(., 1, 1)"/>
                <xsl:variable name="first1" select="substring-before(.,',')[1]"/>
                <xsl:attribute name="data-first">
                    <!--<xsl:value-of select="normalize-space($first)"/>-->
                    <xsl:choose>
                        <xsl:when test="(starts-with(., 'A '))">
                            <xsl:value-of select="substring(substring-after(.,'A '), 1,1)"/>
                        </xsl:when>
                        <xsl:when test="(starts-with(., 'a '))">
                            <xsl:value-of select="substring(substring-after(.,'a '), 1,1)"/>
                        </xsl:when>
                        <xsl:when test="(starts-with(., 'An '))">
                            <xsl:value-of select="substring(substring-after(.,'An '), 1,1)"/>
                        </xsl:when>
                        <xsl:when test="(starts-with(., 'an '))">
                            <xsl:value-of select="substring(substring-after(.,'an '), 1,1)"/>
                        </xsl:when>
                        <xsl:when test="(starts-with(., 'The '))">
                            <xsl:value-of select="substring(substring-after(.,'The '), 1,1)"/>
                        </xsl:when>
                        <xsl:when test="(starts-with(., 'the '))">
                            <xsl:value-of select="substring(substring-after(.,'the '), 1,1)"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="normalize-space($first)"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
                <xsl:attribute name="datafirst">
                    <!--<xsl:value-of select="normalize-space($first1)"/>-->
                    <xsl:choose>
                        <xsl:when test="(starts-with(., 'A '))">
                            <xsl:value-of select="substring-before(substring-after(.,'A '),',')[1]"/>
                        </xsl:when>
                        <xsl:when test="(starts-with(., 'a '))">
                            <xsl:value-of select="substring-before(substring-after(.,'a '),',')[1]"/>
                        </xsl:when>
                        <xsl:when test="(starts-with(., 'An '))">
                            <xsl:value-of select="substring-before(substring-after(.,'An '),',')[1]"/>
                        </xsl:when>
                        <xsl:when test="(starts-with(., 'an '))">
                            <xsl:value-of select="substring-before(substring-after(.,'an '),',')[1]"/>
                        </xsl:when>
                        <xsl:when test="(starts-with(., 'The '))">
                            <xsl:value-of select="substring-before(substring-after(.,'The '),',')[1]"/>
                        </xsl:when>
                        <xsl:when test="(starts-with(., 'the '))">
                            <xsl:value-of select="substring-before(substring-after(.,'the '),',')[1]"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="normalize-space($first1)"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="span[contains(@class,'pageno')][not(following-sibling::text()[1][normalize-space(.) =','])][following-sibling::*[1][self::span[contains(@class,'pageno')]]]">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
        <xsl:if test="not(position() = last())">
        <xsl:value-of select="', '"/>
        </xsl:if>
    </xsl:template>
    <xsl:template match="span[contains(@class,'index')][not(following-sibling::text()[1][normalize-space(.) =';'])][following-sibling::*[1][self::span[contains(@class,'index')]]]">
        
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
        <xsl:value-of select="'; '"/>
    </xsl:template>
    <xsl:template match="span[contains(@class,'index')]">
        <xsl:value-of select="'; '"/>
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:attribute name="data-subfirst">
                <xsl:choose>
                    <xsl:when test="(starts-with(., 'A '))">
                        <xsl:value-of select="substring-before(substring-after(.,'A '),',')[1]"/>
                    </xsl:when>
                    <xsl:when test="(starts-with(., 'a '))">
                        <xsl:value-of select="substring-before(substring-after(.,'a '),',')[1]"/>
                    </xsl:when>
                    <xsl:when test="(starts-with(., 'An '))">
                        <xsl:value-of select="substring-before(substring-after(.,'An '),',')[1]"/>
                    </xsl:when>
                    <xsl:when test="(starts-with(., 'an '))">
                        <xsl:value-of select="substring-before(substring-after(.,'an '),',')[1]"/>
                    </xsl:when>
                    <xsl:when test="(starts-with(., 'The '))">
                        <xsl:value-of select="substring-before(substring-after(.,'The '),',')[1]"/>
                    </xsl:when>
                    <xsl:when test="(starts-with(., 'the '))">
                        <xsl:value-of select="substring-before(substring-after(.,'the '),',')[1]"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="substring-before(.,',')[1]"/>
                    </xsl:otherwise>
                </xsl:choose>
                
                </xsl:attribute>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
        
    </xsl:template>
    
    <!--<xsl:template match="//span[contains(@class,'pageno')]">
          <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:attribute name="data-pagefirst">
                <xsl:choose>
                    <xsl:when test="contains(.,'-')">
                        <xsl:value-of select="substring-before(normalize-space(.),'-')"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="normalize-space(.)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
        
    </xsl:template>-->
    
    <xsl:variable name="index1" select="$stylecoll//stylesList//style[@name='DZP_FB_IndexEntry']/@replacement"/>
    <xsl:variable name="index2" select="$stylecoll//stylesList//style[@name='DZP_FB_IndexSubEntry1']/@replacement"/>
    <xsl:variable name="index3" select="$stylecoll//stylesList//style[@name='DZP_FB_IndexSubEntry2']/@replacement"/>
    <xsl:variable name="index4" select="$stylecoll//stylesList//style[@name='DZP_FB_IndexSubEntry3']/@replacement"/>
    <xsl:variable name="index5" select="$stylecoll//stylesList//style[@name='DZP_FB_IndexSubEntry4']/@replacement"/>
    <xsl:variable name="index6" select="$stylecoll//stylesList//style[@name='DZP_FB_IndexSubEntry5']/@replacement"/>
    <xsl:variable name="index7" select="$stylecoll//stylesList//style[@name='DZP_FB_IndexSubEntry6']/@replacement"/>
    <xsl:variable name="index8" select="$stylecoll//stylesList//style[@name='DZP_FB_IndexSubEntry6']/@replacement"/>
    
    <xsl:template match="*/@data-name">
          <xsl:attribute name="data-name">
            <xsl:choose>
                
            
            <xsl:when test="normalize-space(.) ='index1'">
                    
                        <xsl:value-of select="$index1"/>
                    
                </xsl:when>
                <xsl:when test="normalize-space(.) ='index2'">
            
                <xsl:value-of select="$index2"/>
            
        </xsl:when>
                <xsl:when test="normalize-space(.) ='index3'">
            
                <xsl:value-of select="$index3"/>
            
        </xsl:when>
        
                <xsl:when test="normalize-space(.) ='index4'">
            
                <xsl:value-of select="$index4"/>
            
        </xsl:when>
                <xsl:when test="normalize-space(.) ='index5'">
            
                <xsl:value-of select="$index5"/>
            
        </xsl:when>
                <xsl:when test="normalize-space(.) ='index6'">
            
                <xsl:value-of select="$index6"/>
            
        </xsl:when>
                <xsl:when test="normalize-space(.) ='index7'">
            
                <xsl:value-of select="$index7"/>
            
        </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="."/>
                </xsl:otherwise>
            </xsl:choose>
            
        </xsl:attribute>
    </xsl:template>
    <xsl:template match="span[@class='pageno'][. = following-sibling::span[@class='pageno']/.]"/>
    <xsl:template match="span[@class='seealso'][. = following-sibling::span[@class='seealso']/.]"/>
    <xsl:template match="span[contains(@class,'index')][. = following-sibling::span[contains(@class,'index')]/.]"/>
    </xsl:stylesheet>