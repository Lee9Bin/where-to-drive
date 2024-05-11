<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>

<!DOCTYPE html>
<html>
<head>

    <link rel="icon" href="/resources/img/icons8-car-roof-box-48.png">
    <meta charset="UTF-8">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.css">
    <link rel="stylesheet" href="/resources/css/main.css">

    <title>드라이브 어디갈Car!</title>

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
    <div class="container" role="main">
        <h2></h2>
        <div class="bg-white rounded shadow-sm" style="margin-top: 20px;">
            <div class="board_title">
                <c:out value="${boardContent.title}"/>
            </div>

            <div class="board_info_box">
					<span class="board_author"><c:out
                            value="${boardContent.reg_id}"/>,</span><span class="board_date"><c:out
                    value="${boardContent.reg_dt}"/></span>
            </div>

            <div class="board_content">${boardContent.content}</div>
            <div class="board_tag">
                TAG :
                <c:out value="${boardContent.tag}"/>
            </div>
        </div>

        <div class="sign-in">
            <div class="btn-group" role="group" aria-label="Board Actions">
                <form class="mx-1" action="/boards/editForm/${boardContent.bid}" method="get">
                    <button type="submit" class="btn">수정</button>
                </form>
                <form class="mx-1" action="/boards/delete/${boardContent.bid}" method="post">
                    <button type="submit" class="btn">삭제</button>
                </form>
                <form class="mx-1" action="/boards" method="get">
                    <button type="submit" class="btn ">목록</button>
                </form>
            </div>
        </div>
    </div>
</article>
</body>
</html>