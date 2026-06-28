<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<!-- Replace your namespace as needed-->
<!--To add the color for endnote 29-3-2019-->
<!--20-7-2020 changed for footnote symbols-->
<!--Added w:start and w:end for border missing issue on 26-11-2020-->
<!--added on 23-03-2021 for Editor insert footnote-->
<!-- Added "self::span[@data-comment]" for comment missing on 9-3-2023 -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
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
	xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main"
	xmlns:dt="uuid:C2F41010-65B3-11d1-A29F-00AA00C14882"
	xmlns:pic="http://schemas.openxmlformats.org/drawingml/2006/picture"
	xmlns:a14="http://schemas.microsoft.com/office/drawing/2010/main">
	<xsl:strip-space elements="*"/>
	<xsl:preserve-space elements="*"/>
	<xsl:output indent="no" standalone="yes"/>
	<xsl:variable name="num" select="document('xhtmlNum2.xml')"/>
	<xsl:variable name="styles" select="document('styles.xml')"/>
	<xsl:template match="/">
		<w:document xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas"
			xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
			mc:Ignorable="w14 wp14">
			<xsl:namespace name="mc"
				select="'http://schemas.openxmlformats.org/markup-compatibility/2006'"/>
			<xsl:namespace name="o" select="'urn:schemas-microsoft-com:office:office'"/>
			<xsl:namespace name="r"
				select="'http://schemas.openxmlformats.org/officeDocument/2006/relationships'"/>
			<xsl:namespace name="m"
				select="'http://schemas.openxmlformats.org/officeDocument/2006/math'"/>
			<xsl:namespace name="v" select="'urn:schemas-microsoft-com:vml'"/>
			<xsl:namespace name="wp"
				select="'http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing'"/>
			<xsl:namespace name="w10" select="'urn:schemas-microsoft-com:office:word'"/>
			<xsl:namespace name="w"
				select="'http://schemas.openxmlformats.org/wordprocessingml/2006/main'"/>
			<xsl:namespace name="w14"
				select="'http://schemas.microsoft.com/office/word/2010/wordml'"/>
			<xsl:namespace name="wpg"
				select="'http://schemas.microsoft.com/office/word/2010/wordprocessingGroup'"/>
			<xsl:namespace name="wpi"
				select="'http://schemas.microsoft.com/office/word/2010/wordprocessingInk'"/>
			<xsl:namespace name="wne"
				select="'http://schemas.microsoft.com/office/word/2006/wordml'"/>
			<xsl:namespace name="wps"
				select="'http://schemas.microsoft.com/office/word/2010/wordprocessingShape'"/>
			<w:body>
				<!--<xsl:apply-templates select="/my:myFields"/>-->
				<xsl:apply-templates select="//html"/>
			</w:body>
		</w:document>
	</xsl:template>
	<!-- <xsl:template match="/my:myFields">-->
	<xsl:template match="/html">
		<!--<xsl:variable name="endNoteNotempVal" select="//span[(lower-case(@class) = 'endnotereference')][string-length(.) > 0] | //span[@class = 'EndnoteNumber'][string-length(.) > 0]|//span[(lower-case(@class) ='msoendnotereference')][string-length(.) > 0]"/>-->
		<xsl:variable name="endNoteNotempVal" select="//span[(lower-case(@class) = 'endnotereference')][string-length(.) > 0] | //span[@class = 'EndnoteNumber'][string-length(.) > 0]|//span[(lower-case(@class) ='msoendnotereference')][string-length(.) > 0]|//span[not((lower-case(@class) = 'endnotereference'))]/a[contains(@class,'endnotecitation')][string-length(.) > 0] | //span[not(@class = 'EndnoteNumber')]/a[@class='crossref'][string-length(.) > 0]"/>
		<xsl:variable name="footNotetempVal" select="//span[(lower-case(@class) = 'footnotereference')][string-length(.) > 0]|//span[(lower-case(@class) ='msofootnotereference')][string-length(.) > 0]"/>
		<xsl:variable name="endNoteNo">
			<xsl:choose>
				<xsl:when test="$endNoteNotempVal[1] = '*'">
					<xsl:value-of select="'chicago'"/>
				</xsl:when>
				<xsl:when test="$endNoteNotempVal[1] = 'I'">
					<xsl:value-of select="'upperRoman'"/>
				</xsl:when>
				<xsl:when test="$endNoteNotempVal[1] = 'i'">
					<xsl:value-of select="'lowerRoman'"/>
				</xsl:when>
				<xsl:when test="$endNoteNotempVal[1] = 'a'">
					<xsl:value-of select="'lowerAlpha'"/>
				</xsl:when>
				<xsl:when test="$endNoteNotempVal[1] = 'A'">
					<xsl:value-of select="'upperAlpha'"/>
				</xsl:when>                    
				<xsl:otherwise>
					<xsl:value-of select="'decimal'"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<xsl:variable name="footNoteNo">
			
			<xsl:choose>
				<xsl:when test="$footNotetempVal[1] = '*'">
					<xsl:value-of select="'chicago'"/>
				</xsl:when>
				<xsl:when test="$footNotetempVal[1] = 'I'">
					<xsl:value-of select="'upperRoman'"/>
				</xsl:when>
				<xsl:when test="$footNotetempVal[1] = 'i'">
					<xsl:value-of select="'lowerRoman'"/>
				</xsl:when>
				<xsl:when test="$footNotetempVal[1] = 'a'">
					<xsl:value-of select="'lowerAlpha'"/>
				</xsl:when>
				<xsl:when test="$footNotetempVal[1] = 'A'">
					<xsl:value-of select="'upperAlpha'"/>
				</xsl:when>                    
				<xsl:otherwise>
					<xsl:value-of select="'decimal'"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<!--<xsl:apply-templates select="my:IPRT"/>-->
		<xsl:apply-templates select="body"/>
		<w:sectPr>
			<w:pgSz w:w="12240" w:h="15840"/>
			<xsl:if test="string-length($endNoteNotempVal[1]) > 0">
				<w:endnotePr>
					<w:numFmt w:val="{$endNoteNo}"/>
				</w:endnotePr>
			</xsl:if>
			<xsl:if test="string-length($footNotetempVal[1]) > 0">
				<w:footnotePr>
					<w:numFmt w:val="{$footNoteNo}"/>
				</w:footnotePr>
			</xsl:if>
			<w:pgMar w:top="1417" w:right="1417" w:bottom="1417" w:left="1417" w:header="708"
				w:footer="708" w:gutter="0"/>
			<w:cols w:space="708"/>
			<!--    <w:docGrid w:line-pitch="360"/>-->
		</w:sectPr>
	</xsl:template>
	<!-- <xsl:template match="my:IPRT">-->
	<xsl:template match="body">
		<xsl:call-template name="infopath-rich-text">
			<!-- add params for pPr and rPr settings 
   <xsl:with-param name="pPr_Default">
   <w:ind w:left="2000"/>
  </xsl:with-param>
   <xsl:with-param name="rPr_Default">
   <w:rFonts w:ascii="Courier New" w:h-ansi="Courier New"/>
  </xsl:with-param>  -->
		</xsl:call-template>
	</xsl:template>
	<xsl:template name="infopath-rich-text">
		<!-- Basic conversion of an Infopath rich text node to WordML
      Author: Stephane Bouillon - Microsoft Services Belgium
      Feb 2006 

      This is a work in progress that will work for most hand-typed rich text values, but will almost certainly fail with
      cut/pasted html content, especially with nested tables and divs, for which I do not yet have a good solution.
      
      Send suggestions and feedback to Stephane.Bouillon@microsoft.com
 -->
		<!-- optional input parameters for default paragraph and character formatting -->
		<!--  <xsl:param name="pPr_Default"/>
  <xsl:param name="rPr_Default"/>-->
		<xsl:choose>
			<xsl:when
				test="descendant::h1 | descendant::h2 | descendant::h3 | descendant::h4 | descendant::h5 | descendant::h6 | descendant::p | descendant::li">
				<xsl:apply-templates select="* | text()">
					<!--<xsl:with-param name="pPr_Default"><xsl:copy-of select="$pPr_Default"/></xsl:with-param>
     <xsl:with-param name="rPr_Default"><xsl:copy-of select="$rPr_Default"/></xsl:with-param>-->
				</xsl:apply-templates>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<!--changed the concept from span to a href cause the classes values are changing and the footnote or endnote are created,even 
  if the id for corresponding footnote or endnote is not present in the document-->
	<!-- <xsl:template match="footnote|span[(lower-case(@class) ='msofootnotereference')]|span[(lower-case(@class) ='endnotereference')]">-->
        <!--added on 23-03-2021 for Editor insert footnote(a[@class='footnotecitation'][not(starts-with(@id, '_ftnref') or starts-with(@name, '_ftnref'))])-->
        <!-- footnote | a[starts-with(@id, '_ftnref') or starts-with(@name, '_ftnref')] | a[starts-with(@id, 'eref') or starts-with(@name, 'eref')]| a[@class='footnotecitation'][not(starts-with(@id, '_ftnref') or starts-with(@name, '_ftnref'))] -->
	<xsl:template
		match="footnote | a[contains(@class,'endnotecitation')][@id or @name] | a[contains(@class,'crossref')][@href] | a[contains(@class,'footnotecitation')][@id or @name] | a[contains(@class,'footnotecitation')][not(@id or @name)]">
		<!--  <xsl:param name="pPr_Default"/>
  <xsl:param name="rPr_Default"/>-->
		<xsl:variable name="id" select="@id or @name"/>
		<xsl:variable name="target" select="substring-after(@href, '#')"/>
		
		<xsl:variable name="isTargetPresent"
			select="boolean(following::*[@id = $target] | following::*[@name = $target])"/>
		
		<!-- creating the footnote or endnote references only if the target is present in the document -->
		<xsl:if test="$isTargetPresent = true()">
			<xsl:variable name="class" select="@class"/>
			<xsl:variable name="FntOrEnt">
				<xsl:choose>
                     <!-- boolean(self::*[contains(lower-case(@id), '_ftnref') or contains(lower-case(@name), '_ftnref')]) -->
					<xsl:when
						test="boolean(self::*[contains(@class,'footnotecitation')][@id or @name])">
						<xsl:value-of select="'footnote'"/>
					</xsl:when>
					<!--added on 23-03-2021 for Editor insert footnote-->
					<!--<xsl:when
						test="boolean(self::*[@class='footnotecitation'][not(contains(lower-case(@id), '_ftnref') or contains(lower-case(@name), '_ftnref'))])">
						<xsl:value-of select="'footnote'"/>
					</xsl:when>-->
                                        <!-- boolean(self::*[contains(lower-case(@id), 'eref') or contains(lower-case(@name), 'eref')]) -->
                                        <xsl:when
						test="boolean(self::*[contains(@class,'endnotecitation')][@id or @name])">
						<xsl:value-of select="'endnote'"/>
					</xsl:when>
				</xsl:choose>
			</xsl:variable>
                        <xsl:variable name="counter1">
				
					
					<xsl:if test="$FntOrEnt = 'footnote'">
						<xsl:value-of select="'ftnre'"/>
					</xsl:if>
					
			</xsl:variable>
			<xsl:variable name="counter">
				<xsl:choose>
					<!--added on 23-03-2021 for Editor insert footnote-->
					<xsl:when test="$FntOrEnt = 'footnote'">
						<xsl:value-of select="'_'"/>
					</xsl:when>
					<xsl:when test="$FntOrEnt = 'endnote'">
						<xsl:value-of select="'eref'"/>
					</xsl:when>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="style">
				<xsl:choose>
					<xsl:when test="$FntOrEnt = 'footnote'">
						<xsl:value-of select="'FootnoteReference'"/>
					</xsl:when>
					<xsl:when test="$FntOrEnt = 'endnote'">
						<xsl:value-of select="'EndnoteReference'"/>
					</xsl:when>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="elemnt">
				<xsl:choose>
					<xsl:when test="$FntOrEnt = 'footnote'">
						<xsl:value-of select="'w:footnoteReference'"/>
					</xsl:when>
					<xsl:when test="$FntOrEnt = 'endnote'">
						<xsl:value-of select="'w:endnoteReference'"/>
					</xsl:when>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="countId">
				<!--<xsl:number level="any"
					count="a[starts-with(@id, $counter) or starts-with(@name, $counter)]"/>-->
				<!--added on 23-03-2021 for Editor insert footnote-->
				<xsl:choose>
					<xsl:when test="//a[@class='footnotecitation'][starts-with(@id, $counter) or starts-with(@name, $counter) or starts-with(@id, $counter1) or starts-with(@name, $counter1)]">
						<xsl:number level="any"
							count="//a[@class='footnotecitation'][starts-with(@id, $counter) or starts-with(@name, $counter) or starts-with(@id, $counter1) or starts-with(@name, $counter1)]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:number level="any"
							count="//a[contains(@class,'endnotecitation') or starts-with(@id, $counter) or starts-with(@name, $counter)]"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="fontcolor">
				<xsl:if test="ancestor::span[1][@data-name]">
					<xsl:variable name="sdataname" select="ancestor::span[1]/@data-name"/>
					<xsl:if test="$styles//w:style[w:name/@w:val = $sdataname]">
					<xsl:element name="w:shd">
						<xsl:attribute name="w:val" select="'clear'"/>
						<xsl:attribute name="w:color" select="'auto'"/>
						<xsl:attribute name="w:fill">
							<xsl:value-of select="$styles//w:style[w:name/@w:val = $sdataname]/descendant::w:shd/@w:fill"/>
							</xsl:attribute>
					</xsl:element>
					</xsl:if>
				</xsl:if>
			</xsl:variable>
					
			
			<xsl:choose>
				<xsl:when test="child::del">
					<xsl:element name="w:del">
						<xsl:attribute name="w:id">
							<xsl:number level="any"/>
						</xsl:attribute>
						<xsl:element name="w:r">
							<xsl:element name="w:rPr">
								<xsl:element name="w:rStyle">
									<xsl:attribute name="w:val" select="$style"/>
								</xsl:element>
							</xsl:element>
							<xsl:element name="{$elemnt}">
								<xsl:attribute name=" w:id">
									<xsl:value-of select="$countId"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:element>
					</xsl:element>
				</xsl:when>
				<xsl:when test="child::ins">
					<xsl:element name="w:ins">
						<xsl:attribute name="w:id">
							<xsl:number level="any"/>
						</xsl:attribute>
						<xsl:element name="w:r">
							<xsl:element name="w:rPr">
								<xsl:element name="w:rStyle">
									<xsl:attribute name="w:val" select="$style"/>
								</xsl:element>
								
							</xsl:element>
							<xsl:element name="{$elemnt}">
								<xsl:attribute name=" w:id">
									<xsl:value-of select="$countId"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:element>
					</xsl:element>
				</xsl:when>
				<xsl:otherwise>
					<xsl:element name="w:r">
						<xsl:element name="w:rPr">
							<xsl:element name="w:rStyle">
								<xsl:attribute name="w:val" select="$style"/>
							</xsl:element>
							
							<!--To add the color for endnote 29-3-2019-->
							<xsl:if test="ancestor::span[1][@data-name]">
								<xsl:variable name="sdataname" select="ancestor::span[1]/@data-name"/>
								<xsl:if test="$styles//w:style[w:name/@w:val = $sdataname]">
        							<xsl:element name="w:shd">
										<xsl:attribute name="w:val" select="'clear'"/>
										<xsl:attribute name="w:color" select="'auto'"/>
										<xsl:attribute name="w:fill">
											<xsl:value-of select="$styles//w:style[w:name/@w:val = $sdataname]/descendant::w:shd/@w:fill"/>
										</xsl:attribute>
									</xsl:element>
								</xsl:if>
							</xsl:if>
							
							<xsl:call-template name="apply-nested-character-formatting"/>
							
							<!--End-->
							
						</xsl:element>
						<xsl:element name="{$elemnt}">
							
							<!--20-7-2020 changed for footnote symbols-->
							<xsl:if test="self::a[@class='footnotecitation'][@id or @name]/span[@data-type='number'] | self::a[@class='footnotecitation'][@id or @name]/span[@data-type]">
								<xsl:variable name="ftnum" select="."/>
								
								<xsl:if test="not(number($ftnum))">
									<xsl:attribute name="w:customMarkFollows" select="'1'"/>
									</xsl:if>
							</xsl:if>
								<!--End-->
							
							<xsl:attribute name="w:id">
								<xsl:value-of select="$countId"/>
							</xsl:attribute>
						</xsl:element>
                                                <!--added on 23-03-2021 for Editor insert footnote-->
						<xsl:if test="self::a[@class='footnotecitation'][@id or @name]/span[@data-type='empty']">
							<xsl:element name="w:sym">
								<xsl:attribute name="w:font" select="'Symbol'"/>
								<xsl:attribute name="w:char">
									<xsl:value-of select="'F020'"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:if>
						
						<!--20-7-2020 changed for footnote symbols-->
						<xsl:if test="self::a[contains(@class, 'footnotecitation')][@id or @name]/span[@data-type='number']">
							<xsl:variable name="ftnum" select="normalize-space(.)"/>
							
								<xsl:if test="not(number($ftnum))">
									<xsl:element name="w:sym">
										<xsl:attribute name="w:font" select="'Symbol'"/>
										<xsl:attribute name="w:char">
											<xsl:choose>
