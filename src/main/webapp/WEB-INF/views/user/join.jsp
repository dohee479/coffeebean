
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>
    <form class="s_content" method="post" action="${pageContext.request.contextPath}/user/join">
    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <div class="s_form_container s_sign_up_container">
                <h1>회원가입</h1>
                <h4 class="s_u_h4">기본 정보</h4>
                <table class="s_table_1">
                    <tr>
                        <th style="border-top: solid 1px #343a40;">아이디</th>
                        <td style="border-top: solid 1px #343a40;">
                            <input type="text" onkeyup="id_check()" id="id" name="user_id"><br>
                            <a class="s_available" id="s_available"></a>
                            <input class="s_available" type="text" id="s_available" disabled>
                        </td>
                    </tr>
                    <tr>
                        <th>비밀번호</th>
                        <td><input type="password" name="user_password"></td>
                    </tr>
                    <tr>
                        <th>비밀번호 확인</th>
                        <td><input type="password" name="#"></td>
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td><input type="text" name="user_name"></td>
                    </tr>
                    <tr>
                        <th>이메일</td>
                        <td><input type="email" style="width:26em" name="user_email"><select class="s_select_font"  id="email">
                            <option value="volvo">직접입력</option>
                            <option value="saab">naver.com</option>
                            <option value="opel">daum.net</option>
                            <option value="audi">gmail.com</option>
                          </select></td>
                    </tr>
                    <tr>
                        <th>휴대폰번호</th>
                        <td><input type="text" placeholder="-없이 입력하세요." name="user_tel"></td>
                    </tr>
                    <tr>
                        <th>주소</th>
                        <td>
                            <input type="text" style="width:26em" name="user_zipcode"> <button class="s_select_font">우편번호검색</button><br>
                            <input type="text" name="user_address" /><br>
                            <input type="text" name="user_detail_address" />
                        </td>
                    </tr>


                </table>
                <button type="button" id="signIn_mv" onclick=location.href="${pageContext.request.contextPath}/user/login">취소</button>
                <button type="submit" style="background-color: rgb(102,102,102);">회원가입</button>
            </div>
    </form> 	
</div>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>