<%@ page contentType="text/html;charset=UTF-8"%>

<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<div class="contentpanel">
<div class="panel panel-default">
	<div class="panel-heading">
		<div class="pull-right">
       	 	<div class="btn-list">
        			<a href="javascript:void(0);" onclick="javascript:submitForm();" class="btn btn-primary">保存</a>       			
             		<a href="javascript:history.go(-1);" class="btn btn-default">返回</a>
             </div>
        </div>
		<!-- panel-btns -->
		<h4 class="panel-title"><i class="fa fa-pencil"></i>FA推送消息</h4>
		<p>FA推送消息</p>
	</div>
	<div class="panel-body nopadding">
	<form  id="inputForm" class="form-horizontal form-bordered" action="${ctx}/coustomer/pushInfo" method="post">
				<input type="hidden" id="sid" name="sid" value="${userInfo.sid}"/>
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-btns">
					<a href="#" class="panel-close tooltips" data-dismiss="modal" type="button"
						title="Close Panel"><i class="fa fa-times"></i></a>
				</div>
				<!-- panel-btns -->
				<h4 class="panel-title"><i class="fa fa-pencil"></i> 编辑信息</h4>
				<p>红色的'*'表示必填项</p>
			</div>
			<div class="panel-body nopadding">
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label">用户名称<span class="asterisk">*</span></label>
							<div class="col-sm-4">
											<input type="text" name="username" id="username" class="form-control"   value="${userInfo.name}" maxlength="255" readOnly="true"/>
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label">用户电话</label>
							<div class="col-sm-4">
											<input type="text" name="tel" id="tel" class="form-control"   value="${userInfo.tel}" maxlength="255" readOnly="true"/>
							</div>
						</div>
							<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label">接收FA</label>
							<div class="col-sm-4">
									<input type="text" id="selectUserSid" class="width100p" name="faSid" value=""/>
							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label">推送附属消息说明 <span class="asterisk">*</span></label>
							<div class="col-sm-4">
								<textarea rows="10" name="smsRemarks" class="form-control" placeholder="请输入 客户附属信息" maxlength="500" required></textarea>
							</div>
						</div>
				
			</div>
			<!-- panel-body -->
			<div class="panel-footer">
				<div class="row">
					<div class="col-sm-9 col-sm-offset-3">
						<button class="btn btn-primary mr5">提交</button>
						<button type="reset" class="btn btn-dark">重置</button>
					</div>
				</div>
			</div>
			<!-- panel-footer -->
		</div>
		<!-- panel -->
	</form>
<!--modal-body-->
<script type="text/javascript">
$(document).ready(function(){
	  //为inputForm注册validate函数
	  $("#inputForm").validate({
			submitHandler: function(form){
              globalSubmitHandler(form,function(json){
              	$('.bs-organization-edit-modal').modal("hide"); 
					refreshDiv("listDiv");
              });
			}
		});
	  initRemoteDataSelect2('selectUserSid',"请选择FA","${ctx}/userInfo/select2List.json");
});
</script>