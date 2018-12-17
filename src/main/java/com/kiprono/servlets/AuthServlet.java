package com.kiprono.servlets;

import com.kiprono.beans.*;
import com.kiprono.models.*;


import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/login")
public class AuthServlet extends HttpServlet {

    @EJB
    AuthI authI;

    @EJB
    RoleI roleI;

    @EJB
    TeacherI teacherI;

    @EJB
    StudentI studentI;

    @EJB
    GradeI gradeI;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        User user = authI.login(username, password);

        if (user != null) {
            HttpSession session = req.getSession();

            session.setAttribute("username", username);
            List<Teacher> teachers = teacherI.selectAll();
            List<Role> roles = roleI.selectAll();
            List<Student> students = studentI.selectAll();
            List<Grade> grades = gradeI.selectAll();

            session.setAttribute("roles", roles);
            session.setAttribute("teachers", teachers);
            session.setAttribute("students", students);
            session.setAttribute("grades", grades);
//            session.setAttribute("roles", roles);

            req.getRequestDispatcher("dashboard.jsp").forward(req, resp);

        } else {

            out.print("<h2>Wrong username or password, Please try again:</h2>");

            req.getRequestDispatcher("index.jsp").forward(req, resp);

        }
    }
/*
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Removing the session and all the data:
        HttpSession session = req.getSession();
        session.removeAttribute("username");
        session.removeAttribute("clientId");
        session.removeAttribute("roles");
        session.removeAttribute("projects");

        session.invalidate();
        //Redirecting to the login page:
        resp.sendRedirect("index.jsp");
    }*/
}
