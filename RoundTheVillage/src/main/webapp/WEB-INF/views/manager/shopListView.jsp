<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


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

</head>
<body>
	<jsp:include page="../common/header.jsp" />

	
	<div class="container">

		<div class="py-5">
			<h2>공방 신청 확인</h2>
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
						${shop.shopOwnerName }
						</div>

					
					</div>


					<!-- 공방명 -->
					<div class="row mb-3 form-row">
						<div class="col-md-3">
							<label for="shopName">공방명</label>
						</div>
						<div class="col-md-6">
								${shop.shopName}
						</div>
					</div>

					<br>

					<!-- 주소 -->
					<div class="row mb-3 form-row">
						<div class="col-md-3">
							<label for="postcodify_search_button">위치</label>
						</div>
					</div>

						<div class="col-md-3">
					${shop.shopAdress}
					</div>

					<br>

					<div class="row mb-3 form-row">
						<div class="col-md-3">
							<label for="shopName">연락처</label>
						</div>
						<div class="col-md-6">
							${shop.shopContact}
						</div>
					</div>
					



						<div class="row mb-3 form-row">
						<div class="col-md-3">
							<label for="shopName">카테고리</label>
						</div>
						<div class="col-md-6">
							${shop.shopCategoryName}
						</div>
					</div>
					

			


					<hr>

					<!-- 공방 썸네일 -->
					<div class="form-inline mb-2">
						<label>썸네일</label>
						<div class="boardImg" id="titleImgArea">
							<img src="${contextPath}${thumb.filePath}/${thumb.fileName}">
						</div>
					</div>

					<br>

	
			
					<!-- 공방 썸네일 소개 글 -->
					<div>
						<label>공방 썸네일 소개글</label>
						<div>
							
						</div>
						${shop.thumbInfo}
					</div>


					<br>


					<div class="form-group">
						<div>
							<label for="content">공방소개</label>
						</div>
						<div>
								<%
								pageContext.setAttribute("newLine", "\n");
								%>

								${fn:replace(shop.shopInfo , newLine, "<br>" ) }
						</div>
					
					</div>


					<div class="text-center">
					  <a href="../shop/${shop.shopNo}" class="btn btn-around <c:if test="${shop.shopRegiFL == 'Y'.charAt(0)}">disabled</c:if>">등록</a>
						<a class="btn btn-success float-right" href="" style="background-color: #fbbc73; border-color: #fbbc73;">취소</a>
		
					</div>


				</form>

			</div>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp" />



</body>
</html>
