package com.example;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AddStudent")
public class AddStudent extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String course = req.getParameter("course");
        int marks = Integer.parseInt(req.getParameter("marks"));

        HttpSession session = req.getSession(false); // get existing session
        String userEmail = (session != null) ? (String) session.getAttribute("email") : null;

        if (userEmail == null) {
            resp.sendRedirect("instituteLogin.jsp");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/studentmanagementsystem",
                    "root",
                    "Tushar@2006");

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO students (name, email, course, marks, user_email) VALUES (?, ?, ?, ?, ?)"
            );
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, course);
            ps.setInt(4, marks);
            ps.setString(5, userEmail);

            int i = ps.executeUpdate();

            if (i > 0) {
                System.out.println(" Student added successfully!");
                resp.sendRedirect("ViewStudent.jsp");
            } else {
                resp.getWriter().println(" Failed to add student!");
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().println("SQL Error: " + e.getMessage());
        }
    }
}
