<%-- 
    Document   : display_email_entry
    Created on : Sep 6, 2021, 7:47:56 PM
    Author     : sonht
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ page import="business.*, data.*" %>
        <%
            // get parameters from the request
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String emailAddress = request.getParameter("emailAddress");
        %>
        <h1>Thanks for joining, <%= firstName%> <%= lastName%></h1>
        <p>To enter another email address, click on the Back <br>
            button in your browser or the Return button shown <br>
            below.</p>
    </body>
</html>
