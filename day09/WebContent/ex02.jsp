<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="day09.TestDAO"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02.jsp</title>
</head>
<body>

 <h1>ex02.jsp - DAO Test</h1>
 <hr>
 
 <c:set var="dao" value="${TestDAO.getInstance() }"></c:set>
 <c:set var="sysdate" value="${dao.getSysDate() }"></c:set>
 <h3>sysdate : ${sysdate}</h3>

</body>
</html>


