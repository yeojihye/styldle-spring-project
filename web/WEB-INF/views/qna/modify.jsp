<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<html>
<head>
    <title>Styldle</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="/resources/images/icons/favicon.png"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/fonts/iconic/css/material-design-iconic-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/fonts/linearicons-v1.0.0/icon-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/vendor/animsition/css/animsition.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/vendor/daterangepicker/daterangepicker.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/vendor/slick/slick.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/vendor/MagnificPopup/magnific-popup.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/vendor/perfect-scrollbar/perfect-scrollbar.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/css/util.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/main.css">
    <!--===============================================================================================-->
</head>
<style>
    .bigPictureWrapper {
        position: absolute;
        display: none;
        justify-content: center;
        align-items: center;
        top: 0%;
        width: 100%;
        height: 100%;
        z-index: 100;
        background: rgba(255, 255, 255, 0.5);
    }
    .bigPicture {
        position: relative;
        display: flex;  /*????????? ????????? ??????*/
        justify-content: center;  /*????????? ??????*/
        align-items: center;
    }
    .bigPicture img {
        width: 600px;
    }
    .outter {
        margin: 0 auto;
        text-align: center;
    }
</style>
<script>
    function getHTML() {
        var str = document.getElementById('textarea').value;
        str = str.replaceAll(/(?:\r\n|\r|\n)/g, "<br />");
        document.getElementById('textarea').value = str;
    }
</script>

<body class="animsition" style="animation-duration: 1500ms; opacity: 1;">
<%@include file ="/WEB-INF/views/includes/header.jsp" %>
<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('/resources/images/bg-02.jpg');">
    <h2 class="ltext-105 cl0 txt-center">
        Q&A
    </h2>
</section>
<section class="bg0 p-t-104 p-b-116">
    <div class="container">
        <div class="flex-w flex-tr">
            <div class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md outter">
                <form role="form" action="/qna/modify" method="post">
                    <h4 class="mtext-105 cl2 txt-center p-b-30">
                        ??? ??????
                    </h4>
                    <div class="bor8 m-b-20 how-pos4-parent">
                        <input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="text" name="boardNo" value="${board.boardNo}" readonly>
                    </div>
                    <div class="bor8 m-b-20 how-pos4-parent">
                        <input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="text" name="userId" value="????????? ${board.userId}" readonly>
                    </div>
                    <div class="bor8 m-b-20 how-pos4-parent">
                        <input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="text" name="userId" value="????????? ${board.regDate}" readonly>
                    </div>
                    <div class="bor8 m-b-20 how-pos4-parent">
                        <input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="text" name="userId" value="????????? ${board.cnt}" readonly>
                    </div>
                    <div class="bor8 m-b-20 how-pos4-parent">
                        <input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="text" name="title" value="${board.title}">
                        <img class="how-pos4 pointer-none" src="/resources/images/icons/icon-email.png" alt="ICON">
                    </div>
                    <div class="bor8 m-b-30">
                        <textarea class="stext-111 cl2 plh3 size-120 p-lr-28 p-tb-25" name="content" id="textarea">${board.content}</textarea>
                    </div>
                    <div class="bor8 m-b-20 how-pos4-parent">
                        <div class="panel-heading">Files</div>
                        <div class="panel-body">
                            <div class="form-group uploadDiv">
                                <input type="file" name="uploadFile" multiple>
                            </div>
                            <div class="uploadResult">
                                <ul>

                                </ul>
                            </div>
                        </div>
                    </div>
                    <button class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer" id="btnUpdate" type="submit">??????</button></br>
                    <button class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer" id="btnCancel" type="button">??????</button>
                    <input type="hidden" id="pageNum" value="<c:out value="${cri.pageNum}"/>">
                    <input type="hidden" id="amount" value="<c:out value="${cri.amount}"/>">
                    <input type="hidden" id="type" value="<c:out value="${cri.type}"/>">
                    <input type="hidden" id="keyword" value="<c:out value="${cri.keyword}"/>">
                </form>
            </div>
        </div>
    </div>
</section>
<div class="bigPictureWrapper">
    <div class="bigpicture">
    </div>
</div>
<%--footer--%>
<%@include file ="/WEB-INF/views/includes/footer.jsp" %>
</body>

