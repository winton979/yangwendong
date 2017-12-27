<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.system.entity.ForgotPasswrodHistory"%>
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
							<label class="col-sm-3 control-label"><%=ForgotPasswrodHistory.ALIAS_USER_SID%></label>
							<div class="col-sm-4">
<c:out value='${forgotPasswrodHistory.userSid}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=ForgotPasswrodHistory.ALIAS_USER_TYPE%></label>
							<div class="col-sm-4">
<c:out value='${forgotPasswrodHistory.userType}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=ForgotPasswrodHistory.ALIAS_USER_TEL%></label>
							<div class="col-sm-4">
<c:out value='${forgotPasswrodHistory.userTel}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=ForgotPasswrodHistory.ALIAS_AUTH_CODE%></label>
							<div class="col-sm-4">
<c:out value='${forgotPasswrodHistory.authCode}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=ForgotPasswrodHistory.ALIAS_VALID_TIME%></label>
							<div class="col-sm-4">
<c:out value='${forgotPasswrodHistory.validTimeString}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=ForgotPasswrodHistory.ALIAS_STATUS%></label>
							<div class="col-sm-4">
<c:out value='${forgotPasswrodHistory.status}'/>							</div>
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