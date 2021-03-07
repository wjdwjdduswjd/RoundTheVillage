<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴하기</title>
<!-- 스타일 링크 -->
<link rel="stylesheet" href="${contextPath}/resources/css/mypage/secession.css" type="text/css">
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
					<h3>회원 탈퇴</h3>
				</div>

				<form method="POST" action="deleteMember" onsubmit="return validate();" class="form-horizontal" role="form">

				<div class="info-b">
					<label class="label-area">비밀번호</label> <input type="password" class="output input-area" name="memberPwd" id="memberPwd">
				</div>

				<br><br><br>
				<hr>


				<div class="panel panel-default">

					<div class="panel-body">
						<div class="form-group pull-left">
							<label class="control-label"> 회원 탈퇴 약관 </label>
							<div class="col-xs-12">
								<textarea class=" textarea-conrol" readonly rows="10" cols="100">
제 1 조 (목적)
본 약관은 서비스(이하 “서비스”)를 제공하는 동네한바퀴(이하 “회사”)와 위 서비스를 이용하는 고객 (이하 “고객”)간에 서비스 이용에 관한 권리와 의무 및 책임 기타 제반사항을 규정함을 목적으로 합니다.


제 2 조 (용어의 정의)
① 이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
- '회원'이라 함은 이 약관에 동의하고 회원가입을 한 자로서, 회사가 제공하는 서비스를 이용할 수 있는 이용자를 말합니다.
- '이용자ID'라 함은 회원의 식별 및 서비스 이용을 위하여 회원의 신청에 따라 회사가 회원별로 부여하는 고유한 문자와 숫자의 조합을 말합니다.
- '비밀번호'라 함은 이용자ID로 식별되는 회원의 본인 여부를 검증하기 위하여 회원이 설정하여 회사에 등록한 고유의 문자와 숫자의 조합을 말합니다.
- '단말기'라 함은 서비스에 접속하기 위해 회원이 이용하는 컴퓨터, PDA 등의 전상장치를 말합니다.
- '탈퇴'라 함은 회원이 서비스 이용을 해지하는 것을 말합니다.
② 이 약관에서 사용하는 용어 중 제1항에서 정하지 아니한 것은 관계 법령 및 서비스별 안내에서 정하는 바에 따르며, 그 외에는 일반 관례에 따릅니다.


제 3 조 (이용약관의 효력 및 개정)
① 이 약관은 홈페이지 (http://www.yogerpresso.co.kr)를 통해 온라인으로 공시하고 회원의 동의로 효력을 발생합니다. 본 약관의 공시는 회사 홈페이지 (http://www.yogerpresso.co.kr)

</textarea>
							</div>
							<div class="checkbox pull-right">
								<div class="custom-checkbox">
									<div class="form-check">
										<input type="checkbox" name="agree" id="agree" class="form-check-input custom-control-input"> <br> <label class="form-check-label custom-control-label" for="agree">위 약관에 동의합니다.</label>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 회원 탈퇴 -->

				<!-- 탈퇴하기 -->
				<div class="secession-area">
					<button type="submit" id="secessionBtn" class="btn">탈퇴하기</button>
				</div>
			</form>






			</div>
		</div>
	</div>

	<%-- <jsp:include page="../common/footer.jsp"/> --%>
	
	
	
	<script>
		// submit 동작
		function validate() {

			if($("#memberPwd").val().trim().length == 0 ){
				alert("비밀번호를 입력해주세요");
				$("#currentPwd").focus();
				return false;
			}
			
			if(!$("#agree").prop("checked")){
				alert("약관에 동의해 주세요.");
				return false;
			}else{
				return confirm("정말로 탈퇴하시겠습니까?");
			}
			
		}
	</script>
</body>
</html>