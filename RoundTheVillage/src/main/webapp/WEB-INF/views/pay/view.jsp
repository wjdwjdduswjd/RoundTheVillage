<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 내역 상세</title>
<link rel="stylesheet" href="${contextPath}/resources/css/pay/pay.css">
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<div class="container">

    <!-- <h5 class="hr-sect">구매 내역</h5> -->
    <div class="row p-3 bg-light rounded mb-5">
        <div class="col-md-12 py-4">
            <div class="d-flex justify-content-between bb">
                <a href="#" class="">결제 번호: 64735242</a>
                <span class="">2021.02.16</span>
            </div>
            <div class="d-flex justify-content-left py-4 mb-5 bb">
                <img src="${contextPath}/resources/images/ff.jpg" class="rounded img-responsive w-25">
                <div class="p-3">
                    <h4 class="">[플라워 원데이 클래스]</h4>
                    <span class="">삼청동</span> |
                    <span class="">생활</span>
                </div>
            </div>
        </div>

        <div class="col-md-12 py-4 mb-3 bb">결제 금액 정보</div>

        <div class="col-md-12">
            <ul class="list-group list-group-flush mb-3">
                <li class="list-group-item d-flex justify-content-between lh-condensed bg-light">
                    <div>
                        <h6 class="my-0 font-weight-bold">상품 금액</h6>
                    </div>
                    <span class="font-weight-bold">50,000원</span>
                </li>
                <li class="list-group-item d-flex justify-content-between lh-condensed bg-light">
                    <div class="text-around">
                        <h6 class="my-0">할인 금액</h6>
                    </div>
                    <span class="text-around">-2,000원</span>
                </li>
                <li class="list-group-item d-flex justify-content-between lh-condensed bg-light">
                    <div>
                        <h6 class="my-0 text-around">회원 등급 할인</h6>
                    </div>
                    <span class="text-around">-1,000원</span>
                </li>
                <li class="list-group-item d-flex justify-content-between lh-condensed bg-light bb">
                    <div>
                        <h6 class="my-0 text-around">쿠폰 할인</h6>
                    </div>
                    <span class="text-around">-1,000원</span>
                </li>
                <li class="list-group-item d-flex justify-content-between bg-light">
                    <span>결제 금액</span>
                    <strong>48,000원</strong>
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