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
            <li><a href="flavor?f=고소함">고소함/구수함</a></li>
            <li><a href="flavor?f=묵직하고 달콤한 여운">묵직하고 달콤한 여운</a></li>
            <li><a href="flavor?f=은은하고 편안함">은은하고 편안함</a></li>
            <li><a href="flavor?f=상큼한 산미">상큼한 산미</a></li>
          </ul>
        </div>
      </div>
      <div class="recommend-list">
        <span>상품 ${fn:length(productList)}개</span>
        <ul>
          <li><a href="flavor?f=${productList.get(0).product_taste}">추천순</a></li>
          <li><a href="flavor?f=${productList.get(0).product_taste}&s=count">판매량순</a></li>
          <li><a href="flavor?f=${productList.get(0).product_taste}&s=price_dsc">높은 가격순</a></li>
          <li><a href="flavor?f=${productList.get(0).product_taste}&s=price_asc">낮은 가격순</a></li>
        </ul>
        <hr/>
      </div>
      <div>
        <div class="search-list">
	        <c:forEach var="product" items="${productList}">
	          <div class="card border-0">
	            <a href="${pageContext.request.contextPath}/product/detail/${product.product_id}">
	              <img src="downloadImg?product_id=${product.product_id}" class="card-img-top" alt="...">
	              <div class="card-body">
	                <h5 class="card-title">${product.product_title}</h5>
	                <p class="card-text">#${product.product_taste}</p>
	                <p class="card-text">${product.product_price}</p>
	              </div>
	            </a>
	          </div>
	        </c:forEach>
        </div>
      </div>
    </div>
  </div>
 </div>
<script src="${pageContext.request.contextPath}/resources/js/product/itemlist/itemlist.js"></script>
 <%@ include file="/WEB-INF/views/layout/footer.jsp" %>