<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>후기게시판 목록</title>
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
    margin-left: 20px;
    width: 70%;
    height: 70%;
    margin-left: 150px;
    background-color: #fbbc73;
    border: 1px solid white;
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

#workshopSelect {
  background-color: #ffffff;
  color: #fbbc73;
/*   padding: 12px; */
  width: 100px;
  border: 1px solid gray;
  font-size: 15px;
  -webkit-appearance: button;
  appearance: button;
  outline: none;
  border-radius: .2rem;
}


.box:hover::before {
  color: rgba(255, 255, 255, 0.6);
  background-color: rgba(255, 255, 255, 0.2);
}

.box select option {
  padding: 30px;
}
/* ------------------------------------------------------- */

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
}

#workshopSelect2 {
  background-color: #ffffff;
  color: #fbbc73;
/*   padding: 12px; */
  width: 100px;
  height: 40px;
  border: 1px solid gray;
  font-size: 15px;
  -webkit-appearance: button;
  appearance: button;
  outline: none;
  border-radius: .2rem;
}


.box:hover::before {
  color: rgba(255, 255, 255, 0.6);
  background-color: rgba(255, 255, 255, 0.2);
}

.box select option {
  padding: 30px;
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
                        
                        
                            <select id="workshopSelect">
                              <option>최신순</option>
                              <option>조회순</option>
                              <option>좋아요순</option>
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
                    <div class="col-md-3 area3">
                    </div>
                    <div class="col-md-6 pagination-area">
                        <ul class="pagination">
                            <li class="page-item">
                                <a class="page-link" href="#">Previous</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="#">1</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="#">2</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="#">3</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="#">4</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="#">5</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="#">Next</a>
                            </li>
                        </ul>
                    </div>

                    <div class="col-md-3 area3">
                        <button type="button" class="btn btn-secondary btn-sm writeBtn">
                            글쓰기
                        </button>
                    </div>
                </div>


                <div class="row search-area">
                    <div class="col-md-2">
                        <div class="d-flex">
                            <div class="main select">
                                <select id="workshopSelect2">
                                    <option>Option 1</option>
                                    <option>Option 2</option>
                                    <option>Option 3</option>
                                    <option>Option 4</option>
                                    <option>Option 5</option>
                                  </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="form-group">
                            <input type="text" class="form-control" />
                        </div>
                    </div>
                    <div class="col-md-2">
                        <button type="submit" class="btn btn-secondary btn-sm searchBtn">
                            검색
                        </button>
                    </div>
                </div>
            </div>

            <div class="col-md-2">
            </div>
        </div>
    </div>

<script>

    
    // var selectedBtn = document.getElementsByClassName("categoryBtn");
    //var selectedBtn = $(".categoryBtn");
    $(".categoryBtn").on("click", function(){
        var selectedIndex = $(".categoryBtn").index(this);

        $(".categoryBtn").each(function(index, item){
            if(index == selectedIndex){
                $(this).addClass("selectedBtn");
            }else{
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

</body>
</html>