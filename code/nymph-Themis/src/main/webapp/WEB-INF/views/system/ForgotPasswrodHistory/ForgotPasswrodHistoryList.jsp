<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.system.entity.ForgotPasswrodHistory"%>
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
    
    <table id="shTable" class="table table-striped table-bordered responsive dataTable no-footer dtr-inline" role="grid">
        <thead>
            <tr>
            	<th style="width:1px;"> </th>
					<th><%=ForgotPasswrodHistory.ALIAS_USER_SID%></th>
					<th><%=ForgotPasswrodHistory.ALIAS_USER_TYPE%></th>
					<th><%=ForgotPasswrodHistory.ALIAS_USER_TEL%></th>
					<th><%=ForgotPasswrodHistory.ALIAS_AUTH_CODE%></th>
					<th><%=ForgotPasswrodHistory.ALIAS_VALID_TIME%></th>
					<th><%=ForgotPasswrodHistory.ALIAS_STATUS%></th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody>
          <c:forEach var="item" items="${resultList}" varStatus="status">
            <tr>
            	<td>${paginator.offset + status.count}</td>
						<td><c:out value='${item.userSid}'/></td>
						<td><c:out value='${item.userType}'/></td>
						<td><c:out value='${item.userTel}'/></td>
						<td><c:out value='${item.authCode}'/></td>
						<td><c:out value='${item.validTimeString}'/></td>
						<td><c:out value='${item.status}'/></td>
				<td>
					<ms:hasAnyPermission name="superAdmin,forgotPasswrodHistory:view">
	                   <a href="${ctx}/forgotPasswrodHistory/view/${item.sid}" class="btn btn-primary" data-toggle="modal" data-target=".bs-organization-edit-modal">查看</a>
					</ms:hasAnyPermission>
                    <ms:hasAnyPermission name="superAdmin,forgotPasswrodHistory:update">
                   	   <a href="${ctx}/forgotPasswrodHistory/update/${item.sid}" class="btn btn-primary" data-toggle="modal" data-target=".bs-organization-edit-modal">编辑</a>
                   </ms:hasAnyPermission>
                   <ms:hasAnyPermission name="superAdmin,forgotPasswrodHistory:delete">
	                   <a href="javascript:void(0);" onclick="javascript:deleteItem('${ctx}/forgotPasswrodHistory/delete/${item.sid}');" class="btn btn-danger" id="growl-danger">删除</a>
                   </ms:hasAnyPermission>
                </td>
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