<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 수정</title>
<!-- 스타일 링크 -->
<link rel="stylesheet" href="${contextPath}/resources/css/mypage/myInfoChange.css" type="text/css">
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

		<div class="mypageInfo">

		<form method="POST" action="updateAction" name="updateForm"  onsubmit="return updateValidate();" class="form-horizontal" role="form">

			<!-- 내 등급  -->
			<div class="grade">
				<div class="my-grade">내 등급</div>
			</div><!-- 
			
			
			
	--><div class="grade">   <!-- 등급 계산 필요   누적 금액으로 계산하기!!!  -->
				<div class="my-grade">LV.5 GOLD</div>
			</div>


			<div class="m-h3">
				<h3>My Page</h3>
			</div>

			<!--  내 정보 -->
			<div class="myInfo">

				<div class="info">

					<div class="info-a">
						<h3>내 정보</h3>
					</div>

					<div class="info-b">
						<label class="label-area">아이디</label>
						<div class="output">user01</div>
					</div>

					<div class="info-b">
						<label class="label-area">이름</label>
						<div class="output">이잔산</div>
					</div>

					<div class="info-b">
						<label class="label-area">닉네임</label>
						<input class="output input-area" name="nickName">
					</div>

					<div class="info-b">
						<label class="label-area">이메일</label>
						<div class="output">user01@naver.com</div>
					</div>


					<div class="info-b">
						<label class="label-area">비밀번호 변경</label>
						<button type="button" id="chagePwd" class="chagePwd" onclick="location.href='${contextPath}/mypage/changePwd'">비밀번호 변경</button>
					</div>
		
		
					<!-- 관심분야 -->
					<div class="info-b">
					
            <label class="title">관심분야 <label style="font-size: 12px; margin-bottom: 0.5;">(중복선택 가능)</label></label><br>

            <label class="box-checkbox-input">
                <input type="checkbox" name="intrs" id="art" value="미술" checked="checked"><span>미술</span>
            </label>

            <label class="box-checkbox-input">
                <input type="checkbox" name="intrs" id="pic" value="사진/영상"><span>사진/영상</span>
            </label>

            <label class="box-checkbox-input">
                <input type="checkbox" name="intrs" id="cook" value="요리/음료"><span>요리/음료</span>
            </label>

            <label class="box-checkbox-input">
                <input type="checkbox" name="intrs" id="bty" value="뷰티"><span>뷰티</span>
            </label>

            <label class="box-checkbox-input">
                <input type="checkbox" name="intrs" id="music" value="음악"><span>음악</span>
            </label>
            <br><!--  -->
            <label class="box-checkbox-input">
                <input type="checkbox" name="intrs" id="exercise" value="운동"><span>운동</span>
            </label>
            <label class="box-checkbox-input">
                <input type="checkbox" name="intrs" id="craft" value="공예"><span>공예</span>
            </label>
            <label class="box-checkbox-input">
                <input type="checkbox" name="intrs" id="writing" value="글쓰기"><span>글쓰기</span>
            </label>
            <label class="box-checkbox-input">
                <input type="checkbox" name="intrs" id="kids" value="키즈"><span>키즈</span>
            </label>
            <label class="box-checkbox-input">
                <input type="checkbox" name="intrs" id="flowers" value="플라워"><span>플라워</span>
            </label>
					</div>

					<!-- 주소 -->
					<div class="info-b">
	          <label class="title">거주지 주소</label>
	
	          <div>
	              <label class="addr text">우편번호</label>
	              <input class="a" type="text" name="address1" id="address1">
	              <button type="button" id="search_button" class="search_button">검색</button>
	          </div>
	          <br><br>
	
	          <div>
	              <label class="addr text">도로명 주소</label> 
	              <input class="b" type="text" name="address2" id="address2">
	          </div>
	          <br><br>
	          
	          <div>
	              <label class="addr text">상세 주소</label>
	              <input class="b" type="text" name="address3" id="address3">
	          </div>
	         </div>

					 
					 <!-- 수정하기 -->
					 <div class="myInfoChange-area">
               <button type="submit" id="myInfoChange" class="btn">수정하기</button>
           </div>



				</div>
			</div>

		
			<!-- 탈퇴하기 -->
			<div class="secession">
				<a onclick="location.href='${contextPath}/mypage/secession'" class="a-text">탈퇴하기</a> 
			</div>
			
			
			
		</form>
			
		</div>
		
	</div>




	<%-- <jsp:include page="../common/footer.jsp"/> --%>
</body>
</html>