<?xml version="1.0" encoding="UTF-8"?>
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
    xmlns:a14="http://schemas.microsoft.com/office/drawing/2010/main" version="2.0">
    
    <xsl:strip-space elements="*"/>    
    <xsl:preserve-space elements="*"/>

    <xsl:key name="page" match="Page" use="PageH"/>
    <xsl:key name="margin" match="Margin" use="Top"/>
    
        <xsl:template match="node()|@*">
            <xsl:copy>
                <xsl:apply-templates select="node()|@*"/>
            </xsl:copy>
        </xsl:template>
    
    <xsl:template match="Page[generate-id() != generate-id(key('page',PageH)[1])]"/>
    <xsl:template match="Margin[generate-id() != generate-id(key('margin',Top)[1])]"/>
    
    <xsl:template match="Page">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="Margin">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="w:t">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
       
       
    <xsl:template match="w:t/text()[contains(.,'&#x2028;') or contains(.,'&#8232;') or contains(.,'­') or contains(.,' ') or contains(.,' ')]">
        <xsl:variable name="parentRunProperties">
            <xsl:if test="parent::w:t/parent::w:r/w:rPr">
                <!--<xsl:copy-of select="parent::w:t/parent::w:r/w:rPr"/>-->
                <xsl:value-of select="'&lt;w:rPr&gt;'" disable-output-escaping="yes"/>
                <xsl:for-each select="parent::w:t/parent::w:r/w:rPr/child::*">
                    <xsl:value-of select="concat('&lt;',name(.))"/>
                    <xsl:for-each select="./@*">
                        <xsl:value-of select="concat(' ',name(.),'=&quot;',.,'&quot;')" disable-output-escaping="yes"/>
                    </xsl:for-each>
                    <xsl:value-of select="'&gt;'" disable-output-escaping="yes"/>
                    <xsl:apply-templates select="."/>
                    <xsl:value-of select="concat('&lt;/',name(.),'&gt;')" disable-output-escaping="yes"/>
                </xsl:for-each>
                <xsl:value-of select="'&lt;/w:rPr&gt;'" disable-output-escaping="yes"/>
            </xsl:if>
        </xsl:variable>
        <xsl:variable name="parent">
            <xsl:value-of select="./parent::*/parent::*/name()"/>
        </xsl:variable>
        <xsl:variable name="prefix">
            <xsl:choose>
                <xsl:when test="$parent ='w:r'">
                    <xsl:text disable-output-escaping="yes">&lt;/w:t&gt;&lt;/w:r&gt;</xsl:text><xsl:text disable-output-escaping="yes">&lt;w:r&gt;</xsl:text><xsl:value-of select="$parentRunProperties" disable-output-escaping="yes"/>
                </xsl:when>
                <xsl:when test="$parent ='w:sdtContent'">
                    <xsl:text disable-output-escaping="yes">&lt;/w:t&gt;</xsl:text>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="suffix">
            <xsl:choose>
                <xsl:when test="$parent ='w:r'">
                    <xsl:text disable-output-escaping="yes">&lt;/w:r&gt;&lt;w:r&gt;</xsl:text>
                    <xsl:value-of select="$parentRunProperties" disable-output-escaping="yes"/>
                    <xsl:text disable-output-escaping="yes">&lt;w:t xml:space="preserve"&gt;</xsl:text>
                </xsl:when>
                <xsl:when test="$parent ='w:sdtContent'">
                    <xsl:text disable-output-escaping="yes">&lt;w:t xml:space="preserve"&gt;</xsl:text>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        <xsl:analyze-string select="." regex="(&#8232;)|(­)|( )|( )|(&#x2028;)">
            <xsl:matching-substring>
                <xsl:if test="regex-group(1) or regex-group(5)">
                    <!--<xsl:text disable-output-escaping="yes">&lt;w:br/&gt;</xsl:text>-->
                    <xsl:text disable-output-escaping="yes">&lt;/w:t&gt;</xsl:text><xsl:text disable-output-escaping="yes">&lt;br/&gt;</xsl:text><xsl:text disable-output-escaping="yes">&lt;w:t xml:space="preserve"&gt;</xsl:text>
                </xsl:if>
                <xsl:if test="regex-group(2)">
                    <xsl:text disable-output-escaping="yes">&lt;/w:t&gt;</xsl:text><xsl:text disable-output-escaping="yes">&lt;w:softHyphen/&gt;</xsl:text><xsl:text disable-output-escaping="yes">&lt;w:t xml:space="preserve"&gt;</xsl:text>
                </xsl:if>
                <xsl:if test="regex-group(3)">
                    <!--<xsl:text disable-output-escaping="yes">&lt;/w:t&gt;&lt;/w:r&gt;</xsl:text><xsl:text disable-output-escaping="yes">&lt;w:r&gt;</xsl:text><xsl:value-of select="$parentRunProperties" disable-output-escaping="yes"/><xsl:text disable-output-escaping="yes">&lt;w:t&gt; &lt;/w:t&gt;</xsl:text><xsl:text disable-output-escaping="yes">&lt;/w:r&gt;&lt;w:r&gt;</xsl:text><xsl:value-of select="$parentRunProperties" disable-output-escaping="yes"/><xsl:text disable-output-escaping="yes">&lt;w:t xml:space="preserve"&gt;</xsl:text>-->
                    <xsl:choose>
                        <xsl:when test="$parent ='w:r'">
                            <xsl:text disable-output-escaping="yes">&lt;/w:t&gt;&lt;/w:r&gt;</xsl:text><xsl:text disable-output-escaping="yes">&lt;w:r&gt;</xsl:text><xsl:value-of select="$parentRunProperties" disable-output-escaping="yes"/>
                        </xsl:when>
                        <xsl:when test="$parent ='w:sdtContent'">
                            <xsl:text disable-output-escaping="yes">&lt;/w:t&gt;</xsl:text>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:text disable-output-escaping="yes">&lt;w:t&gt; &lt;/w:t&gt;</xsl:text>
                    <xsl:choose>
                        <xsl:when test="$parent ='w:r'">
                            <xsl:text disable-output-escaping="yes">&lt;/w:r&gt;&lt;w:r&gt;</xsl:text><xsl:value-of select="$parentRunProperties" disable-output-escaping="yes"/><xsl:text disable-output-escaping="yes">&lt;w:t xml:space="preserve"&gt;</xsl:text>
                        </xsl:when>
                        <xsl:when test="$parent ='w:sdtContent'">
                            <xsl:text disable-output-escaping="yes">&lt;w:t xml:space="preserve"&gt;</xsl:text>
                        </xsl:when>
                    </xsl:choose>
                </xsl:if>
                <xsl:if test="regex-group(4)">
                    <!--<xsl:text disable-output-escaping="yes">&lt;/w:t&gt;&lt;/w:r&gt;</xsl:text><xsl:text disable-output-escaping="yes">&lt;w:r&gt;</xsl:text><xsl:value-of select="$parentRunProperties" disable-output-escaping="yes"/><xsl:text disable-output-escaping="yes">&lt;w:t&gt; &lt;/w:t&gt;</xsl:text><xsl:text disable-output-escaping="yes">&lt;/w:r&gt;&lt;w:r&gt;</xsl:text><xsl:value-of select="$parentRunProperties" disable-output-escaping="yes"/><xsl:text disable-output-escaping="yes">&lt;w:t xml:space="preserve"&gt;</xsl:text>-->
                    <xsl:choose>
                        <xsl:when test="$parent ='w:r'">
                            <xsl:text disable-output-escaping="yes">&lt;/w:t&gt;&lt;/w:r&gt;</xsl:text><xsl:text disable-output-escaping="yes">&lt;w:r&gt;</xsl:text><xsl:value-of select="$parentRunProperties" disable-output-escaping="yes"/>
                        </xsl:when>
                        <xsl:when test="$parent ='w:sdtContent'">
                            <xsl:text disable-output-escaping="yes">&lt;/w:t&gt;</xsl:text>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:text disable-output-escaping="yes">&lt;w:t&gt; &lt;/w:t&gt;</xsl:text>
                    <xsl:choose>
                        <xsl:when test="$parent ='w:r'">
                            <xsl:text disable-output-escaping="yes">&lt;/w:r&gt;&lt;w:r&gt;</xsl:text><xsl:value-of select="$parentRunProperties" disable-output-escaping="yes"/><xsl:text disable-output-escaping="yes">&lt;w:t xml:space="preserve"&gt;</xsl:text>
                        </xsl:when>
                        <xsl:when test="$parent ='w:sdtContent'">
                            <xsl:text disable-output-escaping="yes">&lt;w:t xml:space="preserve"&gt;</xsl:text>
                        </xsl:when>
                    </xsl:choose>
                </xsl:if>
            </xsl:matching-substring>
            <xsl:non-matching-substring>
                <xsl:value-of select="."/>
            </xsl:non-matching-substring>
        </xsl:analyze-string>

    </xsl:template>
    
    <xsl:template match="w:p[descendant::w:pict/v:shape[descendant::w:pict/v:shape]]">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
        <xsl:for-each select="descendant::w:p[descendant::w:pict/v:shape]">
            <xsl:for-each select="descendant::w:pict">
               <xsl:element name="w:p">
                   <xsl:element name="w:r">
                     <xsl:copy>
                         <xsl:apply-templates select="@*|node()"/>
                     </xsl:copy>
                   </xsl:element>
            </xsl:element>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>
    
