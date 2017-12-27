<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.system.entity.SystemDictionary"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

	<form modelAttribute="systemDictionary" id="inputForm" class="form-horizontal form-bordered" action="${ctx}/systemDictionary/${action}" method="post">
				<input type="hidden" id="sid" name="sid" value="${systemDictionary.sid}"/>
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-btns">
					<a href="#" class="panel-close tooltips" data-dismiss="modal" type="button"
						title="Close Panel"><i class="fa fa-times"></i></a>
				</div>
				<!-- panel-btns -->
				<h4 class="panel-title"><i class="fa fa-pencil"></i> 编辑数据字典信息</h4>
				<p>红色的'*'表示必填项</p>
			</div>
			<div class="panel-body nopadding">
			
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=SystemDictionary.ALIAS_DICT_CATEGROY%><span class="asterisk">*</span></label>
							<div class="col-sm-4">
											<input type="text" name="dictCategroy" id="dictCategroy" class="form-control" placeholder="请输入<%=SystemDictionary.ALIAS_DICT_CATEGROY%>..."  value="${systemDictionary.dictCategroy}" maxlength="64" required/>
							</div>
						</div>
						<!-- form-group--> 
						
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=SystemDictionary.ALIAS_DICT_KEY%></label>
							<div class="col-sm-4">
											<input type="text" name="dictKey" id="dictKey" class="form-control" placeholder="请输入<%=SystemDictionary.ALIAS_DICT_KEY%>..."  value="${systemDictionary.dictKey}" maxlength="200" />
							</div>
						</div>
						<!--   form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=SystemDictionary.ALIAS_DICT_VALUE%></label>
							<div class="col-sm-4">
											<input type="text" name="dictValue" id="dictValue" class="form-control" placeholder="请输入<%=SystemDictionary.ALIAS_DICT_VALUE%>..."  value="${systemDictionary.dictValue}" maxlength="200" />
							</div>
						</div>
						<!-- form-group 
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=SystemDictionary.ALIAS_DICT_KEY2%></label>
							<div class="col-sm-4">
											<input type="text" name="dictKey2" id="dictKey2" class="form-control" placeholder="请输入<%=SystemDictionary.ALIAS_DICT_KEY2%>..."  value="${systemDictionary.dictKey2}" maxlength="200" />
							</div>
						</div>
						<!-- form-group
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=SystemDictionary.ALIAS_DICT_VALUE2%></label>
							<div class="col-sm-4">
											<input type="text" name="dictValue2" id="dictValue2" class="form-control" placeholder="请输入<%=SystemDictionary.ALIAS_DICT_VALUE2%>..."  value="${systemDictionary.dictValue2}" maxlength="200" />
							</div>
						</div>
						<!-- form-group
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=SystemDictionary.ALIAS_DICT_KEY3%></label>
							<div class="col-sm-4">
											<input type="text" name="dictKey3" id="dictKey3" class="form-control" placeholder="请输入<%=SystemDictionary.ALIAS_DICT_KEY3%>..."  value="${systemDictionary.dictKey3}" maxlength="200" />
							</div>
						</div>
						<!-- form-group 
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=SystemDictionary.ALIAS_DICT_VALUE3%></label>
							<div class="col-sm-4">
											<input type="text" name="dictValue3" id="dictValue3" class="form-control" placeholder="请输入<%=SystemDictionary.ALIAS_DICT_VALUE3%>..."  value="${systemDictionary.dictValue3}" maxlength="200" />
							</div>
						</div>
						<!-- form-group 
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=SystemDictionary.ALIAS_DICT_KEY4%></label>
							<div class="col-sm-4">
											<input type="text" name="dictKey4" id="dictKey4" class="form-control" placeholder="请输入<%=SystemDictionary.ALIAS_DICT_KEY4%>..."  value="${systemDictionary.dictKey4}" maxlength="200" />
							</div>
						</div>
						<!-- form-group
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=SystemDictionary.ALIAS_DICT_VALUE4%></label>
							<div class="col-sm-4">
											<input type="text" name="dictValue4" id="dictValue4" class="form-control" placeholder="请输入<%=SystemDictionary.ALIAS_DICT_VALUE4%>..."  value="${systemDictionary.dictValue4}" maxlength="200" />
							</div>
						</div>
						<!-- form-group
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=SystemDictionary.ALIAS_VALUE1%></label>
							<div class="col-sm-4">
											<input type="text" name="value1" id="value1" class="form-control" placeholder="请输入<%=SystemDictionary.ALIAS_VALUE1%>..."  value="${systemDictionary.value1}" maxlength="200" />
							</div>
						</div>
						<!-- form-group 
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=SystemDictionary.ALIAS_VALUE2%></label>
							<div class="col-sm-4">
											<input type="text" name="value2" id="value2" class="form-control" placeholder="请输入<%=SystemDictionary.ALIAS_VALUE2%>..."  value="${systemDictionary.value2}" maxlength="200" />
							</div>
						</div>
						<!-- form-group
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=SystemDictionary.ALIAS_VALUE3%></label>
							<div class="col-sm-4">
											<input type="text" name="value3" id="value3" class="form-control" placeholder="请输入<%=SystemDictionary.ALIAS_VALUE3%>..."  value="${systemDictionary.value3}" maxlength="200" />
							</div>
						</div>
						<!-- form-group
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=SystemDictionary.ALIAS_VALUE4%></label>
							<div class="col-sm-4">
											<input type="text" name="value4" id="value4" class="form-control" placeholder="请输入<%=SystemDictionary.ALIAS_VALUE4%>..."  value="${systemDictionary.value4}" maxlength="200" />
							</div>
						</div>
						<!-- form-group
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=SystemDictionary.ALIAS_ORDER_RANK%></label>
							<div class="col-sm-4">
											<input type="text" name="orderRank" id="orderRank" class="form-control" placeholder="请输入<%=SystemDictionary.ALIAS_ORDER_RANK%>..."  value="${systemDictionary.orderRank}" maxlength="10" />
							</div>
						</div>	
						 -->		
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
  });
</script>