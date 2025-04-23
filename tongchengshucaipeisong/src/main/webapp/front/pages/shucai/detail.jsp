<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>

<!-- 首页 -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>首页</title>
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <link rel="stylesheet" href="../../xznstatic/css/bootstrap.min.css" />
    <!-- 样式 -->
    <link rel="stylesheet" href="../../css/style.css"/>
    <!-- 主题（主要颜色设置） -->
    <link rel="stylesheet" href="../../css/theme.css"/>
    <!-- 通用的css -->
    <link rel="stylesheet" href="../../css/common.css"/>
</head>
<style>
    /*.data-detail .title {
        font-size:35px;
        line-height:100%;
        font-weight:700;
        color:#4b4b46;
        margin-top:-4px;
        margin-bottom:24px;
        border:none;
    }
    .data-detail .detail-item {
        font-size:16px;
        line-height:50px;
        color:#4b4b46;
        background:#f3f3f9;
        border:1px solid rgba(75,75,70,.07);
        border-radius:7px;
        padding:0 35px;
        margin-bottom:15px;
        width: auto;
    }
    div .detail-item span:nth-child(1) {
        font-size:18px;
        font-weight:700;
        width:40%
    }*/</style>
<body>

    <div id="app">
        <div class="data-detail">
            <div class="data-detail-breadcrumb">
                <span class="layui-breadcrumb">
                    <a href="../home/home.jsp">首页</a>
                    <a><cite>{{detail.shucaiName}}</cite></a>
                </span>

                <!-- 收藏 -->
                <a v-if='storeupFlag' onclick="addShucaiCollection()" href="javascript:void(0)">
                    <i class="layui-icon" style="font-size: 20px;color: red;">&#xe67a;</i>取消收藏
                </a>
                <a v-if='!storeupFlag' onclick="addShucaiCollection()" href="javascript:void(0)">
                    <i class="layui-icon" style="font-size: 20px;color: red;">&#xe67b;</i>点我收藏
                </a>

            </div>
            <div class="layui-row">
                <div class="layui-col-md5">
                    <div class="layui-carousel" id="swiper">
                        <div carousel-item id="swiper-item">
                            <div v-for="(item,index) in swiperList" v-bind:key="index">
                                <img class="swiper-item" :src="item.img">
                            </div>
                        </div>
                    </div>

                    <div class="tool-container">
                            <!-- 判断是否有评分 -->
                    </div>
                </div>
                <div class="layui-col-md7" style="padding-left: 20px;">
                        <h1 class="title">{{detail.shucaiName}}</h1>

                        <div v-if="detail.shucaiUuidNumber" class="detail-item">
                            <span>蔬菜编号：</span>
                            <span class="desc">
                                        {{detail.shucaiUuidNumber}}
                            </span>
                        </div>

                        <div v-if="detail.shucaiTypes" class="detail-item">
                            <span>蔬菜类型：</span>
                            <span class="desc">
                                {{detail.shucaiValue}}
                            </span>
                        </div>

                        <div v-if="detail.shucaiKucunNumber" class="detail-item">
                            <span>蔬菜库存：</span>
                            <span class="desc">
                                {{detail.shucaiKucunNumber}}
                            </span>
                        </div>

                        <div v-if="detail.shucaiPrice" class="detail-item">
                            <span>购买获得积分：</span>
                            <span class="desc">
                                {{detail.shucaiPrice}}
                            </span>
                        </div>

                        <div v-if="detail.shucaiOldMoney" class="detail-item">
                            <span>蔬菜原价：</span>
                            <span class="desc">
                                        {{detail.shucaiOldMoney}}
                            </span>
                        </div>

                        <div v-if="detail.shucaiNewMoney" class="detail-item">
                            <span>现价：</span>
                            <span class="desc">
                                        {{detail.shucaiNewMoney}}
                            </span>
                        </div>

                        <div v-if="detail.shucaiClicknum" class="detail-item">
                            <span>蔬菜热度：</span>
                            <span class="desc">
                                {{detail.shucaiClicknum}}
                            </span>
                        </div>

                    <div class="detail-item">

                        <!--<button onclick="addShucaiqqqqqqqq()" type="button" class="layui-btn layui-btn-warm">
                                添加到购物车
                            </button>-->
                            <div class="num-picker">
                                <button type="button" onclick="reduceBuynumber()" class="layui-btn layui-btn-primary">
                                    -
                                </button>
                                <input type="text" id="buyNumber" name="buyNumber" class="layui-input" disabled="disabled" />
                                <button type="button" onclick="plusBuynumber()" class="layui-btn layui-btn-primary">
                                    +
                                </button>
                            </div>
                            <button onclick="addShucaiCart()" type="button" class="layui-btn layui-btn-warm">
                                添加到购物车
                            </button>
                            <button onclick="addShucaiOrder()" type="button" class="layui-btn btn-submit">
                                立即购买
                            </button>
                            <!--<div style="padding: 20px;border: 0px solid #f2f2f2;margin-top: 20px;display: flex">
                                <div class="num-picker">
                                    <button @click="shucaiYuyue()" style="height:auto;" :style='{"padding":"0 10px","boxShadow":"0 0 0px rgba(255,0,0,.3)","margin":"0 5px","borderColor":"rgba(0,0,0,.3)","backgroundColor":"rgba(23, 124, 176, 1)","color":"rgba(255, 255, 255, 1)","borderRadius":"6px","borderWidth":"0","width":"auto","lineHeight":"40px","fontSize":"16px","borderStyle":"solid"}' type="button" class="layui-btn btn-submit">
                                        立即预约
                                    </button>
                                </div>
                            </div>-->
                    </div>

                    <div class="detail-item" style="text-align: right;">
                    </div>
                </div>
            </div>

            <div class="layui-row">
                <div class="layui-tab layui-tab-card">

                    <ul class="layui-tab-title">
                            <li class="layui-this">蔬菜详细介绍</li>
                            <li>评价</li>
                    </ul>

                    <div class="layui-tab-content">
                            <div class="layui-tab-item layui-show">
                                <div v-html="myFilters(detail.shucaiContent)"></div>
                            </div>

                            <div class="layui-tab-item">
                                <div class="message-container">
                                    <div class="message-list">
                                        <div class="message-item" v-for="(item,index) in shucaiCommentbackDataList" v-bind:key="index">
                                            <div class="username-container">
                                                <img class="avator" :src="item.yonghuPhoto">
                                                <span class="username">
                                                    {{item.yonghuName}}
                                                </span>
                                            </div>
                                            <div class="content">
                                                    <span style="color: rgb(175, 135, 77)">
                                                        评价:<div v-html="item.shucaiCommentbackText"></div>
                                                    </span>
                                            </div>
                                            <div class="content">
                                                    <span style="color: rgb(175, 135, 77)">
                                                        回复:<div v-html="item.replyText"></div>
                                                    </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="pager" id="shucaiCommentbackPager"></div>
                                </div>
                            </div>


                    </div>
                </div>
            </div>
        </div>    </div>

