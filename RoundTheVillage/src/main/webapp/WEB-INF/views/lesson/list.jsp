<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<style>
.filters {
	width: 1200px;
	margin: auto;
}
.filter {
	height: 10%;
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
	height: 1000px;
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
	background-color: #FBBC73;
	border: 0;
	border-radius: 10px;
	width: 110px;
	height: 30px;
	font-size: 15px;
}
.button-category {
	background-color: #F0F0F0;
	font-size: 15px;
	border: 0;
	border-radius: 15px;
}
.select-price {
	border-radius: 10px;
}
.filter-image {
	width: 26px;
	height: 26px;
	margin-right: 10px;
}
</style>
</head>
<body>

<div class="container">
	<div class="filter">
		<div class="filter-select">
			<select class="filter-location">
				<option>시/도 선택</option>
				<option>1111111</option>
			</select>
			<select class="filter-location">
				<option>구/군 선택</option>
				<option>2222222</option>
			</select>
		</div>
		<div class="filter-name"><p><img class="filter-image" src="${contextPath}/resources/images/magnifier.png">지역</p></div>
	</div>
	<div class="filter">
		<div class="filter-select">
		 <button class="button-category">미술</button>
		 <button class="button-category">사진/영상</button>
		 <button class="button-category">요리/음료</button>
		</div>
		<div class="filter-name"><p><img class="filter-image" src="${contextPath}/resources/images/magnifier.png">카테고리</p></div>
	</div>
	<div class="filter">
		<div class="filter-select">
		<form action=""> <!-- 가격 검색 -->
			<input class="select-price" name="minimum"> ~ <input class="select-price" name="maximum">
			<button>검색</button>
		</form>
		</div>
		<div class="filter-name"><p><img class="filter-image" src="${contextPath}/resources/images/magnifier.png">가격</p></div>
	</div>
	
	<div class="search-result">
		<div class="result-top">
			<select class="search-sort">
				<option>정렬</option>
				<option>리뷰순</option>
				<option>별점순</option>
			</select>
		<p>검색결과 ></p>
		</div>
		<div class="result-bottom">
			<div class="result-form">
				<div class="search-info">
					<div class="search-info-main">
						<div class="info-participant">
							25명참가중
						</div>
						<div class="info-price">
							<h4>500000원 ~ 800000원</h4>
						</div>
					</div>
					<p>정연정의 마카롱 클래스</p>
					<p>정연정 베이커리 공방 </p>
					<p>요리/음료</p>
					<p>서울시 강남구 신사 웅앵앵 2층</p>
					<p>010 - 1234 - 5678</p>
				</div>
				<div class="search-image">
					<img src="#" style="background-color: red">
				</div>
			</div>
			
			<div class="result-form">
				<div class="search-info">
					<div class="search-info-main">
						<div class="info-participant">
							25명참가중
						</div>
						<div class="info-price">
							<h4>500000원 ~ 800000원</h4>
						</div>
					</div>
					<p>정연정의 마카롱 클래스</p>
					<p>정연정 베이커리 공방 </p>
					<p>요리/음료</p>
					<p>서울시 강남구 신사 웅앵앵 2층</p>
					<p>010 - 1234 - 5678</p>
				</div>
				<div class="search-image">
					<img src="#" style="background-color: red">
				</div>
			</div>
		</div>
	</div>
</div>

<script>
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

$(".result-form").click(function() {
	location.href = "${contextPath}/lesson/view/1"; // (lessonNo)
});
</script>
</body>
</html>