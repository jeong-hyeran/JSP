<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<div>


	<c:set var="fileUtil" value="${FileUtil.getInstance() }" />
	<c:set var="fileName" value="${fileUtil.getDTO(pageContext.request) }" />
	<c:set var="row" value="${boardDAO.insert(fileName) }" />
	${row }

	<script>
		const row = ${row };
		alert(row != 0 ?'작성 성공':'작성 실패')
		location.href = '${cpath}/board/list.jsp'
	</script>
	
	
</div>
</body>
</html>