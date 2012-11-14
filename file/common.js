$(function(){

	var AUTO_FLUSH = true;

	if (AUTO_FLUSH){
		var currentUpdateDateTime = $("#current_date").text() + " " +$("#current_time").text();
		var lastUpdateDateTime = $.jStorage.get("update_date_time");
		
		if (lastUpdateDateTime === currentUpdateDateTime){
			$.jStorage.set("isFlushed", true);
		} else {
			$.jStorage.set("isFlushed", false);
			$.jStorage.set("update_date_time", currentUpdateDateTime);
		}
	}

	if (!$.jStorage.get("isFlushed")){
		$.jStorage.set("isFlushed", true);

		var $dialog_div = '' + 
			'<div id="dialog-message" title="Clear page cache 清理页面缓存">' + 
				'<p>' + 
					'<span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 50px 0;"></span>' + 
					'Release update! 更新提示！' + 
				'</p>' + 
				'<p>' + 
					'<strong>CHANGE LOG</strong>' + 
				'</p>' + 
				'<p>' + 
					'<ol>' + 
						'<li style="list-style-type:decimal">Update to 1.8.3.</li>' + 
						'<li style="list-style-type:decimal">Fix translation in jQuery.merge.</li>' + 
						'<li style="list-style-type:decimal">Fix typo in jQuery.parseXML.</li>' + 
						'<li style="list-style-type:decimal">Add missed translation in jQuery.support.</li>' + 
					'</ol>' + 
				'</p>' + 
				'<p>' + 
					'Please clear your browser cache or refresh page, otherwise page may be not displayed correctly.' + 
				'</p>' + 
				'<p>' + 
					'为了保证页面显示的正确性，请清理浏览器缓存或重新刷新页面。' + 
				'</p>' + 
			'</div>';
		$('body').append($dialog_div);

		$( "#dialog:ui-dialog" ).dialog("destroy");
		$( "#dialog-message" ).dialog({
			modal: true,
			show: "slide",
			hide: "drop",
			close: function(event, ui) {
				$(this).dialog("destroy").remove();
			}
		});
	}
});