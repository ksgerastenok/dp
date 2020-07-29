<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:dp="http://www.datapower.com/extensions"
	xmlns:gw="http://sberbank.ru/sbt/functions"
	exclude-result-prefixes="dp gw"
	extension-element-prefixes="dp gw">
	<dp:input-mapping href="local:///ffd/base-64.ffd" type="ffd"/>
	<!--dp:output-mapping href="local:///ffd/base-64.ffd" type="ffd"/-->
        <xsl:import href="local:///functions.xsl"/>
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" dp:escaping="minimum"/>

	<xsl:template match="/">
		<xsl:variable name="vNode">
			<xsl:copy-of select="."/>
		</xsl:variable>
		<xsl:variable name="vHeaders">
			<xsl:copy-of select="dp:variable('var://service/header-manifest')"/>
		</xsl:variable>
		<xsl:variable name="vResult">
			<xsl:element name="Envelope">
				<xsl:element name="Header">
					<xsl:for-each select="$vHeaders/headers/header">
						<xsl:call-template name="gw:HeaderRead">
							<xsl:with-param name="pHeader">
								<xsl:element name="header">
									<xsl:attribute name="name">
										<xsl:value-of select="./text()"/>
									</xsl:attribute>
								</xsl:element>
							</xsl:with-param>
							<xsl:with-param name="pType">
								<xsl:value-of select="'current'"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:element>
				<xsl:element name="Body">
					<xsl:value-of select="$vNode/object/message/text()"/>
				</xsl:element>
			</xsl:element>
		</xsl:variable>
		<xsl:copy-of select="$vResult/*"/>
	</xsl:template>
</xsl:stylesheet>
