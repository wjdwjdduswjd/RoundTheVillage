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
.review {
	border: 1px solid #979797;
}
.title {
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 15px;
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
  width: 30px;
  height: 30px;
  display: inline-block;
  text-indent: -9999px;
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
}
.review-button {
	height: 50px;
	border-top: 1px solid #979797;
}
.review-submit {
	width: 100px;
	height: 100%;
	float: right;
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
			<div>4.7</div>
		</div>
		<div class="reviewtotal">
			<div>클래스 후기</div>
			<div>56</div>
		</div>
	</div>
	
	<div class="title">
		후기작성
	</div>
		<form action="#">
			<div class="review">
				<div class="stars">
					<span class="star on"></span>
					<span class="star"></span>
					<span class="star"></span>
					<span class="star"></span>
					<span class="star"></span>
				</div>
				<div class="review-text">
					<textarea rows="" cols=""></textarea>
				</div>
				<div class="review-button">
					<button class="review-submit">등록</button>
				</div>
			</div>
		</form>

<script>
$('.stars span').click(function(){
  $(this).parent().children('span').removeClass('on');
  $(this).addClass('on').prevAll('span').addClass('on');
  return false;
});
</script>

</body>
</html>