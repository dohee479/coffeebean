<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/layout/mainHeader.jsp" %>
  <main>
    <div class="content">
      <div class="backimg pageimg" id="img1">
        <h1 class="textup">가장 좋은 원두를</h1>
        <h1 class="textup">고르고 판매합니다.</h1>
        <div class="textup">세계 3대 커피로 알려진</div>
        <div class="textup">자메이카 블루마운틴, 예맨 모카마라티, 하아이완 코나와</div>
        <div class="textup">에티오피아, 콜림비아 등 세계 각국의 원두와</div>
        <div class="textup">개인의 취향에 따른 최상의 원두를 만나보세요.</div>
      </div>
      <div class="backimg" id="img2">
        <div class="background">
          <div class="nara_info">
            <h2 id="nara_title"></h2>
            <p id="nara_description">
            </p>
          </div>
          <img id="img_map" class="img_map" src="${pageContext.request.contextPath}/resources/images/main/map_img.png" usemap="#image-map" >
          <map name="image-map">
              <area href="${pageContext.request.contextPath}/product/country?c=과테말라" coords="171,289,199,289,199,311,229,312,226,336,197,336,196,323,173,322" shape="poly"
              onmouseover="
                  highlight('${pageContext.request.contextPath}/resources/images/main/Guate.png'); 
                  SetTitle('과테말라');
                  SetDescription('과테말라 커피 특징. ');"
  
              onmouseout="
                  reset_map();
                  ResetInfo();
                  ">
  
              <area href="${pageContext.request.contextPath}/product/country?c=브라질" coords="289,381,298,379,301,368,313,367,314,355,334,357,338,376,361,380,363,391,389,394,388,411,375,417,374,451,365,451,364,442,354,441,351,426,341,431,337,416,328,420,325,405,290,406" shape="poly"
              onmouseover="
                  highlight('${pageContext.request.contextPath}/resources/images/main/Brasil.png'); 
                  SetTitle('브라질');
                  SetDescription('브라질 커피 특징. ');"
  
              onmouseout="
                  reset_map();
                  ResetInfo();
                  ">
  
              <area href="${pageContext.request.contextPath}/product/country?c=케냐" coords="579,369,603,370,603,381,615,381,615,392,602,391,602,404,565,403,564,387,578,383" shape="poly"
              onmouseover="
                  highlight('${pageContext.request.contextPath}/resources/images/main/kenya.png'); 
                  SetTitle('케냐');
                  SetDescription('독특한 쌉쌀한 맛, 신맛, 강한 향미가 특징<br> 개성있고 상큼한 커피. ');"
  
              onmouseout="
                  reset_map();
                  ResetInfo();
                  ">
  
              <area href="${pageContext.request.contextPath}/product/country?c=에티오피아" coords="579,366,602,367,603,356,628,355,628,344,616,344,615,334,602,331,602,320,581,320" shape="poly"
              onmouseover="
                  highlight('${pageContext.request.contextPath}/resources/images/main/Ethi.png'); 
                  SetTitle('에티오피아');
                  SetDescription('에티오피아 커피 특징. ');"
  
              onmouseout="
                  reset_map();
                  ResetInfo();
                  ">
  
              <area href="${pageContext.request.contextPath}/product/country?c=콜롬비아" coords="251,341,287,342,286,391,252,393,253,369,265,368,265,354,251,354" shape="poly"
              onmouseover="
                  highlight('${pageContext.request.contextPath}/resources/images/main/Colom.png'); 
                  SetTitle('콜롬비아');
                  SetDescription('은은한 허브향과 단맛의 조화. ');"
              onmouseout="
                  reset_map();
                  ResetInfo();">
          </map>
        </div> 
      </div>
      <div class="backimg" id="img3">
        <h1 class="textup"><a href="${pageContext.request.contextPath}/product/flavor">달콤 쌉싸름</a></h1>
        <h1 class="textup"><a href="${pageContext.request.contextPath}/product/flavor">고소함</a></h1>
        <h1 class="textup"><a href="${pageContext.request.contextPath}/product/flavor">묵직하고 달콤한 여운</a></h1>
        <h1 class="textup"><a href="${pageContext.request.contextPath}/product/flavor">은은하고 편안함</a></h1>
        <h1 class="textup"><a href="${pageContext.request.contextPath}/product/flavor">상큼한 산미</a></h1>
      </div>
      <div class="backimg" id="img4">
        <h1 class="textup">원두이야기</h1>
        <div class="textup">
          <p>가장 기초가 되는 쓴맛</p>
          <p>다양한 기호에 맞게 각국의 커피맛이 어느 정도 차이를 보이고</p>
          <p>신맛을 포함하여 커피를 평가하는데 중요하게 여기지만</p>
          <p>커피에게 쓴맛은 거의 기본이나 다름없다.</p>
          <p>맛이 쓴 커피가 인간이 가장 사랑하는 음료들 중 하나가 된 것은</p>
          <p>실로 아이러니하다.</p>
          <p><a class="story-btn" href="story">이야기 보러가기</a></p>
        </div>
      </div>
    </div>
    <ul class="right-nav">
      <li class="item"><a href="#img1" class="scroll"></a></li>
      <li class="item"><a href="#img2" class="scroll"></a></li>
      <li class="item"><a href="#img3" class="scroll"></a></li>
      <li class="item"><a href="#img4" class="scroll"></a></li>
    </ul>
  </main>
  <script src="${pageContext.request.contextPath}/resources/js/main/main.js"></script>
</body>
</html>

