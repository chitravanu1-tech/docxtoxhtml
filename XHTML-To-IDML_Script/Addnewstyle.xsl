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
    <xsl:variable name="mismatchstyle" >
        <xsl:choose>
            <xsl:when test="$strlen > 0">
                <xsl:copy-of select="document('Converted_Story/MissingStyles.txt')"/>
            </xsl:when>
        </xsl:choose>
    </xsl:variable>
    <xsl:variable name="style" select="$mismatchstyle//tr"/>
    
    <xsl:template match="RootParagraphStyleGroup">
      
            
            
        <xsl:choose>
			<xsl:when test="$strlen &gt; 0">
			    <xsl:copy>
			        <xsl:apply-templates select="@*"/>
			        <xsl:text>&#x000A;</xsl:text>
			        <xsl:element name="ParagraphStyleGroup">
			            <xsl:attribute name="Self">
			                <xsl:value-of select="'ParagraphStyleGroup/$ID/Word Styles'"/>
			            </xsl:attribute>
			            <xsl:attribute name="Name">
			                <xsl:value-of select="'$ID/Word Styles'"/>
			            </xsl:attribute>
			            <xsl:text>&#x000A;</xsl:text>
			        <xsl:for-each select="$style">
			            <xsl:if test="contains(.,'ParagraphStyle/')">
			                <xsl:variable name="parastyle" select="substring-after(.,'ParagraphStyle/')"/>
			                <xsl:text>&#x000A;</xsl:text>
			                <xsl:element name="ParagraphStyle">
			                    <xsl:attribute name="Self" select="concat('ParagraphStyle/Word Styles%3a',$parastyle)"/>
			                    <xsl:attribute name="Name" select="concat('Word Styles:',$parastyle)"/>   
			                    <xsl:attribute name="Imported" select="'false'"/>
			                    <xsl:attribute name="NextStyle" select="concat('ParagraphStyle/Word Styles%3a',$parastyle)"/>
			                    <xsl:attribute name="EmptyNestedStyles" select="'true'"/>
			                    <xsl:attribute name="EmptyLineStyles" select="'true'"/>
			                    <xsl:attribute name="EmptyGrepStyles" select="'true'"/>
			                    <xsl:attribute name="KeyboardShortcut" select="'0 0'"/>
			                    <xsl:text disable-output-escaping="yes">&lt;Properties&gt;</xsl:text>
			                    <xsl:text disable-output-escaping="yes">&lt;BasedOn type="string">$ID/[No paragraph style]&gt;</xsl:text>
			                    <xsl:text disable-output-escaping="yes">&lt;/BasedOn&gt;</xsl:text>
			                    <xsl:text disable-output-escaping="yes">&lt;PreviewColor type="enumeration">Nothing&gt;</xsl:text>
			                    <xsl:text disable-output-escaping="yes">&lt;/PreviewColor&gt;</xsl:text>
			                    <xsl:text disable-output-escaping="yes">&lt;/Properties&gt;</xsl:text>
			                </xsl:element>
			                <xsl:text>&#x000A;</xsl:text>
			            </xsl:if>    
			        </xsl:for-each>
			        </xsl:element>
			        <xsl:text>&#x000A;</xsl:text>
			        <xsl:apply-templates select="node()"/>
			    </xsl:copy>
			</xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="node()"/>
                </xsl:copy>
            </xsl:otherwise>
		</xsl:choose>
        
	</xsl:template>
    <xsl:template match="RootCharacterStyleGroup">
        <xsl:choose>
            <xsl:when test="$strlen &gt; 0">
                <xsl:copy>
                    <xsl:apply-templates select="@*"/>
                    
                    <xsl:element name="CharacterStyleGroup">
                        <xsl:attribute name="Self">
                            <xsl:value-of select="'CharacterStyleGroup/$ID/Word Styles'"/>
                        </xsl:attribute>
                        <xsl:attribute name="Name">
                            <xsl:value-of select="'$ID/Word Styles'"/>
                        </xsl:attribute>
                        <xsl:text>&#x000A;</xsl:text>
                    
                    
                    <xsl:for-each select="$style">
                        <xsl:if test="contains(.,'CharacterStyle/')">
                            <xsl:variable name="charstyle" select="substring-after(.,'CharacterStyle/')"/>
                            <xsl:element name="CharacterStyle">
                                <xsl:attribute name="Self" select="concat('CharacterStyle/Word Styles%3a',$charstyle)"/>
                                <xsl:attribute name="Name" select="concat('Word Styles:',$charstyle)"/>   
                                <xsl:attribute name="Imported" select="'false'"/>
                                <xsl:attribute name="KeyboardShortcut" select="'0 0'"/>
                                <xsl:text disable-output-escaping="yes">&lt;Properties&gt;</xsl:text>
                                <xsl:text disable-output-escaping="yes">&lt;BasedOn type="string">$ID/[No character style]&gt;</xsl:text>
                                <xsl:text disable-output-escaping="yes">&lt;/BasedOn&gt;</xsl:text>
                                <xsl:text disable-output-escaping="yes">&lt;PreviewColor type="enumeration">Nothing&gt;</xsl:text>
                                <xsl:text disable-output-escaping="yes">&lt;/PreviewColor&gt;</xsl:text>
                                <xsl:text disable-output-escaping="yes">&lt;/Properties&gt;</xsl:text>
                            </xsl:element>
                        </xsl:if>
                    </xsl:for-each>
                    </xsl:element>
                    <xsl:apply-templates select="node()"/>
                </xsl:copy>
            </xsl:when>
            <xsl:otherwise>
                 <xsl:copy>
                <xsl:apply-templates select="node()"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template> 
</xsl:stylesheet>