<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<style>
.insert-label {
	display: inline-block;
	width: 80px;
	line-height: 40px
}

#content-main {
	margin: 100px auto;
}

.deleteImg {
	position: absolute;
	display: inline-block;
	margin-left: -15px;
	border: none;
	background-color: rgba(1, 1, 1, 0);
	width: 20px;
	height: 20px;
	cursor: pointer;
}
</style>

<!-- summernote 사용시 필요한 css 파일 추가 -->
<link rel="stylesheet"
	href="${contextPath}/resources/summernote/css/summernote-lite.css">

</head>
<body>
	<div class="container">
		<jsp:include page="../common/header.jsp" />

		<!-- summernote 사용시 필요한 js 파일 추가 -->
		<script
			src="${contextPath}/resources/summernote/js/summernote-lite.js"></script>
		<script
			src="${contextPath}/resources/summernote/js/summernote-ko-KR.js"></script>
		<script src="${contextPath}/resources/summernote/js/mySummernote.js"></script>




		<div class="container pb-5 mb-5" id="content-main">

			<h3>게시글 수정</h3>
			<hr>
			<form action="updateAction" method="post" enctype="multipart/form-data" name="updateForm" role="form"
				onsubmit="return validate();">

				<div class="form-inline mb-2">
					<label class="input-group-addon mr-3 insert-label">제목</label> <input
						type="text" class="form-control" id="title" name="noticeTitle"
						size="70" value="${notice.noticeTitle }">
				</div>


				<div class="form-inline mb-2">
					<label class="input-group-addon mr-3 insert-label">작성일</label>
					<h5 class="my-0" id="today">
						<jsp:useBean id="now" class="java.util.Date" />
						<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" />
					</h5>
				</div>

				<hr>

				<div class="form-group">
					<textarea class="form-control" id="summernote" name="noticeContent"
						rows="10" style="resize: none;"></textarea>
				</div>


				<hr class="mb-4">

				<div class="text-center">
					<button type="submit" class="btn btn-primary">수정</button>
					<a class="btn btn-primary float-right" href="${sessionScope.returnListURL}">목록으로</a>
				</div>

			</form>
		</div>

	</div>
	<jsp:include page="../common/footer.jsp" />


	<script>
		// 유효성 검사
		function validate() {
			if ($("#title").val().trim().length == 0) {
				alert("제목을 입력해 주세요.");
				$("#title").focus();
				return false;
			}

			if ($("#content").val().trim().length == 0) {
				alert("내용을 입력해 주세요.");
				$("#content").focus();
				return false;
			}

			// 유효성 검사에서 문제가 없을 경우 서버에 제출 전
			// deleteImages배열의 내용을 hidden 타입으로 하여 form태그 마지막에 추가하여 파라미터로 전달
			for (var i = 0; i < deleteImages.length; i++) {
				$deleteImages = $("<input>", {
					type : "hidden",
					name : "deleteImages",
					value : deleteImages[i]
				});
				$("form[name=updateForm]").append($deleteImages);
			}

		}
	</script>
</body>
</html>
