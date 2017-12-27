<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.auth.entity.AdminPermission"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

	<form modelAttribute="adminPermission" id="inputForm" class="form-horizontal form-bordered" action="${ctx}/adminPermission/${action}" method="post">
				<input type="hidden" id="sid" name="sid" value="${adminPermission.sid}"/>
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
							<label class="col-sm-3 control-label"><%=AdminPermission.ALIAS_PERMISSION_CODE%><span class="asterisk">*</span></label>
							<div class="col-sm-4">
											<input type="text" name="permissionCode" id="permissionCode" class="form-control" placeholder="请输入<%=AdminPermission.ALIAS_PERMISSION_CODE%>..."  value="${adminPermission.permissionCode}" maxlength="64" required/>
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=AdminPermission.ALIAS_PERMISSION_NAME%><span class="asterisk">*</span></label>
							<div class="col-sm-4">
											<input type="text" name="permissionName" id="permissionName" class="form-control" placeholder="请输入<%=AdminPermission.ALIAS_PERMISSION_NAME%>..."  value="${adminPermission.permissionName}" maxlength="64" required/>
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=AdminPermission.ALIAS_DESCRIPTION%></label>
							<div class="col-sm-4">
											<input type="text" name="description" id="description" class="form-control" placeholder="请输入<%=AdminPermission.ALIAS_DESCRIPTION%>..."  value="${adminPermission.description}" maxlength="200" />
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
		  rules: {
				permissionCode: {
					remote: "${ctx}/adminPermission/checkPermissionCode?oldPermissionCode=" + encodeURIComponent('${adminPermission.permissionCode}')
				}
			},
			permissionCode: {
				userName: {
					remote: "权限编码已存在"
				}
			},
			submitHandler: function(form){
                globalSubmitHandler(form,function(json){
                	$('.bs-organization-edit-modal').modal("hide"); 
 					refreshDiv("listDiv");
                });
			}
		});
  });
</script>