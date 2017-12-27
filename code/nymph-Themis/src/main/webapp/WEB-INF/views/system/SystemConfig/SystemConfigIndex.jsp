<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.system.entity.SystemConfig"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<div class="contentpanel">
	<div class="panel panel-default">
	    <div class="panel-heading">
	        <div class="panel-btns">
	            <a href="#" class="panel-minimize tooltips" data-toggle="tooltip" title="隐藏/显示"><i class="fa fa-minus"></i></a>
	        </div><!-- panel-btns -->
	        <div class="pull-right">
	        	<div class="btn-list">
	        	<img id="previewOrgThumbnailImage" src="http://www.placehold.it/120x120/EFEFEF/AAAAAA" alt="" style="display:none;">
	        		<ms:hasAnyPermission name="superAdmin,systemConfig:create">
	        			<a href="${ctx}/systemConfig/create" class="btn btn-success" data-toggle="modal" data-target=".bs-organization-edit-modal">创建系统配置</a>
	        		</ms:hasAnyPermission>
	        		<a href="javascript:void(0)"  id="uploadBtn1" class="btn btn-info" >上传帮助文档</a>
	        		<input type="hidden" name="fileSid" id="fileSid" class="form-control" maxlength="64" disabled="disabled" />
	        		<a href="${rootUrl}${fileManager.fileUrl}"  id="download"  class="btn btn-info" >下载帮助文档</a>
                </div>
	        </div>
	        <h4 class="panel-title"><i class="glyphicon glyphicon-search"></i>系统配置信息查询条件</h4>
	        <p>请输入相关的查询条件，点击查询</p>
	    </div>
	    <div class="panel-body">
	        <form class="form-inline" id="searchForm" action="${ctx}/systemConfig/list" method="get" onsubmit="submitSearchRequest('searchForm','listDiv');return false;">
							<div class="form-group">
				                <label class="sr-only"><%=SystemConfig.ALIAS_CONFIG_CODE%></label>
				                <input type="text" id="configCode" name="configCodeEqualTo" class="form-control" placeholder="<%=SystemConfig.ALIAS_CONFIG_CODE%>">
				            </div><!-- form-group -->
							<div class="form-group">
				                <label class="sr-only">配置名称</label>
				                <input type="text" id="configName" name="configNameEqualTo" class="form-control" placeholder="配置名称">
				            </div><!-- form-group -->
	            <button type="submit" class="btn btn-primary mr5">查询</button>
	            <button type="reset" class="btn btn-default">重置</button>
	        </form>
	    </div><!-- panel-body -->
	</div><!-- panel -->

	<div id="listDiv">
	
	</div><!-- listdiv -->
	
</div><!-- contentpanel -->

<div class="modal fade bs-organization-edit-modal" tabindex="-1" role="dialog" data-backdrop="static">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      </div>
    </div>
</div>
<script>
    jQuery(document).ready(function(){
	    //解决模式对象远程对象只加载一次的事件
      	$(".bs-organization-edit-modal").on("hidden.bs.modal", function() { $(this).removeData("bs.modal"); });
	    //查询
      	$('#searchForm').submit();
      	initDropzoneUpload('uploadBtn1','fileSid',function(result){
    		if(result.code == 200){
	    		alertSuccessMessage("上传成功")
        	}else{
        		alertErrorMessage(result.msg);
        	}
		});
        $.post('${ctx}/systemConfig/yanzhen',function(db){
   		  
   		  if(db.code == 400){
   			$('#download').live('click', function(event) {
   			  alertErrorMessage("请先上传文件");
   			  event.preventDefault();   
   			});
   		  }
   		},'json'); 
    });
    /* function  download(){
    	alert(1);
    	 $.post('${ctx}/systemConfig/yanzhen',function(db){
    		  
    		  if(db.code == 200){
    			   $.get('${ctx}/systemConfig/download',function(db){
    				   
    			   },'json'); 
    		  }else{
    			  alertErrorMessage("请先上传文件");
    		  }
    		},'json'); 
    } */
    
    function initDropzoneUpload(target,hideInput,callback){
    	
		var hidePreviewDiv = $('<div class="hidePreviewDiv" style="display:none"></div>');
    	$('#'+hideInput).parent().append(hidePreviewDiv);
  	 	Dropzone.autoDiscover = true;
  	    var myDropzone = new Dropzone("#"+target,
  	    	{ 
  	    		url: ROOT + "/api/v1/upload/help.json",
  	    		//url: ROOT + "/systemConfig/upload.json",
  	    		method:"POST",
  	    		previewsContainer:'.hidePreviewDiv',
  	    		maxFilesize: 1000,
  	            error:function(file,msg) {
  	            	
  	            	
  	            	closeUploadingDialog();
              		alertErrorMessage(msg);
                },
                success: function (file, result) {
                	
               		
               		var  url="${ctx}/fileTotalInfo/create?id="+result.data[0].sid;
            		ajaxPostURL(url,null,function(result2){
            			location.reload() ;
            			callback(result);
            		})
               		
               		
                },
                uploadprogress:function(file, progress, bytesSent){
                	$('#uploadingDiv').text(progress+'%')
                },
                sending:function(file, xhr, formData) {
          	 		showDialog("正在上传")
          		},
          		complete:function(file) {
                	closeUploadingDialog();
          	    	myDropzone.removeFile(file);
          	    }
  	    	}
  	    );
  	    
  	}
  //上传进度对话框
    var uploadingDialog;
    function showDialog(title){
   		uploadingDialog = dialog({
  			width: 200,
  			content:title + '<span id="uploadingDiv">0</span><img src="'+ROOT+'/static/images/ajax_loader.gif"/>',
  			height: 40
   		});
    	uploadingDialog.showModal();
    }
    function closeUploadingDialog(){
    	if(uploadingDialog!=null){
    		uploadingDialog.close().remove();
    		uploadingDialog = null;
    	}
    }
    
</script>