<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.system.entity.FileManager"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

	<form modelAttribute="fileManager" id="inputForm" class="form-horizontal form-bordered" action="${ctx}/fileManager/${action}" method="post">
				<input type="hidden" id="sid" name="sid" value="${fileManager.sid}"/>
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
							<label class="col-sm-3 control-label"><%=FileManager.ALIAS_CONTENT_TYPE%></label>
							<div class="col-sm-4">
											<input type="text" name="contentType" id="contentType" class="form-control" placeholder="请输入<%=FileManager.ALIAS_CONTENT_TYPE%>..."  value="${fileManager.contentType}" maxlength="100" />
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=FileManager.ALIAS_FILE_NAME%></label>
							<div class="col-sm-4">
											<input type="text" name="fileName" id="fileName" class="form-control" placeholder="请输入<%=FileManager.ALIAS_FILE_NAME%>..."  value="${fileManager.fileName}" maxlength="100" />
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=FileManager.ALIAS_THUMBNAIL_FILEN_AME%></label>
							<div class="col-sm-4">
											<input type="text" name="thumbnailFilenAme" id="thumbnailFilenAme" class="form-control" placeholder="请输入<%=FileManager.ALIAS_THUMBNAIL_FILEN_AME%>..."  value="${fileManager.thumbnailFilenAme}" maxlength="100" />
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=FileManager.ALIAS_FILE_SIZE%></label>
							<div class="col-sm-4">
											<input type="text" name="fileSize" id="fileSize" class="form-control" placeholder="请输入<%=FileManager.ALIAS_FILE_SIZE%>..."  value="${fileManager.fileSize}" maxlength="100" />
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=FileManager.ALIAS_THUMBNAIL_FILE_SIZE%></label>
							<div class="col-sm-4">
											<input type="text" name="thumbnailFileSize" id="thumbnailFileSize" class="form-control" placeholder="请输入<%=FileManager.ALIAS_THUMBNAIL_FILE_SIZE%>..."  value="${fileManager.thumbnailFileSize}" maxlength="100" />
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=FileManager.ALIAS_FILE_URL%></label>
							<div class="col-sm-4">
											<input type="text" name="fileUrl" id="fileUrl" class="form-control" placeholder="请输入<%=FileManager.ALIAS_FILE_URL%>..."  value="${fileManager.fileUrl}" maxlength="500" />
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=FileManager.ALIAS_THUMBNAIL_URL%></label>
							<div class="col-sm-4">
											<input type="text" name="thumbnailUrl" id="thumbnailUrl" class="form-control" placeholder="请输入<%=FileManager.ALIAS_THUMBNAIL_URL%>..."  value="${fileManager.thumbnailUrl}" maxlength="500" />
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=FileManager.ALIAS_BUSINESS_SID%></label>
							<div class="col-sm-4">
											<input type="text" name="businessSid" id="businessSid" class="form-control" placeholder="请输入<%=FileManager.ALIAS_BUSINESS_SID%>..."  value="${fileManager.businessSid}" maxlength="64" />
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=FileManager.ALIAS_DELETE_URL%></label>
							<div class="col-sm-4">
											<input type="text" name="deleteUrl" id="deleteUrl" class="form-control" placeholder="请输入<%=FileManager.ALIAS_DELETE_URL%>..."  value="${fileManager.deleteUrl}" maxlength="500" />
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=FileManager.ALIAS_ENABLED%></label>
							<div class="col-sm-4">
											<input type="text" name="enabled" id="enabled" class="form-control" placeholder="请输入<%=FileManager.ALIAS_ENABLED%>..."  value="${fileManager.enabled}" maxlength="1" />
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=FileManager.ALIAS_CREATED_BY%></label>
							<div class="col-sm-4">
											<input type="text" name="createdBy" id="createdBy" class="form-control" placeholder="请输入<%=FileManager.ALIAS_CREATED_BY%>..."  value="${fileManager.createdBy}" maxlength="100" />
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=FileManager.ALIAS_CREATED_DT%><span class="asterisk">*</span></label>
							<div class="col-sm-4">
					fileManager.createdDt
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=FileManager.ALIAS_VERSION%></label>
							<div class="col-sm-4">
											<input type="text" name="version" id="version" class="form-control" placeholder="请输入<%=FileManager.ALIAS_VERSION%>..."  value="${fileManager.version}" maxlength="10" />
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