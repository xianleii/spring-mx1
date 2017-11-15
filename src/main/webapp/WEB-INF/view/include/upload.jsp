<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="${webRoot}/assets/js/uploadify/jquery.uploadify.js"></script>
<link rel="stylesheet" href="${webRoot}/assets/js/uploadify/uploadify.css"/>
<link rel="stylesheet" href="${webRoot}/assets/css/colorbox.css"/>
<style type="text/css">
    .uploadFile{
        margin-left: 20px !important;
        margin-right: 20px !important;
    }
    .uploadFile .uploadify, .uploadFile .uploadify-button, ul.ace-thumbnails > li, ul.ace-thumbnails img {
        width: 100% !important;
    }
</style>
<script type="text/javascript">
var count = 0,loadCount = 0;var myIntervalId = '';
$(function(){
	count = $('.uploadFile').length;
	$('.uploadFile').each(function(i,item){
		var id = $(this).attr('data');//文件id
		var objId = $(this).attr('obj-id');//libaray表的objId，其他表的主键 // 相当于 loanId 或 custId，这里使用 loanId updated by huanghao on 2017/10/23 17:24
		var desc = $(this).attr('desc');//显示名字
		var fileType = $(this).attr('file-type');//文件类型
		var isDel = $(this).attr('is-del') == '1';//是否可删除  1-否
		var isDisable = $(this).attr('is-disable') == '1';//是否禁用  1-否
		var max = $(this).attr('max');// 表示当前 文件展示组 最大支持的文件格式，达到最大时不能再上传 updated by huanghao on 2017/10/24 16:10
		var html = '<div>'
				 +'<input id="'+id+'" name="'+id+'"  type="file"  />'
       			 + '<div id="'+id+'_div"></div>'
       			 + '<ul id="'+id+'_img" class="ace-thumbnails"></ul>';
       	$(this).html(html);
       	$('#'+id).uploadify({
            'debug'     : false, //开启调试
            'auto'      :true,  //是否自动上传
            'buttonText':desc,  //按钮上的文字
            'swf': "${webRoot}/assets/js/uploadify/uploadify.swf",//flash
            'queueID'   :id+"_div",  //文件选择后的容器ID
            'uploader'  :"${webRoot}/basic/file/upload.do",  //后台action
            'width'     :'75',  //按钮宽度
            'height'    :'24',  //按钮高度
            'multi'     :false,  //是否支持多文件上传，默认就是true
            'fileObjName':'fileData',//后台接收的参数，如：使用struts2上传时，后台有get,set方法的接收参数
            'fileTypeDesc':'支持的格式：',//  可选择文件类型说明
            'fileTypeExts':'*.jpg;*.jpge;*.gif;*.png',  //允许上传文件的类型
            // 'fileSizeLimit': maxFileSize,  //文件上传的最大大小
            'removeTimeout':1,
            //设置上传进度显示方式，percentage显示上传百分比，speed显示上传速度
            'progressData':'percentage',
            'onInit':function(instance){
            	cmdQueryFiles(objId,fileType,isDel,instance.settings.id,max,isDisable);
            	loadCount++;
            },
            //返回一个错误，选择文件的时候触发
            'onSelectError':function(file, errorCode, errorMsg){
            	console.log(errorCode+":"+errorMsg);
                switch(errorCode) {
                    case -100:
                        alert("上传的文件数量已经超出系统限制的"+$('#file_upload').uploadify('settings','queueSizeLimit')+"个文件！");
                        break;
                    case -110:
                        alert("文件 ["+file.name+"] 大小超出系统限制的"+$('#file_upload').uploadify('settings','fileSizeLimit')+"大小！");
                        break;
                    case -120:
                        alert("文件 ["+file.name+"] 大小异常！");
                        break;
                    case -130:
                        alert("文件 ["+file.name+"] 类型不正确！");
                        break;
                }
            },
            //检测FLASH失败调用
            'onFallback':function(){
                alert("您未安装FLASH控件，无法上传图片！请安装FLASH控件后再试。");
            },
            'onSelect': function(file){
                $("#alertDiv").text("正在上传...");
                $("#alertDiv").show();
            },
            //上传到服务器，服务器返回相应信息到data里
            'onUploadSuccess':function(file, data, response){
            	if(data == "-1"){
            		alertMsg("文件上传失败,请重新上传");
            		return;
            	}
            	 var json = eval("("+data+")");
                //如需上传后生成预览，可在此操作                
                var libFile = {
                        pictureId:objId,//对象表主键
                        pictureType:1,//对象类型(区分商户还是进件)
                        pictureName:json.pictureName,//服务器上文件名称
                        pictureTitle:file.name,//文件标题(实际名称)
                        pictureDirectory:json.dirPath,//服务上目录地址
                        pictureExtName:"."+json.suffix,//后缀名
                        pictureType:fileType,//文件类型
                        pictureSize:file.size,//文件大小
                        custPictureDesc:desc //描述
                };
                $.post("${webRoot}/basic/file/save.do",libFile,function(res){
                	if(res.code=="0"){
                		libFile.pictureId = res.id;
                		if(fileType != "6"){
                			libFile.pictureTitle = desc;
                		}
                		uploadFileSucc(libFile,true,id,max,isDisable);
                	}else{
                		alert("上传失败,请稍后再试");
                		console.log("上传失败了");
                	}
                })
            },
            'onQueueComplete': function(queueData){ //队列里所有的文件处理完成后调用
                //alert(queueData.uploadsSuccessful);
            }
        });
	});
	myIntervalId = setInterval("myInterval()", 1000);
});

