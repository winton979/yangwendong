<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="listcont" value="${fn:length(retList)}" />
<style>

#imgContainer {width: 768px;height: 500px;}

#positionButtonDiv {background: rgb(58, 56, 63);background: rgba(58, 56, 63, 0.8);border: solid 1px #100000;color: #fff;padding: 8px;text-align: left;position: absolute;right:35px;top:35px;}

#positionButtonDiv .positionButtonSpan img {float: right;border: 0;}

.positionMapClass area {cursor: pointer;}

.zoomButton {border: 0;	cursor: pointer;}

.zoomableContainer {background-image: url("${ctx}/static/images/transparent.png");}

.imgbk{width: 140px; height: 100px;margin-top: 5px;margin-bottom: 5px;}
</style>
</head>



<!--代码部分begin-->
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
<div class="row">
<div id="pageContent">

	<div id="imgContainer">
		<c:if test="${listcont == 0}">
    		<div id="smartZoomContainer1458895024006" class="zoomableContainer" style="overflow: hidden; position: relative; top: 0px; left: 0px; width: 980px; height: 500px;"><img id="imageFullScreen" style="transition: all 0s ease-out; transform: translate3d(260px, 20px, 0px) scale3d(1, 1, 1); cursor: default; transform-origin: 0px 0px 0px;" src="${ctx}/static/images/notimg.jpg"></div>
 		</c:if>
    </div>

	<div id="positionButtonDiv">

		<p><span> <img id="zoomInButton" class="zoomButton" src="${ctx}/static/images/zoomIn.png" title="zoom in" alt="zoom in"> <img id="zoomOutButton" class="zoomButton" src="${ctx}/static/images/zoomOut.png" title="zoom out" alt="zoom out"> </span> </p>

		<p>

        <span class="positionButtonSpan">

			<map name="positionMap" class="positionMapClass">

				<area id="topPositionMap" shape="rect" coords="20,0,40,20" title="move up" alt="move up">

                <area id="leftPositionMap" shape="rect" coords="0,20,20,40" title="move left" alt="move left">

				<area id="rightPositionMap" shape="rect" coords="40,20,60,40" title="move right" alt="move right">

				<area id="bottomPositionMap" shape="rect" coords="20,40,40,60" title="move bottom" alt="move bottom">

			</map>

			<img src="${ctx}/static/images/position.png" usemap="#positionMap">

         </span>

         </p>

	</div>
</div>
</div>
<div class="row">
<div class="col-sm-12" style="text-align: center;"><h4 id ="showName" > </h4></div>
</div>
<hr />
	<!-- form-group -->
	<div class="form-group">
		<div  class="col-sm-1" style="text-align:center;">
			<button id="pageLeft" class="btn btn-primary btn-navi btn-navi-left"  style="height: 110px;" type="button" onclick="onNextPage(0)"><i class="fa fa-chevron-left"></i></button>
		</div>
			<c:forEach var="item" items="${retList}" varStatus="status">
				<div id="showImg${status.count}" <c:if test="${status.count eq 1}">style="display: block;"</c:if> <c:if test="${status.count gt 1}">style="display: none;"</c:if>>
					<c:forEach var="itemMap" items="${item}" varStatus="statusmap">
						<div align="center" class="col-sm-2" style="text-align:center;">
							<img id="imgc${status.count}${statusmap.count}" onclick="onImgSwitch(this)" src="${rootUrl}${itemMap.value[1]}" alt="${itemMap.value[0]}" class="imgbk">
						</div>
					</c:forEach>
					<c:if test="${fn:length(item) <5}">
						<c:forEach var="itemStr" items="${compensate}" varStatus="statusStr">
							<div align="center" class="col-sm-2" style="text-align:center;">
								
							</div>
						</c:forEach>
					</c:if>
				</div>
			</c:forEach>
			<c:if test="${listcont ==0 }">
				<div align="center" class="col-sm-2" style="text-align:center;">
						<img id=""  src="${ctx}/static/images/notimg.jpg" class="imgbk">
				</div>
				<div align="center" class="col-sm-2" style="text-align:center;">
						<img id=""  src="${ctx}/static/images/notimg.jpg" class="imgbk">
				</div>
				<div align="center" class="col-sm-2" style="text-align:center;">
						<img id=""  src="${ctx}/static/images/notimg.jpg" class="imgbk">
				</div>
				<div align="center" class="col-sm-2" style="text-align:center;">
						<img id=""  src="${ctx}/static/images/notimg.jpg" class="imgbk">
				</div>
				<div align="center" class="col-sm-2" style="text-align:center;">
						<img id=""  src="${ctx}/static/images/notimg.jpg" class="imgbk">
				</div>
			</c:if>
		<div class="col-sm-1" style="text-align:center;">
			<button  id="pageRight"  class="btn btn-primary btn-navi btn-navi-right"  style="height: 110px;" type="button" onclick="onNextPage(1)"><i class="fa fa-chevron-right"></i></button>
		</div>
	</div>
