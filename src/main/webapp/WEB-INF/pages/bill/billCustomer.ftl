<#import "/base/base.ftl" as base>
<#import "/base/dict.ftl" as dict>

<@base.html "关键词优化">
<link href="${ctx}/static/css/bill/KeyWordsRanking.css" rel="stylesheet">
<script src="${ctx}/static/js/public/pace.js"></script>
<script src="${ctx}/static/js/bill/billCustomer.js"></script>
<script src="${ctx}/static/js/bill/billListchangePrice.js"></script>
<script src="${ctx}/static/js/bill/billListsamePrice.js"></script>
<script src="${ctx}/static/js/bill/billDiffrentPrice.js"></script>
<div class="Navs">
    <div class="nav_L left">
        <i class="fa fa-home">&nbsp;</i><span>优化管理</span> > <span>关键词排名</span>
    </div>
    <div class="nav_R right" id="divQx">

            <div class="Import">
                <span id="Import">&nbsp;<i class="fa fa-arrow-down"></i>&nbsp;导入</span>
                <ul class="ImportPrice">
                    <li id="Sameprice">相同价导入</li>
                    <li id="Differentprice">不同价导入</li>
                </ul>
            </div>
        <div id="btn_update">
            <span >&nbsp;<i class="fa fa-paint-brush"></i>&nbsp;调价</span>
        </div>
        <div class="search">
            <span>&nbsp;<i class="fa fa-search"></i>&nbsp;查询</span>
        </div>

    </div>
    <div class="cls">
    </div>
</div>
<div class="Navs2">

    <div class="nav_R2 right" >
        <div>
            网址:
        </div>
        <input id="website" name="userName" class="form-control" value="" style="width: 150px;" type="text">
        <div>
            关键词:
        </div>
        <input id="keywords" name="keywords" class="form-control" value="" style="width: 150px;" type="text">
        <span style="font-size:13px;text-align:center;cursor:pointer;font-weight:bold;margin-left: 10px;">
        搜索引擎:
        </span>
        <select style="height: 35px;border: 1px solid #aaaaaa;" id="searchName">
            <@dict.showOptions dictKey="search" dictType="DICT" haveBlank="Y" />
        </select>
                <span style="font-size:13px;text-align:center;cursor:pointer;font-weight:bold;margin-left: 10px;">客户:</span>

                <select style="height: 35px;border: 1px solid #aaaaaa;" id="searchUserName">
                    <option>--请选择--</option>
                    <#list userList as user>
                        <option value="${user.id}">${user.userName}</option>
                    </#list>
                </select>
        <span style="font-size:13px;text-align:center;cursor:pointer;font-weight:bold;margin-left: 10px;">
               今日达标:
        </span>
        <select style="height: 35px;border: 1px solid #aaaaaa;" id="searchStandard">
            <option>--请选择--</option>
            <option value="1">是</option>
            <option value="0">否</option>
        </select>
        <span style="font-size:13px;text-align:center;cursor:pointer;font-weight:bold;margin-left: 10px;" id="state">
            状态:
        </span>
        <select style="height: 35px;border: none;border: 1px solid #aaaaaa;"  id="searchState">
            <option value="1">--请选择--</option>
            <option value="2">优化中</option>
            <option value="3">合作停</option>

        </select>
        <input type="hidden" value="2" id="searchStatechange">
        <span id="searchButton">查询</span>
    </div>

    <div class="cls">
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="panel panel-primary" id="list-panel">
            <div class="panel-body">
                <div class="panel-nav">
                    <div class="Nav_Left">&nbsp;<i class="fa fa-paper-plane"></i>&nbsp;关键词排名</div>
                    <div class="Nav_Right">
                        <div id="continue">优化中</div>
                        <div id="stop">合作停</div>
                        <div id="all">全部</div>
                    </div>
                    <div class="cls"></div>
                </div>

                <table id="myTable" class="table table-striped  table-condensed table-responsive" style="width:100%;font-size: 13px;font-family: "微软雅黑">
                </table>
            </div>

        </div>
    </div>
