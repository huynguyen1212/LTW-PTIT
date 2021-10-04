<jsp:useBean id="user" scope="request" type="com.example.model.User"/>
<%@ page import="com.example.model.User" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Huy Trường
  Date: 6/9/2021
  Time: 9:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@include file="header.jsp" %>
<%
    // get parameters from the request
    List<String> musics = (List<String>) request.getAttribute("musics");
%>
<h1>Thanks for joining our email list</h1>
<p>Here is the information that you entered:</p>
<table cellspacing="5" cellpadding="5" border="1">
    <tr>
        <td align="right">First name:</td>
        <td>${user.firstName}</td>
    </tr>
    <tr>
        <td align="right">Last name:</td>
        <td>${user.lastName}</td>
    </tr>
    <tr>
        <td align="right">Email address:</td>
        <td>${user.emailAddress}></td>
    </tr>
</table>

<p>We‘ll use this email to notify you whenever we have new releases for these types of music:</p>
<%for (String music : musics) {%>
<p><%=music%>
</p>
<% } %>

<p>To enter another email address, click on the Back <br>
    button in your browser or the Return button shown <br>
    below. </p>
<form action="index.jsp" method="post">
    <input type="submit" value="Return">
</form>
<%@include file="footer.jsp" %>
</body>
</html>
