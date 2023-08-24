<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div>
<h3>delete</h3>
<c:if test="${empty login }">
	<script>
		alert('로그인이 필요합니다.')
		location.href = '${cpath}/member/login.jsp'
	</script>
</c:if>

<c:if test="${not empty login }">
	<c:set var="row" value="${boardDAO.delete(param.idx) }"/>
</c:if>
</div>

<script>
	const row = '${row}'
	alert(row != 0 ?'삭제성공' : '삭제실패')
	location.href = '${cpath}/board/list.jsp'
</script>

</body>
</html>