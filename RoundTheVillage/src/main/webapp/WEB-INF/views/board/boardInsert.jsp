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
</head>
<style>

* {
   font-family: 'NanumSquare', sans-serif !important;
   font-weight: 500;
   /* 굵기 지정(100, 300, 400, 500, 700) */
   font-size: 16px;
  /*  color: #212529; */
   }
   
 .summerNoteArea {
    border: 1px solid black;
    width: 500px;
    height: 500px;
  }

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

.btnBtn1{
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
</style>


<body>

	<jsp:include page="../common/header.jsp"/>
	<!-- summernote 사용 시 필요한 css 파일 추가 -->
	<link rel="stylesheet" href="${contextPath}/resources/summernote/css/summernote-lite.css">
		
	<!-- summernote 사용 시  필요한 js 파일 추가 -->
	<script src="${contextPath}/resources/summernote/js/summernote-lite.js"></script>
	<script src="${contextPath}/resources/summernote/js/summernote-ko-KR.js"></script>
	<script src="${contextPath}/resources/summernote/js/mySummernote.js"></script>
	
	 <div class="container">
    <div class="row">
      <div class="col-md-2">
      </div>
      <div class="col-md-8">
        <br>
        <hr>

				<form action="#" method="GET" class="text-center" id="insertForm">
        <div class="content-header">
          <div class="row">
            <div class="col-md-7 px-3">
              <p>
                <span class="pr-4"><b>내용</b></span>
                <input class="titleInput"> 
              </p>
            </div>
            <div class="col-md-5 px-3">
              <p>
                <span class="pr-4 writer"><b>작성자</b></span>닉네임
              </p>
            </div>
          </div>

          <div class="row">
            <div class="col-md-7 px-3">
              <p>
                <span class="pr-4"><b>공방</b></span> 
                <select id="workshopSelect">
                  <option>Option 1</option>
                  <option>Option 2</option>
                  <option>Option 3</option>
                  <option>Option 4</option>
                  <option>Option 5</option>
                </select>
              </p>
            </div>
            <div class="col-md-5 px-3">
              <p>
                <span class="pr-4"><b>카테고리</b></span>
                <select id="categorySelect">
                  <option>Option 1</option>
                  <option>Option 2</option>
                  <option>Option 3</option>
                  <option>Option 4</option>
                  <option>Option 5</option>
                </select>
              </p>
            </div>
          </div>
        </div> <!-- .content-header end -->

        <!-- 썸머노트 공간 시작 -->
        <div class="row py-3">
          <div class="col-md-12 summerNoteArea">
            <!-- <textarea class="form-control" id="summernote" name="boardContent"
						rows="10" style="resize: none;"></textarea> -->
          </div>
        </div>
        <!-- 썸머노트 공간 끝 -->

        <hr>
        <div class="row">
          <div class="col-md-8">
          </div>
          <div class="col-md-4 text-right px-0 btnArea">
            <span class="btnBtn">
              <button type="button" class="btn btn-primary btn-sm px-2 btnBtn1">목록</button>
              <button type="button" class="btn btn-secondary btn-sm px-2 btnBtn1">등록</button>
            </span>
          </div>
          </form>
        </div>
      </div> <!-- .col-md-8 end -->
    
      <div class="col-md-2">
      </div>
    </div>
  </div>


</body>
</html>