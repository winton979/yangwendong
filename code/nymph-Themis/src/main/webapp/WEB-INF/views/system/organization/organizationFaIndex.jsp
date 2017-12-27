<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<script src="${ctx}/static/js/baiduMap.js"></script>
</head>
<body>
<div class="contentpanel">

	<div class="panel panel-default">
	    <div class="panel-heading">
	        <div class="panel-btns">
	            <a href="#" class="panel-minimize tooltips" data-toggle="tooltip" title="隐藏/显示"><i class="fa fa-minus"></i></a>
	        </div><!-- panel-btns -->
	        <ms:hasAnyPermission name="superAdmin,organization:fa">
		        <div class="pull-right">
		        	<div class="btn-list">
			        
		        		<a href="${ctx}/organization/faCreate" class="btn btn-success" data-toggle="modal" data-target=".bs-organization-edit-modal">创建车行</a>
	        			<ms:hasAnyPermission name="superAdmin,organization:exprotList">
	        				<a href="${ctx}/organization/exportOrganizationDate" class="btn btn-info">导出车行信息列表</a>
		        		</ms:hasAnyPermission>
	                </div>
		        </div>
	        </ms:hasAnyPermission>
	        <h4 class="panel-title"><i class="glyphicon glyphicon-search"></i>车行查询条件</h4>
	        <p>请输入相关的查询条件，点击查询</p>
	    </div>
	    <div class="panel-body">
	        <form class="form-inline" id="searchForm" action="${ctx}/organization/faList" method="get" onsubmit="submitSearchRequest('searchForm','listDiv');return false;">
	            <div class="form-group">
	                <label class="sr-only">车行名称</label>
	                <input type="text" name="orgNameIsLike" class="form-control" placeholder="请输入车行名称...">
	            </div><!-- form-group 车行名称 所属fa团队 开户行 账户 负责人 创建时间-->
	            
	            
	            
	          <div class="form-group">
	                <label class="sr-only">所属fa团队</label>
	               <input type="text" name="faCodeIsLike" id="selectFaCodeid" class="width150p"  style="width: 300px;" placeholder="请输入所属FA团队..."  value="${organization.faCode}" maxlength="64"  <c:if test="${formEdit eq 'non' }">readonly="readonly"</c:if>/>
	            </div> 
	            	
	            
	            <div class="form-group">
	                <label class="sr-only">开户行</label>
	                <input type="text" name="openingBankIsLike" class="form-control" placeholder="请输入开户行...">
	            </div>
	            
	            
	            <div class="form-group">
	                <label class="sr-only">账户</label>
	                <input type="text" name="bankAccountIsLike" class="form-control" placeholder="请输入账户...">
	            </div>
	            
	            
	            <div class="form-group">
	                <label class="sr-only">负责人</label>
	                <input type="text" name="contactPersonIsLike" class="form-control" placeholder="请输入负责人...">
	            </div>
	             <div class="form-group">
	                <label class="sr-only">创建时间</label>
	                <input type="text" name="createdDtIsLike" class="form-control" placeholder="请输入创建时间...">
	            </div>
	            <!-- form-group -->
				<!-- <div class="form-group">
					<div class="col-sm-4">
						<select id="qproivnceSelectId" data-placeholder="请选择省份" name="provinceEqualTo" class="width100p" onchange="javascript:onchangeProivnceSelected(this.value);">
							<option value="">请选择省份</option>
						</select>
					</div>
					<div class="col-sm-4">
						<select id="qcitySelectId" data-placeholder="请选择城市" name="cityEqualTo" class="width100p" onchange="javascript:onchangeCitySelected(this.value);">
							<option value="">请选择城市</option>
						</select>
					</div>
					<div class="col-sm-4">
						<select id="qdistrictSelectId" name="zoneEqualTo" data-placeholder="请选择市区、县、镇" class="width100p">
							<option value="">请选择市区、县、镇</option>
						</select>
					</div>
				</div> -->
	            <button type="submit" class="btn btn-primary mr5">查询</button>
	            <button type="reset" class="btn btn-default">重置</button>
	        </form>
	    </div><!-- panel-body -->
	</div><!-- panel -->

	<div id="listDiv">
	
	</div><!-- listdiv -->
	
</div><!-- contentpanel -->

<div id="bs-organization-edit-modal" class="modal fade bs-organization-edit-modal" tabindex="-1" role="dialog" data-backdrop="static">
    <div class="modal-dialog modal-lg" style="width:90%">
      <div class="modal-content">
      </div>
    </div>
</div>
       
 <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog">
     <div class="modal-dialog modal-sm" style="width:70%">
       <div class="modal-content">

       </div>
     </div>
 </div>
<script>
    jQuery(document).ready(function(){
      onchangeCountrySelected();
  	  $('#qproivnceSelectId').select2({minimumResultsForSearch:-1});
  	  $('#qcitySelectId').select2({minimumResultsForSearch:-1});
  	  $('#qdistrictSelectId').select2({minimumResultsForSearch:-1});
      $('#searchForm').submit();
	  //初始化远程下拉列表单个选择的数据
	  //initRemoteDataSelect2('selectOrgParentSid',"请选择上级4S店","${ctx}/organization/listByJson.json?orgParentSid=0");
	  initRemoteDataSelect2('selectFaCodeid',"请选择所属经销商","${ctx}/dealerInfo/listByCodeJson.json");
      //解决模式对象远程对象只加载一次的事件
      $(".bs-organization-edit-modal").on("hidden.bs.modal", function() { $(this).removeData("bs.modal"); });
      //解决模式对象远程对象只加载一次的事件
      $(".bs-example-modal-sm").on("hidden.bs.modal", function() { $(this).removeData("bs.modal"); });
    });
  //国家下拉改变，级联的省，市，区都要发生改变
    function onchangeCountrySelected(value){
  	  initProivnceSelectOpt('qproivnceSelectId','',value);
  	  onchangeProivnceSelected();
  	  onchangeCitySelected();
  	  $('#qproivnceSelectId').select2({minimumResultsForSearch:-1});
    }
    //省下拉改变，级联城市发生改变
    function onchangeProivnceSelected(value){
  	  initCitySelectOpt('qcitySelectId','',value);
  	  onchangeCitySelected();
  	  $('#qcitySelectId').select2({minimumResultsForSearch:-1});
    }
    //城市下拉改变，级联区下拉改变
    function onchangeCitySelected(value){
  	  initDistrictSelectOpt('qdistrictSelectId','',value);
  	  $('#qdistrictSelectId').select2({minimumResultsForSearch:-1});
    }
    
  //删除组织
   function deleteOrgan(sid){
	
   	alertDialog('真的要删除该条记录吗？',function(){
   		var url = "${ctx}/organization/delete/"+sid;
   		ajaxPostURL(url,null,function(response){
   			alertSuccessMessage(response.msg);
   			refreshDiv("listDiv");
   		})
   	});
   }
</script>
</body>
</html>