<%@ page language="java" pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta http-equiv="Cache" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache" />
<link type="image/x-icon" href="${ctx}/static/images/favicon.ico" rel="shortcut icon">
<link href="${ctx}/static/css/style.default.css" rel="stylesheet">
<link href="${ctx}/static/fancybox/jquery.fancybox.css" rel="stylesheet">
<link href="${ctx}/static/css/jquery.gritter.css" rel="stylesheet">
<link href="${ctx}/static/css/morris.css" rel="stylesheet">
<link href="${ctx}/static/css/timeline.css" rel="stylesheet">
<link href="${ctx}/static/css/style.datatables.css" rel="stylesheet" />
<link href="${ctx}/static/css/dataTables.responsive.css" rel="stylesheet" />
<link href="${ctx}/static/css/jquery.tagsinput.css" rel="stylesheet" />
<link href="${ctx}/static/css/toggles.css" rel="stylesheet" />
<%-- <link href="${ctx}/static/bootstrap-timepicker/css/timepicker.css" rel="stylesheet" /> --%>
<link href="${ctx}/static/images/dropzone.css" rel="stylesheet" />
<link href="${ctx}/static/css/select2.css" rel="stylesheet" />
<link href="${ctx}/static/artDialog6/css/ui-dialog.css" rel="stylesheet" />
<link href="${ctx}/static/css/main.css" rel="stylesheet" />




<script src="${ctx}/static/js/jquery-1.11.1.min.js"></script>
<script src="${ctx}/static/js/jquery-migrate-1.2.1.min.js"></script>
<script src="${ctx}/static/js/jquery-ui-1.10.3.min.js"></script>
<script src="${ctx}/static/js/modernizr.min.js"></script>
<script src="${ctx}/static/js/bootstrap.min.js"></script>
<script src="${ctx}/static/js/bootstrap-wizard.min.js"></script>
<script src="${ctx}/static/js/pace.min.js"></script>
<script src="${ctx}/static/js/jquery.cookies.js"></script>
<script src="${ctx}/static/js/jquery.prettyPhoto.js"></script>
<script src="${ctx}/static/js/jquery.dataTables.min.js"></script>
<script src="${ctx}/static/js/dataTables.bootstrap.js"></script>
<script src="${ctx}/static/js/jquery.validate.min.js"></script>
<script src="${ctx}/static/js/jquery.validate.custom.js"></script>
<script src="${ctx}/static/js/jquery.form.js"></script>
<script src="${ctx}/static/js/messages_bs_zh.js"></script>
<script src="${ctx}/static/js/retina.min.js"></script>
<script src="${ctx}/static/js/jquery.sparkline.min.js"></script>
<script src="${ctx}/static/js/morris.min.js"></script>
<script src="${ctx}/static/js/raphael-2.1.0.min.js"></script>
<script src="${ctx}/static/js/jquery.gritter.min.js"></script>
<script src="${ctx}/static/js/jquery.autogrow-textarea.js"></script>
<script src="${ctx}/static/js/jquery.mousewheel.js"></script>
<script src="${ctx}/static/js/jquery.tagsinput.min.js"></script>
<script src="${ctx}/static/js/toggles.min.js"></script>
<%-- 
<script src="${ctx}/static/bootstrap-timepicker/js/bootstrap-timepicker.js"></script> --%>

<%-- <script src="${ctx}/static/bootstrap-timepicker/js/jquery-ui-timepicker-addon.js"></script>
<script src="${ctx}/static/bootstrap-timepicker/js/jquery-ui-timepicker-zh-CN.js"></script>
<script src="${ctx}/static/bootstrap-timepicker/js/jquery.ui.datepicker-zh-CN.js"></script> --%>

<script src="${ctx}/static/js/jquery.maskedinput.min.js"></script>
<script src="${ctx}/static/js/dropzone.min.js"></script>
<script src="${ctx}/static/artDialog6/dist/dialog-min.js"></script>
<script src="${ctx}/static/artDialog6/dist/dialog-plus-min.js"></script>
<script src="${ctx}/static/artDialog6/lib/sea.js"></script>
<script src="${ctx}/static/fancybox/jquery.fancybox.pack.js"></script>
<script src="${ctx}/static/base/global.js"></script>
<script src="${ctx}/static/base/process.js"></script>
<script src="${ctx}/static/js/ajaxfileupload.js"></script>
<script src="${ctx}/static/jquery-jqprint/jquery.jqprint-0.3.js"></script>



<style>
.js, .js body {overflow:hidden}
.js body > * {visibility:hidden}
.js #loading_layer {visibility:visible;display:block !important;position:absolute;top:0;left:0;width:100%;height:100%;background:#fff;z-index:10000}
.js #loading_layer img {position:fixed;top:50%;left:50%;width:64px;height:10px;margin:-5px 0 0 -32px}
.js .tab-pane {display:block !important}
.js .hide {display: inherit}
</style>
<script>
	var ROOT = "${ctx}";
	document.documentElement.className += 'js';
</script>