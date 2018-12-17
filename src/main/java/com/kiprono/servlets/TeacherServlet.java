package com.kiprono.servlets;

import com.kiprono.beans.TeacherI;
import com.kiprono.enums.Gender;
import com.kiprono.models.Role;
import com.kiprono.models.Teacher;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/teacherServlet")
public class TeacherServlet extends HttpServlet {
    @EJB
    TeacherI teacherI;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String button = req.getParameter("button");

        System.out.println(button);
        if (button.equalsIgnoreCase("saveButton")) {
            createTeacher(req, resp);

        } else if (button.equalsIgnoreCase("deleteButton")) {
            deleteTeacher(req, resp);

        } else if (button.equalsIgnoreCase("selectStudent")) {
            findRoleById(req, resp);
        } else if (button.equalsIgnoreCase("editingButton")) {

            editTeacher(req, resp);
        }

    }

    private void createTeacher(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Teacher teacher = new Teacher();
        Role role = new Role();
        String teacherName = req.getParameter("teacherName");
        String teacherAge = req.getParameter("teacherAge");
        String teacherContact = req.getParameter("teacherContact");
        Gender teacherGender = Enum.valueOf(Gender.class, req.getParameter("gender"));

        System.out.println(teacherGender);
        System.out.println(req.getParameter("teacherRole"));
        long teacherRole = Long.parseLong(req.getParameter("teacherRole"));


        teacher.setTeacherName(teacherName);
        teacher.setTeacherAge(Integer.parseInt(teacherAge));
        teacher.setTeacherContact(teacherContact);

        teacher.setGender(teacherGender);
        role.setId(teacherRole);
        teacher.setTeacherRole(role);

        teacherI.add(teacher);
        fetchRole(req, resp);
    }

    private void findRoleById(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        long teacherId = Long.parseLong(req.getParameter("id"));
        Teacher teacher = teacherI.findById(teacherId);

        if (teacher != null) {
            req.setAttribute("teacher", teacher);
            req.getRequestDispatcher("viewTeachers.jsp").forward(req, resp);

        }


    }

    private void deleteTeacher(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long teacherId = Long.parseLong(req.getParameter("id"));
        Teacher id = teacherI.findById(teacherId);
        if (teacherI.delete(id)) {
            fetchRole(req, resp);
        }

    }

    private void editTeacher(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Role role = new Role();
        long teacherId = Long.parseLong(req.getParameter("id"));
        Teacher teacher = teacherI.findById(teacherId);

        System.out.println("EDITING-----");
        System.out.println("id--------------------" + teacherId);


        if (teacher != null) {
            String teacherName = req.getParameter("teacherName");
            String teacherAge = req.getParameter("teacherAge");
            String teacherContact = req.getParameter("teacherContact");
            Gender teacherGender = Enum.valueOf(Gender.class, req.getParameter("gender"));

            System.out.println(teacherGender);
            System.out.println(req.getParameter("teacherRole"));
            long teacherRole = Long.parseLong(req.getParameter("teacherRole"));

            teacher.setTeacherName(teacherName);
            teacher.setTeacherAge(Integer.parseInt(teacherAge));
            teacher.setTeacherContact(teacherContact);

            teacher.setGender(teacherGender);
            role.setId(teacherRole);
            teacher.setTeacherRole(role);

            teacherI.edit(teacher);
            fetchRole(req, resp);
        }

    }

    private void fetchRole(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setAttribute("teachers", teacherI.selectAll());
    }
}
