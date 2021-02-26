<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/flex-layout-attribute/1.0.3/css/flex-layout-attribute.min.css'>
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<link rel="stylesheet" href="${contextPath}/resources/css/common/header.css">
</head>

<style>

</style>

<body>
<div>
  <div id="header-group">
    <div class="header-right-items">
      <a href="${contextPath}/member/login" class="header-item" id="header-login">로그인</a>
      <a href="${contextPath}/member/signUp" class="header-item" id="header-signUp">회원가입</a>
    </div>
  </div>

  <div class="logoDiv">
    <div id="logo">
      <a href="#" id="logo"><img src="${contextPath}/resources/images/logo/zero.png" id="zero" size="500px"></a>
    </div>
  </div>

  <div class="container">
    <div class="selector" self="size-x1" layout="row center-left">
      <div class="highlight"></div>
      <div class="selector-item" id="noSub" onclick="selectItem(event)" onclick="location.href='#';">공방찾기</div>
      <div class="selector-item" id="noSub" onclick="selectItem(event)" onclick="location.href='#';">수업찾기</div>
      <div class="selector-item" id="noSub" onclick="selectItem(event)" ><a href="${contextPath}/board/list">후기게시판</a></div>

      <div class="selector-item" id="mypage" onclick="selectItem(event)" onclick="location.href='#';">마이페이지</div>
      <!-- 서브메뉴 -->
      <div id="m-p" class="dropdown">
        <p><a href="#">내 정보 수정</a></p>
        <p><a href="#">나의 활동</a></p>
        <p><a href="#">나의 내역</a></p>
    </div>

      <div class="selector-item" id="cs" onclick="selectItem(event)" onclick="location.href='#';">고객센터</div>
      <!-- 서브메뉴 -->
      <div id="c-s" class="dropdown2">
        <p><a href="#">1:1 문의</a></p>
        <p><a href="#">나의활동</a></p>
    </div>
    </div>
  </div>
 </div>
<script type="text/javascript" src="${contextPath}/resources/js/common/header.js"></script>
</body>

</html>