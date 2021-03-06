<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
<style>
    .insert-label {
      display: inline-block;
      width: 80px;
      line-height: 40px
    }
    
    #content-main{ margin: 100px auto;}
    
    .deleteImg{
	    position: absolute;
	    display : inline-block;
	    margin-left: -15px;
	    border: none;
	    background-color: rgba(1,1,1,0);
	    width: 20px;
	    height: 20px;
	    cursor: pointer;
    }
</style>

	<!-- Summernote 사용 시 필요한 css 파일 추가 -->
	<link rel="stylesheet" href="${contextPath}/resources/summernote/css/summernote-lite.css">

</head>
<body>
	<div class="container">
		<jsp:include page="../common/header.jsp"/>
		
		<!-- Summernoter 사용 시 필요한 JS 파일 추가 -->
		<script src="${contextPath}/resources/summernote/js/summernote-lite.js"></script>
		<script src="${contextPath}/resources/summernote/js/summernote-ko-KR.js"></script>
		<script src="${contextPath}/resources/summernote/js/mySummernote.js"></script>
	
		<div class="container pb-5 mb-5" id="content-main">

			<h3>게시글 수정</h3>
			<hr>
			<form action="updateAction" method="post" enctype="multipart/form-data" name="updateForm" role="form" onsubmit="return validate();">
				
				<div class="form-inline mb-2">
					<label class="input-group-addon mr-3 insert-label">제목</label> 
					<input type="text" class="form-control" id="title" name="noticeTitle" size="70"
						value="${notice.noticeTitle }">
				</div>

				<div class="form-inline mb-2">
					<label class="input-group-addon mr-3 insert-label">작성자</label>
					<h5 class="my-0" id="writer">관리자</h5>
				</div>


<%-- 				<div class="form-inline mb-2">
					<label class="input-group-addon mr-3 insert-label">작성일</label>
					<h5 class="my-0" id="today">
						<jsp:useBean id="now" class="java.util.Date" />
						<fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/>
					</h5>
				</div> --%>

				<hr>
				
				<div class="form-group">
						<!---------------------------------- Summernote Textarea ------------------------------->
					<textarea class="form-control" id="summernote" name="noticeContent">${notice.noticeContent}</textarea>
					
				</div>


				<hr class="mb-4">

				<div class="text-center">
					<button type="submit" class="btn btn-success">수정</button>
					<a class="btn btn-success float-right" href="${sessionScope.returnListURL}">목록으로</a>
				</div>

			</form>
		</div>

	</div>
	<jsp:include page="../common/footer.jsp"/>


	<script>
		// 카테고리 선택
		$.each($("#category > option"), function(index, item){
			if($(item).text() == "${board.categoryName}"){
				$(item).prop("selected", "true");
			}
		});
		
		// 이미지 배치
		<c:forEach var="at" items="${attachmentList}">
			$(".boardImg").eq(${at.fileLevel}).children("img").attr("src", "${contextPath}${at.filePath}/${at.fileName}");
		</c:forEach>
	
	
		// 게시글에 업로드 된 이미지 삭제
		// - 배열을 생성하여  이미지 삭제 버튼 수 만큼 false를 요소로 추가
		// -> 4개의 false가 추가됨 == 인덱스는 0~3 == fileLevel 0~3과 같음
		// --> 삭제 버튼이 클릭될 경우 해당 인덱스의 값을 true로 변경하여 삭제가 되었음을 알려줄 예정
		
		var deleteImages = []; // 특정 fileLevel 이미지가 삭제 되었는지 여부를 저장할 배열 생성. 
		for(var i=0 ; i< $(".deleteImg").length ; i++){ // 삭제 버튼 수 만큼 false를 배열에 추가 (4개 추가됨)
			deleteImages.push(false);
		}
		console.log(deleteImages); 
	
		// 이미지 삭제 버튼 동작
		$(".deleteImg").on("click",function(event){
			event.stopPropagation(); // 이벤트 버블링(이벤트가 연달아 시작되는 것) 삭제 
			
			var $el = $(this).prev(); // 버튼의 이전 요소(img 태그) 선택

			// 삭제한 img 태그 대신 새로운 img 태그를 생성하여 추가
			var $img = $("<img>", {id : $el.attr("id"), width: $el.css("width"), height : $el.css("height")}); 
		
			$(this).prev().remove(); // 이전 요소를 삭제
			$(this).before($img); // 새로운 요소 추가
			
			
			//console.log($(".deleteImg").index(this));
			
			// 특정 fileLevel 이미지가 삭제 되었음을 deleteImages에 기록
			// == deleteImages의 삭제된 fileLevel번째 인덱스 값을 true로 변경
			deleteImages[$(".deleteImg").index(this)] = true;			
			console.log(deleteImages);
			
			
			// 이미지가 삭제된 경우 해당 img 태그와 연결된 input type="file" 태그에 저장된 값도 삭제 
			$("#img"+($(".deleteImg").index(this))).val("");
		});
	
		
		// 이미지 영역을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
		$(function(){
			$("#fileArea").hide(); // #fileArea 요소를 숨김.		
			
			$(".boardImg").on("click", function(){ // 이미지 영역이 클릭 되었을 때
				var index = $(".boardImg").index(this);// 클릭한 이미지 영역 인덱스 얻어오기
				$("#img" + index).click(); // 클릭된 영역 인덱스에 맞는 input file 태그 클릭
			});
			
		});
		 
		
		 // 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
		 function LoadImg(value, num) {
		  
			if(value.files && value.files[0]){ // 해당 요소에 업로드된 파일이 있을 경우
				
				var reader = new FileReader();
		    	reader.readAsDataURL(value.files[0]);
		    	
		    	reader.onload = function(e){
					$(".boardImg").eq(num).children("img").attr("src", e.target.result);
					
					// 특정 fileLevel 이미지가 삭제 되지 않았음을 deleteImages에 기록
					// == deleteImages의 삭제된 fileLevel번째 인덱스 값을 false로 변경
					deleteImages[num] = false;			
		    	}
			}
		}
		
	  
		// 유효성 검사
		function validate() {
			if ($("#title").val().trim().length == 0) {
				alert("제목을 입력해 주세요.");
				$("#title").focus();
				return false;
			}

			if ($("#summernote").val().trim().length == 0) {
				alert("내용을 입력해 주세요.");
				$("#summernote").focus();
				return false;
			}
			
			// 유효성 검사에서 문제가 없을 경우 서버에 제출 전
			// deleteImages배열의 내용을 hidden 타입으로 하여 form태그 마지막에 추가하여 파라미터로 전달
			for(var i=0 ; i<deleteImages.length ; i++){
				$deleteImages = $("<input>", {type : "hidden", name : "deleteImages", value : deleteImages[i]});
				$("form[name=updateForm]").append($deleteImages);
			}
			
		}
	</script>
</body>
</html>
