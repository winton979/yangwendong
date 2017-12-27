<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.system.entity.DealerInfo"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

	<form:form modelAttribute="dealerGoal" id="dealerForm" class="form-horizontal form-bordered" action="${ctx}/dealerGoal/${action}" method="post">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-btns">
					<a href="#" class="panel-close tooltips" data-dismiss="modal" type="button"
						title="Close Panel"><i class="fa fa-times"></i></a>
				</div>
				<h4 class="panel-title"><i class="fa fa-pencil"></i> 编辑信息</h4>
			</div>
			<div class="panel-body" style="padding: 0px 5px 0px 5px;">
		<table id="shTable" class="table table-bordered  dataTable no-footer dtr-inline"  >
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
						<tr style="margin: 0px">
							<td style="display: none" title="${listItem.sid }">${listItem.sid }</td>
							<td style="display: none" title="${listItem.goalSid }">${listItem.goalSid }</td>
							<input type="hidden" name="dealers[${status1.index }].dealerSid" value="${listItem.sid}" />
							
							<td style="color: red" title="${listItem.dealerName }">${listItem.dealerName }</td>
							<c:forEach var="title" items="${titles}" varStatus="status2">
								<c:if test="${fn:length(titles) ne fn:length(applyGoal )}">
										<!--  --> 
										<c:if test="${month le status2.index+1}">
											<td style="padding: 0px">
												<input name="dealers[${status1.index }].values[${status2.index }].applyGoal" value="${listItem.resultMap[title]}" style="width: 30px; border-left: 0px; border-top: 0px; border-right: 0px" />
											</td>
											<td style="padding: 0px">
												<input name="dealers[${status1.index}].values[${status2.index }].lendingGoal" value="${listItem.lendingMap[title]}" style="width: 30px; border-left: 0px; border-top: 0px; border-right: 0px" />
											</td>
										</c:if> 
										<!--  --> 
										<c:if test="${month gt status2.index+1}">
											<td style="padding: 0px">
												${listItem.resultMap[title]}
											</td>
											<td style="padding: 0px">
												${listItem.lendingMap[title]}
											</td>
										</c:if>
								</c:if>
							</c:forEach>
						</tr>
					</c:forEach>
					
			</tbody>
		</table>
	</div>
			
			<div class="panel-footer">
				<div class="row">
					<div class="col-sm-9 col-sm-offset-3">
					<ms:hasAnyPermission name="superAdmin,dealerGoal:createtd">
						<a href="javascript:void(0)" id="btSubmit"  class="btn btn-primary mr5">提交</a>
	        		</ms:hasAnyPermission>

					<button type="reset" class="btn btn-dark">重置</button>
						
					</div>
				</div>
			</div>
		</div>
	</form:form>

<script type="text/javascript">
$(document).ready(function(){
	  //为inputForm注册validate函数
	  $("#inputForm").validate({
			submitHandler: function(form){
              globalSubmitHandler(form,function(json){
              	$('.bs-organization-edit-modal').modal("hide"); 
					refreshDiv("listDiv");
              });
			}
		});
	  
	  //FA 月销售目标提交保存方法
	  $('#btSubmit').click(function(){
		  $.post('${ctx}/dealerGoal/createtd',
		$('#dealerForm').serializeArray(),
             function(r,textStatus){		
			  if(textStatus == "success"){
				  alertSuccessMessage("保存成功!");
				  window.location.reload ( );    
				
			  }
		  }
		  ,'json')  
		
	
	  }	
	  )

	  
	  
	  
	  
});
</script>