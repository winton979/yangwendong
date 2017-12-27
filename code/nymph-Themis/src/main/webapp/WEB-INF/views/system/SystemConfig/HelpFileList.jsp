<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
 							<table class="table ">
                                <thead>
                                   <tr >
                                    <th colspan="5" style="background-color:#ddd;"><h5>附件列表</h5></th>
                                  </tr>
                                  <tr>
                                    <th style="width:100px">序号</th>
                                    <th>文件名称</th>
                                    <th>文件大小</th>
                                    <th>提交时间</th>
                                    <th>操作</th>
                                  </tr>
                                </thead>
                                <tbody>
                                  <c:forEach var="f" items="${fileList}" varStatus="sta">
                                  <tr>
                                    <td>${sta.count}</td>
                                    <td><a href="javascript:void(0);" onclick="openWin('${f.fileCompleteUrl}')" >${f.fileAlias}</a></td>
                                    <td><f:formatNumber  type="number" value="${f.fileSize/1024/1024}" pattern="0.00" maxFractionDigits="2" /> MB</td>
                                    <td><f:formatDate value="${f.createdDt }" pattern="yyyy-MM-dd HH:mm:sss" /></td>
                                    <td class="table-action">
                                      <a href="javascript:openWin('${f.fileCompleteUrl}')" data-toggle="tooltip" title="下载" class="tooltips" ><i class="fa fa-cloud-download"></i></a>
                                     
                                      	<a href="javascript:deletFile('${ctx}/systemConfig/deleteFileForm/${f.sid}?totalSid=${f.totalSid}')" data-toggle="tooltip" title="删除" class="delete-row tooltips"><i class="fa fa-trash-o"></i></a>
                                     
                                    </td>
                                  </tr>
                       
                       
                       
                       
                       
                                  </c:forEach>
                                 </tbody>
                              </table>
                              
                              
                              <script type="text/javascript">
                       function downloadFile(fileName, content){
                          	    var aLink = document.createElement('a');
                          	    var blob = new Blob([content]);
                          	    var evt = document.createEvent("HTMLEvents");
                          	    evt.initEvent("click", false, false);//initEvent 不加后两个参数在FF下会报错, 感谢 Barret Lee 的反馈
                          	    aLink.download = fileName;
                          	    aLink.href = URL.createObjectURL(blob);
                          	    aLink.dispatchEvent(evt);
                          	} 
                             
                              
                         	/* function downloadFile( strLocalURL,strRemoteURL){
                          		
                          	
                          		
                                try{
                                    var xmlHTTP = new ActiveXObject("Microsoft.XMLHTTP");
                                    xmlHTTP.open("Get", strRemoteURL, true);
                                    xmlHTTP.send();
                                    var adodbStream = new ActiveXObject("ADODB.Stream");
                                    adodbStream.Type = 1;//1=adTypeBinary 
                                    adodbStream.Open();
                                    adodbStream.write(xmlHTTP.responseBody);
                                    adodbStream.SaveToFile("D:/AD.zip", 2);
                                    adodbStream.Close();
                                    adodbStream = null;
                                    xmlHTTP = null;
                                }
                                catch (e){
                                    window.confirm("下载URL出错!");
                                }
                                //window. confirm("下载完成."); 
                            }*/
                            
                            /*    function downloadFile(fileName, url){
                              	 var xhr = new XMLHttpRequest();    
                              	    xhr.open("get", url, true);
                              	    xhr.responseType = "blob";
                              	    xhr.onload = function() {
                              	        if (this.status == 200) {
                              	            var blob = this.response;
                              	            var aLink = document.createElement('a');
                              	            var evt = document.createEvent("HTMLEvents");
                              	            evt.initEvent("click", false, false);//initEvent 不加后两个参数在FF下会报错, 感谢 Barret Lee 的反馈
                              	           	aLink.download = fileName;
                              	            aLink.href = URL.createObjectURL(blob);
                              	            aLink.dispatchEvent(evt);
                              	    	}else{
                              	    		alert("文件丢失！");
                              	    	}
                              	  }
                              	   xhr.send();
                               }		  */
                            
                              </script>