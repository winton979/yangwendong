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
		<h4 class="panel-title">待办任务</h4>
		<p>显示正在要处理审核的待办任务</p>
	</div>

	<div class="panel-body" style="overflow: auto;">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th style="width: 60px;">序号</th>
					<th style="width: 200px;">名称</th>
					<th style="width: 150px;">手机号</th>
					<th style="width: 150px;">车型</th>
					<th style="width: 100px;">贷款金额</th>
					<th style="width: 150px;">申请日期</th>
					<th style="min-width: 200px;">申请进度</th>
					<th style="width: 160px;">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${resultList}" varStatus="status">
            <tr>
	            	<td>${paginator.offset + status.count}</td>
					<td><c:out value='${item.name}'/></td>
					<td><c:out value='${item.tel}'/></td>
					<td><c:out value='${item.carTypeName}'/></td>
					<td><c:out value='￥${item.amount}'/></td>
					<td><c:out value='${item.createdDtString}'/></td>
					<td>
	          			<p><c:out value='${item.auditResult}'/></p>
	          			<c:if test="${!empty item.progressValue }">
	          			<div class="progress" style="background:#cceeff">
	                            <div style="width: ${item.progressValue}%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="40" role="progressbar" class="progress-bar progress-bar-success">
	                                <span class="sr-only" style="clip:auto;height:20px;width:auto;position:relative">${item.progressValue}%</span>
	                            </div>
	                        </div>
	                     </c:if>
	          		</td>
					<td>
						<c:if test="${item.nodeStatus eq 6}">
								<a href="${ctx}/loansBill/looup/${item.sid}" class="btn btn-primary">查看</a>
							</c:if>
						<ms:hasAnyPermission name="superAdmin,loansTrial:index">
							<c:if test="${(item.nodeStatus eq 0 or item.nodeStatus eq 1)}">
								<a href="${ctx}/loansTrial/trial/${item.sid}" class="btn btn-success">资料审核</a>
							</c:if>
						</ms:hasAnyPermission>
						<ms:hasAnyPermission name="superAdmin,loansReport:index">
							<c:if test="${item.nodeStatus eq 5}">
								 <a href="${ctx}/loansReport/report/${item.sid}" class="btn btn-success">渠道批复</a>
							</c:if>
						</ms:hasAnyPermission>
						
						<ms:hasAnyPermission name="superAdmin,loansBill:index">
							<c:if test="${item.nodeStatus eq 8}">
								<a href="${ctx}/loansBill/looup/${item.sid}" class="btn btn-primary">查看</a>
							</c:if>
							<c:if test="${item.nodeStatus eq 9}">
								 <a href="${ctx}/loansBill/bill/${item.sid}" class="btn btn-success">请款第一步审批</a>
							</c:if>
						</ms:hasAnyPermission>
						
						<ms:hasAnyPermission name="superAdmin,loansBill2:index">
							<c:if test="${item.nodeStatus eq 11}">
								<a href="${ctx}/loansBill2/looup/${item.sid}" class="btn btn-primary">查看</a>
							</c:if>
							<c:if test="${item.nodeStatus eq 24}">
								 <a href="${ctx}/loansBill2/bill2/${item.sid}" class="btn btn-success">请款第二步审批</a>
							</c:if>
						</ms:hasAnyPermission>
						
						<ms:hasAnyPermission name="superAdmin,loansContract:index">
							<c:if test="${item.nodeStatus eq 19}">
								<a href="${ctx}/loansContract/looup/${item.sid}" class="btn btn-primary">查看</a>
							</c:if>
							<c:if test="${item.nodeStatus eq 20}">
								 <a href="${ctx}/loansContract/contract/${item.sid}" class="btn btn-success">上传合同</a>
							</c:if>
						</ms:hasAnyPermission>
						
						<ms:hasAnyPermission name="superAdmin,loansGps:index">
							<c:if test="${item.nodeStatus eq 21}">
								<a href="${ctx}/loansGps/looup/${item.sid}" class="btn btn-primary">查看</a>
								<a href="javascript:void(0);" onclick="javascript:opts('${item.sid}');" class="btn btn-success">安装GPS</a>
							</c:if>
						</ms:hasAnyPermission>	
					
						<ms:hasAnyPermission name="superAdmin,loansApprove:index">
						   <c:if test="${item.nodeStatus eq 26}">
		                     <a href="${ctx}/loansApprove/approve/${item.sid}" class="btn btn-success">请款到账</a>
		                   </c:if>
						</ms:hasAnyPermission>
						
						<ms:hasAnyPermission name="superAdmin,loansMrtgage:index">
							<c:if test="${item.nodeStatus eq 14}">
								<a href="${ctx}/loansMrtgage/looup/${item.sid}" class="btn btn-primary">查看</a>
							</c:if>
							<c:if test="${item.nodeStatus eq 15}">
								<a href="${ctx}/loansMrtgage/mortage/${item.sid}" class="btn btn-success">放款资料审批</a>
							</c:if>
						</ms:hasAnyPermission>
						
						<ms:hasAnyPermission name="superAdmin,loansFinish:index">
							<c:if test="${item.nodeStatus eq 17}">
		                   		<a href="javascript:void(0);" onclick="javascript:finishLoansOrder('${item.sid}');" class="btn btn-success">财务放款</a>
							</c:if>
						</ms:hasAnyPermission>
                </td>
	            </tr>
	            </c:forEach>
			</tbody>
		</table>
	</div>
</div>

<script>
 function finishLoansOrder(orderSid){
        var url = "${ctx}/loansFinish/submitFinish/"+orderSid;
	  	alertDialog('确认财务已放款吗？',function(){
	  		url=getRandedURL(url);
	  		ajaxPostURL(url,null,function(response){
	  			location.href="${ctx}/portal";
	  		});
	  	});
    }
 function opts(orderSid){
     var url = "${ctx}/loansGps/submitOpts?orderSid="+orderSid;
	  	alertDialog('确认已安装GPS吗？',function(){
	  		url=getRandedURL(url);
	  		ajaxPostURL(url,null,function(response){
	  			alertSuccessMessage(response.msg);
	  			location.href='${ctx}/loansGps';
	  		});
	  	});
 }
</script>

