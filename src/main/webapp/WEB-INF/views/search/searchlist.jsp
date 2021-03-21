<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/layout/header.jsp" %>

  <div class="search-content">
    <div class="result">
      <div><span>케냐</span>의 검색결과</div>
      <div>
        <input type="text"/>
        <button class="btn btn-dark btn-sm">검색</button>
      </div>
    </div>
    <div class="recommend">
      <ul>
        <li>추천순</li>
        <li>판매인기순</li>
        <li>낮은가격순</li>
        <li>높은가격순</li>
        <li>별점순</li>
      </ul>
    </div>
    <div>
      <div class="item_list">
        <a href="${pageContext.request.contextPath}/product/detail">
          <div class="card border-0">
            <img src="${pageContext.request.contextPath}/resources/images/product/item/원두1.jpg" class="card-img-top" alt="...">
            <div class="card-body">
              <h5 class="card-title">[뉴크롭] 온두라스 산 안 드레스</h5>
              <p class="card-text">#높은 바디감과 초콜릿의 달콤함</p>
              <p class="card-text">4,600</p>
            </div>
          </div>
        </a>
        <a href="${pageContext.request.contextPath}/product/detail">
          <div class="card border-0">
            <img src="${pageContext.request.contextPath}/resources/images/product/item/원두3.jpg" class="card-img-top" alt="...">
            <div class="card-body">
              <h5 class="card-title">[뉴크롭] 온두라스 산 안 드레스</h5>
              <p class="card-text">#높은 바디감과 초콜릿의 달콤함</p>
              <p class="card-text">4,600</p>
            </div>
          </div>
        </a>
        <a href="${pageContext.request.contextPath}/product/detail">
          <div class="card border-0">
            <img src="${pageContext.request.contextPath}/resources/images/product/item/원두2.jpg" class="card-img-top" alt="...">
            <div class="card-body">
              <h5 class="card-title">[뉴크롭] 온두라스 산 안 드레스</h5>
              <p class="card-text">#높은 바디감과 초콜릿의 달콤함</p>
              <p class="card-text">4,600</p>
            </div>
          </div>
        </a>
        <a href="${pageContext.request.contextPath}/product/detail">
          <div class="card border-0">
            <img src="${pageContext.request.contextPath}/resources/images/product/item/원두1.jpg" class="card-img-top" alt="...">
            <div class="card-body">
              <h5 class="card-title">[뉴크롭] 온두라스 산 안 드레스</h5>
              <p class="card-text">#높은 바디감과 초콜릿의 달콤함</p>
              <p class="card-text">4,600</p>
            </div>
          </div>
        </a>
      </div>
    </div>
  </div>
</body>
</html>