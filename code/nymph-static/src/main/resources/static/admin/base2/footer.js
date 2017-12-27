/**
 * 初始化数据表格，带有显示/隐藏列
 * 
 * @param shTable
 * @returns
 */
function initDataListTable(shTable,order) {
	if(!order){
		order=[[]];
	}
	var options = {
		"fnDrawCallback" : function(oSettings) {
			jQuery('#' + shTable + '_paginate ul').addClass(
					'pagination-active-dark');
		},
		responsive : true,
		"bSort": false,
		"language" : {
			"lengthMenu" : "显示_MENU_ 条数据",
			"zeroRecords" : "对不起，没有找到记录",
			"sInfo" : "显示[_START_]到[_END_]条数据，总共[_TOTAL_]条数据,当前第[_PAGE_/_PAGES_]页",
			"infoEmpty" : "没有相关的记录",
			"infoFiltered" : "(查询结果 从 _MAX_ total 记录)",
			"oPaginate" : {
				"sFirst" : "首页",
				"sLast" : "最后一页",
				"sNext" : "下一页",
				"sPrevious" : "上一页"
			},
			"sLoadingRecords" : "正在加载数据,请稍候...",
			"sProcessing" : "正在加载数据,请稍候...",
			"sSearch" : "检索:",
			"sSearchPlaceholder" : "请输入关键字",
		},
		"paging" : false,
		"pagingType" : "full_numbers",
		"bFilter" : false,
		"bProcessing" : true,
		"sDom" : "rt",
		"scrollX": false
	};
	var dataListTable = jQuery('#' + shTable).DataTable(options);
	return dataListTable;
}

/**
 * @param shTable
 * @param shCol
 */
function initHideOrShowColumns(shTable, shCol) {
	// Show/Hide Columns Dropdown
	jQuery('#' + shCol).click(function(event) {
		event.stopPropagation();
	});

	jQuery('#' + shCol + ' input').on('click', function() {

		// Get the column API object
		var column = shTable.column($(this).val());

		// Toggle the visibility
		if ($(this).is(':checked'))
			column.visible(true);
		else
			column.visible(false);
	});
}

/**
 * 初始化国家下拉表选择项
 * 
 * @param countryId
 *            下拉列表对象
 * @param selectedId
 *            是否选中的值
 */
function initCountrySelectOpt(countryId, selectedId, callback) {
	var $countryId = $('#' + countryId);
	if ($countryId) {
		var url = "/api/v1/common/country.json";
		$("option[value!='']", $countryId).remove();
		ajaxGetJSON(url, function(data) {
			if (data.code == 200) {
				var jsonData = data.data;
				var length = jsonData.length;
				var _optionStr = '';
				for (var i = 0; i < length; i++) {
					if (selectedId && jsonData[i].sid == selectedId) {
						_optionStr += "<option value='" + jsonData[i].sid
								+ "' selected>" + jsonData[i].countryName
								+ "</option>";
					} else {
						_optionStr += "<option value='" + jsonData[i].sid
								+ "'>" + jsonData[i].countryName + "</option>";
					}
				}
				if (_optionStr != '') {
					$countryId.append($(_optionStr));
				}
				if (callback) {
					callback(selectedId);
				}
			}
			$districtId.selectpicker('refresh');
		});
	}
}

/**
 * 初始化省下拉表选择项
 * 
 * @param proivnceId
 *            省下拉选择对象
 * @param selectedId
 *            选中的值
 * @param countryId
 *            所属的国家
 * @param callback
 *            回调
 */
function initProivnceSelectOpt(proivnceId, selectedId, countryId, callback) {
	var $proivnceId = $('#' + proivnceId);
	if ($proivnceId) {
		if (!countryId) {
			countryId = "1";// 默认为1;
		}
		var url = "/api/v1/common/province/" + countryId + ".json";
		$("option[value!='']", $proivnceId).remove();
		ajaxGetJSON(url, function(data) {
			if (data.code == 200) {
				var jsonData = data.data;
				var length = jsonData.length;
				var _optionStr = '';
				for (var i = 0; i < length; i++) {
					if (selectedId && jsonData[i].sid == selectedId) {
						_optionStr += "<option value='" + jsonData[i].sid
								+ "' selected>" + jsonData[i].provinceName
								+ "</option>";
					} else {
						_optionStr += "<option value='" + jsonData[i].sid
								+ "'>" + jsonData[i].provinceName + "</option>";
					}
				}
				if (_optionStr != '') {
					$proivnceId.append($(_optionStr));
				}
				if (callback) {
					callback(selectedId);
				}
			}
			$proivnceId.selectpicker('refresh');
		});
	}
}

