<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.user.entity.UserInfo"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<div class="panel panel-default">
	<div class="panel-heading">
		<div class="pull-right">
       	 	<div class="btn-list">
        			<a href="javascript:void(0);" onclick="javascript:submitForm();" class="btn btn-primary">保存</a>
        			<a href="javascript:history.go(-1);" class="btn btn-default">返回</a>
             </div>
        </div>
		<!-- panel-btns -->
		<h4 class="panel-title"><i class="fa fa-pencil"></i>客户信息详细</h4>
		<p>客户信息详细</p>
	</div>
	<div class="panel-body nopadding">
	<form:form modelAttribute="userInfo" id="progressWizard" class="form-horizontal form-bordered" action="${ctx}/coustomer/${action}" method="post">
		<input type="hidden" id="sid" name="sid" value="${userInfo.sid}"/>
		<input type="hidden" name="icon" id="portrait" value="${userInfo.icon}"/>
		<input type="hidden" name="type" id="portrait" value="${userInfo.type}"/>
		<div class="panel-group" id="accordion2">
          <div class="panel panel-default">
             <div class="panel-heading">
                 <h4 class="panel-title">
                     <a data-toggle="collapse" data-parent="#accordion2" href="#collapseOne2">客户基本信息</a>
                 </h4>
             </div>
             <div id="collapseOne2" class="panel-collapse collapse in">
                 <div class="panel-body">
                 	<!-- form-group -->
					<div class="form-group">
						<label class="col-md-1 control-label"><%=UserInfo.ALIAS_COUSTOMER_NAME%><span class="asterisk">*</span></label>
						<div class="col-md-5">
							<form:input path="name" cssClass="form-control required" maxlength="100"/>
						</div>
						<label class="col-md-1 control-label">家庭电话</label>
						<div class="col-md-5">
							<form:input path="userAttrInfo.homePhome" cssClass="form-control" maxlength="30"/>
						</div>
					</div>
						
					<!-- form-group -->
					<div class="form-group">
						<label class="col-md-1 control-label"><%=UserInfo.ALIAS_TEL%><span class="asterisk">*</span></label>
						<div class="col-md-5">
							<form:input path="tel" cssClass="form-control required" maxlength="32"/>
						</div>
						<label class="col-md-1 control-label"><%=UserInfo.ALIAS_SEX%><span class="asterisk">*</span></label>
						<div class="col-md-5">
							<form:select path="sex" id="sexSelectId" cssClass="width100p">
								<option/>请选择性别
	         						    <form:options items="${sexMap}"/>  
	      						</form:select>
						</div>
					</div>
						
					<!-- form-group -->
					<div class="form-group">
						<label class="col-md-1 control-label">家庭地址<span class="asterisk">*</span></label>
						<div class="col-md-2">
							<select id="proivnceSelectId" data-placeholder="请选择省份" name="province" class="width100p" onchange="javascript:onchangeProivnceSelected(this.value);" required>
								<option value="">请选择省份</option>
							</select>
						</div>
						<div class="col-md-2">
							<select id="citySelectId" data-placeholder="请选择城市" name="city" class="width100p" onchange="javascript:onchangeCitySelected(this.value);"  required>
								<option value="">请选择城市</option>
							</select>
						</div>
						<div class="col-md-2">
							<select id="districtSelectId" name="zone" data-placeholder="请选择市区、县、镇" class="width100p"  required>
								<option value="">请选择市区、县、镇</option>
							</select>
						</div>
						<div class="col-md-5">
							<form:input path="address" cssClass="form-control required" maxlength="100"/>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-md-1 control-label">是否深户<span class="asterisk">*</span></label>
						<div class="col-md-5">
							<form:select path="userAttrInfo.szHome" id="shSelectId" cssClass="width100p required">
								<form:options items="${szHomeMap}"/>
							</form:select>
						</div>
						<label class="col-md-1 control-label">是否有社保<span class="asterisk">*</span></label>
						<div class="col-md-5">
						    <form:select path="userAttrInfo.social" id="sbSelectId" cssClass="width100p required">
								<form:options items="${socialMap}"/>
							</form:select>
						</div>
					</div>
						
					<!-- form-group -->
					<div class="form-group">
						<label class="col-md-1 control-label"><%=UserInfo.ALIAS_IDCARD%><span class="asterisk">*</span></label>
						<div class="col-md-5">
							<form:input path="idcard" cssClass="form-control required" maxlength="32"/>
						</div>
						<label class="col-md-1 control-label"><%=UserInfo.ALIAS_IDADDRESS%><span class="asterisk">*</span></label>
						<div class="col-md-5">
							<form:input path="idaddress" cssClass="form-control required" maxlength="255"/>
						</div>
					</div>
                 
                 </div>
             </div>
         </div><!-- panel -->
       
       	<div class="panel panel-default">
           <div class="panel-heading">
               <h4 class="panel-title">
                   <a data-toggle="collapse" class="collapsed" data-parent="#accordion2" href="#collapseTwo2">客户配偶信息</a>
               </h4>
           </div>
           <div id="collapseTwo2" class="panel-collapse collapse">
               <div class="panel-body">
               		<!-- form-group -->
					<div class="form-group">
						<label class="col-md-1 control-label">婚姻状况<span class="asterisk">*</span></label>
						<div class="col-md-11">
							<form:select path="userAttrInfo.married" id="yhSelectId" cssClass="width100p required" onchange="javascript:changeMarried(this);">
								<form:options items="${marriedMap}"/>
							</form:select>
						</div>
					</div>
					
					<div class="form-group spouse-div">
						<label class="col-md-1 control-label">配偶姓名<span class="asterisk">*</span></label>
						<div class="col-md-5">
							<input type="text" name="userAttrInfo.spouseName" class="form-control required" placeholder="请输入配偶姓名..."  value="${userInfo.userAttrInfo.spouseName}" maxlength="64"/>
						</div>
						<label class="col-md-1 control-label">配偶手机号<span class="asterisk">*</span></label>
						<div class="col-md-5">
							<input type="text" name="userAttrInfo.spouseTel" class="form-control required" placeholder="请输入配偶手机号..."  value="${userInfo.userAttrInfo.spouseTel}" maxlength="64" />
						</div>
					</div>
					
					<!-- form-group -->
					<div class="form-group spouse-div">
						<label class="col-md-1 control-label">配偶身份证号<span class="asterisk">*</span></label>
						<div class="col-md-5">
							<input type="text" name="userAttrInfo.spouseCardNo" class="form-control required" placeholder="请输配偶身份证号..."  value="${userInfo.userAttrInfo.spouseCardNo}" maxlength="32" />
						</div>
						<label class="col-md-1 control-label">配偶身份证地址<span class="asterisk">*</span></label>
						<div class="col-md-5">
							<input type="text" name="userAttrInfo.spouseCardAddress" class="form-control required" placeholder="请输入配偶身份证地址..."  value="${userInfo.userAttrInfo.spouseCardAddress}" maxlength="255" />
						</div>
					</div>
					
					<div class="form-group spouse-div">
						<label class="col-md-1 control-label">是否深户<span class="asterisk">*</span></label>
						<div class="col-md-5">
							<form:select path="userAttrInfo.spouseSzHome" id="shSelectId1" cssClass="width100p required">
								<form:options items="${szHomeMap}"/>
							</form:select>
						</div>
						<label class="col-md-1 control-label">是否有社保<span class="asterisk">*</span></label>
						<div class="col-md-5">
						    <form:select path="userAttrInfo.spouseSocial" id="sbSelectId1" cssClass="width100p required">
								<form:options items="${socialMap}"/>
							</form:select>
						</div>
					</div>

               </div>
           </div>
       </div><!-- panel -->
       
       <div class="panel panel-default">
           <div class="panel-heading">
               <h4 class="panel-title">
                   <a data-toggle="collapse" class="collapsed" data-parent="#accordion2" href="#collapseThree2">客户住房信息</a>
               </h4>
           </div>
           <div id="collapseThree2" class="panel-collapse collapse">
               <div class="panel-body">
               		<label class="col-md-1 control-label">住房性质<span class="asterisk">*</span></label>
				<div class="col-md-5">
					<form:select path="userAttrInfo.houseProperty" id="zfSelectId" cssClass="width100p required">
						<option>请选择住房性质</option>
						<form:options items="${housePropertyMap}"/>
					</form:select>
				</div>
				<label class="col-md-1 control-label">购买时间</label>
					<div class="col-md-5">
						<form:input path="userAttrInfo.housePurchaseTime" cssClass="form-control" maxlength="32"/>
					</div>
				</div>
				
					<div class="form-group">
						<label class="col-md-1 control-label">住房面积</label>
						<div class="col-md-5">
							<form:input path="userAttrInfo.houseArea" cssClass="form-control" maxlength="32"/>
						</div>
						<label class="col-md-1 control-label">登记价</label>
						<div class="col-md-5">
							<form:input path="userAttrInfo.houseRegisterPrice" cssClass="form-control" maxlength="32"/>
						</div>
					</div>
               </div>
           </div>
       
       <div class="panel panel-default">
           <div class="panel-heading">
               <h4 class="panel-title">
                   <a data-toggle="collapse" class="collapsed" data-parent="#accordion2" href="#collapseThree3">收入来源信息</a>
               </h4>
           </div>
           <div id="collapseThree3" class="panel-collapse collapse">
               <div class="panel-body">
               		<!-- form-group -->
				<div class="form-group">
					<label class="col-md-1 control-label">工作单位<span class="asterisk">*</span></label>
					<div class="col-md-5">
						<form:input path="userAttrInfo.workUnit" cssClass="form-control" maxlength="250"/>
					</div>
					<label class="col-md-1 control-label">单位地址<span class="asterisk">*</span></label>
					<div class="col-md-5">
						<form:input path="userAttrInfo.workAdress" cssClass="form-control" maxlength="250"/>
					</div>
				</div>
				<!-- form-group -->
				<div class="form-group">
					<label class="col-md-1 control-label">单位电话<span class="asterisk">*</span></label>
					<div class="col-md-3">
						<form:input path="userAttrInfo.workTel" cssClass="form-control" maxlength="100"/>
					</div>
					<label class="col-md-1 control-label">收入来源<span class="asterisk">*</span></label>
					<div class="col-md-3">
						<form:select path="userAttrInfo.revenue" id="SLSelectId" cssClass="width100p required">
							<option>请选择住房性质</option>
							<form:options items="${revenueMap}"/>
						</form:select>
					</div>
					<label class="col-md-1 control-label">月平均收入<span class="asterisk">*</span></label>
					<div class="col-md-3">
						<form:input path="userAttrInfo.monthRevenue" cssClass="form-control" maxlength="100"/>
					</div>
				</div>
               </div>
           </div>
       </div><!-- panel -->
       
   </div>
   </form:form>
	</div>
