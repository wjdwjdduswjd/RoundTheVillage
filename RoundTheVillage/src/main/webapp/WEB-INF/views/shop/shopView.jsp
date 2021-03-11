<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공방 상세 조회</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">

<style>
* {
	font-family: 'NanumSquare', sans-serif !important;
}

.top {
	display: inline-block
}

#reviewArea {
	margin-top: 80px;
}

#classArea {
	margin-top: 80px;
}

#tab-btn {
	text-align: center;
	font-size: 20px;
	margin-top: 40px;
}

#infobtn, #classbtn, #reviewbtn {
	text-decoration: none;
	color: black;
}

.btnArea {
	display: inline-block;
	margin-left: 20px;
	font-weight: 1000;
}

.btnArea:hover {
	border-bottom: 5px solid #FBBC73;
}

/* #writer{
	border-left: 5px solid #FBBC73;
} */
.btnArea>a :hover {
	color: orange;
}

#map {
	width: 500px;
	height: 500px;
}

#infoArea {
	margin-top: 50px;
	margin-bottom: 20px;
}

#infotitle {
	font-weight: bold;
}

#classImg {
	padding: 20px 20px 20px 20px;
	display: inline-block
}

#review {
	padding: 30px 30px 30px 30px;
	border-left: 5px solid #FBBC73;
}

.boardImg {
	width: 275px;
	height: 400px;
}

.boardImg>img {
	width: 100%;
	height: 100%;
}

.lesson {
	padding: 40px;
	cursor: pointer;
}

.lesson>img {
	width : 275px;
	height : 400px;
}

.lesson>p {
	text-align: center;
}

.like {
	width: 40px;
	height: 40px;
}

#likeCount {
	font-size: 16px;
	font-weight: 500;
}

#updateBtn {
	border-bottom: 10px;
}

#category {
	font-size: 20px;
	color: #FBBC73;
	font-weight: 700;
}

.starArea>div> strong {
	font-size: 16px;
	color: gray;
}

#nickName {
	font-size: 17px;
	font-weight: 700;
	color: orange;
}

#reviewDate {
	font-size: 15px;
	font-weight: 500;
	color: gray;
}

#reviewContent {
	font-size: 14px;
	margin-left: 100;
	margin-top: 300;
}



