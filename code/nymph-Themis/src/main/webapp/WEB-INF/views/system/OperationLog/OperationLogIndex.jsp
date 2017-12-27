<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.system.entity.OperationLog"%>
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
	        		<ms:hasAnyPermission name="superAdmin,operationLog:create">
	        			<a href="${ctx}/operationLog/create" class="btn btn-success" data-toggle="modal" data-target=".bs-organization-edit-modal">创建</a>
	        		</ms:hasAnyPermission>
                </div>
	        </div>
	        <h4 class="panel-title"><i class="glyphicon glyphicon-search"></i>查询条件</h4>
	        <p>请输入相关的查询条件，点击查询</p>
	    </div>
	    <div class="panel-body">
	        <form class="form-inline" id="searchForm" action="${ctx}/operationLog/list" method="get" onsubmit="submitSearchRequest('searchForm','listDiv');return false;">
							<div class="form-group">
				                <label class="sr-only"><%=OperationLog.ALIAS_OPERATED_TYPE%></label>
				                <input type="text" id="operatedType" name="operatedTypeEqualTo" class="form-control" placeholder="<%=OperationLog.ALIAS_OPERATED_TYPE%>">
				            </div><!-- form-group -->
							<div class="form-group">
				                <label class="sr-only"><%=OperationLog.ALIAS_OPERATED_USER_ID%></label>
				                <input type="text" id="operatedUserId" name="operatedUserIdEqualTo" class="form-control" placeholder="<%=OperationLog.ALIAS_OPERATED_USER_ID%>">
				            </div><!-- form-group -->
							<div class="form-group">
				                <label class="sr-only"><%=OperationLog.ALIAS_OPERATED_USER_TYPE%></label>
				                <input type="text" id="operatedUserType" name="operatedUserTypeEqualTo" class="form-control" placeholder="<%=OperationLog.ALIAS_OPERATED_USER_TYPE%>">
				            </div><!-- form-group -->
							<div class="form-group">
				                <label class="sr-only"><%=OperationLog.ALIAS_OPERATED_DES%></label>
				                <input type="text" id="operatedDes" name="operatedDesEqualTo" class="form-control" placeholder="<%=OperationLog.ALIAS_OPERATED_DES%>">
				            </div><!-- form-group -->
							<div class="form-group">
				                <label class="sr-only"><%=OperationLog.ALIAS_OPERATED_SOURCE%></label>
				                <input type="text" id="operatedSource" name="operatedSourceEqualTo" class="form-control" placeholder="<%=OperationLog.ALIAS_OPERATED_SOURCE%>">
				            </div><!-- form-group -->
							<div class="form-group">
				                <label class="sr-only"><%=OperationLog.ALIAS_OPERATED_TARGET%></label>
				                <input type="text" id="operatedTarget" name="operatedTargetEqualTo" class="form-control" placeholder="<%=OperationLog.ALIAS_OPERATED_TARGET%>">
				            </div><!-- form-group -->
							<div class="form-group">
				                <label class="sr-only"><%=OperationLog.ALIAS_OPERATED_DT%></label>
				            </div><!-- form-group -->
							<div class="form-group">
				                <label class="sr-only"><%=OperationLog.ALIAS_OPERATED_OBJECT_ID%></label>
				                <input type="text" id="operatedObjectId" name="operatedObjectIdEqualTo" class="form-control" placeholder="<%=OperationLog.ALIAS_OPERATED_OBJECT_ID%>">
				            </div><!-- form-group -->
							<div class="form-group">
				                <label class="sr-only"><%=OperationLog.ALIAS_OPERATED_CLASS%></label>
				                <input type="text" id="operatedClass" name="operatedClassEqualTo" class="form-control" placeholder="<%=OperationLog.ALIAS_OPERATED_CLASS%>">
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
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      </div>
    </div>
</div>
<script>
    jQuery(document).ready(function(){
	    //解决模式对象远程对象只加载一次的事件
      	$(".bs-organization-edit-modal").on("hidden.bs.modal", function() { $(this).removeData("bs.modal"); });
	    //查询
      	$('#searchForm').submit();
    });
</script>