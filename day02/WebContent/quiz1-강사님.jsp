<%@page import="quiz1.DataList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz1.jsp-강사님</title>
</head>
<body>
<h1>quiz1.jsp-강사님</h1>
<hr>

<%--
	dateList 객체를 생성해두고
	파라미터를 입력받아서
	문자열의 내용을 출력하는 코드를 작성하세요
	request.getMethod()를 활용하여
	GET/POST일 경우를 현재 페이지에 모두 작성하세요
 --%>
<%--  <%! String data,name,age,gender = ""; %> --%>
<%!

	DataList data = new DataList();
%>
 <% 
 
 	switch(request.getMethod()){
 	case"GET":
 	%>
 	<form method="POST">
	 	<h3>원하는 데이터의 순번을 선택하세요</h3>
	 	<P>
	 		<label><input type="radio" name="index" value="0">0번</label><br>
	 		<label><input type="radio" name="index" value="0">1번</label><br>
	 		<label><input type="radio" name="index" value="2">2번</label><br>
	 		<label><input type="radio" name="index" value="3">3번</label><br>
	 		<label><input type="radio" name="index" value="4">4번</label><br>
	 	</P>
	 	<p><input type="submit"></p>
	 

 	</form>
 	<%
 	break;
 	case"POST":
 			int index = Integer.parseInt(request.getParameter("index"));
 			String result = data.get(index);
 	%>
 	<h3> 이름 : <%=result.split(",")[0] %></h3>
 	<h3> 나일 : <%=result.split(",")[1] %></h3>
 	<h3> 성별 : <%=result.split(",")[2] %></h3>
 	<a href="quiz1-강사님.jsp"><button>이전으로</button></a>
 
 <%
 	break;
 }%>
</body>
</html>