<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>

<table class="layui-table">
	<thead>
		<tr>
			<th>ID</th>
			<th>账户名</th>
			<th>姓名</th>
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
				<td>${item.sid }</td>
				<td>${item.userName}</td>
				<td>${item.nickName}</td>
				<td>${item.userEmail}</td>
				<td>${item.lastLoginTime}</td>
				<td>${item.createdDt}</td>
				<td class="td-status"><span class="layui-btn layui-btn-normal layui-btn-mini">${item.enabled }</span></td>
				<td>${item.createdBy}</td>
				<td>${item.userType}</td>
				<td>${item.remarks}</td>

				<td>
					<a class="layui-btn layui-btn-xs layui-btn-danger" onclick="member_stop(this,'10001')" href="javascript:;" title="启用">停用/启用
					</a>
					<a class="layui-btn layui-btn-xs" onclick="ajaxForm('/adminUser/edit',{'userId':${item.sid}},'/adminUser/save','editForm','编辑','800px','800px')"><i class="layui-icon">&#xe642;</i>
					</a>
					<a class="layui-btn layui-btn-xs" onclick="deleteAjax(this,{'userId':${item.sid}},'/adminUser/del')" href="javascript:;"><i class="layui-icon">&#xe640;</i>
					</a>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<div id="pageDiv"></div>

<script>
	layui.use('laypage', function() {
		initPage('/adminUser/list', 'searchForm', 'listDiv', ${list}, 'pageDiv');
	});

</script>