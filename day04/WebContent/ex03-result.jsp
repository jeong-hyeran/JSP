<%@page import="ex03.MovieDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03-result.jsp</title><%--데이터 출력 --%>
</head>
<body>

<h1>ex03-result.jsp</h1>
<hr>

<h3>검색결과</h3>

<%
	MovieDTO data = (MovieDTO)session.getAttribute("data");
	// action에서 입력한 data의 값을 가져온다.
 	if(data != null){ // data의 값이 있으면
%>
		<h4>제목 : <%=data.getTitle()%></h4> <%-- data의 title값을 가져온다. --%>
		<h4>개봉 일자 : <%=data.getDate()%></h4><%--data의 date값을 가져온다. --%> 
		<h4>누적 관객 수 : <%=data.getViewCount()%></h4><%--data의 viewCount값을 가져온다. --%>
<%	} //end of if
	else{ // data의 값이 없으면  
	%> 
	<h4>검색결과가 없습니다.</h4> <%--"검색결과가 없습니다.를 출력한다. --%>
<%	} //end of else %>
<p><a href="ex03-form.jsp"><button>다시 검색</button></a>


</body>
</html>