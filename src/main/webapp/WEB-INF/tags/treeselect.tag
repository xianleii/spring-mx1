<%@ tag language="java" pageEncoding="UTF-8"%>
<%-- <%@ include file="/WEB-INF/views/include/taglib.jsp"%> --%>
<%@ attribute name="id" type="java.lang.String" required="true" description="编号"%>
<%@ attribute name="name" type="java.lang.String" required="true" description="隐藏域名称（ID）"%>
<%@ attribute name="value" type="java.lang.String" required="true" description="隐藏域值（ID）"%>
<%@ attribute name="pname" type="java.lang.String" required="false" description="隐藏域名称（PIDS）"%>
<%@ attribute name="pvalue" type="java.lang.String" required="false" description="隐藏域值（PIDS）"%>
<%@ attribute name="labelName" type="java.lang.String" required="true" description="输入框名称（Name）"%>
<%@ attribute name="labelValue" type="java.lang.String" required="true" description="输入框值（Name）"%>
<%@ attribute name="title" type="java.lang.String" required="true" description="选择框标题"%>
<%@ attribute name="url" type="java.lang.String" required="true" description="树结构数据地址"%>
<%@ attribute name="extId" type="java.lang.String" required="false" description="排除掉的编号（不能选择的编号）"%>
<%@ attribute name="isAll" type="java.lang.Boolean" required="false" description="是否列出全部数据，设置true则不进行数据权限过滤（目前仅对Office有效）"%>
<%@ attribute name="module" type="java.lang.String" required="false" description="过滤栏目模型（只显示指定模型，仅针对CMS的Category树）"%>
<%@ attribute name="type" type="java.lang.String" required="false" description="执行的函数"%>
<input id="${id}Id" name="${name}" type="hidden" value="${value}"/>
<div class="input-group col-xs-12">
	<input id="${id}pId" name="${pname}" type="hidden" value="${pvalue}"/>
	<input id="${id}Name" name="${labelName}" readonly="readonly" value="${labelValue}" class="form-control" type="text">
	<span id="${id}Button" class="input-group-addon">
		<i class="icon-search bigger-110"></i>
	</span>
<%-- 	<span id="${id}ClearButton" class="input-group-addon"> --%>
<!-- 		<i class="fa fa-close"></i> -->
<!-- 	</span> -->
</div>

<script type="text/javascript">
// 	$("#${id}ClearButton").click(function(){
// 		$("#${id}pId").val("");
// 		$("#${id}Id").val("");
// 		$("#${id}Name").val("");
// 		$.post("${webRoot}/sys/office/code.do?parentId=0",function(data){
// 			if(data != ""){
// 				$("#officeCode").val(data);
// 				$("#officeCode").val(data);
// 			}
// 		});
// 	});
	$("#${id}Button, #${id}Name").click(function(){
		layer.open({
			type: 2,
			title: '选择${title}',
			shadeClose: true,
			shade: 0.2,
			area: ['380px', '700px'],
			content: "${webRoot}/sys/tag/treeselect.do?url="+encodeURIComponent("${url}")+"&module=${module}&extId=${extId}&isAll=${isAll}&selectIds=${value}&_skip=1", //iframe的url
			btn : ["选择","取消"],
			yes: function(index, layero){
				var tree = layero.find("iframe")[0].contentWindow.tree;
				var ids = [], names = [], nodes = [], pids = [0];
				
				nodes = tree.getSelectedNodes();
				debugger;
				for(var i=0; i<nodes.length; i++) {
					var pNodes = nodes[i].getPath();
					if(pNodes.length > 1){
						for (var j = 0; j < pNodes.length; j++) {
							pids.push(pNodes[j].id);
						}
					}
					ids.push(nodes[i].id);
					names.push(nodes[i].name);
					break; // 如果为非复选框选择，则返回第一个选择(设置参数都不起作用)
				}
				if(pids.length == 1){
					pids[1] = ids;
				}
				$("#${id}pId").val(pids.join(",").replace(/u_/ig,""));
				$("#${id}Id").val(ids.join(",").replace(/u_/ig,""));
				$("#${id}Name").val(names.join(","));
				if("${type}" == "1"){//机构
					$.post("${webRoot}/sys/office/code.do?parentId="+$("#${id}Id").val(),function(data){
						if(data != ""){
							$("#code").val(data);
						}
					});
				}
				layer.close(index);
				
			},cancel: function(index){}
		});
	});
</script>