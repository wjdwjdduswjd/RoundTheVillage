<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>html문서 제목</title>
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
  integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
  integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
  crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
  crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>후기 게시글 등록</title>

<style>

* {
   font-family: 'NanumSquare', sans-serif !important;
   font-weight: 500;
   /* 굵기 지정(100, 300, 400, 500, 700) */
   font-size: 16px;
  /*  color: #212529; */
   }
   
/* 	.summerNoteArea {
    border: 1px solid black;
    width: 500px;
    height: 500px;
  }  */

  .btnArea {
    text-align: center;
  }

  .classBtn {
    float: right;
  }

/*   .btn-group {
    background-color: #fbbc73;
    border-color: #fbbc73;
    color: #5b3929;
    text-align: center;
    float: right;
  } */

/*   .dropdown{
    margin-left: 60px;
    width: 300px;
  } */

  HTML CSSResult Skip Results Iframe
body {
  margin: 0;
  padding: 0;
  background-color: #ffffff;
}

.box {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 100%;
}

#workshopSelect {
  background-color: #ffffff;
  color: #fbbc73;
/*   padding: 12px; */
  width: 300px;
  border: 1px solid gray;
  font-size: 15px;
  -webkit-appearance: button;
  appearance: button;
  outline: none;
}

#categorySelect {
  background-color: #ffffff;
  color: #fbbc73;
/*   padding: 12px; */
  width: 100px;
  border: 1px solid gray;
  font-size: 15px;
  -webkit-appearance: button;
  appearance: button;
  outline: none;
}


.box:hover::before {
  color: rgba(255, 255, 255, 0.6);
  background-color: rgba(255, 255, 255, 0.2);
}

.box select option {
  padding: 30px;
}


.writer{
  margin-right: 20px;
}

.titleInput{
  width: 300px;
  height: 40%;
  
}

.btn-warning{
  background-color: #fbbc73;
  color: white;
  border: white;
  border-radius: 5px;
  height: 38px;
  margin-bottom: 11px;
}

.btn{
 background-color: #fbbc73;
  color: white;
  border: white;
  border-radius: 5px;
  height: 38px;
  margin-bottom: 11px;
}


.thumbnail{
		margin-left: 15px;
	}
	

</style>

	<!-- summernote 사용 시 필요한 css 파일 추가 -->
	<link rel="stylesheet" href="${contextPath}/resources/summernote/css/summernote-lite.css">
		
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	<!-- summernote 사용 시  필요한 js 파일 추가 -->
		<style>
		
		hr{
			width : 100%;
		}

	</style>
	
	<script src="${contextPath}/resources/summernote/js/summernote-lite.js"></script>
	<script src="${contextPath}/resources/summernote/js/summernote-ko-KR.js"></script>
	<script src="${contextPath}/resources/summernote/js/mySummernote.js"></script>
	
	 <div class="container">
    <div class="row">
   <!--    <div class="col-md-2">
      </div> -->
      <div class="col-md-12">
        <br>
        <hr>

			<form action = "insertAction" enctype="multipart/form-data" method = "post" role = "form" onsubmit = "return validate();" >
        <div class="content-header">
          <div class="row">
            <div class="col-md-7 px-3">
              <p>
                <span class="pr-4"><b>제목</b></span>
               <input type="text" class="titleInput" id="title" name="boardTitle" size="40">
              </p>
            </div>
            <div class="col-md-5 px-3">
              <p>
                <span class="pr-4 writer"><b>작성자</b></span>${loginMember.memberNickname}
              </p>
            </div>
          </div>

          <div class="row">
            <div class="col-md-7 px-3">
              <p>
                <span class="pr-4"><b>공방</b></span> 
                <select name="classNo" id="workshopSelect">
              <c:forEach var="cls" items="${selectClass}" varStatus="vs">
                  <option value="${cls.classNo}">${cls.lessonTitle}</option>
              </c:forEach>
                </select>
              	
              </p>
            </div>
            <div class="col-md-5 px-3">
            <!--   <p>
                <span class="pr-4"><b>카테고리</b></span>
                <select id="categorySelect">
                  <option>Option 1</option>
                  <option>Option 2</option>
                  <option>Option 3</option>
                  <option>Option 4</option>
                  <option>Option 5</option>
                </select>
              </p> -->
            </div>
          </div>
        </div> <!-- .content-header end -->

				<hr>

        <!-- 썸머노트 공간 시작 -->
        <div class="row py-3">
        
        <div class="form-inline mb-2 thumbnail">
					<label class="input-group-addon mr-3 insert-label pr-4"><b>썸네일</b></label>
					<div class="boardImg" id="titleImgArea">
						<img id="titleImg" width="200" height="200">
					</div>
				</div>
        

        
        <div id="fileArea">
					<input type="file" id="img0" name="images" onchange="LoadImg(this,0)"> 
				</div>
        
        
        
          <div class="col-md-12 summerNoteArea">
						<textarea class="form-control" id="summernote" name="boardContent"
						rows="10" style="resize: none;"></textarea> 
          </div>
        </div>
        <!-- 썸머노트 공간 끝 -->

        <hr>
        <br>
        <div class="row">
          <div class="col-md-8">
          </div>
          <div class="col-md-4 text-right px-0 btnArea">
            <span class="btnBtn">
              <a class="btn btn-warning btn-sm px-2 btnBtn1" href="${sessionScope.returnListURL}" style=" background-color: #fbbc73;
							  color: white;
							  border: white;
							  border-radius: 5px;
							  height: 38px;
							  margin-bottom: 11px;">목록</a>
              <button type="submit" class="btn btn-warning btn-sm px-2 btnBtn1" style= "background-color: #fbbc73;
							  color: white;
							  border: white;
							  border-radius: 5px;
							  height: 38px;
							  margin-bottom: 11px;">등록</button>
            </span>  
          </div>
          </div>
          </form>
          
        </div>
      </div> <!-- .col-md-8 end -->
    
    <!--   <div class="col-md-2">
      </div> -->
    </div>
  
  	<jsp:include page="../common/footer.jsp" />

  <script>
  
	function validate() {
		if ($("#title").val().trim().length == 0) {
			alert("제목을 입력해 주세요.");
			$("#title").focus();
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
						
				console.log(index);
				
				// 클릭된 영역 인덱스에 맞는 input file 태그 클릭
				$("#img" + index).click();
			});
			
		});
		 
			
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
				

  </script>


</body>
</html>