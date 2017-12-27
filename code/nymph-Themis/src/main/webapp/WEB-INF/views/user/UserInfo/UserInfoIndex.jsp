<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.user.entity.UserInfo"%>
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
	        		<ms:hasAnyPermission name="superAdmin,userInfo:create">
	        			<a href="${ctx}/userInfo/create" class="btn btn-success" data-toggle="modal" data-target=".bs-organization-edit-modal">创建</a>
	        		</ms:hasAnyPermission>
                </div>
	        </div>
	        <h4 class="panel-title"><i class="glyphicon glyphicon-search"></i>查询条件</h4>
	        <p>请输入相关的查询条件，点击查询</p>
	    </div>
	    <div class="panel-body">   
	        <form class="form-inline" id="searchForm" action="${ctx}/userInfo/list?pageLimit=50" method="get" onsubmit="submitSearchRequest('searchForm','listDiv');return false;">
							<div class="form-group">
				                <label class="sr-only"><%=UserInfo.ALIAS_NAME%></label>
				                <input type="text" id="name" name="nameIsLike" class="form-control" placeholder="<%=UserInfo.ALIAS_NAME%>">
				            </div><!-- form-group -->
				            <div class="form-group">
				                <label class="sr-only"><%=DealerInfo.ALIAS_DEALER_NAME2%></label>
				                <input type="text" id="dealerName" name="dealerNameIsLike" class="form-control" placeholder="<%=DealerInfo.ALIAS_DEALER_NAME2%>">
				            </div><!-- form-group -->
							<div class="form-group">
				                <label class="sr-only"><%=UserInfo.ALIAS_TEL%></label>
				                <input type="text" id="tel" name="telIsLike" class="form-control" placeholder="<%=UserInfo.ALIAS_TEL%>">
				            </div><!-- form-group -->
							<%-- <div class="form-group">
				                <label class="sr-only"><%=UserInfo.ALIAS_SEX%></label>
				                <input type="text" id="sex" name="sexEqualTo" class="form-control" placeholder="<%=UserInfo.ALIAS_SEX%>">
				            </div><!-- form-group -->
							<div class="form-group">
				                <label class="sr-only"><%=UserInfo.ALIAS_TYPE%></label>
				                <input type="text" id="type" name="typeEqualTo" class="form-control" placeholder="<%=UserInfo.ALIAS_TYPE%>">
				            </div><!-- form-group -->
							<div class="form-group">
				                <label class="sr-only"><%=UserInfo.ALIAS_ENTRY_PASSWORD%></label>
				                <input type="text" id="entryPassword" name="entryPasswordEqualTo" class="form-control" placeholder="<%=UserInfo.ALIAS_ENTRY_PASSWORD%>">
				            </div><!-- form-group -->
							<div class="form-group">
				                <label class="sr-only"><%=UserInfo.ALIAS_PY_NAME%></label>
				                <input type="text" id="pyName" name="pyNameEqualTo" class="form-control" placeholder="<%=UserInfo.ALIAS_PY_NAME%>">
				            </div><!-- form-group -->
							<div class="form-group">
				                <label class="sr-only"><%=UserInfo.ALIAS_AGE%></label>
				                <input type="text" id="age" name="ageEqualTo" class="form-control" placeholder="<%=UserInfo.ALIAS_AGE%>">
				            </div>
							<div class="form-group">
				                <label class="sr-only"><%=UserInfo.ALIAS_QQ%></label>
				                <input type="text" id="qq" name="qqEqualTo" class="form-control" placeholder="<%=UserInfo.ALIAS_QQ%>">
				            </div>
							<div class="form-group">
				                <label class="sr-only"><%=UserInfo.ALIAS_EMAIL%></label>
				                <input type="text" id="email" name="emailEqualTo" class="form-control" placeholder="<%=UserInfo.ALIAS_EMAIL%>">
				            </div>
							<div class="form-group">
				                <label class="sr-only"><%=UserInfo.ALIAS_IMKEY%></label>
				                <input type="text" id="imkey" name="imkeyEqualTo" class="form-control" placeholder="<%=UserInfo.ALIAS_IMKEY%>">
				            </div>
							<div class="form-group">
				                <label class="sr-only"><%=UserInfo.ALIAS_IMPASSWORD%></label>
				                <input type="text" id="impassword" name="impasswordEqualTo" class="form-control" placeholder="<%=UserInfo.ALIAS_IMPASSWORD%>">
				            </div>
							<div class="form-group">
				                <label class="sr-only"><%=UserInfo.ALIAS_OPENID%></label>
				                <input type="text" id="openid" name="openidEqualTo" class="form-control" placeholder="<%=UserInfo.ALIAS_OPENID%>">
				            </div>
							<div class="form-group">
				                <label class="sr-only"><%=UserInfo.ALIAS_BIRTHDAY%></label>
				            </div>
							<div class="form-group">
				                <label class="sr-only"><%=UserInfo.ALIAS_IDCARD%></label>
				                <input type="text" id="idcard" name="idcardEqualTo" class="form-control" placeholder="<%=UserInfo.ALIAS_IDCARD%>">
				            </div>
							<div class="form-group">
				                <label class="sr-only"><%=UserInfo.ALIAS_IDADDRESS%></label>
				                <input type="text" id="idaddress" name="idaddressEqualTo" class="form-control" placeholder="<%=UserInfo.ALIAS_IDADDRESS%>">
				            </div>
							<div class="form-group">
				                <label class="sr-only"><%=UserInfo.ALIAS_ADDRESS%></label>
				                <input type="text" id="address" name="addressEqualTo" class="form-control" placeholder="<%=UserInfo.ALIAS_ADDRESS%>">
				            </div>
							<div class="form-group">
				                <label class="sr-only"><%=UserInfo.ALIAS_PROVINCE%></label>
				                <input type="text" id="province" name="provinceEqualTo" class="form-control" placeholder="<%=UserInfo.ALIAS_PROVINCE%>">
				            </div>
							<div class="form-group">
				                <label class="sr-only"><%=UserInfo.ALIAS_CITY%></label>
				                <input type="text" id="city" name="cityEqualTo" class="form-control" placeholder="<%=UserInfo.ALIAS_CITY%>">
				            </div>
							<div class="form-group">
				                <label class="sr-only"><%=UserInfo.ALIAS_ZONE%></label>
				                <input type="text" id="zone" name="zoneEqualTo" class="form-control" placeholder="<%=UserInfo.ALIAS_ZONE%>">
				            </div>
							<div class="form-group">
				                <label class="sr-only"><%=UserInfo.ALIAS_ICON%></label>
				                <input type="text" id="icon" name="iconEqualTo" class="form-control" placeholder="<%=UserInfo.ALIAS_ICON%>">
				            </div>
							<div class="form-group">
				                <label class="sr-only"><%=UserInfo.ALIAS_REMARK%></label>
				                <input type="text" id="remark" name="remarkEqualTo" class="form-control" placeholder="<%=UserInfo.ALIAS_REMARK%>">
				            </div>
							<div class="form-group">
				                <label class="sr-only"><%=UserInfo.ALIAS_CREATED_BY%></label>
				                <input type="text" id="createdBy" name="createdByEqualTo" class="form-control" placeholder="<%=UserInfo.ALIAS_CREATED_BY%>">
				            </div>
							<div class="form-group">
				                <label class="sr-only"><%=UserInfo.ALIAS_CREATED_DT%></label>
				            </div>
							<div class="form-group">
				                <label class="sr-only"><%=UserInfo.ALIAS_VERSION%></label>
				                <input type="text" id="version" name="versionEqualTo" class="form-control" placeholder="<%=UserInfo.ALIAS_VERSION%>">
				            </div>
							<div class="form-group">
				                <label class="sr-only"><%=UserInfo.ALIAS_UPDATED_BY%></label>
				                <input type="text" id="updatedBy" name="updatedByEqualTo" class="form-control" placeholder="<%=UserInfo.ALIAS_UPDATED_BY%>">
				            </div>
							<div class="form-group">
				                <label class="sr-only"><%=UserInfo.ALIAS_UPDATED_DT%></label>
				            </div>
							<div class="form-group">
				                <label class="sr-only"><%=UserInfo.ALIAS_STATUS%></label>
				                <input type="text" id="status" name="statusEqualTo" class="form-control" placeholder="<%=UserInfo.ALIAS_STATUS%>">
				            </div> --%>
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
	    //解决模式对象远程对象只加载一次的事件
      	$(".bs-organization-edit-modal").on("hidden.bs.modal", function() { $(this).removeData("bs.modal"); });
	    //查询
      	$('#searchForm').submit();
    });
</script>