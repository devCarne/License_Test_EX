<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<section>
    <form action="searchResult.jsp" method="post">
        <table>
            <tr>
                <td>회원성명</td><td><input type="text" name="custname"></td>
                <td><input type="submit" value="검색"></td>
            </tr>
        </table>
    </form>
</section>
<jsp:include page="footer.jsp"/>
</body>
</html>
