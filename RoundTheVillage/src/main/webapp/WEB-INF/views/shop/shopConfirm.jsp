<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공방 등록 페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<style>
* {
	font-family: 'NanumSquare', sans-serif !important;
}

#summernote {
	resize: none;
}

.container {
	margin-top: 30px;
}

/* 관심분야 체크박스 버튼 관련 */
/* 관심분야 체크박스 없애는 */
.box-radio-input input[type="radio"] {
	display: none;
	width: 100%;
}

.box-radio-input input[type="radio"]+span {
	width: 82px;
	display: inline-block;
	background: none;
	border: 1px solid #dfdfdf;
	text-align: center;
	line-height: 50px;
	font-weight: 400;
	cursor: pointer;
	background: #FCEAD6;
	/* 모서리 */
	border-radius: 5px;
	margin-right: 15px;
	margin-bottom: 15px;
}

.box-radio-input input[type="radio"]:checked+span {
	border: 1px solid #FBBC73;
	background: #FBBC73;
	color: rgb(0, 0, 0);
	font-weight: 550;
}
</style>

<!--summernote 사용 시  필요한 css 파일 추가  -->
<link rel="stylesheet" href="${contextPath}/resources/summernote/css/summernote-lite.css">
</head>
<body>
	<jsp:include page="../common/header.jsp" />

	<!-- summernote 사용 시 필요한 js 파일 추가  -->
	<script src="${contextPath}/resources/summernote/js/summernote-lite.js"></script>
	<script src="${contextPath}/resources/summernote/js/summernote-ko-KR.js"></script>
	<script src="${contextPath}/resources/summernote/js/mySummernote.js"></script>
	<div class="container">

		<div class="py-5">
			<h2>공방 등록</h2>
		</div>

		<div class="row">

			<br>

			<div class="col-md-7 offset-md-3">

				<form method="POST" action="RegistrationAction" class="needs-validation" name="registrationFrom" onsubmit="return validate();" enctype="multipart/form-data">


					<!-- 대표자 이름 -->
					<div class="row mb-3 form-row">

						<div class="col-md-3">
							<label for="storeUserName">대표자</label>
						</div>
						<div class="col-md-6">
							<input type="text" class="form-control" id="name" name="shopOwnerName" placeholder="이름을 입력하세요." autocomplete="off" required>
						</div>

						<div class="col-md-6 offset-md-3">
							<span id="checkName">&nbsp;</span>
						</div>
					</div>


					<!-- 공방명 -->
					<div class="row mb-3 form-row">
						<div class="col-md-3">
							<label for="shopName">공방명</label>
						</div>
						<div class="col-md-6">
							<input type="text" class="form-control" id="store" name="shopName" placeholder="공방명을 입력해 주세요." autocomplete="off" required>
						</div>
					</div>

					<br>

					<!-- 주소 -->
					<!-- 오픈소스 도로명 주소 API -->
					<!-- https://www.poesis.org/postcodify/ -->
					<div class="row mb-3 form-row">
						<div class="col-md-3">
							<label for="postcodify_search_button">우편번호</label>
						</div>



						<div class="col-md-3">
							<input type="text" name="post" id="post" class="form-control postcodify_postcode5">
						</div>
						<div class="col-md-3">
							<button type="button" class="btn btn-success" id="postcodify_search_button" style="background-color: #5b3929; border-color: #5b3929;">검색</button>
						</div>
					</div>

					<br>

					<div class="row mb-3 form-row">
						<div class="col-md-3">
							<label for="address1">도로명 주소</label>
						</div>
						<div class="col-md-9">
							<input type="text" class="form-control postcodify_address" name="address1" id="address1">
						</div>
					</div>

					<br>

					<div class="row mb-3 form-row">
						<div class="col-md-3">
							<label for="address2">상세주소</label>
						</div>
						<div class="col-md-9">
							<input type="text" class="form-control postcodify_details" name="address2" id="address2">
						</div>
					</div>

					<br>

					<!-- 전화번호 -->
					<div class="row mb-3 form-row">
						<!-- 전화번호1 -->
						<div class="col-md-3">
							<select class="custom-select" id="phone1" name="phone1" required>
								<option>010</option>
								<option>011</option>
								<option>016</option>
								<option>017</option>
								<option>019</option>
							</select>
						</div>

						<!-- 전화번호2 -->
						<div class="col-md-3">
							<input type="number" class="form-control phone" id="phone2" maxlength="4" name="phone2" required>
						</div>

						<!-- 전화번호3 -->
						<div class="col-md-3">
							<input type="number" class="form-control phone" id="phone3" maxlength="4" name="phone3" required>
						</div>

						<div class="col-md-6 offset-md-3">
							<span id="checkPhone">&nbsp;</span>
						</div>

					</div>



					<!-- 카테고리 버튼 -->
					<div>
						<label>카테고리</label>
					</div>

					<hr>

					<label class="box-radio-input"> <input type="radio" name="shopCategoryNo" id="altn" value="1"><span>미술</span>
					</label> <label class="box-radio-input"> <input type="radio" name="shopCategoryNo" id="pic" value="2"><span>사진/영상</span>
					</label> <label class="box-radio-input"> <input type="radio" name="shopCategoryNo" id="cook" value="3"><span>요리/음료</span>
					</label> <label class="box-radio-input"> <input type="radio" name="shopCategoryNo" id="bty" value="4"><span>뷰티</span>
					</label> <label class="box-radio-input"> <input type="radio" name="shopCategoryNo" id="music" value="5"><span>음악</span>
					</label> <br>
					<!--  -->
					<label class="box-radio-input"> <input type="radio" name="shopCategoryNo" id="exercise" value="6"><span>운동</span>
					</label> <label class="box-radio-input"> <input type="radio" name="shopCategoryNo" id="craft" value="7"><span>공예</span>
					</label> <label class="box-radio-input"> <input type="radio" name="shopCategoryNo" id="writing" value="8"><span>글쓰기</span>
					</label> <label class="box-radio-input"> <input type="radio" name="shopCategoryNo" id="kids" value="9"><span>키즈</span>
					</label> <label class="box-radio-input"> <input type="radio" name="shopCategoryNo" id="flowers" value="10"><span>플라워</span>
					</label>


					<hr>

					<!-- 공방 썸네일 -->
					<div class="form-inline mb-2">
						<label>썸네일</label>
						<div class="boardImg" id="titleImgArea">
							<img id="titleImg" width="200" height="200">
						</div>
					</div>

					<br>

					<!-- 파일 업로드 하는 부분 -->
					<div id="fileArea">
						<input type="file" id="img0" name="images" onchange="LoadImg(this,0)">
					</div>
					<!-- 공방 썸네일 소개 글 -->
					<div>
						<label>공방 썸네일 소개글</label>
						<div>
							<input class="form-control" id="introshop" name="thumbInfo" autocomplete="off" required>
						</div>
					</div>


					<br>


					<div class="form-group">
						<div>
							<label for="content">내용</label>
						</div>
						<textarea class="form-control" id="summernote" name="shopInfo" rows="5" style="resize: none;"></textarea>
					</div>


					<div class="text-center">
						<button type="submit" class="btn btn-success" style="background-color: #fbbc73; border-color: #fbbc73;">등록</button>
						<a class="btn btn-success float-right" href="" style="background-color: #fbbc73; border-color: #fbbc73;">취소</a>
						<a class="btn btn-success float-right" href="" style="background-color: #fbbc73; border-color: #fbbc73;">목록으로</a>
		
					</div>


				</form>

			</div>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp" />


</body>
</html>
