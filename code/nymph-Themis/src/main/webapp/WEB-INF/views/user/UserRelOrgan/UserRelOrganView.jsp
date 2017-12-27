<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.user.entity.UserRelOrgan"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-btns">
					<a href="#" class="panel-close tooltips" data-dismiss="modal" type="button"
						title="Close Panel"><i class="fa fa-times"></i></a>
				</div>
				<!-- panel-btns -->
				<h4 class="panel-title"><i class="fa fa-pencil"></i> 查看信息</h4>
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
							<input type="text" class="form-control" value="${enabledMap[userRelOrgan.status]}" readonly="readonly"/>
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
	  //初始化远程下拉列表单个选择的数据
	  initRemoteDataSelect2('selectOrgParentSid',"请选择<%=UserRelOrgan.ALIAS_ORG_CODE%>","${ctx}/organization/listByCodeJson.json");
	  initRemoteDataSelect2('selectUserSid',"请选择<%=UserRelOrgan.ALIAS_USER_SID%>","${ctx}/userInfo/select2List.json");
  });
</script>