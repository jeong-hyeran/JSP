<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz2.jsp</title>
</head>
<body>

<h1>quiz.jsp</h1>
<hr>

<ul>
	<li>날짜를 입력받아서,yyyy년 MM월 dd일 형식의 문자열로 바꿔서 출력하세요</li>
</ul>
<form>
	<p><input type="date" name="birth"></p>
	<p><input type="submit"></p>
</form>

<%
	String date = request.getParameter("birth");
// 	out.print("생일 : " + date);
	
	if(date!=null){
// 	String[] arr = date.split("-");

// 	out.print(arr[0] +"년 " + arr[1] + "월 " + arr[2] + "일");
	

	String yyyy = date.substring(0, 4);
	String mm = date.substring(5,7);
	String dd = date.substring(8);
	
	String result= yyyy+ "년 " + mm + "월 " + dd + "일 ";
	
	out.print(result);
	}

%>

</body>
</html>