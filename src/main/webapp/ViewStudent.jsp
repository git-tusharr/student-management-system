<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Students</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f6f9;
        padding: 30px;
    }
    h2 {
        text-align: center;
        color: #333;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        background-color: white;
        box-shadow: 0px 0px 8px rgba(0,0,0,0.1);
    }
    th, td {
        padding: 12px;
        border: 1px solid #ddd;
        text-align: center;
    }
    th {
        background-color: #007bff;
        color: white;
    }
    tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    a {
        text-decoration: none;
        color: #007bff;
    }
    a:hover {
        text-decoration: underline;
    }
    .btn {
        display: inline-block;
        margin-top: 15px;
        padding: 10px 15px;
        background-color: #007bff;
        color: white;
        border-radius: 5px;
        text-decoration: none;
    }
    .btn:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>

<h2>All Students</h2>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Course</th>
        <th>Marks</th>
        <th>Actions</th>
    </tr>

<%
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String userEmail = (String) session.getAttribute("email"); // current logged-in user

    if (userEmail == null) {
        response.sendRedirect("instituteLogin.jsp");
        return;
    }

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/studentmanagementsystem", "root", "Tushar@2006");

        // Show only the students for this logged-in user
        ps = con.prepareStatement("SELECT * FROM students WHERE user_email = ?");
        ps.setString(1, userEmail);
        rs = ps.executeQuery();

        boolean hasData = false;
        while (rs.next()) {
            hasData = true;
            int id = rs.getInt("id");
%>
    <tr>
        <td><%= id %></td>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("email") %></td>
        <td><%= rs.getString("course") %></td>
        <td><%= rs.getInt("marks") %></td>
        <td>
            <a href="EditStudent.jsp?id=<%= id %>">Edit</a> |
            <a href="DeleteStudent?id=<%= id %>"
               onclick="return confirm('Are you sure you want to delete this student?');">
               Delete
            </a>
        </td>
    </tr>
<%
        }

        if (!hasData) {
%>
    <tr>
        <td colspan="6">No students added yet.</td>
    </tr>
<%
        }

    } catch (Exception e) {
        out.println("<tr><td colspan='6'>Error: " + e.getMessage() + "</td></tr>");
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (con != null) con.close();
    }
%>

</table>

<div style="text-align:center;">
    <a class="btn" href="AddStudent.jsp">Add New Student</a>
</div>

</body>
</html>