<xsl:when test="$ftnum = '∀'">F022</xsl:when>
<!--	# FOR ALL # universal -->
<xsl:when test="$ftnum = '∃'">F024</xsl:when>
<!--	# THERE EXISTS # existential -->
<xsl:when test="$ftnum = '%'">F025</xsl:when>
<!--	# PERCENT SIGN # percent -->
<xsl:when test="$ftnum = '&amp;'">F026</xsl:when>
<!--	# AMPERSAND # ampersand -->
<xsl:when test="$ftnum = '∋'">F027</xsl:when>
<!--	# CONTAINS AS MEMBER	# suchthat -->
<xsl:when test="$ftnum = '&#x0028;'">F028</xsl:when>
<!--	# LEFT PARENTHESIS	# parenleft -->
<xsl:when test="$ftnum = '&#x0029;'">F029</xsl:when>
<!--	# RIGHT PARENTHESIS	# parenright -->
<xsl:when test="$ftnum = '∗'">F02A</xsl:when>
<!--	# ASTERISK OPERATOR	# asteriskmath -->
<xsl:when test="$ftnum = '+'">F02B</xsl:when>
<!--	# PLUS SIGN # plus -->
<xsl:when test="$ftnum = '&#x002C;'">F02C</xsl:when>
<!--	# COMMA	# comma -->
<xsl:when test="$ftnum = '−'">F02D</xsl:when>
<!--	# MINUS SIGN # minus -->
<xsl:when test="$ftnum = '&#x002E;'">F02E</xsl:when>
<!--	# FULL STOP # period -->
<xsl:when test="$ftnum = '&#x002F;'">F02F</xsl:when>
<!--	# SOLIDUS # slash -->
<xsl:when test="$ftnum = '&#x0030;'">F030</xsl:when>
<xsl:when test="$ftnum = '&#x0031;'">F031</xsl:when>
<!--	# DIGIT ONE # one -->
<xsl:when test="$ftnum = '&#x0032;'">F032</xsl:when>
<!--	# DIGIT TWO # two -->
<xsl:when test="$ftnum = '&#x0033;'">F033</xsl:when>
<!--	# DIGIT THREE # three -->
<xsl:when test="$ftnum = '&#x0034;'">F034</xsl:when>
<!--	# DIGIT FOUR # four -->
<xsl:when test="$ftnum = '&#x0035;'">F035</xsl:when>
<!--	# DIGIT FIVE # five -->
<xsl:when test="$ftnum = '&#x0036;'">F036</xsl:when>
<!--	# DIGIT SIX # six -->
<xsl:when test="$ftnum = '&#x0037;'">F037</xsl:when>
<!--	# DIGIT SEVEN # seven -->
<xsl:when test="$ftnum = '&#x0038;'">F038</xsl:when>
<xsl:when test="$ftnum = '&#x0039;'">F039</xsl:when>
<!--	# DIGIT NINE # nine -->
<xsl:when test="$ftnum = '&#x003A;'">F03A</xsl:when>
<!--	# COLON	# colon -->
<xsl:when test="$ftnum = '&#x003B;'">F03B</xsl:when>
<!--	# SEMICOLON # semicolon -->
<xsl:when test="$ftnum = '&#x003C;'">F03C</xsl:when>
<!--	# LESS-THAN SIGN	# less -->
<xsl:when test="$ftnum = '='">F03D</xsl:when>
<!--	# EQUALS SIGN # equal -->
<xsl:when test="$ftnum = '&#x003E;'">F03E</xsl:when>
<!--	# GREATER-THAN SIGN	# greater -->
<xsl:when test="$ftnum = '&#x003F;'">F03F</xsl:when>
<!--	# QUESTION MARK	# question -->
<xsl:when test="$ftnum = '≅'">F040</xsl:when>
<!--	# APPROXIMATELY EQUAL TO	# congruent -->
<xsl:when test="$ftnum = 'Α'">F041</xsl:when>
<!--	# GREEK CAPITAL LETTER ALPHA	# Alpha -->
<xsl:when test="$ftnum = 'Β'">F042</xsl:when>
<!--	# GREEK CAPITAL LETTER BETA	# Beta -->
<xsl:when test="$ftnum = 'Χ'">F043</xsl:when>
<!--	# GREEK CAPITAL LETTER CHI	# Chi -->
<xsl:when test="$ftnum = 'Δ'">F044</xsl:when>
<!--	# GREEK CAPITAL LETTER DELTA	# Delta -->
<xsl:when test="$ftnum = '&#x2206;'">F044</xsl:when>
<!--	# INCREMENT # Delta -->
<xsl:when test="$ftnum = 'Ε'">F045</xsl:when>
<!--	# GREEK CAPITAL LETTER EPSILON	# Epsilon -->
<xsl:when test="$ftnum = 'Φ'">F046</xsl:when>
<!--	# GREEK CAPITAL LETTER PHI	# Phi -->
<xsl:when test="$ftnum = 'Γ'">F047</xsl:when>
<!--	# GREEK CAPITAL LETTER GAMMA	# Gamma -->
<xsl:when test="$ftnum = 'Η'">F048</xsl:when>
<!--	# GREEK CAPITAL LETTER ETA	# Eta -->
<xsl:when test="$ftnum = 'Ι'">F049</xsl:when>
<!--	# GREEK CAPITAL LETTER IOTA	# Iota -->
<xsl:when test="$ftnum = 'ϑ'">F04A</xsl:when>
<!--	# GREEK THETA SYMBOL	# theta1 -->
<xsl:when test="$ftnum = 'Κ'">F04B</xsl:when>
<!--	# GREEK CAPITAL LETTER KAPPA	# Kappa -->
<xsl:when test="$ftnum = 'Λ'">F04C</xsl:when>
<!--	# GREEK CAPITAL LETTER LAMDA	# Lambda -->
<xsl:when test="$ftnum = 'Μ'">F04D</xsl:when>
<!--	# GREEK CAPITAL LETTER MU	# Mu -->
<xsl:when test="$ftnum = 'Ν'">F04E</xsl:when>
<!--	# GREEK CAPITAL LETTER NU	# Nu -->
<xsl:when test="$ftnum = 'Ο'">F04F</xsl:when>
<!--	# GREEK CAPITAL LETTER OMICRON	# Omicron -->
<xsl:when test="$ftnum = 'Π'">F050</xsl:when>
<!--	# GREEK CAPITAL LETTER PI	# Pi -->
<xsl:when test="$ftnum = 'Θ'">F051</xsl:when>
<!--	# GREEK CAPITAL LETTER THETA	# Theta -->
<xsl:when test="$ftnum = 'Ρ'">F052</xsl:when>
<!--	# GREEK CAPITAL LETTER RHO	# Rho -->
<xsl:when test="$ftnum = 'Σ'">F053</xsl:when>
<!--	# GREEK CAPITAL LETTER SIGMA	# Sigma -->
<xsl:when test="$ftnum = 'Τ'">F054</xsl:when>
<!--	# GREEK CAPITAL LETTER TAU	# Tau -->
<xsl:when test="$ftnum = 'Υ'">F055</xsl:when>
<!--	# GREEK CAPITAL LETTER UPSILON	# Upsilon -->
<xsl:when test="$ftnum = 'ς'">F056</xsl:when>
<xsl:when test="$ftnum = 'Ω'">F057</xsl:when>
<!--	# GREEK CAPITAL LETTER OMEGA	# Omega -->
<xsl:when test="$ftnum = 'Ω'">F057</xsl:when>
<!--	# OHM SIGN # Omega -->
<xsl:when test="$ftnum = 'Ξ'">F058</xsl:when>
<!--	# GREEK CAPITAL LETTER XI	# Xi -->
<xsl:when test="$ftnum = 'Ψ'">F059</xsl:when>
<!--	# GREEK CAPITAL LETTER PSI	# Psi -->
<xsl:when test="$ftnum = 'Ζ'">F05A</xsl:when>
<!--	# GREEK CAPITAL LETTER ZETA	# Zeta -->
<xsl:when test="$ftnum = '&#x005B;'">F05B</xsl:when>
<!--	# LEFT SQUARE BRACKET	# bracketleft -->
<xsl:when test="$ftnum = '∴'">F05C</xsl:when>
<!--	# THEREFORE # therefore -->
<xsl:when test="$ftnum = '&#x005D;'">F05D</xsl:when>
<!--	# RIGHT SQUARE BRACKET	# bracketright -->
<xsl:when test="$ftnum = '⊥'">F05E</xsl:when>
<!--	# UP TACK # perpendicular -->
<xsl:when test="$ftnum = '&#x005F;'">F05F</xsl:when>
<!--	# LOW LINE # underscore -->
<xsl:when test="$ftnum = '&#xF8E5;'">F060</xsl:when>
<!--	# RADICAL EXTENDER	# radicalex (CUS) -->
<xsl:when test="$ftnum = 'α'">F061</xsl:when>
<!--	# GREEK SMALL LETTER ALPHA	# alpha -->
<xsl:when test="$ftnum = 'β'">F062</xsl:when>
<!--	# GREEK SMALL LETTER BETA	# beta -->
<xsl:when test="$ftnum = 'χ'">F063</xsl:when>
<!--	# GREEK SMALL LETTER CHI	# chi -->
<xsl:when test="$ftnum = 'δ'">F064</xsl:when>
<!--	# GREEK SMALL LETTER DELTA	# delta -->
<xsl:when test="$ftnum = 'ε'">F065</xsl:when>
<!--	# GREEK SMALL LETTER EPSILON	# epsilon -->
<xsl:when test="$ftnum = 'φ'">F066</xsl:when>
<!--	# GREEK SMALL LETTER PHI	# phi -->
<xsl:when test="$ftnum = 'γ'">F067</xsl:when>
<!--	# GREEK SMALL LETTER GAMMA	# gamma -->
<xsl:when test="$ftnum = 'η'">F068</xsl:when>
<!--	# GREEK SMALL LETTER ETA	# eta -->
<xsl:when test="$ftnum = 'ι'">F069</xsl:when>
<!--	# GREEK SMALL LETTER IOTA	# iota -->
<xsl:when test="$ftnum = 'φ'">F06A</xsl:when>
<!--	# GREEK PHI SYMBOL	# phi1 -->
<xsl:when test="$ftnum = 'κ'">F06B</xsl:when>
<!--	# GREEK SMALL LETTER KAPPA	# kappa -->
<xsl:when test="$ftnum = 'λ'">F06C</xsl:when>
<!--	# GREEK SMALL LETTER LAMDA	# lambda -->
<xsl:when test="$ftnum = 'µ'">F06D</xsl:when>
<!--	# MICRO SIGN # mu -->
<xsl:when test="$ftnum = 'μ'">F06D</xsl:when>
<!--	# GREEK SMALL LETTER MU	# mu -->
<xsl:when test="$ftnum = 'ν'">F06E</xsl:when>
<!--	# GREEK SMALL LETTER NU	# nu -->
<xsl:when test="$ftnum = 'ο'">F06F</xsl:when>
<!--	# GREEK SMALL LETTER OMICRON	# omicron -->
<xsl:when test="$ftnum = 'π'">F070</xsl:when>
<!--	# GREEK SMALL LETTER PI	# pi -->
<xsl:when test="$ftnum = 'θ'">F071</xsl:when>
<xsl:when test="$ftnum = 'ρ'">F072</xsl:when>
<!--	# GREEK SMALL LETTER RHO	# rho -->
<xsl:when test="$ftnum = 'σ'">F073</xsl:when>
<!--	# GREEK SMALL LETTER SIGMA	# sigma -->
<xsl:when test="$ftnum = 'τ'">F074</xsl:when>
<!--	# GREEK SMALL LETTER TAU	# tau -->
<xsl:when test="$ftnum = 'υ'">F075</xsl:when>
<!--	# GREEK SMALL LETTER UPSILON	# upsilon -->
<xsl:when test="$ftnum = 'ϖ'">F076</xsl:when>
<!--	# GREEK PI SYMBOL	# omega1 -->
<xsl:when test="$ftnum = 'ω'">F077</xsl:when>
<!--	# GREEK SMALL LETTER OMEGA	# omega -->
<xsl:when test="$ftnum = 'ξ'">F078</xsl:when>
<!--	# GREEK SMALL LETTER XI	# xi -->
<xsl:when test="$ftnum = 'ψ'">F079</xsl:when>
<!--	# GREEK SMALL LETTER PSI	# psi -->
<xsl:when test="$ftnum = 'ζ'">F07A</xsl:when>
<!--	# GREEK SMALL LETTER ZETA	# zeta -->
<xsl:when test="$ftnum = '&#x007B;'">F07B</xsl:when>
<!--	# LEFT CURLY BRACKET	# braceleft -->
<xsl:when test="$ftnum = '&#x007C;'">F07C</xsl:when>
<!--	# VERTICAL LINE	# bar -->
<xsl:when test="$ftnum = '&#x007D;'">F07D</xsl:when>
<!--	# RIGHT CURLY BRACKET	# braceright -->
<xsl:when test="$ftnum = '∼'">F07E</xsl:when>
<!--	# TILDE OPERATOR	# similar -->
<xsl:when test="$ftnum = '&#x20AC;'">F0A0</xsl:when>
<!--	# EURO SIGN # Euro -->
<xsl:when test="$ftnum = 'ϒ'">F0A1</xsl:when>
<!--	# GREEK UPSILON WITH HOOK SYMBOL	# Upsilon1 -->
<xsl:when test="$ftnum = '′'">F0A2</xsl:when>
<!--	# PRIME	# minute -->
<xsl:when test="$ftnum = '≤'">F0A3</xsl:when>
<!--	# LESS-THAN OR EQUAL TO	# lessequal -->
<xsl:when test="$ftnum = '&#x2044;'">F0A4</xsl:when>
<!--	# FRACTION SLASH	# fraction -->
<xsl:when test="$ftnum = '&#x2215;'">F0A4</xsl:when>
<!--	# DIVISION SLASH	# fraction -->
<xsl:when test="$ftnum = '∞'">F0A5</xsl:when>
<!--	# INFINITY # infinity -->
<xsl:when test="$ftnum = 'ƒ'">F0A6</xsl:when>
<!--	# LATIN SMALL LETTER F WITH HOOK	# florin -->
<xsl:when test="$ftnum = '♣'">F0A7</xsl:when>
<!--	# BLACK CLUB SUIT	# club -->
<xsl:when test="$ftnum = '♦'">F0A8</xsl:when>
<!--	# BLACK DIAMOND SUIT	# diamond -->
<xsl:when test="$ftnum = '♥'">F0A9</xsl:when>
<!--	# BLACK HEART SUIT	# heart -->
<xsl:when test="$ftnum = '♠'">F0AA</xsl:when>
<!--	# BLACK SPADE SUIT	# spade -->
<xsl:when test="$ftnum = '↔'">F0AB</xsl:when>
<!--	# LEFT RIGHT ARROW	# arrowboth -->
<xsl:when test="$ftnum = '←'">F0AC</xsl:when>
<!--	# LEFTWARDS ARROW	# arrowleft -->
<xsl:when test="$ftnum = '↑'">F0AD</xsl:when>
<!--	# UPWARDS ARROW	# arrowup -->
<xsl:when test="$ftnum = '→'">F0AE</xsl:when>
<!--	# RIGHTWARDS ARROW	# arrowright -->
<xsl:when test="$ftnum = '↓'">F0AF</xsl:when>
<!--	# DOWNWARDS ARROW	# arrowdown -->
<xsl:when test="$ftnum = '°'">F0B0</xsl:when>
<!--	# DEGREE SIGN # degree -->
<xsl:when test="$ftnum = '±'">F0B1</xsl:when>
<!--	# PLUS-MINUS SIGN	# plusminus -->
<xsl:when test="$ftnum = '″'">F0B2</xsl:when>
<!--	# DOUBLE PRIME # second -->
<xsl:when test="$ftnum = '≥'">F0B3</xsl:when>
<!--	# GREATER-THAN OR EQUAL TO	# greaterequal -->
<xsl:when test="$ftnum = '×'">F0B4</xsl:when>
<!--	# MULTIPLICATION SIGN	# multiply -->
<xsl:when test="$ftnum = '∝'">F0B5</xsl:when>
<!--	# PROPORTIONAL TO	# proportional -->
<xsl:when test="$ftnum = '∂'">F0B6</xsl:when>
<!--	# PARTIAL DIFFERENTIAL	# partialdiff -->
<xsl:when test="$ftnum = '•'">F0B7</xsl:when>
<!--	# BULLET # bullet -->
<xsl:when test="$ftnum = '÷'">F0B8</xsl:when>
<!--	# DIVISION SIGN	# divide -->
<xsl:when test="$ftnum = '≠'">F0B9</xsl:when>
<!--	# NOT EQUAL TO # notequal -->
<xsl:when test="$ftnum = '≡'">F0BA</xsl:when>
<!--	# IDENTICAL TO # equivalence -->
<xsl:when test="$ftnum = '≈'">F0BB</xsl:when>
<!--	# ALMOST EQUAL TO	# approxequal -->
<xsl:when test="$ftnum = '…'">F0BC</xsl:when>
<!--	# HORIZONTAL ELLIPSIS	# ellipsis -->
<xsl:when test="$ftnum = '&#xF8E6;'">F0BD</xsl:when>
<!--	# VERTICAL ARROW EXTENDER	# arrowvertex (CUS) -->
 <xsl:when test="$ftnum = '&amp;#xF0BE;'">F0BE</xsl:when>
