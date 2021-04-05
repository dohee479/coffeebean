<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<%@ include file="/WEB-INF/views/layout/sidebar.jsp" %>

<div id="detail-myreview">
 <h3>나의 후기</h3>
 <hr/>
 <!--후기 Accordion UI-->
  <div class="accordion" id="myaccordionExample">
  <c:forEach var="review" items="${reviewList}">
      <div class="card">
        <div class="card-header" id="myheading${review.review_id}">
          <h2 class="mb-0">
            <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#mycollapse${review.review_id}" aria-expanded="true" aria-controls="mycollapse${review.review_id}">
	         <span id="review-title">${review.review_title}</span>
	         <span id="review-grade"><p>${review.review_grade}</p></span>
	         <span id="review-date">${review.review_date}</span>
            </button>
          </h2>
        </div>
    
        <div id="mycollapse${review.review_id}" class="collapse" aria-labelledby="myheading${review.review_id}" data-parent="#myaccordionExample">
          <div class="card-body">
            <div class="modal-buttons">
              <form>
              	<span id="review-content">${review.review_content}</span>
	            <div class="update-delete-buttons">
	              <button id="myreview-update-button" type="button" class="btn btn-outline-secondary button-to-modal" data-toggle="modal" data-target=".update-modal${review.review_id}">수정</button>
	              <button id="myreview-delete-button" type="button" class="btn btn-outline-secondary button-to-modal" data-toggle="modal" data-target=".delete-modal${review.review_id}">삭제</button>
	            </div>
              </form>
            </div>
          </div>
        </div>
        <!--    수정, 삭제 모달 묶음    -->
		<div class ="update-delete-modal">
			<!--    수정 모달    -->
			<div class="modal fade update-modal${review.review_id}"  data-backdrop="static">
			  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h3 class="modal-title">수정하기</h3>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			            <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			          <form method="post" action="${pageContext.request.contextPath}/review/update?${_csrf.parameterName }=${_csrf.token }" enctype="multipart/form-data">
			          <input type="hidden" name="review_id" value="${review.review_id}"/>
			          <input type="hidden" name="product_id" value="0"/>
				          <div class="modal-body">
				            <input type="text" class="input-title" placeholder="수정할 제목을 입력하세요." name="review_title" value="${review.review_title}"/>
				            <textarea class="input-content" wrap="physical" name="review_content"></textarea>
				           	<div class="file-upload mt-4">
					          <label for="selete-file">사진 첨부: </label>
					          <input type="file" id="selete-file" name="review_attach">
					        </div>
				          </div>
				          <div class="modal-footer">
				            <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
				            <button type="submit" class="btn btn-danger">등록</button>
				          </div>
			          </form>
			    </div>
			  </div>
			</div>
		
			<!--    삭제 모달    -->
			<div class="modal fade delete-modal${review.review_id}" data-backdrop="static">
			  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h3 class="modal-title">삭제하기</h3>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			            <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			          <h2>정말 삭제하시겠습니까?</h2>
			      </div>
			      <form method="post" action="${pageContext.request.contextPath}/review/delete">
		            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		            <input type="hidden" name="product_id" value="0"/>
			          <div class="modal-footer">
			            <button type="button" class="btn btn-outline-secondary" id="asdasfas" data-dismiss="modal">취소</button>
			            <button type="submit" class="btn btn-danger" name="review_id" value="${review.review_id}">예</button>
			          </div>
			      </form>
			    </div>
			  </div>
			</div>
		</div>
      </div>
      </c:forEach>
  </div>
</div>



<!--    수정, 삭제 모달 묶음  종료  -->
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>