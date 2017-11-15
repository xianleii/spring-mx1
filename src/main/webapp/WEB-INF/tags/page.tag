<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/taglib.jsp"%>
<%@ attribute name="page" type="com.zhph.base.page.Page" required="true"%>
<%-- 表格分页工具栏，使用方法： 原样输出page --%>
${page}
<!-- pagination的css样式设定-->
<style>
.pagination > li > a, .pager > li > a{height: 34px!important;}
.pagination > li > a>i, .pager > li > a>i{line-height: 21px!important;}
.pagination > li > a, .pager > li > a{ padding: 6px 15px;}
</style>
<script type="text/javascript">
 $(function(){
	var pagination =$(".pagination-info").html();
	console.log(pagination);
	if(pagination != "" && typeof(pagination) != "undefined" && Number(pagination.split("总共")[1].split("条记录")[0]) >0 && $("table.table").find("tbody tr").length == 0){
		page(1,10);
	}
	
	$('#searchForm').append('<input id="pageNum" name="pageNum" type="hidden" value="${page.pageNum}"/>');
	$("#reset").click(function(){
		$("#pageNum").val(0);
		$("#searchForm  input").val("");
		$("#searchForm  select").val("");
		$("#searchForm").submit();
	});
	$("#searchForm button").click(function(){
        $("#pageNum").val('1');
    });
}) 
function page(n,s){//翻页
    console.log($("#pageNum").val())
	$("#pageNum").val(n);
	$("#searchForm").submit();
	$("span.page-size").text(s);
	return false;
}
</script>
