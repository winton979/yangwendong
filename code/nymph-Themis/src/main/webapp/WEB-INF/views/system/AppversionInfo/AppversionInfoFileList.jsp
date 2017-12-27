<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%><script type="text/javascript">

function downloadFile(){
	loadingDialog();	 
	var url ="${ctx}/courierInfo/courierToZip?sid=${id}";
	ajaxPostURL(url,null,function(response){
		if(response.code == '200'){
			if(response.url!=null){
				window.open(response.url);
			}else{
				var sd = "没有可下载ZIP文件！";
				alertErrorMessage(sd);
			}
		}else{
			var sd = "没有可下载ZIP文件！";
			alertErrorMessage(sd);
		}
		closeLoadingDialog();
	});
	
	
	
	
	
}	


</script> 
<c:set var="ctx" value="${pageContext.request.contextPath}" />
 							<table class="table table-primary mb30">
                                <thead>
                                  <tr>
                                    <th>序号</th>
                                    <th>文件名称</th>
                                    <th>文件大小</th>
                                    <th>上传时间</th>
                                    <th></th>
                                  </tr>
                                </thead>
                                <tbody>
                                  <c:forEach var="f" items="${fileList}" varStatus="sta">
                                  <tr>
                                    <td>${sta.count}</td>
                                    <td><a href="javascript:void(0);" onclick="openWin('${rootUrl}${f.fileUrl}')" >${f.fileAlias}</a></td>
                                    <td>${f.fileSize}</td>
                                    <td>${f.createdDtString}</td>
                                    <td class="table-action">
                                      <a href="javascript:openWin('${rootUrl}${f.fileUrl}')" data-toggle="tooltip" title="下载" class="tooltips" ><i class="fa  fa-download"></i></a>
                                      <a href="javascript:deletFile(${f.sid})" data-toggle="tooltip" title="删除" class="delete-row tooltips"><i class="fa fa-trash-o"></i></a>
                                    </td>
                                  </tr>
                                  </c:forEach>
                                 </tbody>
                              </table>