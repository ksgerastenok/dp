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
		<xsl:variable name="vNameMsg">
			<xsl:value-of select="dp:variable('var://context/result/message-name')"/>
		</xsl:variable>
		<xsl:variable name="vNameGrp">
			<xsl:value-of select="dp:variable('var://context/result/message-group')"/>
		</xsl:variable>
		<xsl:variable name="vNameTrn">
			<xsl:value-of select="dp:variable('var://service/transaction-rule-name')"/>
		</xsl:variable>
		<xsl:variable name="vNamePrc">
			<xsl:value-of select="dp:variable('var://service/processor-name')"/>
		</xsl:variable>
		<xsl:variable name="vFileMsg">
			<xsl:value-of select="concat('local://', '/', 'systems', '/', $vNamePrc/text(), '/', $vNameTrn/text(), '/', $vNameGrp/text(), '/', $vNameMsg/text(), '/', 'config', '.', 'xml')"/>
		</xsl:variable>
		<xsl:variable name="vFileGrp">
			<xsl:value-of select="concat('local://', '/', 'systems', '/', $vNamePrc/text(), '/', $vNameTrn/text(), '/', $vNameGrp/text(), '/', 'config', '.', 'xml')"/>
		</xsl:variable>
		<xsl:variable name="vFileTrn">
			<xsl:value-of select="concat('local://', '/', 'systems', '/', $vNamePrc/text(), '/', $vNameTrn/text(), '/', 'config', '.', 'xml')"/>
		</xsl:variable>
		<xsl:variable name="vFilePrc">
			<xsl:value-of select="concat('local://', '/', 'systems', '/', $vNamePrc/text(), '/', 'config', '.', 'xml')"/>
		</xsl:variable>
		<xsl:variable name="vConfigMsg">
			<xsl:copy-of select="document($vFileMsg/text())"/>
		</xsl:variable>
		<xsl:variable name="vConfigGrp">
			<xsl:copy-of select="document($vFileGrp/text())"/>
		</xsl:variable>
		<xsl:variable name="vConfigTrn">
			<xsl:copy-of select="document($vFileTrn/text())"/>
		</xsl:variable>
		<xsl:variable name="vConfigPrc">
			<xsl:copy-of select="document($vFilePrc/text())"/>
		</xsl:variable>
		<xsl:variable name="vResult">
			<xsl:element name="config">
				<xsl:copy-of select="$vConfigMsg/config/*"/>
				<xsl:copy-of select="$vConfigGrp/config/*"/>
				<xsl:copy-of select="$vConfigTrn/config/*"/>
				<xsl:copy-of select="$vConfigPrc/config/*"/>
			</xsl:element>
		</xsl:variable>
		<xsl:variable name="vDebug">
			<dp:set-variable name="'var://context/result/action-input'" value="string($vResult/config[1]/input[1]/@type)"/>
			<dp:set-variable name="'var://context/result/action-route'" value="string($vResult/config[1]/route[1]/text())"/>
			<dp:set-variable name="'var://context/result/action-output'" value="string($vResult/config[1]/output[1]/@type)"/>
			<dp:set-variable name="'var://context/result/action-prepare'" value="string($vResult/config[1]/prepare[1]/text())"/>
			<dp:set-variable name="'var://context/result/action-encoding'" value="string($vResult/config[1]/encoding[1]/@type)"/>
			<dp:set-variable name="'var://context/result/action-validate'" value="string($vResult/config[1]/validate[1]/text())"/>
			<dp:set-variable name="'var://context/result/action-transform'" value="string($vResult/config[1]/transform[1]/text())"/>
			<dp:set-variable name="'var://context/result/action-variables'" value="string($vResult/config[1]/variables[1]/text())"/>
		</xsl:variable>
		<xsl:copy-of select="$vResult/*"/>
	</xsl:template>
</xsl:stylesheet>
