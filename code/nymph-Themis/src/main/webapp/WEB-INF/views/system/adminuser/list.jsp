<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>

<table class="layui-table">
	<thead>
		<tr>
			<th>
				<div class="layui-unselect header layui-form-checkbox"
					lay-skin="primary">
					<i class="layui-icon">&#xe605;</i>
				</div>
			</th>
			<th>ID</th>
			<th>账户名</th>
			<th>姓名</th>
			<th>手机</th>
			<th>邮箱</th>
			<th>最后登录时间</th>
			<th>创建时间</th>
			<th>是否启用</th>
			<th>创建者</th>
			<th>账户类型</th>
			<th>备注</th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${list.list}" var="item">
			<tr>
				<td>
					<div class="layui-unselect layui-form-checkbox" lay-skin="primary"
						data-id='2'>
						<i class="layui-icon">&#xe605;</i>
					</div>
				</td>
				<td>${item.sid }</td>
				<td>${item.userName}</td>
				<td>${item.userEmail}</td>
				<td>${item.lastLoginTime}</td>
				<td>${item.createdDt}</td>
				<td class="td-status"><span class="layui-btn layui-btn-normal layui-btn-mini">${item.enabled }</span></td>
				<td>${item.createdBy}</td>
				<td>${item.userType}</td>
				<td>${item.remarks}</td>
				
				<td class="td-manage"><a onclick="member_stop(this,'10001')"
					href="javascript:;" title="启用"> <i class="layui-icon">&#xe601;</i>
					</a> <a title="编辑"
						onclick="x_admin_show('编辑','member-edit.html',600,400)"
						href="javascript:;"> <i class="layui-icon">&#xe642;</i>
					</a> <a onclick="x_admin_show('修改密码','member-password.html',600,400)"
						title="修改密码" href="javascript:;"> <i class="layui-icon">&#xe631;</i>
					</a> <a title="删除" onclick="member_del(this,'要删除的id')"
						href="javascript:;"> <i class="layui-icon">&#xe640;</i>
					</a>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<div id="pageDiv"></div>

<script>
	layui.use('laypage', function() {
		initPage('/adminUser/list','searchForm','listDiv',${list},'pageDiv');
	});
	
	/*用户-停用*/
	function member_stop(obj, id) {
		layer.confirm('确认要停用吗？', function(index) {

			if ($(obj).attr('title') == '启用') {

				//发异步把用户状态进行更改
				$(obj).attr('title', '停用')
				$(obj).find('i').html('&#xe62f;');

				$(obj).parents("tr").find(".td-status").find('span').addClass(
						'layui-btn-disabled').html('已停用');
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

	/*用户-删除*/
	function member_del(obj, id) {
		layer.confirm('确认要删除吗？', function(index) {
			//发异步删除数据
			$(obj).parents("tr").remove();
			layer.msg('已删除!', {
				icon : 1,
				time : 1000
			});
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
