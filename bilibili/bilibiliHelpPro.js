// ==UserScript==
// @name         B站直播自动抢辣条 定制版
// @namespace    http://tampermonkey.net/
// @version      1.0
// @description  
// @author       JINxo
// @include      /https?:\/\/live\.bilibili\.com\/\d+\??.*/
// @include      /https?:\/\/live\.bilibili\.com/blanc/\d+\??.*/
// @require      https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js
// @require      https://greasyfork.org/scripts/38140-bilibiliapi/code/BilibiliAPI.js
// ==/UserScript==
let logSwitch = false; //控制开关
let NAME = 'IZAYOI';
let BAPI;
let server_host;
if (!logSwitch) {
    console.log = () => {
    };//关闭控制台输出
}
let Live_info = {room_id: undefined, uid: undefined};
$(function () {//DOM完毕，等待弹幕加载完成
    let loadInfo = (delay) => {
        setTimeout(function () {
            if (BilibiliLive === undefined || parseInt(BilibiliLive.UID) === 0 || isNaN(parseInt(BilibiliLive.UID))) {
                loadInfo(1000);
                console.log('无配置信息');
            } else {
                Live_info.room_id = BilibiliLive.ROOMID;
                Live_info.uid = BilibiliLive.UID;
                console.log(Live_info);
                init();
            }
        }, delay);
    };
    loadInfo(1000);
    addStyle();//加载style
});

Array.prototype.remove = function (val) {
    let index = this.indexOf(val);
    if (index > -1) {
        this.splice(index, 1);
    }
};

function addStyle() {
    $('head').append(`
<style>
    .izayoi_input{
        outline: none;
        border: 1px solid #e9eaec;
        background-color: #fff;
        border-radius: 4px;
        padding: 1px 0 0;
        overflow: hidden;
        font-size: 12px;
        line-height: 19px;
        width: 30px;
    }
    .izayoi_btn{
        background-color: #23ade5;
        color: #fff;
        border-radius: 4px;
        border: none;
        padding: 5px;
        cursor: pointer;
        box-shadow: 0 0 2px #00000075;
    }
    .izayoi_fs{
        border: 2px solid #d4d4d4;
    }
</style>
    `)
}

