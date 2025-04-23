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
                    <h3 class="block-title">编辑蔬菜退换货</h3>
                </div>
                <div class="col-md-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/index.jsp">
                                <span class="ti-home"></span>
                            </a>
                        </li>
                        <li class="breadcrumb-item">蔬菜退换货管理</li>
                        <li class="breadcrumb-item active">编辑蔬菜退换货</li>
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
                        <h3 class="widget-title">蔬菜退换货信息</h3>
                        <form id="addOrUpdateForm">
                            <div class="form-row">
                            <!-- 级联表的字段 -->
                                    <div class="form-group col-md-6 aaaaaa shucai_order">
                                        <label>蔬菜订单</label>
                                        <div>
                                            <select style="width: 450px" id="shucaiOrderSelect" name="shucaiOrderSelect"
                                                    class="selectpicker form-control"  data-live-search="true"
                                                    title="请选择" data-header="请选择" data-size="5" data-width="650px">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6 shucai_order">
                                        <label>订单号</label>
                                        <input style="width: 450px" id="shucaiOrderUuidNumber" name="shucaiOrderUuidNumber" class="form-control"
                                               placeholder="订单号" readonly>
                                    </div>
                                    <%--<div class="form-group col-md-6 shucai_order">
                                        <label>订单类型</label>
                                        <input style="width: 450px" id="shucaiOrderValue" name="shucaiOrderValue" class="form-control"
                                               placeholder="订单类型" readonly>
                                    </div>--%>
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
                                    <div class="form-group col-md-6 yonghu">
                                        <label>用户手机号</label>
                                        <input style="width: 450px" id="yonghuPhone" name="yonghuPhone" class="form-control"
                                               placeholder="用户手机号" readonly>
                                    </div>
                                    <div class="form-group col-md-6 yonghu">
                                        <label>用户头像</label>
                                        <img id="yonghuPhotoImg" src="" width="100" height="100">
                                    </div>
                                    <div class="form-group col-md-6 yonghu">
                                        <label>余额</label>
                                        <input style="width: 450px" id="newMoney" name="newMoney" class="form-control"
                                               placeholder="余额" readonly>
                                    </div>
                            <!-- 当前表的字段 -->
                                    <input id="updateId" name="id" type="hidden">
                                    <div class="form-group col-md-6 shucaiTuihuanhuoUuidNumberDiv">
                                        <label>退换货编号</label>
                                        <input style="width: 450px" id="shucaiTuihuanhuoUuidNumber" name="shucaiTuihuanhuoUuidNumber" class="form-control"
                                               placeholder="退换货编号">
                                    </div>
                                <input id="shucaiOrderId" name="shucaiOrderId" type="hidden">
                                <input id="yonghuId" name="yonghuId" type="hidden">
                                    <div class="form-group col-md-6 tuihuanhuoTypesDiv">
                                        <label>退换货</label>
                                        <select style="width: 450px" id="tuihuanhuoTypesSelect" name="tuihuanhuoTypes" class="form-control">
                                        </select>
                                    </div>
                                    <div class="form-group  col-md-6 gonggaoContentDiv">
                                        <label>申请理由</label>
                                        <input id="gonggaoContentupload" name="file" type="file">
                                        <script id="gonggaoContentEditor" type="text/plain"
                                                style="width:100%;height:230px;"></script>
                                        <script type = "text/javascript" >
                                        //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
                                        //相见文档配置属于你自己的编译器
                                        var gonggaoContentUe = UE.getEditor('gonggaoContentEditor', {
                                            toolbars: [
                                                [
                                                    'undo', //撤销
                                                    'bold', //加粗
                                                    'redo', //重做
                                                    'underline', //下划线
                                                    'horizontal', //分隔线
                                                    'inserttitle', //插入标题
                                                    'cleardoc', //清空文档
                                                    'fontfamily', //字体
                                                    'fontsize', //字号
                                                    'paragraph', //段落格式
                                                    'inserttable', //插入表格
                                                    'justifyleft', //居左对齐
                                                    'justifyright', //居右对齐
                                                    'justifycenter', //居中对
                                                    'justifyjustify', //两端对齐
                                                    'forecolor', //字体颜色
                                                    'fullscreen', //全屏
                                                    'edittip ', //编辑提示
                                                    'customstyle', //自定义标题
                                                ]
                                            ]
                                        });
                                        </script>
                                        <input type="hidden" name="gonggaoContent" id="gonggaoContent-input">
                                    </div>
                                    <%--<div class="form-group  col-md-6 shucaiTuihuanhuoYesnoContentDiv">
                                        <label>审核意见</label>
                                        <input id="shucaiTuihuanhuoYesnoContentupload" name="file" type="file">
                                        <script id="shucaiTuihuanhuoYesnoContentEditor" type="text/plain"
                                                style="width:100%;height:230px;"></script>
                                        <script type = "text/javascript" >
                                        //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
                                        //相见文档配置属于你自己的编译器
                                        var shucaiTuihuanhuoYesnoContentUe = UE.getEditor('shucaiTuihuanhuoYesnoContentEditor', {
                                            toolbars: [
                                                [
                                                    'undo', //撤销
                                                    'bold', //加粗
                                                    'redo', //重做
                                                    'underline', //下划线
                                                    'horizontal', //分隔线
                                                    'inserttitle', //插入标题
                                                    'cleardoc', //清空文档
                                                    'fontfamily', //字体
                                                    'fontsize', //字号
                                                    'paragraph', //段落格式
                                                    'inserttable', //插入表格
                                                    'justifyleft', //居左对齐
                                                    'justifyright', //居右对齐
                                                    'justifycenter', //居中对
                                                    'justifyjustify', //两端对齐
                                                    'forecolor', //字体颜色
                                                    'fullscreen', //全屏
                                                    'edittip ', //编辑提示
                                                    'customstyle', //自定义标题
                                                ]
                                            ]
                                        });
                                        </script>
                                        <input type="hidden" name="shucaiTuihuanhuoYesnoContent" id="shucaiTuihuanhuoYesnoContent-input">
                                    </div>
                                    <div class="form-group col-md-6 shenheTimeDiv">
                                        <label>审核时间</label>
                                        <input style="width: 450px" id="shenheTime-input" name="shenheTime" type="text" class="form-control layui-input">
                                    </div>
                                    <div class="form-group col-md-6 shucaiTuihuanhuoCourierNameDiv">
                                        <label>退回快递公司</label>
                                        <input style="width: 450px" id="shucaiTuihuanhuoCourierName" name="shucaiTuihuanhuoCourierName" class="form-control"
                                               placeholder="退回快递公司">
                                    </div>
                                    <div class="form-group col-md-6 shucaiTuihuanhuoCourierNumberDiv">
                                        <label>退回快递单号</label>
                                        <input style="width: 450px" id="shucaiTuihuanhuoCourierNumber" name="shucaiTuihuanhuoCourierNumber" class="form-control"
                                               placeholder="退回快递单号">
                                    </div>
                                    <div class="form-group col-md-6 kuaidiTypesDiv">
                                        <label>快递状态</label>
                                        <select style="width: 450px" id="kuaidiTypesSelect" name="kuaidiTypes" class="form-control">
                                        </select>
                                    </div>
                                    <div class="form-group col-md-6 shucaiHuanhuoCourierNameDiv">
                                        <label>换货快递公司</label>
                                        <input style="width: 450px" id="shucaiHuanhuoCourierName" name="shucaiHuanhuoCourierName" class="form-control"
                                               placeholder="换货快递公司">
                                    </div>
                                    <div class="form-group col-md-6 shucaiHuanhuoCourierNumberDiv">
                                        <label>换货快递单号</label>
                                        <input style="width: 450px" id="shucaiHuanhuoCourierNumber" name="shucaiHuanhuoCourierNumber" class="form-control"
                                               placeholder="换货快递单号">
                                    </div>--%>
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

    var tableName = "shucaiTuihuanhuo";
    var pageType = "add-or-update";
    var updateId = "";
    var crossTableId = -1;
    var crossTableName = '';
    var ruleForm = {};
    var crossRuleForm = {};


    // 下拉框数组
        <!-- 当前表的下拉框数组 -->
    var tuihuanhuoTypesOptions = [];
    var shucaiTuihuanhuoYesnoTypesOptions = [];
    var kuaidiTypesOptions = [];
        <!-- 级联表的下拉框数组 -->
    var shucaiOrderOptions = [];
    var yonghuOptions = [];

    var ruleForm = {};


    // 文件上传
    function upload() {

        <!-- 当前表的文件上传 -->

        $('#gonggaoContentupload').fileupload({
            url: baseUrl + 'file/upload',
            headers: {token: window.sessionStorage.getItem("token")},
            dataType: 'json',
            done: function (e, data) {
                UE.getEditor('gonggaoContentEditor').execCommand('insertHtml', '<img src=\"' + baseUrl + 'upload/' + data.result.file + '\" width=900 height=560>');
            }
        });


        $('#shucaiTuihuanhuoYesnoContentupload').fileupload({
            url: baseUrl + 'file/upload',
            headers: {token: window.sessionStorage.getItem("token")},
            dataType: 'json',
            done: function (e, data) {
                UE.getEditor('shucaiTuihuanhuoYesnoContentEditor').execCommand('insertHtml', '<img src=\"' + baseUrl + 'upload/' + data.result.file + '\" width=900 height=560>');
            }
        });


    }

    // 表单提交
    function submit() {
        if (validform() == true && compare() == true) {
            let data = {};
            getContent();
            if(window.sessionStorage.getItem('role') != '蔬菜订单'){//当前登录用户不为这个
                if($("#shucaiOrderId") !=null){
                    var shucaiOrderId = $("#shucaiOrderId").val();
                    if(shucaiOrderId == null || shucaiOrderId =='' || shucaiOrderId == 'null'){
                        alert("蔬菜订单不能为空");
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
            httpJson("shucaiTuihuanhuo/" + urlParam, "POST", data, (res) => {
                if(res.code == 0){
                    window.sessionStorage.removeItem('addshucaiTuihuanhuo');
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
        function tuihuanhuoTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=tuihuanhuo_types", "GET", {}, (res) => {
                if(res.code == 0){
                    tuihuanhuoTypesOptions = res.data.list;
                }
            });
        }
        function shucaiTuihuanhuoYesnoTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=shucai_tuihuanhuo_yesno_types", "GET", {}, (res) => {
                if(res.code == 0){
                    shucaiTuihuanhuoYesnoTypesOptions = res.data.list;
                }
            });
        }
        function kuaidiTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=kuaidi_types", "GET", {}, (res) => {
                if(res.code == 0){
                    kuaidiTypesOptions = res.data.list;
                }
            });
        }
        <!-- 查询级联表的所有列表 -->
        function shucaiOrderSelect() {
            //填充下拉框选项
            http("shucaiOrder/page?page=1&limit=100&sort=&order=", "GET", {}, (res) => {
                if(res.code == 0){
                    shucaiOrderOptions = res.data.list;
                }
            });
        }

        function shucaiOrderSelectOne(id) {
            http("shucaiOrder/info/"+id, "GET", {}, (res) => {
                if(res.code == 0){
                ruleForm = res.data;
                shucaiOrderShowImg();
                shucaiOrderShowVideo();
                shucaiOrderDataBind();
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
        function initializationTuihuanhuotypesSelect(){
            var tuihuanhuoTypesSelect = document.getElementById('tuihuanhuoTypesSelect');
            if(tuihuanhuoTypesSelect != null && tuihuanhuoTypesOptions != null  && tuihuanhuoTypesOptions.length > 0 ){
                for (var i = 0; i < tuihuanhuoTypesOptions.length; i++) {
                    tuihuanhuoTypesSelect.add(new Option(tuihuanhuoTypesOptions[i].indexName,tuihuanhuoTypesOptions[i].codeIndex));
                }
            }
        }
        function initializationShucaituihuanhuoyesnotypesSelect(){
            var shucaiTuihuanhuoYesnoTypesSelect = document.getElementById('shucaiTuihuanhuoYesnoTypesSelect');
            if(shucaiTuihuanhuoYesnoTypesSelect != null && shucaiTuihuanhuoYesnoTypesOptions != null  && shucaiTuihuanhuoYesnoTypesOptions.length > 0 ){
                for (var i = 0; i < shucaiTuihuanhuoYesnoTypesOptions.length; i++) {
                    shucaiTuihuanhuoYesnoTypesSelect.add(new Option(shucaiTuihuanhuoYesnoTypesOptions[i].indexName,shucaiTuihuanhuoYesnoTypesOptions[i].codeIndex));
                }
            }
        }
        function initializationKuaiditypesSelect(){
            var kuaidiTypesSelect = document.getElementById('kuaidiTypesSelect');
            if(kuaidiTypesSelect != null && kuaidiTypesOptions != null  && kuaidiTypesOptions.length > 0 ){
                for (var i = 0; i < kuaidiTypesOptions.length; i++) {
                    kuaidiTypesSelect.add(new Option(kuaidiTypesOptions[i].indexName,kuaidiTypesOptions[i].codeIndex));
                }
            }
        }

        function initializationshucaiOrderSelect() {
            var shucaiOrderSelect = document.getElementById('shucaiOrderSelect');
            if(shucaiOrderSelect != null && shucaiOrderOptions != null  && shucaiOrderOptions.length > 0 ) {
                for (var i = 0; i < shucaiOrderOptions.length; i++) {
                        shucaiOrderSelect.add(new Option(shucaiOrderOptions[i].shucaiOrderUuidNumber, shucaiOrderOptions[i].id));
                }

                $("#shucaiOrderSelect").change(function(e) {
                        shucaiOrderSelectOne(e.target.value);
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

        var tuihuanhuoTypesSelect = document.getElementById("tuihuanhuoTypesSelect");
        if(tuihuanhuoTypesSelect != null && tuihuanhuoTypesOptions != null  && tuihuanhuoTypesOptions.length > 0 ) {
            for (var i = 0; i < tuihuanhuoTypesOptions.length; i++) {
                if (tuihuanhuoTypesOptions[i].codeIndex == ruleForm.tuihuanhuoTypes) {//下拉框value对比,如果一致就赋值汉字
                        tuihuanhuoTypesSelect.options[i].selected = true;
                }
            }
        }

        var shucaiTuihuanhuoYesnoTypesSelect = document.getElementById("shucaiTuihuanhuoYesnoTypesSelect");
        if(shucaiTuihuanhuoYesnoTypesSelect != null && shucaiTuihuanhuoYesnoTypesOptions != null  && shucaiTuihuanhuoYesnoTypesOptions.length > 0 ) {
            for (var i = 0; i < shucaiTuihuanhuoYesnoTypesOptions.length; i++) {
                if (shucaiTuihuanhuoYesnoTypesOptions[i].codeIndex == ruleForm.shucaiTuihuanhuoYesnoTypes) {//下拉框value对比,如果一致就赋值汉字
                        shucaiTuihuanhuoYesnoTypesSelect.options[i].selected = true;
                }
            }
        }

        var kuaidiTypesSelect = document.getElementById("kuaidiTypesSelect");
        if(kuaidiTypesSelect != null && kuaidiTypesOptions != null  && kuaidiTypesOptions.length > 0 ) {
            for (var i = 0; i < kuaidiTypesOptions.length; i++) {
                if (kuaidiTypesOptions[i].codeIndex == ruleForm.kuaidiTypes) {//下拉框value对比,如果一致就赋值汉字
                        kuaidiTypesSelect.options[i].selected = true;
                }
            }
        }
        <!--  级联表的下拉框回显  -->
            var shucaiOrderSelect = document.getElementById("shucaiOrderSelect");
            if(shucaiOrderSelect != null && shucaiOrderOptions != null  && shucaiOrderOptions.length > 0 ) {
                for (var i = 0; i < shucaiOrderOptions.length; i++) {
                    if (shucaiOrderOptions[i].id == ruleForm.shucaiOrderId) {//下拉框value对比,如果一致就赋值汉字
                        shucaiOrderSelect.options[i+1].selected = true;
                        $("#shucaiOrderSelect" ).selectpicker('refresh');
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
        if (ruleForm.gonggaoContent != null && ruleForm.gonggaoContent != 'null' && ruleForm.gonggaoContent != '' && $("#gonggaoContentupload").length>0) {

            var gonggaoContentUeditor = UE.getEditor('gonggaoContentEditor');
            gonggaoContentUeditor.ready(function () {
                var mes = '';
                if(ruleForm.gonggaoContent != null){
                    mes = ''+ ruleForm.gonggaoContent;
                    // mes = mes.replace(/\n/g, "<br>");
                }
                gonggaoContentUeditor.setContent(mes);
            });
        }
        if (ruleForm.shucaiTuihuanhuoYesnoContent != null && ruleForm.shucaiTuihuanhuoYesnoContent != 'null' && ruleForm.shucaiTuihuanhuoYesnoContent != '' && $("#shucaiTuihuanhuoYesnoContentupload").length>0) {

            var shucaiTuihuanhuoYesnoContentUeditor = UE.getEditor('shucaiTuihuanhuoYesnoContentEditor');
            shucaiTuihuanhuoYesnoContentUeditor.ready(function () {
                var mes = '';
                if(ruleForm.shucaiTuihuanhuoYesnoContent != null){
                    mes = ''+ ruleForm.shucaiTuihuanhuoYesnoContent;
                    // mes = mes.replace(/\n/g, "<br>");
                }
                shucaiTuihuanhuoYesnoContentUeditor.setContent(mes);
            });
        }
    }
    // 获取富文本框内容
    function getContent() {

        <!-- 获取当前表的富文本框内容 -->
        if($("#gonggaoContentupload").length>0) {
            var gonggaoContentEditor = UE.getEditor('gonggaoContentEditor');
            if (gonggaoContentEditor.hasContents()) {
                $('#gonggaoContent-input').attr('value', gonggaoContentEditor.getContent());
            }
        }
        if($("#shucaiTuihuanhuoYesnoContentupload").length>0) {
            var shucaiTuihuanhuoYesnoContentEditor = UE.getEditor('shucaiTuihuanhuoYesnoContentEditor');
            if (shucaiTuihuanhuoYesnoContentEditor.hasContents()) {
                $('#shucaiTuihuanhuoYesnoContent-input').attr('value', shucaiTuihuanhuoYesnoContentEditor.getContent());
            }
        }
    }
    //数字检查
        <!-- 当前表的数字检查 -->

    function exit() {
        window.sessionStorage.removeItem("updateId");
        window.sessionStorage.removeItem('addshucaiTuihuanhuo');
        window.location.href = "list.jsp";
    }
    // 表单校验
    function validform() {
        return $("#addOrUpdateForm").validate({
            rules: {
                shucaiTuihuanhuoUuidNumber: "required",
                shucaiOrderId: "required",
                yonghuId: "required",
                tuihuanhuoTypes: "required",
                gonggaoContent: "required",
                shucaiTuihuanhuoYesnoTypes: "required",
                shucaiTuihuanhuoYesnoContent: "required",
                shenheTime: "required",
                shucaiTuihuanhuoCourierName: "required",
                shucaiTuihuanhuoCourierNumber: "required",
                kuaidiTypes: "required",
                shucaiHuanhuoCourierName: "required",
                shucaiHuanhuoCourierNumber: "required",
            },
            messages: {
                shucaiTuihuanhuoUuidNumber: "退换货编号不能为空",
                shucaiOrderId: "蔬菜订单不能为空",
                yonghuId: "用户不能为空",
                tuihuanhuoTypes: "退换货不能为空",
                gonggaoContent: "申请理由不能为空",
                shucaiTuihuanhuoYesnoTypes: "审核状态不能为空",
                shucaiTuihuanhuoYesnoContent: "审核意见不能为空",
                shenheTime: "审核时间不能为空",
                shucaiTuihuanhuoCourierName: "退回快递公司不能为空",
                shucaiTuihuanhuoCourierNumber: "退回快递单号不能为空",
                kuaidiTypes: "快递状态不能为空",
                shucaiHuanhuoCourierName: "换货快递公司不能为空",
                shucaiHuanhuoCourierNumber: "换货快递单号不能为空",
            }
        }).form();
    }

    // 获取当前详情
    function getDetails() {
        var addshucaiTuihuanhuo = window.sessionStorage.getItem("addshucaiTuihuanhuo");
        if (addshucaiTuihuanhuo != null && addshucaiTuihuanhuo != "" && addshucaiTuihuanhuo != "null") {
            //注册表单验证
            $(validform());
            $("#shucaiTuihuanhuoUuidNumber").val(new Date().getTime()+Math.ceil(Math.random()*10));//设置唯一号
                $(".shucaiTuihuanhuoYesnoTypesDiv").remove();
                $(".shucaiTuihuanhuoYesnoTextDiv").remove();

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
            http("shucaiTuihuanhuo/info/" + updateId, "GET", {}, (res) => {
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
        var shenheTime = laydate.render({
            elem: '#shenheTime-input'
            ,type: 'datetime'
        });
    }


    function dataBind() {


    <!--  级联表的数据回显  -->
        shucaiOrderDataBind();
        yonghuDataBind();


    <!--  当前表的数据回显  -->
        $("#updateId").val(ruleForm.id);
        $("#shucaiTuihuanhuoUuidNumber").val(ruleForm.shucaiTuihuanhuoUuidNumber);
        $("#shucaiOrderId").val(ruleForm.shucaiOrderId);
        $("#yonghuId").val(ruleForm.yonghuId);
        $("#gonggaoContent").val(ruleForm.gonggaoContent);
        $("#shucaiTuihuanhuoYesnoContent").val(ruleForm.shucaiTuihuanhuoYesnoContent);
        $("#shenheTime-input").val(ruleForm.shenheTime);
        $("#shucaiTuihuanhuoCourierName").val(ruleForm.shucaiTuihuanhuoCourierName);
        $("#shucaiTuihuanhuoCourierNumber").val(ruleForm.shucaiTuihuanhuoCourierNumber);
        $("#shucaiHuanhuoCourierName").val(ruleForm.shucaiHuanhuoCourierName);
        $("#shucaiHuanhuoCourierNumber").val(ruleForm.shucaiHuanhuoCourierNumber);

    }
    <!--  级联表的数据回显  -->
    function shucaiOrderDataBind(){

                    <!-- 把id赋值给当前表的id-->
        $("#shucaiOrderId").val(ruleForm.id);

        $("#shucaiOrderUuidNumber").val(ruleForm.shucaiOrderUuidNumber);
        $("#addressId").val(ruleForm.addressId);
        $("#shucaiId").val(ruleForm.shucaiId);
        $("#yonghuId").val(ruleForm.yonghuId);
        $("#buyNumber").val(ruleForm.buyNumber);
        $("#shucaiOrderTruePrice").val(ruleForm.shucaiOrderTruePrice);
        $("#shucaiOrderCourierName").val(ruleForm.shucaiOrderCourierName);
        $("#shucaiOrderCourierNumber").val(ruleForm.shucaiOrderCourierNumber);
        $("#shucaiOrderValue").val(ruleForm.shucaiOrderValue);
        $("#shucaiOrderPaymentValue").val(ruleForm.shucaiOrderPaymentValue);
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
        shucaiOrderShowImg();
        yonghuShowImg();
    }


    <!--  级联表的图片  -->

    function shucaiOrderShowImg() {
    }


    function yonghuShowImg() {
        $("#yonghuPhotoImg").attr("src",ruleForm.yonghuPhoto);
    }



    //视频回显
    function showVideo() {
    <!--  当前表的视频  -->

    <!--  级联表的视频  -->
        shucaiOrderShowVideo();
        yonghuShowVideo();
    }


    <!--  级联表的视频  -->

    function shucaiOrderShowVideo() {
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
            tuihuanhuoTypesSelect();
            shucaiTuihuanhuoYesnoTypesSelect();
            kuaidiTypesSelect();
            <!-- 查询级联表的下拉框(用id做option,用名字及其他参数做名字级联修改) -->
            shucaiOrderSelect();
            yonghuSelect();



        // 初始化下拉框
            <!--  初始化当前表的下拉框  -->
            initializationTuihuanhuotypesSelect();
            initializationShucaituihuanhuoyesnotypesSelect();
            initializationKuaiditypesSelect();
            <!--  初始化级联表的下拉框  -->
            initializationshucaiOrderSelect();
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
        window.sessionStorage.removeItem('addshucaiTuihuanhuo');
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
