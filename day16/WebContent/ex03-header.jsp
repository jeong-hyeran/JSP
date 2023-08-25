<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ex03.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<c:set var="fileUtil" value="${FileUtil.getInstance() }"/>
<c:set var="dao" value="${Ex03DAO.getInstance() }" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03-header.jsp</title>
<style>
	a{
		text-decoration: none;
		color: inherit;
	}
	a:hover{
	 	text-decoration: underline;
	}
	h1{
		text-align: center;
	}
	nav > ul{
		display: flex;
		justify-content: space-around;
		list-style: none;
		padding-left: 0;
		width: 500px;
		margin: auto;
		border-bottom: 1px solid grey;
	}
	nav > ul >li{
		padding: 10px;
	}
	header + div {
		width: 800px;
		margin: auto;
	}
	header + div > form {
		width: fit-content;
		margin: 50px auto;
	}
	table{
		margin: 10px auto;
		border: 1px solid black;
		border-collapse: collapse;
		padding: 10px;
	}
	th, td{
		padding: 10px;
		border: 1px solid black;
	}
</style>
</head>
<body>

<header>
	<h1><a href="${cpath }/ex03.jsp">파일 업로드 (DB)</a></h1>
	<nav>
		<ul>
			<li><a href="${cpath }/ex03-list.jsp">목록</a></li>
			<li><a href="${cpath }/ex03-add.jsp">추가</a></li>
		</ul>
	</nav>
</header>

</body>
</html>