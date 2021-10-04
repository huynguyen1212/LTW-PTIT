<jsp:useBean id="user" scope="request" type="com.example.model.User"/>
<%--@elvariable id="message" type=""--%>
<%--
  Created by IntelliJ IDEA.
  User: Huy Trường
  Date: 6/9/2021
  Time: 7:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Join our email list</h1>
<p>To join our email list, enter your name and
    email address below. <br>
    Then, click on the Submit button.</p>
<p style="color: red; font-size: 25px"><i>${message}
</i></p>
<form action="displayMusicChoices" method="post">
    <table cellspacing="5" border="0">
        <tr>
            <td align="right">First name:</td>
            <td><input type="text" name="firstName"
                       value="${user.firstName}"></td>
        </tr>
        <tr>
            <td align="right">Last name:</td>
            <td><input type="text" name="lastName"
                       value="${user.lastName}"></td>
        </tr>
        <tr>
            <td align="right">Email address:</td>
            <td><input type="text" name="emailAddress"
                       value="${user.emailAddress}"></td>
        </tr>
        <tr>
            <td></td>
            <td><br><input type="submit" value="Submit"></td>
        </tr>
    </table>
</form>
</body>
</html>
