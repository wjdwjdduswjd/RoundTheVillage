<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공방 등록 페이지</title>
<link rel="stylesheet" href="${contextPath}/resources/css/pay/pay.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<style>

* {
	font-family: 'NanumSquare', sans-serif !important;
	font-size: 16px;
}

.container {
	margin-top: 30px;
}



</style>

</head>
<body>
	<jsp:include page="../common/header.jsp" />


	<div class="container">

			<h2 class="hr-sect mt-5 mb-4">공방 신청 확인</h2>
	



			<br>

			<div class="row p-3 bg-light rounded mb-7">




				<!-- 대표자 이름 -->
		
					<div class="offset-md-1 col-md-10 mb-3 bg-white rounded border border-secondary"> 대표 : ${shop.shopOwnerName }</div>
			


				<!-- 공방명 -->
		
					<div class="offset-md-1 col-md-10 mb-3 bg-white rounded border border-secondary">공방명 : ${shop.shopName}</div>
			

				<br>

				<!-- 주소 -->
		
				<div class="offset-md-1 col-md-10 mb-3 bg-white rounded border border-secondary">위치 : ${shop.shopAdress}</div>
			


				<br>


			
					<div class="offset-md-1 col-md-10 mb-3 bg-white rounded border border-secondary"> 연락처 : ${shop.shopContact}</div>
		

		
				<div class="offset-md-1 col-md-10 mb-3 bg-white rounded border border-secondary"> 카테고리 :  ${shop.shopCategoryName}</div>



				<!-- 공방 썸네일 -->
				<strong class="offset-md-1 col-md-10 p-1 mb-2">썸네일</strong>
						<img src="${contextPath}${thumb.filePath}/${thumb.fileName}" 
						style = "width : 200px; height :200px;">
			

		



				<!-- 공방 썸네일 소개 글 -->
		
			
<strong class="offset-md-1 col-md-10 p-1 mb-1">썸네일 소개글</strong>
				<div class="offset-md-1 col-md-10 p-1 mb-3">
					${shop.thumbInfo}
				</div>
			
		


				<br>


				
					<strong class="offset-md-1 col-md-10 p-1 mb-1">공방 소개</strong>
					<div class="offset-md-1 col-md-10 p-1 mb-3">
						<%
								pageContext.setAttribute("newLine", "\n");
								%>

						${fn:replace(shop.shopInfo , newLine, "<br>" ) }
					</div>

				</div>

				 <div class="text-right">
        <a href="../regiCon/${shop.shopNo}" class="btn btn-around <c:if test="${shop.shopRegiFL == 'Y'.charAt(0)}">disabled</c:if>">승인</a>
        <a href="${returnListURL}" class="btn btn-around-2">목록으로</a>
    </div>

			</div>
		


	<jsp:include page="../common/footer.jsp" />



</body>
</html>
