<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex08.jsp</title>
</head>
<body>

<h1>ex08.jsp</h1>
<hr>

<form>
	<p><input type="text" name="name" placeholder="이름"></p>
	<p><input type="number" name="kor" placeholder="국어점수"></p>
	<p><input type="number" name="eng" placeholder="영어점수"></p>
	<p><input type="number" name="mat" placeholder="수학점수"></p>
	<p><input type="submit"></p>
	
</form>

<%
if(request.getQueryString() != null){ //쿼리스트링이 있으면
	// 입력값 받아오기
	String name = request.getParameter("name");
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int mat = Integer.parseInt(request.getParameter("mat"));
	
	// 합계, 평균, 결과 구하기
	int total = kor + eng + mat;
	double avg = total / 3.0;
	String result = avg >= 60 ?  "합격": "불합격";
	
	// 출력할 메시지 작성
	String form = "%s님의 평균은 %.2f점이고, 결과는 %s 입니다.";
	String message = String.format(form, name, avg, result);
	
	// 출력
	out.print("<h3>" + message + "</h3>");
}
%>

</body>
</html>