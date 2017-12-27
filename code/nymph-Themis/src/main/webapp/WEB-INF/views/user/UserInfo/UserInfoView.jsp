<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.user.entity.UserInfo"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

	<form:form modelAttribute="userInfo" id="inputForm" class="form-horizontal form-bordered" action="${ctx}/userInfo/${action}" method="post">
				<input type="hidden" id="sid" name="sid" value="${userInfo.sid}"/>
				<input type="hidden" name="icon" id="portrait" value="${userInfo.icon}"/>
				<input type="hidden" name="type" id="portrait" value="${userInfo.type}"/>
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
			<div class="panel-body no-padding">
				  <!-- form-group -->
				  <%-- <div class="form-group">
					<label class="col-sm-2 control-label"><%=UserInfo.ALIAS_ICON%></label>
					<div class="col-sm-10">
						<div style="width: 120px;" class="fileupload-new thumbnail">
						  <c:if test="${empty userInfo.portraitUrl}">
						    <img id="previewThumbnailImage" src="http://www.placehold.it/120x120/EFEFEF/AAAAAA" alt="" style="width:120px;height:120px">
						   </c:if>
						  <c:if test="${!empty userInfo.portraitUrl}">
						    <img id="previewThumbnailImage" src="${rootUrl }${userInfo.portraitUrl}" alt="" style="width:120px;height:120px">
						   </c:if>
						</div>
					</div>
				 </div> --%>
			
					<!-- form-group -->
					<div class="form-group">
						<label class="col-sm-2 control-label"><%=UserInfo.ALIAS_NAME%><span class="asterisk">*</span></label>
						<div class="col-sm-4">
							<input type="text" name="name" id="name" class="form-control" placeholder="请输入<%=UserInfo.ALIAS_NAME%>..." disabled="disabled"  value="${userInfo.name}" maxlength="64" required/>
						</div>
						<label class="col-sm-2 control-label"><%=UserInfo.ALIAS_NICKNAME%></label>
						<div class="col-sm-4">
							<input type="text" name="nickname" id="nickname" class="form-control" placeholder="请输入<%=UserInfo.ALIAS_NICKNAME%>..." disabled="disabled" value="${userInfo.nickname}" maxlength="64" />
						</div>
					</div>
					
					<!-- form-group -->
					<div class="form-group">
						<label class="col-sm-2 control-label"><%=UserInfo.ALIAS_TEL%><span class="asterisk">*</span></label>
						<div class="col-sm-4">
							<input type="text" name="tel" id="tel" class="form-control" placeholder="请输入<%=UserInfo.ALIAS_TEL%>..." disabled="disabled" value="${userInfo.tel}" maxlength="15" required/>
						</div>
						<label class="col-sm-2 control-label"><%=UserInfo.ALIAS_SEX%><span class="asterisk">*</span></label>
						<div class="col-sm-4">
       						<input type="text" disabled="disabled" class="form-control" value="${sexMap[userInfo.sex]}" maxlength="100"/>
						</div>
					</div>
					
					<!-- form-group -->
					<div class="form-group">
						<label class="col-sm-2 control-label"><%=UserInfo.ALIAS_BIRTHDAY%></label>
						<div class="col-sm-4">
				    		<input type="text" name="birthdayString" class="form-control" disabled="disabled" value="${userInfo.birthdayString}" placeholder="yyyy-MM-dd" id="birthdayDatepicker">
						</div>
						<label class="col-sm-2 control-label"><%=UserInfo.ALIAS_STATUS%><span class="asterisk">*</span></label>
						<div class="col-sm-4">
							<input type="text" disabled="disabled" class="form-control" value="${enabledMap[userInfo.status]}" maxlength="100"/>
						</div>
					</div>
					
					<!-- form-group -->
					<div class="form-group">
						<label class="col-sm-2 control-label">现住地址</label>
						<div class="col-sm-2">
							<select id="proivnceSelectId" data-placeholder="请选择省份" disabled="disabled" name="province" class="width100p" onchange="javascript:onchangeProivnceSelected(this.value);">
								<option value="">请选择省份</option>
							</select>
						</div>
						<div class="col-sm-2">
							<select id="citySelectId" data-placeholder="请选择城市" name="city" disabled="disabled" class="width100p" onchange="javascript:onchangeCitySelected(this.value);">
								<option value="">请选择城市</option>
							</select>
						</div>
						<div class="col-sm-2">
							<select id="districtSelectId" name="zone" disabled="disabled" data-placeholder="请选择市区、县、镇" class="width100p">
								<option value="">请选择市区、县、镇</option>
							</select>
						</div>
						<div class="col-sm-4">
							<input type="text" name="address" id="address" disabled="disabled" class="form-control" placeholder="请输入<%=UserInfo.ALIAS_ADDRESS%>..."  value="${userInfo.address}" maxlength="100"/>
						</div>
					</div>
					
					<!-- form-group -->
					<div class="form-group">
						<label class="col-sm-2 control-label"><%=UserInfo.ALIAS_IDCARD%></label>
						<div class="col-sm-4">
										<input type="text" name="idcard" id="idcard" disabled="disabled" class="form-control" placeholder="请输入<%=UserInfo.ALIAS_IDCARD%>..."  value="${userInfo.idcard}" maxlength="32" />
						</div>
						<label class="col-sm-2 control-label"><%=UserInfo.ALIAS_IDADDRESS%></label>
						<div class="col-sm-4">
										<input type="text" name="idaddress" id="idaddress" disabled="disabled" class="form-control" placeholder="请输入<%=UserInfo.ALIAS_IDADDRESS%>..."  value="${userInfo.idaddress}" maxlength="255" />
						</div>
					</div>
					
					<!-- form-group -->
					<div class="form-group">
						<label class="col-sm-2 control-label"><%=UserInfo.ALIAS_QQ%></label>
						<div class="col-sm-4">
										<input type="text" name="qq" id="qq" disabled="disabled" class="form-control" placeholder="请输入<%=UserInfo.ALIAS_QQ%>..."  value="${userInfo.qq}" maxlength="15" />
						</div>
						<label class="col-sm-2 control-label"><%=UserInfo.ALIAS_EMAIL%></label>
						<div class="col-sm-4">
										<input type="text" name="email" id="email" disabled="disabled" class="form-control" placeholder="请输入<%=UserInfo.ALIAS_EMAIL%>..."  value="${userInfo.email}" maxlength="32" />
						</div>
					</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-2 control-label"><%=UserInfo.ALIAS_REMARK%></label>
							<div class="col-sm-10">
								<textarea rows="5" name="remark" class="form-control" disabled="disabled" placeholder="请输入<%=UserInfo.ALIAS_REMARK%>..." maxlength="500">${userInfo.remark}</textarea>
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
	</form:form>
