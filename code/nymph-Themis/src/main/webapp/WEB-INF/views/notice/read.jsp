<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.user.entity.UserInfo"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />


<form id="basicForm" class="form-horizontal form-bordered">
	<input type="hidden" id="OrderSid" name="orderSid"
		value="${loansOrder.sid}"> <input type="hidden"
		id="CarPlanSid" name="carPlanSid" value="${carPlan.sid}">
	<!-- form-group -->
	<div class="form-group">
		<label class="col-sm-1 control-label">所属经销商<span
			class="asterisk">*</span></label>
		<div class="col-sm-3">
			<input type="text" name="faCode" id="selectFaCodeid"
				class="width100p" placeholder="请输入所属经销商..." title="所属经销商必填！"
				onchange="resetFaRelevance()" value="${loansOrder.faCode}"
				maxlength="64" required
				<c:if test="${formEdit eq 'non' }">readonly="readonly"</c:if> />
		</div>
		<label class="col-md-1 control-label">FA人员<span
			class="asterisk">*</span></label>
		<div class="col-md-3">
			<input type="text" id="selectFaUserInfo" class="width100p"
				name="createdBy" value="${loansOrder.createdBy}" onchange=""
				required
				<c:if test="${formEdit eq 'non' }">readonly="readonly"</c:if> />
		</div>
		<label class="col-md-1 control-label">车行店<span
			class="asterisk">*</span></label>
		<div class="col-md-3">
			<input type="text" id="selectOrgParentSid" class="width100p"
				name="orgCode" value="${loansOrder.orgCode}" required />
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-1 control-label">车辆类型<span
			class="asterisk">*</span></label>
		<div class="col-md-3">
			<select id="orderTypeSelectId" name="orderType"
				class="width100p required "
				onchange="selOrderType('orderTypeSelectId')">
				<c:forEach var="item" items="${orderTypeMap}">
					<option value="${item.key}"
						<c:if test="${loansOrder.orderType eq item.key}"> selected="selected" </c:if>>${item.value}</option>
				</c:forEach>
			</select>
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-1 control-label">品牌<span class="asterisk">*</span></label>
		<div class="col-md-3">
			<input type="text" id="selectBrandSid" class="width100p"
				name="brandSid" value="${carPlan.brandSid}" onchange="" />
		</div>
		<label class="col-md-1 control-label">车系<span class="asterisk">*</span></label>
		<div class="col-md-3">
			<input type="text" id="selectLineSid" class="width100p"
				name="brandSeriesSid" value="${carPlan.brandSeriesSid}" onchange="" />
		</div>
		<label class="col-md-1 control-label">车型<span class="asterisk">*</span></label>
		<div class="col-md-3">
			<input type="text" id="selectCarid" class="width100p" name="carSid"
				value="${carPlan.carSid}" />
		</div>
	</div>
	<!-- form-group -->
	<div class="form-group">
		<label class="col-md-1 control-label">贷款渠道<span
			class="asterisk">*</span></label>
		<div class="col-md-3">
			<select id="loansCanalSelect" data-placeholder="请选择贷款渠道"
				name="loansCanal" class="width100p " onchange="bindLoansPlan(this)"
				required>
				<c:forEach var="item" items="${loansCanalList}">
					<option value="${item.loansCanalCode}"
						<c:if test="${loansPlan.loansCanal eq item.loansCanalCode}"> selected="selected" </c:if>>${item.loansCanalName}</option>
				</c:forEach>
			</select>
		</div>
		<label class="col-md-1 control-label">贷款方案<span
			class="asterisk">*</span></label>
		<div class="col-md-3">
			<select id="loansCanalSelect2" data-placeholder="请选择贷款方案"
				name="loansCanal" class="width100p " onchange="bindLoansPlan(this)"
				required>
				<%-- <c:forEach var="item" items="${loansCanalList}">  
													<option value="${item.loansCanalCode}"   <c:if test="${loansPlan.loansCanal eq item.loansCanalCode}"> selected="selected" </c:if>   >${item.loansCanalName}</option>
												</c:forEach> --%>
				<c:forEach var="item" items="${tagMap}">
					<option value="${item.key}"
						<c:if test="${loansPlan.loansPlanTag eq item.key}">selected="selected"</c:if>>${item.value}</option>
				</c:forEach>
			</select>
		</div>
		<label class="col-md-1 control-label">产品方案<span
			class="asterisk">*</span></label>
		<div class="col-md-3">
			<select id="loansPlanSelect" data-placeholder="请选择产品方案"
				name="loansPalnSid" class="width100p "
				onchange="bindLoanPeriods(this,'periodsSelect')" required>
				<option title="0" value="">请选择产品方案</option>
			</select>
		</div>

	</div>
	<!-- form-group -->
	<div class="form-group">
		<label class="col-md-1 control-label">期数<span class="asterisk">*</span></label>
		<div class="col-md-3">
			<select id="periodsSelect" data-placeholder="请选择车系"
				name="payFinancing" class="width100p  asterisk" required>
				<option title="" value="">请选择期数</option>
			</select>
		</div>
		<label class="col-md-1 control-label">利率<span class="asterisk"></span></label>
		<div class="col-md-3">
			<input type="number" id="monthRateid" class="form-control"
				name="monthRate" value="${carPlan.monthRate}" readonly="readonly" />
		</div>
		<label class="col-md-1 control-label">最低首付比例<span
			class="asterisk"></span></label>
		<div class="col-md-3">
			<input type="number" id="payPercentid" class="form-control"
				name="payPercent" value="${carPlan.payPercent}" required
				readonly="readonly" />
		</div>
	</div>

	<div class="form-group">

		<label class="col-md-1 control-label">最高融资额<span
			class="asterisk">(￥)</span></label>
		<div class="col-md-3">
			<input type="text" id="loansAmount" class="form-control"
				name="loansAmount" value="${carPlan.loansAmount}"
				readonly="readonly" />
		</div>

		<label class="col-md-1 control-label">最低首付金额<span
			class="asterisk">(￥)</span></label>
		<div class="col-md-3">
			<input type="text" id="firstPayAmout" class="form-control"
				name="firstPayAmout" value="${carPlan.firstPayAmout}" readonly="readonly" />
		</div>

		<label class="col-md-1 control-label">月供金额<span
			class="asterisk">(￥)</span></label>
		<div class="col-md-3">
			<input type="text" id="monthPayAmount" class="form-control"
				name="monthPayAmount" value="${carPlan.monthPayAmount}"
				readonly="readonly" />
		</div>
	</div>

	<div style="border: 1px solid #D69A41; display: none" id="esDiv">
		<div class="form-group" id="secondHand1"
			style="background-color: rgb(249, 248, 248)">
			<label class="col-md-1 control-label">公里数 (万公里)<span
				class="asterisk">*</span></label>
			<div class="col-md-3">
				<input type="text" name="loansOrderAttr.mileage" id="mileage"
					value="${loansOrder.loansOrderAttr.mileage}" class="form-control"
					required />
			</div>
			<label class="col-md-1 control-label">提报预估价<span
				class="asterisk">*</span></label>
			<div class="col-md-3">
				<input type="number" name="loansOrderAttr.futurePrices"
					id="futurePrices" value="${loansOrder.loansOrderAttr.futurePrices}"
					class="form-control" required />
			</div>
			<label class="col-md-1 control-label">车架号<span
				class="asterisk">*</span></label>
			<div class="col-md-3">
				<input type="text" name="loansOrderAttr.vin" id="vin"
					value="${loansOrder.loansOrderAttr.vin}" class="form-control"
					required />
			</div>
		</div>
		<div class="form-group" id="secondHand2"
			style="background-color: rgb(249, 248, 248)">
			<label class="col-md-1 control-label">出厂日期<span
				class="asterisk">*</span></label>
			<div class="col-md-3">
				<input type="text" name="loansOrderAttr.vehicleMadeDate"
					class="form-control"
					value="${loansOrder.loansOrderAttr.vehicleMadeDate}"
					placeholder="yyyy-MM-dd" id="birthdayVehicleMadeDate" required>

			</div>
			<label class="col-md-1 control-label">初登日期<span
				class="asterisk">*</span></label>
			<div class="col-md-3">
				<input type="text" name="loansOrderAttr.recordDate"
					class="form-control"
					value="${loansOrder.loansOrderAttr.recordDate}"
					placeholder="yyyy-MM-dd" id="birthdayRecordDate" required />
			</div>
			<label class="col-md-1 control-label">车牌号<span
				class="asterisk">*</span></label>
			<div class="col-md-3">
				<input type="text" name="loansOrderAttr.licensePlateNumber"
					id="licensePlateNumber"
					value="${loansOrder.loansOrderAttr.licensePlateNumber}"
					class="form-control" required />
			</div>
		</div>
		<div class="form-group" id="secondHand3"
			style="background-color: rgb(249, 248, 248)">
			<label class="col-md-1 control-label">评估机构<span
				class="asterisk">*</span></label>
			<div class="col-md-3">
				<input type="text" name="loansOrderAttr.assessmentAgencies"
					id="assessmentAgencies"
					value="${loansOrder.loansOrderAttr.assessmentAgencies}"
					class="form-control" required />
			</div>
		</div>

	</div>

	<c:if test="${loansOrder.nodeSid == null}">
		<div class="form-group"> 
			<label class="col-md-1 control-label">开票价<span class="asterisk">*</span></label>
			<div class="col-md-5">
				<input type="number" name="invoiceAmount" value="0" id="invoiceAmount" class="form-control" onchange="loansPlanAjax()" required />
			</div>
			<label class="col-md-1 control-label">手续费<span
				class="asterisk">*</span></label>
			<div class="col-md-5">
				<input type="number" name="carPlanAttrInfo.poundage" id="poundage" value="0" class="form-control" onchange="loansPlanAjax()" required />
			</div>
		</div> 
		<div class="form-group">
			<label class="col-md-1 control-label">保险金额<span
				class="asterisk">*</span></label>
			<div class="col-md-5">

				<input type="number" name="carPlanAttrInfo.insuranceAmount"
					id="insuranceAmount" value="0" class="form-control"
					onchange="loansPlanAjax()" required />

			</div>
			<label class="col-md-1 control-label">GPS费用<span
				class="asterisk">*</span></label>
			<div class="col-md-5">

				<input type="number" name="carPlanAttrInfo.gpsAmount" id="gpsAmount"
					value="0" class="form-control" onchange="loansPlanAjax()" required />

			</div>
		</div>
		<div class="form-group">
			<label class="col-md-1 control-label">购置税<span
				class="asterisk">*</span></label>
			<div class="col-md-5">

				<input type="number" name="carPlanAttrInfo.purchaseTax"
					id="insuranceAmount" value="0" class="form-control"
					onchange="loansPlanAjax()" required />

			</div>
			<label class="col-md-1 control-label">保证金金额<span
				class="asterisk">*</span></label>
			<div class="col-md-5">

				<input type="number" name="carPlanAttrInfo.ensureAmount"
					id="insuranceAmount" value="0" class="form-control"
					onchange="loansPlanAjax()" required />

			</div>
		</div>
	</c:if>

	<!-- form-group -->
	<c:if test="${loansOrder.nodeSid != null}">
	
		<div class="form-group">
			<label class="col-md-1 control-label">开票价<span class="asterisk">*</span></label>
			<div class="col-md-5">
				<input type="number" name="invoiceAmount" value="${carPlan.invoiceAmount}" id="invoiceAmount" class="form-control" onchange="loansPlanAjax()" required />
			</div>
			<label class="col-md-1 control-label">手续费<span
				class="asterisk">*</span></label>
			<div class="col-md-5">
				<input type="number" name="carPlanAttrInfo.poundage" id="poundage" value="${carPlan.carPlanAttrInfo.poundage}" class="form-control" onchange="loansPlanAjax()" required />
			</div>
		</div>
		<!-- form-group -->
		<div class="form-group">
			<label class="col-md-1 control-label">保险金额<span
				class="asterisk">*</span></label>
			<div class="col-md-5">

				<input type="number" name="carPlanAttrInfo.insuranceAmount"
					id="insuranceAmount"
					value="${carPlan.carPlanAttrInfo.insuranceAmount}"
					class="form-control" onchange="loansPlanAjax()" required />

			</div>
			<label class="col-md-1 control-label">GPS费用<span
				class="asterisk">*</span></label>
			<div class="col-md-5">

				<input type="number" name="carPlanAttrInfo.gpsAmount" id="gpsAmount"
					value="${carPlan.carPlanAttrInfo.gpsAmount}" class="form-control"
					onchange="loansPlanAjax()" required />

			</div>
		</div>
		<!-- form-group -->
		<div class="form-group">
			<label class="col-md-1 control-label">购置税<span
				class="asterisk">*</span></label>
			<div class="col-md-5">

				<input type="number" name="carPlanAttrInfo.purchaseTax"
					id="insuranceAmount" value="${carPlan.carPlanAttrInfo.purchaseTax}"
					class="form-control" onchange="loansPlanAjax()" required />

			</div>
			<label class="col-md-1 control-label">保证金金额<span
				class="asterisk">*</span></label>
			<div class="col-md-5">

				<input type="number" name="carPlanAttrInfo.ensureAmount"
					id="insuranceAmount"
					value="${carPlan.carPlanAttrInfo.ensureAmount}"
					class="form-control" onchange="loansPlanAjax()" required />

			</div>
		</div>
	</c:if>


	<!-- 贷款方案信息  -->
	<div style="border: 1px solid #D69A41" >
		<div class="form-group">

			<label class="col-md-1 control-label">首付比例选择<span
				class="asterisk"></span></label>
			<div class="col-md-3">
				<input type="number" id="realPayPercent" class="form-control"
					name="realPayPercent" value="${carPlan.realPayPercent}" 
					  onchange="changeRealPayPercent()" required/>
					<span id="realPayPercentError"	class="asterisk"></span>
			</div>
			
			<label class="col-md-1 control-label">车价融资金额选择<span
				class="asterisk">(￥)*</span></label>
			<div class="col-md-3">
				<input type="text" id="carLoansAmount" class="form-control"
					name="carLoansAmount" value="${carPlan.carLoansAmount}"  onchange="changeCarLoansAmount()"  />
					<span id="carLoansAmountError"	class="asterisk"></span>
			</div>
		</div>
		
	
		<div class="form-group">
		<label class="col-md-1 control-label">总融资额选择<span
			class="asterisk">(￥)</span></label>
		<div class="col-md-3">
			<input type="text" id="realLoansAmount" class="form-control"
				name="realLoansAmount" value="${carPlan.realLoansAmount}"
				readonly="readonly"/>
		</div>

		<label class="col-md-1 control-label">首付金额选择<span
			class="asterisk">(￥)</span></label>
		<div class="col-md-3">
			<input type="text" id="realFirstPayAmout" class="form-control"
				name="realFirstPayAmout" value="${carPlan.realFirstPayAmout}" readonly="readonly" />
		</div>

		<label class="col-md-1 control-label">月供金额选择<span
			class="asterisk">(￥)</span></label>
		<div class="col-md-3">
			<input type="text" id="realMonthPayAmount" class="form-control"
				name="realMonthPayAmount" value="${carPlan.realMonthPayAmount}"
				readonly="readonly" />
		</div>
	</div>


	</div>



	<!-- form-group -->
	<div class="form-group">
		<label class="col-sm-1 control-label">备注</label>
		<div class="col-sm-8">
			<textarea rows="10" name="loansOrderAttr.remark" class="form-control"
				placeholder="请输入.." maxlength="500">${loansOrder.loansOrderAttr.remark}</textarea>
		</div>
	</div>
	<!-- form-group -->
	<div class="form-group  ">
		<div class="col-md-5"></div>
		<div class="col-md-5">
			<a href="javascript:submitBt();" class="btn btn-primary">保存</a>
		</div>
		<div class="col-md-5"></div>
	</div>
