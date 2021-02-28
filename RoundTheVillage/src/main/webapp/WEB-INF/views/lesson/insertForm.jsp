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
.insert-main {
	width: 800px;
}

.insert-main > div {
	height: 100px;
} 

.form-control {
	width: 800px !important;
}
.date-buttons {
}
.date-button {
	width: 90px;
	height: 52px;
	margin: 0 7px 0;
	border: 1px solid #ced4da;
	border-radius: 10px;
	background-color: #FFFFFF;
}
.insert-title {
	height: 100px;
}
.insert-p {
	margin-bottom: 10px;
}
.insert-content {
}
.button-area button {
	width: 100px;
	height: 55px;
	margin: 0 7px 0;
	border: 1px solid #ced4da;
	border-radius: 10px;
	background-color: #FFFFFF;
}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<script src="${contextPath}/resources/summernote/js/summernote-lite.js"></script>
<script src="${contextPath}/resources/summernote/js/summernote-ko-KR.js"></script>
<script src="${contextPath}/resources/summernote/js/mySummernote.js"></script>
	
<script type="text/javascript">

</script>

	<div class="container">
	<form action="#" onsubmit="return validate();" onreset="return validate2();">

		<div class="insert-main">
			
			<div class="insert-title">
				<p class="insert-p">수업명</p>
				<input class="form-control" name="title" id="title" placeholder="수업명">
			</div>
			<div class="insert-date">
				<p class="insert-p">요일</p>
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
			<div class="form-group insert-time">
				<p class="insert-p">수업시간 >> 버튼으로</p>
				<input type="number" class="form-control" name="time" id="time">
			</div>
			<div class="form-group insert-limit">
				<p class="insert-p">정원</p>
				<input type="number" class="form-control" name="limit" id="limit" placeholder="정원">
			</div>
			<div class="form-group insert-price">
				<p class="insert-p">가격</p>
				<input type="number" class="form-control" name="price" id="price" placeholder="가격">
			</div>
			<div class="form-group insert-length">
				<p class="insert-p">소요시간</p>
				<input type="number" class="form-control" name="length" id="length" placeholder="소요시간">
			</div>
			<div class="form-group insert-cover">
				<p class="insert-p">대표이미지</p>
				<input type="file">
			</div>
			
		</div>
		<div class="form-group insert-content">
			<div>
				<label for="content">내용</label>
			</div>
				<textarea class="form-control" id="summernote" name="content" rows="20" style="resize: none;"></textarea>
		</div>
		
		

		<br>
		<div class="button-area">
			<button type="reset">초기화</button>
			<button type="submit" id="submit">수업 등록</button>
		</div>
		</form>	
	</div>

<script type="text/javascript">
$("#price").focusout(function(){
	if($(this).val()<1) {
		$(this).val("");
	}
})

$("#limit").focusout(function(){
	if($(this).val()<1) {
		$(this).val("");
	}
})

$("#length").focusout(function(){
	if($(this).val()<1) {
		$(this).val("");
	}
})

var dateBtn = $(".date-button");
dateBtn.click(function() {
	if($(this).hasClass("active")){
		$(this).removeClass("active");
		$(this).css("background-color", "#FFFFFF");
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

function validate2() {
	return window.confirm("정말 초기화 하시겠습니까?");
}
</script>
	
</body>
</html>