<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output indent="yes"/>
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
     </xsl:template>
	
<!--Box Open-->
    <!-- Added for figure on 8-09-2021 -->
 <xsl:template match="//XMLElement[@MarkupTag='XMLTag/Image']">
 <xsl:choose>
 <xsl:when test="ancestor::XMLElement[@Image='Delete']">
 
 </xsl:when>

 <xsl:otherwise>
 <xsl:copy>
  <xsl:apply-templates select="@*|node()"/>
 </xsl:copy>
 </xsl:otherwise>
 
 </xsl:choose>
 
 
 </xsl:template>

	<xsl:template match="//CharacterStyleRange[@AppliedCharacterStyle = 'CharacterStyle/CommentReference']">
   <CharacterStyleRange AppliedCharacterStyle="{concat(substring-before(./@AppliedCharacterStyle, '/'), '/$ID/[No character style]')}">
   <xsl:apply-templates/>
</CharacterStyleRange>
     	</xsl:template>
			
	
		<xsl:template match="//CharacterStyleRange[@AppliedCharacterStyle = 'CharacterStyle/PhotoNumber']">
   <CharacterStyleRange AppliedCharacterStyle="{concat(substring-before(./@AppliedCharacterStyle, '/'), '/$ID/[No character style]')}">
   <xsl:apply-templates/>
</CharacterStyleRange>
     	</xsl:template>
			<xsl:template match="//CharacterStyleRange[@AppliedCharacterStyle = 'CharacterStyle/ImageNumber']">
   <CharacterStyleRange AppliedCharacterStyle="{concat(substring-before(./@AppliedCharacterStyle, '/'), '/$ID/[No character style]')}">
   <xsl:apply-templates/>
</CharacterStyleRange>
     	</xsl:template>
		<xsl:template match="//CharacterStyleRange[@AppliedCharacterStyle = 'CharacterStyle/MapNumber']">
   <CharacterStyleRange AppliedCharacterStyle="{concat(substring-before(./@AppliedCharacterStyle, '/'), '/$ID/[No character style]')}">
   <xsl:apply-templates/>
</CharacterStyleRange>
     	</xsl:template>
		<!--<xsl:template match="//CharacterStyleRange[@AppliedCharacterStyle = 'CharacterStyle/MapCitation']">
   <CharacterStyleRange AppliedCharacterStyle="{concat(substring-before(./@AppliedCharacterStyle, '/'), '/$ID/[No character style]')}">
   <xsl:apply-templates/>
</CharacterStyleRange>
     	</xsl:template>-->
			
	<xsl:template match="//CharacterStyleRange[@AppliedCharacterStyle = 'CharacterStyle/annotation reference']">
   <CharacterStyleRange AppliedCharacterStyle="{concat(substring-before(./@AppliedCharacterStyle, '/'), '/$ID/[No character style]')}">
   <xsl:apply-templates/>
</CharacterStyleRange>
     	</xsl:template>
<xsl:template match="//CharacterStyleRange[@AppliedCharacterStyle = 'CharacterStyle/endnote reference']">
   <CharacterStyleRange AppliedCharacterStyle="{concat(substring-before(./@AppliedCharacterStyle, '/'), '/$ID/[No character style]')}">
   	<xsl:apply-templates select="@*|node()"/>
</CharacterStyleRange>
     	</xsl:template>
		<xsl:template match="//CharacterStyleRange[@AppliedCharacterStyle = 'CharacterStyle/Placeholder Text']">
   <CharacterStyleRange AppliedCharacterStyle="{concat(substring-before(./@AppliedCharacterStyle, '/'), '/$ID/[No character style]')}">
   <xsl:apply-templates/>
