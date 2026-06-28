<?xml version="1.0" encoding="UTF-8"?>
<!--<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf" exclude-result-prefixes="xs mf" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" version="2.0">-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf"
    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    xmlns:cx="http://schemas.microsoft.com/office/drawing/2014/chartex"
    xmlns:cx1="http://schemas.microsoft.com/office/drawing/2015/9/8/chartex"
    xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
    xmlns:o="urn:schemas-microsoft-com:office:office"
    xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"
    xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math"
    xmlns:v="urn:schemas-microsoft-com:vml"
    xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing"
    xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing"
    xmlns:w10="urn:schemas-microsoft-com:office:word"
    xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml"
    xmlns:w15="http://schemas.microsoft.com/office/word/2012/wordml"
    xmlns:w16se="http://schemas.microsoft.com/office/word/2015/wordml/symex"
    xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup"
    xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk"
    xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml"
    xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape"
    exclude-result-prefixes="xs mf" version="2.0">
    <!--Added for image id generation on 19-08-2020-->
    <!--Added to remove the full path of image  29-09-2021-->
    <xsl:strip-space elements="*"/>
    <xsl:output method="xml" indent="yes" name="xml" xml:space="preserve"/>
    <!--<xsl:template match="/">
        <xsl:apply-templates select="Measurement"/>
    </xsl:template>-->
       <xsl:template match="/">
        <xsl:variable name="footnotes" select="document('footnotes.xml')//w:footnote/@w:id = '1'"/>
        <xsl:variable name="endnotes" select="document('endnotes.xml')//w:endnote/@w:id = '1'"/>
        <!--<xsl:variable name="comments" select="document('comments.xml')//w:comment/@w:id = '1'"/>-->
        <xsl:variable name="comments" select="document('comments.xml')//w:comment/@w:id='1'or'2' or '3'or '4' or '5'or '6'or '7' or '8' or '9'"/>
        <xsl:variable name="numbering" select="boolean(document('numbering.xml')//w:numbering/w:num)"/>
        

        <xsl:element name="Relationships">
            <xsl:attribute name="{'xmlns'}" select="'http://schemas.openxmlformats.org/package/2006/relationships'"/>
            <xsl:if test="$comments = true()">
                <xsl:variable name="id">
                    <xsl:choose>                        
                    <xsl:when test="$footnotes = true() and $endnotes = true()">
                        <xsl:value-of select="'rId09'"/>
                    </xsl:when>
                    <xsl:when test="$footnotes= true() or $endnotes = true()">
                        <xsl:value-of select="'rId08'"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="'rId07'"></xsl:value-of>
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
                <xsl:attribute name="Id" select="'rId03'"/>
                <xsl:attribute name="Type"
                    select="'http://schemas.openxmlformats.org/officeDocument/2006/relationships/settings'"/>
                <xsl:attribute name="Target" select="'settings.xml'"/>
            </xsl:element>
            <xsl:element name="Relationship">
                <xsl:attribute name="Id" select="'rId02'"/>
                <xsl:attribute name="Type"
                    select="'http://schemas.microsoft.com/office/2007/relationships/stylesWithEffects'"/>
                <xsl:attribute name="Target" select="'stylesWithEffects.xml'"/>
            </xsl:element>  
            <xsl:element name="Relationship">
                <xsl:attribute name="Id" select="'rId01'"/>
                <xsl:attribute name="Type"
                    select="'http://schemas.openxmlformats.org/officeDocument/2006/relationships/styles'"/>
                <xsl:attribute name="Target" select="'styles.xml'"/>
            </xsl:element>
            <xsl:element name="Relationship">
                <xsl:attribute name="Id" select="'rId06'"/>
                <xsl:attribute name="Type"
                    select="'http://schemas.openxmlformats.org/officeDocument/2006/relationships/theme'"/>
                <xsl:attribute name="Target" select="'theme/theme1.xml'"/>
            </xsl:element>
            <xsl:element name="Relationship">
                <xsl:attribute name="Id" select="'rId05'"/>
                <xsl:attribute name="Type"
                    select="'http://schemas.openxmlformats.org/officeDocument/2006/relationships/fontTable'"/>
                <xsl:attribute name="Target" select="'fontTable.xml'"/>
            </xsl:element>
            <xsl:element name="Relationship">
                <xsl:attribute name="Id" select="'rId04'"/>
                <xsl:attribute name="Type"
                    select="'http://schemas.openxmlformats.org/officeDocument/2006/relationships/webSettings'"/>
                <xsl:attribute name="Target" select="'webSettings.xml'"/>
            </xsl:element>
            <xsl:if test="$footnotes = true()">
                <xsl:element name="Relationship">
                    <xsl:attribute name="Id" select="'rId07'"/>
                    <xsl:attribute name="Type"
                        select="'http://schemas.openxmlformats.org/officeDocument/2006/relationships/footnotes'"/>
                    <xsl:attribute name="Target" select="'footnotes.xml'"/>
                </xsl:element>
            </xsl:if>
            <xsl:if test="$endnotes = true()">
                <xsl:variable name="id">
                    <xsl:choose>                        
                        <xsl:when test="$footnotes = true()">
                            <xsl:value-of select="'rId08'"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="'rId07'"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:element name="Relationship">
                    <xsl:attribute name="Id" select="$id"/>
                    <xsl:attribute name="Type"
                        select="'http://schemas.openxmlformats.org/officeDocument/2006/relationships/endnotes'"/>
                    <xsl:attribute name="Target" select="'endnotes.xml'"/>
                </xsl:element>
            </xsl:if>
            <xsl:if test="$numbering = true()">
                <xsl:variable name="id">
                    <xsl:choose>          
                        <xsl:when test="($footnotes and $endnotes and $comments)">
                            <xsl:value-of select="'rId010'"/>
                        </xsl:when>
                        <xsl:when test="($footnotes and $comments and not($endnotes)) or ($footnotes and not($comments) and $endnotes) or (not($footnotes) and $comments and $endnotes)">
                            <xsl:value-of select="'rId09'"/>
                        </xsl:when>
                        <xsl:when test="($footnotes and not($comments and $endnotes)) or (not($footnotes and $comments) and $endnotes) or (not($footnotes and $endnotes) and $comments)">
                            <xsl:value-of select="'rId08'"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="'rId07'"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                
                <xsl:element name="Relationship">
                    <xsl:attribute name="Id" select="$id"/>
                    <xsl:attribute name="Type"
                        select="'http://schemas.openxmlformats.org/officeDocument/2006/relationships/numbering'"/>
                    <xsl:attribute name="Target" select="'numbering.xml'"/>
                </xsl:element>
            </xsl:if>
            
      <!--Added for image id generation on 19-08-2020-->
            <xsl:for-each select="//img[@src][not(@data-imgid)][not(contains(@src,'embeddings') or contains(@data-src1,'embeddings') or contains(@data-src2,'embeddings'))][not(@data-comment | @data-commentimg)]">
                 <xsl:variable name="id">
                    <xsl:variable name="num">
                        <xsl:number level="any"/>
                    </xsl:variable>
                    <xsl:value-of select="10 + $num"/>
                </xsl:variable>
                <xsl:variable name="IMG">
                    <xsl:choose>
                        <xsl:when test="contains(@src, '/')">
                            <!--<xsl:variable name="imgName" select="substring-after(@src, '/')"/>-->
                            <!--Added to remove the full path of image  29-09-2021-->
                            <!--<xsl:variable name="imgName" select="tokenize(@src, '/')[last()]"/>-->
                            <xsl:variable name="imgName">
                                <xsl:choose>
                                    <xsl:when test="self::img[@data-artname]"><xsl:value-of select="self::img/@data-artname"/></xsl:when>
                                    <xsl:otherwise><xsl:value-of select="tokenize(@src, '/')[last()]"/></xsl:otherwise>
                                </xsl:choose>
                            </xsl:variable>
                               <xsl:choose>
                                <xsl:when test="contains($imgName,'/')">
                                    <xsl:value-of select="substring-after($imgName, '/')"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$imgName"/>
                                </xsl:otherwise>
                            </xsl:choose>
                            
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="@src"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:if test="string-length($IMG) > 0">
                <xsl:element name="Relationship">
                    <xsl:attribute name="Id" select="concat('rId', $id)"/>
                    <xsl:attribute name="Type"
                        select="'http://schemas.openxmlformats.org/officeDocument/2006/relationships/image'"/>
                    <xsl:attribute name="Target" select="concat('media/', $IMG)"/>
                </xsl:element>
                </xsl:if>
            </xsl:for-each>
            <!--<xsl:for-each select="//w:object">
                    <xsl:variable name="id">
                        
                            <xsl:number level="any"/>
                        </xsl:variable>
                    <xsl:variable name="img"><xsl:value-of select="descendant::v:imagedata/@r:id"/></xsl:variable>
                    <xsl:variable name="imgid"><xsl:value-of select="substring-after($img,'rId')"/></xsl:variable>
                    <xsl:variable name="math"><xsl:value-of select="descendant::o:OLEObject/@r:id"/></xsl:variable>
                    <xsl:variable name="mathid"><xsl:value-of select="substring-after($math,'rId')"/></xsl:variable>
                    
                    <xsl:element name="Relationship">
                        <xsl:attribute name="Id" select="concat('rId', $imgid)"/>
                        <xsl:attribute name="Type"
                            select="'http://schemas.openxmlformats.org/officeDocument/2006/relationships/image'"/>
                        <xsl:attribute name="Target" select="concat('media/', 'image',$id,'.wmf')"/>
                    </xsl:element>
                    <xsl:element name="Relationship">
                        <xsl:attribute name="Id" select="concat('rId', $mathid)"/>
                        <xsl:attribute name="Type"
                            select="'http://schemas.openxmlformats.org/officeDocument/2006/relationships/oleObject'"/>
                        <xsl:attribute name="Target" select="concat('embeddings/', 'oleObject',$id,'.bin')"/>
                    </xsl:element>
            </xsl:for-each>-->
            <xsl:for-each select="//img[@src][contains(@data-src1,'embeddings') or contains(@data-src2,'embeddings')][not(@data-comment | @data-commentimg)]">
                <xsl:variable name="data-math"><xsl:value-of select="self::img/@data-math"/></xsl:variable>
                <xsl:variable name="data-imgid"><xsl:value-of select="self::img[not(@data-imgid = preceding::img/@data-imgid)]/@data-imgid"/></xsl:variable>
                <xsl:variable name="data-src1"><xsl:value-of select="self::img/substring-after(@data-src1,'embeddings/')"/></xsl:variable>
                <xsl:variable name="data-src2"><xsl:value-of select="self::img/substring-after(@data-src2,'embeddings/')"/></xsl:variable>
                <xsl:variable name="src"><xsl:value-of select="self::img/@src"/></xsl:variable>
                <xsl:if test="string-length($data-imgid) &gt;0">
                <xsl:element name="Relationship">
                    <xsl:attribute name="Id" select="$data-imgid"/>
                    <xsl:attribute name="Type"
                        select="'http://schemas.openxmlformats.org/officeDocument/2006/relationships/image'"/>
                    <xsl:attribute name="Target" select="concat('media/', $data-src1)"/>
                </xsl:element>
                </xsl:if>
                   <xsl:choose>
                        <xsl:when test="self::img[not(@data-math = preceding::img/@data-math)]">
                            <xsl:element name="Relationship">
                                <xsl:attribute name="Id" select="$data-math"/>
                                <xsl:attribute name="Type"
                                    select="'http://schemas.openxmlformats.org/officeDocument/2006/relationships/oleObject'"/>
                                <xsl:attribute name="Target" select="concat('embeddings/', $data-src2)"/>
                            </xsl:element>
                        </xsl:when>
                        <xsl:when test="self::img[@data-math = preceding::img/@data-math]"/>
                        <xsl:otherwise>
                            <xsl:element name="Relationship">
                                <xsl:attribute name="Id" select="$data-math"/>
                                <xsl:attribute name="Type"
                                    select="'http://schemas.openxmlformats.org/officeDocument/2006/relationships/oleObject'"/>
                                <xsl:attribute name="Target" select="concat('embeddings/', $data-src2)"/>
                            </xsl:element>
                        </xsl:otherwise>
                    </xsl:choose>
            </xsl:for-each>
            <xsl:for-each select="//img[@src][@data-imgid ][not(contains(@data-src1,'embeddings') or contains(@data-src2,'embeddings'))][not(@data-comment | @data-commentimg)]">
                <xsl:variable name="data-imgid"><xsl:value-of select="self::img/@data-imgid"/></xsl:variable>
                <xsl:variable name="src"><xsl:value-of select="self::img/@src"/></xsl:variable>
                <xsl:element name="Relationship">
                    <xsl:attribute name="Id" select="$data-imgid"/>
                    <xsl:attribute name="Type"
                        select="'http://schemas.openxmlformats.org/officeDocument/2006/relationships/image'"/>
                    <xsl:attribute name="Target" select="concat('media/', $src)"/>
                </xsl:element>
                </xsl:for-each>
            <!--End-->
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>