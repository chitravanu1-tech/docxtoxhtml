<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs xhtml" 
    xmlns:mml="http://www.w3.org/1998/Math/MathML"
    xmlns:xhtml="http://www.w3.org/1999/xhtml"
    version="2.0">
    
    <xsl:output method="xml"/>
    <xsl:preserve-space elements="*"/>
    <xsl:preserve-space elements="xhtml:span"/>
    <xsl:preserve-space elements="xhtml:p"/>
    <xsl:preserve-space elements="xhtml:h1"/>
    <xsl:preserve-space elements="xhtml:h2"/>
    <xsl:preserve-space elements="xhtml:h3"/>
    <xsl:preserve-space elements="xhtml:h4"/>
    <xsl:preserve-space elements="xhtml:h5"/>
    <xsl:preserve-space elements="xhtml:h6"/>
    <xsl:preserve-space elements="xhtml:li"/>
    <xsl:preserve-space elements="xhtml:title"/>
    <xsl:strip-space elements="xhtml:td"/>
    <xsl:strip-space elements="xhtml:tr"/>
    <xsl:strip-space elements="xhtml:tbody"/>
    <xsl:strip-space elements="xhtml:ol"/>
    <xsl:strip-space elements="xhtml:head"/>
    <xsl:strip-space elements="xhtml:ul"/>
    <xsl:strip-space elements="xhtml:body"/>
    

<!--    <xsl:strip-space elements="*"/>-->
    
    <!-- Stylesheet to remove all namespaces from a document -->
    <!-- NOTE: this will lead to attribute name clash, if an element contains
        two attributes with same local name but different namespace prefix -->
    <!-- Nodes that cannot have a namespace are copied as such -->

    <!-- template to copy elements -->
    <xsl:template match="*">
        <xsl:element name="{local-name()}">
            <xsl:apply-templates select="@* | node()" xml:space="preserve"/>
        </xsl:element>
    </xsl:template>
    
    
    <!-- template to copy attributes -->
    <xsl:template match="@*">
        <xsl:attribute name="{local-name()}">
            <xsl:value-of select="." xml:space="preserve"/>
        </xsl:attribute>
    </xsl:template>
    <!-- added double space removal on 25-09-2024 azure 16334 -->
    <xsl:template match="text()">
        <xsl:analyze-string select="." regex="\n|&#x00AD;|&amp;nbsp;|&#160;|&#x2028;|(  )+">
<!--        <xsl:analyze-string select="." regex="(\n)|(.&#x000A;)|(&#x0A;)|(&#10;)|(&#13;)|(&#xA;)">-->
            <xsl:matching-substring>
                <xsl:if test="matches(.,'\n') or matches(.,'&#x00AD;')">
                <xsl:value-of select="''" xml:space="preserve"/>
                </xsl:if>
                <!-- commented for ng \n|&#x00AD;|—|&amp;nbsp;|&#160;|&#x2028;|(  )+ on 8-1-2025 -->
                <!--<xsl:if test="matches(.,'—')">
                    <xsl:value-of select="replace(.,'—','&#x2013;')"/>
                </xsl:if>-->
                <xsl:if test="matches(.,'&amp;nbsp;')">
                    <xsl:value-of select="replace(.,'&amp;nbsp;',' ')"/>
                </xsl:if>
                <xsl:if test="matches(.,'&#160;')">
                    <xsl:value-of select="replace(.,'&#160;',' ')"/>
                </xsl:if>
                <xsl:if test="matches(.,'&#x2028;')">
                    <xsl:value-of select="replace(.,'&#x2028;',' ')"/>
                </xsl:if>
                <xsl:if test="matches(.,'(  )+')">
                    <xsl:value-of select="replace(.,'(  )+',' ')"/>
                </xsl:if>
            </xsl:matching-substring>
            <xsl:non-matching-substring>
                <xsl:value-of select="." xml:space="preserve"/>
            </xsl:non-matching-substring>
        </xsl:analyze-string>
    </xsl:template>
    
   <!-- <xsl:template priority=".7" match="text()[position()=1 and not((ancestor::node()/@xml:space)[position()=last()]='preserve')]">
        <xsl:value-of select="normalize-space()"/>
        <xsl:if test="normalize-space(substring(., string-length(.))) = ''">