function init() {//API初始化
    try {
        BAPI = BilibiliAPI;
        BAPI.setCommonArgs(getCookie('bili_jct'));// 设置token
    } catch (err) {
        console.error(`[${NAME}]`, err);
        return;
    }
    const MY_API = {
        CONFIG_DEFAULT: {
            TIME_FLASH: 10e3,
            TIME_GET: 100,
            TIME_RELOAD: 60,
            TOP10_SWITCH: false,
            RANDOM_DELAY: true,
            TIME_AREA_DISABLE: false,
            TIME_AREA_START: 2,
            TIME_AREA_END: 8,
            RANDOM_SKIP: 0,
            MAX_GIFT: 99999,
        },
        CONFIG: {},
        GIFT_COUNT: {
            COUNT: 0,
            LOVE_COUNT: 0,
            CLEAR_TS: 0,
        },
        init: function () {
            let p = $.Deferred();
            try {
                MY_API.loadConfig().then(function () {
                    MY_API.chatLog('脚本载入配置成功', 'success');
                    p.resolve()
                });
            } catch (e) {
                console.log('API初始化出错', e);
                MY_API.chatLog('脚本初始化出错', 'warning');
                p.reject()
            }
            return p
        },
        loadConfig: function () {
            let p = $.Deferred();
            try {
                let config = JSON.parse(localStorage.getItem(`${NAME}_CONFIG`));
                $.extend(true, MY_API.CONFIG, MY_API.CONFIG_DEFAULT);
                for (let item in MY_API.CONFIG) {
                    if (!MY_API.CONFIG.hasOwnProperty(item)) continue;
                    if (config[item] !== undefined && config[item] !== null) MY_API.CONFIG[item] = config[item];
                }
                MY_API.loadGiftCount();//载入礼物统计
                p.resolve()
            } catch (e) {
                console.log('API载入配置失败，加载默认配置', e);
                MY_API.setDefaults();
                p.reject()
            }
            return p
        },
        saveConfig: function () {
            try {
                localStorage.setItem(`${NAME}_CONFIG`, JSON.stringify(MY_API.CONFIG));
                MY_API.chatLog('配置已保存');
                console.log(MY_API.CONFIG);
                return true
            } catch (e) {
                console.log('API保存出错', e);
                return false
            }
        },
        setDefaults: function () {
            MY_API.CONFIG = MY_API.CONFIG_DEFAULT;
            MY_API.saveConfig();
            MY_API.chatLog('配置已重置为默认3秒后刷新页面');
            setTimeout(() => {
                window.location.reload()
            }, 3000);
        },
        loadGiftCount: function () {
            try {
                let config = JSON.parse(localStorage.getItem(`${NAME}_GIFT_COUNT`));
                for (let item in MY_API.GIFT_COUNT) {
                    if (!MY_API.GIFT_COUNT.hasOwnProperty(item)) continue;
                    if (config[item] !== undefined && config[item] !== null) MY_API.GIFT_COUNT[item] = config[item];
                }
                console.log(MY_API.GIFT_COUNT);
            } catch (e) {
                console.log('读取统计失败', e);
            }
        },
        saveGiftCount: function () {
            try {
                localStorage.setItem(`${NAME}_GIFT_COUNT`, JSON.stringify(MY_API.GIFT_COUNT));
                console.log('统计保存成功', MY_API.GIFT_COUNT);
                return true
            } catch (e) {
                console.log('统计保存出错', e);
                return false
            }
        },
        addGift: function (count) {
            MY_API.GIFT_COUNT.COUNT += count;
            $('#giftCount span:eq(0)').text(MY_API.GIFT_COUNT.COUNT);
            MY_API.saveGiftCount();
        },
        addLove: function (count) {
            MY_API.GIFT_COUNT.LOVE_COUNT += count;
            $('#giftCount span:eq(1)').text(MY_API.GIFT_COUNT.LOVE_COUNT);
            MY_API.saveGiftCount();
        },
        creatSetBox: function () {//创建设置框
            //添加按钮
            let btn = $('<button style="position: absolute; top: 128px; left: 0;z-index: 10;background-color: #23ade5;color: #fff;border-radius: 4px;border: none;padding: 5px;cursor: pointer;box-shadow: 1px 1px 2px #00000075;">' +
                '隐藏当前抽奖信息<br>(抽奖会继续 不影响)</button>');
            btn.click(function () {
                $('.izayoiMsg').hide();
            });
            $('.chat-history-panel').append(btn);
            let div = $('<div>');
            div.css({
                'width': '400px',
                'height': '54px',
                'position': 'absolute',
                'top': '110px',
                'right': '10px',
                'background': '#F0F0F0',
                'padding': '10px',
                'z-index': '10',
                'border-radius': '4px',
                'overflow': 'hidden',
                'box-shadow': '1px 1px 2px #00000075',
            });

            div.on('mouseover mouseout', '', function (e) {
                if (e.type === 'mouseover') {
                    $(this).css('height', 'auto');
                } else {
                    $(this).css('height', '54px');
                }
            });

            div.append(`
<fieldset class="izayoi_fs">
     <legend>今日统计</legend>
            <div id="giftCount" style="font-size: large; text-shadow: 1px 1px #00000066; color: blueviolet;">
                辣条·<span>${MY_API.GIFT_COUNT.COUNT}</span> <s>亲密度</s>·<span>${MY_API.GIFT_COUNT.LOVE_COUNT}</span>
                <button class="izayoi_btn" style="font-size: small" data-action="countReset">重置统计(会刷新页面)</button>
            </div>
</fieldset>
<fieldset class="izayoi_fs">
     <legend>轮刷小时榜功能(占用资源多，不推荐开启)</legend>
            <div data-toggle="TIME_FLASH">
            刷小时榜直♂勃间停留时间(整数)：
            <input class="delay-seconds izayoi_input" type="text">秒
            <button data-action="save" class="izayoi_btn">保存</button>
            </div>
            <div data-toggle="TIME_GET">
            礼物点击速♂度(整数)：
            <input class="delay-seconds izayoi_input" type="text">毫秒
            <button data-action="save" class="izayoi_btn">保存</button>
            </div>
            <div data-toggle="TOP10_SWITCH">
            <label style="cursor: pointer; margin: 5px auto;">
            <input style="vertical-align: text-top;" type="checkbox">刷小时榜功能开关
            </label>
            </div>
</fieldset>
<fieldset class="izayoi_fs">
     <legend>低调设置(不要问我会不会降低小黑屋概率，我也不知道)</legend>
     <div data-toggle="RANDOM_DELAY">
        <label style="cursor: pointer; margin: 5px auto; color: darkgreen">
        <input style="vertical-align: text-top;" type="checkbox">抽奖附加随机延迟3~10s(加在等待时间里)
        </label>
    </div>
    <div data-toggle="TIME_AREA_DISABLE">
        <label style="cursor: pointer; margin: 5px auto; color: darkgreen">
        <input style="vertical-align: text-top;" type="checkbox">启用
        <input class="start izayoi_input" style="width: 20px;" type="text">点至
        <input class="end izayoi_input" style="width: 20px;" type="text">点不抽奖(24小时制)
        <button data-action="save" class="izayoi_btn">保存</button>
        </label>
    </div>
    <div data-toggle="RANDOM_SKIP">
        <label style="cursor: pointer; margin: 5px auto; color: darkgreen">
        随机跳过礼物(整数1到100 设置为0则不跳过)<input class="per izayoi_input" style="width: 20px;" type="text">%
        </label>
        <button data-action="save" class="izayoi_btn">保存</button>
    </div>
    <div data-toggle="MAX_GIFT">
        <label style="cursor: pointer; margin: 5px auto; color: darkgreen">
        当天最多抢辣条数量(整数 亲密度还是会抢的)<input class="num izayoi_input" style="width: 40px;" type="text">
        </label>
        <button data-action="save" class="izayoi_btn">保存</button>
        <div style="color: darkgreen">↑此功能想法来自
            <a href="https://space.bilibili.com/25296686" target="_blank">@1183729</a>
        </div>
    </div>
</fieldset>
<fieldset class="izayoi_fs">
    <legend>其他设置</legend>
    <div data-toggle="TIME_RELOAD">
    本直播间重载时间(整数 刷新后生效 别设置成0)：
    <input class="delay-seconds izayoi_input" type="text" style="width: 30px;">分
    <button data-action="save" class="izayoi_btn">保存</button>
    </div>
    <div><button data-action="reset" style="color: red;" class="izayoi_btn">重置所有为默认</button></div>
</fieldset>

<fieldset class="izayoi_fs">
    <legend>说明</legend>
    <span style="color: rgb(79,178,255);">直播间重载目的是防止页面崩溃以及弹幕监听新的在线直播间</span><br>
    <span style="color: rebeccapurple">
    请求式会监听所有分区能抢所有分区会广播的礼物，不会广播的礼物也能从同一直播间或者小时榜上的直播间顺带抢一部分，如舰长、提督、PK</span><br>
    <span style="color: #a8076c">礼物信息现在保存在浏览器缓存，出现重复领取的现象大大降低</span><br>
    <span style="color: #e600ff">如果你发现突然多了10w银瓜子，那么恭喜你中奖了</span><br>
    <span style="color: #770080;">如果使用请求式抢礼物，无需开启刷小时榜，开这个直播间就够了</span><br>
    <span style="color: red;">如果你不知道如何设置重置为默认即可</span><br>
    <span style="color: #488e1d;">如果脚本载入配置成功后没有提示连接弹幕服务器成功的话，尝试换浏览器更新浏览器及插件至最新</span><br>
    <span style="color: #d58fff;">我语文不好如果没解释清楚，你他妈来打我呀</span><br>
</fieldset>
<fieldset class="izayoi_fs">
    <legend>更新</legend>
    <ul>
        <li><span style="color: rgb(79,178,255);">5-19:修复辣条统计(好像现在上船没有亲密度了)，添加伪造直播间进入记录，优化辣条限制功能逻辑</span></li>
    </ul>
</fieldset>
`);
            $('.player-ctnr').append(div);

            //对应配置状态
            div.find('div[data-toggle="TIME_FLASH"] .delay-seconds').val((MY_API.CONFIG.TIME_FLASH / 1000).toString());
            div.find('div[data-toggle="TIME_GET"] .delay-seconds').val(MY_API.CONFIG.TIME_GET.toString());
            div.find('div[data-toggle="TIME_RELOAD"] .delay-seconds').val(MY_API.CONFIG.TIME_RELOAD.toString());
            div.find('div[data-toggle="RANDOM_SKIP"] .per').val((parseInt(MY_API.CONFIG.RANDOM_SKIP)).toString());
            div.find('div[data-toggle="MAX_GIFT"] .num').val((parseInt(MY_API.CONFIG.MAX_GIFT)).toString());
            if (MY_API.CONFIG.TOP10_SWITCH) div.find('div[data-toggle="TOP10_SWITCH"] input').attr('checked', '');
            if (MY_API.CONFIG.RANDOM_DELAY) div.find('div[data-toggle="RANDOM_DELAY"] input').attr('checked', '');
            if (MY_API.CONFIG.TIME_AREA_DISABLE) div.find('div[data-toggle="TIME_AREA_DISABLE"] input').attr('checked', '');
            div.find('div[data-toggle="TIME_AREA_DISABLE"] .start').val(MY_API.CONFIG.TIME_AREA_START.toString());
            div.find('div[data-toggle="TIME_AREA_DISABLE"] .end').val(MY_API.CONFIG.TIME_AREA_END.toString());

            //事件绑定
            div.find('div[data-toggle="TIME_FLASH"] [data-action="save"]').click(function () {//TIME_FLASH save按钮
                if (MY_API.CONFIG.TIME_FLASH === parseInt(parseInt(div.find('div[data-toggle="TIME_FLASH"] .delay-seconds').val()) * 1000)) {
                    MY_API.chatLog('改都没改保存尼玛呢');
                    return
                }
                MY_API.CONFIG.TIME_FLASH = parseInt(parseInt(div.find('div[data-toggle="TIME_FLASH"] .delay-seconds').val()) * 1000);
                MY_API.saveConfig()
            });

            div.find('div[data-toggle="TIME_GET"] [data-action="save"]').click(function () {//TIME_GET save按钮
                if (MY_API.CONFIG.TIME_GET === parseInt(div.find('div[data-toggle="TIME_GET"] .delay-seconds').val())) {
                    MY_API.chatLog('改都没改保存尼玛呢');
                    return
                }
                MY_API.CONFIG.TIME_GET = parseInt(div.find('div[data-toggle="TIME_GET"] .delay-seconds').val());
                MY_API.saveConfig()
            });

            div.find('div[data-toggle="RANDOM_SKIP"] [data-action="save"]').click(function () {//RANDOM_SKIP save按钮
                let val = parseInt(div.find('div[data-toggle="RANDOM_SKIP"] .per').val());
                if (MY_API.CONFIG.RANDOM_SKIP === val) {
                    MY_API.chatLog('改都没改保存尼玛呢');
                    return
                }
                MY_API.CONFIG.RANDOM_SKIP = val;
                MY_API.saveConfig()
            });

            div.find('div[data-toggle="MAX_GIFT"] [data-action="save"]').click(function () {//MAX_GIFT save按钮
                let val = parseInt(div.find('div[data-toggle="MAX_GIFT"] .num').val());
                if (MY_API.CONFIG.MAX_GIFT === val) {
                    MY_API.chatLog('改都没改保存尼玛呢');
                    return
                }
                MY_API.CONFIG.MAX_GIFT = val;
                MY_API.saveConfig()
            });

            div.find('button[data-action="reset"]').click(function () {//重置按钮
                MY_API.setDefaults();
            });

            div.find('div[data-toggle="TIME_RELOAD"] [data-action="save"]').click(function () {//TIME_RELOAD save按钮
                let val = parseInt(div.find('div[data-toggle="TIME_RELOAD"] .delay-seconds').val());
                if (MY_API.CONFIG.TIME_RELOAD === val) {
                    MY_API.chatLog('改都没改保存尼玛呢');
                    return
                }
                if (val <= 0 || val > 10000) {
                    MY_API.chatLog('你咋不上天呢');
                    return
                }
                MY_API.CONFIG.TIME_RELOAD = val;
                MY_API.saveConfig()
            });

            div.find('div[data-toggle="TOP10_SWITCH"] input').change(function () {//
                MY_API.CONFIG.TOP10_SWITCH = $(this).prop('checked');
                MY_API.saveConfig()
            });

            div.find('div[data-toggle="RANDOM_DELAY"] input').change(function () {//
                MY_API.CONFIG.RANDOM_DELAY = $(this).prop('checked');
                MY_API.saveConfig()
            });

            div.find('div[data-toggle="TIME_AREA_DISABLE"] input:checkbox').change(function () {//
                MY_API.CONFIG.TIME_AREA_DISABLE = $(this).prop('checked');
                MY_API.saveConfig()
            });

            div.find('div[data-toggle="TIME_AREA_DISABLE"] [data-action="save"]').click(function () {//
                MY_API.CONFIG.TIME_AREA_START = parseInt(div.find('div[data-toggle="TIME_AREA_DISABLE"] .start').val());
                MY_API.CONFIG.TIME_AREA_END = parseInt(div.find('div[data-toggle="TIME_AREA_DISABLE"] .end').val());
                MY_API.saveConfig()
            });

            div.find('#giftCount [data-action="countReset"]').click(function () {//
                MY_API.GIFT_COUNT = {
                    COUNT: 0,
                    LOVE_COUNT: 0,
                    CLEAR_TS: 0,
                };
                MY_API.saveGiftCount();
                MY_API.chatLog('已清空3秒后刷新页面');
                setTimeout(() => {
                    window.location.reload()
                }, 3000);
            });
        },
        chatLog: function (text, type = 'info') {//自定义提示
            let div = $("<div class='izayoiMsg'>");
            let msg = $("<div>");
            let ct = $('#chat-history-list');
            let myDate = new Date();
            msg.text(text);
            div.text(myDate.toLocaleString());
            div.append(msg);
            div.css({
                'text-align': 'center',
                'border-radius': '4px',
                'min-height': '30px',
                'width': '256px',
                'color': '#9585FF',
                'line-height': '30px',
                'padding': '0 10px',
                'margin': '10px auto',
            });
            msg.css({
                'word-wrap': 'break-word',
                'width': '100%',
                'line-height': '1em',
                'margin-bottom': '10px',
            });
            switch (type) {
                case 'warning':
                    div.css({
                        'border': '1px solid rgb(236, 221, 192)',
                        'color': 'rgb(218, 142, 36)',
                        'background': 'rgb(245, 235, 221) none repeat scroll 0% 0%',
                    });
                    break;
                case 'success':
                    div.css({
                        'border': '1px solid rgba(22, 140, 0, 0.28)',
                        'color': 'rgb(69, 171, 69)',
                        'background': 'none 0% 0% repeat scroll rgba(16, 255, 0, 0.18)',
                    });
                    break;
                default:
                    div.css({
                        'border': '1px solid rgb(203, 195, 255)',
                        'background': 'rgb(233, 230, 255) none repeat scroll 0% 0%',
                    });
            }
            ct.find('#chat-items').append(div);//向聊天框加入信息
            ct.scrollTop(ct.prop("scrollHeight"));//滚动到底部
        },
        blocked: false,
        max_blocked: false,
        listen: (roomId, uid, area = '本直播间') => {
            BAPI.room.getConf(roomId).then((response) => {
                server_host = response.data.host;
                console.log('服务器地址', response);
                let wst = new BAPI.DanmuWebSocket(uid, roomId, response.data.host_server_list, response.data.token);
                wst.bind((newWst) => {
                    wst = newWst;
                    MY_API.chatLog(`${area}弹幕服务器连接断开，尝试重连`, 'warning');
                }, () => {
                    MY_API.chatLog(`——————连接弹幕服务器成功——————\n房间号: ${roomId} 分区: ${area}`
                        , 'success');
                }, () => {
                    if (MY_API.blocked) {
                        wst.close();
                        MY_API.chatLog(`进了小黑屋主动与弹幕服务器断开连接-${area}`, 'warning')
                    }
                    if (MY_API.max_blocked) {
                        wst.close();
                        MY_API.chatLog(`辣条最大值主动与弹幕服务器断开连接-${area}`, 'warning')
                    }
                }, (obj) => {
                    if (inTimeArea(MY_API.CONFIG.TIME_AREA_START, MY_API.CONFIG.TIME_AREA_END) && MY_API.CONFIG.TIME_AREA_DISABLE) return;//当前是否在两点到八点 如果在则返回

                    console.log('弹幕公告' + area, obj);
                    switch (obj.cmd) {
                        case 'GUARD_MSG':
                            if (obj.roomid === obj.real_roomid) {
                                MY_API.checkRoom(obj.roomid, area);
                            } else {
                                MY_API.checkRoom(obj.roomid, area);
                                MY_API.checkRoom(obj.real_roomid, area);
                            }
                            break;
                        case 'PK_BATTLE_SETTLE_USER':
                            MY_API.checkRoom(obj.data.winner.room_id, area);
                            break;
                        case 'NOTICE_MSG':
                            if (obj.roomid === obj.real_roomid) {
                                MY_API.checkRoom(obj.roomid, area);
                            } else {
                                MY_API.checkRoom(obj.roomid, area);
                                MY_API.checkRoom(obj.real_roomid, area);
                            }
                            break;
                        default:
                            return;
                    }
                });
            }, () => {
                MY_API.chatLog('获取弹幕服务器地址错误', 'warning')
            });
        },
        RoomId_list: [],
        err_roomId: [],
        checkRoom: function (roomId, area = '本直播间') {
            if (MY_API.blocked || MY_API.max_blocked) {
                return
            }
            if (MY_API.RoomId_list.indexOf(roomId) >= 0) {//防止重复检查直播间
                return
            } else {
                MY_API.RoomId_list.push(roomId);
            }
            BAPI.room.room_entry_action(roomId);//直播间进入记录
            $.get('https://api.live.bilibili.com/xlive/lottery-interface/v1/lottery/Check?roomid=' + roomId,
                function (re) {
                    MY_API.RoomId_list.remove(roomId);//移除房间号
                    console.log('检查房间返回信息', re);
                    let data = re.data;
                    if (re.code === 0) {
                        let list;
                        if (data.gift) {
                            list = data.gift;
                            for (let i in list) {
                                if (!list.hasOwnProperty(i)) continue;
                                MY_API.creat_join(roomId, list[i], 'gift', area)
                            }
                        }
                        if (data.guard) {
                            list = data.guard;
                            for (let i in list) {
                                if (!list.hasOwnProperty(i)) continue;
                                MY_API.creat_join(roomId, list[i], 'guard', area)
                            }
                        }
                        if (data.pk) {
                            list = data.pk;
                            for (let i in list) {
                                if (!list.hasOwnProperty(i)) continue;
                                MY_API.creat_join(roomId, list[i], 'pk', area)
                            }
                        }
                    } else {
                        if (MY_API.err_roomId.indexOf(roomId) > -1) {
                            console.log(`[检查此房间出错多次]${roomId}${re.message}`);
                        } else {
                            MY_API.err_roomId.push(roomId);
                            MY_API.checkRoom(roomId, area);
                            console.log(`[检查房间出错_重试一次]${roomId}${re.message}`);
                        }

                    }
                });
        },
        Id_list_history: {
            add: function (id, type) {
                let id_list = [];
                try {
                    let config = JSON.parse(localStorage.getItem(`${NAME}_${type}Id_list`));
                    id_list = [].concat(config.list);
                    id_list.push(id);
                    if (id_list.length > 150) {
                        id_list.splice(0, 50);//删除前50条数据
                    }
                    localStorage.setItem(`${NAME}_${type}Id_list`, JSON.stringify({list: id_list}));
                    console.log(`${NAME}_${type}Id_list_add`, id_list);
                } catch (e) {
                    id_list.push(id);
                    localStorage.setItem(`${NAME}_${type}Id_list`, JSON.stringify({list: id_list}));
                }
            },
            isIn: function (id, type) {
                let id_list = [];
                try {
                    let config = JSON.parse(localStorage.getItem(`${NAME}_${type}Id_list`));
                    if (config === null) {
                        id_list = [];
                    } else {
                        id_list = [].concat(config.list);
                    }
                    console.log(`${NAME}_${type}Id_list_read`, config);
                    return id_list.indexOf(id) > -1
                } catch (e) {
                    localStorage.setItem(`${NAME}_${type}Id_list`, JSON.stringify({list: id_list}));
                    console.log('读取' + `${NAME}_${type}Id_list` + '缓存错误已重置');
                    return id_list.indexOf(id) > -1
                }
            }
        },
        raffleId_list: [],
        guardId_list: [],
        pkId_list: [],
        creat_join: function (roomId, data, type, area = '本直播间') {
            console.log('礼物信息', data);
            if (MY_API.GIFT_COUNT.COUNT >= MY_API.CONFIG.MAX_GIFT) {//判断是否超过辣条限制
                console.log('超过今日辣条限制，不参与抽奖');
                MY_API.max_blocked = true;
                return
            }
            switch (type) {//防止重复抽奖上船PK
                case 'gift':
                    if (MY_API.Id_list_history.isIn(data.raffleId, 'raffle')) {
                        console.log('礼物重复');
                        return
                    } else {
                        MY_API.raffleId_list.push(data.raffleId);
                        MY_API.Id_list_history.add(data.raffleId, 'raffle');
                    }
                    break;
                case 'guard':
                    if (MY_API.Id_list_history.isIn(data.id, 'guard')) {
                        console.log('舰长重复');
                        return
                    } else {
                        MY_API.guardId_list.push(data.id);
                        MY_API.Id_list_history.add(data.id, 'guard');
                    }
                    break;
                case 'pk':
                    if (MY_API.Id_list_history.isIn(data.id, 'pk')) {
                        console.log('pk重复');
                        return
                    } else {
                        MY_API.pkId_list.push(data.id);
                        MY_API.Id_list_history.add(data.id, 'pk');
                    }
                    break;
            }

            let delay = data.time_wait || 0;
            if (MY_API.CONFIG.RANDOM_DELAY) delay += 2 + Math.ceil(Math.random() * 8);//随机延迟
            let div = $("<div class='izayoiMsg'>");
            let msg = $("<div>");
            let aa = $("<div>");
            let ct = $('#chat-history-list');
            let myDate = new Date();
            msg.text(`[${area}]` + data.thank_text.split('<%')[1].split('%>')[0] + data.thank_text.split('%>')[1]);
            div.text(myDate.toLocaleString());
            div.append(msg);
            aa.css('color', 'red');
            aa.text('等待抽奖');
            msg.append(aa);
            div.css({
                'text-align': 'center',
                'border-radius': '4px',
                'min-height': '30px',
                'width': '256px',
                'color': '#9585FF',
                'line-height': '30px',
                'padding': '0 10px',
                'margin': '10px auto',
            });
            msg.css({
                'word-wrap': 'break-word',
                'width': '100%',
                'line-height': '1em',
                'margin-bottom': '10px',
            });

            div.css({
                'border': '1px solid rgb(203, 195, 255)',
                'background': 'rgb(233, 230, 255) none repeat scroll 0% 0%',
            });

            ct.find('#chat-items').append(div);//向聊天框加入信息
            ct.scrollTop(ct.prop("scrollHeight"));//滚动到底部
            let timer = setInterval(function () {
                aa.text(`等待抽奖倒计时${delay}秒`);
                if (delay <= 0) {
                    if (probability(MY_API.CONFIG.RANDOM_SKIP)) {
                        aa.text(`跳过此礼物抽奖`);
                    } else {
                        aa.text(`进行抽奖...`);
                        switch (type) {
                            case 'gift':
                                MY_API.gift_join(roomId, data.raffleId, data.type).then(function (msg, num) {
                                    aa.text('获得' + msg);
                                    if (num) {
                                        if (msg.indexOf('辣条') > -1) {
                                            MY_API.addGift(num);
                                        } else if (msg.indexOf('亲密度') > -1) {
                                            MY_API.addLove(num);
                                        }
                                    }
                                    MY_API.raffleId_list.remove(data.raffleId);//移除礼物id列表
                                });
                                break;
                            case 'guard':
                                MY_API.guard_join(roomId, data.id).then(function (msg, num) {
                                    aa.text('获得' + msg);
                                    if (num) {
                                        if (msg.indexOf('辣条') > -1) {
                                            MY_API.addGift(num);
                                        } else if (msg.indexOf('亲密度') > -1) {
                                            MY_API.addLove(num);
                                        }
                                    }
                                    MY_API.guardId_list.remove(data.id);//移除礼物id列表
                                });
                                break;
                            case 'pk':
                                MY_API.pk_join(roomId, data.id).then(function (msg, num) {
                                    aa.text('获得' + msg);
                                    if (num) {
                                        if (msg.indexOf('辣条') > -1) {
                                            MY_API.addGift(num);
                                        } else if (msg.indexOf('亲密度') > -1) {
                                            MY_API.addLove(num);
                                        }
                                    }
                                    MY_API.pkId_list.remove(data.id);//移除礼物id列表
                                });
                                break;
                        }
                    }

                    aa.css('color', 'green');
                    clearInterval(timer)
                }
                delay--;
            }, 1000);


        },
        gift_join: function (roomid, raffleId, type) {
            let p = $.Deferred();
            BAPI.Lottery.Gift.join(roomid, raffleId, type).then((response) => {
                console.log('抽奖返回信息', response);
                switch (response.code) {
                    case 0:
                        if (response.data.award_text) {
                            p.resolve(response.data.award_text, response.data.award_num);
                        } else {
                            p.resolve(response.data.award_name + 'X' + response.data.award_num.toString()
                                , response.data.award_num);
                        }
                        break;
                    default:
                        if (response.msg.indexOf('拒绝') > -1) {
                            MY_API.blocked = true;//停止抽奖
                            p.resolve('访问被拒绝，您的帐号可能已经被关小黑屋，已停止');
                        } else {
                            p.resolve(`[礼物抽奖](roomid=${roomid},id=${raffleId},type=${type})${response.msg}`);
                        }
                }
            });
            return p
        },
        guard_join: function (roomid, Id) {
            let p = $.Deferred();
            BAPI.Lottery.Guard.join(roomid, Id).then((response) => {
                console.log('上船抽奖返回信息', response);
                switch (response.code) {
                    case 0:
                        if (response.data.award_text) {
                            p.resolve(response.data.award_text, response.data.award_num);
                        } else {
                            p.resolve(response.data.award_name + 'X' + response.data.award_num.toString()
                                , response.data.award_num);
                        }
                        break;
                    default:
                        if (response.msg.indexOf('拒绝') > -1) {
                            MY_API.blocked = true;//停止抽奖
                            p.resolve('访问被拒绝，您的帐号可能已经被关小黑屋，已停止');
                        } else {
                            p.resolve(`[上船](roomid=${roomid},id=${Id})${response.msg}`);
                        }
                        break;
                }
            });
            return p
        },
        pk_join: function (roomid, Id) {
            let p = $.Deferred();
            BAPI.Lottery.Pk.join(roomid, Id).then((response) => {
                console.log('PK抽奖返回信息', response);
                switch (response.code) {
                    case 0:
                        if (response.data.award_text) {
                            p.resolve(response.data.award_text, response.data.award_num);
                        } else {
                            p.resolve(response.data.award_name + 'X' + response.data.award_num.toString()
                                , response.data.award_num);
                        }
                        break;
                    default:
                        if (response.msg.indexOf('拒绝') > -1) {
                            MY_API.blocked = true;//停止抽奖
                            p.resolve('访问被拒绝，您的帐号可能已经被关小黑屋，已停止');
                        } else {
                            p.resolve(`[PK](roomid=${roomid},id=${Id})${response.msg}`);
                        }
                        break;
                }
            });
            return p
        },
    };
    MY_API.init().then(function () {
        if (parseInt(Live_info.uid) === 0 || isNaN(parseInt(Live_info.uid))) {
            MY_API.chatLog('未登录，请先登录再使用脚本', 'warning');
            return
        }
        console.log(MY_API.CONFIG);
        StartPlunder(MY_API);
        let h = $('html,body');
        h.animate({scrollLeft: h.prop('scrollWidth')}, 0);//画面最右边
    });
}

