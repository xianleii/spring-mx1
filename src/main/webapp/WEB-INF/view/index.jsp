<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ include file="/WEB-INF/views/include/taglib.jsp  "%> --%>
<!DOCTYPE html>
<html lang="en" style="overflow: hidden;">
<head>
    <meta charset="utf-8"/>
    <title>${busiName}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <%@include file="/common/commonCSS.jsp" %>
    <%@include file="/common/commonJS.jsp" %>
	<%@ include file="/WEB-INF/view/include/taglib.jsp"%>
	<script type="text/javascript" src="${webRoot}/assets/js/jquery.slimscroll.min.js"></script>
	<script type="text/javascript" src="${webRoot}/assets/js/sys/contabs.js"></script>
    <script>
	    if (window.top !== window.self) {
			window.top.location = window.location;
		}
        function logout() {
        	$.get("${webRoot}/logout/remove/ceahe.do",function(){});
            window.location.href = "../logout.do";
        }
    </script>
	<style type="text/css">
		.content-tabs {  position: relative;  height: 42px; background: #fafafa;  line-height: 40px;}
		.content-tabs .roll-nav,.page-tabs-list { position: absolute; width: 40px; height: 40px; text-align: center;  color: #999; z-index: 2; top: 0;}
		.content-tabs .roll-left { left: 0;  border-right: solid 1px #eee;}
		.content-tabs .roll-right { right: 0; border-left: solid 1px #eee;}
		.content-tabs button { background: #fff;  border: 0; height: 40px;width: 40px;outline: none;}
		.content-tabs button:hover { background: #fafafa;}
		nav.page-tabs {  margin-left: 40px;width: 100000px; height: 40px; overflow: hidden;}
		nav.page-tabs .page-tabs-content {float: left;}
		.page-tabs a {  display: block; float: left;  border-right: solid 1px #eee; padding: 0 15px;}
		.page-tabs a i:hover {  color: #c00;}
		.page-tabs a:hover,.content-tabs .roll-nav:hover {  color: #777; background: #f2f2f2; cursor: pointer;}
		.roll-right.J_tabRight { right: 140px;}
		.roll-right.btn-group {right: 60px; width: 80px; padding: 0;}
		.roll-right.btn-group button { width: 80px;}
		.roll-right.J_tabExit { background: #fff; height: 40px; width: 60px;  outline: none;}
		.dropdown-menu-right { left: auto;}
		.content-tabs {border-bottom: solid 1px #c5d0dc; margin-top: 10px;}
		.page-tabs a { color: #999;}
		.page-tabs a i {  color: #ccc;}
		.page-tabs a.active{ background: #fff;color: #666;border-top: 2px solid #4c8fbd;height: 40px;}
		.page-tabs a.active:hover,.page-tabs a.active i:hover { background: #fff;color: #4c8fbd;}
		.page-tabs a.active i:hover { background: #336699; color: #fff;}
	</style>
</head>

<body class="no-skin" >
<div class="navbar navbar-default" id="navbar">
	<script type="text/javascript">
		try {
			ace.settings.check('navbar', 'fixed')
		} catch (e) {
		}
	</script>
    <div class="navbar-container" id="navbar-container">
        <div class="navbar-header pull-left">
            <a href="#" class="navbar-brand"><small><i class="icon-leaf"></i> 正好钱包</small></a><!-- /.brand -->
        </div><!-- /.navbar-header -->
        <div class="navbar-header pull-right" role="navigation">
        	<ul class="nav ace-nav" style="margin-right: 3px!important;">
				<li>
					<a data-toggle="dropdown" href="${webRoot }/sys/user/view.do" class="dropdown-toggle">
						<%--<img class="nav-user-photo" src="${webRoot }/assets/images/user.jpg"/>--%>
						<span class="user-info">${loginUser.name }</span>
					</a>
				</li>
				<li>
					<a href="javascript:logout()">
						<i class="icon-power-off"></i>退 出
					</a>
				</li>
			</ul>
<!--        <button type="button" class="btn btn-primary" onclick="()">退出登录 </button> -->
        </div><!-- /.navbar-header -->
    </div><!-- /.container -->
</div>


<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<script type="text/javascript">
		try {
			ace.settings.check('main-container', 'fixed')
		} catch (e) {
		}
	</script>
	<!-- #section:basics/sidebar -->
	<div id="sidebar" class="sidebar responsive">
    	<script type="text/javascript">
			try {
				ace.settings.check('sidebar', 'fixed')
			} catch (e) {
			}
	      </script>
           <div class="sidebar-shortcuts" id="sidebar-shortcuts" style="display: none;">
			   <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
				<a class="btn btn-success  J_menuItem" target="mainFrame" href="${webRoot}/admin/welcome.do" data-index="9999" title="首页" id="indexBtn">
					<i class="icon-desktop"></i>
				</a>
			   </div>
			<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
				<span class="btn btn-success"></span> <span class="btn btn-info"></span>
				<span class="btn btn-warning"></span> <span class="btn btn-danger"></span>
			</div>
		</div>

		<!-- 左侧菜单 -->
		<ul  id="leftMenu"  class="nav nav-list">
			<c:forEach items="${res.menuList }" var="menu">
<%-- 					<c:if test="${!(empty menu.href and empty menu.subMenuList)}">  ${fns:getConfig(menu.systemValue)}--%>
					<li>
						<c:if test="${empty menu.href}"><c:set var="_href" value="javascript:void(0);"></c:set></c:if>
						<c:if test="${not empty menu.href}"><c:set var="_href" value="${webRoot }${menu.href}"></c:set></c:if>
						<a href="${_href}" class="${not empty menu.subMenuList?'dropdown-toggle':'J_menuItem'}" target="mainFrame">
							<c:if test="${not empty menu.icon}">
							<i class="${menu.icon}"></i>
							</c:if>
							<span class="menu-text">${menu.name }</span>
							<c:if test="${not empty menu.subMenuList}"><b class="arrow icon-angle-down"></b></c:if>
						</a>
						<c:if test="${not empty menu.subMenuList}">
						<ul class="submenu">
						<c:forEach items="${menu.subMenuList}" var="submenu">
							<li >
								<c:if test="${empty submenu.href}"><c:set var="_href" value="javascript:void(0)"></c:set></c:if>
								<c:if test="${not empty submenu.href}"><c:set var="_href" value="${webRoot }${submenu.href}"></c:set></c:if>
								<a class="${not empty submenu.subMenuList?'dropdown-toggle':'J_menuItem'}" href="${_href}" target="mainFrame">
								<i class="${submenu.icon}"></i>${submenu.name}
								<c:if test="${not empty submenu.subMenuList}"><b class="arrow icon-angle-down"></b></c:if>
								</a>
								<c:if test="${not empty submenu.subMenuList}">
								<ul class="submenu">
								<c:forEach items="${submenu.subMenuList}" var="thirdmenu">
									<li>
										<c:if test="${empty thirdmenu.href}"><c:set var="_href" value="javascript:void(0)"></c:set></c:if>
										<c:if test="${not empty thirdmenu.href}"><c:set var="_href" value="${webRoot }${thirdmenu.href}"></c:set></c:if>
										<a href="${_href}" target="mainFrame" class="${empty thirdmenu.href ? 'J_menuItem' : ''}">
										<c:if test="${empty submenu.icon}">
											<i class="icon-angle-right"></i>
										</c:if>
										<c:if test="${not empty submenu.icon}">
											<i class="${thirdmenu.icon}"></i>
										</c:if>
										${thirdmenu.name}
										</a>
									</li>
								</c:forEach>
								</ul>
								</c:if>
							</li>
						</c:forEach>
						</ul>
						</c:if>
					</li>
<%-- 					</c:if> --%>
				</c:forEach>
            </ul><!-- /.nav-list -->
          
           <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
				<i class="ace-icon fa fa-angle-double-left icon-double-angle-left"
					data-icon1="ace-icon fa fa-angle-double-left icon-double-angle-left"
					data-icon2="ace-icon fa fa-angle-double-right icon-double-angle-right"></i>
			</div>
           

           <script type="text/javascript">
               try {
                   ace.settings.check('sidebar', 'collapsed')
               } catch (e) {
               }
           </script>   
       </div>
		<!-- 主要内容 -->
		<!-- /section:basics/sidebar -->
		<div id="main-frame" class="main-content J_mainContent">
			<div class="content-tabs">
                <button class="roll-nav roll-left J_tabLeft"><i class="icon-caret-left"></i>
                </button>
                <nav class="page-tabs J_menuTabs">
                    <div class="page-tabs-content">
                         <%--<a href="javascript:;" class="J_menuTab active" data-id="${webRoot}/admin/welcome.do">首页</a>--%>
                    </div>
                </nav>
                <button class="roll-nav roll-right J_tabRight"><i class="icon-caret-right"></i>
                </button>
                <div class="btn-group roll-nav roll-right">
                    <button class="dropdown J_tabClose"  data-toggle="dropdown">关闭操作<span class="caret"></span>

                    </button>
                    <ul role="menu" class="dropdown-menu dropdown-menu-right">
                        <li class="J_tabShowActive"><a>定位当前选项卡</a>
                        </li>
                        <li class="divider"></li>
                        <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
                        </li>
                        <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
                        </li>
                    </ul>
                </div>
                <a href="${webRoot}/logout.do" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
            </div>
			<iframe class="J_iframe" style="border:0px; margin:0px; padding:0px; width: 100%;min-height: 870px;" id="mainFrame" name="mainFrame" src="${webRoot}/admin/welcome.do">
				<!--  浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。  -->
			</iframe>
		</div>
		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
		
 		<%--<div class="main-content">--%>
             <%--<div id="content" style="padding-right: 13px;">--%>
                 <%--<img src="${webRoot}/assets/images/index_welcome.png" style="width: 100%;">--%>
             <%--</div>--%>
        <%--</div>--%>
</div><!-- /.main-container -->
<script type="text/javascript">
	$(function(){
		$("#leftMenu,#mainFrame").slimScroll({
			width:"100%",
			height:"100%",
			cursorwidth: "7px", //像素光标的宽度 
		    cursorborder: "0" //游标边框css定义
		});
		
		$("#sidebar-collapse").on("click",function(){
			if (!$("#sidebar").hasClass("menu-min")) {
				$(".slimScrollDiv").css({overflow:'visible'});
				$("#leftMenu").css({overflow:'visible'});
			} else {
				$(".slimScrollDiv").css({overflow:'hidden'});
				$("#leftMenu").css({overflow:'hidden'});
			}
		});
		
		if ($("#sidebar").hasClass("menu-min")) {
			$(".slimScrollDiv").css({overflow:'visible'});
			$("#leftMenu").css({overflow:'visible'});
		} else {
			$(".slimScrollDiv").css({overflow:'hidden'});
			$("#leftMenu").css({overflow:'hidden'});
		}
		
		resize();
		
		$(window).resize(function() {
			resize();
		});
		
	});
	
	function resize() {
		var wh = $(window).height();
		$("#leftMenu").height(wh - 120);
		$("#mainFrame").height(wh - 50);
	}
	
	$(function(){
		$("#leftMenu").find("a").click(function(){
			if (!$(this).hasClass('dropdown-toggle')) {
				$("#leftMenu").find("li.active").removeClass("active");
				$(this).parent().addClass("active");
			}
		});
	});
    </script>  
</body>
</html>

