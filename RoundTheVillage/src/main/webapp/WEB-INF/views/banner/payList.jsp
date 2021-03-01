<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 내역</title>
<link rel="stylesheet" href="${contextPath}/resources/css/pay/pay.css">
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<div class="container">

    <!-- <h5 class="hr-sect">결제 내역</h5> -->
    <div class="row p-3 bg-light rounded mb-5">
        <div class="py-4 bb col-md-12">
            <div class="d-flex justify-content-between mb-3 bb">
                <span class="">2021.02.16</span>
                <a href="#" class="">내역 상세 보기 ></a>
            </div>
            <div class="d-flex justify-content-left">
                <img src="${contextPath}/resources/images/banner/banner-002.jpg" class="rounded img-responsive w-50">
                <div class="p-4">
                    <div class="mb-3">
                        <strong class="col-md-2">기간</strong>
                        <span class="">21.02.16 ~ 21.02.23</span>
                    </div>
                    <div>
                        <strong class="col-md-2">금액</strong>
                        <span class="">86,000</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="py-4 bb col-md-12">
            <div class="d-flex justify-content-between mb-3 bb">
                <span class="">2021.02.16</span>
                <a href="#" class="">내역 상세 보기 ></a>
            </div>
            <div class="d-flex justify-content-left">
                <img src="${contextPath}/resources/images/banner/banner-003.jpg" class="rounded img-responsive w-50">
                <div class="p-4">
                    <div class="mb-3">
                        <strong class="col-md-2">기간</strong>
                        <span class="">21.02.16 ~ 21.02.23</span>
                    </div>
                    <div>
                        <strong class="col-md-2">금액</strong>
                        <span class="">86,000</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
            <li class="page-item disabled">
                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">&lt;&lt;</a>
            </li>
            <li class="page-item disabled">
                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">&lt;</a>
            </li>
            <li class="page-item disabled"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">4</a></li>
            <li class="page-item"><a class="page-link" href="#">5</a></li>
            <li class="page-item">
                <a class="page-link" href="#">&gt;</a>
            </li>
            <li class="page-item">
                <a class="page-link" href="#">&gt;&gt;</a>
            </li>
        </ul>
    </nav>
</div>
<jsp:include page="../common/footer.jsp" />
</body>
</html>