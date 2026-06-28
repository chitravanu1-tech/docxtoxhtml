<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf"
    exclude-result-prefixes="xs mf"
    version="2.0">
    <!-- REM ************************************29-12-17; moved <textframe> to its after <paragraphRange> ********************************************************************* -->
    <!-- 02-JULY-19 -->
    <!--Added // for image not come 8-12-2020-->
    <!--updated for text missing phonix file error removed e- on 19-12-2020-->
    <xsl:output method="xml" name="xml" standalone="yes" indent="yes"/>
    <xsl:preserve-space elements="Content"/>

    
    <!--<xsl:template match="STORIES/STORY">
        <xsl:variable name="M" select="."/>
        <xsl:variable name="filename" select="concat('output1/',$M)"/>
        <xsl:result-document href="{$filename}" format="xml">
            
            <xsl:apply-templates select="document($M)"/> 
            
        </xsl:result-document>
    </xsl:template>-->
    
    
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    

    <xsl:template match="Rectangle">
        <xsl:param name="separate" select="' '"/>
        
        <xsl:variable name="IT" select="(self::Rectangle/@ItemTransform)"/>
        <!--<xsl:variable name="Y" select="(parent::Spread/Page[1]/@ItemTransform)"/> -->
        <xsl:variable name="Y"> 
            <xsl:choose>
                <xsl:when test="parent::Group">
                    <xsl:value-of select="(ancestor::Spread/Page[1]/@ItemTransform)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="(parent::Spread/Page[1]/@ItemTransform)"/>
                </xsl:otherwise>
            </xsl:choose> 
        </xsl:variable>
        <xsl:variable name="PageOrigin" select="tokenize($Y,$separate)"/>
        <xsl:variable name="XOrigin" select="number($PageOrigin[5])"/>
        <!--updated for text missing phonix file error removed e- on 19-12-2020--> 
        <xsl:variable name="PPT1" select="replace(((self::Rectangle/Properties/PathGeometry/GeometryPathType/PathPointArray/PathPointType[1]/@Anchor)),'e-','')"/>
        <xsl:variable name="PPT2" select="replace(((self::Rectangle/Properties/PathGeometry/GeometryPathType/PathPointArray/PathPointType[2]/@Anchor)),'e-','')"/>
        <xsl:variable name="PPT3" select="replace(((self::Rectangle/Properties/PathGeometry/GeometryPathType/PathPointArray/PathPointType[3]/@Anchor)),'e-','')"/>
        <xsl:variable name="PPT4" select="replace(((self::Rectangle/Properties/PathGeometry/GeometryPathType/PathPointArray/PathPointType[4]/@Anchor)),'e-','')"/>
        
        <xsl:variable name="TIT" select="tokenize($IT,$separate)"/>
        <xsl:variable name="One" select="tokenize($PPT1,$separate)"/>
        <xsl:variable name="Two" select="tokenize($PPT2,$separate)"/>
        <xsl:variable name="Three" select="tokenize($PPT3,$separate)"/>
        <xsl:variable name="Four" select="tokenize($PPT4,$separate)"/>
        
        <xsl:variable name="GroupOrigin" select="tokenize(parent::Group/@ItemTransform,$separate)"/>
        <xsl:variable name="GroupXOrigin" select="number($GroupOrigin[5])"/>
        
        
        
        <xsl:variable name="x1">
            <xsl:choose>
                <xsl:when test="$One[1] = '0'">
                    <xsl:value-of select="number($One[1])"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number(format-number(number($One[1]),'#.####'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="y1">
            <xsl:choose>
                <xsl:when test="$One[2] = '0'">
                    <xsl:value-of select="number($One[2])"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number(format-number(number($One[2]),'#.####'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable> 
        <xsl:variable name="x2">
            <xsl:choose>
                <xsl:when test="$Two[1] = '0'">
                    <xsl:value-of select="number($Two[1])"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number(format-number(number($Two[1]),'#.####'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="y2">
            <xsl:choose>
                <xsl:when test="$Two[2] = '0'">
                    <xsl:value-of select="number($Two[2])"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number(format-number(number($Two[2]),'#.####'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="x3">
            <xsl:choose>
                <xsl:when test="$Three[1] = '0'">
                    <xsl:value-of select="number($Three[1])"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number(format-number(number($Three[1]),'#.####'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="y3">
            <xsl:choose>
                <xsl:when test="$Three[2] = '0'">
                    <xsl:value-of select="number($Three[2])"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number(format-number(number($Three[2]),'#.####'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="x4">
            <xsl:choose>
                <xsl:when test="$Four[1] = '0'">
                    <xsl:value-of select="number($Four[1])"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number(format-number(number($Four[1]),'#.####'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="y4">
            <xsl:choose>
                <xsl:when test="$Four[2] = '0'">
                    <xsl:value-of select="number($Four[2])"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number(format-number(number($Four[2]),'#.####'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="a">
            <xsl:choose>
                <xsl:when test="$TIT[1] ='0'">
                    <xsl:value-of select="number($TIT[1])"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number(format-number(number($TIT[1]),'#.####'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="b">
            <xsl:choose>
                <xsl:when test="$TIT[2] ='0'">
                    <xsl:value-of select="number($TIT[2])"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number(format-number(number($TIT[2]),'#.####'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="c">
            <xsl:choose>
                <xsl:when test="$TIT[3] ='0'">
                    <xsl:value-of select="number($TIT[3])"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number(format-number(number($TIT[3]),'#.####'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="d">
            <xsl:choose>
                <xsl:when test="$TIT[4] ='0'">
                    <xsl:value-of select="number($TIT[4])"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number(format-number(number($TIT[4]),'#.####'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="tx">
            <xsl:choose>
                <xsl:when test="$TIT[5] ='0'">
                    <xsl:value-of select="number($TIT[5])"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number(format-number(number($TIT[5]),'#.####'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="ty">
            <xsl:choose>
                <xsl:when test="$TIT[6] ='0'">
                    <xsl:value-of select="number($TIT[6])"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number(format-number(number($TIT[6]),'#.####'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="Txorigin">
            <xsl:choose>
                <xsl:when test="parent::Group">
                    <xsl:value-of select="(($x1*$a)+($y1*$b)+$tx)+($GroupXOrigin)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="(($x1*$a)+($y1*$b)+$tx)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable> 
        
        <xsl:variable name="Tyorigin" select="($x1*$c)+($y1*$d)+$ty"/>
        
        
        <!--  <xsl:variable name="XOrigin" select="string($PageOrigin[5]) cast as xs:decimal"/>
        <xsl:variable name="Halfheight" select="abs(string($PageOrigin[6]) cast as xs:decimal)"/>-->
        <xsl:variable name="XOrigin">
            <xsl:choose>
                <xsl:when test="$PageOrigin[5] ='0'">
                    <xsl:value-of select="number($PageOrigin[5])"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number(format-number(number($PageOrigin[5]),'#.####'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="Halfheight">
            <xsl:choose>
                <xsl:when test="$PageOrigin[6] ='0'">
                    <xsl:value-of select="abs(number($PageOrigin[6]))"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="abs(number(format-number(number($PageOrigin[6]),'#.####')))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:element name="Rectangle">
            <xsl:attribute name="id" select="self::Rectangle/@Self"/>
            <!--Added // for image not come 8-12-2020-->
            <xsl:if test="self::Rectangle//Image">
                <xsl:variable name="link">
                    <xsl:variable name="local" select="tokenize(self::Rectangle//Image/Link/@LinkResourceURI,'/')[last()]"/>
                    <xsl:value-of select="replace($local,'%20',' ')"/>
                </xsl:variable>
                <xsl:attribute name="Image" select="$link"/>
            </xsl:if>
            <xsl:if test="self::Rectangle/EPS">
                <xsl:variable name="link">
                    <xsl:variable name="local" select="tokenize(self::Rectangle/EPS/Link/@LinkResourceURI,'/')[last()]"/>
                    <xsl:value-of select="replace($local,'%20',' ')"/>
                </xsl:variable>
                <xsl:attribute name="Image" select="$link"/>
            </xsl:if>   
            <xsl:if test="self::Rectangle/PDF">
                <xsl:variable name="link">
                    <xsl:variable name="local" select="tokenize(self::Rectangle/PDF/Link/@LinkResourceURI,'/')[last()]"/>
                    <xsl:value-of select="replace($local,'%20',' ')"/>
                </xsl:variable>
                <xsl:attribute name="Image" select="$link"/>
            </xsl:if>   
            <xsl:if test="self::Rectangle//Image">
                <xsl:variable name="link">
                    <xsl:variable name="local" select="self::Rectangle//Image/Link/@LinkResourceURI"/>
                    <xsl:value-of select="replace($local,'%20',' ')"/>
                </xsl:variable>
                <xsl:attribute name="ImagePath" select="$link"/>
            </xsl:if>
            <xsl:if test="self::Rectangle/EPS">
                <xsl:variable name="link">
                    <xsl:variable name="local" select="self::Rectangle/EPS/Link/@LinkResourceURI"/>
                    <xsl:value-of select="replace($local,'%20',' ')"/>
                </xsl:variable>
                <xsl:attribute name="ImagePath" select="$link"/>
            </xsl:if>   
            <xsl:if test="self::Rectangle/PDF">
                <xsl:variable name="link">
                    <xsl:variable name="local" select="self::Rectangle/PDF/Link/@LinkResourceURI"/>
                    <xsl:value-of select="replace($local,'%20',' ')"/>
                </xsl:variable>
                <xsl:attribute name="ImagePath" select="$link"/>
            </xsl:if> 
            <xsl:if test="$x1 &gt; $x3">
                <xsl:element name="width">
                    <xsl:value-of select="abs(($x1) - ($x3))"/>
                </xsl:element>
            </xsl:if>
            <xsl:if test="$x1 &lt; $x3">
                <xsl:element name="width">
                    <xsl:value-of select="abs(($x3) - ($x1))"/>
                </xsl:element>
            </xsl:if>
            
            
            <xsl:if test="$y1 &gt; $y3">
                <xsl:element name="height">
                    <xsl:value-of select="abs(($y1) - ($y3))"/>
                </xsl:element>
            </xsl:if>
            <xsl:if test="$y1 &lt; $y3">
                <xsl:element name="height">
                    <xsl:value-of select="abs(($y3) - ($y1))"/>
                </xsl:element>
            </xsl:if>        
            <!-- 02-JULY-19 -->
            
            <xsl:if test="descendant::TextFrame">
                <xsl:for-each select="TextFrame">
                    <xsl:text>&#x000A;</xsl:text>
                    <xsl:copy>
                        <xsl:apply-templates select="@*|node()"/>
                    </xsl:copy>
                </xsl:for-each>
            </xsl:if>
            
            <!-- 02-JULY-19 -->
        </xsl:element>
        
    </xsl:template>

    
    <xsl:template match="CharacterStyleRange[ancestor::ParagraphStyleRange[1]/Properties/AllNestedStyles|ancestor::ParagraphStyleRange[1]/AllNestedStyles]">
        <xsl:variable name="nestedCharacterStyle" select="ancestor::ParagraphStyleRange[1]/Properties/AllNestedStyles/descendant::AppliedCharacterStyle[1]|ancestor::ParagraphStyleRange[1]/AllNestedStyles/descendant::AppliedCharacterStyle[1]"/>
        <xsl:variable name="repetition" select="ancestor::ParagraphStyleRange[1]/Properties/AllNestedStyles/descendant::Repetition[1]|ancestor::ParagraphStyleRange[1]/AllNestedStyles/descendant::Repetition[1]"/>
        <xsl:variable name="delimiter" select="ancestor::ParagraphStyleRange[1]/Properties/AllNestedStyles/descendant::Delimiter[1]|ancestor::ParagraphStyleRange[1]/AllNestedStyles/descendant::Delimiter[1]"/>
        <xsl:choose>
            <!--<xsl:when test="ancestor::Change">
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:when>-->
            <xsl:when test="ancestor::Note">
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:when>
            <xsl:when test="descendant::Content">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="{name(.)}">
                    <xsl:if test="./@*">
                        <xsl:for-each select="@*">
                            <xsl:attribute name="{name(.)}" select="."/>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>  
    
    <xsl:template match="Content[ancestor::ParagraphStyleRange[1]/Properties/AllNestedStyles|ancestor::ParagraphStyleRange[1]/AllNestedStyles]">
        <xsl:choose>
            <!--<xsl:when test="ancestor::Change">
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:when>-->
            <xsl:when test="ancestor::Note">
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="nestedStyleCount" select="count(ancestor::ParagraphStyleRange[1]/Properties/AllNestedStyles/ListItem|ancestor::ParagraphStyleRange[1]/AllNestedStyles/ListItem)"/>
                <xsl:variable name="nestedCharacterStyle" select="ancestor::ParagraphStyleRange[1]/Properties/AllNestedStyles/descendant::AppliedCharacterStyle[1]|ancestor::ParagraphStyleRange[1]/AllNestedStyles/descendant::AppliedCharacterStyle[1]"/>
                <xsl:variable name="repetition" select="ancestor::ParagraphStyleRange[1]/Properties/AllNestedStyles/descendant::Repetition[1]|ancestor::ParagraphStyleRange[1]/AllNestedStyles/descendant::Repetition[1]"/>
                <xsl:variable name="delimiter" select="ancestor::ParagraphStyleRange[1]/Properties/AllNestedStyles/descendant::Delimiter[1]|ancestor::ParagraphStyleRange[1]/AllNestedStyles/descendant::Delimiter[1]"/>
                
                <xsl:variable name="pattern">
                    <xsl:variable name="content" select="."/>
                    <xsl:variable name="Tabsdelimiter" select="boolean(ancestor::ParagraphStyleRange[1]/Properties/AllNestedStyles/descendant::Delimiter ='Tabs') or boolean(ancestor::ParagraphStyleRange[1]/AllNestedStyles/descendant::Delimiter ='Tabs')"/>
                    <xsl:variable name="delimiters" select="ancestor::ParagraphStyleRange[1]/Properties/AllNestedStyles/descendant::Delimiter|ancestor::ParagraphStyleRange[1]/AllNestedStyles/descendant::Delimiter"/>
                    <xsl:for-each select="$delimiters">
                        <xsl:if test=". ='Sentence'">
                            <xsl:value-of select="'!?.'"/>        
                        </xsl:if>
                        <xsl:if test=". ='AnyWord'">
                            <!--<xsl:variable name="matches">
                                <xsl:choose>
                                    <xsl:when test="$Tabsdelimiter">
                                        <xsl:value-of select="mf:extract($content,'[\p{Zs}]')"/>
                                    </xsl:when>
                                    <xsl:when test="not($Tabsdelimiter)">
                                        <xsl:value-of select="mf:extract($content,'[\p{Zs}\t]')"/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:for-each select="$matches">
                                <xsl:value-of select="."/>
                            </xsl:for-each>-->
                        </xsl:if>
                        <xsl:if test=". ='AnyCharacter'">
<!--                            <xsl:value-of select="''"/>        -->
                        </xsl:if>
                        <xsl:if test=". ='Tabs'">
                            <xsl:variable name="matches" select="mf:extract($content,'[\t]')"/>
                            <xsl:for-each select="$matches">
                                <xsl:value-of select="."/>
                            </xsl:for-each>
                        </xsl:if>
                        <xsl:if test=". ='ForcedLineBreak'">
                            <xsl:value-of select="'&#8232;'"/>
                        </xsl:if>
                        <xsl:if test=". ='NonbreakingSpace'">
                            <xsl:value-of select="' '"/>
                        </xsl:if>
                        <xsl:if test=". ='EmSpace'">
                            <xsl:value-of select="' '"/>        
                        </xsl:if>
                        <xsl:if test=". ='EnSpace'">
                            <xsl:value-of select="' '"/>
                        </xsl:if>
                        <xsl:if test="not(. ='EnSpace') and not(. ='EmSpace') and not(. ='NonbreakingSpace') and not(. ='ForcedLineBreak') and not(. ='Tabs')
                            and not(. ='AnyCharacter') and not(. ='AnyWord') and not(. ='Sentence') and not(. ='IndentHereTab') and not(. ='SectionMarker')
                            and not(. ='Letters') and not(. ='Digits')">
                            <xsl:value-of select="."/>
                        </xsl:if>                        
                    </xsl:for-each>
                </xsl:variable>
                
                <xsl:call-template name="str.tokenize.keep.delimiters" xml:space="default">
                    <xsl:with-param name="string" select="."/>
                    <xsl:with-param name="delimiters" select="$pattern"/>
                </xsl:call-template>
               
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>   
    
    <xsl:template match="CharacterStyleRange[ancestor::ParagraphStyleRange[1]/descendant::AllNestedStyles]/Properties">
        <xsl:choose>
            <xsl:when test="parent::CharacterStyleRange/descendant::Content"/>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:otherwise>
            
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="str.tokenize.keep.delimiters">
        <xsl:param name="string" select="''"/>
        <!--        <xsl:param name="delimiters" select="' '"/>-->
        <xsl:param name="delimiters"/>
        <xsl:choose>
            <xsl:when test="not($string)"/>
            <xsl:when test="not($delimiters)">
                <xsl:call-template name="str.tokenize.keep.delimiters-characters">
                    <xsl:with-param name="string" select="$string"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="str.tokenize.keep.delimiters-delimiters">
                    <xsl:with-param name="string" select="$string"/>
                    <xsl:with-param name="delimiters" select="$delimiters"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="str.tokenize.keep.delimiters-characters">
        <xsl:param name="string"/>
        <xsl:if test="$string">
            <xsl:value-of select="substring($string, 1, 1)"/>
            <xsl:call-template name="str.tokenize.keep.delimiters-characters">
                <xsl:with-param name="string" select="substring($string, 2)"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <xsl:template name="str.tokenize.keep.delimiters-delimiters">
        <xsl:param name="string"/>
        <xsl:param name="delimiters"/>
        <xsl:variable name="delimiter" select="substring($delimiters, 1, 1)"/>
        <xsl:choose>
            <xsl:when test="not($delimiter)">
                <xsl:if test="processing-instruction() or not($string ='')">
                    <xsl:element name="CharacterStyleRange">
                        <xsl:if test="ancestor::CharacterStyleRange[1]/@*">
                            <xsl:for-each select="ancestor::CharacterStyleRange[1]/@*">
                                <xsl:attribute name="{name(.)}" select="."/>
                            </xsl:for-each>
                        </xsl:if>
                        <xsl:for-each select="ancestor::CharacterStyleRange[1]/Properties">
                                <xsl:copy-of select="."/>
                        </xsl:for-each>
                        <xsl:element name="Content">
                            <xsl:choose>
                                <xsl:when test="processing-instruction()">
                                    <xsl:copy-of select="processing-instruction()"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$string"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:element>
                    </xsl:element>
                </xsl:if>
            </xsl:when>
            <xsl:when test="contains($string, $delimiter)">
                <xsl:if test="not(starts-with($string, $delimiter))">
                    <xsl:call-template name="str.tokenize.keep.delimiters-delimiters">
                        <xsl:with-param name="string" select="substring-before($string, $delimiter)"/>
                        <xsl:with-param name="delimiters" select="substring($delimiters, 2)"/>
                    </xsl:call-template>
                </xsl:if>
                <!-- output each delimiter -->
                <xsl:variable name="Tabsdelimiter" select="boolean(ancestor::ParagraphStyleRange[1]/Properties/AllNestedStyles/descendant::Delimiter ='Tabs') or boolean(ancestor::ParagraphStyleRange[1]/AllNestedStyles/descendant::Delimiter ='Tabs')"/>
                <xsl:variable name="Sentencedelimiter" select="boolean(ancestor::ParagraphStyleRange[1]/Properties/AllNestedStyles/descendant::Delimiter ='Sentence') or boolean(ancestor::ParagraphStyleRange[1]/AllNestedStyles/descendant::Delimiter ='Sentence')"/>
                <xsl:variable name="AnyWorddelimiter" select="boolean(ancestor::ParagraphStyleRange[1]/Properties/AllNestedStyles/descendant::Delimiter ='AnyWord') or boolean(ancestor::ParagraphStyleRange[1]/AllNestedStyles/descendant::Delimiter ='AnyWord')"/>
                <xsl:variable name="ForcedLineBreakdelimiter" select="boolean(ancestor::ParagraphStyleRange[1]/Properties/AllNestedStyles/descendant::Delimiter ='ForcedLineBreak') or boolean(ancestor::ParagraphStyleRange[1]/AllNestedStyles/descendant::Delimiter ='ForcedLineBreak')"/>
                <xsl:variable name="NonbreakingSpacedelimiter" select="boolean(ancestor::ParagraphStyleRange[1]/Properties/AllNestedStyles/descendant::Delimiter ='NonbreakingSpace') or boolean(ancestor::ParagraphStyleRange[1]/AllNestedStyles/descendant::Delimiter ='NonbreakingSpace')"/>
                <xsl:variable name="EmSpacedelimiter" select="boolean(ancestor::ParagraphStyleRange[1]/Properties/AllNestedStyles/descendant::Delimiter ='EmSpace') or boolean(ancestor::ParagraphStyleRange[1]/AllNestedStyles/descendant::Delimiter ='EmSpace')"/>
                <xsl:variable name="EnSpacedelimiter" select="boolean(ancestor::ParagraphStyleRange[1]/Properties/AllNestedStyles/descendant::Delimiter ='EnSpace') or boolean(ancestor::ParagraphStyleRange[1]/AllNestedStyles/descendant::Delimiter ='EnSpace')"/>
                <xsl:variable name="tabmatches" select="mf:extract($string,'[\t]')"/>
                
                <xsl:variable name="spacematches">
                    <xsl:choose>
                        <xsl:when test="$Tabsdelimiter">
                            <xsl:value-of select="mf:extract($string,'[\p{Zs}]')"/>
                            
                        </xsl:when>
                        <xsl:when test="not($Tabsdelimiter)">
                            <xsl:value-of select="mf:extract($string,'[\p{Zs}\t]')"/>
                            
                        </xsl:when>
                    </xsl:choose>
                </xsl:variable>
                
                <xsl:element name="CharacterStyleRange">
                    <xsl:attribute name="delimiter">
                        <xsl:variable name="selfdelimiter" select="boolean(ancestor::ParagraphStyleRange[1]/Properties/AllNestedStyles/descendant::Delimiter = $delimiter) or boolean(ancestor::ParagraphStyleRange[1]/AllNestedStyles/descendant::Delimiter =$delimiter)"/>
                        <xsl:choose>
                            <xsl:when test="contains('!?.',$delimiter) and $Sentencedelimiter">
                                <xsl:choose>
                                    <xsl:when test="$selfdelimiter">
                                        <xsl:value-of select="$delimiter"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="'Sentence'"/> 
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <!--<xsl:when test="contains($spacematches,$delimiter) and $AnyWorddelimiter">
                                <xsl:choose>
                                    <xsl:when test="$selfdelimiter">
                                        <xsl:value-of select="$delimiter"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="'AnyWord'"/>  
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>-->
                            <!--<xsl:when test="$delimiter ='AnyCharacter'">
                                <!-\-                            <xsl:value-of select="''"/>        -\->
                            </xsl:when>-->
                            <xsl:when test="contains($tabmatches[1],$delimiter) and $Tabsdelimiter">
                                <xsl:choose>
                                    <xsl:when test="$selfdelimiter">
                                        <xsl:value-of select="$delimiter"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="'Tabs'"/>  
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:when test="($delimiter = '&#8232;') and $ForcedLineBreakdelimiter">
                                <xsl:choose>
                                    <xsl:when test="$selfdelimiter">
                                        <xsl:value-of select="$delimiter"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="'ForcedLineBreak'"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:when test="($delimiter = ' ') and $NonbreakingSpacedelimiter">
                                <xsl:choose>
                                    <xsl:when test="$selfdelimiter">
                                        <xsl:value-of select="$delimiter"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="'NonbreakingSpace'"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:when test="($delimiter = ' ') and $EmSpacedelimiter">
                                <xsl:choose>
                                    <xsl:when test="$selfdelimiter">
                                        <xsl:value-of select="$delimiter"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="'EmSpace'"/> 
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:when test="($delimiter = ' ') and $EnSpacedelimiter">
                                <xsl:choose>
                                    <xsl:when test="$selfdelimiter">
                                        <xsl:value-of select="$delimiter"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="'EnSpace'"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:when test="not(($delimiter = ' ') and $EnSpacedelimiter) and not(($delimiter = ' ') and $EmSpacedelimiter) and 
                                not(($delimiter = ' ') and $NonbreakingSpacedelimiter) and not(($delimiter = '&#8232;') and $ForcedLineBreakdelimiter) and not(contains($tabmatches[1],$delimiter) and $Tabsdelimiter)
                                and not(. ='AnyCharacter') and not(contains($spacematches,$delimiter) and $AnyWorddelimiter) and not(contains('!?.',$delimiter) and $Sentencedelimiter) and not(. ='IndentHereTab') and not(. ='SectionMarker')
                                and not(. ='Letters') and not(. ='Digits')">
                                <xsl:value-of select="$delimiter"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:attribute>
                    <xsl:if test="ancestor::CharacterStyleRange[1]/@*">
                        <xsl:for-each select="ancestor::CharacterStyleRange[1]/@*">
                            <xsl:attribute name="{name(.)}" select="."/>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:for-each select="ancestor::CharacterStyleRange[1]/Properties">
                        <xsl:copy-of select="."/>
                    </xsl:for-each>
                    <xsl:element name="Content">
                        <xsl:value-of select="$delimiter"/>
                    </xsl:element>
                </xsl:element>
                <xsl:if test="not(substring-after($string, $delimiter) = '')">
                    <xsl:call-template name="str.tokenize.keep.delimiters-delimiters">
                        <xsl:with-param name="string" select="substring-after($string, $delimiter)"/>
                        <xsl:with-param name="delimiters" select="$delimiters"/>
                    </xsl:call-template>
                </xsl:if>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="str.tokenize.keep.delimiters-delimiters">
                    <xsl:with-param name="string" select="$string"/>
                    <xsl:with-param name="delimiters" select="substring($delimiters, 2)"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

<xsl:template match="Table">
    <xsl:element name="{name(.)}">
        <xsl:if test="@*">
            <xsl:for-each select="@*">
                <xsl:attribute name="{name(.)}">
                    <xsl:value-of select="."/>
                </xsl:attribute>
            </xsl:for-each>
        </xsl:if> 
        <xsl:for-each select="child::* except Cell">
        
            <xsl:element name="{name(.)}">
                <xsl:if test="@*">
                    <xsl:for-each select="@*">
                        <xsl:attribute name="{name(.)}">
                            <xsl:value-of select="."/>
                        </xsl:attribute>
                    </xsl:for-each>
                </xsl:if> 
            </xsl:element>
        
        </xsl:for-each>
        
    <xsl:for-each select="Cell">
        <xsl:sort select="number(@RowName)"/>
        <xsl:sort select="number(@ColumnName)"/>
        <xsl:element name="{name(.)}">
      <xsl:if test="@*">
          <xsl:for-each select="@*">
          <xsl:attribute name="{name(.)}">
              <xsl:value-of select="."/>
          </xsl:attribute>
          </xsl:for-each>
      </xsl:if> 
        
        <xsl:apply-templates/>
        </xsl:element>
    </xsl:for-each>
    </xsl:element>
</xsl:template>

    <xsl:function name="mf:extract" as="xs:string*">
        <xsl:param name="input" as="xs:string"/>
        <xsl:param name="pattern" as="xs:string"/>
        <xsl:analyze-string select="$input" regex="{$pattern}">
            <xsl:matching-substring>
                <xsl:sequence select="."/>
            </xsl:matching-substring>
        </xsl:analyze-string>
    </xsl:function>


    <!-- REM ************************************29-12-17; moved <textframe> to its after <paragraphRange> ********************************************************************* -->
    <xsl:template match="ParagraphStyleXXXXXRange">
        <xsl:choose>
            <xsl:when test="descendant::TextFrame">                
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                    <xsl:text>&#x000A;</xsl:text>
                    <xsl:for-each select="descendant::TextFrame">
                        <xsl:copy>
                            <xsl:apply-templates select="descendant::TextFrame|@*"/>
                        </xsl:copy>
                    </xsl:for-each>
                </xsl:copy>
                
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="TextFrame[ancestor-or-self::ParagraphXXXXStyleRange]">        
        <!---->
    </xsl:template>
</xsl:stylesheet>