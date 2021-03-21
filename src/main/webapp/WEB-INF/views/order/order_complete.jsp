<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/layout/header.jsp" %>
    <div class="o_c_content">
        <div class="o_c_containe detail">
            <div class="o_c_title"><h4 class="o_c_h_font">주문완료</h4> <div class="o_c_side"><span class="o_c_text_font1">01 장바구니 ></span><span class="o_c_text_font1">02 주문서작성/결제 ></span><span class="o_c_text_font2">03 주문완료</span></div></div><hr>
            <div class="o_c_order_complete"><div>감사합니다! <span>주문이 완료</span>되었습니다.</div><div style="font-size: 0.7em;">주문번호:10023123</div></div>
            <div>
                <h5 class="o_c_m_h_font">주문상세내역</h5>
                <table class="o_c_table_1">
                    <tr style="border-top: solid 1px #343a40;">
                        <th width="700em">상품/옵션 정보</th>
                        <th width="138em"> 수량</th>
                        <th width="138em">상품금액</th>
                        <th width="138em">합계금액</th>
                        <th width="138em">배송비</th>
                    </tr>
                    <tr >                       
                        <td id="o_c_td_main"><img width="100px" src="<%=application.getContextPath()%>/resources/images/order/coffe1.PNG"/><div class="d-inline-block"><div>스프링 블렌드</div><div>용량 선택</div></div></td>
                        <td rowspan="2" class="text-center">1개</td>
                        <td rowspan="2" class="text-center">8300원</td>
                        <td rowspan="2" class="text-center">8300원</td>
                        <td rowspan="2" class="text-center">2500원</td>
                    </tr>
                    <tr> 
                        <td id="o_c_td_main"><button class="btn btn-secondary btn-sm mr-1" disabled>추가</button><img width="100px" src="<%=application.getContextPath()%>/resources/images/order/coffe1.PNG"/><div class="d-inline-block"><div>프렌치 프레스 분쇄</div><div>수량: 1개(+0원)</div></div></td>
                    </tr>
                </table>

                <div class="o_c_sumbox float-center ">
                    <div class="d-inline-block align-self-center mr-3 text-right"><div>총 1개의 상품금액</div><div class="text-danger">8,300원</div></div>
                    <img class="mr-3 align-self-center" height="30px" src="<%=application.getContextPath()%>/resources/images/order/+.PNG"/>
                    <div class="d-inline-block align-self-center mr-3"><div>배송비</div><div>2,500원</div></div>
                    <img class="mr-3 align-self-center" height="30px" src="<%=application.getContextPath()%>/resources/images/order/=.PNG"/>
                    <div class="d-inline-block align-self-center mr-3"><div>합계</div><div class="text-danger">10,800원</div></div>
                </div>
            </div>
        </div>
        <div class="o_c_containe o_c_customer_info">
            <table class="o_c_table_2">
                <h6 class="o_c_m_h_font">결제 정보</h6>
                <tr>
                    <th style="border-top: solid 1px #343a40;">결제방법</th>
                    <td style="border-top: solid 1px #343a40;"><div> 무통장 입금</div></td>
                </tr>
                <tr>
                    <th>결제상태</th>
                    <td><div> 입금요청</div></td>
                </tr>
                <tr>
                    <th>총 결제 금액</th>
                    <td><span style="color: tomato; font-size: 1.5em;">7,000</span>원</td>
                </tr>
            </table>
        </div>
        <div class="o_c_containe o_c_ship_info">
            <table class="o_c_table_2">
                <h6 class="o_c_m_h_font">배송지 정보</h6>
                <tr>
                    <th style="border-top: solid 1px #343a40;">이름</th>
                    <td style="border-top: solid 1px #343a40;"><div> 콩콩이</div></td>
                </tr>
                <tr>
                    <th>연락처</th>
                    <td><div> 010-7706-9177</div></td>
                </tr>
                <tr>
                    <th>주소</th>
                    <td><div>경기도 부천시 오정구 오정로253</div></td>
                </tr>
                <tr>
                    <th>주문메시지</th>
                    <td><div>문앞에 두어주세요</div></td>
                </tr>
            </table> 
            <div class="o_c_lastbutton"><button class="o_c_button1" onclick=location.href="${pageContext.request.contextPath}/mypage/orderlist">주문내역확인</button><button class="o_c_button2" onclick=location.href="${pageContext.request.contextPath}/product/country">쇼핑계속하기</button></div>   
        </div>           
     </div>
</body>
</html>