<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.DBCon" %>
<%@ page import="DBPKG.Member" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
	<div id="header">
		<jsp:include page="header.jsp" flush="false"/>
	</div>
<%!
    Statement statement;
    ResultSet resultSet;
%>
<%
    request.setCharacterEncoding("UTF-8");
    try {
        statement = DBCon.getConnection().createStatement();

        String sql = "SELECT * FROM member_tbl_02";
        resultSet = statement.executeQuery(sql);

        ArrayList<Member> members = new ArrayList<>();
        while (resultSet.next()) {
            Member m = new Member();
            m.setCustno(resultSet.getInt("회원번호"));
            m.setCustname(resultSet.getString("회원성명"));
            m.setPhone(resultSet.getString("회원전화"));
            m.setAddress(resultSet.getString("주소"));
            m.setJoindate(resultSet.getDate("가입일자"));
            m.setGrade(resultSet.getString("고객등급"));
            m.setCity(resultSet.getString("거주도시"));

            members.add(m);
        }
        pageContext.setAttribute("members", members);
    } catch (ClassNotFoundException | SQLException e){
        e.printStackTrace();
    }
%>
<section>
    <div>
        <h2>회원목록조회/수정</h2>
    </div>
    <div>
        <table border="1">
            <tr>
                <th>회원번호</th><th>회원성명</th><th>회원전화</th><th>주소</th><th>가입일자</th><th>고객등급</th><th>거주도시</th>
            </tr>
            <c:forEach var="m" items="${members}">
                <tr>
                    <td><a href="changeInfo.jsp?custno=${m.custno}">${m.custno}</a></td>
                    <td>${m.custname}</td>
                    <td>${m.phone}</td>
                    <td>${m.address}</td>
                    <td>${m.joindate}</td>
                    <td><c:choose>
                        <c:when test="${m.grade eq 'A'}">
                            VIP
                        </c:when>
                        <c:when test="${m.grade eq 'B'}">
                            일반
                        </c:when>
                        <c:when test="${m.grade eq 'C'}">
                            직원
                        </c:when>
                    </c:choose></td>
                    <td>${m.city}</td>
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