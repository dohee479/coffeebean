
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>
    <form id="join" class="s_content" method="post" novalidate>
    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <div class="s_form_container s_sign_up_container">
                <h1>회원가입</h1>
                <h4 class="s_u_h4">기본 정보</h4>
                <table class="s_table_1">
                    <tr>
                        <th style="border-top: solid 1px #343a40;">아이디</th>
                        <td style="border-top: solid 1px #343a40;">
                            <input type="text" id="user_id" name="user_id"><br>
                            <span id="error_user_id"class="text-danger small"></span>
                            
                        </td>
                    </tr>
                    <tr>
                        <th>비밀번호</th>
                        <td><input type="password" name="user_password" id="user_password"><br>
                        	<span id="error_user_password1"class="text-danger small"></span>
                        </td>
                    </tr>
                    <tr>
                        <th>비밀번호 확인</th>
                        <td><input type="password" name="user_password2" id="user_password2"><br>
                        	<span id="error_user_password2"class="text-danger small"></span>
                        </td>
                        
                        
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td><input type="text" name="user_name" id="user_name"><br>
                        	<span id="error_user_name"class="text-danger small"></span>
                        
                        </td>
                    </tr>
                    <tr>
                        <th>이메일</td>
                        <td><input type="email" style="width:26em" name="user_email" id="user_email">
                        <select class="s_select_font" name="mail" id="mail">
                            <option value="">직접입력</option>
                            <option value="@naver.com">@naver.com</option>
                            <option value="@daum.net">@daum.net</option>
                            <option value="@gmail.com">@gmail.com</option>
                          </select><br>
                             <span id="error_user_email" class="text-danger small"></span>                      
                          </td>
                    </tr>
                    <tr>
                        <th>휴대폰번호</th>
                        <td><input type="text" placeholder="-없이 입력하세요." name="user_tel" id="user_tel"><br>
                             <span id="error_user_tel" class="text-danger small"></span>
                        
                        </td>
                    </tr>
                    <tr>
                        <th>주소</th>
                        <td>
                            <input type="text" style="width:26em" name="user_zipcode" id="user_zipcode"  placeholder="'-'없이 입력해주세요."> <button class="s_select_font">우편번호검색</button><br>
                       		 <span id="error_user_zipcode" class="text-danger small"></span><br>
                            <input type="text" name="user_address" id="user_address"/><br>
                            <input type="text" name="user_detail_address" id="user_detail_address"/>
                        </td>
                    </tr>


                </table>
                <button type="button" id="signIn_mv" onclick=location.href="${pageContext.request.contextPath}/user/login">취소</button>
                <button type="button" id="joinBtn" style="background-color: rgb(102,102,102);">회원가입</button>
            </div>
    </form>
    
	<script>
	$('#joinBtn').on("click",function(){
		var result=true;
		const user_id=$('#user_id').val();
		const user_password=$('#user_password').val();
		const user_password2=$('#user_password2').val();
		const user_name=$('#user_name').val();
		const user_email=$('#user_email').val()+$('#mail').val();
		const user_tel=$('#user_tel').val();
		const user_zipcode=$('#user_zipcode').val();
		const user_address=$('#user_address').val();
		const user_detail_address=$('#user_detail_address').val();

   		if(user_id===""){
		result=false;
		$("#error_user_id").html("필수사항 입니다.");
		}else if(user_id.length<8){
			result=false;
			$("#error_user_id").html("최소 8자 이상 입력해야 합니다..");
		}else if(user_id.length>15){
			result=false;
			$("#error_user_id").html("최대 15자 까지만 입력해야 합니다.");
		}else{
			$("#error_user_id").html("");
		}
		
		if(user_password===""){
			result=false;
			$("#error_user_password1").html("필수사항 입니다.");
		}else if(user_password.length<8){
			result=false;
			$("#error_user_password1").html("최소 8자 이상 입력해야 합니다..");
		}else if(user_password.length>15){
			result=false;
			$("#error_user_password1").html("최대 15자 까지만 입력해야 합니다.");
		}else{
			$("#error_user_password1").html("");
		}
		
		
		if(user_password!==user_password2){
			result=false;
			$("#error_user_password2").html("비밀번호가 다릅니다.");
		}else{
			$("#error_user_password2").html("");
		}
		
		if(user_name===""){
			result=false;
			$("#error_user_name").html("필수사항 입니다.");
		}else{
			$("#error_user_name").html("");
		}
		
		if(user_email===""){					 
			result=false;
			$("#error_user_email").html("필수사항 입니다.")
		} else{
			var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

			if (!re.test(user_email)) {
				$("#error_user_email").html("이메일 형식이 아닙니다.");
				return false;
			}
			else{
				$("#error_user_email").html("");
			}    			
		}
		
		
		
		
		if(user_tel===""){
			result=false;
			$("#error_user_tel").html("필수사항 입니다.");
		} else{
			var regPhone = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
			 if(!regPhone.test(user_tel)){
				 $("#error_user_tel").html("휴대폰 형식이 아닙니다.");
					return false;
			 }
			 else{
				 $("#error_user_tel").html("");
			 }
			 
			}
		if(user_zipcode!==""){
			var regzipcode=/^\d{5}$/;
			if(!regzipcode.test(user_zipcode)){
				$("#error_user_zipcode").html("우편번호 형식이 아닙니다.");
				return false;
			}else{
				$("#error_user_zipcode").html("");
			}
		}
		
		if(result){
			const formData=new FormData();
			formData.append("user_id",user_id);
			formData.append("user_password",user_password);
			formData.append("user_name",user_name);
			formData.append("user_email",user_email);
			formData.append("user_tel",user_tel);
			formData.append("user_zipcode",user_zipcode);
			formData.append("user_address",user_address);
			formData.append("user_detail_address",user_detail_address);
			$.ajax({
				url:"/kong/user/join?${_csrf.parameterName}=${_csrf.token}",
				data:formData,
				method:"post",
				cache:false,
				processData:false,
				contentType:false
			}).then(data=>{
				if(data.alreadyId==="alreadyId"){
					alert("이미 존재하는 아이디입니다.");
				}
				else if(data.alreadyEmail==="alreadyEmail"){
					alert("이미 존재하는 이메일입니다.");
				}
				else{
					alert("회원가입 완료되었습니다.");
					location.replace("${pageContext.request.contextPath}/user/login");
				}
				
			})
	}
	});
		</script>
		
	<%-- <script src="${pageContext.request.contextPath}/resources/js/user/join.js"></script> --%>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>