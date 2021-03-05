<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>question</title>
<style>
.question-top {
	height: 50px;
	margin-bottom: 60px;
}
.question-write {
	float: right;
	background-color: #FFFFFF;
	border: 3px solid #FBBC73;
	border-radius: 15px;
	color: #FBBC73;
	width: 150px;
	height: 50px;
	font-weight: bold;
}
.question-Q {
	min-height: 130px;
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
.question-popup {
	width: 800px;
	min-height: 250px;
	position: absolute;
	top: 80%;
	right: 36%;
	border: 1px solid #e4e9ef;
	background-color: #FFFFFF;
	padding-bottom: 20px;
}
.question-insert-title {
	font-size: 20px;
	font-weight: bold;
	padding: 20px;
}
.question-insert-content {
	margin: 0 20px;
	border: 1px solid #a1a1a1;
}
.question-insert-buttons {
	height: 37px;
	margin: 20px;
}
.question-insert-buttons button {
	width: 80px;
	height: 48px;
	float: right;
	margin-left: 15px;
	border: 1px solid black;
	background-color: #2B3044;
	color: #FFFFFF;
}
.question-update {
}
.question-update-text {
	border: 1px solid #808080;
	margin-top: 15px;
	min-height: 112px;
}
.question-update-buttons{
	height: 36px;
}

.question-update-buttons button {
	width: 80px;
	height: 36px;
	float: right;
	margin-left: 5px;
	background-color: #2B3044;
	color: #FFFFFF;
}
</style>
</head>
<body>
<div class="question-wrapper">
<div class="question-top">
	<div class="title" id="question-count" style="margin: 0">총 0개의 문의
	</div>
	<button class="question-write">문의 작성 하기</button>
</div>

<div class="question-bottom">
	<div class="question-Q">
		<div class="question-photo">
			<img src="${contextPath}/resources/images/realking.jpg" style="width:54px; height:54px;">
		</div>
		<div class="question-text">
			<div class="question-time">문의 날짜</div>
			<div class="question-name">사용자</div>
			<div class="question-content">문의 내용</div>
			<div class="question-buttons">
				<button class="question-button">답글달기</button>
				<button class="question-button">삭제</button>
				<button class="question-button">수정</button>
			</div>
			
			<div class="question-update">
				<div class="question-update-text">
					<textarea onkeydown="resize(this)" onkeyup="resize(this)"></textarea>
				</div>
				<div class="question-update-buttons">
					<button>취소</button>
					<button>수정</button>
				</div>
			</div>
			
		</div>
	</div>
	<div class="question-A">
	<div class="question-text">
			<div class="question-time">답변 날짜</div>
			<div class="question-name"> <img src="${contextPath}/resources/images/right-arrow.png" style="width:15px; height:15px;">공방 이름</div>
			<div class="question-content">답변 내용</div>
			<div class="question-buttons">
				<button class="question-button">답글달기</button>
				<button class="question-button">삭제</button>
				<button class="question-button">수정</button>
			</div>
		</div>
	</div>
</div>
</div>
<script>

$(function(){
	selectQuestion();
})

function selectQuestion() {
	$.ajax({
		url: "${contextPath}/lesson/selectQuestion/" + lesNo,
		type: "post",
		success: function(list) {
			$(".question-bottom").html("");
			var count = 0;
	/* <div class="question-bottom">
			<div class="question-Q">
				<div class="question-photo">
					<img src="${contextPath}/resources/images/realking.jpg" style="width:54px; height:54px;">
				</div>
				<div class="question-text">
					<div class="question-time">2020.02.15</div>
					<div class="question-name">진선</div>
					<div class="question-content">직접 수령 못할 것 같은데 택배로 보내 주실 수 있나요~~~?? <br>직접 수령 못할 것 같은데 택배로 보내 주실 수 있나요~~~??<br>직접 수령 못할 것 같은데 택배로 보내 주실 수 있나요~~~??</div>
					<div class="question-buttons">
						<button class="question-button" id="answerButton1">답글달기</button>
						<button class="question-button" id="updateButton1">수정</button>
						<button class="question-button" id="deleteButton1">삭제</button>
					</div>
				</div>
			</div>
			<div class="question-A">
			<div class="question-text">
					<div class="question-time">2020.02.15</div>
					<div class="question-name"> <img src="${contextPath}/resources/images/right-arrow.png" style="width:15px; height:15px;"> 찐팅허 꽃집</div>
					<div class="question-content">오세요 그냥. <br>오세요 그냥.<br>오세요 그냥.</div>
					<div class="question-buttons">
						<button class="question-button">삭제</button>
						<button class="question-button">수정</button>
					</div>
				</div>
			</div>
		</div> */
		$.each(list, function(index, item){
			if(item.queType == 'Q'){
				count++;
				var questionQ = $("<div>").addClass("question-Q");
				var questionphoto = $("<div>").addClass("question-photo").html('<img src="${contextPath}/resources/images/profile.jpg" style="width:54px; height:54px;">');
				var questiontext = $("<div>").addClass("question-text")
				var questiontime = $("<div>").addClass("question-time").html(moment(item.queDt).format('YYYY-MM-DD'));
				var questionname = $("<div>").addClass("question-name").html("이름");
				var questioncontent = $("<div>").addClass("question-content").html(item.queContent);;
				var questionbuttons = $("<div>").addClass("question-buttons");
				var answerButton = $("<button>", {onclick: "insertAnswerForm(" + item.queNo + ", this)"}).addClass("question-button").html("답글달기"); // 번호붙이기
				var updateButton = $("<button>", {onclick: "updateQuestionForm(" + item.queNo + ", this)"}).addClass("question-button").html("수정"); // 번호붙이기
				var deleteButton = $("<button>", {onclick: "deleteQuestion(" + item.queNo + ")"}).addClass("question-button").html("삭제"); // 번호붙이기
				questionbuttons.append(answerButton).append(updateButton).append(deleteButton);
				questiontext.append(questiontime).append(questionname).append(questioncontent).append(questionbuttons);
				questionQ.append(questionphoto).append(questiontext);
				$(".question-bottom").append(questionQ);
			}
			else if(item.queType == 'A') {
				var questionA = $("<div>").addClass("question-A");
				var questiontext = $("<div>").addClass("question-text");
				var questiontime = $("<div>").addClass("question-time").html(moment(item.queDt).format('YYYY-MM-DD'));
				var questionname = $("<div>").addClass("question-name").html('<img src="${contextPath}/resources/images/right-arrow.png" style="width:15px; height:15px;">' + '${shopInfo.shopName}' +'</div>');
				var questioncontent = $("<div>").addClass("question-content").html(item.queContent);
				var questionbuttons = $("<div>").addClass("question-buttons");
				var updateButton = $("<button>", {onclick: "updateQuestionForm(" + item.queNo + ", this)"}).addClass("question-button").html("수정");
				var deleteButton = $("<button>", {onclick: "deleteQuestion(" + item.queNo + ")"}).addClass("question-button").html("삭제");
				questionbuttons.append(updateButton).append(deleteButton);
				questiontext.append(questiontime).append(questionname).append(questioncontent).append(questionbuttons);
				questionA.append(questiontext);
				$(".question-bottom").append(questionA);
			}
		})
			$("#question-count").html("총 " + count + "개의 문의");
		}, error: function() {
			console.log("문의 조회 실패");
		}	
	})
}

function updateQuestionForm(i, clickedButton) {
	$(".question-update").remove();
/* 	
  <div class="question-update">
		<div class="question-update-text">
			<textarea onkeydown="resize(this)" onkeyup="resize(this)"></textarea>
		</div>
		<div class="question-update-buttons">
			<button>취소</button>
			<button>수정</button>
		</div>
	</div>*/
	var bgColor = $(clickedButton).parent().parent().parent().css("background-color");
	var questionupdate = $("<div>").addClass("question-update");
	var questionupdatetext = $("<div>").addClass("question-update-text");
	var updatetext = $("<textarea>", {onkeydown: "resize(this)", onkeyup:"resize(this)"}).addClass("update-text").css("background-color", bgColor);
	questionupdatetext.append(updatetext);
	var questionupdatebuttons = $("<div>").addClass("question-update-buttons");
	var cancelButton = $("<button>", {onclick: "updateCancel()"}).html("취소");
	var updateButton = $("<button>", {onclick: "updateQuestion(" + i +")"}).html("수정");
	questionupdatebuttons.append(cancelButton).append(updateButton);
	questionupdate.append(questionupdatetext).append(questionupdatebuttons);
	$(clickedButton).parent().parent().append(questionupdate);
}

function updateQuestion(i) {
	var queContent = $(".update-text").val();
	$.ajax({
		url: "${contextPath}/lesson/updateQuestion/" + i,
		type: "post",
		data: {"queContent" : queContent},
		success: function(result) {
			if(result > 0) {
				$(".question-update").remove();
				selectQuestion();
			}
		},
		error: function() {
			console.log("문의 수정 실패");
		}
	})
}

function deleteQuestion(i) {
	if(window.confirm("정말 삭제하시겠습니까?")){
		$.ajax({
			url: "${contextPath}/lesson/deleteQuestion/" + i,
			type: "post",
			success: function(result){
				if(result > 0) {
					selectQuestion();
				}
			},
			error: function(){
				console.log("문의 삭제 실패");
			}
		})
	}
}

$(".question-write").click(function() {
	
/*  <div class="question-popup">
			<p class="question-insert-title">문의 하기</p>
			<div class="question-insert-content">
				<textarea onkeydown="resize(this)" onkeyup="resize(this)"></textarea>
			</div>
			<div class="question-insert-buttons">
				<button id="question-cancel">취소</button>
				<button id="question-insert-submit">작성완료</button>
			</div>
		</div> */
	$(".question-popup").remove();

	var questionpopup = $("<div>").addClass("question-popup");
	var questioninserttitle = $("<p>").addClass("question-insert-title").html("문의하기");
	var questioninsertcontent = $("<div>").addClass("question-insert-content");
	var questiontext = $("<textarea>", {onkeydown : "resize(this)", onkeyup: "resize(this)"}).addClass("question-insert-text");
	questioninsertcontent.append(questiontext);
	var questioninsertbuttons = $("<div>").addClass("question-insert-buttons");
	var questioncancel = $("<button>", {id: "question-cancel", onclick: "popupCancel()"}).html("취소");
	var questioninsertsubmit = $("<button>", {id: "question-insert-submit", onclick: "insertQuestion()"}).html("작성완료");
	
	questioninsertbuttons.append(questioncancel).append(questioninsertsubmit);
	questionpopup.append(questioninserttitle).append(questioninsertcontent).append(questioninsertbuttons);
	$(".question-wrapper").after(questionpopup);
	
})

function insertQuestion() {
	var queContent = $(".question-insert-text").val();
	console.log(queContent);
	$.ajax({
		url: "${contextPath}/lesson/insertQuestion/" + lesNo,
		type: "post",
		data: {"queContent": queContent},
		success: function(result) {
			if(result > 0) {
				$(".question-popup").remove();
				selectQuestion();
			}
		},
		error: function() {
			console.log("문의 작성 실패");
		}
	});
}

function insertAnswerForm(i, clickedButton) {
		$(".question-update").remove();
		var bgColor = $(clickedButton).parent().parent().parent().css("background-color");
		var questionupdate = $("<div>").addClass("question-update");
		var questionupdatetext = $("<div>").addClass("question-update-text");
		var updatetext = $("<textarea>", {onkeydown: "resize(this)", onkeyup:"resize(this)", backgroundcolor:bgColor}).addClass("update-text");
		questionupdatetext.append(updatetext);
		var questionupdatebuttons = $("<div>").addClass("question-update-buttons");
		var cancelButton = $("<button>", {onclick: "updateCancel()"}).html("취소");
		var updateButton = $("<button>", {onclick: "insertAnswer(" + i +")"}).html("답글 달기");
		questionupdatebuttons.append(cancelButton).append(updateButton);
		questionupdate.append(questionupdatetext).append(questionupdatebuttons);
		$(clickedButton).parent().parent().append(questionupdate);
}

function insertAnswer(i) {
	var queContent = $(".update-text").val();
	$.ajax({
		url: "${contextPath}/lesson/insertAnswer/" + i,
		type: "post",
		data: {"queContent": queContent,
					 "lesNo": lesNo},
		success: function(result) {
			if(result > 0) {
				$(".question-update").remove();
				selectQuestion();
			}
		},
		error: function() {
			console.log("답변 작성 실패");
		}
	})
}

function popupCancel() {
	$(".question-popup").remove();
}

function updateCancel() {
	$(".question-update").remove();
}


</script>

</body>
</html>