<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xhtml="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs" version="2.0">

    <xsl:output indent="no" method="xml"/>

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
    <xsl:strip-space elements="xhtml:table"/>
    <xsl:strip-space elements="xhtml:tbody"/>
    <xsl:strip-space elements="xhtml:ol"/>
    <xsl:strip-space elements="xhtml:head"/>
    <xsl:strip-space elements="xhtml:ul"/>
    <xsl:strip-space elements="xhtml:body"/>
    <xsl:strip-space elements="xhtml:commentreference"/>
    <xsl:strip-space elements="xhtml:comment"/>

    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <!--    changed the pattern from [\n\t+|\n] to \n\t+|\n, becaue in the previous version, it is also removing the | symbol from the text-->
    
    <!-- This condition is added to remove unnecessary line breaks and tabs intrdouced by Ckeditor during wyciwyg process, 
        This is a temporary solution, it is better to solve problem in the CKeditor itself   -->
    <xsl:template match="text()">
        <xsl:analyze-string select="." regex="\n\t+|\n">
            <xsl:matching-substring>
                <xsl:value-of select="''" xml:space="preserve"/>
            </xsl:matching-substring>
            <xsl:non-matching-substring>
                <xsl:value-of select="." xml:space="preserve"/>
            </xsl:non-matching-substring>
        </xsl:analyze-string>
    </xsl:template>

    <xsl:template
        match="xhtml:h1 | xhtml:h2 | xhtml:h3 | xhtml:h4 | xhtml:h5 | xhtml:h6 | xhtml:p | xhtml:li | h1 | h2 | h3 | h4 | h5 | h6 | p | li">
       <!-- <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:attribute name="data-bkmark" select="descendant::*[@data-bkmark][1]/@data-bkmark"/>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>-->
        <!--  changing all the elements to 'p' because in daisydiff the 'p' followed by 'li' was having problem  because of the tags   -->
        <xsl:element name="p">
                <xsl:apply-templates select="@*"/>
            <xsl:attribute name="data-bkmark" select="descendant::*[@data-bkmark][1]/@data-bkmark"/>
            <xsl:apply-templates select="node()"/>
            
        </xsl:element>
    </xsl:template>


    <xsl:template match="br | xhtml:br">
        <!-- added this new condition on 17.12.2018, removing the br when it has data-change attribute caused problem in updateuntrackedchanges method in java       -->
        <xsl:choose>
            <xsl:when test="@data-change = 'soft-enter'">
                <!-- don't have to add this information               -->
                <!--<xsl:value-of select="' '" disable-output-escaping="yes"/>-->
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="'&#8232;'" disable-output-escaping="yes"/>
                
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>

    <!--<xsl:template match="xhtml:ol|xhtml:ul|xhtml:div|xhtml:del| del | xhtml:b[@data-change = 'changestyle']| xhtml:span[@data-change = 'changestyle'] | xhtml:i[@data-change = 'changestyle'] | xhtml:span[@data-change = 'commentGroup']|xhtml:img[@data-commentimg]">-->
    <xsl:template
        match="xhtml:table | xhtml:tr | xhtml:td | xhtml:tbody | xhtml:ol | xhtml:ul | xhtml:div | xhtml:del | del | xhtml:b[@data-change = 'changestyle']|xhtml:span[not(@data-name) or not(@class) or not(@style)] 
        | xhtml:span[@data-change = 'changestyle'] | xhtml:strike[@data-change = 'changestyle'] | xhtml:strong[@data-change = 'changestyle'] | xhtml:small[@data-change = 'changestyle'] 
        | xhtml:sub[@data-change = 'changestyle'] | xhtml:sup[@data-change = 'changestyle'] | xhtml:i[@data-change = 'changestyle'] | xhtml:span[@data-change = 'commentGroup'] 
        | xhtml:img[@data-commentimg]|table | tr | td | tbody | ol | ul | div | del | del | b[@data-change = 'changestyle']
        | span[@data-change = 'changestyle'] | strike[@data-change = 'changestyle'] | strong[@data-change = 'changestyle'] | small[@data-change = 'changestyle'] 
        | sub[@data-change = 'changestyle'] | sup[@data-change = 'changestyle'] | i[@data-change = 'changestyle'] | span[@data-change = 'commentGroup'] 
        | img[@data-commentimg]| span[not(@data-name) or not(@class) or not(@style)] ">
        <xsl:apply-templates/>
    </xsl:template>


    <!--<xsl:template match="xhtml:cols|xhtml:table/xhtml:span"/>-->
    <xsl:template
        match="xhtml:colgroup | xhtml:cols | xhtml:table/xhtml:span | xhtml:span[@data-bkmark]|colgroup | cols | table/span | span[@data-bkmark]"/>
    <xsl:template
        match="xhtml:h1[not(descendant::*[@data-bkmark])] | xhtml:h2[not(descendant::*[@data-bkmark])] | xhtml:h3[not(descendant::*[@data-bkmark])] 
        | xhtml:h4[not(descendant::*[@data-bkmark])] | xhtml:h5[not(descendant::*[@data-bkmark])] | xhtml:h6[not(descendant::*[@data-bkmark])] 
        | xhtml:p[not(descendant::*[@data-bkmark])] | xhtml:li[not(descendant::*[@data-bkmark])]|h1[not(descendant::*[@data-bkmark])] | h2[not(descendant::*[@data-bkmark])] | h3[not(descendant::*[@data-bkmark])] 
        | h4[not(descendant::*[@data-bkmark])] | h5[not(descendant::*[@data-bkmark])] | h6[not(descendant::*[@data-bkmark])] 
        | p[not(descendant::*[@data-bkmark])] | li[not(descendant::*[@data-bkmark])]"/>

    <!--  removing all the attributes except data-bkmark attribute  -->
    <!--<xsl:template match="@*[(not((name(.) = 'data-bkmark'))) and (not((name(.) = 'data-name')))][not(parent::xhtml:img)]"/>-->
    <xsl:template match="@*[(not((name(.) = 'data-name')))][not(parent::xhtml:img|parent::img)]"/>
    <!--<xsl:template match="@*[(not((name(.) = 'data-name')))][not(parent::xhtml:img)]"/>-->



    <!--<xsl:template match="*[following-sibling::xhtml:body] | xhtml:ins | ins | *[@data-change = 'parainserted'] | *[@data-change = 'cell_added'] | *[@data-change = 'rowinserted']| *[@data-change = 'soft-enter'] | *[@data-cellpara]"/>-->
    <xsl:template
        match="*[following-sibling::xhtml:body] | xhtml:ins | ins | *[@data-change = 'parainserted'] | *[@data-change = 'cell_added'] | *[@data-change = 'rowinserted'] | *[@data-cellpara]|@data-change"
    />
</xsl:stylesheet>