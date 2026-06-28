<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf" exclude-result-prefixes="xs mf" 
    xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
    xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"
    xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" xmlns:v="urn:schemas-microsoft-com:vml"
    xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing" xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" 
    xmlns:w10="urn:schemas-microsoft-com:office:word" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml" xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup" 
    xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk" xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml"
    xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" 
    xmlns:a14="http://schemas.microsoft.com/office/drawing/2010/main" 
    xmlns:pic="http://schemas.openxmlformats.org/drawingml/2006/picture" 
    xmlns:idPkg="http://ns.adobe.com/AdobeInDesign/idml/1.0/packaging"
    xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape" 
     
    version="2.0">
    
    <!--<xsl:output method="xhtml" indent="no" use-character-maps="Ascii2Unicode"/>  -->
    <!-- 09-Apr-18: change the fore-color to black, if no bg-color on that -->
    <!-- 04-JUNE-18: Removing EMPTY div -->
    <!-- 15-Feb-19: Added due to remove span[@data-name = '[No character style]'] -->
    <!--Added for wyciwyg on 2-11-2020-->
    <!--<xsl:when test="contains($artmatch,'.jpg') or contains($artmatch,'.jpeg')"> on 02-07-2021-->
    <!--commented for marriapan on 24-08-2021-->
    <!-- Added for images to html5 format on 23-11-2021 -->
    <!-- Added to avoid the sorting issue, when more than para for endnotes  on 7-1-2022 -->
    <!--data-src on 7-2-2022-->
    <!-- Added for eref value not match with endnotecaption by space(1. )  on 17-3-2022 -->
    <!-- Added for pagebreak retained as instruction on 23-3-2022 -->
    <!-- Added to retain the endnotereference number( 1) information before on 23-5-2022-->
    <!-- Added to retain the endnotes id's on 8-7-2022 -->
    <!-- Added to retain the multiple footnote para on 23-7-2022 -->
    <!-- Added to avoid the link missing issue for endnotes on 29-08-2022 -->
    <!--descendant:: added for formatting on 19-1-2023-->
    <!--Azure 7128 [child::a[@class='crossref'] added to avoid sorting issue on 23-3-2023-->
    <!-- To Remove emptypara inside the textbox on 24-4-2023 Azure 7002 -->
    <xsl:param name="PassArtPath"/>
    <xsl:output method="xml" indent="no" use-character-maps="Ascii2Unicode"/>
    <xsl:strip-space elements="*"/>
    <xsl:preserve-space elements="p span td div li *"/>
    <xsl:param name="myNameSpace" select="'http://www.w3.org/1999/xhtml'"/>
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="*">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates></xsl:apply-templates>
        </xsl:element>
        
    </xsl:template>
    
    <xsl:variable name="filename" select="substring-before(tokenize(base-uri(.), '/')[last()],'.')"/>
    
    
    <!--<xsl:template match="html">
        <xsl:text disable-output-escaping="yes">&lt;html xmlns="http://www.w3.org/1999/xhtml"&gt;</xsl:text>
        <xsl:copy-of select="@*"/>
        <xsl:apply-templates/>
        <xsl:text>&#x000A;</xsl:text>
        <xsl:text disable-output-escaping="yes">&lt;/html&gt;</xsl:text>
    </xsl:template>-->
    
    
    <xsl:template match="ol[@type = 'nolist']">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="p[@type]">
        <xsl:variable name="class" select="@class"/>
        <xsl:variable name="type" select="@type"/>
        <xsl:variable name="x" select="name(preceding-sibling::*[1])"></xsl:variable>

            <xsl:text disable-output-escaping="yes">&lt;div style="position:relative; margin-left:</xsl:text>
            <xsl:choose>
                <xsl:when test="@indent">
                    <xsl:value-of select="@indent"/> 
                    <xsl:text disable-output-escaping="yes">;"&gt;</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="@type"/>
                    <xsl:text disable-output-escaping="yes">em;"&gt;</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:text>&#x000A;</xsl:text>
            <xsl:text disable-output-escaping="yes">&lt;p class="</xsl:text>
                <xsl:value-of select="$class"/>        
            <xsl:text disable-output-escaping="yes">" </xsl:text>
        <xsl:text disable-output-escaping="yes">type="</xsl:text>
        <xsl:value-of select="$type"/>        
        <xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
            <xsl:apply-templates/>
            <xsl:text disable-output-escaping="yes">&lt;/p&gt;</xsl:text>
            <xsl:text>&#x000A;</xsl:text>
            <xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>  
    </xsl:template>
    
    <xsl:template match="ol[@type = 'a']">
        <xsl:if
            test="not(preceding-sibling::*[1][self::ol[@type = 'a']])">
            <xsl:text>&#x000A;</xsl:text>
            <xsl:text disable-output-escaping="yes">&lt;div style="position:relative; margin-left:</xsl:text>
            <xsl:choose>
                <xsl:when test="@indent">
                    <xsl:value-of select="@indent"/> 
                    <xsl:text disable-output-escaping="yes">;"&gt;</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="@class"/>
                    <xsl:text disable-output-escaping="yes">em;"&gt;</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:text>&#x000A;</xsl:text>            
            <xsl:text disable-output-escaping="yes">&lt;ol type="a"</xsl:text>
            <xsl:if test="@class">
                <xsl:text> class="</xsl:text>
                <xsl:value-of select="@class"/>
                <xsl:text>"</xsl:text>
            </xsl:if>
            <xsl:if test="@start">
                <xsl:text> start="</xsl:text>
                <xsl:value-of select="@start"/>
                <xsl:text>"</xsl:text>
            </xsl:if>                
            <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
            <xsl:text>&#x000A;</xsl:text>                        
        </xsl:if>
        <xsl:apply-templates/>
        <xsl:if
            test="not(following-sibling::*[1][self::ol[@type = 'a']])">            
            <xsl:text>&#x000A;</xsl:text>
            <xsl:text disable-output-escaping="yes">&lt;/ol&gt;</xsl:text>
            <xsl:text>&#x000A;</xsl:text>
            <xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>            
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="ol[@type = 'A']">       
        <xsl:if
            test="not(preceding-sibling::*[1][self::ol[@type = 'A']])">
            <xsl:text>&#x000A;</xsl:text>
            <xsl:text disable-output-escaping="yes">&lt;div style="position:relative; margin-left:</xsl:text>
            <xsl:choose>
                <xsl:when test="@indent">
                    <xsl:value-of select="@indent"/> 
                    <xsl:text disable-output-escaping="yes">;"&gt;</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="@class"/>
                    <xsl:text disable-output-escaping="yes">em;"&gt;</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:text>&#x000A;</xsl:text>
            <xsl:text disable-output-escaping="yes">&lt;ol type="A"</xsl:text>
            <xsl:if test="@class">
                <xsl:text> class="</xsl:text>
                <xsl:value-of select="@class"/>
                <xsl:text>"</xsl:text>
            </xsl:if>
            <xsl:if test="@start">
                <xsl:text> start="</xsl:text>
                <xsl:value-of select="@start"/>
                <xsl:text>"</xsl:text>
            </xsl:if>                
            <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
            <xsl:text>&#x000A;</xsl:text>                        
        </xsl:if>
        <xsl:apply-templates/>
        <xsl:if
            test="not(following-sibling::*[1][self::ol[@type = 'A']])">            
            <xsl:text>&#x000A;</xsl:text>
            <xsl:text disable-output-escaping="yes">&lt;/ol&gt;</xsl:text>
            <xsl:text>&#x000A;</xsl:text>
            <xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text> 
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="ol[@type = 'i']">       
        <xsl:if
            test="not(preceding-sibling::*[1][self::ol[@type = 'i']])">
            <xsl:text>&#x000A;</xsl:text>
            <xsl:text disable-output-escaping="yes">&lt;div style="position:relative; margin-left:</xsl:text>
            <xsl:choose>
                <xsl:when test="@indent">
                    <xsl:value-of select="@indent"/> 
                    <xsl:text disable-output-escaping="yes">;"&gt;</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="@class"/>
                    <xsl:text disable-output-escaping="yes">em;"&gt;</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:text>&#x000A;</xsl:text>
            <xsl:text disable-output-escaping="yes">&lt;ol type="i"</xsl:text>
            <xsl:if test="@class">
                <xsl:text> class="</xsl:text>
                <xsl:value-of select="@class"/>
                <xsl:text>"</xsl:text>
            </xsl:if>
            <xsl:if test="@start">
                <xsl:text> start="</xsl:text>
                <xsl:value-of select="@start"/>
                <xsl:text>"</xsl:text>
            </xsl:if>                
            <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
            <xsl:text>&#x000A;</xsl:text>                        
        </xsl:if>
        <xsl:apply-templates/>
        <xsl:if
            test="not(following-sibling::*[1][self::ol[@type = 'i']])">            
            <xsl:text>&#x000A;</xsl:text>
            <xsl:text disable-output-escaping="yes">&lt;/ol&gt;</xsl:text>
            <xsl:text>&#x000A;</xsl:text>
            <xsl:text>&#x000A;</xsl:text>
            <xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="ol[@type = 'I']">       
        <xsl:if
            test="not(preceding-sibling::*[1][self::ol[@type = 'I']])">
            <xsl:text>&#x000A;</xsl:text>
            <xsl:text disable-output-escaping="yes">&lt;div style="position:relative; margin-left:</xsl:text>
            <xsl:choose>
                <xsl:when test="@indent">
                    <xsl:value-of select="@indent"/> 
                    <xsl:text disable-output-escaping="yes">;"&gt;</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="@class"/>
                    <xsl:text disable-output-escaping="yes">em;"&gt;</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:text>&#x000A;</xsl:text>
            <xsl:text disable-output-escaping="yes">&lt;ol type="I"</xsl:text>
            <xsl:if test="@class">
                <xsl:text> class="</xsl:text>
                <xsl:value-of select="@class"/>
                <xsl:text>"</xsl:text>
            </xsl:if>
            <xsl:if test="@start">
                <xsl:text> start="</xsl:text>
                <xsl:value-of select="@start"/>
                <xsl:text>"</xsl:text>
            </xsl:if>                
            <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
            <xsl:text>&#x000A;</xsl:text>                        
        </xsl:if>
        <xsl:apply-templates/>
        <xsl:if
            test="not(following-sibling::*[1][self::ol[@type = 'I']])">            
            <xsl:text>&#x000A;</xsl:text>
            <xsl:text disable-output-escaping="yes">&lt;/ol&gt;</xsl:text>
            <xsl:text>&#x000A;</xsl:text>
            <xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text> 
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="ol">
        <xsl:variable name="class" select="."/>
        <xsl:variable name="start" select="."/>
        <xsl:variable name="listType" select="child::*[1]/@listtype"/>
        <xsl:variable name="numberFormat" select="child::*[1]/@numberFormat"/>
        <xsl:variable name="numberType">
            <xsl:choose>
                <xsl:when test="child::*[1]/@numberType">
                    <xsl:value-of select="child::*[1]/@numberType"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="@numberType"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="not(preceding-sibling::*[1][self::ol])">
                <xsl:text>&#x000A;</xsl:text>
                <xsl:text disable-output-escaping="yes">&lt;div style="position:relative; margin-left:</xsl:text>
                <xsl:choose>
                    <xsl:when test="@indent">
                        <xsl:value-of select="@indent"/> 
                        <xsl:text disable-output-escaping="yes">;"&gt;</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="@class"/>
                        <xsl:text disable-output-escaping="yes">em;"&gt;</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:text>&#x000A;</xsl:text>
                <xsl:text disable-output-escaping="yes">&lt;ol</xsl:text>
                <xsl:if test="@class">
                    <xsl:text> class="</xsl:text>
                    <xsl:value-of select="@class"/>
                    <xsl:text>"</xsl:text>
                </xsl:if>
                <xsl:if test="@start">
                    <xsl:text> start="</xsl:text>
                    <xsl:value-of select="@start"/>
                    <xsl:text>"</xsl:text>
                </xsl:if> 
                <xsl:if test="@numberFormat">
                    <xsl:text> type="</xsl:text>
                    <xsl:choose>
                        <xsl:when test="contains(@numberFormat, 'decimal')">
                                    <xsl:choose>
                                        <xsl:when test="contains(@numberFormat, '&#x0025;')">
                                            <xsl:value-of select="substring-after(@numberFormat,'&#x0025;')"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="@numberFormat"/>
                                        </xsl:otherwise>
                                    </xsl:choose>                                    
                        </xsl:when>
                        <xsl:when test="contains(@numberFormat, 'lowerLetter')">
                                            <xsl:value-of select="'a'"/>        
                        </xsl:when>                             
                        <xsl:when test="contains(@numberFormat, 'upperLetter')">
                                            <xsl:value-of select="'A'"/>                      
                        </xsl:when>
                        <xsl:when test="contains(@numberFormat, 'lowerRoman')">
                                            <xsl:value-of select="'i'"/>                       
                        </xsl:when>
                        <xsl:when test="contains(@numberFormat, 'upperRoman')">
                                            <xsl:value-of select="'I'"/>
                        </xsl:when>
                        <xsl:when test="contains(@numberFormat, 'bullet')">
                                    <xsl:choose>
                                        <xsl:when test="contains(@numberFormat, '&#x0025;')">
                                            <xsl:value-of select="substring-after(@numberFormat,'&#x0025;')"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="@numberFormat"/>
                                        </xsl:otherwise>
                                    </xsl:choose>                           
                        </xsl:when>
                    </xsl:choose>
                    <xsl:text>"</xsl:text>
                </xsl:if> 
                <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                <xsl:text>&#x000A;</xsl:text>
            </xsl:when>
            <xsl:when test="preceding-sibling::*[1][self::ol[@type]]">
                <xsl:text>&#x000A;</xsl:text>
                <xsl:text disable-output-escaping="yes">&lt;div style="position:relative; margin-left:</xsl:text>
                <xsl:choose>
                    <xsl:when test="@indent">
                        <xsl:value-of select="@indent"/> 
                        <xsl:text disable-output-escaping="yes">;"&gt;</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="@class"/>
                        <xsl:text disable-output-escaping="yes">em;"&gt;</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:text>&#x000A;</xsl:text> 
                <xsl:text disable-output-escaping="yes">&lt;ol</xsl:text>
                <xsl:if test="@class">
                    <xsl:text> class="</xsl:text>
                    <xsl:value-of select="@class"/>
                    <xsl:text>"</xsl:text>
                </xsl:if>
                <xsl:if test="@start">
                    <xsl:text> start="</xsl:text>
                    <xsl:value-of select="@start"/>
                    <xsl:text>"</xsl:text>
                </xsl:if> 
                <xsl:if test="@numberFormat">
                    <xsl:text> type="</xsl:text>
                    <!--<xsl:value-of select="@numberFormat"/>-->
                    <xsl:choose>
                        <xsl:when test="contains(@numberFormat, 'decimal')">
                            <xsl:choose>
                                <xsl:when test="contains(@numberFormat, '&#x0025;')">
                                    <xsl:value-of select="substring-after(@numberFormat,'&#x0025;')"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="@numberFormat"/>
                                </xsl:otherwise>
                            </xsl:choose>                                    
                        </xsl:when>
                        <xsl:when test="contains(@numberFormat, 'lowerLetter')">
                            <xsl:value-of select="'a'"/>        
                        </xsl:when>                             
                        <xsl:when test="contains(@numberFormat, 'upperLetter')">
                            <xsl:value-of select="'A'"/>                      
                        </xsl:when>
                        <xsl:when test="contains(@numberFormat, 'lowerRoman')">
                            <xsl:value-of select="'i'"/>                       
                        </xsl:when>
                        <xsl:when test="contains(@numberFormat, 'upperRoman')">
                            <xsl:value-of select="'I'"/>
                        </xsl:when>
                        <xsl:when test="contains(@numberFormat, 'bullet')">
                            <xsl:choose>
                                <xsl:when test="contains(@numberFormat, '&#x0025;')">
                                    <xsl:value-of select="substring-after(@numberFormat,'&#x0025;')"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="@numberFormat"/>
                                </xsl:otherwise>
                            </xsl:choose>                           
                        </xsl:when>
                    </xsl:choose>
                    <xsl:text>"</xsl:text>
                </xsl:if>
                <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                <xsl:text>&#x000A;</xsl:text>  
            </xsl:when>
            <xsl:when test="preceding-sibling::*[1][self::ol[@start]] and not(self::ol[@start])">
                <xsl:text>&#x000A;</xsl:text>
                <xsl:text disable-output-escaping="yes">&lt;div style="position:relative; margin-left:</xsl:text>
                <xsl:choose>
                    <xsl:when test="@indent">
                        <xsl:value-of select="@indent"/> 
                        <xsl:text disable-output-escaping="yes">;"&gt;</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="@class"/>
                        <xsl:text disable-output-escaping="yes">em;"&gt;</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:text>&#x000A;</xsl:text> 
                <xsl:text disable-output-escaping="yes">&lt;ol</xsl:text>
                <xsl:if test="@class">
                    <xsl:text> class="</xsl:text>
                    <xsl:value-of select="@class"/>
                    <xsl:text>"</xsl:text>
                </xsl:if>
                <xsl:if test="@start">
                    <xsl:text> start="</xsl:text>
                    <xsl:value-of select="@start"/>
                    <xsl:text>"</xsl:text>
                </xsl:if>  
                <xsl:if test="@numberFormat">
                    <xsl:text> type="</xsl:text>
                    <xsl:choose>
                        <xsl:when test="contains(@numberFormat, 'decimal')">
                            <xsl:choose>
                                <xsl:when test="contains(@numberFormat, '&#x0025;')">
                                    <xsl:value-of select="substring-after(@numberFormat,'&#x0025;')"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="@numberFormat"/>
                                </xsl:otherwise>
                            </xsl:choose>                                    
                        </xsl:when>
                        <xsl:when test="contains(@numberFormat, 'lowerLetter')">
                            <xsl:value-of select="'a'"/>        
                        </xsl:when>                             
                        <xsl:when test="contains(@numberFormat, 'upperLetter')">
                            <xsl:value-of select="'A'"/>                      
                        </xsl:when>
                        <xsl:when test="contains(@numberFormat, 'lowerRoman')">
                            <xsl:value-of select="'i'"/>                       
                        </xsl:when>
                        <xsl:when test="contains(@numberFormat, 'upperRoman')">
                            <xsl:value-of select="'I'"/>
                        </xsl:when>
                        <xsl:when test="contains(@numberFormat, 'bullet')">
                            <xsl:choose>
                                <xsl:when test="contains(@numberFormat, '&#x0025;')">
                                    <xsl:value-of select="substring-after(@numberFormat,'&#x0025;')"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="@numberFormat"/>
                                </xsl:otherwise>
                            </xsl:choose>                           
                        </xsl:when>
                    </xsl:choose>
                    <xsl:text>"</xsl:text>
                </xsl:if>
                <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                <xsl:text>&#x000A;</xsl:text>  
            </xsl:when>            
        </xsl:choose>
        <xsl:apply-templates/>
        <xsl:if
            test="not(following-sibling::*[1][self::ol])">            
            <xsl:text>&#x000A;</xsl:text>
            <xsl:text disable-output-escaping="yes">&lt;/ol&gt;</xsl:text>
            <xsl:text>&#x000A;</xsl:text>
            <xsl:text>&#x000A;</xsl:text>
            <xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text> 
        </xsl:if>
        <xsl:if
            test="following-sibling::*[1][self::ol[@type]]">            
            <xsl:text>&#x000A;</xsl:text>
            <xsl:text disable-output-escaping="yes">&lt;/ol&gt;</xsl:text>
            <xsl:text>&#x000A;</xsl:text>
            <xsl:text>&#x000A;</xsl:text>
            <xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text> 
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="ul[@style = 'o']">       
        <xsl:if
            test="not(preceding-sibling::*[1][self::ul[@style = 'o']])">
            <xsl:text>&#x000A;</xsl:text>
            <xsl:text disable-output-escaping="yes">&lt;div style="position:relative; margin-left:</xsl:text>
            <xsl:choose>
                <xsl:when test="@indent">
                    <xsl:value-of select="@indent"/> 
                    <xsl:text disable-output-escaping="yes">;"&gt;</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="@class"/>
                    <xsl:text disable-output-escaping="yes">em;"&gt;</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:text>&#x000A;</xsl:text>
            <xsl:text disable-output-escaping="yes">&lt;ul style="o" class="</xsl:text>
            <xsl:value-of select="@class"/>
            <xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
            <xsl:text>&#x000A;</xsl:text>                        
        </xsl:if>
        <xsl:apply-templates/>
        <xsl:if
            test="not(following-sibling::*[1][self::ul[@style = 'o']])">            
            <xsl:text>&#x000A;</xsl:text>
            <xsl:text disable-output-escaping="yes">&lt;/ul&gt;</xsl:text>
            <xsl:text>&#x000A;</xsl:text>
            <xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text> 
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="p[@type = 'nolist']">
        <xsl:element name="p">
            <xsl:attribute name="class" select="child::*/@class"/>
            <xsl:attribute name="data-name" select="child::*/@data-name"/>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="li[parent::p]">
            <xsl:apply-templates/>        
    </xsl:template>
    
   
    <xsl:template match="table">
        <xsl:element name="{name(.)}">
            <!--<xsl:if test="parent::mynamespace:TABLE-WRAPPER/@id">
                <xsl:attribute name="id">
                    <xsl:value-of select="parent::mynamespace:TABLE-WRAPPER/@id"/>
                </xsl:attribute>
            </xsl:if>-->
            <xsl:copy-of select="@*"/>
                <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="imgg">  
        <xsl:element name="img">
        <xsl:apply-templates select="@*"/>
        </xsl:element>
    </xsl:template>
    
    <!-- 09-04-16: This below template match is to move imgs,tables inside ul/ol to outside of ulol -->
    <xsl:template match="div">
        <xsl:element name="{local-name()}">
            <xsl:apply-templates select="node()|@*"/>
        </xsl:element>
        <xsl:if test="child::ul/table">
            <xsl:for-each select="child::ul/table">
                <xsl:text>&#x000A;</xsl:text>
                <xsl:element name="table">
                    <xsl:apply-templates select="node()|@*"/>
                </xsl:element>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="ul[not(parent::div)] | ol[not(parent::div)]">
        <xsl:element name="{local-name()}">
            <xsl:apply-templates select="node()|@*"/>
        </xsl:element>
        <xsl:if test="child::div">
            <xsl:for-each select="child::div">
                <xsl:text>&#x000A;</xsl:text> 
                <xsl:element name="div">
                    <xsl:apply-templates select="node()|@*"/>
                </xsl:element>
                <xsl:text>&#x000A;</xsl:text> 
            </xsl:for-each>
        </xsl:if>
        <xsl:if test="child::table">
            <xsl:for-each select="child::table">
                <xsl:text>&#x000A;</xsl:text>
                <xsl:element name="table">
                    <xsl:apply-templates select="node()|@*"/>
                </xsl:element>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="ul//div"/>
    <xsl:template match="ul//table"/>
    <xsl:template match="div//ul/table"/>
    <xsl:template match="@v"/>
    <xsl:template match="@m"/>
    <xsl:template match="@o"/>
    <xsl:template match="@v2"/>
    <xsl:template match="@v3"/>
    <xsl:template match="bibsurname">
        <xsl:element name="span">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="bibyear">
        <xsl:element name="span">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p">
        <xsl:element name="{name()}">
            <xsl:copy-of select="@*"/>
            <xsl:if test="descendant::xmlid[not(parent::div[string-length(.) = 0])][1]">
                  <xsl:attribute name="id">
                      <xsl:value-of select="descendant::xmlid[not(parent::div[string-length(.) = 0])][1]/@val"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="following-sibling::*[1][self::xmlid][not(parent::div[string-length(.) = 0])][1]">
                <xsl:attribute name="id">
                    <xsl:value-of select="following-sibling::*[1][self::xmlid][not(parent::div[string-length(.) = 0])][1]/@val"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
        <xsl:for-each select="descendant::divV">
            <xsl:text>&#x000A;</xsl:text>
            <xsl:element name="div">
                <xsl:copy-of select="@*"/>
                <xsl:apply-templates select="@*|node()"/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="p//divV"/>
  
    <xsl:template match="//span[@style = '']">
        <xsl:apply-templates/>
    </xsl:template>
    
    
    <xsl:template match="//div[@class = 'WordSection1']">
          <xsl:apply-templates/>
    </xsl:template>    
    
 

<!-- 09-AUG-17: Added for IDML 2 HTML -->
    <xsl:template match="HyperlinkTextDestination[contains(@BookMarkDestination,'_UUID_') or contains(@BookMarkDestination,'story') or contains(@Name,'_UUID_') or contains(lower-case(@Name),'_story_')]|XMLInstruction|w:t|XMLAttribute|w:tcPr|w:trHeight|InCopyExportOption|w:r|w:numPr|Change|w:ilvl|w:numId">
        <xsl:apply-templates/>
    </xsl:template>

<!-- BOOKMARKs -->  
    <xsl:template match="w:bookmarkStart">
        <xsl:variable name="bmId" select="@w:id"/>
        <xsl:text disable-output-escaping="yes">&lt;span data-bkmark="</xsl:text>
        <xsl:value-of select="@w:name"/>    
        <xsl:text disable-output-escaping="yes">"</xsl:text>
        <xsl:if test="contains(@w:name, 'BM')">
            <xsl:text disable-output-escaping="yes"> style="color:#e3686a;cursor:pointer;"</xsl:text>
        </xsl:if>    
        <!-- 25-APR-17: added extra style att. for Mariselvam's ckeditor END-->
        <xsl:text disable-output-escaping="yes">&gt;</xsl:text><xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
    </xsl:template>
    <xsl:template match="w:bookmarkEnd">
        <xsl:variable name="bmId" select="@w:id"/>
        <xsl:text disable-output-escaping="yes">&lt;span data-bkmark="</xsl:text>
        <xsl:value-of select="preceding::w:bookmarkStart[@w:id = $bmId][1]/@w:name"/>    
        <xsl:text disable-output-escaping="yes">"</xsl:text>
        <xsl:if test="contains(@w:name, 'BM')">
            <xsl:text disable-output-escaping="yes"> style="color:#e3686a;cursor:pointer;"</xsl:text>
        </xsl:if>    
        <!-- 25-APR-17: added extra style att. for Mariselvam's ckeditor END-->
        <xsl:text disable-output-escaping="yes">&gt;</xsl:text><xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
    </xsl:template>  
<!-- BOOKMARKs END-->

<!-- COMMENTS -->
    
    <xsl:template match="w:commentReference">
        <xsl:variable name="commentN" select="@w:id"/>
        <xsl:element name="span">
            <xsl:attribute name="data-src" select="''"/>
            <xsl:attribute name="style" select="'cursor:pointer;font-size:14px;vertical-align:super;'"/>
            <xsl:attribute name="data-comment">
                <xsl:text>cmt</xsl:text>
                <xsl:value-of select="$commentN"/>          
            </xsl:attribute>
            <!--commented for marriapan on 24-08-2021-->
            <!--<xsl:element name="img">
                <xsl:attribute name="style" select="'width:15px;height:15px;cursor:pointer;'"/>
                <xsl:attribute name="data-commentimg">
                    <xsl:text>cmt</xsl:text>
                    <xsl:value-of select="$commentN"/>          
                </xsl:attribute>  
                <xsl:attribute name="data-src" select="'ckeditor/images/comment.svg'"/>        
            </xsl:element>-->
            <!--Added for wycywyg on 24-03-2021-->
            <!-- Added for pagebreak retained as instruction on 23-3-2022 -->
            <xsl:element name="span">
                <xsl:if test="following::w:comments/w:comment[@w:id = $commentN][not(contains(@data-noteID,'RRH') or contains(@data-noteID,'LRH') or contains(@data-noteID,'SPACE') or contains(@data-noteID,'IMG') or contains(@data-noteID,'VRH') or contains(@data-noteID,'POSITION') or contains(@data-noteID,'ORIENTATION') or contains(@data-noteID,'PAGE BREAK'))]">
                <xsl:attribute name="style" select="'width:15px;height:15px;cursor:pointer;'"/>
                </xsl:if>
                <xsl:if test="following::w:comments/w:comment[@w:id = $commentN][contains(@data-noteID,'RRH') or contains(@data-noteID,'LRH') or contains(@data-noteID,'SPACE') or contains(@data-noteID,'IMG') or contains(@data-noteID,'VRH') or contains(@data-noteID,'POSITION') or contains(@data-noteID,'ORIENTATION') or contains(@data-noteID,'PAGE BREAK')]">
                    <xsl:attribute name="style" select="'cursor:pointer;'"/>
                </xsl:if>
                <xsl:attribute name="data-commentimg">
                    <xsl:text>cmt</xsl:text>
                    <xsl:value-of select="$commentN"/>
                </xsl:attribute>
                
                <xsl:choose>
                    <xsl:when test="following::w:comments/w:comment[@w:id = $commentN][not(contains(@data-noteID,'RRH') or contains(@data-noteID,'LRH') or contains(@data-noteID,'SPACE') or contains(@data-noteID,'IMG') or contains(@data-noteID,'VRH') or contains(@data-noteID,'POSITION') or contains(@data-noteID,'ORIENTATION') or contains(@data-noteID,'PAGE BREAK'))]">
                        <xsl:attribute name="class" select="'comment-image'"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:attribute name="class" select="'instruction-image'"/>
                    </xsl:otherwise>
                </xsl:choose>
                
                <xsl:text disable-output-escaping="yes">&#x200C;</xsl:text>
                </xsl:element>
            <xsl:text disable-output-escaping="yes">&#x200C;</xsl:text>
        </xsl:element>
    </xsl:template>
    
    
    
    <xsl:template match="w:comments">
        <xsl:text>&#x000A;</xsl:text>
        <xsl:element name="div">
            <xsl:attribute name="id" select="'comment_'"/>
            <xsl:attribute name="style" select="'display:none'"/>
            <xsl:text>&#x000A;</xsl:text>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="w:comment">
        <xsl:variable name="commentN" select="@w:id"/>
        <xsl:variable name="commentValue" select="."/>        
        
        <xsl:text>&#x000A;</xsl:text>
        <xsl:element name="CommentReference">
            <xsl:attribute name="data-commentvalue">
                <xsl:text>cmt</xsl:text>
                <xsl:value-of select="$commentN"/>
            </xsl:attribute>
            <!-- 1-1-18: to retain sree's KeyValuePair -->
            <xsl:if test="@data-noteID">                
                <xsl:attribute name="data-noteID" select="@data-noteID"/>
            </xsl:if>
            <!--<xsl:text>[</xsl:text>
          <xsl:value-of select="//w:document/w:comments/w:comment[@w:id=$commentN]/@w:initials"/>
          <xsl:value-of select="$commentN + 1"/>
          <xsl:text>]</xsl:text>-->
            <!-- xsl:for-each select="w:document/w:comments/w:comment[@w:id=$commentN] -->
            
            <xsl:text>&#x000A;</xsl:text>
                <xsl:element name="Comment">
                    <xsl:attribute name="data-commentid">
                        <xsl:value-of select="generate-id()"/>
                    </xsl:attribute>
                    <xsl:attribute name="data-user" select="substring-before($commentValue, ':')"/>
                    <xsl:apply-templates/>
                </xsl:element>
                <xsl:text>&#x000A;</xsl:text>            
        </xsl:element>
        <xsl:text>&#x000A;</xsl:text>        
    </xsl:template>
    
<!-- COMMENTS END--> 
    
<!-- Footnote coding CK editor-->
  <xsl:template match="w:footnoteReference">    
  <!-- added by hari 31.5.2017    -->
    <xsl:variable name="footnoteClass">
      <xsl:choose>
        <xsl:when test="ancestor::w:del">
          <xsl:value-of select="'footnotecitationdeleted'"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="'footnotecitation'"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
      <xsl:element name="a">
        <!--<xsl:attribute name="class" select="'footnotecitation'"/>-->
        <!-- added by hari 31.5.2017    -->
        <xsl:attribute name="class" select="$footnoteClass"/>
        <xsl:attribute name="style">
          <xsl:text>mso-footnote-id:ftn</xsl:text>
          <xsl:choose>
            <xsl:when test="ancestor::w:del">
              <xsl:value-of select="@w:id"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:number level="any" count="w:footnoteReference[not(ancestor::w:del)]"/>
            </xsl:otherwise>
          </xsl:choose>
          <!-- As per Hari;s idea i used the above choose -->
          <!--<xsl:value-of select="@w:id"/>-->
        </xsl:attribute>
        <xsl:attribute name="href">
          <xsl:text>#_ftn</xsl:text>
          <xsl:choose>
            <xsl:when test="ancestor::w:del">
              <xsl:value-of select="@w:id"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:number level="any" count="w:footnoteReference[not(ancestor::w:del)]"/>
            </xsl:otherwise>
          </xsl:choose>
          <!-- As per Hari;s idea i used the above choose -->
          <!--<xsl:value-of select="@w:id"/>-->
        </xsl:attribute>
        <xsl:attribute name="name">
          <xsl:text>_ftnref</xsl:text>
          <xsl:choose>
            <xsl:when test="ancestor::w:del">
              <xsl:value-of select="@w:id"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:number level="any" count="w:footnoteReference[not(ancestor::w:del)]"/>
            </xsl:otherwise>
          </xsl:choose>
          <!-- As per Hari;s idea i used the above choose -->
          <!--<xsl:value-of select="@w:id"/>-->
        </xsl:attribute>
          
        <xsl:element name="span">
          <xsl:attribute name="class" select="'MsoFootnoteReference'"/>                  
          <!--<xsl:value-of select="concat('[',@w:id,']')"/>-->
          <!-- As per Hari;s idea i used the above choose -->  
          <xsl:choose>
            <xsl:when test="ancestor::w:del">
              <!--<xsl:value-of select="concat('[',@w:id,']')"/>-->
                <xsl:value-of select="@w:id"/>
            </xsl:when>
            <xsl:otherwise>
              <!--<xsl:text>[</xsl:text>-->
              <xsl:number level="any" count="w:footnoteReference[not(ancestor::w:del)]"/>
              <!--<xsl:text>]</xsl:text>-->
            </xsl:otherwise>
          </xsl:choose>
        </xsl:element>
      </xsl:element>    
  </xsl:template>
  
<!-- FOOTNOTE captions -->
<xsl:template match="//w:footnotes">  

    <xsl:apply-templates select="w:footnote" mode="footnote"/>
</xsl:template>
  
  <!-- @@@FOOTNOTE $$$$-->
  <xsl:template match="w:footnote" mode="footnote">
      <xsl:variable name="footnoteID" select="@w:id"/>
      <xsl:choose>
        <xsl:when test="@w:type = 'continuationSeparator'"/>
        <xsl:when test="@w:type = 'separator'"/>
        <xsl:when test="@w:type = 'continuationNotice'"></xsl:when>
        <xsl:otherwise>
          <!-- added by hari 31.5.2017         -->
          <xsl:variable name="footnoteCpationClass">
            <xsl:choose>
              <xsl:when test="descendant::w:del">
                <xsl:value-of select="'footnotecaptiondeleted'"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="'footnotecaption'"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:variable>
          <xsl:element name="div">
            <!--<xsl:attribute name="class" select="'footnotecaption'"/>-->
            <!-- added by hari 31.5.2017         -->
            <xsl:attribute name="class" select="$footnoteCpationClass"/>
            <xsl:attribute name="style" select="'mso-element:footnote'"/>
            <xsl:attribute name="id">
              <xsl:text>ftn</xsl:text>
              <xsl:choose>
                <xsl:when test="self::w:footnote/descendant::w:rStyle[@w:val ='FootnoteReference'][(ancestor::w:del)]">
                  <xsl:value-of select="@w:id"/>
                </xsl:when>
                <xsl:when test="self::w:footnote/descendant::w:rStyle[@w:val ='FootnoteReference0'][(ancestor::w:del)]">
                  <xsl:value-of select="@w:id"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:choose>
                    <xsl:when test="self::w:footnote/descendant::w:rStyle[@w:val ='FootnoteReference']">
                      <xsl:number level="any" count="w:footnote[descendant::w:rStyle[@w:val ='FootnoteReference'][not(ancestor::w:del)]]"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:number level="any" count="w:footnote[descendant::w:rStyle[@w:val ='FootnoteReference0'][not(ancestor::w:del)]]"/>
                    </xsl:otherwise>
                  </xsl:choose>
                  <!--<xsl:number level="any" count="w:footnote[descendant::w:rStyle[@w:val ='FootnoteReference'][not(ancestor::w:del)]]"/>-->
                </xsl:otherwise>
              </xsl:choose>
              <!-- As per Hari;s idea i used the above choose -->
              <!--<xsl:value-of select="@w:id"/>-->
            </xsl:attribute>
            <xsl:attribute name="itemid">
              <xsl:text>ftn</xsl:text>
              <xsl:choose>
                <xsl:when test="self::w:footnote/descendant::w:rStyle[@w:val ='FootnoteReference'][(ancestor::w:del)]">
                  <xsl:value-of select="@w:id"/>
                  <xsl:text>_deleted</xsl:text>
                </xsl:when>
                <xsl:when test="self::w:footnote/descendant::w:rStyle[@w:val ='FootnoteReference0'][(ancestor::w:del)]">
                  <xsl:value-of select="@w:id"/>
                  <xsl:text>_deleted</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:choose>
                    <xsl:when test="self::w:footnote/descendant::w:rStyle[@w:val ='FootnoteReference']">
                      <xsl:number level="any" count="w:footnote[descendant::w:rStyle[@w:val ='FootnoteReference'][not(ancestor::w:del)]]"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:number level="any" count="w:footnote[descendant::w:rStyle[@w:val ='FootnoteReference0'][not(ancestor::w:del)]]"/>
                    </xsl:otherwise>
                  </xsl:choose>
                  <!--<xsl:number level="any" count="w:footnote[descendant::w:rStyle[@w:val ='FootnoteReference'][not(ancestor::w:del)]]"/>-->
                </xsl:otherwise>
              </xsl:choose>
              <!-- As per Hari;s idea i used the above choose -->
              <!--<xsl:value-of select="@w:id"/>-->
            </xsl:attribute>
            <xsl:text>&#x000A;</xsl:text>
              
              <!--<xsl:element name="a">
                  <xsl:attribute name="style">
                      <xsl:text>mso-footnote-id:ftn</xsl:text>
                      <xsl:choose>
                          <xsl:when test="self::w:footnote/descendant::w:rStyle[@w:val ='FootnoteReference'][(ancestor::w:del)]">
                              <xsl:value-of select="@w:id"/>
                          </xsl:when>
                          <xsl:when test="self::w:footnote/descendant::w:rStyle[@w:val ='FootnoteReference0'][(ancestor::w:del)]">
                              <xsl:value-of select="@w:id"/>
                          </xsl:when>
                          <xsl:otherwise>
                              <xsl:choose>
                                  <xsl:when test="self::w:footnote/descendant::w:rStyle[@w:val ='FootnoteReference']">
                                      <xsl:number level="any" count="w:footnote[descendant::w:rStyle[@w:val ='FootnoteReference'][not(ancestor::w:del)]]"/>
                                  </xsl:when>
                                  <xsl:otherwise>
                                      <xsl:number level="any" count="w:footnote[descendant::w:rStyle[@w:val ='FootnoteReference0'][not(ancestor::w:del)]]"/>
                                  </xsl:otherwise>
                              </xsl:choose>
                          </xsl:otherwise>
                      </xsl:choose>
                  </xsl:attribute>
                  <xsl:attribute name="href">
                      <xsl:text>#_ftnref</xsl:text>
                      <xsl:choose>
                          <xsl:when test="child::w:pPr/w:pStyle[@w:val = 'Footnote']"><!-\- self::w:footnote/descendant::w:rStyle[@w:val ='FootnoteReference'][(ancestor::w:del)]-\->
                              <xsl:value-of select="$footnoteID"/>
                          </xsl:when>
                          <xsl:when test="self::w:footnote/descendant::w:rStyle[@w:val ='FootnoteReference0'][(ancestor::w:del)]">
                              <xsl:value-of select="$footnoteID"/>
                          </xsl:when>
                          <xsl:otherwise>
                              <!-\-<xsl:choose>
                        <xsl:when test="self::w:footnote/descendant::w:rStyle[@w:val ='FootnoteReference']">
                          <xsl:number level="any" count="w:footnote[descendant::w:rStyle[@w:val ='FootnoteReference'][not(ancestor::w:del)]]"/>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:number level="any" count="w:footnote[descendant::w:rStyle[@w:val ='FootnoteReference0'][not(ancestor::w:del)]]"/>
                        </xsl:otherwise>
                      </xsl:choose>-\->
                              <xsl:value-of select="$footnoteID"/>
                          </xsl:otherwise>
                      </xsl:choose>
                  </xsl:attribute>
                  <xsl:attribute name="name">
                      <xsl:text>_ftn</xsl:text>
                      <xsl:choose>
                          <xsl:when test="self::w:footnote/descendant::w:rStyle[@w:val ='FootnoteReference'][(ancestor::w:del)]">
                              <xsl:value-of select="@w:id"/>
                          </xsl:when>
                          <xsl:when test="self::w:footnote/descendant::w:rStyle[@w:val ='FootnoteReference0'][(ancestor::w:del)]">
                              <xsl:value-of select="@w:id"/>
                          </xsl:when>
                          <xsl:otherwise>
                              <xsl:choose>
                                  <xsl:when test="self::w:footnote/descendant::w:rStyle[@w:val ='FootnoteReference']">
                                      <xsl:number level="any" count="w:footnote[descendant::w:rStyle[@w:val ='FootnoteReference'][not(ancestor::w:del)]]"/>
                                  </xsl:when>
                                  <xsl:otherwise>
                                      <xsl:number level="any" count="w:footnote[descendant::w:rStyle[@w:val ='FootnoteReference0'][not(ancestor::w:del)]]"/>
                                  </xsl:otherwise>
                              </xsl:choose>
                              <!-\-<xsl:number level="any" count="w:footnote[descendant::w:rStyle[@w:val ='FootnoteReference'][not(ancestor::w:del)]]"/>-\->
                          </xsl:otherwise>
                      </xsl:choose>
                      <!-\- As per Hari;s idea i used the above choose -\->
                      <!-\-<xsl:value-of select="@w:id"/>-\->
                  </xsl:attribute>
                  <xsl:element name="span">
                      <xsl:attribute name="class" select="'MsoFootnoteReference'"/>
                      <xsl:attribute name="data-type" select="'number'"/>
                      <xsl:value-of select="$footnoteID"/>
                  </xsl:element>            
              </xsl:element>  -->               
              <!-- Added to retain the multiple footnote para on 23-7-2022 -->
         <xsl:for-each select="descendant::w:p">
            <xsl:element name="p">
              <!--<xsl:attribute name="class" select="'MsoFootnoteText'"/>-->
                <xsl:attribute name="class"><xsl:value-of select="self::w:p/w:pPr/child::w:pStyle[1]/@w:val"/></xsl:attribute>
                <xsl:attribute name="data-name"><xsl:value-of select="self::w:p/w:pPr/child::w:pStyle[1]/@w:val"/></xsl:attribute>
                <!-- alink -->
                <xsl:element name="a">
                    <xsl:attribute name="style">
                        <xsl:text>mso-footnote-id:ftn</xsl:text>
                        <xsl:choose>
                            <xsl:when test="self::w:footnote/descendant::w:rStyle[@w:val ='FootnoteReference'][(ancestor::w:del)]">
                                <xsl:value-of select="@w:id"/>
                            </xsl:when>
                            <xsl:when test="self::w:footnote/descendant::w:rStyle[@w:val ='FootnoteReference0'][(ancestor::w:del)]">
                                <xsl:value-of select="@w:id"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:choose>
                                    <xsl:when test="self::w:footnote/descendant::w:rStyle[@w:val ='FootnoteReference']">
                                        <xsl:number level="any" count="w:footnote[descendant::w:rStyle[@w:val ='FootnoteReference'][not(ancestor::w:del)]]"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:number level="any" count="w:footnote[descendant::w:rStyle[@w:val ='FootnoteReference0'][not(ancestor::w:del)]]"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
                    <xsl:attribute name="href">
                        <xsl:text>#_ftnref</xsl:text>
                        <xsl:choose>
                            <xsl:when test="child::w:pPr/w:pStyle[@w:val = 'Footnote']"><!-- self::w:footnote/descendant::w:rStyle[@w:val ='FootnoteReference'][(ancestor::w:del)]-->
                                <xsl:value-of select="$footnoteID"/>
                            </xsl:when>
                            <xsl:when test="self::w:footnote/descendant::w:rStyle[@w:val ='FootnoteReference0'][(ancestor::w:del)]">
                                <xsl:value-of select="$footnoteID"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <!--<xsl:choose>
                        <xsl:when test="self::w:footnote/descendant::w:rStyle[@w:val ='FootnoteReference']">
                          <xsl:number level="any" count="w:footnote[descendant::w:rStyle[@w:val ='FootnoteReference'][not(ancestor::w:del)]]"/>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:number level="any" count="w:footnote[descendant::w:rStyle[@w:val ='FootnoteReference0'][not(ancestor::w:del)]]"/>
                        </xsl:otherwise>
                      </xsl:choose>-->
                                <xsl:value-of select="$footnoteID"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
                    <xsl:attribute name="name">
                        <xsl:text>_ftn</xsl:text>
                        <xsl:choose>
                            <xsl:when test="child::w:pPr/w:pStyle[@w:val = 'Footnote']"><!-- self::w:footnote/descendant::w:rStyle[@w:val ='FootnoteReference'][(ancestor::w:del)]-->
                                <xsl:value-of select="$footnoteID"/>
                            </xsl:when>
                            <xsl:when test="self::w:footnote/descendant::w:rStyle[@w:val ='FootnoteReference0'][(ancestor::w:del)]">
                                <xsl:value-of select="$footnoteID"/>
                            </xsl:when>
                            <xsl:when test="self::w:footnote/descendant::w:rStyle[@w:val ='FootnoteReference'][(ancestor::w:del)]">
                                <xsl:value-of select="@w:id"/>
                            </xsl:when>
                            <xsl:when test="self::w:footnote/descendant::w:rStyle[@w:val ='FootnoteReference0'][(ancestor::w:del)]">
                                <xsl:value-of select="@w:id"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:choose>
                                    <xsl:when test="self::w:footnote/descendant::w:rStyle[@w:val ='FootnoteReference']">
                                        <xsl:number level="any" count="w:footnote[descendant::w:rStyle[@w:val ='FootnoteReference'][not(ancestor::w:del)]]"/>
                                    </xsl:when>
                                    <xsl:when test="self::w:footnote/descendant::w:rStyle[@w:val ='FootnoteReference0'][(ancestor::w:del)]">
                                        <xsl:number level="any" count="w:footnote[descendant::w:rStyle[@w:val ='FootnoteReference0'][not(ancestor::w:del)]]"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="$footnoteID"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <!--<xsl:number level="any" count="w:footnote[descendant::w:rStyle[@w:val ='FootnoteReference'][not(ancestor::w:del)]]"/>-->
                            </xsl:otherwise>
                        </xsl:choose>
                        <!-- As per Hari;s idea i used the above choose -->
                        <!--<xsl:value-of select="@w:id"/>-->
                    </xsl:attribute>
                    <xsl:element name="span">
                        <xsl:attribute name="class" select="'MsoFootnoteReference'"/>
                        <xsl:attribute name="data-type" select="'number'"/>
                        <!-- Added for nap split xhtml on 19-5-2025 -->
                        <xsl:text disable-output-escaping="yes">&lt;sup&gt;</xsl:text>
                        <xsl:value-of select="$footnoteID"/>
                        <xsl:text disable-output-escaping="yes">&lt;/sup&gt;</xsl:text>
                    </xsl:element>            
                </xsl:element>  
                <!-- end -->
              <!-- to get the footnote bookmarks -->
                <xsl:choose>
                    <xsl:when test="self::w:p/w:bookmarkStart">
                            <xsl:variable name="bmId" select="@w:id"/>
                            <xsl:text disable-output-escaping="yes">&lt;span data-bkmark="</xsl:text>
                        <xsl:value-of select="self::w:p/w:bookmarkStart/@w:name"/>
                            <xsl:text disable-output-escaping="yes">"</xsl:text>
                            <xsl:text disable-output-escaping="yes">/&gt;</xsl:text>   
                            <xsl:if test="$bmId = //w:bookmarkEnd/@w:id">
                            </xsl:if>
                        </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="child::w:p/w:bookmarkStart">
                            <xsl:variable name="bmId" select="@w:id"/>
                            <xsl:text disable-output-escaping="yes">&lt;span data-bkmark="</xsl:text>
                            <xsl:value-of select="child::w:p/w:bookmarkStart/@w:name"/>
                            <xsl:text disable-output-escaping="yes">"</xsl:text>
                            <xsl:text disable-output-escaping="yes">/&gt;</xsl:text>   
                            <xsl:if test="$bmId = //w:bookmarkEnd/@w:id">
                            </xsl:if>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:choose>
                    <xsl:when test="self::w:p[@w:rsidR]">
                        <xsl:variable name="bmId" select="@w:rsidR"/>
                        <xsl:text disable-output-escaping="yes">&lt;span data-bkmark="</xsl:text>
                        <xsl:value-of select="self::w:p/@w:rsidR"/>
                        <xsl:text disable-output-escaping="yes">"</xsl:text>
                        <xsl:text disable-output-escaping="yes">/&gt;</xsl:text>   
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="child::w:p[@w:rsidR]">
                            <xsl:variable name="bmId" select="@w:rsidR"/>
                            <xsl:text disable-output-escaping="yes">&lt;span data-bkmark="</xsl:text>
                            <xsl:value-of select="child::w:p/@w:rsidR"/>
                            <xsl:text disable-output-escaping="yes">"</xsl:text>
                            <xsl:text disable-output-escaping="yes">/&gt;</xsl:text>  
                            
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
               <xsl:choose>
                   <xsl:when test="self::w:p/w:ins">                  
                  <xsl:element name="span">
                    <xsl:attribute name="class" select="'msoIns'"/>
                    <xsl:element name="ins">
                      <xsl:attribute name="class" select="'ice-ins ice-cts'"/>
                      <xsl:attribute name="cite">
                        <xsl:text>mailto:</xsl:text>
                        <xsl:value-of select="@w:author"/>
                      </xsl:attribute>
                      <xsl:attribute name="datetime" select="@w:date"/>
                      <xsl:for-each select="w:p">
                        <xsl:text>&#x000A;</xsl:text>
                        <xsl:element name="p">
                          <!--<xsl:attribute name="class" select="'MsoFootnoteText'"/>-->
                            <xsl:attribute name="class"><xsl:value-of select="self::w:p/w:pPr/child::w:pStyle[1]/@w:val"/></xsl:attribute>
                            <xsl:attribute name="data-name"><xsl:value-of select="self::w:p/w:pPr/child::w:pStyle[1]/@w:val"/></xsl:attribute>
                          <xsl:apply-templates select="w:ins/w:r"/>
                        </xsl:element>
                      </xsl:for-each>
                      <!--<xsl:apply-templates select="w:p/w:ins/w:r"/>--> 
                    </xsl:element>   
                  </xsl:element>
                </xsl:when>
                <xsl:when test="self::w:p/w:del">
                  <!--<xsl:apply-templates select="w:p/w:del/w:r"/>  -->
                  <xsl:element name="span">
                    <xsl:attribute name="class" select="'msoDel'"/>
                    <xsl:element name="del">
                      <xsl:attribute name="class" select="'ice-del ice-cts'"/>
                      <xsl:attribute name="cite">
                        <xsl:text>mailto:</xsl:text>
                        <xsl:value-of select="@w:author"/>
                      </xsl:attribute>
                      <xsl:attribute name="datetime" select="@w:date"/>
                      <xsl:for-each select="w:p">
                        <xsl:text>&#x000A;</xsl:text>
                        <xsl:element name="p">
                          <!--<xsl:attribute name="class" select="'MsoFootnoteText'"/>-->
                            <xsl:attribute name="class"><xsl:value-of select="self::w:p/w:pPr/child::w:pStyle[1]/@w:val"/></xsl:attribute>
                            <xsl:attribute name="data-name"><xsl:value-of select="self::w:p/w:pPr/child::w:pStyle[1]/@w:val"/></xsl:attribute>
                          <xsl:apply-templates select="w:del/w:r"/>
                        </xsl:element>
                      </xsl:for-each>
                      <!--<xsl:apply-templates select="w:p/w:del/w:r"/>-->
                    </xsl:element>   
                  </xsl:element>
                </xsl:when>
                <xsl:otherwise>
                      <xsl:apply-templates/>
                </xsl:otherwise>
              </xsl:choose>
              
              <xsl:choose>
                  <xsl:when test="self::w:p/w:bookmarkEnd">
                      
                      <xsl:variable name="bmId" select="self::w:p/w:bookmarkEnd/@w:id"/>
                          
                          <xsl:text disable-output-escaping="yes">&lt;span data-bkmark="</xsl:text>
                      <xsl:value-of select="self::w:p/w:bookmarkStart[@w:id = $bmId][1]/@w:name"/>    
                          <xsl:text disable-output-escaping="yes">"</xsl:text>
                          <xsl:if test="contains(@w:name, 'BM')">
                              <xsl:text disable-output-escaping="yes"> style="color:#e3686a;cursor:pointer;"</xsl:text>
                          </xsl:if>    
                          <!-- 25-APR-17: added extra style att. for Mariselvam's ckeditor END-->
                          <xsl:text disable-output-escaping="yes">/&gt;</xsl:text>                 
                      
                  </xsl:when>
                  <xsl:otherwise>
                      <xsl:if test="child::w:p/w:bookmarkEnd">
                          <xsl:variable name="bmId" select="child::w:p/w:bookmarkEnd/@w:id"/>
                          
                          <xsl:text disable-output-escaping="yes">&lt;span data-bkmark="</xsl:text>
                          <xsl:value-of select="child::w:p/w:bookmarkStart[@w:id = $bmId][1]/@w:name"/>    
                          <xsl:text disable-output-escaping="yes">"</xsl:text>
                          <xsl:if test="contains(@w:name, 'BM')">
                              <xsl:text disable-output-escaping="yes"> style="color:#e3686a;cursor:pointer;"</xsl:text>
                          </xsl:if>    
                          <!-- 25-APR-17: added extra style att. for Mariselvam's ckeditor END-->
                          <xsl:text disable-output-escaping="yes">/&gt;</xsl:text>                 
                      </xsl:if>
                  </xsl:otherwise>
              </xsl:choose>
                
                <xsl:choose>
                    <xsl:when test="self::w:p[@w:rsidR]">
                            <xsl:variable name="bmId" select="@w:rsidR"/>
                            <xsl:text disable-output-escaping="yes">&lt;span data-bkmark="</xsl:text>
                        <xsl:value-of select="self::w:p/@w:rsidR"/>
                            <xsl:text disable-output-escaping="yes">"</xsl:text>
                            <xsl:text disable-output-escaping="yes">/&gt;</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="child::w:p[@w:rsidR]">
                            <xsl:variable name="bmId" select="@w:rsidR"/>
                            <xsl:text disable-output-escaping="yes">&lt;span data-bkmark="</xsl:text>
                            <xsl:value-of select="child::w:p/@w:rsidR"/>
                            <xsl:text disable-output-escaping="yes">"</xsl:text>
                            <xsl:text disable-output-escaping="yes">/&gt;</xsl:text>  
                            
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
                
                
            </xsl:element>
         </xsl:for-each>
              <!-- End -->
          </xsl:element>
          
        </xsl:otherwise>
      </xsl:choose>
      
      
      <xsl:text>&#x000A;</xsl:text>
    
  </xsl:template>
  <!--<xsl:template match="w:footnotes"/>-->
  
    <!-- FOOTNOTEs -->
    
<!-- FOOTNOTEs END-->    
    
<!-- ENDNOTEs -->
    <xsl:template match="//w:endnoteRef">
        <xsl:element name="sup"><xsl:number from="/" level="any" format="1"/></xsl:element>
    </xsl:template>
    
    <xsl:template match="w:endnoteReference">
        <xsl:variable name="referenced-id" select="@w:id"/>
        <xsl:element name="sup">
            <xsl:element name="a">
                <!-- Added for marriapan edior on 22-02-2022 -->
                <xsl:attribute name="class" select="'endnotecitation'"/>
                <xsl:attribute name="data-type" select="'number'"/>
                <!-- End -->
                <xsl:attribute name="id">
                    <xsl:value-of select="'eref'"/>
                    <xsl:number format="1" count="w:endnoteReference" level="any"/>
                </xsl:attribute>
                <xsl:attribute name="href" select="concat($filename,'.xhtml#e',$referenced-id)"/>
                <xsl:value-of select="$referenced-id"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    
<!-- ENDNOTEs END-->  
    
    <!-- Track changes -->
    <xsl:template match="w:ins[not(parent::w:rPr)]">
        <xsl:element name="span">
            <xsl:attribute name="class" select="'msoIns'"/>
            <xsl:element name="ins">
                <xsl:attribute name="class" select="'ice-ins ice-cts'"/>        
                <xsl:attribute name="cite">
                    <xsl:text>mailto:</xsl:text>
                    <xsl:value-of select="@w:author"/>
                </xsl:attribute>
                <xsl:attribute name="datetime" select="@w:date"/>
                <xsl:apply-templates/>
            </xsl:element>   
        </xsl:element>
    </xsl:template>
    <xsl:template match="w:ins[parent::w:rPr]">
        <xsl:element name="span">
            <xsl:attribute name="class" select="'msoIns'"/>
            <xsl:element name="ins">
                <xsl:attribute name="class" select="'ice-ins ice-cts'"/>
                <xsl:attribute name="cite">
                    <xsl:text>mailto:</xsl:text>
                    <xsl:value-of select="@w:author"/>
                </xsl:attribute>
                <xsl:attribute name="datetime" select="@w:date"/>
                <xsl:apply-templates/>
            </xsl:element>   
        </xsl:element>
    </xsl:template>
    <xsl:template match="//w:footnote/w:p/w:ins">
        <xsl:element name="span">
            <xsl:attribute name="class" select="'msoIns'"/>
            <xsl:element name="ins">
                <xsl:attribute name="class" select="'ice-ins ice-cts'"/>
                <xsl:attribute name="cite">
                    <xsl:text>mailto:</xsl:text>
                    <xsl:value-of select="@w:author"/>
                </xsl:attribute>
                <xsl:attribute name="datetime" select="@w:date"/>
                <xsl:apply-templates/>
            </xsl:element>   
        </xsl:element>
    </xsl:template>
    <xsl:template match="w:moveTo[not(parent::w:rPr)]">
        <xsl:element name="span">
            <xsl:attribute name="class" select="'msoIns'"/>
            <xsl:text>&#x000A;</xsl:text>
            <xsl:element name="ins">
                <xsl:attribute name="class" select="'ice-ins ice-cts'"/>
                <xsl:attribute name="cite">
                    <xsl:text>mailto:</xsl:text>
                    <xsl:value-of select="@w:author"/>
                </xsl:attribute>
                <xsl:attribute name="datetime" select="@w:date"/>
                <xsl:apply-templates/>
            </xsl:element>   
            <xsl:text>&#x000A;</xsl:text>
        </xsl:element>
        <xsl:text>&#x000A;</xsl:text>
    </xsl:template>
    <xsl:template match="w:del[not(parent::w:rPr)]">
        <xsl:element name="span">
            <xsl:attribute name="class" select="'msoDel'"/>
            <xsl:text>&#x000A;</xsl:text>
            <xsl:element name="del">
                <xsl:attribute name="class" select="'ice-del ice-cts'"/>
                <xsl:attribute name="cite">
                    <xsl:text>mailto:</xsl:text>
                    <xsl:value-of select="@w:author"/>
                </xsl:attribute>
                <xsl:attribute name="datetime" select="@w:date"/>
                <!--<xsl:value-of select="w:r/w:delText"/>-->
                <xsl:apply-templates/>
            </xsl:element>   
            <xsl:text>&#x000A;</xsl:text>
        </xsl:element>
    </xsl:template>
    
    
    <!-- 02-Feb-17 As per Santa's requirement i've included the below -->
    <xsl:template match="w:del[parent::w:rPr]">
        <xsl:element name="span">
            <xsl:attribute name="class" select="'msoDel'"/>
            <xsl:element name="del">
                <xsl:attribute name="class" select="'ice-del ice-cts'"/>
                <xsl:attribute name="cite">
                    <xsl:text>mailto:</xsl:text>
                    <xsl:value-of select="@w:author"/>
                </xsl:attribute>
                <xsl:attribute name="datetime" select="@w:date"/>
                <xsl:value-of select="w:r/w:delText"/>
            </xsl:element>  
        </xsl:element>
    </xsl:template>
    <xsl:template match="w:delText">
        <xsl:apply-templates/>
    </xsl:template>
    
    
    <!-- END Santa's requirement i've included the below -->
    <xsl:template match="w:moveFrom[not(parent::w:rPr)]">
        <xsl:element name="span">
            <xsl:attribute name="class" select="'msoDel'"/>
            <xsl:text>&#x000A;</xsl:text>
            <xsl:element name="del">
                <xsl:attribute name="class" select="'ice-del ice-cts'"/>
                <xsl:attribute name="cite">
                    <xsl:text>mailto:</xsl:text>
                    <xsl:value-of select="@w:author"/>
                </xsl:attribute>
                <xsl:attribute name="datetime" select="@w:date"/>
                <xsl:value-of select="w:r"/>
            </xsl:element>   
            <xsl:text>&#x000A;</xsl:text>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="//w:endnoteRef">
        <xsl:element name="sup"><xsl:number from="/" level="any" format="1"/></xsl:element>
    </xsl:template>
    <!-- Track change ENDS -->
    <xsl:template match="//w:drawing"><!-- For Hari IDML2Word -->
        <xsl:variable name="imgnameid" select="wp:inline/a:graphic/a:graphicData/pic:pic/pic:blipFill/a:blip/@r:embed"/>
        <xsl:variable name="imgnameid2" select="wp:anchor/a:graphic/a:graphicData/pic:pic/pic:blipFill/a:blip/@r:embed"/>
        <xsl:choose>
            <xsl:when test="wp:inline/a:graphic/a:graphicData/pic:pic/pic:blipFill/a:blip/@r:embed or wp:anchor/a:graphic/a:graphicData/pic:pic/pic:blipFill/a:blip[@r:embed]">
                <xsl:element name="img">
                    <!--Added for image size in wycywyg on 4-11-2020-->
                    <!--<xsl:if test="ancestor::p[@w:rsidR] | ancestor::w:p[@w:rsidR]">
                        
                        <xsl:attribute name="max-width">
                            <xsl:choose>
                                <xsl:when test="ancestor::p[@w:rsidR]">
                                    <xsl:value-of select="substring-before(substring-after(ancestor::p[@w:rsidR]/@w:rsidR,'W_'),'_H')"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="substring-before(substring-after(ancestor::w:p[@w:rsidR]/@w:rsidR,'W_'),'_H')"/>
                                </xsl:otherwise>
                            </xsl:choose>
                            
                        </xsl:attribute>
                        <xsl:attribute name="max-height">
                            <xsl:choose>
                                <xsl:when test="ancestor::p[@w:rsidR]">
                                    <xsl:value-of select="substring-before(substring-after(ancestor::p[@w:rsidR]/@w:rsidR,'H_'),'_C')"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="substring-before(substring-after(ancestor::w:p[@w:rsidR]/@w:rsidR,'H_'),'_C')"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                        <xsl:attribute name="width">
                            <xsl:value-of select="'auto'"/>
                        </xsl:attribute>
                        <xsl:attribute name="height">
                            <xsl:value-of select="'auto'"/>
                        </xsl:attribute>
                    </xsl:if>-->
                                
                    <xsl:attribute name="data-src">
                        <!--13-11-15: commented below to take the actual image name. I'm merging document.xml.rels "Relationships" to document.xml-->
                        <!--13-11-15: refer unzip.xml "\\10.1.1.1\Automation\WORD2XML\Word2HTML5\unzip.pl"-->
                        <xsl:for-each select="//Relationships/Relationship[@Id = $imgnameid]">
                            <xsl:variable name="imageName" select="//Relationships/Relationship[@Id = $imgnameid]/@Target"/>
                            <xsl:variable name="artmatch"
                                select="substring-after(//Relationships/Relationship[@Id = $imgnameid]/@Target, '/')"/>
                            <!--<xsl:value-of select="concat('../images/',substring-after(//Relationships/Relationship[@Id = $imgnameid]/@Target,'/'))"/>-->
                            <xsl:choose>
                                <xsl:when test="$PassArtPath = ''">
                                    <!-- Removed the image path for wiciwyg display the fileEntry images on 14-06-2024 Azure 15040 -->
                                    <!--<xsl:value-of select="concat('../images/',substring-after(//Relationships/Relationship[@Id = $imgnameid]/@Target,'/'))"/>-->
                                    <xsl:value-of select="substring-after(//Relationships/Relationship[@Id = $imgnameid]/@Target,'/')"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <!--<xsl:value-of select="concat($PassArtPath, '/', $artmatch)"/>-->
                                    <xsl:choose>
                                        <xsl:when test="contains(lower-case($artmatch),'.tiff') or contains(lower-case($artmatch),'.tif') or contains(lower-case($artmatch),'.psd') or contains(lower-case($artmatch),'.eps') or contains(lower-case($artmatch),'.ai') or contains(lower-case($artmatch),'.pdf') or contains(lower-case($artmatch),'.pptx')">
                                            <xsl:variable name="art-name">
                                                <!--<xsl:value-of select="replace(replace(replace(replace(replace(replace(replace(replace($artmatch,'.tiff','.jpg'),'.tif','.jpg'),'.psd','.jpg'),'.eps','.jpg'),'.ai','.jpg'),'.pdf','.jpg'),'.pptx','.jpg'),'%20','_')"/>-->
                                                <xsl:value-of select="replace($artmatch,'%20','_')"/>
                                            </xsl:variable>
                                            <!--<xsl:value-of select="concat($PassArtPath, '/Convert%20TO%20JPG/', $art-name)"/>-->
                                            <xsl:value-of select="$art-name"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:variable name="artmatch1">
                                                <xsl:value-of
                                                    select="replace($artmatch,'%20', '_')"/>
                                            </xsl:variable>
                                            
                                            <!--<xsl:value-of select="concat($PassArtPath, '/', $artmatch1)"/>-->
                                            <xsl:value-of select="$artmatch1"/>
                                            
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                        <xsl:for-each select="//Relationships/Relationship[@Id = $imgnameid2]">
                            <!--<xsl:value-of select="concat('../images/',substring-after(@Target,'/'))"/>-->
                            <xsl:value-of select="substring-after(@Target,'/')"/>
                        </xsl:for-each>
                        <!--<xsl:value-of
            select="concat('../images/', replace(replace(replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name, '.eps', '.jpg'), '.tif', '.jpg'), '%20', '_'))"
          />-->
                    </xsl:attribute>
                    <!-- src -->
                    <xsl:attribute name="src">
                        <!--13-11-15: commented below to take the actual image name. I'm merging document.xml.rels "Relationships" to document.xml-->
                        <!--13-11-15: refer unzip.xml "\\10.1.1.1\Automation\WORD2XML\Word2HTML5\unzip.pl"-->
                        <xsl:for-each select="//Relationships/Relationship[@Id = $imgnameid]">
                            <xsl:variable name="imageName" select="//Relationships/Relationship[@Id = $imgnameid]/@Target"/>
                            <xsl:variable name="artmatch"
                                select="substring-after(//Relationships/Relationship[@Id = $imgnameid]/@Target, '/')"/>
                            <!--<xsl:value-of select="concat('../images/',substring-after(//Relationships/Relationship[@Id = $imgnameid]/@Target,'/'))"/>-->
                            <xsl:choose>
                                <xsl:when test="$PassArtPath = ''">
                                    <!-- Removed the image path for wiciwyg display the fileEntry images on 14-06-2024 Azure 15040 -->
                                    <!--<xsl:value-of select="concat('../images/',substring-after(//Relationships/Relationship[@Id = $imgnameid]/@Target,'/'))"/>-->
                                    <xsl:value-of select="concat('Images/',substring-after(//Relationships/Relationship[@Id = $imgnameid]/@Target,'/'))"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <!--<xsl:value-of select="concat($PassArtPath, '/', $artmatch)"/>-->
                                    <xsl:choose>
                                        <xsl:when test="contains(lower-case($artmatch),'.tiff') or contains(lower-case($artmatch),'.tif') or contains(lower-case($artmatch),'.psd') or contains(lower-case($artmatch),'.eps') or contains(lower-case($artmatch),'.ai') or contains(lower-case($artmatch),'.pdf') or contains(lower-case($artmatch),'.pptx')">
                                            <xsl:variable name="art-name">
                                                
                                                <xsl:value-of select="replace(replace(replace(replace(replace(replace(replace(replace($artmatch,'.tiff','.jpg'),'.tif','.jpg'),'.psd','.jpg'),'.eps','.jpg'),'.ai','.jpg'),'.pdf','.jpg'),'.pptx','.jpg'),'%20','_')"/>
                                                <!--<xsl:value-of select="replace($artmatch,'%20','_')"/>-->
                                            </xsl:variable>
                                            <!--<xsl:value-of select="concat($PassArtPath, '/Convert%20TO%20JPG/', $art-name)"/>-->
                                            <xsl:value-of select="concat('Images/',$art-name)"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:variable name="artmatch1">
                                                <xsl:value-of
                                                    select="replace($artmatch,'%20', '_')"/>
                                            </xsl:variable>
                                            
                                            <!--<xsl:value-of select="concat($PassArtPath, '/', $artmatch1)"/>-->
                                            <xsl:value-of select="concat('Images/',$artmatch1)"/>
                                            
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                        <xsl:for-each select="//Relationships/Relationship[@Id = $imgnameid2]">
                            <!--<xsl:value-of select="concat('../images/',substring-after(@Target,'/'))"/>-->
                            <xsl:value-of select="concat('Images/',substring-after(@Target,'/'))"/>
                        </xsl:for-each>
                        <!--<xsl:value-of
            select="concat('../images/', replace(replace(replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name, '.eps', '.jpg'), '.tif', '.jpg'), '%20', '_'))"
          />-->
                    </xsl:attribute>
                    
                    <!-- End -->
                    <xsl:attribute name="alt" select="''"/>        
                </xsl:element> 
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="img">
                    <!--Added for image size in wycywyg on 4-11-2020-->
                    <xsl:if test="ancestor::p[@w:rsidR] | ancestor::w:p[@w:rsidR]">
                        
                        <xsl:attribute name="style">
                            <xsl:text disable-output-escaping="yes">width: </xsl:text>
                            <xsl:choose>
                                <xsl:when test="ancestor::p[@w:rsidR]">
                                    <xsl:value-of select="substring-before(substring-after(ancestor::p[@w:rsidR]/@w:rsidR,'W_'),'_H')"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="substring-before(substring-after(ancestor::w:p[@w:rsidR]/@w:rsidR,'W_'),'_H')"/>
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:text disable-output-escaping="yes">px;</xsl:text>
                            <xsl:text disable-output-escaping="yes">height: </xsl:text>
                                <xsl:choose>
                                    <xsl:when test="ancestor::p[@w:rsidR]">
                                        <xsl:value-of select="substring-before(substring-after(ancestor::p[@w:rsidR]/@w:rsidR,'H_'),'_C')"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="substring-before(substring-after(ancestor::w:p[@w:rsidR]/@w:rsidR,'H_'),'_C')"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            
                            <xsl:text disable-output-escaping="yes">px;</xsl:text>
                        </xsl:attribute>
                        
                        
                        
                        
                    </xsl:if>
                    <xsl:attribute name="data-src">
                        <!--13-11-15: commented below to take the actual image name. I'm merging document.xml.rels "Relationships" to document.xml-->
                        <!--13-11-15: refer unzip.xml "\\10.1.1.1\Automation\WORD2XML\Word2HTML5\unzip.pl"-->            
                        <!--<xsl:value-of
                            select="concat('../images/', replace(replace(replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name, '.eps', '.jpg'), '.tif', '.jpg'), '%20', '_'))"
                        />-->
                        <!--Added for wyciwyg on 2-11-2020-->
                        <xsl:variable name="artmatch"
                            select="wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name"/>
                        
                        <xsl:variable name="artmatch2">
                            <!--<xsl:value-of
                                select="replace(replace(replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name, '.eps', '.jpg'), '.tif', '.jpg'), '%20', '_')"/>-->
                            <xsl:value-of
                                select="replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name, '%20', '_')"/>
                        </xsl:variable>
                        
                        <xsl:choose>
                            <xsl:when test="$PassArtPath = ''">
                                <!--<xsl:value-of
                                    select="concat('../images/', replace(replace(replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name, '.eps', '.jpg'), '.tif', '.jpg'), '%20', '_'))"
                                />-->
                                <!--<xsl:value-of
                                    select="replace(replace(replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name, '.eps', '.jpg'), '.tif', '.jpg'), '%20', '_')"
                                />-->
                                <xsl:value-of
                                    select="replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name, '%20', '_')"
                                />
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:choose>
                                    <xsl:when test="contains(lower-case($artmatch),'.tiff') or contains(lower-case($artmatch),'.tif') or contains(lower-case($artmatch),'.psd') or contains(lower-case($artmatch),'.eps') or contains(lower-case($artmatch),'.ai') or contains(lower-case($artmatch),'.pdf') or contains(lower-case($artmatch),'.pptx')">
                                        <xsl:variable name="art-name">
                                            <!--<xsl:value-of select="replace(replace(replace(replace(replace(replace(replace(replace($artmatch,'.tiff','.jpg'),'.tif','.jpg'),'.psd','.jpg'),'.eps','.jpg'),'.ai','.jpg'),'.pdf','.jpg'),'.pptx','.jpg'),'%20','_')"/>-->
                                            <xsl:value-of select="replace($artmatch,'%20','_')"/>
                                        </xsl:variable>
                                        <!--<xsl:value-of select="concat($PassArtPath, '/Convert%20TO%20JPG/', $art-name)"/>-->
                                        <xsl:value-of select="$art-name"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:variable name="artmatch1">
                                            <xsl:value-of
                                                select="replace($artmatch,'%20', '_')"/>
                                        </xsl:variable>
                                        
                                        <!--<xsl:value-of select="concat($PassArtPath, '/', $artmatch1)"/>-->
                                        <xsl:value-of select="$artmatch1"/>
                                        
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:otherwise>
                        </xsl:choose>
                 
                    </xsl:attribute>  
                    <!-- src -->
                    <xsl:attribute name="src">
                        <!--13-11-15: commented below to take the actual image name. I'm merging document.xml.rels "Relationships" to document.xml-->
                        <!--13-11-15: refer unzip.xml "\\10.1.1.1\Automation\WORD2XML\Word2HTML5\unzip.pl"-->            
                        <!--<xsl:value-of
                            select="concat('../images/', replace(replace(replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name, '.eps', '.jpg'), '.tif', '.jpg'), '%20', '_'))"
                        />-->
                        <!--Added for wyciwyg on 2-11-2020-->
                        <xsl:variable name="artmatch"
                            select="wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name"/>
                        
                        <xsl:variable name="artmatch2">
                            <xsl:value-of
                                select="replace(replace(replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name, '.eps', '.jpg'), '.tif', '.jpg'), '%20', '_')"/>
                            <!--<xsl:value-of
                                select="replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name, '%20', '_')"/>-->
                        </xsl:variable>
                        
                        <xsl:choose>
                            <xsl:when test="$PassArtPath = ''">
                                <!--<xsl:value-of
                                    select="concat('../images/', replace(replace(replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name, '.eps', '.jpg'), '.tif', '.jpg'), '%20', '_'))"
                                />-->
                                <xsl:value-of
                                    select="concat('Images/',replace(replace(replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name, '.eps', '.jpg'), '.tif', '.jpg'), '%20', '_'))"
                                />
                                <!--<xsl:value-of
                                    select="concat('Images/',replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name, '%20', '_'))"
                                />-->
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:choose>
                                    <xsl:when test="contains(lower-case($artmatch),'.tiff') or contains(lower-case($artmatch),'.tif') or contains(lower-case($artmatch),'.psd') or contains(lower-case($artmatch),'.eps') or contains(lower-case($artmatch),'.ai') or contains(lower-case($artmatch),'.pdf') or contains(lower-case($artmatch),'.pptx')">
                                        <xsl:variable name="art-name">
                                            <xsl:value-of select="replace(replace(replace(replace(replace(replace(replace(replace($artmatch,'.tiff','.jpg'),'.tif','.jpg'),'.psd','.jpg'),'.eps','.jpg'),'.ai','.jpg'),'.pdf','.jpg'),'.pptx','.jpg'),'%20','_')"/>
                                            <!--<xsl:value-of select="replace($artmatch,'%20','_')"/>-->
                                        </xsl:variable>
                                        <!--<xsl:value-of select="concat($PassArtPath, '/Convert%20TO%20JPG/', $art-name)"/>-->
                                        <xsl:value-of select="concat('Images/',$art-name)"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:variable name="artmatch1">
                                            <xsl:value-of
                                                select="replace($artmatch,'%20', '_')"/>
                                        </xsl:variable>
                                        
                                        <!--<xsl:value-of select="concat($PassArtPath, '/', $artmatch1)"/>-->
                                        <xsl:value-of select="concat('Images/',$artmatch1)"/>
                                        
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:otherwise>
                        </xsl:choose>
                        
                    </xsl:attribute>  
                    <!-- end -->
                    <xsl:attribute name="class" select="'_idGenObjectAttribute-1'"/>
                    <xsl:attribute name="alt" select="''"/> 
                </xsl:element> 
            </xsl:otherwise>
        </xsl:choose>
        <!--</xsl:element>-->
    </xsl:template>
    <!-- To Remove emptypara inside the textbox on 24-4-2023 Azure 7002 -->
    <xsl:template match="//span[@data-alias='MarginalNote']">
        <xsl:apply-templates/>
    </xsl:template>
    <!-- Textboxes  -->
    <xsl:template match="w:pict">
        <xsl:text>&#x000A;</xsl:text>
        <xsl:element name="div">      
            <xsl:attribute name="data-type" select="'textbox'"/>
            <xsl:attribute name="data-id" select="descendant-or-self::v:shape[1]/@id"/>
            <xsl:attribute name="data-style" select="descendant::v:textbox[1]/@style"/>
            <xsl:attribute name="style" select="'border:1px solid black;outline: 2px solid #CCC;'"/>
            <xsl:text>&#x000A;</xsl:text>
            <!--<xsl:apply-templates select="descendant::v:shape/v:textbox/w:txbxContent/w:p | descendant::w:tbl"/>-->
            <xsl:apply-templates></xsl:apply-templates>
            <xsl:text>&#x000A;</xsl:text>
        </xsl:element>
    </xsl:template>
    <xsl:template match="v:shapetype|v:shape|v:path|v:textbox|w:txbxContent">
        <xsl:apply-templates></xsl:apply-templates>
    </xsl:template>
    
    <xsl:template match="w:r/w:tab | //w:tabs/w:tab">
        <xsl:text disable-output-escaping="yes">&lt;span style="padding-left:68px;"&gt;&lt;/span&gt;</xsl:text>
    </xsl:template>
    <xsl:template match="//w:tabs|v:stroke"/>    
    
    
    <xsl:template match="w:r/w:br">
        <xsl:element name="br"/>
    </xsl:template>
    <xsl:template match="w:noBreakHyphen">
        <xsl:text disable-output-escaping="yes">&amp;#x2011;</xsl:text>
    </xsl:template>
    <xsl:template match="w:softHyphen">    
        <xsl:text disable-output-escaping="yes">&amp;#xAD;</xsl:text>    
    </xsl:template>
    
    <!-- Removing unwanted IDML tags -->
    
    <xsl:template match="TextWrapPreference|ObjectExportOption|Polygon|StoryPreference|w:rPr"/> 
    
    <xsl:template match="w:pPr|XMLComment"/> 
    
    <!-- Removing unwanted IDML tags END -->
    
    <xsl:template match="@typeX">
        <xsl:attribute name="type">
            <xsl:value-of select="."></xsl:value-of>
        </xsl:attribute>
    </xsl:template>
    <!-- <span class="Nocharacterstyle" data-name="[Nocharacterstyle]" style="font-weight:bold;">CLASSROOM</span> -->
    <!--<xsl:template match="span[@class = 'Nocharacterstyle' and not(@style)]">
        <xsl:apply-templates/>
    </xsl:template>-->
    <!-- 09-Apr-18: change the fore-color to black, if no bg-color on that -->
    <xsl:template match="span[(@style) and not(@data-bkmark|@data-comment|@class)]">
        <xsl:choose>
            <xsl:when test="contains(@style, 'color: #FFFFFF') and not(contains(@style, 'background-color'))">
                        <xsl:element name="span">
                            <xsl:copy-of select="@*"/>
                            <xsl:attribute name="style">
                                <xsl:value-of select="replace(@style,'color: #FFFFFF','color: #000000')"/>
                                <!--<xsl:value-of select="substring-before(@style, 'color: #FFFFFF')"/>
                                <xsl:value-of select="'color: #000000'"/>
                                <xsl:value-of select="substring-after(@style, 'color: #FFFFFF')"/>-->
                            </xsl:attribute>
                            <xsl:apply-templates/>                    
                        </xsl:element>
            </xsl:when>
            <xsl:otherwise> 
                <xsl:element name="span">
                    <xsl:copy-of select="@*"/>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>        
    </xsl:template>
    <!-- 09-Apr-18: change the fore-color to black, if no bg-color on that END -->
    <xsl:template match="@w:vMerge"/>
    <xsl:template match="tr">
        <xsl:text>&#x000A;</xsl:text>
        <xsl:element name="tr">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="td">
        <xsl:text>&#x000A;</xsl:text>
        <xsl:element name="td">
            <xsl:copy-of select="@* except @w:vMerge"/>
            <xsl:attribute name="valign" select="'top'"/>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="w:p">
        <xsl:choose>
            <xsl:when test="not(ancestor::w:footnote)">
                <xsl:element name="p">
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>                
                    <xsl:apply-templates/>                
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="document">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="@type">
        <xsl:variable name="s" select="."/>
        <xsl:attribute name="type">
            <xsl:choose>
                <xsl:when test="contains($s, '■')">
                    <xsl:value-of select="'square'"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$s"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:template>
    <xsl:template match="@start">
        <xsl:variable name="s" select="."/>
        <xsl:variable name="current-type" select="parent::*/@type"/>
        
        <xsl:attribute name="start">
            
        <xsl:choose>
            <xsl:when test="$s = 'I' or $s = 'i' or $s = 'a' or $s = 'A'">   
                <xsl:choose>
                    <xsl:when test="($s = 'I' or $s = 'i') and ($current-type = 'A' or $current-type = 'a')">
                        <xsl:value-of select="'9'"/>
                    </xsl:when>
                    <xsl:when test="($s = 'I' or $s = 'i') and ($current-type = 'I' or $current-type = 'i')">
                        <xsl:value-of select="'1'"/>
                    </xsl:when>                    
                    <xsl:otherwise>
                        <xsl:value-of select="'1'"/>
                    </xsl:otherwise>
                </xsl:choose>                
                <!--<xsl:value-of select="'1'"/>-->                
            </xsl:when>
            <xsl:when test="$s = 'II' or $s = 'ii' or $s = 'b' or $s = 'B'">
                
                <xsl:value-of select="'2'"/>
            </xsl:when>
            <xsl:when test="$s = 'III' or $s = 'iii' or $s = 'c' or $s = 'C'">
                <xsl:value-of select="'3'"/>
            </xsl:when>
            <xsl:when test="$s = 'IV' or $s = 'iv' or $s = 'd' or $s = 'D'">
                <xsl:value-of select="'4'"/>
            </xsl:when>
            <xsl:when test="$s = 'V' or $s = 'v' or $s = 'e' or $s = 'E'">
                <xsl:choose>
                    <xsl:when test="($s = 'V' or $s = 'v') and ($current-type = 'A' or $current-type = 'a')">
                        <xsl:value-of select="'22'"/>
                    </xsl:when>
                    <xsl:when test="($s = 'V' or $s = 'v') and ($current-type = 'I' or $current-type = 'i')">
                        <xsl:value-of select="'5'"/>
                    </xsl:when>                    
                    <xsl:otherwise>
                        <xsl:value-of select="'5'"/>
                    </xsl:otherwise>
                </xsl:choose>                
                <!--<xsl:value-of select="'5'"/>-->  
            </xsl:when>
            <xsl:when test="$s = 'VI' or $s = 'vi' or $s = 'f' or $s = 'F'">
                <xsl:value-of select="'6'"/>
            </xsl:when>
            <xsl:when test="$s = 'VII' or $s = 'vii' or $s = 'g' or $s = 'G'">
                <xsl:value-of select="'7'"/>
            </xsl:when>
            <xsl:when test="$s = 'VIII' or $s = 'viii' or $s = 'h' or $s = 'H'">
                <xsl:value-of select="'8'"/>
            </xsl:when>
            <xsl:when test="$s = 'IX' or $s = 'ix' or $s = 'i' or $s = 'I'">                
                <xsl:value-of select="'9'"/>                
            </xsl:when>
            <xsl:when test="$s = 'X' or $s = 'x' or $s = 'j' or $s = 'J'">
                <xsl:choose>
                    <xsl:when test="($s = 'X' or $s = 'x') and ($current-type = 'A' or $current-type = 'a')">
                        <xsl:value-of select="'24'"/>
                    </xsl:when>
                    <xsl:when test="($s = 'X' or $s = 'x') and ($current-type = 'I' or $current-type = 'i')">
                        <xsl:value-of select="'10'"/>
                    </xsl:when>                    
                    <xsl:otherwise>
                        <xsl:value-of select="'10'"/>
                    </xsl:otherwise>
                </xsl:choose>
                <!--<xsl:value-of select="'10'"/>-->
            </xsl:when>
            <xsl:when test="$s = 'XI' or $s = 'xi' or $s = 'k' or $s = 'K'">
                <xsl:value-of select="'11'"/>
            </xsl:when>
            <xsl:when test="$s = 'XII' or $s = 'xii' or $s = 'L' or $s = 'l'">
                <xsl:value-of select="'12'"/>
            </xsl:when>
            <xsl:when test="$s = 'XIII' or $s = 'xiii' or $s = 'M' or $s = 'm'">
                <xsl:value-of select="'13'"/>
            </xsl:when>
            <xsl:when test="$s = 'XIV' or $s = 'xiv' or $s = 'N' or $s = 'n'">
                <xsl:value-of select="'14'"/>
            </xsl:when>
            <xsl:when test="$s = 'XV' or $s = 'xv' or $s = 'O' or $s = 'o'">
                <xsl:value-of select="'15'"/>
            </xsl:when>
            <xsl:when test="$s = 'XVI' or $s = 'xvi' or $s = 'P' or $s = 'p'">
                <xsl:value-of select="'16'"/>
            </xsl:when>
            <xsl:when test="$s = 'XVII' or $s = 'xvii' or $s = 'Q' or $s = 'q'">
                <xsl:value-of select="'17'"/>
            </xsl:when>
            <xsl:when test="$s = 'XVIII' or $s = 'xviii' or $s = 'R' or $s = 'r'">
                <xsl:value-of select="'18'"/>
            </xsl:when>
            <xsl:when test="$s = 'XIX' or $s = 'xix' or $s = 'S' or $s = 's'">
                <xsl:value-of select="'19'"/>
            </xsl:when>
            <xsl:when test="$s = 'XX' or $s = 'xx' or $s = 'T' or $s = 't'">
                <xsl:value-of select="'20'"/>
            </xsl:when>
            <xsl:when test="$s = 'XXI' or $s = 'xxi' or $s = 'U' or $s = 'u'">
                <xsl:value-of select="'21'"/>
            </xsl:when>
            <xsl:when test="$s = 'XXII' or $s = 'xxii' or $s = 'V' or $s = 'v'">
                <xsl:value-of select="'22'"/>
            </xsl:when>
            <xsl:when test="$s = 'XXIII' or $s = 'xxiii' or $s = 'W' or $s = 'w'">
                <xsl:value-of select="'23'"/>
            </xsl:when>
            <xsl:when test="$s = 'XXIV' or $s = 'xxiv' or $s = 'X' or $s = 'x'">
                <xsl:value-of select="'24'"/>
            </xsl:when>
            <xsl:when test="$s = 'XXV' or $s = 'xxv' or $s = 'Y' or $s = 'y'">
                <xsl:value-of select="'25'"/>
            </xsl:when>
            <xsl:when test="$s = 'XXVI' or $s = 'xxvi' or $s = 'Z' or $s = 'z'">
                <xsl:value-of select="'26'"/>
            </xsl:when>
            <xsl:when test="$s = 'XXVII' or $s = 'xxvii' or $s = 'AA' or $s = 'aa'">
                <xsl:value-of select="'27'"/>
            </xsl:when>
            <xsl:when test="$s = 'XXVIII' or $s = 'xxviii' or $s = 'AB' or $s = 'ab'">
                <xsl:value-of select="'28'"/>
            </xsl:when>
            <xsl:when test="$s = 'XXIX' or $s = 'xxix' or $s = 'AC' or $s = 'ac'">
                <xsl:value-of select="'29'"/>
            </xsl:when>
            <xsl:when test="$s = 'XXX' or $s = 'xxx' or $s = 'AD' or $s = 'ad'">
                <xsl:value-of select="'30'"/>
            </xsl:when>
            <xsl:when test="$s = 'XXXI' or $s = 'xxxi' or $s = 'AE' or $s = 'ae'">
                <xsl:value-of select="'31'"/>
            </xsl:when>
            <xsl:when test="$s = 'XXXII' or $s = 'xxxii' or $s = 'AF' or $s = 'af'">
                <xsl:value-of select="'32'"/>
            </xsl:when>
            <xsl:when test="$s = 'XXXIII' or $s = 'xxxiii' or $s = 'AG' or $s = 'ag'">
                <xsl:value-of select="'33'"/>
            </xsl:when>
            <xsl:when test="$s = 'XXXIV' or $s = 'xxxiv' or $s = 'AH' or $s = 'ah'">
                <xsl:value-of select="'34'"/>
            </xsl:when>
            <xsl:when test="$s = 'XXXV' or $s = 'xxxv' or $s = 'AI' or $s = 'ai'">
                <xsl:value-of select="'35'"/>
            </xsl:when>
            <xsl:when test="$s = 'XXXVI' or $s = 'xxxvi' or $s = 'AJ' or $s = 'aj'">
                <xsl:value-of select="'36'"/>
            </xsl:when>
            <xsl:when test="$s = 'XXXVII' or $s = 'xxxvii' or $s = 'AK' or $s = 'ak'">
                <xsl:value-of select="'37'"/>
            </xsl:when>
            <xsl:when test="$s = 'XXXVIII' or $s = 'xxxviii' or $s = 'AL' or $s = 'al'">
                <xsl:value-of select="'38'"/>
            </xsl:when>
            <xsl:when test="$s = 'XXXIX' or $s = 'xxxix' or $s = 'AM' or $s = 'am'">
                <xsl:value-of select="'39'"/>
            </xsl:when>
            <xsl:when test="$s = 'XL' or $s = 'xl' or $s = 'AN' or $s = 'an'">
                <xsl:value-of select="'40'"/>
            </xsl:when>
            <xsl:when test="$s = 'XLI' or $s = 'xli' or $s = 'AO' or $s = 'ao'">
                <xsl:value-of select="'41'"/>
            </xsl:when>
            <xsl:when test="$s = 'XLII' or $s = 'xlii' or $s = 'AP' or $s = 'ap'">
                <xsl:value-of select="'42'"/>
            </xsl:when>
            <xsl:when test="$s = 'XLIII' or $s = 'xliii' or $s = 'AQ' or $s = 'aq'">
                <xsl:value-of select="'43'"/>
            </xsl:when>
            <xsl:when test="$s = 'XLIV' or $s = 'xliv' or $s = 'AR' or $s = 'ar'">
                <xsl:value-of select="'44'"/>
            </xsl:when>
            <xsl:when test="$s = 'XLV' or $s = 'xlv' or $s = 'AS' or $s = 'as'">
                <xsl:value-of select="'45'"/>
            </xsl:when>
            <xsl:when test="$s = 'XLVI' or $s = 'xlvi' or $s = 'AT' or $s = 'at'">
                <xsl:value-of select="'46'"/>
            </xsl:when>
            <xsl:when test="$s = 'XLVII' or $s = 'xlvii' or $s = 'AU' or $s = 'au'">
                <xsl:value-of select="'47'"/>
            </xsl:when>
            <xsl:when test="$s = 'XLVIII' or $s = 'xlviii' or $s = 'AV' or $s = 'av'">
                <xsl:value-of select="'48'"/>
            </xsl:when>
            <xsl:when test="$s = 'XLIX' or $s = 'xlix' or $s = 'AW' or $s = 'aw'">
                <xsl:value-of select="'49'"/>
            </xsl:when>
            <xsl:when test="$s = 'L' or $s = 'l' or $s = 'AX' or $s = 'ax'">
                <xsl:choose>
                    <xsl:when test="($s = 'L' or $s = 'l') and ($current-type = 'A' or $current-type = 'a')">
                        <xsl:value-of select="'12'"/>
                    </xsl:when>
                    <xsl:when test="($s = 'L' or $s = 'l') and ($current-type = 'I' or $current-type = 'i')">
                        <xsl:value-of select="'50'"/>
                    </xsl:when>                    
                    <xsl:otherwise>
                        <xsl:value-of select="'50'"/>
                    </xsl:otherwise>
                </xsl:choose>
                <!--<xsl:value-of select="'50'"/>-->
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
        </xsl:attribute>
    </xsl:template>
    
    
    <xsl:template match="//span[child::p|child::table]">
        <xsl:apply-templates/>
    </xsl:template>
    
    <!--<xsl:template match="//div[not(*)]"/>-->
    <!-- I dont know why i used the above rule, this caused a test missing in Brody ch 6, so i commented on 19-oct-17 -->
    <xsl:template match="AnchoredObjectSetting"/>
    
    <xsl:character-map name="Ascii2Unicode">
        <xsl:output-character character=">" string=">"/>
        
    </xsl:character-map>
    
    
    <!--<xsl:template match="@class">
        <xsl:variable name="class" select="."/>
        <xsl:choose>
            <xsl:when test="$class = 'Nocharacterstyle'"></xsl:when>
            <xsl:otherwise>
                <xsl:attribute name="class" select="$class"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>-->
    <!--<xsl:template match="@data-name">
        <xsl:variable name="data" select="."/>
        <xsl:choose>
            <xsl:when test="$data = '[Nocharacterstyle]'"></xsl:when>
            <xsl:otherwise>
                <xsl:attribute name="data-name" select="$data"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>-->
    
    <!-- 15-June-17: added attribute "data-split" for the elements asked by Mariappan-->
    <xsl:template match="p|img|li|div|ol|ul">
        <xsl:element name="{local-name()}">
            <xsl:attribute name="data-split">
                <xsl:value-of select="generate-id()"/>
            </xsl:attribute>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    <!-- 15-June-17: added attribute "data-split" for the elements asked by Mariappan-->
    <!--<xsl:template match="ol">
        <xsl:choose>
            <xsl:when test="not(preceding-sibling::*[1][self::ol])">
                <xsl:text>&#x000A;</xsl:text>
                <xsl:element name="ol">
                    <xsl:copy-of select="@*"/>
                    <xsl:for-each select="li">
                        <xsl:element name="li">
                            <xsl:attribute name="style" select="'margin-left:0pt;text-indent:0pt'"/>
                            <xsl:attribute name="data-split">
                                <xsl:value-of select="generate-id()"/>
                            </xsl:attribute>
                            <xsl:copy-of select="@*"/>
                            <xsl:apply-templates select="@*|node()"/>
                        </xsl:element>
                    </xsl:for-each>
                </xsl:element>  
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>&#x000A;</xsl:text>
                <xsl:element name="ol">
                    <xsl:copy-of select="@*"/>
                    <xsl:for-each select="li">
                        <xsl:element name="li">
                            <xsl:attribute name="style" select="'text-indent:0pt'"/>
                            <xsl:attribute name="data-split">
                                <xsl:value-of select="generate-id()"/>
                            </xsl:attribute>
                            <xsl:copy-of select="@*"/>
                            <xsl:apply-templates select="@*|node()"/>
                        </xsl:element>
                    </xsl:for-each>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>-->
    <!-- xsl:template match="li[parent::ol[not(contains(@start,'.'))]] -->
    <xsl:template match="li[parent::ol]">
        <xsl:element name="li">
            <xsl:copy-of select="@*"/>
            <xsl:choose>
                <xsl:when test="@style">
                    <xsl:attribute name="style">
                        <xsl:value-of select="concat(@style,';margin-left:0pt;text-indent:0pt')"/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="style" select="'margin-left:0pt;text-indent:0pt'"/>
                </xsl:otherwise>
            </xsl:choose>
            <!--<xsl:attribute name="style" select="'margin-left:0pt;text-indent:0pt'"/>-->
            <xsl:attribute name="data-split">
                <xsl:value-of select="generate-id()"/>
            </xsl:attribute>
            
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <!--<xsl:template match="li[parent::ol[contains(@start,'.')]]">
        <xsl:element name="li">
            <xsl:copy-of select="@*"/>
            <xsl:choose>
                <xsl:when test="@style">
                    <xsl:attribute name="style">
                        <xsl:value-of select="concat(@style,';margin-left:0pt;text-indent:0pt')"/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="style" select="'margin-left:0pt;text-indent:0pt'"/>
                </xsl:otherwise>
            </xsl:choose>
            <!-\-<xsl:attribute name="style" select="'margin-left:0pt;text-indent:0pt'"/>-\->
            <xsl:attribute name="data-split">
                <xsl:value-of select="generate-id()"/>
            </xsl:attribute>
            
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>-->
    <xsl:template match="li[parent::ul]">
        <xsl:element name="li">
            <xsl:copy-of select="@*"/>
            <xsl:choose>
                <xsl:when test="@style">
                    <xsl:attribute name="style">
                        <!--<xsl:value-of select="@style"/>-->
                        <xsl:value-of select="concat(@style,';text-indent:0pt')"/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="style" select="'text-indent:0pt'"/>
                </xsl:otherwise>
            </xsl:choose>
            <!--<xsl:attribute name="style" select="'text-indent:0pt'"/>-->
            <xsl:attribute name="data-split">
                <xsl:value-of select="generate-id()"/>
            </xsl:attribute>            
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    
    
    <xsl:template match="HyperlinkTextSource | HyperlinkTextDestination">
        <xsl:apply-templates/>
    </xsl:template>
    
   <!-- <xsl:template match="span[@class]">
        <xsl:choose>
            <xsl:when test="child::span[@style]">
                
            </xsl:when>
        </xsl:choose>
    </xsl:template>-->
    
    
    
    <xsl:template match="p[child::p] | p[child::span/span/p]">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="w:body">
        <xsl:apply-templates/>
    </xsl:template>
    
    <!-- Moving DIV inside P, to outside P -->
    <xsl:template match="p">
        
        <xsl:element name="{name()}">
             <xsl:if test="descendant::xmlid[not(parent::div[string-length(.) = 0])][1]">
                 <xsl:attribute name="id">
                     <xsl:value-of select="descendant::xmlid[not(parent::div[string-length(.) = 0])][1]/@val"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="following-sibling::*[1][self::xmlid][not(parent::div[string-length(.) = 0])][1]">
                <xsl:attribute name="id">
                    <xsl:value-of select="following-sibling::*[1][self::xmlid][not(parent::div[string-length(.) = 0])][1]/@val"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:attribute name="data-split">
                <xsl:value-of select="generate-id()"/>
            </xsl:attribute>    
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates/>
        </xsl:element>
        
            <!--<xsl:variable name="divContent" select="descendant-or-self::div//p"/>-->
            
            <!--<xsl:if test="string-length($divContent) &gt; 1">--><!-- This is for OECD -->
            <xsl:for-each select="descendant::div[not(ancestor::v:shape)]">
                
                <xsl:text>&#x000A;</xsl:text>                
                <xsl:element name="div">
                    <xsl:copy-of select="@*"/>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:element>
                
            </xsl:for-each>
            <!--</xsl:if>-->
            
        
        <!--<xsl:for-each select="child::div">
            <xsl:text>&#x000A;</xsl:text>
            <xsl:element name="divX">
                <xsl:copy-of select="@*"/>
                <xsl:apply-templates select="@*|node()"/>
            </xsl:element>
        </xsl:for-each>-->
    </xsl:template>    
    <xsl:template match="p//div[not(ancestor::v:shape)]"/>
    <!--<xsl:template match="p//div">
        <xsl:variable name="divContent" select="descendant-or-self::div//p[1]"/><!-\- This is for OECD -\->
        <xsl:choose>
            <xsl:when test="string-length($divContent) &gt; 1"></xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>-->
    <!-- Moving DIV inside P, to outside P ENDS here-->
    
    <xsl:template match="//w:drawing"><!-- For Hari IDML2Word -->
         <xsl:variable name="imgnameid" select="wp:inline/a:graphic/a:graphicData/pic:pic/pic:blipFill/a:blip/@r:embed"/>
        <xsl:variable name="imgnameid2" select="wp:anchor/a:graphic/a:graphicData/pic:pic/pic:blipFill/a:blip/@r:embed"/>
        <xsl:choose>
            <xsl:when test="wp:inline/a:graphic/a:graphicData/pic:pic/pic:blipFill/a:blip/@r:embed or wp:anchor/a:graphic/a:graphicData/pic:pic/pic:blipFill/a:blip[@r:embed]">
                
                <xsl:element name="img">
                    <!--Added for image size in wycywyg on 4-11-2020-->
                    <!--<xsl:if test="ancestor::p[@w:rsidR] | ancestor::w:p[@w:rsidR]">
                        
                        <xsl:attribute name="max-width">
                            <xsl:choose>
                                <xsl:when test="ancestor::p[@w:rsidR]">
                                    <xsl:value-of select="substring-before(substring-after(ancestor::p[@w:rsidR]/@w:rsidR,'W_'),'_H')"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="substring-before(substring-after(ancestor::w:p[@w:rsidR]/@w:rsidR,'W_'),'_H')"/>
                                </xsl:otherwise>
                            </xsl:choose>
                            
                        </xsl:attribute>
                        <xsl:attribute name="max-height">
                            <xsl:choose>
                                <xsl:when test="ancestor::p[@w:rsidR]">
                                    <xsl:value-of select="substring-before(substring-after(ancestor::p[@w:rsidR]/@w:rsidR,'H_'),'_C')"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="substring-before(substring-after(ancestor::w:p[@w:rsidR]/@w:rsidR,'H_'),'_C')"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                        <xsl:attribute name="width">
                            <xsl:value-of select="'auto'"/>
                        </xsl:attribute>
                        <xsl:attribute name="height">
                            <xsl:value-of select="'auto'"/>
                        </xsl:attribute>
                    </xsl:if>-->
                    
                    <xsl:attribute name="data-src">
                        <!--13-11-15: commented below to take the actual image name. I'm merging document.xml.rels "Relationships" to document.xml-->
                        <!--13-11-15: refer unzip.xml "\\10.1.1.1\Automation\WORD2XML\Word2HTML5\unzip.pl"-->
                        <xsl:for-each select="//Relationships/Relationship[@Id = $imgnameid]">
                            <xsl:variable name="imageName" select="//Relationships/Relationship[@Id = $imgnameid]/@Target"/>
                            <!--<xsl:value-of select="concat('../images/',substring-after(//Relationships/Relationship[@Id = $imgnameid]/@Target,'/'))"/>-->
                            <xsl:variable name="artmatch"
                                select="substring-after(//Relationships/Relationship[@Id = $imgnameid]/@Target, '/')"/>
                            <!--<xsl:value-of select="concat('../images/',substring-after(//Relationships/Relationship[@Id = $imgnameid]/@Target,'/'))"/>-->
                            <xsl:choose>
                                <xsl:when test="$PassArtPath = ''">
                                    <!--<xsl:value-of select="concat('../images/',substring-after(//Relationships/Relationship[@Id = $imgnameid]/@Target,'/'))"/>-->
                                    <xsl:value-of select="substring-after(//Relationships/Relationship[@Id = $imgnameid]/@Target,'/')"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <!--<xsl:value-of select="concat($PassArtPath, '/', $artmatch)"/>-->
                                    <xsl:choose>
                                        <xsl:when test="contains(lower-case($artmatch),'.tiff') or contains(lower-case($artmatch),'.tif') or contains(lower-case($artmatch),'.psd') or contains(lower-case($artmatch),'.eps') or contains(lower-case($artmatch),'.ai') or contains(lower-case($artmatch),'.pdf') or contains(lower-case($artmatch),'.pptx')">
                                            <xsl:variable name="art-name">
                                                <!--<xsl:value-of select="replace(replace(replace(replace(replace(replace(replace(replace($artmatch,'.tiff','.jpg'),'.tif','.jpg'),'.psd','.jpg'),'.eps','.jpg'),'.ai','.jpg'),'.pdf','.jpg'),'.pptx','.jpg'),'%20','_')"/>-->
                                                <xsl:value-of select="replace($artmatch,'%20','_')"/>
                                            </xsl:variable>
                                            <!--<xsl:value-of select="concat($PassArtPath, '/Convert%20TO%20JPG/', $art-name)"/>-->
                                            <xsl:value-of select="$art-name"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:variable name="artmatch1">
                                                <xsl:value-of
                                                    select="replace($artmatch,'%20', '_')"/>
                                            </xsl:variable>
                                            
                                            <!--<xsl:value-of select="concat($PassArtPath, '/', $artmatch1)"/>-->
                                            <xsl:value-of select="$artmatch1"/>
                                            
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                        <xsl:for-each select="//Relationships/Relationship[@Id = $imgnameid2]">
                            <!--<xsl:value-of select="concat('../images/',substring-after(@Target,'/'))"/>-->
                            <xsl:value-of select="substring-after(@Target,'/')"/>
                        </xsl:for-each>
                        <!--<xsl:value-of
            select="concat('../images/', replace(replace(replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name, '.eps', '.jpg'), '.tif', '.jpg'), '%20', '_'))"
          />-->
                    </xsl:attribute>
                    <!-- src -->
                    <xsl:attribute name="src">
                        <!--13-11-15: commented below to take the actual image name. I'm merging document.xml.rels "Relationships" to document.xml-->
                        <!--13-11-15: refer unzip.xml "\\10.1.1.1\Automation\WORD2XML\Word2HTML5\unzip.pl"-->
                        <xsl:for-each select="//Relationships/Relationship[@Id = $imgnameid]">
                            <xsl:variable name="imageName" select="//Relationships/Relationship[@Id = $imgnameid]/@Target"/>
                            <!--<xsl:value-of select="concat('../images/',substring-after(//Relationships/Relationship[@Id = $imgnameid]/@Target,'/'))"/>-->
                            <xsl:variable name="artmatch"
                                select="substring-after(//Relationships/Relationship[@Id = $imgnameid]/@Target, '/')"/>
                            <!--<xsl:value-of select="concat('../images/',substring-after(//Relationships/Relationship[@Id = $imgnameid]/@Target,'/'))"/>-->
                            <xsl:choose>
                                <xsl:when test="$PassArtPath = ''">
                                    <!--<xsl:value-of select="concat('../images/',substring-after(//Relationships/Relationship[@Id = $imgnameid]/@Target,'/'))"/>-->
                                    <xsl:value-of select="concat('Images/',substring-after(//Relationships/Relationship[@Id = $imgnameid]/@Target,'/'))"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <!--<xsl:value-of select="concat($PassArtPath, '/', $artmatch)"/>-->
                                    <xsl:choose>
                                        <xsl:when test="contains(lower-case($artmatch),'.tiff') or contains(lower-case($artmatch),'.tif') or contains(lower-case($artmatch),'.psd') or contains(lower-case($artmatch),'.eps') or contains(lower-case($artmatch),'.ai') or contains(lower-case($artmatch),'.pdf') or contains(lower-case($artmatch),'.pptx')">
                                            <xsl:variable name="art-name">
                                                <xsl:value-of select="replace(replace(replace(replace(replace(replace(replace(replace($artmatch,'.tiff','.jpg'),'.tif','.jpg'),'.psd','.jpg'),'.eps','.jpg'),'.ai','.jpg'),'.pdf','.jpg'),'.pptx','.jpg'),'%20','_')"/>
                                                <!--<xsl:value-of select="replace($artmatch,'%20','_')"/>-->
                                            </xsl:variable>
                                            <!--<xsl:value-of select="concat($PassArtPath, '/Convert%20TO%20JPG/', $art-name)"/>-->
                                            <xsl:value-of select="concat('Images/',$art-name)"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:variable name="artmatch1">
                                                <xsl:value-of
                                                    select="replace($artmatch,'%20', '_')"/>
                                            </xsl:variable>
                                            
                                            <!--<xsl:value-of select="concat($PassArtPath, '/', $artmatch1)"/>-->
                                            <xsl:value-of select="concat('Images/',$artmatch1)"/>
                                            
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                        <xsl:for-each select="//Relationships/Relationship[@Id = $imgnameid2]">
                            <!--<xsl:value-of select="concat('../images/',substring-after(@Target,'/'))"/>-->
                            <xsl:value-of select="concat('Images/',substring-after(@Target,'/'))"/>
                        </xsl:for-each>
                        <!--<xsl:value-of
            select="concat('../images/', replace(replace(replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name, '.eps', '.jpg'), '.tif', '.jpg'), '%20', '_'))"
          />-->
                    </xsl:attribute>
                    <!-- end -->
                    <xsl:attribute name="alt" select="''"/>     
                    <xsl:if test="child::wp:inline/@data-pageitem">
                        <xsl:attribute name="data-spreadpageitem" select="'yes'"/>
                    </xsl:if>
                </xsl:element> 
            </xsl:when>
            <xsl:otherwise>
                    <xsl:element name="img">
                        <!--Added for image size in wycywyg on 4-11-2020-->
                        <xsl:if test="ancestor::p[@w:rsidR] | ancestor::w:p[@w:rsidR]">
                            
                            <xsl:attribute name="style">
                                <xsl:text disable-output-escaping="yes">width: </xsl:text>
                                <xsl:choose>
                                    <xsl:when test="ancestor::p[@w:rsidR]">
                                        <xsl:value-of select="substring-before(substring-after(ancestor::p[@w:rsidR]/@w:rsidR,'W_'),'_H')"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="substring-before(substring-after(ancestor::w:p[@w:rsidR]/@w:rsidR,'W_'),'_H')"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:text disable-output-escaping="yes">px;</xsl:text>
                                <xsl:text disable-output-escaping="yes">height: </xsl:text>
                                <xsl:choose>
                                    <xsl:when test="ancestor::p[@w:rsidR]">
                                        <xsl:value-of select="substring-before(substring-after(ancestor::p[@w:rsidR]/@w:rsidR,'H_'),'_C')"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="substring-before(substring-after(ancestor::w:p[@w:rsidR]/@w:rsidR,'H_'),'_C')"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                                
                                <xsl:text disable-output-escaping="yes">px;</xsl:text>
                            </xsl:attribute>
                            
                            
                            
                            
                        </xsl:if>
                        
                    <xsl:attribute name="data-src">
                   <!--13-11-15: commented below to take the actual image name. I'm merging document.xml.rels "Relationships" to document.xml-->
                        <!--13-11-15: refer unzip.xml "\\10.1.1.1\Automation\WORD2XML\Word2HTML5\unzip.pl"-->            
                        <!--<xsl:value-of
                            select="concat('../images/', replace(replace(replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name, '.eps', '.jpg'), '.tif', '.jpg'), '%20', '_'))"
                        />-->
                        
                        <!--Added for wyciwyg on 2-11-2020-->
                        <xsl:variable name="artmatch"
                            select="wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name"/>
                                               
                        <xsl:variable name="artmatch2">
                            <!--<xsl:value-of
                                select="replace(replace(replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name, '.eps', '.jpg'), '.tif', '.jpg'), '%20', '_')"/>-->
                            <xsl:value-of
                                select="replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name,'%20', '_')"/>
                        </xsl:variable>
                        <xsl:choose>
                            <xsl:when test="$PassArtPath = ''">
                                <!--<xsl:value-of
                                    select="concat('../images/', replace(replace(replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name, '.eps', '.jpg'), '.tif', '.jpg'), '%20', '_'))"
                                />-->
                                <!--<xsl:value-of
                                    select="replace(replace(replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name, '.eps', '.jpg'), '.tif', '.jpg'), '%20', '_')"
                                />-->
                                <xsl:value-of
                                    select="replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name,'%20', '_')"
                                />
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:choose>
                                    <xsl:when test="contains(lower-case($artmatch),'.tiff') or contains(lower-case($artmatch),'.tif') or contains(lower-case($artmatch),'.psd') or contains(lower-case($artmatch),'.eps') or contains(lower-case($artmatch),'.ai') or contains(lower-case($artmatch),'.pdf') or contains(lower-case($artmatch),'.pptx')">
                                        <!--<xsl:variable name="art-name" select="substring-before($artmatch,'.')"/>-->
                                        <xsl:variable name="art-name">
                                            <!--<xsl:value-of select="replace(replace(replace(replace(replace(replace(replace(replace($artmatch,'.tiff','.jpg'),'.tif','.jpg'),'.psd','.jpg'),'.eps','.jpg'),'.ai','.jpg'),'.pdf','.jpg'),'.pptx','.jpg'),'%20','_')"/>-->
                                            <xsl:value-of select="replace($artmatch,'%20','_')"/>
                                        </xsl:variable>
                                        <!--<xsl:value-of select="concat($PassArtPath, '/Convert%20TO%20JPG/', $art-name)"/>-->
                                        <xsl:value-of select="$art-name"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:variable name="artmatch1">
                                            <xsl:value-of
                                                select="replace($artmatch,'%20', '_')"/>
                                        </xsl:variable>
                                        <!--<xsl:value-of select="concat($PassArtPath, '/', $artmatch1)"/>-->
                                        <xsl:value-of select="$artmatch1"/>
                                 </xsl:otherwise>
                                </xsl:choose>
                            </xsl:otherwise>
                        </xsl:choose>
                        
                        
                    </xsl:attribute> 
                        <!-- src -->
                        <xsl:attribute name="src">
                            <!--13-11-15: commented below to take the actual image name. I'm merging document.xml.rels "Relationships" to document.xml-->
                            <!--13-11-15: refer unzip.xml "\\10.1.1.1\Automation\WORD2XML\Word2HTML5\unzip.pl"-->            
                            <!--<xsl:value-of
                            select="concat('../images/', replace(replace(replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name, '.eps', '.jpg'), '.tif', '.jpg'), '%20', '_'))"
                        />-->
                            
                            <!--Added for wyciwyg on 2-11-2020-->
                            <xsl:variable name="artmatch"
                                select="wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name"/>
                            
                            <xsl:variable name="artmatch2">
                                <xsl:value-of
                                select="replace(replace(replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name, '.eps', '.jpg'), '.tif', '.jpg'), '%20', '_')"/>
                                <!--<xsl:value-of
                                    select="replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name,'%20', '_')"/>-->
                            </xsl:variable>
                            <xsl:choose>
                                <xsl:when test="$PassArtPath = ''">
                                    <!--<xsl:value-of
                                    select="concat('../images/', replace(replace(replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name, '.eps', '.jpg'), '.tif', '.jpg'), '%20', '_'))"
                                />-->
                                    <xsl:value-of
                                    select="replace(replace(replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name, '.eps', '.jpg'), '.tif', '.jpg'), '%20', '_')"
                                />
                                    <!--<xsl:value-of
                                        select="replace(wp:inline/a:graphic/a:graphicData/pic:pic/pic:nvPicPr/pic:cNvPr/@name,'%20', '_')"
                                    />-->
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:choose>
                                        <xsl:when test="contains(lower-case($artmatch),'.tiff') or contains(lower-case($artmatch),'.tif') or contains(lower-case($artmatch),'.psd') or contains(lower-case($artmatch),'.eps') or contains(lower-case($artmatch),'.ai') or contains(lower-case($artmatch),'.pdf') or contains(lower-case($artmatch),'.pptx')">
                                            <!--<xsl:variable name="art-name" select="substring-before($artmatch,'.')"/>-->
                                            <xsl:variable name="art-name">
                                                <!--<xsl:value-of select="replace(replace(replace(replace(replace(replace(replace(replace($artmatch,'.tiff','.jpg'),'.tif','.jpg'),'.psd','.jpg'),'.eps','.jpg'),'.ai','.jpg'),'.pdf','.jpg'),'.pptx','.jpg'),'%20','_')"/>-->
                                                <xsl:value-of select="replace($artmatch,'%20','_')"/>
                                            </xsl:variable>
                                            <!--<xsl:value-of select="concat($PassArtPath, '/Convert%20TO%20JPG/', $art-name)"/>-->
                                            <xsl:value-of select="concat('Images/',$art-name)"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:variable name="artmatch1">
                                                <xsl:value-of
                                                    select="replace($artmatch,'%20', '_')"/>
                                            </xsl:variable>
                                            <!--<xsl:value-of select="concat($PassArtPath, '/', $artmatch1)"/>-->
                                            <xsl:value-of select="concat('Images/',$artmatch1)"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:otherwise>
                            </xsl:choose>
                            
    
                        </xsl:attribute> 
                        <!--end-->
                    <xsl:attribute name="class" select="'_idGenObjectAttribute-1'"/>
                    <xsl:attribute name="alt" select="''"/> 
                    <xsl:if test="child::wp:inline/@data-pageitem">
                        <xsl:attribute name="data-spreadpageitem" select="'yes'"/>
                    </xsl:if>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
        <!--</xsl:element>-->
    </xsl:template>
    <!-- 15-Feb-19: Added due to remove span[@data-name = '[No character style]'] -->
    <xsl:template match="//span[@data-name = '[No character style]']">
        <xsl:choose>
            <xsl:when test="@style">
                <xsl:element name="span">
                    <xsl:attribute name="style" select="@style"/>
                    <xsl:apply-templates/>
                </xsl:element>                
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
        <!--<xsl:apply-templates/>-->
    </xsl:template>
    
    <!-- Added to change the xhtml to idml format on 04-10-2021-->
    <xsl:template match="span[@class='endnotereference' or @data-name='endnote reference'][not(descendant::a)][string-length(normalize-space(.)) &gt; 0]">
        <xsl:variable name="referenced-id" select="self::span[@class='endnotereference' or @data-name='endnote reference'][string-length(normalize-space(.)) &gt; 0]/."/>
        <xsl:variable name="id">
            <xsl:value-of select="count(preceding::span[@class='endnotereference' or @data-name='endnote reference'][string-length(normalize-space(.)) &gt; 0]) + 1"/>
        </xsl:variable>
       <xsl:variable name="ref-id">
            <xsl:analyze-string select="$referenced-id" regex="(\d+)">
                <xsl:matching-substring>
                    <xsl:value-of select="regex-group(1)"/> 
                </xsl:matching-substring>
            </xsl:analyze-string>
        </xsl:variable>
        <!-- Added to retain the endnotereference number( 1) information before on 23-5-2022-->
        <xsl:if test="string-length(substring-before(.,$ref-id)) &gt; 0">
            <xsl:value-of select="substring-before(.,$ref-id)"/>
        </xsl:if>
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:element name="a">
                <!-- Added for marriapan edior on 22-02-2022 -->
                <xsl:attribute name="class" select="'endnotecitation'"/>
                <xsl:attribute name="data-type" select="'number'"/>
                <!-- End -->
                <xsl:attribute name="id">
                    <xsl:value-of select="'eref'"/>
                    <xsl:value-of select="$id"/>
                </xsl:attribute>
                <xsl:attribute name="href" select="concat('#e',$id)"/>
                <!--<xsl:value-of select="normalize-space($referenced-id)"/>-->
                <xsl:analyze-string select="$referenced-id" regex="(\d+)">
                    <xsl:matching-substring>
                        <xsl:value-of select="regex-group(1)"/>
                    </xsl:matching-substring>
                </xsl:analyze-string>
            </xsl:element>
        </xsl:copy>
        <!-- Added to avoid the link missing issue for endnotes on 29-08-2022 -->
        <xsl:if test="child::w:commentReference">
            <xsl:apply-templates select="child::w:commentReference"/>
        </xsl:if>
        <!-- Added to retain the endnotereference number(1 ) information after on 23-5-2022-->
        <xsl:if test="string-length(substring-after(.,$ref-id)) &gt; 0">
            <xsl:value-of select="substring-after(.,$ref-id)"/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="p/span[@class='EndnoteNumber' or @data-name='EndnoteNumber'][not(descendant::a)][string-length(normalize-space(.)) &gt; 0][1]">
        <xsl:variable name="referenced-id" select="self::span[@class='EndnoteNumber' or @data-name='EndnoteNumber'][string-length(normalize-space(.)) &gt; 0][1]/."/>
         <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:element name="a">
                <xsl:attribute name="class" select="'crossref'"/>
                <xsl:attribute name="href">
                    <xsl:value-of select="'#eref'"/>
                    <!--<xsl:value-of select="substring-before($referenced-id,'.')"/>-->
                    <!--<xsl:choose>
                        <xsl:when test="contains($referenced-id,'.')">
                            <xsl:value-of select="substring-before($referenced-id,'.')"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$referenced-id"/>
                        </xsl:otherwise>
                    </xsl:choose>-->
                    <!-- Added for eref value not match with endnotecaption by space(1. )  on 17-3-2022 -->
                    <xsl:analyze-string select="$referenced-id" regex="(\d+)">
                        <xsl:matching-substring>
                        <xsl:value-of select="regex-group(1)"/>
                        </xsl:matching-substring>
                    </xsl:analyze-string>
                    </xsl:attribute>
                <xsl:value-of select="$referenced-id"/>
                </xsl:element>
        </xsl:copy>
    </xsl:template>
     <!--descendant:: added for formatting on 2023-->
     <!--Azure 7128 [child::a[@class='crossref'] added to avoid sorting issue on 23-3-2023-->
    <!-- a[@class='crossref'] Removed to handle the no XML tag for endnotes on 26-4-2023 -->
    <xsl:template match="p[descendant::span[@class='EndnoteNumber' or @data-name='EndnoteNumber'][string-length(.) &gt; 0]]">
          <xsl:if test="not(preceding::p[descendant::span[@class='EndnoteNumber' or @data-name='EndnoteNumber']])">
            <xsl:text disable-output-escaping="yes">&lt;aside id="endnote_" data-alias="Endnotes"&gt;</xsl:text>
            <xsl:text disable-output-escaping="yes">&lt;ul type="none"&gt;</xsl:text>
        </xsl:if>
        
        <xsl:variable name="id">
            <xsl:for-each select="descendant::span[@class='EndnoteNumber' or @data-name='EndnoteNumber']">
                <!--<xsl:value-of select="."/>-->
                <!-- Added for eref value not match with endnotecaption by space(1. )  on 17-3-2022 -->
                <xsl:analyze-string select="." regex="(\d+)">
                    <xsl:matching-substring>
                        <xsl:value-of select="regex-group(1)"/> 
                    </xsl:matching-substring>
                </xsl:analyze-string>
            </xsl:for-each>
        </xsl:variable>
        <!--<xsl:element name="li">
            <xsl:attribute name="style" select="'mso-element:endnote'"/>
            <xsl:attribute name="id">
                <xsl:value-of select="'e'"/>
                <!-\-<xsl:choose>
                    <xsl:when test="contains($id,'.')">
                        <xsl:value-of select="substring-before($id,'.')"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$id"/>
                    </xsl:otherwise>
                </xsl:choose>-\->
                <!-\-<xsl:value-of select="count(preceding::p[child::span[@class='EndnoteNumber' or @data-name='EndnoteNumber']]) + 1"/>-\->
                <xsl:value-of select="count(preceding::p[child::span[@class='EndnoteNumber' or @data-name='EndnoteNumber']]) + 1"/>
                
            </xsl:attribute>-->
        <!-- Added to avoid the sorting issue, when more than para for endnotes  on 7-1-2022 -->
        <xsl:if test="preceding::p[descendant::span[@class='EndnoteNumber' or @data-name='EndnoteNumber']][1]">
            <xsl:text disable-output-escaping="yes">&lt;/li&gt;</xsl:text>
        </xsl:if>
        <!-- added class="endnotecaption" data-type="number" for editor on 23-2-2022 -->
        <xsl:text disable-output-escaping="yes">&lt;li style="mso-element:endnote" class="endnotecaption" data-type="number" id="</xsl:text>
        <xsl:choose>
            <xsl:when test="descendant::span[@class='EndnoteNumber' or @data-name='EndnoteNumber'][string-length(.) &gt; 0][1]/descendant::a[@class='crossref']">
                
                <xsl:value-of select="descendant::span[@class='EndnoteNumber' or @data-name='EndnoteNumber']/descendant::a[@class='crossref']/@id"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="'e'"/>
                <xsl:value-of select="count(preceding::p[descendant::span[@class='EndnoteNumber' or @data-name='EndnoteNumber']]) + 1"/>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
            <xsl:copy>
                <xsl:apply-templates select="@*"/>
                <xsl:apply-templates select=" node()"/>
            </xsl:copy>
        <xsl:if test="not(following::p[descendant::span[@class='EndnoteNumber' or @data-name='EndnoteNumber']])">
        <xsl:text disable-output-escaping="yes">&lt;/li&gt;</xsl:text>
        </xsl:if>
        <!--</xsl:element>-->
        <!-- End -->
        <xsl:if test="not(following::p[descendant::span[@class='EndnoteNumber' or @data-name='EndnoteNumber']])">
            <xsl:text disable-output-escaping="yes">&lt;/ul&gt;</xsl:text>
            <xsl:text disable-output-escaping="yes">&lt;/aside&gt;</xsl:text>
        </xsl:if>
    </xsl:template>
    <xsl:template match="span[@class='EndnoteNumber' or @data-name='EndnoteNumber'][descendant::a[@id]][string-length(.) &gt; 0]/a/@id"/>
    <!-- Added for images to html5 format on 23-11-2021 -->
    <!--<xsl:template match="p[descendant::span[@class='Figcaption' or @class='Fig caption' or @data-name='Fig caption' or @data-name='Figcaption' or @data-alias='FigureGroup']]">
        <xsl:element name="figure">
            <xsl:if test="self::p[preceding-sibling::w:p[child::w:drawing]]">
                <xsl:attribute name="data-alias" select="'FigureGroup'"/>
                <xsl:apply-templates select="self::p[preceding-sibling::w:p[child::w:drawing]]/preceding-sibling::w:p[1]/w:drawing"/>
            </xsl:if>
            
            <xsl:element name="figcaption">
                <xsl:apply-templates select="@*|node()"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>-->
    <!-- End -->
    <xsl:template match="//xmlid"/>
    </xsl:stylesheet>