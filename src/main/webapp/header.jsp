<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	a {
		text-decoration: none;
	}
	
    div {
   		 margin: 0 auto;
         text-align: center;
         overflow: hidden;
    }
    
	li {
		width: 140px;
		height: 30px;
		line-height: 30px;
		border : solid 1px;
		list-style: none;
		float : left;
		font-weight: bold;
	}

	 section {
		 height: 500px;
	 }

	 table {
		 text-align: center;
		 margin: 0 auto;
	 }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<h1>쇼핑몰 회원관리 ver1.0</h1>
</div>
<nav>
	<div>
	<ul>
		<li><a href="signIn.jsp">회원등록</a></li>
		<li><a href="memberList.jsp">회원목록조회/수정</a></li>
		<li><a href="salesInfo.jsp">회원매출조회</a></li>
		<li><a href="search.jsp">검색</a> </li>
		<li><a href="index.jsp">홈으로</a></li>
	</ul>
	</div>
	<hr>
</nav>
</body>
</html>