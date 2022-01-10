<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="DBPKG.DBCon" %>
<%@ page import="DBPKG.Sales" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
    Statement statement;
    ResultSet resultSet;
%>
<%
    request.setCharacterEncoding("UTF-8");
    try {
        statement = DBCon.getConnection().createStatement();

        String sql = "SELECT m.회원번호, m.회원성명, m.고객등급, SUM(o.가격) AS 매출 FROM member_tbl_02 m " +
                     "JOIN money_tbl_02 o ON m.회원번호 = o.회원번호 GROUP BY m.회원번호, m.회원성명, m.고객등급 ORDER BY 매출 DESC";

        resultSet = statement.executeQuery(sql);

        ArrayList<Sales> salesList = new ArrayList<>();
        while (resultSet.next()){
            Sales sales = new Sales();
            sales.setCustno(resultSet.getInt("회원번호"));
            sales.setCustname(resultSet.getString("회원성명"));
            sales.setGrade(resultSet.getString("고객등급"));
            sales.setTotal(resultSet.getInt("매출"));
            salesList.add(sales);
        }
        pageContext.setAttribute("salesList", salesList);
    } catch (ClassNotFoundException | SQLException e){
        e.printStackTrace();
    }
%>
	<div id="header">
		<jsp:include page="header.jsp" flush="false"/>
	</div>
<section>
    <div>
        <h2>회원목록조회/수정</h2>
    </div>
    <div>
        <table border="1">
            <tr>
                <th>회원번호</th><th>회원성명</th><th>고객등급</th><th>매출</th>
            </tr>
            <c:forEach var="s" items="${salesList}">
                <tr>
                    <td>${s.custno}</td>
                    <td>${s.custname}</td>
                    <td><c:choose>
                        <c:when test="${s.grade eq 'A'}">
                            VIP
                        </c:when>
                        <c:when test="${s.grade eq 'B'}">
                            일반
                        </c:when>
                        <c:when test="${s.grade eq 'C'}">
                            직원
                        </c:when>
                    </c:choose>
                    </td>
                    <td>${s.total}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</section>
<div id="footer">
    <jsp:include page="footer.jsp" flush="false"/>
</div>
</body>
<%
    try {
        resultSet.close();
        statement.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
</html>