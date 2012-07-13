<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:fn="http://www.w3.org/2005/xpath-functions">
	<xsl:output method="html" indent="yes"
		doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" />

	<xsl:template match="/">
	<xsl:param name="curDateTime" select="current-dateTime()"/>
		<html>
		<head>
			<meta name="Keywords" content="jQuery中文API手册,jQuery速查手册,jQuery最新版CHM下载,jQuery最新中文版,jQuery最新中文参考手册" />
			<meta name="Description" content="jQuery 1.7.2 CHM下载,jQuery中文参考手册,jQuery中文版1.7.2参考手册,jQuery 1.7.2 速查表,jQuery中文参考手册" />
			<title>jQuery <xsl:value-of select="replace(/api/categories/category[@name='Version']/category[last()]/@name,'Version ','')"/> 中文文档 </title>
			<link rel="stylesheet" href="style.css"/>
		</head>
		<body id="api">
			<div id="header">
				<div class="headerMain"><h1>jQuery <xsl:value-of select="replace(/api/categories/category[@name='Version']/category[last()]/@name,'Version ','')"/> 中文文档 Translated by <a href="http://www.ho1ho.com/" target="_blank">Michael Leo</a>, Thanks <a href="http://www.cn-cuckoo.com/" target="_blank">为之漫笔</a> for original version. Welcome to visit jQuery Cheatsheet from <a href="http://oscarotero.com/jquery/" target="_blank">Oscar Otero</a>.</h1></div>
				<div class="headerMain">Last update: <xsl:value-of select="year-from-dateTime($curDateTime)"/>-<xsl:number value="month-from-dateTime($curDateTime)" format="01"/>-<xsl:number value="day-from-dateTime($curDateTime)" format="01"/><span id="current_time"><xsl:number value="hours-from-dateTime($curDateTime)" format="01"/>:<xsl:number value="minutes-from-dateTime($curDateTime)" format="01"/>:<xsl:number value="seconds-from-dateTime($curDateTime)" format="01"/></span> (Chinese Standard Time)</div>
			</div>
			<div id="wrapper">
				<div id="sidebar" style="display:none">
					<xsl:for-each select="/api/categories/category">
						<h2><xsl:value-of select="document('jQueryAPI.zh_CN.xml')/api/categories//category[@name=current()/@name]/@zh"/></h2>
						<div style="background: white;">
							<xsl:choose>
								<xsl:when test="category">
									<xsl:for-each select="category">
										<xsl:if test="//entry/category[@name=current()/@name]">
											<b><xsl:value-of select="document('jQueryAPI.zh_CN.xml')/api/categories//category[@name=current()/@name]/@zh"/></b>
											<ul>
												<xsl:for-each select="//entry/category[@name=current()/@name]/..">
													<xsl:sort select="@name"/>
													<xsl:if test="not(following::entry[1]/@name=@name)">
														<li><a>
															<xsl:choose>
																<xsl:when test="@filename!=''">
																	<xsl:attribute name="href"><xsl:value-of select="@filename"/>.htm</xsl:attribute>
																	<xsl:value-of select="@name"/>
																</xsl:when>
																<xsl:when test="@type='selector'">
																	<xsl:attribute name="href"><xsl:value-of select="replace(@name,' ','-')"/>-selector.htm</xsl:attribute>
																	<xsl:value-of select="sample"/>
																</xsl:when>
																<xsl:when test="@type='property' and @name='jquery'">
																	<xsl:attribute name="href"><xsl:value-of select="@name"/>-2.htm</xsl:attribute>
																	<xsl:value-of select="@name"/>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:attribute name="href"><xsl:value-of select="@name"/>.htm</xsl:attribute>
																	<xsl:value-of select="@name"/><xsl:if test="@type='method'">()</xsl:if>
																</xsl:otherwise>
															</xsl:choose>
														</a></li>
													</xsl:if>
												</xsl:for-each>
											</ul>
										</xsl:if>
									</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
									<ul>
									<xsl:for-each select="//entry/category[@name=current()/@name]/..">
										<xsl:sort select="@name"/>
										<xsl:if test="not(following::entry[1]/@name=@name)">
											<li><a>
												<xsl:choose>
													<xsl:when test="@filename!=''">
														<xsl:attribute name="href"><xsl:value-of select="@filename"/>.htm</xsl:attribute>
														<xsl:value-of select="@name"/>
													</xsl:when>
													<xsl:when test="@type='property' and @name='jquery'">
														<xsl:attribute name="href"><xsl:value-of select="@name"/>-2.htm</xsl:attribute>
														<xsl:value-of select="@name"/>
													</xsl:when>
													<xsl:otherwise>
														<xsl:attribute name="href"><xsl:value-of select="@name"/>.htm</xsl:attribute>
														<xsl:value-of select="@name"/><xsl:if test="@type='method'">()</xsl:if>
													</xsl:otherwise>
												</xsl:choose>
											</a></li>
										</xsl:if>
									</xsl:for-each>
									</ul>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</xsl:for-each>
				</div>
				<div id="sidebar_more">M<br/>E<br/>N<br/>U</div>
				<div id="content">
					<xsl:for-each-group select="/api/entries/entry" group-by="@type">
						<xsl:for-each-group select="current-group()" group-by="@name">
							<xsl:for-each-group select="current-group()" group-by="@filename">
								<xsl:sort select="@name"/>
								<xsl:choose>
									<xsl:when test="@filename!=''">
										<xsl:result-document href="./dist/{@filename}.htm">
											<xsl:apply-templates select="current-group()"/>
										</xsl:result-document>
									</xsl:when>
									<xsl:when test="@type='selector'">
										<xsl:result-document href="./dist/{replace(@name,' ','-')}-selector.htm">
											<xsl:apply-templates select="current-group()"/>
										</xsl:result-document>
									</xsl:when>
									<xsl:when test="@type='property' and @name='jquery'">
										<xsl:result-document href="./dist/{@name}-2.htm">
											<xsl:apply-templates select="current-group()"/>
										</xsl:result-document>
									</xsl:when>
									<xsl:otherwise>
										<xsl:result-document href="./dist/{@name}.htm">
											<xsl:apply-templates select="current-group()"/>
										</xsl:result-document>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each-group>
						</xsl:for-each-group>
					</xsl:for-each-group>
				</div>
			</div>
			<script src="jquery.min.js"></script>
			<script src="jquery.ba-hashchange.min.js"></script>
			<script><![CDATA[
				var global_top = 0;
				var header_height = $('#header').height();
				$(window).hashchange(function(){
					var page=window.location.hash.replace("#","")||"cheatsheet";
					global_top = $(document).scrollTop();
					if (global_top > header_height) {
						global_top -= header_height;
					}
					$("#content").empty().css("top",global_top)
						.load(page+".htm?"+(new Date/86400000).toFixed(0),function(){
						$("iframe").each(function(){
							 var doc = this.contentDocument ||
									(iframe.contentWindow && iframe.contentWindow.document) ||
									iframe.document ||
									null;
							if(doc == null) return true;
							doc.open();
							doc.write($(this).prev().prev().find("code").text());
							doc.close();
						});
					});
				}).hashchange().scroll(function () {
					if ($(window).scrollTop() < global_top){
						if ($(window).scrollTop() > header_height) {
							$("#content").css("top", $(window).scrollTop() - header_height);
						} else {
							$("#content").css("top", $(window).scrollTop());
						}
					}
				});

				function sidebar_more_blink() {
					$("#sidebar_more").animate({
							opacity: 'toggle'
						}, "normal", function(){
							sidebar_more_blink();
						});
				}
				sidebar_more_blink();
				
				$("#sidebar_more").mouseenter(
					function () {
						$("#sidebar_more").stop();
						$(this).hide();
						$("#sidebar").animate({
							width: 'toggle',
							opacity: 1
						}, "fast");
						
						$("#content").animate({
							marginLeft: '210px'
						}, "fast");
					}
				);
				
				$("#sidebar").mouseleave(
					function () {
						$(this).animate({
							width: 'toggle',
							opacity: 0
						}, "fast", function(){
							$("#sidebar_more").show();
							sidebar_more_blink();
						});
						
						$("#content").animate({
							marginLeft: '20px'
						}, "fast");
					}
				);
				
				$("#sidebar h2").click(function(){
					$(this).next("div").animate({
						height: ['toggle', 'swing']
					}, 'fast').siblings("div").slideUp('fast');
				});
				$("#wrapper").click(function(e){
					if($(e.target).is("a[href$='.htm']")){
						window.location.hash=$(e.target).attr("href").replace(".htm","");
						return false;
					}
				});
			]]></script>
			<script type="text/javascript"><![CDATA[
				var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
				document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
			]]></script>
			<script type="text/javascript"><![CDATA[
				try {
					var pageTracker = _gat._getTracker("UA-28887890-1");
					pageTracker._trackPageview();
				} catch(err) {}
			]]></script>
		</body>
		</html>
	</xsl:template>

	<xsl:template match="/api/entries/entry">
		<xsl:variable name="zh-entrys" select="document('jQueryAPI.zh_CN.xml')//entry[@name=current()/@name]"/>
		<xsl:variable name="pos" select="position()"/>
		<xsl:variable name="zh-entry" select="$zh-entrys[$pos]"/>
		<div id='go_home' style="cursor: pointer;" onclick="location.href='index.html'"></div>
		<div class="entry">
			<h2>
				<xsl:if test="@return!=''">
					<span>返回值:<xsl:value-of select="@return"/></span>
				</xsl:if>
				<xsl:if test="@type='method'">
						<xsl:value-of select="@name"/>(<xsl:for-each select="signature[1]/argument">
							<xsl:choose>
								<xsl:when test="@optional">
									<em class="optional">[<xsl:value-of select="@name"/>]</em>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="@name"/>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:if test="position() != last()">, </xsl:if>
						</xsl:for-each>)<br/>
				</xsl:if>
				<xsl:if test="@type='selector'">
					<xsl:value-of select="sample"/>
				</xsl:if>
				<xsl:if test="@type='property'">
					<xsl:value-of select="@name"/>
				</xsl:if>
			</h2>
			<div class="desc">
				<p><xsl:copy-of select="$zh-entry/desc/node()"/></p>
				<ul class="signatures">
					<xsl:for-each select="signature">
						<xsl:variable name="sigpos" select="position()"/>
						<xsl:variable name="zh-signature" select="$zh-entry/signature[$sigpos]"/>
						<li>
						<h4>
							<span><xsl:value-of select="added"/> 新增</span>
							<xsl:choose>
								<xsl:when test="../@type='selector'">
									<xsl:value-of select="../sample"/>
								</xsl:when>
								<xsl:when test="../@type='property'">
									<xsl:value-of select="../@name"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="../@name"/>(<xsl:for-each select="argument">
										<xsl:choose>
											<xsl:when test="@optional">
												<em class="optional">[<xsl:value-of select="@name"/>]</em>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="@name"/>
											</xsl:otherwise>
										</xsl:choose>
										<xsl:if test="position() != last()">, </xsl:if>
									</xsl:for-each>)
								</xsl:otherwise>
							</xsl:choose>
						</h4>
						<xsl:for-each select="argument">
							<div class="arguement">
								<strong><xsl:value-of select="@name"/></strong>
								(<xsl:value-of select="@type"/>)
								<xsl:if test="@optional"> 可选参数，</xsl:if>
								<xsl:if test="@default">默认值:'<xsl:value-of select="@default"/>'</xsl:if>
								<xsl:variable name="argpos" select="position()"/>
								<xsl:copy-of select="$zh-signature/argument[$argpos]/desc/node()"/>
							</div>
							<xsl:if test="option">
							<div class="options">
								<xsl:for-each select="option">
									<xsl:variable name="argpos" select="position()"/>
									<h5 class="option">
										<xsl:value-of select="@name"/>
										<xsl:if test="@added"><span class="h5_added"> (<xsl:value-of select="@added"/> 新增)</span></xsl:if>
										<span><xsl:value-of select="@type"/></span>
									</h5>
									<xsl:if test="@default">
									<div>
										<strong class="default-value">默认值: </strong><xsl:value-of select="@default"/>
									</div>
									</xsl:if>
									<p class="options_p">
										<xsl:copy-of select="$zh-signature/argument/option[$argpos]/desc/node()"/>
									</p>
								</xsl:for-each>
							</div>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="option">
							<div class="option">
								<strong><xsl:value-of select="@name"/></strong>
								<span class="type"><a><xsl:value-of select="@type"/></a></span>
								<xsl:if test="@default"><span class="default">默认值:'<xsl:value-of select="@default"/>'</span></xsl:if>
								<div>
									<xsl:if test="@optional"> 可选参数，</xsl:if>
									<xsl:variable name="argpos" select="position()"/>
									<xsl:copy-of select="$zh-signature/option[$argpos]/desc/node()"/>
								</div>
							</div>
						</xsl:for-each>
						</li>
					</xsl:for-each>
				</ul>
				<div class="longdesc">
					<xsl:copy-of select="$zh-entry/longdesc/node()"/>
				</div>
				<xsl:if test="$zh-entry/note">
					<h3 id="notes-0">补充说明:</h3>
					<div class="longdesc">
						<ul>
						<xsl:for-each select="$zh-entry/note">
							<li>
								<xsl:variable name="argpos" select="position()"/>
								<xsl:copy-of select="$zh-entry/note[@type=current()/@type][$argpos]/node()"/>
							</li>
						</xsl:for-each>
						</ul>
					</div>
				</xsl:if>
			</div>
			<xsl:if test="example">
				<div class="example">
					<xsl:call-template name="showexample">
						<xsl:with-param name="zh-entry" select="$zh-entry"/>
						<xsl:with-param name="example" select="example"/>
					</xsl:call-template>
				</div>
			</xsl:if>
		</div>
	</xsl:template>

	<xsl:template name="showexample">
		<xsl:param name="zh-entry"/>
		<xsl:param name="example"/>
		<xsl:for-each select="$example">
			<xsl:variable name="pos" select="position()"/>
			<xsl:if test="desc">
				<h3>示例:</h3>
				<p><xsl:value-of select="$zh-entry/example[$pos]/desc"/></p>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="html[1] and code[1]">
				<pre><code>&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;<xsl:if test="css">
&lt;style&gt;<xsl:value-of select="css"/>&lt;/style&gt;</xsl:if>
&lt;script src="jquery.min.js"&gt;&lt;/script&gt;
&lt;/head&gt;
&lt;body&gt;

<xsl:value-of select="html"/>

&lt;script&gt;

<xsl:value-of select="code"/>

&lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;</code></pre>
<h4>演示:</h4>
<iframe src="blank.html" width="708" height="125">
	<xsl:if test="height">
		<xsl:attribute name="height">
			<xsl:value-of select="height"/>
		</xsl:attribute>
	</xsl:if>
</iframe>
				</xsl:when>
				<xsl:otherwise>
					<xsl:if test="css">
						<h5>CSS 代码:</h5>
						<pre><code><xsl:value-of select="css"/></code></pre>
					</xsl:if>
					<xsl:if test="html">
						<h5>HTML 代码:</h5>
						<pre><code><xsl:value-of select="html"/></code></pre>
					</xsl:if>
					<xsl:if test="code">
						<h5>jQuery 代码:</h5>
						<pre><code><xsl:value-of select="code"/></code></pre>
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="results">
				<h5>结果:</h5>
				<pre><code><xsl:value-of select="results"/></code></pre>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>

</xsl:stylesheet>