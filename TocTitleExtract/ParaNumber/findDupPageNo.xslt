<?xml version="1.0" encoding="UTF-8"?>
<!--<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:local="http://local"
    xmlns:mf="http://example.com/mf"
    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    xmlns:idPkg="http://schemas.openxmlformats.org/wordprocessingml/2006/main" 
    exclude-result-prefixes="xs local mf idPkg" version="2.0">
    
    <xsl:output method="xml" indent="yes" name="xml"/>
    
    <!-\- Identity Template -\->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <!-\- Process Measurement -\->
    <xsl:template match="Measurement">
        <xsl:variable name="pages-to-negate" as="xs:integer*">
            <xsl:for-each-group select="TextFrame" group-by="concat(@story, '-', @pageNo)">
                <xsl:if test="count(current-group()) > 1">
                    <!-\- FIX: Explicitly cast to xs:integer to match the variable type -\->
                    <xsl:sequence select="xs:integer(current-group()[1]/@pageNo)"/>
                </xsl:if>
            </xsl:for-each-group>
        </xsl:variable>
        
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="node()">
                <xsl:with-param name="negate-list" select="$pages-to-negate" tunnel="yes"/>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    
    <!-\- Match any element that has the pageNo_rowman_2_int attribute -\->
    <xsl:template match="*[@pageNo_rowman_2_int]">
        <xsl:param name="negate-list" tunnel="yes"/>
        
        <!-\- Cast current page to integer for consistent comparison -\->
        <xsl:variable name="current-page" select="xs:integer(@pageNo)"/>
        
        <xsl:copy>
            <xsl:apply-templates select="@* except pageNo_rowman_2_int"/>
            
            <xsl:attribute name="pageNo_rowman_2_int">
                <xsl:choose>
                    <xsl:when test="$current-page = $negate-list">
                        <!-\- Output as integer (e.g., -1 instead of -1.0) -\->
                        <xsl:value-of select="-xs:integer(@pageNo_rowman_2_int)"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="xs:integer(@pageNo_rowman_2_int)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            
            <xsl:apply-templates select="node()">
                <xsl:with-param name="negate-list" select="$negate-list" tunnel="yes"/>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>-->
<!--<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:local="http://local"
    xmlns:mf="http://example.com/mf"
    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    xmlns:idPkg="http://schemas.openxmlformats.org/wordprocessingml/2006/main" 
    exclude-result-prefixes="xs local mf idPkg" version="2.0">
    
    <xsl:output method="xml" indent="yes" name="xml"/>
    
    <!-\- Identity Template -\->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <!-\- Process Measurement -\->
    <xsl:template match="Measurement">
        <!-\- FIX: Changed variable type to xs:string* to handle Roman numerals -\->
        <xsl:variable name="pages-to-negate" as="xs:string*">
            <xsl:for-each-group select="TextFrame" group-by="concat(@story, '-', @pageNo)">
                <xsl:if test="count(current-group()) > 1">
                    <!-\- FIX: Select as string instead of converting to integer -\->
                    <xsl:sequence select="string(current-group()[1]/@pageNo)"/>
                </xsl:if>
            </xsl:for-each-group>
        </xsl:variable>
        
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="node()">
                <xsl:with-param name="negate-list" select="$pages-to-negate" tunnel="yes"/>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    
    <!-\- Match any element that has the pageNo_rowman_2_int attribute -\->
    <xsl:template match="*[@pageNo_rowman_2_int]">
        <xsl:param name="negate-list" tunnel="yes"/>
        
        <!-\- FIX: Treat current page as string to avoid conversion errors on "i", "ii", etc. -\->
        <xsl:variable name="current-page" select="string(@pageNo)"/>
        
        <xsl:copy>
            <xsl:apply-templates select="@* except pageNo_rowman_2_int"/>
            
            <xsl:attribute name="pageNo_rowman_2_int">
                <xsl:choose>
                    <!-\- Compare strings -\->
                    <xsl:when test="$current-page = $negate-list">
                        <!-\- Output as integer -\->
                        <xsl:value-of select="-xs:integer(@pageNo_rowman_2_int)"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="xs:integer(@pageNo_rowman_2_int)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            
            <xsl:apply-templates select="node()">
                <xsl:with-param name="negate-list" select="$negate-list" tunnel="yes"/>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>-->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:local="http://local"
    xmlns:mf="http://example.com/mf"
    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    xmlns:idPkg="http://schemas.openxmlformats.org/wordprocessingml/2006/main" 
    exclude-result-prefixes="xs local mf idPkg" version="2.0">
    
    <xsl:output method="xml" indent="yes" name="xml"/>
    
    <!-- Identity Template -->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Process Measurement -->
    <xsl:template match="Measurement">
        <!-- Identify pages with multiple text frames for negation logic -->
        <xsl:variable name="pages-to-negate" as="xs:string*">
            <xsl:for-each-group select="TextFrame" group-by="concat(@story, '-', @pageNo)">
                <xsl:if test="count(current-group()) > 1">
                    <xsl:sequence select="string(current-group()[1]/@pageNo)"/>
                </xsl:if>
            </xsl:for-each-group>
        </xsl:variable>
        
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="node()">
                <xsl:with-param name="negate-list" select="$pages-to-negate" tunnel="yes"/>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    
    <!-- Match any element that has the pageNo_rowman_2_int attribute -->
    <xsl:template match="*[@pageNo_rowman_2_int]">
        <xsl:param name="negate-list" tunnel="yes"/>
        
        <xsl:variable name="current-page" select="string(@pageNo)"/>
        <!-- Store current value as integer for calculation/checking -->
        <xsl:variable name="current-val" select="xs:integer(@pageNo_rowman_2_int)" as="xs:integer"/>
        
        <xsl:copy>
            <xsl:apply-templates select="@* except pageNo_rowman_2_int"/>
            
            <xsl:attribute name="pageNo_rowman_2_int">
                <xsl:choose>
                    <!-- FIX: If the value is already negative, leave it as is. -->
                    <xsl:when test="$current-val &lt; 0">
                        <xsl:value-of select="$current-val"/>
                    </xsl:when>
                    
                    <!-- Existing Logic: If page is in the negate-list (duplicate textframes), make it negative -->
                    <xsl:when test="$current-page = $negate-list">
                        <xsl:value-of select="-$current-val"/>
                    </xsl:when>
                    
                    <!-- Otherwise, output original value -->
                    <xsl:otherwise>
                        <xsl:value-of select="$current-val"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            
            <xsl:apply-templates select="node()">
                <xsl:with-param name="negate-list" select="$negate-list" tunnel="yes"/>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>