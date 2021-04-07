<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<%@ include file="/WEB-INF/views/layout/sidebar.jsp" %>
   <div>
        <div class="refund_list">
            <span>취소/환불내역</span>
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
                               <span>취소완료</span><br/>
                             	<%--   <button type="button" class="delivery_tracking" data-toggle="modal" data-target="#tracking${ orderlist[0].orders_order_id}">배송조회</button><br> --%>
                           		</td>
                          	</tr>
                         </c:forEach>
                      </tbody>  
            	</table>
            </div>
        </div>
    
   </div>
    
    
    </div>
    <%@ include file="/WEB-INF/views/layout/footer.jsp" %>