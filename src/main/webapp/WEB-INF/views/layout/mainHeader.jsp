<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/reset/reset.css">
	<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/layout/mainheader.css">
	<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/main/main.css">			
	<script src="<%=application.getContextPath() %>/resources/js/jquery-3.5.1.min.js"></script>
	<script src="<%=application.getContextPath() %>/resources/bootstrap-4.6.0/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap-4.6.0/js/bootstrap.min.js"></script>
</head>
<body>
  <header>
    <div class="logo"><a href="/kong"><img src="${pageContext.request.contextPath}/resources/images/header/logo.png"></a></div>
    <nav>
      <ul>
        <li>
          <a class="country" href="product/country?c=과테말라">나라</a>
          <div class="hidden-menu">
            <a href="product/country?c=과테말라">과테말라</a>
            <a href="product/country?c=브라질">브라질</a>
            <a href="product/country?c=에티오피아">에티오피아</a>
            <a href="product/country?c=케냐">케냐</a>
            <a href="product/country?c=콜롬비아">콜롬비아</a>
          </div>
        </li>
        <li>
          <a class="taste" href="product/flavor?f=달콤쌉싸름">맛/향</a>
          <div class="hidden-menu">
            <a href="product/flavor?f=달콤쌉싸름">달콤쌉싸름</a>
            <a href="product/flavor?f=고소함/구수함">고소함/구수함</a>
            <a href="product/flavor?f=묵직하고 달콤한 여운">묵직하고 달콤한 여운</a>
            <a href="product/flavor?f=은은하고 편안함">은은하고 편안함</a>
            <a href="product/flavor?f=상큼한 산미와 향">상큼한 산미와 향</a>
          </div>
        </li>
      </ul>
    </nav>
    <div class="story">
      <a href="story">원두이야기</a>
    </div>
    <div class="user-menu">
      <sec:authorize access="isAnonymous()">
    		<div class="user-item"><a href="<%=application.getContextPath()%>/user/login">LogIn</a></div>
   	  </sec:authorize>
   	  <sec:authorize access="isAuthenticated()">
        <form method="post" class="user-item" action="${pageContext.request.contextPath}/logout">
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" class="user-item"/>
          <input type="submit" value="LogOut"/>
        </form>
      </sec:authorize>
      <div class="user-item"><a href="${pageContext.request.contextPath}/mypage/orderlist">MyPage</a></div>
      <div class="user-item"><a href="${pageContext.request.contextPath}/mypage/basket"><img src="${pageContext.request.contextPath}/resources/images/header/cart.png" style="height:24px"></a></div>
      <div class="user-item"><img class="loupe" src="${pageContext.request.contextPath}/resources/images/header/search.png"></div>
    </div>
  </header>
  <div class="search-modal">
    <div class="close">X</div>
    <div>
      <form action="${pageContext.request.contextPath}/product/search">
        <input type="text" placeholder="상품명을 입력하세요" name="keyword" autocomplete="off"/>
        <button type="submit"><img class="loupe" src="${pageContext.request.contextPath}/resources/images/header/search.png"></button>
      </form>
    </div>
  </div> 
  <script src="${pageContext.request.contextPath}/resources/js/layout/header.js"></script>