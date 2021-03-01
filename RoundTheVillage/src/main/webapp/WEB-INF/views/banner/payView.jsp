<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 상세 내역</title>
<link rel="stylesheet" href="${contextPath}/resources/css/pay/pay.css">
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<div class="container">

    <!-- <h5 class="hr-sect">결제 상세 내역</h5> -->
    <div class="row p-3 bg-light rounded mb-5">
        <div class="py-2 bb col-md-12">
            <div class="d-flex justify-content-between bb">
                <a href="#" class="">결제 번호: 64735242</a>
                <!-- <span class="">2021.02.16</span> -->
            </div>

            <div class="row p-3 bg-light rounded mb-2">
                <strong class="col-md-10 p-1 mb-1">링크 URL</strong>
                <div class="col-md-10 p-1 mb-3">https://www.naver.com</div>

                <strong class="col-md-10 p-1 mb-1">배너 기간</strong>
                <div class="col-md-10 p-1 mb-3">2021년 2월 17일 ~ 2021년 2월 23일</div>
                
                <strong class="col-md-10 p-1 mb-1">승인 여부</strong>
                <div class="col-md-10 p-1 mb-3">승인 완료</div>

                <strong class="col-md-10 p-1 mb-2">배너 이미지</strong>
                <img src="${contextPath}/resources/images/banner/banner-004.jpg" class="col-md-10 rounded mb-5">
            </div>
        </div>

        <div class="col-md-12 p-3 mb-3 bb">결제 정보</div>
        <div class="col-md-12">
            <ul class="list-group list-group-flush mb-3">
                <li class="list-group-item d-flex justify-content-between lh-condensed bg-light">
                    <div>
                        <h6 class="my-0">결제 날짜</h6>
                    </div>
                    <span>2021.02.16</span>
                </li>
                <li class="list-group-item d-flex justify-content-between bg-light">
                    <span>결제 금액</span>
                    <span>48,000원</span>
                </li>
            </ul>
        </div>
    </div>

    <div class="text-right">
        <button class="btn btn-around">목록으로</button>
    </div>
</div>
<jsp:include page="../common/footer.jsp" />
</body>
</html>