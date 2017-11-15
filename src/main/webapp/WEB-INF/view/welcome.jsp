<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="en">
	<head>
		<title>${busiName} - 用户管理</title>
	    <%@include file="/common/commonCSS.jsp" %>
	    <%@include file="/common/commonJS.jsp" %>
		<style type="text/css">
			#main-container div.main-content{
				margin-left: 20px;
				margin-right: 20px;
			}
		</style>
	</head>

	<body class="no-skin">
		<div class="main-container" id="main-container">
			<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>
			<div class="main-content">
				<div class="main-content-inner">
					<!-- #section:basics/content.breadcrumbs -->
					<%--<sys:pagenav/> --%>
					<div class="page-content">
						<div class="main-content">
            				<div id="content" style="padding-right: 13px;">
				                <img src="${webRoot}/assets/images/index_welcome.png" style="width: 100%;">
				            </div>
				        </div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>