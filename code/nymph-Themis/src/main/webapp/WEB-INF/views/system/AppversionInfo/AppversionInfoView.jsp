<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.system.entity.AppversionInfo"%>
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
							<label class="col-sm-3 control-label"><%=AppversionInfo.ALIAS_CURRENT_VERSION%></label>
							<div class="col-sm-4">
<c:out value='${appversionInfo.currentVersion}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=AppversionInfo.ALIAS_PREVIOUS_VERSION%></label>
							<div class="col-sm-4">
<c:out value='${appversionInfo.previousVersion}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=AppversionInfo.ALIAS_LAST_VERSION%></label>
							<div class="col-sm-4">
<c:out value='${appversionInfo.lastVersion}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=AppversionInfo.ALIAS_VERSION_DESC%></label>
							<div class="col-sm-4">
<c:out value='${appversionInfo.versionDesc}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=AppversionInfo.ALIAS_VERSION_TYPE%></label>
							<div class="col-sm-4">
<c:out value='${appversionInfo.versionType}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=AppversionInfo.ALIAS_RELEASE_DATE%></label>
							<div class="col-sm-4">
<c:out value='${appversionInfo.releaseDate}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=AppversionInfo.ALIAS_DOWNLOAD_URL%></label>
							<div class="col-sm-4">
<c:out value='${appversionInfo.downloadUrl}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=AppversionInfo.ALIAS_CREATED_DT%></label>
							<div class="col-sm-4">
<c:out value='${appversionInfo.createdDtString}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=AppversionInfo.ALIAS_FORCE_UPDATE_FLAG%></label>
							<div class="col-sm-4">
<c:out value='${appversionInfo.forceUpdateFlag}'/>							</div>
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