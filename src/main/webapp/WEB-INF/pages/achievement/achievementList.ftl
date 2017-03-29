<#import "/base/base.ftl" as base>
<#import "/base/dict.ftl" as dict>

<@base.html "业绩管理">
<link href="${ctx}/static/css/bill/KeyWordsRanking.css" rel="stylesheet">
<script src="${ctx}/static/js/achievement/achievementList.js"></script>



<div class="Navs">
    <div class="nav_L left">
        <i class="fa fa-home">&nbsp;</i><span>业绩管理</span> > <span>业绩详情</span>
    </div>
    <div class="nav_R right" id="divQx">

        <div class="Import">
            <span id="addOperator">&nbsp;<i class="fa fa-plus"></i>&nbsp;xxx</span>

        </div>
        <div class="search">
            <span>&nbsp;<i class="fa fa-search"></i>&nbsp;查询</span>
        </div>

    </div>
</div>
<div class="cls">
</div>
</div>
<div class="Navs2">

    <div class="nav_R2 right" >
        <div>
            客户ID:
        </div>
        <input name="acid" class="form-control" value="" style="width: 60px;" type="text">
    </div>
    <div class="cls">
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="panel panel-primary" id="list-panel">
            <div class="panel-body">
                <div class="panel-nav">
                    <div class="Nav_Left">&nbsp;<i class="fa fa-paper-plane"></i>&nbsp;业绩详情</div>
                    <div class="Nav_Right">
                    </div>
                    <div class="cls"></div>
                </div>

                <table id="myTable" class="table table-striped  table-condensed table-responsive" style="width:100%">
                </table>
            </div>

        </div>
    </div>
</div>

<div class="modal-backdrop in" style="display: none">
</div>


</@base.html>