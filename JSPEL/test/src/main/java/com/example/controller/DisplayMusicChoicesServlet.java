package com.example.controller;

import com.example.model.User;
import com.example.model.UserIO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.Arrays;

public class DisplayMusicChoicesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String emailAddress = request.getParameter("emailAddress");
        String[] musics = request.getParameterValues("musics");
        ServletContext sc = getServletContext();
        User user = new User(firstName, lastName, emailAddress);
        String message = "Please fill out";
        String url = "";
        if (firstName.length() == 0   ){
            message+= " First name, ";
        }
        if (lastName.length() == 0) {
            message+= " Last name,";
        }
        if (emailAddress.length() == 0) {
            message+= " Email,";
        }
        if (!message.equals("Please fill out")) {
            url = "/join_email_list.jsp";
        }
        else
        {
            message = "";
            String path = sc.getRealPath("/WEB-INF/EmailList.txt");
            UserIO.add(user, path); // value write to file in target/...
            url = "/display_email_entry.jsp";
//            HttpSession session = request.getSession();
//            session.setAttribute("email", user.getEmailAddress());
            Cookie emailCookie = new Cookie("email", emailAddress);
            emailCookie.setMaxAge(365*24*60*60);
            emailCookie.setPath("/");
            response.addCookie(emailCookie);
        }
        request.setAttribute("user", user);
        request.setAttribute("message", message);
        if (musics != null) {
            request.setAttribute("musics", Arrays.asList(musics));
        }
        else
            request.setAttribute("musics", Arrays.asList(""));
        request.setAttribute("currentDate", LocalDate.now().toString());
        // forward request and response to the view
        RequestDispatcher dispatcher =
                getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}
