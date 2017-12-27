<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.loans.entity.LoansOrder"%>
<%@ page import="com.cdtsz.chedaitong.loans.enums.LoansNodeEnum"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<div class="panel panel-default">
	<div class="panel-heading">
		<div class="panel-btns" style="display: none;">
			<a href="#" class="panel-minimize tooltips" data-toggle="tooltip"
				title="" data-original-title="Minimize Panel"><i
				class="fa fa-minus"></i></a>
		</div>
		<h4 class="panel-title">待办任务&nbsp;&nbsp;&nbsp;总数：<span style="color: red">${LoansOrderSum}</span></h4>
		<p>显示正在要处理审核的待办任务</p>
	</div>

	<div class="panel-body" style="overflow: auto;">
		<table class="table table-bordered table-striped table-bordered">
			<thead>
				<tr>
					<th style="width: 60px;">操作</th>
					<th style="width: 150px;">节点</th>
					<th style="width: 200px;">任务</th>
					<th style="width: 150px;">数量</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${orderNodeList}" varStatus="status">
            <tr>
				<td>
					<c:if test="${not empty item.auditUrl }">
						<a href="${ctx}/${item.auditUrl}">处理</a>
					</c:if> 
					<c:if test="${empty item.auditUrl }">
						<a href="${ctx}/loansAssist?nodeStatusEq=${item.nodeStatus}">查看</a>
					</c:if>
				</td>
				<td><c:out value='${item.nodeSidName}'/></td>
				<td><c:out value='${item.nodeStatusName}'/></td>
				<td><c:out value='${item.orderNnodeCount}'/></td>
	            </tr>
	            </c:forEach>
			</tbody>
		</table>
	</div>
</div>



<script>

</script>

