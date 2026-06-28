<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf"
    exclude-result-prefixes="xs mf"
    xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas"
    xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
    xmlns:o="urn:schemas-microsoft-com:office:office"
    xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"
    xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math"
    xmlns:v="urn:schemas-microsoft-com:vml"
    xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing"
    xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing"
    xmlns:w10="urn:schemas-microsoft-com:office:word"
    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml"
    xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup"
    xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk"
    xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml"
    xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape"
    xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main"
    xmlns:math="http://exslt.org/math" extension-element-prefixes="math"
    xmlns:pic="http://schemas.openxmlformats.org/drawingml/2006/picture"
    xmlns:a14="http://schemas.microsoft.com/office/drawing/2010/main"
    xmlns:idPkg="http://ns.adobe.com/AdobeInDesign/idml/1.0/packaging" xmlns:num="http://whatever"
    version="2.0">
    
    <xsl:output method="xml" indent="yes" />
    
    
    <!--<xsl:variable name="Graphic" select="document('StylesCollection.xml')"/>-->
    
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="stylesList/paragraph">        
        <xsl:copy>
            <xsl:for-each-group select="style" group-by="@replacement"> 
                <xsl:variable name="tag">
                <xsl:value-of select="current-grouping-key()"/>
                </xsl:variable>                
                <xsl:element name="root">
                    <xsl:attribute name="tag">
                        <xsl:value-of select="$tag"/>
                    </xsl:attribute>
                    <xsl:apply-templates select="current-group()" />
                </xsl:element>                
            </xsl:for-each-group>          
        </xsl:copy>   
    </xsl:template>
    <xsl:template match="stylesList/character">        
        <xsl:copy>
            <xsl:for-each-group select="style" group-by="@replacement"> 
                <xsl:variable name="tag">
                    <xsl:value-of select="current-grouping-key()"/>
                </xsl:variable>                
                <xsl:element name="root">
                    <xsl:attribute name="tag">
                        <xsl:value-of select="$tag"/>
                    </xsl:attribute>
                    <xsl:apply-templates select="current-group()" />
                </xsl:element>                
            </xsl:for-each-group>          
        </xsl:copy>   
    </xsl:template>
</xsl:stylesheet>