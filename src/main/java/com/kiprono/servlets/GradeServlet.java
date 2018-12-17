package com.kiprono.servlets;

import com.kiprono.beans.GradeI;
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

@WebServlet("/gradeServlet")
public class GradeServlet extends HttpServlet {
    @EJB
    GradeI gradeI;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String button = req.getParameter("button");

        //Calls createRole method:
        System.out.println(button);
        if (button.equalsIgnoreCase("saveButton")) {
            createGrade(req, resp);

        } else if (button.equalsIgnoreCase("deleteButton")) {
            deleteGrade(req, resp);

        } else if (button.equalsIgnoreCase("selectGrade")) {
            findGradeById(req, resp);
        } else if (button.equalsIgnoreCase("editingButton")) {

            editGrade(req, resp);
        }
    }


    private void createGrade(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Grade grade = new Grade();
        String gradeName = req.getParameter("gradeName");
        String gradeDesc = req.getParameter("gradeDesc");
        grade.setGradeName(gradeName);
        grade.setGradeDesc(gradeDesc);

        gradeI.add(grade);

        fetchGrade(req, resp);

    }

    private void findGradeById(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        long gradeId = Long.parseLong(req.getParameter("id"));
        Grade grade = gradeI.findById(gradeId);
        if (grade != null) {
            req.setAttribute("grade", grade);
            req.getRequestDispatcher("viewGrades.jsp").forward(req, resp);

        }


    }

    private void deleteGrade(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long gradeId = Long.parseLong(req.getParameter("id"));
        Grade id = gradeI.findById(gradeId);

        if (gradeI.delete(id)) {
            fetchGrade(req, resp);
        }

    }

    private void editGrade(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String id = req.getParameter("id");
        System.out.println("EDITING-----");
        System.out.println("id--------------------" + id);
        long gradeId = Long.parseLong(req.getParameter("id"));
        Grade grade = gradeI.findById(gradeId);
        if (grade != null) {
            String gradeName = req.getParameter("gradeName");
            String gradeDesc = req.getParameter("gradeDesc");
            grade.setGradeName(gradeName);
            grade.setGradeDesc(gradeDesc);
            gradeI.edit(grade);

            fetchGrade(req, resp);
        }

    }

    private void fetchGrade(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setAttribute("grades", gradeI.selectAll());

    }


}

