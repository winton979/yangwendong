<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.system.entity.FileManager"%>
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
							<label class="col-sm-3 control-label"><%=FileManager.ALIAS_CONTENT_TYPE%></label>
							<div class="col-sm-4">
<c:out value='${fileManager.contentType}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=FileManager.ALIAS_FILE_NAME%></label>
							<div class="col-sm-4">
<c:out value='${fileManager.fileName}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=FileManager.ALIAS_THUMBNAIL_FILEN_AME%></label>
							<div class="col-sm-4">
<c:out value='${fileManager.thumbnailFilenAme}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=FileManager.ALIAS_FILE_SIZE%></label>
							<div class="col-sm-4">
<c:out value='${fileManager.fileSize}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=FileManager.ALIAS_THUMBNAIL_FILE_SIZE%></label>
							<div class="col-sm-4">
<c:out value='${fileManager.thumbnailFileSize}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=FileManager.ALIAS_FILE_URL%></label>
							<div class="col-sm-4">
<c:out value='${fileManager.fileUrl}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=FileManager.ALIAS_THUMBNAIL_URL%></label>
							<div class="col-sm-4">
<c:out value='${fileManager.thumbnailUrl}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=FileManager.ALIAS_BUSINESS_SID%></label>
							<div class="col-sm-4">
<c:out value='${fileManager.businessSid}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=FileManager.ALIAS_DELETE_URL%></label>
							<div class="col-sm-4">
<c:out value='${fileManager.deleteUrl}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=FileManager.ALIAS_ENABLED%></label>
							<div class="col-sm-4">
<c:out value='${fileManager.enabled}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=FileManager.ALIAS_CREATED_BY%></label>
							<div class="col-sm-4">
<c:out value='${fileManager.createdBy}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=FileManager.ALIAS_CREATED_DT%></label>
							<div class="col-sm-4">
<c:out value='${fileManager.createdDtString}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=FileManager.ALIAS_VERSION%></label>
							<div class="col-sm-4">
<c:out value='${fileManager.version}'/>							</div>
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