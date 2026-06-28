<?xml version="1.0" encoding="UTF-8"?>
<!--<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <!-\- 
        Identity Template: Copies all nodes and attributes by default.
        This is the ONLY template that should be used for final copying.
    -\->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <!-\- 
        Special template for the document root to ensure clean output structure.
    -\->
    <xsl:template match="/document">
        <document>
            <xsl:apply-templates select="Measurement"/>
        </document>
    </xsl:template>
    
    <!-\- 
        Main logic template for Measurement elements.
    -\->
    <xsl:template match="Measurement">
        <!-\- 
            LOGIC 1: Filter out Measurement blocks that have external links.
            A link is external if a @next points to an id in a different Measurement block.
        -\->
        <xsl:variable name="has-external-link" 
            select="exists(TextFrame[@next and //TextFrame[@id = current()/@next and not(ancestor::Measurement is current())]])" />
        
        <!-\- Only process the Measurement if it does NOT have external links. -\->
        <xsl:if test="not($has-external-link)">
            <xsl:copy>
                <xsl:apply-templates select="@*"/>
                
                <!-\- Copy non-TextFrame children in their original order -\->
                <xsl:apply-templates select="*[not(self::TextFrame)]"/>
                
                <!-\- 
                    LOGIC 2: Reorder TextFrames by following their chains.
                    We first build a variable containing the correctly ordered sequence of nodes.
                -\->
                <xsl:variable name="ordered-textframes" as="node()*">
                    <xsl:call-template name="build-ordered-sequence"/>
                </xsl:variable>
                
                <!-\- Now, apply the identity template to the TextFrames in their new, calculated order. -\->
                <xsl:apply-templates select="$ordered-textframes"/>
            </xsl:copy>
        </xsl:if>
    </xsl:template>
    
    <!-\- 
        This template calculates the final sequence of TextFrame nodes.
        It returns a sequence of nodes, not a tree fragment.
    -\->
    <xsl:template name="build-ordered-sequence">
        <xsl:variable name="all-frames" select="TextFrame"/>
        
        <!-\- 1. Find all "start" frames (frames that are not pointed to by any other frame in this Measurement) -\->
        <xsl:variable name="start-frames" select="$all-frames[not(@id = $all-frames/@next)]"/>
        
        <!-\- 2. Process each chain starting from a "start" frame and collect all its nodes -\->
        <xsl:variable name="chained-frames" as="node()*">
            <xsl:for-each select="$start-frames">
                <xsl:call-template name="traverse-chain">
                    <xsl:with-param name="current-frame" select="."/>
                    <xsl:with-param name="visited-ids" select="()"/>
                </xsl:call-template>
            </xsl:for-each>
        </xsl:variable>
        
        <!-\- 3. Find any frames that were not part of a chain (orphans or cycles with no start) -\->
        <xsl:variable name="chained-ids" select="$chained-frames/@id"/>
        <xsl:variable name="orphan-frames" select="$all-frames[not(@id = $chained-ids)]"/>
        
        <!-\- 4. Return the final, combined sequence: chained frames first, then orphans. -\->
        <xsl:sequence select="$chained-frames, $orphan-frames"/>
    </xsl:template>
    
    <!-\- 
        Recursive template to follow a single chain and return the nodes in that chain.
        It uses xsl:sequence to return nodes, not to create output.
    -\->
    <xsl:template name="traverse-chain">
        <xsl:param name="current-frame"/>
        <xsl:param name="visited-ids" as="xs:string*"/>
        
        <xsl:if test="not($current-frame/@id = $visited-ids)">
            <!-\- Return the current frame as part of the sequence -\->
            <xsl:sequence select="$current-frame"/>
            
            <!-\- Find the next frame in the chain -\->
            <xsl:variable name="next-frame" select="../TextFrame[@id = $current-frame/@next]"/>
            
            <xsl:if test="$next-frame">
                <!-\- Recurse to process the rest of the chain -\->
                <xsl:call-template name="traverse-chain">
                    <xsl:with-param name="current-frame" select="$next-frame"/>
                    <xsl:with-param name="visited-ids" select="($visited-ids, $current-frame/@id)"/>
                </xsl:call-template>
            </xsl:if>
        </xsl:if>
    </xsl:template>
    
