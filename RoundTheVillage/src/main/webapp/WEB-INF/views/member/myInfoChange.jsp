<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 수정</title>
<!-- 스타일 링크 -->
<link rel="stylesheet" href="${contextPath}/resources/css/mypage/myInfoChange.css" type="text/css">
<!-- 부트스트랩 사용을 위한 css 추가 -->
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<!-- 부트스트랩 사용을 위한 라이브러리 추가 (반드시 jQuery가 항상 먼저여야한다. 순서 중요!) -->
</head>
<body>
	<c:if test="${!empty swalTitle}">
      <script>
         swal({icon  : "${swalIcon}",
              title : "${swalTitle}",
              text  : "${swalText}"});
      </script>
   </c:if>
	<jsp:include page="../common/header.jsp"/>
	<div class="container">
	
			<!-- <div class="mypageInfo"> -->

			<c:set var="address" value="${fn:split(loginMember.memberAddr,',' ) }" />


			<!-- 내 등급  -->
			<div class="grade">
				<div class="my-grade">내 등급</div>
			</div><!-- 
			
			
			

				--><div class="grade">
				<!-- 등급 계산 필요   누적 금액으로 계산하기!!!  -->
				<div class="my-grade"><strong>LV.${loginMember.memberGrade}</strong></div>
			</div>



			<form method="POST" action="updateAction" name="updateForm" onsubmit="return updateValidate();" class="form-horizontal" role="form">

				<div class="m-h3">
					<h3>My Page</h3>
				</div>
				
				<c:set var="id" value="${fn: substring(loginMember.memberId,0,2) }" />
				
				<!--  내 정보 -->
				<div class="myInfo">

					<div class="info">

						<div class="info-a">
							<h3>내 정보</h3>
						</div>
						
						
						<c:if test="${id != 'k@' }">
							<div class="info-b">
								<label class="label-area"><strong>아이디</strong> </label>
								<div class="output">${loginMember.memberId}</div>
							</div>
						</c:if>
						<c:if test="${id == 'k@' }">
							<div class="info-b">
								<label ><strong>[ 카카오톡 로그인 중 ]</strong> </label>
							</div>
						</c:if>



						<div class="info-b">
							<label class="label-area"><strong>이름</strong></label>
							<div class="output">${loginMember.memberName}</div>
						</div>

						<div class="info-b">
							<label class="label-area"><strong>닉네임</strong></label> 
							<input class="output input-area" id="nickName" name="memberNickname" value="${loginMember.memberNickname}" required>
							
							<div class="check">
								<label class="label-area"></label> 					
								<span id="checkNickName">&nbsp;</span>
							</div>
						</div>

						<div class="info-b">
							<label class="label-area"><strong>이메일</strong></label>
							<div class="output">${loginMember.memberEmail}</div>
						</div>

						

						<c:if test="${id != 'k@' }">
							<div class="info-b">
								<label class="label-area"><strong>비밀번호 변경</strong></label>
								<button type="button" id="chagePwd" class="chagePwd" onclick="location.href='${contextPath}/member/changePwd'">비밀번호 변경</button>
							</div>
						</c:if>

						<!-- 관심분야 -->
						<div class="info-b">

							<label class="title"><strong>관심분야 </strong><label style="font-size: 12px; margin-bottom: 0.5;">(중복선택 가능)</label></label><br> 
							<label class="box-checkbox-input"> <input type="checkbox" name="intrs" id="art" value="미술"><span>미술</span>
							</label> <label class="box-checkbox-input"> <input type="checkbox" name="memberIntrs" id="pic" value="사진/영상"><span>사진/영상</span>
							</label> <label class="box-checkbox-input"> <input type="checkbox" name="memberIntrs" id="cook" value="요리/음료"><span>요리/음료</span>
							</label> <label class="box-checkbox-input"> <input type="checkbox" name="memberIntrs" id="bty" value="뷰티"><span>뷰티</span>
							</label> <label class="box-checkbox-input"> <input type="checkbox" name="memberIntrs" id="music" value="음악"><span>음악</span>
							</label> <br>
							<!--  -->
							<label class="box-checkbox-input"> <input type="checkbox" name="intrs" id="exercise" value="운동"><span>운동</span>
							</label> <label class="box-checkbox-input"> <input type="checkbox" name="memberIntrs" id="craft" value="공예"><span>공예</span>
							</label> <label class="box-checkbox-input"> <input type="checkbox" name="memberIntrs" id="writing" value="글쓰기"><span>글쓰기</span>
							</label> <label class="box-checkbox-input"> <input type="checkbox" name="memberIntrs" id="kids" value="키즈"><span>키즈</span>
							</label> <label class="box-checkbox-input"> <input type="checkbox" name="memberIntrs" id="flowers" value="플라워"><span>플라워</span>
							</label>
						</div>

 					<div class="info-b">
	          <label class="title"><strong>거주지 주소</strong></label>
	          
	          
						<div class="row mb-3 form-row">
							<div >
								<label for="postcodify_search_button" class="addr text">우편번호</label>
							</div>
							<div class="col-md-3">
								<input type="text" name="post" id="post" class="form-control postcodify_postcode5" required readonly value="${address[0]}">
							</div>
							<div class="col-md-3">
								<button type="button" class="search_button " id="postcodify_search_button">검색</button>
							</div>
						</div>


						<div class="row mb-3 form-row">
							<div >
								<label for="address1" class="addr text">도로명 주소</label>
							</div>
							<div class="col-md-9">
								<input type="text" class="form-control postcodify_address" name="address1" id="address1" required readonly  value="${address[1]}">
							</div>
						</div>

						<div class="row mb-3 form-row">
							<div >
								<label for="address2" class="addr text">상세주소</label>
							</div>
							<div class="col-md-9">
								<input type="text" class="form-control postcodify_details" name="address2" id="address2" required  value="${address[2]}">
							</div>
						</div>
					</div>

						<!-- 수정하기 -->
						<div class="myInfoChange-area">
							<button type="submit" id="myInfoChange" class="btn">수정하기</button>
						</div>



					</div>
				</div>

			</form>

				<c:if test="${id != 'k@' }">
					<!-- 탈퇴하기 -->
					<div class="secession">
						<a onclick="location.href='${contextPath}/member/secession'" class="a-text">탈퇴하기</a>
					</div>
				</c:if>



		<!-- </div> -->

	</div>




	<jsp:include page="../common/footer.jsp"/> 





	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script>
		// 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
		$(function() {
			$("#postcodify_search_button").postcodifyPopUp();
		});
	</script>
	<script>
	var updateCheck = {
			"nickName" : true
	}
	
	var $nickName = $("#nickName");
	
	var loginMember = 
	
	//닉네님 유효성 검사
	$nickName.on("input", function(){
		
			if( $nickName.val() == "${loginMember.memberNickname}" ){
				updateCheck.nickName = true;
				$("#checkNickName").text(" ");
			}else{
				
				$.ajax({
					url : "nickNameDupCheck",
					data : {"memberNickname" : $nickName.val()},
					type : "post",
					success : function(result){
							
							if(result == 0){
								$("#checkNickName").text("사용 가능한 닉네임입니다.").css("color", "green");
								updateCheck.nickName = true;
							}else{
								$("#checkNickName").text("이미 사용 중인 닉네임입니다.").css("color", "red");
								updateCheck.nickName = false;
							}
						
					},
					error : function() {
						console.log("ajax 통신 실패");
					}
		
				});
				
			}
		
		
			
		
		
	}); 
	
	
	function updateValidate() {
		
		for ( var key in updateCheck) {
			if (!updateCheck[key]) {
				var str;
				switch (key) {
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

		$("form[name='updateForm']").append($memberAddr);

		
		
		
	}
	
	
	
	
	
	//******************** 관심 분야 체크  ***************************
	(function(){
	
		var interest = "${loginMember.memberIntrs}".split(",");
		
		$("input[name='memberIntrs']").each(function(index, item){
			
			if(interest.indexOf( $(item).val()) != -1 ){
				$(item).prop("checked", true);
			}
		});
	})();
	
	
	
	
	</script>




</body>
</html>