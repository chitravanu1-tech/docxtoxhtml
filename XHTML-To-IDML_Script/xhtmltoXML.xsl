<!--New Update tdCount{17.02.2017}-->
<!-- Added to revove the tab space between li and p on 3-12-2021 -->
<!-- Added to revove the tab space between li and p on 6-1-2021 -->
<!-- Added for paneer indd on 21-2-2022 -->
<!-- Added to remove grammarly-editor-plugin on 27-6-2022 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs xhtml" 
    xmlns:xhtml="http://www.w3.org/1999/xhtml"
    version="2.0">
    
    <xsl:output method="xml"/>
    <!--<xsl:preserve-space elements="*"/>-->
    <xsl:preserve-space elements="span"/>
    <xsl:preserve-space elements="p"/>
    <xsl:preserve-space elements="h1"/>
    <xsl:preserve-space elements="h2"/>
    <xsl:preserve-space elements="h3"/>
    <xsl:preserve-space elements="h4"/>
    <xsl:preserve-space elements="h5"/>
    <xsl:preserve-space elements="h6"/>
    <xsl:preserve-space elements="li"/>
    <xsl:preserve-space elements="title"/>
    <!-- Added to revove the tab space between li and p on 6-1-2021 -->
    <xsl:strip-space elements="table"/>
    <xsl:strip-space elements="div"/>
    <!-- End -->
    <xsl:strip-space elements="td"/>
    <xsl:strip-space elements="tr"/>
    <xsl:strip-space elements="tbody"/>
    <xsl:strip-space elements="ol"/>
    <xsl:strip-space elements="head"/>
    <xsl:strip-space elements="ul"/>
    <xsl:strip-space elements="body"/>
    


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
    
    <xsl:template match="text()">
        <xsl:analyze-string select="." regex="\n">
<!--        <xsl:analyze-string select="." regex="(\n)|(.&#x000A;)|(&#x0A;)|(&#10;)|(&#13;)|(&#xA;)">-->
            <xsl:matching-substring>
                <xsl:value-of select="''" xml:space="preserve"/>
            </xsl:matching-substring>
            <xsl:non-matching-substring>
                <xsl:value-of select="." xml:space="preserve"/>
            </xsl:non-matching-substring>
        </xsl:analyze-string>
    </xsl:template>
    
    <!-- Added to revove the tab space between li and p on 3-12-2021 -->
    <!--<xsl:template match="li[@class='endnotecaption']/p/text()[not(parent::span[@style = 'padding-left:68px;' or @style = 'padding-left: 68px;' or @data-tab = 'true'])]">  
        <xsl:value-of select="translate(.,'&#x9;|&#xa;','')"/>
    </xsl:template>-->
    <!-- Added to revove the tab space between li and p on 6-1-2021 -->
    <xsl:template match="li[@class='endnotecaption'][child::p]">
        <xsl:element name="li">
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates select="child::*"/>
        </xsl:element>
    </xsl:template>
    <!-- End -->
    
   <!-- <xsl:template priority=".7" match="text()[position()=1 and not((ancestor::node()/@xml:space)[position()=last()]='preserve')]">
        <xsl:value-of select="normalize-space()"/>
        <xsl:if test="normalize-space(substring(., string-length(.))) = ''">
<!-\-            <xsl:text> </xsl:text>-\->
        </xsl:if>
    </xsl:template>-->
    
    <!-- removing dummy OL and LI   -->
    <!-- class condition was added on 6.7.2017    -->
    <xsl:template match="xhtml:ol[@type ='dummy']|xhtml:ol[@type ='dummy']/xhtml:li|xhtml:ol[@class ='dummy']|xhtml:ol[@class ='dummy']/xhtml:li">
        <xsl:apply-templates/>
    </xsl:template>
    <!-- removing dummy OL and LI text  -->
    <!-- class condition was added on 6.7.2017    -->
    <xsl:template match="xhtml:ol[@type ='dummy']/text()|xhtml:ol[@type ='dummy']/xhtml:li/text()|xhtml:ol[@class ='dummy']/text()|xhtml:ol[@class ='dummy']/xhtml:li/text()"/>
    
    <xsl:template match="xhtml:li">
        <xsl:element name="li">
            <xsl:apply-templates select="@*|node() except child::xhtml:ol" />
        </xsl:element>
        <xsl:apply-templates select="xhtml:ol"/>
    </xsl:template>
    
    <!-- template to copy the rest of the nodes -->
    <xsl:template match="comment()| processing-instruction()">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
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
    <xsl:template match="td">
        <xsl:choose>
            <xsl:when test="@added">
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
        
        
</xsl:template>
    <!--New Update tdCount{17.02.2017}-->
    <xsl:template match="table">
        <xsl:copy>
            <xsl:attribute name="maxtd" select="./max(tr/@tdcount)"/>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
<xsl:template match="td/@rowspan">
		  <xsl:variable name="row" select="."/>
    
				<xsl:attribute name="rowspan">
				    <xsl:value-of select="$row + 1"/><!--pls check and confirm 13.09.2017-->
				</xsl:attribute>
    
</xsl:template>
    <!-- Added for paneer indd on 21-2-2022 -->
    <!-- commented for Azure 5607 on 07-12-2022 -->
    <!--<xsl:template match="p[contains(lower-case(@class),'source')][preceding-sibling::*[1][self::figcaption/p[contains(lower-case(@class),'source')]]]"/>-->
    <!-- Added to remove grammarly-editor-plugin on 27-6-2022 -->
    <xsl:template match="grammarly-editor-plugin">
        <xsl:apply-templates select="body"/>
    </xsl:template>
    <!-- added to remove the empty para for indd on 12-7-2024 Azure 15087 -->
    <xsl:template match="p[string-length(normalize-space(.)) =0][not(descendant::img)][not(descendant::Comment)]"/>
    </xsl:stylesheet>