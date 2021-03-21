<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/layout/header.jsp" %>
    <div class="f_o_content">
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
                    <tr >                       
                        <td id="td_main"><img width="100px" src="<%=application.getContextPath()%>/resources/images/order/coffe1.PNG"/><div class="d-inline-block"><div>스프링 블렌드</div><div>용량 선택</div></div></td>
                        <td rowspan="2">1개</td>
                        <td rowspan="2">8300원</td>
                        <td rowspan="2">8300원</td>
                        <td rowspan="2">2500원</td>
                    </tr>
                    <tr> 
                        <td id="td_main"><button class="btn btn-secondary btn-sm mr-1" disabled>추가</button><img width="100px" src="<%=application.getContextPath()%>/resources/images/order/coffe1.PNG"/><div class="d-inline-block"><div>프렌치 프레스 분쇄</div><div>수량: 1개(+0원)</div></div></td>
                    </tr>
                </table>

                <div class="f_o_sumbox float-center ">
                    <div class="d-inline-block align-self-center mr-3 text-right"><div>총 1개의 상품금액</div><div class="text-danger">8,300원</div></div>
                    <img class="mr-3 align-self-center" height="30px" src="<%=application.getContextPath()%>/resources/images/order/+.PNG"/>
                    <div class="d-inline-block align-self-center mr-3"><div>배송비</div><div>2,500원</div></div>
                    <img class="mr-3 align-self-center" height="30px" src="<%=application.getContextPath()%>/resources/images/order/=.PNG"/>
                    <div class="d-inline-block align-self-center mr-3"><div>합계</div><div class="text-danger">10,800원</div></div>
                </div>
            </div>
        </div>
        <div class="f_o_containe f_o_customer_info">
            <h6 class="f_o_m_h_font">주문자 정보</h6>
            <table class="f_o_table_2">
                <tr>
                    <th style="border-top: solid 1px #343a40;">주문하시는 분</th>
                    <td style="border-top: solid 1px #343a40;"><input type="text"></td>
                </tr>
                <tr>
                    <th>휴대폰 번호</th>
                    <td><input type="text" ></td>
                </tr>
                
                <tr>
                    <th>이메일</th>
                    <td><input type="email"><select name="email" id="email">
                        <option value="volvo">직접입력</option>
                        <option value="saab">naver.com</option>
                        <option value="opel">daum.net</option>
                        <option value="audi">gmail.com</option>
                      </select></td>
                </tr>
                
            </table>
        </div>
        <div class="f_o_containe f_o_ship_info">
            <table class="f_o_table_2">
                <h6 class="f_o_m_h_font">배송 정보</h6>
                <tr>
                    <th style="border-top: solid 1px #343a40;">받으실분</th>
                    <td style="border-top: solid 1px #343a40;"><input type="text"></td>
                </tr>
                <tr>
                    <th>받으실 곳</th>
                    <td>
                        <input type="text" > <button>우편번호검색</button><br>
                        <input type="text" style="width: 40em"><input type="text" style="width: 40em">
                    </td>
                </tr>
                <tr>
                    <th>휴대폰 번호</th>
                    <td><input type="text" ></td>
                </tr>
                
                <tr>
                    <th>남기실 말씀</th>
                    <td><input type="text"></td>
                </tr>
            </table>    
        </div>
        <div class="f_o_containe pay_info">
            <h6 class="f_o_m_h_font">결제정보</h6>
            <table class="f_o_table_2">
                <tr>
                    <th style="border-top: solid 1px #343a40;">상품 합계 금액</th>
                    <td style="border-top: solid 1px #343a40;"><div style="font-size: 1.7em; font-weight:bold ">8,300원</div></td>
                </tr>
                <tr>
                    <th>배송비</th>
                    <td><div>2,500원</div></td>
                </tr>
                <tr>
                    <th>최종 결제 금액</th>
                    <td><div style="font-size: 1.7em; font-weight:bold ">10,800원</div></td>
                </tr>
                
                <tr>
                    <th>일반결제</th>
                    <td>
                        <div class="f_o_account_form">
                            <div>무통장 입금</div><hr/>
                            <div class="f_o_font_gray">(무통장 입금의 경우 입금확인 후부터 배송단계가 진행됩니다.)</div>
                            <div><span>입금자명</span><input type="text" style="margin-left: 2em;"></div>
                            <div><span>입금은행</span><select name="account" id="account">
                                <option value="sel">선택하세요</option>
                                <option value="gy">기업은행 118-529312-01-014 (주)콩콩콩</option>
                                <option value="nh">농협 321--0241-3124-11 (주)콩콩콩</option>
                                <option value="sh">신한은행 421-43243-21-022 (주)콩콩콩</option>
                              </select></div>
                        </div>
                    </td>
                </tr>
            </table>    

            <div class="f_o_sumbox float-center ">
                
                <div class="align-self-center mr-3"><span class="mr-3 font-weight-bold">최종 결제 금액</span><span style="font-size: 1.7em; font-weight:bold;color:red">10,800원</span></div>
            </div>
            <label class="f_o_checkfont"><input type="checkbox" name="chk" value="chk" class="mr-1" >(필수) <label style="color: black;">구매하신 상품의 결제정보를 확인하였으며, 구매진행에 동의합니다.</label></label>
            <div class="f_o_lastbutton"><button onclick=location.href="${pageContext.request.contextPath}/order/order_complete">결제하기</button></div>
        </div>
        </div>
</body>
</html>