<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<link rel="stylesheet" href="${contextPath}/resources/css/pay/pay.css">
<title>나의 내역</title>
<style>
#title {
	font-family: 'NanumSquare', sans-serif !important;
	margin-top: 50px;
}

.pagination {
	justify-content: center;
}

#searchForm {
	position: relative;
	margin-top: 20px;
}

#searchForm>* {
	top: 0;
}

.boardTitle>img {
	width: 50px;
	height: 50px;
}

.container notice-list {
	width: 1200px margin: 0 0 0;
}

#list-table {
	text-align: center;
}

.list-wrapper {
	min-height: 540px;
}

#list-table td:hover {
	cursor: pointer;
}

#searchBtn {
	color: #FFF;
	background-color: #FBBC73;
	border: 1px solid #FBBC73;
	margin-top: -5px;
}

#insertBtn, .customer {
	color: #FFF;
	background-color: #FBBC73;
	border: 1px solid #FBBC73;
}

.pagination {
	margin-top: 90px;
}

#noticeN {
	width: 200px;
}

.pagination-success {
	margin-top: 40px;
}

.page-item > a {
	color: #5B3929;
}

.page-item > a:hover {
	color: #FBBC73;
	background-color: #fff;
}

.page-item:active, .page-item:active {
    z-index: 3;
    color: #fff;
    background-color: #FBBC73;
    border-color: #FBBC73;
}

#normalBtn, #craftBtn  {
    margin-top: 15px;
    margin-left: 15px;
    margin-bottom:30px;
    background-color : #fff ;
    color: #5B3929;
    border: 1px solid #FBBC73;
    border-radius: 5px;
    width: 150px;
    height: 40px;
    font-family: 'NanumSquare', sans-serif !important;
    font-size: 17px;
}

#normalBtn {
	background-color : #FBBC73;
}
</style>

</head>
<body>
	<jsp:include page="../common/header.jsp" />

	<div class="container notice-list">
	
		<div id="btnDiv">
        <a href="${contextPath}/pay/list"><button type="menu" id="craftBtn">수업 예약 내역</button></a>
        <a href="${contextPath}/banner/payList"><button type="menu" id="normalBtn">배너 결제 내역</button></a>
    </div>
	
    <div class="row p-3 pt-4 bg-light rounded mb-5">
    	<c:if test="${empty bList}">
					<div>결제 내역이 없습니다.</div>
			</c:if>
    	
    		<c:forEach var="banner" items="${bList}">
		        <div class="col-md-12">
		            <div class="d-flex justify-content-between bb">
		                <span class="">${banner.payDate}</span>
		                <a href="payView/${banner.banNo}" class="ahover">내역 상세 보기 ></a>
		            </div>
		            <div class="d-flex justify-content-left py-4 mb-5 bb">
		                <img src="${contextPath}/resources/bannerImages/${banner.img}" class="rounded img-responsive w-50">
		                <div class="p-3">
		                    <div class="mb-3">
		                        <strong class="col-md-2">기간</strong>
		                        <span class="">${banner.startDate} ~ ${banner.endDate}</span>
		                    </div>
		                    <div>
		                        <strong class="col-md-2">금액</strong>
		                        <span class="">${banner.payAmt}원</span>
		                    </div>
		                    <div class=p-3>
					                	<c:choose>
						                	<c:when test="${banner.aprvlFl == 'Y'.charAt(0)}">
						                		<span class="badge badge-around">승인 완료</span>
						               		</c:when>
						                	<c:otherwise>
						                		<span class="badge badge-around">미승인</span>
															</c:otherwise>
					                	</c:choose>
														<c:if test="${banner.bannerFl == 'Y'.charAt(0)}">
																<span class="badge badge-around">취소됨</span>
														</c:if>
		                    </div>
		                </div>
		            </div>
		        </div>
    		</c:forEach>
    </div>

 		<!--------------------------------- pagination  ---------------------------------->
		<div class="my-4">
			<ul class="pagination justify-content-center">
				<c:url var="pageUrl" value="payList?"/>

				<!-- 화살표에 들어갈 주소를 변수로 생성 -->
				<c:set var="firstPage" value="${pageUrl}cp=1"/>
				<c:set var="lastPage" value="${pageUrl}cp=${pInfo.maxPage}"/>
				
				<fmt:parseNumber var="c1" value="${(pInfo.currentPage - 1) / 10 }"  integerOnly="true" />
				<fmt:parseNumber var="prev" value="${ c1 * 10 }"  integerOnly="true" />
				<c:set var="prevPage" value="${pageUrl}cp=${prev}" />
				
				
				<fmt:parseNumber var="c2" value="${(pInfo.currentPage + 9) / 10 }" integerOnly="true" />
				<fmt:parseNumber var="next" value="${ c2 * 10 + 1 }" integerOnly="true" />
				<c:set var="nextPage" value="${pageUrl}cp=${next}" />
				
				<c:if test="${pInfo.currentPage > pInfo.pageSize}">
					<li><a class="page-link" href="${firstPage}">&lt;&lt;</a></li>
					<li><a class="page-link" href="${prevPage}">&lt;</a></li>
				</c:if>

				<!-- 페이지 목록 -->
				<c:forEach var="page" begin="${pInfo.startPage}" end="${pInfo.endPage}" >
					<c:choose>
						<c:when test="${pInfo.currentPage == page }">
							<li class="page-item disabled"><a class="page-link">${page}</a></li>
						</c:when>
					
						<c:otherwise>
							<li><a class="page-link" href="${pageUrl}cp=${page}">${page}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
		
				<%-- 다음 페이지가 마지막 페이지 이하인 경우 --%>
				<c:if test="${next <= pInfo.maxPage}">
					<li><a class="page-link" href="${nextPage}">&gt;</a></li>
					<li><a class="page-link" href="${lastPage}">&gt;&gt;</a></li>
				</c:if>
			</ul>
		</div>
		<!-- ---------------------------------------------------------------------------------- -->
		
		<%-- 목록으로 버튼에 사용할 URL 변수 선언 --%>
		<c:set var="returnListURL" value="${contextPath}/banner/${pageUrl}cp=${pInfo.currentPage}" scope="session"/>
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>
