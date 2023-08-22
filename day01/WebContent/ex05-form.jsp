<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex05-form.jsp</title>

<!-- 입력받는 페이지에서는 java코드가 필요없다. -->
<style>
	input{
		font-size : 1.5em;
		padding : 10px;
		width : 70px;
	}
	
</style>
</head>
<body>

<h1>ex05-from.jsp</h1>
<hr>
<h3>form 태그의 action속성은 파라미터를 넘겨 받는 대상이다.</h3>
<form action ="ex05-result.jsp">
	<p>
		<input type="text" name="n1" placeholder="n1" autocomplete="off">
		+
		<input type="text" name="n2" placeholder="n2" autocomplete="off">
		<input type="submit" value="=">
	</p>
</form>

</body>
</html>