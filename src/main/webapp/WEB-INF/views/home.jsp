<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>드라이브 어디갈Car!</title>

  <meta name="author" content="GYUB">
  <meta name="description" content="Gyub World">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport"
        content="width=device-width, initial-scale=1, user-scalable=no, maximum-scale=1, minimum-scale=1">

  <link rel="icon" href="resources/img/icons8-car-roof-box-48.png">
  <link rel="apple-touch-icon"
        href="resources/img/icons8-car-roof-box-48.png">
  <!-- 구글폰트 적용 -->
  <link
          href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap"
          rel="stylesheet">
  <!-- css 리셋 한 후 메인 css호출 해야해 -->
  <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.css">
  <link rel="stylesheet" href="resources/css/main.css">
  <style>
    .placeinfo_wrap {
      position: absolute;
      bottom: 28px;
      left: -150px;
      width: 300px;
    }

    .placeinfo {
      position: relative;
      width: 100%;
      border-radius: 6px;
      border: 1px solid #ccc;
      border-bottom: 2px solid #ddd;
      padding-bottom: 10px;
      background: #fff;
    }

    .placeinfo:nth-of-type(n) {
      border: 0;
      box-shadow: 0px 1px 2px #888;
    }

    .placeinfo_wrap .after {
      content: '';
      position: relative;
      margin-left: -12px;
      left: 50%;
      width: 22px;
      height: 12px;
      background:
              url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
    }

    .placeinfo a, .placeinfo a:hover, .placeinfo a:active {
      color: #fff;
      text-decoration: none;
    }

    .placeinfo a, .placeinfo span {
      display: block;
      text-overflow: ellipsis;
      overflow: hidden;
      white-space: nowrap;
    }

    .placeinfo span {
      margin: 5px 5px 0 5px;
      cursor: default;
      font-size: 13px;
    }

    .placeinfo .title {
      font-weight: bold;
      font-size: 14px;
      border-radius: 6px 6px 0 0;
      margin: -1px -1px 0 -1px;
      padding: 10px;
      color: #fff;
      background: #d95050;
      background: #d95050
      url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
      no-repeat right 14px center;
    }

    .placeinfo .tel {
      color: #0f7833;
    }

    .placeinfo .jibun {
      color: #999;
      font-size: 11px;
      margin-top: 0;
    }
  </style>
