<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>동네 한 바퀴</title>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- css 연결  -->
<link rel="stylesheet" href="${contextPath}/resources/css/common/main2.css">
<style>
#banner {
	width: 1200px;
	height: 300px;
	margin-top: 60px;
	margin-bottom: 60px;
}
</style>

</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.js"></script>
  <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.theme.min.css"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.css"></script> -->

	<!------------------------------------------ banner ------------------------------------------>
	<div id="banner">
		<div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
			<div class="carousel-inner">

				<c:choose>
					<c:when test="${empty bList}">
						<div class="carousel-item active">
							<img src="${contextPath}/resources/images/banner/banner_default.jpg" class="d-block w-100" alt="...">
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="banner" items="${bList}" varStatus="vs">
							<div class="carousel-item <c:if test="${vs.first}">active</c:if>">
								<c:choose>
									<c:when test="${!empty banner.URL}">
										<a href="${banner.URL}"><img src="${contextPath}/resources/bannerImages/${banner.img}" class="d-block w-100" alt="..."></a>
									</c:when>
									<c:otherwise>
										<a href="${contextPath}/shop/${banner.memNo}"><img src="${contextPath}/resources/bannerImages/${banner.img}" class="d-block w-100" alt="..."></a>
									</c:otherwise>
								</c:choose>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>

			<!-- 이전,다음 버튼 -->
			<a class="carousel-control-prev" href="#carouselExampleFade" role="button" data-slide="prev"> <span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleFade" role="button" data-slide="next"> <span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="sr-only">Next</span>
			</a>
		</div>
	</div>


	<!-------------------------------------------- main -------------------------------------------->

	<!-- 좋아요 기준 -->
	<div class="Amain">
		<div class="row">
			<div class="col-md-6 col-sm-6 col-xs-12">
			
				<div id="bigTitle">
					<img src="${contextPath}/resources/images/logo/bread.png" width="30px;">
					<p class="p1">인기 폭발!</p>
					<p class="p2">좋아요 TOP 공방</p>
				</div>
			</div>
		</div>
		
		
		
		<div id="page">
			<div class="carousel-inner">
			
				<c:forEach items="${likeList}" var="craft" varStatus="vs">
					<c:if test="${vs.index % 4 == 0 }">
						<div class="item<c:if test="${vs.first}"> active</c:if>">
							<div class="row">
					</c:if>
					<div class="col-md-3 col-sm-3 col-xs-12" id="cursor">
						<div class="shop-item" id="${craft.shopNo}">
							<div class="slider-image">
								<c:forEach items="${thList}" var="th">
									<c:if test="${th.shopNo == craft.shopNo}">
										<img src="${contextPath}${th.filePath}/${th.fileName}" class="img-responsive" alt="a">
									</c:if>
								</c:forEach>
							</div>
	
							<%-- 제목의 길이가 30글자를 넘어가는 경우 --%>
						    <c:set var="info" value="${craft.thumbInfo}"/>
						    <c:if test="${fn:length(info) > 20 }">
						       <c:set var="info" value="${fn:substring(info,0,20) }..."/>
						    </c:if>
    
    
							<div class="craftText">
										<h6 class="card-category mt-2">#${craft.shopCategoryName }</h6>
										<h5 class="card-title">[${craft.shopName }]</h5>
										<p class="card-text">${info}</p>
								<div class="cart-section">
									<div class="row">
										<div class="col-md-6 col-sm-12 col-xs-6 like">
											<p id="like" style="font-size:12px;">♥${craft.likeCount }</p>
										</div>
									</div>
								</div>
							</div>
							
							
						</div>
					</div>
					<c:if test="${vs.index % 4 == 3 }">
			</div>
		</div>
		</c:if>
		</c:forEach>
	</div>
	
	
	
	
	<!-- 신규 공방 --> 
	<div class="Amain">
		<div class="row">
			<div class="col-md-6 col-sm-6 col-xs-12">
			
				<div id="bigTitle" style="margin-top: 50px;">
					<img src="${contextPath}/resources/images/logo/bread.png" width="30px;">
					<p class="p1"">New!</p>
					<p class="p2">신규 공방</p>
				</div>
			</div>
		</div>
		
		
		<div id="page">
			<div class="carousel-inner">
			
				<c:forEach items="${newList}" var="craft" varStatus="vs">
					<c:if test="${vs.index % 4 == 0 }">
						<div class="item<c:if test="${vs.first}"> active</c:if>">
							<div class="row">
					</c:if>
					<div class="col-md-3 col-sm-3 col-xs-12" id="cursor">
						<div class="shop-item" id="${craft.shopNo}">
							<div class="slider-image">
								<c:forEach items="${newthList}" var="th">
									<c:if test="${th.shopNo == craft.shopNo}">
										<img src="${contextPath}${th.filePath}/${th.fileName}" class="img-responsive" alt="a">
									</c:if>
								</c:forEach>
							</div>

							<div class="craftText">
										<h6 class="card-category mt-2">#${craft.shopCategoryName }</h6>
										<h5 class="card-title">[${craft.shopName }]</h5>
										<p class="card-text">${craft.thumbInfo}</p>
								<div class="cart-section">
									<div class="row">
										<div class="col-md-6 col-sm-12 col-xs-6 like">
											<p id="like" style="font-size:12px;">♥${craft.likeCount }</p>
										</div>
									</div>
								</div>
							</div>
							
							
						</div>
					</div>
					<c:if test="${vs.index % 4 == 3 }">
			</div>
		</div>
		</c:if>
		</c:forEach>
	</div>



	


	<!-- 주소 기준 -->
	<c:if test="${!empty loginMember && !empty addrList}" >
		
		<div class="Amain">
		<div class="row">
			<div class="col-md-6 col-sm-6 col-xs-12">
			
				<div id="bigTitle" style="margin-top: 50px;">
					<img src="${contextPath}/resources/images/logo/bread.png" width="30px;">
					<p class="p1">둘러봐요!</p>
					<p class="p2">우리 동네 공방</p>
				</div>
			</div>
		</div>
		
		
		<div id="page">
			<div class="carousel-inner">
			
				<c:forEach items="${addrList}" var="craft" varStatus="vs">
					<c:if test="${vs.index % 4 == 0 }">
						<div class="item<c:if test="${vs.first}"> active</c:if>">
							<div class="row">
					</c:if>
					<div class="col-md-3 col-sm-3 col-xs-12" id="cursor">
						<div class="shop-item" id="${craft.shopNo}">
							<div class="slider-image">
								<c:forEach items="${addrThList}" var="th">
									<c:if test="${th.shopNo == craft.shopNo}">
										<img src="${contextPath}${th.filePath}/${th.fileName}" class="img-responsive" alt="a">
									</c:if>
								</c:forEach>
							</div>

							<div class="craftText">
										<h6 class="card-category mt-2">#${craft.shopCategoryName }</h6>
										<h5 class="card-title">[${craft.shopName }]</h5>
										<p class="card-text">${craft.thumbInfo}</p>
								<div class="cart-section">
									<div class="row">
										<div class="col-md-6 col-sm-12 col-xs-6 like">
											<p id="like" style="font-size:12px;">♥${craft.likeCount }</p>
										</div>
									</div>
								</div>
							</div>
							
							
						</div>
					</div>
					<c:if test="${vs.index % 4 == 3 }">
			</div>
		</div>
		</c:if>
		</c:forEach>
	</div>
	</c:if>





		<!-- 관심분야 기준 -->
	<c:if test="${!empty loginMember}">
		<div class="Amain">
		<div class="row">
			<div class="col-md-6 col-sm-6 col-xs-12">
			
				<div id="bigTitle" style="margin-top: 50px;">
					<img src="${contextPath}/resources/images/logo/bread.png" width="30px;">
					<p class="p1" style="margin-top: 30px;">나의 관심 pick!</p>
					<p class="p2">관심분야 공방</p>
				</div>
			</div>
		</div>
		
		
		
		<div id="page">
			<div class="carousel-inner">
			
				<c:forEach items="${intList}" var="craft" varStatus="vs">
					<c:if test="${vs.index % 4 == 0 }">
						<div class="item<c:if test="${vs.first}"> active</c:if>">
							<div class="row">
					</c:if>
					<div class="col-md-3 col-sm-3 col-xs-12" id="cursor">
						<div class="shop-item" id="${craft.shopNo}">
							<div class="slider-image">
								<c:forEach items="${intfList}" var="th">
									<c:if test="${th.shopNo == craft.shopNo}">
										<img src="${contextPath}${th.filePath}/${th.fileName}" class="img-responsive" alt="a">
									</c:if>
								</c:forEach>
							</div>

							<div class="craftText">
										<h6 class="card-category mt-2">#${craft.shopCategoryName }</h6>
										<h5 class="card-title">[${craft.shopName }]</h5>
										<p class="card-text">${craft.thumbInfo}</p>
								<div class="cart-section">
									<div class="row">
										<div class="col-md-6 col-sm-12 col-xs-6 like">
											<p id="like" style="font-size:12px;">♥${craft.likeCount }</p>
										</div>
									</div>
								</div>
							</div>
							
							
						</div>
					</div>
					<c:if test="${vs.index % 4 == 3 }">
			</div>
		</div>
		</c:if>
		</c:forEach>
	</div>
	</c:if>
	
	


<jsp:include page="footer.jsp" />

<script>
	// 상세조회 이동
	$(".shop-item").on("click", function() {
		var shopNo = $(this).attr("id");
		location.href = "${contextPath}/shop/" + shopNo;

	});
</script>



</body>
</html>