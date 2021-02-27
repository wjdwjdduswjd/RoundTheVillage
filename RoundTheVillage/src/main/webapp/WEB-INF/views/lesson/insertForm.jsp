<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>lessonInsertForm</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/summernote/css/summernote-lite.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
.container {
	margin-top: 30px;
}
.insert-sub-title {
	display: inline-block;
	padding-left: 100px;
	width: 350px;
}
.insert-content {
	display: inline-block;
}
.insert-sub-title > div {
	height: 100px;
}
.insert-content > div {
	height: 100px;
}
.form-control {
	width: 400px !important;
}
.button-area {
	text-align: center;
}
.insert-date {
	
}
.fa-calendar {
	width: 30px;
	height: 30px;
	margin: 0;
	cursor: pointer;
}
#calendar {
	width: 30px;
	height: 30px;
	margin-right: 20px;
}
.input-group-text {
	padding: 0;
	width: 30px;
	height: 30px;
	border: 0;
	background-color: #FFFFFF;
	padding-left: 20px;
}
.date-button {
	margin: 0 7px 0;
	border: 0;
	background-color: pink;
}
input[type=file] {
	
}
</style>
</head>
<body>
<script src="${contextPath}/resources/summernote/js/summernote-lite.js"></script>
<script src="${contextPath}/resources/summernote/js/summernote-ko-KR.js"></script>
<script src="${contextPath}/resources/summernote/js/mySummernote.js"></script>

	
<script type="text/javascript">

</script>

	<div class="container">
	<form action="#" onsubmit="return validate();">
		<div class="insert-sub-title">
			<div class="insert-title">
				수업명
			</div>
			<div class="insert-date">
				요일
			</div>
			<div class="insert-time">
				시간
			</div>
			<div class="insert-limit">
				정원
			</div>
			<div class="insert-price">
				가격
			</div>
			<div class="insert-length">
				소요시간
			</div>
			<div class="insert-cover">
				커버이미지
			</div>
			<div class="insert-content">
				수업내용
			</div>
		</div>
		<div class="insert-content">
			
			<div class="insert-title">
				<input class="form-control" name="title" id="title">
			</div>
			<div class="insert-date">
				<div class="date-buttons">
			 		<button type="button" class="date-button" name="date" value=0>일</button>
			 		<button type="button" class="date-button" name="date" value=1>월</button>
			 		<button type="button" class="date-button" name="date" value=2>화</button>
			 		<button type="button" class="date-button" name="date" value=3>수</button>
			 		<button type="button" class="date-button" name="date" value=4>목</button>
			 		<button type="button" class="date-button" name="date" value=5>금</button>
			 		<button type="button" class="date-button" name="date" value=6>토</button>
		 		</div>
			</div>
			<div class="insert-time">
				<input class="form-control">
			</div>
			<div class="insert-limit">
				<input type="number" class="form-control" name="limit" id="limit">
			</div>
			<div class="insert-price">
				<input type="number" class="form-control" name="price" id="price">
			</div>
			<div class="insert-length">
				<input type="number" class="form-control" name="length" id="length">
			</div>
			<div class="insert-cover">
				<input type="file">
			</div>
			<div class="insert-content">
				<input class="form-control">
			</div>
		</div>
		<br>
		<div class="button-area">
			<button type="submit">수업 등록</button>
		</div>
		</form>	
	</div>

<script type="text/javascript">
$(".price").focusout(function(){
	if($(this).val()<0) {
		$(this).val("");
	}
})

$(".limit").focusout(function(){
	if($(this).val()<0) {
		$(this).val("");
	}
})

$(".length").focusout(function(){
	if($(this).val()<0) {
		$(this).val("");
	}
})

var dateBtn = $(".date-button");
dateBtn.click(function() {
	if($(this).hasClass("active")){
		$(this).removeClass("active");
		$(this).css("background-color", "pink");
	}
	else {
		$(this).addClass("active");
		$(this).css("background-color", "#FBBC73");
	}
});

function validate() {
	if($("#title").val().trim() == "") {
		window.alert("수업명을 입력해주세요");
		$("#title").focus();
		return false;
	} else if($("#limit").val().trim() == "") {
		window.alert("정원수를 입력해주세요");
		$("#limit").focus();
		return false;
	} else if($("#price").val().trim() == "") {
		window.alert("가격을 입력해주세요");
		$("#price").focus();
		return false;
	} else if($("#length").val().trim() == "") {
		window.alert("소요시간을 입력해주세요");
		$("#length").focus();
		return false;
	} else if($("#content").val().trim() == "") {
		window.alert("내용을 입력해주세요");
		$("#content").focus();
		return false;
	}
	
	var date = [];
	for(var i=0; i<$(".active").length; i++){
		date.push($(".active")[i].value);
	}
	if(date.length==0){
		window.alert("요일을 입력해주세요");
		return false;
	}
}
</script>
	
</body>
</html>