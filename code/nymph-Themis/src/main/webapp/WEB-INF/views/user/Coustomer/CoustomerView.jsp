<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.user.entity.UserInfo"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:if test="${!empty panel}">
	<div class="panel panel-default">
		<div class="panel-heading">
			<div class="pull-right">
				<div class="btn-list">
					<a href="javascript:history.go(-1);" class="btn btn-default">返回</a>
				</div>
			</div>
			<!-- panel-btns -->
			<h4 class="panel-title">
				<i class="fa fa-pencil"></i>客户信息详细
			</h4>
			<p>客户信息详细</p>
		</div>
		<div class="panel-body nopadding">
</c:if>
<form:form modelAttribute="userInfo" id="inputForm"
	class="form-horizontal form-bordered"
	action="${ctx}/coustomer/${action}" method="post">
	<input disabled="true" type="hidden" id="sid" name="sid"
		value="${userInfo.sid}" />
	<div class="panel-group" id="accordion2">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion2"
						href="#collapseOne2">客户基本信息</a>
					 	 <a  href="${ctx}/loansOrder/censoringOrderImg?sid=${userInfo.sid}&imgType=userImg" class="btn btn-warning pull-right" style="margin-top: -10px;margin-left: 5px" data-toggle="modal" data-target=".bs-example-modal-lg">查看图片</a>
					 	 <a href="javascript:downloadFile('${ctx}/loansOrder/orderImgToPdf?sid=${userInfo.sid}&imgType=userImg')" class="btn btn-primary pull-right" style="margin-top: -10px;" >下载PDF</a>
				</h4>
			</div>
			<div id="collapseOne2" class="panel-collapse collapse in">
				<div class="panel-body">
						<!-- form-group -->
					<div class="form-group">
						<label class="col-sm-1 control-label">所属经销商<span class="asterisk">*</span></label>
						<div class="col-sm-4">
							<input type="text" name="faCode" disabled="true"  id="selectFaCodeid" class="width100p" placeholder="请输入所属经销商..."  value="${userInfo.faCode}" maxlength="64" required/>
						</div>
					</div>
                 	<!-- form-group -->
					<div class="form-group">
						<label class="col-md-1 control-label"><%=UserInfo.ALIAS_COUSTOMER_NAME%><span class="asterisk">*</span></label>
						<div class="col-md-3">
							<form:input path="name" disabled="true" cssClass="form-control  required" maxlength="100"/>
						</div>
						<label class="col-md-1 control-label">证件类型<span class="asterisk">*</span></label>
						<div class="col-md-3">
							<form:select path="idtype" disabled="true" id="idtypeSelectId" cssClass="width100p ">
								<option/>请选择证件类型
	         						    <form:options items="${idtypeMap}"/>  
	      						</form:select>
						</div>
						<label class="col-md-1 control-label"><%=UserInfo.ALIAS_IDCARD%><span class="asterisk">*</span></label>
						<div class="col-md-3">
							<form:input path="idcard" disabled="true" cssClass="form-control required" maxlength="32"/>
						</div>
			
					</div>
								
					<div class="form-group">
						<label class="col-md-1 control-label"><%=UserInfo.ALIAS_SEX%><span class="asterisk">*</span></label>
						<div class="col-md-3">
							<form:select path="sex" disabled="true" id="sexSelectId" cssClass="width100p ">
								<option/>请选择性别
	         						    <form:options items="${sexMap}"/>  
	      						</form:select>
						</div>
						<label class="col-md-1 control-label">出生日期<span class="asterisk">*</span></label>
						<div class="col-md-3">
							<input type="text" disabled="true" name="birthdayString" class="form-control" value="${userInfo.birthdayString}" placeholder="yyyy-MM-dd" id="birthdayDatepicker">
						</div>
							<label class="col-md-1 control-label"><%=UserInfo.ALIAS_TEL%><span class="asterisk">*</span></label>
						<div class="col-md-3">
							<form:input path="tel" disabled="true" cssClass="form-control required" maxlength="32"/>
						</div>
					
					</div>
					<!-- form-group -->
					<div class="form-group">
					 <!-- form-group -->
						<label class="col-md-1 control-label">婚姻状况<span class="asterisk">*</span></label>
						<div class="col-md-3">
							<form:select path="userAttrInfo.married" disabled="true" id="yhSelectId" cssClass="width100p required" onchange="javascript:changeMarried(this);">
								<form:options items="${marriedMap}"/>
							</form:select>
						</div>
						<label class="col-md-1 control-label">客户渠道<span class="asterisk">*</span></label>
						<div class="col-md-3">
							<select id="kfSelectId" name="orderChannel" disabled="true" class="width100p required " >
								<c:forEach var="item" items="${orderChannelMap}">   
									<option value="${item.key}">${item.value}</option>
								</c:forEach> 
							</select>
						</div>
						<label class="col-md-1 control-label">申请人学历<span class="asterisk">*</span></label>
						<div class="col-md-3">
							<form:select path="educationBackground" disabled="true" id="educationBackgroundSelectId" cssClass="width100p required">
								<form:options items="${educationBackgroundMap}"/>
							</form:select>
						</div>
					</div>
					<div class="form-group">
					 <!-- form-group -->
						<label class="col-md-1 control-label">qq</label>
						<div class="col-md-3">
							<form:input path="qq" disabled="true" cssClass="form-control required" maxlength="32"/>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- panel -->
