<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="zh_CN">
<head>
<title>小马用车管理平台</title>
<%@ include file="/WEB-INF/common/resouces.jsp"%>
<meta name="robots"content="all">  
</head>
<body>
	<div id="loading_layer" style="display:none"><img src="${ctx}/static/images/ajax_loader.gif" alt="" /></div>
	<header>
		<!-- 头部包装DIV -->
		<div class="headerwrapper">
			<%@ include file="header.jsp"%>
		</div>
		<!-- headerwrapper -->
	</header>
	<section>
		<div class="mainwrapper">
			<div class="leftpanel">
				<%@ include file="left.jsp"%>
			</div><!-- leftpanel -->
			
			<div class="mainpanel">
				<div class="pageheader">
					<div class="media">
						<div class="pageicon pull-left">
							<i class="fa fa-home pageheaderIocn"></i>
						</div>
						<div class="media-body">
							<ul class="breadcrumb">
								<li><a href="#"><i class="glyphicon glyphicon-home"></i></a></li>
								<!--  <li class="pageheaderTitle">首页</li> -->
								<li class="pageheaderTitle"></li>
							</ul>
							<!--  <h4 class="pageheaderTitle">首页</h4> -->
							<h4 class="pageheaderTitle"></h4>
							
							
							
						</div>
					</div>
					<!-- media -->
				</div>
				<!-- pageheader -->
				<sitemesh:write property='body' />
				<%@ include file="footer.jsp"%>
			</div><!-- mainpanel -->
		</div>
	</section>
</body>
</html>