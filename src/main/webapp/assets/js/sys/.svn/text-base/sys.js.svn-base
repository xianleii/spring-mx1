/** 说明：系统自定义 或重写插件js */
var SYS = new Function();

/** 布局js start */
// 自定义 显示收缩 菜单栏
$(function() {
	$(".menu-open-close").click(function() {
		var sidebar = $(".sidebar");
		if (-1 == sidebar.attr("class").indexOf("menu-min")) {
			$(".sidebar").addClass("menu-min");
		} else {
			$(".sidebar").removeClass("menu-min");
		}
	});
});
/** 布局js end */

/** pagination 分页条js -----start----- */
$(function() {
	// 首页
	$(document).on("click", ".mouse_allowed.first_page", function() {
		var page_num = 1;
		var page_show_num = $("#page_show_num").val();
		var params = {
			currentPage : page_num,
			pageSize : page_show_num
		};
		zhph_pagination(params);
	});
	// 上页
	$(document).on("click", ".mouse_allowed.up_page", function() {
		var page_num = $("#page_now_num").html();
		page_num = (page_num * 1) - 1;
		var page_show_num = $("#page_show_num").val();
		var params = {
			currentPage : page_num,
			pageSize : page_show_num
		};
		zhph_pagination(params);
	});
	// 下页
	$(document).on("click", ".mouse_allowed.down_page", function() {
		var page_num = $("#page_now_num").html();
		page_num = (page_num * 1) + 1;
		var page_show_num = $("#page_show_num").val();
		var params = {
			currentPage : page_num,
			pageSize : page_show_num
		};
		zhph_pagination(params);
	});
	// 尾页
	$(document).on("click", ".mouse_allowed.last_page", function() {
		var page_num = $("#page_count_num").html();
		var page_show_num = $("#page_show_num").val();
		var params = {
			currentPage : page_num,
			pageSize : page_show_num
		};
		zhph_pagination(params);
	});
	// 显示条数
	$(document).on("change", "#page_show_num", function() {
		var page_num = 1;
		var page_show_num = $("#page_show_num").val();
		var params = {
			currentPage : page_num,
			pageSize : page_show_num
		};
		zhph_pagination(params);
	});
	// 指定页跳转
	$(document).on("click", "#page_toTZ", function() {
		var page_num = $("#toGoPage").val();
		page_num = page_num * 1;
		var page_show_num = $("#page_show_num").val();
		var params = {
			currentPage : page_num,
			pageSize : page_show_num
		};
		zhph_pagination(params);
	});
});

function zhph_pagination(params) {
	$("#currentPage").val(params.currentPage);
	$("#pageSize").val(params.pageSize);
	var params = JSON.stringify(params);
	var fun = $(".zhph_pagination").attr("fun");
	eval(fun + "(" + eval("'" + params + "'") + ")");
}

function page(params) {

}
/** pagination 分页条js -----end----- */

/** ajax联动js ----start---- */
function LinkageRegion(type, obj, endid) {
	SYS.ajax({
		async : true,
		type : "post",
		url : "/linkage/region.do",
		dataType : "html",
		data : {
			"type" : type,
			"value" : obj.value
		},
		success : function(html) {
			if (html.length > 2) {
				$("#" + endid).html(html);
			} else {
				$("#" + endid).html(html);
			}
		}
	});
}
 function  divForSelect(divselectid,inputselectid) {
    var inputselect = $(inputselectid);
    $(divselectid+" input").keyup(function(){
        var ul = $(divselectid+" ul");
        if(ul.css("display")=="none"){
            ul.slideDown("fast");
        }else{
            ul.slideUp("fast");
        }
    });
    $(divselectid+" ul li a").click(function(){
        var txt = $(this).text();
        $(divselectid+" input").html(txt);
        var value = $(this).attr("selectid");
        inputselect.val(value);
        $(divselectid+" ul").hide();
    });
};

function dateCompare(strDate,endDate){
	var start=new Date(strDate.replace("-", "/").replace("-", "/"));
	var end=new Date(endDate.replace("-", "/").replace("-", "/"));
	if(start>end){
		return false;
	}else{
		return true;
	}
}



/** ajax联动js ----end---- */

/** 重写dialog---start--- */
// {message:"消息",buttonName:"按钮名称",callback:"回调函数"}
SYS.prototype.alert = function(message,callback) {
	var buttonName = "确定";
	bootbox.alert({
		buttons : {
			ok : {
				label : buttonName,
				className : 'btn-sm btn-myStyle'
			}
		},
		className : 'gritter-center',
		message : message,
		callback : function() {
			if(callback!=null){
				eval(callback+"()");
			}
		},
		title : "",
	});
};
 
