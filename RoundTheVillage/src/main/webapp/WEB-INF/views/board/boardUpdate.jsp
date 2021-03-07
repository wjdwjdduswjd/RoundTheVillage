<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>html문서 제목</title>
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
</head>
<title>게시글 수정</title>
</head>
<style>
* {
	font-family: 'NanumSquare', sans-serif !important;
	font-weight: 500;
	/* 굵기 지정(100, 300, 400, 500, 700) */
	font-size: 16px;
	color: #212529;
}
/*   .summerNoteArea {
    border: 1px solid black;
    width: 500px;
    height: 500px;
  } */
.btnArea {
	text-align: center;
}

.classBtn {
	float: right;
}

/*   .btn-group {
    background-color: #fbbc73;
    border-color: #fbbc73;
    color: #5b3929;
    text-align: center;
    float: right;
  } */

/*   .dropdown{
    margin-left: 60px;
    width: 300px;
  } */
HTML CSSResult Skip Results Iframe
body {
	margin: 0;
	padding: 0;
	background-color: #ffffff;
}

.box {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 100%;
}

#categorySelect {
	background-color: #ffffff;
	color: #fbbc73;
	/*   padding: 12px; */
	width: 100px;
	border: 1px solid gray;
	font-size: 15px;
	-webkit-appearance: button;
	appearance: button;
	outline: none;
}

.box:hover::before {
	color: rgba(255, 255, 255, 0.6);
	background-color: rgba(255, 255, 255, 0.2);
}

.box select option {
	padding: 30px;
}

.titleInput {
	width: 300px;
	height: 40%;
}

/* .writer{
  margin-right: 10px;
} */
.btnBtn3 {
	background-color: #fbbc73;
	color: #fff;
	border: white;
	border-radius: 5px;
	height: 38px;
	margin-bottom: 11px;
}
/*******************  */
.btn-warning {
	background-color: #fbbc73;
	color: white;
	border: white;
	border-radius: 5px;
	height: 38px;
	margin-bottom: 11px;
}

.btn {
	background-color: #fbbc73;
	color: white;
	border: white;
	border-radius: 5px;
	height: 38px;
	margin-bottom: 11px;
}
</style>
<!-- summernote 사용 시 필요한 css 파일 추가 -->
<link rel="stylesheet" href="${contextPath}/resources/summernote/css/summernote-lite.css">

<body>
	<jsp:include page="../common/header.jsp" />
	<style>
