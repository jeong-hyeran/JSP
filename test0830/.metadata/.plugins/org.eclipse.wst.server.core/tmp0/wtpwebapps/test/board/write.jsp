<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<div id="write">
	<c:if test="${empty login }">
		<c:redirect url="/"/>
	</c:if>
	<form action="write-action.jsp" method="POST" enctype="multipart/form-data">
		<input  type="hidden" name="writer" value="${login.userid }">
		<p><input type="text" name="title" placeholder="제목을 입력하세요"></p>
		<p><textarea name="content" placeholder="내용을 작성하세요"></textarea></p>
		<p><input type="file" name="image" accept="image/*"></p>
		<p><input type="submit" value="작성완료"></p>
	</form>
</div>
</body>
</html>