</CharacterStyleRange>
     	</xsl:template>
	  <xsl:template match="//ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/Table-Place-Holder']|//ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/Box-Place-Holder']|//ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/Map-Place-Holder']|//ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/Figure-Place-Holder']|//ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/Photo-Place-Holder']|//ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/Image-Place-Holder']|//ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/Example-Place-Holder']|//ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/Video-Place-Holder']">
	   
	    <ParagraphStyleRange AppliedParagraphStyle="ParagraphStyle/$ID/[No paragraph style]">
	<xsl:apply-templates/>
	
	   </ParagraphStyleRange>
	    </xsl:template>
		
		   <xsl:template match="//ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/CommentText']">
	   
	    <ParagraphStyleRange AppliedParagraphStyle="ParagraphStyle/$ID/[No paragraph style]">
	<xsl:apply-templates/>
	
	   </ParagraphStyleRange>
	    </xsl:template>
		 <xsl:template match="//ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/Comment Text']">
	   
	    <ParagraphStyleRange AppliedParagraphStyle="ParagraphStyle/$ID/[No paragraph style]">
	<xsl:apply-templates/>
	
	   </ParagraphStyleRange>
	    </xsl:template>
	   <!--<xsl:template match="//ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FT1-OPEN']">
	     <xsl:text disable-output-escaping="yes">&#x3C;XMLElement Self="di2ib53ib52" MarkupTag="XMLTag/sidebar"&#x3E;</xsl:text>
	    </xsl:template>
		   <xsl:template match="//ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FT2-OPEN']">
	     <xsl:text disable-output-escaping="yes">&#x3C;XMLElement Self="di2ib53ib52" MarkupTag="XMLTag/sidebar"&#x3E;</xsl:text>
	    </xsl:template>
		   <xsl:template match="//ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FT3-OPEN']">
	     <xsl:text disable-output-escaping="yes">&#x3C;XMLElement Self="di2ib53ib52" MarkupTag="XMLTag/sidebar"&#x3E;</xsl:text>
	    </xsl:template>
		   <xsl:template match="//ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FT4-OPEN']">
	     <xsl:text disable-output-escaping="yes">&#x3C;XMLElement Self="di2ib53ib52" MarkupTag="XMLTag/sidebar"&#x3E;</xsl:text>
	    </xsl:template>
		   <xsl:template match="//ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FT5-OPEN']">
	     <xsl:text disable-output-escaping="yes">&#x3C;XMLElement Self="di2ib53ib52" MarkupTag="XMLTag/sidebar"&#x3E;</xsl:text>
	    </xsl:template>
		   <xsl:template match="//ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FT6-OPEN']">
	     <xsl:text disable-output-escaping="yes">&#x3C;XMLElement Self="di2ib53ib52" MarkupTag="XMLTag/sidebar"&#x3E;</xsl:text>
	    </xsl:template>
			   <xsl:template match="//ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FT7-OPEN']">
	     <xsl:text disable-output-escaping="yes">&#x3C;XMLElement Self="di2ib53ib52" MarkupTag="XMLTag/sidebar"&#x3E;</xsl:text>
	    </xsl:template>
			   <xsl:template match="//ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FT8-OPEN']">
	     <xsl:text disable-output-escaping="yes">&#x3C;XMLElement Self="di2ib53ib52" MarkupTag="XMLTag/sidebar"&#x3E;</xsl:text>
	    </xsl:template>
 
		 
	   <xsl:template match="//ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FT1-CLOSE']">
		
	
		   	  <XMLAttribute Name="xml:id" Self="di2i3d9i3c8i3a2i226i15di138i135XMLAttributenxml:id" Value="ch-Box1"/>	
		 	<XMLAttribute Name="role" Self="di2i3d9i3c8i3a2i226i15di138i135XMLAttributenrole" Value="FT1"/>
		   
	     <xsl:text disable-output-escaping="yes">&#x3C;/XMLElement&#x3E;</xsl:text>
	    </xsl:template>
		  <xsl:template match="//ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FT2-CLOSE']">
		
	
		   	  <XMLAttribute Name="xml:id" Self="di2i3d9i3c8i3a2i226i15di138i135XMLAttributenxml:id" Value="ch-Box2"/>	
		 	<XMLAttribute Name="role" Self="di2i3d9i3c8i3a2i226i15di138i135XMLAttributenrole" Value="FT2"/>
		   
	     <xsl:text disable-output-escaping="yes">&#x3C;/XMLElement&#x3E;</xsl:text>
	    </xsl:template>
		  <xsl:template match="//ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FT3-CLOSE']">
		
	
		   	  <XMLAttribute Name="xml:id" Self="di2i3d9i3c8i3a2i226i15di138i135XMLAttributenxml:id" Value="ch-Box3"/>	
		 	<XMLAttribute Name="role" Self="di2i3d9i3c8i3a2i226i15di138i135XMLAttributenrole" Value="FT3"/>
		   
	     <xsl:text disable-output-escaping="yes">&#x3C;/XMLElement&#x3E;</xsl:text>
	    </xsl:template>
		  <xsl:template match="//ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FT4-CLOSE']">
		
	
		   	  <XMLAttribute Name="xml:id" Self="di2i3d9i3c8i3a2i226i15di138i135XMLAttributenxml:id" Value="ch-Box4"/>	
		 	<XMLAttribute Name="role" Self="di2i3d9i3c8i3a2i226i15di138i135XMLAttributenrole" Value="FT4"/>
		   
	     <xsl:text disable-output-escaping="yes">&#x3C;/XMLElement&#x3E;</xsl:text>
	    </xsl:template>
		  <xsl:template match="//ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FT5-CLOSE']">
		
	
		   	  <XMLAttribute Name="xml:id" Self="di2i3d9i3c8i3a2i226i15di138i135XMLAttributenxml:id" Value="ch-Box5"/>	
		 	<XMLAttribute Name="role" Self="di2i3d9i3c8i3a2i226i15di138i135XMLAttributenrole" Value="FT5"/>
		   
	     <xsl:text disable-output-escaping="yes">&#x3C;/XMLElement&#x3E;</xsl:text>
	    </xsl:template>
		  <xsl:template match="//ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FT6-CLOSE']">
		
	
		   	  <XMLAttribute Name="xml:id" Self="di2i3d9i3c8i3a2i226i15di138i135XMLAttributenxml:id" Value="ch-Box6"/>	
		 	<XMLAttribute Name="role" Self="di2i3d9i3c8i3a2i226i15di138i135XMLAttributenrole" Value="FT6"/>
		   
	     <xsl:text disable-output-escaping="yes">&#x3C;/XMLElement&#x3E;</xsl:text>
	    </xsl:template>
		  <xsl:template match="//ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FT7-CLOSE']">
		
	
		   	  <XMLAttribute Name="xml:id" Self="di2i3d9i3c8i3a2i226i15di138i135XMLAttributenxml:id" Value="ch-Box7"/>	
		 	<XMLAttribute Name="role" Self="di2i3d9i3c8i3a2i226i15di138i135XMLAttributenrole" Value="FT7"/>
		   
	     <xsl:text disable-output-escaping="yes">&#x3C;/XMLElement&#x3E;</xsl:text>
	    </xsl:template>
		  <xsl:template match="//ParagraphStyleRange[@AppliedParagraphStyle = 'ParagraphStyle/FT8-CLOSE']">
		
	
		   	  <XMLAttribute Name="xml:id" Self="di2i3d9i3c8i3a2i226i15di138i135XMLAttributenxml:id" Value="ch-Box8"/>	
		 	<XMLAttribute Name="role" Self="di2i3d9i3c8i3a2i226i15di138i135XMLAttributenrole" Value="FT8"/>
		   
	     <xsl:text disable-output-escaping="yes">&#x3C;/XMLElement&#x3E;</xsl:text>
	    </xsl:template>-->
		

		
	
		<xsl:template match="//CharacterStyleRange[@AppliedCharacterStyle = 'CharacterStyle/BodyText Char']">
   <CharacterStyleRange AppliedCharacterStyle="{concat(substring-before(./@AppliedCharacterStyle, '/'), '/$ID/[No character style]')}">
   <xsl:apply-templates/>
