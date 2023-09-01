<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div>
	
	<form action="${cpath }/board/write-action.jsp" method="POST" enctype="multipart/form-data">
		<p><input type="hidden" name="writer" value="${login.userid }"></p>
		<p><input type="text" name="title" placeholder="제목을 작성하세요"></p>
		<p><textarea name="content" placeholder="내용을 작성하세요" ></textarea></p>
		<p><input type="file" name="image" accept="image/*"></p>
		<p><input type="submit" value="작성완료"></p>
	</form>

</div>


</body>
</html>