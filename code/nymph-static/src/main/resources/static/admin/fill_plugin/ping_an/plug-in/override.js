function queryNewMessage(){
	var unreadMessageCount = 0;
	var detail = '{ "parameters.common":{ "mySite":"site","myPage":"'+ myPage +'","myPageID":"'+ myPageId +'"},"unread.message":{"userID":"'+Whoami['userID.whoami']+'","userType":"'+Whoami['userType.whoami']+'"}}';
 	$.ajax({
		url: __SERVICE_URL_PREFIX__+__SELECTDETAIL_URL__,
		type:"post",
		async: true,
		dataType: "json",
		data:'detail='+ detail +'&target=',
		success: function(v) {
		   	var data = v.data[0];
			var wsData = eval(data['unread.message']);
			var logoutFlag = parseInt(wsData['logoutFlag']);
			if (logoutFlag == 1) {//by wuhao 20161025
				swal({
					  title: "我的提示",
					  text: "登入已超时，请在右下角窗口重新登入！",
					  timer: 2000,
					  showConfirmButton: false
				});
				
				$("<iframe id='myFrame' name='myFrame'></iframe>").prependTo('body');
				$("#myFrame").attr("src", "https://fls-aflm.pingan.com.cn/pazl-web/app/login.html");
				$("#myFrame").attr("height", "500px");
				$("#myFrame").attr("width", "800px");
				return;
			} else if(logoutFlag==2){
				swal({ 
					title: "检测到其他账号的登录，系统将自动登出！", 
					type: "warning", 
					closeOnConfirm: true, 
					confirmButtonText: "确定", 
					confirmButtonColor: "#ec6c62" 
				}, function() {
					var ts = Date.parse(new Date());
					location.href="login.html?ts="+ts;
				});
				return;
			}
			var unreadMessage = wsData['msgList'];
			for(var i=0;i<unreadMessage.length;i++){
				if(unreadMessage[i]['status.message'] == 0){
					unreadMessageCount ++;
				}
			}
			if(unreadMessageCount > 0){
				$('#spig').show();
				$.showMessage('您有'+ unreadMessageCount +'封新短信');
				$('#spig #mumu').attr({'ondblclick':'goPage("637.html")','title':'双击查看新短信'});
			}else{
				$('#spig').hide();
			}
	    }
	});
}