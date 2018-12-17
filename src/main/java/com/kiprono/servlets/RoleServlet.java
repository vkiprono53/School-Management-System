package com.kiprono.servlets;

import com.kiprono.beans.RoleI;
import com.kiprono.models.Role;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/roleServlet")
public class RoleServlet extends HttpServlet {
    @EJB
    RoleI roleI;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String button = req.getParameter("button");

        //Calls createRole method:
        System.out.println(button);
        if (button.equalsIgnoreCase("saveButton")) {
            createRole(req, resp);

        } else if (button.equalsIgnoreCase("deleteButton")) {
            deleteRole(req, resp);

        } else if (button.equalsIgnoreCase("selectRole")) {
            findRoleById(req, resp);
        } else if (button.equalsIgnoreCase("editingButton")) {

            editRole(req, resp);
        }

    }

    private void createRole(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Role role = new Role();
        String roleName = req.getParameter("roleName");
        role.setRoleName(roleName);
        roleI.add(role);
        fetchRole(req, resp);

    }

    private void findRoleById(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        long roleId = Long.parseLong(req.getParameter("id"));
        Role role = roleI.findById(roleId);
        if (role != null) {
            req.setAttribute("role", role);
            req.getRequestDispatcher("viewRoles.jsp").forward(req, resp);

        }
    }

    private void deleteRole(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long roleId = Long.parseLong(req.getParameter("id"));
        Role id = roleI.findById(roleId);
        if (roleI.delete(id)) {
            fetchRole(req, resp);
        }

    }

    private void editRole(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Role role = new Role();

        String roleName = req.getParameter("roleName");
        String id = req.getParameter("id");
        System.out.println("EDITING-----");
        System.out.println("name--------------------"+roleName);
        System.out.println("id--------------------"+id);


        long roleId = Long.parseLong(req.getParameter("id"));
        Role role= roleI.findById(roleId);
        if(role!=null) {
            role.setRoleName(roleName);
            role.setId(roleId);
            System.out.println(roleId);
            System.out.println(roleName);
            roleI.edit(role);

            fetchRole(req, resp);
        }

    }

    private void fetchRole(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setAttribute("roles", roleI.selectAll());
    }
}
