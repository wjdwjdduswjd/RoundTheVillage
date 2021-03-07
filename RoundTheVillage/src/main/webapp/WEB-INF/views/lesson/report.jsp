<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>report</title>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

<style>
body {
    display: block;
    margin: 8px;
}
h1 {
	font-size: 22px;
	line-height: 1.5;
  font-weight: 600;
  color: #666;
}

table {
	font-size: 13px;
	border-top: 1px solid #ddd;
}

label {
	display: block;
	margin-bottom: 5px;
}

tr {
	display: table-row;
}

th {
	font-size: 14px;
	border: 0;
	padding: 8px;
	vertical-align: top;
	text-align: left;
	border-bottom: 1px solid #ddd;
	background-color: #f8f8f8;
	display: table-cell;
}

td {
	padding: 8px;	
	display: table-cell;
	border-bottom: 1px solid #ddd;
}
textarea {
	width: 95%;
  height: 60px;
  resize: none;
  padding: 4px 6px;
  margin: 6px 0;
}
p {
	margin: 0;
}
.button-area {
	padding: 10px 0;
  margin: 10px 0;
  border-top: 1px solid #ccc;
  text-align: right;
  zoom: 1;
  clear: both;
}
#close {
	float: left;
	border: 1px solid #cccccc;
  color: #333333;
	background-color: #f5f5f5;
	font-size: 12px;
  height: 26px !important;
  line-height: 26px !important;
  padding: 0 12px !important;
}
#submit {
	border: 1px solid #cccccc;
	background-color: #f5f5f5;
	font-size: 12px;
  color: #ffffff;
  background-color: #222222;
  height: 26px !important;
  line-height: 26px !important;
  padding: 0 12px !important;
}

.btn
</style>
</head>
<body>
<%-- 	${revNo}
	${loginMember.memberNo} --%>
<h1>신고하기</h1>
<form action="${contextPath}/lesson/report/${revNo}" onsubmit="return validate();">
	<input type="hidden" name="memberNo" value="${loginMember.memberNo}">
	<table class="table table-striped table-hover">
	<tbody>
		<tr>
			<th>신고사유</th>
			<td>
				<label>
					<input type="radio" class="reason-button" name="catCode" value="1"> 
					<strong>욕설/비방</strong>
					(상대에게 부당하게 욕설/비방하는 글)
				</label>
				<label>
					<input type="radio" class="reason-button" name="catCode" value="2">
					<strong>홍보 게시글</strong>
					(관련없는 홍보용 후기)
				</label>
				<label>
					<input type="radio" class="reason-button" name="catCode" value="3">
					<strong>사유1</strong>
					(무야호)
				</label>
				<label>
					<input type="radio" class="reason-button" name="catCode" value="4">
					<strong>사유2</strong>
					(어떤 어떤 사유)
				</label>
				<label>
					<input type="radio" class="reason-button" name="catCode" value="5">
					<strong>사유3</strong>
					(가나다라마바사 아자차카타파하)
				</label>
				<label>
					<input type="radio" class="reason-button" name="catCode" value="6">
					<strong>기타</strong>
					(사유 작성)
				</label>
			</td>
		</tr>
		<tr>
			<th>상세사유 </th>
			<td> 
				<p>상세사유를 작성해주세요</p>
				<textarea name="repContent"></textarea>
			</td>
		</tr>
	</tbody>
	</table>
	
	<div class="button-area">
		<a class="btn" id="close" href="#" onclick="window.close(); return false;">닫기</a>
		<button id="submit" class="btn" type="submit">신고하기</button>
	</div>

</form>
<script>
$(".reason-button").click(function() {
	$(".reason-button").prop("checked", false);
	$(this).prop("checked", true);
})

function validate() {
	console.log($("input[name='catCode']:checked").val());
	if($("input[name='catCode']:checked").length == 0) {
		window.alert("신고사유를 선택해주세요");
		return false;
	}
	if($("input[name='catCode']:checked").val()==6) {
		window.alert("상세 사유를 작성해주세요");
		return false;
	}
}
</script>
</body>
</html>