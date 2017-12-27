<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ page import="org.apache.shiro.authc.LockedAccountException "%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
		<meta http-equiv="Cache-Control" content="no-store" />
		<meta http-equiv="Pragma" content="no-cache" />
		<meta http-equiv="Expires" content="0" />
        <title>东彦信车贷通系统管理平台－登录</title>
		<link type="image/x-icon" href="${ctx}/static/images/favicon.ico" rel="shortcut icon">
        <link href="${ctx}/static/css/style.default.css" rel="stylesheet">
        <link href="${ctx}/static/css/select2.css" rel="stylesheet" />
        <link href="${ctx}/static/css/jquery.gritter.css" rel="stylesheet" />
        <link href="${ctx}/static/css/main.css" rel="stylesheet" />
        <style type="text/css">
		#img{max-width: 100%; height: auto;}
		</style>
    </head>
    <body class="signin">
    	<section>
            <div class="panel panel-signin">
                <div class="panel-body">
                    <div class="logo text-center">
                        <img src="${ctx}/static/images/logo.png" alt="CDT Logo" >
                    </div>
                 
                    <div class="mb30"></div>
                    <form id="loginForm" action="${ctx}/loansReport" method="get">
                  
                    <div class="errorForm"></div>
                         <div class="input-group mb15">
                            <span class="input-group-addon"><i >请选择渠道</i></span>
                            <select class="form-control">
							  <option value ="1">易鑫</option>
							  <option value ="2">汇通</option>
							  <option value="3">平安</option>
							</select>
						
						<input type="text"  id ="isPlugin" name="isPlugin" value="true"  style="display:none;"/>
                        </div><!-- input-group -->
                            <button id="loginBtn" type="submit" class="btn btn-success" style="width:100%">确定</i></button>
                        </div>                      
                    </form>
                    
                </div><!-- panel-body -->
            </div><!-- panel -->
            
            
        </section>
        <script src="${ctx}/static/js/jquery-1.11.1.min.js"></script>
        <script src="${ctx}/static/js/jquery-migrate-1.2.1.min.js"></script>
        <script src="${ctx}/static/js/bootstrap.min.js"></script>
        <script src="${ctx}/static/js/modernizr.min.js"></script>
        <script src="${ctx}/static/js/pace.min.js"></script>
        <script src="${ctx}/static/js/retina.min.js"></script>
        <script src="${ctx}/static/js/jquery.cookies.js"></script>
        <script src="${ctx}/static/js/jquery.validate.min.js"></script>
        <script src="${ctx}/static/js/messages_bs_zh.js"></script>
        <script src="${ctx}/static/js/custom.js"></script>
        <script>
        /**
        $("#pluginIndex").click(function () {
            $.ajax({
                type : "get",
                url: "${ctx}/loansReport",
                data: "isplugin=true",
                success: function (msg) {
                //数据成功返回时执行次回调函数
                    alert(msg);
                }
            })

        })     
        */
            
       </script>
    </body>
</html>