function myInterval(){
	if(count == loadCount ){
		$('#imgFile').viewer();
		if(myIntervalId != ''){
			clearInterval(myIntervalId);
		}
	}
 }
/**
 * 上传文件成功后
 */
function uploadFileSucc(libFile,isDel,id,max,isDisable){
	var itemHTML= '';
	var libExtName= libFile.pictureExtName;
	if(libExtName.indexOf(".") === -1){
		libExtName = "."+libExtName;
	}
	// directory 已包含文件名与后缀 updated by huanghao on 2017/10/23 17:41
//	var filePath = libFile.pictureDirectory+libFile.pictureName+libExtName;
	var filePath = libFile.pictureDirectory;
	var fileName = libFile.pictureTitle;
	var fileSize = Math.round(Number(libFile.pictureSize)/1024);
	var suffix   = 'KB';
	if (fileSize > 1000){
		fileSize = Math.round(Number(libFile.pictureSize)/1000);
		suffix   = 'MB';
	}
	fileSize = fileSize+suffix;
	//判断是否为图片
	if(".jpeg|.gif|.jpg|.png|.bmp|.pic|".indexOf(libExtName.toLowerCase())>-1){
		itemHTML = '<li id="li_'+libFile.pictureId+'">'
				+'<a href="javasrcipt:void(0);" data-rel="colorbox" class="cboxElement">'
				+'	<img alt="150x150" src="${webRoot}/basic/file/download.do?filePath='+filePath+"&savePath="+fileName+'" title="'+fileName+'" originalUrl="${webRoot}/basic/file/download.do?filePath='+filePath+"&savePath="+fileName+'">'
				+	'<div class="tags">'
				+		'<span class="label-holder" onclick="downloadFile(\''+filePath+'\',\''+(fileName.indexOf(libExtName) === -1 ? fileName+libExtName : fileName)+'\')">'
				+			'<span class="label arrowed-in">下载</span>'
				+		'</span>'
				+		'<span class="label-holder">'
				+		'	<span class="label label-success arrowed-in">'+fileSize+'</span>'
				+		'</span>'
				+		'<span class="label-holder">'
				+			'<span class="label label-info arrowed-in">'+libFile.pictureTitle+'</span>'
				+		'</span>'
				+	'</div>'
				+'</a>'
				+'<div class="tools tools-top"><a href="javascript:deleteFile(\''+libFile.pictureId+'\')" style="background-color: rgba(0, 0, 0, 0.02);"><i class="icon-remove red"></i></a></div>'
				+'</li>';
	}else{
		itemHTML = '<li class="uploadify-queue-item" id="li_'+libFile.pictureId+'">'
				+'<a href="javasrcipt:void(0);" data-rel="colorbox" class="cboxElement">'
				+	'<div class="tags">'
				+		'<span class="label-holder" onclick="downloadFile(\''+filePath+'\',\''+fileName+'\')">'
				+			'<span class="label arrowed-in">下载</span>'
				+		'</span>'
				+		'<span class="label-holder">'
				+		'	<span class="label label-success arrowed-in">'+fileSize+'</span>'
				+		'</span>'
				+		'<span class="label-holder">'
				+			'<span class="label label-info arrowed-in">'+libFile.pictureTitle+'</span>'
				+		'</span>'
				+	'</div>'
				+'</a>'
				+'<div class="tools tools-top"><a href="javascript:deleteFile(\''+libFile.pictureId+'\')" style="background-color: rgba(0, 0, 0, 0.02);"><i class="icon-remove red"></i></a></div>'
				+ '</li>';
	}
	
	$("#"+id+'_img').prepend(itemHTML);
	if($("#"+id+'_img').find("li").length >= max || !isDisable){
		$("#"+id).find("Object").hide();
		$("#"+id+"-button").addClass("disable");
	}
	
	if(!isDel){
		$("#"+id+'_img').find(".tools").hide();
	}
// 	$('#imgFile').viewer();
}

/**
 * 上传文件成功后
 */
