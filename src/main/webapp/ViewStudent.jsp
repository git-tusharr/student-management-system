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
        background-color: #f7f9fc;
        margin: 0;
        padding: 20px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    h2 {
        color: #333;
        margin-bottom: 20px;
    }

    table {
        border-collapse: collapse;
        width: 90%;
        max-width: 900px;
        background-color: white;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
        border-radius: 10px;
        overflow: hidden;
    }

    th, td {
        padding: 12px 15px;
        text-align: center;
    }

    th {
        background-color: #007bff;
        color: white;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    tr:hover {
        background-color: #e6f0ff;
    }

    a.action-btn {
        text-decoration: none;
        padding: 6px 12px;
        border-radius: 5px;
        color: white;
        font-size: 14px;
        transition: background-color 0.2s ease;
    }

    a.edit {
        background-color: #28a745;
    }

    a.edit:hover {
        background-color: #1e7e34;
    }

    a.delete {
        background-color: #dc3545;
    }

    a.delete:hover {
        background-color: #b02a37;
    }

    .bottom-links {
        margin-top: 20px;
        text-align: center;
    }

    .bottom-links a {
        text-decoration: none;
        color: #007bff;
        font-weight: bold;
        margin: 0 10px;
    }

    .bottom-links a:hover {
        text-decoration: underline;
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

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/studentmanagementsystem", "root", "Tushar@2006");

        ps = con.prepareStatement("SELECT * FROM students");
        rs = ps.executeQuery();

        while (rs.next()) {
            int id = rs.getInt("id");
%>
    <tr>
        <td><%= id %></td>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("email") %></td>
        <td><%= rs.getString("course") %></td>
        <td><%= rs.getInt("marks") %></td>
        <td>
            <a href="EditStudent.jsp?id=<%= id %>" class="action-btn edit">Edit</a>
            <a href="DeleteStudent?id=<%= id %>" class="action-btn delete"
               onclick="return confirm('Are you sure you want to delete this student?');">Delete</a>
        </td>
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

<div class="bottom-links">
    <a href="AddStudent.jsp">Add New Student</a> |
    <a href="Home.jsp">Back to Dashboard</a>
</div>

</body>
</html>