</CharacterStyleRange>
     	</xsl:template>
		
    <xsl:template match="XMLElement">
	<xsl:variable name="qqq" select="substring-after(@MarkupTag,'XMLTag/')"/>

        <xsl:choose>
            <xsl:when test="@MarkupTag = 'XMLTag/CT' or @MarkupTag = 'XMLTag/CHBM\%3aAPT' or @MarkupTag = 'XMLTag/CHBM\%3aAPN' or @MarkupTag = 'XMLTag/CHBM\%3aBIB' or @MarkupTag = 'XMLTag/RA' or @MarkupTag = 'XMLTag/RT' or @MarkupTag = 'XMLTag/RST' or @MarkupTag = 'XMLTag/CHBM\%3aENDN' or @MarkupTag = 'XMLTag/FET&gt;FT1' or @MarkupTag = 'XMLTag/ST&gt;FT1' or @MarkupTag = 'XMLTag/CHBM\%3aQA' or @MarkupTag = 'XMLTag/CHBM\%3aSR' or @MarkupTag = 'XMLTag/CHBM\%3aKT' or @MarkupTag = 'XMLTag/CHBM\%3aOTH' or @MarkupTag = 'XMLTag/FTY&gt;FT1' or @MarkupTag = 'XMLTag/FET&gt;FT1' or @MarkupTag = 'XMLTag/01 - Tytuł artykułu' or @MarkupTag = 'XMLTag/07_Sródtytul 1' or @MarkupTag = 'XMLTag/07_Sródtytul 2'">
                <XMLElement Self="{./@Self}" MarkupTag="{concat(substring-before(./@MarkupTag, '/'), '/title')}">
                    <xsl:apply-templates/>
                </XMLElement>
            </xsl:when>
			   <xsl:when test="@MarkupTag = 'XMLTag/16 - Adres do korespondencji' or @MarkupTag = 'XMLTag/00 - Adres do korespondencji'">
                <XMLElement Self="{./@Self}" MarkupTag="{concat(substring-before(./@MarkupTag, '/'), '/Address')}">
                    <xsl:apply-templates/>
                </XMLElement>
            </xsl:when>
				   <xsl:when test="@MarkupTag = 'XMLTag/04 - Otrzymano...' or @MarkupTag = 'XMLTag/16A - Adres do korespondencji data'">
                <XMLElement Self="{./@Self}" MarkupTag="{concat(substring-before(./@MarkupTag, '/'), '/AddressSource')}">
                    <xsl:apply-templates/>
                </XMLElement>
            </xsl:when>
			  <xsl:when test="@MarkupTag = 'XMLTag/PartNumber' or @MarkupTag = 'XMLTag/PartTitle' or @MarkupTag = 'XMLTag/ChapterNumber' or @MarkupTag = 'XMLTag/ChapterTitle' or @MarkupTag = 'XMLTag/ChapPartHeading' or @MarkupTag = 'XMLTag/FE-01-Name' or @MarkupTag = 'XMLTag/Box-01-BoxTitle' or @MarkupTag = 'XMLTag/Box-02-BoxTitle' or @MarkupTag = 'XMLTag/Box-03-BoxTitle' or @MarkupTag = 'XMLTag/Box-04-BoxTitle' or @MarkupTag = 'XMLTag/AnswersHeading' or @MarkupTag = 'XMLTag/QuestionsHeading1'">
                <XMLElement Self="{./@Self}" MarkupTag="{concat(substring-before(./@MarkupTag, '/'), '/TITLE')}">
                    <xsl:apply-templates/>
                </XMLElement>
            </xsl:when>
			<xsl:when test="@MarkupTag = 'XMLTag/H1&gt;APN' or @MarkupTag = 'XMLTag/H1&gt;RD1' or @MarkupTag = 'XMLTag/H1'">
             
			    <XMLElement Self="{./@Self}" MarkupTag="{concat(substring-before(./@MarkupTag, '/'), '/title')}">
                    <xsl:apply-templates/>
					</XMLElement>
             
            </xsl:when>
				<xsl:when test="@MarkupTag = 'XMLTag/heading 1' or @MarkupTag = 'XMLTag/heading 2'">
             
			    <XMLElement Self="{./@Self}" MarkupTag="{concat(substring-before(./@MarkupTag, '/'), '/TITLE')}">
                    <xsl:apply-templates/>
					</XMLElement>
             
            </xsl:when>
			<xsl:when test="@MarkupTag = 'XMLTag/MCQ-Options-Ind' or @MarkupTag = 'XMLTag/MultipleChoiceQuestionNL'">
             
			    <XMLElement Self="{./@Self}" MarkupTag="{concat(substring-before(./@MarkupTag, '/'), '/ITEM')}">
			    <XMLElement Self="{./@Self}" MarkupTag="{concat(substring-before(./@MarkupTag, '/'), '/PARA')}">
                    <xsl:apply-templates/>
					</XMLElement>
					</XMLElement>
             
            </xsl:when>
				<!--<xsl:when test="@MarkupTag = 'XMLTag/FGC'">
              
			  
                    <xsl:apply-templates/>
					
            </xsl:when>-->
			<xsl:when test="@MarkupTag = 'XMLTag/H2&gt;RD1' or @MarkupTag = 'XMLTag/H2'">
              
			    <XMLElement Self="{./@Self}" MarkupTag="{concat(substring-before(./@MarkupTag, '/'), '/title')}">
                    <xsl:apply-templates/>
					</XMLElement>
              
            </xsl:when>
			<xsl:when test="@MarkupTag = 'XMLTag/H3&gt;RD1' or @MarkupTag = 'XMLTag/H3'">
             
			    <XMLElement Self="{./@Self}" MarkupTag="{concat(substring-before(./@MarkupTag, '/'), '/title')}">
                    <xsl:apply-templates/>
					</XMLElement>
             
            </xsl:when>
			<xsl:when test="@MarkupTag = 'XMLTag/H4&gt;RD1' or @MarkupTag = 'XMLTag/H4'">
             
			    <XMLElement Self="{./@Self}" MarkupTag="{concat(substring-before(./@MarkupTag, '/'), '/title')}">
                    <xsl:apply-templates/>
					</XMLElement>
              
            </xsl:when>
					<xsl:when test="@MarkupTag = 'XMLTag/H5&gt;RD1' or @MarkupTag = 'XMLTag/H5'">
             
			    <XMLElement Self="{./@Self}" MarkupTag="{concat(substring-before(./@MarkupTag, '/'), '/title')}">
                    <xsl:apply-templates/>
					</XMLElement>
              
            </xsl:when>
					<xsl:when test="@MarkupTag = 'XMLTag/H6&gt;RD1' or @MarkupTag = 'XMLTag/H6'">
             
			    <XMLElement Self="{./@Self}" MarkupTag="{concat(substring-before(./@MarkupTag, '/'), '/title')}">
                    <xsl:apply-templates/>
					</XMLElement>
              
            </xsl:when>
			  <xsl:when test="@MarkupTag = 'XMLTag/CN'">
                <XMLElement Self="{./@Self}" MarkupTag="{concat(substring-before(./@MarkupTag, '/'), '/span')}">
                    <xsl:apply-templates/>
                </XMLElement>
            </xsl:when>
			<!--<xsl:when test="@MarkupTag = 'XMLTag/BL' or @MarkupTag = 'XMLTag/BL1' or @MarkupTag = 'XMLTag/BL2' or @MarkupTag = 'XMLTag/BL3' or @MarkupTag = 'XMLTag/BL4' or @MarkupTag = 'XMLTag/BL5' or @MarkupTag = 'XMLTag/UL' or @MarkupTag = 'XMLTag/UL1' or @MarkupTag = 'XMLTag/UL2' or @MarkupTag = 'XMLTag/UL3' or @MarkupTag = 'XMLTag/UL4' or @MarkupTag = 'XMLTag/UL5' or @MarkupTag = 'XMLTag/NL' or @MarkupTag = 'XMLTag/NL1' or @MarkupTag = 'XMLTag/NL2' or @MarkupTag = 'XMLTag/NL3' or @MarkupTag = 'XMLTag/NL4' or @MarkupTag = 'XMLTag/NL5'">
              
                    <xsl:apply-templates/>
                
            </xsl:when>-->
			
			  <!-- <xsl:when test="@MarkupTag = 'XMLTag/bold' or @MarkupTag = 'XMLTag/italic' or @MarkupTag = 'XMLTag/sup' or @MarkupTag = 'XMLTag/sub' or @MarkupTag = 'XMLTag/capsall' or @MarkupTag = 'XMLTag/Strong' or @MarkupTag = 'XMLTag/strikethrough' or @MarkupTag = 'XMLTag/underline'  or @MarkupTag = 'XMLTag/smallcaps'  or @MarkupTag = 'XMLTag/allcaps'  or @MarkupTag = 'XMLTag/bolditalics'or @MarkupTag = 'XMLTag/bolditalic'">
                <XMLElement Self="{./@Self}" MarkupTag="{concat(substring-before(./@MarkupTag, '/'), '/emphasis')}">
                    <xsl:apply-templates/>
                </XMLElement>
            </xsl:when>-->
			<xsl:when test="@MarkupTag = 'XMLTag/CST'">
                <XMLElement Self="{./@Self}" MarkupTag="{concat(substring-before(./@MarkupTag, '/'), '/subtitle')}">
                    <xsl:apply-templates/>
                </XMLElement>
            </xsl:when>
			 <xsl:when test="@MarkupTag = 'XMLTag/PI&gt;RD1' or @MarkupTag = 'XMLTag/COBJH' or @MarkupTag = 'XMLTag/COBJ' or @MarkupTag = 'XMLTag/TXL' or @MarkupTag = 'XMLTag/TX' or @MarkupTag = 'XMLTag/P&gt;APN' or @MarkupTag = 'XMLTag/P' or @MarkupTag = 'XMLTag/PI' or @MarkupTag = 'XMLTag/P&gt;RD1' or @MarkupTag = 'XMLTag/P-ALT' or @MarkupTag = 'XMLTag/DIS' or @MarkupTag = 'XMLTag/PI-ALT' or @MarkupTag = 'XMLTag/1&gt;P-ALT' or @MarkupTag = 'XMLTag/P&gt;FT1' or @MarkupTag = 'XMLTag/PI&gt;FT1' or @MarkupTag = 'XMLTag/P&gt;FT2' or @MarkupTag = 'XMLTag/PI&gt;FT2' or @MarkupTag = 'XMLTag/P&gt;FT3' or @MarkupTag = 'XMLTag/PI&gt;FT3' or @MarkupTag = 'XMLTag/P&gt;FT4' or @MarkupTag = 'XMLTag/PI&gt;FT4' or @MarkupTag = 'XMLTag/P&gt;FT5' or @MarkupTag = 'XMLTag/PI&gt;FT5' or @MarkupTag = 'XMLTag/P&gt;FT6' or @MarkupTag = 'XMLTag/PI&gt;FT6' or @MarkupTag = 'XMLTag/P&gt;FT7' or @MarkupTag = 'XMLTag/PI&gt;FT7' or @MarkupTag = 'XMLTag/P&gt;FT8' or @MarkupTag = 'XMLTag/PI&gt;FT8' or @MarkupTag = 'XMLTag/P&gt;FT9' or @MarkupTag = 'XMLTag/PI&gt;FT9' or @MarkupTag = 'XMLTag/PQ' or @MarkupTag = 'XMLTag/PQS' or @MarkupTag = 'XMLTag/P&gt;FT10' or @MarkupTag = 'XMLTag/PI&gt;FT10' or @MarkupTag = 'XMLTag/04 a - Streszczenie angielskie' or @MarkupTag = 'XMLTag/04 b - Slowa kluczowe' or @MarkupTag = 'XMLTag/08 - Tekst' or @MarkupTag = 'XMLTag/02 - Autor artykułu' or @MarkupTag = 'XMLTag/03 - Autor - praca' or @MarkupTag = 'XMLTag/05 - Streszczenie' or @MarkupTag = 'XMLTag/06 - Słowa kluczowe' or @MarkupTag = 'XMLTag/09 - Tekst wciecie' or @MarkupTag = 'XMLTag/17 - Conflict' or @MarkupTag = 'XMLTag/10 - Piśmiennictwo - śródtytuł'">
                <XMLElement Self="{./@Self}" MarkupTag="{concat(substring-before(./@MarkupTag, '/'), '/para')}">
                    <xsl:apply-templates/>
                </XMLElement>
            </xsl:when>
				 <xsl:when test="@MarkupTag = 'XMLTag/ChapterAuthor' or @MarkupTag = 'XMLTag/Body Text' or @MarkupTag = 'XMLTag/ChapPartAuthor' or @MarkupTag = 'XMLTag/Box-01-DisplayEq-MathMode' or @MarkupTag = 'XMLTag/QuestionTxt'">
                <XMLElement Self="{./@Self}" MarkupTag="{concat(substring-before(./@MarkupTag, '/'), '/PARA')}">
                    <xsl:apply-templates/>
                </XMLElement>
            </xsl:when>
			 <xsl:when test="@MarkupTag = 'XMLTag/REF' or @MarkupTag = 'XMLTag/NP&gt;RD1' or @MarkupTag = 'XMLTag/NP1&gt;RD1' or @MarkupTag = 'XMLTag/DIA&gt;RD1' or @MarkupTag = 'XMLTag/N' or @MarkupTag = 'XMLTag/CH&gt;FT1' or @MarkupTag = 'XMLTag/CH&gt;FT1' or @MarkupTag = 'XMLTag/NL&gt;FT1' or @MarkupTag = 'XMLTag/QUES' or @MarkupTag = 'XMLTag/GLT&gt;CHBM' or @MarkupTag = 'XMLTag/DIA' or @MarkupTag = 'XMLTag/CH' or @MarkupTag = 'XMLTag/MCL'">
			 <XMLElement Self="di2" MarkupTag="XMLTag/listitem">
                <XMLElement Self="{./@Self}" MarkupTag="{concat(substring-before(./@MarkupTag, '/'), '/para')}">
				
                    <xsl:apply-templates/>
                </XMLElement>
                </XMLElement>
            </xsl:when>
			 <xsl:when test="@MarkupTag = 'XMLTag/endnote reference'">
			
                <XMLElement Self="{./@Self}" MarkupTag="{concat(substring-before(./@MarkupTag, '/'), '/sup')}">
				
                    <xsl:apply-templates/>
         
                </XMLElement>
            </xsl:when>

			 <xsl:when test="@MarkupTag = 'XMLTag/footnote reference'">
			
                <XMLElement Self="{./@Self}" MarkupTag="{concat(substring-before(./@MarkupTag, '/'), '/sup')}">
				
                    <xsl:apply-templates/>
         
                </XMLElement>
				  </xsl:when>
				 <xsl:when test="@MarkupTag = 'XMLTag/ERef'">
			
                <XMLElement Self="{./@Self}" MarkupTag="{concat(substring-before(./@MarkupTag, '/'), '/ERef')}">
				
                    <xsl:apply-templates/>
         
                </XMLElement>
            </xsl:when>
				 <xsl:when test="@MarkupTag = 'XMLTag/PRef'">
			
                <XMLElement Self="{./@Self}" MarkupTag="{concat(substring-before(./@MarkupTag, '/'), '/PRef')}">
				
                    <xsl:apply-templates/>
         
                </XMLElement>
            </xsl:when>
			<xsl:when test="@MarkupTag = 'XMLTag/EXT&gt;RD1' or @MarkupTag = 'XMLTag/CEPI&gt;RD1' or @MarkupTag = 'XMLTag/CEPIS&gt;RD1'  or @MarkupTag = 'XMLTag/EPI' or @MarkupTag = 'XMLTag/EPI-S' or @MarkupTag = 'XMLTag/CEPI-S&gt;RD1' or @MarkupTag = 'XMLTag/EXT-S&gt;RD1' or @MarkupTag = 'XMLTag/EXTS&gt;RD1'">
			
                <XMLElement Self="{./@Self}" MarkupTag="{concat(substring-before(./@MarkupTag, '/'), '/para')}">
				
                    <xsl:apply-templates/>
             
                </XMLElement>
            </xsl:when>
			<!--<xsl:when test="@MarkupTag = 'XMLTag/EXT'">
			
             
				
                    <xsl:apply-templates/>
             
            </xsl:when>
				<xsl:when test="@MarkupTag = 'XMLTag/PYTXT'">
			
             
				
                    <xsl:apply-templates/>
             
            </xsl:when>-->
			<xsl:when test="@MarkupTag = 'XMLTag/Hyperlink'">
			
                <XMLElement Self="{./@Self}" MarkupTag="{concat(substring-before(./@MarkupTag, '/'), '/xref')}">
				
                    <xsl:apply-templates/>
             
                </XMLElement>
            </xsl:when>
			    <xsl:otherwise>
                <xsl:element name="{name(.)}">
                    <xsl:copy-of select="@*"/>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:otherwise>
		
           <!-- <xsl:otherwise>
                <xsl:element name="XMLElement">
		
			
		
