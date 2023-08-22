<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03.jsp</title>
</head>
<body>

<h1>ex03.jsp - 동시에 여러 값을 선택하여 제출하기</h1>
<hr>
<%-- input의 radio는 name의 이름이 같으면 중복으로 선택 불가
			checkbox는 name가 같아도 중복으로 선택 가능 
			중복 값은 배열을 이용해서 출력해야한다.--%>
<form method="POST">
	<h4>선호 직군을 선택하세요</h4>
	<P><label><input type="checkbox" name="job" value="back-end">back-end</label></P>
	<P><label><input type="checkbox" name="job" value="front-end">front-end</label></P>
	<P><label><input type="checkbox" name="job" value="DB">DB</label></P>
	<P><label><input type="checkbox" name="job" value="mobile">mobile</label></P>
	<P><label><input type="checkbox" name="job" value="system">system</label></P>
	<p><input type="submit" value="확인"></p>
</form>

<%
	String job = request.getParameter("job");
	String[] arr = request.getParameterValues("job");
	
	out.print("<h4>arr : ");
	for (int i = 0; arr != null && i < arr.length; i++){
		out.print(arr[i]);
		out.print(i == arr.length -1 ? "</h4>" : ", ");
	}
%>

<h4>job : <%=job %></h4>

</body>
</html>