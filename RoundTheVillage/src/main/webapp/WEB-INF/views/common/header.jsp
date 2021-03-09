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
<link rel="stylesheet" href="${contextPath}/resources/css/common/header2.css">
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
		    
		    		<!-- 회원 등급별 bread icon -->
		    		<c:choose>
		    				<c:when test="${!empty loginMember && (loginMember.memberGrade == 1) }">
		    					<span class="header-item"><img src="${contextPath}/resources/images/Level/Lv_1.png" id="pImg"></span>
		    				</c:when>
		    				
		    				<c:when test="${!empty loginMember && (loginMember.memberGrade == 2) }">
		    					<span class="header-item"><img src="${contextPath}/resources/images/Level/Lv_2.png" id="pImg"></span>
		    				</c:when>
		    				
		    				<c:when test="${!empty loginMember && (loginMember.memberGrade == 3) }">
		    					<span class="header-item"><img src="${contextPath}/resources/images/Level/Lv_3.png" id="pImg"></span>
		    				</c:when>
		    				
		    				<c:when test="${!empty loginMember && (loginMember.memberGrade == 4) }">
		    					<span class="header-item"><img src="${contextPath}/resources/images/Level/Lv_4.png" id="pImg"></span>
		    				</c:when>
		    				
		    				<c:when test="${!empty loginMember && (loginMember.memberGrade == 5) }">
		    					<span class="header-item"><img src="${contextPath}/resources/images/Level/Lv_5.png" id="pImg"></span>
		    				</c:when>
		    		</c:choose>
		    		
		    		<span id="userGrade" class="header-item">Lv.${loginMember.memberGrade}</span>
		    		
		    		
		    		<span id="userNickname" class="header-item">${loginMember.memberNickname} 님</span>
	    			<a href="${contextPath}/member/logout" class="header-item" id="header-logout">로그아웃</a> <br>
		     </div>
	    		</c:otherwise>
    	</c:choose>
    	
    	
    	
      
    </div>

    <div class="logoDiv">
      <div id="logo">
        <a href="${contextPath}">
        <img src="${contextPath}/resources/images/logo/main_logo_zero.png" id="zero">
        </a>
      </div>
    </div>

    <div class="nav">
      <a id="menu" href="#">공방찾기</a>
      <a id="menu" href="${contextPath}/lesson">수업찾기</a>
      <a id="menu" href="${contextPath}/board/list">후기게시판</a>

      <div class="dropdown">
      <c:choose>
				<%-- 로그인이 되어있지 않을 때 == session에 loginMember라는 값이 없을 때 --%>
				<c:when test="${empty sessionScope.loginMember}">
      <a class="dropdown-toggle myclick" id="menu" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">마이페이지</a>
				</c:when>
				
				<%-- 일반 / 공방 회원 --%>
				<c:when test="${!empty loginMember && (loginMember.memberType == 'G') || (loginMember.memberType == 'C') }">
					<a class="dropdown-toggl" id="menu" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">마이페이지</a>
				</c:when>
				
				<%-- 관리자 --%>
				<c:when test="${!empty loginMember && (loginMember.memberType == 'A') }">
					<a class="dropdown-toggle" id="menu" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">관리페이지</a>
				</c:when>
				
				
			</c:choose>
					
        <div class="dropdown-menu mypage" aria-labelledby="dropdownMenuLink">
        	
        	<%-- 공방 회원 --%>
        	<c:if test="${loginMember.memberType == 'C'}">
          	<a class="dropdown-item" href="${contextPath}/shop/registration">나의 공방</a>
          	<a class="dropdown-item" href="${contextPath}/banner/pay">배너신청</a>
          	<a class="dropdown-item" href="${contextPath}/member/myInfoChange">내정보수정</a>
         		<a class="dropdown-item" href="${contextPath}/board/myBoardList">나의활동</a>
         		<a class="dropdown-item" href="${contextPath}/banner/payList">나의내역</a>
          </c:if>
          
          <%-- 일반 회원 --%>
          <c:if test="${(loginMember.memberType == 'G')}">
          <a class="dropdown-item" href="${contextPath}/member/myInfoChange">내정보수정</a>
          <a class="dropdown-item" href="${contextPath}/board/myBoardList">나의활동</a>
          <a class="dropdown-item" href="${contextPath}/pay/list">나의내역</a>
          </c:if>
          
          <%-- 관리자 --%>
					<c:if test="${loginMember.memberType == 'A'}">
						<a class="dropdown-item" href="${contextPath}/manager/normalList">회원조회</a>
        	  <a class="dropdown-item" href="${contextPath}/manager/shopList">공방관리</a>
        	  <a class="dropdown-item" href="${contextPath}/banner/list">배너관리</a>
        	  <a class="dropdown-item" href="${contextPath}/manager/reportList">신고관리</a>
        	  <!-- 고객센터 관련 메뉴는 아예 밑에 고객센터에 관리자 기준으로 넘기기 -->
					</c:if>
          
          
        </div>
      </div>
     
          <a id="menu" href="${contextPath}/CScenter/noticeList">공지사항</a>
    </div>

    <div>
      <hr id="line">
    </div>

  </div>
  
  
  <script>
	// 로그인이 안되있을 경우 마이페이지 클릭 시 경고창
	var loginMemberId = "${loginMember.memberId}";
	$(".myclick").on("click", function() {
		alert("로그인 후 이용해 주세요.");
		location.href="${contextPath}/member/login";
	});
	</script>
</body>

</html>