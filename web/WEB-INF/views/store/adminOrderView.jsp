<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="com.styldle.vo.UserVO" %>
<html>
<head>
    <title>Styldle - admin</title>
    <style>
        .orderInfo {
            border:5px solid #eee;
            padding:10px 20px;
            margin:20px 0;
            margin-right: 30px;
            margin-left: 30px;
        }
        .orderInfo span {
            font-size:20px;
            font-weight:bold;
            display:inline-block;
            width:90px;
        }

        .orderView li {
            margin-bottom:20px;
            padding-bottom:20px;
            border-bottom:1px solid #999;
        }
        .orderView li::after {
            content:"";
            display:block;
            clear:both;
        }

        #procImg {
            float:left;
            width:200px;
        }
        #procImg img {
            width:200px;
            height:200px;
        }
        .productInfo {
            float:right;
            width:calc(100% - 220px);
            line-height:2;
        }
        .productInfo span {
            font-size:20px;
            font-weight:bold;
            display:inline-block;
            width:100px;
            margin-right:10px;
        }

        .deliveryChange {
            text-align:right;
        }
        .delivery1_btn,
        .delivery2_btn {
            font-size:16px;
            background:#fff;
            border:1px solid #999;
            margin-left:10px;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <link rel="icon" type="image/png" href="/resources/images/icons/favicon_modify.png"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
</head>
<body class="animsition" style="animation-duration: 1500ms; opacity: 1;">

    <c:if test="${userVO.role != 'admin'}">
        <script>
            alert("????????? ???????????????.");
            history.back();
        </script>
    </c:if>

    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">STYLDLE ?????????</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse show" id="navbarColor01" style="">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/store/register">?????? ??????</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/store/adminList">?????? ??????</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="/store/adminOrderList">?????? ??????</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/store/list">?????? ??????</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <section id="container">
        <div id="container_box">
            <div class="orderInfo">
                <c:forEach items="${orderView}" var="i" varStatus="status">

                    <c:if test="${status.first}">
                        <p><span>?????????</span>${i.userId}</p>
                        <p><span>?????????</span>${i.orderRec}</p>
                        <p><span>????????????</span>${i.orderPhone}</p>
                        <p><span>??????</span>(${i.postCode}) ${i.roadAddress} ${i.detailAddress}</p>
                        <p><span>??????</span><fmt:formatNumber pattern="###,###,###" value="${i.total}" /> ???</p>
                        <p><span>????????????</span>${i.delivery}</p>

                        <div class="deliveryChange">
                            <form role="form" action="/store/adminOrderView" method="post" class="deliveryForm">
                                <input type="hidden" name="orderId" value="${i.orderId}" />
                                <input type="hidden" name="delivery" class="delivery" value="" />

                                <button type="button" class="delivery1_btn">?????????</button>
                                <button type="button" class="delivery2_btn">????????????</button>
                            </form>
                        </div>
                    </c:if>

                </c:forEach>
            </div>

            <ul class="orderView">
                <c:forEach items="${orderView}" var="i">
                    <li>
                        <div class="uploadOneImg${i.productId}" id="procImg">

                        </div>
                        <div class="productInfo">
                            <p>
                                <span>?????????</span>${i.productName}<br />
                                <span>?????? ??????</span><fmt:formatNumber pattern="###,###,###" value="${i.price}" /> ???<br />
                                <span>?????? ??????</span>${i.count} ???<br />
                                <span>?????? ??????</span><fmt:formatNumber pattern="###,###,###" value="${i.price * i.count}" /> ???
                            </p>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </section>
    <form action="/store/adminOrderList" method="get">
        <input type="hidden" name="page" value="${cri.page}">
        <input type="hidden" name="perPageNum" value="${cri.perPageNum}">
    </form>

    <script type="text/javascript">
        $(document).ready(function() {
            var string = ''
            <c:forEach items="${orderView}" var="i">
                var productId = ${i.productId}
                $.getJSON("/store/getAttachList", {productId: productId}, function (arr) {
                    var str = ''
                    console.log(arr[0])
                    var fileCallPath = encodeURIComponent(arr[0].uploadPath+'/'+arr[0].uuid+'_'+arr[0].fileName)
                    str += "<img src='/display?fileName="+fileCallPath+"'>"
                    console.log(fileCallPath)
                    $('.uploadOneImg${i.productId}').html(str)
                })
            </c:forEach>

            $(".delivery1_btn").click(function(){
                $(".delivery").val("?????????");
                $(".deliveryForm").submit();
            });

            $(".delivery2_btn").click(function(){
                $(".delivery").val("????????????");
                $(".deliveryForm").submit();
            });

            var formObj = $('form')
            $("button[data-oper='list']").click(function(e) {
                formObj.attr('action', '/store/adminOrderList')
                formObj.submit()
            })
        })
    </script>
</body>
</html>
