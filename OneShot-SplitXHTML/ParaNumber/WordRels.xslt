<?xml version="1.0" encoding="UTF-8"?>
<!--<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf" exclude-result-prefixes="xs mf" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" version="2.0">-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf"
    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    exclude-result-prefixes="xs mf" version="2.0">
    <xsl:strip-space elements="*"/>
<xsl:preserve-space elements="*"/>
    <xsl:output method="xml" indent="yes" name="xml" xml:space="preserve"/>

    <!--<xsl:template match="/">
        <xsl:apply-templates select="Measurement"/>
    </xsl:template>-->
    <xsl:variable name="artinfo" select="document('artinfo.xml')"/>
    <xsl:variable name="storyRelsCount" select="count(document('StoryRels.xml')//Relationships/Relationship) + 10"/>

    <xsl:template match="/">
        <xsl:element name="Image">
        <!--<xsl:element name="Relationships">-->
            <!--<xsl:attribute name="{'xmlns'}" select="'http://schemas.openxmlformats.org/package/2006/relationships'"/>-->
            <xsl:if test="document('comments.xml')//w:comment/@w:id = '1'">
                <xsl:variable name="id">
                    <xsl:choose>                        
                    <xsl:when test="document('footnotes.xml')//w:footnote/@w:id = '1'">
                        <xsl:value-of select="'rId8'"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="'rId7'"></xsl:value-of>
                    </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:element name="Relationship">
                    <xsl:attribute name="Id" select="$id"/>
                    <xsl:attribute name="Type"
                        select="'http://schemas.openxmlformats.org/officeDocument/2006/relationships/comments'"/>
                    <xsl:attribute name="Target" select="'comments.xml'"/>
                </xsl:element>
            </xsl:if>
            <xsl:element name="Relationship">
                <xsl:attribute name="Id" select="'rId3'"/>
                <xsl:attribute name="Type"
                    select="'http://schemas.openxmlformats.org/officeDocument/2006/relationships/settings'"/>
                <xsl:attribute name="Target" select="'settings.xml'"/>
            </xsl:element>
            <xsl:element name="Relationship">
                <xsl:attribute name="Id" select="'rId2'"/>
                <xsl:attribute name="Type"
                    select="'http://schemas.microsoft.com/office/2007/relationships/stylesWithEffects'"/>
                <xsl:attribute name="Target" select="'stylesWithEffects.xml'"/>
            </xsl:element>  
            <xsl:element name="Relationship">
                <xsl:attribute name="Id" select="'rId1'"/>
                <xsl:attribute name="Type"
                    select="'http://schemas.openxmlformats.org/officeDocument/2006/relationships/styles'"/>
                <xsl:attribute name="Target" select="'styles.xml'"/>
            </xsl:element>
            <xsl:element name="Relationship">
                <xsl:attribute name="Id" select="'rId6'"/>
                <xsl:attribute name="Type"
                    select="'http://schemas.openxmlformats.org/officeDocument/2006/relationships/theme'"/>
                <xsl:attribute name="Target" select="'theme/theme1.xml'"/>
            </xsl:element>
            <xsl:element name="Relationship">
                <xsl:attribute name="Id" select="'rId5'"/>
                <xsl:attribute name="Type"
                    select="'http://schemas.openxmlformats.org/officeDocument/2006/relationships/fontTable'"/>
                <xsl:attribute name="Target" select="'fontTable.xml'"/>
            </xsl:element>
            <xsl:element name="Relationship">
                <xsl:attribute name="Id" select="'rId4'"/>
                <xsl:attribute name="Type"
                    select="'http://schemas.openxmlformats.org/officeDocument/2006/relationships/webSettings'"/>
                <xsl:attribute name="Target" select="'webSettings.xml'"/>
            </xsl:element>
            <xsl:if test="document('footnotes.xml')//w:footnote/@w:id = '1'">
                <xsl:element name="Relationship">
                    <xsl:attribute name="Id" select="'rId7'"/>
                    <xsl:attribute name="Type"
                        select="'http://schemas.openxmlformats.org/officeDocument/2006/relationships/footnotes'"/>
                    <xsl:attribute name="Target" select="'footnotes.xml'"/>
                </xsl:element>
            </xsl:if>
            <xsl:if test="document('numbering.xml')//w:numbering/w:num">
                <xsl:variable name="id">
                    <xsl:choose>                        
                        <xsl:when test="document('footnotes.xml')//w:footnote/@w:id = '1'">
                            <xsl:value-of select="'rId9'"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="'rId8'"></xsl:value-of>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:element name="Relationship">
                    <xsl:attribute name="Id" select="'rId9'"/>
                    <xsl:attribute name="Type"
                        select="'http://schemas.openxmlformats.org/officeDocument/2006/relationships/numbering'"/>
                    <xsl:attribute name="Target" select="'numbering.xml'"/>
                </xsl:element>
            </xsl:if>
        <!-- REMOVE THIS COMMENT TO LINK THE IMAGES INSIDE THE DOCUMENT USING THE RELATIONSHIP ID-->
         
        <!-- Remove this comment once the testing is over        -->
            <xsl:call-template name="storyRelsLink"/>
           <!-- <xsl:apply-templates
                select="document('SpreadCleanedmap.xml')//MAPS/MAP"/>-->
            <xsl:apply-templates
                select="//MAPS"/>
            <!--<xsl:apply-templates
                select="document('SpreadCleanedmap.xml')//MAPS/MAP" mode="diff"/>-->
            <!-- Remove this comment once the testing is over        -->
        </xsl:element>
        
    </xsl:template>
    
    <xsl:template name="storyRels">
        <xsl:for-each select="document('StoryRels.xml')//Relationships/Relationship">
            <xsl:variable name="id">
                <xsl:variable name="number">
                    <xsl:number level="any"/>
                </xsl:variable>
                <xsl:value-of select="$number + 10"/>
            </xsl:variable>
            <xsl:copy>
                <xsl:attribute name="Id" select="concat('rId',$id)"/>
                <xsl:copy-of select="@* except @Id| node()"/>
            </xsl:copy>
        </xsl:for-each>
    </xsl:template>

    <!--<xsl:template match="MAPS/MAP">
        <xsl:variable name="M" select="."/>
        <xsl:apply-templates select="document($M)//Measurement"/>
    </xsl:template>-->
    <xsl:template match="MAPS">
            <xsl:apply-templates select="//Measurement"/>
    </xsl:template>
    
    <!--<xsl:template match="MAPS/MAP" mode="diff">
        <xsl:variable name="M" select="."/>
        <xsl:apply-templates select="document($M)//Measurement" mode="diff"/>
    </xsl:template>-->
   <!-- <xsl:template match="MAPS">
        <xsl:apply-templates select="//Measurement" mode="diff"/>
    </xsl:template>-->
    
    <xsl:template match="Measurement" mode="diff">
        <xsl:for-each select="descendant::Rectangle">
            <xsl:if test="self::Rectangle/@Image">
                <xsl:variable name="Img" select="self::Rectangle/@Image"/>
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
                <!--<xsl:variable name="Id" select="self::Rectangle/@id"/>-->
                <xsl:variable name="Id">
                    <xsl:variable name="number">
                        <xsl:number level="any"/>
                    </xsl:variable>
                    <xsl:value-of select="$storyRelsCount + $number"/>
                </xsl:variable>
                <xsl:element name="Relationship">
                    <xsl:attribute name="Id" select="concat('rId',$Id)"/>
                    <xsl:attribute name="link" select="concat('rId',@id)"></xsl:attribute>
                    <xsl:attribute name="Type"
                        select="'http://schemas.openxmlformats.org/officeDocument/2006/relationships/image'"/>
                    <xsl:attribute name="Target" select="concat('media/',$Img3)"/>
                </xsl:element>
            </xsl:if>
        </xsl:for-each>
        
    </xsl:template>
    <xsl:template name="storyRelsLink">
        <xsl:for-each select="document('StoryRels.xml')//Relationships/Relationship">
            <xsl:variable name="id">
                <xsl:variable name="number">
                    <xsl:number level="any"/>
                </xsl:variable>
                <xsl:value-of select="$number + 10"/>
            </xsl:variable>
            <xsl:copy>
                <xsl:attribute name="Id" select="concat('rId',$id)"/>
                <xsl:attribute name="link" select="@Id"/>
                <xsl:copy-of select="@* except @Id| node()"/>
            </xsl:copy>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="Measurement">
        <xsl:for-each select="descendant::Rectangle">
            <xsl:if test="self::Rectangle/@Image">
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
                <!--<xsl:variable name="Id" select="self::Rectangle/@id"/>-->
                <xsl:variable name="Id">
                    <!--<xsl:variable name="number">
                        <xsl:number level="any"/>
                    </xsl:variable>
                    <xsl:value-of select="$storyRelsCount + $number"/>-->
                    <xsl:value-of select="self::Rectangle/@id"/>
                </xsl:variable>
                
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
            </xsl:if>
        </xsl:for-each>
        
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
   
    <xsl:template match="Relationships/*">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" mode="Cop"/>
        </xsl:copy>
    </xsl:template>
   
     <xsl:template match="w:footnote/@w:id">
         <xsl:value-of select="."/>
     </xsl:template>  
    
    <xsl:template match="w:comment/@w:id">
        <xsl:value-of select="."/>
    </xsl:template>  
    
    <xsl:template match="w:numbering/w:numPr">
        <xsl:value-of select="'1'"/>
    </xsl:template>
    
    <xsl:template match="@*|node()" mode="Cop">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" mode="Cop"/>
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>
