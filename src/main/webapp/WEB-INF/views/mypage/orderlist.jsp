<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                                <td class="title"><span class="titleAndOption">상품명/옵션</span></td>
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
			                                    	<img class="item_img" 
			                                    	src="${pageContext.request.contextPath}/mypage/zzimdownloadAttach?product_id=${list_orderproduct.products_product_id}"
			                                    	onclick="productClick(${list_orderproduct.products_product_id})" style="cursor:pointer;">
			                                    </div>
			                                    <div class="order_item_title">
			                                    	<span class="item_name" onclick="productClick(${list_orderproduct.products_product_id})"
			                                    	style="cursor:pointer;">${list_orderproduct.product_title}
			                                    	</span>
			                                    	<span class="order_item_option">
			                                    	${list_orderproduct.order_product_volume}g
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
											<fmt:parseNumber var= "product_price" integerOnly= "true" value= "${list_orderproduct.order_product_price/list_orderproduct.order_product_count}" />
			                                    <span class="productPriceAndCount">${product_price}원/${list_orderproduct.order_product_count}개</span>
			                                	 <c:if test="${ orderlist[0].order_state eq 5}">
											     <div class="writeReview" style="cursor:pointer;" data-toggle="modal" data-target="#create-review-modal${list_orderproduct.products_product_id}">리뷰작성</div>
			                                   	</c:if>	
			                                </div>   
			                            </div>
			                       		<!-- 상품 리뷰 쓰기 -->
						                 <div class="modal fade" id="create-review-modal${list_orderproduct.products_product_id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							                <div class="modal-dialog modal-dialog-centered" role="document">
							                  <div class="modal-content">
							                    <div class="modal-header">
							                      <span class="modal-title" id="exampleModalLabel">구매확정</span>
							                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
							                        <span aria-hidden="true">&times;</span>
							                      </button>
							                    </div>
							                    <div class="modal-body">
										        <form method="post" action="${pageContext.request.contextPath}/review/create?${_csrf.parameterName }=${_csrf.token }" enctype="multipart/form-data">
										        	<!-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> -->
										        	<input type="hidden" name="products_product_id" value="${list_orderproduct.products_product_id}">
											        <input type="hidden" name="order_product_id" value="${list_orderproduct.order_product_id}">
											        <div class="modal-body">
											          <div id="star-radio">
											            <span>평점: </span>
											            <span class="radio-inline">
											              <input type="radio" name="review_grade" class="select-stars ml-2" id="star1" value=1 checked>
											              <label for="star1" class="shape-stars">1</label>
											            </span>
											            <span class="radio-inline">
											              <input type="radio" name="review_grade" class="select-stars ml-2" id="star2" value=2>
											              <label for="star2" class="shape-stars">2</label>
											            </span>
											            <span class="radio-inline">
											              <input type="radio" name="review_grade" class="select-stars ml-2" id="star3" value=3>
											              <label for="star3" class="shape-stars">3</label>
											            </span>
											            <span class="radio-inline">
											              <input type="radio" name="review_grade" class="select-stars ml-2" id="star4" value=4>
											              <label for="star4" class="shape-stars">4</label>
											            </span>
											            <span class="radio-inline">
											              <input type="radio" name="review_grade" class="select-stars ml-2" id="star5" value=5>
											              <label for="star5" class="shape-stars">5</label>
											            </span>
											          </div>
											          <input type="text" class="input-title" placeholder="제목을 입력하세요." name="review_title">
											          <textarea class="input-content" wrap="physical" placeholder="내용을 입력하세요." name="review_content"></textarea>
											          <div class="file-upload mt-4">
											            <label for="selete-file">사진 첨부: </label>
											            <input type="file" id="selete-file" name="review_attach">
											          </div>
											        </div>
											        <div class="modal-footer">
											          <button type="button" class="btn btn-outline-secondary" id="asdasfas" data-dismiss="modal">취소</button>
											          <button type="submit" class="btn btn-danger" value="등록">등록</button>
											        </div>
											   </form>
											   </div>
											   </div>
							                </div>
							              </div>
			                            </c:forEach>	             
										</td>													
	                                <td class="state">
	                                <c:if test="${ orderlist[0].order_state eq 1}">
		                               <div class="msg">주문완료</div><br/>
		                             <%--   <button type="button" class="delivery_tracking" data-toggle="modal" data-target="#tracking${ orderlist[0].orders_order_id}">배송조회</button><br> --%>
		                               <div class="cancel" data-toggle="modal" data-target="#cancel${ orderlist[0].orders_order_id}">취소하기</div><br>
		                               <div class="cancel" data-toggle="modal" data-target="#confirmation${ orderlist[0].orders_order_id}">구매확정</div>
		                           	</c:if>
		                           	<c:if test="${ orderlist[0].order_state eq 5}">
		                           		<span>구매확정</span><br/>
		                           	</c:if>
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
					                    <div class="modal-body" id="cancelModal">
					                      <div class="cancel_img"><img src="<%=application.getContextPath()%>/resources/images/mypage/orderlist/cancel.png"></div>

					                      <span class="message1 mb-3">주문을 취소합니다.</span>
					                      <form action="cancel-order" method="post">
					                      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>  
					                        <div class="button-group">
					                            <button class="cancel" data-dismiss="modal" aria-label="Close">취소</button>
					                            <button type="submit" class="gocart" name="order_id" value="${ orderlist[0].orders_order_id}">확인</button>
					                          </div>
					                    </form>
					                    </div>
					                  </div>
					                </div>
					              </div>
					              
					              <!-- 구매 확정 모달-->
					            <div class="modal fade" id="confirmation${ orderlist[0].orders_order_id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					                <div class="modal-dialog modal-dialog-centered" role="document">
					                  <div class="modal-content">
					                    <div class="modal-header">
					                      <span class="modal-title" id="exampleModalLabel">구매확정</span>
					                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					                        <span aria-hidden="true">&times;</span>
					                      </button>
					                    </div>
					                    <div class="modal-body" id="confirmationModalBody">
					                      <div class="confirmation_img"><img src="<%=application.getContextPath()%>/resources/images/mypage/orderlist/confirmation.png"></div>
					                      <span class="message1">확인버튼을 누르면 구매가 확정됩니다.</span>
					                      <form action="confirmation-order" method="post">
					                       <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
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


<script>
const productClick=(product_id)=>{
		console.log(product_id);
		
		location.href="${pageContext.request.contextPath}/product/detail/"+product_id;		
	}
</script>
         

<%@ include file="/WEB-INF/views/layout/footer.jsp" %>