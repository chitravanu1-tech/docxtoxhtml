<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
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
    exclude-result-prefixes="xs" version="2.0">
    
    <xsl:variable name="num" select="document('xhtmlNum2.xml')"/>
    <xsl:variable name="rowSpan" select="document('rowSpan.xml')"/>
    <xsl:template match="/">
        <w:styles xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
            xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"
            xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
            xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml" mc:Ignorable="w14">
                    <!-- @@@@@@@@@@@@@@@ Default word styles @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
            <xsl:element name="w:docDefaults">
                <xsl:element name="w:rPrDefault">
                    <xsl:element name="w:rPr">
                        <w:rFonts w:ascii="Times New Roman" w:eastAsia="Calibri" w:hAnsi="Times New Roman" w:cs="Times New Roman"/>
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
                        <w:top w:val="single"/>
                        <w:left w:val="single"/>
                        <w:bottom w:val="single"/>
                        <w:right w:val="single"/>
                        <w:insideH w:val="single"/>
                        <w:insideV w:val="single"/>
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
            
            <!-- @@@@@@@@@@@@@@@ Temporary Footnote and Endnote Style @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
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
            <w:style w:type="character" w:styleId="EndnoteReference">
                <w:name w:val="endnote reference"/>
                <w:basedOn w:val="DefaultParagraphFont"/>
                <w:uiPriority w:val="99"/>
                <w:semiHidden/>
                <w:unhideWhenUsed/>
                <w:rsid w:val="005E3F96"/>
                <w:rPr>
                    <w:vertAlign w:val="superscript"/>
                </w:rPr>
            </w:style>
            <!-- @@@@@@@@@@@@@@@ Temporary Footnote and Endnote Style @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
            
            <!-- @@@@@@@@@@@@@@@ Default word styles @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
            <xsl:apply-templates/>
<!--            <xsl:apply-templates select="//span"/>-->
            <xsl:for-each select="$rowSpan//*[@newStyle]">
                <xsl:variable name="style" select="self::*/@data-name"/>
                <xsl:if test="string-length($style) > 0">
                 <xsl:choose>
                     <xsl:when test="@newStyle = 'Para'">
                         <xsl:element name="w:style">
                             <xsl:attribute name="w:type" select="'paragraph'"/>
                             <xsl:attribute name="w:customStyle" select="'1'"/>
                             <xsl:attribute name="w:styleId" select="$style"/> 
                             <xsl:element name="w:name">
                                 <xsl:attribute name="w:val" select="$style"/>
                             </xsl:element>
                         </xsl:element>
                     </xsl:when>
                     <xsl:when test="@newStyle = 'Character'">
                         <xsl:element name="w:style">
                             <xsl:attribute name="w:type" select="'character'"/>
                             <xsl:attribute name="w:customStyle" select="'1'"/>
                             <xsl:attribute name="w:styleId" select="$style"/> 
                             <xsl:element name="w:name">
                                 <xsl:attribute name="w:val" select="$style"/>
                             </xsl:element>
                         </xsl:element>
                     </xsl:when>
                 </xsl:choose>
                </xsl:if>
            </xsl:for-each>
        </w:styles>
    </xsl:template>

    <xsl:template match="@* | node()">
        <xsl:apply-templates select="@* | node()"/>
    </xsl:template>


    <xsl:template match="style[character/@val = 'false']">
        <xsl:variable name="sname" select="@name"/>
        <xsl:variable name="stylename">
            <xsl:choose>
                <xsl:when test="string-length(mso-style-name/@val) > 0">
                    <xsl:value-of select="mso-style-name/@val"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$sname"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="styleId">
            <xsl:variable name="sId">
                <xsl:choose>
                    <xsl:when test="string-length(mso-style-name/@val) > 0">
                        <xsl:variable name="style" select="mso-style-name/@val"/>
                        <xsl:variable name="styleCount" select="count(//style[mso-style-name/@val = $style])"/>
                        <xsl:choose>
                            <xsl:when test="$styleCount = 1">
                                <xsl:value-of select="mso-style-name/@val"/>
                            </xsl:when>
                            <xsl:when test="$styleCount > 1">
                                <xsl:value-of select="$sname"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="mso-style-name/@val"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$sname"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:choose>
                <xsl:when test="matches($sId,'[\W\s]')">
                    <xsl:value-of select="replace($sId,'[\W\s]','')"/>
                    <xsl:number level="any"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$sId"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="tabs" select="descendant::*[starts-with(name(), 'tab')]" as="element()*"/>
        <xsl:element name="w:style">
            <xsl:attribute name="w:type" select="'paragraph'"/>
            <xsl:attribute name="w:customStyle" select="'1'"/>

            <xsl:attribute name="w:styleId" select="$styleId"/> 
            <xsl:element name="w:name">
                <xsl:attribute name="w:val" select="$stylename"/>
            </xsl:element>
            <xsl:element name="w:pPr">
                <!-- condition for list numpr   -->
