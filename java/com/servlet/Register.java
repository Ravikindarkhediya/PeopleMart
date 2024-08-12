package com.servlet;

import com.Class.*;
import com.dao.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.http.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import java.io.File;
import java.sql.*;

@MultipartConfig
public class Register extends HttpServlet {

    Connection con = null;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            response.setContentType("text/html");

            String name = request.getParameter("r_name");
            String email = request.getParameter("r_email");
            String password = request.getParameter("r_password");
            String cnfPassword = request.getParameter("r_cnf-password");
            String village = request.getParameter("r_village");
            String district = request.getParameter("r_district");
            String gender = request.getParameter("r_gender");
            String phone = request.getParameter("r_phone");
            Part filePart = request.getPart("r_profile_img");
            String profile = filePart.getSubmittedFileName();
            String about = request.getParameter("r_about");
            String chk = request.getParameter("r_chk");

            try {
                UserDao dao = new UserDao(ConnectionProvider.getConnection());

                User existingUser = dao.getUserByEmail(email);

                if (existingUser != null) {
                    out.println("You have allready Registered...");
                    
                }
                User user = new User(name, email, password, cnfPassword, village, district, gender, phone, profile, about);

                
                String path = getServletContext().getRealPath("/") + "web_img" + File.separator + user.getProfile();
//                jo folder nay male to navu banavse.
                File filedir = new File(getServletContext().getRealPath("/")+"web_img");
                if (!filedir.exists()) {
                    filedir.mkdir();
                }
                if (dao.saveUser(user)) {
                    out.println("Restered Successfully.");
                    response.sendRedirect("login.jsp");
                } else {
                    out.println("Registration failed. Please try again.");
                }

            } catch (Exception e) {
                System.out.println("ERROR FOR REGISTER IN CONNECTION : " + e.getMessage());
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
