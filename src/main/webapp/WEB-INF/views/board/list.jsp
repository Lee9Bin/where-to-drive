<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
      integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
      crossorigin="anonymous">
<%@include file="../layout/header.jsp" %>
<article>
    <section class="section section--map">
        <div class="mt-5">
            <div class="summary">
            </div>
            <div class="row justify-content-center">
                <div class="summary__title">여러분들의 다양한 드라이브 경험을 알려주세요!</div>
                <div class="col-lg-8 col-md-10 col-sm-12">
                    <h2 class="my-3 py-3 shadow-sm bg-light text-center">
                        <mark class="sky">글목록</mark>
                    </h2>
                </div>
                <div class="col-lg-8 col-md-10 col-sm-12">
                    <div class="row align-self-center mb-2">
                        <c:if test="${member != null}">
                            <div class="col-md-2 text-start">
                                <button type="button" id="writeForm" class="btn btn-sm">
                                    글쓰기
                                </button>
                            </div>
                        </c:if>
                        <div class="col-md-7 offset-3">
                            <form class="d-flex" id="form-search" action="">
                                <input type="hidden" name="pgno" value="1"/>
                                <select
                                        name="key"
                                        id="key"
                                        class="form-select form-select-sm mr-1 w-50 form-control"
                                        aria-label="검색조건">
                                    <option selected>검색조건</option>
                                    <option value="title">제목</option>
                                    <option value="userid">작성자</option>
                                </select>
                                <div class="input-group">
                                    <input type="text" name="word" id="word" class="form-control"
                                           placeholder="검색어..." value="${word}"/>
                                    <button id="btn-search" class="btn ml-1" type="button">검색</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <table class="table table-hover">
                        <thead>
                        <tr class="text-center">
                            <th scope="col">글번호</th>
                            <th scope="col">제목</th>
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
                                    <tr data-bid="${list.bid}">
                                        <td><c:out value="${status.index + 1}"/></td>
                                        <td class="article-title" data-no="${list.bid}">
                                            <a href="/boards/${list.bid}">
                                                <c:out value="${list.title}"/>
                                            </a>
                                        </td>
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
            </div>
            ${navigation.navigator}
        </div>
        <form id="form-param" method="get" action="">
            <input type="hidden" name="pgno" id="pgno" value="${pgno}">
            <input type="hidden" name="key" value="${key}">
            <input type="hidden" name="word" value="${word}">
        </form>
    </section>
</article>
<%@include file="../layout/footer.jsp" %>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        document.querySelectorAll(".article-title").forEach(title => {
            title.addEventListener("click", () => {
                document.querySelector("#articleno").value = title.dataset.no;
                document.querySelector("#form-no-param").submit();
            });
        });

        document.addEventListener("DOMContentLoaded", function () {
            document.querySelector("#writeForm").addEventListener("click", function () {
                window.location.href = "/boards/write";
            });
        });

        document.querySelector("#btn-search").addEventListener("click", () => {
            const form = document.querySelector("#form-search");
            form.action = "/boards";
            form.submit();
        });

        let pages = document.querySelectorAll(".page-link");
        pages.forEach(function (page) {
            page.addEventListener("click", function () {
                document.querySelector("#pgno").value = this.parentNode.getAttribute("data-pg");
                let form = document.querySelector("#form-param");
                form.setAttribute("action", "/boards");
                form.submit();
            });
        });

    });
</script>
