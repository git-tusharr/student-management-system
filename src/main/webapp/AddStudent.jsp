<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Student</title>

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
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        text-align: center;
        width: 400px;
    }

    h2 {
        color: #333;
        margin-bottom: 25px;
    }

    input {
        width: 90%;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 15px;
    }

    button {
        background-color: #007bff;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        font-size: 15px;
        transition: background-color 0.2s ease;
    }

    button:hover {
        background-color: #0056b3;
    }

    a {
        display: block;
        margin-top: 15px;
        color: #007bff;
        text-decoration: none;
        font-size: 14px;
    }

    a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>

<div class="container">
    <h2>Add Student</h2>

    <form method="post" action="AddStudent">
        <input type="text" name="name" placeholder="Enter Name" required>
        <input type="text" name="email" placeholder="Enter Email" required>
        <input type="text" name="course" placeholder="Enter Course" required>
        <input type="number" name="marks" placeholder="Enter Marks" required>
        <button type="submit">Add Student</button>
    </form>

    <a href="Home.jsp">← Back to Dashboard</a>
</div>

</body>
</html>
