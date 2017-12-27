<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.user.entity.UserRelOrgan"%>
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
					<tags:sort curretOrder="${criteria.orderByClause}" fieldName="tu.NAME" target="listDiv" fieldTitle="<%=UserRelOrgan.ALIAS_USER_SID%>"/>
					<tags:sort curretOrder="${criteria.orderByClause}" fieldName="tu.tel" target="listDiv" fieldTitle="<%=UserRelOrgan.ALIAS_USER_TEL%>"/>
					<tags:sort curretOrder="${criteria.orderByClause}" fieldName="o.ORG_NAME" target="listDiv" fieldTitle="<%=UserRelOrgan.ALIAS_ORG_CODE%>"/>
					<tags:sort curretOrder="${criteria.orderByClause}" fieldName="tur.status" target="listDiv" fieldTitle="<%=UserRelOrgan.ALIAS_STATUS%>"/>
					<th>关联类型</th>
					<th><%=UserRelOrgan.ALIAS_CREATED_DT%></th>
                    <th>操作</th>
                </tr>
        </thead>
        <tbody>
          <c:forEach var="item" items="${resultList}" varStatus="status">
            <tr>
            	<td>${paginator.offset + status.count}</td>
						<td><c:out value='${item.userName}'/></td>
						<td><c:out value='${item.userTel}'/></td>
						<td><c:out value='${item.organName}'/></td>
						<c:if test="${item.status == 1}">
		                <td><span class="badge badge-primary">${enabledMap[item.status]}</span></td>
		                </c:if>
		                <c:if test="${item.status == 0}">
		                <td><span class="badge badge-danger">${enabledMap[item.status]}</span></td>
		                </c:if>
		                <c:if test="${empty item.status}">
		                <td>${enabledMap[item.status]}</td>
		                </c:if>
		                <td>
			                <c:if test="${item.relationType == 0}">
			                	<span class="badge badge-primary">普通FA</span>
			               	</c:if>
			               	<c:if test="${item.relationType == 1}">
			                	<span class="badge badge-success">管理FA</span>
			               	</c:if>
			               	<c:if test="${item.relationType == 2}">
			                	<span class="badge badge-warning">4S店长</span>
			               	</c:if>
		                </td>
						<td><c:out value='${item.createdDtString}'/></td>
				<td>
					<ms:hasAnyPermission name="superAdmin,userRelOrgan:view">
	                   <a href="${ctx}/userRelOrgan/view/${item.sid}" class="btn btn-primary" data-toggle="modal" data-target=".bs-organization-edit-modal">查看</a>
					</ms:hasAnyPermission>
                    <ms:hasAnyPermission name="superAdmin,userRelOrgan:update">
                   	   <a href="${ctx}/userRelOrgan/update/${item.sid}" class="btn btn-primary" data-toggle="modal" data-target=".bs-organization-edit-modal">编辑</a>
                   </ms:hasAnyPermission>
                   <ms:hasAnyPermission name="superAdmin,userRelOrgan:delete">
	                   <a href="javascript:void(0);" onclick="javascript:deleteItem('${ctx}/userRelOrgan/delete/${item.sid}');" class="btn btn-danger" id="growl-danger">删除</a>
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