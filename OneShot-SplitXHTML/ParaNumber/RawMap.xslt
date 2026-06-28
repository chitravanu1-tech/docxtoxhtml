<?xml version="1.0" encoding="UTF-8"?>
<!--<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf" exclude-result-prefixes="xs mf" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" version="2.0">-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf" exclude-result-prefixes="xs mf idPkg" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" xmlns:idPkg="http://schemas.openxmlformats.org/wordprocessingml/2006/main" version="2.0">
    
    <xsl:output method="xml" indent="yes" name="xml"/>


    <xsl:template match="Document">
      <xsl:variable name="ok" select="*:Spread/@src"/>
        <xsl:variable name="ok1" select="*:Story/@src"/>
        
        
        <xsl:result-document href="SpreadCleanedmap.xml" format="xml">     
            <xsl:element name="SOURCE">
                <xsl:element name="MAPS">
                    <xsl:for-each select="$ok">
                        <xsl:element name="MAP">
                            <xsl:value-of select="tokenize(.,'/')[last()]"/>
                        </xsl:element>
                    </xsl:for-each>
                </xsl:element>
            </xsl:element>
        </xsl:result-document>
        
        <!--<xsl:result-document href="output/SpreadCleanedmap.xml" format="xml">     
            <xsl:element name="SOURCE">
                <xsl:element name="MAPS">
                    <xsl:for-each select="$ok">
                        <xsl:element name="MAP">
                            <xsl:value-of select="tokenize(.,'/')[last()]"/>
                        </xsl:element>
                    </xsl:for-each>
                </xsl:element>
            </xsl:element>
        </xsl:result-document>-->
        
        <xsl:result-document href="StoryCleanedmap.xml" format="xml">                                  
            <xsl:element name="SOURCE">
                <xsl:element name="STORIES">
                    <xsl:for-each select="$ok1">
                        <xsl:element name="STORY">
                            <xsl:value-of select="tokenize(.,'/')[last()]"/>
                        </xsl:element>
                    </xsl:for-each>
                </xsl:element>      
            </xsl:element>                
        </xsl:result-document>
        
       <!-- <xsl:result-document href="output/StoryCleanedmap.xml" format="xml">                                  
            <xsl:element name="SOURCE">
                <xsl:element name="STORIES">
                    <xsl:for-each select="$ok1">
                        <xsl:element name="STORY">
                            <xsl:value-of select="tokenize(.,'/')[last()]"/>
                        </xsl:element>
                    </xsl:for-each>
                </xsl:element>      
            </xsl:element>                
        </xsl:result-document>-->
        
    </xsl:template>
    
</xsl:stylesheet>