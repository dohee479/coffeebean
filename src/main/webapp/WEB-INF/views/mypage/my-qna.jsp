<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<%@ include file="/WEB-INF/views/layout/sidebar.jsp" %>

<div id="mydetail-qna">
	<div class="accordion" id="myqnaaccordionExample">
	  <h3>나의 상품문의</h3>
	  <hr/>
	  <div class="card">
	    <div class="card-header" id="headingOne">
	      <h2 class="mb-0">
	        <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
	         <span id="qna-index">1</span>
	         <span id="qna-title">상품의 유효기간이 언제까지 인가요?</span>
	         <span id="qna-date">2021-03-22</span>
	        </button>
	      </h2>
	    </div>
	    <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#myqnaaccordionExample">
	      <div class="card-body">
	        <strong>Q : </strong><span class="title">커피를 가끔 먹어서 오래두고 먹을 것 같은데 유효기간이 긴가요?</span>
	        <div class="answer">
	          <strong>A :</strong> 네 생산일로부터 7개월 동안은 신선한 원두를 드실 수 있습니다. 감사합니다.
	        </div>
	        <div class="buttons">
	          <button type="button" class="btn btn-outline-secondary button-to-modal" data-toggle="modal" data-target=".update-modal">수정</button>
	          <button type="button" class="btn btn-outline-secondary button-to-modal" data-toggle="modal" data-target=".delete-modal">삭제</button>
	        </div>
	        
	      </div>
	    </div>
	  </div>
	  <%--
	  <div class="card">
	    <div class="card-header" id="headingTwo">
	      <h2 class="mb-0">
	        <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
	          <span>정말 원산지가 케냐인가요?</span>
	        </button>
	      </h2>
	    </div>
	    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#myqnaaccordionExample">
	      <div class="card-body">
	        어떻게 믿죠?
	      </div>
	    </div>
	  </div>
	  <div class="card">
	    <div class="card-header" id="headingThree">
	      <h2 class="mb-0">
	        <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
	        <span>신맛이 어느정도인가요?</span>
	        </button>
	      </h2>
	    </div>
	    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#myqnaaccordionExample">
	      <div class="card-body">
	        식초보다 시나욤
	      </div>
	    </div>
	  </div>
	  --%>
	</div>
	<button id="regbutton"type="button" class="btn btn-light" data-toggle="modal" data-target="#mystaticBackdrop">
	  상품문의 글쓰기
	</button>
	
	<!--Modal-->
	<div class="modal fade" id="mystaticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h3 class="modal-title">상품문의 글쓰기</h3>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	            <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <input type="text" class="input-title" placeholder="제목을 입력하세요.">
	        <textarea class="input-content" wrap="physical" placeholder="내용을 입력하세요."></textarea>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
	        <button type="button" class="btn btn-danger" data-dismiss="modal">등록</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!--    수정, 삭제 모달 묶음    -->
	<div class ="update-delete-modal">
	  <!--    수정 모달    -->
	<div class="modal fade update-modal"  data-backdrop="static">
	  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h3 class="modal-title">수정하기</h3>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	            <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <input type="text" class="input-title" placeholder="수정할 제목을 입력하세요.">
	        <textarea class="input-content" wrap="physical" placeholder="수정할 내용을 입력하세요."></textarea>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
	        <button type="button" class="btn btn-danger" data-dismiss="modal">등록</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!--    삭제 모달    -->
	<div class="modal fade delete-modal" data-backdrop="static">
	  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h3 class="modal-title">글삭제</h3>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	            <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	          <h2>정말 삭제하시겠습니까?</h2>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
	        <button type="button" class="btn btn-danger" data-dismiss="modal">예</button>
	      </div>
	    </div>
	  </div>
	</div>
	</div>
	
	<!--    수정, 삭제 모달 묶음  종료  -->
</div>
</div>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>