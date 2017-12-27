<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.StringWriter"%>
<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true"%>
<%@ page import="org.slf4j.Logger"%>
<%@ page import="org.slf4j.LoggerFactory"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%response.setStatus(200);%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<%
	Logger logger = LoggerFactory.getLogger(this.getClass());
	StringWriter sw=new StringWriter();
	PrintWriter pw=new PrintWriter(sw);
	exception.printStackTrace(pw);
	logger.error(sw.toString());
	
	String accept=request.getHeader("Accept");
	boolean ajax=accept!=null&&accept.indexOf("applicatin/json")!=-1;
	//get exception message
	String message=null;
	message=exception.getMessage();
	if(message==null)message="";
	if(ajax){
		response.setContentType("application/json; charset=UTF-8");
		out.print(String.format("{\"code\":%d,\"msg:\":\"%s\"}", -1,message!=null?message.replaceAll("\"", "\\\\\"").replaceAll("\n", "\\\\n"):"系统错误"));
		return;
	}
	
%>
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
                <h1>500!</h1>
                <h3>对不起！服务器内部错误!</h3>
                <p>您所访问的内容出现服务器内部错误，如有问题请与管理员联系<a>amdin@126.com</a></p>
 
                     <a class="btn btn-primary" href="<c:url value="/"/>">返回首页</a>

            </div><!-- notfoundpanel -->
        </section>


        <script src="${ctx}/static/js/jquery-1.11.1.min.js"></script>
        
         <script type="text/javascript">
  //* show all elements & remove preloader
	   $("html").removeClass("js");
    </script>

    </body>
</html>



