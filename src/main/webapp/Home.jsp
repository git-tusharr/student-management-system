<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Institute Dashboard</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f7f9fc;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }

    .container {
        background-color: white;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        text-align: center;
        width: 400px;
    }

    h2 {
        color: #333;
        margin-bottom: 30px;
    }

    a {
        display: inline-block;
        margin: 10px;
        padding: 10px 20px;
        background-color: #007bff;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        transition: background-color 0.2s ease;
    }

    a:hover {
        background-color: #0056b3;
    }

    .logout {
        background-color: #dc3545;
    }

    .logout:hover {
        background-color: #a71d2a;
    }
</style>
</head>
<body>

<div class="container">
    <h2>Welcome to Institute Dashboard<br><small>${sessionScope.name}</small></h2>

    <a href="AddStudent.jsp">Add Student</a>
    <a href="ViewStudent.jsp">View Students</a>
    <a href="Logout" class="logout">Logout</a>
</div>

</body>
</html>
