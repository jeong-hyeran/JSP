<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<div>
<%-- ${boardDAO } --%>
<c:set var="list" value="${boardDAO.selectAll() }" />
<%-- ${list } --%>

<table border="1" cellspacing="0" cellpadding="10">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>내용</th>
				<th>파일경로</th>
				<th>이미지</th>
				<th>작성일자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${list }">
				<tr>
					<td>${item.idx }</td>		
					<td>${item.title }</td>		
					<td>${item.writer }</td>		
					<td>${item.content }</td>		
					<td>${item.uploadFile }</td>	
					<td>
						<img src="${cpath }/upload2/${item. uploadFile}" width="100">	
					</td>	
					<td>${item. wdate}</td>		
				</tr>
			</c:forEach>
		</tbody>
</table>


</div>

</body>
</html>