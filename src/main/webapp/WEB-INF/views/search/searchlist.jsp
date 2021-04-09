<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>

  <div class="search-content">
    <div class="result">
      <div><span class="keyword">"${keyword}"</span>의 검색결과 ${fn:length(searchList)}개</div>
      <div class="centered">
	      <form class="input-group" action="${pageContext.request.contextPath}/product/search">
	        <input id="input-name" type="text" name="keyword" placeholder="Goods Name" autocomplete="off"/>
	        <button type="submit"><img class="loupe" src="${pageContext.request.contextPath}/resources/images/header/loupe.png"></button>
	      </form>
      </div>
    </div>
<!--     <div class="recommend">
      <ul>
        <li>추천순</li>
        <li>판매인기순</li>
        <li>낮은가격순</li>
        <li>높은가격순</li>
        <li>별점순</li>
      </ul>
    </div> -->
    <div>
      <div class="searchitem_list">
       <c:forEach var="search" items="${searchList}">
        <div class="product-card border-0">
        <div class="card-head">
          <img src="downloadImg?product_id=${search.product_id}" class="card-img-top" alt="...">
          <div id="overlay">
	      	<div>
		 		<img id="cart" src="${pageContext.request.contextPath}/resources/images/header/cart.png" width="24px" data-toggle="modal" data-target="#cart${search.product_id}"/>
		  		<img id="wish" src="${pageContext.request.contextPath}/resources/images/product/item/wish.png" width="24px" onclick="wish(${product.product_id})"/>
         	</div>
	  	</div>
        </div>
          <a href="${pageContext.request.contextPath}/product/detail/${search.product_id}">
            <div class="card-body">
              <h5 class="card-title">${search.product_title}</h5>
              <p class="card-text">#${search.product_taste}</p>
              <p class="card-text">${search.product_price}</p>
            </div>
          </a>
        </div>
      	          <!-- 장바구니 모달 시작 -->
       <div class="modal fade" id="cart${search.product_id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
    									<input type="hidden" name="product_id" value="${search.product_id}" id="product_id"/> 
              <input type="hidden" name="product_id" value="${search.product_id}" /> 
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
<script>
const wish= (product_id)=>{
	
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
	
}	
</script>
<script src="${pageContext.request.contextPath}/resources/js/product/itemlist/itemlist.js"></script>
 <%@ include file="/WEB-INF/views/layout/footer.jsp" %>
</body>
</html>