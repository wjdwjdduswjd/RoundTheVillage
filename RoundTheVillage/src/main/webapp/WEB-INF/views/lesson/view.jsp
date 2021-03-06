<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view</title>

<!-- <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script> -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.39.0/css/tempusdominus-bootstrap-4.min.css"/>

<style>
body {
	width: 100%;
}
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
	border-radius: 10px;
	overflow: hidden;
	margin : 0;
}
.info-right {
	width: 38%;
	min-height: 500px;
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
	min-width: 666px;
	min-height: 500px;
}
.lesson-info {
	padding: 15px;
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
	width: 1200px;
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
.lesson-participant { 
	padding-bottom: 10px;
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
.lesson-date {
	width: 100px;
	cursor: pointer;
	padding-bottom: 10px;
}
.lesson-date div {
	padding: 0;
}
.lesson-time {
	padding-bottom: 15px;
}
.lesson-calendar {
	position: absolute;
	top: 50%;
	right: 50%;
}
.input-group-text {
	background-color: #FFFFFF;
	border: 0;
}
.fa-calendar {
	color: #212529;	
}
#calendar {
	margin-right: 5px;
}
.time-button {
	display: inline-block;
	background-color: #FFFFFF;
	border: 1px solid #e4e9ef;
	border-radius: 8px;
	width: 60px;
	height: 30px;
	font-weight: bolder;
}
.time-buttons {
	margin-top: 10px;
}
.wrapper {
	margin: 50px 0;
}
.lesson-time > div > span {
	cursor: pointer;
}

.time-list {
	width: 390px;
	height: 70px;
	border: 1px solid #e4e9ef;
	padding: 0 20px;
}
.closed {
	background-color: #f8fafb;
  color: #bfc0c1;
}
#schedule-participant {
	height: 100%;
	line-height: 70px;
	float: right;
}

.schedule-time {
	height: 100%;
	line-height: 70px;
	float: left;
}
.time-list.active2 {
	background-color : #6a82ec;
	color: #FFFFFF
}
.disabled {
	color: #dad8d8 !important;
}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.0/moment.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/locale/ko.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.39.0/js/tempusdominus-bootstrap-4.min.js"></script>

<div class="container">
	<div class="wrapper">
	<div class="info-right">
			<div class="lesson-info-form">
			 <div class="lesson-info info1">
			 	<span class="lesson-loc"><img class="info-image" src="${contextPath}/resources/images/pin.png"></span> <br>
			 	
			 	<script>
			 		$(function(){
			 			var address = "${shopInfo.shopAdress}";
			 			address = address.substring(address.indexOf(',')+1, address.indexOf(" "));
				 		console.log(address);
				 		$(".lesson-loc").append("<span>" + address + "<span>");
			 		});
			 	</script>
			 	
			 	<span class="lesson-name">${lesson.lesTitle}</span>
			 </div>
			 <div class="lesson-info info2">
			 	<div class="lesson-craft">
			 		<img src="${contextPath}/resources/images/home.png">
			 		${shopInfo.shopName}
			 	</div>
			 	<div class="lesson-participant">
			 		<img src="${contextPath}/resources/images/user.png">
			 	</div>
			 	<div class="lesson-date">
			 	
			 	
			 	
			 		<div class="input-group date" id="datetimepicker14" data-target-input="nearest">
	          <div class="input-group-append" data-target="#datetimepicker14" data-toggle="datetimepicker">
	          	<div class="input-group date" id="datetimepicker14" data-target-input="nearest">
                    <input type="hidden" class="form-control datetimepicker-input" data-target="#datetimepicker14"/> <!-- 타입 text → hidden으로 바꾸기 -->
	              <div class="input-group-text" style="background-color: #FFFFFF; border:0"><div class="fa fa-calendar">
									<img id="calendar" src="${contextPath}/resources/images/calendar.png">날짜선택</div>
								</div>
							</div>
	          </div>
          </div>
         
         
         
			 	</div>
			 	<div class="lesson-calendar">
			 	</div>
			 	<div class="lesson-time">
			 		<div style="margin-bottom: 20px"><span><img src="${contextPath}/resources/images/clock.png"> 시간선택 </span></div>
			 	</div>
			 	<div class="lesson-amount">
						<button class="lesson-minus">-</button>
						<div class="lesson-amount-num">1</div>
						<button class="lesson-plus">+</button>
					<div class="lesson-price">${lesson.lesPrice}<span>원</span> </div>
			 	</div>
			 	<div class="lesson-order">
			 		<a href="#">결제하기</a>
			 	</div>
			 </div>
		</div>
	</div>
		<div class="info-left">
			<img class="main-image" src="${contextPath}${file.filePath}/${file.fileName}">
		</div>
	</div>
	<div id="tab-menu">
		  <div id="tab-btn">
		    <ul>
		      <li class="active tapmenu"><a href="#">클래스 정보</a></li>
		      <li class="tapmenu" id="review"><a href="#">후기</a></li>
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



