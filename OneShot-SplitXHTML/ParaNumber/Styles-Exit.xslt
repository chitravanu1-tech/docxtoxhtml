<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf"
    exclude-result-prefixes="xs mf"
    xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas"
    xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
    xmlns:o="urn:schemas-microsoft-com:office:office"
    xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"
    xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math"
    xmlns:v="urn:schemas-microsoft-com:vml"
    xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing"
    xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing"
    xmlns:w10="urn:schemas-microsoft-com:office:word"
    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml" 
    xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup"
    xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk"
    xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml"
    xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape" 
    xmlns:idPkg="http://ns.adobe.com/AdobeInDesign/idml/1.0/packaging" version="2.0">
    
    
    <!--<xsl:variable name="Graphic" select="collection('file:///E:/XSLT/OneShot/WOrdSpreadMap?select=Graphic.xml')"/>-->
    <xsl:variable name="Graphic" select="document('Graphic.xml')"/>
    <xsl:variable name="hex" >0123456789ABCDEF</xsl:variable>

    <!--<xsl:template match="/">
        <style>
            <xsl:apply-templates select="//RootCharacterStyleGroup|//RootParagraphStyleGroup"/>
        </style>
    </xsl:template>-->
    <xsl:template match="/">
        <w:styles xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
            xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"
            xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
            xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml" mc:Ignorable="w14">
            <!-- @@@@@@@@@@@@@@@ Default word styles @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
            <xsl:element name="w:docDefaults">
                <xsl:element name="w:rPrDefault">
                    <xsl:element name="w:rPr">
                        <xsl:element name="w:rFonts">
                            <xsl:attribute name="w:asciiTheme" select="'minorHAnsi'"/>
                            <xsl:attribute name="w:eastAsiaTheme" select="'minorHAnsi'"/>
                            <xsl:attribute name="w:hAnsiTheme" select="'minorHAnsi'"/>
                            <xsl:attribute name="w:cstheme" select="'minorBidi'"/>
                        </xsl:element>
                        <xsl:element name="w:sz">
                            <xsl:attribute name="w:val" select="'22'"/>
                        </xsl:element>
                        <xsl:element name="w:szCs">
                            <xsl:attribute name="w:val" select="'22'"/>
                        </xsl:element>
                        <xsl:element name="w:lang">
                            <xsl:attribute name="w:val" select="'en-US'"/>
                            <xsl:attribute name="w:eastAsia" select="'en-US'"/>
                            <xsl:attribute name="w:bidi" select="'ar-SA'"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>

                <xsl:element name="w:pPrDefault">
                    <xsl:element name="w:pPr">
                        <xsl:element name="w:spacing">
                            <xsl:attribute name="w:after" select="'200'"/>
                            <xsl:attribute name="w:line" select="'276'"/>
                            <xsl:attribute name="w:lineRule" select="'auto'"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
            </xsl:element>

            <xsl:element name="w:latentStyles">
                <xsl:attribute name="w:defLockedState" select="'0'"/>
                <xsl:attribute name="w:defUIPriority" select="'99'"/>
                <xsl:attribute name="w:defSemiHidden" select="'1'"/>
                <xsl:attribute name="w:defUnhideWhenUsed" select="'1'"/>
                <xsl:attribute name="w:defQFormat" select="'0'"/>

                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Normal'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'0'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>
                    <xsl:attribute name="w:qFormat" select="'1'"/>
                </xsl:element>

                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'heading 1'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'9'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>
                    <xsl:attribute name="w:qFormat" select="'1'"/>
                </xsl:element>

                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'heading 2'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'9'"/>
                    <xsl:attribute name="w:qFormat" select="'1'"/>
                </xsl:element>

                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'heading 3'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'9'"/>
                    <xsl:attribute name="w:qFormat" select="'1'"/>
                </xsl:element>

                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'heading 4'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'9'"/>
                    <xsl:attribute name="w:qFormat" select="'1'"/>
                </xsl:element>

                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'heading 5'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'9'"/>
                    <xsl:attribute name="w:qFormat" select="'1'"/>
                </xsl:element>

                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'heading 6'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'9'"/>
                    <xsl:attribute name="w:qFormat" select="'1'"/>
                </xsl:element>

                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'heading 7'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'9'"/>
                    <xsl:attribute name="w:qFormat" select="'1'"/>
                </xsl:element>

                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'heading 8'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'9'"/>
                    <xsl:attribute name="w:qFormat" select="'1'"/>
                </xsl:element>

                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'heading 9'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'9'"/>
                    <xsl:attribute name="w:qFormat" select="'1'"/>
                </xsl:element>

                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'toc 1'"/>
                    <xsl:attribute name="w:uiPriority" select="'39'"/>
                </xsl:element>

                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'toc 2'"/>
                    <xsl:attribute name="w:uiPriority" select="'39'"/>
                </xsl:element>

                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'toc 3'"/>
                    <xsl:attribute name="w:uiPriority" select="'39'"/>
                </xsl:element>

                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'toc 4'"/>
                    <xsl:attribute name="w:uiPriority" select="'39'"/>
                </xsl:element>

                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'toc 5'"/>
                    <xsl:attribute name="w:uiPriority" select="'39'"/>
                </xsl:element>

                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'toc 7'"/>
                    <xsl:attribute name="w:uiPriority" select="'39'"/>
                </xsl:element>

                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'toc 8'"/>
                    <xsl:attribute name="w:uiPriority" select="'39'"/>
                </xsl:element>

                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'toc 9'"/>
                    <xsl:attribute name="w:uiPriority" select="'39'"/>
                </xsl:element>

                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'caption'"/>
                    <xsl:attribute name="w:uiPriority" select="'35'"/>
                    <xsl:attribute name="w:qFormat" select="'1'"/>
                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Title'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'10'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>
                    <xsl:attribute name="w:qFormat" select="'1'"/>
                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Default Paragraph Font'"/>
                    <xsl:attribute name="w:uiPriority" select="'1'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Subtitle'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'11'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>
                    <xsl:attribute name="w:qFormat" select="'1'"/>
                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Strong'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'22'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>
                    <xsl:attribute name="w:qFormat" select="'1'"/>
                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Emphasis'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'20'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>
                    <xsl:attribute name="w:qFormat" select="'1'"/>
                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Table Grid'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'59'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Placeholder Text'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'No Spacing'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'1'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>
                    <xsl:attribute name="w:qFormat" select="'1'"/>
                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Light Shading'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'60'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Light List'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'61'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Light Grid'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'62'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium Shading 1'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'63'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium Shading 2'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'64'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium List 1'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'65'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium List 2'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'66'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium Grid 1'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'67'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium Grid 2'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'68'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium Grid 3'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'69'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Dark List'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'70'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Colorful Shading'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'71'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Colorful List'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'72'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Colorful Grid'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'73'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Light Shading Accent 1'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'60'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Light List Accent 1'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'61'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Light Grid Accent 1'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'62'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium Shading 1 Accent 1'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'63'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium Shading 2 Accent 1'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'64'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium List 1 Accent 1'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'65'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Revision'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'List Paragraph'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'34'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>
                    <xsl:attribute name="w:qFormat" select="'1'"/>
                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Quote'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'29'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>
                    <xsl:attribute name="w:qFormat" select="'1'"/>
                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Intense Quote'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'30'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>
                    <xsl:attribute name="w:qFormat" select="'1'"/>
                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium List 2 Accent 1'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'66'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium Grid 1 Accent 1'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'67'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium Grid 2 Accent 1'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'68'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium Grid 3 Accent 1'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'69'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Dark List Accent 1'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'70'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Colorful Shading Accent 1'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'71'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Colorful List Accent 1'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'72'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Colorful Grid Accent 1'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'73'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Light Shading Accent 2'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'60'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Light List Accent 2'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'61'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Light Grid Accent 2'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'62'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium Shading 1 Accent 2'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'63'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium Shading 2 Accent 2'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'64'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium List 1 Accent 2'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'65'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium List 2 Accent 2'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'66'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium Grid 1 Accent 2'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'67'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium Grid 2 Accent 2'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'68'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium Grid 3 Accent 2'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'69'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Dark List Accent 2'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'70'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Colorful Shading Accent 2'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'71'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Colorful List Accent 2'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'72'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Colorful Grid Accent 2'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'73'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Light Shading Accent 3'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'60'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Light List Accent 3'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'61'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Light Grid Accent 3'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'62'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium Shading 1 Accent 3'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'63'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium Shading 2 Accent 3'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'64'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium List 1 Accent 3'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'65'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium List 2 Accent 3'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'66'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium Grid 1 Accent 3'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'67'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium Grid 2 Accent 3'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'68'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium Grid 3 Accent 3'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'69'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Dark List Accent 3'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'70'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Colorful Shading Accent 3'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'71'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Colorful List Accent 3'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'72'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Colorful Grid Accent 3'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'73'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Light Shading Accent 4'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'60'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Light List Accent 4'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'61'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Light Grid Accent 4'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'62'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium Shading 1 Accent 4'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'63'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium Shading 2 Accent 4'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'64'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium List 1 Accent 4'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'65'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium List 2 Accent 4'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'66'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium Grid 1 Accent 4'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'67'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium Grid 2 Accent 4'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'68'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium Grid 3 Accent 4'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'69'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Dark List Accent 4'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'70'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Colorful Shading Accent 4'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'71'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Colorful List Accent 4'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'72'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Colorful Grid Accent 4'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'73'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Light Shading Accent 5'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'60'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Light List Accent 5'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'61'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Light Grid Accent 5'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'62'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium Shading 1 Accent 5'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'63'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium Shading 2 Accent 5'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'64'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium List 1 Accent 5'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'65'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium List 2 Accent 5'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'66'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium Grid 1 Accent 5'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'67'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium Grid 2 Accent 5'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'68'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium Grid 3 Accent 5'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'69'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Dark List Accent 5'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'70'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Colorful Shading Accent 5'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'71'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Colorful List Accent 5'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'72'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Colorful Grid Accent 5'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'73'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Light Shading Accent 6'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'60'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Light List Accent 6'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'61'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Light Grid Accent 6'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'62'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium Shading 1 Accent 6'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'63'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium Shading 2 Accent 6'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'64'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium List 1 Accent 6'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'65'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium List 2 Accent 6'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'66'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium Grid 1 Accent 6'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'67'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium Grid 2 Accent 6'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'68'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Medium Grid 3 Accent 6'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'69'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Dark List Accent 6'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'70'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Colorful Shading Accent 6'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'71'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Colorful List Accent 6'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'72'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Colorful Grid Accent 6'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'73'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Subtle Emphasis'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'19'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>
                    <xsl:attribute name="w:qFormat" select="'1'"/>
                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Intense Emphasis'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'21'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>
                    <xsl:attribute name="w:qFormat" select="'1'"/>
                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Subtle Reference'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'31'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>
                    <xsl:attribute name="w:qFormat" select="'1'"/>
                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Intense Reference'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'32'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>
                    <xsl:attribute name="w:qFormat" select="'1'"/>
                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Book Title'"/>
                    <xsl:attribute name="w:semiHidden" select="'0'"/>
                    <xsl:attribute name="w:uiPriority" select="'33'"/>
                    <xsl:attribute name="w:unhideWhenUsed" select="'0'"/>
                    <xsl:attribute name="w:qFormat" select="'1'"/>
                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'Bibliography'"/>
                    <xsl:attribute name="w:uiPriority" select="'37'"/>

                </xsl:element>
                <xsl:element name="w:lsdException">
                    <xsl:attribute name="w:name" select="'TOC Heading'"/>
                    <xsl:attribute name="w:uiPriority" select="'39'"/>
                    <xsl:attribute name="w:qFormat" select="'1'"/>
                </xsl:element>
            </xsl:element>
            
            <!-- @@@@@@@@@@@@@@@ Temporary Table Style @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
            <w:style w:type="table" w:styleId="LightGrid-Accent1">
                <w:name w:val="Light Grid Accent 1"/>
                <w:basedOn w:val="TableNormal"/>
                <w:uiPriority w:val="62"/>
                <w:rsid w:val="000B5723"/>
                <w:pPr>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                </w:pPr>
                <w:tblPr>
                    <w:tblStyleRowBandSize w:val="1"/>
                    <w:tblStyleColBandSize w:val="1"/>
                    <w:tblInd w:w="0" w:type="dxa"/>
                    <w:tblBorders>
                        <w:top w:val="single" w:sz="8" w:space="0" w:color="4F81BD" w:themeColor="accent1"/>
                        <w:left w:val="single" w:sz="8" w:space="0" w:color="4F81BD" w:themeColor="accent1"/>
                        <w:bottom w:val="single" w:sz="8" w:space="0" w:color="4F81BD"
                            w:themeColor="accent1"/>
                        <w:right w:val="single" w:sz="8" w:space="0" w:color="4F81BD" w:themeColor="accent1"/>
                        <w:insideH w:val="single" w:sz="8" w:space="0" w:color="4F81BD"
                            w:themeColor="accent1"/>
                        <w:insideV w:val="single" w:sz="8" w:space="0" w:color="4F81BD"
                            w:themeColor="accent1"/>
                    </w:tblBorders>
                    <w:tblCellMar>
                        <w:top w:w="0" w:type="dxa"/>
                        <w:left w:w="108" w:type="dxa"/>
                        <w:bottom w:w="0" w:type="dxa"/>
                        <w:right w:w="108" w:type="dxa"/>
                    </w:tblCellMar>
                </w:tblPr>
                <w:tblStylePr w:type="firstRow">
                    <w:pPr>
                        <w:spacing w:before="0" w:after="0" w:line="240" w:lineRule="auto"/>
                    </w:pPr>
                    <w:rPr>
                        <w:rFonts w:asciiTheme="majorHAnsi" w:eastAsiaTheme="majorEastAsia"
                            w:hAnsiTheme="majorHAnsi" w:cstheme="majorBidi"/>

                    </w:rPr>
                    <w:tblPr/>
                    <w:tcPr>
                        <w:tcBorders>
                            <w:top w:val="single" w:sz="8" w:space="0" w:color="4F81BD"
                                w:themeColor="accent1"/>
                            <w:left w:val="single" w:sz="8" w:space="0" w:color="4F81BD"
                                w:themeColor="accent1"/>
                            <w:bottom w:val="single" w:sz="18" w:space="0" w:color="4F81BD"
                                w:themeColor="accent1"/>
                            <w:right w:val="single" w:sz="8" w:space="0" w:color="4F81BD"
                                w:themeColor="accent1"/>
                            <w:insideH w:val="nil"/>
                            <w:insideV w:val="single" w:sz="8" w:space="0" w:color="4F81BD"
                                w:themeColor="accent1"/>
                        </w:tcBorders>
                    </w:tcPr>
                </w:tblStylePr>
                <w:tblStylePr w:type="lastRow">
                    <w:pPr>
                        <w:spacing w:before="0" w:after="0" w:line="240" w:lineRule="auto"/>
                    </w:pPr>
                    <w:rPr>
                        <w:rFonts w:asciiTheme="majorHAnsi" w:eastAsiaTheme="majorEastAsia"
                            w:hAnsiTheme="majorHAnsi" w:cstheme="majorBidi"/>
                    </w:rPr>
                    <w:tblPr/>
                    <w:tcPr>
                        <w:tcBorders>
                            <w:top w:val="double" w:sz="6" w:space="0" w:color="4F81BD"
                                w:themeColor="accent1"/>
                            <w:left w:val="single" w:sz="8" w:space="0" w:color="4F81BD"
                                w:themeColor="accent1"/>
                            <w:bottom w:val="single" w:sz="8" w:space="0" w:color="4F81BD"
                                w:themeColor="accent1"/>
                            <w:right w:val="single" w:sz="8" w:space="0" w:color="4F81BD"
                                w:themeColor="accent1"/>
                            <w:insideH w:val="nil"/>
                            <w:insideV w:val="single" w:sz="8" w:space="0" w:color="4F81BD"
                                w:themeColor="accent1"/>
                        </w:tcBorders>
                    </w:tcPr>
                </w:tblStylePr>
                <w:tblStylePr w:type="firstCol">
                    <w:rPr>
                        <w:rFonts w:asciiTheme="majorHAnsi" w:eastAsiaTheme="majorEastAsia"
                            w:hAnsiTheme="majorHAnsi" w:cstheme="majorBidi"/>
                                     </w:rPr>
                </w:tblStylePr>
                <w:tblStylePr w:type="lastCol">
                    <w:rPr>
                        <w:rFonts w:asciiTheme="majorHAnsi" w:eastAsiaTheme="majorEastAsia"
                            w:hAnsiTheme="majorHAnsi" w:cstheme="majorBidi"/>
                     
                    </w:rPr>
                    <w:tblPr/>
                    <w:tcPr>
                        <w:tcBorders>
                            <w:top w:val="single" w:sz="8" w:space="0" w:color="4F81BD"
                                w:themeColor="accent1"/>
                            <w:left w:val="single" w:sz="8" w:space="0" w:color="4F81BD"
                                w:themeColor="accent1"/>
                            <w:bottom w:val="single" w:sz="8" w:space="0" w:color="4F81BD"
                                w:themeColor="accent1"/>
                            <w:right w:val="single" w:sz="8" w:space="0" w:color="4F81BD"
                                w:themeColor="accent1"/>
                        </w:tcBorders>
                    </w:tcPr>
                </w:tblStylePr>
                <w:tblStylePr w:type="band1Vert">
                    <w:tblPr/>
                    <w:tcPr>
                        <w:tcBorders>
                            <w:top w:val="single" w:sz="8" w:space="0" w:color="4F81BD"
                                w:themeColor="accent1"/>
                            <w:left w:val="single" w:sz="8" w:space="0" w:color="4F81BD"
                                w:themeColor="accent1"/>
                            <w:bottom w:val="single" w:sz="8" w:space="0" w:color="4F81BD"
                                w:themeColor="accent1"/>
                            <w:right w:val="single" w:sz="8" w:space="0" w:color="4F81BD"
                                w:themeColor="accent1"/>
                        </w:tcBorders>
                        <w:shd w:val="clear" w:color="auto" w:fill="D3DFEE" w:themeFill="accent1"
                            w:themeFillTint="3F"/>
                    </w:tcPr>
                </w:tblStylePr>
                <w:tblStylePr w:type="band1Horz">
                    <w:tblPr/>
                    <w:tcPr>
                        <w:tcBorders>
                            <w:top w:val="single" w:sz="8" w:space="0" w:color="4F81BD"
                                w:themeColor="accent1"/>
                            <w:left w:val="single" w:sz="8" w:space="0" w:color="4F81BD"
                                w:themeColor="accent1"/>
                            <w:bottom w:val="single" w:sz="8" w:space="0" w:color="4F81BD"
                                w:themeColor="accent1"/>
                            <w:right w:val="single" w:sz="8" w:space="0" w:color="4F81BD"
                                w:themeColor="accent1"/>
                            <w:insideV w:val="single" w:sz="8" w:space="0" w:color="4F81BD"
                                w:themeColor="accent1"/>
                        </w:tcBorders>
                        <w:shd w:val="clear" w:color="auto" w:fill="D3DFEE" w:themeFill="accent1"
                            w:themeFillTint="3F"/>
                    </w:tcPr>
                </w:tblStylePr>
                <w:tblStylePr w:type="band2Horz">
                    <w:tblPr/>
                    <w:tcPr>
                        <w:tcBorders>
                            <w:top w:val="single" w:sz="8" w:space="0" w:color="4F81BD"
                                w:themeColor="accent1"/>
                            <w:left w:val="single" w:sz="8" w:space="0" w:color="4F81BD"
                                w:themeColor="accent1"/>
                            <w:bottom w:val="single" w:sz="8" w:space="0" w:color="4F81BD"
                                w:themeColor="accent1"/>
                            <w:right w:val="single" w:sz="8" w:space="0" w:color="4F81BD"
                                w:themeColor="accent1"/>
                            <w:insideV w:val="single" w:sz="8" w:space="0" w:color="4F81BD"
                                w:themeColor="accent1"/>
                        </w:tcBorders>
                    </w:tcPr>
                </w:tblStylePr>
            </w:style>
            <!-- @@@@@@@@@@@@@@@ Temporary Table Style @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
            
            <!-- @@@@@@@@@@@@@@@ Temporary Footnote Style @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
            <w:style w:type="character" w:styleId="FootnoteReference">
                <w:name w:val="footnote reference"/>
                <w:basedOn w:val="DefaultParagraphFont"/>
                <w:uiPriority w:val="99"/>
                <w:semiHidden/>
                <w:unhideWhenUsed/>
                <w:rsid w:val="005E3F96"/>
                <w:rPr>
                    <w:vertAlign w:val="superscript"/>
                </w:rPr>
            </w:style>
            <!-- @@@@@@@@@@@@@@@ Temporary Footnote Style @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
            
            <!-- @@@@@@@@@@@@@@@ Default word styles @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
            
           <!-- <xsl:apply-templates/>-->
            <!-- taking the content of character style and paragraph style to create a well formed styles.xml -->
            <xsl:apply-templates select="//RootCharacterStyleGroup|//RootParagraphStyleGroup"/>

        </w:styles>
    </xsl:template>
    
    <xsl:template match="RootCharacterStyleGroup">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="CharacterStyle">    
        <xsl:variable name="Na">
            <xsl:choose>
                <xsl:when test="contains(@Name,'$ID/')">
                    <xsl:value-of select="substring-after(@Name,'$ID/')"/>
                </xsl:when>
                <xsl:when test="contains(@Name,'CharacterStyle/')">
                    <xsl:value-of select="substring-after(@Name,'CharacterStyle/')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="@Name"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="FS" select="@PointSize"/>
        <xsl:variable name="C1" select="@Capitalization"/>
       
          
        <xsl:element name="w:style">
            <xsl:attribute name="w:type" select="'character'"/>
            <xsl:attribute name="w:customStyle" select="'1'"/>
            
              <xsl:attribute name="w:styleId">
                  <xsl:variable name="LinkName" select="@PCLink"/>
               <xsl:variable name="OrgName">
                   <xsl:variable name="styleId" select="@cStyleID"/>
                   <xsl:choose>
                       <xsl:when test="not(string-length($styleId) = 0)">
                           <xsl:value-of select="$styleId"/>
                       </xsl:when>
                       <xsl:otherwise>
                           <xsl:choose>
                               <xsl:when test="contains($Na,'\')">
                                   <xsl:value-of select="replace($Na,'\\','')"/>
                               </xsl:when>
                               <xsl:otherwise>
                                   <xsl:value-of select="$Na"/>
                               </xsl:otherwise>
                           </xsl:choose>
                       </xsl:otherwise>
                   </xsl:choose>
             <!--  <xsl:choose>
                   <!-\-<xsl:when test="contains($Na,'$ID')">
                       <xsl:value-of select="tokenize($Na,'/')[last()]"/>
                   </xsl:when>-\->
                   <xsl:when test="contains($Na,'\')">
                       <xsl:value-of select="replace($Na,'\\','')"/>
                   </xsl:when>
                   <xsl:otherwise>
                      <xsl:value-of select="$Na"/>
                   </xsl:otherwise>
               </xsl:choose>-->
               </xsl:variable>
                  <xsl:choose>
                      <xsl:when test="@PCLink">
                          <xsl:value-of select="concat($OrgName,$LinkName)"/>
                      </xsl:when>
                      <xsl:otherwise>
                          <xsl:value-of select="$OrgName"/>
                      </xsl:otherwise>
                  </xsl:choose>
                  
              </xsl:attribute>
              
                  <xsl:element name="w:name">
                      <xsl:variable name="LinkName" select="@PCLink"/>
                      <xsl:variable name="OrgName1">   
                        <xsl:choose>
                           <!-- <xsl:when test="contains($Na,'$ID')">
                                <xsl:value-of select="tokenize($Na,'/')[last()]"/>
                            </xsl:when>-->
                            <xsl:when test="contains($Na,'\')">
                                <xsl:value-of select="replace($Na,'\\','')"/>
                            </xsl:when>
                             <xsl:otherwise>                            
                                <xsl:value-of select="$Na"/>
                            </xsl:otherwise>
                        </xsl:choose>
                      </xsl:variable>
                      
                      <xsl:attribute name="w:val">
                      <xsl:choose>
                          <xsl:when test="@PCLink">
                              <xsl:value-of select="$OrgName1,$LinkName"/>
                          </xsl:when>
                          <xsl:otherwise>
                              <xsl:value-of select="$OrgName1"/>
                          </xsl:otherwise>
                      </xsl:choose>
                      </xsl:attribute>
                      
                  </xsl:element>
        
        
              <xsl:if test="Properties">
                  
                  <xsl:if test="Properties/BasedOn">
                      <xsl:variable name="bo">
                          <xsl:choose>
                              <xsl:when test="contains(Properties/BasedOn,'$ID/')">
                                  <xsl:value-of select="substring-after(Properties/BasedOn,'$ID/')"/>
                              </xsl:when>
                              <xsl:when test="contains(Properties/BasedOn,'CharacterStyle/')">
                                  <xsl:value-of select="substring-after(Properties/BasedOn,'CharacterStyle/')"/>
                              </xsl:when>
                              <xsl:otherwise>
                                  <xsl:value-of select="Properties/BasedOn"/>
                              </xsl:otherwise>
                          </xsl:choose>
                      </xsl:variable>
                      
                      <xsl:element name="w:basedOn">
                          <!--                                        new update 28.9.2016-->
                          <xsl:variable name="styleName" select="substring-after(Properties/BasedOn,'CharacterStyle/')"/>
                          <xsl:choose>
                              <xsl:when test="matches($bo,'[\W\s]')">
                                  <xsl:variable name="styleId">
                                      <xsl:for-each select="//CharacterStyle[@Name = $styleName]">
