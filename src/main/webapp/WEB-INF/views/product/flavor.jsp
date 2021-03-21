<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
  <div class="contents">
    <div class="sub_content">
      <h2 class="flavor_title">맛/향별 원두</h2>
      <div class="flavor">
        <div class="kind">
          <ul class="country-list">
            <li>달콤 쌉싸름</li>
            <li>고소함/구수함</li>
            <li>묵직하고 달콤한 여운</li>
            <li>은은하고 편안함</li>
            <li>상큼한 산미와 향</li>
          </ul>
        </div>
      </div>
      <div class="recommend-list">
        <span>상품 5개</span>
        <form>
          <ul>
            <li>
              <input type="radio" id="sort1" name="sort" checked/>
              <label for="sort1" onclick="changeList()">추천순</label>
            </li>
            <li>
              <input type="radio" id="sort2" name="sort"/>
              <label for="sort2" onclick="changeList()">판매 인기순</label>
            </li>
            <li>
              <input type="radio" id="sort3" name="sort"/>
              <label for="sort3">낮은 가격순</label>
            </li>
            <li>
              <input type="radio" id="sort4" name="sort"/>
              <label for="sort4">높은 가격순</label>
            </li>
            <li>
              <input type="radio" id="sort5" name="sort"/>
              <label for="sort5">별점순</label>
            </li>
          </ul>
        </form>
        <hr/>
      </div>
      <div>
        <div class="search-list">
          <div class="card">
            <a href="${pageContext.request.contextPath}/product/detail">
              <img src="${pageContext.request.contextPath}/resources/images/product/item/원두3.jpg" class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title">[뉴크롭] 온두라스 산 안 드레스</h5>
                <p class="card-text">#높은 바디감과 초콜릿의 달콤함</p>
                <p class="card-text">4,600</p>
              </div>
            </a>
          </div>
          <div class="card">
            <a href="${pageContext.request.contextPath}/product/detail">
              <img src="${pageContext.request.contextPath}/resources/images/product/item/원두1.jpg" class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title">[뉴크롭] 온두라스 산 안 드레스</h5>
                <p class="card-text">#높은 바디감과 초콜릿의 달콤함</p>
                <p class="card-text">4,600</p>
              </div>
            </a>
          </div>
          <div class="card">
            <a href="${pageContext.request.contextPath}/product/detail">
              <img src="${pageContext.request.contextPath}/resources/images/product/item/원두2.jpg" class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title">[뉴크롭] 온두라스 산 안 드레스</h5>
                <p class="card-text">#높은 바디감과 초콜릿의 달콤함</p>
                <p class="card-text">4,600</p>
              </div>
            </a>
          </div>
          <div class="card">
            <a href="${pageContext.request.contextPath}/product/detail">
              <img src="${pageContext.request.contextPath}/resources/images/product/item/원두3.jpg" class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title">[뉴크롭] 온두라스 산 안 드레스</h5>
                <p class="card-text">#높은 바디감과 초콜릿의 달콤함</p>
                <p class="card-text">4,600</p>
              </div>
            </a>
          </div>
          <div class="card">
            <a href="${pageContext.request.contextPath}/product/detail">
              <img src="${pageContext.request.contextPath}/resources/images/product/item/원두3.jpg" class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title">[뉴크롭] 온두라스 산 안 드레스</h5>
                <p class="card-text">#높은 바디감과 초콜릿의 달콤함</p>
                <p class="card-text">4,600</p>
              </div>
            </a>
          </div>
          <div class="card">
            <a href="${pageContext.request.contextPath}/product/detail">
              <img src="${pageContext.request.contextPath}/resources/images/product/item/원두3.jpg" class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title">[뉴크롭] 온두라스 산 안 드레스</h5>
                <p class="card-text">#높은 바디감과 초콜릿의 달콤함</p>
                <p class="card-text">4,600</p>
              </div>
            </a>
          </div>
          <div class="card">
            <a href="${pageContext.request.contextPath}/product/detail">
              <img src="${pageContext.request.contextPath}/resources/images/product/item/원두2.jpg" class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title">[뉴크롭] 온두라스 산 안 드레스</h5>
                <p class="card-text">#높은 바디감과 초콜릿의 달콤함</p>
                <p class="card-text">4,600</p>
              </div>
            </a>
          </div>
          <div class="card">
            <a href="${pageContext.request.contextPath}/product/detail">
              <img src="${pageContext.request.contextPath}/resources/images/product/item/원두1.jpg" class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title">[뉴크롭] 온두라스 산 안 드레스</h5>
                <p class="card-text">#높은 바디감과 초콜릿의 달콤함</p>
                <p class="card-text">4,600</p>
              </div>
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>