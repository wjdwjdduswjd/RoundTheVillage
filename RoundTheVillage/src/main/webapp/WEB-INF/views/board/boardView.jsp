<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>html문서 제목</title>
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
<title>게시글 상세 페이지</title>
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
    width: 740px;
    height: 500px;
  } */
.btnArea {
	text-align: center;
}

.classBtn {
	float: right;
}

.btn-group {
	background-color: #fbbc73;
	border-color: #fbbc73;
	color: #5b3929;
	text-align: center;
	float: right;
}

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

.box:hover::before {
	color: rgba(255, 255, 255, 0.6);
	background-color: rgba(255, 255, 255, 0.2);
}

.box select option {
	padding: 30px;
}

.writer {
	margin-right: 20px;
}

.like {
	width: 20px;
	height: 20px;
}

.btnBtn1 {
	background-color: #fbbc73 !important;
	color: white !important;
	border: white !important;
	border-radius: 5px !important;
	height: 38px !important;
	margin-bottom: 11px !important;
	line-height: 30px !important;
}

.readCountArea {
	float: right;
}

.modal-body span {
	display: inline;
	font-size: 1.2em;
	font-weight: bold;
}

.btn-group {
	background-color: #fbbc73;
	border-color: #fbbc73;
	color: #5b3929
}

.modal-btn-area {
	text-align: center;
}

.modal-header {
	border-bottom: none;
}
</style>

