<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/layout/header.jsp" %>

  <div class="search-content">
    <div class="result">
      <div><span>${keyword}</span>의 검색결과</div>
      <div>
	      <form action="${pageContext.request.contextPath}/product/search">
	        <input type="text" placeholder="상품명을 입력하세요" name="keyword"/>
	        <button type="submit"><img class="loupe" src="${pageContext.request.contextPath}/resources/images/header/search.png"></button>
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
      <div class="item_list">
       <c:forEach var="search" items="${searchList}">
        <div class="card border-0">
          <a href="${pageContext.request.contextPath}/product/detail/${search.product_id}">
            <img src="downloadImg?product_id=${search.product_id}" class="card-img-top" alt="...">
            <div class="card-body">
              <h5 class="card-title">${search.product_title}</h5>
              <p class="card-text">#${search.product_taste}</p>
              <p class="card-text">${search.product_price}</p>
            </div>
          </a>
        </div>
       </c:forEach>
      </div>
    </div>
  </div>
 <%@ include file="/WEB-INF/views/layout/footer.jsp" %>
</body>
</html>