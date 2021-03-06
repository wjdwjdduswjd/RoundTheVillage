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


				<form method="POST" action="updatePwd" onsubmit="return validate();" class="form-horizontal" role="form">

					<div class="info-b">
						<label class="label-area">현재 비밀번호</label> <input class="output input-area" type="password" name="memberPwd" id="memberPwd" maxlength="12">
					</div>

					<div class="info-b">
						<label class="label-area">이메일 주소</label><input class="b input-area" type="text" name="memberEmail" id="email" placeholder="가입시 사용한 이메일을 입력해주세요." required>
						<button id="email_button" class="email_button">인증번호 받기</button>
						<div class="check">
							<label class="text"></label><span id="checkEmail">&nbsp;</span>
						</div>
					</div>
					
					<!-- 이메일인증번호 입력부분 -->
					<div class="info-b">
						<label class="label-area"></label><input class="b input-area" type="text" name="verifyEmail" id="verifyEmail" placeholder="받은 인증번호를 입력해주세요." required>
						<div class="check">
							<label class="text"></label><span id="checkNumEmail">&nbsp;</span>
						</div>
					</div>
					
					

					<br>
					<br>
					<br>
					<hr>

					<div class="info-b">
						<label class="label-area">새 비밀번호</label> <input class="output input-area" type="password" id="newPwd1" name="newPwd1">
						<div class="check">
							<span id="checkPwd1">&nbsp;</span>
						</div>
					</div>

					<div class="info-b">
						<label class="label-area">새 비밀번호 확인</label> <input class="output input-area" type="password" id="newPwd2" name="newPwd2">
						<div class="check">
							<span id="checkPwd2">&nbsp;</span>
						</div>
					</div>

					<!-- 변경 -->
					<div class="myInfoChange-area">
						<button type="submit" id="myInfoChange" class="btn">변경하기</button>
					</div>

				</form>



			</div>
		</div>
	</div>



	<%-- <jsp:include page="../common/footer.jsp"/> --%>





	<script>
	
		var signUpCheck = {
			"newPwd1" : false,
			"newPwd2" : false,
		};
	
		var $newPwd1 = $("#newPwd1");
		var $newPwd2 = $("#newPwd2");
	
		// 비밀번호 유효성 및 일치 검사
		$("#newPwd1, #newPwd2").on("input",function() {
			//영어 대,소문자 + 숫자, 총 6~12글자
			var regExp = /^[A-Za-z0-9]{6,12}$/;

			// 비밀번호1 유효성 검사
			if (!regExp.test($("#newPwd1").val())) {
				$("#checkPwd1").text("비밀번호 형식이 유효하지 않습니다.")
						.css("color", "red");
				signUpCheck.pwd1 = false;
			} else {
				$("#checkPwd1").text("유효한 비밀번호 형식입니다.").css(
						"color", "green");
				signUpCheck.pwd1 = true;
			}

			// 비밀번호1이 유효하지 않은 상태로 비밀번호 2를 작성하는 경우
			if (!signUpCheck.pwd1 && $pwd2.val().length > 0) {
				alert("유효한 비밀번호를 작성해 주세요.");
				$pwd2.val("");
				$pwd1.focus();
			} else if (signUpCheck.pwd1
					&& $pwd2.val().length > 0) {
				if ($("#newPwd1").val().trim() != $("#newPwd2").val()
						.trim()) {
					$("#checkPwd2").text("비밀번호 불일치").css(
							"color", "red");
					signUpCheck.pwd2 = false;
				} else {
					$("#checkPwd2").text("비밀번호 일치").css(
							"color", "green");
					signUpCheck.pwd2 = true;
				}
			}

		});

		
		
		function validate() {
			//영어 대,소문자 + 숫자, 총 6~12글자
			var regExp = /^[A-Za-z0-9]{6,12}$/;
			if(!regExp.test($("#newPwd1").val())){ 
				alert("유효하지 않은 비밀번호 입니다.");
				$("#newPwd1").focus();
				
				return false;
      }
			
			if($("#newPwd1").val() != $("#newPwd2").val()){
				alert("새 비밀번호가 일치하지 않습니다.");
				$("#newPwd2").focus();
				
				return false;
			}

		}
		
	</script>
</body>
</html>