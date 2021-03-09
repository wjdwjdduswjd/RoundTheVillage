<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자 신고 페이지</title>

<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

<!-- 부트스트랩 사용을 위한 css 추가 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

<!-- 부트스트랩 사용을 위한 라이브러리 추가 (반드시 jQuery가 항상 먼저여야한다. 순서 중요!) -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

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

#inquiryBtn:hover, #searchBtn:hover {
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


	<jsp:include page="../common/header.jsp" />

	<div class="container">
		<div class="row">
			<!--    <div class="col-md-2">
            </div> -->

			<div class="col-md-12">
				<div id="resultDiv">
					<table class="table table-hover table-striped text-center" id="result-table">
						<thead>
							<tr>

								
								<th>종류</th>
								<th>제목</th>
								<th>신고이유</th>
								<th>신고 상세내용</th>
								<th>신고자</th>
								<th>신고날짜</th>
								<th></th>
							</tr>
						</thead>

						<tbody>
							<c:choose>

								<c:when test="${empty rList}">

									<tr>
										<td colspan="8">존재하는 게시글이 없습니다.</td>
									</tr>
								</c:when>



								<c:otherwise>
									<%-- 조회된 게시글 목록이 있을 때 --%>
									<!-- 1~10  -->
									<c:forEach var="report" items="${rList}">
										<tr>
											<td><input type="checkbox" id="selectedReportBox" value="reportBox" name="reportBox" value="${report.boardReportNo}"> <br></td>
											<td><c:choose>
													<c:when test="${report.reportType == 1}">
														후기게시글
													</c:when>
													<c:otherwise>
														리뷰
													</c:otherwise>
												</c:choose></td>


											<td>${report.boardTitle}</td>

											<td>${report.categoryName}</td>

											<td>${report.boardReportReason}</td>
											<td>${report.memberNickname }</td>

											<td><fmt:formatDate var="createDate" value="${report.boardReportDate}" pattern="yyyy-MM-dd" /> <fmt:formatDate var="today" value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd" /> <fmt:formatDate value="${report.boardReportDate}" pattern="yyyy-MM-dd HH:mm:ss" /> <%-- <c:choose>
                             						  
                             						     <c:when test="${createDate != today}">${createDate}</c:when>
                             						  
                             						    글 작성일이 오늘일 경우
					                                 <c:otherwise>
					                                    <fmt:formatDate value="${report.boardReportDate}" pattern="HH:mm"/>
					                                    <!-- 오늘 작성한거면 시간이 나온다. -->
					                                 </c:otherwise>
					                              </c:choose> --%></td>
											<td><c:choose>
													<c:when test="${report.boardStatus == 'Y'}">
														<button type="button" class="btn btn-sm btn-danger ${report.reportType}-${report.boardNo}" onclick="updateStatus(this, ${report.boardNo},'N', ${report.reportType});">삭제</button>
													</c:when>
													<c:otherwise>
														<button type="button" class="btn btn-sm btn-success ${report.reportType}-${report.boardNo}" onclick="updateStatus(this, ${report.boardNo},'Y', ${report.reportType});">복구</button>
													</c:otherwise>
												</c:choose></td>
										</tr>
									</c:forEach>

								</c:otherwise>

							</c:choose>



						</tbody>
					</table>


					<!-- 화살표에 들어갈 주소를 변수로 생성 -->
					<%-- 검색을 안했을 때 : /board/list.do?cp=1 검색을 했을 때 : /search.do?cp=1&sk=title&sv=49 --%>
                        <c:set var="firstPage" value="${pageUrl}?cp=1" />
                        <c:set var="lastPage" value="${pageUrl}?cp=${pInfo.maxPage}" />

                        <%-- EL을 이용한 숫자 연산의 단점 : 연산이 자료형에 영향을 받지 않는다. ex) 5/2=2.5 --%>
                            <%-- <fmt:parseNumber> : 숫자 형태를 지정하여 변수 선언
                                integerOnly="true" : 정수로만 숫자 표현 (소수점 버림)
                                --%>

	         <fmt:parseNumber var="c1" value="${(pInfo.currentPage - 1)/10}" integerOnly="true" />
	         <fmt:parseNumber var="prev" value="${c1 * 10}" integerOnly="true" />
	         <c:set var="prevPage" value="${pageUrl}?cp=${prev}" /> 
					<!-- /board/list/do?cp=10  -->

					<fmt:parseNumber var="c2" value="${(pInfo.currentPage + 9)/10}" integerOnly="true" />
                                <fmt:parseNumber var="next" value="${c2 * 10 + 1}" integerOnly="true" />
                                <c:set var="nextPage" value="${pageUrl}?cp=${next}" />



					<div class="my-5">
						<ul class="pagination pagination-sm justify-content-center">