<script type="text/javascript">
	var maxDate = new Date();
	var minDate = new Date();
	minDate.setDate(minDate.getDate() + 1);
	maxDate.setDate(maxDate.getDate() + 30);
	
	var enabledate = [];
	var participant = 0;
	<c:forEach var="item" items="${detailList}">
		enabledate.push("${item.lesDate}");
		participant += ${item.lesParticipant};
	</c:forEach>
	
	$(function() {
	  $('#datetimepicker14').datetimepicker( {
		  //allowMultidate: true,
		  //multidateSeparator: ',',
		  format: 'L',
	 	  locale: 'ko',
		  showMonthAfterYear: true,
			enabledDates: enabledate,
			buttonImageOnly: true,
			dayViewHeaderFormat: 'YYYY년 MMMM'
			//daysOfWeekDisabled : [0,2,4,6],
  	  //maxDate: maxDate,
      //minDate: minDate
	  });
	  
	  $(".lesson-participant").append($("<span>").html("인원수 " + participant + "명"));
	});
	
</script>

<script>
var tabBtn = $("#tab-btn > ul > li");     //각각의 버튼을 변수에 저장
var tabCont = $("#tab-cont > div");       //각각의 콘텐츠를 변수에 저장

var lesNo = ${lesson.lesNo};

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
	$(".lesson-price").html( ${lesson.lesPrice} * Number(amount.text()) + " <span>원</span>"); // 가격 적기
});
minus.click(function() {
	if(amount.text()>1){
		amount.text(Number(amount.text())-1);
		$(".lesson-price").html( ${lesson.lesPrice} * Number(amount.text()) + " <span>원</span>"); // 가격 적기
	}
});


var timeBtn = $(".time-button");
timeBtn.click(function() {
	timeBtn.removeClass("active");
	timeBtn.css("background-color", "#FFFFFF");
	
	if($(this).hasClass("active")){
		$(this).removeClass("active");
		$(this).css("background-color", "#FFFFFF");
	}
	else {
		$(this).addClass("active");
		$(this).css("background-color", "#FBBC73");
	}
});

$(".fa-calendar").click(function() {
	$(".time-list").remove();
})

$(".lesson-time > div > span").click(function(){
	console.log("123");
	$(".time-list").remove();
	$date = $(".datetimepicker-input").val();
	var startTime = [];
	var endTime = [];
	var limit = [];
	var participant = [];
	if(!$date=="") {
		<c:forEach var="item" items="${detailList}">
			if($date=="${item.lesDate}") {
				startTime.push("${item.lesTime}".split(',')[0]);
				endTime.push("${item.lesTime}".split(',')[1]);
				limit.push("${item.lesLimit}");
				participant.push("${item.lesParticipant}");
			}
		</c:forEach>
		for(var i in startTime){
			var $schedule = $("<div>", {id: "schedule"+i, onclick:"func(" + i + ")"});
			var $b;
			if(participant[i] < limit[i]) {
				$b = $("<div>", {id: "schedule-time"}).text("[모집중]" + startTime[i] + " ~ " + endTime[i]);
			} else {
				$b = $("<div>", {id: "schedule-time"}).text("[마감]" + startTime[i] + " ~ " + endTime[i]);
				$schedule.addClass("closed");
			}
			$b.addClass("schedule-time");
			var	$c = $("<div>", {id: "schedule-participant"}).text(participant[i] + " / " + limit[i] + " 명 (최소 1명)");
			
			$schedule.append($b).append($c);
			$schedule.addClass("time-list");
			$(".lesson-time").append($schedule);
		}
	}
});

function func(i) {
	if(!$("#schedule" + i).hasClass("closed")){
		$(".time-list").removeClass("active2");
		$("#schedule" + i).addClass("active2");
	}
}

$("#review").click(function(){
	selectReview();
});


</script>
</body>
</html>