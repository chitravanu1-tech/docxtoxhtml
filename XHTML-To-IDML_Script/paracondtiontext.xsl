<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>


    <xsl:variable name="txt" select="unparsed-text('Converted_Story/MissingStyles.txt')"/>
    <xsl:variable name="strlen" select="string-length($txt)"/>
        <xsl:variable name="mismatch" >
            <xsl:choose>
                <xsl:when test="$strlen > 0">
                    <xsl:copy-of select="document('Converted_Story/MissingStyles.txt')"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
   <xsl:variable name="style" select="$mismatch//tr"/>
    <xsl:template match="//ParagraphStyleRange">
        <xsl:choose>
            <xsl:when test="$strlen > 0">
                <xsl:variable name="name" select="@Name"/>

                <xsl:copy>
                    <xsl:copy-of select="@*"/>
                    <xsl:if test="$name = $style/substring-after(.,'ParagraphStyle/')">
                        <xsl:attribute name="AppliedParagraphStyle">
                            <xsl:variable name="PS" select="substring-after(@AppliedParagraphStyle,'ParagraphStyle/')"/>
                            <xsl:value-of select="concat('ParagraphStyle/Word Styles%3a',$PS)"/>
                        </xsl:attribute>
                        
                    </xsl:if>
                    <xsl:apply-templates/>
                </xsl:copy>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>    
    
    <xsl:template match="//CharacterStyleRange">
        <xsl:choose>
            <xsl:when test="$strlen > 0">
        <xsl:variable name="name" select="@Name"/>
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:if test="$name = $style/substring-after(.,'CharacterStyle/')">
                
                <xsl:attribute name="AppliedCharacterStyle">
                    <xsl:variable name="CS" select="substring-after(@AppliedCharacterStyle,'CharacterStyle/')"/>
                    <xsl:value-of select="concat('CharacterStyle/Word Styles%3a',$CS)"/>
                </xsl:attribute>  
                
            </xsl:if>
            <xsl:apply-templates/>
        </xsl:copy>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>  
    </xsl:template>    
</xsl:stylesheet>