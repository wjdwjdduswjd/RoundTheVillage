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
}

.btnArea:hover {
	border-bottom: black;
	color: red;
}

#map {
	width: 500px;
	height: 500px;
}

#infoArea {
	margin-top: 50px;
	margin-bottom: 20px;
	font-size: 12px;
}

#infotitle {
	text-align: center;
	font-weight: bold;
}

#classImg {
	padding: 20px 20px 20px 20px;
	display: inline-block
}

#review {
	padding: 20px 20px 20px 20px;
}

.boardImg {
	width: 400px;
	height: 280px;
}

.boardImg>img {
	width: 100%;
	height: 100%;
}

.lesson {
	padding: 30px;
	cursor: pointer;
}

.lesson>img {
	height: 100%;
	width: 100%;
}

.lesson>p {
	text-align: center;
}

.like {
	width: 20px;
	height: 20px;
}

</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />



	<div class="container" style="margin-top: 50px">


		
			<div class="top" style="width: 90%;">

				<div class="top" id="shopname" style="width: auto">
					<p>
					<h1 style="font-weight: bold;">${shop.shopName}</h1>
					</p>
				</div>
				<div class="top" id="category" style="width: auto; font-size: 15px;">

					<p>${shop.shopCategoryName}</p>
				</div>
			</div>


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

			<div style="font-size: 10px;">


				<div class="top" style="width: auto;">
					<p>별점</p>

				</div>
				<div class="top" style="width: auto;">
					<p>${shop.avgRating}</p>
				</div>
				|
				<div class="top" style="width: auto;">
					<p>별점 참여자수 : ${shop.participantsCount }</p>
				</div>


			</div>

			<!-- 썸네일 -->
			<div class="top">
				<label>썸네일</label>
				<div class="boardImg" id="titleImgArea">
					<img src="${contextPath}${thumb.filePath}/${thumb.fileName}">
				</div>
			</div>

			<c:if test="${(loginMember != null) && (shop.shopNo == loginMember.memberNo)}">
				<a class="btn btn-success float-right" href="${contextPath}/shop/update/${shop.shopNo}" style="background-color: #fbbc73; border-color: #fbbc73;">수정</a>
			</c:if>



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
					<div style="font-weight: bold;">
						<h1>공방 정보</h1>
					</div>

					<br>

					<div style="font-size: 12px">


						<div class="row mb-3 form-row">

							<div class="col-md-3" id="infotitle">
								<label for="infoshop">공방소개</label>
							</div>
							<div class="col-md-7" style="height: auto;">
								<%
								pageContext.setAttribute("newLine", "\n");
								%>

								${fn:replace(shop.shopInfo , newLine, "<br>" ) }
							</div>

						</div>

						<div class="row mb-3 form-row">

							<div class="col-md-3" id="infotitle">
								<label for="contact">연락처</label>
							</div>
							<div class="col-md-7">${shop.shopContact}</div>
						</div>


						<div class="row mb-3 form-row">

							<div class="col-md-3" id="infotitle">
								<label for="address">위치</label>
							</div>

							<div class="col-md-7">${shop.shopAdress}</div>



							<div id="map" style="width: 400px; height: 400px;"></div>

						</div>

					</div>

				</div>

				<hr>

				<div id="classArea">

					<div style="font-weight: bold;">
						<h1>수업 목록</h1>
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
										<form action="${contextPath}/lesson/updateForm" method="post"> <input type="hidden" name="lesNo" value="${lesson.lesNo}"><button>수정/삭제</button></form>
									</div>
								</c:if>
							</c:forEach>

						</c:forEach>

						<!-- </div> -->
					</div>

				</div>



				<hr>

				<div id="reviewArea">

					<div style="font-weight: bold;">
						<h1>후기</h1>
					</div>

					<div id="review" style="width: 80%; height: auto;">
						<c:forEach items="${reviewList}" var="rl">
							<div>
								<div class="top" style="width: 70%;">
									<div class="top" style="width: auto">
										<h5>${rl.reviewWriter}</h5>
									</div>
									<div class="top" style="width: auto">별점</div>
								</div>
								<div class="top">
									<div>${rl.revCreateDt}</div>
								</div>
							</div>
							<div>${rl.revContent}</div>
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