<body>

	<c:if test="${!empty swalTitle}">
		<script>
			swal({
				icon : "${swalIcon}",
				title : "${swalTitle}",
				text : "${swalText}"
			});
		</script>
	</c:if>


	<jsp:include page="../common/header.jsp" />

	<style>
		hr {
			width: 100%;
		}
	</style>
	<div class="container">
		<div class="row">
			<!-- <div class="col-md-2">
      </div> -->
			<div class="col-md-12">
				<a class="classBtn" href="${contextPath}/lesson/view/${board.classNo}">해당 공방 수업 바로가기 >></a> <br>
				<hr>

				<div class="content-header">
					<div class="row">
						<div class="col-md-7 px-3">
							<p>
								<span class="pr-4"><b>제목</b></span> ${board.boardTitle}
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
								<span class="pr-4"><b>공방</b></span> ${board.lessonTitle}
							</p>
						</div>
						<div class="col-md-5 px-3">
							<p>
								<span class="pr-4"><b>카테고리</b></span> ${board.classCategoryNm}
							</p>
						</div>
					</div>
				</div>
				<!-- .content-header end -->

				<!-- 썸머노트 공간 시작 -->
				<div class="row py-3">
					<div class="col-md-12 summerNoteArea">${board.boardContent}</div>
				</div>
				<!-- 썸머노트 공간 끝 -->

				<c:choose>
					<c:when test="${likeFl == 0 }">
						<img src="${contextPath}/resources/images/boardListImages/heart.png" class="like">
					</c:when>

					<c:otherwise>
						<img src="${contextPath}/resources/images/boardListImages/fill-heart.png" class="like">
					</c:otherwise>
				</c:choose>
				<span id="likeCount">${board.likeCount}</span> <span class="readCountArea"><b>조회수 ${board.readCount}</b></span>
				<hr>
				<div class="row">
				<c:if test="${(loginMember != null) && (board.memberNo == loginMember.memberNo)}">
					<div class="col-md-8">
						<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">신고</button>
					</div>
					</c:if>
					<div class="col-md-12 text-right px-0 btnArea">
						<span class="btnBtn"> <c:url var="updateUrl" value="${board.boardNo}/update" /> <c:if test="${(loginMember != null) && (board.memberNo == loginMember.memberNo)}">
								<a href="${updateUrl}" type="button" class="btnBtn1 btn btn-secondary btn-sm px-2 ">수정</a>
								<button type="button" class="btnBtn1 btn btn-secondary btn-sm px-2 " onclick="deleteBoard()">삭제</button>
							</c:if> <%-- <c:if test="${empty sessionScope.returnListURL}"> --%>
								<c:set var="returnListURL" value="../list" scope="session" />
							<%-- </c:if> --%> <a class="btnBtn1 btn btn-primary btn-sm px-2" href="${contextPath}/board/list">목록</a> <!-- 	<button type="button" class="btnBtn1 btn btn-primary btn-sm px-2">목록</button> -->
						</span>
					</div>
				</div>
			</div>
			<!-- .col-md-8 end -->

			<div class="col-md-2"></div>
		</div>
	</div>


	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="px-3">
						<p>
							<span class="pr-4">제목</span> ${board.boardTitle}
						</p>
						<p>
							<span class="pr-4">작성자</span>${board.memberNickname}
						</p>
					</div>
					<div class="pt-4 px-3">
						<p>
							<span class="pr-4">신고사유</span>
						</p>
						<form class="form-signin" method="post" action="report">
							<input type="hidden" name="boardNo" value="${board.boardNo}"> <input type="hidden" name="memberNo" value="${loginMember.memberNo}">
							<div class="custom-control custom-radio">
								<input type="radio" id="customRadio1" name="reportRadio" class="custom-control-input" value="10" required> <label class="custom-control-label" for="customRadio1">홍보성</label>
							</div>
							<br>

							<div class="custom-control custom-radio">
								<input type="radio" id="customRadio2" name="reportRadio" class="custom-control-input" value="20"> <label class="custom-control-label" for="customRadio2">비방</label>
							</div>
							<br>
							<div class="custom-control custom-radio">
								<input type="radio" id="customRadio3" name="reportRadio" class="custom-control-input" value="30"> <label class="custom-control-label" for="customRadio3">도배</label>
							</div>
							<br>
							<div class="custom-control custom-radio">
								<input type="radio" id="customRadio4" name="reportRadio" class="custom-control-input" value="40"> <label class="custom-control-label" for="customRadio4">개인정보 노출</label>
							</div>
							<br>
							<div class="custom-control custom-radio">
								<input type="radio" id="customRadio5" name="reportRadio" class="custom-control-input" value="50"> <label class="custom-control-label" for="customRadio5">기타</label>
							</div>


							<div class="pt-5">
								<span class="pr-4">상세내용</span>
								<textarea class="mt-2" name="reportContent" rows="5" style="resize: none; width: 100%;"></textarea>
							</div>

							<div class="modal-btn-area my-4">
								<button class="btn btn-group">신고하기</button>
						</form>
					</div>
				</div>






			</div>
		</div>
	</div>
	</div>

	<jsp:include page="../common/footer.jsp" />


	<script>
		var likeFl = ${likeFl}; // 좋아요 여부 0/1
		var boardNo = ${board.boardNo}; // 게시글 번호

		$(".like").click(function() {

			if ("${loginMember}" == "") {
				alert("로그인 후 이용해주세요.");

			} else {
				var requestUrl;
				var str;

				if (likeFl == 0) {
					requestUrl = "insertLike";
					str = "해당 글을 추천하시겠습니까?";
				} else {
					requestUrl = "deleteLike";
					str = "추천 취소";
				}

				if (confirm(str)) {
					$
							.ajax({
								url : requestUrl,
								data : {
									"boardNo" : boardNo
								},
								success : function(result) {
									// 좋아요 여부 상태 변경
									if (likeFl == 0) {
										likeFl = 1;
										$(".like")
												.attr("src",
														"${contextPath}/resources/images/boardListImages/fill-heart.png");
									} else {
										likeFl = 0;
										$(".like")
												.attr("src",
														"${contextPath}/resources/images/boardListImages/heart.png");
									}

									selectLikeCount();
								},
								error : function() {
									console.log("좋아요 실패")
								}
							});

				}
			}
		});

		// 좋아요 개수 카운트
		function selectLikeCount() {
			$.ajax({
				url : "selectLikeCount",
				data : {
					"boardNo" : boardNo
				},
				success : function(likeCount) {
					$("#likeCount").text(likeCount);
				},
				error : function() {
					console.log("좋아요 카운트 실패")
				}
			});
		}
		
		
		function deleteBoard() {
		
			if(confirm("정말로 삭제하시겠습니까?")){
				
				location.href= "delete?boardNo=${board.boardNo}";
				
			}
		}
		
		
		
		
		
	</script>






</body>
</html>