<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:dp="http://www.datapower.com/extensions"
	xmlns:gw="http://sberbank.ru/sbt/functions"
	exclude-result-prefixes="dp gw"
	extension-element-prefixes="dp gw">
	<dp:input-mapping href="local:///ffd/base-16.ffd" type="ffd"/>
	<dp:output-mapping href="local:///ffd/base-16.ffd" type="ffd"/>
        <xsl:import href="local:///functions.xsl"/>
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" dp:escaping="minimum"/>

	<xsl:template match="/">
		<xsl:variable name="vNode">
			<xsl:copy-of select="."/>
		</xsl:variable>
		<xsl:variable name="vMsgName">
			<xsl:choose>
				<xsl:when test="((substring($vNode/object/message/text(), 1 + 0, 16) = '0100000024000000'))">
					<xsl:value-of select="'MQSCRQ'"/>
				</xsl:when>
				<xsl:when test="((substring($vNode/object/message/text(), 1 + 0, 16) = '0200000024000000'))">
					<xsl:value-of select="'MQSCRS'"/>
				</xsl:when>
				<xsl:when test="((substring($vNode/object/message/text(), 1 + 0, 16) = '1000000024000000'))">
					<xsl:value-of select="'MQSCRQ'"/>
				</xsl:when>
				<xsl:when test="((substring($vNode/object/message/text(), 1 + 0, 16) = '0200000024000000'))">
					<xsl:value-of select="'MQSCRS'"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'UNKNOWN'"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="vGrpName">
			<xsl:choose>
				<xsl:when test="((substring($vNode/object/message/text(), 1 + 0, 16) = '0100000024000000'))">
					<xsl:value-of select="'MQSC'"/>
				</xsl:when>
				<xsl:when test="((substring($vNode/object/message/text(), 1 + 0, 16) = '0200000024000000'))">
					<xsl:value-of select="'MQSC'"/>
				</xsl:when>
				<xsl:when test="((substring($vNode/object/message/text(), 1 + 0, 16) = '1000000024000000'))">
					<xsl:value-of select="'MQSC'"/>
				</xsl:when>
				<xsl:when test="((substring($vNode/object/message/text(), 1 + 0, 16) = '0200000024000000'))">
					<xsl:value-of select="'MQSC'"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'UNKNOWN'"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="vDebug">
			<dp:set-variable name="'var://context/result/message-name'" value="string($vMsgName/text())"/>
			<dp:set-variable name="'var://context/result/message-group'" value="string($vGrpName/text())"/>
		</xsl:variable>
		<xsl:variable name="vResult">
			<xsl:copy-of select="$vNode/*"/>
		</xsl:variable>
		<xsl:copy-of select="$vResult/*"/>
	</xsl:template>
</xsl:stylesheet>
