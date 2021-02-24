<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>question</title>
<style>
.question-top {
	position: relative;
	height: 50px;
	margin-bottom: 30px;
}
.question-write {
	position: absolute;
	top: 0;
	right: 50px;
	background-color: #FFFFFF;
	border: 3px solid #FBBC73;
	border-radius: 15px;
	color: #FBBC73;
	width: 150px;
	height: 50px;
	font-weight: bold;
}
.question-Q {
	padding: 15px 20px;
}
.question-A {
	padding: 15px 20px;
	background-color: #f6f7f8;
	margin-top: 10px;
	border-radius: 10px;
}
.question-text {
	padding-left: 70px;
	position: relative;
}
.question-name{
	font-size: 18px;
	font-weight: bold;
}
.question-time {
	position: absolute;
	top: 20px;
	right: 20px;
}
.question-content {
	margin-top: 5px;
		font-size: 14px;
}
.question-buttons {
	padding-top: 8px;
}
.question-button {
	color: #B2BCC8;
  padding: 5px 2px;
	font-size: 12px;
	display: inline-block;
	background-color: #FFFFFF;
	border: 0;
}
.question-A .question-button {
	background-color: #f6f7f8;
}
.question-photo {
	position: absolute;
}
</style>
</head>
<body>
<div class="question-top">
	<div class="title">총 n개의 문의</div>
	<button class="question-write">문의 작성 하기</button>
</div>

<div class="question-bottom">
	<div class="question-Q">
		<div class="question-photo">
			<img src="${contextPath}/resources/images/realking.jpg" style="width:54px; height:54px;">
		</div>
		<div class="question-text">
			<div class="question-time">2020.02.15</div>
			<div class="question-name">진선</div>
			<div class="question-content">직접 수령 못할 것 같은데 택배로 보내 주실 수 있나요~~~?? <br>직접 수령 못할 것 같은데 택배로 보내 주실 수 있나요~~~??<br>직접 수령 못할 것 같은데 택배로 보내 주실 수 있나요~~~??</div>
			<div class="question-buttons">
				<button class="question-button">답글달기</button>
				<button class="question-button">삭제</button>
				<button class="question-button">수정</button>
			</div>
		</div>
	</div>
	<div class="question-A">
	<div class="question-text">
			<div class="question-time">2020.02.15</div>
			<div class="question-name"> <img src="${contextPath}/resources/images/right-arrow.png" style="width:15px; height:15px;"> 찐팅허 꽃집</div>
			<div class="question-content">오세요 그냥. <br>오세요 그냥.<br>오세요 그냥.</div>
			<div class="question-buttons">
				<button class="question-button">답글달기</button>
				<button class="question-button">삭제</button>
				<button class="question-button">수정</button>
			</div>
		</div>
	</div>
</div>

<!-- ------------------------------------- -->
<div class="question-bottom">
	<div class="question-Q">
		<div class="question-photo">
			<img src="${contextPath}/resources/images/realking.jpg" style="width:54px; height:54px;">
		</div>
		<div class="question-text">
			<div class="question-time">2020.02.15</div>
			<div class="question-name">진선</div>
			<div class="question-content">직접 수령 못할 것 같은데 택배로 보내 주실 수 있나요~~~?? <br>직접 수령 못할 것 같은데 택배로 보내 주실 수 있나요~~~??<br>직접 수령 못할 것 같은데 택배로 보내 주실 수 있나요~~~??</div>
			<div class="question-buttons">
				<button class="question-button">답글달기</button>
				<button class="question-button">삭제</button>
				<button class="question-button">수정</button>
			</div>
		</div>
	</div>
	<div class="question-A">
	<div class="question-text">
			<div class="question-time">2020.02.15</div>
			<div class="question-name"> <img src="${contextPath}/resources/images/right-arrow.png" style="width:15px; height:15px;"> 찐팅허 꽃집</div>
			<div class="question-content">오세요 그냥. <br>오세요 그냥.<br>오세요 그냥.</div>
			<div class="question-buttons">
				<button class="question-button">답글달기</button>
				<button class="question-button">삭제</button>
				<button class="question-button">수정</button>
			</div>
		</div>
	</div>
</div>
<!-- ------------------------------------- -->

<br>
</body>
</html>