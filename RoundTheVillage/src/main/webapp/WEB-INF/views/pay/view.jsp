<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 상세 내역</title>
<link rel="stylesheet" href="${contextPath}/resources/css/pay/pay.css">
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<div class="container">

    <h4 class="mt-5 mb-4">예약 내역</h4>
    <div class="row p-4 bg-light rounded mb-5">
        <div class="col-md-12 mt-2">
            <div class="d-flex justify-content-between bb">
                <span>결제 번호: ${pay.payNo}</span>
                <span class=""><fmt:formatDate pattern="yyyy-MM-dd" value="${pay.payDate}"/></span>
            </div>
            <div class="d-flex justify-content-left py-4 bb">
                <img src="${contextPath}/resources/images/lesson/${pay.fileName}" class="rounded img-responsive w-25">
                <div class="p-3 ml-4 col-md-9">
                    <h3 class="mt-2">${pay.lesTitle}</h3>
                    <span>${pay.craftshopName}</span> |
                    <span>${pay.lesCategory}</span>
                    
                    <div class="row pt-3 d-block">
	                    <span class="font-weight-bold col-md-6">예약 날짜</span>
	                    <span class="font-weight-bold col-md-6">${pay.resDate}</span>
                    </div>
                    
                    <div class="row pt-3 d-block">
	                    <span class="font-weight-bold col-md-6">참가 인원</span>
	                    <span class="font-weight-bold col-md-6">${pay.prtcpAmt}</span>
                    </div>
                    
                    <div class="text-right mt-2">
	                    <fmt:parseDate  var="resDate" value="${fn:substring(pay.resDate,0,10)}" pattern="yyyy-MM-dd"/>
											<fmt:formatDate var="now" value="<%= new java.util.Date() %>" pattern="yyyy-MM-dd"/> 
											<c:choose>
												<c:when test="${pay.payFl == 'Y'.charAt(0)}">
														<button class="btn btn-around" disabled>취소됨</button>
												</c:when>
												<c:when test="${resDate > now && pay.payFl == 'N'.charAt(0)}">
										        <button class="btn btn-around" onclick="location.href='../cancelPay/${pay.payNo}'">예약 취소</button>
												</c:when>
											</c:choose>
								    </div>
                </div>
            </div>
        </div>

				<div class="col-md-12 px-3">
		        <div class="col-md-12 py-4 mb-3 bb">결제 금액 정보</div>
		        <div class="col-md-12">
		            <ul class="list-group list-group-flush mb-3">
		                <li class="list-group-item d-flex justify-content-between lh-condensed bg-light">
		                    <div>
		                        <h6 class="my-0 font-weight-bold">상품 금액</h6>
		                    </div>
		                    <span class="font-weight-bold">${pay.lesPrice}원</span>
		                </li>
		                <li class="list-group-item d-flex justify-content-between lh-condensed bg-light">
		                    <div class="text-around">
		                        <h6 class="my-0">할인 금액</h6>
		                    </div>
		                    <span class="text-around">-${pay.gradeDis + pay.couponDis}원</span>
		                </li>
		                <li class="list-group-item d-flex justify-content-between lh-condensed bg-light">
		                    <div>
		                        <h6 class="my-0 text-around">회원 등급 할인</h6>
		                    </div>
		                    <span class="text-around">-${pay.gradeDis}원</span>
		                </li>
		                <li class="list-group-item d-flex justify-content-between lh-condensed bg-light bb">
		                    <div>
		                        <h6 class="my-0 text-around">쿠폰 할인</h6>
		                    </div>
		                    <span class="text-around">-${pay.couponDis}원</span>
		                </li>
		                <li class="list-group-item d-flex justify-content-between bg-light">
		                    <span>결제 금액</span>
		                    <strong>${pay.payAmt}원</strong>
		                </li>
		            </ul>
		        </div>
				</div>
    </div>

    <div class="text-right">
        <button class="btn btn-around" onclick="location.href='${returnListURL}'">목록으로</button>
    </div>
</div>
<jsp:include page="../common/footer.jsp" />

 <script>
   function cancelPay() {
     jQuery.ajax({
       "url": "http://www.myservice.com/payments/cancel",
       "type": "POST",
       "contentType": "application/json",
       "data": JSON.stringify({
         "merchant_uid": "mid_" + new Date().getTime(), // 주문번호
         "cancel_request_amount": 2000, // 환불금액
         "reason": "테스트 결제 환불" // 환불사유
       }),
       "dataType": "json"
     });
   }
 </script>
</body>
</html>