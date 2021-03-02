<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<meta charset="UTF-8">
<title>공지사항 등록</title>

<style>
.insert-label {
  display: inline-block;
  width: 80px;
  line-height: 40px;
}

#bigTitle {
	margin-top: 50px;
	font-family: 'NanumSquare', sans-serif !important;
}


.form-group {
	margin-top: 30px;
	
}

form {
	width: 1140;
	padding: 0px;
	margin: 30px;
}

.text-center{
	margin-top: 30px;
}

#insert, #back {
	color: #FFF;
	background-color: #FBBC73;
	border : 1px solid #FBBC73;
	margin-top: -5px;
}

#insert {
	margin-left: 89px;
	margin-top: 100px;
}

#back {
	margin-right: 20px;
}

#createDt {
	margin-left: 80px;
}

#today{
	margin-right: 20px;
}

#contentTitle, #title{
	margin-left: 20px;
}

.line1 { 
	width: 1140px;
}


#summernote{
	width: 1140px;
}



</style>

<!-- summernote 사용시 필요한 css 파일 추가 -->
<link rel="stylesheet" href="${contextPath}/resources/summernote/css/summernote-lite.css">

</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
	<!-- summernote 사용시 필요한 js 파일 추가 -->
	<script src="${contextPath}/resources/summernote/js/summernote-lite.js"></script>
	<script src="${contextPath}/resources/summernote/js/summernote-ko-KR.js"></script>
	<script src="${contextPath}/resources/summernote/js/mySummernote.js"></script>
	
	<div class="container">

			<div id="titleDiv">
			<h3 id="bigTitle">공지사항 등록</h3>
			<hr class="line1">
			</div>
			
		<div class="container pb-5 mb-5">

			<!-- 파일 업로드 시 enctype="multipart/form-data" 지정 -->
			<!-- 
				- enctype : form 태그 데이터가 서버로 제출 될 때 인코딩 되는 방법을 지정. (POST 방식일 때만 사용 가능)
				- application/x-www-form-urlencoded : 모든 문자를 서버로 전송하기 전에 인코딩 (form태그 기본값)
				- multipart/form-data : 모든 문자를 인코딩 하지 않음.(원본 데이터가 유지되어 이미지, 파일등을 서버로 전송 할 수 있음.) 
			-->
			<form action="insertAction"  method="post" enctype="multipart/form-data" role="form" onsubmit="return validate();">
			
				<div class="form-inline mb-2">
				
					<label class="input-group-addon mr-3 insert-label" id="contentTitle">제목 :</label> 
					<input type="text" class="form-control" id="title" name="boardTitle" size="70">
					
					<label class="input-group-addon mr-3 insert-label" id="createDt">작성일 :</label>
					<h6 class="my-0" id="today">
						<jsp:useBean id="now" class="java.util.Date" /><fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/>
					</h6>
				</div>



				<!-- 파일 업로드 하는 부분 -->
				<div id="fileArea">
					<input type="file" id="img0" name="images" onchange="LoadImg(this,0)"> 
					
				</div>

				<div class="form-group">
					<textarea class="form-control" id="summernote" name="boardContent"
						rows="10" style="resize: none;"></textarea>
				</div>

				<div class="text-center">
					<button type="submit" class="btn btn-success" id="insert">등록</button>
					<a class="btn btn-success float-right" href="${sessionScope.returnListURL}" id="back">목록으로</a>
				</div>

			</form>
		</div>

	</div>
	<jsp:include page="../common/footer.jsp"/>

	<script>

		// 유효성 검사
		function validate() {
			if ($("#title").val().trim().length == 0) {
				alert("제목을 입력해 주세요.");
				$("#title").focus();
				return false;
			}

			if ($("#content").val().trim().length == 0) {
				alert("내용을 입력해 주세요.");
				$("#content").focus();
				return false;
			}
		}
		
		// 이미지 영역을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
		$(function(){
			$("#fileArea").hide(); // #fileArea 요소를 숨김.		
			
			$(".boardImg").on("click", function(){ // 이미지 영역이 클릭 되었을 때
				
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
		  
			if(value.files && value.files[0]){ // 해당 요소에 업로드된 파일이 있을 경우
				
				var reader = new FileReader();
       	// 자바스크립트 FileReader
      	// 웹 애플리케이션이 비동기적으로 데이터를 읽기 위하여 
      	// 읽을 파일을 가리키는 File 혹은 Blob객체를 이용해 
      	// 파일의 내용을 읽고 사용자의 컴퓨터에 저장하는 것을 가능하게 해주는 객체
      	
      	reader.readAsDataURL(value.files[0]);
        // FileReader.readAsDataURL()
      	// 지정된의 내용을 읽기 시작합니다. 
      	// Blob완료되면 result속성 data:에 파일 데이터를 나타내는 URL이 포함 됩니다.	
      	
      	reader.onload = function(e){
        	// FileReader.onload
					// load 이벤트의 핸들러. 
					// 이 이벤트는 읽기 동작이 성공적으로 완료 되었을 때마다 발생합니다.	
      		
					// 읽어들인 내용(이미지 파일)을 화면에 출력
					
					$(".boardImg").eq(num).children("img").attr("src", e.target.result);
					// e.target.result : 파일 읽기 동작을 성공한 요소가 읽어들인 파일 내용
					
      	}
			}
		}
	  
<!--  
	  // summernote 설정
	  $(document).ready(function() {
		    $('#Nsummernote').summernote({
		        width : 1140, // 에디터 넓이
		        height : 500, // 에디터 높이
		        lang : 'ko-KR', // 언어 : 한국어

		        // 이미지 업로드 이벤트가 발생했을 때 콜백 함수 수행
		        callbacks : {
		            onImageUpload : function(files){
		                // files : 업로드 된 이미지가 배열로 저장되어 있음.
		                // editor == this : 이미지가 업로드 된 섬머노트 에디터 
		                sendFile(files[0], this);
		            }
		        }

		    });
		  });
-->			
	</script>
</body>
</html>
