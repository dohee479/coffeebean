<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/bootstrap-4.6.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/reset/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout/header.css">
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/layout/sidebar.css">
	
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/user/sign_in_up.css">
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/user/id_pwd_find.css">
	
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/mypage/orderlist/orderlist.css">
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/mypage/zzim/zzim.css">
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/mypage/refund/refund.css">
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/product/detail/detail.css">
	<script src="<%=application.getContextPath() %>/resources/js/jquery-3.5.1.min.js"></script>
	<script src="<%=application.getContextPath() %>/resources/bootstrap-4.6.0/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap-4.6.0/js/bootstrap.min.js"></script>
</head>
<body>
 <header>
    <div class="logo"><img src="${pageContext.request.contextPath}/resources/images/header/logo.png"></div>
    <nav>
      <ul>
        <li>
          <a class="country" href="../itemlist/countryitem.html">나라</a>
          <div class="hidden-menu">
            <a href="../itemlist/countryitem.html">케냐</a>
            <a href="../itemlist/countryitem.html">에티오피아</a>
            <a href="../itemlist/countryitem.html">브라질</a>
            <a href="../itemlist/countryitem.html">예멘</a>
            <a href="../itemlist/countryitem.html">베트남</a>
          </div>
        </li>
        <li>
          <a class="taste" href="../itemlist/flavoritem.html">맛/향</a>
          <div class="hidden-menu">
            <a href="../itemlist/flavoritem.html">달콤쌉싸름</a>
            <a href="../itemlist/flavoritem.html">고소함</a>
            <a href="../itemlist/flavoritem.html">묵직하고 달콤한 여운</a>
            <a href="../itemlist/flavoritem.html">은은하고 편안함</a>
            <a href="../itemlist/flavoritem.html">상큼한 산미</a>
          </div>
        </li>
      </ul>
    </nav>
    <div class="story">
      <a href="#">원두이야기</a>
    </div>
    <div class="user-menu">
      <div class="user-item"><a href="#">로그아웃</a></div>
      <div class="user-item"><a href="<%=application.getContextPath()%>/mypage/orderlist">마이페이지</a></div>
      <div class="user-item"><a href="#"><img src="${pageContext.request.contextPath}/resources/images/header/shopping-cart.png" style="height:24px"></a></div>
      <div class="user-item"><img class="loupe" src="${pageContext.request.contextPath}/resources/images/header/loupe.png"></div>
    </div>
  </header>
  <div class="search-modal">
    <div class="close">X</div>
    <div>
      <input type="text" placeholder="검색어를 입력하세요">
      <span><img src="${pageContext.request.contextPath}/resources/images/header/search.png"></span>
    </div>
  </div>
  <script src="${pageContext.request.contextPath}/resources/js/layout/header.js"></script>