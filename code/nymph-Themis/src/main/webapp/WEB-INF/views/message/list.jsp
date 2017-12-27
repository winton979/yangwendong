<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<div class="msg-header">
	<div class="pull-right">
		Showing 1 - 10 of 100 messages
		<button class="btn btn-white btn-navi btn-navi-left ml5" type="button">
			<i class="fa fa-chevron-left"></i>
		</button>
		<button class="btn btn-white btn-navi btn-navi-right" type="button">
			<i class="fa fa-chevron-right"></i>
		</button>

	</div>
	<div class="pull-left">
		<button class="btn btn-white tooltips" type="button"
			data-toggle="tooltip" title="删除">
			<i class="fa fa-trash-o"></i>
		</button>
		<div class="btn-group">
			<button data-toggle="dropdown"
				class="btn btn-white dropdown-toggle tooltips" type="button"
				title="标签">
				<i class="fa fa-tag"></i>
			</button>
			<ul class="dropdown-menu pull-right">
				<li><a href="#"><i class="fa fa-tag mr5"></i> 通知</a></li>
				<li><a href="#"><i class="fa fa-tag mr5"></i> 公告</a></li>
				<li><a href="#"><i class="fa fa-tag mr5"></i> 问题反馈</a></li>
			</ul>
		</div>

	</div>
	<!-- pull-right -->
