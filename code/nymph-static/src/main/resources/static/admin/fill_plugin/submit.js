// 存储全局的iframes
var localUrl = 'http://www.myadmddc.com/';
// 测试服务器
var devUrl = 'http://devadm.daidaiche.cn/';
// 开发服务器 
var proUrl = 'http://adm.daidaiche.cn/';
var iframes = function () {
    var allIframes = {};
    function findIframes(iframes, code) {
        iframes.each(function (index) {
            var src = this.src;
            var dd_code = code + '-' + index;
            allIframes[dd_code] = this;
            $(this).attr('ddc-iframe', dd_code);
            getIframeDocument(this, function (iframeDocument) {
                var childIframes = $(iframeDocument).find('iframe');
                if (childIframes.length > 0) {
                    findIframes(childIframes, dd_code);
                }
            });
        });
    }
    this.update = function () {
        findIframes($('iframe'), 'T');
        return this.content = allIframes;
    }
    this.update();
    this.content = allIframes;
}
var toalIframes = new iframes();
// 全局步骤标示符
var globalIndex = 0;
var saveApplyUrl = localUrl + "index.php?r=orders/yi-che-apply";
//
var JSONurl = $("#orderJs").val();
var globalRule = {};
var globalOrderJson = {};
$.getJSON(JSONurl + "&jsoncallback=?", function (orderJson) {
    console.log(orderJson);
    // 设置所有数据
    var containerData = {};
    var index = 0;
    containerData = setContainerData(orderJson);
    var ceRule = {};
    // 1.导航事件
    ceRule[index] = containerData.initData.saleManage; // 销售管理
    ceRule[++index] = containerData.initData.escalationIntoPieces; // 进件提报
    ceRule[++index] = containerData.initData.addOrder; //  新增订单
    // 2.产品选择
    ceRule[++index] = containerData.initData.selectProduct;
    ceRule[++index] = containerData.initData.leaseType; // 租赁类型
    ceRule[++index] = containerData.initData.vehicleType; // 车辆类型
    ceRule[++index] = containerData.initData.applyType; // 申请类型
    ceRule[++index] = containerData.initData.repayFreque; // 还款频率
    ceRule[++index] = containerData.initData.repayStyle; // 还款方式
    ceRule[++index] = containerData.initData.billProperty; // 开票属性
    ceRule[++index] = containerData.initData.termFinancing; // 融资期限
    ceRule[++index] = containerData.initData.firm; // 厂商
    ceRule[++index] = containerData.initData.GPSType; // GPS价格类型
    ceRule[++index] = containerData.initData.nextType; // 下一步
    // 3.车辆信息
    ceRule[++index] = containerData.carInfoData.plateProvince; // 预计上牌省份
    ceRule[++index] = containerData.carInfoData.plateCity; // 预计上牌城市
    ceRule[++index] = containerData.carInfoData.usedMaile; // 公里数
    ceRule[++index] = containerData.carInfoData.estimatedPrice; // 提报预估价
    ceRule[++index] = containerData.carInfoData.carFramNum; // 车架号
    ceRule[++index] = containerData.carInfoData.factoryTime; // 出厂日期
    ceRule[++index] = containerData.carInfoData.registerTime; // 初登日期
    ceRule[++index] = containerData.carInfoData.province; // 牌照省份
    ceRule[++index] = containerData.carInfoData.address; // 牌照地区
    ceRule[++index] = containerData.carInfoData.carNum; // 牌照号码
    ceRule[++index] = containerData.carInfoData.estimatedCompany; // 二手车评估机构
    ceRule[++index] = containerData.carInfoData.findCarBtn; //  查找车辆
    // 保存按钮 ( 保存单号的服务器)
    ceRule[++index] = containerData.carInfoData.btnSave;
    // 4. 保险信息 按钮
    ceRule[++index] = containerData.titleBarData.insuranceTitle;
    // 4.1 是否保险
    ceRule[++index] = containerData.insuranceData.credit;
    // 4.2 保险公司
    ceRule[++index] = containerData.insuranceData.insuranceCompany;
    // 4.3 交强险出单地
    ceRule[++index] = containerData.insuranceData.insuranceJiaoQ;
    // 4.4 商业险出单地
    ceRule[++index] = containerData.insuranceData.insuranceShangY;
    // 4.5 商业险出单方式
    ceRule[++index] = containerData.insuranceData.insuranceShangStyle;
    // 4.6 车辆损失险
    ceRule[++index] = containerData.insuranceData.insuranceCLSSX;
    // 4.7 第三者责任险
    ceRule[++index] = containerData.insuranceData.insuranceThirdResp;
    // 4.81 车上人员责任责任险(司机) --
    ceRule[++index] = containerData.insuranceData.insuranceDriverSel;
    // 4.82 不计免赔
    ceRule[++index] = containerData.insuranceData.insuranceDriverMianP;
    // 4.83 保额
    ceRule[++index] = containerData.insuranceData.insuranceDriverBaoE;
    // 4.9 车上人员责任责任险(乘客) --
    ceRule[++index] = containerData.insuranceData.insuranceGustSel;
    ceRule[++index] = containerData.insuranceData.insuranceGustMianP;
    ceRule[++index] = containerData.insuranceData.insuranceGustBaoE;
    // 4.10 车身划痕险
    ceRule[++index] = containerData.insuranceData.insuranceNickSel;
    ceRule[++index] = containerData.insuranceData.insuranceNickMianP;
    ceRule[++index] = containerData.insuranceData.insuranceNickBaoE;
    // 4.11 车辆停驶代步车费用险
    ceRule[++index] = containerData.insuranceData.insuranceTravelFaresSel;
    ceRule[++index] = containerData.insuranceData.insuranceTravelFaresMianP;
    ceRule[++index] = containerData.insuranceData.insuranceTravelFaresBaoE;
    // 4.12 自燃损失险
    ceRule[++index] = containerData.insuranceData.insuranceLossSel;
    ceRule[++index] = containerData.insuranceData.insuranceLossMianP;
    // 4.13 玻璃单独破碎险
    ceRule[++index] = containerData.insuranceData.insuranceGlassSel;
    ceRule[++index] = containerData.insuranceData.insuranceGlassBaoE;
    // 4.14 指定专修险
    ceRule[++index] = containerData.insuranceData.insuranceSpecifySel;
    // 4.15 涉水行驶损失险
    ceRule[++index] = containerData.insuranceData.insuranceWadingSel;
    ceRule[++index] = containerData.insuranceData.insuranceWadingMianP;
    ceRule[++index] = containerData.insuranceData.insuranceWadingBaoE;
    // 4.16 计算按钮
    ceRule[++index] = containerData.insuranceData.insuranceCalculate;
    // 4.17 (实际)交强险
    ceRule[++index] = containerData.insuranceData.insuranceFactJiaoOne;
    ceRule[++index] = containerData.insuranceData.insuranceFactJiaoTwo;
    ceRule[++index] = containerData.insuranceData.insuranceFactJiaoThree;
    ceRule[++index] = containerData.insuranceData.insuranceFactJiaoFour;
    ceRule[++index] = containerData.insuranceData.insuranceFactJiaoFive;
    // 4.18 (实际)商业险
    ceRule[++index] = containerData.insuranceData.insuranceFactCommercialOne;
    ceRule[++index] = containerData.insuranceData.insuranceFactCommercialTwo;
    ceRule[++index] = containerData.insuranceData.insuranceFactCommercialThree;
    ceRule[++index] = containerData.insuranceData.insuranceFactCommercialFour;
    ceRule[++index] = containerData.insuranceData.insuranceFactCommercialFive;
    // 4.19 (实际)车船税
    ceRule[++index] = containerData.insuranceData.insuranceFactTravelTaxOne;
    ceRule[++index] = containerData.insuranceData.insuranceFactTravelTaxTwo;
    ceRule[++index] = containerData.insuranceData.insuranceFactTravelTaxThree;
    ceRule[++index] = containerData.insuranceData.insuranceFactTravelTaxFour;
    ceRule[++index] = containerData.insuranceData.insuranceFactTravelTaxFive;
    // 4.20 保存按钮点击
    ceRule[++index] = containerData.insuranceData.insuranceSaveBtn;
    // 4.21 跳转"融资信息"
    ceRule[++index] = containerData.titleBarData.financeTitle;
    ceRule[++index] = containerData.financeData.financeType;   //  融资项固定类型
    ceRule[++index] = containerData.financeData.gpsData;       // 5.2 GPS价格类型
    ceRule[++index] = containerData.financeData.fristPayRate;  // 5.3 首付比例
    ceRule[++index] = containerData.financeData.payStyle;      // 5.4 手续费收款方式
    ceRule[++index] = containerData.financeData.marginRatio;   // 5.5 保证金比例
    ceRule[++index] = containerData.financeData.isDiscount;    // 5.6 是否贴息
    ceRule[++index] = containerData.financeData.customerFinace;// 5.7 客户融资额
    ceRule[++index] = containerData.financeData.downPayment;  // 5.8 首付金额
    ceRule[++index] = containerData.financeData.marginOffset;  // 5.9 保证金冲抵
    ceRule[++index] = containerData.financeData.marginType;    // 5.10 保证金固定类型
    ceRule[++index] = containerData.financeData.rateType;      // 5.11 利率类型
    ceRule[++index] = containerData.financeData.btnCalculate;  // 5.12 计算
    ceRule[++index] = containerData.financeData.btnSave;       // 5.13 保存
    // 6.1 跳转 "收还款信息"
    ceRule[++index] = containerData.titleBarData.loanTitle;
    ceRule[++index] = containerData.incomeRepayData.payeeType;  // 6.2 收款方类型
    ceRule[++index] = containerData.incomeRepayData.payeeName;  // 6.3 收款方名称
    ceRule[++index] = containerData.incomeRepayData.synReapy;   // 6.4 同步车辆还款信息
    ceRule[++index] = containerData.incomeRepayData.saveBtn;    // 6.5 保存
    // 6.1  跳转 "客户基本信息"
    ceRule[++index] = containerData.titleBarData.customerTitle;
    // 对
    ++index;
    ceRule[++index] = containerData.customerData.profession.companyProvince; // 单位所在省份
    ceRule[++index] = containerData.customerData.profession.companyCity; // 单位所在城市
    ceRule[++index] = containerData.customerData.liveData.liveProvince; // 现居住地省份
    ceRule[++index] = containerData.customerData.liveData.liveCity; // 现居住地城市
    ceRule[++index] = containerData.customerData.liveData.censusProvince; // 户籍地省份
    ceRule[++index] = containerData.customerData.liveData.censusCity; // 户籍地城市
    // 增加提示功能
//    ceRule[++index] = ;
    // 6.2  基本信息
    ceRule[++index] = containerData.customerData.baseMsg.userName; // 申请人姓名
    ceRule[++index] = containerData.customerData.baseMsg.credit; // 自查征信
    ceRule[++index] = containerData.customerData.baseMsg.telephone; // 手机号码
    ceRule[++index] = containerData.customerData.baseMsg.customerProperty; // 客户属性
    ceRule[++index] = containerData.customerData.baseMsg.cardType; // 证件类型
    ceRule[++index] = containerData.customerData.baseMsg.gender; // 申请人性别
    ceRule[++index] = containerData.customerData.baseMsg.marriageStatus; // 婚姻状况
    ceRule[++index] = containerData.customerData.baseMsg.education; // 申请人学历
    ceRule[++index] = containerData.customerData.baseMsg.cardNum; // 证件号码
    ceRule[++index] = containerData.customerData.baseMsg.birth; // 出生日期
    ceRule[++index] = containerData.customerData.baseMsg.customerChannel; // 客户渠道
    ceRule[++index] = containerData.customerData.baseMsg.home; // 有无房产
    //// 6.4 居住信息
    ceRule[++index] = containerData.customerData.guarantorData.name; // 姓名
    ceRule[++index] = containerData.customerData.guarantorData.cardType; // 身份证类型
    ceRule[++index] = containerData.customerData.guarantorData.cardNum; // 证件号码
    ceRule[++index] = containerData.customerData.guarantorData.telephone; // 手机号码
    ceRule[++index] = containerData.customerData.guarantorData.companyName; // 单位名称
    ceRule[++index] = containerData.customerData.guarantorData.companyAddress; // 单位地址
    
    // 6.3 职业信息
    ceRule[++index] = containerData.customerData.profession.companyAddress; // 单位详细地址
    ceRule[++index] = containerData.customerData.liveData.liveAddress; // 现居住地详细地址
    ceRule[++index] = containerData.customerData.liveData.censusAddress; // 户籍地详细地址
    ceRule[++index] = containerData.customerData.profession.companyName; // 单位名称
    ceRule[++index] = containerData.customerData.profession.companyProvince; // 单位所在省份
    ceRule[++index] = containerData.customerData.profession.companyCity; // 单位所在城市
    ceRule[++index] = containerData.customerData.liveData.liveProvince; // 现居住地省份
    ceRule[++index] = containerData.customerData.liveData.liveCity; // 现居住地城市
    ceRule[++index] = containerData.customerData.liveData.censusProvince; // 户籍地省份
    ceRule[++index] = containerData.customerData.liveData.censusCity; // 户籍地城市
    // 6.5 提示 联系人信息
//    ceRule[++index] = getGlobalBaseData('', '', 'ddc-tip', false, '', false);
    ceRule[++index] = containerData.customerData.contactsData.relativeName;
    ceRule[++index] = containerData.customerData.contactsData.friendName;
    ceRule[++index] = containerData.customerData.contactsData.colleaguesName;
    ceRule[++index] = containerData.customerData.contactsData.relativePhone;
    ceRule[++index] = containerData.customerData.contactsData.friendPhone;
    ceRule[++index] = containerData.customerData.contactsData.colleaguesPhone;
    // 6.5 提示 联系人信息
    ceRule[++index] = getGlobalBaseData('', '', 'ddc-tip', false, '', false);
    ceRule[++index] = containerData.customerData.btnSave;
//    ceRule[++index] = containerData.customerData.profession.companyCity; // 单位所在城市
//    ceRule[++index] = containerData.customerData.liveData.liveCity; // 现居住地城市
//    ceRule[++index] = containerData.customerData.liveData.censusCity; // 户籍地城市
    // 6.4 关闭提示信息
    ceRule[++index] = getGlobalBaseData('div#alertMsgBox a.easyui-linkbutton', '', 'cancel-tip', false, '', false);
    
//    ceRule[++index] = containerData.customerData.contactsData.friendName;
//    ceRule[++index] = containerData.customerData.contactsData.friendPhone;
//    ceRule[++index] = containerData.customerData.contactsData.colleaguesName;
//    ceRule[++index] = containerData.customerData.contactsData.colleaguesPhone;
//    ceRule[++index] = containerData.customerData.contactsData.relativeName;
//    ceRule[++index] = containerData.customerData.contactsData.relativePhone;
//    ceRule[++index] = containerData.customerData.contactsData.relativeName;

    globalRule = ceRule;
    console.log(ceRule);
    globalOrderJson = orderJson;
    addToolBarEvents();
    
//    setCarInfoMsg(true);
    // 执行
//    performSubmit();
});
// 设置input数据
function getGlobalInputData(domKey, domValue, change, code, skip) {
    return getGlobalBaseData(domKey, domValue, 'input', change, code, skip);
}
// 设置下拉框数据  type : 1-> option; 2--> drop
function getGlobalInputDropData(domKey, type, text, change, code, skip) {
    var inputData = {};
    if (type == '1') { // option
        inputData = getGlobalBaseData('input#editor_' + domKey, '', 'input-option', change, code, skip);
        inputData.bodyKey = 'div.combo-p:visible div.combobox-item:contains(' + text + ')';
        inputData.nextDom = false;
        inputData.bodyFind = false;
    } else { // drop 内容
        inputData = getGlobalBaseData('input#editor_' + domKey, '', 'input-drop', change, code, skip);
        inputData.bodyKey = 'div.combo-p:visible div#body_' + domKey;
        inputData.nextDom = 'a#next_' + domKey;
        inputData.bodyFind = 'td.datagrid-cell:contains(' + text + ')';
    }
    return inputData;
}
// 设置coverInput 数据
function getGlobalCoverInputData(domKey, domValue, change, code, skip) {
    return getGlobalBaseData(domKey, domValue, 'cover-input', change, code, skip)
}
/**
 * @param {type} key        查找节点的选择器
 * @param {type} value      节点的value
 * @param {type} type       类型 
 * @param {type} change     是否要 刷新 iframe
 * @param {type} code       iframe --> 对应的code
 * @param {type} skip       是否要跳过这一步
 * @returns {getGlobalBaseData.baseData}
 */
