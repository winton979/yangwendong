<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.system.entity.AppLoginHistory"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<div class="panel panel-default">
	<div class="panel-heading">
        <div class="pull-right">
        </div>
        <h4 class="panel-title"><i class="fa fa-th-list"></i>查询结果</h4>
        <p>选中下列表数据，点击右边相应的按钮操作</p>
    </div><!-- panel-heading -->
    
    <!-- 分页对象 -->
    <div class="panel-body" style="padding:0px 5px 0px 5px;"><div class="dataTables_wrapper form-inline dt-bootstrap no-footer">
	    <tags:pagination page="${paginator}" isShowPageLength="true" target="listDiv"/>
    </div>
    
    <table id="shTable2" class="table table-striped table-bordered responsive dataTable no-footer dtr-inline" role="grid">
        <thead>
            <tr>
            	<th style="width:1px;"> </th>
                <th>操作</th>
				<th><%=AppLoginHistory.ALIAS_USER_ID%></th>
				<th><%=AppLoginHistory.ALIAS_USER_TYPE%></th>
				<th><%=AppLoginHistory.ALIAS_USER_DEVICE_TYPE%></th>
				<th><%=AppLoginHistory.ALIAS_USER_DEVICE_CODE%></th>
				<th><%=AppLoginHistory.ALIAS_USER_LOGIN_DT%></th>
				<th>登录IP</th>
            </tr>
        </thead>
        <tbody>
          <c:forEach var="item" items="${resultList}" varStatus="status">
            <tr>
            	<td>${paginator.offset + status.count}</td>
            	<td>
					<ms:hasAnyPermission name="superAdmin,appLoginHistory:view">
	                   <a href="${ctx}/appLoginHistory/view/${item.sid}" class="btn btn-primary" data-toggle="modal" data-target=".bs-organization-edit-modal">查看</a>
					</ms:hasAnyPermission>
                   <ms:hasAnyPermission name="superAdmin,appLoginHistory:delete">
	                   <a href="javascript:void(0);" onclick="javascript:deleteItem('${ctx}/appLoginHistory/delete/${item.sid}');" class="btn btn-danger" id="growl-danger">删除</a>
                   </ms:hasAnyPermission>
                </td>
				<td><c:out value='${item.userId}'/></td>
				<td><c:out value='${item.userType}'/></td>
				<td><c:out value='${item.userDeviceType}'/></td>
				<td><c:out value='${item.userDeviceCode}'/></td>
				<td><f:formatDate value="${item.userLoginDt}" pattern="yyyy-MM-dd HH:mm:sss"/></td>
				<td><c:out value='${item.userIp}'/></td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <!-- 分页对象 -->
    <tags:pagination page="${paginator}" isShowPageInfo="true" target="listDiv"/></div>
    
</div><!-- panel -->

<script>
    jQuery(document).ready(function(){
        var shTable = initDataListTable('shTable');
    });
</script>