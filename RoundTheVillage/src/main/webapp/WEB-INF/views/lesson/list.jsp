<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="${contextPath}/resources/js/lesson/list.js"></script>
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
	border-top : 1px solid #5B3929;
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
.search-result {
	border-top: 1px solid #e4e9ef;
	margin-bottom: 50px;
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
	background-color: #F0F0F0;
	border: 0;
	border-radius: 10px;
	width: 150px;
	height: 40px;
	font-size: 15px;
}

select {
  outline:0px;
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
.info-price > h4 {
	text-align: right;
}
</style>
</head>
<body>

<jsp:include page="../common/header.jsp"/>

<div class="container">
<a href="${contextPath}/lesson/insertForm">--------수업등록 제작중-------</a>
	<form action="${contextPath}/lesson/updateForm" method="post" > <input type="hidden" name="lesNo" value="41"><button>수정/삭제</button></form>
	<form action="#" id="filter-form">
	<div class="filter">
		<div class="filter-select">
			<select class="filter-location" name="region" id="addressRegion"></select>
			<select class="filter-location" name="region2" id="addressRegion2"></select>
		</div>
		<div class="filter-name"><p><img class="filter-image" src="${contextPath}/resources/images/magnifier.png">지역</p></div>
	</div>
	<div class="filter-category">
		<div class="filter-select">
		 <button type="button" class="button-category" name="category">미술</button>
		 <button type="button" class="button-category" name="category">사진/영상</button>
		 <button type="button" class="button-category" name="category">요리/음료</button>
		 <button type="button" class="button-category" name="category">뷰티</button>
		 <button type="button" class="button-category" name="category">음악</button>
		 <br><br>
		 <button type="button" class="button-category" name="category">운동</button>
		 <button type="button" class="button-category" name="category">공예</button>
		 <button type="button" class="button-category" name="category">글쓰기</button>
		 <button type="button" class="button-category" name="category">키즈</button>
		 <button type="button" class="button-category" name="category">플라워</button>
		</div>
		<div class="filter-name"><p><img class="filter-image" src="${contextPath}/resources/images/magnifier.png">카테고리</p></div>
	</div>
	<div class="filter">
		<div class="filter-select">
			<input class="select-price" id="minPrice"> ~ <input class="select-price" id="maxPrice">
			<button type="button" id="search-price">검색</button>
		</div>
		<div class="filter-name"><p><img class="filter-image" src="${contextPath}/resources/images/magnifier.png">가격</p></div>
	</div>
	</form>
	
	
	<div class="search-result">
		<div class="result-top">
			<select class="search-sort">
				<option class="option" value="">최신순</option>
				<option class="option" value="higherPrice">높은 가격순</option>
				<option class="option" value="lowerPrice">낮은 가격순</option>
			</select>
		<p>검색결과 ></p>
		</div>
		
		<div class="result-bottom">
		
<c:forEach var="lesson" items="${list}" varStatus="status">
			<div class="result-form" onclick="view(${lesson.lesNo})">
				<div class="search-info">
					<div class="search-info-main">
						<div class="info-participant">
						
 							<c:forEach var="Parti" items="${sumParti}">
								<c:if test="${Parti.lesNo == lesson.lesNo}">
									${Parti.lesParticipant}명참가중
								</c:if>
							</c:forEach>
						
						</div>
						<div class="info-price">
							<h4>${lesson.lesPrice}원</h4>
						</div>
					</div>
					<p>${lesson.lesTitle}</p>
					<p>${lesson.lesCategory}</p>
					
					<c:forEach var="shop" items="${shopList}">
						<c:if test="${lesson.craftshopNo == shop.shopNo}">
							<p>${shop.shopName} </p>
							<p id="shopAddress">${shop.shopAdress.substring(6)}</p>
							<p>${shop.shopContact}</p>
						</c:if>
					</c:forEach>
				</div>
				<div class="search-image">
				
				<c:forEach var="file" items="${fileList}" >
					<c:if test="${lesson.lesNo == file.lesNo}">
						<img src="${contextPath}${file.filePath}/${file.fileName}">
					</c:if>
				</c:forEach>

				</div>
			</div>
</c:forEach>
		
		</div>
		
	</div>
</div>
<jsp:include page="../common/footer.jsp"/>

<script>

var region;
var region2;
var category = [];
var minPrice;
var maxPrice;

var btn = $(".button-category");
btn.click(function() {
	if($(this).hasClass("active")){
		$(this).removeClass("active");
		$(this).css("background-color", "#F0F0F0");
	}
	else {
		$(this).addClass("active");
		$(this).css("background-color", "#FBBC73");
	}
});

function view(lesNo) {
	location.href = "${contextPath}/lesson/view/" + lesNo;
}

function searchLocation(Region) {
 	$.ajax({
      url: "${contextPath}/lesson/search",
      data: {"region": Region, "category": category, "minPrice": minPrice, "maxPrice": maxPrice},
      success: function(map) {
    	  selectList(map);
      },
      error: function() {
          console.log("조회 실패");
      }
  });
}

function searchLocation2(Region, Region2) {
		$.ajax({
	      url: "${contextPath}/lesson/search",
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

$("#search-price").click(function(){
	
	minPrice = $("#minPrice").val()=="" ? 0 : $("#minPrice").val();
	maxPrice = $("#maxPrice").val()=="" ? "9999999999" : $("#maxPrice").val();
	if(Number(minPrice) > Number(maxPrice)) {
		window.alert("가격 범위 최소가격은 가격 범위 최대가격 보다 적어야 합니다.");
	}
	else {
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
	}
});



/*<c:forEach var="lesson" items="${list}" varStatus="status">
			<div class="result-form" onclick="view(${lesson.lesNo})">
				<div class="search-info">
								<div class="search-info-main">
									<div class="info-participant">
			 							<c:forEach var="Parti" items="${sumParti}">
											<c:if test="${Parti.lesNo == lesson.lesNo}">
												${Parti.lesParticipant}명참가중
											</c:if>
										</c:forEach>
									</div>
									<div class="info-price">
										<h4>${lesson.lesPrice}원</h4>
									</div>
								</div>
								<p>${lesson.lesTitle}</p>
								<p>${lesson.lesCategory}</p>
					
								<c:forEach var="shop" items="${shopList}">
									<c:if test="${lesson.craftshopNo == shop.shopNo}">
										<p>${shop.shopName} </p>
										<p id="shopAddress">${shop.shopAdress.substring(6)}</p>
										<p>${shop.shopContact}</p>
									</c:if>
								</c:forEach>
				</div>
				<div class="search-image">
				
				<c:forEach var="file" items="${fileList}" >
					<c:if test="${lesson.lesNo == file.lesNo}">
						<img src="${contextPath}${file.filePath}/${file.fileName}">
					</c:if>
				</c:forEach>

				</div>
			</div>
</c:forEach>*/

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
		var infoprice = $("<div>").addClass("info-price").html("<h4>" + item.lesPrice + "원<h4>");
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

$(".search-sort").change(function(){
	var sort = $(this).val();
	console.log(sort);
	$.ajax({
    url: "${contextPath}/lesson/search",
    data: {"region": region, "category": category, "minPrice": minPrice, "maxPrice": maxPrice, "sort": sort},
    success: function(map) {
  	  selectList(map);
    },
    error: function() {
        console.log("조회 실패");
    }
	})
})


</script>

</body>
</html>