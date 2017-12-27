  //公共的回调函数
  function commonSuccessCallback(target, data,textStatus){
      $("#" + target).html(data);
  }
  
  /**
   * 弹出提示成功的消息
   */
  function alertSuccessMessage(msgText){
  	alertMessage(ROOT+'/static/images/screen.png',msgText,'growl-success');
  }
  
  /**
   * 弹出提示错误的消息
   */
  function alertErrorMessage(errorText){
  	alertMessage(ROOT+'/static/images/screen.png',errorText,'growl-danger');
  }

  /**
   * 刷新指定DIV区域，前提条件DIV含有URL属性值
   * 一般在用于分页显示的DIV，分页标签已经预设好URL属性值
   * @param targets 分页显示的DIV ID
   * @return 
   */
  function refreshDiv(targets){
      //alert("pageNo="+pageNo+";targets="+targets);
      if(targets==''||targets=='null'){
          alert('TODO');
      }else{
          var url=$("#"+targets).attr('url');
          //alert("org url="+url);
          ajaxGet(url,targets);
      }
  } 
  
  /**
   * AJAX Get调用，主要用于查询/刷新页面等请求
   *
   * @params url 请求的URL地址
   * @params target 响应信息输出显示的DIV ID名称
   * @params callback 可选参数，自定义的回调函数
   * @returns 
   */
  function ajaxGet(url, target, callback) {
//	  loadingDialog();
      url=getRandedURL(url);
      //debug("ajaxGet url="+url);
      $("#"+target).attr("url",url);
      $.get(url,null,function(data, textStatus) {
//    	  closeLoadingDialog();
              //alert("success");
              if(callback){
                  callCommon=callback(data);
                  if(callCommon){
                      commonSuccessCallback(target,data);
                  }
              }else{
                  commonSuccessCallback(target,data);
              }
      });
  }

  function ajaxGetJSON(url, callback){
  	$.getJSON(url,callback);
  }

  /**
   * AJAX Post调用，主要用于Form表单提交请求
   *
   * @params formId 提交Form表单对象的id
   * @returns 
   */
  function ajaxPost(formId,callback) {
      var optionsPost = {
          success: function(data, status){
      		if(callback){
      			callback(data);
      		}
          }
      };
      $("#"+formId).ajaxSubmit(optionsPost);
  }
  /**
   * 重写AJAX Post调用，主要用于Form表单,调用自己处理回调方法。
   *
   * @params formId 提交Form表单对象的id
   * @returns 
   */
  function ajaxPostFromCallBack(formId,callback) {
  	var optionsPost = {
  			success: callback
  	};
  	$("#"+formId).ajaxSubmit(optionsPost);
  }
  
  /**
   * AJAX Post调用，主要用于URL提交请求
   *
   * @params url 提交URL
   * @returns 
   */
  function ajaxPostURL(url,data,callback) {
  	  url=getRandedURL(url);
  	  loadingDialog();
      $.post(encodeURI(url),data,function(response, textStatus) {
    	closeLoadingDialog();
      	if(response.code == 200){
      		//alertSuccessMessage(response.msg);
      		if(callback){
      			callback(response);
      		}
      	}else{
      		alertErrorMessage(response.msg);
      	}
      });
  }
  
  function globalSubmitHandler(form,callback) {
	  loadingDialog();
      ajaxPost($(form).attr("id"),function(data){
    	closeLoadingDialog();
      	if(data.code=="200"){
      		alertSuccessMessage(data.msg);
      	}else{
      		alertErrorMessage(data.msg);
      	}  
  		if(callback){
  			callback(data);
  		}
      });
  }


  

  //由于浏览器对于相同URL请求会自动缓存页面，导致请求相同URL地址无法刷新页面。
  //因此为URL地址追加一个随机数，使每次请求的实际URL地址不一样，触发浏览器刷新页面
  function getRandedURL(url){
      return urlreplace(url,"_rand",new Date().getTime());
  }

  /**
   * 专门用于Search查询操作调用方法，主要用于Form表单提交请求
   *
   * @params formId 提交查询Form表单对象的id
   * @params target 响应信息输出显示的DIV ID名称
   * @returns 
   */
  function submitSearchRequest(formId,target){
	  loadingDialog();
      $("#"+formId+" input[type='text']").each(function(){
      	$(this).val($.trim($(this).val()).replace(new RegExp("'","gm"),"").replace(new RegExp("%","gm"),""));
      });        
      var formSerialize=$("#"+formId).serialize();
      var url=$("#"+formId).attr("action");
      url=getRandedURL(url);
      $.get(url,formSerialize,function(data, textStatus) {
    	  closeLoadingDialog();
          commonSuccessCallback(target,data); 
          $("#"+target).attr("url",url+"&"+formSerialize);
      });
  }
  var varLoadingDialog = null;
  function loadingDialog(title){
	 if(!title){
		 title = '正在处理中';
	 }
	 if(varLoadingDialog == null){
		 varLoadingDialog = dialog({
				width: 200,
				content:title + '<img src="'+ROOT+'/static/images/ajax_loader.gif"/>',
				height: 40
		 });
	 }
	 varLoadingDialog.showModal();
  }
  
  function closeLoadingDialog(){
	  if(varLoadingDialog != null){
		  varLoadingDialog.close().remove();
		  varLoadingDialog = null;
	  }
  }
  
  /**
   * 弹出提示窗口
   */
  function alertDialog(message,callback){
	  if(!message){
		  message = '没有设置提示消息';
	  }
	  var d = dialog({
			title: '提示消息',
			content: message,
			okValue: '确 定',
			ok: function () {
				this.close().remove();
				if(callback){
					callback();
				}
				return false;
			},
			cancelValue: '取消',
			cancel: function () {}
		});
		d.showModal();
  }
  
  /**
   * 提示消息，两秒后关闭
   * @param content
   */
  function alertDialogToColse(content){
	  var d = dialog({
		    title: '提示消息',
		    okValue: '确 定',
		    content: content,
		    ok: function () {},
		});
	  d.showModal();
  }
  
  //确认提示对话框
  function alertCofirmDialog(conent,callback){
	  var d = dialog({
		    title: '提示',
		    content: conent,
		    okValue: '确定',
		    ok: function () {
		    		callback();
		        return false;
		    },
		    cancelValue: '取消',
		    cancel: function () {}
		});
		d.showModal();
  }
  
  /**
   * 询问确认关闭弹出窗口函数
   *
   * @params dialogId 指定弹出窗口的唯一ID
   * @params msg 可选参数，关闭Confirm确认框提示的信息；如果没有提供则使用默认提示语句
   * @returns 
   */
  function closePopupDialog(dialogId, msg){
  	if(msg==undefined){
        if(confirm('你确认取消吗?')){
            closePopupDialogDirect(dialogId);
        }  		
  	}else{
        if(confirm(msg)){
            closePopupDialogDirect(dialogId);
        }   	
  	}

  }

  /**
   * 直接关闭弹出窗口函数
   * 
   * @params dialogId 指定弹出窗口的唯一ID
   * @returns 
   */
  function closePopupDialogDirect(dialogId){
      $("#"+dialogId).dialog('close');
  }


  //删除组织
  function deleteItem(url){
  	alertDialog('真的要删除该条记录吗？',function(){
  		url=getRandedURL(url);
  		ajaxPostURL(url,null,function(response){
  			alertSuccessMessage(response.msg);
  			refreshDiv("listDiv");
  		});
  	});
  }
  
  //删除组织
  function deleteItem(url,msg){
  	alertDialog(msg,function(){
  		url=getRandedURL(url);
  		ajaxPostURL(url,null,function(response){
  			alertSuccessMessage(response.msg);
  			refreshDiv("listDiv");
  		});
  	});
  }
  
  /**
   * 批量删除选择项目
   *
   * @params msg 显示的错误信息
   * @returns 
   */
  function deleteSelectItem(formId,url,successCallback){
  	if(checkSelectAll(formId)){
        if(confirm("确认删除所选项目?")){
        	var action=$("#"+formId).attr("action");
        	if(url!=undefined){
            	$("#"+formId).attr("action",url);
        	}
            ajaxPost(formId,function(data){
            	top.endBlockUI();
            	if(!data.type){
            		publishErrorContentPage(data);
            		return;
            	}
            	if(data.type=="success"){
            		publishMessage(data.message);
            		successCallback(data);
            	}else{
            		publishError(data.message);
            	} 
            });
            $("#"+formId).attr("action",action);
        }
  	}
  }
  
  /**
   * 批量处理选中行
   * @returns 
   */
  function processSelectItem(formId,url,successCallback){
  	if(checkSelectAll(formId)){
	        if(confirm("确认处理选中列表中的行.")){
	        	var action=$("#"+formId).attr("action");
	        	if(url!=undefined){
	            	$("#"+formId).attr("action",url);
	        	}
	            ajaxPost(formId,function(data){
	            	top.endBlockUI();
	            	if(!data.type){
	            		publishErrorContentPage(data);
	            		return;
	            	}
	            	if(data.type=="success"){
	            		publishMessage(data.message);
	            		successCallback(data);
	            	}else{
	            		publishError(data.message);
	            	} 
	            });
	            $("#"+formId).attr("action",action);
	        }
  	}
  }
  
  function submitFormByURL(formId,url,successCallback){
  	var action=$("#"+formId).attr("action");
  	if(url!=undefined){
      	$("#"+formId).attr("action",url);
  	}
      ajaxPost(formId,function(data){
      	if(!data.type){
      		publishErrorContentPage(data);
      		return;
      	}
      	if(data.type=="success"){
      		publishMessage(data.message);
      		successCallback(data);
      	}else{
      		publishError(data.message);
      	} 
      });
      $("#"+formId).attr("action",action);
  }

  /**
   * 选中一组Tab标签某个Tab作为焦点显示
   *
   * @params tabsId 标签DIV的ID
   * @params idx 控制的标签项的索引值，以0开头往后排
   * @returns 
   */
  function tabsSelectItem(tabsId,idx){
      $('#'+tabsId).tabs('option', 'selected',idx);
  }
  
  /**
   * Tabs标签初始化构造
   *
   * @params tabsId 标签DIV的ID
   * @returns 
   */
  function tabsInit(tabsId,selected){
	  if(!selected){
		  selected = 0;
	  }
	  $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
		  var target = $(e.target).attr("href"); // activated tab
		  var href = $(e.target).attr("target"); // activated tab
		  $('#target').html('');
		  loadingDialog();
		  ajaxGet(href,target,function(){
			  closeLoadingDialog();
			  return true;
		  });
	   });
	  $('#'+tabsId+' li:eq('+selected+') a').tab('show').trigger('shown.bs.tab');
  }
  
  function tabsSetOption(tabsId,option,idx,value){
  	$('#'+tabsId).tabs( option , idx , value );
  }
  
  /**
   * 将Tabs标签指定Tab重置，点击之后会触发重新刷新Tab显示信息
   *
   * @params tabsId 标签DIV的ID
   * @params idx 控制的标签项的索引值，以0开头往后排
   * @params newURL 该参数可选，如果指定则以新url作为标签url，否则取原有url添加随机数重置即可
   * @params withLoad 可选参数，如果为true则修改url之后load加载页面
   * @returns 
   */
  function tabsResetURL(tabsId,idx,newURL,withLoad){
  	var url="";
  	if(newURL==undefined||newURL==''){
  		url = $('#'+tabsId).tabs("getURL",idx);
  	}else{
  		url=newURL;
  	}	
  	url=getRandedURL(url);
  	$('#'+tabsId).tabs( 'url' , idx , url );
  	if(withLoad==true){
  		$('#'+tabsId).tabs("load",idx);
  	}
  	/*if(typeof newURL == "string" && $.trim(newURL) != ''){
  		var url = getRandedURL(newURL);
      	$('#'+tabsId).tabs( 'url' , idx , url );
  	}
  	if(withLoad == true){
  		$('#'+tabsId).tabs('option', 'ajaxOptions', { cache: false });
          $('#'+tabsId).tabs("load",selected);
          $('#'+tabsId).tabs('option', 'ajaxOptions', { cache: true });
  	}*/
  }

  /**
   * Disable一组Tab标签某个Tab
   *
   * @params tabsId 标签DIV的ID
   * @params idx 控制的标签项的索引值，以0开头往后排
   * @returns 
   */
  function tabsDisableItem(tabsId,idx){
      $('#'+tabsId).tabs('disable', idx);
  }
  
  /**
   * Enable一组Tab标签某个Tab
   *
   * @params tabsId 标签DIV的ID
   * @params idx 控制的标签项的索引值，以0开头往后排
   * @returns 
   */
  function tabsEnableItem(tabsId,idx){
      $('#'+tabsId).tabs('enable', idx);
  }

  /**
   * 刷新Tab标签当前选中Tab
   *
   * @params tabsId 标签DIV的ID
   * @returns 
   */
  function tabsRefreshCurrent(tabsId){
      var selected = $('#'+tabsId).tabs('option', 'selected');
  	$('#'+tabsId).tabs('option', 'ajaxOptions', { cache: false });
      $('#'+tabsId).tabs("load",selected);
      $('#'+tabsId).tabs('option', 'ajaxOptions', { cache: true });
  }    
  
    
    /**
     * 左补函数
     *
   * @param str
   * @param len 
   * @param pad
   * @return
     */
      function lpad(str,len,pad)
      {
      	var rs = "";
      	while (rs.length < len - str.length)
      	{
      		rs += pad;
   		}
      	return rs += str;
      }
      
      /**
       * 右补函数
       * @param str
     * @param len 
     * @param pad
     * @return
       */
        function rpad(str,len,pad)
        {	
      	  var rs = str;
          while (rs.length < len)
          {
          	rs += pad;
          }
          return rs;
        }
    
    function mes_calendar(field,button,format){
  	  if(!format)
  	  {
  		  format = "%Y-%m-%d";
  	  }
        var params = [];
        params["inputField"]=field;
        params["button"]=button;
        params["ifFormat"]=format;
        var cal = new Calendar.setup(params);
        return cal;
    }
    
    function mes_month_calendar(field,button,format){
  	  if(!format)
  	  {
  		  format = "%Y.%m";
  	  }
        var params = [];
        params["inputField"]=field;
        params["button"]=button;
        params["ifFormat"]=format;
        var cal = new Calendar.setup(params);
        return cal;
    }
    
    function mes_ext_calendar(field,button,format){
    	  if(!format)
    	  {
    		  format = "%Y.%m.%d";
    	  }
          var params = [];
          params["inputField"]=field;
          params["button"]=button;
          params["ifFormat"]=format;
          var cal = new Calendar.setup(params);
          return cal;
      }
    
    //日期(yyyy-MM-dd)起始日期不能大于结束日期
    function comprareDate(start,end){
		  var flag = false;
		  var separator = "-";
		  if(start.indexOf(".") != -1)
		  {
			separator = ".";
		  }
      var startArr=start.split(separator);  
      var endArr=end.split(separator);  
      var startDate=new Date(startArr[0],startArr[1],startArr[2]);  
      var endDate=new Date(endArr[0],endArr[1],endArr[2]);  
      if(startDate.getTime()>endDate.getTime()){   
      	flag = true;     
      }    
		return flag;
	}
    
  //日期(yyyy.MM)起始日期不能大于结束日期
    function comprareMonthDate(start,end){
		  var flag = false;
		  var separator = "-";
	  if(start.indexOf(".") != -1)
	  {
		separator = ".";
	  }
      var startArr=start.split(separator);  
      var endArr=end.split(separator);  
      var startDate=new Date(startArr[0],startArr[1]);  
      var endDate=new Date(endArr[0],endArr[1]);  
      if(startDate.getTime()>endDate.getTime()){   
      	flag = true;     
      }    
		return flag;
	}
    
  //进入主页初始化显示列表的高度
    var init_list_height = function(){
   	//获取父级显示内容区域高度
   	var parentHeight = $('#mainContent',$(window.parent.document)).height();
   	if(!parentHeight)
   	  parentHeight = $('#center',$(window.parent.document)).height();
   	$(".ui-list-right").css('height',parentHeight-8);
   	//查询占用的高度
   	var search_height = $('.ui-table-search-body').height() + 25;
   	//28：为工具栏占用的高度
   	var cent_height = parentHeight - search_height - 20;
   	//内容列表显示的高度
   	$(".ui-table-list-body").css({'height':cent_height});
    };
    
    /**
     * 利用导出excel标签导出处理的js
     * @param formId
     * zhongjingquan 2012-08-24
     */
    function exportExcel(listFormId,formId){
  	//判断选择的导出模式 
	var exportModle = $("#"+formId).find("input[name='jxlsEntity.exportModel']:checked:enabled").val();
	if(exportModle == 1){
		var selectedSids = "";
		$("#"+listFormId,$(childxx)).find("input[name^='selectItems']:checked:enabled").each(function(i,n){
  			if(selectedSids)
  			{
  				selectedSids += ","+$(n).val();
  			}
  			else
  			{
  				selectedSids = $(n).val();
  			}
  		});
  		if(selectedSids == ""){
  			alert("没有选择要导出的记录,请选择要导出的记录...");
  			return;
  		}
  		$("#"+formId).find("input[name='jxlsEntity.selectedSids']").val(selectedSids);
	}else if(exportModle == 3){
		var startPageNo = $("#"+formId).find("input[name='jxlsEntity.startPageno']").val();
		var endPageNO = $("#"+formId).find("input[name='jxlsEntity.endPageno']").val();
		var totalPages = paseInt($("#"+formId).find("input[name='totalRows']").val());
		var reg = new RegExp("^[[1-9]+[0-9]*]*$");
	    if(!reg.test(startPageNo)){
	        alert("请输入正确的开始导出页数!");
	        return;
	    }else if(!reg.test(endPageNO)){
	    	alert("请输入正确的结束导出页数!");
	    	return;
	    }else if(endPageNO > totalRows){
	    	alert("结束页不能大于总页数，总页数为："+totalPages+",请重新输入..");
	    	return;
	    }
	    if(startPageNo > endPageNO){
	    	alert("开始的页数不能大于结束的页数!");
	    	return;
	    }
	}
	var tempaction = $("#"+formId).attr("action");
	$("#"+formId).attr("disabled","true");
	$("#progressBar2").show();
	ajaxPost(formId,function(data){
		$("#"+formId).attr("disabled","");
		$("#progressBar2").html('');
  		$("#progressBar2").hide();
		if(!data.type){
      		publishErrorContentPage(data);
      		return;
      	}
      	if(data.type=="success"){
      		var action  = $("#"+formId).attr("action");
      		var templateFilename = $("#"+formId).find("input[name='jxlsEntity.templateFilename']").val();
      		action = action.substring(0,action.indexOf('!')+1)+"downLoadExcles.action?tempDir="+data.message+"&templateFilename="+templateFilename;
      		$("#"+formId).attr("action",action);
      		$("#"+formId).submit();
      		$("#"+formId).attr("action",tempaction);
      	}else{
      		alert("excel导出失败.");
      		return;
      	}
	});
  }
  //除法函数，用来得到精确的除法结果
  //说明：javascript的除法结果会有误差，在两个浮点数相除的时候会比较明显。这个函数返回较为精确的除法结果。
  //调用：accDiv(arg1,arg2)
  //返回值：arg1除以arg2的精确结果
  function accDiv(arg1,arg2){
      var t1=0,t2=0,r1,r2;
      try{t1=arg1.toString().split(".")[1].length}catch(e){}
      try{t2=arg2.toString().split(".")[1].length}catch(e){}
      with(Math){
          r1=Number(arg1.toString().replace(".",""));
          r2=Number(arg2.toString().replace(".",""));
          return (r1/r2)*pow(10,t2-t1);
      }
  }
  //给Number类型增加一个div方法，调用起来更加方便。
  Number.prototype.div = function (arg){
      return accDiv(this, arg);
  };
  //乘法函数，用来得到精确的乘法结果
  //说明：javascript的乘法结果会有误差，在两个浮点数相乘的时候会比较明显。这个函数返回较为精确的乘法结果。
  //调用：accMul(arg1,arg2)
  //返回值：arg1乘以arg2的精确结果
  function accMul(arg1,arg2)
  {
      var m=0,s1=arg1.toString(),s2=arg2.toString();
      try{m+=s1.split(".")[1].length}catch(e){}
      try{m+=s2.split(".")[1].length}catch(e){}
      return Number(s1.replace(".",""))*Number(s2.replace(".",""))/Math.pow(10,m);
  }
  //给Number类型增加一个mul方法，调用起来更加方便。
  Number.prototype.mul = function (arg){
      return accMul(arg, this);
  };
  //加法函数，用来得到精确的加法结果
  //说明：javascript的加法结果会有误差，在两个浮点数相加的时候会比较明显。这个函数返回较为精确的加法结果。
  //调用：accAdd(arg1,arg2)
  //返回值：arg1加上arg2的精确结果
  function accAdd(arg1,arg2){
      var r1,r2,m;
      try{r1=arg1.toString().split(".")[1].length}catch(e){r1=0}
      try{r2=arg2.toString().split(".")[1].length}catch(e){r2=0}
      m=Math.pow(10,Math.max(r1,r2));
      return (arg1*m+arg2*m)/m;
  }
  //给Number类型增加一个add方法，调用起来更加方便。
  Number.prototype.add = function (arg){
      return accAdd(arg,this);
  }
  //减法函数
  function accSub(arg1,arg2){
       var r1,r2,m,n;
       try{r1=arg1.toString().split(".")[1].length}catch(e){r1=0}
       try{r2=arg2.toString().split(".")[1].length}catch(e){r2=0}
       m=Math.pow(10,Math.max(r1,r2));
       //last modify by deeka
       //动态控制精度长度
       n=(r1>=r2)?r1:r2;
       return ((arg2*m-arg1*m)/m).toFixed(n);
  }
  ///给number类增加一个sub方法，调用起来更加方便
  Number.prototype.sub = function (arg){
      return accSub(arg,this);
  }
  
  /**
   * 初始化下拉列表，远程数据
   * @param target
   * 		下拉对象
   * @param title
   * 		标题
   * @param url
   * 		请求的url
   */
  function initRemoteDataSelect2(target,title,url,isMultiple,minimumInputLength,format){
	  console.log(123)
	  if(!isMultiple){
		  isMultiple = false;
	  }
	  if(!minimumInputLength){
		  minimumInputLength = 1;
	  }
	  $("#"+target).select2({
		    placeholder: title,
		    multiple: isMultiple,
		    minimumInputLength: minimumInputLength,
		    ajax: {
		        url: url,
		        dataType: 'json',
		        quietMillis: 250,
		        data: function (term, page) {
		            return {
		                q: term,
		                pageNo:page,
		                faCode:20,
		                pageLimit:10
		            };
		        },
		        results: function (data, page) { 
		            return { results: data.results,more:data.more};
		        },
		        cache: true
		    },
		    initSelection: function(element, callback) {
		    	console.log(12)
		        // the input tag has a value attribute preloaded that points to a preselected repository's id
		        // this function resolves that id attribute to an object that select2 can render
		        // using its formatResult renderer - that way the repository name is shown preselected
		        /* var id = '${organization.orgParentSid}'; */
		        var id = $(element).val();
		        //console.log('============id:'+id);
		        if (id !== "" && id != "0") {
		        	//var initSelectUrl = urlreplace(url,"sidstr",id);
		            $.ajax(url, {
		                dataType: "json",
		                type: 'GET',
		                data:{sidstr:id}
		            }).done(function(data) { callback(data.results);});
		        }
		    },
		    formatResult: format,
		    formatSelection: format,
		    dropdownCssClass: "bigdrop", // apply css that makes the dropdown taller
		    escapeMarkup: function (m) { return m; } // we do not want to escape markup since we are displaying html in results
		});
  }

  /**
   * 初始化下拉列表，远程数据-带级联功能
   * @param target
   * 		下拉对象
   * @param title
   * 		标题
   * @param url
   * 		请求的url
   */
  function initRemoteDataSelect2Cascade(target,title,url,father,isMultiple,minimumInputLength,format){
	  if(!isMultiple){
		  isMultiple = false;
	  }
	  if(!minimumInputLength){
		  minimumInputLength = 1;
	  }
	  var fInput = $("#"+father)
	  $("#"+target).select2({
		    placeholder: title,
		    multiple: isMultiple,
		    minimumInputLength: minimumInputLength,
		    ajax: {
		        url: url,
		        dataType: 'json',
		        quietMillis: 250,
		        data: function (term, page) {
		            return {
		                q: term,
		                pageNo:page,
		                faCode:fInput.val(),
		                pageLimit:10
		            };
		        },
		        results: function (data, page) { 
		        	if(data.more == 'true'){
		        		alert("请选择FA经销商！");
		        	}
		            return { results: data.results,more:data.more};
		        },
		        cache: true
		    },
		    initSelection: function(element, callback) {
		        // the input tag has a value attribute preloaded that points to a preselected repository's id
		        // this function resolves that id attribute to an object that select2 can render
		        // using its formatResult renderer - that way the repository name is shown preselected
		        /* var id = '${organization.orgParentSid}'; */
		        var id = $(element).val();
		        //console.log('============id:'+id);
		        if (id !== "" && id != "0") {
		        	//var initSelectUrl = urlreplace(url,"sidstr",id);
		            $.ajax(url, {
		                dataType: "json",
		                type: 'GET',
		                data:{sidstr:id}
		            }).done(function(data) { callback(data.results);});
		        }
		    },
		    formatResult: format,
		    formatSelection: format,
		    dropdownCssClass: "bigdrop", // apply css that makes the dropdown taller
		    escapeMarkup: function (m) { return m; } // we do not want to escape markup since we are displaying html in results
		});
  }

  /**
   * 初始化下拉列表，远程数据-带级联功能
   * @param target
   * 		下拉对象
   * @param title
   * 		标题
   * @param url
   * 		请求的url
   */
  function initRemoteDataSelect2Father(target,title,url,father,msgtext,isMultiple,minimumInputLength,format){
	  if(!isMultiple){
		  isMultiple = false;
	  }
	  if(!minimumInputLength){
		  minimumInputLength = 1;
	  }
	  var fInput = $("#"+father)
	  $("#"+target).select2({
		    placeholder: title,
		    multiple: isMultiple,
		    minimumInputLength: minimumInputLength,
		    ajax: {
		        url: url,
		        dataType: 'json',
		        quietMillis: 250,
		        data: function (term, page) {
		            return {
		                q: term,
		                pageNo:page,
		                father:fInput.val(),
		                pageLimit:10
		            };
		        },
		        results: function (data, page) { 
		        	if(data.more == 'true'){
		        		
		        	}
		            return { results: data.results,more:data.more};
		        },
		        cache: true
		    },
		    initSelection: function(element, callback) {
		        // the input tag has a value attribute preloaded that points to a preselected repository's id
		        // this function resolves that id attribute to an object that select2 can render
		        // using its formatResult renderer - that way the repository name is shown preselected
		        /* var id = '${organization.orgParentSid}'; */
		        var id = $(element).val();
		        //console.log('============id:'+id);
		        if (id !== "" && id != "0") {
		        	//var initSelectUrl = urlreplace(url,"sidstr",id);
		            $.ajax(url, {
		                dataType: "json",
		                type: 'GET',
		                data:{sidstr:id}
		            }).done(function(data) { callback(data.results);});
		        }
		    },
		    formatResult: format,
		    formatSelection: format,
		    dropdownCssClass: "bigdrop", // apply css that makes the dropdown taller
		    escapeMarkup: function (m) { return m; } // we do not want to escape markup since we are displaying html in results
		});
  }
  
  /**
   * 初始化Dropzone上传图片控件
   * @param target
   * 		触发按钮
   * @param previewThumbnail
   * 		预览缩略图
   * @param hideInput
   * 		隐藏返回的值
   * @param thumbnailWidth
   * 		缩略图宽
   * @param thumbnailHeight
   * 		缩略图高
   */
  function initDropzoneUploadPicture(target,previewThumbnail,hideInput,thumbnailWidth,thumbnailHeight){
	  if(!thumbnailHeight){
		  thumbnailHeight = 100;
	  }
	  if(!thumbnailWidth){
		  thumbnailWidth = 100;
	  }
	  var hidePreviewDiv = $('<div class="hidePreviewDiv" style="display:none"></div>');
	  $('#'+previewThumbnail).parent().append(hidePreviewDiv);
	  var thumbnail = $('#'+previewThumbnail).attr('src');
	  var isShowThumbai = true;
	  Dropzone.autoDiscover = true;
	    var myDropzone = new Dropzone("#"+target,
	    	{ 
	    		url: "/api/v1/upload/picture.json",
	    		method:"POST",
	    		thumbnailWidth:thumbnailWidth,
	    		thumbnailHeight:thumbnailHeight,
	    		maxFilesize: 5,
	    		
	    		previewsContainer:'.hidePreviewDiv',
	    		init: function() {
	                this.on("success", function(file,result) {
	                	closeLoadingDialog();
	                	if(result.code == 200){
	                		$('#'+hideInput).val(result.data[0].sid);
	                	}else{
	                		alertErrorMessage(result.msg);
	                	}
	                });
	                this.on("removedfile", function(file) {
	                	
	                });
	                this.on("thumbnail", function(file,tempThumbnail) {
	                	if(isShowThumbai)
	                		$('#'+previewThumbnail).attr('src',tempThumbnail);
	                });
	            }
	    	}
	    );
	    myDropzone.on("addedfile", function(file) {
	    	if($('#'+hideInput)){
	  		  var sid = $('#'+hideInput).val();
	  		  if(sid != ''){
	  			isShowThumbai = false;
	  			myDropzone.removeFile(file);
	  			alertDialogToColse('图片已存在，请删除图片！');
	  			  return;
	  		  }else{
	  			loadingDialog('正在上传中');
	  			isShowThumbai = true;
	  		  }
	  	  }else{
	  		isShowThumbai = true;
	  	  }
	      
	    });
	    myDropzone.on("complete", function(file) {
	    	myDropzone.removeFile(file);
	    });
  }
  
  /**
   * 初始化Dropzone上传图片控件-批量上传
   * @param target
   * 		触发按钮
   * @param previewThumbnail
   * 		预览缩略图
   * @param hideInput
   * 		隐藏返回的值
   * @param thumbnailWidth
   * 		缩略图宽
   * @param thumbnailHeight
   * 		缩略图高
   * 
   * 
   * @param  acceptedFiles:'image/*',
   *   控制上传文件类型
   */
  function initDropzoneUploadPictureList(target,previewThumbnail,tablesid,fileTypeid,fileTypeName,thumbnailWidth,thumbnailHeight){
	  if(!thumbnailHeight){
		  thumbnailHeight = 100;
	  }
	  if(!thumbnailWidth){
		  thumbnailWidth = 100;
	  }

	  
	  var hidePreviewDiv = $('<div class="hidePreviewDiv" style="display:none"></div>');
	  $('#'+previewThumbnail).parent().append(hidePreviewDiv);
	  var isShowThumbai = true;
	  Dropzone.autoDiscover = true;
	    var myDropzone = new Dropzone("#"+target,
	    	{ 
	    		url: "/api/v1/upload/picture.json",
	    		method:"POST",
	    		thumbnailWidth:thumbnailWidth,
	    		thumbnailHeight:thumbnailHeight,
	    		maxFilesize: 5,
	    	
	    		previewsContainer: '.hidePreviewDiv',
	    		init: function() {
	                this.on("success", function(file,result) {
	                	closeLoadingDialog();
	                	if(result.code == 200){
	                		$('#'+file.id+'fileSid').val(result.data[0].sid);
	                		$('#'+file.id+'status').text('上传成功-等待提交');
	                	}else{
	                		$('#'+file.id+'status').text('上传失败');
	                		$("#"+file.id).remove();
	                		alertErrorMessage(result.msg);
	                	}
	                });
	                this.on("removedfile", function(file) {
	                	
	                });
	                this.on("thumbnail", function(file,tempThumbnail) {
	                	
	                });
	                this.on("error", function(file,s,x) {
	                	$('#'+file.id+'status').text('上传失败');
	                	$("#"+file.id).remove();
	                	alertErrorMessage("错误！"+s);
	                });
	            }
	    	}
	    );
	    myDropzone.on("addedfile", function(file) {
	    	file.id = (new Date()).valueOf(); //时间
	    	 var orgFileType = $("#"+fileTypeid).find('option:selected').text();
	    	 var orgFileName = $('#'+fileTypeName).val();
	    	 if (typeof(orgFileName) == "undefined") {
	    		 orgFileName='';
	    	 }else{
	    		 orgFileType = orgFileType+'-'+orgFileName;
	    	 }
	    	var htmlText =$('<tr class="asterisk" id="'+file.id+'">');
	    	htmlText.append('<td><span class="asterisk">'+file.name+'</span><input type="hidden" id="'+file.id+'fileSid" name="fileContent" value=""><input type="hidden" id="'+file.id+'fileType" name="orderFileType" value="'+orgFileType+'"></td>');
	    	htmlText.append('<td>'+orgFileType+'-'+orgFileName+'</td>');
	    	htmlText.append('<td>'+file.size+'</td>');
	    	htmlText.append('<td id="'+file.id+'status">上传中</td>');
	    	htmlText.append('<td class="table-action"> <a href="javascript:postOrderFile('+file.id+')" data-toggle="tooltip" title="上传" class="tooltips" ><i class="fa  fa-cloud-upload"></i></a>  <a href="javascript:deleteFileBySid('+file.id+')" data-toggle="tooltip" title="取消" class="delete-row tooltips"><i class="fa fa-trash-o"></i></a></td></tr>');
	    
	    	 $("#"+tablesid).prepend(htmlText)
	    });
	    myDropzone.on("complete", function(file) {
	    	myDropzone.removeFile(file);
	    });
  }
  
  /**
   * 初始化Dropzone上传图片控件-批量上传
   * @param target
   * 		触发按钮
   * @param previewThumbnail
   * 		预览缩略图
   * @param hideInput
   * 		隐藏返回的值
   * @param thumbnailWidth
   * 		缩略图宽
   * @param thumbnailHeight
   * 		缩略图高
   */
  function initDropzoneUploadPdfList(target,previewThumbnail,tablesid,fileTypeid,fileTypeName,thumbnailWidth,thumbnailHeight){

	  if(!thumbnailHeight){
		  thumbnailHeight = 100;
	  }
	  if(!thumbnailWidth){
		  thumbnailWidth = 100;
	  }

	  
	  var hidePreviewDiv = $('<div class="hidePreviewDiv" style="display:none"></div>');
	  $('#'+previewThumbnail).parent().append(hidePreviewDiv);
	  var isShowThumbai = true;
	  Dropzone.autoDiscover = true;
	    var myDropzone = new Dropzone("#"+target,
	    	{ 
	    		url: "/api/v1/upload/doc.json",
	    		method:"POST",
	    		thumbnailWidth:thumbnailWidth,
	    		thumbnailHeight:thumbnailHeight,
	    		maxFilesize: 20,
	    		previewsContainer: '.hidePreviewDiv',
	    		init: function() {
	                this.on("success", function(file,result) {
	                	closeLoadingDialog();
	                	if(result.code == 200){
	                		$('#'+file.id+'fileSid').val(result.data[0].sid);
	                		$('#'+file.id+'status').text('上传成功-等待提交');
	                	}else{
	                		$('#'+file.id+'status').text('上传失败');
	                		$("#"+file.id).remove();
	                		alertErrorMessage(result.msg);
	                	}
	                });
	                this.on("removedfile", function(file) {
	                	
	                });
	                this.on("thumbnail", function(file,tempThumbnail) {
	                	
	                });
	                this.on("error", function(file,s) {
	                	$('#'+file.id+'status').text('上传失败');
	                	$("#"+file.id).remove();
	                	alertErrorMessage("错误！"+s);
	                });
	            }
	    	}
	    );
	    myDropzone.on("addedfile", function(file) {
	    	file.id = (new Date()).valueOf(); //时间
	    	 var orgFileType = $("#"+fileTypeid).find('option:selected').text();
	    	 var orgFileName = $('#'+fileTypeName).val();
	    	 if (typeof(orgFileName) == "undefined") {
	    		 orgFileName='';
	    	 }else{
	    		 orgFileType = orgFileType+'-'+orgFileName;
	    	 }
	    	var htmlText =$('<tr class="asterisk" id="'+file.id+'">');
	    	htmlText.append('<td><span class="asterisk">'+file.name+'</span><input type="hidden" id="'+file.id+'fileSid" name="fileContent" value=""><input type="hidden" id="'+file.id+'fileType" name="orderFileType" value="'+orgFileType+'"></td>');
	    	htmlText.append('<td>'+orgFileType+'-'+orgFileName+'</td>');
	    	htmlText.append('<td>'+file.size+'</td>');
	    	htmlText.append('<td id="'+file.id+'status">上传中</td>');
	    	htmlText.append('<td class="table-action"> <a href="javascript:postOrderFile('+file.id+')" data-toggle="tooltip" title="上传" class="tooltips" ><i class="fa  fa-cloud-upload"></i></a>  <a href="javascript:deleteFileBySid('+file.id+')" data-toggle="tooltip" title="取消" class="delete-row tooltips"><i class="fa fa-trash-o"></i></a></td></tr>');
	    
	    	 $("#"+tablesid).prepend(htmlText)
	    });
	    myDropzone.on("complete", function(file) {
	    	myDropzone.removeFile(file);
	    });
  }
  
  
  
  
  
  
  
  
  /**
   * 初始化Dropzone上传压缩包控件
   * @param target
   * 		触发按钮
   * @param previewThumbnail
   * 		预览缩略图
   * @param hideInput
   * 		隐藏返回的值
   * @param thumbnailWidth
   * 		缩略图宽
   * @param thumbnailHeight
   * 		缩略图高
   */
  function initDropzoneUploadPdfList3(target,previewThumbnail,tablesid,fileTypeid,fileTypeName,thumbnailWidth,thumbnailHeight){
	  if(!thumbnailHeight){
		  thumbnailHeight = 100;
	  }
	  if(!thumbnailWidth){
		  thumbnailWidth = 100;
	  }

	  
	  var hidePreviewDiv = $('<div class="hidePreviewDiv" style="display:none"></div>');
	  $('#'+previewThumbnail).parent().append(hidePreviewDiv);
	  var isShowThumbai = true;
	  Dropzone.autoDiscover = true;
	    var myDropzone = new Dropzone("#"+target,
	    	{ 
	    		url: "/api/v1/upload/zip.json",
	    		method:"POST",
	    		thumbnailWidth:thumbnailWidth,
	    		thumbnailHeight:thumbnailHeight,
	    		maxFilesize: 100,
	    		previewsContainer: '.hidePreviewDiv',
	    		init: function() {
	                this.on("success", function(file,result) {
	                	closeLoadingDialog();
	                	if(result.code == 200){
	                		$('#'+file.id+'fileSid').val(result.data[0].sid);
	                		$('#'+file.id+'status').text('上传成功-等待提交');
	                	}else{
	                		$('#'+file.id+'status').text('上传失败');
	                		$("#"+file.id).remove();
	                		alertErrorMessage(result.msg);
	                	}
	                });
	                this.on("removedfile", function(file) {
	                	
	                });
	                this.on("thumbnail", function(file,tempThumbnail) {
	                	
	                });
	                this.on("error", function(file,s) {
	                	$('#'+file.id+'status').text('上传失败');
	                	$("#"+file.id).remove();
	                	alertErrorMessage("错误！"+s);
	                });
	            }
	    	}
	    );
	    myDropzone.on("addedfile", function(file) {
	    	file.id = (new Date()).valueOf(); //时间
	    	 var orgFileType = $("#"+fileTypeid).find('option:selected').text();
	    	 var orgFileName = $('#'+fileTypeName).val();
	    	 if (typeof(orgFileName) == "undefined") {
	    		 orgFileName='';
	    	 }else{
	    		 orgFileType = orgFileType+'-'+orgFileName;
	    	 }
	    	var htmlText =$('<tr class="asterisk" id="'+file.id+'">');
	    	htmlText.append('<td><span class="asterisk">'+file.name+'</span><input type="hidden" id="'+file.id+'fileSid" name="fileContent" value=""><input type="hidden" id="'+file.id+'fileType" name="orderFileType" value="'+orgFileType+'"></td>');
	    	htmlText.append('<td>'+orgFileType+'-'+orgFileName+'</td>');
	    	htmlText.append('<td>'+file.size+'</td>');
	    	htmlText.append('<td id="'+file.id+'status">上传中</td>');
	    	htmlText.append('<td class="table-action"> <a href="javascript:postOrderFile('+file.id+')" data-toggle="tooltip" title="上传" class="tooltips" ><i class="fa  fa-cloud-upload"></i></a>  <a href="javascript:deleteFileBySid('+file.id+')" data-toggle="tooltip" title="取消" class="delete-row tooltips"><i class="fa fa-trash-o"></i></a></td></tr>');
	    
	    	 $("#"+tablesid).prepend(htmlText)
	    });
	    myDropzone.on("complete", function(file) {
	    	myDropzone.removeFile(file);
	    });
  }
  /**
   * 初始化删除图片
   * @param target
   * @param source
   */
  function initDeleteDropzoneUploadPicture(target,previewThumbnail,hideInput,width,height){
	  if($('#'+target)){
		  if(!width){
			  width = 100;
		  }
		  if(!height){
			  height = 100;
		  }
		  $('#'+target).bind('click',function(){
			  var sid = "";
			  if($('#'+hideInput)){
				  sid = $('#'+hideInput).val();
			  }
			  if(sid == ""){
				  alertDialogToColse('没有存在的图片，请选择图片');
				  return;
			  }
			  var url = "/api/v1/upload/delete/"+sid+".json";
			  ajaxPostURL(url,null,function(result){
				  if(result.code == 200){
					  $('#'+hideInput).val('');
					  $('#'+previewThumbnail).attr('src','http://www.placehold.it/'+width+'x'+height+'/EFEFEF/AAAAAA');
				  }else{
					  alertErrorMessage(result.msg);
				  }
			  });
		  });
	  }
  }
  
  
  /**
   * 初始化Dropzone上传图片控件 返回fileUrl
   * @param target
   * 		触发按钮
   * @param previewThumbnail
   * 		预览缩略图
   * @param hideInput
   * 		隐藏返回的值
   * @param thumbnailWidth
   * 		缩略图宽
   * @param thumbnailHeight
   * 		缩略图高
   */
  function initDropzoneUploadPictureFileUrl(target,previewThumbnail,callback,imgName,rooUrl,thumbnailWidth,thumbnailHeight){
	  if(!thumbnailHeight){
		  thumbnailHeight = 100;
	  }
	  if(!thumbnailWidth){
		  thumbnailWidth = 100;
	  }
	//  var thumbnail = $('#'+previewThumbnail).attr('src');
	  var isShowThumbai = false;
	  Dropzone.autoDiscover = true;
	    var myDropzone = new Dropzone("#"+target,
	    	{ 
	    		url: "/api/v1/upload/picture.json",
	    		method:"POST",
	    		thumbnailWidth:thumbnailWidth,
	    		thumbnailHeight:thumbnailHeight,
	    		maxFilesize: 5,
	    		
	    		previewsContainer:'.hidePreviewDivs',
	    		init: function() {
	                this.on("success", function(file,result) {
	                	closeLoadingDialog();
	                	if(result.code == 200){ 
	                		callback(target,result.data[0].fileUrl);
	                		var imgDiv = $('<div id="'+result.data[0].sid+'" class="col-md-3 document"><div class="thmb"><div class="thmb-prev"><img src="'+rooUrl+'/'+result.data[0].fileUrl+'" class="img-responsive" alt="" style="height:400px"></div><h5 onclick="imgdelcallback("'+previewThumbnail+'","'+result.data[0].sid+'","'+target+'")" class="fm-title" style="text-align: center;">'+imgName+'<span style="margin-left:10px" class="badge badge-danger">X</span></h5></div></div');
	                		$('#'+previewThumbnail).append(imgDiv);
	                	}else{
	                		alertErrorMessage(result.msg);
	                	}
	                });
	                this.on("removedfile", function(file) {
	                });
	                this.on("thumbnail", function(file,tempThumbnail) {
	                	if(isShowThumbai)
	                		$('#'+previewThumbnail).attr('src',tempThumbnail);
	                });
	            }
	    	}
	    );
	    myDropzone.on("addedfile", function(file) {
	  			loadingDialog('正在上传中');
	    });
	    myDropzone.on("complete", function(file) {
	    	myDropzone.removeFile(file);
	    });
  }
  
  /**
   * 初始化删除图片
   * @param target
   * @param source
   */
  function initDeleteDropzoneUploadPictureFileUrl(target,previewThumbnail,hideInput,width,height){
	  if($('#'+target)){
		  if(!width){
			  width = 100;
		  }
		  if(!height){
			  height = 100;
		  }
		  $('#'+target).bind('click',function(){
			  var fileUrl = "";
			  if($('#'+hideInput)){
				  fileUrl = $('#'+hideInput).val();
			  }
			  if(fileUrl == ""){
				  alertDialogToColse('没有存在的图片，请选择图片');
				  return;
			  }
			  var url = "/api/v1/upload/deleteFileUrl/"+fileUrl+".json";
			  ajaxPostURL(url,null,function(result){
				  if(result.code == 200){
					  $('#'+hideInput).val('');
					  $('#'+previewThumbnail).attr('src','http://www.placehold.it/'+width+'x'+height+'/EFEFEF/AAAAAA');
				  }else{
					  alertErrorMessage(result.msg);
				  }
			  });
		  });
	  }
  }
  
  /**
   * 删除图片方法
   * @param imgDiv
   * @param callback
   */
  function delImgFileUrl(imgId,imgDiv,target,fileUrl,callback){
	  alert("fileUrl=--=");
	  var dcDiv =   $('#'+imgDiv);
	  var url = "/api/v1/upload/deleteFileUrl.json";
	  var date = "{'fileUrl':'"+fileUrl+"'}";
	  ajaxPostURL(url,null,function(result){
		  if(result.code == 200){
			  $('#'+imgId).remove(dcDiv);
			  callback(target,fileUrl);
		  }else{
			  alertErrorMessage(result.msg);
		  }
		 });
  }
  

  
  function timeStamp2String(time){
      var datetime = new Date();
      datetime.setTime(time);
      var year = datetime.getFullYear();
      var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
      var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
      var hour = datetime.getHours()< 10 ? "0" + datetime.getHours() : datetime.getHours();
      var minute = datetime.getMinutes()< 10 ? "0" + datetime.getMinutes() : datetime.getMinutes();
      var second = datetime.getSeconds()< 10 ? "0" + datetime.getSeconds() : datetime.getSeconds();
      //return year + "-" + month + "-" + date+" "+hour+":"+minute+":"+second;
      return year + "-" + month + "-" + date;
  }
  
