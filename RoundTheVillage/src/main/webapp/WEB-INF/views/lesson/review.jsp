<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>review</title>
<style>
.rating {
	float: right;
	border-left: 1px solid #e4e9ef;
}
.reviewtotal, .rating {
	width: 50%;
	height: 100px;
	color: #686666;
	text-align: center;
}
.review-write {
	border: 1px solid #979797;
	width: 95%;
	margin: auto;
}
.stars {
	border-bottom: 1px solid #979797;
	padding: 10px 0 10px;
	padding-left: 15px;
}
.star {
	background: url("../../resources/images/star1.png");
} 
.star.on {
	background: url('../../resources/images/star2.png');
}
.star, .star.on{
  background-size: auto 100%;
  width: 25px;
  height: 25px;
  display: inline-block;
  cursor: pointer;
}
.review-text {
	width: 100%;
	min-height: 130px;
	font-size: 18px;
}
textarea {
	border: 0;
	padding: 10px;
	width: 100%;
	height: 100%;
	resize:none;
	overflow: hidden;
}
textarea:focus {
  outline: none;
}
.review-button {
	height: 50px;
	border-top: 1px solid #979797;
}
.review-submit {
	width: 100px;
	height: 100%;
	float: right;
	background-color: #F6B60E;
	border: 0;
	color: #FFFFFF;
}
.review {
	margin-top: 30px;
	border-top: 1px solid #c7c7c7;
}
.review > div {
	padding-left: 10px;
}
.review-name-star {
	border-left: 5px solid #FBBC73;
	margin: 10px 0 10px;
}
.review-name-star > div {
	display: inline-block;
	
}
.review-name {
	font-weight: bold;
	font-size: 20px;
	margin-right: 15px;
}
.review-star {
}
.review-time {
}
.review-content {
	padding: 20px;
	padding-bottom: 0;
}
.review-update-delete-button {
}
.review-update-delete-button > button {
	background-color: #FFFFFF;
	color: #7A7A7A;
	border: 0;
	font-size: 12px;
	padding-right: 10px;
}
.review-update {
	margin: 0 10px;
}
.close-update {
	float: right;
}
.review-update-content {
	border: 1px solid #E5E5E5;
}
.review-update-text {
	width: 100%;
	min-height: 80px;
	padding: 16px;
}
.review-update-button {
	width: 80px;
	height: 40px;
	float: right;
	border: none;
	padding: 0;
	margin: 0;
	background-color: #F6B60E;
	color: #FFFFFF;
}
.update-button-area {
		border: 1px solid #E5E5E5;	
    height: 42px;
    line-height: 42px;
}
.close-update {
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="title">
		오신분들의 후기
	</div>
	<div class="reviewtotal-rating">
		<div class="rating">
			<div>평점</div>
			<div style="font-size: 35px; color: black" class="averageRating">(리뷰점수)</div>
		</div>
		<div class="reviewtotal">
			<div>클래스 후기</div>
			<div style="font-size: 35px; color: black" class="reviewcount">(후기개수)</div>
		</div>
	</div>
	
	<div class="title">
		후기작성
	</div>
		<div class="review-write">
			<form action="#">
				<div class="stars">
					<span class="star on"></span>
					<span class="star"></span>
					<span class="star"></span>
					<span class="star"></span>
					<span class="star"></span>
				</div>
				<div class="review-text">
					<textarea onkeydown="resize(this)" onkeyup="resize(this)" placeholder="후기를 입력하세요" id="revContentText"></textarea>
				</div>
				<div class="review-button">
					<button type="button" class="review-submit">등록</button>
				</div>
			</form>
		</div>
		<div class="review-list">
			<div class="review">
				<div class="review-name-star">
					<div class="review-name">진선</div>
					<div class="review-star">별</div>
				</div>
				<div class="review-time">2020.02.16  15:48</div>
				<div class="review-content">워후~ 정말루 재밌네요. 제 인생이 바뀌었습니다~야호~!  여기가 바로 후기 맛집,,,~~!!^^ 호로로록
				워후~ 정말루 재밌네요. 제 인생이 바뀌었습니다~야호~!  여기가 바로 후기 맛집,,,~~!!^^ 호로로록워후~ 정말루 재밌네요. 제 인생이 바뀌었습니다~야호~!  
				여기가 바로 후기 맛집,,,~~!!^^ 호로로록워후~ 정말루 재밌네요. 제 인생이 바뀌었습니다~야호~!  여기가 바로 후기 맛집,,,~~!!^^ 호로로록</div>
				<div class="review-update-delete-button">
					<button>수정</button>
					<button>삭제</button>
					<button>신고하기</button>
				</div>
				
				<div class="review-update" style="display:none">
					<div style="height:24px;"><a class="close-update"> Ⅹ</a></div>
					<div class="review-update-content">
						<textarea class="review-update-text" onkeydown="resize(this)" onkeyup="resize(this)"></textarea>
					</div>
					<div class="update-button-area"><button class="review-update-button">후기 수정</button></div>
				</div>
				
			</div>
		
			<div class="review">
				<div class="review-name-star">
					<div class="review-name">진선</div>
					<div class="review-star">별</div>
				</div>
				<div class="review-time">2020.02.16  15:48</div>
				<div class="review-content">혹시 액션이 어떻게 되는지 아세요? 무한~~ <br> 무야~호~ 뭐~ <br> 그만큼 신나시는거지~ </div>
				<div class="review-update-delete-button">
					<button class="updateButton">수정</button>
					<button>삭제</button>
					<button>신고하기</button>
				</div>
			</div>
		</div>
		

<script>
$('.stars span').click(function(){
  $(this).parent().children('span').removeClass('on');
  $(this).addClass('on').prevAll('span').addClass('on');
  return false;
});

function resize(obj) {
	  obj.style.height = "1px";
	  obj.style.height = (12+obj.scrollHeight)+"px";
}

function selectReview() {
	
	$.ajax({
		url: "${contextPath}/lesson/selectReview/" + lesNo,
		type: "post",
		success: function(list) {
			
			var reviewArea = $(".review-list");
			reviewArea.html("");
			var averageRating = 0;
			$.each(list, function(index, item) {
				
				var review = $("<div>",{id:"review"+item.revNo}).addClass("review");
				var reviewnamestar = $("<div>").addClass("review-name-star");
				var reviewname = $("<div>").addClass("review-name").html(item.reviewWriter);
				
				var stars = "";
				for(var i=0; i<item.revRating; i++){
					stars += "<img src='${contextPath}/resources/images/star2.png' width='15px'/>";
				}
				for(var i=0; i<5-item.revRating; i++){
					stars += "<img src='${contextPath}/resources/images/star1.png' width='13px'/>";
				}
				var reviewstar = $("<div>").addClass("review-star").html(stars);
				reviewnamestar.append(reviewname).append(reviewstar);
				
				var reviewtime = $("<div>").addClass("review-time");
				reviewtime.html(moment(item.revCreateDt).format('YYYY-MM-DD'));
				
				var reviewcontent = $("<div>").addClass("review-content");
				reviewcontent.html(item.revContent);
				
				var reviewupdatedeletebutton = $("<div>").addClass("review-update-delete-button");
				var updateButton = $("<button>", {onclick:"updateReviewForm(" + item.revNo + ")", id:"updateButton"+item.revNo}).html("수정").addClass("updateButton");
				var deleteButton = $("<button>", {onclick:"deleteReview(" + item.revNo + ")"}).html("삭제");
				reviewupdatedeletebutton.append(updateButton).append(deleteButton);
				
				review.append(reviewnamestar).append(reviewtime).append(reviewcontent);
				
				if(${!empty loginMember} && "${loginMember.memberNo}" == item.memberNo){
					review.append(reviewupdatedeletebutton);
				}
				

				reviewArea.append(review);
				
				averageRating += item.revRating;
			});
			if(averageRating != 0){
				averageRating /= list.length;
			}
			$(".averageRating").text(averageRating.toFixed(1)); // 리뷰 평균점수
			$(".reviewcount").text(list.length);
		}, error: function() {
			console.log("댓글 조회 실패");
		}	
	})
}


function updateReviewForm(i) {
	$(".review-update").html("");
	var reviewupdate = $("<div>", {id:"review-update"+i}).addClass("review-update");
	var closeArea = $("<div>", {style:"height:24px"}).html('<a class="close-update" onclick="deleteUpdateForm(' + i + ')"> Ⅹ</a></div>');
	var reviewupdatecontent = $("<div>").addClass("review-update-content");
	var reviewupdatetext = $("<textarea>", {onkeydown:"resize(this)", onkeyup:"resize(this)"}).addClass("review-update-text");
	reviewupdatecontent.append(reviewupdatetext);
	var updatebuttonarea = $("<div>").addClass("update-button-area").html('<button class="review-update-button" onclick="updateReview(' + i + ')">후기 수정</button>');
	reviewupdate.append(closeArea).append(reviewupdatecontent).append(updatebuttonarea);
	$("#review" + i).append(reviewupdate)
	$(".review-update-text").focus();
	
}


function updateReview(i) {
	
	var revContent = $(".review-update-text").val();
	$.ajax({
		url: "${contextPath}/lesson/updateReview/" + i,
		type: "post",
		data: {"revContent": revContent},
		success: function(result){
			if(result>0){
				selectReview();
			}
		},
		error: function(){
			console.log("댓글수정 실패");
		}
	})
}

function deleteUpdateForm(i) {
	$("#review-update"+i).remove();
}

function deleteReview(i) {
	
	if(window.confirm("정말 삭제하시겠습니까?")){
		$.ajax({
			url: "${contextPath}/lesson/deleteReview/" + i,
			type: "post",
			success: function(result){
				if(result>0){
					selectReview();
				}
			},
			error: function(){
				console.log("댓글삭제 실패");
			}
		})
	}
}

$(".review-submit").click(function() {
	
	if(${loginMember == null}) {
		window.alert("로그인 후 이용해주세요");
	}
	else if($("#revContentText").val().trim() == "") {
		window.alert("내용을 입력해주세요");
	}
	else {
		var revRating = 0;
		var revContent = $("#revContentText").val();
		for(var i=1; i<=5; i++) {
			if($(".stars .star:nth-child(" + i + ")").hasClass("on")) {
				revRating++;
			}
		}
			$.ajax({
			url: "${contextPath}/lesson/insertReview",
			type: "post",
			data: {"revContent": revContent,
						 "revRating": revRating,
						 "lesNo": lesNo,
						 "memberNo": '${loginMember.memberNo}'
			},
			success: function(result){
				if(result>0){
					$("#revContentText").val("");
					selectReview();
				}
			},
			error: function(){
				console.log("댓글 삽입 실패");
			}
		})
	}
})


</script>

</body>
</html>