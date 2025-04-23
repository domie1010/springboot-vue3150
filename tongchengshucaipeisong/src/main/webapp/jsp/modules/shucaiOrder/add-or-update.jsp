<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <%@ include file="../../static/head.jsp" %>
    <link href="http://www.bootcss.com/p/bootstrap-datetimepicker/bootstrap-datetimepicker/css/datetimepicker.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap-select.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" charset="utf-8">
        window.UEDITOR_HOME_URL = "${pageContext.request.contextPath}/resources/ueditor/"; //UEDITOR_HOME_URL、config、all这三个顺序不能改变
    </script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<style>
    .error {
        color: red;
    }
</style>
<body>
<!-- Pre Loader -->
<div class="loading">
    <div class="spinner">
        <div class="double-bounce1"></div>
        <div class="double-bounce2"></div>
    </div>
</div>
<!--/Pre Loader -->
<div class="wrapper">
    <!-- Page Content -->
    <div id="content">
        <!-- Top Navigation -->
        <%@ include file="../../static/topNav.jsp" %>
        <!-- Menu -->
        <div class="container menu-nav">
            <nav class="navbar navbar-expand-lg lochana-bg text-white">
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="ti-menu text-white"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul id="navUl" class="navbar-nav mr-auto">

                    </ul>
                </div>
            </nav>
        </div>
        <!-- /Menu -->
        <!-- Breadcrumb -->
        <!-- Page Title -->
        <div class="container mt-0">
            <div class="row breadcrumb-bar">
                <div class="col-md-6">
                    <h3 class="block-title">编辑蔬菜订单</h3>
                </div>
                <div class="col-md-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/index.jsp">
                                <span class="ti-home"></span>
                            </a>
                        </li>
                        <li class="breadcrumb-item">蔬菜订单管理</li>
                        <li class="breadcrumb-item active">编辑蔬菜订单</li>
                    </ol>
                </div>
            </div>
        </div>
        <!-- /Page Title -->

        <!-- /Breadcrumb -->
        <!-- Main Content -->
        <div class="container">

            <div class="row">
                <!-- Widget Item -->
                <div class="col-md-12">
                    <div class="widget-area-2 lochana-box-shadow">
                        <h3 class="widget-title">蔬菜订单信息</h3>
                        <form id="addOrUpdateForm">
                            <div class="form-row">
                            <!-- 级联表的字段 -->
                                    <div class="form-group col-md-6 aaaaaa address">
                                        <label>收货地址</label>
                                        <div>
                                            <select style="width: 450px" id="addressSelect" name="addressSelect"
                                                    class="selectpicker form-control"  data-live-search="true"
                                                    title="请选择" data-header="请选择" data-size="5" data-width="650px">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6 address">
                                        <label>收货人</label>
                                        <input style="width: 450px" id="addressName" name="addressName" class="form-control"
                                               placeholder="收货人" readonly>
                                    </div>
                                    <div class="form-group col-md-6 address">
                                        <label>电话</label>
                                        <input style="width: 450px" id="addressPhone" name="addressPhone" class="form-control"
                                               placeholder="电话" readonly>
                                    </div>
                                    <div class="form-group col-md-6 address">
                                        <label>地址</label>
                                        <input style="width: 450px" id="addressDizhi" name="addressDizhi" class="form-control"
                                               placeholder="地址" readonly>
                                    </div>
                                    <div class="form-group col-md-6 aaaaaa shucai">
                                        <label>蔬菜</label>
                                        <div>
                                            <select style="width: 450px" id="shucaiSelect" name="shucaiSelect"
                                                    class="selectpicker form-control"  data-live-search="true"
                                                    title="请选择" data-header="请选择" data-size="5" data-width="650px">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6 shucai">
                                        <label>蔬菜名称</label>
                                        <input style="width: 450px" id="shucaiName" name="shucaiName" class="form-control"
                                               placeholder="蔬菜名称" readonly>
                                    </div>
                                    <div class="form-group col-md-6 shucai">
                                        <label>蔬菜照片</label>
                                        <img id="shucaiPhotoImg" src="" width="100" height="100">
                                    </div>
                                    <div class="form-group col-md-6 shucai">
                                        <label>蔬菜类型</label>
                                        <input style="width: 450px" id="shucaiValue" name="shucaiValue" class="form-control"
                                               placeholder="蔬菜类型" readonly>
                                    </div>
                                    <div class="form-group col-md-6 aaaaaa yonghu">
                                        <label>用户</label>
                                        <div>
                                            <select style="width: 450px" id="yonghuSelect" name="yonghuSelect"
                                                    class="selectpicker form-control"  data-live-search="true"
                                                    title="请选择" data-header="请选择" data-size="5" data-width="650px">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6 yonghu">
                                        <label>用户姓名</label>
                                        <input style="width: 450px" id="yonghuName" name="yonghuName" class="form-control"
                                               placeholder="用户姓名" readonly>
                                    </div>
                            <!-- 当前表的字段 -->
                                    <input id="updateId" name="id" type="hidden">
                                    <div class="form-group col-md-6 shucaiOrderUuidNumberDiv">
                                        <label>订单号</label>
                                        <input style="width: 450px" id="shucaiOrderUuidNumber" name="shucaiOrderUuidNumber" class="form-control"
                                               placeholder="订单号">
                                    </div>
                                <input id="addressId" name="addressId" type="hidden">
                                <input id="shucaiId" name="shucaiId" type="hidden">
                                <input id="yonghuId" name="yonghuId" type="hidden">
                                    <div class="form-group col-md-6 buyNumberDiv">
                                        <label>购买数量</label>
                                        <input style="width: 450px" id="buyNumber" name="buyNumber" class="form-control"
                                               onchange="buyNumberChickValue(this)"  placeholder="购买数量">
                                    </div>

                                    <div class="form-group col-md-6 shucaiOrderTruePriceDiv">
                                        <label>实付价格</label>
                                        <input style="width: 450px" id="shucaiOrderTruePrice" name="shucaiOrderTruePrice" class="form-control"
                                               onchange="shucaiOrderTruePriceChickValue(this)" placeholder="实付价格">
                                    </div>
                                    <div class="form-group col-md-6 shucaiOrderCourierNameDiv">
                                        <label>快递公司</label>
                                        <input style="width: 450px" id="shucaiOrderCourierName" name="shucaiOrderCourierName" class="form-control"
                                               placeholder="快递公司">
                                    </div>
                                    <div class="form-group col-md-6 shucaiOrderCourierNumberDiv">
                                        <label>订单快递单号</label>
                                        <input style="width: 450px" id="shucaiOrderCourierNumber" name="shucaiOrderCourierNumber" class="form-control"
                                               placeholder="订单快递单号">
                                    </div>
                                    <div class="form-group col-md-6 shucaiOrderTypesDiv">
                                        <label>订单类型</label>
                                        <select style="width: 450px" id="shucaiOrderTypesSelect" name="shucaiOrderTypes" class="form-control">
                                        </select>
                                    </div>
                                    <div class="form-group col-md-6 shucaiOrderPaymentTypesDiv">
                                        <label>支付类型</label>
                                        <select style="width: 450px" id="shucaiOrderPaymentTypesSelect" name="shucaiOrderPaymentTypes" class="form-control">
                                        </select>
                                    </div>
                                    <div class="form-group col-md-12 mb-3">
                                        <button id="submitBtn" type="button" class="btn btn-primary btn-lg">提交</button>
                                        <button id="exitBtn" type="button" class="btn btn-primary btn-lg">返回</button>
                                    </div>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- /Widget Item -->
            </div>
        </div>
        <!-- /Main Content -->
    </div>
    <!-- /Page Content -->
