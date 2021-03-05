<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자 공방 신청 리스트 페이지</title>
 
     <link rel="stylesheet" type="text/css"
         href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
     <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
         rel="stylesheet">

     <!-- 부트스트랩 사용을 위한 css 추가 -->
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
         integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

     <!-- 부트스트랩 사용을 위한 라이브러리 추가 (반드시 jQuery가 항상 먼저여야한다. 순서 중요!) -->
     <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
         integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
         crossorigin="anonymous"></script>
         
         <style>
            * {
                font-family: 'NanumSquare', sans-serif !important;
                font-weight: 500;
                /* 굵기 지정(100, 300, 400, 500, 700) */
                font-size: 16px;
                color: #212529;
                box-sizing: border-box;
                margin: 0;
                /* border : 1px solid black;  */
            }

            div {
                /* border : 1px solid black;  */
                box-sizing: border-box;

            }

            .main {
                width: 900px;
                height: 100%;
                float: left;
            }

            td {
                font-size: 13px;
                cursor: pointer;
            }

            th {
                font-size: 13px;
                cursor: default;
            }

            #inquiryBtn {
                margin-top: 15px;
                margin-left: 15px;
                background-color: #8ad2d5;
                color: white;
                border: white;
                border-radius: 5px;
                width: 150px;
                height: 40px;
            }

            #inquiryBtn:hover,
            #searchBtn:hover {
                background-color: rgb(214, 162, 102);
            }

            .search {
                margin-bottom: 20px;
            }

            #searchBtn {
                background-color: #fbbc73;
                color: white;
                border: white;
                border-radius: 5px;
                height: 38px;
                margin-bottom: 11px;
            }

            h6 {
                margin-left: 15px;
                height: 30px;
            }

            .page-item>a {
                color: black;
            }

            .page-item>a:hover {
                color: orange;
            }
        </style>
         

</head>
<body>

	 
  <jsp:include page="../common/header.jsp"/>

    <div class="container">
        <div class="row">
            <div class="col-md-2">
            </div>

            <div class="col-md-5">
                <div id="resultDiv">
                    <table class="table table-hover table-striped text-center" id="result-table">
                        <thead>
                            <tr>

                                <th><input type="checkbox" id="reportBox" value="reportBox" name="reportBox"> <br></th>
                                <th>공방 번호</th>
                                <th>아이디</th>
                                <th>공방명</th>
                                <th>전화번호</th>
                                <th>카테고리</th>
                            </tr>
                        </thead>

                        <tbody>

                            <tr>
                                <td colspan="8">존재하는 게시글이 없습니다.</td>
                            </tr>
                           

                                <!-- 1~10  -->
                             <%--    <c:forEach var="board" items="${fList}"> --%>
                                    <tr>
                                        <td><input type="checkbox" id="reportBox" value="reportBox" name="reportBox"> <br></td>
                                        <td>1</td>

                                        <td>user01</td>

                                        <td>
                                         유림이의 비즈공예
                                        </td>

                                        <td>010-3333-3333</td>
                                        <td>공예</td>
                                       

                                    </tr>


                        </tbody>

                    </table>

            
                    <!-- 화살표에 들어갈 주소를 변수로 생성 -->
                 <!--  <%-- 검색을 안했을 때 : /board/list.do?cp=1 검색을 했을 때 : /search.do?cp=1&sk=title&sv=49 --%>
                        <c:set var="firstPage" value="${pageUrl}?cp=1" />
                        <c:set var="lastPage" value="${pageUrl}?cp=${pInfo.maxPage}${searchStr}" />

                        <%-- EL을 이용한 숫자 연산의 단점 : 연산이 자료형에 영향을 받지 않는다. ex) 5/2=2.5 --%>
                            <%-- <fmt:parseNumber> : 숫자 형태를 지정하여 변수 선언
                                integerOnly="true" : 정수로만 숫자 표현 (소수점 버림)
                                --%>

                                <fmt:parseNumber var="c1" value="${(pInfo.currentPage - 1)/10}" integerOnly="true" />
                                <fmt:parseNumber var="prev" value="${c1 * 10}" integerOnly="true" />
                                <c:set var="prevPage" value="${pageUrl}?cp=${prev}${searchStr}" /> --> 
                                <!-- /board/list/do?cp=10  -->

                             <!--    <fmt:parseNumber var="c2" value="${(pInfo.currentPage + 9)/10}" integerOnly="true" />
                                <fmt:parseNumber var="next" value="${c2 * 10 + 1}" integerOnly="true" />
                                <c:set var="nextPage" value="${pageUrl}?cp=${next}${searchStr}" /> -->



                                <div class="my-5">
                                    <ul class="pagination pagination-sm justify-content-center">



                                        <li class="page-item">
                                            <!-- 첫 페이지로 이동(<<) -->
                                            <a class="page-link" href="${firstPage}">&lt;&lt;</a>
                                        </li>

                                        <li class="page-item">
                                            <!-- 이전 페이지로 이동(<) -->
                                            <a class="page-link" href="${prevPage}">&lt;</a>
                                        </li>


                                        <li class="page-item">
                                            <a class="page-link" style="color:orange;">${page}</a>
                                        </li>

                                        <li class="page-item">
                                            <a class="page-link" href="${pageUrl}?cp=${page}${searchStr}">${page}</a>
                                        </li>



                                        <li class="page-item">
                                            <!-- 다음 페이지로 이동(>) -->
                                            <a class="page-link" href="${nextPage}">&gt;</a>
                                        </li>

                                        <li class="page-item">
                                            <!-- 마지막 페이지로 이동(>>) -->
                                            <a class="page-link" href="${lastPage}">&gt;&gt;</a>
                                        </li>


                                    </ul>
                                </div>


                                <div class="search">
                                    <form action="${contextPath}/fSearch.do" method="GET" class="text-center"
                                        id="searchForm">
                                        <select name="sk" class="form-control"
                                            style="width: 100px; display: inline-block;">
                                            <option value="title">글 제목</option>
                                            <option value="content">내용</option>
                                        </select> <input type="text" name="sv" class="form-control"
                                            style="width: 25%; display: inline-block;">
                                        <button id="searchBtn" style="width: 100px; display: inline-block;">검색</button>
                                    </form>
                                </div>
                </div>
            </div>
            <div class="col-md-2">
            </div>

                <script>
                    $("#result-table td").on("click", function () {

                        var boardNo = $(this).parent().children().eq(0).text();
                        var url = "${contextPath}/shop/shopConfirm?cp=${pInfo.currentPage}&no="
                            + boardNo + "${searchStr}";

                        location.href = url;

                    });

                </script>
    
        </div>
    </div>
       

</body>
</html>