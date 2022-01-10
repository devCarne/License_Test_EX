<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.DBCon" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%!
    Statement statement;
    ResultSet resultSet;
%>
<%
    try {
        statement = DBCon.getConnection().createStatement();

        String sql = "SELECT 회원번호 FROM member_tbl_02 WHERE 회원번호 = (SELECT max(회원번호) FROM member_tbl_02)";
        resultSet = statement.executeQuery(sql);

        resultSet.next();
        request.setAttribute("max_custno", resultSet.getString(1));
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    }
%>
<div id="header">
    <jsp:include page="header.jsp" flush="false"/>
</div>
<section>
    <div>
        <h2>홈쇼핑 회원 등록</h2>
    </div>
    <div>
        <form method="post" onsubmit="return checkInputData();">
            <table border="1">
            <tr>
                <td>회원번호(자동발생)</td><td><input type="text" name="custno" value="${max_custno + 1}"></td>
            </tr>
            <tr>
                <td>회원성명</td><td><input type="text" name="custname" id="custName"><br></td>
            </tr>
            <tr>
                <td>회원전화</td><td><input type="text" name="phone"></td>
            </tr>
            <tr>
                <td>회원주소</td><td><input type="text" name="address"></td>
            </tr>
            <tr>
                <td>가입일자</td><td><input type="text" name="joindate"></td>
            </tr>
            <tr>
                <td>고객등급[A:VIP,B:일반,C:직원]</td><td><input type="text" name="grade"></td>
            </tr>
            <tr>
                <td>도시코드</td><td><input type="text" name="city"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" formaction="signInQuery.jsp"value="등록"></form><form><input type="submit" formaction="memberList.jsp" value="조회"></form></td>
            </tr>
            </table>
        </form>
    </div>
</section>
<div id="footer">
    <jsp:include page="footer.jsp" flush="false"/>
</div>
<script>
    document.getElementById("custName").focus();
    function checkInputData() {
        if(document.getElementById("custName").value.length === 0) {
            alert("회원 성명이 입력되지 않았습니다.")
            document.getElementById("custName").focus();
            return false;
        }
    }
    function moveList() {
        location.href="memberList.jsp";
    }
</script>
</body>
<%
    try {
        resultSet.close();
        statement.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
<%
    try {
        resultSet.close();
        statement.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
</html>
