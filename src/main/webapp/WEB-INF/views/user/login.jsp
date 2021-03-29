<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>
    <div class="s_content">
        <div class=s_container id=s_container>
            <div class="s_form_container s_sign_in_container">
                <h1>로그인</h1>
                    <div >
                        <h4 class="s_i_h4">회원 로그인</h4>
                        <a href="${pageContext.request.contextPath}/user/id_pwd_find">아이디/비밀번호 찾기</a>
                    </div>
                    
                   
                    <input type="text" placeholder="아이디">
                    <button onclick=location.href="${pageContext.request.contextPath}/product/country">로그인</button> <br>
                    <input type="text" placeholder="비밀번호">
                    <button style="background-color: rgb(102,102,102);" id="signUp_mv" onclick="location.href='${pageContext.request.contextPath}/user/join'">회원가입</button>
            </div>
        </div>
    </div> 	
</div>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>