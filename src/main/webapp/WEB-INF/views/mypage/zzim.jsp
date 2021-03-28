<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<%@ include file="/WEB-INF/views/layout/sidebar.jsp" %>

<script src="<%=application.getContextPath() %>/resources/js/mypage/zzim/zzim.js"></script>

    <div>
        <div class="pick_list">
            <span>찜리스트</span>
            <div class="table">
                <table>
                    <thead>
                        <tr class="attribute">
                           <!--  <th class="checkbox"><input type="checkbox"></th> -->
                            <th class="title">상품명/옵션</th>
                            <th class="price">기본 상품금액</th>
                            <th class="total">구매</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="items">
                            <!-- <td class="checkbox"><input type="checkbox"></td> -->
                            <td class="item_wrap">
                                <div class="item_img"><img class="item_img" src="<%=application.getContextPath()%>/resources/images/mypage/zzim/item_img.jpg"></div>
                                <div class="item_title"><span>[뉴크롭] 케냐 AA 키암부</span></div>
                            </td>
                            <td class="price">
                                <span class="price">5800</span>원
                                <!-- <span class="count">1</span>개 -->
                            </td>
                            <td class="act">
                                <button class="cart" data-toggle="modal" data-target="#cart">장바구니</button><br>
                                <button class="del" data-toggle="modal" data-target="#erase">삭제하기</button>
                            </td>
                        </tr>
                        <tr class="items">
                           <!--  <td class="checkbox"><input type="checkbox"></td> -->
                            <td class="item_wrap">
                                <div class="item_img"><img class="item_img" src="<%=application.getContextPath()%>/resources/images/mypage/zzim/item_img2.jpg"></div>
                                <div class="item_title"><span>스타블렌드</span></div>
                            </td>
                            <td class="price">
                                <span class="price">2500</span>원
                                <!-- <span class="count">1</span>개 -->
                            </td>
                            <td class="act">
                                <button class="cart" data-toggle="modal" data-target="#cart">장바구니</button><br>
                                <button class="del" data-toggle="modal" data-target="#erase">삭제하기</button>
                            </td>
                        </tr>
                    </tbody>  
                </table>
            </div>
         <!--    <div class="bottom_button">
                <button type="button" data-toggle="modal" data-target="#erase">선택 상품 삭제</button>
                <button type="button" data-toggle="modal" data-target="#cart">선택 상품 장바구니</button>
            </div> -->
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
              <span class="message1">상품을 장바구니에 추가합니다.</span>
              <span class="message2"></span>
              <form method="">
              <div class=select_option>
                  <dl class="option">             
                      <dd>
                          <select id = "volume" name="volume" class="custom-select" style="width: 15em; margin: 0px;">
                              <option selected value="0">용량을 선택하세요.</option>
                              <option value="200">200g</option>
                              <option value="500">500g</option>
                              <option value="1000">1000g</option>
                          </select>
                      </dd>              
                      <dd>
                          <select id = "mesh" name="mesh" class="custom-select" style="width: 15em; margin: 5px 0 10px 0;">
                              <option selected value="0" >분쇄유형을 선택하세요.</option>
                              <option value="1">홀빈(분쇄안함)</option>
                              <option value="2">프렌치프레스 분쇄</option>
                              <option value="3">핸드드립 분쇄</option>
                              <option value="4">더치용 분쇄</option>
                          </select>
                      </dd>
                      <dd>
                      <div class="count_box">
		                  <div class="minus">-</div>
		                    <input type="text" class="count_value" value=1 readonly/>
		                  <div class="plus">+</div>
		              </div>
		              </dd>
                  </dl>
              </div>
              <div class="button-group">
                <button class="cancel" data-dismiss="modal" aria-label="Close">취소</button>
                <button type="submit" class="gocart" <%-- onclick="location.href='<%=application.getContextPath() %>/mypage/basket'" --%>>확인</button>
              </div>
             </form>  
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