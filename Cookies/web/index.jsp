<!DOCTYPE HTML PUBLIC
    "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>Hello JSP</title>
    </head>
    <body>
        <%@ page import="business.User" %>
        <%
            // get attributes from the request
            User user = (User) request.getAttribute("user");
            String messageFirst
                    = (String) request.getAttribute("messageFirst");
            String messageLast
                    = (String) request.getAttribute("messageLast");
            String messageEmail
                    = (String) request.getAttribute("messageEmail");
            // handle null values
            if (user == null) {
                user = new User();
            }
            if (messageFirst == null) {
                messageFirst = "";
            }
            if (messageLast == null) {
                messageLast = "";
            }
            if (messageEmail == null) {
                messageEmail = "";
            }

            Cookie[] cookies = request.getCookies();
            String cookieName = "email";
            String c_email = "";
            if (cookies != null) {
                for (int i = 0; i < cookies.length; i++) {
                    Cookie cookie = cookies[i];
                    if (cookieName.equals(cookie.getName())) {
                        c_email = cookie.getValue();
                    }
                }
            }
            if (c_email == null || c_email == "") {
                c_email = "Not logged";
            }
//        String email =(String) session.getAttribute("email");
//        if(email==null || email=="") email ="Not logged";
%>
        <h1>Join our email list</h1>
        <p>Your email address:<%=c_email%></p>
        <p>To join our email list, enter your name and
            email address below. <br>
            Then, click on the Submit button.</p>
        <p><i><%= messageFirst%></i></p>
        <p><i><%= messageLast%></i></p>
        <p><i><%= messageEmail%></i></p>
        <form action="addToEmailList" method="post">
            <table cellspacing="5" border="0">
                <tr>
                    <td align="right">First name:</td>
                    <td><input type="text" name="firstName"
                               value="<%= user.getFirstName()%>"></td>
                </tr>


                <tr>
                    <td align="right">Last name:</td>
                    <td><input type="text" name="lastName"
                               value="<%= user.getLastName()%>"></td>
                </tr>
                <tr>
                    <td align="right">Email address:</td>
                    <td><input type="text" name="emailAddress"
                               value="<%= user.getEmailAddress()%>"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><br><input type="submit" value="Submit"></td>
                </tr>
            </table>
        </form>
    </body>
</html>