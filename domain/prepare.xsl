<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:dp="http://www.datapower.com/extensions"
	xmlns:gw="http://sberbank.ru/sbt/functions"
	exclude-result-prefixes="dp gw"
	extension-element-prefixes="dp gw">
	<dp:input-mapping href="local:///ffd/base-64.ffd" type="ffd"/>
	<dp:output-mapping href="local:///ffd/base-64.ffd" type="ffd"/>
        <xsl:import href="local:///functions.xsl"/>
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" dp:escaping="minimum"/>
	<xsl:template name="gw:CheckCode">
		<xsl:param name="pInput"/>
		<xsl:variable name="vData">
			<xsl:value-of select="$pInput/header/text()"/>
		</xsl:variable>
		<xsl:variable name="vCode">
			<xsl:if test="((not($vData/text() = '')))">
				<xsl:if test="((not(string-length($vData/text()) = 0)))">
					<dp:set-variable name="'var://context/result/response-code'" value="string($vData/text())"/>
				</xsl:if>
			</xsl:if>
		</xsl:variable>
		<xsl:variable name="vValue">
			<xsl:value-of select="dp:variable('var://context/result/response-code')"/>
		</xsl:variable>
		<xsl:variable name="vResult">
			<xsl:if test="((not($vValue/text() = '')))">
				<xsl:choose>
					<xsl:when test="(($vValue/text() = '200 OK'))">
						<xsl:value-of select="''"/>
					</xsl:when>
					<xsl:when test="(($vValue/text() = '302 Found'))">
						<xsl:value-of select="''"/>
					</xsl:when>
					<xsl:when test="(($vValue/text() = '307 Proxy Redirect'))">
						<xsl:value-of select="''"/>
					</xsl:when>
					<xsl:when test="(($vValue/text() = '500 Internal Server Error'))">
						<xsl:value-of select="''"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$vValue/text()"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
		</xsl:variable>
		<xsl:variable name="vErrorCode">
			<xsl:value-of select="dp:variable('var://service/error-code')"/>
		</xsl:variable>
		<xsl:variable name="vDebug">
			<xsl:if test="(($vErrorCode/text() = '0x00000000'))">
				<xsl:if test="((not(string-length($vResult/text()) = 0)))">
					<dp:reject>
						<xsl:value-of select="$vResult/text()"/>
					</dp:reject>
				</xsl:if>
			</xsl:if>
		</xsl:variable>
		<xsl:value-of select="$vResult/text()"/>
	</xsl:template>
	<xsl:template name="gw:CheckData">
		<xsl:param name="pInput"/>
		<xsl:variable name="vData">
			<xsl:value-of select="$pInput/text()"/>
		</xsl:variable>
		<xsl:variable name="vCode">
			<xsl:if test="((not($vData/text() = '')))">
				<xsl:if test="((not(string-length($vData/text()) = 0)))">
					<dp:set-variable name="'var://context/result/message-src'" value="string($vData/text())"/>
				</xsl:if>
			</xsl:if>
		</xsl:variable>
		<xsl:variable name="vValue">
			<xsl:value-of select="dp:variable('var://context/result/message-src')"/>
		</xsl:variable>
		<xsl:variable name="vResult">
			<xsl:if test="((not($vValue/text() = '')))">
				<xsl:choose>
					<xsl:when test="(($vValue/text() = ''))">
						<xsl:value-of select="''"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$vValue/text()"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
		</xsl:variable>
		<xsl:variable name="vErrorCode">
			<xsl:value-of select="dp:variable('var://service/error-code')"/>
		</xsl:variable>
		<xsl:variable name="vDebug">
			<xsl:if test="(($vErrorCode/text() = '0x00000000'))">
				<xsl:if test="((not(string-length($vResult/text()) = 0)))">
					<xsl:message terminate="no" dp:type="all" dp:priority="debug">
						<xsl:value-of select="$vResult/text()"/>
					</xsl:message>
				</xsl:if>
			</xsl:if>
		</xsl:variable>
		<xsl:value-of select="$vResult/text()"/>
	</xsl:template>
	<xsl:template name="gw:CheckResult">
		<xsl:param name="pInput"/>
		<xsl:variable name="vCode">
			<xsl:call-template name="gw:CheckCode">
				<xsl:with-param name="pInput">
					<xsl:call-template name="gw:HeaderRead">
						<xsl:with-param name="pHeader">
							<xsl:element name="header">
								<xsl:attribute name="name">
									<xsl:value-of select="'x-dp-response-code'"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:with-param>
						<xsl:with-param name="pType">
							<xsl:value-of select="'response'"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="vData">
			<xsl:call-template name="gw:CheckData">
				<xsl:with-param name="pInput">
					<xsl:value-of select="$pInput/text()"/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="vResult">
			<xsl:value-of select="$vData/text()"/>
		</xsl:variable>
		<xsl:value-of select="$vResult/text()"/>
	</xsl:template>

	<xsl:template match="/">
		<xsl:variable name="vNode">
			<xsl:copy-of select="."/>
		</xsl:variable>
		<xsl:variable name="vResult">
			<xsl:element name="object">
				<xsl:element name="message">
					<xsl:call-template name="gw:CheckResult">
						<xsl:with-param name="pInput">
							<xsl:value-of select="$vNode/object/message/text()"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:element>
			</xsl:element>
		</xsl:variable>
		<xsl:copy-of select="$vResult/*"/>
	</xsl:template>
</xsl:stylesheet>
