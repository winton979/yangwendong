<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.system.entity.AdvertInfo"%>
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
                <th>操作</th>
				<th><%=AdvertInfo.ALIAS_ADVERT_TITLE%></th>
				<th><%=AdvertInfo.ALIAS_CATEGORY %></th>
				<th><%=AdvertInfo.ALIAS_ADVERT_ORDER%></th>
				<th><%=AdvertInfo.ALIAS_ADVERT_LINK%></th>
				<th><%=AdvertInfo.ALIAS_ADVERT_STATUS%></th>
				<th><%=AdvertInfo.ALIAS_CREATED_DT%></th>
            </tr>
        </thead>
        <tbody>
          <c:forEach var="item" items="${resultList}" varStatus="status">
            <tr>
            	<td>${paginator.offset + status.count}</td>
            	
            	<td>
					<!--<ms:hasAnyPermission name="superAdmin,advertInfo:view">
	                   <a href="${ctx}/advertInfo/view/${item.sid}" class="btn btn-primary" data-toggle="modal" data-target=".bs-organization-edit-modal">查看</a>
					</ms:hasAnyPermission>-->
                    <ms:hasAnyPermission name="superAdmin,advertInfo:update">
                   	   <a href="${ctx}/advertInfo/update/${item.sid}" class="btn btn-primary" data-toggle="modal" data-target=".bs-organization-edit-modal">编辑</a>
                   </ms:hasAnyPermission>
                   <ms:hasAnyPermission name="superAdmin,advertInfo:delete">
	                   <a href="javascript:void(0);" onclick="javascript:deleteItem('${ctx}/advertInfo/delete/${item.sid}');" class="btn btn-danger" id="growl-danger">删除</a>
                   </ms:hasAnyPermission>
                </td>
				<td><c:out value='${item.advertTitle}'/></td>
				<td>${enabledCategoryMap[item.category]}</td>
				<td><c:out value='${item.advertOrder}'/></td>
				<td><c:out value='${item.advertLink}'/></td>
				<c:if test="${item.advertStatus == 1}">
                <td><span class="badge badge-primary">${enabledMap[item.advertStatus]}</span></td>
                </c:if>
                <c:if test="${item.advertStatus == 0}">
                <td><span class="badge badge-danger">${enabledMap[item.advertStatus]}</span></td>
                </c:if>
                <c:if test="${empty item.advertStatus}">
                <td>${enabledMap[item.advertStatus]}</td>
                </c:if>
				<td><c:out value='${item.createdDtString}'/></td>
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