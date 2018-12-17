package com.kiprono.servlets;

import com.kiprono.beans.StudentI;
import com.kiprono.enums.Gender;
import com.kiprono.models.Grade;
import com.kiprono.models.Role;
import com.kiprono.models.Student;


import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/studentServlet")
public class StudentServlet extends HttpServlet {
    @EJB
    StudentI studentI;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String button = req.getParameter("button");

        //Calls createRole method:
        System.out.println(button);
        if (button.equalsIgnoreCase("saveButton")) {
            createStudent(req, resp);

        } else if (button.equalsIgnoreCase("deleteButton")) {
            deleteStudent(req, resp);

        } else if (button.equalsIgnoreCase("selectStudent")) {
            findStudentById(req, resp);
        } else if (button.equalsIgnoreCase("editingButton")) {

            editStudent(req, resp);
        }
    }

    private void createStudent(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Student student = new Student();
        Grade grade = new Grade();

        String studentName = req.getParameter("studentName");
        String studentAge = req.getParameter("studentAge");
        Gender studentGender = Enum.valueOf(Gender.class, req.getParameter("gender"));
        long studentGrade = Long.parseLong(req.getParameter("studentGrade"));

        student.setStudentName(studentName);
        student.setStudentAge(Integer.parseInt(studentAge));
        student.setGender(studentGender);
        grade.setId(studentGrade);

        student.setStudentGrade(grade);
        studentI.add(student);
        fetchRole(req, resp);
    }

    private void findStudentById(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        long studentId = Long.parseLong(req.getParameter("id"));
        Student student = studentI.findById(studentId);
        if (student != null) {
            req.setAttribute("student", student);
            req.getRequestDispatcher("viewStudents.jsp").forward(req, resp);

        }


    }

    private void deleteStudent(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        long studentId = Long.parseLong(req.getParameter("id"));
        Student id = studentI.findById(studentId);
        if (studentI.delete(id)){
            fetchRole(req, resp);
        }
    }

    private void editStudent(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Grade grade = new Grade();
         String id = req.getParameter("id");
        System.out.println("EDITING-----");
        System.out.println("id--------------------" + id);
        long studentId = Long.parseLong(req.getParameter("id"));
        Student student = studentI.findById(studentId);

        if (student != null) {
            String studentName = req.getParameter("studentName");
            String studentAge = req.getParameter("studentAge");
            Gender studentGender = Enum.valueOf(Gender.class, req.getParameter("gender"));
            long studentGrade = Long.parseLong(req.getParameter("studentGrade"));

            student.setStudentName(studentName);
            student.setStudentAge(Integer.parseInt(studentAge));
            student.setGender(studentGender);
            grade.setId(studentGrade);
            student.setStudentGrade(grade);
            studentI.edit(student);
            fetchRole(req, resp);
        }

    }

    private void fetchRole(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setAttribute("students", studentI.selectAll());
    }
}








