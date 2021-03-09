<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공방 찾기</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
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
				<p>검색결과 ></p>
			</div>

			<div>목록 뜨는 곳</div>

			<div>지도 뜨는 부분</div>

		</div>

	</div>

	<jsp:include page="../common/footer.jsp" />

	<script>

var region;
var region2;



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


$(".button-category").click(function(){
	category = [];
	for(var item of $(".button-category.active")) {
		category.push(item.innerHTML);
	}
	$.ajax({
		url: "${contextPath}/lesson/search",
		data: {"region": region, "region2": region2, "category": category, "minPrice": minPrice, "maxPrice": maxPrice},
    success: function(map) {
    	selectList(map);
    },
    error: function() {
    	console.log("조회 실패");
    }
	});
})






function selectList(map) {
	region = $("#addressRegion").val();
	region2 = $("#addressRegion2").val();
	
	$(".result-bottom").html("");
	
	for(var item of map["list"]){
		var resultform = $("<div>", {onclick: "view(" + item.lesNo + ")"}).addClass("result-form");
		var searchinfo = $("<div>").addClass("search-info");
		var searchinfomain = $("<div>").addClass("search-info-main");
		var infoparticipant = $("<div>").addClass("info-participant");
		for(var parti of map["sumParti"]) {
			if(parti.lesNo == item.lesNo) {
				var participant = $("<span>").html(parti.lesParticipant + "명 참가중");
			}
		}
		infoparticipant.append(participant);
		var infoprice = $("<div>").addClass("info-price").html("<h4>" + item.lesPrice + "<h4>");
		searchinfomain.append(infoparticipant).append(infoprice);
		
		var shopName;
		var shopAddress;
		var shopContact;
		for(var shop of map["shopList"]) {
			if(item.craftshopNo == shop.shopNo) {
				shopName = $("<p>").html(shop.shopName);
				shopAddress = $("<p>", {id: "shopAddress"}).html(shop.shopAdress.substring(6));
				shopContact = $("<p>").html(shop.shopContact);
			}
		}
		
		searchinfo.append(searchinfomain).append("<p>" + item.lesTitle + "</p>").append("<p>" + item.lesCategory + "</p>").append(shopName).append(shopAddress).append(shopContact);
		
		var searchimage = $("<div>").addClass("search-image");
		for(var file of map["fileList"]) {
			if(item.lesNo == file.lesNo) {
				var img = $("<img>", {src: "${contextPath}" + file.filePath + "/" + file.fileName});
			}
		}
		searchimage.append(img);
		
		resultform.append(searchinfo).append(searchimage);
		$(".result-bottom").append(resultform);
	}
	
}

</script>

</body>
</html>