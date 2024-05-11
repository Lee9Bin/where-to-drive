<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
      integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
      crossorigin="anonymous">
<%@include file="../layout/header.jsp"%>
<article>
    <section class="section section--map">
        <div class="inner">
            <div class="summary">
                <div class="summary__title">여러분들의 다양한 드라이브 경험을 알려주세요!</div>
            </div>
            <div class="container">
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead class="thead-dark">
                        <tr>
                            <th scope="col">NO</th>
                            <th scope="col">글 제목</th>
                            <th scope="col">작성자</th>
                            <th scope="col">조회수</th>
                            <th scope="col">작성일</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:choose>
                            <c:when test="${empty boardList}">
                                <tr>
                                    <td colspan="5" class="text-center">게시글이 없습니다.</td>
                                </tr>
                            </c:when>
                            <c:when test="${!empty boardList}">
                                <c:forEach var="list" items="${boardList}" varStatus="status">
                                    <tr>
                                        <td><c:out value="${status.index + 1}" /></td>
                                        <td><a href="/boards/${list.bid}">
                                            <c:out value="${list.title}" />
                                        </a></td>
                                        <td><c:out value="${list.reg_id}" /></td>
                                        <td><c:out value="${list.view_cnt}" /></td>
                                        <td><c:out value="${list.reg_dt}" /></td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                        </c:choose>
                        </tbody>
                    </table>
                </div>
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
<%@include file="../layout/footer.jsp"%>

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