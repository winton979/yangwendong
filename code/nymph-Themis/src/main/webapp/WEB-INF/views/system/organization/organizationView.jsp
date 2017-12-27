<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

   <c:if test="${not empty message}">
	  <div class="alert alert-danger">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <strong>${message}</strong>
     </div>
    </c:if>
	<form modelAttribute="organization" id="inputForm" class="form-horizontal form-bordered" action="${ctx}/organization/${action}" method="post">
		<input type="hidden" name="sid" value="${organization.sid}"/>
		<input type="hidden" name="longitude" id="longitude" value="${organization.longitude}"/>
		<input type="hidden" name="latitude" id="latitude" value="${organization.latitude}"/>
		<input type="hidden" name="orgLicense" id="orgLicense" value="${organization.orgLicense}"/>
		<input type="hidden" name="version" value="${organization.version}"/>
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-btns">
					<a href="#" class="panel-close tooltips" data-dismiss="modal" type="button"
						title="Close Panel"><i class="fa fa-times"></i></a>
				</div>
				<!-- panel-btns -->
				<h4 class="panel-title"><i class="fa fa-pencil "></i> 车行基本信息表录入</h4>
				<p>包括车行名称、车行地址、车行资质信息等。红色的'*'表示必填项</p>
			</div>
			<div class="panel-body nopadding">
				<%-- <shiro:lacksPermission name="superAdmin">
					<div class="form-group">
						<label class="col-sm-2 control-label">上级4S店</label>
						<div class="col-sm-4">
							<input type="text" id="selectOrgParentSid" class="width300" name="orgParentSid" value="${organization.orgParentSid}" disabled="disabled"/>
						</div>
					</div>
				</shiro:lacksPermission>
				<shiro:hasPermission name="superAdmin">
					<div class="form-group">
						<label class="col-sm-2 control-label">上级4S店</label>
						<div class="col-sm-4">
							<input type="text" id="selectOrgParentSid" class="width300" name="orgParentSid" value="${organization.orgParentSid}" disabled="disabled"/>
						</div>
					</div>
				</shiro:hasPermission> --%>
				<!-- form-group -->

				<!-- form-group -->
				<div class="form-group">
					<label class="col-sm-2 control-label">车行LOGO </label>
						<div class="col-sm-4" id="thumbnailtest">
							<div style="width: 120px;" class="fileupload-new thumbnail">
							  <c:if test="${empty thumbnailUrl}">
							    <img id="previewThumbnailImage" src="http://www.placehold.it/120x120/EFEFEF/AAAAAA" alt="">
							   </c:if>
							  <c:if test="${!empty thumbnailUrl}">
							    <img id="previewThumbnailImage" src="${thumbnailUrl}" alt="" style="width: 120px;height: 120px;">
							   </c:if>
							</div>
						</div>
				</div>
				<!-- form-group -->

				<div class="form-group">
					<label class="col-sm-2 control-label">车行名称 <span
						class="asterisk">*</span></label>
					<div class="col-sm-4">
						<input type="text" name="orgName" id="orgName" class="form-control" required placeholder="请输入4S店名称..."  value="${organization.orgName}" disabled="disabled"/>
					</div>
					<label class="col-sm-2 control-label">车行资质 <span class="asterisk">*</span></label>
					<div class="col-sm-4">
						<input type="text" name="orgQualifications" class="form-control" value="${organization.orgQualifications}" disabled="disabled"/>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">车行负责人<span class="asterisk">*</span></label>
					<div class="col-sm-4">
						<input type="text" name="contactPerson" class="form-control" value="${organization.contactPerson}" disabled="disabled"/>
					</div>
					<label class="col-sm-2 control-label">联系电话 <span class="asterisk">*</span></label>
					<div class="col-sm-4">
						<input type="text" name="contactTel" class="form-control" value="${organization.contactTel}" disabled="disabled"/>
					</div>
				</div>
				<!-- form-group -->
				<div class="form-group">
					<label class="col-sm-2 control-label">地址信息 <span class="asterisk">*</span></label>
					<!-- <div class="col-sm-2">
						<select id="countrySelectId" data-placeholder="请选择国家" name="country" class="width100p" onchange="javascript:onchangeCountrySelected(this.value);">
							<option value="">请选择国家</option>
						</select>
					</div> -->
					<div class="col-sm-2">
						<select id="proivnceSelectId" data-placeholder="请选择省份" name="province" class="width100p" disabled="disabled" onchange="javascript:onchangeProivnceSelected(this.value);" >
							<option value="">请选择省份</option>
						</select>
					</div>
					<div class="col-sm-2">
						<select id="citySelectId" data-placeholder="请选择城市" name="city" class="width100p" disabled="disabled" onchange="javascript:onchangeCitySelected(this.value);">
							<option value="">请选择城市</option>
						</select>
					</div>
					<div class="col-sm-2">
						<select id="districtSelectId" name="zone" data-placeholder="请选择市区、县、镇" class="width100p" disabled="disabled">
							<option value="">请选择市区、县、镇</option>
						</select>
					</div>
					<div class="col-sm-4">
						<input type="text" name="address" id="address" class="form-control" disabled="disabled" onchange="javascript:getLL();" value="${organization.address}"/>
					</div>
				</div>
				<!-- form-group -->
				<div class="form-group">
					<label class="col-sm-2 control-label">车行描述 <span
						class="asterisk">*</span></label>
					<div class="col-sm-10">
						<textarea rows="5" name="orgDescription" class="form-control" disabled="disabled" placeholder="请输入4S店描述...">${organization.orgDescription}</textarea>
					</div>
				</div>
				<!-- form-group -->
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
	</form>
