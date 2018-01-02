<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!doctype html>
<html lang="en">

<head>
<%@ include file="/WEB-INF/common/resource.jsp"%>
</head>

<body>
	<div class="x-nav">
		<span class="layui-breadcrumb"> <a href="">首页</a> <a href="">演示</a> <a> <cite>导航元素</cite></a>
		</span> <a class="layui-btn layui-btn-small" style="line-height: 1.6em; margin-top: 3px; float: right" href="javascript:location.replace(location.href);" title="刷新"> <i class="layui-icon" style="line-height: 30px">ဂ</i></a>
	</div>
	<div class="x-body">
		<!-- form begin -->
		<div class="layui-row">
			<form id="searchForm" class="layui-form x-so layui-col-xs8">
				<input class="layui-input layui-hide" value="10" name="pageSize" id="pageSize"> <input class="layui-hide layui-input" value="1" name="pageNum" id="pageNumber"> <input type="text" name="USER_NAME" placeholder="请输入用户名" autocomplete="off" class="layui-input">
			</form>
			<button class="layui-btn layui-btn-normal">
				<a href="javascript:location.replace(location.href);">重置</a>
			</button>
			<button class="layui-btn " onclick="initList()">查询</button>
		</div>
		<!-- form end -->
		<xblock>
		<button class="layui-btn" onclick="ajaxForm('/adminUser/add','','/adminUser/save','addForm','添加用户','800px','700px')">
			<i class="layui-icon"></i>添加
		</button>
		<div id="listDiv"></div>
		</xblock>

	</div>

	<script>
		$(function() {
			initList();
			initDate("start");
			initDate("end");
		})
		
		function initList() {
			formSubmit('/adminUser/list?pageSize=10&pageNum=1', 'searchForm',
					'listDiv');
		}

		/*用户-停用*/
		function member_stop(obj, id) {
			layer.confirm('确认要停用吗？', function(index) {

				if ($(obj).attr('title') == '启用') {

					//发异步把用户状态进行更改
					$(obj).attr('title', '停用')
					$(obj).find('i').html('&#xe62f;');

					$(obj).parents("tr").find(".td-status").find('span')
							.addClass('layui-btn-disabled').html('已停用');
					layer.msg('已停用!', {
						icon : 5,
						time : 1000
					});

				} else {
					$(obj).attr('title', '启用')
					$(obj).find('i').html('&#xe601;');

					$(obj).parents("tr").find(".td-status").find('span')
							.removeClass('layui-btn-disabled').html('已启用');
					layer.msg('已启用!', {
						icon : 5,
						time : 1000
					});
				}

			});
		}

		function delAll(argument) {
			var data = tableCheck.getData();
			layer.confirm('确认要删除吗？' + data, function(index) {
				//捉到所有被选中的，发异步进行删除
				layer.msg('删除成功', {
					icon : 1
				});
				$(".layui-form-checked").not('.header').parents('tr').remove();
			});
		}
	</script>
</body>

</html>