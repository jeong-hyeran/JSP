<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<c:set var="view" value="${boardDAO.selectOne(param.idx) }"/>

<div>
	
	<h3>view</h3>

	<a href="${cpath }/board/list.jsp"><button>목록</button></a>
	<a href="${cpath }/board/write.jsp"><button>새 글쓰기</button></a>
	<a href="${cpath }/board/modify.jsp?idx=${view.idx}"><button>수정</button></a>
	<a href="${cpath }/board/delete.jsp?idx=${view.idx}">
		<button id="deleteBtn">삭제</button>
	</a>
<script>
	const deleteBtn = document.getElementById('deleteBtn')
	deleteBtn.onclick = function(){
	const flag = confirm('정말 삭제하시겠습니까')
	if(flag){
		location.href = '${cpath}/board/delete.jsp?idx=${view.idx}'
	}
}
</script>

	
<table>
	<tr>
		<td>제목</td>
		<td colspan="3">${view.title }</td>
	</tr>
	<tr>
		<td>작성자</td>
		<td>${view.writer}</td>
		<td>날짜</td>
		<td>${view.wdate}</td>
	</tr>
	<tr>
		<td>내용</td>
		<td colspan="3">${view.content }</td>
	</tr>
</table>

</div>
</body>
</html>