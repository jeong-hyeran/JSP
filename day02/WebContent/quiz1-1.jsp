<%@page import="quiz1.DataList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내꺼</title>
</head>
<body>
<%--
	dateList 객체를 생성해두고
	파라미터를 입력받아서
	문자열의 내용을 출력하는 코드를 작성하세요
	request.getMethod()를 활용하여
	GET/POST일 경우를 현재 페이지에 모두 작성하세요
 --%>
 
 <% if(request.getMethod().equals("GET")){ %>
 <form method="POST">
<!--  	<select name="index" required> -->
<!--  		<option value=""> === 선택 === </option> -->
<!--  		<option value="1">1</option> -->
<!--  		<option value="2">2</option> -->
<!--  		<option value="3">3</option> -->
<!--  		<option value="4">4</option> -->
<!--  		<option value="5">5</option> -->
<!--  	</select> -->
	<input type="radio">
	<input type="radio" value="1">
	<input type="radio">
	<input type="radio">
	<input type="radio">
	<input type="radio">
 	<input type="submit">
 </form>
<%} %>
<%if(request.getMethod().equals("POST")) {
	DataList d = new DataList();
	String index = request.getParameter("index");
	if(index != null){
	int i = Integer.parseInt(index);
	String data = d.get(i-1);
	String name = data.split(",")[0];
	String age = data.split(",")[1];
	String gender = data.split(",")[2];
	%>
	
<h3>이름 : <%=name %></h3>
<h3>나이 : <%=age %></h3>
<h3>성별 : <%=gender %></h3>
<a href="quiz1-1.jsp"><button>처음으로</button></a>
	
<%} 
}%>
</body>
</html>