<!--modal-body-->
<script type="text/javascript">
  $(document).ready(function(){
      //聚焦第一个输入框
	  $("#orgName").focus();
	  $('#proivnceSelectId').select2();
	  $('#citySelectId').select2();
	  $('#districtSelectId').select2();
	  var proivnceSelectId = '${organization.province}';
	  initProivnceSelectOpt('proivnceSelectId',proivnceSelectId,'',function(){
		  if(proivnceSelectId){
			  $('#proivnceSelectId').val(proivnceSelectId).select2();
			  var citySelectId = '${organization.city}';
			  if(citySelectId){
				  initCitySelectOpt('citySelectId',citySelectId,proivnceSelectId,function(){
					  $('#citySelectId').val(citySelectId).select2();
					  
					  var districtSelectId = '${organization.zone}';
					  if(districtSelectId){
						  initDistrictSelectOpt('districtSelectId',districtSelectId,citySelectId,function(){
							  $('#districtSelectId').val(districtSelectId).select2();
						  });
					  }
				  });
			  }
		  }
	  });
	  //初始化远程下拉列表单个选择的数据
	  //initRemoteDataSelect2('selectOrgParentSid',"请选择上级4S店","${ctx}/organization/listByJson.json?orgParentSid=0");
	  
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
  
  //国家下拉改变，级联的省，市，区都要发生改变
  function onchangeCountrySelected(value){
	  initProivnceSelectOpt('proivnceSelectId','',value);
	  onchangeProivnceSelected();
	  onchangeCitySelected();
	  $('#proivnceSelectId',$('#inputForm')).select2();
  }
  //省下拉改变，级联城市发生改变
  function onchangeProivnceSelected(value){
	  initCitySelectOpt('citySelectId','',value);
	  onchangeCitySelected();
	  $('#citySelectId',$('#inputForm')).select2();
  }
  //城市下拉改变，级联区下拉改变
  function onchangeCitySelected(value){
	  initDistrictSelectOpt('districtSelectId','',value);
	  $('#districtSelectId',$('#inputForm')).select2();
  }
  //获取经度和纬度
  function getLL(){
      var province = $('#proivnceSelectId').find('option:selected').text();
      var city = $('#citySelectId').find('option:selected').text();
      var district = $('#districtSelectId').find('option:selected').text();
      var address = $("#address").val();
      if (province == "" || city == "" || district == "" || address == "") {
          return false;
      }
      var myGeo = new BMap.Geocoder();
      var myAddress = province + city + district + address;
      var longitude = 0;
      var latitude = 0;
      myGeo.getPoint(myAddress, function (point) {
          if (point) {
              longitude = point.lng;
              latitude = point.lat;
              $("#longitude").val(longitude);
              $("#latitude").val(latitude);
          }
      });
	}
</script>