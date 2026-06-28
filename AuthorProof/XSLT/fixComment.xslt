<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs xhtml"
    xmlns:xhtml="http://www.w3.org/1999/xhtml" version="2.0">

    <xsl:output method="xhtml" indent="no"/>
   

    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
<!--    <xsl:template match="comment()[(starts-with(.,'&lt;!-\-&lt;tr') and contains(.,'data-change=row_delete')) or (starts-with(.,'&lt;!-\-&lt;td') and contains(.,'data-change=column_deleted')) or (starts-with(.,'&lt;!-\-&lt;td') and contains(.,'data-change=cell_delete'))]">-->
    <xsl:template match="comment()[(contains(.,'data-change=&quot;row_delete&quot;')) or contains(.,'data-change=&quot;column_deleted&quot;') or contains(.,'data-change=&quot;cell_delete&quot;') or contains(.,'data-change=&quot;table_delete&quot;')]">
        <xsl:variable name="element" select="."/>
            <xsl:value-of select="$element" disable-output-escaping="yes"/>
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

</xsl:stylesheet>