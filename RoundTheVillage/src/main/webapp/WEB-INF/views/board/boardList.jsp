<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%-- <jsp:include page="../common/header.jsp"/> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>후기게시판 목록</title>
  <link rel="stylesheet" type="text/css"
            href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
            rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
      integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
      integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
      crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
      crossorigin="anonymous"></script>
</head>
<style>

   * {
   font-family: 'NanumSquare', sans-serif !important;
   font-weight: 500;
   /* 굵기 지정(100, 300, 400, 500, 700) */
   font-size: 16px;
   color: #212529;
   }
.categoryBtn {
    width: 17%;
    font-size: 0.7rem;
    margin: 1%;
    background-color: #ccc;
}

.selectedBtn{
    background-color: #fbbc73;
}


.thumbnail{
    width: 125px;
    height: 125px;
}

.pagination-area {
    margin-bottom: 1%;

}

.pagination {
    justify-content: center;
    margin-top: 2%;
}

.d-flex {
    justify-content: center;
}

.form-control {
    width: 100%;
    justify-content: center;
}

.btn-group {
    margin-right: 10ch;
}
.area3 {
    margin-bottom: 10px;
}

.like {
    width: 20px;
    height: 20px;
}

.searchBtn {
    width: inherit;
    height: 40px;
    background-color: #fbbc73;
    border: 1px solid white;
}

.writeBtn {
    float: right;
    width: 70%;
    height: 80%;
		margin-right: 20px; 
    border-radius: 5px;
    background-color: #fbbc73;
    color: white;
    border: white;
    border-radius: 5px;
    height: 38px;
    margin-bottom: 11px;
}

HTML CSSResult Skip Results Iframe
body {
  margin: 0;
  padding: 0;
  background-color: #ffffff;
}

.box {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 100%;
  text-align: right;
}

/* #workshopSelect {
  background-color: #ffffff;
  color: #fbbc73;
/*   padding: 12px; */
 /*  width: 100px;
  border: 1px solid gray;
  font-size: 15px;
  -webkit-appearance: button;
  appearance: button;
  outline: none;
  border-radius: .2rem;
} */ */


.box:hover::before {
  color: rgba(255, 255, 255, 0.6);
  background-color: rgba(255, 255, 255, 0.2);
}

.box select option {
  padding: 30px;
}
/* ------------------------------------------------------- */

HTML CSSResult Skip Results Iframe

/* 
.box {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 100%;
} */

/* #workshopSelect2 {
  background-color: #ffffff;
  color: #fbbc73;
/*   padding: 12px; */
/*   width: 100px;
  height: 40px;
  border: 1px solid gray;
  font-size: 15px;
  -webkit-appearance: button;
  appearance: button;
  outline: none;
  border-radius: .2rem;
}
 */ 

/* .box:hover::before {
  color: rgba(255, 255, 255, 0.6);
  background-color: rgba(255, 255, 255, 0.2);
} */

/* .box select option {
  padding: 30px;
} */

#inquiryBtn:hover,
#searchBtn:hover {
    background-color: rgb(214, 162, 102);
}

.search {
    margin-bottom: 5px;
}

#searchBtn {
    background-color: #fbbc73;
    color: white;
    border: white;
    border-radius: 5px;
    height: 38px;
    margin-bottom: 11px;
}

.page-item>a {
    color: black;
}

.page-item>a:hover {
    color: orange;
}

.btnBtn1{
  background-color: #fbbc73;
                color: white;
                border: white;
                border-radius: 5px;
                height: 38px;
                margin-bottom: 11px;
}







</style>

