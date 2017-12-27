<%@page language="java" pageEncoding="UTF-8"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />



	<a class="pull-left profile-thumb" href="#"> 
 <img class="img-circle" src="" alt="">
		<img class="img-circle" src="${ctx}/static/images/photos/profile.png"
		alt="">

	</a>
	<div class="media-body">
		<small class="text-muted">
		</small>
	</div>
</div>
<!-- media -->
<h5 class="leftpanel-title">功能菜单</h5>
<ul class="nav nav-pills nav-stacked">
	<li class="active"><a href="${ctx}/portal"><i
			class="fa fa-home"></i> <span>待办任务</span></a></li>

	<ms:hasAnyPermission
		name="superAdmin,coustomer:index,coustomerIntent:index,loansTrial:index,faOrderEntering:index,orderEntering:index,organization:fa,organization:fa_audit">
		<li class="parent"><a href="#"><i class="fa fa-users"></i> <span>销售管理</span></a>
			<ul class="children">
				<ms:hasAnyPermission name="superAdmin,orderEntering:index">
					<li><a href="${ctx}/loansOrder/orderSubstepIndex">进件提报录入</a></li>
				</ms:hasAnyPermission>
				<ms:hasAnyPermission name="superAdmin,temporaryEntering:index">
					<li><a href="${ctx}/loansOrder/lockerIndex">暂存进件查询</a></li>
				</ms:hasAnyPermission>
				<ms:hasAnyPermission name="superAdmin,faOrderEntering:index">
					<li><a href="${ctx}/loansAssist">进件审批查询</a></li>
				</ms:hasAnyPermission>
				<ms:hasAnyPermission name="superAdmin,loansOrderRetracement:faIndex">
					<li><a href="${ctx}/loansOrderRetracement">进件提回查询</a></li>
				</ms:hasAnyPermission>
				<%--
				<ms:hasAnyPermission name="superAdmin,coustomerIntent:create">
					<li><a href="${ctx}/coustomer/create">新增意向客户</a></li>
				</ms:hasAnyPermission>
				<ms:hasAnyPermission name="superAdmin,coustomerIntent:index">
					<li><a href="${ctx}/coustomerIntent">意向客户信息</a></li>
				</ms:hasAnyPermission> 
				--%>
				<ms:hasAnyPermission name="superAdmin,loansTrial:index">
					<li><a href="${ctx}/loansTrial">进件资料审核</a></li>
				</ms:hasAnyPermission>
				<ms:hasAnyPermission name="superAdmin,loansTrial:lock">
					<li><a href="${ctx}/loansOrderTracking/lockIndex">进件状态查询</a></li>
				</ms:hasAnyPermission>
				<ms:hasAnyPermission name="superAdmin,organization:fa">
					<li><a href="${ctx}/organization/faIndex">车行管理</a></li>
				</ms:hasAnyPermission>
				<ms:hasAnyPermission name="superAdmin,organization:fa_audit">
					<li><a href="${ctx}/organization/faAdIndex">车行报备审核</a></li>
				</ms:hasAnyPermission>
				<ms:hasAnyPermission name="superAdmin,faLoansApprove:fa_index">
					<li><a href="${ctx}/loansAssist?nodeStatusEq=14">付款申请</a></li>
				</ms:hasAnyPermission>
				<ms:hasAnyPermission name="superAdmin,loansTrial:index">
					<li><a href="${ctx}/userInfoBak">客户资料审核</a></li>
				</ms:hasAnyPermission>
				
			</ul>
		</li>
	</ms:hasAnyPermission>
	<ms:hasAnyPermission
		name="superAdmin,loansSign:index,loansReport:index,loansApprove:index,loansMrtgage:index,loansFinish:index,loansContract:index,loansGps:index,loansBill2:index,loansOrder:index,coustomerReport:index">
		<li class="parent"><a href="#"><i class="fa fa-exchange"></i>
				<span>运营管理</span></a>
			<ul class="children">
	<!-- 		<ms:hasAnyPermission name="superAdmin,coustomerReport:index">
					<li><a href="${ctx}/coustomerReport">已上报客户</a></li>
				</ms:hasAnyPermission>
				 -->
				<ms:hasAnyPermission name="superAdmin,loansSign:index">
					<li><a href="${ctx}/loansSign">系统上报</a></li>
				</ms:hasAnyPermission>
				<ms:hasAnyPermission name="superAdmin,loansReport:index">
					<li><a href="${ctx}/loansReport">渠道批复</a></li>
				</ms:hasAnyPermission>
				<ms:hasAnyPermission name="superAdmin,loansContract:index">
					<li><a href="${ctx}/loansContract">上传合同</a></li>
				</ms:hasAnyPermission>
				<ms:hasAnyPermission name="superAdmin,loansGps:index">
					<li><a href="${ctx}/loansGps">GPS安装</a></li>
				</ms:hasAnyPermission>
				<ms:hasAnyPermission name="superAdmin,loansBill:index">
					<li><a href="${ctx}/loansBill">请款第一步</a></li>
				</ms:hasAnyPermission>
				<ms:hasAnyPermission name="superAdmin,loansBillReply:index">
					<li><a href="${ctx}/loansBillReply">请款第一步批复</a></li>
				</ms:hasAnyPermission>
				<%-- <ms:hasAnyPermission name="superAdmin,loansBill2:index">
					<li><a href="${ctx}/loansBill2">请款第二步</a></li>
				</ms:hasAnyPermission>
				<ms:hasAnyPermission name="superAdmin,loansBillReply2:index">
					<li><a href="${ctx}/loansBillReply2">请款第二步批复</a></li>
				</ms:hasAnyPermission>  --%>
				<ms:hasAnyPermission name="superAdmin,loansMrtgage:index">
					<li><a href="${ctx}/loansApprove">请款到账</a></li>
				</ms:hasAnyPermission>
				<ms:hasAnyPermission name="superAdmin,loansMrtgage:index">
					<li><a href="${ctx}/loansMrtgage">付款申请</a></li>
				</ms:hasAnyPermission>
				<ms:hasAnyPermission name="superAdmin,loansMrtgage:index">
					<li><a href="${ctx}/loansFinish">财务放款</a></li>
				</ms:hasAnyPermission>
				<ms:hasAnyPermission name="superAdmin,faOrderEntering:index">
					<li><a href="${ctx}/loansAssist/nodeIndex">订单查询</a></li>
				</ms:hasAnyPermission>
				<%-- <ms:hasAnyPermission name="superAdmin,loansOrderRetracement:index">
					<li><a href="${ctx}/loansOrderRetracement">进件提回审批</a></li>
				</ms:hasAnyPermission> --%>
			<!--	<ms:hasAnyPermission name="superAdmin,loansOrderAdjunct:index">
					<li><a href="${ctx}/loansOrderAdjunct">订单附件下载</a></li>
				</ms:hasAnyPermission>-->
				
			</ul></li>
	</ms:hasAnyPermission>

	<ms:hasAnyPermission
		name="superAdmin,loansLater:index">
		<li class="parent"><a href="#"><i
				class="glyphicon glyphicon-usd"></i> <span>贷后管理</span></a>
			<ul class="children">
		<!--  	<ms:hasAnyPermission name="superAdmin,coustomer:index">
					<li><a href="${ctx}/coustomer">正式客户信息</a></li>
				</ms:hasAnyPermission>
				<ms:hasAnyPermission name="superAdmin,loansOrder:index">
					<li><a href="${ctx}/loansOrder">客户贷款订单</a></li>
				</ms:hasAnyPermission>
				<ms:hasAnyPermission name="superAdmin,userLoans:index">
					<li><a href="${ctx}/userLoans">客户贷款信息</a></li>
				</ms:hasAnyPermission>
				<ms:hasAnyPermission name="superAdmin,userRepayment:index">
					<li><a href="${ctx}/userRepayment">客户还款记录</a></li>
				</ms:hasAnyPermission>-->	
				<ms:hasAnyPermission name="superAdmin,loansMrtgageLater:index">
					<li><a href="${ctx}/loansMrtgageLater/laterIndex?nodeStatusEq=141">放款资料审核</a></li>
				</ms:hasAnyPermission>
				<ms:hasAnyPermission name="superAdmin,loansLater:index">
					<li><a href="${ctx}/loansLater">贷后跟进管理</a></li>
				</ms:hasAnyPermission>
				
				<ms:hasAnyPermission name="superAdmin,loansLater:index">
					<li><a href="${ctx}/loansLater/archiveIndex">贷后归档管理</a></li>
				</ms:hasAnyPermission>
			</ul></li>
	</ms:hasAnyPermission>
	<ms:hasAnyPermission
		name="superAdmin,advertInfo:index,preferentialInfo:index">
		<li class="parent"><a href="#"><i
				class="glyphicon glyphicon-bullhorn"></i> <span>资源管理</span></a>
			<ul class="children">
				<ms:hasAnyPermission name="superAdmin,advertInfo:index">
					<li><a href="${ctx}/advertInfo">广告信息管理</a></li>
				</ms:hasAnyPermission>
				<ms:hasAnyPermission name="superAdmin,preferentialInfo:index">
					<li><a href="${ctx}/preferentialInfo">优惠信息管理</a></li>
				</ms:hasAnyPermission>
			<%-- 	<ms:hasAnyPermission name="superAdmin,advertLogin:index">
					<li><a href="${ctx}/advertLogin">Login信息管理</a></li>
				</ms:hasAnyPermission> --%>
			</ul>
			
		</li>

	</ms:hasAnyPermission> 

	<ms:hasAnyPermission name="superAdmin,carPlan:index,coustomer:index">
		<li class="parent"><a href="#"><i class="fa fa-folder"></i> <span>方案管理</span></a>
			<ul class="children">
				<ms:hasAnyPermission name="superAdmin,carPlan:index">
					<li><a href="${ctx}/carPlan">用户贷款方案</a></li>
				</ms:hasAnyPermission>
				<ms:hasAnyPermission name="superAdmin,loansCanal:index">
					<li><a href="${ctx}/loansCanal">贷款渠道管理</a></li>
				</ms:hasAnyPermission>
				<ms:hasAnyPermission name="superAdmin,loansPlan:index">
					<li><a href="${ctx}/loansPlan">贷款方案库</a></li>
				</ms:hasAnyPermission>
				<ms:hasAnyPermission name="superAdmin,dealerInfo:planIndex">
					<li><a href="${ctx}/dealerInfo/indexPlan">经销商贷款方案配置</a></li>
				</ms:hasAnyPermission>
			</ul></li>
	</ms:hasAnyPermission>
	<ms:hasAnyPermission name="superAdmin,organization:index">
		<li><a href="${ctx}/organization"> <i class="fa fa-truck"></i>
		<span>车行管理</span></a></li>
	</ms:hasAnyPermission>

	<ms:hasAnyPermission name="superAdmin,userInfo:index,userRelOrgan:index">
		<li class="parent"><a href="#"><i
				class="glyphicon glyphicon-user"></i> <span>FA管理</span></a>
			<ul class="children">
				<ms:hasAnyPermission name="superAdmin,userInfo:index,dealerInfo:index,userRelOrgan:index,dealerGoal:index">
					<ms:hasAnyPermission name="superAdmin,dealerInfo:index">
						<li><a href="${ctx}/dealerInfo">FA团队管理</a></li>
					</ms:hasAnyPermission>
					<ms:hasAnyPermission name="superAdmin,dealerInfo:planIndex">
						<li><a href="${ctx}/dealerInfo/aliasManageIndex">FA团队简称管理</a></li>
					</ms:hasAnyPermission>
					<ms:hasAnyPermission name="superAdmin,userInfo:index">
						<li><a href="${ctx}/userInfo">FA人员管理</a></li>
					</ms:hasAnyPermission>
						<ms:hasAnyPermission name="superAdmin,dealerGoal:index">
						<li><a href="${ctx}/dealerGoal">FA人员销售目标管理</a></li>
					</ms:hasAnyPermission>
					
					
					<%-- <ms:hasAnyPermission name="superAdmin,userRelOrgan:index">
						<li><a href="${ctx}/userRelOrgan">FA与4S店关系</a></li>
					</ms:hasAnyPermission> --%>
				</ms:hasAnyPermission>
			</ul></li>
	</ms:hasAnyPermission>

	<ms:hasAnyPermission name="superAdmin,brandInfo:index,carType:index">
		<li class="parent"><a href="#"><i class="fa fa-automobile"></i>
				<span>车型管理</span></a>
			<ul class="children">
				<ms:hasAnyPermission name="superAdmin,brandInfo:index">
					<li><a href="${ctx}/brandInfo"> <span>品牌信息管理</span></a></li>
				</ms:hasAnyPermission>
				<ms:hasAnyPermission name="superAdmin,brandInfo:index">
					<li><a href="${ctx}/brandInfo/indexCar"> <span>车系信息管理</span></a></li>
				</ms:hasAnyPermission>
				<ms:hasAnyPermission name="superAdmin,brandInfo:index">
					<li><a href="${ctx}/brandInfo/indexCarType"> <span>车型信息管理</span></a></li>
				</ms:hasAnyPermission>
				<ms:hasAnyPermission name="superAdmin,carType:index">
					<li><a href="${ctx}/carType"> <span>4S店车型信息管理</span></a></li>
				</ms:hasAnyPermission>
				<ms:hasAnyPermission name="superAdmin,carType:index">
					<li><a href="${ctx}/carType/planIndex"><span>4S店车型贷款方案配置</span></a></li>
				</ms:hasAnyPermission>
			</ul></li>
	</ms:hasAnyPermission>
	<ms:hasAnyPermission name="superAdmin,online:autohome,online:bitauto">
		<li class="parent"><a href="#"><i class="fa fa-cloud"></i> <span>线上数据</span></a>
			<ul class="children">
				<ms:hasAnyPermission name="superAdmin,online:autohome">
					<li><a href="${ctx}/online/autohome/index">汽车之家</a></li>
				</ms:hasAnyPermission>
				<ms:hasAnyPermission name="superAdmin,online:bitauto">
					<li><a href="${ctx}/online/bitauto/index">易鑫数据</a></li>
				</ms:hasAnyPermission>
				
				<ms:hasAnyPermission name="superAdmin,online:chezhu16888">
					<li><a href="${ctx}/online/chezhu16888/index">车主之家</a></li>
				</ms:hasAnyPermission>
				
				<%-- <ms:hasAnyPermission name="superAdmin,parsing:parsingCsv">
					<li><a href="${ctx}/parsing/index">数据对接</a></li>
				</ms:hasAnyPermission> --%>
			</ul></li>
	</ms:hasAnyPermission> 
	<ms:hasAnyPermission
		name="superAdmin,report:status,report:summary,report:sales">
		<li class="parent"><a href="#"><i class="fa fa-list"></i> <span>报表管理</span></a>
			<ul class="children">
				<ms:hasAnyPermission name="superAdmin,report:status">
					<li><a href="${ctx}/report/orderStatusIndex">业务跟进表</a></li>
				</ms:hasAnyPermission>
				<ms:hasAnyPermission name="superAdmin,countorderStatus:dataSummary">
					<li><a href="${ctx}/countorderStatus/dataSummary">数据汇总表</a></li>
				</ms:hasAnyPermission>
				<ms:hasAnyPermission name="superAdmin,report:dayDateTable">
					<li><a href="${ctx}/orderApplyLoanDate/orderApplyLoanDateIndex">销售报表</a></li>
				</ms:hasAnyPermission>
				<%-- <ms:hasAnyPermission name="superAdmin,countorderStatus:index">
					<li><a href="${ctx}/countorderStatus">订单状态快照</a></li>
				</ms:hasAnyPermission> --%>
				<%-- <ms:hasAnyPermission name="superAdmin,report:summary">
					<li><a href="${ctx}/report/orderSummaryIndex">业务汇总表</a></li>
				</ms:hasAnyPermission>
				<ms:hasAnyPermission name="superAdmin,report:sales">
					<li><a href="${ctx}/report/salesReportIndex">销售月统计报表</a></li>
				</ms:hasAnyPermission>

				<ms:hasAnyPermission name="superAdmin,report:dayDateTable">
					<li><a href="${ctx}/orderApplyLoanDate/orderApplyLoanDateIndex">日申请放款表</a></li>
				</ms:hasAnyPermission> --%>
				<%-- <ms:hasAnyPermission name="superAdmin,report:summary">
					<li><a href="${ctx}/report/orderBlocklistIndex">红黑榜</a></li>
				</ms:hasAnyPermission> --%>
			</ul></li>
	</ms:hasAnyPermission> 
	<ms:hasAnyPermission
		name="superAdmin,adminUser:index,adminRole:index,adminPermission:index,terminalDevice:index,systemDictionary:index,operationLog:index,systemConfig:index,fileManager:index,appLoginHistory:index">
		<li class="parent"><a href="#"><i class="fa fa-gear"></i> <span>系统管理</span></a>
			<ul class="children">
				<ms:hasAnyPermission name="superAdmin,adminUser:index">
					<li><a href="${ctx}/adminUser">用户信息管理</a></li>
				</ms:hasAnyPermission>
				<ms:hasAnyPermission name="superAdmin,adminRole:index">
					<li><a href="${ctx}/adminRole">用户角色管理</a></li>
				</ms:hasAnyPermission>
				<ms:hasAnyPermission name="superAdmin,adminPermission:index">
					<li><a href="${ctx}/adminPermission">权限信息管理</a></li>
				</ms:hasAnyPermission>
				<ms:hasAnyPermission name="superAdmin,adminOrg:index">
					<li><a href="${ctx}/adminOrg">机构信息管理</a></li>
				</ms:hasAnyPermission>
				<ms:hasAnyPermission name="superAdmin,systemDictionary:index">
					<li><a href="${ctx}/systemDictionary">数据字典管理</a></li>
				</ms:hasAnyPermission>
				<ms:hasAnyPermission name="superAdmin,operationLog:index">
					<li><a href="${ctx}/operationLog">用户操作日志</a></li>
				</ms:hasAnyPermission>
				<ms:hasAnyPermission name="superAdmin">
					<li><a href="${ctx}/systemConfig">系统参数管理</a></li>
				</ms:hasAnyPermission>
				<ms:hasAnyPermission name="superAdmin">
					<li><a href="${ctx}/fileManager">资源文件管理</a></li>
				</ms:hasAnyPermission>
				<ms:hasAnyPermission name="superAdmin,appLoginHistory:index">
					<li><a href="${ctx}/appLoginHistory">APP登录日志</a></li>
				</ms:hasAnyPermission>
				<ms:hasAnyPermission name="superAdmin">
					<li><a href="${ctx}/appversionInfo">APP版本管理</a></li>
				</ms:hasAnyPermission>
				<%-- <ms:hasAnyPermission name="superAdmin">
					<li><a href="${ctx}/appversionInfo">缓存信息管理</a></li>
				</ms:hasAnyPermission> --%>
			</ul></li>
	</ms:hasAnyPermission>
	
</ul>