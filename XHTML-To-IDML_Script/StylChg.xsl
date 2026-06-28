<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
	<xsl:output method="xml" name="xml" indent="yes"/>
	<xsl:variable name="sr" select="document('Converted_Story/Styles.xml')"/>
	<!-- commented on 14-09-2021 heading bold italic not removed in diml character style italic also applied -->
	<!--Added to retain paragraph and character style on 2-11-2021-->
	<!-- Added to avoid (if both styles mismatch applied default "Bold Italic" issue) on 28-3-2022 -->
	<xsl:template match="@* | node()">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()"/>
		</xsl:copy>
	</xsl:template>

	<xsl:template match="ParagraphStyleRange">

		<xsl:variable name="qqq" select="@Name"/>


		<xsl:variable name="qqq3">
			<xsl:for-each select="$sr//ParagraphStyle">
				<xsl:variable name="qqq1" select="./@MatchStyle"/>
				<xsl:variable name="qqq2" select="substring-after(./@Self, 'ParagraphStyle/')"/>
				<xsl:choose>
					<xsl:when test="$qqq eq $qqq1">
						<xsl:value-of select="$qqq2"/>
					</xsl:when>
				</xsl:choose>
			</xsl:for-each>
		</xsl:variable>


		<xsl:copy>
			<xsl:attribute name="AppliedParagraphStyle">
				<xsl:choose>
					<xsl:when test="string-length($qqq3) = 0">
						<xsl:value-of select="concat('ParagraphStyle/', $qqq)"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat('ParagraphStyle/', $qqq3)"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:apply-templates select="@* | node()"/>
		</xsl:copy>

	</xsl:template>



    <!-- commented on 14-09-2021 heading bold italic not removed in diml character style italic also applied -->
	<!-- CharacterStyleRange[ancestor::ParagraphStyleRange[matches(@Name,'^([Hh][0-9])$')]][@FontStyle] -->
<!--Added to retain paragraph and character style on 2-11-2021-->
	<xsl:template match="CharacterStyleRange[ancestor::ParagraphStyleRange[@Name]][@FontStyle]">
		<xsl:variable name="Story_FontStyle">
				<xsl:value-of select="self::CharacterStyleRange/@FontStyle"/>
		</xsl:variable>
		<!--<xsl:variable name="qqq" select="@Name"/>-->
		
		<!--BLOWE 06/03/2020 added for Bold Italic for CharacterStyleRange by prakash -->
		<xsl:variable name="Story_Name" select="ancestor::ParagraphStyleRange/@Name"/>
		<xsl:variable name="Style_Name" select="$sr//ParagraphStyle[@MatchStyle =$Story_Name]/@MatchStyle"/>
		<xsl:variable name="Style_FontStyle" select="$sr//ParagraphStyle[@MatchStyle =$Story_Name]/@FontStyle"/>
		
		<xsl:variable name="Analysed_FontStyle">
			<xsl:choose>
				<xsl:when test="$Style_Name">
					<xsl:choose>
						<xsl:when test="$Story_FontStyle != $Style_FontStyle">
							<!--<xsl:value-of select="'Bold Italic'"/>-->
							<!-- Added to avoid (if both styles mismatch applied default "Bold Italic" issue) on 28-3-2022 -->
							<xsl:choose>
								<xsl:when test="$Story_FontStyle='Bold' and $Style_FontStyle='Semibold'">
									<xsl:value-of select="'Semibold'"/>
								</xsl:when>
								<xsl:when test="$Story_FontStyle='Italic' and $Style_FontStyle='Semibold'">
									<xsl:value-of select="'Semibold Italic'"/>
								</xsl:when>
								<xsl:when test="$Story_FontStyle='Bold' and $Style_FontStyle='Semibold Italic'">
									<xsl:value-of select="'Semibold Italic'"/>
								</xsl:when>
								<xsl:when test="$Story_FontStyle='Italic' and $Style_FontStyle='Semibold Italic'">
									<xsl:value-of select="'Semibold Italic'"/>
								</xsl:when>
								<xsl:when test="$Story_FontStyle='Bold' and $Style_FontStyle='Italic'">
									<xsl:value-of select="'Bold Italic'"/>
								</xsl:when>
								<xsl:when test="$Story_FontStyle='Italic' and $Style_FontStyle='Bold'">
									<xsl:value-of select="'Bold Italic'"/>
								</xsl:when>
								<xsl:when test="$Story_FontStyle='Bold' and $Style_FontStyle='Bold Italic'">
									<xsl:value-of select="'Bold Italic'"/>
								</xsl:when>
								<xsl:when test="$Story_FontStyle='Italic' and $Style_FontStyle='Bold Italic'">
									<xsl:value-of select="'Bold Italic'"/>
								</xsl:when>
								<xsl:when test="$Story_FontStyle='Bold Italic' and $Style_FontStyle='Italic'">
									<xsl:value-of select="'Bold Italic'"/>
								</xsl:when>
								<xsl:when test="$Story_FontStyle='Bold Italic' and $Style_FontStyle='Bold'">
									<xsl:value-of select="'Bold Italic'"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="$Story_FontStyle"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$Story_FontStyle"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		
		<xsl:copy>
			<xsl:copy-of select="@*"/>
			<xsl:if test="$Analysed_FontStyle">
				<xsl:attribute name="FontStyle" select="$Analysed_FontStyle"/>
			</xsl:if>
			<xsl:apply-templates select="node()"/>
		</xsl:copy>
		
	</xsl:template>

	<!--  <xsl:template match="ParagraphStyleRange">
		   
		   <xsl:variable name="qqq" select="substring-after(@AppliedParagraphStyle,'ParagraphStyle/')"/>
		 
