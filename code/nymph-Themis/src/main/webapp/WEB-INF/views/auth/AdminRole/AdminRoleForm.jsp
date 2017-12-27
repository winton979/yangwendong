<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.auth.entity.AdminRole"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
	<form:form modelAttribute="adminRole" id="inputForm" class="form-horizontal form-bordered" action="${ctx}/adminRole/${action}" method="post">
				<input type="hidden" id="sid" name="sid" value="${adminRole.sid}"/>
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
							<label class="col-sm-2 control-label"><%=AdminRole.ALIAS_ROLE_CODE%><span class="asterisk">*</span></label>
							<div class="col-sm-10">
											<input type="text" name="roleCode" id="roleCode" class="form-control" placeholder="请输入<%=AdminRole.ALIAS_ROLE_CODE%>..."  value="${adminRole.roleCode}" maxlength="32" required/>
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-2 control-label"><%=AdminRole.ALIAS_ROLE_DESC%></label>
							<div class="col-sm-10">
											<input type="text" name="roleDesc" id="roleDesc" class="form-control" placeholder="请输入<%=AdminRole.ALIAS_ROLE_DESC%>..."  value="${adminRole.roleDesc}" maxlength="200" />
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-2 control-label"><%=AdminRole.ALIAS_STATUS%><span class="asterisk">*</span></label>
							<div class="col-sm-10">
								<select id="enabledSelectId" data-placeholder="请选择是否启用" name="status" class="width200" required>
										<option value="">请选是否启用</option>
										<c:forEach items="${enabledMap}" var="enable">
										   <option value="${enable.key}">${enable.value}</option>
										</c:forEach>
									</select>
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-2 control-label">角色关联权限</label>
							<div class="col-sm-10">
								 <form:bscheckboxes path="adminPermissions" items="${perissionList}" itemLabel="permissionName" itemValue="sid" cssClass="customLabelCheckBox" />
								<%-- <input type="text" id="roleRelPerissions" class="width100p" name="roleRelPerissions" value="${adminRole.roleRelPerissions}" required/> --%>
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
	</form:form>
<!--modal-body-->
<script type="text/javascript">
  $(document).ready(function(){
	  $('#enabledSelectId').val('${adminRole.status}').select2({minimumResultsForSearch:-1});
	  //为inputForm注册validate函数
	  $("#inputForm").validate({
		  rules: {
			  roleCode: {
					remote: "${ctx}/adminRole/checkRoleCode?oldRoleCode=" + encodeURIComponent('${adminRole.roleCode}')
				}
			},
			messages: {
				roleCode: {
					remote: "角色编码已存在"
				}
			},
			submitHandler: function(form){
                globalSubmitHandler(form,function(json){
                	$('.bs-organization-edit-modal').modal("hide"); 
 					refreshDiv("listDiv");
                });
			}
		});
	  //初始化远程下拉列表选择的数据
	  //initRemoteDataSelect2('roleRelPerissions',"请选择拥有权限","${ctx}/adminPermission/selectListBySelect2.json",true,-1);
  });
</script>