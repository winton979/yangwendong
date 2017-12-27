<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.system.entity.SystemConfig"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

	<form modelAttribute="systemConfig" id="inputForm" class="form-horizontal form-bordered" action="${ctx}/systemConfig/${action}" method="post">
				<input type="hidden" id="sid" name="sid" value="${systemConfig.sid}"/>
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-btns">
					<a href="#" class="panel-close tooltips" data-dismiss="modal" type="button"
						title="Close Panel"><i class="fa fa-times"></i></a>
				</div>
				<!-- panel-btns -->
				<h4 class="panel-title"><i class="fa fa-pencil"></i> 编辑信息</h4>
				<p>红色的'*'表示必填项</p>
			</div>
			<div class="panel-body nopadding">
			
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=SystemConfig.ALIAS_CONFIG_CODE%></label>
							<div class="col-sm-4">
											<input type="text" name="configCode" id="configCode" class="form-control" placeholder="请输入<%=SystemConfig.ALIAS_CONFIG_CODE%>..."  value="${systemConfig.configCode}" maxlength="64" />
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=SystemConfig.ALIAS_CONFIG_NAME%></label>
							<div class="col-sm-4">
											<input type="text" name="configName" id="configName" class="form-control" placeholder="请输入<%=SystemConfig.ALIAS_CONFIG_NAME%>..."  value="${systemConfig.configName}" maxlength="100" />
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=SystemConfig.ALIAS_CONFIG_VALUE3%></label>
							<div class="col-sm-4">
											<input type="text" name="configValue3" id="configValue3" class="form-control" placeholder="请输入<%=SystemConfig.ALIAS_CONFIG_VALUE3%>..."  value="${systemConfig.configValue3}" maxlength="500" />
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=SystemConfig.ALIAS_CONFIG_VALUE2%></label>
							<div class="col-sm-4">
											<input type="text" name="configValue2" id="configValue2" class="form-control" placeholder="请输入<%=SystemConfig.ALIAS_CONFIG_VALUE2%>..."  value="${systemConfig.configValue2}" maxlength="500" />
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=SystemConfig.ALIAS_CONFIG_VALUE%></label>
							<div class="col-sm-4">
											<input type="text" name="configValue" id="configValue" class="form-control" placeholder="请输入<%=SystemConfig.ALIAS_CONFIG_VALUE%>..."  value="${systemConfig.configValue}" maxlength="500" />
							</div>
						</div>
				
			</div>
			<!-- panel-body -->
			<div class="panel-footer">
				<div class="row">
					<div class="col-sm-9 col-sm-offset-3">
						<button class="btn btn-primary mr5">提交</button>
						<button type="reset" class="btn btn-dark">重置</button>
					</div>
				</div>
			</div>
			<!-- panel-footer -->
		</div>
		<!-- panel -->
	</form>
<!--modal-body-->
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
  });
</script>