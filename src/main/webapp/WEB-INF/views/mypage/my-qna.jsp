<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<%@ include file="/WEB-INF/views/layout/sidebar.jsp" %>

<style>
	.error{
		font-size:0.8em;
	}
</style>
<script>
	function validate(){
		const utitle=$("#update-title").val();
		const ucontent=$("#update-content").val();
		if(utitle===""){
			$("#errorTitle").html("필수사항 입니다.");
			event.preventDefault();
		}
		else{
			$("#errorTitle").html("");
		}
		if(ucontent===""){
			$("#errorContent").html("필수사항 입니다.");
			event.preventDefault();
		}
		else{
			$("#errorContent").html("");
		}
	}
</script>

<div id="mydetail-qna">
	<div class="accordion" id="qna-accordion">
	  <h3>나의 상품문의</h3>
	  <hr/>
	  
	<c:forEach var="question" items="${list}" varStatus="status">
	  	<div class="card">
		    <div class="card-header" id="heading${status.count}">
		      <h2 class="mb-0">
		        <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse${status.count}" aria-expanded="true" aria-controls="collapse${status.count}">
			        <span id="qna-index">${status.count}</span>
				    <span id="qna-title">${question.question_title}</span>
			        <span id="product-number">상품번호: ${question.products_product_id}</span>
			        <span id="qna-date">${question.question_date}</span>
		        </button>
		      </h2>
		    </div>
		    <div id="collapse${status.count}" class="collapse" aria-labelledby="heading${status.count}" data-parent="#qna-accordion">
		      <div class="card-body">
		      	<a href="${pageContext.request.contextPath}/product/detail/${question.products_product_id}">상품바로가기</a>
		        <strong>Q : </strong><span class="title">${question.question_content}</span>
		        <div class="answer">
		          <strong>A :</strong> 답변 대기중.....
		        </div>
		        <div class="buttons">
		          <button type="button" class="btn btn-outline-secondary button-to-modal" data-toggle="modal" data-target=".update-modal${status.count}">수정</button>
		          <button type="button" class="btn btn-outline-secondary button-to-modal" data-toggle="modal" data-target=".delete-modal${status.count}">삭제</button>
		        </div>
		        
		      </div>
		    </div>
	  	</div>
	  	
		 <!--    수정, 삭제 모달 묶음    -->
		<div class ="update-delete-modal">
		  <!--    수정 모달    -->
		<div class="modal fade update-modal${status.count}"  data-backdrop="static">
		  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h3 class="modal-title">수정하기</h3>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		            <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <form name="update-form" method="post" action="my-qna-update" onsubmit="validate()">
		      	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			      <div class="modal-body">
			        <input id="update-title" type="text" class="input-title" name="question_title" value="${question.question_title}" placeholder="수정할 제목을 입력하세요.(최대 30자)" maxlength="30">
			        <span id="errorTitle" class="text-danger error"></span>
			        <br>
			        <textarea id="update-content" class="input-content" name="question_content" wrap="physical"  placeholder="수정할 내용을 입력하세요.(최대 300자)" maxlength="300">${question.question_content}</textarea>
			        <span id="errorContent" class="text-danger error"></span>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
			        <button type="submit" name="question_id" value="${question.question_id}" class="btn btn-danger">등록</button>
			      </div>
		      </form>
		    </div>
		  </div>
		</div>
	
		<!--    삭제 모달    -->
		<div class="modal fade delete-modal${status.count}" data-backdrop="static">
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
		      <form method="post" action="my-qna-delete">
		      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
			        <button type="submit" name="question_id" value="${question.question_id}" class="btn btn-danger">예</button>
			      </div>
		      </form>
		    </div>
		  </div>
		</div>
		</div>
		<!--    수정, 삭제 모달 묶음  종료  -->
	</c:forEach>
	</div>
	
	
</div>
</div>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>