</xsl:stylesheet>-->
<!--<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <!-\- 
        Identity Template: Copies all nodes and attributes by default.
        This is the ONLY template that should be used for final copying.
    -\->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <!-\- 
        Special template for the document root to ensure clean output structure.
    -\->
    <xsl:template match="/document">
        <document>
            <xsl:apply-templates select="Measurement"/>
        </document>
    </xsl:template>
    
    <!-\- 
        Main logic template for Measurement elements.
    -\->
    <xsl:template match="Measurement">
        <!-\- 
            LOGIC 1: Filter out Measurement blocks that have external links.
            A link is external if a @next points to an id in a different Measurement block.
        -\->
        <xsl:variable name="has-external-link" 
            select="exists(TextFrame[@next and //TextFrame[@id = current()/@next and not(ancestor::Measurement is current())]])" />
        
        <!-\- Only process the Measurement if it does NOT have external links. -\->
        <xsl:if test="not($has-external-link)">
            <xsl:copy>
                <xsl:apply-templates select="@*"/>
                
                <!-\- Copy non-TextFrame children in their original order -\->
                <xsl:apply-templates select="*[not(self::TextFrame)]"/>
                
                <!-\- 
                    LOGIC 2: Reorder TextFrames by following their chains.
                    We first build a variable containing the correctly ordered sequence of nodes.
                -\->
                <xsl:variable name="ordered-textframes" as="node()*">
                    <xsl:call-template name="build-ordered-sequence"/>
                </xsl:variable>
                
                <!-\- Now, apply the identity template to the TextFrames in their new, calculated order. -\->
                <xsl:apply-templates select="$ordered-textframes"/>
            </xsl:copy>
        </xsl:if>
    </xsl:template>
    
    <!-\- 
        This template calculates the final sequence of TextFrame nodes.
        It returns a sequence of nodes, not a tree fragment.
    -\->
    <xsl:template name="build-ordered-sequence">
        <xsl:variable name="all-frames" select="TextFrame"/>
        
        <!-\- 
            1. Find all "start" frames.
            Updated Logic: A start frame is one whose @previous attribute does NOT point to an ID 
            within the current list of frames. 
            This covers cases where @previous is 'n' (no previous) or points to an external page.
        -\->
        <xsl:variable name="start-frames" 
            select="$all-frames[not(@previous = $all-frames/@id)]"/>
        
        <!-\- 2. Process each chain starting from a "start" frame and collect all its nodes -\->
        <xsl:variable name="chained-frames" as="node()*">
            <xsl:for-each select="$start-frames">
                <xsl:call-template name="traverse-chain">
                    <xsl:with-param name="current-frame" select="."/>
                    <xsl:with-param name="visited-ids" select="()"/>
                </xsl:call-template>
            </xsl:for-each>
        </xsl:variable>
        
        <!-\- 3. Find any frames that were not part of a chain (orphans or cycles with no start) -\->
        <xsl:variable name="chained-ids" select="$chained-frames/@id"/>
        <xsl:variable name="orphan-frames" select="$all-frames[not(@id = $chained-ids)]"/>
        
        <!-\- 4. Return the final, combined sequence: chained frames first, then orphans. -\->
        <xsl:sequence select="$chained-frames, $orphan-frames"/>
    </xsl:template>
    
    <!-\- 
        Recursive template to follow a single chain and return the nodes in that chain.
        Updated Logic: It checks BOTH @next and @previous to validate the link.
    -\->
    <xsl:template name="traverse-chain">
        <xsl:param name="current-frame"/>
        <xsl:param name="visited-ids" as="xs:string*"/>
        
        <xsl:if test="not($current-frame/@id = $visited-ids)">
            <!-\- Return the current frame as part of the sequence -\->
            <xsl:sequence select="$current-frame"/>
            
            <!-\- 
                Find the next frame in the chain.
                Strict Logic: We only follow the link if:
                1. The target ID matches the current frame's @next.
                2. The target frame's @previous matches the current frame's ID.
            -\->
            <xsl:variable name="next-frame"  select="../TextFrame[@id = $current-frame/@next and @previous = $current-frame/@id]"/>
            
            <xsl:if test="$next-frame">
                <!-\- Recurse to process the rest of the chain -\->
                <xsl:call-template name="traverse-chain">
                    <xsl:with-param name="current-frame" select="$next-frame"/>
                    <xsl:with-param name="visited-ids" select="($visited-ids, $current-frame/@id)"/>
                </xsl:call-template>
            </xsl:if>
        </xsl:if>
    </xsl:template>
    
