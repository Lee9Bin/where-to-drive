<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>게시글 작성</title>
	<link rel="icon" href="/resources/img/icons8-car-roof-box-48.png">
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/css/main.css">
</head>
<body>
<article>
	<div class="container mt-4" role="main">
		<h2>게시글을 작성해보세요!</h2>
		<form id="form" role="form" method="post" action="/boards/write">
			<input type="hidden" name="mode" />
			<div class="mb-3">
				<label for="title">제목</label>
				<input type="text" name="title" id="title" class="form-control" placeholder="제목을 입력해 주세요" />
			</div>
			<div class="mb-3">
				<label for="reg_id">작성자</label>
				<input type="text" name="reg_id" id="reg_id" class="form-control" value="${member.id}" readonly />
			</div>
			<div class="mb-3">
				<label for="content">내용</label>
				<textarea name="content" id="content" class="form-control" rows="5" placeholder="내용을 입력해 주세요"></textarea>
			</div>
			<div class="mb-3">
				<label for="tag">TAG</label>
				<input type="text" name="tag" id="tag" class="form-control" placeholder="태그를 입력해 주세요" />
			</div>
		</form>
		<div>
			<button type="button" class="btn" id="btnSave">저장</button>
			<button type="button" class="btn" id="btnList">목록</button>
		</div>
	</div>
</article>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous">
</script>
<script>

	$(document).on('click', '#btnSave', function(e) {
		e.preventDefault();
		$("#form").submit();
	});

	$(document).on('click', '#btnList', function(e) {
		e.preventDefault();
		location.href = "${pageContext.request.contextPath}/boards/getBoardList";
	});
</script>
</body>
</html>