<!--modal-body-->
<script type="text/javascript">
  $(document).ready(function(){
	  $('#proivnceSelectId').select2({minimumResultsForSearch:-1});
	  $('#citySelectId').select2({minimumResultsForSearch:-1});
	  $('#districtSelectId').select2({minimumResultsForSearch:-1});
	  
	  //初始下拉列表
	  $('#enabledSelectId').val('${userInfo.status}').select2({minimumResultsForSearch:-1,placeholder:'请选择是否可用'});
	  $('#sexSelectId').val("${userInfo.sex}").select2({minimumResultsForSearch:-1,placeholder:'请选择性别'});
	  
	  var proivnceSelectId = '${userInfo.province}';
	  initProivnceSelectOpt('proivnceSelectId',proivnceSelectId,'',function(){
		  if(proivnceSelectId){
			  $('#proivnceSelectId').val(proivnceSelectId).select2({minimumResultsForSearch:-1});
			  var citySelectId = '${userInfo.city}';
			  if(citySelectId){
				  initCitySelectOpt('citySelectId',citySelectId,proivnceSelectId,function(){
					  $('#citySelectId').val(citySelectId).select2({minimumResultsForSearch:-1});
					  
					  var districtSelectId = '${userInfo.zone}';
					  if(districtSelectId){
						  initDistrictSelectOpt('districtSelectId',districtSelectId,citySelectId,function(){
							  $('#districtSelectId').val(districtSelectId).select2({minimumResultsForSearch:-1});
						  });
					  }
				  });
			  }
		  }
	  });
  });
</script>