</xsl:stylesheet>-->
<!--<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <!-\- 
        Identity Template: Copies all nodes and attributes by default.
    -\->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <!-\- 
        Special template for the document root to ensure clean output structure.
    -\->
    <xsl:template match="/document">
        <document>
            <xsl:apply-templates select="Measurement"/>
        </document>
    </xsl:template>
    
    <!-\- 
        Main logic template for Measurement elements.
    -\->
    <xsl:template match="Measurement">
        <!-\- 
            LOGIC 1: Filter out Measurement blocks that have external links.
        -\->
        <xsl:variable name="has-external-link" 
            select="exists(TextFrame[@next and //TextFrame[@id = current()/@next and not(ancestor::Measurement is current())]])" />
        
        <xsl:if test="not($has-external-link)">
            <xsl:copy>
                <xsl:apply-templates select="@*"/>
                <xsl:apply-templates select="*[not(self::TextFrame)]"/>
                
                <xsl:variable name="ordered-textframes" as="node()*">
                    <xsl:call-template name="build-ordered-sequence"/>
                </xsl:variable>
                
                <xsl:apply-templates select="$ordered-textframes"/>
            </xsl:copy>
        </xsl:if>
    </xsl:template>
    
    <!-\- 
        This template calculates the final sequence of TextFrame nodes.
    -\->
    <xsl:template name="build-ordered-sequence">
        <xsl:variable name="all-frames" select="TextFrame"/>
        
        <!-\- 
            FIX: 1. Find "start" frames STRICTLY.
            
            Logic: A frame is ONLY a start frame if @previous is 'n' or missing.
            If @previous points to an ID that is NOT in this block (e.g. a previous page),
            we do NOT treat it as a start frame. We leave it alone (it falls to the 'orphan' list).
            
            This prevents frames like 'u18c2' (which expects a previous frame from another block)
            from jumping to the top of the list.
        -\->
        <xsl:variable name="start-frames" 
            select="$all-frames[@previous = 'n' or not(@previous)]"/>
        
        <!-\- 2. Process each chain starting from a "start" frame -\->
        <xsl:variable name="chained-frames" as="node()*">
            <xsl:for-each select="$start-frames">
                <xsl:call-template name="traverse-chain">
                    <xsl:with-param name="current-frame" select="."/>
                    <xsl:with-param name="visited-ids" select="()"/>
                </xsl:call-template>
            </xsl:for-each>
        </xsl:variable>
        
        <!-\- 3. Find any frames that were not part of a chain (orphans or broken links) -\->
        <xsl:variable name="chained-ids" select="$chained-frames/@id"/>
        <xsl:variable name="orphan-frames" select="$all-frames[not(@id = $chained-ids)]"/>
        
        <!-\- 4. Return the final, combined sequence: chained frames first, then orphans. -\->
        <xsl:sequence select="$chained-frames, $orphan-frames"/>
    </xsl:template>
    
    <!-\- 
        Recursive template to follow a single chain.
    -\->
    <xsl:template name="traverse-chain">
        <xsl:param name="current-frame"/>
        <xsl:param name="visited-ids" as="xs:string*"/>
        
        <xsl:if test="not($current-frame/@id = $visited-ids)">
            <xsl:sequence select="$current-frame"/>
            
            <!-\- 
                STRICT LINK CHECK:
                Only follow if @next matches target ID AND target @previous matches current ID.
                This ensures we don't jump to unrelated frames that happen to have the same ID.
            -\->
            <xsl:variable name="next-frame" 
                select="../TextFrame[@id = $current-frame/@next and @previous = $current-frame/@id]"/>
            
            <xsl:if test="$next-frame">
                <xsl:call-template name="traverse-chain">
                    <xsl:with-param name="current-frame" select="$next-frame"/>
                    <xsl:with-param name="visited-ids" select="($visited-ids, $current-frame/@id)"/>
                </xsl:call-template>
            </xsl:if>
        </xsl:if>
    </xsl:template>
    
