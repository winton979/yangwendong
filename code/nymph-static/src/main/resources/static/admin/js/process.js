function initpage(m) {
	layui.use('laypage', function() {
		var laypage = layui.laypage;
		laypage.render({
			elem : 'pageDiv',
			count : m.total // 数据总数，从服务端得到
			,
			layout : [ 'limit', 'prev', 'page', 'next' ],
			jump : function(obj, first) {
				// obj包含了当前分页的所有参数，比如：
				$("#pageNumber").val(obj.curr); // 得到当前页，以便向服务端请求对应页的数据。
				$("#pageSize").val(obj.limit); // 得到每页显示的条数
				

				// 首次不执行
				if (!first) {
					$("#pageNumber").val(obj.curr+1); // 得到当前页，以便向服务端请求对应页的数据。
					$("#searchForm").click();	
				}
			}
		});
	});
}
function formSubmit(url, formId, target) {
	$.get(url,$("#"+formId).serialize(), function(data) {
		$("#" + target).html(data);
	});
}

function initDate(target) {
	layui.use('laydate', function() {
		var laydate = layui.laydate;
		
		//执行一个laydate实例
		laydate.render({
			elem : '#'+target //指定元素
		});
	});
}

