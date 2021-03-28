<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/layout/header.jsp" %>

<script src="<%=application.getContextPath() %>/resources/js/product/detail/detail.js"></script>

<div class="container" >
    <div class="content_top">
        <div class="detail_item_img" >
            <img src="<%=application.getContextPath()%>/resources/images/product/detail/item_img.jpg">
        </div>
        <div class="item_info_box">
            <div class="item_title">
                <span>[뉴크롭] 케냐 AA 키암부</span>
            
            </div>  
            <div class="item_description">
                <dl class="desc">
                    <dt>짧은설명</dt>
                    <dd>은은한 초콜릿의 단맛</dd>
                </dl>
                <dl class="price">
                    <dt>판매가</dt>
                    <dd class="price">5800</dd>
                </dl>
                <dl class=origin>
                    <dt>원산지</dt>
                    <dd>케냐</dd>
                </dl>
                <dl class=volume>
                    <dt>용량</dt>
                    <dd>200g, 500g, 1kg</dd>
                </dl>
            </div> 
            <form method="">
              <div class=select_option>
                  <dl class="option">
                      <dt>용량선택</dt>                
                      <dd>
                          <select id = "volume" name="volume" class="custom-select" onchange="change_price()" style="width: 15em;">
                              <option selected value="0">용량을 선택하세요.</option>
                              <option value="200">200g</option>
                              <option value="500">500g</option>
                              <option value="1000">1000g</option>
                          </select>
                      </dd>
                      <dt>분쇄선택</dt>                
                      <dd>
                          <select id = "mesh" name="mesh" class="custom-select" onchange="change_mash()" style="width: 15em;">
                              <option selected value="0" >분쇄유형을 선택하세요.</option>
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
                    <input type="text" class="count_value" value=1 readonly/>
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
	            
              <div class="btn_choice_box">
                  <button type="button" class="btn btn-light button" data-toggle="modal" data-target="#compare">비교하기</button>
                  <input type="button" name="cart" value="장바구니" class="btn btn-light button" formaction="#" data-toggle="modal" data-target="#cart" href=""/>
                  <input type="button" name="zzim" value="찜하기" class="btn btn-light button" formaction="#" data-toggle="modal" data-target="#zzim"/>
                  <input type="submit" name="purchase" value="구매하기" class="btn btn-info button" formaction="<%=application.getContextPath() %>/order/fill_out_order" data-toggle="modal" data-target="# #"/>
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
                <span class="message1">상품이 장바구니에 담겼습니다.</span>
                <span class="message2">바로 확인하시겠습니까?</span>
                
                <div class="button-group">
                  <button class="cancel" data-dismiss="modal" aria-label="Close">취소</button>
                  <button class="gocart" onclick="location.href='<%=application.getContextPath() %>/mypage/basket'">확인</button>
                </div>
    
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
          <span class="message1">상품을 찜했습니다.</span>
          <span class="message2">찜리스트 가기</span>
          
          <div class="button-group">
            <button class="cancel" data-dismiss="modal" aria-label="Close">취소</button>
            <button class="gocart" onclick="location.href='<%=application.getContextPath() %>/mypage/zzim'">확인</button>
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
          <img src="<%=application.getContextPath()%>/resources/images/product/detail/상품상세정보.jpg"/>
        </div>
        <div class="tab-pane fade" id="detail-delievery">
          <img  src="<%=application.getContextPath()%>/resources/images/product/detail/배송안내.png"/>
        </div>

        <div class="tab-pane fade" id="detail-review" role="tabpanel" aria-labelledby="contact-tab">
            <!--후기 Accordion UI-->
            <div class="accordion" id="accordionExample">
                <div class="card">
                  <div class="card-header" id="headingOne">
                    <h2 class="mb-0">
                      <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                       <span>후기1</span>
                      </button>
                    </h2>
                  </div>
              
                  <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                    <div class="card-body">
                      <div class="modal-buttons">
                        <span>ㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴsadsaㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴsadsaㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴsadsaㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴsadsaㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴsadsaㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴsadsaㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴsadsaㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴsadsaㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴsadsaㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴsadsaㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴsadsaㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴsadsaㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴsadsaㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴsadsaㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴsadsaㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴsadsaㅇ</span>
                        <div class="update-delete-buttons ml-3">
                          <button type="button" class="btn btn-outline-secondary button-to-modal" data-toggle="modal" data-target=".update-modal">수정</button>
                          <button type="button" class="btn btn-outline-secondary button-to-modal" data-toggle="modal" data-target=".delete-modal">삭제</button>
                        </div>
                      </div>

                    </div>
                  </div>
                </div>
                <div class="card">
                  <div class="card-header" id="headingTwo">
                    <h2 class="mb-0">
                      <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                        <span>후기2</span>
                      </button>
                    </h2>
                  </div>
                  <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                    <div class="card-body">
                      22222222222
                    </div>
                  </div>
                </div>
                <div class="card">
                  <div class="card-header" id="headingThree">
                    <h2 class="mb-0">
                      <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                        <span>후기3</span>
                      </button>
                    </h2>
                  </div>
                  <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                    <div class="card-body">
                      33333333
                    </div>
                  </div>
                </div>
            </div>

            <button id="review-button"type="button" class="btn btn-light" data-toggle="modal" data-target=".create-review-modal">
              상품후기 글쓰기
            </button>

        </div>

        <div class="tab-pane fade" id="detail-qna" role="tabpanel" aria-labelledby="contact-tab">
              
            <div class="accordion" id="accordionExample">
              <div class="card">
                <div class="card-header" id="headingOne">
                  <h2 class="mb-0">
                    <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                     <span>상품의 유효기간이 언제까지 인가요?</span>
                    </button>
                  </h2>
                </div>
                <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
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
              <div class="card">
                <div class="card-header" id="headingTwo">
                  <h2 class="mb-0">
                    <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                      <span>정말 원산지가 케냐인가요?</span>
                    </button>
                  </h2>
                </div>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
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
                <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                  <div class="card-body">
                    식초보다 시나욤
                  </div>
                </div>
              </div>

          </div>
          <button id="regbutton"type="button" class="btn btn-light" data-toggle="modal" data-target="#staticBackdrop">
            상품문의 글쓰기
          </button> 
        </div>
      </div>
    </div> 
  </br>

<!--Modal-->
  <div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
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
            <button type="button" class="btn btn-outline-secondary" id="asdasfas" data-dismiss="modal">취소</button>
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
<!--Modal 끝-->
  </div>
</div>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>