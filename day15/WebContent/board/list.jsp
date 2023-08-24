<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<c:set var="dto" value="${boardDAO.selectList() }" />
<div id="boardlist">
	<c:if test="${not empty login }">
		<a href="${cpath }/board/write.jsp"><button>새 글쓰기</button></a>
	</c:if>

	
	<table>
		<thead>
			  <tr>
			    <th>번호</th>
			    <th>제목</th>
			    <th>작성자</th>
			    <th>내용</th>
			    <th>날짜</th>
			  </tr>
		</thead>
		<tbody>
			<c:forEach var="list" items="${dto }">
				  <tr class="boardtable">
				    <td>${list.idx }</td>
				    <td class="boardtitle"><a href="${cpath }/board/view.jsp?idx=${list.idx}">${list.title }</a></td>
				    <td>${list.writer }</td>
				    <td>${list.content }</td>
				    <td>${list.wdate }</td>
				  </tr>
			</c:forEach>
		</tbody>	 
</table>

</div>

</body>
</html>