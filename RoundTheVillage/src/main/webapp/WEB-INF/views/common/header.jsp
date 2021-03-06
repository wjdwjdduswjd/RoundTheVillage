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
 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
  
<!-- 나눔스퀘어 --> 
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">

<!-- css 연결  -->
<link rel="stylesheet" href="${contextPath}/resources/css/common/header.css">
	<!-- sweetalert : alert창을 꾸밀 수 있게 해주는 라이브러리 https://sweetalert.js.org/ -->
  	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
   
<body>
	<c:if test="${!empty swalTitle}">
		<script>
			swal({icon : "${swalIcon}",
				 title : "${swalTitle}",
				 text : "${swalText}"});
		
		</script>
	</c:if>
  <div id="header">
    <div id="header-group">
    	
    	<c:choose>
    		
	    		<%-- 로그인 안되어있을 때 --%>  
	    		<c:when test="${empty sessionScope.loginMember }">
		    <div class="header-right-items">
		        <a href="${contextPath}/member/login" class="header-item" id="header-login">로그인</a> <br>
		        <a href="${contextPath}/member/signUp" class="header-item" id="header-signUp">회원가입</a>
		     </div>
	    		</c:when>
	    		<%--  로그인 되어있는 경우--%>  
	    		<c:otherwise>
		    <div class="header-right-items">
	    			<a href="${contextPath}/member/logout" class="header-item" id="header-logout">로그아웃</a> <br>
		     </div>
	    		</c:otherwise>
    		
    		
    		
      
    	</c:choose>
      
    </div>

    <div class="logoDiv">
      <div id="logo">
        <a href="${contextPath}" id="logo"><img src="${contextPath}/resources/images/logo/zero.png" id="zero" size="500px"></a>
      </div>
    </div>

    <div class="nav">
      <a id="menu" href="#">공방찾기</a>
      <a id="menu" href="${contextPath}/lesson">수업찾기</a>
      <a id="menu" href="${contextPath}/board/list">후기게시판</a>

      <div class="dropdown">
      <a class="dropdown-toggle" id="menu" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">마이페이지</a>
        <div class="dropdown-menu mypage" aria-labelledby="dropdownMenuLink">
        	
        	<%-- 공방 회원만 보이기 --%>
        	<c:if test="${loginMember.memberType == 'C'}">
          	<a class="dropdown-item" href="${contextPath}/shop/registration">나의 공방</a>
          </c:if>
          <a class="dropdown-item" href="${contextPath}/mypage/myInfoChange">내정보수정</a>
          <a class="dropdown-item" href="#">나의활동</a>
          <a class="dropdown-item" href="#">나의내역</a>
        </div>
      </div>
     
      <div class="dropdown">
        <a class="dropdown-toggle" id="menu" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">고객센터</a>
        <div class="dropdown-menu cs" aria-labelledby="dropdownMenuLink">
          <a class="dropdown-item" href="${contextPath}/CScenter/noticeList">공지사항</a>
          <a class="dropdown-item" href="${contextPath}/CScenter/inquiyList">1:1문의</a>
        </div>
      </div>

    </div>

    <div>
      <hr id="line">
    </div>

  </div>
</body>

</html>