</xsl:stylesheet>-->
<!--<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:local="http://local"
    xmlns:mf="http://example.com/mf"
    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    xmlns:idPkg="http://schemas.openxmlformats.org/wordprocessingml/2006/main" 
    exclude-result-prefixes="xs local mf idPkg"  version="2.0">
    <xsl:output method="xml" indent="yes" name="xml"/>
        
    <!-\- Identity Template -\->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <!-\-<!-\\- Handle Root to add namespace -\\->
    <xsl:template match="/document">
        <document xmlns:xs="http://www.w3.org/2001/XMLSchema">
            <xsl:apply-templates select="@*|node()"/>
        </document>
    </xsl:template>
    <!-\\- Handle Measurement Elements -\\->
    <xsl:template match="Measurement">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            
            <!-\\- 1. Output Page and Margin elements in their original order -\\->
            <xsl:apply-templates select="Page | Margin"/>
            
            <!-\\- 2. Process TextFrames -\\->
            <xsl:variable name="textFrames" select="TextFrame"/>
            
            <!-\\- Group TextFrames by 'story' to keep stories separate. 
                 Groups are created in the order of first appearance (no sort on groups). -\\->
            <xsl:for-each-group select="$textFrames" group-by="@story">
                
                <!-\\- Within each story group, sort by the calculated chain depth -\\->
                <xsl:for-each select="current-group()">
                    <xsl:sort select="local:calculateDepth(., current-group())" data-type="number"/>
                    <xsl:apply-templates select="."/>
                </xsl:for-each>
                
            </xsl:for-each-group>
        </xsl:copy>
    </xsl:template>
    
    <!-\\- 
       Recursive function to calculate the depth/index of a TextFrame in its chain.
       It looks at the 'previous' attribute. If the previous frame exists in the current pool (group),
       it adds 1 to the depth of that previous frame.
    -\\->
    <xsl:function name="local:calculateDepth" as="xs:integer">
        <xsl:param name="currentFrame" as="element()"/>
        <xsl:param name="storyPool" as="element()*"/>
        
        <xsl:variable name="prevId" select="$currentFrame/@previous"/>
        
        <xsl:choose>
            <!-\\- Base case: no previous link, or previous link is not in this group (external link), or previous is 'n' -\\->
            <xsl:when test="not($prevId) or $prevId = 'n' or not($storyPool[@id = $prevId])">
                <xsl:sequence select="0"/>
            </xsl:when>
            <!-\\- Recursive step: depth = 1 + depth(previous) -\\->
            <xsl:otherwise>
                <xsl:variable name="prevFrame" select="$storyPool[@id = $prevId]"/>
                <xsl:sequence select="1 + local:calculateDepth($prevFrame, $storyPool)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>-\->
    
    <!-\- Handle Root to add namespace -\->
    <xsl:template match="/document">
        <document xmlns:xs="http://www.w3.org/2001/XMLSchema">
            <xsl:apply-templates select="@*|node()"/>
        </document>
    </xsl:template>
    
    <!-\- Handle Measurement Elements -\->
    <xsl:template match="Measurement">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            
            <!-\- 
                1. Copy all elements that are NOT TextFrames in their original order.
                This includes Page, Margin, and Group elements.
                This ensures Groups are included but are not subject to the "moving logic".
            -\->
            <xsl:apply-templates select="*[not(self::TextFrame)]"/>
            
            <!-\- 2. Process TextFrames with moving/sorting logic -\->
            <xsl:variable name="textFrames" select="TextFrame"/>
            
            <!-\- Group TextFrames by 'story' to keep stories separate. 
                 Groups are created in the order of first appearance (no sort on groups). -\->
            <xsl:for-each-group select="$textFrames" group-by="@story">
                
                <!-\- Within each story group, sort by the calculated chain depth -\->
                <xsl:for-each select="current-group()">
                    <xsl:sort select="local:calculateDepth(., current-group())" data-type="number"/>
                    <xsl:apply-templates select="."/>
                </xsl:for-each>
                
            </xsl:for-each-group>
        </xsl:copy>
    </xsl:template>
    
    <!-\- 
       Recursive function to calculate the depth/index of a TextFrame in its chain.
       It looks at the 'previous' attribute. If the previous frame exists in the current pool (group),
       it adds 1 to the depth of that previous frame.
    -\->
    <xsl:function name="local:calculateDepth" as="xs:integer">
        <xsl:param name="currentFrame" as="element()"/>
        <xsl:param name="storyPool" as="element()*"/>
        
        <xsl:variable name="prevId" select="$currentFrame/@previous"/>
        
        <xsl:choose>
            <!-\- Base case: no previous link, or previous link is not in this group (external link), or previous is 'n' -\->
            <xsl:when test="not($prevId) or $prevId = 'n' or not($storyPool[@id = $prevId])">
                <xsl:sequence select="0"/>
            </xsl:when>
            <!-\- Recursive step: depth = 1 + depth(previous) -\->
            <xsl:otherwise>
                <xsl:variable name="prevFrame" select="$storyPool[@id = $prevId]"/>
                <xsl:sequence select="1 + local:calculateDepth($prevFrame, $storyPool)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
