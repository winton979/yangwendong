<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.system.entity.FileManager"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<div class="contentpanel">
	<div class="panel panel-default">
	    <div class="panel-heading">
	        <div class="panel-btns">
	            <a href="#" class="panel-minimize tooltips" data-toggle="tooltip" title="隐藏/显示"><i class="fa fa-minus"></i></a>
	        </div><!-- panel-btns -->
	        
	        <h4 class="panel-title"><i class="glyphicon glyphicon-search"></i>文件管理查询条件</h4>
	        <p>请输入相关的查询条件，点击查询</p>
	    </div>
	    <div class="panel-body">
	        <form class="form-inline" id="searchForm" action="${ctx}/fileManager/list" method="get" onsubmit="submitSearchRequest('searchForm','listDiv');return false;">
							<div class="form-group">
				                <label class="sr-only"><%=FileManager.ALIAS_CONTENT_TYPE%></label>
				                <input type="text" id="contentType" name="contentTypeEqualTo" class="form-control" placeholder="<%=FileManager.ALIAS_CONTENT_TYPE%>">
				            </div><!-- form-group -->
							<div class="form-group">
				                <label class="sr-only"><%=FileManager.ALIAS_FILE_NAME%></label>
				                <input type="text" id="fileName" name="fileNameEqualTo" class="form-control" placeholder="<%=FileManager.ALIAS_FILE_NAME%>">
				            </div><!-- form-group -->
							
							<div class="form-group">
				                <label class="sr-only"><%=FileManager.ALIAS_BUSINESS_SID%></label>
				                <input type="text" id="businessSid" name="businessSidEqualTo" class="form-control" placeholder="<%=FileManager.ALIAS_BUSINESS_SID%>">
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