package email;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import business.User;
import data.UserIO;

public class AddToEmailListServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        // get parameters from the form
        String firstName
                = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String emailAddress
                = request.getParameter("emailAddress");
        // create the User object from the parameters
        User user
                = new User(firstName, lastName, emailAddress);
        // validate the parameters
        String message = "";
        String url = "";
        if (firstName.length() == 0
                || lastName.length() == 0
                || emailAddress.length() == 0) {
            message
                    = "Please fill out all three text boxes.";
            url = "/join_email_list.jsp";
        } else {
            message = "";
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
}
