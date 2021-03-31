<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
    <div class="bsk_content">    
        <div class="bsk_containe detail">
            <div class="bsk_title"><h4 class="bsk_h_font">장바구니</h4> <div class="bsk_side"><span class="bsk_text_font2">01 장바구니 ></span><span class="bsk_text_font1">02 주문서작성/결제 ></span><span class="bsk_text_font1">03 주문완료</span></div></div><hr>
            <div>
            	<form method="post">
            	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
                <table class="bsk_table_1">
                    <tr style="border-top: solid 1px #343a40;">
                        <th></th>
                        <th>상품/옵션 정보</th>
                        <th>수량</th>
                        <th>상품금액</th>
                        <th>합계금액</th>
                        
                    </tr>
                    
                    <c:forEach var="list" items="${list}">
                    
                    <tr >
                        <td style="width:2em;"><input type="checkbox" name="orderchk" id="orderchk" value="${list.basket_item_id}"></td>                  
                        <td id="bsk_td_main"><img width="100px" src="downloadAttach?basket_item_id=${list.basket_item_id}"/>
                        <div class="d-inline-block">
                        	 <div> 상품명 : ${list.product_title} </div>
                        </div>
                        	선택용량 : <div>${list.basket_volume}</div>
                        	선택분쇄 : <div>
                        	<c:if test="${list.basket_grind eq '1'}">
								홀빈(분쇄안함)
							</c:if>
							<c:if test="${list.basket_grind eq '2'}">
								프렌치프레스분쇄
							</c:if>
							<c:if test="${list.basket_grind eq '3'}">
								핸드드립분쇄
							</c:if>
							<c:if test="${list.basket_grind eq '4'}">
								더치용분쇄
							</c:if>
                        	</div>
                        </td>
                        <td><span>${list.basket_product_count}</span>개</td>
                        <td><span>${list.product_price}</span></td>
                        <td><span>
                        <c:set var = "item_total" value = "${list.product_price}" />
                        <c:if test="${list.basket_volume eq '400'}">
                        	<c:set var = "item_total" value = "${list.product_price*2}" />	
                        </c:if>
                        <c:if test="${list.basket_volume eq '1000'}">
                        	<c:set var = "item_total" value = "${list.product_price*4}" />	
                        </c:if>
                        <c:set var = "item_total" value = "${item_total*list.basket_product_count}" />	
                        ${item_total}   
                        <span></td>

                    </tr>        
                    </c:forEach>
                </table>
                
               <%--  <div class="bsk_sumbox float-center ">
                    <div class="d-inline-block align-self-center mr-3 text-right"><div>총 상품금액</div><div class="text-danger">8,300원</div></div>
                    <img class="mr-3 align-self-center" height="30px" src="<%=application.getContextPath()%>/resources/images/order/+.PNG"/>
                    <div class="d-inline-block align-self-center mr-3"><div>배송비</div><div>2,500원</div></div>
                    <img class="mr-3 align-self-center" height="30px" src="<%=application.getContextPath()%>/resources/images/order/=.PNG"/>
                    <div class="d-inline-block align-self-center mr-3"><div>합계</div><div class="text-danger">10,800원</div></div>
                </div> --%>
            </div>
        

        <div class="bsk_button_div">
            <div class="bsk_left_button">
            
           
             	
                <input type="submit" formaction="<%=application.getContextPath() %>/mypage/selectBasketItemDelete" value="선택상품삭제">
                
                <button>선택 상품 찜</button>
            </div>
            <div class="bsk_right_button">
                <button onclick=location.href="${pageContext.request.contextPath}/order/fill_out_order">선택 상품 주문</button>
                <button onclick=location.href="${pageContext.request.contextPath}/order/fill_out_order" style="background-color: rgb(219, 120, 103); color:white">전체 상품 주문</button>
            </div>          
        </div>
        
        </form>
        
        <tr>
               	<td colspan="5" class="text-center">
               		<!-- [처음][이전] 1 2 3 4 5 [다음][맨끝] -->
               		<a class="btn btn-outline-primary btn-sm"
               			href="basket?pageNo=1">처음</a>
               		
               		<c:if test="${pager.groupNo>1}"> <!-- 현재 그룹의 No가 1 보다 클 때 -->
               			<a class="btn btn-outline-info btn-sm"
               			href="basket?pageNo=${pager.startPageNo-1}">이전</a>
               		</c:if>
               		
               		<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
               			
               			<c:if test="${pager.pageNo!=i}">
               				<a class="btn btn-outline-success btn-sm" 
               				href="basket?pageNo=${i}">${i}</a>
               			</c:if>
               			
               			<c:if test="${pager.pageNo==i}">
	               			<a class="btn btn-outline-danger btn-sm" 
	               				href="basket?pageNo=${i}">${i}</a>
               			</c:if>
               			
               		</c:forEach>
               		
               		<c:if test="${pager.groupNo<pager.totalGroupNo}"> 
               			<a class="btn btn-outline-info btn-sm"
               			href="basket?pageNo=${pager.endPageNo+1}">다음</a>
               		</c:if>
               		
               		<a class="btn btn-outline-primary btn-sm"
               			href="basket?pageNo=${pager.totalPageNo}">맨끝</a>
               		
               </tr>


        <script src="../navbar/nav.js"></script>
        
        <script src="${pageContext.request.contextPath}/resources/js/user/sign_in_up.js"></script>
	</div>
	</div>
<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %> --%>