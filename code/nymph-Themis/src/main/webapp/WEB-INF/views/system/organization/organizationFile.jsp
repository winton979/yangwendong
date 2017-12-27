<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
 <form   id="basicForm" class="form-horizontal form-bordered">
	 <img id="previewOrgThumbnailImage" src="http://www.placehold.it/120x120/EFEFEF/AAAAAA" alt="" style="display:none;">
	<div class="panel panel-default">
		<div class="panel-heading">
			<div class="panel-btns">
				<a href="#" class="panel-close tooltips" data-dismiss="modal" type="button"
					title="Close Panel"><i class="fa fa-times"></i></a>
			</div>
			<!-- panel-btns -->
			<h4 class="panel-title"><i class="fa fa-pencil "></i>附件管理</h4>
			<p>包括合作协议、店面照片等。红色的'*'表示必填项</p>
		</div>
		<div class="panel-body ">
			<!-- form-group -->
			<div class="form-group">
				<label class="col-sm-1 control-label">附件类型</label> 
				<div class="col-sm-3">	
			  	 <select id="orgFileTypesid" name="orgFileType" >
			       <c:forEach items="${orgFileTypeMap}" var="mymap" >  
			         <option value ="${mymap.key}">${mymap.value}</option>
			       </c:forEach>
			      </select>
				</div>
				<input type="hidden" name="fileSid" id="fileSid" class="form-control" maxlength="64" disabled="disabled"/>
				<!-- <label class="col-sm-1 control-label">文件</label> 
				<div class="col-sm-3">	
				<input type="text" name="fileSid" id="fileSid" class="form-control" value="" maxlength="64" disabled="disabled"/>
				</div> -->
				<label class="col-sm-1 control-label"></label>
					<div class="col-sm-3">
							<a href="javascript:void(0);" id="thumbnailorgBtn" class="btn btn-primary ">选择文件</a>
							<!-- <a href="javascript:void(0);" id="" onclick="postOrgFile()" class="btn btn-primary ">提交</a> -->
					</div>
				</div>
				<div class="form-group" id ="showList">
				
				</div>
		</div>
	</div>
</form>
<script type="text/javascript">
  $(document).ready(function(){
	  $('#orgFileTypesid').select2();
	  var url = "${ctx}/organization/updateFileList/${orgSid}";
	   loadingDialog();	   
	 	ajaxGet(url,'showList',function(){
	  		closeLoadingDialog();
	  		return true;
	  	});
  });

//初始化上传图片组件
  //initDropzoneUploadPicture('thumbnailorgBtn','previewOrgThumbnailImage','fileSid',200,100);
  
  initMyDropzoneUploadPicture('thumbnailorgBtn','previewOrgThumbnailImage','fileSid',200,100,function(){
		postOrgFile();
	});
  
  function postOrgFile(){
	  var fileSid = $("#fileSid").val();
	  var orgSid = "${orgSid}";
	  var orgFileType = $("#orgFileTypesid").val();
	  var data = "";
	  var url = "${ctx}/organization/saveFileForm?fileSid="+fileSid+"&orgSid="+orgSid+"&orgFileType="+orgFileType;
	  if(fileSid.length == 0){
		  alertErrorMessage("请选择上传文件！");
		  return ;
	  }
	  $.get(url, function(result,textStatus){
		  if(textStatus == "success"){
			  $("#fileSid").val("");
			  refreshList();
			  alertSuccessMessage("保存成功！");
		  }
	});
  } 
  
  function deletFile(sid){
	  var url = "${ctx}/organization/deleFile/"+sid+".json";
	  ajaxPostURL(url,null,function(result){
		  if(result.code == 200){
			  alertSuccessMessage("删除成功！");
			  refreshList();
		  }else{
			  alertErrorMessage(result.msg);
		  }
	  });
  }
  
  function refreshList(){
	  var url = "${ctx}/organization/updateFileList/${orgSid}";
	   loadingDialog();	   
	 	ajaxGet(url,'showList',function(){
	  		closeLoadingDialog();
	  		return true;
	  	});
  }
  
  function openWin(url){
	  window.open (url);
  }
  
  function downloadFile(fileName, content){
	    var aLink = document.createElement('a');
	    var blob = new Blob([content]);
	    var evt = document.createEvent("HTMLEvents");
	    evt.initEvent("click", false, false);//initEvent 不加后两个参数在FF下会报错, 感谢 Barret Lee 的反馈
	    aLink.download = fileName;
	    aLink.href = URL.createObjectURL(blob);
	    aLink.dispatchEvent(evt);
	}
 </script>