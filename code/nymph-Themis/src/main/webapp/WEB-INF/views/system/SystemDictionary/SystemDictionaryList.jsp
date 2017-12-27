<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.system.entity.SystemDictionary"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<div class="panel panel-default">
	<div class="panel-heading">
        <div class="pull-right">
        </div>
        <h4 class="panel-title"><i class="fa fa-th-list"></i>数据字典查询结果</h4>
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
				<th><%=SystemDictionary.ALIAS_DICT_CATEGROY%></th>
				<th>键-值</th>
				<th>值列</th>
				<th><%=SystemDictionary.ALIAS_ORDER_RANK%></th>
				<%-- <th><%=SystemDictionary.ALIAS_CREATED_DT%></th> --%>
            </tr>
        </thead>
        <tbody>
          <c:forEach var="item" items="${resultList}" varStatus="status">
            <tr>
            	<td>${paginator.offset + status.count}</td>
            	<td>
            	<!--
					<ms:hasAnyPermission name="superAdmin,systemDictionary:view">
	                   <a href="${ctx}/systemDictionary/view/${item.sid}" class="btn btn-primary" data-toggle="modal" data-target=".bs-organization-edit-modal">查看</a>
					</ms:hasAnyPermission>
					  -->
                    <ms:hasAnyPermission name="superAdmin,systemDictionary:update">
                   	   <a href="${ctx}/systemDictionary/update/${item.sid}" class="btn btn-primary" data-toggle="modal" data-target=".bs-organization-edit-modal">编辑</a>
                   </ms:hasAnyPermission>
                   <ms:hasAnyPermission name="superAdmin,systemDictionary:delete">
	                   <a href="javascript:void(0);" onclick="javascript:deleteItem('${ctx}/systemDictionary/delete/${item.sid}');" class="btn btn-danger" id="growl-danger">删除</a>
                   </ms:hasAnyPermission>
                </td>
				<td><c:out value='${item.dictCategroy}'/></td>
				<td>
					<c:if test="${!empty item.dictKey}">
						键1[<c:out value='${item.dictKey}'/>]
					</c:if>
					<c:if test="${empty item.dictKey}">
						键1：[<span class="text-danger">未赋值</span>]
					</c:if>
					<c:if test="${!empty item.dictValue}">
						值1：[<c:out value='${item.dictValue}'/>]</br>
					</c:if>
					<c:if test="${empty item.dictValue}">
						值1：<span class="text-danger">未赋值</span></br>
					</c:if>
					<!-- dictKey2 -->
					<c:if test="${!empty item.dictKey2}">
						键2[<c:out value='${item.dictKey2}'/>]
					</c:if>
					<c:if test="${empty item.dictKey2}">
						键2：[<span class="text-danger">未赋值</span>]
					</c:if>
					<c:if test="${!empty item.dictValue2}">
						值2：[<c:out value='${item.dictValue2}'/>]</br>
					</c:if>
					<c:if test="${empty item.dictValue2}">
						值2：<span class="text-danger">未赋值</span></br>
					</c:if>
					<!-- dictKey3 -->
					<c:if test="${!empty item.dictKey3}">
						键3[<c:out value='${item.dictKey3}'/>]
					</c:if>
					<c:if test="${empty item.dictKey3}">
						键3：[<span class="text-danger">未赋值</span>]
					</c:if>
					<c:if test="${!empty item.dictValue3}">
						值3：[<c:out value='${item.dictValue3}'/>]</br>
					</c:if>
					<c:if test="${empty item.dictValue3}">
						值3：<span class="text-danger">未赋值</span></br>
					</c:if>
					<!-- dictKey4 -->
					<c:if test="${!empty item.dictKey4}">
						键4[<c:out value='${item.dictKey4}'/>]
					</c:if>
					<c:if test="${empty item.dictKey4}">
						键4：[<span class="text-danger">未赋值</span>]
					</c:if>
					<c:if test="${!empty item.dictValue4}">
						值4：[<c:out value='${item.dictValue4}'/>]</br>
					</c:if>
					<c:if test="${empty item.dictValue4}">
						值4：<span class="text-danger">未赋值</span></br>
					</c:if>
				</td>
				<td>
					<c:if test="${!empty item.value1}">
						值1[<c:out value='${item.value1}'/>]
					</c:if>
					<c:if test="${empty item.value1}">
						值1：[<span class="text-danger">未赋值</span>]</br>
					</c:if>
					<c:if test="${!empty item.value2}">
						值2[<c:out value='${item.value2}'/>]
					</c:if>
					<c:if test="${empty item.value2}">
						值2：[<span class="text-danger">未赋值</span>]</br>
					</c:if>
					<c:if test="${!empty item.value3}">
						值3[<c:out value='${item.value3}'/>]
					</c:if>
					<c:if test="${empty item.value3}">
						值3：[<span class="text-danger">未赋值</span>]</br>
					</c:if>
					<c:if test="${!empty item.value4}">
						值4[<c:out value='${item.value4}'/>]
					</c:if>
					<c:if test="${empty item.value4}">
						值4：[<span class="text-danger">未赋值</span>]</br>
					</c:if>
					</td>
					<td><c:out value='${item.orderRank}'/></td>
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