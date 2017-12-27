<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.system.entity.DealerInfo"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<div class="contentpanel">
	<div class="panel panel-default">
	    <div class="panel-heading">
	        <div class="panel-btns">
	            <a href="#" class="panel-minimize tooltips" data-toggle="tooltip" title="隐藏/显示"><i class="fa fa-minus"></i></a>
	        </div><!-- panel-btns -->
	        <div class="pull-right">
	        	
                 <div class="btn-list">
			        <ms:hasAnyPermission name="superAdmin,dealerInfo:create">
		        		<a href="${ctx}/dealerInfo/create" class="btn btn-success" data-toggle="modal" data-target=".bs-organization-edit-modal">创建</a>
	        		</ms:hasAnyPermission>	
	        			
	        				<a href="javascript:void(0);" onclick="exportDealerInfo()"class="btn btn-info">导出FA团队信息</a>
		        		
	                </div>
                <%-- <div class="btn-list" >
			        
		        	<a href="javascript:void(0);" onclick="exportDealerInfo()"  class="btn btn-block btn-outline btn-primary">导出FA团队信息</a>
	        		<ms:hasAnyPermission name="superAdmin,dealerInfo:create">
	        			<a href="${ctx}/dealerInfo/create" class="btn btn-success" data-toggle="modal" data-target=".bs-organization-edit-modal">创建</a>
	        		</ms:hasAnyPermission>
	               </div> --%>
               
	        </div>
	        
	       
	        <h4 class="panel-title"><i class="glyphicon glyphicon-search"></i>查询条件</h4>
	        <p>请输入相关的查询条件，点击查询</p>
	    </div>
	    <div class="panel-body">
	        <form class="form-inline" id="searchForm" action="${ctx}/dealerInfo/list?pageLimit=50" method="get" onsubmit="submitSearchRequest('searchForm','listDiv');return false;">
							<!-- form-group -->
							<div class="form-group">
				                <label class="sr-only"><%=DealerInfo.ALIAS_DEALER_NAME%></label>
				                <input type="text" id="dealerName" name="dealerNameIsLike" class="form-control" placeholder="<%=DealerInfo.ALIAS_DEALER_NAME%>">
				            </div>
							<div class="form-group">
				                <label class="sr-only"><%=DealerInfo.ALIAS_CONTACT_PERSON%></label>
				                <input type="text" id="contactPerson" name="contactPersonEqualTo" class="form-control" placeholder="<%=DealerInfo.ALIAS_CONTACT_PERSON%>">
				            </div><!-- form-group -->
							<div class="form-group">
				                <label class="sr-only"><%=DealerInfo.ALIAS_CONTACT_PHONE%></label>
				                <input type="text" id="contactPhone" name="contactPhoneEqualTo" class="form-control" placeholder="<%=DealerInfo.ALIAS_CONTACT_PHONE%>">
				            </div>
				           
				            
				              <div class="form-group">
	                <label class="sr-only">状态</label>
	                <select id="statusId" data-placeholder="请选择状态" name="statusEqualTo" class="width200">
							<option value="">请选择状态</option>
							<c:forEach items="${auditStatus }" var="userType">
							<option value="${userType.key}">${userType.value}</option>
							</c:forEach>
							<%-- <c:forEach items="${adminRoles}" var="userType">
						<option value="${userType.sid}">${userType.roleDesc}</option>
						</c:forEach> --%>
						</select>
	            </div>
				            <div class="form-group">
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
							</div>
	            <button type="submit" class="btn btn-primary mr5">查询</button>
	            <button type="reset" class="btn btn-default">重置</button>
	        </form>
	    </div><!-- panel-body -->
	</div><!-- panel -->

	<div id="listDiv">
	
	</div><!-- listdiv -->
	
</div><!-- contentpanel -->

<div class="modal fade bs-organization-edit-modal" tabindex="-1" role="dialog" data-backdrop="static">
    <div class="modal-dialog modal-lg" style="width:60%">
      <div class="modal-content">
      </div>
    </div>
</div>
<div id="showPicModal2" class="modal fade" tabindex="-1" role="dialog"  >
     <div class="modal-dialog modal-sm" style="width:985px">
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
    	  $('#statusId').select2({minimumResultsForSearch:-1});
	    //解决模式对象远程对象只加载一次的事件
      	$(".bs-organization-edit-modal").on("hidden.bs.modal", function() { $(this).removeData("bs.modal"); });
	    //查询
      	$('#searchForm').submit();
    });
    
    function   exportDealerInfo(){
    	     
    /* 	var  status=$('#statusId').val();
    	var  dealerName=$('#dealerName').val();
    	var  contactPerson=$('#contactPerson').val();
    	var  contactPhone=$('#contactPhone').val();
    	var  qcitySelectId=$('#qcitySelectId').val();
    	var  qdistrictSelectId=$('#qdistrictSelectId').val();
    	var  qproivnceSelectId=$('#qproivnceSelectId').val();
    	location.href='${ctx}/dealerInfo/exportDealerInfo?statusEqualTo='+status+'&provinceEqualTo='+qproivnceSelectId+'&cityEqualTo='+qcitySelectId+'&zoneEqualTo='+qdistrictSelectId+'&dealerNameIsLike='+dealerName+'&contactPersonEqualTo='+contactPerson+'&contactPhoneEqualTo='+contactPhone;
    */
    	location.href='${ctx}/dealerInfo/exportDealerInfo';
    
    }
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
</script>