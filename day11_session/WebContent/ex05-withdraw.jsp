<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.*"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex05-withdraw.jsp</title>
</head>
<body>

<c:if test="${empty login }">
	<script>
 		alret('로그인 이후 사용할 수 있습니다.') 
  		location.href =  'ex02-index.jsp'	 
 	</script> 
</c:if>

<%-- 회원 탈퇴 == DB의 회원정보 삭제 => delete --%>
<c:set var="dao" value="${MemberDAO.getInstance() }" />
<%-- 로그인 상태에서는 세션에 login객체가 있고, login객체의 userId를 참조 할 수 있다.--%>
<c:set var="row" value="${dao.delete(login.userId) }" />


<% session.invalidate(); %>
<!-- <script> -->
<%--  	const row = '${row}' --%>
<!--   	alert(row != 0 ? '탈퇴성공' : '탈퇴 실패') -->
<!--   	location.href = 'ex02-index.jsp' -->
<!-- </script>  -->

<%-- 작업이 끝나면, 로그아웃 처리 이후 대문 페이지로 이동한다--%>
<c:redirect url="ex02-index.jsp" />




</body>
</html>