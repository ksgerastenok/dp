<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:dp="http://www.datapower.com/extensions"
	xmlns:gw="http://sberbank.ru/sbt/functions"
	exclude-result-prefixes="dp gw"
	extension-element-prefixes="dp gw">
	<!--dp:input-mapping href="local:///ffd/base-16.ffd" type="ffd"/-->
	<!--dp:output-mapping href="local:///ffd/base-16.ffd" type="ffd"/-->
        <xsl:import href="local:///gwfunctions.xsl"/>
	<xsl:template match="/">
		<xsl:variable name="vNode">
			<xsl:copy-of select="."/>
		</xsl:variable>
		<xsl:variable name="vHeader">
			<xsl:call-template name="gw:HeaderWrite">
				<xsl:with-param name="pHeader">
					<header name="{'ReplyToQM'}">
						<xsl:value-of select="''"/>
					</header>
					<header name="{'ReplyToQ'}">
						<xsl:value-of select="''"/>
					</header>
				</xsl:with-param>
				<xsl:with-param name="pType">
					<xsl:value-of select="'response'"/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="vResult">
			<xsl:copy-of select="$vNode/*"/>
		</xsl:variable>
		<xsl:variable name="vDebug">
			<dp:set-variable name="'var://service/mpgw/skip-backside'" value="string('1')"/>
		</xsl:variable>
		<xsl:copy-of select="$vResult/*"/>
	</xsl:template>
</xsl:stylesheet>
