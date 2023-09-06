<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../home.jsp" %>
<h3>앨범 수정</h3>

<form method="POST" enctype="multipart/form-data">
	<h4>${dto.name } 커버 이미지 변경</h4>
	<p><input type="hidden" name="artist_id" value="${dto.artist_id }"></p>
	<p><input type="hidden" name="id" value="${dto.id }"></p>
	<p><input type="hidden" name="playtime" value="${dto.playtime }"></p>
	<p><input type="hidden" name="name" value="${dto.name }"></p>
	<p><input type="hidden" name="type" value="${dto.type }"></p>
	<p><input type="hidden" name="rdate"  value="${dto.rdate }"></p>
	<p>
		<img src="${cpath }/album_img/${dto.coverimg }" width="200"> <br><br>
		<input type="file" name="coverimg">
	</p>
	
	<p><input type="submit" value="수정완료">
</form>

</body>
</html>