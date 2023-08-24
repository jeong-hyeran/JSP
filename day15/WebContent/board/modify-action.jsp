<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>


<jsp:useBean id="dto" class="board.BoardDTO" />
<jsp:setProperty property="*" name="dto"/>
<c:set var="row" value="${boardDAO.update(dto) }"/>
<script>
	const row = '${row}'
	alert(row != 0 ?'수정성공' : '수정실패')
	location.href = '${cpath}/board/view.jsp?idx=${param.idx }'
</script>


</body>
</html>