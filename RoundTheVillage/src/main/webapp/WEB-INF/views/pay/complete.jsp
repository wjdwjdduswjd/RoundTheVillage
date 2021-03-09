<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <div class="p-3 row bb pt-5">
      <div class="col-md-12 d-flex flex-column position-static">
      		<img src="${contextPath}/resources/images/logo/bread.png" class="rounded mx-auto d-block pt-5" width="150">
          <h2 class="mb-2 font-weight-bold text-center p-5 mb-5">결제가 완료되었습니다.</h2>
      </div>

      <div class="offset-md-2 col-md-8">
          <ul class="list-group list-group-flush mb-3">
              <li class="list-group-item d-flex justify-content-between">
                  <div><h6 class="my-0">예약 번호</h6></div>
                  <span>${pay.payNo}</span>
              </li>
              <li class="list-group-item d-flex justify-content-between lh-condensed">
                  <div><h6 class="my-0">수업명</h6></div>
                  <span class="">${pay.lesTitle}</span>
              </li>
              <li class="list-group-item d-flex justify-content-between lh-condensed">
                  <div><h6 class="my-0">예약 날짜</h6></div>
                  <span>${pay.resDate}</span>
              </li>
              <li class="list-group-item d-flex justify-content-between">
                  <span>참가 인원</span>
                  <span>${pay.prtcpAmt}명</span>
              </li>
              <li class="list-group-item d-flex justify-content-between">
                  <span>결제 금액</span>
                  <span>${pay.payAmt}원</span>
              </li>
          </ul>
      </div>
    </div>

    <div class="text-center p-5">
        <button class="btn btn-around" onclick="location.href='list'">예약 내역</button>
        <button class="btn btn-around-2" onclick="location.href='${contextPath}'">홈으로</button>
    </div>
</div>
<jsp:include page="../common/footer.jsp" />
</body>
</html>