<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/layout/header.jsp" %>
  <div class="story-wrap">
    <div class="story-title">
      <h1>세계 3대 원두</h1>
      <img src="${pageContext.request.contextPath}/resources/images/story/원두하트.jpg">
    </div>
    <img src="${pageContext.request.contextPath}/resources/images/story/원두라인.jpg" width="">
    <div>
      <img src="${pageContext.request.contextPath}/resources/images/story/블루 마운틴.jpg">
      <div>
        <h2>자메이카 블루 마운틴</h2>
        <p>카리브해에 위치한 자메이카의 블루마운틴 지역에서 생산되는 커피</p>
        <p>영국 왕실과 엘리자베스 여왕이 즐겨 마시는 커피로 알려지면서</p>
        <p>커피의 황제라는 별명을 가지게 되었다.</p>
        <p>옅은 신맛과 와인 처럼 쌉사래한 맛, 부으러운 쓴맛, 단맛과 스모크한 맛까지</p>
        <p>여러 커피가 지니는 맛들을 골고루 지녀 완벽한 조화를 이룬다.</p>
      </div>
    </div>
    <div>
      <div>
        <h2>예멘 모카</h2>
        <p>아라비카반도의 남서쪽에 위치한 예멘에서 생산되는 커피</p>
        <p>고흐가 즐겨 마시던 커피 모카 마라티는 모카 품종에서도 최고급 품종이며</p>
        <p>커피의 귀부인이라는 별명을 가지고 있다.</p>
        <p>묵직한 바디감, 새콤한 맛과 쓴맛의 환상적인 조화, 진한 다크 초콜릿 향이 매력이다.</p>
      </div>
      <img src="${pageContext.request.contextPath}/resources/images/story/예멘모카.jpg">
    </div>
    <div>
      <img src="${pageContext.request.contextPath}/resources/images/story/하아이완코나.jpg">
      <div>
        <h2>하아이완 코나</h2>
        <p>미국 하와이에서 제일 큰 섬인 하와이섬의 코나 지역에서 생산되는 커피</p>
        <p>유명한 소설과 마크 트웨인은 다정한찬사를 받기에 충분한 커피라는</p>
        <p>극찬을 남겼다.</p>
        <p>달콤한 향기 가운데 나는 예민한 신맛, 중간 정도의 바디, 매콤한 풍미까지</p>
        <p>여러 향과 맛이 조화를 이루며 전체적으로 강렬하면서도 깊은 맛이 난다.</p>
      </div>
    </div>
  </div>
  
  <%@ include file="/WEB-INF/views/layout/footer.jsp" %>