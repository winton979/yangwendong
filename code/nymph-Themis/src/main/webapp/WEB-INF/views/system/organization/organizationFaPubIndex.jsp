<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<script src="${ctx}/static/js/baiduMap.js"></script>
</head>
<body>
<div class="contentpanel">
	<div class="panel panel-default">
	    <div class="panel-heading">
	        <div class="panel-btns">
	            <a href="#" class="panel-minimize tooltips" data-toggle="tooltip" title="隐藏/显示"><i class="fa fa-minus"></i></a>
	        </div><!-- panel-btns -->
	        <h4 class="panel-title"><i class="glyphicon glyphicon-search"></i>可用车行查询条件</h4>
	        <p>请输入相关的查询条件，点击查询</p>
	    </div>
	    <div class="panel-body">
	        <form class="form-inline" id="searchForm" action="${ctx}/organization/faPubList?pageLimit=100" method="get" onsubmit="submitSearchRequest('searchForm','listDiv');return false;">
	            <div class="form-group">
	                <label class="sr-only">4S店名称</label>
	                <input type="text" name="orgNameIsLike" class="form-control" placeholder="车行名称">
	            </div>
	            <button type="submit" class="btn btn-primary mr5">查询</button>
	            <button type="reset" class="btn btn-default">重置</button>
	        </form>
	    </div>
	</div>
	<div id="listDiv">
	</div>
</div>

<div id="bs-organization-edit-modal" class="modal fade bs-organization-edit-modal" tabindex="-1" role="dialog" data-backdrop="static">
    <div class="modal-dialog modal-lg" style="width:90%">
      <div class="modal-content">
      </div>
    </div>
</div>
       
 <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog">
     <div class="modal-dialog modal-sm" style="width:70%">
       <div class="modal-content">

       </div>
     </div>
 </div>
<script>
    jQuery(document).ready(function(){
      onchangeCountrySelected();
  	  $('#qproivnceSelectId').select2({minimumResultsForSearch:-1});
  	  $('#qcitySelectId').select2({minimumResultsForSearch:-1});
  	  $('#qdistrictSelectId').select2({minimumResultsForSearch:-1});
      $('#searchForm').submit();
      
      //解决模式对象远程对象只加载一次的事件
      $(".bs-organization-edit-modal").on("hidden.bs.modal", function() { $(this).removeData("bs.modal"); });
      //解决模式对象远程对象只加载一次的事件
      $(".bs-example-modal-sm").on("hidden.bs.modal", function() { $(this).removeData("bs.modal"); });
    });
  //国家下拉改变，级联的省，市，区都要发生改变
    function onchangeCountrySelected(value){
  	  initProivnceSelectOpt('qproivnceSelectId','',value);
  	  onchangeProivnceSelected();
  	  onchangeCitySelected();
  	  $('#qproivnceSelectId').select2({minimumResultsForSearch:-1});
    }
    //省下拉改变，级联城市发生改变
    function onchangeProivnceSelected(value){
  	  initCitySelectOpt('qcitySelectId','',value);
  	  onchangeCitySelected();
  	  $('#qcitySelectId').select2({minimumResultsForSearch:-1});
    }
    //城市下拉改变，级联区下拉改变
    function onchangeCitySelected(value){
  	  initDistrictSelectOpt('qdistrictSelectId','',value);
  	  $('#qdistrictSelectId').select2({minimumResultsForSearch:-1});
    }
    
  //删除组织
   function deleteOrgan(sid){
   	alertDialog('真的要删除该条记录吗？',function(){
   		var url = "${ctx}/organization/delete/"+sid;
   		ajaxPostURL(url,null,function(response){
   			alertSuccessMessage(response.msg);
   			refreshDiv("listDiv");
   		})
   	});
   }
</script>
</body>
</html>