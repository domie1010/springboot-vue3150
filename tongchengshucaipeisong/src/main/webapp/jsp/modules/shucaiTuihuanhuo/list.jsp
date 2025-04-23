<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">

<head>
    <%@ include file="../../static/head.jsp" %>
    <!-- font-awesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">


    <link href="${pageContext.request.contextPath}/resources/css/bootstrap-select.css" rel="stylesheet">
    <!-- layui -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>
</head>
<style>

</style>
<body>


    <div class="modal fade" id="shucaiTuihuanhuoYesnoTypesModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">审核</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        审核：
                        <div class="col-sm-9">
                            <input type="hidden" id="shucaiTuihuanhuoYesnoTypesId">
                            <select id="shucaiTuihuanhuoYesnoTypes" name="shucaiTuihuanhuoYesnoTypes" class="form-control">
                                <option value="2">同意</option>
                                <option value="3">拒绝</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        审核意见：
                        <textarea style="width: 450px"  id="shucaiTuihuanhuoYesnoContent" name="shucaiTuihuanhuoYesnoContent" class="form-control" placeholder="审核意见"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                    <button type="button" id="receive" onclick="shucaiTuihuanhuoYesnoTypesShenhe()" class="btn btn-primary">审 核</button>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="opentuihuidanhaoModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">填写退货快递信息</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="opentuihuidanhaoId">
                    <div class="row">
                        退回快递公司：
                        <div class="col-sm-9">
                            <input type="text" id="shucaiTuihuanhuoCourierName" style="width: 100%" class="form-control form-control-sm" >
                        </div>
                    </div>
                    <div class="row">
                        退回快递单号：
                        <div class="col-sm-9">
                            <input type="text" id="shucaiTuihuanhuoCourierNumber" style="width: 100%" class="form-control form-control-sm">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                    <button type="button" onclick="tuihuidanhao()" class="btn btn-primary">填写完成</button>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="openshoudaoModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">填写换货快递单号信息</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="openshoudaoId">
                    <div class="row">
                        换货快递公司：
                        <div class="col-sm-9">
                            <input type="text" id="shucaiHuanhuoCourierName" style="width: 100%" class="form-control form-control-sm" >
                        </div>
                    </div>
                    <div class="row">
                        换货快递单号：
                        <div class="col-sm-9">
                            <input type="text" id="shucaiHuanhuoCourierNumber" style="width: 100%" class="form-control form-control-sm">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                    <button type="button" onclick="shoudao()" class="btn btn-primary">填写完成</button>
                </div>
            </div>
        </div>
    </div>

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
                        <h3 class="block-title">蔬菜退换货管理</h3>
                    </div>
                    <div class="col-md-6">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="${pageContext.request.contextPath}/index.jsp">
                                    <span class="ti-home"></span>
                                </a>
                            </li>
                            <li class="breadcrumb-item">蔬菜退换货管理</li>
                            <li class="breadcrumb-item active">蔬菜退换货列表</li>
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
                            <h3 class="widget-title">蔬菜退换货列表</h3>
                            <div class="table-responsive mb-3">
                                <div class="col-sm-12">
                                                                         
                                    <div class="layui-inline" style="margin-bottom: 10px;">
                                        退换货编号
                                        <div class="layui-input-inline">
                                            <input type="text" id="shucaiTuihuanhuoUuidNumberSearch" style="width: 140px;" class="form-control form-control-sm"
                                                   placeholder="退换货编号" aria-controls="tableId">
                                        </div>
                                    </div>
                                                                                                             
                                    <div class="layui-inline" style="margin-bottom: 10px;">
                                        退换货
                                        <div class="layui-input-inline">
                                            <select name="tuihuanhuoTypesSelectSearch"  style="width: 150px;" id="tuihuanhuoTypesSelectSearch" class="form-control form-control-sm"
                                                    aria-controls="tableId">
                                            </select>
                                        </div>
                                    </div>
                                                                                                             
                                    <div class="layui-inline" style="margin-bottom: 10px;">
                                        审核状态
                                        <div class="layui-input-inline">
                                            <select name="shucaiTuihuanhuoYesnoTypesSelectSearch"  style="width: 150px;" id="shucaiTuihuanhuoYesnoTypesSelectSearch" class="form-control form-control-sm"
                                                    aria-controls="tableId">
                                            </select>
                                        </div>
                                    </div>
                                                                                                                                                                                     
                                    <div class="layui-inline" style="margin-bottom: 10px;">
                                        快递状态
                                        <div class="layui-input-inline">
                                            <select name="kuaidiTypesSelectSearch"  style="width: 150px;" id="kuaidiTypesSelectSearch" class="form-control form-control-sm"
                                                    aria-controls="tableId">
                                            </select>
                                        </div>
                                    </div>
                                                                                                            
                                                                                                         
                                    <div class="layui-inline" style="margin-bottom: 10px;">
                                        订单号
                                        <div class="layui-input-inline">
                                            <input type="text" id="shucaiOrderUuidNumberSearch" style="width: 140px;" class="form-control form-control-sm"
                                                   placeholder="订单号" aria-controls="tableId">
                                        </div>
                                    </div>
                                                                                                                                                                                                                                                                                                                                                                                                                                 
                                    <div class="layui-inline" style="margin-bottom: 10px;">
                                        订单类型
                                        <div class="layui-input-inline">
                                            <select name="shucaiOrderTypesSelectSearch"  style="width: 150px;" id="shucaiOrderTypesSelectSearch" class="form-control form-control-sm"
                                                    aria-controls="tableId">
                                            </select>
                                        </div>
                                    </div>
                                                                                                                                                                                                                                                                     
                                    <div class="layui-inline" style="margin-bottom: 10px;">
                                        用户姓名
                                        <div class="layui-input-inline">
                                            <input type="text" id="yonghuNameSearch" style="width: 140px;" class="form-control form-control-sm"
                                                   placeholder="用户姓名" aria-controls="tableId">
                                        </div>
                                    </div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
                                    <div class="layui-inline" style="margin-left: 30px;margin-bottom: 10px;">
                                        <button onclick="search()" type="button" class="btn btn-primary">查询</button>
                                        <button onclick="add()" type="button" class="btn btn-primary 新增">添加</button>
                                        <button onclick="graph()" type="button" class="btn btn-primary 报表">报表</button>
                                        <button onclick="exportExcel()" type="button" class="btn btn-success 导入导出"><i class="fa fa-file-excel-o" aria-hidden="true"></i>导出</button>
                                        <button onclick="deleteMore()" type="button" class="btn btn-danger 删除">批量删除</button>
                                    </div>
                                </div>
                                <table id="tableId" class="table table-bordered table-striped">
                                    <thead>
                                    <tr>
                                        <th class="no-sort" style="min-width: 35px;">
                                            <div class="custom-control custom-checkbox">
                                                <input class="custom-control-input" type="checkbox" id="select-all"
                                                       onclick="chooseAll()">
                                                <label class="custom-control-label" for="select-all"></label>
                                            </div>
                                        </th>

                                        <th >订单号</th>
                                        <%--<th >订单类型</th>--%>
                                        <th >用户姓名</th>
                                        <th >用户手机号</th>
                                        <%--<th >用户头像</th>--%>
                                        <%--<th >余额</th>--%>
                                        <th>退换货编号</th>
                                        <th>退换货</th>
                                        <th>申请时间</th>
                                        <th>审核状态</th>
                                        <th>审核时间</th>
                                        <th>退回快递公司</th>
                                        <th>退回快递单号</th>
                                        <th>快递状态</th>
                                        <th>换货快递公司</th>
                                        <th>换货快递单号</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody id="thisTbody">
                                    </tbody>
                                </table>
                                <div class="col-md-6 col-sm-3">
                                    <div class="dataTables_length" id="tableId_length">

                                        <select name="tableId_length" aria-controls="tableId" id="selectPageSize"
                                                onchange="changePageSize()">
                                            <option value="10">10</option>
                                            <option value="25">25</option>
                                            <option value="50">50</option>
                                            <option value="100">100</option>
                                        </select>
                                        条 每页

                                    </div>
                                </div>
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-end">
                                        <li class="page-item" id="tableId_previous" onclick="pageNumChange('pre')">
                                            <a class="page-link" href="#" tabindex="-1">上一页</a>
                                        </li>

                                        <li class="page-item" id="tableId_next" onclick="pageNumChange('next')">
                                            <a class="page-link" href="#">下一页</a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
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
    <script language="javascript" type="text/javascript"
            src="${pageContext.request.contextPath}/resources/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/js/bootstrap-select.js"></script>
    <script language="javascript" type="text/javascript"
            src="${pageContext.request.contextPath}/resources/js/excel/excel-gen.js"></script>
    <script language="javascript" type="text/javascript"
            src="${pageContext.request.contextPath}/resources/js/excel/jszip.min.js"></script>
    <script language="javascript" type="text/javascript"
            src="${pageContext.request.contextPath}/resources/js/excel/FileSaver.js"></script>
    <script>

        <%@ include file="../../utils/menu.jsp"%>
        <%@ include file="../../static/setMenu.js"%>
        <%@ include file="../../utils/baseUrl.jsp"%>
        <%@ include file="../../static/getRoleButtons.js"%>
        <%@ include file="../../static/crossBtnControl.js"%>
        var tableName = "shucaiTuihuanhuo";
        var pageType = "list";
        var searchForm = {key: ""};
        var pageIndex = 1;
        var pageSize = 10;
        var totalPage = 0;
        var dataList = [];
        var sortColumn = '';
        var sortOrder = '';
        var ids = [];
        var checkAll = false;

        <!-- 级联表的级联字典表 -->
        var shucaiOrderTypesOptions = [];

        <!-- 本表的级联字段表 -->
        var tuihuanhuoTypesOptions = [];
        var shucaiTuihuanhuoYesnoTypesOptions = [];
        var kuaidiTypesOptions = [];

        function init() {
            // 满足条件渲染提醒接口
        }

        // 改变每页记录条数
        function changePageSize() {
            var selection = document.getElementById('selectPageSize');
            var index = selection.selectedIndex;
            pageSize = selection.options[index].value;
            getDataList();
        }



        // 查询
        function search() {
            searchForm = {key: ""};

        <!-- 级联表的级联字典表 -->
                                         
                            //订单号
            var shucaiOrderUuidNumberSearchInput = $('#shucaiOrderUuidNumberSearch');
            if( shucaiOrderUuidNumberSearchInput != null){
                if (shucaiOrderUuidNumberSearchInput.val() != null && shucaiOrderUuidNumberSearchInput.val() != '') {
                    searchForm.shucaiOrderUuidNumber = $('#shucaiOrderUuidNumberSearch').val();
                }
            }
                                                                                                                                                                 
            var shucaiOrderTypesSelectSearchInput = document.getElementById("shucaiOrderTypesSelectSearch");
            if(shucaiOrderTypesSelectSearchInput != null){
                var shucaiOrderTypesIndex = shucaiOrderTypesSelectSearchInput.selectedIndex;
                if( shucaiOrderTypesIndex  != 0){
                    searchForm.shucaiOrderTypes = document.getElementById("shucaiOrderTypesSelectSearch").options[shucaiOrderTypesIndex].value;
                }
            }
                                                                                                     
                            //用户姓名
            var yonghuNameSearchInput = $('#yonghuNameSearch');
            if( yonghuNameSearchInput != null){
                if (yonghuNameSearchInput.val() != null && yonghuNameSearchInput.val() != '') {
                    searchForm.yonghuName = $('#yonghuNameSearch').val();
                }
            }
                                                                                                                                                                                        <!-- 本表的查询条件 -->

         
            //退换货编号
            var shucaiTuihuanhuoUuidNumberSearchInput = $('#shucaiTuihuanhuoUuidNumberSearch');
            if( shucaiTuihuanhuoUuidNumberSearchInput != null){
                if (shucaiTuihuanhuoUuidNumberSearchInput.val() != null && shucaiTuihuanhuoUuidNumberSearchInput.val() != '') {
                    searchForm.shucaiTuihuanhuoUuidNumber = $('#shucaiTuihuanhuoUuidNumberSearch').val();
                }
            }
             
                //退换货
            var tuihuanhuoTypesSelectSearchInput = document.getElementById("tuihuanhuoTypesSelectSearch");
            if(tuihuanhuoTypesSelectSearchInput != null){
                var tuihuanhuoTypesIndex = tuihuanhuoTypesSelectSearchInput.selectedIndex;
                if( tuihuanhuoTypesIndex  != 0){
                    searchForm.tuihuanhuoTypes= document.getElementById("tuihuanhuoTypesSelectSearch").options[tuihuanhuoTypesIndex].value;
                }
            }
             
                //审核状态
            var shucaiTuihuanhuoYesnoTypesSelectSearchInput = document.getElementById("shucaiTuihuanhuoYesnoTypesSelectSearch");
            if(shucaiTuihuanhuoYesnoTypesSelectSearchInput != null){
                var shucaiTuihuanhuoYesnoTypesIndex = shucaiTuihuanhuoYesnoTypesSelectSearchInput.selectedIndex;
                if( shucaiTuihuanhuoYesnoTypesIndex  != 0){
                    searchForm.shucaiTuihuanhuoYesnoTypes= document.getElementById("shucaiTuihuanhuoYesnoTypesSelectSearch").options[shucaiTuihuanhuoYesnoTypesIndex].value;
                }
            }
                     
                //快递状态
            var kuaidiTypesSelectSearchInput = document.getElementById("kuaidiTypesSelectSearch");
            if(kuaidiTypesSelectSearchInput != null){
                var kuaidiTypesIndex = kuaidiTypesSelectSearchInput.selectedIndex;
                if( kuaidiTypesIndex  != 0){
                    searchForm.kuaidiTypes= document.getElementById("kuaidiTypesSelectSearch").options[kuaidiTypesIndex].value;
                }
            }
                        getDataList();
        }

        // 获取数据列表
        function getDataList() {
            http("shucaiTuihuanhuo/page", "GET", {
                page: pageIndex,
                limit: pageSize,
                sort: sortColumn,
                order: sortOrder,
                shucaiTuihuanhuoDelete: 1,
                //本表的
                shucaiTuihuanhuoUuidNumber: searchForm.shucaiTuihuanhuoUuidNumber,
                tuihuanhuoTypes: searchForm.tuihuanhuoTypes,
                shucaiTuihuanhuoYesnoTypes: searchForm.shucaiTuihuanhuoYesnoTypes,
                kuaidiTypes: searchForm.kuaidiTypes,
            //级联表的
                shucaiOrderUuidNumber: searchForm.shucaiOrderUuidNumber,
                shucaiOrderTypes: searchForm.shucaiOrderTypes,

                yonghuName: searchForm.yonghuName,


            }, (res) => {
                if(res.code == 0) {
                    clear();
                    $("#thisTbody").html("");
                    dataList = res.data.list;
                    totalPage = res.data.totalPage;
                    for (var i = 0; i < dataList.length; i++) { //遍历一下表格数据  
                        var trow = setDataRow(dataList[i], i); //定义一个方法,返回tr数据 
                        $('#thisTbody').append(trow);
                    }
                    pagination(); //渲染翻页组件
                    getRoleButtons();// 权限按钮控制
                }
            });
        }

        // 渲染表格数据
        function setDataRow(item, number) {
            //创建行 
            var row = document.createElement('tr');
            row.setAttribute('class', 'useOnce');
            //创建勾选框
            var checkbox = document.createElement('td');
            var checkboxDiv = document.createElement('div');
            checkboxDiv.setAttribute("class", "custom-control custom-checkbox");
            var checkboxInput = document.createElement('input');
            checkboxInput.setAttribute("class", "custom-control-input");
            checkboxInput.setAttribute("type", "checkbox");
            checkboxInput.setAttribute('name', 'chk');
            checkboxInput.setAttribute('value', item.id);
            checkboxInput.setAttribute("id", number);
            checkboxDiv.appendChild(checkboxInput);
            var checkboxLabel = document.createElement('label');
            checkboxLabel.setAttribute("class", "custom-control-label");
            checkboxLabel.setAttribute("for", number);
            checkboxDiv.appendChild(checkboxLabel);
            checkbox.appendChild(checkboxDiv);
            row.appendChild(checkbox)


                    //订单号
            var shucaiOrderUuidNumberCell = document.createElement('td');
            shucaiOrderUuidNumberCell.innerHTML = item.shucaiOrderUuidNumber;
            row.appendChild(shucaiOrderUuidNumberCell);
/*
                        //订单类型
            var shucaiOrderTypesCell = document.createElement('td');
            shucaiOrderTypesCell.innerHTML = item.shucaiOrderValue;
            row.appendChild(shucaiOrderTypesCell);*/


                    //用户姓名
            var yonghuNameCell = document.createElement('td');
            yonghuNameCell.innerHTML = item.yonghuName;
            row.appendChild(yonghuNameCell);


                    //用户手机号
            var yonghuPhoneCell = document.createElement('td');
            yonghuPhoneCell.innerHTML = item.yonghuPhone;
            row.appendChild(yonghuPhoneCell);
/*

                //用户头像
            var yonghuPhotoCell = document.createElement('td');
            var yonghuPhotoImg = document.createElement('img');
            var yonghuPhotoImgValue = item.yonghuPhoto;
            if(yonghuPhotoImgValue !=null && yonghuPhotoImgValue !='' && yonghuPhotoImgValue !='null'){
                    yonghuPhotoImg.setAttribute('src', yonghuPhotoImgValue);
                    yonghuPhotoImg.setAttribute('height', 100);
                    yonghuPhotoImg.setAttribute('width', 100);
                    yonghuPhotoCell.appendChild(yonghuPhotoImg);
            }else{
                    yonghuPhotoCell.innerHTML = "暂无图片";
            }
            row.appendChild(yonghuPhotoCell);


                    //余额
            var newMoneyCell = document.createElement('td');
            newMoneyCell.innerHTML = item.newMoney;
            row.appendChild(newMoneyCell);*/


            //退换货编号
            var shucaiTuihuanhuoUuidNumberCell = document.createElement('td');
            shucaiTuihuanhuoUuidNumberCell.innerHTML = item.shucaiTuihuanhuoUuidNumber;
            row.appendChild(shucaiTuihuanhuoUuidNumberCell);


            //退换货
            var tuihuanhuoTypesCell = document.createElement('td');
            tuihuanhuoTypesCell.innerHTML = item.tuihuanhuoValue;
            row.appendChild(tuihuanhuoTypesCell);


            //申请时间
            var insertTimeCell = document.createElement('td');
            insertTimeCell.innerHTML = item.insertTime;
            row.appendChild(insertTimeCell);


            //审核状态
            var shucaiTuihuanhuoYesnoTypesCell = document.createElement('td');
            shucaiTuihuanhuoYesnoTypesCell.innerHTML = item.shucaiTuihuanhuoYesnoValue;
            row.appendChild(shucaiTuihuanhuoYesnoTypesCell);


            //审核时间
            var shenheTimeCell = document.createElement('td');
            shenheTimeCell.innerHTML = item.shenheTime;
            row.appendChild(shenheTimeCell);


            //退回快递公司
            var shucaiTuihuanhuoCourierNameCell = document.createElement('td');
            shucaiTuihuanhuoCourierNameCell.innerHTML = item.shucaiTuihuanhuoCourierName;
            row.appendChild(shucaiTuihuanhuoCourierNameCell);


            //退回快递单号
            var shucaiTuihuanhuoCourierNumberCell = document.createElement('td');
            shucaiTuihuanhuoCourierNumberCell.innerHTML = item.shucaiTuihuanhuoCourierNumber;
            row.appendChild(shucaiTuihuanhuoCourierNumberCell);


            //快递状态
            var kuaidiTypesCell = document.createElement('td');
            kuaidiTypesCell.innerHTML = item.kuaidiValue;
            row.appendChild(kuaidiTypesCell);


            //换货快递公司
            var shucaiHuanhuoCourierNameCell = document.createElement('td');
            shucaiHuanhuoCourierNameCell.innerHTML = item.shucaiHuanhuoCourierName;
            row.appendChild(shucaiHuanhuoCourierNameCell);


            //换货快递单号
            var shucaiHuanhuoCourierNumberCell = document.createElement('td');
            shucaiHuanhuoCourierNumberCell.innerHTML = item.shucaiHuanhuoCourierNumber;
            row.appendChild(shucaiHuanhuoCourierNumberCell);



            //每行按钮
            var btnGroup = document.createElement('td');

            //详情按钮
            var detailBtn = document.createElement('button');
            var detailAttr = "detail(" + item.id + ')';
            detailBtn.setAttribute("type", "button");
            detailBtn.setAttribute("class", "btn btn-info btn-sm 查看");
            detailBtn.setAttribute("onclick", detailAttr);
            detailBtn.innerHTML = "查看";
            btnGroup.appendChild(detailBtn);

            if(item.shucaiTuihuanhuoYesnoTypes == 1 &&
                ( window.sessionStorage.getItem('role') == "管理员"
                || window.sessionStorage.getItem('role') == "经理"
                )
            ){
                //审核按钮
                var yesnoBtn = document.createElement('button');
                var yesnoAttr = 'openYesnoTypes(' + item.id + ')';
                yesnoBtn.setAttribute("type", "button");
                yesnoBtn.setAttribute("class", "btn btn-warning btn-sm");
                yesnoBtn.setAttribute("onclick", yesnoAttr);
                yesnoBtn.innerHTML = "审核";
                btnGroup.appendChild(yesnoBtn);
            }



            if(item.shucaiTuihuanhuoYesnoTypes == 2 &&
                window.sessionStorage.getItem('role') == "用户"
                && item.shucaiTuihuanhuoCourierName == null
                && item.shucaiHuanhuoCourierNumber == null
            ){
                var opentuihuidanhaoBtn = document.createElement('button');
                var opentuihuidanhaoAttr = 'opentuihuidanhao(' + item.id + ')';
                opentuihuidanhaoBtn.setAttribute("type", "button");
                opentuihuidanhaoBtn.setAttribute("class", "btn btn-warning btn-sm");
                opentuihuidanhaoBtn.setAttribute("onclick", opentuihuidanhaoAttr);
                opentuihuidanhaoBtn.innerHTML = "填写退回单号";
                btnGroup.appendChild(opentuihuidanhaoBtn);
            }



            if(item.kuaidiTypes == 1 &&
                window.sessionStorage.getItem('role') == "经理"
            ){
                
                if(item.tuihuanhuoTypes ==1){//退货

                    var tuihuoBtn = document.createElement('button');
                    var tuihuoAttr = 'tuihuo(' + item.id + ')';
                    tuihuoBtn.setAttribute("type", "button");
                    tuihuoBtn.setAttribute("class", "btn btn-warning btn-sm");
                    tuihuoBtn.setAttribute("onclick", tuihuoAttr);
                    tuihuoBtn.innerHTML = "已收到并检查过退货物品";
                    btnGroup.appendChild(tuihuoBtn);
                }
                
                if(item.tuihuanhuoTypes ==2){//换货

                    var shoudaoBtn = document.createElement('button');
                    var shoudaoAttr = 'openshoudao(' + item.id + ')';
                    shoudaoBtn.setAttribute("type", "button");
                    shoudaoBtn.setAttribute("class", "btn btn-warning btn-sm");
                    shoudaoBtn.setAttribute("onclick", shoudaoAttr);
                    shoudaoBtn.innerHTML = "收货并填写换货单号";
                    btnGroup.appendChild(shoudaoBtn);
                }
            }


            //修改按钮
            var editBtn = document.createElement('button');
            var editAttr = 'edit(' + item.id + ')';
            editBtn.setAttribute("type", "button");
            editBtn.setAttribute("class", "btn btn-warning btn-sm 修改");
            editBtn.setAttribute("onclick", editAttr);
            editBtn.innerHTML = "修改";
            btnGroup.appendChild(editBtn);



            //删除按钮
            var deleteBtn = document.createElement('button');
            var deleteAttr = 'remove(' + item.id + ')';
            deleteBtn.setAttribute("type", "button");
            deleteBtn.setAttribute("class", "btn btn-danger btn-sm 删除");
            deleteBtn.setAttribute("onclick", deleteAttr);
            deleteBtn.innerHTML = "删除";
            btnGroup.appendChild(deleteBtn);

            row.appendChild(btnGroup);

            return row;
    }


        // 翻页
        function pageNumChange(val) {
            if (val == 'pre') {
                pageIndex--;
            } else if (val == 'next') {
                pageIndex++;
            } else {
                pageIndex = val;
            }
            getDataList();
        }

        // 下载
        function download(url) {
            window.open(url);
        }
        // 打开新窗口播放媒体
        function mediaPlay(url){
            window.open(url);
        }

        // 渲染翻页组件
        function pagination() {
            var beginIndex = pageIndex;
            var endIndex = pageIndex;
            var point = 4;
            //计算页码
            for (var i = 0; i < 3; i++) {
                if (endIndex == totalPage) {
                    break;
                }
                endIndex++;
                point--;
            }
            for (var i = 0; i < 3; i++) {
                if (beginIndex == 1) {
                    break;
                }
                beginIndex--;
                point--;
            }
            if (point > 0) {
                while (point > 0) {
                    if (endIndex == totalPage) {
                        break;
                    }
                    endIndex++;
                    point--;
                }
                while (point > 0) {
                    if (beginIndex == 1) {
                        break;
                    }
                    beginIndex--;
                    point--
                }
            }
            // 是否显示 前一页 按钮
            if (pageIndex > 1) {
                $('#tableId_previous').show();
            } else {
                $('#tableId_previous').hide();
            }
            // 渲染页码按钮
            for (var i = beginIndex; i <= endIndex; i++) {
                var pageNum = document.createElement('li');
                pageNum.setAttribute('onclick', "pageNumChange(" + i + ")");
                if (pageIndex == i) {
                    pageNum.setAttribute('class', 'paginate_button page-item active useOnce');
                } else {
                    pageNum.setAttribute('class', 'paginate_button page-item useOnce');
                }
                var pageHref = document.createElement('a');
                pageHref.setAttribute('class', 'page-link');
                pageHref.setAttribute('href', '#');
                pageHref.setAttribute('aria-controls', 'tableId');
                pageHref.setAttribute('data-dt-idx', i);
                pageHref.setAttribute('tabindex', 0);
                pageHref.innerHTML = i;
                pageNum.appendChild(pageHref);
                $('#tableId_next').before(pageNum);
            }
            // 是否显示 下一页 按钮
            if (pageIndex < totalPage) {
                $('#tableId_next').show();
                $('#tableId_next a').attr('data-dt-idx', endIndex + 1);
            } else {
                $('#tableId_next').hide();
            }
            var pageNumInfo = "当前第 " + pageIndex + " 页，共 " + totalPage + " 页";
            $('#tableId_info').html(pageNumInfo);
        }

        // 跳转到指定页
        function toThatPage() {
            //var index = document.getElementById('pageIndexInput').value;
            if (index < 0 || index > totalPage) {
                alert('请输入正确的页码');
            } else {
                pageNumChange(index);
            }
        }

        // 全选/全不选
        function chooseAll() {
            checkAll = !checkAll;
            var boxs = document.getElementsByName("chk");
            for (var i = 0; i < boxs.length; i++) {
                boxs[i].checked = checkAll;
            }
        }

        // 批量删除
        function deleteMore() {
            ids = []
            var boxs = document.getElementsByName("chk");
            for (var i = 0; i < boxs.length; i++) {
                if (boxs[i].checked) {
                    ids.push(boxs[i].value)
                }
            }
            if (ids.length == 0) {
                alert('请勾选要删除的记录');
            } else {
                remove(ids);
            }
        }

        // 删除
        function remove(id) {
            var mymessage = confirm("真的要删除吗？");
            if (mymessage == true) {
                var paramArray = [];
                if (id == ids) {
                    paramArray = id;
                } else {
                    paramArray.push(id);
                }
                httpJson("shucaiTuihuanhuo/delete", "POST", paramArray, (res) => {
                    if(res.code == 0){
                        getDataList();
                        alert('删除成功');
                    }
                });
            } else {
                alert("已取消操作");
            }
        }

        // 用户登出
        <%@ include file="../../static/logout.jsp"%>

        //修改
        function edit(id) {
            window.sessionStorage.setItem('updateId', id)
            window.location.href = "add-or-update.jsp"
        }

        //清除会重复渲染的节点
        function clear() {
            var elements = document.getElementsByClassName('useOnce');
            for (var i = elements.length - 1; i >= 0; i--) {
                elements[i].parentNode.removeChild(elements[i]);
            }
        }

        //添加
        function add() {
            window.sessionStorage.setItem("addshucaiTuihuanhuo", "addshucaiTuihuanhuo");
            window.location.href = "add-or-update.jsp"
        }

        //报表
        function graph() {
            window.location.href = "graph.jsp"
        }
        function exportExcel() {
            excel = new ExcelGen({
                "src_id": "tableId",
                "show_header": true,
                "file_name": 'shucaiTuihuanhuo.xlsx'
            });
            excel.generate();
        }

        // 查看详情
        function detail(id) {
            window.sessionStorage.setItem("updateId", id);
            window.location.href = "info.jsp";
        }


    //填充级联表搜索下拉框
                                         
                                                                                                                                                                 
        function shucaiOrderTypesSelectSearch() {
            var shucaiOrderTypesSelectSearch = document.getElementById('shucaiOrderTypesSelectSearch');
            if(shucaiOrderTypesSelectSearch != null) {
                shucaiOrderTypesSelectSearch.add(new Option('-请选择-',''));
                if (shucaiOrderTypesOptions != null && shucaiOrderTypesOptions.length > 0){
                    for (var i = 0; i < shucaiOrderTypesOptions.length; i++) {
                            shucaiOrderTypesSelectSearch.add(new Option(shucaiOrderTypesOptions[i].indexName, shucaiOrderTypesOptions[i].codeIndex));
                    }
                }
            }
        }
                                                                                                     
                                                                                                                                                                                    
    //填充本表搜索下拉框
         
             
        function tuihuanhuoTypesSelectSearch() {
            var tuihuanhuoTypesSelectSearch = document.getElementById('tuihuanhuoTypesSelectSearch');
            if(tuihuanhuoTypesSelectSearch != null) {
                tuihuanhuoTypesSelectSearch.add(new Option('-请选择-',''));
                if (tuihuanhuoTypesOptions != null && tuihuanhuoTypesOptions.length > 0){
                    for (var i = 0; i < tuihuanhuoTypesOptions.length; i++) {
                            tuihuanhuoTypesSelectSearch.add(new Option(tuihuanhuoTypesOptions[i].indexName,tuihuanhuoTypesOptions[i].codeIndex));
                    }
                }
            }
        }
             
        function shucaiTuihuanhuoYesnoTypesSelectSearch() {
            var shucaiTuihuanhuoYesnoTypesSelectSearch = document.getElementById('shucaiTuihuanhuoYesnoTypesSelectSearch');
            if(shucaiTuihuanhuoYesnoTypesSelectSearch != null) {
                shucaiTuihuanhuoYesnoTypesSelectSearch.add(new Option('-请选择-',''));
                if (shucaiTuihuanhuoYesnoTypesOptions != null && shucaiTuihuanhuoYesnoTypesOptions.length > 0){
                    for (var i = 0; i < shucaiTuihuanhuoYesnoTypesOptions.length; i++) {
                            shucaiTuihuanhuoYesnoTypesSelectSearch.add(new Option(shucaiTuihuanhuoYesnoTypesOptions[i].indexName,shucaiTuihuanhuoYesnoTypesOptions[i].codeIndex));
                    }
                }
            }
        }
                     
        function kuaidiTypesSelectSearch() {
            var kuaidiTypesSelectSearch = document.getElementById('kuaidiTypesSelectSearch');
            if(kuaidiTypesSelectSearch != null) {
                kuaidiTypesSelectSearch.add(new Option('-请选择-',''));
                if (kuaidiTypesOptions != null && kuaidiTypesOptions.length > 0){
                    for (var i = 0; i < kuaidiTypesOptions.length; i++) {
                            kuaidiTypesSelectSearch.add(new Option(kuaidiTypesOptions[i].indexName,kuaidiTypesOptions[i].codeIndex));
                    }
                }
            }
        }
            
    //查询级联表搜索条件所有列表
            function shucaiOrderTypesSelect() {
                //填充下拉框选项
                http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=shucai_order_types", "GET", {}, (res) => {
                    if(res.code == 0){
                        shucaiOrderTypesOptions = res.data.list;
                    }
                });
            }

    //查询当前表搜索条件所有列表
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










            function openYesnoTypes(id) {
                $("#shucaiTuihuanhuoYesnoTypesId").val(id)
                $('#shucaiTuihuanhuoYesnoTypesModal').modal('show');
            }

            function shucaiTuihuanhuoYesnoTypesShenhe() {
                var mymessage = confirm("真的要确定这个审核结果吗？");
                if (mymessage == true) {
                    let data = {};
                    data["id"] = $("#shucaiTuihuanhuoYesnoTypesId").val();
                    if($("#shucaiTuihuanhuoYesnoTypes option:selected").val() == 2 || $("#shucaiTuihuanhuoYesnoTypes option:selected").val() ==3){
                        data["shucaiTuihuanhuoYesnoTypes"] = $("#shucaiTuihuanhuoYesnoTypes option:selected").val();//获取选中的审核状态
                    }else{
                        alert("请选择审核状态")
                        return false;
                    }
                    data["shucaiTuihuanhuoYesnoContent"] = $("#shucaiTuihuanhuoYesnoContent").val();
                    httpJson("shucaiTuihuanhuo/shenhe", "POST", data, (res) => {
                        if(res.code == 0){
                            alert('审核成功');
                            getDataList();
                        }else{
                            alert('审核失败');
                        }
                        $('#shucaiTuihuanhuoYesnoTypesModal').modal('hide');
                        $("#shucaiTuihuanhuoYesnoTypes").val(1);
                        $("#shucaiTuihuanhuoYesnoTypesId").val(null);
                        $("#shucaiTuihuanhuoYesnoContent").val(null);
                    });
                }else {
                    $('#shucaiTuihuanhuoYesnoTypesModal').modal('hide');
                    $("#shucaiTuihuanhuoYesnoTypes").val(1);
                    $("#shucaiTuihuanhuoYesnoTypesId").val(null);
                    $("#shucaiTuihuanhuoYesnoContent").val(null);
                    alert("已取消操作");
                }
            }


            function opentuihuidanhao(id) {
                $("#opentuihuidanhaoId").val(id)
                $('#opentuihuidanhaoModal').modal('show');
            }

            function tuihuidanhao() {
                var mymessage = confirm("确定这个退回快递吗？");
                if (mymessage == true) {
                    let data = {};
                    data["id"] = $("#opentuihuidanhaoId").val();
                    let shucaiTuihuanhuoCourierName = $("#shucaiTuihuanhuoCourierName").val();
                    let shucaiTuihuanhuoCourierNumber = $("#shucaiTuihuanhuoCourierNumber").val();
                    
                    if(shucaiTuihuanhuoCourierName != null || shucaiTuihuanhuoCourierName != "" || shucaiTuihuanhuoCourierName !="null"){
                        data["shucaiTuihuanhuoCourierName"] = shucaiTuihuanhuoCourierName;
                    }else{
                        alert("请填写退回快递公司")
                        return false;
                    }
                    if(shucaiTuihuanhuoCourierNumber != null || shucaiTuihuanhuoCourierNumber != "" || shucaiTuihuanhuoCourierNumber !="null"){
                        data["shucaiTuihuanhuoCourierNumber"] = shucaiTuihuanhuoCourierNumber;
                    }else{
                        alert("请填写退回快递单号")
                        return false;
                    }

                    data["kuaidiTypes"] = 1;
                    httpJson("shucaiTuihuanhuo/update", "POST", data, (res) => {
                        if(res.code == 0){
                            alert('退回单号信息填写成功');
                            getDataList();
                        }else{
                            alert('填写失败');
                        }
                        $('#opentuihuidanhaoModal').modal('hide');
                        $("#shucaiTuihuanhuoCourierName").val(null);
                        $("#shucaiTuihuanhuoCourierNumber").val(null);
                    });
                }else {
                    $('#opentuihuidanhaoModal').modal('hide');
                    $("#shucaiTuihuanhuoCourierName").val(null);
                    $("#shucaiTuihuanhuoCourierNumber").val(null);
                    alert("已取消操作");
                }
            }
            
            
            
            

            function openshoudao(id) {
                $("#openshoudaoId").val(id)
                $('#openshoudaoModal').modal('show');
            }

            function shoudao() {
                var mymessage = confirm("确定填写完成了么？");
                if (mymessage == true) {
                    let data = {};
                    data["id"] = $("#openshoudaoId").val();
                   let shucaiHuanhuoCourierName = $("#shucaiHuanhuoCourierName").val();
                    let shucaiHuanhuoCourierNumber = $("#shucaiHuanhuoCourierNumber").val();
                    
                    if(shucaiHuanhuoCourierName != null || shucaiHuanhuoCourierName != "" || shucaiHuanhuoCourierName !="null"){
                        data["shucaiHuanhuoCourierName"] = shucaiHuanhuoCourierName;
                    }else{
                        alert("请填写换货快递公司")
                        return false;
                    }
                    if(shucaiHuanhuoCourierNumber != null || shucaiHuanhuoCourierNumber != "" || shucaiHuanhuoCourierNumber !="null"){
                        data["shucaiTuihuanhuoCourierNumber"] = shucaiHuanhuoCourierNumber;
                    }else{
                        alert("请填写换货快递单号")
                        return false;
                    }

                    data["kuaidiTypes"] = 2;
                    data["shucaiHuanhuoCourierName"] = $("#shucaiHuanhuoCourierName").val();
                    data["shucaiHuanhuoCourierNumber"] = $("#shucaiHuanhuoCourierNumber").val();
                    httpJson("shucaiTuihuanhuo/update", "POST", data, (res) => {
                        if(res.code == 0){
                            alert('成功处理');
                            getDataList();
                        }else{
                            alert('处理失败');
                        }
                        $('#openshoudaoModal').modal('hide');
                        $("#shucaiHuanhuoCourierName").val(null);
                        $("#shucaiHuanhuoCourierNumber").val(null);
                    });
                }else {
                    $('#openshoudaoModal').modal('hide');
                    $("#shucaiHuanhuoCourierName").val(null);
                    $("#shucaiHuanhuoCourierNumber").val(null);
                    alert("已取消操作");
                }
            }



