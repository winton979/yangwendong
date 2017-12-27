<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.system.entity.FileManager"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<div class="panel panel-default">
	<div class="panel-heading">
        <div class="pull-right">
        </div>
        <h4 class="panel-title"><i class="fa fa-th-list"></i> 文件管理查询结果</h4>
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
				<th><%=FileManager.ALIAS_CONTENT_TYPE%></th>
				<th><%=FileManager.ALIAS_FILE_NAME%></th>
				<!-- <th>文件别名</th> -->
				<th>文件</th>
				<th><%=FileManager.ALIAS_BUSINESS_SID%></th>
				<th>状态</th>
				<th><%=FileManager.ALIAS_CREATED_BY%></th>
				<th><%=FileManager.ALIAS_CREATED_DT%></th>
            </tr>
        </thead>
        <tbody>
          <c:forEach var="item" items="${resultList}" varStatus="status">
            <tr>
            	<td>${paginator.offset + status.count}</td>
            	<td>
					<ms:hasAnyPermission name="superAdmin,fileManager:view">
	                   <a href="${ctx}/fileManager/view/${item.sid}" class="btn btn-primary" data-toggle="modal" data-target=".bs-organization-edit-modal">查看</a>
					</ms:hasAnyPermission>
                   <ms:hasAnyPermission name="superAdmin,fileManager:delete">
	                   <a href="javascript:void(0);" onclick="javascript:deleteItem('${ctx}/fileManager/delete/${item.sid}');" class="btn btn-danger" id="growl-danger">删除</a>
                   </ms:hasAnyPermission>
                </td>
				<td><c:out value='${item.contentType}'/></td>
				<td><c:out value='${item.fileName}'/></td>
				<%-- <td><c:out value='${item.fileAlias}'/></td> --%>
				<td>
					<a href="${ctx}${item.fileUrl}">原图(${item.fileSize})</a></br>
					<a href="${ctx}${item.thumbnailUrl}">缩略图(${item.thumbnailFileSize})</a>						
				</td>
				<td><c:out value='${item.businessSid}'/></td>
				<td>
				<c:if test="${item.enabled == 1}">
					<span class="badge badge-primary">可用</span>
				</c:if>
				<c:if test="${item.enabled == 0}">
					<span class="badge badge-danger">不可用</span>
				</c:if>
				</td>
				<td><c:out value='${item.createdBy}'/></td>
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