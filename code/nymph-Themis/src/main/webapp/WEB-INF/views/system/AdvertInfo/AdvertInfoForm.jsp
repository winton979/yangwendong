<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.system.entity.AdvertInfo"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

	<form:form modelAttribute="advertInfo" id="inputForm" class="form-horizontal form-bordered" action="${ctx}/advertInfo/${action}" method="post">
		<input type="hidden" id="sid" name="sid" value="${advertInfo.sid}"/>
		<input type="hidden" name="advertImg" id="portrait" value="${advertInfo.advertImg}"/>
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
			
				<div class="form-group">
					<label class="col-sm-2 control-label"><%=AdvertInfo.ALIAS_ADVERT_IMG%></label>
						<div class="col-sm-4" id="thumbnailtest">
							<div style="width: 300px;" class="fileupload-new thumbnail">
							   <c:if test="${empty advertInfo.advertImgUrl}">
							    <img id="previewThumbnailImage" src="http://www.placehold.it/300x150/EFEFEF/AAAAAA" alt="" style="width:300px;height:150px">
							   </c:if>
							  <c:if test="${!empty advertInfo.advertImgUrl}">
							    <img id="previewThumbnailImage" src="${rootUrl }${advertInfo.advertImgUrl}" alt="" style="width:300px;height:150px">
							   </c:if>
							</div>
							<div class="btn-list">
				        		<a href="javascript:void(0);" id="thumbnailBtn" class="btn btn-primary btn-sm">选择文件</a>
				        		<a href="javascript:void(0);" id="deleteThumbnailBtn" class="btn btn-danger btn-sm">删除图片</a>
			                </div>
						</div>
						
						
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label"><%=AdvertInfo.ALIAS_CATEGORY%><span class="asterisk">*</span></label>
					<div class="col-sm-4">
						<form:select path="category" id="enabledSelectCategoryId"   cssClass="width100p">
							<option/>请选择<%=AdvertInfo.ALIAS_CATEGORY%>
      						    <form:options items="${enabledCategoryMap}"/>  
   						</form:select>
					</div>
				</div>
				<!-- form-group -->
				<div class="form-group">
					<label class="col-sm-2 control-label"><%=AdvertInfo.ALIAS_ADVERT_TITLE%><span class="asterisk">*</span></label>
					<div class="col-sm-10">
						<input type="text" name="advertTitle" id="advertTitle" class="form-control" placeholder="请输入<%=AdvertInfo.ALIAS_ADVERT_TITLE%>..."  value="${advertInfo.advertTitle}" required maxlength="100" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label"><%=AdvertInfo.ALIAS_ADVERT_LINK%><span class="asterisk">*</span></label>
					<div class="col-sm-10">
						<input type="text" name="advertLink" id="advertLink" class="form-control" placeholder="请输入<%=AdvertInfo.ALIAS_ADVERT_LINK%>..."  value="${advertInfo.advertTitle}" required maxlength="100" />
					</div>
				</div>
				<!-- form-group -->
				<div class="form-group"  id="alias">
					<label class="col-sm-2 control-label"><%=AdvertInfo.ALIAS_ADVERT_STATUS%><span class="asterisk">*</span></label>
					<div class="col-sm-4">
						<form:select path="advertStatus" id="enabledSelectId" cssClass="width100p">
							<option/>请选择<%=AdvertInfo.ALIAS_ADVERT_STATUS%>
      						    <form:options items="${enabledMap}"/>  
   						</form:select>
					</div>
					<label class="col-sm-2 control-label"><%=AdvertInfo.ALIAS_ADVERT_ORDER%><span class="asterisk">*</span></label>
					<div class="col-sm-4">
						<input type="text" name="advertOrder" id="advertOrder" class="form-control" placeholder="请输入<%=AdvertInfo.ALIAS_ADVERT_ORDER%>..."  value="${advertInfo.advertOrder}" required digits="true" maxlength="10" />
					</div>
				</div>
				
				
				<!-- form-group -->
				<div class="form-group" id="login"  >
					<label class="col-sm-2 control-label"><%=AdvertInfo.ALIAS_TYPE%><span class="asterisk">*</span></label>
					<div class="col-sm-4">
						<form:select path="type" id="enabledSelectTypeId"  cssClass="width100p">
							<option/>请选择<%=AdvertInfo.ALIAS_TYPE%>
      						    <form:options items="${enabledTypeMap}"/>  
   						</form:select>
					</div>
					<label class="col-sm-2 control-label"><%=AdvertInfo.ALIAS_SHOW_TIME%><span class="asterisk">*</span></label>
					<div class="col-sm-4">
						<input type="text" name="showTime" id="showTime" class="form-control" placeholder="请输入<%=AdvertInfo.ALIAS_SHOW_TIME%>..."  value="${advertInfo.showTime}" required digits="true" maxlength="10" />
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
	</form:form>
<!--modal-body-->
<script type="text/javascript">
  $(document).ready(function(){
	  //初始化
	var val = $(enabledSelectCategoryId).val(); 
	if(val == '1'){//广告编辑
 		$('#alias').show();
 		$('#login').hide();
 		$("#enabledSelectCategoryId").attr("disabled",true);    
 	}else if(val == '2'){//背景图片编辑
 		$('#alias').hide();
		$('#login').show();
		$("#enabledSelectCategoryId").attr("disabled",true);    
 	}else{
 		$('#login').hide();
 	}
	 
  	 //初始化上传图片组件
	 initDropzoneUploadPicture('thumbnailBtn','previewThumbnailImage','portrait',150,150);
	 //初始化上传图片删除组件
	 initDeleteDropzoneUploadPicture('deleteThumbnailBtn','previewThumbnailImage','portrait',150,150);
	$('#enabledSelectCategoryId').select2({minimumResultsForSearch:-1,placeholder:'请选择<%=AdvertInfo.ALIAS_CATEGORY%>'});
	
	$('#enabledSelectTypeId').select2({minimumResultsForSearch:-1,placeholder:'请选择<%=AdvertInfo.ALIAS_TYPE%>'});
  	$('#enabledSelectId').select2({minimumResultsForSearch:-1,placeholder:'请选择<%=AdvertInfo.ALIAS_ADVERT_STATUS%>'});
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
  
  //根据现在上传的图片类型进行显示的判断
  $("#enabledSelectCategoryId").change(function(){
	  var val = $(enabledSelectCategoryId).val();
	  	if(val == '1'){
	  		 $('#alias').show();
	  		 $('#login').hide();
	  	}else{
	  	$('#alias').hide();
		$('#login').show();
	  	}
	  });
</script>