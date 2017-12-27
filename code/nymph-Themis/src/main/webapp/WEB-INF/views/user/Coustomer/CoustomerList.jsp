<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.user.entity.UserInfo"%>
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
            	   <tags:sort curretOrder="${criteria.orderByClause}" fieldName="NAME" target="listDiv" fieldTitle="<%=UserInfo.ALIAS_COUSTOMER_NAME%>"/>
            	   <tags:sort curretOrder="${criteria.orderByClause}" fieldName="TEL" target="listDiv" fieldTitle="<%=UserInfo.ALIAS_TEL%>"/>
            	   <tags:sort curretOrder="${criteria.orderByClause}" fieldName="SEX" target="listDiv" fieldTitle="<%=UserInfo.ALIAS_SEX%>"/>
            	   <tags:sort curretOrder="${criteria.orderByClause}" fieldName="STATUS" target="listDiv" fieldTitle="<%=UserInfo.ALIAS_STATUS%>"/>
				   <th><%=UserInfo.ALIAS_ADDRESS%></th>
				   <th><%=UserInfo.ALIAS_CREATED_DT%></th>
                   <th>操作</th>
            </tr>
        </thead>
        <tbody>
          <c:forEach var="item" items="${resultList}" varStatus="status">
            <tr>
            	<td>${paginator.offset + status.count}</td>
				<td><c:out value='${item.name}'/></td>
				<td><c:out value='${item.tel}'/></td>
				<td>
					<c:if test="${item.sex == 'M'}">
		                <span class="badge badge-primary">${sexMap[item.sex]}</span>
		             </c:if>
		             <c:if test="${item.sex == 'F'}">
	                	<span class="badge badge-danger">${sexMap[item.sex]}</span>
	                 </c:if>
	                 <c:if test="${empty item.sex}">${sexMap[item.sex]}</c:if>
				</td>
				<td>
					<c:if test="${item.status == 1}">
		                <span class="badge badge-primary">${enabledMap[item.status]}</span>
		             </c:if>
		             <c:if test="${item.status == 0}">
		              	<span class="badge badge-danger">${enabledMap[item.status]}</span>
		             </c:if>
		             <c:if test="${empty item.status}">
		               ${enabledMap[item.status]}
		              </c:if>
				</td>
		        <td><c:out value='${item.fullAddress}'/></td>
				<td><c:out value='${item.createdDtString}'/></td>
				<td>
					<ms:hasAnyPermission name="superAdmin,coustomer:view">
	                   <a href="${ctx}/coustomer/looup/${item.sid}" class="btn btn-primary">查看</a>
					</ms:hasAnyPermission>
                    <ms:hasAnyPermission name="superAdmin,coustomer:update">
                   	   <a href="${ctx}/coustomer/update/${item.sid}" class="btn btn-primary">编辑</a>
                   </ms:hasAnyPermission>
     
                    <ms:hasAnyPermission name="superAdmin,coustomer:update">
                   	   <a href="${ctx}/coustomer/push/${item.sid}"  class="btn btn-success">推送</a>
                   </ms:hasAnyPermission>
      
                   <ms:hasAnyPermission name="superAdmin,coustomer:transform">
	                    <a href="${ctx}/loansOrder/createUserOrder?usid=${item.sid}"  class="btn btn-warning">进件(转单)</a>
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