<xsl:variable name="qqq3">
	   <xsl:for-each select="$sr//ParagraphStyle">
   		 <xsl:variable name="qqq1" select="substring-after(./@Self,'%3a')"/>
		  <xsl:variable name="qqq2" select="substring-after(substring-before(./@Self,'%3a'),'ParagraphStyle/')"/>
	  <xsl:choose>
	  <xsl:when test="$qqq eq $qqq1">
	  <xsl:value-of select="$qqq2"/>
	  
 	  </xsl:when>
	  </xsl:choose>	         
	</xsl:for-each>
</xsl:variable>
  <xsl:copy>
			<xsl:attribute name="AppliedParagraphStyle">
			<xsl:choose>
			<xsl:when test="string-length($qqq3)=0">
				<xsl:value-of select="concat('ParagraphStyle/',$qqq)"/>
			</xsl:when>
			<xsl:otherwise>
	
			<xsl:value-of select="concat('ParagraphStyle/',$qqq3,'%3a',$qqq)"/>
			</xsl:otherwise>
			</xsl:choose>
			</xsl:attribute>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
	 
	    </xsl:template>
		
		
		
		   <xsl:template match="CharacterStyleRange">
		   
		   <xsl:variable name="qqq" select="substring-after(@AppliedCharacterStyle,'CharacterStyle/')"/>
		 
<xsl:variable name="qqq3">
	   <xsl:for-each select="$sr//CharacterStyle">
   		 <xsl:variable name="qqq1" select="substring-after(./@Self,'%3a')"/>
		  <xsl:variable name="qqq2" select="substring-after(substring-before(./@Self,'%3a'),'CharacterStyle/')"/>
	  <xsl:choose>
	  <xsl:when test="$qqq eq $qqq1">
	  <xsl:value-of select="$qqq2"/>
	  
 	  </xsl:when>
	  </xsl:choose>	         
	</xsl:for-each>
</xsl:variable>
  <xsl:copy>
			<xsl:attribute name="AppliedCharacterStyle">
			<xsl:choose>
			<xsl:when test="string-length($qqq3)=0">
				<xsl:value-of select="concat('CharacterStyle/',$qqq)"/>
			</xsl:when>
			<xsl:otherwise>
	
			<xsl:value-of select="concat('CharacterStyle/',$qqq3,'%3a',$qqq)"/>
			</xsl:otherwise>
			</xsl:choose>
			</xsl:attribute>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
	 
	    </xsl:template>
			
		   <xsl:template match="CharacterStyleRange">
		   
		   <xsl:variable name="qqq" select="substring-after(@AppliedCharacterStyle,'CharacterStyle/')"/>
		<xsl:variable name="sty">   

   <xsl:for-each select="$sr//Row">
   		
                    <xsl:choose>
			
                        <xsl:when test="./style eq $qqq">
<xsl:value-of select="./updatedstyle"/>

	</xsl:when>
	
	         
	</xsl:choose>
	</xsl:for-each>
	</xsl:variable>
	  <xsl:copy>
			<xsl:attribute name="AppliedCharacterStyle">
			<xsl:choose>
			<xsl:when test="string-length($sty)=0">
				<xsl:value-of select="concat('CharacterStyle/',$qqq)"/>
			</xsl:when>
			<xsl:otherwise>
			<xsl:value-of select="concat('CharacterStyle/',$sty)"/>
			</xsl:otherwise>
			</xsl:choose>
			</xsl:attribute>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
	       
	    </xsl:template>
		
		
		
		
		
		
		
		
		
		
		
		
<xsl:template match="CharacterStyle">
		   
		   <xsl:variable name="qqq" select="substring-after(@Self,'CharacterStyle/')"/>
		    <xsl:variable name="qqq1" select="@Name"/>
		<xsl:variable name="sty">   

   <xsl:for-each select="$sr//Row">
   		
                    <xsl:choose>
			
                        <xsl:when test="./style eq $qqq">
