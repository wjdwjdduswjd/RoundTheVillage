<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	min-height: 150px;
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
	margin-top: 50px;
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
	margin-right: 40px;
}
.review-star {
}
.review-time {
}
.review-content {
	padding: 20px;
}
.review-update-delete-button {
	float: right;
	padding-top: 10px;
}
.review-update-delete-button > button {
	background-color: #FFFFFF;
	color: #7A7A7A;
	border: 0;
	font-size: 17px;
	padding-left: 10px;
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
			<div style="font-size: 35px; color: black">4.7</div>
		</div>
		<div class="reviewtotal">
			<div>클래스 후기</div>
			<div style="font-size: 35px; color: black">56</div>
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
			</div>
		
			<div class="review">
				<div class="review-name-star">
					<div class="review-name">진선</div>
					<div class="review-star">별</div>
				</div>
				<div class="review-time">2020.02.16  15:48</div>
				<div class="review-content">혹시 액션이 어떻게 되는지 아세요? 무한~~ <br> 무야~호~ 뭐~ <br> 그만큼 신나시는거지~ </div>
				<div class="review-update-delete-button">
					<button>수정</button>
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
			
			$.each(list, function(index, item) {
				
				var review = $("<div>").addClass("review");
				var reviewnamestar = $("<div>").addClass("review-name-star");
				var reviewname = $("<div>").addClass("review-name").html("이름");
				
				var stars = "";
				for(var i=0; i<item.revRating; i++){
					stars += "★";
				}
				for(var i=0; i<5-item.revRating; i++){
					stars += "☆";
				}
				var reviewstar = $("<div>").addClass("review-star").html(stars + "이미지로ㄱㄱ");
				reviewnamestar.append(reviewname).append(reviewstar);
				
				var reviewtime = $("<div>").addClass("review-time");
				reviewtime.html(item.revCreateDt);
				reviewtime.html(moment(item.revCreateDt).format('YYYY-MM-DD'));
				
				var reviewcontent = $("<div>").addClass("review-content");
				reviewcontent.html(item.revContent);
				
				var reviewupdatedeletebutton = $("<div>").addClass("review-update-delete-button");
				var updateButton = $("<button>", {onclick:"updateReview(" + item.revNo +")"}).html("수정");
				var deleteButton = $("<button>", {onclick:"deleteReview(" + item.revNo +")"}).html("삭제");
				//reviewupdatedeletebutton.html("<button>수정</button><button>삭제</button><button>신고하기</button>");
				reviewupdatedeletebutton.append(updateButton).append(deleteButton);
				review.append(reviewnamestar).append(reviewtime).append(reviewcontent).append(reviewupdatedeletebutton);

				reviewArea.append(review);
			});
		}, error: function() {
			console.log("댓글 조회 실패");
		}	
	})
}

// 댓글 수정
function updateReview(i) {
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
	var revRating = 0;
	var revContent = $("#revContentText").val();
	for(var i=1; i<=5; i++) {
		if($(".stars .star:nth-child(" + i + ")").hasClass("on")) {
			revRating++;
		}
	}
		$.ajax({
		url: "${contextPath}/lesson/reviewInsert",
		type: "post",
		data: {"revContent": revContent,
					 "revRating": revRating,
					 "lesNo": lesNo
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
})
</script>

</body>
</html>