</form>
<!--modal-body-->
<script type="text/javascript">
	//初始化表单上传模块
	$(document)
			.ready(
					function() {
						jQuery("#basicForm").validate({

							submitHandler : function(form) {
								submitAjax();
								return false;
							},
							showErrors : function(errorMap, errorList) {
								closeLoadingDialog();
								//alertErrorMessage("你有" + this.numberOfInvalids() + "个必填项未填写！");
								this.defaultShowErrors();
							}
						});
						$('#secondHand1').hide();
						$('#secondHand2').hide();
						$('#secondHand3').hide();
						//初始化日期

						$("#birthdayVehicleMadeDate").mask("9999-99-99");
						$("#birthdayRecordDate").mask("9999-99-99");
						//初始化远程下拉列表单个选择的数据
						initRemoteDataSelect2Cascade(
								'selectOrgParentSid',
								"请选择4S店",
								"${ctx}/organization/listByCodeJsonFaCode.json",
								"selectFaCodeid");
						initRemoteDataSelect2Father('selectFaUserInfo',
								"请选择车FA人员",
								"${ctx}/userInfo/listByCodeJsonFaCode.json?",
								"selectFaCodeid", "请选择所以属经销商！");
						initRemoteDataSelect2Father(
								'selectLineSid',
								"请选择车系",
								"${ctx}/brandInfo/listByJsonFatherId.json?brandLevel=1",
								"selectBrandSid", "请选择品牌！");
						initRemoteDataSelect2Father(
								'selectCarid',
								"请选择车型",
								"${ctx}/brandInfo/listByJsonFatherId.json?brandLevel=2",
								"selectLineSid", "请选择车系！");

						initRemoteDataSelect2('selectFaCodeid', "请选择所属经销商",
								"${ctx}/dealerInfo/listByCodeJson.json");
						initRemoteDataSelect2('selectBrandSid', "请选择汽车品牌",
								"${ctx}/brandInfo/listByJson.json?brandLevel=0");
						$('#loansCanalSelect').select2({
							minimumResultsForSearch : -1,
							placeholder : '请选择贷款渠道'
						});
						$('#loansCanalSelect2').select2({
							minimumResultsForSearch : -1,
							placeholder : '请选择贷款方案'
						});

						$('#orderTypeSelectId').select2({
							minimumResultsForSearch : -1
						});
						intiLoansPlan();
						selOrderType('orderTypeSelectId');

					});

	function submitBt() {
		loadingDialog();
		jQuery("#basicForm").submit();
	}

	function submitAjax() {

		$("#basicForm").ajaxSubmit({
			type : "post", //提交方式  
			dataType : "json", //数据类型  
			url : "${ctx}/loansOrderSubstep/loanCarInfoForm", //请求url  
			success : function(data) { //提交成功的回调函数  
				closeLoadingDialog();
				$("#OrderSid").val(data.orderID);
				$("#CarPlanSid").val(data.carPlanID);
				setOrdersid(data.orderID);
				alertSuccessMessage("保存成功！");
			},
			error : function() {
				alertErrorMessage("保存失败！");
				closeLoadingDialog();
			}
		});
	}

	/**
	 * 生成贷款方案函数 changeRealPayPercent()
	 */
	function loansPlanAjax() {

		//开票价
		var invoiceAmount = document.getElementById("invoiceAmount").value;
		//选择的首付比例
		var realPayPercent = document.getElementById("realPayPercent").value;
		$("#carLoansAmount").val((
				Number(invoiceAmount) * Number((100 - realPayPercent) / 100)).toFixed(2));

		$("#basicForm").ajaxSubmit({
			type : "post", //提交方式  
			dataType : "json", //数据类型  
			url : "${ctx}/loansOrderSubstep/loanCarInfoForm", //请求url  
			success : function(data) { //提交成功的回调函数  
				closeLoadingDialog();
				$("#OrderSid").val(data.orderID);
				$("#CarPlanSid").val(data.carPlanID);
				$("#firstPayAmout").val(data.firstPayAmout);
				$("#loansAmount").val(data.loansAmount);
				$("#monthPayAmount").val(data.monthPayAmount);
				
				$("#realFirstPayAmout").val(data.realFirstPayAmout);
				$("#realLoansAmount").val(data.realLoansAmount);
				$("#realMonthPayAmount").val(data.realMonthPayAmount);
				setOrdersid(data.orderID);

			},
			error : function() {
				alertErrorMessage("请先把上面有关必选项填完！");
				closeLoadingDialog();
			}
		});
	}
	
	
	/**
	 * 修改实际首付比例 实际贷款方案
	 */
	function changeRealPayPercent() {

		//开票价
		var invoiceAmount = document.getElementById("invoiceAmount").value;
		//选择的首付比例
		var realPayPercent = document.getElementById("realPayPercent").value;
		//最低首付比例
		var payPercentid = document.getElementById("payPercentid").value;
		if(realPayPercent < payPercentid){
			document.getElementById("realPayPercentError").innerHTML="不能低于最低首付比例"+payPercentid +"!";
			document.getElementById("realPayPercent").value="";
			return false;
		}
		document.getElementById("realPayPercentError").innerHTML="";
		
		//计算车价融资额
		$("#carLoansAmount").val(
				(Number(invoiceAmount) * Number((100 - realPayPercent) / 100)).toFixed(2));

		$("#basicForm").ajaxSubmit({
			type : "post", //提交方式  
			dataType : "json", //数据类型  
			url : "${ctx}/loansOrderSubstep/loanCarInfoForm", //请求url  
			success : function(data) { //提交成功的回调函数  
				closeLoadingDialog();
				$("#OrderSid").val(data.orderID);
				$("#CarPlanSid").val(data.carPlanID);
				$("#realFirstPayAmout").val(data.realFirstPayAmout);
				$("#realLoansAmount").val(data.realLoansAmount);
				$("#realMonthPayAmount").val(data.realMonthPayAmount);
				
				$("#realFirstPayAmout").val(data.realFirstPayAmout);
				$("#realLoansAmount").val(data.realLoansAmount);
				$("#realMonthPayAmount").val(data.realMonthPayAmount);
				setOrdersid(data.orderID);

			},
			error : function() {
				alertErrorMessage("请先把上面有关必选项填完！");
				closeLoadingDialog();
			}
		});
	}
	
	
	/**
	 * 修改实际首付比例 实际贷款方案
	 */
	function changeCarLoansAmount() {

		
		//开票价
		var invoiceAmount = document.getElementById("invoiceAmount").value;
		//选择的车价融资额
		var carLoansAmount = document.getElementById("carLoansAmount").value;
		//最低首付比例
		var payPercentid = document.getElementById("payPercentid").value;
		
		if(carLoansAmount > invoiceAmount*((100-payPercentid)/100)){
			document.getElementById("carLoansAmountError").innerHTML="不能高于最高车价融资额"+invoiceAmount*((100-payPercentid)/100) +"!";
			document.getElementById("carLoansAmount").value="";
			return false;
		}
		document.getElementById("carLoansAmountError").innerHTML="";
		
		//计算实际选择的首付贷款比例
		$("#realPayPercent").val((100-(carLoansAmount/invoiceAmount)*100).toFixed(2));

		$("#basicForm").ajaxSubmit({
			type : "post", //提交方式  
			dataType : "json", //数据类型  
			url : "${ctx}/loansOrderSubstep/loanCarInfoForm", //请求url  
			success : function(data) { //提交成功的回调函数  
				closeLoadingDialog();
				$("#OrderSid").val(data.orderID);
				$("#CarPlanSid").val(data.carPlanID);
				$("#realFirstPayAmout").val(data.realFirstPayAmout);
				$("#realLoansAmount").val(data.realLoansAmount);
				$("#realMonthPayAmount").val(data.realMonthPayAmount);
				setOrdersid(data.orderID);

			},
			error : function() {
				alertErrorMessage("请先把上面有关必选项填完！");
				closeLoadingDialog();
			}
		});
	}


	function selOrderType(id) {
		var orderType = $('#' + id).val();
		if (orderType == '1') {
			$('#esDiv').hide();
			$('#secondHand1').hide();
			$('#secondHand2').hide();
			$('#secondHand3').hide();

		} else {
			$('#esDiv').show();
			$('#secondHand1').show();
			$('#secondHand2').show();
			$('#secondHand3').show();
		}
	}

	//选择车型切换产品方案
	function bindLoansPlan(loansCanalDoc) {
		//var loansCanal = loansCanalDoc.options[loansCanalDoc.selectedIndex].value;
		//
		var loansCanal = $('#loansCanalSelect').val();
		var loansPlanTag = $('#loansCanalSelect2').val();
		console.log(loansCanal + "-" + loansPlanTag)
		if (loansCanal == null || loansCanal == '' || loansPlanTag == null
				|| loansPlanTag == '')
			return;
		initLoanSelectOpt("loansPlanSelect", "", loansCanal
				+ "&LoansPlanTagEqualTo=" + loansPlanTag);
		$('#loansPlanSelect').select2({
			minimumResultsForSearch : -1
		});
		var $countryIds = $('#periodsSelect');
		$("option[value!='']", $countryIds).remove();
		$('#periodsSelect').select2({
			minimumResultsForSearch : -1
		});
	}

	//初始方案
	function intiLoansPlan() {
		var $loansCanalSelect = $("#loansCanalSelect");
		var loansCanal = $("#loansCanalSelect").val();
		var loansPlanTag = $('#loansCanalSelect2').val();
		initLoanSelectOpt(
				"loansPlanSelect",
				"${loansPlan.sid}",
				loansCanal + "&LoansPlanTagEqualTo=" + loansPlanTag,
				function(a, b, c, d) {
					var $countryId = $('#periodsSelect');
					var periods = b;
					var selectedId = '${carPlan.payFinancing}';
					$("option[value!='']", $countryId).remove();
					var _optionStr = '';
					if (periods.length > 0) {
						$("#monthRateid").val(c);
						//$("#payPercentid").val(d);
						var q = periods.split(",");
						for (var i = 0; i < q.length; i++) {
							var y = q[i].split(":");
							if (selectedId && y[0] == selectedId) {
								_optionStr += "<option  value='" + y[0]
								+ "' selected>"
										+ y[0] + "</option>";
							} else {
								_optionStr += "<option  value='" + y[0]
								+ "'>"
										+ y[0] + "</option>";
							}
						}
						if (_optionStr != '') {
							$countryId.append($(_optionStr));
						}
					}
					$('#periodsSelect').select2({
						minimumResultsForSearch : -1
					});
					$('#loansPlanSelect').val('${loansPlan.sid}').select2({
						minimumResultsForSearch : -1
					});

				});

	}

	//产品方案期数
	function bindLoanPeriods(loanSele, countryId, selectedId) {
		var $countryId = $('#' + countryId);
		var periods = loanSele.options[loanSele.selectedIndex].title;
		var lv = loanSele.options[loanSele.selectedIndex].label;
		var lb = lv.split(",");
		if (lb.length > 0) {
			$("#monthRateid").val(lb[0]);
			$("#payPercentid").val(lb[1]);
			$("#realPayPercent").val(lb[1]);
		}
		$("option[value!='']", $countryId).remove();
		var _optionStr = '';
		if (periods.length > 0) {
			var q = periods.split(",");
			for (var i = 0; i < q.length; i++) {
				var y = q[i].split(":");
				if (selectedId && y[0] == selectedId) {
					_optionStr += "<option  value='" + y[0]
						+ "' selected>"
							+ y[0] + "</option>";
				} else {
					_optionStr += "<option  value='" + y[0]
						+ "'>"
							+ y[0] + "</option>";
				}
			}
			if (_optionStr != '') {
				$countryId.append($(_optionStr));
			}
		}
		$('#periodsSelect').select2({
			minimumResultsForSearch : -1
		});

	}
</script>