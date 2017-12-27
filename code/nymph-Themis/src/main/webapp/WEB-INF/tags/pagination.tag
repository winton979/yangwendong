<%@tag pageEncoding="UTF-8"%>
<%@ attribute name="page" type="com.github.miemiedev.mybatis.paginator.domain.Paginator" required="true"%>
<%@ attribute name="isShowPageLength" type="java.lang.Boolean" required="false"%>
<%@ attribute name="target" type="java.lang.String" required="false"%>
<%@ attribute name="isShowPageInfo" type="java.lang.Boolean" required="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="${ctx}/static/eliteadmin/eliteadmin-inverse/../plugins/bower_components/custom-select/custom-select.min.js" type="text/javascript"></script>
<script src="${ctx}/static/eliteadmin/eliteadmin-inverse/../plugins/bower_components/bootstrap-select/bootstrap-select.min.js" type="text/javascript"></script>

<%
if(target == null || "".equals(target)){
	target = "listDiv";
}
Integer[] siders = page.getSlider();
int current = page.getPage();
int limit = page.getLimit();
request.setAttribute("siders", siders);
request.setAttribute("current", current);
request.setAttribute("limit", limit);
request.setAttribute("target", target);
%>
<script type="text/javascript">
	/* $(function() {
		$('.selectpicker').selectpicker();
	}); */
	</script>
<% if(isShowPageInfo != null && isShowPageInfo) {%>
	<div class="dataTables_info" role="status" aria-live="polite">显示[<%= page.getStartRow()%>]到[<%= page.getEndRow()%>]条数据，总共[<%=page.getTotalCount()%>]条数据,当前第[<%=page.getPage() %>/<%=page.getTotalPages() %>]页</div>
<%} %>

<%if(isShowPageLength != null && isShowPageLength) {%>
	<div class="dataTables_length" id="myTable_length" style="width: 500px;" >
		<label class="col-sm-2 control-label"  style="margin-top: 6px; padding-right: 1px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;显示</label>
		<label class="col-sm-2">
		<select  name="myTable_length" aria-controls="myTable" onchange="javascript:setLimit(this.value,'${target}')"  data-style="form-control input-sm">
		<option value="10" <c:if test="${limit == 10}">selected</c:if>>10</option>
		<option value="25" <c:if test="${limit == 25}">selected</c:if>>25</option>
		<option value="50" <c:if test="${limit == 50}">selected</c:if>>50</option>
		<option value="100" <c:if test="${limit == 100}">selected</c:if>>100</option>
		</select></label>&nbsp;<label class="col-sm-2"  style="margin-top: 6px;">条数据</label>
	</div>
<%} %>

<div class="dataTables_paginate paging_simple_numbers" id="myTable_paginate">
	<%if(page.isHasPrePage()){ %>
 		<a class="paginate_button previous" href="javascript:void(0);" onclick="javascript:setPage(${current}-1,'${target}');" aria-controls="myTable" data-dt-idx="0" tabindex="0" id="myTable_previous">上一页</a>
 	<%}else{%>
 		<a class="paginate_button previous disabled" aria-controls="myTable" data-dt-idx="0" tabindex="0" id="myTable_previous">上一页</a>
 	<%} %>
	<span>
		<c:forEach var="i" items="${siders}">
            <c:choose>
                <c:when test="${i == current}">
                	<a class="paginate_button current" href="javascript:void(0);" aria-controls="myTable" data-dt-idx="${i}" tabindex="0">${i}</a>
                </c:when>
                <c:otherwise>
                	<a class="paginate_button " href="javascript:setPage(${i},'${target}');" aria-controls="myTable" data-dt-idx="${i}" tabindex="0">${i}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
	</span>
	<%if(page.isHasNextPage()) {%>
   		<a class="paginate_button next" href="javascript:void(0);" onclick="javascript:setPage(${current}+1,'${target}');" aria-controls="myTable" data-dt-idx="7" tabindex="0" id="myTable_next">下一页</a>
   	<%} else {%>
   	    <a class="paginate_button next disabled" aria-controls="myTable" data-dt-idx="7" tabindex="0" id="myTable_next">下一页</a>
   	<%} %>
	
</div>
