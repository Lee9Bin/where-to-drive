<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 부트스트랩 CSS -->
<link rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
      integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
      crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/main.css">
<%@ include file="/WEB-INF/views/layout/header.jsp" %>

<article>
    <div class="container" role="main">
        <h2></h2>
        <div class="bg-white rounded shadow-sm" style="margin-top: 20px;">
            <table class="table table-bordered">
                <tbody>
                <tr>
                    <th class="bg-light" scope="row" style="width: 150px;">제목</th>
                    <td><c:out value="${board.title}"/></td>
                </tr>
                <tr>
                    <th class="bg-light" scope="row">작성자</th>
                    <td><c:out value="${board.reg_id}"/></td>
                </tr>
                <tr>
                    <th class="bg-light" scope="row">작성일</th>
                    <td><c:out value="${board.reg_dt}"/></td>
                </tr>
                <tr>
                    <th class="bg-light" scope="row">내용</th>
                    <td><c:out value="${board.content}"/></td>
                </tr>
                <tr>
                    <th class="bg-light" scope="row">태그</th>
                    <td><c:out value="${board.tag}"/></td>
                </tr>
                </tbody>
            </table>

            <div class="sign-in">
                <div class="btn-group" role="group" aria-label="Board Actions">
                    <c:if test="${board.reg_id == member.id}">
                        <form class="mx-1" action="/boards/edit/${board.bid}" method="get">
                            <button type="submit" class="btn btn-primary">수정</button>
                        </form>
                        <form class="mx-1" action="/boards/delete/${board.bid}" method="post">
                            <button type="submit" class="btn btn-danger">삭제</button>
                        </form>
                    </c:if>
                    <form class="mx-1" action="/boards" method="get">
                        <button type="submit" class="btn btn-secondary">목록</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</article>
</body>
</html>
