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
			<xsl:copy-of select="dp:variable('var://context/result/mq-md')"/>
		</xsl:variable>
		<xsl:variable name="vMQXQH">
			<xsl:copy-of select="dp:variable('var://context/result/mq-xqh')"/>
		</xsl:variable>
		<xsl:variable name="vURL">
			<xsl:value-of select="normalize-space('1')"/>
		</xsl:variable>
		<xsl:variable name="vDebug">
			<dp:set-variable name="'var://service/mpgw/skip-backside'" value="string($vURL/text())"/>
		</xsl:variable>
		<xsl:variable name="vHeaders">
			<xsl:call-template name="gw:HeaderWrite">
				<xsl:with-param name="pHeader">
					<xsl:element name="header">
						<xsl:attribute name="name">
							<xsl:value-of select="normalize-space('ReplyToQM')"/>
						</xsl:attribute>
						<xsl:value-of select="normalize-space('')"/>
					</xsl:element>
					<xsl:element name="header">
						<xsl:attribute name="name">
							<xsl:value-of select="normalize-space('ReplyToQ')"/>
						</xsl:attribute>
						<xsl:value-of select="normalize-space('')"/>
					</xsl:element>
				</xsl:with-param>
				<xsl:with-param name="pType">
					<xsl:value-of select="normalize-space('response')"/>
				</xsl:with-param>
			</xsl:call-template>
			<xsl:call-template name="gw:HeaderWrite">
				<xsl:with-param name="pHeader">
					<xsl:element name="header">
						<xsl:attribute name="name">
							<xsl:value-of select="normalize-space('MQMD')"/>
						</xsl:attribute>
						<xsl:element name="MQMD">
							<xsl:element name="MsgType">
								<xsl:value-of select="normalize-space($vMQXQH/header/MQXQH/MsgDesc/MsgType/text())"/>
							</xsl:element>
							<xsl:element name="Format">
								<xsl:value-of select="normalize-space($vMQXQH/header/MQXQH/MsgDesc/Format/text())"/>
							</xsl:element>
							<xsl:element name="MsgId">
								<xsl:value-of select="normalize-space($vMQXQH/header/MQXQH/MsgDesc/MsgId/text())"/>
							</xsl:element>
							<xsl:element name="CorrelId">
								<xsl:value-of select="normalize-space($vMQXQH/header/MQXQH/MsgDesc/CorrelId/text())"/>
							</xsl:element>
							<xsl:element name="ReplyToQMgr">
								<xsl:value-of select="normalize-space($vMQXQH/header/MQXQH/MsgDesc/ReplyToQMgr/text())"/>
							</xsl:element>
							<xsl:element name="ReplyToQ">
								<xsl:value-of select="normalize-space($vMQXQH/header/MQXQH/MsgDesc/ReplyToQ/text())"/>
							</xsl:element>
						</xsl:element>
					</xsl:element>
					<xsl:element name="header">
						<xsl:attribute name="name">
							<xsl:value-of select="normalize-space('MQXQH')"/>
						</xsl:attribute>
						<xsl:value-of select="normalize-space('')"/>
					</xsl:element>
					<!--xsl:element name="header">
						<xsl:attribute name="name">
							<xsl:value-of select="normalize-space('MQOD')"/>
						</xsl:attribute>
						<xsl:element name="MQOD">
							<xsl:element name="ObjectType">
								<xsl:value-of select="normalize-space('5')"/>
							</xsl:element>
							<xsl:element name="ObjectQMgrName">
								<xsl:value-of select="normalize-space('')"/>
							</xsl:element>
							<xsl:element name="ObjectName">
								<xsl:value-of select="normalize-space('')"/>
							</xsl:element>
						</xsl:element>
					</xsl:element-->
				</xsl:with-param>
				<xsl:with-param name="pType">
					<xsl:value-of select="normalize-space('current')"/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="vResult">
			<xsl:copy-of select="$vNode/*"/>
		</xsl:variable>
		<xsl:copy-of select="$vResult/*"/>
	</xsl:template>
</xsl:stylesheet>
