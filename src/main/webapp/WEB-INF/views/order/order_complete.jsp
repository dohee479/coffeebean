<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/layout/header.jsp" %>
    <div class="o_c_content">
        <div class="o_c_containe detail">
            <div class="o_c_title"><h4 class="o_c_h_font">주문완료</h4> <div class="o_c_side"><span class="o_c_text_font1">01 장바구니 ></span><span class="o_c_text_font1">02 주문서작성/결제 ></span><span class="o_c_text_font2">03 주문완료</span></div></div><hr>
            <div class="o_c_order_complete"><div>감사합니다! <span>주문이 완료</span>되었습니다.</div><div style="font-size: 0.7em;">주문번호:${completeorder.order_id}</div></div>
			<div style="text-align:center;"><img style="width:400px;" src="http://gpmk.co.kr/xe/files/attach/images/4543/384/006/963b0d5dd0e986d073a66482e84d6c83.gif" alt=""/></div>
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
                    <td><span style="color: tomato; font-size: 1.5em;"> ${completeorder.order_total_price+2500}</span>원</td>
                </tr>
            </table>
        </div>
        <div class="o_c_containe o_c_ship_info">
            <table class="o_c_table_2">
                <h6 class="o_c_m_h_font">배송지 정보</h6>
                <tr>
                    <th style="border-top: solid 1px #343a40;">이름</th>
                    <td style="border-top: solid 1px #343a40;"><div>${completeorder.order_receiver}</div></td>
                </tr>
                <tr>
                    <th>연락처</th>
                    <td><div> ${completeorder.order_tel}</div></td>
                </tr>
                <tr>
                    <th>주소</th>
                    <td><div>${completeorder.order_address} ${completeorder.order_detail_address}</div></td>
                </tr>
                <tr>
                    <th>주문메시지</th>
                    <td><div>${completeorder.order_msg}</div></td>
                </tr>
            </table> 
            <div class="o_c_lastbutton"><button class="o_c_button1" onclick=location.href="${pageContext.request.contextPath}/mypage/orderlist">주문내역확인</button>
            <button class="o_c_button2" onclick=location.href="${pageContext.request.contextPath}/">쇼핑계속하기</button></div>   
        </div>           
     </div>
</body>
</html>