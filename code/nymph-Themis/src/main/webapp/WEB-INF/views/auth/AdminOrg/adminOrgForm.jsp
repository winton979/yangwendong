<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

	<form:form modelAttribute="adminOrg" id="inputForm" class="form-horizontal form-bordered" action="${ctx}/adminOrg/${action}" method="post">
				<input type="hidden" id="sid" name="sid" value="${adminOrg.sid}"/>
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-btns">
					<a href="#" class="panel-close tooltips" data-dismiss="modal" type="button" title="Close Panel"><i class="fa fa-times"></i></a>
				</div>
				<!-- panel-btns -->
				<h4 class="panel-title"><i class="fa fa-pencil"></i> 编辑信息</h4>
				<p>红色的'*'表示必填项</p>
			</div>
			<div class="panel-body nopadding">
				<%-- <div class="form-group">
					<label class="col-sm-2 control-label">上级经销商</label>
					<div class="col-sm-4">
						<input type="text" name="psid" id="selectFatherCodeid" class="width100p" placeholder="请输入上级经销商不填为一级..."  value="${adminOrg.fatherCode}" maxlength="64" />
					</div>
				</div> --%>
				<div class="form-group">
					<label class="col-sm-2 control-label">机构名称<span class="asterisk">*</span></label>
					<div class="col-sm-7">
						<input type="text" name="orgName" id="dealerName" class="form-control" placeholder="请输入机构名称..."  value="${adminOrg.orgName}" maxlength="255" required/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">状态${adminOrg.enabled}<span class="asterisk">*</span></label>
					<div class="col-sm-2">
						<select id="enabledSelectId" data-placeholder="请选择机构状态" name="enabled" class="width100p " required>
							<option value="">请选择机构状态</option>
							<c:forEach var="item" items="${enableStatus}">
								<option value="${item.key}" <c:if test="${adminOrg.enabled}"> selected="selected" </c:if>>${item.value}</option>
							</c:forEach>
							
						</select>
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
	  //为inputForm注册validate函数
	  $("#inputForm").validate({
			submitHandler: function(form){
                globalSubmitHandler(form,function(json){
                	$('.bs-organization-edit-modal').modal("hide"); 
 					refreshDiv("listDiv");
                });
			}
		});
	  $('#enabledSelectId').select2({minimumResultsForSearch:-1});
	  
	  //initRemoteDataSelect2('selectFatherCodeid',"请选择所属经销商","${ctx}/dealerInfo/listByCodeJsonFatherCode.json");
  });
</script>