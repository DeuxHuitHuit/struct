<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- COMPONENT: struct-modal -->
	<xsl:template name="struct-modal">
		<xsl:param name="content-modal" />
		<xsl:param name="content-close" />
		<xsl:param name="id" />
		<xsl:param name="show-background" select="true()" />
		<xsl:param name="is-visible" select="false()" />
		<xsl:param name="ext-attr" />
		<xsl:param name="ext-attr-background" />
		<xsl:param name="ext-ctn" />
		<xsl:param name="ext-close-ctn" />

		<!-- For background and close button -->
		<xsl:variable name="util-close-attr">
			<add class="js-change-state-click" />
			<add data-change-state-click-target='.js-struct-modal[data-id="{$ref-id}"]' />
			<add data-change-state-click="visible" />
			<add data-change-state-action="off" />
			<add data-change-state-click-target-common-ancestor="#site" />
		</xsl:variable>

		<!-- ATTRIBUTES -->
		<xsl:variable name="attr">
			<add class="fixed fill z-index-100" />
			<add class="flexbox" />
			<!-- OPTION: is-visible -->
			<xsl:if test="$is-visible">
				<add class="is-visible" />
			</xsl:if>
			<add class="transition-struct-modal" />
			<add class="js-struct-modal" />
			<add data-id="{$id}" />
			<xsl:copy-of select="$ext-attr"/>
			<add dev-component="struct-modal" />
		</xsl:variable>

		<xsl:variable name="attr-background">
			<add class="absolute fill cursor-pointer" />
			<!-- STATE (click): visible ~> OFF -->
			<xsl:copy-of select="$util-close-attr" />
			<add class="transition-background" />
			<add dev-element="background" />
		</xsl:variable>

		<xsl:variable name="attr-ctn">
			<add dev-element="ctn" />
		</xsl:variable>

		<xsl:variable name="attr-close-ctn">
			<!-- STATE (click): visible ~> OFF -->
			<xsl:copy-of select="$util-close-attr" />
			<add dev-element="close-ctn" />
		</xsl:variable>


		<!-- STRUCTURE -->
		<xsl:call-template name="element">
			<xsl:with-param name="attr" select="$attr" />
			<xsl:with-param name="content">
				<!-- Background -->
				<xsl:if test="$show-background">
					<xsl:call-template name="element">
						<xsl:with-param name="attr" select="$attr-background" />
					</xsl:call-template>
				</xsl:if>
				<!-- Ctn -->
				<xsl:call-template name="element">
					<xsl:with-param name="attr" select="$attr-ctn" />
					<xsl:with-param name="content">
						<!-- Close ctn -->
						<xsl:call-template name="element">
							<xsl:with-param name="attr" select="$attr-close-ctn" />
							<xsl:with-param name="content">
								<xsl:copy-of select="$content-close" />
							</xsl:with-param>
						</xsl:call-template>
						<!-- Content modal -->
						<xsl:copy-of select="$content-modal" />
					</xsl:with-param>
				</xsl:call-template>
			</xsl:with-param> 
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>
