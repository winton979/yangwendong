<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%response.setStatus(200);%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>彦信信息FA进件管理平台</title>

        <link href="${ctx}/static/css/style.default.css" rel="stylesheet">
        <link href="${ctx}/static/css/main.css" rel="stylesheet" />

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->
    </head>

    <body>
        
        <section>
            <div class="notfoundpanel">
                <h1>403!</h1>
                <h3>对不起！您的权限不足!</h3>
                <p>您所访问的内容由于权限问题拒绝访问，如有问题请与管理员联系<a>amdin@126.com</a></p>
 
                     <a class="btn btn-primary" href="<c:url value="/"/>">返回首页</a>

            </div><!-- notfoundpanel -->
        </section>


        <script src="${ctx}/static/js/jquery-1.11.1.min.js"></script>
        <script src="${ctx}/static/js/bootstrap.min.js"></script>

        <script src="${ctx}/static/js/custom.js"></script>

    </body>
</html>



