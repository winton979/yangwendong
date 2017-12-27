<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.user.entity.UserRelOrgan"%>
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
	        		<ms:hasAnyPermission name="superAdmin,userRelOrgan:create">
	        			<a href="${ctx}/userRelOrgan/create" class="btn btn-success" data-toggle="modal" data-target=".bs-organization-edit-modal">创建</a>
	        		</ms:hasAnyPermission>
                </div>
	        </div>
	        <h4 class="panel-title"><i class="glyphicon glyphicon-search"></i>查询条件</h4>
	        <p>请输入相关的查询条件，点击查询</p>
	    </div>
	    <div class="panel-body">
	        <form class="form-inline" id="searchForm" action="${ctx}/userRelOrgan/list" method="get" onsubmit="submitSearchRequest('searchForm','listDiv');return false;">
							<div class="form-group">
				                <label class="sr-only"><%=UserRelOrgan.ALIAS_USER_SID%></label>
				                <input type="text" id="userSid" name="userNameIsLike" class="form-control" placeholder="<%=UserRelOrgan.ALIAS_USER_SID%>">
				            </div><!-- form-group -->
				            <div class="form-group">
				                <label class="sr-only"><%=UserRelOrgan.ALIAS_USER_TEL%></label>
				                <input type="text" id="createdBy" name="userTelIsLike" class="form-control" placeholder="<%=UserRelOrgan.ALIAS_USER_TEL%>">
				            </div><!-- form-group -->
							<div class="form-group">
				                <label class="sr-only"><%=UserRelOrgan.ALIAS_ORG_CODE%></label>
				            	<input type="text" name="orgCodeEqualTo" id="queryOrgCode" class="width200" placeholder="<%=UserRelOrgan.ALIAS_ORG_CODE%>">
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
    	
    	//初始化远程下拉列表单个选择的数据
  	  	initRemoteDataSelect2('queryOrgCode',"<%=UserRelOrgan.ALIAS_ORG_CODE%>","${ctx}/organization/listByCodeJson.json");
    	
	    //解决模式对象远程对象只加载一次的事件
      	$(".bs-organization-edit-modal").on("hidden.bs.modal", function() { $(this).removeData("bs.modal"); });
	    //查询
      	$('#searchForm').submit();
    });
</script>