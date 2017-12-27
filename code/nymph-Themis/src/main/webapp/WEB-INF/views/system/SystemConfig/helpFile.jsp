<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!-- LoansOrderFile -->
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<img id="previewThumbnailImage"
	src="http://www.placehold.it/120x120/EFEFEF/AAAAAA" alt=""
	style="display: none;">
<div class="panel panel-default">
	<div class="panel-heading">
		<div class="panel-btns">
			<a href="#" class="panel-close tooltips" data-dismiss="modal"
				type="button" title="Close Panel"><i class="fa fa-times"></i></a>
		</div>
		<!-- panel-btns -->
		<h4 class="panel-title">
			<i class="fa fa-pencil "></i>上传附件
		</h4>

	</div>
	<div class="panel-body ">
		<!-- form-group -->
		<div class="form-group">
			<label class="col-sm-2 control-label">附件类型</label>
			<div class="col-sm-4">
				<select id="orderFileTypesid" name="orderFileType"
					onchange="bindFileType(this,'fileSelect')" style="width: 200px">
   						 	<c:forEach items="${loansCanalCode}" var="mymap">
								<option value="${mymap.key}">${mymap.value}</option>
							</c:forEach>
				</select>
			</div>
			<div class="col-sm-4">
				<a href="javascript:void(0);" id="thumbnailAuditBtn"
					class="btn btn-primary ">选择文件</a>
					
			</div>
			
		</div>
		<div class="form-group">
			<form id="orderAuditFieTempform">
				<input type="hidden" id="fileType" name="fileType"
					value="${fileType}">
				<table class="table ">
					<thead>
						<tr style="background-color: #ddd;">
							<th colspan="4"><h5>待提交附件列表</h5></th>
							<th><a href="javascript:void(0);" id=""
								onclick="submitOrderFileTempBt()" class="btn btn-primary ">上传保存附件</a></th>
						</tr>
						<tr>
							<th>文件名称</th>
							<th>文件分类</th>
							<th>文件大小</th>
							<th>上传状态</th>
							<th>操作2</th>
						</tr>
					</thead>
					<tbody id="tablefileList">


					</tbody>
				</table>
			</form>
		</div>
		<div class="form-group" id="showList"></div>
	</div>
</div>

<script type="text/javascript">
	
  $(document).ready(function(){
	  $('#orderFileTypesid').select2({minimumResultsForSearch:-1});
	  $('#fileSelect').select2();
	  var url = "${ctx}/systemConfig/helpFileList";
	   loadingDialog();	   
	 	ajaxGet(url,'showList',function(){
	  		closeLoadingDialog();
	  		return true;
	  	});
  });
  
  function cstID(id){
	var ct =	$("#tablefileList").size();
		alert(ct+"=--");
  }
  

