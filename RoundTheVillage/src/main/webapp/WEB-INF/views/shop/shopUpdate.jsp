<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공방 등록 수정 페이지</title>
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
</style>

<!--summernote 사용 시  필요한 css 파일 추가  -->
<link rel="stylesheet" href="${contextPath}/resources/summernote/css/summernote-lite.css">
</head>
<body>
	<jsp:include page="../common/header.jsp" />

	<!-- summernote 사용 시 필요한 js 파일 추가  -->
	<script src="${contextPath}/resources/summernote/js/summernote-lite.js"></script>
	<script src="${contextPath}/resources/summernote/js/summernote-ko-KR.js"></script>
	<script src="${contextPath}/resources/summernote/js/mySummernote.js"></script>
	<div class="container">

		<div class="py-5">
			<h2>공방 등록 수정</h2>
		</div>

		<div class="row">

			<br>

			<div class="col-md-7 offset-md-3">

				<form method="POST" enctype="multipart/form-data"  action="../updateAction/${shop.shopNo}" class="needs-validation" name="registrationFrom" onsubmit="return validate();">

					<!-- 대표자 이름 -->
					<div class="row mb-3 form-row">

						<div class="col-md-3">
							<label for="storeUserName">대표자</label>
						</div>
						<div class="col-md-6">
							<input type="text" class="form-control" id="name" name="shopOwnerName" placeholder="이름을 입력하세요." autocomplete="off" value="${shop.shopOwnerName}" required>
						</div>

						<div class="col-md-6 offset-md-3">
							<span id="checkName">&nbsp;</span>
						</div>
					</div>


					<!-- 공방명 -->
					<div class="row mb-3 form-row">
						<div class="col-md-3">
							<label for="shopName">공방명</label>
						</div>
						<div class="col-md-6">
							<input type="text" class="form-control" id="store" name="shopName" placeholder="공방명을 입력해 주세요." autocomplete="off" value="${shop.shopName}" required>
						</div>
					</div>

					<br>
					
					
		      <c:set var="phone" value="${fn:split(shop.shopContact, '-')}"/>
      		<c:set var="address" value="${fn:split(shop.shopAdress, ',')}"/>
      

					<!-- 주소 -->
					<!-- 오픈소스 도로명 주소 API -->
					<!-- https://www.poesis.org/postcodify/ -->
					<div class="row mb-3 form-row">
						<div class="col-md-3">
							<label for="postcodify_search_button">우편번호</label>
						</div>



						<div class="col-md-3">
							<input type="text" name="post" id="post" value="${address[0]}" class="form-control postcodify_postcode5">
						</div>
						<div class="col-md-3">
							<button type="button" class="btn btn-success" id="postcodify_search_button" style="background-color: #5b3929; border-color: #5b3929;">검색</button>
						</div>
					</div>

					<br>

					<div class="row mb-3 form-row">
						<div class="col-md-3">
							<label for="address1">도로명 주소</label>
						</div>
						<div class="col-md-9">
							<input type="text" class="form-control postcodify_address" name="address1" id="address1" value="${address[1]}">
						</div>
					</div>

					<br>

					<div class="row mb-3 form-row">
						<div class="col-md-3">
							<label for="address2">상세주소</label>
						</div>
						<div class="col-md-9">
							<input type="text" class="form-control postcodify_details" name="address2" id="address2" value="${address[2]}">
						</div>
					</div>

					<br>

					<!-- 전화번호 -->
					<div class="row mb-3 form-row">
            <!-- 전화번호1 -->
            <div class="col-md-3">
               <select class="custom-select" id="phone1" name="phone1">
                  <option <c:if test="${phone[0] == '010'}"> selected </c:if> >010</option>
                  <option <c:if test="${phone[0] == '011'}"> selected </c:if> >011</option>
                  <option <c:if test="${phone[0] == '016'}"> selected </c:if> >016</option>
                  <option <c:if test="${phone[0] == '017'}"> selected </c:if> >017</option>
                  <option <c:if test="${phone[0] == '019'}"> selected </c:if> >019</option>
               </select>
            </div>

						<!-- 전화번호2 -->
						<div class="col-md-3">
							<input type="number" class="form-control phone" id="phone2" maxlength="4" name="phone2" value="${phone[1]}" required>
						</div>

						<!-- 전화번호3 -->
						<div class="col-md-3">
							<input type="number" class="form-control phone" id="phone3" maxlength="4" name="phone3" value="${phone[2]}" required>
						</div>

						<div class="col-md-6 offset-md-3">
							<span id="checkPhone">&nbsp;</span>
						</div>

					</div>

					<!-- 카테고리 버튼 -->
					<div>
						<label>카테고리</label>
					</div>

					<hr>

					<label class="box-radio-input"> <input type="radio" name="shopCategoryNo" id="altn" value="1"><span>미술</span>
					</label> <label class="box-radio-input"> <input type="radio" name="shopCategoryNo" id="pic" value="2"><span>사진/영상</span>
					</label> <label class="box-radio-input"> <input type="radio" name="shopCategoryNo" id="cook" value="3"><span>요리/음료</span>
					</label> <label class="box-radio-input"> <input type="radio" name="shopCategoryNo" id="bty" value="4"><span>뷰티</span>
					</label> <label class="box-radio-input"> <input type="radio" name="shopCategoryNo" id="music" value="5"><span>음악</span>
					</label> <br>
					<!--  -->
					<label class="box-radio-input"> <input type="radio" name="shopCategoryNo" id="exercise" value="6"><span>운동</span>
					</label> <label class="box-radio-input"> <input type="radio" name="shopCategoryNo" id="craft" value="7"><span>공예</span>
					</label> <label class="box-radio-input"> <input type="radio" name="shopCategoryNo" id="writing" value="8"><span>글쓰기</span>
					</label> <label class="box-radio-input"> <input type="radio" name="shopCategoryNo" id="kids" value="9"><span>키즈</span>
					</label> <label class="box-radio-input"> <input type="radio" name="shopCategoryNo" id="flowers" value="10"><span>플라워</span>
					</label>



					<hr>

					<!-- 공방 썸네일 -->
					<div class="form-inline mb-2">
						<label>썸네일</label>
						<div class="boardImg" id="titleImgArea">
							<img id="titleImg" width="400" height="280" src="${contextPath}${thumb.filePath}/${thumb.fileName}">
						</div>
					</div>

					<br>

					<!-- 공방 썸네일 소개 글 -->
					<div>
						<label>공방 썸네일 소개글</label>
						<div>
							<input class="form-control" id="thumbInfo" name="thumbInfo" autocomplete="off" value="${shop.thumbInfo}" required>
						</div>
					</div>


					<br>

					<!-- 파일 업로드 하는 부분 -->
					<div id="fileArea">
						<input type="file" id="img0" name="images" onchange="LoadImg(this,0)">
					</div>

					<div class="form-group">
						<div>
							<label for="content">내용</label>
						</div>
						<textarea class="form-control" id="summernote" name="shopInfo" rows="10" style="resize: none;">${shop.shopInfo }</textarea>
					</div>


					<div class="text-center">
						<button type="submit" class="btn btn-success" style="background-color: #fbbc73; border-color: #fbbc73;">수정</button>
						<a class="btn btn-success float-right" href="" style="background-color: #fbbc73; border-color: #fbbc73;">취소</a>
					</div>


				</form>

			</div>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp" />
	
  <!-- 도로명 주소 API -->
  <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script>
    // 도로명 주소 API
    // 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
    $(function() {
       $("#postcodify_search_button")
             .postcodifyPopUp();
    });
	
		var signUpCheck = {
			"name" : true,
			"phone2" : true,
		};

		var $name = $("#name");
		var $phone2 = $("#phone2");
		var $phone3 = $("#phone3");

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

		// 전화번호 유효성 검사
		$(".phone").on("input", function() {

			// 전화번호 input 태그에 4글자 이상 입력하지 못하게 하는 이벤트
			if ($(this).val().length > $(this).prop("maxLength")) {
				$(this).val($(this).val().slice(0, $(this).prop("maxLength")));
			}

			// 전화번호 유효성 검사
			var regExp1 = /^\d{3,4}$/; // 숫자 3~4 글자
			var regExp2 = /^\d{4,4}$/; // 숫자 4 글자

			if (!regExp1.test($phone2.val()) || !regExp2.test($phone3.val())) {
				$("#checkPhone").text("전화번호가 유효하지 않습니다.").css("color", "red");
				signUpCheck.phone2 = false;
			} else {
				$("#checkPhone").text("유효한 전화번호입니다.").css("color", "green");
				signUpCheck.phone2 = true;
			}
		});	
	
	
	
		// 카테고리 체크
    (function(){
        var shopCategoryNo = ${shop.shopCategoryNo};
        $("input[name='shopCategoryNo']").each(function(index, item) {
           
           if($(item).val() == shopCategoryNo) {
              $(item).prop("checked", true);
           }
        });
     })();

		// 이미지 영역을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
		$(function() {
			$("#fileArea").hide(); // #fileArea 요소를 숨김.		

			$(".boardImg").on("click", function() { // 이미지 영역이 클릭 되었을 때

				// 클릭한 이미지 영역 인덱스 얻어오기
				var index = $(".boardImg").index(this);
				// -> 클릭된 요소가 .boardImg 중 몇번째 인덱스인지 반환

				//console.log(index);

				// 클릭된 영역 인덱스에 맞는 input file 태그 클릭
				$("#img" + index).click();
			});

		});

		// 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
		function LoadImg(value, num) {
			// value.files : 파일이 업로드되어 있으면 true
			// value.files[0] : 여러 파일 중 첫번째 파일이 업로드 되어 있으면 true

			if (value.files && value.files[0]) { // 해당 요소에 업로드된 파일이 있을 경우

				var reader = new FileReader();
				// 자바스크립트 FileReader
				// 웹 애플리케이션이 비동기적으로 데이터를 읽기 위하여 
				// 읽을 파일을 가리키는 File 혹은 Blob객체를 이용해 
				// 파일의 내용을 읽고 사용자의 컴퓨터에 저장하는 것을 가능하게 해주는 객체

				reader.readAsDataURL(value.files[0]);
				// FileReader.readAsDataURL()
				// 지정된의 내용을 읽기 시작합니다. 
				// Blob완료되면 result속성 data:에 파일 데이터를 나타내는 URL이 포함 됩니다.	

				reader.onload = function(e) {
					// FileReader.onload
					// load 이벤트의 핸들러. 
					// 이 이벤트는 읽기 동작이 성공적으로 완료 되었을 때마다 발생합니다.	

					// 읽어들인 내용(이미지 파일)을 화면에 출력

					$(".boardImg").eq(num).children("img").attr("src",
							e.target.result);
					// e.target.result : 파일 읽기 동작을 성공한 요소가 읽어들인 파일 내용

				}
			}
		}
		
		function validate() {

			for ( var key in signUpCheck) {
				if (!signUpCheck[key]) {
					var str;
					switch (key) {
					case "name":
						str = "이름";
						break;
					case "phone2":
						str = "전화번호";
						break;
					}

					swal({
						icon : "warning",
						title : str + " 형식이 유효하지 않습니다."
					}).then(function() { // .then  : swal창이 닫힌 후 동작을 지정
						var id = "#" + key;
						$(id).focus();
					});

					return false;
				}
			}

			$shopContact = $("<input>", {
				type : "hidden",
				name : "shopContact",
				value : $("#phone1").val() + "-" + $("#phone2").val() + "-"
						+ $("#phone3").val()
			});

			$shopAdress = $("<input>", {
				type : "hidden",
				name : "shopAdress",
				value : $("#post").val() + "," + $("#address1").val() + ","
						+ $("#address2").val()
			});

			$("form[name='registrationFrom']").append($shopContact).append(
					$shopAdress);

		}
	</script>


</body>
</html>
