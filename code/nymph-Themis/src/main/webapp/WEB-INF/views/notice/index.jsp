<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<div class="contentpanel">
	<div class="panel panel-default" style="display: none">
	    <div class="panel-heading">
	        <div class="pull-right">
	        	<div class="btn-list">
	        		<ms:hasAnyPermission name="superAdmin,report:status">
	        			<%-- <a href="${ctx}/report/orderStatusReportForm" class="btn btn-info" data-toggle="modal" data-target=".bs-organization-edit-modal">导出业务跟进表</a> --%>
	        			<a href="javascript:void(0)" onclick="exportLoansOrderStatusReport()" class="btn btn-info" >导出实时业务跟进表</a>
	        		</ms:hasAnyPermission>
                </div>
	        </div>
	        <h4 class="panel-title"><i class="glyphicon glyphicon-search"></i>业务汇总表查询条件</h4>
	        <p>请输入相关的查询条件，点击查询</p>
	    </div>
	    <div class="panel-body">
	        <form class="form-inline" id="searchForm" action="${ctx}/notice/list?pageLimit=100" method="get" onsubmit="submitSearchRequest('searchForm','listDiv');return false;">
	             <div class="form-group">
	                <label class="sr-only">已读未读查询</label>
	                <input type="text" name="dtBegin" class="form-control" value="<f:formatDate value="${summaryBegin}" pattern="yyyy-MM-dd"/>" placeholder="yyyy-MM-dd" id="summaryBegin">
	            </div>
	            <button type="submit" class="btn btn-primary mr5">查询</button>
	            <button id="reset" type="reset" class="btn btn-default">重置</button>
	        </form>
	    </div>
	</div>
	<div id="listDiv">
	</div>
</div>

<div class="modal fade bs-organization-edit-modal" tabindex="-1" role="dialog" data-backdrop="static">
    <div class="modal-dialog modal-lg" style="width:80%">
      <div class="modal-content">
      </div>
    </div>
</div>
<script>
    jQuery(document).ready(function(){
    	$('#searchForm').submit();
    	$('#reset').bind('click',function(){
    		$('#searchForm input').each(function(){
    			$(this).val("");
    		});
    		$('#searchForm').submit();
    	})
    });
</script>