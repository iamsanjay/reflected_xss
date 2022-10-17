<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.stream.Collectors" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="style/main.css">
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<%
    String query = request.getParameter("query");
    List <String> contentList = Arrays.asList(
            "[OWASP Source] Cross-Site Scripting (XSS) attacks are a type of injection, in which malicious scripts are injected into otherwise benign and trusted websites. XSS attacks occur when an attacker uses a web application to send malicious code, generally in the form of a browser side script, to a different end user. Flaws that allow these attacks to succeed are quite widespread and occur anywhere a web application uses input from a user within the output it generates without validating or encoding it",
            "[Wikipedia Source] Cross-site scripting (XSS) is a type of security vulnerability that can be found in some web applications. XSS attacks enable attackers to inject client-side scripts into web pages viewed by other users. A cross-site scripting vulnerability may be used by attackers to bypass access controls such as the same-origin policy. Cross-site scripting carried out on websites accounted for roughly 84% of all security vulnerabilities documented by Symantec up until 2007.[1] XSS effects vary in range from petty nuisance to significant security risk, depending on the sensitivity of the data handled by the vulnerable site and the nature of any security mitigation implemented by the site's owner network."
    );
    List<String> filteredContentList;
    if(query == null || "".equals(query))
        filteredContentList = contentList;
    else{
        filteredContentList = contentList.stream().filter(content -> content.contains(query)).collect(Collectors.toList());
    }
%>
<div class="content">
    <h1>eooele Search site</h1>
    <form action="lab_1.jsp">
        <input type="text" name="query" placeholder="Enter Search query">
        <button type="submit">Submit</button>
    </form>
    <p>You searched for: <b><%=query%></b></p>
    <ul>
        <% for(String content: filteredContentList){%>
        <li><%=content%><br/></li>
        <%}%>
    </ul>
</div>

</body>
</html>