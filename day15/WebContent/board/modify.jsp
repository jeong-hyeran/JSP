<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<c:set var="view" value="${boardDAO.selectOne(param.idx) }"/>
<div>
<h3>수정페이지</h3>
<c:if test="${empty login }">
	<script>
		alert('로그인이 필요합니다.')
		location.href = '${cpath}/member/login.jsp'
	</script>
</c:if>

	<a href="${cpath }/board/list.jsp"><button>목록</button></a>
	
	<form action="modify-action.jsp" method="POST">
		<p><input type="hidden" name="idx" value="${view.idx }"></p>	
		<p><input type="hidden" name="writer" value="${view.writer }"></p>	
		<p><input type="text" name="title" value="${view.title }" autofocus></p>	
		<p><textarea name="content">${view.content }</textarea></p>	
		<p><input type="submit" value="작성완료"></p>
	 </form>

</div>
</body>
</html>