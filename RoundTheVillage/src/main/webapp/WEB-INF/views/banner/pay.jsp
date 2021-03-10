<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배너 결제</title>
<link rel="stylesheet" href="${contextPath}/resources/css/pay/pay.css">
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<div class="container">

    <h4 class="mt-5 mb-4">배너 결제</h4>
    <div class="row bg-light rounded">
    
        <form class="col-md-12 p-4">
            <div class="form-group">
                <label for="URL" class="font-weight-bold py-3">링크 URL</label>
                <input type="text" class="form-control" id="URL" name="URL">
            </div>
            <div class="form-group">
                <label for="banImg" class="font-weight-bold">배너 이미지</label>
                <input type="file" class="form-control-file" id="banImg" name="banImg" onchange="LoadImg(this)" required>
                <div class="py-3 imgPrivew"></div>
            </div>

	        <div class="mb-4">
	            <strong>배너 광고 시작일 선택</strong>
	        </div>
	        <table id="calendar">
	            <tr>
	                <th onclick="beforem()" id="before">&lt;</th>
	                <th colspan="5" id="yearmonth" class="p-3"></th>
	                <th onclick="nextm()" id="next">&gt;</th>
	            </tr>
	            <tr>
	                <th style="color:#dc3545">SUN</th>
	                <th>MON</th>
	                <th>TUE</th>
	                <th>WED</th>
	                <th>THU</th>
	                <th>FRI</th>
	                <th style="color:#007bff">SAT</th>
	            </tr>
	        </table>
	
	        <div class="text-muted text-right small" style="width: 330px;">배너는 선택한 날짜부터 10일동안 등록됩니다.</div>
	        <div class="text-right p-2" style="width: 330px;">
	            <span class="color today mr-2">오늘</span>
	            <span class="color select">선택</span>
	        </div>
	
	        <div class="row py-4">
	            <strong class="col-md-3">기간</strong>
	            <input type="text" class="form-control-plaintext col-md-9 pl-3" id="term" name="term" readonly>
	        </div>
	        <div class="row">
	            <strong class="col-md-3">결제 금액</strong>
	            <input type="text" readonly class="form-control-plaintext col-md-9 pl-3" name="price" id="price"
	                value="10000원">
	        </div>
        </form>

        <div class="col-md-12 text-center p-5">
            <button type="button" class="btn btn-around" onclick="requestPay()">결제하기</button>
            <a href="#" class="btn btn-around-2">취소</a>
        </div>
    </div>
</div>
<jsp:include page="../common/footer.jsp" />

<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Modal Methods</h4>
            </div>
            <div class="modal-body">
                <p>시작 날짜를 선택해주세요.</p>
            </div>
        </div>
    </div>
</div>

