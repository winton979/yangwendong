<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.user.entity.UserRelOrgan"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

	<form:form modelAttribute="userRelOrgan" id="inputForm" class="form-horizontal form-bordered" action="${ctx}/userRelOrgan/${action}" method="post">
				<input type="hidden" id="sid" name="sid" value="${userRelOrgan.sid}"/>
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
							<label class="col-sm-2 control-label"><%=UserRelOrgan.ALIAS_USER_SID%><span class="asterisk">*</span></label>
							<div class="col-sm-10">
								<input type="text" id="selectUserSid" class="width100p" name="userSid" value="${userRelOrgan.userSid}"
								 <c:if test="${!empty userRelOrgan.sid}">readonly="readonly"</c:if>/>
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-2 control-label"><%=UserRelOrgan.ALIAS_ORG_CODE%><span class="asterisk">*</span></label>
							<div class="col-sm-10">
								<input type="text" id="selectOrgParentSid" class="width100p" name="orgCode" value="${userRelOrgan.orgCode}"
								<c:if test="${!empty userRelOrgan.sid}">readonly="readonly"</c:if>/>
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-2 control-label"><%=UserRelOrgan.ALIAS_STATUS%></label>
							<div class="col-sm-10">
								<form:select path="status" id="statusSelectId" cssClass="width100p">
									<option/>请选择<%=UserRelOrgan.ALIAS_STATUS%>
           						    <form:options items="${enabledMap}"/>  
        							</form:select>
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-2 control-label">关联用户类型</label>
							<div class="col-sm-10">
								<form:select path="relationType" id="relationTypeSelectId" cssClass="width100p">
									<option/>请选择关联用户类型
           						    <form:options items="${relationTypeMap}"/>  
        							</form:select>
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
	  $('#statusSelectId').select2({minimumResultsForSearch:-1,placeholder:'请选择<%=UserRelOrgan.ALIAS_STATUS%>'});
	  $('#relationTypeSelectId').select2({minimumResultsForSearch:-1,placeholder:'请选择关联用户类型'});
	  //初始化远程下拉列表单个选择的数据
	  initRemoteDataSelect2('selectOrgParentSid',"请选择<%=UserRelOrgan.ALIAS_ORG_CODE%>","${ctx}/organization/listByCodeJson.json");
	  initRemoteDataSelect2('selectUserSid',"请选择<%=UserRelOrgan.ALIAS_USER_SID%>","${ctx}/userInfo/select2List.json");
  });
</script>