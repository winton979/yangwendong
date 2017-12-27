<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.system.entity.DealerInfo"%>
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
    			<th><div style="width:180px">操作</div></th>
				<th><div style=""><%=DealerInfo.ALIAS_DEALER_NAME%></div></th>
   				<%--<th><div style="">上级经销商</div></th> --%>
				<%-- <th><%=DealerInfo.ALIAS_DEALER_CODE%></th> --%>
				<th><div style="">经销商地址</div></th>
				<%-- <th><div style=""><%=DealerInfo.ALIAS_OPENING_BANK%></div></th>
				<th><div style=""><%=DealerInfo.ALIAS_BANK_ACCOUNT%></div></th>
				<th><div style=""><%=DealerInfo.ALIAS_ACCOUNT_NAME%></div></th> --%>
			<%--	<th><div style=""><%=DealerInfo.ALIAS_DEALER_TEL%></div></th>  --%>
				<%-- <th><div style=""><%=DealerInfo.ALIAS_BRAND_BUSINESS%></div></th> --%>
				<th><div style=""><%=DealerInfo.ALIAS_CONTACT_PERSON%></div></th>
				<th><div style=""><%=DealerInfo.ALIAS_CONTACT_PHONE%></div></th>
			<%--	<th><div style=""><%=DealerInfo.ALIAS_CONTACT_EMAIL%></div></th>  --%>
				<th><div style="">具有线上数据</div></th>
				<th><div style="">状态</div></th>
				<th><div style=""><%=DealerInfo.ALIAS_CREATED_DT%></div></th>
               
            </tr>
        </thead>
        <tbody>
          <c:forEach var="item" items="${resultList}" varStatus="status">
            <tr>
            	<td>${paginator.offset + status.count}</td>
            	<td>
					<ms:hasAnyPermission name="superAdmin,dealerInfo:view">
	                   <a href="${ctx}/dealerInfo/view/${item.sid}" class="btn btn-primary" data-toggle="modal" data-target=".bs-organization-edit-modal">查看</a>
					</ms:hasAnyPermission>
                    <ms:hasAnyPermission name="superAdmin,dealerInfo:update">
                   	   <a href="${ctx}/dealerInfo/update/${item.sid}" class="btn btn-primary" data-toggle="modal" data-target=".bs-organization-edit-modal">编辑</a>
                   </ms:hasAnyPermission>
                   <ms:hasAnyPermission name="superAdmin,dealerInfo:delete">
	                   <a href="javascript:void(0);" onclick="javascript:deleteItem('${ctx}/dealerInfo/delete/${item.sid}');" class="btn btn-danger" id="growl-danger">删除</a>
                   </ms:hasAnyPermission>
                   
                   
                     <a href="${ctx}/dealerInfo/updateFile/${item.sid}" class="btn btn-primary" data-toggle="modal" data-target=".bs-organization-edit-modal">附件</a>
                </td>
				<td><c:out value='${item.dealerName}'/></td>
         	<%--	<td><c:out value='${item.fatherCodeName}'/></td> --%>
				<%-- <td><c:out value='${item.dealerCode}'/></td> --%>
				<td><c:out value='${item.fullAddress}'/></td>
				<%-- <td><c:out value='${item.openingBank}'/></td>
				<td><c:out value='${item.bankAccount}'/></td>
				<td><c:out value='${item.accountName}'/></td> --%>
			<%-- 	<td><c:out value='${item.dealerTel}'/></td> --%>
				<%-- <td><c:out value='${item.brandBusiness}'/></td> --%>
				<td><c:out value='${item.contactPerson}'/></td>
				<td><c:out value='${item.contactPhone}'/></td>
			<%-- 	<td><c:out value='${item.contactEmail}'/></td> --%>
				<td style="text-align: center">
					<c:if test="${item.onlineRes eq true}">
		                <span class="badge badge-primary">是</span>
		             </c:if>
				</td>
				<td>
				 <c:if test="${item.status == 1}">
	                <span class="badge badge-primary">${auditStatus[item.status]}</span>
	             </c:if>
	             <c:if test="${item.status == 0}">
	              	<span class="badge badge-danger">${auditStatus[item.status]}</span>
	             </c:if>
	             <c:if test="${empty item.status}">
	               ${auditStatus[item.status]}
	              </c:if>
	             </td>
				<td><c:out value='${item.createdDtString}'/></td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <!-- 分页对象 -->
    <tags:pagination page="${paginator}" isShowPageInfo="true" target="listDiv"/>
    
</div><!-- panel -->

<script>
    jQuery(document).ready(function(){
        var shTable = initDataListTable('shTable');
    });
</script>