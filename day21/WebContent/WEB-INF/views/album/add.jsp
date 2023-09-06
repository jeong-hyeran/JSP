<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../home.jsp" %>
<div>

	<form method="POST" enctype="multipart/form-data">
	<table border="1" cellspacing="0" cellpadding="10">
		<tr>
			<td>가수</td>
			<td><input type="hidden" name="artist_id" value="${dto2.id }">${dto2.name }</td>
		</tr>
		<tr>
			<td>앨범명</td>
			<td><input type="text" name="name" placeholder="앨범명" autofocus></td>
		</tr>
		<tr>
			<td>장르</td>
			<td><input type="text" name="type" placeholder="장르"></td>
		</tr>
		<tr>
			<td>발매일</td>
			<td><input type="date" name="rdate" placeholder="발매일"></td>
		</tr>
		<tr>
			<td>재생시간</td>
			<td><input type="text" name="playtime" placeholder="재생시간"></td>
		</tr>
		<tr>
			<td>커버이미지</td>
			<td><input type="file" name="coverimg"></td>
		</tr>

	</table>
	<p><input type="submit" value="추가완료"></p>
	</form>

</div>
</body>
</html>