</div>
<!-- Back to Top -->
<a id="back-to-top" href="#" class="back-to-top">
    <span class="ti-angle-up"></span>
</a>
<!-- /Back to Top -->
<%@ include file="../../static/foot.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.ui.widget.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.fileupload.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/jquery.validate.min.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/messages_zh.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/card.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/datetimepicker/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" charset="utf-8"
                 src="${pageContext.request.contextPath}/resources/js/bootstrap-select.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/laydate.js"></script>
<script>
    <%@ include file="../../utils/menu.jsp"%>
    <%@ include file="../../static/setMenu.js"%>
    <%@ include file="../../utils/baseUrl.jsp"%>

    var tableName = "shucaiOrder";
    var pageType = "add-or-update";
    var updateId = "";
    var crossTableId = -1;
    var crossTableName = '';
    var ruleForm = {};
    var crossRuleForm = {};


    // 下拉框数组
        <!-- 当前表的下拉框数组 -->
    var shucaiOrderTypesOptions = [];
    var shucaiOrderPaymentTypesOptions = [];
        <!-- 级联表的下拉框数组 -->
    var addressOptions = [];
    var shucaiOptions = [];
    var yonghuOptions = [];

    var ruleForm = {};


    // 文件上传
    function upload() {

        <!-- 当前表的文件上传 -->

    }

    // 表单提交
    function submit() {
        if (validform() == true && compare() == true) {
            let data = {};
            getContent();
            if(window.sessionStorage.getItem('role') != '收货地址'){//当前登录用户不为这个
                if($("#addressId") !=null){
                    var addressId = $("#addressId").val();
                    if(addressId == null || addressId =='' || addressId == 'null'){
                        alert("收货地址 不能为空");
                        return;
                    }
                }
            }
            if(window.sessionStorage.getItem('role') != '蔬菜'){//当前登录用户不为这个
                if($("#shucaiId") !=null){
                    var shucaiId = $("#shucaiId").val();
                    if(shucaiId == null || shucaiId =='' || shucaiId == 'null'){
                        alert("蔬菜不能为空");
                        return;
                    }
                }
            }
            if(window.sessionStorage.getItem('role') != '用户'){//当前登录用户不为这个
                if($("#yonghuId") !=null){
                    var yonghuId = $("#yonghuId").val();
                    if(yonghuId == null || yonghuId =='' || yonghuId == 'null'){
                        alert("用户不能为空");
                        return;
                    }
                }
            }
            let value = $('#addOrUpdateForm').serializeArray();
            $.each(value, function (index, item) {
                data[item.name] = item.value;
            });
            let json = JSON.stringify(data);
            var urlParam;
            var successMes = '';
            if (updateId != null && updateId != "null" && updateId != '') {
                urlParam = 'update';
                successMes = '修改成功';
            } else {
                urlParam = 'save';
                    successMes = '添加成功';

            }
            httpJson("shucaiOrder/" + urlParam, "POST", data, (res) => {
                if(res.code == 0){
                    window.sessionStorage.removeItem('addshucaiOrder');
                    window.sessionStorage.removeItem('updateId');
                    let flag = true;
                    if (flag) {
                        alert(successMes);
                    }
                    if (window.sessionStorage.getItem('onlyme') != null && window.sessionStorage.getItem('onlyme') == "true") {
                        window.sessionStorage.removeItem('onlyme');
                        window.sessionStorage.setItem("reload","reload");
                        window.parent.location.href = "${pageContext.request.contextPath}/index.jsp";
                    } else {
                        window.location.href = "list.jsp";
                    }
                }
            });
        } else {
            alert("表单未填完整或有错误");
        }
    }

    // 查询列表
        <!-- 查询当前表的所有列表 -->
        function shucaiOrderTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=shucai_order_types", "GET", {}, (res) => {
                if(res.code == 0){
                    shucaiOrderTypesOptions = res.data.list;
                }
            });
        }
        function shucaiOrderPaymentTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=shucai_order_payment_types", "GET", {}, (res) => {
                if(res.code == 0){
                    shucaiOrderPaymentTypesOptions = res.data.list;
                }
            });
        }
        <!-- 查询级联表的所有列表 -->
        function addressSelect() {
            //填充下拉框选项
            http("address/page?page=1&limit=100&sort=&order=", "GET", {}, (res) => {
                if(res.code == 0){
                    addressOptions = res.data.list;
                }
            });
        }

        function addressSelectOne(id) {
            http("address/info/"+id, "GET", {}, (res) => {
                if(res.code == 0){
                ruleForm = res.data;
                addressShowImg();
                addressShowVideo();
                addressDataBind();
            }
        });
        }
        function shucaiSelect() {
            //填充下拉框选项
            http("shucai/page?page=1&limit=100&sort=&order=", "GET", {}, (res) => {
                if(res.code == 0){
                    shucaiOptions = res.data.list;
                }
            });
        }

        function shucaiSelectOne(id) {
            http("shucai/info/"+id, "GET", {}, (res) => {
                if(res.code == 0){
                ruleForm = res.data;
                shucaiShowImg();
                shucaiShowVideo();
                shucaiDataBind();
            }
        });
        }
        function yonghuSelect() {
            //填充下拉框选项
            http("yonghu/page?page=1&limit=100&sort=&order=", "GET", {}, (res) => {
                if(res.code == 0){
                    yonghuOptions = res.data.list;
                }
            });
        }

        function yonghuSelectOne(id) {
            http("yonghu/info/"+id, "GET", {}, (res) => {
                if(res.code == 0){
                ruleForm = res.data;
                yonghuShowImg();
                yonghuShowVideo();
                yonghuDataBind();
            }
        });
        }



    // 初始化下拉框
    <!-- 初始化当前表的下拉框 -->
        function initializationShucaiordertypesSelect(){
            var shucaiOrderTypesSelect = document.getElementById('shucaiOrderTypesSelect');
            if(shucaiOrderTypesSelect != null && shucaiOrderTypesOptions != null  && shucaiOrderTypesOptions.length > 0 ){
                for (var i = 0; i < shucaiOrderTypesOptions.length; i++) {
                    shucaiOrderTypesSelect.add(new Option(shucaiOrderTypesOptions[i].indexName,shucaiOrderTypesOptions[i].codeIndex));
                }
            }
        }
        function initializationShucaiorderpaymenttypesSelect(){
            var shucaiOrderPaymentTypesSelect = document.getElementById('shucaiOrderPaymentTypesSelect');
            if(shucaiOrderPaymentTypesSelect != null && shucaiOrderPaymentTypesOptions != null  && shucaiOrderPaymentTypesOptions.length > 0 ){
                for (var i = 0; i < shucaiOrderPaymentTypesOptions.length; i++) {
                    shucaiOrderPaymentTypesSelect.add(new Option(shucaiOrderPaymentTypesOptions[i].indexName,shucaiOrderPaymentTypesOptions[i].codeIndex));
                }
            }
        }

        function initializationaddressSelect() {
            var addressSelect = document.getElementById('addressSelect');
            if(addressSelect != null && addressOptions != null  && addressOptions.length > 0 ) {
                for (var i = 0; i < addressOptions.length; i++) {
                        addressSelect.add(new Option(addressOptions[i].addressName, addressOptions[i].id));
                }

                $("#addressSelect").change(function(e) {
                        addressSelectOne(e.target.value);
                });
            }

        }

        function initializationshucaiSelect() {
            var shucaiSelect = document.getElementById('shucaiSelect');
            if(shucaiSelect != null && shucaiOptions != null  && shucaiOptions.length > 0 ) {
                for (var i = 0; i < shucaiOptions.length; i++) {
                        shucaiSelect.add(new Option(shucaiOptions[i].shucaiName, shucaiOptions[i].id));
                }

                $("#shucaiSelect").change(function(e) {
                        shucaiSelectOne(e.target.value);
                });
            }

        }

        function initializationyonghuSelect() {
            var yonghuSelect = document.getElementById('yonghuSelect');
            if(yonghuSelect != null && yonghuOptions != null  && yonghuOptions.length > 0 ) {
                for (var i = 0; i < yonghuOptions.length; i++) {
                        yonghuSelect.add(new Option(yonghuOptions[i].yonghuName, yonghuOptions[i].id));
                }

                $("#yonghuSelect").change(function(e) {
                        yonghuSelectOne(e.target.value);
                });
            }

        }



    // 下拉框选项回显
    function setSelectOption() {

        <!-- 当前表的下拉框回显 -->

        var shucaiOrderTypesSelect = document.getElementById("shucaiOrderTypesSelect");
        if(shucaiOrderTypesSelect != null && shucaiOrderTypesOptions != null  && shucaiOrderTypesOptions.length > 0 ) {
            for (var i = 0; i < shucaiOrderTypesOptions.length; i++) {
                if (shucaiOrderTypesOptions[i].codeIndex == ruleForm.shucaiOrderTypes) {//下拉框value对比,如果一致就赋值汉字
                        shucaiOrderTypesSelect.options[i].selected = true;
                }
            }
        }

        var shucaiOrderPaymentTypesSelect = document.getElementById("shucaiOrderPaymentTypesSelect");
        if(shucaiOrderPaymentTypesSelect != null && shucaiOrderPaymentTypesOptions != null  && shucaiOrderPaymentTypesOptions.length > 0 ) {
            for (var i = 0; i < shucaiOrderPaymentTypesOptions.length; i++) {
                if (shucaiOrderPaymentTypesOptions[i].codeIndex == ruleForm.shucaiOrderPaymentTypes) {//下拉框value对比,如果一致就赋值汉字
                        shucaiOrderPaymentTypesSelect.options[i].selected = true;
                }
            }
        }
        <!--  级联表的下拉框回显  -->
            var addressSelect = document.getElementById("addressSelect");
            if(addressSelect != null && addressOptions != null  && addressOptions.length > 0 ) {
                for (var i = 0; i < addressOptions.length; i++) {
                    if (addressOptions[i].id == ruleForm.addressId) {//下拉框value对比,如果一致就赋值汉字
                        addressSelect.options[i+1].selected = true;
                        $("#addressSelect" ).selectpicker('refresh');
                    }
                }
            }
            var shucaiSelect = document.getElementById("shucaiSelect");
            if(shucaiSelect != null && shucaiOptions != null  && shucaiOptions.length > 0 ) {
                for (var i = 0; i < shucaiOptions.length; i++) {
                    if (shucaiOptions[i].id == ruleForm.shucaiId) {//下拉框value对比,如果一致就赋值汉字
                        shucaiSelect.options[i+1].selected = true;
                        $("#shucaiSelect" ).selectpicker('refresh');
                    }
                }
            }
            var yonghuSelect = document.getElementById("yonghuSelect");
            if(yonghuSelect != null && yonghuOptions != null  && yonghuOptions.length > 0 ) {
                for (var i = 0; i < yonghuOptions.length; i++) {
                    if (yonghuOptions[i].id == ruleForm.yonghuId) {//下拉框value对比,如果一致就赋值汉字
                        yonghuSelect.options[i+1].selected = true;
                        $("#yonghuSelect" ).selectpicker('refresh');
                    }
                }
            }
    }


    // 填充富文本框
    function setContent() {

        <!-- 当前表的填充富文本框 -->
    }
    // 获取富文本框内容
    function getContent() {

        <!-- 获取当前表的富文本框内容 -->
    }
    //数字检查
        <!-- 当前表的数字检查 -->
        function buyNumberChickValue(e){
            var this_val = e.value || 0;
            var reg=/^[1-9][0-9]*$/;
            if(!reg.test(this_val)){
                e.value = "";
                alert("输入不合法");
                return false;
            }
        }
        function shucaiOrderTruePriceChickValue(e){
            var this_val = e.value || 0;
            var reg=/^[0-9]{0,6}(\.[0-9]{1,2})?$/;
            if(!reg.test(this_val)){
                e.value = "";
                alert("只允许输入整数6位,小数2位的数字");
                return false;
            }
        }

    function exit() {
        window.sessionStorage.removeItem("updateId");
        window.sessionStorage.removeItem('addshucaiOrder');
        window.location.href = "list.jsp";
    }
    // 表单校验
    function validform() {
        return $("#addOrUpdateForm").validate({
            rules: {
                shucaiOrderUuidNumber: "required",
                addressId: "required",
                shucaiId: "required",
                yonghuId: "required",
                buyNumber: "required",
                shucaiOrderTruePrice: "required",
                shucaiOrderCourierName: "required",
                shucaiOrderCourierNumber: "required",
                shucaiOrderTypes: "required",
                shucaiOrderPaymentTypes: "required",
            },
            messages: {
                shucaiOrderUuidNumber: "订单号不能为空",
                addressId: "收货地址不能为空",
                shucaiId: "蔬菜不能为空",
                yonghuId: "用户不能为空",
                buyNumber: "购买数量不能为空",
                shucaiOrderTruePrice: "实付价格不能为空",
                shucaiOrderCourierName: "快递公司不能为空",
                shucaiOrderCourierNumber: "订单快递单号不能为空",
                shucaiOrderTypes: "订单类型不能为空",
                shucaiOrderPaymentTypes: "支付类型不能为空",
            }
        }).form();
    }

    // 获取当前详情
    function getDetails() {
        var addshucaiOrder = window.sessionStorage.getItem("addshucaiOrder");
        if (addshucaiOrder != null && addshucaiOrder != "" && addshucaiOrder != "null") {
            //注册表单验证
            $(validform());
            $("#shucaiOrderUuidNumber").val(new Date().getTime()+Math.ceil(Math.random()*10));//设置唯一号

            $('#submitBtn').text('新增');

        } else {
            $('#submitBtn').text('修改');
            var userId = window.sessionStorage.getItem('userId');
            updateId = userId;//先赋值登录用户id
            var uId  = window.sessionStorage.getItem('updateId');//获取修改传过来的id
            if (uId != null && uId != "" && uId != "null") {
                //如果修改id不为空就赋值修改id
                updateId = uId;
            }
            window.sessionStorage.removeItem('updateId');
            http("shucaiOrder/info/" + updateId, "GET", {}, (res) => {
                if(res.code == 0)
                {
                    ruleForm = res.data
                    // 是/否下拉框回显
                    setSelectOption();
                    // 设置图片src
                    showImg();
                    // 设置视频src
                    showVideo();
                    // 数据填充
                    dataBind();
                    // 富文本框回显
                    setContent();
                    //注册表单验证
                    $(validform());
                }

            });
        }
    }

    // 清除可能会重复渲染的selection
    function clear(className) {
        var elements = document.getElementsByClassName(className);
        for (var i = elements.length - 1; i >= 0; i--) {
            elements[i].parentNode.removeChild(elements[i]);
        }
    }

    function dateTimePick() {
        var insertTime = laydate.render({
            elem: '#insertTime-input'
            ,type: 'datetime'
        });
    }


    function dataBind() {


    <!--  级联表的数据回显  -->
        addressDataBind();
        shucaiDataBind();
        yonghuDataBind();


    <!--  当前表的数据回显  -->
        $("#updateId").val(ruleForm.id);
        $("#shucaiOrderUuidNumber").val(ruleForm.shucaiOrderUuidNumber);
        $("#addressId").val(ruleForm.addressId);
        $("#shucaiId").val(ruleForm.shucaiId);
        $("#yonghuId").val(ruleForm.yonghuId);
        $("#buyNumber").val(ruleForm.buyNumber);
        $("#shucaiOrderTruePrice").val(ruleForm.shucaiOrderTruePrice);
        $("#shucaiOrderCourierName").val(ruleForm.shucaiOrderCourierName);
        $("#shucaiOrderCourierNumber").val(ruleForm.shucaiOrderCourierNumber);

    }
    <!--  级联表的数据回显  -->
    function addressDataBind(){

                    <!-- 把id赋值给当前表的id-->
        $("#addressId").val(ruleForm.id);

        $("#yonghuId").val(ruleForm.yonghuId);
        $("#addressName").val(ruleForm.addressName);
        $("#addressPhone").val(ruleForm.addressPhone);
        $("#addressDizhi").val(ruleForm.addressDizhi);
        $("#isdefaultValue").val(ruleForm.isdefaultValue);
    }

    function shucaiDataBind(){

                    <!-- 把id赋值给当前表的id-->
        $("#shucaiId").val(ruleForm.id);

        $("#shucaiName").val(ruleForm.shucaiName);
        $("#shucaiUuidNumber").val(ruleForm.shucaiUuidNumber);
        $("#shucaiValue").val(ruleForm.shucaiValue);
        $("#shucaiKucunNumber").val(ruleForm.shucaiKucunNumber);
        $("#shucaiPrice").val(ruleForm.shucaiPrice);
        $("#shucaiOldMoney").val(ruleForm.shucaiOldMoney);
        $("#shucaiNewMoney").val(ruleForm.shucaiNewMoney);
        $("#shucaiClicknum").val(ruleForm.shucaiClicknum);
        $("#shucaiContent").val(ruleForm.shucaiContent);
        $("#shangxiaValue").val(ruleForm.shangxiaValue);
    }

    function yonghuDataBind(){

                    <!-- 把id赋值给当前表的id-->
        $("#yonghuId").val(ruleForm.id);

        $("#yonghuName").val(ruleForm.yonghuName);
        $("#yonghuPhone").val(ruleForm.yonghuPhone);
        $("#yonghuIdNumber").val(ruleForm.yonghuIdNumber);
        $("#yonghuEmail").val(ruleForm.yonghuEmail);
        $("#newMoney").val(ruleForm.newMoney);
        $("#yonghuSumJifen").val(ruleForm.yonghuSumJifen);
        $("#yonghuNewJifen").val(ruleForm.yonghuNewJifen);
        $("#huiyuandengjiValue").val(ruleForm.huiyuandengjiValue);
    }


    //图片显示
    function showImg() {
        <!--  当前表的图片  -->

        <!--  级联表的图片  -->
        addressShowImg();
        shucaiShowImg();
        yonghuShowImg();
    }


    <!--  级联表的图片  -->

    function addressShowImg() {
    }


    function shucaiShowImg() {
        $("#shucaiPhotoImg").attr("src",ruleForm.shucaiPhoto);
    }


    function yonghuShowImg() {
        $("#yonghuPhotoImg").attr("src",ruleForm.yonghuPhoto);
    }



    //视频回显
    function showVideo() {
    <!--  当前表的视频  -->

    <!--  级联表的视频  -->
        addressShowVideo();
        shucaiShowVideo();
        yonghuShowVideo();
    }


    <!--  级联表的视频  -->

    function addressShowVideo() {
    }

    function shucaiShowVideo() {
        $("#shucaiPhotoV").attr("src",ruleForm.shucaiPhoto);
    }

    function yonghuShowVideo() {
        $("#yonghuPhotoV").attr("src",ruleForm.yonghuPhoto);
    }



    $(document).ready(function () {
        //设置右上角用户名
        $('.dropdown-menu h5').html(window.sessionStorage.getItem('username'))
        //设置项目名
        $('.sidebar-header h3 a').html(projectName)
        //设置导航栏菜单
        setMenu();
        $('#exitBtn').on('click', function (e) {
            e.preventDefault();
            exit();
        });
        //初始化时间插件
        dateTimePick();
        //查询所有下拉框
            <!--  当前表的下拉框  -->
            shucaiOrderTypesSelect();
            shucaiOrderPaymentTypesSelect();
            <!-- 查询级联表的下拉框(用id做option,用名字及其他参数做名字级联修改) -->
            addressSelect();
            shucaiSelect();
            yonghuSelect();



        // 初始化下拉框
            <!--  初始化当前表的下拉框  -->
            initializationShucaiordertypesSelect();
            initializationShucaiorderpaymenttypesSelect();
            <!--  初始化级联表的下拉框  -->
            initializationaddressSelect();
            initializationshucaiSelect();
            initializationyonghuSelect();

        $(".selectpicker" ).selectpicker('refresh');
        getDetails();
        //初始化上传按钮
        upload();
    <%@ include file="../../static/myInfo.js"%>
                $('#submitBtn').on('click', function (e) {
                    e.preventDefault();
                    //console.log("点击了...提交按钮");
                    submit();
                });
        readonly();
        window.sessionStorage.removeItem('addshucaiOrder');
    });

    function readonly() {
        if (window.sessionStorage.getItem('role') == '管理员') {
            //$('#jifen').attr('readonly', 'readonly');
            //$('#role').attr('style', 'pointer-events:none;width:450px;');
        }
		else if (window.sessionStorage.getItem('role') == '用户') {
            // $(".aaaaaa").remove();
            $(".yonghu").remove();//删除当前用户的信息
        }
		else if (window.sessionStorage.getItem('role') == '员工') {
            // $(".aaaaaa").remove();
            $(".yuangong").remove();//删除当前用户的信息
        }
		else if (window.sessionStorage.getItem('role') == '经理') {
            // $(".aaaaaa").remove();
            $(".jingli").remove();//删除当前用户的信息
        }
        else{
            // alert("未知情况.......");
            // var replyTextUeditor = UE.getEditor('replyTextEditor');
            // replyTextUeditor.ready(function () {
            //     replyTextUeditor.setDisabled('fullscreen');
            // });
        }
    }

    //比较大小
    function compare() {
        var largerVal = null;
        var smallerVal = null;
        if (largerVal != null && smallerVal != null) {
            if (largerVal <= smallerVal) {
                alert(smallerName + '不能大于等于' + largerName);
                return false;
            }
        }
        return true;
    }


    // 用户登出
    <%@ include file="../../static/logout.jsp"%>
</script>
</body>

</html>
