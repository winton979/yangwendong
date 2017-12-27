<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<html>
<head>
<meta charset="utf-8">
</head>
<body>
	<div class="contentpanel">
		<div class="row">
			<div class="col-sm-3 col-md-3 col-lg-2">
				<a href="#" class="btn btn-success btn-block btn-create-msg">创建通知</a>
				<br />
				<ul class="nav nav-pills nav-stacked nav-msg">
					<li class="active"><a href="messages.html"> <span
							class="badge pull-right">2</span> <i
							class="glyphicon glyphicon-inbox"></i> 我的信箱
					</a></li>
					<li><a href="#"><i class="glyphicon glyphicon-star"></i>收件箱
					</a></li>
					<li><a href="#"><i class="glyphicon glyphicon-send"></i>已回复</a></li>
					<li><a href="#"> <span class="badge pull-right">3</span> <i
							class="glyphicon glyphicon-pencil"></i>草稿箱
					</a></li>
					<li><a href="#"><i class="glyphicon glyphicon-trash"></i>
							垃圾桶</a></li>
				</ul>

				<br />
				<h5 class="sm-title">Tags</h5>
				<ul class="nav nav-pills nav-stacked nav-msg">
					<li><a href="email.html"> <i class="fa fa-tag"></i> 家长
					</a></li>
					<li><a href="#"><i class="fa fa-tag"></i> 学生</a></li>
					<li><a href="#"><i class="fa fa-tag"></i> 老师</a></li>
				</ul>
			</div>

			<div class="col-sm-9 col-md-9 col-lg-10" id="contentMsgDiv">
				
			</div>
		</div>
	</div>
	<!-- contentpanel -->
	<script type="text/javascript">
		jQuery(document).ready(function() {
			 query();
		});
		
		function query(){
			var url = "${ctx}/message/list";
			ajaxGet(url,'contentMsgDiv');
		}
	</script>
</body>
</html>