function getGlobalBaseData(key, value, type, change, code, skip) {
    var baseData = {};
    baseData.domKey = key,
            baseData.domValue = value,
            baseData.domType = type,
            baseData.skipNext = skip;
    baseData.iframeChange = change;
    baseData.code = code;
    return baseData;
}
/***************************************数据对象封装*****************************************************/
function setContainerData(orderData) {
    var containerData = {};
    // 初始信息: 导航, 产品类选择
    var initData = new initObject();
    initData.setData(orderData);
    containerData.initData = initData;
    // 标题栏信息
    var titleBarData = new titleBarObject();
    containerData.titleBarData = titleBarData;
    // 车辆信息
    var carInfoData = new carInfoObject();
    // 新车 or 二手车
    var isNewCar = (orderData.order.car_type == '1') ? false : true;
    carInfoData.setData(orderData.carInfo, isNewCar);
    containerData.carInfoData = carInfoData;
    // 保险信息
    var insuranceData = new insuranceObject();
    insuranceData.setData(orderData.insurance);
    containerData.insuranceData = insuranceData;
    // 融资信息
    var financeData = new financeObject();
    financeData.setData(orderData.productModel);
    containerData.financeData = financeData;
    // 客户信息
    var customerData = new customerObject();
    customerData.setData(orderData.customer);
    containerData.customerData = customerData;
    // 收还款信息
    var incomeRepayData = new incomeRepayObject();
    incomeRepayData.setData(orderData.insurance);
    containerData.incomeRepayData = incomeRepayData;
    return containerData;
}
// 初始信息: 导航,产品信息
var initObject = function () {
    var code = 'T-1';
    this.setData = function (data) {
        this.saleManage = getGlobalBaseData('div.panel-header.accordion-header:has(div.panel-title:contains(销售管理))',
                '销售管理', 'title', false, code, false);
        this.escalationIntoPieces = getGlobalBaseData('div.tree-node:has(span.tree-title:contains(进件提报))',
                '进件提报', 'title', true, code, false);
        //  新增订单
        this.addOrder = getGlobalBaseData('#btnAdd', '', 'btn', true, code, false);
        // 2.产品选择
        this.selectProduct = getGlobalBaseData('tr.datagrid-row[datagrid-row-index="' + (data.productSmallName.small_name_id - 1) + '"]',
                data.productSmallName.small_name_id, 'list-title', true, code, false);
        // 租赁类型
        this.leaseType = getGlobalInputDropData('apzsx', '2', (data.order.rent_type == '2') ? '回租' : '正租',
                false, code, false);
        // 车辆类型
        this.vehicleType = getGlobalInputDropData('acllx', '2', (data.order.car_type == '1') ? '二手车' : '新车',
                false, code, false);
        // 申请类型
        this.applyType = getGlobalInputDropData('asqlx', '2', (data.order.car_object == '1') ? '企业' : '个人',
                false, code, false);
        // 还款频率
        this.repayFreque = getGlobalInputDropData('ahkpl', '2', '月付', false, code, false);
        // 还款方式
        this.repayStyle = getGlobalInputDropData('ahkfs', '2', '等额本息', false, code, true);
        // 开票属性
        this.billProperty = getGlobalInputDropData('akpsx', '1', '不开', false, code, false);
        // 融资期限
        this.termFinancing = getGlobalInputDropData('arzqx', '2', data.productModel.term + '期', false, code, false);
        // 厂商
        this.firm = getGlobalInputDropData('factoryName', '2', '中瑞', false, code, false);
        // GPS价格类型  
        // 2. GPS 价格类型
        var GPS = data.productModel.GPS;
        if (GPS == '常规') {
            GPS = '普通价格';
        }
        this.GPSType = getGlobalInputDropData('pricetypeName', '2', GPS, false, code, false);
        // 下一步
        this.nextType = getGlobalBaseData('#btnNext', '', 'btn', true, code, false);
    }
}
// 标题栏信息
var titleBarObject = function () {
    var code = 'T-1';
    // 保险标题栏
    this.insuranceTitle = getGlobalBaseData('div.tabs-wrap ul li:has(a span.tabs-title:contains(保险信息))',
            '', 'btn', true, code, false);
    // 融资信息标题栏
    this.financeTitle = getGlobalBaseData('div.tabs-wrap ul li:has(a span.tabs-title:contains(融资信息))', '', 'btn', true, code, false);
    // 客户基本信息
    this.customerTitle = getGlobalBaseData('div.tabs-wrap ul li:has(a span.tabs-title:contains(客户基本信息))', '', 'btn', true, code, false);
    // 收/还款信息
    this.loanTitle = getGlobalBaseData('div.tabs-wrap ul li:has(a span.tabs-title:contains(收、还款信息))', '', 'btn', true, code, false);
}
// 创建汽车对象
var carInfoObject = function () {
    var code = 'T-1-0';
    // 初始化数据
    this.setData = function (data, isNewCar) {
        // 3.车辆信息
        console.log(isNewCar);
        // 预计上牌省份
        this.plateProvince = getGlobalInputDropData('ayjspsfName', '2', data.evaluate_plate.province_plate, false, code, false);
        // 预计上牌城市
        this.plateCity = getGlobalInputDropData('ayjspcsName', '2', data.evaluate_plate.city_plate, false, code, false);
        // 公里数
        if (!data.used_maile) {
            data.used_maile = '0.1';
        }
        this.usedMaile = getGlobalInputData('input#editor_fescgls', data.used_maile, false, code, isNewCar);
        // 提报预估价
        this.estimatedPrice = getGlobalInputData('input#editor_fescpgjebg', data.estimated_price, false, code, isNewCar);
        // 车架号
        this.carFramNum = getGlobalInputData('input#editor_acjh', data.car_fram_num, false, code, isNewCar);
        // 出厂日期
        this.factoryTime = getGlobalInputData('input#editor_descccrq', data.factory_time, false, code, isNewCar);
        // 初登日期
        this.registerTime = getGlobalInputData('input#editor_desccdrq', data.register_time, false, code, isNewCar);
        // 牌照省份
        this.province = getGlobalInputDropData('acarnojc', '2', data.licenseData.province, false, code, isNewCar);
        // 牌照地区
        this.address = getGlobalInputDropData('englishno', '2', data.licenseData.address, false, code, isNewCar);
        // 牌照号码
        this.carNum = getGlobalInputData('input#editor_acphno', data.licenseData.car_num, false, code, isNewCar);
        // 二手车评估机构
        this.estimatedCompany = getGlobalInputDropData('oldcarcompanyName', '2', '精真估', false, code, isNewCar);
        // 查找车辆
        this.findCarBtn = getGlobalBaseData('#btnCar', '', 'btn', false, code, false);
        // 保存按钮
        this.btnSave = getGlobalBaseData('#btnSave', '', 'save-apply', true, code, false);
    }

}
// 创建保险对象
var insuranceObject = function () {
    var code = 'T-1-1';

    function getInputData(domKey, domValue, skip) {
        return getGlobalInputData(domKey, domValue, false, code, skip);
    }
    // 设置数据
    function getInputDropData(domKey, type, text, skip) {
        return getGlobalInputDropData(domKey, type, text, false, code, skip);
    }
    // 设置check数据
    function getCheckData(domKey, domValue, skip) {
        return getGlobalBaseData(domKey, domValue, 'check', false, code, skip);
    }
    // 设置sel 数据
    function getSelData(domKey, insurancModel) {
        var modelData = getCheckData(domKey, false, true);
        if (insurancModel) {
            modelData = getCheckData(domKey, true, false);
        }
        return modelData;
    }
    ;
    // 设置不计mian赔
    function getMianData(domKey, insuranceModel) {

        var modelData = getCheckData(domKey, false, true);
        if (insuranceModel && insuranceModel.non_deductible == '1') {
            modelData = getCheckData(domKey, true, false);
        }
        return modelData;
    }
    ;
    // 设置 baoe 数据
    function getBaoData(domKey, domValue, insuranceModel) {
        var modelData = getInputDropData(domKey, 1, '', true);
        if (insuranceModel) {
            modelData = getInputDropData(domKey, 1, domValue, false);
        }
        return modelData;
    }
    ;
    // 设置 实际 价格
    function getFactPrice(domKey, domValue) {
        var modelData = getInputData(domKey, domValue, true);
        if (domValue) {
            modelData = getInputData(domKey, domValue, false);
        }
        return modelData;
    }
    // 赋值数据
    this.setData = function (data) {
        var isCredit = data.is_credit == '1' ? true : false;
        // 头部数据
        var headJson = data.insuranceHeadData;
        var contentJson = data.insuranceContentData;
        // 1. 是否容保险
        var strCredit = isCredit ? '是' : '否';
        this.credit = getInputDropData('asfrbx', 1, strCredit, false);
        // 2. 保险公司
        var companyName = '太平';
        var jiaoQ = '总部';
        var shangY = '总部';
        if (headJson.insurance_company.indexOf('本地保险') > -1) {
            companyName = '本地保险公司';
            jiaoQ = '当地';
            shangY = '当地';
        }
        this.insuranceCompany = getInputDropData('abxgsName', 2, companyName, !isCredit);
        // 3. 交强险出单地
        this.insuranceJiaoQ = getInputDropData('ajqxcddName', 2, jiaoQ, !isCredit);
        // 4. 商业险出单地
        this.insuranceShangY = getInputDropData('asyxcddName', 2, shangY, !isCredit);
        // 5. 商业险出单方式
        var ShangStyle = '分年购买';
        if (headJson.term == '1') {
            ShangStyle = '一次性购买';
        }
        this.insuranceShangStyle = getInputDropData('asyxcdfsName', 2, ShangStyle, !isCredit);
        // 6. 车辆损失险 insurance_coverage
        this.insuranceCLSSX = getInputData('input#editor_baoe_csx', parseFloat(data.insurance_coverage), false);
//                {domKey: 'input#editor_baoe_csx', domValue: parseFloat(data.insurance_coverage), domType: 'input', iframeChange: false, skipNext: false, code: 'T-1-1', }
        // 7. 第三者责任险thirdResponsi
        this.insuranceThirdResp = getInputDropData('baoe_szx', 1, contentJson.thirdResponsi.insurance_coverage, false);
        // 8.1 车上人员责任责任险(司机)driverResponsi
        var driverData = contentJson.driverResponsi;
        this.insuranceDriverSel = getSelData('input#editor_xbdm_csryxsj', driverData);
        this.insuranceDriverMianP = getMianData('input#editor_bjmp_csryxsj', driverData);
        this.insuranceDriverBaoE = getBaoData('baoe_csryxsj', (driverData ? driverData.insurance_coverage : ''), driverData);
        // 9.1 车上人员责任责任险(乘客)
        var gustData = contentJson.gustResponsi;
        this.insuranceGustSel = getSelData('input#editor_xbdm_csryxck', gustData);
        this.insuranceGustMianP = getMianData('input#editor_bjmp_csryxck', gustData);
        this.insuranceGustBaoE = getBaoData('baoe_csryxck', (gustData ? gustData.insurance_coverage : ''), gustData);
        // 10. 车身划痕险
        var nickData = contentJson.nick;
        this.insuranceNickSel = getSelData('input#editor_xbdm_hhx', nickData);
        this.insuranceNickMianP = getMianData('input#editor_bjmp_hhx', nickData);
        this.insuranceNickBaoE = getBaoData('baoe_hhx', (nickData ? nickData.insurance_coverage : ''), nickData);
        // 11. 车辆停驶代步车费险
        var travelFaresData = contentJson.tsdbcfyx;
        this.insuranceTravelFaresSel = getSelData('input#editor_xbdm_tsdbx', travelFaresData);
        this.insuranceTravelFaresMianP = getMianData('input#editor_bjmp_tsdbx', travelFaresData);
        this.insuranceTravelFaresBaoE = getBaoData('baoe_tsdbx', (travelFaresData ? travelFaresData.insurance_coverage : ''), travelFaresData);
        // 12.  自然损失险
        var lossData = contentJson.zrssx;
        this.insuranceLossSel = getSelData('input#editor_xbdm_zrx', lossData);
        this.insuranceLossMianP = getMianData('input#editor_bjmp_zrx', lossData);
        // 13. 玻璃单独破碎险
        var glassBreakData = contentJson.blddpsx;
        this.insuranceGlassSel = getSelData('input#editor_xbdm_blx', glassBreakData);
        var glassBaoE = (glassBreakData && glassBreakData.insurance_coverage == '1') ? '国产' : '进口';
        this.insuranceGlassBaoE = getBaoData('baoe_blx', glassBaoE, glassBreakData);
        // 14. 指定专修险
        var specifyData = contentJson.zdzxx;
        this.insuranceSpecifySel = getSelData('input#editor_xbdm_zxx', specifyData);
        // 15. 涉水行驶损失险
        var wadingLossData = contentJson.ssxsssx;
        this.insuranceWadingSel = getSelData('input#editor_xbdm_ssx', wadingLossData);
        this.insuranceWadingMianP = getMianData('input#editor_bjmp_ssx', wadingLossData);
        this.insuranceWadingBaoE = getBaoData('baoe_ssx', (wadingLossData ? wadingLossData.insurance_coverage : ''), wadingLossData);
        // 保险计算按钮
        this.insuranceCalculate = {domKey: 'a#btCalculat', domType: 'btn', iframeChange: false, code: 'T-1-1', };
        // 16. (实际)交强险
        var factJiaoData = contentJson.traffic_fact;
        this.insuranceFactJiaoOne = getFactPrice('input#editor_div_1_jqxTotalAmt_input', factJiaoData.one_disprice);
        this.insuranceFactJiaoTwo = getFactPrice('input#editor_div_2_jqxTotalAmt_input', factJiaoData.two_disprice);
        this.insuranceFactJiaoThree = getFactPrice('input#editor_div_3_jqxTotalAmt_input', factJiaoData.three_disprice);
        this.insuranceFactJiaoFour = getFactPrice('input#editor_div_4_jqxTotalAmt_input', factJiaoData.four_disprice);
        this.insuranceFactJiaoFive = getFactPrice('input#editor_div_5_jqxTotalAmt_input', factJiaoData.five_disprice);
        // 17. (实际)商业险
        var commercialData = contentJson.sumBusiness;
        this.insuranceFactCommercialOne = getFactPrice('input#editor_div_1_syxTotalAmt_input', commercialData.one_disprice);
        this.insuranceFactCommercialTwo = getFactPrice('input#editor_div_2_syxTotalAmt_input', commercialData.two_disprice);
        this.insuranceFactCommercialThree = getFactPrice('input#editor_div_3_syxTotalAmt_input', commercialData.three_disprice);
        this.insuranceFactCommercialFour = getFactPrice('input#editor_div_4_syxTotalAmt_input', commercialData.four_disprice);
        this.insuranceFactCommercialFive = getFactPrice('input#editor_div_5_syxTotalAmt_input', commercialData.five_disprice);
        // 18. (实际)车船税
        var travelTaxData = contentJson.travel_fact;
        this.insuranceFactTravelTaxOne = getFactPrice('input#editor_div_1_ccsTotalAmt_input', travelTaxData.one_disprice);
        this.insuranceFactTravelTaxTwo = getFactPrice('input#editor_div_2_ccsTotalAmt_input', travelTaxData.two_disprice);
        this.insuranceFactTravelTaxThree = getFactPrice('input#editor_div_3_ccsTotalAmt_input', travelTaxData.three_disprice);
        this.insuranceFactTravelTaxFour = getFactPrice('input#editor_div_4_ccsTotalAmt_input', travelTaxData.four_disprice);
        this.insuranceFactTravelTaxFive = getFactPrice('input#editor_div_5_ccsTotalAmt_input', travelTaxData.five_disprice);
        // 19. 保险保存按钮
        this.insuranceSaveBtn = {domKey: 'a#btSave', domType: 'btn', iframeChange: false, code: 'T-1-1'};
    }
}
// 创建金融对象
var financeObject = function () {
    var code = 'T-1-2';
    // 设置数据
    this.setData = function (data) {
        // 1. 融资项固定类型
        // type 融资类型: 0: 固定首尾付比例, 1: 固定融资额
        var financeType = '固定首尾付比例';
        if ('1' == data.type) {
            financeType = '固定融资额';
        }
        // getGlobalInputDropData(domKey, type, text,change,code,skip)
        this.financeType = getGlobalInputDropData('agdzlx', '1', financeType, false, code, false);
        // 2. GPS 价格类型
        if (data.GPS == '常规') {
            data.GPS = '普通价格';
        }
        this.gpsData = getGlobalInputDropData('agpsjglxName', '2', data.GPS, false, code, false);
        // 3. 首付比例
        var fristPaySkip = false;
        if ('1' == data.type) {
            fristPaySkip = true;
        }
        this.fristPayRate = getGlobalInputData('input#editor_fsfbl', data.first_pay_proportion, false, code, fristPaySkip);
        // 4. 手续费收款方式
        var payStyle = '一次性';
        this.payStyle = getGlobalInputDropData('asxfkkfsName', '2', payStyle, false, code, false);
        // 5. 保证金比例
        var marginRatio = '0%';
        this.marginRatio = getGlobalInputDropData('fbzjlName', '2', marginRatio, false, code, false);
        // 6. 是否贴息
        var isDiscount = '不贴息';
        this.isDiscount = getGlobalInputDropData('atxfsName', '2', isDiscount, false, code, false);
        // 7. 客户融资额
        this.customerFinace = getGlobalInputData('input#editor_frze', '', false, code, true);
        if ('1' == data.type) {
          this.customerFinace = getGlobalInputData('input#editor_frze', data.amount_financing, false, code, false);
        }
        // 8. 首付金额
        this.downPayment = getGlobalInputData('input#editor_fsfje', '', false, code, true);
        // 9. 保证金冲抵
        var marginOffSetStr = '不冲抵';
        this.marginOffset = getGlobalInputDropData('abzjcdfsName', '2', marginOffSetStr, false, code, false);
        // 10. 保证金固定类型
        var marginType = '固定比例';
        this.marginType = getGlobalInputDropData('abzjgdzlx', '1', marginType, false, code, false);
        // 11. 利率类型
        var rateType = '固定';
        this.rateType = getGlobalInputDropData('allfsName', '2', rateType, false, code, false);
        // 12. 计算按钮
        this.btnCalculate = getGlobalBaseData('a#btnCal', '', 'btn', false, code, false);
        // 5.13 保存
        this.btnSave = getGlobalBaseData('a#btSave', '', 'btn', false, code, false);
    }
}
// 创建客户信息
var customerObject = function () {
    var code = 'T-1-3';
    // 设置数据
    this.setData = function (data) {
        var baseMsg = {};
        // 一. 客户的基本信息
        // 1.1 申请人姓名
        baseMsg.userName = getGlobalInputData('input#editor_akhxm', data.baseInfoData.userName, false, code, false);
        // 1.2 是否自查征信
        baseMsg.credit = getGlobalInputDropData('azczx', '1', data.baseInfoData.credit, false, code, false);
        // 1.3 手机号码
        baseMsg.telephone = getGlobalInputData('input#editor_asjhm', data.baseInfoData.telephone, false, code, false);
        // 1.4 客户属性
        var customerProperty = '客户属性';
        baseMsg.customerProperty = getGlobalInputDropData('akhsx', '1', customerProperty, false, code, false);
        // 1.5 证件类型
        baseMsg.cardType = getGlobalInputDropData('azjlx', '1', data.baseInfoData.cardType, false, code, false);
        // 1.6 申请人性别
        baseMsg.gender = getGlobalInputDropData('akhxb', '1', data.baseInfoData.gender, false, code, false);
        // 1.7 婚姻状况 
        baseMsg.marriageStatus = getGlobalInputDropData('ahyzk', '1', data.baseInfoData.marriageStatus, false, code, false);
        // 1.8 申请人学历
        if (data.baseInfoData.education == '初中以下') {
            data.baseInfoData.education = '小学及以下';
        }
        ;
        if (data.baseInfoData.education == '博士及以上') {
            data.baseInfoData.education = '博士研究生及以上';
        }
        baseMsg.education = getGlobalInputDropData('asqrxl', '1', data.baseInfoData.education, false, code, false);
        // 1.9 证件号码editor_azjhm
        baseMsg.cardNum = getGlobalInputData('input#editor_azjhm', data.baseInfoData.cardNum, false, code, false);
        // 1.10 出生日期
        baseMsg.birth = getGlobalInputData('input#editor_dcsrq', data.baseInfoData.birth, false, code, false);
        // 1.11 客户渠道
        baseMsg.customerChannel = getGlobalInputDropData('akhqdlx', '1', data.baseInfoData.customerChannel, false, code, false);
        // 1.12 有无房产editor_aywfc
        baseMsg.home = getGlobalInputDropData('aywfc', '1', data.baseInfoData.home, false, code, false);
        this.baseMsg = baseMsg;
        // 二. 职业信息
        var profession = {};
        // 2.1 单位名称
        profession.companyName = getGlobalInputData('input#editor_adwmc', data.professionData.companyName, false, code, false);
        // 2.2 单位所在省份
        profession.companyProvince = getGlobalInputDropData('adwszsfName', '2', data.professionData.companyProvince, false, code, false);
        // 2.3 单位所在城市
        profession.companyCity = getGlobalInputDropData('adwszcsName', '2', data.professionData.companyCity, false, code, false);
        // 2.4 单位详细地址
        profession.companyAddress = getGlobalInputData('input#editor_adwxxdz', data.professionData.companyAddress, false, code, false);
        this.profession = profession;
        // 三. 居住信息
        var liveData = {};
        // 3.1 现居住地省份
        liveData.liveProvince = getGlobalInputDropData('axjzdsfName', '2', data.customerData.liveProvince, false, code, false);
        // 3.2 现居住地城市
        liveData.liveCity = getGlobalInputDropData('axjzdcsName', '2', data.customerData.liveCity, false, code, false);
        // 3.3 现居住地址
        liveData.liveAddress = getGlobalInputData('input#editor_axjzddz', data.customerData.liveAddress, false, code, false);
        // 3.4 户籍地省份
        liveData.censusProvince = getGlobalInputDropData('ahjszsfName', '2', data.customerData.censusProvince, false, code, false);
        // 3.5 户籍地城市
        liveData.censusCity = getGlobalInputDropData('ahjszcsName', '2', data.customerData.censusCity, false, code, false);
        // 3.6 户籍地详细地址
        liveData.censusAddress = getGlobalInputData('input#editor_ahjszdz', data.customerData.censusAddress, false, code, false);
        this.liveData = liveData;
        // 四. 担保人信息
        var guarantorData = {};
        // 4.1 姓名
        guarantorData.name = getGlobalInputData('input#editor_apoxm', data.guarantor.guarantorName, false, code, false);
        // 4.2 证件类型
        guarantorData.cardType = getGlobalInputDropData('apozjlx', '1', data.guarantor.guarantorCardType, false, code, false);
        // 4.3 证件号码
        guarantorData.cardNum = getGlobalInputData('input#editor_apozjhm', data.guarantor.guarantorCardNum, false, code, false);
        // 4.4 手机号码
        guarantorData.telephone = getGlobalInputData('input#editor_aposjhm', data.guarantor.guarantorTelephone, false, code, false);
        // 4.5 单位名称 (用 客户自己的单位填补)
        guarantorData.companyName = getGlobalInputData('input#editor_apogzdw', data.guarantor.guarantorCompany, false, code, false);
        ;
        // 4.6 单位详细地址 (用 客户自己的详细地址)
        guarantorData.companyAddress = getGlobalInputData('input#editor_apodwxxdz', data.guarantor.guarantorAddress, false, code, false);
        ;
        this.guarantorData = guarantorData;
        // 五. 联系人信息
        var contactsData = {};
        // 5.1 亲属
        contactsData.relativeName = getGlobalCoverInputData('tr#datagrid-row-r1-2-0 td[field=alxrxm]  .datagrid-cell-c1-alxrxm', '', false, code, true);
        contactsData.relativePhone = getGlobalCoverInputData('tr#datagrid-row-r1-2-0 td[field=asjhm]  .datagrid-cell-c1-asjhm', '', false, code, true);
        if (data.contactsData.relatives) {
            contactsData.relativeName = getGlobalCoverInputData('tr#datagrid-row-r1-2-0 td[field=alxrxm] .datagrid-cell-c1-alxrxm', data.contactsData.relatives.name, false, code, false);
            contactsData.relativePhone = getGlobalCoverInputData('tr#datagrid-row-r1-2-0 td[field=asjhm] .datagrid-cell-c1-asjhm', data.contactsData.relatives.phone, false, code, false);
        }
        // 5.2 朋友editor_alxrxm--name , editor_asjhm-- phone
        contactsData.friendName = getGlobalCoverInputData('tr#datagrid-row-r1-2-1 td[field=alxrxm] .datagrid-cell-c1-alxrxm', '', false, code, true);
        contactsData.friendPhone = getGlobalCoverInputData('tr#datagrid-row-r1-2-1 td[field=asjhm] .datagrid-cell-c1-asjhm', '', false, code, true);
        if (data.contactsData.friends) {
            contactsData.friendName = getGlobalCoverInputData('tr#datagrid-row-r1-2-1 td[field=alxrxm] .datagrid-cell-c1-alxrxm', data.contactsData.friends.name, false, code, false);
            contactsData.friendPhone = getGlobalCoverInputData('tr#datagrid-row-r1-2-1 td[field=asjhm] .datagrid-cell-c1-asjhm', data.contactsData.friends.phone, false, code, false);
        }

        // 5.3 同事
        contactsData.colleaguesName = getGlobalCoverInputData('tr#datagrid-row-r1-2-2 td[field=alxrxm] .datagrid-cell-c1-alxrxm', '', false, code, true);
        contactsData.colleaguesPhone = getGlobalCoverInputData('tr#datagrid-row-r1-2-2 td[field=asjhm] .datagrid-cell-c1-asjhm', '', false, code, true);
        if (data.contactsData.colleagues) {
            contactsData.colleaguesName = getGlobalCoverInputData('tr#datagrid-row-r1-2-2 td[field=alxrxm] .datagrid-cell-c1-alxrxm', data.contactsData.colleagues.name, false, code, false);
            contactsData.colleaguesPhone = getGlobalCoverInputData('tr#datagrid-row-r1-2-2 td[field=asjhm] .datagrid-cell-c1-asjhm', data.contactsData.colleagues.phone, false, code, false);
        }
        this.contactsData = contactsData;
        
        this.btnSave = getGlobalBaseData('a#btSave', '', 'btn', false, code, false);
    }
}
// 创建收还款信息
var incomeRepayObject = function () {
    // 设置数据 data 为保险信息
    this.setData = function (data) {
        var isCredit = data.is_credit == '1' ? true : false;
        var code = 'T-1-3';
        // 1. 收款方类型
        this.payeeType = getGlobalInputDropData('askflxname', '2', '店面', false, code, false);
        // 2. 收款方名称
        this.payeeName = getGlobalInputDropData('askfmc', '2', '厦门铅笔头信息科技有限公司', false, code, false);
        //getGlobalBaseData(key,value,type,change,code,skip)
        // 3. 同步车辆还款信息 synchronous
        this.synReapy = getGlobalBaseData('a#btClhkxx', '', 'btn', false, code, !isCredit);
        // 4. 保存
        var saveBtnId = isCredit ? 'a#btSaveInsurance' : 'a#btSave1';
        this.saveBtn = getGlobalBaseData(saveBtnId, '', 'btn', false, code, false);
    }
}
/********************************************执行层*********************************************************************************************************/
// 执行
function performSubmit() {
    // 遍历规则 执行对应的操作
    // 执行事件
    var obj = globalRule[globalIndex];
    if (obj != undefined) {
        if (obj.skipNext == undefined || !obj.skipNext) { // // 无需跳过这一步
            eventHandle(obj, function () { // 成功
                globalIndex++;
                performSubmit();
            }, function () { // 失败回调
                setTimeout(function () {
                    toalIframes.update();
                    performSubmit();
                }, 1000);
            });
        } else { //跳过这一步
            globalIndex++;
            performSubmit();
        }
    }
}
// 事件的处理 switch
function eventHandle(obj, fn, failure) {
// 获取类型
    var domType = obj.domType;
    if (domType == 'title') {        // 标题
        performTitleEvent(obj, fn, failure);
    } else if (domType == 'btn') {          // 按钮
        performBtnEvent(obj, fn, failure);
    } else if (domType == 'list-title') {   // 侧边标题事件
        performListTitleEvent(obj, fn, failure);
    } else if (domType == 'input-drop') {     // 下拉 (有下一页)
        performInputDropEvent(obj, fn, failure);
    } else if (domType == 'input') {     // 输入框
        performInputEvent(obj, fn, failure);
    } else if (domType == 'save-apply') { //   保存订单
        performSaveApplyEvent(obj, fn, failure);
    } else if (domType == 'tab-title') { //  顶部标题栏
        performtabTitleClick(obj, fn, failure);
    } else if (domType == 'check') { // check 
        performtabCheckEvent(obj, fn, failure);
    } else if (domType == 'input-option') { // 下拉 (无下一页)
        performInputOptionEvent(obj, fn, failure);
    } else if (domType == 'cover-input') { // 遮盖的input
        performCoverInputEvent(obj, fn, failure);
    } else if (domType == 'cancel-tip') { // 取消提示信息
        performCancelEvent(obj, fn, failure);
    } else if (domType == 'ddc-tip'){ // 贷贷车的提示信息
        performDdcTipEvent(obj, fn, failure);
    }
}
// 执行 input输入值设置
function performInputEvent(obj, fn, failure) {
    getCurrentDom(obj, function (iframeDocument) {
        var inputDom = $(iframeDocument).find(obj.domKey);
        if (inputDom) {
            var inputObject = inputDom[0];
            inputObject.focus();
            inputObject.value = obj.domValue;// 赋值
            inputObject.blur();
            var ev = iframeDocument.createEvent("HTMLEvents");  
            ev.initEvent("change", false, true);  
            inputObject.dispatchEvent(ev);
            setTimeout(function(){
                commonSuccess(obj, fn, this);
            }, 1000);
        } else {
            failure();
        } // 失败回调
    }, function () {
        failure();
    });
}
// option,
function performInputOptionEvent(obj, fn, failure) {
    getCurrentDom(obj, function (iframeDocument) {
        var inputDom = $(iframeDocument).find(obj.domKey);
        // 无值,重新刷新
        if (!inputDom && inputDom.length < 1) {
            failure();
            return false;
        }
        var spanBtn = inputDom.next().children();
        spanBtn.click().queue(function () {
            // 获取body方法
            function getItemDom() {
                var itemDom = $(iframeDocument).find(obj.bodyKey);
                if (itemDom.is(':visible')) {
                    itemDom.click().queue(function () {
                        commonSuccess(obj, fn, this);
                    });
                } else {
                    setTimeout(function () {
                        getItemDom();
                    }, 1000);
                }
            }
            // 获取body, 执行点击
            getItemDom();
            $(this).dequeue();
        });
    }, function () {
        failure();
    });
}
// 执行 下拉框选中事件(new)
function performInputDropEvent(obj, fn, failure) {
    getCurrentDom(obj, function (iframeDocument) {
        var inputDom = $(iframeDocument).find(obj.domKey);
        // 如果无值返回
        if (!inputDom || (inputDom.length < 1)) {
            failure();
            return false;
        }
        var spanBtn = inputDom.next().children();
        spanBtn.delay(1000).queue(function () {
            // 获取body方法
            function getBodyDom() {
                var bodyDom = $(iframeDocument).find(obj.bodyKey);
                if (bodyDom && bodyDom.length > 0) { // 窗体内容
                    selecteCell(bodyDom);
                } else { // 没获取窗体内容,重新获取
                    setTimeout(function () {
                        getBodyDom();
                    }, 1000);
                }
            }
            // 选择cell 
            function selecteCell(bodyDom) {
                var cellDom = bodyDom.find(obj.bodyFind);
                if (cellDom.is(':visible')) {
                    var cell = cellDom.eq(0);
                    cell.click().queue(function () {
                        if (obj.iframeChange) {
                            toalIframes.update();
                        }
                        fn();
                        $(this).dequeue();
                    });
                } else {// 不可见,执行下一页
                    var pageDom = $(iframeDocument).find(obj.nextDom);
                    pageDom.each(function () {
                        var paginationBtn = $(this).find('.pagination-next');
                        paginationBtn.click();
                        getBodyDom();
                    });
                }
            }
            // 获取body, 执行点击
            getBodyDom();
            $(this).dequeue();
        }).click();
    }, function () { // 失败
        failure();
    });
}
// check 事件
function performtabCheckEvent(obj, fn, failure) {
    // 获取当前dom 
    getCurrentDom(obj, function (iframeDocument) {
        var checkDom = $(iframeDocument).find(obj.domKey);
        // 获取dom失败
        if (!checkDom) {
            failure();
        };
        if (obj.domValue == true) {
            if (checkDom.attr("checked") == undefined) {
                checkDom.click();
            }
            checkDom.attr('checked', 'checked');
            commonSuccess(obj, fn, this);
        } else {
            checkDom.attr('checked', false);
        }
    }, function () {
        faliure();
    })
}
// 标题事件
function performTitleEvent(obj, fn, failure) {
// 没有查询, 获取dom 
    getCurrentDom(obj, function (iframeDocument) {
        var $titleDom = $(iframeDocument).find(obj.domKey);
        if ($titleDom) {
            $titleDom.delay(2000).click().queue(function () {
                commonSuccess(obj, fn, this);
            });
        } else {
            failure();
        }
    }, function () {// 失败
        failure();
    });
}
// 按钮事件 new
function performBtnEvent(obj, fn, failure) {
// 没有查询, 获取dom 
    getCurrentDom(obj, function (iframeDocument) {
// 点击
        var btnDom = $(iframeDocument).find(obj.domKey);
        if (btnDom != null && btnDom.length > 0) {
            btnDom.each(function () {
// 模拟点击事件
                $(this).click().queue(function () {
                    setTimeout(function () {
                        commonSuccess(obj, fn, this);
                    }, 1000);
                });
                return false;
            });
        } else {
            failure();
        }
    }, function () {
        failure();
    });
}
// list-title 事件
function performListTitleEvent(obj, fn, failure) {
    getCurrentDom(obj, function (iframeDocument) {
        var listTitleDom = $(iframeDocument).find(obj.domKey);
        if (listTitleDom && (listTitleDom.length > 0)) {
            listTitleDom.click().queue(function () {
                commonSuccess(obj, fn, this);
            });
        } else {
            failure();
        }
    });
}
// 保存订单事件
function performSaveApplyEvent(obj, fn, failure) {
    // 当前的dom
    getCurrentDom(obj, function (iframeDocument) {
        var btnDom = $(iframeDocument).find(obj.domKey);
        // 保存按钮点击事件
        btnDom.click(function () {
            // 设置申请编号
            getApplyNo(obj);
            // 隐藏提示信息
            setCarInfoMsg(false);
        });
        // 设置汽车提示信息
        setCarInfoMsg(true);
    }, function () {
        failure();
    });
}
// 遮盖input
function performCoverInputEvent(obj, fn, failure) {
    getCurrentDom(obj, function (iframeDocument) {
        var coverDom = $(iframeDocument).find(obj.domKey);
        console.log(iframeDocument);
        if (coverDom) {
            var parentDom = coverDom.parent();
            console.log(parentDom);
            var tdObject = parentDom[0];
            // 模拟"鼠标按下"事件
            var ev1 = iframeDocument.createEvent("MouseEvents");  
            ev1.initEvent("mousedown", true, true,iframeDocument.defaultView, 0, 0, 0, 0, 0,false, false, false, false, 0, null);
            tdObject.dispatchEvent(ev1);
            // 模拟"鼠标点击"事件
            var ev2 = iframeDocument.createEvent("MouseEvents");  
            ev2.initEvent("click", true, true,iframeDocument.defaultView, 0, 0, 0, 0, 0,false, false, false, false, 0, null);
            tdObject.dispatchEvent(ev2);
            // 模拟"鼠标双击"事件
            setTimeout(function(){
                var ev3 = iframeDocument.createEvent("MouseEvents");  
                ev3.initEvent("dblclick", true, true,iframeDocument.defaultView, 0, 0, 0, 0, 0,false, false, false, false, 0, null);
                tdObject.dispatchEvent(ev3);
                setTimeout(function(){
                    var sss = coverDom.find('input');
                    var inputObject = sss[0];
                    inputObject.value = obj.domValue;
                    commonSuccess(obj,fn,this);
                }, 800);
            },1000);
        } else {
            failure();
        }
    }, function () {
        failure();
    });
}
// 取消弹框提示
function performCancelEvent(obj, fn, failure) {
    var confirmBtn = $('body').find(obj.domKey);
    if (confirmBtn) {
        confirmBtn.click();
    }
    fn();
}
// ddc 提示信息
function performDdcTipEvent(obj, fn, failure){
    setCustomerInfoMsg();
}
// 设置车辆提示信息
function setCarInfoMsg(status) {
    var carInfoMsg =globalOrderJson.carInfo.brand + ' ' + globalOrderJson.carInfo.model;
    var str = '提示:</br>';
    str += '1. 手动选择车辆信息:' + carInfoMsg + '</br>';
    str += '指导价:' + globalOrderJson.carInfo.new_price + '</br>';
    var note = globalOrderJson.carInfo.note;
    if(note.length > 1){
       str +="备注:"+ note + '</br>';
    }
    str += '2. 选完后,保存---->保存失败; 点击"重新提交"</br>';
    $(".ddc-tiptext").html(str);
    var isShow = 'hide';
    if (status) { isShow = 'show'; }
    $(".ddc-tipmsg").animate({width: isShow}, 'slow');
}
function setCustomerInfoMsg() {
    var str = '联系人信息:</br>';
    // 亲属
    var relatives = globalOrderJson.customer.contactsData.relatives;
    if(relatives){ 
        str += '亲属名称: ' + relatives.name + '; 电话: ' + relatives.phone + '</br></br>'; 
    }
    // 朋友
    var friend = globalOrderJson.customer.contactsData.friends;
    if(friend){
        str += '朋友名称: ' + friend.name + '; 电话: ' + friend.phone + '</br></br>';
    }
    // 同事
    var colleagues = globalOrderJson.customer.contactsData.colleagues;
    if(colleagues){
         str += '同事名称: ' + colleagues.name + '; 电话: ' + colleagues.phone;
    }
    $(".ddc-tiptext").html(str);
    $(".ddc-tipmsg").animate({width: 'show'}, 'slow');
}
// 完成后执行的操作
function commonSuccess(obj, fn, cancelObj) {
    if (obj.iframeChange) {
        setTimeout(function(){
            toalIframes.update();
            fn();
            $(cancelObj).dequeue();
        },1000);
    }else{
        fn();
        $(cancelObj).dequeue();
    }
    
}
// 获取iframeDocument
function getIframeDocument(iframe, fn, obj) {
    var iframeDocument = iframe.contentWindow.document;
    if (!iframeDocument || !iframeDocument.body || iframeDocument.body.childNodes.length <= 1) {
        iframe.contentWindow.onload = function () {
            fn(this.document);
            return false;
        }
        iframe.contentWindow.location.reload();
    } else {
        fn(iframeDocument);
    }
}
// 获取当前对象 dom, 
function getCurrentDom(obj, fn, failure) {
    var iframe = toalIframes.content[obj.code];
    if (iframe) { // 有iframe
        getIframeDocument(iframe, function (iframeDocument) {
            fn(iframeDocument);
        }, obj);
    } else { // 没有iframe 重新 编码
        failure();
    }
}
// 订单 创建成功 保存单号 至 服务器
function getApplyNo(obj) {
    // 注册: 获取弹框信息方法
    function findAlertMsg() {
        var alertMsg = $('body').find('div#alertMsgBox div.msg');
        var text = alertMsg.text();
        if (text && text.length > 0) {
            handleText(text); // 处理信息
        } else {
            setTimeout(function () {
                findAlertMsg();
            }, 1000);
        }
    }
    // 1. 获取弹框信息
    findAlertMsg();
    // 2. 判断保存成功与否
    function handleText(text) {
        if (text.indexOf('保存成功') > -1) {
//            console.log('保存成功');
            // 获取确定按钮
            var confirmBtn = $('body').find('div#alertMsgBox a.easyui-linkbutton');
            if (confirmBtn) {
                confirmBtn.click();
                // 继续执行下一步
                setTimeout(function () {
                    toalIframes.update();
                    globalIndex += 1;
                    performSubmit(); // 执行提交
                }, 3000);
            }
            // 保存服务器
            saveApply();
        } else {
//            console.log('保存失败');
        }
    }
}
// 保存编号
function saveApply() {
    var applyLabel = {domKey: 'label#datalabel_applyNo', domValue: '', code: 'T-1', }
    getCurrentDom(applyLabel, function (iframeDocument) {
        var noLabel = $(iframeDocument).find(applyLabel.domKey).text();
//        console.log(noLabel);
        if (noLabel.length > 0 && (parseInt(noLabel) > 100)) { // 编号到服务器
            $("body").append("<script charset='utf-8' type='text/javascript' async='' src='" + (saveApplyUrl + "&apply_no=" + noLabel + "&order_id=" + globalOrderJson.order.id) + "'></script>");
        } else {
            setTimeout(function () {
                saveApply();
            }, 1000);
        }
    });
}
//var intervalStartOrder = setInterval("startSubmit()", 1000);
// 获取顶部 事件
function addToolBarEvents() {
// 布局toolBarHtml<div class='yll-tool'><div class='ddc-insurance'>更新iframe</div><div class='ddc-finace'>开始测试</div><div class='ddc-customer'>客户基本信息</div></div>

    var contentToolBar = "<div class='ddc-start'><span class='ddc-reload-style'>开始提报</span></div><div class='ddc-reload'><span class='ddc-reload-style'>重新提报</span></div>"
    contentToolBar = contentToolBar + "<div class='ddc-customer'><span class='ddc-customer-style'>客户信息</span></div>";
    //    contentToolBar = "<div class='yll-tool'><div class='ddc-insurance'>更新iframe</div><div class='ddc-finace'>开始测试</div><div class='ddc-customer'>客户基本信息</div></div>" + contentToolBar;
    var tipMsgDiv = "<div class='ddc-tipmsg hidden'><p class='ddc-tiptext'></p></div>";
    contentToolBar = contentToolBar + tipMsgDiv;
    $("body").append(contentToolBar);
}
// 测试-> 保险信息

$('.ddc-insurance').live('click', function () {
    toalIframes.update();
    console.log(toalIframes.content);
});
// 测试-> 融资信息
$('.ddc-finace').live('click', function () {
    globalIndex = 93;
    performSubmit();
});
// 开始提报
$('.ddc-start').live('click', function () {
    performSubmit();
});
// 测试-> 客户信息
$('.ddc-customer').live('click', function () {
    globalIndex = 93;
    performSubmit();
});
// 重新提报
$('.ddc-reload').live('click', function () {
    window.location.reload();
});

/****************************************执行层*****************************************************************************/
