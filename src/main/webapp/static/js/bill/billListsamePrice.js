//提交相同价订单
$(".samepricecmt").click(function () {


    var search= $("#searchengineid option:selected").text();
    var keyword= $.trim($("#keyword").val());
    var url=$.trim($("#url").val());


    var rankend = parseInt($.trim(jQuery("input[name='samePricerankend']").val()));
    var price = parseFloat($.trim(jQuery("input[name='samePriceprice']").val()));
    var rankend1 = parseInt($.trim(jQuery("input[name='samePricerankend1']").val()));
    var price1 = parseFloat($.trim(jQuery("input[name='samePriceprice1']").val()));
    var rankend2 = parseInt($.trim(jQuery("input[name='samePricerankend2']").val()));
    var price2 = parseFloat($.trim(jQuery("input[name='samePriceprice2']").val()));
    var rankend3 = parseInt($.trim(jQuery("input[name='samePricerankend3']").val()));
    var price3 = parseFloat($.trim(jQuery("input[name='samePriceprice3']").val()));
    var customerIds=$("#sameSelect  option:selected").val();

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
        if(search==""||keyword==""||url==""||customerIds=="0")
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
                var Arankend = $("input[name='samePricerankend']").val();
                var Aprice = $("input[name='samePriceprice']").val();
                var Arankend1 = $("input[name='samePricerankend1']").val();
                var Aprice1 = $("input[name='samePriceprice1']").val();
                var Arankend2 = $("input[name='samePricerankend2']").val();
                var Aprice2 = $("input[name='samePriceprice2']").val();
                var Arankend3 =$("input[name='samePricerankend3']").val();
                var Aprice3 = $("input[name='samePriceprice3']").val();
                var customerId=$("#sameSelect  option:selected").val();
                $.ajax({
                    type:"post",
                    url:CTX+"/order/list/sameprice",
                    dataType:'json',
                    contentType: "application/x-www-form-urlencoded; charset=utf-8",
                    data:{
                        search:search,
                        keyword:keyword,
                        url:url,
                        rankend:Arankend,
                        price:Aprice,
                        rankend1:Arankend1,
                        price1:Aprice1,
                        rankend2:Arankend2,
                        price2:Aprice2,
                        rankend3:Arankend3,
                        price3:Aprice3,
                        customerId:customerId

                    },
                    beforeSend: function () {
                        $(".pload").show();
                        $('.samepricecmt').attr('disabled',"true");
                    },

                    success:function (result) {
                        $(".pload").hide();
                        if(result.code==200)
                        {

                            if(result.message=="")
                            {
                                alert("导入成功!");
                                $(".modal-backdrop").hide();
                                $(".samepriceDiv").slideUp();
                                $('#myTable').bootstrapTable('refresh');
                                $("#keyword").val("");
                                $("#url").val("");
                               jQuery("input[name='samePricerankend']").val("");
                                jQuery("input[name='samePriceprice']").val("");
                               jQuery("input[name='samePricerankend1']").val("");
                                jQuery("input[name='samePriceprice1']").val("");
                               jQuery("input[name='samePricerankend2']").val("");
                                jQuery("input[name='samePriceprice2']").val("");
                                jQuery("input[name='samePricerankend3']").val("");
                               jQuery("input[name='samePriceprice3']").val("");
                                $("#searchengineid").val("0");
                                $("#sameSelect").val("0");
                                $('.samepricecmt').removeAttr("disabled");

                            }
                            else
                            {

                                alert(result.message+" !");
                                $('.samepricecmt').removeAttr("disabled");
                            }
                        }
                        else
                        {

                            alert("系统繁忙，请稍后再试！");
                            $('.samepricecmt').removeAttr("disabled");
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