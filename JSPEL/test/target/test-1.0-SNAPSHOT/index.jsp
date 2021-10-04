<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<%@include file="header.jsp"%>
<%
//    String email = (String) session.getAttribute("email");
    Cookie[] cookies = request.getCookies();
    String email = "";
    String emailCookie = "email";
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals(emailCookie)) {
                email = cookie.getValue();
                break;
            }
        }
    }
    if (email == null || email == "")
        email = "Not loged";
%>
<h1>Join our email list</h1>
<p>Your email addrress : <%=email%></p>
<p>To join our email list, enter your name and
    email address below. <br>
    Then, click on the Submit button.</p>
<form action="displayMusicChoices" method="get">
    <table cellspacing="5" border="0">
        <tr>
            <td align="right">First name:</td>
            <td><input type="text" name="firstName"></td>
        </tr>
        <tr>
            <td align="right">Last name:</td>
            <td><input type="text" name="lastName"></td>
        </tr>
        <tr>
            <td align="right">Email address:</td>
            <td><input type="text" name="emailAddress"></td>
        </tr>
        <tr>
            <td align="right">“I’m interested in these types of music”</td>
            <td><select name="musics" multiple>
                <option value="Rock">
                    Rock
                </option>
                <option value="Country">
                    Country
                </option>
                <option value="Bluegrass">
                    Bluegrass
                </option>
                <option value="Folk">
                    Folk
                </option>
            </select></td>
        </tr>
        <tr>
            <td></td>
            <td><br>
                <input type="submit" value="Submit"></td>
        </tr>
    </table>
</form>
<%@include file="footer.jsp" %>
</body>
</html>