</head>
<body>
<div class="body__container">
  <!-- 헤더 -->
  <header class="section">
    <div class="inner clearfix">

      <div class="menu-group float--left">
        <div class="logo">
          <a href="">Drive</a>
        </div>
        <ul class="main-menu">
          <li><a href="http://localhost:8080/board/getBoardList"
                 target="_blank" style="margin-bottom: 3px;">게시판</a></li>
          <li><a href="https://weather.naver.com/today/09620102"
                 target="_blank" style="margin-bottom: 3px;">오늘의 날씨</a></li>
        </ul>
        <!-- 구글 검색창 -->
        <script async
                src="https://cse.google.com/cse.js?cx=76038bc9cb5644c05"></script>
        <div class="gcse-searchbox-only"></div>
      </div>

      <div class="sign-group float--right">
        <div class="btn-group">
          <c:if test="${member != null}">
            <span style="padding-top: 8px;">${member.memberId}님 환영합니다.</span>
            <a href="/member/logout" class="btn sign-in"
               style="margin-left: 5px;">로그아웃</a>
          </c:if>

          <c:if test="${member == null}">
            <a href="http://localhost:8080/member/login" class="btn sign-in">로그인</a>
          </c:if>
          <c:if test="${member == null}">
            <a href="http://localhost:8080/member/join" target="_blank"
               class="btn btn--primary sign-up">회원가입</a>
          </c:if>
        </div>
        <form id="search-form" method="POST" action="">
          <!-- <input type="text" id="search" class="input--text"
              placeholder="검색어를 입력하세요"> <input type="submit"
              value="submit"> -->
        </form>
        <ul class="sub-menu">
          <li><a href="https://ko-kr.facebook.com/" target="_blank">Facebook</a></li>
          <li><a href="https://www.instagram.com/" target="_blank">Instagram</a></li>
        </ul>
      </div>
    </div>
  </header>

  <!--visual-->
  <section class="section section--visual">
    <div class="inner">

      <div class="summary">
        <div class="summary__title">여기서&nbsp;드라이브 코스를&nbsp;검색해보세요!</div>
        <div class="summary__description">그동안 매번 드라이브 코스를 찾아보기
          번거로우셨죠!&nbsp;여기서 소통도 하고 정보도 얻어가세요!</div>

      </div>
      <!--   원래 페이지에 있던 로그인 회원가입
      <form id="sign-form" method="POST" action="">
          <ul>
              <li><input type="text" class="input--text"
                  placeholder="이름을 입력하세요."></li>
                <li><input type="email" class="input--text"
                  placeholder="이메일을 입력하세요."></li>
              <li><input type="password" class="input--text"
                  placeholder="비밀번호를 입력하세요.">
                  <p class="caption">영문, 숫자를 조합하여 7자리 이상을 사용하세요.</p></li>
              <li>
                  <button type="submit" class="btn btn--primary">Sign up</button>
                  <p class="caption">가입하세요 버튼을 투르면 서비스 및 개인 정보 보호 정책에 대한 동의 약관을
                      이메일 계정으로 보내드립니다.</p>
              </li>
          </ul>
      </form>-->
    </div>
  </section>

  <!--map-->
  <section class="section section--map">
    <div class="inner">

      <div class="summary">
        <div class="summary__title">지도를 통해 목적지를 검색해보세요!</div>
        <div class="summary__description">목적지를 검색하고 가는 길에 둘러볼만한 곳을
          봐보세요!</div>
      </div>
      <!-- 지도에 뛰운 검색창 -->
      <div class="map_wrap">
        <!-- 지도 -->
        <div id="map"></div>

        <div id="menu_wrap" class="bg_white">
          <div class="option">
            <div>
              <form onsubmit="searchPlaces(); return false;">
                검색 : <input type="text" value="강남대학교" id="keyword" size="15">
                <button type="submit">검색하기</button>
              </form>
            </div>
          </div>
          <hr>
          <ul id="placesList"></ul>
          <div id="pagination"></div>
        </div>
      </div>

    </div>
  </section>

  <!--footer-->
  <footer class="section">
    <div class="inner clearfix">

      <ul class="site-links float--right">
        <li><a href="https://web.kangnam.ac.kr/" target="_blank">강남대학교</a></li>
        <li><a href="https://developers.kakao.com/" target="_blank">Kakao
          Developer</a></li>
      </ul>

      <ul class="site-links float--left">
        <li>소프트웨어응용학부 201704071 이규빈</li>
      </ul>

      <a href="#" class="logo"> </a>

    </div>
  </footer>

</div>
<!-- 카카오지도 부분 -->
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=67db8676f9e68a4cfa0568a0cd5a8115&libraries=services"></script>

