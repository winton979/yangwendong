<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.system.entity.SystemConfig"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<div class="panel panel-default">
	<div class="panel-heading">
        <div class="pull-right">
        </div>
        <h4 class="panel-title"><i class="fa fa-th-list"></i>系统配置信息查询结果</h4>
        <p>选中下列表数据，点击右边相应的按钮操作</p>
    </div><!-- panel-heading -->
    
    <!-- 分页对象 -->
    <div class="panel-body" style="padding:0px 5px 0px 5px;"><div class="dataTables_wrapper form-inline dt-bootstrap no-footer">
	   <%--  <tags:pagination page="${paginator}" isShowPageLength="true" target="listDiv"/> --%>
    </div>
    
    <table id="shTable2" class="table table-striped table-bordered table-condensed responsive dataTable no-footer dtr-inline" role="grid">
        <thead>
            <tr>
            	<th style="width:1px;"> </th>
                <th>操作</th>
				<th>文件名</th>
				<th>渠道</th>
				
            </tr>
        </thead>
        <tbody>
          <c:forEach var="item" items="${resultList}" varStatus="status">
            <tr>
            	<td>${paginator.offset + status.count}</td>
            	<td>
					<%-- <ms:hasAnyPermission name="superAdmin,systemConfig:view">
	                   <a href="${ctx}/systemConfig/view/${item.sid}" class="btn btn-primary" data-toggle="modal" data-target=".bs-organization-edit-modal">查看</a>
					</ms:hasAnyPermission>
                    <ms:hasAnyPermission name="superAdmin,systemConfig:update">
                   	   <a href="${ctx}/systemConfig/update/${item.sid}" class="btn btn-primary" data-toggle="modal" data-target=".bs-organization-edit-modal">编辑</a>
                   </ms:hasAnyPermission>--%>
                  
                   
                    <a href="javascript:openWin('${rootUrl}${item.fileUrl}');"  class="btn btn-primary" id="growl-danger">下载</a>
                    <ms:hasAnyPermission name="superAdmin,help:delete">
                      <a href="javascript:void(0);" onclick="javascript:deleteHelp('${ctx}/systemConfig/deleteFileForm/${item.sid}?totalSid=${item.totalSid}')" class="btn btn-danger" id="growl-danger">删除</a>
	                  
                   </ms:hasAnyPermission> 
                </td>
				<td><c:out value='${item.fileAlias}'/>帮助文档</td>
				<td> <c:out value='${item.fileAlias}'/> </td>
				
				
            </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <!-- 分页对象 -->
   <%--  <tags:pagination page="${paginator}" isShowPageInfo="true" target="listDiv"/></div> --%>
    
</div><!-- panel -->

<script>
    jQuery(document).ready(function(){
        var shTable = initDataListTable('shTable');
    });
    function openWin(url){
    
  	  window.open (url);
    }
    //删除组织
    function deleteHelp(url,msg){
    	alertDialog(msg,function(){
    		url=getRandedURL(url);
    		ajaxPostURL(url,null,function(response){
    			alertSuccessMessage(response.msg);
    			refreshDiv("listDiv");
    		});
    	});
    }
</script>