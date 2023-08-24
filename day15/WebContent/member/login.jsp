<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div>
	<form action="login-action.jsp" method="POST">
		<p><input type="text" name="userid" value="${cookie.userid.value }" placeholder="ID" autocomplete="off" autofocus required></p>
		<p><input type="password" name="userpw" placeholder="Password" required></p>
		<p>
			<label>
				<input type="checkbox" name="storeID" 	
				${not empty cookie.userid ?'checked' : '' }>
				ID 저장
			</label>
			<label>
				<input type="checkbox" name="autologin">
				자동로그인
			</label>
		</p>
		<p><input type="submit" value="로그인"></p>
	</form>
	<a href="${cpath }/member/join.jsp"><button>회원가입</button></a>
</div>






</body>
</html>