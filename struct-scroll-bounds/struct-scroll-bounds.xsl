<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- 
	Generates gradients when scroll is enabled

	Content
		content: Will be inside the scrollable div

	Options
		threshold: [0-1] Percentage of scroll to toggle bounds states
		axis: [x|y] Axis of the scroll

	Dependencies
		modules/auto-state-on-scroll-bounds.js,
		./struct-scroll-bounds.less
 -->

<!-- COMPONENT: struct-scroll-bounds -->
	<xsl:template name="struct-scroll-bounds">
		<xsl:param name="content" />
		<xsl:param name="threshold" select="0" />
		<xsl:param name="axis" select="'x'" />
		<xsl:param name="ext-attr" />
		<xsl:param name="ext-attr-bounds" />


		<!-- ATTRIBUTES -->
		<xsl:variable name="attr">
			<add class="overflow-hidden relative" />
			<add class="transition-scroll-bounds-ctn" />
			<!-- AXIS -->
			<xsl:choose>
				<!-- X -->
				<xsl:when test="$axis = 'x'">
					<add class="is-horizontal" />
				</xsl:when>
				<!-- Y -->
				<xsl:otherwise>
					<add class="is-vertical" />
				</xsl:otherwise>
			</xsl:choose>
			<!-- STATE (scroll bounds) -->
			<add class="js-scroll-bounds-ctn" />
			<xsl:copy-of select="$ext-attr"/>
			<add dev-component="struct-scroll-bounds" />
		</xsl:variable>

		<xsl:variable name="attr-bounds">
			<add class="overflow-scrolling-touch" />
			<!-- AXIS -->
			<xsl:choose>
				<!-- X -->
				<xsl:when test="$axis = 'x'">
					<add class="overflow-horizontal-auto" />
				</xsl:when>
				<!-- Y -->
				<xsl:otherwise>
					<add class="overflow-vertical-auto" />
				</xsl:otherwise>
			</xsl:choose>
			<!-- STATE (scroll bounds) -->
			<add class="js-scroll-bounds" />
			<add data-scroll-bounds-threshold="{$threshold}" />
			<xsl:copy-of select="$ext-attr-bounds" />
			<add dev-element="bounds" />
		</xsl:variable>


		<!-- STRUCTURE -->
		<xsl:call-template name="element">
			<xsl:with-param name="attr" select="$attr" />
			<xsl:with-param name="content">
				<!-- Bounds -->
				<xsl:call-template name="element">
					<xsl:with-param name="attr" select="$attr-bounds" />
					<xsl:with-param name="content" select="$content" />
				</xsl:call-template>
			</xsl:with-param> 
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>
