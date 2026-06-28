<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="Chapter">
<!--        <xsl:message><xsl:value-of select="$Graphic/stylesList/paragraph/root/style/@name/substring-after(.,'DZP_')"/> = <xsl:value-of select="descendant::Chapter/child::*/local-name()"/></xsl:message>-->
<!--        <xsl:variable name="styleName">-->
       
<!--        <xsl:if test="$Graphic/stylesList/paragraph/root/style/@name/substring-after(.,'DZP_') = descendant::Chapter/child::*/local-name()">-->           
<!--                <xsl:if test="./@tag = $curName">-->
            
       <!--</xsl:if>-->
        <!--</xsl:if>-->
        <!--</xsl:variable>-->
        
            
    </xsl:template>
</xsl:stylesheet>