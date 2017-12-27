
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />



	<!-- 分页对象 -->
	<div class="panel-body" style="padding: 0px 5px 0px 5px;">
		<table id="shTable" class="table table-striped table-bordered  dataTable no-footer dtr-inline"  >
			<thead>
				
				<tr>
					<th rowspan="2">&nbsp;</th>
					<c:forEach var="title" items="${titles}" varStatus="status">
						<th style="text-align: center;" colspan="2">${title }</th>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="title" items="${titles}" varStatus="status">
						<th style="text-align: center;" >申请</th>
						<th style="text-align: center;" >放款</th>
					</c:forEach>
				</tr>
				
			</thead> 
			<tbody>
				<c:forEach var="listItem" items="${result}" varStatus="status1" step="1">
					<tr>
					
					<td  style="display:none"  title="${listItem.sid }">${listItem.sid }</td>
					<td style="display:none"   title="${listItem.goalSid }">${listItem.goalSid }</td>
					
						<td style=";color:red" title="${listItem.dealerName }">${listItem.dealerName }</td>
						
						<c:forEach var="title" items="${titles}" varStatus="status2">
							<c:if test="${fn:length(titles) ne fn:length(applyGoal )}">
								<td style="text-align: center;">${listItem.resultMap[title]}</td>
								<td style="text-align: center;">${listItem.lendingMap[title]}</td>
							</c:if>
						</c:forEach>
						
					</tr>
				</c:forEach>

			</tbody>
			
			
		</table>
	</div>

</div>
<!-- panel -->

<script>
    jQuery(document).ready(function(){
      //  var shTable = initDataListTable('shTable');
    });
   
    
    
</script>