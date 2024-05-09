<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
          integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
          crossorigin="anonymous">

    <title>드라이브 어디갈카!</title>
    <meta name="author" content="GYUB">
    <meta name="description" content="Gyub World">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, user-scalable=no, maximum-scale=1, minimum-scale=1">

    <link rel="icon" href="/resources/img/icons8-car-roof-box-48.png">
    <link rel="apple-touch-icon"
          href="/resources/img/icons8-car-roof-box-48.png">
    <!-- 구글폰트 적용 -->
    <link
            href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap"
            rel="stylesheet">
    <link
            href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap"
            rel="stylesheet">
    <!-- css 리셋 한 후 메인 css호출 해야해 -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.css">
    <link rel="stylesheet" href="/resources/css/main.css">


    <style>
        .map_wrap, .map_wrap * {
            margin: 0;
            padding: 0;
            font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
            font-size: 12px;
        }

        .map_wrap {
            position: relative;
            width: 100%;
            height: 350px;
        }

        #category {
            position: absolute;
            top: 10px;
            left: 10px;
            border-radius: 5px;
            border: 1px solid #909090;
            box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);
            background: #fff;
            overflow: hidden;
            z-index: 2;
        }

        #category li {
            float: left;
            list-style: none;
            width: 50px;
            px;
            border-right: 1px solid #acacac;
            padding: 6px 0;
            text-align: center;
            cursor: pointer;
        }

        #category li.on {
            background: #eee;
        }

        #category li:hover {
            background: #ffe6e6;
            border-left: 1px solid #acacac;
            margin-left: -1px;
        }

        #category li:last-child {
            margin-right: 0;
            border-right: 0;
        }

        #category li span {
            display: block;
            margin: 0 auto 3px;
            width: 27px;
            height: 28px;
        }

        #category li .category_bg {
            background: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png) no-repeat;
        }

        #category li .bank {
            background-position: -10px 0;
        }

        #category li .mart {
            background-position: -10px -36px;
        }

        #category li .pharmacy {
            background-position: -10px -72px;
        }

        #category li .oil {
            background-position: -10px -108px;
        }

        #category li .cafe {
            background-position: -10px -144px;
        }

        #category li .store {
            background-position: -10px -180px;
        }

        #category li.on .category_bg {
            background-position-x: -46px;
        }

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
            background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
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
            background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;
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

    <!-- 글쓰기 버튼, 수정, 삭제 -->
    <script>
        $(document).on('click', '#btnWriteForm', function (e) {

            e.preventDefault();


            location.href = "${pageContext.request.contextPath}/boards/boardForm";

        });

        function fn_contentView(bid) {

            var url = "${pageContext.request.contextPath}/boards/getBoardContent";

            url = url + "?bid=" + bid;

            location.href = url;

        }

        //이전 버튼 이벤트
        function fn_prev(page, range, rangeSize, searchType, keyword) {
            var page = ((range - 2) * rangeSize) + 1;
            var range = range - 1;

            var url = "${pageContext.request.contextPath}/boards/getBoardList";
            url = url + "?page=" + page;
            url = url + "&range=" + range;
            url = url + "&searchType=" + $('#searchType').val();
            url = url + "&keyword=" + keyword;
            location.href = url;
        }


        //페이지 번호 클릭
        function fn_pagination(page, range, rangeSize, searchType, keyword) {
            var url = "${pageContext.request.contextPath}/boards/getBoardList";
            url = url + "?page=" + page;
            url = url + "&range=" + range;
            url = url + "&searchType=" + searchType;
            url = url + "&keyword=" + keyword;
            location.href = url;
        }


        //다음 버튼 이벤트
        function fn_next(page, range, rangeSize, searchType, keyword) {
            var page = parseInt((range * rangeSize)) + 1;
            var range = parseInt(range) + 1;

            var url = "${pageContext.request.contextPath}/boards/getBoardList";
            url = url + "?page=" + page;
            url = url + "&range=" + range;
            url = url + "&searchType=" + $('#searchType').val();
            url = url + "&keyword=" + keyword;
            location.href = url;
        }

        $(document).on('click', '#btnSearch', function (e) {

            e.preventDefault();

            var url = "${pageContext.request.contextPath}/boards/getBoardList";

            url = url + "?searchType=" + $('#searchType').val();

            url = url + "&keyword=" + $('#keyword').val();

            location.href = url;

            console.log(url);

        });

    </script>

