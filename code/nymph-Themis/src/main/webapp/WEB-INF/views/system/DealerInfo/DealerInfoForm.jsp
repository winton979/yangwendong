<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.system.entity.DealerInfo"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

	<form:form modelAttribute="dealerInfo" id="inputForm" class="form-horizontal form-bordered" action="${ctx}/dealerInfo/${action}" method="post">
				<input type="hidden" id="sid" name="sid" value="${dealerInfo.sid}"/>
				<input type="hidden" id="businessLicense" name="businessLicense" value="${dealerInfo.businessLicense}"/>
				<input type="hidden" id="organizationImg" name="organizationImg" value="${dealerInfo.organizationImg}"/>
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
							<label class="col-sm-2 control-label">上级经销商</label>
							<div class="col-sm-4">
								<input type="text" name="fatherCode" id="selectFatherCodeid" class="width100p" placeholder="请输入上级经销商不填为一级..."  value="${dealerInfo.fatherCode}" maxlength="64" />
							</div>
							<label class="col-sm-2 control-label">区域选择<span class="asterisk">*</span></label>
							<div class="col-sm-4">
								 <select id="select-search-hide" name="dealerAreaSid" data-placeholder="Choose One" class="width300">
                                            <option value="0">请选择FA所在区域</option>
								 	<c:forEach items="${systemDictionarys}" var="item">
								 			<!-- modify by yangwendong 修复bug，编辑和查看界面不显示该区域默认值 -->
                                            <option value="${item.sid}" <c:if test="${dealerInfo.dealerAreaSid == item.sid }">selected</c:if>>${item.dictValue}</option>
                                     </c:forEach>
                                  </select>
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-2 control-label">经销商<%=DealerInfo.ALIAS_DEALER_NAME%><span class="asterisk">*</span></label>
							<div class="col-sm-7">
											<input type="text" name="dealerName" id="dealerName" class="form-control" placeholder="请输入<%=DealerInfo.ALIAS_DEALER_NAME%>..."  value="${dealerInfo.dealerName}" maxlength="255" required/>
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">						
							<label class="col-sm-2 control-label">经销商地址<span class="asterisk">*</span></label>
							<div class="col-sm-2">
								<select id="proivnceSelectId" data-placeholder="请选择省份" name="province" class="width100p" onchange="javascript:onchangeProivnceSelected(this.value);" required>
									<option value="">请选择省份</option>
								</select>
							</div>
							<div class="col-sm-2">
								<select id="citySelectId" data-placeholder="请选择城市" name="city" class="width100p" onchange="javascript:onchangeCitySelected(this.value);" required>
									<option value="">请选择城市</option>
								</select>
							</div>
							<div class="col-sm-2">
								<select id="districtSelectId" name="zone" data-placeholder="请选择市区、县、镇" class="width100p" required>
									<option value="">请选择市区、县、镇</option>
								</select>
							</div>
							<div class="col-sm-4">
								<input type="text" name="address" id="address" class="form-control" placeholder="请输入<%=DealerInfo.ALIAS_ADDRESS%>..."  value="${dealerInfo.address}" maxlength="100"/>
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-2 control-label"><%=DealerInfo.ALIAS_OPENING_BANK%></label>
							<div class="col-sm-4">
											<input type="text" name="openingBank" id="openingBank" class="form-control" placeholder="请输入<%=DealerInfo.ALIAS_OPENING_BANK%>..."  value="${dealerInfo.openingBank}" maxlength="64" />
							</div>
							<label class="col-sm-2 control-label"><%=DealerInfo.ALIAS_ACCOUNT_NAME%></label>
							<div class="col-sm-4">
											<input type="text" name="accountName" id="accountName" class="form-control" placeholder="请输入<%=DealerInfo.ALIAS_ACCOUNT_NAME%>..."  value="${dealerInfo.accountName}" maxlength="64" />
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-2 control-label"><%=DealerInfo.ALIAS_BANK_ACCOUNT%></label>
							<div class="col-sm-4">
											<input type="text" name="bankAccount" id="bankAccount" class="form-control" placeholder="请输入<%=DealerInfo.ALIAS_BANK_ACCOUNT%>..."  value="${dealerInfo.bankAccount}" maxlength="64" />
							</div>
							<label class="col-sm-2 control-label"><%=DealerInfo.ALIAS_DEALER_TEL%></label>
							<div class="col-sm-4">
											<input type="text" name="dealerTel" id="dealerTel" class="form-control" placeholder="请输入<%=DealerInfo.ALIAS_DEALER_TEL%>..."  value="${dealerInfo.dealerTel}" maxlength="32" />
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-2 control-label"><%=DealerInfo.ALIAS_BRAND_BUSINESS%></label>
							<div class="col-sm-4">
											<input type="text" name="brandBusiness" id="brandBusiness" class="form-control" placeholder="请输入<%=DealerInfo.ALIAS_BRAND_BUSINESS%>..."  value="${dealerInfo.brandBusiness}" maxlength="255" />
							</div>
							<label class="col-sm-2 control-label"><%=DealerInfo.ALIAS_CONTACT_PERSON%><span class="asterisk">*</span></label>
							<div class="col-sm-4">
											<input type="text" name="contactPerson" id="contactPerson" class="form-control" placeholder="请输入<%=DealerInfo.ALIAS_CONTACT_PERSON%>..."  value="${dealerInfo.contactPerson}" maxlength="64" required/>
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-2 control-label"><%=DealerInfo.ALIAS_CONTACT_PHONE%></label>
							<div class="col-sm-4">
											<input type="text" name="contactPhone" id="contactPhone" class="form-control" placeholder="请输入<%=DealerInfo.ALIAS_CONTACT_PHONE%>..."  value="${dealerInfo.contactPhone}" maxlength="64" />
							</div>
							<label class="col-sm-2 control-label"><%=DealerInfo.ALIAS_CONTACT_EMAIL%></label>
							<div class="col-sm-4">
											<input type="text" name="contactEmail" id="contactEmail" class="form-control" placeholder="请输入<%=DealerInfo.ALIAS_CONTACT_EMAIL%>..."  value="${dealerInfo.contactEmail}" maxlength="64" />
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-2 control-label">保证金</label>
							<div class="col-sm-4">
											<input type="text" name="originalMargin" id="originalMargin" class="form-control" placeholder="请输入保证金金额..."  value="${dealerInfo.originalMargin}" maxlength="64" />
							</div>
							<label class="col-sm-2 control-label">保证金倍率</label>
							<div class="col-sm-4">
											<input type="text" name="multiplying" id="multiplying" class="form-control" placeholder="请输入保证金倍率..."  value="${dealerInfo.multiplying}" maxlength="64" />
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-2 control-label">可用放款额度</label>
							<div class="col-sm-4">
											<input type="text" name="availableCredit" id="availableCredit" class="form-control" placeholder="请输入可用放款额度..."  value="${dealerInfo.availableCredit}" maxlength="64" />
							</div>
							<label class="col-sm-2 control-label">审核状态<span class="asterisk">*</span></label>
							<div class="col-sm-2">
								<form:select path="status" id="enabledSelectId" cssClass="width100p">
									<option/>请选择审核状态
	          						    <form:options items="${auditStatus}"/>  
	       						</form:select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">是否有店面<span class="asterisk">*</span></label>
							<div class="col-sm-2">
								<form:select path="isShopFront" id="isShopFront" onchange="ss()" cssClass="width100p">
									<option/>
	          						    <form:options items="${isShopFront}"/>  
	       						</form:select>
							</div>
							<div id="shop">
								<label class="col-sm-4 control-label">输入店面地址<span class="asterisk">*</span></label>
								<div class="col-sm-4">
									<input type="text" name="shopAddress" id="shopAddress" class="form-control" placeholder="请输入店面地址..."  value="${dealerInfo.shopAddress}" maxlength="64" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"></label>
							<div class="col-sm-4">
								<input type="hidden" value="${dealerInfo.onlineRes }" id="onlineRes" name="onlineRes" >
								<div class="ckbox ckbox-primary">
                                    <input type="checkbox" id="onlineResId" <c:if test="${dealerInfo.onlineRes }">checked="checked"</c:if>>
                                    <label for="checkboxPrimary">是否具有线上资源</label>
                                </div>
                             	<span style="color:red">具有线上资源的FA团队录单时需要验证客户手机号</span>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label"></label>
							<div class="col-sm-4">
								<input type="hidden" value="${dealerInfo.appointPlan }" id="appointPlan" name="appointPlan" >
								<div class="ckbox ckbox-primary">
                                    <input type="checkbox" id="appointPlanId" <c:if test="${dealerInfo.appointPlan }">checked="checked"</c:if>>
                                    <label for="checkboxPrimary">是否指定方案</label>
                                </div>
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-2 control-label">备注 </label>
							<div class="col-sm-10">
								<textarea rows="5" name="remark" class="form-control">${dealerInfo.remark}</textarea>
							</div>
						</div>
						<!-- form-group 
						<div class="form-group">
							<label class="col-sm-2 control-label">证件附件</label>
							<div class="col-sm-4">
									<a href="javascript:void(0);" id="cardNoFrontImage" class="btn btn-primary ">营业执照</a>
									<a href="javascript:void(0);" id="cardNoFrontImage" class="btn btn-primary ">组织机构代码证</a>
							</div>
						</div>-->
						<!-- form-group 
						<div class="form-group">
							<div class="row media-manager">
								<tags:showimg fileUrl="" fileName="营业执照" rootUrl="${rootUrl }" />
								<tags:showimg fileUrl="" fileName="组织机构代码证" rootUrl="${rootUrl }" />
							</div>
						</div>-->
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
	  
	   jQuery('#select-search-hide').select2({
           minimumResultsForSearch: -1
       });
	  
	  //check box handle
	  $('#onlineResId').parent().click(function(){
		  $('#onlineRes').val(!$('#onlineResId').is(':checked'))
		  $('#onlineResId').attr('checked',!$('#onlineResId').is(':checked'))
	  })
	  
	   $('#appointPlanId').parent().click(function(){
		  $('#appointPlan').val(!$('#appointPlanId').is(':checked'))
		  $('#appointPlanId').attr('checked',!$('#appointPlanId').is(':checked'))
	  })
	  
	  //为inputForm注册validate函数
	  $("#inputForm").validate({
			submitHandler: function(form){
                globalSubmitHandler(form,function(json){
                	$('.bs-organization-edit-modal').modal("hide"); 
 					refreshDiv("listDiv");
                });
			}
		});
	  $('#proivnceSelectId').select2({minimumResultsForSearch:-1});
	  $('#citySelectId').select2({minimumResultsForSearch:-1});
	  $('#districtSelectId').select2({minimumResultsForSearch:-1});
	  $('#enabledSelectId').val('${dealerInfo.status}').select2({minimumResultsForSearch:-1,placeholder:'请选择是否可用'});
	  $('#isShopFront').val('${dealerInfo.isShopFront}').select2({minimumResultsForSearch:-1,placeholder:'请选择是否有店面'});
	  
	  
	  initRemoteDataSelect2('selectFatherCodeid',"请选择所属经销商","${ctx}/dealerInfo/listByCodeJsonFatherCode.json");
	  
	  var proivnceSelectId = '${dealerInfo.province}';
	  initProivnceSelectOpt('proivnceSelectId',proivnceSelectId,'',function(){
		  if(proivnceSelectId){
			  $('#proivnceSelectId').val(proivnceSelectId).select2({minimumResultsForSearch:-1});
			  var citySelectId = '${dealerInfo.city}';
			  if(citySelectId){
				  initCitySelectOpt('citySelectId',citySelectId,proivnceSelectId,function(){
					  $('#citySelectId').val(citySelectId).select2({minimumResultsForSearch:-1});
					  
					  var districtSelectId = '${dealerInfo.zone}';
					  if(districtSelectId){
						  initDistrictSelectOpt('districtSelectId',districtSelectId,citySelectId,function(){
							  $('#districtSelectId').val(districtSelectId).select2({minimumResultsForSearch:-1});
						  });
					  }
				  });
			  }
		  }
	  });
	  $("#shop").hide();
	  ss();
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
  
  //是都有店面(显示店面地址)
  function ss(){
	  var value= $('#isShopFront option:selected') .val(); //选中的值
	  (value == 1) ? $("#shop").show() : $("#shop").hide();
  }
</script>