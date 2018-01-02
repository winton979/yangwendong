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

function initPage(url,formId,listDiv,data,pageId) {
	var laypage = layui.laypage;
	laypage.render({
		elem : 'pageDiv',
		count : data.total // 数据总数，从服务端得到
		,
		limit : data.pageSize,
		curr:data.pageNum,
		layout : [ 'limit', 'prev', 'page', 'next' ],
		jump : function(obj, first) {
			// obj包含了当前分页的所有参数，比如：
			$("#pageNumber").val(obj.curr); // 得到当前页，以便向服务端请求对应页的数据。
			$("#pageSize").val(obj.limit); // 得到每页显示的条数

			// 首次不执行
			if (!first) {
				formSubmit(url,formId,listDiv);
			}
		}
	});
}

function ajaxForm(formUrl,data,saveUrl,formId,title,w,h) {
	$.get(formUrl, data, function(r) {
		var index = layer.open({
			title : title,
			content : r,
			area : [ w, h ],
			btn : [ '保存' ],
			yes : function(index, layero) {
				$.post(saveUrl, $("#"+formId).serialize(),function(result) {
					alert(result.msg)
					if (result.code == 1) {
						layer.close(index);
						location.replace(location.href);
					} else {
						return false;
					}
				});
			}
		});
	}
)}


function deleteAjax(obj, data, url) {
	layer.confirm('确认要删除吗？', function(index) {
		$.post(url,data,function(r) {
			if (r.code == 1) {
				$(obj).parents("tr").remove();
				layer.msg('已删除!', {
					icon : 1,
					time : 1000
				});
			} else {
				layer.msg(r.msg);
			}
		})
	});
}

