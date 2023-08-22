<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Scanner"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz1.jsp</title>
<style>
	table{
		border:2px solid black;
		border-collapse: collapse;
		margin : 20px auto;
	}
	th,	td{
		padding: 10px;
		border : 1px solid grey;
	}
	thead{
		background-color: #eee;
		}

</style>
</head>
<body>

<h1>quiz1.jsp</h1>
<hr>
<%@ page import="java.io.File" %>

<%
	String filePath = application.getRealPath("passwd.txt");
	out.print(filePath);
	File f = new File(filePath);
	Scanner sc = new Scanner(f);
	ArrayList<String> list = new ArrayList<>();
	
	while(sc.hasNextLine()){
		String line = sc.nextLine();
		list.add(line);
	}
	sc.close();
	
	pageContext.setAttribute("list", list);
// 	out.print(list);
%>
<%-- <jsp:useBean id="pass" class="passwd.txt" /> --%>
<c:set var="list" value="${list }"/>
<table>
	<thead>
		<tr>
			 <th>계정이름</th>
			 <th>비밀번호</th>
			 <th>UID</th>
			 <th>GID</th>
			 <th>comment</th>
			 <th>HomeDirectory</th>
			 <th>Shell</th>
		</tr>
	</thead>
	<tbody>
<%-- 	<c:forTokens var="data" items="${list }" delims=","> --%>
<!-- 		<tr> -->
<%-- 		<c:forTokens var="list" items="${data }" delims=":"> --%>
<%-- 			<td>${list }</td> --%>
<%-- 		</c:forTokens> --%>
<!-- 		</tr> -->
<%-- 	</c:forTokens> --%>

<c:forEach var="list" items="${list }">
		<tr>
<%-- 			<c:forEach var="line" items="${list.split(':') }"> --%>
<%-- 			<td>${line}</td> --%>
<%-- 			</c:forEach> --%>

		<c:forEach var="i" begin="0" end="6">
			<td>${list.split(':')[i] }</td>	
		</c:forEach>
		</tr>
</c:forEach>
	</tbody>
</table>

</body>
</html>