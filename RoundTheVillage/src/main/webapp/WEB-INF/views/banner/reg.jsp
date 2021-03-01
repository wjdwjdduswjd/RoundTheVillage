<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배너 등록</title>
<link rel="stylesheet" href="${contextPath}/resources/css/pay/pay.css">
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<div class="container">

    <!-- <h5 class="hr-sect">배너 등록</h5> -->
    <div class="row p-3 bg-light rounded mb-5">
        <div class="offset-md-1 col-md-10 mb-3 bg-white rounded border border-secondary">대표 : OOO</div>
        <div class="offset-md-1 col-md-10 mb-3 bg-white rounded border border-secondary">플라워 공방</div>
        <div class="offset-md-1 col-md-10 mb-4 bg-white rounded border border-secondary">010-1234-5678</div>

        <strong class="offset-md-1 col-md-10 p-1 mb-1">배너 기간</strong>
        <div class="offset-md-1 col-md-10 p-1 mb-3">2021년 2월 17일 ~ 2021년 2월 23일</div>

        <strong class="offset-md-1 col-md-10 p-1 mb-2">배너 이미지</strong>
        <img src="${contextPath}/resources/images/banner/banner-001.jpg" class="offset-md-1 col-md-10 rounded mb-5">
    </div>

    <div class="text-right">
        <button class="btn btn-around">등록</button>
        <button class="btn btn-around-2">목록으로</button>
    </div>
</div>
<jsp:include page="../common/footer.jsp" />
</body>
</html>