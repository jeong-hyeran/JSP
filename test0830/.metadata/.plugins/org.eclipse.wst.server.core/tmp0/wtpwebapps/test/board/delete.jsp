<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<c:set var="row" value="${boardDAO.delete(param.idx) }" />

<script>
	const row = '${row}'
	alert(row != 0 ?'삭제 성공' : '삭제 실패')
	location.href='${cpath}/board/list.jsp'
</script>
</body>
</html>