</div>
<!-- msg-header -->
<ul class="media-list msg-list">
	<li class="media unread">
		<div class="ckbox ckbox-primary pull-left">
			<input type="checkbox" id="checkbox1"> <label for="checkbox1"></label>
		</div> <a class="pull-left" href="#"> <img
			class="media-object img-circle img-online"
			src="${ctx}/static/images/photos/user1.png" alt="...">
	</a>
		<div class="media-body">
			<div class="pull-right media-option">
				<i class="fa fa-comments mr5"></i> <small>2014-10-21 5:51</small>
				<div class="btn-group">
					<a class="btn btn-default dropdown-toggle" data-toggle="dropdown">
						<i class="fa fa-cog"></i>
					</a>
					<ul class="dropdown-menu pull-right" role="menu">
						<li><a href="ajax/view_message.html" data-toggle="modal"
							data-target=".bs-example-modal-panel">回复</a></li>
						<li><a href="#">删除</a></li>
						<li class="divider"></li>
						<li><a href="#">查看发件人信息</a></li>
					</ul>
				</div>
			</div>
			<h4 class="sender">李小萌</h4>
			<p>
				<a href="ajax/view_message.html" data-toggle="modal"
					data-target=".bs-example-modal-panel"><strong
					class="subjec msg-font-color">[小孩]</strong> 在吃了早餐一直拉肚子软然后.......</a>
			</p>
		</div>
	</li>
	<li class="media">
		<div class="ckbox ckbox-primary pull-left">
			<input type="checkbox" id="checkbox2"> <label for="checkbox2"></label>
		</div> <a class="pull-left" href="#"> <img
			class="media-object img-circle img-offline"
			src="${ctx}/static/images/photos/user2.png" alt="...">
	</a>
		<div class="media-body">
			<div class="pull-right media-option">
				<i class="fa fa-comments mr5"></i> <small>2014-10-21 5:51</small>
				<div class="btn-group">
					<a class="btn btn-default dropdown-toggle" data-toggle="dropdown">
						<i class="fa fa-cog"></i>
					</a>
					<ul class="dropdown-menu pull-right" role="menu">
						<li><a href="ajax/view_message.html" data-toggle="modal"
							data-target=".bs-example-modal-panel">回复</a></li>
						<li><a href="#">删除</a></li>
						<li class="divider"></li>
						<li><a href="#">查看发件人信息</a></li>
					</ul>
				</div>
			</div>
			<h4 class="sender">冰火王</h4>
			<p>
				<a href="ajax/view_message.html" data-toggle="modal"
					data-target=".bs-example-modal-panel"><strong class="subject">[老师]</strong>
					教师的空调一直有问题没有师傅来处理...</a>
			</p>
		</div>
	</li>
	<li class="media">
		<div class="ckbox ckbox-primary pull-left">
			<input type="checkbox" id="checkbox2"> <label for="checkbox2"></label>
		</div> <a class="pull-left" href="#"> <img
			class="media-object img-circle img-offline"
			src="${ctx}/static/images/photos/user2.png" alt="...">
	</a>
		<div class="media-body">
			<div class="pull-right media-option">
				<i class="fa fa-comments mr5"></i> <small>2014-10-21 5:51</small>
				<div class="btn-group">
					<a class="btn btn-default dropdown-toggle" data-toggle="dropdown">
						<i class="fa fa-cog"></i>
					</a>
					<ul class="dropdown-menu pull-right" role="menu">
						<li><a href="ajax/view_message.html" data-toggle="modal"
							data-target=".bs-example-modal-panel">回复</a></li>
						<li><a href="#">删除</a></li>
						<li class="divider"></li>
						<li><a href="#">查看发件人信息</a></li>
					</ul>
				</div>
			</div>
			<h4 class="sender">冰火王</h4>
			<p>
				<a href=""><strong class="subject">[老师]</strong>
					教师的空调一直有问题没有师傅来处理...</a>
			</p>
		</div>
	</li>
	<li class="media">
		<div class="ckbox ckbox-primary pull-left">
			<input type="checkbox" id="checkbox2"> <label for="checkbox2"></label>
		</div> <a class="pull-left" href="#"> <img
			class="media-object img-circle img-offline"
			src="${ctx}/static/images/photos/user2.png" alt="...">
	</a>
		<div class="media-body">
			<div class="pull-right media-option">
				<i class="fa fa-comments mr5"></i> <small>2014-10-21 5:51</small>
				<div class="btn-group">
					<a class="btn btn-default dropdown-toggle" data-toggle="dropdown">
						<i class="fa fa-cog"></i>
					</a>
					<ul class="dropdown-menu pull-right" role="menu">
						<li><a href="ajax/view_message.html" data-toggle="modal"
							data-target=".bs-example-modal-panel">回复</a></li>
						<li><a href="#">删除</a></li>
						<li class="divider"></li>
						<li><a href="#">查看发件人信息</a></li>
					</ul>
				</div>
			</div>
			<h4 class="sender">冰火王</h4>
			<p>
				<a href=""><strong class="subject">[老师]</strong>
					教师的空调一直有问题没有师傅来处理...</a>
			</p>
		</div>
	</li>
	<li class="media">
		<div class="ckbox ckbox-primary pull-left">
			<input type="checkbox" id="checkbox2"> <label for="checkbox2"></label>
		</div> <a class="pull-left" href="#"> <img
			class="media-object img-circle img-offline"
			src="${ctx}/static/images/photos/user2.png" alt="...">
	</a>
		<div class="media-body">
			<div class="pull-right media-option">
				<i class="fa fa-comments mr5"></i> <small>2014-10-21 5:51</small>
				<div class="btn-group">
					<a class="btn btn-default dropdown-toggle" data-toggle="dropdown">
						<i class="fa fa-cog"></i>
					</a>
					<ul class="dropdown-menu pull-right" role="menu">
						<li><a href="ajax/view_message.html" data-toggle="modal"
							data-target=".bs-example-modal-panel">回复</a></li>
						<li><a href="#">删除</a></li>
						<li class="divider"></li>
						<li><a href="#">查看发件人信息</a></li>
					</ul>
				</div>
			</div>
			<h4 class="sender">冰火王</h4>
			<p>
				<a href=""><strong class="subject">[老师]</strong>
					教师的空调一直有问题没有师傅来处理...</a>
			</p>
		</div>
	</li>
	<li class="media">
		<div class="ckbox ckbox-primary pull-left">
			<input type="checkbox" id="checkbox2"> <label for="checkbox2"></label>
		</div> <a class="pull-left" href="#"> <img
			class="media-object img-circle img-offline"
			src="${ctx}/static/images/photos/user2.png" alt="...">
	</a>
		<div class="media-body">
			<div class="pull-right media-option">
				<i class="fa fa-comments mr5"></i> <small>2014-10-21 5:51</small>
				<div class="btn-group">
					<a class="btn btn-default dropdown-toggle" data-toggle="dropdown">
						<i class="fa fa-cog"></i>
					</a>
					<ul class="dropdown-menu pull-right" role="menu">
						<li><a href="ajax/view_message.html" data-toggle="modal"
							data-target=".bs-example-modal-panel">回复</a></li>
						<li><a href="#">删除</a></li>
						<li class="divider"></li>
						<li><a href="#">查看发件人信息</a></li>
					</ul>
				</div>
			</div>
			<h4 class="sender">冰火王</h4>
			<p>
				<a href=""><strong class="subject">[老师]</strong>
					教师的空调一直有问题没有师傅来处理...</a>
			</p>
		</div>
	</li>
	<li class="media">
		<div class="ckbox ckbox-primary pull-left">
			<input type="checkbox" id="checkbox2"> <label for="checkbox2"></label>
		</div> <a class="pull-left" href="#"> <img
			class="media-object img-circle img-offline"
			src="${ctx}/static/images/photos/user2.png" alt="...">
	</a>
		<div class="media-body">
			<div class="pull-right media-option">
				<i class="fa fa-comments mr5"></i> <small>2014-10-21 5:51</small>
				<div class="btn-group">
					<a class="btn btn-default dropdown-toggle" data-toggle="dropdown">
						<i class="fa fa-cog"></i>
					</a>
					<ul class="dropdown-menu pull-right" role="menu">
						<li><a href="ajax/view_message.html" data-toggle="modal"
							data-target=".bs-example-modal-panel">回复</a></li>
						<li><a href="#">删除</a></li>
						<li class="divider"></li>
						<li><a href="#">查看发件人信息</a></li>
					</ul>
				</div>
			</div>
			<h4 class="sender">冰火王</h4>
			<p>
				<a href=""><strong class="subject">[老师]</strong>
					教师的空调一直有问题没有师傅来处理...</a>
			</p>
		</div>
	</li>
	<li class="media">
		<div class="ckbox ckbox-primary pull-left">
			<input type="checkbox" id="checkbox2"> <label for="checkbox2"></label>
		</div> <a class="pull-left" href="#"> <img
			class="media-object img-circle img-offline"
			src="${ctx}/static/images/photos/user2.png" alt="...">
	</a>
		<div class="media-body">
			<div class="pull-right media-option">
				<i class="fa fa-comments mr5"></i> <small>2014-10-21 5:51</small>
				<div class="btn-group">
					<a class="btn btn-default dropdown-toggle" data-toggle="dropdown">
						<i class="fa fa-cog"></i>
					</a>
					<ul class="dropdown-menu pull-right" role="menu">
						<li><a href="ajax/view_message.html" data-toggle="modal"
							data-target=".bs-example-modal-panel">回复</a></li>
						<li><a href="#">删除</a></li>
						<li class="divider"></li>
						<li><a href="#">查看发件人信息</a></li>
					</ul>
				</div>
			</div>
			<h4 class="sender">冰火王</h4>
			<p>
				<a href=""><strong class="subject">[老师]</strong>
					教师的空调一直有问题没有师傅来处理...</a>
			</p>
		</div>
	</li>
	<li class="media">
		<div class="ckbox ckbox-primary pull-left">
			<input type="checkbox" id="checkbox2"> <label for="checkbox2"></label>
		</div> <a class="pull-left" href="#"> <img
			class="media-object img-circle img-offline"
			src="${ctx}/static/images/photos/user2.png" alt="...">
	</a>
		<div class="media-body">
			<div class="pull-right media-option">
				<i class="fa fa-comments mr5"></i> <small>2014-10-21 5:51</small>
				<div class="btn-group">
					<a class="btn btn-default dropdown-toggle" data-toggle="dropdown">
						<i class="fa fa-cog"></i>
					</a>
					<ul class="dropdown-menu pull-right" role="menu">
						<li><a href="ajax/view_message.html" data-toggle="modal"
							data-target=".bs-example-modal-panel">回复</a></li>
						<li><a href="#">删除</a></li>
						<li class="divider"></li>
						<li><a href="#">查看发件人信息</a></li>
					</ul>
				</div>
			</div>
			<h4 class="sender">冰火王</h4>
			<p>
				<a href=""><strong class="subject">[老师]</strong>
					教师的空调一直有问题没有师傅来处理...</a>
			</p>
		</div>
	</li>
	<li class="media">
		<div class="ckbox ckbox-primary pull-left">
			<input type="checkbox" id="checkbox2"> <label for="checkbox2"></label>
		</div> <a class="pull-left" href="#"> <img
			class="media-object img-circle img-offline"
			src="${ctx}/static/images/photos/user2.png" alt="...">
	</a>
		<div class="media-body">
			<div class="pull-right media-option">
				<i class="fa fa-comments mr5"></i> <small>2014-10-21 5:51</small>
				<div class="btn-group">
					<a class="btn btn-default dropdown-toggle" data-toggle="dropdown">
						<i class="fa fa-cog"></i>
					</a>
					<ul class="dropdown-menu pull-right" role="menu">
						<li><a href="ajax/view_message.html" data-toggle="modal"
							data-target=".bs-example-modal-panel">回复</a></li>
						<li><a href="#">删除</a></li>
						<li class="divider"></li>
						<li><a href="#">查看发件人信息</a></li>
					</ul>
				</div>
			</div>
			<h4 class="sender">冰火王</h4>
			<p>
				<a href=""><strong class="subject">[老师]</strong>
					教师的空调一直有问题没有师傅来处理...</a>
			</p>
		</div>
	</li>
</ul>

<script type="text/javascript">
	$(document).ready(function() {

		//highlight rows that are already checked
		jQuery('.msg-list .ckbox input').each(function() {
			if (jQuery(this).is(':checked')) {
				jQuery(this).parents('li').addClass('highlighted');
			}
		});

		// highlight/unhighlight rows when checked/unchecked
		jQuery('.ckbox input').click(function() {
			if (jQuery(this).is(':checked')) {
				jQuery(this).parents('li').addClass('highlighted');
			} else {
				jQuery(this).parents('li').removeClass('highlighted');
			}
		});
	});
</script>