<xsl:value-of select="./updatedstyle"/>

	</xsl:when>
	         
	</xsl:choose>
	</xsl:for-each>
	</xsl:variable>
	 <xsl:copy>
			<xsl:attribute name="Self">
			<xsl:choose>
				<xsl:when test="string-length($sty)=0">
		<xsl:value-of select="concat('CharacterStyle/',$qqq)"/>
			
			</xsl:when>
			<xsl:otherwise>
			<xsl:value-of select="concat('CharacterStyle/',$sty)"/>
			</xsl:otherwise>
			</xsl:choose>
			</xsl:attribute>
				<xsl:attribute name="Name">
			<xsl:choose>
			<xsl:when test="string-length($sty)=0">
			<xsl:value-of select="$qqq1"/>
			</xsl:when>
			<xsl:otherwise>
			<xsl:value-of select="$sty"/>
			</xsl:otherwise>
			</xsl:choose>
			</xsl:attribute>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
	      
	    </xsl:template>
		
		
		
		
		 <xsl:template match="ParagraphStyle">
		   
		   <xsl:variable name="qqq" select="substring-after(@Self,'ParagraphStyle/')"/>
		    <xsl:variable name="qqq1" select="@Name"/>
		<xsl:variable name="sty">   

   <xsl:for-each select="$sr//Row">
   		
                    <xsl:choose>
			
                        <xsl:when test="./style eq $qqq">
					
<xsl:value-of select="./updatedstyle"/>

	</xsl:when>
	         
	</xsl:choose>
	</xsl:for-each>
	</xsl:variable>
	 <xsl:copy>
			<xsl:attribute name="Self">
			<xsl:choose>
			<xsl:when test="string-length($sty)=0">
			<xsl:value-of select="concat('ParagraphStyle/',$qqq)"/>
			</xsl:when>
			<xsl:otherwise>
				
				
			<xsl:value-of select="concat('ParagraphStyle/',$sty)"/>
			</xsl:otherwise>
			</xsl:choose>
			</xsl:attribute>
				<xsl:attribute name="Name">
			<xsl:choose>
			<xsl:when test="string-length($sty)=0">
			<xsl:value-of select="$qqq1"/>
			</xsl:when>
			<xsl:otherwise>
			<xsl:value-of select="$sty"/>
			</xsl:otherwise>
			</xsl:choose>
			</xsl:attribute>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
	     
	    </xsl:template>
		
		
	
		<xsl:template match="ParagraphStyle/@Self"/>
		
		<xsl:template match="ParagraphStyle/@Name"/>
	<xsl:template match="CharacterStyle/@Self"/>
	
		
		<xsl:template match="CharacterStyle/@Name"/>
		<xsl:template match="@AppliedParagraphStyle"/>
		
	<xsl:template match="@AppliedCharacterStyle"/>-->
	<xsl:template match="@AppliedCharacterStyle"/>
	<xsl:template match="@AppliedParagraphStyle"/>

	<xsl:template
		match="CharacterStyleRange[@AppliedCharacterStyle = 'CharacterStyle/$ID/[No character style]'][@FontStyle | @Position | @StrikeThru | @Capitalization | @Underline][@ManualChar = '$ID/[No character style]'][@Name = '$ID/[No character style]']/@Name"/>
	<xsl:template
		match="CharacterStyleRange[@AppliedCharacterStyle = 'CharacterStyle/$ID/[No character style]'][@FontStyle | @Position | @StrikeThru | @Capitalization | @Underline][@ManualChar = '$ID/[No character style]'][@Name = '$ID/[No character style]']/@ManualChar"/>


	<xsl:template match="CharacterStyleRange">
		
		<xsl:variable name="qqq" select="@Name"/>
		
		<xsl:variable name="qqq3">
			<xsl:for-each select="$sr//CharacterStyle[not(@MatchStyle = preceding::CharacterStyle/@MatchStyle)]">
				<xsl:variable name="qqq1" select="./@MatchStyle"/>
				<xsl:variable name="qqq2" select="substring-after(./@Self, 'CharacterStyle/')"/>
				<xsl:choose>
					<xsl:when test="$qqq eq $qqq1">
						<xsl:value-of select="$qqq2"/>
					</xsl:when>
				</xsl:choose>
			</xsl:for-each>
		</xsl:variable>
		
		<xsl:copy>
			<xsl:attribute name="AppliedCharacterStyle">
				<xsl:choose>
					<xsl:when test="string-length($qqq3) = 0">
						<xsl:value-of select="concat('CharacterStyle/', $qqq)"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat('CharacterStyle/', $qqq3)"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
		
	</xsl:template>
	
	
</xsl:stylesheet>
