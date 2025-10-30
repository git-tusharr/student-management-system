<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Institute Login</title>

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
        width: 350px;
        text-align: center;
    }

    h2 {
        color: #333;
        margin-bottom: 20px;
    }

    input {
        width: 90%;
        padding: 10px;
        margin: 8px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    button {
        width: 95%;
        padding: 10px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    button:hover {
        background-color: #0056b3;
    }

    p {
        margin-top: 15px;
    }

    a {
        color: #007bff;
        text-decoration: none;
    }

    a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>

<div class="container">
    <h2>Institute Login</h2>

    <form method="post" action="logo">
        <input type="email" name="email" placeholder="Enter Email" required><br>
        <input type="password" name="pass" placeholder="Enter Password" required><br>
        <button type="submit">Login</button>
    </form>

    <p>Not registered yet? <a href="instituteRegister.jsp">Register here</a></p>
</div>

</body>
</html>
