<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Styldle - upload</title>
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="/resources/images/icons/favicon_modify.png"/>
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
    <link rel="stylesheet" type="text/css" href="/resources/vendor/perfect-scrollbar/perfect-scrollbar.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/css/util.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/main.css">
    <!--===============================================================================================-->
</head>
<body class="animsition">
<%--<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>--%>
<style>
    #uploadResult img {
        width: 100px;
        height: 100px;
        background-size: contain;
        object-fit: cover;
    }
    #uploadResult i {
        cursor: pointer;
        position: absolute;
        top: 2px;
        left: 208px;
    }
    #removeTag {
        color: #808080;
    }
    #tagList li {
        word-break: break-all;
    }
    label {
        cursor: pointer;
    }
</style>
<c:if test="${userVO == null}">
    <script>
        alert("????????? ??? ?????? ???????????????.");
        history.back();
    </script>
</c:if>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<!-- Title page -->
<%--<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('/resources/images/bg-01.jpg');">
    <h2 class="ltext-105 cl0 txt-center">
        STYLDLE
    </h2>
</section>--%>
<!-- Content page -->
<section class="bg0 p-t-104 p-b-116">
    <div class="container">
        <div class="flex-w flex-tr">
            <div style="width: 600px; margin: 0 auto" class="bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md">
                <form action="upload" method="post" id="uploadForm">
                    <h4 class="mtext-105 cl2 txt-center p-b-30 m-b-35">
                        <b>????????? ?????????</b>
                    </h4>
                    <h5 class="p-b-5">????????? ??????</h5>
                    <div class="bor8 m-b-30 p-all-8 how-pos4-parent flex-l" id="uploadDiv">
                        <label for="uploadFile" class="m-b-0">
                            <img src="/resources/image/uploadBtn.png" width="100px"/>
                        </label>
                        <input style="display: none" class="stext-111" type="file" name="uploadFile" id="uploadFile"
                               accept="image/jpg,image/gif,image/png,image/jpeg,image/bmp"/>
                        <div id="uploadResult" class="m-l-8"></div>
                    </div>
                    <h5 class="m-b-3">?????? ??????
                        <a href="#" id="openTag"><i class="fa fa-plus-circle"></i></a>
                        <a href="#" id="removeTag"><i class="fa fa-minus-circle"></i></a>
                    </h5>
                    <small class="cl9"> + ????????? ?????? ????????? ??????????????????. (?????? 5???)</small>
                    <div id="tag" class="bor8 m-b-30 m-t-3">
                        <ul id="tagList" class="p-lr-25 p-tb-17"></ul>
                    </div>
                    <h5 class="p-b-5">??????</h5>
                    <div class="bor8 m-b-30">
                        <textarea class="stext-111 cl2 plh3 size-120 p-lr-25 p-tb-20" name="content"></textarea>
                    </div>
                    <input type="hidden" name="userId" value="${userVO.userId}"/>
                    <button type="button" id="uploadBtn"
                            class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer">
                        ?????????
                    </button>
                </form>
            </div>
        </div>
    </div>
</section>
<%@ include file="/WEB-INF/views/includes/footer.jsp" %>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
    // ????????? ????????? ?????? ???????????????
    var regex = new RegExp("(.*?)\.(jpg|gif|png|jpeg|bmp)$");
    var maxSize = 5242880; //5MB
    function checkExtension(fileName, fileSize) {
        if (fileSize >= maxSize) {
            alert("?????? ????????? ??????");
            return false;
        }
        if (regex.test(fileName)) {
            // ???????????? ?????? ?????????
            return true;
        } else {
            alert("????????? ????????? ????????? ??????");
            $("#uploadFile").val("");
            return false;
        }
    }

    function showUploadResult(uploadResultArr) {
        if (!uploadResultArr || uploadResultArr.length === 0) {
            return;
        }
        var uploadUL = $("#uploadResult");
        var str = "";
        var obj = uploadResultArr[0];
        var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
        str += `<div data-path="${'${obj.uploadPath}'}" data-filename="${'${obj.fileName}'}" data-uuid="${'${obj.uuid}'}">
                    <img src="/display?fileName=${'${fileCallPath}'}"/>
                    <i class="fa fa-minus-circle cl2"></i>
                </div>`;
        uploadUL.html(str);
    }

    $(document).ready(function (e) {
        var formObj = $("#uploadForm");
        // ????????? ?????????
        $("#uploadBtn").click(function (e) {
            e.preventDefault();
            if ($("#uploadFile").val() === "") {
                alert("????????? ????????? ?????????????????????.");
                return;
            }
            var jobj = $("#uploadResult div");
            var str = "";
            str += "<input type='hidden' name='styleImgVO.fileName' value='" + jobj.data("filename") + "'/>";
            str += "<input type='hidden' name='styleImgVO.uuid' value='" + jobj.data("uuid") + "'/>";
            str += "<input type='hidden' name='styleImgVO.uploadPath' value='" + jobj.data("path") + "'/>";
            formObj.append(str);
            formObj.attr("method", "post");
            formObj.submit();
        })

        // ????????? ?????? ??????
        $("#uploadResult").on("click", "i", function (e) {
            var targetDiv = $(this).parent("div");
            var targetFile = targetDiv.data("filename");
            var type = "image";

            $.ajax({
                url: '/deleteFile',
                data: { fileName: targetFile, type: type },
                dataType:'text',
                type: 'POST',
                success: function (result) {
                    $("#uploadFile").val("");
                    targetDiv.remove();
                }
            })
        })

        // ?????? ?????????
        $("input[type='file']").change(function (e) {
            var formData = new FormData();
            var inputFile = $("input[id='uploadFile']");
            var files = inputFile[0].files;
            if (!checkExtension(files[0].name, files[0].size)) {
                return;
            }
            formData.append("uploadFile", files[0])

            $.ajax({
                url: '/uploadAjax',
                processData: false,
                contentType: false,
                data: formData,
                type: 'post',
                dataType: 'json',
                success: function (result) {
                    showUploadResult(result);
                }
            })
        })

        // ?????? ????????? ??????
        $("#openTag").click(function (e) {
            e.preventDefault();
            var liNum = $(".tags").length;
            if (liNum >= 5) {
                alert("????????? ?????? 5????????? ?????? ???????????????.");
                return;
            }
            window.open("/style/tag", "_blank", "width=350, height=425");
        })

        // ????????? ?????? ??????
        $("#removeTag").click(function (e) {
            e.preventDefault();
            $("#tagList li").last().remove();
        })
    })
</script>

<!--===============================================================================================-->
<script src="/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
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