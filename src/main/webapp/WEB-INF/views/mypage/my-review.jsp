<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<%@ include file="/WEB-INF/views/layout/sidebar.jsp" %>

<div id="detail-myreview">
 <h3>나의 후기</h3>
 <hr/>
 <!--후기 Accordion UI-->
  <div class="accordion" id="myaccordionExample">
      <div class="card">
        <div class="card-header" id="myheadingOne">
          <h2 class="mb-0">
            <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#mycollapseOne" aria-expanded="true" aria-controls="mycollapseOne">
             <span id="review-index">1</span>
	         <span id="review-title">후기1</span>
	         <span id="review-grade"><p>★★★★☆</p></span>
	         <span id="review-date">2021-03-22</span>
            </button>
          </h2>
        </div>
    
        <div id="mycollapseOne" class="collapse" aria-labelledby="myheadingOne" data-parent="#myaccordionExample">
          <div class="card-body">
            <div class="modal-buttons">
              <span>ㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴsadsaㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴsadsaㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴsadsaㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴsadsaㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴsadsaㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴsadsaㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴsadsaㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴsadsaㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴsadsaㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴsadsaㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴsadsaㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴsadsaㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴsadsaㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴsadsaㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴsadsaㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴsadsaㅇ</span>
              <div class="update-delete-buttons">
                <button id="myreview-update-button" type="button" class="btn btn-outline-secondary button-to-modal" data-toggle="modal" data-target=".update-modal">수정</button>
                <button id="myreview-delete-button" type="button" class="btn btn-outline-secondary button-to-modal" data-toggle="modal" data-target=".delete-modal">삭제</button>
              </div>
            </div>
          </div>
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
	        <h3 class="modal-title">삭제하기</h3>
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

<!-- 상품 후기 글쓰기 모달 -->
<div class="modal fade create-review-modal" data-backdrop="static">
	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
	  <div class="modal-content">
	    <div class="modal-header">
	      <h3 class="modal-title">상품후기 쓰기</h3>
	      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	      </button>
	    </div>
	    <div class="modal-body">
	      <form id="star-radio">
	        <span>평점: </span>
	        <label class="radio-inline">
	          <input type="radio" name="optradio" class="select-stars ml-2">
	          <span id="star1" class="shape-stars">★</span>
	        </label>
	        <label class="radio-inline">
	          <input type="radio" name="optradio" class="select-stars ml-2" >
	          <span id="star2" class="shape-stars">★★</span>
	        </label>
	        <label class="radio-inline">
	          <input type="radio" name="optradio" class="select-stars ml-2">
	          <span id="star3" class="shape-stars">★★★</span>
	        </label>
	        <label class="radio-inline">
	          <input type="radio" name="optradio" class="select-stars ml-2">
	          <span id="star4" class="shape-stars">★★★★</span>
	        </label>
	        <label class="radio-inline">
	          <input type="radio" name="optradio" class="select-stars ml-2">
	          <span id="star5" class="shape-stars">★★★★★</span>
	        </label>
	      </form>
	      <input type="text" class="input-title" placeholder="제목을 입력하세요.">
	      <textarea class="input-content" wrap="physical" placeholder="내용을 입력하세요."></textarea>
	      <div class="file-upload mt-4">
	        <label for="selete-file">사진 첨부: </label>
	        <input type="file" id="selete-file">
	      </div>
	    </div>
	    <div class="modal-footer">
	      <button type="button" class="btn btn-outline-secondary" id="asdasfas" data-dismiss="modal">취소</button>
	      <button type="button" class="btn btn-danger" data-dismiss="modal">등록</button>
	    </div>
	  </div>
	</div>
</div>
<!-- 상품 후기 글쓰기 모달 종료 -->

</div>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>