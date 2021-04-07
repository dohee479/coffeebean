<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<%@ include file="/WEB-INF/views/layout/sidebar.jsp" %>

<div id="delete-account" style="width:800px; margin-top: 100px; margin-left:100px;">
	<h3 style="font-weight:bold;">회원탈퇴 하기</h3>
	<hr/>
	
	<!--후기 Accordion UI-->
	<div class="delete-member"
	    style="margin-top: 50px; height: 200px; border: 1px solid #ced4da;
	    display: flex;">
		    <div id="delete-text"
		    style="width:30%; line-height:200px; border-right: 1px solid #ced4da; text-align: center; background-color:#f8f9fa">
		        <p style="font-weight:bold;">남기실 말씀</p>
		    </div>
		    <div id="delete-input-text"
		    style="width:70%; text-align: center; margin-top: 20px;">
		        <textarea class="input-content" wrap="off" placeholder="내용을 입력하세요."
		        style="width:90%; height: 90%; resize: none;"></textarea>
		    </div>
		</div>
		<div style="text-align: center; margin-top: 50px;">
		    <button type="button" class="btn btn-outline-secondary button-to-modal" data-toggle="modal" data-target=".update-modal">회원탈퇴</button>
		</div>
		
		
		<!--    탈퇴 모달    -->
		<form class="modal fade update-modal"  data-backdrop="static" method="post" action="${pageContext.request.contextPath}/mypage/delete-account">
		  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h3 class="modal-title">회원탈퇴</h3>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		            <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <p>정말로 탈퇴하시겠습니까?</p>
		      </div>
		      <div class="modal-footer" >
		        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">아니오</button>
		        <button type="submit" onclick="alert('삭제되었습니다.');" class="btn btn-danger">예</button>
		      </div>
		    </div>
		  </div>
	</form>
</div>

</div>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>