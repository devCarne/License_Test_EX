<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.DBCon" %>
<%@ page import="DBPKG.Member" %>
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

        String sql = "SELECT * FROM member_tbl_02 WHERE 회원번호 = " + request.getParameter("custno");
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

    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    }
%>
<div id="header">
    <jsp:include page="header.jsp" flush="false"/>
</div>
<section>
    <div>
        <h2>회원 정보 수정</h2>
    </div>
    <div>
        <form action="changeInfoQuery.jsp" method="post" onsubmit="return checkInputData()">
            <table border="1">
                <tr>
                    <td>회원번호</td><td><input type="text" name="custno" value=${member.custno} readonly></td>
                </tr>
                <tr>
                    <td>회원성명</td><td><input type="text" name="custname" value=${member.custname} id="custName"></td>
                </tr>
                <tr>
                    <td>회원전화</td><td><input type="text" name="phone" value=${member.phone}></td>
                </tr>
                <tr>
                    <td>회원주소</td><td><input type="text" name="address" value=${member.address}></td>
                </tr>
                <tr>
                    <td>가입일자</td><td><input type="text" name="joindate" value=${member.joindate}></td>
                </tr>
                <tr>
                    <td>고객등급[A:VIP,B:일반,C:직원]</td><td><input type="text" name="grade" value=${member.grade}></td>
                </tr>
                <tr>
                    <td>도시코드</td><td><input type="text" name="city" value=${member.city}></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="변경"></td>
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
</script>
<%
    try {
        resultSet.close();
        statement.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
</body>
</html>
