<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.system.entity.ForgotPasswrodHistory"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

	<form modelAttribute="forgotPasswrodHistory" id="inputForm" class="form-horizontal form-bordered" action="${ctx}/forgotPasswrodHistory/${action}" method="post">
				<input type="hidden" id="sid" name="sid" value="${forgotPasswrodHistory.sid}"/>
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-btns">
					<a href="#" class="panel-close tooltips" data-dismiss="modal" type="button"
						title="Close Panel"><i class="fa fa-times"></i></a>
				</div>
				<!-- panel-btns -->
				<h4 class="panel-title"><i class="fa fa-pencil"></i> 编辑信息</h4>
				<p>红色的'*'表示必填项</p>
			</div>
			<div class="panel-body nopadding">
			
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=ForgotPasswrodHistory.ALIAS_USER_SID%></label>
							<div class="col-sm-4">
											<input type="text" name="userSid" id="userSid" class="form-control" placeholder="请输入<%=ForgotPasswrodHistory.ALIAS_USER_SID%>..."  value="${forgotPasswrodHistory.userSid}" maxlength="19" />
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=ForgotPasswrodHistory.ALIAS_USER_TYPE%></label>
							<div class="col-sm-4">
											<input type="text" name="userType" id="userType" class="form-control" placeholder="请输入<%=ForgotPasswrodHistory.ALIAS_USER_TYPE%>..."  value="${forgotPasswrodHistory.userType}" maxlength="10" />
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=ForgotPasswrodHistory.ALIAS_USER_TEL%></label>
							<div class="col-sm-4">
											<input type="text" name="userTel" id="userTel" class="form-control" placeholder="请输入<%=ForgotPasswrodHistory.ALIAS_USER_TEL%>..."  value="${forgotPasswrodHistory.userTel}" maxlength="20" />
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=ForgotPasswrodHistory.ALIAS_AUTH_CODE%></label>
							<div class="col-sm-4">
											<input type="text" name="authCode" id="authCode" class="form-control" placeholder="请输入<%=ForgotPasswrodHistory.ALIAS_AUTH_CODE%>..."  value="${forgotPasswrodHistory.authCode}" maxlength="10" />
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=ForgotPasswrodHistory.ALIAS_VALID_TIME%></label>
							<div class="col-sm-4">
					forgotPasswrodHistory.validTime
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=ForgotPasswrodHistory.ALIAS_STATUS%></label>
							<div class="col-sm-4">
											<input type="text" name="status" id="status" class="form-control" placeholder="请输入<%=ForgotPasswrodHistory.ALIAS_STATUS%>..."  value="${forgotPasswrodHistory.status}" maxlength="10" />
							</div>
						</div>
				
			</div>
			<!-- panel-body -->
			<div class="panel-footer">
				<div class="row">
					<div class="col-sm-9 col-sm-offset-3">
						<button class="btn btn-primary mr5">提交</button>
						<button type="reset" class="btn btn-dark">重置</button>
					</div>
				</div>
			</div>
			<!-- panel-footer -->
		</div>
		<!-- panel -->
	</form>
<!--modal-body-->
<script type="text/javascript">
  $(document).ready(function(){
	  //为inputForm注册validate函数
	  $("#inputForm").validate({
			submitHandler: function(form){
                globalSubmitHandler(form,function(json){
                	$('.bs-organization-edit-modal').modal("hide"); 
 					refreshDiv("listDiv");
                });
			}
		});
  });
</script>