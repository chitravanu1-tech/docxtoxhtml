<?xml version="1.0" encoding="UTF-8"?>
<!--<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf" exclude-result-prefixes="xs mf" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" version="2.0">-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf"
    xmlns:r="http://schemas.openxmlformats.org/package/2006/relationships" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    exclude-result-prefixes="xs mf r" version="2.0">
    <xsl:strip-space elements="*"/>
<xsl:preserve-space elements="*"/>
    <xsl:output method="xml" indent="yes" name="xml" xml:space="preserve"/>
    
    <!--<xsl:template match="/">
        <xsl:apply-templates select="Measurement"/>
    </xsl:template>-->
    <xsl:variable name="artinfo" select="document('artinfo.xml')"/>
    
    <xsl:template match="/">
        <xsl:element name="Relationships">
            <!--<xsl:apply-templates
                select="document('StoryCleanedmap.xml')//STORIES/STORY"/>-->
            <xsl:apply-templates select="//Story"/>
        </xsl:element>
    </xsl:template>

    
    <!--<xsl:template match="STORIES/STORY">
        <xsl:variable name="M" select="."/>
        <xsl:apply-templates select="document($M)//Story"/>
    </xsl:template>-->
    
    <xsl:template match="Story">
        <xsl:apply-templates select="//Rectangle[@Image]"/>
    </xsl:template>
    
    
    <!--<xsl:template match="ParagraphStyleRange">
        <xsl:for-each select="CharacterStyleRange">
            <xsl:if test="descendant::Rectangle/@Image">
                <xsl:for-each select="descendant::Rectangle">
                <xsl:variable name="Img" select="self::Rectangle/@Image"/>
                <xsl:variable name="extension">
                    <xsl:call-template name="substring-after-last">
                        <xsl:with-param name="string" select="$Img"/>
                        <xsl:with-param name="char" select="'.'"/>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:variable name="Img1" select="substring-before($Img,concat('.',$extension))"/>
                <xsl:variable name="Img2">
                    <xsl:choose>
                        <xsl:when test="$extension = 'tif'">
                            <xsl:value-of select="'tiff'"/>
                        </xsl:when>
                        <xsl:when test="$extension = 'tiff'">
                            <xsl:value-of select="'tiff'"/>
                        </xsl:when>
                        <xsl:when test="$extension = 'eps'">
                            <xsl:value-of select="'wmf'"/>
                        </xsl:when>
                        <xsl:when test="$extension = 'pct'">
                            <xsl:value-of select="'wmf'"/>
                        </xsl:when>
                        <xsl:when test="$extension = 'pict'">
                            <xsl:value-of select="'wmf'"/>
                        </xsl:when>
                        <xsl:when test="$extension = 'wmf'">
                            <xsl:value-of select="'wmf'"/>
                        </xsl:when>
                        <xsl:when test="$extension = 'emf'">
                            <xsl:value-of select="'emf'"/>
                        </xsl:when>
                        <xsl:when test="$extension = 'jpg'">
                            <xsl:value-of select="'jpeg'"/>
                        </xsl:when>
                        <xsl:when test="$extension = 'jpeg'">
                            <xsl:value-of select="'jpeg'"/>
                        </xsl:when>
                        <xsl:when test="$extension = 'jfif'">
                            <xsl:value-of select="'jpeg'"/>
                        </xsl:when>
                        <xsl:when test="$extension = 'jpe'">
                            <xsl:value-of select="'jpeg'"/>
                        </xsl:when>
                        <xsl:when test="$extension = 'png'">
                            <xsl:value-of select="'png'"/>
                        </xsl:when>
                        <xsl:when test="$extension = 'bmp'">
                            <xsl:value-of select="'png'"/>
                        </xsl:when>
                        <xsl:when test="$extension = 'dib'">
                            <xsl:value-of select="'png'"/>
                        </xsl:when>
                        <xsl:when test="$extension = 'rle'">
                            <xsl:value-of select="'png'"/>
                        </xsl:when>
                        <xsl:when test="$extension = 'gif'">
                            <xsl:value-of select="'gif'"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="Img3" select="concat($Img1,'.',$Img2)"/>
                    <xsl:variable name="Id" select="self::Rectangle/@id"/>
                <xsl:element name="Relationship">
                    <xsl:attribute name="Id" select="concat('rId',$Id)"/>
                    <xsl:attribute name="Type"
                        select="'http://schemas.openxmlformats.org/officeDocument/2006/relationships/image'"/>
                    <xsl:attribute name="Target" select="concat('media/',$Img3)"/>
                </xsl:element>
                </xsl:for-each>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>-->
    
    <xsl:template match="Rectangle[@Image]">
        <xsl:variable name="Img" select="self::Rectangle/@Image"/>
        <xsl:variable name="artAvail" select="boolean($artinfo//Arts/art[. = $Img])"/>
        <xsl:variable name="extension">
            <xsl:call-template name="substring-after-last">
                <xsl:with-param name="string" select="$Img"/>
                <xsl:with-param name="char" select="'.'"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="Img1" select="substring-before($Img,concat('.',$extension))"/>
        <xsl:variable name="Img2">
            <!--<xsl:choose>
                <xsl:when test="$extension = 'tif'">
                    <xsl:value-of select="'tiff'"/>
                </xsl:when>
                <xsl:when test="$extension = 'tiff'">
                    <xsl:value-of select="'tiff'"/>
                </xsl:when>
                <xsl:when test="$extension = 'eps'">
                    <xsl:value-of select="'wmf'"/>
                </xsl:when>
                <xsl:when test="$extension = 'pct'">
                    <xsl:value-of select="'wmf'"/>
                </xsl:when>
                <xsl:when test="$extension = 'pict'">
                    <xsl:value-of select="'wmf'"/>
                </xsl:when>
                <xsl:when test="$extension = 'wmf'">
                    <xsl:value-of select="'wmf'"/>
                </xsl:when>
                <xsl:when test="$extension = 'emf'">
                    <xsl:value-of select="'emf'"/>
                </xsl:when>
                <xsl:when test="$extension = 'jpg'">
                    <xsl:value-of select="'jpeg'"/>
                </xsl:when>
                <xsl:when test="$extension = 'jpeg'">
                    <xsl:value-of select="'jpeg'"/>
                </xsl:when>
                <xsl:when test="$extension = 'jfif'">
                    <xsl:value-of select="'jpeg'"/>
                </xsl:when>
                <xsl:when test="$extension = 'jpe'">
                    <xsl:value-of select="'jpeg'"/>
                </xsl:when>
                <xsl:when test="$extension = 'png'">
                    <xsl:value-of select="'png'"/>
                </xsl:when>
                <xsl:when test="$extension = 'bmp'">
                    <xsl:value-of select="'png'"/>
                </xsl:when>
                <xsl:when test="$extension = 'dib'">
                    <xsl:value-of select="'png'"/>
                </xsl:when>
                <xsl:when test="$extension = 'rle'">
                    <xsl:value-of select="'png'"/>
                </xsl:when>
                <xsl:when test="$extension = 'gif'">
                    <xsl:value-of select="'gif'"/>
                </xsl:when>
            </xsl:choose>-->
            <xsl:value-of select="'jpg'"/>
        </xsl:variable>
        <xsl:variable name="Img3" select="concat($Img1,'.',$Img2)"/>
        <xsl:variable name="Id" select="self::Rectangle/@id"/>

        <xsl:if test="$artAvail">
        <xsl:element name="Relationship">
            <xsl:attribute name="Id" select="concat('rId',$Id)"/>
            <xsl:attribute name="Type"
                select="'http://schemas.openxmlformats.org/officeDocument/2006/relationships/image'"/>
            <xsl:attribute name="Target" select="concat('media/',$Img3)"/>
        </xsl:element>
        </xsl:if>
        <!-- if the image is not copied or not present in the artinfo.xml file       -->
        <xsl:if test="not($artAvail)">
            <xsl:element name="Relationship">
                <xsl:attribute name="TargetMode" select="'External'"/>
                <xsl:attribute name="Target" select="concat('media/',$Img3)"/>
                <xsl:attribute name="Type"
                    select="'http://schemas.openxmlformats.org/officeDocument/2006/relationships/image'"/>
                <!--<xsl:attribute name="Target" select="'NULL'"/>-->
                <xsl:attribute name="Id" select="concat('rId',$Id)"/>
                
            </xsl:element>
        </xsl:if>
        <xsl:if test="$extension = 'eps'">
            <xsl:if test="$artAvail">
            <xsl:element name="Relationship">
                <xsl:attribute name="Id" select="concat('rId',$Id,'hypl')"/>
                <xsl:attribute name="hypl" select="'true'"/>
                <xsl:attribute name="Type"
                    select="'http://schemas.openxmlformats.org/officeDocument/2006/relationships/hyperlink'"/>
                <xsl:attribute name="Target" select="$Img"/>
                <xsl:attribute name="TargetMode" select="'External'"/>
            </xsl:element>
            </xsl:if>
        </xsl:if>
         
    </xsl:template>
    
    <xsl:template name="substring-after-last">
        <xsl:param name="string"/>
        <xsl:param name="char"/>
        
        <xsl:choose>
            <xsl:when test="contains($string, $char)">
                <xsl:call-template name="substring-after-last">
                    <xsl:with-param name="string" select="substring-after($string, $char)"/>
                    <xsl:with-param name="char" select="$char"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$string"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