</xsl:stylesheet>-->
<!--<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:local="http://local"
    xmlns:mf="http://example.com/mf"
    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    xmlns:idPkg="http://schemas.openxmlformats.org/wordprocessingml/2006/main" 
    exclude-result-prefixes="xs local mf idPkg" version="2.0">
    
    <xsl:output method="xml" indent="yes" name="xml"/>
    
    <!-\- Identity Template -\->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <!-\- Handle Root to add namespace -\->
    <xsl:template match="/document">
        <document xmlns:xs="http://www.w3.org/2001/XMLSchema">
            <xsl:apply-templates select="@*|node()"/>
        </document>
    </xsl:template>
    
    <!-\- Handle Measurement Elements -\->
    <xsl:template match="Measurement">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            
            <!-\- 
               1. Prepare the sorted list of TextFrames first.
                  We group by story and sort by depth within those groups.
            -\->
            <xsl:variable name="textFrames" select="TextFrame"/>
            
            <xsl:variable name="sortedTextFrames">
                <xsl:for-each-group select="$textFrames" group-by="@story">
                    <!-\- Within each story group, sort by the calculated chain depth -\->
                    <xsl:for-each select="current-group()">
                        <xsl:sort select="local:calculateDepth(., current-group())" data-type="number"/>
                        <xsl:sequence select="."/>
                    </xsl:for-each>
                </xsl:for-each-group>
            </xsl:variable>
            
            <!-\- 
               2. Iterate through the ORIGINAL children (Page, Margin, Group, TextFrame).
                  This ensures that Groups and other non-TextFrame elements stay in their exact original indices.
            -\->
            <xsl:for-each select="*">
                <xsl:choose>
                    <xsl:when test="self::TextFrame">
                        <!-\- 
                           If the current node is a TextFrame, we replace it with the 
                           corresponding TextFrame from our sorted list.
                           The index is determined by how many TextFrames have appeared before this one.
                        -\->
                        <xsl:variable name="textIndex" select="count(preceding-sibling::TextFrame) + 1"/>
                        <xsl:apply-templates select="$sortedTextFrames[$textIndex]"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <!-\- 
                           For non-TextFrame elements (Page, Margin, Group), 
                           simply apply templates to keep them in their existing place.
                        -\->
                        <xsl:apply-templates select="."/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
            
        </xsl:copy>
    </xsl:template>
    
    <!-\- 
       Recursive function to calculate the depth/index of a TextFrame in its chain.
    -\->
    <xsl:function name="local:calculateDepth" as="xs:integer">
        <xsl:param name="currentFrame" as="element()"/>
        <xsl:param name="storyPool" as="element()*"/>
        
        <xsl:variable name="prevId" select="$currentFrame/@previous"/>
        
        <xsl:choose>
            <xsl:when test="not($prevId) or $prevId = 'n' or not($storyPool[@id = $prevId])">
                <xsl:sequence select="0"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="prevFrame" select="$storyPool[@id = $prevId]"/>
                <xsl:sequence select="1 + local:calculateDepth($prevFrame, $storyPool)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