<!--                                          <xsl:if test="@Name = $styleName">-->
                                              <xsl:value-of select="@cStyleID"/>
                                          <!--</xsl:if>-->
                                      </xsl:for-each>    
                                  </xsl:variable>
                                  <xsl:choose>
                                      <xsl:when test="not(string-length($styleId) = 0)">
                                          <xsl:attribute name="w:val" select="$styleId"/>
                                      </xsl:when>
                                      <xsl:otherwise>
                                          <xsl:choose>
                                              <xsl:when test="contains($bo,'%3a')">
                                                  <xsl:variable name="Pf" select="replace($bo,'%3a',':')"></xsl:variable>
                                                  <xsl:attribute name="w:val" select="$Pf"/> 
                                              </xsl:when>
                                              <xsl:when test="contains($bo,'\')">
                                                  <xsl:attribute name="w:val" select="replace($bo,'\\','')"/>
                                              </xsl:when>
                                              <xsl:otherwise>                           
                                                  <xsl:attribute name="w:val" select="$bo"/>
                                              </xsl:otherwise>
                                          </xsl:choose>
                                      </xsl:otherwise>
                                  </xsl:choose>
                              </xsl:when>
                              <xsl:otherwise>
                                  <xsl:attribute name="w:val" select="$bo"/>
                              </xsl:otherwise>
                          </xsl:choose>
                          <xsl:choose>
                              <!--<xsl:when test="contains($bo,'$ID')">
                                  <xsl:attribute name="w:val" select="tokenize($bo,'/')[last()]"/>
                              </xsl:when>-->
                              <xsl:when test="contains($bo,'%3a')">
                                  <xsl:variable name="Pf" select="replace($bo,'%3a',':')"></xsl:variable>
                                  <xsl:attribute name="w:val" select="$Pf"/> 
                              </xsl:when>
                              <xsl:when test="contains($bo,'\')">
                                  <xsl:attribute name="w:val" select="replace($bo,'\\','')"/>
                              </xsl:when>
                              <xsl:otherwise>                           
                                  <xsl:attribute name="w:val" select="$bo"/>
                              </xsl:otherwise>
                          </xsl:choose>
                          
                      </xsl:element>
                  </xsl:if>
                  
              </xsl:if>
              
        
              <xsl:if test="@PCLink">
              <xsl:element name="w:link">
                  <!--<xsl:attribute name="w:val" select="normalize-space($Na)"/>-->
                  <xsl:variable name="OrgName1">   
                      <xsl:choose>
                          <xsl:when test="contains($Na,'[No character style]')">
                              <xsl:value-of select="tokenize($Na,'/')[last()]"/>
                          </xsl:when>
                          <xsl:when test="contains($Na,'\')">
                              <xsl:variable name="Na1" select="replace($Na,'\s\.','_')"/>
                              <xsl:value-of select="replace($Na1,'\\','')"/>
                              <!--<xsl:attribute name="w:val" select="replace($Na,'\','')"/>-->
                          </xsl:when>
                          <xsl:when test="contains($Na,'/')">
                              <xsl:variable name="Na1" select="replace($Na,'\s\.','_')"/>
                              <xsl:value-of select="tokenize($Na1,'/')[last()]"/>
                              <!-- <xsl:attribute name="w:val" select="tokenize($Na,'/')[last()]"/>-->
                          </xsl:when>
                          <xsl:otherwise>
                              <!--<xsl:attribute name="w:val" select="$Na"/>-->
                              <xsl:value-of select="replace($Na,'\s\.','_')"/>
                              <!--<xsl:attribute name="w:val" select="replace($Na1,' ','')"/>-->
                          </xsl:otherwise>
                      </xsl:choose>
                  </xsl:variable>
                  
                  <xsl:attribute name="w:val">
                              <xsl:value-of select="$OrgName1"/>
                  </xsl:attribute>
                  
              </xsl:element>
              </xsl:if>
          
              <xsl:element name="w:qFormat"/>
              
              <xsl:if test="Properties">
                  <xsl:element name="w:rPr">
                      <xsl:if test="Properties/AppliedFont">
                          
                          <xsl:element name="w:rFonts">
                              <xsl:attribute name="w:ascii" select="Properties/AppliedFont"/>
                              <xsl:attribute name="w:hAnsi" select="Properties/AppliedFont"/>
                          </xsl:element>
                          
                      </xsl:if>