function queryLoanFileSucc(libFile){
	var itemHTML= '';
	var libExtName= libFile.pictureExtName;
	if(libExtName.indexOf(".") == -1){
		libExtName = "."+libExtName;
	}
	var filePath = libFile.pictureDirectory+libFile.pictureName+libExtName;
	var fileName = libFile.pictureTitle;
	var fileSize = Math.round(Number(libFile.pictureSize)/1024);
	var suffix   = 'KB';
	if (fileSize > 1000){
		fileSize = Math.round(Number(libFile.pictureSize)/1000);
		suffix   = 'MB';
	}
	fileSize = fileSize+suffix;
	//判断是否为图片
	if(".jpeg|.gif|.jpg|.png|.bmp|.pic|".indexOf(libExtName.toLowerCase())>-1){
		itemHTML = '<li id="li_'+libFile.pictureId+'">'
				+'<a href="javasrcipt:void(0);" data-rel="colorbox" class="cboxElement">'
				+'	<img alt="150x150" src="${webRoot}/basic/file/download.do?filePath='+filePath+"&savePath="+fileName+'" title="'+fileName+'" originalUrl="${webRoot}/basic/file/download.do?filePath='+filePath+"&savePath="+fileName+'">'
				+	'<div class="tags">'
				+		'<span class="label-holder" onclick="downloadFile(\''+filePath+'\',\''+(fileName.indexOf(libExtName) == -1 ? fileName+libExtName : fileName)+'\')">'
				+			'<span class="label arrowed-in">下载</span>'
				+		'</span>'
				+		'<span class="label-holder">'
				+		'	<span class="label label-success arrowed-in">'+fileSize+'</span>'
				+		'</span>'
				+		'<span class="label-holder">'
				+			'<span class="label label-info arrowed-in">'+libFile.pictureTitle+'</span>'
				+		'</span>'
				+	'</div>'
				+'</a>'
// 				+'<div class="tools tools-top"><a href="javascript:deleteFile(\''+libFile.pictureId+'\')" style="background-color: rgba(0, 0, 0, 0.02);"><i class="icon-remove red"></i></a></div>'
				+'</li>';
		$("#imgs").prepend(itemHTML);
	}else{
		itemHTML = '<a href="javascript:downloadFile(\''+filePath+'\',\''+(fileName.indexOf(libExtName) == -1 ? fileName+libExtName : fileName)+'\')" >'+libFile.pictureTitle+'</a><br>';
				
		$("#files").prepend(itemHTML);
	}
}

String.prototype.IsPicture = function(){
    //判断是否是图片 - strFilter必须是小写列举
    var strFilter=""
    var strPostfix = this.toLowerCase();
    if(strFilter.indexOf(strPostfix)>-1){
        return true;
    }
    return false;
}

/**
 * 查询成功
 * obj_id 对象表主键
 * lib_type 文件类型
 * is_del 是否删除
 * id jsp文件对象Id
 */
function cmdQueryFiles(obj_id,lib_type,is_del,id,max,isDisable){
	$.post("${webRoot}/basic/file/list.do",{"custPictureContractId":obj_id,"pictureType":lib_type},function(data){
		if(data.length > 0){
			$.each(data,function(i,item){
				uploadFileSucc(item,is_del,id,max,isDisable)
			});
		}else{
			if($("#"+id+'_img').find("li").length >= max || !isDisable){
				$("#"+id).find("Object").hide();
				$("#"+id+"-button").addClass("disable");
			}
		}
	});
}

function cmdQueryLoanFiles(obj_id){
	$.post("${webRoot}/basic/file/list.do",{"objId":obj_id},function(data){
		console.log(data);
		if(data.length > 0){
			$.each(data,function(i,item){
				queryLoanFileSucc(item)
			});
		}
	});
}

/**
 * 逻辑删除文件
 */
function deleteFile(fileId){
	confirm("是否删除文件该文件,删除后不可恢复?",function(){
		$.post("${webRoot}/basic/file/del.do",{id:fileId},function(data){
			if(data.code == "0"){
				var id = $("#li_"+fileId).parent().attr("id").split("_")[0];
				$("#li_"+fileId).remove();
				var max = $("#"+id).parent().parent().attr("max");
				if($("#"+id+'_img').find("li").length < max){
					$("#"+id).find("Object").show();
					$("#"+id+"-button").removeClass("disable");
				}
			}else{
				toast("删除失败")
			}
		})
	},function(){
		
	});
}

/**
 * 下载文件
 */
function downloadFile(filePath,fileName){
    filePath=encodeURI(encodeURI(filePath));
    fileName=encodeURI(encodeURI(fileName));
    console.log("22222222222");
	window.open("${webRoot}/basic/file/download.do?filePath="+filePath+"&savePath="+fileName);
// 	event.stopPropagation();
}

</script>