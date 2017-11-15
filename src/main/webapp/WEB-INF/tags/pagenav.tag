<%@ tag language="java" pageEncoding="UTF-8"%>
<!-- #section:basics/content.breadcrumbs -->
<div class="breadcrumbs" id="breadcrumbs">
</div>

<script type="text/javascript">
	try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
</script>

<script type="text/javascript">
	var href = location.href;
	var menuHref = href.substring(href.indexOf(webRoot)).replace(webRoot,'');
	var domain = "";
	menuHref = menuHref.substring(menuHref.indexOf(domain)).replace(domain,''); 
	$.post("${webRoot}/sys/tag/menuNav.do", {requestUrl:menuHref},function(data){
		$("#breadcrumbs").html(data.desc);
// 		$("#breadcrumbs").append("<a style=\"float: right;\" target=\"_blan\" href=\"http://wpa.qq.com/msgrd?v=3&uin=3500809597&site=qq&menu=yes\"><img border=\"0\" src=\"http://wpa.qq.com/pa?p=2:3500809597:42\" alt=\"在线客服\" title=\"在线客服\"></a>");
	}).error(function(data) {});
</script>