//退货
        function tuihuo(id) {

            var mymessage = confirm("确定收到并检查此退货了么？");
            if (mymessage == true) {
                let data = {};
                data["id"] = id;
                data["kuaidiTypes"] = 2;
                data["shucaiHuanhuoCourierName"] = "退货无需填写快递公司";
                data["shucaiHuanhuoCourierNumber"] ="退货无需填写单号";
                httpJson("shucaiTuihuanhuo/update", "POST", data, (res) => {
                    if(res.code == 0){
                        alert('成功处理');
                        getDataList();
                    }else{
                        alert('处理失败');
                    }
                });
            }else {
                alert("已取消操作");
            }
        }

        layui.use(['layer', 'carousel', 'jquery', 'form', 'upload', 'laydate', 'rate'], function () {
            var rate = layui.rate;//评分
            var jquery = layui.jquery;//jquery
            var $=jquery;

        });


        $(document).ready(function () {
            //激活翻页按钮
            $('#tableId_previous').attr('class', 'paginate_button page-item previous')
            $('#tableId_next').attr('class', 'paginate_button page-item next')
            //隐藏原生搜索框
            $('#tableId_filter').hide()
            //设置右上角用户名
            $('.dropdown-menu h5').html(window.sessionStorage.getItem('username'))
            //设置项目名
            $('.sidebar-header h3 a').html(projectName)
            setMenu();
            init();

            //查询级联表的搜索下拉框
            shucaiOrderTypesSelect();

            //查询当前表的搜索下拉框
            tuihuanhuoTypesSelect();
            shucaiTuihuanhuoYesnoTypesSelect();
            kuaidiTypesSelect();
            getDataList();

        //级联表的下拉框赋值
                                                 
                                                                                                                                                                                                 
            shucaiOrderTypesSelectSearch();
                                                                                                                         
                                                                                                                                                                                                                        
        //当前表的下拉框赋值
                         
                                     
            tuihuanhuoTypesSelectSearch();
                                     
            shucaiTuihuanhuoYesnoTypesSelectSearch();
                                                             
            kuaidiTypesSelectSearch();
                                    
        <%@ include file="../../static/myInfo.js"%>
    });
</script>
</body>

</html>
