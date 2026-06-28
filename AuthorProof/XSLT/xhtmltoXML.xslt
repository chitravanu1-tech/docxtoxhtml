<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs xhtml"
    xmlns:xhtml="http://www.w3.org/1999/xhtml" version="2.0">

    <xsl:output method="xhtml" indent="no"/>
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
    <xsl:strip-space elements="td"/>
    <xsl:strip-space elements="tr"/>
    <xsl:strip-space elements="tbody"/>
    <xsl:strip-space elements="table"/>
    <xsl:strip-space elements="ol"/>
    <xsl:strip-space elements="head"/>
    <xsl:strip-space elements="ul"/>
    <xsl:strip-space elements="body"/>
    <!-- the following strip space for div is an exceptional case, comment the following if it causes any problem   -->
    <xsl:strip-space elements="div"/>
    <xsl:strip-space elements="commentreference"/>

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
    <xsl:strip-space elements="xhtml:table"/>
    <xsl:strip-space elements="xhtml:ol"/>
    <xsl:strip-space elements="xhtml:head"/>
    <xsl:strip-space elements="xhtml:ul"/>
    <xsl:strip-space elements="xhtml:body"/>
    <!-- the following strip space for div is an exceptional case, comment the following if it causes any problem   -->
    <xsl:strip-space elements="xhtml:div"/>
    <xsl:strip-space elements="xhtml:commentreference"/>

    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

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

    <xsl:template match="xhtml:span[@data-comment] | span[@data-comment]">
        <xsl:variable name="commentId" select="@data-comment"/>
        <xsl:variable name="commentPresent"
            select="boolean(//*[(@data-commentvalue = $commentId) and (descendant-or-self::*/@data-change ='commentadded' or descendant-or-self::*/@data-change ='commentedited')])"/>
        <xsl:variable name="changeVal" select="(//*[(@data-commentvalue = $commentId) and (descendant-or-self::*/@data-change ='commentadded' or descendant-or-self::*/@data-change ='commentedited')]/descendant-or-self::*[@data-change][1]/@data-change)"/>
        <xsl:variable name="span" select="boolean(ancestor::xhtml:span|ancestor::span)"/>
        <xsl:variable name="ins" select="boolean(ancestor::xhtml:ins|ancestor::ins)"/>
        <!--<xsl:message>
            <xsl:value-of select="$commentId,' '"/>
            <xsl:value-of select="$commentPresent,' '"/>
            <xsl:value-of select="$changeVal,' '"/>
            <xsl:value-of select="$ins"/>
        </xsl:message>-->
        <xsl:choose>
            <xsl:when test="$commentPresent = true() and $ins = false()">
                <xsl:choose>
                    <xsl:when test="$span = true()">
                        <xsl:element name="ins">
<!--                            <xsl:attribute name="data-daisyMarker" select="'AuthorProof'"/>-->
<!--                            <xsl:copy>-->
<!--                                <xsl:apply-templates select="@*"/>-->
                                <!--<xsl:apply-templates select="node()"/>-->
                                <xsl:element name="{local-name()}">
                                    <xsl:attribute name="data-change" select="$changeVal"/>
                                    <xsl:apply-templates select="@* | node()" xml:space="preserve"/>
                                </xsl:element>
                            <!--</xsl:copy>-->
                        </xsl:element>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:element name="span">
                            <xsl:element name="ins">
