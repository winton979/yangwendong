<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<html>
    <head>
        <meta charset="utf-8">
    </head>
    <body>
<div class="contentpanel">
	<div class="row">
		<div class="col-md-12" id="todoLoansDiv">
			
		</div>
	</div>
	<div class="row" style="display: none;">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">
	       			<h4 class="panel-title">近半年放款统计报表</h4>
	       			<p>显示近半年放款情况</p>
				</div>
				<div class="panel-body" style="height:320px;">
				  <div class="row">
				  		<div class="col-md-6">
				  			<div id="line-chart" class="height300"></div>
				  		</div>
				  		<div class="col-md-6" style="height:300px;overflow:auto">
				  			<table class="table table-bordered">
		                        <thead>
		                          <tr>
		                          	<th style="width:60px;">序号</th>
		                            <th>统计时间</th>
		                            <th>月放款量</th>
									<th>月放款金额</th>
									<th>初审通过数</th>
									<th>贷款上报数</th>
									<th>放款批复数</th>
									<th>初审通过率</th>
		                          </tr>
		                        </thead>
		                      </table>
				  		</div>
				  </div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- mainpanel -->

<script src="${ctx}/static/js/flot/jquery.flot.min.js"></script>
<script src="${ctx}/static/js/flot/jquery.flot.resize.min.js"></script>
<script src="${ctx}/static/js/flot/jquery.flot.spline.min.js"></script>
<script src="${ctx}/static/js/jquery.sparkline.min.js"></script>
<script src="${ctx}/static/js/morris.min.js"></script>
<script src="${ctx}/static/js/bootstrap-wizard.min.js"></script>
<script src="${ctx}/static/js/select2.min.js"></script>
<script>
 $(document).ready(function(){
 	var url ='${ctx}/portal/nodeLoansOrderList';
 	ajaxGet(url,'todoLoansDiv');
	var m1 = new Morris.Line({
        // ID of the element in which to draw the chart.
        element: 'line-chart',
        // Chart data records -- each entry in this array corresponds to a point on
        // the chart.
        data: [
            { y: '2015-02', a: 75,  b: 65 ,c:55 },
            { y: '2015-03', a: 50,  b: 40 ,c:45 },
            { y: '2015-04', a: 75,  b: 65 ,c:35 },
            { y: '2015-05', a: 100, b: 90 ,c:15 },
            { y: '2015-06', a: 100, b: 90 ,c:15 },
            { y: '2015-07', a: 100, b: 90 ,c:15 }
        ],
        xkey: 'y',
        ykeys: ['a', 'b','c'],
        labels: ['月度放款量', '月放款金额','初审通过率'],
        lineColors: ['#D9534F', '#428BCA'],
        lineWidth: '2px',
        hideHover: 'auto',
	resize: true
    });
 });
</script>
	</body>
</html>