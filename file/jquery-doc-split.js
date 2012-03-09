/*
 * jQuery 中文参考文档 分散版脚本
 *
 * Copyright (c) 2008 Shawphy (shawphy.com)
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 *
 * $Id: jquery-doc-split.js 191 2009-01-29 14:01:51Z Shawphy $
 * 
 */

jQuery(function($) {
		$('.longdesc,.desc:not(:has(.longdesc))').each(function(){
			$(this).html("<p>"
				+ ($(this).children("pre").html()||"")
					.replace(/\n\s*\n/g,"</p><p>")
					.replace(/&lt;/g,"<")
					.replace(/&gt;/g,">")
					.replace(/&amp;/g,"&")
					.replace(/'''(.*?)'''/g,"<strong>$1</strong>")
				+"</p>");
		});
});