<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="DBPKG.DBCon" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		#info {
			width: 900px;
			margin: 0 auto;
			text-align: left;
		}
	</style>
</head>
<body>
</body>
	<div id="header">
		<jsp:include page="header.jsp" flush="false"/>
	</div>
	<section>
		<div id="info">
		쇼핑몰 회원종보와 회원 매출정보 데이터베이스를 구축하고 회원관리 프로그램을 작성하는 프로그램이다.<br>
		프로그램 작성순서<br>
		1. 회원정보 테이블을 생성한다.<br>
		2. 매출정보 테이블을 생성한다.<br>
		3. 회원정보, 매출정보 테이블에 제시된 문제지의 참조데이터를 추가 생성한다.<br>
		4. 회원정보 입력 화면 프로그램을 작성한다.<br>
		5. 회원정보 조회 프로그램을 작성한다.<br>
		6. 회원 매출정보 조회 프로그램을 작성한다.<br>
		</div>
	</section>
	<div id="footer">
		<jsp:include page="footer.jsp" flush="false"/>
	</div>
</html>