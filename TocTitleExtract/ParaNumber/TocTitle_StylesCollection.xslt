<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="xml" indent="yes"/>
        
    <xsl:template match="@*|node()">        
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>            
        </xsl:copy> 
    </xsl:template>
    
    <xsl:template match="/">
        <xsl:call-template name="epubStylesColl"/>            
    </xsl:template>
    
    <xsl:template name="epubStylesColl">
       
        <xsl:element name="epub_stylesList">
           
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'BookTitle'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Book_Author'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'SubTitle'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'BookSubTitle'"/>
                </xsl:attribute>
            </xsl:element>
           
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'HalfTitle'"/>
                </xsl:attribute>
            </xsl:element>
           
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Series_Title'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'series_subtitle'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ChapterTitle'"/>
                </xsl:attribute>
            </xsl:element>
           
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ChapterNumber'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TOC_ChapterNumber'"/>
                </xsl:attribute>
            </xsl:element>
           
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TOC_ChapterTitle'"/>
                </xsl:attribute>
            </xsl:element>
           
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TOC_FrontMatter'"/>
                </xsl:attribute>
            </xsl:element>
           
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'TOC_BackMatter'"/>
                </xsl:attribute>
            </xsl:element>
           
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Head1'"/>
                </xsl:attribute>
            </xsl:element>
           
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Head2'"/>
                </xsl:attribute>
            </xsl:element>
           
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Head3'"/>
                </xsl:attribute>
            </xsl:element>
           
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Head4'"/>
                </xsl:attribute>
            </xsl:element>
           
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Head5'"/>
                </xsl:attribute>
            </xsl:element>
           
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Head6'"/>
                </xsl:attribute>
            </xsl:element>
           
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'copyright_first'"/>
                </xsl:attribute>
            </xsl:element>
           
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Copyright'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Series_Heading'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'FrontMatterHeading'"/>
                </xsl:attribute>
            </xsl:element>
           
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'BackMatterHeading'"/>
                </xsl:attribute>
            </xsl:element>
           
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ParaFL'"/>
                </xsl:attribute>
            </xsl:element>
            
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ExtractText'"/>
                </xsl:attribute>
            </xsl:element>
           
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'ManyFigureCaption'"/>
                </xsl:attribute>
            </xsl:element>
           
            <xsl:element name="epub_style">
                <xsl:attribute name="epub_name">
                    <xsl:value-of select="'Figure_Place_Holder'"/>
                </xsl:attribute>
            </xsl:element>
           
        </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>