<body>
	<jsp:include page="../common/header.jsp"/> 
   <div class="container">
        <div class="row">
            <div class="col-md-2">
            </div>
            <div class="col-md-8" style="text-align: center;">
                <div class="row">
                    <div class="col-md-12">
                        <button type="button" class="btn categoryBtn">미술</button>
                        <button type="button" class="btn categoryBtn">사진/영상</button>
                        <button type="button" class="btn categoryBtn">요리/음료</button>
                        <button type="button" class="btn categoryBtn">뷰티</button>
                        <button type="button" class="btn categoryBtn">음악</button>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <button type="button" class="btn categoryBtn">운동</button>
                        <button type="button" class="btn categoryBtn">공예</button>
                        <button type="button" class="btn categoryBtn">글쓰기</button>
                        <button type="button" class="btn categoryBtn">키즈</button>
                        <button type="button" class="btn categoryBtn">플라워</button>
                    </div>
                </div>

                <hr>

                <div class="row">
                    <div class="col-md-9">
                    </div>
                    <div class="col-md-3 area3">
                        <select name="selectedBtn"  class="form-control" style="width: 100px; display: inline-block;">
                            <option value="new">최신순</option>
                            <option value="view">조회순</option>
                            <option value="like">좋아요순</option>
                        </select>
                        

                    </div>


                </div>

                <br>

                <div class="row thumbnailArea">
                    <div class="col-md-3 area3">
                        <img src="공방.PNG" class="thumbnail">
                        <span class="badge badge-default" href="#">플라워 수업 후기입니다!! </span>
                        <img src="하트.png" class="like">300
                    </div>
                    
                    <%-- <c:forEach var="board" items="bList">
                    	 <div class="col-md-3 area3">
	                        <img src="공방.PNG" class="thumbnail">
	                        <span class="badge badge-default">${board.title } </span>
	                        <img src="하트.png" class="like">300
	                    </div>
                    </c:forEach> --%>
                   
              </div> 
                
                
                <div class="row thumbnailArea">
                    <div class="col-md-3 area3">
                        <img src="공방.PNG" class="thumbnail">
                        <span class="badge badge-default" href="#">플라워 수업 후기입니다!! </span>
                        <img src="하트.png" class="like">300
                    </div>
                    <div class="col-md-3 area3">
                        <img src="공방.PNG" class="thumbnail">
                        <span class="badge badge-default" href="#">플라워 수업 후기입니다!! </span>
                        <img src="하트.png" class="like">300
                    </div>
                    <div class="col-md-3 area3">
                        <img src="공방.PNG" class="thumbnail">
                        <span class="badge badge-default" href="#">플라워 수업 후기입니다!! </span>
                        <img src="하트.png" class="like">300
                    </div>
                    <div class="col-md-3 area3">
                        <img src="공방.PNG" class="thumbnail">
                        <span class="badge badge-default" href="#">플라워 수업 후기입니다!! </span>
                        <img src="하트.png" class="like">300
                    </div>
                </div>
                <div class="row thumbnailArea">
                    <div class="col-md-3 area3">
                        <img src="공방.PNG" class="thumbnail">
                        <span class="badge badge-default" href="#">플라워 수업 후기입니다!! </span>
                        <img src="하트.png" class="like">300
                    </div>
                    <div class="col-md-3 area3">
                        <img src="공방.PNG" class="thumbnail">
                        <span class="badge badge-default" href="#">플라워 수업 후기입니다!! </span>
                        <img src="하트.png" class="like">300
                    </div>
                    <div class="col-md-3 area3">
                        <img src="공방.PNG" class="thumbnail">
                        <span class="badge badge-default" href="#">플라워 수업 후기입니다!! </span>
                        <img src="하트.png" class="like">300
                    </div>
                    <div class="col-md-3 area3">
                        <img src="공방.PNG" class="thumbnail">
                        <span class="badge badge-default" href="#">플라워 수업 후기입니다!! </span>
                        <img src="하트.png" class="like">300
                    </div>
                </div>

                <div class="row thumbnailArea">
                    <div class="col-md-3 area3">
                        <img src="공방.PNG" class="thumbnail">
                        <span class="badge badge-default" href="#">플라워 수업 후기입니다!! </span>
                        <img src="하트.png" class="like">300
                    </div>
                    <div class="col-md-3 area3">
                        <img src="공방.PNG" class="thumbnail">
                        <span class="badge badge-default" href="#">플라워 수업 후기입니다!! </span>
                        <img src="하트.png" class="like">300
                    </div>
                    <div class="col-md-3 area3">
                        <img src="공방.PNG" class="thumbnail">
                        <span class="badge badge-default" href="#">플라워 수업 후기입니다!! </span>
                        <img src="하트.png" class="like">300
                    </div>
                    <div class="col-md-3 area3">
                        <img src="공방.PNG" class="thumbnail">
                        <span class="badge badge-default" href="#">플라워 수업 후기입니다!! </span>
                        <img src="하트.png" class="like">300
                    </div>
                </div>
                <br>

								
								  
                <div class="row">
                    <div class="col-md-3"></div>
                <div class="col-md-6">
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
                    <div class="col-md-3 area3">
                    
                    
									<a class="btn btn-secondary btn-sm writeBtn" href="../board/insert">글쓰기</a>
                    
                
                    </div>
                
            </div>
                


                <div class="row search-area">
                    <div class="col-md-12">
                        <div class="search">
                            <form action="${contextPath}/fSearch.do" method="GET" class="text-center" id="searchForm">
                                <select name="sk" class="form-control" style="width: 100px; display: inline-block;">
                                    <option value="title">글 제목</option>
                                    <option value="content">내용</option>
                                </select> <input type="text" name="sv" class="form-control"
                                    style="width: 25%; display: inline-block;">
                                <button id="searchBtn" style="width: 100px; display: inline-block;">검색</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

            <div class="col-md-2">
            </div>
    </div>

    <script>


        // var selectedBtn = document.getElementsByClassName("categoryBtn");
        //var selectedBtn = $(".categoryBtn");
        $(".categoryBtn").on("click", function () {
            var selectedIndex = $(".categoryBtn").index(this);

            $(".categoryBtn").each(function (index, item) {
                if (index == selectedIndex) {
                    $(this).addClass("selectedBtn");
                } else {
                    $(this).removeClass("selectedBtn")
                }

            });




            /* if($(this).hasClass("selectedBtn")  ){
                $(this).removeClass("selectedBtn")
            }else{
                $(this).addClass("selectedBtn");
            }
     */
        });




    </script>

</script>

</body>
</html>