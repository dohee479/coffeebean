<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
    <div class="bsk_content">
        <div class="bsk_containe detail">
            <div class="bsk_title"><h4 class="bsk_h_font">장바구니</h4> <div class="bsk_side"><span class="bsk_text_font2">01 장바구니 ></span><span class="bsk_text_font1">02 주문서작성/결제 ></span><span class="bsk_text_font1">03 주문완료</span></div></div><hr>
            <div>
                <table class="bsk_table_1">
                    <tr style="border-top: solid 1px #343a40;">
                        <th colspan="2"><input type="checkbox" style="position: relative; left:-43.5%;;" name="orderchk" id="orderchk" onclick='selectAll(this)'>상품/옵션 정보</th>
                        <th> 수량</th>
                        <th>상품금액</th>
                        <th>합계금액</th>
                        <th>배송비</th>
                    </tr>
                    <tr >
                        <td rowspan="2" style="width:2em;"><input type="checkbox" name="orderchk" id="orderchk"></td>                  
                        <td id="bsk_td_main"><img width="100px" src="<%=application.getContextPath()%>/resources/images/order/coffe1.PNG"/><div class="d-inline-block"><div>스프링 블렌드</div><div>용량 선택</div></div></td>
                        <td rowspan="2">1개</td>
                        <td rowspan="2">8300원</td>
                        <td rowspan="2">8300원</td>
                        <td rowspan="2">2500원</td>
                    </tr>
                    <tr> 
                        <td id="bsk_td_main"><button class="btn btn-secondary btn-sm mr-1" disabled>추가</button><img width="100px" src="<%=application.getContextPath()%>/resources/images/order/coffe1.PNG"/><div class="d-inline-block"><div>프렌치 프레스 분쇄</div><div>수량: 1개(+0원)</div></div></td>
                    </tr>
                </table>

                <div class="bsk_sumbox float-center ">
                    <div class="d-inline-block align-self-center mr-3 text-right"><div>총 1개의 상품금액</div><div class="text-danger">8,300원</div></div>
                    <img class="mr-3 align-self-center" height="30px" src="<%=application.getContextPath()%>/resources/images/order/+.PNG"/>
                    <div class="d-inline-block align-self-center mr-3"><div>배송비</div><div>2,500원</div></div>
                    <img class="mr-3 align-self-center" height="30px" src="<%=application.getContextPath()%>/resources/images/order/=.PNG"/>
                    <div class="d-inline-block align-self-center mr-3"><div>합계</div><div class="text-danger">10,800원</div></div>
                </div>
            </div>
        

        <div class="bsk_button_div">
            <div class="bsk_left_button">
                <button>선택 상품 삭제</button>
                <button>선택 상품 찜</button>
            </div>
            
            <div class="bsk_right_button">
                <button onclick=location.href="${pageContext.request.contextPath}/order/fill_out_order">선택 상품 주문</button>
                <button onclick=location.href="${pageContext.request.contextPath}/order/fill_out_order" style="background-color: rgb(219, 120, 103); color:white">전체 상품 주문</button>
            </div>
            
        </div>



        <script src="../navbar/nav.js"></script>
        
        <script src="${pageContext.request.contextPath}/resources/js/user/sign_in_up.js"></script>
	</div>
	</div>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>