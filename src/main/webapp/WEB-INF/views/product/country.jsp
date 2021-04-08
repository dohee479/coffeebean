<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
  <div class="contents">
    <div class="sub_content">
      <h2 class="country-title">나라별 원두</h2>
      <div id="country">
        <div class="kind">
          <ul class="country-list">
            <li><a href="country?c=과테말라">과테말라</a></li>
            <li><a href="country?c=브라질">브라질</a></li>
            <li><a href="country?c=에티오피아">에티오피아</a></li>
            <li><a href="country?c=케냐">케냐</a></li>
            <li><a href="country?c=콜롬비아">콜롬비아</a></li>
          </ul>
        </div>
      </div>
      <div class="recommend-list">
        <span>상품 ${fn:length(productList)}개</span>
        <div>
	        <ul>
	          <li><a href="country?c=${productList.get(0).product_country}">추천순</a></li>
	          <li><a href="country?c=${productList.get(0).product_country}&s=count">판매량순</a></li>
	          <li><a href="country?c=${productList.get(0).product_country}&s=price_dsc">높은 가격순</a></li>
	          <li><a href="country?c=${productList.get(0).product_country}&s=price_asc">낮은 가격순</a></li>
	        </ul>
        </div>
      </div>
      <div>
        <div class="product-list">
	        <c:forEach var="product" items="${productList}">
	          <div id="overlay" onclick="off()">
				<div id="text">Overlay Text</div>
			  </div>	
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
 <%@ include file="/WEB-INF/views/layout/footer.jsp" %>