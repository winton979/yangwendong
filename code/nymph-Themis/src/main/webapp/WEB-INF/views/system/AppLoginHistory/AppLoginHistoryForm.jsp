<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.system.entity.AppLoginHistory"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

	<form modelAttribute="appLoginHistory" id="inputForm" class="form-horizontal form-bordered" action="${ctx}/appLoginHistory/${action}" method="post">
				<input type="hidden" id="sid" name="sid" value="${appLoginHistory.sid}"/>
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
							<label class="col-sm-3 control-label"><%=AppLoginHistory.ALIAS_USER_ID%></label>
							<div class="col-sm-4">
											<input type="text" name="userId" id="userId" class="form-control" placeholder="请输入<%=AppLoginHistory.ALIAS_USER_ID%>..."  value="${appLoginHistory.userId}" maxlength="19" />
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=AppLoginHistory.ALIAS_USER_TYPE%></label>
							<div class="col-sm-4">
											<input type="text" name="userType" id="userType" class="form-control" placeholder="请输入<%=AppLoginHistory.ALIAS_USER_TYPE%>..."  value="${appLoginHistory.userType}" maxlength="10" />
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=AppLoginHistory.ALIAS_USER_DEVICE_TYPE%></label>
							<div class="col-sm-4">
											<input type="text" name="userDeviceType" id="userDeviceType" class="form-control" placeholder="请输入<%=AppLoginHistory.ALIAS_USER_DEVICE_TYPE%>..."  value="${appLoginHistory.userDeviceType}" maxlength="100" />
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=AppLoginHistory.ALIAS_USER_DEVICE_CODE%></label>
							<div class="col-sm-4">
											<input type="text" name="userDeviceCode" id="userDeviceCode" class="form-control" placeholder="请输入<%=AppLoginHistory.ALIAS_USER_DEVICE_CODE%>..."  value="${appLoginHistory.userDeviceCode}" maxlength="100" />
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=AppLoginHistory.ALIAS_USER_TOKEN%></label>
							<div class="col-sm-4">
											<input type="text" name="userToken" id="userToken" class="form-control" placeholder="请输入<%=AppLoginHistory.ALIAS_USER_TOKEN%>..."  value="${appLoginHistory.userToken}" maxlength="100" />
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=AppLoginHistory.ALIAS_USER_LOGIN_DT%><span class="asterisk">*</span></label>
							<div class="col-sm-4">
					appLoginHistory.userLoginDt
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=AppLoginHistory.ALIAS_USER_IP%></label>
							<div class="col-sm-4">
											<input type="text" name="userIp" id="userIp" class="form-control" placeholder="请输入<%=AppLoginHistory.ALIAS_USER_IP%>..."  value="${appLoginHistory.userIp}" maxlength="30" />
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