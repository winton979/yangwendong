<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!doctype html>
<html lang="en">
<head>
<%@ include file="/WEB-INF/common/resource.jsp"%>
</head>

<body>
	<div class="x-body">
		<form class="layui-form" id="addForm">
			<div class="layui-form-item">
				<label class="layui-form-label"> <span class="x-red">*</span>机构编码
				</label>
				<div class="layui-input-inline">
					<input type="text" id="orgSid" name="orgSid" required="" lay-verify="" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"> <span class="x-red">*</span>登陆账户
				</label>
				<div class="layui-input-inline">
					<input type="text" id="userName" name="userName" required="" lay-verify="" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"> <span class="x-red">*</span>登录密码
				</label>
				<div class="layui-input-inline">
					<input type="text" id="userPass" name="userPass" required="" lay-verify="" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"> <span class="x-red">*</span>账号类型
				</label>
				<div class="layui-input-inline">
					<input type="text" id="userType" name="userType" required="" lay-verify="" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"> <span class="x-red">*</span>电子邮件
				</label>
				<div class="layui-input-inline">
					<input type="password" id="userEmail" name="userEmail" required="" lay-verify="" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"> <span class="x-red">*</span>昵称
				</label>
				<div class="layui-input-inline">
					<input type="password" id="nickName" name="nickName" required="" lay-verify="repass" autocomplete="off" class="layui-input">
				</div>
			</div>
		</form>
	</div>
	<script>
		
		function add() {
			$.post("/adminUser/save",$("#addForm").serialize(),function(result) {
				layer.msg('有表情地提示', {icon: 6}); 
			}); 
		}
		
	</script>
</body>

</html>