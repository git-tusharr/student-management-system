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

@WebServlet("/AddStudent")
public class AddStudent extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String course = req.getParameter("course");
        String marks = req.getParameter("marks");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/studentmanagementsystem",
                    "root",
                    "Tushar@2006");

            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO students(name, email, course, marks) VALUES (?, ?, ?, ?)");

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, course);
            ps.setString(4, marks);

            int i = ps.executeUpdate();

            if (i > 0) {
                System.out.println("Student added successfully!");
                RequestDispatcher rd = req.getRequestDispatcher("ViewStudent.jsp");
                rd.forward(req, resp);
            } else {
                System.out.println("Failed to add student!");
                resp.getWriter().println("Failed to add student!");
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().println("SQL Error: " + e.getMessage());
        }
    }
}
