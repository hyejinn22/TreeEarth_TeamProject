<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link href="css/index.css" rel="stylesheet">
</head>
<body>
	<header id="header">
		<a href="./"><img src="img/main/logo_treeEarth.png" alt="트리어스" width="220"></a>
		<c:choose>
			<c:when test="${empty sessionScope.sId}">
				<a href="MemberLoginForm.me" class="login" style="cursor:pointer">로그인</a>
			</c:when>
			<c:otherwise>
					<c:choose>
						<c:when test="${sessionScope.sId eq 'admin'}">
							<a href="store/admin_page.jsp">${sessionScope.sId } 님</a>
						</c:when>
						<c:otherwise>
						    <a href="Cart.my" class="cart" style="cursor:pointer">장바구니</a>
						<div class="dropdown">
							<a class="dropbtn">${sessionScope.sId } 님</a>
							<div class="dropdown-content">
								<ul class="inline">
									<li><a href="">적립금</a></li>
					                <li><a href="">이름</a></li>
					                <li><a href="Wishlist.my">위시리스트</a></li>
					                <li><a href="">회원정보수정</a></li>
					                <li><a href="">후원금 내역 조회</a></li>
					                <li><a href="">신청 캠페인 조회</a></li>
					                <li><a href="">작성한 글</a></li>
					                <li><a href="">작성한 댓글</a></li>
					            </ul>
							</div>
						</div>
						</c:otherwise>
					</c:choose>
				<a href="MemberLogout.me">로그아웃</a>
			</c:otherwise>
		</c:choose>
		
      	<nav style="cursor:pointer">
            <div class="dropdown">
                <a class="dropbtn_box">캠페인</a>
                <div class="dropdown-content">
                <ul class="inline">
                    <li><a href="CampaignRecruList.cp">모집 캠페인</a></li>
                    <li><a href="CampaignExpiredList.cp">종료 캠페인</a></li>
                    <li><a href="">캠페인 아이디어 공모</a></li>
                </ul>
                </div>
            </div>
            <div class="dropdown">
                <a class="dropbtn_box">후원</a>
                <div class="dropdown-content">
                <ul class="inline">
                    <li><a href="SupportListAction.su">후원하기</a></li>
                </ul>
                </div>
            </div>
            <div class="dropdown">
              	<a class="dropbtn_box">스토어</a> 
                <div class="dropdown-content">
                <ul class="inline">
                    <li><a href="">반려나무</a></li>
                    <li><a href="StoreItemImg.st">식물</a></li>
                    <li><a href="">부자재</a></li>
                </ul>
                </div>
            </div>
            <div class="dropdown">
                <a class="dropbtn_box">커뮤니티</a>
                <div class="dropdown-content">
                <ul class="inline">
                    <li><a href="CampaignReviewList.cm">캠페인 후기</a></li>
                    <li><a href="">반려나무 성장일기</a></li>
                    <li><a href="">Q&A</a></li>
                    <li><a href="">공지사항</a></li>
                    <li><a href="">자유게시판</a></li>
                </ul>
                </div>
            </div>
       	 </nav>
	</header>
	<section>
		<img src="img/main/tree_img01.jpg" alt="울창한 나무사진" border="0" style="max-width:100%;height:auto;">
	</section>	
</body>
</html>