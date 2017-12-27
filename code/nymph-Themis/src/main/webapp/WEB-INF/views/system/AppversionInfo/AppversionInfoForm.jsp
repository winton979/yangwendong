<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.system.entity.AppversionInfo"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

	<form modelAttribute="appversionInfo" id="inputForm" class="form-horizontal form-bordered" action="${ctx}/appversionInfo/${action}" method="post">
		<input type="hidden" id="sid" name="sid" value="${appversionInfo.sid}"/>
		<input type="hidden" name="appversionInfoSid" id="appversionInfoSid" value=""/>
		<img id="previewOrgThumbnailImage" src="http://www.placehold.it/120x120/EFEFEF/AAAAAA" alt="" style="display:none;">
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
							<label class="col-sm-3 control-label"><%=AppversionInfo.ALIAS_CURRENT_VERSION%></label>
							<div class="col-sm-4">
											<input type="text" name="currentVersion" id="currentVersion" class="form-control" placeholder="请输入<%=AppversionInfo.ALIAS_CURRENT_VERSION%>..."  value="${appversionInfo.currentVersion}" maxlength="32" />
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=AppversionInfo.ALIAS_PREVIOUS_VERSION%></label>
							<div class="col-sm-4">
											<input type="text" name="previousVersion" id="previousVersion" class="form-control" placeholder="请输入<%=AppversionInfo.ALIAS_PREVIOUS_VERSION%>..."  value="${appversionInfo.previousVersion}" maxlength="32" />
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=AppversionInfo.ALIAS_LAST_VERSION%></label>
							<div class="col-sm-4">
											<input type="text" name="lastVersion" id="lastVersion" class="form-control" placeholder="请输入<%=AppversionInfo.ALIAS_LAST_VERSION%>..."  value="${appversionInfo.lastVersion}" maxlength="255" />
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=AppversionInfo.ALIAS_VERSION_DESC%></label>
							<div class="col-sm-4">
											<input type="text" name="versionDesc" id="versionDesc" class="form-control" placeholder="请输入<%=AppversionInfo.ALIAS_VERSION_DESC%>..."  value="${appversionInfo.versionDesc}" maxlength="255" />
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=AppversionInfo.ALIAS_VERSION_TYPE%></label>
							<div class="col-sm-4">
											<input type="text" name="versionType" id="versionType" class="form-control" placeholder="请输入<%=AppversionInfo.ALIAS_VERSION_TYPE%>..."  value="${appversionInfo.versionType}" maxlength="20" />
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=AppversionInfo.ALIAS_RELEASE_DATE%></label>
							<div class="col-sm-4">
											<input type="text" name="releaseDate" id="releaseDate" class="form-control" placeholder="请输入<%=AppversionInfo.ALIAS_RELEASE_DATE%>..."  value="${appversionInfo.releaseDate}" maxlength="255" />
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=AppversionInfo.ALIAS_DOWNLOAD_URL%></label>
							<div class="col-sm-4">
											<input type="text" name="downloadUrl" id="downloadUrl" class="form-control" placeholder="请输入<%=AppversionInfo.ALIAS_DOWNLOAD_URL%>..."  value="${appversionInfo.downloadUrl}" maxlength="255" />
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=AppversionInfo.ALIAS_CREATED_DT%></label>
							<div class="col-sm-4">
					appversionInfo.createdDt
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=AppversionInfo.ALIAS_FORCE_UPDATE_FLAG%></label>
							<div class="col-sm-4">
											<input type="text" name="forceUpdateFlag" id="forceUpdateFlag" class="form-control" placeholder="请输入<%=AppversionInfo.ALIAS_FORCE_UPDATE_FLAG%>..."  value="${appversionInfo.forceUpdateFlag}" maxlength="10" />
							</div>
						</div>
						
					<div class="form-group">
						<label class="col-sm-4 control-label">更新包:<span class="asterisk">*</span></label>
						<input type="hidden" name="fileSid" id="fileSid" class="form-control" maxlength="64" disabled="disabled"/>
						<label class="col-sm-1 control-label"></label>
						<div class="col-sm-3">
							<a href="javascript:void(0);" id="thumbnailorgBtn" class="btn btn-primary ">选择文件</a>
						</div>
					</div>
						
					<div class="form-group" id ="showList">
						
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
var  sid='${appversionInfo.sid}';
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
	  
	  var url;
	  if(sid.length==0){
		   url = "${ctx}/appversionInfo/showFileList/0";
	  }else{
		  url = "${ctx}/appversionInfo/showFileList/"+sid;
	  }
	   
	   loadingDialog();	   
	 	ajaxGet(url,'showList',function(){
	  		closeLoadingDialog();
	  		return true;
	  	});
	  
	  
	  function initMyDropzoneUploadPicture2(target,previewThumbnail,hideInput,thumbnailWidth,thumbnailHeight,callback){
		  if(!thumbnailHeight){
			  thumbnailHeight = 100;
		  }
		  if(!thumbnailWidth){
			  thumbnailWidth = 100;
		  }
		  var hidePreviewDiv = $('<div class="hidePreviewDiv" style="display:none"></div>');
		  $('#'+previewThumbnail).parent().append(hidePreviewDiv);
		  var thumbnail = $('#'+previewThumbnail).attr('src');
		  var isShowThumbai = true;
		  Dropzone.autoDiscover = true;
		    var myDropzone = new Dropzone("#"+target,
		    	{ 
		    		url: "/api/v1/upload/picture.json",
		    		method:"POST",
		    		thumbnailWidth:thumbnailWidth,
		    		thumbnailHeight:thumbnailHeight,
		    		maxFilesize: 20,
		    		acceptedFiles: ".xls,.xlsx,.jpg,.JPEG,.png,.apk",  
		    		previewsContainer:'.hidePreviewDiv',
		            error:function(file,msg) {
	            		alertErrorMessage(msg);
	                },
	                success: function (file, result) {
	                	closeLoadingDialog();
	                	if(result.code == 200){
	                		$('#'+hideInput).val(result.data[0].sid);
	                		callback();
	                	}else{
	                		alertErrorMessage(result.msg);
	                	}
	                }
		    	}
		    );
		    myDropzone.on("complete", function(file) {
		    	myDropzone.removeFile(file);
		    });
	}
	  
	  initMyDropzoneUploadPicture2('thumbnailorgBtn','previewOrgThumbnailImage','fileSid',200,100,function(){
	  	postOrgFile();
	  });
	  
	  
	  var appversionInfo = $("#appversionInfoSid").val();
	  if(appversionInfo.length == 0){
		  $("#appversionInfoSid").val(0);
	  }
	  
  });
  
  
  function postOrgFile(){
	  var fileSid = $("#fileSid").val();
	  var appversionInfoSid= "${appversionInfo.sid}"
	  if(appversionInfoSid.length == 0){
		  appversionInfoSid =0;
	  }
	  var data = "";
	  var url = "${ctx}/appversionInfo/saveFileForm?fileSid="+fileSid+"&appversionInfoSid="+appversionInfoSid;
	  if(fileSid.length == 0){
		  alertErrorMessage("请选择上传文件！");
		  return ;
	  }
	  $.get(url, function(result,textStatus){
		  if(textStatus == "success"){
			  $("#fileSid").val("");
			  $("#appversionInfoSid").val(result.sid);
				  refreshList(result.sid);
			  alertSuccessMessage("保存成功！");
		  }
	});
} 

  function refreshList(sid){
	  var url = "${ctx}/appversionInfo/showFileList/"+sid;
	   loadingDialog();	   
	 	ajaxGet(url,'showList',function(){
	  		closeLoadingDialog();
	  		return true;
	  	});
}

function deletFile(sid){
	  var url = "${ctx}/courierInfo/deleFile/"+sid+".json";
	  ajaxPostURL(url,null,function(result){
		  if(result.code == 200){
			  alertSuccessMessage("删除成功！");
			  refreshList();
		  }else{
			  alertErrorMessage(result.msg);
		  }
	  });
}
</script>