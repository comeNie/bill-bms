/**
 * Created by Administrator on 2017/3/15.
 */
$(document).ready(function () {
    //提交相同价订单
    $(".samepricecmt").click(function () {


        var search= $("#searchengineid ").val();
        var keyword= $("#keyword").val();
        var url= $("#url").val();
        var rankend=$("input[name='samePricerankend']").val();
        var price=$("input[name='samePriceprice']").val();
        var rankend1=$("input[name='samePricerankend1']").val();
        var price1=$("input[name='samePriceprice1']").val();
        var rankend2=$("input[name='samePricerankend2']").val();
        var price2=$("input[name='samePriceprice2']").val();
        var rankend3=$("input[name='samePricerankend3']").val();
        var price3=$("input[name='samePriceprice3']").val();

        if (!isNaN(rankend) && !isNaN(rankend1) && !isNaN(rankend2) && !isNaN(rankend3)
            && !isNaN(price) && !isNaN(price1) && !isNaN(price2) && !isNaN(price3)
            && rankend > 0 && rankend1 > rankend && rankend2 > rankend1 && rankend3 > rankend2 && 51 > rankend3
            && 1000 > price && price > price1 && price1 > price2 && price2 > price3 && price3 > 0
            ||
            !isNaN(rankend) && !isNaN(rankend1) && !isNaN(rankend2) && isNaN(rankend3)
            && !isNaN(price) && !isNaN(price1) && !isNaN(price2) && isNaN(price3)
            && rankend > 0 && rankend1 > rankend && rankend2 > rankend1 && 51 > rankend2
            && 1000 > price && price > price1 && price1 > price2 && price2 > 0
            ||
            !isNaN(rankend) && !isNaN(rankend1) && isNaN(rankend2) && isNaN(rankend3)
            && !isNaN(price) && !isNaN(price1) && isNaN(price2) && isNaN(price3)
            && rankend > 0 && rankend1 > rankend && 51 > rankend1
            && 1000 > price && price > price1 && price1 > 0
            ||
            !isNaN(rankend) && isNaN(rankend1) && isNaN(rankend2) && isNaN(rankend3)
            && !isNaN(price) && isNaN(price1) && isNaN(price2) && isNaN(price3)
            && rankend > 0 && 51 > rankend
            && 1000 > price && price > 0
        )
        {
            if(search==""||keyword==""||url=="")
            {
                alert("请将信息填写完整！");
            }
            else
            {
               var keyword_arr=$.trim(keyword).split('\n');
                var url_arr=$.trim(url).split('\n');
                if(keyword_arr.length>1&&keyword_arr.length!=url_arr.length)
                {
                    alert("网址行数为1或者与关键词一一对应");
                }
                else
                {
                    $.ajax({
                        type:"get",
                        url:CTX+"/bill/list/sameprice",
                        dataType:'json',
                        contentType: "application/x-www-form-urlencoded; charset=utf-8",
                        data:{
                            search:search,
                            keyword:keyword,
                            url:url,
                            rankend:rankend,
                            price:price,
                            rankend1:rankend1,
                            price1:price1,
                            rankend2:rankend2,
                            price2:price2,
                            rankend3:rankend3,
                            price3:price3


                        },
                        beforeSend: function () {
                            $("#pload").show();
                        },

                        success:function (result) {
                            if(result.code==200)
                            {
                                if(result.message=="")
                                {
                                    alert("导入成功!");
                                    $("#pload").hide();
                                    $(".samepriceDiv").slideUp();
                                    $('#myTable').bootstrapTable('refresh');
                                }
                                else
                                {
                                    $("#pload").hide();
                                    alert(result.message+" 已经存在!");
                                }
                            }
                            else
                            {
                                $("#pload").hide();
                                alert("系统繁忙，请稍后再试！");
                            }
                        }

                    })
                }

            }


        }
        else
        {
           alert("前N名依次增大，并且值介于1-50之间，收费依次减小，并且值大于0小于1000；前N名和收费必须同时提供");

        }





    })
})