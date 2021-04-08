<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>
    <form class="s_content" method="post" action="${pageContext.request.contextPath}/login">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
        <div class=s_container id=s_container>
            <div class="s_form_container s_sign_in_container">
                <h1>로그인</h1>
                    <div >
                        <h4 class="s_i_h4">회원 로그인</h4>
                        <a href="${pageContext.request.contextPath}/user/id_pwd_find">아이디/비밀번호 찾기</a>
                    </div>
                    
                   
                    <input type="text" name="user_id" placeholder="아이디" style="color:black;">
                    <button type="submit" id="login">로그인</button> <br>
                    <input type="password" name="user_password" placeholder="비밀번호" style="color:black;">
                    <button type="button" style="background-color: rgb(102,102,102);" id="signUp_mv" onclick="location.href='${pageContext.request.contextPath}/user/join'">회원가입</button>
            </div>
        </div>
    </form>    
</div>

<%@ include file="/WEB-INF/views/layout/footer.jsp" %>