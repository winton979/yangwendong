javascript:var FUZHICHENG='2.0';
function INIT(){FillPL.Init({type:'yixing',typeCode:1,dataUri:'http://localhost/static/fill_plguin/comp/yixin.js',des:'易鑫填充插件'});console.log("mixin loaded")}
	var s =document.createElement('script');
	s.type='text/javascript';
	s.onload=INIT;
	s.src='http://localhost:8085/static/fill_plugin/part1.js';
	document.body.appendChild(s);
	void(0);