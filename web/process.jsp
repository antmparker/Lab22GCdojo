<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add User</title>
</head>
<body>
<h1>Data Added</h1>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection connection = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/gcdojo",
            "jdbc",
            "java1234");
    Statement statement = connection.createStatement();
    //get data from form
    int result = statement.executeUpdate("INSERT INTO gcdojo.signups "
            + "(firstName, lastName, email, phoneNum, langClass, level, userNam, password, passChk)"
            + "VALUES ('" + request.getParameter("firstName") + "','"
            + request.getParameter("lastName") + "','"
            + request.getParameter("email") + "','"
            + request.getParameter("phoneNum") + "','"
            + request.getParameter("langClass") + "','"
            + request.getParameter("level") + "','"
            + request.getParameter("userNam") + "','"
            + request.getParameter("password") + "','"
            + request.getParameter("passChk") + "');");
%>
<table BORDER="1">
    <tr>
        <th>First Name:</th>
        <th>Last Name</th>
        <th>email:</th>
        <th>Phone Number:</th>
        <th>Username:</th>
        <th>Language Class</th>
        <th>Skill Level</th>
    </tr>
    <TR>
    <td><%= request.getParameter("firstName")%></td>
    <td><%=request.getParameter("lastName")%></td>
    <td><%=request.getParameter("email")%></td>
    <td><%=request.getParameter("phoneNum")%></td>
    <td><%=request.getParameter("userNam")%></td>
    <td><%= request.getParameter("langClass")%></td>
    <td><%= request.getParameter("level")%></td>
</TR>
            <%
    //cleaning up after myself
    if (statement != null) {
        statement.close();
    }
    if (connection != null) {
        connection.close();
    }
%>
</table>
</body>
</html>
