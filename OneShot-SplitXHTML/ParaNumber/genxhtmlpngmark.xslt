<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf" exclude-result-prefixes="xs mf" 
    xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
    xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"
    xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" xmlns:v="urn:schemas-microsoft-com:vml"
    xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing" xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" 
    xmlns:w10="urn:schemas-microsoft-com:office:word" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml" xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup" 
    xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk" xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml"
    xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape"  xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" 
    xmlns:math="http://exslt.org/math" extension-element-prefixes="math" xmlns:pic="http://schemas.openxmlformats.org/drawingml/2006/picture"
    xmlns:a14="http://schemas.microsoft.com/office/drawing/2010/main" xmlns:idPkg="http://ns.adobe.com/AdobeInDesign/idml/1.0/packaging" 
    xmlns:num="http://whatever"
    version="2.0">
    
    <xsl:output method="xml" name="xml" xml:space="preserve"/>

    <xsl:template match="@*|node()">        
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy> 
    </xsl:template>
    <!--<xsl:template match="XMLElement[@MarkupTag='XMLTag/png']">
        <xsl:if test="parent::CharacterStyleRange">
            <xsl:text disable-output-escaping="yes">&lt;/CharacterStyleRange&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="ancestor::XMLElement">
            <xsl:text disable-output-escaping="yes">&lt;/XMLElement&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="ancestor::ParagraphStyleRange">
            <xsl:text disable-output-escaping="yes">&lt;/ParagraphStyleRange&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="ancestor::ParagraphStyleRange">
            <xsl:text disable-output-escaping="yes">&lt;ParagraphStyleRange&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="parent::CharacterStyleRange">
            <xsl:text disable-output-escaping="yes">&lt;CharacterStyleRange&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="ancestor::XMLElement">
            <xsl:text disable-output-escaping="yes">&lt;/XMLElement&gt;</xsl:text>
        </xsl:if>
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>-->
    <xsl:template match="XMLElement[@MarkupTag='XMLTag/png'][not(parent::ParagraphStyleRange)]">
           <!--<xsl:if test="parent::*[local-name()]">
            <xsl:variable name="parent"><xsl:value-of select="parent::*/local-name()"/></xsl:variable>
            <xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
                <xsl:value-of select="$parent"/>
            <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
        </xsl:if>
        
        <xsl:if test="parent::*[local-name()]">
            <xsl:variable name="parent"><xsl:value-of select="parent::*/local-name()"/></xsl:variable>
            <xsl:text disable-output-escaping="yes">&lt;</xsl:text>
            <xsl:value-of select="$parent"/>
            <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
        </xsl:if>-->
    <!--<xsl:template match="XMLElement[@MarkupTag='XMLTag/png'][not(parent::ParagraphStyleRange)]">
        <xsl:if test="parent::*[local-name()]">
            <xsl:variable name="parent"><xsl:value-of select="parent::*/local-name()"/></xsl:variable>
            <xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
            <xsl:value-of select="$parent"/>
            <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="ancestor::ParagraphStyleRange[1]">
            <xsl:text disable-output-escaping="yes">&lt;/ParagraphStyleRange&gt;</xsl:text>
        </xsl:if>
        <xsl:text>&#x000A;</xsl:text>
        <xsl:if test="ancestor::ParagraphStyleRange[1]">
            <xsl:text disable-output-escaping="yes">&lt;ParagraphStyleRange&gt;</xsl:text>
        </xsl:if>
        <xsl:if test="parent::*[local-name()]">
            <xsl:variable name="parent"><xsl:value-of select="parent::*/local-name()"/></xsl:variable>
            <xsl:text disable-output-escaping="yes">&lt;</xsl:text>
            <xsl:value-of select="$parent"/>
            <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
        </xsl:if>-->
    
        <xsl:if test="parent::*[local-name()]">
            <xsl:variable name="parent"><xsl:value-of select="parent::*/local-name()"/></xsl:variable>
            <xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
            <xsl:value-of select="$parent"/>
            <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
        </xsl:if>
        
        <xsl:if test="parent::*/ancestor::*[parent::ParagraphStyleRange][local-name()]/local-name()">        
            <xsl:for-each select="parent::*/ancestor::*[parent::ParagraphStyleRange][local-name()]/local-name()">
                
                <xsl:variable name="parent"><xsl:value-of select="."/></xsl:variable>
            <xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
            <xsl:value-of select="$parent"/>
            <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                <xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
                <xsl:value-of select="'ParagraphStyleRange'"/>
                <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
            </xsl:for-each>
        
            <xsl:for-each select="ancestor::*[parent::ParagraphStyleRange or self::ParagraphStyleRange][local-name()]">
                <xsl:variable name="parent"><xsl:value-of select="local-name()"/></xsl:variable>
            <!--<xsl:text disable-output-escaping="yes">&lt;</xsl:text>
            <xsl:value-of select="$parent"/>
            <xsl:text disable-output-escaping="yes">&gt;</xsl:text>-->
                <xsl:text disable-output-escaping="yes">&lt;</xsl:text>
            <xsl:value-of select="$parent"/>
            <xsl:text disable-output-escaping="yes"> Pagesplit="split"&gt;</xsl:text>
            </xsl:for-each>
        </xsl:if>
        <xsl:if test="parent::*[local-name()]">
            <xsl:variable name="parent"><xsl:value-of select="parent::*/local-name()"/></xsl:variable>
            <xsl:text disable-output-escaping="yes">&lt;</xsl:text>
            <xsl:value-of select="$parent"/>
            <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
            
            <!--<xsl:element name="{$parent}">
                <xsl:for-each select="parent::*/@*">
                    <xsl:attribute name="{name()}">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:for-each>
                <xsl:apply-templates/>
            </xsl:element>-->
        </xsl:if>
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>
    
   
    
</xsl:stylesheet>