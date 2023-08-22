<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02.jsp</title>
</head>
<body>

<h1>ex02.jsp</h1>
<hr>

<jsp:useBean id="dao" class="ex02.TestDAO" />
<h3>version : ${dao.version }</h3>

<h3>dao.version => dao.getVersion</h3>

<h3>sysdate : ${dao.sysdate }</h3>
<h3>dao.sysdate => dao.getsysdate</h3>


</body>
</html>