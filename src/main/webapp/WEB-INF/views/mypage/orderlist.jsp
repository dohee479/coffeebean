<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
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
                                <td class="title"><span class="titleAndOption">상품명/옵션</span><span class="priceAndCount">가격/수량</span></td>
                                <td class="state">주문상태</td>
                            </tr>
                        </thead>
                        <tbody>
                         <c:forEach var="orderlist" items="${totalOrderProductList}"> 
	                        <tr class="items">
	                                <td class="order_no">  <!-- 한주문에 몇개의 상품이 들어있는지 알아아 햠 -->
	                                	${ orderlist[0].orders_order_id}
		                            </td>  
		                                <td class="orderItemBox">
		                                <c:forEach var="list_orderproduct" items="${orderlist}">
		                                <div class="orderProducts">
			                                <div class="item_wrap">
			                                    <div class="item_img">
			                                    	<img class="item_img" src="${pageContext.request.contextPath}/mypage/zzimdownloadAttach?product_id=${list_orderproduct.products_product_id}"></div>
			                                    <div class="item_title">
			                                    	<span>${list_orderproduct.product_title}</span>
			                                    	<span>${list_orderproduct.order_product_volume}g
			                                    				/<c:if test="${list_orderproduct.order_product_grind eq '1'}">
																	홀빈(분쇄안함)
																</c:if>
																<c:if test="${list_orderproduct.order_product_grind eq '2'}">
																	프렌치프레스분쇄
																</c:if>
																<c:if test="${list_orderproduct.order_product_grind eq '3'}">
																	핸드드립분쇄
																</c:if>
																<c:if test="${list_orderproduct.order_product_grind eq '4'}">
																	더치용분쇄
																</c:if>
			                                    	</span>
			                                    </div>
			                                </div>                                                   
											<div class="price">
			                                    <span class="productPriceAndCount">${list_orderproduct.order_product_price}원/${list_orderproduct.order_product_count}개</span>
			                                </div>   
			                            </div>
			                            </c:forEach>	             
										</td>													
	                                <td class="state">
		                               <span>주문완료</span><br/>
		                             <%--   <button type="button" class="delivery_tracking" data-toggle="modal" data-target="#tracking${ orderlist[0].orders_order_id}">배송조회</button><br> --%>
		                               <span class="cancel" data-toggle="modal" data-target="#cancel${ orderlist[0].orders_order_id}">취소하기</span>
		                           </td>
	                           </tr>
					  
					            <!--주문취소 모달-->
					            <div class="modal fade" id="cancel${ orderlist[0].orders_order_id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
					                      <span class="message1 mb-3">${ orderlist[0].orders_order_id} 번의 주문을 취소합니다.</span>
					                      <form action="cancel-order" method="post">
					                      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					                        <!-- <div class="form-group">
					                          <input type="text" class="form-control" id="cancel_reason">
					                        </div> -->
					                        <div class="button-group">
					                            <button class="cancel" data-dismiss="modal" aria-label="Close">취소</button>
					                            <button type="submit" class="gocart" name="order_id" value="${ orderlist[0].orders_order_id}">확인</button>
					                          </div>
					                    </form>
					                    </div>
					                  </div>
					                </div>
					              </div>
						                           
	                           
                           </c:forEach>
							
                           
                        </tbody>  
                    </table>
                </div>
            </div>
            
            <!-- <td rowspan="2" class="state">
               <span>주문완료</span>
               <button type="button" class="delivery_tracking" data-toggle="modal" data-target="#tracking">배송조회</button><br>
               <span class="cancel" data-toggle="modal" data-target="#cancel">취소하기</span>
            </td> -->



<%--   <!-- 배송조회 모달 시작 -->
					            <div class="modal fade" id="tracking${orderlist[0].orders_order_id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
					                            <span class="trackno"><a href="#">입금이 확인되면 배송을 시작합니다.</a></span>
					                            <!-- <span class="track-company">cj대한통운</span> -->
					                            <div class="track_img">
					                                <img src="<%=application.getContextPath()%>/resources/images/mypage/orderlist/track.PNG">
					                            </div>   
					
					                            <span class="address-title">배송지 정보</span>
					                            <div class="delivery_info">
					                                <div class="name"><dt>이름</dt><dd>${orderlist[0].orders_order_id}</dd></div>
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
</div> --%>
   </div>
   </div>     
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>