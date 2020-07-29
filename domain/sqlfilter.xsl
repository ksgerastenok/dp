<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:dp="http://www.datapower.com/extensions"
	xmlns:re="http://exslt.org/regular-expressions"
	xmlns:dc="http://www.datapower.com/param/config"
	extension-element-prefixes="dp re dc"
	exclude-result-prefixes="dp re dc">
	<dp:summary>
		<operation>filter</operation>
		<description>Scan document for SQL injection attacks.</description>
		<descriptionId>store.SQL-Injection-Filter.dpsummary.description</descriptionId>
	</dp:summary>
	<xsl:param name="dc:SQLPatternFile">
		<xsl:value-of select="'store:///SQL-Injection-Patterns.xml'"/>
	</xsl:param>
	<dp:param name="dc:SQLPatternFile" type="dmFSFile">
		<display>SQL Injection Pattern File</display>
		<displayId>store.SQL-Injection-Filter.param.SQLPatternFile.display</displayId>
		<location>store:</location>
		<location>local:</location>
		<default>store:///SQL-Injection-Patterns.xml</default>
		<description>The file containing patterns to search for in order to detect SQL injection attacks.</description>
		<descriptionId>store.SQL-Injection-Filter.param.SQLPatternFile.description</descriptionId>
	</dp:param>
	<!--dp:input-mapping href="local:///ffd/base-64.ffd" type="ffd"/-->
	<!--dp:output-mapping href="local:///ffd/base-64.ffd" type="ffd"/-->
        <xsl:import href="local:///functions.xsl"/>
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" dp:escaping="minimum"/>

	<xsl:template name="SQL-Injection-Test">
	        <xsl:param name="pType"/>
		<xsl:variable name="vDocument">
			<xsl:copy-of select="document($dc:SQLPatternFile/text())"/>
		</xsl:variable>
		<xsl:variable name="vControls">
			<xsl:choose>
				<xsl:when test="(($pType/text() = 'element'))">
					<xsl:apply-templates select="." mode="element"/>
				</xsl:when>
				<xsl:when test="(($pType/text() = 'global'))">
					<xsl:apply-templates select="." mode="global"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="''"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="vPatterns">
			<xsl:choose>
				<xsl:when test="(($pType/text() = 'element'))">
					<xsl:copy-of select="$vDocument/patterns/pattern[((@type = 'element'))]"/>
				</xsl:when>
				<xsl:when test="(($pType/text() = 'global'))">
					<xsl:copy-of select="$vDocument/patterns/pattern[((not(@type)))]"/>
					<xsl:copy-of select="$vDocument/patterns/pattern[((@type = 'global'))]"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="''"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="vResult">
			<xsl:for-each select="$vControls/control">
				<xsl:variable name="vControl">
					<xsl:copy-of select="."/>
				</xsl:variable>
				<xsl:for-each select="$vPatterns/pattern">
					<xsl:variable name="vPattern">
						<xsl:copy-of select="."/>
					</xsl:variable>
					<xsl:variable name="vCount">
						<xsl:value-of select="count(re:match(normalize-space($vControl/control/text()), normalize-space($vPattern/pattern/regex/text()), 'i'))"/>
					</xsl:variable>
					<xsl:if test="((not($vCount/text() = 0)))">
						<dp:reject>
							<xsl:value-of select="'VALUE: '"/>
							<xsl:value-of select="normalize-space($vControl/control/text())"/>
							<xsl:value-of select="';'"/>
							<xsl:value-of select="'NAME: '"/>
							<xsl:value-of select="normalize-space($vPattern/pattern/name/text())"/>
							<xsl:value-of select="';'"/>
							<xsl:value-of select="'REGEX: '"/>
							<xsl:value-of select="normalize-space($vPattern/pattern/regex/text())"/>
							<xsl:value-of select="'.'"/>
						</dp:reject>
					</xsl:if>
				</xsl:for-each>
			</xsl:for-each>
		</xsl:variable>
		<xsl:value-of select="$vResult/text()"/>
	</xsl:template>
	<xsl:template match="/">
		<xsl:variable name="vNode">
			<xsl:copy-of select="."/>
		</xsl:variable>
		<xsl:variable name="vElement">
			<xsl:call-template name="SQL-Injection-Test">
				<xsl:with-param name="pType">
					<xsl:value-of select="'element'"/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="vGlobal">
			<xsl:call-template name="SQL-Injection-Test">
				<xsl:with-param name="pType">
					<xsl:value-of select="'global'"/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="vResult">
			<xsl:copy-of select="$vNode/*"/>
		</xsl:variable>
		<xsl:copy-of select="$vResult/*"/>
	</xsl:template>
	<xsl:template match="/" mode="element">
		<xsl:apply-templates select="* | @* | text()" mode="element"/>
	</xsl:template>
	<xsl:template match="@*" mode="element">
		<xsl:element name="control">
			<xsl:value-of select="normalize-space(.)"/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="*" mode="element">
		<xsl:apply-templates select="* | @* | text()" mode="element"/>
	</xsl:template>
	<xsl:template match="text()" mode="element">
		<xsl:element name="control">
			<xsl:value-of select="normalize-space(.)"/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="/" mode="global">
		<xsl:element name="control">
			<xsl:apply-templates select="* | @* | text()" mode="global"/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="@*" mode="global">
		<xsl:value-of select="normalize-space(.)"/>
		<xsl:value-of select="' '"/>
	</xsl:template>
	<xsl:template match="*" mode="global">
		<xsl:apply-templates select="* | @* | text()" mode="global"/>
	</xsl:template>
	<xsl:template match="text()" mode="global">
		<xsl:value-of select="normalize-space(.)"/>
		<xsl:value-of select="' '"/>
	</xsl:template>
</xsl:stylesheet>
