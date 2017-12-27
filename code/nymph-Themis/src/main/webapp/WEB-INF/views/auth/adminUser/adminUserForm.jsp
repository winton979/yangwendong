<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<form:form modelAttribute="adminUser" id="inputForm" class="form-horizontal form-bordered" action="${ctx}/adminUser/${action}" method="post">
    <input type="hidden" name="sid" id="sid" value="${adminUser.sid}"/>
    <input type="hidden" name="version" id="version" value="${adminUser.version}"/>
    <input type="hidden" name="plainPass" id="version" value="${adminUser.plainPass}"/>
	<div class="panel panel-default">
		<div class="panel-heading">
			<div class="panel-btns">
				<a href="#" class="panel-close tooltips" data-dismiss="modal" type="button"
					title="Close Panel"><i class="fa fa-times"></i></a>
			</div>
			<!-- panel-btns -->
			<h4 class="panel-title"><i class="fa fa-pencil"></i> 账户基本信息表录入</h4>
			<p>红色的'*'表示必填项</p>
		</div>
		<div class="panel-body nopadding">
			<div class="form-group">
				<label class="col-sm-2 control-label">登录账号<span class="asterisk">*</span></label>
				<div class="col-sm-4">
					<input type="text" name="userName" id="userName" class="form-control" placeholder="请输入登录账号..."  value="${adminUser.userName}" minlength="6" maxlength="32" required/>
				</div>
				<label class="col-sm-2 control-label">用户姓名</label>
				<div class="col-sm-4">
					<input type="text" name="realName" class="form-control" value="${adminUser.realName}" placeholder="请输入用户姓名..."/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" title="机构sid${adminOrg.sid}">所属分支机构<span class="asterisk">*</span></label>
				<div class="col-sm-10">
					<select id="selectOrgSidId" data-placeholder="请选择所属分支机构..." name="adminOrgSid" class="width100p " required>
						<option value="">请选择所属分支机构...</option>
						<c:forEach var="item" items="${orgs}">
							<option value="${item.sid}" <c:if test="${adminOrg.sid eq item.sid}"> selected="selected" </c:if>>${item.orgName}</option>
						</c:forEach>
					</select>
					<%-- <input type="text" name="orgSid" id="selectOrgSidId" class="width100p" placeholder="请选择所属分支机构..."  value="${adminOrg.sid}" maxlength="64" />
				 --%>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">用户所属组<span class="asterisk">*</span></label>
				<div class="col-sm-4">
					<select id="userTypeSelectId" data-placeholder="请选择用户所属组" name="userType" class="width100p" value="${adminUser.userType}" on required>
						<option value="">请选择所属组</option>
						<c:forEach items="${userTypeMap }" var="userType">
						<option value="${userType.key}">${userType.value}</option>
						</c:forEach>
						<%-- <c:forEach items="${adminRoles}" var="userType">
						<option value="${userType.sid}">${userType.roleDesc}</option>
						</c:forEach> --%>
					</select>
				</div>
				<label class="col-sm-2 control-label">是否启用<span class="asterisk">*</span></label>
				<div class="col-sm-4">
					<select id="enabledSelectId" data-placeholder="请选是否启用" name="enabled" class="width100p" value="${adminUser.enabled}" required>
						<option value="">请选是否启用</option>
						<c:forEach items="${enabledMap}" var="enable">
						   <option value="${enable.key}">${enable.value}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<!-- fu 关联fa人员 -->
			<div class="form-group" id="faDiv" <c:if test="${empty adminUser.userRelSid}">style="display:none"</c:if>  >
				<label class="col-sm-2 control-label">关联FA人员<span class="asterisk">*</span></label>
				<div class="col-sm-4">
					<input type="text" name="userRelSid" id="selectUserRelSid" class="width100p" placeholder="请选择关联FA人员..."  value="${adminUser.userRelSid}" maxlength="64" required/>
				</div>
			</div>
			<%-- <div class="form-group">
				<label class="col-sm-2 control-label">所属4s店</label>
				<div class="col-sm-10">
					<input type="text" id="selectOrgParentSid" class="width100p" name="orgCode" value="${adminUser.orgCode}"/>
				</div>
			</div> --%>
			
			<%-- <shiro:hasPermission name="superAdmin"> --%>
			<!-- form-group -->
			<%-- <div class="form-group">
				<label class="col-sm-2 control-label">所属4s店</label>
				<div class="col-sm-10">
					<input type="text" id="selectOrgParentSid" class="width100p" name="orgCode" value="${adminUser.orgCode}"/>
				</div>
			</div>
			</shiro:hasPermission>
			<shiro:lacksPermission name="superAdmin">
			    <!-- form-group -->
				<div class="form-group">
					<label class="col-sm-2 control-label">所属4s店</label>
					<div class="col-sm-10">
						<input type="text" id="selectOrgParentSid" class="width100p" name="orgCode" value="${adminUser.orgCode}" readonly="readonly"/>
					</div>
				</div>
			</shiro:lacksPermission> --%>
			<!-- form-group -->
			
			
			<div class="form-group">
				<label class="col-sm-2 control-label">联系电话</label>
				<div class="col-sm-4">
					<input type="text" name="userTel" class="form-control" value="${adminUser.userTel}"/>
				</div>
				<label class="col-sm-2 control-label">电子邮件</label>
				<div class="col-sm-4">
					<input type="text" name="userEmail" class="form-control" value="${adminUser.userEmail}"/>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label">用户关联角色</label>
				<div class="col-sm-10">
					 <form:bscheckboxes path="adminRoles" items="${adminRoles}" itemLabel="roleDesc" itemValue="sid" cssClass="customLabelCheckBox" />
				</div>
			</div>
			 <div class="form-group">
				<label class="col-sm-2 control-label">用户关联渠道</label>
				<div class="col-sm-10">
					<form:bscheckboxes path="loansCanals" items="${loansCanals}" itemLabel="loansCanalName" itemValue="sid" cssClass="customLabelCheckBox" /> 
				</div>
			</div> 
			
			<%-- <shiro:hasPermission name="superAdmin">
			 
			</shiro:hasPermission>
			<shiro:lacksPermission name="superAdmin">
			<div class="form-group" style="display:none;">
				<label class="col-sm-2 control-label">用户关联角色</label>
				<div class="col-sm-10">
					 <form:bscheckboxes path="adminRoles" items="${adminRoles}" itemLabel="roleDesc" itemValue="sid" cssClass="customLabelCheckBox"/>
				</div>
			</div>
			</shiro:lacksPermission> --%>
			
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
      //聚焦第一个输入框
	  $("#userName").focus();
	  //为inputForm注册validate函数
	  $("#inputForm").validate({
			rules: {
				userName: {
					remote: "${ctx}/adminUser/checkLoginName?oldLoginName=" + encodeURIComponent('${adminUser.userName}')
				}
			},
			messages: {
				userName: {
					remote: "用户登录名已存在"
				}
			},
			errorPlacement: function(error, element) {
				if ( element.is(":checkbox") )
					error.appendTo(element.parent().next());
				else
					error.insertAfter(element);
			},
			submitHandler: function(form){
                globalSubmitHandler(form,function(json){
                	$('.bs-organization-edit-modal').modal("hide"); 
 					refreshDiv("listDiv");
                });
			}
		});
	  $('#userTypeSelectId').val('${adminUser.userType}').select2({minimumResultsForSearch:-1});
	  $('#enabledSelectId').val('${adminUser.enabled}').select2({minimumResultsForSearch:-1});
	  //初始化远程下拉列表单个选择的数据
	  initRemoteDataSelect2('selectOrgParentSid',"请选择所属4s店","${ctx}/organization/listByCodeJson.json");
	  
	  initRemoteDataSelect2('selectUserRelSid',"请选择关联FA人员","${ctx}/userInfo/listUserInfoByName.json");
	  
	  $('#selectOrgSidId').select2({minimumResultsForSearch:-1});
	  //initRemoteDataSelect2('selectOrgSidId',"请选择所属分支机构","${ctx}/adminOrg/listByCodeJson.json");
	  
	  
	  //上个选中的值
	  var oldSelected=null;
	  $('#userTypeSelectId').bind('change',function(){
		  var selected=$(this).find("option:selected").val();
		  console.log(selected)
		  if(oldSelected==selected){
			  return;
		  }
		  //显示下拉框
		  if(selected=='4' || selected=='5' ||  selected=='7' ){
			  $('#faDiv').show();
		  }else{
			  $('#faDiv').hide();
		  }
		  oldSelected=selected;
	  })
  });
</script>