<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Student</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f7f9fc;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        height: 100vh;
        margin: 0;
    }

    h2 {
        color: #333;
        margin-bottom: 20px;
    }

    form {
        background: white;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
        width: 350px;
    }

    label {
        font-weight: bold;
        display: block;
        margin-bottom: 6px;
        color: #333;
    }

    input {
        width: 100%;
        padding: 8px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 14px;
    }

    button {
        width: 100%;
        padding: 10px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
        transition: background-color 0.2s ease;
    }

    button:hover {
        background-color: #0056b3;
    }

    a {
        display: block;
        margin-top: 15px;
        text-align: center;
        color: #007bff;
        text-decoration: none;
        font-weight: bold;
    }

    a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String name = "", email = "", course = "";
    int marks = 0;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/studentmanagementsystem", "root", "Tushar@2006");

        ps = con.prepareStatement("SELECT * FROM students WHERE id=?");
        ps.setInt(1, id);
        rs = ps.executeQuery();

        if (rs.next()) {
            name = rs.getString("name");
            email = rs.getString("email");
            course = rs.getString("course");
            marks = rs.getInt("marks");
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (con != null) con.close();
    }
%>

<h2>Edit Student Details</h2>

<form action="EditStudent" method="post">
    <input type="hidden" name="id" value="<%= id %>">

    <label>Name:</label>
    <input type="text" name="name" value="<%= name %>" required>

    <label>Email:</label>
    <input type="email" name="email" value="<%= email %>" required>

    <label>Course:</label>
    <input type="text" name="course" value="<%= course %>" required>

    <label>Marks:</label>
    <input type="number" name="marks" value="<%= marks %>" required>

    <button type="submit">Update</button>
</form>

<a href="ViewStudent.jsp">← Back to List</a>

</body>
</html>