/**
 * 初始化下拉城市
 * @param cityId
 * 			城市对象下拉列表
 * @param selectedId
 * 			选中的值
 * @param proivnceId
 * 			所属的省份
 * @param callback
 * 			回调
 */
function initCitySelectOpt(cityId, selectedId, proivnceId, callback) {
	var $cityId = $('#' + cityId);
	if ($cityId) {
		var url = "/api/v1/common/city/" + proivnceId + ".json";
		$("option[value!='']", $cityId).remove();
		if(!proivnceId){
			return;
		}
		ajaxGetJSON(url, function(data) {
			if (data.code == 200) {
				var jsonData = data.data;
				var length = jsonData.length;
				var _optionStr = '';
				for (var i = 0; i < length; i++) {
					if (selectedId && jsonData[i].sid == selectedId) {
						_optionStr += "<option value='" + jsonData[i].sid
						+ "' selected>" + jsonData[i].cityName
						+ "</option>";
					} else {
						_optionStr += "<option value='" + jsonData[i].sid
						+ "'>" + jsonData[i].cityName + "</option>";
					}
				}
				if (_optionStr != '') {
					$cityId.append($(_optionStr));
				}
				if (callback) {
					callback(selectedId);
				}
			}
			$cityId.selectpicker('refresh');
		});
	}
}

/**
 * 初始化下拉区，镇，县
 * @param cityId
 * 			城市对象下拉列表
 * @param selectedId
 * 			选中的值
 * @param proivnceId
 * 			所属的省份
 * @param callback
 * 			回调
 */
function initDistrictSelectOpt(districtId, selectedId, cityId, callback) {
	var $districtId = $('#' + districtId);
	if ($districtId) {
		var url = "/api/v1/common/district/" + cityId + ".json";
		$("option[value!='']", $districtId).remove();
		if(!cityId){
			return;
		}
		ajaxGetJSON(url, function(data) {
			if (data.code == 200) {
				var jsonData = data.data;
				var length = jsonData.length;
				var _optionStr = '';
				for (var i = 0; i < length; i++) {
					if (selectedId && jsonData[i].sid == selectedId) {
						_optionStr += "<option value='" + jsonData[i].sid
						+ "' selected>" + jsonData[i].districtName
						+ "</option>";
					} else {
						_optionStr += "<option value='" + jsonData[i].sid
						+ "'>" + jsonData[i].districtName + "</option>";
					}
				}
				if (_optionStr != '') {
					$districtId.append($(_optionStr));
				}
				if (callback) {
					callback(selectedId);
				}
			}
			$districtId.selectpicker('refresh');
		});
	}
}

/**
 * 初始化品牌下拉表选择项
 * 
 * @param countryId
 *            下拉列表对象
 * @param selectedId
 *            是否选中的值
 */
function initBrandInfoSelectOpt(countryId, selectedId, callback) {
	var $countryId = $('#' + countryId);
	if ($countryId) {
		var url = "/brandInfo/listSelectByJson.json";
		$("option[value!='']", $countryId).remove();
		ajaxGetJSON(url, function(data) {
			if (data.code == 200) {
				var jsonData = data.results;
				var length = jsonData.length;
				var _optionStr = '';
				for (var i = 0; i < length; i++) {
					if (selectedId && jsonData[i].sid == selectedId) {
						_optionStr += "<option value='" + jsonData[i].sid
								+ "' selected>" + jsonData[i].brandName
								+ "</option>";
					} else {
						_optionStr += "<option value='" + jsonData[i].sid
								+ "'>" + jsonData[i].brandName + "</option>";
					}
				}
				if (_optionStr != '') {
					$countryId.append($(_optionStr));
				}
				if (callback) {
					callback(selectedId);
				}
			}
		});
	}
}

/**
 * 初始化车系下拉表选择项
 * 
 * @param countryId
 *            下拉列表对象
 * @param selectedId
 *            是否选中的值
 */
function initBrandInfoTypeSelectOpt(countryId, selectedId,brandFatherId ,callback) {
	var $countryId = $('#' + countryId);
	if ($countryId) {
		var url = "/brandInfo/listSelectByJson.json?brandLevel=1&brandFatherId="+brandFatherId;
		$("option[value!='']", $countryId).remove();
		ajaxGetJSON(url, function(data) {
			if (data.code == 200) {
				var jsonData = data.results;
				var length = jsonData.length;
				var _optionStr = '';
				for (var i = 0; i < length; i++) {
					if (selectedId && jsonData[i].sid == selectedId) {
						_optionStr += "<option value='" + jsonData[i].sid
								+ "' selected>" + jsonData[i].brandName
								+ "</option>";
					} else {
						_optionStr += "<option value='" + jsonData[i].sid
								+ "'>" + jsonData[i].brandName + "</option>";
					}
				}
				if (_optionStr != '') {
					$countryId.append($(_optionStr));
				}
				if (callback) {
					callback(selectedId);
				}
			}
		});
	}
}