<!--                  <xsl:if test="contains(@FontStyle,'Black') or contains(@FontStyle,'Bold') or contains(@FontStyle,'Strong') or contains(@FontStyle,'black') or contains(@FontStyle,'bold') or contains(@FontStyle,'strong') or contains(@FontStyle,'Extra') or contains(@FontStyle,'extra') or contains(@FontStyle,'Heavy') or contains(@FontStyle,'heavy') ">-->
                      <xsl:if test="contains(lower-case(@FontStyle),'mediXum') or contains(lower-case(@FontStyle),'black') or contains(lower-case(@FontStyle),'bold') or contains(lower-case(@FontStyle),'strong') or contains(lower-case(@FontStyle),'demi') or contains(lower-case(@FontStyle),'extra') or contains(lower-case(@FontStyle),'heavy') ">
                          <xsl:element name="w:b"/>
                      </xsl:if>
                      <!--</xsl:if>-->
                      <xsl:if test="contains(lower-case(@FontStyle),'italic') or contains(lower-case(@FontStyle),'oblique')">
                          <xsl:element name="w:i"/>
                      </xsl:if>
                      <xsl:if test="contains(lower-case(@FontStyle),'regular') or contains(lower-case(@FontStyle),'roman')">
                          <xsl:element name="w:b">
                              <xsl:attribute name="w:val" select="'0'"/>
                          </xsl:element>
                          <xsl:element name="w:i">
                              <xsl:attribute name="w:val" select="'0'"/>
                          </xsl:element>
                      </xsl:if>
                      
                      <xsl:if test="@Capitalization">
                          <xsl:if test="contains($C1,'SmallCaps')">
                              <xsl:element name="w:smallCaps"/>
                          </xsl:if>
                          <xsl:if test="contains($C1,'AllCaps')">
                              <xsl:element name="w:caps"/>
                          </xsl:if>
                          <xsl:if test="contains($C1,'Normal')">
                              <xsl:element name="w:caps">
                                  <xsl:attribute name="w:val" select="'0'"/>
                              </xsl:element>
                          </xsl:if>
                      </xsl:if>
                      
                      <xsl:if test="@StrikeThru = 'true'">
                          <xsl:element name="w:strike"/>
                      </xsl:if>
                                         
                      <!--*********************Font Color****************************************************************-->
