<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>
<div class="find-body">
           <div class="find-content">
                <div class="mt-4">
                    <table class="find-table_1">
                        <h6 class="find-table_h">아이디 찾기</h6>
                        <tr>
                            <th style="border-top: solid 1px #343a40;">이름</th><td style="border-top: solid 1px #343a40;"><input type="text"></td>
                        </tr>
                        <tr>
                            <th>이메일</th><td><input style="width:19.5em;" type="email"><select name="email" id="email">
                                <option value="volvo">직접입력</option>
                                <option value="saab">naver.com</option>
                                <option value="opel">daum.net</option>
                                <option value="audi">gmail.com</option>
                              </select></td>
                        </tr>
                    </table>
                    <div class="find-lastbutton"><button class="find-button1" data-toggle="modal" data-target="#findidmodal">아이디 찾기</button></div>
                </div>
                <div class="mt-4">
                    <table class="find-table_1">
                        <h6 class="find-table_h">비밀번호 찾기</h6>
                        <tr>
                            <th style="border-top: solid 1px #343a40;">아이디</th><td style="border-top: solid 1px #343a40;"><input type="text"></td>
                        </tr>
                        <tr>
                            <th>이름</th><td><input type="email"></td>
                        </tr>
                    </table>
                    <div class="find-lastbutton"><button class="find-button2" data-toggle="modal" data-target="#findpwdmodal">비밀번호 찾기</button></div>
                </div>
           </div> 
        </div>

        <div class="modal fade unomodal" id="findidmodal" tabindex="-1" aria-labelledby="findidmodalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="findidmodalLabel">아이디 받기</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  <div>
                      <table class="find-table_1">
                          <tr><th style="border-top: solid 1px #343a40;">아이디</th><td style="border-top: solid 1px #343a40;">dnsgh****</td></tr>
                          <tr><th>이름</th><td>조운호</td></tr>
                          <tr><th>이메일</th><td><span>dnsgh9177@naver.com</span><button class="find-small_button">발송</button></td></tr>
                      </table>
                      <span class="find-span">회원 이메일로 아이디를 보내드립니다.</span>
                  </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="findmodal-button" style="background-color: rgb(51,51,51);" onclick=location.href="${pageContext.request.contextPath}/user/sign_in_up">로그인</button>
                  <button type="button" class="findmodal-button" data-dismiss="modal">돌아가기</button>
                </div>
              </div>
            </div>
          </div>

          <div class="modal fade unomodal" id="findpwdmodal" tabindex="-1" aria-labelledby="findpwdmodalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="findpwdmodalLabel">비밀번호 받기</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                    <div>
                        <table class="find-table_1">
                            <tr><th style="border-top: solid 1px #343a40;">아이디</th><td style="border-top: solid 1px #343a40;">dnsgh1234</td></tr>
                            <tr><th>이메일</th><td><span>dns*****@naver.com</span><button class="find-small_button">발송</button></td></tr>
                        </table>
                        <span class="find-span">회원 이메일로 임시 비밀번호를 보내드립니다.<br>임시 비밀번호로 로그인 후, 새 비밀번호로 변경하시기 바랍니다.</span>
                    </div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="findmodal-button" style="background-color: rgb(51,51,51);" onclick=location.href="${pageContext.request.contextPath}/user/sign_in_up">로그인</button>
                    <button type="button" class="findmodal-button" data-dismiss="modal">돌아가기</button>
                </div>
              </div>
            </div>
          </div>
</body>
</html>