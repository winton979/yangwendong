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
	        		<ms:hasAnyPermission name="superAdmin,adminOrg:create">
	        			<a href="${ctx}/adminOrg/create" class="btn btn-success" data-toggle="modal" data-target=".bs-organization-edit-modal">创建</a>
	        		</ms:hasAnyPermission>
                </div>
	        </div>
	        <h4 class="panel-title"><i class="glyphicon glyphicon-search"></i>查询条件</h4>
	        <p>请输入相关的查询条件，点击查询</p>
	    </div>
	    <div class="panel-body">
	        <form class="form-inline" id="searchForm" action="${ctx}/adminOrg/list?pageLimit=10" method="get" onsubmit="submitSearchRequest('searchForm','listDiv');return false;">
							<!-- form-group -->
							<div class="form-group">
				                <label class="sr-only">机构名称</label>
				                <input type="text" name="orgNameIsLike" class="form-control" placeholder="机构名称">
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
<script>
    jQuery(document).ready(function(){
	    //查询
      	$('#searchForm').submit();
    });
    
</script>