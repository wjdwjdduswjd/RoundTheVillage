<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이디찾기</title>
<!-- 스타일 링크 -->
<link rel="stylesheet" href="${contextPath}/resources/css/member/idFind.css" type="text/css">
<!-- 부트스트랩 사용을 위한 css 추가 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<!-- 부트스트랩 사용을 위한 라이브러리 추가 (반드시 jQuery가 항상 먼저여야한다. 순서 중요!) -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<c:if test="${!empty swalTitle }">
			<script>
				alert("${swalTitle}");
			</script>
		</c:if>

		<!-- 메인 이동 로고 -->
		<div class="login-logo-area">
				<a href="${contextPath}"><img src="${contextPath}/resources/images/logo/main_logo_zero.png" class="login-logo"></a>
		</div>



		<!-- 아이디찾기, 비밀번호 찾기 -->
		<div class="s_radio">
			<span class="f"> <label class="box-radio-input"> <input type="radio" name="cp_item" checked="checked" onclick="location.href='${contextPath}/member/idFind'"><span>아이디 찾기</span>
			</label>
			</span> <span class="s"> <label class="box-radio-input"> <input type="radio" name="cp_item" onclick="location.href='${contextPath}/member/pwdFind'"><span>비밀번호 찾기</span>
			</label>
			</span>
		</div>
		<hr>

		<form  action="idFindComplete" method="POST"  class="needs-validation"  name="idFindForm" onsubmit="return validate();">
			<!-- 이름, 이메일 입력 -->
			<div class="input-text">
				<div class="input-area in-area">
					<label class="text">이름</label> <input class="b" type="text" name="memberName" id="name" required>
					<div class="check">
						<label class="text"></label><span id="checkName">&nbsp;</span>
					</div>
				</div>


				<div class="input-area ">
					<label class="text">이메일 주소</label> <input class="b" type="text" name="memberEmail" id="email" placeholder="가입시 사용한 이메일을 입력해주세요." required>
					<button id="email_button"  type="button" class="email_button">인증번호 받기</button>
					<div class="check">
						<label class="text"></label><span id="checkEmail">&nbsp;</span>
					</div>
				</div>

				<!-- 이메일인증번호 입력부분 -->
				<div class="input-area">
					<label class="addr text"></label> <input class="b" type="text" name="verifyEmail" id="verifyEmail" placeholder="받은 인증번호를 입력해주세요." required>
					<div class="check">
						<label class="text"></label><span id="checkNumEmail">&nbsp;</span>
					</div> 	
				</div>

				<!-- 완료 버튼 -->
				<div class="input-area">
					<label class="addr text"></label>
					<button class="b b-a" type="submit" name="idFinBtn" id="idFinBtn">완료</button>
				</div>

			</div>

		</form>



	</div>
	
	<script>
	var signUpCheck = {
			"name" : false,
			"email" : false,
	};
	
	var $name = $("#name");
	var $email = $("#email");
	
	
	// 이름 유효성 검사
	$name.on("input", function() {
		var regExp = /^[가-힣]{2,}$/; // 한글 두 글자 이상

		if (!regExp.test($(this).val())) { // 이름이 정규식을 만족하지 않을경우
			$("#checkName").text("한글 두 글자 이상을 입력하세요").css("color", "red");
			signUpCheck.name = false;
		} else {
			$("#checkName").text("정상입력").css("color", "green");
			signUpCheck.name = true;
		}
	});
	
	// 이메일 유효성 검사
	$email.on("input",function() {
		var regExp = /^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/; // 4글자 아무단어 @ 아무단어 . * 3
		if (!regExp.test($(this).val())) { // 이메일이 정규식을 만족하지 않을경우
			$("#checkEmail").text("이메일 형식이 유효하지 않습니다.").css("color", "red");
			signUpCheck.email = false;
		} else {// 이메일 형식이 올바른 경우
			$("#checkEmail").text("올바른 이메일 형식입니다.").css("color", "green");
			signUpCheck.email = true;
		}

	});
	
	// 유효성 검사 
	function validate() {

		//alert(0);

		for ( var key in signUpCheck) {
			if (!signUpCheck[key]) {
				var str;
				switch (key) {
				case "name" : str = "이름"; break;
				case "email" : str = "이메일"; break;
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


		$("form[name='idFindForm']");

	}
	
	
	// ----------------메일 인증 AJAX -------------------------
    var key;
    
    $("#email_button").click(function() {// 메일 입력 유효성 검사
     var mail = $("#email").val(); //사용자의 이메일 입력값. 
     console.log(mail)
     if (mail == "") {
        alert("메일 주소가 입력되지 않았습니다.");
     } else {
        $.ajax({  
           url : 'normalSignUpMail',
           data : { "mail" : mail,
        	   				"title" : "[동네한바퀴 아이디 찾기] 아이디 찾기에 필요한 이메일 인증 번호    "},
           type : 'post',
           success : function(result){
              key = result;
              
			     alert("인증번호가 전송되었습니다.");
           }
        });
     }
  }); 
  
  $("#verifyEmail").on("propertychange change keyup paste input", function() {
     if ($("#verifyEmail").val() == key) {   //인증 키 값을 비교를 위해 텍스트인풋과 벨류를 비교
        $("#checkNumEmail").text("인증에 성공하셨습니다.").css("color", "green");
        isCertification = true;  //인증 성공여부 check
     } else {
        $("#checkNumEmail").text("인증 번호가 틀렸습니다. 다시 입력해주세요.").css("color", "red");
        isCertification = false; //인증 실패
     }
  });
  
  
  $("#idFinBtn").click(function validate(){
     if(isCertification==false){
        alert("메일 인증이 완료되지 않았습니다.");
        return false;
     }
  }); 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	</script>
	
</body>
</html>