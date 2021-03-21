const scroll = function() {
  let $nav = $(".scroll");
  let $cnt = $(".content");
  // let $pageItem = $(".first-page-item");
  // let $pageCnt = $(".page"); 
  let moveCnt = null;
  let moveIndex = 0;
  let moveCntTop = 0;
  // let pageIndex = 0;
  // let pageNum = 0;
  let time = false;
  // let prevIndex = null;
  let prevCnt = null;

  const moving = function(index) {
    time = true;
    // content의 자식 div중 a태그를 눌러 들어온 index를 대입한다.
    // 선택한 요소의 인덱스 번호에 해당하는 요소를 찾는다.
    moveCnt = $cnt.children("div").eq(index);
    prevCnt = $cnt.children("div").eq(index);
    // document 기준 y축 좌표를 구함
    moveCntTop = moveCnt.offset().top;
    $("html, body").stop().animate({
      // 선택한 요소의 스크롤바 수직위치 반환
      scrollTop: moveCntTop
    }, 500, function() {
      time = false;
    });


    if (index !== 1) {
      moveCnt.children("h1, div, a").removeClass("textup")
      setTimeout(function() {
        moveCnt.children("h1, div, a").addClass("textup")
      }, 300);
    }
    $cnt.children("div").each(function(i, item) {
      if (i !== index) {
        $cnt.children("div").eq(i).children("h1, div").removeClass("textup")
      }
    })

  }

  const wheel = function(e) {
    // wheel 을 위로했을 때의 값을 구하고 조건을 건다.
    if (e.originalEvent.wheelDelta < 0) {
      if (moveIndex < 3) {
        moveIndex += 1;
        moving(moveIndex);
      }
    } else {
      if (moveIndex > 0) {
        moveIndex -= 1;
        moving(moveIndex);
      }
    }
  }

  $nav.on('click', function() {
    // a tag의 부모인 list의 인덱스를 찾는다.
    moveIndex = $(this).parent("li").index();
    moving(moveIndex);
    // return false;
  });

  // $pageItem.hover(function() {
  //   pageIndex = $(this).index();
  //   pageNum = $pageCnt.children("div").eq(pageIndex);
  //   pageNum.addClass("visual");
  //   pageNum.siblings().removeClass("visual");

  // })

  $cnt.on("mousewheel", function(e) {
    if (time === false) {
      wheel(e);
    }
  });
}

scroll();

const highlight = (path) => {
  var img_map=document.getElementById('img_map');
  img_map.src=path;
}

const reset_map = () => {
  var img_map=document.getElementById('img_map');
  img_map.src="#";
}
      
const SetTitle = (title) => {
  document.getElementById('nara_title').innerHTML=title; 
}

const SetDescription = (description) => {
  document.getElementById('nara_description').innerHTML=description; 
}

const ResetInfo = () => {
  document.getElementById('nara_title').innerHTML='';
  document.getElementById('nara_description').innerHTML='';
}   


