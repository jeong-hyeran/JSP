<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz3.jsp</title>
<style>
	h3{
	color : blue;
}
</style>
</head>
<body>

<h1>quiz3.jsp - 웹 페이지에서 구동되는 updown game</h1>
<hr>

<%! private Random ran = new Random();
	int n1 = ran.nextInt(100)+1;
	int i = 0;
%>

<form method="POST">
	<p><input type="number" name="answer" placeholder="1 ~ 100사이  숫자 입력" 
							<%--min="1" max="100"--%>
							autocomplete="off" autofocus required></p>
	<p><input type="submit" value="정답확인"></p>
</form>
<%
	if(request.getMethod().equals("POST")){
		String answer = request.getParameter("answer");
		if(answer != null){
			int result = Integer.parseInt(answer);
// 			out.print(i + "회 시도");
			i++;
			if(n1 < result){
				out.print("입력값 : " + result + " => ");
				out.print("down");
			}else if(n1 > result){
				
				out.print("입력값 : " + result + " => ");
				out.print("up");
			}else{
				out.print("<h3>정답입니다.🎉</h3>");
%>

			<h3><%=i %>번 만에 정답을 맞췄습니다.</h3>
			<h3>정답 : <%=n1 %></h3>
			<a href="quiz3.jsp"><button>처음으로</button></a>

<%		
			i = 0;
			n1 = ran.nextInt(100)+1;
			}
		}
	}
%>



</body>
</html>