function StartPlunder(API) {
    'use strict';
    let index, nowIndex;
    let LIVE_PLAYER_STATUS = window.localStorage["LIVE_PLAYER_STATUS"];

    if (Live_info.room_id === 1645713) {
        if (LIVE_PLAYER_STATUS.indexOf("flash") >= 0) {
            window.localStorage["LIVE_PLAYER_STATUS"] = window.localStorage["LIVE_PLAYER_STATUS"].replace("flash", 'html5');
            window.location.reload();
            return
        }

        let LT_Timer = () => {//判断是否清空辣条数量
            if (checkNewDay(API.GIFT_COUNT.CLEAR_TS)) {
                API.GIFT_COUNT.COUNT = 0;
                API.GIFT_COUNT.LOVE_COUNT = 0;
                API.GIFT_COUNT.CLEAR_TS = dateNow();
                API.saveGiftCount();
                console.log('清空辣条数量')
            } else {
                console.log('无需清空辣条数量')
            }
        };
        setInterval(LT_Timer, 60e3);
        LT_Timer();
        if (Live_info.room_id.toString().indexOf('5713') === -1) API.blocked = true;
        API.creatSetBox();//创建设置框

        BAPI.room.getList().then((response) => {//获取各分区的房间号
            console.log('直播间列表', response);
            for (const obj of response.data) {
                BAPI.room.getRoomList(obj.id, 0, 0, 1, 1).then((response) => {
                    console.log('直播间号列表', response);
                    for (let j = 0; j < response.data.length; ++j) {
                        API.listen(response.data[j].roomid, Live_info.uid, `${obj.name}区`);
                    }
                });
            }
        });
        let check_top_room = () => { //检查小时榜房间时钟
            if (API.GIFT_COUNT.COUNT >= API.CONFIG.MAX_GIFT) {//判断是否超过辣条限制
                console.log('超过今日辣条限制，不参与抽奖');
                API.max_blocked = true;
            }
            if (API.blocked || API.max_blocked) {//如果被禁用则停止
                if (API.blocked) {
                    API.chatLog('进入小黑屋检查小时榜已停止运行');
                } else {
                    API.chatLog('辣条已达到最大值检查小时榜已停止运行');
                }
                clearInterval(check_timer);
                return
            }
            if (inTimeArea(API.CONFIG.TIME_AREA_START, API.CONFIG.TIME_AREA_END) && API.CONFIG.TIME_AREA_DISABLE) {//判断时间段
                API.chatLog('当前时间段不检查小时榜礼物', 'warning');
                return
            }
            $.get("https://api.live.bilibili.com/rankdb/v1/Rank2018/" +
                "getTop?type=master_realtime_hour&type_id=areaid_realtime_hour", function (data) {
                let list = data.data.list;// [{id: ,link:}]
                API.chatLog('检查小时榜房间的礼物', 'warning');
                console.log(list);
                for (let i of list) {
                    API.checkRoom(i.roomid, `小时榜-${i.area_v2_parent_name}区`);
                }
            });
        };
        setTimeout(check_top_room, 6e3);
        let check_timer = setInterval(check_top_room, 600e3);


        let reset = (delay) => {
            setTimeout(function () {//重置直播间
                if (API.raffleId_list.length > 0 || API.guardId_list.length > 0 || API.pkId_list.length > 0) {
                    console.log('还有礼物没抽 延迟30s后刷新直播间');
                    reset(30000);
                    return
                }
                if (API.blocked || API.max_blocked) { //被阻止就不刷新直播间了
                    return
                }
                window.location.reload();
            }, delay);
        };
        reset(API.CONFIG.TIME_RELOAD * 60000);
    } else {
        if (!API.CONFIG.TOP10_SWITCH) {
            API.chatLog('脚本未在此直播间启用', 'warning');
            return
        }
        if (LIVE_PLAYER_STATUS.indexOf("html5") >= 0) {
            window.localStorage["LIVE_PLAYER_STATUS"] = window.localStorage["LIVE_PLAYER_STATUS"].replace("html5", 'flash');
            window.location.reload();
            return
        }

        if (API.CONFIG.TOP10_SWITCH) mode_old();

    }

    function mode_old() {
        try {
            index = getUrlParam("index");
            nowIndex = parseInt(index) + 1;
            if (nowIndex === 12) {
                nowIndex = 0;
            }
            if (isNaN(nowIndex)) nowIndex = 0;
        } catch (error) {
            nowIndex = 0;
        }
        setInterval(function () {
            $(".main").click();//点击抽奖
            $(".draw-full-cntr .function-bar").click();//点击抽奖
        }, parseInt(API.CONFIG.TIME_GET));
        setInterval(function () {
            goTop(nowIndex);//跳转到下一个直播间
        }, API.CONFIG.TIME_FLASH);
    }

    function goTop(index) {
        $.get("https://api.live.bilibili.com/rankdb/v1/Rank2018/getTop?type=master_realtime_hour&type_id=areaid_realtime_hour", function (data) {
            let list = data.data.list;// [{id: ,link:}]
            let link = list[index].link;
            if (!link) {
                link = '/55356';
            }
            let href = parent.location.href;
            //
            if (href.match(/\/\d+/) != null) {
                href = href.replace(/\/\d+/, link);
            } else {
                href = 'https://live.bilibili.com' + link;
            }
            //
            if (href.indexOf('index') >= 0) {
                href = href.replace(/index=\d+/, 'index=' + nowIndex);
            } else {
                if (href.indexOf('?') >= 0) {
                    href += '&index=' + nowIndex;
                } else {
                    href += '?index=' + nowIndex;
                }
            }
            //
            parent.location.href = href;
        });
    }
}

