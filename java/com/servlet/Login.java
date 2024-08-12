package com.servlet;

import com.Class.ConnectionProvider;
import com.Class.Message;
import com.Class.User;
import com.dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

//            Fetch email and password for request
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            UserDao dao = new UserDao(ConnectionProvider.getConnection());

            if (email.equals("admin@gmail.com")&& password.equals("admin")) {
                System.out.println("^^^^^^^^^^^^^^^^^^^ GO to Admin Page ^^^^^^^^^^^^^^");
                response.sendRedirect("admin.jsp");
                return;
            }

            User user = dao.getUserByEmailAndPassword(email, password);

            if (user == null) {
//                Login error 
//                out.print("Invalid Details..Please try again.");
                Message msg = new Message("Invalid Details! try with another.", "error", "alert-danger");
                response.sendRedirect("login.jsp");

                HttpSession session = request.getSession();
                session.setAttribute("msg", msg);

            } else {
//                Login Success
                HttpSession session = request.getSession();
                session.setAttribute("currentUser", user);
                response.sendRedirect("home.jsp");
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
