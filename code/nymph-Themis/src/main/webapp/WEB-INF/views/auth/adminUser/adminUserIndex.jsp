<%@ page contentType="text/html;charset=UTF-8"%>
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
	        			<a href="${ctx}/adminUser/create" class="btn btn-success" data-toggle="modal" data-target=".bs-organization-edit-modal">创建用户</a>
                </div>
	        </div>
	        <h4 class="panel-title"><i class="glyphicon glyphicon-search"></i>用户查询条件</h4>
	        <p>请输入相关的查询条件，点击查询</p>
	    </div>
	    <div class="panel-body">
	        <form class="form-inline" id="searchForm" action="${ctx}/adminUser/list" method="get" onsubmit="submitSearchRequest('searchForm','listDiv');return false;">
	            <div class="form-group">
	                <label class="sr-only">登录账号</label>
	                <input type="text" name="userNameIsLike" class="form-control" placeholder="用户账号">
	            </div><!-- form-group -->
	            
	            <div class="form-group">
	                <label class="sr-only">用户姓名</label>
	                <input type="text" name="realNameLisk"  class="form-control" placeholder="用户姓名">
	            </div><!-- form-group -->
	            
	            
	            <div class="form-group">
	                <label class="sr-only">所属机构</label>
	                <select id="queryOrgCode" data-placeholder="所属分支机构..." name="adminOrgSidEqualTo" class="width100p " >
						<option value="">请选择所属分支机构...</option>
						<c:forEach var="item" items="${orgs}">
							<option value="${item.sid}">${item.orgName}</option>
						</c:forEach>
					</select>
	            </div><!-- form-group -->
	            
	            <div class="form-group">
	                <label class="sr-only">用户所属组</label>
	                <select id="qUserTypeSelectId" data-placeholder="请选择所属组" name="userTypeEqualTo" class="width200">
							<option value="">请选择所属组</option>
							<c:forEach items="${userTypeMap }" var="userType">
							<option value="${userType.key}">${userType.value}</option>
							</c:forEach>
							<%-- <c:forEach items="${adminRoles}" var="userType">
						<option value="${userType.sid}">${userType.roleDesc}</option>
						</c:forEach> --%>
						</select>
	            </div><!-- form-group -->
	            
	            <div class="form-group">
	                <label class="sr-only">是否启用</label>
	                    <select id="qEnabledSelectId" data-placeholder="请选是否启用" name="enabledEqualTo" class="width200">
							<option value="">请选是否启用</option>
							<c:forEach items="${enabledMap}" var="enable">
							   <option value="${enable.key}">${enable.value}</option>
							</c:forEach>
						</select>
	            </div><!-- form-group -->
	            
	           
	            <button type="submit" class="btn btn-primary mr5">查询</button>
	            <button type="reset" class="btn btn-default">重置</button>
	        </form>
	    </div><!-- panel-body -->
	</div><!-- panel -->

	<div id="listDiv">
	
	</div><!-- listdiv -->
	
</div><!-- contentpanel -->

<div class="modal fade bs-organization-edit-modal" tabindex="-1" role="dialog" data-backdrop="static">
    <div class="modal-dialog modal-lg" style="width:80%">
      <div class="modal-content">
      </div>
    </div>
</div>
<script>
    jQuery(document).ready(function(){
    	//设置所属组为下拉列表
      	$('#qUserTypeSelectId').select2({minimumResultsForSearch:-1});
    	//设置启用状态为下拉列表
  	  	$('#qEnabledSelectId').select2({minimumResultsForSearch:-1});
      	//初始化远程下拉列表单个选择的数据
      	//
      	$('#queryOrgCode').select2({minimumResultsForSearch:-1});
  	  	//initRemoteDataSelect2('queryOrgCode',"请选择机构","${ctx}/organization/listByCodeJson.json");
	    //解决模式对象远程对象只加载一次的事件
      	$(".bs-organization-edit-modal").on("hidden.bs.modal", function() { $(this).removeData("bs.modal"); });
	    //查询
      	$('#searchForm').submit();
    });
    
  //删除组织
   function deleteAdminUser(sid){
   	alertDialog('真的要删除该条记录吗？',function(){
   		var url = "${ctx}/adminUser/delete/"+sid;
   		ajaxPostURL(url,null,function(response){
   			alertSuccessMessage(response.msg);
   			refreshDiv("listDiv");
   		})
   	});
   }
</script>