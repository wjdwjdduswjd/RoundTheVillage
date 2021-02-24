<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>


<style>
* {padding: 0; margin: 0;}
a {text-decoration: none !important; color: #666;}
a:hover {
	color: #666;
}
p {
	margin-bottom: 0;
}
li {list-style: none;}
#tab-menu {
	border-top: 1px solid black;
  border-radius: 4px;
  margin-top: 20px;
}
#tab-btn ul {
  overflow: hidden;
}
#tab-btn li {
  float: left; 
  text-align: center;
}
#tab-btn li a {
  display: block;
  padding: 15px 20px; 
  font-weight: bold;
}
#tab-btn li.active a {
  border-top: 3px solid black;
  color: #BD6700;
}

#tab-cont {
  width: 100%; 
  background: #fff; padding: 20px; 
  box-sizing: border-box;
  border-radius: 0 0 4px 4px;
}
.info-left {
	width: 60%;
	height: 450px;
	border-radius: 10px;
	overflow: hidden;
	margin : 0;
}
.info-right {
	width: 38%;
	height: 450px;
	padding: 22px;
  border: 1px solid #e4e9ef;
  box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.1);
  border-radius: 10px;
  padding: 0;
  float: right;
}
.main-image {
	width: 100%;
	height: 100%;
}
.lesson-info {
	padding: 20px;
}
.info1 {
	border-bottom: 1px solid #e4e9ef;
}
.lesson-loc {
	font-size: 18px;
	color: #DD5509;
}
.tapmenu {
	width: 25%
}
.container {
	margin-top: 30px;
}
.title {
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 15px;
}
.info-image {
	width: 22px;
	height: 22px;
	margin-right: 5px;
}
.lesson-name {
	font-size: 25px;
	font-weight: bold;
}
.info2 {
	position: relative;
}
.info2 div {
	padding: 8px 0;
}
.info2 img {
	width: 18px;
	height: 18px;
}
.lesson-craft {
	position: absolute;
	right: 20px;
}
.lesson-amount {
	margin: 20px 0;
}
.lesson-amount-num {
	padding: 0 !important;
	width: 34px;
	display: inline-block;
	text-align: center;
	height: 24px;
  font-weight: bold;
  vertical-align: middle;
}
.lesson-amount > button {
		display: inline-block;
		background-color: #ffffff;
    border-radius: 3px;
    border: 1px solid #b0bbc9;
    color: #b0bbc9;
    font-size: 18px;
    height: 24px;
    line-height: 18px;
    width: 24px;
    text-align: center;
    vertical-align: middle;
}
.lesson-price {
	float: right;
	font-size: 26px;
	font-weight: bold;
}
.lesson-order {
	
}
.lesson-order > a{
    display: block;
    height: 50px;
    line-height: 50px;
    width: 380px;
    margin: 0 auto;
    background-color: #73dbc6;
    text-align: center;
    color: #ffffff;
    font-weight: bold;
}
.lesson-price > span {
	font-weight: normal;
	font-size: 16px;
}
</style>
</head>
<body>

<div class="container">
	<div>
	<div class="info-right">
			<div class="lesson-info-form">
			 <div class="lesson-info info1">
			 	<p class="lesson-loc"><img class="info-image" src="${contextPath}/resources/images/pin.png">삼청동</p>
			 	<p class="lesson-name">플라워 원데이 클래스</p>
			 </div>
			 <div class="lesson-info info2">
			 	<div class="lesson-craft">
			 		<img src="${contextPath}/resources/images/home.png">
			 		찐팅허 꽃집
			 	</div>
			 	<div class="lesson-participant">
			 		<img src="${contextPath}/resources/images/user.png">
			 		인원수 n 명
			 	</div>
			 	<div class="lesson-date">
			 		<img src="${contextPath}/resources/images/calendar.png">
			 		날짜선택
			 	</div>
			 	<div class="lesson-time">
			 		<img src="${contextPath}/resources/images/clock.png">
			 		시간선택
			 	</div>
			 	<div class="lesson-button">
					<input type="checkbox"> 원데이클래스
					<input type="checkbox"> 정기권
			 	</div>
			 	<div class="lesson-amount">
						<button class="lesson-minus">-</button>
						<div class="lesson-amount-num">1</div>
						<button class="lesson-plus">+</button>
					<div class="lesson-price">55,000 <span>원</span> </div>
			 	</div>
			 	<div class="lesson-order">
			 		<a href="#">결제하기</a>
			 	</div>
			 </div>
		</div>
	</div>
		<div class="info-left">
			<img class="main-image" src="${contextPath}/resources/images/flower.jpg">
		</div>
	</div>
	<div id="tab-menu">
		  <div id="tab-btn">
		    <ul>
		      <li class="active tapmenu"><a href="#">클래스 정보</a></li>
		      <li class="tapmenu"><a href="#">후기</a></li>
		      <li class="tapmenu"><a href="#">문의</a></li>
		      <li class="tapmenu"><a href="#">환불 및 취소</a></li>
		    </ul>
		  </div>
		  <div id="tab-cont">
		    <div><jsp:include page="info.jsp"/></div>
		    <div><jsp:include page="review.jsp"/></div>
		    <div><jsp:include page="question.jsp"/></div>
		    <div><jsp:include page="policy.jsp"/></div>
		  </div>
		</div>
		
</div>
<script>
var tabBtn = $("#tab-btn > ul > li");     //각각의 버튼을 변수에 저장
var tabCont = $("#tab-cont > div");       //각각의 콘텐츠를 변수에 저장

tabCont.hide().eq(0).show();

tabBtn.click(function(){
  var target = $(this);         //버튼의 타겟(순서)을 변수에 저장
  var index = target.index();   //버튼의 순서를 변수에 저장
  tabBtn.removeClass("active");    //버튼의 클래스를 삭제
  target.addClass("active");       //타겟의 클래스를 추가
  tabCont.css("display","none");
  tabCont.eq(index).css("display","block");
});

var plus = $(".lesson-plus");
var minus = $(".lesson-minus");
var amount = $(".lesson-amount-num");
plus.click(function() {
	amount.text(Number(amount.text())+1);
});
minus.click(function() {
	if(amount.text()>1){
		amount.text(Number(amount.text())-1);
	}
});
</script>
</body>
</html>