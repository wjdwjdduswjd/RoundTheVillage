<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <!-- 스타일 링크 -->
    <link rel="stylesheet" href="${contextPath}/resources/css/member/signUp.css" type="text/css">
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

        <div class="signUp">

            <!-- 회원 종류 선택 -->
            <div class="s_radio">
                <span class="f">
                    <label class="box-radio-input">
                        <input type="radio" name="cp_item" value="G" checked="checked"><span>일반 회원</span>
                    </label>
                </span>

                <span class="s">
                    <label class="box-radio-input">
                        <input type="radio" name="cp_item" value="C"><span>공방 회원</span>
                    </label>
                </span>
            </div>

            <!-- 닉네임 -->
            <label class="title">닉네임</label><br>
            <input type="text" name="nickName" id="nickName">

            <!-- 아이디 입력 -->
            <label class="title">아이디</label><br>
            <input type="text" name="id" id="id">

            <!-- 비밀번호 -->
            <label class="title">비밀번호</label><br>
            <input type="text" name="pwd" id="pwd">

            <!-- 비밀번호 확인 -->
            <label class="title">비밀번호 확인</label><br>
            <input type="text" name="pwd2" id="pwd2">

            <!-- 관심분야 -->
            <label class="title">관심분야 <label style="font-size: 12px; margin-bottom: 0.5;">(중복선택 가능)</label></label><br>

            <label class="box-checkbox-input">
                <input type="checkbox" name="intrs" id="art" value="미술" checked="checked"><span>미술</span>
            </label>

            <label class="box-checkbox-input">
                <input type="checkbox" name="intrs" id="pic" value="사진/영상"><span>사진/영상</span>
            </label>

            <label class="box-checkbox-input">
                <input type="checkbox" name="intrs" id="cook" value="요리/음료"><span>요리/음료</span>
            </label>

            <label class="box-checkbox-input">
                <input type="checkbox" name="intrs" id="bty" value="뷰티"><span>뷰티</span>
            </label>

            <label class="box-checkbox-input">
                <input type="checkbox" name="intrs" id="music" value="음악"><span>음악</span>
            </label>
            <br><!--  -->
            <label class="box-checkbox-input">
                <input type="checkbox" name="intrs" id="exercise" value="운동"><span>운동</span>
            </label>
            <label class="box-checkbox-input">
                <input type="checkbox" name="intrs" id="craft" value="공예"><span>공예</span>
            </label>
            <label class="box-checkbox-input">
                <input type="checkbox" name="intrs" id="writing" value="글쓰기"><span>글쓰기</span>
            </label>
            <label class="box-checkbox-input">
                <input type="checkbox" name="intrs" id="kids" value="키즈"><span>키즈</span>
            </label>
            <label class="box-checkbox-input">
                <input type="checkbox" name="intrs" id="flowers" value="플라워"><span>플라워</span>
            </label>

            <!-- 이메일 -->
            <label class="title">이메일</label><br>
            <input type="text" name="email" id="email" class="b">
            <button type="button" id="email_button" class="email_button">인증하기</button>

            <!-- 주소 -->
            <label class="title">거주지 주소</label>

            <div>
                <label class="addr text">우편번호</label>
                <input class="a" type="text" name="address1" id="address1">
                <button type="button" id="search_button" class="search_button">검색</button>
            </div>
            <br><br>

            <div>
                <label class="addr text">도로명 주소</label> 
                <input class="b" type="text" name="address2" id="address2">
            </div>
            <br><br>
            
            <div>
                <label class="addr text">상세 주소</label>
                <input class="b" type="text" name="address3" id="address3">
            </div>

            <!-- 가입하기 버튼 -->
            <div>
                <button type="submit" id="signBtn" class="btn">가입하기</button>
            </div>


        </div>

    </div>


</body>

</html>