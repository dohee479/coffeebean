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
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<body>
 <header id="nav-header">
    <div class="logo"><a href="/kong"><img src="${pageContext.request.contextPath}/resources/images/header/logo.png"></a></div>
    <nav>
      <ul>
        <li>
          <a class="country" href="<%=application.getContextPath()%>/product/country?c=????????????">??????</a>
          <div class="hidden-menu">
            <a href="<%=application.getContextPath()%>/product/country?c=????????????">????????????</a>
            <a href="<%=application.getContextPath()%>/product/country?c=?????????">?????????</a>
            <a href="<%=application.getContextPath()%>/product/country?c=???????????????">???????????????</a>
            <a href="<%=application.getContextPath()%>/product/country?c=??????">??????</a>
            <a href="<%=application.getContextPath()%>/product/country?c=????????????">????????????</a>
          </div>
        </li>
        <li>
          <a class="taste" href="<%=application.getContextPath()%>/product/flavor?f=???????????????">???/???</a>
          <div class="hidden-menu">
            <a href="<%=application.getContextPath()%>/product/flavor?f=???????????????">???????????????</a>
            <a href="<%=application.getContextPath()%>/product/flavor?f=?????????/?????????">?????????</a>
            <a href="<%=application.getContextPath()%>/product/flavor?f=???????????? ????????? ??????">???????????? ????????? ??????</a>
            <a href="<%=application.getContextPath()%>/product/flavor?f=???????????? ?????????">???????????? ?????????</a>
            <a href="<%=application.getContextPath()%>/product/flavor?f=????????? ????????? ???">????????? ??????</a>
          </div>
        </li>
      </ul>
    </nav>
    <div class="story">
      <a href="${pageContext.request.contextPath}/story">???????????????</a>
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
      
      <div class="user-item"><a href="<%=application.getContextPath()%>/mypage/orderlist">MyPage</a></div>
      <div class="user-item"><a href="<%=application.getContextPath()%>/mypage/basket"><img src="${pageContext.request.contextPath}/resources/images/header/shopping-cart.png" style="height:24px"></a></div>
      <div class="user-item"><img class="loupe" src="${pageContext.request.contextPath}/resources/images/header/loupe.png"></div>
    </div>
  </header>
  <div class="search-modal">
    <div class="close">X</div>
    <div>
      <form action="${pageContext.request.contextPath}/product/search">
        <input type="text" placeholder="???????????? ???????????????" name="keyword" autocomplete="off"/>
        <button type="submit"><img class="loupe" src="${pageContext.request.contextPath}/resources/images/header/search.png"></button>
      </form>
    </div>
  </div>
  <script src="${pageContext.request.contextPath}/resources/js/layout/header.js"></script>