<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/layout/header.jsp" %>

<script src="<%=application.getContextPath() %>/resources/js/product/detail/detail.js"></script>

<div class="container" >
    <div class="content_top">
        <div class="detail_item_img" >
            <img src="${pageContext.request.contextPath}/product/downloadImg?product_id=${product.product_id}">
        </div>
        <div class="item_info_box">
            <div class="item_title">
                <span>${product.product_title}</span>
            </div>  
            <div class="item_description">
                <dl class="desc">
                    <dt>맛&향</dt>
                    <dd>${product.product_taste}</dd>
                </dl>
                <dl class="price">
                    <dt>판매가</dt>
                    <dd class="price" id="price" name="price">${product.product_price}</dd>
                </dl>
                <dl class=origin>
                    <dt>원산지</dt>
                    <dd>${product.product_country}</dd>
                </dl>
                <dl class=volume>
                    <dt>용량</dt>
                    <dd>200g, 500g, 1kg</dd>
                </dl>
            </div> 
            <form method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
            <input type="hidden" name="product_id" value="${product.product_id}" id="product_id"/> <%-- value="${product_id}" --%>
            <input type="hidden" name="price" value="${product.product_price}"/>
              <div class=select_option>
                  <dl class="option">
                      <dt>용량선택</dt>                
                      <dd>
                          <select id = "volume" name="volume" class="custom-select" onchange="change_price()" style="width: 15em;">
                              <option selected value="0" disabled="true">용량을 선택하세요.</option>
                              <option value="200">200g</option>
                              <option value="500">500g + ${product.product_price}원 </option>
                              <option value="1000">1000g + ${product.product_price *3}원 </option>
                          </select>
                      </dd>
                      <dt>분쇄선택</dt>                
                      <dd>
                          <select id = "mesh" name="grind" class="custom-select" onchange="change_mash()" style="width: 15em;">
                              <option selected value="0" disabled="true">분쇄유형을 선택하세요.</option>
                              <option value="1">홀빈(분쇄안함)</option>
                              <option value="2">프렌치프레스 분쇄</option>
                              <option value="3">핸드드립 분쇄</option>
                              <option value="4">더치용 분쇄</option>
                          </select>
                      </dd>
                  </dl>
              </div>  

              <div class="option_box">
                  <div class="selected_volume">
                      <span class="dt">선택용량 : </span><span class="dd"></span>
                      <!-- <span class="dd"><strong>8300</strong></span> -->
                  </div>
          
                  <div class="selected_mashed">
                      <span class="dt">선택분쇄 : </span><span class="dd"></span>
                  </div>
              </div>

              <div class="total_box">
	              <!-- <input class="sale_count" type="number" min="1" max="99" name="count"> -->
                <div class="count_box">
                  <div class="minus">-</div>
                    <input type="text" name = "count" class="count_value" value=1 readonly/>
                  <div class="plus">+</div>
                </div>
	
	              <div class="price_box">
	                <div class="total_price">
	                  <span class="dt"><strong>총 합계금액</strong></span>
	                  <span class="dd">0</span>
	                  <strong>원</strong>
	                </div>
	              </div> 
	            </div>
	            
	            <!-- 장바구니 모달 시작-->
		        <div class="modal fade" id="cart" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		          <div class="modal-dialog modal-dialog-centered" role="document">
		            <div class="modal-content">
		              <div class="modal-header">
		                <span class="modal-title" id="exampleModalLabel">장바구니 담기</span>
		                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                  <span aria-hidden="true">&times;</span>
		                </button>
		              </div>
		              <div class="modal-body">
		                <div class="cart_img"><img src="<%=application.getContextPath()%>/resources/images/product/detail/cart.png"></div>
		                <span class="message1">상품을 장바구니에 추가합니다.</span>
		                <span class="message2"></span>
		                
		                <div class="button-group">
		                  <button class="cancel" data-dismiss="modal" aria-label="Close">취소</button>
		                  <button type="submit" class="gocart" formaction="<%=application.getContextPath()%>/mypage/addBasket">확인</button>
		                </div>
		    
		              </div>
		            </div>
		          </div>
		        </div>
	            
              <div class="btn_choice_box">
                  <button type="button" class="btn btn-light button" data-toggle="modal" data-target="#compare">비교하기</button>
                  <input type="button" onclick="checkOption()" id="cart" name="cart" value="장바구니" class="btn btn-light button" data-toggle="modal" data-target="#" />
                  <input type="button" name="zzim" value="찜하기" class="btn btn-light button" formaction="#" data-toggle="modal" data-target="#zzim"/>
                  <input type="submit" onclick="checkOption()" name="purchase" value="구매하기" class="btn btn-info button" formaction="<%=application.getContextPath() %>/order/fill_out_order"/>
                  <!-- formaction 으로 하나의 form 안에 여러 submit을 작성하기 위함 action을 따로 작성하지 않아도 됨 -->
              </div>
          </form>
        </div>

    </div> 

    <!--제품상세페이지 상단 끝-->

    <!--비교하기 모달 시작-->
      <div class="modal fade" id="compare" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">상품 비교하기</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <div class="btn-group">
                <button type="button" id="compare_all" class="btn" checked>전체상품</button>
                <button type="button" id="compare_cart" class="btn">장바구니</button>
              </div>

              <select id="compare_item" name="item" class="custom-select" >
                <option selected>비교상품을 선택하세요.</option>

            </select>

              <table class="table table-hover">
                <thead>
                  <tr>
                    <th scope="col"></th>
                    <th scope="col">케냐 A 키암부</th>
                    <th scope="col" class="compare_atribute_name">비교상품</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <th scope="row">가격</th>
                    <td>3000</td>
                    <td class="compare_atribute_price"></td>
                  </tr>
                  <tr>
                    <th scope="row">맛</th>
                    <td>신맛</td>
                    <td class="compare_atribute_taste"></td>
                  </tr>
                  <tr>
                    <th scope="row">원산지</th>
                    <td>에티오피아</td>
                    <td class="compare_atribute_origin"></td>
                  </tr>
                  <tr>
                    <th scope="row">평점</th>
                    <td>4</td>
                    <td class="compare_atribute_rate"></td>
                  </tr>
                  <tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
    </div>

        

   <!-- 찜하기 모달 시작-->
   <div class="modal fade" id="zzim" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <span class="modal-title" id="exampleModalLabel">찜하기</span>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="zzim_img"><img src="<%=application.getContextPath()%>/resources/images/product/detail/zzim.png"></div>
          <span class="message2 font-weight-bold">상품을 찜목록에 추가합니다.</span>
          
          <div class="button-group">
            <button class="cancel" data-dismiss="modal" aria-label="Close">취소</button>
            <button class="gozzim" type="button" id="gozzim">확인</button>
          </div>

        </div>
      </div>
    </div>
  </div>

    <div class="content_bottom">
       <!--상세정보 추가-->
       <ul class="nav nav-tabs " id="myTab" role="tablist">
        <li class="nav-item">
          <a class="nav-link active" id="detail-item-tab" data-toggle="tab" href="#detail-item" role="tab" aria-controls="home" aria-selected="true">상품상세정보</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="detail-delievery-tab" data-toggle="tab" href="#detail-delievery" role="tab" aria-controls="profile" aria-selected="false">배송안내</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="detail-review-tab" data-toggle="tab" href="#detail-review" role="tab" aria-controls="contact" aria-selected="false">상품후기</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="detail-qna-tab" data-toggle="tab" href="#detail-qna" role="tab" aria-controls="contact" aria-selected="false">상품문의</a>
          </li>
      </ul>
      <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="detail-item">
          <img src="downloadDetailImg?product_id=${product.product_id}"/>
        </div>
        <div class="tab-pane fade" id="detail-delievery">
          <img  src="<%=application.getContextPath()%>/resources/images/product/detail/배송안내.png"/>
        </div>
		
        <div class="tab-pane fade" id="detail-review" role="tabpanel" aria-labelledby="contact-tab">
            <!--후기 Accordion UI-->
            <div class="accordion" id="accordionExample">
			  <c:forEach var="review" items="${reviewList}">
                <div class="card">
                  <div class="card-header" id="heading${review.review_id}">
                    <h2 class="mb-0">
                      <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapse${review.review_id}" aria-expanded="false" aria-controls="collapse${review.review_id}">
                       <span>${review.review_title}</span>
                      </button>
                    </h2>
                  </div>
              
                  <div id="collapse${review.review_id}" class="collapse" aria-labelledby="heading${review.review_id}" data-parent="#accordionExample">
                    <div class="card-body">
                      <div class="modal-buttons">
                        <span>${review.review_content}</span>
                        <div class="update-delete-buttons ml-3">
                          <button type="button" class="btn btn-outline-secondary button-to-modal" data-toggle="modal" data-target=".update-modal${review.review_id}">수정</button>
                          <button type="button" class="btn btn-outline-secondary button-to-modal" data-toggle="modal" data-target=".delete-modal${review.review_id}">삭제</button>
                        </div>
                      </div>
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
			          <input type="hidden" name="product_id" value="${review.products_product_id}"/>
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
			            <h3 class="modal-title">글삭제</h3>
			            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			                <span aria-hidden="true">&times;</span>
			            </button>
			          </div>
			          <div class="modal-body">
			              <h2>정말 삭제하시겠습니까?</h2>
			          </div>
			          <form method="post" action="${pageContext.request.contextPath}/review/delete">
			          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			          <input type="hidden" name="product_id" value="${review.products_product_id}"/>
				          <div class="modal-footer">
				            <button type="button" class="btn btn-outline-secondary" id="asdasfas" data-dismiss="modal">취소</button>
				            <button type="submit" class="btn btn-danger" name="review_id" value="${review.review_id}">예</button>
				          </div>
			          </form>
			        </div>
			      </div>
			    </div>
			  </div>
			  <!--    수정, 삭제 모달 묶음  종료  -->
              </c:forEach>
            </div>
	       	<button id="review-button"type="button" class="btn btn-light" data-toggle="modal" data-target=".create-review-modal">
	            상품후기 글쓰기
	        </button>
        </div>

		<!-- 상품문의 탭 -->
        <div class="tab-pane fade" id="detail-qna" role="tabpanel" aria-labelledby="contact-tab">
              
           <c:forEach var="question" items="${list}" varStatus="status">
		  	<div class="card">
			    <div class="card-header" id="heading${status.count}">
			      <h2 class="mb-0">
			        <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse${status.count}" aria-expanded="true" aria-controls="collapse${status.count}">
			         <span id="qna-index">${status.count}</span>
			         <span id="qna-title">${question.question_title}</span>
			         <span id="qna-writer">작성자: ${question.users_user_id}</span>
			         <span id="qna-date">${question.question_date}</span>
			        </button>
			      </h2>
			    </div>
			    <div id="collapse${status.count}" class="collapse" aria-labelledby="heading${status.count}" data-parent="#detail-qna">
			      <div class="card-body">
			        <strong>Q : </strong><span class="title">${question.question_content}</span>
			        <div class="answer">
			          <strong>A :</strong> 답변 대기중.....
			        </div>
			      </div>
			    </div>
		  	</div>
		  	
		</c:forEach>
          
        <sec:authorize access="isAuthenticated()">
          <button id="regbutton"type="button" class="btn btn-light" data-toggle="modal" data-target="#product-qna-modal">
            상품문의 글쓰기
          </button> 
        </sec:authorize>
     </div>
   </div>
    
