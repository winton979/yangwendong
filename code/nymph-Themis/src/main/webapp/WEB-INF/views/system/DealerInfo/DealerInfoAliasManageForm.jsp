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
							<label class="col-sm-2 control-label">经销商<%=DealerInfo.ALIAS_DEALER_NAME%><span class="asterisk">*</span></label>
							<div class="col-sm-7">
											<input type="text" name="dealerName" id="dealerName" class="form-control" disabled="disabled"  value="${dealerInfo.dealerName}" maxlength="255" required/>
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-2 control-label"><%=DealerInfo.ALIAS_NAME%><span class="asterisk">*</span></label>
							<div class="col-sm-7">
											<input type="text" name="aliasName" id="aliasName" class="form-control" value="${dealerInfo.aliasName}" maxlength="255" required/>
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">						
							<label class="col-sm-2 control-label">经销商地址<span class="asterisk">*</span></label>
							<div class="col-sm-2">
								<select disabled="disabled" id="proivnceSelectId" data-placeholder="请选择省份" name="province" class="width100p" onchange="javascript:onchangeProivnceSelected(this.value);" required>
									<option value="">请选择省份</option>
								</select>
							</div>
							<div class="col-sm-2">
								<select disabled="disabled" id="citySelectId" data-placeholder="请选择城市" name="city" class="width100p" onchange="javascript:onchangeCitySelected(this.value);" required>
									<option value="">请选择城市</option>
								</select>
							</div>
							<div class="col-sm-2">
								<select disabled="disabled" id="districtSelectId" name="zone" data-placeholder="请选择市区、县、镇" class="width100p" required>
									<option value="">请选择市区、县、镇</option>
								</select>
							</div>
							<div  class="col-sm-4">
								<input type="text" name="address" id="address" class="form-control" disabled="disabled" value="${dealerInfo.address}" maxlength="100"/>
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-2 control-label"><%=DealerInfo.ALIAS_BRAND_BUSINESS%></label>
							<div class="col-sm-4">
											<input type="text" name="brandBusiness" id="brandBusiness" class="form-control" disabled="disabled"  value="${dealerInfo.brandBusiness}" maxlength="255" />
							</div>
							<label class="col-sm-2 control-label"><%=DealerInfo.ALIAS_CONTACT_PERSON%><span class="asterisk">*</span></label>
							<div class="col-sm-4">
											<input type="text" name="contactPerson" id="contactPerson" class="form-control" disabled="disabled"  value="${dealerInfo.contactPerson}" maxlength="64" required/>
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-2 control-label"><%=DealerInfo.ALIAS_CONTACT_PHONE%></label>
							<div class="col-sm-4">
											<input type="text" name="contactPhone" id="contactPhone" class="form-control" disabled="disabled"  value="${dealerInfo.contactPhone}" maxlength="64" />
							</div>
							<label class="col-sm-2 control-label"><%=DealerInfo.ALIAS_CONTACT_EMAIL%></label>
							<div class="col-sm-4">
									<input type="text" name="contactEmail" id="contactEmail" class="form-control" disabled="disabled" value="${dealerInfo.contactEmail}" maxlength="64" />
							</div>
						</div>
						
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-2 control-label">备注 </label>
							<div class="col-sm-10">
								<textarea rows="5" name="remark" class="form-control" disabled="disabled">${dealerInfo.remark}</textarea>
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
</script>