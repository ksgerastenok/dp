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
			<xsl:value-of select="."/>
		</xsl:variable>
		<xsl:variable name="vMQMD">
			<xsl:copy-of select="dp:variable('var://context/result/mq-md')"/>
		</xsl:variable>
		<xsl:variable name="vMQXQH">
			<xsl:copy-of select="dp:variable('var://context/result/mq-xqh')"/>
		</xsl:variable>
		<xsl:variable name="vErrorMsg">
			<xsl:value-of select="dp:variable('var://service/error-message')"/>
		</xsl:variable>
		<xsl:variable name="vErrorCode">
			<xsl:value-of select="dp:variable('var://service/error-code')"/>
		</xsl:variable>
		<xsl:variable name="vErrorText">
			<xsl:value-of select="'AMQ9999:'"/>
			<xsl:value-of select="' '"/>
			<xsl:value-of select="$vErrorMsg/text()"/>
			<xsl:value-of select="' '"/>
			<xsl:value-of select="'('"/>
			<xsl:value-of select="$vErrorCode/text()"/>
			<xsl:value-of select="')'"/>
			<xsl:value-of select="'.'"/>
		</xsl:variable>
		<xsl:variable name="vError64">
			<xsl:value-of select="dp:encode($vErrorText/text(), 'base-64')"/>
		</xsl:variable>
		<xsl:variable name="vBase16">
			<xsl:value-of select="'0200000024000000010000000B00000001000000010000000000000000000000020000000300000010000000F903000001000000040000003C000000C60B000000000000FFFFFFFF'"/>
		</xsl:variable>
		<xsl:variable name="vError16">
			<xsl:value-of select="dp:radix-convert($vError64/text(), 64, 16)"/>
		</xsl:variable>
		<xsl:variable name="vResult16">
			<xsl:value-of select="concat($vBase16/text(), $vError16/text())"/>
		</xsl:variable>
		<xsl:variable name="vResult64">
			<xsl:value-of select="dp:radix-convert($vResult16/text(), 16, 64)"/>
		</xsl:variable>
		<xsl:variable name="vResult">
			<xsl:element name="Envelope">
				<xsl:element name="Header">
					<xsl:element name="header">
						<xsl:attribute name="name">
							<xsl:value-of select="'MQMD'"/>
						</xsl:attribute>
						<xsl:copy-of select="$vMQMD/header/*"/>
					</xsl:element>
					<xsl:element name="header">
						<xsl:attribute name="name">
							<xsl:value-of select="'MQXQH'"/>
						</xsl:attribute>
						<xsl:copy-of select="$vMQXQH/header/*"/>
					</xsl:element>
				</xsl:element>
				<xsl:element name="Body">
					<xsl:value-of select="$vResult64/text()"/>
				</xsl:element>
			</xsl:element>
		</xsl:variable>
		<xsl:copy-of select="$vResult/*"/>
	</xsl:template>
</xsl:stylesheet>
