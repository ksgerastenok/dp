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

	<xsl:template name="gw:ParseHDR">
		<xsl:param name="pData"/>
		<xsl:param name="pMode"/>
		<xsl:variable name="vLength">
			<xsl:if test="((not(string-length($pData/text()) = 0)))">
				<xsl:choose>
					<xsl:when test="(($pMode/text() = 'LEXQH1'))">
						<xsl:value-of select="string-length($pData/text()) div 2"/>
					</xsl:when>
					<xsl:when test="(($pMode/text() = 'BEXQH1'))">
						<xsl:value-of select="string-length($pData/text()) div 2"/>
					</xsl:when>
					<xsl:when test="(($pMode/text() = 'LEXQH2'))">
						<xsl:value-of select="string-length($pData/text()) div 2"/>
					</xsl:when>
					<xsl:when test="(($pMode/text() = 'BEXQH2'))">
						<xsl:value-of select="string-length($pData/text()) div 2"/>
					</xsl:when>
					<xsl:when test="(($pMode/text() = 'LEMDE1'))">
						<xsl:value-of select="string-length($pData/text()) div 2"/>
					</xsl:when>
					<xsl:when test="(($pMode/text() = 'BEMDE1'))">
						<xsl:value-of select="string-length($pData/text()) div 2"/>
					</xsl:when>
					<xsl:when test="(($pMode/text() = 'LEMDE2'))">
						<xsl:value-of select="string-length($pData/text()) div 2"/>
					</xsl:when>
					<xsl:when test="(($pMode/text() = 'BEMDE2'))">
						<xsl:value-of select="string-length($pData/text()) div 2"/>
					</xsl:when>
					<xsl:when test="(($pMode/text() = 'LERFH1'))">
						<xsl:value-of select="string-length($pData/text()) div 2"/>
					</xsl:when>
					<xsl:when test="(($pMode/text() = 'BERFH1'))">
						<xsl:value-of select="string-length($pData/text()) div 2"/>
					</xsl:when>
					<xsl:when test="(($pMode/text() = 'LERFH2'))">
						<xsl:value-of select="string-length($pData/text()) div 2"/>
					</xsl:when>
					<xsl:when test="(($pMode/text() = 'BERFH2'))">
						<xsl:value-of select="string-length($pData/text()) div 2"/>
					</xsl:when>
					<xsl:when test="(($pMode/text() = 'LERFH1X'))">
						<xsl:value-of select="(string-length(substring-after(substring-before($pData/text(), '20'), '')) + string-length(substring-before(substring-after($pData/text(), '20'), '20'))) div 2"/>
					</xsl:when>
					<xsl:when test="(($pMode/text() = 'BERFH1X'))">
						<xsl:value-of select="(string-length(substring-after(substring-before($pData/text(), '20'), '')) + string-length(substring-before(substring-after($pData/text(), '20'), '20'))) div 2"/>
					</xsl:when>
					<xsl:when test="(($pMode/text() = 'LERFH2X'))">
						<xsl:value-of select="dp:radix-convert(concat(substring(substring($pData/text(), 1 + 0, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 0, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 0, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 0, 8), 1 + 0, 2)), 16, 10)"/>
					</xsl:when>
					<xsl:when test="(($pMode/text() = 'BERFH2X'))">
						<xsl:value-of select="dp:radix-convert(concat(substring(substring($pData/text(), 1 + 0, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 0, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 0, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 0, 8), 1 + 6, 2)), 16, 10)"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="string-length($pData/text()) div 2"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
		</xsl:variable>
		<xsl:variable name="vResult">
			<xsl:if test="((not(string-length($pData/text()) = 0)))">
				<xsl:choose>
					<xsl:when test="(($pMode/text() = 'LEXQH1'))">
						<xsl:element name="MQXQH">
							<xsl:element name="StrucId">
								<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 0, 8), 16, 64)))"/>
							</xsl:element>
							<xsl:element name="Version">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 8, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 8, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 8, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 8, 8), 1 + 0, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="RemoteQName">
								<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 16, 96), 16, 64)))"/>
							</xsl:element>
							<xsl:element name="RemoteQMgrName">
								<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 112, 96), 16, 64)))"/>
							</xsl:element>
							<xsl:element name="MsgDesc">
								<xsl:element name="StrucId">
									<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 208, 8), 16, 64)))"/>
								</xsl:element>
								<xsl:element name="Version">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 216, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 216, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 216, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 216, 8), 1 + 0, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="Report">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 224, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 224, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 224, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 224, 8), 1 + 0, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="MsgType">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 232, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 232, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 232, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 232, 8), 1 + 0, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="Expiry">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 240, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 240, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 240, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 240, 8), 1 + 0, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="Feedback">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 248, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 248, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 248, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 248, 8), 1 + 0, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="Encoding">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 256, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 256, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 256, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 256, 8), 1 + 0, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="CodedCharSetId">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 264, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 264, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 264, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 264, 8), 1 + 0, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="Format">
									<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 272, 16), 16, 64)))"/>
								</xsl:element>
								<xsl:element name="Priority">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 288, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 288, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 288, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 288, 8), 1 + 0, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="Persistence">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 296, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 296, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 296, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 296, 8), 1 + 0, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="MsgId">
									<xsl:value-of select="normalize-space(dp:radix-convert(substring($pData/text(), 1 + 304, 48), 16, 16))"/>
								</xsl:element>
								<xsl:element name="CorrelId">
									<xsl:value-of select="normalize-space(dp:radix-convert(substring($pData/text(), 1 + 352, 48), 16, 16))"/>
								</xsl:element>
								<xsl:element name="BackoutCount">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 400, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 400, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 400, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 400, 8), 1 + 0, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="ReplyToQ">
									<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 408, 96), 16, 64)))"/>
								</xsl:element>
								<xsl:element name="ReplyToQMgr">
									<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 504, 96), 16, 64)))"/>
								</xsl:element>
								<xsl:element name="UserIdentifier">
									<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 600, 24), 16, 64)))"/>
								</xsl:element>
								<xsl:element name="AccountingToken">
									<xsl:value-of select="normalize-space(dp:radix-convert(substring($pData/text(), 1 + 624, 64), 16, 16))"/>
								</xsl:element>
								<xsl:element name="ApplIdentityData">
									<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 688, 64), 16, 64)))"/>
								</xsl:element>
								<xsl:element name="PutApplType">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 752, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 752, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 752, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 752, 8), 1 + 0, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="PutApplName">
									<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 760, 56), 16, 64)))"/>
								</xsl:element>
								<xsl:element name="PutDate">
									<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 816, 16), 16, 64)))"/>
								</xsl:element>
								<xsl:element name="PutTime">
									<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 832, 16), 16, 64)))"/>
								</xsl:element>
								<xsl:element name="ApplOriginData">
									<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 848, 8), 16, 64)))"/>
								</xsl:element>
							</xsl:element>
						</xsl:element>
						<xsl:call-template name="gw:ParseHDR">
							<xsl:with-param name="pData">
								<xsl:value-of select="substring($pData/text(), 1 + 0 + $vLength/text() * 2, string-length($pData/text()) - (1 + 0 + $vLength/text() * 2) + 1)"/>
							</xsl:with-param>
							<xsl:with-param name="pMode">
								<xsl:value-of select="$pMode/text()"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="(($pMode/text() = 'BEXQH1'))">
						<xsl:element name="MQXQH">
							<xsl:element name="StrucId">
								<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 0, 8), 16, 64)))"/>
							</xsl:element>
							<xsl:element name="Version">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 8, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 8, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 8, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 8, 8), 1 + 6, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="RemoteQName">
								<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 16, 96), 16, 64)))"/>
							</xsl:element>
							<xsl:element name="RemoteQMgrName">
								<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 112, 96), 16, 64)))"/>
							</xsl:element>
							<xsl:element name="MsgDesc">
								<xsl:element name="StrucId">
									<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 208, 8), 16, 64)))"/>
								</xsl:element>
								<xsl:element name="Version">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 216, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 216, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 216, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 216, 8), 1 + 6, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="Report">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 224, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 224, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 224, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 224, 8), 1 + 6, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="MsgType">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 232, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 232, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 232, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 232, 8), 1 + 6, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="Expiry">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 240, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 240, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 240, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 240, 8), 1 + 6, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="Feedback">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 248, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 248, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 248, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 248, 8), 1 + 6, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="Encoding">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 256, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 256, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 256, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 256, 8), 1 + 6, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="CodedCharSetId">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 264, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 264, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 264, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 264, 8), 1 + 6, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="Format">
									<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 272, 16), 16, 64)))"/>
								</xsl:element>
								<xsl:element name="Priority">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 288, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 288, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 288, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 288, 8), 1 + 6, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="Persistence">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 296, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 296, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 296, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 296, 8), 1 + 6, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="MsgId">
									<xsl:value-of select="normalize-space(dp:radix-convert(substring($pData/text(), 1 + 304, 48), 16, 16))"/>
								</xsl:element>
								<xsl:element name="CorrelId">
									<xsl:value-of select="normalize-space(dp:radix-convert(substring($pData/text(), 1 + 352, 48), 16, 16))"/>
								</xsl:element>
								<xsl:element name="BackoutCount">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 400, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 400, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 400, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 400, 8), 1 + 6, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="ReplyToQ">
									<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 408, 96), 16, 64)))"/>
								</xsl:element>
								<xsl:element name="ReplyToQMgr">
									<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 504, 96), 16, 64)))"/>
								</xsl:element>
								<xsl:element name="UserIdentifier">
									<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 600, 24), 16, 64)))"/>
								</xsl:element>
								<xsl:element name="AccountingToken">
									<xsl:value-of select="normalize-space(dp:radix-convert(substring($pData/text(), 1 + 624, 64), 16, 16))"/>
								</xsl:element>
								<xsl:element name="ApplIdentityData">
									<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 688, 64), 16, 64)))"/>
								</xsl:element>
								<xsl:element name="PutApplType">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 752, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 752, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 752, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 752, 8), 1 + 6, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="PutApplName">
									<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 760, 56), 16, 64)))"/>
								</xsl:element>
								<xsl:element name="PutDate">
									<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 816, 16), 16, 64)))"/>
								</xsl:element>
								<xsl:element name="PutTime">
									<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 832, 16), 16, 64)))"/>
								</xsl:element>
								<xsl:element name="ApplOriginData">
									<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 848, 8), 16, 64)))"/>
								</xsl:element>
							</xsl:element>
						</xsl:element>
						<xsl:call-template name="gw:ParseHDR">
							<xsl:with-param name="pData">
								<xsl:value-of select="substring($pData/text(), 1 + 0 + $vLength/text() * 2, string-length($pData/text()) - (1 + 0 + $vLength/text() * 2) + 1)"/>
							</xsl:with-param>
							<xsl:with-param name="pMode">
								<xsl:value-of select="$pMode/text()"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="(($pMode/text() = 'LEXQH2'))">
						<xsl:element name="MQXQH">
							<xsl:element name="StrucId">
								<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 0, 8), 16, 64)))"/>
							</xsl:element>
							<xsl:element name="Version">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 8, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 8, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 8, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 8, 8), 1 + 0, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="RemoteQName">
								<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 16, 96), 16, 64)))"/>
							</xsl:element>
							<xsl:element name="RemoteQMgrName">
								<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 112, 96), 16, 64)))"/>
							</xsl:element>
							<xsl:element name="MsgDesc">
								<xsl:element name="StrucId">
									<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 208, 8), 16, 64)))"/>
								</xsl:element>
								<xsl:element name="Version">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 216, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 216, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 216, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 216, 8), 1 + 0, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="Report">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 224, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 224, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 224, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 224, 8), 1 + 0, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="MsgType">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 232, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 232, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 232, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 232, 8), 1 + 0, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="Expiry">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 240, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 240, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 240, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 240, 8), 1 + 0, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="Feedback">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 248, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 248, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 248, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 248, 8), 1 + 0, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="Encoding">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 256, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 256, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 256, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 256, 8), 1 + 0, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="CodedCharSetId">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 264, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 264, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 264, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 264, 8), 1 + 0, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="Format">
									<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 272, 16), 16, 64)))"/>
								</xsl:element>
								<xsl:element name="Priority">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 288, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 288, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 288, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 288, 8), 1 + 0, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="Persistence">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 296, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 296, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 296, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 296, 8), 1 + 0, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="MsgId">
									<xsl:value-of select="normalize-space(dp:radix-convert(substring($pData/text(), 1 + 304, 48), 16, 16))"/>
								</xsl:element>
								<xsl:element name="CorrelId">
									<xsl:value-of select="normalize-space(dp:radix-convert(substring($pData/text(), 1 + 352, 48), 16, 16))"/>
								</xsl:element>
								<xsl:element name="BackoutCount">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 400, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 400, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 400, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 400, 8), 1 + 0, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="ReplyToQ">
									<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 408, 96), 16, 64)))"/>
								</xsl:element>
								<xsl:element name="ReplyToQMgr">
									<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 504, 96), 16, 64)))"/>
								</xsl:element>
								<xsl:element name="UserIdentifier">
									<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 600, 24), 16, 64)))"/>
								</xsl:element>
								<xsl:element name="AccountingToken">
									<xsl:value-of select="normalize-space(dp:radix-convert(substring($pData/text(), 1 + 624, 64), 16, 16))"/>
								</xsl:element>
								<xsl:element name="ApplIdentityData">
									<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 688, 64), 16, 64)))"/>
								</xsl:element>
								<xsl:element name="PutApplType">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 752, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 752, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 752, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 752, 8), 1 + 0, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="PutApplName">
									<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 760, 56), 16, 64)))"/>
								</xsl:element>
								<xsl:element name="PutDate">
									<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 816, 16), 16, 64)))"/>
								</xsl:element>
								<xsl:element name="PutTime">
									<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 832, 16), 16, 64)))"/>
								</xsl:element>
								<xsl:element name="ApplOriginData">
									<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 848, 8), 16, 64)))"/>
								</xsl:element>
								<xsl:element name="GroupId">
									<xsl:value-of select="normalize-space(dp:radix-convert(substring($pData/text(), 1 + 856, 48), 16, 16))"/>
								</xsl:element>
								<xsl:element name="MsgSeqNumber">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 904, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 904, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 904, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 904, 8), 1 + 0, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="Offset">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 912, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 912, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 912, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 912, 8), 1 + 0, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="MsgFlags">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 920, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 920, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 920, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 920, 8), 1 + 0, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="OriginalLength">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 928, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 928, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 928, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 928, 8), 1 + 0, 2)), 16, 10))"/>
								</xsl:element>
							</xsl:element>
						</xsl:element>
						<xsl:call-template name="gw:ParseHDR">
							<xsl:with-param name="pData">
								<xsl:value-of select="substring($pData/text(), 1 + 0 + $vLength/text() * 2, string-length($pData/text()) - (1 + 0 + $vLength/text() * 2) + 1)"/>
							</xsl:with-param>
							<xsl:with-param name="pMode">
								<xsl:value-of select="$pMode/text()"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="(($pMode/text() = 'BEXQH2'))">
						<xsl:element name="MQXQH">
							<xsl:element name="StrucId">
								<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 0, 8), 16, 64)))"/>
							</xsl:element>
							<xsl:element name="Version">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 8, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 8, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 8, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 8, 8), 1 + 6, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="RemoteQName">
								<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 16, 96), 16, 64)))"/>
							</xsl:element>
							<xsl:element name="RemoteQMgrName">
								<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 112, 96), 16, 64)))"/>
							</xsl:element>
							<xsl:element name="MsgDesc">
								<xsl:element name="StrucId">
									<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 208, 8), 16, 64)))"/>
								</xsl:element>
								<xsl:element name="Version">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 216, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 216, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 216, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 216, 8), 1 + 6, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="Report">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 224, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 224, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 224, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 224, 8), 1 + 6, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="MsgType">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 232, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 232, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 232, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 232, 8), 1 + 6, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="Expiry">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 240, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 240, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 240, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 240, 8), 1 + 6, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="Feedback">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 248, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 248, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 248, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 248, 8), 1 + 6, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="Encoding">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 256, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 256, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 256, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 256, 8), 1 + 6, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="CodedCharSetId">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 264, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 264, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 264, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 264, 8), 1 + 6, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="Format">
									<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 272, 16), 16, 64)))"/>
								</xsl:element>
								<xsl:element name="Priority">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 288, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 288, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 288, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 288, 8), 1 + 6, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="Persistence">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 296, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 296, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 296, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 296, 8), 1 + 6, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="MsgId">
									<xsl:value-of select="normalize-space(dp:radix-convert(substring($pData/text(), 1 + 304, 48), 16, 16))"/>
								</xsl:element>
								<xsl:element name="CorrelId">
									<xsl:value-of select="normalize-space(dp:radix-convert(substring($pData/text(), 1 + 352, 48), 16, 16))"/>
								</xsl:element>
								<xsl:element name="BackoutCount">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 400, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 400, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 400, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 400, 8), 1 + 6, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="ReplyToQ">
									<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 408, 96), 16, 64)))"/>
								</xsl:element>
								<xsl:element name="ReplyToQMgr">
									<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 504, 96), 16, 64)))"/>
								</xsl:element>
								<xsl:element name="UserIdentifier">
									<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 600, 24), 16, 64)))"/>
								</xsl:element>
								<xsl:element name="AccountingToken">
									<xsl:value-of select="normalize-space(dp:radix-convert(substring($pData/text(), 1 + 624, 64), 16, 16))"/>
								</xsl:element>
								<xsl:element name="ApplIdentityData">
									<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 688, 64), 16, 64)))"/>
								</xsl:element>
								<xsl:element name="PutApplType">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 752, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 752, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 752, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 752, 8), 1 + 6, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="PutApplName">
									<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 760, 56), 16, 64)))"/>
								</xsl:element>
								<xsl:element name="PutDate">
									<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 816, 16), 16, 64)))"/>
								</xsl:element>
								<xsl:element name="PutTime">
									<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 832, 16), 16, 64)))"/>
								</xsl:element>
								<xsl:element name="ApplOriginData">
									<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 848, 8), 16, 64)))"/>
								</xsl:element>
								<xsl:element name="GroupId">
									<xsl:value-of select="normalize-space(dp:radix-convert(substring($pData/text(), 1 + 856, 48), 16, 16))"/>
								</xsl:element>
								<xsl:element name="MsgSeqNumber">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 904, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 904, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 904, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 904, 8), 1 + 6, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="Offset">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 912, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 912, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 912, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 912, 8), 1 + 6, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="MsgFlags">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 920, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 920, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 920, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 920, 8), 1 + 6, 2)), 16, 10))"/>
								</xsl:element>
								<xsl:element name="OriginalLength">
									<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 928, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 928, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 928, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 928, 8), 1 + 6, 2)), 16, 10))"/>
								</xsl:element>
							</xsl:element>
						</xsl:element>
						<xsl:call-template name="gw:ParseHDR">
							<xsl:with-param name="pData">
								<xsl:value-of select="substring($pData/text(), 1 + 0 + $vLength/text() * 2, string-length($pData/text()) - (1 + 0 + $vLength/text() * 2) + 1)"/>
							</xsl:with-param>
							<xsl:with-param name="pMode">
								<xsl:value-of select="$pMode/text()"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="(($pMode/text() = 'LEMDE1'))">
						<xsl:element name="MQMDE">
							<xsl:element name="StrucId">
								<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 0, 8), 16, 64)))"/>
							</xsl:element>
							<xsl:element name="Version">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 8, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 8, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 8, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 8, 8), 1 + 0, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="StrucLength">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 16, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 0, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="Encoding">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 24, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 24, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 24, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 24, 8), 1 + 0, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="CodedCharSetId">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 32, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 32, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 32, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 32, 8), 1 + 0, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="Format">
								<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 40, 16), 16, 64)))"/>
							</xsl:element>
							<xsl:element name="Flags">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 56, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 56, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 56, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 56, 8), 1 + 0, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="GroupId">
								<xsl:value-of select="normalize-space(dp:radix-convert(substring($pData/text(), 1 + 64, 48), 16, 16))"/>
							</xsl:element>
							<xsl:element name="MsgSeqNumber">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 112, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 112, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 112, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 112, 8), 1 + 0, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="Offset">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 120, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 120, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 120, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 120, 8), 1 + 0, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="MsgFlags">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 128, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 128, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 128, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 128, 8), 1 + 0, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="OriginalLength">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 136, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 136, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 136, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 136, 8), 1 + 0, 2)), 16, 10))"/>
							</xsl:element>
						</xsl:element>
						<xsl:call-template name="gw:ParseHDR">
							<xsl:with-param name="pData">
								<xsl:value-of select="substring($pData/text(), 1 + 0 + $vLength/text() * 2, string-length($pData/text()) - (1 + 0 + $vLength/text() * 2) + 1)"/>
							</xsl:with-param>
							<xsl:with-param name="pMode">
								<xsl:value-of select="$pMode/text()"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="(($pMode/text() = 'BEMDE1'))">
						<xsl:element name="MQMDE">
							<xsl:element name="StrucId">
								<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 0, 8), 16, 64)))"/>
							</xsl:element>
							<xsl:element name="Version">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 8, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 8, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 8, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 8, 8), 1 + 6, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="StrucLength">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 16, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 6, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="Encoding">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 24, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 24, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 24, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 24, 8), 1 + 6, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="CodedCharSetId">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 32, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 32, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 32, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 32, 8), 1 + 6, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="Format">
								<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 40, 16), 16, 64)))"/>
							</xsl:element>
							<xsl:element name="Flags">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 56, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 56, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 56, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 56, 8), 1 + 6, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="GroupId">
								<xsl:value-of select="normalize-space(dp:radix-convert(substring($pData/text(), 1 + 64, 48), 16, 16))"/>
							</xsl:element>
							<xsl:element name="MsgSeqNumber">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 112, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 112, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 112, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 112, 8), 1 + 6, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="Offset">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 120, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 120, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 120, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 120, 8), 1 + 6, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="MsgFlags">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 128, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 128, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 128, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 128, 8), 1 + 6, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="OriginalLength">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 136, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 136, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 136, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 136, 8), 1 + 6, 2)), 16, 10))"/>
							</xsl:element>
						</xsl:element>
						<xsl:call-template name="gw:ParseHDR">
							<xsl:with-param name="pData">
								<xsl:value-of select="substring($pData/text(), 1 + 0 + $vLength/text() * 2, string-length($pData/text()) - (1 + 0 + $vLength/text() * 2) + 1)"/>
							</xsl:with-param>
							<xsl:with-param name="pMode">
								<xsl:value-of select="$pMode/text()"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="(($pMode/text() = 'LEMDE2'))">
						<xsl:element name="MQMDE">
							<xsl:element name="StrucId">
								<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 0, 8), 16, 64)))"/>
							</xsl:element>
							<xsl:element name="Version">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 8, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 8, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 8, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 8, 8), 1 + 0, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="StrucLength">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 16, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 0, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="Encoding">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 24, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 24, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 24, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 24, 8), 1 + 0, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="CodedCharSetId">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 32, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 32, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 32, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 32, 8), 1 + 0, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="Format">
								<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 40, 16), 16, 64)))"/>
							</xsl:element>
							<xsl:element name="Flags">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 56, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 56, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 56, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 56, 8), 1 + 0, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="GroupId">
								<xsl:value-of select="normalize-space(dp:radix-convert(substring($pData/text(), 1 + 64, 48), 16, 16))"/>
							</xsl:element>
							<xsl:element name="MsgSeqNumber">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 112, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 112, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 112, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 112, 8), 1 + 0, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="Offset">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 120, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 120, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 120, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 120, 8), 1 + 0, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="MsgFlags">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 128, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 128, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 128, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 128, 8), 1 + 0, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="OriginalLength">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 136, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 136, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 136, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 136, 8), 1 + 0, 2)), 16, 10))"/>
							</xsl:element>
						</xsl:element>
						<xsl:call-template name="gw:ParseHDR">
							<xsl:with-param name="pData">
								<xsl:value-of select="substring($pData/text(), 1 + 0 + $vLength/text() * 2, string-length($pData/text()) - (1 + 0 + $vLength/text() * 2) + 1)"/>
							</xsl:with-param>
							<xsl:with-param name="pMode">
								<xsl:value-of select="$pMode/text()"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="(($pMode/text() = 'BEMDE2'))">
						<xsl:element name="MQMDE">
							<xsl:element name="StrucId">
								<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 0, 8), 16, 64)))"/>
							</xsl:element>
							<xsl:element name="Version">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 8, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 8, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 8, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 8, 8), 1 + 6, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="StrucLength">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 16, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 6, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="Encoding">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 24, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 24, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 24, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 24, 8), 1 + 6, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="CodedCharSetId">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 32, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 32, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 32, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 32, 8), 1 + 6, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="Format">
								<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 40, 16), 16, 64)))"/>
							</xsl:element>
							<xsl:element name="Flags">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 56, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 56, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 56, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 56, 8), 1 + 6, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="GroupId">
								<xsl:value-of select="normalize-space(dp:radix-convert(substring($pData/text(), 1 + 64, 48), 16, 16))"/>
							</xsl:element>
							<xsl:element name="MsgSeqNumber">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 112, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 112, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 112, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 112, 8), 1 + 6, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="Offset">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 120, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 120, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 120, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 120, 8), 1 + 6, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="MsgFlags">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 128, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 128, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 128, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 128, 8), 1 + 6, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="OriginalLength">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 136, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 136, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 136, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 136, 8), 1 + 6, 2)), 16, 10))"/>
							</xsl:element>
						</xsl:element>
						<xsl:call-template name="gw:ParseHDR">
							<xsl:with-param name="pData">
								<xsl:value-of select="substring($pData/text(), 1 + 0 + $vLength/text() * 2, string-length($pData/text()) - (1 + 0 + $vLength/text() * 2) + 1)"/>
							</xsl:with-param>
							<xsl:with-param name="pMode">
								<xsl:value-of select="$pMode/text()"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="(($pMode/text() = 'LERFH1'))">
						<xsl:element name="MQRFH">
							<xsl:element name="StrucId">
								<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 0, 8), 16, 64)))"/>
							</xsl:element>
							<xsl:element name="Version">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 8, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 8, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 8, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 8, 8), 1 + 0, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="StrucLength">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 16, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 0, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="Encoding">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 24, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 24, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 24, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 24, 8), 1 + 0, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="CodedCharSetId">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 32, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 32, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 32, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 32, 8), 1 + 0, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="Format">
								<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 40, 16), 16, 64)))"/>
							</xsl:element>
							<xsl:element name="Flags">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 56, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 56, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 56, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 56, 8), 1 + 0, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="NameValueString">
								<xsl:call-template name="gw:ParseHDR">
									<xsl:with-param name="pData">
										<xsl:value-of select="substring($pData/text(), 1 + 64, ($vLength/text() * 2) - (1 + 64) + 1)"/>
									</xsl:with-param>
									<xsl:with-param name="pMode">
										<xsl:value-of select="concat($pMode/text(), 'X')"/>
									</xsl:with-param>
								</xsl:call-template>
							</xsl:element>
						</xsl:element>
						<xsl:call-template name="gw:ParseHDR">
							<xsl:with-param name="pData">
								<xsl:value-of select="substring($pData/text(), 1 + 0 + $vLength/text() * 2, string-length($pData/text()) - (1 + 0 + $vLength/text() * 2) + 1)"/>
							</xsl:with-param>
							<xsl:with-param name="pMode">
								<xsl:value-of select="$pMode/text()"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="(($pMode/text() = 'BERFH1'))">
						<xsl:element name="MQRFH">
							<xsl:element name="StrucId">
								<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 0, 8), 16, 64)))"/>
							</xsl:element>
							<xsl:element name="Version">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 8, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 8, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 8, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 8, 8), 1 + 6, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="StrucLength">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 16, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 6, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="Encoding">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 24, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 24, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 24, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 24, 8), 1 + 6, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="CodedCharSetId">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 32, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 32, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 32, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 32, 8), 1 + 6, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="Format">
								<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 40, 16), 16, 64)))"/>
							</xsl:element>
							<xsl:element name="Flags">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 56, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 56, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 56, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 56, 8), 1 + 6, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="NameValueString">
								<xsl:call-template name="gw:ParseHDR">
									<xsl:with-param name="pData">
										<xsl:value-of select="substring($pData/text(), 1 + 64, ($vLength/text() * 2) - (1 + 64) + 1)"/>
									</xsl:with-param>
									<xsl:with-param name="pMode">
										<xsl:value-of select="concat($pMode/text(), 'X')"/>
									</xsl:with-param>
								</xsl:call-template>
							</xsl:element>
						</xsl:element>
						<xsl:call-template name="gw:ParseHDR">
							<xsl:with-param name="pData">
								<xsl:value-of select="substring($pData/text(), 1 + 0 + $vLength/text() * 2, string-length($pData/text()) - (1 + 0 + $vLength/text() * 2) + 1)"/>
							</xsl:with-param>
							<xsl:with-param name="pMode">
								<xsl:value-of select="$pMode/text()"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="(($pMode/text() = 'LERFH2'))">
						<xsl:element name="MQRFH2">
							<xsl:element name="StrucId">
								<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 0, 8), 16, 64)))"/>
							</xsl:element>
							<xsl:element name="Version">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 8, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 8, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 8, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 8, 8), 1 + 0, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="StrucLength">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 16, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 0, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="Encoding">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 24, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 24, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 24, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 24, 8), 1 + 0, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="CodedCharSetId">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 32, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 32, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 32, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 32, 8), 1 + 0, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="Format">
								<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 40, 16), 16, 64)))"/>
							</xsl:element>
							<xsl:element name="Flags">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 56, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 56, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 56, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 56, 8), 1 + 0, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="NameValueCCSID">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 64, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 64, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 64, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 64, 8), 1 + 0, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="NameValueData">
								<xsl:call-template name="gw:ParseHDR">
									<xsl:with-param name="pData">
										<xsl:value-of select="substring($pData/text(), 1 + 72, ($vLength/text() * 2) - (1 + 72) + 1)"/>
									</xsl:with-param>
									<xsl:with-param name="pMode">
										<xsl:value-of select="concat($pMode/text(), 'X')"/>
									</xsl:with-param>
								</xsl:call-template>
							</xsl:element>
						</xsl:element>
						<xsl:call-template name="gw:ParseHDR">
							<xsl:with-param name="pData">
								<xsl:value-of select="substring($pData/text(), 1 + 0 + $vLength/text() * 2, string-length($pData/text()) - (1 + 0 + $vLength/text() * 2) + 1)"/>
							</xsl:with-param>
							<xsl:with-param name="pMode">
								<xsl:value-of select="$pMode/text()"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="(($pMode/text() = 'BERFH2'))">
						<xsl:element name="MQRFH2">
							<xsl:element name="StrucId">
								<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 0, 8), 16, 64)))"/>
							</xsl:element>
							<xsl:element name="Version">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 8, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 8, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 8, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 8, 8), 1 + 6, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="StrucLength">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 16, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 6, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="Encoding">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 24, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 24, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 24, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 24, 8), 1 + 6, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="CodedCharSetId">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 32, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 32, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 32, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 32, 8), 1 + 6, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="Format">
								<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 40, 16), 16, 64)))"/>
							</xsl:element>
							<xsl:element name="Flags">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 56, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 56, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 56, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 56, 8), 1 + 6, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="NameValueCCSID">
								<xsl:value-of select="normalize-space(dp:radix-convert(concat(substring(substring($pData/text(), 1 + 64, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 64, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 64, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 64, 8), 1 + 6, 2)), 16, 10))"/>
							</xsl:element>
							<xsl:element name="NameValueData">
								<xsl:call-template name="gw:ParseHDR">
									<xsl:with-param name="pData">
										<xsl:value-of select="substring($pData/text(), 1 + 72, ($vLength/text() * 2) - (1 + 72) + 1)"/>
									</xsl:with-param>
									<xsl:with-param name="pMode">
										<xsl:value-of select="concat($pMode/text(), 'X')"/>
									</xsl:with-param>
								</xsl:call-template>
							</xsl:element>
						</xsl:element>
						<xsl:call-template name="gw:ParseHDR">
							<xsl:with-param name="pData">
								<xsl:value-of select="substring($pData/text(), 1 + 0 + $vLength/text() * 2, string-length($pData/text()) - (1 + 0 + $vLength/text() * 2) + 1)"/>
							</xsl:with-param>
							<xsl:with-param name="pMode">
								<xsl:value-of select="$pMode/text()"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="(($pMode/text() = 'LERFH1X'))">
						<xsl:element name="NameValue">
							<xsl:element name="Name">
								<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring-after(substring-before($pData/text(), '20'), ''), 16, 64)))"/>
							</xsl:element>
							<xsl:element name="Value">
								<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring-before(substring-after($pData/text(), '20'), '20'), 16, 64)))"/>
							</xsl:element>
						</xsl:element>
						<xsl:call-template name="gw:ParseHDR">
							<xsl:with-param name="pData">
								<xsl:value-of select="substring($pData/text(), 1 + 4 + $vLength/text() * 2, string-length($pData/text()) - (1 + 4 + $vLength/text() * 2) + 1)"/>
							</xsl:with-param>
							<xsl:with-param name="pMode">
								<xsl:value-of select="$pMode/text()"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="(($pMode/text() = 'BERFH1X'))">
						<xsl:element name="NameValue">
							<xsl:element name="Name">
								<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring-after(substring-before($pData/text(), '20'), ''), 16, 64)))"/>
							</xsl:element>
							<xsl:element name="Value">
								<xsl:value-of select="normalize-space(dp:binary-decode(dp:radix-convert(substring-before(substring-after($pData/text(), '20'), '20'), 16, 64)))"/>
							</xsl:element>
						</xsl:element>
						<xsl:call-template name="gw:ParseHDR">
							<xsl:with-param name="pData">
								<xsl:value-of select="substring($pData/text(), 1 + 4 + $vLength/text() * 2, string-length($pData/text()) - (1 + 4 + $vLength/text() * 2) + 1)"/>
							</xsl:with-param>
							<xsl:with-param name="pMode">
								<xsl:value-of select="$pMode/text()"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="(($pMode/text() = 'LERFH2X'))">
						<xsl:element name="NameValue">
							<xsl:copy-of select="dp:parse(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 8, $vLength/text() * 2), 16, 64)))"/>
						</xsl:element>
						<xsl:call-template name="gw:ParseHDR">
							<xsl:with-param name="pData">
								<xsl:value-of select="substring($pData/text(), 1 + 8 + $vLength/text() * 2, string-length($pData/text()) - (1 + 8 + $vLength/text() * 2) + 1)"/>
							</xsl:with-param>
							<xsl:with-param name="pMode">
								<xsl:value-of select="$pMode/text()"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="(($pMode/text() = 'BERFH2X'))">
						<xsl:element name="NameValue">
							<xsl:copy-of select="dp:parse(dp:binary-decode(dp:radix-convert(substring($pData/text(), 1 + 8, $vLength/text() * 2), 16, 64)))"/>
						</xsl:element>
						<xsl:call-template name="gw:ParseHDR">
							<xsl:with-param name="pData">
								<xsl:value-of select="substring($pData/text(), 1 + 8 + $vLength/text() * 2, string-length($pData/text()) - (1 + 8 + $vLength/text() * 2) + 1)"/>
							</xsl:with-param>
							<xsl:with-param name="pMode">
								<xsl:value-of select="$pMode/text()"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="gw:ParseHDR">
							<xsl:with-param name="pData">
								<xsl:value-of select="substring($pData/text(), 1 + 0 + $vLength/text() * 2, string-length($pData/text()) - (1 + 0 + $vLength/text() * 2) + 1)"/>
							</xsl:with-param>
							<xsl:with-param name="pMode">
								<xsl:value-of select="$pMode/text()"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
		</xsl:variable>
		<xsl:copy-of select="$vResult/header/*"/>
	</xsl:template>

	<xsl:template name="gw:ParseHEX">
		<xsl:param name="pData"/>
		<xsl:variable name="vLength">
			<xsl:if test="((not(string-length($pData/text()) = 0)))">
				<xsl:choose>
					<xsl:when test="((substring($pData/text(), 1 + 0, 16) = '5851482001000000'))">
						<xsl:value-of select="428"/>
					</xsl:when>
					<xsl:when test="((substring($pData/text(), 1 + 0, 16) = '5851482000000001'))">
						<xsl:value-of select="428"/>
					</xsl:when>
					<xsl:when test="((substring($pData/text(), 1 + 0, 16) = '5851482002000000'))">
						<xsl:value-of select="468"/>
					</xsl:when>
					<xsl:when test="((substring($pData/text(), 1 + 0, 16) = '5851482000000002'))">
						<xsl:value-of select="468"/>
					</xsl:when>
					<xsl:when test="((substring($pData/text(), 1 + 0, 16) = '4D44452001000000'))">
						<xsl:value-of select="dp:radix-convert(concat(substring(substring($pData/text(), 1 + 16, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 0, 2)), 16, 10)"/>
					</xsl:when>
					<xsl:when test="((substring($pData/text(), 1 + 0, 16) = '4D44452000000001'))">
						<xsl:value-of select="dp:radix-convert(concat(substring(substring($pData/text(), 1 + 16, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 6, 2)), 16, 10)"/>
					</xsl:when>
					<xsl:when test="((substring($pData/text(), 1 + 0, 16) = '4D44452002000000'))">
						<xsl:value-of select="dp:radix-convert(concat(substring(substring($pData/text(), 1 + 16, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 0, 2)), 16, 10)"/>
					</xsl:when>
					<xsl:when test="((substring($pData/text(), 1 + 0, 16) = '4D44452000000002'))">
						<xsl:value-of select="dp:radix-convert(concat(substring(substring($pData/text(), 1 + 16, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 6, 2)), 16, 10)"/>
					</xsl:when>
					<xsl:when test="((substring($pData/text(), 1 + 0, 16) = '5246482001000000'))">
						<xsl:value-of select="dp:radix-convert(concat(substring(substring($pData/text(), 1 + 16, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 0, 2)), 16, 10)"/>
					</xsl:when>
					<xsl:when test="((substring($pData/text(), 1 + 0, 16) = '5246482000000001'))">
						<xsl:value-of select="dp:radix-convert(concat(substring(substring($pData/text(), 1 + 16, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 6, 2)), 16, 10)"/>
					</xsl:when>
					<xsl:when test="((substring($pData/text(), 1 + 0, 16) = '5246482002000000'))">
						<xsl:value-of select="dp:radix-convert(concat(substring(substring($pData/text(), 1 + 16, 8), 1 + 6, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 0, 2)), 16, 10)"/>
					</xsl:when>
					<xsl:when test="((substring($pData/text(), 1 + 0, 16) = '5246482000000002'))">
						<xsl:value-of select="dp:radix-convert(concat(substring(substring($pData/text(), 1 + 16, 8), 1 + 0, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 2, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 4, 2), substring(substring($pData/text(), 1 + 16, 8), 1 + 6, 2)), 16, 10)"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="0"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
		</xsl:variable>
		<xsl:variable name="vResult">
			<xsl:if test="((not(string-length($pData/text()) = 0)))">
				<xsl:choose>
					<xsl:when test="((substring($pData/text(), 1 + 0, 16) = '5851482001000000'))">
						<xsl:call-template name="gw:ParseHEX">
							<xsl:with-param name="pData">
								<xsl:value-of select="substring($pData/text(), 1 + 0 + $vLength/text() * 2, string-length($pData/text()) - (1 + 0 + $vLength/text() * 2) + 1)"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="((substring($pData/text(), 1 + 0, 16) = '5851482000000001'))">
						<xsl:call-template name="gw:ParseHEX">
							<xsl:with-param name="pData">
								<xsl:value-of select="substring($pData/text(), 1 + 0 + $vLength/text() * 2, string-length($pData/text()) - (1 + 0 + $vLength/text() * 2) + 1)"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="((substring($pData/text(), 1 + 0, 16) = '5851482002000000'))">
						<xsl:call-template name="gw:ParseHEX">
							<xsl:with-param name="pData">
								<xsl:value-of select="substring($pData/text(), 1 + 0 + $vLength/text() * 2, string-length($pData/text()) - (1 + 0 + $vLength/text() * 2) + 1)"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="((substring($pData/text(), 1 + 0, 16) = '5851482000000002'))">
						<xsl:call-template name="gw:ParseHEX">
							<xsl:with-param name="pData">
								<xsl:value-of select="substring($pData/text(), 1 + 0 + $vLength/text() * 2, string-length($pData/text()) - (1 + 0 + $vLength/text() * 2) + 1)"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="((substring($pData/text(), 1 + 0, 16) = '4D44452001000000'))">
						<xsl:call-template name="gw:ParseHEX">
							<xsl:with-param name="pData">
								<xsl:value-of select="substring($pData/text(), 1 + 0 + $vLength/text() * 2, string-length($pData/text()) - (1 + 0 + $vLength/text() * 2) + 1)"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="((substring($pData/text(), 1 + 0, 16) = '4D44452000000001'))">
						<xsl:call-template name="gw:ParseHEX">
							<xsl:with-param name="pData">
								<xsl:value-of select="substring($pData/text(), 1 + 0 + $vLength/text() * 2, string-length($pData/text()) - (1 + 0 + $vLength/text() * 2) + 1)"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="((substring($pData/text(), 1 + 0, 16) = '4D44452002000000'))">
						<xsl:call-template name="gw:ParseHEX">
							<xsl:with-param name="pData">
								<xsl:value-of select="substring($pData/text(), 1 + 0 + $vLength/text() * 2, string-length($pData/text()) - (1 + 0 + $vLength/text() * 2) + 1)"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="((substring($pData/text(), 1 + 0, 16) = '4D44452000000002'))">
						<xsl:call-template name="gw:ParseHEX">
							<xsl:with-param name="pData">
								<xsl:value-of select="substring($pData/text(), 1 + 0 + $vLength/text() * 2, string-length($pData/text()) - (1 + 0 + $vLength/text() * 2) + 1)"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="((substring($pData/text(), 1 + 0, 16) = '5246482001000000'))">
						<xsl:call-template name="gw:ParseHEX">
							<xsl:with-param name="pData">
								<xsl:value-of select="substring($pData/text(), 1 + 0 + $vLength/text() * 2, string-length($pData/text()) - (1 + 0 + $vLength/text() * 2) + 1)"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="((substring($pData/text(), 1 + 0, 16) = '5246482000000001'))">
						<xsl:call-template name="gw:ParseHEX">
							<xsl:with-param name="pData">
								<xsl:value-of select="substring($pData/text(), 1 + 0 + $vLength/text() * 2, string-length($pData/text()) - (1 + 0 + $vLength/text() * 2) + 1)"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="((substring($pData/text(), 1 + 0, 16) = '5246482002000000'))">
						<xsl:call-template name="gw:ParseHEX">
							<xsl:with-param name="pData">
								<xsl:value-of select="substring($pData/text(), 1 + 0 + $vLength/text() * 2, string-length($pData/text()) - (1 + 0 + $vLength/text() * 2) + 1)"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="((substring($pData/text(), 1 + 0, 16) = '5246482000000002'))">
						<xsl:call-template name="gw:ParseHEX">
							<xsl:with-param name="pData">
								<xsl:value-of select="substring($pData/text(), 1 + 0 + $vLength/text() * 2, string-length($pData/text()) - (1 + 0 + $vLength/text() * 2) + 1)"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="substring($pData/text(), 1 + 0 + $vLength/text() * 2, string-length($pData/text()) - (1 + 0 + $vLength/text() * 2) + 1)"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
		</xsl:variable>
		<xsl:variable name="vDebug">
			<xsl:if test="((not(string-length($pData/text()) = 0)))">
				<xsl:choose>
					<xsl:when test="((substring($pData/text(), 1 + 0, 16) = '5851482001000000'))">
						<xsl:call-template name="gw:HeaderWrite">
							<xsl:with-param name="pHeader">
								<xsl:element name="header">
									<xsl:attribute name="name">
										<xsl:value-of select="'MQXQH'"/>
									</xsl:attribute>
									<xsl:call-template name="gw:ParseHDR">
										<xsl:with-param name="pHeader">
											<xsl:value-of select="substring($pData/text(), 1 + 0, $vLength/text() * 2)"/>
										</xsl:with-param>
										<xsl:with-param name="pMode">
											<xsl:value-of select="'LEXQH1'"/>
										</xsl:with-param>
									</xsl:call-template>
								</xsl:element>
							</xsl:with-param>
							<xsl:with-param name="pType">
								<xsl:value-of select="'current'"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="((substring($pData/text(), 1 + 0, 16) = '5851482000000001'))">
						<xsl:call-template name="gw:HeaderWrite">
							<xsl:with-param name="pHeader">
								<xsl:element name="header">
									<xsl:attribute name="name">
										<xsl:value-of select="'MQXQH'"/>
									</xsl:attribute>
									<xsl:call-template name="gw:ParseHDR">
										<xsl:with-param name="pHeader">
											<xsl:value-of select="substring($pData/text(), 1 + 0, $vLength/text() * 2)"/>
										</xsl:with-param>
										<xsl:with-param name="pMode">
											<xsl:value-of select="'BEXQH1'"/>
										</xsl:with-param>
									</xsl:call-template>
								</xsl:element>
							</xsl:with-param>
							<xsl:with-param name="pType">
								<xsl:value-of select="'current'"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="((substring($pData/text(), 1 + 0, 16) = '5851482002000000'))">
						<xsl:call-template name="gw:HeaderWrite">
							<xsl:with-param name="pHeader">
								<xsl:element name="header">
									<xsl:attribute name="name">
										<xsl:value-of select="'MQXQH'"/>
									</xsl:attribute>
									<xsl:call-template name="gw:ParseHDR">
										<xsl:with-param name="pHeader">
											<xsl:value-of select="substring($pData/text(), 1 + 0, $vLength/text() * 2)"/>
										</xsl:with-param>
										<xsl:with-param name="pMode">
											<xsl:value-of select="'LEXQH2'"/>
										</xsl:with-param>
									</xsl:call-template>
								</xsl:element>
							</xsl:with-param>
							<xsl:with-param name="pType">
								<xsl:value-of select="'current'"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="((substring($pData/text(), 1 + 0, 16) = '5851482000000002'))">
						<xsl:call-template name="gw:HeaderWrite">
							<xsl:with-param name="pHeader">
								<xsl:element name="header">
									<xsl:attribute name="name">
										<xsl:value-of select="'MQXQH'"/>
									</xsl:attribute>
									<xsl:call-template name="gw:ParseHDR">
										<xsl:with-param name="pHeader">
											<xsl:value-of select="substring($pData/text(), 1 + 0, $vLength/text() * 2)"/>
										</xsl:with-param>
										<xsl:with-param name="pMode">
											<xsl:value-of select="'BEXQH2'"/>
										</xsl:with-param>
									</xsl:call-template>
								</xsl:element>
							</xsl:with-param>
							<xsl:with-param name="pType">
								<xsl:value-of select="'current'"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="((substring($pData/text(), 1 + 0, 16) = '4D44452001000000'))">
						<xsl:call-template name="gw:HeaderWrite">
							<xsl:with-param name="pHeader">
								<xsl:element name="header">
									<xsl:attribute name="name">
										<xsl:value-of select="'MQMDE'"/>
									</xsl:attribute>
									<xsl:call-template name="gw:ParseHDR">
										<xsl:with-param name="pHeader">
											<xsl:value-of select="substring($pData/text(), 1 + 0, $vLength/text() * 2)"/>
										</xsl:with-param>
										<xsl:with-param name="pMode">
											<xsl:value-of select="'LEMDE1'"/>
										</xsl:with-param>
									</xsl:call-template>
								</xsl:element>
							</xsl:with-param>
							<xsl:with-param name="pType">
								<xsl:value-of select="'current'"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="((substring($pData/text(), 1 + 0, 16) = '4D44452000000001'))">
						<xsl:call-template name="gw:HeaderWrite">
							<xsl:with-param name="pHeader">
								<xsl:element name="header">
									<xsl:attribute name="name">
										<xsl:value-of select="'MQMDE'"/>
									</xsl:attribute>
									<xsl:call-template name="gw:ParseHDR">
										<xsl:with-param name="pHeader">
											<xsl:value-of select="substring($pData/text(), 1 + 0, $vLength/text() * 2)"/>
										</xsl:with-param>
										<xsl:with-param name="pMode">
											<xsl:value-of select="'BEMDE1'"/>
										</xsl:with-param>
									</xsl:call-template>
								</xsl:element>
							</xsl:with-param>
							<xsl:with-param name="pType">
								<xsl:value-of select="'current'"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="((substring($pData/text(), 1 + 0, 16) = '4D44452002000000'))">
						<xsl:call-template name="gw:HeaderWrite">
							<xsl:with-param name="pHeader">
								<xsl:element name="header">
									<xsl:attribute name="name">
										<xsl:value-of select="'MQMDE'"/>
									</xsl:attribute>
									<xsl:call-template name="gw:ParseHDR">
										<xsl:with-param name="pHeader">
											<xsl:value-of select="substring($pData/text(), 1 + 0, $vLength/text() * 2)"/>
										</xsl:with-param>
										<xsl:with-param name="pMode">
											<xsl:value-of select="'LEMDE2'"/>
										</xsl:with-param>
									</xsl:call-template>
								</xsl:element>
							</xsl:with-param>
							<xsl:with-param name="pType">
								<xsl:value-of select="'current'"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="((substring($pData/text(), 1 + 0, 16) = '4D44452000000002'))">
						<xsl:call-template name="gw:HeaderWrite">
							<xsl:with-param name="pHeader">
								<xsl:element name="header">
									<xsl:attribute name="name">
										<xsl:value-of select="'MQMDE'"/>
									</xsl:attribute>
									<xsl:call-template name="gw:ParseHDR">
										<xsl:with-param name="pHeader">
											<xsl:value-of select="substring($pData/text(), 1 + 0, $vLength/text() * 2)"/>
										</xsl:with-param>
										<xsl:with-param name="pMode">
											<xsl:value-of select="'BEMDE2'"/>
										</xsl:with-param>
									</xsl:call-template>
								</xsl:element>
							</xsl:with-param>
							<xsl:with-param name="pType">
								<xsl:value-of select="'current'"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="((substring($pData/text(), 1 + 0, 16) = '5246482001000000'))">
						<xsl:call-template name="gw:HeaderWrite">
							<xsl:with-param name="pHeader">
								<xsl:element name="header">
									<xsl:attribute name="name">
										<xsl:value-of select="'MQRFH'"/>
									</xsl:attribute>
									<xsl:call-template name="gw:ParseHDR">
										<xsl:with-param name="pHeader">
											<xsl:value-of select="substring($pData/text(), 1 + 0, $vLength/text() * 2)"/>
										</xsl:with-param>
										<xsl:with-param name="pMode">
											<xsl:value-of select="'LERFH1'"/>
										</xsl:with-param>
									</xsl:call-template>
								</xsl:element>
							</xsl:with-param>
							<xsl:with-param name="pType">
								<xsl:value-of select="'current'"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="((substring($pData/text(), 1 + 0, 16) = '5246482000000001'))">
						<xsl:call-template name="gw:HeaderWrite">
							<xsl:with-param name="pHeader">
								<xsl:element name="header">
									<xsl:attribute name="name">
										<xsl:value-of select="'MQRFH'"/>
									</xsl:attribute>
									<xsl:call-template name="gw:ParseHDR">
										<xsl:with-param name="pHeader">
											<xsl:value-of select="substring($pData/text(), 1 + 0, $vLength/text() * 2)"/>
										</xsl:with-param>
										<xsl:with-param name="pMode">
											<xsl:value-of select="'BERFH1'"/>
										</xsl:with-param>
									</xsl:call-template>
								</xsl:element>
							</xsl:with-param>
							<xsl:with-param name="pType">
								<xsl:value-of select="'current'"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="((substring($pData/text(), 1 + 0, 16) = '5246482002000000'))">
						<xsl:call-template name="gw:HeaderWrite">
							<xsl:with-param name="pHeader">
								<xsl:element name="header">
									<xsl:attribute name="name">
										<xsl:value-of select="'MQRFH2'"/>
									</xsl:attribute>
									<xsl:call-template name="gw:ParseHDR">
										<xsl:with-param name="pHeader">
											<xsl:value-of select="substring($pData/text(), 1 + 0, $vLength/text() * 2)"/>
										</xsl:with-param>
										<xsl:with-param name="pMode">
											<xsl:value-of select="'LERFH2'"/>
										</xsl:with-param>
									</xsl:call-template>
								</xsl:element>
							</xsl:with-param>
							<xsl:with-param name="pType">
								<xsl:value-of select="'current'"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="((substring($pData/text(), 1 + 0, 16) = '5246482000000002'))">
						<xsl:call-template name="gw:HeaderWrite">
							<xsl:with-param name="pHeader">
								<xsl:element name="header">
									<xsl:attribute name="name">
										<xsl:value-of select="'MQRFH2'"/>
									</xsl:attribute>
									<xsl:call-template name="gw:ParseHDR">
										<xsl:with-param name="pHeader">
											<xsl:value-of select="substring($pData/text(), 1 + 0, $vLength/text() * 2)"/>
										</xsl:with-param>
										<xsl:with-param name="pMode">
											<xsl:value-of select="'BERFH2'"/>
										</xsl:with-param>
									</xsl:call-template>
								</xsl:element>
							</xsl:with-param>
							<xsl:with-param name="pType">
								<xsl:value-of select="'current'"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="gw:HeaderWrite">
							<xsl:with-param name="pHeader">
								<xsl:element name="header">
									<xsl:attribute name="name">
										<xsl:value-of select="'MQNONE'"/>
									</xsl:attribute>
									<xsl:call-template name="gw:ParseHDR">
										<xsl:with-param name="pHeader">
											<xsl:value-of select="substring($pData/text(), 1 + 0, $vLength/text() * 2)"/>
										</xsl:with-param>
										<xsl:with-param name="pMode">
											<xsl:value-of select="'MQNONEX'"/>
										</xsl:with-param>
									</xsl:call-template>
								</xsl:element>
							</xsl:with-param>
							<xsl:with-param name="pType">
								<xsl:value-of select="'current'"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
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
					<xsl:call-template name="gw:ParseHEX">
						<xsl:with-param name="pData">
							<xsl:value-of select="$vNode/object/message/text()"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:element>
			</xsl:element>
		</xsl:variable>
		<xsl:copy-of select="$vResult/*"/>
	</xsl:template>
</xsl:stylesheet>