<!--===============================================================================================-->
<script src="/resources/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="/resources/vendor/bootstrap/js/popper.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="/resources/vendor/select2/select2.min.js"></script>
<script>
    $(".js-select2").each(function () {
        $(this).select2({
            minimumResultsForSearch: 20,
            dropdownParent: $(this).next('.dropDownSelect2')
        });
    })
</script>

<script>
    $(document).ready(function (e){
        (function (){
            var boardNo = ${board.boardNo};
            $.getJSON("/qna/getAttachList", {boardNo}, function (arr){
                console.log(arr);
                var str ="";

                $(arr).each(function (i,attach){
                    console.log("attach: ",attach);
                    //imageType
                    if(attach){
                        console.log("?????????????")
                        var fileCallPath = encodeURIComponent(attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
                        str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='image'><div>";
                        str += "<span>"+attach.fileName+"</span>";
                        str += "<button type='button' data-file=\'"+fileCallPath+"\'data-type='image' class= 'btn btn-warning btn-circle'>X</button>";
                        str += "<img src='/display?fileName="+fileCallPath+"'>";
                        str += "</div></li>";
                    }
                })
                $(".uploadResult ul").html(str);
            }) //end getJSON
        })(); //end function()

        $(".uploadResult").on("click", "button",function (e){
            console.log("delete file");
            if(confirm("????????? ?????????????????????????")){
                var targetLi = $(this).closest("li");
                targetLi.remove();
            }
        })
        var regex = new RegExp("(.*?)\.(jpg|gif|png|jpeg|bmp)$");
        var maxSize = 5242880; //5MB

        function checkExtension(fileName, fileSize){
            if(fileSize >= maxSize){
                alert("?????? ????????? ??????");
                return false;
            }
            if(!regex.test(fileName)){
                alert("?????? ????????? ????????? ???????????? ??? ????????????.");
                return false;
            }
            return true;
        }


        $("input[type='file']").change(function (e){
            var formData = new FormData();
            var inputFile = $("input[name='uploadFile']");
            var files =inputFile[0].files;
            console.log("files",files);

            //formData??? fileDate ??????
            for(var i=0; i<files.length; i++){
                if(!checkExtension(files[i].name, files[i].size)){
                    return false;
                }
                formData.append("uploadFile",files[i]);
            }
            $.ajax({
                url: '/QnaUploadAjaxAction',
                processData: false,
                contentType: false,
                data: formData,
                type: 'POST',
                dataType:'json',
                success: function (result){
                    alert("????????? ???????????????.");
                    console.log(result);
                    showUploadResult(result);

                }
            }) //$.ajax
        })
        function showUploadResult(uploadResultArr){
            if(!uploadResultArr || uploadResultArr.length == 0){return;}
            var uploadUL = $(".uploadResult ul");
            var str = "";

            $(uploadResultArr).each(function (i, obj){
                //image Type
                if (obj.image){
                    var fileCallPath = encodeURIComponent(obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);

                    str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'><div>";
                    str += "<span>" +obj.fileName +"</span>";
                    str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning '> X </button><br>";
                    str += "<img src='/display?fileName="+fileCallPath+"'>";
                    str += "</div></li>";
                }
            })
            uploadUL.append(str);
        }

        var formObj = $("form[role='form']");

        $("button[type='submit']").on("click",function (e){
            e.preventDefault();
            console.log("submit ??????");
            var str="";
            $(".uploadResult ul li").each(function (i,obj){
                var jobj = $(obj);
                console.dir(jobj);
                str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
                str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
                str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
                str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
            })
            formObj.append(str).submit();
            alert("???????????? ?????????????????????.")
        })
        // pageNum, amount, type, keyword ????????? list??? ??????
        $('#btnCancel').click(function (e){
            location.href="/qna/list?pageNum=${cri.pageNum}&amount=${cri.amount}&type=${cri.type}&keyword=${cri.keyword}";
        })
        $("h2").on("click",function (e){
            location.href="/qna/list";
        })
    })
</script>

<!--===============================================================================================-->
<script src="/resources/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<!--===============================================================================================-->
<script src="/resources/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script>
    $('.js-pscroll').each(function () {
        $(this).css('position', 'relative');
        $(this).css('overflow', 'hidden');
        var ps = new PerfectScrollbar(this, {
            wheelSpeed: 1,
            scrollingThreshold: 1000,
            wheelPropagation: false,
        });

        $(window).on('resize', function () {
            ps.update();
        })
    });
</script>
<!--===============================================================================================-->
<script src="/resources/js/main.js"></script>

</body>
</html>