</xsl:stylesheet>-->
<!--<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:local="http://local"
    xmlns:mf="http://example.com/mf"
    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    xmlns:idPkg="http://schemas.openxmlformats.org/wordprocessingml/2006/main" 
    exclude-result-prefixes="xs local mf idPkg" version="2.0">
    
    <xsl:output method="xml" indent="yes" name="xml"/>
    
    <!-\- Identity Template -\->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <!-\- Handle Root to add namespace -\->
    <xsl:template match="/MAPS">
        <MAPS xmlns:xs="http://www.w3.org/2001/XMLSchema">
            <xsl:apply-templates select="@*|node()"/>
        </MAPS>
    </xsl:template>
    
    <!-\- Handle Measurement Elements -\->
    <xsl:template match="Measurement">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            
            <!-\- 1. Select all TextFrames -\->
            <xsl:variable name="textFrames" select="TextFrame"/>
            
            <!-\- 2. Prepare the globally sorted TextFrames based on Logic 1-4 -\->
            <xsl:variable name="sortedTextFrames">
                <xsl:for-each select="$textFrames">
                    
                    <!-\- Logic 5: Keep existing logic (Chain Depth) as tie-breaker for identical positions -\->
                    <xsl:sort select="local:calculateDepth(., $textFrames)" data-type="number"/>
                    
                   <!-\- <!-\\- Logic 1: Sort by pageNo_rowman_2_int (Ascending) -\\->
                    <xsl:sort select="number(@pageNo_rowman_2_int)" data-type="number" order="ascending"/>
                    
                    <!-\\- Logic 2: Sort by column (Ascending) -\\->
                    <xsl:sort select="number(@column)" data-type="number" order="ascending"/>
                    
                    <!-\\- Logic 3: Sort by txFrameY (Ascending) -\\->
                    <xsl:sort select="number(@txFrameY)" data-type="number" order="ascending"/>
                    
                    <!-\\- Logic 4: Sort by txFrameX (Ascending) -\\->
                    <xsl:sort select="number(@txFrameX)" data-type="number" order="ascending"/>-\->
                    
              
                    
                    <xsl:sequence select="."/>
                </xsl:for-each>
            </xsl:variable>
            
            <!-\- 3. Iterate through ORIGINAL children to preserve position of Groups/Pages -\->
            <xsl:for-each select="*">
                <xsl:choose>
                    <xsl:when test="self::TextFrame">
                        <!-\- 
                           Replace this TextFrame position with the next one from the sorted list.
                        -\->
                        <xsl:variable name="textIndex" select="count(preceding-sibling::TextFrame) + 1"/>
                        <xsl:apply-templates select="$sortedTextFrames[$textIndex]"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <!-\- Keep other elements (Page, Margin, Group) in their existing place -\->
                        <xsl:apply-templates select="."/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
            
        </xsl:copy>
    </xsl:template>
    
    <!-\- 
       Recursive function to calculate the depth/index of a TextFrame in its chain.
       Used here for Logic 5 (Tie-breaking).
    -\->
    <xsl:function name="local:calculateDepth" as="xs:integer">
        <xsl:param name="currentFrame" as="element()"/>
        <xsl:param name="storyPool" as="element()*"/>
        
        <xsl:variable name="prevId" select="$currentFrame/@previous"/>
        
        <xsl:choose>
            <xsl:when test="not($prevId) or $prevId = 'n' or not($storyPool[@id = $prevId])">
                <xsl:sequence select="0"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="prevFrame" select="$storyPool[@id = $prevId]"/>
                <xsl:sequence select="1 + local:calculateDepth($prevFrame, $storyPool)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