<xsl:choose>
<xsl:when test="@ContentControl = 'True' or @MarkupTag = 'XMLTag/chapter' or @MarkupTag = 'XMLTag/links' or @MarkupTag = 'XMLTag/title' or @MarkupTag = 'XMLTag/Image' or @MarkupTag = 'XMLTag/para' or @MarkupTag = 'XMLTag/title' or @MarkupTag = 'XMLTag/entry' or @MarkupTag = 'XMLTag/Cell' or @MarkupTag = 'XMLTag/tgroup' or @MarkupTag = 'XMLTag/table' or @MarkupTag = 'XMLTag/figure' or @MarkupTag = 'XMLTag/sidebar'">
       <xsl:copy-of select="@*"/>

</xsl:when>
<xsl:otherwise>
<xsl:attribute name="Self">
<xsl:value-of select="@Self"/>
</xsl:attribute>
<xsl:attribute name="MarkupTag">
<xsl:value-of select="'XMLTag/para'"/>
</xsl:attribute>
</xsl:otherwise>
			</xsl:choose>
		
			           
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:otherwise>-->
        </xsl:choose>
    </xsl:template>
<!-- Added for figure on 8-09-2021 -->
    <xsl:template match="XMLElement[@MarkupTag='XMLTag/figure'][child::XMLAttribute[@Name='xml:id']][following-sibling::XMLElement[@MarkupTag='XMLTag/source'][1]]">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
            <xsl:apply-templates select="following-sibling::XMLElement[@MarkupTag='XMLTag/source'][1]"/>
        </xsl:copy>
    </xsl:template>
    
    </xsl:stylesheet>