<script>
  var placeOverlay = new kakao.maps.CustomOverlay({
            zIndex : 1
          }), contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다
          markers = [];

  var container = document.getElementById('map');
  var options = {
    center : new kakao.maps.LatLng(37.481122, 126.920190),
    level : 3
  };

  var map = new kakao.maps.Map(container, options);
  // 장소 검색 객체를 생성합니다
  var ps = new kakao.maps.services.Places();

  // 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다
  contentNode.className = 'placeinfo_wrap';

  // 커스텀 오버레이 컨텐츠를 설정합니다
  placeOverlay.setContent(contentNode);

  // 키워드로 장소를 검색합니다
  searchPlaces();

  // 키워드 검색을 요청하는 함수입니다
  function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
      alert('키워드를 입력해주세요!');
      return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch(keyword, placesSearchCB);
  }

  // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
  function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

      // 정상적으로 검색이 완료됐으면
      // 검색 목록과 마커를 표출합니다
      displayPlaces(data);

      // 페이지 번호를 표출합니다
      displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

      alert('검색 결과가 존재하지 않습니다.');
      return;

    } else if (status === kakao.maps.services.Status.ERROR) {

      alert('검색 결과 중 오류가 발생했습니다.');
      return;

    }
  }

  // 검색 결과 목록과 마커를 표출하는 함수입니다
  function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), menuEl = document
            .getElementById('menu_wrap'), fragment = document
            .createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();

    for (var i = 0; i < places.length; i++) {

      // 마커를 생성하고 지도에 표시합니다
      var placePosition = new kakao.maps.LatLng(places[i].y,
              places[i].x), marker = addMarker(placePosition, i), itemEl = getListItem(
              i, places[i]); // 검색 결과 항목 Element를 생성합니다

      // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
      // LatLngBounds 객체에 좌표를 추가합니다
      bounds.extend(placePosition);

      // 마커와 검색결과 항목에 mouseover 했을때
      // 해당 장소에 인포윈도우에 장소명을 표시합니다
      // mouseout 했을 때는 인포윈도우를 닫습니다
      (function(marker, place) {
        kakao.maps.event.addListener(marker, 'click', function() {
          displayPlaceInfo(place);
        });

        itemEl.onmouseover = function() {
          displayPlaceInfo(place);
        };

        itemEl.onmouseout = function() {
          displayPlaceInfo(false);
        };

      })(marker, places[i]);

      fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
  }

  // 검색결과 항목을 Element로 반환하는 함수입니다
  function getListItem(index, places) {

    var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
            + (index + 1)
            + '"></span>'
            + '<div class="info">'
            + '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
      itemStr += '    <span>' + places.road_address_name + '</span>'
              + '   <span class="jibun gray">' + places.address_name
              + '</span>';
    } else {
      itemStr += '    <span>' + places.address_name + '</span>';
    }

    itemStr += '  <span class="tel">' + places.phone + '</span>'
            + '</div>';

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
  }

  // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
  function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
            imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
            imgOptions = {
              spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
              spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
              offset : new kakao.maps.Point(13, 37)
              // 마커 좌표에 일치시킬 이미지 내에서의 좌표
            }, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
                    imgOptions), marker = new kakao.maps.Marker({
              position : position, // 마커의 위치
              image : markerImage
            });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker); // 배열에 생성된 마커를 추가합니다

    return marker;
  }

  // 지도 위에 표시되고 있는 마커를 모두 제거합니다
  function removeMarker() {
    for (var i = 0; i < markers.length; i++) {
      markers[i].setMap(null);
    }
    markers = [];
  }

  // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
  function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'), fragment = document
            .createDocumentFragment(), i;

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
      paginationEl.removeChild(paginationEl.lastChild);
    }

    for (i = 1; i <= pagination.last; i++) {
      var el = document.createElement('a');
      el.href = "#;";
      el.innerHTML = i;

      if (i === pagination.current) {
        el.className = 'on';
      } else {
        el.onclick = (function(i) {
          return function() {
            pagination.gotoPage(i);
          }
        })(i);
      }

      fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
  }

  // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
  // 검색결과 목록의 자식 Element를 제거하는 함수입니다
  function removeAllChildNods(el) {
    while (el.hasChildNodes()) {
      el.removeChild(el.lastChild);
    }
  }

  function displayPlaceInfo(place) {
    var content = '<div class="placeinfo">'
            + '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">'
            + place.place_name + '</a>';

    if (place.road_address_name) {
      content += '    <span title="' + place.road_address_name + '">'
              + place.road_address_name
              + '</span>'
              + '  <span class="jibun" title="' + place.address_name + '">(지번 : '
              + place.address_name + ')</span>';
    } else {
      content += '    <span title="' + place.address_name + '">'
              + place.address_name + '</span>';
    }

    content += '    <span class="tel">' + place.phone + '</span>'
            + '</div>' + '<div class="after"></div>';

    contentNode.innerHTML = content;
    placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
    placeOverlay.setMap(map);
  }

  function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title
            + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
  }
</script>

</body>
</html>