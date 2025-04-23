<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page isELIgnored="true" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>注册</title>
    <!-- bootstrap样式，地图插件使用 -->
    <link rel="stylesheet" href="../../css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <!-- 样式 -->
    <link rel="stylesheet" href="../../css/style.css"/>
    <!-- 主题（主要颜色设置） -->
    <link rel="stylesheet" href="../../css/theme.css"/>
    <!-- 通用的css -->
    <link rel="stylesheet" href="../../css/common.css"/>
</head>
<body style="background: #EEEEEE; ">


<div id="app">

    <!-- 轮播图 -->
    <div class="layui-carousel" id="swiper">
        <div carousel-item id="swiper-item">
            <div v-for="(item,index) in swiperList" v-bind:key="index">
                <img class="swiper-item" :src="item.img">
            </div>
        </div>
    </div>
    <!-- 轮播图 -->

    <div class="data-add-container">

        <form class="layui-form layui-form-pane" lay-filter="myForm">
            <!-- 级联表的 -->


            <!-- 当前表的 -->
<!-- 唯一uuid -->
            <div class="layui-form-item" pane>
                <label class="layui-form-label">退换货编号：</label>
                <div class="layui-input-inline">
                    <input v-model="detail.shucaiTuihuanhuoUuidNumber" type="text" name="shucaiTuihuanhuoUuidNumber" id="shucaiTuihuanhuoUuidNumber"  lay-verify="required"   placeholder="退换货编号" autocomplete="off" class="layui-input" readonly="readonly">
                </div>
            </div>

            <div class="layui-form-item" pane>
                <label class="layui-form-label">退换货：</label>
                <div class="layui-input-block">
                    <select name="tuihuanhuoTypes" id="tuihuanhuoTypes" lay-filter="tuihuanhuoTypes">
                        <option v-for="item in tuihuanhuoTypesList" :value="item.codeIndex" :key="item.codeIndex">{{ item.indexName }}</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item" pane>
                <label class="layui-form-label">审核时间：</label>
                <div class="layui-input-block">
                    <input <%--v-model="detail.shenheTime"--%> type="text" name="shenheTime" id="shenheTime" placeholder="审核时间" lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>

            <div class="layui-form-item" pane>
                <label class="layui-form-label">退回快递公司：</label>
                <div class="layui-input-block">
                    <input <%--v-model="detail.shucaiTuihuanhuoCourierName"--%> type="text" name="shucaiTuihuanhuoCourierName" id="shucaiTuihuanhuoCourierName" placeholder="退回快递公司" lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>

            <div class="layui-form-item" pane>
                <label class="layui-form-label">退回快递单号：</label>
                <div class="layui-input-block">
                    <input <%--v-model="detail.shucaiTuihuanhuoCourierNumber"--%> type="text" name="shucaiTuihuanhuoCourierNumber" id="shucaiTuihuanhuoCourierNumber" placeholder="退回快递单号" lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>


            <div class="layui-form-item" pane>
                <label class="layui-form-label">快递状态：</label>
                <div class="layui-input-block">
                    <select name="kuaidiTypes" id="kuaidiTypes" lay-filter="kuaidiTypes">
                        <option v-for="item in kuaidiTypesList" :value="item.codeIndex" :key="item.codeIndex">{{ item.indexName }}</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item" pane>
                <label class="layui-form-label">换货快递公司：</label>
                <div class="layui-input-block">
                    <input <%--v-model="detail.shucaiHuanhuoCourierName"--%> type="text" name="shucaiHuanhuoCourierName" id="shucaiHuanhuoCourierName" placeholder="换货快递公司" lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>

            <div class="layui-form-item" pane>
                <label class="layui-form-label">换货快递单号：</label>
                <div class="layui-input-block">
                    <input <%--v-model="detail.shucaiHuanhuoCourierNumber"--%> type="text" name="shucaiHuanhuoCourierNumber" id="shucaiHuanhuoCourierNumber" placeholder="换货快递单号" lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block" style="text-align: right;margin-right: 30px;">
                    <button class="layui-btn btn-submit" lay-submit lay-filter="thisSubmit">提交</button>
                </div>
            </div>
        </form>
    </div>
</div>

<script src="../../layui/layui.js"></script>
<script src="../../js/vue.js"></script>
<!-- 组件配置信息 -->
<script src="../../js/config.js"></script>
<!-- 扩展插件配置信息 -->
<script src="../../modules/config.js"></script>
<!-- 工具方法 -->
<script src="../../js/utils.js"></script>
<!-- 校验格式工具类 -->
<script src="../../js/validate.js"></script>
<!-- 地图 -->
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=ca04cee7ac952691aa67a131e6f0cee0"></script>
<script type="text/javascript" src="../../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../../js/bootstrap.AMapPositionPicker.js"></script>

