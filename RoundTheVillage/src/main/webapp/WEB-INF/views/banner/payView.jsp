<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 상세 내역</title>
<link rel="stylesheet" href="${contextPath}/resources/css/pay/pay.css" type="text/css">
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<div class="container">

    <h4 class="mt-5 mb-4">결제 상세 내역</h4>
    <div class="row p-4 bg-light rounded mb-5">
        <div class="py-2 col-md-12">
            <div class="d-flex justify-content-between bb">
                <a href="#" class="">결제 번호: ${banner.banNo}</a>
                <!-- <span class="">2021.02.16</span> -->
            </div>

            <div class="row px-3 mt-4">
                <strong class="col-md-12 p-1 mb-1">링크 URL</strong>
                <div class="col-md-10 p-1 mb-3">
									<c:choose>
	                	<c:when test="${empty banner.URL}">공방 상세 페이지</c:when>
	                	<c:otherwise>${banner.URL}</c:otherwise>
	               	</c:choose>
								</div>
								
                <strong class="col-md-12 p-1 mb-1">배너 기간</strong>
                <div class="col-md-10 p-1 mb-3">${banner.startDate} ~ ${banner.endDate}</div>
                
                <strong class="col-md-12 p-1 mb-1">승인 여부</strong>
                <div class="col-md-10 p-1 mb-3">
                	<c:choose>
	                	<c:when test="${banner.aprvlFl == 'Y'.charAt(0)}">
	                		<h5><span class="badge badge-around">승인 완료</span></h5>
	               		</c:when>
	                	<c:otherwise>
	                		<h5><span class="badge badge-around">미승인</span></h5>
										</c:otherwise>
                	</c:choose>
               	</div>

                <strong class="col-md-12 p-1 mb-2">배너 이미지</strong>
                <div class="bb">
	                <img src="${contextPath}/resources/images/bannerImages/${banner.img}" class="col-md-12 mb-5">
                </div>
            </div>
        </div>

				<div class="col-md-12">
	        <strong class="col-md-12 py-4 mb-3 bb d-block">결제 정보</strong>
	        <div class="col-md-12">
	            <ul class="list-group list-group-flush mb-3">
	                <li class="list-group-item d-flex justify-content-between lh-condensed bg-light">
	                    <div>
	                        <h6 class="my-0">결제 날짜</h6>
	                    </div>
	                    <span>${banner.payDate}</span>
	                </li>
	                <li class="list-group-item d-flex justify-content-between bg-light">
	                    <span>결제 금액</span>
	                    <span>${banner.payAmt}원</span>
	                </li>
	            </ul>
	        </div>
				</div>
    </div>

    <div class="text-right">
    		<fmt:formatDate var="startDate" value="${banner.startDate}" pattern="yyyy-MM-dd"/>
				<fmt:formatDate var="now" value="<%= new java.util.Date() %>" pattern="yyyy-MM-dd"/>
				<c:choose>
						<c:when test="${banner.bannerFl == 'Y'.charAt(0)}">
								<button class="btn btn-around" disabled>취소됨</button>
						</c:when>
						<c:when test="${startDate > now}">
		        		<button class="btn btn-around" onclick="location.href='../cancelBanner/${banner.banNo}'">결제 취소</button>
						</c:when>
				</c:choose>
				
        <button class="btn btn-around-2" onclick="location.href='${returnListURL}'">목록으로</button>
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