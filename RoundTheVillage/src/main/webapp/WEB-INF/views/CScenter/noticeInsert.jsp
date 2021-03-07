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

#titleDiv {
	margin-right: 40px;
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
	
	<div class="container" id="write">

			<div id="titleDiv">
			<h3 id="bigTitle">[공지사항 등록]</h3>
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
					<input type="text" class="form-control" id="title" name="noticeTitle" size="70">
					
					<label class="input-group-addon mr-3 insert-label" id="createDt">작성일 :</label>
					<h6 class="my-0" id="today">
						<jsp:useBean id="now" class="java.util.Date" /><fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/>
					</h6>
				</div>
				
				
				<div class="form-group">
					<textarea class="form-control" id="summernoteNotice" name="noticeContent"
						rows="10" style="resize: none;"></textarea>
				</div>


				<div class="text-center">
					<button type="submit" class="btn btn-warning" id="insert">등록</button>
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
		
		
	  

	  // summernote 설정
	  $(document).ready(function() {
    $('#summernoteNotice').summernote({

        width : 1000,   // 에디터 넓이
        height : 600,   // 에디터 높이
        lang : 'ko-KR',  // 언어 : 한국어

        // 이미지 업로드 이벤트가 발생했을 때 callback 함수 수행
        callbacks : {
            onImageUpload : function(files, editor){
                // files : 업로드된 이미지가 배열로 저장되어 있음
                // editor : 이미지가 업로드된 summernote editor

                sendFile(files[0], this);
            }
        }
    });
  });


// summernote에 업로드된 이미지를 비동기 서버로 전송하여 저장하는 함수
function sendFile(file, editor){

    var formData = new FormData();

    // FormData : form 태그 내부 값 전송을 위한 객체로
    // 추가된 값을 k=v 형태로 쉽게 생성해주는 객체

    formData.append("uploadFile", file);

    $.ajax({
        url : "insertImage", 
        type : "post",
        enctype : "multipart/form-data", // 파일 전송 형식으로 지정
        data : formData,
        contentType : false, // 서버로 전송되는 데이터 형식
        // 기본 값 : application/x-www-form-urlencoded; charset=utf-8 == 텍스트
        // false : 바이트 코드 있는 그대로

        cache : false,
        processData:false,
        // 서버로 전달되는 값을 쿼리스트링으로 전달할 경우 true, 아니면 false
        // 파일 전송시 false로 지정
        dataType : "json",
        success : function(at){
            //console.log(at);

            // 자바 스크립트를 이용한 contextPath 얻어오는 방법
            var contextPath = location.pathname.substring(0, window.location.pathname.indexOf("/",2));
            // localhost:8080/spring/board/2/insert

            // 저장된 이미지를 summernote 에디터에 반영 (삽입)
            $(editor).summernote('editor.insertImage', contextPath + at.filePath + "/" + at.fileName);
                        // localhost:8080/spring
        }
    });


}
	
	</script>
</body>
</html>