<!--	# HORIZONTAL ARROW EXTENDER	# arrowhorizex (CUS) -->
<xsl:when test="$ftnum = '&#x21B5;'">F0BF</xsl:when>
<!--	# DOWNWARDS ARROW WITH CORNER LEFTWARDS	# carriagereturn -->
<xsl:when test="$ftnum = 'ℵ'">F0C0</xsl:when>
<!--	# ALEF SYMBOL # aleph -->
<xsl:when test="$ftnum = 'ℑ'">F0C1</xsl:when>
<!--	# BLACK-LETTER CAPITAL I	# Ifraktur -->
<xsl:when test="$ftnum = 'ℜ'">F0C2</xsl:when>
<!--	# BLACK-LETTER CAPITAL R	# Rfraktur -->
<xsl:when test="$ftnum = '℘'">F0C3</xsl:when>
<!--	# SCRIPT CAPITAL P	# weierstrass -->
<xsl:when test="$ftnum = '⊗'">F0C4</xsl:when>
<!--	# CIRCLED TIMES	# circlemultiply -->
<xsl:when test="$ftnum = '⊕'">F0C5</xsl:when>
<!--	# CIRCLED PLUS # circleplus -->
<xsl:when test="$ftnum = '∅'">F0C6</xsl:when>
<!--	# EMPTY SET # emptyset -->
<xsl:when test="$ftnum = '∩'">F0C7</xsl:when>
<!--	# INTERSECTION # intersection -->
<xsl:when test="$ftnum = '∪'">F0C8</xsl:when>
<!--	# UNION	# union -->
<xsl:when test="$ftnum = '⊃'">F0C9</xsl:when>
<!--	# SUPERSET OF # propersuperset -->
<xsl:when test="$ftnum = '⫆'">F0CA</xsl:when>
<!--	# SUPERSET OF OR EQUAL TO	# reflexsuperset -->
<xsl:when test="$ftnum = '⊄'">F0CB</xsl:when>
<!--	# NOT A SUBSET OF	# notsubset -->
<xsl:when test="$ftnum = '⊂'">F0CC</xsl:when>
<!--	# SUBSET OF # propersubset -->
<xsl:when test="$ftnum = '⫅'">F0CD</xsl:when>
<!--	# SUBSET OF OR EQUAL TO	# reflexsubset -->
<xsl:when test="$ftnum = '∈'">F0CE</xsl:when>
<!--	# ELEMENT OF # element -->
<xsl:when test="$ftnum = '∉'">F0CF</xsl:when>
<!--	# NOT AN ELEMENT OF	# notelement -->
<xsl:when test="$ftnum = '∠'">F0D0</xsl:when>
<!--	# ANGLE	# angle -->
<xsl:when test="$ftnum = '∇'">F0D1</xsl:when>
<!--	# NABLA	# gradient -->
<xsl:when test="$ftnum = '&#xF6DA;'">F0D2</xsl:when>
<!--	# REGISTERED SIGN SERIF	# registerserif (CUS) -->
<xsl:when test="$ftnum = '&#xF6D9;'">F0D3</xsl:when>
<!--	# COPYRIGHT SIGN SERIF	# copyrightserif (CUS) -->
<xsl:when test="$ftnum = '&#xF6DB;'">F0D4</xsl:when>
<!--	# TRADE MARK SIGN SERIF	# trademarkserif (CUS) -->
<xsl:when test="$ftnum = '∏'">F0D5</xsl:when>
<!--	# N-ARY PRODUCT	# product -->
<xsl:when test="$ftnum = '√'">F0D6</xsl:when>
<!--	# SQUARE ROOT # radical -->
<xsl:when test="$ftnum = '⋅'">F0D7</xsl:when>
<!--	# DOT OPERATOR # dotmath -->
<xsl:when test="$ftnum = '¬'">F0D8</xsl:when>
<!--	# NOT SIGN # logicalnot -->
<xsl:when test="$ftnum = '∧'">F0D9</xsl:when>
<!--	# LOGICAL AND # logicaland -->
<xsl:when test="$ftnum = '∨'">F0DA</xsl:when>
<!--	# LOGICAL OR # logicalor -->
<xsl:when test="$ftnum = '⇔'">F0DB</xsl:when>
<!--	# LEFT RIGHT DOUBLE ARROW	# arrowdblboth -->
<xsl:when test="$ftnum = '⇐'">F0DC</xsl:when>
<!--	# LEFTWARDS DOUBLE ARROW	# arrowdblleft -->
<xsl:when test="$ftnum = '⇑'">F0DD</xsl:when>
<!--	# UPWARDS DOUBLE ARROW	# arrowdblup -->
<xsl:when test="$ftnum = '&#x21D2;'">F0DE</xsl:when>
<!--	# RIGHTWARDS DOUBLE ARROW	# arrowdblright -->
<xsl:when test="$ftnum = '⇓'">F0DF</xsl:when>
<!--	# DOWNWARDS DOUBLE ARROW	# arrowdbldown -->
<xsl:when test="$ftnum = '◊'">F0E0</xsl:when>
<!--	# LOZENGE # lozenge -->
<xsl:when test="$ftnum = '&#x2329;'">F0E1</xsl:when>
<!--	# LEFT-POINTING ANGLE BRACKET	# angleleft -->
<xsl:when test="$ftnum = '&#xF8E8;'">F0E2</xsl:when>
<!--	# REGISTERED SIGN SANS SERIF	# registersans (CUS) -->
<xsl:when test="$ftnum = '&#xF8E9;'">F0E3</xsl:when>
<!--	# COPYRIGHT SIGN SANS SERIF	# copyrightsans (CUS) -->
<xsl:when test="$ftnum = '&#xF8EA;'">F0E4</xsl:when>
<!--	# TRADE MARK SIGN SANS SERIF	# trademarksans (CUS) -->
<xsl:when test="$ftnum = '∑'">F0E5</xsl:when>
<!--	# N-ARY SUMMATION	# summation -->
<xsl:when test="$ftnum = '&#xF8EB;'">F0E6</xsl:when>
<!--	# LEFT PAREN TOP	# parenlefttp (CUS) -->
<xsl:when test="$ftnum = '&#xF8EC;'">F0E7</xsl:when>
<!--	# LEFT PAREN EXTENDER	# parenleftex (CUS) -->
<xsl:when test="$ftnum = '&#xF8ED;'">F0E8</xsl:when>
<!--	# LEFT PAREN BOTTOM	# parenleftbt (CUS) -->
<xsl:when test="$ftnum = '&#xF8EE;'">F0E9</xsl:when>
<!--	# LEFT SQUARE BRACKET TOP	# bracketlefttp (CUS) -->
<xsl:when test="$ftnum = '&#xF8EF;'">F0EA</xsl:when>
<!--	# LEFT SQUARE BRACKET EXTENDER	# bracketleftex (CUS) -->
<xsl:when test="$ftnum = '&#xF8F0;'">F0EB</xsl:when>
<!--	# LEFT SQUARE BRACKET BOTTOM	# bracketleftbt (CUS) -->
<xsl:when test="$ftnum = '&#xF8F1;'">F0EC</xsl:when>
<!--	# LEFT CURLY BRACKET TOP	# bracelefttp (CUS) -->
<xsl:when test="$ftnum = '&#xF8F2;'">F0ED</xsl:when>
<!--	# LEFT CURLY BRACKET MID	# braceleftmid (CUS) -->
<xsl:when test="$ftnum = '&#xF8F3;'">F0EE</xsl:when>
<!--	# LEFT CURLY BRACKET BOTTOM	# braceleftbt (CUS) -->
<xsl:when test="$ftnum = '&#xF8F4;'">F0EF</xsl:when>
<!--	# CURLY BRACKET EXTENDER	# braceex (CUS) -->
<xsl:when test="$ftnum = '&#x232A;'">F0F1</xsl:when>
<!--	# RIGHT-POINTING ANGLE BRACKET	# angleright -->
<xsl:when test="$ftnum = '∫'">F0F2</xsl:when>
<!--	# INTEGRAL # integral -->
<xsl:when test="$ftnum = '&#x2320;'">F0F3</xsl:when>
<!--	# TOP HALF INTEGRAL	# integraltp -->
<xsl:when test="$ftnum = '&#xF8F5;'">F0F4</xsl:when>
<!--	# INTEGRAL EXTENDER	# integralex (CUS) -->
<xsl:when test="$ftnum = '&#x2321;'">F0F5</xsl:when>
<!--	# BOTTOM HALF INTEGRAL	# integralbt -->
<xsl:when test="$ftnum = '&#xF8F6;'">F0F6</xsl:when>
<!--	# RIGHT PAREN TOP	# parenrighttp (CUS) -->
<xsl:when test="$ftnum = '&#xF8F7;'">F0F7</xsl:when>
<!--	# RIGHT PAREN EXTENDER	# parenrightex (CUS) -->
<xsl:when test="$ftnum = '&#xF8F8;'">F0F8</xsl:when>
<!--	# RIGHT PAREN BOTTOM	# parenrightbt (CUS) -->
<xsl:when test="$ftnum = '&#xF8F9;'">F0F9</xsl:when>
<!--	# RIGHT SQUAREBRACKET TOP	# bracketrighttp (CUS) -->
<xsl:when test="$ftnum = '&#xF8FA;'">F0FA</xsl:when>
<!--	# RIGHT SQUARE BRACKET EXTENDER	# bracketrightex (CUS) -->
<xsl:when test="$ftnum = '&#xF8FB;'">F0FB</xsl:when>
<!--	# RIGHT SQUARE BRACKET BOTTOM	# bracketrightbt (CUS) -->
<xsl:when test="$ftnum = '&#xF8FC;'">F0FC</xsl:when>
<!--	# RIGHT CURLY BRACKET TOP	# bracerighttp (CUS) -->
<xsl:when test="$ftnum = '&#xF8FD;'">F0FD</xsl:when>
<!--	# RIGHT CURLY BRACKET MID	# bracerightmid (CUS) -->
<xsl:when test="$ftnum = '&#xF8FE;'">F0FE</xsl:when>
<!--	# RIGHT CURLY BRACKET BOTTOM	# bracerightbt (CUS) -->
<xsl:otherwise>
	<xsl:value-of select="$ftnum"/>
