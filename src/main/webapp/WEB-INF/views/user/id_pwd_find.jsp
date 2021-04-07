<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>
<form method="post" class="find-body" novalidate>
   	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
   	
           <div class="find-content">
                <div class="mt-4">
                    <table class="find-table_1">
                        <h6 class="find-table_h">아이디 찾기</h6>
                        <tr>
                            <th style="border-top: solid 1px #343a40;">이름</th><td style="border-top: solid 1px #343a40;"><input type="text" name="id_user_name" id="id_user_name"></td>
                        </tr>
                        <tr>

                            <th>이메일</th><td><input style="width:19.5em;" type="email" name="user_email" id="user_email"><select name="email" id="email">
                                <option value="">직접입력</option>
                                <option value="@naver.com">@naver.com</option>
                                <option value="@daum.net">@daum.net</option>
                                <option value="@gmail.com">@gmail.com</option>

                              </select></td>
                        </tr>
                    </table>
                    <div class="find-lastbutton"><button  type="button" id="id_find_button" class="find-button1">아이디 찾기</button></div>
                </div>
                <div class="mt-4">
                    <table class="find-table_1">
                        <h6 class="find-table_h">비밀번호 찾기</h6>
                        <tr>
                            <th style="border-top: solid 1px #343a40;">아이디</th><td style="border-top: solid 1px #343a40;"><input type="text" id="user_id"></td>
                        </tr>
                        <tr>
                            <th>이름</th><td><input type="text" id="pwd_user_name"></td>
                        </tr>
                    </table>
                    <div class="find-lastbutton"><button type="button" id="password_find_button" class="find-button2">비밀번호 찾기</button></div>
                </div>
           </div> 
           
            
        </form>

       
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
                          <tr><th style="border-top: solid 1px #343a40;">아이디</th><td style="border-top: solid 1px #343a40;" id="findId"></td></tr>
                          <tr><th>이름</th><td id="findName"></td></tr>               
                          <tr><th>이메일</th><td><span name="findEmail" id="findEmail"></span><button type="button" class="find-small_button" id="idsubmit">발송</button></td></tr>
                      </table>
                      <input type="hidden" name="userId" id="userId"/>
                      <span class="find-span">회원 이메일로 아이디를 보내드립니다.</span>
                  </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="findmodal-button" style="background-color: rgb(51,51,51);" onclick=location.href="${pageContext.request.contextPath}/user/login">로그인</button>
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
                            <tr><th style="border-top: solid 1px #343a40;">아이디</th><td style="border-top: solid 1px #343a40;" id="find_pwd_id"></td></tr>
                            <tr><th>이메일</th><td><span id="find_pwd_email"></span><button type="button" class="find-small_button" id="pwdsubmit">발송</button></td></tr>
                        </table>
                        <span class="find-span">회원 이메일로 임시 비밀번호를 보내드립니다.<br>임시 비밀번호로 로그인 후, 새 비밀번호로 변경하시기 바랍니다.</span>
                    </div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="findmodal-button" style="background-color: rgb(51,51,51);" onclick=location.href="${pageContext.request.contextPath}/user/login">로그인</button>
                    <button type="button" class="findmodal-button" data-dismiss="modal">돌아가기</button>
                </div>
              </div>
            </div>
          </div>
  </div>
  
  <script>
  
  	$('#id_find_button').on("click",function(){
  		const formData = new FormData();
  		const user_name=$("#id_user_name").val();
  		const user_email=$("#user_email").val()+$("#email").val();
  		formData.append("user_name",user_name);
  		formData.append("user_email",user_email);
  		$.ajax({
  			url:"/kong/user/id_find?${_csrf.parameterName}=${_csrf.token}",
  			data:formData,
  			method:"post",
  			cache:false,
  			processData:false,
  			contentType:false,
  			
  		}).then(data=>{
  			if(data.findIdchk==="false"){
  				alert("이름과 이메일을 확인해주세요.");
  			}
  			else{
  				var find_id=data.find_id;
  				var l=find_id.length;
  				var num=l/2;
  				var hide_id=find_id.substr(0,num);
  				
  				for(var i=0;i<l-num;i++){
  					hide_id=hide_id+"*";
  				}
  				
  				
  				
  				$('#findId').html(hide_id);
  				$('#findName').html(user_name);
  				$('#findEmail').html(user_email);
  				$('#userId').val(data.find_id);
  				console.log(find_id);
  				$('#findidmodal').modal("show");
  			}
			
  		})  		
  	});
  	
  	$('#password_find_button').on("click",function(){
  		const formData = new FormData();
  		const user_id=$("#user_id").val();
  		const user_name=$("#pwd_user_name").val();
  		formData.append("user_id",user_id);
  		formData.append("user_name",user_name);
  		$.ajax({
  			url:"/kong/user/pwd_find?${_csrf.parameterName}=${_csrf.token}",
  			data:formData,
  			method:"post",
  			cache:false,
  			processData:false,
  			contentType:false
  		}).then(data=>{
  			if(data.findPwdchk==="false"){
  				alert("아이디와 이름을 확인해주세요.");
  			}
  			else{
  				$('#find_pwd_id').html(user_id);
  				$('#find_pwd_email').html(data.find_email);
  				
  				$('#findpwdmodal').modal("show");
  			}
			
  		})  		
  	});
  	
  	 $('#idsubmit').on("click",function(){
  		const formData = new FormData();
  		const user_name=$("#id_user_name").val();
  		const user_email=$("#user_email").val()+$("#email").val();
  		const user_id=$("#userId").val();
  		formData.append("user_name",user_name);
  		formData.append("user_email",user_email);
  		formData.append("user_id",user_id);
  		$.ajax({
  			url:"/kong/user/idSendingMail?${_csrf.parameterName}=${_csrf.token}",
  			data:formData,
  			method:"post",
  			cache:false,
  			processData:false,
  			contentType:false,
  		}).then( (data) => {
  			if(data == "success") {
	  			alert("아이디를 이메일로 발송하였습니다.");
	  			location.reload();
  			}
  		})
  		
  	})
  	
  	
  	$('#pwdsubmit').on("click",function(){
  		const formData = new FormData();
  		const user_id=$("#user_id").val();
  		const user_name=$("#pwd_user_name").val();
  		const user_email=$('#find_pwd_email').html();
  		formData.append("user_id",user_id);
  		formData.append("user_email",user_email);
  		formData.append("user_name",user_name);
  		$.ajax({
  			url:"/kong/user/pwdSendingMail?${_csrf.parameterName}=${_csrf.token}",
  			data:formData,
  			method:"post",
  			cache:false,
  			processData:false,
  			contentType:false,
  		}).then( (data) => {
  			if(data == "success") {
	  			alert("임시비밀번호를 이메일로 발송하였습니다.");
	  			location.reload();
  			}
  		})
  	})
  </script>
  
  	<%-- <script src="${pageContext.request.contextPath}/resources/js/user/id_pwd_find.js"></script> --%>
 <%@ include file="/WEB-INF/views/layout/footer.jsp" %>