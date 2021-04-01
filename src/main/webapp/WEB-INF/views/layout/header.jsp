<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
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
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/layout/footer.css">
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/user/sign_in_up.css">
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/user/id_pwd_find.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout/sidebar.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/order/fill_out_order.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/order/order_complete.css">
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/mypage/delete-account/delete-account.css">
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/mypage/my-qna/my-qna.css">
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/mypage/my-review/my-review.css">
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/mypage/change-info/change-info.css">
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/mypage/orderlist/orderlist.css">
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/mypage/zzim/zzim.css">
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/mypage/basket/basket.css">
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/mypage/refund/refund.css">
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/product/detail/detail.css">
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/product/itemlist/item.css">
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/story/story.css">
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/search/searchlist.css">
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
          <a class="country" href="<%=application.getContextPath()%>/product/country?c=과테말라">나라</a>
          <div class="hidden-menu">
            <a href="<%=application.getContextPath()%>/product/country?c=과테말라">과테말라</a>
            <a href="<%=application.getContextPath()%>/product/country?c=브라질">브라질</a>
            <a href="<%=application.getContextPath()%>/product/country?c=에티오피아">에티오피아</a>
            <a href="<%=application.getContextPath()%>/product/country?c=케냐">케냐</a>
            <a href="<%=application.getContextPath()%>/product/country?c=콜롬비아">콜롬비아</a>
          </div>
        </li>
        <li>
          <a class="taste" href="<%=application.getContextPath()%>/product/flavor?f=달콤쌉싸름">맛/향</a>
          <div class="hidden-menu">
            <a href="<%=application.getContextPath()%>/product/flavor?f=달콤쌉싸름">달콤쌉싸름</a>
            <a href="<%=application.getContextPath()%>/product/flavor?f=고소함">고소함</a>
            <a href="<%=application.getContextPath()%>/product/flavor?f=묵직하고 달콤한 여운">묵직하고 달콤한 여운</a>
            <a href="<%=application.getContextPath()%>/product/flavor?f=은은하고 편안함">은은하고 편안함</a>
            <a href="<%=application.getContextPath()%>/product/flavor?f=상큼한 산미">상큼한 산미</a>
          </div>
        </li>
      </ul>
    </nav>
    <div class="story">
      <a href="${pageContext.request.contextPath}/story">원두이야기</a>
    </div>
    <div class="user-menu">
    	<sec:authorize access="isAnonymous()">
    		<div class="user-item"><a href="<%=application.getContextPath()%>/user/login">로그인</a></div>
    	</sec:authorize>
      	<sec:authorize access="isAuthenticated()">
               <span class="text-dark">User: <sec:authentication property="name"/> </span>
               <form method="post" class="user-item" action="${pageContext.request.contextPath}/logout">
	               	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" class="user-item"/>
	                <button type="submit">로그아웃</button>
               </form>
                 
          </sec:authorize>
      
      
      <div class="user-item"><a href="<%=application.getContextPath()%>/mypage/orderlist">마이페이지</a></div>
      <div class="user-item"><a href="<%=application.getContextPath()%>/mypage/basket"><img src="${pageContext.request.contextPath}/resources/images/header/shopping-cart.png" style="height:24px"></a></div>
      <div class="user-item"><img class="loupe" src="${pageContext.request.contextPath}/resources/images/header/loupe.png"></div>
    </div>
  </header>
  <div class="search-modal">
    <div class="close">X</div>
    <div>
      <input type="text" placeholder="검색어를 입력하세요">
      <span><a href="${pageContext.request.contextPath}/search"><img src="${pageContext.request.contextPath}/resources/images/header/search.png"></a></span>
    </div>
  </div>
  <script src="${pageContext.request.contextPath}/resources/js/layout/header.js"></script>