</xsl:stylesheet>-->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:local="http://local"
    xmlns:mf="http://example.com/mf"
    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    xmlns:idPkg="http://schemas.openxmlformats.org/wordprocessingml/2006/main" 
    exclude-result-prefixes="xs local mf idPkg" version="2.0">
    
    <xsl:output method="xml" indent="yes" name="xml"/>
    
    <!-- Identity Template -->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Handle Root to add namespace -->
    <xsl:template match="/MAPS">
        <MAPS xmlns:xs="http://www.w3.org/2001/XMLSchema">
            <xsl:apply-templates select="@*|node()"/>
        </MAPS>
    </xsl:template>
    
    <!-- Handle Measurement Elements -->
    <xsl:template match="Measurement">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            
            <!-- 
                1. Filter TextFrames:
                Select only frames that are part of a chain.
                Logic: Exclude frames where previous='n' AND next='n' (Isolated frames).
            -->
            <xsl:variable name="linkedFrames" select="TextFrame[not(@previous='n' and @next='n')]"/>
            
            <!-- 
                2. Prepare the sorted TextFrames based on Logic 1-5 
                Sorting only the Linked frames.
            -->
            <xsl:variable name="sortedLinkedFrames">
                <xsl:for-each select="$linkedFrames">
                    
                   <!-- <!-\- Logic 1: Sort by pageNo_rowman_2_int (Ascending) -\->
                    <xsl:sort select="number(@pageNo_rowman_2_int)" data-type="number" order="ascending"/>
                    
                    <!-\- Logic 2: Sort by column (Ascending) -\->
                    <xsl:sort select="number(@column)" data-type="number" order="ascending"/>
                    
                    <!-\- Logic 3: Sort by txFrameY (Ascending) -\->
                    <xsl:sort select="number(@txFrameY)" data-type="number" order="ascending"/>
                    
                    <!-\- Logic 4: Sort by txFrameX (Ascending) -\->
                    <xsl:sort select="number(@txFrameX)" data-type="number" order="ascending"/>-->
                    
                    <!-- Logic 5: Chain Depth (Tie-breaker/Link order) -->
                    <xsl:sort select="local:calculateDepth(., $linkedFrames)" data-type="number"/>
                    
                    <xsl:sequence select="."/>
                </xsl:for-each>
            </xsl:variable>
            
            <!-- 
                3. Iterate through ORIGINAL children to preserve position of Groups/Pages/IsolatedTextFrames 
            -->
            <xsl:for-each select="*">
                <xsl:choose>
                    <xsl:when test="self::TextFrame">
                        <!-- 
                            Determine if this TextFrame is Isolated (not linked) or Linked.
                            Logic: Check if previous AND next are 'n'.
                        -->
                        <xsl:variable name="isIsolated" select="@previous = 'n' and @next = 'n'"/>
                        
                        <xsl:choose>
                            <xsl:when test="$isIsolated">
                                <!-- 
                                   CASE: Isolated TextFrame
                                   Do not move. Just copy it as is.
                                -->
                                <xsl:apply-templates select="."/>
                            </xsl:when>
                            <xsl:otherwise>
                                <!-- 
                                   CASE: Linked TextFrame
                                   Replace this position with the next item from the sorted list.
                                   Calculate index based on how many linked frames preceded this one in the source.
                                -->
                                <xsl:variable name="textIndex" select="count(preceding-sibling::TextFrame[not(@previous='n' and @next='n')]) + 1"/>
                                <xsl:apply-templates select="$sortedLinkedFrames[$textIndex]"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <!-- Keep other elements (Page, Margin, Group) in their existing place -->
                        <xsl:apply-templates select="."/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
            
        </xsl:copy>
    </xsl:template>
    
    <!-- 
       Recursive function to calculate the depth/index of a TextFrame in its chain.
    -->
    <xsl:function name="local:calculateDepth" as="xs:integer">
        <xsl:param name="currentFrame" as="element()"/>
        <xsl:param name="storyPool" as="element()*"/>
        
        <xsl:variable name="prevId" select="$currentFrame/@previous"/>
        
        <xsl:choose>
            <xsl:when test="not($prevId) or $prevId = 'n' or not($storyPool[@id = $prevId])">
                <xsl:sequence select="0"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="prevFrame" select="$storyPool[@id = $prevId]"/>
                <xsl:sequence select="1 + local:calculateDepth($prevFrame, $storyPool)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
</xsl:stylesheet>