<!-\-            <xsl:text> </xsl:text>-\->
        </xsl:if>
    </xsl:template>-->
    
    <!-- removing dummy OL and LI   -->
    <!-- class condition was added on 6.7.2017    -->
    <xsl:template match="xhtml:ol[@type ='dummy']|xhtml:ol[@type ='dummy']/xhtml:li|xhtml:ol[@class ='dummy']
        |xhtml:ol[@class ='nolist']/xhtml:li|xhtml:ol[@type ='nolist']|xhtml:ol[@type ='nolist']/xhtml:li|xhtml:ol[@class ='nolist']|xhtml:ol[@class ='nolist']/xhtml:li">
        <xsl:apply-templates/>
    </xsl:template>
    <!-- removing dummy OL and LI text  -->
    <!-- class condition was added on 6.7.2017    -->
    <xsl:template match="xhtml:ol[@type ='dummy']/text()|xhtml:ol[@type ='dummy']/xhtml:li/text()|xhtml:ol[@class ='dummy']/text()|xhtml:ol[@class ='dummy']/xhtml:li/text()
        |xhtml:ol[@type ='nolist']/text()|xhtml:ol[@type ='nolist']/xhtml:li/text()|xhtml:ol[@class ='nolist']/text()|xhtml:ol[@class ='nolist']/xhtml:li/text()"/>
    
    <xsl:template match="xhtml:li">
        <xsl:element name="li">
<!--            <xsl:apply-templates select="@*|node() except child::xhtml:ul,child::xhtml:ol,child::xhtml:ol/*,child::xhtml:ul/*" />-->
            <xsl:apply-templates select="@*|node()" />
        </xsl:element>
        <xsl:apply-templates select="xhtml:ol|xhtml:ul|xhtml:p[parent::xhtml:li[not(@style='mso-element:endnote' or @class='footnotecaption')]]| xhtml:h1|xhtml:h2|xhtml:h3|xhtml:h4|xhtml:h5|xhtml:h6|xhtml:title" mode="li"/>
    </xsl:template>
    
    <xsl:template match="xhtml:ul[parent::xhtml:li]|xhtml:ol[parent::xhtml:li]|xhtml:p[parent::xhtml:li]| xhtml:h1[parent::xhtml:li]
        |xhtml:h2[parent::xhtml:li]|xhtml:h3[parent::xhtml:li]|xhtml:h4[parent::xhtml:li]|xhtml:h5[parent::xhtml:li]|xhtml:h6[parent::xhtml:li]
        |xhtml:title[parent::xhtml:li]" mode="li">
        <xsl:element name="{local-name()}">
            <xsl:apply-templates select="@* | node()" xml:space="preserve"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="xhtml:ul[parent::xhtml:li]|xhtml:ol[parent::xhtml:li]|xhtml:p[parent::xhtml:li[not(@style='mso-element:endnote' or @class='footnotecaption')]]
        | xhtml:h1[parent::xhtml:li]|xhtml:h2[parent::xhtml:li]|xhtml:h3[parent::xhtml:li]|xhtml:h4[parent::xhtml:li]
        |xhtml:h5[parent::xhtml:li]|xhtml:h6[parent::xhtml:li]|xhtml:title[parent::xhtml:li]">
        
        
        <!--<xsl:element name="{local-name()}">
            <xsl:apply-templates select="@* | node()" xml:space="preserve"/>
        </xsl:element>-->
    </xsl:template>
    
    <xsl:template match="xhtml:div[contains(@style,'footnote') or contains(@style,'comment') or contains(@style ,'endnote')][count(child::*) = 0]"></xsl:template>
    <xsl:template match="xhtml:li[contains(@style,'footnote') or contains(@style,'comment') or contains(@style ,'endnote')][count(child::*) = 0]"/>
<!--    <xsl:template match="xhtml:li/xhtml:ul|xhtml:li/xhtml:ol"/>-->
    
    <!-- template to copy the rest of the nodes -->
    <xsl:template match="comment()| processing-instruction()">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="comment()[(contains(.,'mso-style-name:'))]">
        <xsl:variable name="element" select="."/>
        <xsl:value-of select="$element" disable-output-escaping="yes"/>
    </xsl:template>
    
    <!--<xsl:strip-space elements="*"/>
    <xsl:template match="@*|node()">
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="xhtml:html">
        <xsl:element name="root">
        <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>-->
    <xsl:template match="comment()">
        <xsl:value-of select="." disable-output-escaping="yes" />
    </xsl:template>
    <xsl:template match="//xhtml:p//xhtml:math[child::xhtml:math]"/>
    <xsl:template match="//math[child::math]"/>
    <xsl:template match="xhtml:style[preceding::xhtml:style]"/>
</xsl:stylesheet>