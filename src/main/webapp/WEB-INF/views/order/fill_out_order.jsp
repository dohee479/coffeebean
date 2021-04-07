<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>

<c:set var="num" value="0"/>
<c:set var="total_price" value="0"/>

    <form class="f_o_content" method="post" action="${pageContext.request.contextPath}/order/order_complete">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
    <input type="hidden" name="order_id" value="${orderinfoList[0].order_id}" />
    <input type="hidden" name="orderinfo" value="${orderinfoList[0]}"/>
        <div class="f_o_containe detail">
            <div class="f_o_title"><h4 class="f_o_h_font">주문서작성/결제</h4> <div class="f_o_side"><span class="f_o_text_font1">01 장바구니 ></span><span class="f_o_text_font2">02 주문서작성/결제 ></span><span class="f_o_text_font1">03 주문완료</span></div></div><hr>
            <div>
                <h5 class="f_o_m_h_font">주문상세내역</h5>
                <table class="f_o_table_1">
                    <tr style="border-top: solid 1px #343a40;">
                        <th width="700em">상품/옵션 정보</th>
                        <th width="138em"> 수량</th>
                        <th width="138em">상품금액</th> 
                        <th width="138em">합계금액</th>
                        <th width="138em">배송비</th>
                    </tr>
                 
                 <c:forEach var="orderinfo" items="${orderinfoList}">   
                 <c:set var="num" value="${num+1}"/>
                 <c:set var="total_price" value="${total_price+orderinfo.order_product_price}" />
                 
	                    <tr>
	                    	               
	                        <td id="td_main"><img width="100px" src="${pageContext.request.contextPath}/mypage/zzimdownloadAttach?product_id=${orderinfo.product_id}"/><div class="d-inline-block"><div>${ orderinfo.product_title}</div><div><span>선택 용량:${ orderinfo.order_product_volume}</span><span><div>
	                        	분쇄 타입:
	                        	<c:if test="${orderinfo.order_product_grind eq '1'}">
									홀빈(분쇄안함)
								</c:if>
								<c:if test="${orderinfo.order_product_grind eq '2'}">
									프렌치프레스분쇄
								</c:if>
								<c:if test="${orderinfo.order_product_grind eq '3'}">
									핸드드립분쇄
								</c:if>
								<c:if test="${orderinfo.order_product_grind eq '4'}">
									더치용분쇄
								</c:if>
	                        	</div></span></div></div></td>
	                        <td >${orderinfo.order_product_count}</td>
	                        <td >${orderinfo.product_price }</td>
	                        <td>${orderinfo.order_product_price}</td>
	                        <td>2500원</td>
	                    </tr>
					</c:forEach>
                </table>

                <div class="f_o_sumbox float-center ">
                    <div class="d-inline-block align-self-center mr-3 text-right"><div>총 ${num}개의 상품금액</div><div class="text-danger"><fmt:formatNumber value="${total_price}" type="number" maxFractionDigits="3"/></div></div>
                    <img class="mr-3 align-self-center" height="30px" src="<%=application.getContextPath()%>/resources/images/order/+.PNG"/>
                    <div class="d-inline-block align-self-center mr-3"><div>배송비</div><div>2,500원</div></div>
                    <img class="mr-3 align-self-center" height="30px" src="<%=application.getContextPath()%>/resources/images/order/=.PNG"/>
                    <div class="d-inline-block align-self-center mr-3"><div>합계</div><div class="text-danger"><fmt:formatNumber value="${total_price+2500}" type="number" maxFractionDigits="3"/></div></div>
                </div>
                
                <script>
                	numberWithCommas(${total_price+2500});
                	
                </script>
                
            </div>
        </div>
        <div class="f_o_containe f_o_customer_info">
            <h6 class="f_o_m_h_font">주문자 정보</h6>
            <table class="f_o_table_2">
                <tr>
                    <th style="border-top: solid 1px #343a40;">주문하시는 분</th>
                    <td style="border-top: solid 1px #343a40;">${orderinfoList[0].order_account_name}</td>
                </tr>
                <tr>
                    <th>휴대폰 번호</th>
                    <td>${orderinfoList[0].order_tel}</td>
                </tr>
                
                
            </table>
        </div>
        <div class="f_o_containe f_o_ship_info">
            <table class="f_o_table_2">
                <h6 class="f_o_m_h_font">배송 정보</h6>
                <tr>
                    <th style="border-top: solid 1px #343a40;">받으실분</th>
                    <td style="border-top: solid 1px #343a40;"><input type="text" name="order_receiver" value="${orderinfoList[0].order_receiver}"></td>
                </tr>
                <tr>
                    <th>받으실 곳</th>
                    <td>
                        <input type="text" name="order_zipcode" value="${orderinfoList[0].user_zipcode}" id="user_zipcode" placeholder="우편번호" readonly> <button type="button" onclick="sample6_execDaumPostcode()" class="s_select_font">우편번호 찾기</button><br>
                        <input type="text" name="order_address" value="${orderinfoList[0].order_address}"style="width: 40em" id="user_address" placeholder="주소" readonly>
                        <input type="text" name="order_detail_address" value="${orderinfoList[0].order_detail_address}"style="width: 40em" id="user_detail_address" placeholder="상세주소">
                        <input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
                    </td>
                </tr>
                <tr>
                    <th>휴대폰 번호</th>
                    <td><input type="text" name="order_tel" value="${orderinfoList[0].order_tel }"></td>
                </tr>
                
                <tr>
                    <th>남기실 말씀</th>
                    <td><input name="order_msg" type="text"></td>
                </tr>
            </table>    
        </div>
        <div class="f_o_containe pay_info">
            <h6 class="f_o_m_h_font">결제정보</h6>
            <table class="f_o_table_2">
                <tr>
                    <th style="border-top: solid 1px #343a40;">상품 합계 금액</th>
                    <td style="border-top: solid 1px #343a40;"><div style="font-size: 1.7em; font-weight:bold "><fmt:formatNumber value="${total_price}" type="number" maxFractionDigits="3"/></div></td>
                </tr>
                <tr>
                    <th>배송비</th>
                    <td><div>2,500원</div></td>
                </tr>
                <tr>
                    <th>최종 결제 금액</th>
                    <td><div style="font-size: 1.7em; font-weight:bold "><fmt:formatNumber value="${total_price+2500}" type="number" maxFractionDigits="3"/></div></td>
                </tr>
                
                <tr>
                    <th>일반결제</th>
                    <td>
                        <div class="f_o_account_form">
                            <div>무통장 입금</div><hr/>
                            <div class="f_o_font_gray">(무통장 입금의 경우 입금확인 후부터 배송단계가 진행됩니다.)</div>
                            <div><span>입금자명</span><input type="text" name="order_account_name" style="margin-left: 2em;"></div>
                            <div><span>입금은행</span><select name="order_account" id="order_account">
                                <option value="">선택하세요</option>
                                <option value="기업은행 118-529312-01-014">기업은행 118-529312-01-014 (주)콩콩콩</option>
                                <option value="농협 321--0241-3124-11">농협 321--0241-3124-11 (주)콩콩콩</option>
                                <option value="신한은행 421-43243-21-022">신한은행 421-43243-21-022 (주)콩콩콩</option>
                              </select></div>
                        </div>
                    </td>
                </tr>
            </table>    

            <div class="f_o_sumbox float-center ">
                
                <div class="align-self-center mr-3"><span class="mr-3 font-weight-bold">최종 결제 금액</span><span style="font-size: 1.7em; font-weight:bold;color:red"><fmt:formatNumber value="${total_price+2500}" type="number" maxFractionDigits="3"/></span></div>
            </div>
            <label class="f_o_checkfont"><input type="checkbox" name="chk" value="chk" class="mr-1" >(필수) <label style="color: black;">구매하신 상품의 결제정보를 확인하였으며, 구매진행에 동의합니다.</label></label>
            <div class="f_o_lastbutton"><button type="submit">결제하기</button></div>
        </div>
        </form>
        
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/user/address.js"></script>
</body>
</html>