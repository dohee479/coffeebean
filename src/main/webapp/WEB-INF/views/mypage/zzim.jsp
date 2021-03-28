<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<%@ include file="/WEB-INF/views/layout/sidebar.jsp" %>

    <div>
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
              <div class="cart_img"><img src="<%=application.getContextPath()%>/resources/images/mypage/zzim/cart.png"></div>
              <span class="message1">상품이 장바구니에 담겼습니다.</span>
              <span class="message2">바로 확인하시겠습니까?</span>
              
              <div class="button-group">
                <button class="cancel" data-dismiss="modal" aria-label="Close">취소</button>
                <button class="gocart" onclick="location.href='<%=application.getContextPath() %>/mypage/basket'">확인</button>
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
            <div class="erase_img"><img src="<%=application.getContextPath()%>/resources/images/mypage/zzim/erase.png"></div>
            <span class="message1">상품이 리스트에서 삭제되었습니다.</span>
            
            <div class="button-group">
              <button class="erase" data-dismiss="modal" aria-label="Close">확인</button>
            </div>

          </div>
        </div>
      </div>
    </div>

</div>

<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
</body>