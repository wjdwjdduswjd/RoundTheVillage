<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<jsp:include page="../common/header.jsp"/>
<div class="container">
<a href="${contextPath}/lesson/insertForm">--------수업등록 제작중-------</a>
	
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
				<option>정렬</option>
				<option>리뷰순</option>
				<option>별점순</option>
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

$(function(){
    areaSelectMaker("#addressRegion");
});

var areaSelectMaker = function(target){
    if(target == null || $(target).length == 0){
        console.warn("Unkwon Area Tag");
        return;
    }

    var area = {
            "서울특별시" : [ "강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구" ],
            "경기도" : [ "수원시 장안구", "수원시 권선구", "수원시 팔달구", "수원시 영통구", "성남시 수정구", "성남시 중원구", "성남시 분당구", "의정부시", "안양시 만안구", "안양시 동안구", "부천시", "광명시", "평택시", 
                        "동두천시", "안산시 상록구", "안산시 단원구", "고양시 덕양구", "고양시 일산동구", "고양시 일산서구", "과천시", "구리시", "남양주시", "오산시", "시흥시", "군포시", "의왕시", "하남시", 
            						"용인시 처인구", "용인시 기흥구", "용인시 수지구", "파주시", "이천시", "안성시", "김포시", "화성시", "광주시", "양주시", "포천시", "여주시", "연천군", "가평군", "양평군" ],
            "인천광역시" : [ "계양구", "미추홀구", "남동구", "동구", "부평구", "서구", "연수구", "중구", "강화군", "옹진군" ],			
            "강원도" : [ "춘천시", "원주시", "강릉시", "동해시", "태백시", "속초시", "삼척시", "홍천군", "횡성군", "영월군", "평창군", "정선군", "철원군", "화천군", "양구군", "인제군", "고성군", "양양군" ],			
            "충청북도" : [ "청주시 상당구", "청주시 서원구", "청주시 흥덕구", "청주시 청원구", "충주시", "제천시", "보은군", "옥천군", "영동군", "증평군", "진천군", "괴산군", "음성군", "단양군" ],
            "충청남도" : [ "천안시 동남구", "천안시 서북구", "공주시", "보령시", "아산시", "서산시", "논산시", "계룡시", "당진시", "금산군", "부여군", "서천군", "청양군", "홍성군", "예산군", "태안군" ],
            "대전광역시" : [ "대덕구", "동구", "서구", "유성구", "중구" ],
            "세종특별자치시" : [ "세종특별자치시" ],			
            "전라북도" : [ "전주시 완산구", "전주시 덕진구", "군산시", "익산시", "정읍시", "남원시", "김제시", "완주군", "진안군", "무주군", "장수군", "임실군", "순창군", "고창군", "부안군" ],
            "전라남도" : [ "목포시", "여수시", "순천시", "나주시", "광양시", "담양군", "곡성군", "구례군", "고흥군", "보성군", "화순군", "장흥군", "강진군", "해남군", "영암군", "무안군", "함평군", "영광군", "장성군", "완도군", "진도군", "신안군" ],
            "광주광역시" : [ "광산구", "남구", "동구", "북구", "서구" ],			
            "경상북도" : [ "포항시 남구", "포항시 북구", "경주시", "김천시", "안동시", "구미시", "영주시", "영천시", "상주시", "문경시", "경산시", "군위군", "의성군", "청송군", "영양군", "영덕군", "청도군", "고령군", "성주군", "칠곡군", "예천군", "봉화군", "울진군", "울릉군" ],
            "경상남도" : [ "창원시 의창구", "창원시 성산구", "창원시 마산합포구", "창원시 마산회원구", "창원시 진해구", "진주시", "통영시", "사천시", "김해시", "밀양시", "거제시", "양산시", "의령군", "함안군", "창녕군", "고성군", "남해군", "하동군", "산청군", "함양군", "거창군", "합천군" ],
            "부산광역시" : [ "강서구", "금정구", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구", "중구", "해운대구", "기장군" ],
            "대구광역시" : [ "남구", "달서구", "동구", "북구", "서구", "수성구", "중구", "달성군" ],
            "울산광역시" : [ "남구", "동구", "북구", "중구", "울주군" ],			
            "제주특별자치도" : [ "서귀포시", "제주시" ]			
    };

    for(i=0; i<$(target).length; i++){
        (function(z){
            var a1 = $(target).eq(z);
            var a2 = a1.next();

            //초기화
            init(a1, true);

            //권역 기본 생성
            var areaKeys1 = Object.keys(area);
            areaKeys1.forEach(function(Region){
                a1.append("<option value="+Region+">"+Region+"</option>");
            });


           

            //변경 이벤트
            $(a1).on("change", function(){
            		//$(this).prop('selected', true);
                init($(this), false);
                var Region = $(this).val();
                searchLocation(Region);
                var keys = Object.keys(area[Region]);
                keys.forEach(function(Do){
                    a2.append("<option value="+area[Region][Do]+">"+area[Region][Do]+"</option>");
                });
            });

            $(a2).on("change", function() {
                var Region = $(a1).val();
                var Region2 = $(this).val();
                searchLocation2(Region, Region2);
            });
        })(i);        

        function init(t, first){
            first ? t.empty().append("<option value=''>선택</option>") : "";
            t.next().empty().append("<option value=''>선택</option>");
            t.next().next().empty().append("<option value=''>선택</option>");
        }
    }
}
</script>
</body>
</html>