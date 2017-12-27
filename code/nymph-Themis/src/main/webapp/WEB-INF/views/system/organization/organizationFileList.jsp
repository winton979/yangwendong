<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
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
                                    <td><a href="javascript:void(0);" onclick="openWin('${f.fileCompleteUrl}')" >${f.fileAlias}</a></td>
                                    <td><f:formatNumber  type="number" value="${f.fileSize/1024/1024}" pattern="0.00" maxFractionDigits="2" /> MB</td>
                                    <td><f:formatDate value="${f.createdDt }" pattern="yyyy-MM-dd HH:mm:sss" /></td>
                                    <td class="table-action">
                                      <!-- <a href="http://www.suchso.com/zb_users/plugin/Thumbnail/random/15.jpg" data-toggle="tooltip" title="下载" class="tooltips" ><i class="fa  fa-download"></i></a> -->
                                      <a href="javascript:deletFile(${f.sid})" data-toggle="tooltip" title="删除" class="delete-row tooltips"><i class="fa fa-trash-o"></i></a>
                                    </td>
                                  </tr>
                                  </c:forEach>
                                 </tbody>
                              </table>