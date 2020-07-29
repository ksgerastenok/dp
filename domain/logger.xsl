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

	<xsl:template match="/">
		<xsl:variable name="vNode">
			<xsl:copy-of select="."/>
		</xsl:variable>
		<xsl:variable name="vRqUID">
			<xsl:value-of select="dp:variable('var://context/result/rq-uid')"/>
		</xsl:variable>
		<xsl:variable name="vNameGrp">
			<xsl:value-of select="dp:variable('var://context/result/message-group')"/>
		</xsl:variable>
		<xsl:variable name="vNameMsg">
			<xsl:value-of select="dp:variable('var://context/result/message-name')"/>
		</xsl:variable>
		<xsl:variable name="vOpUID">
			<xsl:value-of select="dp:variable('var://service/transaction-id')"/>
		</xsl:variable>
		<xsl:variable name="vDomain">
			<xsl:value-of select="dp:variable('var://service/domain-name')"/>
		</xsl:variable>
		<xsl:variable name="vNamePrc">
			<xsl:value-of select="dp:variable('var://service/processor-name')"/>
		</xsl:variable>
		<xsl:variable name="vNameTrn">
			<xsl:value-of select="dp:variable('var://service/transaction-rule-name')"/>
		</xsl:variable>
		<xsl:variable name="vErrorCode">
			<xsl:value-of select="dp:variable('var://service/error-code')"/>
		</xsl:variable>
		<xsl:variable name="vErrorText">
			<xsl:value-of select="dp:variable('var://service/error-message')"/>
		</xsl:variable>
		<xsl:variable name="vSysId">
			<xsl:copy-of select="dp:variable('var://service/system/ident')"/>
		</xsl:variable>
		<xsl:variable name="vHeaders">
			<xsl:copy-of select="dp:variable('var://service/header-manifest')"/>
		</xsl:variable>
		<xsl:variable name="vOperationName">
			<xsl:value-of select="concat($vNameGrp/text(), '.', $vNameMsg/text())"/>
		</xsl:variable>
		<xsl:variable name="vOperation">
			<xsl:value-of select="concat('SERIAL=', $vSysId/serial-number/text(), '; ', 'DOMAIN=', $vDomain/text(), '; ', 'NAMEPRC=', $vNamePrc/text(), '; ', 'NAMETRN=', $vNameTrn/text(), '; ', 'TRANSACTION=', $vOpUID/text())"/>
		</xsl:variable>
		<xsl:variable name="vProcStatus">
			<xsl:choose>
				<xsl:when test="(($vErrorCode/text() = '0x00000000'))">
					<xsl:value-of select="'SUCCESS'"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'ERROR'"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="vEventSource">
			<xsl:call-template name="gw:RouteRead">
				<xsl:with-param name="pType">
					<xsl:value-of select="'EventSource'"/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="vEventReceiver">
			<xsl:call-template name="gw:RouteRead">
				<xsl:with-param name="pType">
					<xsl:value-of select="'EventReceiver'"/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="vSourceQM">
			<xsl:call-template name="gw:RouteRead">
				<xsl:with-param name="pType">
					<xsl:value-of select="'SourceQM'"/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="vSourceQueue">
			<xsl:call-template name="gw:RouteRead">
				<xsl:with-param name="pType">
					<xsl:value-of select="'SourceQueue'"/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="vTargetQM">
			<xsl:call-template name="gw:RouteRead">
				<xsl:with-param name="pType">
					<xsl:value-of select="'TargetQM'"/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="vTargetQueue">
			<xsl:call-template name="gw:RouteRead">
				<xsl:with-param name="pType">
					<xsl:value-of select="'TargetQueue'"/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="vReplyQM">
			<xsl:call-template name="gw:RouteRead">
				<xsl:with-param name="pType">
					<xsl:value-of select="'ReplyQM'"/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="vReplyQueue">
			<xsl:call-template name="gw:RouteRead">
				<xsl:with-param name="pType">
					<xsl:value-of select="'ReplyQueue'"/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="vResult">
			<xsl:element name="Envelope">
				<xsl:element name="System">
					<xsl:element name="URL">
						<xsl:value-of select="'dpmq://MQGR.LOG/?RequestQueue=EVENT.LOGGING'"/>
					</xsl:element>
					<xsl:element name="Method">
						<xsl:value-of select="'post'"/>
					</xsl:element>
				</xsl:element>
				<xsl:element name="Header">
					<xsl:element name="header">
						<xsl:attribute name="name">
							<xsl:value-of select="'MQMP'"/>
						</xsl:attribute>
						<xsl:element name="MQMP">
							<xsl:element name="Property">
								<xsl:attribute name="name">
									<xsl:value-of select="'RqUID'"/>
								</xsl:attribute>
								<xsl:attribute name="type">
									<xsl:value-of select="'string'"/>
								</xsl:attribute>
								<xsl:value-of select="$vRqUID/text()"/>
							</xsl:element>
							<xsl:element name="Property">
								<xsl:attribute name="name">
									<xsl:value-of select="'ErrorText'"/>
								</xsl:attribute>
								<xsl:attribute name="type">
									<xsl:value-of select="'string'"/>
								</xsl:attribute>
								<xsl:value-of select="$vErrorText/text()"/>
							</xsl:element>
							<xsl:element name="Property">
								<xsl:attribute name="name">
									<xsl:value-of select="'Operation'"/>
								</xsl:attribute>
								<xsl:attribute name="type">
									<xsl:value-of select="'string'"/>
								</xsl:attribute>
								<xsl:value-of select="$vOperation/text()"/>
							</xsl:element>
							<xsl:element name="Property">
								<xsl:attribute name="name">
									<xsl:value-of select="'ProcStatus'"/>
								</xsl:attribute>
								<xsl:attribute name="type">
									<xsl:value-of select="'string'"/>
								</xsl:attribute>
								<xsl:value-of select="$vProcStatus/text()"/>
							</xsl:element>
							<xsl:element name="Property">
								<xsl:attribute name="name">
									<xsl:value-of select="'EventSource'"/>
								</xsl:attribute>
								<xsl:attribute name="type">
									<xsl:value-of select="'string'"/>
								</xsl:attribute>
								<xsl:value-of select="$vEventSource/text()"/>
							</xsl:element>
							<xsl:element name="Property">
								<xsl:attribute name="name">
									<xsl:value-of select="'EventReceiver'"/>
								</xsl:attribute>
								<xsl:attribute name="type">
									<xsl:value-of select="'string'"/>
								</xsl:attribute>
								<xsl:value-of select="$vEventReceiver/text()"/>
							</xsl:element>
							<xsl:element name="Property">
								<xsl:attribute name="name">
									<xsl:value-of select="'SourceQM'"/>
								</xsl:attribute>
								<xsl:attribute name="type">
									<xsl:value-of select="'string'"/>
								</xsl:attribute>
								<xsl:value-of select="$vSourceQM/text()"/>
							</xsl:element>
							<xsl:element name="Property">
								<xsl:attribute name="name">
									<xsl:value-of select="'SourceQueue'"/>
								</xsl:attribute>
								<xsl:attribute name="type">
									<xsl:value-of select="'string'"/>
								</xsl:attribute>
								<xsl:value-of select="$vSourceQueue/text()"/>
							</xsl:element>
							<xsl:element name="Property">
								<xsl:attribute name="name">
									<xsl:value-of select="'TargetQM'"/>
								</xsl:attribute>
								<xsl:attribute name="type">
									<xsl:value-of select="'string'"/>
								</xsl:attribute>
								<xsl:value-of select="$vTargetQM/text()"/>
							</xsl:element>
							<xsl:element name="Property">
								<xsl:attribute name="name">
									<xsl:value-of select="'TargetQueue'"/>
								</xsl:attribute>
								<xsl:attribute name="type">
									<xsl:value-of select="'string'"/>
								</xsl:attribute>
								<xsl:value-of select="$vTargetQueue/text()"/>
							</xsl:element>
							<xsl:element name="Property">
								<xsl:attribute name="name">
									<xsl:value-of select="'ReplyQM'"/>
								</xsl:attribute>
								<xsl:attribute name="type">
									<xsl:value-of select="'string'"/>
								</xsl:attribute>
								<xsl:value-of select="$vReplyQM/text()"/>
							</xsl:element>
							<xsl:element name="Property">
								<xsl:attribute name="name">
									<xsl:value-of select="'ReplyQueue'"/>
								</xsl:attribute>
								<xsl:attribute name="type">
									<xsl:value-of select="'string'"/>
								</xsl:attribute>
								<xsl:value-of select="$vReplyQueue/text()"/>
							</xsl:element>
							<xsl:element name="Property">
								<xsl:attribute name="name">
									<xsl:value-of select="'OperationName'"/>
								</xsl:attribute>
								<xsl:attribute name="type">
									<xsl:value-of select="'string'"/>
								</xsl:attribute>
								<xsl:value-of select="$vOperationName/text()"/>
							</xsl:element>
						</xsl:element>
					</xsl:element>
				</xsl:element>
				<xsl:element name="Body">
					<xsl:value-of select="$vNode/object/message/text()"/>
				</xsl:element>
			</xsl:element>
		</xsl:variable>
		<xsl:variable name="vDebug">
			<xsl:call-template name="gw:URLOpen">
				<xsl:with-param name="pMessage">
					<xsl:copy-of select="$vResult/*"/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:variable>
		<xsl:copy-of select="$vResult/*"/>
	</xsl:template>
</xsl:stylesheet>
