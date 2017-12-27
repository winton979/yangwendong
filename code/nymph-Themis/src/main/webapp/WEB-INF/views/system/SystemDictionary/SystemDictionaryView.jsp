<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.system.entity.SystemDictionary"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-btns">
					<a href="#" class="panel-close tooltips" data-dismiss="modal" type="button"
						title="Close Panel"><i class="fa fa-times"></i></a>
				</div>
				<!-- panel-btns -->
				<h4 class="panel-title"><i class="fa fa-pencil"></i>查看信息</h4>
				<p>显示详细的基本信息</p>
			</div>
			<div class="panel-body nopadding">
			
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=SystemDictionary.ALIAS_DICT_CATEGROY%></label>
							<div class="col-sm-4">
<c:out value='${systemDictionary.dictCategroy}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=SystemDictionary.ALIAS_DICT_KEY%></label>
							<div class="col-sm-4">
<c:out value='${systemDictionary.dictKey}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=SystemDictionary.ALIAS_DICT_VALUE%></label>
							<div class="col-sm-4">
<c:out value='${systemDictionary.dictValue}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=SystemDictionary.ALIAS_DICT_KEY2%></label>
							<div class="col-sm-4">
<c:out value='${systemDictionary.dictKey2}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=SystemDictionary.ALIAS_DICT_VALUE2%></label>
							<div class="col-sm-4">
<c:out value='${systemDictionary.dictValue2}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=SystemDictionary.ALIAS_DICT_KEY3%></label>
							<div class="col-sm-4">
<c:out value='${systemDictionary.dictKey3}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=SystemDictionary.ALIAS_DICT_VALUE3%></label>
							<div class="col-sm-4">
<c:out value='${systemDictionary.dictValue3}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=SystemDictionary.ALIAS_DICT_KEY4%></label>
							<div class="col-sm-4">
<c:out value='${systemDictionary.dictKey4}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=SystemDictionary.ALIAS_DICT_VALUE4%></label>
							<div class="col-sm-4">
<c:out value='${systemDictionary.dictValue4}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=SystemDictionary.ALIAS_VALUE1%></label>
							<div class="col-sm-4">
<c:out value='${systemDictionary.value1}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=SystemDictionary.ALIAS_VALUE2%></label>
							<div class="col-sm-4">
<c:out value='${systemDictionary.value2}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=SystemDictionary.ALIAS_VALUE3%></label>
							<div class="col-sm-4">
<c:out value='${systemDictionary.value3}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=SystemDictionary.ALIAS_VALUE4%></label>
							<div class="col-sm-4">
<c:out value='${systemDictionary.value4}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=SystemDictionary.ALIAS_ORDER_RANK%></label>
							<div class="col-sm-4">
<c:out value='${systemDictionary.orderRank}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label">创_建_时_间</label>
							<div class="col-sm-4">
								<f:formatDate value="${systemDictionary.createdDt}" pattern="yyyy-MM-dd HH:mm"/>
							</div>
						</div>
				
			</div>
			<!-- panel-body -->
			<div class="panel-footer">
				<div class="row">
					<div class="col-sm-9 col-sm-offset-3">
					</div>
				</div>
			</div>
			<!-- panel-footer -->
		</div>
		<!-- panel -->