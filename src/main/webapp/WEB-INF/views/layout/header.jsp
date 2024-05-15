<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>

    <link rel="icon" href="/resources/img/icons8-car-roof-box-48.png">
    <link rel="apple-touch-icon"
          href="/resources/img/icons8-car-roof-box-48.png">
    <!-- 구글폰트 적용 -->
    <link
            href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap"
            rel="stylesheet">
    <!-- css 리셋 한 후 메인 css호출 해야해 -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.css">
    <link rel="stylesheet" href="resources/css/main.css">


</head>
<body>
<!-- 헤더 -->
<header class="section">
    <div class="inner clearfix">
        <div class="menu-group float--left">
            <div class="logo">
                <a href="/">Drive</a>
            </div>
            <ul class="main-menu">
                <li><a href="http://localhost:8080/boards?pgno=1&key=&word=" style="margin-bottom: 3px;">게시판</a></li>
                <li><a href="https://weather.naver.com/today/09620102"
                       target="_blank" style="margin-bottom: 3px;">오늘의 날씨</a></li>
            </ul>
<%--            <!-- 구글 검색창 -->--%>
<%--            <script async--%>
<%--                    src="https://cse.google.com/cse.js?cx=76038bc9cb5644c05"></script>--%>
<%--            <div class="gcse-searchbox-only"></div>--%>
        </div>

        <div class="sign-group float--right">
            <div class="btn-group">
                <c:if test="${member != null}">
                    <span style="padding-top: 8px;">${member.id}님 환영합니다.</span>
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
