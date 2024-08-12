package com.servlet;

import com.Class.ConnectionProvider;
import com.Class.Helper;
import com.Class.Message;
import com.Class.User;
import com.dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;

@MultipartConfig
public class EditServlet2 extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

//            Fetch data for edit_profile form
            String name = request.getParameter("user_name");
            String email = request.getParameter("user_email");
            String password = request.getParameter("user_password");
            String village = request.getParameter("user_village");
            String district = request.getParameter("user_district");
            String phone = request.getParameter("user_phone");
            String about = request.getParameter("user_about");
            Part part = request.getPart("user_img");
            String profile = part.getSubmittedFileName();

            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("currentUser");
//            currentUser ma user ni details ne user object ma get kari using session
//              user object thi new value ne set kari
            user.setName(name);
            user.setEmail(email);
            user.setPassword(password);
            user.setVillage(village);
            user.setDistrict(district);
            user.setPhone(phone);
            user.setAbout(about);
            user.setProfile(profile);

//            Update in database...
            UserDao dao = new UserDao(ConnectionProvider.getConnection());

            boolean ans = dao.updateProfile(user);

            if (ans == true) {

                String path = getServletContext().getRealPath("/") + "web_img" + File.separator + user.getProfile();
//                jo folder nay male to navu banavse.
                File filedir = new File(getServletContext().getRealPath("/") + "web_img");
                if (!filedir.exists()) {
                    filedir.mkdir();
                }

                Helper.deleteFile(path);
                if (Helper.saveFile(part.getInputStream(), path)) {
                    out.println("Profile Updated...");
                    Message msg = new Message("Profile Updated Successfully.", "success", "alert-primary");
                    session.setAttribute("msg", msg);
                } else {
                    Message msg = new Message("Profile not updated! try again.", "error", "alert-danger");
                    session.setAttribute("msg", msg);
                }
//    getInputStrem ma data hoy ane path ma image jya chhe tya sudhi ni directory.
            } else {
                Message msg = new Message("Something went wrong! try again.", "error", "alert-danger");
                session.setAttribute("msg", msg);
            }
            response.sendRedirect("home.jsp");
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
    }

}