</div>
<!--相同价导入-->
<div class="bootbox modal in samepriceDiv" tabindex="-1" role="dialog" style="display: none;" aria-hidden="false">
    <div class="dv1">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="bootbox-close-button close">×</button>
                <h4 class="modal-title">相同价导入</h4>
            </div>
            <div class="modal-body" style="max-height: 574px; border-bottom: 1px solid #eee;">
                <div class="bootbox-body">
                    <style type="text/css">
                        .dv1{
                            width: 960px;
                        }
                    </style>
                    <form class="form-horizontal row-border" id="edt-form" action="#" novalidate="novalidate">
                        <div class="form-group hidden">
                            <div class="progress progress-striped active">
                                <span id="success_span" data-count="0" class="progress-bar progress-bar-success" style="width: 0%; text-align: center; color: black;" title=""></span>
                                <span id="failed_span" data-count="0" class="progress-bar progress-bar-warning" style="width: 0%; text-align: center; color: black;" title=""></span>
                            </div>
                        </div>
                        <div class="form-group" style="border-bottom: 1px solid #eee;padding-bottom: 3px">
                            <label class="col-md-2 control-label padding-right-0px">
                                搜索引擎
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-2 padding-right-0px padding-left-5px input-width-small">
                                <select id="searchengineid" name="searchengineid" class="form-control input-width-small">
                                    <@dict.showOptions dictKey="search" dictType="DICT" haveBlank="Y" />
                                </select>
                            </div>
                            <label class="col-md-2 control-label padding-right-0px">
                                客户：
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-2 padding-right-0px padding-left-5px input-width-small">
                                <select id="sameSelect" name="searchengineid" class="form-control input-width-small">
                                    <option value="0">--请选择--</option>
                                    <#list userList as user>
                                       <option value="${user.id}">${user.userName}</option>

                                    </#list>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-1 control-label padding-right-0px">
                                关键词*
                            </label>
                            <div class="col-md-4 padding-left-5px">
                                <textarea name="keyword" id="keyword" rows="15" class="form-control"  style="width: 296px; height: 297px;resize: none;"></textarea>
                            </div>
                            <div class="pload" style="position:absolute;top:45%;left: 50%; z-index:2200;background:url('${ctx}/static/img/load3.gif') top center no-repeat;width:40px;height:40px;margin:auto auto;display: none;"></div>

                            <label class="col-md-1 control-label padding-right-0px">
                                网址
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-6 padding-left-5px">
                                <textarea name="url" id="url" rows="15" class="form-control"   style=" height: 297px;resize: none;"></textarea>
                            </div>
                        </div>
                        <div class="alert alert-info fade in">
                            录入价格的时候请按对应的顺序录入，请谨慎录入。顺序（排名1，价格1，排名2，价格2,......）
                        </div>
                        <div class="form-group" style="margin-top:30px;">
                            <label class="col-md-1 control-label padding-right-0px padding-left-0px" style="width: 78px;">
                                前
                                <span class="red">N</span>名<span class="required">*</span>
                            </label>
                            <div class="" style="width: 35px;float: left;">
                                <input name="samePricerankend"   style="width: 35px;">
                            </div>

                            <label class="col-md-1 control-label padding-right-0px padding-left-0px" style="width: 68px;">
                                <span>元/天</span><span class="required">*</span>
                            </label>
                            <div class="" style="width: 35px;float: left;">
                                <input name="samePriceprice"   style="width: 35px;">
                            </div>
                            <label class="col-md-1 control-label padding-right-0px padding-left-0px" style="width: 78px;">
                                前
                                <span class="red">N</span>名
                            </label>
                            <div class="" style="width: 35px;float: left;">
                                <input name="samePricerankend1"   style="width: 35px;">
                            </div>

                            <label class="col-md-1 control-label padding-right-0px padding-left-0px" style="width: 68px;">
                                <span>元/天</span>
                            </label>
                            <div class="" style="width: 35px;float: left;">
                                <input name="samePriceprice1"   style="width: 35px;">
                            </div>
                            <label class="col-md-1 control-label padding-right-0px padding-left-0px" style="width: 78px;">
                                前
                                <span class="red">N</span>名
                            </label>
                            <div class="" style="width: 35px;float: left;">
                                <input name="samePricerankend2"  style="width: 35px;">
                            </div>

                            <label class="col-md-1 control-label padding-right-0px padding-left-0px" style="width: 68px;">
                                <span>元/天</span><span class="required">*</span>
                            </label>
                            <div class="" style="width: 35px;float: left;">
                                <input name="samePriceprice2"   style="width: 35px;">
                            </div>
                            <label class="col-md-1 control-label padding-right-0px padding-left-0px" style="width: 78px;">
                                前
                                <span class="red">N</span>名
                            </label>
                            <div class="" style="width: 35px;float: left;">
                                <input name="samePricerankend3"   style="width: 35px;">
                            </div>

                            <label class="col-md-1 control-label padding-right-0px padding-left-0px" style="width: 68px;">
                                <span>元/天</span>
                            </label>
                            <div class="" style="width: 35px;float: left;">
                                <input name="samePriceprice3"   style="width: 35px;">
                            </div>

                        </div>
                    </form>
                </div>
            </div>


            <div class="modal-footer">
                <button data-bb-handler="success" type="button" class="btn wzgj-blue samepricecmt" style="background: #09C;color: #fff;">确定</button>
                <button data-bb-handler="cancel" type="button" class="btn wzgj-btn cancel">取消</button>
            </div>
        </div>
    </div>
