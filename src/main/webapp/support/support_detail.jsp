<%@page import="vo.support.SupportDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%
	// dto 객체 어트리뷰트로 받기
	SupportDTO dto = (SupportDTO)request.getAttribute("dto");
	String sId = (String)session.getAttribute("sId");

	%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/support.css" rel="stylesheet">
<style type="text/css">
/* 위로 올라가기 버튼 */
body {
	font: .88em/150% Arial, Helvetica, sans-serif;
	margin: 30px auto;
}
h1 {
	font: bold 80%/120% Arial, Helvetica, sans-serif;
	text-transform: uppercase;
	margin: 0 0 10px;
	color: #999;
}
h2 {
	font-size: 2.5em;
	margin: 0 0 8px;
}
h3 {
	font-size: 1.6em;
	margin: 20px 0 5px;
}
a {
	color: #69C;
	text-decoration: none;
}
a:hover {
	color: #F30;
}
p {
	margin: 0 0 10px;
}
.credits {
	border-bottom: solid 1px #eee;
	padding-bottom: 10px;
	margin: 0 0 30px;
}
#pagewrap {
	margin: 0 auto;
	width: 600px;
	padding-left: 150px;
	position: relative;
}

/*
Back to top button 
*/
#back-top {
	position: fixed;
	bottom: 30px;
	margin-left: -150px;
}
#back-top a {
	width: 108px;
	display: block;
	margin-left:1200px;
	text-align: center;
	font: 11px/100% Arial, Helvetica, sans-serif;
	text-transform: uppercase;
	text-decoration: none;
	color: #bbb;
	/* background color transition */
	-webkit-transition: 1s;
	-moz-transition: 1s;
	transition: 1s;
}
#back-top a:hover {
	color: #000;
}
/* arrow icon (span tag) */
#back-top span {
	width: 108px;
	height: 108px;
	display: block;
	margin-bottom: 7px;
	background: #ddd url(up-arrow.png) no-repeat center center;
	/* rounded corners */
	-webkit-border-radius: 15px;
	-moz-border-radius: 15px;
	border-radius: 15px;
	/* background color transition */
	-webkit-transition: 1s;
	-moz-transition: 1s;
	transition: 1s;
}
#back-top a:hover span {
	background-color: #777;
}
</style>

<script src="js/jquery-3.6.0.js"></script>
	<script type="text/javascript">
		
	
		//제이쿼리
		$(function() {
			
			
		// D-Day 구하기 -----------------------------------------------------------------------------
	    	  
	         //오늘 날짜
	         var today = new Date();
	         
	         //골 날짜
	         var goalDate = $(".goalDate").html();
	         var dday = new Date(goalDate)
	         
	         //디데이 계산
	         var gap = dday.getTime() - today.getTime();
	         var result = Math.ceil(gap / (1000 * 60 * 60 * 24));
	         
	         var day =  1 / result * 100
	        

			
		// 후원금 구하기 -----------------------------------------------------------------------------
	
						    	  
	         //모인 후원금
	         var money = $(".money").html();
			
			 //골 프라이스(전체값)
	         var goalPrice = $(".goalPrice").html();
			
			 //일부값
	         var moneyPer = Number(goalPrice) / Number(money) * 100;;
	        	 
			 if(moneyPer == "Infinity"){
				 moneyPer = 0;
			 }
	        
			
		// 후원금 프로그레스 바 -----------------------------------------------------------------------------
	
		
		         //프로그레스 바 전체
	         $(".progressBar").css({
		           width: "100%",
		           height: "5px",
		           background: "grey"
		         });
	         
		         //프로그레스 바 진행도
	         $(".myBar").css({
		           width: moneyPer+"%",
		           height: "5px",
		           background: "skyblue"
		         });
			
		     //프로그레스 바 진행도 퍼센트
	         $(".moneyPer").html(Math.round(moneyPer)+"%");
	        
		     //디데이
		     $(".dDay").html("D-"+result);
	     
		
		// 후원 버튼 -----------------------------------------------------------------------------

			
			//후원 버튼
			$("#giveMoney").on("click", function() {
				var sId = '<%=sId%>'
				if(sId == 'null') {
					alert("로그인 이후 사용해 주세요!");
					window.open("MemberLoginForm.me?returnUrl=SupportList.su");
// 				// 회원만 작성하게 만드세요
				} else if(sId != 'null'){ 
					window.open("GiveMoneyForm.su?idx="+<%=dto.getSup_idx() %>, "giveMoney", "width=1000,height=310");
				}
			});

		});
			
			// back to top 버튼 -----------------------------------------------------------------------------
			$(document).ready(function(){
	
				// 사용하지 않을 때 숨김처리
				$("#back-top").hide();
				
				// 사라지기 효과
				$(function () {
					$(window).scroll(function () {
						if ($(this).scrollTop() > 100) {
							$('#back-top').fadeIn();
						} else {
							$('#back-top').fadeOut();
						}
					});
	
					// scroll body to 0px on click
					$('#back-top a').click(function () {
						$('body,html').animate({
							scrollTop: 0
						}, 800);
						return false;
					});
				});
	
			});