function getUrlParam(name) {
    let reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
    let r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]);
    return null;
}

/**
 * （2,10） 当前是否在两点到十点之间
 * @param a 整数 起始时间
 * @param b 整数 终止时间
 * @returns {boolean}
 */
function inTimeArea(a, b) {
    if (a > b || a > 23 || b > 24 || a < 0 || b < 1) {
        console.log('错误时间段');
        return false
    }
    let myDate = new Date();
    let h = myDate.getHours();
    return h >= a && h < b
}

/**
 * 概率
 * @param val
 * @returns {boolean}
 */
function probability(val) {
    if (val <= 0) return false;
    let rad = Math.ceil(Math.random() * 100);
    return val >= rad
}

const dateNow = () => Date.now();
/**
 * 检查是否为新一天
 * @param ts
 * @returns {boolean}
 */
const checkNewDay = (ts) => {
    if (ts === 0) return true;
    let t = new Date(ts);
    let d = new Date();
    let td = t.getDate();
    let dd = d.getDate();
    return (dd !== td);
};

/**
 * 获取cookie
 * @param name
 * @returns {string|boolean}
 */
function getCookie(name) {
    let arr = document.cookie.match(new RegExp("(^| )" + name + "=([^;]*)(;|$)"));
    if (arr != null) return unescape(arr[2]);
    return false;
}