<!--                      <xsl:if test="self::CharacterStyleRange/@FillColor">-->
                          <xsl:variable name="FC">
                              <!--<xsl:variable name="color" select="self::CharacterStyleRange/@FillColor"/>-->
                              <xsl:variable name="color" select="@FillColor"/>
                               
                              <xsl:call-template name="color">
                                  <xsl:with-param name="colorName" select="$color"/>
                              </xsl:call-template>
                          </xsl:variable>
                          <xsl:if test="string-length($FC) &gt; 0">
                              <xsl:element name="w:color">
                                  <xsl:attribute name="w:val">
                                      <xsl:value-of select="$FC"/>
                                  </xsl:attribute>
                                  <xsl:if test="@FillTint">
                                  <xsl:attribute name="FillTint">
                                      <xsl:value-of select="@FillTint"/>
                                  </xsl:attribute>
                                  </xsl:if>
                              </xsl:element> 
                          </xsl:if>
                      <!--</xsl:if>-->
                      <!--*********************Font Color****************************************************************-->
                      
                      <xsl:if test="self::CharacterStyle/@PointSize">
                          <xsl:element name="w:sz">
                              <!--<xsl:attribute name="w:val" select="$FS * 2"/>-->
                              <xsl:attribute name="w:val" select="round($FS * 2)"/>
                          </xsl:element>
                      </xsl:if>
                      
                      <xsl:if test="@Underline ='true'">
                          <xsl:variable name="underlineColor">
                              <xsl:if test="Properties/UnderlineColor">
                                  <xsl:value-of select="Properties/UnderlineColor"/>
                              </xsl:if>
                          </xsl:variable>
                          
                          <xsl:variable name="underlineType">
                              <xsl:variable name="type">
                                  <xsl:if test="Properties/UnderlineType">
                                      <xsl:value-of select="Properties/UnderlineType"/>
                                  </xsl:if>
                              </xsl:variable>
                              <xsl:choose>
                                  <xsl:when test="contains(lower-case($type),'dash')">
                                      <xsl:value-of select="'dash'"/>
                                  </xsl:when>
                                  <xsl:when test="contains(lower-case($type),'dot')">
                                      <xsl:value-of select="'dotDash'"/>
                                  </xsl:when>
                                  <xsl:when test="contains(lower-case($type),'wavy')">
                                      <xsl:value-of select="'wave'"/>
                                  </xsl:when>
                                  <xsl:otherwise>
                                      <xsl:value-of select="'words'"/>
                                  </xsl:otherwise>
                              </xsl:choose>
                          </xsl:variable>
                          <xsl:element name="w:u">
                              <xsl:attribute name="w:val" select="$underlineType"/>
                              <xsl:if test="not($underlineColor ='')">
                              <xsl:attribute name="w:color">
                              <xsl:call-template name="color">
                                  <xsl:with-param name="colorName" select="$underlineColor"/>
                              </xsl:call-template>
                              </xsl:attribute>
                                  
                                  
                              </xsl:if>
                              <xsl:if test="@UnderlineOffset">
                                  <xsl:attribute name="w:UnderlineOffset" select="@UnderlineOffset"/>                                      
                              </xsl:if>
                              <xsl:if test="@UnderlineTint">
                                  <xsl:attribute name="w:UnderlineTint" select="@UnderlineTint"/>                                      
                              </xsl:if>
                              <xsl:if test="@UnderlineWeight">
                                  <xsl:attribute name="w:UnderlineWeight" select="@UnderlineWeight"/>                                      
                              </xsl:if>
                          </xsl:element>
                      </xsl:if>
                      
                      <xsl:if test="@Underline ='false'">
                          <xsl:element name="w:u">
                              <xsl:attribute name="w:val" select="'none'"/>
                          </xsl:element>
                      </xsl:if>
                      
                      
                      <xsl:if test="@Position">
                          <xsl:if test="contains(@Position,'Superscript')">
                              <xsl:element name="w:vertAlign">
                                  <xsl:attribute name="w:val" select="'superscript'"/>
                              </xsl:element>
                          </xsl:if>
                          <xsl:if test="contains(@Position,'Subscript')">
                              <xsl:element name="w:vertAlign">
                                  <xsl:attribute name="w:val" select="'subscript'"/>
                              </xsl:element>
                          </xsl:if>
                      </xsl:if>
                      
                   <!--   <xsl:if test="@Ligatures">
                          <xsl:if test="@Ligatures = 'true'">
                              <xsl:element name="w14:ligatures">
                                  <xsl:attribute name="w:val" select="'all'"/>
                              </xsl:element>
                          </xsl:if>
                      </xsl:if>-->
                      
                      
                  </xsl:element>
              </xsl:if>
              
    
                    </xsl:element>
    </xsl:template>
    
    <!-- **************************************Converting hexdecimal value to numbers***********************************************-->
    <xsl:template name="hex2num">
        <xsl:param name="hex"/>
        <xsl:param name="num" select="0"/>
        <xsl:param name="MSB" select="translate(substring($hex, 1, 1), 'abcdef', 'ABCDEF')"/>
        <xsl:param name="value" select="string-length(substring-before('0123456789ABCDEF', $MSB))"/>
        <xsl:param name="result" select="16 * $num + $value"/>
        <xsl:choose>
            <xsl:when test="string-length($hex) > 1">
                <xsl:call-template name="hex2num">
                    <xsl:with-param name="hex" select="substring($hex, 2)"/>
                    <xsl:with-param name="num" select="$result"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$result"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
        
    <xsl:template match="RootParagraphStyleGroup">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="ParagraphStyle">
        <xsl:variable name="Na1">
            <xsl:choose>
                <xsl:when test="contains(@Name,'$ID/')">
                    <xsl:value-of select="substring-after(@Name,'$ID/')"/>
                </xsl:when>
                <xsl:when test="contains(@Name,'ParagraphStyle/')">
                    <xsl:value-of select="substring-after(@Name,'ParagraphStyle/')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="@Name"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="FS1" select="@PointSize"/>
        <xsl:variable name="JC" select="@Justification"/>
        <xsl:variable name="FLI" select="@FirstLineIndent"/>
        <xsl:variable name="LI" select="@LeftIndent"/>
        <xsl:variable name="RI" select="@RightIndent"/>
        <xsl:variable name="SB4" select="@SpaceBefore"/>
        <xsl:variable name="SAF" select="@SpaceAfter"/>
        <xsl:variable name="C" select="@Capitalization"/>
        <xsl:variable name="LS" select="Properties/Leading"/>
        <xsl:variable name="ListID">
            <xsl:number level="any"/>
        </xsl:variable>
        <xsl:variable name="NumberingLvl">
             <xsl:choose>
                <!--<xsl:when test="not(./@NumberingLevel)">
                    <xsl:value-of select="'0'"/>
                </xsl:when>-->
                 <xsl:when test="@NumberingLevel">
                    <xsl:value-of select="number(./@NumberingLevel) - 1"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="NumberingStat" select="@NumberingStartAt"/>
        <xsl:variable name="NumberingCont" select="@NumberingExpression"/>
        
        <xsl:element name="w:style">
            <xsl:attribute name="w:type" select="'paragraph'"/>
            <xsl:attribute name="w:customStyle" select="'1'"/>
         
            <xsl:attribute name="w:styleId">
                <xsl:variable name="styleId" select="@pStyleID"/>
                <xsl:choose>
                    <xsl:when test="not(string-length($styleId) = 0)">
                        <xsl:value-of select="$styleId"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:choose>
                            <xsl:when test="contains($Na1,'\')">
                                <xsl:value-of select="replace($Na1,'\\','')"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="$Na1"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>
           <!-- <xsl:choose>
                <xsl:when test="contains($Na1,'\')">
                    <xsl:value-of select="replace($Na1,'\\','')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$Na1"/>
                </xsl:otherwise>
            </xsl:choose>-->
            
            </xsl:attribute>
            
        <xsl:element name="w:name">
            <xsl:choose>
                <xsl:when test="contains($Na1,'\')">
                    <xsl:attribute name="w:val" select="replace($Na1,'\\','')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="w:val" select="$Na1"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:element>
                
               
            <xsl:if test="Properties">
                
                <xsl:if test="Properties/BasedOn">
                    <xsl:variable name="bo">
                        <xsl:choose>
                            <xsl:when test="contains(Properties/BasedOn,'$ID/')">
                                <xsl:value-of select="substring-after(Properties/BasedOn,'$ID/')"/>
                            </xsl:when>
                            <xsl:when test="contains(Properties/BasedOn,'ParagraphStyle/')">
                                <xsl:value-of select="substring-after(Properties/BasedOn,'ParagraphStyle/')"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="Properties/BasedOn"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <xsl:element name="w:basedOn">
                        <!--                                        new update 28.9.2016-->
                        <xsl:variable name="styleName" select="substring-after(Properties/BasedOn,'ParagraphStyle/')"/>
                        
                        <xsl:choose>
                            <xsl:when test="matches($bo,'[\W\s]')">
                                <xsl:variable name="styleId">
                                    <xsl:for-each select="//ParagraphStyle[@Name = $styleName]">
<!--                                        <xsl:if test="@Name = $styleName">-->
                                            <xsl:value-of select="@pStyleID"/>
                                        <!--</xsl:if>-->
                                    </xsl:for-each>    
                                </xsl:variable>
                                
                                <xsl:choose>
                                    <xsl:when test="not(string-length($styleId) = 0)">
                                        <xsl:attribute name="w:val" select="$styleId"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:choose>
                                            <xsl:when test="contains($bo,'%3a')">
                                                <xsl:variable name="Pf" select="replace($bo,'%3a',':')"></xsl:variable>
                                                <xsl:attribute name="w:val" select="$Pf"/> 
                                            </xsl:when>
                                            <xsl:when test="contains($bo,'\')">
                                                <xsl:attribute name="w:val" select="replace($bo,'\\','')"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:attribute name="w:val" select="$bo"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:attribute name="w:val" select="$bo"/>
                            </xsl:otherwise>
                        </xsl:choose>
                       <!-- <xsl:choose>
                            <xsl:when test="contains($bo,'%3a')">
                                <xsl:variable name="Pf" select="replace($bo,'%3a',':')"></xsl:variable>
                                <xsl:attribute name="w:val" select="$Pf"/> 
                            </xsl:when>
                            <xsl:when test="contains($bo,'\')">
                                <xsl:attribute name="w:val" select="replace($bo,'\\','')"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:attribute name="w:val" select="$bo"/>
                            </xsl:otherwise>
                        </xsl:choose>-->
                        
                    </xsl:element>
                </xsl:if>
                
            </xsl:if>
            
            <xsl:if test="@PCLink">
                <xsl:variable name="LinkName" select="@PCLink"/>
                <xsl:element name="w:link">
                    <!--<xsl:attribute name="w:val" select="normalize-space($Na)"/>-->
                    <xsl:variable name="OrgName1">   
                        <xsl:choose>
                            <xsl:when test="contains($Na1,'\')">
                                <xsl:value-of select="replace($Na1,'\\','')"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="$Na1"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    
                    <xsl:attribute name="w:val">
                        <xsl:value-of select="concat($OrgName1,$LinkName)"/>
                    </xsl:attribute>
                    
                </xsl:element>
            </xsl:if>

            <xsl:element name="w:qFormat"/>
            <xsl:element name="w:pPr">                
                <xsl:apply-templates select="child::Properties/TabList" mode="tabs"/>
                <!--@@@@@@@@@@@@@@@@@@@@@@@@ Keep with next start @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                <xsl:if test="@KeepWithNext">
                    <xsl:if test="not(@KeepWithNext = '0')">
                        <xsl:element name="w:keepNext"/>
                    </xsl:if>
                </xsl:if>
                <!--@@@@@@@@@@@@@@@@@@@@@@@@ Keep with next end @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                
                <xsl:if test="@BulletsAndNumberingListType or child::Properties/BulletChar">
<!--                    <xsl:if test="not(@BulletsAndNumberingListType = 'NoList')or (child::Properties/BulletChar and not(@BulletsAndNumberingListType ='NumberedList'or @BulletsAndNumberingListType ='NoList'))">-->
                    <xsl:if test="(@BulletsAndNumberingListType = 'NumberedList' and not(@NumberingStartAt = 0)and not(string-length(@NumberingExpression) = 0)) or (@BulletsAndNumberingListType ='BulletList')or (child::Properties/BulletChar and not(@BulletsAndNumberingListType ='NumberedList'or @BulletsAndNumberingListType ='NoList'))">
<!--                        <xsl:if test="not(@ManualNumberRestart)"></xsl:if>-->
                        <xsl:element name="w:numPr">
                            <xsl:element name="w:numId">
                                <xsl:attribute name="w:val">
                                    <xsl:value-of select="$ListID"/>
                                </xsl:attribute>
                            </xsl:element>
                        </xsl:element>
                    </xsl:if>
                </xsl:if>
               
           <!--@@@@@@@@@@@@@@@@@@@@@@@@ Spacing Start @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->    
                <xsl:element name="w:spacing">
                    
                    <xsl:if test="self::ParagraphStyle/@SpaceBefore">
                        <!--<xsl:attribute name="w:before" select="$SB4 * 20"/>-->
                        <xsl:attribute name="w:before" select="round($SB4 * 20)"/>
                    </xsl:if>
                    <xsl:if test="self::ParagraphStyle/@SpaceAfter">
                        <!--<xsl:attribute name="w:after" select="$SAF * 20"/>-->
                        <xsl:attribute name="w:after" select="round($SAF * 20)"/>
                    </xsl:if>
                    <xsl:if test="self::ParagraphStyle/Properties/Leading">
                        <xsl:if test="$LS = 'Auto'">
                            <xsl:attribute name="w:line" select="12 * 20"/>
                            <xsl:attribute name="w:lineRule" select="'atLeast'"/>
                        </xsl:if>
                        <xsl:if test="not($LS = 'Auto')">
                            <!--<xsl:attribute name="w:line" select="$LS * 20"/>-->
                            <xsl:attribute name="w:line" select="round($LS * 20)"/>
                            <xsl:attribute name="w:lineRule" select="'atLeast'"/>
                        </xsl:if>
                    </xsl:if>
                </xsl:element>
           <!--@@@@@@@@@@@@@@@@@@@@@@@@ Spacing End @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                
            <!--@@@@@@@@@@@@@@@@@@@@@@@@ Indent Start @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                <xsl:element name="w:ind">
                <xsl:if test="self::ParagraphStyle/@FirstLineIndent">
                    <xsl:if test="not($FLI &lt; 0)">
                        <!--<xsl:attribute name="w:firstLine" select="$FLI * 20"/>-->
                        <xsl:attribute name="w:firstLine" select="round($FLI * 20)"/>
                    </xsl:if>
                    <xsl:if test="($FLI &lt; 0)">
                        <xsl:variable name="FLI1" select="$FLI * -1"/>
                            <!--<xsl:attribute name="w:hanging" select="$FLI1 * 20"/>-->
                        <xsl:attribute name="w:hanging" select="round($FLI1 * 20)"/>
                    </xsl:if>
                </xsl:if>
                    
                    <xsl:if test="self::ParagraphStyle/@LeftIndent">
                        <!--<xsl:attribute name="w:left" select="$LI * 20"/>-->
                        <xsl:attribute name="w:left" select="round($LI * 20)"/>
                    </xsl:if>
                    
                    <xsl:if test="self::ParagraphStyle/@RightIndent">
                        <!--<xsl:attribute name="w:right" select="$RI * 20"/>-->
                        <xsl:attribute name="w:right" select="round($RI * 20)"/>
                    </xsl:if>
                </xsl:element>
          <!--@@@@@@@@@@@@@@@@@@@@@@@@ Indent End @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                
          <!--@@@@@@@@@@@@@@@@@@@@@@@@ Justification Start @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                <xsl:if test="self::ParagraphStyle/@Justification">
                    <xsl:if test="contains($JC,'LeftJustified') or contains($JC,'FullyJustified') or contains($JC,'CenterJustified') or contains($JC,'RightJustified')">
                        <xsl:element name="w:jc">
                            <xsl:attribute name="w:val" select="'both'"/>
                        </xsl:element>
                    </xsl:if>
                    <xsl:if test="contains($JC,'CenterAlign')">
                        <xsl:element name="w:jc">
                            <xsl:attribute name="w:val" select="'center'"/>
                        </xsl:element>
                    </xsl:if>
                    <xsl:if test="contains($JC,'RightAlign')">
                        <xsl:element name="w:jc">
                            <xsl:attribute name="w:val" select="'right'"/>
                        </xsl:element>
                    </xsl:if>
                </xsl:if>
          <!--@@@@@@@@@@@@@@@@@@@@@@@@ Justification End @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                
            <!--  level of the style using the numbering level property of the style in indesign             -->
            <xsl:if test="@NumberingLevel">
                <xsl:element name="w:outlineLvl">
                    <xsl:attribute name="w:val" select="$NumberingLvl"/>
                </xsl:element>
            </xsl:if>   
            <!--  level of the style using the numbering level property of the style in indesign             -->
                
                
          <!--@@@@@@@@@@@@@@@@@@@@@@@@ Keep with next start @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
        <!--  <xsl:if test="@KeepLinesTogether = 'true'">
              <xsl:element name="w:keepLines"/>
          </xsl:if> -->
         <!--@@@@@@@@@@@@@@@@@@@@@@@@ Keep with next end @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                
            </xsl:element> 
            
            <xsl:if test="Properties">
                <xsl:element name="w:rPr">
                <xsl:if test="Properties/AppliedFont">
                <xsl:element name="w:rFonts">
                    <xsl:attribute name="w:ascii" select="Properties/AppliedFont"/>
                    <xsl:attribute name="w:hAnsi" select="Properties/AppliedFont"/>
                </xsl:element>
                </xsl:if>
