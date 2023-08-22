<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz2.jsp</title>
</head>
<body>

<h1>quiz2.jsp</h1>
<hr>

<%-- 아래 form의 양식을 화면에 한줄씩 출력하도록 코드를 작성하세요 --%>
<%if(request.getMethod().equals("GET")){%>
<form method="POST">
	<p><input type="text" name="id" placeholder="ID" required autofocus></p>
	<p><input type="password" name="pw" placeholder="password" required></p>
	<p><input type="text" name="name" placeholder="NAME" required></p>
	<p><input type="date" name="birth" required></p>
<p>
	<label><input type="radio" name="gender" value="남성" required>남성</label>
	<label><input type="radio" name="gender" value="여성" required>여성</label>
</p>
<p>
	<select name="age" required>
		<option value=""> === 연령대를 선택하세요 === </option>
		<option value="10대">10대</option>
		<option value="20대">20대</option>
		<option value="30대">30대</option>
		<option value="40대">40대</option>	
		
	</select>
</p>
<p><input type="submit" value="가입신청"></p>
</form>


<% }if(request.getMethod().equals("POST")){
		request.setCharacterEncoding("UTF-8");
		String date = "";
		String birth = request.getParameter("birth");
		date = birth.replaceFirst("-", "년 ");
		date = date.replace("-", "월 ");
		date += "일 ";
%> 

	<h3>ID : <%=request.getParameter("id") %></h3>
	<h3>PW : <%=request.getParameter("pw") %></h3>
	<h3>name : <%=request.getParameter("name") %></h3>
	<h3>birth : <%=date %></h3>
	<h3>gender : <%=request.getParameter("gender") %></h3>
	<h3>age : <%=request.getParameter("age") %></h3>
 <%} %> 

</body>
</html>