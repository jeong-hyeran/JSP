<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02-attribute.jsp</title>
<style>
	table{
		border: 2px solid black;
		border-collapse: collapse;
		margin-bottom: 20px; 
	}
	td, th{
		padding:10px;
		border: 1px solid grey;
	}
	thead{
		background-color: #dadada;
	}
</style>
</head>
<body>

<h1>ex02-attribute.jsp</h1>
<hr>


<h3>
	parameter가 사용자에게 입력받은 값이라면<br>
	attribute는 개발자가 만들어서 서버에 저장하는 값이다.<br>
	모든 타입의 객체를 저장할 수 있고,<br>
	어디에 저장하냐에 따라서 유효 범위가 달라질 수 있다.
</h3>

<table>
	<thead>
		<tr>
			<th>내장객체</th>
			<th>유효범위</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>pageContext</td>
			<td>현재 jsp 페이지에서 유효하다.</td>			
		</tr>
		<tr>
			<td>request</td>
			<td>
				현재 요청 내에서 유효하다.<br>
				forward를 하면 다음 페이지에서도 유효하다.
			</td>			
		</tr>
		<tr>
			<td>session</td>
			<td>현재 사용자의 접속이 유지되는 동안 유효하다.</td>			
		</tr>
		<tr>
			<td>application</td>
			<td>현재 서버가 종료되기 전까지 유효하다.</td>			
		</tr>
	</tbody>
</table>

<table>
	<thead>
		<tr>
			<th>함수</th>
			<th>내용</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>void 내장 객체.setAttribute(String name, Object o)</td>
			<td>지정한 내장객체에 name와 o를 연결하여 저장한다.</td>
		</tr>
		<tr>
			<td>Object 내장 객체.getAttribute(String name)</td>
			<td>지정한 name으로 객체 o를 반환받는다.</td>
		</tr>
		<tr>
			<td>void 내장 객체.removeAttribute(String name)</td>
			<td>지정한 name으로 저장된 객체를 제거한다.</td>
		</tr>
	</tbody>
</table>	

<%
	 // attribute 저장
	 pageContext.setAttribute("test1","이지은");	//이름과 값을 순서대로 지정한다.
	 request.setAttribute("test2", "홍진호");
	 session.setAttribute("test3", "나단비");
	 application.setAttribute("test4","Hello world java");
	 
	 // attribute 가져오기(가져온다고 내장객체가 사라지는 것은 아니다.)
	 String test1 = (String)pageContext.getAttribute("test1"); // 지정한 이름으로 불러온다.
	 String test2 = (String)request.getAttribute("test2"); 
	 String test3 = (String)session.getAttribute("test3"); 
	 String test4 = (String)application.getAttribute("test4"); 
	 
	// 저장한 내장객체에서 불러와야 한다. 다른 곳에서 참조를 시도하면 참조할 수 없다.	 
	 String test = (String)pageContext.getAttribute("test4"); //지정한 이름의 객체가 없은 null 

%>

<%--표현식 out.print() 를 이용하면 다운캐스팅 없이 문자열 형래로 출력된다.--%>
<h3>test1 : <%=pageContext.getAttribute("test1") %></h3>
<h3>test2 : <%=test2 %></h3>
<h3>test3 : <%=test3 %></h3>
<h3>test4 : <%=test4 %></h3>
<h3>test4.split(" ")[0] : <%=((String)application.getAttribute("test4")).split(" ")[0] %></h3> <%-- 배열이라 정확하게 출력이 안된다. --%>
<h3>test : <%=test %></h3> <%--application에 저장했는데 pageComtext에서 가져오려해서 null 뜬다. --%>

<fieldset>
	<p><a href="ex02-test1.jsp"><button>test1</button></a></p>
	
</fieldset>


</body>
</html>