</div>
<!--相同价导入end-->

<!--不同价导入-->
<div class="bootbox modal in differentpriceDiv" tabindex="-1" role="dialog" style="display: none;" aria-hidden="false">
    <div class="dv1">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="bootbox-close-button close">×</button>
                <h4 class="modal-title">不同价导入</h4>
            </div>
            <div class="modal-body" style="max-height: 508px;">
                <div class="bootbox-body">
                    <style type="text/css">
                        .dv1 {
                            width: 960px;
                        }
                    </style>
                    <form class="form-horizontal row-border" id="edt-form" action="#" novalidate="novalidate">
                        <div class="form-group hidden">
                            <div class="progress progress-striped active">
                                <span id="success_span" data-count="0" class="progress-bar progress-bar-success" style="width: 0%; text-align: center; color: black;" title=""></span>
                                <span id="failed_span" data-count="0" class="progress-bar progress-bar-warning" style="width: 0%; text-align: center; color: black;" title=""></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label padding-right-0px">
                                搜索引擎
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-2 padding-right-0px padding-left-5px input-width-small">
                                <select id="dfsearch" name="searchengineid" class="form-control input-width-small" style="width:120px;">
                                    <@dict.showOptions dictKey="search" dictType="DICT" haveBlank="Y" />
                                </select>
                            </div>
                            <label class="col-md-1 control-label padding-right-0px">
                                客户：
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-2 padding-right-0px padding-left-5px input-width-small">
                                <select id="selectDiffrent" name="searchengineid" class="form-control input-width-small">
                                    <option value="0">--请选择--</option>
                                    <#list userList as user>
                                        <option value="${user.id}">${user.userName}</option>
                                    </#list>
                                </select>
                            </div>

                            <label class="col-md-1 control-label padding-right-0px">
                                前
                                <span class="red">N</span>名<span class="required">*</span>
                            </label>
                            <div class="col-md-2 padding-right-0px padding-left-5px" style="width: 190px">
                                <input name="rankend" class="form-control input-width-middle" type="text" id="dfrankend">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-1 control-label padding-right-0px">
                                关键词*
                                <span class="required"></span>
                            </label>
                            <div class="col-md-3 padding-left-5px">
                                <textarea name="keyword" rows="15" class="form-control" style="resize: none;" id="dfkeyword"></textarea>
                            </div>
                            <div class="pload" style="position:absolute;top:45%;left: 50%; z-index:2200;background:url('${ctx}/static/img/load3.gif') top center no-repeat;width:40px;height:40px;margin:auto auto;display: none    ;"></div>

                            <label class="col-md-1 control-label padding-right-0px">
                                网址
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-5 padding-left-5px">
                                <textarea name="url" rows="15" class="form-control" style="resize: none;" id="dfurl"></textarea>
                            </div>
                            <label class="col-md-1 control-label padding-right-0px">
                                元/天
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-1 padding-left-5px">
                                <textarea name="price" rows="15" class="form-control" style="resize: none;" id="dfprice"></textarea>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <div class="modal-footer">
                <button data-bb-handler="success" type="button" class="btn wzgj-blue dfpricecmt" style="background: #09C;color: #fff;">确定</button>
                <button data-bb-handler="cancel" type="button" class="btn wzgj-btn cancel">取消</button>
            </div>
        </div>
    </div>
</div>
<!--不同价导入end-->
<!--详情-->

