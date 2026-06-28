<xsl:stylesheet version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:h="http://www.w3.org/1999/xhtml"
  xmlns:f="urn:abbr-func"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="f h xs">

  <!-- Output settings: no extra indentation -->
  <xsl:output method="xml" indent="no"/>

  <!-- 1. Load abbreviation map (from JSON-derived abbrev-map.xml) -->
  <xsl:variable name="abbrev-doc" select="doc('abbrev-map.xml')"/>

  <!-- 2. Key: code -> <item> in the map -->
  <xsl:key name="k-abbr" match="item" use="@code"/>

  <!-- 3. Function: expansion text for a code (case-sensitive) -->
  <xsl:function name="f:expansion-for" as="xs:string?">
    <xsl:param name="code" as="xs:string"/>
    <xsl:sequence select="(key('k-abbr', $code, $abbrev-doc)/@expansion)[1]"/>
  </xsl:function>

  <!-- 4. Identity template: copy everything unchanged by default -->
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <!-- 5. Special handling for <p>: merge runs of span.abbreviation into <abbr> -->
  <xsl:template match="h:p">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>

      <xsl:for-each-group select="node()"
                          group-adjacent="
                            if (self::h:span[contains(concat(' ', @class, ' '), ' abbreviation ')])
                            then 'abbr'
                            else concat('other-', position())
                          ">
        <xsl:choose>
          <!-- Group is a run of abbreviation spans -->
          <xsl:when test="current-group()[1][self::h:span[contains(concat(' ', @class, ' '), ' abbreviation ')]]">
            <xsl:call-template name="emit-abbr">
              <xsl:with-param name="abbr-spans" select="current-group()"/>
            </xsl:call-template>
          </xsl:when>

          <!-- All other nodes: normal processing -->
          <xsl:otherwise>
            <xsl:apply-templates select="current-group()"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each-group>
    </xsl:copy>
  </xsl:template>

  <!-- 6. Emit a single <abbr> from a group of span.abbreviation -->
  <xsl:template name="emit-abbr">
    <xsl:param name="abbr-spans" as="element(h:span)+"/>

    <!-- Concatenate the run's text: e.g. R + RESE + M => RRESEM -->
    <xsl:variable name="code" as="xs:string"
                  select="string-join($abbr-spans/normalize-space(), '')"/>

    <xsl:variable name="first" select="$abbr-spans[1]"/>

    <!-- Nearest preceding run of span.abbreviation-expansion siblings -->
    <xsl:variable name="expansion-spans" as="element(h:span)*">
      <xsl:for-each-group select="$first/preceding-sibling::*"
                          group-ending-with="h:span[contains(concat(' ', @class, ' '),
                                                             ' abbreviation-expansion ')]">
        <xsl:if test="position() = last()">
          <xsl:sequence
            select="current-group()[self::h:span[contains(concat(' ', @class, ' '),
                                                         ' abbreviation-expansion ')]]"/>
        </xsl:if>
      </xsl:for-each-group>
    </xsl:variable>

    <xsl:variable name="local-expansion" as="xs:string?"
                  select="normalize-space(string-join($expansion-spans//text(), ''))"/>

    <!-- Fallback: expansion from JSON-derived map -->
    <xsl:variable name="global-expansion" as="xs:string?"
                  select="f:expansion-for($code)"/>

    <xsl:variable name="expansion" as="xs:string?"
                  select="if (string-length($local-expansion) gt 0)
                          then $local-expansion
                          else $global-expansion"/>

    <!-- Output -->
    <xsl:choose>
      <!-- If we know an expansion (either local or from JSON) -->
      <xsl:when test="$expansion">
        <!-- Create <abbr> explicitly in XHTML namespace -->
        <xsl:element name="abbr" namespace="http://www.w3.org/1999/xhtml">
          <xsl:attribute name="title" select="$expansion"/>
          <xsl:value-of select="$code"/>
        </xsl:element>
      </xsl:when>
      <!-- If there is no expansion at all, just emit the plain abbreviation text -->
      <xsl:otherwise>
        <xsl:value-of select="$code"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>