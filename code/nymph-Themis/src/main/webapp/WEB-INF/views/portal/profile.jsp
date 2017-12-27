<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<script src="${ctx}/static/js/baiduMap.js"></script>
</head>
<body>
	<div class="contentpanel">
		<div class="row">
           <div class="col-md-12">
               <!-- Nav tabs -->
               <ul id="myTab" class="nav nav-tabs nav-primary">
                 <shiro:hasAnyRoles name="teacherAdminRole">
                   <li class="active"><a href="myTabContent" target="${ctx}/organization/viewByCode/${orgCode}" data-toggle="tab"><strong>幼儿园信息</strong></a></li>
                  </shiro:hasAnyRoles>
                 <shiro:hasAnyRoles name="organdminRole,superAdmin">
                   <li class="active"><a href="myTabContent" target="${ctx}/organization/updateByCode/${orgCode}" data-toggle="tab"><strong>幼儿园信息</strong></a></li>
                  </shiro:hasAnyRoles>
                   <%-- <li><a href="myTabContent" target="${ctx}/adminUser/update/${loginUserSid}" data-toggle="tab"><strong>账号信息</strong></a></li> --%>
                   <c:if test="${!empty userRelSid}">
                   	<li><a href="myTabContent" target="${ctx}/teacherInfo/update/${userRelSid}" data-toggle="tab"><strong>个人信息</strong></a></li>
                   </c:if>
               </ul>

               <!-- Tab panes -->
               <div class="tab-content tab-content-primary mb30">
                   <div class="tab-pane active" id="myTabContent">
                   </div><!-- tab-pane -->
               </div><!-- tab-content -->
               
           </div><!-- col-md-12 -->
       </div><!-- row -->
	</div>
	<div class="modal fade bs-organization-edit-modal" tabindex="-1" role="dialog" data-backdrop="static">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      </div>
    </div>
</div>
	<script type="text/javascript">
	  $(document).ready(function(){
		//解决模式对象远程对象只加载一次的事件
		tabsInit('myTab',${selected});
	    $(".bs-organization-edit-modal").on("hidden.bs.modal", function() { $(this).removeData("bs.modal"); });
	  });
	</script>
</body>
</html>