</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />



	<div class="container" style="margin-top: 50px">



		<div class="top" style="width: 90%;">
			<div class="top" id="shopname" style="width: auto">
				<p>
				<p style="font-weight: bold; font-size: 40px">[${shop.shopName}]</p>
				</p>
			</div>
			<div  style="width: auto; font-size: 15px;">
				<p id="category">${shop.shopCategoryName}</p>

			</div>

		</div> 



		<!-- 좋아요  -->
		<div class="top">
			<c:choose>
				<c:when test="${empty likeFl}">
					<img src="${contextPath}/resources/images/boardListImages/heart.png" class="like">
				</c:when>

				<c:otherwise>
					<img src="${contextPath}/resources/images/boardListImages/fill-heart.png" class="like">
				</c:otherwise>
			</c:choose>
			<span id="likeCount">${shop.likeCount}</span>

		</div>

		<div class="starArea">


			<div class="top" style="width: auto;">
				<strong>평점 : ${shop.avgRating}</strong>
			</div>
			&nbsp;&nbsp;&nbsp;
			<strong>|</strong>
		&nbsp;&nbsp;&nbsp;
			<div class="top" style="width: auto;">
				<strong>별점 참여자수 : ${shop.participantsCount }</strong>
			</div>


		</div>

		<!-- 썸네일 -->
		<div>

			<div>
				<div class="boardImg top" id="titleImgArea">
					<img src="${contextPath}${thumb.filePath}/${thumb.fileName}">
				</div>
			</div>
			<div id="buttons">
				<c:if test="${(loginMember != null) && (shop.shopNo == loginMember.memberNo)}">
				
				<br>
			
				
					<a class="btn btn-success" id="updateBtn" 
					href="${contextPath}/shop/update/${shop.shopNo}" style="background-color: #fbbc73; border-color: #fbbc73;width : 80px; height : 30px; font-size : 14px; font-weight : bold;">
					수정
					</a>
					<a class="btn btn-success"  id="updateBtn" 
					href="${contextPath}/lesson/insertForm" style="background-color: #fbbc73; border-color: #fbbc73; margin-right: 20px; width : 80px; height : 30px; font-size : 14px; font-weight : bold;">
					수업 등록
					</a>
				</c:if>
			</div>
		</div>



		<div id="tab-btn">
			<div class="btnArea" style="width: 30%;">

				<a id="infobtn" class="btns" href="#infoArea">정보</a>
			</div>

			<div class="btnArea" style="width: 30%;">
				<a id="classbtn" class="btns" href="#classArea">수업</a>

			</div>

			<div class="btnArea" style="width: 30%;">
				<a id="reviewbtn" class="btns" href="#reviewArea">리뷰</a>

			</div>

		</div>

		<div id="shopcontent">

			<div id="infoArea">
				<div>
					<h1 style="font-weight: 1000; border-left : 7px solid red;">공방 정보</h1>
				</div>
				<br> <br>

				<div style="font-size: 17px">


					<div class="row mb-3 form-row">

						<div class="col-md-2" id="infotitle">
							<label for="infoshop"><strong style = "color :orange; ">공방소개</strong></label>
						</div>
						<div class="col-md-7" style="height: auto;">
							<%
								pageContext.setAttribute("newLine", "\n");
								%>

							${fn:replace(shop.shopInfo , newLine, "<br>" ) }
						</div>

					</div>

					<div class="row mb-3 form-row">

						<div class="col-md-2" id="infotitle">
							<label for="contact"><strong style = "color :orange; ">연락처</strong></label>
						</div>
						<div class="col-md-7">${shop.shopContact}</div>
					</div>


					<div class="row mb-3 form-row">

						<div class="col-md-2" id="infotitle">
							<label for="address"><strong style = "color :orange; ">위치</strong></label>
						</div>

						<div class="col-md-7">${shop.shopAdress}</div>

						<div>
							<div id="map" style="width: 400px; height: 400px; margin-top:50px;"></div>
						</div>
					</div>

				</div>

			</div>

			<hr>

			<div id="classArea">


				<div>

					<div style="font-weight: bold;">
						<h1 style="font-weight: 1000;border-left : 7px solid red;">수업 목록</h1>
						<%-- ${lesList}
					${thList } --%>
					</div>


					<div class="row">
						<c:forEach var="lesson" items="${lesList}">

							<c:forEach items="${thList}" var="th">
								<c:if test="${th.lesNo == lesson.lesNo}">
									<div class="col-md-3 lesson" id="${lesson.lesNo }">
										<img src="${contextPath}${th.filePath}/${th.fileName}">
										<p>${lesson.lesTitle }</p>
										<form action="${contextPath}/lesson/updateForm" method="post">
											<input type="hidden" name="lesNo" value="${lesson.lesNo}">
											<div>
												<c:if test="${loginMember.memberNo == shop.shopNo}">
													<button class="btn btn-success" style="background-color: #fbbc73; border-color: #fbbc73; font-weight: bold">수정/삭제</button>
												</c:if>
											</div>
										</form>
									</div>
								</c:if>
							</c:forEach>

						</c:forEach>
					</div>

				</div>

			</div>



			<hr>



			<div id="reviewArea">

				<div style="font-weight: bold;">
					<h1 style="font-weight: 1000; border-left : 7px solid  red;">리뷰</h1>
				</div>
				
				<br>
				<br>
				<br>
				




				<div id="reviews" style="width: 80%; height: auto;">
					<c:forEach items="${reviewList}" var="rl">


						<div id="review">
							<div class="top" style="width: 70%;">
								<div class="top" style="width: auto" id="writer">
									<p id="nickName">${rl.reviewWriter}</p>
								</div>
							</div>
							<div class="top">
								<div id="reviewDate">
									<fmt:formatDate var="createDate" value="${rl.revCreateDt }" pattern="yyyy-MM-dd" />
									<fmt:formatDate var="now" value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd" />
									<c:choose>
										<c:when test="${createDate != now}">
											${createDate }
										</c:when>
										<c:otherwise>
											<fmt:formatDate value="${rl.revCreateDt }" pattern="HH:mm" />
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							<br>
							<br>
							<div id="reviewContent">
								<p>${rl.revContent}
								<p>
							</div>
						</div>
						<br>
						<br>
						<br>

					</c:forEach>
				</div>

			</div>
		</div>
	</div>
