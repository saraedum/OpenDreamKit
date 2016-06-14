<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:ltx="http://dlmf.nist.gov/LaTeXML">

    <!-- suitable for output generated by LaTeXML -->

    <!-- the entries to search for -->
    <xsl:param name="file" select="'mkohlhase-article'"/>
    <xsl:variable name="pubs" select="substring-before($file,'-')"/>
    <xsl:variable name="type" select="substring-after($file,'-')"/>

    <xsl:output method="text"/>

    <xsl:template match="/">
      <xsl:text>\documentclass{article}
\usepackage{biblatex}
\usepackage{kwarcbibs}
\bibliography{kwarcpubs,kwarccrossrefs,extcrossrefs}
      </xsl:text>
      <xsl:apply-templates select="//ltx:bibentry[contains(ltx:bib-data[@role='pubs'],$pubs) and @type=$type]"/>
      <xsl:text>\printbibliography&#xA;\end{document}&#xA;</xsl:text>	
    </xsl:template>

    <xsl:template match="ltx:bibentry">
	<xsl:text>\nocite{</xsl:text>
	<xsl:value-of select="./@key"/>
	<xsl:text>}&#xA;</xsl:text>
    </xsl:template>      
</xsl:stylesheet>