</xsl:otherwise>
</xsl:choose>


											<!--<xsl:value-of select="$ftnum"/>-->
											
										</xsl:attribute>
									</xsl:element>
								</xsl:if>
						</xsl:if>
						<!--End-->
						
					</xsl:element>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<!-- removing the footnote and comment contents from the HTML file(document.xml should not contain footnote paragraphs)-->
	<xsl:template
		match="footnote | div[@style = 'mso-element:footnote'] | div[@id = 'comment_'] | endnote | div[@style = 'mso-element:endnote'] | div[@id = 'footnote_'] | div[@id = 'endnote_'] | li[@style = 'mso-element:endnote'] | aside[@id = 'endnote_']|li[@style='mso-element:endnote' or @class='footnotecaption']|aside[@id = 'footnote_']"/>
	
	<!-- field Code conversion	-->
	<!-- this is causing problem when it has both fldchar and a href	-->
	<!--<xsl:template match="span[@data-fldChar]">
		<xsl:variable name="fldChar" select="@data-fldChar" as="xs:string"/>
		
	<!-\-	the value is usually begin or end	-\->
		<xsl:if test="string-length($fldChar) > 0">
			<w:r>
			<w:fldChar w:fldCharType="{$fldChar}"/>
			</w:r>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="span[@data-instrText][contains(.,' HYPERLINK ') and not(ancestor::a[@href])]">
		
		<xsl:variable name="fldinstrText" select="@data-instrText" as="xs:string"/>
		<xsl:variable name="fldText">
			<xsl:choose>
				<xsl:when test="starts-with($fldinstrText,' HYPERLINK ')">
					<xsl:variable name="replace" as="xs:string">
						<xsl:value-of select="' HYPERLINK &quot;'" disable-output-escaping="yes"/>
					</xsl:variable>
					<xsl:value-of select="replace($fldinstrText,' HYPERLINK ',$replace)"/>
					<xsl:value-of select="'&quot;'" disable-output-escaping="yes"/>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<xsl:if test="string-length($fldText) > 0">
			<w:r>
			<w:instrText xml:space="preserve"> <xsl:value-of select="$fldText"/></w:instrText>
			</w:r>
		</xsl:if>
	</xsl:template>
	-->
	
	<!-- field Code conversion	-->
	
	<xsl:template match="span[lower-case(@class) = 'page']">
		<xsl:variable name="id">
			<xsl:value-of select="1694958775 - position()"/>
		</xsl:variable>
		<xsl:variable name="DB"> </xsl:variable>
		<xsl:variable name="Alias">
			<xsl:value-of select="@class"/>
		</xsl:variable>
		<xsl:variable name="Tag">
			<xsl:value-of select="@class"/>
		</xsl:variable>
		<xsl:element name="w:sdt">
			<xsl:element name="w:sdtPr">
				<xsl:choose>
					<xsl:when test="not(string-length($Alias) = 0)">
						<xsl:element name="w:alias">
							<xsl:attribute name="w:val" select="$Alias"/>
						</xsl:element>
					</xsl:when>
				</xsl:choose>
				<xsl:choose>
					<xsl:when test="not(string-length($Tag) = 0)">
						<xsl:element name="w:tag">
							<xsl:attribute name="w:val" select="$Tag"/>
						</xsl:element>
					</xsl:when>
				</xsl:choose>
				<xsl:element name="w:id">
					<xsl:attribute name="w:val" select="$id"/>
				</xsl:element>
				<xsl:element name="w:placeholder">
					<xsl:element name="w:docPart">
						<xsl:attribute name="w:val" select="'DefaultPlaceholder_1081868574'"/>
					</xsl:element>
				</xsl:element>
			</xsl:element>
			<xsl:element name="w:sdtEndPr"/>
			<xsl:element name="w:sdtContent">
				<xsl:apply-templates/>
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<!-- XHTML div -->
	<xsl:template match="h1 | h2 | h3 | h4 | h5 | h6 | p | li">
		<xsl:param name="pPr_Default"/>
		<xsl:param name="rPr_Default"/>
		<xsl:variable name="pstyle">
			<xsl:variable name="dataName" select="@data-name"/>
			<xsl:variable name="class" select="@class"/>
			<xsl:choose>
				<!--	when the style is normal, we don't have to put it as style			-->
				<xsl:when test="(lower-case($dataName) = 'normal') or (lower-case($class) = 'normal')"/>
				<xsl:when test="@data-name and (string-length(@data-name) > 0)">
					<xsl:variable name="stylesCount"
						select="count($styles//w:style[w:name/@w:val = $dataName]/@w:styleId)"/>
					<xsl:choose>
						<xsl:when test="$stylesCount = 1">
							<xsl:value-of
								select="$styles//w:style[w:name/@w:val = $dataName]/@w:styleId"/>
						</xsl:when>
						<xsl:when test="$stylesCount > 1">
							<xsl:variable name="styleId">
								<xsl:variable name="sId" select="replace($dataName, '[\W\s]', '')"/>
								<xsl:for-each select="tokenize($class, ' ')">
									<xsl:if test="contains(replace(., '[\W\s]', ''), $sId)">
										<xsl:value-of select="."/>
									</xsl:if>
								</xsl:for-each>
							</xsl:variable>
							<xsl:choose>
								<xsl:when test="string-length($styleId) > 0">
									<xsl:variable name="id"
										select="$styles//w:style[@w:styleId = $styleId][1]/@w:styleId"/>
									<xsl:choose>
										<xsl:when test="string-length($id) > 0">
											<xsl:value-of select="$id"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of
												select="$styles//w:style[w:name/@w:val = $dataName][1]/@w:styleId"
											/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of
										select="$styles//w:style[w:name/@w:val = $dataName][1]/@w:styleId"
									/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:variable name="style"
								select="$styles//w:style[w:name/@w:val = $dataName]/@w:styleId"/>
							<xsl:choose>
								<xsl:when test="string-length($style) > 0">
									<xsl:value-of select="$style"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="$dataName"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:choose>
						<xsl:when test="@class and (string-length(@class) > 0)">
							<xsl:value-of
								select="$styles//w:style[w:name/@w:val = $class]/@w:styleId"/>
						</xsl:when>
						<xsl:otherwise>
							<!--  have to discuss about this condition     -->
						</xsl:otherwise>
					</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:element name="w:p">
			<xsl:element name="w:pPr">
				<xsl:if test="(string-length($pstyle) > 0)">
					<xsl:element name="w:pStyle">
						<!--<xsl:attribute name="w:val" select="@class"/>-->
						<xsl:attribute name="w:val" select="$pstyle"/>
					</xsl:element>
				</xsl:if>
				<!-- condition for list numpr   -->
				<xsl:if test="self::li">
					 <xsl:variable name="listID">
						<xsl:variable name="class" select="parent::ol/@class"/>
						<xsl:variable name="start" select="parent::ol/@start"/>
						<xsl:variable name="type" select="parent::ol/@type"/>
						<xsl:variable name="ListId" select="parent::ol/@listUID"/>
					 	<xsl:variable name="datalevel" select="parent::ol/@data-ilvl"/>
					 	<xsl:variable name="listUI" select="parent::ol/@listUID"/>
						<xsl:choose>
							<xsl:when test="parent::ol[(contains(@style, 'list-style-type: none'))]">
								<xsl:value-of select="0"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:choose>
									<xsl:when test="parent::ol/li[1] = self::li">
										
											<xsl:choose>
											<xsl:when test="$num//numId/ol[@listUID = $ListId]">
												<xsl:value-of
												select="$num//numId/ol[@listUID = $ListId]/@listUID"
												/>
												
											</xsl:when>
											<xsl:when
												test="$num//abstractNum/ol[@class = $class][@start = $start][@type = $type]">
												
												<xsl:value-of
													select="$num//abstractNum/ol[@class = $class][@start = $start][@type = $type][@data-ilvl=$datalevel][@listUID=$listUI]/@listUID"
												/>
												
												</xsl:when>
											<xsl:when
												test="$num//abstractNum/ol[@class = $class][@type = $type]">
												<xsl:value-of
												select="$num//abstractNum/ol[@class = $class][@type = $type][1]/@listUID"
												/>
											</xsl:when>
											<xsl:when
												test="$num//abstractNum/ol[@start = $start][@type = $type]">
												<xsl:value-of
												select="$num//abstractNum/ol[@start = $start][@type = $type]/@listUID"
												/>
												
											</xsl:when>
											<xsl:when test="$num//abstractNum/ol[@type = $type]">
												<xsl:value-of
												select="$num//abstractNum/ol[@type = $type][1]/@listUID"
												/>
											</xsl:when>
										</xsl:choose>
									</xsl:when>
									<xsl:otherwise>
										
										<xsl:choose>
											<xsl:when test="$num//numId/ol[@listUID = $ListId]">
												<xsl:value-of
												select="$num//numId/ol[@listUID = $ListId]/@listUID"
												/>
											</xsl:when>
											<xsl:when
												test="$num//abstractNum/ol[@class = $class][@type = $type]">
												<xsl:value-of
												select="$num//abstractNum/ol[@class = $class][@type = $type][1]/@listUID"
												/>
											</xsl:when>
											<xsl:when
												test="$num//abstractNum/ol[@start = $start][@type = $type]">
												<xsl:value-of
												select="$num//abstractNum/ol[@start = $start][@type = $type][1]/@listUID"
												/>
											</xsl:when>
											<xsl:when test="$num//abstractNum/ol[@type = $type]">
												<xsl:value-of
												select="$num//abstractNum/ol[@type = $type][1]/@listUID"
												/>
											</xsl:when>
											<xsl:otherwise>
												
											</xsl:otherwise>
										</xsl:choose>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					
					<xsl:variable name="listID1">
						<xsl:if test="parent::ul">
							<xsl:variable name="class" select="parent::ul/@class"/>
							<xsl:variable name="style" select="parent::ul/@style"/>
							<xsl:variable name="ListId" select="parent::ul/@listUID"/>
							<xsl:variable name="type" select="parent::ul/@type"/>
							<xsl:variable name="datalevel" select="parent::ul/@data-ilvl"/>
							<xsl:variable name="listUI" select="parent::ul/@listUID"/>
							<xsl:variable name="start" select="parent::ul/@start"/>
							
							<xsl:choose>
								<xsl:when
									test="parent::ul[(contains(@style, 'list-style-type: none'))]">
									<xsl:value-of select="'0'"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:choose>
										<xsl:when test="$num//numId/ul[@listUID = $ListId]">
											<xsl:value-of
												select="$num//numId/ul[@listUID = $ListId]/@listUID"
											/>
										</xsl:when>
										<xsl:when
											test="$num//abstractNum/ul[@class = $class][@start = $start][@type = $type]">
											
											<xsl:value-of
												select="$num//abstractNum/ul[@class = $class][@start = $start][@type = $type][@data-ilvl=$datalevel][@listUID=$listUI]/@listUID"
											/>
											
										</xsl:when>
																			
										<xsl:when test="$num//abstractNum/ul[@class = $class]">
											<xsl:value-of
												select="$num//abstractNum/ul[@class = $class]/@listUID"
											/>
										</xsl:when>
										<xsl:when test="$num//abstractNum/ul[@style = $style]">
											<xsl:value-of
												select="$num//abstractNum/ul[@style = $style]/@listUID"
											/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="ancestor::ul[1]/@listUID"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:if>
					</xsl:variable>
					<xsl:if test="parent::ol">
						
						<xsl:element name="w:numPr">
							<xsl:element name="w:ilvl">
								<!--<xsl:attribute name="w:val" select="'0'"/>-->
								<xsl:attribute name="w:val">
								<xsl:choose>
									<xsl:when test="parent::ol/@data-ilvl and string-length(parent::ol/@data-ilvl)">
										
										<xsl:value-of select="parent::ol/@data-ilvl"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="'0'"/>
									</xsl:otherwise>
								</xsl:choose>
								</xsl:attribute>
							</xsl:element>
							<xsl:element name="w:numId">
								<xsl:attribute name="w:val">
									<!--<xsl:value-of select="number($listID)"/>-->
									<xsl:variable name="uid"><xsl:value-of select="number($listID)"/></xsl:variable>
									
									<xsl:choose>
										<xsl:when test="not($uid='NaN')">
											<xsl:value-of select="$uid"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="'1'"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:attribute>
							</xsl:element>
						</xsl:element>
					</xsl:if>
					<xsl:if test="parent::ul">
						<xsl:element name="w:numPr">
							<xsl:element name="w:ilvl">
								<!--<xsl:attribute name="w:val" select="'0'"/>-->
								<xsl:attribute name="w:val">
								<xsl:choose>
									<xsl:when test="parent::ul/@data-ilvl and string-length(parent::ul/@data-ilvl)">
										<xsl:value-of select="parent::ul/@data-ilvl"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="'0'"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
							</xsl:element>
							<xsl:element name="w:numId">
								<xsl:attribute name="w:val">
									<!--<xsl:value-of select="number($listID1)"/>-->
									<xsl:variable name="uid"><xsl:value-of select="number($listID1)"/></xsl:variable>
									<xsl:choose>
										<xsl:when test="not($uid='NaN')">
											<xsl:value-of select="$uid"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="'1'"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:attribute>
							</xsl:element>
						</xsl:element>
					</xsl:if>
				</xsl:if>
				<!-- condition for list numpr   -->
				<!--<xsl:if test="@itemname">
     <xsl:choose>
      <xsl:when test="@itemname = 'deleted'">
       <xsl:element name="w:del"/>
      </xsl:when>
      <xsl:when test="@itemname ='inserted'">
       <xsl:element name="w:ins"/>
      </xsl:when>
     </xsl:choose>
     </xsl:if>-->
				<xsl:call-template name="apply-paragraph-formatting">
					<xsl:with-param name="pPr_Default">
						<xsl:copy-of select="$pPr_Default"/>
					</xsl:with-param>
				</xsl:call-template>
				<xsl:element name="w:rPr">
					<xsl:call-template name="apply-nested-character-formatting">
						<xsl:with-param name="rPr_Default" select="$rPr_Default"/>
					</xsl:call-template>
					<!-- this condition is given in the assumption of there will be only one delete tag as a child if the whole paragraph is deleted in the xhtml using ckeditior -->
					<!--<xsl:if test="count((descendant-or-self::*[not(self::del)]/text()|descendant-or-self::text()|descendant-or-self::img)) = 0 and not(count(descendant::*) = 0)">-->
					<xsl:if test="lower-case(@data-change) = 'paradeleted'">
						<xsl:element name="w:del">
							<xsl:attribute name="w:id">
								<xsl:number level="any"/>
							</xsl:attribute>
							<xsl:attribute name="w:author"
								select="descendant::del[1]/@data-username"/>
							<!--<xsl:attribute name="w:date" select="child::del[1]/@data-time"></xsl:attribute>-->
						</xsl:element>
					</xsl:if>
					<!-- this condition is given in the assumption of there will be only one inserted tag as a child if the whole paragraph is deleted in the xhtml using ckeditior -->
					<!--      <xsl:if test="count((descendant-or-self::*[not(self::ins)]/text()|descendant-or-self::text()|descendant-or-self::img)) = 0 and not(count(descendant::*) = 0)">-->
					<xsl:if test="lower-case(@data-change) = 'parainserted'">
						<xsl:element name="w:ins">
							<xsl:attribute name="w:id">
								<xsl:number level="any"/>
							</xsl:attribute>
							<xsl:attribute name="w:author"
								select="descendant::ins[1]/@data-username"/>
							<!--<xsl:attribute name="w:date" select="child::del[1]/@data-time"></xsl:attribute>-->
						</xsl:element>
					</xsl:if>
				</xsl:element>
			</xsl:element>
			<xsl:apply-templates select="* | text() except descendant::w:object|descendant::w:pict|descendant::math[child::math]">
				<xsl:with-param name="pPr_Default">
					<xsl:copy-of select="$pPr_Default"/>
				</xsl:with-param>
				<xsl:with-param name="rPr_Default">
					<xsl:copy-of select="$rPr_Default"/>
				</xsl:with-param>
			</xsl:apply-templates>
			<!--</xsl:if>-->
		</xsl:element>
	</xsl:template>
	
	<xsl:template
		match="img[@data-comment | @data-commentimg][(ancestor::*[@data-change = 'commentdeleted'])] | span[@data-comment | @data-commentimg][(ancestor::*[@data-change = 'commentdeleted'])]"/>
	
	
	
	<xsl:template match="a[contains(@id,'Reference')]">
		<xsl:choose>
			<xsl:when test="self::a[contains(@id,'Reference')]">
				
				<xsl:variable name="value" select="@id"/>
				<xsl:element name="w:sdt">
					<xsl:element name="w:sdtPr">
						<xsl:if test="string-length($value) > 0">
							<xsl:element name="w:alias">
								<xsl:attribute name="w:val" select="$value"/>
							</xsl:element>
						</xsl:if>
					</xsl:element>
					
					<xsl:apply-templates/>
					
				</xsl:element>
			</xsl:when>
			<xsl:otherwise>
				
				<xsl:apply-templates/>
				
			</xsl:otherwise>
		</xsl:choose>
		
	</xsl:template>
	
	<!--commented on 12-02-2021-->
	<!--<xsl:template
		match="img[@data-comment | @data-commentimg][not(ancestor::*[@data-change = 'commentdeleted'])] | span[@data-comment | @data-commentimg][not(ancestor::*[@data-change = 'commentdeleted'])]">
		
		<xsl:if test="@cmtId = 'true'">
			<xsl:element name="w:r">
				<xsl:element name="w:commentReference">
					<xsl:attribute name="w:id">
						<xsl:choose>
							<xsl:when test="img[@data-comment | @data-commentimg]">
								<xsl:number level="any" count="img[@data-comment | @data-commentimg]"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:number level="any" count="span[@data-comment | @data-commentimg]"/>
							</xsl:otherwise>
						</xsl:choose>
						<!-\-<xsl:number level="any" count="img[@data-comment | @data-commentimg]"/>-\->
						<!-\-     <xsl:value-of select="replace(self::img/@data-comment|self::img/@data-commentimg,'cmt','')"/>-\->
					</xsl:attribute>
				</xsl:element>
			</xsl:element>
		</xsl:if>
	</xsl:template>-->
	
	
	<!-- XHTML table -->
	<xsl:template match="table">
		<xsl:param name="pPr_Default"/>
		<xsl:param name="rPr_Default"/>
		<xsl:element name="w:tbl">
			 <w:tblPr>
			 	<w:tblpPr w:leftFromText="180" w:rightFromText="180" w:vertAnchor="text"
			 		w:horzAnchor="margin" w:tblpY="-25"/>
			 	<w:tblW w:w="9350" w:type="dxa"/>
			 	<!--Added w:start and w:end for border missing issue on 26-11-2020-->
    <w:tblBorders>
     <!--<w:top w:val="single"/>
     <!-\-<w:start w:val="single"/>-\->
     <w:left w:val="single"/>
     <w:bottom w:val="single"/>
     <!-\-<w:end w:val="single"/>-\->
     <w:right w:val="single"/>
     <!-\-<w:insideH w:val="single"/>
     <w:insideV w:val="single"/>-\->-->
    	<w:top w:val="single" w:sz="4" w:space="0" w:color="000000"/>
    	<w:left w:val="single" w:sz="4" w:space="0" w:color="000000"/>
    	<w:bottom w:val="single" w:sz="4" w:space="0" w:color="000000"/>
    	<w:right w:val="single" w:sz="4" w:space="0" w:color="000000"/>
    	<w:insideH w:val="single" w:sz="4" w:space="0" w:color="000000"/>
    	<w:insideV w:val="single" w:sz="4" w:space="0" w:color="000000"/>
    		
    </w:tblBorders>
			 	<w:tblCellMar>
			 		<w:left w:w="30" w:type="dxa"/>
			 		<w:right w:w="115" w:type="dxa"/>
			 	</w:tblCellMar>
			 	<w:tblLook w:val="0400" w:firstRow="0" w:lastRow="0" w:firstColumn="0"
			 	w:lastColumn="0" w:noHBand="0" w:noVBand="1"/>
   </w:tblPr>
			
			<w:tblGrid>
				<w:gridCol w:w="4676"/>
				<w:gridCol w:w="4674"/>
			</w:tblGrid>
	<!--   <xsl:if test="not(child::tbody/colgroup)">-->
			<xsl:if test="not(descendant::tbody[1]/colgroup)">
				<xsl:if test="not(child::colgroup)">
					<xsl:variable name="columnCount">
						<xsl:variable name="max">
							<xsl:choose>
								<xsl:when test="(tbody)">
									<xsl:value-of select="max(tbody/tr/count(child::td))"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="max(tr/count(child::td))"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="tr">
							<xsl:choose>
								<xsl:when test="(tbody)">
									<xsl:copy-of select="tbody/tr[count(child::td) = $max][1]"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:copy-of select="tr[count(child::td) = $max][1]"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:copy-of select="$tr"/>
					</xsl:variable>
					<xsl:element name="w:tblGrid">
						<xsl:for-each select="$columnCount//td">
							<xsl:variable name="CW" select="1"/>
							<xsl:element name="w:gridCol">
								<xsl:attribute name="w:w" select="$CW * 20"/>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
			</xsl:if>
			<xsl:apply-templates select="*">
				<xsl:with-param name="pPr_Default">
					<xsl:copy-of select="$pPr_Default"/>
				</xsl:with-param>
				<xsl:with-param name="rPr_Default">
					<xsl:copy-of select="$rPr_Default"/>
				</xsl:with-param>
			</xsl:apply-templates>
		</xsl:element>
	</xsl:template>
	<xsl:template match="tbody">
		<xsl:param name="pPr_Default"/>
		<xsl:param name="rPr_Default"/>
		<xsl:apply-templates select="*">
			<xsl:with-param name="pPr_Default">
				<xsl:copy-of select="$pPr_Default"/>
			</xsl:with-param>
			<xsl:with-param name="rPr_Default">
				<xsl:copy-of select="$rPr_Default"/>
			</xsl:with-param>
		</xsl:apply-templates>
	</xsl:template>
	<xsl:template match="tr">
		<xsl:param name="pPr_Default"/>
		<xsl:param name="rPr_Default"/>
		<xsl:element name="w:tr">
			<xsl:apply-templates select="*">
				<xsl:with-param name="pPr_Default">
					<xsl:copy-of select="$pPr_Default"/>
				</xsl:with-param>
				<xsl:with-param name="rPr_Default">
					<xsl:copy-of select="$rPr_Default"/>
				</xsl:with-param>
			</xsl:apply-templates>
		</xsl:element>
	</xsl:template>
	<xsl:template match="td">
		<xsl:param name="pPr_Default"/>
		<xsl:param name="rPr_Default"/>
		<xsl:variable name="cellNum" select="@cellNumber"/>
		<xsl:element name="w:tc">
			<xsl:element name="w:tcPr">
				<xsl:if test="@colspan > 1">
					<xsl:element name="w:gridSpan">
						<xsl:attribute name="w:val" select="@colspan"/>
					</xsl:element>
				</xsl:if>
				<xsl:choose>
					<xsl:when test="./@vMerge = 'restart'">
						<xsl:element name="w:vMerge">
							<xsl:attribute name="w:val" select="'restart'"/>
						</xsl:element>
					</xsl:when>
					<xsl:when test="./@vMerge = 'continue'">
						<xsl:element name="w:vMerge"/>
					</xsl:when>
				</xsl:choose>
                                <!--td color on 26-03-2025-->
				<xsl:if test="@style[contains(.,'background:')]">
					<xsl:element name="w:shd">
						<xsl:attribute name="w:val" select="'clear'"/>
						<xsl:attribute name="w:color"><xsl:value-of select="'000000'"/></xsl:attribute>
						<xsl:attribute name="w:fill"><xsl:value-of select="substring-before(substring-after(@style,'background:#'),';')"/></xsl:attribute>
					</xsl:element>
				</xsl:if>
			</xsl:element>
			<xsl:choose>
				<xsl:when
					test="descendant::h1 | descendant::h2 | descendant::h3 | descendant::h4 | descendant::h5 | descendant::h6 | descendant::p | descendant::li">
					<xsl:apply-templates select="* | text()">
						<xsl:with-param name="pPr_Default">
							<xsl:copy-of select="$pPr_Default"/>
						</xsl:with-param>
						<xsl:with-param name="rPr_Default">
							<xsl:copy-of select="$rPr_Default"/>
						</xsl:with-param>
						<xsl:sort select="parent::td/@cellNumber"/>
					</xsl:apply-templates>
					<xsl:if
						test="not(child::h1 | child::h2 | child::h3 | child::h4 | child::h5 | child::h6 | child::p | child::li)">
						<xsl:element name="w:p">
							<!--<xsl:apply-templates select="* | text()">
        <xsl:with-param name="pPr_Default"><xsl:copy-of select="$pPr_Default"/></xsl:with-param>
        <xsl:with-param name="rPr_Default"><xsl:copy-of select="$rPr_Default"/></xsl:with-param>
        <xsl:sort select="parent::td/@cellNumber"/>
       </xsl:apply-templates>-->
							<xsl:variable name="name">
								<xsl:value-of select="'Story_X2W_CellPara_'"/>
								<xsl:number level="any"/>
							</xsl:variable>
							<!--<xsl:element name="w:bookmarkStart">
								<xsl:attribute name="w:id">
									<xsl:number level="any"/>
								</xsl:attribute>
								<xsl:attribute name="w:name" select="$name"/>
							</xsl:element>
							<xsl:element name="w:bookmarkEnd">
								<xsl:attribute name="w:id">
									<xsl:number level="any"/>
								</xsl:attribute>
							</xsl:element>-->
						</xsl:element>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<xsl:element name="w:p">
						<xsl:apply-templates select="* | text()">
							<xsl:with-param name="pPr_Default">
								<xsl:copy-of select="$pPr_Default"/>
							</xsl:with-param>
							<xsl:with-param name="rPr_Default">
								<xsl:copy-of select="$rPr_Default"/>
							</xsl:with-param>
							<xsl:sort select="parent::td/@cellNumber"/>
						</xsl:apply-templates>
					</xsl:element>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
	</xsl:template>
	<xsl:template match="colgroup">
		<xsl:param name="pPr_Default"/>
		<xsl:param name="rPr_Default"/>
		<xsl:element name="w:tblGrid">
			<xsl:apply-templates select="*">
				<xsl:with-param name="pPr_Default">
					<xsl:copy-of select="$pPr_Default"/>
				</xsl:with-param>
				<xsl:with-param name="rPr_Default">
					<xsl:copy-of select="$rPr_Default"/>
				</xsl:with-param>
			</xsl:apply-templates>
		</xsl:element>
	</xsl:template>
	<xsl:template match="col">
		<xsl:param name="pPr_Default"/>
		<xsl:param name="rPr_Default"/>
		<xsl:choose>
			<xsl:when test="contains(@style, 'WIDTH: ')">
				<xsl:element name="w:gridCol">
					<xsl:attribute name="w:w">
						<xsl:value-of
							select="substring-before(substring-after(@style, 'WIDTH: '), 'px')"/>
					</xsl:attribute>
				</xsl:element>
			</xsl:when>
			<xsl:otherwise>
				<xsl:element name="w:gridCol">
					<xsl:attribute name="w:w" select="20"/>
				</xsl:element>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- XHTML img -->
	<xsl:template match="img[@src][not(@data-comment | @data-commentimg)]">
		<xsl:param name="pPr_Default"/>
		<xsl:param name="rPr_Default"/>
		<xsl:variable name="H">
			<xsl:choose>
				<xsl:when test="@height">
					<xsl:value-of select="round((@height * 12700) cast as xs:decimal)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="round((10 * 12700) cast as xs:decimal)"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="W">
			<xsl:choose>
				<xsl:when test="@width">
					<xsl:value-of select="round((@width * 12700) cast as xs:decimal)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="round((10 * 12700) cast as xs:decimal)"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="id">
			<xsl:variable name="num">
				<xsl:number level="any"/>
			</xsl:variable>
			<xsl:value-of select="10 + $num"/>
		</xsl:variable>
		<xsl:variable name="IMG">
			<xsl:choose>
				<xsl:when test="contains(@src, '/')">
					<xsl:variable name="imgName" select="substring-after(@src, '/')"/>
					<xsl:value-of select="$imgName"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="@src"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:if test="self::img[not(@data-imgid)][@src[not(contains(.,'embeddings'))]]">
		<xsl:choose>
			<xsl:when
				test="ancestor::h1 | ancestor::h2 | ancestor::h3 | ancestor::h4 | ancestor::h5 | ancestor::h6 | ancestor::p | ancestor::li">
				<xsl:element name="w:r">
					<xsl:element name="w:rPr">
						<!-- <xsl:call-template name="apply-nested-character-formatting">
       <xsl:with-param name="rPr_Default"><xsl:copy-of select="$rPr_Default"/></xsl:with-param>
      </xsl:call-template>-->
					</xsl:element>
					<xsl:element name="w:drawing">
						<xsl:element name="wp:inline">
							<xsl:attribute name="distT" select="'0'"/>
							<xsl:attribute name="distB" select="'0'"/>
							<xsl:attribute name="distL" select="'0'"/>
							<xsl:attribute name="distR" select="'0'"/>
							<xsl:element name="wp:extent">
								<xsl:attribute name="cx" select="$W"/>
								<xsl:attribute name="cy" select="$H"/>
							</xsl:element>
							<xsl:element name="wp:effectExtent">
								<xsl:attribute name="l" select="'0'"/>
								<xsl:attribute name="t" select="'0'"/>
								<xsl:attribute name="r" select="'0'"/>
								<xsl:attribute name="b" select="'0'"/>
							</xsl:element>
							<!--@@@@@@@@@@ Wrap Top and Bottom @@@@@@@@@@@-->
							<!--<xsl:element name="wp:wrapTopAndBottom"/>-->
							<!--@@@@@@@@@@ Wrap Top and Bottom @@@@@@@@@@@-->
							<xsl:element name="wp:docPr">
								<!--<xsl:attribute name="id" select="(floor(math:random()*1000) mod 1000) + 1" />-->
								<xsl:attribute name="id">
									<xsl:call-template name="create-seed"/>
								</xsl:attribute>
								<xsl:attribute name="name" select="$IMG"/>
							</xsl:element>
							<xsl:element name="wp:cNvGraphicFramePr">
								<xsl:element name="a:graphicFrameLocks">
									<xsl:attribute name="noChangeAspect" select="'1'"/>
								</xsl:element>
							</xsl:element>
							<xsl:element name="a:graphic">
								<xsl:element name="a:graphicData">
									<xsl:attribute name="uri"
										select="'http://schemas.openxmlformats.org/drawingml/2006/picture'"/>
									<xsl:element name="pic:pic">
										<xsl:element name="pic:nvPicPr">
											<xsl:element name="pic:cNvPr">
												<xsl:attribute name="id" select="'0'"/>
												<xsl:attribute name="name" select="$IMG"/>
											</xsl:element>
											<xsl:element name="pic:cNvPicPr"/>
										</xsl:element>
										<xsl:element name="pic:blipFill">
											<xsl:element name="a:blip">
												<xsl:attribute name="r:embed"
												select="concat('rId', $id)"/>
												<xsl:element name="a:extLst">
												<xsl:element name="a:ext">
												<xsl:attribute name="uri"
												select="'{28A0092B-C50C-407E-A947-70E740481C1C}'"/>
												<xsl:element name="a14:useLocalDpi">
												<xsl:attribute name="val" select="'0'"/>
												</xsl:element>
												</xsl:element>
												</xsl:element>
											</xsl:element>
											<xsl:element name="a:stretch">
												<xsl:element name="a:fillRect"/>
											</xsl:element>
										</xsl:element>
										<xsl:element name="pic:spPr">
											<xsl:element name="a:xfrm">
												<xsl:element name="a:off">
												<xsl:attribute name="x" select="'0'"/>
												<xsl:attribute name="y" select="'0'"/>
												</xsl:element>
												<xsl:element name="a:ext">
												<xsl:attribute name="cx" select="$W"/>
												<xsl:attribute name="cy" select="$H"/>
												</xsl:element>
											</xsl:element>
											<xsl:element name="a:prstGeom">
												<xsl:attribute name="prst" select="'rect'"/>
												<xsl:element name="a:avLst"/>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:element>
				</xsl:element>
			</xsl:when>
			<xsl:otherwise>
				<xsl:element name="w:p">
					<xsl:element name="w:pPr">
						<xsl:call-template name="apply-paragraph-formatting">
							<xsl:with-param name="pPr_Default">
								<xsl:copy-of select="$rPr_Default"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:element>
					<xsl:element name="w:r">
						<xsl:element name="w:rPr">
							<!-- <xsl:call-template name="apply-nested-character-formatting">
        <xsl:with-param name="rPr_Default"><xsl:copy-of select="$rPr_Default"/></xsl:with-param>
       </xsl:call-template>-->
						</xsl:element>
						<xsl:element name="w:drawing">
							<xsl:element name="wp:inline">
								<xsl:attribute name="distT" select="'0'"/>
								<xsl:attribute name="distB" select="'0'"/>
								<xsl:attribute name="distL" select="'0'"/>
								<xsl:attribute name="distR" select="'0'"/>
								<xsl:element name="wp:extent">
									<xsl:attribute name="cx" select="$W"/>
									<xsl:attribute name="cy" select="$H"/>
								</xsl:element>
								<xsl:element name="wp:effectExtent">
									<xsl:attribute name="l" select="'0'"/>
									<xsl:attribute name="t" select="'0'"/>
									<xsl:attribute name="r" select="'0'"/>
									<xsl:attribute name="b" select="'0'"/>
								</xsl:element>
								<!--@@@@@@@@@@ Wrap Top and Bottom @@@@@@@@@@@-->
								<!--<xsl:element name="wp:wrapTopAndBottom"/>-->
								<!--@@@@@@@@@@ Wrap Top and Bottom @@@@@@@@@@@-->
								<xsl:element name="wp:docPr">
									<!--<xsl:attribute name="id" select="(floor(math:random()*1000) mod 1000) + 1" />-->
									<xsl:attribute name="id">
										<xsl:call-template name="create-seed"/>
									</xsl:attribute>
									<xsl:attribute name="name" select="$IMG"/>
								</xsl:element>
								<xsl:element name="wp:cNvGraphicFramePr">
									<xsl:element name="a:graphicFrameLocks">
										<xsl:attribute name="noChangeAspect" select="'1'"/>
									</xsl:element>
								</xsl:element>
								<xsl:element name="a:graphic">
									<xsl:element name="a:graphicData">
										<xsl:attribute name="uri"
											select="'http://schemas.openxmlformats.org/drawingml/2006/picture'"/>
										<xsl:element name="pic:pic">
											<xsl:element name="pic:nvPicPr">
												<xsl:element name="pic:cNvPr">
												<xsl:attribute name="id" select="'0'"/>
												<xsl:attribute name="name" select="$IMG"/>
												</xsl:element>
												<xsl:element name="pic:cNvPicPr"/>
											</xsl:element>
											<xsl:element name="pic:blipFill">
												<xsl:element name="a:blip">
												<xsl:attribute name="r:embed"
												select="concat('rId', $id)"/>
												<xsl:element name="a:extLst">
												<xsl:element name="a:ext">
												<xsl:attribute name="uri"
												select="'{28A0092B-C50C-407E-A947-70E740481C1C}'"/>
												<xsl:element name="a14:useLocalDpi">
												<xsl:attribute name="val" select="'0'"/>
												</xsl:element>
												</xsl:element>
												</xsl:element>
												</xsl:element>
												<xsl:element name="a:stretch">
												<xsl:element name="a:fillRect"/>
												</xsl:element>
											</xsl:element>
											<xsl:element name="pic:spPr">
												<xsl:element name="a:xfrm">
												<xsl:element name="a:off">
												<xsl:attribute name="x" select="'0'"/>
												<xsl:attribute name="y" select="'0'"/>
												</xsl:element>
												<xsl:element name="a:ext">
												<xsl:attribute name="cx" select="$W"/>
												<xsl:attribute name="cy" select="$H"/>
												</xsl:element>
												</xsl:element>
												<xsl:element name="a:prstGeom">
												<xsl:attribute name="prst" select="'rect'"/>
												<xsl:element name="a:avLst"/>
												</xsl:element>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:element>
				</xsl:element>
			</xsl:otherwise>
		</xsl:choose>
		</xsl:if>
		<!--<xsl:if test="self::img[@src[contains(.,'embeddings')]]">
			<xsl:variable name="id">
				<xsl:value-of select="self::img/substring-before(substring-after(substring-after(@src,'/'),'oleObject'),'.bin')"/>
			</xsl:variable>
			<xsl:element name="w:object">
				<xsl:element name="v:shape">
					<xsl:attribute name="id" select="'_x0000_i1026'"/>
					<xsl:attribute name="type" select="'#_x0000_t75'"/>
					<xsl:attribute name="style" select="'width:130.8pt;height:30pt'"/>
					<xsl:attribute name="o:ole" select="''"/>
					<xsl:element name="v:imagedata">
						<xsl:attribute name="r:id" select="concat('rId', $id)"/>
						<xsl:attribute name="o:title" select="''"/>
					</xsl:element>
				</xsl:element>
				<xsl:element name="o:OLEObject">
					<xsl:attribute name="Type" select="'Embed'"/>
					<xsl:attribute name="ProgID" select="'Equation.DSMT4'"/>
					<xsl:attribute name="ShapeID" select="'_x0000_i1026'"/>
					<xsl:attribute name="DrawAspect" select="'Content'"/>
					<xsl:attribute name="ObjectID" select="'_1783425662'"/>
					<xsl:attribute name="r:id" select="concat('rId', $id)"/>
				</xsl:element>
			</xsl:element>
			<!-\-<w:object w:dxaOrig="2600" w:dyaOrig="620" w14:anchorId="340DD129">
				<v:shape id="_x0000_i1026" type="#_x0000_t75" style="width:130.8pt;height:30pt"
					o:ole="">
					<v:imagedata r:id="rId7" o:title=""/>
				</v:shape>
				<o:OLEObject Type="Embed" ProgID="Equation.DSMT4" ShapeID="_x0000_i1026"
					DrawAspect="Content" ObjectID="_1783425662" r:id="rId8"/>
			</w:object>-\->
		</xsl:if>-->
	</xsl:template>
	<xsl:template name="create-seed">
		<xsl:param name="string" select="generate-id()"/>
		<xsl:param name="preliminary-seed" select="100000"/>
		<xsl:param name="maximum-value" select="10000000000"/>
		<xsl:variable name="name-chars"
			select="':ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz-.0123456789'"/>
		<xsl:choose>
			<xsl:when test="string-length($string) != 0">
				<xsl:call-template name="create-seed">
					<xsl:with-param name="string" select="substring($string, 2)"/>
					<xsl:with-param name="preliminary-seed"
						select="
							($preliminary-seed + string-length(
							
							substring-before($name-chars, substring($string, 1, 1))
							)
							) mod $maximum-value"/>
					<xsl:with-param name="maximum-value" select="$maximum-value"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$preliminary-seed"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="span[contains(@style, 'padding-left:')][@data-tab='true']">
		<xsl:variable name="tabSize" as="xs:string">
			<xsl:variable name="val" select="substring-before(substring-after(replace(lower-case(@style),' ',''), 'padding-left:'), 'px')" as="xs:string"/>
			<xsl:value-of select="string(round((number($val) div 1.33)) * 20)"/>
		</xsl:variable>
		<w:r><w:tab w:val="left" w:pos="{$tabSize}"></w:tab></w:r>
		<!--	to remove the empty space given "word to xhtml" process for ckEditor purpose, commented the below apply-templates	-->
		<!--<xsl:apply-templates/>-->
	</xsl:template>
	<xsl:template match="span[@data-commentrange]">
		<xsl:variable name="commentId" as="xs:string*">
			<xsl:choose>
				<xsl:when test="@cmdId">
					<xsl:value-of select="@cmdId"/>
				</xsl:when>
				<xsl:when test="@data-comment">
					<xsl:value-of select="@data-comment"/>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="commentRange" as="xs:string*" select="@data-commentrange"/>
		<xsl:if test=".[((@commentRangeStart = 'true') or ($commentRange = 'cmtStart')) and (string-length($commentId) > 0)]">
			<w:r>
				<w:commentRangeStart w:id="{$commentId}"/>
			</w:r>
		</xsl:if>
		<xsl:apply-templates/>
		<xsl:if test=".[((@commentRangeEnd = 'true') or ($commentRange = 'cmtEnd')) and (string-length($commentId) > 0)]">
			<w:r>
				<w:commentRangeEnd w:id="{$commentId}"/>
			</w:r>
		</xsl:if>
	</xsl:template>
	<xsl:template
		match="span[@style][not((lower-case(@class) = 'msofootnotereference'))][not((lower-case(@class) = 'endnotereference') or (lower-case(@class) = 'EndnoteNumber'))][not(contains(@style, 'padding-left:'))][not(@data-instrText)][not(@data-fldChar)][not(@data-commentrange)]">
		<xsl:param name="pPr_Default"/>
		<xsl:param name="rPr_Default"/>
		
		
		<xsl:apply-templates>
			<xsl:with-param name="pPr_Default">
				<xsl:copy-of select="$pPr_Default"/>
			</xsl:with-param>
			<xsl:with-param name="rPr_Default">
				<xsl:copy-of select="$rPr_Default"/>
			</xsl:with-param>
		</xsl:apply-templates>
	</xsl:template>
	<!-- client don't want bokmark  on 24-9-2024-->
	<!-- <xsl:template match="span[@name]| span[@data-bkmark]"> -->
	<xsl:template match="span[contains(@data-bkmark,'para')][ancestor::div[1]/contains(@id,'smr') or ancestor::div[1]/contains(@id,'Headref')]">
		<xsl:variable name="name" select="@data-bkmark | @name"/>
		<!--  <xsl:choose>-->
		<xsl:if
			test="self::span[@data-bkmark = $name][count(./preceding::span[@data-bkmark = $name]) = 0]">
			<xsl:element name="w:bookmarkStart">
				<xsl:attribute name="w:id">
					<xsl:value-of select="@bkmarkID"/>
				</xsl:attribute>
				<xsl:attribute name="w:name" select="$name"/>
			</xsl:element>
		</xsl:if>
		<xsl:if
			test="self::span[@data-bkmark = $name][count(./following::span[@data-bkmark = $name]) = 0]">
			<xsl:element name="w:bookmarkEnd">
				<xsl:attribute name="w:id">
					<xsl:value-of
						select="//span[@data-bkmark = $name][count(./preceding::span[@data-bkmark = $name]) = 0]/@bkmarkID"
					/>
				</xsl:attribute>
			</xsl:element>
		</xsl:if>
		<!-- end -->
		<!--<xsl:otherwise>
    <xsl:element name="w:bookmarkStart">
     <xsl:attribute name="w:id">
      <xsl:number level="any"/>
     </xsl:attribute>
     <xsl:attribute name="w:name" select="$name"/>
    </xsl:element>
    <xsl:apply-templates/>
    <xsl:element name="w:bookmarkEnd">
     <xsl:attribute name="w:id">
      <xsl:number level="any"/>
     </xsl:attribute>
    </xsl:element>
   </xsl:otherwise>-->
		<!--</xsl:choose>-->
	</xsl:template>
	<xsl:template
		match="*[@data-alias | @data-boxname | @data-boxtag | @data-id | @data-tag][not(self::p | self::li)] | a[@data-alias | @data-boxname | @data-boxtag | @data-id | @data-tag]">
		<xsl:variable name="id">
			<xsl:variable name="idkey">
				<xsl:choose>
					<xsl:when test="@data-id">
						<xsl:choose>
							<xsl:when test="string-length(@data-id) = 0">
								<xsl:value-of select="1694958775 - position()"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="@data-id"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
				</xsl:choose>
			</xsl:variable>
			<xsl:choose>
				<xsl:when test="string-length($idkey) = 0">
					<xsl:value-of select="1694958775 - position()"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$idkey"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="Alias">
			<xsl:choose>
				<xsl:when test="@data-alias or @data-boxname">
					<xsl:choose>
						<xsl:when test="not(string-length(@data-alias) = 0)">
							<xsl:value-of select="@data-alias"/>
						</xsl:when>
						<xsl:when test="not(string-length(@data-boxname) = 0)">
							<xsl:value-of select="@data-boxname"/>
						</xsl:when>
					</xsl:choose>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="Tag">
			<xsl:choose>
				<xsl:when test="@data-tag or @data-boxtag">
					<xsl:choose>
						<xsl:when test="not(string-length(@data-tag) = 0)">
							<xsl:value-of select="@data-tag"/>
						</xsl:when>
						<xsl:when test="not(string-length(@data-boxtag) = 0)">
							<xsl:value-of select="@data-boxtag"/>
						</xsl:when>
					</xsl:choose>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<xsl:element name="w:sdt">
			<xsl:element name="w:sdtPr">
				<xsl:choose>
					<xsl:when test="not(string-length($Alias) = 0)">
						<xsl:element name="w:alias">
							<xsl:attribute name="w:val" select="$Alias"/>
						</xsl:element>
					</xsl:when>
				</xsl:choose>
				<xsl:choose>
					<xsl:when test="not(string-length($Tag) = 0)">
						<xsl:element name="w:tag">
							<xsl:attribute name="w:val" select="$Tag"/>
						</xsl:element>
					</xsl:when>
				</xsl:choose>
				<xsl:element name="w:id">
					<xsl:attribute name="w:val" select="$id"/>
				</xsl:element>
				<xsl:element name="w:placeholder">
					<xsl:element name="w:docPart">
						<xsl:attribute name="w:val" select="'DefaultPlaceholder_1081868574'"/>
					</xsl:element>
				</xsl:element>
			</xsl:element>
			<xsl:element name="w:sdtEndPr"/>
			<xsl:element name="w:sdtContent">
				<xsl:apply-templates/>
				
				<!-- for loose leaf -->
				<!-- for loose leaf -->
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<!-- soft enter-->
	<xsl:template match="br">
		<xsl:choose>
			<xsl:when test="@data-change">
				<xsl:element name="w:ins">
					<xsl:attribute name="w:id">
						<xsl:number level="any"/>
					</xsl:attribute>
					<!--<xsl:attribute name="w:author" select="child::ins[1]/@data-username"/>-->
					<!--<xsl:attribute name="w:date" select="child::del[1]/@data-time"></xsl:attribute>-->
					<xsl:element name="w:r">
						<xsl:element name="w:br"/>
					</xsl:element>
				</xsl:element>
			</xsl:when>
			<xsl:otherwise>
				<xsl:element name="w:r">
					<xsl:element name="w:br">
						<xsl:if test="@data-type">
							<xsl:attribute name="w:type" select="@data-type"/>
						</xsl:if>
					</xsl:element>
				</xsl:element>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- XHTML hyperlink -->
	<xsl:template match="a[@href[not(contains(.,'BibRef'))] and not(contains(@class, 'footnotecitation') or contains(@href,'#ftnref') or contains(@class, 'endnotecitation')) and not(ancestor::span[(lower-case(@class) = 'endnotereference') or (lower-case(@class) = 'EndnoteNumber')])][not(@data-alias | @data-boxname | @data-boxtag | @data-id | @data-tag)][not(ancestor::del)]">
		<xsl:param name="pPr_Default"/>
		<xsl:param name="rPr_Default"/>
		<w:r>
			<w:fldChar w:fldCharType="{'begin'}"/>
		</w:r>
		<w:r>
			<w:instrText xml:space="preserve"><xsl:value-of select="' HYPERLINK &quot;'" disable-output-escaping="yes"/><xsl:value-of select="@href"/><xsl:value-of select="'&quot;'" disable-output-escaping="yes"/></w:instrText>
		</w:r>
		<w:r>
			<w:fldChar w:fldCharType="separate"/>
		</w:r>
		<xsl:apply-templates/>
		<!--<xsl:element name="w:hyperlink">
			<xsl:attribute name="w:anchor" select="@href"/>
			<xsl:apply-templates>
				<xsl:with-param name="pPr_Default">
					<xsl:copy-of select="$pPr_Default"/>
				</xsl:with-param>
				<xsl:with-param name="rPr_Default">
					<xsl:copy-of select="$rPr_Default"/>
				</xsl:with-param>
			</xsl:apply-templates>
		</xsl:element>-->
		<w:r>
			<w:fldChar w:fldCharType="{'end'}"/>
		</w:r>
	</xsl:template>
	<xsl:template match="a[ancestor::del][@href[not(contains(.,'BibRef'))] and not(contains(@class, 'footnotecitation') or contains(@href,'#ftnref') or contains(@class, 'endnotecitation')) and not(ancestor::span[(lower-case(@class) = 'endnotereference') or (lower-case(@class) = 'EndnoteNumber')])][not(@data-alias | @data-boxname | @data-boxtag | @data-id | @data-tag)]">
		<xsl:param name="pPr_Default"/>
		<xsl:param name="rPr_Default"/>
		<w:r>
			<w:fldChar w:fldCharType="{'begin'}"/>
		</w:r>
		<w:r>
			<w:delText xml:space="preserve"><xsl:value-of select="' HYPERLINK &quot;'" disable-output-escaping="yes"/><xsl:value-of select="@href"/><xsl:value-of select="'&quot;'" disable-output-escaping="yes"/></w:delText>
		</w:r>
		<w:r>
			<w:fldChar w:fldCharType="separate"/>
		</w:r>
		<xsl:apply-templates/>
		<!--<xsl:element name="w:hyperlink">
			<xsl:attribute name="w:anchor" select="@href"/>
			<xsl:apply-templates>
				<xsl:with-param name="pPr_Default">
					<xsl:copy-of select="$pPr_Default"/>
				</xsl:with-param>
				<xsl:with-param name="rPr_Default">
					<xsl:copy-of select="$rPr_Default"/>
				</xsl:with-param>
			</xsl:apply-templates>
		</xsl:element>-->
		<w:r>
			<w:fldChar w:fldCharType="{'end'}"/>
		</w:r>
	</xsl:template>
	<!--<xsl:template match="text()">
  <xsl:param name="rPr_Default"/>
  <xsl:element name="w:r">
   <xsl:element name="w:rPr">
    <xsl:if test="./ancestor::span[@class] and ./ancestor::span[(string-length(@class) &gt; 0)]">
     <xsl:element name="w:rStyle">
      <xsl:attribute name="w:val" select="./ancestor::span/@class"/>
     </xsl:element>
    </xsl:if>
    <xsl:call-template name="apply-nested-character-formatting">
     <xsl:with-param name="rPr_Default"><xsl:copy-of select="$rPr_Default"/></xsl:with-param>
    </xsl:call-template>
   </xsl:element>
   <xsl:element name="w:t">
    <xsl:attribute name="xml:space" select="'preserve'"/>
    <xsl:value-of select="."/>
   </xsl:element>
  </xsl:element>
 </xsl:template>-->
	<!-- <xsl:template match="text()[not(parent::body) and not(parent::td) and not(parent::table) and not(parent::tbody)and not(parent::span[child::tr]) and not(parent::tgroup)]">-->
	<xsl:template match="div[@data-type = 'textbox']">
		<xsl:variable name="Conc"
			select="'width:393.6pt;height:64.3pt;mso-wrap-style:none;mso-left-percent:-10001;mso-top-percent:-10001;mso-position-horizontal:absolute;mso-position-horizontal-relative:char;mso-position-vertical:absolute;mso-position-vertical-relative:line;mso-left-percent:-10001;mso-top-percent:-10001'"/>
		<!--        <xsl:if test="following-sibling::*[1]/name() = 'Content'">
            <xsl:text disable-output-escaping="yes">&lt;/w:r&gt;</xsl:text>
        </xsl:if>-->
		<xsl:choose>
			<xsl:when
				test="not(ancestor::h1 | ancestor::h2 | ancestor::h3 | ancestor::h4 | ancestor::h5 | ancestor::h6 | ancestor::p | ancestor::li)">
				<xsl:element name="w:p">
				<xsl:element name="w:r">
						<xsl:element name="w:pict">
							<xsl:element name="v:shapetype">
								<xsl:attribute name="id" select="'_x0000_t202'"/>
								<xsl:attribute name="coordsize" select="'21600,21600'"/>
								<xsl:attribute name="o:spt" select="'202'"/>
								<xsl:attribute name="path" select="'m,l,21600r21600,l21600,xe'"/>
								<xsl:element name="v:stroke">
									<xsl:attribute name="joinstyle" select="'miter'"/>
								</xsl:element>
								<xsl:element name="v:path">
									<xsl:attribute name="gradientshapeok" select="'t'"/>
									<xsl:attribute name="o:connecttype" select="'rect'"/>
								</xsl:element>
							</xsl:element>
							<xsl:element name="v:shape">
								<xsl:attribute name="id" select="@data-id"/>
								<xsl:attribute name="o:spid" select="'_x0000_s1152'"/>
								<xsl:attribute name="type" select="'#_x0000_t202'"/>
								<xsl:attribute name="style" select="$Conc"/>
								<xsl:attribute name="stroked" select="'f'"/>
								<xsl:attribute name="strokecolor" select="'white [3212]'"/>
								<xsl:element name="v:textbox">
									<xsl:attribute name="style" select="'mso-fit-shape-to-text:t'"/>
									<xsl:attribute name="inset" select="'0,0,0,0'"/>
									<xsl:element name="w:txbxContent">
										<xsl:apply-templates/>
									</xsl:element>
								</xsl:element>
								<xsl:element name="w10:wrap">
									<!--<xsl:attribute name="type" select="'topAndBottom'"/>-->
									<xsl:attribute name="type" select="'tight'"/>
								</xsl:element>
								<!--<xsl:element name="w10:anchorlock"/>-->
							</xsl:element>
						</xsl:element>
					</xsl:element>
				</xsl:element>
			</xsl:when>
			<xsl:otherwise>
				<xsl:element name="w:r">
					<xsl:element name="w:pict">
						<xsl:element name="v:shapetype">
							<xsl:attribute name="id" select="'_x0000_t202'"/>
							<xsl:attribute name="coordsize" select="'21600,21600'"/>
							<xsl:attribute name="o:spt" select="'202'"/>
							<xsl:attribute name="path" select="'m,l,21600r21600,l21600,xe'"/>
							<xsl:element name="v:stroke">
								<xsl:attribute name="joinstyle" select="'miter'"/>
							</xsl:element>
							<xsl:element name="v:path">
								<xsl:attribute name="gradientshapeok" select="'t'"/>
								<xsl:attribute name="o:connecttype" select="'rect'"/>
							</xsl:element>
						</xsl:element>
						<xsl:element name="v:shape">
							<xsl:attribute name="id" select="@data-id"/>
							<xsl:attribute name="o:spid" select="'_x0000_s1152'"/>
							<xsl:attribute name="type" select="'#_x0000_t202'"/>
							<xsl:attribute name="style" select="$Conc"/>
							<xsl:attribute name="stroked" select="'f'"/>
							<xsl:attribute name="strokecolor" select="'white [3212]'"/>
							<xsl:element name="v:textbox">
								<xsl:attribute name="style" select="'mso-fit-shape-to-text:t'"/>
								<xsl:attribute name="inset" select="'0,0,0,0'"/>
								<xsl:element name="w:txbxContent">
									<xsl:apply-templates/>
								</xsl:element>
							</xsl:element>
							<xsl:element name="w10:wrap">
								<!--<xsl:attribute name="type" select="'topAndBottom'"/>-->
								<xsl:attribute name="type" select="'tight'"/>
							</xsl:element>
							<!--<xsl:element name="w10:anchorlock"/>-->
						</xsl:element>
					</xsl:element>
				</xsl:element>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="text()">
		<xsl:param name="rPr_Default"/>
		<!--   <xsl:if test="not(./parent::body)">-->
		<!--   <xsl:if test="string-length(.) &gt; 0">-->
		<xsl:variable name="cstyle">
			<xsl:variable name="dataName" select="./ancestor::span[@data-name][1]/@data-name"/>
			<xsl:variable name="class" select="./ancestor::span[@class][1]/@class"/>
			<xsl:choose>
				<xsl:when test="./ancestor::span[@data-name][1] and (string-length($dataName) > 0)">
					<xsl:value-of select="$styles//w:style[w:name/@w:val = $dataName][1]/@w:styleId"
					/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:choose>
						<xsl:when test="./ancestor::span[@class][1] and (string-length($class) > 0)">
							<xsl:value-of
								select="$styles//w:style[w:name/@w:val = $class][1]/@w:styleId"/>
						</xsl:when>
						<xsl:otherwise>
							<!--   if there is no data-name and class in the element there is no style in the element-->
						</xsl:otherwise>
					</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:choose>
			<xsl:when
				test="not(ancestor::h1 | ancestor::h2 | ancestor::h3 | ancestor::h4 | ancestor::h5 | ancestor::h6 | ancestor::p | ancestor::li)">
				<xsl:element name="w:p">
					<xsl:element name="w:r">
						<xsl:element name="w:rPr">
							<!--    <xsl:if test="./ancestor::span[@class] and ./ancestor::span[(string-length(@class) &gt; 0)]">-->
							<xsl:if test="(string-length($cstyle) > 0)">
								<xsl:element name="w:rStyle">
									<xsl:attribute name="w:val" select="$cstyle"/>
								</xsl:element>
							</xsl:if>
							<xsl:call-template name="apply-nested-character-formatting">
								<xsl:with-param name="rPr_Default">
									<xsl:copy-of select="$rPr_Default"/>
								</xsl:with-param>
							</xsl:call-template>
							<xsl:if test="./ancestor::*[@data-change = 'changestyle']">
								<xsl:element name="w:rPrChange">
									<xsl:attribute name="w:id">
										<xsl:number level="any"/>
									</xsl:attribute>
								</xsl:element>
							</xsl:if>
						</xsl:element>
						<xsl:choose>
							<xsl:when test="ancestor::del">
								<xsl:element name="w:delText">
									<xsl:attribute name="xml:space" select="'preserve'"/>
									<xsl:value-of select="."/>
								</xsl:element>
							</xsl:when>
							<xsl:otherwise>
								<xsl:element name="w:t">
									<xsl:attribute name="xml:space" select="'preserve'"/>
									<xsl:value-of select="."/>
								</xsl:element>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:element>
				</xsl:element>
			</xsl:when>
			<xsl:otherwise>
				<xsl:element name="w:r">
					<xsl:element name="w:rPr">
						<!--    <xsl:if test="./ancestor::span[@class] and ./ancestor::span[(string-length(@class) &gt; 0)]">-->
						<xsl:if test="(string-length($cstyle) > 0)">
							<xsl:element name="w:rStyle">
								<xsl:attribute name="w:val" select="$cstyle"/>
							</xsl:element>
						</xsl:if>
						<xsl:call-template name="apply-nested-character-formatting">
							<xsl:with-param name="rPr_Default">
								<xsl:copy-of select="$rPr_Default"/>
							</xsl:with-param>
						</xsl:call-template>
						<xsl:if test="./ancestor::*[@data-change = 'changestyle']">
							<xsl:element name="w:rPrChange">
								<xsl:attribute name="w:id">
									<xsl:number level="any"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:if>
					</xsl:element>
					<xsl:choose>
						<xsl:when test="ancestor::del">
							<xsl:element name="w:delText">
								<xsl:attribute name="xml:space" select="'preserve'"/>
								<xsl:value-of select="."/>
							</xsl:element>
						</xsl:when>
						<xsl:otherwise>
							<xsl:element name="w:t">
								<xsl:attribute name="xml:space" select="'preserve'"/>
								<xsl:value-of select="."/>
							</xsl:element>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:element>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="ins">
		<xsl:param name="pPr_Default"/>
		<xsl:param name="rPr_Default"/>
		<xsl:choose>
			<xsl:when test="ancestor::del | ancestor::ins">
				<xsl:apply-templates>
					<xsl:with-param name="pPr_Default">
						<xsl:copy-of select="$pPr_Default"/>
					</xsl:with-param>
					<xsl:with-param name="rPr_Default">
						<xsl:copy-of select="$rPr_Default"/>
					</xsl:with-param>
				</xsl:apply-templates>
			</xsl:when>
			<xsl:otherwise>
				<xsl:element name="w:ins">
					<xsl:attribute name="w:id">
						<xsl:number level="any"/>
					</xsl:attribute>
					<xsl:attribute name="w:author" select="@data-username"/>
					<!--     <xsl:attribute name="w:date" select="@datetime"/>-->
					<!--  <xsl:apply-templates/>-->
					<xsl:apply-templates>
						<xsl:with-param name="pPr_Default">
							<xsl:copy-of select="$pPr_Default"/>
						</xsl:with-param>
						<xsl:with-param name="rPr_Default">
							<xsl:copy-of select="$rPr_Default"/>
						</xsl:with-param>
					</xsl:apply-templates>
				</xsl:element>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="del">
		<xsl:param name="pPr_Default"/>
		<xsl:param name="rPr_Default"/>
		<xsl:choose>
			<xsl:when test="ancestor::del | ancestor::ins">
				<xsl:apply-templates>
					<xsl:with-param name="pPr_Default">
						<xsl:copy-of select="$pPr_Default"/>
					</xsl:with-param>
					<xsl:with-param name="rPr_Default">
						<xsl:copy-of select="$rPr_Default"/>
					</xsl:with-param>
				</xsl:apply-templates>
			</xsl:when>
			<xsl:otherwise>
				<xsl:element name="w:del">
					<xsl:attribute name="w:id">
						<xsl:number level="any"/>
					</xsl:attribute>
					<xsl:attribute name="w:author" select="@data-username"/>
					<!--<xsl:attribute name="w:date" select="@datetime"/>-->
					<!--   <xsl:apply-templates/>-->
					<xsl:apply-templates>
						<xsl:with-param name="pPr_Default">
							<xsl:copy-of select="$pPr_Default"/>
						</xsl:with-param>
						<xsl:with-param name="rPr_Default">
							<xsl:copy-of select="$rPr_Default"/>
						</xsl:with-param>
					</xsl:apply-templates>
				</xsl:element>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- XHTML nested character formatting -->
	<xsl:template name="apply-nested-character-formatting">
		<xsl:param name="rPr_Default"/>
		<!-- apply default character formatting first -->
		<xsl:copy-of select="$rPr_Default"/>
		<!-- incase the paragraph itself deleted or newly inserted  -->
		<xsl:if test="self::*/@itemname">
			<xsl:choose>
				<xsl:when test="self::*/@itemname = 'deleted'">
					<xsl:element name="w:del">
						<xsl:attribute name="w:id">
							<xsl:number level="any"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:when>
				<xsl:when test="self::*/@itemname = 'inserted'">
					<xsl:element name="w:ins">
						<xsl:attribute name="w:id">
							<xsl:number level="any"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:when>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="ancestor::font/@face or ancestor-or-self::*[contains(@style, 'font-family:')]">
			<xsl:choose>
				<xsl:when test="ancestor::font/@face">
					<xsl:element name="w:rFonts">
						<xsl:attribute name="w:ascii">
							<xsl:value-of select="ancestor::font/@face"/>
						</xsl:attribute>
						<xsl:attribute name="w:hAnsi">
							<xsl:value-of select="ancestor::font/@face"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:when>
				<xsl:when test="ancestor-or-self::*[contains(@style, 'font-family:')]">
					<xsl:variable name="font">
						<xsl:choose>
							<xsl:when
								test="contains(substring-after(ancestor-or-self::*[contains(@style, 'font-family:')][1]/@style, 'font-family:'), ';')">
								<!--<xsl:value-of select="substring-before(substring-after(ancestor-or-self::*[contains(@style,'font-family:')]/@style,'font-family:'),';')"/>-->
								<xsl:value-of
									select='substring-before(substring-after(ancestor-or-self::*[contains(@style, "font-family:")][1]/@style, "font-family:"), ";")'
								/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of
									select='substring-after(ancestor-or-self::*[contains(@style, "font-family:")][1]/@style, "font-family:")'
								/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="fontAttrName">
						<xsl:variable name="tempAttrName">
							<xsl:variable name="tempAttrNameVal">
								<xsl:choose>
									<xsl:when
										test="contains(substring-before(ancestor-or-self::*[contains(@style, '-font-family:')][1]/@style, '-font-family:'), ';')">
										<xsl:value-of
											select='substring-after(substring-before(ancestor-or-self::*[contains(@style, "-font-family:")][1]/@style, "-font-family:"), ";")'
										/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select='substring-before(ancestor-or-self::*[contains(@style, "-font-family:")][1]/@style, "-font-family:")'
										/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							
							<xsl:choose>
								<xsl:when test="contains($tempAttrNameVal,'style=')">
									<xsl:value-of select="substring-after(substring-after($tempAttrNameVal, 'style='),'mso-')"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="replace($tempAttrNameVal,'mso-','')"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						
						<xsl:choose>
							<xsl:when test="string-length($tempAttrName) > 0">
