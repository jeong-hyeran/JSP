<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div>
<h3>write</h3>

	<c:if test="${empty login }">
		<script>
			alert('로그인이 필요합니다.')
			location.href = '${cpath}/member/login.jsp'
		</script>
	</c:if>

	 <a href="${cpath }/board/list.jsp"><button>목록</button></a>
	<form action="write-action.jsp" method="POST">
		<p><input type="hidden" name="writer" value="${login.userid }"></p>	
		<p><input type="text" name="title" placeholder="제목을 입력하세요" autofocus></p>	
		<p><textarea name="content" placeholder="내용을 입력하세요"></textarea></p>	
		<p><input type="submit" value="작성 완료"></p>
	 </form>
</div>

</body>
</html>