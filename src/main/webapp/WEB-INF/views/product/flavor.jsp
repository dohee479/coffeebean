<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
  <div class="contents">
    <div class="sub_content">
      <h2 class="flavor_title">맛/향별 원두</h2>
      <div class="flavor">
        <div class="kind">
          <ul class="flavor-list">
            <li><a href="flavor?f=달콤쌉싸름">달콤 쌉싸름</a></li>
            <li><a href="flavor?f=고소함/구수함">고소함/구수함</a></li>
            <li><a href="flavor?f=묵직하고 달콤한 여운">묵직하고 달콤한 여운</a></li>
            <li><a href="flavor?f=은은하고 편안함">은은하고 편안함</a></li>
            <li><a href="flavor?f=상큼한 산미와 향">상큼한 산미와 향</a></li>
          </ul>
        </div>
      </div>
      <div class="recommend-list">
        <span>상품 ${fn:length(productList)}개</span>
        <div>
	        <ul>
	          <li><a href="flavor?f=${productList.get(0).product_taste}">추천순</a></li>
	          <li><a href="flavor?f=${productList.get(0).product_taste}&s=count">판매량순</a></li>
	          <li><a href="flavor?f=${productList.get(0).product_taste}&s=price_dsc">높은 가격순</a></li>
	          <li><a href="flavor?f=${productList.get(0).product_taste}&s=price_asc">낮은 가격순</a></li>
	        </ul>
        </div>
      </div>
      <div>
        <div class="product-list">
	        <c:forEach var="product" items="${productList}">
	          <div class="product-card border-0">
	          <div class="card-head">
	              <img src="downloadImg?product_id=${product.product_id}" class="card-img-top" alt="...">
	              <div id="overlay">
	              	<div>
					  <img id="cart" src="${pageContext.request.contextPath}/resources/images/header/cart.png" width="24px" data-toggle="modal" data-target="#cart${product.product_id}"/>
					  <c:if test="${product.zzimboolean eq 'exist' }">
						 	 <img id="wish${product.product_id}" src="${pageContext.request.contextPath}/resources/images/product/item/wishfill.png" width="24px" onclick="wish(${product.product_id})"/>
						  </c:if>
						  <c:if test="${empty product.zzimboolean}">
						  	<img id="wish${product.product_id}" src="${pageContext.request.contextPath}/resources/images/product/item/wish.png" width="24px" onclick="wish(${product.product_id})"/>
						  </c:if>
	              	</div>
				  </div>
	          </div>
	          <a href="${pageContext.request.contextPath}/product/detail/${product.product_id}">
	              <div class="card-body">
	                <h5 class="card-title">${product.product_title}</h5>
	                <p class="card-text">#${product.product_taste}</p>
	                <p class="card-text">￦${product.product_price}</p>
	              </div>
	            </a>
	          </div>
   	          <!-- 장바구니 모달 시작 -->
	          <div class="modal fade" id="cart${product.product_id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		        <div class="modal-dialog modal-dialog-centered" role="document">
		          <div class="modal-content">
		            <div class="modal-header">
		              <span class="modal-title" id="exampleModalLabel">장바구니 담기</span>
		              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                <span aria-hidden="true">&times;</span>
		              </button>
		            </div>
		            <div class="modal-body">
		              <div class="cart_img"><img src="<%=application.getContextPath()%>/resources/images/mypage/zzim/cart.png"></div>
		              <span class="message1" style="margin: 0 0 0 130px;">상품을 장바구니에 추가합니다.</span>
		              <span class="message2"></span>
		              <form method="post">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
      									<input type="hidden" name="product_id" value="${product.product_id}" id="product_id"/> 
		              <input type="hidden" name="product_id" value="${product.product_id}" /> <%-- value="${product_id}" --%>
		              <div class=select_option>
		                  <dl class="option">             
		                      <dd>
		                          <select id = "volume" name="volume" class="custom-select" style="width: 15em; margin: 0 0 0 110px;">
		                             <!--  <option selected value="0">용량을 선택하세요.</option> -->
		                              <option value="200">200g</option>
		                              <option value="500">500g</option>
		                              <option value="1000">1000g</option>
		                          </select>
		                      </dd>              
		                      <dd>
		                          <select id = "mesh" name="grind" class="custom-select" style="width: 15em; margin: 0 0 0 110px;">
		                              <!-- <option selected value="0" >분쇄유형을 선택하세요.</option> -->
		                              <option value="1">홀빈(분쇄안함)</option>
		                              <option value="2">프렌치프레스 분쇄</option>
		                              <option value="3">핸드드립 분쇄</option>
		                              <option value="4">더치용 분쇄</option>
		                          </select>
		                      </dd>
		                      <dd>
		                      <div class="count_box">
				                  <div class="minus">-</div>
				                    <input type="text" class="count_value" name="count" value=1 readonly/>
				                  <div class="plus">+</div>
				              </div>
				              </dd>
		                  </dl>
		              </div>
		              <div class="button-group" style="margin: 0 0 0 158px;">
		                <button class="cancel" data-dismiss="modal" aria-label="Close">취소</button>
		                <button type="submit" class="gocart" formaction="<%=application.getContextPath() %>/mypage/addBasket">확인</button>
		              </div>
		            </form>
		            </div>
		          </div>
		        </div>
		      </div>
	        </c:forEach>
        </div>
      </div>
    </div>
  </div>

<script>
const wish= (product_id)=>{
	 
	$.ajax({
		url:"/kong/mypage/zzim_insert?${_csrf.parameterName}=${_csrf.token}",
		data:{product_id},
		method:"post",
	}).then(data=>{
		if(data.result==="success"){
			/* $('#wish').attr("src", "${pageContext.request.contextPath}/resources/images/product/item/wishfill.png"); */
			document.getElementById('wish'+product_id).src="${pageContext.request.contextPath}/resources/images/product/item/wishfill.png";
			//location.replace("${pageContext.request.contextPath}/product/detail");				
		}else{
			$.ajax({
				url:"/kong/mypage/nowdelete?${_csrf.parameterName}=${_csrf.token}",
				data:{product_id},
				method:"post",
			}).then(data=>{
				if(data==="success"){
					document.getElementById('wish'+product_id).src="${pageContext.request.contextPath}/resources/images/product/item/wish.png";
				}
			})
			
			
		}
		
	})
	
}	
</script> 
<script src="${pageContext.request.contextPath}/resources/js/product/itemlist/itemlist.js"></script>
 <%@ include file="/WEB-INF/views/layout/footer.jsp" %>