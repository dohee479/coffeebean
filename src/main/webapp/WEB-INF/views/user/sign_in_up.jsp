<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>
    <div class="content">
        <div class=container id=container>
            <div class="form_container sign_in_container">
                <h1>로그인</h1>
                    <div >
                        <h4 class="i_h4">회원 로그인</h4>
                        <a href="${pageContext.request.contextPath}/user/id_pwd">아이디/비밀번호 찾기</a>
                    </div>
                    
                   
                    <input type="text" placeholder="아이디">
                    <button onclick=location.href="${pageContext.request.contextPath}/main/main">로그인</button> <br>
                    <input type="text" placeholder="비밀번호">
                    <button style="background-color: rgb(102,102,102);" id="signUp_mv">회원가입</button>
            </div>

            <div class="form_container sign_up_container">
                <h1>회원가입</h1>
                <h4 class="u_h4">기본 정보</h4>
                <table class="table_1">
                    <tr>
                        <th style="border-top: solid 1px #343a40;">아이디</th>
                        <td style="border-top: solid 1px #343a40;">
                            <input type="text" onkeyup="id_check()" id="id"><br>
                            <a class="available" id="available"></a>
                            <input class="available" type="text" id="available" disabled>
                        </td>
                    </tr>
                    <tr>
                        <th>비밀번호</th>
                        <td><input type="password" ></td>
                    </tr>
                    <tr>
                        <th>비밀번호 확인</th>
                        <td><input type="password" ></td>
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td><input type="text"></td>
                    </tr>
                    <tr>
                        <th>이메일</td>
                        <td><input type="email" style="width:17.5em"><select class="select_font" name="email" id="email">
                            <option value="volvo">직접입력</option>
                            <option value="saab">naver.com</option>
                            <option value="opel">daum.net</option>
                            <option value="audi">gmail.com</option>
                          </select></td>
                    </tr>
                    <tr>
                        <th>휴대폰번호</th>
                        <td><input type="text" placeholder="-없이 입력하세요."></td>
                    </tr>
                    <tr>
                        <th>주소</th>
                        <td>
                            <input type="text" style="width:17.5em"> <button class="select_font">우편번호검색</button><br>
                            <input type="text"><br>
                            <input type="text">
                        </td>
                    </tr>


                </table>
                <button id="signIn_mv">취소</button>
                <button style="background-color: rgb(102,102,102);">회원가입</button>

            </div>
        </div>
    </div>
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
