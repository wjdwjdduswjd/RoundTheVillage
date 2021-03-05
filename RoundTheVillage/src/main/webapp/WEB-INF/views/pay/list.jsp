<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

    <h4 class="mt-5 mb-4">예약 내역</h4>
    <div class="row p-3 pt-4 bg-light rounded mb-5">
		    <c:forEach var="pay" items="${pList}">
	        <div class="col-md-12">
	            <div class="d-flex justify-content-between bb">
	                <span class=""><fmt:formatDate pattern="yyyy-MM-dd" value="${pay.payDate}"/></span>
	                <a href="view/${pay.payNo}" class="ahover">내역 상세 보기 ></a>
	            </div>
	            <div class="d-flex justify-content-left py-4 mb-5 bb">
	                <img src="${contextPath}/resources/images/lesson/${pay.fileName}" class="rounded img-responsive w-25">
	                <div class="p-3">
	                    <h4 class="">${pay.lesTitle}</h4>
	                    <span class="">${pay.craftshopName}</span> |
	                    <span class="">${pay.lesCategory}</span>
	                    
	                    <div class="row pt-4 d-block">
		                    <span class="font-weight-bold col-md-6">예약 날짜</span>
		                    <span class="col-md-6"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${pay.resDate}"/></span>
                    </div>
	                </div>
	            </div>
	        </div>
		    </c:forEach>
    </div>

 		<!--------------------------------- pagination  ---------------------------------->
		<div class="my-4">
			<ul class="pagination justify-content-center">
				<c:url var="pageUrl" value="list?"/>

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
		<c:set var="returnListURL" value="${contextPath}/pay/${pageUrl}cp=${pInfo.currentPage}" scope="session"/>
</div>
<jsp:include page="../common/footer.jsp" />
</body>
</html>