<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.system.entity.AdvertInfo"%>
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
							<label class="col-sm-3 control-label"><%=AdvertInfo.ALIAS_ORG_CODE%></label>
							<div class="col-sm-4">
<c:out value='${advertInfo.orgCode}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=AdvertInfo.ALIAS_ADVERT_TITLE%></label>
							<div class="col-sm-4">
<c:out value='${advertInfo.advertTitle}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=AdvertInfo.ALIAS_ADVERT_POSITION%></label>
							<div class="col-sm-4">
<c:out value='${advertInfo.advertPosition}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=AdvertInfo.ALIAS_ADVERT_ORDER%></label>
							<div class="col-sm-4">
<c:out value='${advertInfo.advertOrder}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=AdvertInfo.ALIAS_ADVERT_SIZE%></label>
							<div class="col-sm-4">
<c:out value='${advertInfo.advertSize}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=AdvertInfo.ALIAS_ADVERT_IMG%></label>
							<div class="col-sm-4">
<c:out value='${advertInfo.advertImg}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=AdvertInfo.ALIAS_ADVERT_LINK%></label>
							<div class="col-sm-4">
<c:out value='${advertInfo.advertLink}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=AdvertInfo.ALIAS_LINK_TYPE%></label>
							<div class="col-sm-4">
<c:out value='${advertInfo.linkType}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=AdvertInfo.ALIAS_ADVERT_STATUS%></label>
							<div class="col-sm-4">
<c:out value='${advertInfo.advertStatus}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=AdvertInfo.ALIAS_LINK_BUSINESS_CODE%></label>
							<div class="col-sm-4">
<c:out value='${advertInfo.linkBusinessCode}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=AdvertInfo.ALIAS_CREATED_BY%></label>
							<div class="col-sm-4">
<c:out value='${advertInfo.createdBy}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=AdvertInfo.ALIAS_CREATED_DT%></label>
							<div class="col-sm-4">
<c:out value='${advertInfo.createdDtString}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=AdvertInfo.ALIAS_VESION%></label>
							<div class="col-sm-4">
<c:out value='${advertInfo.vesion}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=AdvertInfo.ALIAS_UPDATED_BY%></label>
							<div class="col-sm-4">
<c:out value='${advertInfo.updatedBy}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=AdvertInfo.ALIAS_UPDATED_DT%></label>
							<div class="col-sm-4">
<c:out value='${advertInfo.updatedDtString}'/>							</div>
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