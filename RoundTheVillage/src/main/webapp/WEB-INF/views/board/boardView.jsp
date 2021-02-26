<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
 <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>html문서 제목</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
    integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
    crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
    crossorigin="anonymous"></script>
<title>게시글 상세 페이지</title>
</head>
<style>
	  .bottomArea{
    text-align: center;
  }

  .classBtn {
    float: right;
  }

  .btnBtn1{
    background-color: #fbbc73;
    border-color: #fbbc73;
    color: #5b3929;
    text-align: center;
  }

  .like{
    width: 20px;
    height: 20px;
  }

  .summerNoteArea {
    border: 1px solid black;
    width: 500px;
    height: 500px;
  }
</style>

<body>
	<jsp:include page="../common/header.jsp"/>
  <div class="container">
    <div class="row">
      <div class="col-md-2">
      </div>
      <div class="col-md-8">
        <a class="classBtn">해당 공방 수업 바로가기 >></a>
        <br>
        <hr>
        <div class="row">
          <div class="col-md-7 px-3">
            <p>
              <span class="pr-4"><b>내용</b></span> 친구랑 같이 수업들으러 갔었는데...
            </p>
            <p>
              <span class="pr-4"><b>공방이름</b></span>진선플라워
            </p>
          </div>
          <div class="col-md-5 px-3">
            <p>
              <span class="pr-4"><b>작성자</b></span>닉네임
            </p>
            <p>
              <span class="pr-4"><b>카테고리</b></span>
            </p>
          </div>
        </div>
        <br>
        <div class="row">
          <div class="col-md-12 summerNoteArea">
            <썸머노트 공간>
          </div>
        </div>
        <br>
        <img src="하트.png" class="like"> 300
        <hr>
        <div class="row">
          <div class="col-md-8">
          </div>
          <div class="col-md-4 bottomArea">
            <a class="reportBtn" style="float: right">신고하기</a>
            <br>
            <br>
            <div class="btnBtn px-0 text-right">
              <span class="btnBtn">
                <button type="button" class="btn btn-primary btn-sm px-2 btnBtn1">목록</button>
                <button type="button" class="btn btn-secondary btn-sm px-2 btnBtn1">수정</button>
                <button type="button" class="btn btn-secondary btn-sm px-2 btnBtn1">삭제</button>
              </span>
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-2">
      </div>
    </div>
  </div>

</body>
</html>