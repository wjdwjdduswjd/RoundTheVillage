<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 내역</title>
<link rel="stylesheet" href="${contextPath}/resources/css/pay/pay.css">
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<div class="container">

    <!-- <h5 class="hr-sect">구매 내역</h5> -->
    <div class="row p-3 bg-light rounded mb-5">
        <div class="col-md-12">
            <div class="d-flex justify-content-between bb">
                <span class="">2021.02.16</span>
                <a href="#" class="">내역 상세 보기 ></a>
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

        <div class="col-md-12">
            <div class="d-flex justify-content-between bb">
                <span class="">2021.02.16</span>
                <a href="#" class="">내역 상세 보기 ></a>
            </div>
            <div class="d-flex justify-content-left py-5 mb-4 bb">
                <img src="${contextPath}/resources/images/ff.jpg" class="rounded img-responsive w-25">
                <div class="p-3">
                    <h4 class="">[플라워 원데이 클래스]</h4>
                    <span class="">삼청동</span> |
                    <span class="">생활</span>
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

    <div class="text-right">
        <button class="btn btn-around">등록</button>
        <button class="btn btn-around-2">취소</button>
        <button class="btn btn-around-2">목록으로</button>
    </div>
</div>
<jsp:include page="../common/footer.jsp" />
</body>
</html>