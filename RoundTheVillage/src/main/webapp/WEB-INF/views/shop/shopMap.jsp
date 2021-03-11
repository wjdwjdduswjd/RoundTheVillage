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

#addressList > li{
	list-style-type: none;
}

#addressList > li:hover{
	cursor: pointer;
background-color: #FBBC73;
  color : white;
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

			<div class="row">
				<div class=" col-4"  style= "overflow:auto; height:500px;">
					<ul id="addressList" class="mt-4">
					</ul>
				</div>
				
				<div class="col-8">
			
					
					<div id="map" style="width:100%;height:500px;"></div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp" />
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0195b24c7dce0dc71f3dbcf7ca0a12c4&libraries=services,clusterer,drawing"></script>

	<script>
	
	
	$("#addressRegion2").on("change",selectShopList);
	
	
	var addrList = [];
	
	function selectShopList(){
		   
	   $.ajax({
	      url : "${contextPath}/shop/selectShopList",
	      type : "post",
	      data : {"region1" : $("#addressRegion").val(),  
	    	  			"region2" : $("#addressRegion2").val()
	    	  		  },
	      dataType : "json",
	      success : function(sList){
	    	  
	    	  console.log(sList);
	    	  
	    	  addrList = [];
	    	  
	    	  for(var i=0 ; i<sList.length ; i++){
	    		  var obj = {};
	    		  obj.shopName = sList[i].shopName;
	    		  
	    		  var addr = sList[i].shopAdress;
	    		  obj.addr = addr.substring(addr.indexOf(',') + 1, addr.lastIndexOf(','));
	    		  addrList.push(obj);
	    	  }
	    	  
	    	  console.log(addrList);
	    	  
	    	  // 지도 만들고 마커찍고 이동하기
	    	  createMap(addrList);
	    	  
	    	  // li태그 만들어서 목록에 넣기
	    	  $("#addressList").html(""); // 이전값 삭제
	    	  
	    	  for(var i=0 ; i<sList.length ; i++){
		    	  $li = $("<li class = 'list'>").attr("id", sList[i].shopNo);
		    	  $p1 = $("<p>");
		    	  $span1 = $("<span style='font-size:20px; font-weight:bold;'>").text(sList[i].shopName);
		    	  $span2 = $("<span>").text(sList[i].shopCategoryName);

		    	  $p1.append($span1, $span2);
		    	  
		    	  $p2 = $("<p>").text(sList[i].shopAdress); // 주소
		    	  
		    	  $li.append($p1, $p2);
		    	 
		    	  $("#addressList").append($li);
	    	  }
	            
	      }, error : function(){
	         console.log("공방 목록 조회 실패");
	      }
	   });
	}
	
		
	// 맵 만드는 함수
	function createMap(addrList){
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 5 // 지도의 확대 레벨
	    };  

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
	
		// 주소-좌표 변환 객체를 생성합니다
		for(var i=0 ; i<addrList.length ; i++){
			//console.log(addrList[i].shopName)
			//console.log(addrList[i].addr)
			
			getLocation(function(latlng, shopName){
				console.log(latlng);
				
				// 결과값으로 받은 위치를 마커로 표시합니다
		    var marker = new kakao.maps.Marker({
		        map: map,
		        position: latlng,
		        title : shopName
		    });
		
		    // 인포윈도우로 장소에 대한 설명을 표시합니다
		    var infowindow = new kakao.maps.InfoWindow({
		        content: '<div style="width:150px;text-align:center;padding:6px 0;">'+shopName+'</div>'
		    });
		    infowindow.open(map, marker);
		
		    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		    map.setCenter(latlng);
				
			}, addrList[i].addr, addrList[i].shopName);
	
		}
	}
	
	
	// 주소를 가지고 좌료 얻어오기
	function getLocation(callbackFn, addr, shopName){
		var geocoder = new kakao.maps.services.Geocoder();
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(addr, function(result, status) {
	
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
	
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
		        callbackFn(coords, shopName);
		    } 
		});  
	}
		
		
		
	$(document).on("click", "#addressList > li", function(){
		//console.log($(this).attr("id"));
		location.href = $(this).attr("id");
	});	
		
		
		
		
		
	



$("#addressRegion").change(function() {
	$("#result").html("검색결과 >" + $(this).val());
	 /* mapControl($(this).val()); */
});
$("#addressRegion2").change(function() {
	$("#result").html("검색결과 >" + $("#addressRegion").val() + $(this).val());
	/*  mapControl($("#addressRegion").val() + " " + $(this).val()); */
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