</div>
	<!-- 상품문의 글쓰기 모달 -->
	<div class="modal fade" id="product-qna-modal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h3 class="modal-title">상품문의 글쓰기</h3>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	            <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <form method="post" action="${pageContext.request.contextPath}/product/detail-qna-create">
	      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		      <div class="modal-body">
		        <input type="text" class="input-title" name="question_title" placeholder="제목을 입력하세요." maxlength="30">
		        <textarea class="input-content" name="question_content" wrap="physical" placeholder="내용을 입력하세요." maxlength="300"></textarea>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
		        <button type="submit" name="products_product_id" 
		        		value="${question.products_product_id}" class="btn btn-danger">등록</button>
		      </div>
	      </form>
	    </div>
	  </div>
	</div>

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
        <form method="post" action="${pageContext.request.contextPath}/review/create?${_csrf.parameterName }=${_csrf.token }" enctype="multipart/form-data">
        	<!-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> -->
        	<input type="hidden" name="products_product_id" value="${product.product_id}">
	        <div class="modal-body">
	          <div id="star-radio">
	            <span>평점: </span>
	            <span class="radio-inline">
	              <input type="radio" name="review_grade" class="select-stars ml-2" id="star1" value=1 checked>
	              <label for="star1" class="shape-stars">1</label>
	            </span>
	            <span class="radio-inline">
	              <input type="radio" name="review_grade" class="select-stars ml-2" id="star2" value=2>
	              <label for="star2" class="shape-stars">2</label>
	            </span>
	            <span class="radio-inline">
	              <input type="radio" name="review_grade" class="select-stars ml-2" id="star3" value=3>
	              <label for="star3" class="shape-stars">3</label>
	            </span>
	            <span class="radio-inline">
	              <input type="radio" name="review_grade" class="select-stars ml-2" id="star4" value=4>
	              <label for="star4" class="shape-stars">4</label>
	            </span>
	            <span class="radio-inline">
	              <input type="radio" name="review_grade" class="select-stars ml-2" id="star5" value=5>
	              <label for="star5" class="shape-stars">5</label>
	            </span>
	          </div>
	          <input type="text" class="input-title" placeholder="제목을 입력하세요." name="review_title">
	          <textarea class="input-content" wrap="physical" placeholder="내용을 입력하세요." name="review_content"></textarea>
	          <div class="file-upload mt-4">
	            <label for="selete-file">사진 첨부: </label>
	            <input type="file" id="selete-file" name="review_attach">
	          </div>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-outline-secondary" id="asdasfas" data-dismiss="modal">취소</button>
	          <button type="submit" class="btn btn-danger" value="등록">등록</button>
	        </div>
	   </form>
	  </div>
    </div>
  </div>
  <!-- 상품 후기 글쓰기 모달 종료 -->
<!--Modal 끝-->
  </div>
  <a id="toTopBorder" href="#">
  	<div id="toTop">TOP</div>
  </a>
  
</div>

<script>
	$('#gozzim').on("click",function(){
		const product_id=$("#product_id").val();
		console.log(product_id);
		$.ajax({
			url:"/kong/mypage/zzim_insert?${_csrf.parameterName}=${_csrf.token}",
			data:{product_id},
			method:"post",
		}).then(data=>{
			console.log(data.result);
			if(data.result==="success"){
				alert("찜리스트에 추가하였습니다.")
				location.reload();
				//location.replace("${pageContext.request.contextPath}/product/detail");				
			}else{
				alert("이미 찜한 상품입니다.");
				location.reload();
				//location.replace("${pageContext.request.contextPath}/product/detail");				
			}
			
		})
	});
	
	$(function() {
		$("#toTopBorder").click(function() {
			$('html, body').animate({ scrollTop : 0	}, 400); // 속도 400 
			return false; 
		}); 
	});
	
</script>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>