/**说明：需要加载时初始化的js*/

/**菜单列表选中效果 --start--*/
$(function(){
	$(".nav-list").on("click","#nav_menu",function(){
		$(".nav-list").find(".active").each(function(){
			$(this).removeClass("active");
		});
		$(this).addClass("active");
		par = $(this).parent().parent();
			par.addClass("active");
		nav_breadcrumb(par.find("span").text(),$(this).text());
	});
	
	function nav_breadcrumb(p1,p2){
		var html = '<li><i class="ace-icon fa fa-home home-icon"></i> '+p1+' </li><li>'+p2+'</li>';
		$("#breadcrumbs > .breadcrumb").html(html);
	}
	
});
/**菜单列表选中效果 --end--*/

/**列表复选框效果 --start--*/
$(function(){
	/*
	var active_class = 'active';
	$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
		var th_checked = this.checked;//checkbox inside "TH" table header
		$(this).closest('table').find('tbody > tr').each(function(){
			var row = this;
			if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
			else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
		});
	});
	//select/deselect a row when the checkbox is checked/unchecked
	$('#simple-table').on('click', 'td input[type=checkbox]' , function(){
		var $row = $(this).closest('tr');
		if(this.checked) $row.addClass(active_class);
		else $row.removeClass(active_class);
	});
	var active_class = 'active';
	$(document).on('click','#simple-table > thead > tr > th input[type=checkbox]:eq(0)', function(){
		var th_checked = this.checked;//checkbox inside "TH" table header
		$(this).closest('table').find('tbody > tr').each(function(){
			var row = this;
			if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
			else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
		});
	});
	//select/deselect a row when the checkbox is checked/unchecked
	$(document).on('click', '#simple-table > tbody > tr > td input[type=checkbox]:eq(0)' , function(){
		var $row = $(this).closest('tr');
		if(this.checked) $row.addClass(active_class);
		else $row.removeClass(active_class);
	});*/
	
	var active_class = 'active';
	$(document).on('click','.checkboxThead',function(){
		var th_checked = this.checked;//checkbox inside "TH" table header
		$(this).closest('table').find('tbody > tr').each(function(){
			var row = this;
			if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
			else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
		});
	});
	//select/deselect a row when the checkbox is checked/unchecked
	$(document).on('click', '.checkboxTbody' , function(){
		var $row = $(this).closest('tr');
		if(this.checked) $row.addClass(active_class);
		else $row.removeClass(active_class);
	});
});
/**列表复选框效果 --end--*/


/**初始时间插件 --start--*/
$(function(){
	//datepicker();
});
function datepicker(param){
	$(".date-picker").datepicker({
	 	language: 'zh-CN',
	 	autoclose: true,
		todayHighlight: true,
		todayBtn: "linked",
		clearBtn: true,
		orientation: "top auto",
	});
}
/**初始时间插件 --end--*/


/**jquery 表单验证 --start--*/
$(function(){
	$("div[vl-data]").each(function(){
		vldataLoad(this);
	});
});

function vldataLoad(thisParam){
	var vldata = $(thisParam).attr("vl-data");
	if(vldata!=null && vldata!=""){
		vldata = eval("("+vldata+")");
		var targetObj = $("#"+vldata.id);
		for ( var vl in vldata) {
			if(vl!="id" && vl!="name"){
				//console.log(vl +" "+ vldata[vl]);
				targetObj.attr(vl,vldata[vl]);
			}
		}
	}
}
/**jquery 表单验证 --end--*/


/**时间插件中文 --start--*/
$.fn.datepicker.dates['zh-CN'] = {
		days: ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"],
		daysShort: ["周日", "周一", "周二", "周三", "周四", "周五", "周六"],
		daysMin:  ["日", "一", "二", "三", "四", "五", "六"],
		months: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
		monthsShort: ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"],
		today: "今日",
		clear: "清除",
		format: "yyyy年mm月dd日",
		titleFormat: "yyyy年mm月",
		weekStart: 1
	};
/**时间插件中文 --end-- */

/**表单验证插件中文 --start--*/
jQuery.extend(jQuery.validator.messages, {
	  required: "必选字段",
	  remote: "请修正该字段",
	  email: "请输入正确格式的电子邮件",
	  url: "请输入合法的网址",
	  date: "请输入合法的日期",
	  dateISO: "请输入合法的日期 (ISO).",
	  number: "请输入合法的数字",
	  digits: "只能输入整数",
	  creditcard: "请输入合法的信用卡号",
	  equalTo: "请再次输入相同的值",
	  accept: "请输入拥有合法后缀名的字符串",
	  maxlength: jQuery.validator.format("请输入一个 长度最多是 {0} 的字符串"),
	  minlength: jQuery.validator.format("请输入一个 长度最少是 {0} 的字符串"),
	  rangelength: jQuery.validator.format("请输入 一个长度介于 {0} 和 {1} 之间的字符串"),
	  range: jQuery.validator.format("请输入一个介于 {0} 和 {1} 之间的值"),
	  max: jQuery.validator.format("请输入一个最大为{0} 的值"),
	  min: jQuery.validator.format("请输入一个最小为{0} 的值")
});
/**表单验证插件中文 --end--*/

