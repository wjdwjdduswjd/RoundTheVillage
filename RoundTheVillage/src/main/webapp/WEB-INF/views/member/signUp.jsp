<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<!-- 스타일 링크 -->
<link rel="stylesheet" href="${contextPath}/resources/css/member/signUp.css" type="text/css">
<!-- 부트스트랩 사용을 위한 css 추가 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<!-- 부트스트랩 사용을 위한 라이브러리 추가 (반드시 jQuery가 항상 먼저여야한다. 순서 중요!) -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</head>

<body>
	<div class="container">

		<div class="signUp">


			<!-- 메인 이동 로고 -->
			<div class="login-logo-area">
				<a href="${contextPath}"><img src="${contextPath}/resources/images/logo/main_logo_zero.png" class="login-logo"></a>
			</div>

			<form method="POST" action="signUpAction" class="needs-validation" name="signUpForm" onsubmit="return validate();">

				<!-- 회원 종류 선택 -->
				<div class="s_radio">
					<span class="f"> <label class="box-radio-input"> <input type="radio" name="memberType" value="G" checked="checked"><span>일반 회원</span>
					</label>
					</span> <span class="s"> <label class="box-radio-input"> <input type="radio" name="memberType" value="C"><span>공방 회원</span>
					</label>
					</span>
				</div>

				<!-- 이름 -->
				<label class="title">* 이름</label><br> <input type="text" name="memberName" id="name" required>
				<div class="check">
					<span id="checkName">&nbsp;</span>
				</div>

				<!-- 닉네임 -->
				<label class="title">* 닉네임</label><br> <input type="text" name="memberNickname" id="nickName" placeholder="닉네임 연결" value="${kakaoNickName}" required>
				<div class="check">
					<span id="checkNickName">&nbsp;</span>
				</div>


				<!-- 아이디 입력 -->
				<c:if test="${!empty kakaoId}">
					<input type="hidden" name="memberId" id="id" placeholder="아이디 조건" value="${kakaoId}" required>
					<input type="hidden" name="memberPwd" id="pwd1" maxlength="12" value="kakao_login">
					<input type="hidden" name="memberPwd2" id="pwd2" maxlength="12" placeholder="비밀번호를 한번 더 입력해주세요." value="kakao_login" required>
				</c:if>
				
				<c:if test="${empty kakaoId}">
					<label class="title">* 아이디</label><br> <input type="text" name="memberId" id="id" placeholder="아이디 조건" required>
					<div class="check">
						<span id="checkId">&nbsp;</span>
					</div>
			
					<!-- 비밀번호 -->
					<label class="title" for="pswd1">* 비밀번호</label><br> <input type="password" name="memberPwd" id="pwd1" maxlength="12">
					<div class="check">
						<span id="checkPwd1">&nbsp;</span>
					</div>
	
					<!-- 비밀번호 확인 -->
					<label class="title" for="pswd2">비밀번호 확인</label><br> <input type="password" name="memberPwd2" id="pwd2" maxlength="12" placeholder="비밀번호를 한번 더 입력해주세요." required>
					<div class="check">
						<span id="checkPwd2">&nbsp;</span>
					</div>
				</c:if>


				<!-- 이메일 -->
				<div class="email_area">
					<label class="title">* 이메일</label><br>
					<div class="email">
						<input type="email" name="memberEmail" id="email" placeholder="example@naver.com" value="${kakaoEmail}" required>
						<button class="email_button" type="button" id="email_button">이메일 인증</button>
					</div>
					<div class="check">
						<span id="checkEmail">&nbsp;</span>
					</div>
					<label class="title">
						<input type="text" name="verifyEmail" id="verifyEmail" placeholder="받은 인증번호를 입력해주세요.">
					</label>
					<div class="check">
						<span id="checkNumEmail">&nbsp;</span>
					</div>
				</div>

				<!-- 주소 -->
				<label class="title">* 거주지 주소</label>


				<div class="row mb-3 form-row">
					<div class="col-md-3">
						<label for="postcodify_search_button" class="addr-title">우편번호</label>
					</div>
					<div class="col-md-3">
						<input type="text" name="post" id="post" class="form-control postcodify_postcode5" required readonly>
					</div>
					<div class="col-md-3">
						<button type="button" class="search_button " id="postcodify_search_button">검색</button>
					</div>
				</div>


				<div class="row mb-3 form-row">
					<div class="col-md-3">
						<label for="address1" class="addr-title">도로명 주소</label>
					</div>
					<div class="col-md-9">
						<input type="text" class="form-control postcodify_address" name="address1" id="address1" required readonly>
					</div>
				</div>

				<div class="row mb-3 form-row">
					<div class="col-md-3">
						<label for="address2" class="addr-title">상세주소</label>
					</div>
					<div class="col-md-9">
						<input type="text" class="form-control postcodify_details" name="address2" id="address2" required>
					</div>
				</div>
				<!-- -------------------- 주소 -------------------- -->


				<!-- 관심분야 -->
				<label class="title">관심분야 <label style="font-size: 12px; margin-bottom: 0.5;">(중복선택 가능)</label></label>
				<br> 
				<label class="box-checkbox-input"> <input type="checkbox" name="memberIntrs" id="art" value="미술"><span>미술</span></label> 
				<label class="box-checkbox-input"> <input type="checkbox" name="memberIntrs" id="pic" value="사진/영상"><span>사진/영상</span></label> 
				<label class="box-checkbox-input"> <input type="checkbox" name="memberIntrs" id="cook" value="요리/음료"><span>요리/음료</span></label> 
				<label class="box-checkbox-input"> <input type="checkbox" name="memberIntrs" id="bty" value="뷰티"><span>뷰티</span></label> 
				<label class="box-checkbox-input"> <input type="checkbox" name="memberIntrs" id="music" value="음악"><span>음악</span></label> <br>
				<!--  -->
				<label class="box-checkbox-input"> <input type="checkbox" name="memberIntrs" id="exercise" value="운동"><span>운동</span></label> 
				<label class="box-checkbox-input"> <input type="checkbox" name="memberIntrs" id="craft" value="공예"><span>공예</span></label> 
				<label class="box-checkbox-input"> <input type="checkbox" name="memberIntrs" id="writing" value="글쓰기"><span>글쓰기</span></label> 
				<label class="box-checkbox-input"> <input type="checkbox" name="memberIntrs" id="kids" value="키즈"><span>키즈</span></label> 
				<label class="box-checkbox-input"> <input type="checkbox" name="memberIntrs" id="flowers" value="플라워"><span>플라워</span></label>



				<!-- 가입하기 버튼 -->
				<div>
					<button type="submit" id="signBtn" class="btn">가입하기</button>
				</div>
				<!-- 버튼 눌렀을 때 성공 창 뜨고 메인으로 돌아가게하기 -->
			</form>

		</div>

	</div>

	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script>
		// 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
		$(function() {
			$("#postcodify_search_button").postcodifyPopUp();
		});
	</script>
	<script>
		// 유효성 검사 결과 저장할 객체
		var signUpCheck = {
			"id" : false,
			"pwd1" : false,
			"pwd2" : false,
			"name" : false,
			"email" : false,
			"nickName" : false
		};
		
		

		var $id = $("#id");
		var $pwd1 = $("#pwd1");
		var $pwd2 = $("#pwd2");
		var $name = $("#name");
		var $email = $("#email");
		var $nickName = $("#nickName");
		
		
		
		//----------------- 카카오 로그인 -----------------
		if("${kakaoId}" != ""){
			signUpCheck.id = true;
			signUpCheck.pwd1 = true;
			signUpCheck.pwd2 = true;
		}
		
		if("${kakaoNickName}" != ""){
			$.ajax({
				url : "nickNameDupCheck",
				data : {"memberNickname" : "${kakaoNickName}"},
				type : "post",
				success : function(result){
					if(result == 0){
						$("#checkNickName").text("사용 가능한 닉네임입니다.").css("color", "green");
						signUpCheck.nickName = true;
					}else{
						$("#checkNickName").text("이미 사용 중인 닉네임입니다.").css("color", "red");
						signUpCheck.nickName = false;
					}
				},
				error : function() {
					console.log("ajax 통신 실패");
				}

			});
		}
		
		if("${kakaoEmail}" != ""){
			$.ajax({
				url : "emailDupCheck",
				data : {"memberEmail" : "${kakaoEmail}"},
				type : "post",
				success : function(result) {
					if (result == 0) { // 중복되지 않은 경우
						$("#checkEmail").text("사용가능한 올바른 이메일입니다.")
								.css("color", "green");
						signUpCheck.email = true;
						eCheck = true;
						
						isCertification = true;
						$(".email_area").hide();
						
					} else {
						$("#checkEmail").text("이미 사용 중인 이메일입니다.")
								.css("color", "red");
						signUpCheck.email = false;
						eCheck = false;
					}
				},
				error : function() {
					console.log("이메일 중복 검사 실패");
				}
			});
			
			
		}
		//----------------- 카카오 로그인 -----------------
			
			
		
		
		// 아이디 유효성 검사
		$id.on("input", function() {
			// 첫글자는 영어 소문자, 나머지 글자는 영어 대,소문자 + 숫자, 총 6~12글자
			var regExp = /^[a-z][a-zA-z\d]{5,11}$/;
			if (!regExp.test($id.val())) {
				$("#checkId").text("아이디 형식이 유효하지 않습니다.").css("color", "red");
				signUpCheck.id = false;

			} else {
				//signUpCheck.id = true;
				//$("#checkId").text("유효한 아이디 형식입니다.").css("color", "green");

				//******************************** 아이디 중복 검사(ajax) *******************************************
				//  . / 이런거 없으면 일단 상대경로
				$.ajax({
					url : "idDupCheck",
					data : {
						"memberId" : $id.val()
					},
					type : "post",
					success : function(result) {
						//console.log(result);

						if (result == 0) { // 중복 X == 사용 가능한 아이디
							$("#checkId").text("사용 가능한 아이디 입니다.").css("color",
									"green");
							signUpCheck.id = true;
						} else {
							$("#checkId").text("이미 사용 중인 아이디 입니다.").css(
									"color", "red");
							signUpCheck.id = false;
						}

					},
					error : function() {
						console.log("ajax 통신 실패");
					}

				});

			}
		});
		
		//닉네님 유효성 검사
		$nickName.on("input", function(){
			
			$.ajax({
				url : "nickNameDupCheck",
				data : {"memberNickname" : $nickName.val()},
				type : "post",
				success : function(result){
					if(result == 0){
						$("#checkNickName").text("사용 가능한 닉네임입니다.").css("color", "green");
						signUpCheck.nickName = true;
					}else{
						$("#checkNickName").text("이미 사용 중인 닉네임입니다.").css("color", "red");
						signUpCheck.nickName = false;
					}
				},
				error : function() {
					console.log("ajax 통신 실패");
				}

			});
			
		});
		

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

		// 비밀번호 유효성 및 일치 검사
		$("#pwd1, #pwd2").on("input",function() {
			//영어 대,소문자 + 숫자, 총 6~12글자
			var regExp = /^[A-Za-z0-9]{6,12}$/;

			// 비밀번호1 유효성 검사
			if (!regExp.test($("#pwd1").val())) {
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
			} else if (signUpCheck.pwd1 && $pwd2.val().length > 0) {
				if ($("#pwd1").val().trim() != $("#pwd2").val()
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

		// 이메일 유효성 검사
		$email.on("input",
				function() {
					var regExp = /^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/; // 4글자 아무단어 @ 아무단어 . * 3
					if (!regExp.test($(this).val())) { // 이메일이 정규식을 만족하지 않을경우
						$("#checkEmail").text("이메일 형식이 유효하지 않습니다.").css(
								"color", "red");
						signUpCheck.email = false;
					} else {// 이메일 형식이 올바른 경우

						$.ajax({
							url : "emailDupCheck",
							data : {
								"memberEmail" : $(this).val()
							},
							type : "post",
							success : function(result) {
								if (result == 0) { // 중복되지 않은 경우
									$("#checkEmail").text("사용가능한 올바른 이메일입니다.")
											.css("color", "green");
									signUpCheck.email = true;
									eCheck = true;
								} else {
									$("#checkEmail").text("이미 사용 중인 이메일입니다.")
											.css("color", "red");
									signUpCheck.email = false;
									eCheck = false;
								}
							},
							error : function() {
								console.log("이메일 중복 검사 실패");
							}
						});
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
					case "id" : str = "아이디"; break;
					case "pwd1" : str = "비밀번호"; break;
					case "pwd2" : str = "비밀번호 확인"; break;
					case "email" : str = "이메일"; break;
					case "nickName" : str = "닉네임"; break;
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

			$memberAddr = $("<input>", {
				type : "hidden",
				name : "memberAddr",
				value : $("#post").val() + "," + $("#address1").val() + ","
						+ $("#address2").val()
			});

			$("form[name='signUpForm']").append($memberAddr);

		}
		
		
		
		// ----------------메일 인증 AJAX -------------------------
        var key;
        
        $("#email_button").click(function() {// 메일 입력 유효성 검사
         var mail = $("#email").val(); //사용자의 이메일 입력값. 
         
         if (mail == "") {
            alert("메일 주소가 입력되지 않았습니다.");
         } else {
            $.ajax({
               url : 'normalSignUpMail',
               data : { mail : mail,
            	   "title" : "[동네한바퀴 회원가입] 회원가입에 필요한 이메일 인증 번호"},
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
      
      
      $("#signBtn").click(function validate(){
         if(isCertification==false){
            alert("메일 인증이 완료되지 않았습니다.");
            return false;
         }
      }); 
		
		
		
		
		
		
		
	</script>

</body>

</html>