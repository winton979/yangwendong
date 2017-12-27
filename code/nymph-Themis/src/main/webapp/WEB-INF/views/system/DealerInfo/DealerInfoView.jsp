<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.cdtsz.chedaitong.system.entity.DealerInfo"%>
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
							<label class="col-sm-3 control-label"><%=DealerInfo.ALIAS_DEALER_CODE%></label>
							<div class="col-sm-4">
<c:out value='${dealerInfo.dealerCode}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=DealerInfo.ALIAS_DEALER_NAME%></label>
							<div class="col-sm-4">
<c:out value='${dealerInfo.dealerName}'/>							</div>
						</div>
						
						<!-- add by yangwendong 2017年3月31日 添加区域字段 -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=DealerInfo.ALIAS_DEALER_AREA_SID%></label>
							<div class="col-sm-4">
								<c:forEach var="systemDictionaryItem" items="${systemDictionarys }" >
									<c:if test="${dealerInfo.dealerAreaSid == systemDictionaryItem.sid}">
										${systemDictionaryItem.dictValue }
									</c:if>
								</c:forEach>
							</div>
						</div>
						
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=DealerInfo.ALIAS_COUNTRY%></label>
							<div class="col-sm-4">
<c:out value='${dealerInfo.country}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=DealerInfo.ALIAS_PROVINCE%></label>
							<div class="col-sm-4">
<c:out value='${dealerInfo.province}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=DealerInfo.ALIAS_CITY%></label>
							<div class="col-sm-4">
<c:out value='${dealerInfo.city}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=DealerInfo.ALIAS_ZONE%></label>
							<div class="col-sm-4">
<c:out value='${dealerInfo.zone}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=DealerInfo.ALIAS_ADDRESS%></label>
							<div class="col-sm-4">
<c:out value='${dealerInfo.address}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=DealerInfo.ALIAS_OPENING_BANK%></label>
							<div class="col-sm-4">
<c:out value='${dealerInfo.openingBank}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=DealerInfo.ALIAS_BANK_ACCOUNT%></label>
							<div class="col-sm-4">
<c:out value='${dealerInfo.bankAccount}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=DealerInfo.ALIAS_ACCOUNT_NAME%></label>
							<div class="col-sm-4">
<c:out value='${dealerInfo.accountName}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=DealerInfo.ALIAS_DEALER_TEL%></label>
							<div class="col-sm-4">
<c:out value='${dealerInfo.dealerTel}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=DealerInfo.ALIAS_BRAND_BUSINESS%></label>
							<div class="col-sm-4">
<c:out value='${dealerInfo.brandBusiness}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=DealerInfo.ALIAS_CONTACT_PERSON%></label>
							<div class="col-sm-4">
<c:out value='${dealerInfo.contactPerson}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=DealerInfo.ALIAS_CONTACT_PHONE%></label>
							<div class="col-sm-4">
<c:out value='${dealerInfo.contactPhone}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=DealerInfo.ALIAS_CONTACT_EMAIL%></label>
							<div class="col-sm-4">
<c:out value='${dealerInfo.contactEmail}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=DealerInfo.ALIAS_CREATED_BY%></label>
							<div class="col-sm-4">
<c:out value='${dealerInfo.createdBy}'/>							</div>
						</div>
						<!-- form-group -->
						<div class="form-group">
							<label class="col-sm-3 control-label"><%=DealerInfo.ALIAS_CREATED_DT%></label>
							<div class="col-sm-4">
<c:out value='${dealerInfo.createdDtString}'/>							</div>
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