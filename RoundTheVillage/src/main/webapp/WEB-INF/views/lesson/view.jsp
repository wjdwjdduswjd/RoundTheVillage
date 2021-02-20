<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
123

${lesson.lesNo}번 수업
<br>
<button id="info" class="test">클래스정보</button>
<button id="review" class="test">후기</button>
<button id="question" class="test">문의</button>
<button id="policy" class="test">환불 및 취소</button>
<br>
<jsp:include page="info.jsp"/>
<jsp:include page="review.jsp"/>
<jsp:include page="question.jsp"/>
<jsp:include page="policy.jsp"/>
<script>

</script>
</body>
</html>