<script type="text/javascript" src="../../xznstatic/js/jquery.min.js"></script>
<script src="../../xznstatic/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<script src="../../layui/layui.js"></script>
<script src="../../js/vue.js"></script>
<!-- 组件配置信息 -->
<script src="../../js/config.js"></script>
<!-- 扩展插件配置信息 -->
<script src="../../modules/config.js"></script>
<!-- 工具方法 -->
<script src="../../js/utils.js"></script>

<script>
    Vue.prototype.myFilters= function (msg) {
        if(msg != null){
            return msg.replace(/\n/g, "<br>");
        }else{
            return "";
        }
    };
    var vue = new Vue({
        el: '#app',
        data: {
            // 轮播图
            swiperList: [],
            // 数据详情
            detail: {
                id: 0
            },
            // 商品标题
            title: '',

            storeupFlag: 0,//收藏 [0为收藏 1已收藏]
            //系统推荐
            shucaiRecommendList: [],
            dataList: [],
            // 加入购物车数量
            buyNumber: 1,
            // 当前详情页表
            detailTable: 'shucai',
            // 评价列表
            shucaiCommentbackDataList: [],
        },
        //  清除定时器
        destroyed: function () {
            // 不知道具体作用
            // window.clearInterval(this.inter);
        },
        methods: {
            jump(url) {
                jump(url)
            }
            //预约
            ,shucaiYuyue(){
                let _this = this;
                // localStorage.setItem('shucaiId', _this.detail.id);
                // _this.jump("../shucaiOrder/add.jsp");

                let data={
                    shucaiId:_this.detail.id,
                    yonghuId:localStorage.getItem("userid"),
                    shucaiOrderYesnoTypes:1,
                }
                // 提交数据
                layui.http.requestJson('shucaiOrder/add', 'post', data, function (res) {
                    if(res.code == 0) {
                        layui.layer.msg('预约成功', {
                            time: 2000,
                            icon: 6
                        }, function () {
                            _this.jump("../shucaiOrder/list.jsp");
                        });
                    }else{
                        layui.layer.msg(res.msg, {
                            time: 5000,
                            icon: 5
                        });
                    }
                });
            },
        }
    });

    layui.use(['layer', 'form', 'element', 'carousel', 'http', 'jquery', 'laypage', 'rate'], function () {
        var layer = layui.layer;
        var element = layui.element;
        var form = layui.form;
        var carousel = layui.carousel;
        var http = layui.http;
        var jquery = layui.jquery;
        var laypage = layui.laypage;
        var rate = layui.rate;//评分

        var limit = 10;

        // 设置数量
        jquery('#buyNumber').val(vue.buyNumber);

        // 数据ID
        var id = http.getParam('id');
        vue.detail.id = id;
        // 当前详情
        http.request(`${vue.detailTable}/detail/` + id, 'get', {}, function (res) {
            // 详情信息
            vue.detail = res.data;
            vue.title = vue.detail.shucaiName;
           // 轮播图片
            vue.swiperList = vue.detail.shucaiPhoto ? vue.detail.shucaiPhoto.split(",") : [];
            var swiperItemHtml = '';
            for (let item of vue.swiperList) {
                swiperItemHtml +=
                        '<div>' +
                        '<img class="swiper-item" src="' + item + '" style="margin-top: 50px;" >' +
                        '</div>';
            }
            jquery('#swiper-item').html(swiperItemHtml);
            // 轮播图
            carousel.render({
                elem: '#swiper',
                width: swiper.width, height: swiper.height,
                arrow: swiper.arrow,
                anim: swiper.anim,
                interval: swiper.interval,
                indicator: swiper.indicator
            });
        });

        // 系统推荐
        http.request(`shucai/list`, 'get', {
            page: 1,
            limit: 5,
            shucaiTypes: vue.detail.shucaiTypes,
            shucaiDelete: 1,





                shangxiaTypes: vue.detail.shangxiaTypes,

        }, function (res) {
            vue.shucaiRecommendList = res.data.list;
        });



        // 获取评价
        http.request(`${vue.detailTable}Commentback/list`, 'get', {
            page: 1,
            limit: limit,
            shucaiId: vue.detail.id
        }, function (res) {
            vue.shucaiCommentbackDataList = res.data.list;
            // 分页
            laypage.render({
                elem: 'shucaiCommentbackPager',
                count: res.data.total,
                limit: limit,
                jump: function (obj, first) {
                    //首次不执行
                    if (!first) {
                        http.request(`${vue.detailTable}Commentback/list`, 'get', {
                            page: obj.curr,
                            limit: obj.limit,
                            shucaiId: vue.detail.id
                        }, function (res) {
                            vue.shucaiCommentbackDataList = res.data.list
                        })
                    }
                }
            });
        });
        if (localStorage.getItem('userid')) {
            http.request('shucaiCollection/list', 'get', {
                page: 1,
                limit: 1,
                shucaiId: vue.detail.id,
                yonghuId: localStorage.getItem('userid'),
            }, function (res) {
                if(res.data.total >0){
                    res.data.list.forEach(element => {
                        if (element.shucaiCollectionTypes == 1) {
                            vue.storeupFlag = 1;
                        }
                        if (element.shucaiCollectionTypes == 2) {
                            vue.zanFlag = 1;
                        }
                        if (element.shucaiCollectionTypes == 3) {
                            vue.caiFlag = 1;
                        }
                    });

                }
            });
        }

    });



    // 收藏
    function addShucaiCollection(){
        layui.http.request('shucaiCollection/list', 'get', {
            page: 1,
            limit: 1,
            shucaiId: vue.detail.id,
            shucaiCollectionTypes: 1,
            yonghuId: localStorage.getItem('userid'),
        }, (res) => {
            if (res.data.list.length == 1) {
                layui.http.requestJson('shucaiCollection/delete', 'post', [res.data.list[0].id], function (res) {
                    layui.layer.msg('取消成功', {
                        time: 1000,
                        icon: 5
                    }, function () {
                        window.location.reload();
                    });
                });
                return false;
            }
            layui.http.requestJson('shucaiCollection/add', 'post', {
                yonghuId: localStorage.getItem('userid'),
                shucaiId: vue.detail.id,
                shucaiCollectionTypes: 1,
            }, function (res) {
                layui.layer.msg('收藏成功', {
                    time: 1000,
                    icon: 6
                }, function () {
                    window.location.reload();
                });
            });
        });
    }

    // 添加数量
    function plusBuynumber() {
        vue.buyNumber++;
        layui.jquery('#buyNumber').val(vue.buyNumber);
    }
    // 减少数量
    function reduceBuynumber() {
        if(vue.buyNumber>1){
            vue.buyNumber--;
        }
        layui.jquery('#buyNumber').val(vue.buyNumber);
    }

    // 添加到购物车
    function addShucaiCart(){
        if (vue.detail.shucaiKucunNumber > 0 && vue.detail.shucaiKucunNumber < vue.buyNumber) {
            layer.msg(`库存不足`, {
                time: 2000,
                icon: 5
            });
            return false;
        }
        // 查询是否已经添加到购物车
        layui.http.request('cart/list', 'get', {
            yonghuId: localStorage.getItem('userid'),
            shucaiId: vue.detail.id
        }, (res) => {
            if(res.data.list.length > 0){
                layer.msg("该蔬菜已经添加到购物车", {
                    time: 2000,
                    icon: 5
                });
                return false
            }
            layui.http.requestJson(`cart/add`, 'post', {
                yonghuId : localStorage.getItem('userid'),
                shucaiId : vue.detail.id,
                buyNumber: vue.buyNumber,
            }, function (res) {
                if(res.code==0){
                    layer.msg('添加到购物车成功', {
                        time: 2000,
                        icon: 6
                    });
                }else{
                    layer.msg(res.msg, {
                        time: 2000,
                        icon: 2
                    });
                }
            });
        })
    }

    // 立即购买
    function addShucaiOrder(){
        if (vue.detail.shucaiKucunNumber > 0 && vue.detail.shucaiKucunNumber < vue.buyNumber) {
            layer.msg(`蔬菜库存不足`, {
                time: 2000,
                icon: 5
            });
            return false;
        }
        // 保存到storage中，在确认下单页面中获取要购买的物品
        localStorage.setItem('shucais', JSON.stringify([{
            shucaiId: vue.detail.id,
            shucaiName: vue.detail.shucaiName,
            shucaiUuidNumber: vue.detail.shucaiUuidNumber,
            shucaiPhoto: vue.detail.shucaiPhoto,
            shucaiTypes: vue.detail.shucaiTypes,
            shucaiKucunNumber: vue.detail.shucaiKucunNumber,
            shucaiPrice: vue.detail.shucaiPrice,
            shucaiOldMoney: vue.detail.shucaiOldMoney,
            shucaiNewMoney: vue.detail.shucaiNewMoney,
            shucaiClicknum: vue.detail.shucaiClicknum,
            shucaiContent: vue.detail.shucaiContent,
            shangxiaTypes: vue.detail.shangxiaTypes,
            shucaiDelete: vue.detail.shucaiDelete,
            createTime: vue.detail.createTime,
            buyNumber: vue.buyNumber,
            yonghuId: localStorage.getItem('userid'),
        }]));
        // 跳转到确认下单页面
        jump('../shucaiOrder/confirm.jsp');
    }



</script>
</body>
</html>
