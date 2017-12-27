<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.system.entity.AppversionInfo"%>
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
	        		<ms:hasAnyPermission name="superAdmin,appversionInfo:create">
	        			<a href="${ctx}/appversionInfo/create" class="btn btn-success" data-toggle="modal" data-target=".bs-organization-edit-modal">创建</a>
	        		</ms:hasAnyPermission>
                </div>
	        </div>
	        <h4 class="panel-title"><i class="glyphicon glyphicon-search"></i>查询条件</h4>
	        <p>请输入相关的查询条件，点击查询</p>
	    </div>
	    <div class="panel-body">
	        <form class="form-inline" id="searchForm" action="${ctx}/appversionInfo/list" method="get" onsubmit="submitSearchRequest('searchForm','listDiv');return false;">
							<div class="form-group">
				                <label class="sr-only"><%=AppversionInfo.ALIAS_CURRENT_VERSION%></label>
				                <input type="text" id="currentVersion" name="currentVersionEqualTo" class="form-control" placeholder="<%=AppversionInfo.ALIAS_CURRENT_VERSION%>">
				            </div><!-- form-group -->
							<div class="form-group">
				                <label class="sr-only"><%=AppversionInfo.ALIAS_PREVIOUS_VERSION%></label>
				                <input type="text" id="previousVersion" name="previousVersionEqualTo" class="form-control" placeholder="<%=AppversionInfo.ALIAS_PREVIOUS_VERSION%>">
				            </div><!-- form-group -->
							<div class="form-group">
				                <label class="sr-only"><%=AppversionInfo.ALIAS_LAST_VERSION%></label>
				                <input type="text" id="lastVersion" name="lastVersionEqualTo" class="form-control" placeholder="<%=AppversionInfo.ALIAS_LAST_VERSION%>">
				            </div><!-- form-group -->
							<div class="form-group">
				                <label class="sr-only"><%=AppversionInfo.ALIAS_VERSION_DESC%></label>
				                <input type="text" id="versionDesc" name="versionDescEqualTo" class="form-control" placeholder="<%=AppversionInfo.ALIAS_VERSION_DESC%>">
				            </div><!-- form-group -->
							<div class="form-group">
				                <label class="sr-only"><%=AppversionInfo.ALIAS_VERSION_TYPE%></label>
				                <input type="text" id="versionType" name="versionTypeEqualTo" class="form-control" placeholder="<%=AppversionInfo.ALIAS_VERSION_TYPE%>">
				            </div><!-- form-group -->
							<div class="form-group">
				                <label class="sr-only"><%=AppversionInfo.ALIAS_RELEASE_DATE%></label>
				                <input type="text" id="releaseDate" name="releaseDateEqualTo" class="form-control" placeholder="<%=AppversionInfo.ALIAS_RELEASE_DATE%>">
				            </div><!-- form-group -->
							<div class="form-group">
				                <label class="sr-only"><%=AppversionInfo.ALIAS_DOWNLOAD_URL%></label>
				                <input type="text" id="downloadUrl" name="downloadUrlEqualTo" class="form-control" placeholder="<%=AppversionInfo.ALIAS_DOWNLOAD_URL%>">
				            </div><!-- form-group -->
							<div class="form-group">
				                <label class="sr-only"><%=AppversionInfo.ALIAS_CREATED_DT%></label>
				            </div><!-- form-group -->
							<div class="form-group">
				                <label class="sr-only"><%=AppversionInfo.ALIAS_FORCE_UPDATE_FLAG%></label>
				                <input type="text" id="forceUpdateFlag" name="forceUpdateFlagEqualTo" class="form-control" placeholder="<%=AppversionInfo.ALIAS_FORCE_UPDATE_FLAG%>">
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