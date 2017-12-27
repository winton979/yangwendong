<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>

<div class="panel panel-default">
	<div class="panel-heading">
        <div class="pull-right">
            <!-- <div class="btn-group">
              <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">操作
                <span class="caret"></span>
              </button>
              <ul class="dropdown-menu" role="menu">
                <li><a href="#">角色管理</a></li>
                <li><a href="#">启用/禁用</a></li>
                <li><a href="#">删除</a></li>
              </ul>
            </div> -->
        </div>
        <h4 class="panel-title"><i class="fa fa-th-list"></i>用户数据查询</h4>
        <p>选中下列表数据，点击右边相应的按钮操作</p>
    </div><!-- panel-heading -->
    
    <!-- 分页对象 -->
    <div class="panel-body" style="padding:0px 5px 0px 5px;"><div class="dataTables_wrapper form-inline dt-bootstrap no-footer">
	    <tags:pagination page="${paginator}" isShowPageLength="true" target="listDiv"/>
    </div>
    
    <table id="shTable2" class="table table-striped table-bordered responsive dataTable no-footer dtr-inline" role="grid">
        <thead>
            <tr>
                <th style="width:1px;"> </th>
                <th style="">操作</th>
                <tags:sort curretOrder="${criteria.orderByClause}" fieldName="USER_NAME" target="listDiv" fieldTitle="用户账号"/>
                <tags:sort curretOrder="${criteria.orderByClause}" fieldName="ORG_CODE" target="listDiv" fieldTitle="所属分支机构"/>
                <tags:sort curretOrder="${criteria.orderByClause}" fieldName="USER_TYPE" target="listDiv" fieldTitle="用户所属组"/>
                <tags:sort curretOrder="${criteria.orderByClause}" fieldName="ENABLED" target="listDiv" fieldTitle="是否启用"/>
                <th>用户姓名</th>
                <!-- <th>联系电话</th>
                <th>电子邮件</th> -->
                <th>创建时间</th>
            </tr>
        </thead>
        <tbody>
          <c:forEach var="adminUser" items="${resultList}" varStatus="status">
            <tr>
            	<td>${paginator.offset + status.count}</td>
            	<td>
                	<ms:hasAnyPermission name="superAdmin,adminUser:update">
                		<a href="${ctx}/adminUser/update/${adminUser.sid}" class="btn btn-primary" data-toggle="modal" data-target=".bs-organization-edit-modal">编辑</a>
                	</ms:hasAnyPermission>
                	<ms:hasAnyPermission name="superAdmin,adminUser:delete">
                   		<a href="javascript:void(0);" onclick="javascript:deleteAdminUser(${adminUser.sid});" class="btn btn-danger" id="growl-danger">删除</a>
                	</ms:hasAnyPermission> 
                </td>
                <td>${adminUser.userName}</td>
                <td>${adminUser.adminOrgName }</td>
                <td>${userTypeMap[adminUser.userType]}</td>
                <c:if test="${adminUser.enabled == 1}">
                <td><span class="badge badge-primary">${enabledMap[adminUser.enabled]}</span></td>
                </c:if>
                <c:if test="${adminUser.enabled == 0}">
                <td><span class="badge badge-danger">${enabledMap[adminUser.enabled]}</span></td>
                </c:if>
                <c:if test="${empty adminUser.enabled}">
                <td>${enabledMap[adminUser.enabled]}</td>
                </c:if>
                <td>${adminUser.realName}</td>
                <%-- <td>${adminUser.userTel}</td>
                <td>${adminUser.userEmail}</td> --%>
                <td>${adminUser.createdDtString}</td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <!-- 分页对象 -->
    <tags:pagination page="${paginator}" isShowPageInfo="true" target="listDiv"/></div>
    
</div><!-- panel -->

<script>
    jQuery(document).ready(function(){
        var shTable = initDataListTable('shTable');
        initHideOrShowColumns(shTable,'shCol');
    });
</script>