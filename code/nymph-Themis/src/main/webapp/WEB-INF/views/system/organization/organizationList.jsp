<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>

<div class="panel panel-default">
	<div class="panel-heading">
        <div class="pull-right">
            <div class="btn-group">
                <button data-toggle="dropdown" class="btn btn-sm mt5 btn-white noborder dropdown-toggle" type="button">显示/隐藏列<span class="caret"></span>
                </button>
                <ul role="menu" id="shCol" class="dropdown-menu dropdown-menu-sm pull-right">
                    <li>
                        <div class="ckbox ckbox-primary">
                            <input type="checkbox" checked="checked" id="checkName" value="0">
                            <label for="checkName">车行名称</label>
                        </div>
                    </li>
                    <li>
                        <div class="ckbox ckbox-primary">
                            <input type="checkbox" checked="checked" id="checkPosition" value="1">
                            <label for="checkPosition">车行地址</label>
                        </div>
                    </li>
                    <li>
                        <div class="ckbox ckbox-primary">
                            <input type="checkbox" checked="checked" id="checkOffice" value="2">
                            <label for="checkOffice">车行联系人</label>
                        </div>
                    </li>
                    <li>
                        <div class="ckbox ckbox-primary">
                            <input type="checkbox" checked="checked" id="checkAge" value="3">
                            <label for="checkAge">联系人电话</label>
                        </div>
                    </li>
                    <li>
                        <div class="ckbox ckbox-primary">
                            <input type="checkbox" checked="checked" id="checkDate" value="4">
                            <label for="checkDate">车行电话</label>
                        </div>
                    </li>
                    <li>
                        <div class="ckbox ckbox-primary">
                            <input type="checkbox" checked="checked" id="checkSalary" value="5">
                            <label for="checkSalary">创建时间</label>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <h4 class="panel-title"><i class="fa fa-th-list"></i> 查询数据</h4>
        <p>点击右边显示/隐藏不需要的列</p>
    </div><!-- panel-heading -->
    
    <!-- 分页对象 -->
    <div class="panel-body" style="padding:0px 5px 0px 5px;"><div class="dataTables_wrapper form-inline dt-bootstrap no-footer">
	    <tags:pagination page="${paginator}" isShowPageLength="true" target="listDiv"/>
    </div>
    
    <table id="shTable1" class="table table-striped table-bordered responsive dataTable no-footer dtr-inline" role="grid">
        <thead>
            <tr>
            	<th style="width:120px">操作</th>
            	<th style="width:120px">所属FA团队</th>
            	<%-- <tags:sort curretOrder="${criteria.orderByClause}" fieldName="ORG_CODE" target="listDiv" fieldTitle="车行编码"/> --%>
                <tags:sort width="120px" curretOrder="${criteria.orderByClause}" fieldName="ORG_NAME" target="listDiv" fieldTitle="车行名称"/>
           		<%-- <tags:sort curretOrder="${criteria.orderByClause}" fieldName="ORG_PARENT_SID" target="listDiv" fieldTitle="上级4S店"/> --%>
             	<th style="width:80px">车行类型</th> 
             	<th style="width:150px">开户行</th> 
             	<th style="width:150px">账户</th> 
             	<%-- <th>车行地址</th> --%>
                <th style="width:50px">车行负责人</th>
           		<%-- <th>联系电话</th> --%>
           		<th style="width:50px">资料是否齐全</th>
           		<th style="width:50px">是否签约</th>
                <th style="width:50px">状态</th>
                <tags:sort width="70px" curretOrder="${criteria.orderByClause}" fieldName="ENABLED" target="listDiv" fieldTitle="创建时间"/>
                
            </tr>
        </thead>
        <tbody>
          <c:forEach var="organ" items="${resultList}" varStatus="sta">
            <tr>
            	<td>
            	
                	<ms:hasAnyPermission name="superAdmin,organization:update">
	                	<a href="${ctx}/organization/update/${organ.sid}" class="btn btn-primary" data-toggle="modal" data-target=".bs-organization-edit-modal">编辑</a>
	                    <a href="${ctx}/organization/updateFile/${organ.sid}" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">附件</a>
					 </ms:hasAnyPermission>
				 <%--<ms:hasAnyPermission name="superAdmin,organization:delete"> 
                	<a href="javascript:void(0);" onclick="javascript:deleteOrgan(${organ.sid});" class="btn btn-danger" id="growl-danger">删除</a>
                </ms:hasAnyPermission>--%>
                </td>
            	<td>${organ.faCodeName}</td>
             	<%--    <td>${organ.orgCode}</td> --%>
                <td>${organ.orgName}</td>
                <%-- <td>${organ.orgParentName}</td> --%>
                
                <td>
	                <c:if test="${organ.orgType ==1 }"><span class="badge badge-success">4S店</span></c:if>
	                <c:if test="${organ.orgType ==2 }"><span class="badge badge-success">二手车</span></c:if>
	                <c:if test="${organ.orgType ==3 }"><span class="badge badge-success">二级</span></c:if>
               	</td>
               	<td>${organ.openingBank}</td>
               	<td>${organ.bankAccount}</td>
            	<%--    <td>${organ.orgFullAddress}</td> --%>
                <td>${organ.contactPerson}</td>
            	<%--    <td>${organ.contactTel}</td> --%>
            	<td>
	                <c:if test="${organ.isComplete}"><span class="badge badge-success">是</span></c:if>
	                <c:if test="${!organ.isComplete}"><span class="badge badge-danger">否</span></c:if>
               	</td>
               	<td>
               		<c:if test="${organ.signedStatus == 1}"><span class="badge badge-success">是</span></c:if>
	                <c:if test="${organ.signedStatus != 1}"><span class="badge badge-danger">否</span></c:if>
               	</td>
              	<td>
					<c:if test="${organ.status == 1}">
		            	<span class="badge badge-primary">${auditStatus[organ.status]}</span>
		       		</c:if>
		            <c:if test="${organ.status == 0}">
		            	<span class="badge badge-danger">${auditStatus[organ.status]}</span>
		            </c:if>
		            
		              <c:if test="${organ.status == 2}">
		            	<span class="badge badge-warning">${auditStatus[organ.status]}</span>
		           	 </c:if>
		            
		            <c:if test="${empty organ.status}">
		            	${auditStatus[organ.status]}
					</c:if>
	             </td>
                <td>${organ.createdDtString}</td>
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