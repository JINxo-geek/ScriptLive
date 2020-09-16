// ==UserScript==
// @name         小窗口视频（bili，mgtv，youtube）
// @version      0.11
// @license      MPL-2.0
// @namespace
// @description  小窗口视频（bili，mgtv）。网页右下角会出现一个小按钮，点击之后视频会通过小窗口播放。基于chrome浏览器的画中画（Picture in Picture）。限支持HTML5播放器的网站。如需添加其他网站，可以在脚本的“设置”页面->“用户匹配”栏中添加，或者通过greasyfork反馈给我们。ps：最新推出插件版，功能全面加强，已在 chrome 商店上架，地址https://chrome.google.com/webstore/detail/%E5%B0%8F%E7%AA%97%E5%8F%A3%E8%A7%86%E9%A2%91-by-c4r/banggcaohiaanmdkalekjcffjonamlkj
// @author       c4r
// @require      https://code.jquery.com/jquery-latest.js
// @match        https://www.bilibili.com/video/*
// @match        https://www.bilibili.com/bangumi/*
// @match        https://live.bilibili.com/*
// @match        https://www.mgtv.com/b/*
// @match        https://www.mgtv.com/l/*
// @match        https://www.bilibili.com/watchlater/*
// @match        https://www.youtube.com/*
// @grant        GM_addStyle
// @namespace 
// ==/UserScript==

(function () {
    'use strict';

    GM_addStyle(`
#c4r-oxgs73w7rh {
/* background-color: aqua; */
height: 100px;
width: 36px;
position: fixed;
/* overflow: hidden; */
bottom: -5px;
right: -5px;
cursor: pointer;
z-index: 999
}

#c4r-oxgs73w7rh>div {
transform-origin: 100% 100%;
transition: transform 0.5s ease;
height: 36px;
width: 36px;
border-radius: 18px 18px 0px 18px;
position: absolute;
bottom: 0px;
right: 0px;
background-color: #cacaca;
overflow: hidden;
}

#c4r-oxgs73w7rh svg {
position: relative;
transition: transform 0.5s ease;
height: 100px;
width: 100px;
top: -32px;
left: -32px;
}

#c4r-oxgs73w7rh.c4r-oxgs73w7rh-surprise:hover>div {
transform-origin: 100% 100%;
transform: scale(4.5);
}

#c4r-oxgs73w7rh.c4r-oxgs73w7rh-surprise:hover svg {
transform: scale(0.4);
}

#c4r-oxgs73w7rh:hover>div {
transform-origin: 100% 100%;
transform: scale(3);
}
`)
    let videoUrl = undefined;
    let timeID = 0

    let loadmetaRespon = function (timeID) {

        if (document.pictureInPictureElement
            && (!document.pictureInPictureElement.src
                || document.pictureInPictureElement.src != $('video').attr('src'))) {

            if (timeID) {
                clearTimeout(timeID)
            }
            console.log("picInpic : loadedmetadata")
            // document.exitPictureInPicture()
            document.getElementsByTagName('video')[0].requestPictureInPicture().catch(error => {
                // 视频无法进入画中画模式
                console.log('picInpic error : ', error, document.pictureInPictureElement)
                // loadedmetadata有的时候触发的太快....等5秒的timeout影响观感
                timeID = setTimeout(() => {

                    if (document.pictureInPictureElement
                        && (!document.pictureInPictureElement.src
                            || document.pictureInPictureElement.src != $('video').attr('src'))) {
                        // 最后一次尝试进入画中画
                        console.log("picInpic : setTimeout : pictureInPictureElement ：LAST")
                        // document.exitPictureInPicture()
                        $('video').get(0).requestPictureInPicture()
                        // document.getElementsByTagName('video')[0].removeEventListener("loadedmetadata", loadmetaRespon(timeID))
                    }

                }, 2000);
            });
            // document.getElementsByTagName('video')[0].removeEventListener("loadeddata", loadmetaRespon(timeID))
        }
    }

    /**
     *
     */
    let callbackVideo = function (mutationList, observer) {
        // console.log("coin change : ", mutationList)

        // 保证video已经有url
        if (document.pictureInPictureElement && $('video').length > 0 && $('video').attr('src') && $('video').attr('src').length > 0) {

            // 抓到url之后就不再处理了
            if (videoUrl != $('video').attr('src')) {

                // 视频地址发生变更
                videoUrl = $('video').attr('src')
                console.log("picInpic : video address changed ", $('video').attr('src'))
                // 如果pictureInPictureElement的src与当前video的src不一致
                if (!document.pictureInPictureElement.src
                    || document.pictureInPictureElement.src != $('video').attr('src')) {
                    // console.log("picInpic : video address changed ", $('video').attr('src'))
                    // 在画中画里
                    // console.log("picInpic : pictureInPictureElement ", document.pictureInPictureElement)

                    // 防止loadedmetadata没有被触发
                    timeID = setTimeout(() => {

                        if (document.pictureInPictureElement
                            && (!document.pictureInPictureElement.src
                                || document.pictureInPictureElement.src != $('video').attr('src'))) {
                            // 首次尝试进入画中画
                            console.log("picInpic : setTimeout : pictureInPictureElement ")
                            // document.exitPictureInPicture()
                            $('video').get(0).requestPictureInPicture()
                            // document.getElementsByTagName('video')[0].removeEventListener("loadedmetadata", loadmetaRespon(timeID))
                        }

                    }, 5000);
                }

                // document.getElementsByTagName('video')[0].removeEventListener("loadeddata", loadmetaRespon(timeID))
                document.getElementsByTagName('video')[0].addEventListener("canplay", loadmetaRespon(timeID), { once: true })


                // $('video').on("timeupdate", () => {
                //     if (document.pictureInPictureElement
                //         && document.pictureInPictureElement.src != document.getElementsByTagName('video')[0].src) {
                //         document.getElementsByTagName('video')[0].requestPictureInPicture().catch(error => {
                //             // 视频无法进入画中画模式
                //             console.log('picInpic error : ', error, document.pictureInPictureElement)
                //         });
                //     }
                // })


            }
        }

    }
    let observerVideo = new MutationObserver(callbackVideo)



    document.body.insertAdjacentHTML('beforeend', '<div id="c4r-oxgs73w7rh" class="hover ' + (Math.random() > 0.15 ? "" : "c4r-oxgs73w7rh-surprise") + '">'+'<button>小</button>'+"</div>")


    if (document.pictureInPictureEnabled) {

        document.getElementById('c4r-oxgs73w7rh').addEventListener("click", () => {
            let target = document.getElementsByTagName('video')[0]
            if (target) {
                document.getElementsByTagName('video')[0].requestPictureInPicture().then(() => {
                    videoUrl = $('video').attr('src')
                    observerVideo.disconnect()
                    observerVideo.observe($('body').get(0),
                        {
                            subtree: true, childList: true, characterData: true, attributes: true,
                            attributeOldValue: false, characterDataOldValue: false
                        })
                }).catch(error => {
                    // 视频无法进入画中画模式
                });
            } else {
                try {
                    target = $('iframe').contents().find('video').get(0)
                    target.requestPictureInPicture()
                }
                catch (err) {
                    alert("发现网页套娃，请尝试添加此域名：         " + document.getElementsByTagName('iframe')[0].src.match(/^http.?:\/\/[^/]+/)[0] + "/*")
                }
            }
        })
    } else {
        $('div#c4r-oxgs73w7rh>div').css('background-color', '#fd676f')
    }


})();