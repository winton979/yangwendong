<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.system.entity.OperationLog"%>
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
                <th style="width:220px">操作</th>
				<th><%=OperationLog.ALIAS_OPERATED_TYPE%></th>
				<th><%=OperationLog.ALIAS_OPERATED_USER_ID%></th>
				<%-- <th><%=OperationLog.ALIAS_OPERATED_USER_TYPE%></th> --%>
				<th><%=OperationLog.ALIAS_OPERATED_DES%></th>
				<%-- <th><%=OperationLog.ALIAS_OPERATED_SOURCE%></th> --%>
				<%-- <th><%=OperationLog.ALIAS_OPERATED_TARGET%></th> --%>
				<th><%=OperationLog.ALIAS_OPERATED_DT%></th>
				<th><%=OperationLog.ALIAS_OPERATED_OBJECT_ID%></th>
				<th><%=OperationLog.ALIAS_OPERATED_CLASS%></th>
            </tr>
        </thead>
        <tbody>
          <c:forEach var="item" items="${resultList}" varStatus="status">
            <tr>
            	<td>${paginator.offset + status.count}</td>
            	<td>
					<ms:hasAnyPermission name="superAdmin,operationLog:view">
	                   <a href="${ctx}/operationLog/view/${item.sid}" class="btn btn-primary" data-toggle="modal" data-target=".bs-organization-edit-modal">查看</a>
					</ms:hasAnyPermission>
                    <ms:hasAnyPermission name="superAdmin,operationLog:update">
                   	   <a href="${ctx}/operationLog/update/${item.sid}" class="btn btn-primary" data-toggle="modal" data-target=".bs-organization-edit-modal">编辑</a>
                   </ms:hasAnyPermission>
                   <ms:hasAnyPermission name="superAdmin,operationLog:delete">
	                   <a href="javascript:void(0);" onclick="javascript:deleteItem('${ctx}/operationLog/delete/${item.sid}');" class="btn btn-danger" id="growl-danger">删除</a>
                   </ms:hasAnyPermission>
                </td>
				<td><c:out value='${item.operatedType}'/></td>
				<td><c:out value='${item.operatedUserId}'/></td>
				<%-- <td><c:out value='${item.operatedUserType}'/></td> --%>
				<td><c:out value='${item.operatedDes}'/></td>
				<%-- <td><c:out value='${item.operatedSource}'/></td> --%>
				<%-- <td><c:out value='${item.operatedTarget}'/></td> --%>
				<td><f:formatDate value="${item.operatedDt}" pattern="yyyy-MM-dd HH:mm:sss"/></td>
				<td><c:out value='${item.operatedObjectId}'/></td>
				<td><c:out value='${item.operatedClass}'/></td>
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