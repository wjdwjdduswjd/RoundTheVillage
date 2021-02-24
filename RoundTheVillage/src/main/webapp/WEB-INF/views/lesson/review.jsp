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
	height: 200px;
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
.review-list {
	margin-top: 50px;
}
.review-list > div {
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
					<textarea placeholder="후기를 입력하세요"></textarea>
				</div>
				<div class="review-button">
					<button class="review-submit">등록</button>
				</div>
			</form>
		</div>
		<div class="review-list">
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
		
		
		<div class="review-list">
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
		
		

<script>
$('.stars span').click(function(){
  $(this).parent().children('span').removeClass('on');
  $(this).addClass('on').prevAll('span').addClass('on');
  return false;
});
</script>

</body>
</html>