<!--    <xsl:template match="w:p[descendant::w:pict/v:shape][ancestor::w:pict]">-->
    <xsl:template match="w:pict[ancestor::w:pict]">
        <xsl:comment>
            <xsl:copy-of select="."></xsl:copy-of>
        </xsl:comment>
    </xsl:template>
    
    <!-- taking care of the textboxes without seperate w:r   -->
    <!--<xsl:template match="w:pict[parent::w:r]">
       <xsl:variable name="rprProp" select="parent::w:r/w:rPr"/>
        <xsl:variable name="count">
            <xsl:variable name="genCount">
                <xsl:value-of select="count(parent::w:r/child::*) - 1"/>    
            </xsl:variable>
            <xsl:variable name="remRprBkcount">
                <xsl:variable name="rpr">
                    <xsl:choose>
                        <xsl:when test="parent::w:r/child::w:rPr">
                            <xsl:value-of select="$genCount - 1"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$genCount"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="bKStart">
                    <xsl:choose>
                        <xsl:when test="parent::w:r/child::w:bookmarkStart">
                            <xsl:value-of select="$rpr - 1"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$rpr"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="bKend">
                    <xsl:choose>
                        <xsl:when test="parent::w:r/child::w:bookmarkEnd">
                            <xsl:value-of select="$bKStart - 1"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$bKStart"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:value-of select="$bKend"/>
            </xsl:variable>
        <xsl:value-of select="$remRprBkcount"/>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$count &gt; 0">
                <xsl:text disable-output-escaping="yes">&lt;/w:r&gt;</xsl:text>
                <xsl:text disable-output-escaping="yes">&lt;w:r&gt;</xsl:text>
                <xsl:copy-of select="$rprProp"/>
                <xsl:copy>
                    <xsl:apply-templates select="node()|@*"/>
                </xsl:copy>
                <xsl:text disable-output-escaping="yes">&lt;/w:r&gt;</xsl:text>
                <xsl:text disable-output-escaping="yes">&lt;w:r&gt;</xsl:text>
                <xsl:copy-of select="$rprProp"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="node()|@*"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>-->
    <!-- taking care of the textboxes without seperate w:r   -->
  
    <!-- Function for looping -->
    <!-- Removing the namespaces while copying the tab character.   -->
    
    <xsl:template match="w:tab">
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
        
    <!-- cleaning up the xml before going to document.xml       -->
    <xsl:template match="w:r[(count(child::*) - 1) &lt;= 0]|w:r[child::w:t][((count(child::*) - 1) &lt;= 1) and (string-length(child::w:t[1]) = 0)]"/>
    
</xsl:stylesheet>