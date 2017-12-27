<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.auth.entity.AdminRole"%>
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
            	<th style="width:220px;">操作</th>
				<tags:sort curretOrder="${criteria.orderByClause}" fieldName="ROLE_CODE" target="listDiv" fieldTitle="<%=AdminRole.ALIAS_ROLE_CODE%>"/>
				<th><%=AdminRole.ALIAS_ROLE_DESC%></th>
				<tags:sort curretOrder="${criteria.orderByClause}" fieldName="STATUS" target="listDiv" fieldTitle="<%=AdminRole.ALIAS_STATUS%>"/>
				<%-- <th><%=AdminRole.ALIAS_CREATED_DT%></th> --%>
                
            </tr>
        </thead>
        <tbody>
          <c:forEach var="item" items="${resultList}" varStatus="status">
            <tr>
            	<td>${paginator.offset + status.count}</td>
				<td>
					<ms:hasAnyPermission name="superAdmin,adminRole:view">
	                   <a href="${ctx}/adminRole/view/${item.sid}" class="btn btn-primary" data-toggle="modal" data-target=".bs-organization-edit-modal">查看</a>
					</ms:hasAnyPermission>
                    <ms:hasAnyPermission name="superAdmin,adminRole:update">
                   	   <a href="${ctx}/adminRole/update/${item.sid}" class="btn btn-primary" data-toggle="modal" data-target=".bs-organization-edit-modal">编辑</a>
                   </ms:hasAnyPermission>
                   <ms:hasAnyPermission name="superAdmin,adminRole:delete">
	                   <a href="javascript:void(0);" onclick="javascript:deleteItem('${ctx}/adminRole/delete/${item.sid}');" class="btn btn-danger" id="growl-danger">删除</a>
                   </ms:hasAnyPermission> 
                </td>
				<td><c:out value='${item.roleCode}'/></td>
				<td><c:out value='${item.roleDesc}'/></td>
				  <c:if test="${item.status == 1}">
                <td><span class="badge badge-primary">${enabledMap[item.status]}</span></td>
                </c:if>
                <c:if test="${item.status == 0}">
                <td><span class="badge badge-danger">${enabledMap[item.status]}</span></td>
                </c:if>
                <c:if test="${empty item.status}">
                <td>${enabledMap[item.status]}</td>
                </c:if>
				<%-- <td><c:out value='${item.createdDtString}'/></td> --%>
				
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