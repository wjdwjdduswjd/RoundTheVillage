<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공방 상세 조회</title>
<title>html문서 제목</title>
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
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />



	<div class="container" style="margin-top: 50px">


		<div>
			<div class="top" style="width: 90%;">

				<div class="top" id="shopname" style="width: auto">
					<p>
						<h1 style="font-weight: bold;">${shop.shopName }</h1>
					</p>
				</div>
				<div class="top" id="category" style="width: auto; font-size: 15px;">

					<p>${shop.shopCategoryName }</p>
				</div>
			</div>

			<div class="top">

				<div class="likeArea" id="like">
					<p>${csGoodCount}</p>
				</div>
			</div>

		</div>

		<div style="font-size: 10px;">


			<div class="top" style="width: auto;">
				<p>별점</p>

			</div>
			<div class="top" style="width: auto;">

				<p>점수</p>
			</div>
			|
			<div class="top" style="width: auto;">
				<p>별점 참여자수</p>
			</div>


		</div>


		<div class="top">
			<img id="shopImg" name="thumbnail" width="800" height="200">
		</div>

    <a class="btn btn-success float-right" href="" style="background-color: #fbbc73; border-color: #fbbc73;">수정</a>




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
							${shop.shopInfo}
						</div>

					<div class="row mb-3 form-row">

						<div class="col-md-3" id="infotitle">
							<label for="contact">연락처</label>
						</div>
						<div class="col-md-6">${shop.shopContact}</div>
					</div>
					<div class="row mb-3 form-row">

						<div class="col-md-3" id="infotitle">
							<label for="address">위치</label>
						</div>

						<div id="map"  style="width:400px; height:400px;"></div>

					</div>

				</div>

			</div>

			<hr>

			<div id="classArea">

				<div style="font-weight: bold;">
					<h1>수업 목록</h1>
				</div>



				<div id="classImg">
					<div style="width: 260px; height: 260px;">
						<a href=""> <img style="width: 260px; height: 260px;">
						</a>
					</div>

				</div>

				<div id="classImg">
					<div style="width: 260px; height: 260px;">
						<a href=""> <img style="width: 260px; height: 260px;">
						</a>
					</div>

				</div>

				<div id="classImg">
					<div style="width: 260px; height: 260px;">
						<a href=""> <img style="width: 260px; height: 260px;">
						</a>
					</div>


				</div>

				<div id="classImg">
					<div style="width: 260px; height: 260px;">
						<a href=""> <img style="width: 260px; height: 260px;">
						</a>
					</div>

				</div>

				<div id="classImg">
					<div style="width: 260px; height: 260px;">
						<a href=""> <img style="width: 260px; height: 260px;">
						</a>
					</div>

				</div>

				<div id="classImg">
					<div style="width: 260px; height: 260px;">
						<a href=""> <img style="width: 260px; height: 260px;">
						</a>
					</div>

				</div>


			</div>



			<hr>

			<div id="reviewArea">

				<div style="font-weight: bold;">
					<h1>후기</h1>
				</div>

				<div id="review" style="width: 80%; height: auto;">
					<div>

						<div class="top" style="width: 70%;">
							<div class="top" style="width: auto">
								<h5>닉네임</h5>
							</div>
							<div class="top" style="width: auto">별점</div>
						</div>


						<div class="top">

							<div>날짜</div>
						</div>
					</div>

					<div>마카롱 클래스가 처음이라 잔뜩 기대하고 갔어요. 근데 수업이 기대 이상으로 너무 재밌었어요👍🏻 선생님의 유머감각ㅋㅋ과 부족한 부분이 있으면 친절하게 설명해주시는 것도 너무 좋았구요. 마카롱이 디저트 중 만드는게 고난도라 어렵겠다 생각하고 갔는데 선생님이 어려운 부분은 잘 알려주셔서 전혀 어렵지 않고 즐기면서 할 수 있었어요 ◡̈ 완성된 마카롱은 수강생분들과 교환할 수 있어서 여러가지 맛으로 가져갈 수 있구용~! 다른 클래스와 비교했을 때 가격도 저렴한 편이라 마카롱 15개 + 추억생각하시면 완전 가성비 굿이라고 생각합니당! ☺️ (리뷰 잘 안남기는데 너무 만족해서 남겨요 ㅎㅎ)</div>
				</div>


			</div>


		</div>
	</div>
</body>

<jsp:include page="../common/footer.jsp" />

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0195b24c7dce0dc71f3dbcf7ca0a12c4&libraries=services,clusterer,drawing"></script>

<script>
	var addr = "${shop.shopAdress}";
	addr = addr.substring(addr.indexOf(',')+1 , addr.lastIndexOf(','));

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
	geocoder.addressSearch(addr,function(result, status) {

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
</script>

</html>