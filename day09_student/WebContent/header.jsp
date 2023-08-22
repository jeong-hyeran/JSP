<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="student.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<c:set var="dao" value="${StudentDAO.getInstance() }" />
<jsp:useBean id="dto" class="student.StudentDTO" />
<jsp:setProperty property="*" name="dto"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>student.jsp</title>
<style>
	body{
		background-color: #f5f6f7;
		
	}
	header{
		border-bottom: 0.5px solid #dadada;
	}
	header, main {
		width: 900px;
		margin: 0 auto;
		background-color: white;
		padding: 10px;
		box-sizing:  border-box;
	}
	main{
		padding: 10px 50px;
	}
	h1{
		text-align: center;
	}
	h3{
		text-align: center;
	}
	a {
		text-decoration: none;
		color: inherit;
	}
	a:hover{
		text-decoration: underline;
	}	
	nav > ul{
		list-style: none;
		padding-left: 0;
		display: flex;
		justify-content: space-around;
		font-size: 1.2em;
		font-weight: bold;
	}
	table{
		margin:auto;
		border:2px solid black;
		border-collapse: collapse;
	}
	th,	td{
		padding: 10px;
		border : 1px solid grey;
		min-width: 80px;
		text-align: center;
	}

	thead{
		background-color: #eee;
		}
	ul{
		display: flex;
		justify-content: space-around;
	}
	li{
		list-style: none;
		font-size: 1.8em;
	}
	#input{
		margin: auto;
	}
	#etc{
		display: flex; 
		width: 150px;
	}
	#etc > a{
		margin:0 10px;
	}
	#search > li{
		font-size: 1em;
	}
</style>
</head>
<body>
<h1><a href="${cpath }">학생 성적관리</a></h1>
<hr>
<header>
<div>
<%-- 	<a href="${cpath }">student</a> --%>
	<ul>
		<li><a href="${cpath }/list.jsp">목록</a></li>
		<li><a href="${cpath }/add.jsp">추가</a></li>
		<li><a href="${cpath }/search.jsp">조회</a></li>
	</ul>

</div>
</header>

</body>
</html>