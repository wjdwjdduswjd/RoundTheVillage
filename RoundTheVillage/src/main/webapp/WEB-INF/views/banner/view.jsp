<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <h4 class="hr-sect mt-5 mb-4">배너 등록</h4>
    <div class="row p-3 bg-light rounded mb-5">
        <div class="offset-md-1 col-md-10 mb-3 bg-white rounded border border-secondary">대표 : ${banner.memName}</div>
        <div class="offset-md-1 col-md-10 mb-3 bg-white rounded border border-secondary">${banner.craftshopName}</div>
        <div class="offset-md-1 col-md-10 mb-4 bg-white rounded border border-secondary">${banner.craftshopContact}</div>

        <strong class="offset-md-1 col-md-10 p-1 mb-1">배너 기간</strong>
        <div class="offset-md-1 col-md-10 p-1 mb-3">${banner.startDate} ~ ${banner.endDate}</div>

        <strong class="offset-md-1 col-md-10 p-1 mb-2">배너 이미지</strong>
        <img src="${contextPath}/resources/images/bannerImages/${banner.img}" class="offset-md-1 col-md-10 rounded mb-5">
    </div>

    <div class="text-right">
        <a href="../reg/${banner.banNo}" class="btn btn-around <c:if test="${banner.aprvlFl == 'Y'.charAt(0)}">disabled</c:if>">등록</a>
        <a href="${returnListURL}" class="btn btn-around-2">목록으로</a>
    </div>
</div>
<jsp:include page="../common/footer.jsp" />
</body>
</html>