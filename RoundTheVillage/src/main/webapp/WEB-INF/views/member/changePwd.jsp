<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<!-- 스타일 링크 -->
<link rel="stylesheet" href="${contextPath}/resources/css/mypage/changePwd.css" type="text/css">
<!-- 부트스트랩 사용을 위한 css 추가 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<!-- 부트스트랩 사용을 위한 라이브러리 추가 (반드시 jQuery가 항상 먼저여야한다. 순서 중요!) -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</head>
<body>
	<%-- <jsp:include page="../common/header.jsp"/> --%>

	<div class="container">
		<!--  내 정보 -->
		<div class="myInfo">

			<div class="info">

				<div class="info-a">
					<h3>비밀번호 변경</h3>
				</div>

				<div class="info-b">
					<label class="label-area">현재 비밀번호</label> <input class="output input-area" name="pwd">
				</div>

				<br><br><br>
				<hr>

				<div class="info-b">
					<label class="label-area">새 비밀번호</label> <input class="output input-area" name="newPwd">
				</div>

				<div class="info-b">
					<label class="label-area">새 비밀번호 확인</label> <input class="output input-area" name="newPwd">
				</div>

			 <!-- 변경 -->
			 <div class="myInfoChange-area">
           <button type="submit" id="myInfoChange" class="btn">변경하기</button>
       </div>





			</div>
		</div>
	</div>



	<%-- <jsp:include page="../common/footer.jsp"/> --%>
</body>
</html>