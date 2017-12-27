<%@tag pageEncoding="UTF-8"%>
<%@ attribute name="fileUrl" type="java.lang.String" required="false"%>
<%@ attribute name="fileName" type="java.lang.String" required="false"%>
<%@ attribute name="rootUrl" type="java.lang.String" required="false"%>
<%@ attribute name="delImg" type="java.lang.String" required="false"%>
<% 
if(fileUrl != null &&!"".equals(fileUrl)) {
	String[] urls = fileUrl.split(",");
	for(int i=0;i<urls.length ;i++){
		if(urls[i].length()>0){
%>
<div class="col-md-3 document">
<div class="thmb">
	<div class="thmb-prev">
	<img src="<%=rootUrl+urls[i]%>"
		class="img-responsive" alt="" style="height:400px">
	</div>
	<h5 class="fm-title" style="text-align: center;"><%=fileName%><%if(delImg!=null) {%><span style="margin-left:10px" class="badge badge-danger">X</span><%} %></h5>
</div>
</div>
<!-- thmb -->
<%
		}
	}
	}else{%>
	<%if(delImg==null){%>
<div class="col-md-3 document">
	<div class="thmb">
		<div class="thmb-prev">
		<img src="<%=request.getContextPath()%>/static/images/media-doc.png"
		class="img-responsive" alt="" style="height:400px">
		</div>
		<h5 class="fm-title" style="text-align: center;"><%=fileName %><%if(delImg!=null) {%><span style="margin-left:10px" class="badge">X</span><%} %></h5>
	</div>
</div>
<%}}%>