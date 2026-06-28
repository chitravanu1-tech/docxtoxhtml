<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" xmlns:idPkg="http://ns.adobe.com/AdobeInDesign/idml/1.0/packaging"
    version="2.0">
    
    <xsl:output method="xml" name="xml" standalone="yes" indent="yes"/>
    
    <xsl:variable name="DM" select="document('designmap.xml')"/>
   <xsl:variable name="PnoMf" select="document('PnoManifest.xml')"/>
   <xsl:variable name="rectCount" select="count($PnoMf//Rectangle)"/>
    
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    
    <!--<xsl:template match="MAPS/MAP">
        <xsl:variable name="M" select="."/>
        <xsl:variable name="filename" select="concat('output/',$M)"/>
        <xsl:result-document href="{$filename}" format="xml">
            
            <xsl:apply-templates select="document($M)"/> 
            
        </xsl:result-document>
    </xsl:template>-->
    <xsl:template match="MAPS/MAP">
        <xsl:variable name="M" select="."/>
        <!--<xsl:variable name="filename" select="concat('output/',$M)"/>-->
        <xsl:variable name="filename" select="concat('',$M)"/>
<!--        <xsl:result-document href="{$filename}" format="xml">-->
            
            <xsl:apply-templates select="document($M)"/> 
            
        <!--</xsl:result-document>-->
    </xsl:template>
    
    <!-- getting the layer visibility information from the designmap.xml   -->
    <xsl:template match="@ItemLayer">
        <xsl:variable name="self" select="."/>
        <xsl:copy>
            <xsl:apply-templates select="."/>
        </xsl:copy>
        <xsl:attribute name="layerVisibility" select="$DM//Layer[@Self =$self]/@Visible"/>
    </xsl:template>
   
    
    <xsl:template match="Rectangle">
       <xsl:variable name="count">
          <xsl:number level="any"/>
       </xsl:variable>
       
        <xsl:copy>
           <!--<xsl:attribute name="Self">
                <xsl:variable name="randno">
                    <xsl:call-template name="create-seed"/>
                </xsl:variable>
              
                <xsl:value-of select="$randno +$count +$rectCount "/>
            </xsl:attribute>-->
            <xsl:for-each select="child::*/@Self">
                <xsl:variable name="ImageSelf" select="."/>
                
                <xsl:variable name="ImageHyperLink">
                    <xsl:variable name="HPIS">
                        <xsl:for-each select="$DM//HyperlinkPageItemSource">
                            <xsl:choose>
                                <xsl:when test="./@SourcePageItem eq $ImageSelf">
                                    <xsl:value-of select="./@Self"/>
                                </xsl:when>
                            </xsl:choose>
                        </xsl:for-each>
                    </xsl:variable>
                    <xsl:variable name="HDUK">
                        <xsl:for-each select="$DM//Hyperlink">
                            <xsl:choose>
                                <xsl:when test="./@Source eq $HPIS">
                                    <xsl:value-of select="./@DestinationUniqueKey"/>
                                </xsl:when>
                            </xsl:choose>
                        </xsl:for-each>
                    </xsl:variable>
                    <xsl:variable name="HDUL">
                        <xsl:for-each select="$DM//HyperlinkURLDestination">
                            <xsl:choose>
                                <xsl:when test="./@DestinationUniqueKey eq $HDUK">
                                    <xsl:value-of select="./@DestinationURL"/>
                                </xsl:when>
                            </xsl:choose>
                        </xsl:for-each>
                    </xsl:variable>
                    <xsl:value-of select="$HDUL"></xsl:value-of>
                </xsl:variable>
               
               <xsl:if test="not(string-length($ImageHyperLink) = 0)">
                <xsl:attribute name="ImageHyperLinkUD" select="$ImageHyperLink"/>
               </xsl:if>
                
            </xsl:for-each>
           <!--<xsl:apply-templates select="@* except @Self|node() "/>-->
           <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template name="create-seed">
        <xsl:param name="string" select="generate-id()"/>
        <xsl:param name="preliminary-seed" select="10"/>
        <xsl:param name="maximum-value" select="10000000000"/>
        
        <xsl:variable name="name-chars"
            select="':ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz-.0123456789'"
        />
        
        <xsl:choose>
            <xsl:when test="string-length($string) != 0">
                <xsl:call-template name="create-seed">
                    <xsl:with-param name="string" select="substring($string,2)"/>
                    <xsl:with-param name="preliminary-seed"
                        select="($preliminary-seed + string-length(
                        
                        substring-before($name-chars,substring($string,1,1))
                        )
                        ) mod $maximum-value"/>
                    <xsl:with-param name="maximum-value" select="$maximum-value"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$preliminary-seed"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    
</xsl:stylesheet>