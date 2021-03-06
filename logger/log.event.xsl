<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:dp="http://www.datapower.com/extensions"
	xmlns:gw="http://sberbank.ru/sbt/functions"
	exclude-result-prefixes="dp gw"
	extension-element-prefixes="dp gw">
	<dp:input-mapping href="local:///ffd/base-16.ffd" type="ffd"/>
	<!--dp:output-mapping href="local:///ffd/base-16.ffd" type="ffd"/-->
        <xsl:import href="local:///gwfunctions.xsl"/>
	<xsl:template match="/">
		<xsl:variable name="vNode">
			<xsl:copy-of select="."/>
		</xsl:variable>
		<xsl:variable name="vHeader">
			<xsl:call-template name="gw:HeaderRead">
				<xsl:with-param name="pHeader">
					<header name="{'MQMP'}"/>
				</xsl:with-param>
				<xsl:with-param name="pType">
					<xsl:value-of select="'current'"/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="vResult">
			<dp:sql-execute source="'LOGDB'" statement="'begin esblog.write_partition_event_log(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?); end;'">
				<arguments>
					<argument type="SQL_LONGVARBINARY" mode="INPUT">
						<xsl:value-of select="$vNode/object/message/text()"/>
					</argument>
					<argument type="SQL_VARCHAR" mode="INPUT">
						<xsl:value-of select="$vHeader/header/MQMP/Property[((@name = 'Date'))]/text()"/>
					</argument>
					<argument type="SQL_VARCHAR" mode="INPUT">
						<xsl:value-of select="$vHeader/header/MQMP/Property[((@name = 'RqUID'))]/text()"/>
					</argument>
					<argument type="SQL_VARCHAR" mode="INPUT">
						<xsl:value-of select="$vHeader/header/MQMP/Property[((@name = 'Operation'))]/text()"/>
					</argument>
					<argument type="SQL_VARCHAR" mode="INPUT">
						<xsl:value-of select="$vHeader/header/MQMP/Property[((@name = 'OperationName'))]/text()"/>
					</argument>
					<argument type="SQL_VARCHAR" mode="INPUT">
						<xsl:value-of select="$vHeader/header/MQMP/Property[((@name = 'ProcStatus'))]/text()"/>
					</argument>
					<argument type="SQL_VARCHAR" mode="INPUT">
						<xsl:value-of select="$vHeader/header/MQMP/Property[((@name = 'ErrorText'))]/text()"/>
					</argument>
					<argument type="SQL_VARCHAR" mode="INPUT">
						<xsl:value-of select="$vHeader/header/MQMP/Property[((@name = 'EventSource'))]/text()"/>
					</argument>
					<argument type="SQL_VARCHAR" mode="INPUT">
						<xsl:value-of select="$vHeader/header/MQMP/Property[((@name = 'EventReceiver'))]/text()"/>
					</argument>
					<argument type="SQL_VARCHAR" mode="INPUT">
						<xsl:value-of select="$vHeader/header/MQMP/Property[((@name = 'SourceQM'))]/text()"/>
					</argument>
					<argument type="SQL_VARCHAR" mode="INPUT">
						<xsl:value-of select="$vHeader/header/MQMP/Property[((@name = 'SourceQueue'))]/text()"/>
					</argument>
					<argument type="SQL_VARCHAR" mode="INPUT">
						<xsl:value-of select="$vHeader/header/MQMP/Property[((@name = 'TargetQM'))]/text()"/>
					</argument>
					<argument type="SQL_VARCHAR" mode="INPUT">
						<xsl:value-of select="$vHeader/header/MQMP/Property[((@name = 'TargetQueue'))]/text()"/>
					</argument>
					<argument type="SQL_VARCHAR" mode="INPUT">
						<xsl:value-of select="$vHeader/header/MQMP/Property[((@name = 'ReplyQM'))]/text()"/>
					</argument>
					<argument type="SQL_VARCHAR" mode="INPUT">
						<xsl:value-of select="$vHeader/header/MQMP/Property[((@name = 'ReplyQueue'))]/text()"/>
					</argument>
				</arguments>
			</dp:sql-execute>
		</xsl:variable>
		<xsl:variable name="vDebug">
			<xsl:if test="((not(string-length($vResult/sql/message/text()) = 0)))">
				<dp:reject>
					<xsl:value-of select="$vResult/sql/message/text()"/>
				</dp:reject>
			</xsl:if>
		</xsl:variable>
		<xsl:copy-of select="$vResult/*"/>
	</xsl:template>
</xsl:stylesheet>
