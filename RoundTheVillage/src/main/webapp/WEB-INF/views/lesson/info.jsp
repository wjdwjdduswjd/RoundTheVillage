<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>info</title>
<style>
.lesson-content, .lesson-curriculum, .lesson-location {
	border-bottom: 1px solid #e4e9ef;
}
</style>
</head>
<body>
	<div class="lesson-content">
		<div class="title">수업내용</div>
		${lesson.lesContent}
	</div>
	<div class="lesson-curriculum">
		<div class="title">커리큘럼</div>
		<p>${lesson.lesCurri}</p>
	</div>
	<div class="lesson-location">
		<div class="title">위치</div>
	</div>
	
</body>
</html>