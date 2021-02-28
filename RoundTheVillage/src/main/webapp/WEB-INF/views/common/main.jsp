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

<style>
#banner {
  width: 1200px;
  height: 300px;
  margin-top: 80px;
}
</style>   
</head>
<body>
<jsp:include page="header.jsp"/>

<!------------------------------------------ banner ------------------------------------------>
<div id="banner">
  <div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
    <div class="carousel-inner">

      <div class="carousel-item active">
        <img src="${contextPath}/resources/images/banner/banner-001.jpg" class="d-block w-100" alt="...">
      </div>

      <div class="carousel-item">
        <img src="${contextPath}/resources/images/banner/banner-002.jpg" alt="...">
      </div>

      <div class="carousel-item">
        <img src="${contextPath}/resources/images/banner/banner-003.jpg" alt="...">
      </div>

      <div class="carousel-item">
        <img src="${contextPath}/resources/images/banner/banner-004.jpg" alt="...">
      </div>

      <div class="carousel-item">
        <img src="${contextPath}/resources/images/banner/banner-005.jpg" alt="...">
      </div>

      <div class="carousel-item">
        <img src="${contextPath}/resources/images/banner/banner-006.jpg" alt="...">
      </div>

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






<%-- <jsp:include page="footer.jsp"/> --%>

</body>
</html>