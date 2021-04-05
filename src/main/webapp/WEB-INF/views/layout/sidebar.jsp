<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="center">
    <div class="sidebar">
            <h2>마이페이지</h2>
            <div class="side_content">
                <ul>
                    <li>쇼핑 정보
                        <ul>
                            <li onclick=location.href="${pageContext.request.contextPath}/mypage/orderlist">- 주문목록/배송조회</li>
                            <li onclick=location.href="${pageContext.request.contextPath}/mypage/refund">- 취소/환불내역</li>
                            <li onclick=location.href="${pageContext.request.contextPath}/mypage/zzim">- 찜리스트</li>
                        </ul>
                    </li>
            
                    <li>고객 센터
                        <ul>
                            <li onclick=location.href="${pageContext.request.contextPath}/mypage/my-qna">- 1:1 문의</li>
                        </ul>
                    </li>
                    
                    <li>회원정보
                        <ul>
                            <li onclick=location.href="${pageContext.request.contextPath}/mypage/change-info">- 회원정보 변경</li>
                            <li onclick=location.href="${pageContext.request.contextPath}/mypage/delete-account">- 회원탈퇴</li>
                        </ul>
                    </li>
            
                    <li>나의 상품후기
                        <ul>
                            <li><a href="my-review">나의 상품후기</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
    </div>