function initMyDropzoneUploadPicture(target,previewThumbnail,hideInput,thumbnailWidth,thumbnailHeight,callback){
	  if(!thumbnailHeight){
		  thumbnailHeight = 100;
	  }
	  if(!thumbnailWidth){
		  thumbnailWidth = 100;
	  }
	  var hidePreviewDiv = $('<div class="hidePreviewDiv" style="display:none"></div>');
	  $('#'+previewThumbnail).parent().append(hidePreviewDiv);
	  var thumbnail = $('#'+previewThumbnail).attr('src');
	  var isShowThumbai = true;
	  Dropzone.autoDiscover = true;
	    var myDropzone = new Dropzone("#"+target,
	    	{ 
	    		url: "/api/v1/upload/picture.json",
	    		method:"POST",
	    		thumbnailWidth:thumbnailWidth,
	    		thumbnailHeight:thumbnailHeight,
	    		maxFilesize: 5,
	    		
	    		previewsContainer:'.hidePreviewDiv',
	            error:function(file,msg) {
            		alertErrorMessage(msg);
                },
                success: function (file, result) {
                	closeLoadingDialog();
                	if(result.code == 200){
                		$('#'+hideInput).val(result.data[0].sid);
                		callback();
                	}else{
                		alertErrorMessage(result.msg);
                	}
                }
	    	}
	    );
	    myDropzone.on("complete", function(file) {
	    	myDropzone.removeFile(file);
	    });
}