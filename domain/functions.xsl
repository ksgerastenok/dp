<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:dp="http://www.datapower.com/extensions"
	xmlns:gw="http://sberbank.ru/sbt/functions"
	exclude-result-prefixes="dp gw"
	extension-element-prefixes="dp gw">
	<!--dp:input-mapping href="local:///ffd/base-64.ffd" type="ffd"/-->
	<!--dp:output-mapping href="local:///ffd/base-64.ffd" type="ffd"/-->
        <!--xsl:import href="local:///functions.xsl"/-->
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" dp:escaping="minimum"/>
	<xsl:template name="gw:HeaderRead">
		<xsl:param name="pHeader"/>
		<xsl:param name="pType"/>
		<xsl:variable name="vHeader">
			<xsl:for-each select="$pHeader/header">
				<xsl:choose>
					<xsl:when test="(($pType/text() = 'request'))">
						<xsl:choose>
							<xsl:when test="((dp:responding()))">
								<xsl:element name="header">
									<xsl:attribute name="name">
										<xsl:value-of select="./@name"/>
									</xsl:attribute>
									<xsl:value-of select="dp:request-header(./@name)"/>
								</xsl:element>
							</xsl:when>
							<xsl:otherwise>
								<xsl:element name="header">
									<xsl:attribute name="name">
										<xsl:value-of select="./@name"/>
									</xsl:attribute>
									<xsl:value-of select="dp:request-header(./@name)"/>
								</xsl:element>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:when test="(($pType/text() = 'current'))">
						<xsl:choose>
							<xsl:when test="((dp:responding()))">
								<xsl:element name="header">
									<xsl:attribute name="name">
										<xsl:value-of select="./@name"/>
									</xsl:attribute>
									<xsl:value-of select="dp:response-header(./@name)"/>
								</xsl:element>
							</xsl:when>
							<xsl:otherwise>
								<xsl:element name="header">
									<xsl:attribute name="name">
										<xsl:value-of select="./@name"/>
									</xsl:attribute>
									<xsl:value-of select="dp:request-header(./@name)"/>
								</xsl:element>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:when test="(($pType/text() = 'response'))">
						<xsl:choose>
							<xsl:when test="((dp:responding()))">
								<xsl:element name="header">
									<xsl:attribute name="name">
										<xsl:value-of select="./@name"/>
									</xsl:attribute>
									<xsl:value-of select="dp:response-header(./@name)"/>
								</xsl:element>
							</xsl:when>
							<xsl:otherwise>
								<xsl:element name="header">
									<xsl:attribute name="name">
										<xsl:value-of select="./@name"/>
									</xsl:attribute>
									<xsl:value-of select="dp:response-header(./@name)"/>
								</xsl:element>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<xsl:when test="((dp:responding()))">
								<xsl:element name="header">
									<xsl:attribute name="name">
										<xsl:value-of select="./@name"/>
									</xsl:attribute>
									<xsl:value-of select="''"/>
								</xsl:element>
							</xsl:when>
							<xsl:otherwise>
								<xsl:element name="header">
									<xsl:attribute name="name">
										<xsl:value-of select="./@name"/>
									</xsl:attribute>
									<xsl:value-of select="''"/>
								</xsl:element>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</xsl:variable>
		<xsl:variable name="vResult">
			<xsl:for-each select="$vHeader/header">
				<xsl:choose>
					<xsl:when test="((not(count(./*) = 0)))">
						<xsl:element name="header">
							<xsl:attribute name="name">
								<xsl:value-of select="./@name"/>
							</xsl:attribute>
							<xsl:copy-of select="./*"/>
						</xsl:element>
					</xsl:when>
					<xsl:when test="((not(count(dp:parse(./text())) = 0)))">
						<xsl:element name="header">
							<xsl:attribute name="name">
								<xsl:value-of select="./@name"/>
							</xsl:attribute>
							<xsl:copy-of select="dp:parse(./text())"/>
						</xsl:element>
					</xsl:when>
					<xsl:otherwise>
						<xsl:element name="header">
							<xsl:attribute name="name">
								<xsl:value-of select="./@name"/>
							</xsl:attribute>
							<xsl:value-of select="./text()"/>
						</xsl:element>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</xsl:variable>
		<xsl:variable name="vDebug">
			<xsl:message terminate="no" dp:type="all" dp:priority="debug">
				<xsl:value-of select="concat('METHOD=', 'HeaderRead', ', ')"/>
				<xsl:value-of select="concat('TYPE=', $pType/text(), ': ')"/>
				<xsl:copy-of select="$vResult/*"/>
			</xsl:message>
		</xsl:variable>
		<xsl:copy-of select="$vResult/*"/>
	</xsl:template>
	<xsl:template name="gw:HeaderWrite">
 		<xsl:param name="pHeader"/>
		<xsl:param name="pType"/>
		<xsl:variable name="vHeader">
			<xsl:for-each select="$pHeader/header">
				<xsl:choose>
					<xsl:when test="((not(count(./*) = 0)))">
						<xsl:element name="header">
							<xsl:attribute name="name">
								<xsl:value-of select="./@name"/>
							</xsl:attribute>
							<dp:serialize select="./*" omit-xml-decl="yes"/>
						</xsl:element>
					</xsl:when>
					<xsl:when test="((not(count(dp:parse(./text())) = 0)))">
						<xsl:element name="header">
							<xsl:attribute name="name">
								<xsl:value-of select="./@name"/>
							</xsl:attribute>
							<xsl:value-of select="./text()"/>
						</xsl:element>
					</xsl:when>
					<xsl:otherwise>
						<xsl:element name="header">
							<xsl:attribute name="name">
								<xsl:value-of select="./@name"/>
							</xsl:attribute>
							<xsl:value-of select="./text()"/>
						</xsl:element>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</xsl:variable>
		<xsl:variable name="vResult">
			<xsl:for-each select="$vHeader/header">
				<xsl:choose>
					<xsl:when test="(($pType/text() = 'request'))">
						<xsl:choose>
							<xsl:when test="((dp:responding()))">
								<xsl:element name="header">
									<xsl:attribute name="name">
										<xsl:value-of select="./@name"/>
									</xsl:attribute>
									<dp:set-request-header name="./@name" value="./text()"/>
								</xsl:element>
							</xsl:when>
							<xsl:otherwise>
								<xsl:element name="header">
									<xsl:attribute name="name">
										<xsl:value-of select="./@name"/>
									</xsl:attribute>
									<dp:set-request-header name="./@name" value="./text()"/>
								</xsl:element>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:when test="(($pType/text() = 'current'))">
						<xsl:choose>
							<xsl:when test="((dp:responding()))">
								<xsl:element name="header">
									<xsl:attribute name="name">
										<xsl:value-of select="./@name"/>
									</xsl:attribute>
									<dp:set-response-header name="./@name" value="./text()"/>
								</xsl:element>
							</xsl:when>
							<xsl:otherwise>
								<xsl:element name="header">
									<xsl:attribute name="name">
										<xsl:value-of select="./@name"/>
									</xsl:attribute>
									<dp:set-request-header name="./@name" value="./text()"/>
								</xsl:element>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:when test="(($pType/text() = 'response'))">
						<xsl:choose>
							<xsl:when test="((dp:responding()))">
								<xsl:element name="header">
									<xsl:attribute name="name">
										<xsl:value-of select="./@name"/>
									</xsl:attribute>
									<dp:set-response-header name="./@name" value="./text()"/>
								</xsl:element>
							</xsl:when>
							<xsl:otherwise>
								<xsl:element name="header">
									<xsl:attribute name="name">
										<xsl:value-of select="./@name"/>
									</xsl:attribute>
									<dp:set-response-header name="./@name" value="./text()"/>
								</xsl:element>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<xsl:when test="((dp:responding()))">
								<xsl:element name="header">
									<xsl:attribute name="name">
										<xsl:value-of select="./@name"/>
									</xsl:attribute>
									<xsl:value-of select="''"/>
								</xsl:element>
							</xsl:when>
							<xsl:otherwise>
								<xsl:element name="header">
									<xsl:attribute name="name">
										<xsl:value-of select="./@name"/>
									</xsl:attribute>
									<xsl:value-of select="''"/>
								</xsl:element>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</xsl:variable>
		<xsl:variable name="vDebug">
			<xsl:message terminate="no" dp:type="all" dp:priority="debug">
				<xsl:value-of select="concat('METHOD=', 'HeaderWrite', ', ')"/>
				<xsl:value-of select="concat('TYPE=', $pType/text(), ': ')"/>
				<xsl:copy-of select="$pHeader/*"/>
			</xsl:message>
		</xsl:variable>
		<xsl:copy-of select="$pHeader/*"/>
	</xsl:template>
	<xsl:template name="gw:URLOpen">
		<xsl:param name="pMessage"/>
		<xsl:variable name="vMessage">
			<xsl:element name="Envelope">
				<xsl:element name="System">
					<xsl:element name="URL">
						<xsl:value-of select="$pMessage/Envelope/System/URL/text()"/>
					</xsl:element>
					<xsl:element name="Method">
						<xsl:value-of select="$pMessage/Envelope/System/Method/text()"/>
					</xsl:element>
					<xsl:element name="Options">
						<xsl:value-of select="$pMessage/Envelope/System/Options/text()"/>
					</xsl:element>
					<xsl:element name="SSLProfile">
						<xsl:value-of select="$pMessage/Envelope/System/SSLProfile/text()"/>
					</xsl:element>
				</xsl:element>
				<xsl:element name="Header">
					<xsl:for-each select="$pMessage/Envelope/Header/header">
						<xsl:choose>
							<xsl:when test="((not(count(./*) = 0)))">
								<xsl:element name="header">
									<xsl:attribute name="name">
										<xsl:value-of select="./@name"/>
									</xsl:attribute>
									<dp:serialize select="./*" omit-xml-decl="yes"/>
								</xsl:element>
							</xsl:when>
							<xsl:when test="((not(count(dp:parse(./text())) = 0)))">
								<xsl:element name="header">
									<xsl:attribute name="name">
										<xsl:value-of select="./@name"/>
									</xsl:attribute>
									<xsl:value-of select="./text()"/>
								</xsl:element>
							</xsl:when>
							<xsl:otherwise>
								<xsl:element name="header">
									<xsl:attribute name="name">
										<xsl:value-of select="./@name"/>
									</xsl:attribute>
									<xsl:value-of select="./text()"/>
								</xsl:element>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</xsl:element>
				<xsl:element name="Body">
					<xsl:copy-of select="dp:binary-decode($pMessage/Envelope/Body/node())"/>
				</xsl:element>
			</xsl:element>
		</xsl:variable>
		<xsl:variable name="vCALL">
			<dp:url-open target="{$vMessage/Envelope/System/URL/text()}" http-method="{$vMessage/Envelope/System/Method/text()}" ssl-proxy="{$vMessage/Envelope/System/SSLProfile/text()}" options="{$vMessage/Envelope/System/Options/text()}" http-headers="$vMessage/Envelope/Header/*" response="responsecode-binary" timeout="120">
				<xsl:copy-of select="$vMessage/Envelope/Body/node()"/>
			</dp:url-open>
		</xsl:variable>
		<xsl:variable name="vResult">
			<xsl:element name="Envelope">
				<xsl:element name="System">
					<xsl:element name="StatusCode">
						<xsl:value-of select="$vCALL/result/responsecode/text()"/>
					</xsl:element>
					<xsl:element name="StatusDesc">
						<xsl:value-of select="$vCALL/result/reasonphrase/text()"/>
					</xsl:element>
					<xsl:element name="ErrorCode">
						<xsl:value-of select="$vCALL/result/errorstatuscode/text()"/>
					</xsl:element>
					<xsl:element name="ErrorDesc">
						<xsl:value-of select="$vCALL/result/errorstring/text()"/>
					</xsl:element>
				</xsl:element>
				<xsl:element name="Header">
					<xsl:for-each select="$vCALL/result/headers/header">
						<xsl:choose>
							<xsl:when test="((not(count(./*) = 0)))">
								<xsl:element name="header">
									<xsl:attribute name="name">
										<xsl:value-of select="./@name"/>
									</xsl:attribute>
									<xsl:copy-of select="./*"/>
								</xsl:element>
							</xsl:when>
							<xsl:when test="((not(count(dp:parse(./text())) = 0)))">
								<xsl:element name="header">
									<xsl:attribute name="name">
										<xsl:value-of select="./@name"/>
									</xsl:attribute>
									<xsl:copy-of select="dp:parse(./text())"/>
								</xsl:element>
							</xsl:when>
							<xsl:otherwise>
								<xsl:element name="header">
									<xsl:attribute name="name">
										<xsl:value-of select="./@name"/>
									</xsl:attribute>
									<xsl:value-of select="./text()"/>
								</xsl:element>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</xsl:element>
				<xsl:element name="Body">
					<xsl:copy-of select="dp:binary-encode($vCALL/result/binary/node())"/>
				</xsl:element>
			</xsl:element>
		</xsl:variable>
		<xsl:variable name="vDebug">
			<xsl:message terminate="no" dp:type="all" dp:priority="debug">
				<xsl:value-of select="concat('METHOD=', 'URLOpen', ': ')"/>
				<xsl:copy-of select="$vResult/*"/>
			</xsl:message>
		</xsl:variable>
		<xsl:copy-of select="$vResult/*"/>
	</xsl:template>
	<xsl:template name="gw:RouteRead">
		<xsl:param name="pType"/>
		<xsl:variable name="vURLIn">
			<xsl:value-of select="dp:variable('var://service/URL-in')"/>
		</xsl:variable>
		<xsl:variable name="vURLOut">
			<xsl:value-of select="dp:variable('var://service/URL-out')"/>
		</xsl:variable>
		<xsl:variable name="vResult">
			<xsl:choose>
				<xsl:when test="(($pType/text() = 'EventSource'))">
					<xsl:choose>
						<xsl:when test="((dp:responding()))">
							<xsl:choose>
								<xsl:when test="((starts-with($vURLOut/text(), 'dpmq')))">
									<xsl:value-of select="substring-before($vURLOut/text(), '://')"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="substring-before($vURLOut/text(), '://')"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:choose>
								<xsl:when test="((starts-with($vURLIn/text(), 'dpmq')))">
									<xsl:value-of select="substring-before($vURLIn/text(), '://')"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="substring-before($vURLIn/text(), '://')"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:when test="(($pType/text() = 'EventReceiver'))">
					<xsl:choose>
						<xsl:when test="((dp:responding()))">
							<xsl:choose>
								<xsl:when test="((starts-with($vURLIn/text(), 'dpmq')))">
									<xsl:value-of select="substring-before($vURLIn/text(), '://')"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="substring-before($vURLIn/text(), '://')"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:choose>
								<xsl:when test="((starts-with($vURLOut/text(), 'dpmq')))">
									<xsl:value-of select="substring-before($vURLOut/text(), '://')"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="substring-before($vURLOut/text(), '://')"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:when test="(($pType/text() = 'SourceQM'))">
					<xsl:choose>
						<xsl:when test="((dp:responding()))">
							<xsl:choose>
								<xsl:when test="((starts-with($vURLOut/text(), 'dpmq')))">
									<xsl:choose>
										<xsl:when test="((contains($vURLOut/text(), 'ReplyQueue=')))">
											<xsl:choose>
												<xsl:when test="(((contains(substring-after($vURLOut/text(), 'ReplyQueue='), '&amp;'))))">
													<xsl:value-of select="substring-before(substring-after($vURLOut/text(), '://'), '/')"/>
												</xsl:when>
												<xsl:when test="((contains(substring-after($vURLOut/text(), 'ReplyQueue='), ';')))">
													<xsl:value-of select="substring-before(substring-after($vURLOut/text(), '://'), '/')"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="substring-before(substring-after($vURLOut/text(), '://'), '/')"/>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="'UNKNOWN'"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="substring-before(substring-after($vURLOut/text(), '://'), '/')"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:choose>
								<xsl:when test="((starts-with($vURLIn/text(), 'dpmq')))">
									<xsl:choose>
										<xsl:when test="((contains($vURLIn/text(), 'RequestQueue=')))">
											<xsl:choose>
												<xsl:when test="((contains(substring-after($vURLIn/text(), 'RequestQueue='), '&amp;')))">
													<xsl:value-of select="substring-before(substring-after($vURLIn/text(), '://'), '/')"/>
												</xsl:when>
												<xsl:when test="((contains(substring-after($vURLIn/text(), 'RequestQueue='), ';')))">
													<xsl:value-of select="substring-before(substring-after($vURLIn/text(), '://'), '/')"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="substring-before(substring-after($vURLIn/text(), '://'), '/')"/>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="'UNKNOWN'"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="substring-before(substring-after($vURLIn/text(), '://'), '/')"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:when test="(($pType/text() = 'SourceQueue'))">
					<xsl:choose>
						<xsl:when test="((dp:responding()))">
							<xsl:choose>
								<xsl:when test="((starts-with($vURLOut/text(), 'dpmq')))">
									<xsl:choose>
										<xsl:when test="((contains($vURLOut/text(), 'ReplyQueue=')))">
											<xsl:choose>
												<xsl:when test="((contains(substring-after($vURLOut/text(), 'ReplyQueue='), '&amp;')))">
													<xsl:value-of select="substring-before(substring-after($vURLOut/text(), 'ReplyQueue='), '&amp;')"/>
												</xsl:when>
												<xsl:when test="((contains(substring-after($vURLOut/text(), 'ReplyQueue='), ';')))">
													<xsl:value-of select="substring-before(substring-after($vURLOut/text(), 'ReplyQueue='), ';')"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="substring-after($vURLOut/text(), 'ReplyQueue=')"/>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="'UNKNOWN'"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="substring-after(substring-after($vURLOut/text(), '://'), '/')"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:choose>
								<xsl:when test="((starts-with($vURLIn/text(), 'dpmq')))">
									<xsl:choose>
										<xsl:when test="((contains($vURLIn/text(), 'RequestQueue=')))">
											<xsl:choose>
												<xsl:when test="((contains(substring-after($vURLIn/text(), 'RequestQueue='), '&amp;')))">
													<xsl:value-of select="substring-before(substring-after($vURLIn/text(), 'RequestQueue='), '&amp;')"/>
												</xsl:when>
												<xsl:when test="((contains(substring-after($vURLIn/text(), 'RequestQueue='), ';')))">
													<xsl:value-of select="substring-before(substring-after($vURLIn/text(), 'RequestQueue='), ';')"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="substring-after($vURLIn/text(), 'RequestQueue=')"/>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="'UNKNOWN'"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="substring-after(substring-after($vURLIn/text(), '://'), '/')"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
        			<xsl:when test="(($pType/text() = 'TargetQM'))">
					<xsl:choose>
						<xsl:when test="((dp:responding()))">
							<xsl:choose>
								<xsl:when test="((starts-with($vURLIn/text(), 'dpmq')))">
									<xsl:choose>
										<xsl:when test="((contains($vURLIn/text(), 'ReplyQueue=')))">
											<xsl:choose>
												<xsl:when test="((contains(substring-after($vURLIn/text(), 'ReplyQueue='), '&amp;')))">
													<xsl:value-of select="substring-before(substring-after($vURLIn/text(), '://'), '/')"/>
												</xsl:when>
												<xsl:when test="((contains(substring-after($vURLIn/text(), 'ReplyQueue='), ';')))">
													<xsl:value-of select="substring-before(substring-after($vURLIn/text(), '://'), '/')"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="substring-before(substring-after($vURLIn/text(), '://'), '/')"/>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="'UNKNOWN'"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="substring-before(substring-after($vURLIn/text(), '://'), '/')"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:choose>
								<xsl:when test="((starts-with($vURLOut/text(), 'dpmq')))">
									<xsl:choose>
										<xsl:when test="((contains($vURLOut/text(), 'RequestQueue=')))">
											<xsl:choose>
												<xsl:when test="((contains(substring-after($vURLOut/text(), 'RequestQueue='), '&amp;')))">
													<xsl:value-of select="substring-before(substring-after($vURLOut/text(), '://'), '/')"/>
												</xsl:when>
												<xsl:when test="((contains(substring-after($vURLOut/text(), 'RequestQueue='), ';')))">
													<xsl:value-of select="substring-before(substring-after($vURLOut/text(), '://'), '/')"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="substring-before(substring-after($vURLOut/text(), '://'), '/')"/>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="'UNKNOWN'"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="substring-before(substring-after($vURLOut/text(), '://'), '/')"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:when test="(($pType/text() = 'TargetQueue'))">
					<xsl:choose>
						<xsl:when test="((dp:responding()))">
							<xsl:choose>
								<xsl:when test="((starts-with($vURLIn/text(), 'dpmq')))">
									<xsl:choose>
										<xsl:when test="((contains($vURLIn/text(), 'ReplyQueue=')))">
											<xsl:choose>
												<xsl:when test="((contains(substring-after($vURLIn/text(), 'ReplyQueue='), '&amp;')))">
													<xsl:value-of select="substring-before(substring-after($vURLIn/text(), 'ReplyQueue='), '&amp;')"/>
												</xsl:when>
												<xsl:when test="((contains(substring-after($vURLIn/text(), 'ReplyQueue='), ';')))">
													<xsl:value-of select="substring-before(substring-after($vURLIn/text(), 'ReplyQueue='), ';')"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="substring-after($vURLIn/text(), 'ReplyQueue=')"/>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="'UNKNOWN'"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="substring-after(substring-after($vURLIn/text(), '://'), '/')"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:choose>
								<xsl:when test="((starts-with($vURLOut/text(), 'dpmq')))">
									<xsl:choose>
										<xsl:when test="((contains($vURLOut/text(), 'RequestQueue=')))">
											<xsl:choose>
												<xsl:when test="((contains(substring-after($vURLOut/text(), 'RequestQueue='), '&amp;')))">
													<xsl:value-of select="substring-before(substring-after($vURLOut/text(), 'RequestQueue='), '&amp;')"/>
												</xsl:when>
												<xsl:when test="((contains(substring-after($vURLOut/text(), 'RequestQueue='), ';')))">
													<xsl:value-of select="substring-before(substring-after($vURLOut/text(), 'RequestQueue='), ';')"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="substring-after($vURLOut/text(), 'RequestQueue=')"/>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="'UNKNOWN'"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="substring-after(substring-after($vURLOut/text(), '://'), '/')"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:when test="(($pType/text() = 'ReplyQM'))">
					<xsl:choose>
						<xsl:when test="((dp:responding()))">
							<xsl:choose>
								<xsl:when test="((starts-with($vURLIn/text(), 'dpmq')))">
									<xsl:choose>
										<xsl:when test="((contains($vURLIn/text(), 'ReplyQueue=')))">
											<xsl:choose>
												<xsl:when test="((contains(substring-after($vURLIn/text(), 'ReplyQueue='), '&amp;')))">
													<xsl:value-of select="substring-before(substring-after($vURLIn/text(), '://'), '/')"/>
												</xsl:when>
												<xsl:when test="((contains(substring-after($vURLIn/text(), 'ReplyQueue='), ';')))">
													<xsl:value-of select="substring-before(substring-after($vURLIn/text(), '://'), '/')"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="substring-before(substring-after($vURLIn/text(), '://'), '/')"/>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="'UNKNOWN'"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="substring-before(substring-after($vURLIn/text(), '://'), '/')"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:choose>
								<xsl:when test="((starts-with($vURLOut/text(), 'dpmq')))">
									<xsl:choose>
										<xsl:when test="((contains($vURLOut/text(), 'ReplyQueue=')))">
											<xsl:choose>
												<xsl:when test="((contains(substring-after($vURLOut/text(), 'ReplyQueue='), '&amp;')))">
													<xsl:value-of select="substring-before(substring-after($vURLOut/text(), '://'), '/')"/>
												</xsl:when>
												<xsl:when test="((contains(substring-after($vURLOut/text(), 'ReplyQueue='), ';')))">
													<xsl:value-of select="substring-before(substring-after($vURLOut/text(), '://'), '/')"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="substring-before(substring-after($vURLOut/text(), '://'), '/')"/>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="'UNKNOWN'"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="substring-before(substring-after($vURLOut/text(), '://'), '/')"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:when test="(($pType/text() = 'ReplyQueue'))">
					<xsl:choose>
						<xsl:when test="((dp:responding()))">
							<xsl:choose>
								<xsl:when test="((starts-with($vURLIn/text(), 'dpmq')))">
									<xsl:choose>
										<xsl:when test="((contains($vURLIn/text(), 'ReplyQueue=')))">
											<xsl:choose>
												<xsl:when test="((contains(substring-after($vURLIn/text(), 'ReplyQueue='), '&amp;')))">
													<xsl:value-of select="substring-before(substring-after($vURLIn/text(), 'ReplyQueue='), '&amp;')"/>
												</xsl:when>
												<xsl:when test="((contains(substring-after($vURLIn/text(), 'ReplyQueue='), ';')))">
													<xsl:value-of select="substring-before(substring-after($vURLIn/text(), 'ReplyQueue='), ';')"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="substring-after($vURLIn/text(), 'ReplyQueue=')"/>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="'UNKNOWN'"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="substring-after(substring-after($vURLIn/text(), '://'), '/')"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:choose>
								<xsl:when test="((starts-with($vURLOut/text(), 'dpmq')))">
									<xsl:choose>
										<xsl:when test="((contains($vURLOut/text(), 'ReplyQueue=')))">
											<xsl:choose>
												<xsl:when test="((contains(substring-after($vURLOut/text(), 'ReplyQueue='), '&amp;')))">
													<xsl:value-of select="substring-before(substring-after($vURLOut/text(), 'ReplyQueue='), '&amp;')"/>
												</xsl:when>
												<xsl:when test="((contains(substring-after($vURLOut/text(), 'ReplyQueue='), ';')))">
													<xsl:value-of select="substring-before(substring-after($vURLOut/text(), 'ReplyQueue='), ';')"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="substring-after($vURLOut/text(), 'ReplyQueue=')"/>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="'UNKNOWN'"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="substring-after(substring-after($vURLOut/text(), '://'), '/')"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'UNKNOWN'"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="vDebug">
			<xsl:message terminate="no" dp:type="all" dp:priority="debug">
				<xsl:value-of select="concat('METHOD=', 'RouteRead', ', ')"/>
				<xsl:value-of select="concat('TYPE=', $pType/text(), ': ')"/>
				<xsl:value-of select="$vResult/text()"/>
			</xsl:message>
		</xsl:variable>
		<xsl:value-of select="$vResult/text()"/>
	</xsl:template>
</xsl:stylesheet>
