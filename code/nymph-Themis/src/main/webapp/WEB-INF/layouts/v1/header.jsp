<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>

<div class="header-left">
	<a href="${ctx}/portal" class="logo"> 
		<!-- <img src="${ctx}/static/images/logo.png" alt="" /> -->
		<img src="${ctx}/static/images/xiaoma-logo2.png" alt="" />
	</a>
	<div class="pull-right">
		<a href="#" class="menu-collapse"> <i class="fa fa-bars"></i></a>
	</div>
</div>

<!-- header-left -->
<div class="header-right">
	<div class="pull-right">
		<form class="form form-search">
            <input type="search" class="form-control" style="width:350px" placeholder="输入客户姓名、手机号、身份证号、车型">
        </form>
          <div class="btn-group btn-group-option">
			
		
			<a href="${ctx}/systemConfig/helpFile2" data-toggle="modal" data-target="#changePassword"><i class="glyphicon glyphicon-question-sign"></i>帮助文档</a>
		</div>
        
		<div class="btn-group btn-group-list btn-group-notification" >
            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-bell-o"></i>
              <span class="badge" id="msgTotal">0</span>
            </button>
            <div class="dropdown-menu pull-right">
               	<a href="javascript:empty()" class="link-right tooltips" data-toggle="tooltip" title="" data-original-title="清空"><i class="fa fa-trash-o"></i></a> 
               	
                <h5>消息</h5>
                <ul class="media-list dropdown-list" id="msgContent">
                    <li class="media">
                        <div class="media-body">
                        	<strong>无</strong>
                        </div>
                    </li>
                </ul>
                <div class="dropdown-footer text-center">
                    <a href="${ctx}/notice/index"  class="link">查看所有消息</a>
                </div>
                
            </div>
        </div>
        
        <div class="btn-group btn-group-list btn-group-notification" >
            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
             <i class="fa fa-envelope-o"></i>
              <span class="badge" id="Total">0</span>
            </button>
            <div class="dropdown-menu pull-right">
                <!-- <a href="" class="link-right"><i class="fa fa-search"></i></a> -->
                <h5>消息</h5>
                <ul class="media-list dropdown-list" id="Content">
                    <li class="media">
                        <div class="media-body">
                        	<strong>无</strong>
                        </div>
                    </li>
                </ul>
                <div class="dropdown-footer text-center">
                    <a href="${ctx}/loansLater/faIndex"  class="link">查看所有消息</a>
                </div>
            </div>
        </div>
			<div class="btn-group btn-group-list btn-group-notification" >
            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-bell-o"></i>
              <span class="badge" id="msgTotal">0</span>
            </button>
            <div class="dropdown-menu pull-right">
               	<a href="javascript:empty()" class="link-right tooltips" data-toggle="tooltip" title="" data-original-title="清空"><i class="fa fa-trash-o"></i></a> 
               	
                <h5>消息</h5>
                <ul class="media-list dropdown-list" id="msgContent">
                    <li class="media">
                        <div class="media-body">
                        	<strong>无</strong>
                        </div>
                    </li>
                </ul>
                <div class="dropdown-footer text-center">
                    <a href=""  class="link">查看所有消息</a>
                </div>
                
            </div>
            <script>
			</script>
        </div>
				


     
          
		<div class="btn-group btn-group-option">
			<button type="button" class="btn btn-default dropdown-toggle"
				data-toggle="dropdown">
				<i class="fa fa-caret-down"></i>
			</button>
			<ul class="dropdown-menu pull-right" role="menu">
				<li><a href="" data-toggle="modal" data-target="#changePassword"><i class="glyphicon glyphicon-cog"></i>修改密码</a></li>
				<li><a href=""><i class="glyphicon glyphicon-log-out"></i>退出</a></li>
				<li class="divider"></li>
				<li><a href="" data-toggle="modal" data-target="#changePassword"><i class="glyphicon glyphicon-question-sign"></i>帮助</a></li>
			</ul>
		</div>
		
	</div>
	<!-- pull-right -->
	
</div>