<!--								example w:eastAsia-->
								
								<!--to avoid font issues 24-5-2019-->
								<xsl:choose>
									<xsl:when test="contains($tempAttrName, 'fareast')">
										
										<xsl:value-of select="concat('w:','eastAsia' )"/>
									</xsl:when>
									<xsl:otherwise>
										
										<xsl:value-of select="concat('w:',normalize-space($tempAttrName))"/>
									</xsl:otherwise>
								</xsl:choose>
								<!--End-->
								
								
								
								
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="'w:ascii'"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:element name="w:rFonts">
						<xsl:attribute name="{$fontAttrName}">
							<xsl:value-of select="$font"/>
						</xsl:attribute>
						<!--<xsl:attribute name="w:hAnsi">
							<xsl:value-of select="$font"/>
						</xsl:attribute>-->
					</xsl:element>
				</xsl:when>
			</xsl:choose>
		</xsl:if>
		<!--  or *[self::h1|self::h2|self::h3|self::h4|self::h5|self::h6|self::p|self::li] -->
		<xsl:variable name="fontWeight">
			<xsl:choose>
				<xsl:when
					test="contains(substring-after(ancestor-or-self::*[contains(@style, 'font-weight:')][1]/@style, 'font-weight:'), ';')">
					<xsl:value-of
						select='substring-before(substring-after(ancestor-or-self::*[contains(@style, "font-weight:")][1]/@style, "font-weight:"), ";")'
					/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of
						select='substring-after(ancestor-or-self::*[contains(@style, "font-weight:")][1]/@style, "font-weight:")'
					/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="fontStyle">
			<xsl:choose>
				<xsl:when
					test="contains(substring-after(ancestor-or-self::*[contains(@style, 'font-style:')][1]/@style, 'font-style:'), ';')">
					<xsl:value-of
						select='substring-before(substring-after(ancestor-or-self::*[contains(@style, "font-style:")][1]/@style, "font-style:"), ";")'
					/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of
						select='substring-after(ancestor-or-self::*[contains(@style, "font-style:")][1]/@style, "font-style:")'
					/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
                <xsl:variable name="inlinesuperscript-or-inlinesubscript">
			<xsl:choose>
				<xsl:when test="contains(substring-after(ancestor-or-self::*[contains(@style, 'vertical-align:')][1]/@style, 'vertical-align:'), ';')">
					<xsl:value-of select='substring-before(substring-after(ancestor-or-self::*[contains(@style, "vertical-align:")][1]/@style, "vertical-align:"), ";")'/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select='substring-after(ancestor-or-self::*[contains(@style, "vertical-align:")][1]/@style, "vertical-align:")'/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<!--	commenting this because shade and highlight in xhtml is using the same property to display	-->
		<xsl:variable name="highlight">
			<xsl:choose>
				<xsl:when
					test="contains(substring-after(ancestor-or-self::*[contains(@style, 'background-color:')][1]/@style, 'background-color:'), ';')">
					<xsl:value-of
						select='substring-before(substring-after(ancestor-or-self::*[contains(@style, "background-color:")][1]/@style, "background-color:"), ";")'
					/>
					</xsl:when>
				<xsl:otherwise>
					<xsl:value-of
						select='substring-after(ancestor-or-self::*[contains(@style, "background-color:")][1]/@style, "background-color:")'
					/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:if test="string-length($highlight) > 0">
			<!--<w:highlight w:val="{$highlight}"/>-->
			<xsl:if test="matches($highlight,'^#([a-z]+)$|^([a-z]+)$') and not(matches($highlight,'^#([a-z])([a-z])([a-z])([a-z])([a-z])([a-z])$'))">
			<xsl:element name="w:highlight">
				<xsl:attribute name="w:val">
					<xsl:choose>
						<xsl:when test="matches($highlight,'^#([a-z]+)$|^([a-z]+)$')">
							<xsl:value-of select="replace($highlight,'#','')"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$highlight"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</xsl:element>
			</xsl:if>
		</xsl:if>
		<xsl:if test="ancestor::i or ancestor::em or ancestor::emphasis or ancestor::Emphasis or $fontStyle = 'italic' or lower-case($fontStyle) = 'emphasis'">
			<xsl:element name="w:i"/>
		</xsl:if>
		<xsl:if test="ancestor::b or ancestor::strong or ancestor::Strong or $fontWeight = 'bold'">
			<xsl:element name="w:b"/>
		</xsl:if>
		<xsl:if test="ancestor::u|ancestor::U">
			<xsl:element name="w:u">
				<xsl:attribute name="w:val" select="'single'"/>
			</xsl:element>
		</xsl:if>
		<xsl:if test="ancestor::strike | ancestor::s">
			<xsl:element name="w:strike"/>
		</xsl:if>
		<xsl:choose>
			<xsl:when
				test="ancestor-or-self::*[contains(@style, 'text-decoration: line-through double')][1]">
				<w:dstrike/>
			</xsl:when>
		</xsl:choose>
		<xsl:if test="ancestor-or-self::*[contains(@style, 'font-variant: small-caps')]">
			<w:smallCaps/>
		</xsl:if>
		<xsl:if test="ancestor-or-self::*[contains(@style, 'text-transform: uppercase')]">
			<w:caps/>
		</xsl:if>
		<xsl:if test="ancestor::sup">
			<xsl:element name="w:vertAlign">
				<xsl:attribute name="w:val" select="'superscript'"/>
			</xsl:element>
		</xsl:if>
                <xsl:if test="matches(lower-case($inlinesuperscript-or-inlinesubscript) , 'super')">
			<xsl:element name="w:vertAlign">
				<xsl:attribute name="w:val" select="'superscript'"/>
			</xsl:element>
		</xsl:if>
		<xsl:if test="ancestor::sub">
			<xsl:element name="w:vertAlign">
				<xsl:attribute name="w:val" select="'subscript'"/>
			</xsl:element>
		</xsl:if>
                <xsl:if test="matches(lower-case($inlinesuperscript-or-inlinesubscript), 'sub')">
			<xsl:element name="w:vertAlign">
				<xsl:attribute name="w:val" select="'subscript'"/>
			</xsl:element>
		</xsl:if>
		<xsl:if
			test="ancestor::font/@color or ancestor-or-self::*[contains(@style, 'color:#') or contains(@style, 'color: #')][not(contains(@style, 'background-color:#') or contains(@style, 'background-color: #'))]">
			<xsl:variable name="color">
				<xsl:choose>
					<xsl:when test="ancestor::font/@color">
						<xsl:value-of select="ancestor::font/@color"/>
					</xsl:when>
					<xsl:when
						test="ancestor-or-self::*[contains(@style, 'color:#') or contains(@style, 'color: #')]">
						<xsl:variable name="font">
							<xsl:choose>
								<xsl:when
									test="contains(substring-after(ancestor-or-self::*[contains(@style, 'color:#')][1]/@style, 'color:#'), ';')">
									<xsl:value-of
										select='substring-before(substring-after(ancestor-or-self::*[contains(@style, "color:#")][1]/@style, "color:#"), ";")'
									/>
								</xsl:when>
								<xsl:when
									test="contains(substring-after(ancestor-or-self::*[contains(@style, 'color: #')][1]/@style, 'color: #'), ';')">
									<xsl:value-of
										select='substring-before(substring-after(ancestor-or-self::*[contains(@style, "color: #")][1]/@style, "color: #"), ";")'
									/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:if
										test="ancestor-or-self::*[contains(@style, 'color:#')][1]">
										<xsl:value-of
											select='substring-after(ancestor-or-self::*[contains(@style, "color:#")][1]/@style, "color:#")'
										/>
									</xsl:if>
									<xsl:if
										test="ancestor-or-self::*[contains(@style, 'color: #')][1]">
										<xsl:value-of
											select='substring-after(ancestor-or-self::*[contains(@style, "color: #")][1]/@style, "color: #")'
										/>
									</xsl:if>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:value-of select="$font"/>
					</xsl:when>
				</xsl:choose>
			</xsl:variable>
			
			<xsl:element name="w:color">
				<xsl:attribute name="w:val">
					<xsl:value-of select="$color"/>
				</xsl:attribute>
			</xsl:element>
			<!--End-->
		</xsl:if>
		<xsl:if test="ancestor-or-self::*[contains(lower-case(@style), 'background-color:') or contains(lower-case(@style), 'background:')]">
			
			<xsl:variable name="styleProp" select="replace(ancestor-or-self::*[contains(lower-case(@style), 'background-color:') or contains(lower-case(@style), 'background:')][1]/lower-case(@style),' ','')"/>
			
			<xsl:variable name="bgC">
				<xsl:choose>
					<xsl:when test="contains(lower-case($styleProp), 'background-color:#') or contains(lower-case($styleProp), 'background:#')">
						<xsl:choose>
							<xsl:when test="contains($styleProp, ';')">
								
								<!--<xsl:value-of
									select="substring-before(substring-after($styleProp, 'background-color:#'), ';')"/>
								<xsl:value-of select="substring-before(substring-after($styleProp, 'background:#'), ';')"/>-->
								
									<xsl:variable name="Val1">
										<xsl:value-of
											select="substring-after($styleProp, 'background-color:#')"/>
									</xsl:variable>
									<xsl:variable name="Val2">
										<xsl:value-of select="substring-after($styleProp, 'background:#')"/>
									</xsl:variable>
									<xsl:choose>
										<xsl:when test="contains($Val1,';') or contains($Val2,';')">
											<xsl:value-of select="substring-before($Val1,';')"/>
											<xsl:value-of select="substring-before($Val2,';')"/>
										</xsl:when>
										
										<xsl:otherwise>
											<xsl:value-of select="$Val1"/>
											<xsl:value-of select="$Val2"/>
											
										</xsl:otherwise>
									</xsl:choose>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="substring-after($styleProp, 'background-color:#')"/>
								<xsl:value-of select="substring-after($styleProp, 'background:#')"/>
								
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						
						<xsl:variable name="tempVal">
							<xsl:choose>
								<xsl:when test="contains($styleProp, ';')">
									<!--<xsl:value-of
										select="substring-before(substring-after($styleProp, 'background-color:'), ';')"/>
									<xsl:value-of select="substring-before(substring-after($styleProp, 'background:'), ';')"/>-->
									<xsl:variable name="Val1">
										<xsl:value-of
											select="substring-after($styleProp, 'background-color:')"/>
									</xsl:variable>
									<xsl:variable name="Val2">
										<xsl:value-of select="substring-after($styleProp, 'background:')"/>
									</xsl:variable>
									<xsl:choose>
										<xsl:when test="contains($Val1,';') or contains($Val2,';')">
											<xsl:value-of select="substring-before($Val1,';')"/>
											<xsl:value-of select="substring-before($Val2,';')"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="$Val1"/>
											<xsl:value-of select="$Val2"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:when>
								<xsl:otherwise>
									
									<xsl:value-of select="substring-after($styleProp, 'background-color:')"/>
									<xsl:value-of select="substring-after($styleProp, 'background:')"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:value-of select="$tempVal"/>
						<xsl:call-template name="color">
							<xsl:with-param name="colorVal" select="$tempVal"></xsl:with-param>
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
		</xsl:if>
		<xsl:if test="ancestor::font/@size or ancestor-or-self::*[contains(@style, 'font-size:')]">
			<xsl:element name="w:sz">
				<xsl:attribute name="w:val">
					<xsl:choose>
						<xsl:when test="ancestor::font/@size = 1">16</xsl:when>
						<xsl:when test="ancestor::font/@size = 2">20</xsl:when>
						<xsl:when test="ancestor::font/@size = 3">24</xsl:when>
						<xsl:when test="ancestor::font/@size = 4">28</xsl:when>
						<xsl:when test="ancestor::font/@size = 5">36</xsl:when>
						<xsl:when test="ancestor::font/@size = 6">48</xsl:when>
						<xsl:when test="ancestor::font/@size = 7">72</xsl:when>
						<xsl:when test="ancestor-or-self::*[contains(@style, 'font-size:')]">
							<xsl:variable name="font">
								<xsl:choose>
									<xsl:when
										test="contains(substring-after(ancestor-or-self::*[contains(@style, 'font-size:')][1]/@style, 'font-size:'), ';')">
										<!--<xsl:value-of select="substring-before(substring-after(.[ancestor::span|self::h1|self::h2|self::h3|self::h4|self::h5|self::h6|self::p|self::li][contains(@style,'font-family:')]/@style,'font-family:'),';')"/>-->
										<xsl:value-of
											select='substring-before(substring-after(ancestor-or-self::*[contains(@style, "font-size:")][1]/@style, "font-size:"), ";")'
										/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select='substring-after(ancestor-or-self::*[contains(@style, "font-size:")][1]/@style, "font-size:")'
										/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:choose>
								<xsl:when test="starts-with(lower-case($font),'nan')">
									<xsl:value-of select="'10pt'"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="$font"/>
								</xsl:otherwise>
							</xsl:choose>
							
						</xsl:when>
					</xsl:choose>
				</xsl:attribute>
			</xsl:element>
		</xsl:if>
		<!--<xsl:if test="ancestor-or-self::*[@style][1]/@style">
			<xsl:call-template name="apply-font-style-definition">
				<xsl:with-param name="instyle">
					<xsl:value-of select="ancestor-or-self::*[@style][1]/@style"/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:if>-->
	</xsl:template>
	<!-- XHTML style formatting -->
	<xsl:template name="apply-font-style-definition">
		<xsl:param name="instyle"/>
		<xsl:if test="contains(lower-case($instyle), 'background-color:')">
			<xsl:variable name="bgC">
				<xsl:choose>
					<xsl:when test="contains(lower-case($instyle), 'background-color: #')">
						<xsl:choose>
							<xsl:when test="contains($instyle, ';')">
								<!--<xsl:value-of
									select="substring-before(substring-after($instyle, 'background-color: #'), ';')"/>-->
								
								<xsl:variable name="Val1">
									<xsl:value-of
										select="substring-after($instyle, 'background-color: #')"/>
								</xsl:variable>
								<xsl:choose>
									<xsl:when test="contains($Val1,';')">
										<xsl:value-of select="substring-before($Val1,';')"/>
								   </xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="$Val1"/>
										</xsl:otherwise>
								</xsl:choose>					
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="substring-after($instyle, 'background-color: #')"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<xsl:variable name="tempVal">
							<xsl:choose>
								<xsl:when test="contains($instyle, ';')">
									<!--<xsl:value-of
										select="substring-before(substring-after($instyle, 'background-color:'), ';')"/>-->
									<xsl:variable name="Val1"><xsl:value-of
										select="substring-after($instyle, 'background-color:')"/></xsl:variable>
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
									<xsl:value-of select="substring-after($instyle, 'background-color:')"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
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
		</xsl:if>
	</xsl:template>
	<!-- XHTML paragraph formatting -->
	<xsl:template name="apply-paragraph-formatting">
		<xsl:param name="pPr_Default"/>
		<!-- apply default paragraph formatting first -->
		<xsl:copy-of select="$pPr_Default"/>
		<xsl:if
			test="self::*[contains(@style, 'text-indent:') or contains(@style, 'margin-left:') or contains(@style, 'margin-right:')]">
			<xsl:variable name="firstLine">
				<xsl:choose>
					<xsl:when
						test="contains(substring-after(self::*[contains(@style, 'text-indent:')][1]/@style, 'text-indent:'), ';')">
						<xsl:value-of
							select='substring-before(substring-after(self::*[contains(@style, "text-indent:")][1]/@style, "text-indent:"), ";")'
						/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of
							select='substring-after(self::*[contains(@style, "text-align:")][1]/@style, "text-indent:")'
						/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="left">
				<xsl:choose>
					<xsl:when
						test="contains(substring-after(self::*[contains(@style, 'margin-left:')][1]/@style, 'margin-left:'), ';')">
						<xsl:value-of
							select='substring-before(substring-after(self::*[contains(@style, "margin-left:")][1]/@style, "margin-left:"), ";")'
						/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of
							select='substring-after(self::*[contains(@style, "margin-left:")][1]/@style, "margin-left:")'
						/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="right">
				<xsl:choose>
					<xsl:when
						test="contains(substring-after(self::*[contains(@style, 'margin-right:')][1]/@style, 'margin-right:'), ';')">
						<xsl:value-of
							select='substring-before(substring-after(self::*[contains(@style, "margin-right:")][1]/@style, "margin-right:"), ";")'
						/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of
							select='substring-after(self::*[contains(@style, "margin-right:")][1]/@style, "margin-right:")'
						/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:element name="w:ind">
				<xsl:if test="string-length($firstLine) > 0 and matches($firstLine, '[0-9]+')">
					<xsl:variable name="tempVal" select="replace($firstLine, 'pt', '')"/>
					<xsl:attribute name="w:firstLine" select="number($tempVal) * 20"/>
				</xsl:if>
				<xsl:if test="string-length($left) > 0 and matches($left, '[0-9]+')">
					<xsl:variable name="tempVal" select="replace($left, 'pt', '')"/>
					<xsl:attribute name="w:left" select="number($tempVal) * 20"/>
				</xsl:if>
				<xsl:if test="string-length($right) > 0 and matches($right, '[0-9]+')">
					<xsl:variable name="tempVal" select="replace($right, 'pt', '')"/>
					<xsl:attribute name="w:right" select="number($tempVal) * 20"/>
				</xsl:if>
			</xsl:element>
		</xsl:if>
		<xsl:if test="@align or self::*[contains(@style, 'text-align:')]">
			<xsl:variable name="font">
				<xsl:choose>
					<xsl:when test="@align">
						<xsl:choose>
							<xsl:when test="@align = 'justify' or @align = 'justify;'">
								<xsl:value-of select="'both'"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="@align"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:when
						test="contains(substring-after(self::*[contains(@style, 'text-align:')][1]/@style, 'text-align:'), 'justify')">
						<!--<xsl:value-of select="substring-before(substring-after(ancestor::span[contains(@style,'font-family:')]/@style,'font-family:'),';')"/>-->
						<xsl:value-of select="'both'"/>
					</xsl:when>
					<xsl:when
						test="contains(substring-after(self::*[contains(@style, 'text-align:')][1]/@style, 'text-align:'), ';') and not(contains(substring-after(self::*[contains(@style, 'text-align:')][1]/@style, 'text-align:'), 'justify'))">
						<!--<xsl:value-of select="substring-before(substring-after(ancestor::span[contains(@style,'font-family:')]/@style,'font-family:'),';')"/>-->
						<xsl:value-of
							select='substring-before(substring-after(self::*[contains(@style, "text-align:")][1]/@style, "text-align:"), ";")'
						/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of
							select='substring-after(self::*[contains(@style, "text-align:")][1]/@style, "text-align:")'
						/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:element name="w:jc">
				<xsl:attribute name="w:val" select="normalize-space($font)"/>
			</xsl:element>
		</xsl:if>
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
	
