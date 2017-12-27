<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.system.entity.SystemConfig"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-btns">
					<a href="#" class="panel-close tooltips" data-dismiss="modal" type="button"
						title="Close Panel"><i class="fa fa-times"></i></a>
				</div>
				<!-- panel-btns -->
				<h4 class="panel-title"><i class="fa fa-pencil"></i>查看信息</h4>
				<p>显示详细的基本信息</p>
			</div>
			<div class="panel-body nopadding">
			
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=SystemConfig.ALIAS_CONFIG_CODE%></label>
							<div class="col-sm-4">
<c:out value='${systemConfig.configCode}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=SystemConfig.ALIAS_CONFIG_NAME%></label>
							<div class="col-sm-4">
<c:out value='${systemConfig.configName}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=SystemConfig.ALIAS_CONFIG_VALUE3%></label>
							<div class="col-sm-4 control-label">
								<c:if test="${!empty systemConfig.configValue3}">
									<c:out value='${systemConfig.configValue3}'/></br>
								</c:if>
								<c:if test="${empty systemConfig.configValue3}">
									<span class="text-danger">未配置</span></br>
								</c:if>							
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=SystemConfig.ALIAS_CONFIG_VALUE2%></label>
							<div class="col-sm-4">
								<c:if test="${!empty systemConfig.configValue2}">
									<c:out value='${systemConfig.configValue2}'/></br>
								</c:if>
								<c:if test="${empty systemConfig.configValue2}">
									<span class="text-danger">未配置</span></br>
								</c:if>								</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=SystemConfig.ALIAS_CONFIG_VALUE%></label>
							<div class="col-sm-4">
								<c:if test="${!empty systemConfig.configValue}">
									<c:out value='${systemConfig.configValue}'/></br>
								</c:if>
								<c:if test="${empty systemConfig.configValue}">
									<span class="text-danger">未配置</span></br>
								</c:if>								</div>
						</div>
				
			</div>
			<!-- panel-body -->
			<div class="panel-footer">
				<div class="row">
					<div class="col-sm-9 col-sm-offset-3">
					</div>
				</div>
			</div>
			<!-- panel-footer -->
		</div>
		<!-- panel -->