<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf"
    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    exclude-result-prefixes="xs mf" version="2.0">
    
    <xsl:output method="xml" name="xml" indent="yes" xml:space="preserve" standalone="yes" />
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="Image">
       
<!--        <xsl:variable name="filename" select="'output1/RelsLink.xml'"/>-->
<!--        <xsl:result-document href="{$filename}" format="xml">  -->
            <xsl:element name="Image">
                <xsl:apply-templates/>
            </xsl:element>
        <!--</xsl:result-document>-->
        
    </xsl:template>
    
    <xsl:template match="Relationship">
        <xsl:variable name="relId">
            <xsl:variable name="num">
                <xsl:number level="any"/>
            </xsl:variable>
            <xsl:value-of select="concat('rId',$num)"/>
        </xsl:variable>
        <xsl:copy>
            <xsl:attribute name="Id" select="$relId"/>
            <xsl:attribute name="link" select="@Id"/>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="Relationship/@Id"/>

    
</xsl:stylesheet>