</head>

<body>
<!--  머리 부분 -->
<header class="section">
    <div class="inner clearfix">

        <div class="menu-group float--left">
            <div class="logo">
                <a href="">Drive</a>
            </div>
            <ul class="main-menu">
                <li><a href="http://localhost:8080/boards/getBoardList"
                       target="_blank">게시판</a></li>
                <li><a href="https://weather.naver.com/today/09620102"
                       target="_blank">오늘의 날씨</a></li>

            </ul>
        </div>

        <div class="sign-group float--right">
            <div class="btn-group">
                <c:if test="${member != null}">
                    <a href="/member/logout" class="btn sign-in">로그아웃</a>
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
                <input type="text" id="search" class="input--text"
                       placeholder="검색어를 입력하세요"> <input type="submit"
                                                        value="submit">
            </form>
            <ul class="sub-menu">
                <li><a href="https://ko-kr.facebook.com/" target="_blank">Facebook</a></li>
                <li><a href="https://www.instagram.com/" target="_blank">Instagram</a></li>
            </ul>

        </div>

    </div>
</header>

<article>
    <section class="section section--map">
        <div class="inner">
            <div class="summary">
                <div class="summary__title">여러분들의 다양한 드라이브 경험을 알려주세요!</div>
            </div>
            <div class="container">
                <div class="table-responsive">
                    <table class="table table-striped table-sm">
                        <colgroup>
                            <col style="width: 5%;"/>
                            <col style="width: auto;"/>
                            <col style="width: 15%;"/>
                            <col style="width: 10%;"/>
                            <col style="width: 10%;"/>
                        </colgroup>
                        <thead>
                        <tr>
                            <th>NO</th>
                            <th>글제목</th>
                            <th>작성자</th>
                            <th>조회수</th>
                            <th>작성일</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:choose>
                            <c:when test="${empty boardList }">
                                <tr>
                                    <td colspan="5" align="center">데이터가 없습니다.</td>
                                </tr>
                            </c:when>
                            <c:when test="${!empty boardList}">
                                <c:forEach var="list" items="${boardList}">
                                    <tr>
                                        <td><c:out value="${list.bid}"/></td>
                                        <td><a href="#"
											   onClick="fn_contentView(<c:out value="${list.bid}"/>)">
											<c:out value="${list.title}"/>
										</a></td>
                                        <td><c:out value="${list.reg_id}"/></td>
                                        <td><c:out value="${list.view_cnt}"/></td>
                                        <td><c:out value="${list.reg_dt}"/></td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                        </c:choose>
                        </tbody>
                    </table>
                </div>
                <div>
                    <c:if test="${member.memberId != null}">
                        <button type="button" class="btn sign-in" id="btnWriteForm"
                                style="margin-bottom: 10px;">글쓰기
                        </button>
                    </c:if>
                </div>

                <!-- pagination{s} -->

                <div id="paginationBox">

                    <ul class="pagination">

                        <c:if test="${pagination.prev}">

                            <li class="page-item"><a class="page-link" href="#"
                                                     onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${search.searchType }', '${search.keyword }' )">Previous</a>
                            </li>

                        </c:if>


                        <c:forEach begin="${pagination.startPage}"
                                   end="${pagination.endPage}" var="idx">

                            <li
                                    class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a
                                    class="page-link" href="#"
                                    onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}', '${search.searchType }', '${search.keyword }')">
                                    ${idx} </a></li>

                        </c:forEach>


                        <c:if test="${pagination.next}">

                            <li class="page-item"><a class="page-link" href="#"
                                                     onClick="fn_next('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${search.searchType }', '${search.keyword }')">Next</a>
                            </li>

                        </c:if>

                    </ul>

                </div>

                <!-- pagination{e} -->

                <!-- search{s} -->

                <div class="form-group row justify-content-center">

                    <div class="w100" style="padding-right: 10px">

                        <select class="form-control form-control-sm" name="searchType"
                                id="searchType" style="margin-top: 10px">

                            <option value="title">제목</option>
                            <option value="reg_id">작성자</option>

                        </select>

                    </div>

                    <div class="w300" style="padding-right: 10px">

                        <input type="text" class="form-control form-control-sm"
                               name="keyword" id="keyword" style="margin-top: 10px">

                    </div>

                    <div>

                        <button class="btn sign-in" name="btnSearch" id="btnSearch"
                                style="margin-top: 10px">검색
                        </button>

                    </div>

                </div>

                <!-- search{e} -->


            </div>
        </div>
    </section>

    <!--map-->
    <section class="section section--map">
        <div class="inner">

            <div class="summary">
                <div class="summary__title">카테고리 별로 검색해보세요</div>
                <div class="summary__description">아래의 버튼을 눌러보세요!</div>
            </div>
            <!-- 지도 -->
            <div id="map">

                <div class="map_wrap">
                    <ul id="category">
                        <li id="BK9" data-order="0"><span class="category_bg bank"></span>
                            은행
                        </li>
                        <li id="MT1" data-order="1"><span class="category_bg mart"></span>
                            마트
                        </li>
                        <li id="PM9" data-order="2"><span
                                class="category_bg pharmacy"></span> 약국
                        </li>
                        <li id="OL7" data-order="3"><span class="category_bg oil"></span>
                            주유소
                        </li>
                        <li id="CE7" data-order="4"><span class="category_bg cafe"></span>
                            카페
                        </li>
                        <li id="CS2" data-order="5"><span class="category_bg store"></span>
                            편의점
                        </li>
                    </ul>
                </div>

            </div>
        </div>
    </section>


