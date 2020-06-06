//发送消息
var oldlen = document.querySelectorAll(".you").length;
var fn = function () {
    var len = document.querySelectorAll(".you").length;
    console.log(oldlen, len);
    if (oldlen < len) {
        document.querySelectorAll(".you")[len - 1].children[0];
        var name = document.querySelectorAll(".you")[len - 1].children[0].children[0].innerText;
        var text = document.querySelectorAll(".you")[len - 1].children[2].children[2].innerText;
        console.log(name, text);
        oldlen = len; document.getElementsByClassName("cd-editor-submit")[0].className = "cd-editor-submit";
        document.getElementsByClassName("cd-editor")[0].children[0].value = "🤖" + name + "：" + text; 
        document.getElementsByClassName("cd-editor-submit")[0].click()
    }
}
setInterval(fn, 200);
//目前存在问题,需要先检测网元素才能获取到正确的元素,还有就是提交事件需要用按键精灵配合.