</div>
<div class="panel-footer">
				<div class="row">
					<div class="col-sm-9 col-sm-offset-3">
						
					</div>
				</div>
	</div>
			<!-- panel-footer -->
</div>
<script src="${ctx}/static/js/e-smart-zoom-jquery.min.js"></script>

<!--[if lt IE 9]>

    <script src="http://libs.useso.com/js/html5shiv/3.6/html5shiv.min.js"></script>

<![endif]-->

<script>

$(document).ready(function() {    
	  //解决模式对象远程对象只加载一次的事件
  	$(".bs-example-modal-lg").on("hidden.bs.modal", function() { $(this).removeData("bs.modal"); });   
    initPage();     
    $('#topPositionMap,#leftPositionMap,#rightPositionMap,#bottomPositionMap').bind("click", moveButtonClickHandler);
    $('#zoomInButton,#zoomOutButton').bind("click", zoomButtonClickHandler);

    function zoomButtonClickHandler(e){

        var scaleToAdd = 0.8;

        if(e.target.id == 'zoomOutButton')

            scaleToAdd = -scaleToAdd;

        $('#imageFullScreen').smartZoom('zoom', scaleToAdd);

    }        

    function moveButtonClickHandler(e){

        var pixelsToMoveOnX = 0;

        var pixelsToMoveOnY = 0;



        switch(e.target.id){

            case "leftPositionMap":

                pixelsToMoveOnX = 50;	

            break;

            case "rightPositionMap":

                pixelsToMoveOnX = -50;

            break;

            case "topPositionMap":

                pixelsToMoveOnY = 50;	

            break;

            case "bottomPositionMap":

                pixelsToMoveOnY = -50;	

            break;

        }

        $('#imageFullScreen').smartZoom('pan', pixelsToMoveOnX, pixelsToMoveOnY);

    } 

});

function initPage(){
	var p = ${listcont};
	if(p>1){
		var imgInput = $('#imgc11') ;
		 $("#showName").text(imgInput.attr('alt')); 
		 $("#imgContainer").empty();//清除原来图片
		 $("#imgContainer").html("<img id='imageFullScreen' src='"+imgInput.attr('src')+"'>");//新增图片
		 $('#imageFullScreen').smartZoom({'containerClass':'zoomableContainer'});   
		 
		 $('#pageLeft').show();
		 $('#pageRight').show();
		 $('#imageFullScreen').hide();
		 setTimout(showImg(),3000); 
	}else{
		$('#pageLeft').hide();
		$('#pageRight').hide();
	}
}

function showImg() 
{ 
	$('#imageFullScreen').show();
}

/**
 * 切换图片
 */
function onNextPage(lr){	
	var pageCont = ${listcont};
	for (var i=0;i<pageCont;i++)
	{
		var index = i+1
		var divDoc = $('#showImg'+index).css("display");
		if(divDoc == 'block'){
			$('#showImg'+index).hide();
			if(lr == 1){
				var indexShow = index+1
				if(indexShow > pageCont){
					 $('#showImg1').show();
				}else{
					$('#showImg'+indexShow).show();
				}
				return ;
			}else{
				var indexShow = index-1
				if(indexShow < 1){
					 $('#showImg1').show();
				}else{
					$('#showImg'+indexShow).show();
				}
				return ;
			}
		}
	}
 }
 
 function onImgSwitch(img){
	// alert('onimg -- -- '+img.src);
	 $("#showName").text(img.alt); 
	 $("#imgContainer").empty();//清除原来图片
	 $("#imgContainer").html("<img id='imageFullScreen' style='display: none;' src='"+img.src+"'>");//新增图片
	// $('#imageFullScreen').attr("src",img.src);
	 $('#imageFullScreen').smartZoom({'containerClass':'zoomableContainer'}); //初始放大效果
	 // $("#imageFullScreen").fadeOut();
	 $("#imageFullScreen").fadeIn(2000);//淡出效果
 }
</script>

<!--代码部分end-->