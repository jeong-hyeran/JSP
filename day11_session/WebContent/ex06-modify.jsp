<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex06-modify.jsp</title>
</head>
<body>
<h3>정보수정</h3>
<c:if test="${empty login }">
	<script>
 		alret('로그인 이후 사용할 수 있습니다.') 
  		location.href =  'ex02-index.jsp'	 
 	</script> 
</c:if>
<form action="ex06-action.jsp" method="POST">
	<table border="1" cellpadding="10" cellspacing="0">
		<thead>
		  <tr>
		    <th>아이디</th>
		    <th>패스워드</th>
		    <th>이름</th>
		    <th>이메일</th>
		    <th>생년월일</th>
		  </tr>
		</thead>
		<tbody>
		  <tr>
		    <td>
		    	${login.userId }
	<%-- 	    	<input type="text" name="userId" value="${login.userId }" readonly> --%>
		    	<input type="hidden" name="userId" value="${login.userId }" >
		    	<%-- 사용자가 직접 입력하지는 않지만, 파라미터로 전달하고 싶을 때  type="hidden"을 사용한다 --%>
		    </td>
		    <td>${login.userPw }</td>
		    <td><input type="text" name="userName" value="${login.userName }" ></td>
		    <td><input type="text" name="email" value="${login.email }" ></td>
		    <td><input type="date"  name="birth" value="${login.birth }"></td>
		  </tr>
		</tbody>
	</table>
	<p>
		<input type="submit" value="수정하기">
		<a href="ex04-mypage.jsp"><input type="button" value="돌아가기"></a>
		<%--<button>과 input 타입 버튼의 차이 --%>
	</p>
	</form>
	
</body>
</html>




















