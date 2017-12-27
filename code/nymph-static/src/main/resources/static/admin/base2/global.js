function urlreplace(url,paramname,paramvalue){
	if(typeof url !== "string"){
		return;
	}
    var index = url.indexOf("?");
    if(index==-1){
        url = url + "?" + paramname + "=" + paramvalue;
    }else{
        var s1 = url.split("?");
        var params = s1[1].split("&");
        var pn = "";
        var flag = false;
        for(var i=0;i<params.length;i++){
            pn = params[i].split("=")[0];
            if(pn==paramname){
                params[i]=paramname+"="+paramvalue;
                flag = true;
                break;
            }
        }
        if(!flag){
            url = url + "&" + paramname + "=" + paramvalue;
        }else{
        url = s1[0] + "?";
            for(i=0;i<params.length;i++){
                if(i>0){
                    url = url + "&";
                }
                url = url + params[i];
            }
        }
        
    }
    return url;
}   
/**
 * 返回指定名称参数的值
 * @param url 获取参数值名称 paraStr
 * @return varule
 */
function getQueryString(url,paraStr) {
	/*
	var reg = new RegExp("(^|&)" + paraStr + "=([^&]*)(&|$)", "i");    
	var r = url.match(reg);    
	if (r != null)
		return unescape(r[2]); 
	return '';   */
	var result = "";
    //获取URL中全部参数列表数据
    var str = "&" + url.indexOf("?") > 0 ? url.split("?")[1] : url;
    var paraName = paraStr + "=";
    //判断要获取的参数是否存在
    if(str.indexOf("&"+paraName)!=-1)
    {
        //如果要获取的参数到结尾是否还包含“&”
        if(str.substring(str.indexOf(paraName),str.length).indexOf("&")!=-1)
        {
            //得到要获取的参数到结尾的字符串
            var TmpStr=str.substring(str.indexOf(paraName),str.length);
            //截取从参数开始到最近的“&”出现位置间的字符
            result=TmpStr.substr(TmpStr.indexOf(paraName),TmpStr.indexOf("&")-TmpStr.indexOf(paraName));  
        }
        else
        {  
            result=str.substring(str.indexOf(paraName),str.length);  
        }
    }  
    else
    {
        return "";  
    }
    return (result.replace("&","").split("=")[1]); 
}

function setPage(pageNo,targets){
    //alert("pageNo="+pageNo+";targets="+targets);
    if(targets==''||targets=='null'){
        alert('TODO');
    }else{
        var url=$("#"+targets).attr('url');
        //alert("org url="+url);
        url=urlreplace(url,"pageNo",pageNo);
      //保存翻页信息到目标层
        $("#"+targets).attr("url",url);
        //alert("repalced url="+url);
        ajaxGet(url,targets);
    }
}

function setLimit(limit,targets){
    //alert("limit="+limit+";targets="+targets);
    if(targets==''||targets=='null'){
        alert('TODO');
    }else{
        var url=$("#"+targets).attr('url');
        //alert("org url="+url);
        url=urlreplace(url,"pageNo","1");
        url=urlreplace(url,"pageLimit",limit);
        //保存翻页信息到目标层
        $("#"+targets).attr('url',url);
        //alert("repalced url="+url);
        ajaxGet(url,targets);
    }
} 

function gotoPageDirect(pageNo,currentPageNo,totalPages,targets){
    //alert("pageNo="+pageNo+";currentPageNo="+currentPageNo+";totalPages="+totalPages+";targets="+targets);
        if(isNaN(pageNo)){
            return false;
        }
        pageNo=parseInt(pageNo);
        currentPageNo=parseInt(currentPageNo);
        totalPages=parseInt(totalPages);
        if(pageNo==currentPageNo){
            return false;
        }
        if(pageNo>totalPages){
            pageNo=totalPages;
        }
        if(pageNo<1){
            pageNo=1;
        }
        setPage(pageNo,targets);
        return false;
}

function gotoPage(pageNo,currentPageNo,totalPages,targets){
    //alert("pageNo="+pageNo+";currentPageNo="+currentPageNo+";totalPages="+totalPages+";targets="+targets);
    if ( window.event.keyCode == 13 ){
        gotoPageDirect(pageNo,currentPageNo,totalPages,targets);
    }
}

function setOrder(order,by,targets){
	//alert("order="+order+";by="+by+";targets="+targets);
	if(targets==''||targets=='null'){
		alert('TODO');
	}else{
		var url=$("#"+targets).attr('url');
		//alert("org url="+url);
//		url=urlsetorder(url,order,by);
		url=urlreplace(url,order,by);
		//alert("repalced url="+url);
		ajaxGet(url,targets);
	}
}