<!--                <xsl:variable name="class" select="@name"/>-->
                <xsl:if test="count($tabs) > 0">
                    <w:tabs>
                        <xsl:for-each select="$tabs">
                            <w:tab w:val="left" w:pos="{string(@val)}"/>
                        </xsl:for-each>
                    </w:tabs>    
                </xsl:if>
                
                <!-- commented this because all the list are linked with the same concept as manual override, not using styles               -->
               <!-- <xsl:variable name="abstractNumID" select="$num//abstractNum/ol[@class = $class]/@listUID"/>
                <xsl:variable name="abstractNumID1" select="$num//abstractNum/ul[@class = $class]/@listUID"/>
                <xsl:if test="$num//abstractNum/ol[@class = $class]">
                    <xsl:element name="w:numPr">
                        <xsl:element name="w:numId">
                            <xsl:attribute name="w:val">
                                <xsl:value-of select="$abstractNumID"/>
                            </xsl:attribute>
                        </xsl:element>
                    </xsl:element>
                </xsl:if>
                <xsl:if test="$num//abstractNum/ul[@class = $class]">
                    <xsl:element name="w:numPr">
                        <xsl:element name="w:numId">
                            <xsl:attribute name="w:val">
                                <xsl:value-of select="$abstractNumID1"/>
                            </xsl:attribute>
                        </xsl:element>
                    </xsl:element>
                </xsl:if>-->
                <xsl:if test="margin-bottom | margin-top|line-height">
                    <xsl:element name="w:spacing">
                        <xsl:apply-templates select="margin-top"/>
                        <xsl:apply-templates select="margin-bottom"/>
                        <xsl:apply-templates select="line-height"/>
                    </xsl:element>
                </xsl:if>
                <xsl:if test="margin-left | margin-right|text-indent|padding-left">
                    <xsl:element name="w:ind">
                        <xsl:apply-templates select="margin-left"/>
                        <xsl:apply-templates select="margin-right"/>
                        <xsl:apply-templates select="text-indent"/>
                        <xsl:apply-templates select="padding-left"/>
                    </xsl:element>
                </xsl:if>
                <xsl:apply-templates select="text-align"/>
            </xsl:element>
            
            <xsl:element name="w:rPr">
                <xsl:apply-templates select="font-family"/>
                <xsl:apply-templates select="font-weight"/>
                <xsl:apply-templates select="font-style"/>
                <xsl:apply-templates select="text-transform"/>
                <xsl:apply-templates select="text-decoration"/>
                <xsl:apply-templates select="font-variant"/>
                <xsl:apply-templates select="color"/>
                <xsl:apply-templates select="background-color|background"/>
                <xsl:apply-templates select="font-size"/>
                <xsl:apply-templates select="vertical-align"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="style[character/@val = 'true']">
        <xsl:variable name="sname" select="@name"/>
        <xsl:variable name="stylename">
            <xsl:choose>
                <xsl:when test="string-length(mso-style-name/@val) > 0">
                    <xsl:value-of select="mso-style-name/@val"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$sname"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="styleId">
            <xsl:variable name="sId">
                <xsl:choose>
                    <xsl:when test="string-length(mso-style-name/@val) > 0">
                        <xsl:value-of select="mso-style-name/@val"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$sname"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:choose>
                <xsl:when test="matches($sId,'[\W\s]')">
                    <xsl:value-of select="replace($sId,'[\W\s]','')"/>
                    <xsl:number level="any"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$sId"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:element name="w:style">
            <xsl:attribute name="w:type" select="'character'"/>
            <xsl:attribute name="w:customStyle" select="'1'"/>
            
            <xsl:attribute name="w:styleId" select="$styleId"/> 
            <xsl:element name="w:name">
                <xsl:attribute name="w:val" select="$stylename"/>
            </xsl:element>
            
            <xsl:element name="w:rPr">
                <xsl:apply-templates select="font-family"/>
                <xsl:apply-templates select="font-weight"/>
                <xsl:apply-templates select="font-style"/>
                <xsl:apply-templates select="text-transform"/>
                <xsl:apply-templates select="font-variant"/>
                <xsl:apply-templates select="color"/>
                <xsl:apply-templates select="background-color|background"/>
                <xsl:apply-templates select="font-size"/>
                <xsl:apply-templates select="text-decoration"/>
                <xsl:apply-templates select="vertical-align"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
     
    <xsl:template match="text-align">
        <xsl:variable name="justification">
            <xsl:choose>
                <xsl:when test="(@val = 'both') or (@val = 'justify')">
                    <xsl:value-of select="'both'"/>
                </xsl:when>
                <xsl:when test="@val = 'center'">
                    <xsl:value-of select="'center'"/>
                </xsl:when>
                <xsl:when test="@val = 'right'">
                    <xsl:value-of select="'right'"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        <xsl:if test="string-length($justification) &gt; 0">
            <xsl:element name="w:jc">
                <xsl:attribute name="w:val" select="$justification"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="margin-right">
        <xsl:variable name="right">
            <xsl:choose>
                <xsl:when test="contains(@val,'pt')">
                    <xsl:variable name="rht" select="replace(@val,'pt','')"/>
                    <xsl:choose>
                        <xsl:when test="string-length($rht) &gt; 0">
                            <xsl:value-of select="round(number($rht) * 20)"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="0"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <!-- if there is no value with point as unit               -->
                <xsl:otherwise>
                    <xsl:value-of select="0"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:attribute name="w:right" select="$right"/>
    </xsl:template>
    
    <xsl:template match="text-indent">
        <xsl:variable name="firstLine">
            <xsl:choose>
                <xsl:when test="contains(@val,'pt')">
                    <xsl:variable name="rht" select="replace(@val,'pt','')"/>
                    <xsl:choose>
                        <xsl:when test="string-length($rht) &gt; 0">
                            <xsl:value-of select="round(number($rht) * 20)"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="0"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <!-- if there is no value with point as unit               -->
                <xsl:otherwise>
                    <xsl:value-of select="0"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:attribute name="w:firstLine" select="$firstLine"/>
    </xsl:template>
    
    <xsl:template match="padding-left">
        <xsl:variable name="hanging">
            <xsl:choose>
                <xsl:when test="contains(@val,'pt')">
                    <xsl:variable name="rht" select="replace(@val,'pt','')"/>
                    <xsl:choose>
                        <xsl:when test="string-length($rht) &gt; 0">
                            <xsl:value-of select="round(number($rht) * 20)"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="0"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <!-- if there is no value with point as unit               -->
                <xsl:otherwise>
                    <xsl:value-of select="0"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:attribute name="w:hanging" select="$hanging"/>
    </xsl:template>
    
    <xsl:template match="margin-left">
        <xsl:variable name="left">
            <xsl:choose>
                <xsl:when test="contains(@val,'pt')">
                    <xsl:variable name="lft" select="replace(@val,'pt','')"/>
                    <xsl:choose>
                        <xsl:when test="string-length($lft) &gt; 0">
                            <xsl:value-of select="round(number($lft) * 20)"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="0"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <!-- if there is no value with point as unit               -->
                <xsl:otherwise>
                    <xsl:value-of select="0"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:attribute name="w:left" select="$left"/>
    </xsl:template>
    
    <xsl:template match="line-height">
        <xsl:variable name="line">
            <xsl:choose>
                <xsl:when test="contains(@val,'pt')">
                    <xsl:variable name="lineSpace" select="replace(@val,'pt','')"/>
                    <xsl:choose>
                        <xsl:when test="string-length($lineSpace) &gt; 0">
                            <xsl:value-of select="round(number($lineSpace) * 20)"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="0"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <!-- if there is no value with point as unit               -->
                <xsl:otherwise>
                    <xsl:value-of select="0"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:attribute name="w:line" select="$line"/>
    </xsl:template>
    
    <xsl:template match="margin-top">
        <xsl:variable name="before">
            <xsl:choose>
                <xsl:when test="contains(@val,'pt')">
                    <xsl:variable name="bfore" select="replace(@val,'pt','')"/>
                    <xsl:choose>
                        <xsl:when test="string-length($bfore) &gt; 0">
                            <xsl:value-of select="round(number($bfore) * 20)"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="0"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <!-- if there is no value with point as unit               -->
                <xsl:otherwise>
                    <xsl:value-of select="0"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:attribute name="w:before" select="$before"/>
    </xsl:template>
    
    <xsl:template match="margin-bottom">
        <xsl:variable name="after">
            <xsl:choose>
                <xsl:when test="contains(@val,'pt')">
                    <xsl:variable name="afre" select="replace(@val,'pt','')"/>
                    <xsl:choose>
                        <xsl:when test="string-length($afre) &gt; 0">
                            <xsl:value-of select="round(number($afre) * 20)"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="0"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <!-- if there is no value with point as unit               -->
                <xsl:otherwise>
                    <xsl:value-of select="0"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:attribute name="w:after" select="$after"/>
    </xsl:template>
    
    <xsl:template match="vertical-align">
        <xsl:choose>
            <xsl:when test="contains(@val,'super')">
                <xsl:element name="w:vertAlign">
                    <xsl:attribute name="w:val" select="'superscript'"/>
                </xsl:element>
            </xsl:when>
            <xsl:when test="contains(@val,'sub')">
                <xsl:element name="w:vertAlign">
                    <xsl:attribute name="w:val" select="'subscript'"/>
                </xsl:element>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="font-variant">
        <xsl:choose>
            <xsl:when test="@val = 'small-caps'">
                <xsl:element name="w:smallCaps"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="text-decoration">
        <xsl:choose>
            <xsl:when test="@val = 'underline'">
                <xsl:element name="w:u">
                    <xsl:attribute name="w:val" select="'single'"/>
                </xsl:element>      
            </xsl:when>
            <xsl:when test="contains(@val,'line-through')">
                <xsl:element name="w:strike"/>
            </xsl:when>
        </xsl:choose>
        
    </xsl:template>

    <xsl:template match="text-transform">
        <xsl:choose>
            <xsl:when test="@val = 'uppercase'">
                <xsl:element name="w:caps"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="font-family">
        <xsl:variable name="fontName">
            <xsl:choose>
                <xsl:when test="contains(@val, ',')">
                    <xsl:variable name="fn" select="tokenize(@val, ',')"/>
                    <xsl:value-of select="$fn[1]"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="@val"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:if test="string-length($fontName) > 0">
            <xsl:element name="w:rFonts">
                <xsl:attribute name="w:ascii" select="$fontName"/>
                <xsl:attribute name="w:hAnsi" select="$fontName"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="font-size">
        <xsl:variable name="size">
            <xsl:variable name="sz">
                <xsl:choose>
                    <xsl:when test="starts-with(lower-case(@val),'nan')">
                        <xsl:value-of select="'10'"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:choose>
                            <xsl:when test="ends-with(@val, 'pt')">
                                <xsl:value-of select="replace(@val, 'pt', '')"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="@val"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:value-of select="number($sz) * 2"/>
        </xsl:variable>
        <xsl:element name="w:sz">
            <xsl:attribute name="w:val" select="round($size)"/>
        </xsl:element>
    </xsl:template>
    <!-- A1 -->
    <xsl:template match="color">
        <xsl:variable name="FC">
            <xsl:choose>
                <xsl:when test="contains(lower-case(@val), '#')">
                    <xsl:choose>
                        <xsl:when test="contains(@val, ';')">
                            <xsl:value-of
                                select="substring-before(substring-after(@val, '#'), ';')"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="substring-after(@val, '#')"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:variable name="tempVal" select="@val"/>        
                    <xsl:call-template name="color">
                        <xsl:with-param name="colorVal" select="replace($tempVal,' ','')"></xsl:with-param>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:if test="string-length($FC) > 0">
            <xsl:element name="w:color">
                <xsl:attribute name="w:val">
                    <xsl:value-of select="$FC"/>
                </xsl:attribute>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="background-color|background">
        <xsl:variable name="bgC">
            <xsl:choose>
                <xsl:when test="contains(lower-case(@val), '#')">
                    <xsl:choose>
                        <xsl:when test="contains(@val, ';')">
                            <!--<xsl:value-of
                                select="substring-before(substring-after(@val, '#'), ';')"/>-->
                            <xsl:variable name="Val1"><xsl:value-of
                                select="substring-after(@val, '#')"/></xsl:variable>
                            <xsl:choose>
                                <xsl:when test="contains($Val1,';')">
                                    <xsl:value-of select="substring-before($Val1, ';')"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$Val1"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="substring-after(@val, '#')"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:variable name="tempVal" select="@val"/>        
                    <xsl:call-template name="color">
                        <xsl:with-param name="colorVal" select="replace($tempVal,' ','')"></xsl:with-param>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:element name="w:shd">
            <xsl:attribute name="w:val" select="'clear'"/>
            <xsl:attribute name="w:color" select="'auto'"/>
            <xsl:attribute name="w:fill">
                <xsl:value-of select="$bgC"/>
            </xsl:attribute>
        </xsl:element>
    </xsl:template>

    <xsl:template match="font-weight">
        <xsl:choose>
            <xsl:when test="@val = 'bold'">
                <xsl:element name="w:b"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="font-style">
        <xsl:choose>
            <xsl:when test="@val = 'italic'">
                <xsl:element name="w:i"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:variable name="hex">0123456789ABCDEF</xsl:variable>
    
    <xsl:template name="color">
        <xsl:param name="colorVal"/>
        <xsl:variable name="col">
            <xsl:variable name="col1">
                <xsl:value-of select="replace(replace($colorVal, '^rgb\(', ''), '\)$', '')"/>
            </xsl:variable>

            <xsl:value-of select="replace(replace($col1, '^rgba\(', ''), '\)$', '')"/>
        </xsl:variable>

        <xsl:if test="starts-with($colorVal, 'rgb(') and ends-with($colorVal, ')') or starts-with($colorVal, 'rgba(') and ends-with($colorVal, ')')">
            <xsl:variable name="RGB" as="xs:string*" select="tokenize($col, ',')"/>

            <xsl:variable name="R" select="number($RGB[1])"/>
            <xsl:variable name="G" select="number($RGB[2])"/>
            <xsl:variable name="B" select="number($RGB[3])"/>



            <xsl:variable name="R1">
                <xsl:variable name="hex-digit1" select="substring($hex, floor($R div 16) + 1, 1)"/>
                <xsl:variable name="hex-digit2" select="substring($hex, $R mod 16 + 1, 1)"/>
                <xsl:value-of select="concat($hex-digit1, $hex-digit2)"/>
            </xsl:variable>
            <xsl:variable name="G1">
                <xsl:variable name="hex-digit1" select="substring($hex, floor($G div 16) + 1, 1)"/>
                <xsl:variable name="hex-digit2" select="substring($hex, $G mod 16 + 1, 1)"/>
                <xsl:value-of select="concat($hex-digit1, $hex-digit2)"/>
            </xsl:variable>
            <xsl:variable name="B1">
                <xsl:variable name="hex-digit1" select="substring($hex, floor($B div 16) + 1, 1)"/>
                <xsl:variable name="hex-digit2" select="substring($hex, $B mod 16 + 1, 1)"/>
                <xsl:value-of select="concat($hex-digit1, $hex-digit2)"/>
            </xsl:variable>

            <!--<xsl:choose>
				<!-\-   Checking whether the color value is white -\->
				<xsl:when
					test="($R > 229 and $R &lt;= 255) and ($G > 229 and $G &lt;= 255) and ($B > 229 and $B &lt;= 255)">
					<!-\-<xsl:element name="w:color">
                        <xsl:attribute name="w:val" select="'000000'"/>
                    </xsl:element>-\->
					<xsl:value-of select="'000000'"/>
				</xsl:when>
				<xsl:otherwise>
					<!-\-<xsl:element name="w:color">
                        <xsl:attribute name="w:val" select="concat($Rhex,$Ghex,$Bhex)"/>
                    </xsl:element>-\->
					<xsl:value-of select="concat($R1, $G1, $B1)"/>
				</xsl:otherwise>
			</xsl:choose>-->
            <!--	instead of changing the color take the color as it is.		-->
            <xsl:value-of select="concat($R1, $G1, $B1)"/>
        </xsl:if>
    </xsl:template>

    <!-- reserved styles   -->
    <xsl:template match="style[@name ='FootnoteReference']"/>
    <!-- reserved styles   -->
</xsl:stylesheet>