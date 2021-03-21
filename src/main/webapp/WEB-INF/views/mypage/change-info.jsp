<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<%@ include file="/WEB-INF/views/layout/sidebar.jsp" %>

	<div id="change-div">
            <div id="change-info">
                <h3>기본정보</h3>
                <div class="wrapper1">
                    <div class="input-elements"></div>
                    <div class="input-id">아이디</div>
                    <div class="change-id">
                        <input type="text">
                    </div>
                    <div class="input-name">이름</div>
                    <div class="change-name">
                        <input type="text">
                    </div>
                    <div class="input-pno">휴대폰번호</div>
                    <div class="change-pno">
                        <input type="text">
                    </div>
                    <div class="input-location">주소</div>
                    <div class="change-location">
                        <input type="text">
                        <button id="change-location-button" type="button">우편번호 검색</button>
                        <div class="location-info mt-2 "><input type="text"></div>
                        <div class="location-info mt-2 "><input type="text"></div>
                    </div>
                </div>
    
                <div class="button-input">
                    <button id="change-info-button" class="change-info-buttons" type="button">정보수정</button>
                </div>
            </div>
    
            <div id="change-pw">
                <h3>비밀번호 변경</h3>
                <div class="wrapper2">
                    <div class="input-elements2"></div>
                    <div class="input-pw">현재 비밀번호</div>
                    <div class="current-pw">
                        <input type="text">
                    </div>
                    <div class="input-newpw">새 비밀번호</div>
                    <div class="new-pw">
                        <input type="text">
                    </div>
                    <div class="input-pwcheck">새 비밀번호 확인</div>
                    <div class="pw-check">
                        <input type="text">
                    </div>
                </div>
    
                <div class="button-input">
                    <button id="change-pw-button" class="change-info-buttons" type="button">비밀번호 변경</button>
                </div>
            </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>