</script>
		
		


</head>
<body id="top">


   <!-- 해더 -->
   <jsp:include page="../hf/header.jsp"></jsp:include>
   <!-- 해더 -->
   
   
   
	<!-- 디테일 메인 블럭 -->
   <div class="main">


	 <hr style="color: gray; opacity: 70%; margin: 50px;">
	
	
		<!-- 썸네일 -->
		<img id="sup_thumbnai" alt="" src="./img/support/<%=dto.getSup_thumbnail_file() %>" width="70%">

			
			
			
		<!-- 섬네일 옆	 -->
		<div id="content">
			<table >
			
				<!-- 후원 제목 -->
				<tr>
					<td class="sup_subject"><%=dto.getSup_subject() %></td>
				</tr>
				
				
				
				<!-- D-Day -->
				<tr>
					<td id="dDay"><span class="dDay"></span></td>
				</tr>
				
				
				
				<!-- 목표 금액 -->
				<tr>
					<td id="goalPrice">
						<span class="goalPrice" ><%=dto.getSup_goal_price() %></span>
		                <span >원(목표금액)</span>
					</td>
				</tr>
				
				
				<!-- 퍼센트 바 -->
	            <tr id="progressBar">
	               <td>
	                  <div class="progressBar"></div>
	                  <div class="myBar"></div>
	                  
	                  <!-- 현제 모인 금액 -->
	                  <span class="money"><%=dto.getSup_money() %></span>원
	                  <span >(현재 모인 금액)</span>
	                  
	                  <!-- 현제 모인 금액 -->
	                  <span style="text-align: left;" class="moneyPer"></span>
	                  <span >(진행률)</span>
	               </td>
	            </tr>
				
				
				
				<!-- idx, date, readcount 안보이게 -->
				<tr style="display: none;">
					<td class="goalDate"><%=dto.getSup_goal_date() %></td>
					<td><%=dto.getSup_date() %></td>
					<td><%=dto.getSup_idx() %></td>
					<td><%=dto.getSup_readcount() %></td>
				</tr>
				
			</table>
			
			
			
			<!-- 후원 버튼 -->			
		 	<button class="w-btn-outline w-btn-green-outline"  id="giveMoney"  type="button" >후원</button>
		
		</div>
		
		
		
		
			<!-- 내용 -->
			<div class="content"><%=dto.getSup_content() %></div>
		
			<!-- 상세 페이지 -->		
			<img id="sup_original" alt="" src="./img/support/<%=dto.getSup_original_file() %>" width="70%">
			
		
		
		
		
	
	   <%if(sId == null){%>
      <section id="List">
      <button class="w-btn w-btn-gra2 w-btn-gra-anim" type="button" onclick="location.href='SupportList.su<%--?sup_idx=<%=dto.getSup_idx() %> &pageNum=${param.pageNum}  --%>'">목록</button>   
      </section>

      <%}else if(sId.equals("admin")){%>
            <button class="w-btn w-btn-gra2 w-btn-gra-anim"  type="button" onclick="location.href='SupportModifyAdmin.su?sup_idx=${dto.sup_idx }&pageNum=${param.pageNum}'">수정</button>
            <button class="w-btn w-btn-gra2 w-btn-gra-anim" onclick="location.href='SupportDeleteFormAdmin.su?sup_idx=${dto.sup_idx}&pageNum=${param.pageNum}'">삭제</button>
            <button class="w-btn w-btn-gra2 w-btn-gra-anim" type="button" onclick="location.href='SupportList.su<%--?sup_idx=<%=dto.getSup_idx() %> &pageNum=${param.pageNum}  --%>'">목록</button>
         <%}else{ %>
  
      <button class="w-btn w-btn-gra2 w-btn-gra-anim" type="button" onclick="location.href='SupportList.su<%--?sup_idx=<%=dto.getSup_idx() %> &pageNum=${param.pageNum}  --%>'">목록</button>   
 
      
      <%}%>   
	</div>
	
<!-- 	위로 스크롤 올리기 버튼  -->
	<div id="pagewrap">
	<p id="back-top">
		<a href="#top"><span></span>Back to Top</a>
	</p>
	</div>
	
	<!-- 푸터 -->
   <jsp:include page="../hf/footer.jsp"></jsp:include>
   <!-- 푸터 -->
	
</body>
</html>