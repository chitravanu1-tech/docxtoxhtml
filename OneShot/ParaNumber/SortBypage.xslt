<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf" exclude-result-prefixes="xs mf" 
    xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
    xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"
    xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" xmlns:v="urn:schemas-microsoft-com:vml"
    xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing" xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" 
    xmlns:w10="urn:schemas-microsoft-com:office:word" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml" xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup" 
    xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk" xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml"
    xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape" version="2.0">
    
    <xsl:preserve-space elements="*"/>
        
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
       
    <!--<xsl:template match="document">
        <xsl:variable name="pageValue">
            <xsl:for-each select="//@PageValue">
                <xsl:value-of select="."/>
            </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="paraValue">
            <xsl:for-each select="//@Para">
                <xsl:value-of select="."/>
            </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="YValue">
            <xsl:for-each select="//@YValue">
                <xsl:value-of select="."/>
            </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="XValue">
            <xsl:for-each select="//@XValue">
                <xsl:value-of select="."/>
            </xsl:for-each>
        </xsl:variable>
       

          <xsl:copy>
               <xsl:choose>
                  <xsl:when test="not(matches($pageValue,'^\d+$'))">
                      <xsl:apply-templates select="@*|node()"/>                      
                  </xsl:when>
                  <xsl:otherwise>
                      <xsl:apply-templates select="@*|node()">
                          <xsl:sort select="number(./@PageValue)" data-type="number" order="ascending"/>
                          <xsl:sort select="number(./@ColumnValue)" data-type="number" order="ascending"/>
                          <xsl:sort select="number(./@YValue)" data-type="number" order="ascending"/>
                          <xsl:sort select="number(./@XValue)" data-type="number" order="ascending"/>                          
                      </xsl:apply-templates>
                  </xsl:otherwise>
              </xsl:choose>
       		 <!-\-<xsl:apply-templates select="@*|node()">
                  <xsl:sort select="number(./@PageValue)"/>
                  <xsl:sort select="number(./@YValue)" data-type="number"/>
                  <xsl:sort select="number(./@XValue)" data-type="number"/>
              </xsl:apply-templates>-\->
          </xsl:copy>
    </xsl:template>
    
    <xsl:template match="w:sdtContent[not(ancestor::li) or not(ancestor::p) or not(ancestor::span) or not(ancestor::a)]">
        <xsl:variable name="pageValue">
            <xsl:variable name="page"/>
            <xsl:for-each select="//@PageValue">
                <xsl:value-of select="."/>
            </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="paraValue">
            <xsl:for-each select="//@Para">
                <xsl:value-of select="."/>
            </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="YValue">
            <xsl:for-each select="//@YValue">
                <xsl:value-of select="."/>
            </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="XValue">
            <xsl:for-each select="//@XValue">
                <xsl:value-of select="."/>
            </xsl:for-each>
        </xsl:variable>
        
        <xsl:copy>
            <xsl:choose>
                <xsl:when test="not(matches($pageValue,'^\d+$'))">
                    <xsl:apply-templates select="@*|node()"/>                      
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select="@*|node()">
                        <xsl:sort select="number(./@PageValue)" data-type="number" order="ascending"/>
                        <xsl:sort select="number(./@ColumnValue)" data-type="number" order="ascending"/>
                        <xsl:sort select="number(./@YValue)" data-type="number" order="ascending"/>
                        <xsl:sort select="number(./@XValue)" data-type="number" order="ascending"/>                        
                    </xsl:apply-templates>
                </xsl:otherwise>
            </xsl:choose>

        </xsl:copy>
    </xsl:template>-->
        
    
    <xsl:template match="Group">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="w:sdt[w:sdtPr/w:alias/@w:val = 'Content Control'][count(w:sdtContent/child::*)&lt;= 0]"></xsl:template>
    
</xsl:stylesheet>