// dialog
// 参数说明 json =
// {message:"XXX",title:"123",cancelname:"",okname:"",cancel:null,ok:null} //
// message=消息，title=标题，cancelname=按钮名称， cancel=取消回调函数，okname=按钮名称, ok=确定回调函数,
SYS.prototype.dialog = function(param) {
	var json = param;
	var message = json.message;
	var title = "";
	var cancelname = "取消";
	var okname = "确定";
	if (json.title != null) {
		json.title;
	}
	if (json.okname != null) {
		okname = json.okname;
	}
	if (json.cancelname != null) {
		cancelname = json.cancelname;
	}

	var okFun = json.ok;
	bootbox.dialog({
		message : message,
		title : title,
		className : 'gritter-center',
		buttons : {
			Cancel : {
				label : cancelname,
				className : "btn-sm btn-default",
				callback : function() {
					if (json.cancel != null) {
						json.cancel();
					}
				}
			},
			OK : {
				label : okname,
				className : "btn-sm btn-primary",
				callback : function() {
					if (json.ok != null) {
						json.ok();
					}
				}
			}
		}
	});
};

// 填充框架页面内容区
SYS.prototype.pageContent = function(html) {
	$(".page-content").html(html);
};
$(function() {
	// 示例
	// SYS.dialog({message:"XXXXXXXXXX",title:"123",cancel:null,ok:null});
	// SYS.alert({message:"XXXXXXXXXX"});
});
/** 重写dialog---end--- */

/** 页面ajax --start-- */
SYS.prototype.queryPageContent = function(url) {
	SYS.ajax({
		url : url,
		type : "POST",
		data : {
			id : "id"
		},
		dataType : "html",
		success : function(html) {
			SYS.pageContent(html);
		}
	});
};

SYS.prototype.ajax = function(param) {
	$("#main-mask-id").show();
	var json = param;
	if (json.url != null) {
		json.url = ctx + json.url;
	}
	json.async = false;
	json.error = function(XMLHttpRequest, textStatus, errorThrown){
		var errorURL = "";
		if(XMLHttpRequest.status == 404){
			errorURL = "/404.jsp";
		}else if(XMLHttpRequest.status == 500){
			errorURL = "/500.jsp";
		}
		if(errorURL!=""){
			SYS.ajax({
				async : false, url : errorURL, type : "get", dataType : "html",
				success : function(html) {
					SYS.pageContent(html);
				}
			});
		}
	};
	json.dataFilter = function(data){
		if(data.indexOf("login()")!=-1){
			window.document.location = ctx + "/login.do" ;
			return null;
		}
		return data;
	};
	$.ajax(json);
	$("#main-mask-id").hide();
	SYS.datepicker();//页面进入时加载时间控件
};
/** 页面ajax --end-- */

/***/
/** 提交请求参数格式转换 */
SYS.prototype.formData = function(param) {
	var data;
	/*
	$(param).find("input,select,textarea").each(function(i) {
		var name = $(this).attr("name");
		var value = null;
		if ($(this)[0].tagName == "TEXTAREA") {// 文本域
			value = $(this).html();
		} else {
			value = $(this).val();
		}
		data += "&" + name + "=" + value;
	});*/
	data = $(param).serializeArray();
	return data;
};
/** 提交请求参数格式转换 input */
SYS.prototype.formDataByInput = function(param) {
	var roleIds = "";
	$(param).each(function() {
		var name = $(this).attr("name");
		var value = $(this).val();
		roleIds += "&" + name + "=" + value;
	});
	return roleIds;
};

SYS.prototype.pageData = function(param) {
	var data = param;
	if (param.constructor == Object) {

	} else if (param.constructor == String) {

	}
	return data;
};
$(function() {
	// SYS.pageData({
	// 	"sdf" : "ssdf"
	// });
});
/***/

/** 默认时间查询start 单个input */
SYS.prototype.datepicker = function(param) {
	var json = {
		language : 'zh-CN',
		autoclose : true,
		todayHighlight : true,
		todayBtn : "linked",
		clearBtn : true,
		orientation : "top auto",
	};
	if (param != null) {
		json = param;
	}
	$(".date-picker").datepicker(json);
};
/** 默认时间查询end 单个input */

/**--薪资员工查询插件--start--*/
/**
 * @param id 元素id
 */
SYS.prototype.searchSalaryEmpInit = function(id){
	new searchSalaryEmp(id);
};
/**--薪资员工查询插件--end--*/

/*判断文件类型*/
function getFileType(fileName){
	var flag=false;
	var types=new Array(".jpg",".jpeg",".png",".gif",".bmp");
	for ( var i = 0; i < types.length; i++) {
		if(fileName.indexOf(types[i])>0){
			flag=true;
		}
	}
	return flag;
}
// 初始化系统js
SYS = new SYS();