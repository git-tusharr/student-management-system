package com.example;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/EditStudent")
public class EditStudent extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String course = req.getParameter("course");
        int marks = Integer.parseInt(req.getParameter("marks"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/studentmanagementsystem", "root", "Tushar@2006");

            PreparedStatement ps = con.prepareStatement(
                    "UPDATE students SET name=?, email=?, course=?, marks=? WHERE id=?");

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, course);
            ps.setInt(4, marks);
            ps.setInt(5, id);

            int i = ps.executeUpdate();

            if (i > 0) {
                System.out.println("Student updated successfully!");
            } else {
                System.out.println("Failed to update student!");
            }

            con.close();

            // Redirect to view all students
            resp.sendRedirect("ViewStudent.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().println("Error: " + e.getMessage());
        }
    }
}
