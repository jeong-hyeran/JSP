<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex04-mypage.jsp</title>
</head>
<body>

<h1>ex04-mypage.jsp</h1>
<hr>
<c:if test="${empty login }">
<%-- 	<c:redirect url="/ex02-index.jsp" /> --%>
	<script>
		alert('로그인 이후 사용할 수 있습니다.')
		location.href =  'ex02-index.jsp'
	</script>
</c:if>
<h3>마이페이지</h3>
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
	    <td>${login.userId }</td>
	    <td>${login.userPw }</td>
	    <td>${login.userName }</td>
	    <td>${login.email }</td>
	    <td>${login.birth }</td>
	  </tr>
	</tbody>
</table>


<p>
	<a href="ex06-modify.jsp"><button>수정</button></a>
	<button id="withdraw">탈퇴</button>
</p>

<script>
	const withdraw = document.getElementById('withdraw')
	withdraw.onclick = function(){
		const flag = confirm('정말 탈퇴하시겠습니까')
		if(flag){
			location.href = 'ex05-withdraw.jsp'
			// 탈퇴를 진행한 이후 세션에 남아있는 로그인 정보를 제거하고 ex02-index.jsp로 이동하기
		}
	}
</script>



</body>
</html>