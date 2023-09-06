<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../home.jsp" %>
<div>

	<form method="POST" enctype="multipart/form-data">
	<table border="1" cellspacing="0" cellpadding="10">
		<tr>
			<td>가수</td>
			<td><input type="text" name="name" placeholder="가수이름" autofocus></td>
		</tr>
		<tr>
			<td>소속사</td>
			<td><input type="text" name="company" placeholder="소속사"></td>
		</tr>
		<tr>
			<td>국적</td>
			<td><input type="text" name="country" placeholder="국적"></td>
		</tr>
		<tr>
			<td>멤버</td>
			<td><input type="text" name="member" placeholder="멤버이름"></td>
		</tr>
		<tr>
			<td>데뷔일</td>
			<td><input type="date" name="debut" ></td>
		</tr>
		<tr>
			<td>타입</td>
			<td><input type="text" name="type" placeholder="타입"></td>
		</tr>
		<tr>
			<td>프로필</td>
			<td><input type="file" name="profileimg"></td>
		</tr>

	</table>
	<p><input type="submit" value="추가완료"></p>
	</form>

</div>
</body>
</html>