<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>info</title>
<style>
.lesson-content, .lesson-curriculum, .lesson-location {
	border-bottom: 1px solid #e4e9ef;
}
#map {
	width: 500px;
	height: 500px;
}
</style>
</head>
<body>
	<div class="lesson-content">
		<div class="title">수업내용</div>
		${lesson.lesContent}
	</div>
	<div class="lesson-curriculum">
		<div class="title">커리큘럼</div>
		<p>${lesson.lesCurri}</p>
	</div>
	<div class="lesson-location">
		<div class="title">위치</div>
		<div id="map">s</div>
	</div>
	
</body>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0195b24c7dce0dc71f3dbcf7ca0a12c4&libraries=services,clusterer,drawing"> </script>
<script>
var addr = "${shopInfo.shopAdress}";

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
geocoder.addressSearch(addr,function(result, status) {
	console.log(addr);
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
									content : '<div style="font-size: 13px;width:150px;text-align:center;padding:6px 0;">${shopInfo.shopName}</div>'
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
</script>
</html>