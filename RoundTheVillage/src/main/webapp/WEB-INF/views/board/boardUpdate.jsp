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
</head>
<title>게시글 수정</title>
</head>
<style>

* {
   font-family: 'NanumSquare', sans-serif !important;
   font-weight: 500;
   /* 굵기 지정(100, 300, 400, 500, 700) */
   font-size: 16px;
   color: #212529;
   }
/*   .summerNoteArea {
    border: 1px solid black;
    width: 500px;
    height: 500px;
  } */

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


.titleInput{
  width: 300px;
  height: 40%;
  
}

/* .writer{
  margin-right: 10px;
} */

.btnBtn3{
  background-color: #fbbc73;
                color: #fff;
                border: white;
                border-radius: 5px;
                height: 38px;
                margin-bottom: 11px;
}

	
</style>
<body>
	<jsp:include page="../common/header.jsp"/>
	 <div class="container">
    <div class="row">
     <!--  <div class="col-md-2">
      </div> -->
      <div class="col-md-12">
        <br>
        <hr>

				 <form action="#" method="GET" class="text-center" id="updateForm">
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
                <span class="pr-4 writer"><b>작성자</b></span>${board.memberNickname}
              </p>
            </div>
          </div>

          <div class="row">
            <div class="col-md-7 px-3">
              <p>
                <span class="pr-4"><b>공방</b></span> 
              		 잔산플라워
              </p>
            </div>
            <div class="col-md-5 px-3">
              <p>
                <span class="pr-4"><b>카테고리</b></span> 
                ${board.classCategoryNm}
              </p>
            </div>
          </div>
        </div> <!-- .content-header end -->

        <!-- 썸머노트 공간 시작 -->
        <div class="row py-3">
          <div class="col-md-12 summerNoteArea">
            <!--<썸머노트 공간>  -->
          </div>
        </div>
        <!-- 썸머노트 공간 끝 -->

        <hr>
        <div class="row">
          <div class="col-md-8">
          </div>
          <div class="col-md-4 text-right px-0 btnArea">
            <span class="btnBtn">
              <button type="button" class="btn btn-warning btn-sm px-2 btnBtn3">목록</button>
              <button type="button" class="btn btn-warning btn-sm px-2 btnBtn3">수정</button>
            </span>
          </div>
          </div>
          </form>
        
        
        
        </div>
      </div> <!-- .col-md-8 end -->
    
    	</div>
    <!--   <div class="col-md-2">
      </div> -->
 
 

</body>
</html>