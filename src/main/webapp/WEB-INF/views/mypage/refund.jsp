<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<%@ include file="/WEB-INF/views/layout/sidebar.jsp" %>
    <div >
        <div class="refund_list">
            <span>취소/환불내역</span>
            <div class="table">
                <table>
                    <thead>
                        <tr class="attribute">
                            <th class="order_no">주문번호</th>
                            <th class="title">상품명/옵션</th>
                            <th class="price">상품금액/수량</th>
                            <th class="state">주문상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="items">
                            <td class="order_no">202100001</td>
                            <td class="item_wrap">
                                <div class="item_img"><img class="item_img" src="<%=application.getContextPath()%>/resources/images/mypage/orderlist/item_img.jpg"></div>
                                <div class="item_title"><span>[뉴크롭] 케냐 AA 키암부</span></div>
                            </td>
                            <td class="price">
                                <span class="price">5800</span>원/
                                <span class="count">1</span>개
                            </td>
                            <td class="state">
                                <span>취소완료</span>
                            </td>
                        </tr>
                        <tr class="items">
                            <td class="order_no">202100001</td>
                            <td class="item_wrap">
                                <div class="item_img"><img class="item_img" src="<%=application.getContextPath()%>/resources/images/mypage/orderlist/item_img2.jpg"></div>
                                <div class="item_title"><span>스타블렌드</span></div>
                            </td>
                            <td class="price">
                                <span class="price">2500</span>원/
                                <span class="count">1</span>개
                            </td>
                            <td class="state">
                                <span>환불완료</span>
                            </td>
                        </tr>
                    </tbody>  
                </table>
            </div>
        </div>

    </div>