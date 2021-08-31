package email;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import business.User;
import data.UserIO;

public class DisplayMusicChoicesServlet extends HttpServlet {

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        // get parameters from the request
        String[] music = request.getParameterValues("music");
        String listMusic ="";
        for(int i = 0; i<music.length; i++) {
            listMusic += "<p>" + music[i] + "</p>";
        }


        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String emailAddress = request.getParameter("emailAddress");
        // send response to browser
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println(
                "<!doctype html public \"-//W3C//DTD HTML 4.0 "
                + " Transitional//EN\">\n"
                + "<html>\n"
                + "<head>\n"
                + " <title>Murach's Java Servlets and JSP</title>\n"
                + "</head>\n"
                + "<body>\n"
                + "<p>Thanks for joining our email list, " + firstName + " " + lastName +  "</p>\n"
                + "<p>We ‘ll use this email to notify you whenever we have new releases for these types of music:</p>\n"
                + listMusic
                + "</body>\n"
                + "</html>\n"
        );

        out.close();
    }

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
