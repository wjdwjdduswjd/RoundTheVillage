<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디찾기</title>
    <!-- 스타일 링크 -->
    <link rel="stylesheet" href="${contextPath}/resources/css/member/idFind.css" type="text/css">
    <!-- 부트스트랩 사용을 위한 css 추가 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
    <!-- 부트스트랩 사용을 위한 라이브러리 추가 (반드시 jQuery가 항상 먼저여야한다. 순서 중요!) -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>
</head>
<body>
    <div class="container">
    
    
    		<!-- 메인 이동 로고 -->
				<div class="login-logo-area">
					<a href="${contextPath}"><img src="${contextPath}/resources/images/member/zero.png" class="login-logo"></a>
				</div>
    
         <!-- 아이디찾기, 비밀번호 찾기 -->
         <div class="s_radio">
            <span class="f">
                <label class="box-radio-input">
                    <input type="radio" name="cp_item" checked="checked" onclick="location.href='${contextPath}/member/idFind'"  ><span>아이디 찾기</span>
                </label>
            </span>

            <span class="s">
                <label class="box-radio-input">
                    <input type="radio" name="cp_item" onclick="location.href='${contextPath}/member/pwdFind'" ><span>비밀번호 찾기</span>
                </label>
            </span>
        </div>
        <hr>
        
        <!-- 이름, 이메일 입력 -->
        <div class="input-text">
            <div class="input-area in-area">
                <label class="text">이름</label> 
                <input class="b" type="text" name="idFind-name" id="idFind-name">
            </div> 
                

            <div class="input-area ">
                <label class="text">이메일 주소</label>
                <input class="b" type="text" name="id-email" id="id-email"  placeholder="가입했을 때 인증했던 이메일을 입력해주세요.">
                <button type="button" id="idFind-email" class="idFind-email">인증번호 받기</button>
            </div>

            <!-- 이메일인증번호 입력부분 -->
            <div class="input-area">
                <label class="addr text"></label>
                <input class="b" type="text" name="idFind-crtfd-num" id="idFind-crtfd-num" placeholder="인증번호를 입력해주세요.">
            </div>
            
            <!-- 완료 버튼 -->
            <div class="input-area">
                <label class="addr text"></label>
                <button class="b b-a" type="button" name="idFind-crtfd" id="idFind-crtfd"  onclick="location.href='${contextPath}/member/idFindComplete'">완료</button>
            </div>

        </div>




    </div>
</body>
</html>