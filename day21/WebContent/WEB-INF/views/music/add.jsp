<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../home.jsp" %>
<h3>음악추가</h3>

<form method="POST">
	<p><input type="hidden" name="artist_id" value="${dto.artist_id }"></p>
	<p><input type="hidden" name="album_id" value="${dto.id }"></p>
	<p><input type="text" name="name" placeholder="노래제목" autofocus></p>
	<p><input type="text" name="genre" placeholder="장르"></p>
	<p><input type="text" name="playtime" placeholder="재생시간"></p>
	<p><textarea name="lyrics" placeholder="가사"></textarea></p>
	<p><input type="submit" value="음악추가">
</form>

</body>
</html>