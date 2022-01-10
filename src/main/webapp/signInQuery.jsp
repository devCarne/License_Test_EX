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
    PreparedStatement pstmt;
%>
<%
    request.setCharacterEncoding("UTF-8");
    try {
//        String sql = "INSERT INTO member_tbl_02 VALUES (" +
//                "'" + request.getParameter("custno") + "', " +
//                "'" + request.getParameter("custname") + "', " +
//                "'" + request.getParameter("phone") + "', " +
//                "'" + request.getParameter("address") + "', " +
//                "'" + request.getParameter("joindate") + "', " +
//                "'" + request.getParameter("grade") + "', " +
//                "'" + request.getParameter("city") + "')";
        String sql = "INSERT INTO member_tbl_02 VALUES (?, ?, ?, ?, ?, ?, ?)";
        pstmt = DBCon.getConnection().prepareStatement(sql);
        pstmt.setString(1, request.getParameter("custno"));
        pstmt.setString(2, request.getParameter("custname"));
        pstmt.setString(3, request.getParameter("phone"));
        pstmt.setString(4, request.getParameter("address"));
        pstmt.setString(5, request.getParameter("joindate"));
        pstmt.setString(6, request.getParameter("grade"));
        pstmt.setString(7, request.getParameter("city"));

        pstmt.executeUpdate();
%>
<script>
    alert("회원등록이 완료 되었습니다.");
    location.href="index.jsp";
</script>
<%
    } catch (ClassNotFoundException | SQLException e){
        e.printStackTrace();
    }
%>
</body>
<%
    try {
        pstmt.close();
        statement.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
</html>
