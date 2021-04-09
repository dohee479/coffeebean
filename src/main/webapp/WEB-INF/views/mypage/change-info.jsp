<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<%@ include file="/WEB-INF/views/layout/sidebar.jsp" %>

	<div id="change-div">
            <form id="change-info" method="post" action="${pageContext.request.contextPath}/mypage/change-info" onsubmit="validateinfo()">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <h3>기본정보</h3>
                <div class="wrapper1">
                    <div class="input-elements"></div>
                    <div class="input-id">아이디</div>
                    <div class="change-id">
                        <input type="text" name="user_id" value="${user_id}" readonly>
                    </div>
                    <div class="input-name">이름</div>
                    <div class="change-name">
                        <input type="text" name="user_name" id="user_name" value="${user_name}"><br>
                        <span id="error_user_name" class="text-danger small"></span>
                    </div>
                    <div class="input-pno">휴대폰번호</div>
                    <div class="change-pno">
                        <input type="text"  name="user_tel" id="user_tel" value="${user_tel}"><br>
                        <span id="error_user_tel" class="text-danger small"></span>
                    </div>
                    <div class="input-location">주소</div>
                    <div class="change-location">
                        <input type="text" name="user_zipcode" id="user_zipcode" id="user_zipcode" value="${user_zipcode}" placeholder="우편번호" readonly>
                        <button type="button" id="change-location-button" onclick="sample6_execDaumPostcode()" class="s_select_font">우편번호 찾기</button>
                        <div class="location-info mt-2 "><input style="width:95%;" type="text" name="user_address" id="user_address" value="${user_address }" placeholder="주소" readonly></div>
                        <div class="location-info mt-2 "><input style="width:95%;" type="text" name="user_detail_address" id="user_detail_address" value="${user_detail_address}" placeholder="상세주소"></div><br>
                        <span id="error_user_address" class="text-danger small"></span>
                        <input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
                    </div>
                    
                </div>    
                <div class="button-input">
                    <button id="change-info-button" class="change-info-buttons" type="submit">정보수정</button>
                </div>
            </form>
    
            <form id="change-pw" method="post" action="${pageContext.request.contextPath}/mypage/change-pwd" onsubmit="validatepwd()">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <h3>비밀번호 변경</h3>
                <div class="wrapper2">
                    <div class="input-elements2"></div>
                    <div class="input-pw">현재 비밀번호</div>
                    <div class="current-pw">
                        <input type="password" name="user_password" id="user_password">
                    </div>
                    <div class="input-newpw">새 비밀번호</div>
                    <div class="new-pw">
                        <input type="password" name="new_password1" id="new_password1"><br>
                        <span id="error_new_password1" class="text-danger small"></span>
                    </div>
                    <div class="input-pwcheck">새 비밀번호 확인</div>
                    <div class="pw-check">
                        <input type="password" name="new_password2" id="new_password2"><br>
                        <span id="error_new_password2" class="text-danger small"></span>
                    </div>
                </div>
    
                <div class="button-input">
                    <button id="change-pwd-button" class="change-info-buttons" type="submit">비밀번호 변경</button>
                </div>
            </form>
    </div>
 </div>
    <script>
    	const validateinfo=() =>{
    		event.preventDefault();
    		var result=true;
    		const user_name=$('#user_name').val();;
    		const user_tel=$('#user_tel').val();
    		const user_zipcode=$('#user_zipcode').val();
    		const user_address=$('#user_address').val();
    		const user_detail_address=$('#user_detail_address').val();
    		
    		if(user_name===""){
    			result=false;
    			$("#error_user_name").html("필수사항 입니다.");
    		}else{
    			$("#error_user_name").html("");
    		}
    		
    		console.log(user_tel);
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
    		if(user_zipcode===""||user_address===""||user_detail_address===""){
    			result=false;
    			$("#error_user_address").html("필수사항 입니다.");
    		}else{
    			$("#error_user_address").html("");
    		}
    		
    		if(result){
				$("#change-info")[0].submit();
			}
    	}
    
    	const validatepwd=() =>{
    		event.preventDefault();
    		var result=true;
			const user_password=$('#user_password').val();
			const new_password1=$('#new_password1').val();
			const new_password2=$('#new_password2').val();
			
			if(new_password1===""){
				result=false;
				$("#error_new_password1").html("필수사항 입니다.");
			}else if(new_password1.length<8){
				result=false;
				$("#error_new_password1").html("최소 8자 이상 입력해야 합니다..");
			}else if(new_password1.length>15){
				result=false;
				$("#error_new_password1").html("최대 15자 까지만 입력해야 합니다.");
			}else{
				$("#error_new_password1").html("");
			}
			
			if(new_password1!==new_password2){
				result=false;
				$("#error_new_password2").html("비밀번호가 다릅니다.");
			}else{
				$("#error_new_password2").html("");
			}
			
			if(result){
				$("#change-pw")[0].submit();
			}
    	}
    </script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/user/address.js"></script>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>