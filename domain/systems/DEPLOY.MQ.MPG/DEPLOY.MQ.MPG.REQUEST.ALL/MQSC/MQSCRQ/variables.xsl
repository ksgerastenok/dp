<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:dp="http://www.datapower.com/extensions"
	xmlns:gw="http://sberbank.ru/sbt/functions"
	exclude-result-prefixes="dp gw"
	extension-element-prefixes="dp gw">
	<!--dp:input-mapping href="local:///ffd/base-64.ffd" type="ffd"/-->
	<!--dp:output-mapping href="local:///ffd/base-64.ffd" type="ffd"/-->
        <xsl:import href="local:///functions.xsl"/>
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" dp:escaping="minimum"/>

	<xsl:template match="/">
		<xsl:variable name="vNode">
			<xsl:copy-of select="."/>
		</xsl:variable>
		<xsl:variable name="vMQMD">
			<xsl:copy-of select="$vNode/Envelope/Header/header[((@name = 'MQMD'))]"/>
		</xsl:variable>
		<xsl:variable name="vMQXQH">
			<xsl:copy-of select="$vNode/Envelope/Header/header[((@name = 'MQXQH'))]"/>
		</xsl:variable>
		<xsl:variable name="vRqUID">
			<xsl:value-of select="normalize-space(substring-after($vMQXQH/header/MQXQH/MsgDesc/ReplyToQ/text(), 'AMQ.'))"/>
		</xsl:variable>
		<xsl:variable name="vDebug">
			<dp:set-variable name="'var://context/result/mq-md'" value="node-set($vMQMD/*)"/>
			<dp:set-variable name="'var://context/result/mq-xqh'" value="node-set($vMQXQH/*)"/>
			<dp:set-variable name="'var://context/result/rq-uid'" value="string($vRqUID/text())"/>
		</xsl:variable>
		<xsl:variable name="vResult">
			<xsl:copy-of select="$vNode/*"/>
		</xsl:variable>
		<xsl:copy-of select="$vResult/*"/>
	</xsl:template>
</xsl:stylesheet>
