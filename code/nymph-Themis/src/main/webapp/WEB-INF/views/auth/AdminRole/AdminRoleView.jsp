<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.auth.entity.AdminRole"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<form:form modelAttribute="adminRole" class="form-horizontal form-bordered">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-btns">
					<a href="#" class="panel-close tooltips" data-dismiss="modal" type="button"
						title="Close Panel"><i class="fa fa-times"></i></a>
				</div>
				<!-- panel-btns -->
				<h4 class="panel-title"><i class="fa fa-pencil"></i>查看信息</h4>
				<p>显示详细的基本信息</p>
			</div>
			<div class="panel-body nopadding">
			
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=AdminRole.ALIAS_ROLE_CODE%></label>
							<div class="col-sm-4">
<c:out value='${adminRole.roleCode}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=AdminRole.ALIAS_ROLE_DESC%></label>
							<div class="col-sm-4">
<c:out value='${adminRole.roleDesc}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=AdminRole.ALIAS_STATUS%></label>
							<div class="col-sm-4">${enabledMap[adminRole.status]}</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=AdminRole.ALIAS_CREATED_DT%></label>
							<div class="col-sm-4">
<c:out value='${adminRole.createdDtString}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label">权限</label>
							<div class="col-sm-4">
								<form:bscheckboxes path="adminPermissions" items="${adminRole.adminPermissions}" itemLabel="permissionName" itemValue="sid" cssClass="customLabelCheckBox" disabled="true"/>
							</div>
						</div>
			</div>
			<!-- panel-body -->
			<div class="panel-footer">
				<div class="row">
					<div class="col-sm-9 col-sm-offset-3">
					</div>
				</div>
			</div>
			<!-- panel-footer -->
		</div>
		<!-- panel -->
<!--modal-body-->
</form:form>