<script>
		// 이미지
		var banImg;

    function LoadImg(value) {
        if (value.files && value.files[0]) {
            var reader = new FileReader();
            reader.readAsDataURL(value.files[0]);

            reader.onload = function (e) {
                var img = $("<img>").attr("src", e.target.result).addClass("col-md-10");
                $(".imgPrivew").append(img);
                
                var formData = new FormData(); 
                formData.append("uploadFile", value.files[0]);

                $.ajax({
                    url: "insertImage",
                    type: "post",
                    enctype: "multipart/form-data", 
                    data: formData,
                    contentType: false,
                    cache: false,
                    processData: false,
                    dataType: "json",
                    success: function(fileName) {
                        banImg = fileName;
                    }
                });
            }
        }
    }

    // 달력
    var today = new Date(); // 오늘 날짜
    var date = new Date();
    var startDate;
    var endDate;
    var day;
    
    build();

    function beforem() { // 이전 달을 today에 값을 저장
        today = new Date(today.getFullYear(), today.getMonth() - 1, 1);

        if (today.getFullYear() > date.getFullYear() || today.getMonth() >= date.getMonth())
            build();
        else
            today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
    }

    function nextm() { // 다음 달을 today에 저장
        today = new Date(today.getFullYear(), today.getMonth() + 1, 1);
        build();
    }

    function build() {
        var nMonth = new Date(today.getFullYear(), today.getMonth(), 1); // 현재 달의 첫째 날
        var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0); // 현재 달의 마지막 날
        var tbcal = document.getElementById("calendar"); // 테이블 달력을 만들 테이블
        
        var yearmonth = document.getElementById("yearmonth");
        yearmonth.innerHTML = today.getFullYear() + "." + (today.getMonth() + 1); // 년도와 월 출력 
         
        while (tbcal.rows.length > 2) { // 남은 테이블 줄 삭제
            tbcal.deleteRow(tbcal.rows.length - 1);
        }
        
        var row = null;
        row = tbcal.insertRow();
        var cnt = 0;
        
        for (var i = 0; i < nMonth.getDay(); i++) { // 1일 시작칸 찾기
            cell = row.insertCell();
            cnt++;
        }
        
        if("${empty dList}") {
	        $("#calendar td").each(function(index, item){
				   if("${dList}".indexOf(("00"+$(item).text()).slice(-2)) != -1) {
					   $(item).css("opacity", "0.3");
	 			   $(item).css("cursor", "default");
	 			   $(item).prop("disabled", true);
				   }
			   })
			   
       } else {
        var disabled;
        
    		jQuery.ajax({
    		   url: "${contextPath}/banner/selectDate", 
    		   method: "POST",
    		   data: { 
    			   year: today.getFullYear(),
    			   month: today.getMonth() + 1,
    			   date: today.getDate()
    		   },
    		   success: function(result) {
    			   disabled = result;
    			   
    			   $("#calendar td").each(function(index, item){
    				   if(disabled.indexOf(("00"+$(item).text()).slice(-2)) != -1) {
    					   $(item).css("opacity", "0.3");
		    			   $(item).css("cursor", "default");
		    			   $(item).prop("disabled", true);
    				   }
    			   })
    			 }
    		});
		   }
        
        for (var i = 1; i <= lastDate.getDate(); i++) { // 달력 출력

            cell = row.insertCell();
            cell.innerHTML = i;
            cnt++;

            if (cnt % 7 == 1) // 일요일
                cell.innerHTML = "<font color=#dc3545>" + i;
            else if (cnt % 7 == 0) { // 토요일
                cell.innerHTML = "<font color=#007bff>" + i;
                row = calendar.insertRow(); // 줄 추가
            }

            if (today.getFullYear() == date.getFullYear() && today.getMonth() == date.getMonth() && i == date.getDate()) {
                cell.bgColor = "#FBBC73"; // 오늘
                cell.innerHTML = "<font color=#00000>" + i;
                $(cell).css("cursor", "default");
                $(cell).prop("disabled", true);
            }

            if (startDate != undefined && today.getFullYear() == startDate.getFullYear() && today.getMonth() == startDate.getMonth() && i == startDate.getDate())
                $(cell).addClass("selected"); // 다른 달로 넘어갔다 왔을 때 선택 유지

            if (today.getFullYear() == date.getFullYear() && today.getMonth() == date.getMonth() && i < date.getDate()) { // 지날 날짜 선택 불가
                $(cell).css("opacity", "0.7");
                $(cell).css("cursor", "default");
                $(cell).prop("disabled", true);
                
            }
        }
    }

    // 날짜 선택
    $(document).on("click", "td", function (event) {
        $("td").removeClass("selected");
        $(this).addClass("selected");

        startDate = new Date(today.getFullYear(), today.getMonth(), $(this).text());
        var startDateStr = startDate.getFullYear() + "." + (startDate.getMonth() + 1) + "." + startDate.getDate();

        endDate = new Date(today.getFullYear(), today.getMonth(), $(this).text());
        endDate.setDate(endDate.getDate() + 6)
        var endDateStr = endDate.getFullYear() + "." + (endDate.getMonth() + 1) + "." + endDate.getDate();

        $("#term").val(startDateStr + " ~ " + endDateStr);
    });
</script>

<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	IMP.init("imp47764579"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.
	
  function requestPay() {
		
			if($("#banImg").val() == "") {
					//swal({ icon: "info", title: "이미지를 등록해주세요" });
					$("#myModal").modal("show");
			}
			else if ($("#term").val() == "") {
					//swal({ icon: "info", title: "시작 날짜를 선택해주세요" });
					$("#myModal").modal("show");
			    
			} else {
					var amt = Number($("#price").val().slice(0, -1));
					var start = startDate.getFullYear() + "-" + (("00"+(startDate.getMonth() + 1)).slice(-2)) + "-" + (("00"+startDate.getDate()).slice(-2));
					var end = endDate.getFullYear() + "-" + (("00"+(endDate.getMonth() + 1)).slice(-2)) + "-" + (("00"+endDate.getDate()).slice(-2));
					
		      // IMP.request_pay(param, callback) 호출
		      IMP.request_pay({ // param
		          pg: "kakaopay",
		          pay_method: "kakaopay",
		          name: "배너",
		          amount: amt,
		      }, function (rsp) { // callback
								if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
								    // jQuery로 HTTP 요청
								    jQuery.ajax({
								        url: "${contextPath}/banner/payAction", // 가맹점 서버
								        method: "POST",
								        data: {
								        	startStr: start,
								        	endStr: end,
								        	URL: $("#URL").val(),
								        	img: banImg,
								        	payAmt: rsp.paid_amount,
								        	impUid: rsp.imp_uid
								        }
								    }).done(function (data) {
								      // 가맹점 서버 결제 API 성공시 로직
					        	  if(data > 0){
					        		    var form = $("<form>");
					        		    form.attr("method", "post");
					        		    form.attr("action", "payComplete");
													
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
    }
</script>
</body>
</html>