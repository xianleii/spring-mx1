<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>${busiName} -500</title>
	<%@include file="/common/commonCSS.jsp" %>
	<%@include file="/common/commonJS.jsp" %>
	<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
	<link rel="stylesheet" href="${path}/assets/css/sys/noPermissions.css">
</head>
<body class="no-skin">
	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try {
				ace.settings.check('main-container', 'fixed')
			} catch (e) {
			}
		</script>
		<div class="main-content" style="margin-left: 0;">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							<div class="audit-content">
								<img src="${resRoot}/images/error-500.png">
								<div class="col-xs-12 col-sm-8 description">
									<div class="col-xs-12 d-title ">系统异常，请稍后再试！</div>
									<div class="col-xs-12 d-english red">
										<c:if test="${responseText != ''}">
											${responseText}
										</c:if>
										<c:if test="${responseText == ''}">
											Sorry, something went wrong but we are working on it!
										</c:if>
									</div>
									<div class="col-xs-12">
										<a class="btn btn-info btn-white"  href="${webRoot }/sys/control/panel/index.do">控制面板</a>
										<a class="btn btn-light btn-white" href="javascript:history.go(-1);">返回</a>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>