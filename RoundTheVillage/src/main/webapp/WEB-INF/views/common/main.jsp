<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>동네 한 바퀴</title>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.theme.min.css"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.css"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- 나눔스퀘어 --> 
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<!-- css 연결  -->
<link rel="stylesheet" href="${contextPath}/resources/css/common/main2.css">
<style>
#banner {
  width: 1200px;
  height: 300px;
  margin-top: 60px;
  margin-bottom: 60px;
}
</style> 
  
</head>
<body>
<jsp:include page="../common/header.jsp"/>

<!------------------------------------------ banner ------------------------------------------>
<div id="banner">
  <div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
    <div class="carousel-inner">
    
	    <c:choose>
	    	<c:when test="${empty bList}">
					<div class="carousel-item active">
		       <img src="${contextPath}/resources/images/banner/banner_default.jpg" class="d-block w-100" alt="...">
		      </div>
				</c:when>
	    	<c:otherwise>
		    	<c:forEach var="banner" items="${bList}" varStatus="vs">
			      <div class="carousel-item <c:if test="${vs.first}">active</c:if>">
			       <img src="${contextPath}/resources/images/bannerImages/${banner.img}" class="d-block w-100" alt="...">
			      </div>
		    	</c:forEach>
	    	</c:otherwise>
	    </c:choose>
    </div>

		<!-- 이전,다음 버튼 -->
    <a class="carousel-control-prev" href="#carouselExampleFade" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleFade" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>