</body>

<jsp:include page="../common/footer.jsp" />

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0195b24c7dce0dc71f3dbcf7ca0a12c4&libraries=services,clusterer,drawing"></script>

<script>
	var addr = "${shop.shopAdress}";
	addr = addr.substring(addr.indexOf(',') + 1, addr.lastIndexOf(','));

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다 // 상세 주소
	geocoder
			.addressSearch(
					addr,
					function(result, status) {

						// 정상적으로 검색이 완료됐으면 
						if (status === kakao.maps.services.Status.OK) {

							var coords = new kakao.maps.LatLng(result[0].y,
									result[0].x);

							// 결과값으로 받은 위치를 마커로 표시합니다
							var marker = new kakao.maps.Marker({
								map : map,
								position : coords
							});

							// 인포윈도우로 장소에 대한 설명을 표시합니다
							var infowindow = new kakao.maps.InfoWindow(
									{
										content : '<div style="font-size: 13px;width:150px;text-align:center;padding:6px 0;">${shop.shopName }</div>'
									});
							infowindow.open(map, marker);

							// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							map.setCenter(coords);
						} else {
							console.log(result);
						}
					});

	$(".lesson").on("click", function() {
		var lesNo = $(this).attr("id");
		location.href = "../lesson/view/" + lesNo;
	});
	
	
	// ----------------------- 좋 아 요 -------------------------------
	
	
	var likeFl = "${likeFl}"; // 좋아요 여부 0/1
	var shopNo = ${shop.shopNo}; // 게시글 번호

	$(".like").click(function() {
		
		if("${loginMember}" == ""){
			alert("로그인 후 이용해주세요.");
		
		
		}else{
			var requestUrl;
			var str;
			
			
			if(likeFl == 0){
				requestUrl = "insertLike";
				str = "해당 글을 추천하시겠습니까?";
			}else{
				requestUrl = "deleteLike";
				str = "추천 취소";
			}
			
			if (confirm(str)) {
				$.ajax({
					url : requestUrl,
					data : {"shopNo" : shopNo},
					success : function(result){
						// 좋아요 여부 상태 변경
						if(likeFl == 0){
							likeFl = 1;
							$(".like").attr("src", "${contextPath}/resources/images/boardListImages/fill-heart.png");
						}
						else{
							likeFl = 0;
							$(".like").attr("src", "${contextPath}/resources/images/boardListImages/heart.png");
						}
						
						selectLikeCount();
					},error : function(){
						console.log("좋아요 실패")
					}
				});

			}
		}
	});
	
	
	// 좋아요 개수 카운트
	function selectLikeCount(){
		$.ajax({
			url : "selectLikeCount",
			data : {"shopNo" : shopNo},
			success : function(likeCount){
				$("#likeCount").text(likeCount);
			},error : function(){
				console.log("좋아요 카운트 실패")
			}
		});
	}
	
	$.ajax({
		url : "selectLikeFl",
		data : {"shopNo" : shopNo},
		success : function(likeCount){
			console.log("likeCount" + likeCount)
				likeFl = likeCount;
				if(likeCount == 0){
					$(".like").attr("src", "${contextPath}/resources/images/boardListImages/heart.png");
				}
				else{
					console.log(likeCount)
					$(".like").attr("src", "${contextPath}/resources/images/boardListImages/fill-heart.png");
				}
		},error : function(){
			console.log("좋아요 카운트 실패")
		}
	});
	
</script>

</html>