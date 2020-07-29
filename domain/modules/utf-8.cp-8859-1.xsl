<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:dp="http://www.datapower.com/extensions"
	xmlns:gw="http://sberbank.ru/sbt/functions"
	exclude-result-prefixes="dp gw"
	extension-element-prefixes="dp gw">
	<dp:input-mapping href="local:///ffd/utf-8.ffd" type="ffd"/>
	<dp:output-mapping href="local:///ffd/cp-8859-1.ffd" type="ffd"/>
        <xsl:import href="local:///functions.xsl"/>
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" dp:escaping="minimum"/>

	<xsl:template match="/">
		<xsl:variable name="vNode">
			<xsl:copy-of select="."/>
		</xsl:variable>
		<xsl:variable name="vResult">
			<xsl:copy-of select="$vNode/*"/>
		</xsl:variable>
		<xsl:copy-of select="$vResult/*"/>
	</xsl:template>
</xsl:stylesheet>
