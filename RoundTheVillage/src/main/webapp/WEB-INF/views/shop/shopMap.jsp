<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공방 찾기</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
.filters {
	width: 1200px;
	margin: auto;
}

.filter {
	height: 100px;
}

.filter-category {
	height: 200px;
}

.filter-select {
	width: 90%;
	border-top: 1px solid #5B3929;
	float: right;
	padding: 20px 0 25px;
}

.filter-name {
	width: 10%;
}

.container {
	margin-top: 30px;
}

.result-top {
	width: 100%;
	height: 80px;
	padding: 20px 0 25px;
	border-bottom: 1px solid #e4e9ef;
}

.result-bottom {
	width: 100%;
}

.search-sort {
	float: right;
}

.search-image {
	width: 20%;
	height: 100%;
	padding: 10px 20px 10px
}

.search-info {
	width: 78%;
	height: 100%;
	float: right;
}

img {
	width: 100%;
	height: 100%;
}

.result-form {
	width: 100%;
	height: 220px;
	border-bottom: 1px solid #e4e9ef;
	padding: 10px 0 15px;
	cursor: pointer;
}

.search-info-main {
	float: right;
}

.info-participant {
	text-align: right;
	margin-bottom: 50px;
}

.filter-location {
	background-color: #FBBC73;
	border: 0;
	border-radius: 10px;
	width: 150px;
	height: 40px;
	font-size: 15px;
}

.button-category {
	background-color: #F0F0F0;
	font-size: 15px;
	border: 0;
	border-radius: 15px;
	width: 100px;
	height: 60px;
	margin: 0 20px;
}

.select-price {
	border-radius: 10px;
}

.filter-image {
	width: 26px;
	height: 26px;
	margin-right: 10px;
}

#search-price {
	background: #716f6f;
	color: #fff;
	font-size: 14px;
	height: 27px;
	border: 0;
	width: 48px;
	padding: 1px 0 0;
}
</style>
</head>
<body>
<script type="text/javascript" src="../resources/js/lesson/list2.js"></script>
	<jsp:include page="../common/header.jsp" />

	<div class="container">
		<form action="#" id="filter-form">
			<div class="filter">
				<div class="filter-select">
					<select class="filter-location" name="region" id="addressRegion"></select> <select class="filter-location" name="region2" id="addressRegion2"></select>
				</div>
				<div class="filter-name">
					<p>
						<img class="filter-image" src="${contextPath}/resources/images/magnifier.png">지역
					</p>
				</div>
			</div>
		</form>



		<div class="search-result">

			<div>
				<p id="result">검색결과 > </p>
			</div>

			<div>목록 뜨는 곳</div>

			<div>지도 뜨는 부분</div>
			
			
			
			
			
			
			<body>
<p style="margin-top:-12px">
    <em class="link">
        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
            혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요.
        </a>
    </em>
</p>
<div id="map" style="width:100%;height:350px;"></div>


			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
		</div>

	</div>

	<jsp:include page="../common/footer.jsp" />
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0195b24c7dce0dc71f3dbcf7ca0a12c4&libraries=services,clusterer,drawing"></script>

	<script>
	
	
/* 	function selectReplyList(){
		   
		   $.ajax({
		      url : "${contextPath}/shop/selectShopList",
		      type : "post",
		      dataType : "json",
		      success : function(sList){
		    	  
		    	  console.log(sList);
		      
		            
		      }, error : function(){
		         console.log("공방 목록 조회 실패");
		      }
		      
		   });
      */
	
	$(function() {
		mapControl("서울");
		
	})
	
	
	function mapControl(region1) {
		
	
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 1 // 지도의 확대 레벨
		    };  
	
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
	
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(region1, function(result, status) {
	
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
	
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
	
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
		        });
		        infowindow.open(map, marker);
	
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});
		
		
		
		
		var locationArr = ["대전", "부산", "대구", "광주"];
		var positions = [];
		//locationArr.push
		for(var item of locationArr) {
			var geocoder2 = new kakao.maps.services.Geocoder();
			geocoder2.addressSearch(item, function(result, status) {
			     if (status === kakao.maps.services.Status.OK) {
		
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			     // 결과값으로 받은 위치를 마커로 표시합니다
 			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+item+'</div>'
			        });
			        infowindow.open(map, marker);
			        //positions.push({title: item, laslng: new kakao.maps.LatLng(result[0].y, result[0].x)});
			        
		
			    } 
			});
		}
		//console.log(positions);
/* 		
		// 마커를 표시할 위치와 title 객체 배열입니다 
		var positions = [ 
		    {
		        title: '카카오', 
		        latlng: new kakao.maps.LatLng(33.450705, 126.570677)
		    },
		    {
		        title: '생태연못', 
		        latlng: new kakao.maps.LatLng(33.450936, 126.569477)
		    },
		    {
		        title: '텃밭', 
		        latlng: new kakao.maps.LatLng(33.450879, 126.569940)
		    },
		    {
		        title: '근린공원',
		        latlng: new kakao.maps.LatLng(33.451393, 126.570738)
		    }
		]; */

		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
		 
		for (var i = 0; i < positions.length; i ++) {
		    
		    // 마커 이미지의 이미지 크기 입니다
		    var imageSize = new kakao.maps.Size(24, 35); 
		    
		    // 마커 이미지를 생성합니다    
		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		    
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng, // 마커를 표시할 위치
		        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		        image : markerImage // 마커 이미지 
		    });
		}
	}	
	
	



$("#addressRegion").change(function() {
	$("#result").html("검색결과 >" + $(this).val());
	 mapControl($(this).val());
});
$("#addressRegion2").change(function() {
	$("#result").html("검색결과 >" + $("#addressRegion").val() + $(this).val());
	 mapControl($("#addressRegion").val() + " " + $(this).val());
});

function searchLocation2(Region, Region2) {
		$.ajax({
	      url: "${contextPath}/shop/search",
	      data: {"region": Region, "region2":Region2, "category": category, "minPrice": minPrice, "maxPrice": maxPrice},
	      success: function(map) {
	    	  selectList(map);
	      },
	      error: function() {
	    	  console.log("조회 실패");
	      }
	  });
}



</script>

</body>
</html>