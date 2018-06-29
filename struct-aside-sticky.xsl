<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- COMPONENT: struct-aside-sticky -->
	<xsl:template name="struct-aside-sticky">
		<xsl:param name="content-aside" />
		<xsl:param name="content-main" />
		<xsl:param name="attr" />
		<xsl:param name="attr-aside" />
		<xsl:param name="attr-main" />


		<!-- COMPUTED ATTRIBUTES -->
		<xsl:variable name="computed-attr">
			<add class="relative flexbox" />
			<xsl:copy-of select="$attr"/>
			<add dev-component="struct-aside-sticky" />
		</xsl:variable>

		<xsl:variable name="computed-attr-aside">
			<add class="sticky top" />
			<add class="max-height-full-viewport" />
			<add class="overflow-y-auto overflow-scrolling-touch" />
			<xsl:copy-of select="$attr-aside" />
			<add dev-element="aside" />
		</xsl:variable>

		<xsl:variable name="computed-attr-main">
			<xsl:copy-of select="$attr-main" />
			<add dev-element="main" />
		</xsl:variable>


		<!-- STRUCTURE -->
		<xsl:call-template name="element">
			<xsl:with-param name="attr" select="$computed-attr" />
			<xsl:with-param name="content">
				<!-- ASIDE -->
				<xsl:call-template name="element">
					<xsl:with-param name="attr" select="$computed-attr-aside" />
					<xsl:with-param name="element" select="'aside'" />
					<xsl:with-param name="content" select="$content-aside" />
				</xsl:call-template>
				<!-- MAIN -->
				<xsl:call-template name="element">
					<xsl:with-param name="attr" select="$computed-attr-main" />
					<xsl:with-param name="element" select="'main'" />
					<xsl:with-param name="content" select="$content-main" />
				</xsl:call-template>
			</xsl:with-param> 
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>
