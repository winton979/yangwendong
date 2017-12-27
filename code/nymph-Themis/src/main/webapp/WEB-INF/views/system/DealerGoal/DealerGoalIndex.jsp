<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.system.entity.DealerInfo"%>
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
	        			<a href="${ctx}/dealerGoal/create/	" class="btn btn-success" data-toggle="modal" data-target=".bs-organization-edit-modal">编辑</a>
<%-- 	        		<ms:hasAnyPermission name="superAdmin,dealerGoal:create">
	        	
	        		</ms:hasAnyPermission>
 --%>                </div>
	        </div>
	        <h4 class="panel-title"><i class="glyphicon glyphicon-search"></i>查询条件</h4>
	        <p>请输入相关的查询条件，点击查询</p>
	    </div>
	    
	    <div class="panel-body">
	        <form class="form-inline" id="searchForm" action="${ctx}/dealerGoal/list?pageLimit=50" method="get" onsubmit="submitSearchRequest('searchForm','listDiv');return false;">
	        </form>
	    </div>
	   
	</div>

	<div id="listDiv">
	
	</div>
	
</div>

<div class="modal fade bs-organization-edit-modal" tabindex="-1" role="dialog" data-backdrop="static">
    <div class="modal-dialog modal-lg" style="width:60%">
      <div class="modal-content">
      </div>
    </div>
</div>


<div id="showPicModal2" class="modal fade" tabindex="-1" role="dialog"  >
     <div class="modal-dialog modal-sm" style="width:985px">
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
    });

</script>