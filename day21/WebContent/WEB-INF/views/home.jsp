<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>home.jsp</title>
<style>
table{
	border : 1px solid black;
	border-collapse: collapse;
	padding: 10px;
}
th,td{
	padding: 10px;
	border : 1px solid black;
}
.lyricstite{
	width: 350px;
}
.lyrics{
	width: 350px;
	overflow: auto;
	height: 300px;
}
#album{
	max-height: 700px;
	overflow: auto;

}
ul{
	display: flex;
	margin: 10px;
	padding: 10px;
}
li{
	list-style: none;
	margin : 0 10px;
}
img{
  	border : 1px solid grey;
	box-shadow: 2px 2px 2px black;
}
</style>
</head>
<body>

<h1><a href="${cpath }/">home</a></h1>

<hr>
