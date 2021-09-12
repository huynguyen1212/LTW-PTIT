<!DOCTYPE HTML PUBLIC
    "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Murach's Java Servlets and JSP</title>
    </head>
    <body>
        <%@ page import="business.User" %>
        <%@ page import="java.util.HashMap, java.util.Map" %>
        <%
            // get attributes from the request
            User user = (User) request.getAttribute("user");
            Map<String, String> message = (HashMap) request.getAttribute("message");
            // handle null values
            if (user == null) {
                user = new User();
            }
            if(!message.containsKey("firstName")) {
                 message.put("firstName", "");
            }
            if(!message.containsKey("lastName")) {
                 message.put("lastName", "");
            }
            if(!message.containsKey("email")) {
                 message.put("email", "");
            }
        %>
        <h1>Join our email list</h1>
        <p>To join our email list, enter your name and
            email address below. <br>
            Then, click on the Submit button.</p>
        <form action="addToEmailList" method="post">
            <table cellspacing="5" border="0">
                <tr>
                    <td align="right">First name:</td>
                    <td><input type="text" name="firstName"
                               value="<%= user.getFirstName()%>"></td>
                    <td> <p style="color: red; font-size: 18px"><%= message.get("firstName")%></p></td>
                </tr>
                <tr>
                    <td align="right">Last name:</td>
                    <td><input type="text" name="lastName"
                               value="<%= user.getLastName()%>"></td>
                    <td> <p style="color: red; font-size: 18px"><%= message.get("lastName")%></p></td>
                </tr>
                <tr>
                    <td align="right">Email address:</td>
                    <td><input type="text" name="emailAddress"
                               value="<%= user.getEmailAddress()%>"></td>
                    <td> <p style="color: red; font-size: 18px"><%= message.get("email")%></p></td>
                </tr>
                <tr>
                    <td></td>
                    <td><br><input type="submit" value="Submit"></td>
                </tr>
            </table>
        </form>
    </body>
</html>