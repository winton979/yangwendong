<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.system.entity.OperationLog"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

	<form modelAttribute="operationLog" id="inputForm" class="form-horizontal form-bordered" action="${ctx}/operationLog/${action}" method="post">
				<input type="hidden" id="sid" name="sid" value="${operationLog.sid}"/>
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
							<label class="col-sm-3 control-label"><%=OperationLog.ALIAS_OPERATED_TYPE%></label>
							<div class="col-sm-4">
											<input type="text" name="operatedType" id="operatedType" class="form-control" placeholder="请输入<%=OperationLog.ALIAS_OPERATED_TYPE%>..."  value="${operationLog.operatedType}" maxlength="30" />
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=OperationLog.ALIAS_OPERATED_USER_ID%></label>
							<div class="col-sm-4">
											<input type="text" name="operatedUserId" id="operatedUserId" class="form-control" placeholder="请输入<%=OperationLog.ALIAS_OPERATED_USER_ID%>..."  value="${operationLog.operatedUserId}" maxlength="19" />
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=OperationLog.ALIAS_OPERATED_USER_TYPE%></label>
							<div class="col-sm-4">
											<input type="text" name="operatedUserType" id="operatedUserType" class="form-control" placeholder="请输入<%=OperationLog.ALIAS_OPERATED_USER_TYPE%>..."  value="${operationLog.operatedUserType}" maxlength="10" />
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=OperationLog.ALIAS_OPERATED_DES%></label>
							<div class="col-sm-4">
											<input type="text" name="operatedDes" id="operatedDes" class="form-control" placeholder="请输入<%=OperationLog.ALIAS_OPERATED_DES%>..."  value="${operationLog.operatedDes}" maxlength="500" />
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=OperationLog.ALIAS_OPERATED_SOURCE%></label>
							<div class="col-sm-4">
											<input type="text" name="operatedSource" id="operatedSource" class="form-control" placeholder="请输入<%=OperationLog.ALIAS_OPERATED_SOURCE%>..."  value="${operationLog.operatedSource}" maxlength="65535" />
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=OperationLog.ALIAS_OPERATED_TARGET%></label>
							<div class="col-sm-4">
											<input type="text" name="operatedTarget" id="operatedTarget" class="form-control" placeholder="请输入<%=OperationLog.ALIAS_OPERATED_TARGET%>..."  value="${operationLog.operatedTarget}" maxlength="65535" />
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=OperationLog.ALIAS_OPERATED_DT%><span class="asterisk">*</span></label>
							<div class="col-sm-4">
					operationLog.operatedDt
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=OperationLog.ALIAS_OPERATED_OBJECT_ID%></label>
							<div class="col-sm-4">
											<input type="text" name="operatedObjectId" id="operatedObjectId" class="form-control" placeholder="请输入<%=OperationLog.ALIAS_OPERATED_OBJECT_ID%>..."  value="${operationLog.operatedObjectId}" maxlength="19" />
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=OperationLog.ALIAS_OPERATED_CLASS%></label>
							<div class="col-sm-4">
											<input type="text" name="operatedClass" id="operatedClass" class="form-control" placeholder="请输入<%=OperationLog.ALIAS_OPERATED_CLASS%>..."  value="${operationLog.operatedClass}" maxlength="200" />
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