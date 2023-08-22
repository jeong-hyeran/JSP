<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex06-logout.jsp</title>
</head>
<body>

<h1>ex06-logout.jsp</h1>
<hr>

<% session.invalidate(); %>

<c:redirect url="ex06-login.jsp" />


</body>
</html>