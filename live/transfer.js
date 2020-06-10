// ==UserScript==
// @name         彩云小译
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       You
// @match        http://*/*
// @include      https://*/*
// @grant        none
// @match        http://www.globaltimes.cn/
// @match        https://m.baidu.com/from=1000969a/s?word=%E8%8B%B1%E6%96%87%E7%BD%91%E7%AB%99&sa=ts_1&ts=0&t_kt=0&ie=utf-8&rsv_t=b35c1eg6
// ==/UserScript==


!function(){/*《彩云小译js注入版v1.0》【说明】按钮开关“yF”是上滑隐藏下滑显示的。只有点击开关后才会联网加载彩云小译的js脚本*/
if(!document.getElementById("gzfy")){var zfyan=document.createElement("span");zfyan.id="gzfy";zfyan.innerHTML="YF";
zfyan.style.cssText="display:none;text-align:center !important;font-size:20px;width:28px;height:28px;line-height:28px;text-align:center;float:right;position:fixed;right:52px;top:60%;color:#000;opacity:0.8;background:#e3edcd;cursor:pointer;position:fixed !important;z-index:9999999999 !important;box-shadow:0px 1px 1px #000;border-radius:50%";zfyan.addEventListener("click",function(){zfy()});document.body.appendChild(zfyan);}var zfyhdy1,zfyhdy2;document.addEventListener("touchstart",function(e){zfyhdy1=e.changedTouches[0].clientY});document.addEventListener("touchmove",function(e){zfyhdy2=e.changedTouches[0].clientY;document.getElementById("gzfy").style.display=zfyhdy2-zfyhdy1>0?"block":"none"});function zfy(){var zfyfy=document.getElementById("gzfy");zfyfy.parentNode.removeChild(zfyfy);var cyfy=document.createElement("script");cyfy.type="text/javascript";cyfy.charset="UTF-8";cyfy.src=("https:"==document.location.protocol?" https://":"http://")+"caiyunapp.com/dest/trs.js";document.body.appendChild(cyfy); }}();


(function() {
    'use strict';

    // Your code here...
})();