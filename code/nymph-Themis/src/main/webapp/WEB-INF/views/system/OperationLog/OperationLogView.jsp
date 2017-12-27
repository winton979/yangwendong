<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.system.entity.OperationLog"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

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
							<label class="col-sm-3 control-label"><%=OperationLog.ALIAS_OPERATED_TYPE%></label>
							<div class="col-sm-4">
<c:out value='${operationLog.operatedType}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=OperationLog.ALIAS_OPERATED_USER_ID%></label>
							<div class="col-sm-4">
<c:out value='${operationLog.operatedUserId}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=OperationLog.ALIAS_OPERATED_USER_TYPE%></label>
							<div class="col-sm-4">
<c:out value='${operationLog.operatedUserType}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=OperationLog.ALIAS_OPERATED_DES%></label>
							<div class="col-sm-4">
<c:out value='${operationLog.operatedDes}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=OperationLog.ALIAS_OPERATED_SOURCE%></label>
							<div class="col-sm-4">
<c:out value='${operationLog.operatedSource}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=OperationLog.ALIAS_OPERATED_TARGET%></label>
							<div class="col-sm-4">
<c:out value='${operationLog.operatedTarget}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=OperationLog.ALIAS_OPERATED_DT%></label>
							<div class="col-sm-4">
<c:out value='${operationLog.operatedDtString}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=OperationLog.ALIAS_OPERATED_OBJECT_ID%></label>
							<div class="col-sm-4">
<c:out value='${operationLog.operatedObjectId}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=OperationLog.ALIAS_OPERATED_CLASS%></label>
							<div class="col-sm-4">
<c:out value='${operationLog.operatedClass}'/>							</div>
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