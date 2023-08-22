<%@page import="quiz1.DataList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>
</title>
</head>
<body>
<h1>quiz1.jsp</h1>
<hr>

<%--
	dateList 객체를 생성해두고
	파라미터를 입력받아서
	문자열의 내용을 출력하는 코드를 작성하세요
	request.getMethod()를 활용하여
	GET/POST일 경우를 현재 페이지에 모두 작성하세요
 --%>
<%-- input의 radio는 name의 이름이 같으면 중복으로 선택 불가
			checkbox는 name가 같아도 중복으로 선택 가능 --%>
<%!

	DataList d = new DataList();
%>
 <% if(request.getMethod().equals("GET")) {%>
 <form method="POST">
 	<select name="index" required>
 		<option value="">=== 번호를 선택하세요 ===</option>
 		<option value="1">1</option>
 		<option value="2">2</option>
 		<option value="3">3</option>
 		<option value="4">4</option>
		<option value="5">5</option>
 	</select>
 	<input type="submit">
 </form>
 <% } %>
 
 <% if(request.getMethod().equals("POST")) {
	String data= "";
	String name = "";
	String age= "";
	String gender = "";
	
	

	String index = request.getParameter("index");
	if(index != null){
		int i = Integer.parseInt(index);
		data = d.get(i-1);
		name = data.split(",")[0];
		age = data.split(",")[1];
		gender = data.split(",")[2];%>
				
		<h3>이름 : <%=name %></h3>
		<h3>나이 : <%=age %></h3>
		<h3>성별 : <%=gender %></h3>
		<a href="quiz1.jsp"><button>다시 처음으로</button></a>
	<%}
	
 } %>
</body>
</html>