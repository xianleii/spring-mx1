<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/taglib.jsp"%>
<%@ attribute name="pid" type="java.lang.String" required="true" description="编号"%>
<%@ attribute name="pname" type="java.lang.String" required="true" description="输入框名称"%>
<%@ attribute name="pvalue" type="java.lang.String" required="false" description="输入框名称"%>
<%@ attribute name="cid" type="java.lang.String" required="true" description="编号"%>
<%@ attribute name="cname" type="java.lang.String" required="true" description="输入框名称"%>
<%@ attribute name="cvalue" type="java.lang.String" required="false" description="输入框名称"%>
<%@ attribute name="aid" type="java.lang.String" required="true" description="编号"%>
<%@ attribute name="aname" type="java.lang.String" required="true" description="输入框名称"%>
<%@ attribute name="avalue" type="java.lang.String" required="false" description="输入框名称"%>


<select id="${pid}" name="${pname }"  default="${pvalue}"  class="col-xs-12  col-sm-4 col-md-4 chosen"  data-placeholder="请选择...">
</select>
<select id="${cid }" name="${cname }" default="${cvalue}"  class="col-xs-12 col-sm-4 col-md-4 select_center chosen"  data-placeholder="请选择...">
</select>
<select id="${aid }" name="${aname }" default="${avalue}" class="col-xs-12 col-sm-4 col-md-4 chosen" data-placeholder="请选择...">
</select>
<script type="text/javascript">

function getData(parentId,default_val){
	var html= "";
	$.ajax({
        type : "post",  
         url : "${webRoot}/sys/area/selectData.do",  
         data : "parentId=" + parentId,  
         async : false,  
         success : function(data){
     		html+="<option value=' '></option>";
        	 $.each(data,function(i,item){
     			if(item.id == default_val){
     				html+="<option value='" + item.id + "' selected='selected'>" + item.name + "</option>";
     			}else{
     				html+="<option value='" + data[i].id + "'>" + data[i].name + "</option>"
     			}
     		});
         } 
    }); 
	return html;
	
}
$(function(){
	var pvalue = Number("${pvalue}");
	var phtml = getData(0,pvalue)
	$("#${pid}").html(phtml);
	var pid = $("#${pid}").val();

	var cvalue = Number("${cvalue}");
	var chtml = getData(pid,cvalue)
	$("#${cid}").html(chtml);
	var cid = $("#${cid}").val();

	var avalue = Number("${avalue}");
	var ahtml = getData(cid,avalue)
	$("#${aid}").html(ahtml);

	// 增加chosen标签支持
	$('#${pid}').chosen({allow_single_deselect:true,width:'32%'});
	$('#${aid}').chosen({allow_single_deselect:true,width:'32%'});
	$('#${cid}').chosen({allow_single_deselect:true,width:'32%'});
	$('#${aid}_chosen').css("margin-left","0.5%");
	$('#${aid}_chosen').css("float","right");
	
	$('#${pid}').chosen().change(function(){
		var _pid = $(this).val();
		var _chtml = getData(_pid,1);
		$("#${cid}").html(_chtml);
		$('#${cid}').trigger('chosen:updated');
		
		var _cid = $("#${cid}").val();
		var _ahtml = getData(_cid,1)
		$("#${aid}").html(_ahtml);
		$('#${aid}').trigger('chosen:updated');
	});
	
	$('#${cid}').chosen().change(function(){
		var _cid = $(this).val();
		var _ahtml = getData(_cid,1)
		$("#${aid}").html(_ahtml);
		$('#${aid}').trigger('chosen:updated');
	});
	
});
</script>