<script>
    var jquery = $;

    var vue = new Vue({
        el: '#app',
        data: {
            // 轮播图
            swiperList: [{
                img: '../../img/banner.jpg'
            }],
            // 当前表数据
            detail: {
                shucaiTuihuanhuoUuidNumber: '',
                shucaiOrderId: '',
                yonghuId: '',
        tuihuanhuoTypes: '',
        tuihuanhuoValue: '',
                insertTime: '',
                gonggaoContent: '',
        shucaiTuihuanhuoYesnoTypes: '',
        shucaiTuihuanhuoYesnoValue: '',
                shucaiTuihuanhuoYesnoContent: '',
                shenheTime: '',
                shucaiTuihuanhuoCourierName: '',
                shucaiTuihuanhuoCourierNumber: '',
        kuaidiTypes: '',
        kuaidiValue: '',
                shucaiHuanhuoCourierName: '',
                shucaiHuanhuoCourierNumber: '',
                createTime: '',
            },

            // 级联表的

            // 下拉框
            tuihuanhuoTypesList: [],
            shucaiTuihuanhuoYesnoTypesList: [],
            kuaidiTypesList: [],
            centerMenu: centerMenu
        },
        updated: function () {
            layui.form.render('select', 'myForm');
        },
        computed: {},
        methods: {
            jump(url) {
                jump(url)
            }
        }
    })


    layui.use(['layer', 'element', 'carousel', 'http', 'jquery', 'form', 'upload', 'laydate', 'tinymce'], function () {
        var layer = layui.layer;
        var element = layui.element;
        var carousel = layui.carousel;
        var http = layui.http;
        var jquery = layui.jquery;
        var form = layui.form;
        var upload = layui.upload;
        var laydate = layui.laydate;
        var tinymce = layui.tinymce

        // 获取轮播图 数据
        http.request('config/list', 'get', {
            page: 1,
            limit: 5
        }, function(res) {
            if (res.data.list.length > 0) {
                var swiperItemHtml = '';
                for (let item of res.data.list) {
                    if (item.value != "" && item.value != null) {
                        swiperItemHtml +=
                                '<div>' +
                                '<img class="swiper-item" src="' + item.value + '">' +
                                '</div>';
                    }
                }
                jquery('#swiper-item').html(swiperItemHtml);
                // 轮播图
                carousel.render({
                    elem: '#swiper',
                    width: swiper.width,height:swiper.height,
                    arrow: swiper.arrow,
                    anim: swiper.anim,
                    interval: swiper.interval,
                    indicator: "none"
                });
            }
        });


        vue.detail.shucaiTuihuanhuoUuidNumber = new Date().getTime();


        // 下拉框
        // 退换货的查询和初始化
       tuihuanhuoTypesSelect();
        // 审核状态的查询和初始化
       shucaiTuihuanhuoYesnoTypesSelect();
        // 快递状态的查询和初始化
       kuaidiTypesSelect();

        // 上传文件
        // 日期效验规则及格式
        dateTimePick();
        // 表单效验规则
        form.verify({
            // 正整数效验规则
            integer: [
                /^[1-9][0-9]*$/
                ,'必须是正整数'
            ]
            // 小数效验规则
            ,double: [
                /^[1-9][0-9]{0,5}(\.[0-9]{1,2})?$/
                ,'最大整数位为6为,小数最大两位'
            ]
        });

        // session独取
        let table = localStorage.getItem("userTable");
        http.request(table+"/session", 'get', {}, function (data) {
            // 表单赋值
            //form.val("myForm", data.data);
            // data = data.data;
            for (var key in data) {
                vue.detail[table+"Id"] = data.id
            }
        });


        // 提交
        form.on('submit(thisSubmit)', function (data) {
            data = data.field;
            data["yonghuId"]= localStorage.getItem("userid");
            data["shucaiTuihuanhuoYesnoTypes"]= 1;
            // 提交数据
            http.requestJson('shucaiTuihuanhuo/add', 'post', data, function (res) {
                if(res.code == 0){
                    layer.msg('预约成功', {
                        time: 2000,
                        icon: 6
                    }, function () {
                        vue.jump("../shucaiTuihuanhuo/list.jsp");
                        // back();
                    });

                }else{
                    layer.msg(res.msg, {
                        time: 5000,
                        icon: 5
                    });
                }
            });
            return false
        });


        // 日期框初始化
        function dateTimePick(){
            var myDate = new Date();  //获取当前时间
            /*
                ,change: function(value, date, endDate){
                    value       得到日期生成的值，如：2017-08-18
                    date        得到日期时间对象：{year: 2017, month: 8, date: 18, hours: 0, minutes: 0, seconds: 0}
                    endDate     得结束的日期时间对象，开启范围选择（range: true）才会返回。对象成员同上。
            */
            // 审核时间的开始时间和结束时间的效验及格式
            var shenheTime = laydate.render({
                elem: '#shenheTime'
	            ,type: 'datetime'
                ,min:myDate.toLocaleString()
            });
        }




       // 退换货的查询
       function tuihuanhuoTypesSelect() {
           //填充下拉框选项
           http.request("dictionary/page?page=1&limit=100&sort=&order=&dicCode=tuihuanhuo_types", "GET", {}, (res) => {
               if(res.code == 0){
                   vue.tuihuanhuoTypesList = res.data.list;
               }
           });
       }


       // 审核状态的查询
       function shucaiTuihuanhuoYesnoTypesSelect() {
           //填充下拉框选项
           http.request("dictionary/page?page=1&limit=100&sort=&order=&dicCode=shucai_tuihuanhuo_yesno_types", "GET", {}, (res) => {
               if(res.code == 0){
                   vue.shucaiTuihuanhuoYesnoTypesList = res.data.list;
               }
           });
       }


       // 快递状态的查询
       function kuaidiTypesSelect() {
           //填充下拉框选项
           http.request("dictionary/page?page=1&limit=100&sort=&order=&dicCode=kuaidi_types", "GET", {}, (res) => {
               if(res.code == 0){
                   vue.kuaidiTypesList = res.data.list;
               }
           });
       }



    });
</script>
</body>
</html>