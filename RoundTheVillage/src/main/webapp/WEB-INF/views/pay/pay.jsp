<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수업 결제</title>
<link rel="stylesheet" href="${contextPath}/resources/css/pay/pay.css">
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="container">
    <h4 class="hr-sect mt-5">수업 결제</h4>
    <div class="row p-3">
	    <div class="bb row px-3">
	        <div class="col-md-3">
	            <img src="${contextPath}/resources/images/lesson/${lesson.fileName}" class="rounded float-left mb-4 w-100" id="classImg">
	        </div>
	        <div class="col-md-9 d-flex flex-column position-static">
	            <h3 class="mb-2 font-weight-bold" id="lseTitle">${lesson.lesTitle}</h3>
	            <div class="mb-2">${lesson.craftshopName} | ${lesson.lesCategory}</div>
	
	            <div class="row pt-2">
	                <div class="col-md-3"><h6 class="font-weight-bold">예약 날짜</h6></div>
	                <span class="col-md-9 font-weight-bold">${map.lesTime}</span>
	            </div>
	            
	            <div class="row pt-2">
	                <div class="col-md-3"><h6 class="font-weight-bold">참가 인원</h6></div>
	                <span class="col-md-9 font-weight-bold">${map.lesAmount}명</span>
	            </div>
	        </div>
	    </div>

			<div class="col-md-12 mt-4">
			    <ul class="list-group list-group-flush mb-3">
			        <li class="list-group-item d-flex justify-content-between lh-condensed">
			            <div><h6 class="my-0 font-weight-bold">상품 금액</h6></div>
			            <span>${lesson.lesPrice * map.lesAmount}원</span>
			        </li>
			        <li class="list-group-item d-flex justify-content-between bg-light">
			            <div class="text-around"><h6 class="my-0">할인 금액</h6></div>
			            <span class="text-around" id="totalDis">- 0원</span>
			        </li>
			        <li class="list-group-item d-flex justify-content-between lh-condensed">
			            <div><h6 class="my-0 text-around">회원 등급 할인</h6></div>
			            <span class="text-around" id="gradeDis">- 0원</span>
			        </li>
			        <li class="list-group-item d-flex justify-content-between lh-condensed bb">
			            <div><h6 class="my-0 text-around">쿠폰 할인</h6></div>
			            <span class="text-around" id="couponDis">- 0원</span>
			        </li>
			        <li class="list-group-item d-flex justify-content-between">
			            <strong>결제 금액</strong>
			            <strong id="totalPrice"></strong>
			        </li>
			    </ul>
			
			    <div class="px-4 py-5 bb">
			        <h6 class="mb-3 font-weight-bold">쿠폰 선택</h6>
			        <select class="col-md-12 custom-select" id="coupon">
			            <option class="couponCnt"></option>
			            
			            <c:forEach var="coupon" items="${cList}">
								    	<option value="${coupon.discount}" id="${coupon.couponNo}">${coupon.couponName}</option>
									</c:forEach>
			        </select>
			    </div>
			</div>
    </div>

    <div class="text-center p-5">
        <button class="btn btn-around" onclick="requestPay()">결제하기</button>
        <button class="btn btn-around-2" onclick="history.back()">취소</button>
    </div>
</div>
<jsp:include page="../common/footer.jsp" />

<script>
    var price = "${lesson.lesPrice * map.lesAmount}";
		var grade = "${loginMember.memberGrade}";
    var coupon = 0;
    var couponCnt = "${cList.size()}";
    var couponDis = 0;

    var gradeDis = Math.floor(price * (grade * 0.05));
    $("#gradeDis").text("- " + gradeDis + "원");
    
    if (couponCnt < 1)
        $(".couponCnt").text("적용 가능한 쿠폰이 없습니다.");
    else
        $(".couponCnt").text("적용 가능 쿠폰 (" + couponCnt + "개)");

    $("#coupon").change(function () {
        if ($(this).val() < 1)
            couponDis = Math.floor(price * $(this).val());
        else if ($(this).val() > 1)
            couponDis = Math.floor($(this).val());
        else
            couponDis = 0;

        $("#couponDis").text("- " + couponDis + "원");
        $("#totalDis").text("- " + (gradeDis + Number(couponDis)) + "원");
        $("#totalPrice").text(price - gradeDis - couponDis + "원");
    });

    $("#totalDis").text("- " + (gradeDis + Number(couponDis)) + "원");
    $("#totalPrice").text((price - gradeDis) + "원");
    
    // 전화번호
    $(".phone").on("input", function() {
			if ($(this).val().length > $(this).prop("maxLength")) 
				$(this).val($(this).val().slice(0, $(this).prop("maxLength")));
		});
</script>

<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	IMP.init("imp47764579");
	
  function requestPay() {
			var amt = Number($("#totalPrice").text().slice(0, -1));
			var phone = $("#phone1").val() + "-" + $("#phone2").val() + "-" + $("#phone3").val();
			
      // IMP.request_pay(param, callback) 호출
       IMP.request_pay({ // param
          pg: "kakaopay",
          pay_method: "kakaopay",
          name: $("#lseTitle").text(),
          amount: amt,
          buyer_email: $("#email").text(),
          buyer_name: $("#name").text(),
          buyer_tel: phone,
      }, function (rsp) { // callback
          if (rsp.success) {  // 가맹점 서버 결제 API 성공시 로직
	          jQuery.ajax({
	              url: "${contextPath}/pay/payAction", // 가맹점 서버
	              method: "POST",
	              data: {
	            	  resDate: "${map.lesTime}",
	            		payAmt: rsp.paid_amount,
	            		gradeDis: $("#gradeDis").text().slice(1, -1),
	            		couponDis: $("#couponDis").text().slice(1, -1),
	            		impUid: rsp.imp_uid,
	            		couponNo: $("#coupon option:selected").attr("id"),
	            		lesNo: "${lesson.lesNo}",
	            		prtcpAmt: "${map.lesAmount}"
	              }
	          }) .done(function (data) {
	        	  if(data > 0){ // 결제 완료 페이지로
        		    var form = $("<form>");
        		    form.attr("method", "post");
        		    form.attr("action", "complete");
								
        		    var impUid = $("<input>").attr("type", "hidden").attr("name", "impUid").val(rsp.imp_uid);
        		    form.append(impUid);
        		    $(document.body).append(form);
        		    
        		    form.submit();
		        	  //location.href = "complete/" + rsp.imp_uid;
	        	  }
	        	  else 
	        		  alert("결제에 실패하였습니다.");
	          })
          } else {
        	  alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
          }
      }); 
    }
</script>
</body>
</html>