/**
 * 初始化车系下拉表选择项
 * 
 * @param countryId
 *            下拉列表对象
 * @param selectedId
 *            是否选中的值
 */
function initBrandInfoCarTypeSelectOpt(countryId, selectedId,brandFatherId ,callback) {
	var $countryId = $('#' + countryId);
	if ($countryId) {
		var url = "/brandInfo/listSelectByJson.json?brandLevel=2&brandFatherId="+brandFatherId;
		$("option[value!='']", $countryId).remove();
		ajaxGetJSON(url, function(data) {
			if (data.code == 200) {
				var jsonData = data.results;
				var length = jsonData.length;
				var _optionStr = '';
				for (var i = 0; i < length; i++) {
					if (selectedId && jsonData[i].sid == selectedId) {
						_optionStr += "<option value='" + jsonData[i].sid
								+ "' selected>" + jsonData[i].brandName
								+ "</option>";
					} else { 
						_optionStr += "<option value='" + jsonData[i].sid
								+ "'>" + jsonData[i].brandName + "</option>";
					}
				}
				if (_optionStr != '') {
					$countryId.append($(_optionStr));
				}
				if (callback) {
					callback(selectedId);
				}
			}
		});
	}
}

/**
 * 车型参考价格获取
 * 
 * @param countryId
 *            下拉列表对象
 * @param selectedId
 *            是否选中的值
 */
function selectCrdPriceOpt(countryId, selectedId) {
	var $countryId = $('#' + countryId);
	if ($countryId) {
		var url = "/carType/listByPriceJson?sid="+selectedId;
		ajaxGetJSON(url, function(data) {
			if (data.code == 200) {
				var jsonData = data.price;
				$countryId.val(jsonData);
			}
		});
	}
}


/**
 * 初始化贷款渠道下拉表选择项
 * 
 * @param countryId
 *            下拉列表对象
 * @param selectedId
 *            是否选中的值
 */
function initLoansCanalSelectOpt(countryId, selectedId, callback) {
	var $countryId = $('#' + countryId);
	if ($countryId) {
		var url = "/loansCanal/listSelectByJson.json";
		$("option[value!='']", $countryId).remove();
		ajaxGetJSON(url, function(data) {
			if (data.code == 200) {
				var jsonData = data.results;
				var length = jsonData.length;
				var _optionStr = '';
				for (var i = 0; i < length; i++) {
					if (selectedId && jsonData[i].loansCanalCode == selectedId) {
						_optionStr += "<option value='" + jsonData[i].loansCanalCode
								+ "' selected>" + jsonData[i].loansCanalName
								+ "</option>";
					} else {
						_optionStr += "<option value='" + jsonData[i].loansCanalCode
								+ "'>" + jsonData[i].loansCanalName + "</option>";
					}
				}
				if (_optionStr != '') {
					$countryId.append($(_optionStr));
				}
				if (callback) {
					callback(selectedId);
				}
			}
		});
	}
}


/**
 * 初始化FA人员下拉表选择项
 * 
 * @param countryId
 *            下拉列表对象
 * @param selectedId
 *            是否选中的值
 */
function initFaSelectOpt(countryId, selectedId,orgCode,callback) {
	var $countryId = $('#' + countryId);
	if ($countryId) {
		var url =  "/userInfo/listSelectByJson.json?orgCode="+orgCode;
		$("option[value!='']", $countryId).remove();
		ajaxGetJSON(url, function(data) {
			if (data.code == 200) {
				var jsonData = data.results;
				var length = jsonData.length;
				var _optionStr = '';
				for (var i = 0; i < length; i++) {
					if (selectedId && jsonData[i].sid == selectedId) {
						_optionStr += "<option value='" + jsonData[i].sid
								+ "' selected>" + jsonData[i].name
								+ "</option>";
					} else {
						_optionStr += "<option  value='" + jsonData[i].sid
								+ "'>" + jsonData[i].name + "</option>";
					}
				}
				if (_optionStr != '') {
					$countryId.append($(_optionStr));
				}
				if (callback) {
					callback(selectedId);
				}
			}
		});
	}
}

