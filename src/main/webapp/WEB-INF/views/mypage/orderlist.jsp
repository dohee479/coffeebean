<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<%@ include file="/WEB-INF/views/layout/sidebar.jsp" %>
    <div>
           	<div class="order_list">
                <span>주문목록/배송조회</span>
                <div class="table">
                    <table>
                        <thead>
                            <tr class="attribute">
                                <td class="order_no">주문번호</td>
                                <td class="title">상품명/옵션</td>
                                <td class="price">상품금액/수량</td>
                                <td class="state">주문상태</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="items">
                                <td rowspan="2" class="order_no">  <!-- 한주문에 몇개의 상품이 들어있는지 알아아 햠 -->
                                    2021000001
                                </td>   
                                <td class="item_wrap">
                                    <div class="item_img"><img class="item_img" src="<%=application.getContextPath()%>/resources/images/mypage/orderlist/item_img.jpg"></div>
                                    <div class="item_title"><span>[뉴크롭] 케냐 AA 키암부</span><span><strong>/200g,홀빈</strong></span></div>
                                </td>
                                <td class="price">
                                    <span class="price">5800</span>원/
                                    <span class="count">1</span>개
                                </td>
                                <td rowspan="2" class="state">
	                               <span>배송완료</span>
	                               <button type="button" class="delivery_tracking" data-toggle="modal" data-target="#tracking">배송조회</button>
	                               <button type="button" class="confirmation" data-toggle="modal" data-target="#confirmation">구매확정</button><br>
	                               <span class="refund" data-toggle="modal" data-target="#refund">환불하기</span>
	                           </td>
                           </tr>
                           <tr class="items">
                                <td class="item_wrap">
                                    <div class="item_img"><img class="item_img" src="<%=application.getContextPath()%>/resources/images/mypage/orderlist/item_img2.jpg"></div>
                                    <div class="item_title"><span>스타블렌드</span><span><strong>/200g,홀빈</strong></span></div>
                                    
                                </td>
                                <td class="price">
                                    <span class="price">2500</span>원/
                                    <span class="count">1</span>개
                                </td>
                           </tr>
                           
                        </tbody>  
                    </table>
                </div>
            </div>
            
            <!-- <td rowspan="2" class="state">
               <span>주문완료</span>
               <button type="button" class="delivery_tracking" data-toggle="modal" data-target="#tracking">배송조회</button><br>
               <span class="cancel" data-toggle="modal" data-target="#cancel">취소하기</span>
            </td> -->
    
            <!-- 배송조회 모달 시작-->
            <div class="modal fade" id="tracking" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                
                <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">주문/배송조회</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    </div>
                    <div class="modal-body">
                        <div class="track-box">
                            <span class="track-title">운송장번호</span>
                            <span class="trackno"><a href="#">123456789</a></span>
                            <span class="track-company">cj대한통운</span>
                            <div class="track_img">
                                <img src="<%=application.getContextPath()%>/resources/images/mypage/orderlist/track.PNG">
                            </div>   

                            <span class="address-title">배송지 정보</span>
                            <div class="delivery_info">
                                <div class="name"><dt>이름</dt><dd>정동호</dd></div>
                                <div class="contact"><dt>연락처</dt><dd>010-1234-1234</dd></div>
                                <div class="address"><dt>주소</dt><dd>춘천시 온의동</dd></div>
                                <div class="message"><dt>주문메시지</dt><dd>감사합니다.</dd></div>       
                            </div>
                        </div>
                        


                        <div class="button-group">
                            <button class="cancel" data-dismiss="modal" aria-label="Close">닫기</button>
                          </div>
                    </div>        
                </div>
                </div>
            </div>
            <!-- 구매 확정 모달-->
            <div class="modal fade" id="confirmation" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <span class="modal-title" id="exampleModalLabel">구매확정</span>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <div class="modal-body">
                      <div class="confirmation_img"><img src="<%=application.getContextPath()%>/resources/images/mypage/orderlist/confirmation.png"></div>
                      <span class="message1">확인버튼을 누르면 구매가 확정됩니다.</span>
                      <form action="" method="">
                        <div class="button-group">
                            <button class="cancel" data-dismiss="modal" aria-label="Close">취소</button>
                            <button type="submit" class="confirmation">확인</button>
                          </div>
                    </form>
                    </div>
                  </div>
                </div>
              </div>
            <!--주문취소 모달-->
            <div class="modal fade" id="cancel" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <span class="modal-title" id="exampleModalLabel">주문취소</span>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <div class="modal-body">
                      <div class="cancel_img"><img src="<%=application.getContextPath()%>/resources/images/mypage/orderlist/cancel.png"></div>
                      <span class="message1">취소사유를 입력해주세요.</span>
                      <form action="" method="">
                        <div class="form-group">
                          <input type="text" class="form-control" id="cancel_reason">
                        </div>
                        <div class="button-group">
                            <button class="cancel" data-dismiss="modal" aria-label="Close">취소</button>
                            <button type="submit" class="gocart">확인</button>
                          </div>
                    </form>
                    </div>
                  </div>
                </div>
              </div>
            <!--환불하기 모달-->
            <div class="modal fade" id="refund" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <span class="modal-title" id="exampleModalLabel">환불하기</span>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <div class="modal-body">
                      <div class="refund_img"><img src="<%=application.getContextPath()%>/resources/images/mypage/orderlist/refund.png"></div>
                      <span class="message1">환불사유를 입력해주세요.</span>
                      <form action="" method="">
                        <div class="form-group">
                          <input type="text" class="form-control" id="refund_reason">
                        </div>
                        <div class="button-group">
                            <button class="cancel" data-dismiss="modal" aria-label="Close">취소</button>
                            <button type="submit" class="complete">확인</button>
                          </div>
                    </form>
                    </div>
                  </div>
                </div>
              </div>
    </div>
</div>

<%@ include file="/WEB-INF/views/layout/footer.jsp" %>