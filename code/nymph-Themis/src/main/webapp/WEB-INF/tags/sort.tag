<%@tag pageEncoding="UTF-8"%>
<%@ attribute name="fieldName" type="java.lang.String" required="false"%>
<%@ attribute name="fieldTitle" type="java.lang.String" required="false"%>
<%@ attribute name="curretOrder" type="java.lang.String" required="false"%>
<%@ attribute name="target" type="java.lang.String" required="false"%>
<%@ attribute name="width" type="java.lang.String" required="false"%>

<%
  String fieldNameDesc = fieldName + " DESC";
  String fieldNameASC = fieldName + " ASC";
  String nextOrderFieldName = fieldNameASC;
  String orderSortClass = "sorting";
  if(curretOrder.equals(fieldNameDesc)){
	  orderSortClass = "sorting_desc";
  }else if(curretOrder.equals(fieldNameASC)){
	  orderSortClass = "sorting_asc";
	  nextOrderFieldName = fieldNameDesc;
  }
  request.setAttribute("title", fieldTitle);
  request.setAttribute("orderSortClass", orderSortClass);
  request.setAttribute("target", target);
  request.setAttribute("width", width);
  request.setAttribute("nextOrderFieldName", nextOrderFieldName);
%>

<th class="${orderSortClass}" width="${width}" onclick="javascript:setOrder('orderByClause','${nextOrderFieldName}','${target}');">${title}</th>

<!-- <tags:sort curretOrder="${criteria.orderByClause}" fieldName="TB.BUSINESS_NO" target="listDiv" fieldTitle="后台编号"/> -->