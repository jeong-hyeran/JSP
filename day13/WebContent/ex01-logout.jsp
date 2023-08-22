<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>ex01-logout.jsp</title>
</head>
<body>
<% 
	session.invalidate();
	response.sendRedirect("ex01-form.jsp");
%>
</body>
</html>