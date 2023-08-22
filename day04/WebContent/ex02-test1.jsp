<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02-test1.jsp</title>
</head>
<body>

<h1>ex02-test1.jsp</h1>
<hr>

<h3>test1 : <%=pageContext.getAttribute("test1") %></h3>
<h3>test2 : <%=request.getAttribute("test2") %></h3>
<h3>test3 : <%=session.getAttribute("test3") %></h3> <%--실행 했던 인터넷 브라우져를 끄지 않는 이상 유지 된다. 클라이언트만 유지하고 싶을때 사용한다. --%>
<h3>test4 : <%=application.getAttribute("test4") %></h3> <%--서버자체를 재시작하지 않으면 계속 유지 된다. --%>

<p><a href="ex02-attribute.jsp"><button>원래 페이지로</button></a>

</body>
</html>