<!-------------------------------------------- main -------------------------------------------->
    <div class="Amain">
        <div class="row">
            <div class="col-md-6 col-sm-6 col-xs-12">
                <div id="bigTitle">
                    <img src="${contextPath}/resources/images/logo/bread.png" width="30px;">
                    <p class="p1">인기 폭발!</p>
                    <p class="p2">실시간 TOP8 공방</p>
                </div>
            </div>

            <div class="col-md-6 col-sm-6 col-xs-6 hidden-xs ">
                <div class="controls pull-right">
                    <a class="left fa fa-chevron-left btn btn-light" href="#carousel-example" data-slide="prev"></a>
                    <a class="right fa fa-chevron-right btn btn-light" href="#carousel-example" data-slide="next"></a>
                </div>
            </div>
        </div>
        
        <div id="carousel-example" class="carousel slide hidden-xs" data-ride="carousel" data-type="multi">
            <div class="carousel-inner">
                <div class="item active">
                    <div class="row">

                        <!-- 1 ------------------------------------------------------------------------------------->
                        <div class="col-md-3 col-sm-3 col-xs-12">
                            <div class="slider-item">
                                <div class="slider-image">
                                    <img src="${contextPath}/resources/images/main/img_1.jpg" class="img-responsive" alt="a" />
                                </div>

                                <div class="slider-main-detail">
                                    <div class="slider-detail">
                                        <div class="product-detail">
                                            <h6 class="card-category">#요리/음료</h6>
                                            <h5 class="card-title">[jeongmin Attic]</h5>
                                            <p class="card-text">coffee & Tea 그리고 감성 한 스푼.</p>
                                        </div>
                                    </div>
                                    <div class="cart-section">
                                        <div class="row">
                                            <div class="col-md-6 col-sm-12 col-xs-6 like">
                                                <p id="like">♥1004</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3 col-sm-3 col-xs-12">
                            <div class="slider-item">
                                <div class="slider-image">
                                    <img src="${contextPath}/resources/images/main/img_3.jpg" class="img-responsive" alt="a" />
                                </div>

                                <div class="slider-main-detail">
                                    <div class="slider-detail">
                                        <div class="product-detail">
                                            <h6 class="card-category">#뷰티</h6>
                                            <h5 class="card-title">[Sunny Beauty]</h5>
                                            <p class="card-text">이진선과 함께하는 메이크업.</p>
                                        </div>
                                    </div>
                                    <div class="cart-section">
                                        <div class="row">
                                            <div class="col-md-6 col-sm-12 col-xs-6 review">
                                                <p>♥1004</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3 col-sm-3 col-xs-12">
                            <div class="slider-item">
                                <div class="slider-image">
                                    <img src="${contextPath}/resources/images/main/img_9.jpg" class="img-responsive" alt="a" />
                                </div>

                                <div class="slider-main-detail">
                                    <div class="slider-detail">
                                        <div class="product-detail">
                                            <h6 class="card-category">#미술</h6>
                                            <h5 class="card-title">[flower Academy]</h5>
                                            <p class="card-text">요즘 유행하는 웹툰 그림체 그려보기.</p>
                                        </div>
                                    </div>
                                    <div class="cart-section">
                                        <div class="row">
                                            <div class="col-md-6 col-sm-12 col-xs-6 review">
                                                <p>♥1004</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3 col-sm-3 col-xs-12">
                            <div class="slider-item">
                                <div class="slider-image">
                                    <img src="${contextPath}/resources/images/main/img_7.jpg" class="img-responsive" alt="a" />
                                </div>

                                <div class="slider-main-detail">
                                    <div class="slider-detail">
                                        <div class="product-detail">
                                            <h6 class="card-category">#요리/음료</h6>
                                            <h5 class="card-title">[모카 베이커리 공방]</h5>
                                            <p class="card-text">마카롱도 쉽게 만들 수 있어요!</p>
                                        </div>
                                    </div>
                                    <div class="cart-section">
                                        <div class="row">
                                            <div class="col-md-6 col-sm-12 col-xs-6 review">
                                                <p>♥1004</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>

                <!-- 2 ------------------------------------------------------------------------------------------------->
                <div class="item">
                    <div class="row">
                        <div class="col-md-3 col-sm-3 col-xs-12">
                            <div class="slider-item">
                                <div class="slider-image">
                                    <img src="https://dummyimage.com/250x200/#cccccc/1f1b1f.png" class="img-responsive"
                                        alt="a" />
                                </div>
                                <div class="slider-main-detail">
                                    <div class="slider-detail">
                                        <div class="product-detail">
                                            <h5>Product Name</h5>
                                            <h5 class="detail-price">$187.87</h5>
                                        </div>
                                    </div>
                                    <div class="cart-section">
                                        <div class="row">
                                            <div class="col-md-6 col-sm-12 col-xs-6 review">
                                                <p>♥1004</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-3 col-xs-12">
                            <div class="slider-item">
                                <div class="slider-image">
                                    <img src="https://dummyimage.com/250x200/#cccccc/1f1b1f.png" class="img-responsive"
                                        alt="a" />
                                </div>
                                <div class="slider-main-detail">
                                    <div class="slider-detail">
                                        <div class="product-detail">
                                            <h5>Product Name</h5>
                                            <h5 class="detail-price">$187.87</h5>
                                        </div>
                                    </div>
                                    <div class="cart-section">
                                        <div class="row">
                                            <div class="col-md-6 col-sm-12 col-xs-6 review">
                                                <p>♥1004</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-3 col-xs-12">
                            <div class="slider-item">
                                <div class="slider-image">
                                    <img src="https://dummyimage.com/250x200/#cccccc/1f1b1f.png" class="img-responsive"
                                        alt="a" />
                                </div>
                                <div class="slider-main-detail">
                                    <div class="slider-detail">
                                        <div class="product-detail">
                                            <h5>Product Name</h5>
                                            <h5 class="detail-price">$187.87</h5>
                                        </div>
                                    </div>
                                    <div class="cart-section">
                                        <div class="row">
                                            <div class="col-md-6 col-sm-12 col-xs-6 review">
                                                <p>♥1004</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-3 col-xs-12">
                            <div class="slider-item">
                                <div class="slider-image">
                                    <img src="https://dummyimage.com/250x200/#cccccc/1f1b1f.png" class="img-responsive"
                                        alt="a" />
                                </div>
                                <div class="slider-main-detail">
                                    <div class="slider-detail">
                                        <div class="product-detail">
                                            <h5>Product Name</h5>
                                            <h5 class="detail-price">$187.87</h5>
                                        </div>
                                    </div>
                                    <div class="cart-section">
                                        <div class="row">
                                            <div class="col-md-6 col-sm-12 col-xs-6 review">
                                                <p>♥1004</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>


<jsp:include page="footer.jsp"/>

</body>
</html>