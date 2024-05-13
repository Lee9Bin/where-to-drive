<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>드라이브 어디갈Car!</title>
    <link rel="icon" href="/resources/img/icons8-car-roof-box-48.png">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');

        * {
            font-family: 'Noto Sans KR', sans-serif;
        }

        body {
            background: #1d466c;
            margin: 200px auto;

        }

        div {
            justify-content: center;
            align-items: center;
            margin: auto;
            width: 300px;
            background-color: #EEEFF1;
            border-radius: 5px;
            text-align: center;
            padding: 20px;
        }

        input {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border-radius: 5px;
            border: none;
        }

        .in {
            margin-bottom: 10px;
        }

        #btn {
            background-color: #1BBC9B;
            margin-bottom: 30px;
            color: white;
        }

        a {
            text-decoration: none;
            color: #9B9B9B;
            font-size: 12px;
        }

        h2 {
            text-align: center;
            color: #ffffff;
        }
    </style>
</head>

<body>
<h2>드라이브 어디갈Car!</h2>
<div>
    <form accept-charset="UTF-8" method="post" action="/member/login">
        <input type="text" placeholder="아이디" class="in" id="id" name="id">
        <input type="password" placeholder="비밀번호" class="in" id="memberPw" name="password">
		<input type="submit" id="btn" value="로그인">
        <c:if test="${msg == false}">
            <a style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</a>
        </c:if>
        <br>
    </form>
    <a href="http://localhost:8080/member/join" target="_blank">계정이
        없으신가요?</a>
    <!-- 	<br>
    <a href="#none">비밀번호를 잊어버리셨나요?</a> -->
</div>
</body>

</html>