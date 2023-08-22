<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<c:set var="dao" value="${StudentDAO.getInstance()}" />
<c:set var="list" value="${dao.view(param.name)}" />
<main>
<table>
	<thead>
		<tr>
			<th>이름</th>
			<th>국어</th>
			<th>영어</th>
			<th>수학</th>
			<th>합계</th>
			<th>평균</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
	</thead>
	<tbody>
		<tr> 
			<td>${list.name }</td>
			<td>${list.kor}</td>
			<td>${list.eng }</td>
			<td>${list.math }</td>
			<td>${list.total }</td>
			<td>${list.avg }</td>
			<td><a href="${cpath }/modify.jsp?name=${list.name}"><button>수정</button></a></td>
			<td><a href="${cpath }/delete-action.jsp?name=${list.name}"><button>삭제</button></a></td>
		</tr>
	</tbody>	
	</table>
</main>
</body>
</html>