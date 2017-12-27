<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.loans.entity.LoansOrder"%>
<%@ page import="com.cdtsz.chedaitong.loans.enums.LoansNodeEnum"%>
<%@ page import="com.cdtsz.chedaitong.loans.enums.LoansNodeStatusEnum"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<style>
.msg-list > li p a {
    color: #2F2D2D;
}
.mail-readed{
	background: url(${ctx}/static/images/mail.png) 0 no-repeat;
	width:100%
}
.mail-unread{
	background: url(${ctx}/static/images/mail-unread.png) 0 no-repeat;
	width:100%
}
</style>
<div class="panel panel-default">
	<div class="panel-heading">
		<div class="pull-right"></div>
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
		
		<c:forEach var="item" items="${resultList}" varStatus="status">
							<div class="alert alert-info">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                    <strong>Heads up!</strong> This <a href="" class="alert-link">alert needs your attention</a>, but it's not super important.
                                </div>
						</c:forEach>
						
		<table id="shTable1" style="display:none" class="table table-striped table-bordered responsive dataTable no-footer dtr-inline" role="grid">
			
		</table>
		<div class="contentpanel" style="margin-top: 50px;">
        	<div class="row">
				<div class="col-sm-12">
					<ul class="media-list msg-list" >
						
						<c:forEach var="item" items="${resultList}" varStatus="status">
							<div class="alert alert-info">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                    <strong>Heads up!</strong> This <a href="" class="alert-link">alert needs your attention</a>, but it's not super important.
                                </div>
						</c:forEach>
						<%-- <c:forEach var="item" items="${resultList}" varStatus="status">
	                    	<li class="media unread">
	                            <a class="pull-left" href="#">
                                         <img class="media-object img-circle img-online" src="${ctx}/static/images/photos/profile.png" alt="...">
                                     </a>
	                            
	                            <div class="media-body">
	                                <div class="pull-right media-option">
	                                    <small><f:formatDate value="${item.noticDate }" pattern="yyyy-MM-dd HH:mm:sss"/></small>
	                                    <a href=""><i class="fa fa-star"></i></a>
	                                    <div class="btn-group">
	                                        <a class="btn btn-default dropdown-toggle" data-toggle="dropdown">
	                                            <i class="fa fa-cog"></i>
	                                        </a>
	                                        <ul class="dropdown-menu pull-right" role="menu">
	                                            <li><a href="#">Mark as Unread</a></li>
	                                            <li><a href="#">Reply</a></li>
	                                            <li><a href="#">Forward</a></li>
	                                            <li><a href="#">Archive</a></li>
	                                            <li><a href="#">Move to Folder</a></li>
	                                            <li><a href="#">Delete</a></li>
	                                            <li class="divider"></li>
	                                            <li><a href="#">Report as Spam</a></li>
	                                        </ul>
	                                    </div>
	                                </div>
	                                <h4 class="sender">${item.noticTitle }</h4>
	                                <p><a href="view_message.html"><strong class="subject"></strong> ${item.noticText }</a></p>
	                            </div>
	                        </li>
						</c:forEach> --%>
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
    	
    	
    });
    
</script>