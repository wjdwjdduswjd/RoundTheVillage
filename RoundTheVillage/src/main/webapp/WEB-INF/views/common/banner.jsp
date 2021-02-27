<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
   
<style>
#banner {
  width: 1200px;
  height: 300px;
}
</style>

<body>
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
</body>
</html>