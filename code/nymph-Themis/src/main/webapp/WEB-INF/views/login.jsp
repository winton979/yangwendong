<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ page import="org.apache.shiro.authc.LockedAccountException "%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html>
<head>
    <title>登录</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="robots" content="index,follow"/>
    <link type="image/x-icon" href="${ctx}/static/images/favicon.ico" rel="shortcut icon">
    <link type="text/css" rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="${ctx}/static/css/login-new.css">
    <script type='text/javascript' src='${ctx}/static/js/jquery.js' ></script>
    <script type='text/javascript' src='${ctx}/static/jquery/jquery-1.9.1.min.js' ></script>
   <%--  <script type='text/javascript' src='${ctx}/static/js/login.js'></script> --%>
    <script type='text/javascript' src='${ctx}/static/js/jQuery.md5.js'></script>
    <script src="${ctx}/static/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="${ctx}/static/js/jquery.validate.min.js"></script>
<script src="${ctx}/static/js/jquery.validate.custom.js"></script>
</head>
<body >
<div class="content-wrapper" style='background: url("http://desk.fd.zol-img.com.cn/t_s1920x1080c5/g5/M00/06/07/ChMkJlo50b6IBlQLAAFGULqiVhcAAjUpgN-M7wAAUZo647.jpg") center 0 no-repeat !important;'  id ="bj" >
    <div class="header-nav">
        <div class="header-nav-wrapper">
            <div class="fn-clear">
                <a href="javascript:void(0)" style="float: left;">
                    <div class="img"></div>
                </a>
                <ul class="fn-right service">
                    <li>
                        <span class="phone"></span>
                    </li>
                    <li>
                        <a class="ico ico-qqservice" target="_blank"  href=""></a>
                    </li>
                </ul>

                <div class="header-register">
                <span class="email fn-left">
                    <input id="register" placeholder="请输入邮箱地址后，点击免费注册" tabindex="-1">
                    <span id="tip"></span>
                </span>
                    <button id="goRegister">免费注册</button>
                </div>
            </div>
        </div>
    </div>
    <div class="wrapper-center">
        <div class="wrapper">
            <input id="rememberId" type="hidden" value="" tabindex="-1">

            <div class="slide">
                <div id="loginForm">
                    <form id="loginForm2" action="${ctx}/login" method="post"  >
                        <div class="loginForm-header"><span class="loginForm-header-title">东彦信车贷通系统管理平台</span>
                        </div>
                        <div class="form-input fn-clear">
                            <div class="input-group">
                            <span class="input-group-addon">
                            <img src="${ctx}/static/images/username.png">
                            </span>
                               <input type="text" id="username" name="username" value="${username}" class="form-control" title="登录账号不能为空!" placeholder="登录账号" required>
                            </div>
                        </div>
                        <div class="form-input fn-clear">
                            <div class="input-group">
                            <span class="input-group-addon">
                                 <img src="${ctx}/static/images/password.png">
                            </span>
                                <input type="password" class="form-control" id="password" name="password"  title="登录密码不能为空!" placeholder="登录密码" required>
                            </div>
						</div>
 						<div class="form-input fn-clear">
                            <div class="input-group">
                               <input type="text" id="code" style="width: 180px;border-radius: 6px; height: 40px;" name="code" value="" class="form-control" title="验证码不能为空!" placeholder="验证码" required>
                               <img src="${ctx}/CheckCode" id="img" class="yzm" width="80" height="30" style="border: 1px solid #ccc; border-radius: 6px;" /> 
                               <a href="javascript:changeImg()" class="login-text03">换一换</a>
                            </div>
                        </div>
                         
                <div class="fn-center">
                    <input id="loginBtn"  class="btn" type="submit"  value="登 录" tabindex="-1"/>
                </div>

                <div style="display: inline-block; margin: -14px 317px;">
                    <!--<div class="login-foot-icon"></div>-->
                    <div class="login-code">
                        <div class="login-foot-computer"></div>
                    </div>
                </div>
                <div class="home-logining">

                </div>
                </form>
            </div>
        </div>
    </div>
</div>
</div>

<div class="login-footer">
    <ul>
        <li><a  href="#">帮助说明</a></li>
        <li><a  href="#">安全声明</a></li>
        <li><a  href="#">服务条款</a></li>
        <li><a  href="#">苹果手机端下载</a></li>
        <li style="border-right: none;"><a target="_blank" href="#">安卓手机端下载</a></li>

    </ul>
</div>
<div class="copyright">
    <span>深圳市东彦信车贷通汽车金融服务平台  - <a target="_blank" href="">深圳车资道科技有限公司</a> </span>
</div>

<script type="text/javascript">
 $(document).ready(function(){
	
	  //为inputForm注册validate函数
	  $("#loginForm2").validate({
			submitHandler: function(form){
				 var code=$("#code").val();
				var url="${ctx}/validationCode?code="+code;
				$.post(url,function(r){
					if(r.code=='200'){  
						form.submit();
			 		 }else{
			 			alert("验证码错误");
			 		}
				
				})  
			}
	  
  		});
 }); 
 
 

function changeImg() {
	var imgObj = document.getElementById("img");
	imgObj.src = "${ctx}/CheckCode?ran=" + Math.random();
}
</script>

</body>


</html>