</div>

<!--modal-body-->
<script type="text/javascript">
  function submitForm(){
  	$('#progressWizard').submit();
  }
  $(document).ready(function(){
  	  var val = '${userInfo.userAttrInfo.married}';
  	  if(val == '1'){
		  	  $('.spouse-div').show();
  	  }else{
		  	  $('.spouse-div').hide();
  	  }
	  //为inputForm注册validate函数
	  var form = $('#progressWizard');
	  form.validate({
	  	  doNotHideMessage: true, //this option enables to show the error/success messages on tab switch.
          focusInvalid: false, // do not focus the last invalid input
          errorElement: 'span', //default input error message container
          errorClass: 'error', // default input error message class
		  rules: {
				tel: {
					remote: "${ctx}/userInfo/checkTel?oldTel=" + encodeURIComponent('${userInfo.tel}')
				},
	  			sex:"required"
			},
			messages: {
				tel: {
					remote: "不是有效的手机号或是手机号码不存在"
				}
			},
			submitHandler: function(form){
                globalSubmitHandler(form,function(json){
                	$('.bs-organization-edit-modal').modal("hide"); 
                		history.go(-1);
 					refreshDiv("listDiv");
                });
			}
		});
	  
	// default form wizard
      $('#progressWizard').bootstrapWizard({
          'nextSelector': '.wizard .next',
          'previousSelector': '.wizard .previous',
          onTabClick: function (tab, navigation, index) {
              return false;
          },
          onNext: function (tab, navigation, index) {
              if (form.valid() == false) {
                  return false;
              }
              var total = navigation.find('li').length;
              var current = index + 1;
              // set done steps
              jQuery('li', $('#progressWizard')).removeClass("done");
              var li_list = navigation.find('li');
              for (var i = 0; i < index; i++) {
                  jQuery(li_list[i]).addClass("done");
              }

              if (current == 1) {
                  $('#progressWizard').find('.wizard .previous').hide();
              } else {
                  $('#progressWizard').find('.wizard .previous').show();
              }

              if (current >= total) {
                  $('#progressWizard').find('.wizard .next').hide();
                  $('#progressWizard').find('.wizard .finish').show();
              } else {
                  $('#progressWizard').find('.wizard .next').show();
                  $('#progressWizard').find('.wizard .finish').hide();
              }
          },
          onPrevious: function (tab, navigation, index) {
              var total = navigation.find('li').length;
              var current = index + 1;
              // set done steps
              jQuery('li', $('#progressWizard')).removeClass("done");
              var li_list = navigation.find('li');
              for (var i = 0; i < index; i++) {
                  jQuery(li_list[i]).addClass("done");
              }
              if (current == 1) {
                  $('#progressWizard').find('.wizard .previous').hide();
              } else {
                  $('#progressWizard').find('.wizard .previous').show();
              }

              if (current >= total) {
                  $('#progressWizard').find('.wizard .next').hide();
                  $('#progressWizard').find('.wizard .finish').show();
              } else {
                  $('#progressWizard').find('.wizard .next').show();
                  $('#progressWizard').find('.wizard .finish').hide();
              }
          },
          onTabShow: function (tab, navigation, index) {
              var $total = navigation.find('li').length;
              var $current = index + 1;
              var $percent = ($current / $total) * 100;
				$('#progressWizard').find('.progress-bar').css('width',$percent + '%');
          }
      });

      $('#progressWizard').find('.wizard .previous').hide();
      $('#progressWizard').find('.wizard .finish').hide();
	  
	  $('#proivnceSelectId').select2({minimumResultsForSearch:-1});
	  $('#citySelectId').select2({minimumResultsForSearch:-1});
	  $('#districtSelectId').select2({minimumResultsForSearch:-1});
	  
	  //初始化上传图片组件
	  //initDropzoneUploadPicture('thumbnailBtn','previewThumbnailImage','portrait',150,150);
	  //初始化上传图片删除组件
	  //initDeleteDropzoneUploadPicture('deleteThumbnailBtn','previewThumbnailImage','portrait',150,150);
	  //初始下拉列表
	  $('#enabledSelectId').val('${userInfo.status}').select2({minimumResultsForSearch:-1,placeholder:'请选择是否可用'});
	  $('#sexSelectId').val("${userInfo.sex}").select2({minimumResultsForSearch:-1,placeholder:'请选择性别'});
	  $('#yhSelectId').select2({minimumResultsForSearch:-1,placeholder:'请选择婚姻状况'});
	  $('#sbSelectId').select2({minimumResultsForSearch:-1,placeholder:'请选择是否有社保'});
	  $('#shSelectId').select2({minimumResultsForSearch:-1,placeholder:'请选择是否深户'});
	  $('#sbSelectId1').select2({minimumResultsForSearch:-1,placeholder:'请选择是否有社保'});
	  $('#shSelectId1').select2({minimumResultsForSearch:-1,placeholder:'请选择是否深户'});
	  $('#zfSelectId').select2({minimumResultsForSearch:-1,placeholder:'请选择住房性质'});
	  $('#SLSelectId').select2({minimumResultsForSearch:-1,placeholder:'请选择收入来源'});
	//初始化日期
	  $("#birthdayDatepicker").mask("9999-99-99");
	  //聚焦第一个输入框
	  $("#name").focus();
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
  
//国家下拉改变，级联的省，市，区都要发生改变
  function onchangeCountrySelected(value){
	  initProivnceSelectOpt('proivnceSelectId','',value);
	  onchangeProivnceSelected();
	  onchangeCitySelected();
	  $('#proivnceSelectId',$('#inputForm')).select2({minimumResultsForSearch:-1});
  }
  //省下拉改变，级联城市发生改变
  function onchangeProivnceSelected(value){
	  initCitySelectOpt('citySelectId','',value);
	  onchangeCitySelected();
	  $('#citySelectId',$('#inputForm')).select2({minimumResultsForSearch:-1});
  }
  //城市下拉改变，级联区下拉改变
  function onchangeCitySelected(value){
	  initDistrictSelectOpt('districtSelectId','',value);
	  $('#districtSelectId',$('#inputForm')).select2({minimumResultsForSearch:-1});
  }
  
  function changeMarried(obj){
  	var val = $(obj).val();
  	if(val == '1'){
  		 $('.spouse-div').show();
  	}else{
  	 $('.spouse-div').hide();
  	}
  }
</script>