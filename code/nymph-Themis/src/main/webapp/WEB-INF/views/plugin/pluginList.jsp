<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.loans.entity.LoansOrder"%>
<%@ page import="com.cdtsz.chedaitong.loans.enums.LoansNodeEnum"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<div class="panel panel-default">
	<div class="panel-heading">
        <div class="pull-right"></div>
        <h4 class="panel-title"><i class="fa fa-th-list"></i>查询结果</h4>
        <p>选中下列表数据，点击右边相应的按钮操作</p>
    </div><!-- panel-heading -->
    
    <!-- 分页对象 -->
    <div class="panel-body" style="padding:0px 5px 0px 5px;"><div class="dataTables_wrapper form-inline dt-bootstrap no-footer">
	    <tags:pagination page="${paginator}" isShowPageLength="true" target="listDiv"/> 
    </div>
    
    <table id="shTable2" class="table table-striped table-bordered responsive dataTable no-footer dtr-inline" role="grid" >
        <thead>
            <tr>
            	<th style="width:1px;"> </th>
           	  	<th><div style="">操作</div></th>
				<th><div style="">客户姓名</div></th>
				<th><div style="">客户手机</div></th>
			
            </tr>
        </thead>
        <tbody>
			<c:forEach var="item" items="${resultList}" varStatus="status">
	            <tr>
	            	<td>${paginator.offset + status.count}</td>
	            	<td>	<!--  	
						 <a id="report${item.sid}" href="${ctx}/loansReport/report/${item.sid}" class="btn btn-success">填充</a>
						<input type="button" value="填充" onclick="test()"> -->
						 <button id="test">填充!</button>
						
	                </td>
					<td><c:out value='${item.name}'/></td>
					<td><c:out value='${item.tel}'/></td>
					
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
    });
    
    var test = function () {
        
        alert("我是子页面");
        top.myFun();
    }
	
</script>