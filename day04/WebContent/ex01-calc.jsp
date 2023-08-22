<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>ex01_answer.jsp</title>
<style>
	form{
		margin:30px auto;
		border: 2px solid black;
		width:302px;
		padding :20px;
		background-color: #fefefe;
		border-radius: 10px;
		box-shadow: 5px 5px 5px grey;
	}
	h3.exp{
		width:279px;
		border : 1px solid black;
		height: 30px;
		padding: 10px;
		text-align: right;
		background-color: white;
		font-size: 1.5em;
 		overflow: hidden;
	}
	div.flex{
		display: flex;
		flex-flow: wrap;
		width: 310px;
	}
	input[type="submit"]{
		width: 70px;
		height: 60px;
		margin: 3px;
		font-size: 1.5em;
	}
</style>
</head>
<body>
<%!
	// 페이지가 새로고침되어도 유지되어야 하는 데이터
	// 지금까지 입력했던 수식(exp)
	String exp = "";
%>
<%
	// 여기서 화면에 나타낼 데이터를 준비합니다.
	String btn = request.getParameter("btn");
	
	System.out.println("btn : " + btn);
	
	if("CE".equals(btn)){ // 상수가 앞으로 오면 null이 안뜨는데 변수 값이 들어오면 null이 뜰수있다.
// 		btn= "";
		exp= "";
	}
	else if("=".equals(btn)){
		if(exp.contains(" ")){
			String[] arr = exp.split(" "); //split으로 자른것을 배열로 담는다.
			int n1 = Integer.parseInt(arr[0]); // 첫번째로 들어온 문자를 숫자로 변환
			String oper = arr[1];	//2번째로 들어온 문자를 OPER에 담는다.
			int n2 = Integer.parseInt(arr[2]); //  3번째로 들어온 문자를 숫자로 변환
			switch(oper){ // oper이 
			case "+": exp = String.valueOf(n1 + n2); break; //+일때
			case "-": exp = String.valueOf(n1 - n2); break;
			case "*": exp = String.valueOf(n1 * n2); break;
			case "/": exp = String.valueOf(n1 / (double)n2); break;
			}
		}
	}
	else {
		if((exp.endsWith(" ") && btn.startsWith(" ")) == false){ 
			// exp가 공백으로 시작하지 않고, 끝나지 않으면 (연산자가 들어있으면 공백이 앞뒤로 있으니 if문이 실행되지 않는다.연산자가 두개 연속으로 들어오는 것을 방지)
		exp += btn != null ? btn : "";	
			// exp에 null값이 아니면 btn을 null이면 빈문자열을 담아준다.(exp에 값이 없을때 null말고 공백을 표시해준다.)
		}
	}
%>
	<form method="POST">
	<h3 class="exp"><%=exp %></h3> 
		<div class="flex">
			<input type="submit" name="btn" value="7">
			<input type="submit" name="btn" value="8">
			<input type="submit" name="btn" value="9">
			<input type="submit" name="btn" value=" / ">
			<input type="submit" name="btn" value="4">
			<input type="submit" name="btn" value="5">
			<input type="submit" name="btn" value="6">
			<input type="submit" name="btn" value=" * ">
			<input type="submit" name="btn" value="1">
			<input type="submit" name="btn" value="2">
			<input type="submit" name="btn" value="3">
			<input type="submit" name="btn" value=" - ">
			<input type="submit" name="btn" value="0">
			<input type="submit" name="btn" value="CE">
			<input type="submit" name="btn" value=" + ">
			<input type="submit" name="btn" value="=">
		</div>
	</form>

</body>
</html>