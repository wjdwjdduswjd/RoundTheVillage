<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수업 결제 완료</title>
<link rel="stylesheet" href="${contextPath}/resources/css/pay/pay.css">
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<div class="container">

    <!-- <h5 class="hr-sect">수업 결제</h5> -->
    <div class="p-3 row bb">
      <div class="col-md-12 d-flex flex-column position-static">
          <h2 class="mb-2 font-weight-bold text-center p-5 mb-5">결제가 완료되었습니다.</h2>
      </div>

      <div class="offset-md-2 col-md-8">
          <ul class="list-group list-group-flush mb-3">
              <li class="list-group-item d-flex justify-content-between lh-condensed">
                  <div>
                      <h6 class="my-0">결제 번호</h6>
                  </div>
                  <span class="">${banner.banNo}</span>
              </li>
              <li class="list-group-item d-flex justify-content-between">
                  <div class="">
                      <h6 class="my-0">링크 URL</h6>
                  </div>
                  <span>
                  	<c:choose>
	                  	<c:when test="${empty banner.URL}">공방 상세 페이지</c:when>
	                  	<c:otherwise>${banner.URL}</c:otherwise>
                  	</c:choose>
                 	</span>
              </li>
              <li class="list-group-item d-flex justify-content-between lh-condensed">
                  <div>
                      <h6 class="my-0">기간</h6>
                  </div>
                  <span>${banner.startDate} ~ ${banner.endDate}</span>
              </li>
              <li class="list-group-item d-flex justify-content-between">
                  <span>결제 금액</span>
                  <span>${banner.payAmt}원</span>
              </li>
          </ul>
      </div>
    </div>

    <div class="text-center p-5">
        <button class="btn btn-around" onclick="location.href='payList'">결제 내역</button>
        <button class="btn btn-around-2" onclick="location.href='${contextPath}'">홈으로</button>
    </div>
</div>
<jsp:include page="../common/footer.jsp" />
</body>
</html>