</article>

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

<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=67db8676f9e68a4cfa0568a0cd5a8115&libraries=services"></script>
<script>
    // 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
    var placeOverlay = new kakao.maps.CustomOverlay({zIndex: 1}),
        contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다
        markers = [], // 마커를 담을 배열입니다
        currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    // 지도를 생성합니다
    var map = new kakao.maps.Map(mapContainer, mapOption);

    // 장소 검색 객체를 생성합니다
    var ps = new kakao.maps.services.Places(map);

    // 지도에 idle 이벤트를 등록합니다
    kakao.maps.event.addListener(map, 'idle', searchPlaces);

    // 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다
    contentNode.className = 'placeinfo_wrap';

    // 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
    // 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다
    addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
    addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);

    // 커스텀 오버레이 컨텐츠를 설정합니다
    placeOverlay.setContent(contentNode);

    // 각 카테고리에 클릭 이벤트를 등록합니다
    addCategoryClickEvent();

    // 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
    function addEventHandle(target, type, callback) {
        if (target.addEventListener) {
            target.addEventListener(type, callback);
        } else {
            target.attachEvent('on' + type, callback);
        }
    }

    // 카테고리 검색을 요청하는 함수입니다
    function searchPlaces() {
        if (!currCategory) {
            return;
        }

        // 커스텀 오버레이를 숨깁니다
        placeOverlay.setMap(null);

        // 지도에 표시되고 있는 마커를 제거합니다
        removeMarker();

        ps.categorySearch(currCategory, placesSearchCB, {useMapBounds: true});
    }

    // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
    function placesSearchCB(data, status, pagination) {
        if (status === kakao.maps.services.Status.OK) {

            // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
            displayPlaces(data);
        } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
            // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

        } else if (status === kakao.maps.services.Status.ERROR) {
            // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요

        }
    }

    // 지도에 마커를 표출하는 함수입니다
    function displayPlaces(places) {

        // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
        // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
        var order = document.getElementById(currCategory).getAttribute('data-order');


        for (var i = 0; i < places.length; i++) {

            // 마커를 생성하고 지도에 표시합니다
            var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);

            // 마커와 검색결과 항목을 클릭 했을 때
            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
            (function (marker, place) {
                kakao.maps.event.addListener(marker, 'click', function () {
                    displayPlaceInfo(place);
                });
            })(marker, places[i]);
        }
    }

    // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
    function addMarker(position, order) {
        var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
            imageSize = new kakao.maps.Size(27, 28),  // 마커 이미지의 크기
            imgOptions = {
                spriteSize: new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
                spriteOrigin: new kakao.maps.Point(46, (order * 36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                offset: new kakao.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
            },
            markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
                position: position, // 마커의 위치
                image: markerImage
            });

        marker.setMap(map); // 지도 위에 마커를 표출합니다
        markers.push(marker);  // 배열에 생성된 마커를 추가합니다

        return marker;
    }

    // 지도 위에 표시되고 있는 마커를 모두 제거합니다
    function removeMarker() {
        for (var i = 0; i < markers.length; i++) {
            markers[i].setMap(null);
        }
        markers = [];
    }

    // 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
    function displayPlaceInfo(place) {
        var content = '<div class="placeinfo">' +
            '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';

        if (place.road_address_name) {
            content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
                '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
        } else {
            content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
        }

        content += '    <span class="tel">' + place.phone + '</span>' +
            '</div>' +
            '<div class="after"></div>';

        contentNode.innerHTML = content;
        placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
        placeOverlay.setMap(map);
    }


    // 각 카테고리에 클릭 이벤트를 등록합니다
    function addCategoryClickEvent() {
        var category = document.getElementById('category'),
            children = category.children;

        for (var i = 0; i < children.length; i++) {
            children[i].onclick = onClickCategory;
        }
    }

    // 카테고리를 클릭했을 때 호출되는 함수입니다
    function onClickCategory() {
        var id = this.id,
            className = this.className;

        placeOverlay.setMap(null);

        if (className === 'on') {
            currCategory = '';
            changeCategoryClass();
            removeMarker();
        } else {
            currCategory = id;
            changeCategoryClass(this);
            searchPlaces();
        }
    }

    // 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
    function changeCategoryClass(el) {
        var category = document.getElementById('category'),
            children = category.children,
            i;

        for (i = 0; i < children.length; i++) {
            children[i].className = '';
        }

        if (el) {
            el.className = 'on';
        }
    }

    //현재위치 함수
    // HTML5의 geolocation으로 사용할 수 있는지 확인합니다
    if (navigator.geolocation) {

        // GeoLocation을 이용해서 접속 위치를 얻어옵니다
        navigator.geolocation.getCurrentPosition(function (position) {

            var lat = position.coords.latitude, // 위도
                lon = position.coords.longitude; // 경도

            var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
                message = '<div style="padding:7px;">현재위치 입니다.</div>'; // 인포윈도우에 표시될 내용입니다

            // 마커와 인포윈도우를 표시합니다
            displayMarker(locPosition, message);

        });

    } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

        var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),
            message = 'geolocation을 사용할수 없어요..'

        displayMarker(locPosition, message);
    }

    // 지도에 마커와 인포윈도우를 표시하는 함수입니다
    function displayMarker(locPosition, message) {

        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: locPosition
        });

        var iwContent = message, // 인포윈도우에 표시할 내용
            iwRemoveable = true;

        // 인포윈도우를 생성합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: iwContent,
            removable: iwRemoveable
        });

        // 인포윈도우를 마커위에 표시합니다
        infowindow.open(map, marker);

        // 지도 중심좌표를 접속위치로 변경합니다
        map.setCenter(locPosition);
    }
</script>
</body>

</html>