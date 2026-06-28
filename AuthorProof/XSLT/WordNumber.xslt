<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf" exclude-result-prefixes="xs mf" 
    xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
    xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"
    xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" xmlns:v="urn:schemas-microsoft-com:vml"
    xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing" xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" 
    xmlns:w10="urn:schemas-microsoft-com:office:word" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml" xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup" 
    xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk" xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml"
    xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape"  xmlns:idPkg="http://ns.adobe.com/AdobeInDesign/idml/1.0/packaging" version="3.0">
    
    <xsl:strip-space elements="*"/>
    <xsl:preserve-space elements="Content"/>
    <!-- Cell Existence check   -->
    <xsl:variable name="Idmlpara" select="document('Idmlpara.xml')"/>
    <!-- Cell Existence check   -->
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="CharacterStyleRange">
        <xsl:variable name="Number">
        <xsl:choose>
            <xsl:when test="(ancestor::Change[1]/@ChangeType = 'InsertedText')"/>
            <xsl:when test="(ancestor::Change[1]/@ChangeType = 'MovedText')"/>
            <xsl:when test="(ancestor::Note)"/>
           <!-- <xsl:when test="not(descendant::Content)">
                <xsl:value-of select="'NoContent'"/>
            </xsl:when>-->
            <xsl:otherwise>
                
                <xsl:number level="any"/>
            </xsl:otherwise>
        </xsl:choose>
        </xsl:variable>
        <xsl:variable name="SelfD" select="@SelfD"/>
        <xsl:copy>
                    <xsl:attribute name="WordNumber">
                        <xsl:value-of select="concat($SelfD,$Number)"/>
                    </xsl:attribute>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>    
    
    <!-- Cell Existence check   -->
    <xsl:template match="Table">
        <xsl:variable name="CellNameArray">
            <xsl:for-each select="Cell">
                <xsl:choose>
                    <xsl:when test="position() = last()">
                        <xsl:value-of select="./@Name"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="concat(./@Name,',')"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </xsl:variable>
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
            
            <!-- Deleted cell -->
            <xsl:for-each select="$Idmlpara//Table">
            <!-- Add table no validation before go in live -->
                <xsl:for-each select="./Cell/@Name">
                    <xsl:choose>
                        <xsl:when test="not(contains($CellNameArray,.))">
                            <xsl:element name="DeletedCell">
                                <xsl:attribute name="name" select="."/>
                            </xsl:element>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:for-each>
            <!-- Deleted cell -->
            
        </xsl:copy>
    </xsl:template>
    <!-- Cell Existence check   -->
    
    <xsl:template match="CharacterStyleRange/@SelfD"/>
    
</xsl:stylesheet>