hr {
	width: 100%;
}
</style>

	<script src="${contextPath}/resources/summernote/js/summernote-lite.js"></script>
	<script src="${contextPath}/resources/summernote/js/summernote-ko-KR.js"></script>
	<%-- <script src="${contextPath}/resources/summernote/js/mySummernote.js"></script> --%>
	<script>
	
		$(document).ready(function() {
			var parentWidth = $(".summerNoteArea").css("width").substring(0, $(".summerNoteArea").css("width").indexOf("px"))   * 0.98;
			
			console.log(parentWidth * 0.98)
			$('#summernote').summernote({
				width : parentWidth, // 에디터 넓이
				height : 700, // 에디터 높이
				lang : 'ko-KR', // 언어 : 한국어
				callbacks : {
					onImageUpload : function(files) {
						sendFile(files[0], this);
					}
				}
			});
		});

		// 섬머노트에 업로드 된 이미지를 비동기로 서버로 전송하여 저장하는 함수
		function sendFile(file, editor) {
			var formData = new FormData();
			formData.append("uploadFile", file);
			$.ajax({
				url : "insertImage",
				type : "post",
				enctype : "multipart/form-data", // 파일 전송 형식으로 지정
				data : formData,
				contentType : false, // 서버로 전송되는 데이터 형식
				cache : false,
				processData : false,
				dataType : "json",
				success : function(at) {
					var contextPath = location.pathname.substring(0,
							window.location.pathname.indexOf("/", 2));
					$(editor).summernote('editor.insertImage',
							contextPath + at.filePath + "/" + at.fileName);
				}
			});
		}
	</script>
	<div class="container">
		<div class="row">
			<!--  <div class="col-md-2">
      </div> -->
			<div class="col-md-12">
				<br>
				<hr>

				<form action="updateAction" method="POST" enctype="multipart/form-data" id="updateForm">
					<div class="content-header">
						<div class="row">
							<div class="col-md-7 px-3">
								<p>
									<span class="pr-4"><b>제목</b></span> <input type="text" class="titleInput" id="title" name="boardTitle" size="40" value="${board.boardTitle }">
								</p>
							</div>
							<div class="col-md-5 px-3">
								<p>
									<span class="pr-4 writer"><b>작성자</b></span>${board.memberNickname}
								</p>
							</div>
						</div>

						<div class="row">
							<div class="col-md-7 px-3">
								<p>
									<span class="pr-4"><b>공방</b></span> ${board.lessonTitle}
								</p>
							</div>
							<div class="col-md-5 px-3">
								<p>
									<span class="pr-4"><b>카테고리</b></span> ${board.classCategoryNm}
								</p>
							</div>
						</div>
					</div>
					<!-- .content-header end -->

					<!-- 썸머노트 공간 시작 -->
					<!-- 썸머노트 공간 시작 -->
					<div class="row py-3">

						<div class="form-inline mb-2">
							<label class="input-group-addon mr-3 insert-label pr-4"><b>썸네일</b></label>
							<div class="boardImg" id="titleImgArea">
								<img id="titleImg" width="200" height="200">
							</div>
						</div>


						<div id="fileArea">
							<input type="file" id="img0" name="images" onchange="LoadImg(this,0)">
						</div>



						<div class="col-md-12 summerNoteArea">
							<textarea class="form-control" id="summernote" name="boardContent" rows="10" style="resize: none;">${board.boardContent }</textarea>
						</div>
					</div>
					<!-- 썸머노트 공간 끝 -->

					<hr>
					<div class="row">
						<div class="col-md-8"></div>
						<div class="col-md-4 text-right px-0 btnArea">
							<span class="btnBtn">
								<button type="button" class="btn btn-warning btn-sm px-2 btnBtn3">목록</button>
								<button class="btn btn-warning btn-sm px-2 btnBtn3">수정</button>
							</span>
						</div>
					</div>
				</form>



			</div>
		</div>
		<!-- .col-md-8 end -->

	</div>
	<!--   <div class="col-md-2">
      </div> -->

	<jsp:include page="../common/footer.jsp" />

	<script>
	// 이미지 배치
		<c:forEach var="at" items="${attachmentList}">
		$(".boardImg").eq(${at.fileLevel}).children("img").attr("src", "${contextPath}${at.filePath}/${at.fileName}");
		</c:forEach>

		
	
		// 이미지 영역을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
		$(function() {
			$("#fileArea").hide(); // #fileArea 요소를 숨김.		

			$(".boardImg").on("click", function() { // 이미지 영역이 클릭 되었을 때
				var index = $(".boardImg").index(this);// 클릭한 이미지 영역 인덱스 얻어오기
				$("#img" + index).click(); // 클릭된 영역 인덱스에 맞는 input file 태그 클릭
			});

		});

		// 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
		function LoadImg(value, num) {

			if (value.files && value.files[0]) { // 해당 요소에 업로드된 파일이 있을 경우

				var reader = new FileReader();
				reader.readAsDataURL(value.files[0]);

				reader.onload = function(e) {
					$(".boardImg").eq(num).children("img").attr("src",
							e.target.result);

					// 특정 fileLevel 이미지가 삭제 되지 않았음을 deleteImages에 기록
					// == deleteImages의 삭제된 fileLevel번째 인덱스 값을 false로 변경
					deleteImages[num] = false;
				}
			}
		}
	</script>



</body>
</html>