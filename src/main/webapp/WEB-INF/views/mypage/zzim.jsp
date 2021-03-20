<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  
  <link rel="stylesheet" href="../css/sidebar.css">
  <link rel="stylesheet" href="../navbar/nav2.css">
  <link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/reset/reset.css">
  <link rel="stylesheet" href="searchlist.css">
  <link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/mypage/zzim/zzim.css">
  <link rel="stylesheet" type="text/css" href="order.css">
   		<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/bootstrap-4.6.0/css/bootstrap.min.css">
		<script src="<%=application.getContextPath()%>/resources/js/jquery-3.5.1.min.js"></script>
		<script src="<%=application.getContextPath()%>/resources/bootstrap-4.6.0/js/bootstrap.bundle.min.js"></script>
		<script src="<%=application.getContextPath()%>/resources/bootstrap-4.6.0/js/bootstrap.min.js"></script>
    <script src="order.js"></script>
</head>
<body>
  <header class="d-flex">
    <div class="logo"><img src="../common/images/navbar/logo.png"></div>
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
      <div class="user-item"><a href="../mypage/order.html">마이페이지</a></div>
      <div class="user-item"><a href="#"><img src="../common/images/navbar/shopping-cart.png" style="height:24px"></a></div>
      <div class="user-item"><a href="../search/searchlist.html"><img src="../common/images/navbar/loupe.png"></a></div>
    </div>
  </header>

  <div class="center">
    <div class="sidebar">
            <h2>마이페이지</h2>
            <div class="side_content">
                <ul>
                    <li>쇼핑 정보
                        <ul>
                            <li onclick=location.href='../mypage/order.html'>- 주문목록/배송조회</li>
                            <li onclick=location.href='../refund/refund.html'>- 취소/환불내역</li>
                            <li onclick=location.href='../zzim/zzim.html'>- 찜리스트</li>
                        </ul>
                    </li>
            
                    <li>고객 센터
                        <ul>
                            <li onclick=location.href='my-qna.thml'>- 1:1 문의</li>
                        </ul>
                    </li>
                    
                    <li>회원정보
                        <ul>
                            <li onclick=location.href='../mypage/change-info.html'>- 회원정보 변경</li>
                            <li onclick=location.href='#'>- 회원탈퇴</li>
                        </ul>
                    </li>
            
                    <li>나의 상품후기
                        <ul>
                            <li onclick=location.href='../mypage/my-review.html'>- 나의 상품후기</li>
                        </ul>
                    </li>
                </ul>
            </div>
    </div>

    <div >
        <div class="pick_list">
            <span>찜리스트</span>
            <div class="table">
                <table>
                    <thead>
                        <tr class="attribute">
                            <th class="checkbox"><input type="checkbox"></th>
                            <th class="title">상품명/옵션</th>
                            <th class="price">상품금액/수량</th>
                            <th class="total">구매</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="items">
                            <td class="checkbox"><input type="checkbox"></td>
                            <td class="item_wrap">
                                <div class="item_img"><img class="item_img" src="<%=application.getContextPath()%>/resources/images/mypage/zzim/item_img.jpg"></div>
                                <div class="item_title"><span>[뉴크롭] 케냐 AA 키암부</span></div>
                            </td>
                            <td class="price">
                                <span class="price">5800</span>원/
                                <span class="count">1</span>개
                            </td>
                            <td class="act">
                                <button class="cart" data-toggle="modal" data-target="#cart">장바구니</button><br>
                                <button class="del" data-toggle="modal" data-target="#erase">삭제하기</button>
                            </td>
                        </tr>
                        <tr class="items">
                            <td class="checkbox"><input type="checkbox"></td>
                            <td class="item_wrap">
                                <div class="item_img"><img class="item_img" src="<%=application.getContextPath()%>/resources/images/mypage/zzim/item_img2.jpg"></div>
                                <div class="item_title"><span>스타블렌드</span></div>
                            </td>
                            <td class="price">
                                <span class="price">2500</span>원/
                                <span class="count">1</span>개
                            </td>
                            <td class="act">
                                <button class="cart" data-toggle="modal" data-target="#cart">장바구니</button><br>
                                <button class="del" data-toggle="modal" data-target="#erase">삭제하기</button>
                            </td>
                        </tr>
                    </tbody>  
                </table>
            </div>
            <div class="bottom_button">
                <button type="button" data-toggle="modal" data-target="#erase">선택 상품 삭제</button>
                <button type="button" data-toggle="modal" data-target="#cart">선택 상품 장바구니</button>
            </div>
        </div>
    </div>

      <!-- 장바구니 모달 시작-->
      <div class="modal fade" id="cart" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <span class="modal-title" id="exampleModalLabel">장바구니 담기</span>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <div class="cart_img"><img src="/kong/resources/images/mypage/zzim/cart.png"></div>
              <span class="message1">상품이 장바구니에 담겼습니다.</span>
              <span class="message2">바로 확인하시겠습니까?</span>
              
              <div class="button-group">
                <button class="cancel" data-dismiss="modal" aria-label="Close">취소</button>
                <button class="gocart">확인</button>
              </div>
  
            </div>
          </div>
        </div>
      </div>
      <!-- 삭제하기 모달 -->
    <div class="modal fade" id="erase" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <span class="modal-title" id="exampleModalLabel">찜리스트 삭제</span>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <div class="erase_img"><img src="/kong/resources/images/mypage/zzim/erase.png"></div>
            <span class="message1">상품이 리스트에서 삭제되었습니다.</span>
            
            <div class="button-group">
              <button class="erase" data-dismiss="modal" aria-label="Close">확인</button>
            </div>

          </div>
        </div>
      </div>
    </div>

</div>

  <script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
  <script src="../navbar/nav.js"></script>
</body>
</html>