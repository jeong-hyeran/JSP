<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>ex02-action.jsp</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
	
	<%--비어있는 Member 객체를 생성하고, ob에 저장한다. --%>
	<jsp:useBean id="ob" class="day05.Member" scope="request"/>
											<%-- scope는 어디에 저장할지 지정한다 --%>
	<%--넘어오는 모든 파라미터를 필드 이름에 맞게 ob로 저장한다. --%>
	<jsp:setProperty name="ob" property="*"/>

	<%--ex02.result.jsp로 포워드한다. --%>
	<jsp:forward page="ex02-result.jsp" />
	<%--자바의 코드를 jsp action코드로 간결하게 할 수 있다. --%>
	
	
	
	
</body>
</html>