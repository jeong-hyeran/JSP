<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="youtube.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day08-youtube</title>
<style>
	body{
		background-color: #f5f6f7;
		
	}
	header{
		border-bottom: 0.5px solid #dadada;
	}
	header, main {
		width: 900px;
		margin: 0 auto;
		background-color: white;
		padding: 10px;
		box-sizing:  border-box;
	}
	body, h1, h2, h4, h5, h6, div, span{
		margin: 0;
		padding: 0;
	}
	a {
		text-decoration: none;
		color: inherit;
	}
	a:hover{
		text-decoration: underline;
	}
	h1 {
		text-align: center;
	}
	nav > ul{
		list-style: none;
		padding-left: 0;
		display: flex;
		justify-content: space-around;
		font-size: 1.2em;
		font-weight: bold;
	}
	/*list.jsp에 적용할 스타일*/
	#root{
		width: 100%;
	}
	.wrap{
		display: flex;
		flex-flow: wrap; 
		width:820px;
		margin: auto;
	}
	.item{
	
		width: 250px;
		margin: 10px;
	}
	.thumbnail  img{
		border-radius:10px;
		width: 250px; 
	}
	.title{
		font-weight: bold;
	}
	.channel{
		font-size: 0.9em;
		color : grey;
	}
</style>
</head>
<body>

<details>
	<summary>SQL</summary>
	<fieldset>
	<pre> <%-- pre 입력한 형태 그대로 출력해줌 (들여쓰기같은 것들..!) --%>
		SELECT * FROM tab;

		DROP TABLE youtube purge;

		CREATE table youtube(
		    idx         NUMBER,
		    title       VARCHAR2(500),
		    channel     VARCHAR2(100),
		    viewCount   NUMBER,
		    thumbnail   VARCHAR2(500),
		    movieTag    VARCHAR2(1000)
		);
		
		set define off;
		
		INSERT into youtube values(
		    1,
		    '[자바의 정석 - 기초편] ch11-19~21 StackQueue활용',
		    '남궁성의 정석코딩',
		    12000,
		    'https://i.ytimg.com/vi/pTFXPY8tBC4/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLD3ld9WjIVHU-rlc3oHDYg0RirmAw',
		    '<iframe width="800" height="450" src="https://www.youtube.com/embed/pTFXPY8tBC4" title="[자바의 정석 - 기초편] ch11-19~21 StackQueue활용" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>'
		);
		
		INSERT into youtube values(
		    2,
		    '3화#하이라이트# 거짓말이 들리는 건 축복일까, 저주일까? 라이어 헌터 김소현의 삶ㅠㅠ #소용없어거짓말 EP.3',
		    'tvN drama',
		    140000,
		    'https://i.ytimg.com/vi/XrnwBS1CqPY/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLC-bGc6JNZKEZG5EgkspL-D46os5g',
		    '<iframe width="800" height="450" src="https://www.youtube.com/embed/XrnwBS1CqPY" title="3화#하이라이트# 거짓말이 들리는 건 축복일까, 저주일까? 라이어 헌터 김소현의 삶ㅠㅠ #소용없어거짓말 EP.3" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>'
		);
		
		INSERT into youtube values(
		    3,
		    '일타 핫걸들의 만남 | 화사 Hey Mr. Big&엄정화X현아 콜라보 무대 #댄스가수유랑단 EP.11 | tvN 230803 방송',
		    'tvN',
		    570000,
		    'https://i.ytimg.com/vi/V7bfxP6dS9o/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLB3McWZ52P1oOLoFhBWKrwfMpanPw',
		    '<iframe width="800" height="450" src="https://www.youtube.com/embed/V7bfxP6dS9o" title="일타 핫걸들의 만남 | 화사 Hey Mr. Big&amp;엄정화X현아 콜라보 무대 #댄스가수유랑단 EP.11 | tvN 230803 방송" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>'
		);
		
		select * from youtube order by idx;
		
		COMMIT;
	</pre>
	</fieldset>
</details>
<header>
	<h1><a href="${cpath }">day08 - youtube</a></h1>
	<nav>
		<ul>
			<li><a href="${cpath }/list.jsp">목록</a></li>
			<li><a href="${cpath }/add.jsp">추가</a></li>
		</ul>
	</nav>
</header>


<!-- end of header.jsp --><%--HTML주석은 소스코드에 안뜬다. --%>
<%-- -- include를 이용해서 header.jsp와 index.jsp가 한 페이지 처럼 구현되게 만듦--%>