<!--                                <xsl:attribute name="data-daisyMarker" select="'AuthorProof'"/>-->
                                <!--<xsl:copy>
                                    <xsl:apply-templates select="@*"/>
                                    <xsl:attribute name="data-change" select="$changeVal"/>
                                    <xsl:apply-templates select="node()"/>
                                </xsl:copy>-->
                                <xsl:element name="{local-name()}">
                                    <xsl:attribute name="data-change" select="$changeVal"/>
                                    <xsl:apply-templates select="@* | node()" xml:space="preserve"/>
                                </xsl:element>
                            </xsl:element>
                        </xsl:element>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="{local-name()}">
                    <xsl:attribute name="data-change" select="$changeVal"/>
                    <xsl:apply-templates select="@* | node()" xml:space="preserve"/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!--updation to remove dummy td 19.04.2018-->
    <!--<xsl:template match="td[contains(@style, 'display:none') and not(@vmerge='restart')]"/>-->
    <xsl:template match="//xhtml:td[@added or (lower-case(@NewADD) ='yes' and @vmerge and not(@vmerge='restart'))]|//td[@added or (lower-case(@NewADD) ='yes' and @vmerge and not(@vmerge='restart'))]"/>

    <!-- removing dummy OL and LI   -->
    <!-- class condition was added on 6.7.2017-->
    <xsl:template
        match="
            xhtml:ol[@type = 'dummy'] | xhtml:ol[@type = 'dummy']/xhtml:li | xhtml:ol[@class = 'dummy']
            | xhtml:ol[@class = 'nolist']/xhtml:li | xhtml:ol[@type = 'nolist'] | xhtml:ol[@type = 'nolist']/xhtml:li | xhtml:ol[@class = 'nolist'] | xhtml:ol[@class = 'nolist']/xhtml:li">
        <xsl:apply-templates/>
    </xsl:template>
    <!-- removing dummy OL and LI text  -->
    <!-- class condition was added on 6.7.2017    -->
    <xsl:template
        match="
            xhtml:ol[@type = 'dummy']/text() | xhtml:ol[@type = 'dummy']/xhtml:li/text() | xhtml:ol[@class = 'dummy']/text() | xhtml:ol[@class = 'dummy']/xhtml:li/text()
            | xhtml:ol[@type = 'nolist']/text() | xhtml:ol[@type = 'nolist']/xhtml:li/text() | xhtml:ol[@class = 'nolist']/text() | xhtml:ol[@class = 'nolist']/xhtml:li/text()"/>

    <xsl:template match="xhtml:li[not(@data-change)][ancestor::xhtml:li]">
        <xsl:element name="li">
            <!--            <xsl:apply-templates select="@*|node() except child::xhtml:ul,child::xhtml:ol,child::xhtml:ol/*,child::xhtml:ul/*" />-->
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
        <xsl:apply-templates
            select="xhtml:ol[not(@data-change)] | xhtml:ul[not(@data-change)] | xhtml:p[not(@data-change)] | xhtml:h1[not(@data-change)] | xhtml:h2[not(@data-change)] | xhtml:h3[not(@data-change)] | xhtml:h4[not(@data-change)] | xhtml:h5[not(@data-change)] | xhtml:h6[not(@data-change)] | xhtml:title[not(@data-change)]"
            mode="li"/>
    </xsl:template>

    <xsl:template
        match="
            xhtml:ul[parent::xhtml:li] | xhtml:ol[parent::xhtml:li] | xhtml:p[parent::xhtml:li] | xhtml:h1[parent::xhtml:li]
            | xhtml:h2[parent::xhtml:li] | xhtml:h3[parent::xhtml:li] | xhtml:h4[parent::xhtml:li] | xhtml:h5[parent::xhtml:li] | xhtml:h6[parent::xhtml:li]
            | xhtml:title[parent::xhtml:li]"
        mode="li">
        <xsl:element name="{local-name()}">
            <xsl:apply-templates select="@* | node()" xml:space="preserve"/>
        </xsl:element>
    </xsl:template>
    <xsl:template
        match="
            xhtml:ul[parent::xhtml:li] | xhtml:ol[parent::xhtml:li] | xhtml:p[parent::xhtml:li]
            | xhtml:h1[parent::xhtml:li] | xhtml:h2[parent::xhtml:li] | xhtml:h3[parent::xhtml:li] | xhtml:h4[parent::xhtml:li]
            | xhtml:h5[parent::xhtml:li] | xhtml:h6[parent::xhtml:li] | xhtml:title[parent::xhtml:li]">
        <!--<xsl:element name="{local-name()}">
            <xsl:apply-templates select="@* | node()" xml:space="preserve"/>
        </xsl:element>-->
    </xsl:template>

    <!-- removing dummy OL and LI   -->
    <!-- class condition was added on 6.7.2017    -->
    <xsl:template
        match="
            ol[@type = 'dummy'] | ol[@type = 'dummy']/li | ol[@class = 'dummy']
            | ol[@class = 'nolist']/li | ol[@type = 'nolist'] | ol[@type = 'nolist']/li | ol[@class = 'nolist'] | ol[@class = 'nolist']/li">
        <xsl:apply-templates/>
    </xsl:template>
    <!-- removing dummy OL and LI text  -->
    <!-- class condition was added on 6.7.2017    -->
    <xsl:template
        match="
            ol[@type = 'dummy']/text() | ol[@type = 'dummy']/li/text() | ol[@class = 'dummy']/text() | ol[@class = 'dummy']/li/text()
            | ol[@type = 'nolist']/text() | ol[@type = 'nolist']/li/text() | ol[@class = 'nolist']/text() | ol[@class = 'nolist']/li/text()"/>

    <xsl:template match="li[not(@data-change)][ancestor::li]">
        <xsl:element name="li">
            <!--            <xsl:apply-templates select="@*|node() except child::ul,child::ol,child::ol/*,child::ul/*" />-->
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
        <xsl:apply-templates
            select="ol[not(@data-change)] | ul[not(@data-change)] | p[not(@data-change)] | h1[not(@data-change)] | h2[not(@data-change)] | h3[not(@data-change)] | h4[not(@data-change)] | h5[not(@data-change)] | h6[not(@data-change)] | title[not(@data-change)]"
            mode="li"/>
    </xsl:template>

    <xsl:template
        match="
            ul[parent::li] | ol[parent::li] | p[parent::li] | h1[parent::li]
            | h2[parent::li] | h3[parent::li] | h4[parent::li] | h5[parent::li] | h6[parent::li]
            | title[parent::li]"
        mode="li">
        <xsl:element name="{local-name()}">
            <xsl:apply-templates select="@* | node()" xml:space="preserve"/>
        </xsl:element>
    </xsl:template>
    <xsl:template
        match="
            ul[parent::li] | ol[parent::li] | p[parent::li]
            | h1[parent::li] | h2[parent::li] | h3[parent::li] | h4[parent::li]
            | h5[parent::li] | h6[parent::li] | title[parent::li]">
        <!--<xsl:element name="{local-name()}">
            <xsl:apply-templates select="@* | node()" xml:space="preserve"/>
        </xsl:element>-->
    </xsl:template>


    <xsl:template match="comment() | processing-instruction()">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>
