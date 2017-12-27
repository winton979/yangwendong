<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<form:form modelAttribute="adminUser" id="inputForm" class="form-horizontal form-bordered" action="${ctx}/adminUser/${action}" method="post">
	<div class="panel panel-default">
		<div class="panel-heading">
			<div class="panel-btns">
				<a href="#" class="panel-close tooltips" data-dismiss="modal" type="button"
					title="Close Panel"><i class="fa fa-times"></i></a>
			</div>
			<h4 class="panel-title"><i class="fa fa-pencil"></i> 密码修改</h4>
			<p>红色的'*'表示必填项</p>
		</div>
		<div class="panel-body nopadding">
			<div class="form-group">
				<label class="col-sm-2 control-label">旧密码<span class="asterisk">*</span></label>
				<div class="col-sm-4">
					<input type="text" name="oldPassword" class="form-control" placeholder="请输入登录账号..." maxlength="32" required/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">新密码<span class="asterisk">*</span></label>
				<div class="col-sm-4">
					<input type="text" name="newPassword" class="form-control" value="${adminUser.realName}" placeholder="请输入用户姓名..." minlength="6" maxlength="32"  required/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">重输密码<span class="asterisk">*</span></label>
				<div class="col-sm-4">
					<input type="text" name="newPassword2" class="form-control" value="${adminUser.realName}" placeholder="请输入用户姓名..." minlength="6" maxlength="32"  required/>
				</div>
			</div>
		</div>
		<!-- panel-body -->
		<div class="panel-footer">
			<div class="row">
				<div class="col-sm-9 col-sm-offset-3">
					<button class="btn btn-primary mr5">确定</button>
				</div>
			</div>
		</div>
	</div>
</form:form>
<script type="text/javascript">
	jQuery.validator.addMethod("repeat", function(value,element) {   
		var newPassword=$('input[name="newPassword"]').val()
		return newPassword==value;
	}, "请输入正确的手机号码。"); 
	$(document).ready(function(){
		$(".oldPassword").focus();
		$("#inputForm").validate({
			rules: {
	  			"newPassword2":"repeat"
			},
			submitHandler: function(form){
                globalSubmitHandler(form,function(dt){
                	if(dt.code=='200'){
                		$('#changePassword').modal("hide"); 
                	}
                });
			}
		});
  });
</script>