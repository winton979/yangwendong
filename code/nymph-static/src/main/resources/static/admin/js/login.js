/*
 * Copyright (c) 2012-2015, Guangzhou Miicaa technology Co., Ltd.
 *
 * All rights reserved.
 */
/*错误提示框*/
var tip = '<div id="errorTip"></div>'
/*错误提示框结束*/
$(document).ready(function () {
    (function changeTheBackground(){
        var bgArr = ["01", "02", "03"];
        var ran = Math.floor((Math.random() * bgArr.length));
        var bg = bgArr[ran];
        $(".content-wrapper").css("background","url('/home/static/app/home/pc/image/login/home-login-"+bg+".png') center 0 no-repeat")
    })();
    /*获取验证码*/
    var wait = 60;
    $("#registerForm input[type='button'],#newOrgForm input[type='button'],#pwdForm input[type='button'],#getPwdForm input[type='button'],#registerSwitch input[type='button']").click(function () {
        var target = $(this)

        sendcode(this, target);
    })
    function sendcode(o, target) {
        var $pwdEmail = target.parent().find("#pwdEmail"),
            $pwdCode = target.parent().find("#pwdCode"),
            cellPhone = target.parent().find("#pwdEmail").data("type") == undefined ? "" : target.parent().find("#pwdEmail").data("type"),
            validate = true;
        $pwdCode.next("#errorTip").remove();
        if ($pwdEmail.val() == "") {
            if(cellPhone == "cellPhone"){
                $pwdEmail.next("#errorTip").remove();
                $pwdEmail.after(tip);
                $pwdEmail.next("#errorTip").html('*请输入手机号');
            }else{
                $pwdEmail.next("#errorTip").remove();
                $pwdEmail.after(tip);
                $pwdEmail.next("#errorTip").html('*请输入邮箱或手机号');
            }
            validate = false;
        } else {
            $pwdEmail.next("#errorTip").remove();
            var email = $pwdEmail.val();
            if (!/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i.test(email) && !(/^1[3|4|5|7|8][0-9]\d{8}$/.test(email))) {
                if(cellPhone == "cellPhone"){
                    $pwdEmail.after(tip);
                    $pwdEmail.next("#errorTip").html('*请输入正确的手机号');
                }else{
                    $pwdEmail.after(tip);
                    $pwdEmail.next("#errorTip").html('*请输入正确的邮箱或手机号');
                }
                validate = false;
            } else {
                $pwdEmail.next("#errorTip").remove();
                validate = true;
            }
        }
        if(validate){
            var loginName = target.parent().find("#pwdEmail").val();
            if ($("#registerForm").length > 0) {
                $.ajax({
                    url: '/home/pc/register/isLoginNameValidate',
                    cache: false,
                    type: 'POST',
                    beforeSend: function (xhr) {
                    },
                    data: {
                        loginName: email,
                    },
                    success: function (ret) {
                        if (ret.succeed) {
                            if(target.parent().find("#graphValidate").val() == ""){
                                target.parent().find("#graphValidate").next("#errorTip").remove();
                                target.parent().find("#graphValidate").after(tip);
                                target.parent().find("#graphValidate").next("#errorTip").html('*请先输入图形验证码');
                            }else{
                                target.parent().find("#graphValidate").next("#errorTip").remove();
                                var time = new Date().getTime();
                                var code = target.parent().find("#graphValidate").val();
                                var desc = getDescv(time, code, loginName);
                                $.ajax({
                                    url: '/home/pc/register/checkImgCode',
                                    cache: false,
                                    type: 'POST',
                                    beforeSend: function (xhr) {
                                    },
                                    data: {
                                        loginName: loginName,
                                        type: cellPhone,
                                        descv: desc,
                                        time: time,
                                        code: code
                                    },
                                    success: function (ret) {

                                        if (ret.succeed) {
                                            getTextCode(o)
                                            target.parent().find("#graphValidate").next("#errorTip").remove();
                                            var time = new Date().getTime();
                                            var code = target.parent().find("#graphValidate").val();
                                            var desc = getDescv(time, code, loginName);
                                            $.ajax({
                                                url: '/home/pc/register/sendValiCode',
                                                cache: false,
                                                type: 'POST',
                                                beforeSend: function (xhr) {
                                                },
                                                data: {
                                                    loginName: loginName,
                                                    type: cellPhone,
                                                    descv: desc,
                                                    time: time,
                                                    code: code
                                                },
                                                success: function (ret) {
                                                    target.parent().find("#graphValidate").next("#errorTip").remove();
                                                    if (ret.succeed) {
                                                        target.parent().find("#pwdCode").next("#errorTip").remove();
                                                        target.parent().find("#pwdCode").after(tip);
                                                        target.parent().find("#pwdCode").next("#errorTip").css("color","#08a631");
                                                        target.parent().find("#pwdCode").next("#errorTip").html('验证码发送成功');
                                                    } else {
                                                        if(ret.code==-90){
                                                            target.parent().find("#graphValidate").next("#errorTip").remove();
                                                            target.parent().find("#graphValidate").after(tip);
                                                            target.parent().find("#graphValidate").next("#errorTip").html('*' + ret.msg);
                                                        }

                                                    };
                                                    if(ret.typeerror){
                                                        $pwdEmail.next("#errorTip").remove();
                                                        $pwdEmail.after(tip);
                                                        $pwdEmail.next("#errorTip").html('*手机号格式不正确');
                                                    }
                                                }
                                            });
                                        } else {
                                            target.parent().find("#graphCode").attr("src","/home/pc/register/vcode?_"+new Date().getTime())
                                            if(ret.code==-90){
                                                target.parent().find("#graphValidate").next("#errorTip").remove();
                                                target.parent().find("#graphValidate").after(tip);
                                                target.parent().find("#graphValidate").next("#errorTip").html('*' + ret.msg);
                                            }

                                        };
                                        if(ret.typeerror){
                                            $pwdEmail.next("#errorTip").remove();
                                            $pwdEmail.after(tip);
                                            $pwdEmail.next("#errorTip").html('*手机号格式不正确');
                                        }
                                    }
                                });
                            }
                        } else {
                            $pwdEmail.next("#errorTip").remove();
                            $pwdEmail.after(tip);
                            $pwdEmail.next("#errorTip").html('*该账号已存在，请直接登录');
                        }
                    }
                })
            } else {
                if(target.parent().find("#graphValidate").val() == ""){
                    target.parent().find("#graphValidate").next("#errorTip").remove();
                    target.parent().find("#graphValidate").after(tip);
                    target.parent().find("#graphValidate").next("#errorTip").html('*请先输入图形验证码');
                }else{
                    target.parent().find("#graphValidate").next("#errorTip").remove();
                    var time = new Date().getTime();
                    var code = target.parent().find("#graphValidate").val();
                    var desc = getDescv(time, code, loginName);
                    $.ajax({
                        url: '/home/pc/register/checkImgCode',
                        cache: false,
                        type: 'POST',
                        beforeSend: function (xhr) {
                        },
                        data: {
                            loginName: loginName,
                            type: cellPhone,
                            descv: desc,
                            time: time,
                            code: code
                        },
                        success: function (ret) {
                            if (ret.succeed) {
                                getTextCode(o)
                                target.parent().find("#graphValidate").next("#errorTip").remove();
                                var time = new Date().getTime();
                                var code = target.parent().find("#graphValidate").val();
                                var desc = getDescv(time, code, loginName);
                                $.ajax({
                                    url: '/home/pc/register/sendValiCode',
                                    cache: false,
                                    type: 'POST',
                                    beforeSend: function (xhr) {
                                    },
                                    data: {
                                        loginName: loginName,
                                        type: cellPhone,
                                        descv: desc,
                                        time: time,
                                        code: code
                                    },
                                    success: function (ret) {
                                        target.parent().find("#graphValidate").next("#errorTip").remove();
                                        if (ret.succeed) {
                                            target.parent().find("#pwdCode").next("#errorTip").remove();
                                            target.parent().find("#pwdCode").after(tip);
                                            target.parent().find("#pwdCode").next("#errorTip").css("color","#08a631");
                                            target.parent().find("#pwdCode").next("#errorTip").html('验证码发送成功');
                                        } else {
                                            if(ret.code==-90){
                                                target.parent().find("#graphValidate").next("#errorTip").remove();
                                                target.parent().find("#graphValidate").after(tip);
                                                target.parent().find("#graphValidate").next("#errorTip").html('*' + ret.msg);
                                            }

                                        };
                                        if(ret.typeerror){
                                            $pwdEmail.next("#errorTip").remove();
                                            $pwdEmail.after(tip);
                                            $pwdEmail.next("#errorTip").html('*手机号格式不正确');
                                        }
                                    }
                                });
                            } else {
                                target.parent().find("#graphCode").attr("src","/home/pc/register/vcode?_"+new Date().getTime())
                                if(ret.code==-90){
                                    target.parent().find("#graphValidate").next("#errorTip").remove();
                                    target.parent().find("#graphValidate").after(tip);
                                    target.parent().find("#graphValidate").next("#errorTip").html('*' + ret.msg);
                                }

                            };
                            if(ret.typeerror){
                                $pwdEmail.next("#errorTip").remove();
                                $pwdEmail.after(tip);
                                $pwdEmail.next("#errorTip").html('*手机号格式不正确');
                            }
                        }
                    });
                }
            }
            if (loginName != "") {

            }
        }
    }

    function getTextCode(o) {
        if (wait == 0) {
            o.removeAttribute("disabled");
            o.value = "获取验证码";
            wait = 60;
        } else {
            o.setAttribute("disabled", true);
            o.value = "重新发送(" + wait + ")";
            wait--;
            setTimeout(function () {
                    getTextCode(o)
                },
                1000)
        }
    };
    /*获取验证码结束*/
    /*提交验证*/

    /*提交验证结束*/
    /*注册*/
    $("#registerForm input[type='submit']").click(function () {
        var $parent = $("#registerForm");
        var email = $parent.find("#pwdEmail").val(),
            code = $parent.find("#pwdCode").val(),
            password = $("#registerForm input[placeholder='密码']").val();
        var validate = true;
        $("#registerForm input[type='text'],#registerForm input[type='password']").each(function () {
            if ($(this).val() == "") {
                var errorInfo = $(this).data("error");
                $(this).next("#errorTip").remove();
                $(this).after(tip);
                $(this).next("#errorTip").html('*' + errorInfo);
                validate = false
            } else {
                $(this).next("#errorTip").remove();
                if (!/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i.test(email) && !(/^1[3|4|5|7|8][0-9]\d{4,8}$/.test(email))) {
                    $(this).next("#errorTip").remove();
                    $("#registerForm #password").next("#errorTip").remove();
                    $("#registerForm #password").after(tip);
                    $("#registerForm #password").next("#errorTip").html('*请输入正确的邮箱或手机号');
                    validate = false;
                } else {
                    $("#registerForm #password").next("#errorTip").remove();
                    validate = true
                }
                if (!(/^[\@A-Za-z0-9\!\#\$\%\^\&\*\.\~]{6,14}$/).test(password)) {
                    $("#registerForm input[placeholder='密码']").next("#errorTip").remove();
                    $("#registerForm input[placeholder='密码']").after(tip);
                    $("#registerForm input[placeholder='密码']").next("#errorTip").html('*密码格式不正确');
                    validate = false;
                } else {
                    $("#registerForm input[placeholder='密码']").next("#errorTip").remove();
                    if ($("#registerForm input[placeholder='密码']").val() != $("#registerForm input[placeholder='确认密码']").val()) {
                        $("#registerForm input[placeholder='确认密码']").next("#errorTip").remove();
                        $("#registerForm input[placeholder='确认密码']").after(tip);
                        $("#registerForm input[placeholder='确认密码']").next("#errorTip").html('*两次输入密码不一致');
                        validate = false;
                    } else {
                        $("#registerForm input[placeholder='确认密码']").next("#errorTip").remove();
                        validate = true;
                    };
                }
            }
        });
        if (validate) {
            $.ajax({
                url: '/home/pc/register/isLoginNameValidate',
                cache: false,
                type: 'POST',
                beforeSend: function (xhr) {
                },
                data: {
                    loginName: email
                },
                success: function (ret) {
                    if (ret.succeed) {
                        $.ajax({
                            url: '/home/pc/register/reg',
                            cache: false,
                            type: 'POST',
                            beforeSend: function (xhr) {
                            },
                            data: {
                                loginName: email,
                                valiCode: code,
                                password: $("#registerForm input[placeholder='密码']").val(),
                                name: $("#registerForm input[placeholder='姓名']").val()
                            },
                            success: function (ret) {
                                if (ret.succeed) {
                                    window.location.href = ret.data;
                                    //window.location.href = "/home/pc/login";
                                } else if(ret.msg){
                                    $("#registerForm input[placeholder='确认密码']").next("#errorTip").remove();
                                    $("#registerForm input[placeholder='确认密码']").after(tip);
                                    $("#registerForm input[placeholder='确认密码']").next("#errorTip").html('*' + ret.msg);
                                }else{
                                    $("#registerForm input[placeholder='确认密码']").next("#errorTip").remove();
                                    $("#registerForm input[placeholder='确认密码']").after(tip);
                                    $("#registerForm input[placeholder='确认密码']").next("#errorTip").html('*连接失败，请重试！');
                                }
                            }
                        });
                    } else if(ret.msg){
                        $("#registerForm input[placeholder='确认密码']").next("#errorTip").remove();
                        $("#registerForm input[placeholder='确认密码']").after(tip);
                        $("#registerForm input[placeholder='确认密码']").next("#errorTip").html('*' + ret.msg);
                    }else{
                        $("#registerForm input[placeholder='确认密码']").next("#errorTip").remove();
                        $("#registerForm input[placeholder='确认密码']").after(tip);
                        $("#registerForm input[placeholder='确认密码']").next("#errorTip").html('*连接失败，请重试！');
                    }
                }
            });
        }

    });
    /*注册结束*/
    /*邀请*/
    var url = window.location.search;
    var type = "";
    if (url.indexOf("?") != -1) {
        type = url.substr(1);
    }
    ;
    if (type == "byInvite") {
        $("#byCustomer").hide();
        $("#byInvite").show();
    } else if (type == "byOrgcode") {
        $("#byCustomer").hide();
        $("#byOrgcode").show();
    } else if (type == "byCustomer") {
        $("#byCustomer").show();
    }
    /*邀请结束*/
    /*创建新企业*/
    var jsNewOrg = true;
    $("#newOrgForm #newOrg").on("click", function () {
        var validate = true;
        $("#newOrgForm input[type='text'],#newOrgForm input[type='hidden']").each(function () {
            if ($(this).val() == "") {
                if ($(this).is(":hidden")) {
                    $(this).next("#errorTip").remove();
                    var errorInfo = $(this).data("error");
                    $(this).parent().next("#errorTip").remove();
                    $(this).parent().after(tip);
                    $(this).parent().next("#errorTip").html('*' + errorInfo);
                    validate = false;
                } else if ($(this).length > 0) {
                    $(this).parent().next("#errorTip").remove();
                    var errorInfo = $(this).data("error");
                    $(this).next("#errorTip").remove();
                    $(this).after(tip);
                    $(this).next("#errorTip").html('*' + errorInfo);
                    validate = false;
                }
            } else {
                $(this).next("#errorTip").remove();
                $(this).parent().next("#errorTip").remove();
            }
        });
        if (validate&&jsNewOrg) {
            var valiCode = $("#newOrgForm #pwdCode").val() == undefined ? "" : $("#newOrgForm #pwdCode").val();
            var phone = $("#newOrgForm #pwdEmail").val() == undefined ? "" : $("#newOrgForm #pwdEmail").val();
            var loginName = $("#loginNameVal").val();
            jsNewOrg = false;
            if ($("#newOrgForm #pwdEmail").length > 0) {
                $.ajax({
                    url: '/home/pc/register/isValied',
                    cache: false,
                    type: 'POST',
                    beforeSend: function (xhr) {
                    },
                    data: {
                        loginName: $("#newOrgForm #pwdEmail").val(),
                        valiCode: $("#newOrgForm #pwdCode").val(),
                    },
                    success: function (ret) {
                        if (ret.succeed) {
                            $.ajax({
                                url: '/home/pc/register/createOrgan',
                                cache: false,
                                type: 'POST',
                                beforeSend: function (xhr) {
                                },
                                data: {
                                    loginName: $("#loginNameVal").val(),
                                    valiCode: valiCode,
                                    phone: phone,
                                    name: $("#newOrgForm #orgNmae").val(),
                                    tradeType: $("#newOrgForm .user-select-value").val(),
                                    src: window.location.search,
                                    channelCode: ""
                                },
                                success: function (ret) {
                                    if (ret.succeed) {
                                        //window.location.href = "/home/pc/login/autoLoginByLoginName?loginName=" + loginName;1
                                        window.location.href = "/home/pc/login";
                                    } else if(ret.msg){
                                        $("#newOrgForm #pwdCode").next("#errorTip").remove();
                                        $("#newOrgForm #pwdCode").after(tip);
                                        $("#newOrgForm #pwdCode").next("#errorTip").html('*' + ret.msg);
                                    }else{
                                        $("#newOrgForm #pwdCode").next("#errorTip").remove();
                                        $("#newOrgForm #pwdCode").after(tip);
                                        $("#newOrgForm #pwdCode").next("#errorTip").html('*连接失败，请重试！');
                                    }
                                    jsNewOrg = true
                                }
                            });
                        } else if(ret.msg){
                            $("#newOrgForm #pwdCode").next("#errorTip").remove();
                            $("#newOrgForm #pwdCode").after(tip);
                            $("#newOrgForm #pwdCode").next("#errorTip").html('*' + ret.msg);
                        }else{
                            $("#newOrgForm #pwdCode").next("#errorTip").remove();
                            $("#newOrgForm #pwdCode").after(tip);
                            $("#newOrgForm #pwdCode").next("#errorTip").html('*连接失败，请重试');
                        }
                    }
                });
            } else {
                $.ajax({
                    url: '/home/pc/register/createOrgan',
                    cache: false,
                    type: 'POST',
                    beforeSend: function (xhr) {
                    },
                    data: {
                        loginName: $("#loginNameVal").val(),
                        valiCode: valiCode,
                        phone: phone,
                        name: $("#newOrgForm #orgNmae").val(),
                        tradeType: $("#newOrgForm .user-select-value").val(),
                        src: window.location.search,
                        channelCode: ""
                    },
                    success: function (ret) {
                        if (ret.succeed) {
                            //window.location.href = "/home/pc/login/autoLoginByLoginName?loginName=" + loginName;1
                            window.location.href = "/home/pc/login";
                        } else if(ret.msg){
                            $("#newOrgForm .widget-base-select-div").next("#errorTip").remove();
                            $("#newOrgForm .widget-base-select-div").after(tip);
                            $("#newOrgForm .widget-base-select-div").next("#errorTip").html('*' + ret.msg);
                        }else{
                            $("#newOrgForm .widget-base-select-div").next("#errorTip").remove();
                            $("#newOrgForm .widget-base-select-div").after(tip);
                            $("#newOrgForm .widget-base-select-div").next("#errorTip").html('*连接失败，请重试！');
                        }
                        jsNewOrg = true
                    }
                });
            }

        }
    });
    /*创建新企业结束*/
    /*加入已有企业*/
    $("#joinOrgForm #joinOrg").on("click", function () {
        var validate = true;
        $("#joinOrgForm input[type='text'],#joinOrgForm input[type='hidden']").each(function () {
            if ($(this).val() == "") {
                var errorInfo = $(this).data("error");
                $(this).next("#errorTip").remove();
                $(this).after(tip);
                $(this).next("#errorTip").html('*' + errorInfo);
                validate = false
            }
        });
        if (validate) {
            var loginName = $("#loginNameVal").val();
            $.ajax({
                url: '/home/pc/register/joinOrgan',
                cache: false,
                type: 'POST',
                beforeSend: function (xhr) {
                },
                data: {
                    orgPubCode: $("#joinOrgForm #orgPubCode").val(),
                    valiCode: $("#joinOrgForm #InviteCode").val(),
                },
                success: function (ret) {
                    if (ret.succeed) {
                        //window.location.href = "/home/pc/login/autoLoginByLoginName?loginName=" + loginName;1
                        window.location.href = "/home/pc/login";
                    } else if(ret.msg){
                        $("#joinOrgForm #InviteCode").next("#errorTip").remove();
                        $("#joinOrgForm #InviteCode").after(tip);
                        $("#joinOrgForm #InviteCode").next("#errorTip").html('*' + ret.msg);
                    }else{
                        $("#joinOrgForm #InviteCode").next("#errorTip").remove();
                        $("#joinOrgForm #InviteCode").after(tip);
                        $("#joinOrgForm #InviteCode").next("#errorTip").html('*连接失败，请重试！');
                    }
                }
            });
        }
    });
    /*加入已有企业结束*/
    /*byInvite登陆注册切换*/
    $("#byOrgcode #loginSwitchBtn,#byInvite #loginSwitchBtn").on("click", function () {
        $(this).parents(".switchbtn").find("#registerSwitch").hide();
        $(this).parents(".switchbtn").find("#loginSwitch").show();
    });
    $("#byOrgcode #registerSwitchBtn,#byInvite #registerSwitchBtn").on("click", function () {
        $(this).parents(".switchbtn").find("#loginSwitch").hide();
        $(this).parents(".switchbtn").find("#registerSwitch").show();
    });
    /*byInvite登陆注册切换结束*/
    /*byOrgcode登陆注册切换*/
    $("#loginSwitchButton").on("click", function () {
        var validate = true;
        $("#chooseOrg input[type='text']").each(function () {
            if ($(this).val() == "") {
                var errorInfo = $(this).data("error");
                $(this).next("#errorTip").remove();
                $(this).after(tip);
                $(this).next("#errorTip").html('*' + errorInfo);
                validate = false
            } else {
                $(this).next("#errorTip").remove();
                $("#saveOrgCode").val($("#byOrgcode #orgPubCode").val());
                $("#saveInviteCode").val($("#byOrgcode #inviteCode").val());
                validate = true;
            }
            ;
        });
        if (validate) {
            $.ajax({
                url: '/home/pc/register/isInviteInfoRight',
                cache: false,
                type: 'POST',
                beforeSend: function (xhr) {
                },
                data: {
                    orgPubCode: $("#byOrgcode #orgPubCode").val(),
                    valiCode: $("#byOrgcode #inviteCode").val(),
                },
                success: function (ret) {
                    if (ret.succeed) {
                        $("#byOrgcode #chooseOrg").hide();
                        $("#byOrgcode #registerSwitch").hide();
                        $("#byOrgcode #loginSwitch").show();
                    } else {
                        if (ret.msg == "不存在该公司") {
                            $("#byOrgcode #orgPubCode").next("#errorTip").remove();
                            $("#byOrgcode #orgPubCode").after(tip);
                            $("#byOrgcode #orgPubCode").next("#errorTip").html('*' + ret.msg);
                        } else {
                            $("#byOrgcode #orgPubCode").next("#errorTip").remove();
                        }
                        ;
                        if (ret.msg == "邀请码错误") {
                            $("#byOrgcode #inviteCode").next("#errorTip").remove();
                            $("#byOrgcode #inviteCode").after(tip);
                            $("#byOrgcode #inviteCode").next("#errorTip").html('*' + ret.msg);
                        } else {
                            $("#byOrgcode #inviteCode").next("#errorTip").remove();
                        }
                    }
                }
            });
        }
    });
    $("#registerSwitchButton").on("click", function () {
        var validate = true;
        $("#chooseOrg input[type='text']").each(function () {
            var $sss = $(this);
            if ($(this).val() == "") {
                var errorInfo = $(this).data("error");
                $(this).next("#errorTip").remove();
                $(this).after(tip);
                $(this).next("#errorTip").html('*' + errorInfo);
                validate = false
            } else {
                $(this).next("#errorTip").remove();
                $("#saveOrgCode").val($("#byOrgcode #orgPubCode").val());
                $("#saveInviteCode").val($("#byOrgcode #inviteCode").val());
                validate = true;
            }
        });
        if (validate) {
            $.ajax({
                url: '/home/pc/register/isInviteInfoRight',
                cache: false,
                type: 'POST',
                beforeSend: function (xhr) {
                },
                data: {
                    orgPubCode: $("#byOrgcode #orgPubCode").val(),
                    valiCode: $("#byOrgcode #inviteCode").val(),
                },
                success: function (ret) {
                    if (ret.succeed) {
                        $("#byOrgcode #chooseOrg").hide();
                        $("#byOrgcode #loginSwitch").hide();
                        $("#byOrgcode #registerSwitch").show();
                    } else {
                        if (ret.msg == "不存在该公司") {
                            $("#byOrgcode #orgPubCode").next("#errorTip").remove();
                            $("#byOrgcode #orgPubCode").after(tip);
                            $("#byOrgcode #orgPubCode").next("#errorTip").html('*' + ret.msg);
                        }
                        ;
                        if (ret.msg == "邀请码错误") {
                            $("#byOrgcode #inviteCode").next("#errorTip").remove();
                            $("#byOrgcode #inviteCode").after(tip);
                            $("#byOrgcode #inviteCode").next("#errorTip").html('*' + ret.msg);
                        }
                    }
                }
            });
        }
    });
    /*byOrgcode登陆注册切换结束*/
    /*邀请页面隐藏参数设置*/
    if ($("#byInvite").length > 0) {
        $.ajax({
            url: '/sysconfig/pc/invite/canAccess/checkInviteId',
            cache: false,
            type: 'POST',
            beforeSend: function (xhr) {
            },
            data: {
                inviteId: $("#hidInviteId").val(),
            },
            success: function (ret) {
                if (ret.succeed) {
                    var email = ret.data.invitation.email;
                    var sendUserName = ret.data.invitation.sendUserName;
                    var isEmailExsited = ret.data.isEmailExsited;
                    var orgName = ret.data.orgName;
                    if (isEmailExsited) {
                        $("#registerSwitch").hide();
                        $("#loginSwitch").show();
                    } else {
                        $("#loginSwitch").hide();
                        $("#registerSwitch").show();
                    }
                    $("#registerSwitch #pwdEmail,#loginSwitch #pwdEmail,#getPwdForm #pwdEmail").val(email);
                    $("#registerSwitch #aCompany,#loginSwitch #aCompany").html(orgName);
                    $("#registerSwitch #inviter,#loginSwitch #inviter").html(sendUserName);
                }
            }
        });
    }
    /*邀请页面隐藏参数设置结束*/
    /*注册加入、登陆加入事件*/
    $("#byInvite #registerAndJoin").on("click", function () {
        var validate = true;
        var email = $("#registerSwitch #pwdEmail").val();
        var code = $("#registerSwitch #setPassword").val();
        $("#registerSwitch input[type='text'],#registerSwitch input[type='password']").each(function () {
            if ($(this).val() == "") {
                var errorInfo = $(this).data("error");
                $(this).next("#errorTip").remove();
                $(this).after(tip);
                $(this).next("#errorTip").html('*' + errorInfo);
                validate = false;
            } else if (!/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i.test(email) && !(/^1[3|4|5|7|8][0-9]\d{4,8}$/.test(email))) {
                $(this).next("#errorTip").remove();
                $("#registerSwitch #pwdEmail").next("#errorTip").remove();
                $("#registerSwitch #pwdEmail").after(tip);
                $("#registerSwitch #pwdEmail").next("#errorTip").html('*请输入正确的邮箱或手机号');
                validate = false;
            } else if (!(/^[\@A-Za-z0-9\!\#\$\%\^\&\*\.\~]{6,14}$/).test(code)) {
                $("#registerSwitch #setPassword").next("#errorTip").remove();
                $("#registerSwitch #setPassword").after(tip);
                $("#registerSwitch #setPassword").next("#errorTip").html('*密码格式不正确');
                validate = false;
            } else {
                $(this).next("#errorTip").remove();
                if ($("#setPassword").val() != $("#rewriteSetPassword").val()) {
                    $("#registerSwitch #setPassword").next("#errorTip").remove();
                    $("#rewriteSetPassword").next("#errorTip").remove();
                    $("#rewriteSetPassword").after(tip);
                    $("#rewriteSetPassword").next("#errorTip").html('*两次输入密码不一致');
                    validate = false;
                }else{
                    validate = true;
                }
            }
        });
        if (validate) {
            var loginName = $("#registerSwitch #pwdEmail").val();
            $.ajax({
                url: '/sysconfig/pc/invite/canAccess/joinTeamworkJson',
                cache: false,
                type: 'POST',
                beforeSend: function (xhr) {
                },
                data: {
                    email: loginName,
                    inviteId: $("#hidInviteId").val(),
                    password: $("#registerSwitch #setPassword").val(),
                    username: $("#registerSwitch #setName").val()
                },
                success: function (ret) {
                    if (ret.succeed) {
                        window.location.href = ret.data;
                        //window.location.href = "/home/pc/login";
                    }else if(ret.msg){
                        $("#rewriteSetPassword").next("#errorTip").remove();
                        $("#rewriteSetPassword").after(tip);
                        $("#rewriteSetPassword").next("#errorTip").html('*'+ret.msg);
                    }else{
                        $("#rewriteSetPassword").next("#errorTip").remove();
                        $("#rewriteSetPassword").after(tip);
                        $("#rewriteSetPassword").next("#errorTip").html('*连接失败，请重试！');
                    }
                }
            });
        }
    });
    $("#byOrgcode #registerAndJoin").on("click", function () {
        var validate = true;
        var email = $("#registerSwitch #pwdEmail").val();
        var code = $("#registerSwitch #setPassword").val();
        $("#registerSwitch input[type='text'],#registerSwitch input[type='password']").each(function () {
            if ($(this).val() == "") {
                var errorInfo = $(this).data("error");
                $(this).next("#errorTip").remove();
                $(this).after(tip);
                $(this).next("#errorTip").html('*' + errorInfo);
                validate = false
            } else if (!/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i.test(email) && !(/^1[3|4|5|7|8][0-9]\d{4,8}$/.test(email))) {
                $(this).next("#errorTip").remove();
                $("#registerSwitch #pwdEmail").next("#errorTip").remove();
                $("#registerSwitch #pwdEmail").after(tip);
                $("#registerSwitch #pwdEmail").next("#errorTip").html('*请输入正确的邮箱或手机号');
                validate = false;
            } else if(!(/^[\@A-Za-z0-9\!\#\$\%\^\&\*\.\~]{6,14}$/).test(code)){
                $("#registerSwitch #setPassword").next("#errorTip").remove();
                $("#registerSwitch #setPassword").after(tip);
                $("#registerSwitch #setPassword").next("#errorTip").html('*密码格式不正确');
                validate = false;
            }else{
                if ($("#registerSwitch #setPassword").val() != $("#registerSwitch #rewriteSetPassword").val()) {
                    $("#registerSwitch #setPassword").next("#errorTip").remove();
                    $("#registerSwitch #rewriteSetPassword").next("#errorTip").remove();
                    $("#registerSwitch #rewriteSetPassword").after(tip);
                    $("#registerSwitch #rewriteSetPassword").next("#errorTip").html('*两次输入密码不一致');
                    validate = false
                } else {
                    $(this).next("#errorTip").remove();
                    validate = true
                }
            }
        });
        if (validate) {
            $("#writePassword").next("#errorTip").remove();
            var loginName = $("#registerSwitch #pwdEmail").val();
            $.ajax({
                url: '/home/pc/register/reg',
                cache: false,
                type: 'POST',
                beforeSend: function (xhr) {
                },
                data: {
                    loginName: loginName,
                    valiCode: $("#byOrgcode #pwdCode").val(),
                    password: $("#byOrgcode #setPassword").val(),
                    name: $("#byOrgcode #setName").val()
                },
                success: function (ret) {
                    if (ret.succeed) {
                        $.ajax({
                            url: '/home/pc/register/joinOrgan',
                            cache: false,
                            type: 'POST',
                            beforeSend: function (xhr) {
                            },
                            data: {
                                loginName: loginName,
                                orgPubCode: $("#byOrgcode #saveOrgCode").val(),
                                valiCode: $("#byOrgcode #saveInviteCode").val()
                            },
                            success: function (ret) {
                                if (ret.succeed) {
                                    window.location.href = "/home/pc/login/autoLoginByLoginName?loginName=" + loginName;
                                    //window.location.href = "/home/pc/login";
                                }
                                else if(ret.msg){
                                    $("#registerSwitch #rewriteSetPassword").next("#errorTip").remove();
                                    $("#registerSwitch #rewriteSetPassword").after(tip);
                                    $("#registerSwitch #rewriteSetPassword").next("#errorTip").html('*' + ret.msg);
                                }else{
                                    $("#registerSwitch #rewriteSetPassword").next("#errorTip").remove();
                                    $("#registerSwitch #rewriteSetPassword").after(tip);
                                    $("#registerSwitch #rewriteSetPassword").next("#errorTip").html('*连接失败，请重试！');
                                }
                            }
                        });
                    } else if(ret.msg){
                        $("#registerSwitch #rewriteSetPassword").next("#errorTip").remove();
                        $("#registerSwitch #rewriteSetPassword").after(tip);
                        $("#registerSwitch #rewriteSetPassword").next("#errorTip").html('*' + ret.msg);
                    }else{
                        $("#registerSwitch #rewriteSetPassword").next("#errorTip").remove();
                        $("#registerSwitch #rewriteSetPassword").after(tip);
                        $("#registerSwitch #rewriteSetPassword").next("#errorTip").html('*连接失败，请重试！');
                    }
                }
            });
        }
    });

    $("#byInvite #loginAndJoin").on("click", function () {
        var errorInfo = $("#byInvite #writePassword").data("error");
        if ($("#writePassword").val() == "") {
            $("#writePassword").next("#errorTip").remove();
            $("#writePassword").after(tip);
            $("#writePassword").next("#errorTip").html('*' + errorInfo);
        } else {
            $("#writePassword").next("#errorTip").remove();
            var loginName = $("#loginSwitch #pwdEmail").val();
            $.ajax({
                url: '/sysconfig/pc/invite/canAccess/joinTeamworkJson',
                cache: false,
                type: 'POST',
                beforeSend: function (xhr) {
                },
                data: {
                    email: loginName,
                    inviteId: $("#hidInviteId").val(),
                    password: $("#loginSwitch #writePassword").val(),
                    username: ""
                },
                success: function (ret) {
                    if(ret.succeed){
                        window.location.href = ret.data;
                        //window.location.href = "/home/pc/login";
                    }else if(ret.msg){
                        $("#writePassword").next("#errorTip").remove();
                        $("#writePassword").after(tip);
                        $("#writePassword").next("#errorTip").html('*' + ret.msg);
                    }else{
                        $("#writePassword").next("#errorTip").remove();
                        $("#writePassword").after(tip);
                        $("#writePassword").next("#errorTip").html('*连接失败，请重试！');
                    }

                }
            });
        }
    });
    $("#byOrgcode #loginAndJoin").on("click", function () {
        if ($("#writePassword").val() == "") {
            $("#writePassword").next("#errorTip").remove();
            $("#writePassword").after(tip);
            $("#writePassword").next("#errorTip").html('*' + errorInfo);
        } else {
            $("#writePassword").next("#errorTip").remove();
            var loginName = $("#loginSwitch #pwdEmail").val();
            $.ajax({
                url: '/home/pc/login/loginCheck',
                cache: false,
                type: 'POST',
                beforeSend: function (xhr) {
                },
                data: {
                    loginName: loginName,
                    password: $("#loginSwitch #writePassword").val()
                },
                success: function (ret) {
                    if (ret.succeed) {
                        $.ajax({
                            url: '/home/pc/register/joinOrgan',
                            cache: false,
                            type: 'POST',
                            beforeSend: function (xhr) {
                            },
                            data: {
                                orgPubCode: $("#byOrgcode #saveOrgCode").val(),
                                valiCode: $("#byOrgcode #saveInviteCode").val()
                            },
                            success: function (ret) {
                                if (ret.succeed) {
                                    window.location.href = "/home/pc/login/autoLoginByLoginName?loginName=" + loginName;
                                    //window.location.href = "/home/pc/login";
                                }
                                else if(ret.msg){
                                    $("#loginSwitch #writePassword").next("#errorTip").remove();
                                    $("#loginSwitch #writePassword").after(tip);
                                    $("#loginSwitch #writePassword").next("#errorTip").html('*' + ret.msg);
                                }else{
                                    $("#loginSwitch #writePassword").next("#errorTip").remove();
                                    $("#loginSwitch #writePassword").after(tip);
                                    $("#loginSwitch #writePassword").next("#errorTip").html('*连接失败，请重试！');
                                }
                            }
                        });
                    } else if(ret.msg){
                        $("#loginSwitch #writePassword").next("#errorTip").remove();
                        $("#loginSwitch #writePassword").after(tip);
                        $("#loginSwitch #writePassword").next("#errorTip").html('*' + ret.msg);
                    }else{
                        $("#loginSwitch #writePassword").next("#errorTip").remove();
                        $("#loginSwitch #writePassword").after(tip);
                        $("#loginSwitch #writePassword").next("#errorTip").html('*连接失败，请重试！');
                    }
                }
            });
        }
    });

    /*注册加入、登陆加入事件结束*/
    /*记住密码*/
    $("#form-block-rememberPwd").on("click", function (event) {
        //if (event.target.id === "custom-checkbox-box") {
        //    $(this).find("label").trigger("click");
        //}
        var hiddenInput = $("#rememberPwd-hidden-input");
        var customBox = $("#custom-checkbox-box");
        var checkbox = $("#form-input-rememberPwd");
        //if( navigator.userAgent.indexOf("Safari") > -1){}else{}
        if (checkbox.prop("checked") == true) {
            hiddenInput.val("false");
            customBox.css("background", "");
            checkbox.attr("checked",false);
            return;
        } else {
            hiddenInput.val("true");
            customBox.css("background", "url('/home/static/profrontbase/pc/images/widget/probaseelement/base-checkbox.png')");
            checkbox.attr("checked","checked");
            return;
        }
    });
    /*记住密码结束*/
    /*修改密码*/
    $("#pwdForm #sendNewPwd").click(function () {
        var newPwd = $("#newPwd").val();
        var rewriteNewpwd = $("#rewriteNewpwd").val();
        if (newPwd == "" || rewriteNewpwd == "") {
            if (newPwd == "") {
                $("#pwdForm #newPwd").next("#errorTip").remove();
                $("#pwdForm #newPwd").after(tip);
                $("#pwdForm #newPwd").next("#errorTip").html('*请填写密码');
            } else if (rewriteNewpwd == "") {
                $("#pwdForm #newPwd").next("#errorTip").remove();
                $("#pwdForm #rewriteNewpwd").next("#errorTip").remove();
                $("#pwdForm #rewriteNewpwd").after(tip);
                $("#pwdForm #rewriteNewpwd").next("#errorTip").html('*请确认密码');
            }
        } else {
            if (newPwd != rewriteNewpwd) {
                $("#pwdForm #rewriteNewpwd").next("#errorTip").remove();
                $("#pwdForm #rewriteNewpwd").after(tip);
                $("#pwdForm #rewriteNewpwd").next("#errorTip").html('*密码不一致');
            } else if (!(/^[\@A-Za-z0-9\!\#\$\%\^\&\*\.\~]{6,14}$/).test(newPwd)) {
                $("#pwdForm #newPwd").next("#errorTip").remove();
                $("#pwdForm #newPwd").after(tip);
                $("#pwdForm #newPwd").next("#errorTip").html('*密码格式不对');
            } else {
                var loginName =
                    $.ajax({
                        url: '/home/pc/register/resetPwd',
                        type: 'POST',
                        data: {
                            loginName: $("#getPwdForm #pwdEmail").val(),
                            valiCode: $("#getPwdForm #pwdCode").val(),
                            newPassword: $("#pwdForm #newPwd").val()
                        },
                        success: function (ret) {
                            if (ret.succeed) {
                                $(".slide").hide();
                                $("#registerSuc").show();
                            } else if(ret.msg){
                                $("#pwdForm #rewriteNewpwd").next("#errorTip").remove();
                                $("#pwdForm #rewriteNewpwd").after(tip);
                                $("#pwdForm #rewriteNewpwd").next("#errorTip").html('*' + ret.msg);
                            }else{
                                $("#pwdForm #rewriteNewpwd").next("#errorTip").remove();
                                $("#pwdForm #rewriteNewpwd").after(tip);
                                $("#pwdForm #rewriteNewpwd").next("#errorTip").html('*连接失败，请重试！');
                            }
                        }
                    });
            }
        }
    });
    /*修改密码结束*/
    $('#sendAgain').live('click', function (event) {
        $("#pwdTip").html('邮件正在发送中...').show();
        $.ajax({
            url: '/home/pc/findpassword/sendmail',
            type: 'POST',
            data: {
                email: $('#pwdForm [name="findPassword"]').data('email')
            },
            success: function (ret) {
                if (ret.data) {
                    $('#pwdTip').html('发送成功！').show();
                } else {
                    $('#pwdTip').html('发送失败！').show();
                }
            }
        });
    });

    $(".go-pwd").click(function () {
        $("#rememberId").val($("#loginForm input[name='email']").val());
        $("#getPwdForm #pwdEmail").val($("#loginForm #pwdEmail").val());
        $(".slide").animate({
            "margin-left": "-380px"
        });
    });
    /*下一步*/
    $(".go-changepwd").click(function () {
        if ($("#getPwdForm #pwdCode").val() == "") {
            $("#getPwdForm #pwdCode").next("#errorTip").remove();
            $("#getPwdForm #pwdCode").after(tip);
            $("#getPwdForm #pwdCode").next("#errorTip").html('*请填写验证码');
        } else {
            $("#getPwdForm #pwdCode").next("#errorTip").remove();
            $.ajax({
                url: '/home/pc/register/isValied',
                cache: false,
                type: 'POST',
                beforeSend: function (xhr) {
                },
                data: {
                    loginName: $("#getPwdForm #pwdEmail").val(),
                    valiCode: $("#getPwdForm #pwdCode").val()
                },
                success: function (ret) {
                    if (ret.succeed) {
                        $(".slide").animate({
                            "margin-left": "-760px"
                        });
                    } else {
                        $("#getPwdForm #pwdCode").next("#errorTip").remove();
                        $("#getPwdForm #pwdCode").after(tip);
                        $("#getPwdForm #pwdCode").next("#errorTip").html('*验证码无效');
                    }
                }
            });
        }
    });
    /*下一步结束*/
    $(".go-login").click(function () {
        $("#getPwdForm #pwdEmail").next("#errorTip").remove();
        $("#getPwdForm #pwdCode").next("#errorTip").remove();
        $("#getPwdForm #pwdEmail").val("");
        $(".slide").animate({
            "margin-left": "0"
        });
    });
    $(".newOrg").on("click", function () {
        $.ajax({
            url: '/home/pc/register/isNeedBindPhone',
            cache: false,
            type: 'POST',
            beforeSend: function (xhr) {
            },
            data: {
                loginName: $("#loginNameVal").val()
            },
            success: function (ret) {
                if (ret.succeed) {
                    $("#chooseOrg").hide();
                    $("#joinOrgForm").hide();
                    $("#newOrgForm").show();
                } else {
                    $("#chooseOrg").hide();
                    $("#joinOrgForm").hide();
                    $("#newOrgForm").show();
                    $("#newOrgForm #pwdEmail").remove();
                    $("#newOrgForm #pwdCode").remove();
                    $("#newOrgForm .graph-validate").remove();
                    $("#newOrgForm #getCodeBtn").remove();
                }
            }
        });
    });
    $(".joinOrg").on("click", function () {
        $("#chooseOrg").hide();
        $("#newOrgForm").hide();
        $("#joinOrgForm").show();
    });
    /* 所属行业*/

    $(".drop-down-box").click(function () {
        var mainDiv = $(this).parents("div:first");
        var icon = mainDiv.find(".base-icon.drop-down-box");
        var isSlid = mainDiv.data("slid") || "false";
        if (isSlid == "true") {
            mainDiv.find(".drop-down-box-main").slideUp();
            icon.removeClass("common-btn-icon-box-up");
            icon.addClass("common-btn-icon-box-down");
            mainDiv.data("slid", "false");
        } else {
            mainDiv.find(".drop-down-box-main").slideDown();
            if (mainDiv.find(".drop-down-box-main li").length > 4)
                mainDiv.find(".drop-down-box-main").css({"overflow-x": "hidden", "overflow-y": "auto"});
            icon.removeClass("common-btn-icon-box-down");
            icon.addClass("common-btn-icon-box-up");
            mainDiv.data("slid", "true");
        }
        var hasClick = mainDiv.data("haveClick");
        //点击展开时为每个li绑定点击事件
        if (!hasClick) {
            mainDiv.find(".drop-down-box-main li").click(function () {
                var min = $(this).parents("div:first");
                min.find(".base-icon.drop-down-box").click();
                min.find(".widget-base-selectbox-content-multi").text($(this).text()).data("code", $(this).data("code") || null).addClass("word-break");
                ;
                min.find(".user-select-value").val($(this).data("code") || null);
            });
            mainDiv.data("haveClick", "true");
        }
    });
    $(document).mouseup(function (e) {
        var _con = $('.widget-base-select-div ');   // 设置目标区域
        if (!_con.is(e.target) && _con.has(e.target).length === 0) { // Mark 1
            $(".widget-base-select-div").find(".drop-down-box-main").slideUp();
            $(".widget-base-select-div").find(".base-icon.drop-down-box").removeClass("common-btn-icon-box-up");
            $(".widget-base-select-div").find(".base-icon.drop-down-box").addClass("common-btn-icon-box-down");
            $(".widget-base-select-div").data("hasClick", "true");
        }
    });
    /* 所属行业结束*/
    /*邀请页找回密码*/
    $("#forgetPassword").on("click", function () {
        $("#inviteContent").hide();
        $("#forgetPwd").show();
        //window.location.href = "/home/pc/register/forgetpwd"
        //$("#registerSwitch").find(".l-captcha").remove();
        //$("#newOrgForm").find(".l-captcha").remove();
    });
    /*邀请页找回密码结束*/
    /*图片验证码开始*/
    $("#graphCode").on("click",function(){
        $(this).attr("src","/home/pc/register/vcode?_"+new Date().getTime())
    });
    /*图片验证码结束*/
    /*md5*/
    function getDescv(time, code, loginName) {
        return $.md5($.md5(loginName + $.md5("miicaa" + parseInt(code / 2))) + $.md5(parseInt(time / 2) + ""));
    }
    /*md5结束*/
});

function succSubmit() {
    var isNUll = true;
    if ($("#loginForm #pwdEmail").val() == "") {
        $("#loginForm #pwdEmail").next("#errorTip").remove();
        $("#loginForm #pwdEmail").after(tip);
        $("#loginForm #pwdEmail").next("#errorTip").html('*请输入账号');
        isNUll = false;
    } else {
        $("#loginForm #pwdEmail").next("#errorTip").remove();
    };
    if ($("#loginForm #pwdCode").val() == "") {
        $("#loginForm #pwdCode").next("#errorTip").remove();
        $("#loginForm #pwdCode").after(tip);
        $("#loginForm #pwdCode").next("#errorTip").html('*请输入密码');
        isNUll = false;
    } else {
        $("#loginForm #pwdCode").next("#errorTip").remove();
    };
    if (isNUll) {
        $(".home-logining").css("z-index","0")
        //$("#loginForm input[type=submit]").val("");
        //console.log($("#loginForm input[type=submit]").val());
        //$("#loginForm input[type=submit]").css("background", "url('/home/static/app/home/pc/image/login/logining.gif') no-repeat");
        //console.log($("#loginForm input[type=submit]").attr("background"));
    }
    return isNUll;
}
$("#form").find('.entry-org').on('click', function () {
    var $me = $(this);
    var orgcode = $me.attr("orgcode");
    $("#orgCode").val(orgcode);
    document.forms[0].submit();
});

$(".login-foot-icon").on("click", function () {
    $(".login-code").fadeIn(1000);
})
$(".login-foot-computer").on("click", function () {
    $(".login-code").fadeOut(1000);
});

if ($("#error").length > 0) {
    setTimeout(function () {
        $("#error").fadeOut(2000)
        $("#tip").fadeOut(2000)
    }, 3000);
}
;
if ($(".error").css('display') == "block") {
    setTimeout(function () {
        $("#error").fadeOut(2000)
        $("#tip").fadeOut(2000)
    }, 3000);
}
;