//初始化上传图片组件
	 if(${fileType ==2}){
		  initDropzoneUploadPdfList4('thumbnailAuditBtn','previewThumbnailImage','tablefileList','orderFileTypesid','fileSelect',200,100);

	}else{ 
		
		
		
	
	function initDropzoneUploadPictureList2(target,previewThumbnail,tablesid,fileTypeid,fileTypeName,thumbnailWidth,thumbnailHeight){
	  if(!thumbnailHeight){
		  thumbnailHeight = 100;
	  }
	  if(!thumbnailWidth){
		  thumbnailWidth = 100;
	  }

	  
	  var hidePreviewDiv = $('<div class="hidePreviewDiv" style="display:none"></div>');
	  $('#'+previewThumbnail).parent().append(hidePreviewDiv);
	  var isShowThumbai = true;
	  Dropzone.autoDiscover = true;
	    var myDropzone = new Dropzone("#"+target,
	    	{ 	
	    		url: ROOT + "/api/v1/upload/help.json",
	    		method:"POST",
	    		thumbnailWidth:thumbnailWidth,
	    		thumbnailHeight:thumbnailHeight,
	    		
	    		
	    		previewsContainer: '.hidePreviewDiv',
	    		init: function() {
	    			
	                this.on("success", function(file,result) {
	                	closeLoadingDialog();
	                	if(result.code == 200){
	                		$('#'+file.id+'fileSid').val(result.data[0].sid);
	                		$('#'+file.id+'status').text('上传成功-等待提交');
	                	}else{
	                		$('#'+file.id+'status').text('上传失败');
	                		$("#"+file.id).remove();
	                		alertErrorMessage(result.msg);
	                	}
	                });
	                
	                this.on("removedfile", function(file) {
	                	
	                });
	                this.on("thumbnail", function(file,tempThumbnail) {
	                	
	                });
	                this.on("error", function(file,s,x) {
	                	$('#'+file.id+'status').text('上传失败');
	                	$("#"+file.id).remove();
	                	alertErrorMessage("错误！"+s);
	                });
	            }
	    	}
	   
	    );
	    myDropzone.on("addedfile", function(file) {
	    	
	    	file.id = (new Date()).valueOf(); //时间
	    	 var orgFileType = $("#"+fileTypeid).find('option:selected').text();
	    	 var orgFileName = $('#'+fileTypeName).val();
	    	 if (typeof(orgFileName) == "undefined") {
	    		 orgFileName='';
	    	 }else{
	    		 orgFileType = orgFileType+'-'+orgFileName;
	    	 }
	    	var htmlText =$('<tr class="asterisk" id="'+file.id+'">');
	    	htmlText.append('<td><span class="asterisk">'+file.name+'</span><input type="hidden" id="'+file.id+'fileSid" name="fileContent" value=""><input type="hidden" id="'+file.id+'fileType" name="orderFileType" value="'+orgFileType+'"></td>');
	    	htmlText.append('<td>'+orgFileType+'-'+orgFileName+'</td>');
	    	htmlText.append('<td>'+(file.size/1024/1024).toFixed(2)+'MB</td>');
	    	htmlText.append('<td id="'+file.id+'status">上传中</td>');
	    	htmlText.append('<td class="table-action"> <a href="javascript:postOrderFile('+file.id+')" data-toggle="tooltip" title="上传" class="tooltips" ><i class="fa  fa-cloud-upload"></i></a>  <a href="javascript:deleteFileBySid('+file.id+')" data-toggle="tooltip" title="取消" class="delete-row tooltips"><i class="fa fa-trash-o"></i></a></td></tr>');
	    
	    	 $("#"+tablesid).prepend(htmlText)
	    });
	    myDropzone.on("complete", function(file) {
	    	myDropzone.removeFile(file);
	    });
  		}
	

	initDropzoneUploadPictureList2('thumbnailAuditBtn','previewThumbnailImage','tablefileList','orderFileTypesid','fileSelect',200,100);
 	} 
  function postOrderFile(id){

	  var fileSid = $("#"+id+"fileSid").val();
	 
	  var orgFileType = $("#"+id+"fileType").val();
	  var data = "";
	  var url = "${ctx}/systemConfig/saveFileForm?fileSid="+fileSid+"&orgFileType="+orgFileType+"&fileTypeid=1";
	  if(fileSid.length == 0){
  		  alertErrorMessage("请选择上传文件！");
		  return ;
	  }
	  $.get(url, function(result,textStatus){
		  if(textStatus == "success"){
			  $("#"+id).remove();
			  refreshList();
			  refreshDiv("listDiv");
			  alertSuccessMessage("保存成功！");
		  }
	});
  }
  
  function deletFile(url){
	 
	  ajaxPostURL(url,null,function(result){
		  loadingDialog();
		  if(result.code == 200){
			  alertSuccessMessage("删除成功！");
			  refreshList();
		  }else{
			  alertErrorMessage(result.msg);
		  }
		  closeLoadingDialog();
	  });
  }
  
  /**
   * 取消上传文件
   * @param sid
   */
  function deleteFileBySid(id){
	  
	  var sid = $("#"+id+"fileSid").val();
	  if(sid.length == 0){
		  alertSuccessMessage("取消成功！");
		  $("#"+id).remove();
		  return;
	  }
	  var url = ROOT + "/api/v1/upload/delete/"+sid+".json";
	  ajaxPostURL(url,null,function(result){
		  loadingDialog();
		  if(result.code == 200){
			  alertSuccessMessage("取消成功！");
			  $("#"+id).remove();
		  }else{
			  alertErrorMessage(result.msg);
		  }
		  closeLoadingDialog();
	  });
  }
  
  function refreshList(){
	  var url = "${ctx}/systemConfig/helpFileList";
	   loadingDialog();	   
	 	ajaxGet(url,'showList',function(){
	  		closeLoadingDialog();
	  		return true;
	  	});
  }
  
  function openWin(url){
	  window.open (url);
  }
  
  function submitOrderFileTempBt(){	  
	  
	 	loadingDialog();
	 	submitOrderFileTempAjax()
	}
		
  function submitOrderFileTempAjax(){
		 $("#orderAuditFieTempform").ajaxSubmit({  
	        type:"post",  //提交方式  
	        dataType:"json", //数据类型  
	        url:"${ctx}/systemConfig/saveFileListForm?fileType=1", // 请求url  
	        success:function(data){ //提交成功的回调函数  
	       	 	closeLoadingDialog();
	            alertSuccessMessage("保存成功！");
	          	$("#tablefileList").empty();   
	          	refreshList();
	        },
	        error:function(){
	       	 	alertErrorMessage("保存失败！");
	       		closeLoadingDialog();
	        }
	    });  
	}
  
  
  function initDropzoneUploadPdfList4(target,previewThumbnail,tablesid,fileTypeid,fileTypeName,thumbnailWidth,thumbnailHeight){
	  if(!thumbnailHeight){
		  thumbnailHeight = 100;
	  }
	  if(!thumbnailWidth){
		  thumbnailWidth = 100;
	  }

	  
	  var hidePreviewDiv = $('<div class="hidePreviewDiv" style="display:none"></div>');
	  $('#'+previewThumbnail).parent().append(hidePreviewDiv);
	  var isShowThumbai = true;
	  Dropzone.autoDiscover = true;
	    var myDropzone = new Dropzone("#"+target,
	    	{ 
	    		url: ROOT+"/api/v1/upload/zip.json",
	    		method:"POST",
	    		thumbnailWidth:thumbnailWidth,
	    		thumbnailHeight:thumbnailHeight,
	    		maxFilesize: 100,
	    		previewsContainer: '.hidePreviewDiv',
	    		init: function() {
	                this.on("success", function(file,result) {
	                	closeLoadingDialog();
	                	if(result.code == 200){
	                		$('#'+file.id+'fileSid').val(result.data[0].sid);
	                		$('#'+file.id+'status').text('上传成功-等待提交');
	                	}else{
	                		$('#'+file.id+'status').text('上传失败');
	                		$("#"+file.id).remove();
	                		alertErrorMessage(result.msg);
	                	}
	                });
	                this.on("removedfile", function(file) {
	                	
	                });
	                this.on("thumbnail", function(file,tempThumbnail) {
	                	
	                });
	                this.on("error", function(file,s) {
	                	$('#'+file.id+'status').text('上传失败');
	                	$("#"+file.id).remove();
	                	alertErrorMessage("错误！"+s);
	                });
	            }
	    	}
	    );
	    myDropzone.on("addedfile", function(file) {
	    	file.id = (new Date()).valueOf(); //时间
	    	 var orgFileType = $("#"+fileTypeid).find('option:selected').text();
	    	 var orgFileName = $('#'+fileTypeName).val();
	    	 if (typeof(orgFileName) == "undefined") {
	    		 orgFileName='';
	    	 }else{
	    		 orgFileType = orgFileType+'-'+orgFileName;
	    	 }
	    	var htmlText =$('<tr class="asterisk" id="'+file.id+'">');
	    	htmlText.append('<td><span class="asterisk">'+file.name+'</span><input type="hidden" id="'+file.id+'fileSid" name="fileContent" value=""><input type="hidden" id="'+file.id+'fileType" name="orderFileType" value="'+orgFileType+'"></td>');
	    	htmlText.append('<td>'+orgFileType+'-'+orgFileName+'</td>');
	    	htmlText.append('<td>'+file.size+'</td>');
	    	htmlText.append('<td id="'+file.id+'status">上传中</td>');
	    	htmlText.append('<td class="table-action"> <a href="javascript:postOrderFile('+file.id+')" data-toggle="tooltip" title="上传" class="tooltips" ><i class="fa  fa-cloud-upload"></i></a>  <a href="javascript:deleteFileBySid('+file.id+')" data-toggle="tooltip" title="取消" class="delete-row tooltips"><i class="fa fa-trash-o"></i></a></td></tr>');
	    
	    	 $("#"+tablesid).prepend(htmlText)
	    });
	    myDropzone.on("complete", function(file) {
	    	myDropzone.removeFile(file);
	    });
  }
  
 </script>