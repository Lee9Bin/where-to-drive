<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri = "http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/layout/header.jsp"%>



<!DOCTYPE html>

<html>
<head>

<link rel="icon" href="/resources/img/icons8-car-roof-box-48.png">
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.css">
<link rel="stylesheet" href="/resources/css/main.css">


<title>드라이브 어디갈Car!</title>



<script>
	//목록으로 이동
	$(document).on('click', '#btnList', function() {
		location.href = "${pageContext.request.contextPath}/boards/getBoardList";
		}
	);
	
	//수정버튼 클릭
	$(document).on('click', '#btnUpdate', function() {
		var url = "${pageContext.request.contextPath}/boards/editForm";
		url = url + "?bid="+${boardContent.bid};
		url = url + "&mode=edit";
		
		
		location.href = url;
	});
	
	//삭제 버튼 클릭 이벤트

	$(document).on('click', '#btnDelete', function(){

    var url = "${pageContext.request.contextPath}/boards/deleteBoard";

    url = url + "?bid=" + ${boardContent.bid};

		location.href = url;

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
					<li><a href="http://localhost:8080/boards
					/getBoardList"
						target="_blank">게시판</a></li>
					<li><a href="https://weather.naver.com/today/09620102"
						target="_blank">오늘의 날씨</a></li>

				</ul>
			</div>

			<div class="sign-group float--right">
				<div class="btn-group">
					<a href="" class="btn sign-in">로그인</a> <a
						href="http://127.0.0.1:5500/signup.html" target="_blank"
						class="btn btn--primary sign-up">회원가입</a>
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
					<c:out value="${boardContent.title}" />
				</div>

				<div class="board_info_box">
					<span class="board_author"><c:out
							value="${boardContent.reg_id}" />,</span><span class="board_date"><c:out
							value="${boardContent.reg_dt}" /></span>
				</div>

				<div class="board_content">${boardContent.content}</div>
				<div class="board_tag">
					TAG :
					<c:out value="${boardContent.tag}" />
				</div>
			</div>

			<div style="margin-top: 20px">
				<button type="button" class="btn sign-in" id="btnUpdate">수정</button>
				<button type="button" class="btn sign-in" id="btnDelete">삭제</button>
				<button type="button" class="btn sign-in" id="btnList">목록</button>

			</div>

		</div>



	</article>

</body>

</html>