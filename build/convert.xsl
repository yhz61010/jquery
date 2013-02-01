<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="yes" />

	<xsl:template match="/">
		<xsl:result-document href="../jQueryAPI.zh_CN.xml">
			<api>
				<xsl:copy-of select="document('category.zh_CN.xml')/api/categories"/>
				<!-- If you want to create category through xslt, please uncomment the souces below. -->
				<!--
				<categories>
					<xsl:for-each select="/api/categories/category">
						<category name="{@name}" slug="{@slug}">
							<desc><xsl:copy-of select="desc/node()" /></desc>
							<xsl:if test="category">
								<xsl:for-each select="current()/category">
									<category name="{@name}" slug="{@slug}">
										<desc><xsl:copy-of select="desc/node()" /></desc>
									</category>
								</xsl:for-each>
							</xsl:if>
						</category>
					</xsl:for-each>
				</categories>
				-->
				<!-- <xsl:variable name="zh-entrys" select="document('jqueryapi.xml')//subcat/*"/> -->
				<entries>
					<xsl:for-each select="/api/entries/entry">
						<entry type="{@type}" name="{@name}" return="{@return}">
							<xsl:if test="@deprecated">
								<xsl:attribute name="deprecated">
									<xsl:value-of select="@deprecated" />
								</xsl:attribute>
							</xsl:if>
							<xsl:if test="@removed">
								<xsl:attribute name="removed">
									<xsl:value-of select="@removed" />
								</xsl:attribute>
							</xsl:if>
							<title><xsl:copy-of select="title/node()"/></title>
							<desc>
								<!-- <xsl:value-of select="$zh-entrys[@type=current()/@type][@name=current()/@name]/desc"/> -->
								<xsl:copy-of select="desc/node()"/>
							</desc>
							<xsl:for-each select="signature">
								<signature>
									<added>
										<xsl:copy-of select="added/node()"/>
									</added>
									<xsl:for-each select="argument">
										<argument name="{@name}">
											<xsl:if test="@type">
												<xsl:attribute name="type">
													<xsl:value-of select="@type" />
												</xsl:attribute>
											</xsl:if>
											<xsl:if test="@optional">
												<xsl:attribute name="optional">
													<xsl:value-of select="@optional" />
												</xsl:attribute>
											</xsl:if>
											<xsl:if test="@default">
												<xsl:attribute name="default">
													<xsl:value-of select="@default" />
												</xsl:attribute>
											</xsl:if>
											<desc><xsl:copy-of select="desc/node()"/></desc>
											<xsl:for-each select="property">
												<property name="{@name}">
													<xsl:if test="@type">
														<xsl:attribute name="type">
															<xsl:value-of select="@type" />
														</xsl:attribute>
													</xsl:if>
													<xsl:if test="@default">
														<xsl:attribute name="default">
															<xsl:value-of select="@default" />
														</xsl:attribute>
													</xsl:if>
													<xsl:if test="@added">
														<xsl:attribute name="added">
															<xsl:value-of select="@added" />
														</xsl:attribute>
													</xsl:if>
													<desc><xsl:copy-of select="desc/node()"/></desc>
												</property>
											</xsl:for-each>
										</argument>
									</xsl:for-each>
								</signature>
							</xsl:for-each>
							<longdesc>
								<!-- <xsl:copy-of select="$zh-entrys[@type=current()/@type][@name=current()/@name]/longdesc/node()"/> -->
								<xsl:copy-of select="longdesc/node()"/>
							</longdesc>
							<xsl:for-each select="example">
								<example>
									<xsl:if test="desc/node()">
									<desc><xsl:copy-of select="desc/node()"/></desc>
									</xsl:if>
									<xsl:if test="code/node()">
									<code><xsl:copy-of select="code/node()"/></code>
									</xsl:if>
									<xsl:if test="css/node()">
									<css><xsl:copy-of select="css/node()"/></css>
									</xsl:if>
									<xsl:if test="html/node()">
									<html><xsl:copy-of select="html/node()"/></html>
									</xsl:if>
									<xsl:if test="results/node()">
									<results><xsl:copy-of select="results/node()"/></results>
									</xsl:if>
								</example>
							</xsl:for-each>
							<xsl:for-each select="category">
								<category slug="{@slug}">
									<xsl:copy-of select="node()"/>
								</category>
							</xsl:for-each>
							<xsl:for-each select="note">
								<note>
									<xsl:copy-of select="node()"/>
								</note>
							</xsl:for-each>
						</entry>
					</xsl:for-each>
				</entries>
			</api>
		</xsl:result-document>
	</xsl:template>

</xsl:stylesheet>
