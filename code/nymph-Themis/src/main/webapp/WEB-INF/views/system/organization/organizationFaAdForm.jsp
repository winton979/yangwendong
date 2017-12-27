<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

   <c:if test="${not empty message}">
	  <div class="alert alert-danger">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <strong>${message}</strong>
     </div>
     
     

	     
    </c:if>
	<form:form modelAttribute="organization" id="inputForm" class="form-horizontal form-bordered" action="${ctx}/organization/${action}" method="post">
		<input id="sid" type="hidden" name="sid" value="${organization.sid}"/>
		<input type="hidden" name="longitude" id="longitude" value="${organization.longitude}"/>
		<input type="hidden" name="latitude" id="latitude" value="${organization.latitude}"/>
		<input type="hidden" name="orgLicense" id="orgLicense" value="${organization.orgLicense}"/>
		<input type="hidden" name="version" value="${organization.version}"/>
		<input type="hidden" name="orgAttrvalueInfo.cooperationImg" id="cooperationImg" value="${organization.orgAttrvalueInfo.cooperationImg}"/>
		<input type="hidden" name="orgAttrvalueInfo.accountImg" id="accountImg" value="${organization.orgAttrvalueInfo.accountImg}"/>
		<input type="hidden" name="orgAttrvalueInfo.businessLicenseImg"  id="businessLicenseImg"  value="${organization.orgAttrvalueInfo.businessLicenseImg}"/>
		<input type="hidden" name="orgAttrvalueInfo.tableInfoImg" id="tableInfoImg" value="${organization.orgAttrvalueInfo.tableInfoImg}"/>
		<input type="hidden" name="orgAttrvalueInfo.workshopImg" id="workshopImg" value="${organization.orgAttrvalueInfo.workshopImg}"/>
		<input type="hidden" name="orgAttrvalueInfo.shopPriceImg" id="shopPriceImg" value="${organization.orgAttrvalueInfo.shopPriceImg}"/>
		<input type="hidden" name="orgAttrvalueInfo.kagairoImg" id="kagairoImg"  value="${organization.orgAttrvalueInfo.kagairoImg}"/>
			<input type="hidden" name="carResources"   value="${organization.carResources}"/>
		
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
				<div class="form-group">
					<label class="col-sm-2 control-label">车行LOGO</label>
						<div class="col-sm-4" id="thumbnailtest">
							<div style="width: 120px;" class="fileupload-new thumbnail">
							  <c:if test="${empty thumbnailUrl}">
							    <img id="previewThumbnailImage" src="http://www.placehold.it/120x120/EFEFEF/AAAAAA" alt="">
							   </c:if>
							  <c:if test="${!empty thumbnailUrl}">
							    <img id="previewThumbnailImage" src="${thumbnailUrl}" alt="" style="width:120px;height: 120px;">
							   </c:if>
							</div>
							<div class="btn-list">
				        		<a href="javascript:void(0);" id="thumbnailBtn" class="btn btn-primary btn-sm">选择文件</a>
				        		<a href="javascript:void(0);" id="deleteThumbnailBtn" class="btn btn-danger btn-sm">删除图片</a>
			                </div>
						</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label">所属经销商 <span class="asterisk">*</span></label>
					<div class="col-sm-4">
						<input type="text" name="faCode" id="selectFaCodeid" class="width100p" placeholder="请输入所属经销商..."  value="${organization.faCode}" maxlength="64" required  <c:if test="${formEdit eq 'non' }">readonly="readonly"</c:if>/>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label">车行名称 <span
						class="asterisk">*</span></label>
					<div class="col-sm-4">
						<input type="text" name="orgName" id="orgName" class="form-control" required placeholder="请输入4S店名称..."  value="${organization.orgName}" required/>
					</div>
					
					<label class="col-sm-2 control-label">车行资质</label>
					<div class="col-sm-4">
						<input type="text" name="orgQualifications" class="form-control" value="${organization.orgQualifications}"/>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label">车行负责人<span class="asterisk">*</span></label>
					<div class="col-sm-4">
						<input type="text" name="contactPerson" class="form-control" value="${organization.contactPerson}"/>
					</div>
					<label class="col-sm-2 control-label">联系电话</label>
					<div class="col-sm-4">
						<input type="text" name="contactTel" class="form-control" value="${organization.contactTel}"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">是否签约</label>
					<div class="col-sm-4">
						<div class="rdio rdio-primary">
                            <input type="radio" name="signedStatus" <c:if test="${organization.signedStatus == 0}"> checked="checked" </c:if> value="0" id="radioPrimary" />
                            <label for="radioPrimary">未签约</label>
                        </div>                              
                        <div class="rdio rdio-primary">
                             <input type="radio" name="signedStatus" <c:if test="${organization.signedStatus == 1}"> checked="checked" </c:if> value="1" id="radioWarning" />
                             <label for="radioWarning">签约</label>
                        </div>
					</div>
					<label class="col-sm-2 control-label">车行类型</label>
					<div class="col-sm-4">
							<select id="orgTypeSelectId" data-placeholder="请选择店面类型" name="orgType" class="width100p"  required>
								<c:forEach items="${orgType}" var="ty">
									
									<option value="${ty.key}" <c:if test="${ty.key ==organization.orgType}">selected="selected" </c:if>>${ty.value}</option>
								</c:forEach>
							</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">开户行<span class="asterisk">*</span></label>
					<div class="col-sm-4">
						<input type="text" class="form-control" name="openingBank" value="${organization.openingBank}"/>
					</div>
					<label class="col-sm-2 control-label">对公账号<span class="asterisk">*</span></label>
					<div class="col-sm-4">
					<input type="text" class="form-control" name="bankAccount" value="${organization.bankAccount}"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label"></label>
					<div class="col-sm-4">
					</div>
					<label class="col-sm-2 control-label">私人账号</label>
					<div class="col-sm-4">
					<input type="text" class="form-control" name="priBankAccount" value="${organization.priBankAccount}"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">地址信息</label>
					<div class="col-sm-2">
						<select id="proivnceSelectId" data-placeholder="请选择省份" name="province" class="width100p" onchange="javascript:onchangeProivnceSelected(this.value);">
							<option value="">请选择省份</option>
						</select>
					</div>
					<div class="col-sm-2">
						<select id="citySelectId" data-placeholder="请选择城市" name="city" class="width100p" onchange="javascript:onchangeCitySelected(this.value);">
							<option value="">请选择城市</option>
						</select>
					</div>
					<div class="col-sm-2">
						<select id="districtSelectId" name="zone" data-placeholder="请选择市区、县、镇" class="width100p">
							<option value="">请选择市区、县、镇</option>
						</select>
					</div>
					<div class="col-sm-4">
						<input type="text" name="address" id="address" class="form-control" onchange="javascript:getLL();" value="${organization.address}"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">资料是否齐全<span class="asterisk">*</span></label>
					<div class="col-sm-2">
						<select id="isCompleteId" data-placeholder="资料是否齐全" name="isComplete" class="width100p"  required>
							<c:forEach items="${completeStatus}" var="item">
								<option value="${item.key}" <c:if test="${organization.isComplete}">selected="selected" </c:if>>${item.value}</option>
							</c:forEach>
						</select>
					</div>
					<label class="col-sm-2 control-label">审核状态<span class="asterisk">*</span></label>
					<div class="col-sm-2">
						<form:select path="status" id="enabledSelectId" cssClass="width100p required"  >
      						<option value="">请选择状态</option>
      						<form:options items="${extAuditStatus}"/>  
   						</form:select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">车行备注 </label>
					<div class="col-sm-10">
						<textarea rows="5" name="orgDescription" class="form-control" placeholder="请输入4S店描述...">${organization.orgDescription}</textarea>
					</div>
				</div>
				
				<c:forEach items="${carPick }" var="carPick">
						<input type="hidden" name="carPickSid"     class="form-control" required value="${carPick.sid }" readonly="readonly"/>
						<div class="form-group" >
							<label class="col-sm-2 control-label">门店名称<span class="asterisk">*</span></label>
							<div class="col-sm-4">
								<input type="text" name="stores"    class="form-control" required value="${carPick.stores }" readonly="readonly"/>
							</div>
							<label class="col-sm-2 control-label">联系电话<span class="asterisk">*</span></label>
							<div class="col-sm-4">
								<input type="text" name="linkmanPhone"  class="form-control" required value="${carPick.linkmanPhone }" readonly="readonly"/>
							</div>
						</div>
					<div class="form-group" >
							
							<label class="col-sm-2 control-label">联系电话<span class="asterisk">*</span></label>
							<div class="col-sm-4">
								<input type="text" name="linkmanPhone"  class="form-control" required value="${carPick.linkmanPhone }" readonly="readonly"/>
							</div>
							<label class="col-sm-2 control-label">取车点地址<span class="asterisk">*</span></label>
							<div class="col-sm-4">
								<input type="text" name="pickUpAddress"   placeholder="请输入XX省XX市XX区XX点" id="address2" class="form-control" required value="${carPick.pickUpAddress }"readonly="readonly"/>
							</div>
						</div>
					</c:forEach>
				<div class="form-group">
					<label class="col-sm-2 control-label">附件列表</label>
					<div class="col-sm-10">
						<div class="form-group">
								<img id="previewOrgThumbnailImage" src="http://www.placehold.it/120x120/EFEFEF/AAAAAA" alt="" style="display:none;">
							<label class="col-sm-1 control-label">附件类型</label>
							<div class="col-sm-3">
								<select id="orgFileTypesid" name="orgFileType">
									<c:forEach items="${orgFileTypeMap}" var="mymap">
										<option value="${mymap.key}">${mymap.value}</option>
									</c:forEach>
								</select>
							</div>
							<input type="hidden" name="fileSid" id="fileSid" class="form-control" maxlength="64" disabled="disabled" />
							<!-- <label class="col-sm-1 control-label">文件</label>
							<div class="col-sm-3">
								<input type="text" name="fileSid" id="fileSid" class="form-control"
									value="" maxlength="64" disabled="disabled" />
							</div> -->
							<label class="col-sm-1 control-label"></label>
							<div class="col-sm-3">
								<a href="javascript:void(0);" id="thumbnailorgBtn"
									class="btn btn-primary ">选择文件</a> <!-- <a href="javascript:void(0);"
									id="" onclick="postOrgFile()" class="btn btn-primary ">保存文件</a> -->	
							</div>
							<label class="col-sm-1 control-label"></label>
							<div class="col-sm-3">
								<a href="${ctx}/organization/censoringOrderImg?sid=${organization.sid}" class="btn btn-warning pull-right"  data-toggle="modal"     data-target="#showPicModal2">查看图片</a>	
							</div>
							
							<script type="text/javascript">
								$(function(){
									$('#orgFileTypesid').select2();
									
									if('${organization.sid}'!=''){
										ajaxGet('${ctx}/organization/updateFileList/${organization.sid}','fileList',function(){
									  		closeLoadingDialog();
									  		return true;
									  	});
									}else{
										ajaxGet('${ctx}/organization/faUpdateFileList','fileList',function(){
									  		closeLoadingDialog();
									  		return true;
									  	});
									}
									
								})
								
								initMyDropzoneUploadPicture('thumbnailorgBtn','previewOrgThumbnailImage','fileSid',200,100,function(){
									postOrgFile();
								});
								
								
								function saveForm(){
									$.post('${ctx}/organization/${action}',$('#inputForm').serializeArray(),function(r,textStatus){
										if(textStatus == "success"){
											return r.data.sid;
										  }
									},'json')
									
								}
								
								var orgSid = "${organization.sid}";
								function postOrgFile(){
									  
									  if(orgSid==''){
										  $.post('${ctx}/organization/${action}',$('#inputForm').serializeArray(),function(r,textStatus){
												if(textStatus == "success"){
													orgSid=r.data.sid;
													$('#sid').val(orgSid)
													saveFile(orgSid);
												  }
											},'json')
											return;
									  }
									  
									  saveFile(orgSid);
									 
								}
								
								function saveFile(orgSid){
									 var fileSid = $("#fileSid").val();
									  var orgFileType = $("#orgFileTypesid").val();
									  var data = "";
									  var url = "${ctx}/organization/saveFileForm?fileSid="+fileSid+"&orgSid="+orgSid+"&orgFileType="+orgFileType;
									  if(fileSid.length == 0){
										  alertErrorMessage("请选择上传文件！");
										  return ;
									  }
									  $.get(url, function(result,textStatus){
										  if(textStatus == "success"){
											  $("#fileSid").val("");
											  refreshList();
											  alertSuccessMessage("保存成功！");
										  }
									  });
								}
								
								
								
								function deletFile(sid){
									  var url = "${ctx}/organization/deleFile/"+sid+".json";
									  ajaxPostURL(url,null,function(result){
										  if(result.code == 200){
											  alertSuccessMessage("删除成功！");
											  refreshList();
										  }else{
											  alertErrorMessage(result.msg);
										  }
									  });
								  }
								  
								  function refreshList(){
									  var url = "${ctx}/organization/updateFileList/"+orgSid;
									   loadingDialog();	   
									 	ajaxGet(url,'fileList',function(){
									  		closeLoadingDialog();
									  		return true;
									  	});
								  }
								  
								  function openWin(url){
									  window.open (url);
								  }
								  
								  function downloadFile(fileName, content){
									    var aLink = document.createElement('a');
									    var blob = new Blob([content]);
									    var evt = document.createEvent("HTMLEvents");
									    evt.initEvent("click", false, false);//initEvent 不加后两个参数在FF下会报错, 感谢 Barret Lee 的反馈
									    aLink.download = fileName;
									    aLink.href = URL.createObjectURL(blob);
									    aLink.dispatchEvent(evt);
								}
							</script>
						</div>
						<div class="tab-pane active" id="fileList"></div>
					</div>
				</div>
				
			</div>
			<!-- panel-body -->
			<div class="panel-footer">
				<div class="row">
					<div class="col-sm-9 col-sm-offset-3">
						<a href="javascript:void(0);" onclick="saveTheForm()" class="btn btn-primary ">提交</a>
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
	function saveTheForm(){
		if(orgSid!=''){
			$.post('${ctx}/organization/faAdUpdate',$('#inputForm').serializeArray(),function(r,textStatus){
				if(textStatus == "success"){
					
					$('#bs-organization-edit-modal').modal('hide')
					refreshDiv("listDiv");
			      	if(r.code=="200"){
			      		alertSuccessMessage(r.msg);
			      	}else{
			      		alertErrorMessage(r.msg);
			      	} 
					return;
				  }
			},'json')
			
			return;
		  }
		
		$('#inputForm').submit()
		
	}
  $(function(){
	  
      //聚焦第一个输入框
	  $("#orgName").focus();
	  $('#proivnceSelectId').select2();
	  $('#citySelectId').select2();
	  $('#carResourcesId').select2();
	  
	  $('#districtSelectId').select2();
	  $('#orgTypeSelectId').select2({minimumResultsForSearch:-1});
	  $('#isCompleteId').select2({minimumResultsForSearch:-1});
	  
	  $('#enabledSelectId').val('${organization.status}').select2({minimumResultsForSearch:1,placeholder:'请选择审核'});
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
	  initRemoteDataSelect2('selectFaCodeid',"请选择所属经销商","${ctx}/dealerInfo/listByCodeJson.json");
	  
	  
	  //初始化上传图片组件
	  initDropzoneUploadPicture('thumbnailBtn','previewThumbnailImage','orgLicense',200,100);
	  
	  //初始化上传图片删除组件
	  initDeleteDropzoneUploadPicture('deleteThumbnailBtn','previewThumbnailImage','orgLicense',200,100);
	  
	
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