<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex07-forEach.jsp</title>
<style>
	table{
		border:2px solid black;
		border-collapse: collapse;
	}
	th,	td{
		padding: 10px;
		border : 1px solid grey;
	}
	thead{
		background-color: #eee;
		}
		
	tr.red{
		background-color: lightpink;
	}
	tr.blue{
		background-color: lightpink;
	}
</style>

</head>
<body>

<h1>ex07-forEach.jsp</h1>
<hr>


<jsp:useBean id="repo" class="ex07.Repository" />
<c:set var="list" value="${repo.list }"/>
<h3>${list }</h3>
<table>
	<thead>
		<tr>
			<th>index</th>
			<th>name</th>
			<th>age</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="data" items="${repo.list }" varStatus="st">
											<%--반복 상태를 확인하기 위한 객체 --%>
			<tr class="${st.index % 2 == 0 ? 'red' : 'blue' }">								
				<td>${st.index }</td> <%--count:1번 부터 시작.first, last 각각 처음과 끝에만 true가 뜬다. --%>
				<td>${data.name }</td>
				<td>${data.age }</td>
			<tr>
		</c:forEach>
	
	</tbody>
</table>

</body>
</html>