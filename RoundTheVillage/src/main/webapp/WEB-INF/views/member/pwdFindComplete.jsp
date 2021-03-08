<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 찾기 완료</title>
<!-- 스타일 링크 -->
<link rel="stylesheet" href="${contextPath}/resources/css/member/pwdFindComplete.css" type="text/css">
<!-- 부트스트랩 사용을 위한 css 추가 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<!-- 부트스트랩 사용을 위한 라이브러리 추가 (반드시 jQuery가 항상 먼저여야한다. 순서 중요!) -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">

		<!-- 메인 이동 로고 -->
		<div class="login-logo-area">
				<a href="${contextPath}"><img src="${contextPath}/resources/images/logo/main_logo_zero.png" class="login-logo"></a>
		</div>

		<!--  비밀번호 찾기  -->
		<div class="s_radio">
			<span class="f"> <label class="box-radio-input"> <input type="radio" name="cp_item" onclick="location.href='${contextPath}/member/idFind'"><span>아이디 찾기</span>
			</label>
			</span> <span class="s"> <label class="box-radio-input"> <input type="radio" name="cp_item" checked="checked" onclick="location.href='${contextPath}/member/pwdFind'"><span>비밀번호 찾기</span>
			</label>
			</span>
		</div>
		<hr>


		<form action="updatePwd" method="POST" class="needs-validation" id="updatePwd"  onsubmit="return validate();" >

			<!-- 새 비밀번호, 새 비밀번호 확인-->
			<div class="input-text">
				<div class="input-area in-area">
					<label class="addr text">새 비밀번호</label> <input class="b" type="password" name="newPwd" id="newPwd">
					<div class="check">
						<label class="text"></label><span id="checkNewPwd">&nbsp;</span>
					</div>
				</div>
	
	
				<div class="input-area">
					<label class="addr text">새 비밀번호 확인</label> <input class="b" type="password" name="newPwd2" id="newPwd2">
					<div class="check">
						<label class="text"></label><span id="checkNewPwd2">&nbsp;</span>
					</div>
				</div>
	
				<!-- 완료 버튼 -->
				<div class="input-area">
					<label class="addr text"></label>
					<button class="b b-a" type="submit" name="newPwdBtn" id="newPwdBtn">완료</button>
				</div>
	
			</div>
			
			
			<input name="memberPwdFind"  type="hidden" value="${memberPwdFind}" >
			
			
		</form>

	</div>

	<script>
	var signUpCheck = {
			"newPwd" : false,
			"newPwd2" : false,
	};
	
	var $newPwd = $("#newPwd");
	var $newPwd2 = $("#newPwd2");
	
	// 비밀번호 유효성 및 일치 검사
	$("#newPwd, #newPwd2")
			.on("input",function() {
						//영어 대,소문자 + 숫자, 총 6~12글자
						var regExp = /^[A-Za-z0-9]{6,12}$/;

						// 비밀번호1 유효성 검사
						if (!regExp.test($("#newPwd").val())) {
							$("#checkNewPwd").text("비밀번호 형식이 유효하지 않습니다.")
									.css("color", "red");
							signUpCheck.newPwd = false;
						} else {
							$("#checkNewPwd").text("유효한 비밀번호 형식입니다.").css(
									"color", "green");
							signUpCheck.newPwd = true;
						}

						// 비밀번호1이 유효하지 않은 상태로 비밀번호 2를 작성하는 경우
						if (!signUpCheck.newPwd && $newPwd2.val().length > 0) {
							alert("유효한 비밀번호를 작성해 주세요.");
							$newPwd2.val("");
							$newPwd.focus();
						} else if (signUpCheck.newPwd && $newPwd2.val().length > 0) {
							if ($("#newPwd").val().trim() != $("#newPwd2").val().trim()) {
								$("#checkNewPwd2").text("비밀번호 불일치").css("color", "red");
								signUpCheck.newPwd2 = false;
							} else {
								$("#checkNewPwd2").text("비밀번호 일치").css("color", "green");
								signUpCheck.newPwd2 = true;
							}
						}

					});

	function validate() {

		//alert(0);

		for ( var key in signUpCheck) {
			if (!signUpCheck[key]) {
				var str;
				switch (key) {
	
				case "newPwd" : str = "비밀번호"; break;
				case "newPwd2" : str = "비밀번호 확인"; break;
				
				}

				swal({
					icon : "warning",
					title : str + " 형식이 유효하지 않습니다."
				}).then(function() { //swal 창이 닫힘 후 동작을 지정
					var id = "#" + key;
					$(id).focus();
				});

				return false;
			}
		}
				
		$("form[id='updatePwd']");
		
	}
				
				
	</script>

</body>
</html>












