<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf"
    xmlns:xhtml="http://www.w3.org/1999/xhtml" exclude-result-prefixes="xs mf xhtml" version="2.0">


    <xsl:output method="xml"/>
    <xsl:template match="*">
        <xsl:element name="{local-name()}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>

    <!-- template to copy attributes -->
    <xsl:template match="@*">
        <xsl:attribute name="{local-name()}">
            <xsl:value-of select="."/>
        </xsl:attribute>
    </xsl:template>

    <!-- template to copy the rest of the nodes -->
    <xsl:template match="text()">
        <xsl:copy/>
    </xsl:template>

    <xsl:template
        match="xhtml:tr[@data-change = 'row_delete'] | xhtml:td[@data-change = 'column_deleted'] | xhtml:td[@data-change = 'cell_delete'] | tr[@data-change = 'row_delete'] | td[@data-change = 'column_deleted'] | td[@data-change = 'cell_delete']"/>

    <xsl:template
        match="xhtml:td[ancestor::xhtml:tr[1][not(@data-change = 'row_delete' or @data-change = 'rowinserted') and preceding-sibling::xhtml:tr[@data-change = 'rowinserted']]][not(@data-change = 'cell_delete' or @data-change = 'column_deleted' or @data-change = 'cell_added')] |
        td[ancestor::tr[1][not(@data-change = 'row_delete' or @data-change = 'rowinserted') and preceding-sibling::tr[@data-change = 'rowinserted']]][not(@data-change = 'cell_delete' or @data-change = 'column_deleted' or @data-change = 'cell_added')] |
        xhtml:td[ancestor::xhtml:tr[1][not(@data-change = 'row_delete' or @data-change = 'rowinserted') and preceding-sibling::xhtml:tr[@data-change = 'row_delete']]][not(@data-change = 'cell_delete' or @data-change = 'column_deleted' or @data-change = 'cell_added')] |
        td[ancestor::tr[1][not(@data-change = 'row_delete' or @data-change = 'rowinserted') and preceding-sibling::tr[@data-change = 'row_delete']]][not(@data-change = 'cell_delete' or @data-change = 'column_deleted' or @data-change = 'cell_added')] |
        td[(@data-change = 'cell_merged')]|xhtml:td[(@data-change = 'cell_merged')]|
        xhtml:td[not(@data-change = 'cell_delete' or @data-change = 'column_deleted' or @data-change = 'cell_added') and preceding-sibling::xhtml:td[(@data-change = 'cell_merged')]]| 
        td[not(@data-change = 'cell_delete' or @data-change = 'column_deleted' or @data-change = 'cell_added') and preceding-sibling::td[(@data-change = 'cell_merged')]]|
        xhtml:td[not(@data-change = 'cell_delete' or @data-change = 'column_deleted' or @data-change = 'cell_added') and preceding-sibling::xhtml:td[(@data-change = 'cell_delete' or @data-change = 'column_deleted' or @data-change = 'cell_added')]]| 
        td[not(@data-change = 'cell_delete' or @data-change = 'column_deleted' or @data-change = 'cell_added') and preceding-sibling::td[(@data-change = 'cell_delete' or @data-change = 'column_deleted' or @data-change = 'cell_added')]]">
           <td>
               <xsl:for-each select="@*">
                   <xsl:attribute name="{name(.)}" select="."/>
               </xsl:for-each>
               <xsl:attribute name="wCellNo" select="'CellNumChanged'"/>
               <xsl:apply-templates/>
           </td>
    </xsl:template>
    <!--    <xsl:template match="comment()| processing-instruction()">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>-->
</xsl:stylesheet>