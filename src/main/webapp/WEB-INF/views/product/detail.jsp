<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            <input type="hidden" name="product_id" value="${product.product_id}" id="product_id"/> 
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
                  <button type="button" class="btn btn-light button" data-toggle="modal" data-target="#compare" onclick="compareBasket()">비교하기</button>
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
              <h5 class="modal-title" id="exampleModalLabel" >장바구니 상품과 비교하기</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <select id="compare_item" name="item" class="custom-select" >
                <option selected>비교상품을 선택하세요.</option>

            </select>

              <table class="table table-hover compare-table">
                <thead>
                  <tr>
                    <th scope="col"></th>
                    <th class="compare-title" scope="col">${product.product_title}</th>
                    <th scope="col" class="compare_attribute_name compare-title"></th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <th scope="row">가격</th>
                    <td>${product.product_price}</td>
                    <td class="compare_attribute_price"></td>
                  </tr>
                  <tr>
                    <th scope="row">맛</th>
                    <td>${product.product_taste}</td>
                    <td class="compare_attribute_taste"></td>
                  </tr>
                  <tr>
                    <th scope="row">원산지</th>
                    <td>${product.product_country}</td>
                    <td class="compare_attribute_origin"></td>
                  </tr>
                  <tr>
                    <th scope="row">평점</th>
                    <td>5</td>
                    <td class="compare_attribute_rate"></td>
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
			  <div>
                <div class="card">
                  <div class="card-header" id="heading${review.review_id}">
                    <h2 class="mb-0">
                      <button class="btn btn-link btn-block text-left collapsed review-list" type="button" data-toggle="collapse" data-target="#collapse${review.review_id}" aria-expanded="false" aria-controls="collapse${review.review_id}">
                       <c:if test="${review.review_grade == 1}"><img id="star-grade1" src="${pageContext.request.contextPath}/resources/images/product/detail/star1.png" width="24px"></c:if>
                       <c:if test="${review.review_grade == 2}"><img id="star-grade2" src="${pageContext.request.contextPath}/resources/images/product/detail/star2.png" width="24px"></c:if>
                       <c:if test="${review.review_grade == 3}"><img id="star-grade3" src="${pageContext.request.contextPath}/resources/images/product/detail/star3.png" width="24px"></c:if>
                       <c:if test="${review.review_grade == 4}"><img id="star-grade4" src="${pageContext.request.contextPath}/resources/images/product/detail/star4.png" width="24px"></c:if>
                       <c:if test="${review.review_grade == 5}"><img id="star-grade5" src="${pageContext.request.contextPath}/resources/images/product/detail/star5.png" width="24px"></c:if>         
                       <span>${review.review_title}</span>
                       <span>${review.review_date.substring(0,10)}</span>
                      </button>
                    </h2>
                  </div>
              
                  <div id="collapse${review.review_id}" class="collapse" aria-labelledby="heading${review.review_id}" data-parent="#accordionExample">
                    <div class="">
                      <div class="modal-buttons">
                        <div class="detail-review-content">${review.review_content}</div>
                        <c:if test="${not empty review.review_attachsname}">
	                        <img id="review-img" src="${pageContext.request.contextPath}/review/downloadReviewImg?review_id=${review.review_id}">
                        </c:if>
                        <sec:authorize access="isAuthenticated()">
	                        <sec:authentication property="principal.username" var="user_id" />
	                        <c:set var="user_id" value="${user_id }"/>
	                        <c:if test="${review.users_user_id == user_id}">
		                       <div class="update-delete-btn ml-3">
		                         <button type="button" class="btn btn-outline-secondary button-to-modal" data-toggle="modal" data-target=".update-modal${review.review_id}">수정</button>
		                         <button type="button" class="btn btn-outline-secondary button-to-modal" data-toggle="modal" data-target=".delete-modal${review.review_id}">삭제</button>
		                       </div>
	                        </c:if>  
                        </sec:authorize>
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
			  </div>
              </c:forEach>
            </div>

           </div>
<%--        		<div>
				<div class="text-center">
					<a class="btn btn-outline-primary btn-sm" href="${pageContext.request.contextPath}/product/detail/${product.product_id}?pageNo=1">처음</a>
					<c:if test="${pager.groupNo > 1 }">
						<a class="btn btn-outline-info btn-sm" href="${pageContext.request.contextPath}/product/detail/${product.product_id}?pageNo=${pager.startPageNo - 1}">이전</a>
					</c:if>
					<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo }">
						<a class="btn 
						<c:if test='${pager.pageNo == i}'>btn-danger</c:if>
						<c:if test='${pager.pageNo != i}'>btn-success</c:if>
						" href="${pageContext.request.contextPath}/product/detail/${product.product_id}?review-pageNo=${i}">${i}</a>
					</c:forEach>
					<c:if test="${pager.groupNo < pager.totalGroupNo }">
						<a class="btn btn-outline-info btn-sm" href="${pageContext.request.contextPath}/product/detail/${product.product_id}?review-pageNo=${pager.endPageNo + 1}">다음</a>
					</c:if>
					<a class="btn btn-outline-primary btn-sm" href="${pageContext.request.contextPath}/product/detail/${product.product_id}?review-pageNo=${pager.totalPageNo}">맨끝</a>
				</div>
			</div>
        </div> --%>

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
			         <span id="qna-date">${question.str_date}</span>
			        </button>
			      </h2>
			    </div>
			    <div id="collapse${status.count}" class="collapse" aria-labelledby="heading${status.count}" data-parent="#detail-qna">
			      <div class="card-body">
			        <span class="title"><span class="QQQ">Q</span> : ${question.question_content}</span>
			        <br>
			        <div class="answer">
			          <strong><span class="AAA">A</span> :</strong> 답변 대기중.....
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
	      <form method="post" action="${pageContext.request.contextPath}/product/detail-qna-create" onsubmit="validate()">
	      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		      <div class="modal-body">
		        <input id="update-title" type="text" class="input-title" name="question_title" placeholder="제목을 입력하세요." maxlength="30">
		        <span id="errorTitle" class="text-danger error"></span>
		        <textarea id="update-content" class="input-content" name="question_content" wrap="physical" placeholder="내용을 입력하세요." maxlength="300"></textarea>
		        <span id="errorContent" class="text-danger error"></span>
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
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>