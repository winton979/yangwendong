<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="zh_CN">
<head>
<title>彦信信息FA进件管理平台</title>
<%@ include file="/WEB-INF/common/resouces.jsp"%>
<sitemesh:head />
</head>
<body>
	<div id="loading_layer" style="display:none"><img src="${ctx}/static/images/ajax_loader.gif" alt="" /></div>
	<section>
		<div class="row">
		  <sitemesh:body />
				<%@ include file="footer.jsp"%>
		</div>
	</section>
</body>
</html>