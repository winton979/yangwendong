<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.auth.entity.AdminRole"%>
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
	        		<ms:hasAnyPermission name="superAdmin,adminRole:create">
	        			<a href="${ctx}/adminRole/create" class="btn btn-success" data-toggle="modal" data-target=".bs-organization-edit-modal">创建</a>
	        		</ms:hasAnyPermission>
                </div>
	        </div>
	        <h4 class="panel-title"><i class="glyphicon glyphicon-search"></i>查询条件</h4>
	        <p>请输入相关的查询条件，点击查询</p>
	    </div>
	    <div class="panel-body">
	        <form class="form-inline" id="searchForm" action="${ctx}/adminRole/list" method="get" onsubmit="submitSearchRequest('searchForm','listDiv');return false;">
							<div class="form-group">
				                <label class="sr-only"><%=AdminRole.ALIAS_ROLE_CODE%></label>
				                <input type="text" id="roleCode" name="roleCodeIsLike" class="form-control" placeholder="<%=AdminRole.ALIAS_ROLE_CODE%>">
				            </div><!-- form-group -->
							<div class="form-group">
				                <label class="sr-only"><%=AdminRole.ALIAS_ROLE_DESC%></label>
				                <input type="text" id="roleDesc" name="roleDescIsLike" class="form-control" placeholder="<%=AdminRole.ALIAS_ROLE_DESC%>">
				            </div><!-- form-group -->
				            
				            <div class="form-group">
				                <label class="sr-only"><%=AdminRole.ALIAS_STATUS%></label>
				                    <select id="qEnabledSelectId" data-placeholder="请选择是否启用" name="statusEqualTo" class="width200">
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
    <div class="modal-dialog modal-lg" style="width:90%">
      <div class="modal-content">
      </div>
    </div>
</div>
<script>
    jQuery(document).ready(function(){
    	$('#qEnabledSelectId').select2({minimumResultsForSearch:-1});
	    //解决模式对象远程对象只加载一次的事件
      	$(".bs-organization-edit-modal").on("hidden.bs.modal", function() { $(this).removeData("bs.modal"); });
	    //查询
      	$('#searchForm').submit();
    });
</script>