<%-- 
							<li class="page-item">
								<!-- 첫 페이지로 이동(<<) --> <a class="page-link" href="${firstPage}">&lt;&lt;</a>
							</li>

							<li class="page-item">
								<!-- 이전 페이지로 이동(<) --> <a class="page-link" href="${prevPage}">&lt;</a>
							</li>


							<li class="page-item"><a class="page-link" style="color: orange;">${page}</a></li>

							<li class="page-item"><a class="page-link" href="${pageUrl}?cp=${page}${searchStr}">${page}</a></li>



							<li class="page-item">
								<!-- 다음 페이지로 이동(>) --> <a class="page-link" href="${nextPage}">&gt;</a>
							</li>

							<li class="page-item">
								<!-- 마지막 페이지로 이동(>>) --> <a class="page-link" href="${lastPage}">&gt;&gt;</a>
							</li>
 --%>
 							<%-- 주소 조합 작업 --%>
            <c:url var="pageUrl" value="reportList?"/>

            <!-- 화살표에 들어갈 주소를 변수로 생성 -->
            <c:set var="firstPage" value="${pageUrl}cp=1"/>
            <c:set var="lastPage" value="${pageUrl}cp=${pInfo.maxPage}"/>
            
            <%-- EL을 이용한 숫자 연산의 단점 : 연산이 자료형에 영향을 받지 않는다--%>
            <%-- 
               <fmt:parseNumber>   : 숫자 형태를 지정하여 변수 선언 
               integerOnly="true"  : 정수로만 숫자 표현 (소수점 버림)
            --%>
            
            <fmt:parseNumber var="c1" value="${(pInfo.currentPage - 1) / 10 }"  integerOnly="true" />
            <fmt:parseNumber var="prev" value="${ c1 * 10 }"  integerOnly="true" />
            <c:set var="prevPage" value="${pageUrl}cp=${prev}" />
            
            
            <fmt:parseNumber var="c2" value="${(pInfo.currentPage + 9) / 10 }" integerOnly="true" />
            <fmt:parseNumber var="next" value="${ c2 * 10 + 1 }" integerOnly="true" />
            <c:set var="nextPage" value="${pageUrl}cp=${next}" />
            


            <c:if test="${pInfo.currentPage > pInfo.pageSize}">
               <li> <!-- 첫 페이지로 이동(<<) -->
                  <a class="page-link" href="${firstPage}">&lt;&lt;</a>
               </li>
               
               <li> <!-- 이전 페이지로 이동 (<) -->
                  <a class="page-link" href="${prevPage}">&lt;</a>
               </li>
            </c:if>



            <!-- 페이지 목록 -->
            <c:forEach var="page" begin="${pInfo.startPage}" end="${pInfo.endPage}" >
               <c:choose>
                  <c:when test="${pInfo.currentPage == page }">
                     <li>
                        <a class="page-link">${page}</a>
                     </li>
                  </c:when>
               
                  <c:otherwise>
                     <li>   
                        <a class="page-link" href="${pageUrl}cp=${page}">${page}</a>
                     </li>
                  </c:otherwise>
               </c:choose>
            </c:forEach>
               
      
            <%-- 다음 페이지가 마지막 페이지 이하인 경우 --%>
            <c:if test="${next <= pInfo.maxPage}">
               <li> <!-- 다음 페이지로 이동 (>) -->
                  <a class="page-link" href="${nextPage}">&gt;</a>
               </li>
               
               <li> <!-- 마지막 페이지로 이동(>>) -->
                  <a class="page-link" href="${lastPage}">&gt;&gt;</a>
               </li>
            </c:if>

						</ul>
					</div>


					<div class="col-md-3" style="height: 200px;">


					<%-- 	<c:if test="${!empty loginMember }">
							<span class="btnBtn">
								<button type="button" class="btn btn-warning btn-sm px-2 btnBtn3" onclick="deleteReport()">글 삭제</button>
								<button class="btn btn-warning btn-sm px-2 btnBtn3" onclick="deleteMember()">회원정지</button>
							</span>
						</c:if> --%>

					</div>

				</div>



			</div>
		</div>
		<!--  <div class="col-md-2">
            </div> -->

		<script>
       	function updateStatus(btn, no, status, type){
       		var msg;
       		
       		if(status == 'Y') msg = "복구";
       		else							msg = "삭제";
       		
       		if(confirm(msg + " 하시 겠습니까?")){
       			
       			$.ajax({
       				url : "${contextPath}/manager/updateStatus",
       				data : {"no" : no, "status" : status, "type" : type},
       				success : function(result){
       					var reverseStatus;
       					if(status == 'Y') reverseStatus = 'N';
       					else						reverseStatus = 'Y';
       					
       					
       					console.log(result)
       					if(result > 0){
									var cls = "."+ type + "-" + no;
       						
       						if($(btn).hasClass("btn-danger")){
										
										$(cls).removeClass("btn-danger");
										$(cls).addClass("btn-success");
										$(cls).text("복구");
										
										/* $(btn).removeClass("btn-danger");
										$(btn).addClass("btn-success");
										$(btn).text("복구"); */
										
										
									}else{
										$(cls).removeClass("btn-success");
										$(cls).addClass("btn-danger");
										$(cls).text("삭제");
/* 										$(btn).removeClass("btn-success");
										$(btn).addClass("btn-danger");
										$(btn).text("삭제"); */
									}
									
									$(btn).removeAttr("onclick");
									
									$(btn).attr("onclick", "updateStatus(this, "+ no + ", '"+reverseStatus+"', "+ type + ")")
									
       					}
       					
       					
       				}, error : function(){
       					console.log("상태 변경 실패");
       				}
       				
       				
       				
       				
       			})
       			
       		}
       			
       		
       		
       		
       	}    
                
                
                
                    
             /*        function deleteReport(){
                        var cnt = $("input[name='reportBox']:checked").length;
                        var arr = new Array();
                        $("input[name='reportBox']:checked").each(function() {
                            arr.push($(this).attr('id'));
                        });
                        if(cnt == 0){
                            alert("선택된 글이 없습니다.");
                        }
                        else{
                            $.ajax = {
                                type: "POST",
                                url: "${contextPath}/manager/deleteReport",
                                data: "RPRT_ODR=" + arr + "&CNT=" + cnt,
                                dataType:"json",
                                success: function(jdata){
                                    if(jdata != 1) {
                                        alert("삭제 오류");
                                    }
                                    else{
                                        alert("삭제 성공");
                                    }
                                },
                                error: function(){alert("서버통신 오류");}
                            };
                        }
                    } */

                    

                    $('#selectedReportBox').click(function(){
                    	
                    	if($("input:checkbox[id='selectedReportBox']").prop("checked")){
                    		
                    		$("input[type=checkbox]").prop("checked", true);
                    		
                    	}else{
                    		
                    		$("input[type=checkbox]").prop("checked", false);
                    		
                    	}
                    	
                    	
                    });
                    
                    
                    
                	function deleteMember() {
                		
            			if(confirm("정말로 삭제하시겠습니까?")){
            				
            				location.href= "deleteMember?memberNo=${member.memberNo}";
            				
            			}
            		}
                    
    
                    


                    
                    
                    

                </script>

	</div>
	</div>


</body>
</html>