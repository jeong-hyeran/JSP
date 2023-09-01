<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<jsp:useBean id="user" class="member.MemberDTO"/>
<jsp:setProperty property="*" name="user"/>
<c:set var="row" value="${memberDAO.join(user) }" />


<script>
	const row ='${row }'
	if(row != 0){
		alert('${user.username}님 회원가입을 축하드립니다.')
		location.href='${cpath}'
	}else{
		alert('회원가입에 실패하였습니다')
		location.href='${cpath}/member/join.jsp'
	}
</script>


</body>
</html>