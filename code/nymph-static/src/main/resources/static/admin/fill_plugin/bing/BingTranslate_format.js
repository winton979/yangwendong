var bingCW_ht_pop_el = document.getElementById("bingCW_ht_pop");
if (bingCW_ht_pop_el == null) BingCW = new
function() {
    this.Config = {
        Disabled: false,
        DisableHover: false,
        DisableSelection: false,
        DisablePharse: false,
        WebDefinition: true,
        MachineTranslation: true,
        ICON: "ZH"
    };
    var I = "D1CB4BBF472140DE99370A52F1F8F554",
    o = [document.body],
    G = {},
    f = null,
    a = null,
    n = [],
    m = [],
    v = null,
    q = [],
    j = null,
    F = false,
    p = "dict.bing.com.cn",
    ab = "#bingCW_ht_pop,#bingCW_ht_box,#bingCW_ht_content,#bingCW_ht_QWA,#bingCW_ht_footer,.bingCW_ht_QueryWord,.bingCW_ht_attr,.bingCW_ht_pos,.bingCW_ht_list,.bingCW_ht_list2,.bingCW_ht_listItem,.bingCW_ht_listItem2,.bingCW_ht_link,#bingCW_ht_badge{margin:0px;padding:0px;width:auto;height:auto;white-space:normal;border:0px solid #ace;background-color:White;background-image:none;text-indent:0px;line-height:17px;font-family:arial, helvetica, sans-serif;font-size:13px;color:Black;float:none;visibility:visible;text-align:left;vertical-align:baseline;display:inline;text-decoration:none;}#bingCW_ht_pop,#bingCW_ht_box,#bingCW_ht_content,#bingCW_ht_QWA,#bingCW_ht_footer,.bingCW_ht_list,.bingCW_ht_list2,.bingCW_ht_listItem,.bingCW_ht_listItem2,#bingCW_ht_badge{display:block;}#bingCW_ht_pop{width:265px;height:auto;position:absolute;z-index:99999999;display:none;padding:1px;}#bingCW_ht_box{border:1px solid #cdcdcd;padding:6px;}#bingCW_ht_content{margin-bottom:10px;}#bingCW_ht_QWA{margin-bottom:10px;}.bingCW_ht_QueryWord{font-weight:bold;margin-bottom:10px;font-size:13px;}.bingCW_ht_attr{font-family:'lucida sans unicode',Tahoma;color:#737373;margin-left:10px;}.bingCW_ht_pos{color:#e66400;display:block;line-height:17px;}.bingCW_ht_list{margin:-17px 0px 5px 50px;list-style:none;list-style-image:none;list-style-type:decimal;}.bingCW_ht_list2{margin:-17px 0px 5px 30px;list-style:none;list-style-image:none;list-style-type:none;padding:0px;}.bingCW_ht_listItem{display:list-item;list-style-type:decimal;line-height:18px;}.bingCW_ht_listItem2{display:list-item;list-style-type:none;line-height:18px;margin:0px;padding:0px;}.bingCW_ht_link{outline-style: none !important;cursor:pointer;margin-right:15px;float:left;color:#05569d}#bingCW_ht_moreLink,#bingCW_ht_requeryLink{text-decoration: none;color:#05569d;}#bingCW_ht_badge,#bingCW_ht_badge_en{background-image:url(http://" + p + "/img/bingCloudBTN_cn_en.gif);position:absolute;z-index:99999999;border-width:0px;width:103px;height:35px;background-repeat:no-repeat;cursor:pointer;}#bingCW_ht_badge_en{background-image:url(http://" + p + "/img/bingCloudBTN_cn_en.gif);}.bingCW_enable{background-position:0px 0px;}.bingCW_disable{background-position:0px -36px;}#bingCW_ht_footer{height:14px;}#bingCW_ht_requeryLink{background-image:url(http://" + p + "/img/logo_m.gif);background-repeat:no-repeat;width:53px;height:16px;display:inline-block}#bingCW_ht_moreLink{float:right}",
    N = "bingCW_hts_pop",
    Q = "bingCW_ht_pop",
    u = "bingCW_ht_content",
    P = "bingCW_ht_footer",
    A = "bingCW_ht_popscript",
    R = "bingCW_ht_requeryLink",
    L = 8e3,
    M = 1e3,
    W = 300,
    jb = decodeURI("%E5%85%B3%E9%97%AD%E5%B1%8F%E5%B9%95%E5%8F%96%E8%AF%8D"),
    Y = decodeURI("%E5%B1%8F%E5%B9%95%E5%8F%96%E8%AF%8D%E6%9C%8D%E5%8A%A1%E7%9B%AE%E5%89%8D%E4%B8%8D%E5%8F%AF%E7%94%A8%EF%BC%8C%E8%AF%B7%E7%A8%8D%E5%90%8E%E9%87%8D%E8%AF%95%E3%80%82"),
    X = decodeURI("%E6%AD%A3%E5%9C%A8%E5%8A%A0%E8%BD%BD..."),
    eb = decodeURI("%E5%BF%85%E5%BA%94%E8%AF%8D%E5%85%B8"),
    hb = decodeURI("%E5%AF%B9%E4%B8%8D%E8%B5%B7%EF%BC%8C%E6%88%91%E4%BB%AC%E6%B2%A1%E6%9C%89%E6%89%BE%E5%88%B0%E7%9B%B8%E5%85%B3%E8%A7%A3%E9%87%8A%E3%80%82"),
    cb = decodeURI("%E5%AF%B9%E4%B8%8D%E8%B5%B7%EF%BC%8C%E6%88%91%E4%BB%AC%E6%9A%82%E6%97%B6%E6%97%A0%E6%B3%95%E5%BE%88%E5%A5%BD%E7%9A%84%E6%94%AF%E6%8C%81%E8%AF%A5%E7%BD%91%E7%AB%99"),
    ib = decodeURI("%E5%BF%85%E5%BA%94%E6%90%9C%E7%B4%A2"),
    bb = decodeURI("%E4%B8%8B%E8%BD%BD%E6%A1%8C%E9%9D%A2%E7%89%88"),
    db = "http://dict.bing.com.cn/?FORM=DICT01#{0}",
    fb = "http://" + p + "/hover/http.svc/v1/?cb=BingCW.Apply&amp;web={webdef}&amp;mt={mt}&amp;q={query}&amp;form={appid}",
    V = window.location.protocol + "//bing.com.cn/search?FORM=DICT01&q=",
    c = window,
    d = document,
    e = d.documentElement,
    l = !!c.ActiveXObject,
    kb = l && !c.XMLHttpRequest,
    s = c.setTimeout,
    r = c.clearTimeout,
    b = d.body;
    function g(a, c, b, d) {
        if (a.addEventListener) a.addEventListener(c, b, d);
        else if (a.attachEvent) a.attachEvent("on" + c, b);
        else throw "EV";
    }
    this.Init = function(c) {
        try {
            if (F) return;
            F = true;
            if (c) {
                if (c.Disabled) BingCW.Config.Disabled = c.Disabled;
                if (c.ContentArea) {
                    var d = c.ContentArea;
                    if (typeof d == "string") {
                        d = d.split(",");
                        for (var e = 0,
                        h = d.length; e < h; e++) d[e] = document.getElementById(d[e])
                    }
                    if (!d.length) d = [d];
                    o = d
                }
                if (c.denyELS) {
                    var d = c.denyELS;
                    if (typeof d == "string") {
                        d = d.split(",");
                        for (var e = 0,
                        h = d.length; e < h; e++) G[d[e]] = document.getElementById(d[e])
                    }
                }
                if (c.AppID != undefined) I = c.AppID;
                if (c.WebDefinition != undefined) BingCW.Config.WebDefinition = c.WebDefinition;
                if (c.MachineTranslation != undefined) BingCW.Config.MachineTranslation = c.MachineTranslation;
                if (c.__hiddenInit__) c.__hiddenInit__();
                if (c.icon && c.icon == "en") this.Config.ICON = "EN"
            }
            C(ab);
            a = t("div", Q, N);
            a.innerHTML = '<div id="bingCW_ht_box"><div id="bingCW_ht_content"></div><div id="bingCW_ht_footer"></div></div>';
            b.appendChild(a);
            var f = [BingCW.Icon, BingCW.Selection, BingCW.HT, BingCW.HT.Phrase];
            for (var e = 0; e < f.length; e++) try {
                f[e].Init(c)
            } catch(g) {
                H("i:" + g)
            }
            a.onmouseover = B;
            a.onmouseout = z
        } catch(i) {
            H(cb)
        }
    };
    this.TurnOffLinkClick = function() {
        w();
        BingCW.Config.Disabled = true
    };
    this.ShowResult = function() {
        a.style.display = "block";
        var d = f.x,
        e = f.y,
        b = S(),
        c = D(),
        h = parseInt(a.clientWidth),
        g = parseInt(a.clientHeight);
        if (d + h > b.w + c.x) {
            var i = b.w + c.x - h;
            d = i > 0 ? i: d
        }
        if (e + g > b.h + c.y) {
            var j = b.h + c.y - g - 5;
            e = j > 0 ? j: e
        }
        a.style.left = d + "px";
        a.style.top = e + "px"
    };
    this.Apply = function(a, b, c) {
        if (j != a) return;
        if (Z(a, b, c) == false) {
            k();
            return
        }
        O(a);
        BingCW.ShowResult();
        k()
    };
    function Z(g, d, e) {
        var b = '<a id="bingCW_ht_requeryLink" target="_blank" class="bingCW_ht_link">&nbsp;</a>';
        if (d) {
            var c = decodeURI(d);
            if (q[e] == undefined) q[e] = c;
            i(u).innerHTML = c;
            var f = db.replace("{0}", g);
            b = '<a id="bingCW_ht_moreLink" href="' + f + '" target="_blank" class="bingCW_ht_link">' + eb + "</a>" + b
        } else {
            a.style.display = "none";
            return false
        }
        b = '<a target="_blank" class="bingCW_ht_link" style="float:right;margin-right:0px" href="http://dict.bing.msn.cn/">' + bb + "</a>" + b;
        i(P).innerHTML = b;
        return true
    }
    function O(b) {
        var a = i(R);
        if (a) a.href = V + encodeURI(b)
    }
    this.Query = function(b, a, c) {
        if (b == undefined && h(b) == "") return;
        a = parseInt(a);
        c = parseInt(c);
        if (isNaN(a)) a = 0;
        if (isNaN(c)) a = 0;
        f.x = a;
        f.y = c;
        y(b, b)
    };
    function y(c, a) {
        if (BingCW.Config.Disabled || !c) return;
        c = h(c);
        a = h(a);
        if (j == c) return;
        j = c;
        if (q[a]) {
            BingCW.Apply(c, q[a], a);
            return
        }
        E();
        var f = s(function() {
            i(u).innerHTML = X;
            BingCW.ShowResult()
        },
        M);
        m.push(f);
        var e = s(function() {
            E();
            i(u).innerHTML = Y;
            BingCW.ShowResult();
            k()
        },
        L);
        n.push(e);
        var d = t("script", A, 0);
        d.setAttribute("type", "text/javascript");
        var g = U(escape(a));
        d.setAttribute("src", g);
        b.appendChild(d)
    }
    function U(a, b) {
        return fb.replace(/&amp;/g, "&").replace("{webdef}", BingCW.Config.WebDefinition).replace("{mt}", BingCW.Config.MachineTranslation).replace("{appid}", I).replace("{query}", a).replace("{id}", b)
    }
    function E() {
        var a = i(A);
        if (a) b.removeChild(a)
    }
    function B() {
        if (v) r(v)
    }
    function z(b, a) {
        if (a) w(b);
        else v = s(function() {
            w()
        },
        W)
    }
    function w(b) {
        if (!T(b)) a.style.display = "none"
    }
    function T(c) {
        var b = a;
        return c && b.offsetTop < c.y && c.y < b.offsetTop + b.offsetHeight && b.offsetLeft < c.x && c.x < b.offsetLeft + b.offsetWidth
    }
    function k() {
        for (var a = 0; a < m.length; a++) r(m[a]);
        m = [];
        for (var b = 0; b < n.length; b++) r(n[b]);
        n = [];
        j = null
    }
    function H() {}
    function i(a) {
        return d.getElementById(a)
    }
    function C(b) {
        var a = t("style");
        d.getElementsByTagName("head")[0].appendChild(a);
        if (l) a.styleSheet.cssText = b;
        else a.appendChild(d.createTextNode(b))
    }
    function x(a) {
        return a || window.event
    }
    function t(e, c, b) {
        var a = d.createElement(e);
        if (c) a.id = c;
        if (b) a.className = b;
        return a
    }
    function gb(a) {
        return l ? event.srcElement: a.target
    }
    function J(a, c, d) {
        var b = 0;
        while (a && a != d) {
            b += a["offset" + c];
            a = a.offsetParent
        }
        return b
    }
    function h(a) {
        return a ? a.replace(/^\s+|\s+$/g, "") : ""
    }
    function S() {
        var d = -1,
        a = -1;
        if (typeof c.innerHeight == "number" && typeof c.innerWidth == "number") {
            a = c.innerHeight;
            d = c.innerWidth
        } else if (b && b.clientHeight && b.clientWidth) {
            d = b.clientWidth;
            a = b.clientHeight
        }
        if (e && e.clientHeight && e.clientWidth) {
            a = e.clientHeight;
            d = e.clientWidth
        }
        return {
            w: d,
            h: a
        }
    }
    function D() {
        var a = 0;
        if (typeof c.pageYOffset == "number") a = c.pageYOffset;
        else if (b && b.scrollTop) a = b.scrollTop;
        else if (e && e.scrollTop) a = e.scrollTop;
        return {
            x: e.scrollLeft,
            y: a
        }
    }
    function K(d, b, a, c, e) {
        var f = d[b];
        d[b] = function() {
            var b = arguments;
            if (a) a["apply"](this, b);
            var g = f["apply"](this, b);
            if (c) {
                var d = [];
                for (var h = 0; h < b.length; h++) d.push(b[h]);
                d.push(g);
                var i = c["apply"](this, d);
                if (e) g = i
            }
            return g
        }
    }
    this.Icon = new
    function() {
        var m = false,
        e = decodeURI("%E7%82%B9%E5%87%BB"),
        k = decodeURI("%E6%89%93%E5%BC%80"),
        j = decodeURI("%E5%85%B3%E9%97%AD"),
        h = decodeURI("%E5%BF%85%E5%BA%94%E5%B1%8F%E5%B9%95%E5%8F%96%E8%AF%8D"),
        o = "http://msranlc-lingo5/CodeGenerator/Scripts/template.js",
        n = "bingCW_ht_badge",
        c = null,
        a = null,
        i = [e + j + h + "\r\nDisable Bing Dictionary", e + k + h + "\r\nEnable Bing Dictionary"],
        f = {
            ZH: {
                id: "bingCW_ht_badge",
                tip: i
            },
            EN: {
                id: "bingCW_ht_badge_en",
                tip: i
            }
        };
        function l() {
            BingCW.Config.Disabled = !BingCW.Config.Disabled;
            d(BingCW.Config.Disabled);
            if (c) c(!BingCW.Config.Disabled)
        }
        function d(c) {
            var b = f[BingCW.Config.ICON];
            if (c) {
                a.className = "bingCW_disable";
                a.title = b.tip[1]
            } else {
                a.className = "bingCW_enable";
                a.title = b.tip[0]
            }
        }
        this.Init = function() {
            a = t("div", f[BingCW.Config.ICON].id, "bingCW_enable");
            b.appendChild(a);
            a.onclick = l;
            d(BingCW.Config.Disabled);
            g(window, "scroll", this.setPosition, true);
            g(window, "resize", this.setPosition, true);
            this.setPosition();
            m = true
        };
        this.setPosition = function() {
            var b = document.documentElement,
            c = document.body,
            e = b.clientWidth == 0 ? c.clientWidth: b.clientWidth,
            d = b.clientHeight == 0 ? c.clientHeight: b.clientHeight,
            f = b.scrollLeft == 0 ? c.scrollLeft: b.scrollLeft,
            g = b.scrollTop == 0 ? c.scrollTop: b.scrollTop,
            h = e + f,
            i = d + g;
            a.style.left = h - 108 + "px";
            a.style.top = i - 40 + "px"
        };
        this.setHandler = function(a) {
            if (typeof a == "function") c = a
        };
        this.setStatus = function(a) {
            BingCW.Config.Disabled = !a;
            d(BingCW.Config.Disabled)
        }
    };
    this.Selection = new
    function() {
        var m = 0,
        l = 1,
        h = 2,
        a = m,
        i = null;
        function b(b) {
            var a = D();
            a.x += b.clientX;
            a.y += b.clientY + 10;
            return a
        }
        function n() {
            if (c.getSelection) return c.getSelection().toString();
            else if (d.getSelection) return d.getSelection();
            else if (d.selection) return d.selection.createRange().text;
            else throw "getSelectedText failed";
        }
        function p(f) {
            var c;
            for (var d = 0,
            i = f.length; d < i; d++) {
                c = f[d];
                g(c, "mousedown",
                function() {
                    a = l
                },
                true);
                g(c, "mousemove",
                function() {
                    if (a == l) {
                        a = h;
                        k();
                        BingCW.Config.DisableHover = true
                    }
                },
                true);
                g(c, "mouseup",
                function(d) {
                    var c = b(x(d));
                    if (a == h) e(c);
                    else {
                        z(c, true);
                        j()
                    }
                    a = m
                },
                true);
                g(c, "dblclick",
                function(c) {
                    var a = b(x(c));
                    e(a)
                },
                true)
            }
        }
        function e(a) {
            if (BingCW.Config.DisableSelection) return;
            a.y = a.y + 10;
            a.x = a.x - 10;
            f = a;
            var b = n();
            if (b.length > 200) return;
            y(b, b)
        }
        function j() {
            BingCW.Config.DisableHover = i
        }
        this.Init = function() {
            p(o);
            K(BingCW, "ShowResult", j);
            i = BingCW.Config.DisableHover
        }
    };
    this.HT = new
    function() {
        var m = 500,
        a = l ? "U": "Z",
        n = "<" + a + ">$1</" + a + ">",
        t = a + "{text-decoration: none;}",
        b = null,
        e = null,
        c = null;
        function g(b) {
            if (b.tagName == "SCRIPT" || b.tagName == "STYLE" || c && c(b)) return;
            if (G[b.id] != undefined) return;
            var k = b.childNodes;
            if (k.length == 0) {
                if (b.nodeName == "#text" && h(b.nodeValue) != "") {
                    var i = b.nodeValue.replace(/(\b([a-zA-Z\-])+\b)/ig, n);
                    if (l) {
                        var o = /^ | $/ig;
                        i = i.replace(o, "&nbsp;")
                    }
                    var j = d.createElement(a);
                    j.innerHTML = i;
                    b.parentNode.replaceChild(j, b);
                    var f = j.childNodes;
                    for (var e = 0; e < f.length; e++) if (f[e].nodeName == a) f[e].onmouseover = f[e].onmouseout = function(a) {
                        q(x(a), this)
                    }
                }
            } else for (var m = 0; m < k.length; m++) g(k[m])
        }
        function q(c) {
            if (BingCW.Config.DisableHover) return;
            var a = c.type;
            if ("mouseout" == a) {
                if (e) r(e);
                k();
                z()
            } else if ("mouseover" == a) {
                b = gb(c);
                if (h(j) == h(b.innerHTML)) return;
                B();
                e = s(function() {
                    i()
                },
                m)
            } else throw "HT";
        }
        function i() {
            if (BingCW.Config.DisableHover) return;
            var a = BingCW.HT.GetQuery(b),
            c = b.innerHTML;
            f = p(b);
            y(c, a)
        }
        function p(a) {
            var c = J(a, "Left"),
            b = J(a, "Top"),
            d = b + a.offsetHeight;
            return {
                x: c,
                y: d
            }
        }
        this.GetQuery = function(a) {
            return a.innerHTML
        };
        this.Init = function(a) {
            if (a && a.HoverProtectFunction) c = a.HoverProtectFunction;
            C(t);
            for (var b = 0,
            d = o.length; b < d; b++) g(o[b])
        };
        this.Phrase = new
        function() {
            var g = "@",
            c = 2;
            function i(a, b) {
                if (b) return a.nextSibling;
                else return a.previousSibling
            }
            function d(a) {
                if (a && a.childNodes && a.childNodes.length > 1) return d(a.childNodes[0]);
                else return a
            }
            function e(d, a, b) {
                var c = i(d, a);
                if (b <= 0 || c) return c;
                else return e(d.parentNode, a, b - 1)
            }
            function f(f, g) {
                var b = null;
                if (f) {
                    b = d(e(f, g, c));
                    while (b && (b.nodeValue == " " || b.nodeValue == " ")) b = d(e(b, g, c));
                    if (b && b.nodeName != a) b = null
                }
                return b
            }
            function b(a, b, c) {
                if (c) return a + g + b;
                else return b + g + a
            }
            function h(h, c) {
                var a = "",
                d = f(h, c);
                if (d) {
                    a = b(a, d.innerHTML, c);
                    var e = f(d, c),
                    g = e ? e.innerHTML: "";
                    a = b(a, g, c)
                } else {
                    a = b(a, "", c);
                    a = b(a, "", c)
                }
                return a
            }
            function j(a, b) {
                if (BingCW.Config.DisablePharse) return b;
                var d = h(a, true),
                c = h(a, false);
                return c + b + d
            }
            this.Init = function(a) {
                if (a && a.SpanGapDeep) c = a.SpanGapDeep;
                K(BingCW.HT, "GetQuery", null, j, true)
            }
        }
    };
    this.setIconChangeHandler = function(a) {
        this.Icon.setHandler(a)
    };
    this.setIconStatus = function(a) {
        this.Icon.setStatus(a)
    }
}