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
            <a href="product/flavor?f=고소함">고소함</a>
            <a href="product/flavor?f=묵직하고 달콤한 여운">묵직하고 달콤한 여운</a>
            <a href="product/flavor?f=은은하고 편안함">은은하고 편안함</a>
            <a href="product/flavor?f=상큼한 산미">상큼한 산미</a>
          </div>
        </li>
      </ul>
    </nav>
    <div class="story">
      <a href="story">원두이야기</a>
    </div>
    <div class="user-menu">
      <div class="user-item"><a href="${pageContext.request.contextPath}/user/login">로그인</a></div>
      <div class="user-item"><a href="${pageContext.request.contextPath}/mypage/orderlist">마이페이지</a></div>
      <div class="user-item"><a href="${pageContext.request.contextPath}/mypage/basket"><img src="${pageContext.request.contextPath}/resources/images/header/cart.png" style="height:24px"></a></div>
      <div class="user-item"><img class="loupe" src="${pageContext.request.contextPath}/resources/images/header/search.png"></div>
    </div>
  </header>
  <div class="search-modal">
    <div class="close">X</div>
    <div>
      <input type="text" placeholder="검색어를 입력하세요">
      <span><a href="${pageContext.request.contextPath}/search"><img class="loupe" src="${pageContext.request.contextPath}/resources/images/header/search.png"></a></span>
    </div>
  </div> 
  <script src="${pageContext.request.contextPath}/resources/js/layout/header.js"></script>