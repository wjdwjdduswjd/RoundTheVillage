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
<link rel="stylesheet" href="${contextPath}/resources/css/lesson/view.css"/>


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
				 		$(".lesson-loc").append("<span>" + address + "<span>");
			 		});
			 	</script>
			 	
			 	<span class="lesson-name">${lesson.lesTitle}</span>
			 </div>
			 <div class="lesson-info info2">
			 	<div class="lesson-craft">
			 		<img src="${contextPath}/resources/images/home.png">
			 		<a href="${contextPath}/shop/${shopInfo.shopNo}">${shopInfo.shopName}</a>
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
		console.log(enabledate);
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
	var participant = $(".active2 > #schedule-participant").text();
	if(Number(participant.substring(participant.indexOf("/")+2, 5)) - Number(participant.substring(0, participant.indexOf("/")-1)) > Number(amount.text())){
		amount.text(Number(amount.text())+1);
		$(".lesson-price").html( ${lesson.lesPrice} * Number(amount.text()) + " <span>원</span>"); // 가격 적기
	}
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
	$(".time-list").remove();
	$date = $(".datetimepicker-input").val();
	var startTime = [];
	var endTime = [];
	var limit = [];
	var participant = [];
	var detNo = [];
	if(!$date=="") {
		<c:forEach var="item" items="${detailList}">
			if($date=="${item.lesDate}") {
				startTime.push("${item.lesTime}".split(',')[0]);
				endTime.push("${item.lesTime}".split(',')[1]);
				limit.push("${item.lesLimit}");
				participant.push("${item.lesParticipant}");
				detNo.push("${item.detNo}");
			}
		</c:forEach>
		var timelistarea = $("<div>").addClass("time-list-area");
		for(var i in startTime){
			var $schedule = $("<div>", {id: "schedule"+i, onclick:"func(" + i + ")"}).val(detNo[i]);
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
			
			timelistarea.append($schedule);
		}
		$(".lesson-time").append(timelistarea)
	}
});

function func(i) {

	if(!$("#schedule" + i).hasClass("closed")){
		$(".lesson-amount-num").html("1");
		$(".lesson-price").html( ${lesson.lesPrice} * Number(amount.text()) + " <span>원</span>");
		$(".time-list").removeClass("active2");
		$("#schedule" + i).addClass("active2");
	}
}

$("#review").click(function(){
	selectReview();
});


$(".lesson-order").click(function() {
	if(${!empty loginMember}) {
		var lesDate = $(".datetimepicker-input").val();
		var lesAmount = $(".lesson-amount-num").html();
		var lesTime = $(".active2 > .schedule-time").html().substring(5, 10) + "," + $(".active2 > .schedule-time").html().substring(13);
		location.href = "${contextPath}/pay/" + lesNo + "?lesAmount=" + lesAmount + "&lesTime=" + lesDate+ "." + lesTime;
	} else {
		alert("로그인 후 이용할 수 있습니다");
		location.href = "${contextPath}/member/login";
	}
});

</script>
</body>
<jsp:include page="../common/footer.jsp"/>
</html>