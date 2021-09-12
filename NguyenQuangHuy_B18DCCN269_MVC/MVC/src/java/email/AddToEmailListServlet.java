package email;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import business.User;
import data.UserIO;
import java.util.HashMap;
import java.util.Map;

public class AddToEmailListServlet extends HttpServlet {

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // get parameters from the request
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String emailAddress = request.getParameter("emailAddress");

        User user = new User(firstName, lastName, emailAddress);

        // validate the parameters
        String firstNameError = "";
        Map<String, String> message = new HashMap<String, String>();

        String url = "";
        if (firstName.length() == 0) {
            message.put("firstName", "First name không được bỏ trống");
        }
        if (lastName.length() == 0) {
            message.put("lastName", "Last name không được bỏ trống");
        }
        if (emailAddress.length() == 0) {
            message.put("email", "Email không được bỏ trống");
        } 
        if(!message.isEmpty()) {
            url = "/join_email_list.jsp";
        }
        else {
            ServletContext context = getServletContext();
            String path = context.getRealPath(
                    "/WEB-INF/EmailList.txt");
            UserIO.add(user, path);
            url = "/display_email_entry.jsp";
        }
        request.setAttribute("user", user);
        request.setAttribute("message", message);
        // forward request and response to the view
        RequestDispatcher dispatcher
                = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