/**
 * 初始化贷款方案下拉表选择项
 * 
 * @param countryId
 *            下拉列表对象
 * @param selectedId
 *            是否选中的值
 */
function initLoanSelectOpt(countryId, selectedId,loansCanal,callback) { 
	
	var $countryId = $('#' + countryId);
	if ($countryId) {
		
		var url =  "${ctx}/loansPlan/listSelectByJson.json?loansCanal="+loansCanal;
		
		$("option[value!='']", $countryId).remove();
		ajaxGetJSON(url, function(data) {
			if (data.code == 200) {
				var jsonData = data.results;
				var length = jsonData.length;
				var seldata = '';
				var interestRate = '';
				var sf = '';
				var _optionStr = '';
				for (var i = 0; i < length; i++) {
					if (selectedId && jsonData[i].sid == selectedId) {
						_optionStr += "<option title='"+jsonData[i].loansInterestRate+"' label='"+jsonData[i].interestRate+","+jsonData[i].downPaymentRatio+"' value='" + jsonData[i].sid
								+ "' selected>" + jsonData[i].loansPlanName
								+ "</option>";
						seldata = jsonData[i].loansInterestRate;
						interestRate = jsonData[i].interestRate;
						sf = jsonData[i].downPaymentRatio;
					} else {
						_optionStr += "<option title='"+jsonData[i].loansInterestRate+"' label='"+jsonData[i].interestRate+","+jsonData[i].downPaymentRatio+"'  value='" + jsonData[i].sid
								+ "'>" + jsonData[i].loansPlanName + "</option>";
					}
				}
				if (_optionStr != '') {
					$countryId.append($(_optionStr));
				}
				if (callback) {
					callback(selectedId,seldata,interestRate,sf);
				}
			}
			
		});
	}
}
function initLoanSelectOpt2(countryId, selectedId,loansCanal,callback) { 
	var $countryId = $('#' + countryId);
	if ($countryId) {
		
		var url =  "/loansPlan/listSelectByJson2.json?loansCanal="+loansCanal;
		
		$("option[value!='']", $countryId).remove();
		ajaxGetJSON(url, function(data) {
			if (data.code == 200) {
				var jsonData = data.results;
				var length = jsonData.length;
				var seldata = '';
				var interestRate = '';
				var sf = '';
				var _optionStr = '';
				for (var i = 0; i < length; i++) {
					if (selectedId && jsonData[i].sid == selectedId) {
						_optionStr += "<option title='"+jsonData[i].loansPlanTag+"' label='"+jsonData[i].loansPlanTag+","+jsonData[i].loansPlanTag+"' value='" + jsonData[i].loansPlanTag
								+ "' selected>" + jsonData[i].loansPlanTag
								+ "</option>";
						seldata = jsonData[i].loansPlanTag;
						interestRate = jsonData[i].loansPlanTag;
						sf = jsonData[i].loansPlanTag;
					} else {
						_optionStr += "<option title='"+jsonData[i].loansPlanTag+"' label='"+jsonData[i].loansPlanTag+","+jsonData[i].loansPlanTag+"'  value='" + jsonData[i].loansPlanTag
								+ "'>" + jsonData[i].loansPlanTag + "</option>";
					}
				}
				if (_optionStr != '') {
					$countryId.append($(_optionStr));
				}
				if (callback) {
					callback(selectedId,seldata,interestRate,sf);
				}
			}
			$countryId.selectpicker('refresh');
		});
	}
}

/**
 * 初始化贷款方案公式下拉表选择项
 * 
 * @param countryId
 *            下拉列表对象
 * @param selectedId
 *            是否选中的值
 */
function initLoanFormulaSelectOpt(countryId, selectedId,superiorSid,callback) {
	var $countryId = $('#' + countryId);
	if ($countryId) {
		var url =  "/loansFormula/listSelectByJson.json?superiorSid="+superiorSid;
		$("option[value!='']", $countryId).remove();
		ajaxGetJSON(url, function(data) {
			if (data.code == 200) {
				var jsonData = data.results;
				var length = jsonData.length;
				var _optionStr = '';
				for (var i = 0; i < length; i++) {
					if (selectedId && jsonData[i].sid == selectedId) {
						_optionStr += "<option  value='" + jsonData[i].sid
								+ "' selected>" + jsonData[i].formulaText
								+ "</option>";
					} else {
						_optionStr += "<option value='" + jsonData[i].sid
								+ "'>" + jsonData[i].formulaText + "</option>";
					}
				}
				if (_optionStr != '') {
					$countryId.append($(_optionStr));
				}
				if (callback) {
					callback(selectedId);
				}
			}
		});
	}
}