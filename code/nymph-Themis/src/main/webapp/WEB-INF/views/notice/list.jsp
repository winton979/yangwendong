<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.loans.entity.LoansOrder"%>
<%@ page import="com.cdtsz.chedaitong.loans.enums.LoansNodeEnum"%>
<%@ page import="com.cdtsz.chedaitong.loans.enums.LoansNodeStatusEnum"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<style>
.alert-info {
    color: #4E5154;
    /* background-color: transparent; */
    border-color: #bce8f1;
}
.alert {
    padding: 20px;
}

.unread{

}
.readed{
	background-color: transparent;
}
</style>
<div class="panel panel-default">
	<div class="panel-heading">
		<div class="pull-right">
		<a href="javascript:empty()" class="btn btn-success" ><i class="fa fa-trash-o"></i>清空</a>
		<a href="javascript:delete2()" class="btn btn-success" ><i class="fa fa-trash-o"></i>删除全部</a>
		</div>
		<h4 class="panel-title">
			<i class="fa fa-th-list"></i> 消息列表
		</h4>
		<p>选中下列表数据，点击右边相应的按钮操作</p>
	</div>
	<!-- panel-heading -->

	<!-- 分页对象 -->
	<div class="panel-body" style="padding: 0px 5px 0px 5px;">
		<div class="dataTables_wrapper form-inline dt-bootstrap no-footer">
			<tags:pagination page="${paginator}" isShowPageLength="true" target="listDiv" />
		</div>
		
		<table id="shTable1" style="display:none" class="table table-striped table-bordered responsive dataTable no-footer dtr-inline" role="grid">
			
		</table>
		<div class="contentpanel" style="margin-top: 50px;">
        	<div class="row">
				<div class="col-sm-12">
					<ul class="media-list msg-list">
						<c:forEach var="item" items="${resultList}" varStatus="status">
							<div class="alert alert-info <c:if test="${item.noticStatus eq 0 }">unread</c:if><c:if test="${item.noticStatus eq 1 }">readed</c:if>" data-sid="${item.sid}" style="margin-bottom: 10px;">
								<c:choose>

								   <c:when test="${item.noticeAttrInfo.nodeStatus eq 1}">   
								   	<strong><a href="${item.url }"> ${item.noticTitle }</a></strong>
								   </c:when>
								   
								   <c:otherwise> 
								   	<strong><a href="${ctx}/${item.url }"> ${item.noticTitle }</a></strong> 
								   </c:otherwise>
								  
								</c:choose>
							 ${item.noticText }   <f:formatDate value="${item.noticDate}" pattern="yyyy-MM-dd HH:mm:sss"/>
							</div>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		<!-- 分页对象 -->
		<tags:pagination page="${paginator}" isShowPageInfo="true" target="listDiv" />
	</div>

</div>
<!-- panel -->

<script>
    jQuery(document).ready(function(){
    	$('.unread').on('mouseover',function(){
    		var $this=$(this);
    		var connecting=$this.data('connecting')
    		if(!connecting){
	    		$this.data('connecting',true)
	    		$.post('${ctx}/notice/read',{msgId:$this.attr('data-sid')},function(r){
	    			$this.removeClass('unread').addClass('readed');
	    			$this.off('mouseover');
	    		},'json')
    		}
    	})
    	
    });

    function empty(){
    	
        var urls = "${ctx}/notice/empty";
        	urls=getRandedURL(urls);
        	$.post(urls, function(data){
        			if(data.code == '200'){
        				location.reload();
        				alertSuccessMessage("清空成功！");
        			}else{
        				alertErrorMessage("清空失败！");
        			}
        		});
         
    }
  function delete2(){
    	
        var urls = "${ctx}/notice/delete";
        	urls=getRandedURL(urls);
        	$.post(urls, function(data){
        			if(data.code == '200'){
        				location.reload();
        				alertSuccessMessage("删除成功！");
        			}else{
        				alertErrorMessage("删除失败！");
        			}
        		});
         
    }
    function read(sid){
    	
    }

    function oldLockOrder2(orderSid,url){
    	
        var urls = "${ctx}/loansOrderTracking/oldLockOrder?orderSid="+orderSid;
        	urls=getRandedURL(urls);
        	
        	$.post(urls, function(data){
        			if(data == false){
        				location.href="${ctx}/"+url;
        			}
        		});
    }
</script>