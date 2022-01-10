<%@ page import="java.sql.Statement" %>
<%@ page import="DBPKG.DBCon" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="DBPKG.Member" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<%!
    Statement statement;
    ResultSet resultSet;
%>
<%
    request.setCharacterEncoding("UTF-8");
    try {
        statement = DBCon.getConnection().createStatement();

        String sql = "SELECT * FROM member_tbl_02 WHERE 회원성명 = '" + request.getParameter("custname") + "'";
        resultSet = statement.executeQuery(sql);

        resultSet.next();
        Member member = new Member();
        member.setCustno(resultSet.getInt("회원번호"));
        member.setCustname(resultSet.getString("회원성명"));
        member.setPhone(resultSet.getString("회원전화"));
        member.setAddress(resultSet.getString("주소"));
        member.setJoindate(resultSet.getDate("가입일자"));
        member.setGrade(resultSet.getString("고객등급"));
        member.setCity(resultSet.getString("거주도시"));
        pageContext.setAttribute("member", member);
    }catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    }
%>
<body>
<jsp:include page="header.jsp"/>
<section>
    <div>
        <h2>회원 정보</h2>
    </div>
    <div>
        <table border="1">
            <tr>
                <td>회원번호</td><td>${member.custno}</td>
            </tr>
            <tr>
                <td>회원성명</td><td>${member.custname}</td>
            </tr>
            <tr>
                <td>회원전화</td><td>${member.phone}</td>
            </tr>
            <tr>
                <td>회원주소</td><td>${member.address}</td>
            </tr>
            <tr>
                <td>가입일자</td><td>${member.joindate}</td>
            </tr>
            <tr>
                <td>고객등급[A:VIP,B:일반,C:직원]</td><td>
                <c:choose>
                    <c:when test="${member.grade eq 'A'}">
                        VIP
                    </c:when>
                    <c:when test="${member.grade eq 'B'}">
                        일반
                    </c:when>
                    <c:when test="${member.grade eq 'C'}">
                        직원
                    </c:when>
                </c:choose>
            </td>
            </tr>
            <tr>
                <td>도시코드</td><td>${member.city}</td>
            </tr>
        </table>
    </div>
</section>
<jsp:include page="footer.jsp"/>
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