<div class="panel panel-default">
             <div class="panel-heading">
                 <h4 class="panel-title">
                     <a data-toggle="collapse" data-parent="#accordion2" href="#collapseOne21">职业信息</a>
                 </h4>
             </div>
             <div id="collapseOne21" class="panel-collapse collapse ">
                 <div class="panel-body">
                 	<!-- form-group -->
					<div class="form-group">
						<label class="col-md-1 control-label">工作单位<span class="asterisk">*</span></label>
						<div class="col-md-5">
								<form:input path="userAttrInfo.workUnit"  disabled="true"  cssClass="form-control" maxlength="250"/>
						</div>
					</div>
					<!-- form-group -->
					<div class="form-group">
						<label class="col-md-1 control-label">单位所在省份<span class="asterisk">*</span></label>
						<div class="col-md-3">
							<select id="workProvinceSelectId" data-placeholder="请选择省份"  disabled="true"  name="userAttrInfo.workProvince" class="width100p" onchange="javascript:onchangeProivnceSelected1(this.value);" required>
								<option value="">请选择省份</option>
							</select>
						</div>
						<label class="col-md-1 control-label">单位所在城市<span class="asterisk">*</span></label>
						<div class="col-md-3">
							<select id="workCitySelectId" data-placeholder="请选择城市"  disabled="true"  name="userAttrInfo.workCity" class="width100p"   required>
								<option value="">请选择城市</option>
							</select>
						</div>
						<label class="col-md-1 control-label">企业性质<span class="asterisk">*</span></label>
						<div class="col-md-3">
							<form:select path="userAttrInfo.enterpriseNature"  disabled="true"  id="enterpriseNatureSelectId" cssClass="width100p required">
								<form:options items="${enterpriseNatureMap}"/>
							</form:select>
						</div>
					</div>			
					<div class="form-group">
						<label class="col-md-1 control-label">单位地址<span class="asterisk">*</span></label>
						<div class="col-md-5">
							<form:input path="userAttrInfo.workAdress"  disabled="true"  cssClass="form-control" maxlength="250"/>
						</div>
					</div>
					<!-- form-group -->
					<div class="form-group">
					 <!-- form-group -->
						<label class="col-md-1 control-label">所属行业<span class="asterisk">*</span></label>
						<div class="col-md-3">
							<form:select path="userAttrInfo.workIndustry"  disabled="true"  id="workIndustrySelectId" cssClass="width100p required" >
								<form:options items="${workIndustryMap}"/>
							</form:select>
						</div>
						<label class="col-md-1 control-label">申请人职业<span class="asterisk">*</span></label>
						<div class="col-md-3">
							<form:select path="userAttrInfo.profession"  disabled="true"  id="professionSelectId" cssClass="width100p required" >
								<form:options items="${professionMap}"/>
							</form:select>
						</div>
						<label class="col-md-1 control-label">申请人职务<span class="asterisk">*</span></label>
						<div class="col-md-3">
							<form:select path="userAttrInfo.workJob"  disabled="true"  id="workJobSelectId" cssClass="width100p required" >
								<form:options items="${workJobMap}"/>
							</form:select>
						</div>
					</div>
					<div class="form-group">
					 <!-- form-group -->
						<label class="col-md-1 control-label">单位在职年限</label>
						<div class="col-md-3">
								<form:input path="userAttrInfo.workingLife"  disabled="true"  cssClass="form-control" maxlength="30"/>
						</div>
						<label class="col-md-1 control-label">税后年薪(万元)</label>
						<div class="col-md-3">
								<form:input path="userAttrInfo.annualPension"  disabled="true"  cssClass="form-control" maxlength="30"/>
						</div>
						<label class="col-md-1 control-label">其他税后年收入(万元)</label>
						<div class="col-md-3">
								<form:input path="userAttrInfo.otherRevenue"  disabled="true"  cssClass="form-control" maxlength="30"/>
						</div>
					</div>
             </div>
           </div>
         </div><!-- panel -->
       
              
        <div class="panel panel-default">
             <div class="panel-heading">
                 <h4 class="panel-title">
                     <a data-toggle="collapse" data-parent="#accordion2" href="#collapseOne22">居住信息</a>
                 </h4>
             </div>
             <div id="collapseOne22" class="panel-collapse collapse ">
                 <div class="panel-body">
					<!-- form-group -->
					<div class="form-group">
						<label class="col-md-1 control-label">现居住地省份<span class="asterisk">*</span></label>
						<div class="col-md-3">
							<select id="proivnceSelectId" data-placeholder="请选择省份"  disabled="true"  name="province" class="width100p" onchange="javascript:onchangeProivnceSelected(this.value);" required>
								<option value="">请选择省份</option>
							</select>
						</div>
						<label class="col-md-1 control-label">现居住地城市<span class="asterisk">*</span></label>
						<div class="col-md-3">
							<select id="citySelectId" data-placeholder="请选择城市"  disabled="true"  name="city" class="width100p" onchange="javascript:onchangeCitySelected(this.value);"  required>
								<option value="">请选择城市</option>
							</select>
						</div>								
						<label class="col-md-1 control-label">家庭电话</label>
							<div class="col-md-3">
								<form:input path="userAttrInfo.homePhome"  disabled="true"  cssClass="form-control" maxlength="30"/>
							</div>
						</div>
					</div>			
					<div class="form-group">
						<label class="col-md-1 control-label">现居住地地址<span class="asterisk">*</span></label>
						<div class="col-md-5">
							<form:input path="address"  disabled="true"  cssClass="form-control" maxlength="250"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-1 control-label">户籍所在省份<span class="asterisk">*</span></label>
						<div class="col-md-3">
							<select id="censusProvinceSelectId" data-placeholder="请选择省份"  disabled="true" name="userAttrInfo.censusProvince" class="width100p" onchange="javascript:onchangeProivnceSelected2(this.value);" required>
								<option value="">请选择省份</option>
							</select>
						</div>
						<label class="col-md-1 control-label">户籍所在城市<span class="asterisk">*</span></label>
						<div class="col-md-3">
							<select id="censusCitySelectId" data-placeholder="请选择城市"  disabled="true" name="userAttrInfo.censusCity" class="width100p"   required>
								<option value="">请选择城市</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-1 control-label">户籍地详细地址<!-- <span class="asterisk">*</span> --></label>
						<div class="col-md-5">
							<form:input path="idaddress"  disabled="true"  cssClass="form-control" maxlength="250"/>
						</div>
					</div>
						
					<!-- form-group -->
					<div class="form-group">
						<label class="col-md-1 control-label">是否本地户口<span class="asterisk">*</span></label>
						<div class="col-md-3">
							<form:select path="userAttrInfo.szHome"  disabled="true"  id="shSelectId" cssClass="width100p required">
								<form:options items="${szHomeMap}"/>
							</form:select>
						</div>
						<label class="col-md-1 control-label">是否有社保<span class="asterisk">*</span></label>
						<div class="col-md-3">
						    <form:select path="userAttrInfo.social"  disabled="true"  id="sbSelectId" cssClass="width100p required">
								<form:options items="${socialMap}"/>
							</form:select>
						</div>
                 </div>
             </div>
         </div>
         <!-- panel -->
         <div class="panel panel-default">
           <div class="panel-heading">
               <h4 class="panel-title">
                   <a id="yihun" data-toggle="collapse" class="collapsed" data-parent="#accordion2" href="#collapseTwo2">客户配偶信息（已婚必填）</a>
                   <a id="weihun" data-toggle="collapse" class="collapsed" data-parent="#accordion2" href="#collapseTwo2">直接亲属信息</a>
               </h4>
           </div>
           <div id="collapseTwo2" class="panel-collapse collapse">
               <div class="panel-body">
              
					
					<div class="form-group ">
						<label class="col-md-1 control-label">姓名<span class="asterisk">*</span></label>
						<div class="col-md-3">
							<input type="text" name="userAttrInfo.spouseName"  disabled="true"  class="form-control required" placeholder="请输入姓名..."  value="${userInfo.userAttrInfo.spouseName}" maxlength="64"/>
						</div>
						<label class="col-md-1 control-label">身份证号<span class="asterisk">*</span></label>
						<div class="col-md-3">
							<input type="text" name="userAttrInfo.spouseCardNo"  disabled="true"  class="form-control required" placeholder="请输配偶身份证号..."  value="${userInfo.userAttrInfo.spouseCardNo}" maxlength="32" />
						</div>
						<label class="col-md-1 control-label">手机号<span class="asterisk">*</span></label>
						<div class="col-md-3">
							<input type="text" name="userAttrInfo.spouseTel"  disabled="true"  class="form-control required" placeholder="请输入手机号..."  value="${userInfo.userAttrInfo.spouseTel}" maxlength="64" />
						</div>
					</div>
					
					<!-- form-group -->
					<div class="form-group ">
						<label class="col-md-1 control-label">单位名称<span class="asterisk">*</span></label>
						<div class="col-md-3">
							<input type="text" name="userAttrInfo.spouseCompanyName"  disabled="true"  class="form-control required" placeholder="请输入单位名称..."  value="${userInfo.userAttrInfo.spouseCompanyName}" maxlength="255" />
						</div>
						<label class="col-md-1 control-label">单位详细地址<span class="asterisk">*</span></label>
						<div class="col-md-3">
							<input type="text" name="userAttrInfo.spouseCardAddress"  disabled="true"  class="form-control required" placeholder="请输入单位详细地址..."  value="${userInfo.userAttrInfo.spouseCardAddress}" maxlength="255" />
						</div>
						<label class="col-md-1 control-label">税后年薪(万元)<span class="asterisk">*</span></label>
						<div class="col-md-3">
							<input type="text" name="userAttrInfo.spouseAnnualPension"  disabled="true"  class="form-control required" placeholder="请输入税后年薪(万元)..."  value="${userInfo.userAttrInfo.spouseAnnualPension}" maxlength="255" />
						</div>
					</div>
					
					<div class="form-group ">
						<label class="col-md-1 control-label">是否深户<span class="asterisk">*</span></label>
						<div class="col-md-5">
							<form:select path="userAttrInfo.spouseSzHome" id="shSelectId1"  disabled="true"  cssClass="width100p required">
								<form:options items="${szHomeMap}"/>
							</form:select>
						</div>
						<label class="col-md-1 control-label">是否有社保<span class="asterisk">*</span></label>
						<div class="col-md-5">
						    <form:select path="userAttrInfo.spouseSocial" id="sbSelectId1"  disabled="true"  cssClass="width100p required">
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
					<a data-toggle="collapse" class="collapsed"
						data-parent="#accordion2" href="#collapseThree2">客户住房信息</a>
				</h4>
			</div>
			<div id="collapseThree2" class="panel-collapse collapse">
				<div class="panel-body">
					<label class="col-md-1 control-label">住房性质<span
						class="asterisk">*</span></label>
					<div class="col-md-5">
						<form:select disabled="true" path="userAttrInfo.houseProperty"
							id="zfSelectId" cssClass="width100p required">
							<option>请选择住房性质</option>
							<form:options items="${housePropertyMap}" />
						</form:select>
					</div>
					<label class="col-md-1 control-label">购买时间</label>
					<div class="col-md-5">
						<form:input disabled="true" path="userAttrInfo.housePurchaseTime"
							cssClass="form-control" maxlength="32" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-1 control-label">住房面积</label>
					<div class="col-md-5">
						<form:input disabled="true" path="userAttrInfo.houseArea"
							cssClass="form-control" maxlength="32" />
					</div>
					<label class="col-md-1 control-label">登记价</label>
					<div class="col-md-5">
						<form:input disabled="true" path="userAttrInfo.houseRegisterPrice"
							cssClass="form-control" maxlength="32" />
					</div>
				</div>
			</div>
		</div>
			<!-- panel -->
					<!-- panel -->
			<div class="panel panel-default">
             <div class="panel-heading">
                 <h4 class="panel-title">
                     <a data-toggle="collapse" data-parent="#accordion2" href="#collapseOne23">基本资料附件</a>
                 </h4>
             </div>
             <div id="collapseOne23" class="panel-collapse collapse in">
             		<div class="form-group">
						<div class="row media-manager">
						  <c:forEach var="item" items="${fileList}" varStatus="status">
						  	<div class="col-md-3 document">
								<div class="thmb">
									<div class="thmb-prev">
									<img src="${rootUrl}${item.fileUrl}"
								class="img-responsive" alt="" style="height:400px">
								</div>
								<h5 class="fm-title" style="text-align: center;"></h5>
									</div>
								</div>
						  </c:forEach>	
						</div>
					</div>
            </div>
        </div>
	</div>