<div class="modal-backdrop in" style="display: none">
</div>
<div class="bootbox modal in" tabindex="-1" role="dialog" style="display: none;" aria-hidden="false" id="billCostDetail">
    <div class="modal-dialog listdetails">
        <div class="modal-content">
            <div class="modal-body" style="max-height: 374px;">
                <button type="button" class="bootbox-close-button close" style="margin-top: -10px;">×</button>
                <div class="bootbox-body">
                    <style type="text/css">
                        .listdetails {
                            width: 800px;
                        }
                    </style>
                    <div class="row" style="margin-top: -5px;">
                        <div class="col-md-12">
                            <label>价格配置</label>
                            <table class="table table-hover table-striped table-bordered" >
                                <thead>
                                <tr>
                                    <th style="width: 100px;">达标位置
                                    </th>
                                    <th>收费标准<span>(元/天)</span>
                                    </th>
                                </tr>
                                </thead>
                                <tbody id="detailTable">


                                </tbody>
                            </table>
                            <label>任务消费记录</label>
                            <div class="widget box">
                                <div class="widget-header">

                                </div>
                                <div class="widget-content">
                                    <table id="pricetable"  class="table table-striped  table-condensed table-responsive" >
                                    </table>
                                    <div class="row">
                                        <div class="table-footer">
                                            <div class="col-md-6">
                                                <div class="dataTables_paginate paging_bootstrap" style="float:left;">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="dataTables_paginate paging_bootstrap">

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <input name="Bid" value="" type="hidden">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button data-bb-handler="cancel" type="button" class="btn wzgj-blue cancel">关闭</button>
            </div>
        </div>
    </div>
</div>

 <div class="bootbox modal in billExamineDiv" tabindex="-1" role="dialog" style="display: none;" aria-hidden="false">
        <div class="modal-dialog" style="width: 990px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="bootbox-close-button close">×</button>
                    <h4 class="modal-title">调价</h4>
                </div>
                <div class="modal-body" style="max-height: 574px;">
                    <div class="bootbox-body">
                        <style type="text/css">
                            .modal-dialog {
                                width: 990px;
                            }
                        </style>
                        <div>
                            <div class="alert alert-info fade in">
                                录入价格的时候请按对应的顺序录入，请谨慎录入。顺序（排名1，价格1，排名2，价格2,......）
                            </div>
                            <div class="form-group" style="height:30px;">
                            <div class="form-group" style="margin-top:30px;">
                                <label class="col-md-1 control-label padding-right-0px padding-left-0px" style="width: 82px;">
                                    前
                                    <span class="red">N</span>名<span class="required">*</span>
                                </label>
                                <div class="" style="width: 35px;float: left;">
                                    <input name="updaterankend"   style="width: 35px;">
                                </div>

                                <label class="col-md-1 control-label padding-right-0px padding-left-0px" style="width: 82px;">
                                    <span>元/天</span><span class="required">*</span>
                                </label>
                                <div class="" style="width: 35px;float: left;">
                                    <input name="updateprice"   style="width: 35px;">
                                </div>
                                <label class="col-md-1 control-label padding-right-0px padding-left-0px" style="width: 78px;">
                                    前
                                    <span class="red">N</span>名
                                </label>
                                <div class="" style="width: 35px;float: left;">
                                    <input name="updaterankend1"   style="width: 35px;">
                                </div>

                                <label class="col-md-1 control-label padding-right-0px padding-left-0px" style="width: 68px;">
                                    <span>元/天</span>
                                </label>
                                <div class="" style="width: 35px;float: left;">
                                    <input name="updateprice1"   style="width: 35px;">
                                </div>
                                <label class="col-md-1 control-label padding-right-0px padding-left-0px" style="width: 78px;">
                                    前
                                    <span class="red">N</span>名
                                </label>
                                <div class="" style="width: 35px;float: left;">
                                    <input name="updaterankend2"  style="width: 35px;">
                                </div>

                                <label class="col-md-1 control-label padding-right-0px padding-left-0px" style="width: 68px;">
                                    <span>元/天</span><span class="required"></span>
                                </label>
                                <div class="" style="width: 35px;float: left;">
                                    <input name="updateprice2"   style="width: 35px;">
                                </div>
                                <label class="col-md-1 control-label padding-right-0px padding-left-0px" style="width: 78px;">
                                    前
                                    <span class="red">N</span>名
                                </label>
                                <div class="" style="width: 35px;float: left;">
                                    <input name="updaterankend3"   style="width: 35px;">
                                </div>

                                <label class="col-md-1 control-label padding-right-0px padding-left-0px" style="width:68px;">
                                    <span>元/天</span>
                                </label>
                                <div class="" style="width: 35px;float: left;">
                                    <input name="updateprice3"   style="width: 35px;">
                                </div>
                            </div>

                        </div>
                    </div>

                </div>

            </div>
                <div class="modal-footer" style="height:70px;">
                    <button data-bb-handler="success" type="button" class="btn wzgj-blue updatePricecmt" style="background: #09C;color: #fff;">确定</button>
                    <button data-bb-handler="cancel" type="button" class="btn wzgj-btn cancel">取消</button>
                </div>
        </div>
<!--详情end-->
</@base.html>