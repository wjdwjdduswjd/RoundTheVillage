<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">

(function() {
		var result = ${result};
		if(result > 0){
			alert("신고에 성공했습니다");
			window.close();
		}
		else {
			alert("신고에 실패했습니다.")
		}
	})();
	
</script>
</body>
</html>