</form:form>
<!--modal-body-->
<script type="text/javascript">
  $(document).ready(function(){
	  
		var married = $('#yhSelectId');
		  changeMarried(married);
	  
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
	  $('#workProvinceSelectId').select2({minimumResultsForSearch:-1});
	  $('#workCitySelectId').select2({minimumResultsForSearch:-1});
	  $('#censusProvinceSelectId').select2({minimumResultsForSearch:-1});
	  $('#censusCitySelectId').select2({minimumResultsForSearch:-1});
	  initRemoteDataSelect2('selectFaCodeid',"请选择所属经销商","${ctx}/dealerInfo/listByCodeJson.json");
	  //初始化上传图片组件
	  //initDropzoneUploadPicture('thumbnailBtn','previewThumbnailImage','portrait',150,150);
	  //初始化上传图片删除组件
	  //initDeleteDropzoneUploadPicture('deleteThumbnailBtn','previewThumbnailImage','portrait',150,150);
	  //初始下拉列表
	  $('#enabledSelectId').val('${userInfo.status}').select2({minimumResultsForSearch:-1,placeholder:'请选择是否可用'});
	  $('#sexSelectId').val("${userInfo.sex}").select2({minimumResultsForSearch:-1,placeholder:'请选择性别'});
	  $('#yhSelectId').select2({minimumResultsForSearch:-1,placeholder:'请选择婚姻状况'});
	  $('#idtypeSelectId').val("${userInfo.idtype}").select2({minimumResultsForSearch:-1,placeholder:'请选择证件类型'});
	  $('#workIndustrySelectId').select2({minimumResultsForSearch:-1,placeholder:'所属行业'});
	  $('#educationBackgroundSelectId').select2({minimumResultsForSearch:-1,placeholder:'申请人学历'});
	  $('#enterpriseNatureSelectId').select2({minimumResultsForSearch:-1,placeholder:'企业性质'});
	  $('#workJobSelectId').select2({minimumResultsForSearch:-1,placeholder:'申请人职务'});
	  $('#kfSelectId').select2({minimumResultsForSearch:-1,placeholder:'请选择客户渠道'});
	  $('#professionSelectId').select2({minimumResultsForSearch:-1,placeholder:'申请人职业'});
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
	  
	  var censusProvinceSelectId = '${userInfo.userAttrInfo.censusProvince}';
	  initProivnceSelectOpt('censusProvinceSelectId',wproivnceSelectId,'',function(){
		  if(censusProvinceSelectId){
			  $('#censusProvinceSelectId').val(censusProvinceSelectId).select2({minimumResultsForSearch:-1});
			  var citySelectId = '${userInfo.userAttrInfo.censusCity}';
			  if(citySelectId){
				  initCitySelectOpt('censusCitySelectId',citySelectId,wproivnceSelectId,function(){
					  $('#censusCitySelectId').val(citySelectId).select2({minimumResultsForSearch:-1});
				  });
			  }
		  }
	  });
	  
	  var wproivnceSelectId = '${userInfo.userAttrInfo.workProvince}';
	  initProivnceSelectOpt('workProvinceSelectId',wproivnceSelectId,'',function(){
		  if(wproivnceSelectId){
			  $('#workProvinceSelectId').val(wproivnceSelectId).select2({minimumResultsForSearch:-1});
			  var citySelectId = '${userInfo.userAttrInfo.workCity}';
			  if(citySelectId){
				  initCitySelectOpt('workCitySelectId',citySelectId,proivnceSelectId,function(){
					  $('#workCitySelectId').val(citySelectId).select2({minimumResultsForSearch:-1});
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
	  		 $('#yihun').show();
	  		 $('#weihun').hide();
	  	}else{
	  	$('#yihun').hide();
		$('#weihun').show();
	  	}
	  }
  
  function downloadFile(url){
		url=getRandedURL(url);
		ajaxPostURL(url,null,function(response){
			alert('---+'+response.code);
			if(response.code == '200'){
				alert(response.url);
				if(response.url!=null){
					window.open(response.url);
				}else{
					var sd = "没有可下载PDF文件！";
					alertErrorMessage(sd);
				}
			}else{
				var sd = "没有可下载PDF文件！";
				alertErrorMessage(sd);
			}
		});
  }
</script>