<!--<xsl:template match="span[@data-commentgroup]">
	<xsl:if test="following::img[@data-comment | @data-commentimg][not(ancestor::*[@data-change = 'commentdeleted'])] | following::span[@data-comment | @data-commentimg][not(ancestor::*[@data-change = 'commentdeleted'])]">
		
	<xsl:if test="following::*[@cmtId = 'true']">
		
		<xsl:element name="w:r">
			<xsl:element name="w:commentReference">
				<xsl:attribute name="w:id">
					<!-\-<xsl:number level="any" count="span[@data-commentgroup]"/>-\->
					<xsl:value-of select="self::span[@data-commentgroup]/@data-commentgroup"/>
				</xsl:attribute>
			</xsl:element>
		</xsl:element>
	</xsl:if>
	</xsl:if>
</xsl:template>-->
	
	<!--<xsl:template match="//a[contains(@id,'Reference')]">
		<xsl:choose>
			<xsl:when test="self::a[contains(@id,'Reference')]">
				
				<xsl:variable name="value" select="@id"/>
				<xsl:element name="w:sdt">
					<xsl:element name="w:sdtPr">
						<xsl:if test="string-length($value) > 0">
							<xsl:element name="w:alias">
								<xsl:attribute name="w:val" select="$value"/>
							</xsl:element>
						</xsl:if>
					</xsl:element>
					
						<xsl:apply-templates/>
					
				</xsl:element>
			</xsl:when>
			<xsl:otherwise>
				
					<xsl:apply-templates/>
				
			</xsl:otherwise>
		</xsl:choose>
		
	</xsl:template> -->
	<xsl:template match="p[@class='Header']"/>
	<xsl:template match="div[@data-type='textbox']/child::div[@data-type='textbox']">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="img[@data-comment] | span[@data-comment] | img[@data-commentimg] | span[@data-commentimg] | span[@data-commentgroup]">
		
		<xsl:variable name="astyle" select="@data-comment"/>
		<!--<xsl:variable name="aastyle" select="@data-commentimg"/>-->
		<xsl:variable name="aastyle">
			<xsl:choose>
				<xsl:when test="string-length(@data-commentimg) &gt; 0">
					<xsl:value-of select="@data-commentimg"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="child::span[@data-commentimg]/@data-commentimg"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<!--<xsl:variable name="aaastyle" select="@data-commentgroup"/>-->
		<!--Added on 08-02-2021 for marriapn commentgroup text missing-->
		<xsl:variable name="aaastyle">
			
			<xsl:if test="self::span[not(@data-commentgroup = following::span[@data-commentgroup]/@data-commentgroup)]">
				<xsl:value-of select="self::span[@data-commentgroup][1]/@data-commentgroup"/>
			</xsl:if>
			
			
		</xsl:variable>
		<!-- Added "self::span[@data-comment]" for comment missing on 9-3-2023 -->
		
		<xsl:if
			test="self::img[@data-commentimg] or self::span[@data-commentimg] and not(count(preceding::span[@data-commentrange = 'cmtEnd'])) or self::img[@data-comment] or self::span[@data-comment][not(@data-comment = preceding::span[@data-commentgroup][1]/@data-commentgroup)][not(@data-commentrange='cmtEnd') or not(@data-change='commentdeleted')] and not(count(preceding::span[@data-commentrange = 'cmtEnd'])) or self::span[@data-comment][not(@data-commentrange = 'cmtStart')][not(@data-commentrange = 'cmtEnd')][@data-change='commentadded'][not(@data-comment= preceding::span[@data-commentgroup][1]/@data-commentgroup)]">
			<xsl:for-each select="//CommentReference">
				<xsl:variable name="bstyle" select="@data-commentvalue"/>
				<xsl:choose>
					<xsl:when test="$bstyle = $astyle">
						<xsl:element name="w:r">
							<xsl:element name="w:commentReference">
								<xsl:attribute name="w:id">
									<xsl:value-of select="substring-after($astyle,'cmt')"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:element>
					</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<xsl:when test="$bstyle = $aastyle">
								<xsl:element name="w:r">
									<xsl:element name="w:commentReference">
										<xsl:attribute name="w:id">
											<xsl:value-of select="substring-after($aastyle,'cmt')"/>
										</xsl:attribute>
									</xsl:element>
								</xsl:element>
							</xsl:when>
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
			<!--Add For each condition {commentreference} 15.12.2017 -->
			<xsl:for-each select="//commentreference">
				<xsl:variable name="bstyle" select="@data-commentvalue"/>
				<xsl:choose>
					<xsl:when test="$bstyle = $astyle">
						
						<xsl:element name="w:r">
							<xsl:element name="w:commentReference">
								<xsl:attribute name="w:id">
									
									<xsl:value-of select="substring-after($astyle,'cmt')"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:element>
					</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<xsl:when test="$bstyle = $aastyle">
								
								<xsl:element name="w:r">
									<xsl:element name="w:commentReference">
										<xsl:attribute name="w:id">
											<xsl:value-of select="substring-after($aastyle,'cmt')"/>
										</xsl:attribute>
									</xsl:element>
								</xsl:element>
							</xsl:when>
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</xsl:if>
		<xsl:if
			test="self::img[@data-commentimg] or self::span[@data-commentimg] and count(preceding::span[@data-commentrange = 'cmtEnd']) and not(count(preceding::span[@data-change='commentadded'])) or self::img[@data-comment] and count(preceding::span[@data-commentrange = 'cmtEnd'])">
			
			<xsl:for-each select="//CommentReference">
				<xsl:variable name="bstyle" select="@data-commentvalue"/>
				<xsl:choose>
					<xsl:when test="$bstyle = $astyle">
						<xsl:element name="w:r">
							<xsl:element name="w:commentReference">
								<xsl:attribute name="w:id">
									<xsl:value-of select="substring-after($astyle,'cmt')"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:element>
					</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<xsl:when test="$bstyle = $aastyle">
								<xsl:element name="w:r">
									<xsl:element name="w:commentReference">
										<xsl:attribute name="w:id">
											<xsl:value-of select="substring-after($aastyle,'cmt')"/>
										</xsl:attribute>
									</xsl:element>
								</xsl:element>
							</xsl:when>
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
			<!--Add For each condition {commentreference} 15.12.2017 -->
			<xsl:for-each select="//commentreference">
				
				<xsl:variable name="bstyle" select="@data-commentvalue"/>
				<xsl:choose>
					<xsl:when test="$bstyle = $astyle">
						
						<xsl:element name="w:r">
							<xsl:element name="w:commentReference">
								<xsl:attribute name="w:id">
									<xsl:value-of select="substring-after($astyle,'cmt')"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:element>
					</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<xsl:when test="$bstyle = $aastyle">
								
								<xsl:element name="w:r">
									<xsl:element name="w:commentReference">
										<xsl:attribute name="w:id">
											<xsl:value-of select="substring-after($aastyle,'cmt')"/>
										</xsl:attribute>
									</xsl:element>
								</xsl:element>
							</xsl:when>
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="self::span[@data-commentgroup]">
			<!--Added on 08-02-2021 for marriapn commentgroup text missing-->
			<xsl:if test="self::span[@data-commentgroup and @data-change='commentGroup'][string-length(.)&gt;0]">
				<xsl:apply-templates/>
			</xsl:if>
			
			<xsl:for-each select="//CommentReference">
				<xsl:variable name="bstyle" select="@data-commentvalue"/>
				
				<xsl:if test="$bstyle = $aaastyle">
					
					<xsl:element name="w:r">
						<xsl:element name="w:commentReference">
							<xsl:attribute name="w:id">
								<xsl:value-of select="substring-after($aaastyle,'cmt')"/>
							</xsl:attribute>
						</xsl:element>
					</xsl:element>
				</xsl:if>
				
				
			</xsl:for-each>
			<!--Add For each condition {commentreference} 15.12.2017 -->
			<xsl:for-each select="//commentreference">
				
				<xsl:variable name="bstyle" select="@data-commentvalue"/>
				
				<xsl:if test="$bstyle = $aaastyle">
					<xsl:element name="w:r">
						<xsl:element name="w:commentReference">
							<xsl:attribute name="w:id">
								<xsl:value-of select="substring-after($aaastyle,'cmt')"/>
							</xsl:attribute>
						</xsl:element>
					</xsl:element>
				</xsl:if>
				
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template match="//w:object">
		<w:r>
	<xsl:copy-of select="self::w:object"></xsl:copy-of>
		</w:r>
	</xsl:template>
	<xsl:template match="//m:oMath">
		<xsl:copy-of select="self::m:oMath"></xsl:copy-of>
	</xsl:template>
        <xsl:template match="//w:pict">
		<xsl:copy-of select="self::w:pict"></xsl:copy-of>
	</xsl:template>
	<xsl:template match="//w:drawing">
		<xsl:copy-of select="self::w:drawing"></xsl:copy-of>
	</xsl:template>
	<!-- Added for supplementery link on 26-9-2024 -->
	<xsl:template match="//a[contains(@data-alias,'SupplMaterialRef')]">
		<xsl:param name="pPr_Default"/>
		<xsl:param name="rPr_Default"/>
		<xsl:variable name="citid"><xsl:value-of select="substring-after(@href,'#')"/></xsl:variable>
		<xsl:variable name="citcap"><xsl:value-of select="following::div[contains(@id,'smr')]/@id"/></xsl:variable>
		<xsl:variable name="citbkmark"><xsl:value-of select="following::div[contains(@id,'smr')][contains(@id,$citid)][1]/p[1]/span[contains(@data-bkmark,'para')][1]/@data-bkmark"/></xsl:variable>
		
		<xsl:choose>
			<xsl:when test="contains($citcap,$citid)">
				
				<xsl:element name="w:hyperlink">
					<xsl:variable name="citid"><xsl:value-of select="@href"/></xsl:variable>
					<xsl:attribute name="w:anchor">
						<xsl:value-of select="$citbkmark"/>
					</xsl:attribute>
					<xsl:attribute name="w:history"><xsl:value-of select="substring-after(@href,'#')"/></xsl:attribute>
					
					<xsl:apply-templates>
						<xsl:with-param name="pPr_Default">
							<xsl:copy-of select="$pPr_Default"/>
						</xsl:with-param>
						<xsl:with-param name="rPr_Default">
							<xsl:copy-of select="$rPr_Default"/>
						</xsl:with-param>
					</xsl:apply-templates>
				</xsl:element>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- heading link on 18-03-2025 -->
	<xsl:template match="//a[contains(@data-alias,'HeadingRef')]">
		
		<xsl:param name="pPr_Default"/>
		<xsl:param name="rPr_Default"/>
		
		<xsl:variable name="citid"><xsl:value-of select="substring-after(@href,'#')"/></xsl:variable>
		<!--<xsl:variable name="citcap"><xsl:value-of select="following::div[contains(@id,'smr')]/@id"/></xsl:variable>
		<xsl:variable name="citbkmark"><xsl:value-of select="following::div[contains(@id,'smr')][contains(@id,$citid)][1]/p[1]/span[contains(@data-bkmark,'para')][1]/@data-bkmark"/></xsl:variable>
		-->
		<xsl:variable name="citcap">
			<xsl:choose>
				<xsl:when test="following::div[contains(@id,'Headref')][contains(@id,$citid)][string-length(@id) &gt; 0]">
					<xsl:value-of select="following::div[contains(@id,'Headref')][contains(@id,$citid)]/@id"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="preceding::div[contains(@id,'Headref')][contains(@id,$citid)]/@id"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<xsl:variable name="citbkmark">
			<xsl:choose>
				<xsl:when test="following::div[contains(@id,'Headref')][contains(@id,$citid)][1]/p[1]/span[contains(@data-bkmark,'para')][1]">
					<xsl:value-of select="following::div[contains(@id,'Headref')][contains(@id,$citid)][1]/p[1]/span[contains(@data-bkmark,'para')][1]/@data-bkmark"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="preceding::div[contains(@id,'Headref')][contains(@id,$citid)][1]/p[1]/span[contains(@data-bkmark,'para')][1]/@data-bkmark"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="contains($citcap,$citid)">
				<xsl:element name="w:hyperlink">
					<xsl:variable name="citid"><xsl:value-of select="@href"/></xsl:variable>
					<xsl:attribute name="w:anchor">
						<xsl:value-of select="$citbkmark"/>
					</xsl:attribute>
					<xsl:attribute name="w:history"><xsl:value-of select="substring-after(@href,'#')"/></xsl:attribute>
					
					<xsl:apply-templates>
						<xsl:with-param name="pPr_Default">
							<xsl:copy-of select="$pPr_Default"/>
						</xsl:with-param>
						<xsl:with-param name="rPr_Default">
							<xsl:copy-of select="$rPr_Default"/>
						</xsl:with-param>
					</xsl:apply-templates>
				</xsl:element>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- End -->
        </xsl:stylesheet>