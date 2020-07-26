// ==UserScript==
// @name         Youtube自动加载合适的中文字幕
// @namespace    http://tampermonkey.net/
// @version      0.6
// @description  Youtube 自动加载合适的中文字幕
// @author       Ray
// @match        https://www.youtube.com/watch*
// @require      https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js
// @grant        none
// ==/UserScript==

(function() {
    'use strict';

    function translateToSimpleChinese(){
        var sub = $('[role="menuitem"]:contains("字幕")');
        if(!sub.length) return;
        sub.click();

	    var subf = $('[role="menuitemradio"]:contains("中文（繁体）")');
	    var subt = $('[role="menuitemradio"]:contains("中文（台湾）")');
    	var subx = $('[role="menuitemradio"]:contains("中文（香港）")');
        var subc = $('[role="menuitemradio"]:contains("中文（简体）")');
        var subz = $('[role="menuitemradio"]:contains("中文（中国）")');
        if (subc.length) {
            subc.click();
        }else if (subz.length) {
	        subz.click();
	    }else if (subf.length) {
	        subf.click();
	    }else if (subt.length) {
	        subt.click();
	    }else if (subx.length) {
            subx.click();
	    }else {
            var autoTrans = $('[role="menuitemradio"]:contains("自动翻译")');
                if (!autoTrans.length) return;
                autoTrans.click();
            var autoTransC = $('[role="menuitemradio"]:contains("中文（简体）")');
               if (!autoTransC.length) return;
              autoTransC.click();
        }
        $('ytp-button ytp-settings-button').click();
    }

    function onLoadStart(){
        $('.ytp-subtitles-button[aria-pressed="false"]').click();
        $('.ytp-settings-button').click();
        translateToSimpleChinese();
        $('.ytp-settings-button').click();
    }
    $('video').on('loadstart', onLoadStart).trigger('loadstart');
})();