var mulOrder=true;
function urlsetorder(url,field,sorttype){
    var orderName="qm.order";
	var na="na";
	var orderparam = orderName+"=";
 	if(!mulOrder){
 		if(sorttype==na){
 			return urlreplace(url,orderName,"");
 		}else{
 			return urlreplace(url,orderName,field + " " +sorttype);
 		}
 	}

	url = decodeURI(url);
	var inurl = url.indexOf("?");
	var orurl = url.indexOf(orderparam);
	if(inurl==-1){
		if(sorttype!=na){
			url = url + "?"+orderparam+field+" "+sorttype;
		}
	}else if(orurl==-1){
		if(sorttype!=na){
			url = url + "&"+orderparam+field+" "+sorttype;
		}
	}else{
		var urls = url.split("?");
		var urllet = urls[1].split("&");
		var urlprv = urls[0]+"?";
		var urlorder = "";
		for(var i=0;i<urllet.length;i++){
			if(urllet[i].indexOf(orderparam)==-1){
				if(urlprv.substr(urlprv.length-1,urlprv.length-1)!="?"){
					urlprv=urlprv+"&";
				}
				urlprv=urlprv+urllet[i];
			}else{
				urlorder = urllet[i];
			}
		}
		var flag = false;
		var orders = urlorder.split("=")[1].split(",");
		for(i=0;i<orders.length;i++){
			if(orders[i].split(" ")[0]==field){
				flag = true;
				break;
			}
		}
		if(!flag&&sorttype!=na){
			var uop = urlorder.split("=")[1];
			if(uop==""){
				urlorder=urlorder+field+" "+sorttype;
			}else{
				urlorder=urlorder.split("=")[0]+"="+field+" "+sorttype+","+uop;
			}
		}else{
			urlorder=orderparam;
			if(sorttype!=na){
				urlorder=urlorder+field+" "+sorttype;
			}
			var cnt=0;
			for(i=0;i<orders.length;i++){
				if(orders[i].split(" ")[0]==field){
					continue;
				}
				if(sorttype!=na||cnt>0){
					urlorder = urlorder + ",";
				}
				cnt++;
				urlorder = urlorder + orders[i];
			}
		}
		url = urlprv+"&"+urlorder;
	}
	//alert("order url="+url);
	return encodeURI(url);
}

/**
Sample
onclick="selectAll('exportItem',true)"
onclick="selectAll('exportItem',false)"
*/
function selectAll(item,obj){
	var frm = $(obj).parents().filter("form,:first");
    $(frm).find("input[name^='"+item+"']").each(function(){
    	$(this).attr("checked",obj.checked);
    });
}
/**
 * 校验列表复选框是否有选中的
 */
var checkSelectAll = function(target){
    var $checkBoxList = $('#'+target).find("input[type='checkbox']:checked:enabled");
    if($checkBoxList.length == 0){
    	publishHitMessage('没有选中列表中的行，请选择列中的行!');
    	return false;
    }
    var flag = true;
    if($checkBoxList.length == 1){
    	$checkBoxList.each(function(i,n){
    		if($(n).val() == 'on')
        		flag = false;
        });
    }
    if(!flag){
    	publishHitMessage('没有选中列表中的行，请选择列中的行!');
    	return false;
    }
    return flag;
};
/**
 * 校验列表复选框只选择一个
 */
var checkSelectLengthByOne = function(target){
	if(checkSelectAll(target)){
		var $checkBoxList = $('#'+target).find("input[type='checkbox']:checked:enabled");
	    if($checkBoxList.length > 2){
	    	publishHitMessage('只能选择列表中的一行，请选择一行!');
	    	return false;
	    }
	    var flag = true;
	    $checkBoxList.each(function(i,n){
    		if($(n).val() == 'on')
        		flag = false;
        });
	    if($checkBoxList.length == 2 && flag){
	    	publishHitMessage('只能选择列表中的一行，请选择一行!');
	    	return false;
	    }else{
	    	return true;
	    }
	}
};
/**
 * 获取列表中复选框一个选中的值
 */
var getCheckSelectValByOne = function(target){
	var checkVal = "";
	if(checkSelectLengthByOne(target)){
		var $checkBoxList = $('#'+target).find("input[type='checkbox']:checked:enabled");
	    $checkBoxList.each(function(i,n){
    		if($(n).val() != 'on')
    			checkVal = $(n).val();
        });
	}
	return checkVal;
};
/**
 * 获取列表中选中的值
 */
var getSelectValAll = function(target){
	var val = "";
	if(checkSelectAll(target)){
		var $obj = getCheckSelectObj(target);
		$obj.each(function(i,n){
			if($(n).val() != 'on'){
				if(val){
					val += ","+$(n).val();
				}else{
					val = $(n).val();
				}
			}
        });
	}
	return val;
};
/**
 * 获取选中的复选框对象
 */
var getCheckSelectObj = function(target){
	var $obj = null;
	$('#'+target).find("input[type='checkbox']:checked:enabled").each(function(i,n){
		if($(n).val() != 'on'){
			$obj = $(n);
		}
	});
	return $obj;
};
Date.prototype.format = function(format)
{
var o =
{
"M+" : this.getMonth()+1, //month
"d+" : this.getDate(), //day
"h+" : this.getHours(), //hour
"m+" : this.getMinutes(), //minute
"s+" : this.getSeconds(), //second
"q+" : Math.floor((this.getMonth()+3)/3), //quarter
"S" : this.getMilliseconds() //millisecond
};
if(/(y+)/.test(format))
format=format.replace(RegExp.$1,(this.getFullYear()+"").substr(4 - RegExp.$1.length));
for(var k in o)
if(new RegExp("("+ k +")").test(format))
format = format.replace(RegExp.$1,RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length));
return format;
};

function atleaseOneCheck(itemlistIn)
{
	var itemlist='itemlist';
	if(itemlistIn){
		itemlist=itemlistIn;
	}
    var items = document.getElementsByName(itemlist);
    if (items.length > 0) {
        for (var i = 0; i < items.length; i++)
        {
            if (items[i].checked == true)
            {
                return true;
            }
        }
    } else {
        if (items.checked == true) {
            return true;
        }
    }
    return false;
}

function selectOptionsAll(src){
   if($(src)!=null){
    for(var i=0;i<$(src).length;i++){
        $(src).options[i].selected=true;
    }
    }
}


function getRadioValue(name){
	var obj = document.getElementsByName(name);
	for(var i=0; i<obj.length; i++){
		if(obj[i].checked) return obj[i].value;
	}
	return "";
}

/**
 * 提示消息
 * @param icon
 * @param text
 * @param className
 */
function alertMessage(icon,text,className){
	jQuery.gritter.add({
        title: '操作提示',
        text: text,
		class_name: className,
		image: icon,
		sticky: false,
		time: ''
	});
}