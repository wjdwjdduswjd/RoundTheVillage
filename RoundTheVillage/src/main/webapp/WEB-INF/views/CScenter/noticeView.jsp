<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style>
#board-area {
	margin-bottom: 100px;
}

#board-content {
	padding-bottom: 150px;
}

#date-area {
	font-size: 12px;
	line-height: 12px
}

#date-area>p {
	margin: 0
}

.boardImgArea {
	height: 300px;
}

.boardImg {
	width: 100%;
	height: 100%;
	max-width: 300px;
	max-height: 300px;
	margin: auto;
}

.carousel-control-prev-icon {
	background-image:
		url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23000' viewBox='0 0 8 8'%3E%3Cpath d='M5.25 0l-4 4 4 4 1.5-1.5-2.5-2.5 2.5-2.5-1.5-1.5z'/%3E%3C/svg%3E")
		!important;
}

.carousel-control-next-icon {
	background-image:
		url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23000' viewBox='0 0 8 8'%3E%3Cpath d='M2.75 0l-1.5 1.5 2.5 2.5-2.5 2.5 1.5 1.5 4-4-4-4z'/%3E%3C/svg%3E")
		!important;
}

.nline {
	width: 1140px;
}

#content-main {
	margin: 30px;
	margin-top: 50px;
	padding: 0px;
}

#date-area {
	display: inline-block;
	margin: 0px;
	margin-left: 840px;
}

#back, #updateBtn, #deleteBtn {
	color: #FFF;
	background-color: #FBBC73;
	border: 1px solid #FBBC73;
}

#back {
	margin-left: 10px;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<div class="container" id="content-main">

		<div id="allBoard">
			<div id="board-area">


				<!-- Title -->
				<h3 class="mt-4">${notice.noticeTitle}</h3>

				<hr class="nline">

				<!-- Writer -->
				<div class="lead">
					작성자 : 관리자
					<div id="date-area">
						<p>작성일 : ${notice.noticeCreateDate}</p>
					</div>

				</div>

				<hr class="nline">


				<!-- Content -->
				<div id="board-content">

					<%-- JSTL을 이용한 개행문자 처리 --%>
					<% pageContext.setAttribute("newLine", "\n"); %>
					${fn:replace(notice.noticeContent, newLine, "<br>")}
					<%-- ${fn:replace(board.boardContent, "\n", "<br>")}  EL은 이스케이프 문자를 인식하지 못한다. --%>

				</div>


				<div>
					<div class="float-right">

						<c:choose>
							<c:when test="${!empty param.sk && !empty param.sv}">
								<c:url var="goToList" value="noticeList">
									<c:param name="cp">${param.cp}</c:param>
									<c:param name="sk">${param.sk}</c:param>
									<c:param name="sv">${param.sv}</c:param>
								</c:url>
							</c:when>

							<c:otherwise>
								<c:url var="goToList" value="noticeList">
									<c:param name="cp">${param.cp}</c:param>
								</c:url>
							</c:otherwise>

						</c:choose>


						<a href="${sessionScope.returnListURL}" class="btn btn-warning float-right" id="back">목록으로</a>

						<%-- 	<c:if test="${(loginMember != null) && (member.memberType == 'A')}"> --%>
						<c:url var="updateUrl" value="${notice.noticeNo}/noticeUpdate" />
						<a href="${updateUrl}" class="btn btn-warning ml-1 mr-1" id="updateBtn">수정</a>
						<button id="deleteBtn" class="btn btn-warning">삭제</button>
						<%-- 	</c:if>--%>
					</div>
				</div>
			</div>



		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />

	<script>	
	
		// 게시글 삭제
		
		
	</script>
</body>
</html>