<!--                    <xsl:if test="contains(@FontStyle,'Black') or contains(@FontStyle,'Bold') or contains(@FontStyle,'Strong') or contains(@FontStyle,'black') or contains(@FontStyle,'bold') or contains(@FontStyle,'strong') or contains(@FontStyle,'Extra') or contains(@FontStyle,'extra') or contains(@FontStyle,'Heavy') or contains(@FontStyle,'heavy') ">-->
                    <xsl:if test="contains(lower-case(@FontStyle),'mediXum') or contains(lower-case(@FontStyle),'black') or contains(lower-case(@FontStyle),'bold') or contains(lower-case(@FontStyle),'strong') or contains(lower-case(@FontStyle),'demi') or contains(lower-case(@FontStyle),'extra') or contains(lower-case(@FontStyle),'heavy') ">
                        <xsl:element name="w:b"/>
                    </xsl:if>
                    <xsl:if test="contains(lower-case(@FontStyle),'italic') or contains(lower-case(@FontStyle),'oblique')">
                        <xsl:element name="w:i"/>
                    </xsl:if>
                    <xsl:if test="contains(lower-case(@FontStyle),'regular') or contains(lower-case(@FontStyle),'roman')">
                        <xsl:element name="w:b">
                            <xsl:attribute name="w:val" select="'0'"/>
                        </xsl:element>
                        <xsl:element name="w:i">
                            <xsl:attribute name="w:val" select="'0'"/>
                        </xsl:element>
                    </xsl:if>
                    <xsl:if test="@Capitalization">
                        <xsl:if test="contains($C,'SmallCaps')">
                            <xsl:element name="w:smallCaps"/>
                        </xsl:if>
                        <xsl:if test="contains($C,'AllCaps')">
                            <xsl:element name="w:caps"/>
                        </xsl:if>
                        <xsl:if test="contains($C,'Normal')">
                            <xsl:element name="w:caps">
                                <xsl:attribute name="w:val" select="'0'"/>
                            </xsl:element>
                        </xsl:if>
                    </xsl:if>
                    <xsl:if test="@StrikeThru = 'true'">
                        <xsl:element name="w:strike"/>
                    </xsl:if>
                    <!--*********************Font Color****************************************************************-->
                    <!--<xsl:if test="self::CharacterStyleRange/@FillColor">-->
                        <xsl:variable name="FC">
                            <xsl:variable name="color" select="@FillColor"/>
                            <xsl:call-template name="color">
                                <xsl:with-param name="colorName" select="$color"/>
                            </xsl:call-template>
                        </xsl:variable>
                        <xsl:if test="string-length($FC) &gt; 0">
                            <xsl:element name="w:color">
                                <xsl:attribute name="w:val">
                                    <xsl:value-of select="$FC"/>
                                </xsl:attribute>
                            </xsl:element> 
                        </xsl:if>
                    <!--</xsl:if>-->
                    <!--*********************Font Color****************************************************************--> 
                    <xsl:if test="self::ParagraphStyle/@PointSize">
                        <xsl:element name="w:sz">
                            <!--<xsl:attribute name="w:val" select="$FS1 * 2"/>-->
                            <xsl:attribute name="w:val" select="round($FS1 * 2)"/>
                        </xsl:element>
                    </xsl:if>
                    
                    <xsl:if test="@Underline ='true'">
                        <xsl:variable name="underlineColor">
                            <xsl:if test="Properties/UnderlineColor">
                                <xsl:value-of select="Properties/UnderlineColor"/>
                            </xsl:if>
                        </xsl:variable>
                        <xsl:variable name="underlineType">
                            <xsl:variable name="type">
                                <xsl:if test="Properties/UnderlineType">
                                    <xsl:value-of select="Properties/UnderlineType"/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:choose>
                                <xsl:when test="contains(lower-case($type),'dash')">
                                    <xsl:value-of select="'dash'"/>
                                </xsl:when>
                                <xsl:when test="contains(lower-case($type),'dot')">
                                    <xsl:value-of select="'dotDash'"/>
                                </xsl:when>
                                <xsl:when test="contains(lower-case($type),'wavy')">
                                    <xsl:value-of select="'wave'"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="'words'"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                        <xsl:element name="w:u">
                            <xsl:attribute name="w:val" select="$underlineType"/>
                            <xsl:if test="not($underlineColor ='')">
                                <xsl:attribute name="w:color">
                                    <xsl:call-template name="color">
                                        <xsl:with-param name="colorName" select="$underlineColor"/>
                                    </xsl:call-template>
                                </xsl:attribute>
                            </xsl:if>
                        </xsl:element>
                    </xsl:if>
                    
                    <xsl:if test="@Underline ='false'">
                        <xsl:element name="w:u">
                            <xsl:attribute name="w:val" select="'none'"/>
                        </xsl:element>
                    </xsl:if>
                    
                    <xsl:if test="@Position">
                        <xsl:if test="@Position = 'Superscript'">
                            <xsl:element name="w:vertAlign">
                                <xsl:attribute name="w:val" select="'superscript'"/>
                            </xsl:element>
                        </xsl:if>
                        <xsl:if test="@Position = 'Subscript'">
                            <xsl:element name="w:vertAlign">
                                <xsl:attribute name="w:val" select="'subscript'"/>
                            </xsl:element>
                        </xsl:if>
                    </xsl:if>
                    
                    <!-- <xsl:if test="@Ligatures">
                        <xsl:if test="@Ligatures = 'true'">
                            <xsl:element name="w14:ligatures">
                                <xsl:attribute name="w:val" select="'all'"/>
                            </xsl:element>
                        </xsl:if>
                    </xsl:if>-->
                    
                </xsl:element>
            </xsl:if>
            
        </xsl:element>
    </xsl:template>
    
    
    <xsl:template match="TabList" mode="tabs">        
        <xsl:element name="w:tabs">
            <xsl:apply-templates mode="tabs"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="ListItem[ancestor::*[1]/name() ='TabList']" mode="tabs">
        <xsl:variable name="alignment">
            <xsl:choose>
                <xsl:when test="descendant::Alignment = 'LeftAlign'">
                    <xsl:value-of select="'left'"/>
                </xsl:when>
                <xsl:when test="descendant::Alignment = 'RightAlign'">
                    <xsl:value-of select="'right'"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="'left'"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="position">
            <xsl:variable name="pos" select="descendant::Position"/>
            <xsl:choose>
                <xsl:when test="string-length($pos) &gt; 0">
                    <xsl:value-of select="number($pos) * 20"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="0"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        
        <xsl:element name="w:tab">
            <xsl:attribute name="w:val" select="$alignment"/>
            <xsl:attribute name="w:pos" select="$position"/>
            <xsl:attribute name="w:pos" select="$position"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="color">
        <xsl:param name="colorName"/>
        <xsl:for-each select="$Graphic//Color[@Self eq $colorName]">
           <!-- <xsl:choose>
                <xsl:when test="./@Self eq $colorName">-->
                    <xsl:if test="./@Space eq 'CMYK'">
                    <xsl:variable name="CMYK" as="xs:string*" select="tokenize(./@ColorValue,' ')"/>
                    <xsl:variable name="C" select="number($CMYK[1])"/>
                    <xsl:variable name="M" select="number($CMYK[2])"/>
                    <xsl:variable name="Y" select="number($CMYK[3])"/>
                    <xsl:variable name="K" select="number($CMYK[4])"/>
                    <xsl:variable name="Cdiv" select="$C div 100"/>
                    <xsl:variable name="Mdiv" select="$M div 100"/>
                    <xsl:variable name="Ydiv" select="$Y div 100"/>
                    <xsl:variable name="Kdiv" select="$K div 100"/>
                    <xsl:variable name="R" select="(255 * (1-$Cdiv) * (1-$Kdiv)) div 16"/>
                    <xsl:variable name="G" select="(255 * (1-$Mdiv) * (1-$Kdiv)) div 16"/>
                    <xsl:variable name="B" select="(255 * (1-$Ydiv) * (1-$Kdiv)) div 16"/>
                    <xsl:variable name="R1">
                        <xsl:variable name="hex-digit1" select="substring($hex,floor((255 * (1-$Cdiv) * (1-$Kdiv))  div 16) + 1,1)"/>
                        <xsl:variable name="hex-digit2" select="substring($hex,(255 * (1-$Cdiv) * (1-$Kdiv))  mod 16 + 1,1)"/>
                        <xsl:value-of select="concat($hex-digit1,$hex-digit2)"/>
                    </xsl:variable>
                    <xsl:variable name="G1">
                        <xsl:variable name="hex-digit1" select="substring($hex,floor((255 * (1-$Mdiv) * (1-$Kdiv))  div 16) + 1,1)"/>
                        <xsl:variable name="hex-digit2" select="substring($hex,(255 * (1-$Mdiv) * (1-$Kdiv))  mod 16 + 1,1)"/>
                        <xsl:value-of select="concat($hex-digit1,$hex-digit2)"/>
                    </xsl:variable>
                    <xsl:variable name="B1">
                        <xsl:variable name="hex-digit1" select="substring($hex,floor((255 * (1-$Ydiv) * (1-$Kdiv))  div 16) + 1,1)"/>
                        <xsl:variable name="hex-digit2" select="substring($hex,(255 * (1-$Ydiv) * (1-$Kdiv))  mod 16 + 1,1)"/>
                        <xsl:value-of select="concat($hex-digit1,$hex-digit2)"/>
                    </xsl:variable>
                    <xsl:variable name="Rhex">
                        <xsl:variable name="Rstr" select="$R cast as xs:string"></xsl:variable>
                        <xsl:choose>
                            <xsl:when test="contains($Rstr,'.')">
                                <xsl:variable name="Rstr1" >
                                    <xsl:choose>
                                        <xsl:when test="((substring-before($Rstr,'.')) cast as xs:decimal) &lt;= 9">
                                            <xsl:value-of select="(substring-before($Rstr,'.'))"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Rstr,'.')) cast as xs:decimal) = 10">
                                            <xsl:value-of select="'A'"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Rstr,'.')) cast as xs:decimal) = 11">
                                            <xsl:value-of select="'B'"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Rstr,'.')) cast as xs:decimal) = 12">
                                            <xsl:value-of select="'C'"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Rstr,'.')) cast as xs:decimal) = 13">
                                            <xsl:value-of select="'D'"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Rstr,'.')) cast as xs:decimal) = 14">
                                            <xsl:value-of select="'E'"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Rstr,'.')) cast as xs:decimal) = 15">
                                            <xsl:value-of select="'F'"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:variable name="Rstr2" select="number(concat('0.',(substring-after($Rstr,'.'))))"/>
                                <xsl:variable name="Rstr3" >
                                    <xsl:variable name="Rstr4" select="round($Rstr2 * 16)"/>
                                    <xsl:choose>
                                        <xsl:when test="$Rstr4 &lt;= 9">
                                            <xsl:value-of select="$Rstr4"/>
                                        </xsl:when>
                                        <xsl:when test="$Rstr4 = 10">
                                            <xsl:value-of select="'A'"/>
                                        </xsl:when>
                                        <xsl:when test="$Rstr4 = 11">
                                            <xsl:value-of select="'B'"/>
                                        </xsl:when>
                                        <xsl:when test="$Rstr4 = 12">
                                            <xsl:value-of select="'C'"/>
                                        </xsl:when>
                                        <xsl:when test="$Rstr4 = 13">
                                            <xsl:value-of select="'D'"/>
                                        </xsl:when>
                                        <xsl:when test="$Rstr4 = 14">
                                            <xsl:value-of select="'E'"/>
                                        </xsl:when>
                                        <xsl:when test="$Rstr4 = 15">
                                            <xsl:value-of select="'F'"/>
                                        </xsl:when>
                                        <xsl:when test="$Rstr4 = 16">
                                            <xsl:value-of select="'16'"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:variable name="Rfin">
                                    <xsl:choose>
                                        <xsl:when test="$Rstr3 eq '16'">
                                            <xsl:variable name="ad">
                                                <xsl:choose>
                                                    <xsl:when test="$Rstr1 = 'A'">
                                                        <xsl:value-of select="10 + 1"/>
                                                    </xsl:when>
                                                    <xsl:when test="$Rstr1 = 'B'">
                                                        <xsl:value-of select="11 + 1"/>
                                                    </xsl:when>
                                                    <xsl:when test="$Rstr1 = 'C'">
                                                        <xsl:value-of select="12 + 1"/>
                                                    </xsl:when>
                                                    <xsl:when test="$Rstr1 = 'D'">
                                                        <xsl:value-of select="13 + 1"/>
                                                    </xsl:when>
                                                    <xsl:when test="$Rstr1 = 'E'">
                                                        <xsl:value-of select="14 + 1"/>
                                                    </xsl:when>
                                                    <xsl:when test="$Rstr1 = 'F'">
                                                        <xsl:value-of select="'F'"/>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:value-of select="$Rstr1 + 1"/>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:variable>
                                            <xsl:variable name="Rstr6" >
                                                <xsl:choose>
                                                    <xsl:when test="$ad&lt;= 9">
                                                        <xsl:value-of select="$ad"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 10">
                                                        <xsl:value-of select="'A'"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 11">
                                                        <xsl:value-of select="'B'"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 12">
                                                        <xsl:value-of select="'C'"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 13">
                                                        <xsl:value-of select="'D'"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 14">
                                                        <xsl:value-of select="'E'"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 15">
                                                        <xsl:value-of select="'F'"/>
                                                    </xsl:when>
                                                </xsl:choose>
                                            </xsl:variable>
                                        <xsl:value-of select="$Rstr6"/>
                                        <xsl:value-of select="'0'"/>
                                        </xsl:when>
                                        <xsl:otherwise> 
                                            <xsl:value-of select="$Rstr1"/>
                                            <xsl:value-of select="$Rstr3"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:variable>
                               <xsl:value-of select="$Rfin"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:variable name="Rstr5">
                                    <xsl:choose>
                                        <xsl:when test="($Rstr cast as xs:decimal) &lt;= 9">
                                            <xsl:value-of select="concat('0',$Rstr)"/>
                                        </xsl:when>
                                        <xsl:when test="($Rstr cast as xs:decimal) = 10">
                                            <xsl:value-of select="'0A'"/>
                                        </xsl:when>
                                        <xsl:when test="($Rstr cast as xs:decimal) = 11">
                                            <xsl:value-of select="'0B'"/>
                                        </xsl:when>
                                        <xsl:when test="($Rstr cast as xs:decimal) = 12">
                                            <xsl:value-of select="'0C'"/>
                                        </xsl:when>
                                        <xsl:when test="($Rstr cast as xs:decimal) = 13">
                                            <xsl:value-of select="'0D'"/>
                                        </xsl:when>
                                        <xsl:when test="($Rstr cast as xs:decimal) = 14">
                                            <xsl:value-of select="'0E'"/>
                                        </xsl:when>
                                        <xsl:when test="($Rstr cast as xs:decimal) = 15">
                                            <xsl:value-of select="'0F'"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:value-of select="$Rstr5"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <xsl:variable name="Ghex">
                        <xsl:variable name="Gstr" select="$G cast as xs:string"></xsl:variable>
                        <xsl:choose>
                            <xsl:when test="contains($Gstr,'.')">
                                <xsl:variable name="Gstr1" >
                                    <xsl:choose>
                                        <xsl:when test="((substring-before($Gstr,'.')) cast as xs:decimal) &lt;= 9">
                                            <xsl:value-of select="(substring-before($Gstr,'.'))"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Gstr,'.')) cast as xs:decimal) = 10">
                                            <xsl:value-of select="'A'"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Gstr,'.')) cast as xs:decimal) = 11">
                                            <xsl:value-of select="'B'"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Gstr,'.')) cast as xs:decimal) = 12">
                                            <xsl:value-of select="'C'"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Gstr,'.')) cast as xs:decimal) = 13">
                                            <xsl:value-of select="'D'"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Gstr,'.')) cast as xs:decimal) = 14">
                                            <xsl:value-of select="'E'"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Gstr,'.')) cast as xs:decimal) = 15">
                                            <xsl:value-of select="'F'"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:variable name="Gstr2" select="number(concat('0.',(substring-after($Gstr,'.'))))"/>
                                <xsl:variable name="Gstr3" >
                                    <xsl:variable name="Gstr4" select="round($Gstr2 * 16)"></xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$Gstr4 &lt;= 9">
                                            <xsl:value-of select="$Gstr4"/>
                                        </xsl:when>
                                        <xsl:when test="$Gstr4 = 10">
                                            <xsl:value-of select="'A'"/>
                                        </xsl:when>
                                        <xsl:when test="$Gstr4 = 11">
                                            <xsl:value-of select="'B'"/>
                                        </xsl:when>
                                        <xsl:when test="$Gstr4 = 12">
                                            <xsl:value-of select="'C'"/>
                                        </xsl:when>
                                        <xsl:when test="$Gstr4 = 13">
                                            <xsl:value-of select="'D'"/>
                                        </xsl:when>
                                        <xsl:when test="$Gstr4 = 14">
                                            <xsl:value-of select="'E'"/>
                                        </xsl:when>
                                        <xsl:when test="$Gstr4 = 15">
                                            <xsl:value-of select="'F'"/>
                                        </xsl:when>
                                        <xsl:when test="$Gstr4 = 16">
                                            <xsl:value-of select="'16'"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:variable name="Gfin">
                                    <xsl:choose>
                                        <xsl:when test="$Gstr3 eq '16'">
                                            <xsl:variable name="ad">
                                                <xsl:choose>
                                                    <xsl:when test="$Gstr1 = 'A'">
                                                        <xsl:value-of select="10 + 1"/>
                                                    </xsl:when>
                                                    <xsl:when test="$Gstr1 = 'B'">
                                                        <xsl:value-of select="11 + 1"/>
                                                    </xsl:when>
                                                    <xsl:when test="$Gstr1 = 'C'">
                                                        <xsl:value-of select="12 + 1"/>
                                                    </xsl:when>
                                                    <xsl:when test="$Gstr1 = 'D'">
                                                        <xsl:value-of select="13 + 1"/>
                                                    </xsl:when>
                                                    <xsl:when test="$Gstr1 = 'E'">
                                                        <xsl:value-of select="14 + 1"/>
                                                    </xsl:when>
                                                    <xsl:when test="$Gstr1 = 'F'">
                                                        <xsl:value-of select="'F'"/>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:value-of select="$Gstr1 + 1"/>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:variable>
                                            <xsl:variable name="Gstr6" >
                                                <xsl:choose>
                                                    <xsl:when test="$ad&lt;= 9">
                                                        <xsl:value-of select="$ad"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 10">
                                                        <xsl:value-of select="'A'"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 11">
                                                        <xsl:value-of select="'B'"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 12">
                                                        <xsl:value-of select="'C'"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 13">
                                                        <xsl:value-of select="'D'"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 14">
                                                        <xsl:value-of select="'E'"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 15">
                                                        <xsl:value-of select="'F'"/>
                                                    </xsl:when>
                                                </xsl:choose>
                                            </xsl:variable>
                                            <xsl:value-of select="$Gstr6"/>
                                            <xsl:value-of select="'0'"/>
                                        </xsl:when>
                                        <xsl:otherwise> 
                                            <xsl:value-of select="$Gstr1"/>
                                            <xsl:value-of select="$Gstr3"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:value-of select="$Gfin"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:variable name="Gstr5">
                                    <xsl:choose>
                                        <xsl:when test="($Gstr cast as xs:decimal) &lt;= 9">
                                            <xsl:value-of select="concat('0',$Gstr)"/>
                                        </xsl:when>
                                        <xsl:when test="($Gstr cast as xs:decimal) = 10">
                                            <xsl:value-of select="'0A'"/>
                                        </xsl:when>
                                        <xsl:when test="($Gstr cast as xs:decimal) = 11">
                                            <xsl:value-of select="'0B'"/>
                                        </xsl:when>
                                        <xsl:when test="($Gstr cast as xs:decimal) = 12">
                                            <xsl:value-of select="'0C'"/>
                                        </xsl:when>
                                        <xsl:when test="($Gstr cast as xs:decimal) = 13">
                                            <xsl:value-of select="'0D'"/>
                                        </xsl:when>
                                        <xsl:when test="($Gstr cast as xs:decimal) = 14">
                                            <xsl:value-of select="'0E'"/>
                                        </xsl:when>
                                        <xsl:when test="($Gstr cast as xs:decimal) = 15">
                                            <xsl:value-of select="'0F'"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:value-of select="$Gstr5"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <xsl:variable name="Bhex">
                        <xsl:variable name="Bstr" select="$B cast as xs:string"></xsl:variable>
                        <xsl:choose>
                            <xsl:when test="contains($Bstr,'.')">
                                <xsl:variable name="Bstr1" >
                                    <xsl:choose>
                                        <xsl:when test="((substring-before($Bstr,'.')) cast as xs:decimal) &lt;= 9">
                                            <xsl:value-of select="(substring-before($Bstr,'.'))"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Bstr,'.')) cast as xs:decimal) = 10">
                                            <xsl:value-of select="'A'"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Bstr,'.')) cast as xs:decimal) = 11">
                                            <xsl:value-of select="'B'"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Bstr,'.')) cast as xs:decimal) = 12">
                                            <xsl:value-of select="'C'"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Bstr,'.')) cast as xs:decimal) = 13">
                                            <xsl:value-of select="'D'"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Bstr,'.')) cast as xs:decimal) = 14">
                                            <xsl:value-of select="'E'"/>
                                        </xsl:when>
                                        <xsl:when test="((substring-before($Bstr,'.')) cast as xs:decimal) = 15">
                                            <xsl:value-of select="'F'"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:variable name="Bstr2" select="number(concat('0.',(substring-after($Bstr,'.'))))"/>
                                <xsl:variable name="Bstr3" >
                                    <xsl:variable name="Bstr4" select="round($Bstr2 * 16)"></xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$Bstr4 &lt;= 9">
                                            <xsl:value-of select="$Bstr4"/>
                                        </xsl:when>
                                        <xsl:when test="$Bstr4 = 10">
                                            <xsl:value-of select="'A'"/>
                                        </xsl:when>
                                        <xsl:when test="$Bstr4 = 11">
                                            <xsl:value-of select="'B'"/>
                                        </xsl:when>
                                        <xsl:when test="$Bstr4 = 12">
                                            <xsl:value-of select="'C'"/>
                                        </xsl:when>
                                        <xsl:when test="$Bstr4 = 13">
                                            <xsl:value-of select="'D'"/>
                                        </xsl:when>
                                        <xsl:when test="$Bstr4 = 14">
                                            <xsl:value-of select="'E'"/>
                                        </xsl:when>
                                        <xsl:when test="$Bstr4 = 15">
                                            <xsl:value-of select="'F'"/>
                                        </xsl:when>
                                        <xsl:when test="$Bstr4 = 16">
                                            <xsl:value-of select="'16'"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:variable name="Bfin">
                                    <xsl:choose>
                                        <xsl:when test="$Bstr3 eq '16'">
                                            <xsl:variable name="ad">
                                                <xsl:choose>
                                                    <xsl:when test="$Bstr1 = 'A'">
                                                        <xsl:value-of select="10 + 1"/>
                                                    </xsl:when>
                                                    <xsl:when test="$Bstr1 = 'B'">
                                                        <xsl:value-of select="11 + 1"/>
                                                    </xsl:when>
                                                    <xsl:when test="$Bstr1 = 'C'">
                                                        <xsl:value-of select="12 + 1"/>
                                                    </xsl:when>
                                                    <xsl:when test="$Bstr1 = 'D'">
                                                        <xsl:value-of select="13 + 1"/>
                                                    </xsl:when>
                                                    <xsl:when test="$Bstr1 = 'E'">
                                                        <xsl:value-of select="14 + 1"/>
                                                    </xsl:when>
                                                    <xsl:when test="$Bstr1 = 'F'">
                                                        <xsl:value-of select="'F'"/>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:value-of select="$Bstr1 + 1"/>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:variable>
                                            <xsl:variable name="Bstr6" >
                                                <xsl:choose>
                                                    <xsl:when test="$ad&lt;= 9">
                                                        <xsl:value-of select="$ad"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 10">
                                                        <xsl:value-of select="'A'"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 11">
                                                        <xsl:value-of select="'B'"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 12">
                                                        <xsl:value-of select="'C'"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 13">
                                                        <xsl:value-of select="'D'"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 14">
                                                        <xsl:value-of select="'E'"/>
                                                    </xsl:when>
                                                    <xsl:when test="$ad = 15">
                                                        <xsl:value-of select="'F'"/>
                                                    </xsl:when>
                                                </xsl:choose>
                                            </xsl:variable>
                                            <xsl:value-of select="$Bstr6"/>
                                            <xsl:value-of select="'0'"/>
                                        </xsl:when>
                                        <xsl:otherwise> 
                                            <xsl:value-of select="$Bstr1"/>
                                            <xsl:value-of select="$Bstr3"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:value-of select="$Bfin"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:variable name="Bstr5">
                                    <xsl:choose>
                                        <xsl:when test="($Bstr cast as xs:decimal) &lt;= 9">
                                            <xsl:value-of select="concat('0',$Bstr)"/>
                                        </xsl:when>
                                        <xsl:when test="($Bstr cast as xs:decimal) = 10">
                                            <xsl:value-of select="'0A'"/>
                                        </xsl:when>
                                        <xsl:when test="($Bstr cast as xs:decimal) = 11">
                                            <xsl:value-of select="'0B'"/>
                                        </xsl:when>
                                        <xsl:when test="($Bstr cast as xs:decimal) = 12">
                                            <xsl:value-of select="'0C'"/>
                                        </xsl:when>
                                        <xsl:when test="($Bstr cast as xs:decimal) = 13">
                                            <xsl:value-of select="'0D'"/>
                                        </xsl:when>
                                        <xsl:when test="($Bstr cast as xs:decimal) = 14">
                                            <xsl:value-of select="'0E'"/>
                                        </xsl:when>
                                        <xsl:when test="($Bstr cast as xs:decimal) = 15">
                                            <xsl:value-of select="'0F'"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:value-of select="$Bstr5"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    
                        <xsl:variable name="RInteger">
                            <xsl:call-template name="hex2num">
                                <xsl:with-param name="hex" select="$Rhex"/>
                            </xsl:call-template>
                        </xsl:variable>
                        <xsl:variable name="GInteger">
                            <xsl:call-template name="hex2num">
                                <xsl:with-param name="hex" select="$Ghex"/>
                            </xsl:call-template>
                        </xsl:variable>
                        <xsl:variable name="BInteger">
                            <xsl:call-template name="hex2num">
                                <xsl:with-param name="hex" select="$Bhex"/>
                            </xsl:call-template>
                        </xsl:variable>
                        
                        
                        <xsl:choose>
                            <!--   Checking whether the color value is white -->
                            <xsl:when test="($RInteger &gt; 229 and $RInteger &lt;= 255) and ($GInteger &gt; 229 and $GInteger &lt;= 255) and ($BInteger &gt; 229 and $BInteger &lt;= 255) ">                               
                                <!--<xsl:value-of select="'000000'"/>-->
                                <xsl:value-of select="'00,00,00'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <!--<xsl:element name="w:color">
                                    <xsl:attribute name="w:val" select="concat($Rhex,$Ghex,$Bhex)"/>
                                </xsl:element>-->
                                <xsl:value-of select="concat($Rhex,',',$Ghex,',',$Bhex)"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:if>
                    <xsl:if test="./@Space eq 'RGB'">
                    <xsl:variable name="RGB" as="xs:string*" select="tokenize(./@ColorValue,' ')"/>
    
                    <xsl:variable name="R" select="number($RGB[1])"/>
                    <xsl:variable name="G" select="number($RGB[2])"/>
                    <xsl:variable name="B" select="number($RGB[3])"/>
                    
                    <xsl:variable name="R1">
                        <xsl:variable name="hex-digit1" select="substring($hex,floor($R  div 16) + 1,1)"/>
                        <xsl:variable name="hex-digit2" select="substring($hex,$R  mod 16 + 1,1)"/>
                        <xsl:value-of select="concat($hex-digit1,$hex-digit2)"/>
                    </xsl:variable>
                    <xsl:variable name="G1">
                        <xsl:variable name="hex-digit1" select="substring($hex,floor($G  div 16) + 1,1)"/>
                        <xsl:variable name="hex-digit2" select="substring($hex,$G  mod 16 + 1,1)"/>
                        <xsl:value-of select="concat($hex-digit1,$hex-digit2)"/>
                    </xsl:variable>
                    <xsl:variable name="B1">
                        <xsl:variable name="hex-digit1" select="substring($hex,floor($B  div 16) + 1,1)"/>
                        <xsl:variable name="hex-digit2" select="substring($hex,$B  mod 16 + 1,1)"/>
                        <xsl:value-of select="concat($hex-digit1,$hex-digit2)"/>
                    </xsl:variable>
                
                <xsl:variable name="Rhex">
                    <xsl:variable name="Rstr" select="$R cast as xs:string"></xsl:variable>
                    <xsl:choose>
                        <xsl:when test="contains($Rstr,'.')">
                            <xsl:variable name="Rstr1" >
                                <xsl:choose>
                                    <xsl:when test="((substring-before($Rstr,'.')) cast as xs:decimal) &lt;= 9">
                                        <xsl:value-of select="(substring-before($Rstr,'.'))"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Rstr,'.')) cast as xs:decimal) = 10">
                                        <xsl:value-of select="'A'"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Rstr,'.')) cast as xs:decimal) = 11">
                                        <xsl:value-of select="'B'"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Rstr,'.')) cast as xs:decimal) = 12">
                                        <xsl:value-of select="'C'"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Rstr,'.')) cast as xs:decimal) = 13">
                                        <xsl:value-of select="'D'"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Rstr,'.')) cast as xs:decimal) = 14">
                                        <xsl:value-of select="'E'"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Rstr,'.')) cast as xs:decimal) = 15">
                                        <xsl:value-of select="'F'"/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:variable name="Rstr2" select="number(concat('0.',(substring-after($Rstr,'.'))))"/>
                            <xsl:variable name="Rstr3" >
                                <xsl:variable name="Rstr4" select="round($Rstr2 * 16)"/>
                                <xsl:choose>
                                    <xsl:when test="$Rstr4 &lt;= 9">
                                        <xsl:value-of select="$Rstr4"/>
                                    </xsl:when>
                                    <xsl:when test="$Rstr4 = 10">
                                        <xsl:value-of select="'A'"/>
                                    </xsl:when>
                                    <xsl:when test="$Rstr4 = 11">
                                        <xsl:value-of select="'B'"/>
                                    </xsl:when>
                                    <xsl:when test="$Rstr4 = 12">
                                        <xsl:value-of select="'C'"/>
                                    </xsl:when>
                                    <xsl:when test="$Rstr4 = 13">
                                        <xsl:value-of select="'D'"/>
                                    </xsl:when>
                                    <xsl:when test="$Rstr4 = 14">
                                        <xsl:value-of select="'E'"/>
                                    </xsl:when>
                                    <xsl:when test="$Rstr4 = 15">
                                        <xsl:value-of select="'F'"/>
                                    </xsl:when>
                                    <xsl:when test="$Rstr4 = 16">
                                        <xsl:value-of select="'16'"/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:variable name="Rfin">
                                <xsl:choose>
                                    <xsl:when test="$Rstr3 eq '16'">
                                        <xsl:variable name="ad">
                                            <xsl:choose>
                                                <xsl:when test="$Rstr1 = 'A'">
                                                    <xsl:value-of select="10 + 1"/>
                                                </xsl:when>
                                                <xsl:when test="$Rstr1 = 'B'">
                                                    <xsl:value-of select="11 + 1"/>
                                                </xsl:when>
                                                <xsl:when test="$Rstr1 = 'C'">
                                                    <xsl:value-of select="12 + 1"/>
                                                </xsl:when>
                                                <xsl:when test="$Rstr1 = 'D'">
                                                    <xsl:value-of select="13 + 1"/>
                                                </xsl:when>
                                                <xsl:when test="$Rstr1 = 'E'">
                                                    <xsl:value-of select="14 + 1"/>
                                                </xsl:when>
                                                <xsl:when test="$Rstr1 = 'F'">
                                                    <xsl:value-of select="'F'"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="$Rstr1 + 1"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>
                                        <xsl:variable name="Rstr6" >
                                            <xsl:choose>
                                                <xsl:when test="$ad&lt;= 9">
                                                    <xsl:value-of select="$ad"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 10">
                                                    <xsl:value-of select="'A'"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 11">
                                                    <xsl:value-of select="'B'"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 12">
                                                    <xsl:value-of select="'C'"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 13">
                                                    <xsl:value-of select="'D'"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 14">
                                                    <xsl:value-of select="'E'"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 15">
                                                    <xsl:value-of select="'F'"/>
                                                </xsl:when>
                                            </xsl:choose>
                                        </xsl:variable>
                                    <xsl:value-of select="$Rstr6"/>
                                    <xsl:value-of select="'0'"/>
                                    </xsl:when>
                                    <xsl:otherwise> 
                                        <xsl:value-of select="$Rstr1"/>
                                        <xsl:value-of select="$Rstr3"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:variable>
                           <xsl:value-of select="$Rfin"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:variable name="Rstr5">
                                <xsl:choose>
                                    <xsl:when test="($Rstr cast as xs:decimal) &lt;= 9">
                                        <xsl:value-of select="concat('0',$Rstr)"/>
                                    </xsl:when>
                                    <xsl:when test="($Rstr cast as xs:decimal) = 10">
                                        <xsl:value-of select="'0A'"/>
                                    </xsl:when>
                                    <xsl:when test="($Rstr cast as xs:decimal) = 11">
                                        <xsl:value-of select="'0B'"/>
                                    </xsl:when>
                                    <xsl:when test="($Rstr cast as xs:decimal) = 12">
                                        <xsl:value-of select="'0C'"/>
                                    </xsl:when>
                                    <xsl:when test="($Rstr cast as xs:decimal) = 13">
                                        <xsl:value-of select="'0D'"/>
                                    </xsl:when>
                                    <xsl:when test="($Rstr cast as xs:decimal) = 14">
                                        <xsl:value-of select="'0E'"/>
                                    </xsl:when>
                                    <xsl:when test="($Rstr cast as xs:decimal) = 15">
                                        <xsl:value-of select="'0F'"/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:value-of select="$Rstr5"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="Ghex">
                    <xsl:variable name="Gstr" select="$G cast as xs:string"></xsl:variable>
                    <xsl:choose>
                        <xsl:when test="contains($Gstr,'.')">
                            <xsl:variable name="Gstr1" >
                                <xsl:choose>
                                    <xsl:when test="((substring-before($Gstr,'.')) cast as xs:decimal) &lt;= 9">
                                        <xsl:value-of select="(substring-before($Gstr,'.'))"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Gstr,'.')) cast as xs:decimal) = 10">
                                        <xsl:value-of select="'A'"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Gstr,'.')) cast as xs:decimal) = 11">
                                        <xsl:value-of select="'B'"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Gstr,'.')) cast as xs:decimal) = 12">
                                        <xsl:value-of select="'C'"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Gstr,'.')) cast as xs:decimal) = 13">
                                        <xsl:value-of select="'D'"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Gstr,'.')) cast as xs:decimal) = 14">
                                        <xsl:value-of select="'E'"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Gstr,'.')) cast as xs:decimal) = 15">
                                        <xsl:value-of select="'F'"/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:variable name="Gstr2" select="number(concat('0.',(substring-after($Gstr,'.'))))"/>
                            <xsl:variable name="Gstr3" >
                                <xsl:variable name="Gstr4" select="round($Gstr2 * 16)"></xsl:variable>
                                <xsl:choose>
                                    <xsl:when test="$Gstr4 &lt;= 9">
                                        <xsl:value-of select="$Gstr4"/>
                                    </xsl:when>
                                    <xsl:when test="$Gstr4 = 10">
                                        <xsl:value-of select="'A'"/>
                                    </xsl:when>
                                    <xsl:when test="$Gstr4 = 11">
                                        <xsl:value-of select="'B'"/>
                                    </xsl:when>
                                    <xsl:when test="$Gstr4 = 12">
                                        <xsl:value-of select="'C'"/>
                                    </xsl:when>
                                    <xsl:when test="$Gstr4 = 13">
                                        <xsl:value-of select="'D'"/>
                                    </xsl:when>
                                    <xsl:when test="$Gstr4 = 14">
                                        <xsl:value-of select="'E'"/>
                                    </xsl:when>
                                    <xsl:when test="$Gstr4 = 15">
                                        <xsl:value-of select="'F'"/>
                                    </xsl:when>
                                    <xsl:when test="$Gstr4 = 16">
                                        <xsl:value-of select="'16'"/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:variable name="Gfin">
                                <xsl:choose>
                                    <xsl:when test="$Gstr3 eq '16'">
                                        <xsl:variable name="ad">
                                            <xsl:choose>
                                                <xsl:when test="$Gstr1 = 'A'">
                                                    <xsl:value-of select="10 + 1"/>
                                                </xsl:when>
                                                <xsl:when test="$Gstr1 = 'B'">
                                                    <xsl:value-of select="11 + 1"/>
                                                </xsl:when>
                                                <xsl:when test="$Gstr1 = 'C'">
                                                    <xsl:value-of select="12 + 1"/>
                                                </xsl:when>
                                                <xsl:when test="$Gstr1 = 'D'">
                                                    <xsl:value-of select="13 + 1"/>
                                                </xsl:when>
                                                <xsl:when test="$Gstr1 = 'E'">
                                                    <xsl:value-of select="14 + 1"/>
                                                </xsl:when>
                                                <xsl:when test="$Gstr1 = 'F'">
                                                    <xsl:value-of select="'F'"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="$Gstr1 + 1"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>
                                        <xsl:variable name="Gstr6" >
                                            <xsl:choose>
                                                <xsl:when test="$ad&lt;= 9">
                                                    <xsl:value-of select="$ad"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 10">
                                                    <xsl:value-of select="'A'"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 11">
                                                    <xsl:value-of select="'B'"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 12">
                                                    <xsl:value-of select="'C'"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 13">
                                                    <xsl:value-of select="'D'"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 14">
                                                    <xsl:value-of select="'E'"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 15">
                                                    <xsl:value-of select="'F'"/>
                                                </xsl:when>
                                            </xsl:choose>
                                        </xsl:variable>
                                        <xsl:value-of select="$Gstr6"/>
                                        <xsl:value-of select="'0'"/>
                                    </xsl:when>
                                    <xsl:otherwise> 
                                        <xsl:value-of select="$Gstr1"/>
                                        <xsl:value-of select="$Gstr3"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:value-of select="$Gfin"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:variable name="Gstr5">
                                <xsl:choose>
                                    <xsl:when test="($Gstr cast as xs:decimal) &lt;= 9">
                                        <xsl:value-of select="concat('0',$Gstr)"/>
                                    </xsl:when>
                                    <xsl:when test="($Gstr cast as xs:decimal) = 10">
                                        <xsl:value-of select="'0A'"/>
                                    </xsl:when>
                                    <xsl:when test="($Gstr cast as xs:decimal) = 11">
                                        <xsl:value-of select="'0B'"/>
                                    </xsl:when>
                                    <xsl:when test="($Gstr cast as xs:decimal) = 12">
                                        <xsl:value-of select="'0C'"/>
                                    </xsl:when>
                                    <xsl:when test="($Gstr cast as xs:decimal) = 13">
                                        <xsl:value-of select="'0D'"/>
                                    </xsl:when>
                                    <xsl:when test="($Gstr cast as xs:decimal) = 14">
                                        <xsl:value-of select="'0E'"/>
                                    </xsl:when>
                                    <xsl:when test="($Gstr cast as xs:decimal) = 15">
                                        <xsl:value-of select="'0F'"/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:value-of select="$Gstr5"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="Bhex">
                    <xsl:variable name="Bstr" select="$B cast as xs:string"></xsl:variable>
                    <xsl:choose>
                        <xsl:when test="contains($Bstr,'.')">
                            <xsl:variable name="Bstr1" >
                                <xsl:choose>
                                    <xsl:when test="((substring-before($Bstr,'.')) cast as xs:decimal) &lt;= 9">
                                        <xsl:value-of select="(substring-before($Bstr,'.'))"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Bstr,'.')) cast as xs:decimal) = 10">
                                        <xsl:value-of select="'A'"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Bstr,'.')) cast as xs:decimal) = 11">
                                        <xsl:value-of select="'B'"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Bstr,'.')) cast as xs:decimal) = 12">
                                        <xsl:value-of select="'C'"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Bstr,'.')) cast as xs:decimal) = 13">
                                        <xsl:value-of select="'D'"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Bstr,'.')) cast as xs:decimal) = 14">
                                        <xsl:value-of select="'E'"/>
                                    </xsl:when>
                                    <xsl:when test="((substring-before($Bstr,'.')) cast as xs:decimal) = 15">
                                        <xsl:value-of select="'F'"/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:variable name="Bstr2" select="number(concat('0.',(substring-after($Bstr,'.'))))"/>
                            <xsl:variable name="Bstr3" >
                                <xsl:variable name="Bstr4" select="round($Bstr2 * 16)"></xsl:variable>
                                <xsl:choose>
                                    <xsl:when test="$Bstr4 &lt;= 9">
                                        <xsl:value-of select="$Bstr4"/>
                                    </xsl:when>
                                    <xsl:when test="$Bstr4 = 10">
                                        <xsl:value-of select="'A'"/>
                                    </xsl:when>
                                    <xsl:when test="$Bstr4 = 11">
                                        <xsl:value-of select="'B'"/>
                                    </xsl:when>
                                    <xsl:when test="$Bstr4 = 12">
                                        <xsl:value-of select="'C'"/>
                                    </xsl:when>
                                    <xsl:when test="$Bstr4 = 13">
                                        <xsl:value-of select="'D'"/>
                                    </xsl:when>
                                    <xsl:when test="$Bstr4 = 14">
                                        <xsl:value-of select="'E'"/>
                                    </xsl:when>
                                    <xsl:when test="$Bstr4 = 15">
                                        <xsl:value-of select="'F'"/>
                                    </xsl:when>
                                    <xsl:when test="$Bstr4 = 16">
                                        <xsl:value-of select="'16'"/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:variable name="Bfin">
                                <xsl:choose>
                                    <xsl:when test="$Bstr3 eq '16'">
                                        <xsl:variable name="ad">
                                            <xsl:choose>
                                                <xsl:when test="$Bstr1 = 'A'">
                                                    <xsl:value-of select="10 + 1"/>
                                                </xsl:when>
                                                <xsl:when test="$Bstr1 = 'B'">
                                                    <xsl:value-of select="11 + 1"/>
                                                </xsl:when>
                                                <xsl:when test="$Bstr1 = 'C'">
                                                    <xsl:value-of select="12 + 1"/>
                                                </xsl:when>
                                                <xsl:when test="$Bstr1 = 'D'">
                                                    <xsl:value-of select="13 + 1"/>
                                                </xsl:when>
                                                <xsl:when test="$Bstr1 = 'E'">
                                                    <xsl:value-of select="14 + 1"/>
                                                </xsl:when>
                                                <xsl:when test="$Bstr1 = 'F'">
                                                    <xsl:value-of select="'F'"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="$Bstr1 + 1"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>
                                        <xsl:variable name="Bstr6" >
                                            <xsl:choose>
                                                <xsl:when test="$ad&lt;= 9">
                                                    <xsl:value-of select="$ad"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 10">
                                                    <xsl:value-of select="'A'"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 11">
                                                    <xsl:value-of select="'B'"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 12">
                                                    <xsl:value-of select="'C'"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 13">
                                                    <xsl:value-of select="'D'"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 14">
                                                    <xsl:value-of select="'E'"/>
                                                </xsl:when>
                                                <xsl:when test="$ad = 15">
                                                    <xsl:value-of select="'F'"/>
                                                </xsl:when>
                                            </xsl:choose>
                                        </xsl:variable>
                                        <xsl:value-of select="$Bstr6"/>
                                        <xsl:value-of select="'0'"/>
                                    </xsl:when>
                                    <xsl:otherwise> 
                                        <xsl:value-of select="$Bstr1"/>
                                        <xsl:value-of select="$Bstr3"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:value-of select="$Bfin"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:variable name="Bstr5">
                                <xsl:choose>
                                    <xsl:when test="($Bstr cast as xs:decimal) &lt;= 9">
                                        <xsl:value-of select="concat('0',$Bstr)"/>
                                    </xsl:when>
                                    <xsl:when test="($Bstr cast as xs:decimal) = 10">
                                        <xsl:value-of select="'0A'"/>
                                    </xsl:when>
                                    <xsl:when test="($Bstr cast as xs:decimal) = 11">
                                        <xsl:value-of select="'0B'"/>
                                    </xsl:when>
                                    <xsl:when test="($Bstr cast as xs:decimal) = 12">
                                        <xsl:value-of select="'0C'"/>
                                    </xsl:when>
                                    <xsl:when test="($Bstr cast as xs:decimal) = 13">
                                        <xsl:value-of select="'0D'"/>
                                    </xsl:when>
                                    <xsl:when test="($Bstr cast as xs:decimal) = 14">
                                        <xsl:value-of select="'0E'"/>
                                    </xsl:when>
                                    <xsl:when test="($Bstr cast as xs:decimal) = 15">
                                        <xsl:value-of select="'0F'"/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:value-of select="$Bstr5"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                
                    <xsl:choose>
                        <!--   Checking whether the color value is white -->
                        <xsl:when test="($R &gt; 229 and $R &lt;= 255) and ($G &gt; 229 and $G &lt;= 255) and ($B &gt; 229 and $B &lt;= 255) ">
                            <!--<xsl:element name="w:color">
                                <xsl:attribute name="w:val" select="'000000'"/>
                            </xsl:element>-->
                            <xsl:value-of select="'000000'"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <!--<xsl:element name="w:color">
                                <xsl:attribute name="w:val" select="concat($Rhex,$Ghex,$Bhex)"/>
                            </xsl:element>-->
                            <!--<xsl:value-of select="concat($Rhex,$Ghex,$Bhex)"/>-->
                            <xsl:value-of select="concat($R1,$G1,$B1)"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    </xsl:if>
                <!--</xsl:when>
            </xsl:choose>-->
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
