<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

 <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
    integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    
  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
    crossorigin="anonymous"></script>
   
  <!-- 나눔스퀘어 --> 
  <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
  
  <!-- css 연결  -->
  <link rel="stylesheet" href="${contextPath}/resources/css/common/header.css">

<body>
  <div id="header">
    <div id="header-group">
      <div class="header-right-items">
        <a href="${contextPath}/member/login" class="header-item" id="header-login">로그인</a> <br>
        <a href="${contextPath}/member/signUp" class="header-item" id="header-signUp">회원가입</a>
      </div>
    </div>

    <div class="logoDiv">
      <div id="logo">
        <a href="#" id="logo"><img src="${contextPath}/resources/images/logo/zero.png" id="zero" size="500px"></a>
      </div>
    </div>

    <div class="nav">
      <a id="menu" href="#">공방찾기</a>
      <a id="menu" href="#">수업찾기</a>
      <a id="menu" href="${contextPath}/board/list">후기게시판</a>

      <div class="dropdown">
      <a class="dropdown-toggle" id="menu" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">마이페이지</a>
        <div class="dropdown-menu mypage" aria-labelledby="dropdownMenuLink">
          <a class="dropdown-item" href="#">내정보수정</a>
          <a class="dropdown-item" href="#">나의활동</a>
          <a class="dropdown-item" href="#">나의내역</a>
        </div>
      </div>

      <div class="dropdown">
        <a class="dropdown-toggle" id="menu" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">고객센터</a>
        <div class="dropdown-menu cs" aria-labelledby="dropdownMenuLink">
          <a class="dropdown-item" href="#">공지사항</a>
          <a class="dropdown-item" href="#">1:1문의</a>
        </div>
      </div>

    </div>

    <div>
      <hr id="line">
    </div>

  </div>
</body>

</html>