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

//    String sql = "UPDATE member_tbl_02 SET" +
//            " 회원성명 = '" + request.getParameter("custname") + "', " +
//            " 회원전화 = '" + request.getParameter("phone") + "', " +
//            " 주소 = '" + request.getParameter("address") + "', " +
//            " 가입일자 = '" + request.getParameter("joindate").substring(0,10) + "', " +
//            " 고객등급 = '" + request.getParameter("grade") + "', " +
//            " 거주도시 = '" + request.getParameter("city") + "'" +
//            " WHERE 회원번호 = '" + request.getParameter("custno") + "'";
    String sql = "UPDATE member_tbl_02 SET 회원성명=?, 회원전화=?, 주소=?, 가입일자=?, 고객등급=?, 거주도시=? WHERE 회원번호=?";
    pstmt = DBCon.getConnection().prepareStatement(sql);
    pstmt.setString(1, request.getParameter("custname"));
    pstmt.setString(2, request.getParameter("phone"));
    pstmt.setString(3, request.getParameter("address"));
    pstmt.setString(4, request.getParameter("joindate"));
    pstmt.setString(5, request.getParameter("grade"));
    pstmt.setString(6, request.getParameter("city"));
    pstmt.setString(7, request.getParameter("custno"));

    pstmt.executeUpdate();
%>
<script>
  alert("회원변경이 완료 되었습니다.");
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
    statement.close();
    pstmt.close();
  } catch (SQLException e) {
    e.printStackTrace();
  }
%>
</html>
